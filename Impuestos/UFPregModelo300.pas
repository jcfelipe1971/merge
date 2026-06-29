unit UFPregModelo300;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Grids,
  DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UHYDBGrid,
  NsDBGrid, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar, ULFLabel,
  ShellApi, rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregModelo300 = class(TFPEditListadoSimple)
     PNMain: TLFPanel;
     LTitulo: TLFLabel;
     DBGFModelo300: THYTDBGrid;
     TButtConfigurar: TToolButton;
     TButtModeloOficial: TToolButton;
     TButtInstrucciones: TToolButton;
     AModeloOficial: TAction;
     AInstrucciones: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure AModeloOficialExecute(Sender: TObject);
     procedure AInstruccionesExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregModelo300 : TFPregModelo300;

implementation

uses UDMRModelosHacienda, UFormGest, UDMMain, UFMListConfig, UEntorno;

{$R *.DFM}

procedure TFPregModelo300.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  ARecargarExecute(Sender);

  Grupo := 132;
  Listado := DMRModelosHacienda.frModelo300;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregModelo300.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
end;

procedure TFPregModelo300.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.ReCalcular;
end;

procedure TFPregModelo300.AModeloOficialExecute(Sender: TObject);
begin
  DMRModelosHacienda.GeneraModeloOficial_300;
end;

procedure TFPregModelo300.AInstruccionesExecute(Sender: TObject);
begin
  {dji lrk kri - Cambio la ruta, relativa al exe}
  if ShellExecute(Application.Handle, nil, PChar(REntorno.RutaEXE + 'ModelosHacienda\instr_300.pdf'), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la búsqueda de la ayuda'));
end;

procedure TFPregModelo300.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRModelosHacienda.Previsualizar(Modo);
end;

end.
