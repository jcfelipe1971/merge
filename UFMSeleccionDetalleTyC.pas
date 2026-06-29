unit UFMSeleccionDetalleTyC;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, ULFEdit, StdCtrls, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Grids;

type
  TFMSeleccionDetalleTyC = class(TFPEditSinNavegador)
     PNLFiltro: TLFPanel;
     EFModelo: TLFEditFind2000;
     LModelo: TLFLabel;
     EModelo: TLFEdit;
     SGDetalle: TStringGrid;
     TBSep1: TToolButton;
     TBGuardar: TToolButton;
     LUnidadExtendida: TLFLabel;
     EUnidadExtendida: TLFEdit;
     procedure EFModeloChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBGuardarClick(Sender: TObject);
     procedure SGDetalleDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
  private
     { Private declarations }
     {ID_A_M, ID_G_T : integer;}
     ID_DOC: integer;
     DM: TDataModule;
     procedure RefrescaSG;
  public
     { Public declarations }
     procedure Mostrar(IdDoc: integer; aDM: TDataModule);
  end;

var
  FMSeleccionDetalleTyC : TFMSeleccionDetalleTyC;

implementation

uses
  UDMMain, UEntorno, UDMSeleccionDetalleTyC, UFormGest, UUtiles, UDMPedidos;

{$R *.dfm}

procedure TFMSeleccionDetalleTyC.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSeleccionDetalleTyC, DMSeleccionDetalleTyC);
end;

procedure TFMSeleccionDetalleTyC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSeleccionDetalleTyC);
end;

procedure TFMSeleccionDetalleTyC.EFModeloChange(Sender: TObject);
begin
  inherited;
  DMSeleccionDetalleTyC.FiltraModelo(EFModelo.Text);
  EModelo.Text := DMSeleccionDetalleTyC.QMModelo.FieldByName('TITULO').AsString;
  RefrescaSG;
end;

procedure TFMSeleccionDetalleTyC.RefrescaSG;
var
  f, c : integer;
begin
  if (DMSeleccionDetalleTyC.QMModelo.FieldByName('ID_A_M').AsInteger = 0) then
  begin
     SGDetalle.RowCount := 5;
     SGDetalle.ColCount := 5;
     SGDetalle.FixedRows := 1;
     SGDetalle.FixedCols := 1;
  end
  else
  begin
     f := 1;
     with DMSeleccionDetalleTyC.QMColor do
     begin
        Last;
        SGDetalle.RowCount := RecordCount + 1;

        First;
        while not EOF do
        begin
           SGDetalle.Cells[0, f] := FieldByName('COLOR').AsString;
           Next;
           Inc(f);
        end;
     end;

     c := 1;
     with DMSeleccionDetalleTyC.QMTalla do
     begin
        Last;
        SGDetalle.ColCount := RecordCount + 1;

        First;
        while not EOF do
        begin
           SGDetalle.Cells[c, 0] := FieldByName('TITULO').AsString;
           Next;
           Inc(c);
        end;
     end;
  end;

  for c := 1 to SGDetalle.ColCount - 1 do
     SGDetalle.ColWidths[c] := 30;

  {
  for f := 1 to SGDetalle.RowCount -1 do
     SGDetalle.RowHeights[f] := 18;
  }

  SGDetalle.Repaint;
end;

procedure TFMSeleccionDetalleTyC.TBGuardarClick(Sender: TObject);
var
  f, c : integer;
  Unidades, UnidadesExtendidas1, UnidadesExtendidas2, UnidadesExtendidas3, UnidadesExtendidas4 : double;
  Articulo : string;
  Lote : string;
  IdUbicacion : integer;
  Precio : double;
  Descripcion : string;
  PCoste, Descuento1, Descuento2, Descuento3 : double;
  FechaPrevista : TDateTime;
begin
  inherited;
  // Graba los datos en lineas del documento

  // Recorro filas y columnas con contenido
  for f := 1 to SGDetalle.RowCount - 1 do
  begin
     for c := 1 to SGDetalle.ColCount - 1 do
     begin
        if SGDetalle.Cells[c, f] <> '' then
        begin
           // Posiciono Datasets para averigura datos de artículo
           DMSeleccionDetalleTyC.QMColor.Locate('COLOR', SGDetalle.Cells[0, f], []);
           DMSeleccionDetalleTyC.QMTalla.Locate('TITULO', SGDetalle.Cells[c, 0], []);

           Unidades := StrToFloatDef(SGDetalle.Cells[c, f], 0);
           UnidadesExtendidas1 := StrToFloatDef(EUnidadExtendida.Text, 0);
           UnidadesExtendidas2 := 0;
           UnidadesExtendidas3 := 0;
           UnidadesExtendidas4 := 0;
           Articulo := DMSeleccionDetalleTyC.QMTalla.FieldByName('ARTICULO').AsString;

           // Otros campos necesarios que se dejan vacios para que tomen valores por defecto
           Lote := '';
           IdUbicacion := 0;
           Precio := 0;
           Descripcion := '';
           PCoste := 0;
           Descuento1 := 0;
           Descuento2 := 0;
           Descuento3 := 0;
           FechaPrevista := EncodeDate(2000, 1, 1);

           // SGDetalle.Cells[c, f] := format('[%d,%d]%fx%f', [DMSeleccionDetalleTyC.QMColor.FieldByName('ID_A_M_C').AsInteger, DMSeleccionDetalleTyC.QMTalla.FieldByName('ID_A_T').AsInteger, ue]);

           if (Unidades <> 0) then
           begin
              // Creo linea en documento
              if (DM is TDMPedidos) then
                 TDMPedidos(DM).Inserta(Articulo, Unidades, Lote, IdUbicacion, Precio, Descripcion, PCoste, Descuento1, Descuento2, Descuento3, FechaPrevista, UnidadesExtendidas1, UnidadesExtendidas2, UnidadesExtendidas3, UnidadesExtendidas4);
           end;

           // Limpio celda
           SGDetalle.Cells[c, f] := '';
        end;
     end;
  end;
end;

procedure TFMSeleccionDetalleTyC.Mostrar(IdDoc: integer; aDM: TDataModule);
begin
  ID_DOC := IdDoc;
  DM := aDM;
  ShowModal;
end;

procedure TFMSeleccionDetalleTyC.SGDetalleDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  s : string;
  LDelta : integer;
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
        if (ACol >= LeftCol) and (ARow >= TopRow) and (DMSeleccionDetalleTyC.QMTallasArticulo.Active) then
        begin
           DMSeleccionDetalleTyC.QMTallasArticulo.Locate('COLOR;TALLA', VarArrayOf([SGDetalle.Cells[0, ARow], SGDetalle.Cells[ACol, 0]]), []);
           if (DMSeleccionDetalleTyC.QMTallasArticulo.FieldByName('ARTICULO').AsString <> '') then
              ColorEdicion(Canvas)
           else
              ColorInactivo(Canvas);
        end;
     end;

     // Titulos -> Center
     if (ACol >= LeftCol) and (ARow < TopRow) then
        Canvas.TextRect(Rect, Rect.Left + (LDelta div 2), Rect.Top + 2, s)
     else
     // Valores y primera columna -> Right Justify
     if (ACol >= LeftCol) and (ARow >= TopRow) then
        Canvas.TextRect(Rect, Rect.Left + LDelta - 2, Rect.Top + 2, s)
     else
        Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, s);
  end;
end;

end.
