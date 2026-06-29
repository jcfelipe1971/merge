unit UDMLstOfertas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO,
  HYFIBQuery, UHYReportMail, UHYReport, FR_Pars, frxClass, frxDBSet,
  frxHYReport, FIBTableDataSetRO;

type
  TDMLstOfertas = class(TDataModule)
     frOfertas: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frDBDetalle: TfrDBDataSet;
     QMCabecera: TFIBDataSetRO;
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
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSxCliente: THYReportSource;
     HYRSxDireccionCliente: THYReportSource;
     HYRxTercero: THYReportSource;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSxDireccion_Cliente: TDataSource;
     DobleCabecera: TFIBDataSetRO;
     DSDobleCabecera: TDataSource;
     DSxDireccionFiscal: TDataSource;
     xDireccionFiscal: TFIBDataSetRO;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xMonedasIdiomas: TFIBDataSetRO;
     DSxMonedasIdiomas: TDataSource;
     HYRSxArticulos: THYReportSource;
     frDBxGarantiasKri: TfrDBDataSet;
     xGarantiasKri: TFIBDataSetRO;
     DSxGarantiasKri: TDataSource;
     frDBDobleCabecera: TfrDBDataSet;
     xFormaPago: TFIBDataSetRO;
     DSxFormaPago: TDataSource;
     frDBxFormaPago: TfrDBDataSet;
     xAgente: TFIBDataSetRO;
     DSxAgente: TDataSource;
     frDBDxAgente: TfrDBDataSet;
     xNombreIva: TFIBDataSetRO;
     DSxNombreIva: TDataSource;
     frDBxNombreIva: TfrDBDataSet;
     frDBxCliente: TfrDBDataSet;
     frDBPromociones: TfrDBDataSet;
     xArticulosPRM: TFIBDataSetRO;
     DSxArticulosPRM: TDataSource;
     frDBxArticulosPRM: TfrDBDataSet;
     QMPromociones: TFIBDataSetRO;
     frUDNotasArtPRM: TfrUserDataset;
     DSQMPromociones: TDataSource;
     HYRSPromociones: THYReportSource;
     frUDSubTotal: TfrUserDataset;
     frxDBCabecera: TfrxDBDataset;
     frxDBDetalle: TfrxDBDataset;
     frxDBPromociones: TfrxDBDataset;
     frxUDNotasArt: TfrxUserDataSet;
     frxUDNotasArtPRM: TfrxUserDataSet;
     frxOfertas: TfrxHYReport;
     DSxTerceroBanco: TDataSource;
     frDBxTerceroBanco: TfrDBDataSet;
     xTerceroBanco: TFIBDataSetRO;
     DSxDobTerceroBan: TDataSource;
     frDBxDobTerceroBan: TfrDBDataSet;
     xDobTerceroBan: TFIBDataSetRO;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     xArticulosIdioma: TFIBDataSetRO;
     DSxArticulosIdioma: TDataSource;
     frDBxArticulosIdioma: TfrDBDataSet;
     xEmpleado: TFIBDataSetRO;
     DSxEmpleado: TDataSource;
     xDatosIva: TFIBDataSetRO;
     DSxDatosIva: TDataSource;
     frDBxDatosIva: TfrDBDataSet;
     frxDBxDatosIva: TfrxDBDataset;
     xDobleIVA: TFIBDataSetRO;
     DSxDobleIVA: TDataSource;
     DSDetalleDetalle: TDataSource;
     QMDetalleDetalle: TFIBDataSetRO;
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
     xEtiEscandallo: TFIBDataSetRO;
     DSEtiEscandallo: TDataSource;
     frDBEtiEscandallo: TfrDBDataSet;
     HYRSEtiEscandallo: THYReportSource;
     xArticuloTYC: TFIBDataSetRO;
     DSxArticuloTYC: TDataSource;
     xFichaTecnica: TFIBDataSetRO;
     DSxFichaTecnica: TDataSource;
     procedure frOfertasGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstOfertasDestroy(Sender: TObject);
     procedure frOfertasEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstOfertasCreate(Sender: TObject);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure xClienteAfterScroll(DataSet: TDataSet);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frOfertasPrintReport;
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure HYReportPrintReport(Sender: THYReport);
     procedure frOfertasUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure QMPromocionesAfterOpen(DataSet: TDataSet);
     procedure QMPromocionesAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasArtPRMFirst(Sender: TObject);
     procedure frUDNotasArtPRMNext(Sender: TObject);
     procedure frxOfertasGetValue(const VarName: string; var Value: variant);
     procedure frxOfertasBeforePrint(Sender: TfrxReportComponent);
     procedure frxOfertasPrintReport(Sender: TObject);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMPromocionesBeforeClose(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterOpen(DataSet: TDataSet);
     procedure DobleCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
     function frxOfertasUserFunction(const MethodName: string; var Params: variant): variant;
     procedure QMGrupoTallaAfterOpen(DataSet: TDataSet);
     procedure QMGrupoTallaBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleTallasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     indNotasArt: integer;
     indNotasArt_prm: integer;
     ric, ric_prm: TStringList;
     SubTotal: double;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     Pagina: integer;
     id_s_aux, FiltroGen: integer;
     SerieGen: string;
     MarcarListado: boolean;
     Param_MODREST017: boolean;
     Param_LSTOOFC001: string;
     Param_LSTOOFC002: string;
     Param_LSTOOFC003: string;
  public
     { Public declarations }
     nombreFich, rutaFich: string;
     procedure MostrarListado(ID_S: integer; Modo, Numero: byte; Serie: string; aMarcarListado: boolean = True);
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
     procedure MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; aMarcarListado: boolean = True);
     procedure MostrarListadoFacProforma(id_s: integer; Modo: integer; aMarcarListado: boolean = True);
     procedure MostrarListadoFacProformaMail(id_s: integer; Modo: integer; aMarcarListado: boolean = True);
     procedure UpdateaDocumentos;
  end;

var
  DMLstOfertas : TDMLstOfertas;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles, frxRich,
  UDMRecibosFactura, UDMFirmaElectronica, ExtCtrls, UParam, UFMain, UDameDato, UImagenes;

{$R *.DFM}

procedure TDMLstOfertas.DMLstOfertasCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  AbreData(TDMRecibosFactura, DMRecibosFactura);

  ric := TStringList.Create;
  ric_prm := TStringList.Create;

  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');
  Param_LSTOOFC001 := LeeParametro('LSTOOFC001');
  Param_LSTOOFC002 := LeeParametro('LSTOOFC002');
  Param_LSTOOFC003 := LeeParametro('LSTOOFC003');

  if Param_MODREST017 then
  begin
     with QMGrupoTalla do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' /* Los distintos grupos de talla que intervienen en el detalle del documento */ ');
        SelectSQL.Add(' /* Solo los que tienen lineas con unidades */ ');
        if (Param_LSTOOFC003 = 'S') then
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
        if (Param_LSTOOFC003 = 'S') then
           SelectSQL.Add(' ORDER BY X.O_DOC, X.ID_G_T DESC ')
        else
           SelectSQL.Add(' ORDER BY X.ID_G_T DESC ');
     end;
  end;

  QMDetalle.Close;
  with QMDetalle.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_DETALLE_OFERTA_C_LST WHERE ID_S = ?ID_S ');

     // 228 - 1 - Listados de OFC, muestra las promociones como una linea mas. (No en un subdetalle)
     if (DMMain.EstadoKri(228) <> 1) then
        Add(' AND TIPO_LINEA <> ''PRM'' ');

     if ((Param_LSTOOFC001) = '') then
        Add(' ORDER BY ORDEN ')
     else
        Add(' ORDER BY ' + Param_LSTOOFC001);
  end;

  frxOfertas.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');

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

procedure TDMLstOfertas.DMLstOfertasDestroy(Sender: TObject);
begin
  ric.Free;
  ric_prm.Free;
  CierraData(DMListados);
  CierraData(DMRecibosFactura);
end;

procedure TDMLstOfertas.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
var
  Titulo : string;
begin
  SerieGen := Serie;
  id_s_aux := 0;
  FiltroGen := Filtro;
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

  Titulo := '';
  DMListados.Imprimir(38, 0, Modo, Serie, Titulo, frOfertas, frxOfertas, HYReport);
end;

procedure TDMLstOfertas.MostrarListado(ID_S: integer; Modo, Numero: byte; Serie: string; aMarcarListado: boolean = True);
var
  Titulo, TituloCliente : string;
  Grupo : integer;
  Listado : smallint;
begin
  MarcarListado := aMarcarListado;
  try
     case numero of
        1: Grupo := 38;
        2: Grupo := 107;
        3: Grupo := 108;
        4: Grupo := 109;
        else
           Grupo := 38;
     end;

     with QMCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;

     SerieGen := QMCabecera.FieldByName('SERIE').AsString;
     id_s_aux := id_s;

     {Se llama a la funcion ObtenerListadoPerfil que comprueba si tiene algun listado
     o copias asignado para el perfil del cliente
     Solo si se selecciono el listado 1.
     1 - Ofertas a Clientes}

     Listado := 0;
     if (numero = 1) then
        Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 1);

     if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
        REntorno.Copias := DMListados.Copias;

     if (Modo = 0) then
        REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

     TituloCliente := '';
     if (LeeParametro('LSTOFC0004') = 'S') then
     begin
        TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
        TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
     end;

     Titulo := _('Oferta') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString + TituloCliente;

     DMListados.Imprimir(Grupo, Listado, Modo, QMCabecera.FieldByName('SERIE').AsString, Titulo, frOfertas, frxOfertas, HYReport, LimpiaNombreFichero(Titulo + '.pdf'));
  finally
     MarcarListado := True;
  end;
end;

procedure TDMLstOfertas.MostrarListadoFacProforma(id_s: integer; Modo: integer; aMarcarListado: boolean = True);
var
  Titulo, TituloCliente : string;
  Grupo : integer;
  Listado : smallint;
begin
  Grupo := 79;
  MarcarListado := aMarcarListado;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  SerieGen := QMCabecera.FieldByName('SERIE').AsString;
  id_s_aux := id_s;

  Listado := 0;

  if (Modo = 0) then
     REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

  TituloCliente := '';
  if (LeeParametro('LSTOFC0004') = 'S') then
  begin
     TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
     TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
  end;

  Titulo := _('Proforma') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString + TituloCliente;

  DMListados.Imprimir(Grupo, Listado, Modo, QMCabecera.FieldByName('SERIE').AsString, Titulo, frOfertas, frxOfertas, HYReport, LimpiaNombreFichero(Titulo + '.pdf'));
end;

procedure TDMLstOfertas.frOfertasGetValue(const ParName: string; var ParValue: variant);
var
  SuProv : string;
  Cambio : extended;
  Base : double;
  i : integer;
  GiroCliente, TituloGiroCliente : string;
begin
  DMListados.GetValue(ParName, ParValue);
  Cambio := 0;

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
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if (ParName = 'Su_Proveedor') then
  begin
     SuProv := Trim(xCliente.FieldByName('SU_PROVEEDOR').AsString);
     if (SuProv <> '') then
        ParValue := _('PROV.') + ': ' + SuProv
     else
        ParValue := '';
  end;

  if ParName = 'Oferta' then
  begin
     ParValue := QMCabecera.FieldByName('RIG').AsInteger;

     // Refrescar la Doble Cabecera
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
     end;

     // Actualizar las máscaras para la oferta actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
  end;

  if ParName = 'pbruto' then
     ParValue := QMCabecera.FieldByName('B_Dto_Lineas').Value;

  if ParName = 'pneto' then
     ParValue := QMCabecera.FieldByName('B_Dto_Lineas').Value -
        QMCabecera.FieldByName('I_DTO_PP').Value;

  if ParName = 'pb_imponible' then
     ParValue :=
        QMCabecera.FieldByName('LIQUIDO').Value - QMCabecera.FieldByName('S_CUOTA_IVA').Value;

  if ParName = 'ptotal' then
     ParValue := QMCabecera.FieldByName('LIQUIDO').Value;

  if ParName = 'pimp_iva' then
     ParValue := QMCabecera.FieldByName('S_CUOTA_IVA').Value;

  if ParName = 'pp_pp' then
     ParValue := QMCabecera.FieldByName('DTO_PP').Value;

  if ParName = 'pi_pp' then
     ParValue := QMCabecera.FieldByName('I_DTO_PP').Value;

  if ParName = 'Fecha' then
     SubTotal := 0;

  if ParName = 'Nombre_tipo_iva' then
     ParValue := DMMain.DameNombreIva(REntorno.Pais, xDatosIva.FieldByName('TIPO_IVA').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);

  if ParName = 'BaseDtos' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM DAME_BASES_POR_IVA (:ID_S) WHERE TIPO_IVA = :TIPO_IVA';
           Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
           Params.ByName['TIPO_IVA'].AsInteger := xDatosIva.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['BASE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Imp_dto_Cial' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM DAME_BASES_POR_IVA (:ID_S) WHERE TIPO_IVA = :TIPO_IVA';
           Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
           Params.ByName['TIPO_IVA'].AsInteger := xDatosIva.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           Base := FieldByName['BASE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ParValue := ((QMCabecera.FieldByName('DTO_CIAL').Value * Base) / 100);
  end;

  if ParName = 'TotalLinea' then
  begin
     SubTotal := SubTotal + QMDetalle.FieldByName('B_DTO_LINEA').AsFloat;
     ParValue := QMDetalle.FieldByName('B_DTO_LINEA').AsFloat;
  end;

  if ParName = 'SubTotal' then
     ParValue := SubTotal;

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

  if ParName = 'Total_Factura' then
     ParValue := QMCabecera.FieldByName('LIQUIDO').AsFloat;

  if ParName = 'Total_FacturaE' then
     ParValue := DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, 'EUR', QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio);

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

  if ParName = 'UnidadesPRM' then
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

  if UpperCase(ParName) = 'VERSION_OFERTA_ORIGINAL' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 RTIPO || '' '' || REJERCICIO || ''-'' || RSERIE || ''/'' || RRIG ');
           SQL.Add(' FROM G_RELACIONES_ORIGENES(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
           SQL.Add(' ORDER BY REJERCICIO, RRIG ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
           Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
           Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
           ExecQuery;
           ParValue := Fields[0].AsString;
           if (Fields[0].AsString < ' ') then
              ParValue := '';
           FreeHandle;
        finally
           Free;
        end;
     end;

  end;

  if UpperCase(ParName) = 'VERSION_OFERTA_NRO' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT COUNT(*) ');
           SQL.Add(' FROM G_RELACIONES_ORIGENES(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
           Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
           Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
           ExecQuery;
           ParValue := Fields[0].AsInteger;
           if (Fields[0].AsInteger = 0) then
              ParValue := '';
           FreeHandle;
        finally
           Free;
        end;
     end;
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

procedure TDMLstOfertas.frOfertasEnterRect(Memo: TStringList; View: TfrView);
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
        Memo[0] := ric.Strings[indNotasArt];

     if (Pos('[Notas]', Memo[0]) > 0) then
     begin
        if QMCabecera.FieldByName('NOTAS').Value = '' then
        begin
           view.Visible := False;
           view.Parent.dy := 0;
        end
        else
        begin
           if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
              view.Parent.dy := 0
           else
           begin
              view.Parent.dy := 34;
              view.Visible := True;
           end;
        end;
     end;

     // if memo[0] = 'CANTIDADES' then
     //    SW := 1;

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;

     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';

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

     // if (QMDetalle.FieldByName('ARTICULO').AsString=REntorno.ArtTextoLibre)and(Memo[0]<>'[Titulo]')and(not Notas) then Memo.Text:='';
     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);

     if (Memo[0] = '[ImgArticuloPRM]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulosPRM.FieldByName('IMAGEN').AsInteger, View);

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
        Memo[0] := ric_prm.Strings[indNotasArt_prm];
     end;
  end;
end;

procedure TDMLstOfertas.frUDNotasArtFirst(Sender: TObject);
begin
  indNotasArt := 0;
end;

procedure TDMLstOfertas.frUDNotasArtNext(Sender: TObject);
begin
  indNotasArt := indNotasArt + 1;
end;

procedure TDMLstOfertas.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = indNotasArt);
end;

procedure TDMLstOfertas.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
end;

procedure TDMLstOfertas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xCliente.Open;
  xDireccion_Cliente.Open;
  xGarantiasKri.Open;
  xAgente.Open;
  xProyectos.Open;
  xFormaPago.Open;
  xDatosIVA.Open;
  xNombreIVA.Open;
  xDireccionesNIF.Close;
  xDireccionesNIF.Open;
  xLstFirmas.Open;
  xContacto.Open;
  xTipoPorte.Open;
  xEtiEscandallo.Open;
  xFichaTecnica.Open;

  xEmpleado.Close;
  xEmpleado.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xEmpleado.Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
  xEmpleado.Open;

  if Param_MODREST017 then
  begin
     with QMDetalleTallas do
     begin
        Close;
        SelectSQL.Clear;
        // También que pertenezcan al mismo origen
        if (Param_LSTOOFC003 = 'S') then
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
        if (Param_LSTOOFC002 = '') then
           SelectSQL.Add(' ORDER BY X.CAJA_EDI, X.GENERO, X.FAMILIA, X.SUBFAMILIA, X.REF_PROVEEDOR, X.S_COLOR ')
        else
           SelectSQL.Add(' ORDER BY ' + Param_LSTOOFC002);
     end;

     QMGrupoTalla.Open;
  end;
end;

procedure TDMLstOfertas.xClienteAfterScroll(DataSet: TDataSet);
begin
  with xDireccionFiscal do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Open;
  end;
end;

procedure TDMLstOfertas.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  cambio : extended;
begin
  // Cabecera
  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;

  if Source = '[NIF_EMPRESA]' then
     Source := REntorno.CifEmpresa;

  if Source = '[DIR_EMPRESA]' then
     Source := REntorno.DirEmpresa + #13#10 + REntorno.PobEmpresa +
        ' (' + REntorno.ProvEmpresa + ' - ' + REntorno.Pais + ')';

  if Source = '[TELF_EMPRESA]' then
     Source := REntorno.Tel1Empresa;

  if Source = '[DIR_CLIENTE]' then
  begin
     Source := xDireccion_Cliente.FieldByName('DIRECCION').AsString + #13#10 +
        xDireccion_Cliente.FieldByName('CODPOB').AsString +
        ' (' + xDireccion_Cliente.FieldByName('PROVINCIA').AsString + ' - ' +
        xDireccion_Cliente.FieldByName('PAIS').AsString + ')';
  end;

  if Source = '[POB_PROV_CLI]' then
  begin
     Source := xDireccion_Cliente.FieldByName('CODPOB').AsString;
  end;

  if Source = '[COD_CLI]' then
     Source := '(' + Trim(xCliente.FieldByName('CLIENTE').AsString) + ')';

  if Source = '[FECHA_CABECERA]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);

  if Source = '[PAGINA]' then
  begin
     Pagina := Pagina + 1;
     Source := IntToStr(Pagina);
  end;

  if Source = '[ACTIVAR]' then
  begin
     Source := '';

     // Actualizar las máscaras para la oferta actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
  end;

  // Detalle

  if Source = '[ARTICULO]' then
     if QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre then
        Source := ' '
     else
        Source := QMDetalle.FieldByName('ARTICULO').AsString;

  if Source = '[UNIDADES]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES').AsFloat);

  if Source = '[DTO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[PRECIO_DETALLE]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('PRECIO').AsFloat);

  if Source = '[B_DTO_LINEA]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('B_DTO_LINEA').AsFloat);

  if Source = '[MONEDA]' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        Source := 'Moneda: ' + xMonedas.FieldByName('TITULO').AsString;
     end;

  if Source = '[TOTAL_A_COBRAR]' then
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('LIQUIDO').AsFloat);

  if Source = '[TOTAL_MONEDA_SEC]' then
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := 'Total ' + Moneda_Sec + ':'
     else
        Source := ' ';
  end;

  if Source = '[I_TOTALMONSEC]' then
  begin
     cambio := 0;
     if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := FormatFloat(LocalMascaraNSec, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio))
     else
        Source := ' ';
  end;

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
  if Source = '[ARTICULO_PRM]' then
     if QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre then
        Source := ' '
     else
        Source := QMPromociones.FieldByName('ARTICULO').AsString;

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

  if Source = '[B_DTO_LINEA_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMPromociones.FieldByName('B_DTO_LINEA').AsFloat);
end;

procedure TDMLstOfertas.UpdateaDocumentos;
var
  id_s : integer;
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
           ModificaDoc(QGen, ID_S, 3, 0);
           Next;
           ID_S := FieldByName('ID_S').AsInteger;
        end;
     end;
  end;
end;

procedure TDMLstOfertas.frOfertasPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstOfertas.QMDetalleAfterOpen(DataSet: TDataSet);
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
  QMDetalleDetalle.Open;
  QMDetalleUE.Open;
  with xDireccionEntregaLinea do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM UT_JUSTIFICA_DOMICILIO (' + IntToStr(QMCabecera.FieldByName('TERCERO').AsInteger) + ') WHERE NUM = ?DIRECCION_ENTREGA';
     Open;
  end;
  xArticuloTYC.Open;

  // ABSHOT - Personalizacion
  DS := TDataModule(Self).FindComponent('xCodProvDNKA');
  if Assigned(DS) then
     TFIBDataSetRO(DS).Open;
end;

procedure TDMLstOfertas.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstOfertas.frOfertasUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
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

procedure TDMLstOfertas.DobleCabeceraAfterScroll(DataSet: TDataSet);
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

procedure TDMLstOfertas.MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; aMarcarListado: boolean = True);
var
  str : string;
  Grupo : integer;
  Listado : smallint;
  TituloCliente : string;
begin
  MarcarListado := aMarcarListado;
  Grupo := 38;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  SerieGen := QMCabecera.FieldByName('SERIE').AsString;
  id_s_aux := id_s;

  TituloCliente := '';
  if (LeeParametro('LSTOFC0004') = 'S') then
  begin
     TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
     TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
  end;

  nombreFich := LimpiaNombreFichero(format('%s_%d-%s-%.5d%s.pdf', [_('Oferta'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger, TituloCliente]));

  Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 1, True);
  if (Listado > 0) then
     DMListados.CargarMail(Grupo, '', Listado)
  else
     DMListados.CargarMail(Grupo, QMCabecera.FieldByName('SERIE').AsString);

  if (REntorno.TipoListado = 'FRF') then
  begin
     with frOfertas do
     begin
        LoadFromFIB(REntorno.Formato, str);
        PrepareReport;
        rutaFich := ExportarPDF(frOfertas, nombreFich);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxOfertas.LoadFromFIB(REntorno.Formato, Str);
     frxOfertas.PrepareReport;
     rutaFich := ExportarPDF(frxOfertas, nombreFich);
  end
  else
  begin
     MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
        'El listado debe ser de los tipos FRF o FR3.'), mtWarning, [mbOK], 0);
     raise Exception.Create('');
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstOfertas.MostrarListadoFacProformaMail(id_s: integer; Modo: integer; aMarcarListado: boolean = True);
var
  str : string;
  Grupo : integer;
  TituloCliente : string;
begin
  Grupo := 79;
  MarcarListado := aMarcarListado;
  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  SerieGen := QMCabecera.FieldByName('SERIE').AsString;
  id_s_aux := id_s;

  TituloCliente := '';
  if (LeeParametro('LSTOFC0004') = 'S') then
  begin
     TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
     TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
  end;

  nombreFich := LimpiaNombreFichero(format('%s_%d-%s-%.5d%s.pdf', [_('Proforma'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger, TituloCliente]));

  DMListados.CargarMail(Grupo, QMCabecera.FieldByName('SERIE').AsString);

  if (REntorno.TipoListado = 'FRF') then
  begin
     with frOfertas do
     begin
        LoadFromFIB(REntorno.Formato, str);
        PrepareReport;
        rutaFich := ExportarPDF(frOfertas, nombreFich);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxOfertas.LoadFromFIB(REntorno.Formato, Str);
     frxOfertas.PrepareReport;
     rutaFich := ExportarPDF(frxOfertas, nombreFich);
  end
  else
  begin
     MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
        'El listado debe ser de los tipos FRF o FR3.'), mtWarning, [mbOK], 0);
     raise Exception.Create('');
  end;

  AbreData(TDMFirmaElectronica, DMFirmaElectronica);
  rutaFich := DMFirmaElectronica.FirmaPDF(rutaFich);
  nombreFich := ExtractFileName(rutaFich);
  CierraData(DMFirmaElectronica);

  DMListados.LimpiaEntorno;
end;

procedure TDMLstOfertas.QMPromocionesAfterOpen(DataSet: TDataSet);
begin
  xArticulosPRM.Open;
end;

procedure TDMLstOfertas.QMPromocionesAfterScroll(DataSet: TDataSet);
begin
  if ((QMPromociones.RecordCount > 0) and (ric_prm <> nil)) then
     ric_prm.Assign(QMPromociones.FieldByName('NOTAS'));
  //if QMDetalle.Eof then QMDetalle.Close;
  {xArticulosPRM.Close;
  xArticulosPRM.Open;}
end;

procedure TDMLstOfertas.frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric_prm.Count = indNotasArt_prm);
end;

procedure TDMLstOfertas.frUDNotasArtPRMFirst(Sender: TObject);
begin
  indNotasArt_prm := 0;
end;

procedure TDMLstOfertas.frUDNotasArtPRMNext(Sender: TObject);
begin
  indNotasArt_prm := indNotasArt_prm + 1;
end;

procedure TDMLstOfertas.frxOfertasGetValue(const VarName: string; var Value: variant);
begin
  frOfertasGetValue(VarName, Value);
end;

procedure TDMLstOfertas.frxOfertasBeforePrint(Sender: TfrxReportComponent);
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
              Memo[0] := ric.Strings[indNotasArt];

           // if memo[0] = 'CANTIDADES' then
           //    SW := 1;

           if (Pos('[MascaraN]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;

           if (Pos('[MascaraE]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
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

           if Memo[0] = '[NotasArtPRM]' then
           begin
              Memo[0] := ric_prm.Strings[indNotasArt_prm];
           end;
        end;
     end;
  end;

  if (Sender is TfrxRichView) then
  begin
     with TfrxRichView(Sender) do
     begin
        if (TagStr = 'Notas') then
        begin
           if QMCabecera.FieldByName('Notas').Value = '' then
           begin
              Visible := False;
              Parent.Height := 0;
           end
           else
           begin
              if Copy(QMCabecera.FieldByName('Notas').Value, 1, 4) = #$D#$A#$D#$A then
                 Parent.Height := 0
              else
              begin
                 Parent.Height := 34;
                 Visible := True;
              end;
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
        DMListados.MostrarImagen(xArticulosPRM.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));

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

procedure TDMLstOfertas.frxOfertasPrintReport(Sender: TObject);
begin
  UpdateaDocumentos;
end;

procedure TDMLstOfertas.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xCliente.Close;
  xDireccion_Cliente.Close;
  xGarantiasKri.Close;
  xAgente.Close;
  xProyectos.Close;
  xFormaPago.Close;
  xDatosIVA.Close;
  xNombreIVA.Close;
  xLstFirmas.Close;
  xContacto.Close;
  xTipoPorte.Close;
  xEtiEscandallo.Close;
  xEmpleado.Close;
  QMGrupoTalla.Close;
  xFichaTecnica.Close;
end;

procedure TDMLstOfertas.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QMPromociones.Close;
  xArticulos.Close;
  QMEscandallo.Close;
  xProyectosDetalle.Close;
  xArticulosIdioma.Close;
  QMDetalleDetalle.Close;
  QMDetalleUE.Close;
  xDireccionEntregaLinea.Close;
  xArticuloTYC.Close;
end;

procedure TDMLstOfertas.QMPromocionesBeforeClose(DataSet: TDataSet);
begin
  xArticulosPRM.Close;
end;

procedure TDMLstOfertas.xClienteAfterOpen(DataSet: TDataSet);
begin
  xTercero.Open;
end;

procedure TDMLstOfertas.xClienteBeforeClose(DataSet: TDataSet);
begin
  xTercero.Close;
end;

procedure TDMLstOfertas.DobleCabeceraAfterOpen(DataSet: TDataSet);
begin
  xDobleIva.Open;
  xDobTipoPorte.Open;
end;

procedure TDMLstOfertas.DobleCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDobleIva.Close;
  xDobTipoPorte.Close;
end;

procedure TDMLstOfertas.QMCabeceraAfterScroll(DataSet: TDataSet);
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

function TDMLstOfertas.frxOfertasUserFunction(const MethodName: string; var Params: variant): variant;
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

procedure TDMLstOfertas.QMGrupoTallaAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
  QMDetalleTallas.Open;
end;

procedure TDMLstOfertas.QMGrupoTallaBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
  QMDetalleTallas.Close;
end;

procedure TDMLstOfertas.QMDetalleTallasAfterOpen(DataSet: TDataSet);
begin
  if QMGrupoTalla.Active then
     DMMain.Log(format('QMDetalleTallasAfterOpen ID_G_T=%d - ID_S=%d - O_ID_S=%d - O_DOC=%s - ',
        [QMGrupoTalla.FieldByName('ID_G_T').AsInteger,
        QMGrupoTalla.FieldByName('ID_S').AsInteger,
        QMGrupoTalla.FieldByName('O_ID_S').AsInteger,
        QMGrupoTalla.FieldByName('O_DOC').AsString]))
  else
     DMMain.Log('QMDetalleTallasAfterOpen (QMGrupoTalla.Active=False)');

  QMArticuloTallas.Open;
end;

procedure TDMLstOfertas.QMDetalleTallasBeforeClose(DataSet: TDataSet);
begin
  DMMain.Log('QMDetalleTallasBeforeClose');
  QMArticuloTallas.Close;
end;

end.
