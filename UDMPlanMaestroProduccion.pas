unit UDMPlanMaestroProduccion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, UEntorno, HYFIBQuery, Dialogs, FIBDataSetRO, FIBQuery, Controls;

type
  TDMPlanMaestroProduccion = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     DSQMDetalle: TDataSource;
     QMCabeceraID_PLANIFICACION: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraPLANIFICACION: TIntegerField;
     QMCabeceraCOMENTARIO: TBlobField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraFECHA_CREACION: TDateTimeField;
     QMCabeceraFECHA_LANZAMIENTO: TDateTimeField;
     QMCabeceraRESPONSABLE: TIntegerField;
     QMCabeceraAGRUPA_COMPUESTOS: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraCALCULA_STOCK_COMPONENTE: TIntegerField;
     QMCabeceraALMACEN_COMPONENTES: TFIBStringField;
     QMNecesidades: TFIBTableSet;
     DSQMNecesidades: TDataSource;
     QMNecesidadesID_PLANIFICACION_CAB: TIntegerField;
     QMNecesidadesCOMPONENTE: TFIBStringField;
     QMNecesidadesCANTIDAD: TFloatField;
     QMNecesidadesLINEA: TIntegerField;
     QMDetalle: TFIBTableSet;
     QMDetalleID_PLANIFICACION: TIntegerField;
     QMDetalleID_PLANIFICACION_DET: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetallePLANIFICACION: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCOMPUESTO: TFIBStringField;
     QMDetalleID_ESCANDALLO: TIntegerField;
     QMDetalleTIPO_ESCANDALLO: TFIBStringField;
     QMDetalleCANTIDAD_CALCULADA: TFloatField;
     QMDetalleUNIDADES_STOCK: TFloatField;
     QMDetalleCANTIDAD_FABRICAR: TFloatField;
     QMDetalleFABRICAR: TIntegerField;
     QMDetalleOP: TIntegerField;
     QMDetallePRIORIDAD: TIntegerField;
     QMDetalleORDEN_CREACION: TIntegerField;
     QMDetalleID_ORDEN: TIntegerField;
     QMDetalleFECHA_FINALIZACION: TDateTimeField;
     QMDetalleFECHA_CREACION_OP: TDateTimeField;
     QMDetalleID_PEDIDO: TIntegerField;
     QMSuborden: TFIBTableSet;
     DSQMSubOrden: TDataSource;
     QMSubordenID_PLANIFICACION: TIntegerField;
     QMSubordenID_PLANIFICACION_DET: TIntegerField;
     QMSubordenLINEA: TIntegerField;
     QMSubordenID_ESCANDALLO: TIntegerField;
     QMSubordenID_ESCANDALLO_PADRE: TIntegerField;
     QMSubordenCOMPONENTE: TFIBStringField;
     QMSubordenCANTIDAD: TFloatField;
     QMNecesidadesSTOCK: TFloatField;
     QMNecesidadesCANTIDAD_DIF: TFloatField;
     xModelo_: TFIBDataSetRO;
     DSxModelo_: TDataSource;
     xModelo_ID_A_M_C_T: TIntegerField;
     xModelo_ID_A_M: TIntegerField;
     xModelo_COD_MOD: TFIBStringField;
     xModelo_ARTICULO: TFIBStringField;
     QMDetalleCOD_MODELO: TFIBStringField;
     QMDetalleID_ESCANDALLO_FABRICAR: TIntegerField;
     QMNecesidadesPROVEEDOR: TIntegerField;
     QMNecesidadesCOMPRAR: TIntegerField;
     QMNecesidadesREFERENCIA: TFIBStringField;
     QMNecesidadesDescProveedor: TStringField;
     QMNecesidadesDescComponente: TStringField;
     QMNecesidadesID_E_PEDIDO: TIntegerField;
     QMNecesidadesEJERCICIO: TIntegerField;
     QMNecesidadesEMPRESA: TIntegerField;
     QMDetalleLINEA_PED: TIntegerField;
     QMDetalleID_DETALLES_S_PED: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMDetalleDescCompuesto: TStringField;
     QMOPLanzadas: TFIBTableSet;
     DSQMOPLanzadas: TDataSource;
     QMOPLanzadasEMPRESA: TIntegerField;
     QMOPLanzadasEJERCICIO: TIntegerField;
     QMOPLanzadasCANAL: TIntegerField;
     QMOPLanzadasSERIES: TFIBStringField;
     QMOPLanzadasRIG_OF: TIntegerField;
     QMOPLanzadasSUBORDEN: TIntegerField;
     QMOPLanzadasALMACEN_SAL: TFIBStringField;
     QMOPLanzadasALMACEN_LAN: TFIBStringField;
     QMOPLanzadasALMACEN_ENT: TFIBStringField;
     QMOPLanzadasFECHA_ORD: TDateTimeField;
     QMOPLanzadasCLIENTE: TIntegerField;
     QMOPLanzadasCOMPUESTO: TFIBStringField;
     QMOPLanzadasESCANDALLO: TIntegerField;
     QMOPLanzadasESTADO: TIntegerField;
     QMOPLanzadasPEDIDO: TIntegerField;
     QMOPLanzadasLINEA_PED: TIntegerField;
     QMOPLanzadasFECHA_PED: TDateTimeField;
     QMOPLanzadasUNI_PEDID: TFloatField;
     QMOPLanzadasUNI_MANUAL: TFloatField;
     QMOPLanzadasUNI_TOTAL: TFloatField;
     QMOPLanzadasPRIORIDAD: TIntegerField;
     QMOPLanzadasMERMA: TFloatField;
     QMOPLanzadasUNI_PRODUC: TFloatField;
     QMOPLanzadasUNI_PENDIENTES: TFloatField;
     QMOPLanzadasFECHA_ENTREGA: TDateTimeField;
     QMOPLanzadasFECHA_INI: TDateTimeField;
     QMOPLanzadasFECHA_FIN: TDateTimeField;
     QMOPLanzadasCOSTE_FIJO_PRE: TFloatField;
     QMOPLanzadasCOSTE_VAR_PRE: TFloatField;
     QMOPLanzadasCOSTE_MAT_PRE: TFloatField;
     QMOPLanzadasCOSTE_MO_PRE: TFloatField;
     QMOPLanzadasCOSTE_MAQ_PRE: TFloatField;
     QMOPLanzadasCOSTE_TEX_PRE: TFloatField;
     QMOPLanzadasCOSTE_TOT_PRE: TFloatField;
     QMOPLanzadasCOSTE_FIJO_REAL: TFloatField;
     QMOPLanzadasCOSTE_VAR_REAL: TFloatField;
     QMOPLanzadasCOSTE_MAT_REAL: TFloatField;
     QMOPLanzadasCOSTE_MO_REAL: TFloatField;
     QMOPLanzadasCOSTE_MAQ_REAL: TFloatField;
     QMOPLanzadasCOSTE_TEX_REAL: TFloatField;
     QMOPLanzadasCOSTE_TOT_REAL: TFloatField;
     QMOPLanzadasCOSTE_UNITARIO: TFloatField;
     QMOPLanzadasPRECIO_VENTA: TFloatField;
     QMOPLanzadasHORAS_TOTALES: TFloatField;
     QMOPLanzadasMARGEN_UNI: TFloatField;
     QMOPLanzadasMARGEN_TOTAL: TFloatField;
     QMOPLanzadasOBSERVACIONES: TMemoField;
     QMOPLanzadasVISTOBUENO1: TIntegerField;
     QMOPLanzadasVISTOBUENO2: TIntegerField;
     QMOPLanzadasVISTOBUENO3: TIntegerField;
     QMOPLanzadasSITUACION: TIntegerField;
     QMOPLanzadasMARGEN_UNI_CIEN: TFloatField;
     QMOPLanzadasENTRADA: TIntegerField;
     QMOPLanzadasID_ORDEN: TIntegerField;
     QMOPLanzadasTIPO_LANZAMIENTO: TIntegerField;
     QMOPLanzadasID_ORDEN_MAT: TIntegerField;
     QMOPLanzadasTIPO_RESERVA: TIntegerField;
     QMOPLanzadasID_MOV_STOCK: TIntegerField;
     QMOPLanzadasISO_APROBADO: TIntegerField;
     QMOPLanzadasISO_VERIFICADO: TIntegerField;
     QMOPLanzadasISO_VALIDADO: TIntegerField;
     QMOPLanzadasID_A: TIntegerField;
     QMOPLanzadasPADRE_SUBORDEN: TIntegerField;
     QMOPLanzadasCONT_SUBORDEN: TIntegerField;
     QMOPLanzadasREFERENCIA: TFIBStringField;
     QMOPLanzadasCOSTE_COMPRAS: TFloatField;
     QMOPLanzadasHORAS_OPERARIO: TFloatField;
     QMOPLanzadasHORAS_MAQUINA: TFloatField;
     QMOPLanzadasID_DESPIECE: TIntegerField;
     QMOPLanzadasID_ORDEN_SUBORDEN: TIntegerField;
     QMOPLanzadasSELECCIONADA: TIntegerField;
     QMOPLanzadasPREVALECE_ALM_ORDEN: TIntegerField;
     QMOPLanzadasCERRAR_SUBORDENES: TIntegerField;
     QMOPLanzadasIMPORTAR_OP: TIntegerField;
     QMOPLanzadasCASO_OP: TIntegerField;
     QMOPLanzadasRESERVA_STOCK_OP: TIntegerField;
     QMOPLanzadasMEDIDA_1: TFloatField;
     QMOPLanzadasMEDIDA_2: TFloatField;
     QMOPLanzadasMEDIDA_3: TFloatField;
     QMOPLanzadasMEDIDA_4: TFloatField;
     QMOPLanzadasDESACTIVA_TRIGGER: TIntegerField;
     QMOPLanzadasRESPONSABLE: TIntegerField;
     QMOPLanzadasDIF_COSTE_FIJO: TFloatField;
     QMOPLanzadasDIF_COSTE_MAT: TFloatField;
     QMOPLanzadasDIF_COSTE_MO: TFloatField;
     QMOPLanzadasDIF_COSTE_MAQ: TFloatField;
     QMOPLanzadasDIF_COSTE_TEXT: TFloatField;
     QMOPLanzadasDIF_COSTE_VAR: TFloatField;
     QMOPLanzadasCOSTE_COMPRAS_PRE: TFloatField;
     QMOPLanzadasDIF_COSTE_COMPRAS: TFloatField;
     QMOPLanzadasDIF_COSTE_TOTAL: TFloatField;
     QMOPLanzadasCOMPUESTOS_VIRTUALES: TIntegerField;
     QMOPLanzadasSEGUIR_SIN_STOCK: TIntegerField;
     QMOPLanzadasMARGEN_TOTAL_PRE: TFloatField;
     QMOPLanzadasMARGEN_UNI_CIEN_PRE: TFloatField;
     QMOPLanzadasCOSTE_UNITARIO_PRE: TFloatField;
     QMOPLanzadasMARGEN_UNI_PRE: TFloatField;
     QMOPLanzadasPRECIO_VENTA_PRE: TFloatField;
     QMOPLanzadasPRECIO_VENTA_TOT_PRE: TFloatField;
     QMOPLanzadasPRECIO_VENTA_TOT_REAL: TFloatField;
     QMOPLanzadasDIF_COSTE_MARGEN_TOTAL: TFloatField;
     QMOPLanzadasDIF_MARGEN_TOTAL: TFloatField;
     QMOPLanzadasDIF_MARGEN_UNI_CIEN: TFloatField;
     QMOPLanzadasDIF_PRECIO_VENTA_UNI: TFloatField;
     QMOPLanzadasDIF_COSTE_UNI: TFloatField;
     QMOPLanzadasDIF_MARGEN_UNI: TFloatField;
     QMOPLanzadasDIF_PRECIO_VENTA_TOT: TFloatField;
     QMOPLanzadasHORAS_OPERARIO_PRE: TFloatField;
     QMOPLanzadasHORAS_MAQUINA_PRE: TFloatField;
     QMOPLanzadasDIF_HORAS_MAQUINA: TFloatField;
     QMOPLanzadasDIF_HORAS_OPERARIO: TFloatField;
     QMOPLanzadasRECUPERADO_MARCAJE: TIntegerField;
     QMOPLanzadasUNI_FABRICADAS: TFloatField;
     QMOPLanzadasPLANIFICACION: TIntegerField;
     QMOPLanzadasLINEA_PLANIFICACION: TIntegerField;
     QMOPLanzadasID_PLANIFICACION: TIntegerField;
     QMOPLanzadasID_PLANIFICACION_DET: TIntegerField;
     QMOPLanzadasID_LOTE: TIntegerField;
     QMOPLanzadasID_UBICACION: TIntegerField;
     QMOPLanzadasID_MOV_STOCK_RESERVA: TIntegerField;
     QMOPLanzadasDESC_LOTE: TFIBStringField;
     QMOPLanzadasUNIDAD: TFIBStringField;
     QMOPLanzadasCOSTE_MERMA_PRE: TFloatField;
     QMOPLanzadasCOSTE_MERMA_REAL: TFloatField;
     QMOPLanzadasDIF_COSTE_MERMA: TFloatField;
     QMOPLanzadasCOPIAS_PMP: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMDetalleUNI_PENDIENTES_OP: TFloatField;
     QMDetalleUNI_PEDIDOS_PEND: TFloatField;
     QMOPLanzadasDescSituacion: TStringField;
     QMDetalleSTOCK_MINIMO: TFloatField;
     QMDetalleLOTE_OPTIMO: TFloatField;
     QMNecesidadesUNI_PEND_RECIBIR: TFloatField;
     QMNecesidadesUNI_PEND_FABRICAR: TFloatField;
     QMDetalleRIG_PEDIDO: TIntegerField;
     QMCabeceraALMACEN_NECESIDADES: TFIBStringField;
     QMOPLanzadasTITULO: TFIBStringField;
     QMOPLanzadasVERSION_ORDEN: TFIBStringField;
     QMOPLanzadasTITULO_CLIENTE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleCOMPUESTOChange(Sender: TField);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMDetalleCANTIDAD_CALCULADAChange(Sender: TField);
     procedure QMNecesidadesCOMPONENTEChange(Sender: TField);
     procedure QMNecesidadesPROVEEDORChange(Sender: TField);
     procedure QMNecesidadesNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforeEdit(DataSet: TDataSet);
     procedure xOPLanzadas_DescCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOPLanzadasBeforeDelete(DataSet: TDataSet);
     procedure QMOPLanzadasDescSituacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMNecesidadesCalcFields(DataSet: TDataSet); //sfg.albert
  private
     { Private declarations }
     SQLFind: string;
     procedure DameEscandallo(compuesto: string; var Tipo_Esc: string; var Id_Escandallo: integer);
  public
     { Public declarations }
     function DameTituloTipoPlanificacion(Tipo: integer): string;
     function DameTituloEstado(Estado: integer): string;
     procedure CambiaEstado(Estado: integer);
     procedure EjecutaPlanificacion;
     procedure ActualizaStockArticulo;
     procedure GenerarNecesidades; //sfg.albert
     procedure GenerarSubordenes; //sfg.albert
     procedure GenerarPedidoCompra; //sfg.albert
     function ComprobarCierrePMP_OP: boolean; //sfg.albert
     procedure ProcesoGenerarOP; //sfg.albert - Agrupa tots els procvessos per llançar la OP
     procedure CierrePMP; //sfg.albert
     function PorFabricar(id_planificacion: integer): integer; //sfg.albert
     function BusquedaCompleja: integer; //sfg.albert
     procedure CreacionOP; //sfg.albert
     procedure LanzarOP(id_planificacion: integer);  //sfg.albert
     procedure DesLanzarOP(id_planificacion: integer);
     procedure ReservarOP;  // sfg.albert
     procedure DesReservarOP;
     procedure CerrarOP;
  end;

var
  DMPlanMaestroProduccion : TDMPlanMaestroProduccion;

implementation

uses UDMMain, UDameDato, UFBusca, UFMSeleccion;

{$R *.dfm}

procedure TDMPlanMaestroProduccion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDetalleFECHA_CREACION_OP.DisplayFormat := ShortDateFormat;
  QMDetalleFECHA_FINALIZACION.DisplayFormat := ShortDateFormat;
  QMOPLanzadasFECHA_ENTREGA.DisplayFormat := ShortDateFormat;
  QMOPLanzadasFECHA_ORD.DisplayFormat := ShortDateFormat;
  QMNecesidadesCANTIDAD.DisplayFormat := MascaraN;
  QMOPLanzadasUNI_TOTAL.DisplayFormat := MascaraN;
  QMDetalleCANTIDAD_CALCULADA.DisplayFormat := MascaraN;
  QMDetalleCANTIDAD_FABRICAR.DisplayFormat := MascaraN;
  QMDetalleUNIDADES_STOCK.DisplayFormat := MascaraN;
  QMNecesidadesCANTIDAD_DIF.DisplayFormat := MascaraN;
  QMDetalleUNI_PENDIENTES_OP.DisplayFormat := MascaraN;
  QMDetalleUNI_PEDIDOS_PEND.DisplayFormat := MascaraN;
  QMDetalleSTOCK_MINIMO.DisplayFormat := MascaraN;
  QMDetalleLOTE_OPTIMO.DisplayFormat := MascaraN;
  QMNecesidadesUNI_PEND_FABRICAR.DisplayFormat := MascaraN;
  QMNecesidadesUNI_PEND_RECIBIR.DisplayFormat := MascaraN;
  QMNecesidadesSTOCK.DisplayFormat := MascaraN;

  SQLFind := QMCabecera.SelectSQL.Text;
  QMCabecera.SelectSQL.Add(' ORDER BY PLANIFICACION ');

  DMMain.FiltraTabla(QMCabecera, '111100', True);
end;

procedure TDMPlanMaestroProduccion.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

function TDMPlanMaestroProduccion.DameTituloTipoPlanificacion(Tipo: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM SYS_TIPO_PMP WHERE TIPO=?TIPO';
        Params.ByName['TIPO'].AsInteger := Tipo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMPlanMaestroProduccion.DameTituloEstado(Estado: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text :=
           'SELECT TITULO FROM SYS_ESTADO_PMP WHERE ESTADO = ?ESTADO ';
        Params.ByName['ESTADO'].AsInteger := Estado;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPlanMaestroProduccion.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraID_PLANIFICACION.AsInteger := 0;
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraPLANIFICACION.AsInteger := 0;
  QMCabeceraFECHA_CREACION.AsDateTime := REntorno.FechaTrab;
  QMCabeceraFECHA_LANZAMIENTO.AsDateTime := REntorno.FechaTrab;
  QMCabeceraAGRUPA_COMPUESTOS.AsInteger := 0;
  QMCabeceraESTADO.AsInteger := 0;
  QMCabeceraCALCULA_STOCK_COMPONENTE.AsInteger := 0;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraTIPO.AsString := '1';
  QMCabeceraSERIE.AsString := REntorno.Serie;
  QMCabeceraALMACEN_COMPONENTES.AsString := DMMain.DameAlmacenDocumento('PEC', QMCabeceraSERIE.AsString);
  QMCabeceraALMACEN_NECESIDADES.AsString := DMMain.DameAlmacenDocumento('PEP', QMCabeceraSERIE.AsString);
end;

procedure TDMPlanMaestroProduccion.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  QMNecesidades.Open;
  QMSuborden.Open;
  QMOPLanzadas.Open;
end;

procedure TDMPlanMaestroProduccion.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMOPLanzadas.Close;
  QMSuborden.Close;
  QMNecesidades.Close;
  QMDetalle.Close;
end;

procedure TDMPlanMaestroProduccion.CambiaEstado(Estado: integer);
begin
  if ((not QMCabecera.IsEmpty) and (QMCabecera.Active)) then
  begin
     if ((Estado = -1) and (QMCabeceraESTADO.AsInteger > 0)) or
        ((Estado = 1) and (QMCabeceraESTADO.AsInteger < 4)) then
     begin
        QMCabecera.Edit;
        QMCabeceraESTADO.AsInteger := QMCabeceraESTADO.AsInteger + Estado;
        QMCabecera.Post;
     end;
  end;

  if (Estado > 0) then
  begin
     case QMCabeceraESTADO.AsInteger of
        1: EjecutaPlanificacion;
        3: ProcesoGenerarOP;
        4: CierrePMP;
     end;
  {
  end
  else
  begin
    case QMCabeceraESTADO.AsInteger of
       1: EjecutaPlanificacion;
       3: ProcesoGenerarOP;
       4: CierrePMP;
    end;
  }
  end;
end;

procedure TDMPlanMaestroProduccion.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMCabeceraID_PLANIFICACION.AsInteger := DMMain.Contador_Gen(DataSet, 'ID_PRO_PMP_CAB', 'ID_PLANIFICACION');
     QMCabeceraPLANIFICACION.AsInteger := DMMain.Contador_EC('PLA');
  end;
end;

procedure TDMPlanMaestroProduccion.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := QMCabeceraEmpresa.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCanal.AsInteger;
  QMDetalleID_PLANIFICACION.AsInteger := QMCabeceraID_Planificacion.AsInteger;
  QMDetalleID_PLANIFICACION_DET.AsInteger := 0;
  QMDetallePLANIFICACION.AsInteger := QMCabeceraPlanificacion.AsInteger;
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente('PLA', QMCabeceraID_PLANIFICACION.AsInteger);
  QMDetalleID_ESCANDALLO.AsInteger := 0;
  QMDetalleTIPO_ESCANDALLO.AsInteger := 0;
  QMDetalleCANTIDAD_CALCULADA.AsFloat := 0;
  QMDetalleUNIDADES_STOCK.AsFloat := 0;
  QMDetalleCANTIDAD_FABRICAR.AsFloat := 0;
  QMDetalleFABRICAR.AsInteger := 0;
  QMDetalleOP.AsInteger := 0;
  QMDetallePRIORIDAD.AsInteger := 0;
  QMDetalleORDEN_CREACION.AsInteger := 0;
end;

procedure TDMPlanMaestroProduccion.EjecutaPlanificacion;
begin
  if (QMCabeceraTIPO.AsString > '0') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_PROPONE_PMP (:EMPRESA, :CANAL, :ALMACEN, :PLANIFIACION)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN_COMPONENTES.AsString;
           Params.ByName['PLANIFIACION'].AsInteger := QMCabeceraPLANIFICACION.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;
  end
  else
     ShowMessage(_('El tipo de PMP no puede ser 0 para generar una planificacion'));
end;

procedure TDMPlanMaestroProduccion.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if (QMCabeceraESTADO.AsInteger > 2) then
  begin
     QMDetalle.Cancel;
     ShowMessage(_('El registro no puede ser modificado, para este Plan Maestro'));
  end;
end;

procedure TDMPlanMaestroProduccion.DameEscandallo(compuesto: string; var Tipo_Esc: string; var Id_Escandallo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_ESC, ESCANDALLO, TIPO FROM PRO_ESCANDALLO WHERE ESTADO = 1 AND EMPRESA = :EMPRESA AND COMPUESTO = :COMPUESTO ORDER BY DEFECTO DESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPUESTO'].AsString := Compuesto;
        ExecQuery;
        Id_Escandallo := FieldByName['ESCANDALLO'].AsInteger;
        Tipo_Esc := FieldByName['TIPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPlanMaestroProduccion.QMDetalleCOMPUESTOChange(Sender: TField);
var
  Id_Escandallo : integer;
  Tipo_Esc : string;
begin
  DameEscandallo(QMDetalleCOMPUESTO.AsString, Tipo_Esc, Id_Escandallo);
  QMDetalleTipo_Escandallo.AsString := Tipo_Esc;
  QMDetalleID_Escandallo.AsInteger := Id_Escandallo;
  QMDetalleID_ESCANDALLO_FABRICAR.AsInteger := ID_Escandallo;
end;

procedure TDMPlanMaestroProduccion.QMDetalleAfterPost(DataSet: TDataSet);
begin
  {Todo: Pasar esto a trigger}
  {Esto debe ir por trigger
  if (QMCabeceraESTADO.AsInteger = 1) then
  begin
     QMCabecera.Edit;
     QMCabeceraESTADO.AsInteger := 2;
     QMCabecera.Post;
  end;}
end;

procedure TDMPlanMaestroProduccion.ActualizaStockArticulo;
begin
  if (not QMDetalle.IsEmpty) and (QMCabeceraESTADO.AsInteger < 3) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_ACTUALIZA_STOCK(:EMPRESA, :CANAL, :PLANIFICACION, :ALMACEN)';
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEmpresa.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCanal.AsInteger;
           Params.ByName['PLANIFICACION'].AsInteger := QMDetallePlanificacion.AsInteger;
           Params.ByName['ALMACEN'].AsString := QMCabeceraAlmacen_Componentes.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;
  end;
end;

procedure TDMPlanMaestroProduccion.GenerarNecesidades;
begin
  QMNecesidades.Close;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_CALCULAR_NECESIDADES(:ID_PLANIFICACION_CAB, :SERIE)';
        Params.ByName['ID_PLANIFICACION_CAB'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMNecesidades.Open;
end;

procedure TDMPlanMaestroProduccion.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  // xModelo.Open;
end;

procedure TDMPlanMaestroProduccion.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  // xModelo.Close;
end;

procedure TDMPlanMaestroProduccion.GenerarSubordenes;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_CALC_SUBORDENES(:ID_PLANIFICACION_CAB)';
        Params.ByName['ID_PLANIFICACION_CAB'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMSuborden.Close;
  QMSuborden.Open;

  ShowMessage(_('Se han generado las subordenes correctamente'));
end;

procedure TDMPlanMaestroProduccion.QMDetalleCANTIDAD_CALCULADAChange(Sender: TField);
begin
  QMDetalleCANTIDAD_FABRICAR.AsFloat := QMDetalleCANTIDAD_CALCULADA.AsFloat;
end;

procedure TDMPlanMaestroProduccion.QMNecesidadesCOMPONENTEChange(Sender: TField);
begin
  QMNecesidadesDescComponente.AsString := DameTituloArticulo(QMNecesidadesCOMPONENTE.AsString);
end;

procedure TDMPlanMaestroProduccion.QMNecesidadesPROVEEDORChange(Sender: TField);
begin
  QMNecesidadesDescProveedor.AsString := DameTituloProveedor(QMNecesidadesPROVEEDOR.AsInteger);
end;

procedure TDMPlanMaestroProduccion.GenerarPedidoCompra;
var
  Contador : integer;
begin
  if (QMNecesidades.State = dsEdit) then
     QMNecesidades.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_GENERAR_PEDIDO_PMP(:ID_PLANIFICACION_CAB)';
        Params.ByName['ID_PLANIFICACION_CAB'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        ExecQuery;
        Contador := FieldByName['CONTADOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;

  ShowMessage(Format(_('Se han generado %d pedidos de compra correctamente'), [Contador]));
end;

procedure TDMPlanMaestroProduccion.QMNecesidadesNewRecord(DataSet: TDataSet);
begin
  QMNecesidadesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMNecesidadesEMPRESA.AsInteger := REntorno.Empresa;
end;

function TDMPlanMaestroProduccion.ComprobarCierrePMP_OP: boolean;
var
  OP_abierta, Situacion : integer;
begin
  // Inicializo
  Result := False; // existen OP abiertas

  op_abierta := 0;
  if (QMOPLanzadas.Active = False) then
     QMOPLanzadas.Open;
  QMOPLanzadas.DisableControls;
  try
     QMOPLanzadas.First;

     while not (QMOPLanzadas.EOF) do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT SITUACION FROM PRO_ORD WHERE ID_ORDEN = :ID_ORDEN';
              Params.ByName['ID_ORDEN'].AsInteger := QMOPLanzadasID_ORDEN.AsInteger;
              ExecQuery;
              Situacion := FieldByName['SITUACION'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Situacion < 4) then
           op_abierta := 1
        else
        begin
           if (op_abierta = 0) then
              op_abierta := 2;
        end;

        QMOPLanzadas.Next;
     end;

     if (op_abierta = 1) then
        Result := False // existen OP abiertas
     else if (op_abierta = 2) then
        Result := True; // OP cerradas
  finally
     QMOPLanzadas.EnableControls;
  end;
end;

procedure TDMPlanMaestroProduccion.QMCabeceraBeforeEdit(DataSet: TDataSet);
begin
  if (QMCabeceraESTADO.AsInteger = 4) then
  begin
     ShowMessage(_('PMP cerrada. No es posible su modificacion'));
     abort;
  end;
end;

procedure TDMPlanMaestroProduccion.xOPLanzadas_DescCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMOPLanzadasCOMPUESTO.AsString);
end;

procedure TDMPlanMaestroProduccion.ProcesoGenerarOP;
begin
  // OP
  if (PorFabricar(QMCabeceraID_PLANIFICACION.AsInteger) = 0) then
     ShowMessage(_('Debe marcar alguna linea a fabricar'))
  else
  begin
     CreacionOP;

     // Lanzar OP
     LanzarOP(QMCabeceraID_PLANIFICACION.AsInteger);

     // Necesidades
     if (QMCabeceraESTADO.AsInteger = 3) then
        if (QMNecesidades.RecordCount = 0) then // Si no hi ha necessitats generades per aquest PMP
           GenerarNecesidades
        else
           ShowMessage(_('Ya se han generado las necesidades para esta PMP'))
     else
        ShowMessage(_('OP no generada. No es posible generar necesidades'));

     QMCabecera.Refresh;
  end;
end;

procedure TDMPlanMaestroProduccion.CierrePMP;
begin
  if (ComprobarCierrePMP_OP = True) then
  begin
     QMCabecera.Edit;
     QMCabeceraESTADO.AsInteger := 4;
     QMCabecera.Post;
  end
  else
     ShowMessage(_('No se puede cerrar el PMP porque no se han generado órdenes o hay alguna no cerrada.'));
end;

procedure TDMPlanMaestroProduccion.QMOPLanzadasBeforeDelete(DataSet: TDataSet);
begin
  QMOPLanzadas.Cancel;
end;

function TDMPlanMaestroProduccion.PorFabricar(id_planificacion: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM PRO_PMP_DET WHERE ID_PLANIFICACION = :ID_PLANIFICACION AND FABRICAR = 1';
        Params.ByName['ID_PLANIFICACION'].AsInteger := id_planificacion;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMPlanMaestroProduccion.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '11110');
  if (Result = mrAll) then
  begin
     with QMCabecera do
     begin
        Close;
        SelectSQL.Text := SQLFind;
        SelectSQL.Add(' ORDER BY PLANIFICACION ');
        DMMain.FiltraTabla(QMCabecera, '11110', True);
     end;
  end;
end;

procedure TDMPlanMaestroProduccion.QMOPLanzadasDescSituacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloSituacionProduccion(QMOPLanzadasSITUACION.AsInteger);
end;

procedure TDMPlanMaestroProduccion.CreacionOP;
begin
  if ((not QMDetalle.IsEmpty) and (QMCabeceraESTADO.AsInteger <= 3)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_ORDEN (:ID_PLANIFICACION, :ENTRADA)';
           Params.ByName['ID_PLANIFICACION'].AsInteger := QMDetalleID_PLANIFICACION.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;
  end;
end;

procedure TDMPlanMaestroProduccion.LanzarOP(id_planificacion: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_LANZAR_OP(:ID_PLANIFICACION, :ENTRADA, :FECHA)';
        Params.ByName['ID_PLANIFICACION'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := Now;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPlanMaestroProduccion.DesLanzarOP(id_planificacion: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_DESLANZAR_OP(:ID_PLANIFICACION, :ENTRADA)';
        Params.ByName['ID_PLANIFICACION'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
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
        SQL.Text := 'SELECT COUNT(*) FROM PRO_PMP_DET P JOIN PRO_ORD O ON P.ID_ORDEN = O.ID_ORDEN WHERE P.ID_PLANIFICACION = :ID_PLANIFICACION AND SITUACION > 0';
        Params.ByName['ID_PLANIFICACION'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        ExecQuery;
        if (FieldByName['COUNT'].AsInteger = 0) then
        begin
           QMCabecera.Edit;
           QMCabeceraESTADO.AsInteger := 1;
           QMCabecera.Post;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPlanMaestroProduccion.ReservarOP;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_RESERVAR_OP(:EMPRESA, :EJERCICIO,  :CANAL, :SERIE, :ID_PLANIFICACION, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['ID_PLANIFICACION'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPlanMaestroProduccion.DesReservarOP;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_PMP_DESRESERVAR_OP(:EMPRESA, :EJERCICIO,  :CANAL, :SERIE, :ID_PLANIFICACION, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['ID_PLANIFICACION'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPlanMaestroProduccion.CerrarOP;
var
  FechaFin : TDateTime;
begin
  // FECHA_FIN se utilizará para hacer los movimientos de stock de cierre y devolucion
  FechaFin := REntorno.FechaTrab;

  if (PideDato('DTM', FechaFin, 'Fecha de Cierre')) then
  begin
     try
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE PRO_PMP_CERRAR_OP (:ID_PLANIFICACION, :ENTRADA, :FECHA) ');
              Params.ByName['ID_PLANIFICACION'].AsInteger := QMCabeceraID_PLANIFICACION.AsInteger;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['FECHA'].AsDateTime := FechaFin; // REntorno.FechaTrab
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     except
        on E: Exception do
        begin
           ShowMessage(_('Ha ocurrido un error al cerrar la orden de produccion.') + #13#10 + E.Message);
        end;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPlanMaestroProduccion.QMDetalleCalcFields(DataSet: TDataSet);
begin
  QMDetalleDescCompuesto.AsString := DameTituloArticulo(QMDetalleCOMPUESTO.AsString);
end;

procedure TDMPlanMaestroProduccion.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
end;

procedure TDMPlanMaestroProduccion.QMNecesidadesCalcFields(DataSet: TDataSet);
begin
  QMNecesidadesDescProveedor.AsString := DameTituloProveedor(QMNecesidadesPROVEEDOR.AsInteger);
  QMNecesidadesDescComponente.AsString := DameTituloArticulo(QMNecesidadesCOMPONENTE.AsString);
end;

end.
