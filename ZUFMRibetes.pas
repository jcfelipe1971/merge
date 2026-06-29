unit ZUFMRibetes;

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
  TZFMRibetes = class(TFPEdit)
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
  ZFMRibetes : TZFMRibetes;

implementation

uses ZUDMRibetes, UFormGest, UDMMain, UDameDato, UImagenes;

{$R *.dfm}

procedure TZFMRibetes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMRibetes, ZDMRibetes);

  NavMain.DataSource := ZDMRibetes.DSQMRibetes;
  DBGMain.DataSource := ZDMRibetes.DSQMRibetes;
  G2kTableLoc.DataSource := ZDMRibetes.DSQMRibetes;
end;

procedure TZFMRibetes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMRibetes);
end;

procedure TZFMRibetes.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, ZDMRibetes.QMRibetesIMAGEN.AsInteger);
  ETituloImagen.Text := DameTituloImagen(ZDMRibetes.QMRibetesIMAGEN.AsInteger);
end;

procedure TZFMRibetes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
