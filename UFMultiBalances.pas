unit UFMultiBalances;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, UNavigator, Menus,
  UTeclas, UControlEdit, NsDBGrid, ULFActionList, ULFPanel, ULFToolBar,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, UEditPanel;

type
  TFMultiBalances = class(TFPEditSimple)
     TButtMarcarTodos: TToolButton;
     TButtDesmarcarTodos: TToolButton;
     DBGSeleccion: TDBGridFind2000;
     AMarcarTodos: TAction;
     ADesmarcarTodos: TAction;
     ASalir: TAction;
     TSep1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure ADesmarcarTodosExecute(Sender: TObject);
  private
     { Private declarations }
  public
     //procedure Mostrar(var CanalOut:integer; Lista : TStringList);
     procedure Mostrar(Balance: integer; Periodo: string);
  end;

var
  FMultiBalances : TFMultiBalances;

implementation

uses UDMMultiBalances, UDMMain, UEntorno;

{$R *.DFM}

procedure TFMultiBalances.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMultiBalances, DMMultiBalances);
end;

procedure TFMultiBalances.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMultiBalances);
end;

procedure TFMultiBalances.Mostrar(Balance: integer; Periodo: string);
begin
  DMMultiBalances.RellenarSeleccion(Balance, Periodo);
  ShowModal;
end;

procedure TFMultiBalances.AMarcarTodosExecute(Sender: TObject);
begin
  DMMultiBalances.MarcarTodos(1);
end;

procedure TFMultiBalances.ADesmarcarTodosExecute(Sender: TObject);
begin
  DMMultiBalances.MarcarTodos(0);
end;

end.
