unit UFPregInStoResumido;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, ComCtrls, ToolWin,
  Grids, DBGrids, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, rxToolEdit, ULFEdit, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregInStoResumido = class(TFPEditListadoSimple)
     PNLInvStockResumido: TLFPanel;
     PSinLimite: TLFPanel;
     LAlmacen: TLFLabel;
     EFSelAlmacen: TLFEditFind2000;
     DBEAlmacenDesc: TLFDbedit;
     GBArticulo: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArticulo_D: TLFEditFind2000;
     EFArticulo_H: TLFEditFind2000;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamilia_H: TLFEditFind2000;
     EFFamilia_D: TLFEditFind2000;
     EF2000Filtra: TEntornoFind2000;
     DBEFamiliaDesde: TLFDbedit;
     DBEFamiliaHasta: TLFDbedit;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     TButtConfiguracionRapida: TToolButton;
     AMultiSeleccion: TAction;
     TButtMultiSeleccion: TToolButton;
     RGTipoCalculo: TRadioGroup;
     RBPMP: TRadioButton;
     RBPCoste: TRadioButton;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     LBLComentario: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFSelAlmacenChange(Sender: TObject);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure EFFamilia_DChange(Sender: TObject);
     procedure EFFamilia_HChange(Sender: TObject);
     procedure EFFamilia_DBusqueda(Sender: TObject);
     procedure EFFamilia_HBusqueda(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     Canal: integer;
     ListaCanales, ListaAlm: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregInStoResumido : TFPregInStoResumido;

implementation

{$R *.DFM}

uses UDMRInStoResumido, UEntorno, UFormGest, UUtiles, UFMListConfig,
  UFMultiSeleccion, UDMListados, UFMain;

procedure TFPregInStoResumido.FormCreate(Sender: TObject);
begin
  inherited;
  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  ListaAlm := TStringList.Create;
  AbreData(TDMRInStoResumido, DMRInStoResumido);
  EF2000Filtra.Empresa := REntorno.Empresa;
  ARecargarExecute(Sender); // Calcula los limites

  FMain.AddComponentePunto(EFArticulo_D);
  FMain.AddComponentePunto(EFArticulo_H);

  Grupo := 24;
  Listado := DMRInStoResumido.frInStoResumido;
  ListadoFR3 := DMRInStoResumido.frxInStoResumido;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregInStoResumido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRInStoResumido);

  FMain.DelComponentePunto(EFArticulo_D);
  FMain.DelComponentePunto(EFArticulo_H);
end;

procedure TFPregInStoResumido.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
  ListaAlm.Free;
end;

procedure TFPregInStoResumido.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRInStoResumido.Rangos;
  EFSelAlmacen.Text := DMRInStoResumido.Almacen;
  EFArticulo_D.Text := DMRInStoResumido.Articulo_Desde;
  EFArticulo_H.Text := DMRInStoResumido.Articulo_Hasta;
  EFFamilia_D.Text := DMRInStoResumido.Familia_Desde;
  EFFamilia_H.Text := DMRInStoResumido.Familia_Hasta;
  EFMoneda.Text := REntorno.Moneda;
  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);
  Canal := REntorno.Canal;
  ListaAlm.Clear;
  ListaAlm.Add(REntorno.AlmacenDefecto);
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TFPregInStoResumido.EFSelAlmacenChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMRInStoResumido.xArt_Almacen, EFSelAlmacen.Text);
  DMRInStoResumido.Almacen := EFSelAlmacen.Text;
end;

procedure TFPregInStoResumido.EFArticulo_DChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRInStoResumido.xArt_Desde, EFArticulo_D.Text);
end;

procedure TFPregInStoResumido.EFArticulo_HChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRInStoResumido.xArt_Hasta, EFArticulo_H.Text);
end;

procedure TFPregInStoResumido.EFFamilia_DChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMRInStoResumido.xFamilia_Desde, EFFamilia_D.Text);
end;

procedure TFPregInStoResumido.EFFamilia_HChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMRInStoResumido.xFamilia_Hasta, EFFamilia_H.Text);
end;

procedure TFPregInStoResumido.EFFamilia_DBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInStoResumido.EFFamilia_HBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInStoResumido.EFArticulo_DBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInStoResumido.EFArticulo_HBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregInStoResumido.FormShow(Sender: TObject);
begin
  EFSelAlmacen.SetFocus;
end;

procedure TFPregInStoResumido.AMultiSeleccionExecute(Sender: TObject);
var
  Alm : string;
begin
  // TFMultiSeleccion.Create( Self ).Mostrar(Canal,DMRInStoResumido.Almacen,ListaCanales,ListaAlm,1);
  Alm := EFSelAlmacen.Text;
  TFMultiSeleccion.Create(Self).Mostrar(Canal, Alm, ListaCanales, ListaAlm, 1);

  if (Alm = 'EditFind') then
  begin
     EFSelAlmacen.Text := REntorno.AlmacenDefecto;
     DMRInStoResumido.Almacen := REntorno.AlmacenDefecto;
     ListaAlm.Add(REntorno.AlmacenDefecto);
  end
  else
  begin
     EFSelAlmacen.Text := Alm;
     DMRInStoResumido.Almacen := Alm;
  end;
end;

procedure TFPregInStoResumido.EFMonedaChange(Sender: TObject);
begin
  DMRInStoResumido.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregInStoResumido.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  with DMRInStoResumido do
  begin
     // if (ListaAlm.Count = 0) then Almacen := EFSelAlmacen.Text;
     Articulo_Desde := EFArticulo_D.Text;
     Articulo_Hasta := EFArticulo_H.Text;
     Familia_Desde := EFFamilia_D.Text;
     Familia_Hasta := EFFamilia_H.Text;
     if RBPMP.Checked then
        T_Cal := 0 // PMP
     else
        T_Cal := 2; // P.Coste
  end;
  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);
  DMRInStoResumido.MostrarListado(ListaCanales, ListaAlm, Canal, TAction(Sender).Tag);
end;

end.
