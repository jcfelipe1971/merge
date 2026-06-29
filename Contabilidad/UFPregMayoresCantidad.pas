unit UFPregMayoresCantidad;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, rxToolEdit, ULFEdit,
  ULFCheckBox, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  TFlatCheckBoxUnit, ULFLabel, ULFComboBox, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPregMayoresCantidad = class(TFPEditListadoSimple)
     GBFecha: TGroupBox;
     DTPFecha: TLFDateEdit;
     LblFecha: TLFLabel;
     GBFechas: TGroupBox;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     LBLDesde: TLFLabel;
     LBLHasta: TLFLabel;
     TButtConfigurar: TToolButton;
     LBLCantidad: TLFLabel;
     EDTCantidad: TLFEdit;
     CB347: TLFCheckBox;
     CBOrden: TLFComboBox;
     LblOrden: TLFLabel;
     procedure ARecargarExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregMayoresCantidad : TFPregMayoresCantidad;

implementation

uses
  UDMMain, UEntorno, UFormGest, UDMRMayoresCantidad, UFMListConfig, UDMListados,
  UUtiles;

{$R *.DFM}

procedure TFPregMayoresCantidad.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRMayoresCantidad, DMRMayoresCantidad);
  ARecargarExecute(Sender);

  if (CB347.State = cbChecked) then
     Grupo := 100
  else
     Grupo := 18;

  Listado := DMRMayoresCantidad.frMayoresCantidad;
  ListadoFR3 := DMRMayoresCantidad.frxMayoresCantidad;
  ListadoHYM := DMRMayoresCantidad.HYReportMail;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregMayoresCantidad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRMayoresCantidad);
end;

procedure TFPregMayoresCantidad.ARecargarExecute(Sender: TObject);
begin
  inherited;

  DTPDesde.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  DTPHasta.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  DTPFecha.Date := REntorno.FechaTrab;
end;

procedure TFPregMayoresCantidad.FormShow(Sender: TObject);
begin
  DTPDesde.SetFocus;
end;

procedure TFPregMayoresCantidad.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  TipoOrden : byte;
begin
  with DMRMayoresCantidad do
  begin
     FechaListado := Int(DTPFecha.Date);
     FechaDesde := HourIntoDate(DTPDesde.Date, '00:00:00');
     FechaHasta := HourIntoDate(DTPHasta.Date, '23:59:59');

     if EDTCantidad.Text = '' then
        Cantidad := 0
     else
        Cantidad := StrToFloat(EDTCantidad.Text);

     TipoOrden := 0;
     if (CB347.State = cbChecked) then
        TipoOrden := 2;

     CalculaInforme(TipoOrden, REntorno.Ejercicio, CBOrden.ItemIndex, -1, -1);
  end;

  DMRMayoresCantidad.MostrarListado(Modo, TipoOrden);
end;

procedure TFPregMayoresCantidad.AConfigurarExecute(Sender: TObject);
begin
  if (CB347.State = cbChecked) then
     Grupo := 100
  else
     Grupo := 18;

  inherited;
end;

end.
