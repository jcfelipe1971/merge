unit UFPregArtTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFCheckBox, ULFEdit, ULFDBEdit, ULFPanel, ULFToolBar,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, UFPEditListadoSimple,
  rxPlacemnt, ULFFormStorage;

type
  TFPregArtTarifas = class(TFPEditListadoSimple)
     TButtConfRapida: TToolButton;
     GBArticulos: TGroupBox;
     LBLArtDesde: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     DBEArticuloDesde: TLFDbedit;
     LBLArtHasta: TLFLabel;
     EFArt_Hasta: TLFEditFind2000;
     DBEArticuloHasta: TLFDbedit;
     GBTarifas: TGroupBox;
     LBLTarDesde: TLFLabel;
     EFTarifa_Desde: TLFEditFind2000;
     DBETarifaDesde: TLFDbedit;
     DBETarifaHasta: TLFDbedit;
     EFTarifa_Hasta: TLFEditFind2000;
     LBLTarHasta: TLFLabel;
     GBCantidad: TGroupBox;
     LBLCantidad: TLFLabel;
     ECantidad: TLFEdit;
     GBFamilia: TGroupBox;
     LBLFamDesde: TLFLabel;
     LBLFamHasta: TLFLabel;
     EFFamilia_H: TLFEditFind2000;
     EFFamilia_D: TLFEditFind2000;
     DBEFamiliaDesde: TLFDbedit;
     DBEFamiliaHasta: TLFDbedit;
     ChckBOrdenado: TLFCheckBox;
     CBPagina: TLFCheckBox;
     CBArticulosBaja: TLFCheckBox;
     CBOrderPorTitulo: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure ECantidadKeyPress(Sender: TObject; var Key: char);
     procedure EFTarifa_DesdeChange(Sender: TObject);
     procedure EFTarifa_HastaChange(Sender: TObject);
     procedure EFFamilia_HChange(Sender: TObject);
     procedure EFFamilia_DChange(Sender: TObject);
     procedure EFFamilia_DBusqueda(Sender: TObject);
     procedure EFFamilia_HBusqueda(Sender: TObject);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
     procedure ChckBOrdenadoClick(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra;
  end;

var
  FPregArtTarifas : TFPregArtTarifas;

implementation

uses UDMLstTarifas, UUtiles, UEntorno, UFMListConfig, UDMMain;

{$R *.DFM}

procedure TFPregArtTarifas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMLstTarifas, DMLstTarifas);
  ARecargar.Execute;

  Grupo := 150;
  Listado := DMLstTarifas.frTarifas;
  ListadoFR3 := DMLstTarifas.frxTarifas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregArtTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstTarifas);
end;

procedure TFPregArtTarifas.Muestra;
begin
  ShowModal;
end;

procedure TFPregArtTarifas.EFArt_DesdeBusqueda(Sender: TObject);
begin
  EFArt_Desde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''';
end;

procedure TFPregArtTarifas.EFArt_HastaBusqueda(Sender: TObject);
begin
  EFArt_Hasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''';
end;

procedure TFPregArtTarifas.EFArt_DesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstTarifas.xArt_Desde, EFArt_Desde.Text);
end;

procedure TFPregArtTarifas.EFArt_HastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstTarifas.xArt_Hasta, EFArt_Hasta.Text);
end;

procedure TFPregArtTarifas.ARecargarExecute(Sender: TObject);
var
  articulo_d, articulo_h, Tarifa_D, Tarifa_H, Familia_D, Familia_H : string;
begin
  ChckBOrdenado.Checked := True;
  Grupo := 150;
  CBArticulosBaja.Checked := False;
  CBPagina.Checked := False;

  DMLstTarifas.Rangos1(articulo_d, articulo_h);
  EFArt_Desde.Text := articulo_d;
  EFArt_Hasta.Text := articulo_h;

  ECantidad.Text := '0';

  DMLstTarifas.Rangos(Tarifa_D, Tarifa_H);
  EFTarifa_Desde.Text := Tarifa_D;
  EFTarifa_Hasta.Text := Tarifa_H;

  DMLstTarifas.RangosFamilia(Familia_D, Familia_H);
  EFFamilia_D.Text := Familia_D;
  EFFamilia_H.Text := Familia_H;
end;

procedure TFPregArtTarifas.ECantidadKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8{, '-', ThousandSeparator, DecimalSeparator}]) then
     Key := #0;
end;

procedure TFPregArtTarifas.EFTarifa_DesdeChange(Sender: TObject);
begin
  Actualiza_TarifaRO(DMLstTarifas.xTarifa_Desde, EFTarifa_Desde.Text);
end;

procedure TFPregArtTarifas.EFTarifa_HastaChange(Sender: TObject);
begin
  Actualiza_TarifaRO(DMLstTarifas.xTarifa_Hasta, EFTarifa_Hasta.Text);
end;

procedure TFPregArtTarifas.EFFamilia_HChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstTarifas.xFamilia_Hasta, EFFamilia_H.Text);
end;

procedure TFPregArtTarifas.EFFamilia_DChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstTarifas.xFamilia_Desde, EFFamilia_D.Text);
end;

procedure TFPregArtTarifas.EFFamilia_DBusqueda(Sender: TObject);
begin
  EFFamilia_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtTarifas.EFFamilia_HBusqueda(Sender: TObject);
begin
  EFFamilia_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtTarifas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstTarifas.OrdenFam := ChckBOrdenado.Checked;

  if CBPagina.Checked then
     DMLstTarifas.OpPaginado := 2
  else
     DMLstTarifas.OpPaginado := 0;

  DMLstTarifas.MuestraColumnas(EFArt_Desde.Text, EFArt_Hasta.Text, EFTarifa_Desde.Text,
     EFTarifa_Hasta.Text, EFFamilia_D.Text, EFFamilia_H.Text,
     StrToInt(ECantidad.Text), Modo, CBArticulosBaja.Checked, CBOrderPorTitulo.Checked);
end;

procedure TFPregArtTarifas.ChckBOrdenadoClick(Sender: TObject);
begin
  inherited;
  if ChckBOrdenado.Checked then
     Grupo := 150
  else
     Grupo := 54;
end;

procedure TFPregArtTarifas.AConfigurarExecute(Sender: TObject);
begin
  if ChckBOrdenado.Checked then
     Grupo := 150
  else
     Grupo := 54;

  inherited;
end;

end.
