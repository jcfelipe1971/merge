unit UFMExportacionHelios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFLabel,
  Mask, rxToolEdit, ULFDateEdit, TFlatCheckBoxUnit, ULFCheckBox, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  UNavigator, ULFEditFind2000;

type
  TFMExportacionHelios = class(TFPEditSinNavegador)
     DEFecha: TLFDateEdit;
     LDesdeFecha: TLFLabel;
     TSep1: TToolButton;
     TButtExportar: TToolButton;
     AExportar: TAction;
     LCodigoAlmacen: TLFLabel;
     ECodigoAlmacen: TLFEdit;
     LRutaExportacion: TLFLabel;
     DERutaExportacion: TDirectoryEdit;
     EFAlmacen: TLFEditFind2000;
     LAlmacen: TLFLabel;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     PNLCabecera: TLFPanel;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     TSep2: TToolButton;
     TButCalcular: TToolButton;
     ACalcular: TAction;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     EProveedor: TLFEdit;
     EFDesdeArticulo: TLFEditFind2000;
     EFHastaArticulo: TLFEditFind2000;
     EAlmacen: TLFEdit;
     EDesdeArticulo: TLFEdit;
     EHastaArticulo: TLFEdit;
     LSeparador: TLFLabel;
     ESeparador: TLFEdit;
     CBEntrecomillado: TLFCheckBox;
     LColumnasInformacion: TLabel;
     LColumnasExportar: TLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AExportarExecute(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure ACalcularExecute(Sender: TObject);
     procedure EFDesdeArticuloChange(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure EFHastaArticuloChange(Sender: TObject);
     procedure DERutaExportacionExit(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMExportacionHelios : TFMExportacionHelios;

implementation

uses UDMExportacionHelios, UFormGest, UEntorno, UUtiles, UDameDato, DateUtils, UDMMain, UFMain;

{$R *.dfm}

procedure TFMExportacionHelios.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMExportacionHelios, DMExportacionHelios);

  ECodigoAlmacen.Text := LeeDatoIni('ExportacionHelios', 'CodigoAlmacen', '');
  ESeparador.Text := LeeDatoIni('ExportacionHelios', 'Separador', ';');
  CBEntrecomillado.Checked := LeeDatoIni('ExportacionHelios', 'Entrecomillado', False);
  DERutaExportacion.Text := LeeDatoIni('ExportacionHelios', 'RutaExportacion', GetSpecialFolderPath(CSIDL_PERSONAL, False));
  EFProveedor.Text := LeeDatoIni('ExportacionHelios', 'Proveedor', '');
  EFAlmacen.Text := LeeDatoIni('ExportacionHelios', 'Almacen', REntorno.AlmacenDefecto);
  EFDesdeArticulo.Text := LeeDatoIni('ExportacionHelios', 'DesdeArticulo', '.');
  EFHastaArticulo.Text := LeeDatoIni('ExportacionHelios', 'HastaArticulo', '¿?');

  DEFecha.Date := Yesterday;
  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMExportacionHelios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EscribeDatoIni('ExportacionHelios', 'CodigoAlmacen', ECodigoAlmacen.Text);
  EscribeDatoIni('ExportacionHelios', 'Separador', ESeparador.Text);
  EscribeDatoIni('ExportacionHelios', 'Entrecomillado', CBEntrecomillado.Checked);
  EscribeDatoIni('ExportacionHelios', 'RutaExportacion', DERutaExportacion.Text);
  EscribeDatoIni('ExportacionHelios', 'Proveedor', EFProveedor.Text);
  EscribeDatoIni('ExportacionHelios', 'Almacen', EFAlmacen.Text);
  EscribeDatoIni('ExportacionHelios', 'DesdeArticulo', EFDesdeArticulo.Text);
  EscribeDatoIni('ExportacionHelios', 'HastaArticulo', EFHastaArticulo.Text);

  CierraData(DMExportacionHelios);
end;

procedure TFMExportacionHelios.ACalcularExecute(Sender: TObject);
begin
  inherited;
  DMExportacionHelios.Calcular(EFAlmacen.Text, StrToIntDef(EFProveedor.Text, 0), DEFecha.Date, EFDesdeArticulo.Text, EFHastaArticulo.Text);
end;

procedure TFMExportacionHelios.AExportarExecute(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  Fichero := IncludeTrailingPathDelimiter(DERutaExportacion.Text);
  Fichero := Fichero + 'Helios_Carga_Stock-' + FormatDatetime('yyyymmdd', DEFecha.Date) + '.xls';

  DMExportacionHelios.Exportar(Fichero);
end;

procedure TFMExportacionHelios.EFProveedorChange(Sender: TObject);
begin
  inherited;
  EProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMExportacionHelios.EFAlmacenChange(Sender: TObject);
begin
  inherited;
  EAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMExportacionHelios.EFDesdeArticuloChange(Sender: TObject);
begin
  inherited;
  EDesdeArticulo.Text := DameTituloArticulo(EFDesdeArticulo.Text);
end;

procedure TFMExportacionHelios.EFHastaArticuloChange(Sender: TObject);
begin
  inherited;
  EHastaArticulo.Text := DameTituloArticulo(EFHastaArticulo.Text);
end;

procedure TFMExportacionHelios.DERutaExportacionExit(Sender: TObject);
begin
  inherited;
  DERutaExportacion.Text := IncludeTrailingPathDelimiter(DERutaExportacion.Text);
end;

procedure TFMExportacionHelios.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ARTICULO') then
     CeldaEnlace(DBGFDetalle, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'EXISTENCIAS') then
        begin
           if (DMExportacionHelios.SPStockAlmacenEXISTENCIAS.AsFloat < 0) then
              ColorError(Canvas)
           else
              ColorInactivo(Canvas);
        end;

        if (UpperCase(Column.FieldName) = 'FECHA_CADUCIDAD') then
        begin
           if (DMExportacionHelios.SPStockAlmacenFECHA_CADUCIDAD.AsDateTime < Today) then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end;

        if (UpperCase(Column.FieldName) = 'CANTIDAD') then
        begin
           if (DMExportacionHelios.SPStockAlmacenCANTIDAD.AsFloat < 0) then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end;

        { Helios pide que la unidad sea UND
        if (UpperCase(Column.FieldName) = 'UNIDAD') then
        begin
           if (DMExportacionHelios.SPStockAlmacenUNIDAD.AsString = '') then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end;
        }

        if (UpperCase(Column.FieldName) = 'CODIGO_AS400') then
        begin
           if (DMExportacionHelios.SPStockAlmacenCODIGO_AS400.AsString = '') then
              ColorError(Canvas)
           else
              ColorResaltado2(Canvas);
        end;
     end;
  end;

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMExportacionHelios.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos,
        'Articulo = ''' + DMExportacionHelios.SPStockAlmacenARTICULO.AsString + '''');
end;

procedure TFMExportacionHelios.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

end.
