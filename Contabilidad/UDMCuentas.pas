unit UDMCuentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, Dialogs, DB, DBTables, FIBDataSet,
  FIBQuery, FIBDatabase, FIBTableDataSet, StdCtrls, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMCuentas = class(TDataModule)
     DSxCuentas: TDataSource;
     DSQMCuentas: TDataSource;
     QMCuentas: TFIBTableSet;
     DSxNiveles: TDataSource;
     DSxPropagaBajas: TDataSource;
     DSxPropagaAltas: TDataSource;
     TLocal: THYTransaction;
     DSxPropagaAltasUno: TDataSource;
     xCuentas: TFIBDataSetRO;
     xCuentasCUENTA: TFIBStringField;
     xCuentasTITULO: TFIBStringField;
     xNiveles: TFIBDataSetRO;
     xPropagaAltas: TFIBDataSetRO;
     xPropagaBajas: TFIBDataSetRO;
     xPropagaAltasUno: TFIBDataSetRO;
     QMCuentasEMPRESA: TIntegerField;
     QMCuentasEJERCICIO: TIntegerField;
     QMCuentasCANAL: TIntegerField;
     QMCuentasCUENTA: TFIBStringField;
     QMCuentasTITULO: TFIBStringField;
     QMCuentasSUPERIOR: TFIBStringField;
     QMCuentasNIVEL: TIntegerField;
     QMCuentasTIPO: TIntegerField;
     QMCuentasGESTION: TIntegerField;
     QMCuentasTIPO_TERCERO: TIntegerField;
     QMCuentasREG_CIERRE: TIntegerField;
     QMCuentasCENTRO_COSTE: TIntegerField;
     QMCuentasRESTRICCION: TIntegerField;
     xCC: TFIBDataSetRO;
     DSCC: TDataSource;
     xCCEMPRESA: TIntegerField;
     xCCEJERCICIO: TIntegerField;
     xCCCANAL: TIntegerField;
     xCCPLAN_CONTABLE: TFIBStringField;
     xCCCUENTA: TFIBStringField;
     xCCPLANTILLA: TIntegerField;
     xCCPL_TITULO: TFIBStringField;
     xCCLINEA: TIntegerField;
     xCCCENTRO_COSTE: TFIBStringField;
     xCCCC_TITULO: TFIBStringField;
     xCCPORCENTAJE: TFloatField;
     xCCID_P: TIntegerField;
     xCCID_PL: TIntegerField;
     xCCID_CC: TIntegerField;
     QMCuentasPGC: TIntegerField;
     TUpdate: THYTransaction;
     QMCuentasBLOQUEADA: TIntegerField;
     QMCuentasPRESUPUESTAR: TIntegerField;
     QMCuentasCUADRO_DE_MANDOS: TIntegerField;
     QMCuentasCONCEPTO_CUENTA: TFIBStringField;
     QMCuentasTIPO_CUENTA: TFIBStringField;
     procedure DMCuentasCreate(Sender: TObject);
     procedure QMCuentasBeforeOpen(DataSet: TDataSet);
     procedure QMCuentasAfterOpen(DataSet: TDataSet);
     procedure QMCuentasNewRecord(DataSet: TDataSet);
     procedure QMCuentasBeforePost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     SQLTitn: string;
     SQLCopn: string;
     SQLTitx: string;
     SQLCopx: string;
     nPosQ: integer;
     procedure AbreCuentas;
  public
     { Public declarations }
     Resta: smallint;
     procedure FijaNiveles(Digitos, Nivel: smallint);
     procedure AltaCuentas(Verifica: smallint);
     procedure BuscaCuenta(Cadena: string; Nivel: integer);
     procedure BajaCuentas;
     procedure BajaNiveles;
     function NivelesEditables: smallint;
     procedure PropagaCuentas;
     procedure PropagaTodo(Modo: smallint);
     procedure PropagaCancelacion;
     procedure GeneraCuentasGes;
     procedure BusquedaCompleja;
     procedure PropagaCuentasCanal(Canal: smallint);
     procedure TodoPropaga;
  end;

var
  DMCuentas : TDMCuentas;

implementation

uses UDMMain, UEntorno, UUtiles, UFMCuentas, uFBusca, Controls;

{$R *.DFM}

procedure TDMCuentas.DMCuentasCreate(Sender: TObject);
var
  Busca : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Busca := ' and ';
  SQLTitn := Busca + '(nivel=?nivel)and(titulo like ?Busca) order by titulo';
  SQLCopn := Busca + '(nivel=?nivel)and(cuenta like ?Busca) order by cuenta';
  SQLTitx := Busca + '(titulo like ?Busca) order by titulo';
  SQLCopx := Busca + '(cuenta like ?Busca) order by cuenta';
  nPosQ := QMCuentas.SelectSQL.Count;

  AbreCuentas;
end;

procedure TDMCuentas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMCuentas.AbreCuentas;
begin
  DMMain.FiltraTabla(QMCuentas, '111001');
end;

procedure TDMCuentas.FijaNiveles(Digitos, Nivel: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_NIVELES_AB(:EMPRESA, :EJERCICIO, :CANAL, :NIVEL, :DIGITOS)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NIVEL'].AsInteger := Nivel;
        Params.ByName['DIGITOS'].AsInteger := Digitos;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCuentas.BuscaCuenta(Cadena: string; nivel: integer);
begin
  with xCuentas do
  begin
     Close;
     Transaction.CommitRetaining;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NIVEL'].AsInteger := Nivel;
     Params.ByName['FILTRO'].AsString := Cadena;
     Open;
  end;
end;

procedure TDMCuentas.AltaCuentas(Verifica: smallint);
var
  Nivel, NivelesBase, Procesados : integer;
  Cadena, s : string[11];
begin
  Procesados := 0;
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_ALTA (:EMPRESA, :EJERCICIO, :CANAL)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           Procesados := FieldByName['PROCESADOS'].AsInteger;
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
           SQL.Text := 'SELECT MAX(NIVEL) FROM SYS_CUENTAS WHERE PGC = :PGC';
           Params.ByName['PGC'].AsInteger := REntorno.Pgc;
           ExecQuery;
           NivelesBase := FieldByName['MAX'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     s := '00000000000';
     for Nivel := NivelesBase + 1 to 15 do
     begin
        if (REntorno.DigitCont[Nivel] <> 0) then
        begin
           Cadena := Copy(s, 0, REntorno.DigitCont[Nivel]);
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_ALTA_2 (:EMPRESA, :EJERCICIO, :CANAL, :NIVEL, :CADENA, :ENTRADA)';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['NIVEL'].AsInteger := Nivel;
                 Params.ByName['CADENA'].AsString := Cadena;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 Procesados := Procesados + FieldByName['PROCESADOS'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  finally
     ShowMessage(Format(_('Registros procesados: %d'), [Procesados]));
  end;
end;

procedure TDMCuentas.BajaCuentas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_BAJA(:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.AjustaNivelesContables;
end;

procedure TDMCuentas.BajaNiveles;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_NIVELES_BAJA(:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.AjustaNivelesContables;
end;

function TDMCuentas.NivelesEditables: smallint;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_NIVELES_EDITABLE(:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['SEPUEDE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCuentas.PropagaCuentas;
begin
  with xPropagaAltas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  end;
end;

procedure TDMCuentas.PropagaTodo(Modo: smallint);
var
  Procesados : integer;
begin
  { TODO : Aparentemente este procedimiento no existe en la base de datos. Revisar. }
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CON_CUENTAS_ALTA_PROPAGA_NIV(:EMPRESA, :EJERCICIO, :MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MODO'].AsInteger := Modo;
        ExecQuery;
        Procesados := FieldByName['PROCESADOS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(Format(_('Registros procesados: %d'), [Procesados]));
end;

procedure TDMCuentas.PropagaCancelacion;
begin
  with xPropagaBajas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Open;
  end;
end;

procedure TDMCuentas.QMCuentasBeforeOpen(DataSet: TDataSet);
begin
  with QMCuentas do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NIVEL'].AsInteger := REntorno.NivelesCont;
  end;
end;

procedure TDMCuentas.QMCuentasAfterOpen(DataSet: TDataSet);
begin
  xNiveles.Open;
  xCC.Open;
end;

procedure TDMCuentas.QMCuentasNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('EJERCICIO').AsInteger := REntorno.Ejercicio;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('PGC').AsInteger := REntorno.Pgc;
     FieldByName('CENTRO_COSTE').AsInteger := 0;
  end;
end;

procedure TDMCuentas.QMCuentasBeforePost(DataSet: TDataSet);
var
  n, x, y, z : integer;
  c : string;
begin
  if (DataSet.State = dsInsert) then
  begin
     y := 0;
     x := FMCuentas.CBFiltra.ItemIndex;
     if (x < 5) then
        z := x
     else if (x <> REntorno.NivelesCont) then
        z := 0
     else
        z := 5;
     for n := 1 to x - 1 do
        y := y + REntorno.DigitCont[n];
     c := QMCuentasCUENTA.AsString;
     if (Length(c) <> REntorno.DigitAcumula[x]) then
        raise Exception.Create(_('Longitud de cuenta inadecuada'));
     with DataSet do
     begin
        FieldByName('NIVEL').AsInteger := x;
        FieldByName('SUPERIOR').AsString := Copy(c, 1, y);
        FieldByName('TIPO').AsInteger := z;
     end;

     // Avisamos si se crean cuentas de nivel 1 a 4
     if ((UpperCase(DataSet.Name) = 'QMCUENTAS') and (QMCuentasNIVEL.AsInteger <= 4)) then
        ShowMessage(_('Se ha introducido una cuenta nueva en el plan contable que puede necesitar incorporarse en Cuentas Anuales'));
  end;
end;

procedure TDMCuentas.GeneraCuentasGes;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_GEN_GES(:EMPRESA, :EJERCICIO, :CANAL, :MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MODO'].AsInteger := 0;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCuentas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCuentas, '111001');
end;

procedure TDMCuentas.PropagaCuentasCanal(Canal: smallint);
begin
  with xPropagaAltasUno do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['D_CANAL'].AsInteger := Canal;
  end;
end;

procedure TDMCuentas.TodoPropaga;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_PROPAGA_TODO(:EMPRESA, :EJERCICIO, :CANAL, 0)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        ShowMessage(Format(_('Procesados: %d'), [FieldByName['PROCESADOS'].AsInteger]));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
