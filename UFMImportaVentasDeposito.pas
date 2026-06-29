unit UFMImportaVentasDeposito;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ULFEdit, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ExtCtrls, ULFPanel, Mask,
  DBCtrls, ULFDBEdit, ComCtrls, ToolWin, ULFToolBar, Buttons, ULFLabel,
  rxToolEdit, ULFDateEdit, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel;

type
  TFMImportaVentasDeposito = class(TFPEditSinNavegador)
     TButtAceptar: TToolButton;
     TButtSep: TToolButton;
     LAlmacen: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     EAlmacenTit: TLFEdit;
     LSerie1: TLFLabel;
     ESerieTit1: TLFEdit;
     EFSerie1: TLFEditFind2000;
     LHastaVencimiento: TLFLabel;
     DEFechaH: TLFDateEdit;
     DEFechaD: TLFDateEdit;
     LDesdeVencimiento: TLFLabel;
     LCanal1: TLFLabel;
     EFCanal1: TLFEditFind2000;
     EFCanal2: TLFEditFind2000;
     LCanal2: TLFLabel;
     LSerie2: TLFLabel;
     EFSerie2: TLFEditFind2000;
     ESerieTit2: TLFEdit;
     procedure TButtAceptarClick(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure EFSerie1Change(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFSerie1Busqueda(Sender: TObject);
     procedure EFSerie2Change(Sender: TObject);
     procedure EFSerie2Busqueda(Sender: TObject);
  private
     { Private declarations }
     Id_E: integer;
  public
     { Public declarations }
     procedure Mostrar(AID_E: integer);
  end;

var
  FMImportaVentasDeposito : TFMImportaVentasDeposito;

implementation

{$R *.dfm}

uses UDMMain, HYFIBQuery, UEntorno, DateUtils, UDameDato;

procedure TFMImportaVentasDeposito.TButtAceptarClick(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_DEPOSITO_A_PEP(?EMPRESA, ?SERIE1, ?CANAL1, ?SERIE2, ?CANAL2, ?ALMACEN_DEPOSITO, ?FECHA_INI, ?FECHA_FIN, ?ID_E)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SERIE1'].AsString := EFSerie1.Text;
        Params.ByName['CANAL1'].AsInteger := StrToIntDef(EFCanal1.Text, 0);
        Params.ByName['SERIE2'].AsString := EFSerie2.Text;
        Params.ByName['CANAL2'].AsInteger := StrToIntDef(EFCanal2.Text, 0);
        Params.ByName['ALMACEN_DEPOSITO'].AsString := EFAlmacen.Text;
        Params.ByName['FECHA_INI'].AsDateTime := RecodeTime(DEFechaD.Date, 0, 0, 0, 0);
        Params.ByName['FECHA_FIN'].AsDateTime := RecodeTime(DEFechaH.Date, 23, 59, 59, 999);
        Params.ByName['ID_E'].AsInteger := Id_E;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Proceso finalizado.'));

  Close;
end;

procedure TFMImportaVentasDeposito.EFAlmacenChange(Sender: TObject);
begin
  EAlmacenTit.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMImportaVentasDeposito.EFSerie1Change(Sender: TObject);
begin
  ESerieTit1.Text := DameTituloSerie(EFSerie1.Text);
end;

procedure TFMImportaVentasDeposito.FormCreate(Sender: TObject);
begin
  EFSerie1.Text := REntorno.Serie;
  EFCanal1.Text := REntorno.CanalStr;

  // EFSerie2.Text := REntorno.Serie;
  // EFCanal2.Text := REntorno.CanalStr;

  EFSerie2.Text := 'B';
  EFCanal2.Text := '2';

  { Proponemos el primer almacen tipo D Depósito }
  { No es un almacen de deposito de cliente, es de proveedor
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) COALESCE(ALMACEN,''   '') AS ALMACEN FROM ART_ALMACENES WHERE EMPRESA = ?EMPRESA AND TIPO = ?TIPO ORDER BY ALMACEN';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TIPO'].AsString := 'D';
        ExecQuery;
        EFAlmacen.Text := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
  }
  EFAlmacen.Text := '003';

  // Proponemos el mes entero al mes anterior de la fecha actual
  DEFechaD.Date := IncMonth(EncodeDate(YearOf(Now), MonthOf(Now), 1), -1);
  DEFechaH.Date := EncodeDate(YearOf(DEFechaD.Date), MonthOf(DEFechaD.Date), DaysInMonth(DEFechaD.Date));
end;

procedure TFMImportaVentasDeposito.Mostrar(AID_E: integer);
begin
  Id_E := AId_E;
  Hide;
  ShowModal;
end;

procedure TFMImportaVentasDeposito.EFSerie1Busqueda(Sender: TObject);
begin
  EFSerie1.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
     ' AND EJERCICIO=' + REntorno.EjercicioStr +
     ' AND CANAL=' + EFCanal1.Text;
end;

procedure TFMImportaVentasDeposito.EFSerie2Change(Sender: TObject);
begin
  ESerieTit2.Text := DameTituloSerie(EFSerie2.Text);
end;

procedure TFMImportaVentasDeposito.EFSerie2Busqueda(Sender: TObject);
begin
  EFSerie2.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
     ' AND EJERCICIO=' + REntorno.EjercicioStr +
     ' AND CANAL=' + EFCanal2.Text;
end;

end.
