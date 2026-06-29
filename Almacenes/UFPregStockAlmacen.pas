unit UFPregStockAlmacen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, ExtCtrls, ActnList, ComCtrls, ToolWin, rxToolEdit,
  ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFEdit, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregStockAlmacen = class(TFPEditListadoSimple)
     PNLStockAlmacen: TLFPanel;
     GBValoracion: TGroupBox;
     EF2000Filtra: TEntornoFind2000;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     TButtConfiguracionRapida: TToolButton;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     RBPMP: TRadioButton;
     RBPCoste: TRadioButton;
     DTPFecha: TLFDateEdit;
     LSeleccionarFecha: TLFLabel;
     AMultiSeleccion: TAction;
     TButtMultiSeleccion: TToolButton;
     EFMoneda: TLFEditFind2000;
     ETituloMoneda: TLFEdit;
     PSinLimite: TLFPanel;
     LBLAlmacen: TLFLabel;
     EFSelAlmacen: TLFEditFind2000;
     EAlmacenDesc: TLFEdit;
     RBPrecioTarifa: TRadioButton;
     EFTarifa: TLFEditFind2000;
     ETituloTarifa: TLFEdit;
     ChkBSinStock: TLFCheckBox;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     LBLComentario: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     RBOrdenado: TRadioGroup;
     ChkBSoloSinStock: TLFCheckBox;
     TButtMultiAgrupacion: TToolButton;
     LSubFamiliaDesde: TLFLabel;
     LSubFamiliaHasta: TLFLabel;
     PNLOtros: TLFPanel;
     PNLFiltros: TLFPanel;
     PNLOpciones: TLFPanel;
     ChkBBaja: TLFCheckBox;
     LBLMoneda: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     ETituloFamiliaDesde: TLFEdit;
     EFFamiliaH: TLFEditFind2000;
     ETituloFamiliaHasta: TLFEdit;
     EFSubFamiliaDesde: TLFEditFind2000;
     ESubFamiliaDesde: TLFEdit;
     EFSubFamiliaHasta: TLFEditFind2000;
     ESubFamiliaHasta: TLFEdit;
     EFArticulo_D: TLFEditFind2000;
     ETituloArticuloDesde: TLFEdit;
     EFArticulo_H: TLFEditFind2000;
     ETituloArticuloHasta: TLFEdit;
     LTipoArticulo: TLFLabel;
     EFTipoArticulo: TLFEditFind2000;
     ETipoArticulo: TLFEdit;
     CBCalcularLotesNrosSerie: TLFCheckBox;
     LTemporadaHasta: TLFLabel;
     LTemporadaDesde: TLFLabel;
     ETemporadaDesde: TLFEdit;
     ETemporadaHasta: TLFEdit;
     EFTemporadaDesde: TLFEditFind2000;
     EFTemporadaHasta: TLFEditFind2000;
     LGeneroHasta: TLFLabel;
     LGeneroDesde: TLFLabel;
     EGeneroDesde: TLFEdit;
     EGeneroHasta: TLFEdit;
     EFGeneroDesde: TLFEditFind2000;
     EFGeneroHasta: TLFEditFind2000;
     LHastaMarca: TLFLabel;
     LDesdeMarca: TLFLabel;
     EMarcaDesde: TLFEdit;
     EMarcaHasta: TLFEdit;
     EFMarcaDesde: TLFEditFind2000;
     EFMarcaHasta: TLFEditFind2000;
     RGStock: TRadioGroup;
     CBCalcularProveedorPrioritario: TLFCheckBox;
     CBCalcularDatosArticulos: TLFCheckBox;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     ECliente: TLFEdit;
     TBExportar: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFSelAlmacenChange(Sender: TObject);
     procedure EFTarifaChange(Sender: TObject);
     procedure TButtMultiAgrupacionClick(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure EFSubFamiliaHastaBusqueda(Sender: TObject);
     procedure EFSubFamiliaDesdeBusqueda(Sender: TObject);
     procedure EFSubFamiliaDesdeChange(Sender: TObject);
     procedure EFSubFamiliaHastaChange(Sender: TObject);
     procedure EFTipoArticuloChange(Sender: TObject);
     procedure EFTemporadaDesdeChange(Sender: TObject);
     procedure EFTemporadaHastaChange(Sender: TObject);
     procedure EFGeneroDesdeChange(Sender: TObject);
     procedure EFGeneroHastaChange(Sender: TObject);
     procedure EFMarcaDesdeChange(Sender: TObject);
     procedure EFMarcaHastaChange(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
  private
     { Private declarations }
     Canal: integer;
     ListaCanales, ListaAlm: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregStockAlmacen : TFPregStockAlmacen;

implementation

{$R *.DFM}

uses UDMRStockAlmacen, UUtiles, UDameDato, UEntorno, UFormGest, UFMListConfig,
  UFMultiSeleccion, UDMListados, UDMMain, UDMMultiAgrupacion,
  UFMMultiAgrupacion, UFMain, UParam;

procedure TFPregStockAlmacen.FormCreate(Sender: TObject);
begin
  inherited;
  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  ListaAlm := TStringList.Create;
  AbreData(TDMRStockAlmacen, DMRStockAlmacen);
  EF2000Filtra.Empresa := REntorno.Empresa;
  EF2000Filtra.Ejercicio := REntorno.Ejercicio;
  EF2000Filtra.Canal := REntorno.Canal;
  ARecargarExecute(Sender); // Calcula los limites

  FMain.AddComponentePunto(EFArticulo_D);
  FMain.AddComponentePunto(EFArticulo_H);

  Grupo := 25;
  Listado := DMRStockAlmacen.frStockAlmacen;
  ListadoFR3 := DMRStockAlmacen.frxStockAlmacen;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  with RBOrdenado do
  begin
     Items[3] := LeeParametro(format('ARTDESC%3.3d', [1]));
     Items[4] := LeeParametro(format('ARTDESC%3.3d', [2]));
     Items[5] := LeeParametro(format('ARTDESC%3.3d', [3]));
     Items[6] := LeeParametro(format('ARTDESC%3.3d', [4]));
     Items[7] := LeeParametro(format('ARTDESC%3.3d', [5]));
     Items[8] := LeeParametro(format('ARTDESC%3.3d', [6]));
     Items[9] := LeeParametro(format('ARTDESC%3.3d', [7]));
     Items[10] := LeeParametro(format('ARTDESC%3.3d', [8]));
  end;

  RGStock.ItemIndex := 0;
  RGStock.Visible := (LeeParametro('LISTALM004') = 'S');
end;

procedure TFPregStockAlmacen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRStockAlmacen);

  FMain.DelComponentePunto(EFArticulo_D);
  FMain.DelComponentePunto(EFArticulo_H);
end;

procedure TFPregStockAlmacen.ARecargarExecute(Sender: TObject);
begin
  ChkBSinStock.Checked := False;
  ChkBBaja.Checked := False;
  ChkBSoloSinStock.Checked := False;
  DMRStockAlmacen.Rangos;
  EFSelAlmacen.Text := DMRStockAlmacen.Almacen;
  DTPFecha.Date := DMRStockAlmacen.Fecha;
  EFArticulo_D.Text := '.';
  EFArticulo_H.Text := DMRStockAlmacen.ArtH;
  EFFamiliaD.Text := DMRStockAlmacen.FamD;
  EFFamiliaH.Text := DMRStockAlmacen.FamH;
  EFSubFamiliaDesde.Text := '';
  EFSubFamiliaHasta.Text := '';
  EFTarifa.Text := DMRStockAlmacen.Tarifa;
  EFMoneda.Text := REntorno.Moneda;
  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);
  Canal := REntorno.Canal;
  ListaAlm.Clear;
  ListaAlm.Add(REntorno.AlmacenDefecto);
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
  RBOrdenado.ItemIndex := 1;
  EFTipoArticulo.Text := '';
  EFCliente.Text := '';
end;

procedure TFPregStockAlmacen.EFArticulo_DChange(Sender: TObject);
begin
  ETituloArticuloDesde.Text := DameTituloArticulo(EFArticulo_D.Text);
end;

procedure TFPregStockAlmacen.EFArticulo_HChange(Sender: TObject);
begin
  ETituloArticuloHasta.Text := DameTituloArticulo(EFArticulo_H.Text);
end;

procedure TFPregStockAlmacen.EFArticulo_DBusqueda(Sender: TObject);
begin
  EFArticulo_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND CONTROL_STOCK=1';
end;

procedure TFPregStockAlmacen.EFArticulo_HBusqueda(Sender: TObject);
begin
  EFArticulo_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND CONTROL_STOCK=1';
end;

procedure TFPregStockAlmacen.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregStockAlmacen.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregStockAlmacen.EFFamiliaDChange(Sender: TObject);
begin
  ETituloFamiliaDesde.Text := DameTituloFamilia(EFFamiliaD.Text);
end;

procedure TFPregStockAlmacen.EFFamiliaHChange(Sender: TObject);
begin
  ETituloFamiliaHasta.Text := DameTituloFamilia(EFFamiliaH.Text);
end;

procedure TFPregStockAlmacen.AMultiSeleccionExecute(Sender: TObject);
var
  Alm : string;
begin
  // TFMultiSeleccion.Create( Self ).Mostrar(Canal, DMRStockAlmacen.Almacen, ListaCanales, ListaAlm, 1);
  Alm := EFSelAlmacen.Text;
  TFMultiSeleccion.Create(Self).Mostrar(Canal, Alm, ListaCanales, ListaAlm, 1);

  if (Alm = 'EditFind') then
  begin
     EFSelAlmacen.Text := REntorno.AlmacenDefecto;
     DMRStockAlmacen.Almacen := REntorno.AlmacenDefecto;
     ListaAlm.Add(REntorno.AlmacenDefecto);
  end
  else
  begin
     EFSelAlmacen.Text := Alm;
     DMRStockAlmacen.Almacen := Alm;
  end;
end;

procedure TFPregStockAlmacen.EFMonedaChange(Sender: TObject);
begin
  ETituloMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFPregStockAlmacen.EFSelAlmacenChange(Sender: TObject);
begin
  EAlmacenDesc.Text := DameTituloAlmacen(EFSelAlmacen.Text);
  DMRStockAlmacen.Almacen := EFSelAlmacen.Text;
end;

procedure TFPregStockAlmacen.EFTarifaChange(Sender: TObject);
begin
  ETituloTarifa.Text := DameTituloTarifa(EFTarifa.Text);
end;

procedure TFPregStockAlmacen.TButtMultiAgrupacionClick(Sender: TObject);
begin
  inherited;
  AbreForm(TFMMultiAgrupacion, FMMultiAgrupacion, Sender);
end;

procedure TFPregStockAlmacen.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
  ListaAlm.Free;
end;

procedure TFPregStockAlmacen.EFSubFamiliaHastaBusqueda(Sender: TObject);
begin
  inherited;
  EFSubFamiliaHasta.CondicionBusqueda := 'ID_FAMILIA=' + IntToStr(DameIdFamilia(EFFamiliaH.Text));
end;

procedure TFPregStockAlmacen.EFSubFamiliaDesdeBusqueda(Sender: TObject);
begin
  inherited;
  EFSubFamiliaDesde.CondicionBusqueda := 'ID_FAMILIA=' + IntToStr(DameIdFamilia(EFFamiliaD.Text));
end;

procedure TFPregStockAlmacen.EFSubFamiliaDesdeChange(Sender: TObject);
begin
  inherited;
  ESubFamiliaDesde.Text := DameTituloSubfamilia(EFSubFamiliaDesde.Text, EFFamiliaD.Text);
end;

procedure TFPregStockAlmacen.EFSubFamiliaHastaChange(Sender: TObject);
begin
  inherited;
  ESubFamiliaHasta.Text := DameTituloSubfamilia(EFSubFamiliaHasta.Text, EFFamiliaH.Text);
end;

procedure TFPregStockAlmacen.EFTipoArticuloChange(Sender: TObject);
begin
  inherited;
  ETipoArticulo.Text := '';
end;

procedure TFPregStockAlmacen.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  with DMRStockAlmacen do
  begin
     ArtD := EFArticulo_D.Text;
     ArtH := Trim(EFArticulo_H.Text);
     FamD := Trim(EFFamiliaD.Text);
     FamH := Trim(EFFamiliaH.Text);
     SubFamD := Trim(EFSubFamiliaDesde.Text);
     SubFamH := Trim(EFSubFamiliaHasta.Text);
     GeneroD := Trim(EFGeneroDesde.Text);
     GeneroH := Trim(EFGeneroHasta.Text);
     TemporadaD := Trim(EFTemporadaDesde.Text);
     TemporadaH := Trim(EFTemporadaHasta.Text);
     MarcaD := Trim(EFMarcaDesde.Text);
     MarcaH := Trim(EFMarcaHasta.Text);
     Fecha := HourIntoDate(DTPFecha.Date, '23:59:59');
     Tarifa := EFTarifa.Text;
     SinStock := ChkBSinStock.Checked;
     SoloSinStock := ChkBSoloSinStock.Checked;
     Baja := ChkBBaja.Checked;
     Cliente := StrToIntDef(EFCliente.Text, 0);
     if RBPMP.Checked then
        TipoValor := 0
     else
     if RBPCoste.Checked then
        TipoValor := 1
     else
        TipoValor := 2;

     // 0 Existencias - 1 Stock Virtual
     TipoStock := RGStock.ItemIndex;
  end;

  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);

  if (Modo = 2) then
     PBListado.Visible := True;
  try
     DMRStockAlmacen.MostrarListado(ListaCanales, ListaAlm, Canal, Modo, RBOrdenado.ItemIndex, EFMoneda.Text, EFTipoArticulo.Text, CBCalcularLotesNrosSerie.Checked, CBCalcularProveedorPrioritario.Checked, CBCalcularDatosArticulos.Checked, PBListado);
  finally
     if (Modo = 2) then
        PBListado.Visible := False;
  end;
end;

procedure TFPregStockAlmacen.EFTemporadaDesdeChange(Sender: TObject);
begin
  inherited;
  ETemporadaDesde.Text := DameTituloArtModTemporada(EFTemporadaDesde.Text);
end;

procedure TFPregStockAlmacen.EFTemporadaHastaChange(Sender: TObject);
begin
  inherited;
  ETemporadaHasta.Text := DameTituloArtModTemporada(EFTemporadaHasta.Text);
end;

procedure TFPregStockAlmacen.EFGeneroDesdeChange(Sender: TObject);
begin
  inherited;
  EGeneroDesde.Text := DameTituloArtModGenero(EFGeneroDesde.Text);
end;

procedure TFPregStockAlmacen.EFGeneroHastaChange(Sender: TObject);
begin
  inherited;
  EGeneroHasta.Text := DameTituloArtModGenero(EFGeneroHasta.Text);
end;

procedure TFPregStockAlmacen.EFMarcaDesdeChange(Sender: TObject);
begin
  inherited;
  EMarcaDesde.Text := DameTituloMarcaModelo(EFMarcaDesde.Text);
end;

procedure TFPregStockAlmacen.EFMarcaHastaChange(Sender: TObject);
begin
  inherited;
  EMarcaHasta.Text := DameTituloMarcaModelo(EFMarcaHasta.Text);
end;

procedure TFPregStockAlmacen.EFClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
end;

end.
