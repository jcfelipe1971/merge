unit UFPregCuadreCaja;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ComCtrls, ULFPageControl, ToolWin, ULFToolBar, ExtCtrls,
  ULFPanel, StdCtrls, Mask, rxToolEdit, ULFDateEdit, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit, UFormGest,
  UFPEditListadoSimple;

type
  TFPregCuadreCaja = class(TFPEditListadoSimple)
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
     DTFechaDesde: TLFDateEdit;
     DTFechaHasta: TLFDateEdit;
     LSerie: TLFLabel;
     ETituloSerie: TLFEdit;
     EFSerie: TLFEditFind2000;
     TButtConfigurar: TToolButton;
     procedure EFSerieChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregCuadreCaja : TFPregCuadreCaja;

implementation

uses
  DateUtils, UDMMain, UUtiles, UEntorno, UDMLstCuadreCaja, UDameDato;

{$R *.dfm}

procedure TFPregCuadreCaja.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstCuadreCaja, DMLstCuadreCaja);
  ARecargarExecute(Sender);
  Grupo := 208;
  Listado := DMLstCuadreCaja.frListado;
  ListadoFR3 := DMLstCuadreCaja.frxListado;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregCuadreCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstCuadreCaja);
end;

procedure TFPregCuadreCaja.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  FechaDesde, FechaHasta : TDateTime;
begin
  FechaDesde := HourIntoDate(DTFechaDesde.Date, '00:00:00');
  FechaHasta := HourIntoDate(DTFechaHasta.Date, '23:59:59');

  DMLstCuadreCaja.MostrarListado(Modo, EFSerie.Text, FechaDesde, FechaHasta);
end;

procedure TFPregCuadreCaja.EFSerieChange(Sender: TObject);
begin
  inherited;
  ETituloSerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFPregCuadreCaja.ARecargarExecute(Sender: TObject);
begin
  inherited;
  EFSerie.Text := REntorno.Serie;
  DTFechaDesde.Date := Today;
  DTFechaHasta.Date := Today;
end;

end.
