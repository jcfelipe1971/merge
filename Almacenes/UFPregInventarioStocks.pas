unit UFPregInventarioStocks;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, ActnList, Mask, DBCtrls, Grids, DBGrids,
  ULFDBEdit, ULFCheckBox, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit, rxToolEdit, ULFEdit,
  ULFLabel, ULFDateEdit, ULFComboBox, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregInventarioStocks = class(TFPEditListadoSimple)
     PNLInventarioStocks: TLFPanel;
     EF2000Filtra: TEntornoFind2000;
     PSinLimite: TLFPanel;
     LPeriodo: TLFLabel;
     EFPeriodo: TLFEditFind2000;
     GBArticulo: TGroupBox;
     EFArticulo_D: TLFEditFind2000;
     EFArticulo_H: TLFEditFind2000;
     GBFamilia: TGroupBox;
     EFFamilia_H: TLFEditFind2000;
     EFFamilia_D: TLFEditFind2000;
     LArticuloDesde: TLFLabel;
     LArticuloHasta: TLFLabel;
     LFamiliaDesde: TLFLabel;
     LFamiliaHasta: TLFLabel;
     LAlmacen: TLFLabel;
     EFSelAlmacen: TLFEditFind2000;
     GBRecuadro: TGroupBox;
     CBAcuPar: TLFCheckBox;
     CBSinStock: TLFCheckBox;
     EPeriodoDesc: TLFEdit;
     EAlmacenDesc: TLFEdit;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     DBEFamiliaDesde: TLFDbedit;
     DBEFamiliaHasta: TLFDbedit;
     TButtConfiguracionRapida: TToolButton;
     AMultiSeleccion: TAction;
     TButtMultiSeleccion: TToolButton;
     RGTipoCalculo: TRadioGroup;
     RBPCoste: TRadioButton;
     RBPMP: TRadioButton;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     CBResumido: TLFCheckBox;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     CBNSeries: TLFCheckBox;
     CBLotes: TLFCheckBox;
     LComentario: TLFLabel;
     LOrden: TLFLabel;
     CBOrden: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFPeriodoChange(Sender: TObject);
     procedure EFSelAlmacenChange(Sender: TObject);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure EFFamilia_DChange(Sender: TObject);
     procedure EFFamilia_HChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure EFFamilia_DBusqueda(Sender: TObject);
     procedure EFFamilia_HBusqueda(Sender: TObject);
     procedure TButtConfiguracionRapidaClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     Canal: integer;
     ListaCanales, ListaAlm: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregInventarioStocks : TFPregInventarioStocks;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMRInventarioStocks, UFormGest, UUtiles, UFMListConfig,
  UFMultiSeleccion, UDMListados, UFMain, UDameDato;

procedure TFPregInventarioStocks.FormCreate(Sender: TObject);
begin
  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  ListaAlm := TStringList.Create;
  AbreData(TDMRInventarioStocks, DMRInventarioStocks);
  EF2000Filtra.Empresa := REntorno.Empresa;
  ARecargarExecute(Sender); // Calcula los limites

  FMain.AddComponentePunto(EFArticulo_D);
  FMain.AddComponentePunto(EFArticulo_H);

  CBOrden.ItemIndex := 0;

  Grupo := 21;
  Listado := DMRInventarioStocks.frInventario_Stock;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregInventarioStocks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRInventarioStocks);

  FMain.DelComponentePunto(EFArticulo_D);
  FMain.DelComponentePunto(EFArticulo_H);
end;

procedure TFPregInventarioStocks.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  EPeriodoDesc.Text := DameTituloPeriodo(EFPeriodo.Text);
end;

procedure TFPregInventarioStocks.EFSelAlmacenChange(Sender: TObject);
begin
  inherited;
  EAlmacenDesc.Text := DameTituloAlmacen(EFSelAlmacen.Text);
end;

procedure TFPregInventarioStocks.ARecargarExecute(Sender: TObject);
begin
  inherited;

  DMRInventarioStocks.Rangos;
  EFPeriodo.Text := DMRInventarioStocks.Periodo;
  EFSelAlmacen.Text := DMRInventarioStocks.Almacen;
  EFArticulo_D.Text := DMRInventarioStocks.Articulo_Desde;
  EFArticulo_H.Text := DMRInventarioStocks.Articulo_Hasta;
  EFFamilia_D.Text := DMRInventarioStocks.Familia_Desde;
  EFFamilia_H.Text := DMRInventarioStocks.Familia_Hasta;
  EFMoneda.Text := REntorno.Moneda;
  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);
  Canal := REntorno.Canal;
  ListaAlm.Clear;
  ListaAlm.Add(REntorno.AlmacenDefecto);
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
  CBOrden.ItemIndex := 0;
end;

procedure TFPregInventarioStocks.EFArticulo_DChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRInventarioStocks.xArt_Desde, EFArticulo_D.Text);
end;

procedure TFPregInventarioStocks.EFArticulo_HChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRInventarioStocks.xArt_Hasta, EFArticulo_H.Text);
end;

procedure TFPregInventarioStocks.EFFamilia_DChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMRInventarioStocks.xFamilia_Desde, EFFamilia_D.Text);
end;

procedure TFPregInventarioStocks.EFFamilia_HChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMRInventarioStocks.xFamilia_Hasta, EFFamilia_H.Text);
end;

procedure TFPregInventarioStocks.EFArticulo_DBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInventarioStocks.EFArticulo_HBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInventarioStocks.EFFamilia_DBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInventarioStocks.EFFamilia_HBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInventarioStocks.TButtConfiguracionRapidaClick(Sender: TObject);
begin
  if CBResumido.Checked then
     Grupo := 126  // Resumido
  else
     Grupo := 21;

  inherited;
end;

procedure TFPregInventarioStocks.FormShow(Sender: TObject);
begin
  EFPeriodo.SetFocus;
end;

procedure TFPregInventarioStocks.AMultiSeleccionExecute(Sender: TObject);
var
  Alm : string;
begin
  Alm := EFSelAlmacen.Text;
  TFMultiSeleccion.Create(Self).Mostrar(Canal, Alm, ListaCanales, ListaAlm, 1);

  if (Alm = 'EditFind') then
  begin
     EFSelAlmacen.Text := REntorno.AlmacenDefecto;
     DMRInventarioStocks.Almacen := REntorno.AlmacenDefecto;
     ListaAlm.Add(REntorno.AlmacenDefecto);
  end
  else
  begin
     EFSelAlmacen.Text := Alm;
     DMRInventarioStocks.Almacen := Alm;
  end;
end;

procedure TFPregInventarioStocks.EFMonedaChange(Sender: TObject);
begin
  DMRInventarioStocks.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregInventarioStocks.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
  ListaAlm.Free;
end;

procedure TFPregInventarioStocks.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  with DMRInventarioStocks do
  begin
     if (EFPeriodo.Text = '') then
        Periodo := DMRInventarioStocks.Periodo
     else
        Periodo := EFPeriodo.Text;

     if (EFArticulo_D.Text = '') then
        Articulo_Desde :=
           DMRInventarioStocks.Articulo_Desde
     else
        Articulo_Desde := EFArticulo_D.Text;

     if (EFArticulo_H.Text = '') then
        Articulo_Hasta :=
           DMRInventarioStocks.Articulo_Hasta
     else
        Articulo_Hasta := EFArticulo_H.Text;

     if (EFFamilia_D.Text = '') then
        Familia_Desde := DMRInventarioStocks.Familia_Desde
     else
        Familia_Desde := EFFamilia_D.Text;

     if (EFFamilia_H.Text = '') then
        Familia_Hasta := DMRInventarioStocks.Familia_Hasta
     else
        Familia_Hasta := EFFamilia_H.Text;

     if RBPMP.Checked then
        T_Cal := 0  // PMP
     else
        T_Cal := 2; // P.Coste

     if (CBAcuPar.Checked = True) then
        T_Acu := 'P'
     else
        T_Acu := 'T';

     if (CBSinStock.Checked = True) then
        Sin_Stock := 'S'
     else
        Sin_Stock := 'N';

     if (CBResumido.Checked = True) then
        Resumido := 1
     else
        Resumido := 0;

     NSeries := CBNSeries.Checked;
     Lotes := CBLotes.Checked;

     // if (ListaAlm.Count = 0) then
     //    Almacen := EFSelAlmacen.Text;

     DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);

     CalculaInforme(ListaCanales, ListaAlm, Canal, TAction(Sender).Tag, CBOrden.ItemIndex);

     EFArticulo_D.Text := Articulo_Desde;
     EFArticulo_H.Text := Articulo_Hasta;
     EFFamilia_D.Text := Familia_Desde;
     EFFamilia_H.Text := Familia_Hasta;
  end;
end;

end.
