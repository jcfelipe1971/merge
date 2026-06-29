unit UFMClaseDir;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, ULFDBEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  NsDBGrid, ULFToolBar, ULFPanel, ULFPageControl, ULFLabel, UG2kTBLoc;

type
  TFMClaseDir = class(TFPEdit)
     LBLClase: TLFLabel;
     DBEClase: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMClaseDir : TFMClaseDir;

implementation

uses UFormGest, UDMClaseDir, UDMMain;

{$R *.DFM}

procedure TFMClaseDir.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMClaseDir, DMClaseDir);
  NavMain.DataSource := DMClaseDir.DSQMClaseDir;
  DBGMain.DataSource := DMClaseDir.DSQMClaseDir;
  G2kTableLoc.DataSource := DMClaseDir.DSQMClaseDir;
end;

procedure TFMClaseDir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMClaseDir);
end;

procedure TFMClaseDir.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMClaseDir.BusquedaCompleja;
  Continua := False;
end;

procedure TFMClaseDir.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
