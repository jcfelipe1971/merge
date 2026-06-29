unit UFPregAnaSumasYSaldos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DBCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  rxToolEdit, ULFCheckBox, ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, ULFDateEdit, ULFEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregAnaSumasYSaldos = class(TFPEditListadoSimple)
     PMonedas: TLFPanel;
     DBLCBMoneda: TDBLookupComboBox;
     PCentrosCoste: TLFPanel;
     GBCentroCoste: TGroupBox;
     LDesdeCentroCoste: TLFLabel;
     LHastaCentroCoste: TLFLabel;
     EFDesde: TLFEditFind2000;
     EFHasta: TLFEditFind2000;
     PNivFecha: TLFPanel;
     GBNiveles: TGroupBox;
     CBDesde: TLFComboBox;
     CBHasta: TLFComboBox;
     GBFechas: TGroupBox;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     TButtConfigurar: TToolButton;
     DBECCDesde: TLFDbedit;
     DBECCHasta: TLFDbedit;
     CheckSaldoCero: TLFCheckBox;
     TBMulticanal: TToolButton;
     AMultiSeleccion: TAction;
     GBSeccion: TGroupBox;
     LHastaSeccion: TLFLabel;
     LDesdeSeccion: TLFLabel;
     LBNivel: TLFLabel;
     ESeccionD: TLFEdit;
     ESeccionH: TLFEdit;
     CBNivelFiltro: TLFComboBox;
     BGPlanContable: TGroupBox;
     LPlan: TLFLabel;
     EFPlanContable: TLFEditFind2000;
     DBEPlanContable: TLFDbedit;
     LMoneda: TLFLabel;
     LDesdeNivel: TLFLabel;
     LHastaNivel: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBDesdeChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure TButtConfigurarClick(Sender: TObject);
     procedure EFDesdeChange(Sender: TObject);
     procedure EFHastaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure DTPHastaExit(Sender: TObject);
     procedure CBNivelFiltroChange(Sender: TObject);
     procedure ESeccionDChange(Sender: TObject);
     procedure ESeccionHChange(Sender: TObject);
     procedure EFDesdeBusqueda(Sender: TObject);
     procedure EFHastaBusqueda(Sender: TObject);
     procedure EFPlanContableChange(Sender: TObject);
  private
     { Private declarations }
     Canal: integer;
     ListaCanales: TStringList;
     procedure EnablePointCount;
     procedure DisablePointCount;
     procedure MostrarListado(Modo: integer);
     procedure Recargar;
  public
     { Public declarations }
  end;

var
  FPregAnaSumasYSaldos : TFPregAnaSumasYSaldos;

implementation

uses UDMMain, UFormGest, UDMRAnaSumasYSaldos, UEntorno, UFMListConfig,
  UDMListados, UUtiles, UFMain, UFMultiSeleccion;

{$R *.DFM}

procedure TFPregAnaSumasYSaldos.FormCreate(Sender: TObject);
begin
  inherited;
  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  AbreData(TDMRAnaSumasySaldos, DMRAnaSumasySaldos);
  EnablePointCount;  // Habilitar el punto

  DMRAnaSumasYSaldos.MinPlanContable;
  EFPlanContable.Text := DMRAnaSumasYSaldos.PlanContableMin;
end;

procedure TFPregAnaSumasYSaldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ListaCanales.Free;
  DisablePointCount;
  CierraData(DMRAnaSumasySaldos);
end;

procedure TFPregAnaSumasYSaldos.CBDesdeChange(Sender: TObject);
begin
  if (CBDesde.ItemIndex > CBHasta.ItemIndex) then
     CBHasta.ItemIndex := CBDesde.ItemIndex - 1;
  if (CBDesde.ItemIndex = 0) then
     CBHasta.Enabled := False
  else
     CBHasta.Enabled := True;
end;

procedure TFPregAnaSumasYSaldos.APrevExecute(Sender: TObject);
begin
  MostrarListado(0);
end;

procedure TFPregAnaSumasYSaldos.AImprimirExecute(Sender: TObject);
begin
  MostrarListado(1);
end;

procedure TFPregAnaSumasYSaldos.MostrarListado(Modo: integer);
begin
  with DMRAnaSumasySaldos do
  begin
     if TBMain.CanFocus then
        TBMain.SetFocus;
     Fecha_Desde := HourIntoDate(DTPDesde.Date, '00:00:00');
     Fecha_Hasta := HourIntoDate(DTPHasta.Date, '23:59:59');

     // Normalizar las fechas
     DMListados.Normalizar_Desde_Hasta(TDateTime(Fecha_Desde),
        TDateTime(Fecha_Hasta));

     CentroCoste_Desde := EFDesde.Text;
     CentroCoste_Hasta := EFHasta.Text;

     if CBDesde.ItemIndex = 0 then
     begin
        Nivel_Desde := 1;
        Nivel_Hasta := Niveles.Count - 1;
     end
     else
     begin
        Nivel_Desde := CBDesde.ItemIndex;
        Nivel_Hasta := CBHasta.ItemIndex + 1;
     end;

     Nivel_Filtro := CBNivelFiltro.ItemIndex;

     try
        Screen.Cursor := crHourGlass;
        CalculaInforme(CheckSaldoCero.Checked, ListaCanales, Canal);
        // Calcular el Informe de Sumas y Saldos
     finally
        Screen.Cursor := crDefault;
     end;
  end;

  DMRAnaSumasySaldos.MostrarListado(Modo, Trunc(DTPDesde.Date), Trunc(DTPHasta.Date));
end;

procedure TFPregAnaSumasYSaldos.ARecargarExecute(Sender: TObject);
begin
  DMRAnaSumasySaldos.MinPlanContable;
  EFPlanContable.Text := DMRAnaSumasySaldos.PlanContableMin;
  Recargar;
end;

procedure TFPregAnaSumasYSaldos.TButtConfigurarClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(26, formato, cabecera, copias,
     pijama, '', DMRAnaSumasySaldos.frSumasySaldos);
end;

procedure TFPregAnaSumasYSaldos.EFDesdeChange(Sender: TObject);
begin
  DMRAnaSumasySaldos.Actualiza_CentroCoste(DMRAnaSumasySaldos.xCC_Desde, EFDesde.Text);
end;

procedure TFPregAnaSumasYSaldos.EFHastaChange(Sender: TObject);
begin
  DMRAnaSumasySaldos.Actualiza_CentroCoste(DMRAnaSumasySaldos.xCC_Hasta, EFHasta.Text);
end;

procedure TFPregAnaSumasYSaldos.FormShow(Sender: TObject);
begin
  DBLCBMoneda.SetFocus;
end;

procedure TFPregAnaSumasYSaldos.EnablePointCount;
begin
  // Añadir a los campos de Cuentas el punto para poder expandir
  FMain.AddComponentePunto(EFDesde);
  FMain.AddComponentePunto(EFHasta);

  // Ajustar el tamaño de la cuenta por EEC
  EFDesde.MaxLength := REntorno.DigitosSub;
  EFHasta.MaxLength := REntorno.DigitosSub;
end;

{ Liberar los campos de Cuentas }
procedure TFPregAnaSumasYSaldos.DisablePointCount;
begin
  FMain.DelComponentePunto(EFDesde);
  FMain.DelComponentePunto(EFHasta);
end;

procedure TFPregAnaSumasYSaldos.AMultiSeleccionExecute(Sender: TObject);
begin
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFPregAnaSumasYSaldos.DTPHastaExit(Sender: TObject);
begin
  inherited;
  if (DTPDesde.Date > DTPHasta.Date) then
     DTPHasta.Date := DTPDesde.Date;
end;

procedure TFPregAnaSumasYSaldos.CBNivelFiltroChange(Sender: TObject);
begin
  inherited;
  if (CBNivelFiltro.ItemIndex = 0) then
  begin
     //Selecciona no filtrar
     ESeccionD.Text := '';
     ESeccionH.Text := '';
     ESeccionD.Enabled := False;
     ESeccionH.Enabled := False;
  end
  else
  begin
     //Selecciona no filtrar
     ESeccionD.Text := '';
     ESeccionH.Text := '';
     ESeccionD.Enabled := True;
     ESeccionH.Enabled := True;
  end;
end;

procedure TFPregAnaSumasYSaldos.ESeccionDChange(Sender: TObject);
begin
  inherited;
  DMRAnaSumasySaldos.SeccionDesde := ESeccionD.Text;
end;

procedure TFPregAnaSumasYSaldos.ESeccionHChange(Sender: TObject);
begin
  inherited;
  DMRAnaSumasySaldos.SeccionHasta := ESeccionH.Text;
end;

procedure TFPregAnaSumasYSaldos.EFDesdeBusqueda(Sender: TObject);
begin
  inherited;
  EFDesde.CondicionBusqueda := 'PLAN_CONTABLE=''' + EFPlanContable.Text + '''';
end;

procedure TFPregAnaSumasYSaldos.EFHastaBusqueda(Sender: TObject);
begin
  inherited;
  EFHasta.CondicionBusqueda := 'PLAN_CONTABLE=''' + EFPlanContable.Text + '''';
end;

procedure TFPregAnaSumasYSaldos.Recargar;
begin
  DMRAnaSumasySaldos.Rangos;
  DTPDesde.Date := DMRAnaSumasySaldos.Fecha_Desde;
  DTPHasta.Date := DMRAnaSumasySaldos.Fecha_Hasta;
  EFDesde.Text := DMRAnaSumasySaldos.CentroCoste_Desde;
  EFHasta.Text := DMRAnaSumasySaldos.CentroCoste_Hasta;

  DMRAnaSumasySaldos.LlenarNiveles;
  CBDesde.Items := DMRAnaSumasySaldos.Niveles;
  CBDesde.Items.Insert(0, _('Todos'));
  CBDesde.ItemIndex := 1;

  CBNivelFiltro.Items := DMRAnaSumasySaldos.Niveles;
  CBNivelFiltro.Items.Insert(0, _('No Filtrar'));
  CBNivelFiltro.ItemIndex := 0;
  CBNivelFiltroChange(CBNivelFiltro);

  CBHasta.Items := DMRAnaSumasySaldos.Niveles;
  CBHasta.ItemIndex := CBHasta.Items.Count - 1;

  DBLCBMoneda.KeyValue := REntorno.Moneda;

  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);
  Canal := REntorno.Canal;
end;

procedure TFPregAnaSumasYSaldos.EFPlanContableChange(Sender: TObject);
begin
  inherited;
  DMRAnaSumasYSaldos.Actualiza_Plan(EFPlanContable.Text);
  Recargar;
end;

end.
