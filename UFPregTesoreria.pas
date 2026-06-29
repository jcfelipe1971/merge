unit UFPregTesoreria;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DBCtrls,
  Mask, rxToolEdit, ULFEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFCheckBox, TFlatCheckBoxUnit, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregTesoreria = class(TFPEditListadoSimple)
     LFecha: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     Vencimiento: TGroupBox;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     DTPDesde: TLFDateEdit;
     PNLComentarios: TLFPanel;
     LComentario: TLFLabel;
     DBLCBMoneda: TDBLookupComboBox;
     LMoneda: TLFLabel;
     EComentario: TLFEdit;
     PNLTesoreria: TLFPanel;
     TButtConfRapida: TToolButton;
     LBLComP: TLFLabel;
     EComPagos: TLFEdit;
     LBLComC: TLFLabel;
     EComCobros: TLFEdit;
     CBTitCuen: TLFCheckBox;
     CBNumDoc: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregTesoreria : TFPregTesoreria;

implementation

{$R *.DFM}

uses UDMMain, UFormGest, UDMRTesoreria, UEntorno, UFMListConfig;

procedure TFPregTesoreria.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRTesoreria, DMRTesoreria);
  ARecargarExecute(Self);

  Grupo := 29;
  Listado := DMRTesoreria.frHYTesoreria;
  ListadoFR3 := DMRTesoreria.frxHYTesoreria;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregTesoreria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRTesoreria);
end;

procedure TFPregTesoreria.ARecargarExecute(Sender: TObject);
var
  FDesde, FHasta : TDateTime;
begin
  DTPFechaListado.Date := REntorno.FechaTrab;
  DMRTesoreria.Rangos(FDesde, FHasta);
  DTPDesde.Date := FDesde;
  DTPHasta.Date := FHasta;
  DBLCBMoneda.KeyValue := REntorno.Moneda;
  EComentario.Text := '';
  EComPagos.Text := _('Pago S / f  ');
  EComCobros.Text := _('Cobro N / f  ');
  CBNumDoc.Checked := True;
  CBTitCuen.Checked := False;
end;

procedure TFPregTesoreria.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRTesoreria.CalculaInforme(EComPagos.Text, EComCobros.Text, CBNumDoc.Checked,
     CBTitCuen.Checked, DTPDesde.Date, DTPHasta.Date, DTPFechaListado.Date, EComentario.Text, DBLCBMoneda.Text);

  DMRTesoreria.MostrarListado(Modo);
end;

end.
