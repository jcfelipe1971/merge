unit UFMColoresTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, DB, StdCtrls, Mask, DBCtrls, UDMMaestrosTallas, ULFFormStorage,
  ActnList, ULFActionList, ULFToolBar, UG2kTBLoc, ULFPageControl, ULFPanel,
  ULFDBEdit, ULFLabel, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, ULFEdit, UFPEditDetalle;

type
  TFMColoresTallas = class(TFPEditDetalle)
     DSart_colores: TDataSource;
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LCodigo: TLFLabel;
     LTitulo: TLFLabel;
     LTipoColor: TLFLabel;
     DBEFTipoColor: TLFDBEditFind2000;
     DBETituloTipo: TLFDbedit;
     DSArtColorEmpresa: TDataSource;
     EImagenTitulo: TLFEdit;
     LImagen: TLFLabel;
     BCargarImagen: TButton;
     BClipboard: TButton;
     Imagen: TImage;
     DBEFImagen: TLFDBEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure BCargarImagenClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
     dm: TDMMaestrosTallas;
  public
     { Public declarations }
  end;

var
  FMColoresTallas : TFMColoresTallas;

implementation

uses UFormGest, uFBusca, UDMMain, uUtiles, UDameDato, UImagenes;

{$R *.dfm}

procedure TFMColoresTallas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreDataVarias(TDMMaestrosTallas, dm, Self);
  DSart_colores.DataSet := dm.QMart_colores;
  DSArtColorEmpresa.DataSet := dm.QMArtColorEmpresa;
  G2KTableLoc.DataSource := DSart_colores;
  dm.QMart_colores.Open;

  // Color campo ID
  ColorCampoID(DBECodigo);
end;

procedure TFMColoresTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(dm);
end;

procedure TFMColoresTallas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  TFBusca.Create(Self).SeleccionaBusqueda(CEMain, dm.QMart_colores, '00000');
end;

procedure TFMColoresTallas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMColoresTallas.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  dm.QMart_coloresimagen.AsInteger := ImportarImagen('');
end;

procedure TFMColoresTallas.BClipboardClick(Sender: TObject);
begin
  inherited;
  dm.QMart_coloresimagen.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMColoresTallas.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  EImagenTitulo.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMColoresTallas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

end.
