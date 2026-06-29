unit UDMLstPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  UHYReport, FR_Pars, frxClass, frxDBSet, frxHYReport, FIBTableDataSetRO,
  UHYReportMail;

type
  TDMLstPedidos = class(TDataModule)
     frPedidos: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frDBdetalle: TfrDBDataSet;
     DSCabecera: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xDireccion_Cliente: TFIBDataSetRO;
     frUDPie: TfrUserDataset;
     frUDNotasArt: TfrUserDataset;
     TLocal: THYTransaction;
     xTercero: TFIBDataSetRO;
     DSxTercero: TDataSource;
     QMCabecera: TFIBDataSetRO;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSxCliente: THYReportSource;
     HYRSxDireccionCliente: THYReportSource;
     HYRxTercero: THYReportSource;
     DobleCabecera: TFIBDataSetRO;
     xDobleIva: TFIBDataSetRO;
     DSDobleCabecera: TDataSource;
     xDobFormaPago: TFIBDataSetRO;
     HYRxDobFormaPago: THYReportSource;
     HYRDobleCabecera: THYReportSource;
     HYRSDobleIva: THYReportSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xFormaPago: TFIBDataSetRO;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSxDobleIva: TDataSource;
     DSxDobFormaPago: TDataSource;
     DSxDireccion_Cliente: TDataSource;
     DSxDireccionFiscal: TDataSource;
     xDireccionFiscal: TFIBDataSetRO;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xMonedasIdiomas: TFIBDataSetRO;
     DSxMonedasIdiomas: TDataSource;
     xAlmacen: TFIBDataSetRO;
     DSxAlmacen: TDataSource;
     HYRSxArticulos: THYReportSource;
     frDBxGarantiasKri: TfrDBDataSet;
     xGarantiasKri: TFIBDataSetRO;
     DSxGarantiasKri: TDataSource;
     QMPromociones: TFIBDataSetRO;
     DSQMPromociones: TDataSource;
     xArticulosPRM: TFIBDataSetRO;
     DSxArticulosPRM: TDataSource;
     frDBxArticulosPRM: TfrDBDataSet;
     frDBPromociones: TfrDBDataSet;
     frUDNotasArtPRM: TfrUserDataset;
     HYRSPromociones: THYReportSource;
     frxUDNotasArtPRM: TfrxUserDataSet;
     frxDBCabecera: TfrxDBDataset;
     frxUDNotasArt: TfrxUserDataSet;
     frxDBDetalle: TfrxDBDataset;
     frxDBPromociones: TfrxDBDataset;
     frxPedidos: TfrxHYReport;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     DSxTransportistas: TDataSource;
     xTransportistas: TFIBDataSetRO;
     QMDetalleAlfa1Alfa2Mod: TFIBDataSetRO;
     DSDetalleAlfa1Alfa2Mod: TDataSource;
     frDSDetalleAlfa1Alfa2Mod: TfrDBDataSet;
     xDireccionesNIF: TFIBTableSetRO;
     DSDetalleUE: TDataSource;
     QMDetalleUE: TFIBDataSetRO;
     DSDireccionEntregaLinea: TDataSource;
     xDireccionEntregaLinea: TFIBDataSetRO;
     xRecibosAnticipos: TFIBDataSetRO;
     DSxRecibosAnticipos: TDataSource;
     xTotalRecibosAnticipos: TFIBDataSetRO;
     DSxTotalRecibosAnticipos: TDataSource;
     frDBxRecibosAnticipos: TfrDBDataSet;
     frDBxTotalRecibosAnticipos: TfrDBDataSet;
     xLstFirmas: TFIBDataSetRO;
     DSxLstFirmas: TDataSource;
     frDBDLstFirmas: TfrDBDataSet;
     frxDBxLstFirmas: TfrxDBDataset;
     frDBGrupoTalla: TfrDBDataSet;
     DSGrupoTalla: TDataSource;
     HYRSGrupoTalla: THYReportSource;
     QMGrupoTalla: TFIBDataSetRO;
     HYRMGrupoTalla: THYReportMailSource;
     frxDBGrupoTalla: TfrxDBDataset;
     frDBTituloTalla: TfrDBDataSet;
     DSTituloTalla: TDataSource;
     HYRSTituloTalla: THYReportSource;
     QMTituloTalla: TFIBDataSetRO;
     HYRMTituloTalla: THYReportMailSource;
     frxDBTituloTalla: TfrxDBDataset;
     frDBDetalleTallas: TfrDBDataSet;
     DSDetalleTallas: TDataSource;
     HYRSDetalleTallas: THYReportSource;
     QMDetalleTallas: TFIBDataSetRO;
     HYRMDetalleTallas: THYReportMailSource;
     frxDBDetalleTallas: TfrxDBDataset;
     QMArticuloTallas: TFIBDataSetRO;
     DSArticuloTallas: TDataSource;
     xAgente: TFIBDataSetRO;
     DSxAgente: TDataSource;
     xContacto: TFIBDataSetRO;
     DSxContacto: TDataSource;
     QMEscandallo: TFIBDataSetRO;
     DSEscandallo: TDataSource;
     frDBDEscandallo: TfrDBDataSet;
     HYRSEscandallo: THYReportSource;
     xTipoPorte: TFIBDataSetRO;
     DSxTipoPorte: TDataSource;
     xDobTipoPorte: TFIBDataSetRO;
     DSxDobTipoPorte: TDataSource;
     QSPProcedencia: TFIBDataSetRO;
     DSQSPProcedencia: TDataSource;
     xOrdProd: TFIBDataSetRO;
     DSxOrdProd: TDataSource;
     DSxOrdProdEmpleado: TDataSource;
     xOrdProdEmpleado: TFIBDataSetRO;
     frDBxNotasCliente: TfrDBDataSet;
     DSxNotasCliente: TDataSource;
     xNotasCliente: TFIBDataSetRO;
     xArticulosIdioma: TFIBDataSetRO;
     DSxArticulosIdioma: TDataSource;
     frDBxArticulosIdioma: TfrDBDataSet;
     xArticuloTYC: TFIBDataSetRO;
     DSxArticuloTYC: TDataSource;
     xFichaTecnica: TFIBDataSetRO;
     DSxFichaTecnica: TDataSource;
     xTerceroBanco: TFIBDataSetRO;
     DSxTerceroBanco: TDataSource;
     xDobTerceroBan: TFIBDataSetRO;
     DSxDobTerceroBan: TDataSource;
     frDBxDobTerceroBan: TfrDBDataSet;
     frDBxTerceroBanco: TfrDBDataSet;
     procedure frPedidosGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstPedidosDestroy(Sender: TObject);
     procedure frPedidosEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstPedidosCreate(Sender: TObject);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure xClienteAfterScroll(DataSet: TDataSet);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure HYReportLengthBands(Sender: THYReport; Band: THYBand; var Length: integer);
     procedure HYReportPrepareFields(Sender: THYReport; Field: THYField; Contents: TStrings);
     procedure frPedidosPrintReport;
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure HYReportPrintReport(Sender: THYReport);
     procedure frPedidosUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure QMPromocionesAfterOpen(DataSet: TDataSet);
     procedure QMPromocionesAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasArtPRMFirst(Sender: TObject);
     procedure frUDNotasArtPRMNext(Sender: TObject);
     procedure frxPedidosGetValue(const VarName: string; var Value: variant);
     procedure frxPedidosBeforePrint(Sender: TfrxReportComponent);
     procedure frxPedidosPrintReport(Sender: TObject);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterOpen(DataSet: TDataSet);
     procedure DobleCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMPromocionesBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     function frxPedidosUserFunction(const MethodName: string; var Params: variant): variant;
     procedure QMGrupoTallaAfterOpen(DataSet: TDataSet);
     procedure QMGrupoTallaBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleTallasBeforeClose(DataSet: TDataSet);
     procedure xOrdProdAfterOpen(DataSet: TDataSet);
     procedure xOrdProdBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     i, x: integer;
     ric, ric_prm: TStringList;
     Pagina: integer;
     IVA: smallint;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     SerieGen: string;
     MarcarListado: boolean;
     Param_MODREST006: boolean;
     Param_MODREST015: boolean;
     Param_MODREST017: boolean;
     Param_LSTOPEC001: string;
     Param_LSTOPEC002: string;
     Param_LSTOPEC003: string;
     Param_LSTPICK001: string;
     function n_lineas_memo_detalle: integer;
  public
     nombreFich, rutaFich: string;
     procedure MostrarListadoFiltrado(modo: byte; Filtro: integer; Serie: string);
     procedure MostrarListado(Modo, Numero: byte; Serie: string; const Ejercicio, ID_S: integer; aMarcarListado: boolean = True);
     procedure MostrarListadoPicking(Modo, Numero: byte; Serie: string; const Ejercicio, ID_S: integer);
     procedure UpdateaDocumentos;
     procedure MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; aMarcarListado: boolean = True);
  end;

var
  DMLstPedidos : TDMLstPedidos;
  ID_S_AUX, FiltroGen, tipolistado : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, PsFR_E_PDF, DateUtils, UDMRecibosFactura, ExtCtrls, UParam,
  UFMain, UDameDato, UImagenes;

{$R *.DFM}

procedure TDMLstPedidos.DMLstPedidosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  AbreData(TDMRecibosFactura, DMRecibosFactura);

  ric := TStringList.Create;
  ric_prm := TStringList.Create;
  MarcarListado := True;

  Param_MODREST006 := (LeeParametro('MODREST006') = 'S');
  Param_MODREST015 := (LeeParametro('MODREST015') = 'S');
  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');
  Param_LSTOPEC001 := LeeParametro('LSTOPEC001');
  Param_LSTOPEC002 := LeeParametro('LSTOPEC002');
  Param_LSTOPEC003 := LeeParametro('LSTOPEC003');
  Param_LSTPICK001 := LeeParametro('LSTPICK001');

  if Param_MODREST017 then
  begin
     with QMGrupoTalla do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' /* Los distintos grupos de talla que intervienen en el detalle del documento */ ');
        SelectSQL.Add(' /* Solo los que tienen lineas con unidades */ ');
        if (Param_LSTOPEC003 = 'S') then
           SelectSQL.Add(' SELECT DISTINCT X.ID_S, X.O_ID_S, X.ID_G_T, G.TITULO, X.O_DOC, C.* ')
        else
           SelectSQL.Add(' SELECT DISTINCT X.ID_S, X.ID_G_T, G.TITULO, CAST(0 AS INTEGER) O_ID_S ');
        SelectSQL.Add(' FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, 0, -1) X ');
        SelectSQL.Add(' JOIN ART_GRUPOS_TALLAS G ON X.ID_G_T = G.ID_G_T ');
        SelectSQL.Add(' LEFT JOIN GES_CABECERAS_S C ON X.O_ID_S = C.ID_S ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' (ABS(COALESCE(X.T01, 0)) + ABS(COALESCE(X.T02, 0)) + ABS(COALESCE(X.T03, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T04, 0)) + ABS(COALESCE(X.T05, 0)) + ABS(COALESCE(X.T06, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T07, 0)) + ABS(COALESCE(X.T08, 0)) + ABS(COALESCE(X.T09, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T10, 0)) + ABS(COALESCE(X.T11, 0)) + ABS(COALESCE(X.T12, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T13, 0)) + ABS(COALESCE(X.T14, 0)) + ABS(COALESCE(X.T15, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T16, 0)) + ABS(COALESCE(X.T17, 0)) + ABS(COALESCE(X.T18, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T19, 0)) + ABS(COALESCE(X.T20, 0)) + ABS(COALESCE(X.T21, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T22, 0))) > 0 ');
        if (Param_LSTOPEC003 = 'S') then
           SelectSQL.Add(' ORDER BY X.O_DOC, X.ID_G_T DESC ')
        else
           SelectSQL.Add(' ORDER BY X.ID_G_T DESC ');
     end;
  end;

  QMDetalle.Close;
  with QMDetalle.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_DETALLE_PEDIDO_LST WHERE ID_S = ?ID_S ');

     // 229 - 1 - Listados de PEC, muestra las promociones como a linea mas. (No en un subdetalle)
     if (DMMain.EstadoKri(229) <> 1) then
        Add(' AND TIPO_LINEA <> ''PRM'' ');

     // 160 - Si 1, Lista SOLO las lineas pendientes de entregar en pedidos de ventas.}
     if (DMMain.EstadoKri(160) = 1) then
        Add(' AND UNIDADES_PENDIENTES <> 0 ');

     if ((Param_LSTOPEC001) = '') then
        Add(' ORDER BY ORDEN ')
     else
        Add(' ORDER BY ' + Param_LSTOPEC001);
  end;

  frxPedidos.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');

  // ABSHOT - Dataset para obtener codigo de proveedor para articulos de la familia DNKA (Proveedor=487)
  if (LeeParametro('PERABSH001') = 'S') then
  begin
     with TFIBDataSetRO.Create(Self) do
     begin
        Name := 'xCodProvDNKA';
        AutoTrans := False;
        BufferChunks := 1;
        Database := DMMain.DataBase;
        Transaction := TLocal;
        DataSource := DSDetalle;
        SelectSQL.Text := 'SELECT CODIGO_PROVEEDOR, TITULO_ART FROM ART_ARTICULOS_CODPROV WHERE EMPRESA = :EMPRESA AND PROVEEDOR = 487 AND ARTICULO = :ARTICULO';
     end;

     with TfrxDBDataset.Create(Self) do
     begin
        Name := 'frxCodProvDNKA';
        UserName := 'frxCodProvDNKA';
        OpenDataSource := True;
        CloseDataSource := True;
        DataSet := TFIBDataSetRO(TDataModule(Self).FindComponent('xCodProvDNKA'));
     end;
  end;
end;

procedure TDMLstPedidos.DMLstPedidosDestroy(Sender: TObject);
begin
  ric.Free;
  ric_prm.Free;
  CierraData(DMListados);
  CierraData(DMRecibosFactura);
  if (TLocal.InTransaction) then
     TLocal.Commit;
  Application.ProcessMessages;
end;

procedure TDMLstPedidos.MostrarListadoFiltrado(modo: byte; Filtro: integer; Serie: string);
var
  str : string;
  i : integer;
begin
  FiltroGen := Filtro;
  SerieGen := Serie;
  ID_S_AUX := 0;
  with QMCabecera do
  begin
     Close;
     Open;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
     end;
  end;

  {Se abre por DataSource
  with QMDetalle do
  begin
     Close;
     Open;
  end;
  }

  with xCliente do
  begin
     Close;
     Open;
  end;

  with xDireccion_Cliente do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').AsInteger;
     Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').AsInteger;
     Open;
  end;

  DMListados.Cargar(39, Serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frPedidos.LoadFromFIB(REntorno.Formato, str);
     frPedidos.PrepareReport;
     case modo of
        0: frPedidos.ShowPreparedReport;
        1: frPedidos.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxPedidos.LoadFromFIB(REntorno.Formato, str);
     frxPedidos.PrepareReport;
     case modo of
        0: frxPedidos.ShowPreparedReport;
        1: frxPedidos.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     Pagina := 0;
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstPedidos.MostrarListado(Modo, Numero: byte; Serie: string; const Ejercicio, ID_S: integer; aMarcarListado: boolean = True);
var
  Titulo, TituloCliente : string;
  Grupo : integer;
  Listado : smallint;
begin
  id_s_aux := id_s;
  SerieGen := Serie;

  MarcarListado := aMarcarListado;
  try
     case Numero of
        1: Grupo := 39;
        2: Grupo := 110;
        3: Grupo := 111;
        4: Grupo := 112;
        else
           Grupo := 39;
     end;

     with QMCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;

     with xCliente do
     begin
        Close;
        Open;
     end;

     with xDireccion_Cliente do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').AsInteger;
        Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').AsInteger;
        Open;
     end;

     // if (Modo = 1) then
     //    ModificaDoc(QGen, ID_S, 2, 0);

     {Se llama a la funcion ObtenerListadoPerfil que comprueba si tiene algun listado
     o copias asignado para el perfil del cliente
     Solo si se selecciono el listado 1.
     2 - Pedidos a Clientes}

     Listado := 0;
     if (Numero = 1) then
        Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 2);

     if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
        REntorno.Copias := DMListados.Copias;

     if (Modo = 0) then
        REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

     TituloCliente := '';
     if (LeeParametro('LSTPEC0004') = 'S') then
     begin
        TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
        TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
     end;

     Titulo := _('Pedido') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString + TituloCliente;

     DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frPedidos, frxPedidos, HYReport, LimpiaNombreFichero(Titulo + '.pdf'));
  finally
     MarcarListado := True;
  end;
end;

procedure TDMLstPedidos.MostrarListadoPicking(Modo, Numero: byte; Serie: string; const Ejercicio, ID_S: integer);
var
  Titulo : string;
  Grupo : integer;
  Listado : smallint;
begin
  id_s_aux := id_s;
  SerieGen := Serie;

  MarcarListado := False;
  try
     Grupo := 650;

     // Listado de Picking List debe estar ordenado por ubicacion.
     // Dado que los clientes tienen este dato en diferentes campos se parametriza mediante el parámetro LSTPICK001
     QMDetalle.Close;
     with QMDetalle.SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM VER_DETALLE_PEDIDO_LST WHERE ID_S = ?ID_S ');

        if ((Param_LSTPICK001) = '') then
           Add(' ORDER BY ORDEN ')
        else
           Add(' ORDER BY ' + Param_LSTPICK001);
     end;

     with QMCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;

     with xCliente do
     begin
        Close;
        Open;
     end;

     with xDireccion_Cliente do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').AsInteger;
        Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').AsInteger;
        Open;
     end;

     {Se llama a la funcion ObtenerListadoPerfil que comprueba si tiene algun listado
      o copias asignado para el perfil del cliente
      Solo si se selecciono el listado 1.
      2 - Pedidos a Clientes
     }

     Listado := 0;
     if (Modo = 0) then
        REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

     Titulo := _('PickingList') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString;
     DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frPedidos, frxPedidos, HYReport, LimpiaNombreFichero(Titulo + '.pdf'));
  finally
     MarcarListado := True;
  end;
end;

procedure TDMLstPedidos.frPedidosGetValue(const ParName: string; var ParValue: variant);
var
  cambio : extended;
  i : integer;
  GiroCliente, TituloGiroCliente : string;
begin
  DMListados.GetValue(ParName, ParValue);
  cambio := 0;

  if (ParName = 'Cif') then
     ParValue := xDireccion_Cliente.FieldByName('NIF').AsString;
  if (ParName = 'Empresa_Cli') then
     ParValue := xDireccion_Cliente.FieldByName('NOMBRE').AsString;
  if (ParName = 'Direccion') then //dji lrk kri
     ParValue := StringReplace(xDireccion_Cliente.FieldByName('DIRECCION').AsString, '  ', ' ', [rfReplaceAll]);
  if (ParName = 'Direccion2') then //dji lrk kri
     ParValue := StringReplace(xDireccion_Cliente.FieldByName('DIR_NOMBRE_2').AsString, '  ', ' ', [rfReplaceAll]);
  if (ParName = 'Direccion3') then //dji lrk kri
     ParValue := StringReplace(xDireccion_Cliente.FieldByName('DIR_NOMBRE_3').AsString, '  ', ' ', [rfReplaceAll]);
  if (ParName = 'CodPostal') then
     ParValue := xDireccion_Cliente.FieldByName('CODPOB').AsString;
  if (ParName = 'Provincia') then
     ParValue := xDireccion_Cliente.FieldByName('PROVINCIA').AsString;
  if (ParName = 'Colonia') then
     ParValue := xDireccion_Cliente.FieldByName('COLONIA').AsString;
  if (ParName = 'Pais') then
     ParValue := xDireccion_Cliente.FieldByName('PAIS').AsString;
  if (ParName = 'Telefono1') then
     ParValue := xDireccion_Cliente.FieldByName('DIR_TELEFONO01').AsString;
  if (ParName = 'Telefono2') then
     ParValue := xDireccion_Cliente.FieldByName('DIR_TELEFONO02').AsString;
  if (ParName = 'Telefax') then
     ParValue := xDireccion_Cliente.FieldByName('DIR_TELEFAX').AsString;
  if (ParName = 'Email') then
     ParValue := xDireccion_Cliente.FieldByName('EMAIL').AsString;

  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if ParName = 'Pedido' then
  begin
     ParValue := QMCabecera.FieldByName('RIG').AsInteger;

     // Refrescar la Doble Cabecera
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
     end;

     // Actualizar las máscaras para el pedido actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
  end;

  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;

  if ParName = 'Articulo' then
     if (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := ' '
     else
        ParValue := QMDetalle.FieldByName('ARTICULO').AsString;

  if ParName = 'Unidades' then
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if ((xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger <> 0) and
           (QMDetalle.FieldByName('APLICA_UNIDADES_SECUNDARIAS').AsInteger <> 0)) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMDetalle.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Titulo_Moneda' then
  begin
     if (QMCabecera.FieldByName('IDIOMA').AsString = 'CAS') then
     begin
        with xMonedas do
        begin
           Close;
           Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
           Open;
           ParValue := xMonedas.FieldByName('TITULO').AsString;
        end;
     end
     else
     begin
        with xMonedasIdiomas do
        begin
           Close;
           Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
           Open;
           ParValue := xMonedasIdiomas.FieldByName('TITULO').AsString;
        end;
     end;
  end;

  if ParName = 'Moneda_Sec' then
     ParValue := Moneda_Sec;

  if ParName = 'TotalMonSec' then
     ParValue := DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio);

  if ParName = 'Procedencia' then
     if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
        ParValue := Format(_('Pedido: %d Linea: %d Fecha: %s'), [QSPProcedencia.FieldByName('RIG_O').AsInteger, QSPProcedencia.FieldByName('LINEA_O').AsInteger, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
     else
        ParValue := Format(_('Oferta: %d Linea: %d Fecha: %s'), [QSPProcedencia.FieldByName('RIG_O').AsInteger, QSPProcedencia.FieldByName('LINEA_O').AsInteger, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);

  // Para que no la muestre por artículo, sino por procedencia.
  if ParName = 'ProcedenciaUnica' then
  begin
     with QSPProcedencia do
     begin
        if (DMMain.EstadoKri(120) = 1) then
        begin
           if FieldByName('TIPO_O').AsString = 'OFC' then
              ParValue := Format(_('Oferta %s Fecha %s %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime), FieldByName('SU_REFERENCIA').AsString])
           else if FieldByName('TIPO_O').AsString = 'PEC' then
              ParValue := Format(_('Pedido %s Fecha %s %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime), FieldByName('SU_REFERENCIA').AsString])
           else if FieldByName('TIPO_O').AsString = 'ALB' then
              ParValue := Format(_('Albarán %s Fecha %s %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime), FieldByName('SU_REFERENCIA').AsString])
           else if FieldByName('TIPO_O').AsString = 'TIC' then
              ParValue := Format(_('Ticket %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else
              ParValue := '';
        end
        else
        begin
           if FieldByName('TIPO_O').AsString = 'OFC' then
              ParValue := Format(_('Oferta %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else if FieldByName('TIPO_O').AsString = 'PEC' then
              ParValue := Format(_('Pedido %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else if FieldByName('TIPO_O').AsString = 'ALB' then
              ParValue := Format(_('Albarán %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else if FieldByName('TIPO_O').AsString = 'TIC' then
              ParValue := Format(_('Ticket %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else
              ParValue := '';
        end;
     end;
  end;

  if ParName = 'Proc' then
     with QSPProcedencia do
     begin
        if ((FieldByName('TIPO_O').AsString = 'OFC') or
           (FieldByName('TIPO_O').AsString = 'PEC') or
           (FieldByName('TIPO_O').AsString = 'ALB') or
           (FieldByName('TIPO_O').AsString = 'TIC')) then
           ParValue := FieldByName('TIPO_O').AsString + FieldByName('SERIE_O').AsString + FieldByName('RIG_O').AsString
        else
           ParValue := '';
     end;

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_S').AsInteger = DobleCabecera.FieldByName('ID_S').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  if ParName = 'Barras' then
     ParValue := DameCodigoBarras(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'EAN13' then
     ParValue := DameEAN13Articulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'EAN8' then
     ParValue := DameEAN8Articulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'DUN14' then
     ParValue := DameDUN14Articulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'UPC' then
     ParValue := DameUPCArticulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'ISBN' then
     ParValue := DameISBNArticulo(QMDetalle.FieldByName('ARTICULO').AsString);

  //Portes en documentos
  if ParName = 'PorteVisible' then
     ParValue := not (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DoblePorteVisible' then
     ParValue := not (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DescPortes' then
     ParValue := DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);

  if ParName = 'DobleDescPortes' then
     ParValue := DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger, DobleCabecera.FieldByName('IDIOMA').AsString);

  //Promociones
  if ParName = 'Articulo_prm' then
     if (QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := ' '
     else
        ParValue := QMPromociones.FieldByName('ARTICULO').AsString;

  if ParName = 'Unidadesprm' then
  begin
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if (xArticulos.FieldByName('PRMPVP_POR_UD_SECUNDARIA').AsInteger <> 0) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMPromociones.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMPromociones.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'DetalleVisible' then
     ParValue := not (QMDetalle.EOF);

  if ParName = 'NombreUsuarioKri' then {dji lrk kri}
     ParValue := DameNombreCorreoUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));

  if (ParName = 'NombreOperario') then
     ParValue := DameTituloUsuario(QMCabecera.FieldByName('USUARIO').AsInteger);

  if (ParName = 'DblNombreOperario') then
     ParValue := DameTituloUsuario(DobleCabecera.FieldByName('USUARIO').AsInteger);

  if (ParName = 'NombreUsuarioCreacion') then
     ParValue := DameTituloUsuario(QMCabecera.FieldByName('USUARIO_CREACION').AsInteger);

  if (ParName = 'DblNombreUsuarioCreacion') then
     ParValue := DameTituloUsuario(DobleCabecera.FieldByName('USUARIO_CREACION').AsInteger);

  if ParName = 'TituloAgente' then
     ParValue := DameTituloAgente(QMCabecera.FieldByName('AGENTE').AsInteger);

  // Variables PIVA[1..9] - Porcentaje de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'PIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('P_IVA').AsFloat;
     end;
  end;

  // Variables PIVAR[1..9] o PRE[1..9] - Porcentaje de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_RE').IsNull then
           ParValue := xDobleIva.FieldByName('P_RE').AsFloat;
     end;
  end;

  // Variables BI[1..9] - Base Imponible
  if Copy(UpperCase(ParName), 1, 2) = 'BI' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 3, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('S_BASES_DTO').IsNull then
           ParValue := xDobleIva.FieldByName('S_BASES_DTO').AsFloat;
     end;
  end;

  // Variables IIVA[1..9] - Importe de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'IIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  // Variables IIVAR[1..9] - Importe de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat;
     end;
  end;

  // Variables PIA[1..9] - Porcentaje Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'PIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IIA[1..9] - Importe Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'IIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IVA_RE[1..9] - Importe IVA + Recargo por equivalencia
  if Copy(UpperCase(ParName), 1, 6) = 'IVA_RE' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 7, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat + xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA' then
     ParValue := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_PAGO').AsString, QMCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloFormaPago(DobleCabecera.FieldByName('FORMA_PAGO').AsString, DobleCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA_LARGO' then
     ParValue := DameTituloLargoFormaPago(QMCabecera.FieldByName('FORMA_PAGO').AsString, QMCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA_LARGO' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloLargoFormaPago(DobleCabecera.FieldByName('FORMA_PAGO').AsString, DobleCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'FECHA_ENTREGA_PREV' then
  begin
     if (QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime <= QMCabecera.FieldByName('FECHA').AsDateTime) then
        ParValue := ''
     else
     if (TimeOf(QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime) = 0) then
        ParValue := DateToStr(QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime)
     else
        ParValue := FormatDateTime(ShortDateFormat + ' hh:nn', QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime);
  end;

  if ParName = 'NotasCabTO' then
     ParValue := FMain.DameTexto(TBlobField(QMCabecera.FieldByName('NOTAS')));
  if ParName = 'NotasDetTO' then
     ParValue := FMain.DameTexto(TBlobField(QMDetalle.FieldByName('NOTAS')));
  if ParName = 'NotasArtTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulos.FieldByName('NOTAS')));
  if ParName = 'NotasArtComprasTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulos.FieldByName('NOTAS_COMPRAS')));
  if ParName = 'NotasArtVentasTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulos.FieldByName('NOTAS_VENTAS')));
  if ParName = 'NotasArtIdiomaTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulosIdioma.FieldByName('DESCRIPCION_EXTENDIDA')));

  if ParName = 'Stock' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMDetalle.FieldByName('ALMACEN').AsString);

  if (UpperCase(ParName) = UpperCase('TarifaIVAIncluido')) then
     ParValue := TarifaEsIvaIncluido(QMCabecera.FieldByName('TARIFA').AsString);

  if ParName = 'TituloFamilia' then
     ParValue := DameTituloFamilia(xArticulos.FieldByName('FAMILIA').AsString);

  if (REntorno.Pais = 'CHL') then
  begin
     // Buscamos Giro cliente
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT G.CODIGO_GIRO, T.TITULO ');
           SQL.Add(' FROM EMP_CLIENTES_GIROS G ');
           SQL.Add(' JOIN SYS_TIPO_GIRO T ON G.ID_TIPO_GIRO = T.ID ');
           SQL.Add(' WHERE ');
           SQL.Add(' G.EMPRESA = :EMPRESA AND ');
           SQL.Add(' G.CLIENTE = :CLIENTE AND ');
           SQL.Add(' G.DEFECTO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabecera.FieldByName('CLIENTE').AsInteger;
           ExecQuery;
           GiroCliente := FieldByName['CODIGO_GIRO'].AsString;
           TituloGiroCliente := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (ParName = 'GIRO_CLIENTE') then
        ParValue := GiroCliente;

     if (ParName = 'TITULO_GIRO_CLIENTE') then
        ParValue := TituloGiroCliente;
  end;
end;

procedure TDMLstPedidos.frPedidosEnterRect(Memo: TStringList; View: TfrView);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraArt]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if (Pos('[MascaraArtT]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if Memo[0] = '[NotasArt]' then
        Memo[0] := ric.Strings[i];

     {
     if Memo[0] = 'CANTIDADES' then
        SW := 1;
     }
     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraNSec]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraNSec;
     if (Pos('[MascaraP]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := MascaraP;

     if (Pos('[MascaraL]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := LocalMascaraL;

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);

     if (Memo[0] = '[ImgArticuloPRM]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('PRMIMAGEN').AsInteger, View);

     if (Memo[0] = '[ImgDetalle]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(QMDetalle.FieldByName('ID_IMAGEN').AsInteger, View);

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     s := Trim(Memo[0]);
     if ((Pos('[Firma-', s) > 0) and (View is TfrPictureView)) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 8, Length(s) - Pos(']', s) + 1);
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrPictureView(View).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;

     if Memo[0] = '[NotasArtPRM]' then
     begin
        Memo[0] := ric_prm.Strings[x];
     end;
  end;
end;

procedure TDMLstPedidos.frUDNotasArtFirst(Sender: TObject);
begin
  i := 0;
end;

procedure TDMLstPedidos.frUDNotasArtNext(Sender: TObject);
begin
  i := i + 1;
end;

procedure TDMLstPedidos.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
end;

procedure TDMLstPedidos.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = i);
end;

procedure TDMLstPedidos.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xCliente.Open;
  xProyectos.Open;
  xFormaPago.Open;
  xAlmacen.Open;
  xContacto.Open;
  xAgente.Open;
  xNotasCliente.Open;
  xFichaTecnica.Open;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CAB.ID_S, CAB.TIPO ');
        SQL.Add(' FROM GES_CABECERAS_RELACIONES REL ');
        SQL.Add(' JOIN GES_CABECERAS_S CAB ');
        SQL.Add(' ON ');
        SQL.Add(' CAB.EMPRESA = REL.O_EMPRESA AND ');
        SQL.Add(' CAB.EJERCICIO = REL.O_EJERCICIO AND ');
        SQL.Add(' CAB.CANAL = REL.O_CANAL AND ');
        SQL.Add(' CAB.SERIE = REL.O_SERIE AND ');
        SQL.Add(' CAB.TIPO = REL.O_TIPO AND ');
        SQL.Add(' CAB.RIG = REL.O_RIG ');
        SQL.Add(' WHERE ');
        SQL.Add(' REL.D_EMPRESA = :D_EMPRESA AND ');
        SQL.Add(' REL.D_EJERCICIO = :D_EJERCICIO AND ');
        SQL.Add(' REL.D_CANAL = :D_CANAL AND ');
        SQL.Add(' REL.D_SERIE = :D_SERIE AND ');
        SQL.Add(' REL.D_TIPO = :D_TIPO AND ');
        SQL.Add(' REL.D_RIG = :D_RIG ');
        Params.ByName['D_EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['D_EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['D_CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
        Params.ByName['D_SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
        Params.ByName['D_TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
        Params.ByName['D_RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
        ExecQuery;

        // id_s_cab := FieldByName['ID_S'].AsInteger;
        // Tipo := FieldByName['TIPO'].AsString;
        xGarantiasKri.Close;
        xGarantiasKri.Params.ByName['ID_S'].AsInteger := FieldByName['ID_S'].AsInteger;
        xGarantiasKri.Open;

        FreeHandle;
     finally
        Free;
     end;
  end;

  xTransportistas.Open;
  xDireccionesNIF.Close;
  xDireccionesNIF.Open;
  xLstFirmas.Open;
  xTipoPorte.Open;

  // Dataset especial para Tallas y Colores ordenados por ubicación (alfa_1 y alfa_2 del artículo)
  if Param_MODREST017 then
     QMDetalleAlfa1Alfa2Mod.Open;

  if Param_MODREST017 then
  begin
     with QMDetalleTallas do
     begin
        Close;
        SelectSQL.Clear;
        // También que pertenezcan al mismo origen
        if (Param_LSTOPEC003 = 'S') then
           SelectSQL.Add(' SELECT X.* FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, :ID_G_T, :O_ID_S) X ')
        else
           SelectSQL.Add(' SELECT X.* FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, :ID_G_T, -1) X ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' (ABS(COALESCE(X.T01, 0)) + ABS(COALESCE(X.T02, 0)) + ABS(COALESCE(X.T03, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T04, 0)) + ABS(COALESCE(X.T05, 0)) + ABS(COALESCE(X.T06, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T07, 0)) + ABS(COALESCE(X.T08, 0)) + ABS(COALESCE(X.T09, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T10, 0)) + ABS(COALESCE(X.T11, 0)) + ABS(COALESCE(X.T12, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T13, 0)) + ABS(COALESCE(X.T14, 0)) + ABS(COALESCE(X.T15, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T16, 0)) + ABS(COALESCE(X.T17, 0)) + ABS(COALESCE(X.T18, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T19, 0)) + ABS(COALESCE(X.T20, 0)) + ABS(COALESCE(X.T21, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T22, 0)))  > 0 ');
        if (Param_LSTOPEC002 = '') then
           SelectSQL.Add(' ORDER BY X.CAJA_EDI, X.GENERO, X.FAMILIA, X.SUBFAMILIA, X.REF_PROVEEDOR, X.S_COLOR ')
        else
           SelectSQL.Add(' ORDER BY ' + Param_LSTOPEC002);
     end;

     QMGrupoTalla.Open;
  end;
end;

procedure TDMLstPedidos.xClienteAfterScroll(DataSet: TDataSet);
begin
  with xDireccionFiscal do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Open;
  end;
end;

procedure TDMLstPedidos.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
begin
  if Source = '[FECHA_CABECERA]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);

  if Source = '[PAGINA]' then
  begin
     Pagina := Pagina + 1;
     Source := IntToStr(Pagina);
  end;

  if Source = '[UNIDADES]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES').AsFloat);

  if Source = '[PRECIO_DETALLE]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('PRECIO').AsFloat);

  if Source = '[DTO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[FECHA_ENTREGA_PREV]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime);

  // Activamos la doble cabecera
  if Source = '[ACTIVAR]' then
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
        Source := '';
        IVA := 1;

        // Actualizar las máscaras para el pedido actual
        LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
        LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);
     end;

  // Activamos el IVA para un pedido con 2 páginas.
  if Source = '[ACTIVA_IVA]' then
  begin
     xDobleIva.Close;
     xDobleIva.Open;
     Source := '';
     IVA := 1;
  end;

  if Source = '[NEXT_IVA]' then
  begin
     IVA := IVA + 1;
     xDobleIva.Next;
     if IVA > xDobleIva.RecordCount then
        IVA := -100;
     Source := ' ';
  end;

  if Source = '[PORTES]' then
  begin
     if (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);
  end;

  if Source = '[DOBLE_PORTES]' then
  begin
     if (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger, DobleCabecera.FieldByName('IDIOMA').AsString);
  end;

  if Source = '[DOBLE_I_PP]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleIVA.FieldByName('I_DTO_PP').AsFloat)
     else
        Source := '';
  end;

  if Source = '[DOBLE_I_IVA]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleIVA.FieldByName('I_IVA').AsFloat)
     else
        Source := '';
  end;

  if Source = '[NOTAS]' then
     Source := DobleCabecera.FieldByName('NOTAS').AsString;

  if ((Source = '[MEMO0]') and (ric.Count >= 1)) then
     Source := ric.Strings[0];
  if ((Source = '[MEMO1]') and (ric.Count >= 2)) then
     Source := ric.Strings[1];
  if ((Source = '[MEMO2]') and (ric.Count >= 3)) then
     Source := ric.Strings[2];
  if ((Source = '[MEMO3]') and (ric.Count >= 4)) then
     Source := ric.Strings[3];
  if ((Source = '[MEMO4]') and (ric.Count >= 5)) then
     Source := ric.Strings[4];
  if ((Source = '[MEMO5]') and (ric.Count >= 6)) then
     Source := ric.Strings[5];
  if ((Source = '[MEMO6]') and (ric.Count >= 7)) then
     Source := ric.Strings[6];
  if ((Source = '[MEMO7]') and (ric.Count >= 8)) then
     Source := ric.Strings[7];
  if ((Source = '[MEMO8]') and (ric.Count >= 9)) then
     Source := ric.Strings[8];
  if ((Source = '[MEMO9]') and (ric.Count >= 10)) then
     Source := ric.Strings[9];
  if ((Source = '[MEMO10]') and (ric.Count >= 11)) then
     Source := ric.Strings[10];

  if Source = ' ' then
     Source := '';

  //Portes
  if Source = '[PORTES]' then
  begin
     if (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);
  end;

  if Source = '[DOBLE_PORTES]' then
  begin
     if (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger, DobleCabecera.FieldByName('IDIOMA').AsString);
  end;

  if Source = '[I_PORTES]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_PORTES_CANAL]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  if Source = '[I_DOBLEPORTES]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_DOBLEPORTES_CANAL]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  //Promociones
  if Source = '[UNIDADES_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(MascaraI, QMPromociones.FieldByName('UNIDADES').AsFloat);

  if Source = '[PRECIO_DETALLE_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMPromociones.FieldByName('PRECIO').AsFloat);

  if Source = '[DTO_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMPromociones.FieldByName('DESCUENTO').AsFloat);

  if Source = '[FECHA_ENTREGA_PREV_PRM]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime);
end;

procedure TDMLstPedidos.HYReportLengthBands(Sender: THYReport; Band: THYBand; var Length: integer);
begin
  if (band.HYReportSourceName = 'HYRSDetalle') then
     Length := 1 + n_lineas_memo_detalle;
end;

function TDMLstPedidos.n_lineas_memo_detalle: integer;
begin
  if (QMDetalle.RecordCount > 0) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
  Result := ric.Count;
end;

procedure TDMLstPedidos.HYReportPrepareFields(Sender: THYReport; Field: THYField; Contents: TStrings);
begin
  if (Copy(UHYReport.THYField(Field).Source, 2, 4) = 'MEMO') then
     UHYReport.THYField(Field).Top :=
        (StrToInt(Copy(UHYReport.THYField(Field).Source, 6, 1)) + 1);
end;

procedure TDMLstPedidos.UpdateaDocumentos;
var
  ID_S : integer;
begin
  if (MarcarListado) then
  begin
     with xUpdateaDocumentos do
     begin
        Close;
        SelectSQL.Text := QMCabecera.SelectSQL.Text;
        Plan.Text := QMCabecera.Plan.Text;
        if (id_s_aux = 0) then
           Params.ByName['SERIE'].AsString := SerieGen
        else
           Params.ByName['ID_S'].AsInteger := ID_S_AUX;
        Open;
        if (id_s_aux = 0) then
           if (FiltroGen = 0) then
           begin
              DMMain.FiltraRO(QMCabecera, '11110', False);
              Params.ByName['SERIE'].AsString := SerieGen;
              Open;
           end;
        First;
        ID_S := FieldByName('ID_S').AsInteger;
        while not EOF do
        begin
           ModificaDoc(QGen, ID_S, 2, 0);
           Next;
           ID_S := FieldByName('ID_S').AsInteger;
        end;
        Close;
     end;
  end;
end;

procedure TDMLstPedidos.frPedidosPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstPedidos.QMDetalleAfterOpen(DataSet: TDataSet);
var
  DS : TComponent;
begin
  QMPromociones.Open;
  xArticulos.Open;
  QMEscandallo.Open;
  xProyectosDetalle.Open;
  xArticulosIdioma.Close;
  xArticulosIdioma.Params.ByName['IDIOMA'].AsString := QMCabecera.FieldByName('IDIOMA').AsString;
  xArticulosIdioma.Open;
  QMDetalleUE.Open;
  QSPProcedencia.Open;
  with xDireccionEntregaLinea do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM UT_JUSTIFICA_DOMICILIO (' + IntToStr(QMCabecera.FieldByName('TERCERO').AsInteger) + ') WHERE NUM = ?DIRECCION_ENTREGA';
     Open;
  end;

  // HANDTE - Quiere datos de la orden asociada al pedido
  if ((Param_MODREST006) or (Param_MODREST015)) then
     xOrdProd.Open;
  xArticuloTYC.Open;

  // ABSHOT - Personalizacion
  DS := TDataModule(Self).FindComponent('xCodProvDNKA');
  if Assigned(DS) then
     TFIBDataSetRO(DS).Open;
end;

procedure TDMLstPedidos.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstPedidos.frPedidosUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
var
  Idioma : string;
  Grupo : integer;
  Parser : TfrParser;
  Bandera : string;
begin
  if (Name = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Parser.Calc(p1);
     // Bandera = D el memo está en el pie de pagina y ha de cojer los valores de la doble cabecera
     Bandera := Parser.Calc(p2);
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Val := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstPedidos.MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; aMarcarListado: boolean = True);
var
  str : string;
  Listado : smallint;
  TituloCliente : string;
begin
  id_s_aux := id_s;
  Seriegen := Serie;

  MarcarListado := aMarcarListado;
  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  TituloCliente := '';
  if (LeeParametro('LSTPEC0004') = 'S') then
  begin
     TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
     TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
  end;

  nombreFich := LimpiaNombreFichero(format('%s_%d-%s-%.5d%s.pdf', [_('Pedido'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger, TituloCliente]));

  {Se abre por DataSource
  with QMDetalle do
  begin
     Close;
     Open;
  end;
  }

  with xCliente do
  begin
     Close;
     Open;
  end;

  with xDireccion_Cliente do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').AsInteger;
     Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').AsInteger;
     Open;
  end;

  if (Modo = 1) then
     ModificaDoc(QGen, ID_S, 2, 0);

  Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 2, True);
  if (Listado > 0) then
     DMListados.CargarMail(39, '', Listado)
  else
     DMListados.CargarMail(39, Serie);

  {
  /** Lo que viene aqui está comentado porque en el formulario de pedidos solo se llama
  a  MostrarListadoMail una vez,pasandole como parametro Modo = 2 con lo que envia mail con PDF**/
  
  if (REntorno.TipoListado = 'FRF') then
  begin
    frPedidos.LoadFromFIB(REntorno.Formato, str);
    frPedidos.PrepareReport;
    case modo of
      0: frPedidos.ShowPreparedReport;
      1: frPedidos.PrintPreparedReport(' ', REntorno.Copias);
    end;
  end

  else if (REntorno.TipoListado = 'HYR') and (modo <> 2) then
  begin
    Pagina := 0;
    HYReport.LoadFromFIB(REntorno.Formato, str);
    HYReport.Prepare;
    case Modo of
      0: HYReport.Preview;
      1: for i := 1 to REntorno.Copias do HYReport.Print(REntorno.NombreMatricial);
    end;
  end

  else if (REntorno.TipoListado = 'FR3') then
  begin
    frxPedidos.LoadFromFIB(REntorno.Formato, Str);
    frxPedidos.PrepareReport;
    case Modo of
      0: frxPedidos.ShowPreparedReport;
      1: frxPedidos.PrintPreparedReport(' ',REntorno.Copias);
    end;
  end

  else if (((REntorno.TipoListado = 'HYR') or (REntorno.TipoListado = 'HYM')) and (modo = 2)) then
  begin
    Messagedlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 + 'El listado debe ser del tipo FRF.'),
      mtWarning, [mbOK], 0);
    raise Exception.Create('');
  end;}

  if (REntorno.TipoListado = 'FRF') then
  begin
     with frPedidos do
     begin
        LoadFromFIB(REntorno.Formato, str);
        PrepareReport;
        rutaFich := ExportarPDF(frPedidos, nombreFich);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxPedidos.LoadFromFIB(REntorno.Formato, Str);
     frxPedidos.PrepareReport;
     rutaFich := ExportarPDF(frxPedidos, nombreFich);
  end
  else
  begin
     MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
        'El listado debe ser de los tipos FRF o FR3.'), mtWarning, [mbOK], 0);
     raise Exception.Create('');
  end;

  DMListados.LimpiaEntorno;
end;

// Nuevo

procedure TDMLstPedidos.QMPromocionesAfterOpen(DataSet: TDataSet);
begin
  xArticulosPRM.Open;
end;

procedure TDMLstPedidos.QMPromocionesAfterScroll(DataSet: TDataSet);
begin
  if ((QMPromociones.RecordCount > 0) and (ric_prm <> nil)) then
     ric_prm.Assign(QMPromociones.FieldByName('NOTAS'));
end;

procedure TDMLstPedidos.frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric_prm.Count = x);
end;

procedure TDMLstPedidos.frUDNotasArtPRMFirst(Sender: TObject);
begin
  x := 0;
end;

procedure TDMLstPedidos.frUDNotasArtPRMNext(Sender: TObject);
begin
  x := x + 1;
end;

procedure TDMLstPedidos.frxPedidosGetValue(const VarName: string; var Value: variant);
begin
  frPedidosGetValue(VarName, Value);
end;

procedure TDMLstPedidos.frxPedidosBeforePrint(Sender: TfrxReportComponent);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
        if (Memo.Count > 0) then
        begin

           if Memo[0] = '[NotasArt]' then
              Memo[0] := ric.Strings[i];

           {
           if memo[0] = 'CANTIDADES' then
              SW := 1;
           }
           if (Pos('[MascaraN]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraNSec]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraNSec;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraP]', Memo[0]) > 0) then
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := MascaraP;
                 DisplayFormat.Kind := fkNumeric;
              end;

           if (Pos('[MascaraL]', Memo[0]) > 0) then
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := LocalMascaraL;
                 DisplayFormat.Kind := fkNumeric;
              end;

           //if (QMDetalle.FieldByName('ARTICULO').AsString=REntorno.ArtTextoLibre)and(Memo[0]<>'[Titulo]')and(not Notas) then Memo.Text:='';
           if Memo[0] = '[NotasArtPRM]' then
           begin
              Memo[0] := ric_prm.Strings[x];
           end;
        end;
     end;
  end;

  if (Sender is TfrxPictureView) then
  begin
     s := TfrxPictureView(Sender).TagStr;
     if (s = 'ImgArticulo') then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));

     if (s = 'ImgArticuloPRM') then
        DMListados.MostrarImagen(xArticulos.FieldByName('PRMIMAGEN').AsInteger, TfrxPictureView(Sender));

     if (s = 'ImgDetalle') then
        DMListados.MostrarImagen(QMDetalle.FieldByName('ID_IMAGEN').AsInteger, TfrxPictureView(Sender));

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     if (Pos('Firma-', s) > 0) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 7, Length(s));
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              Imagen.Transparent := True;
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;
  end;
end;

procedure TDMLstPedidos.frxPedidosPrintReport(Sender: TObject);
begin
  UpdateaDocumentos;
end;

procedure TDMLstPedidos.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xCliente.Close;
  xProyectos.Close;
  xFormaPago.Close;  {dji lrk kri}
  xAlmacen.Close;    {dji lrk kri}
  xGarantiasKri.Close;
  xTransportistas.Close;
  xLstFirmas.Close;
  QMGrupoTalla.Close;
  xContacto.Close;
  xAgente.Close;
  xTipoPorte.Close;
  xNotasCliente.Close;
  xFichaTecnica.Close;
end;

procedure TDMLstPedidos.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QMPromociones.Close;
  xArticulos.Close;
  QMEscandallo.Close;
  xProyectosDetalle.Close;
  xArticulosIdioma.Close;
  QMDetalleUE.Close;
  QSPProcedencia.Close;
  xDireccionEntregaLinea.Close;
  if ((Param_MODREST006) or (Param_MODREST015)) then
     xOrdProd.Close;
  xArticuloTYC.Close;
end;

procedure TDMLstPedidos.xClienteAfterOpen(DataSet: TDataSet);
begin
  xTercero.Open;
end;

procedure TDMLstPedidos.xClienteBeforeClose(DataSet: TDataSet);
begin
  xTercero.Close;
end;

procedure TDMLstPedidos.DobleCabeceraAfterOpen(DataSet: TDataSet);
begin
  xDobleIva.Open;
  xDobFormaPago.Open;
  xDobTipoPorte.Open;
end;

procedure TDMLstPedidos.DobleCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDobleIva.Close;
  xDobFormaPago.Close;
  xDobTipoPorte.Close;
end;

procedure TDMLstPedidos.QMPromocionesBeforeClose(DataSet: TDataSet);
begin
  xArticulosPRM.Close;
end;

procedure TDMLstPedidos.QMCabeceraAfterScroll(DataSet: TDataSet);
var
  DatosBancarios : char;
  BancoPagos, BancoFP : integer;
begin
  with QMCabecera do
     DatosBancarios := DMMain.DameDatosBancarios(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('FORMA_PAGO').AsString, BancoFP);
  BancoPagos := xCliente.FieldByName('BANCO_PAGOS').AsInteger;

  with xTerceroBanco do
  begin
     Close;
     // Inicializamos para no mostrar ningun dato
     Params.ByName['TERCERO'].AsInteger := 0;
     Params.ByName['BANCO_CLI'].AsInteger := 0;
     Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['BANCO'].AsInteger := 0;
     case DatosBancarios of
        '1': // Datos del cliente
        begin
           Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').AsInteger;
           // Si el parametro BANCO_CLI = 0, se muestra el primer banco activo según orden
           Params.ByName['BANCO_CLI'].AsInteger := QMCabecera.FieldByName('BANCO').AsInteger;
        end;
        '2': // Datos de la empresa
        begin
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           if (BancoPagos = 0) then
              Params.ByName['BANCO'].AsInteger := BancoFP
           else
              Params.ByName['BANCO'].AsInteger := BancoPagos;
        end;
     end;
     Open;
  end;

  with QMCabecera do
  begin
     // Filtro los recibos relacionados con este documento (anticipos)
     DMRecibosFactura.Mostrar(FieldByName('SERIE').AsString, FieldByName('TIPO').AsString, FieldByName('RIG').AsInteger, FieldByName('EJERCICIO').AsInteger);

     with xRecibosAnticipos do
     begin
        Close;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
     end;

     with xTotalRecibosAnticipos do
     begin
        Close;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
     end;
  end;
end;

function TDMLstPedidos.frxPedidosUserFunction(const MethodName: string; var Params: variant): variant;
var
  Idioma : string;
  Grupo : integer;
  // Parser : TfrxParser;
  Bandera : string;
begin
  if (MethodName = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Params[0];

     Bandera := '';
     Bandera := Params[1];
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Result := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstPedidos.QMGrupoTallaAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
  QMDetalleTallas.Open;
end;

procedure TDMLstPedidos.QMGrupoTallaBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
  QMDetalleTallas.Close;
end;

procedure TDMLstPedidos.QMDetalleTallasAfterOpen(DataSet: TDataSet);
begin
  QMArticuloTallas.Open;
end;

procedure TDMLstPedidos.QMDetalleTallasBeforeClose(DataSet: TDataSet);
begin
  QMArticuloTallas.Close;
end;

procedure TDMLstPedidos.xOrdProdAfterOpen(DataSet: TDataSet);
begin
  xOrdProdEmpleado.Open;
end;

procedure TDMLstPedidos.xOrdProdBeforeClose(DataSet: TDataSet);
begin
  xOrdProdEmpleado.Close;
end;

procedure TDMLstPedidos.DobleCabeceraAfterScroll(DataSet: TDataSet);
var
  DatosBancarios : char;
  BancoPagos, BancoFP : integer;
begin
  BancoPagos := 0;
  if (DobleCabecera.Active) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT BANCO_PAGOS FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND CLIENTE = :CLIENTE';
           Params.ByName['EMPRESA'].AsInteger := DobleCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := DobleCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := DobleCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['CLIENTE'].AsInteger := DobleCabecera.FieldByName('CLIENTE').AsInteger;
           ExecQuery;
           BancoPagos := FieldByName['BANCO_PAGOS'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with DobleCabecera do
     DatosBancarios := DMMain.DameDatosBancarios(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('FORMA_PAGO').AsString, BancoFP);

  with xDobTerceroBan do
  begin
     Close;
     // Inicializamos para no mostrar ningun dato
     Params.ByName['TERCERO'].AsInteger := 0;
     Params.ByName['BANCO_CLI'].AsInteger := 0;
     Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['BANCO'].AsInteger := 0;
     case DatosBancarios of
        '1': // Datos del cliente
        begin
           Params.ByName['TERCERO'].AsInteger := DobleCabecera.FieldByName('TERCERO').AsInteger;
           // Si el parametro BANCO_CLI = 0, se muestra el primer banco activo según orden
           Params.ByName['BANCO_CLI'].AsInteger := DobleCabecera.FieldByName('BANCO').AsInteger;
        end;
        '2': // Datos de la empresa
        begin
           Params.ByName['EMPRESA'].AsInteger := DobleCabecera.FieldByName('EMPRESA').AsInteger;
           if (BancoPagos = 0) then
              Params.ByName['BANCO'].AsInteger := BancoFP
           else
              Params.ByName['BANCO'].AsInteger := BancoPagos;
        end;
     end;
     Open;
  end;
end;

end.
