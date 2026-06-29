unit UProDMLstOrdenDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_Class, Fr_HYReport, DB, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery,
  FR_DSet, FR_DBSet;

type
  TProDMLstOrdenDet = class(TDataModule)
     TLocal: THYTransaction;
     xMinCompuestoD: TFIBDataSetRO;
     DSxMaxCompuestoD: TDataSource;
     xMaxCompuestoH: TFIBDataSetRO;
     DSxMaxCompuestoH: TDataSource;
     frListadoOrdenDet: TfrHYReport;
     QMLstOrdenes: TFIBDataSetRO;
     DSLstOrdenes: TDataSource;
     QGeneral: THYFIBQuery;
     xTituloCompuestoD: TFIBDataSetRO;
     DSxTituloCompuestoD: TDataSource;
     xTituloCompuestoDTITULO: TFIBStringField;
     xTituloClienteD: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxTituloClienteD: TDataSource;
     xMinClienteD: TFIBDataSetRO;
     DSxMinClienteD: TDataSource;
     xMaxClienteH: TFIBDataSetRO;
     DSxMaxClienteH: TDataSource;
     xMinClienteDMIN_D: TIntegerField;
     xMaxClienteHMAX_H: TIntegerField;
     xTituloCompuestoH: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     DSxTituloCompuestoH: TDataSource;
     xTituloClienteH: TFIBDataSetRO;
     FIBStringField3: TFIBStringField;
     DSxTituloClienteH: TDataSource;
     xFechaD: TFIBDataSetRO;
     DSxFechaD: TDataSource;
     xFechaH: TFIBDataSetRO;
     DSxFechaH: TDataSource;
     xFechaDMIN_D: TDateTimeField;
     xFechaHMAX_H: TDateTimeField;
     QMLstOrdenesEMPRESA: TIntegerField;
     QMLstOrdenesEJERCICIO: TIntegerField;
     QMLstOrdenesCANAL: TIntegerField;
     QMLstOrdenesSERIES: TFIBStringField;
     QMLstOrdenesRIG_OF: TIntegerField;
     QMLstOrdenesSUBORDEN: TIntegerField;
     QMLstOrdenesALMACEN_SAL: TFIBStringField;
     QMLstOrdenesALMACEN_LAN: TFIBStringField;
     QMLstOrdenesALMACEN_ENT: TFIBStringField;
     QMLstOrdenesFECHA_ORD: TDateTimeField;
     QMLstOrdenesCLIENTE: TIntegerField;
     QMLstOrdenesCOMPUESTO: TFIBStringField;
     QMLstOrdenesESCANDALLO: TIntegerField;
     QMLstOrdenesESTADO: TIntegerField;
     QMLstOrdenesPEDIDO: TIntegerField;
     QMLstOrdenesLINEA_PED: TIntegerField;
     QMLstOrdenesFECHA_PED: TDateTimeField;
     QMLstOrdenesUNI_PEDID: TFloatField;
     QMLstOrdenesUNI_MANUAL: TFloatField;
     QMLstOrdenesUNI_TOTAL: TFloatField;
     QMLstOrdenesPRIORIDAD: TIntegerField;
     QMLstOrdenesMERMA: TFloatField;
     QMLstOrdenesUNI_PRODUC: TFloatField;
     QMLstOrdenesUNI_PENDIENTES: TFloatField;
     QMLstOrdenesFECHA_ENTREGA: TDateTimeField;
     QMLstOrdenesFECHA_INI: TDateTimeField;
     QMLstOrdenesFECHA_FIN: TDateTimeField;
     QMLstOrdenesCOSTE_FIJO_PRE: TFloatField;
     QMLstOrdenesCOSTE_VAR_PRE: TFloatField;
     QMLstOrdenesCOSTE_MAT_PRE: TFloatField;
     QMLstOrdenesCOSTE_MO_PRE: TFloatField;
     QMLstOrdenesCOSTE_MAQ_PRE: TFloatField;
     QMLstOrdenesCOSTE_TEX_PRE: TFloatField;
     QMLstOrdenesCOSTE_TOT_PRE: TFloatField;
     QMLstOrdenesCOSTE_FIJO_REAL: TFloatField;
     QMLstOrdenesCOSTE_VAR_REAL: TFloatField;
     QMLstOrdenesCOSTE_MAT_REAL: TFloatField;
     QMLstOrdenesCOSTE_MO_REAL: TFloatField;
     QMLstOrdenesCOSTE_MAQ_REAL: TFloatField;
     QMLstOrdenesCOSTE_TEX_REAL: TFloatField;
     QMLstOrdenesCOSTE_TOT_REAL: TFloatField;
     QMLstOrdenesCOSTE_UNITARIO: TFloatField;
     QMLstOrdenesPRECIO_VENTA: TFloatField;
     QMLstOrdenesHORAS_TOTALES: TFloatField;
     QMLstOrdenesMARGEN_UNI: TFloatField;
     QMLstOrdenesMARGEN_TOTAL: TFloatField;
     QMLstOrdenesOBSERVACIONES: TMemoField;
     QMLstOrdenesVISTOBUENO1: TIntegerField;
     QMLstOrdenesVISTOBUENO2: TIntegerField;
     QMLstOrdenesVISTOBUENO3: TIntegerField;
     QMLstOrdenesSITUACION: TIntegerField;
     QMLstOrdenesMARGEN_UNI_CIEN: TFloatField;
     QMLstOrdenesENTRADA: TIntegerField;
     QMLstOrdenesID_ORDEN: TIntegerField;
     QMLstOrdenesTIPO_LANZAMIENTO: TIntegerField;
     QMLstOrdenesID_ORDEN_MAT: TIntegerField;
     QMLstOrdenesTIPO_RESERVA: TIntegerField;
     QMLstOrdenesID_MOV_STOCK: TIntegerField;
     QMLstOrdenesISO_APROBADO: TIntegerField;
     QMLstOrdenesISO_VERIFICADO: TIntegerField;
     QMLstOrdenesISO_VALIDADO: TIntegerField;
     QMLstOrdenesID_A: TIntegerField;
     QMLstOrdenesPADRE_SUBORDEN: TIntegerField;
     QMLstOrdenesCONT_SUBORDEN: TIntegerField;
     QMLstOrdenesREFERENCIA: TFIBStringField;
     QMLstOrdenesCOSTE_COMPRAS: TFloatField;
     QMLstOrdenesHORAS_OPERARIO: TFloatField;
     QMLstOrdenesHORAS_MAQUINA: TFloatField;
     QMLstOrdenesID_DESPIECE: TIntegerField;
     QMLstOrdenesID_ORDEN_SUBORDEN: TIntegerField;
     QMLstOrdenesSELECCIONADA: TIntegerField;
     QMLstOrdenesPREVALECE_ALM_ORDEN: TIntegerField;
     QMLstOrdenesCERRAR_SUBORDENES: TIntegerField;
     QMLstOrdenesIMPORTAR_OP: TIntegerField;
     QMLstOrdenesCASO_OP: TIntegerField;
     QMLstOrdenesRESERVA_STOCK_OP: TIntegerField;
     QMLstOrdenesMEDIDA_1: TFloatField;
     QMLstOrdenesMEDIDA_2: TFloatField;
     QMLstOrdenesMEDIDA_3: TFloatField;
     QMLstOrdenesMEDIDA_4: TFloatField;
     QMLstOrdenesDESACTIVA_TRIGGER: TIntegerField;
     QMLstOrdenesRESPONSABLE: TIntegerField;
     QMLstOrdenesDIF_COSTE_FIJO: TFloatField;
     QMLstOrdenesDIF_COSTE_MAT: TFloatField;
     QMLstOrdenesDIF_COSTE_MO: TFloatField;
     QMLstOrdenesDIF_COSTE_MAQ: TFloatField;
     QMLstOrdenesDIF_COSTE_TEXT: TFloatField;
     QMLstOrdenesDIF_COSTE_VAR: TFloatField;
     QMLstOrdenesCOSTE_COMPRAS_PRE: TFloatField;
     QMLstOrdenesDIF_COSTE_COMPRAS: TFloatField;
     QMLstOrdenesDIF_COSTE_TOTAL: TFloatField;
     QMLstOrdenesCOMPUESTOS_VIRTUALES: TIntegerField;
     QMLstOrdenesSEGUIR_SIN_STOCK: TIntegerField;
     QMLstOrdenesMARGEN_TOTAL_PRE: TFloatField;
     QMLstOrdenesMARGEN_UNI_CIEN_PRE: TFloatField;
     QMLstOrdenesCOSTE_UNITARIO_PRE: TFloatField;
     QMLstOrdenesMARGEN_UNI_PRE: TFloatField;
     QMLstOrdenesPRECIO_VENTA_PRE: TFloatField;
     QMLstOrdenesPRECIO_VENTA_TOT_PRE: TFloatField;
     QMLstOrdenesPRECIO_VENTA_TOT_REAL: TFloatField;
     QMLstOrdenesDIF_COSTE_MARGEN_TOTAL: TFloatField;
     QMLstOrdenesDIF_MARGEN_TOTAL: TFloatField;
     QMLstOrdenesDIF_MARGEN_UNI_CIEN: TFloatField;
     QMLstOrdenesDIF_PRECIO_VENTA_UNI: TFloatField;
     QMLstOrdenesDIF_COSTE_UNI: TFloatField;
     QMLstOrdenesDIF_MARGEN_UNI: TFloatField;
     QMLstOrdenesDIF_PRECIO_VENTA_TOT: TFloatField;
     QMLstOrdenesHORAS_OPERARIO_PRE: TFloatField;
     QMLstOrdenesHORAS_MAQUINA_PRE: TFloatField;
     QMLstOrdenesDIF_HORAS_MAQUINA: TFloatField;
     QMLstOrdenesDIF_HORAS_OPERARIO: TFloatField;
     QMLstOrdenesRECUPERADO_MARCAJE: TIntegerField;
     xMinCompuestoDMIN_D: TFIBStringField;
     xMaxCompuestoHMAX_H: TFIBStringField;
     frDBOrdenes: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoOrdenDetGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     Tipo_Esc: string;
     Comentario: string;
     FechaListado: TDateTime;
     TFiltro: string;
     procedure CambiaCompuestoD(Compuesto: string);
     procedure CambiaCompuestoH(Compuesto: string);
     procedure CambiaClienteD(Cliente: integer);
     procedure CambiaClienteH(Cliente: integer);
     procedure Recargar;
     procedure MostrarListado(modo: integer; compuesto_ini, compuesto_fin: string; TipoEsc: string; cliente_ini, cliente_fin: integer; fecha_ini, fecha_fin: TDateTime);
  end;

var
  ProDMLstOrdenDet : TProDMLstOrdenDet;

implementation

uses UDMListados, UDMMain, UEntorno, UFormGest;

{$R *.dfm}

procedure TProDMLstOrdenDet.CambiaCompuestoD(Compuesto: string);
begin
  with xTituloCompuestoD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Compuesto'].AsString := Compuesto;
     Open;
  end;
end;

procedure TProDMLstOrdenDet.CambiaCompuestoH(Compuesto: string);
begin
  with xTituloCompuestoH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Compuesto'].AsString := Compuesto;
     Open;
  end;
end;

procedure TProDMLstOrdenDet.CambiaClienteD(Cliente: integer);
begin
  with xTituloClienteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TProDMLstOrdenDet.CambiaClienteH(Cliente: integer);
begin
  with xTituloClienteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TProDMLstOrdenDet.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMLstOrdenDet.MostrarListado(modo: integer; compuesto_ini, compuesto_fin: string; TipoEsc: string; cliente_ini, cliente_fin: integer; fecha_ini, fecha_fin: TDateTime);
begin
  QMLstOrdenes.Close;
  QMLstOrdenes.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QMLstOrdenes.Params.ByName['Compuesto_ini'].AsString := compuesto_ini;
  QMLstOrdenes.Params.ByName['Compuesto_fin'].AsString := compuesto_fin;
  QMLstOrdenes.Params.ByName['Cliente_ini'].AsInteger := cliente_ini;
  QMLstOrdenes.Params.ByName['Cliente_fin'].AsInteger := cliente_fin;
  QMLstOrdenes.Params.ByName['Fecha_ini'].AsDateTime := fecha_ini;
  QMLstOrdenes.Params.ByName['Fecha_fin'].AsDateTime := fecha_fin;
  QMLstOrdenes.Open;

  DMListados.Imprimir(8062, modo, '', '', frListadoOrdenDet, nil); //Listado escandallos
end;

procedure TProDMLstOrdenDet.Recargar;
begin
  with xMinCompuestoD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Open;
  end;

  with xMaxCompuestoH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Open;
  end;

  with xMinClienteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Open;
  end;

  with xMaxClienteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Open;
  end;

  with xFechaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Open;
  end;

  with xFechaH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Open;
  end;
end;

procedure TProDMLstOrdenDet.frListadoOrdenDetGetValue(const ParName: string; var ParValue: variant);
begin
  // CABECERA LISTADO
  if Trim(ParName) = 'Comentario' then
     ParValue := Comentario;
  if Trim(ParName) = 'FechaListado' then
     ParValue := FechaListado;
  if Trim(ParName) = 'Empresa' then
  begin
     with QGeneral do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        ExecQuery;
        ParValue := FieldByName['titulo'].AsString;
     end;
  end;
  if Trim(ParName) = 'TFiltro' then
     ParValue := TFiltro;
end;

end.
