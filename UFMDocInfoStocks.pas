unit UFMDocInfoStocks;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls, UControlEdit, UFormGest,
  UEditPanel, ULFToolBar, ULFDBEdit, ULFPanel, ULFMemo, ULFLabel, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFPageControl, ULFDBEditFind2000, ULFEditFind2000, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UNavigator, TFlatCheckBoxUnit, ULFCheckBox, ULFEdit;

type
  TFMDocInfoStocks = class(TFPEditSinNavegador)
     EFArticulo: TLFEditFind2000;
     DBETitulo_Art: TLFDbedit;
     EFAlmacen: TLFEditFind2000;
     DBETitulo_Alm: TLFDbedit;
     PNLStocks: TLFPanel;
     LEntrada: TLFLabel;
     DBEEntradas: TLFDbedit;
     LSalida: TLFLabel;
     DBESalidas: TLFDbedit;
     LExistencia: TLFLabel;
     DBEExistencias: TLFDbedit;
     DBEValor_Entradas: TLFDbedit;
     DBEValor_Salidas: TLFDbedit;
     DBEValor_Existencias: TLFDbedit;
     LUdsExt: TLFLabel;
     DBEUdsExt: TLFDbedit;
     LReservadas: TLFLabel;
     LEnProceso: TLFLabel;
     DBEReservadas: TLFDbedit;
     DBEEnProceso: TLFDbedit;
     LPrecioPonderado: TLFLabel;
     DBEPedidosDeCliente: TLFDbedit;
     DBEPedidosAProveedor: TLFDbedit;
     LStockNegativo: TLFLabel;
     LMargen: TLFLabel;
     DBEPrecioPonderado: TLFDbedit;
     DBGFAlmacenes: TDBGridFind2000;
     DBEExistTotales: TLFDbedit;
     LTotales: TLFLabel;
     RelojAviso: TTimer;
     PNLExistenciasPedidos: TLFPanel;
     PNLStockAlmacenes: TLFPanel;
     PCMain: TLFPageControl;
     TSStock: TTabSheet;
     TSUbicacion: TTabSheet;
     TSLotes: TTabSheet;
     DBGUbicaciones: TDBGridFind2000;
     DBGLotes: TDBGridFind2000;
     TSNroSerieKRI: TTabSheet;
     DBGNroSerieKRI: TDBGridFind2000;
     LStockTiendaVirtual: TLFLabel;
     TSStockFuturo: TTabSheet;
     DBGStockfuturo: TDBGridFind2000;
     LMaximo: TLFLabel;
     LMinimo: TLFLabel;
     LVirtual: TLFLabel;
     DBEStockMaximo: TLFDbedit;
     DBEStockMinimo: TLFDbedit;
     DBEVirtual: TLFDbedit;
     TButCambiaEquivalente: TToolButton;
     TSNroSerie: TTabSheet;
     DBGNroSerie: TDBGridFind2000;
     TSMovStock: TTabSheet;
     DBGMovStock: TDBGridFind2000;
     TBStockFuturo: TLFToolBar;
     NavStockFuturo: THYMNavigator;
     ToolButton12: TToolButton;
     LColorLanzada: TLFLabel;
     LColorReservada: TLFLabel;
     LColorCerradaParcialmente: TLFLabel;
     LPedidoCliente: TLFLabel;
     LPedidoProveedor: TLFLabel;
     DBGFTarifa: TDBGridFind2000;
     PNLLimites: TLFPanel;
     LArticulo: TLFLabel;
     LAlmacen: TLFLabel;
     PNLStockTiendaVirtual: TLFPanel;
     LSTV: TLFLabel;
     PNLExistencias: TLFPanel;
     TBMovStock: TLFToolBar;
     NavMovStock: THYMNavigator;
     TButtSep1: TToolButton;
     PNLStockMovimientosPMP: TLFPanel;
     CBCalcularPMPMovimientos: TLFCheckBox;
     LPreparadas: TLFLabel;
     DBEPreparadas: TLFDbedit;
     PNLImagen: TLFPanel;
     PNLDatosLimite: TLFPanel;
     Imagen: TImage;
     LReal: TLFLabel;
     DBEStockReal: TLFDbedit;
     LInfoVirtual: TLFLabel;
     LInfoReal: TLFLabel;
     PNLDatosChile: TLFPanel;
     LAlfa1: TLFLabel;
     EAlfa1: TLFEdit;
     CBSepararAlmacenes: TLFCheckBox;
     PNLSepararAlmacenes: TLFPanel;
     Splitter1: TSplitter;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFAlmacenesDblClick(Sender: TObject);
     procedure RelojAvisoTimer(Sender: TObject);
     procedure LStockNegativoClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGStockfuturoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TButCambiaEquivalenteClick(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure DBGStockfuturoDblClick(Sender: TObject);
     procedure DBGMovStockDblClick(Sender: TObject);
     procedure DBGFAlmacenesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEResaltaValor(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure CBCalcularPMPMovimientosChange(Sender: TObject);
     procedure ImagenDblClick(Sender: TObject);
     procedure CBSepararAlmacenesChange(Sender: TObject);
     procedure PNLStocksResize(Sender: TObject);
     procedure Splitter1Moved(Sender: TObject);
  private
     { Private declarations }
     Empresa, Canal: smallint;
     StockNegativo: boolean;
     AlmacenResaltado: string;
     FactoEscalaDBGFTarifa: double;
  public
     { Public declarations }
     procedure Inicializa(aEmpresa: smallint; aCanal: smallint; aArticulo: string; aAlmacen: string; aStockNegativo: boolean);
  end;

var
  FMDocInfoStocks : TFMDocInfoStocks;

procedure AbreStocks(aEmpresa: smallint; aCanal: smallint; aArticulo: string; aAlmacen: string; Padre: TComponent; const aStockNegativo: smallint = 0);

implementation

uses UDMDocInfoStocks, UDMMain, UEntorno, UDMPrestashop, UFMSeleccionGrid, UUtiles, UFMain, UParam, UFMostrarImagen, UImagenes;

{$R *.DFM}

procedure AbreStocks(aEmpresa: smallint; aCanal: smallint; aArticulo: string; aAlmacen: string; Padre: TComponent; const aStockNegativo: smallint = 0);
begin
  // DMDocInfoStocks.MuestraInfo(Empresa, Canal, Articulo, Almacen, FMDocInfoStocks.CBCalcularPMPMovimientos.Checked, CBSepararAlmacenes.Checked);

  with TFMDocInfoStocks.Create(Padre) do
  begin
     try
        {
        StockNegativo: smallint;
        EFAlmacen.Text := Almacen;
        VStockNegativo := (StockNegativo = 1);
        LStockNegativo.Visible := VStockNegativo;
        LStockNegativo.Visible := VStockNegativo;
        RelojAviso.Enabled := VStockNegativo;
        EFArticulo.Text := Articulo;
        }
        Inicializa(aEmpresa, aCanal, aArticulo, aAlmacen, (aStockNegativo = 1));

        if (REntorno.Pais = 'CHL') then
           EAlfa1.Text := DMMain.DameAlfaArticulo(aArticulo, 1);

        ShowModal;
     finally
        Free;
     end;
  end;
end;

procedure TFMDocInfoStocks.FormCreate(Sender: TObject);
var
  Columna : integer;
begin
  inherited;
  AbreData(TDMDocInfoStocks, DMDocInfoStocks);

  SalirConEscape;

  if REntorno.Delegacion = 'S' then
  begin
     DBEValor_Entradas.Visible := False;
     DBEValor_Salidas.Visible := False;
     DBEValor_Existencias.Visible := False;
     LPrecioPonderado.Visible := False;
     DBEPrecioPonderado.Visible := False;
  end
  else
  begin
     DBEValor_Entradas.Visible := True;
     DBEValor_Salidas.Visible := True;
     DBEValor_Existencias.Visible := True;
     LPrecioPonderado.Visible := True;
     DBEPrecioPonderado.Visible := True;
  end;

  TButCambiaEquivalente.Visible := (LeeParametro('MODREST006') = 'S');

  AlmacenResaltado := Trim(LeeParametro('INFOSTK001'));
  EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';

  // DOCPCTA001 - Utiliza precios de coste en ART_ARTICULOS_TARIFAS
  if (LeeParametro('DOCPCTA001') <> 'S') then
  begin
     with DBGFTarifa do
     begin
        Columna := EncuentraField(DBGFTarifa, 'PRECIO_COSTE');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
        Columna := EncuentraField(DBGFTarifa, 'PRECIO_COMPRA');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
        Columna := EncuentraField(DBGFTarifa, 'DESCUENTO_COMPRA');
        if (Columna >= 0) then
           Columns[Columna].Visible := False;
     end;
  end;

  if (LeeParametro('MODREST025') <> 'S') then
  begin
     TSUbicacion.Free;

     Columna := EncuentraField(DBGLotes, 'ID_UBICACION');
     if (Columna >= 0) then
        DBGLotes.Columns[Columna].Visible := False;
     Columna := EncuentraField(DBGLotes, 'CALLE');
     if (Columna >= 0) then
        DBGLotes.Columns[Columna].Visible := False;
     Columna := EncuentraField(DBGLotes, 'ESTANTERIA');
     if (Columna >= 0) then
        DBGLotes.Columns[Columna].Visible := False;
     Columna := EncuentraField(DBGLotes, 'REPISA');
     if (Columna >= 0) then
        DBGLotes.Columns[Columna].Visible := False;
     Columna := EncuentraField(DBGLotes, 'POSICION');
     if (Columna >= 0) then
        DBGLotes.Columns[Columna].Visible := False;
     Columna := EncuentraField(DBGLotes, 'COMPOSICION');
     if (Columna >= 0) then
        DBGLotes.Columns[Columna].Visible := False;
  end;

  PNLDatosChile.Visible := (REntorno.Pais = 'CHL');
  LAlfa1.Caption := LeeParametro(format('ARTDESC%3.3d', [1]));
  FactoEscalaDBGFTarifa := 3.5;

  PCMain.ActivePage := TSStock;
end;

procedure TFMDocInfoStocks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDocInfoStocks);
end;

procedure TFMDocInfoStocks.DBGFAlmacenesDblClick(Sender: TObject);
begin
  EFAlmacen.Text := DMDocInfoStocks.xArtStocks2ALMACEN.AsString;
end;

procedure TFMDocInfoStocks.RelojAvisoTimer(Sender: TObject);
begin
  if (LStockNegativo.Color = clRed) then
  begin
     LStockNegativo.Color := clBtnFace;
     LStockNegativo.Font.Color := clRed;
  end
  else
  begin
     LStockNegativo.Color := clRed;
     LStockNegativo.Font.Color := clWhite;
  end;
end;

procedure TFMDocInfoStocks.LStockNegativoClick(Sender: TObject);
begin
  if (StockNegativo) then
  begin
     (Sender as TLabel).Visible := True;
     RelojAviso.Enabled := False;
  end;
end;

procedure TFMDocInfoStocks.FormShow(Sender: TObject);
begin
  // Calculo y muestro el stock que hay en la tienda virtual si corresponde
  if (LeeParametro('MODSINC004') = 'S') then
  begin
     PNLStockTiendaVirtual.Visible := True;
     AbreData(TDMPrestashop, DMPrestashop);
     LStockTiendaVirtual.Caption := DMMain.DameUnidadesConFormato(DMDocInfoStocks.xArtStocksARTICULO.AsString, DMPrestashop.DameStockTienda(DMDocInfoStocks.xArtStocksID_A.AsInteger)) + ' '; // Agrego un espacio para que quede mejor
     CierraData(DMPrestashop);
  end
  else
     PNLStockTiendaVirtual.Visible := False;

  if (DMMain.EstadoKri(372) = 1) then
  begin
     TSNroSerie.TabVisible := False;
     TSNroSerieKRI.TabVisible := True;
  end
  else
  begin
     TSNroSerie.TabVisible := True;
     TSNroSerieKRI.TabVisible := False;
  end;
end;

procedure TFMDocInfoStocks.DBGStockfuturoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Situacion : integer;
begin
  if ((UpperCase(Column.FieldName) = 'DOC_TIPO') or (UpperCase(Column.FieldName) = 'DOC_SERIE') or (UpperCase(Column.FieldName) = 'DOC_NUMERO') or (UpperCase(Column.FieldName) = 'DOCUMENTO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'DOCUMENTO') then
        begin
           if ((DataSource.DataSet.FieldByName('TIPO').AsString = 'MAT') or (DataSource.DataSet.FieldByName('TIPO').AsString = 'PRO')) then
           begin
              Situacion := DMMain.DameSituacionOrden(DataSource.DataSet.FieldByName('ID_DOC').AsInteger);

              case Situacion of
                 1: // Lanzada
                    ColorResaltado(Canvas);
                 2: // Reservada
                    ColorResaltado6(Canvas);
                 3: // Cerrada Parcialmente
                    ColorResaltado5(Canvas);
              end;
           end;
        end;

        if (UpperCase(Column.FieldName) = 'STOCK') then
        begin
           begin
              if (DataSource.DataSet.FieldByName(Column.FieldName).AsFloat > 0) then
                 ColorResaltado2(Canvas)
              else
              if (DataSource.DataSet.FieldByName(Column.FieldName).AsFloat = 0) then
                 ColorResaltado(Canvas)
              else
                 ColorError(Canvas);
           end;
        end;

        if (Column.FieldName = 'PMP') then
        begin
           if (CBCalcularPMPMovimientos.Checked) then
              ColorInfo(TDBGrid(Sender).Canvas)
           else
              ColorInactivo(TDBGrid(Sender).Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with DBGridFind2000}
end;

procedure TFMDocInfoStocks.TButCambiaEquivalenteClick(Sender: TObject);
var
  s : TStrings;
  Seleccion : TFMSeleccionGrid;
  ArticuloOriginal : string;
begin
  ArticuloOriginal := EFArticulo.Text;
  Seleccion := TFMSeleccionGrid.Create(Self);
  with Seleccion do
  begin
     try
        s := TStringList.Create;
        try
           with s do
           begin
              Add(' /* Las equivalencias de una cabecera */ ');
              Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO_LARGO AS TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, D.ARTICULO_EQUIVAL, 1)) STOCK_TOTAL');
              Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
              Add(' JOIN PRO_SYS_DET_EQUIVAL D ON C.EMPRESA = D.EMPRESA AND C.ID_EQUIVAL = D.ID_EQUIVAL ');
              Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
              Add(' WHERE ');
              Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' C.ARTICULO = ''' + ArticuloOriginal + ''' ');
              Add(' UNION ');
              Add(' /* Los padres de equivalencias de un detalle */ ');
              Add(' SELECT C.ARTICULO AS ARTICULO, A.TITULO_LARGO AS TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, C.ARTICULO, 1)) STOCK_TOTAL');
              Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
              Add(' JOIN ART_ARTICULOS A ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO ');
              Add(' WHERE ');
              Add(' C.ID_EQUIVAL IN ( ');
              Add(' SELECT ID_EQUIVAL ');
              Add(' FROM PRO_SYS_DET_EQUIVAL ');
              Add(' WHERE ');
              Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' ARTICULO_EQUIVAL = ''' + ArticuloOriginal + ''') ');
              Add(' UNION ');
              Add(' /* Los hermanos de equivalencias de un detalle */ ');
              Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO_LARGO AS TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, D.ARTICULO_EQUIVAL, 1)) STOCK_TOTAL');
              Add(' FROM PRO_SYS_DET_EQUIVAL D ');
              Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
              Add(' WHERE ');
              Add(' D.ARTICULO_EQUIVAL <> ''' + ArticuloOriginal + ''' AND ');
              Add(' D.ID_EQUIVAL IN ( ');
              Add(' SELECT ID_EQUIVAL ');
              Add(' FROM PRO_SYS_DET_EQUIVAL ');
              Add(' WHERE ');
              Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' ARTICULO_EQUIVAL = ''' + ArticuloOriginal + ''') ');
           end;
           Caption := _('Selección de artículo');
           AsignaSQL(s.Text);
        finally
           s.Free
        end;

        MostrarColumna('ARTICULO', _('Artículo'), 90);
        MostrarColumna('TITULO', _('Nombre'), 256);
        MostrarColumna('STOCK_TOTAL', _('Stock Total'), 90);

        if (ShowModal = mrOk) then
        begin
           if (Trim(FDS.FieldByName('ARTICULO').AsString) <> '') then
              Inicializa(Empresa, Canal, Trim(FDS.FieldByName('ARTICULO').AsString), EFAlmacen.Text, StockNegativo);
        end;
     finally
        FreeAndNil(Seleccion);
     end;
  end;
end;

procedure TFMDocInfoStocks.EFAlmacenChange(Sender: TObject);
begin
  DMDocInfoStocks.MuestraInfo(Empresa, Canal, EFArticulo.Text, EFAlmacen.Text, CBCalcularPMPMovimientos.Checked, CBSepararAlmacenes.Checked);
end;

procedure TFMDocInfoStocks.DBGStockfuturoDblClick(Sender: TObject);
var
  Tipo : string;
begin
  // Se muestra el documento clicado
  // DMDocInfoStocks.DSQMStockFuturo
  Tipo := DMDocInfoStocks.QMStockFuturoTIPO.AsString;
  if ((Tipo = 'MAT') or (Tipo = 'PRO')) then
     FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DMDocInfoStocks.QMStockFuturoID_DOC.AsInteger))
  else
  if ((Tipo = 'MAN') or (Tipo = 'MOE') or (Tipo = 'MOS') or (Tipo = 'MOT')) then
     FMain.TraspasoDeDocumentosMovimiento(DMDocInfoStocks.QMStockFuturoID_DOC.AsInteger)
  else
  if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
     FMain.TraspasoDeDocumentosSalida(DMDocInfoStocks.QMStockFuturoID_DOC.AsInteger)
  else
     FMain.TraspasoDeDocumentosEntrada(DMDocInfoStocks.QMStockFuturoID_DOC.AsInteger);

  Close;
end;

procedure TFMDocInfoStocks.DBGMovStockDblClick(Sender: TObject);
var
  Tipo : string;
begin
  // Se muestra el documento clicado
  // DMDocInfoStocks.DSQMMovStock
  Tipo := DMDocInfoStocks.QMMovStockDOC_TIPO.AsString;
  if ((Tipo = 'MAT') or (Tipo = 'PRO')) then
     FMain.EjecutaAccion(FMain.AProOrden, IntToStr(DMDocInfoStocks.QMMovStockID_DOC.AsInteger))
  else
  if ((Tipo = 'MAN') or (Tipo = 'MOE') or (Tipo = 'MOS') or (Tipo = 'MOT')) then
     FMain.TraspasoDeDocumentosMovimiento(DMDocInfoStocks.QMMovStockID_DOC.AsInteger)
  else
  if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
     FMain.TraspasoDeDocumentosSalida(DMDocInfoStocks.QMMovStockID_DOC.AsInteger)
  else
     FMain.TraspasoDeDocumentosEntrada(DMDocInfoStocks.QMMovStockID_DOC.AsInteger);

  Close;
end;

procedure TFMDocInfoStocks.DBGFAlmacenesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     if (DMDocInfoStocks.xArtStocks2.FieldByName('ALMACEN').AsString = AlmacenResaltado) then
        ColorResaltado3(Canvas)
     else
        ColorInfo(Canvas);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMDocInfoStocks.DBEResaltaValor(Sender: TObject);
begin
  inherited;
  with TLFDBEdit(Sender) do
  begin
     if (DataSource.DataSet.FieldByName(DataField).AsFloat > 0) then
        ColorResaltado4(TLFDBEdit(Sender))
     else
        ColorInfo(TLFDBEdit(Sender));
  end;
end;

procedure TFMDocInfoStocks.EFArticuloChange(Sender: TObject);
begin
  inherited;
  DMDocInfoStocks.MuestraInfo(Empresa, Canal, EFArticulo.Text, EFAlmacen.Text, CBCalcularPMPMovimientos.Checked, CBSepararAlmacenes.Checked);

  // Guardo en el Tag el codigo de la imagen
  Imagen.Tag := DMDocInfoStocks.DameImagenArticulo(Empresa, EFArticulo.Text);
  RefrescarImagen(Imagen, Imagen.Tag);
end;

procedure TFMDocInfoStocks.Inicializa(aEmpresa, aCanal: smallint; aArticulo, aAlmacen: string; aStockNegativo: boolean);
begin
  Empresa := aEmpresa;
  Canal := aCanal;
  StockNegativo := aStockNegativo;

  LStockNegativo.Visible := StockNegativo;
  LStockNegativo.Visible := StockNegativo;
  RelojAviso.Enabled := StockNegativo;
  EFAlmacen.Text := aAlmacen;
  EFArticulo.Text := aArticulo;

  DMDocInfoStocks.MuestraInfo(Empresa, Canal, EFArticulo.Text, EFAlmacen.Text, CBCalcularPMPMovimientos.Checked, CBSepararAlmacenes.Checked);
end;

procedure TFMDocInfoStocks.CBCalcularPMPMovimientosChange(Sender: TObject);
begin
  inherited;
  DMDocInfoStocks.MuestraInfo(Empresa, Canal, EFArticulo.Text, EFAlmacen.Text, CBCalcularPMPMovimientos.Checked, CBSepararAlmacenes.Checked);
end;

procedure TFMDocInfoStocks.ImagenDblClick(Sender: TObject);
begin
  inherited;
  MuestraImagen(Imagen.Tag);
end;

procedure TFMDocInfoStocks.CBSepararAlmacenesChange(Sender: TObject);
begin
  inherited;
  DMDocInfoStocks.MuestraInfo(Empresa, Canal, EFArticulo.Text, EFAlmacen.Text, CBCalcularPMPMovimientos.Checked, CBSepararAlmacenes.Checked);
end;

procedure TFMDocInfoStocks.PNLStocksResize(Sender: TObject);
begin
  inherited;
  if (FactoEscalaDBGFTarifa = 0) then
     FactoEscalaDBGFTarifa := 3.5;

  DBGFTarifa.Height := Trunc(PNLStockAlmacenes.Height / FactoEscalaDBGFTarifa);
end;

procedure TFMDocInfoStocks.Splitter1Moved(Sender: TObject);
begin
  inherited;
  if (PNLStockAlmacenes.Height = 0) then
     FactoEscalaDBGFTarifa := 3.5
  else
     FactoEscalaDBGFTarifa := PNLStockAlmacenes.Height / DBGFTarifa.Height;
end;

end.
