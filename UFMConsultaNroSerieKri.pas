unit UFMConsultaNroSerieKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  Grids, DBGrids, ComCtrls, ULFEdit, ULFLabel, ULFPanel, ULFPageControl;

type
  TFMConsultaNroSerieKri = class(TForm)
     PNLMain: TLFPanel;
     PageControl1: TLFPageControl;
     TSNroSerie: TTabSheet;
     TSLotes: TTabSheet;
     PNLNroSerie: TLFPanel;
     LNroSerie: TLFLabel;
     ENroSerie: TLFEdit;
     LArticuloNroSerie: TLFLabel;
     PNLLotes: TLFPanel;
     LLote: TLFLabel;
     LArticuloLote: TLFLabel;
     ELote: TLFEdit;
     EFArticuloNroSerie: TEditFind2000;
     EFArticulosLotes: TEditFind2000;
     GBAlbaranEntrada: TGroupBox;
     GBAlbaranSalida: TGroupBox;
     DBGAlbaranEntrada: TDBGrid;
     DBGAlbaranSalida: TDBGrid;
     GBNrosDeSerie: TGroupBox;
     DBGNrosDeSerie: TDBGrid;
     GBAlbaranLoteEntrada: TGroupBox;
     DBGAlbaranLoteEntrada: TDBGrid;
     GBAlbaranLoteSalida: TGroupBox;
     DBGAlbaranLoteSalida: TDBGrid;
     GBLote: TGroupBox;
     DBGLote: TDBGrid;
     GBMovimientoentrada: TGroupBox;
     GBMovimientoSalida: TGroupBox;
     DBGMovimientoentrada: TDBGrid;
     DBGMovimientoSalida: TDBGrid;
     GBMovimientoLoteEntrada: TGroupBox;
     GBMovimientoLoteSalida: TGroupBox;
     DBGMovimientoLoteEntrada: TDBGrid;
     DBGMovimientoLoteSalida: TDBGrid;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ENroSerieChange(Sender: TObject);
     procedure EFArticuloNroSerieChange(Sender: TObject);
     procedure EFArticulosLotesChange(Sender: TObject);
     procedure ELoteChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMConsultaNroSerieKri : TFMConsultaNroSerieKri;

implementation

uses UDMMain, UDMConsultaNroSerieKri, UEntorno, UFormGest;

{$R *.dfm}

procedure TFMConsultaNroSerieKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMConsultaNroSerieKri, DMConsultaNroSerieKri);
end;

procedure TFMConsultaNroSerieKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMConsultaNroSerieKri);
  Action := caFree;
end;

procedure TFMConsultaNroSerieKri.ENroSerieChange(Sender: TObject);
begin
  if (Trim(ENroSerie.Text) <> '') then
  begin
     EFArticuloNroSerie.Text := '';
     DMConsultaNroSerieKri.BuscaNroSerie(ENroSerie.Text);
  end;
end;

procedure TFMConsultaNroSerieKri.EFArticuloNroSerieChange(Sender: TObject);
begin
  if (Trim(EFArticuloNroSerie.Text) <> '') then
  begin
     ENroSerie.Text := '';
     DMConsultaNroSerieKri.BuscaArticuloSerie(EFArticuloNroSerie.Text);
  end;
end;

procedure TFMConsultaNroSerieKri.EFArticulosLotesChange(Sender: TObject);
begin
  if (Trim(EFArticulosLotes.Text) <> '') then
  begin
     ELote.Text := '';
     DMConsultaNroSerieKri.BuscaArticuloLote(EFArticulosLotes.Text);
  end;
end;

procedure TFMConsultaNroSerieKri.ELoteChange(Sender: TObject);
begin
  if (Trim(ELote.Text) <> '') then
  begin
     EFArticulosLotes.Text := '';
     DMConsultaNroSerieKri.BuscaLote(ELote.Text);
  end;
end;

end.
