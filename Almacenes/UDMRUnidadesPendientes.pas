unit UDMRUnidadesPendientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, DBTables, FIBDataSet, FIBTableDataSet, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport;

type
  TDMRUnidadesPendientes = class(TDataModule)
     frUnidadesPendientes: TfrHYReport;
     TLocal: THYTransaction;
     xUnidadesPendientes: TFIBDataSetRO;
     DSxUnidadesPendientes: TDataSource;
     frDBxUnidadesPendientes: TfrDBDataSet;
     frxUnidadesPendientes: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRInventario_StocksDestroy(Sender: TObject);
     procedure DMRDepositosActivosCreate(Sender: TObject);
     procedure frUnidadesPendientesEnterRect(Memo: TStringList; View: TfrView);
     procedure frUnidadesPendientesGetValue(const ParName: string; var ParValue: variant);
     procedure frxUnidadesPendientesBeforePrint(Sender: TfrxReportComponent);
     procedure frxUnidadesPendientesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; ClienteDesde, ClienteHasta: integer; ArticuloDesde, ArticuloHasta, AlmacenDesde, AlmacenHasta, FamiliaDesde, FamiliaHasta, SerieDesde, SerieHasta: string; FechaDesde, FechaHasta, FechaListado: TDateTime; Comentario: string; Orden: integer);
  end;

var
  DMRUnidadesPendientes : TDMRUnidadesPendientes;
  ModoTrabajo : smallint;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest, UParam, DateUtils, UDameDato;

procedure TDMRUnidadesPendientes.DMRDepositosActivosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  SQLBase := TStringList.Create;
  with SQLBase do
  begin
     Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA, D.ALMACEN ALMACEN_DET, D.ARTICULO, D.TITULO, ');
     Add('        D.UNIDADES, D.PRECIO, D.PIEZAS_X_BULTO, D.BULTOS, D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.COMISION, ');
     Add('        D.P_COSTE, D.TIPO_IVA, D.P_IVA, D.P_RECARGO, D.BRUTO, D.B_COMISION, D.DTO_PP, D.DTO_CIAL, D.I_DTO_PP, ');
     Add('        D.I_DTO_CIAL, D.I_DESCUENTO, D.B_IMPONIBLE, D.I_COMISION, D.NOTAS NOTAS_DET, D.UNIDADES_EXT, D.IVA_INCLUIDO, ');
     Add('        D.NSERIE, D.B_COMISION_CANAL, D.UNIDADES_SEC, D.NO_FABRICACION_KRI, D.ID_DETALLES_S, D.ID_A_M_C_T, D.ID_C_A, ');
     Add('        D.ID_A, D.COMISION_LINEAL, D.I_COMISION_LINEAL, D.TITULO_IDIOMA, D.MARGEN_KRI, D.TIPO_LINEA_KRI, D.ORDEN, ');
     Add('        D.TIPO_LINEA, D.ORIGEN, D.ID_P, D.APLICA_UNIDADES_SECUNDARIAS, D.PROYECTO PROYECTO_DET, D.CERTIFICADO, ');
     Add('        D.CERT_NEGATIVO, D.LINEA_RELACION, D.NOTAS2 NOTAS2_DET, D.CRC_NOTAS, D.CRC_NOTAS2, D.PRO_NUM_PLANO, ');
     Add('        D.ID_REGISTRO, D.ID_DESPIECE, D.COSTE_ADICIONAL, D.MANIPULACION, D.INVERSION_SUJETO_PASIVO, D.B_DTO_LINEA, ');
     Add('        D.C_IVA, D.C_RECARGO, D.LIQUIDO, D.T_COSTE, D.M_BRUTO, D.LOTE_SIMPLE, D.TIPO_IMPUESTO_ADICIONAL, ');
     Add('        D.AGENTE AGENTE_DET, D.PESO, D.PESO_TOTAL, D.PESO_REAL, D.PEDIR, D.UNIDAD_FOMENTO, ');
     Add('        -- ');
     Add('        DP.FECHA_ENTREGA_PREV FECHA_ENTREGA_PREV_DET, DP.U_SERVIDAS, DP.U_PENDIENTES, DP.U_RESERVADAS, DP.SERVIDO, ');
     Add('        DP.ORDEN_PRODUCCION, DP.DIRECCION_ENTREGA, DP.FECHA_REC_DET, DP.ID_ESC, DP.ID_ORDEN, DP.ID_MEDIDA, ');
     Add('        DP.TIPO_UNIDAD_LOGISTICA, DP.UNIDADES_LOGISTICAS, DP.ID_REGISTRO, DP.FECHA_CONF_DET, DP.ID_IMAGEN, ');
     Add('        DP.U_PREPARADAS, DP.DIRECCION_ALM_LOGISTICO, DP.U_LOGISTICAS_RESERVADAS, DP.ID_ESC_2, ');
     Add('        -- ');
     Add('        C.ALMACEN ALMACEN_CAB, C.MONEDA, C.FECHA, C.CLIENTE, C.TERCERO, C.DIRECCION, C.SU_REFERENCIA, C.FORMA_PAGO, ');
     Add('        C.CAMPANYA, C.NOTAS NOTAS_CAB, C.ESTADO, C.BULTOS, C.BRUTO, C.I_DTO_LINEAS, C.S_BASES, C.M_BRUTO, C.C_TOTAL, ');
     Add('        C.AGENTE AGENTE_CAB, C.S_CUOTA_IVA, C.S_CUOTA_RE, C.DTO_PP, C.DTO_CIAL, C.B_COMISION, C.I_COMISION, ');
     Add('        C.POR_FINANCIACION, C.I_FINANCIACION, C.I_DTO_PP, C.I_DTO_CIAL, C.PORTES, C.I_FINANCIACION_CANAL, ');
     Add('        C.S_BASES_CANAL, C.S_CUOTA_IVA_CANAL, C.S_CUOTA_RE_CANAL, C.CHG_MONEDA, C.TARIFA, C.B_DTO_LINEAS, C.ID_S, ');
     Add('        C.MODIFICA_DOC, C.COMISION_LINEAL, C.I_COMISION_LINEAL, C.FECHA_ENTREGA, C.IDIOMA, C.ENVIO, C.USUARIO, ');
     Add('        C.CONTACTO, C.MARGEN_KRI, C.NOTAS_INTERNAS_KRI, C.TIPO_LINEA_KRI, C.I_PORTES, C.POR_PORTES, C.TIPO_PORTES, ');
     Add('        C.I_PORTES_CANAL, C.RANGO, C.INDICE, C.CAMBIO_FIJO, C.VALOR_CAMB_FIJO, C.PROYECTO PROYECTO_CAB, ');
     Add('        C.FECHA_CREACION_KRI, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_OBSERVACION, C.ID_REGISTRO, C.INVERSION_SUJETO_PASIVO, ');
     Add('        C.TRANSPORTISTA, C.POR_RETENCION_GARANTIA, C.I_RETENCION_GARANTIA, C.FECHA_RETENCION_GARANTIA, C.BANCO, ');
     Add('        C.LIQUIDO, C.LIQUIDO_CANAL, C.CLIENTE_EDI, C.COMPRADOR, C.VENDEDOR, C.DPTO, C.RECEPTOR, C.MUELLE, C.PAGADOR, ');
     Add('        C.RECOGIDA, C.DESTINO, C.S_CUOTA_IMPUESTO_ADICIONAL, C.S_CUOTA_IMP_ADICIONAL_CANAL, C.DIR_ENTREGA_MANUAL, ');
     Add('        C.DIR_RECOGIDA_MANUAL, C.EMPAQUETADO_EMPRESA, C.EQUIPO_RECOGIDA, C.EQUIPO_ENTREGA, C.MATRICULA_RECOGIDA, ');
     Add('        C.MATRICULA_ENTREGA, C.FECHA_RECOGIDA_MANUAL, C.FECHA_ENTREGA_MANUAL, C.VALOR_UNIDAD_FOMENTO, C.MODO_IVA, ');
     Add('        C.ID_FICHA_TECNICA, C.ORIGEN_DOCUMENTO, ');
     Add('        -- ');
     Add('        CP.FECHA_ENTREGA_PREV FECHA_ENTREGA_PREV_CAB, CP.FECHA_REC_CAB, CP.Z_COD_BARRAS_PED, CP.ID_REGISTRO, ');
     Add('        CP.LISTO_PARA_PREPARAR, CP.PEDIDO_VALORADO, CP.EMPLEADO_RESPONSABLE, CP.EMPLEADO_ATENCION, CP.DOCUMENTO_MUESTRAS, ');
     Add('        CP.ASEGURADO, CP.PACIENTE, CP.AUTORIZACION, CP.POLIZA, CP.FEC_REC_IH, CP.FECHA_CLIENTE, CP.DATOS_EMBARQUE_IZQ, ');
     Add('        CP.DATOS_EMBARQUE_DER, CP.ENTRADA_AGRUPACION, CP.FECHA_PACKING_LIST, CP.TRATADO, ');
     Add('        -- ');
     Add('        A.*, E.DETALLE, E.CANTIDAD, AE.TITULO TITULO_DETALLE, ');
     Add('        (E.CANTIDAD * D.UNIDADES) UNIDADES_ESCANDALLO ');
     Add(' FROM GES_DETALLES_S D ');
     Add(' JOIN GES_DETALLES_S_PED DP ON (D.ID_DETALLES_S = DP.ID_DETALLES_S) ');
     Add(' JOIN GES_CABECERAS_S C ON (D.ID_S = C.ID_S) ');
     Add(' JOIN GES_CABECERAS_S_PED CP ON (C.ID_S = CP.ID_S) ');
     Add(' JOIN ART_ARTICULOS A ON (D.ID_A = A.ID_A) ');
     Add(' LEFT JOIN ART_ARTICULOS_ESCANDALLO E ON A.EMPRESA = E.EMPRESA AND A.ARTICULO = E.ARTICULO ');
     Add(' LEFT JOIN ART_ARTICULOS AE ON (E.ID_A_DET = AE.ID_A) ');
     Add(' WHERE ');
     Add(' D.EMPRESA = :EMPRESA AND ');
     Add(' D.EJERCICIO <= :EJERCICIO AND ');
     Add(' D.CANAL = :CANAL AND ');
     Add(' D.SERIE >= :SERIE_INI AND ');
     Add(' D.SERIE <= :SERIE_FIN AND ');
     Add(' ((D.ARTICULO >= :ARTICULO_INI AND D.ARTICULO <= :ARTICULO_FIN) OR ');
     Add('  (E.DETALLE >= :ARTICULO_INI AND E.DETALLE <= :ARTICULO_FIN)) AND ');
     Add(' D.ALMACEN >= :ALMACEN_INI AND ');
     Add(' D.ALMACEN <= :ALMACEN_FIN AND ');
     Add(' A.FAMILIA >= :FAMILIA_INI AND ');
     Add(' A.FAMILIA <= :FAMILIA_FIN AND ');
     Add(' C.CLIENTE >= :CLI_INI AND ');
     Add(' C.CLIENTE <= :CLI_FIN AND ');
     Add(' DP.U_PENDIENTES > 0 AND ');
     Add(' DP.SERVIDO = 0 AND ');
     Add(' C.ESTADO = 0 ');
  end;
end;

procedure TDMRUnidadesPendientes.DMRInventario_StocksDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  SQLBase.Free;
end;

procedure TDMRUnidadesPendientes.MostrarListado(Modo: integer; ClienteDesde, ClienteHasta: integer; ArticuloDesde, ArticuloHasta, AlmacenDesde, AlmacenHasta, FamiliaDesde, FamiliaHasta, SerieDesde, SerieHasta: string; FechaDesde, FechaHasta, FechaListado: TDateTime; Comentario: string; Orden: integer);
var
  CampoFechaEntregaPrevista : string;
begin
  FechaDesde := RecodeTime(FechaDesde, 0, 0, 0, 0);
  FechaHasta := RecodeTime(FechaHasta, 23, 59, 59, 999);

  if (LeeParametro('LSTPEPP001', '') = 'C') then
     CampoFechaEntregaPrevista := 'CP.FECHA_ENTREGA_PREV'
  else
     CampoFechaEntregaPrevista := 'DP.FECHA_ENTREGA_PREV';

  with xUnidadesPendientes do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     SelectSQL.Add(' AND ');
     SelectSQL.Add(CampoFechaEntregaPrevista + ' >= :FECHA_INI AND ');
     SelectSQL.Add(CampoFechaEntregaPrevista + ' <= :FECHA_FIN ');

     case Orden of
        0: SelectSQL.Add(' ORDER BY D.ALMACEN, C.CLIENTE, ' + CampoFechaEntregaPrevista);
        1: SelectSQL.Add(' ORDER BY D.ALMACEN, D.ARTICULO, ' + CampoFechaEntregaPrevista);
        2: SelectSQL.Add(' ORDER BY D.ALMACEN, ' + CampoFechaEntregaPrevista + ', C.CLIENTE ');
        3: SelectSQL.Add(' ORDER BY D.ALMACEN, D.RIG, ' + CampoFechaEntregaPrevista);
        else
           SelectSQL.Add(' ORDER BY C.ALMACEN, C.CLIENTE, ' + CampoFechaEntregaPrevista);
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLI_INI'].AsInteger := ClienteDesde;
     Params.ByName['CLI_FIN'].AsInteger := ClienteHasta;
     Params.ByName['ARTICULO_INI'].AsString := ArticuloDesde;
     Params.ByName['ARTICULO_FIN'].AsString := ArticuloHasta;
     Params.ByName['ALMACEN_INI'].AsString := AlmacenDesde;
     Params.ByName['ALMACEN_FIN'].AsString := AlmacenHasta;
     Params.ByName['FAMILIA_INI'].AsString := FamiliaDesde;
     Params.ByName['FAMILIA_FIN'].AsString := FamiliaHasta;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SERIE_INI'].AsString := SerieDesde;
     Params.ByName['SERIE_FIN'].AsString := SerieHasta;
     Open;
  end;

  DMListados.DatosInforme(FechaListado, Comentario);
  DMListados.Imprimir(94, 0, Modo, '', '', frUnidadesPendientes, frxUnidadesPendientes, nil);
end;

procedure TDMRUnidadesPendientes.frUnidadesPendientesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMRUnidadesPendientes.frUnidadesPendientesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'NombreCli' then
     ParValue := DameTituloCliente(xUnidadesPendientes.FieldByName('CLIENTE').AsInteger);
end;

procedure TDMRUnidadesPendientes.frxUnidadesPendientesBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMRUnidadesPendientes.frxUnidadesPendientesGetValue(const VarName: string; var Value: variant);
begin
  frUnidadesPendientesGetValue(VarName, Value);
end;

end.
