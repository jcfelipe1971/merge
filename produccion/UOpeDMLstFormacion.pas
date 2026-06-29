unit UOpeDMLstFormacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados;

type
  TOpeDMLstFormacion = class(TDataModule)
     TLocal: THYTransaction;
     frFormacion: TfrHYReport;
     QMEmpleados: TFIBDataSetRO;
     DSEmpleados: TDataSource;
     frDBLstFormacion: TfrDBDataSet;
     xEmpleadoD: TFIBDataSetRO;
     xEmpleadoH: TFIBDataSetRO;
     DSxEmpleadoD: TDataSource;
     DSEmpleadoH: TDataSource;
     xEmpleadoDTITULO: TFIBStringField;
     xEmpleadoHTITULO: TFIBStringField;
     xDireccionEmp: TFIBDataSetRO;
     xDireccionEmpTERCERO: TIntegerField;
     xDireccionEmpNOMBRE_R_SOCIAL: TFIBStringField;
     xDireccionEmpNOMBRE_COMERCIAL: TFIBStringField;
     xDireccionEmpTIPO_RAZON: TFIBStringField;
     xDireccionEmpNIF: TFIBStringField;
     xDireccionEmpFECHA_ALTA: TDateTimeField;
     xDireccionEmpNOTAS: TBlobField;
     xDireccionEmpTELEFONO01: TFIBStringField;
     xDireccionEmpTELEFONO02: TFIBStringField;
     xDireccionEmpTELEFAX: TFIBStringField;
     xDireccionEmpEMAIL: TFIBStringField;
     xDireccionEmpWEB: TFIBStringField;
     xDireccionEmpIMAGEN: TIntegerField;
     xDireccionEmpTERCERO1: TIntegerField;
     xDireccionEmpDIRECCION: TIntegerField;
     xDireccionEmpDIR_TIPO: TFIBStringField;
     xDireccionEmpDIR_NOMBRE: TFIBStringField;
     xDireccionEmpDIR_NOMBRE_2: TFIBStringField;
     xDireccionEmpDIR_NUMERO: TFIBStringField;
     xDireccionEmpDIR_BLOQUE_ESCALERA: TFIBStringField;
     xDireccionEmpDIR_PISO: TFIBStringField;
     xDireccionEmpDIR_PUERTA: TFIBStringField;
     xDireccionEmpDIR_COMPLETA: TFIBStringField;
     xDireccionEmpDIR_LOCALIDAD: TFIBStringField;
     xDireccionEmpDIR_COMPLETA_N: TFIBStringField;
     xDireccionEmpDIR_CLASE: TIntegerField;
     xDireccionEmpDIR_TELEFONO01: TFIBStringField;
     xDireccionEmpDIR_TELEFONO02: TFIBStringField;
     xDireccionEmpDIR_TELEFAX: TFIBStringField;
     xDireccionEmpDIR_DEFECTO: TIntegerField;
     xDireccionEmpID_LOCAL: TIntegerField;
     xDireccionEmpLOCALIDAD: TFIBStringField;
     xDireccionEmpTITULO: TFIBStringField;
     xDireccionEmpCODIGO_POSTAL: TFIBStringField;
     xDireccionEmpPAIS: TFIBStringField;
     xDireccionEmpPROVINCIA: TFIBStringField;
     xDireccionEmpID_LOCAL1: TIntegerField;
     DSxDireccionEmp: TDataSource;
     xVerCursoEmpl: TFIBDataSetRO;
     xVerCursoEmplEMPRESA: TIntegerField;
     xVerCursoEmplEJERCICIO: TIntegerField;
     xVerCursoEmplID_CURSO: TIntegerField;
     xVerCursoEmplID_EMPLEADO: TIntegerField;
     xVerCursoEmplTITULO_EMPL: TFIBStringField;
     xVerCursoEmplDESC_CURSO: TFIBStringField;
     xVerCursoEmplRESULTADO: TIntegerField;
     xVerCursoEmplDESC_RESULTADO: TFIBStringField;
     xVerCursoEmplFECHA_INICIO: TDateTimeField;
     xVerCursoEmplFECHA_FIN: TDateTimeField;
     DSxVerCursoEmpl: TDataSource;
     QMEmpleadosEMPRESA: TIntegerField;
     QMEmpleadosEMPLEADO: TIntegerField;
     QMEmpleadosTERCERO: TIntegerField;
     QMEmpleadosCATEGORIA: TFIBStringField;
     QMEmpleadosCENTRO: TFIBStringField;
     QMEmpleadosDEPARTAMENTO: TFIBStringField;
     QMEmpleadosSECCION: TFIBStringField;
     QMEmpleadosCALENDARIO: TIntegerField;
     QMEmpleadosN_SEGURIDAD_SOCIAL: TFIBStringField;
     QMEmpleadosTIPO_CONTRATO: TFIBStringField;
     QMEmpleadosINI_CONTRATO: TDateTimeField;
     QMEmpleadosFIN_CONTRATO: TDateTimeField;
     QMEmpleadosFECHA_NACIMIENTO: TDateTimeField;
     QMEmpleadosESTADO_CIVIL: TFIBStringField;
     QMEmpleadosNOTAS: TBlobField;
     QMEmpleadosIMAGEN: TMemoField;
     QMEmpleadosCODIGO_TARJETA: TFIBStringField;
     QMEmpleadosUSUARIO: TIntegerField;
     QMEmpleadosRECURSO: TFIBStringField;
     QMEmpleadosHORARIO: TFIBStringField;
     QMEmpleadosIMPUTACION: TIntegerField;
     QMEmpleadosTIPOIMPUTACION: TIntegerField;
     QMEmpleadosID_IMAGEN: TIntegerField;
     QMEmpleadosTIPOTAREA: TFIBStringField;
     QMEmpleadosFORMACION_INI: TBlobField;
     QMEmpleadosEXPERIENCIA_PROF: TBlobField;
     QMEmpleadosID_EMPLEADO: TIntegerField;
     QMEmpleadosFORMACIONESPHAB: TBlobField;
     QMEmpleadosTERCERO1: TIntegerField;
     QMEmpleadosNOMBRE_R_SOCIAL: TFIBStringField;
     QMEmpleadosNOMBRE_COMERCIAL: TFIBStringField;
     QMEmpleadosTIPO_RAZON: TFIBStringField;
     QMEmpleadosNIF: TFIBStringField;
     QMEmpleadosFECHA_ALTA: TDateTimeField;
     QMEmpleadosNOTAS1: TBlobField;
     QMEmpleadosTELEFONO01: TFIBStringField;
     QMEmpleadosTELEFONO02: TFIBStringField;
     QMEmpleadosTELEFAX: TFIBStringField;
     QMEmpleadosEMAIL: TFIBStringField;
     QMEmpleadosWEB: TFIBStringField;
     QMEmpleadosIMAGEN1: TIntegerField;
     QMEmpleadosID_REGISTRO: TIntegerField;
     frCursos: TfrHYReport;
     frDBLstCursos: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frFormacionGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(modo, empleado_ini, empleado_fin: integer);
  end;

var
  OpeDMLstFormacion : TOpeDMLstFormacion;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest;

{$R *.dfm}

procedure TOpeDMLstFormacion.MostrarListado(modo, empleado_ini, empleado_fin: integer);
var
  str : string;
begin
  QMEmpleados.Close;
  QMEmpleados.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  QMEmpleados.Params.ByName['empleadod'].AsInteger := empleado_ini;
  QMEmpleados.Params.ByName['empleadoh'].AsInteger := empleado_fin;
  QMEmpleados.Open;

  xDireccionEmp.Close;
  xDireccionEmp.Open;

  xVerCursoEmpl.Close;
  xVerCursoEmpl.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xVerCursoEmpl.Open;

  DMListados.Imprimir(8033, modo, '', str, frFormacion, nil);
end;

procedure TOpeDMLstFormacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TOpeDMLstFormacion.frFormacionGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if (ParName = 'Tercero') then
     ParValue := xEmpleadoDTITULO.AsString;
end;

procedure TOpeDMLstFormacion.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

end.
