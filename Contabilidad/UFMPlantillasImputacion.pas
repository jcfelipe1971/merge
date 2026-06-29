unit UFMPlantillasImputacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit, ULFComboBox, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMPlantillasImputacion = class(TFPEdit)
     PDetalle: TLFPanel;
     PCDetalle: TLFPageControl;
     TSCentrosCoste: TTabSheet;
     TSAsignacionCuentas: TTabSheet;
     TBCentrosCoste: TLFToolBar;
     DBGFCentrosCoste: TDBGridFind2000;
     NavCentrosCoste: THYMNavigator;
     TBCuentas: TLFToolBar;
     NavCuentas: THYMNavigator;
     DBGFCuentas: TDBGridFind2000;
     CECentrosCoste: TControlEdit;
     CECentrosCostePMEdit: TPopUpTeclas;
     CECuentas: TControlEdit;
     CECuentasPMEdit: TPopUpTeclas;
     LBLPlantilla: TLFLabel;
     LBLTitulo: TLFLabel;
     DBEPlantilla: TLFDbedit;
     DBETitulo: TLFDbedit;
     TBPlanes: TLFToolBar;
     CBPlanes: TLFComboBox;
     PIncompleta: TLFPanel;
     EdPlantillaIncompleta: TLFEdit;
     TSep1: TToolButton;
     TButtInsertarCuentas: TToolButton;
     TButtCrearImputaciones: TToolButton;
     TSep2: TToolButton;
     TButtReCrearImputaciones: TToolButton;
     TButtRecreaPlantilla: TToolButton;
     TbuttReconstruye: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFCentrosCosteColEnter(Sender: TObject);
     procedure TSCentrosCosteShow(Sender: TObject);
     procedure DBGFCuentasColEnter(Sender: TObject);
     procedure TSAsignacionCuentasShow(Sender: TObject);
     procedure CBPlanesSelect(Sender: TObject);
     procedure DBGFCentrosCosteBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TButtInsertarCuentasClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavCentrosCosteClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TButtCrearImputacionesClick(Sender: TObject);
     procedure TButtReCrearImputacionesClick(Sender: TObject);
     procedure TButtRecreaPlantillaClick(Sender: TObject);
     procedure TbuttReconstruyeClick(Sender: TObject);
     procedure DBGFCuentasColExit(Sender: TObject);
  private
     { Private declarations }
     function PlanSeleccionado: string;
  public
     { Public declarations }
     procedure MuestraIncompleta;
  end;

var
  FMPlantillasImputacion : TFMPlantillasImputacion;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPlantillasImputacion, UFormGest, UFPregRangoCuentas, UFMain,
  UUtiles, UEntorno;

procedure TFMPlantillasImputacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPlantillasImputacion, DMPlantillasImputacion);

  NavMain.DataSource := DMPlantillasImputacion.DSQMPlantillas;
  DBGMain.DataSource := DMPlantillasImputacion.DSQMPlantillas;
  NavCentrosCoste.DataSource := DMPlantillasImputacion.DSQMCentrosCoste;
  DBGFCentrosCoste.DataSource := DMPlantillasImputacion.DSQMCentrosCoste;
  NavCuentas.DataSource := DMPlantillasImputacion.DSQMCuentas;
  DBGFCuentas.DataSource := DMPlantillasImputacion.DSQMCuentas;

  CECentrosCostePMEdit.Teclas := DMMain.Teclas;
  CECuentasPMEdit.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  DMPlantillasImputacion.LlenaPlanesContables(CBPlanes.Items);
  CBPlanes.ItemIndex := 0;
  DMPlantillasImputacion.AbrirPlanContable(PlanSeleccionado);

  DMPlantillasImputacion.AbrirPlantillas;
  DMPlantillasImputacion.AbrirCentrosCoste;
  DMPlantillasImputacion.AbrirCuentas;
  MuestraIncompleta;

  PCDetalle.ActivePage := TSCentrosCoste;
  PCMain.ActivePage := TSFicha;
end;

procedure TFMPlantillasImputacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPlantillasImputacion);
end;

function TFMPlantillasImputacion.PlanSeleccionado: string;
var
  P : integer;
begin
  P := Pos('-', CBPlanes.Items[CBPlanes.ItemIndex]);
  Result := Copy(CBPlanes.Items[CBPlanes.ItemIndex], 1, P - 1);
end;

procedure TFMPlantillasImputacion.DBGFCentrosCosteColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CECentrosCoste;
end;

procedure TFMPlantillasImputacion.TSCentrosCosteShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CECentrosCoste;
end;

procedure TFMPlantillasImputacion.DBGFCuentasColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CECuentas;
  if (DBGFCuentas.SelectedField.FieldName = 'CUENTA') then
  begin
     FMain.AddComponentePunto(DBGFCuentas);
  end
  else
  begin
     FMain.DelComponentePunto(DBGFCuentas);
  end;
end;

procedure TFMPlantillasImputacion.TSAsignacionCuentasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CECuentas;
end;

procedure TFMPlantillasImputacion.CBPlanesSelect(Sender: TObject);
begin
  inherited;
  with DMPlantillasImputacion do
  begin
     AbrirPlanContable(PlanSeleccionado);
     AbrirPlantillas;
     AbrirCentrosCoste;
     AbrirCuentas;
  end;
end;

procedure TFMPlantillasImputacion.DBGFCentrosCosteBusqueda(Sender: TObject);
begin
  inherited;
  with DMPlantillasImputacion do
     DBGFCentrosCoste.CondicionBusqueda := 'PLAN_CONTABLE=''' + PlanActivo + '''';
end;

procedure TFMPlantillasImputacion.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMPlantillasImputacion.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

{procedure TFMPlantillasImputacion.Incompleta(Modo: Boolean);
begin
  PIncompleta.Visible := Modo;
end;}

procedure TFMPlantillasImputacion.TButtInsertarCuentasClick(Sender: TObject);
var
  FPregRango : TFPregRangoCuentas;
begin
  inherited;
  FPregRango := TFPregRangoCuentas.Create(Self);
  try
     if (FPregRango.ShowModal = mrOk) then
        DMPlantillasImputacion.AdicionaRangoCuentas(FPregRango.Desde, FPregRango.Hasta);
  finally
     FPregRango.Free;
  end;
end;

procedure TFMPlantillasImputacion.MuestraIncompleta;
begin
  PIncompleta.Visible := DMPlantillasImputacion.Incompleta;
end;

procedure TFMPlantillasImputacion.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  MuestraIncompleta;
end;

procedure TFMPlantillasImputacion.NavCentrosCosteClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbPost, nbDelete]) then
     MuestraIncompleta;
end;

procedure TFMPlantillasImputacion.TButtCrearImputacionesClick(Sender: TObject);
begin
  DMPlantillasImputacion.CrearImputaciones;
end;

procedure TFMPlantillasImputacion.TButtReCrearImputacionesClick(Sender: TObject);
begin
  DMPlantillasImputacion.ReCrearImputaciones(0);
end;

procedure TFMPlantillasImputacion.TButtRecreaPlantillaClick(Sender: TObject);
begin
  DMPlantillasImputacion.ReCrearImputaciones(1);
end;

procedure TFMPlantillasImputacion.TbuttReconstruyeClick(Sender: TObject);
begin
  inherited;
  DMPlantillasImputacion.ReConstruye;
end;

procedure TFMPlantillasImputacion.DBGFCuentasColExit(Sender: TObject);
begin
  inherited;
  if (DBGFCuentas.SelectedField.FieldName = 'CUENTA') then
  begin
     DMPlantillasImputacion.QMCuentasCUENTA.AsString := Trim(ExpandirCadena(DMPlantillasImputacion.QMCuentasCUENTA.AsString, REntorno.DigitosSub));
  end;
end;

end.
