unit ZUFMTiposConfig;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UNavigator, ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel,
  Grids, DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, UFormGest,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel;

type
  TZFMTiposConfig = class(TFPEditSinNavegador)
     PnlIzquierda: TLFPanel;
     PnlDerecha: TLFPanel;
     PnlConfig: TLFPanel;
     PnlConfigDefecto: TLFPanel;
     PnlConfigDet: TLFPanel;
     PnlConfigDetDatos: TLFPanel;
     TBConfig: TLFToolBar;
     TBConfigDet: TLFToolBar;
     TBConfigDefecto: TLFToolBar;
     TBConfigDetDatos: TLFToolBar;
     NavConfig: THYMNavigator;
     NavConfigDet: THYMNavigator;
     NavConfigDefecto: THYMNavigator;
     NavConfigDetDatos: THYMNavigator;
     LblTipo: TLFLabel;
     LblDescTipo: TLFLabel;
     DBETipo: TLFDbedit;
     DBEDescTipo: TLFDbedit;
     DBEDescSubtipo: TLFDbedit;
     LDescSubTipo: TLFLabel;
     LblSubtipo: TLFLabel;
     DBESubtipo: TLFDbedit;
     DBGFConfig: TDBGridFind2000;
     DBGFConfigDet: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMTiposConfig : TZFMTiposConfig;

implementation

uses ZUDMTiposConfig, UDMMain;

{$R *.dfm}

procedure TZFMTiposConfig.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMTiposConfig, ZDMTiposConfig);
end;

procedure TZFMTiposConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMTiposConfig);
end;

end.
