unit UFMCondicionesAgeCliArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, UNavigator, ToolWin, UControlEdit, Menus,
  UTeclas, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, FIBEditFind, Grids, DBGrids, UHYDBGrid,
  UDBDateTimePicker, UFormGest, NsDBGrid, ULFDBCheckBox, ULFDBEditFind2000,
  ULFPageControl, ULFPanel, ULFDBEdit, ULFToolBar, TFlatCheckBoxUnit,
  ULFCheckBox, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditSinNavegador, ActnList, ULFActionList;

type
  TFMCondicionesAgeCliArt = class(TFPEditSinNavegador)
     TSep1: TToolButton;
     PCMain: TLFPageControl;
     TSArticulos: TTabSheet;
     TSFamilias: TTabSheet;
     TBArticulos: TLFToolBar;
     PCArticulos: TLFPageControl;
     TSArt_Ficha: TTabSheet;
     TSArt_Tabla: TTabSheet;
     TBFamilia: TLFToolBar;
     PCFamilia: TLFPageControl;
     TSFam_Ficha: TTabSheet;
     TSFam_Tabla: TTabSheet;
     NavFamilia: THYMNavigator;
     NavArticulos: THYMNavigator;
     PNLFam_Ficha: TLFPanel;
     PNLArt_Ficha: TLFPanel;
     EFArticulo: TLFDBEditFind2000;
     DBENom_Articulo: TLFDbedit;
     DBEComision_Art: TLFDbedit;
     DBCHKActivo_Art: TLFDBCheckBox;
     LBLArticulo: TLFLabel;
     DBGArticulos: THYTDBGrid;
     EFFamilia: TLFDBEditFind2000;
     LBLFamilia: TLFLabel;
     DBGFamilia: THYTDBGrid;
     CEFamilia: TControlEdit;
     CEFamiliaPMEdit: TPopUpTeclas;
     TBSecond: TLFToolBar;
     CEFamiliaMifirst: TMenuItem;
     CEFamiliaMiprior: TMenuItem;
     CEFamiliaMinext: TMenuItem;
     CEFamiliaMilast: TMenuItem;
     CEFamiliaMiinsert: TMenuItem;
     CEFamiliaMidelete: TMenuItem;
     CEFamiliaMiedit: TMenuItem;
     CEFamiliaMipost: TMenuItem;
     CEFamiliaMicancel: TMenuItem;
     CEFamiliarefresh: TMenuItem;
     DBENom_Familia: TLFDbedit;
     DBEComision_Fam: TLFDbedit;
     DBCHKActivo_Fam: TLFDBCheckBox;
     PNLAgente: TLFPanel;
     LBLAgente: TLFLabel;
     EFAgente: TLFEditFind2000;
     DBENom_Agente: TLFDbedit;
     PNLCliente: TLFPanel;
     LBLCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     DBENom_Cliente: TLFDbedit;
     DBEComisionLinealFam: TLFDbedit;
     LComisionLineal: TLFLabel;
     DBEComisionLinealArt: TLFDbedit;
     LComisionLinealArticulos: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgenteChange(Sender: TObject);
     procedure TSFamiliasShow(Sender: TObject);
     procedure TSArticulosShow(Sender: TObject);
     procedure DBGFamiliaDblClick(Sender: TObject);
     procedure DBGArticulosDblClick(Sender: TObject);
     procedure TSFam_TablaShow(Sender: TObject);
     procedure TSArt_TablaShow(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure EFFamiliaBusqueda(Sender: TObject);
     procedure NavArticulosClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavFamiliaClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCondicionesAgeCliArt : TFMCondicionesAgeCliArt;

implementation

uses UDMCondicionesAgeCliArt, UDMMain, UEntorno;

{$R *.DFM}

procedure TFMCondicionesAgeCliArt.FormCreate(Sender: TObject);
begin
  inherited;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  CEMain.Teclas := DMMain.Teclas;
  CEFamiliaPMEdit.Teclas := DMMain.Teclas;
  CEFamilia.Teclas := DMMain.Teclas;
  AbreData(TDMCondicionesAgecliArt, DMCondicionesAgeCliArt);
  NavArticulos.DataSource := DMCondicionesAgeCliArt.DSQMCondArticulos;
  NavFamilia.DataSource := DMCondicionesAgeCliArt.DSQMCondFamilias;
  PCMain.ActivePage := TSArticulos;
end;

procedure TFMCondicionesAgeCliArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCondicionesAgecliArt);
  FMCondicionesAgeCliArt := nil;
end;

procedure TFMCondicionesAgeCliArt.EFAgenteChange(Sender: TObject);
begin
  DMCondicionesAgecliArt.FiltrarAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFMCondicionesAgeCliArt.TSFamiliasShow(Sender: TObject);
begin
  ControlEdit := CEFamilia;
end;

procedure TFMCondicionesAgeCliArt.TSArticulosShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMCondicionesAgeCliArt.DBGFamiliaDblClick(Sender: TObject);
begin
  PCFamilia.ActivePage := TSFam_Ficha;
end;

procedure TFMCondicionesAgeCliArt.DBGArticulosDblClick(Sender: TObject);
begin
  PCArticulos.ActivePage := TSArt_Ficha;
end;

procedure TFMCondicionesAgeCliArt.TSFam_TablaShow(Sender: TObject);
begin
  DBGFamilia.SetFocus;
end;

procedure TFMCondicionesAgeCliArt.TSArt_TablaShow(Sender: TObject);
begin
  DBGArticulos.SetFocus;
end;

procedure TFMCondicionesAgeCliArt.EFClienteChange(Sender: TObject);
begin
  DMCondicionesAgecliArt.FiltrarCliente(StrToIntDef(EFAgente.Text, 0),
     StrToIntDef(EFCliente.Text, 0));
end;

procedure TFMCondicionesAgeCliArt.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesAgeCliArt.EFFamiliaBusqueda(Sender: TObject);
begin
  EFFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesAgeCliArt.NavArticulosClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbEdit then
  begin
     EFArticulo.Enabled := False;
     EFArticulo.Color := clInfoBk;
  end
  else
  begin
     EFArticulo.Enabled := True;
     EFArticulo.Color := clWindow;
  end;

  if Button = nbInsert then
  begin
     EFArticulo.Enabled := True;
     EFArticulo.Color := clWindow;
     EFArticulo.Font.Color := clWindowText;
  end
  else
  begin
     EFArticulo.Enabled := False;
     EFArticulo.Color := clInfoBk;
     EFArticulo.Font.Color := clGrayText;
  end;
end;

procedure TFMCondicionesAgeCliArt.NavFamiliaClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbEdit then
  begin
     EFFamilia.Enabled := False;
     EFFamilia.Color := clInfoBk;
  end
  else
  begin
     EFFamilia.Enabled := True;
     EFFamilia.Color := clWindow;
  end;

  if Button = nbInsert then
  begin
     EFFamilia.Enabled := True;
     EFFamilia.Color := clWindow;
     EFFamilia.Font.Color := clWindowText;
  end
  else
  begin
     EFFamilia.Enabled := False;
     EFFamilia.Color := clInfoBk;
     EFFamilia.Font.Color := clGrayText;
  end;
end;

end.
