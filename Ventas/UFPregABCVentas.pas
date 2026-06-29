unit UFPregABCVentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, ComCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, ToolWin, rxToolEdit,
  ULFCheckBox, ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  ULFDBCheckBox, rxPlacemnt, ULFFormStorage, ULFDateEdit, ULFEdit,
  UFPEditListadoSimple;

type
  TFPRegABCVentas = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     TBCalculos: TLFToolBar;
     CBCanales: TLFComboBox;
     ToolButton2: TToolButton;
     CBSeries: TLFComboBox;
     ToolButton3: TToolButton;
     CBBorrado: TLFCheckBox;
     TButtSep4: TToolButton;
     TButtAcumula: TToolButton;
     AAcumularABC: TAction;
     PNOpGenerales: TLFPanel;
     GBArticulo: TGroupBox;
     EFArticuloD: TLFEditFind2000;
     EArticuloD: TLFEdit;
     EFArticuloH: TLFEditFind2000;
     EArticuloH: TLFEdit;
     GBFamilia: TGroupBox;
     EFFamiliaD: TLFEditFind2000;
     EFamiliaD: TLFEdit;
     EFFamiliaH: TLFEditFind2000;
     EFamiliaH: TLFEdit;
     LBArtDesde: TLFLabel;
     LBArtHasta: TLFLabel;
     LBFamDesde: TLFLabel;
     LBFamHasta: TLFLabel;
     GBConsidera: TGroupBox;
     CBAlbaranesAbiertos: TLFCheckBox;
     CBAlbaranesCerrados: TLFCheckBox;
     CBFacturasAbiertas: TLFCheckBox;
     CBFacturasCerradas: TLFCheckBox;
     PNLPrincipal: TLFPanel;
     PCAbc: TLFPageControl;
     TSAgente: TTabSheet;
     PAgente: TLFPanel;
     LFechaCalculoAgentes: TLFLabel;
     LOrdenadoPorAgentes: TLFLabel;
     RGAgentes: TRadioGroup;
     EFAgrupacion: TLFEditFind2000;
     EFAgenteDesde: TLFEditFind2000;
     EAgenteDesde: TLFEdit;
     DBEAgrupacion: TLFDbedit;
     DTPFechaH: TLFDateEdit;
     DTPFechaD: TLFDateEdit;
     EFAgenteHasta: TLFEditFind2000;
     EAgenteHasta: TLFEdit;
     CBOrden: TLFComboBox;
     CBArticulos: TLFCheckBox;
     CBFamilias: TLFDBCheckBox;
     CBPrecioCeroAge: TLFDBCheckBox;
     EFAgrupacionAgeH: TLFEditFind2000;
     DBEAgrupacionAgeH: TLFDbedit;
     TSClientes: TTabSheet;
     PClientes: TLFPanel;
     LFechaCalculoClientes: TLFLabel;
     LOrdenadoPorClientes: TLFLabel;
     RGClientes: TRadioGroup;
     EFClienteDesde: TLFEditFind2000;
     EClienteDesde: TLFEdit;
     DBEAgrupacionCli: TLFDbedit;
     DTPFechahCli: TLFDateEdit;
     DTPFechadCli: TLFDateEdit;
     EFClienteHasta: TLFEditFind2000;
     EClienteHasta: TLFEdit;
     CBOrdenCli: TLFComboBox;
     EFAgrupacionCli: TLFEditFind2000;
     CBDetArtCli: TLFCheckBox;
     CBPorFamCli: TLFDBCheckBox;
     EFAgrupacionCliH: TLFEditFind2000;
     DBEAgrupacionCliH: TLFDbedit;
     CBPrecioCeroCli: TLFDBCheckBox;
     CBPorClientes: TLFDBCheckBox;
     TSArticulos: TTabSheet;
     PNArticulos: TLFPanel;
     LOrdenadoPorArticulos: TLFLabel;
     LFechaCalculoArticulos: TLFLabel;
     RGArticulos: TRadioGroup;
     CBOrdenArt: TLFComboBox;
     DTPFechadArt: TLFDateEdit;
     DTPFechahArt: TLFDateEdit;
     EFAgrupacionArt: TLFEditFind2000;
     DBETitAgrArt: TLFDbedit;
     EFAgrupacionArtH: TLFEditFind2000;
     DBETitAgrArtH: TLFDbedit;
     CBPrecioCeroArt: TLFDBCheckBox;
     EFDesdeCampanaKri: TLFEditFind2000;
     EFHastaCampanaKri: TLFEditFind2000;
     LDCampanaKri: TLFLabel;
     LHCampanaKri: TLFLabel;
     LSubFamiliaD: TLFLabel;
     LSubFamiliaH: TLFLabel;
     EFSubFamiliaD: TLFEditFind2000;
     ESubFamiliaD: TLFEdit;
     EFSubFamiliaH: TLFEditFind2000;
     ESubFamiliaH: TLFEdit;
     GBZona: TGroupBox;
     LZonaDesde: TLFLabel;
     LZonaHasta: TLFLabel;
     EFZonaD: TLFEditFind2000;
     EZonaD: TLFEdit;
     EFZonaH: TLFEditFind2000;
     EZonaH: TLFEdit;
     CBPorAgentes: TLFDBCheckBox;
     LDesdeCampanyaAgente: TLFLabel;
     EFDesdeCampanyaAgente: TLFEditFind2000;
     EFHastaCampanyaAgente: TLFEditFind2000;
     LHastaCampanyaAgente: TLFLabel;
     TBExportar: TToolButton;
     AABSHOT: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgenteDesdeChange(Sender: TObject);
     procedure RGAgentesClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFAgenteHastaChange(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure EFClienteDesdeChange(Sender: TObject);
     procedure EFClienteHastaChange(Sender: TObject);
     procedure EFAgrupacionCliChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure AAcumularABCExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure PCAbcChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure EFAgrupacionArtChange(Sender: TObject);
     procedure EFAgrupacionCliHChange(Sender: TObject);
     procedure EFAgrupacionAgeHChange(Sender: TObject);
     procedure EFAgrupacionArtHChange(Sender: TObject);
     procedure EFSubFamiliaDBusqueda(Sender: TObject);
     procedure EFSubFamiliaHBusqueda(Sender: TObject);
     procedure EFSubFamiliaDChange(Sender: TObject);
     procedure EFSubFamiliaHChange(Sender: TObject);
     procedure EFZonaDChange(Sender: TObject);
     procedure EFZonaHChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure AABSHOTExecute(Sender: TObject);
  private
     { Private declarations }
     semaforo_agente: integer;
     semaforo_cliente: integer;
     semaforo_articulo: integer;
     procedure Habilita;
     procedure Carga;
     procedure AcumularABC;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPRegABCVentas : TFPRegABCVentas;

implementation

uses UDMABCVentas, UDMMain, UUtiles, UDameDato, UFormGest, UEntorno, UFMListConfig, UFMSeleccion, URellenaLista;

{$R *.DFM}

procedure TFPRegABCVentas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMABCVentas, DMABCVentas);
  RellenaCanales(CBCanales.Items);
  RellenaSeries(CBSeries.Items);
  Carga;
  semaforo_agente := 0;
  semaforo_cliente := 0;
  semaforo_articulo := 0;

  Grupo := 0;
  Listado := DMABCVentas.frAbc;
  ListadoFR3 := DMABCVentas.frxAbc;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPRegABCVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMABCVentas);
end;

procedure TFPRegABCVentas.Carga;
var
  Desde, Hasta : TDateTime;
  Min, Max : integer;
  sMin, sMax : string;
begin
  PCAbc.ActivePage := TSAgente;

  // Agentes
  CBCanales.ItemIndex := 0;
  CBSeries.ItemIndex := 0;
  CBOrden.ItemIndex := 0;

  DameMinMax('AGE', Min, Max);
  EFAgenteDesde.Text := IntToStr(Min);
  EFAgenteHasta.Text := IntToStr(Max);

  DameMinMax('EJE', Desde, Hasta);
  DTPFechaD.Date := Desde;
  DTPFechaH.Date := Hasta;

  DameMinMax('AGE', sMin, sMax);
  EFAgrupacion.Text := sMin;
  EFAgrupacionAgeH.Text := sMax;

  DameMinMax('CAM', Min, Max);
  EFDesdeCampanyaAgente.Text := IntToStr(Min);
  EFHastaCampanyaAgente.Text := IntToStr(Max);

  // Clientes
  CBOrdenCli.ItemIndex := 0;

  DameMinMax('CLI', Min, Max);
  EFClienteDesde.Text := IntToStr(Min);
  EFClienteHasta.Text := IntToStr(Max);

  DTPFechaDCli.Date := Desde;
  DTPFechaHCli.Date := Hasta;

  DameMinMax('AGC', sMin, sMax);
  EFAgrupacionCli.Text := sMin;
  EFAgrupacionCliH.Text := sMax;

  DameMinMax('CAM', Min, Max);
  EFDesdeCampanaKri.Text := IntToStr(Min);
  EFHastaCampanaKri.Text := IntToStr(Max);

  // Articulos
  CBOrdenArt.ItemIndex := 0;

  DameMinMax('ART', sMin, sMax);
  EFArticuloD.Text := sMin;
  EFArticuloH.Text := sMax;

  DameMinMax('FAM', sMin, sMax);
  EFFamiliaD.Text := sMin;
  EFFamiliaH.Text := sMax;

  DTPFechaDArt.Date := Desde;
  DTPFechaHArt.Date := Hasta;

  DameMinMax('AGA', sMin, sMax);
  EFAgrupacionArt.Text := sMin;
  EFAgrupacionArtH.Text := sMax;

  // Habilita los EFinf corectos
  Habilita;
end;

procedure TFPRegABCVentas.Habilita;
begin
  if RGAgentes.ItemIndex = 0 then
  begin
     EFAgenteDesde.Visible := True;
     EAgenteDesde.Visible := True;
     EFAgenteHasta.Visible := True;
     EAgenteHasta.Visible := True;
     EFAgrupacion.Visible := False;
     DBEAgrupacion.Visible := False;
     CBArticulos.Enabled := True;
     CBFamilias.Enabled := True;
     EFAgrupacionAgeH.Visible := False;
     DBEAgrupacionAgeH.Visible := False;
     CBPorAgentes.Enabled := False;
     CBPorAgentes.State := cbUnChecked;
  end
  else
  begin
     EFAgenteDesde.Visible := False;
     EAgenteDesde.Visible := False;
     EFAgenteHasta.Visible := False;
     EAgenteHasta.Visible := False;
     EFAgrupacion.Visible := True;
     DBEAgrupacion.Visible := True;
     CBArticulos.State := cbUnChecked;
     CBFamilias.State := cbUnChecked;
     CBArticulos.Enabled := False;
     CBFamilias.Enabled := False;
     EFAgrupacionAgeH.Visible := True;
     DBEAgrupacionAgeH.Visible := True;
     CBPorAgentes.Enabled := True;
     CBPorAgentes.State := cbUnChecked;
  end;

  if RGClientes.ItemIndex = 0 then
  begin
     EFClienteDesde.Visible := True;
     EClienteDesde.Visible := True;
     EFClienteHasta.Visible := True;
     EClienteHasta.Visible := True;
     EFAgrupacionCli.Visible := False;
     DBEAgrupacionCli.Visible := False;
     EFAgrupacionCliH.Visible := False;
     DBEAgrupacionCliH.Visible := False;
     CBDetArtCli.Enabled := True;
     CBPorFamCli.Enabled := True;
     CBPorClientes.Enabled := False;
     CBPorClientes.State := cbUnChecked;
  end
  else
  begin
     EFClienteDesde.Visible := False;
     EClienteDesde.Visible := False;
     EFClienteHasta.Visible := False;
     EClienteHasta.Visible := False;
     EFAgrupacionCli.Visible := True;
     DBEAgrupacionCli.Visible := True;
     EFAgrupacionCliH.Visible := True;
     DBEAgrupacionCliH.Visible := True;
     CBDetArtCli.State := cbUnChecked;
     CBPorFamCli.State := cbUnChecked;
     CBDetArtCli.Enabled := False;
     CBPorFamCli.Enabled := False;
     CBPorClientes.Enabled := True;
     CBPorClientes.State := cbUnChecked;
  end;

  if RGArticulos.ItemIndex = 2 then
  begin
     CBOrdenArt.Items.Delete(0);
     CBOrdenArt.Items.Delete(1);
     CBOrdenArt.Items.Insert(0, _('Codigo Familia Ascendente'));
     CBOrdenArt.Items.Insert(1, _('Codigo Familia Descendente'));
  end
  else
  begin
     CBOrdenArt.Items.Delete(0);
     CBOrdenArt.Items.Delete(1);
     CBOrdenArt.Items.Insert(0, _('Codigo Artículo Ascendente'));
     CBOrdenArt.Items.Insert(1, _('Codigo Artículo Descendente'));
  end;

  CBOrdenArt.ItemIndex := 1;
  EFAgrupacionArt.Visible := RGArticulos.ItemIndex = 1;
  DBETitAgrArt.Visible := EFAgrupacionArt.Visible;
  EFAgrupacionArtH.Visible := EFAgrupacionArt.Visible;
  DBETitAgrArtH.Visible := EFAgrupacionArt.Visible;

  DMABCVentas.age_agrupado := RGAgentes.ItemIndex;
  DMABCVentas.art_agrupado := RGArticulos.ItemIndex;
  DMABCVentas.cli_agrupado := RGClientes.ItemIndex;
end;

procedure TFPRegABCVentas.EFAgenteDesdeChange(Sender: TObject);
begin
  EAgenteDesde.Text := DameTituloAgente(StrToIntDef(EFAgenteDesde.Text, 0));
end;

procedure TFPRegABCVentas.RGAgentesClick(Sender: TObject);
begin
  Habilita;
end;

procedure TFPRegABCVentas.AcumularABC;
var
  Alcance : smallint;
  Albaran : boolean;
  Canal, PorArticulos, PorFamilias, PorArticulosCli, PorFamiliasCli : integer;
  Serie : string;
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;

  Serie := '';
  if (CBSeries.ItemIndex > 0) then
  begin
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
  end;

  Canal := 0;
  if (CBCanales.ItemIndex > 0) then
     Canal := integer(CBCanales.Items.Objects[CBCanales.ItemIndex]);

  if CBArticulos.Checked then
     PorArticulos := 1
  else
     PorArticulos := 0;

  if CBFamilias.Checked then
     PorFamilias := 1
  else
     PorFamilias := 0;

  if CBDetArtCli.Checked then
     PorArticulosCli := 1
  else
     PorArticulosCli := 0;

  if CBPorFamCli.Checked then
     PorFamiliasCli := 1
  else
     PorFamiliasCli := 0;

  Alcance := 0;
  if (Canal = 0) then
  begin
     if (Serie = '') then
     begin
        Alcance := 2;
        Canal := REntorno.Canal;
        Serie := REntorno.Serie;
     end
     else
     if (Serie <> '') then
     begin
        Alcance := 3;
        Canal := REntorno.Canal;
     end;
  end
  else
  begin
     if (Serie = '') then
     begin
        Alcance := 1;
        Serie := REntorno.Serie;
     end
     else
     if (Serie <> '') then
     begin
        Alcance := 0;
     end;
  end;

  Albaran := False;
  if (CBAlbaranesAbiertos.Checked or CBAlbaranesCerrados.Checked) then
     Albaran := True;

  if (PCAbc.ActivePage = TSAgente) then
  begin
     semaforo_agente := 1;
     DMABCVentas.AcumulaAge(Canal, EFArticuloD.Text, EFArticuloH.Text, EFFamiliaD.Text, EFFamiliaH.Text, EFSubFamiliaD.Text, EFSubFamiliaH.Text, EFZonaD.Text, EFZonaH.Text,
        Serie, Alcance, StrToIntDef(EFAgenteDesde.Text, 0),
        StrToIntDef(EFAgenteHasta.Text, 0), PorArticulos, PorFamilias, EFAgrupacion.Text, EFAgrupacionAgeH.Text, RGAgentes.ItemIndex,
        CBBorrado.Checked, Trunc(DTPFechaD.Date), Trunc(DTPFechaH.Date), CBPrecioCeroAge.Checked, Albaran, CBAlbaranesAbiertos.Checked, CBAlbaranesCerrados.Checked, CBFacturasAbiertas.Checked, CBFacturasCerradas.Checked,
        CBPorAgentes.Checked, StrToIntDef(EFDesdeCampanyaAgente.Text, 0), StrToIntDef(EFHastaCampanyaAgente.Text, 0));
  end
  else
  if (PCAbc.ActivePage = TSClientes) then
  begin
     semaforo_cliente := 1;
     DMABCVentas.AcumulaCli(Canal, EFArticuloD.Text, EFArticuloH.Text, EFFamiliaD.Text,
        EFFamiliaH.Text, EFSubFamiliaD.Text, EFSubFamiliaH.Text, EFZonaD.Text, EFZonaH.Text, Serie, Alcance, StrToIntDef(EFClienteDesde.Text, 0),
        StrToIntDef(EFClienteHasta.Text, 0), PorFamiliasCli, PorArticulosCli, EFAgrupacionCli.Text, RGClientes.ItemIndex,
        CBBorrado.Checked, Trunc(DTPFechaDCli.Date), Trunc(DTPFechaHCli.Date), EFAgrupacionCliH.Text, CBPrecioCeroCli.Checked, Albaran, CBAlbaranesAbiertos.Checked, CBAlbaranesCerrados.Checked, CBFacturasAbiertas.Checked, CBFacturasCerradas.Checked,
        CBPorClientes.Checked, StrToIntDef(EFDesdeCampanaKri.Text, 0), StrToIntDef(EFHastaCampanaKri.Text, 0));
  end
  else
  if (PCAbc.ActivePage = TSArticulos) then
  begin
     semaforo_articulo := 1;
     DMABCVentas.AcumulaArt(Canal, EFarticuloD.Text, EFArticuloH.Text, EFFamiliaD.Text, EFFamiliaH.Text, EFSubFamiliaD.Text, EFSubFamiliaH.Text, EFZonaD.Text, EFZonaH.Text, Serie, Alcance,
        EFAgrupacionArt.Text, EFAgrupacionArtH.Text, RGArticulos.ItemIndex, CBBorrado.Checked, Trunc(DTPFechaDArt.Date), Trunc(DTPFechaHArt.Date),
        CBPrecioCeroArt.Checked, Albaran, CBAlbaranesAbiertos.Checked, CBAlbaranesCerrados.Checked, CBFacturasAbiertas.Checked, CBFacturasCerradas.Checked);
  end;

  TButtPrevisualizar.Enabled := True;
  TButtImprimir.Enabled := True;
end;

procedure TFPRegABCVentas.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Carga;
end;

procedure TFPRegABCVentas.EFAgenteHastaChange(Sender: TObject);
begin
  EAgenteHasta.Text := DameTituloAgente(StrToIntDef(EFAgenteHasta.Text, 0));
end;

procedure TFPRegABCVentas.CBCanalesChange(Sender: TObject);
begin
  if CBCanales.ItemIndex = 0 then
     CBSeries.ItemIndex := 0;
end;

procedure TFPRegABCVentas.CBSeriesChange(Sender: TObject);
begin
  // if CBCanales.ItemIndex = 0 then CBSeries.ItemIndex := 0;
end;

procedure TFPRegABCVentas.EFClienteDesdeChange(Sender: TObject);
begin
  EClienteDesde.Text := DameTituloCliente(StrToIntDef(EFClienteDesde.Text, 0));
end;

procedure TFPRegABCVentas.EFClienteHastaChange(Sender: TObject);
begin
  EClienteHasta.Text := DameTituloCliente(StrToIntDef(EFClienteHasta.Text, 0));
end;

procedure TFPRegABCVentas.EFAgrupacionCliChange(Sender: TObject);
begin
  DMABCVentas.CambiaAgrupacionCli(EFAgrupacionCli.Text);
end;

procedure TFPRegABCVentas.EFArticuloDChange(Sender: TObject);
begin
  EArticuloD.Text := DameTituloArticulo(EFArticuloD.Text);
end;

procedure TFPRegABCVentas.EFArticuloHChange(Sender: TObject);
begin
  EArticuloH.Text := DameTituloArticulo(EFArticuloH.Text);
end;

procedure TFPRegABCVentas.EFFamiliaDChange(Sender: TObject);
begin
  EFamiliaD.Text := DameTituloFamilia(EFFamiliaD.Text);
end;

procedure TFPRegABCVentas.EFFamiliaHChange(Sender: TObject);
begin
  EFamiliaH.Text := DameTituloFamilia(EFFamiliaH.Text);
end;

procedure TFPRegABCVentas.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentas.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentas.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentas.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

// Acumular ABCs
procedure TFPRegABCVentas.AAcumularABCExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     AcumularABC;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFPRegABCVentas.FormShow(Sender: TObject);
begin
  EFAgenteDesde.SetFocus;
end;

procedure TFPRegABCVentas.PCAbcChange(Sender: TObject);
begin
  if PcABC.ActivePage = TSAgente then
     if semaforo_agente = 0 then
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := False;
        TButtImprimir.Enabled := False;
     end
     else
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := True;
        TButtImprimir.Enabled := True;
     end;
  if PcABC.ActivePage = TSArticulos then
     if semaforo_articulo = 0 then
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := False;
        TButtImprimir.Enabled := False;
     end
     else
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := True;
        TButtImprimir.Enabled := True;
     end;
  if PcABC.ActivePage = TSClientes then
     if semaforo_cliente = 0 then
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := False;
        TButtImprimir.Enabled := False;
     end
     else
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := True;
        TButtImprimir.Enabled := True;
     end;
end;

procedure TFPRegABCVentas.EFAgrupacionChange(Sender: TObject);
begin
  DMABCVentas.CambiaAgrupacionAge(EFAgrupacion.Text);
end;

procedure TFPRegABCVentas.EFAgrupacionArtChange(Sender: TObject);
begin
  DMABCVentas.CambiaAgrupacionArt(EFAgrupacionArt.Text);
end;

procedure TFPRegABCVentas.EFAgrupacionCliHChange(Sender: TObject);
begin
  inherited;
  DMABCVentas.CambiaAgrupacionCliH(EFAgrupacionCliH.Text);
end;

procedure TFPRegABCVentas.EFAgrupacionAgeHChange(Sender: TObject);
begin
  inherited;
  DMABCVentas.CambiaAgrupacionAgeH(EFAgrupacionAgeH.Text);
end;

procedure TFPRegABCVentas.EFAgrupacionArtHChange(Sender: TObject);
begin
  DMABCVentas.CambiaAgrupacionArtH(EFAgrupacionArtH.Text);
end;

procedure TFPRegABCVentas.EFSubFamiliaDBusqueda(Sender: TObject);
begin
  inherited;
  EFSubFamiliaD.CondicionBusqueda := 'id_familia = ' + IntToStr(DameIDFamilia(EFFamiliaD.Text));
end;

procedure TFPRegABCVentas.EFSubFamiliaHBusqueda(Sender: TObject);
begin
  inherited;
  EFSubFamiliaH.CondicionBusqueda := 'id_familia = ' + IntToStr(DameIDFamilia(EFFamiliaH.Text));
end;

procedure TFPRegABCVentas.EFSubFamiliaDChange(Sender: TObject);
begin
  inherited;
  ESubFamiliaD.Text := DameTituloSubfamilia(EFSubFamiliaD.Text, EFFamiliaD.Text);
end;

procedure TFPRegABCVentas.EFSubFamiliaHChange(Sender: TObject);
begin
  inherited;
  ESubFamiliaH.Text := DameTituloSubfamilia(EFSubFamiliaH.Text, EFFamiliaH.Text);
end;

procedure TFPRegABCVentas.EFZonaDChange(Sender: TObject);
begin
  inherited;
  EZonaD.Text := DameTituloZona(EFZonaD.Text);
end;

procedure TFPRegABCVentas.EFZonaHChange(Sender: TObject);
begin
  inherited;
  EZonaH.Text := DameTituloZona(EFZonaH.Text);
end;

procedure TFPRegABCVentas.AConfigurarExecute(Sender: TObject);
begin
  Grupo := 64;
  if PCAbc.ActivePage = TSClientes then
     Grupo := 65;
  if ((PCAbc.ActivePage = TSArticulos) and (RGArticulos.ItemIndex in [0, 1])) then
     Grupo := 66
  else
  if ((PCAbc.ActivePage = TSArticulos) and (RGArticulos.ItemIndex = 2)) then
     Grupo := 514;

  inherited;
end;

procedure TFPRegABCVentas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if PcABC.ActivePage = TSAgente then
     DMABCVentas.Muestra(Modo, 0, CBOrden.ItemIndex,
        RGAgentes.ItemIndex, DTPFechaD.Date, DTPFechaH.Date);
  if PcABC.ActivePage = TSClientes then
     DMABCVentas.Muestra(Modo, 1, CBOrdenCli.ItemIndex,
        RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date);
  if PcABC.ActivePage = TSArticulos then
     DMABCVentas.Muestra(Modo, 2, CBOrdenArt.ItemIndex,
        RGArticulos.ItemIndex, DTPFechaDArt.Date, DTPFechaHArt.Date);
end;

procedure TFPRegABCVentas.AABSHOTExecute(Sender: TObject);
var
  Periodo : string;
  Min, Max : TDateTime;
  Dummy : TDateTime;
begin
  inherited;
  if PideDato('PER', Periodo, '', ' PERIODO BETWEEN ''01'' AND ''12'' ') then
  begin
     Periodo := 'P' + Periodo;

     PCAbc.ActivePage := TSClientes;
     CBPrecioCeroCli.Checked := True;
     CBDetArtCli.Checked := False;
     CBPorFamCli.Checked := False;

     DameMinMax(Periodo, Min, Max);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'ABR';
     EFFamiliaH.Text := 'ABR';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo);

     // ----------------------------------------

     DameMinMax('EJE', Min, Dummy);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'ABR';
     EFFamiliaH.Text := 'ABR';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo + '-EJE');

     // ----------------------------------------

     DameMinMax(Periodo, Min, Max);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'MIC';
     EFFamiliaH.Text := 'MIC';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo);

     // ----------------------------------------

     DameMinMax('EJE', Min, Dummy);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'MIC';
     EFFamiliaH.Text := 'MIC';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo + '-EJE');

     // ----------------------------------------

     DameMinMax(Periodo, Min, Max);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'GRA';
     EFFamiliaH.Text := 'GRA';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo);

     // ----------------------------------------

     DameMinMax('EJE', Min, Dummy);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'GRA';
     EFFamiliaH.Text := 'GRA';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo + '-EJE');

     // ----------------------------------------

     DameMinMax(Periodo, Min, Max);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'VIB';
     EFFamiliaH.Text := 'VIB';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo);

     // ----------------------------------------

     DameMinMax('EJE', Min, Dummy);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     EFFamiliaD.Text := 'VIB';
     EFFamiliaH.Text := 'VIB';
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-Fam_' + EFFamiliaD.Text + '-' + Periodo + '-EJE');

     // ----------------------------------------

     Carga;

     // ----------------------------------------

     PCAbc.ActivePage := TSClientes;
     CBPrecioCeroCli.Checked := True;
     CBDetArtCli.Checked := True;
     CBPorFamCli.Checked := False;

     DameMinMax(Periodo, Min, Max);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-DetArt-' + Periodo);

     // ----------------------------------------

     DameMinMax('EJE', Min, Dummy);
     DTPFechadCli.Date := Min;
     DTPFechahCli.Date := Max;
     AcumularABC;
     DMABCVentas.Muestra(0, 1, CBOrdenCli.ItemIndex, RGClientes.ItemIndex, DTPFechaDCli.Date, DTPFechaHCli.Date, '-DetArt-' + Periodo + '-EJE');

     // ----------------------------------------
  end;
end;

end.
