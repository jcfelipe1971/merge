unit UFMMarca;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFDBMemo;

type
  TFMMarca = class(TFPEdit)
     LId: TLFLabel;
     DBEIdMarca: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTitulo: TLFLabel;
     LImagen: TLFLabel;
     DBEGaleria: TLFDbedit;
     LGaleria: TLFLabel;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     Imagen: TImage;
     BCargarImagen: TButton;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     LMarca: TLFLabel;
     DBEMarca: TLFDbedit;
     BClipboard: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure BCargarImagenClick(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure BClipboardClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMarca : TFMMarca;

implementation

uses UDMMain, UDMMarca, UFormGest, UDameDato, UImagenes;

{$R *.dfm}

procedure TFMMarca.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMarca, DMMarca);
  NavMain.DataSource := DMMarca.DSQMMarca;
  DBGMain.DataSource := DMMarca.DSQMMarca;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  RefrescarImagen(Imagen, DMMarca.QMMarcaIMAGEN.AsInteger);
end;

procedure TFMMarca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMarca);
end;

procedure TFMMarca.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMMarca.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMMarca.QMMarcaIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMMarca.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMMarca.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMMarca.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMMarca.QMMarcaIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

end.
