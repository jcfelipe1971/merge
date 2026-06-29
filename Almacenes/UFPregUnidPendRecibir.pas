unit UFPregUnidPendRecibir;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, ActnList, Mask, DBCtrls, Grids, DBGrids,
  rxToolEdit, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFEdit, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple, ULFComboBox;

type
  TFPregUnidPendRecibir = class(TFPEditListadoSimple)
     PNLInventarioStocks: TLFPanel;
     GBArticulo: TGroupBox;
     EFArticuloDesde: TLFEditFind2000;
     EFArticuloHasta: TLFEditFind2000;
     GBFechas: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     EArticuloDesde: TLFEdit;
     EArticuloHasta: TLFEdit;
     TButtConfiguracionRapida: TToolButton;
     DEFechaDesde: TLFDateEdit;
     DEFechaHasta: TLFDateEdit;
     GBCli: TGroupBox;
     EFProveedorDesde: TLFEditFind2000;
     EFProveedorHasta: TLFEditFind2000;
     EProveedorHasta: TLFEdit;
     EProveedorDesde: TLFEdit;
     LHastaProveedor: TLFLabel;
     LDesdeProveedor: TLFLabel;
     GBAlmacen: TGroupBox;
     LDesdeAlmacen: TLFLabel;
     LHastaAlmacen: TLFLabel;
     EFAlmacenDesde: TLFEditFind2000;
     EFAlmacenHasta: TLFEditFind2000;
     EAlmacenDesde: TLFEdit;
     EAlmacenHasta: TLFEdit;
     GBSeries: TGroupBox;
     LDesdeSerie: TLFLabel;
     LHastaSerie: TLFLabel;
     EFSerieDesde: TLFEditFind2000;
     EFSerieHasta: TLFEditFind2000;
     ESerieDesde: TLFEdit;
     ESerieHasta: TLFEdit;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     LBLComentario: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamiliaDesde: TLFEditFind2000;
     EFamiliaDesde: TLFEdit;
     EFFamiliaHasta: TLFEditFind2000;
     EFamiliaHasta: TLFEdit;
     PNLFechaSerie: TLFPanel;
     BMesAnt: TButton;
     BFiltraMes: TButton;
     BMesSig: TButton;
     BFiltraEjercicio: TButton;
     GBOrden: TGroupBox;
     LOrden: TLFLabel;
     CBOrden: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloDesdeChange(Sender: TObject);
     procedure EFArticuloHastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFProveedorDesdeChange(Sender: TObject);
     procedure EFProveedorHastaChange(Sender: TObject);
     procedure EFAlmacenDesdeChange(Sender: TObject);
     procedure EFAlmacenHastaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFSerieDesdeChange(Sender: TObject);
     procedure EFSerieHastaChange(Sender: TObject);
     procedure EFArticuloDesdeBusqueda(Sender: TObject);
     procedure EFArticuloHastaBusqueda(Sender: TObject);
     procedure EFFamiliaDesdeBusqueda(Sender: TObject);
     procedure EFFamiliaHastaBusqueda(Sender: TObject);
     procedure EFFamiliaHastaChange(Sender: TObject);
     procedure EFFamiliaDesdeChange(Sender: TObject);
     procedure BFiltraMesClick(Sender: TObject);
     procedure BFiltraEjercicioClick(Sender: TObject);
     procedure BMesAntClick(Sender: TObject);
     procedure BMesSigClick(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregUnidPendRecibir : TFPregUnidPendRecibir;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFormGest, UUtiles, UDameDato, UFMListConfig, UDMRUnidPendRecibir,
  UDMListados, UFMain, UParam;

procedure TFPregUnidPendRecibir.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRUnidPendRecibir, DMRUnidPendRecibir);

  Grupo := 138;
  Listado := DMRUnidPendRecibir.frUnidPendRecibir;
  ListadoFR3 := DMRUnidPendRecibir.frxUnidPendRecibir;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Sender); // Calcula los limites

  FMain.AddComponentePunto(EFArticuloDesde);
  FMain.AddComponentePunto(EFArticuloHasta);
end;

procedure TFPregUnidPendRecibir.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRUnidPendRecibir);

  FMain.DelComponentePunto(EFArticuloDesde);
  FMain.DelComponentePunto(EFArticuloHasta);
end;

procedure TFPregUnidPendRecibir.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
  sMin, sMax : string;
  dMin, dMax : TDateTime;
begin
  DameMinMax('PRO', Min, Max);
  EFProveedorDesde.Text := IntToStr(Min);
  EFProveedorHasta.Text := IntToStr(Max);

  DameMinMax('ART', sMin, sMax);
  EFArticuloDesde.Text := sMin;
  EFArticuloHasta.Text := sMax;

  DameMinMax('FAM', sMin, sMax);
  EFFamiliaDesde.Text := sMin;
  EFFamiliaHasta.Text := sMax;

  DameMinMax('ALM', sMin, sMax);
  EFAlmacenDesde.Text := sMin;
  EFAlmacenHasta.Text := sMax;

  DameMinMax('EJE', dMin, dMax);
  DEFechaDesde.Date := dMin;
  DEFechaHasta.Date := dMax;

  DameMinMax('SER', sMin, sMax);
  EFSerieDesde.Text := sMin;
  EFSerieHasta.Text := sMax;

  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TFPregUnidPendRecibir.EFArticuloDesdeChange(Sender: TObject);
begin
  EArticuloDesde.Text := DameTituloArticulo(EFArticuloDesde.Text);
end;

procedure TFPregUnidPendRecibir.EFArticuloHastaChange(Sender: TObject);
begin
  EArticuloHasta.Text := DameTituloArticulo(EFArticuloHasta.Text);
end;

procedure TFPregUnidPendRecibir.EFProveedorDesdeChange(Sender: TObject);
begin
  EProveedorDesde.Text := DameTituloProveedor(StrToIntDef(EFProveedorDesde.Text, 0));
end;

procedure TFPregUnidPendRecibir.EFProveedorHastaChange(Sender: TObject);
begin
  EProveedorHasta.Text := DameTituloProveedor(StrToIntDef(EFProveedorHasta.Text, 0));
end;

procedure TFPregUnidPendRecibir.EFAlmacenDesdeChange(Sender: TObject);
begin
  EAlmacenDesde.Text := DameTituloAlmacen(EFAlmacenDesde.Text);
end;

procedure TFPregUnidPendRecibir.EFAlmacenHastaChange(Sender: TObject);
begin
  EAlmacenHasta.Text := DameTituloAlmacen(EFAlmacenHasta.Text);
end;

procedure TFPregUnidPendRecibir.FormShow(Sender: TObject);
begin
  if (LeeParametro('LSTPEPP001', '') = 'C') then
     GBFechas.Caption := 'Fecha Entrega Prev Cab.'
  else
     GBFechas.Caption := 'Fecha Entrega Prev Det.';

  EFProveedorDesde.SetFocus;
end;

procedure TFPregUnidPendRecibir.EFSerieDesdeChange(Sender: TObject);
begin
  ESerieDesde.Text := DameTituloSerie(EFSerieDesde.Text);
end;

procedure TFPregUnidPendRecibir.EFSerieHastaChange(Sender: TObject);
begin
  ESerieHasta.Text := DameTituloSerie(EFSerieHasta.Text);
end;

procedure TFPregUnidPendRecibir.EFArticuloDesdeBusqueda(Sender: TObject);
begin
  EFArticuloDesde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidPendRecibir.EFArticuloHastaBusqueda(Sender: TObject);
begin
  EFArticuloHasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidPendRecibir.EFFamiliaDesdeBusqueda(Sender: TObject);
begin
  EFFamiliaDesde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidPendRecibir.EFFamiliaHastaBusqueda(Sender: TObject);
begin
  EFFamiliaHasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidPendRecibir.EFFamiliaHastaChange(Sender: TObject);
begin
  EFamiliaHasta.Text := DameTituloFamilia(EFFamiliaHasta.Text);
end;

procedure TFPregUnidPendRecibir.EFFamiliaDesdeChange(Sender: TObject);
begin
  EFamiliaDesde.Text := DameTituloFamilia(EFFamiliaDesde.Text);
end;

procedure TFPregUnidPendRecibir.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRUnidPendRecibir.MostrarListado(Modo, StrToIntDef(EFProveedorDesde.Text, 0), StrToIntDef(EFProveedorHasta.Text, 0), EFArticuloDesde.Text, EFArticuloHasta.Text, EFAlmacenDesde.Text, EFAlmacenHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, EFSerieDesde.Text, EFSerieHasta.Text, DEFechaDesde.Date, DEFechaHasta.Date, DTPFechaListado.Date, EComentario.Text, CBOrden.ItemIndex);
end;

procedure TFPregUnidPendRecibir.BFiltraMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'MES');
end;

procedure TFPregUnidPendRecibir.BFiltraEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'MES');
end;

procedure TFPregUnidPendRecibir.BMesAntClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M-');
end;

procedure TFPregUnidPendRecibir.BMesSigClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M+');
end;

end.
