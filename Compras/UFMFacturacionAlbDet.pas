unit UFMFacturacionAlbDet;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UControlEdit, UFormGest,
  rxToolEdit, NsDBGrid, ULFPanel, ULFDBEdit, ULFToolBar, ULFEditFind2000,
  rxPlacemnt, ULFFormStorage, ULFLabel, ULFDateEdit, ULFEdit,
  UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas, UEditPanel;

type
  TFMFacturacionAlbDet = class(TFPEditSinNavegador)
     TButtSep3: TToolButton;
     TButtRegenera: TToolButton;
     TButtSep1: TToolButton;
     DBGFAlbaranes: TDBGridFind2000;
     TButtSep2: TToolButton;
     TButtLineasServidas: TToolButton;
     TButtLineasNoServidas: TToolButton;
     TButtSep5: TToolButton;
     TButtGenerarFactura: TToolButton;
     TBDetalle: TLFToolBar;
     PNLProv: TLFPanel;
     LSerie: TLFLabel;
     DBLCBSerie: TDBLookupComboBox;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     ETitProveedor: TLFEdit;
     PNLFechas: TLFPanel;
     LBLFechaCon: TLFLabel;
     DTPFechaCon: TLFDateEdit;
     DTPHora: TDateTimePicker;
     LBLSerieDestino: TLFLabel;
     DBLCBSerieD: TDBLookupComboBox;
     PNCanal: TLFPanel;
     EFCanales: TLFEditFind2000;
     ETitCanales: TLFEdit;
     LCanalDestino: TLFLabel;
     PNTotal: TLFPanel;
     LTotalFactura: TLFLabel;
     RETotalFactura: THYGRightEdit;
     TButtSep6: TToolButton;
     TBAsignaUnidadesAFacturar: TToolButton;
     TBQuitaUnidadesAFacturar: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFProveedorExiste(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure TButtLineasServidasClick(Sender: TObject);
     procedure TButtLineasNoServidasClick(Sender: TObject);
     procedure TButtGenerarFacturaClick(Sender: TObject);
     procedure DBLCBSerieClick(Sender: TObject);
     procedure EFCanalesChange(Sender: TObject);
     procedure DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFAlbaranesDblClick(Sender: TObject);
     procedure TBAsignaUnidadesAFacturarClick(Sender: TObject);
     procedure TBQuitaUnidadesAFacturarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Importe(Importe: string);
  end;

var
  FMFacturacionAlbDet : TFMFacturacionAlbDet;

implementation

uses UDMFacturacionAlbDet, UDMMain, UEntorno, UUtiles, UFMain, UDameDato;

{$R *.DFM}

procedure TFMFacturacionAlbDet.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMFacturacionAlbDet, DMFacturacionAlbDet);
  DBGFAlbaranes.ColumnasChecked.Strings[DBGFAlbaranes.ColumnasCheckBoxes.IndexOf('ENTRADA_FACTURACION')] :=
     IntToStr(REntorno.Entrada);
  DBLCBSerie.KeyValue := REntorno.Serie;
  DBLCBSerieD.KeyValue := REntorno.Serie;
  DTPFechaCon.Date := REntorno.FechaTrab;
  DTPHora.Time := Time;
  EFCanales.Text := IntToStr(REntorno.Canal);

  { TODO : El calculo debe tener en cuenta las unidades seleccionadas de cada linea }
  PNTotal.Visible := False;
end;

procedure TFMFacturacionAlbDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFacturacionAlbDet);
end;

procedure TFMFacturacionAlbDet.EFProveedorExiste(Sender: TObject);
var
  Proveedor : integer;
begin
  Proveedor := StrToIntDef(EFProveedor.Text, 0);
  ETitProveedor.Text := DameTituloProveedor(Proveedor);
  DMFacturacionAlbDet.FiltrarAlbaranes(Proveedor);
end;

procedure TFMFacturacionAlbDet.TButtRegeneraClick(Sender: TObject);
begin
  DMFacturacionAlbDet.RefrescarAlbaranes;
end;

procedure TFMFacturacionAlbDet.TButtLineasServidasClick(Sender: TObject);
begin
  DMFacturacionAlbDet.MostrarLineasServidas(True);
end;

procedure TFMFacturacionAlbDet.TButtLineasNoServidasClick(Sender: TObject);
begin
  DMFacturacionAlbDet.MostrarLineasServidas(False);
end;

procedure TFMFacturacionAlbDet.TButtGenerarFacturaClick(Sender: TObject);
begin
  DMFacturacionAlbDet.TraspasarAlbaranesAFactura(Trunc(DTPFechaCon.Date) + Frac(DTPHora.DateTime));
end;

procedure TFMFacturacionAlbDet.DBLCBSerieClick(Sender: TObject);
begin
  DBLCBSerieD.KeyValue := DBLCBSerie.KeyValue;
end;

procedure TFMFacturacionAlbDet.EFCanalesChange(Sender: TObject);
var
  Canal : integer;
begin
  Canal := StrToIntDef(EFCanales.Text, REntorno.Canal);
  ETitCanales.Text := DameTituloCanal(Canal);
  DMFActuracionAlbDet.SetCanalDestino(Canal);
end;

procedure TFMFacturacionAlbDet.Importe(Importe: string);
begin
  RETotalFactura.Text := Importe;
end;

procedure TFMFacturacionAlbDet.DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if ((UpperCase(Column.FieldName) = 'EJERCICIO') or
     (UpperCase(Column.FieldName) = 'SERIE') or
     (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

procedure TFMFacturacionAlbDet.DBGFAlbaranesDblClick(Sender: TObject);
begin
  FMain.TraspasoDeDocumentosEntrada(DMFActuracionAlbDet.QMDetalleID_E.AsInteger);
end;

procedure TFMFacturacionAlbDet.TBAsignaUnidadesAFacturarClick(Sender: TObject);
begin
  inherited;
  DMFacturacionAlbDet.AsignaUnidadesAFacturar;
end;

procedure TFMFacturacionAlbDet.TBQuitaUnidadesAFacturarClick(Sender: TObject);
begin
  inherited;
  DMFacturacionAlbDet.QuitaUnidadesAFacturar;
end;

end.
