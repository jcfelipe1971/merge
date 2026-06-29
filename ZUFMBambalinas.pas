unit ZUFMBambalinas;

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
  TZFMBambalinas = class(TFPEdit)
     LblCodigo: TLFLabel;
     LblDescripcion: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LblImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     BCargarImagen: TButton;
     BClipboard: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure BClipboardClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMBambalinas : TZFMBambalinas;

implementation

uses ZUDMBambalinas, UFormGest, UDMMain, UDameDato, UImagenes;

{$R *.dfm}

procedure TZFMBambalinas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMBambalinas, ZDMBambalinas);
  RefrescarImagen(Imagen, ZDMBambalinas.QMBambalinasIMAGEN.AsInteger);
end;

procedure TZFMBambalinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMBambalinas);
end;

procedure TZFMBambalinas.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TZFMBambalinas.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ZDMBambalinas.QMBambalinasIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TZFMBambalinas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TZFMBambalinas.BClipboardClick(Sender: TObject);
begin
  inherited;
  ZDMBambalinas.QMBambalinasIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

end.
