{ TODO :
Unir codigo de ZUDMR... y UDMRStockMinimo
Unir codigo de ZUFPreg... y UFPregStockMinimo }

unit UFPregStockMinimo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, ComCtrls, ToolWin,
  ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, rxToolEdit, ULFEdit,
  ULFLabel, ULFDateEdit, rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregStockMinimo = class(TFPEditListadoSimple)
     PNLStockMin: TLFPanel;
     GBArticulo: TGroupBox;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamilia_H: TLFEditFind2000;
     EFFamilia_D: TLFEditFind2000;
     EF2000Filtra: TEntornoFind2000;
     EFamiliaDesde: TLFEdit;
     EFamiliaHasta: TLFEdit;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArticulo_D: TLFEditFind2000;
     EFArticulo_H: TLFEditFind2000;
     EArticuloDesde: TLFEdit;
     EArticuloHasta: TLFEdit;
     TButtConfiguracionRapida: TToolButton;
     TButtMultiCanal: TToolButton;
     GBAlmacen: TGroupBox;
     LAlmacen: TLFLabel;
     EFSelAlmacen: TLFEditFind2000;
     EAlmacenDesc: TLFEdit;
     CBStockVirtual: TLFCheckBox;
     AMultiSeleccion: TAction;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     LBLComentario: TLFLabel;
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFSelAlmacenChange(Sender: TObject);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure EFFamilia_DChange(Sender: TObject);
     procedure EFFamilia_HChange(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure EFFamilia_DBusqueda(Sender: TObject);
     procedure EFFamilia_HBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     ListaCanales, ListaAlm: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregStockMinimo : TFPregStockMinimo;

implementation

{$R *.DFM}

uses UDMRStockMinimo, UUtiles, UDameDato, UEntorno, UFormGest, UFMultiSeleccion, UDMListados, UFMain,
  UDMMain, HYFIBQuery;

procedure TFPregStockMinimo.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCanales := TStringList.Create;
  ListaAlm := TStringList.Create;

  AbreData(TDMRStockMinimo, DMRStockMinimo);
  EF2000Filtra.Empresa := REntorno.Empresa;
  ARecargarExecute(Sender); // Calcula los límites

  FMain.AddComponentePunto(EFArticulo_D);
  FMain.AddComponentePunto(EFArticulo_H);

  Grupo := 22;
  Listado := DMRStockMinimo.frStockMinimo;
  ListadoFR3 := DMRStockMinimo.frxStockMinimo;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregStockMinimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FMain.DelComponentePunto(EFArticulo_D);
  FMain.DelComponentePunto(EFArticulo_H);

  CierraData(DMRStockMinimo);
end;

procedure TFPregStockMinimo.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
  ListaAlm.Free;
end;

procedure TFPregStockMinimo.ARecargarExecute(Sender: TObject);
var
  sMin, sMax : string;
  //iMin, iMax : integer;
begin
  inherited;

  EFSelAlmacen.Text := REntorno.AlmacenDefecto;

  DameMinMax('ART', sMin, sMax);
  EFArticulo_D.Text := sMin;
  EFArticulo_H.Text := sMax;

  DameMinMax('FAM', sMin, sMax);
  EFFamilia_D.Text := sMin;
  EFFamilia_H.Text := sMax;

  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);

  ListaAlm.Clear;
  ListaAlm.Add(REntorno.AlmacenDefecto);

  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TFPregStockMinimo.EFSelAlmacenChange(Sender: TObject);
begin
  EAlmacenDesc.Text := DameTituloAlmacen(EFSelAlmacen.Text);
end;

procedure TFPregStockMinimo.EFArticulo_DChange(Sender: TObject);
begin
  EArticuloDesde.Text := DameTituloArticulo(EFArticulo_D.Text);
end;

procedure TFPregStockMinimo.EFArticulo_HChange(Sender: TObject);
begin
  EArticuloHasta.Text := DameTituloArticulo(EFArticulo_H.Text);
end;

procedure TFPregStockMinimo.EFFamilia_DChange(Sender: TObject);
begin
  EFamiliaDesde.Text := DameTituloFamilia(EFFamilia_D.Text);
end;

procedure TFPregStockMinimo.EFFamilia_HChange(Sender: TObject);
begin
  EFamiliaHasta.Text := DameTituloFamilia(EFFamilia_H.Text);
end;

procedure TFPregStockMinimo.EFArticulo_DBusqueda(Sender: TObject);
begin
  EFArticulo_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''' +
     ' AND CONTROL_STOCK=1';
end;

procedure TFPregStockMinimo.EFArticulo_HBusqueda(Sender: TObject);
begin
  EFArticulo_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''' +
     ' AND CONTROL_STOCK=1';
end;

procedure TFPregStockMinimo.EFFamilia_DBusqueda(Sender: TObject);
begin
  EFFamilia_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregStockMinimo.EFFamilia_HBusqueda(Sender: TObject);
begin
  EFFamilia_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregStockMinimo.FormShow(Sender: TObject);
begin
  EFSelAlmacen.SetFocus;
end;

procedure TFPregStockMinimo.AMultiSeleccionExecute(Sender: TObject);
var
  Almacen : string;
  Canal : integer;
begin
  Almacen := EFSelAlmacen.Text;
  Canal := REntorno.Canal;

  // TFMultiSeleccion.Create(Self).Mostrar(Canal, DMRStockMinimo.Almacen, ListaCanales, ListaAlm, 1);
  TFMultiSeleccion.Create(Self).Mostrar(Canal, Almacen, ListaCanales, ListaAlm, 1);

  if (Almacen = 'EditFind') then
  begin
     EFSelAlmacen.Text := REntorno.AlmacenDefecto;
     ListaAlm.Add(REntorno.AlmacenDefecto);
  end
  else
  begin
     EFSelAlmacen.Text := Almacen;
  end;
end;

procedure TFPregStockMinimo.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);

  DMRStockMinimo.CalculaInforme(REntorno.Canal, ListaCanales, ListaAlm, EFSelAlmacen.Text,
     EFArticulo_D.Text, EFArticulo_H.Text, EFFamilia_D.Text, EFFamilia_H.Text,
     CBStockVirtual.Checked, Modo);
end;

end.
