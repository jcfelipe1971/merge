unit UFMDGIIConfEnvio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit;

type
  TFMDGIIConfEnvio = class(TFPEdit)
     LToken: TLabel;
     LUrlBase: TLabel;
     LIdCompany: TLabel;
     DBEToken: TLFDbedit;
     DBEUrlBase: TLFDbedit;
     CBEIdCompany: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMDGIIConfEnvio : TFMDGIIConfEnvio;

implementation

uses
  UDMDGIIConfEnvio, UFormGest;

{$R *.dfm}

procedure TFMDGIIConfEnvio.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDGIIConfEnvio, DMDGIIConfEnvio);
  NavMain.DataSource := DMDGIIConfEnvio.DSQMDgiiConfiguracion;
  DBGMain.DataSource := DMDGIIConfEnvio.DSQMDgiiConfiguracion;
  G2kTableLoc.DataSource := DMDGIIConfEnvio.DSQMDgiiConfiguracion;
end;

procedure TFMDGIIConfEnvio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDGIIConfEnvio);
end;

end.
