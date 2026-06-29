unit UFMNecesidadMateraPrima;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, ULFPageControl, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, UNavigator,
  TFlatCheckBoxUnit, ULFCheckBox, Mask, rxToolEdit, ULFDateEdit, ULFEdit,
  StdCtrls, ULFEditFind2000, ULFLabel;

type
  TFMNecesidadMateraPrima = class(TFPEditSinNavegador)
     LFCategoryAction1: TLFCategoryAction;
     ARecalcularNecesidades: TAction;
     PCMain: TLFPageControl;
     TSNecesidades: TTabSheet;
     sgNecesidades: TStringGrid;
     TSPedidosVenta: TTabSheet;
     sgPedidosVenta: TStringGrid;
     ARecalcularPedidosVenta: TAction;
     ARecalcularPedidosCompra: TAction;
     TSPedidosCompra: TTabSheet;
     sgPedidosCompra: TStringGrid;
     TSStockFuturo: TTabSheet;
     sgStockFuturo: TStringGrid;
     ARecalcularStockFuturo: TAction;
     ProgressBar: TProgressBar;
     ARecalcularTodo: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AExportacionExcel: TAction;
     TSSeleccionPedidos: TTabSheet;
     TBSeleccionPedido: TLFToolBar;
     NavSeleccionPedido: THYMNavigator;
     DBGSeleccionPedido: TDBGridFind2000;
     CBTodosLosPedidos: TLFCheckBox;
     TButtSep1: TToolButton;
     TButtMarcarTodosPedidos: TToolButton;
     TButtDesmarcarTodosPedidos: TToolButton;
     TBFiltroProveedores: TLFToolBar;
     TButtAnyadirSelecClientes: TToolButton;
     TButtQuitarSelecClientes: TToolButton;
     PNLClientes: TLFPanel;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     LCliente: TLFLabel;
     EFClienteDesde: TLFEditFind2000;
     EFClienteHasta: TLFEditFind2000;
     ETituloClienteDesde: TLFEdit;
     ETituloClienteHasta: TLFEdit;
     TBFiltroFechaEntrega: TLFToolBar;
     TButtAnyadirSelecFechas: TToolButton;
     TButtQuitarSelecFechas: TToolButton;
     PNLSeleccionFechas: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LFechaPrevista: TLFLabel;
     DTPDesdeFecha: TLFDateEdit;
     DTPHastaFecha: TLFDateEdit;
     TButtMostrarFiltros: TToolButton;
     PNLSeleccionPedidos: TLFPanel;
     TButtSep2: TToolButton;
     TSSimulacionPedidosCompra: TTabSheet;
     SGSimulacion: TStringGrid;
     ARecalcularSimulacion: TAction;
     TSRecursos: TTabSheet;
     SGRegursos: TStringGrid;
     ARecalcularRecursos: TAction;
     PNLDatosPropuesta: TLFPanel;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     EProveedor: TLFEdit;
     LUnidades: TLFLabel;
     EUnidades: TLFEdit;
     BOk: TButton;
     BCancel: TButton;
     DEFechaEntrega: TLFDateEdit;
     LFechaEntrega: TLFLabel;
     LPrueba: TLFLabel;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     EFAlmacen: TLFEditFind2000;
     LAlmacen: TLFLabel;
     DBGProveedoresArticulo: TNsDBGrid;
     PNLDatosParaPropuesta: TLFPanel;
     ButtSep1: TToolButton;
     TButtInfStocks: TToolButton;
     AOtros: TLFCategoryAction;
     AInfStocks: TAction;
     PNLAlmacenStock: TLFPanel;
     EFAlmacenStock: TLFEditFind2000;
     LAlmacenStock: TLFLabel;
     ButtSep2: TToolButton;
     CBComprasDeNecesidades: TLFCheckBox;
     PNLFiltroArticulo: TLFPanel;
     LArticulo: TLFLabel;
     EFArticulo: TLFEditFind2000;
     PNLFiltroFamilia: TLFPanel;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     BFiltrarFamilia: TButton;
     procedure ARecalcularTodoExecute(Sender: TObject);
     procedure ARecalcularPedidosVentaExecute(Sender: TObject);
     procedure ARecalcularPedidosCompraExecute(Sender: TObject);
     procedure ARecalcularNecesidadesExecute(Sender: TObject);
     procedure ARecalcularStockFuturoExecute(Sender: TObject);
     procedure ARecalcularSimulacionExecute(Sender: TObject);
     procedure ARecalcularRecursosExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure sgDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure AExportacionExcelExecute(Sender: TObject);
     procedure TButtMarcarTodosPedidosClick(Sender: TObject);
     procedure TButtDesmarcarTodosPedidosClick(Sender: TObject);
     procedure CBTodosLosPedidosChange(Sender: TObject);
     procedure TButtMostrarFiltrosClick(Sender: TObject);
     procedure TButtAnyadirSelecFechasClick(Sender: TObject);
     procedure EFClienteDesdeChange(Sender: TObject);
     procedure EFClienteHastaChange(Sender: TObject);
     procedure TButtQuitarSelecFechasClick(Sender: TObject);
     procedure TButtAnyadirSelecClientesClick(Sender: TObject);
     procedure TButtQuitarSelecClientesClick(Sender: TObject);
     procedure DBGSeleccionPedidoDblClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure SGSimulacionDblClick(Sender: TObject);
     procedure SGSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
     procedure BOkClick(Sender: TObject);
     procedure DBGProveedoresArticuloDblClick(Sender: TObject);
     procedure sgPedidosVentaDblClick(Sender: TObject);
     procedure sgPedidosCompraDblClick(Sender: TObject);
     procedure AInfStocksExecute(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFFamiliaBusqueda(Sender: TObject);
     procedure BFiltrarFamiliaClick(Sender: TObject);
  private
     { Private declarations }
     Columna, Fila: integer;
     MostrandoFiltros: boolean;
     FormCaption: string;
     procedure LimpiarStringGrid(sg: TStringGrid);
     procedure RenumerarStringGrid(sg: TStringGrid);
     procedure PosicionarSemanaStringGrid(sg: TStringGrid);
     procedure PosicionarStringGrid(sg: TStringGrid; ACol, ARow: integer);
  public
     { Public declarations }
  end;

var
  FMNecesidadMateraPrima : TFMNecesidadMateraPrima;

implementation

uses UDMNecesidadMateraPrima, UEntorno, UFormGest, DateUtils, UDMMain, UUtiles, UHojaCalc,
  UFMain, FIBDataSet, FIBDatabase, UFMDocInfoStocks, UParam, UDameDato;

{$R *.dfm}

procedure TFMNecesidadMateraPrima.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMNecesidadMateraPrima, DMNecesidadMateraPrima);
  FormCaption := 'Necesidad Matera Prima';
  Self.Caption := FormCaption;
  // Valor para marcado
  DBGSeleccionPedido.ColumnasChecked.Strings[DBGSeleccionPedido.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := REntorno.EntradaStr;

  EFSerie.Text := REntorno.Serie;
  EFAlmacenStock.Text := REntorno.AlmacenDefecto;
  EFAlmacen.Text := DMMain.DameAlmacenDocumento('OFP', EFSerie.Text);
  CBTodosLosPedidos.Checked := True;
  CBTodosLosPedidosChange(Sender);
  PCMain.ActivePage := TSPedidosVenta;
  ARecalcularPedidosVenta.Execute;
  PosicionarSemanaStringGrid(sgPedidosVenta);
  ARecalcularPedidosCompra.Execute;
  PosicionarSemanaStringGrid(sgPedidosCompra);
  MostrandoFiltros := False;
end;

procedure TFMNecesidadMateraPrima.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNecesidadMateraPrima);
end;

procedure TFMNecesidadMateraPrima.ARecalcularPedidosVentaExecute(Sender: TObject);
var
  y, w, wiay : integer;
  r, c : integer;
  ACol, ARow : integer;
  u : double;
  Articulo : string;
begin
  inherited;
  PCMain.ActivePage := TSPedidosVenta;

  // Obtengo los datos
  DMNecesidadMateraPrima.RefrescaPedidosVentas(CBTodosLosPedidos.Checked);

  with sgPedidosVenta do
  begin
     ACol := Col;
     ARow := Row;
     LimpiarStringGrid(sgPedidosVenta);
     ColWidths[0] := 35;
     ColWidths[1] := 65;
     ColWidths[2] := 250;
     ColWidths[3] := 25;
     ColWidths[4] := 50;
     ColWidths[5] := 50;
     ColWidths[6] := 50;
     ColWidths[7] := 50;

     // Redimensiono el StringGrid segun la necesidad a presentar
     RowCount := FixedRows + DMNecesidadMateraPrima.xNecesidades.RecordCount + 1;
     ColCount := FixedCols + 53 * 2; // 3 años
     for y := 0 to 1 do
     begin
        wiay := WeeksInAYear(REntorno.Ejercicio + y);
        for w := 0 to wiay - 1 do
        begin
           Cells[LeftCol + (y * wiay) + w, 0] := IntToStr(REntorno.Ejercicio + y);
           Cells[LeftCol + (y * wiay) + w, 1] := FormatDateTime('dd/mm', EncodeDateWeek(REntorno.Ejercicio + y, w + 1));
           Cells[LeftCol + (y * wiay) + w, 2] := IntToStr(w + 1);
        end;
     end;
     Cells[0, 2] := _('Lin.');
     Cells[1, 2] := _('Articulo');
     Cells[2, 2] := _('Descripcion');
     Cells[3, 2] := _('Fam.');
     Cells[4, 2] := _('Pl. Fab.');
     Cells[5, 2] := _('Stock');
     Cells[6, 2] := _('Total');

     // Relleno con los datos de la tabla
     r := TopRow - 1;
     Articulo := '';
     while (not DMNecesidadMateraPrima.xNecesidades.EOF) do
     begin
        // Si cambia el componente, avanzo la linea
        if (DMNecesidadMateraPrima.xNecesidades.FieldByName('ARTICULO').AsString <> Articulo) then
        begin
           Inc(r);
           Articulo := DMNecesidadMateraPrima.xNecesidades.FieldByName('ARTICULO').AsString;
           Cells[0, r] := IntToStr(r - FixedRows + 1);
           Cells[1, r] := Articulo;
           Cells[2, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('TITULO').AsString;
           Cells[3, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('FAMILIA').AsString;
           Cells[4, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('PLAZO_FABRICACION').AsString;
           Cells[5, r] := FormatFloat(',0', DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, EFAlmacenStock.Text));
        end;

        y := DMNecesidadMateraPrima.xNecesidades.FieldByName('ANYO').AsInteger - REntorno.Ejercicio;
        if (y >= 0) then
        begin
           w := DMNecesidadMateraPrima.xNecesidades.FieldByName('SEMANA').AsInteger;
           u := DMNecesidadMateraPrima.xNecesidades.FieldByName('UNIDADES').AsFloat;
           Cells[LeftCol + (y * 53) + w - 1, r] := FormatFloat(',0.00', u);
        end;

        DMNecesidadMateraPrima.xNecesidades.Next;
     end;
     DMNecesidadMateraPrima.xNecesidades.Close;

     RowCount := r + 2;

     // Calculo totales por linea
     for r := FixedRows to RowCount - 1 do
     begin
        u := 0;
        for c := FixedCols to ColCount - 1 do
           u := u + StrToFloatDef(Cells[c, r], 0);

        Cells[6, r] := FormatFloat(',0', u);
     end;
  end;

  PosicionarStringGrid(sgPedidosVenta, ACol, ARow);
end;

procedure TFMNecesidadMateraPrima.ARecalcularPedidosCompraExecute(Sender: TObject);
var
  y, w, wiay : integer;
  r, c : integer;
  ACol, ARow : integer;
  u : double;
  Articulo : string;
begin
  inherited;
  PCMain.ActivePage := TSPedidosCompra;

  // Obtengo los datos
  DMNecesidadMateraPrima.RefrescaPedidosCompras;

  with sgPedidosCompra do
  begin
     ACol := Col;
     ARow := Row;

     LimpiarStringGrid(sgPedidosCompra);

     ColWidths[0] := 35;
     ColWidths[1] := 65;
     ColWidths[2] := 250;
     ColWidths[3] := 25;
     ColWidths[4] := 50;
     ColWidths[5] := 50;
     ColWidths[6] := 50;
     ColWidths[7] := 50;

     // Redimensiono el StringGrid segun la necesidad a presentar
     RowCount := FixedRows + DMNecesidadMateraPrima.xNecesidades.RecordCount + 1;
     ColCount := FixedCols + 53 * 2; // 3 años
     for y := 0 to 1 do
     begin
        wiay := WeeksInAYear(REntorno.Ejercicio + y);
        for w := 0 to wiay - 1 do
        begin
           Cells[LeftCol + (y * wiay) + w, 0] := IntToStr(REntorno.Ejercicio + y);
           Cells[LeftCol + (y * wiay) + w, 1] := FormatDateTime('dd/mm', EncodeDateWeek(REntorno.Ejercicio + y, w + 1));
           Cells[LeftCol + (y * wiay) + w, 2] := IntToStr(w + 1);
        end;
     end;
     Cells[0, 2] := _('Lin.');
     Cells[1, 2] := _('Articulo');
     Cells[2, 2] := _('Descripcion');
     Cells[3, 2] := _('Fam.');
     Cells[4, 2] := _('Dias Ent.');
     Cells[5, 2] := _('Stock');
     Cells[6, 2] := _('Total');

     // Relleno con los datos de la tabla
     r := TopRow - 1;
     Articulo := '';
     while (not DMNecesidadMateraPrima.xNecesidades.EOF) do
     begin
        // Si cambia el componente, avanzo la linea
        if (DMNecesidadMateraPrima.xNecesidades.FieldByName('ARTICULO').AsString <> Articulo) then
        begin
           Inc(r);
           Articulo := DMNecesidadMateraPrima.xNecesidades.FieldByName('ARTICULO').AsString;
           Cells[0, r] := IntToStr(r - FixedRows + 1);
           Cells[1, r] := Articulo;
           Cells[2, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('TITULO').AsString;
           Cells[3, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('FAMILIA').AsString;
           Cells[4, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('DIAS_ENTREGA').AsString;
           Cells[5, r] := FormatFloat(',0', DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, EFAlmacenStock.Text));
        end;

        y := DMNecesidadMateraPrima.xNecesidades.FieldByName('ANYO').AsInteger - REntorno.Ejercicio;
        if (y >= 0) then
        begin
           w := DMNecesidadMateraPrima.xNecesidades.FieldByName('SEMANA').AsInteger;
           u := DMNecesidadMateraPrima.xNecesidades.FieldByName('UNIDADES').AsFloat;
           Cells[LeftCol + (y * 53) + w - 1, r] := FormatFloat(',0.00', u);
        end;

        DMNecesidadMateraPrima.xNecesidades.Next;
     end;
     DMNecesidadMateraPrima.xNecesidades.Close;

     RowCount := r + 2;

     // Calculo totales por linea
     for r := FixedRows to RowCount - 1 do
     begin
        u := 0;
        for c := FixedCols to ColCount - 1 do
           u := u + StrToFloatDef(Cells[c, r], 0);

        Cells[6, r] := FormatFloat(',0', u);
     end;
  end;

  PosicionarStringGrid(sgPedidosCompra, ACol, ARow);
end;


procedure TFMNecesidadMateraPrima.ARecalcularNecesidadesExecute(Sender: TObject);
var
  y, w, wiay : integer;
  r, c : integer;
  ACol, ARow : integer;
  u : double;
  componente : string;
begin
  inherited;
  PCMain.ActivePage := TSNecesidades;

  ProgressBar.Visible := True;

  // Obtengo los datos
  DMNecesidadMateraPrima.RefrescaNecesidades(CBTodosLosPedidos.Checked);

  with sgNecesidades do
  begin
     ACol := Col;
     ARow := Row;

     LimpiarStringGrid(sgNecesidades);

     ColWidths[0] := 35;
     ColWidths[1] := 65;
     ColWidths[2] := 250;
     ColWidths[3] := 25;
     ColWidths[4] := 50;
     ColWidths[5] := 50;
     ColWidths[6] := 50;
     ColWidths[7] := 50;

     // Redimensiono el StringGrid segun la necesidad a presentar
     RowCount := FixedRows + DMNecesidadMateraPrima.xNecesidades.RecordCount + 1;
     ColCount := FixedCols + 53 * 2; // 3 años
     for y := 0 to 1 do
     begin
        wiay := WeeksInAYear(REntorno.Ejercicio + y);
        for w := 0 to wiay - 1 do
        begin
           Cells[LeftCol + (y * wiay) + w, 0] := IntToStr(REntorno.Ejercicio + y);
           Cells[LeftCol + (y * wiay) + w, 1] := FormatDateTime('dd/mm', EncodeDateWeek(REntorno.Ejercicio + y, w + 1));
           Cells[LeftCol + (y * wiay) + w, 2] := IntToStr(w + 1);
        end;
     end;
     Cells[0, 2] := _('Lin.');
     Cells[1, 2] := _('Articulo');
     Cells[2, 2] := _('Descripcion');
     Cells[3, 2] := _('Fam.');
     Cells[4, 2] := _('Dias Ent.');
     Cells[5, 2] := _('Stock');
     Cells[6, 2] := _('Total');

     // Relleno con los datos de la tabla
     r := TopRow - 1;
     Componente := '';
     ProgressBar.Position := 0;
     ProgressBar.Max := RowCount;
     while (not DMNecesidadMateraPrima.xNecesidades.EOF) do
     begin
        if ((EFFamilia.Text = '') or (EFFamilia.Text = DMNecesidadMateraPrima.xNecesidades.FieldByName('FAMILIA').AsString)) then
        begin
           // Si cambia el componente, avanzo la linea
           if ((DMNecesidadMateraPrima.xNecesidades.FieldByName('COMPONENTE').AsString <> Componente) or (DMNecesidadMateraPrima.xNecesidades.FieldByName('COMPONENTE').AsString = '')) then
           begin
              Inc(r);
              Componente := DMNecesidadMateraPrima.xNecesidades.FieldByName('COMPONENTE').AsString;
              Cells[0, r] := IntToStr(r - FixedRows + 1);
              Cells[1, r] := Componente;
              Cells[2, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('TITULO_COMPONENTE').AsString;
              Cells[3, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('FAMILIA').AsString;
              Cells[4, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('DIAS_ENTREGA').AsString;
              Cells[5, r] := FormatFloat(',0', DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Componente, DMNecesidadMateraPrima.xNecesidades.FieldByName('ALMACEN_SAL').AsString));

              ProgressBar.Position := r;
              Application.ProcessMessages;
           end;

           y := DMNecesidadMateraPrima.xNecesidades.FieldByName('ANYO').AsInteger - REntorno.Ejercicio;
           if (y >= 0) then
           begin
              w := DMNecesidadMateraPrima.xNecesidades.FieldByName('SEMANA').AsInteger;
              u := DMNecesidadMateraPrima.xNecesidades.FieldByName('UNIDADES_COMPONENTE').AsFloat;
              Cells[LeftCol + (y * 53) + w - 1, r] := FormatFloat(',0.00', StrToFloatDef(Cells[LeftCol + (y * 53) + w - 1, r], 0) + u);
           end;
        end;

        DMNecesidadMateraPrima.xNecesidades.Next;
     end;
     DMNecesidadMateraPrima.xNecesidades.Close;

     RowCount := r + 2;

     // Borro las compras que no pertenecen a las necesidades
     if (CBComprasDeNecesidades.Checked) then
     begin
        // Recorro los componentes
        r := 3;
        while (r < sgPedidosCompra.RowCount) do
        begin
           Componente := sgPedidosCompra.Cells[1, r];

           // Busco el componente en Necesidades
           y := 3;
           while (Cells[1, y] <> Componente) and (y < RowCount) do
              Inc(y);

           //  Borro la linea si no existe
           if (y = RowCount) then
              DeleteRow(sgPedidosCompra, r)
           else
              Inc(r);
        end;

        // Renumero las lineas que queden
        RenumerarStringGrid(sgPedidosCompra);
     end;

     // Calculo totales por linea
     for r := FixedRows to RowCount - 1 do
     begin
        u := 0;
        for c := FixedCols to ColCount - 1 do
           u := u + StrToFloatDef(Cells[c, r], 0);

        Cells[6, r] := FormatFloat(',0', u);
     end;
  end;

  PosicionarStringGrid(sgNecesidades, ACol, ARow);

  ProgressBar.Visible := False;
end;

procedure TFMNecesidadMateraPrima.ARecalcularStockFuturoExecute(Sender: TObject);
var
  y, w, wiay : integer;
  i, r, rv, rc, rn : integer;
  ACol, ARow : integer;
  u, uv, uc, un, stock : double;
  articulo, av, ac, an, s : string;
  d : TDateTime;

  function DameMin(s1, s2, s3: string): string;
  begin
     /// Devuelve el minimo que no este vacio.

     Result := '';
     if (s1 > '') then
        Result := s1;
     if ((s2 > '') and ((s2 < Result) or (Result = ''))) then
        Result := s2;
     if ((s3 > '') and ((s3 < Result) or (Result = ''))) then
        Result := s3;
  end;

begin
  inherited;
  PCMain.ActivePage := TSStockFuturo;

  ProgressBar.Visible := True;

  with sgStockFuturo do
  begin
     ACol := Col;
     ARow := Row;

     LimpiarStringGrid(sgStockFuturo);

     ColWidths[0] := 35;
     ColWidths[1] := 65;
     ColWidths[2] := 250;
     ColWidths[3] := 25;
     ColWidths[4] := 50;
     ColWidths[5] := 50;
     ColWidths[6] := 50;
     ColWidths[7] := 50;

     // Redimensiono el StringGrid segun la necesidad a presentar
     RowCount := FixedRows + sgPedidosVenta.RowCount + sgPedidosCompra.RowCount + sgNecesidades.RowCount + 1;
     ColCount := FixedCols + 53 * 2; // 3 años
     for y := 0 to 1 do
     begin
        wiay := WeeksInAYear(REntorno.Ejercicio + y);
        for w := 0 to wiay - 1 do
        begin
           Cells[LeftCol + (y * wiay) + w, 0] := IntToStr(REntorno.Ejercicio + y);
           Cells[LeftCol + (y * wiay) + w, 1] := FormatDateTime('dd/mm', EncodeDateWeek(REntorno.Ejercicio + y, w + 1));
           Cells[LeftCol + (y * wiay) + w, 2] := IntToStr(w + 1);
        end;
     end;
     Cells[0, 2] := _('Lin.');
     Cells[1, 2] := _('Articulo');
     Cells[2, 2] := _('Descripcion');
     Cells[3, 2] := _('Fam.');
     Cells[4, 2] := _('Pl. Ent.');
     Cells[5, 2] := _('Stock');
     Cells[6, 2] := _('Nec.');
     Cells[7, 2] := _('Compra');

     // Recorro las tablas y relleno combinando los datos
     r := TopRow;
     rv := r;
     rc := r;
     rn := r;
     ProgressBar.Position := 0;
     ProgressBar.Max := RowCount;
     while ((rv < sgPedidosVenta.RowCount) or (rc < sgPedidosCompra.RowCount) or (rn < sgNecesidades.RowCount)) do
     begin
        Cells[0, r] := IntToStr(r - FixedRows + 1);

        // Veo que articulo tiene cada linea y escojo el minimo
        av := '';
        ac := '';
        an := '';
        if (rv < sgPedidosVenta.RowCount) then
           av := sgPedidosVenta.Cells[1, rv];
        if (rc < sgPedidosCompra.RowCount) then
           ac := sgPedidosCompra.Cells[1, rc];
        if (rn < sgNecesidades.RowCount) then
           an := sgNecesidades.Cells[1, rn];
        articulo := DameMin(av, ac, an);

        // Codigo y titulo del articulo
        if (av = articulo) then
        begin
           for i := 1 to FixedCols - 2 do
              Cells[i, r] := sgPedidosVenta.Cells[i, rv];
        end;
        if (ac = articulo) then
        begin
           for i := 1 to FixedCols - 2 do
              Cells[i, r] := sgPedidosCompra.Cells[i, rc];
           Cells[7, r] := sgPedidosCompra.Cells[6, rc];
        end;
        if (an = articulo) then
        begin
           for i := 1 to FixedCols - 2 do
              Cells[i, r] := sgNecesidades.Cells[i, rn];
           Cells[6, r] := sgNecesidades.Cells[6, rn];
        end;

        Stock := StrToFloatDef(Cells[5, r], 0);
        (*
        // Stock del articulo a fecha de hoy
        // de almacen 001, 002 y 003
        stock := DMNecesidadMateraPrima.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo);
        Cells[5, r] := FormatFloat(',0.00', stock);
        *)
        u := 0;
        for y := 0 to 1 do
        begin
           wiay := WeeksInAYear(REntorno.Ejercicio + y);
           for w := 0 to wiay - 1 do
           begin
              uv := 0;
              if ((av = articulo) and (sgPedidosVenta.Cells[LeftCol + (y * wiay) + w, rv] <> '')) then
                 uv := StrToFloatDef(sgPedidosVenta.Cells[LeftCol + (y * wiay) + w, rv], 0);
              uc := 0;
              if ((ac = articulo) and (sgPedidosCompra.Cells[LeftCol + (y * wiay) + w, rc] <> '')) then
                 uc := StrToFloatDef(sgPedidosCompra.Cells[LeftCol + (y * wiay) + w, rc], 0);
              un := 0;
              if ((an = articulo) and (sgNecesidades.Cells[LeftCol + (y * wiay) + w, rn] <> '')) then
                 un := StrToFloatDef(sgNecesidades.Cells[LeftCol + (y * wiay) + w, rn], 0);

              try
                 s := Cells[LeftCol + (y * wiay) + w, 1] + '/' + Cells[LeftCol + (y * wiay) + w, 0];
                 if (s <> '/') then
                    d := StrToDate(s)
                 else
                    d := 0;
              except
                 d := 0;
              end;

              if (d < Today) then
              begin
                 if (av = articulo) then
                    u := u - uv;
                 if (ac = articulo) then
                    u := u + uc;
                 if (an = articulo) then
                    u := u - un;

                 Cells[LeftCol + (y * wiay) + w, r] := FormatFloat(',0.00', u);
              end
              else
              begin
                 if (av = articulo) then
                    stock := stock - uv;
                 if (ac = articulo) then
                    stock := stock + uc;
                 if (an = articulo) then
                    stock := stock - un;

                 Cells[LeftCol + (y * wiay) + w, r] := FormatFloat(',0.00', stock);
              end;
           end;
        end;

        Inc(r);
        // Incremento la linea si he tratado el articulo
        if (((av = articulo) or (av = '')) and (rv < sgPedidosVenta.RowCount)) then
           Inc(rv);
        if (((ac = articulo) or (ac = '')) and (rc < sgPedidosCompra.RowCount)) then
           Inc(rc);
        if (((an = articulo) or (an = '')) and (rn < sgNecesidades.RowCount)) then
           Inc(rn);

        ProgressBar.Position := rv + rc + rn;
        Application.ProcessMessages;
     end;

     RowCount := r + 2;
  end;

  PosicionarStringGrid(sgStockFuturo, ACol, ARow);

  ProgressBar.Visible := False;
end;

procedure TFMNecesidadMateraPrima.sgDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  s, sd : string;
  LDelta : integer;
  d : TDateTime;
begin
  inherited;
  with TStringGrid(Sender) do
  begin
     s := Cells[ACol, ARow];
     LDelta := ColWidths[ACol] - Canvas.TextWidth(s);

     if ((ACol = Col) and (ARow = Row)) then
        ColorFocused(Canvas)
     else
     begin
        // Si no es una celda fija y no es la que tiene foco
        // Coloreo como inactiva las anteriores a la fecha actual
        if ((ACol >= FixedCols) and (ARow >= FixedRows) and (not ((ACol = Col) and (ARow = Row)))) then
        begin
           try
              sd := Cells[ACol, 1] + '/' + Cells[ACol, 0];
              if (sd <> '/') then
                 d := StrToDate(sd)
              else
                 d := 0;
           except
              d := 0;
           end;

           if (d < Today) then
              ColorInactivo(Canvas)
           else
           begin
              ColorEdicion(Canvas);

              if ((Sender = sgStockFuturo) or (Sender = SGSimulacion)) then
              begin
                 if ((ACol < FixedCols) or (ARow < FixedRows)) then
                 begin
                    Canvas.Brush.Color := FixedColor;
                    Canvas.Font.Color := clWindowText;
                 end
                 else
                 begin
                    if ((ACol = Col) and (ARow = Row)) then
                       ColorFocused(Canvas)
                    else
                    begin
                       if ((Sender = SGSimulacion) and (s > '') and (Pos('+', s) > 0)) then
                          ColorResaltado3(Canvas)
                       else
                       if ((s > '') and (s[1] = '-')) then
                          ColorError(Canvas)
                       else
                       if (Cells[ACol, ARow] <> Cells[ACol - 1, ARow]) then
                          ColorResaltado(Canvas)
                       else
                          ColorEdicion(Canvas);
                    end;
                 end;
              end;
           end;
        end
        else
        begin
           // Se resalta la fila en la que estoy
           if (ARow = Row) then
           begin
              with Canvas do
              begin
                 Brush.Color := clMedGray;
                 Font.Color := clHighlightText;
              end;
           end
           else
           begin
              with Canvas do
              begin
                 Brush.Color := FixedColor;
                 Font.Color := Font.Color;
              end;
           end;
        end;
     end;

     // Titulos -> Center
     if (ACol >= LeftCol) and (ARow < TopRow) then
        Canvas.TextRect(Rect, Rect.Left + (LDelta div 2), Rect.Top + 2, s)
     else
     // Valores y primera columna -> Right Justify
     if (((ACol >= LeftCol) and (ARow >= TopRow)) or (ACol = 0) or (ACol = 4) or (ACol = 5) or (ACol = 6) or (ACol = 7)) then
        Canvas.TextRect(Rect, Rect.Left + LDelta - 2, Rect.Top + 2, s)
     else
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, s);
  end;
end;

procedure TFMNecesidadMateraPrima.ARecalcularTodoExecute(Sender: TObject);
begin
  inherited;
  ARecalcularPedidosVenta.Execute;
  ARecalcularPedidosCompra.Execute;
  ARecalcularNecesidades.Execute;
  ARecalcularStockFuturo.Execute;
  ARecalcularSimulacion.Execute;
  // Todavia no implementado ARecalcularRecursosExecute.Execute;

  PosicionarSemanaStringGrid(sgPedidosVenta);
  PosicionarSemanaStringGrid(sgPedidosCompra);
  PosicionarSemanaStringGrid(sgNecesidades);
  PosicionarSemanaStringGrid(sgStockFuturo);
  PosicionarSemanaStringGrid(SGSimulacion);
  // Todavia no implementado PosicionarSemanaStringGrid(SGRegursos);
end;

procedure TFMNecesidadMateraPrima.AExportacionExcelExecute(Sender: TObject);
var
  HCalc : THojaCalc;
  f, c : integer;
  Archivo : string;
  Celdas : integer;
begin
  inherited;

  Archivo := Format(_('NecesidadesMateriaPrima_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMNecesidadMateraPrima') then
  begin
     DMMain.LogIni('Exportacion Excel Necesidades Materia Prima');

     DMMain.Log('Exportacion Excel');
     // Esto mira si el nombre del archivo contienen .xls (.xls, .xlsx);
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcExcel, True)');
        HCalc := THojaCalc.Create(thcExcel, False);
     end
     else
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcOpenOffice, True)');
        HCalc := THojaCalc.Create(thcOpenOffice, False);
     end;

     try
        // Calculo cuantas celdas se van a exportar (aprox.)
        Celdas := (sgPedidosVenta.ColCount * sgPedidosVenta.RowCount);
        Celdas := Celdas + (sgPedidosCompra.ColCount * sgPedidosCompra.RowCount);
        Celdas := Celdas + (sgNecesidades.ColCount * sgNecesidades.RowCount);
        Celdas := Celdas + (sgStockFuturo.ColCount * sgStockFuturo.RowCount);

        // Configuro ProgressBar
        ProgressBar.Max := Celdas;
        ProgressBar.Position := 0;
        ProgressBar.Step := 1;
        ProgressBar.Visible := True;

        DMMain.Log('HCalc.FileName = ' + Archivo);
        HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!

        // Agrego cuatro hojas
        DMMain.Log('Agregando/Renombrando 4 hojas...');
        DMMain.Log('HCalc.CountSheets = ' + IntToStr(HCalc.CountSheets));
        while (HCalc.CountSheets < 4) do
           HCalc.AddNewSheet(_('NewSheet' + IntToStr(HCalc.CountSheets + 1)));
        DMMain.Log('HCalc.CountSheets = ' + IntToStr(HCalc.CountSheets));

        // Exportacion de datos de pedidos de venta
        DMMain.LogIni('HCalc.CellText[f,c] := sgPedidosVenta.Cells[c, f]');
        HCalc.ActivateSheetByIndex(1);
        HCalc.ActiveSheetName := _('Pedidos Venta');
        for c := 1 to sgPedidosVenta.ColCount do
        begin
           for f := 2 to sgPedidosVenta.RowCount - 1 do
           begin
              DMMain.Log(Format('HCalc.CellText[%d, %d] = %s', [c, f, sgPedidosVenta.Cells[c, f]]));
              if (sgPedidosVenta.Cells[c, f] <> '') then
              begin
                 if ((c > 2) and (f > 2)) then
                 begin
                    if (StrToFloatDef(sgPedidosVenta.Cells[c, f], 0) <> 0) then
                       HCalc.SendNumber(f + 1, c, StrToFloatDef(sgPedidosVenta.Cells[c, f], 0));
                 end
                 else
                 begin
                    if (c < sgPedidosVenta.FixedCols) then
                       HCalc.CellText[f + 1, c] := sgPedidosVenta.Cells[c, f]
                    else
                    if (f = 2) then
                       HCalc.CellText[f + 1, c] := sgPedidosVenta.Cells[c, f - 2] + #13 + sgPedidosVenta.Cells[c, f - 1] + #13 + sgPedidosVenta.Cells[c, f]
                    else
                       HCalc.CellText[f + 1, c] := sgPedidosVenta.Cells[c, f];
                 end;
              end;
              ProgressBar.StepIt;
           end;

           Application.ProcessMessages;
        end;

        // Alto de fila donde esta ejercicio+fecha+semana (tres lineas de altura)
        HCalc.RowHeight(3, (400 * 3));
        for c := 1 to sgPedidosVenta.FixedCols do
           HCalc.AutoFit(c);

        DMMain.LogFin('HCalc.CellText[f,c] := sgPedidosVenta.Cells[c, f]');

        // Exportacion de datos de pedidos de compra
        DMMain.LogIni('HCalc.CellText[f,c] := sgPedidosCompra.Cells[c, f]');
        HCalc.ActivateSheetByIndex(2);
        HCalc.ActiveSheetName := _('Pedidos Compra');
        for c := 1 to sgPedidosCompra.ColCount do
        begin
           for f := 2 to sgPedidosCompra.RowCount - 1 do
           begin
              if (sgPedidosCompra.Cells[c, f] <> '') then
              begin
                 if ((c > 2) and (f > 2)) then
                 begin
                    if (StrToFloatDef(sgPedidosCompra.Cells[c, f], 0) <> 0) then
                       HCalc.SendNumber(f + 1, c, StrToFloatDef(sgPedidosCompra.Cells[c, f], 0));
                 end
                 else
                 begin
                    if (c < sgPedidosCompra.FixedCols) then
                       HCalc.CellText[f + 1, c] := sgPedidosCompra.Cells[c, f]
                    else
                    if (f = 2) then
                       HCalc.CellText[f + 1, c] := sgPedidosCompra.Cells[c, f - 2] + #13 + sgPedidosCompra.Cells[c, f - 1] + #13 + sgPedidosCompra.Cells[c, f]
                    else
                       HCalc.CellText[f + 1, c] := sgPedidosCompra.Cells[c, f];
                 end;
              end;
              ProgressBar.StepIt;
           end;

           Application.ProcessMessages;
        end;

        // Alto de fila donde esta ejercicio+fecha+semana (tres lineas de altura)
        HCalc.RowHeight(3, (400 * 3));
        for c := 1 to sgPedidosCompra.FixedCols do
           HCalc.AutoFit(c);

        DMMain.LogFin('HCalc.CellText[f,c] := sgPedidosCompra.Cells[c, f]');

        // Exportacion de datos de Necesidades
        DMMain.LogIni('HCalc.CellText[f,c] := sgNecesidades.Cells[c, f]');
        HCalc.ActivateSheetByIndex(3);
        HCalc.ActiveSheetName := _('Necesidades Produccion');
        for c := 1 to sgNecesidades.ColCount do
        begin
           for f := 2 to sgNecesidades.RowCount - 1 do
           begin
              if (sgNecesidades.Cells[c, f] <> '') then
              begin
                 if ((c > 2) and (f > 2)) then
                 begin
                    if (StrToFloatDef(sgNecesidades.Cells[c, f], 0) <> 0) then
                       HCalc.SendNumber(f + 1, c, StrToFloatDef(sgNecesidades.Cells[c, f], 0));
                 end
                 else
                 begin
                    if (c < sgNecesidades.FixedCols) then
                       HCalc.CellText[f + 1, c] := sgNecesidades.Cells[c, f]
                    else
                    if (f = 2) then
                       HCalc.CellText[f + 1, c] := sgNecesidades.Cells[c, f - 2] + #13 + sgNecesidades.Cells[c, f - 1] + #13 + sgNecesidades.Cells[c, f]
                    else
                       HCalc.CellText[f + 1, c] := sgNecesidades.Cells[c, f];
                 end;
              end;
              ProgressBar.StepIt;
           end;

           Application.ProcessMessages;
        end;

        // Alto de fila donde esta ejercicio+fecha+semana (tres lineas de altura)
        HCalc.RowHeight(3, (400 * 3));
        for c := 1 to sgNecesidades.FixedCols do
           HCalc.AutoFit(c);

        DMMain.LogFin('HCalc.CellText[f,c] := sgNecesidades.Cells[c, f]');

        // Exportacion de datos de Stock Futuro
        DMMain.LogIni('HCalc.CellText[f,c] := sgStockFuturo.Cells[c, f]');
        HCalc.ActivateSheetByIndex(4);
        HCalc.ActiveSheetName := _('Stock Futuro');
        for c := 1 to sgStockFuturo.ColCount do
        begin
           for f := 2 to sgStockFuturo.RowCount - 1 do
           begin
              if (sgStockFuturo.Cells[c, f] <> '') then
              begin
                 if ((c > 2) and (f > 2)) then
                 begin
                    if (StrToFloatDef(sgStockFuturo.Cells[c, f], 0) <> 0) then
                       HCalc.SendNumber(f + 1, c, StrToFloatDef(sgStockFuturo.Cells[c, f], 0));
                 end
                 else
                 begin
                    if (c < sgStockFuturo.FixedCols) then
                       HCalc.CellText[f + 1, c] := sgStockFuturo.Cells[c, f]
                    else
                    if (f = 2) then
                       HCalc.CellText[f + 1, c] := sgStockFuturo.Cells[c, f - 2] + #13 + sgStockFuturo.Cells[c, f - 1] + #13 + sgStockFuturo.Cells[c, f]
                    else
                       HCalc.CellText[f + 1, c] := sgStockFuturo.Cells[c, f];
                 end;
              end;
              ProgressBar.StepIt;
           end;

           Application.ProcessMessages;
        end;

        // Alto de fila donde esta ejercicio+fecha+semana (tres lineas de altura)
        HCalc.RowHeight(3, (400 * 3));
        for c := 1 to sgStockFuturo.FixedCols do
           HCalc.AutoFit(c);

        DMMain.LogFin('HCalc.CellText[f,c] := sgStockFuturo.Cells[c, f]');

        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        DMMain.Log('Liberar Excel');
        ProgressBar.Visible := False;
        HCalc.Free;
     end;

     DMMain.LogFin('Exportacion Excel Necesidades Materia Prima');
     Application.ProcessMessages;
  end;
end;

procedure TFMNecesidadMateraPrima.TButtMarcarTodosPedidosClick(Sender: TObject);
begin
  inherited;
  DMNecesidadMateraPrima.MarcarTodosPedidos(REntorno.Entrada);
end;

procedure TFMNecesidadMateraPrima.TButtDesmarcarTodosPedidosClick(Sender: TObject);
begin
  inherited;
  DMNecesidadMateraPrima.MarcarTodosPedidos(0);
end;

procedure TFMNecesidadMateraPrima.CBTodosLosPedidosChange(Sender: TObject);
begin
  inherited;
  DMNecesidadMateraPrima.ActivarPedidos(not CBTodosLosPedidos.Checked);
end;

procedure TFMNecesidadMateraPrima.TButtMostrarFiltrosClick(Sender: TObject);
begin
  inherited;
  // Cambio el estado
  MostrandoFiltros := not MostrandoFiltros;

  // Se hacen visibles/invisibles las toolbars de filtros
  TBFiltroFechaEntrega.Visible := MostrandoFiltros;
  TBFiltroProveedores.Visible := MostrandoFiltros;

  // Cambio icono y hint
  if MostrandoFiltros then
  begin
     TButtMostrarFiltros.ImageIndex := 22;
     TButtMostrarFiltros.Hint := _('Ocultar los filtros de marcado');
  end
  else
  begin
     TButtMostrarFiltros.ImageIndex := 23;
     TButtMostrarFiltros.Hint := _('Mostrar los filtros de marcado');
  end;
end;

procedure TFMNecesidadMateraPrima.TButtAnyadirSelecFechasClick(Sender: TObject);
begin
  inherited;
  DMNecesidadMateraPrima.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, REntorno.Entrada);
end;

procedure TFMNecesidadMateraPrima.EFClienteDesdeChange(Sender: TObject);
begin
  inherited;
  ETituloClienteDesde.Text := DameTituloCliente(StrToIntDef(EFClienteDesde.Text, 0));
end;

procedure TFMNecesidadMateraPrima.EFClienteHastaChange(Sender: TObject);
begin
  inherited;
  ETituloClienteHasta.Text := DameTituloCliente(StrToIntDef(EFClienteHasta.Text, 0));
end;

procedure TFMNecesidadMateraPrima.TButtQuitarSelecFechasClick(Sender: TObject);
begin
  inherited;
  DMNecesidadMateraPrima.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, 0);
end;

procedure TFMNecesidadMateraPrima.TButtAnyadirSelecClientesClick(Sender: TObject);
begin
  inherited;
  if ((StrToIntDef(EFClienteDesde.Text, 0) <> 0) and (StrToIntDef(EFClienteHasta.Text, 0) <> 0)) then
     DMNecesidadMateraPrima.MarcarPorCliente(StrToInt(EFClienteDesde.Text), StrToInt(EFClienteHasta.Text), REntorno.Entrada);
end;

procedure TFMNecesidadMateraPrima.TButtQuitarSelecClientesClick(Sender: TObject);
begin
  inherited;
  inherited;
  if ((StrToIntDef(EFClienteDesde.Text, 0) <> 0) and (StrToIntDef(EFClienteHasta.Text, 0) <> 0)) then
     DMNecesidadMateraPrima.MarcarPorCliente(StrToInt(EFClienteDesde.Text), StrToInt(EFClienteHasta.Text), 0);
end;

procedure TFMNecesidadMateraPrima.LimpiarStringGrid(sg: TStringGrid);
var
  c, f : integer;
begin
  with sg do
  begin
     LeftCol := FixedCols;
     TopRow := FixedRows;

     for c := 1 to ColCount do
        for f := 0 to RowCount - 1 do
        begin
           Cells[c, f] := '';
        end;
  end;
end;

procedure TFMNecesidadMateraPrima.DBGSeleccionPedidoDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMNecesidadMateraPrima.xPedidosID_S.AsInteger);
end;

procedure TFMNecesidadMateraPrima.PosicionarSemanaStringGrid(sg: TStringGrid);
begin
  with sg do
  begin
     // Muevo para no ver semanas pasadas
     Row := FixedRows;
     Col := VisibleColCount + WeekOf(Today);
     LeftCol := FixedCols + WeekOf(Today) - 1;
     Application.ProcessMessages;
  end;
end;

procedure TFMNecesidadMateraPrima.PosicionarStringGrid(sg: TStringGrid; ACol, ARow: integer);
begin
  with sg do
  begin
     // Verifico que no me pase
     if (ACol > ColCount) then
        ACol := ColCount;
     if (ARow > RowCount) then
        ARow := RowCount;

     // Posiciono evitando dejar columnas/filas en blanco
     if ((ColCount - ACol) < VisibleColCount) then
        LeftCol := ColCount - VisibleColCount;
     if ((RowCount - ARow) < VisibleRowCount) then
        TopRow := RowCount - VisibleRowCount;

     Col := ACol;
     LeftCol := ACol;
     Row := ARow;
     TopRow := ARow;

     Application.ProcessMessages;
  end;
end;

procedure TFMNecesidadMateraPrima.ARecalcularSimulacionExecute(Sender: TObject);
var
  c, f : integer;
  y, w, wiay : integer;
  r : integer;
  ACol, ARow : integer;
  u, uf : double;
  Articulo : string;
  FormatoNumericoSimulacion : string;
begin
  inherited;

  FormatoNumericoSimulacion := ',0'; // ',0.00'

  PCMain.ActivePage := TSSimulacionPedidosCompra;

  ProgressBar.Visible := True;

  // Obtengo los datos
  DMNecesidadMateraPrima.RefrescaPropuestaPedidos;

  with SGSimulacion do
  begin
     ACol := Col;
     ARow := Row;

     LimpiarStringGrid(SGSimulacion);
     LeftCol := FixedCols;
     TopRow := FixedRows;

     // Copio los articulos del calculo de stock futuro a la simulacion.
     ColCount := sgStockFuturo.ColCount;
     RowCount := sgStockFuturo.RowCount;
     for c := 0 to FixedCols - 1 do
     begin
        for f := 0 to sgStockFuturo.RowCount - 1 do
        begin
           Cells[c, f] := sgStockFuturo.Cells[c, f];
        end;
     end;

     // Establezco
     ColWidths[0] := 35;
     ColWidths[1] := 65;
     ColWidths[2] := 250;
     ColWidths[3] := 25;
     ColWidths[4] := 50;
     ColWidths[5] := 50;
     ColWidths[6] := 50;
     ColWidths[7] := 50;

     // Redimensiono el StringGrid segun la necesidad a presentar
     for y := 0 to 1 do
     begin
        wiay := WeeksInAYear(REntorno.Ejercicio + y);
        for w := 0 to wiay - 1 do
        begin
           Cells[LeftCol + (y * wiay) + w, 0] := IntToStr(REntorno.Ejercicio + y);
           Cells[LeftCol + (y * wiay) + w, 1] := FormatDateTime('dd/mm', EncodeDateWeek(REntorno.Ejercicio + y, w + 1));
           Cells[LeftCol + (y * wiay) + w, 2] := IntToStr(w + 1);
        end;
     end;

     ProgressBar.Position := 0;
     ProgressBar.Max := RowCount * 2;
     // Relleno con los datos de la tabla
     r := TopRow - 1;
     Articulo := '';
     while (not DMNecesidadMateraPrima.xNecesidades.EOF) do
     begin
        // Si cambia el componente, avanzo la linea
        if (DMNecesidadMateraPrima.xNecesidades.FieldByName('ARTICULO').AsString <> Articulo) then
        begin
           Articulo := DMNecesidadMateraPrima.xNecesidades.FieldByName('ARTICULO').AsString;

           // Busco la fila del articulo
           r := 0;
           for f := 0 to RowCount - 1 do
              if (Cells[1, f] = Articulo) then
                 r := f;
           if (r = 0) then
              r := RowCount + 1;

           // Cells[0, r] := IntToStr(r - FixedRows + 1);
           Cells[1, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('ARTICULO').AsString;
           // Cells[2, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('TITULO').AsString;
           // Cells[3, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('DIAS_ENTREGA').AsString;
        end;

        y := DMNecesidadMateraPrima.xNecesidades.FieldByName('ANYO').AsInteger - REntorno.Ejercicio;
        if (y >= 0) then
        begin
           w := DMNecesidadMateraPrima.xNecesidades.FieldByName('SEMANA').AsInteger;
           u := DMNecesidadMateraPrima.xNecesidades.FieldByName('UNIDADES').AsFloat;
           Cells[LeftCol + (y * 53) + w - 1, r] := '+' + FormatFloat(FormatoNumericoSimulacion, u);
        end;

        DMNecesidadMateraPrima.xNecesidades.Next;
        ProgressBar.StepIt;
        Application.ProcessMessages;
     end;
     DMNecesidadMateraPrima.xNecesidades.Close;

     // Marco que llegué a la mitad del proceso
     ProgressBar.Position := RowCount;

     for f := sgStockFuturo.FixedRows to sgStockFuturo.RowCount - 1 do
     begin
        u := 0;
        for c := sgStockFuturo.FixedCols to ColCount - 1 do
        begin
           uf := StrToFloatDef(sgStockFuturo.Cells[c, f], 0);
           if (Cells[c, f] = '') then
              Cells[c, f] := FormatFloat(FormatoNumericoSimulacion, u + uf)
           else
           begin
              u := u + StrToFloatDef(Cells[c, f], 0);
              Cells[c, f] := FormatFloat(FormatoNumericoSimulacion, uf) + Cells[c, f];
           end;
        end;

        ProgressBar.StepIt;
        Application.ProcessMessages;
     end;
  end;

  ProgressBar.Visible := False;
  PosicionarStringGrid(SGSimulacion, ACol, ARow);
end;

procedure TFMNecesidadMateraPrima.ARecalcularRecursosExecute(Sender: TObject);
var
  y, w, wiay : integer;
  r : integer;
  ACol, ARow : integer;
  // u : double;
  // Articulo : string;
begin
  inherited;

  ProgressBar.Visible := True;

  // Obtengo los datos
  // DMNecesidadMateraPrima.RefrescaRecursos;

  with SGRegursos do
  begin
     ACol := Col;
     ARow := Row;

     LimpiarStringGrid(SGRegursos);

     ColWidths[0] := 35;
     ColWidths[1] := 65;
     ColWidths[2] := 250;
     ColWidths[3] := 25;

     // Redimensiono el StringGrid segun la necesidad a presentar
     RowCount := FixedRows + 2;
     ColCount := FixedCols + 53 * 2; // 3 años
     for y := 0 to 1 do
     begin
        wiay := WeeksInAYear(REntorno.Ejercicio + y);
        for w := 0 to wiay - 1 do
        begin
           Cells[LeftCol + (y * wiay) + w, 0] := IntToStr(REntorno.Ejercicio + y);
           Cells[LeftCol + (y * wiay) + w, 1] := FormatDateTime('dd/mm', EncodeDateWeek(REntorno.Ejercicio + y, w + 1));
           Cells[LeftCol + (y * wiay) + w, 2] := IntToStr(w + 1);
        end;
     end;

     LeftCol := FixedCols;
     TopRow := FixedRows;

     // Establezco
     ColWidths[0] := 35;
     ColWidths[1] := 65;
     ColWidths[2] := 250;
     ColWidths[3] := DefaultColWidth;

     // Relleno con los datos de la tabla
     r := TopRow - 1;
     (*
     Componente := '';
     ProgressBar.Position := 0;
     ProgressBar.Max := RowCount;
     while (not DMNecesidadMateraPrima.xNecesidades.EOF) do
     begin
        // Si cambia el componente, avanzo la linea
        if (DMNecesidadMateraPrima.xNecesidades.FieldByName('COMPONENTE').AsString <> Componente) then
        begin
           Inc(r);
           Componente := DMNecesidadMateraPrima.xNecesidades.FieldByName('COMPONENTE').AsString;
           Cells[0, r] := IntToStr(r - FixedRows + 1);
           Cells[1, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('COMPONENTE').AsString;
           Cells[2, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('TITULO_COMPONENTE').AsString;
           Cells[3, r] := DMNecesidadMateraPrima.xNecesidades.FieldByName('DIAS_ENTREGA').AsString;

           ProgressBar.Position := r;
           Application.ProcessMessages;
        end;

        y := DMNecesidadMateraPrima.xNecesidades.FieldByName('ANYO').AsInteger - REntorno.Ejercicio;
        if (y >= 0) then
        begin
           w := DMNecesidadMateraPrima.xNecesidades.FieldByName('SEMANA').AsInteger;
           u := DMNecesidadMateraPrima.xNecesidades.FieldByName('UNIDADES_COMPONENTE').AsFloat;
           Cells[LeftCol + (y * 53) + w - 1, r] := FormatFloat(',0.00', u);
        end;

        DMNecesidadMateraPrima.xNecesidades.Next;
     end;
     DMNecesidadMateraPrima.xNecesidades.Close;
     *)
     RowCount := r + 2;
  end;

  ProgressBar.Visible := False;
  PosicionarStringGrid(SGRegursos, ACol, ARow);
end;

procedure TFMNecesidadMateraPrima.EFProveedorChange(Sender: TObject);
begin
  inherited;
  EProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMNecesidadMateraPrima.SGSimulacionDblClick(Sender: TObject);
begin
  inherited;
  PNLDatosPropuesta.Visible := True;
  if (StrToFloatDef(SGSimulacion.Cells[Columna, Fila], 0) < 0) then
     EUnidades.Text := FormatFloat(',0.00', StrToFloatDef(SGSimulacion.Cells[Columna, Fila], 0) * -1)
  else
     EUnidades.Text := FormatFloat(',0.00', 0);
  DEFechaEntrega.Date := StrToDate(SGSimulacion.Cells[Columna, 1] + '/' + SGSimulacion.Cells[Columna, 0]);
  Self.Caption := FormCaption + ' ' + Format(' (C:%.3d, F:%.3d) Art:%.15s Fec.:%s', [Columna, Fila, SGSimulacion.Cells[1, Fila], DateToStr(DEFechaEntrega.Date)]);
  EFProveedor.SetFocus;

  DMNecesidadMateraPrima.MuestraProveedoresArticulo(SGSimulacion.Cells[1, Fila]);
end;

procedure TFMNecesidadMateraPrima.SGSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  inherited;
  Columna := ACol;
  Fila := ARow;
  Self.Caption := FormCaption + ' ' + Format('(C:%.3d, F:%.3d) Art:%.15s Fec.:%s', [Columna, Fila, TStringGrid(Sender).Cells[1, Fila], TStringGrid(Sender).Cells[Columna, 1] + '/' + TStringGrid(Sender).Cells[Columna, 0]]);
  TStringGrid(Sender).Invalidate;
end;

procedure TFMNecesidadMateraPrima.BOkClick(Sender: TObject);
var
  Articulo : string;
  Proveedor : integer;
  Unidades : double;
begin
  inherited;
  /// Aqui debe hacer una linea de propuesta al proveedor con la fecha de entrega prevista (inicio de semana)
  Articulo := SGSimulacion.Cells[1, Fila];
  Proveedor := StrToIntDef(EFProveedor.Text, 0);
  Unidades := StrToFloatDef(EUnidades.Text, 0);

  DMNecesidadMateraPrima.Proponer(EFSerie.Text, EFAlmacen.Text, Articulo, Proveedor, Unidades, DEFechaEntrega.Date);
  ARecalcularSimulacion.Execute;
end;

procedure TFMNecesidadMateraPrima.DBGProveedoresArticuloDblClick(Sender: TObject);
begin
  inherited;
  EFProveedor.Text := DMNecesidadMateraPrima.xProveedoresArticuloPROVEEDOR.AsString;
end;

procedure TFMNecesidadMateraPrima.sgPedidosVentaDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.APedidosPendientes, ' ESTADO = 0 AND ID_S IN (SELECT ID_S FROM GES_DETALLES_S WHERE ID_A = ' + IntToStr(DameIDArticulo(sgPedidosVenta.Cells[1, Fila])) + ')');
end;

procedure TFMNecesidadMateraPrima.sgPedidosCompraDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.APedidosPendientesProv, ' ESTADO = 0 AND ID_E IN (SELECT ID_E FROM GES_DETALLES_E WHERE ID_A = ' + IntToStr(DameIDArticulo(sgPedidosCompra.Cells[1, Fila])) + ')');
end;

procedure TFMNecesidadMateraPrima.AInfStocksExecute(Sender: TObject);
var
  Articulo : string;
begin
  inherited;
  if (PCMain.ActivePage = TSPedidosVenta) then
     Articulo := sgPedidosVenta.Cells[1, Fila];
  if (PCMain.ActivePage = TSPedidosCompra) then
     Articulo := sgPedidosCompra.Cells[1, Fila];
  if (PCMain.ActivePage = TSNecesidades) then
     Articulo := sgNecesidades.Cells[1, Fila];
  if (PCMain.ActivePage = TSStockFuturo) then
     Articulo := sgStockFuturo.Cells[1, Fila];
  if (PCMain.ActivePage = TSSimulacionPedidosCompra) then
     Articulo := SGSimulacion.Cells[1, Fila];
  {
  if (PCMain.ActivePage = TSRecursos) then
     Articulo := SGRegursos.Cells[1, Fila];
  }
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, REntorno.AlmacenDefecto, Self);
end;

procedure TFMNecesidadMateraPrima.EFArticuloChange(Sender: TObject);
var
  sg : TStringGrid;
  r : integer;
  Articulo : string;
begin
  inherited;
  if (EFArticulo.Text <> '') then
  begin
     sg := nil;
     if (PCMain.ActivePage = TSPedidosVenta) then
        sg := sgPedidosVenta;
     if (PCMain.ActivePage = TSPedidosCompra) then
        sg := sgPedidosCompra;
     if (PCMain.ActivePage = TSNecesidades) then
        sg := sgNecesidades;
     if (PCMain.ActivePage = TSStockFuturo) then
        sg := sgStockFuturo;
     if (PCMain.ActivePage = TSSimulacionPedidosCompra) then
        sg := SGSimulacion;
     if (PCMain.ActivePage = TSRecursos) then
        sg := SGRegursos;
     Articulo := EFArticulo.Text;

     if Assigned(sg) then
     begin
        with sg do
        begin
           r := FixedRows;
           while ((r < RowCount) and (Cells[1, r] <> Articulo)) do
              Inc(r);

           if (Cells[1, r] = Articulo) then
              PosicionarStringGrid(sg, Col, r);
        end;
     end;

     EFArticulo.Text := '';
     sg.SetFocus;
  end;
end;

procedure TFMNecesidadMateraPrima.EFFamiliaBusqueda(Sender: TObject);
begin
  inherited;
  EFFamilia.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
end;

procedure TFMNecesidadMateraPrima.BFiltrarFamiliaClick(Sender: TObject);
var
  sg : TStringGrid;
  ts : TTabSheet;
  r : integer;
begin
  inherited;
  if (EFFamilia.Text <> '') then
  begin
     // Guardo estado inicial
     sg := nil;
     ts := PCMain.ActivePage;
     if (PCMain.ActivePage = TSPedidosVenta) then
        sg := sgPedidosVenta;
     if (PCMain.ActivePage = TSPedidosCompra) then
        sg := sgPedidosCompra;
     if (PCMain.ActivePage = TSNecesidades) then
        sg := sgNecesidades;
     if (PCMain.ActivePage = TSStockFuturo) then
        sg := sgStockFuturo;
     if (PCMain.ActivePage = TSSimulacionPedidosCompra) then
        sg := SGSimulacion;
     if (PCMain.ActivePage = TSRecursos) then
        sg := SGRegursos;

     // Borro lineas en compras que no pertenecen a la familia filtrada
     for r := sgPedidosCompra.RowCount - 1 downto sgPedidosCompra.FixedRows do
        if (sgPedidosCompra.Cells[3, r] <> EFFamilia.Text) then
           DeleteRow(sgPedidosCompra, r);

     // Recalculos
     ARecalcularNecesidades.Execute;
     ARecalcularStockFuturo.Execute;

     // Borro lineas en Stock Futuro que no pertenecen a la familia filtrada
     for r := sgStockFuturo.RowCount - 1 downto sgStockFuturo.FixedRows do
        if (sgStockFuturo.Cells[3, r] <> EFFamilia.Text) then
           DeleteRow(sgStockFuturo, r);

     // Recalculos
     ARecalcularSimulacion.Execute;

     // Borro lineas en Simulacion que no pertenecen a la familia filtrada
     for r := SGSimulacion.RowCount - 1 downto SGSimulacion.FixedRows do
        if (SGSimulacion.Cells[3, r] <> EFFamilia.Text) then
           DeleteRow(SGSimulacion, r);

     // Renumero las lineas que queden
     RenumerarStringGrid(sgPedidosCompra);
     RenumerarStringGrid(sgNecesidades);
     RenumerarStringGrid(sgStockFuturo);
     RenumerarStringGrid(SGSimulacion);

     // Vuelvo a la posicion inicial
     EFFamilia.Text := '';
     PCMain.ActivePage := ts;
     sg.SetFocus;
  end;
end;

procedure TFMNecesidadMateraPrima.RenumerarStringGrid(sg: TStringGrid);
var
  r : integer;
begin
  with sg do
  begin
     for r := FixedRows to RowCount - 1 do
     begin
        Cells[0, r] := IntToStr(r - FixedRows + 1);
     end;
  end;
end;

end.
