unit UFPregIntrastatCV;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, rxToolEdit, StdCtrls,
  RXDBCtrl, ULFDBEdit, ULFEdit, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, ULFDBDateEdit, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, ExtCtrls, ULFPanel, UFPEditListadoSimple;

type
  TFPregIntrastatCV = class(TFPEditListadoSimple)
     TButtConf: TToolButton;
     GBDatos: TGroupBox;
     Comentario: TLFLabel;
     LBLFechaListado: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     GBDatos2: TGroupBox;
     LBlSerie: TLFLabel;
     LBLPeriodo: TLFLabel;
     EFSerie: TLFEditFind2000;
     EFPeriodo: TLFEditFind2000;
     ETituloSerie: TLFEdit;
     DBETituloPeriodo: TLFDbedit;
     DBDEDesde: TLFDBDateEdit;
     DBDEHasta: TLFDBDateEdit;
     TBExportar: TToolButton;
     procedure ARecargarExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure TipoCV(Tip: byte);
  end;

var
  FPregIntrastatCV : TFPregIntrastatCV;

implementation

uses UDMLstIntrastatCV, UFormGest, UFMListConfig, UEntorno, UDMMain, DateUtils, UDameDato;

{$R *.dfm}

procedure TFPregIntrastatCV.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstIntrastatCV, DMLstIntrastatCV);
  ARecargarExecute(Sender);

  Grupo := 204;
  Listado := DMLstIntrastatCV.frIntrastatCV;
  ListadoFR3 := DMLstIntrastatCV.frxIntrastatCV;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregIntrastatCV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstIntrastatCV);
end;

procedure TFPregIntrastatCV.TipoCV(Tip: byte);
begin
  DMLstIntrastatCV.Tipo := Tip;
  if (Tip = 0) then
     FPregIntrastatCV.Caption := _('Listado de Compras de Intrastat')
  else
     FPregIntrastatCV.Caption := _('Listado de Ventas de Intrastat');
end;

procedure TFPregIntrastatCV.ARecargarExecute(Sender: TObject);
begin
  EFSerie.Text := '';
  EFSerieChange(Sender);

  EFPeriodo.Text := format('%.2d', [MonthOf(TODAY) - 1]);
  if (EFPeriodo.Text = '00') then
     EFPeriodo.Text := '01';

  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TFPregIntrastatCV.EFSerieChange(Sender: TObject);
begin
  if (Trim(EFSerie.Text) = '') then
     ETituloSerie.Text := _('Todas')
  else
     ETituloSerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFPregIntrastatCV.EFPeriodoChange(Sender: TObject);
begin
  DMLstIntrastatCV.CambiaPeriodo(EFPeriodo.Text);
end;

procedure TFPregIntrastatCV.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstIntrastatCV.MostrarListado(Modo, Trim(EFSerie.Text), EFPeriodo.Text, DTPFechaListado.Date, EComentario.Text);
end;

end.
