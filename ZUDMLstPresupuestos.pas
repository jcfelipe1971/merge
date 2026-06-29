unit ZUDMLstPresupuestos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TZDMLstPresupuestos = class(TDataModule)
     TLocal: THYTransaction;
     frHYPresup: TfrHYReport;
     frDBDSPresup: TfrDBDataSet;
     DSxLstPresup: TDataSource;
     xListadoPresup: TFIBDataSetRO;
     xDescAgente: TFIBDataSetRO;
     DSxDescAgente: TDataSource;
     xDescSituacion: TFIBDataSetRO;
     DSxDescSit: TDataSource;
     xDescSituacionTIPO_AUX: TFIBStringField;
     xDescSituacionCODIGO: TFIBStringField;
     xDescSituacionDESCRIPCION: TFIBStringField;
     xTitCliente: TFIBDataSetRO;
     xTitClienteCLIENTE: TIntegerField;
     xTitClienteTERCERO: TIntegerField;
     xTitClienteTITULO: TFIBStringField;
     xTitClienteNOMBRE_COMERCIAL: TFIBStringField;
     xDescAgenteEMPRESA: TIntegerField;
     xDescAgenteAGENTE: TIntegerField;
     xDescAgenteTERCERO: TIntegerField;
     xDescAgenteTITULO: TFIBStringField;
     xDescAgenteCOMISION: TFloatField;
     xListadoPresupEMPRESA: TIntegerField;
     xListadoPresupN_PRESUPUETO: TIntegerField;
     xListadoPresupEJERCICIO: TIntegerField;
     xListadoPresupCANAL: TIntegerField;
     xListadoPresupFECHA_EMISION: TDateTimeField;
     xListadoPresupCLIENTE: TIntegerField;
     xListadoPresupDESCRIPCION: TFIBStringField;
     xListadoPresupANCHO: TFloatField;
     xListadoPresupAVANCE: TFloatField;
     xListadoPresupCOMENTARIOS: TFIBStringField;
     xListadoPresupESCALADO_CANT1: TFloatField;
     xListadoPresupESCALADO_CANT2: TFloatField;
     xListadoPresupESCALADO_CANT3: TFloatField;
     xListadoPresupESCALADO_CANT4: TFloatField;
     xListadoPresupESCALADO_COTIZ1: TFloatField;
     xListadoPresupESCALADO_COTIZ2: TFloatField;
     xListadoPresupESCALADO_COTIZ3: TFloatField;
     xListadoPresupESCALADO_COTIZ4: TFloatField;
     xListadoPresupGASTOS_INICIALES: TFloatField;
     xListadoPresupGASTOS_INICIALES_DESCR: TFIBStringField;
     xListadoPresupIMAGEN_ETIQUETA: TFIBStringField;
     xListadoPresupNOTAS: TBlobField;
     xListadoPresupTIPO_AUX_ADHESIVO: TFIBStringField;
     xListadoPresupCODIGO_ADHESIVO: TFIBStringField;
     xListadoPresupTIPO_AUX_MATERIAL: TFIBStringField;
     xListadoPresupCODIGO_MATERIAL: TFIBStringField;
     xListadoPresupTIPO_AUX_TINTA: TFIBStringField;
     xListadoPresupCODIGO_TINTA: TFIBStringField;
     xListadoPresupTIPO_AUX_PRESENTACION: TFIBStringField;
     xListadoPresupCODIGO_PRESENTACION: TFIBStringField;
     xListadoPresupTIPO_AUX_FORMA_ENVIO: TFIBStringField;
     xListadoPresupCODIGO_FORMA_ENVIO: TFIBStringField;
     xListadoPresupTIPO_AUX_SITUACION_PRES: TFIBStringField;
     xListadoPresupCODIGO_SITUACION_PRES: TFIBStringField;
     xListadoPresupAGENTES: TIntegerField;
     xListadoPresupCOMISION: TFloatField;
     xListadoPresupTERCERO: TIntegerField;
     xListadoPresupCONTACTO: TIntegerField;
     xListadoPresupWEB: TIntegerField;
     xListadoPresupTITULO_CLIENTE: TFIBStringField;
     xListadoPresupEMAIL_CLIENTE: TFIBStringField;
     xListadoPresupNOMBRE_CONTACTO: TFIBStringField;
     xListadoPresupAPELLIDOS_CONTACTO: TFIBStringField;
     xListadoPresupTIPO_COTIZACION: TIntegerField;
     xListadoPresupESCALADO_CANT5: TFloatField;
     xListadoPresupESCALADO_COTIZ5: TFloatField;
     xListadoPresupESCALADO_CANT6: TFloatField;
     xListadoPresupESCALADO_COTIZ6: TFloatField;
     xListadoPresupGASTOS_TROQUEL1: TFloatField;
     xListadoPresupGASTOS_TROQUEL1_DESCR: TFIBStringField;
     xListadoPresupGASTOS_TROQUEL2: TFloatField;
     xListadoPresupGASTOS_TROQUEL2_DESCR: TFIBStringField;
     xListadoPresupESTAMPACION: TIntegerField;
     xListadoPresupRELIEVE: TIntegerField;
     xListadoPresupREIMPRESION: TIntegerField;
     xListadoPresupBARNIZ: TIntegerField;
     xListadoPresupDIAMETRO_INT: TFloatField;
     xListadoPresupDIAMETRO_EXT: TFloatField;
     xListadoPresupETIQUETA_ROLLO: TFloatField;
     xListadoPresupETIQUETA_ANCHO: TFloatField;
     xListadoPresupPOSICION_SALIDA: TFIBStringField;
     xListadoPresupOBSERVACIONES_ETIQUETA: TFIBStringField;
     xListadoPresupWEB_CLIENTE: TFIBStringField;
     xListadoPresupTELEFONO_CLIENTE: TFIBStringField;
     xListadoPresupFAX_CLIENTE: TFIBStringField;
     xListadoPresupCIF_CLIENTE: TFIBStringField;
     xListadoPresupDIRECCION_CLIENTE: TFIBStringField;
     xListadoPresupCP_CLIENTE: TFIBStringField;
     xListadoPresupPOBLACION: TFIBStringField;
     xListadoPresupFORMA_PAGO: TFIBStringField;
     xListadoPresupENTIDAD: TFIBStringField;
     xListadoPresupSUCURSAL: TFIBStringField;
     xListadoPresupDC: TFIBStringField;
     xListadoPresupCC: TFIBStringField;
     xListadoPresupDESC_SITUACION: TFIBStringField;
     xListadoPresupDESC_AGENTE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xListadoPresupAfterOpen(DataSet: TDataSet);
     procedure xListadoPresupBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(FDesde, FHasta: TDateTime; Agente, Situacion: boolean; Opcion, AAgente: integer; ASituacion: string);
     procedure Disenyar;
     procedure DescAgente(Agente: string);
     procedure DescSituacion(Situacion: string);
  end;

var
  ZDMLstPresupuestos : TZDMLstPresupuestos;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TZDMLstPresupuestos.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  //  AbreData(TDMListados,DMListados);
end;

procedure TZDMLstPresupuestos.DataModuleDestroy(Sender: TObject);
begin
  //  CierraData(DMListados);
  //  Application.ProcessMessages;
end;

procedure TZDMLstPresupuestos.MostrarListado(FDesde, FHasta: TDateTime; Agente, Situacion: boolean; Opcion, AAgente: integer; ASituacion: string);
var
  str : string;
begin
  str := '';

  xListadoPresup.Close;
  xListadoPresup.SelectSQL.Clear;
  { xListadoPresup.SelectSQL.Text:='SELECT pr.n_presupueto, pr.fecha_emision, pr.descripcion as desc_etiq, pr.cliente,'+
          'pr.titulo_cliente, pr.agentes, pr.codigo_situacion_pres,aux.descripcion AS desc_situacion, age.titulo AS desc_agente'+
          ' FROM z_emp_presupuesto pr '+
          'LEFT JOIN ver_agentes age ON (pr.empresa=age.empresa AND pr.agentes=age.agente) '+
          'LEFT JOIN z_sys_tablas_auxiliares aux ON (pr.tipo_aux_situacion_pres=aux.tipo_aux AND pr.codigo_situacion_pres=aux.codigo) '+
          'WHERE pr.empresa=:empresa AND pr.fecha_emision>=:fdesde AND pr.fecha_emision<=:fhasta '; }

  xListadoPresup.SelectSQL.Text := 'SELECT pr.*,' +
     ' aux.descripcion AS desc_situacion, age.titulo AS desc_agente' +
     ' FROM z_emp_presupuesto pr ' +
     'LEFT JOIN ver_agentes age ON (pr.empresa=age.empresa AND pr.agentes=age.agente) ' +
     'LEFT JOIN z_sys_tablas_auxiliares aux ON (pr.tipo_aux_situacion_pres=aux.tipo_aux AND pr.codigo_situacion_pres=aux.codigo) ' +
     'WHERE pr.empresa=:empresa AND pr.fecha_emision>=:fdesde AND pr.fecha_emision<=:fhasta';
  if ((Agente = True) and (AAgente > 0)) then
  begin
     xListadoPresup.SelectSQL.Add('AND agentes=' + IntToStr(AAgente));
  end;

  if ((Situacion = True) and (ASituacion <> '')) then
     xListadoPresup.SelectSQL.Add(' AND tipo_aux_situacion_pres=''SPR'' AND ' +
        'codigo_situacion_pres=''' + ASituacion + '''');

  xListadoPresup.SelectSQL.Add(' ORDER BY pr.fecha_emision');
  with xListadoPresup do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FDESDE'].AsDateTime := FDesde;
     Params.ByName['FHASTA'].AsDateTime := FHasta;
     Open;
  end;

  with frHYPresup do
  begin
     LoadFromFIB(9002, str);
     PrepareReport;
     case opcion of
        0: ShowPreparedReport;
        1: PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
end;

procedure TZDMLstPresupuestos.DescAgente(Agente: string);
begin
  if Agente <> '' then
  begin
     with xDescAgente do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGENTE'].AsString := Agente;
        Open;
     end;
  end
  else
     xDescAgenteTITULO.AsString := '';
end;

procedure TZDMLstPresupuestos.DescSituacion(Situacion: string);
begin
  if Situacion <> '' then
  begin
     with xDescSituacion do
     begin
        Close;
        Params.ByName['TIPO_AUX'].AsString := 'SPR';
        Params.ByName['CODIGO'].AsString := Situacion;
        Open;
     end;
  end
  else
     xDescSituacionDESCRIPCION.AsString := '';
end;

procedure TZDMLstPresupuestos.Disenyar;
var
  str : string;
begin
  str := '';
  frHYPresup.LoadFromFIB(9903, str);
  frHYPresup.DesignReport;
end;

procedure TZDMLstPresupuestos.xListadoPresupAfterOpen(DataSet: TDataSet);
begin
  xTitCliente.Open;
end;

procedure TZDMLstPresupuestos.xListadoPresupBeforeClose(DataSet: TDataSet);
begin
  xTitCliente.Close;
end;

end.
