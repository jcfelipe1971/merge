unit UFPregAnaPresupuesto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DBCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  rxToolEdit, ULFCheckBox, ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregAnaPresupuesto = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     TBMulticanal: TToolButton;
     AMultiSeleccion: TAction;
     BGPlanContable: TGroupBox;
     LPlan: TLFLabel;
     EFPlanContable: TLFEditFind2000;
     DBEPlanContable: TLFDbedit;
     GBCentroCoste: TGroupBox;
     LDesdeCentroCoste: TLFLabel;
     LHastaCentroCoste: TLFLabel;
     EFCcDesde: TLFEditFind2000;
     EFCcHasta: TLFEditFind2000;
     DBECCDesde: TLFDbedit;
     DBECCHasta: TLFDbedit;
     GBNiveles: TGroupBox;
     LDesdeNivel: TLFLabel;
     LHastaNivel: TLFLabel;
     CBNivelDesde: TLFComboBox;
     CBNivelHasta: TLFComboBox;
     GBPeriodos: TGroupBox;
     LHastaPeriodo: TLFLabel;
     LDesdePeriodo: TLFLabel;
     LBPeriodo: TLFLabel;
     CBPeriodo: TLFComboBox;
     CBPDesde: TLFComboBox;
     CBPHasta: TLFComboBox;
     CHKControl: TLFCheckBox;
     CHKMeses: TLFCheckBox;
     PNLOpciones: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBNivelDesdeChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure TButtConfigurarClick(Sender: TObject);
     procedure EFCcDesdeChange(Sender: TObject);
     procedure EFCcHastaChange(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure CBPeriodoChange(Sender: TObject);
     procedure EFCcDesdeBusqueda(Sender: TObject);
     procedure EFCcHastaBusqueda(Sender: TObject);
     procedure EFPlanContableChange(Sender: TObject);
     procedure CBPDesdeChange(Sender: TObject);
  private
     { Private declarations }
     Canal: integer;
     ListaCanales: TStringList;
     procedure MostrarListado(Modo: integer);
     procedure Recargar;
  public
     { Public declarations }
  end;

var
  FPregAnaPresupuesto : TFPregAnaPresupuesto;

implementation

uses UDMMain, UFormGest, UDMRAnaPresupuesto, UEntorno, UFMListConfig,
  UDMListados, UUtiles, UFMain, UFMultiSeleccion, StrUtils, URellenaLista;

{$R *.DFM}

procedure TFPregAnaPresupuesto.FormCreate(Sender: TObject);
begin
  inherited;

  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  AbreData(TDMRAnaPresupuesto, DMRAnaPresupuesto);

  EFPlanContable.Text := DMRAnaPresupuesto.PlanInicial;
end;

procedure TFPregAnaPresupuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ListaCanales.Free;
  CierraData(DMRAnaPresupuesto);
end;

procedure TFPregAnaPresupuesto.CBNivelDesdeChange(Sender: TObject);
begin
  if (CBNivelDesde.ItemIndex > CBNivelHasta.ItemIndex) then
     CBNivelHasta.ItemIndex := CBNivelDesde.ItemIndex - 1;
  if (CBNivelDesde.ItemIndex = 0) then
     CBNivelHasta.Enabled := False
  else
     CBNivelHasta.Enabled := True;
end;

procedure TFPregAnaPresupuesto.APrevExecute(Sender: TObject);
begin
  MostrarListado(0);
end;

procedure TFPregAnaPresupuesto.AImprimirExecute(Sender: TObject);
begin
  MostrarListado(1);
end;

procedure TFPregAnaPresupuesto.MostrarListado(Modo: integer);
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;

  with DMRAnaPresupuesto do
  begin
     if CBNivelDesde.ItemIndex = 0 then
     begin
        NDesde := 1;
        NHasta := CBNivelHasta.Items.Count - 1;
     end
     else
     begin
        NDesde := CBNivelDesde.ItemIndex;
        NHasta := CBNivelHasta.ItemIndex + 1;
     end;

     if (CBPeriodo.ItemIndex = 0) or (CBPDesde.ItemIndex = 0) then
     begin
        PDesde := '01';
        PHasta := RightStr(CBPHasta.Items[CBPHasta.Items.Count - 1], 2);
     end
     else
     begin
        PDesde := RightStr(CBPDesde.Items[CBPDesde.ItemIndex], 2);
        PHasta := RightStr(CBPHasta.Items[CBPHasta.ItemIndex], 2);
     end;

     Anual := CBPeriodo.ItemIndex = 0;
     Meses := CHKMeses.Checked;
     Control := CHKControl.Checked;

     MostrarListado(Modo, ListaCanales, Canal);
  end;
end;

procedure TFPregAnaPresupuesto.ARecargarExecute(Sender: TObject);
begin
  EFPlanContable.Text := DMRAnaPresupuesto.PlanInicial;
  Recargar;
end;

procedure TFPregAnaPresupuesto.TButtConfigurarClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(603, formato, cabecera, copias,
     pijama, '', DMRAnaPresupuesto.frAnaPresupuesto);
end;

procedure TFPregAnaPresupuesto.EFCcDesdeChange(Sender: TObject);
begin
  DMRAnaPresupuesto.ActualizaCCDesde(EFCcDesde.Text);
end;

procedure TFPregAnaPresupuesto.EFCcHastaChange(Sender: TObject);
begin
  DMRAnaPresupuesto.ActualizaCCHasta(EFCcHasta.Text);
end;

procedure TFPregAnaPresupuesto.AMultiSeleccionExecute(Sender: TObject);
begin
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFPregAnaPresupuesto.CBPeriodoChange(Sender: TObject);
begin
  inherited;
  if (CBPeriodo.ItemIndex = 0) then
  begin
     CBPDesde.ItemIndex := 1;
     CBPHasta.ItemIndex := CBPHasta.Items.Count - 1;
     CBPDesde.Enabled := False;
     CBPHasta.Enabled := False;
  end
  else
  begin
     CBPDesde.Enabled := True;
     CBPHasta.Enabled := True;
  end;
end;

procedure TFPregAnaPresupuesto.EFCcDesdeBusqueda(Sender: TObject);
begin
  inherited;
  EFCcDesde.CondicionBusqueda := 'PLAN_CONTABLE=''' + EFPlanContable.Text + '''';
end;

procedure TFPregAnaPresupuesto.EFCcHastaBusqueda(Sender: TObject);
begin
  inherited;
  EFCcHasta.CondicionBusqueda := 'PLAN_CONTABLE=''' + EFPlanContable.Text + '''';
end;

procedure TFPregAnaPresupuesto.Recargar;
var
  CCDesde, CCHasta : string;
begin
  DMRAnaPresupuesto.ParametrosIniciales(CCDesde, CCHasta);
  EFCcDesde.Text := CCDesde;
  EFCcHasta.Text := CCHasta;

  DMRAnaPresupuesto.LlenarNiveles;
  CBNivelDesde.Items := DMRAnaPresupuesto.Niveles;
  CBNivelDesde.Items.Insert(0, _('Todos'));
  CBNivelDesde.ItemIndex := 1;
  CBNivelHasta.Items := DMRAnaPresupuesto.Niveles;
  CBNivelHasta.ItemIndex := CBNivelHasta.Items.Count - 1;

  RellenaPeriodos(CBPDesde.Items);
  CBPDesde.ItemIndex := 1;
  RellenaPeriodos(CBPHasta.Items);
  CBPHasta.ItemIndex := CBPHasta.Items.Count - 1;

  CBPeriodo.ItemIndex := 0;
  CBPeriodoChange(CBPeriodo);

  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);
  Canal := REntorno.Canal;
end;

procedure TFPregAnaPresupuesto.EFPlanContableChange(Sender: TObject);
begin
  inherited;
  DMRAnaPresupuesto.ActualizaPlanContable(EFPlanContable.Text);
  Recargar;
end;

procedure TFPregAnaPresupuesto.CBPDesdeChange(Sender: TObject);
begin
  inherited;
  if (CBPDesde.ItemIndex > CBPHasta.ItemIndex) then
     CBPHasta.ItemIndex := CBPDesde.ItemIndex - 1;
  if (CBPDesde.ItemIndex = 0) then
     CBPHasta.Enabled := False
  else
     CBPHasta.Enabled := True;
end;

end.
