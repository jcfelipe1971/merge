unit UFMGamaPrecioReposicion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMGamaPrecioReposicion = class(TFPEdit)
     LGama: TLFLabel;
     LTitulo: TLFLabel;
     LDescuento: TLFLabel;
     LIncremento: TLFLabel;
     DBEGama: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEDescuento: TLFDbedit;
     DBEIncremento: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGamaPrecioReposicion : TFMGamaPrecioReposicion;

implementation

uses
  UDMMain, UDMGamaPrecioReposicion, UFormGest;

{$R *.dfm}

procedure TFMGamaPrecioReposicion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGamaPrecioReposicion, DMGamaPrecioReposicion);
  NavMain.DataSource := DMGamaPrecioReposicion.DSxGamas;
  DBGMain.DataSource := DMGamaPrecioReposicion.DSxGamas;
end;

procedure TFMGamaPrecioReposicion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGamaPrecioReposicion);
end;

procedure TFMGamaPrecioReposicion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
