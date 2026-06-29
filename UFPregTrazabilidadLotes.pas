unit UFPregTrazabilidadLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, ULFLabel, ExtCtrls,
  ULFPanel, ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, Mask, DBCtrls, ULFDBEdit, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregTrazabilidadLotes = class(TFPEditListadoSimple)
     PNMain: TLFPanel;
     TButtMultiseleccion: TToolButton;
     ASeleccionaLote: TAction;
     LBLote: TLFLabel;
     LBSerie: TLFLabel;
     DBELote: TLFDbedit;
     DBESerie: TLFDbedit;
     TButtConfiguraListado: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ASeleccionaLoteExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MostrarDocumentos(Modo: byte);
  public
     { Public declarations }
  end;

var
  FPregTrazabilidadLotes : TFPregTrazabilidadLotes;

implementation

uses UFMultiSeleccion, UDMLstTrazabilidadLotes, UFormGest, UEntorno,
  UDMMain, UFInfoLotesLst;

{$R *.dfm}

procedure TFPregTrazabilidadLotes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstTrazabilidadLotes, DMLstTrazabilidadLotes);
  Grupo := 517;
  Listado := DMLstTrazabilidadLotes.frLotes;
  ListadoFR3 := DMLstTrazabilidadLotes.frxLotes;
end;

procedure TFPregTrazabilidadLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstTrazabilidadLotes);
end;

procedure TFPregTrazabilidadLotes.APrevExecute(Sender: TObject);
begin
  inherited;
  MostrarDocumentos(0);
end;

procedure TFPregTrazabilidadLotes.AImprimirExecute(Sender: TObject);
begin
  inherited;
  MostrarDocumentos(1);
end;

procedure TFPregTrazabilidadLotes.MostrarDocumentos(Modo: byte);
begin
  DMLstTrazabilidadLotes.MostrarListado(Modo);
end;

procedure TFPregTrazabilidadLotes.ASeleccionaLoteExecute(Sender: TObject);
var
  FInfoLotesLst : TFInfoLotesLst;
begin
  inherited;
  DMLstTrazabilidadLotes.AbreLotes;
  FInfolotesLst := TFInfoLotesLst.Create(Self);
  FInfolotesLst.ShowModal;
  FInfolotesLst.Free;
  DMLstTrazabilidadLotes.CierraLotes;
end;

procedure TFPregTrazabilidadLotes.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMLstTrazabilidadLotes.CierraLotes;
  DMLstTrazabilidadLotes.AsignaLote;
end;

end.
