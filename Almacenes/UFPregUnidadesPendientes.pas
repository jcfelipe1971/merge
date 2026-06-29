unit UFPregUnidadesPendientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, ActnList, Mask, DBCtrls, Grids, DBGrids,
  rxToolEdit, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFEdit, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple, ULFComboBox;

type
  TFPregUnidadesPendientes = class(TFPEditListadoSimple)
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
     EFClienteDesde: TLFEditFind2000;
     EFClienteHasta: TLFEditFind2000;
     EClienteHasta: TLFEdit;
     EClienteDesde: TLFEdit;
     LHastaCliente: TLFLabel;
     LDesdeCliente: TLFLabel;
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
     EFFamiliaDesde: TLFEditFind2000;
     EFamiliaDesde: TLFEdit;
     EFFamiliaHasta: TLFEditFind2000;
     EFamiliaHasta: TLFEdit;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     PNLFechaSerie: TLFPanel;
     GBOrden: TGroupBox;
     LOrden: TLFLabel;
     CBOrden: TLFComboBox;
     BFiltraMes: TButton;
     BFiltraEjercicio: TButton;
     BMesAnt: TButton;
     BMesSig: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloDesdeChange(Sender: TObject);
     procedure EFArticuloHastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFClienteDesdeChange(Sender: TObject);
     procedure EFClienteHastaChange(Sender: TObject);
     procedure EFAlmacenDesdeChange(Sender: TObject);
     procedure EFAlmacenHastaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFSerieDesdeChange(Sender: TObject);
     procedure EFSerieHastaChange(Sender: TObject);
     procedure EFArticuloDesdeBusqueda(Sender: TObject);
     procedure EFArticuloHastaBusqueda(Sender: TObject);
     procedure EFFamiliaDesdeBusqueda(Sender: TObject);
     procedure EFFamiliaHastaBusqueda(Sender: TObject);
     procedure EFFamiliaDesdeChange(Sender: TObject);
     procedure EFFamiliaHastaChange(Sender: TObject);
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
  FPregUnidadesPendientes : TFPregUnidadesPendientes;

implementation

{$R *.DFM}

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, UDMRUNidadesPendientes, UDMListados, UFMain, UParam;

procedure TFPregUnidadesPendientes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRUnidadesPendientes, DMRUnidadesPendientes);

  Grupo := 94;
  Listado := DMRUnidadesPendientes.frUnidadesPendientes;
  ListadoFR3 := DMRUnidadesPendientes.frxUnidadesPendientes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Sender); // Calcula los limites

  FMain.AddComponentePunto(EFArticuloDesde);
  FMain.AddComponentePunto(EFArticuloHasta);
end;

procedure TFPregUnidadesPendientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRUnidadesPendientes);

  FMain.DelComponentePunto(EFArticuloDesde);
  FMain.DelComponentePunto(EFArticuloHasta);
end;

procedure TFPregUnidadesPendientes.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
  sMin, sMax : string;
  dMin, dMax : TDateTime;
begin
  DameMinMax('CLI', Min, Max);
  EFClienteDesde.Text := IntToStr(Min);
  EFClienteHasta.Text := IntToStr(Max);

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

procedure TFPregUnidadesPendientes.EFArticuloDesdeChange(Sender: TObject);
begin
  EArticuloDesde.Text := DameTituloArticulo(EFArticuloDesde.Text);
end;

procedure TFPregUnidadesPendientes.EFArticuloHastaChange(Sender: TObject);
begin
  EArticuloHasta.Text := DameTituloArticulo(EFArticuloHasta.Text);
end;

procedure TFPregUnidadesPendientes.EFClienteDesdeChange(Sender: TObject);
begin
  EClienteDesde.Text := DameTituloCliente(StrToIntDef(EFClienteDesde.Text, 0));
end;

procedure TFPregUnidadesPendientes.EFClienteHastaChange(Sender: TObject);
begin
  EClienteHasta.Text := DameTituloCliente(StrToIntDef(EFClienteHasta.Text, 0));
end;

procedure TFPregUnidadesPendientes.EFAlmacenDesdeChange(Sender: TObject);
begin
  EAlmacenDesde.Text := DameTituloAlmacen(EFAlmacenDesde.Text);
end;

procedure TFPregUnidadesPendientes.EFAlmacenHastaChange(Sender: TObject);
begin
  EAlmacenHasta.Text := DameTituloAlmacen(EFAlmacenHasta.Text);
end;

procedure TFPregUnidadesPendientes.FormShow(Sender: TObject);
begin
  if (LeeParametro('LSTPEPP001', '') = 'C') then
     GBFechas.Caption := 'Fecha Entrega Prev Cab.'
  else
     GBFechas.Caption := 'Fecha Entrega Prev Det.';

  EFClienteDesde.SetFocus;
end;

procedure TFPregUnidadesPendientes.EFSerieDesdeChange(Sender: TObject);
begin
  ESerieDesde.Text := DameTituloSerie(EFSerieDesde.Text);
end;

procedure TFPregUnidadesPendientes.EFSerieHastaChange(Sender: TObject);
begin
  ESerieHasta.Text := DameTituloSerie(EFSerieHasta.Text);
end;

procedure TFPregUnidadesPendientes.EFArticuloDesdeBusqueda(Sender: TObject);
begin
  EFArticuloDesde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidadesPendientes.EFArticuloHastaBusqueda(Sender: TObject);
begin
  EFArticuloHasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidadesPendientes.EFFamiliaDesdeBusqueda(Sender: TObject);
begin
  EFFamiliaDesde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidadesPendientes.EFFamiliaHastaBusqueda(Sender: TObject);
begin
  EFFamiliaHasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregUnidadesPendientes.EFFamiliaDesdeChange(Sender: TObject);
begin
  EFamiliaDesde.Text := DameTituloFamilia(EFFamiliaDesde.Text);
end;

procedure TFPregUnidadesPendientes.EFFamiliaHastaChange(Sender: TObject);
begin
  EFamiliaHasta.Text := DameTituloFamilia(EFFamiliaHasta.Text);
end;

procedure TFPregUnidadesPendientes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRUNidadesPendientes.MostrarListado(Modo, StrToIntDef(EFClienteDesde.Text, 0), StrToIntDef(EFClienteHasta.Text, 0), EFArticuloDesde.Text, EFArticuloHasta.Text, EFAlmacenDesde.Text, EFAlmacenHasta.Text, EFFamiliaDesde.Text, EFFamiliaHasta.Text, EFSerieDesde.Text, EFSerieHasta.Text, DEFechaDesde.Date, DEFechaHasta.Date, DTPFechaListado.Date, EComentario.Text, CBOrden.ItemIndex);
end;

procedure TFPregUnidadesPendientes.BFiltraMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'MES');
end;

procedure TFPregUnidadesPendientes.BFiltraEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'EJE');
end;

procedure TFPregUnidadesPendientes.BMesAntClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M-');
end;

procedure TFPregUnidadesPendientes.BMesSigClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaDesde, DEFechaHasta, 'M+');
end;

end.
