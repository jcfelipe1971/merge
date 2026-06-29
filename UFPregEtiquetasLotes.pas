unit UFPregEtiquetasLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFToolBar, ULFEdit, ULFPanel, ULFLabel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, UFPEditListado,
  rxPlacemnt, ULFFormStorage, ULFPageControl, UFPEditListadoSimple;

type
  TFPregEtiquetasLotes = class(TFPEditListadoSimple)
     PNLCodBarras: TLFPanel;
     LBLEtiVacias: TLFLabel;
     EEtiquetas: TLFEdit;
     TButtConfRapida: TToolButton;
     LIdioma: TLFLabel;
     EIdioma: TLFEditFind2000;
     EPastadas: TLFEdit;
     LPastadas: TLFLabel;
     EPastadasCantEtiq: TLFEdit;
     LPastadasCantEtiq: TLFLabel;
     LSufijo: TLFLabel;
     ESufijo: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EEtiquetasKeyPress(Sender: TObject; var Key: char);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     CantidadEtiquetas: integer;
     IdLote: integer;
     Articulo, Descripcion, Serie, Clasificacion: string;
     FFabricacion, FCaducidad, FEnvasado: TDateTime;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestrate(Etiqueta: integer; aCantidadEtiquetas, aIdLote: integer; aArticulo, aDescripcion, aSerie, aClasificacion: string; aFFabricacion, aFCaducidad, aFEnvasado: TDateTime);
  end;

var
  FpregEtiquetasLotes : TFPregEtiquetasLotes;

implementation

uses UFMListConfig, UDMLstLotes, UEntorno;

{$R *.DFM}

procedure TFPregEtiquetasLotes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstLotes, DMLstLotes);
  EIdioma.Text := REntorno.IdiomaCanal;

  Grupo := 124;
  Listado := DMLstLotes.frLotes;
  ListadoFR3 := DMLstLotes.frxLotes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregEtiquetasLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstLotes);
end;

procedure TFPregEtiquetasLotes.Muestrate(Etiqueta: integer; aCantidadEtiquetas, aIdLote: integer; aArticulo, aDescripcion, aSerie, aClasificacion: string; aFFabricacion, aFCaducidad, aFEnvasado: TDateTime);
begin
  case Etiqueta of
     1: Grupo := 124;
     2: Grupo := 659;
  end;

  IdLote := aIdLote;
  Articulo := aArticulo;
  Descripcion := aDescripcion;
  Serie := aSerie;
  Clasificacion := aClasificacion;
  FFabricacion := aFFabricacion;
  FCaducidad := aFCaducidad;
  FEnvasado := aFEnvasado;

  CantidadEtiquetas := aCantidadEtiquetas;

  ARecargar.Execute;

  ShowModal;
end;

procedure TFPregEtiquetasLotes.EEtiquetasKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8{, '-', ThousandSeparator, DecimalSeparator}]) then
     Key := #0;
end;

procedure TFPregEtiquetasLotes.ARecargarExecute(Sender: TObject);
var
  Pastadas : integer;
  PastadasCantEtiq : integer;
begin
  inherited;
  EEtiquetas.Text := IntToStr(CantidadEtiquetas);
  EIdioma.Text := REntorno.IdiomaCanal;

  DMLstLotes.InfoPastadas(Articulo, Pastadas, PastadasCantEtiq);

  EPastadas.Text := IntToStr(Pastadas);
  EPastadasCantEtiq.Text := IntToStr(PastadasCantEtiq);

  ESufijo.Text := '.1';
end;

procedure TFPregEtiquetasLotes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstLotes.LanzaEtiquetas(Grupo, StrToIntDef(EEtiquetas.Text, 0), IdLote,
     Modo, Articulo, Descripcion,
     Serie, Clasificacion, EIdioma.Text, FFabricacion, FCaducidad, FEnvasado, StrToIntDef(EPastadas.Text, 0), StrToIntDef(EPastadasCantEtiq.Text, 0), ESufijo.Text);
end;

end.
