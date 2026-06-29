unit UFPregTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls, ActnList, ComCtrls, ToolWin, DB, FIBDataSet,
  FIBTableDataSet, FIBEditFind, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UFormGest, ULFActionList,
  ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar, TFlatCheckBoxUnit,
  ULFEditFind2000, ULFLabel, UFPEditListadoSimple, rxPlacemnt,
  ULFFormStorage;

type
  TFPregTarifas = class(TFPEditListadoSimple)
     LDesde: TLFLabel;
     LHAsta: TLFLabel;
     EFTarifa_Desde: TLFEditFind2000;
     EFTarifa_Hasta: TLFEditFind2000;
     DBETarifaDesde: TLFDbedit;
     DBETarifaHasta: TLFDbedit;
     TButtConRapida: TToolButton;
     ChkBOrden: TLFCheckBox;
     ChkBVender: TLFCheckBox;
     ChkBIva: TLFCheckBox;
     ChkBPrecioCero: TLFCheckBox;
     CBArticulosBaja: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTarifa_DesdeChange(Sender: TObject);
     procedure EFTarifa_HastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra;
  end;

var
  FPregTarifas : TFPregTarifas;

implementation

uses UDMLstTarifas, UDMMain, UEntorno, UUtiles, UFMListConfig;

{$R *.DFM}

procedure TFPregTarifas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstTarifas, DMLstTarifas);
  ARecargar.Execute;
  Grupo := 53; // Listado de Tarifas detalladas
  Listado := DMLstTarifas.frTarifas;
  ListadoFR3 := DMLstTarifas.frxTarifas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMLstTarifas);
end;

procedure TFPregTarifas.Muestra;
begin
  ShowModal;
  Free;
end;

procedure TFPregTarifas.EFTarifa_DesdeChange(Sender: TObject);
begin
  Actualiza_TarifaRO(DMLstTarifas.xTarifa_Desde, EFTarifa_Desde.Text);
end;

procedure TFPregTarifas.EFTarifa_HastaChange(Sender: TObject);
begin
  Actualiza_TarifaRO(DMLstTarifas.xTarifa_Hasta, EFTarifa_Hasta.Text);
end;

procedure TFPregTarifas.ARecargarExecute(Sender: TObject);
var
  Tarifa_D, Tarifa_H : string;
begin
  DMLstTarifas.Rangos(Tarifa_D, Tarifa_H);
  EFTarifa_Desde.Text := Tarifa_D;
  EFTarifa_Hasta.Text := Tarifa_H;
  ChkBOrden.Checked := True;
  ChkBVender.Checked := False;
  ChkBIva.Checked := False;
  ChkBPrecioCero.Checked := True;
end;

procedure TFPregTarifas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstTarifas.MuestraListado(EFTarifa_Desde.Text, EFTarifa_Hasta.Text,
     ChkBOrden.Checked,
     ChkBVender.Checked, ChkBIva.Checked,
     ChkBPrecioCero.Checked, Modo, CBArticulosBaja.Checked);
end;

procedure TFPregTarifas.AConfigurarExecute(Sender: TObject);
begin
  if ChkBIva.Checked then
     Grupo := 90  // Listado de Tarifas con IVA desglosado
  else
     Grupo := 53; // Listado de Tarifas detalladas

  inherited;
end;

end.
