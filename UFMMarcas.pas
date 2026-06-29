unit UFMMarcas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBEdit, ULFEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMMarcas = class(TFPEdit)
     LMarca: TLFLabel;
     DBEMarca: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDBEdit;
     TSModelos: TTabSheet;
     DBGModelos: THYTDBGrid;
     LImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     PNLModelos: TLFPanel;
     BClipboard: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure BClipboardClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMarcas : TFMMarcas;

implementation

uses UDMMarcas, UFormGest, UDMMain, uUtiles, UDameDato, UImagenes;

{$R *.DFM}

procedure TFMMarcas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMarcas, DMMarcas);
  NavMain.DataSource := DMMarcas.DSQMMarcas;
  DBGMain.DataSource := DMMarcas.DSQMMarcas;
  G2kTableLoc.DataSource := DMMarcas.DSQMMarcas;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  // Color campo ID
  ColorCampoID(DBEMarca);
end;

procedure TFMMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMarcas);
end;

procedure TFMMarcas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMMarcas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMMarcas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMMarcas.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMMarcas.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMMarcas.QMMarcasID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMMarcas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMMarcas.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMMarcas.QMMarcasID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

end.
