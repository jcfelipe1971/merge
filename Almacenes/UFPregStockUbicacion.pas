unit UFPregStockUbicacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, Mask, DBCtrls,
  ULFDBEdit, rxToolEdit, ULFDateEdit, ULFEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFComboBox, ULFDBCheckBox, rxPlacemnt, ULFFormStorage,
  ExtCtrls, ULFPanel, UFPEditListadoSimple;

type
  TFPregStockUbicacion = class(TFPEditListadoSimple)
     GBUbicacion: TGroupBox;
     TButtMultiSeleccion: TToolButton;
     LBUbDesde: TLFLabel;
     LBUbHasta: TLFLabel;
     EFUbicacionD: TLFEditFind2000;
     EFUbicacionH: TLFEditFind2000;
     DBETitUbDesde: TLFDbedit;
     DBETitUbHasta: TLFDbedit;
     GBArticulos: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArticuloD: TLFEditFind2000;
     EFArticuloH: TLFEditFind2000;
     ETitArticuloD: TLFEdit;
     ETitArticuloH: TLFEdit;
     GBOrdenLst: TGroupBox;
     CBOrdenLst: TLFComboBox;
     LBOrdenarPor: TLFLabel;
     CBSinStock: TLFCheckBox;
     LBFechaLst: TLFLabel;
     DEFechaLst: TLFDateEdit;
     LBComentario: TLFLabel;
     EComentario: TLFEdit;
     AMulti: TAction;
     TButtConfRapida: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure EFUbicacionDChange(Sender: TObject);
     procedure EFUbicacionHChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFUbicacionDBusqueda(Sender: TObject);
     procedure EFUbicacionHBusqueda(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure AMultiExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     ListaCanales: TStringList;
     CanalSeleccion: integer;
     procedure Carga;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregStockUbicacion : TFPregStockUbicacion;

implementation

uses UDMLstStockUbicacion, UFormGest, UEntorno, UDMMain, UFMultiSeleccion,
  UDMMultiSeleccion, UFMListConfig, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFPregStockUbicacion.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCanales := TStringList.Create;
  AbreData(TDMLstStockUbicacion, DMLstStockUbicacion);
  AbreData(TDMMultiSeleccion, DMMultiSeleccion);
  Carga;

  Grupo := 194;
  Listado := DMLstStockUbicacion.frStockUb;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := DMLstStockUbicacion.frxStockUb;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  FMain.AddComponentePunto(EFArticuloD);
  FMain.AddComponentePunto(EFArticuloH);
end;

procedure TFPregStockUbicacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstStockUbicacion);
  CierraData(DMMultiSeleccion);

  FMain.DelComponentePunto(EFArticuloD);
  FMain.DelComponentePunto(EFArticuloH);
end;

procedure TFPregStockUbicacion.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
end;

procedure TFPregStockUbicacion.Carga;
var
  MaxUbicacion, MinUbicacion, MaxArticulo, MinArticulo : string;
begin
  DMLstStockUbicacion.DameValoresMaxMin(MaxUbicacion, MinUbicacion, MaxArticulo, MinArticulo);
  EFUbicacionD.Text := MinUbicacion;
  EFUbicacionH.Text := MaxUbicacion;
  EFArticuloD.Text := MinArticulo;
  EFArticuloH.Text := MaxArticulo;
  DEFechaLst.Date := REntorno.FechaTrabSH;
  CBOrdenLst.ItemIndex := 0;
  EComentario.Text := '';
  CBSinStock.State := cbUnChecked;
  CanalSeleccion := REntorno.Canal;
end;

procedure TFPregStockUbicacion.EFUbicacionDChange(Sender: TObject);
begin
  inherited;
  if (EFUbicacionD.Text <> '') then
     DMLstStockUbicacion.DameTitulosUbicacion(EFUbicacionD.Text, 0);
end;

procedure TFPregStockUbicacion.EFUbicacionHChange(Sender: TObject);
begin
  inherited;
  if (EFUbicacionH.Text <> '') then
     DMLstStockUbicacion.DameTitulosUbicacion(EFUbicacionH.Text, 1);
end;

procedure TFPregStockUbicacion.EFArticuloDChange(Sender: TObject);
begin
  inherited;
  ETitArticuloD.Text := DameTituloArticulo(EFArticuloD.Text);
end;

procedure TFPregStockUbicacion.EFArticuloHChange(Sender: TObject);
begin
  inherited;
  ETitArticuloH.Text := DameTituloArticulo(EFArticuloH.Text);
end;

procedure TFPregStockUbicacion.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Carga;
end;

procedure TFPregStockUbicacion.EFUbicacionDBusqueda(Sender: TObject);
begin
  inherited;
  EFUbicacionD.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr;
end;

procedure TFPregStockUbicacion.EFUbicacionHBusqueda(Sender: TObject);
begin
  inherited;
  EFUbicacionH.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr;
end;

procedure TFPregStockUbicacion.EFArticuloDBusqueda(Sender: TObject);
begin
  inherited;
  EFArticuloD.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and ubicable=1';
end;

procedure TFPregStockUbicacion.EFArticuloHBusqueda(Sender: TObject);
begin
  inherited;
  EFArticuloH.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and ubicable=1';
end;

procedure TFPregStockUbicacion.AMultiExecute(Sender: TObject);
begin
  inherited;
  TFMultiSeleccion.Create(Self).MostrarCanal(CanalSeleccion, ListaCanales);
end;

procedure TFPregStockUbicacion.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstStockUbicacion.MostrarListado(EFUbicacionD.Text, EFUbicacionH.Text, EFArticuloD.Text,
     EFArticuloH.Text, EComentario.Text, DEFechaLst.Date, CBOrdenLst.ItemIndex, BoolToInt(CBSinStock.Checked), CanalSeleccion, Modo);
end;

end.
