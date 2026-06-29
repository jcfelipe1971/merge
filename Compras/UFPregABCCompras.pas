unit UFPregABCCompras;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, ComCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, ToolWin, rxToolEdit,
  ULFCheckBox, ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  rxPlacemnt, ULFFormStorage, ULFDateEdit, UFPEditListadoSimple, ULFEdit,
  ULFDBCheckBox;

type
  TFPRegABCCompras = class(TFPEditListadoSimple)
     PCAbc: TLFPageControl;
     TButtConfigurar: TToolButton;
     TSProveedores: TTabSheet;
     PClientes: TLFPanel;
     LFechaCalculoProveedores: TLFLabel;
     LOrdenadoPorProveedores: TLFLabel;
     RGProveedores: TRadioGroup;
     EFProveedorDesde: TLFEditFind2000;
     EProveedorDesde: TLFEdit;
     DTPFechahPro: TLFDateEdit;
     DTPFechadPro: TLFDateEdit;
     EFProveedorHasta: TLFEditFind2000;
     EProveedorHasta: TLFEdit;
     CBOrdenPro: TLFComboBox;
     TSArticulos: TTabSheet;
     TBCalculos: TLFToolBar;
     CBCanales: TLFComboBox;
     ToolButton2: TToolButton;
     CBSeries: TLFComboBox;
     ToolButton3: TToolButton;
     CBBorrado: TLFCheckBox;
     TButtSep4: TToolButton;
     TButtAcumula: TToolButton;
     PNArticulos: TLFPanel;
     RGArticulos: TRadioGroup;
     CBOrdenArt: TLFComboBox;
     LOrdenadoPorArticulos: TLFLabel;
     LFechaCalculoArticulos: TLFLabel;
     DTPFechadArt: TLFDateEdit;
     DTPFechahArt: TLFDateEdit;
     AAcumularABC: TAction;
     TSAcreedor: TTabSheet;
     LFechaCalculoAcreedores: TLFLabel;
     DTPFechaDAcr: TLFDateEdit;
     DTPFechaHAcr: TLFDateEdit;
     LOrdenadoPorAcreedores: TLFLabel;
     CBOrdenAcr: TLFComboBox;
     RGAcreedores: TRadioGroup;
     EFAcreedorD: TLFEditFind2000;
     EFAcreedorH: TLFEditFind2000;
     DBEAcreFin: TLFDbedit;
     DBEAcreIni: TLFDbedit;
     LBAcreedor: TStaticText;
     EFAgrupacion: TLFEditFind2000;
     DBEAgrupacion: TLFDbedit;
     PNLPNOpGenerales: TLFPanel;
     grpGBArticulo: TGroupBox;
     LBArtDesde: TLFLabel;
     LBArtHasta: TLFLabel;
     EFArticuloD: TLFEditFind2000;
     EArticuloD: TLFEdit;
     EFArticuloH: TLFEditFind2000;
     EArticuloH: TLFEdit;
     grpGBFamilia: TGroupBox;
     LBFamDesde: TLFLabel;
     LBFamHasta: TLFLabel;
     LSubFamiliaD: TLFLabel;
     LSubFamiliaH: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     EFamiliaD: TLFEdit;
     EFFamiliaH: TLFEditFind2000;
     EFamiliaH: TLFEdit;
     EFSubFamiliaD: TLFEditFind2000;
     ESubFamiliaD: TLFEdit;
     EFSubFamiliaH: TLFEditFind2000;
     ESubFamiliaH: TLFEdit;
     grpGBConsidera: TGroupBox;
     CBAlbaranesAbiertos: TLFCheckBox;
     CBAlbaranesCerrados: TLFCheckBox;
     CBFacturasAbiertas: TLFCheckBox;
     CBFacturasCerradas: TLFCheckBox;
     grpGBZona: TGroupBox;
     LZonaDesde: TLFLabel;
     LZonaHasta: TLFLabel;
     EFZonaD: TLFEditFind2000;
     EZonaD: TLFEdit;
     EFZonaH: TLFEditFind2000;
     EZonaH: TLFEdit;
     CBDetArt: TLFCheckBox;
     CBPorFam: TLFDBCheckBox;
     CBPorProveedor: TLFDBCheckBox;
     CBPrecioCeroPro: TLFDBCheckBox;
     TBExportar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBCanalesChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure EFProveedorDesdeChange(Sender: TObject);
     procedure EFProveedorHastaChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure RGHabilitaClick(Sender: TObject);
     procedure AAcumularABCExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFAcreedorDChange(Sender: TObject);
     procedure EFAcreedorHChange(Sender: TObject);
     procedure PCAbcChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure EFSubFamiliaDChange(Sender: TObject);
     procedure EFSubFamiliaHChange(Sender: TObject);
     procedure EFSubFamiliaDBusqueda(Sender: TObject);
     procedure EFSubFamiliaHBusqueda(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     semaforo_proveedor: integer;
     semaforo_acreedor: integer;
     semaforo_articulo: integer;
     procedure Habilita;
     procedure Carga;
     procedure AcumularABC;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPRegABCCompras : TFPRegABCCompras;

implementation

uses UDMABCCompras, UFormGest, UEntorno, UDameDato, UFMListConfig, UDMMain, URellenaLista;

{$R *.DFM}

procedure TFPRegABCCompras.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMABCCompras, DMABCCompras);
  RellenaCanales(CBCanales.Items);
  RellenaSeries(CBSeries.Items);
  Carga;
  semaforo_proveedor := 0;
  semaforo_acreedor := 0;
  semaforo_articulo := 0;

  Grupo := 0;
  Listado := DMABCCompras.frAbc;
  ListadoFR3 := DMABCCompras.frxAbc;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPRegABCCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMABCCompras);
end;

procedure TFPRegABCCompras.Carga;
begin
  PCAbc.ActivePage := TSProveedores;
  CBCanales.ItemIndex := 0;
  CBSeries.ItemIndex := 0;

  //Acreedores
  DTPFechaDAcr.Date := DMABCCompras.FechaEjercicio;
  DTPFechaHAcr.Date := REntorno.FechaTrabSH;
  EFAcreedorD.Text := '-1';
  EFAcreedorH.Text := IntToStr(DMABCCompras.DameAcreedor);
  CBOrdenAcr.ItemIndex := 0;

  // Proveedores
  CBOrdenPro.ItemIndex := 0;
  EFProveedorDesde.Text := '-1';
  EFProveedorHasta.Text := IntToStr(DMABCCompras.DameProveedor);
  DTPFechaDPro.Date := DMABCCompras.FechaEjercicio;
  DTPFechaHPro.Date := REntorno.FechaTrabSH;
  EFAgrupacion.Text := DMABCCompras.DameAgrupacionProv(EFAgrupacion.Text);

  // Articulos
  CBOrdenArt.ItemIndex := 0;
  EFArticuloD.Text := DMABCCompras.DameArticuloMin;
  EFArticuloH.Text := DMABCCompras.DameArticuloMax;
  EFFamiliaD.Text := DMABCCompras.DameFamiliaMin;
  EFFamiliaH.Text := DMABCCompras.DameFamiliaMax;
  DTPFechaDArt.Date := DMABCCompras.FechaEjercicio;
  DTPFechaHArt.Date := REntorno.FechaTrabSH;

  // Habilita los EFind correctos
  Habilita;
end;

procedure TFPRegABCCompras.Habilita;
begin
  if RGProveedores.ItemIndex = 0 then
  begin
     EFProveedorDesde.Visible := True;
     EProveedorDesde.Visible := True;
     EFProveedorHasta.Visible := True;
     EProveedorHasta.Visible := True;
     EFAgrupacion.Visible := False;
     DBEAgrupacion.Visible := False;
  end
  else
  begin
     EFProveedorDesde.Visible := False;
     EProveedorDesde.Visible := False;
     EFProveedorHasta.Visible := False;
     EProveedorHasta.Visible := False;
     EFAgrupacion.Visible := True;
     DBEAgrupacion.Visible := True;
  end;
  DMABCCompras.prov_agrupado := RGProveedores.ItemIndex;
end;

procedure TFPRegABCCompras.RGHabilitaClick(Sender: TObject);
begin
  Habilita;
end;

// Acumular ABCs
procedure TFPRegABCCompras.AcumularABC;
var
  Alcance : smallint;
  Albaran : boolean;
  Canal : integer;
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

  if (PCAbc.ActivePage = TSProveedores) then
  begin
     // ABC de Proveedores
     semaforo_proveedor := 1;
     DMABCCompras.AcumulaPro(Canal, Serie, EFAgrupacion.Text, Alcance, StrToIntDef(EFProveedorDesde.Text, 0),
        StrToIntDef(EFProveedorHasta.Text, 0), RGProveedores.ItemIndex, EFarticuloD.Text,
        EFArticuloH.Text, EFFamiliaD.Text, EFFamiliaH.Text, EFSubFamiliaD.Text, EFSubFamiliaH.Text,
        CBBorrado.Checked, Trunc(DTPFechaDPro.Date), Trunc(DTPFechaHPro.Date), Albaran,
        CBAlbaranesAbiertos.Checked, CBAlbaranesCerrados.Checked, CBFacturasAbiertas.Checked, CBFacturasCerradas.Checked,
        CBDetArt.Checked, CBPorFam.Checked, CBPorProveedor.Checked, CBPrecioCeroPro.Checked, RGProveedores.ItemIndex);
  end
  else
  if (PCAbc.ActivePage = TSAcreedor) then
  begin
     // ABC de Acreedores
     semaforo_acreedor := 1;
     DMABCCompras.AcumulaAcr(Canal, Serie, Alcance, StrToIntDef(EFAcreedorD.Text, 0),
        StrToIntDef(EFAcreedorH.Text, 0),
        CBBorrado.Checked, Trunc(DTPFechaDAcr.Date), Trunc(DTPFechaHAcr.Date));
  end
  else
  if (PCAbc.ActivePage = TSArticulos) then
  begin
     // ABC de Artículos
     semaforo_articulo := 1;
     DMABCCompras.AcumulaArt(Canal, Serie, Alcance, EFarticuloD.Text,
        EFArticuloH.Text, EFFamiliaD.Text, EFFamiliaH.Text, EFSubFamiliaD.Text, EFSubFamiliaH.Text,
        RGArticulos.ItemIndex, CBBorrado.Checked, Trunc(DTPFechaDArt.Date), Trunc(DTPFechaHArt.Date), Albaran,
        CBAlbaranesAbiertos.Checked, CBAlbaranesCerrados.Checked, CBFacturasAbiertas.Checked, CBFacturasCerradas.Checked);
  end;

  TButtPrevisualizar.Enabled := True;
  TButtImprimir.Enabled := True;
end;

procedure TFPRegABCCompras.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Carga;
end;

procedure TFPRegABCCompras.CBCanalesChange(Sender: TObject);
begin
  if CBCanales.ItemIndex = 0 then
     CBSeries.ItemIndex := 0;
end;

procedure TFPRegABCCompras.CBSeriesChange(Sender: TObject);
begin
  // if cbcanales.ItemIndex = 0 then cbseries.ItemIndex := 0;
end;

procedure TFPRegABCCompras.EFProveedorDesdeChange(Sender: TObject);
begin
  // DMABCCompras.CambiaProveedorD(StrToIntDef(EFProveedorDesde.Text, 0));
  EProveedorDesde.Text := DameTituloProveedor(StrToIntDef(EFProveedorDesde.Text, 0));
end;

procedure TFPRegABCCompras.EFProveedorHastaChange(Sender: TObject);
begin
  // DMABCCompras.CambiaProveedorH(StrToIntDef(EFProveedorHasta.Text, 0));
  EProveedorHasta.Text := DameTituloProveedor(StrToIntDef(EFProveedorHasta.Text, 0));
end;

procedure TFPRegABCCompras.EFArticuloDChange(Sender: TObject);
begin
  EArticuloD.Text := DameTituloArticulo(EFArticuloD.Text);
end;

procedure TFPRegABCCompras.EFArticuloHChange(Sender: TObject);
begin
  EArticuloH.Text := DameTituloArticulo(EFArticuloh.Text);
end;

procedure TFPRegABCCompras.EFFamiliaDChange(Sender: TObject);
begin
  EFamiliaD.Text := DameTituloFamilia(EFFamiliaD.Text);
end;

procedure TFPRegABCCompras.EFFamiliaHChange(Sender: TObject);
begin
  EFamiliaH.Text := DameTituloFamilia(EFFamiliaH.Text);
end;

procedure TFPRegABCCompras.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCCompras.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCCompras.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCCompras.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

// Acumular ABCs
procedure TFPRegABCCompras.AAcumularABCExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     AcumularABC;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFPRegABCCompras.FormShow(Sender: TObject);
begin
  EFProveedorDesde.SetFocus;
end;

procedure TFPRegABCCompras.EFAcreedorDChange(Sender: TObject);
begin
  DMABCCompras.CambiaAcreedorD(StrToIntDef(EFAcreedorD.Text, 0));
end;

procedure TFPRegABCCompras.EFAcreedorHChange(Sender: TObject);
begin
  DMABCCompras.CambiaAcreedorH(StrToIntDef(EFAcreedorH.Text, 0));
end;

procedure TFPRegABCCompras.PCAbcChange(Sender: TObject);
begin
  if PcABC.ActivePage = TSProveedores then
  begin
     if semaforo_proveedor = 0 then
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
  end
  else
  if PcABC.ActivePage = TSArticulos then
  begin
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
  end
  else
  if PcABC.ActivePage = TSAcreedor then
  begin
     if semaforo_acreedor = 0 then
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
end;

procedure TFPRegABCCompras.EFAgrupacionChange(Sender: TObject);
begin
  inherited;
  DMABCCompras.CambiaAgrupacionpROV(EFAgrupacion.Text);
end;

procedure TFPRegABCCompras.EFSubFamiliaDChange(Sender: TObject);
begin
  inherited;
  ESubFamiliaD.Text := DameTituloSubfamilia(EFSubFamiliaD.Text, EFFamiliaD.Text);
end;

procedure TFPRegABCCompras.EFSubFamiliaHChange(Sender: TObject);
begin
  inherited;
  ESubFamiliaH.Text := DameTituloSubfamilia(EFSubFamiliaH.Text, EFFamiliaH.Text);
end;

procedure TFPRegABCCompras.EFSubFamiliaDBusqueda(Sender: TObject);
begin
  inherited;
  EFSubFamiliaD.CondicionBusqueda := 'id_familia = ' + IntToStr(DameIDFamilia(EFFamiliaD.Text));
end;

procedure TFPRegABCCompras.EFSubFamiliaHBusqueda(Sender: TObject);
begin
  inherited;
  EFSubFamiliaH.CondicionBusqueda := 'id_familia = ' + IntToStr(DameIDFamilia(EFFamiliaH.Text));
end;

procedure TFPRegABCCompras.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if PcABC.ActivePage = TSProveedores then
     DMABCCompras.Muestra(Modo, 0, CBOrdenPro.ItemIndex,
        RGProveedores.ItemIndex, DTPFechaDPro.Date, DTPFechaHPro.Date);
  if PcABC.ActivePage = TSArticulos then
     DMABCCompras.Muestra(Modo, 1, CBOrdenArt.ItemIndex,
        RGArticulos.ItemIndex, DTPFechaDArt.Date, DTPFechaHArt.Date);
  if PcABC.ActivePage = TSAcreedor then
     DMABCCompras.Muestra(Modo, 2, CBOrdenAcr.ItemIndex,
        RGAcreedores.ItemIndex, DTPFechaDAcr.Date, DTPFechaHAcr.Date);
end;

procedure TFPRegABCCompras.AConfigurarExecute(Sender: TObject);
begin
  Grupo := 67;
  if PCAbc.ActivePage = TSArticulos then
  begin
     if RGArticulos.ItemIndex = 0 then
        Grupo := 68
     else
        Grupo := 168;
  end
  else
  if PCAbc.ActivePage = TSAcreedor then
     Grupo := 91;

  inherited;
end;

end.
