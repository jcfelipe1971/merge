unit UFMParteMovimiento;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, ULFPageControl,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls,
  ULFEdit, Mask, rxToolEdit, ULFDateEdit, ULFLabel, HYFIBQuery;

type
  TMyCustomGrid = class(TCustomGrid);

type
  TFMParteMovimiento = class(TFPEditSinNavegador)
     LFCategoryAction1: TLFCategoryAction;
     PCMain: TLFPageControl;
     TSParteMovimiento: TTabSheet;
     sgParteMovimientos: TStringGrid;
     ARecalcularParteMovimientos: TAction;
     ProgressBar: TProgressBar;
     LFCategoryAction2: TLFCategoryAction;
     AExportacionExcel: TAction;
     PNLFiltro: TLFPanel;
     LFechas: TLFLabel;
     LProveedor: TLFLabel;
     LSerie: TLFLabel;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     EProveedor: TLFEdit;
     ESerie: TLFEdit;
     EFProveedor: TLFEditFind2000;
     EFSerie: TLFEditFind2000;
     LArticulos: TLFLabel;
     EFArtDesde: TLFEditFind2000;
     EFArtHasta: TLFEditFind2000;
     LSerieReposicion: TLFLabel;
     ESerieReposicion: TLFEdit;
     EFSerieReposicion: TLFEditFind2000;
     LFCategoryAction3: TLFCategoryAction;
     AImprimir: TAction;
     ADisenyar: TAction;
     LProgreso: TLabel;
     PNLProgreso: TLFPanel;
     TBSep1: TToolButton;
     TBRecalcularParteMovimientos: TToolButton;
     TBEsportacionExcel: TToolButton;
     TBImprimir: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecalcularParteMovimientosExecute(Sender: TObject);
     procedure sgDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure AExportacionExcelExecute(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFArtDesdeBusqueda(Sender: TObject);
     procedure EFArtHastaBusqueda(Sender: TObject);
     procedure EFSerieReposicionChange(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ADisenyarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMParteMovimiento : TFMParteMovimiento;

implementation

uses UDMParteMovimiento, UEntorno, UFormGest, DateUtils, UDMMain, UUtiles, UHojaCalc, Math, UFMListConfig, UParam, UDameDato;

{$R *.dfm}

procedure TFMParteMovimiento.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMParteMovimiento, DMParteMovimiento);
  PCMain.ActivePage := TSParteMovimiento;
  DEDesdeFecha.Date := Today;
  DEHastaFecha.Date := Today;
  EFSerie.Text := REntorno.Serie;
  EFArtDesde.Text := DMParteMovimiento.DameArticuloMin;
  EFArtHasta.Text := DMParteMovimiento.DameArticuloMax;
end;

procedure TFMParteMovimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMParteMovimiento);
end;

procedure TFMParteMovimiento.ARecalcularParteMovimientosExecute(Sender: TObject);
var
  i, r, c, alb, maxalb, alp, maxalp : integer;
  ColTotalCompras, ColTotalVentas, ColSaldoFinal : integer;
  u, uAlm : double;
  Almacen : string;
  c1, c2 : string;
  Salir : boolean;
begin
  inherited;
  PNLProgreso.Visible := True;
  try
     // Formato del grid
     with sgParteMovimientos do
     begin
        // Vacío el contenido de las celdas
        for i := 0 to ColCount - 1 do
           for r := 0 to RowCount - 1 do
              Cells[i, r] := '';

        // Defino tamaños de columna
        ColCount := 6;
        RowCount := 3;
        FixedCols := 4;
        FixedRows := 2;
        ColWidths[0] := 35; // Nro de lina
        ColWidths[1] := 65; // Cod. Proveedor
        ColWidths[2] := 65; // Articulo
        ColWidths[3] := 250; // Titulo del articulo
        ColWidths[4] := 40; // Existencias iniciales
        ColWidths[5] := 40; // ALB no facturados
        {
        ColWidths[4] := 80; // ALP1
        ColWidths[5] := 80; // ALP2
        ColWidths[6] := 80; // ALP3 ...
        ColWidths[7] := 80; // ALB1 ...
        ColWidths[ultima - 1] := 80; // Total Compras
        ColWidths[ultima] := 80; // Total Ventas
        }

        // Titulos de las primeras columnas
        Cells[0, 0] := 'Nro';
        Cells[1, 0] := 'Articulo';
        Cells[2, 0] := 'Cod. Prov.';
        Cells[3, 0] := 'Titulo';
        Cells[4, 0] := 'Stock inicial';
        Cells[5, 0] := 'ALB no FAC';
     end;

     // Obtengo los datos
     // Primero los artículos de este proveedor
     DMParteMovimiento.RefrescaArticulos(StrToIntDef(EFProveedor.Text, 0), EFArtDesde.Text, EFArtHasta.Text);
     with sgParteMovimientos do
     begin
        Visible := False;
        try
           // Redimensiono el StringGrid segun la necesidad a presentar
           RowCount := FixedRows + DMParteMovimiento.xDatos.RecordCount + 1;

           // Relleno con los datos de la tabla
           r := TopRow - 1;
           ProgressBar.Position := 0;
           ProgressBar.Max := RowCount * 6;
           while (not DMParteMovimiento.xDatos.EOF) do
           begin
              LProgreso.Caption := Format(_('Obtengo los articulos (%d)'), [r]);
              Application.ProcessMessages;

              Inc(r);
              Cells[0, r] := IntToStr(r - FixedRows + 1);
              Cells[1, r] := DMParteMovimiento.xDatos.FieldByName('ARTICULO').AsString;
              // Cells[2, r] := DMParteMovimiento.xDatos.FieldByName('CODIGO_PROVEEDOR').AsString;
              Cells[2, r] := DMParteMovimiento.xDatos.FieldByName('ALFA_4').AsString;
              Cells[3, r] := DMParteMovimiento.xDatos.FieldByName('TITULO').AsString;

              DMParteMovimiento.xDatos.Next;

              ProgressBar.StepIt;
           end;
           DMParteMovimiento.xDatos.Close;

           RowCount := r + 2;
        finally
           Visible := True;
        end;
     end;

     // Luego los albaranes de compra de estos articulos de la serie entre fechas
     with sgParteMovimientos do
     begin
        Visible := False;
        try
           maxalp := 0;
           r := TopRow - 1;
           // Recorro las lineas rellenando información de albaranes de compra
           while r < RowCount - 1 do
           begin
              LProgreso.Caption := Format(_('Obtengo los albaranes de compra (F:%d/%d)'), [r, RowCount]);
              Application.ProcessMessages;

              // Relleno con los datos de la tabla
              DMParteMovimiento.RefrescaAlbaranCompra(StrToIntDef(EFProveedor.Text, 0), EFSerie.Text, Cells[1, r], DEDesdeFecha.Date, DEHastaFecha.Date);

              while (not DMParteMovimiento.xDatos.EOF) do
              begin
                 alp := 0;
                 // Primero busco si existe una columna para este albaran de compra
                 for i := 6 to ColCount - 1 do
                 begin
                    if (Cells[i, 0] = Format('ALP-%s(%d)', [DMParteMovimiento.xDatos.FieldByName('NUM_ALBARAN').AsString, {DMParteMovimiento.xDatos.FieldByName('TIPO').AsString,} DMParteMovimiento.xDatos.FieldByName('RIG').AsInteger])) then
                       alp := i;
                 end;

                 // Si no encuentro, creo una columna nueva
                 if (alp = 0) then
                 begin
                    ColCount := ColCount + 1;
                    alp := ColCount - 1;
                    Cells[alp, 0] := Format('ALP-%s(%d)', [DMParteMovimiento.xDatos.FieldByName('NUM_ALBARAN').AsString, {DMParteMovimiento.xDatos.FieldByName('TIPO').AsString,} DMParteMovimiento.xDatos.FieldByName('RIG').AsInteger]);
                    Cells[alp, 1] := DateToStr(DMParteMovimiento.xDatos.FieldByName('FECHA').AsDateTime);
                 end;

                 if (alp > maxalp) then
                    maxalp := alp;

                 // DRASA - Evitar decimales
                 // Cells[alp, r] := FloatToStr(StrToFloatDef(Cells[alp, r], 0) + DMParteMovimiento.xDatos.FieldByName('UNIDADES').AsFloat);
                 Cells[alp, r] := IntToStr(Round(DMParteMovimiento.xDatos.FieldByName('UNIDADES').AsFloat));
                 DMParteMovimiento.xDatos.Next;
              end;
              ProgressBar.StepIt;

              DMParteMovimiento.xDatos.Close;

              Inc(r);
           end;
        finally
           Visible := True;
        end;
     end;

     // Luego los albaranes de venta de estos articulos de la serie entre fechas
     with sgParteMovimientos do
     begin
        Visible := False;
        try
           maxalb := 0;
           r := TopRow - 1;
           // Recorro las lineas rellenando información de albaranes de compra
           while r < RowCount - 1 do
           begin
              LProgreso.Caption := Format(_('Obtengo los albaranes de venta (F:%d/%d)'), [r, RowCount]);
              Application.ProcessMessages;

              // Relleno con los datos de la tabla
              DMParteMovimiento.RefrescaAlbaranVenta(StrToIntDef(EFProveedor.Text, 0), EFSerie.Text, EFSerieReposicion.Text, Cells[1, r], DEDesdeFecha.Date, DEHastaFecha.Date);

              while (not DMParteMovimiento.xDatos.EOF) do
              begin
                 alb := 0;
                 // Primero busco si existe una columna para este albaran de venta
                 // Buscamos desde maxalp o si no hay compras a partir de la cuarta columna
                 for i := (max(maxalp, 6)) to ColCount - 1 do
                 begin
                    if (Cells[i, 0] = DMParteMovimiento.xDatos.FieldByName('TIPO').AsString + '-' + DMParteMovimiento.xDatos.FieldByName('RIG').AsString) then
                       alb := i;
                 end;

                 // Si no encuentro, creo una columna nueva
                 if (alb = 0) then
                 begin
                    ColCount := ColCount + 1;
                    alb := ColCount - 1;
                    Cells[alb, 0] := DMParteMovimiento.xDatos.FieldByName('TIPO').AsString + '-' + DMParteMovimiento.xDatos.FieldByName('RIG').AsString;
                    Cells[alb, 1] := DateToStr(DMParteMovimiento.xDatos.FieldByName('FECHA').AsDateTime);
                 end;

                 if (alb > maxalb) then
                    maxalb := alb;

                 // DRASA - Evitar decimales
                 Cells[alb, r] := IntToStr(Round(DMParteMovimiento.xDatos.FieldByName('UNIDADES').AsFloat));
                 DMParteMovimiento.xDatos.Next;
              end;

              ProgressBar.StepIt;

              DMParteMovimiento.xDatos.Close;

              Inc(r);
           end;
        finally
           Visible := True;
        end;
     end;

     // Calcular el stock de cada articulo
     with sgParteMovimientos do
     begin
        Visible := False;
        try
           r := TopRow;
           Almacen := DMMain.DameAlmacenDocumento('ALB', EFSerie.Text);
           // Recorro las lineas rellenando información de stock
           while r < RowCount - 1 do
           begin
              LProgreso.Caption := Format(_('Obtengo stock inicial (F:%d/%d)'), [r, RowCount]);
              Application.ProcessMessages;

              u := DMParteMovimiento.DameStockInicialArticulo(StrToIntDef(EFProveedor.Text, 0), EFSerie.Text, EFSerieReposicion.Text, Cells[1, r], DEDesdeFecha.Date, DEHastaFecha.Date, Almacen);
              uAlm := 0;

              // Saldo inicial
              Cells[4, r] := FormatFloat('#', u);
              // ALB no facturados
              if (uAlm <> 0) then
                 Cells[5, r] := FormatFloat('#', uAlm);

              ProgressBar.StepIt;

              Inc(r);
           end;
        finally
           Visible := True;
        end;
     end;

     // Ahora los totales en las ultimas dos columnas
     with sgParteMovimientos do
     begin
        Visible := False;
        try
           ColCount := ColCount + 1;
           ColTotalCompras := ColCount - 1;
           ColCount := ColCount + 1;
           ColTotalVentas := ColCount - 1;
           ColCount := ColCount + 1;
           ColSaldoFinal := ColCount - 1;

           Cells[ColTotalCompras, 0] := 'Total Compras';
           Cells[ColTotalVentas, 0] := 'Total Ventas';
           Cells[ColSaldoFinal, 0] := 'Saldo Final';

           r := TopRow;
           // Recorro las lineas rellenando información de totales
           while r < RowCount - 1 do
           begin
              LProgreso.Caption := Format(_('Calculo totales (F:%d/%d)'), [r, RowCount]);
              Application.ProcessMessages;

              u := 0;
              if (maxalp > 0) then
              begin
                 // No contamos el stock inicial como una compra
                 for i := 6 to maxalp do
                 begin
                    if (Cells[i, r] <> '') then
                       u := u + StrToIntDef(Cells[i, r], 0);
                 end;
                 Cells[ColTotalCompras, r] := FloatToStr(u);
              end
              else
                 Cells[ColTotalCompras, r] := '0';

              u := 0;
              // Ahora tenemos una columna más
              // for i := maxalp + 1 to ColCount - 3 do
              if (maxalb > 0) then
              begin
                 // Escogemos la columna ultima de compras
                 for i := (max(maxalp + 1, 5)) to ColCount - 4 do
                 begin
                    if (Cells[i, r] <> '') then
                       u := u + StrToIntDef(Cells[i, r], 0);
                 end;
                 Cells[ColTotalVentas, r] := FloatToStr(u);
              end
              else
                 Cells[ColTotalVentas, r] := '0';

              Cells[ColSaldoFinal, r] := FloatToStr(StrToIntDef(Cells[4, r], 0) - StrToIntDef(Cells[5, r], 0) + StrToIntDef(Cells[ColTotalCompras, r], 0) - StrToIntDef(Cells[ColTotalVentas, r], 0));

              ProgressBar.StepIt;

              Inc(r);
           end;
        finally
           Visible := True;
        end;
     end;

     // Eliminamos las filas sin datos
     with sgParteMovimientos do
     begin
        Visible := False;
        try
           r := TopRow;

           // Recorro las filas borrando las filas sin valores
           while r < RowCount - 1 do
           begin
              LProgreso.Caption := Format(_('Eliminamos las filas sin datos (F:%d/%d)'), [r, RowCount]);
              Application.ProcessMessages;

              // Si tiene valores no lo borramos
              if ((StrToIntDef(Cells[4, r], 0) <> 0) or
                 (StrToIntDef(Cells[5, r], 0) <> 0) or
                 (StrToIntDef(Cells[ColTotalCompras, r], 0) <> 0) or
                 (StrToIntDef(Cells[ColTotalVentas, r], 0) <> 0) or
                 (StrToIntDef(Cells[ColSaldoFinal, r], 0) <> 0)) then
              begin
                 Inc(r);
              end
              else
              begin
                 // Si los totales son 0 reviso si tiene algun documento
                 i := 5;
                 Salir := False;
                 while (i < ColTotalCompras) and (not Salir) do
                 begin
                    Inc(i);
                    if (StrToIntDef(Cells[i, r], 0) <> 0) then
                       Salir := True;
                 end;

                 // Si encuento que algun documento tiene valor, salto esta linea
                 if (StrToIntDef(Cells[i, r], 0) <> 0) then
                    Inc(r)
                 else
                    DeleteRow(sgParteMovimientos, r);
              end;

              ProgressBar.StepIt;
           end;
        finally
           Visible := True;
        end;
     end;

     // Ordenamos las columnas. Primero ALP+RIG y luego ALB+RIG
     with sgParteMovimientos do
     begin
        Visible := False;
        try
           // Primero los ALP

           // Empiezo despues del "Stock inicial"
           i := LeftCol + 2;

           while (i < ColCount - 3) do
           begin
              LProgreso.Caption := Format(_('Ordenando columnas (compras) (C:%d/%d)'), [i, ColCount]);
              // Columna inicial para empezar a comparar
              alp := i;
              c := i + 1;
              // Busco el menor
              while (c < ColCount - 3) do
              begin
                 if (Copy(Cells[c, 0], 1, 3) = 'ALP') then
                 begin
                    // La comparacion debe tener en cuenta la fecha. La formateo como YYYYMMDD-ALP-RIG
                    c1 := FormatDateTime('yyyymmdd', (StrToDateTime(Cells[c, 1]))) + Cells[c, 0];
                    c2 := FormatDateTime('yyyymmdd', (StrToDateTime(Cells[alp, 1]))) + Cells[alp, 0];
                    if (c1 < c2) then
                       alp := c;
                 end;

                 Inc(c);
              end;

              // Lo pongo en la columan i
              if (alp <> i) then
                 TMyCustomGrid(sgParteMovimientos).MoveColumn(alp, i);

              Inc(i);
           end;

           // Segundo los ALB

           // Empiezo despues del "Stock inicial"
           i := LeftCol + 2;

           // Busco el primero <> 'ALP'
           while (i < ColCount - 3) and ((Copy(Cells[i, 0], 1, 3) = 'ALP')) do
              Inc(i);

           while (i < ColCount - 3) do
           begin
              LProgreso.Caption := Format(_('Ordenando columnas (compras) (C:%d/%d)'), [i, ColCount]);
              // Columna inicial para empezar a comparar
              alb := i;
              c := i + 1;

              // Busco el menor
              while (c < ColCount - 3) do
              begin
                 if (Copy(Cells[c, 0], 1, 3) = 'ALB') then
                 begin
                    // La comparacion debe tener en cuenta la fecha. La formateo como YYYYMMDD-ALP-RIG
                    c1 := FormatDateTime('yyyymmdd', (StrToDateTime(Cells[c, 1]))) + Cells[c, 0];
                    c2 := FormatDateTime('yyyymmdd', (StrToDateTime(Cells[alb, 1]))) + Cells[alb, 0];
                    if (c1 < c2) then
                       alb := c;
                 end;

                 Inc(c);
              end;

              // Lo pongo en la columan i
              if (alb <> i) then
                 TMyCustomGrid(sgParteMovimientos).MoveColumn(alb, i);

              Inc(i);
           end;
        finally
           Visible := True;
        end;
     end;

     {$IFDEF Debug}
     // Calcular el stock de cada articulo
     with sgParteMovimientos do
     begin
        Visible := False;
        try
        ColCount := ColCount + 1;
        c := ColCount-1;
        r := TopRow;
        Almacen := DMMain.DameAlmacenDocumento('ALB', EFSerie.Text);
        // Recorro las lineas rellenando información de stock
        while r < RowCount - 1 do
        begin
           LProgreso.Caption := Format(_('Obtengo stock final (F:%d/%d)'),[r , RowCount]);
           u := DMMain.DameStockArticuloFecha(REntorno.Empresa, 0 {REntorno.Canal}, Cells[1, r], Almacen, HourIntoDate(DEHastaFecha.Date, '23:59:59'));

           DMMain.Log('Stock Final '+Almacen+ '/' +Cells[1, r] + ' : ' +FormatFloat('0', u));

           Cells[c, r] := FormatFloat('0', u);

           Application.ProcessMessages;
           Inc(r);
        end;
        finally
           Visible := True;
        end;
     end;
     {$ENDIF}

  finally
     PNLProgreso.Visible := False;
  end;
end;

procedure TFMParteMovimiento.sgDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
(*
var
  s, sd : string;
  LDelta : integer;
  d : TDateTime;
*)
begin
  inherited;
  (*
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
           if (d < Today) then
              ColorInactivo(Canvas)
           else
           begin
              ColorEdicion(Canvas);
           end;
        end;
     end;

     // Titulos -> Center
     if (ACol >= LeftCol) and (ARow < TopRow) then
        Canvas.TextRect(Rect, Rect.Left + (LDelta div 2), Rect.Top + 2, s)
     else
     // Valores y primera columna -> Right Justify
     if (((ACol >= LeftCol) and (ARow >= TopRow)) or (ACol = 0) or (ACol = 3)) then
        Canvas.TextRect(Rect, Rect.Left + LDelta - 2, Rect.Top + 2, s)
     else
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, s);
  end;
*)
end;

procedure TFMParteMovimiento.AExportacionExcelExecute(Sender: TObject);
var
  HCalc : THojaCalc;
  f, c : integer;
  Archivo : string;
begin
  inherited;
  Archivo := Format(_('ParteMovimiento_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMParteMovimiento') then
  begin
     DMMain.Log('Exportacion Excel Parte Movimientos');
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

     PNLProgreso.Visible := True;
     try
        ProgressBar.Max := sgParteMovimientos.ColCount;
        ProgressBar.Position := 0;

        DMMain.Log('HCalc.FileName = ' + Archivo);
        HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!

        try
           DMMain.LogIni('Recorro lineas Parte Movimientos');

           // Exportacion de datos de Parte de Movimientos
           HCalc.ActivateSheetByIndex(1);
           HCalc.ActiveSheetName := _('Movimientos');
           DMMain.Log(Format(_('Comienzo bucle Filas:%d Columnas:%d)'), [sgParteMovimientos.RowCount, sgParteMovimientos.ColCount]));
           for c := 1 to sgParteMovimientos.ColCount - 1 do
           begin
              DMMain.Log(Format(_('Exportando celda (F:%d C:%d)'), [f, c]));
              for f := 0 to sgParteMovimientos.RowCount - 1 do
              begin
                 LProgreso.Caption := Format(_('Exportando celda (F:%d C:%d)'), [f, c]);
                 try
                    if (sgParteMovimientos.Cells[c, f] <> '') then
                    begin
                       // Columnas de unidades
                       if (c > 3) then
                       begin
                          // Nro. de Factura
                          if (f = 0) then
                             HCalc.CellText[f + 1, c] := sgParteMovimientos.Cells[c, f]
                          else
                          // Fecha de Factura
                          if (f = 1) then
                             // Lo envío como texto porque LibreOffice lo muestro con formato MM/DD/YYYY
                             // HCalc.SendDate(f + 1, c, StrToDateTime(sgParteMovimientos.Cells[c, f]))
                             HCalc.CellText[f + 1, c] := sgParteMovimientos.Cells[c, f]
                          else
                          // Unidades
                          if (f > 1) then
                          begin
                             if (StrToFloatDef(sgParteMovimientos.Cells[c, f], 0) <> 0) then
                             begin
                                HCalc.SendNumber(f + 1, c, StrToFloatDef(sgParteMovimientos.Cells[c, f], 0));
                                HCalc.HorizontalAlignment(f + 1, c, taRightJustify);
                             end;
                          end;
                       end
                       else
                          HCalc.CellText[f + 1, c] := sgParteMovimientos.Cells[c, f];
                    end;
                 except
                    on e: Exception do
                    begin
                       DMMain.Log(Format(_('Error exportando celda (F:%d C:%d)'), [f, c]));
                       DMMain.Log(e.Message);

                       ShowMessage(Format(_('Error exportando celda (F:%d C:%d)'), [f, c]) + #13#10 + e.Message);
                    end;
                 end;
              end;
              ProgressBar.StepIt;
              Application.ProcessMessages;
           end;

           // Ancho de columna Titulo de Articulo
           HCalc.ColumnWidth(3, 10000);

           DMMain.Log('HCalc.SaveDocAs');
           HCalc.SaveDocAs(Archivo, (UpperCase(ExtractFileExt(Archivo)) = '.XLS'));
        finally
           DMMain.LogFin('Recorro lineas Parte Movimientos');
           DMMain.Log('Liberar Excel');
           HCalc.Free;
        end;
     finally
        LProgreso.Caption := '';
        PNLProgreso.Visible := False;
     end;

     Application.ProcessMessages;
  end;
end;

procedure TFMParteMovimiento.EFProveedorChange(Sender: TObject);
begin
  inherited;
  EProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMParteMovimiento.EFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMParteMovimiento.EFArtDesdeBusqueda(Sender: TObject);
begin
  inherited;
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMParteMovimiento.EFArtHastaBusqueda(Sender: TObject);
begin
  inherited;
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMParteMovimiento.EFSerieReposicionChange(Sender: TObject);
begin
  inherited;
  ESerieReposicion.Text := DameTituloSerie(EFSerieReposicion.Text);
end;

procedure TFMParteMovimiento.AImprimirExecute(Sender: TObject);
var
  i, f, c, ColumnaInicial, ColumnaFinal, ColumnasImprimir : integer;
begin
  inherited;
  /// Se generara una tabla con la informacion de la linea y 10 documentos.
  /// Si hay mas de 10 documentos se generara otro registro
  /// COLUMNA_INICIAL indicara el grupo de 10 registros al que pertenece

  // Vacio la tabla en la que meteremos los elementos a listar
  with DMParteMovimiento.xListado do
  begin
     Close;
     EmptyTable;
     Open;
  end;

  ColumnasImprimir := 10;
  ColumnaInicial := 6;
  ColumnaFinal := ColumnaInicial + ColumnasImprimir - 1;
  if (ColumnaFinal > sgParteMovimientos.ColCount) then
     ColumnaFinal := sgParteMovimientos.ColCount;

  while (ColumnaInicial <= sgParteMovimientos.ColCount - 1) do
  begin
     for f := 2 to sgParteMovimientos.RowCount - 1 do
     begin
        with DMParteMovimiento.xListado do
        begin
           Insert;
           FieldByName('COLUMNA_INICIAL').AsInteger := ColumnaInicial;
           FieldByName('ARTICULO').AsString := sgParteMovimientos.Cells[1, f];
           FieldByName('CODIGO_PROVEEDOR').AsString := sgParteMovimientos.Cells[2, f];
           FieldByName('TITULO').AsString := sgParteMovimientos.Cells[3, f];
           FieldByName('STOCK_INICIAL').AsFloat := StrToFloatDef(sgParteMovimientos.Cells[4, f], 0);

           i := 1;
           for c := ColumnaInicial to ColumnaFinal do
           begin
              if (c >= sgParteMovimientos.ColCount - 4) then
              begin
                 FieldByName(Format('DOCUMENTO_%.2d', [i])).AsString := sgParteMovimientos.Cells[c, 0];
                 FieldByName(Format('FECHA_%.2d', [i])).AsDateTime := 0;
                 FieldByName(Format('UNIDADES_%.2d', [i])).AsFloat := StrToFloatDef(sgParteMovimientos.Cells[c, f], 0);
              end
              else
              begin
                 FieldByName(Format('DOCUMENTO_%.2d', [i])).AsString := sgParteMovimientos.Cells[c, 0];
                 FieldByName(Format('FECHA_%.2d', [i])).AsDateTime := StrToDateTime(sgParteMovimientos.Cells[c, 1]);
                 FieldByName(Format('UNIDADES_%.2d', [i])).AsFloat := StrToFloatDef(sgParteMovimientos.Cells[c, f], 0);
              end;

              Inc(i);
           end;

           Post;
        end;
     end;

     ColumnaInicial := ColumnaInicial + ColumnasImprimir;
     ColumnaFinal := ColumnaInicial + ColumnasImprimir - 1;
     if (ColumnaFinal > sgParteMovimientos.ColCount - 1) then
        ColumnaFinal := sgParteMovimientos.ColCount - 1;
  end;

  DMParteMovimiento.Imprimir(EFSerie.Text, EFSerieReposicion.Text, DEDesdeFecha.Date, DEHastaFecha.Date, EFArtDesde.Text, EFArtHasta.Text, StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMParteMovimiento.ADisenyarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(639, Formato, Cabecera, Copias, Pijama, EFSerie.Text, DMParteMovimiento.frListado);
end;

end.
