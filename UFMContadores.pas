unit UFMContadores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, UHYDBGrid, UControlEdit,
  Menus, UTeclas, UNavigator, URecursos, UFIBDBEditfind, UFormGest,
  UComponentesBusquedaFiltrada, NsDBGrid, ULFToolBar, ULFPanel,
  ULFPageControl, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, UEditPanel;

type
  TFMContadores = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSEmpresa: TTabSheet;
     TSEjercicio: TTabSheet;
     TSCanal: TTabSheet;
     TSSerie: TTabSheet;
     TButtBasicos: TToolButton;
     TButtEspecificos: TToolButton;
     TButtAlta: TToolButton;
     TSSeriesSimples: TTabSheet;
     PE: TLFPanel;
     HYTDBG_E: TDBGridFind2000;
     PEE: TLFPanel;
     HYTDBG_EE: TDBGridFind2000;
     PEEC: TLFPanel;
     HYTDBG_EEC: TDBGridFind2000;
     PEECS: TLFPanel;
     HYTDBG_EECS: TDBGridFind2000;
     PEES: TLFPanel;
     HYTDBG_EES: TDBGridFind2000;
     CEEmpresa: TControlEdit;
     CEEmpresaPMEdit: TPopUpTeclas;
     CEEjercicio: TControlEdit;
     CECanal: TControlEdit;
     CEEjercicioPMEdit: TPopUpTeclas;
     CECanalPMEdit: TPopUpTeclas;
     CESerie: TControlEdit;
     CESerieSimple: TControlEdit;
     CESeriePMEdit: TPopUpTeclas;
     CESerieSimplePMEdit: TPopUpTeclas;
     TBEmpresa: TLFToolBar;
     NavEmpresa: THYMNavigator;
     PNLInfo_E: TLFPanel;
     TBEjercicio: TLFToolBar;
     NavEjercicio: THYMNavigator;
     PNLInfo_EE: TLFPanel;
     TBCanal: TLFToolBar;
     NavCanal: THYMNavigator;
     PNLInfo_EEC: TLFPanel;
     TBSerie: TLFToolBar;
     NavSerie: THYMNavigator;
     PNLInfo_EECS: TLFPanel;
     TBSerieSimple: TLFToolBar;
     NavSerieSimple: THYMNavigator;
     PNLInfo_EES: TLFPanel;
     TSCanalSimple: TTabSheet;
     HYTDBG_EC: TDBGridFind2000;
     TBCanalSimple: TLFToolBar;
     NavCanalSimple: THYMNavigator;
     PNLInfo_CSimple: TLFPanel;
     CECanalSimple: TControlEdit;
     CECanalSimplePMEdit: TPopUpTeclas;
     MenuItem1: TMenuItem;
     MenuItem2: TMenuItem;
     MenuItem3: TMenuItem;
     MenuItem4: TMenuItem;
     MenuItem5: TMenuItem;
     MenuItem6: TMenuItem;
     MenuItem7: TMenuItem;
     MenuItem8: TMenuItem;
     MenuItem9: TMenuItem;
     MenuItem10: TMenuItem;
     MenuItem11: TMenuItem;
     MenuItem12: TMenuItem;
     MenuItem13: TMenuItem;
     MenuItem14: TMenuItem;
     MenuItem15: TMenuItem;
     MenuItem16: TMenuItem;
     MenuItem17: TMenuItem;
     MenuItem18: TMenuItem;
     MenuItem19: TMenuItem;
     MenuItem20: TMenuItem;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtBasicosClick(Sender: TObject);
     procedure TButtEspecificosClick(Sender: TObject);
     procedure TButtAltaClick(Sender: TObject);
     procedure TSCanalShow(Sender: TObject);
     procedure TSEjercicioShow(Sender: TObject);
     procedure TSEmpresaShow(Sender: TObject);
     procedure TSSerieShow(Sender: TObject);
     procedure TSSeriesSimplesShow(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure HYTDBGRowChange(Sender: TObject);
     procedure TSCanalSimpleShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMContadores : TFMContadores;

implementation

uses UDMContadores, UDMMain;

{$R *.DFM}

procedure TFMContadores.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMContadores, DMContadores);
  PCMain.ActivePage := TSEmpresa;
  // NavMain.DataSource := DMContadores.DSxConta_E;
  // NavMain.ControlEdit := CEEmpresa;
  // NavMain.InsertaControl := HYTDBG_E;
  // NavMain.EditaControl := HYTDBG_E;
  // NavMain.PopupMenu := CEEmpresaPMEdit;
  HYTDBG_E.DataSource := DMContadores.DSxConta_E;
  HYTDBG_EE.DataSource := DMContadores.DSxConta_EE;
  HYTDBG_EEC.DataSource := DMContadores.DSxConta_EEC;
  HYTDBG_EECS.DataSource := DMContadores.DSxConta_EECS;
  HYTDBG_EES.DataSource := DMContadores.DSxConta_EES;

  // Por defecto, la empresa estará activa
  // NavMain.ControlEdit := CEEmpresa;
  ControlEdit := CEEmpresa;
end;

procedure TFMContadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMContadores);
end;

procedure TFMContadores.TButtBasicosClick(Sender: TObject);
begin
  DMContadores.AjustaGenericos;
end;

procedure TFMContadores.TButtEspecificosClick(Sender: TObject);
begin
  DMMain.AjustaMovimientos;
end;

procedure TFMContadores.TButtAltaClick(Sender: TObject);
begin
  DMContadores.AltaTodos;
end;

// Empresa
procedure TFMContadores.TSEmpresaShow(Sender: TObject);
begin
  ControlEdit := CEEmpresa;
end;

// Ejercicio
procedure TFMContadores.TSEjercicioShow(Sender: TObject);
begin
  ControlEdit := CEEjercicio;
end;

// Canales
procedure TFMContadores.TSCanalShow(Sender: TObject);
begin
  ControlEdit := CECanal;
end;

// Serie
procedure TFMContadores.TSSerieShow(Sender: TObject);
begin
  ControlEdit := CESerie;
end;

// Serie Simple
procedure TFMContadores.TSSeriesSimplesShow(Sender: TObject);
begin
  ControlEdit := CESerieSimple;
end;

procedure TFMContadores.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  {  if (NavMain.DataSource.DataSet.RecordCount>0) then
   if Button = nbEdit then
     begin
          for i := 0 to PCMain.PageCount-1 do
               if PCMain.Pages[i] = PCMain.ActivePage
            then PCMain.Pages[i].TabVisible := True
           else PCMain.Pages[i].TabVisible := False;
   end
     else
          for i := 0 to PCMain.PageCount-1 do
               PCMain.Pages[i].TabVisible := True
  else
     Continua := False;
}
end;

procedure TFMContadores.HYTDBGRowChange(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to PCMain.PageCount - 1 do
     PCMain.Pages[i].TabVisible := True;
end;

procedure TFMContadores.TSCanalSimpleShow(Sender: TObject);
begin
  ControlEdit := CECanalSimple;
end;

end.
