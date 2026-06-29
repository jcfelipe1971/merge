unit UFPEditSimple;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, UFPEditSinNavegador;

type
  TFPEditSimple = class(TFPEditSinNavegador)
     NavMain: THYMNavigator;
     TSepNav: TToolButton;
     TSepTerc: TToolButton;
     TbuttComp: TToolButton;
     procedure FormActivate(Sender: TObject);
     procedure FormShow(Sender: TObject);
  end;

var
  FPEditSimple : TFPEditSimple;

implementation

uses UDMMain, UFMain, UEntorno;

{$R *.DFM}

{published}

procedure TFPEditSimple.FormActivate(Sender: TObject);
begin
  inherited;

  NavMain.Left := 0;
  TSepNav.Left := NavMain.Width;
  EPMain.Left := TSepNav.Left + TSepNav.Width;
  TSepTerc.Left := EPMain.Left + EPMain.Width;
  TbuttComp.Left := TSepTerc.Left + TSepTerc.Width;
end;

procedure TFPEditSimple.FormShow(Sender: TObject);
begin
  inherited;

  NavMain.Left := 0;
  TSepNav.Left := NavMain.Width;
  EPMain.Left := TSepNav.Left + TSepNav.Width;
  TSepTerc.Left := EPMain.Left + EPMain.Width;
  TbuttComp.Left := TSepTerc.Left + TSepTerc.Width;
end;

end.
