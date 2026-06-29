unit UFPregRecibosFacturas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ComCtrls, ToolWin, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UControlEdit, UFormGest, ULFDBEdit,
  ULFEdit, ULFToolBar, ULFEditFind2000, ULFLabel;

type
  TFPregRecibosFacturas = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtImprimir: TToolButton;
     TButtSalir: TToolButton;
     GBFechas: TGroupBox;
     Label1: TLFLabel;
     Label2: TLFLabel;
     GBSeries: TGroupBox;
     TButtPrevisualizar: TToolButton;
     TButtRecargar: TToolButton;
     TButtConfRapida: TToolButton;
     EFSerie: TLFEditFind2000;
     DBESerieD: TLFDbedit;
     EdRIGMin: TLFEdit;
     EdRIGMax: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtImprimirClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtRecargarClick(Sender: TObject);
     procedure TButtConfRapidaClick(Sender: TObject);
     procedure TButtPrevisualizarClick(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private

     procedure Recargar;
     procedure ImprimirRecibos(Modo: smallint);
  public

     procedure Mostrar;
  end;

var
  FPregRecibosFacturas : TFPregRecibosFacturas;

implementation

uses UDMMain, UUtiles, UDMLstCarteraRecibos, UFMListConfig;

{$R *.DFM}

procedure TFPregRecibosFacturas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE 

  AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
end;

procedure TFPregRecibosFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstCarteraRecibos);
  Action := caFree;
end;

procedure TFPregRecibosFacturas.Mostrar;
begin
  Recargar;
  ShowModal;
end;

procedure TFPregRecibosFacturas.Recargar;
begin
  EFSerie.Text := DMLstCarteraRecibos.RangoSerie;
  EdRIGMin.Text := DMLstCarteraRecibos.RangoFacturaMin(EFSerie.Text, 'FAC');
  EdRIGMax.Text := DMLstCarteraRecibos.RangoFacturaMax(EFSerie.Text, 'FAC');
end;

procedure TFPregRecibosFacturas.TButtImprimirClick(Sender: TObject);
begin
  ImprimirRecibos(1);
end;

procedure TFPregRecibosFacturas.TButtPrevisualizarClick(Sender: TObject);
begin
  ImprimirRecibos(0);
end;

procedure TFPregRecibosFacturas.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFPregRecibosFacturas.TButtRecargarClick(Sender: TObject);
begin
  Recargar;
end;

procedure TFPregRecibosFacturas.TButtConfRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(1, Formato, Cabecera, Copias, Pijama, '',
     DMLstCarteraRecibos.frRecibos, DMLstCarteraRecibos.HYRRecibos);
end;

procedure TFPregRecibosFacturas.EFSerieChange(Sender: TObject);
begin
  DMLstCarteraRecibos.RefrescarSerie(EFSerie.Text);
end;

procedure TFPregRecibosFacturas.ImprimirRecibos(Modo: smallint);
var
  RIGMin, RIGMax : integer;
begin
  RIGMin := StrToIntDef(EdRIGMin.Text, 0);
  RIGMax := StrToIntDef(EdRIGMax.Text, 0);
  if (RIGMin <> 0) and (RIGMax <> 0) then
     DMLstCarteraRecibos.ImprimirRecibosDeFacturas('C', EFSerie.Text,
        'FAC', RIGMin, RIGMax, Modo);
end;

end.
