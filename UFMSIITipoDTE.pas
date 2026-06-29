unit UFMSIITipoDTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UFormGest;

type
  TFMSIITipoDTE = class(TFPEditSimple)
     DBGTipoDTE: TFIBHYGGridFind;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSIITipoDTE : TFMSIITipoDTE;

implementation

uses
  UDMSIITipoDTE, UDMMain;

{$R *.dfm}

procedure TFMSIITipoDTE.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSIITipoDTE, DMSIITipoDTE);
end;

procedure TFMSIITipoDTE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSIITipoDTE);
end;

end.
