unit UFMControlErroresAgrupPec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ExtCtrls, rxPlacemnt,
  UNavigator, Menus, UTeclas, UControlEdit, ULFFormStorage, ULFToolBar,
  ULFPanel, UFPEditSimple, ActnList, ULFActionList, UEditPanel;

type
  TFMControlErroresAgrupPec = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMControlErroresAgrupPec : TFMControlErroresAgrupPec;

implementation

uses UDMMain, UDMControlErroresAgupPec;

{$R *.dfm}

procedure TFMControlErroresAgrupPec.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMControlErroresAgrupPec, DMControlErroresAgrupPec);
  ControlEdit := CEMain;
end;

procedure TFMControlErroresAgrupPec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMControlErroresAgrupPec);
  Action := caFree;
end;

end.
