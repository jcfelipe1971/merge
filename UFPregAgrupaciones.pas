unit UFPregAgrupaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFComboBox, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregAgrupaciones = class(TFPEditListadoSimple)
     PNLAgrupacion: TLFPanel;
     Vencimiento: TGroupBox;
     Desde: TLFLabel;
     Hasta: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     LBLAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     DBETitulo: TLFDbedit;
     GBEstado: TGroupBox;
     TButtConfRapida: TToolButton;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     LBLMoneda: TLFLabel;
     LFCBCobrado: TLFCheckBox;
     LFCBNormal: TLFCheckBox;
     LFCBImpagado: TLFCheckBox;
     LFCBRemesado: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DTPDesdeChange(Sender: TObject);
     procedure DTPHastaChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure ProcesaEstado;
  end;

var
  FPregAgrupaciones : TFPregAgrupaciones;

implementation

uses UDMMain, UFormGest, UDMLstAgrupacion, UEntorno, UFMListConfig;

{$R *.DFM}

procedure TFPregAgrupaciones.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLSTAgrupaciones, DMLSTAgrupaciones);

  Grupo := 57;
  Listado := DMLstAgrupaciones.frCarteraAgrupacion;
  ListadoFR3 := DMLstAgrupaciones.frxCarteraAgrupacion;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargar.Execute;
end;

procedure TFPregAgrupaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTAgrupaciones);
end;

procedure TFPregAgrupaciones.EFAgrupacionChange(Sender: TObject);
begin
  DMLstAgrupaciones.Titulo(EFAgrupacion.Text);
end;

procedure TFPregAgrupaciones.ARecargarExecute(Sender: TObject);
var
  agrup : string;
  ini, fin : TDateTime;
begin
  inherited;

  DMLstAgrupaciones.Recargar(agrup, ini, fin);
  DTPDesde.Date := Trunc(ini);
  DTPHasta.Date := Trunc(fin);
  EFAgrupacion.Text := agrup;
  EFMoneda.Text := REntorno.Moneda;
end;

procedure TFPregAgrupaciones.FormShow(Sender: TObject);
begin
  EFAgrupacion.SetFocus;
end;

procedure TFPregAgrupaciones.DTPDesdeChange(Sender: TObject);
begin
  DMLstAgrupaciones.Actualiza_Ejercicio(DTPDesde.Date, 0);
end;

procedure TFPregAgrupaciones.DTPHastaChange(Sender: TObject);
begin
  DMLstAgrupaciones.Actualiza_Ejercicio(DTPHasta.Date, 1);
end;

procedure TFPregAgrupaciones.EFMonedaChange(Sender: TObject);
begin
  DMLstAgrupaciones.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregAgrupaciones.ProcesaEstado;
begin
  with DMLstAgrupaciones do
  begin
     Cobrado := LFCBCobrado.Checked;
     Impagado := LFCBImpagado.Checked;
     Normal := LFCBNormal.Checked;
     Remesado := LFCBRemesado.Checked;
  end;
end;

procedure TFPregAgrupaciones.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  ProcesaEstado;
  DMLstAgrupaciones.AbrirTablasFiltradas(EFAgrupacion.Text, DTPDesde.Date, DTPHasta.Date);
  DMLstAgrupaciones.MostrarListado(Modo);
end;

end.
