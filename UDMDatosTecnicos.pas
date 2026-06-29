unit UDMDatosTecnicos;

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMDatosTecnicos = class(TDataModule)
     QMDatosTecnicos: TFIBTableSet;
     DSQMDatosTecnicos: TDataSource;
     TLocal: THYTransaction;
     QMDatosTecnicosID: TIntegerField;
     QMDatosTecnicosEMPRESA: TIntegerField;
     QMDatosTecnicosID_ORDEN: TIntegerField;
     QMDatosTecnicosREFERENCIA: TFIBStringField;
     QMDatosTecnicosN_FABRICACION: TFIBStringField;
     QMDatosTecnicosFECHA: TDateTimeField;
     QMDatosTecnicosANO: TFIBStringField;
     QMDatosTecnicosCLIENTE: TFIBStringField;
     QMDatosTecnicosTIPO_FILTRO: TFIBStringField;
     QMDatosTecnicosNUM_FILTRO: TFIBStringField;
     QMDatosTecnicosPEDIDO: TFIBStringField;
     QMDatosTecnicosFECHA_PEDIDO: TDateTimeField;
     QMDatosTecnicosSU_OFERTA: TFIBStringField;
     QMDatosTecnicosFECHA_OFERTA: TDateTimeField;
     QMDatosTecnicosMARCA_MOTOR: TFIBStringField;
     QMDatosTecnicosPOTENCIA_KW: TFIBStringField;
     QMDatosTecnicosTENSION_VOLTAJES: TFIBStringField;
     QMDatosTecnicosRPM: TFIBStringField;
     QMDatosTecnicosBUJE: TFIBStringField;
     QMDatosTecnicosEJE_DIAMETRO: TFIBStringField;
     QMDatosTecnicosTURBINA: TFIBStringField;
     QMDatosTecnicosGIRO: TFIBStringField;
     QMDatosTecnicosOT: TIntegerField;
     QMDatosTecnicosTIPO_PLACA: TFIBStringField;
     QMDatosTecnicosTALLER: TFIBStringField;
     QMDatosTecnicosFECHA_ENTREGA_PLANOS: TDateTimeField;
     QMDatosTecnicosPRESUPUESTO_TALLER: TFIBStringField;
     QMDatosTecnicosFECHA_ENTREGA_EQUIPO: TDateTimeField;
     QMDatosTecnicosVIA_SECA_SUP_FILTRANTE_M2: TFIBStringField;
     QMDatosTecnicosCAUDAL_M3_H: TFIBStringField;
     QMDatosTecnicosPRESION_DAPA: TFIBStringField;
     QMDatosTecnicosPOSICION: TFIBStringField;
     QMDatosTecnicosRAL_EXTERIOR: TFIBStringField;
     QMDatosTecnicosRAL_PROTECCION: TFIBStringField;
     QMDatosTecnicosCAPACIDAD_L: TFIBStringField;
     QMDatosTecnicosOBSERVACIONES: TBlobField;
     QMDatosTecnicosRESPONSABLE: TFIBStringField;
     QMDatosTecnicosLUGAR_ENTREGA: TFIBStringField;
     QMDatosTecnicosST: TIntegerField;
     QMDatosTecnicosINOX_304: TIntegerField;
     QMDatosTecnicosINOX_316: TIntegerField;
     QMDatosTecnicosCREUSABRO_4000: TIntegerField;
     QMDatosTecnicosIMPR_BASICA: TIntegerField;
     QMDatosTecnicosIMPR_2: TIntegerField;
     QMDatosTecnicosPOTENCIA_MOTOR_REDUCTOR_KW: TFIBStringField;
     QMDatosTecnicosARMARIO_ELECTRICO: TIntegerField;
     QMDatosTecnicosCOLECTOR: TIntegerField;
     QMDatosTecnicosMONTAJE: TIntegerField;
     QMDatosTecnicosMONTAJE_ELECTRICO: TIntegerField;
     QMDatosTecnicosTRANSPORTE: TIntegerField;
     QMDatosTecnicosELEMENTOS_SEGURIDAD: TIntegerField;
     QMDatosTecnicosACCESORIOS: TIntegerField;
     QMDatosTecnicosSENALIZACION_EQUIPO: TFIBStringField;
     QMDatosTecnicosPROHIBIDO_FUMAR_GRANDE: TFIBStringField;
     QMDatosTecnicosPROHIBIDO_FUMAR_MEDIANO: TFIBStringField;
     QMDatosTecnicosPARO_SEGURIDAD: TFIBStringField;
     QMDatosTecnicosRETROCESO_DESCARGADOR: TFIBStringField;
     QMDatosTecnicosATENCION_PELIGRO: TFIBStringField;
     QMDatosTecnicosNIVEL_PARADO: TFIBStringField;
     QMDatosTecnicosNIVEL_FUNCIONAMIENTO: TFIBStringField;
     QMDatosTecnicosFLECHA_RECTA: TFIBStringField;
     QMDatosTecnicosFLECHA_CURVADA: TFIBStringField;
     QMDatosTecnicosUSO_GAFAS: TFIBStringField;
     QMDatosTecnicosUSO_MASCARAS: TFIBStringField;
     QMDatosTecnicosMAQUINARIA_FUNCIONAMIENTO: TFIBStringField;
     QMDatosTecnicosRIESGO_FUNCIONAMIENTO: TFIBStringField;
     QMDatosTecnicosRIESGO_ATRAPAMIENTO: TFIBStringField;
     QMDatosTecnicosPROHIBIDO_ENGRASAR_LIMPIAR: TFIBStringField;
     QMDatosTecnicosDATOS_CALDERIN: TFIBStringField;
     QMDatosTecnicosDEJAR_LIBRE_ZONA_PROYECCION: TFIBStringField;
     QMDatosTecnicosHANDTE_GRANDE: TFIBStringField;
     QMDatosTecnicosHANDTE_PEQUENO: TFIBStringField;
     QMDatosTecnicosLUGAR_PUESTA_MARCHA: TFIBStringField;
     QMDatosTecnicosFECHA_PUESTA_MARCHA: TDateTimeField;
     QMDatosTecnicosCAUDAL_BOMBA_M3_H: TFIBStringField;
     QMDatosTecnicosPRESION_BOMBA_M: TFIBStringField;
     QMDatosTecnicosPOTENCIA_BOMBA_KW: TFIBStringField;
     QMDatosTecnicosB1: TFIBStringField;
     QMDatosTecnicosB88: TFIBStringField;
     QMDatosTecnicosB76: TFIBStringField;
     QMDatosTecnicosB44: TFIBStringField;
     QMDatosTecnicosB35: TFIBStringField;
     QMDatosTecnicosTH: TFIBStringField;
     QMDatosTecnicosTL: TFIBStringField;
     QMDatosTecnicosB30: TFIBStringField;
     QMDatosTecnicosB23: TFIBStringField;
     QMDatosTecnicosB11: TFIBStringField;
     QMDatosTecnicosB3: TFIBStringField;
     QMDatosTecnicosB2: TFIBStringField;
     QMDatosTecnicosCONSUMO_MOTOR_VENTILADOR_A: TFIBStringField;
     QMDatosTecnicosCONSUMO_MOTOR_BOMBA_A: TFIBStringField;
     QMDatosTecnicosCONSUMO_MOTOR_REDUCTOR_A: TFIBStringField;
     QMDatosTecnicosCONSUMO_NOMINAL_VENTILADOR: TFIBStringField;
     QMDatosTecnicosCONSUMO_NOMINAL_BOMBA: TFIBStringField;
     QMDatosTecnicosCONSUMO_NOMINAL_MOTOR_REDUCTOR: TFIBStringField;
     QMDatosTecnicosVALOR_TERMICO_VENTILADOR: TFIBStringField;
     QMDatosTecnicosVALOR_TERMICO_BOMBA: TFIBStringField;
     QMDatosTecnicosVALOR_MOTOR_REDUCTOR: TFIBStringField;
     QMDatosTecnicosCAUDAL_REAL_VENTILADOR_M3_H: TFIBStringField;
     QMDatosTecnicosP_MIN_PHOTOHELIC_DAPA: TFIBStringField;
     QMDatosTecnicosP_VENTURI_DAPA: TIntegerField;
     QMDatosTecnicosP_CARTUCHO_MANGA_DAPA: TFIBStringField;
     QMDatosTecnicosPRESION_CALDERIN_BAR: TFIBStringField;
     QMDatosTecnicosTIEMPO_PAUSA_EVS: TFIBStringField;
     QMDatosTecnicosTIEMPO_POST_LIMPIEZAS: TFIBStringField;
     QMDatosTecnicosTIEMPO_V_DS: TFIBStringField;
     QMDatosTecnicosNOMINAL_VENTILADOR_A: TFIBStringField;
     QMDatosTecnicosNOMINAL_BOMBA_A: TFIBStringField;
     QMDatosTecnicosNOMINAL_MOTOR_REDUCTOR_A: TFIBStringField;
     QMDatosTecnicosP_MAX_PHOTOHELIC_DAPA: TFIBStringField;
     QMDatosTecnicosP_TUB_DAPA: TFIBStringField;
     QMDatosTecnicosL_NIVEL_MM: TFIBStringField;
     QMDatosTecnicosPREOCAT_KG: TFIBStringField;
     QMDatosTecnicosTIEMPO_IMPULSO_EVS: TFIBStringField;
     QMDatosTecnicosTIEMPO_ON_DRAGA_MIN: TFIBStringField;
     QMDatosTecnicosTIEMPO_OFF_DRAGA_MIN: TFIBStringField;
     QMDatosTecnicosOBSERVACIONES1: TBlobField;
     QMDatosTecnicosOBSERVACIONES2: TBlobField;
     QMDatosTecnicosOBSERVACIONES3: TBlobField;
     QMDatosTecnicosOBSERVACIONES4: TBlobField;
     QMDatosTecnicosOBSERVACIONES5: TBlobField;
     QMDatosTecnicosOBSERVACIONES6: TBlobField;
     QMDatosTecnicosOBSERVACIONES7: TBlobField;
     QMDatosTecnicosOBSERVACIONES8: TBlobField;
     QMDatosTecnicosFOTO1: TFIBStringField;
     QMDatosTecnicosFOTO2: TFIBStringField;
     QMDatosTecnicosAPLICACION: TFIBStringField;
     QMDatosTecnicosPROHIBIDO_FUMAR_PEQUENO: TFIBStringField;
     xDadesOP: TFIBDataSetRO;
     DSxDadesOP: TDataSource;
     xDadesOPRESPONSABLE: TIntegerField;
     xDadesOPTITULO: TFIBStringField;
     xDadesOPPEDIDO: TIntegerField;
     xDadesOPFECHA_PED: TDateTimeField;
     xExisteOF: TFIBDataSetRO;
     xExisteOFCOUNT: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDatosTecnicosNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDatosTecnicosBeforePost(DataSet: TDataSet);
     procedure QMDatosTecnicosAfterOpen(DataSet: TDataSet);
     procedure QMDatosTecnicosRESPONSABLEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDatosTecnicosPEDIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDatosTecnicosFECHA_PEDIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDatosTecnicosID_ORDENChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMDatosTecnicos : TDMDatosTecnicos;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TDMDatosTecnicos.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction; // Sempre hem d'obrir transaccio

  // DMMain.FiltraTabla(QMDatosTecnicos, '10000', True);
  QMDatosTecnicos.Open;
end;

procedure TDMDatosTecnicos.QMDatosTecnicosNewRecord(DataSet: TDataSet);
begin
  QMDatosTecnicosEMPRESA.AsInteger := REntorno.Empresa;
  QMDatosTecnicosFECHA.AsDateTime := REntorno.FechaTrabSH;
end;

procedure TDMDatosTecnicos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMDatosTecnicos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMDatosTecnicos, '10000', True);
end;

procedure TDMDatosTecnicos.QMDatosTecnicosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'Z_ID_DATOS_TECNICOS', 'ID');
end;

procedure TDMDatosTecnicos.QMDatosTecnicosAfterOpen(DataSet: TDataSet);
begin
  xDadesOP.Close;
  xDadesOP.Open;
end;

procedure TDMDatosTecnicos.QMDatosTecnicosRESPONSABLEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xDadesOPRESPONSABLE.AsString;
end;

procedure TDMDatosTecnicos.QMDatosTecnicosPEDIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xDadesOPPEDIDO.AsString;
end;

procedure TDMDatosTecnicos.QMDatosTecnicosFECHA_PEDIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xDadesOPFECHA_PED.AsString;
end;

procedure TDMDatosTecnicos.QMDatosTecnicosID_ORDENChange(Sender: TField);
begin
  with xDadesOP do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := QMDatosTecnicosID_ORDEN.AsInteger;
     Open;
  end;
end;

end.
