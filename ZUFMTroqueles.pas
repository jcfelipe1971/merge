unit ZUFMTroqueles;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, NsDBGrid, ULFPageControl, ULFToolBar, ULFPanel,
  ULFDBMemo, ULFDBEditFind2000, ULFDBEdit, UG2kTBLoc, ULFLabel,
  UHYDescription, ULFHYDBDescription, ULFFIBDBEditFind, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ShellApi, ULFEdit, Buttons;

type
  TZFMTroqueles = class(TFPEdit)
     LblTroquel: TLFLabel;
     DBETroquel: TLFDbedit;
     LblAncho: TLFLabel;
     DBEAncho: TLFDbedit;
     LblAvance: TLFLabel;
     DBEAvance: TLFDbedit;
     DBMMNotas: TLFDBMemo;
     LFCategoryAction2: TLFCategoryAction;
     ALstTroqueles: TAction;
     LNotas: TLFLabel;
     LF_Z: TLFLabel;
     DBEPos_Z: TLFDbedit;
     LFCBTroquelEsp: TLFDBCheckBox;
     LFDBOvalado: TLFDBCheckBox;
     TBPdf: TToolButton;
     TSep1: TToolButton;
     CEImagenes: TControlEdit;
     CEImagenesPMEdit: TPopUpTeclas;
     LFSVAvance: TLFLabel;
     DBESHAvance: TLFDbedit;
     LFSHAvance: TLFLabel;
     DBESHAncho: TLFDbedit;
     LFFigurasAncho: TLFLabel;
     DBESH_ANCHO: TLFDbedit;
     LFFigurasAvance: TLFLabel;
     DBESV_AVANCE: TLFDbedit;
     LFBanda: TLFLabel;
     DBEBanda: TLFDbedit;
     LblMaquina: TLFLabel;
     DBEFMaquina: TLFDBEditFind2000;
     EDescripcionMaquina: TLFEdit;
     LFForma: TLFLabel;
     DBEFForma: TLFDBEditFind2000;
     EDescripcionForma: TLFEdit;
     LFDBTrepado: TLFDBCheckBox;
     LFArticulo: TLFLabel;
     DBEFArticulo: TLFDBEditFind2000;
     EDescripcionArticulo: TLFEdit;
     LFUtillaje: TLFLabel;
     DBEFUtillaje: TLFDBEditFind2000;
     EDescripcionUtillaje: TLFEdit;
     SBAFiltraUtillaje: TSpeedButton;
     SBAFiltraArticulo: TSpeedButton;
     SBImagen: TScrollBox;
     Imagen: TImage;
     LFImagen: TLFLabel;
     DBEFImagen: TLFFibDBEditFind;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     BClipboard: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     // procedure AZLstTroquelesExecute(Sender: TObject);
     procedure ATroquelesExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFImagenChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TBPdfClick(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure DBEFMaquinaChange(Sender: TObject);
     procedure DBEFFormaChange(Sender: TObject);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure DBEFUtillajeChange(Sender: TObject);
     procedure SBAFiltraUtillajeDblClick(Sender: TObject);
     procedure SBAFiltraArticuloDblClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMTroqueles : TZFMTroqueles;

implementation

{$R *.DFM}

uses UDMMain, ZUDMTroqueles, UFormGest, UFmain, ZUDMLstTroqueles,
  ZUFMLstTroqueles, UDMFamilias, UUtiles, UDameDato, UEntorno, UImagenes;

procedure TZFMTroqueles.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMTroqueles, ZDMTroqueles);

  NavMain.DataSource := ZDMTroqueles.DSQMTroqueles;
  EPMain.DataSource := ZDMTroqueles.DSQMTroqueles;
  DBGMain.DataSource := ZDMTroqueles.DSQMTroqueles;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  G2KTableLoc.DataSource := ZDMTroqueles.DSQMTroqueles;

  SolapaControles(SBAFiltraArticulo, EDescripcionArticulo);
  EDescripcionArticulo.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAFiltraUtillaje, EDescripcionUtillaje);
  EDescripcionUtillaje.Color := REntorno.ColorEnlaceActivo;
end;

procedure TZFMTroqueles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMTroqueles);
end;

procedure TZFMTroqueles.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMTroqueles.BusquedaCompleja;
end;

procedure TZFMTroqueles.ATroquelesExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMLstTroqueles, ZFMLstTroqueles, Sender);
end;

procedure TZFMTroqueles.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TZFMTroqueles.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TZFMTroqueles.FormShow(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, ZDMTroqueles.QMTroquelesID_IMAGEN.AsInteger);
end;

procedure TZFMTroqueles.TBPdfClick(Sender: TObject);
var
  Ruta : string;
begin
  inherited;
  Ruta := Trim(ZDMTroqueles.QMConstantesPATH_DOCUMENTOS.AsString);
  if (Ruta <> '') then
  begin
     // Creamos ruta completa con codigo de articulo
     Ruta := IncludeTrailingPathDelimiter(Ruta) + ZDMTroqueles.QMTroquelesTROQUEL.AsString + '.pdf';
     DMMain.AbrirArchivo(Ruta);
  end;
end;

procedure TZFMTroqueles.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ZDMTroqueles.QMTroquelesID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TZFMTroqueles.BClipboardClick(Sender: TObject);
begin
  inherited;
  ZDMTroqueles.QMTroquelesID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TZFMTroqueles.DBEFMaquinaChange(Sender: TObject);
begin
  inherited;
  EDescripcionMaquina.Text := DameTituloMaquina(StrToIntDef(DBEFMaquina.Text, 0));
end;

procedure TZFMTroqueles.DBEFFormaChange(Sender: TObject);
begin
  inherited;
  EDescripcionForma.Text := ZDMTroqueles.DameTituloForma(DBEFForma.Text);
end;

procedure TZFMTroqueles.DBEFArticuloChange(Sender: TObject);
begin
  inherited;
  EDescripcionArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
end;

procedure TZFMTroqueles.DBEFUtillajeChange(Sender: TObject);
begin
  inherited;
  EDescripcionUtillaje.Text := DameTituloUtillaje(DBEFUtillaje.Text);
end;

procedure TZFMTroqueles.SBAFiltraUtillajeDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProUtillajes, ZDMTroqueles.QMTroquelesUTILLAJE.AsString);
end;

procedure TZFMTroqueles.SBAFiltraArticuloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, format('ARTICULO = ''%s''', [ZDMTroqueles.QMTroquelesARTICULO.AsString]));
end;

procedure TZFMTroqueles.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

end.
