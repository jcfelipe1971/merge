unit UProFMCarpetas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, DBCtrls, ULFDBEdit, StdCtrls, Mask,
  rxToolEdit, ULFLabel;

type
  TProFMCarpetas = class(TFPEdit)
     PanelMain: TLFPanel;
     LLinea: TLFLabel;
     LDescripcion: TLFLabel;
     LRuta: TLFLabel;
     Ruta: TDirectoryEdit;
     LFDBLinea: TLFDbedit;
     LFDDesc: TLFDbedit;
     TBAbrir: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure RutaAfterDialog(Sender: TObject; var Name: string; var Action: boolean);
     procedure TBAbrirClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Posicionar(id: integer; tipo: string);
  end;

var
  ProFMCarpetas : TProFMCarpetas;

implementation

uses UProDMCarpetas, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMCarpetas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMCarpetas, ProDMCarpetas);
  NavMain.DataSource := ProDMCarpetas.DSCarpetas;
  DBGMain.DataSource := ProDMCarpetas.DSCarpetas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TProFMCarpetas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMCarpetas);
end;

procedure TProFMCarpetas.RutaAfterDialog(Sender: TObject; var Name: string; var Action: boolean);
begin
  inherited;
  ProDMCarpetas.QMCarpetasRUTA.AsString := Name;
end;

procedure TProFMCarpetas.TBAbrirClick(Sender: TObject);
begin
  inherited;
  DMMain.AbrirArchivo(Trim(Ruta.Text));
end;

procedure TProFMCarpetas.Posicionar(id: integer; tipo: string);
begin
  ProDMCarpetas.ObrirTaula(id, tipo);
end;

end.
