unit UProDMIntroduceDatosCierre;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO, HYFIBQuery,
  FIBDataSet, FIBTableDataSet, FIBQuery, Dialogs;

type
  TProDMIntroduceDatosCierre = class(TDataModule)
     TLocal: THYTransaction;
     QMMaterialesLot_Ubi: TFIBDataSet;
     DSQMMaterialesLot_Ubi: TDataSource;
     QMMaterialesLot_UbiEMPRESA: TIntegerField;
     QMMaterialesLot_UbiEJERCICIO: TIntegerField;
     QMMaterialesLot_UbiCANAL: TIntegerField;
     QMMaterialesLot_UbiSERIES: TFIBStringField;
     QMMaterialesLot_UbiRIG_OF: TIntegerField;
     QMMaterialesLot_UbiSUBORDEN: TIntegerField;
     QMMaterialesLot_UbiLINEA_MAT: TIntegerField;
     QMMaterialesLot_UbiALMACEN: TFIBStringField;
     QMMaterialesLot_UbiLOTE: TFIBStringField;
     QMMaterialesLot_UbiCOMPONENTE: TFIBStringField;
     QMMaterialesLot_UbiORDEN: TIntegerField;
     QMMaterialesLot_UbiUNIDADES_NEC: TFloatField;
     QMMaterialesLot_UbiUNIDADES_UTIL: TFloatField;
     QMMaterialesLot_UbiPORCENTAJE: TFloatField;
     QMMaterialesLot_UbiLINEA_FASE: TIntegerField;
     QMMaterialesLot_UbiPRE_COS_UNI: TFloatField;
     QMMaterialesLot_UbiTOTAL_VAR: TFloatField;
     QMMaterialesLot_UbiPRECIO_FIJO: TFloatField;
     QMMaterialesLot_UbiTOTAL: TFloatField;
     QMMaterialesLot_UbiPRODUCCION: TIntegerField;
     QMMaterialesLot_UbiMATESC: TIntegerField;
     QMMaterialesLot_UbiENTRADA: TIntegerField;
     QMMaterialesLot_UbiID_ORDEN: TIntegerField;
     QMMaterialesLot_UbiID_ORDEN_MAT: TIntegerField;
     QMMaterialesLot_UbiUNIDADES_STOCK: TFloatField;
     QMMaterialesLot_UbiPRE_COS_UNI_REAL: TFloatField;
     QMMaterialesLot_UbiID_MOV_STOCK: TIntegerField;
     QMMaterialesLot_UbiUNIDADES_PREV: TFloatField;
     QMMaterialesLot_UbiPRECIO_FIJO_REAL: TFloatField;
     QMMaterialesLot_UbiTOTAL_VAR_REAL: TFloatField;
     QMMaterialesLot_UbiTOTAL_REAL: TFloatField;
     QMMaterialesLot_UbiNOTAS_MAT: TMemoField;
     QMMaterialesLot_UbiMEDIDAS: TFIBStringField;
     QMMaterialesLot_UbiTIPO_PIEZA: TFIBStringField;
     QMMaterialesLot_UbiNUM_PIEZAS: TFIBStringField;
     QMMaterialesLot_UbiID_MOV_STOCK_B: TIntegerField;
     QMMaterialesLot_UbiID_MOV_STOCK_C: TIntegerField;
     QMMaterialesLot_UbiUNIDAD_ART: TFIBStringField;
     QMMaterialesLot_UbiUNIDAD_FAB: TFIBStringField;
     QMMaterialesLot_UbiID_EQUIVAL: TIntegerField;
     QMMaterialesLot_UbiCOMPRAR: TIntegerField;
     QMMaterialesLot_UbiPROVEEDOR_COMPRA: TIntegerField;
     QMMaterialesLot_UbiMOV_STOCK_COMPRA: TIntegerField;
     QMMaterialesLot_UbiID_A: TIntegerField;
     QMMaterialesLot_UbiUDS_COMPRA: TFloatField;
     QMMaterialesLot_UbiRESERVA_STOCK: TIntegerField;
     QMMaterialesLot_UbiN_MOV_STOCK: TIntegerField;
     QMMaterialesLot_UbiMINI_NOTA: TFIBStringField;
     QMMaterialesLot_UbiRESULTADO_FORMULA: TFloatField;
     QMMaterialesLot_UbiFORMULA: TIntegerField;
     QMMaterialesLot_UbiDESACTIVA_TRIGGER: TIntegerField;
     QMMaterialesLot_UbiDES_ALTO: TFloatField;
     QMMaterialesLot_UbiDES_ANCHO: TFloatField;
     QMMaterialesLot_UbiDES_GRUESO: TFloatField;
     QMMaterialesLot_UbiESTADO: TIntegerField;
     QMMaterialesLot_UbiLINEA_TAREA: TIntegerField;
     QMMaterialesLot_UbiID_DETALLES_ST: TIntegerField;
     QMMaterialesLot_UbiID_LOTE: TIntegerField;
     QMMaterialesLot_UbiID_UBICACION: TIntegerField;
     QMMaterialesLot_UbiCTROL_UBICACION: TIntegerField;
     QMMaterialesLot_UbiUBICABLE: TIntegerField;
     QMMaterialesLot_UbiTitulo_Ubicacion: TStringField;
     QMCompuesto: TFIBDataSet;
     DSQMCompuesto: TDataSource;
     QMMaterialesLot_UbiTITULO_LOTE: TStringField;
     QMCompuestoEMPRESA: TIntegerField;
     QMCompuestoEJERCICIO: TIntegerField;
     QMCompuestoCANAL: TIntegerField;
     QMCompuestoSERIES: TFIBStringField;
     QMCompuestoRIG_OF: TIntegerField;
     QMCompuestoSUBORDEN: TIntegerField;
     QMCompuestoALMACEN_SAL: TFIBStringField;
     QMCompuestoALMACEN_LAN: TFIBStringField;
     QMCompuestoALMACEN_ENT: TFIBStringField;
     QMCompuestoFECHA_ORD: TDateTimeField;
     QMCompuestoCLIENTE: TIntegerField;
     QMCompuestoCOMPUESTO: TFIBStringField;
     QMCompuestoESCANDALLO: TIntegerField;
     QMCompuestoESTADO: TIntegerField;
     QMCompuestoPEDIDO: TIntegerField;
     QMCompuestoLINEA_PED: TIntegerField;
     QMCompuestoFECHA_PED: TDateTimeField;
     QMCompuestoUNI_PEDID: TFloatField;
     QMCompuestoUNI_MANUAL: TFloatField;
     QMCompuestoUNI_TOTAL: TFloatField;
     QMCompuestoPRIORIDAD: TIntegerField;
     QMCompuestoMERMA: TFloatField;
     QMCompuestoUNI_PRODUC: TFloatField;
     QMCompuestoUNI_PENDIENTES: TFloatField;
     QMCompuestoFECHA_ENTREGA: TDateTimeField;
     QMCompuestoFECHA_INI: TDateTimeField;
     QMCompuestoFECHA_FIN: TDateTimeField;
     QMCompuestoCOSTE_FIJO_PRE: TFloatField;
     QMCompuestoCOSTE_VAR_PRE: TFloatField;
     QMCompuestoCOSTE_MAT_PRE: TFloatField;
     QMCompuestoCOSTE_MO_PRE: TFloatField;
     QMCompuestoCOSTE_MAQ_PRE: TFloatField;
     QMCompuestoCOSTE_TEX_PRE: TFloatField;
     QMCompuestoCOSTE_TOT_PRE: TFloatField;
     QMCompuestoCOSTE_FIJO_REAL: TFloatField;
     QMCompuestoCOSTE_VAR_REAL: TFloatField;
     QMCompuestoCOSTE_MAT_REAL: TFloatField;
     QMCompuestoCOSTE_MO_REAL: TFloatField;
     QMCompuestoCOSTE_MAQ_REAL: TFloatField;
     QMCompuestoCOSTE_TEX_REAL: TFloatField;
     QMCompuestoCOSTE_TOT_REAL: TFloatField;
     QMCompuestoCOSTE_UNITARIO: TFloatField;
     QMCompuestoPRECIO_VENTA: TFloatField;
     QMCompuestoHORAS_TOTALES: TFloatField;
     QMCompuestoMARGEN_UNI: TFloatField;
     QMCompuestoMARGEN_TOTAL: TFloatField;
     QMCompuestoOBSERVACIONES: TMemoField;
     QMCompuestoVISTOBUENO1: TIntegerField;
     QMCompuestoVISTOBUENO2: TIntegerField;
     QMCompuestoVISTOBUENO3: TIntegerField;
     QMCompuestoSITUACION: TIntegerField;
     QMCompuestoMARGEN_UNI_CIEN: TFloatField;
     QMCompuestoENTRADA: TIntegerField;
     QMCompuestoID_ORDEN: TIntegerField;
     QMCompuestoTIPO_LANZAMIENTO: TIntegerField;
     QMCompuestoID_ORDEN_MAT: TIntegerField;
     QMCompuestoTIPO_RESERVA: TIntegerField;
     QMCompuestoID_MOV_STOCK: TIntegerField;
     QMCompuestoISO_APROBADO: TIntegerField;
     QMCompuestoISO_VERIFICADO: TIntegerField;
     QMCompuestoISO_VALIDADO: TIntegerField;
     QMCompuestoID_A: TIntegerField;
     QMCompuestoPADRE_SUBORDEN: TIntegerField;
     QMCompuestoCONT_SUBORDEN: TIntegerField;
     QMCompuestoREFERENCIA: TFIBStringField;
     QMCompuestoCOSTE_COMPRAS: TFloatField;
     QMCompuestoHORAS_OPERARIO: TFloatField;
     QMCompuestoHORAS_MAQUINA: TFloatField;
     QMCompuestoID_DESPIECE: TIntegerField;
     QMCompuestoID_ORDEN_SUBORDEN: TIntegerField;
     QMCompuestoSELECCIONADA: TIntegerField;
     QMCompuestoPREVALECE_ALM_ORDEN: TIntegerField;
     QMCompuestoCERRAR_SUBORDENES: TIntegerField;
     QMCompuestoIMPORTAR_OP: TIntegerField;
     QMCompuestoCASO_OP: TIntegerField;
     QMCompuestoRESERVA_STOCK_OP: TIntegerField;
     QMCompuestoMEDIDA_1: TFloatField;
     QMCompuestoMEDIDA_2: TFloatField;
     QMCompuestoMEDIDA_3: TFloatField;
     QMCompuestoMEDIDA_4: TFloatField;
     QMCompuestoDESACTIVA_TRIGGER: TIntegerField;
     QMCompuestoRESPONSABLE: TIntegerField;
     QMCompuestoDIF_COSTE_FIJO: TFloatField;
     QMCompuestoDIF_COSTE_MAT: TFloatField;
     QMCompuestoDIF_COSTE_MO: TFloatField;
     QMCompuestoDIF_COSTE_MAQ: TFloatField;
     QMCompuestoDIF_COSTE_TEXT: TFloatField;
     QMCompuestoDIF_COSTE_VAR: TFloatField;
     QMCompuestoCOSTE_COMPRAS_PRE: TFloatField;
     QMCompuestoDIF_COSTE_COMPRAS: TFloatField;
     QMCompuestoDIF_COSTE_TOTAL: TFloatField;
     QMCompuestoCOMPUESTOS_VIRTUALES: TIntegerField;
     QMCompuestoSEGUIR_SIN_STOCK: TIntegerField;
     QMCompuestoMARGEN_TOTAL_PRE: TFloatField;
     QMCompuestoMARGEN_UNI_CIEN_PRE: TFloatField;
     QMCompuestoCOSTE_UNITARIO_PRE: TFloatField;
     QMCompuestoMARGEN_UNI_PRE: TFloatField;
     QMCompuestoPRECIO_VENTA_PRE: TFloatField;
     QMCompuestoPRECIO_VENTA_TOT_PRE: TFloatField;
     QMCompuestoPRECIO_VENTA_TOT_REAL: TFloatField;
     QMCompuestoDIF_COSTE_MARGEN_TOTAL: TFloatField;
     QMCompuestoDIF_MARGEN_TOTAL: TFloatField;
     QMCompuestoDIF_MARGEN_UNI_CIEN: TFloatField;
     QMCompuestoDIF_PRECIO_VENTA_UNI: TFloatField;
     QMCompuestoDIF_COSTE_UNI: TFloatField;
     QMCompuestoDIF_MARGEN_UNI: TFloatField;
     QMCompuestoDIF_PRECIO_VENTA_TOT: TFloatField;
     QMCompuestoHORAS_OPERARIO_PRE: TFloatField;
     QMCompuestoHORAS_MAQUINA_PRE: TFloatField;
     QMCompuestoDIF_HORAS_MAQUINA: TFloatField;
     QMCompuestoDIF_HORAS_OPERARIO: TFloatField;
     QMCompuestoRECUPERADO_MARCAJE: TIntegerField;
     QMCompuestoUNI_FABRICADAS: TFloatField;
     QMCompuestoPLANIFICACION: TIntegerField;
     QMCompuestoLINEA_PLANIFICACION: TIntegerField;
     QMCompuestoID_PLANIFICACION: TIntegerField;
     QMCompuestoID_PLANIFICACION_DET: TIntegerField;
     QMCompuestoID_LOTE: TIntegerField;
     QMCompuestoID_UBICACION: TIntegerField;
     QMCompuestoTitulo_Ubicacion: TStringField;
     QMSerieComponente: TFIBDataSet;
     QMSerieCompuesto: TFIBDataSet;
     DSSerieComponente: TDataSource;
     DSSerieCompuesto: TDataSource;
     QMSerieComponenteEMPRESA: TIntegerField;
     QMSerieComponenteEJERCICIO: TIntegerField;
     QMSerieComponenteCANAL: TIntegerField;
     QMSerieComponenteRIG_OF: TIntegerField;
     QMSerieComponenteID_ORDEN: TIntegerField;
     QMSerieComponenteLINEA: TIntegerField;
     QMSerieComponenteCOMPONENTE: TFIBStringField;
     QMSerieComponenteCOD_SERIALIZACION: TFIBStringField;
     QMSerieComponenteTIPO: TIntegerField;
     QMSerieCompuestoEMPRESA: TIntegerField;
     QMSerieCompuestoEJERCICIO: TIntegerField;
     QMSerieCompuestoCANAL: TIntegerField;
     QMSerieCompuestoRIG_OF: TIntegerField;
     QMSerieCompuestoID_ORDEN: TIntegerField;
     QMSerieCompuestoLINEA: TIntegerField;
     QMSerieCompuestoCOMPONENTE: TFIBStringField;
     QMSerieCompuestoCOD_SERIALIZACION: TFIBStringField;
     QMSerieCompuestoTIPO: TIntegerField;
     QMSerieComponenteALMACEN: TFIBStringField;
     QMSerieCompuestoALMACEN: TFIBStringField;
     QMSerieComponenteSERIE: TFIBStringField;
     QMSerieCompuestoSERIE: TFIBStringField;
     QMCompuestoSERIALIZADO: TIntegerField;
     QMCompuestoSERIALIZADO_KRI: TIntegerField;
     QMCompuestoUBICABLE: TIntegerField;
     QMSerieCompuestoCODIGO_SERIE: TIntegerField;
     QMCompuestoID_MOV_STOCK_RESERVA: TIntegerField;
     QMCompuestoDESC_LOTE: TFIBStringField;
     QMMaterialesLot_UbiLOTES: TIntegerField;
     QMCompuestoLOTES: TIntegerField;
     QMMaterialesLot_UbiMERMA: TFloatField;
     QMMaterialesLot_UbiUNIDADES_DEVOLVER: TFloatField;
     QMMaterialesLot_UbiALMACEN_DEVOLVER: TFIBStringField;
     QMMaterialesLot_UbiUDS_POSIBLES: TFloatField;
     QMMaterialesLot_UbiALMACEN_SAL: TFIBStringField;
     QMMaterialesLot_UbiTITULO: TFIBStringField;
     QMMaterialesLot_UbiSTOCK_ALM_SAL: TFloatField;
     QMMaterialesLot_UbiSTOCK_ALM_LAN: TFloatField;
     QMMaterialesLot_UbiCONTROL_STOCK: TIntegerField;
     QMMaterialesLot_UbiCANT_LOTE: TIntegerField;
     QMCompuestoUNIDADES_RES: TFloatField;
     QMCompuestoLINEA_RES: TIntegerField;
     QMCompuestoCANT_RESERVAS: TIntegerField;
     QMCompuestoUNIDADES_RESERVAS: TFloatField;
     QMCompuestoID_RESERVA: TIntegerField;
     QMMaterialesLot_UbiN_MOV_STOCK_RESERVA: TIntegerField;
     QMMaterialesLot_UbiID_LOTE_MAT: TIntegerField;
     QMMaterialesLot_UbiLOTE_MAT: TFIBStringField;
     QMMaterialesLot_UbiUNIDADES_FAB: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMaterialesUbAfterPost(DataSet: TDataSet);
     procedure QMMaterialesLot_UbiTitulo_UbicacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMaterialesLot_UbiTITULO_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMaterialesLot_UbiID_LOTEChange(Sender: TField);
     procedure QMMaterialesLot_UbiID_UBICACIONChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMMaterialesLot_UbiCalcFields(DataSet: TDataSet);
     procedure QMCompuestoAfterPost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCompuestoCalcFields(DataSet: TDataSet);
     procedure QMMaterialesLot_UbiBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
     Situacion: integer;
     function CantidadLotesAsignados(IdOrdenMat: integer): double;
     procedure BorroLotesAsignados(IdOrdenMat: integer);
     procedure ActualizaUnidadesDevolucion;
     function VerificaSiExiteCierreParciaAbierto: boolean;
  public
     { Public declarations }
     MinUnidadesPosibles: double;
     procedure InfoLotes(Componente: boolean);
     function HayDetalle(Valor: integer): boolean;
     function CrearLoteCompuestoAuto: integer;
     procedure ComprobarInfoCierre(var error_compuesto_lote, error_compuesto_ubi, error_compuesto_serie, error_componente_lote, error_componente_ubi, error_componente_serie: integer);
     procedure CrearSeriesCompuesto;
     procedure FiltraSituacion(aSituacion: integer);
     procedure AsignaLotesAutomaticamente;
     procedure CreaRegistro;
  end;

var
  ProDMIntroduceDatosCierre : TProDMIntroduceDatosCierre;

implementation

uses UDMMain, UEntorno, UProDMOrden, UFMIntroduceLotes, UUtiles, UFMAsignaLotes, UParam, UDameDato;

{$R *.dfm}

procedure TProDMIntroduceDatosCierre.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMMaterialesLot_Ubi, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCompuesto, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMSerieComponente, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMSerieCompuesto, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TProDMIntroduceDatosCierre.DataModuleDestroy(Sender: TObject);
begin
  if TLocal.InTransaction then
     TLocal.Commit;
end;

procedure TProDMIntroduceDatosCierre.QMMaterialesUbAfterPost(DataSet: TDataSet);
begin
end;

// sfg.albert - Igual que pro_ord però per formulari d'introducció de les dades que falten
procedure TProDMIntroduceDatosCierre.InfoLotes(Componente: boolean);
var
  AsignaLotes : TFMAsignaLotes;
  Articulo : string;
  (*
  IntroduceLotes : TFMIntroduceLotes;
  IdLoteCompuesto : integer;
  *)
begin
  if (Componente) then
     Articulo := QMMaterialesLot_UbiCOMPONENTE.AsString
  else
     Articulo := QMCompuestoCOMPUESTO.AsString;

  if (ArticuloLoteable(Articulo)) then
  begin
     if (Componente) then
     begin
        AsignaLotes := TFMAsignaLotes.Create(Self);
        try
           with AsignaLotes do
           begin
              { TODO -oDuilio : Ver que estado determina si el lote es editable o no. }
              raise Exception.Create(_('No Implementado'));
              // Problema: Materiales y Materiales reservados no es la misma cantidad
              //           Un material puede tener multiples reservas
              //           Por lo tanto, cuantos lotes se deben asignar (según mat o según sum(cant_reserva))?
              //AsignaDocumento('MAT', QMMaterialesLot_UbiID_RESERVA_MAT.AsInteger, True {(QMMaterialesLot_UbiESTADO.AsInteger = 0)});
           end;
        finally
           AsignaLotes.Free;
        end;
     end
     else  // Creació del lot del compost
     begin
        AsignaLotes := TFMAsignaLotes.Create(Self);
        try
           with AsignaLotes do
           begin
              { TODO -oDuilio : Ver que estado determina si el lote es editable o no. }
              AsignaDocumento('ORD', QMCompuestoID_ORDEN.AsInteger, True {(QMCompuestoSITUACION.AsInteger = 0)});
           end;
        finally
           AsignaLotes.Free;
        end;
        (*
        IntroduceLotes := TFMIntroduceLotes.Create(Self);
        try
           with IntroduceLotes do
           begin
              IdLoteCompuesto := AsignaArticulo('COM',
                 QMCompuestoSERIES.AsString,
                 QMCompuestoCOMPUESTO.AsString, QMCompuestoEJERCICIO.AsInteger,
                 QMCompuestoRIG_OF.AsInteger,
                 0, QMCompuestoUNIDADES_RES.AsFloat,
                 QMCompuestoALMACEN_ENT.AsString,
                 QMCompuestoALMACEN_ENT.AsString, QMCompuestoCANAL.AsInteger,
                 QMCompuestoCANAL.AsInteger,
                 True, QMCompuestoID_A.AsInteger,
                 QMCompuestoID_ORDEN.AsInteger, 0, True);

              {Informo la ubicacion seleccionada en la seleccion de lote}
              if (ArticuloUbicable(QMCompuestoCOMPUESTO.AsString)) then
                 QMCompuestoID_UBICACION.AsInteger := IntroduceLotes.IDUbicacion;
           end;
        finally
           IntroduceLotes.Free;
        end;

        if (IdLoteCompuesto > 0) then
        begin
           with THYFIBQuery.Create(nil) do
              try
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE PRO_ORD SET ID_LOTE = :ID_LOTE WHERE ID_ORDEN = :ID_ORDEN';
                 Params.ByName['ID_LOTE'].AsInteger := IdLoteCompuesto;
                 Params.ByName['ID_ORDEN'].AsInteger := QMCompuestoID_ORDEN.AsInteger;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           QMCompuestoID_LOTE.AsInteger := IdLoteCompuesto;
        end;
        *)
     end;
  end;
end;

procedure TProDMIntroduceDatosCierre.QMMaterialesLot_UbiTitulo_UbicacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloUbicacion(QMMaterialesLot_UbiID_UBICACION.AsInteger);
end;

function TProDMIntroduceDatosCierre.HayDetalle(Valor: integer): boolean;
begin
  {Todo: Si valor no es ni 1 ni 2, queda indefinido}
  case Valor of
     1: Result := (QMMaterialesLot_Ubi.FieldByName('ID_ORDEN').AsInteger <> 0);
     2: Result := (QMCompuesto.FieldByName('ID_ORDEN').AsInteger <> 0);
     else
        Result := False;
  end;
end;

procedure TProDMIntroduceDatosCierre.QMMaterialesLot_UbiTITULO_LOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMMaterialesLot_UbiID_LOTE.AsInteger);
  if (QMMaterialesLot_UbiCANT_LOTE.AsInteger > 1) then
     Text := Text + ' +' + QMMaterialesLot_UbiCANT_LOTE.AsString;
end;

procedure TProDMIntroduceDatosCierre.QMMaterialesLot_UbiID_LOTEChange(Sender: TField);
begin
  QMMaterialesLot_UbiTITULO_LOTE.AsString := DameLote(QMMaterialesLot_UbiID_LOTE.AsInteger);
end;

procedure TProDMIntroduceDatosCierre.QMMaterialesLot_UbiID_UBICACIONChange(Sender: TField);
begin
  QMMaterialesLot_UbiTitulo_Ubicacion.AsString := DameTituloUbicacion(QMMaterialesLot_UbiID_UBICACION.AsInteger);
end;

function TProDMIntroduceDatosCierre.CrearLoteCompuestoAuto: integer;
var
  id_lote : integer;
  Lote : string;
begin
  Lote := DMMain.DameLoteSiguiente(QMCompuestoID_A.AsInteger, QMCompuestoRIG_OF.AsInteger, 'PRO', QMCompuestoID_ORDEN.AsInteger);
  id_lote := DMMain.CrearLote(QMCompuestoID_A.AsInteger, Lote, '', QMCompuestoALMACEN_ENT.AsString);

  QMCompuesto.Edit;
  QMCompuestoID_LOTE.AsInteger := id_lote;
  QMCompuesto.Post;

  Result := id_lote;
end;

procedure TProDMIntroduceDatosCierre.FiltraSituacion(aSituacion: integer);
begin
  Situacion := aSituacion;

  // Serie componente
  if (Situacion = 1) then
  begin
     QMSerieComponente.Close;
     QMSerieComponente.Open;
  end;

  // Serie compuesto
  if (Situacion = 0) then
  begin
     QMSerieCompuesto.Close;
     QMSerieCompuesto.Open;
  end;
end;

procedure TProDMIntroduceDatosCierre.Graba(DataSet: TDataSet);
begin
  TFIBDataSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMIntroduceDatosCierre.ComprobarInfoCierre(var error_compuesto_lote, error_compuesto_ubi, error_compuesto_serie, error_componente_lote, error_componente_ubi, error_componente_serie: integer);
var
  CantidadLotesAsignados : double;
  OFMovStockCerrarOP : integer;
begin
  error_compuesto_lote := 0;
  error_compuesto_ubi := 0;
  error_compuesto_serie := 0;
  error_componente_lote := 0;
  error_componente_ubi := 0;
  error_componente_serie := 0;

  OFMovStockCerrarOP := DMMain.DameConstanteProduccion('OF_MOV_STOCK_CERRAR_OP');

  // Es mira si ha informat de tots els lots i ubicacions dels compostos
  with QMCompuesto do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (OFMovStockCerrarOP = 0) then
           begin
              if ((QMCompuestoLOTES.AsInteger = 1) and ((QMCompuestoID_LOTE.AsInteger = 0) or (QMCompuestoID_LOTE.IsNull))) then
                 error_compuesto_lote := error_compuesto_lote + 1;

              if ((QMCompuestoLOTES.AsInteger = 1) and ((QMCompuestoUBICABLE.AsInteger = 1) and ((QMCompuestoID_UBICACION.AsInteger = 0) or (QMCompuestoID_UBICACION.IsNull)))) then
                 error_compuesto_ubi := error_compuesto_ubi + 1;
           end;
           Next;
        end;

        First;
     finally
        EnableControls;
     end;
  end;

  // Es mira si ha informat de tots els lots i ubicacions dels components
  with QMMaterialesLot_Ubi do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (OFMovStockCerrarOP = 0) then
           begin
              if ((QMMaterialesLot_UbiLOTES.AsInteger = 1) and ((QMMaterialesLot_UbiID_LOTE.AsInteger = 0) or (QMMaterialesLot_UbiID_LOTE.IsNull))) then
                 error_componente_lote := error_componente_lote + 1;

              if ((QMMaterialesLot_UbiLOTES.AsInteger = 1) and (
                 (QMMaterialesLot_UbiUBICABLE.AsInteger = 1) and
                 (QMMaterialesLot_UbiCTROL_UBICACION.AsInteger = 1) and
                 ((QMMaterialesLot_UbiID_UBICACION.AsInteger = 0) or (QMMaterialesLot_UbiID_UBICACION.IsNull)))) then
                 error_componente_ubi := error_componente_ubi + 1;

              if ((QMMaterialesLot_UbiLOTES.AsInteger = 1) and (QMMaterialesLot_UbiUNIDADES_DEVOLVER.AsFloat <> 0)) then
              begin
                 {TODO: Calcular la cantidad de lotes asignados a la devolucion}

                 // Temporalmente, para que no falle, indico que la cantidad asignada es la cantidad a devolver.
                 CantidadLotesAsignados := QMMaterialesLot_UbiUNIDADES_DEVOLVER.AsFloat * (-1);

                (*
                // Esto devuelve el suma de stock de lotes. No es lo que se quiere
                // Se necesita saber cuantas unidades han sido asignadas a esta devolucion.

                with THYFIBQuery.Create(nil) do
                begin
                   try
                      Close;
                      DataBase := DMMain.DataBase;
                      SQL.Add('SELECT SUM((SELECT SUM(STOCK) ');
                      SQL.Add('        FROM A_ART_STOCK_LOTE(:EMPRESA, :COMPONENTE, :CANAL, :ALMACEN_ORIGEN, :ID_UBICACION_MAT) ');
                      SQL.Add('        WHERE ');
                      SQL.Add('        ID_LOTE = ML.ID_LOTE)) AS STOCK_LOTES ');
                      SQL.Add('FROM PRO_ORD_MAT_LOTES ML ');
                      SQL.Add('WHERE ');
                      SQL.Add('ID_ORDEN_MAT = :ID_ORDEN_MAT ');
                      Params.ByName['EMPRESA'].AsInteger := QMMaterialesLot_UbiEMPRESA.AsInteger;
                      Params.ByName['COMPONENTE'].AsString := QMMaterialesLot_UbiCOMPONENTE.AsString;
                      Params.ByName['CANAL'].AsInteger := QMMaterialesLot_UbiCANAL.AsInteger;
                      Params.ByName['ALMACEN_ORIGEN'].AsString := QMMaterialesLot_UbiALMACEN.AsString;
                      Params.ByName['ID_UBICACION_MAT'].AsInteger := QMMaterialesLot_UbiID_UBICACION.AsInteger;
                      Params.ByName['ID_ORDEN_MAT'].AsInteger := QMMaterialesLot_UbiID_ORDEN_MAT.AsInteger;
                      ExecQuery;
                      CantidadLotesAsignados := FieldByName['STOCK_LOTES'].AsFloat;
                      FreeHandle;
                   finally
                      Free;
                   end;
                end;
                *)

                 if (QMMaterialesLot_UbiUNIDADES_DEVOLVER.AsFloat * (-1) <> CantidadLotesAsignados) then
                    ShowMessage(_(format('La cantidad de lotes asignados a devolver es incorrecta. Componente: %s', [QMMaterialesLot_UbiCOMPONENTE.AsString])));
              end;
           end;

           Next;
        end;

        First;
     finally
        EnableControls;
     end;
  end;

  // Es mira si ha informat de totes les series dels compostos
  with QMSerieCompuesto do
  begin
     DisableControls;
     try
        Close;
        Open;
        First;
        while not EOF do
        begin
           if ((QMSerieCompuestoCOD_SERIALIZACION.AsString = '')) then
              error_compuesto_serie := error_compuesto_serie + 1;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;

  // Es mira si ha informat de totes les series dels component
  with QMSerieComponente do
  begin
     DisableControls;
     try
        Close;
        Open;
        First;
        while not EOF do
        begin
           if ((QMSerieComponenteCOD_SERIALIZACION.AsString = '')) then
              error_componente_serie := error_componente_serie + 1;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TProDMIntroduceDatosCierre.CrearSeriesCompuesto;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CREAR_SERIALIZACION_COMPUESTOS(?ID_ORDEN)';
        Params.ByName['ID_ORDEN'].AsInteger := ProDMOrden.QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMSerieCompuesto.Close;
  QMSerieCompuesto.Open;
end;

procedure TProDMIntroduceDatosCierre.QMMaterialesLot_UbiCalcFields(DataSet: TDataSet);
var
  StockAlmLan, StockAlmSal, UdsPosibles : double;
begin
  StockAlmLan := 0;
  StockAlmSal := 0;
  UdsPosibles := 0;

  if (QMMaterialesLot_UbiCONTROL_STOCK.AsInteger = 1) then
  begin
     StockAlmLan := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMMaterialesLot_UbiCOMPONENTE.AsString, QMMaterialesLot_UbiALMACEN.AsString);
     StockAlmSal := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMMaterialesLot_UbiCOMPONENTE.AsString, QMMaterialesLot_UbiALMACEN_SAL.AsString);
     if ((StockAlmSal <> 0) and (QMMaterialesLot_UbiUNIDADES_NEC.AsFloat <> 0) and (QMCompuestoUNIDADES_RES.AsFloat <> 0)) then
     begin
        if (QMMaterialesLot_UbiUNIDADES_NEC.AsFloat > 0) then
           UdsPosibles := StockAlmSal / (QMMaterialesLot_UbiUNIDADES_NEC.AsFloat / QMCompuestoUNIDADES_RES.AsFloat);
     end
     else
     if (QMMaterialesLot_UbiUNIDADES_NEC.AsFloat > 0) then
        UdsPosibles := 0;
  end;

  QMMaterialesLot_UbiSTOCK_ALM_LAN.AsFloat := StockAlmLan;
  QMMaterialesLot_UbiSTOCK_ALM_SAL.AsFloat := StockAlmSal;
  QMMaterialesLot_UbiUDS_POSIBLES.AsFloat := UdsPosibles;
end;

function TProDMIntroduceDatosCierre.CantidadLotesAsignados(IdOrdenMat: integer): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(CANTIDAD) FROM PRO_ORD_MAT_LOTES WHERE ID_ORDEN_MAT = :ID_ORDEN_MAT ';
        Params.ByName['ID_ORDEN_MAT'].AsInteger := IdOrdenMat;
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMIntroduceDatosCierre.BorroLotesAsignados(IdOrdenMat: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM PRO_ORD_MAT_LOTES WHERE ID_ORDEN_MAT = :ID_ORDEN_MAT ';
        Params.ByName['ID_ORDEN_MAT'].AsInteger := IdOrdenMat;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMIntroduceDatosCierre.AsignaLotesAutomaticamente;
var
  Q : THYFIBQuery;
  IdLote : integer;
  Stock, Unidades, UnidadesNecesarias : double;
begin
  with QMMaterialesLot_Ubi do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           // Si no tiene lotes y es loteable
           if ((QMMaterialesLot_UbiID_LOTE.AsInteger = 0) and (QMMaterialesLot_UbiLOTES.AsInteger = 1)) then
           begin
              IdLote := 1;
              // Calculo cuantas unidades de lotes necesito
              Unidades := QMMaterialesLot_UbiUNIDADES_STOCK.AsFloat; // Unidades := QMMaterialesLot_UbiUNIDADES_NEC.AsFloat;
              UnidadesNecesarias := Unidades - CantidadLotesAsignados(QMMaterialesLot_UbiID_ORDEN_MAT.AsInteger);

              while ((IdLote <> 0) and (UnidadesNecesarias > 0.0001)) do
              begin
                 // Busco el lote mas antiguo con stock que todavia no se ha utilizado
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT ID_LOTE, STOCK FROM A_ART_DAME_STOCK_LOTE_UBIC(:EMPRESA, :ARTICULO, :CANAL, :ALMACEN, -1) ');
                       SQL.Add(' WHERE STOCK > 0 AND ID_LOTE > :ID_LOTE');
                       SQL.Add(' ORDER BY ID_LOTE /*DESC*/ ');
                       Params.ByName['EMPRESA'].AsInteger := QMMaterialesLot_UbiEMPRESA.AsInteger;
                       Params.ByName['ARTICULO'].AsString := QMMaterialesLot_UbiCOMPONENTE.AsString;
                       Params.ByName['CANAL'].AsInteger := QMMaterialesLot_UbiCANAL.AsInteger;
                       Params.ByName['ALMACEN'].AsString := QMMaterialesLot_UbiALMACEN.AsString; // QMMaterialesLot_UbiALMACEN_SAL.AsString;
                       Params.ByName['ID_LOTE'].AsInteger := IdLote;
                       ExecQuery;
                       IdLote := FieldByName['ID_LOTE'].AsInteger;
                       Stock := FieldByName['STOCK'].AsFloat;
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 if (Stock > UnidadesNecesarias) then
                    Stock := UnidadesNecesarias;

                 // Si encuentro un lote lo asigno
                 if (IdLote <> 0) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO PRO_ORD_MAT_LOTES ');
                          SQL.Add(' (EMPRESA, EJERCICIO, CANAL, TIPO, NORDEN, LOTE, N_SERIE, ');
                          SQL.Add(' CANTIDAD, ARTICULO, ALMACEN, ');
                          SQL.Add(' LINEA, ID_DETALLES_S, ESTADO_LOTE, ID_A, SERIE, ID_ORDEN_MAT, ID_ORDEN, ');
                          SQL.Add(' ID_LOTE, SUBLINEA) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :TIPO, :NORDEN, :LOTE, :N_SERIE, ');
                          SQL.Add(' :CANTIDAD, :ARTICULO, :ALMACEN, ');
                          SQL.Add(' :LINEA, :ID_DETALLES_S, :ESTADO_LOTE, :ID_A, :SERIE, :ID_ORDEN_MAT, :ID_ORDEN, ');
                          SQL.Add(' :ID_LOTE, :SUBLINEA) ');
                          Params.ByName['EMPRESA'].AsInteger := QMMaterialesLot_UbiEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := QMMaterialesLot_UbiEJERCICIO.AsInteger;
                          Params.ByName['CANAL'].AsInteger := QMMaterialesLot_UbiCANAL.AsInteger;
                          Params.ByName['TIPO'].AsString := 'MAT';
                          Params.ByName['NORDEN'].AsInteger := QMMaterialesLot_UbiRIG_OF.AsInteger;
                          Params.ByName['LOTE'].AsString := '';
                          Params.ByName['N_SERIE'].AsString := '';
                          Params.ByName['CANTIDAD'].AsFloat := Stock;
                          Params.ByName['ARTICULO'].AsString := QMMaterialesLot_UbiCOMPONENTE.AsString;
                          Params.ByName['ALMACEN'].AsString := QMMaterialesLot_UbiALMACEN.AsString; // QMMaterialesLot_UbiALMACEN_SAL.AsString;
                          Params.ByName['LINEA'].AsInteger := QMMaterialesLot_UbiLINEA_MAT.AsInteger;
                          Params.ByName['ID_DETALLES_S'].AsInteger := 0;
                          Params.ByName['ESTADO_LOTE'].AsInteger := 0;
                          Params.ByName['ID_A'].AsInteger := QMMaterialesLot_UbiID_A.AsInteger;
                          Params.ByName['SERIE'].AsString := QMMaterialesLot_UbiSERIES.AsString;
                          Params.ByName['ID_ORDEN_MAT'].AsInteger := QMMaterialesLot_UbiID_ORDEN_MAT.AsInteger;
                          Params.ByName['ID_ORDEN'].AsInteger := QMMaterialesLot_UbiID_ORDEN.AsInteger;
                          Params.ByName['ID_LOTE'].AsInteger := IdLote;
                          Params.ByName['SUBLINEA'].AsInteger := 0;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Calculo cuantas unidades de lotes necesito
                 UnidadesNecesarias := Unidades - CantidadLotesAsignados(QMMaterialesLot_UbiID_ORDEN_MAT.AsInteger);
              end;

              // Si quedan unidades de lotes por asignar, borro lo asignado y dejo a que el usuario lo haga manualmente
              if (UnidadesNecesarias > 0.0001) then
                 BorroLotesAsignados(QMMaterialesLot_UbiID_ORDEN_MAT.AsInteger);
           end;
           Next;
        end;

        Close;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TProDMIntroduceDatosCierre.CreaRegistro;
var
  Param_PROMOVS001 : string;
begin
  // Compuesto
  with QMCompuesto do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT COMP.*, CAST(0 AS DOUBLE PRECISION) UNIDADES_RES, 1 LINEA_RES, ART.SERIALIZADO, ART.SERIALIZADO_KRI, ART.UBICABLE, ART.LOTES, 1 ID_RESERVA, ');
     if (Situacion = 0) then
     begin
        SelectSQL.Add('        (SELECT FIRST 1 ID_LOTE ');
        SelectSQL.Add('         FROM PRO_ORD_LOTE ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         ID_ORDEN = COMP.ID_ORDEN ');
        SelectSQL.Add('         ORDER BY SUBLINEA) ID_LOTE, ');
        SelectSQL.Add('        (CAST(SUBSTRING((SELECT LIST(L.LOTE, '', '') ');
        SelectSQL.Add('                         FROM PRO_ORD_LOTE OL ');
        SelectSQL.Add('                         JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOTE = L.ID_LOTE) ');
        SelectSQL.Add('                         WHERE ');
        SelectSQL.Add('                         OL.ID_ORDEN = COMP.ID_ORDEN) FROM 1 FOR 20) AS VARCHAR(20))) DESC_LOTE, ');
     end
     else
     begin
        SelectSQL.Add('        COALESCE((SELECT FIRST 1 ID_LOTE ');
        SelectSQL.Add('                   FROM PRO_ORD_RESERVA_LOTE ');
        SelectSQL.Add('                   WHERE ');
        SelectSQL.Add('                   ID_ORDEN = COMP.ID_ORDEN ');
        SelectSQL.Add('                   ORDER BY LINEA_RES), ');
        SelectSQL.Add('                  (SELECT FIRST 1 ID_LOTE ');
        SelectSQL.Add('                   FROM PRO_ORD_LOTE ');
        SelectSQL.Add('                   WHERE ');
        SelectSQL.Add('                   ID_ORDEN = COMP.ID_ORDEN ');
        SelectSQL.Add('                   ORDER BY SUBLINEA)) ID_LOTE, ');
        SelectSQL.Add('        COALESCE((CAST(SUBSTRING((SELECT LIST(L.LOTE, '', '') ');
        SelectSQL.Add('                                  FROM PRO_ORD_RESERVA_LOTE OL ');
        SelectSQL.Add('                                  JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOTE = L.ID_LOTE) ');
        SelectSQL.Add('                                  WHERE ');
        SelectSQL.Add('                                  OL.ID_ORDEN = COMP.ID_ORDEN) FROM 1 FOR 20) AS VARCHAR(20))), ');
        SelectSQL.Add('                 (CAST(SUBSTRING((SELECT LIST(L.LOTE, '', '') ');
        SelectSQL.Add('                                  FROM PRO_ORD_LOTE OL ');
        SelectSQL.Add('                                  JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOTE = L.ID_LOTE) ');
        SelectSQL.Add('                                  WHERE ');
        SelectSQL.Add('                                  OL.ID_ORDEN = COMP.ID_ORDEN) FROM 1 FOR 20) AS VARCHAR(20)))) DESC_LOTE, ');
     end;

     SelectSQL.Add('        (SELECT COUNT(*) ');
     SelectSQL.Add('         FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN = COMP.ID_ORDEN) CANT_RESERVAS, ');
     SelectSQL.Add('        (SELECT SUM(UNIDADES) ');
     SelectSQL.Add('         FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN = COMP.ID_ORDEN) UNIDADES_RESERVAS ');
     SelectSQL.Add(' FROM PRO_ORD COMP ');
     SelectSQL.Add(' LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = COMP.EMPRESA AND ALM.ALMACEN = COMP.ALMACEN_SAL) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = COMP.EMPRESA AND ART.ARTICULO = COMP.COMPUESTO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' COMP.ID_ORDEN = :ID_ORDEN ');

     RefreshSQL.Text := SelectSQL.Text;

     UpdateSQL.Clear;
     if (Situacion = 0) then
     begin
        UpdateSQL.Add(' UPDATE PRO_ORD_RESERVA ');
        UpdateSQL.Add(' SET ');
        UpdateSQL.Add(' UNIDADES = :UNIDADES_RES ');
        UpdateSQL.Add(' WHERE ');
        UpdateSQL.Add(' ID_ORDEN = :ID_ORDEN AND ');
        UpdateSQL.Add(' LINEA_RES = :LINEA_RES ');
     end
     else
     begin
        UpdateSQL.Add(' UPDATE PRO_ORD ');
        UpdateSQL.Add(' SET ');
        UpdateSQL.Add(' UNI_MANUAL = :UNIDADES_RES ');
        UpdateSQL.Add(' WHERE ');
        UpdateSQL.Add(' ID_ORDEN = :ID_ORDEN ');
     end;
     Open;
  end;

  Param_PROMOVS001 := LeeParametro('PROMOVS001');

  // Componentes
  with QMMaterialesLot_Ubi do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIES, MAT.RIG_OF, MAT.SUBORDEN, MAT.LINEA_MAT, MAT.ALMACEN, ');
     SelectSQL.Add('        MAT.COMPONENTE, MAT.ORDEN, MAT.UNIDADES_NEC, UNIDADES_UTIL, MAT.PORCENTAJE, MAT.LINEA_FASE, MAT.PRE_COS_UNI, ');
     SelectSQL.Add('        MAT.TOTAL_VAR, MAT.PRECIO_FIJO, MAT.TOTAL, MAT.PRODUCCION, MAT.MATESC, MAT.ENTRADA, ID_ORDEN, MAT.ID_ORDEN_MAT, ');
     SelectSQL.Add('        MAT.UNIDADES_STOCK, MAT.PRE_COS_UNI_REAL, MAT.ID_MOV_STOCK, MAT.UNIDADES_PREV, ');
     SelectSQL.Add('        PRECIO_FIJO_REAL, MAT.TOTAL_VAR_REAL, MAT.TOTAL_REAL, MAT.NOTAS_MAT, MAT.MEDIDAS, MAT.TIPO_PIEZA, MAT.NUM_PIEZAS, ');
     SelectSQL.Add('        MAT.ID_MOV_STOCK_B, ID_MOV_STOCK_C, MAT.UNIDAD_ART, MAT.UNIDAD_FAB, MAT.ID_EQUIVAL, MAT.COMPRAR, ');
     SelectSQL.Add('        MAT.PROVEEDOR_COMPRA, MAT.MOV_STOCK_COMPRA, MAT.ID_A, MAT.UDS_COMPRA, MAT.RESERVA_STOCK, MAT.N_MOV_STOCK, ');
     SelectSQL.Add('        MAT.MINI_NOTA, MAT.RESULTADO_FORMULA, MAT.FORMULA, MAT.DESACTIVA_TRIGGER, MAT.DES_ALTO, MAT.DES_ANCHO, ');
     SelectSQL.Add('        DES_GRUESO, MAT.ESTADO, MAT.LINEA_TAREA, MAT.ID_DETALLES_ST, MAT.MERMA, MAT.UNIDADES_DEVOLVER, ALMACEN_DEVOLVER, ');
     SelectSQL.Add('        MAT.N_MOV_STOCK_RESERVA, MAT.ALMACEN_SAL, ALM.CTROL_UBICACION, ART.UBICABLE, ART.LOTES, ART.CONTROL_STOCK, ');
     SelectSQL.Add('        ART.TITULO, MAT.ID_LOTE ID_LOTE_MAT, MAT.LOTE LOTE_MAT, MAT.ID_UBICACION, ');
     SelectSQL.Add('        (SELECT SUM(UNIDADES) ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT) UNIDADES_FAB, ');

     SelectSQL.Add('        (SELECT FIRST 1 ID_LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT ');
     SelectSQL.Add('         ORDER BY ID_LOTE) ID_LOTE, ');

     SelectSQL.Add('        (SELECT FIRST 1 LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT ');
     SelectSQL.Add('         ORDER BY ID_LOTE) LOTE, ');

     SelectSQL.Add('        (SELECT COUNT(ID_LOTE) ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT) CANT_LOTE ');
     SelectSQL.Add(' FROM PRO_ORD_MAT MAT ');

     SelectSQL.Add(' LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = MAT.EMPRESA AND ALM.ALMACEN = MAT.ALMACEN) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = MAT.EMPRESA AND ART.ARTICULO = MAT.COMPONENTE) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' MAT.ID_ORDEN = :ID_ORDEN ');

     if (Param_PROMOVS001 = 'S') then
        SelectSQL.Add(' AND ART.CONTROL_STOCK = 1 ');

     RefreshSQL.Text := SelectSQL.Text;
     RefreshSQL.Add(' AND MAT.LINEA_MAT = :LINEA_MAT ');

     SelectSQL.Add(' ORDER BY MAT.ORDEN, MAT.LINEA_MAT ');

     UpdateSQL.Clear;
     UpdateSQL.Add(' UPDATE PRO_ORD_MAT ');
     UpdateSQL.Add(' SET ');
     UpdateSQL.Add(' ID_UBICACION = :ID_UBICACION, ');
     UpdateSQL.Add(' ALMACEN = :ALMACEN, '); // Almacen de lanzamiento
     UpdateSQL.Add(' UNIDADES_DEVOLVER = :UNIDADES_DEVOLVER, ');
     UpdateSQL.Add(' ALMACEN_DEVOLVER = :ALMACEN_DEVOLVER, ');
     UpdateSQL.Add(' MERMA = :MERMA ');
     UpdateSQL.Add(' WHERE ');
     UpdateSQL.Add(' ID_ORDEN = :ID_ORDEN AND ');
     UpdateSQL.Add(' LINEA_MAT = :LINEA_MAT ');

     Open;

     // Busco la MENOR cantidad posible de uniades a fabricar con el stock que tengo
     DisableControls;
     try
        // Inicio con un valor muy grande
        MinUnidadesPosibles := 999999999;
        while not EOF do
        begin
           // Se evitan los que no controla stock
           if (QMMaterialesLot_UbiCONTROL_STOCK.AsInteger = 1) then
           begin
              // Si el valor es menor lo tomo
              if ((QMMaterialesLot_UbiUDS_POSIBLES.AsFloat >= 0) and (MinUnidadesPosibles > QMMaterialesLot_UbiUDS_POSIBLES.AsFloat)) then
                 MinUnidadesPosibles := QMMaterialesLot_UbiUDS_POSIBLES.AsFloat;
           end;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;

  // Serie componente
  QMSerieComponente.Close;
  QMSerieComponente.Open;

  // Serie compuesto
  QMSerieCompuesto.Close;
  QMSerieCompuesto.Open;
end;

procedure TProDMIntroduceDatosCierre.QMCompuestoAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  QMMaterialesLot_Ubi.Close;
  QMMaterialesLot_Ubi.Open;
end;

procedure TProDMIntroduceDatosCierre.QMCompuestoCalcFields(DataSet: TDataSet);
begin
  QMCompuestoTitulo_Ubicacion.AsString := DameTituloUbicacion(QMCompuestoID_UBICACION.AsInteger);
end;

procedure TProDMIntroduceDatosCierre.ActualizaUnidadesDevolucion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_CALC_UNI_DEVOLVER(:ID_ORDEN)';
        Params.ByName['ID_ORDEN'].AsInteger := ProDMOrden.QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMIntroduceDatosCierre.QMMaterialesLot_UbiBeforeOpen(DataSet: TDataSet);
begin
  //Verificamos que no existan cierres parciales abiertos, para evitar errores de calculo en las unidades de devolucion
  if (VerificaSiExiteCierreParciaAbierto) then
     raise Exception.Create(_('No se puede cerrar la O.P. mientras exitan cierres parciales abiertos'))
  else
     ActualizaUnidadesDevolucion;
end;

function TProDMIntroduceDatosCierre.VerificaSiExiteCierreParciaAbierto: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT FIRST 1 CAB.ID ');
        SQL.Add('FROM PRO_ORD_CIERRE_PARCIAL CAB ');
        SQL.Add('JOIN PRO_ORD_CIERRE_PARCIAL_DET DET ON CAB.ID = DET.ID_CIERRE ');
        SQL.Add('WHERE ');
        SQL.Add('DET.ID_ORDEN = :ID_ORDEN AND ');
        SQL.Add('CAB.ESTADO = 0 ');
        Params.ByName['ID_ORDEN'].AsInteger := ProDMOrden.QMProOrdID_ORDEN.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
