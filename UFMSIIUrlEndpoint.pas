unit UFMSIIUrlEndpoint;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMSIIUrlEndpoint = class(TFPEdit)
     LTipo: TLFLabel;
     LUrl: TLFLabel;
     LPais: TLFLabel;
     DBEPais: TLFDbedit;
     DBETipo: TLFDbedit;
     DBEUrl: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSIIUrlEndpoint : TFMSIIUrlEndpoint;

implementation

uses
  UDMSIIUrlEndpoint, UFormGest;

{$R *.dfm}

procedure TFMSIIUrlEndpoint.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSIIUrlEndpoint, DMSIIUrlEndpoint);
  NavMain.DataSource := DMSIIUrlEndpoint.DSQMURLEndPoint;
  DBGMain.DataSource := DMSIIUrlEndpoint.DSQMURLEndPoint;
  G2kTableLoc.DataSource := DMSIIUrlEndpoint.DSQMURLEndPoint;
end;

procedure TFMSIIUrlEndpoint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSIIUrlEndpoint);
end;

end.
