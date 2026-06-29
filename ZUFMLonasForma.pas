unit ZUFMLonasForma;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEdit;

type
  TZFMLonasForma = class(TFPEdit)
     LblCodigo: TLFLabel;
     LblDescripcion: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LblImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFImagenChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMLonasForma : TZFMLonasForma;

implementation

uses ZUDMLonasForma, UFormGest, UDMMain, UDameDato, UImagenes;

{$R *.dfm}

procedure TZFMLonasForma.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMLonasForma, ZDMLonasForma);

  NavMain.DataSource := ZDMLonasForma.DSQMLonasForma;
  DBGMain.DataSource := ZDMLonasForma.DSQMLonasForma;
  G2kTableLoc.DataSource := ZDMLonasForma.DSQMLonasForma;
end;

procedure TZFMLonasForma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLonasForma);
end;

procedure TZFMLonasForma.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, ZDMLonasForma.QMLonasFormaIMAGEN.AsInteger);
  ETituloImagen.Text := DameTituloImagen(ZDMLonasForma.QMLonasFormaIMAGEN.AsInteger);
end;

procedure TZFMLonasForma.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
