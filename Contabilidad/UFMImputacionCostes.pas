unit UFMImputacionCostes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, ULFComboBox, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UNavigator, ULFLabel, ULFEdit,
  ULFEditFind2000, Mask, DBCtrls, ULFDBEdit, UControlEdit, Menus, UTeclas,
  ActnList, ULFActionList, rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox;

type
  TFMImputacionCostes = class(TG2kForm)
     PMain: TLFPanel;
     TBPlanes: TLFToolBar;
     CBPlanes: TLFComboBox;
     TBMain: TLFToolBar;
     NavApuntes: THYMNavigator;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavImputaciones: THYMNavigator;
     DBGFImputaciones: TDBGridFind2000;
     PPlantilla: TLFPanel;
     LBLPlantilla: TLFLabel;
     EFPlantilla: TLFEditFind2000;
     TSep1: TToolButton;
     PDocumento: TLFPanel;
     TSep2: TToolButton;
     LBLFecha: TLFLabel;
     DBEDocFecha: TLFDbedit;
     LBLTipo: TLFLabel;
     DBEDocTipo: TLFDbedit;
     LBLNumero: TLFLabel;
     DBEDocNumero: TLFDbedit;
     CEApuntes: TControlEdit;
     CEImputaciones: TControlEdit;
     CEApuntesPMEdit: TPopUpTeclas;
     CEImputacionesPMEdit: TPopUpTeclas;
     DBEPlantillaTitulo: TLFDbedit;
     ALMain: TLFActionList;
     AConfirmarImputacion: TAction;
     AAsientosPorImputar: TAction;
     AIrAlDocumento: TAction;
     LFCategoryAction1: TLFCategoryAction;
     TBActions: TLFToolBar;
     FSMain: TLFFibFormStorage;
     TButtSalir: TToolButton;
     TSep3: TToolButton;
     DBGFApuntes: TDBGridFind2000;
     LFPSeparador: TLFPanel;
     TButtRefrescar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFApuntesColEnter(Sender: TObject);
     procedure DBGFImputacionesColEnter(Sender: TObject);
     procedure CBPlanesSelect(Sender: TObject);
     procedure EFPlantillaChange(Sender: TObject);
     procedure EFPlantillaBusqueda(Sender: TObject);
     procedure EFPlantillaEnter(Sender: TObject);
     procedure AConfirmarImputacionExecute(Sender: TObject);
     procedure AAsientosPorImputarExecute(Sender: TObject);
     procedure AIrAlDocumentoExecute(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure NavImputacionesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFApuntesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFImputacionesBusqueda(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
  private
     { Private declarations }
     function PlanSeleccionado: string;
     procedure RefrescaDatos;
  public
     { Public declarations }
  end;

procedure AbrirImputacionCostes(RIC: integer; evaluar: boolean);
procedure AbrirImputacionCostesLinea(RIC, Linea: integer);

var
  FMImputacionCostes : TFMImputacionCostes;

implementation

{$R *.dfm}

uses
  UDMMain, UDMImputacionCostes, UFMain, UEntorno, UFMAsientosPorImputar;

procedure AbrirImputacionCostes(RIC: integer; evaluar: boolean);
begin
  // Primero miramos que este usuario pueda realizar imputaciones
  if DMMain.PuedeHacerImputaciones then
  begin
     try
        AbreData(TDMImputacionCostes, DMImputacionCostes);
        // ahora averiguamos si el asiento es imputable, pero evaluando
        // o no, los planes marcados para preguntar
        if (DMImputacionCostes.AsientoImputable(ric, evaluar)) then
        begin
           // y finalmente vemos si ya está imputado y no hay que preguntar o no
           if (((not DMImputacionCostes.AsientoImputado('', ric, evaluar)) and (evaluar)) or
              (not evaluar)) then
           begin
              DMImputacionCostes.AbrirAsiento(RIC);
              FMain.EjecutaAccion(FMain.AAnaImputacionesCostes);
              if (DMImputacionCostes.QMApuntesPROYECTO.AsInteger > 0) then
              begin
                 with FMImputacionCostes do
                 begin
                    // Tiene un proyecto-plan_contable asignado
                    CBPlanes.ItemIndex :=
                       DMImputacionCostes.DamePosicionProyecto(DMImputacionCostes.QMApuntesPROYECTO.AsInteger);
                    RefrescaDatos;
                 end;
              end;
           end;
        end;
     finally
        CierraData(DMImputacionCostes);
     end;
  end;
end;

procedure AbrirImputacionCostesLinea(RIC, Linea: integer);
begin
  if (DMMain.PuedeHacerImputaciones) then
  begin
     try
        AbreData(TDMImputacionCostes, DMImputacionCostes);
        DMImputacionCostes.AbrirAsiento(RIC);
        if ((not DMImputacionCostes.AsientoImputado('', ric, False)) and
           (DMImputacionCostes.AsientoImputable(ric, False))) then
        begin
           FMain.EjecutaAccion(FMain.AAnaImputacionesCostes);
           DMImputacionCostes.PosicionaLinea(Linea);
        end;

     finally
        CierraData(DMImputacionCostes);
     end;
  end;
end;

procedure TFMImputacionCostes.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMImputacionCostes, DMImputacionCostes);

  NavApuntes.DataSource := DMImputacionCostes.DSQMApuntes;
  DBGFApuntes.DataSource := DMImputacionCostes.DSQMApuntes;
  NavImputaciones.DataSource := DMImputacionCostes.DSQMImputaciones;
  DBGFImputaciones.DataSource := DMImputacionCostes.DSQMImputaciones;

  CEApuntesPMEdit.Teclas := DMMain.Teclas;
  CEImputacionesPMEdit.Teclas := DMMain.Teclas;

  DMImputacionCostes.LlenaPlanesContables(CBPlanes.Items);
  CBPlanes.ItemIndex := 0;
  DMImputacionCostes.AbrirPlanContable(PlanSeleccionado);

  //DMImputacionCostes.AbrirPrimerAsiento;
  DMImputacionCostes.LlenarTablas;
  DMImputacionCostes.AbrirApuntes;
  DMImputacionCostes.AbrirImputaciones;

  ControlEdit := CEApuntes;
end;

procedure TFMImputacionCostes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMImputacionCostes);
end;

function TFMImputacionCostes.PlanSeleccionado: string;
var
  P : integer;
begin
  P := Pos('-', CBPlanes.Items[CBPlanes.ItemIndex]);
  Result := Copy(CBPlanes.Items[CBPlanes.ItemIndex], 1, P - 1);
end;

procedure TFMImputacionCostes.DBGFApuntesColEnter(Sender: TObject);
begin
  ControlEdit := CEApuntes;
end;

procedure TFMImputacionCostes.DBGFImputacionesColEnter(Sender: TObject);
begin
  ControlEdit := CEImputaciones;
end;

procedure TFMImputacionCostes.CBPlanesSelect(Sender: TObject);
begin
  RefrescaDatos;
end;

procedure TFMImputacionCostes.EFPlantillaChange(Sender: TObject);
begin
  DMImputacionCostes.AbrirPlantilla(StrToIntDef(EFPlantilla.Text, 0));
  DMImputacionCostes.LlenarConPlantilla;
end;

procedure TFMImputacionCostes.EFPlantillaBusqueda(Sender: TObject);
begin
  with DMImputacionCostes do
     EFPlantilla.CondicionBusqueda := 'PLAN_CONTABLE=''' + PlanActivo + '''';
end;

procedure TFMImputacionCostes.EFPlantillaEnter(Sender: TObject);
begin
  ControlEdit := CEImputaciones;
end;

procedure TFMImputacionCostes.AConfirmarImputacionExecute(Sender: TObject);
begin
  DMImputacionCostes.ConfirmarImputacion;
  RefrescaDatos;
  ShowMessage(_('Imputacion asignada'));
end;

procedure TFMImputacionCostes.AAsientosPorImputarExecute(Sender: TObject);
var
  FMAsientos : TFMAsientosPorImputar;
begin
  FMAsientos := TFMAsientosPorImputar.Create(Self);
  with FMAsientos do
     try
        plan_contable := DMImputacionCostes.xPlanPLAN_CONTABLE.AsString;
        FMAsientos.Inicializa(DMImputacionCostes.xPlanPLAN_CONTABLE.AsString);
        if (ShowModal = mrOk) then
        begin
           DMImputacionCostes.AbrirAsiento(RIC);
           DMImputacionCostes.LlenarTablas;
           DMImputacionCostes.AbrirApuntes;
           DMImputacionCostes.AbrirImputaciones;
        end;
     finally
        Free;
     end;
end;

procedure TFMImputacionCostes.AIrAlDocumentoExecute(Sender: TObject);
var
  Tipo, Serie : string;
  Rig : integer;
begin
  DMImputacionCostes.DatosDocumento(Tipo, Serie, Rig);
  if (Rig > 0) then
     FMain.MuestraDocumento(REntorno.Ejercicio, Tipo, Serie, Rig);
end;

procedure TFMImputacionCostes.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMImputacionCostes.NavImputacionesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if (Button in [nbPost, nbDelete]) then
     EFPlantilla.Text := '';
end;

procedure TFMImputacionCostes.DBGFApuntesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (not ((gdSelected in State) or (gdFocused in State))) or
     (not DBGFApuntes.Focused) then
     if not DMImputacionCostes.Imputado then
        with DBGFApuntes.Canvas do
        begin
           Brush.Color := clRed;
           Font.Color := clWhite;
           FillRect(Rect);
        end;
  DBGFApuntes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMImputacionCostes.DBGFImputacionesBusqueda(Sender: TObject);
begin
  DBGFImputaciones.CondicionBusqueda := 'plan_contable=''' + planseleccionado + '''';
end;

procedure TFMImputacionCostes.TButtRefrescarClick(Sender: TObject);
begin
  RefrescaDatos;
end;

procedure TFMImputacionCostes.RefrescaDatos;
begin
  with DMImputacionCostes do
  begin
     // Abre el plan contable que esta seleccionado en el combo box
     AbrirPlanContable(PlanSeleccionado);
     // AbrirPrimerAsiento;
     LlenarTablas;
     AbrirApuntes;
     AbrirImputaciones;
  end;
end;

end.
