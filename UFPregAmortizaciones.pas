{Todo: Agregar filtro - Cuenta de inmovilizado}
{Todo: Agregar filtro - Mostrar elementos completamente amortizados}

unit UFPregAmortizaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UFormGest, rxToolEdit,
  ULFDBEdit, ULFToolBar, ULFEditFind2000, ULFLabel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDateEdit, UFPEditListado, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFPanel, UFPEditListadoSimple;

type
  TFPregAmortizaciones = class(TFPEditListadoSimple)
     GBFechas: TGroupBox;
     LDesdeFechaAmortizacion: TLFLabel;
     LHastaFechaAmortizacion: TLFLabel;
     DEDesdeFechaAmortizacion: TLFDateEdit;
     DEHastaFechaAmortizacion: TLFDateEdit;
     GBArticulos: TGroupBox;
     EFArtDesde: TLFEditFind2000;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArtHasta: TLFEditFind2000;
     DBEArtDesde: TLFDbedit;
     DBEArtHasta: TLFDbedit;
     TButtConfRapida: TToolButton;
     CBListadoPorFichas: TLFCheckBox;
     LDesdeFechaCompra: TLFLabel;
     LHastaFechaCompra: TLFLabel;
     DEDesdeFechaCompra: TLFDateEdit;
     DEHastaFechaCompra: TLFDateEdit;
     CBMostrarBaja: TLFCheckBox;
     procedure EFArtDesdeChange(Sender: TObject);
     procedure EFArtHastaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBListadoPorFichasChange(Sender: TObject);
  private
     { Private declarations }
     ArticuloDesde, ArticuloHasta: string;
     DesdeFechaAmortizacion, HastaFechaAmortizacion: TDateTime;
     DesdeFechaCompra, HastaFechaCompra: TDateTime;
     ListadoPorFichas, MostrarBaja: boolean;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     procedure MostrarListado(Modo: smallint);
     procedure Muestra;
  end;

var
  FPregAmortizaciones : TFPregAmortizaciones;

implementation

uses UDMMain, UEntorno, UUtiles, UDMLstAmortizaciones;

{$R *.DFM}

procedure TFPregAmortizaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstAmortizaciones, DMLstAmortizaciones);

  ARecargar.Execute;

  CBListadoPorFichas.Checked := True;
  Grupo := 516;
  Listado := DMLstAmortizaciones.frAmortizacion;
  ListadoFR3 := DMLstAmortizaciones.frxAmortizacion;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregAmortizaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstAmortizaciones);
end;

procedure TFPregAmortizaciones.Muestra;
begin
  ShowModal;
end;

procedure TFPregAmortizaciones.MostrarListado(Modo: smallint);
begin
  DesdeFechaAmortizacion := HourIntoDate(DEDesdeFechaAmortizacion.Date, '00:00:00');
  HastaFechaAmortizacion := HourIntoDate(DEHastaFechaAmortizacion.Date, '23:59:59');
  DesdeFechaCompra := HourIntoDate(DEDesdeFechaCompra.Date, '00:00:00');
  HastaFechaCompra := HourIntoDate(DEHastaFechaCompra.Date, '23:59:59');
  ListadoPorFichas := CBListadoPorFichas.Checked;
  MostrarBaja := CBMostrarBaja.Checked;
  DMLstAmortizaciones.MostrarListado(Modo, DesdeFechaAmortizacion, HastaFechaAmortizacion, DesdeFechaCompra, HastaFechaCompra, ArticuloDesde, ArticuloHasta, ListadoPorFichas, MostrarBaja);
end;

procedure TFPregAmortizaciones.EFArtDesdeChange(Sender: TObject);
begin
  with DMLstAmortizaciones.xArt_Desde do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := EFArtDesde.Text;
     Open;
  end;
  ArticuloDesde := EFArtDesde.Text;
end;

procedure TFPregAmortizaciones.EFArtHastaChange(Sender: TObject);
begin
  with DMLstAmortizaciones.xArt_Hasta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := EFArtHasta.Text;
     Open;
  end;
  ArticuloHasta := EFArtHasta.Text;
end;

procedure TFPregAmortizaciones.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMLstAmortizaciones.Rangos(ArticuloDesde, ArticuloHasta, DesdeFechaAmortizacion, HastaFechaAmortizacion, DesdeFechaCompra, HastaFechaCompra);
  DEDesdeFechaAmortizacion.Date := Trunc(DesdeFechaAmortizacion);
  DEHastaFechaAmortizacion.Date := Trunc(HastaFechaAmortizacion);
  DEDesdeFechaCompra.Date := Trunc(DesdeFechaCompra);
  DEHastaFechaCompra.Date := Trunc(HastaFechaCompra);
  EFArtDesde.Text := ArticuloDesde;
  EFArtHasta.Text := ArticuloHasta;
  CBListadoPorFichas.Checked := True;
end;

procedure TFPregAmortizaciones.CBListadoPorFichasChange(Sender: TObject);
begin
  inherited;
  if CBListadoPorFichas.Checked then
     Grupo := 516
  else
     Grupo := 97;
end;

procedure TFPregAmortizaciones.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  MostrarListado(Modo);
end;

end.
