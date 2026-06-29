unit UFMGaleriaImagen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, dbcgrids, ULFDBCtrlGrid, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, ImgList, ExtDlgs;

type
  TFMGaleriaImagen = class(TFPEdit)
     LID: TLFLabel;
     LTitulo: TLFLabel;
     DBEId: TLFDbedit;
     DBETitulo: TLFDbedit;
     PNLGaleria: TLFPanel;
     LVGaleria: TListView;
     ToolButton1: TToolButton;
     TBDisminuirTamano: TToolButton;
     TBAumentarTamano: TToolButton;
     AL: TLFActionList;
     AAumentarTamano: TAction;
     ADisminuirTamano: TAction;
     TBAgregarImagen: TToolButton;
     ToolButton3: TToolButton;
     AAgregarImagen: TAction;
     procedure FormCreate(Sender: TObject);
     procedure DBEIdChange(Sender: TObject);
     procedure AAumentarTamanoExecute(Sender: TObject);
     procedure ADisminuirTamanoExecute(Sender: TObject);
     procedure AAgregarImagenExecute(Sender: TObject);
     procedure LVGaleriaKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LVGaleriaDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure PosicionaGaleria(id: integer);
     procedure FiltraGaleria(Filtro: string);
  end;

var
  FMGaleriaImagen : TFMGaleriaImagen;

implementation

uses UDMGaleriaImagen, UDMMain, UFormGest, UFMostrarImagen;

{$R *.dfm}

procedure TFMGaleriaImagen.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMGaleriaImagen, DMGaleriaImagen);

  NavMain.DataSource := DMGaleriaImagen.DSQMGaleria;
  DBGMain.DataSource := DMGaleriaImagen.DSQMGaleria;
  G2KTableLoc.DataSource := DMGaleriaImagen.DSQMGaleria;
end;

procedure TFMGaleriaImagen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGaleriaImagen);
end;

procedure TFMGaleriaImagen.DBEIdChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEId.Text, 0) > 0) then
     DMGaleriaImagen.CargaImageList(LVGaleria);
end;

procedure TFMGaleriaImagen.AAumentarTamanoExecute(Sender: TObject);
begin
  inherited;
  DMGaleriaImagen.CambiarTamano(True);
  DMGaleriaImagen.CargaImageList(LVGaleria);
end;

procedure TFMGaleriaImagen.ADisminuirTamanoExecute(Sender: TObject);
begin
  inherited;
  DMGaleriaImagen.CambiarTamano(False);
  DMGaleriaImagen.CargaImageList(LVGaleria);
end;

procedure TFMGaleriaImagen.AAgregarImagenExecute(Sender: TObject);
begin
  inherited;
  DMGaleriaImagen.AgregarImagen;
  DMGaleriaImagen.CargaImageList(LVGaleria);
end;

procedure TFMGaleriaImagen.LVGaleriaKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DELETE) then
  begin
     DMGaleriaImagen.BorraImagen(integer(LVGaleria.Selected.Data));
     DMGaleriaImagen.CargaImageList(LVGaleria);
  end;
end;

procedure TFMGaleriaImagen.PosicionaGaleria(id: integer);
begin
  DMGaleriaImagen.PosicionaGaleria(id);
end;

procedure TFMGaleriaImagen.FiltraGaleria(Filtro: string);
begin
  DMGaleriaImagen.FiltraGaleria(Filtro);
end;

procedure TFMGaleriaImagen.LVGaleriaDblClick(Sender: TObject);
begin
  inherited;
  try
     MuestraImagen(integer(LVGaleria.Selected.Data));
  except
  end;
end;

end.
