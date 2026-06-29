unit UFMDetalleDeLinea;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UNavigator, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, UDBDateTimePicker, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  ULFPageControl, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFDBMemo, ULFEdit, UFIBDBEditfind, ULFFIBDBEditFind;

type
  TFMDetalleDeLinea = class(TFPEditSinNavegador)
     ToolButton1: TToolButton;
     NavDetalleDeLinea: THYMNavigator;
     LReferencia: TLFLabel;
     DBEReferencia: TLFDbedit;
     LSoporte: TLFLabel;
     DBESoporte: TLFDbedit;
     LAreaVisible: TLFLabel;
     DBEAltoAreaVisible: TLFDbedit;
     LMedidaTotal: TLFLabel;
     DBEAltoMedidaTotal: TLFDbedit;
     LUnidades: TLFLabel;
     DBEUnidades: TLFDbedit;
     LAcabado: TLFLabel;
     DBEAcabado: TLFDbedit;
     LEmbalaje: TLFLabel;
     DBEEmbalaje: TLFDbedit;
     LEntregaAAFF: TLFLabel;
     LFechaInstalacion: TLFLabel;
     LLugarInstalacion: TLFLabel;
     DBELugarInstalacion: TLFDbedit;
     DBDEFechaInstalacion: TLFDBDateEdit;
     DBDEHoraInstalacion: TDBDateTimePicker;
     DBEEntregaAAFF: TLFDBDateEdit;
     DBEHoraEntregaAAFF: TDBDateTimePicker;
     DBEAnchoAreaVisible: TLFDbedit;
     DBEAnchoMedidaTotal: TLFDbedit;
     DBCBFechaEntregaPendiente: TLFDBCheckBox;
     DBCBFechaInstalacionPendiente: TLFDBCheckBox;
     DBCBHoraInstalacionPendiente: TLFDBCheckBox;
     LExplicacionUnidades: TLFLabel;
     LPrecio: TLFLabel;
     DBEPrecio: TLFDbedit;
     PCMain: TLFPageControl;
     TEDetalleEntrega: TTabSheet;
     PNLEntrega: TLFPanel;
     TSRecepcion: TTabSheet;
     LMarca: TLFLabel;
     LModelo: TLFLabel;
     LBastidor: TLFLabel;
     LFechaPeticion: TLFLabel;
     LTransportista: TLFLabel;
     LFechaPrevista: TLFLabel;
     LComentarioFechaPrevista: TLFLabel;
     LFechaRecepcion: TLFLabel;
     LComentarioRecepcion: TLFLabel;
     LNotas: TLFLabel;
     LImagen: TLFLabel;
     DBEFMarca: TLFFibDBEditFind;
     DBEFModelo: TLFFibDBEditFind;
     DBEFTransportista: TLFFibDBEditFind;
     EMarca: TLFEdit;
     EModelo: TLFEdit;
     DBMNotas: TLFDBMemo;
     DBDEFechaRecogida: TLFDBDateEdit;
     DBDEFechaPrevista: TLFDBDateEdit;
     DBEBastidor: TLFDbedit;
     DBEComentarioFechaPrevista: TLFDbedit;
     DBEComentarioRecepcion: TLFDbedit;
     DBDEFechaRecepcion: TLFDBDateEdit;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     PNLRecepcion: TLFPanel;
     ETransportista: TLFEdit;
     BCrearMarca: TButton;
     BCrearModelo: TButton;
     BClipboard: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEMedidaTotalChange(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure DBEFModeloBusqueda(Sender: TObject);
     procedure BCrearMarcaClick(Sender: TObject);
     procedure BCrearModeloClick(Sender: TObject);
     procedure DBEFMarcaChange(Sender: TObject);
     procedure DBEFModeloChange(Sender: TObject);
     procedure DBEFTransportistaChange(Sender: TObject);
     procedure NavDetalleDeLineaClick(Sender: TObject; Button: TNavigateBtn);
     procedure BClipboardClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(IdDetallesS: integer);
  end;

var
  FMDetalleDeLinea : TFMDetalleDeLinea;

implementation

uses UDMDetalleDeLinea, UFormGest, UDMMain, UFMain, UDameDato, UImagenes;

{$R *.dfm}

procedure TFMDetalleDeLinea.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDetalleDeLinea, DMDetalleDeLinea);
end;

procedure TFMDetalleDeLinea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDetalleDeLinea);
end;

procedure TFMDetalleDeLinea.Muestra(IdDetallesS: integer);
begin
  DMDetalleDeLinea.CreaRegistro(IdDetallesS);
  ShowModal;
end;

procedure TFMDetalleDeLinea.DBEMedidaTotalChange(Sender: TObject);
var
  Alto, Ancho : double;
begin
  inherited;
  Alto := StrToFloatDef(DBEAltoMedidaTotal.Text, 0);
  Ancho := StrToFloatDef(DBEAnchoMedidaTotal.Text, 0);
  if ((Alto <> 0) and (Ancho <> 0)) then
     DMDetalleDeLinea.QMDetalleUNIDADES.AsFloat := Alto * Ancho;
end;

procedure TFMDetalleDeLinea.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMDetalleDeLinea.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMDetalleDeLinea.QMDetalleIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMDetalleDeLinea.DBEFModeloBusqueda(Sender: TObject);
begin
  inherited;
  DBEFModelo.CondicionBusqueda := 'ID_MARCA=' + IntToStr(StrToIntDef(DBEFMarca.Text, 0));
end;

procedure TFMDetalleDeLinea.BCrearMarcaClick(Sender: TObject);
begin
  inherited;
  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.AMarcas);
  {$ENDIF}
end;

procedure TFMDetalleDeLinea.BCrearModeloClick(Sender: TObject);
begin
  inherited;
  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.AMarcas);
  {$ENDIF}
end;

procedure TFMDetalleDeLinea.DBEFMarcaChange(Sender: TObject);
begin
  inherited;
  EMarca.Text := DameTituloMarca(StrToIntDef(DBEFMarca.Text, 0));
end;

procedure TFMDetalleDeLinea.DBEFModeloChange(Sender: TObject);
begin
  inherited;
  EModelo.Text := DameTituloModelo(StrToIntDef(DBEFModelo.Text, 0));
end;

procedure TFMDetalleDeLinea.DBEFTransportistaChange(Sender: TObject);
begin
  inherited;
  ETransportista.Text := DameTituloAcreedor(StrToIntDef(DBEFTransportista.Text, 0));
end;

procedure TFMDetalleDeLinea.NavDetalleDeLineaClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMDetalleDeLinea.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMDetalleDeLinea.QMDetalleIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

end.
