unit UFMCondicionesAgeAgrupArt;

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
  TFMCondicionesAgeAgrupArt = class(TFPEditSinNavegador)
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
     PNLAgrupacion: TLFPanel;
     LBLAgente: TLFLabel;
     EFAgente: TLFEditFind2000;
     DBENom_Agente: TLFDbedit;
     LBLAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     DBENom_Agrupacion: TLFDbedit;
     DBEComisionLineal: TLFDbedit;
     LComisionLineal: TLFLabel;
     DBECommisionLinealArt: TLFDbedit;
     LComisionLinealArt: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgenteChange(Sender: TObject);
     procedure TSFamiliasShow(Sender: TObject);
     procedure TSArticulosShow(Sender: TObject);
     procedure DBGFamiliaDblClick(Sender: TObject);
     procedure DBGArticulosDblClick(Sender: TObject);
     procedure TSFam_TablaShow(Sender: TObject);
     procedure TSArt_TablaShow(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
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
  FMCondicionesAgeAgrupArt : TFMCondicionesAgeAgrupArt;

implementation

uses UDMMain, UEntorno, UDMCondicionesAgeAgrupArt;

{$R *.DFM}

procedure TFMCondicionesAgeAgrupArt.FormCreate(Sender: TObject);
begin
  inherited;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  CEMain.Teclas := DMMain.Teclas;
  CEFamiliaPMEdit.Teclas := DMMain.Teclas;
  CEFamilia.Teclas := DMMain.Teclas;
  AbreData(TDMCondicionesAgeAgrupArt, DMCondicionesAgeAgrupArt);
  NavArticulos.DataSource := DMCondicionesAgeAgrupArt.DSQMCondArticulos;
  NavFamilia.DataSource := DMCondicionesAgeAgrupArt.DSQMCondFamilias;
  PCMain.ActivePage := TSArticulos;
end;

procedure TFMCondicionesAgeAgrupArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCondicionesAgeAgrupArt);
  FMCondicionesAgeAgrupArt := nil;
end;

procedure TFMCondicionesAgeAgrupArt.EFAgenteChange(Sender: TObject);
begin
  DMCondicionesAgeAgrupArt.FiltrarAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFMCondicionesAgeAgrupArt.TSFamiliasShow(Sender: TObject);
begin
  ControlEdit := CEFamilia;
end;

procedure TFMCondicionesAgeAgrupArt.TSArticulosShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMCondicionesAgeAgrupArt.DBGFamiliaDblClick(Sender: TObject);
begin
  PCFamilia.ActivePage := TSFam_Ficha;
end;

procedure TFMCondicionesAgeAgrupArt.DBGArticulosDblClick(Sender: TObject);
begin
  PCArticulos.ActivePage := TSArt_Ficha;
end;

procedure TFMCondicionesAgeAgrupArt.TSFam_TablaShow(Sender: TObject);
begin
  DBGFamilia.SetFocus;
end;

procedure TFMCondicionesAgeAgrupArt.TSArt_TablaShow(Sender: TObject);
begin
  DBGArticulos.SetFocus;
end;

procedure TFMCondicionesAgeAgrupArt.EFAgrupacionChange(Sender: TObject);
begin
  DMCondicionesAgeAgrupArt.FiltrarAgrupacion(StrToIntDef(EFAgente.Text, 0),
     EFAgrupacion.Text);
end;

procedure TFMCondicionesAgeAgrupArt.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesAgeAgrupArt.EFFamiliaBusqueda(Sender: TObject);
begin
  EFFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesAgeAgrupArt.NavArticulosClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
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

procedure TFMCondicionesAgeAgrupArt.NavFamiliaClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
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
