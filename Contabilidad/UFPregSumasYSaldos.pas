unit UFPregSumasYSaldos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DBCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  rxToolEdit, ULFCheckBox, ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, ULFEdit, UFPEditListadoSimple;

type
  TFPregSumasYSaldos = class(TFPEditListadoSimple)
     PMonedas: TLFPanel;
     PCuentas: TLFPanel;
     GBCuentas: TGroupBox;
     LDesdeCuenta: TLFLabel;
     LHastaCuenta: TLFLabel;
     EFDesde: TLFEditFind2000;
     EFHasta: TLFEditFind2000;
     PNivFecha: TLFPanel;
     TButtConfigurar: TToolButton;
     ECtaDesde: TLFEdit;
     ECtaHasta: TLFEdit;
     TBMulticanal: TToolButton;
     AMultiSeleccion: TAction;
     GBSeccion: TGroupBox;
     LHastaSeccion: TLFLabel;
     LDesdeSeccion: TLFLabel;
     LBNivel: TLFLabel;
     ESeccionD: TLFEdit;
     ESeccionH: TLFEdit;
     CBNivelFiltro: TLFComboBox;
     GBCentroDeCostes: TGroupBox;
     EFDigito1: TLFEditFind2000;
     EFDigito2: TLFEditFind2000;
     EFDigito3: TLFEditFind2000;
     EFDigito4: TLFEditFind2000;
     EFDigito5: TLFEditFind2000;
     GBNiveles: TGroupBox;
     LBNivelD: TLFLabel;
     LBNivelH: TLFLabel;
     CBDesde: TLFComboBox;
     CBHasta: TLFComboBox;
     GBFechas: TGroupBox;
     LBFechaD: TLFLabel;
     LBFechaH: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     GBOpciones: TGroupBox;
     CheckSaldoCero: TLFCheckBox;
     ChkBSaldosApertura: TLFCheckBox;
     ChkBNoCierre: TLFCheckBox;
     ChkBNoReg: TLFCheckBox;
     DBLCBMoneda: TDBLookupComboBox;
     LMoneda: TLFLabel;
     CBPerdidas: TCheckBox;
     CBGanacias: TCheckBox;
     CBCierre: TCheckBox;
     CBPorMeses: TLFCheckBox;
     PNLOpciones: TLFPanel;
     TBExportar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBDesdeChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFDesdeChange(Sender: TObject);
     procedure EFHastaChange(Sender: TObject);
     procedure EFDesdeExit(Sender: TObject);
     procedure EFDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFHastaExit(Sender: TObject);
     procedure EFHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure DTPHastaExit(Sender: TObject);
     procedure CBNivelFiltroChange(Sender: TObject);
     procedure CBPorMesesChange(Sender: TObject);
  private
     { Private declarations }
     Canal: integer;
     ListaCanales: TStringList;
     Archivo: string;
     procedure EnablePointCount;
     procedure DisablePointCount;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure ExportarBalancesMensuales(Carpeta, Extension: string);
  end;

var
  FPregSumasYSaldos : TFPregSumasYSaldos;

implementation

uses UDMMain, UFormGest, UDMRSumasYSaldos, UEntorno, UFMListConfig, UDMListados,
  UUtiles, UFMain, UFMultiSeleccion, DateUtils, UFSendCorreo, UDameDato;

{$R *.DFM}

procedure TFPregSumasYSaldos.FormCreate(Sender: TObject);
begin
  inherited;
  Archivo := '';
  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  AbreData(TDMRSumasySaldos, DMRSumasySaldos);
  ARecargarExecute(Self);
  EnablePointCount;  // Habilitar el punto

  CBPorMeses.Checked := False;

  Grupo := 26;
  Listado := DMRSumasYSaldos.frSumasySaldos;
  ListadoFR3 := DMRSumasYSaldos.frxSumasySaldos;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
  if (REntorno.Pais = 'CHL') then
  begin
     CBDesde.ItemIndex := 4;
     CBHasta.ItemIndex := 3;
     CheckSaldoCero.Checked := False;
     ChkBSaldosApertura.Checked := True;
  end;
end;

procedure TFPregSumasYSaldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ListaCanales.Free;
  DisablePointCount;
  CierraData(DMRSumasySaldos);
end;

procedure TFPregSumasYSaldos.CBDesdeChange(Sender: TObject);
begin
  if (CBDesde.ItemIndex > CBHasta.ItemIndex) then
     CBHasta.ItemIndex := CBDesde.ItemIndex - 1;
  if (CBDesde.ItemIndex = 0) then
     CBHasta.Enabled := False
  else
     CBHasta.Enabled := True;
end;

procedure TFPregSumasYSaldos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  FechaDesde : TDateTime;
  FechaHasta : TDateTime;
  NivelDesde : smallint;
  NivelHasta : smallint;
begin
  FechaDesde := HourIntoDate(DTPDesde.Date, '00:00:00');
  FechaHasta := HourIntoDate(DTPHasta.Date, '23:59:59');
  // Normalizar las fechas
  DMListados.Normalizar_Desde_Hasta(FechaDesde, FechaHasta);

  if CBDesde.ItemIndex = 0 then
  begin
     NivelDesde := 1;
     NivelHasta := REntorno.NivelesCont;
  end
  else
  begin
     NivelDesde := CBDesde.ItemIndex;
     NivelHasta := CBHasta.ItemIndex + 1;
  end;

  with DMRSumasYSaldos do
  begin
     // Calcular el Informe de Sumas y Saldos
     try
        Screen.Cursor := crHourGlass;
        CalculaInforme(CheckSaldoCero.Checked, ChkBSaldosApertura.Checked,
           ChkBNoReg.Checked, ChkBNoCierre.Checked, ListaCanales, Canal,
           EFDigito1.Text, EFDigito2.Text, EFDigito3.Text, EFDigito4.Text,
           EFDigito5.Text, FechaDesde, FechaHasta, EFDesde.Text, EFHasta.Text,
           CBNivelFiltro.ItemIndex, NivelDesde, NivelHasta, ESeccionD.Text,
           ESeccionH.Text, CBPorMeses.Checked, CBPerdidas.Checked, CBGanacias.Checked,
           CBCierre.Checked);
     finally
        Screen.Cursor := crDefault;
     end;
  end;

  DMRSumasYSaldos.MostrarListado(Modo, FechaDesde, FechaHasta, CBPorMeses.Checked, Archivo, PBListado);
end;

procedure TFPregSumasYSaldos.ARecargarExecute(Sender: TObject);
var
  FechaDesde, FechaHasta : TDateTime;
  CuentaDesde, CuentaHasta : string;
begin
  CBPorMeses.Checked := False;
  CBPorMesesChange(Sender);

  DMRSumasySaldos.Rangos(FechaDesde, FechaHasta, CuentaDesde, CuentaHasta);
  CBDesde.Items := TSLNiveles;
  CBDesde.ItemIndex := 1;
  CBNivelFiltro.Items := TSLNiveles;
  CBNivelFiltro.Items.Delete(0); // Borramos el item correspondiente a 'Todos'
  CBNivelFiltro.Items.Insert(0, _('No Filtrar'));
  CBNivelFiltro.ItemIndex := 0;
  CBNivelFiltroChange(CBNivelFiltro);

  CBHasta.Items := TSLNiveles;
  CBHasta.Items.Delete(0);  // Borramos el  item correspondiente a 'Todos'
  CBHasta.ItemIndex := CBHasta.Items.Count - 1;

  DTPDesde.Date := FechaDesde;
  DTPHasta.Date := FechaHasta;

  EFDesde.Text := CuentaDesde;
  EFHasta.Text := CuentaHasta;

  DBLCBMoneda.KeyValue := REntorno.Moneda;
  ChkBSaldosApertura.Checked := True;

  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);
  Canal := REntorno.Canal;
end;

procedure TFPregSumasYSaldos.EFDesdeChange(Sender: TObject);
begin
  ECtaDesde.Text := DameTituloCuenta(EFDesde.Text);
end;

procedure TFPregSumasYSaldos.EFHastaChange(Sender: TObject);
begin
  ECtaHasta.Text := DameTituloCuenta(EFHasta.Text);
end;

procedure TFPregSumasYSaldos.EFDesdeExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFDesde);
end;

procedure TFPregSumasYSaldos.EFDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFDesde);
end;

procedure TFPregSumasYSaldos.EFHastaExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFHasta);
end;

procedure TFPregSumasYSaldos.EFHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFHasta);
end;

procedure TFPregSumasYSaldos.FormShow(Sender: TObject);
begin
  DBLCBMoneda.SetFocus;
end;

procedure TFPregSumasYSaldos.EnablePointCount;
begin
  // Añadir a los campos de Cuentas el punto para poder expandir
  FMain.AddComponentePunto(EFDesde);
  FMain.AddComponentePunto(EFHasta);

  // Ajustar el tamaño de la cuenta por EEC
  EFDesde.MaxLength := REntorno.DigitosSub;
  EFHasta.MaxLength := REntorno.DigitosSub;
end;

procedure TFPregSumasYSaldos.DisablePointCount;
begin
  // Liberar los campos de Cuentas
  FMain.DelComponentePunto(EFDesde);
  FMain.DelComponentePunto(EFHasta);
end;

procedure TFPregSumasYSaldos.AMultiSeleccionExecute(Sender: TObject);
begin
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFPregSumasYSaldos.DTPHastaExit(Sender: TObject);
begin
  inherited;
  if (DTPDesde.Date > DTPHasta.Date) then
     DTPHasta.Date := DTPDesde.Date;
end;

procedure TFPregSumasYSaldos.CBNivelFiltroChange(Sender: TObject);
begin
  inherited;
  if (CBNivelFiltro.ItemIndex = 0) then
  begin
     // Selecciona no filtrar
     ESeccionD.Text := '';
     ESeccionH.Text := '';
     ESeccionD.Enabled := False;
     ESeccionH.Enabled := False;
  end
  else
  begin
     // Selecciona no filtrar
     ESeccionD.Text := '';
     ESeccionH.Text := '';
     ESeccionD.Enabled := True;
     ESeccionH.Enabled := True;
  end;
end;

procedure TFPregSumasYSaldos.CBPorMesesChange(Sender: TObject);
var
  FechaDesde, FechaHasta : TDateTime;
  CuentaDesde, CuentaHasta : string;
begin
  inherited;
  if (CBPorMeses.Checked) then
     Grupo := 207
  else
     Grupo := 26;

  // Especial Chile
  if (REntorno.Pais = 'CHL') then
  begin
     if (CBPorMeses.Checked) then
     begin
        EFDesde.Text := DMRSumasySaldos.DameCuentaMinMax('MIN', '3');
        EFHasta.Text := DMRSumasySaldos.DameCuentaMinMax('MAX', '4');
     end
     else
     begin
        DMRSumasySaldos.Rangos(FechaDesde, FechaHasta, CuentaDesde, CuentaHasta);
        EFDesde.Text := CuentaDesde;
        EFHasta.Text := CuentaHasta;
     end;
  end;
end;

procedure TFPregSumasYSaldos.ExportarBalancesMensuales(Carpeta, Extension: string);
var
  i : integer;
var
  Min, Max : string;
begin
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Exportado Fichero ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando datos ...'));

     try
        PMain.Enabled := False;
        ARecargar.Execute;
        CheckSaldoCero.Checked := False;
        ChkBSaldosApertura.Checked := True;
        ChkBNoReg.Checked := True;
        ChkBNoCierre.Checked := True;
        CBDesde.ItemIndex := 0;
        DameMinMax('CTA', Min, Max);
        EFDesde.Text := Min;
        EFHasta.Text := Max;

        for i := 1 to 12 do
        begin
           // Progreso
           FSendCorreo.Texto(format(_('Sumas y Saldos - Periodo: %d'), [i]));

           // Acumulados - Siempre desde el 01/01/EJER
           DTPDesde.Date := EncodeDate(REntorno.Ejercicio, 1, 1);
           DTPHasta.Date := EncodeDate(REntorno.Ejercicio, i, DaysInAMonth(REntorno.Ejercicio, i));

           Archivo := Format(Carpeta + _('SumasYSaldos-%d-%2.2d-%s.%s'), [REntorno.Ejercicio, i, REntorno.CIFEmpresa, Extension]);
           MyImprimirPrevisualizar(Self, 2);
        end;
     finally
        PMain.Enabled := True;
        Archivo := '';
     end;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

end.
