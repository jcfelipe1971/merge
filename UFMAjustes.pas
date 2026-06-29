unit UFMAjustes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, UEditPanel, ExtCtrls, UNavigator, Grids, DBGrids, ToolWin,
  UControlEdit, Menus, UTeclas, UFormGest, UHYDBGrid, NsDBGrid, ULFToolBar,
  rxPlacemnt, ULFFormStorage;

type
  TFMAjustes = class(TG2KForm)
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     EPAjustes: THYMEditPanel;
     TButtSep1: TToolButton;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     HYDBAjustes: THYTDBGrid;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAjustes : TFMAjustes;

implementation

uses UEntorno, UDMMain, UDMAjustes;

{$R *.DFM}

procedure TFMAjustes.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMAjustes, DMAjustes);
  ControlEdit := CEMain;
end;

procedure TFMAjustes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAjustes);
  Action := caFree;
end;

end.
