unit UProFMFicherosCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  OleCtrls, SHDocVw, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, StdCtrls, ULFLabel,
  ULFEdit, ULFDBCheckBox, Mask, DBCtrls, Buttons, ExtDlgs, FileCtrl,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdMessage, IdExplicitTLSClientServerBase, IdSMTPBase;

type
  TProFMFicherosCliente = class(TFPEdit)
     DBGridFicheros: TDBGridFind2000;
     PNLNavegador: TLFPanel;
     Navegador: TWebBrowser;
     LFVerFichero: TLFDBCheckBox;
     SBImagen: TSpeedButton;
     LFFichero: TLFEdit;
     IdMessage1: TIdMessage;
     IdSMTP1: TIdSMTP;
     BGuardar: TToolButton;
     PNLSeleccion: TLFPanel;
     LRutaFicheros: TLabel;
     PNLVerArchivo: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFVerFicheroChange(Sender: TObject);
     procedure SBImagenClick(Sender: TObject);
     procedure BGuardarClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormResize(Sender: TObject);
  private
     { Private declarations }
     MiHeight: integer;
     MiWidth: integer;
     procedure Estado(opcion: string);
  public
     { Public declarations }
     procedure Filtra(Clave, Tablas, Procedencia: string; aCaption: string = '');
     procedure CargaFichero;
     procedure Navegar(Archivo: string);
     procedure CargaModo(Insertar: boolean);
  end;

var
  ProFMFicherosCliente : TProFMFicherosCliente;

implementation

uses UDMMain, UProDMFicherosCliente, UEntorno, UFMain, UFormGest, UUtiles;

{$R *.dfm}

procedure TProFMFicherosCliente.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMFicherosCliente, ProDMFicherosCliente);
  NavMain.DataSource := ProDMFicherosCliente.DSFicheros;
  DBGridFicheros.DataSource := ProDMFicherosCliente.DSFicheros;
  Estado('Normal');
  LFVerFichero.State := cbUnchecked;

  // Modifico propiedades heredadas de FPEdit
  // No quiero ver la pagina Tabla del PageControl
  TSTabla.TabVisible := False;
  // El Panel principal debe estar habilitado
  PEdit.Enabled := True;
  MiHeight := Self.Height;
  MiWidth := Self.Width;
  LRutaFicheros.Caption := _('Ruta Ficheros') + ': ' + REntorno.RutaFicheros;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SBImagen, 1, DMMain.ILMain_Ac, 49);
end;

procedure TProFMFicherosCliente.Filtra(Clave, Tablas, Procedencia: string; aCaption: string = '');
begin
  ProDMFicherosCliente.Filtra(Clave, Tablas, Procedencia);
  if (aCaption <> '') then
     Self.Caption := aCaption;
end;

procedure TProFMFicherosCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(ProDMFicherosCliente);
end;

procedure TProFMFicherosCliente.LFVerFicheroChange(Sender: TObject);
begin
  inherited;
  if (LFVerFichero.Checked = True) then
     Estado('Max')
  else
     Estado('Normal');

  ProDMFicherosCliente.CargarImagen;
end;

procedure TProFMFicherosCliente.SBImagenClick(Sender: TObject);
begin
  inherited;
  CargaFichero;
end;

procedure TProFMFicherosCliente.CargaFichero;
var
  Archivo : string;
begin
  if MyOpenDialog(Archivo, 'ALL,TXT,XLS,ODS,CSV,DOC,ODT,PDF,XML,ZIP', '', 'ProFMFicherosCliente-CargaFichero') then
     LFFichero.Text := Archivo;
end;

procedure TProFMFicherosCliente.Estado(Opcion: string);
begin
  if (Opcion = 'Max') then
  begin
     WindowState := wsMaximized;
     PNLNavegador.Visible := True;
     PNLNavegador.Width := PCMain.Width div 2;
     Refresh;
  end
  else
  begin
     PNLNavegador.Visible := False;
     WindowState := wsNormal;
     Self.Height := MiHeight;
     Self.Width := MiWidth;
  end;
end;

procedure TProFMFicherosCliente.BGuardarClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;

  Archivo := ProDMFicherosCliente.xFicherosNOMBRE.AsString;
  if MySaveDialog(Archivo, 'ALL,TXT,XLS,ODS,CSV,DOC,ODT,PDF,XML,ZIP', '', 'ProFMFicherosCliente') then
     ProDMFicherosCliente.GuardaFichero(Archivo);
end;

procedure TProFMFicherosCliente.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMFicherosCliente.BusquedaCompleja;
end;

procedure TProFMFicherosCliente.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMFicherosCliente.Navegar(Archivo: string);
begin
  if (PNLNavegador.Visible) then
  begin
     if ((LFVerFichero.Checked) and (Archivo <> '')) then
        Navegador.Navigate(Archivo)
     else
        Navegador.Navigate('about:blank');
  end;
end;

procedure TProFMFicherosCliente.CargaModo(Insertar: boolean);
begin
  if (Insertar) then
  begin
     LFFichero.Visible := True;
     SBImagen.Visible := True;
     LFVerFichero.Visible := False;
  end
  else
  begin
     LFFichero.Visible := False;
     SBImagen.Visible := False;
     LFVerFichero.Visible := True;
  end;
end;

procedure TProFMFicherosCliente.FormResize(Sender: TObject);
begin
  inherited;
  if (not (WindowState = wsMaximized)) then
     PNLNavegador.Visible := False;
end;

end.
