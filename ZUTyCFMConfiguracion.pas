unit ZUTyCFMConfiguracion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, UNavigator, ToolWin, ULFToolBar, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, ULFPageControl, ExtCtrls, ULFPanel, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, Menus,
  UTeclas, UControlEdit, UFormGest, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, UEditPanel;

type
  TZTyCFMConfiguracion = class(TFPEditSimple)
     PCMain: TLFPanel;
     LFPCMain: TLFPageControl;
     TSGeneral: TTabSheet;
     LFPanelGen: TLFPanel;
     LFLabel1: TLFLabel;
     CBDBLstPedEsp: TDBComboBox;
     DBCBSeparaApuntes: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZTyCFMConfiguracion : TZTyCFMConfiguracion;

implementation

uses ZUTycDMConfiguracion, UDMMain, UEntorno, UFMain, UUtiles;

{$R *.dfm}

procedure TZTyCFMConfiguracion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZTycDMConfiguracion, ZTycDMConfiguracion);
  // NavMain.DataSource:=ZTyCDMConfiguracion.DSQMTyCConfig;
  LFPCMain.ActivePage := TSGeneral;
end;

end.
