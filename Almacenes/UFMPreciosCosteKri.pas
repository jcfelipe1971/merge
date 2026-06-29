unit UFMPreciosCosteKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Menus, UTeclas, UControlEdit, UEditPanel, ExtCtrls,
  UNavigator, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  ULFEditFind2000, UG2kTBLoc, ULFPanel, ULFEdit, ULFLabel, UFPEditSimple,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList;

type
  TFMPreciosCosteKri = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     CEPreciosCoste: TControlEdit;
     PopupPreciosCoste: TPopUpTeclas;
     CETarifasPArticuloMifirst: TMenuItem;
     CETarifasPArticuloMiprior: TMenuItem;
     CETarifasPArticuloMinext: TMenuItem;
     CETarifasPArticuloMilast: TMenuItem;
     CETarifasPArticuloMiinsert: TMenuItem;
     CETarifasPArticuloMidelete: TMenuItem;
     CETarifasPArticuloMiedit: TMenuItem;
     CETarifasPArticuloMipost: TMenuItem;
     CETarifasPArticuloMicancel: TMenuItem;
     CETarifasPArticuloMirefresh: TMenuItem;
     TBSep1: TToolButton;
     LAlmacen: TLFLabel;
     LFEFAlmacen: TLFEditFind2000;
     EAlmacen: TLFEdit;
     G2KTableLoc: TG2KTBLoc;
     PNLAlmacen: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFEFAlmacenChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPreciosCosteKri : TFMPreciosCosteKri;

implementation

uses UDMPreciosCosteKri, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMPreciosCosteKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPreciosCosteKri, DMPreciosCosteKri);
  ControlEdit := CEPreciosCoste;
  LFEFAlmacen.Text := REntorno.AlmacenDefecto;
  G2KTableLoc.CondicionBusqueda := 'ALMACEN=''' + REntorno.AlmacenDefecto + '''';
end;

procedure TFMPreciosCosteKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPreciosCosteKri);
end;

procedure TFMPreciosCosteKri.LFEFAlmacenChange(Sender: TObject);
begin
  if (LFEFAlmacen.Text > '') then
  begin
     EAlmacen.Text := DameTituloAlmacen(LFEFAlmacen.Text);
     DMPreciosCosteKri.FiltraAlmacen(LFEFAlmacen.Text);
     G2KTableLoc.CondicionBusqueda := 'ALMACEN=''' + EAlmacen.Text + '''';
  end;
end;

procedure TFMPreciosCosteKri.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  G2KTableLoc.Click;
end;

end.
