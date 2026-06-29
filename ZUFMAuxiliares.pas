unit ZUFMAuxiliares;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEditFind2000, ULFEdit;

type
  TZFMAuxiliares = class(TFPEdit)
     LblTipo: TLFLabel;
     LblDescripcion: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     PnlTipo: TLFPanel;
     LTipo: TLFLabel;
     EFTipo: TLFEditFind2000;
     DBEDescTipo: TLFDbedit;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     BCargarImagen: TButton;
     BClipboard: TButton;
     Imagen: TImage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTipoChange(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMAuxiliares : TZFMAuxiliares;

implementation

uses ZUDMAuxiliares, UFormGest, UDMMain, UDameDato, UImagenes;

{$R *.dfm}

procedure TZFMAuxiliares.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMAuxiliares, ZDMAuxiliares);

  NavMain.DataSource := ZDMAuxiliares.DSQMAuxiliares;
  DBGMain.DataSource := ZDMAuxiliares.DSQMAuxiliares;
  G2kTableLoc.DataSource := ZDMAuxiliares.DSQMAuxiliares;
end;

procedure TZFMAuxiliares.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMAuxiliares);
end;

procedure TZFMAuxiliares.EFTipoChange(Sender: TObject);
begin
  inherited;
  ZDMAuxiliares.BuscaTipo(EFTipo.Text);
  G2kTableLoc.CondicionBusqueda := 'TIPO_AUX=''' + EFTipo.Text + '''';
end;

procedure TZFMAuxiliares.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TZFMAuxiliares.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ZDMAuxiliares.QMAuxiliaresIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TZFMAuxiliares.BClipboardClick(Sender: TObject);
begin
  inherited;
  ZDMAuxiliares.QMAuxiliaresIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TZFMAuxiliares.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TZFMAuxiliares.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
