unit UFPregDiarioStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, UFIBDBEditfind, StdCtrls, ExtCtrls, ComCtrls, UEditPanel,
  ToolWin, UComponentesBusquedaFiltrada, UDBDateTimePicker, ActnList, Mask,
  DBCtrls, rxToolEdit, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFEdit, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPregDiarioStock = class(TFPEditListadoSimple)
     PNLFechaDoc: TLFPanel;
     GBPeriodo: TGroupBox;
     EFPeriodo_D: TLFEditFind2000;
     EFPeriodo_H: TLFEditFind2000;
     LDesdePeriodo: TLFLabel;
     LHastaPeriodo: TLFLabel;
     GBFechaDoc: TGroupBox;
     DBDTPFecha_D: TLFDateEdit;
     DBDTPFecha_H: TLFDateEdit;
     LDesdeFechaDoc: TLFLabel;
     LHastaFechaDoc: TLFLabel;
     DBEPeriodoDesde: TLFDbedit;
     DBEPeriodoHasta: TLFDbedit;
     TButtConfiguracionRapida: TToolButton;
     AMultiSeleccion: TAction;
     TButtMultiSeleccion: TToolButton;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFPeriodo_HChange(Sender: TObject);
     procedure EFPeriodo_DChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     ListaCanales: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregDiarioStock : TFPregDiarioStock;

implementation

uses UDMMain, UDMRDiarioStock, UFormGest, UUtiles, UFMListConfig, UFMultiSeleccion,
  UDMMultiSeleccion, UEntorno, UDMListados;

{$R *.DFM}

procedure TFPregDiarioStock.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCanales := TStringList.Create;
  AbreData(TDMRDiarioStock, DMRDiarioStock);
  AbreData(TDMMultiSeleccion, DMMultiSeleccion);

  Grupo := 23;
  Listado := DMRDiarioStock.frDiarioStock;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := DMRDiarioStock.frxDiarioStock;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Sender);
end;

procedure TFPregDiarioStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRDiarioStock);
  CierraData(DMMultiSeleccion);
end;

procedure TFPregDiarioStock.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
end;

procedure TFPregDiarioStock.ARecargarExecute(Sender: TObject);
begin
  DMRDiarioStock.Rangos;
  EFPeriodo_D.Text := DMRDiarioStock.Periodo_Desde;
  EFPeriodo_H.Text := DMRDiarioStock.Periodo_Hasta;
  DBDTPFecha_D.Date := DMRDiarioStock.Fecha_Desde;
  DBDTPFecha_H.Date := DMRDiarioStock.Fecha_Hasta;
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TFPregDiarioStock.EFPeriodo_DChange(Sender: TObject);
begin
  Actualiza_PeriodoRO(DMRDiarioStock.xPeriodo_Desde, EFPeriodo_D.Text);
end;

procedure TFPregDiarioStock.FormShow(Sender: TObject);
begin
  EFPeriodo_D.SetFocus;
end;

procedure TFPregDiarioStock.EFPeriodo_HChange(Sender: TObject);
begin
  Actualiza_PeriodoRO(DMRDiarioStock.xPeriodo_Hasta, EFPeriodo_H.Text);
end;

procedure TFPregDiarioStock.AMultiSeleccionExecute(Sender: TObject);
var
  Canal : integer;
begin
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFPregDiarioStock.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);

  DMRDiarioStock.MostrarListado(ListaCanales, Modo, EFPeriodo_D.Text,
     EFPeriodo_H.Text, DBDTPFecha_D.Date, DBDTPFecha_H.Date);
end;

end.
