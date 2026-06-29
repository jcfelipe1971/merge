unit UFMPonderaEmpresa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, UControlEdit, ULFMemo, ULFPanel, ULFEditFind2000, ULFLabel, HYFIBQuery;

type
  TFMPonderaEmpresa = class(THYForm)
     PNLDatos: TLFPanel;
     LBLBaseDatos: TLFLabel;
     LBase: TLFLabel;
     LBLProcesando: TLFLabel;
     LArticulo: TLFLabel;
     LBLFaltan: TLFLabel;
     LFaltan: TLFLabel;
     PNLErrores: TLFPanel;
     MErrores: TLFMemo;
     PNLRangos: TLFPanel;
     GBEmpresas: TGroupBox;
     Label2: TLFLabel;
     Label4: TLFLabel;
     EDesdeEmpresa: TLFEditFind2000;
     EHastaEmpresa: TLFEditFind2000;
     GBCanales: TGroupBox;
     Label6: TLFLabel;
     Label7: TLFLabel;
     EDesdeCanal: TLFEditFind2000;
     EHastaCanal: TLFEditFind2000;
     GBArticulos: TGroupBox;
     Label8: TLFLabel;
     Label9: TLFLabel;
     EDesdeArticulo: TLFEditFind2000;
     EHastaArticulo: TLFEditFind2000;
     GBAlmacenes: TGroupBox;
     Label10: TLFLabel;
     Label11: TLFLabel;
     EDesdeAlmacen: TLFEditFind2000;
     EHastaAlmacen: TLFEditFind2000;
     PNLBotones: TLFPanel;
     BEmpezar: TButton;
     BInterrumpir: TButton;
     procedure BEmpezarClick(Sender: TObject);
     procedure EDesdeCanalEnter(Sender: TObject);
     procedure EHastaCanalEnter(Sender: TObject);
     procedure EDesdeArticuloEnter(Sender: TObject);
     procedure EHastaArticuloEnter(Sender: TObject);
     procedure EDesdeAlmacenEnter(Sender: TObject);
     procedure EHastaAlmacenEnter(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure BInterrumpirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Interrumpir: boolean;
  end;

var
  FMPonderaEmpresa : TFMPonderaEmpresa;

implementation

uses UDMMain, UDMPonderaEmpresa, UFormGest, UEntorno;

{$R *.DFM}

procedure TFMPonderaEmpresa.BEmpezarClick(Sender: TObject);
var
  CantidadInicial, Cantidad : integer;
  Inicio, TiempoRestante : TDateTime;
begin
  BInterrumpir.Enabled := True;
  BEmpezar.Enabled := False;
  GBEmpresas.Enabled := False;
  GBCanales.Enabled := False;
  GBArticulos.Enabled := False;
  GBAlmacenes.Enabled := False;

  Interrumpir := False;
  Cantidad := 0;
  CantidadInicial := 0;

  LFaltan.Caption := _('Sumando...');
  LFaltan.Refresh;

  with DMPonderaEmpresa do
  begin
     with QMain do
     begin
        Close;
        if not Transaction.InTransaction then
           Transaction.StartTransaction;
        Params.ByName['DESDE_EMPRESA'].AsString := EDesdeEmpresa.Text;
        Params.ByName['HASTA_EMPRESA'].AsString := EHastaEmpresa.Text;
        Params.ByName['DESDE_CANAL'].AsString := EDesdeCanal.Text;
        Params.ByName['HASTA_CANAL'].AsString := EHastaCanal.Text;
        Params.ByName['DESDE_ALMACEN'].AsString := EDesdeAlmacen.Text;
        Params.ByName['HASTA_ALMACEN'].AsString := EHastaAlmacen.Text;
        Params.ByName['DESDE_ARTICULO'].AsString := EDesdeArticulo.Text;
        Params.ByName['HASTA_ARTICULO'].AsString := EHastaArticulo.Text;
        Open;
        LFaltan.Caption := _('Contando...');
        Application.ProcessMessages;
        while not EOF do
        begin
           Inc(Cantidad);
           Inc(CantidadInicial);
           Next;
        end;
        LFaltan.Caption := IntToStr(Cantidad);
        Application.ProcessMessages;
        if QPondera.Transaction.InTransaction then
           QPondera.Transaction.Commit;
        QPondera.Close;
        QPondera.SQL.Clear;
        QPondera.SQL.Add('EXECUTE PROCEDURE A_ART_PONDERA_ARTICULO(?EMPRESA, ?CANAL, ?ALMACEN, ?ARTICULO, ?ID_A)');
        Close;
        Params.ByName['DESDE_ARTICULO'].AsString := EDesdeArticulo.Text;
        Params.ByName['HASTA_ARTICULO'].AsString := EHastaArticulo.Text;
        Params.ByName['DESDE_ALMACEN'].AsString := EDesdeAlmacen.Text;
        Params.ByName['HASTA_ALMACEN'].AsString := EHastaAlmacen.Text;
        Open;
        LArticulo.Caption := Format(_('Emp.: %d - Can.: %d - Alm.: %s - Art.: %s'), [FieldByName('EMPRESA').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('ALMACEN').AsString, FieldByName('ARTICULO').AsString]);
        Application.ProcessMessages;
     end;

     Inicio := Now;
     while ((not QMain.EOF) and (not Interrumpir)) do
     begin
        if (Cantidad mod 100 = 0) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_ARTICULOS_HIST_PRECIOS';
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_MOV_STOCKS';
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_STOCKS';
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        with QPondera do
        begin
           if not Transaction.InTransaction then
              Transaction.StartTransaction;

           Close;
           Params.ByName['EMPRESA'].AsInteger := QMain.FieldByName('EMPRESA').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMain.FieldByName('CANAL').AsInteger;
           Params.ByName['ALMACEN'].AsString := QMain.FieldByName('ALMACEN').AsString;
           Params.ByName['ARTICULO'].AsString := QMain.FieldByName('ARTICULO').AsString;
           Params.ByName['ID_A'].AsInteger := QMain.FieldByName('ID_A').AsInteger;
           try
              ExecQuery;
              Transaction.Commit;
           except
              Transaction.RollBack;
              MErrores.Lines.Add(Format(_('Error en Emp.: %d - Can.: %d - Alm.: %s - Art.: %s'), [QMain.FieldByName('EMPRESA').AsInteger, QMain.FieldByName('CANAL').AsInteger, QMain.FieldByName('ALMACEN').AsString, QMain.FieldByName('ARTICULO').AsString]));
           end;
        end;

        with QMain do
        begin
           Next;

           LArticulo.Caption := Format(_('Emp.: %d - Can.: %d - Alm.: %s - Art.: %s'), [FieldByName('EMPRESA').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('ALMACEN').AsString, FieldByName('ARTICULO').AsString]);
           Dec(Cantidad);
           TiempoRestante := ((Now - Inicio) / (CantidadInicial - Cantidad)) * Cantidad;
           LFaltan.Caption := IntToStr(Cantidad) + ' - ' + TimeToStr(TiempoRestante);

           Application.ProcessMessages;
        end;
     end;

     with QMain do
     begin
        Close;
        if Transaction.InTransaction then
           Transaction.Commit;
     end;
  end;

  if not Interrumpir then
     LArticulo.Caption := _('Terminado')
  else
     LArticulo.Caption := _('Interrumpido');

  LFaltan.Caption := '0';
  BInterrumpir.Enabled := False;
  BEmpezar.Enabled := True;
  GBEmpresas.Enabled := True;
  GBCanales.Enabled := True;
  GBArticulos.Enabled := True;
  GBAlmacenes.Enabled := True;
end;

procedure TFMPonderaEmpresa.EDesdeCanalEnter(Sender: TObject);
begin
  EDesdeCanal.CondicionBusqueda := ' EMPRESA >= ' + EDesdeEmpresa.Text + 'AND' +
     ' EMPRESA <= ' + EHastaEmpresa.Text +
     ' ORDER BY CANAL';
end;

procedure TFMPonderaEmpresa.EHastaCanalEnter(Sender: TObject);
begin
  EHastaCanal.CondicionBusqueda := ' EMPRESA >= ' + EDesdeEmpresa.Text + 'AND' +
     ' EMPRESA <= ' + EHastaEmpresa.Text +
     ' ORDER BY CANAL';
end;

procedure TFMPonderaEmpresa.EDesdeArticuloEnter(Sender: TObject);
begin
  EDesdeArticulo.CondicionBusqueda := ' EMPRESA >= ' + EDesdeEmpresa.Text + 'AND' +
     ' EMPRESA <= ' + EHastaEmpresa.Text +
     ' ORDER BY ARTICULO';
end;

procedure TFMPonderaEmpresa.EHastaArticuloEnter(Sender: TObject);
begin
  EHastaArticulo.CondicionBusqueda := ' EMPRESA >= ' + EDesdeEmpresa.Text + 'AND' +
     ' EMPRESA <= ' + EHastaEmpresa.Text +
     ' ORDER BY ARTICULO';
end;

procedure TFMPonderaEmpresa.EDesdeAlmacenEnter(Sender: TObject);
begin
  EDesdeAlmacen.CondicionBusqueda := ' EMPRESA >= ' + EDesdeEmpresa.Text + 'AND' +
     ' EMPRESA <= ' + EHastaEmpresa.Text +
     ' ORDER BY ALMACEN';
end;

procedure TFMPonderaEmpresa.EHastaAlmacenEnter(Sender: TObject);
begin
  EHastaAlmacen.CondicionBusqueda := ' EMPRESA >= ' + EDesdeEmpresa.Text + 'AND' +
     ' EMPRESA <= ' + EHastaEmpresa.Text +
     ' ORDER BY ALMACEN';
end;

procedure TFMPonderaEmpresa.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  Interrumpir := True;
end;

procedure TFMPonderaEmpresa.BInterrumpirClick(Sender: TObject);
begin
  Interrumpir := True;
end;

procedure TFMPonderaEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMPonderaEmpresa);
  Action := caFree;
end;

procedure TFMPonderaEmpresa.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMPonderaEmpresa, DMPonderaEmpresa);

  with DMPonderaEmpresa do
  begin
     TLocal.StartTransaction;
     LBase.Caption := DMMain.DataBase.DBName;
     EDesdeEmpresa.Text := REntorno.EmpresaStr;
     EHastaEmpresa.Text := REntorno.EmpresaStr;
     Application.ProcessMessages;
     QGeneral.Close;
     QGeneral.SQL.Text :=
        'SELECT MIN(CANAL) AS MINIMO, MAX(CANAL) AS MAXIMO FROM VER_CANALES_ACTIVOS ' +
        'WHERE EMPRESA >= ' + EDesdeEmpresa.Text +
        ' AND EMPRESA <= ' + EHastaEmpresa.Text +
        ' AND EJERCICIO = ' + REntorno.EjercicioStr;
     QGeneral.ExecQuery;
     EDesdeCanal.Text := QGeneral.FieldByName['MINIMO'].AsString;
     EHastaCanal.Text := QGeneral.FieldByName['MAXIMO'].AsString;
     Application.ProcessMessages;
     QGeneral.Close;
     QGeneral.SQL.Text :=
        'SELECT MIN(ARTICULO) AS MINIMO, MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS ' +
        'WHERE EMPRESA >= ' + EDesdeEmpresa.Text +
        ' AND EMPRESA <= ' + EHastaEmpresa.Text;
     QGeneral.ExecQuery;
     EDesdeArticulo.Text := QGeneral.FieldByName['MINIMO'].AsString;
     EHastaArticulo.Text := QGeneral.FieldByName['MAXIMO'].AsString;
     QGeneral.Close;
     Application.ProcessMessages;
     QGeneral.SQL.Text :=
        'SELECT MIN(ALMACEN) AS MINIMO, MAX(ALMACEN) AS MAXIMO FROM ART_ALMACENES ' +
        'WHERE EMPRESA >= ' + EDesdeEmpresa.Text +
        ' AND EMPRESA <= ' + EHastaEmpresa.Text;
     QGeneral.ExecQuery;
     EDesdeAlmacen.Text := QGeneral.FieldByName['MINIMO'].AsString;
     EHastaAlmacen.Text := QGeneral.FieldByName['MAXIMO'].AsString;
  end;
  BEmpezar.Enabled := True;
end;

end.
