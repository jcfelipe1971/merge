unit UDMRUnidPendRecibir;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, DBTables, FIBDataSet, FIBTableDataSet, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport;

type
  TDMRUnidPendRecibir = class(TDataModule)
     frUnidPendRecibir: TfrHYReport;
     TLocal: THYTransaction;
     xUnidadesPendientes: TFIBDataSetRO;
     DSxUnidadesPendientes: TDataSource;
     frDBxUnidadesPendientes: TfrDBDataSet;
     frxUnidPendRecibir: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRInventario_StocksDestroy(Sender: TObject);
     procedure DMRDepositosActivosCreate(Sender: TObject);
     procedure frUnidPendRecibirEnterRect(Memo: TStringList; View: TfrView);
     procedure frUnidPendRecibirGetValue(const ParName: string; var ParValue: variant);
     procedure frxUnidPendRecibirBeforePrint(Sender: TfrxReportComponent);
     procedure frxUnidPendRecibirGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure MostrarListado(Modo, ProveedorDesde, ProveedorHasta: integer; ArticuloDesde, ArticuloHasta, AlmacenDesde, AlmacenHasta, FamiliaDesde, FamiliaHasta, SerieDesde, SerieHasta: string; FechaDesde, FechaHasta, FechaListado: TDateTime; Comentario: string; Orden: integer);
  end;

var
  DMRUnidPendRecibir : TDMRUnidPendRecibir;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest, DateUtils, UParam, UDameDato;

procedure TDMRUnidPendRecibir.DMRDepositosActivosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  SQLBase := TStringList.Create;
  with SQLBase do
  begin
     Add(' SELECT D.EMPRESA, D.EJERCICIO VCANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA, D.ALMACEN ALMACEN_DET, D.ARTICULO, D.TITULO, ');
     Add('        D.UNIDADES, D.PRECIO, D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.P_COSTE, D.PAIS, D.TIPO_IVA, D.P_IVA, ');
     Add('        D.P_RECARGO, D.BRUTO, D.I_DESCUENTO, D.B_IMPONIBLE, D.ENTRADA, D.DTO_PP, D.M_MOV_STOCK, D.ENTRADA_RECEPCION, ');
     Add('        D.UNIDADES_EXT, D.NOTAS, D.B_IMPONIBLE_CANAL, D.BASE_IMPORTACION, D.ID_DETALLES_E, D.ID_E, D.ID_D_E_GR, ');
     Add('        D.ID_A_M_C_T, D.ID_C_A, D.ID_A, D.ID_MOV_STOCKS, D.I_DTO_CIAL, D.NSERIE, D.BULTOS, D.ORDEN, D.UNIDADES_SEC, ');
     Add('        D.APLICA_UNIDADES_SECUNDARIAS, D.PROYECTO, D.NOTAS2, D.CRC_NOTAS, D.CRC_NOTAS2, D.ID_DETALLES_E_REGALO, D.CUENTA, ');
     Add('        D.IMPORTE_ICE, D.INVERSION_SUJETO_PASIVO, D.B_DTO_LINEA, D.C_IVA, D.C_RECARGO, D.LIQUIDO, ');
     Add('        D.TIPO_IMPUESTO_ADICIONAL, D.P_IMPUESTO_ADICIONAL, D.I_IMPUESTO_ADICIONAL, D.I_IMPUESTO_ADICIONAL_CANAL, D.PESO, ');
     Add('        D.PESO_TOTAL, D.PESO_REAL, D.COSTE_ADICIONAL, D.T_COSTE, D.M_BRUTO, D.PRO_NUM_PLANO, ');
     Add('        -- ');
     Add('        DP.UNIDADES_ORIGINALES, DP.UNIDADES_SERVIDAS, DP.UNIDADES_POR_SERVIR, DP.LINEA_SERVIDA, DP.P_COSTE, DP.DESCUENTO, ');
     Add('        DP.UNIDADES_RECEPCION, DP.FECHA_PRE_DET, DP.FECHA_REC_DET, DP.SERVIR_LINEA, DP.FECHA_CONF_KRI, ');
     Add('        DP.PLAZO_CONFIRM_KRI, DP.TIPO_UNIDAD_LOGISTICA, DP.UNIDADES_LOGISTICAS, ');
     Add('        -- ');
     Add('        C.ALMACEN ALMACEN_CAB, C.MONEDA, C.FECHA, C.NOTAS, C.ESTADO, C.BULTOS, C.LINEAS, C.BRUTO, C.I_DTO_LINEAS, ');
     Add('        C.S_BASES, C.S_CUOTA_IVA, C.S_CUOTA_RE, C.DTO_PP, C.DTO_CIAL, C.I_DTO_CIAL, C.I_DTO_PP, C.POR_FINANCIACION, ');
     Add('        C.I_FINANCIACION, C.FORMA_DE_PAGO, C.I_FINANCIACION_CANAL, C.S_BASES_CANAL, C.S_CUOTA_IVA_CANAL, ');
     Add('        C.S_CUOTA_RE_CANAL, C.CHG_MONEDA, C.SU_REFERENCIA, C.MODIFICA_DOC, C.I_PORTES, C.POR_PORTES, C.TIPO_PORTES, ');
     Add('        C.I_PORTES_CANAL, C.CAMBIO_FIJO, C.VALOR_CAMB_FIJO, C.PROCESO_AUTO, C.PROYECTO, C.PERMITIR_SUPERAR_IMPORTE_KRI, ');
     Add('        C.INVERSION_SUJETO_PASIVO, C.IMPORTE_ICE_TOTAL, C.B_DTO_LINEAS, C.LIQUIDO, C.LIQUIDO_CANAL, ');
     Add('        C.S_CUOTA_IMPUESTO_ADICIONAL, C.S_CUOTA_IMP_ADICIONAL_CANAL, C.DIR_ENTREGA_MANUAL, C.IDIOMA, ');
     Add('        C.DIR_RECOGIDA_MANUAL, C.EMPAQUETADO_EMPRESA, C.EQUIPO_RECOGIDA, C.EQUIPO_ENTREGA, C.MATRICULA_RECOGIDA, ');
     Add('        C.MATRICULA_ENTREGA, C.FECHA_RECOGIDA_MANUAL, C.FECHA_ENTREGA_MANUAL, C.FECHA_CREACION, C.USUARIO_CREACION, ');
     Add('        C.ORIGEN_DOCUMENTO, C.OBSERVACIONES ');
     Add('        -- ');
     Add('        , CP.TERCERO, CP.PROVEEDOR, CP.FECHA_ENTREGA FECHA_ENTREGA, CP.FECHA_PRE_CAB, CP.FECHA_REC_CAB, CP.TRANSPORTISTA, ');
     Add('        CP.FECHA_CONFIRMADA_KRI, CP.PLAZO_INICIAL_KRI, CP.PLAZO_CONFIRM_KRI, CP.NO_AGREGAR_LINEAS_KRI, CP.ID_ORDEN, ');
     Add('        CP.LIN_FASE, CP.DIRECCION, CP.RIG_OF, CP.PEDIDO_VALORADO, CP.ENTRADA_AGRUPACION, CP.ACEPTA_ENTREGA_PARCIAL, ');
     Add('        CP.PEDIDO_RECIBIDO, ');
     Add('        -- ');
     Add('        A.*, ');
     Add('        -- ');
     Add('        E.DETALLE, E.CANTIDAD, AE.TITULO TITULO_DETALLE, ');
     Add('        (E.CANTIDAD * D.UNIDADES) UNIDADES_ESCANDALLO ');
     Add(' FROM GES_DETALLES_E D ');
     Add(' JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E ');
     Add(' JOIN GES_CABECERAS_E C ON C.ID_E = DP.ID_E ');
     Add(' JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E ');
     Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
     Add(' LEFT JOIN ART_ARTICULOS_ESCANDALLO E ON A.EMPRESA = E.EMPRESA AND A.ARTICULO = E.ARTICULO ');
     Add(' LEFT JOIN ART_ARTICULOS AE ON E.ID_A_DET = AE.ID_A ');
     Add(' WHERE ');
     Add(' D.EMPRESA = :EMPRESA AND ');
     Add(' D.EJERCICIO <= :EJERCICIO AND ');
     Add(' D.CANAL = :CANAL AND ');
     Add(' D.SERIE >= :SERIE_INI AND ');
     Add(' D.SERIE <= :SERIE_FIN AND ');
     Add(' ((D.ARTICULO >= :ARTICULO_INI AND D.ARTICULO <= :ARTICULO_FIN) OR  ');
     Add('  (E.DETALLE >= :ARTICULO_INI AND E.DETALLE <= :ARTICULO_FIN)) AND ');
     Add(' C.ALMACEN >= :ALM_INI AND ');
     Add(' C.ALMACEN <= :ALM_FIN AND ');
     Add(' A.FAMILIA >= :FAMILIA_INI AND ');
     Add(' A.FAMILIA <= :FAMILIA_FIN AND ');
     Add(' CP.PROVEEDOR >= :PROV_INI AND ');
     Add(' CP.PROVEEDOR <= :PROV_FIN AND ');
     Add(' DP.UNIDADES_POR_SERVIR > 0 AND ');
     Add(' DP.LINEA_SERVIDA = 0 AND ');
     Add(' C.ESTADO = 0 ');
  end;
end;

procedure TDMRUnidPendRecibir.DMRInventario_StocksDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  SQLBase.Free;
end;

procedure TDMRUnidPendRecibir.MostrarListado(Modo, ProveedorDesde, ProveedorHasta: integer; ArticuloDesde, ArticuloHasta, AlmacenDesde, AlmacenHasta, FamiliaDesde, FamiliaHasta, SerieDesde, SerieHasta: string; FechaDesde, FechaHasta, FechaListado: TDateTime; Comentario: string; Orden: integer);
var
  CampoFechaEntregaPrevista : string;
begin
  FechaDesde := RecodeTime(FechaDesde, 0, 0, 0, 0);
  FechaHasta := RecodeTime(FechaHasta, 23, 59, 59, 999);

  if (LeeParametro('LSTPEPP001', '') = 'C') then
     CampoFechaEntregaPrevista := 'CP.FECHA_PRE_CAB'
  else
     CampoFechaEntregaPrevista := 'DP.FECHA_PRE_DET';

  with xUnidadesPendientes do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     SelectSQL.Add(' AND ');
     SelectSQL.Add(CampoFechaEntregaPrevista + ' >= :FECHA_INI AND ');
     SelectSQL.Add(CampoFechaEntregaPrevista + ' <= :FECHA_FIN ');

     case Orden of
        0: SelectSQL.Add(' ORDER BY D.ALMACEN, CP.PROVEEDOR, ' + CampoFechaEntregaPrevista);
        1: SelectSQL.Add(' ORDER BY D.ALMACEN, D.ARTICULO, ' + CampoFechaEntregaPrevista);
        2: SelectSQL.Add(' ORDER BY D.ALMACEN, ' + CampoFechaEntregaPrevista + ', CP.PROVEEDOR ');
        3: SelectSQL.Add(' ORDER BY D.ALMACEN, D.RIG, ' + CampoFechaEntregaPrevista);
        else
           SelectSQL.Add(' ORDER BY C.ALMACEN, CP.PROVEEDOR, ' + CampoFechaEntregaPrevista);
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE_INI'].AsString := SerieDesde;
     Params.ByName['SERIE_FIN'].AsString := SerieHasta;
     Params.ByName['ARTICULO_INI'].AsString := ArticuloDesde;
     Params.ByName['ARTICULO_FIN'].AsString := ArticuloHasta;
     Params.ByName['ALM_INI'].AsString := AlmacenDesde;
     Params.ByName['ALM_FIN'].AsString := AlmacenHasta;
     Params.ByName['FAMILIA_INI'].AsString := FamiliaDesde;
     Params.ByName['FAMILIA_FIN'].AsString := FamiliaHasta;
     Params.ByName['PROV_INI'].AsInteger := ProveedorDesde;
     Params.ByName['PROV_FIN'].AsInteger := ProveedorHasta;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Open;
  end;

  DMListados.DatosInforme(FechaListado, Comentario);
  DMListados.Imprimir(138, 0, Modo, '', '', frUnidPendRecibir, frxUnidPendRecibir, nil);
end;

procedure TDMRUnidPendRecibir.frUnidPendRecibirEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMRUnidPendRecibir.frUnidPendRecibirGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'NombreProv' then
     ParValue := DameTituloProveedor(xUnidadesPendientes.FieldByName('PROVEEDOR').AsInteger);
end;

procedure TDMRUnidPendRecibir.frxUnidPendRecibirBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMRUnidPendRecibir.frxUnidPendRecibirGetValue(const VarName: string; var Value: variant);
begin
  frUnidPendRecibirGetValue(VarName, Value);
end;

end.
