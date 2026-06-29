unit UFPregFichasArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEditListado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, UEditPanel, ToolWin, ActnList, Mask, DBCtrls,
  rxToolEdit, ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  ULFDateEdit, rxPlacemnt, ULFFormStorage, ULFEdit, UFPEditListadoSimple;

type
  TFPregFichasArticulos = class(TFPEditListadoSimple)
     GBPeriodo: TGroupBox;
     EFArticulo_H: TLFEditFind2000;
     EFArticulo_D: TLFEditFind2000;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     LHastaPeriodo: TLFLabel;
     DBEArt_Desde: TLFDbedit;
     DBEArt_Hasta: TLFDbedit;
     TButtConfiguracionRapida: TToolButton;
     LDesdePeriodo: TLFLabel;
     EFPeriodo_D: TLFEditFind2000;
     DBEPeriodoDesde: TLFDbedit;
     EFPeriodo_H: TLFEditFind2000;
     DBEPeriodoHasta: TLFDbedit;
     ChkBPeriodos: TLFCheckBox;
     ChkBFechas: TLFCheckBox;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LBLMovD: TLFLabel;
     LBLMovH: TLFLabel;
     EFMovD: TLFEditFind2000;
     DBEMovD: TLFDbedit;
     DBEMovH: TLFDbedit;
     CBFiltroMov: TLFCheckBox;
     EFMovH: TLFEditFind2000;
     CBEntradas: TLFCheckBox;
     CBSalidas: TLFCheckBox;
     CBFiltrar: TLFCheckBox;
     LBLClienteD: TLFLabel;
     EFClienteD: TLFEditFind2000;
     DBETitClienteD: TLFDbedit;
     LBLClienteH: TLFLabel;
     EFClienteH: TLFEditFind2000;
     DBETitClienteH: TLFDbedit;
     CBdireccion: TLFCheckBox;
     LDesdeCanal: TLFLabel;
     LHastaCanal: TLFLabel;
     EFCanalD: TLFEditFind2000;
     EFCanalH: TLFEditFind2000;
     DBECanadD: TLFDbedit;
     DBECanalH: TLFDbedit;
     LBLSerieD: TLFLabel;
     LBLSerieH: TLFLabel;
     CBFiltroSerie: TLFCheckBox;
     EFSerieD: TLFEditFind2000;
     EFSerieH: TLFEditFind2000;
     PNLFiltros: TLFPanel;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     EFFamiliaH: TLFEditFind2000;
     DBEFamiliaDesde: TLFDbedit;
     DBEFamiliaHasta: TLFDbedit;
     GBFiltros: TGroupBox;
     LDesdeAlmacen: TLFLabel;
     LHastaAlmacen: TLFLabel;
     EFAlmacen_D: TLFEditFind2000;
     EFAlmacen_H: TLFEditFind2000;
     DBEAlmacenDesde: TLFDbedit;
     DBEAlmacenHasta: TLFDbedit;
     CBStock: TLFCheckBox;
     LDesdeSubfamilia: TLFLabel;
     LHastaSubfamilia: TLFLabel;
     EFSubfamiliaD: TLFEditFind2000;
     EFSubfamiliaH: TLFEditFind2000;
     DBETituloSubfamiliaD: TLFEdit;
     DBETituloSubfamiliaH: TLFEdit;
     PNLLimites: TLFPanel;
     DBETitSerieD: TLFDbedit;
     DBETitSerieH: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargaExecute(Sender: TObject);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure EFPeriodo_DChange(Sender: TObject);
     procedure EFPeriodo_HChange(Sender: TObject);
     procedure EFAlmacen_DChange(Sender: TObject);
     procedure EFAlmacen_HChange(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure ChkBPeriodosClick(Sender: TObject);
     procedure ChkBFechasClick(Sender: TObject);
     procedure EFCanalDChange(Sender: TObject);
     procedure EFCanalHChange(Sender: TObject);
     procedure CBFiltrarClick(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure CBdireccionClick(Sender: TObject);
     procedure EFMovDBusqueda(Sender: TObject);
     procedure EFMovHBusqueda(Sender: TObject);
     procedure EFMovDChange(Sender: TObject);
     procedure EFMovHChange(Sender: TObject);
     procedure CBFiltroSerieClick(Sender: TObject);
     procedure CBFiltroMovClick(Sender: TObject);
     procedure CBEntradasClick(Sender: TObject);
     procedure CBSalidasClick(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFSubfamiliaDChange(Sender: TObject);
     procedure EFSubfamiliaHChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure CBStockClick(Sender: TObject);
     procedure ChkBPeriodosChange(Sender: TObject);
     procedure ChkBFechasChange(Sender: TObject);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFSerieHChange(Sender: TObject);
  private
     { Private declarations }
     TipoListado: byte;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure FiltrarCliente(Filtro: boolean);
     procedure Muestra(articulo: string; Tipo: byte);
     procedure HabilitaSerie(Modo: boolean);
     procedure HabilitaMov(Modo: boolean);
  end;

var
  FPregFichasArticulos : TFPregFichasArticulos;

implementation

uses UDMMain, UFormGest, UDMRFichasArticulos, UEntorno, UUtiles, UFMListConfig, UDameDato;

{$R *.DFM}

procedure TFPregFichasArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRFichasArticulos, DMRFichasArticulos);
  ARecargaExecute(Sender);

  Grupo := 148;
  Listado := DMRFichasArticulos.frArticulos;
  ListadoFR3 := DMRFichasArticulos.frxArticulos;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregFichasArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRFichasArticulos);
end;

procedure TFPregFichasArticulos.Muestra(Articulo: string; Tipo: byte);
begin
  TipoListado := Tipo;
  if (TipoListado = 0) then
     Caption := _('Listado de Movimiento de Artículos')
  else
  begin
     Caption := _('Listado de Movimientos Resumido');
     CBFiltroSerie.Enabled := False;
     CBFiltroMov.Enabled := False;
  end;

  EFArticulo_D.Text := Articulo;
  EFArticulo_H.Text := Articulo;

  ShowModal;
end;

procedure TFPregFichasArticulos.ARecargaExecute(Sender: TObject);
var
  Min, Max : string;
  MinCanal, MaxCanal : integer;
begin
  inherited;

  DMRFichasArticulos.Rangos;
  EFPeriodo_D.Text := DMRFichasArticulos.PeriodoDesde;
  EFPeriodo_H.Text := DMRFichasArticulos.PeriodoHasta;
  DTPFechaD.Date := Trunc(DMRFichasArticulos.DesdeFecha);
  DTPFechaH.Date := Trunc(DMRFichasArticulos.HastaFecha);
  EFClienteD.Text := IntToStr(DMRFichasArticulos.ClienteDesde);
  EFClienteH.Text := IntToStr(DMRFichasArticulos.ClienteHasta);
  EFArticulo_D.Text := DMRFichasArticulos.ArticuloDesde;
  EFArticulo_H.Text := DMRFichasArticulos.ArticuloHasta;
  EFAlmacen_D.Text := DMRFichasArticulos.AlmacenDesde;
  EFAlmacen_H.Text := DMRFichasArticulos.AlmacenHasta;
  ChkBPeriodos.Checked := False;
  ChkBFechas.Checked := True;
  MinCanal := REntorno.Canal;
  MaxCanal := REntorno.Canal;
  if (DMMain.EstadoKri(275) = 1) then
     DameMinMax('CAN', MinCanal, MaxCanal);
  EFCanalD.Text := IntToStr(MinCanal);
  EFCanalH.Text := IntToStr(MaxCanal);
  EFSerieD.Text := REntorno.Serie;
  EFSerieH.Text := REntorno.Serie;
  EFMovD.Text := 'MAN';
  EFMovH.Text := 'MAN';
  CBFiltrar.Checked := False;
  CBStock.Checked := False;
  CBFiltroSerie.Checked := False;
  CBFiltroMov.Checked := False;
  CBEntradas.Checked := False;
  CBSalidas.Checked := False;
  FiltrarCliente(False);
  HabilitaSerie(False);
  HabilitaMov(False);
  DameMinMax('FAM', Min, Max);
  EFFamiliaD.Text := Min;
  EFFamiliaH.Text := Max;
  EFSubfamiliaD.Text := '';
  EFSubfamiliaH.Text := '';
end;

procedure TFPregFichasArticulos.EFArticulo_DChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRFichasArticulos.xArt_Desde, EFArticulo_D.Text);
end;

procedure TFPregFichasArticulos.EFArticulo_HChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRFichasArticulos.xArt_Hasta, EFArticulo_H.Text);
end;

procedure TFPregFichasArticulos.EFPeriodo_DChange(Sender: TObject);
begin
  Actualiza_PeriodoRO(DMRFichasArticulos.xPeriodo_Desde, EFPeriodo_D.Text);
end;

procedure TFPregFichasArticulos.EFPeriodo_HChange(Sender: TObject);
begin
  Actualiza_PeriodoRO(DMRFichasArticulos.xPeriodo_Hasta, EFPeriodo_H.Text);
end;

procedure TFPregFichasArticulos.EFAlmacen_DChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMRFichasArticulos.xAlmacen_Desde, EFAlmacen_D.Text);
end;

procedure TFPregFichasArticulos.EFAlmacen_HChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMRFichasArticulos.xAlmacen_Hasta, EFAlmacen_H.Text);
end;

procedure TFPregFichasArticulos.EFArticulo_DBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregFichasArticulos.EFArticulo_HBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregFichasArticulos.ChkBPeriodosClick(Sender: TObject);
begin
  if ChkBPeriodos.Checked then
     ChkBFechas.Checked := False;
end;

procedure TFPregFichasArticulos.ChkBFechasClick(Sender: TObject);
begin
  if ChkBFechas.Checked then
     ChkBPeriodos.Checked := False;
end;

procedure TFPregFichasArticulos.EFCanalDChange(Sender: TObject);
begin
  Actualiza_CanalRO(DMRFichasArticulos.xCanalDesde,
     StrToIntDef(EFCanalD.Text, REntorno.canal));
end;

procedure TFPregFichasArticulos.EFClienteDChange(Sender: TObject);
begin
  DMRFichasArticulos.CambiaClienteD(StrToInt(EFClienteD.Text));
end;

procedure TFPregFichasArticulos.EFClienteHChange(Sender: TObject);
begin
  DMRFichasArticulos.CambiaClienteH(StrToInt(EFClienteH.Text));
end;

procedure TFPregFichasArticulos.EFCanalHChange(Sender: TObject);
begin
  Actualiza_CanalRO(DMRFichasArticulos.xCanalHasta,
     StrToIntDef(EFCanalH.Text, REntorno.canal));
end;

procedure TFPregFichasArticulos.CBFiltrarClick(Sender: TObject);
begin
  FiltrarCliente(CBFiltrar.Checked);
end;

procedure TFPregFichasArticulos.FiltrarCliente(Filtro: boolean);
begin
  if (Filtro) then
  begin
     LBLClienteD.Enabled := True;
     LBLClienteH.Enabled := True;
     EFClienteD.Enabled := True;
     EFClienteH.Enabled := True;
     CBDireccion.Enabled := (TipoListado = 0);
  end
  else
  begin
     LBLClienteD.Enabled := False;
     LBLClienteH.Enabled := False;
     EFClienteD.Enabled := False;
     EFClienteH.Enabled := False;
     CBDireccion.Checked := False;
     CBDireccion.Enabled := False;
  end;
end;

procedure TFPregFichasArticulos.CBdireccionClick(Sender: TObject);
begin
  DMRFichasArticulos.IncluirDireccion := CBDireccion.Checked;
end;

procedure TFPregFichasArticulos.EFMovDBusqueda(Sender: TObject);
begin
  EFMovD.CondicionBusqueda := ' TIPO IN (''FAC'',''FAP'',''ALB'',''ALP'',''FCR'',''MAN'',''TIC'')';
end;

procedure TFPregFichasArticulos.EFMovHBusqueda(Sender: TObject);
begin
  EFMovH.CondicionBusqueda := ' TIPO IN (''FAC'',''FAP'',''ALB'',''ALP'',''FCR'',''MAN'',''TIC'')';
end;

procedure TFPregFichasArticulos.EFMovDChange(Sender: TObject);
begin
  DMRFichasArticulos.FiltraMov(EFMovD.Text, 'D');
end;

procedure TFPregFichasArticulos.EFMovHChange(Sender: TObject);
begin
  DMRFichasArticulos.FiltraMov(EFMovH.Text, 'H');
end;

procedure TFPregFichasArticulos.CBFiltroSerieClick(Sender: TObject);
begin
  HabilitaSerie(CBFiltroSerie.Checked);
end;

procedure TFPregFichasArticulos.HabilitaSerie(Modo: boolean);
begin
  LBLSerieD.Enabled := Modo;
  LBLSerieH.Enabled := Modo;
  EFSerieD.Enabled := Modo;
  EFSerieH.Enabled := Modo;
  DMRFichasArticulos.FiltroSerie := Modo;
end;

procedure TFPregFichasArticulos.HabilitaMov(Modo: boolean);
begin
  LBLMovD.Enabled := Modo;
  LBLMovH.Enabled := Modo;
  EFMovD.Enabled := Modo;
  EFMovH.Enabled := Modo;
  CBEntradas.Enabled := Modo;
  CBSalidas.Enabled := Modo;
  DMRFichasArticulos.FiltroMov := Modo;
end;

procedure TFPregFichasArticulos.CBFiltroMovClick(Sender: TObject);
begin
  HabilitaMov(CBFiltroMov.Checked);
end;

procedure TFPregFichasArticulos.CBEntradasClick(Sender: TObject);
begin
  DMRFichasArticulos.SoloEntradas := CBEntradas.Checked;
end;

procedure TFPregFichasArticulos.CBSalidasClick(Sender: TObject);
begin
  DMRFichasArticulos.SoloSalidas := CBSalidas.Checked;
end;

procedure TFPregFichasArticulos.EFFamiliaDChange(Sender: TObject);
begin
  inherited;
  EFSubFamiliaD.CondicionBusqueda := '';
  if (EFFamiliaD.Text <> '') then
  begin
     DMRFichasArticulos.FiltraFamilia(EFFamiliaD.Text, 0);
     EFSubFamiliaD.CondicionBusqueda := 'ID_FAMILIA = ' + IntToStr(DameIDFamilia(EFFamiliaD.Text));
  end;
end;

procedure TFPregFichasArticulos.EFFamiliaHChange(Sender: TObject);
begin
  inherited;
  EFSubfamiliaH.CondicionBusqueda := '';
  if (EFFamiliaH.Text <> '') then
  begin
     DMRFichasArticulos.FiltraFamilia(EFFamiliaH.Text, 1);
     EFSubfamiliaH.CondicionBusqueda := 'ID_FAMILIA = ' + IntToStr(DameIDFamilia(EFFamiliaD.Text));
  end;
end;

procedure TFPregFichasArticulos.EFSubfamiliaDChange(Sender: TObject);
begin
  inherited;
  DBETituloSubfamiliaD.Text := DameTituloSubfamilia(EFFamiliaD.Text, EFSubFamiliaD.Text);
end;

procedure TFPregFichasArticulos.EFSubfamiliaHChange(Sender: TObject);
begin
  inherited;
  DBETituloSubfamiliaH.Text := DameTituloSubfamilia(EFFamiliaH.Text, EFSubFamiliaH.Text);
end;

procedure TFPregFichasArticulos.AConfigurarExecute(Sender: TObject);
begin
  if (TipoListado = 0) then // Mov. Artículos
  begin
     if CBFiltrar.Checked then
        Grupo := 148
     else
        Grupo := 49;
  end
  else // Mov. Resumido
     Grupo := 95;

  inherited;
end;

procedure TFPregFichasArticulos.CBStockClick(Sender: TObject);
begin
  inherited;
  LDesdeAlmacen.Enabled := CBStock.Checked;
  LHastaAlmacen.Enabled := CBStock.Checked;
  EFAlmacen_D.Enabled := CBStock.Checked;
  EFAlmacen_H.Enabled := CBStock.Checked;
end;

procedure TFPregFichasArticulos.ChkBPeriodosChange(Sender: TObject);
begin
  inherited;
  LDesdePeriodo.Enabled := ChkBPeriodos.Checked;
  LHastaPeriodo.Enabled := ChkBPeriodos.Checked;
  EFPeriodo_D.Enabled := ChkBPeriodos.Checked;
  EFPeriodo_H.Enabled := ChkBPeriodos.Checked;
end;

procedure TFPregFichasArticulos.ChkBFechasChange(Sender: TObject);
begin
  inherited;
  LDesdeFecha.Enabled := ChkBFechas.Checked;
  LHastaFecha.Enabled := ChkBFechas.Checked;
  DTPFechaD.Enabled := ChkBFechas.Checked;
  DTPFechaH.Enabled := ChkBFechas.Checked;
end;

procedure TFPregFichasArticulos.EFSerieDChange(Sender: TObject);
begin
  inherited;
  DBETitSerieD.Text := DameTituloSerie(EFSerieD.Text);
end;

procedure TFPregFichasArticulos.EFSerieHChange(Sender: TObject);
begin
  inherited;
  DBETitSerieH.Text := DameTituloSerie(EFSerieH.Text);
end;

procedure TFPregFichasArticulos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if (TipoListado = 0) then
  begin
     DMRFichasArticulos.MostrarListado(EFPeriodo_D.Text, EFPeriodo_H.Text,
        EFAlmacen_D.Text, EFAlmacen_H.Text, EFArticulo_D.Text,
        EFArticulo_H.Text, Modo,
        StrToInt(EFClienteD.Text), StrToInt(EFClienteH.Text),
        Trunc(DTPFechaD.Date), Trunc(DTPFechaH.Date),
        ChkBPeriodos.Checked, CBFiltrar.Checked, CBStock.Checked,
        StrToIntDef(EFCanalD.Text, 1), StrToIntDef(EFCanalH.Text, 1),
        EFSerieD.Text, EFSerieH.Text, EFMovD.Text, EFMovH.Text, EFFamiliaD.Text, EFFamiliaH.Text, EFSubfamiliaD.Text, EFSubfamiliaH.Text);
  end
  else
     DMRFichasArticulos.ListadoMovResumido(EFPeriodo_D.Text, EFPeriodo_H.Text,
        EFAlmacen_D.Text, EFAlmacen_H.Text, EFArticulo_D.Text,
        EFArticulo_H.Text, Modo,
        Trunc(DTPFechaD.Date), Trunc(DTPFechaH.Date), ChkBPeriodos.Checked,
        StrToIntDef(EFCanalD.Text, 1),
        StrToIntDef(EFCanalH.Text, 1), EFFamiliaD.Text, EFFamiliaH.Text);
end;

end.
