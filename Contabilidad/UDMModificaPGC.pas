unit UDMModificaPGC;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, Graphics, FIBQuery, HYFIBQuery,
  FIBDataSetRW;

type
  TDMModificaPGC = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMEmpCanales: TFIBTableSet;
     QMEmpCanalesEMPRESA: TIntegerField;
     QMEmpCanalesEJERCICIO: TIntegerField;
     QMEmpCanalesCANAL: TIntegerField;
     QMEmpCanalesATO_APERTURA: TIntegerField;
     QMEmpCanalesATO_CIERRE: TIntegerField;
     QMEmpCanalesACTIVO: TIntegerField;
     QMEmpCanalesAPERTURA: TDateTimeField;
     QMEmpCanalesCIERRE: TDateTimeField;
     QMEmpCanalesLIMITE: TDateTimeField;
     QMEmpCanalesNIVELES: TIntegerField;
     QMEmpCanalesACTIVACION: TDateTimeField;
     QMEmpCanalesPAIS: TFIBStringField;
     QMEmpCanalesTIPO_IVA: TIntegerField;
     QMEmpCanalesMODO_IVA: TIntegerField;
     QMEmpCanalesMONEDA: TFIBStringField;
     QMEmpCanalesATO_REGULARIZACION: TIntegerField;
     QMEmpCanalesPERFIL: TFIBStringField;
     QMEmpCanalesLIQUIDAR_IVA_MODELO_300: TIntegerField;
     QMEmpCanalesCIERRE_PERIODO: TDateTimeField;
     QMEmpCanalesPGC: TIntegerField;
     DSQMEmpCanales: TDataSource;
     xCanales: TFIBDataSetRO;
     DSxCanales: TDataSource;
     xPaises: TFIBDataSetRO;
     DSxPaises: TDataSource;
     QMSysEmpresas: TFIBTableSet;
     QMSysEmpresasEMPRESA: TIntegerField;
     QMSysEmpresasTITULO: TFIBStringField;
     QMSysEmpresasTERCERO: TIntegerField;
     QMSysEmpresasFECHA_ALTA: TDateTimeField;
     QMSysEmpresasAPERTURA: TDateTimeField;
     QMSysEmpresasDURACION: TIntegerField;
     QMSysEmpresasMONEDA: TFIBStringField;
     QMSysEmpresasABIERTA: TIntegerField;
     QMSysEmpresasMODO_IVA: TIntegerField;
     QMSysEmpresasIMPRIME_CABECERA: TIntegerField;
     QMSysEmpresasCLIENTE_AUT: TIntegerField;
     QMSysEmpresasPMP_CERO: TIntegerField;
     QMSysEmpresasFECHA_CONTABILIZACION_COMPRAS: TIntegerField;
     QMSysEmpresasCIERRE_CONTABLE: TIntegerField;
     QMSysEmpresasFECHA_VENTAS: TIntegerField;
     QMSysEmpresasLISTAR_PEDIDOS: TIntegerField;
     QMSysEmpresasSERIE_AUTOFAC: TFIBStringField;
     QMSysEmpresasE_IMAGEN: TIntegerField;
     QMSysEmpresasCIERRA_DOC_CERO: TIntegerField;
     QMSysEmpresasREG_MERCANTIL: TBlobField;
     QMSysEmpresasE_MAIL: TFIBStringField;
     QMSysEmpresasSERIALIZADO_AUTO: TIntegerField;
     QMSysEmpresasMOV_STOCK_ANULA_VENTAS: TIntegerField;
     QMSysEmpresasMOV_STOCK_ANULA_COMPRAS: TIntegerField;
     QMSysEmpresasPORTES_VENTAS: TIntegerField;
     QMSysEmpresasPORTES_COMPRAS: TIntegerField;
     QMSysEmpresasSEPARAR_APUNTES_REMESAS: TIntegerField;
     QMSysEmpresasSEPARAR_PEDIDOS_RECEPCION: TIntegerField;
     QMSysEmpresasCONTROL_STOCK_NEG: TIntegerField;
     QMSysEmpresasCONTROL_ASIENTO_NEG: TIntegerField;
     DSQMSysEmpresas: TDataSource;
     xPGC: TFIBDataSetRO;
     xPGCTITULO: TFIBStringField;
     DSxPGC: TDataSource;
     xPGCN: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxPGCN: TDataSource;
     xPGCCuentasTipo5: TFIBDataSetRO;
     xPGCNCuentas: TFIBDataSetRW;
     xPGCNCuentasTipo5: TFIBDataSetRW;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMEmpCanalesAfterOpen(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMEmpCanalesBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     UltimoError: string;
     procedure ActualizaPGC(Pgc: integer);
     procedure DesactivaDisparos;
     procedure ActivaDisparos;
     procedure RecalculaSaldos;
     function DameTituLoPGC(Pgc: integer): string;
     function CreaCuenta(Cuenta, Titulo, Superior: string; Nivel, Tipo, Gestion, Tipo_Tercero, Reg_Cierre, Pgc: integer): boolean;
     function CreaCuentaYPadre(Cuenta, Titulo, Superior: string; Nivel, Tipo, Gestion, Tipo_Tercero, Reg_Cierre, Pgc: integer): boolean;
     function CreaCuentaEquivalencias(var Cuenta: string; Pgc, Pgcn: integer): boolean;
     procedure CreaFK;
  end;

var
  DMModificaPGC : TDMModificaPGC;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

function TDMModificaPGC.DameTituLoPGC(Pgc: integer): string;
begin
  with xPGCN do
  begin
     Close;
     Params.ByName['PGC'].AsInteger := Pgc;
     Open;
     Result := FieldByName('TITULO').AsString;
  end;
end;

procedure TDMModificaPGC.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  with QMSysEmpresas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  with QMEmpCanales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMModificaPGC.QMEmpCanalesAfterOpen(DataSet: TDataSet);
begin
  xCanales.Open;
  xPaises.Open;
  xPGC.Open;
end;

procedure TDMModificaPGC.DataModuleDestroy(Sender: TObject);
begin
  QMSysEmpresas.Close;
  QMEmpCanales.Close;
end;

procedure TDMModificaPGC.QMEmpCanalesBeforeClose(DataSet: TDataSet);
begin
  xCanales.Close;
  xPaises.Close;
  xPGC.Close;
end;

function TDMModificaPGC.CreaCuenta(Cuenta, Titulo, Superior: string; Nivel, Tipo, Gestion, Tipo_Tercero, Reg_Cierre, Pgc: integer): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     AutoTrans := True;
     SQL.Text := 'insert into con_cuentas(empresa,ejercicio,canal,cuenta,titulo,' +
        'superior,nivel,tipo,gestion,tipo_tercero,reg_cierre,pgc)' +
        'values(?empresa,?ejercicio,?canal,?cuenta,?titulo,?superior,?nivel,?tipo,' +
        '?gestion,?tipo_tercero,?reg_cierre,?pgc)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Params.ByName['TITULO'].AsString := Titulo;
     Params.ByName['SUPERIOR'].AsString := Superior;
     Params.ByName['NIVEL'].AsInteger := Nivel;
     Params.ByName['TIPO'].AsInteger := Tipo;
     Params.ByName['GESTION'].AsInteger := Gestion;
     Params.ByName['TIPO_TERCERO'].AsInteger := Tipo_Tercero;
     Params.ByName['REG_CIERRE'].AsInteger := Reg_Cierre;
     Params.ByName['PGC'].AsInteger := Pgc;
     Result := False;
     try
        ExecQuery;
        Result := True;
     except
        on e: Exception do
           UltimoError := e.Message;
     end;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMModificaPGC.ActualizaPGC(Pgc: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     SQL.Text := 'update emp_canales set pgc = ?pgc  where empresa = ' + REntorno.EmpresaStr +
        ' and ejercicio = ' + REntorno.EjercicioStr +
        ' and canal = ' + REntorno.CanalStr;
     Params.ByName['PGC'].AsInteger := Pgc;
     try
        ExecQuery;
     except
     end;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMModificaPGC.ActivaDisparos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     AutoTrans := True;
     SQL.Text := 'execute procedure ut_on_triggers';
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

function TDMModificaPGC.CreaCuentaEquivalencias(var Cuenta: string; Pgc, Pgcn: integer): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     AutoTrans := True;
     SQL.Text := 'execute procedure c_crea_cuentas_equivalencias (?EMPRESA,?EJERCICIO,' +
        '?CANAL,?CUENTA,?O_PGC,?D_PGC)';

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Params.ByName['O_PGC'].AsInteger := Pgc;
     Params.ByName['D_PGC'].AsInteger := Pgcn;
     Result := False;
     try
        ExecQuery;
        Result := True;
        Cuenta := FieldByName['D_CUENTA'].AsString;
     except
        on e: Exception do
        begin
           Cuenta := '';
           UltimoError := e.Message;
        end;
     end;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMModificaPGC.DesactivaDisparos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     AutoTrans := True;
     SQL.Text := 'execute procedure ut_off_triggers';
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMModificaPGC.RecalculaSaldos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     AutoTrans := True;
     SQL.Text := 'execute procedure c_cuentas_saldos_recalcula(?empresa, ?ejercicio, ?canal)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

function TDMModificaPGC.CreaCuentaYPadre(Cuenta, Titulo, Superior: string; Nivel, Tipo, Gestion, Tipo_Tercero, Reg_Cierre, Pgc: integer): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     AutoTrans := True;
     SQL.Text := 'execute procedure c_crea_cuenta_y_padre(?empresa,?ejercicio,?canal,?cuenta,?superior,?titulo,' +
        '?nivel,?tipo,?gestion,?tipo_tercero,?reg_cierre,?pgc)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Params.ByName['TITULO'].AsString := Titulo;
     Params.ByName['SUPERIOR'].AsString := Superior;
     Params.ByName['NIVEL'].AsInteger := Nivel;
     Params.ByName['TIPO'].AsInteger := Tipo;
     Params.ByName['GESTION'].AsInteger := Gestion;
     Params.ByName['TIPO_TERCERO'].AsInteger := Tipo_Tercero;
     Params.ByName['REG_CIERRE'].AsInteger := Reg_Cierre;
     Params.ByName['PGC'].AsInteger := Pgc;
     Result := False;
     try
        ExecQuery;
        Result := True;
     except
        on e: Exception do
           UltimoError := e.Message;
     end;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMModificaPGC.CreaFK;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     AutoTrans := True;
     SQL.Text := 'execute procedure ut_rellenar_tmp_fk_pgc';
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

end.
