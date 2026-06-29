unit UDMServirPedidosVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMServirPedidosVenta = class(TDataModule)
     QMPedidos: TFIBTableSet;
     DSQMPedidos: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPedidosID_S: TIntegerField;
     QMPedidosEMPRESA: TIntegerField;
     QMPedidosEJERCICIO: TIntegerField;
     QMPedidosCANAL: TIntegerField;
     QMPedidosSERIE: TFIBStringField;
     QMPedidosTIPO: TFIBStringField;
     QMPedidosRIG: TIntegerField;
     QMPedidosFECHA: TDateTimeField;
     QMPedidosESTADO: TIntegerField;
     QMPedidosCLIENTE: TIntegerField;
     QMPedidosNOMBRE_R_SOCIAL: TFIBStringField;
     QMPedidosCANAL_DST_PEC: TIntegerField;
     QMPedidosSERIE_DST_PEC: TFIBStringField;
     QMPedidosTIPO_DST_PEC: TFIBStringField;
     QMPedidosENTRADA_AGRUPACION: TIntegerField;
     QMPedidosID_S_DESTINO: TIntegerField;
     QMPedidosRUTA: TIntegerField;
     QMPedidosDOCUMENTO_DESTINO: TFIBStringField;
     QMPedidosFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosPEDIDO_CLIENTE: TFIBStringField;
     QMPedidosZ_OBSERVACION: TFIBStringField;
     xClientes: TFIBDataSetRO;
     xClientesID_CLIENTE: TIntegerField;
     xClientesCLIENTE: TIntegerField;
     xClientesNOMBRE_R_SOCIAL: TFIBStringField;
     xClientesAVISOS: TMemoField;
     DSxClientes: TDataSource;
     QMPedidosLISTO_PARA_PREPARAR: TIntegerField;
     QMPedidosRUTA_ORDEN: TIntegerField;
     QMPedidosNOMBRE_COMERCIAL: TFIBStringField;
     QMDetalle: TFIBTableSet;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetallePIEZAS_X_BULTO: TIntegerField;
     QMDetalleBULTOS: TIntegerField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleCOMISION: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleB_COMISION: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleI_COMISION: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleNOTAS: TBlobField;
     QMDetalleUNIDADES_PENDIENTES: TFloatField;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMDetalleSERVIDO: TIntegerField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMDetalleCOMISION_LINEAL: TFloatField;
     QMDetalleI_COMISION_LINEAL: TFloatField;
     QMDetalleFECHA_ENTREGA_PREV: TDateTimeField;
     QMDetalleDIRECCION_ENTREGA: TIntegerField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMDetalleTITULO_IDIOMA: TFIBStringField;
     QMDetalleORDEN: TIntegerField;
     QMDetallePROC_PROMOCION: TIntegerField;
     QMDetalleORIGEN: TIntegerField;
     QMDetalleID_P: TIntegerField;
     QMDetalleTIPO_LINEA: TFIBStringField;
     QMDetalleMARGEN_KRI: TFloatField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     QMDetalleTIPO_LINEA_KRI: TIntegerField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleLOTE_SIMPLE: TFIBStringField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleCLIENTE: TIntegerField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleUNIDADES_SERVIDAS: TFloatField;
     QMDetalleUNIDADES_RESERVADAS: TFloatField;
     QMDetalleENTRADA_AGRUPACION: TIntegerField;
     QMDetalleORDEN_PRODUCCION: TIntegerField;
     QMDetallePAIS: TFIBStringField;
     QMDetalleID_DESPIECE: TIntegerField;
     QMDetalleFECHA_CONF_DET: TDateTimeField;
     QMDetalleCODIGO_CLIENTE: TStringField;
     QMDetalleTITULO_CLIENTE: TStringField;
     QMDetalleCOSTE_ADICIONAL: TFloatField;
     QMDetalleID_ORDEN: TIntegerField;
     QMDetalleID_ESC: TIntegerField;
     QMDetalleID_MEDIDA: TIntegerField;
     QMDetalleTOTAL_UNIDADES_EXT: TFloatField;
     QMDetalleMARGEN: TFloatField;
     QMDetalleMANIPULACION: TIntegerField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMDetalleSTOCK_ALM: TFloatField;
     QMDetalleUNIDADES_PREPARADAS: TFloatField;
     QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMDetalleDECIMALES_UNIDADES: TIntegerField;
     QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMDetalleP_IMPUESTO_ADICIONAL: TFloatField;
     QMDetalleAGENTE: TIntegerField;
     QMDetallePESO: TFloatField;
     QMDetallePESO_TOTAL: TFloatField;
     QMDetallePESO_REAL: TFloatField;
     QMDetalleSIGNO_UNIDADES: TFIBStringField;
     QMDetalleDIRECCION_ALM_LOGISTICO: TIntegerField;
     QMDetalleID_ESC_2: TIntegerField;
     QMDetalleU_POR_U_LOGISTICA: TFloatField;
     QMDetalleRELACIONAR_U_LOGISTICA: TIntegerField;
     QMDetallePEDIR: TIntegerField;
     QMDetalleTIPO_IVA_ART: TIntegerField;
     QMDetalleECOTASA: TFloatField;
     DSQMDetalle: TDataSource;
     QMPedidosTOTAL_PRESTASHOP: TFloatField;
     QMPedidosLIQUIDO: TFloatField;
     QMDetalleREQUIERE_LOTE_SIMPLE: TIntegerField;
     QMDireccion: TFIBDataSetRO;
     DSQMDireccion: TDataSource;
     QMDireccionTERCERO: TIntegerField;
     QMDireccionDIRECCION: TIntegerField;
     QMDireccionDIR_NOMBRE: TFIBStringField;
     QMDireccionDIR_NOMBRE_2: TFIBStringField;
     QMDireccionDIR_NOMBRE_3: TFIBStringField;
     QMDireccionDIR_COMPLETA_N: TFIBStringField;
     QMDireccionLOCALIDAD: TFIBStringField;
     QMDireccionCODIGO_POSTAL: TFIBStringField;
     QMDireccionPROVINCIA: TFIBStringField;
     QMDireccionPAIS: TFIBStringField;
     QMDireccionPAIS_NOMBRE: TFIBStringField;
     QMPedidosPESO_TOTAL: TFloatField;
     QMPedidosSU_REFERENCIA: TFIBStringField;
     QMPedidosNOM_CONTACTO: TFIBStringField;
     QMDetalleCONTROL_STOCK: TIntegerField;
     QMDireccionPERTENECE_CEE: TIntegerField;
     QMDireccionID_S: TIntegerField;
     QMDireccionENTRADA_AGRUPACION: TIntegerField;
     QMPedidosTRANSPORTISTA: TIntegerField;
     QMPedidosTITULO_TRANSPORTISTA: TFIBStringField;
     QMPedidosORIGEN_DOCUMENTO: TFIBStringField;
     QMPedidosMONEDA: TStringField;
     QMPedidosTARIFA: TFIBStringField;
     QMPedidosS_BASES: TFloatField;
     QMPedidosBRUTO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPedidosAfterOpen(DataSet: TDataSet);
     procedure QMPedidosBeforeClose(DataSet: TDataSet);
     procedure QMPedidosAfterPost(DataSet: TDataSet);
     procedure QMPedidosBeforeEdit(DataSet: TDataSet);
     procedure QMPedidosBeforePost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     Old_Ruta, Old_RutaOrden: integer;
     New_Ruta, New_RutaOrden: integer;
     Param_MOVSTKC001: integer;
     CalcularStock: boolean;
     StockAlm: TStrings;
  public
     { Public declarations }
     procedure Filtra(PedidoDesde, PedidoHasta: integer; ClienteDesde, ClienteHasta: integer; SoloListoPreparar: boolean; Ruta: integer; OrdenRuta: boolean; FechaPrevDesde, FechaPrevHasta: TDateTime; OrigenDocumento: string);
     procedure AsignaEntrada(Entrada: integer);
     procedure MarcarTodos(Entrada: integer);
     procedure Servir(Tipo: string; CerrarFactura: boolean; FechaDestino, FechaContabilizacion: TDateTime; CopiasImprimir: integer; Automatico: boolean = False; Transportista: integer = 0);
     procedure AsignaLoteSimple(Valor: string);
     function CantidadMarcados: integer;
     procedure DameAlbaranDestino(id_s: integer; var IdsAlb, Tercero, Direccion: integer);
     function LotesSimplesAsignados: boolean;
     procedure DameDireccionTercero(Tercero, DirNumnero: integer; var RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF: string);
     procedure DameDatosCliente(Cliente: integer; var incoterm: string);
     procedure ReiniciaStock(AlmacenArticulo: string = '');
  end;

var
  DMServirPedidosVenta : TDMServirPedidosVenta;

implementation

uses UDMMain, UEntorno, HYFIBQuery, UUtiles, UDMPedidos, UFormGest, UFSendCorreo, UFParada, DateUtils, UParam, UDameDato;

{$R *.dfm}

procedure TDMServirPedidosVenta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  StockAlm := TStringList.Create;

  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', REntorno.Serie), 0);

  CalcularStock := (LeeParametro('SRVPECS001', '') = 'S');

  // Me apropio de las marcas de otros
  if (DMMain.EstadoKri(473) <> 0) then
     AsignaEntrada(REntorno.Entrada)
  else
     AsignaEntrada(0);

  AsignaDisplayFormat(QMPedidos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xClientes, MascaraN, MascaraI, ShortDateFormat);

  QMPedidosFECHA_ENTREGA_PREV.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMDetalleFECHA_ENTREGA_PREV.DisplayFormat := ShortDateFormat + ' hh:nn';

  // La ruta es editable pero tiene un tratamiento especial
  QMPedidosRUTA.ReadOnly := False;
  QMPedidosRUTA_ORDEN.ReadOnly := False;
end;

procedure TDMServirPedidosVenta.DataModuleDestroy(Sender: TObject);
begin
  StockAlm.Free;
end;

procedure TDMServirPedidosVenta.Filtra(PedidoDesde, PedidoHasta: integer; ClienteDesde, ClienteHasta: integer; SoloListoPreparar: boolean; Ruta: integer; OrdenRuta: boolean; FechaPrevDesde, FechaPrevHasta: TDateTime; OrigenDocumento: string);
begin
  FechaPrevDesde := RecodeTime(FechaPrevDesde, 0, 0, 0, 0);
  FechaPrevHasta := RecodeTime(FechaPrevHasta, 23, 59, 59, 999);

  with QMPedidos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.FECHA, P.FECHA_ENTREGA_PREV, C.ESTADO, ');
     SelectSQL.Add('        C.CLIENTE, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, P.CANAL_DST_PEC, P.SERIE_DST_PEC, P.TIPO_DST_PEC, P.ENTRADA_AGRUPACION, ');
     SelectSQL.Add('        C.PEDIDO_CLIENTE, C.Z_OBSERVACION, P.LISTO_PARA_PREPARAR, C.SU_REFERENCIA, TRIM(TC.NOMBRE || '' '' || TC.APELLIDOS) NOM_CONTACTO, C.MONEDA, ');
     SelectSQL.Add('        -- ');
     SelectSQL.Add('        CAST(SUBSTRING((SELECT LIST(D_EJERCICIO || '' '' || D_SERIE || ''/'' || D_RIG, '', '') ');
     SelectSQL.Add('                        FROM GES_CABECERAS_RELACIONES ');
     SelectSQL.Add('                        WHERE ');
     SelectSQL.Add('                        O_ID_S = C.ID_S AND ');
     SelectSQL.Add('                        O_TIPO = C.TIPO) FROM 1 FOR 60) AS VARCHAR(60)) DOCUMENTO_DESTINO, ');
     SelectSQL.Add('        (SELECT FIRST 1 ID_S ');
     SelectSQL.Add('         FROM GES_CABECERAS_RELACIONES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         O_ID_S = C.ID_S AND ');
     SelectSQL.Add('         O_TIPO = C.TIPO ');
     SelectSQL.Add('         ORDER BY ID_S) ID_S_DESTINO, ');
     SelectSQL.Add('        -- ');
     SelectSQL.Add('        (SELECT SUM(D.UNIDADES * A.PESO) ');
     SelectSQL.Add('         FROM GES_DETALLES_S D ');
     SelectSQL.Add('         JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         D.ID_S = C.ID_S) PESO_TOTAL, ');
     SelectSQL.Add('        -- ');
     SelectSQL.Add('        R.RUTA, R.RUTA_ORDEN, C.LIQUIDO, COALESCE(PSO.TOTAL_PAID, C.LIQUIDO, 0) TOTAL_PRESTASHOP, C.TRANSPORTISTA, ');
     SelectSQL.Add('        TA.NOMBRE_R_SOCIAL TITULO_TRANSPORTISTA, C.ORIGEN_DOCUMENTO, C.TARIFA, C.S_BASES, C.BRUTO ');
     SelectSQL.Add(' FROM GES_CABECERAS_S C ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S ');
     SelectSQL.Add(' JOIN EMP_CLIENTES CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
     SelectSQL.Add(' JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO ');
     SelectSQL.Add(' JOIN EMP_ACREEDORES A ON C.EMPRESA = A.EMPRESA AND C.TRANSPORTISTA = A.ACREEDOR ');
     SelectSQL.Add(' JOIN SYS_TERCEROS TA ON A.TERCERO = TA.TERCERO ');
     SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_CONTACTOS TC ON C.TERCERO = TC.TERCERO AND C.CONTACTO = TC.CONTACTO ');
     SelectSQL.Add(' LEFT JOIN GES_CABECERAS_S_RUTA R ON C.ID_S = R.ID_S ');
     SelectSQL.Add(' LEFT JOIN SYS_CONF_PRESTASHOP_PEC PSP ON  C.ID_S = PSP.ID_S ');
     SelectSQL.Add(' LEFT JOIN SYS_CONF_PRESTASHOP_ORDER PSO ON PSP.ID_CONFIGURACION = PSO.ID_CONFIGURACION AND PSP.ID_ORDER = PSO.ID_ORDER ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' P.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' P.CANAL = :CANAL AND ');
     SelectSQL.Add(' P.TIPO = ''PEC'' AND ');
     SelectSQL.Add(' P.ENTRADA_AGRUPACION IN (0, :ENTRADA_AGRUPACION) AND ');
     SelectSQL.Add(' C.ESTADO = 0 AND ');
     SelectSQL.Add(' P.FECHA_ENTREGA_PREV BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (PedidoDesde <> 0) then
        SelectSQL.Add(' AND P.RIG >= ' + IntToStr(PedidoDesde) + ' ');
     if (PedidoHasta <> 0) then
        SelectSQL.Add(' AND P.RIG <= ' + IntToStr(PedidoHasta) + ' ');
     if (ClienteDesde <> 0) then
        SelectSQL.Add(' AND C.CLIENTE >= ' + IntToStr(ClienteDesde) + ' ');
     if (ClienteHasta <> 0) then
        SelectSQL.Add(' AND C.CLIENTE <= ' + IntToStr(ClienteHasta) + ' ');
     if (Ruta <> 0) then
        SelectSQL.Add(' AND R.RUTA = ' + IntToStr(Ruta) + ' ');
     if (OrigenDocumento > '') then
        SelectSQL.Add(' AND C.ORIGEN_DOCUMENTO = ''' + OrigenDocumento + '''');
     if (SoloListoPreparar) then
        SelectSQL.Add(' AND P.LISTO_PARA_PREPARAR = 1 ');

     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        SelectSQL.Add(' AND C.AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
     if (Ruta <> 0) or (OrdenRuta) then
        SelectSQL.Add(' ORDER BY R.RUTA, R.RUTA_ORDEN ')
     else
        SelectSQL.Add(' ORDER BY P.EMPRESA, P.EJERCICIO, P.CANAL, P.SERIE, P.TIPO, P.RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaPrevDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := FechaPrevHasta;
     Open;

     // Para poder obtener la cantidad de pedidos filtrados
     Last;
     First;
  end;
end;

procedure TDMServirPedidosVenta.AsignaEntrada(Entrada: integer);
begin
  /// Asigna entrada a los registros marcados con otra entrada.
  /// Deja sin marcar los que no estaban seleccionados.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_CABECERAS_S_PED ');
        SQL.Add(' SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO <= :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' ENTRADA_AGRUPACION > 0 AND ENTRADA_AGRUPACION <> :ENTRADA_AGRUPACION ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA_AGRUPACION'].AsInteger := Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPedidos.Close;
  QMPedidos.Open;
end;

procedure TDMServirPedidosVenta.MarcarTodos(Entrada: integer);
var
  IdDoc : integer;
begin
  with QMPedidos do
  begin
     IdDoc := FieldByName('ID_S').AsInteger;

     DisableControls;
     try
        First;

        while not EOF do
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE GES_CABECERAS_S_PED ');
                 SQL.Add(' SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' ENTRADA_AGRUPACION <> :ENTRADA_AGRUPACION ');
                 Params.ByName['ID_S'].AsInteger := QMPedidos.FieldByName('ID_S').AsInteger;
                 Params.ByName['ENTRADA_AGRUPACION'].AsInteger := Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  Refrescar(QMPedidos, 'ID_S', IdDoc);
end;

procedure TDMServirPedidosVenta.Servir(Tipo: string; CerrarFactura: boolean; FechaDestino, FechaContabilizacion: TDateTime; CopiasImprimir: integer; Automatico: boolean = False; Transportista: integer = 0);
var
  IdDoc : integer;
  SerieDoc : string;
  CanalDoc : integer;
  RIGDoc : integer;

  IdDocInicio : integer;
  TipoDestino : string;
  CanalDestino : integer;
  SerieDestino : string;
begin
  AbreData(TDMPedidos, DMPedidos);

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Traspasando pedidos ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando carta ...'));

     with QMPedidos do
     begin
        IdDocInicio := FieldByName('ID_S').AsInteger;

        DisableControls;
        try
           First;

           while not EOF do
           begin
              if (FieldByName('ENTRADA_AGRUPACION').AsInteger = REntorno.Entrada) then
              begin
                 CanalDoc := FieldByName('CANAL').AsInteger;
                 SerieDoc := FieldByName('SERIE').AsString;
                 RIGDoc := FieldByName('RIG').AsInteger;
                 IdDoc := FieldByName('ID_S').AsInteger;

                 // Para que muestre progreso, moviendose por el grid.
                 FSendCorreo.Texto(Format(_('Traspasando pedido %s%d'), [SerieDoc, RIGDoc]));

                 if (Transportista <> 0) then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'UPDATE GES_CABECERAS_S SET TRANSPORTISTA = :TRANSPORTISTA WHERE ID_S = :ID_S AND TRANSPORTISTA <> :TRANSPORTISTA';
                          Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                          Params.ByName['ID_S'].AsInteger := IdDoc;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 DMPedidos.FiltraDocumento(SerieDoc, 'ID_S = ' + IntToStr(IdDoc));

                 TipoDestino := Trim(FieldByName('TIPO_DST_PEC').AsString);
                 if (TipoDestino = '') then
                    TipoDestino := Tipo;

                 CanalDestino := FieldByName('CANAL_DST_PEC').AsInteger;
                 if (CanalDestino = 0) then
                    CanalDestino := CanalDoc;

                 SerieDestino := Trim(FieldByName('SERIE_DST_PEC').AsString);
                 if (SerieDestino = '') then
                    SerieDestino := SerieDoc;

                 if (TipoDestino <> '') then
                    DMPedidos.TraspasarPedidoActual(TipoDestino, CanalDestino, SerieDestino, False, CopiasImprimir, CerrarFactura, FechaDestino, FechaContabilizacion);

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE GES_CABECERAS_S_PED SET ENTRADA_AGRUPACION = 0 WHERE ID_S = :ID_S AND ENTRADA_AGRUPACION <> 0';
                       Params.ByName['ID_S'].AsInteger := IdDoc;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              Next;
           end;
        finally
           EnableControls;
        end;
     end;

     ReiniciaStock('');

     Refrescar(QMPedidos, 'ID_S', IdDocInicio);
     Refrescar(QMDetalle, 'ID_S', 0);

     FSendCorreo.Texto(_('Proceso terminado'));
     if not Automatico then
     begin
        FSendCorreo.BitBtnOk.Visible := True;
        FSendCorreo.Visible := False;
        FSendCorreo.SePuede := True;
        FSendCorreo.ShowModal;
     end;
  finally
     CierraData(DMPedidos);
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TDMServirPedidosVenta.QMPedidosAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xClientes.Open;
  QMDireccion.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QMDireccion.Open;
end;

procedure TDMServirPedidosVenta.QMPedidosBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xClientes.Close;
  QMDireccion.Close;
end;

procedure TDMServirPedidosVenta.QMPedidosAfterPost(DataSet: TDataSet);
begin
  // Se trata de esta manera para no tener que hacer una vista especial para servir pedidos
  // El UPDATE debe ser sobre GES_CABECERAS_S_PED y GES_CABECERAS_S_RUTAS, pero sin lanzar otros triggers de GES_CABECERAS_S
  if ((Old_Ruta <> New_Ruta) or (Old_RutaOrden <> New_RutaOrden)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO GES_CABECERAS_S_RUTA ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, RUTA, RUTA_ORDEN) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_S, :RUTA, :RUTA_ORDEN) ');
           SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');
           Params.ByName['EMPRESA'].AsInteger := QMPedidosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMPedidosEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMPedidosCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMPedidosSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMPedidosTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMPedidosRIG.AsInteger;
           Params.ByName['ID_S'].AsInteger := QMPedidosID_S.AsInteger;
           Params.ByName['RUTA'].AsInteger := New_Ruta;
           Params.ByName['RUTA_ORDEN'].AsInteger := New_RutaOrden;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMPedidos.Refresh;
  end;
end;

procedure TDMServirPedidosVenta.QMPedidosBeforeEdit(DataSet: TDataSet);
begin
  Old_Ruta := QMPedidosRUTA.AsInteger;
  Old_RutaOrden := QMPedidosRUTA_ORDEN.AsInteger;
end;

procedure TDMServirPedidosVenta.QMPedidosBeforePost(DataSet: TDataSet);
begin
  New_Ruta := QMPedidosRUTA.AsInteger;
  New_RutaOrden := QMPedidosRUTA_ORDEN.AsInteger;
end;

procedure TDMServirPedidosVenta.AsignaLoteSimple(Valor: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_DETALLES_S SET LOTE_SIMPLE = :LOTE_SIMPLE WHERE ID_DETALLES_S = :ID_DETALLES_S ');
        Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['LOTE_SIMPLE'].AsString := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Refresh;
end;

function TDMServirPedidosVenta.CantidadMarcados: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) FROM GES_CABECERAS_S C ');
        SQL.Add(' JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO <= :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' C.TIPO = ''PEC'' AND ');
        SQL.Add(' C.ESTADO = 0 AND ');
        SQL.Add(' P.ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMServirPedidosVenta.DameAlbaranDestino(id_s: integer; var IdsAlb, Tercero, Direccion: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT P.ID_S, P.EMPRESA, P.EJERCICIO, P.CANAL, P.SERIE, P.TIPO, P.RIG, R.REMPRESA, R.REJERCICIO, R.RCANAL, R.RSERIE, ');
        SQL.Add('        R.RTIPO, R.RRIG, A.ID_S ID_S_ALB, A.TERCERO, A.DIRECCION ');
        SQL.Add(' FROM GES_CABECERAS_S P ');
        SQL.Add(' JOIN G_RELACIONES_DESTINOS(P.EMPRESA, P.EJERCICIO, P.CANAL, P.SERIE, P.TIPO, P.RIG) R ON 1 = 1 ');
        SQL.Add(' JOIN GES_CABECERAS_S A ON R.REMPRESA = A.EMPRESA AND R.REJERCICIO = A.EJERCICIO AND R.RCANAL = A.CANAL AND R.RSERIE = A.SERIE AND R.RTIPO = A.TIPO AND R.RRIG = A.RIG ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.ID_S = :ID_S AND ');
        SQL.Add(' R.RTIPO = ''ALB'' ');
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        IdsAlb := FieldByName['ID_S_ALB'].AsInteger;
        Tercero := FieldByName['TERCERO'].AsInteger;
        Direccion := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMServirPedidosVenta.LotesSimplesAsignados: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) FROM GES_CABECERAS_S C ');
        SQL.Add(' JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S ');
        SQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
        SQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO <= :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' C.TIPO = ''PEC'' AND ');
        SQL.Add(' C.ESTADO = 0 AND ');
        SQL.Add(' P.ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION AND ');
        SQL.Add(' A.REQUIERE_LOTE_SIMPLE = 1 AND ');
        SQL.Add(' TRIM(D.LOTE_SIMPLE) = '''' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMServirPedidosVenta.DameDireccionTercero(Tercero, DirNumnero: integer; var RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT T.TERCERO, D.DIRECCION, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_COMPLETA, D.DIR_NOMBRE_2, D.DIR_NOMBRE_3, LO.TITULO LOCALIDAD, ');
        SQL.Add('        PR.TITULO PROVINCIA, PA.CODIGO_TEL, LO.CODIGO_POSTAL, D.DIR_TELEFONO01, D.DIR_TELEFONO02, T.EMAIL, ');
        SQL.Add('        CAST('''' AS VARCHAR(50)) DEPARTAMENTO, CAST('''' AS VARCHAR(80)) OBSERVACIONES, PA.PAIS_C2, PT.PAIS_C2 PAIS_C2_TERCERO, T.NIF ');
        SQL.Add(' FROM SYS_TERCEROS T ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add(' JOIN SYS_LOCALIDADES LO ON D.ID_LOCAL = LO.ID_LOCAL ');
        SQL.Add(' JOIN SYS_PROVINCIAS PR ON LO.PROVINCIA = PR.PROVINCIA AND LO.PAIS = PR.PAIS ');
        SQL.Add(' JOIN SYS_PAISES PA ON LO.PAIS = PA.PAIS ');
        SQL.Add(' JOIN SYS_PAISES PT ON T.PAIS_TERCERO = PT.PAIS ');
        SQL.Add(' WHERE ');
        SQL.Add(' T.TERCERO = :TERCERO AND ');
        if (DirNumnero <> 0) then
           SQL.Add(' D.DIRECCION = :DIRECCION ')
        else
           SQL.Add(' D.DIR_DEFECTO = 1 ');

        Params.ByName['TERCERO'].AsInteger := Tercero;
        if (DirNumnero <> 0) then
           Params.ByName['DIRECCION'].AsInteger := DirNumnero;
        ExecQuery;
        RazonSocial := FieldByName['NOMBRE_R_SOCIAL'].AsString;
        Nombre := FieldByName['NOMBRE_COMERCIAL'].AsString;
        Direccion := Trim(FieldByName['DIR_COMPLETA'].AsString);
        Poblacion := FieldByName['LOCALIDAD'].AsString;
        Provincia := FieldByName['PROVINCIA'].AsString;
        Pais := FieldByName['CODIGO_TEL'].AsString;
        Pais_C2 := FieldByName['PAIS_C2'].AsString;
        CP := FieldByName['CODIGO_POSTAL'].AsString;
        Telefono := FieldByName['DIR_TELEFONO01'].AsString;
        Movil := FieldByName['DIR_TELEFONO02'].AsString;
        Email := FieldByName['EMAIL'].AsString;
        Departamento := FieldByName['DEPARTAMENTO'].AsString;
        Observaciones := FieldByName['OBSERVACIONES'].AsString;
        PaisC2Tercero := FieldByName['PAIS_C2_TERCERO'].AsString;
        NIF := FieldByName['NIF'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMServirPedidosVenta.DameDatosCliente(Cliente: integer; var incoterm: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CODIGO_INCOTERM ');
        SQL.Add(' FROM EMP_CLIENTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CLIENTE = :CLIENTE ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        incoterm := FieldByName['CODIGO_INCOTERM'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMServirPedidosVenta.QMDetalleCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  AlmacenArticulo : string;
  Canal : integer;
begin
  if CalcularStock and (QMDetalleCONTROL_STOCK.AsInteger = 1) then
  begin
     AlmacenArticulo := '[' + QMDetalleALMACEN.AsString + ']' + QMDetalleARTICULO.AsString;
     Canal := Param_MOVSTKC001;
     if (Canal = 0) then
        Canal := REntorno.Canal;

     with StockAlm do
     begin
        i := IndexOfName(AlmacenArticulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString);
           Values[AlmacenArticulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[AlmacenArticulo]);
        end;
     end;

     QMDetalleSTOCK_ALM.AsFloat := Stock;
  end
  else
  begin
     QMDetalleSTOCK_ALM.AsFloat := 0;
  end;
end;

procedure TDMServirPedidosVenta.ReiniciaStock(AlmacenArticulo: string = '');
var
  i : integer;
begin
  if (AlmacenArticulo <> '') then
  begin
     with StockAlm do
     begin
        i := IndexOfName(AlmacenArticulo);
        if (i >= 0) then
           Delete(i);
     end;
  end
  else
     StockAlm.Clear;
end;

end.
