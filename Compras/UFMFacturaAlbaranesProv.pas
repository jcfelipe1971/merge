unit UFMFacturaAlbaranesProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, DBCtrls, StdCtrls, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, ComCtrls, ToolWin, Grids, DBGrids, UFormGest,
  NsDBGrid, rxToolEdit, ULFPanel, ULFDBEdit, ULFComboBox, ULFToolBar,
  ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage, ULFDateEdit, ULFEdit,
  UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas, UEditPanel;

type
  TFMFacturaAlbaranesProv = class(TFPEditSinNavegador)
     TButtRegenera: TToolButton;
     TButtSep1: TToolButton;
     TButtMarcarTodas: TToolButton;
     TButtFacturar: TToolButton;
     TButtSep4: TToolButton;
     DBGFAlbaranes: TDBGridFind2000;
     TBFiltro: TLFToolBar;
     TButtDesmarca: TToolButton;
     ToolButton1: TToolButton;
     PNLProv: TLFPanel;
     LBLSerie: TLFLabel;
     CBSeries: TLFComboBox;
     LBLProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     PNLFecha: TLFPanel;
     LBLFechaCon: TLFLabel;
     DTPFechaCon: TLFDateEdit;
     DTPHora: TDateTimePicker;
     EFCanales: TLFEditFind2000;
     PNLSeleccionDestino: TLFPanel;
     LCanalDestino: TLFLabel;
     ECanalDestino: TLFEdit;
     ETituloProveedor: TLFEdit;
     PNTotal: TLFPanel;
     LTotalFactura: TLFLabel;
     RETotalFactura: THYGRightEdit;
     PNLDetalle: TLFPanel;
     TBSep: TLFToolBar;
     TButtSep5: TToolButton;
     TButtSep2: TToolButton;
     PNLFiltros: TLFPanel;
     LSerieDestino: TLFLabel;
     EFSerieDestino: TLFEditFind2000;
     ESerieDestino: TLFEdit;
     PnlFechaFactura: TLFPanel;
     DTPHoraFactura: TDateTimePicker;
     DTPFechaFactura: TLFDateEdit;
     LFechaFactura: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtMarcarTodasClick(Sender: TObject);
     procedure TButtFacturarClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure TButtDesmarcaClick(Sender: TObject);
     procedure EFCanalesChange(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure DBGFAlbaranesDblClick(Sender: TObject);
     procedure DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFSerieDestinoChange(Sender: TObject);
     procedure EFSerieDestinoBusqueda(Sender: TObject);
  private
     { Private declarations }
     Serie: string;
  public
     { Public declarations }
     procedure Importe(importe: string);
  end;

var
  FMFacturaAlbaranesProv : TFMFacturaAlbaranesProv;

implementation

uses UDMFacturaAlbaranesProv, UDMMain, UEntorno, UUtiles, UFMain, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMFacturaAlbaranesProv.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMFacturaAlbaranesProv, DMFacturaAlbaranesProv);
  DBGFAlbaranes.ColumnasChecked.Strings[DBGFAlbaranes.ColumnasCheckBoxes.IndexOf('ENTRADA_FACTURACION')] :=
     IntToStr(REntorno.Entrada);
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  CBSeriesChange(Self);
  EFCanales.Text := IntToStr(REntorno.Canal);
  DTPFechaCon.Date := REntorno.FechaTrab;
  DTPHora.Time := Time;
  DTPFechaFactura.Date := REntorno.FechaTrab;
  DTPHoraFactura.Time := Time;
end;

procedure TFMFacturaAlbaranesProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFacturaAlbaranesProv);
end;

procedure TFMFacturaAlbaranesProv.TButtMarcarTodasClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMFacturaAlbaranesProv.MarcarAlbaranes(StrToIntDef(EFProveedor.Text, 0), Serie, 1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMFacturaAlbaranesProv.TButtFacturarClick(Sender: TObject);
var
  FechaContabilizacion, FechaFactura : TDateTime;
begin
  if Confirma then
  begin
     try
        Screen.Cursor := crHourGlass;
        FechaContabilizacion := Trunc(DTPFechaCon.Date) + Frac(DTPHora.DateTime);
        FechaFactura := Trunc(DTPFechaFactura.Date) + Frac(DTPHoraFactura.DateTime);
        DMFacturaAlbaranesProv.FacturaAlbaranes(StrToIntDef(EFProveedor.Text, 0), StrToIntDef(EFCanales.Text, REntorno.Canal), FechaFactura, FechaContabilizacion, Serie, EFSerieDestino.Text);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMFacturaAlbaranesProv.EFProveedorChange(Sender: TObject);
begin
  if (Serie > '') then
  begin
     ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
     DMFacturaAlbaranesProv.FiltrarAlbaranes(StrToIntDef(EFProveedor.Text, 0), Serie);
  end;
end;

procedure TFMFacturaAlbaranesProv.CBSeriesChange(Sender: TObject);
begin
  if (CBSeries.Text <> '') then
  begin
     if (CBSeries.Text = _('Todas las Series')) then
        Serie := ' '
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSeries.Items[CBSeries.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;

     DMFacturaAlbaranesProv.FiltrarAlbaranes(StrToIntDef(EFProveedor.Text, 0), Serie);
  end;
end;

procedure TFMFacturaAlbaranesProv.TButtDesmarcaClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMFacturaAlbaranesProv.MarcarAlbaranes(StrToIntDef(EFProveedor.Text, 0), Serie, 0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMFacturaAlbaranesProv.EFCanalesChange(Sender: TObject);
begin
  ECanalDestino.Text := DameTituloCanal(StrToIntDef(EFCanales.Text, REntorno.Canal));
end;

procedure TFMFacturaAlbaranesProv.TButtRegeneraClick(Sender: TObject);
begin
  EFProveedorChange(Sender);
end;

procedure TFMFacturaAlbaranesProv.Importe(importe: string);
begin
  RETotalFactura.Text := Importe;
end;

procedure TFMFacturaAlbaranesProv.DBGFAlbaranesDblClick(Sender: TObject);
begin
  FMain.TraspasoDeDocumentosEntrada(DMFacturaAlbaranesProv.QMAlbaranesID_E.AsInteger);
end;

procedure TFMFacturaAlbaranesProv.DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if ((UpperCase(Column.FieldName) = 'EJERCICIO') or
     (UpperCase(Column.FieldName) = 'SERIE') or
     (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

procedure TFMFacturaAlbaranesProv.EFSerieDestinoChange(Sender: TObject);
begin
  ESerieDestino.Text := DameTituloSerie(EFSerieDestino.Text);
end;

procedure TFMFacturaAlbaranesProv.EFSerieDestinoBusqueda(Sender: TObject);
begin
  EFSerieDestino.CondicionBusqueda := 'CANAL=' + EFCanales.Text;
end;

end.
