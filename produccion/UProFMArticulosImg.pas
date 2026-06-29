unit UProFMArticulosImg;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, ExtCtrls, dbcgrids,
  ULFDBCtrlGrid, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar,
  UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin,
  ULFPanel, ULFLabel, ULFEdit;

type
  TProFMArticulosImg = class(TFPEdit)
     DBCtrlGridArtImg: TLFDBCtrlGrid;
     Image: TImage;
     DBEArticulo: TLFDbedit;
     LFToolBar1: TLFToolBar;
     PInfoImagenes: TLFPanel;
     DBEArtImagen: TLFDbedit;
     DBETitImagenes: TLFDbedit;
     EFilas: TLFEdit;
     EColumnas: TLFEdit;
     LblFilas: TLFLabel;
     LblColumnas: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NumImagenesChange(Sender: TObject);
     procedure DBCtrlGridArtImgPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
  private
     { Private declarations }
     procedure AbrirArchivo(const Filename: string);
  public
     { Public declarations }
     procedure FiltrarArticulo(const Articulo: string);
  end;

var
  ProFMArticulosImg : TProFMArticulosImg;

implementation

uses UProDMArticulosImg, UFormGest, UDMMain, UEntorno;

{$R *.dfm}

procedure TProFMArticulosImg.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMArticulosImg, ProDMArticulosImg);
  NavMain.DataSource := ProDMArticulosImg.DSQMVerArticulos;
  DBGMain.DataSource := ProDMArticulosImg.DSQMVerArticulos;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  G2KTableLoc.Base_de_datos := DMMain.DataBase;
  G2KTableLoc.DataSource := ProDMArticulosImg.DSQMVerArticulos;
  G2KTableLoc.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TProFMArticulosImg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMArticulosImg);
end;

procedure TProFMArticulosImg.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.DataSource := ProDMArticulosImg.DSQMVerArticulos;
  G2KTableLoc.Click;
end;

procedure TProFMArticulosImg.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMArticulosImg.BusquedaCompleja;
end;

procedure TProFMArticulosImg.NumImagenesChange(Sender: TObject);
begin
  inherited;
  DBCtrlGridArtImg.ColCount := StrToIntDef(EColumnas.Text, 3);
  DBCtrlGridArtImg.RowCount := StrToIntDef(EFilas.Text, 2);
end;

procedure TProFMArticulosImg.DBCtrlGridArtImgPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
begin
  inherited;
  AbrirArchivo(ProDMArticulosImg.LstArticulos.FieldByName('Imagen').AsString);
  DBEArticulo.Width := DBCtrlGridArtImg.panelwidth - 20;
  Image.Width := DBCtrlGridArtImg.panelwidth - 20;
  Image.Height := DBCtrlGridArtImg.PanelHeight - 35;
end;

procedure TProFMArticulosImg.AbrirArchivo(const Filename: string);
begin
  try
     Image.Picture.LoadFromFile(Filename);
  except
     on EInvalidGraphic do
     begin
        Image.Picture.Graphic := nil;
        MessageDlg(_('Formato de imagen no aceptado'), mtError, [mbOK], 0);
     end;
     on EFOpenError do
     begin
        Image.Picture.Graphic := nil;
     end;
  end;
end;

procedure TProFMArticulosImg.FiltrarArticulo(const Articulo: string);
begin
  ProDMArticulosImg.FiltrarArticulo(Articulo);
end;

end.
