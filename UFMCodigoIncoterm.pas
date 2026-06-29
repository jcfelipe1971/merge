unit UFMCodigoIncoterm;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, ULFEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMCodigoIncoterm = class(TFPEdit)
     LCodigo: TLFLabel;
     DBECodigo: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBEFGrupo: TLFDBEditFind2000;
     LGrupo: TLFLabel;
     ETituloGrupo: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFGrupoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCodigoIncoterm : TFMCodigoIncoterm;

implementation

uses UDMMain, UFormGest, UDMCodigoIncoterm, UDameDato;

{$R *.dfm}

procedure TFMCodigoIncoterm.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCodigoIncoterm, DMCodigoIncoterm);
  NavMain.DataSource := DMCodigoIncoterm.DSQMCodigo;
  DBGMain.DataSource := DMCodigoIncoterm.DSQMCodigo;

  G2kTableLoc.DataSource := DMCodigoIncoterm.DSQMCodigo;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMCodigoIncoterm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCodigoIncoterm);
end;

procedure TFMCodigoIncoterm.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMCodigoIncoterm.DBEFGrupoChange(Sender: TObject);
begin
  inherited;
  ETituloGrupo.Text := DameTituloGrupoIncoterm(DBEFGrupo.Text);
end;

end.
