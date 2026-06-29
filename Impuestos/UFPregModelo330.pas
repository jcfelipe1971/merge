unit UFPregModelo330;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Grids,
  DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UHYDBGrid,
  NsDBGrid, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar, ULFLabel,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregModelo330 = class(TFPEditListadoSimple)
     PNMain: TLFPanel;
     LTituloModelo: TLFLabel;
     DBGFModelo300: THYTDBGrid;
     TButtConfigurar: TToolButton;
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
  FPregModelo330 : TFPregModelo330;

implementation

uses UDMRModelosHacienda, UFormGest, UFMListConfig;

{$R *.DFM}

procedure TFPregModelo330.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);
  ARecargarExecute(Sender);

  Grupo := 133;
  Listado := DMRModelosHacienda.frModelo330;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregModelo330.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
end;

procedure TFPregModelo330.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.ReCalcular330;
end;

procedure TFPregModelo330.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRModelosHacienda.Previsualizar330(Modo);
end;

end.
