unit UFMGrupoIncoterm;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMGrupoIncoterm = class(TFPEdit)
     LGrupo: TLFLabel;
     DBEProtocolo: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGrupoIncoterm : TFMGrupoIncoterm;

implementation

uses UDMMain, UFormGest, UDMGrupoIncoterm;

{$R *.dfm}

procedure TFMGrupoIncoterm.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMGrupoIncoterm, DMGrupoIncoterm);
  NavMain.DataSource := DMGrupoIncoterm.DSQMGrupo;
  DBGMain.DataSource := DMGrupoIncoterm.DSQMGrupo;
  G2kTableLoc.DataSource := DMGrupoIncoterm.DSQMGrupo;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMGrupoIncoterm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGrupoIncoterm);
end;

procedure TFMGrupoIncoterm.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
