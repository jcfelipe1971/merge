unit UFMControl_Lotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask,
  DBCtrls, UDBDateTimePicker, UHYDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid,
  ULFEdit, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  ULFEditFind2000, ULFFIBDBEditFind, ULFDBMemo, Barras, ULFDBDateEdit,
  Buttons, ULFDateEdit;

type
  TFMControl_Lotes = class(TFPEdit)
     LBLLote: TLFLabel;
     DBELote: TLFDbedit;
     LBLFFAbricacion: TLFLabel;
     LBLFENvasado: TLFLabel;
     LBLFCaducidad: TLFLabel;
     DTPFFAbricacion: TLFDBDateEdit;
     DTPFEnvasado: TLFDBDateEdit;
     DTPFCaducidad: TLFDBDateEdit;
     AImprimeEtiquetas: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PNLDetalle: TLFPanel;
     PCAsignadosAsignados: TLFPageControl;
     TSAsignadosCompras: TTabSheet;
     TSAsignadosVentas: TTabSheet;
     TSAsignadosMovMan: TTabSheet;
     DBGAsignadosCompras: THYTDBGrid;
     DBGAsignadosVentas: THYTDBGrid;
     DBGAsignadosMovManuales: THYTDBGrid;
     DBEClasificacion: TLFDbedit;
     LClasificacion: TLFLabel;
     LProveedor: TLFLabel;
     DBEProveedor: TLFDBEditFind2000;
     EDescProveedor: TLFEdit;
     DBGFStockArticulo: TDBGridFind2000;
     TSAsignadosProduccion: TTabSheet;
     DBGAsignadosProduccion: THYTDBGrid;
     PCAsignados: TLFPageControl;
     TSAsignados: TTabSheet;
     TSStock: TTabSheet;
     DBGStockLote: THYTDBGrid;
     PNLStocks: TLFPanel;
     LBLArticulo: TLFLabel;
     ETituloArticulo: TLFEdit;
     ToolButton3: TToolButton;
     TSSinAsignar: TTabSheet;
     PCSinAsignarSinAsignar: TLFPageControl;
     TSSinAsignarCompras: TTabSheet;
     DBGSinAsignarCom: THYTDBGrid;
     TSSinAsignarVentas: TTabSheet;
     DBGSinAsignarVen: THYTDBGrid;
     TSSinAsignarMan: TTabSheet;
     DBGSinAsignarMan: THYTDBGrid;
     TSSinAsignarPro: TTabSheet;
     DBGSinAsignarProd: THYTDBGrid;
     LFiltraArticulo: TLFLabel;
     EFFiltraArticulo: TLFEditFind2000;
     LFiltraLote: TLFLabel;
     EFFiltraLote: TLFEditFind2000;
     ToolButton2: TToolButton;
     DBEFArticulo: TLFFibDBEditFind;
     PNLStockInfo: TLFPanel;
     LStocksLote: TLFLabel;
     DBEStocksLote: TLFDbedit;
     LStocksArticulo: TLFLabel;
     EStockTituloArticulo: TLFEdit;
     DBEStockArticulo: TLFDbedit;
     AInventarioPorLotes: TAction;
     AListadoLotesParaCompras: TAction;
     AListadoLotesParaVentas: TAction;
     AListadoLotesParaMovimientos: TAction;
     ATrazabilidadLotes: TAction;
     TSAsignadosMovUbi: TTabSheet;
     DBGAsignadosMovUbicaciones: THYTDBGrid;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     PNLCodigoBarras: TLFPanel;
     CodBarras: TCodeBar;
     ImgCodBarras: TImage;
     LblMedida1: TLFLabel;
     DBEMedida1: TLFDbedit;
     LblMedida2: TLFLabel;
     DBEMedida2: TLFDbedit;
     LblMedida3: TLFLabel;
     DBEMedida3: TLFDbedit;
     LMedida4: TLFLabel;
     DBEMedida4: TLFDbedit;
     LPrecio: TLFLabel;
     LFDBPrecio: TLFDbedit;
     SBAArticulo: TSpeedButton;
     PNLStockArticulo: TLFPanel;
     PNLStockLote: TLFPanel;
     LStockArticulo: TLFLabel;
     LStockLote: TLFLabel;
     TSComposicion: TTabSheet;
     ToolButton1: TToolButton;
     LFiltraClasificacion: TLFLabel;
     EFFiltraClasificacion: TLFEditFind2000;
     DBGComposicionCompuesto: THYTDBGrid;
     TSOrdenesProduccion: TTabSheet;
     DBGOrdenesProduccion: THYTDBGrid;
     TSMovimientosStock: TTabSheet;
     PNLlimites: TLFPanel;
     PNLDetalleMovimientos: TLFPanel;
     EFArtDesdeMovimiento: TLFEditFind2000;
     EFArtHastaMovimiento: TLFEditFind2000;
     LArtHasta: TLFLabel;
     LArtDesde: TLFLabel;
     LLoteDesde: TLFLabel;
     LLoteHasta: TLFLabel;
     LFechaHasta: TLFLabel;
     LFechaDesde: TLFLabel;
     DEFechaHastaMovimientos: TLFDateEdit;
     DEFechaDesdeMovimientos: TLFDateEdit;
     LAlmacenDesde: TLFLabel;
     LAlmacenHasta: TLFLabel;
     EFAlmacenDesde: TLFEditFind2000;
     EFAlmacenHasta: TLFEditFind2000;
     DBGMovimientos: THYTDBGrid;
     ELoteDesde: TLFEdit;
     ELoteHasta: TLFEdit;
     LFamtDesde: TLFLabel;
     LFamHasta: TLFLabel;
     EFFamDesdeMovimiento: TLFEditFind2000;
     EFFamHastaMovimiento: TLFEditFind2000;
     AImprimeEtiquetas2: TAction;
     splStock: TSplitter;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimeEtiquetasExecute(Sender: TObject);
     procedure NavLoteClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBGAsignadosComprasDblClick(Sender: TObject);
     procedure DBGAsignadosVentasDblClick(Sender: TObject);
     procedure DBGAsignadosProduccionDblClick(Sender: TObject);
     procedure DBGAsignadosMovManualesDblClick(Sender: TObject);
     procedure DBGSinAsignarComDblClick(Sender: TObject);
     procedure DBGSinAsignarVenDblClick(Sender: TObject);
     procedure DBGSinAsignarProdDblClick(Sender: TObject);
     procedure DBGSinAsignarManDblClick(Sender: TObject);
     procedure EFFiltraChange(Sender: TObject);
     procedure TSStockShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure AInventarioPorLotesExecute(Sender: TObject);
     procedure AListadoLotesParaComprasExecute(Sender: TObject);
     procedure AListadoLotesParaVentasExecute(Sender: TObject);
     procedure AListadoLotesParaMovimientosExecute(Sender: TObject);
     procedure ATrazabilidadLotesExecute(Sender: TObject);
     procedure DBELoteChange(Sender: TObject);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure DBEProveedorChange(Sender: TObject);
     procedure SBAArticuloDblClick(Sender: TObject);
     procedure DBGOrdenesProduccionDblClick(Sender: TObject);
     procedure DBGOrdenesProduccionCellClick(Column: TColumn);
     procedure TSMovimientosStockShow(Sender: TObject);
     procedure ChangeFiltro(Sender: TObject);
     procedure DBGMovimientosDblClick(Sender: TObject);
     procedure DBGMovimientosCellClick(Column: TColumn);
     procedure DBGMovimientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FamiliaFiltro(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     ColActual, ColumnaMovimientos: TColumn;
     InicializandoValores: boolean;
  public
     { Public declarations }
     procedure AsignaArticulo(Articulo: string; id_a: integer);
     procedure AsignaLote(Articulo: string; id_a, id_lote: integer);
     procedure FiltraLote(FiltroAccion: string);
     procedure PintaCodigoBarras;
  end;

var
  FMControl_Lotes : TFMControl_Lotes;

implementation

uses UFormGest, UDMMain, UDMControl_Lotes, UUtiles, UDameDato, UEntorno,
  UFPregEtiquetasLotes, UFMain, UFPregTrazabilidadLotes, UFPregListadoLotes, UParam;

{$R *.dfm}

procedure TFMControl_Lotes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMControl_Lotes, DMControl_Lotes);
  ControlEdit := CEMain;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  NavMain.DataSource := DMControl_Lotes.DSQMArticulos_Lotes;
  EPMain.DataSource := DMControl_Lotes.DSQMArticulos_Lotes;
  DBGMain.DataSource := DMControl_Lotes.DSQMArticulos_Lotes;
  DBGFStockArticulo.DataSource := DMControl_Lotes.DSxArtStocks2;
  DBGAsignadosProduccion.DataSource := DMControl_Lotes.DsProduccion;
  DBGMovimientos.DataSource := DMControl_Lotes.DSQMMovimientosStock;

  PCMain.ActivePage := TSFicha;
  EFFiltraArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND LOTES=1';
  EFFiltraArticulo.Text := '';
  EFFiltraLote.Text := '';
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND LOTES=1';
  SolapaControles(SBAArticulo, ETituloArticulo);

  InicializandoValores := False;
  ColumnaMovimientos := DBGMovimientos.Columns[0];

  // Color campo ID
  ColorCampoID(DBEFArticulo);
  ColorCampoID(DBELote);

  AImprimeEtiquetas.Caption := DameTituloListadoDefectoGrupo(124);
  AImprimeEtiquetas2.Caption := DameTituloListadoDefectoGrupo(659);
end;

procedure TFMControl_Lotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMControl_Lotes);
end;

procedure TFMControl_Lotes.FormDestroy(Sender: TObject);
begin
  inherited;
  FMControl_Lotes := nil;
end;

procedure TFMControl_Lotes.FormShow(Sender: TObject);
var
  i, idColumna : integer;
begin
  inherited;
  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGMain, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGMain.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMControl_Lotes.AsignaArticulo(Articulo: string; id_a: integer);
begin
  EFFiltraArticulo.Text := Articulo;
  ShowModal;
end;

procedure TFMControl_Lotes.AsignaLote(Articulo: string; id_a, id_lote: integer);
begin
  EFFiltraArticulo.Text := Articulo;
  EFFiltraLote.Text := DameLote(id_lote);
  ShowModal;
end;

procedure TFMControl_Lotes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  EFFiltraArticulo.Text := '';
  EFFiltraLote.Text := '';
  DMControl_Lotes.BusquedaCompleja;
  Continua := False;
end;

procedure TFMControl_Lotes.AImprimeEtiquetasExecute(Sender: TObject);
begin
  inherited;
  { TODO 1 -oDuilio -cLotes : Debo buscar el stock del lote y utilizarlo para enviar el numero de etiquetas a imprimir por defecto }
  TFPregEtiquetasLotes.Create(Self).Muestrate(TAction(Sender).Tag, 1 {StrToIntDef(DBEStock.Text, 0)},
     DMControl_Lotes.QMArticulos_LotesID_LOTE.AsInteger,
     DBEFArticulo.Text, ETituloArticulo.Text, ' ', '',
     DTPFFabricacion.Date,
     DTPFCaducidad.Date, DTPFEnvasado.Date);
end;

procedure TFMControl_Lotes.NavLoteClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  {
  if Button = nbEdit then
  begin
    DBELote.Enabled := False;
    DBELote.Color   := clInfoBk;
    DBELote.Font.Color := clGrayText;
  end
  else
  begin
    DBELote.Enabled := True;
    DBELote.Color   := clWindow;
    DBELote.Font.Color := clWindowText;
  end;
  }
end;

procedure TFMControl_Lotes.DBGAsignadosComprasDblClick(Sender: TObject);
begin
  inherited;
  if (DMControl_Lotes.QMDetComprasTIPO.AsString = 'ALP') then
     FMain.MuestraDocumento(DMControl_Lotes.QMDetComprasEJERCICIO.AsInteger, 'ALP', DMControl_Lotes.QMDetComprasSERIE.AsString, DMControl_Lotes.QMDetComprasRIG.AsInteger);

  if (DMControl_Lotes.QMDetComprasTIPO.AsString = 'FAP') then
     FMain.MuestraDocumento(DMControl_Lotes.QMDetComprasEJERCICIO.AsInteger, 'FAP', DMControl_Lotes.QMDetComprasSERIE.AsString, DMControl_Lotes.QMDetComprasRIG.AsInteger);
end;

procedure TFMControl_Lotes.DBGAsignadosVentasDblClick(Sender: TObject);
begin
  inherited;
  if (DMControl_Lotes.QMDetVentasTIPO.AsString = 'ALB') then
     FMain.MuestraDocumento(DMControl_Lotes.QMDetVentasEJERCICIO.AsInteger, 'ALB', DMControl_Lotes.QMDetVentasSERIE.AsString, DMControl_Lotes.QMDetVentasRIG.AsInteger);

  if (DMControl_Lotes.QMDetVentasTIPO.AsString = 'FAC') then
     FMain.MuestraDocumento(DMControl_Lotes.QMDetVentasEJERCICIO.AsInteger, 'FAC', DMControl_Lotes.QMDetVentasSERIE.AsString, DMControl_Lotes.QMDetVentasRIG.AsInteger);
end;

procedure TFMControl_Lotes.DBGAsignadosProduccionDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOrden, DMControl_Lotes.QMProduccionID_ORDEN.AsString);
end;

procedure TFMControl_Lotes.DBGAsignadosMovManualesDblClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraDocumento(DMControl_Lotes.QMDetMovManEJERCICIO.AsInteger, 'MVT', DMControl_Lotes.QMDetMovManSERIE.AsString, DMControl_Lotes.QMDetMovManRIG.AsInteger);
end;

procedure TFMControl_Lotes.DBGSinAsignarComDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMControl_Lotes.QMComSinAsignarID_E.AsInteger);
end;

procedure TFMControl_Lotes.DBGSinAsignarVenDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMControl_Lotes.QMVentSinAsignarID_S.AsInteger);
end;

procedure TFMControl_Lotes.DBGSinAsignarProdDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOrden, DMControl_Lotes.QMProSinAsignarID_ORDEN.AsString);
end;

procedure TFMControl_Lotes.DBGSinAsignarManDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOrden, DMControl_Lotes.QMProCompSinAsignarID_ORDEN.AsString);
end;

procedure TFMControl_Lotes.EFFiltraChange(Sender: TObject);
begin
  inherited;
  DMControl_Lotes.Filtra(EFFiltraArticulo.Text, EFFiltraLote.Text, EFFiltraClasificacion.Text);
end;

procedure TFMControl_Lotes.TSStockShow(Sender: TObject);
begin
  inherited;
  DMControl_Lotes.AbreStock;
end;

procedure TFMControl_Lotes.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMain.ActivePage = TSStock) then
     DMControl_Lotes.CierraStock;
end;

procedure TFMControl_Lotes.AInventarioPorLotesExecute(Sender: TObject);
begin
  inherited;
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.FiltraTipo('I'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMControl_Lotes.AListadoLotesParaComprasExecute(Sender: TObject);
begin
  inherited;
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.FiltraTipo('C'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMControl_Lotes.AListadoLotesParaVentasExecute(Sender: TObject);
begin
  inherited;
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.FiltraTipo('V'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMControl_Lotes.AListadoLotesParaMovimientosExecute(Sender: TObject);
begin
  inherited;
  FPregListadoLotes := TFPregListadoLotes.Create(Self);
  FPregListadoLotes.EstablecerFiltros(DBEFArticulo.Text, DBEFArticulo.Text, DBELote.Text, DBELote.Text, '');
  FPregListadoLotes.FiltraTipo('M'); // Decimos al Formulario qué tipo de listado es
end;

procedure TFMControl_Lotes.ATrazabilidadLotesExecute(Sender: TObject);
begin
  inherited;
  TFPregTrazabilidadLotes.Create(Self).ShowModal;
end;

procedure TFMControl_Lotes.FiltraLote(FiltroAccion: string);
begin
  DMControl_Lotes.QMArticulos_Lotes.Close;
  Self.TSFicha.Show;
  DMControl_Lotes.FiltraLote(FiltroAccion);
end;

procedure TFMControl_Lotes.PintaCodigoBarras;
begin
  ImgCodBarras.Picture := nil;
  try
     CodBarras.codigo := DBELote.Text;
     CodBarras.Texto := CodBarras.Codigo;
     CodBarras.DibujaCodeBar(ImgCodBarras.Canvas);
  except
     ImgCodBarras.Picture := nil;
  end;
  ImgCodBarras.Refresh;
end;

procedure TFMControl_Lotes.DBELoteChange(Sender: TObject);
begin
  inherited;
  PintaCodigoBarras;
end;

procedure TFMControl_Lotes.DBEFArticuloChange(Sender: TObject);
begin
  inherited;
  { TODO : Cambiar esto por dos DBEdit que tiren de DMControl_Lotes.QMArticulos_LotesTITULO }
  ETituloArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
  EStockTituloArticulo.Text := ETituloArticulo.Text;
end;

procedure TFMControl_Lotes.DBEProveedorChange(Sender: TObject);
begin
  inherited;
  EDescProveedor.Text := DameTituloProveedor(StrToIntDef(DBEProveedor.Text, 0));
end;

procedure TFMControl_Lotes.SBAArticuloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMControl_Lotes.QMArticulos_LotesARTICULO.AsString + '''');
end;

procedure TFMControl_Lotes.DBGOrdenesProduccionDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, DMControl_Lotes.QMOrdenesProduccionID_ORDEN.AsString);

  if (UpperCase(ColActual.FieldName) = 'ESCANDALLO') then
     FMain.EjecutaAccion(FMain.AProEscandalloSF, 'ESCANDALLO = ' + DMControl_Lotes.QMOrdenesProduccionESCANDALLO.AsString);
end;

procedure TFMControl_Lotes.DBGOrdenesProduccionCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMControl_Lotes.TSMovimientosStockShow(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;
  InicializandoValores := True;
  try
     EFAlmacenDesde.Text := REntorno.AlmacenDefecto;
     EFAlmacenHasta.Text := REntorno.AlmacenDefecto;
     EFArtDesdeMovimiento.Text := DMControl_Lotes.QMArticulos_LotesARTICULO.AsString;
     EFArtHastaMovimiento.Text := DMControl_Lotes.QMArticulos_LotesARTICULO.AsString;
     EFFamDesdeMovimiento.Text := DMMain.DameFamiliaArticulo(DMControl_Lotes.QMArticulos_LotesARTICULO.AsString, DMControl_Lotes.QMArticulos_LotesEMPRESA.AsInteger);
     EFFamHastaMovimiento.Text := DMMain.DameFamiliaArticulo(DMControl_Lotes.QMArticulos_LotesARTICULO.AsString, DMControl_Lotes.QMArticulos_LotesEMPRESA.AsInteger);
     ELoteDesde.Text := DMControl_Lotes.QMArticulos_LotesLOTE.AsString;
     ELoteHasta.Text := DMControl_Lotes.QMArticulos_LotesLOTE.AsString;
     DameMinMax('EJE', Min, Max);
     DEFechaDesdeMovimientos.Date := Min;
     DEFechaHastaMovimientos.Date := Max;
  finally
     InicializandoValores := False;
  end;

  ChangeFiltro(Sender);
end;

procedure TFMControl_Lotes.ChangeFiltro(Sender: TObject);
begin
  inherited;
  if not InicializandoValores then
     DMControl_Lotes.FiltraStockMovimientos(EFAlmacenDesde.Text, EFAlmacenHasta.Text, EFArtDesdeMovimiento.Text, EFArtHastaMovimiento.Text, ELoteDesde.Text, ELoteHasta.Text, EFFamDesdeMovimiento.Text, EFFamHastaMovimiento.Text, DEFechaDesdeMovimientos.Date, DEFechaHastaMovimientos.Date);
end;

procedure TFMControl_Lotes.DBGMovimientosDblClick(Sender: TObject);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if ((UpperCase(ColumnaMovimientos.FieldName) = 'DOC_TIPO') or
        (UpperCase(ColumnaMovimientos.FieldName) = 'DOC_SERIE') or
        (UpperCase(ColumnaMovimientos.FieldName) = 'DOC_NUMERO')) then
     begin
        if (DMControl_Lotes.QMMovimientosStockDOC_TIPO.AsString = 'MAN') then
           FMain.TraspasoDeDocumentosMovimiento(DMControl_Lotes.QMMovimientosStockID_DOC.AsInteger)
        else
        if (DMControl_Lotes.QMMovimientosStockTIPO_OPER.AsString = 'E') then
           FMain.TraspasoDeDocumentosEntrada(DMControl_Lotes.QMMovimientosStockID_DOC.AsInteger)
        else
           FMain.TraspasoDeDocumentosSalida(DMControl_Lotes.QMMovimientosStockID_DOC.AsInteger);
     end
     else
     if (UpperCase(ColumnaMovimientos.FieldName) = 'ARTICULO') then
     begin
        FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMControl_Lotes.QMMovimientosStockARTICULO.AsString + '''');
     end;
  end;
end;

procedure TFMControl_Lotes.DBGMovimientosCellClick(Column: TColumn);
begin
  inherited;
  ColumnaMovimientos := Column;
end;

procedure TFMControl_Lotes.DBGMovimientosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'ARTICULO') or
     (UpperCase(Column.FieldName) = 'DOC_TIPO') or
     (UpperCase(Column.FieldName) = 'DOC_SERIE') or
     (UpperCase(Column.FieldName) = 'DOC_NUMERO')) then
  begin
     CeldaEnlace(THYTDBGrid(Sender), Rect);
  end;

  with THYTDBGrid(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'DOC_TIPO') or
        (UpperCase(Column.FieldName) = 'DOC_SERIE') or
        (UpperCase(Column.FieldName) = 'DOC_NUMERO')) then
     begin
        if (DataSource.DataSet.FieldByName('ID_DOC').AsInteger >= 0) then
           ColorInfo(Canvas)
        else
           ColorError(Canvas);
     end
     else
     if (Column.FieldName = 'CANAL') then
     begin
        if (DataSource.DataSet.FieldByName(Column.FieldName).AsInteger = REntorno.Canal) then
           ColorInfo(Canvas)
        else
           ColorInactivo(Canvas);
     end
     else
     // Muestro las entradas resaltadas
     if ((DMControl_Lotes.QMMovimientosStockTIPO_OPER.AsString = 'E') or (DMControl_Lotes.QMMovimientosStockTIPO_OPER.AsString = 'D')) then
        ColorResaltado2(Canvas)
     else
        ColorInfo(Canvas);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMControl_Lotes.FamiliaFiltro(Sender: TObject);
begin
  inherited;
  TEditFind2000(Sender).CondicionBusqueda := ' familia <> ''' + REntorno.FamSistema + '''';
end;

end.
