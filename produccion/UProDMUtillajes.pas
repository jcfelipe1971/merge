unit UProDMUtillajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, jpeg, GIFImage, Graphics;

type
  TProDMUtillajes = class(TDataModule)
     TLocal: THYTransaction;
     QMProSysUtillajes: TFIBTableSet;
     DSQMProSysUtillajes: TDataSource;
     QMProSysUtillajesEMPRESA: TIntegerField;
     QMProSysUtillajesCODIGO: TFIBStringField;
     QMProSysUtillajesDESCRIPCION: TFIBStringField;
     QMProSysUtillajesIMAGEN: TIntegerField;
     QMProSysUtillajesARTICULO: TFIBStringField;
     QUtilizacion: TFIBDataSetRO;
     DSUtilizacion: TDataSource;
     QUtilizacionEMPRESA: TIntegerField;
     QUtilizacionEJERCICIO: TIntegerField;
     QUtilizacionCANAL: TIntegerField;
     QUtilizacionSERIES: TFIBStringField;
     QUtilizacionRIG_OF: TIntegerField;
     QUtilizacionSUBORDEN: TIntegerField;
     QUtilizacionALMACEN_SAL: TFIBStringField;
     QUtilizacionALMACEN_LAN: TFIBStringField;
     QUtilizacionALMACEN_ENT: TFIBStringField;
     QUtilizacionFECHA_ORD: TDateTimeField;
     QUtilizacionCLIENTE: TIntegerField;
     QUtilizacionCOMPUESTO: TFIBStringField;
     QUtilizacionESCANDALLO: TIntegerField;
     QUtilizacionESTADO: TIntegerField;
     QUtilizacionPEDIDO: TIntegerField;
     QUtilizacionLINEA_PED: TIntegerField;
     QUtilizacionFECHA_PED: TDateTimeField;
     QUtilizacionUNI_PEDID: TFloatField;
     QUtilizacionUNI_MANUAL: TFloatField;
     QUtilizacionUNI_TOTAL: TFloatField;
     QUtilizacionPRIORIDAD: TIntegerField;
     QUtilizacionMERMA: TFloatField;
     QUtilizacionUNI_PRODUC: TFloatField;
     QUtilizacionUNI_PENDIENTES: TFloatField;
     QUtilizacionFECHA_ENTREGA: TDateTimeField;
     QUtilizacionFECHA_INI: TDateTimeField;
     QUtilizacionFECHA_FIN: TDateTimeField;
     QUtilizacionHORAS_TOTALES: TFloatField;
     QUtilizacionSITUACION: TIntegerField;
     QUtilizacionID_ORDEN: TIntegerField;
     QUtilizacionTIPO_LANZAMIENTO: TIntegerField;
     QUtilizacionID_ORDEN_MAT: TIntegerField;
     QUtilizacionTIPO_RESERVA: TIntegerField;
     QUtilizacionID_MOV_STOCK: TIntegerField;
     QUtilizacionISO_APROBADO: TIntegerField;
     QUtilizacionISO_VERIFICADO: TIntegerField;
     QUtilizacionISO_VALIDADO: TIntegerField;
     QUtilizacionCONT_SUBORDEN: TIntegerField;
     QUtilizacionREFERENCIA: TFIBStringField;
     QUtilizacionHORAS_OPERARIO: TFloatField;
     QUtilizacionHORAS_MAQUINA: TFloatField;
     QUtilizacionTAREA: TFIBStringField;
     QUtilizacionORDEN: TIntegerField;
     QUtilizacionTIPOTAREA: TFIBStringField;
     QUtilizacionCOMENTARIO: TMemoField;
     QUtilizacionRECURSO: TFIBStringField;
     QUtilizacionCANTIDAD: TFloatField;
     QUtilizacionARTICULO: TFIBStringField;
     QUtilizacionFECHA_FIN_TAREA: TDateTimeField;
     QUtilizacionIDENTIFICADOR: TIntegerField;
     QUtilizacionCANTIDAD_UTIL: TFloatField;
     QUtilizacionTIEMPO: TFloatField;
     QUtilizacionTIEMPO_UTIL: TFloatField;
     QUtilizacionUDS_FABRICADAS: TFloatField;
     QUtilizacionCANTIDAD_IMPUTADA: TFloatField;
     QUtilizacionTOTAL: TFloatField;
     QUtilizacionTOTAL_HORAS: TFloatField;
     QUtilizacionMAQUINA: TIntegerField;
     QUtilizacionTIEMPO_PRODUCCION: TFIBStringField;
     QUtilizacionFECHA_INICIO_TAREA: TDateTimeField;
     TUpdate: THYTransaction;
     QMIntervencion: TFIBTableSet;
     DSQMIntervencion: TDataSource;
     QMIntervencionID_INTERVENCION: TIntegerField;
     QMIntervencionEMPRESA: TIntegerField;
     QMIntervencionCODIGO: TFIBStringField;
     QMIntervencionCODMAQ: TIntegerField;
     QMIntervencionFECHA: TDateTimeField;
     QMIntervencionDESCRIPCION_AVERIA: TFIBStringField;
     QMIntervencionMATRICERO: TIntegerField;
     QMIntervencionINICIO_REPARACION: TDateTimeField;
     QMIntervencionFINAL_REPARACION: TDateTimeField;
     QMIntervencionDESCRIPCION_INTERVENCION: TFIBStringField;
     QMIntervencionFECHA_CALIDAD: TDateTimeField;
     QMIntervencionVERIFICADOR: TIntegerField;
     QMIntervencionCONFORMIDAD: TIntegerField;
     QMProSysUtillajesGOLPES_ACUMULADOS: TIntegerField;
     QMProSysUtillajesNOTAS: TMemoField;
     QMProSysUtillajesPROYECTO: TIntegerField;
     QMProSysUtillajesCLIENTE: TIntegerField;
     QMProSysUtillajesTITULO_ART: TFIBStringField;
     QMProSysUtillajesBAJA: TIntegerField;
     QMProSysUtillajesACTIVO: TIntegerField;
     QMProSysUtillajesNOMBRE_R_SOCIAL: TFIBStringField;
     QMProSysUtillajesNOMBRE_COMERCIAL: TFIBStringField;
     QMProSysUtillajesCOMPUESTO_ORDEN: TFIBStringField;
     QMProSysUtillajesFECHA_INI_ORDEN: TDateTimeField;
     QMProSysUtillajesFECHA_FIN_ORDEN: TDateTimeField;
     QMProSysUtillajesTITULO_PROYECTO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProSysUtillajesNewRecord(DataSet: TDataSet);
     procedure QMIntervencionNewRecord(DataSet: TDataSet);
     procedure QMIntervencionBeforePost(DataSet: TDataSet);
     procedure QMProSysUtillajesARTICULOChange(Sender: TField);
     procedure QMProSysUtillajesCLIENTEChange(Sender: TField);
     procedure QMProSysUtillajesPROYECTOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraUtillaje(Utillaje: string);
     procedure AbreUtilizacion;
     procedure CierraUtilizacion;
     procedure AbreIntervencion;
     procedure CierraIntervencion;
  end;

var
  ProDMUtillajes : TProDMUtillajes;

implementation

uses UDMMain, UFBusca, UUtiles, UEntorno, UDameDato, HYFIBQuery, DateUtils;

{$R *.dfm}

procedure TProDMUtillajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMProSysUtillajes, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(QUtilizacion, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(QMIntervencion, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');

  DMMain.FiltraTabla(QMProSysUtillajes, '10000', True);
end;

procedure TProDMUtillajes.BusquedaCompleja;
begin
  with QMProSysUtillajes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_SYS_UTILLAJES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' ORDER BY CODIGO');
  end;

  TFBusca.Create(Self).SeleccionaBusqueda(QMProSysUtillajes, '10000');
end;

procedure TProDMUtillajes.QMProSysUtillajesNewRecord(DataSet: TDataSet);
begin
  QMProSysUtillajesEMPRESA.AsInteger := REntorno.Empresa;
  QMProSysUtillajesPROYECTO.AsInteger := 0;
  QMProSysUtillajesACTIVO.AsInteger := 1;
  QMProSysUtillajesBAJA.AsInteger := 0;
end;

procedure TProDMUtillajes.FiltraUtillaje(Utillaje: string);
begin
  Utillaje := Trim(Copy(Utillaje, 1, 10));
  with QMProSysUtillajes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_SYS_UTILLAJES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add('   EMPRESA = ?EMPRESA ');
     if (Utillaje <> '') then
        SelectSQL.Add('   AND CODIGO = ''' + Utillaje + ''' ');
     SelectSQL.Add(' ORDER BY  CODIGO');
  end;

  DMMain.FiltraTabla(QMProSysUtillajes, '10000', True);
end;

procedure TProDMUtillajes.QMIntervencionNewRecord(DataSet: TDataSet);
begin
  DMMain.LogIni('DMPedidos.QMIntervencionNewRecord');
  if (QMProSysUtillajes.State in [dsInsert, dsEdit]) then
     QMProSysUtillajes.Post;

  QMIntervencionEMPRESA.AsString := QMProSysUtillajesEMPRESA.AsString;
  QMIntervencionCODIGO.AsString := QMProSysUtillajesCODIGO.AsString;
  QMIntervencionFECHA.AsDateTime := Today;

  DMMain.LogFin('');
end;

procedure TProDMUtillajes.AbreUtilizacion;
begin
  QUtilizacion.Open;
end;

procedure TProDMUtillajes.CierraUtilizacion;
begin
  QUtilizacion.Close;
end;

procedure TProDMUtillajes.AbreIntervencion;
begin
  QMIntervencion.Open;
end;

procedure TProDMUtillajes.CierraIntervencion;
begin
  QMIntervencion.Close;
end;

procedure TProDMUtillajes.QMIntervencionBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMIntervencion, 'ID_SYS_UTILLAJES_INTERV', 'ID_INTERVENCION');
end;

procedure TProDMUtillajes.QMProSysUtillajesARTICULOChange(Sender: TField);
begin
  QMProSysUtillajesTITULO_ART.AsString := DameTituloArticulo(QMProSysUtillajesARTICULO.AsString);
end;

procedure TProDMUtillajes.QMProSysUtillajesCLIENTEChange(Sender: TField);
begin
  QMProSysUtillajesNOMBRE_R_SOCIAL.AsString := DameTituloCliente(QMProSysUtillajesCLIENTE.AsInteger);
  QMProSysUtillajesNOMBRE_COMERCIAL.AsString := DameNombreComercialCliente(QMProSysUtillajesCLIENTE.AsInteger);
end;

procedure TProDMUtillajes.QMProSysUtillajesPROYECTOChange(Sender: TField);
begin
  QMProSysUtillajesTITULO_PROYECTO.AsString := DameTituloProyecto(QMProSysUtillajesPROYECTO.AsInteger);
end;

end.
