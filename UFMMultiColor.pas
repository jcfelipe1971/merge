unit UFMMultiColor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMMultiColor = class(TFPEditSimple)
     AMarcarTodos: TAction;
     ADesmarcarTodos: TAction;
     DBGMain: TDBGridFind2000;
     TBSep: TToolButton;
     TBMarcarTodos: TToolButton;
     TBDesmarcarTodos: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure ADesmarcarTodosExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RellenarSeleccion(ID_A_M: integer);
  end;

var
  FMMultiColor : TFMMultiColor;

implementation

uses UDMMultiColor, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMMultiColor.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMultiColor, DMMultiColor);
  NavMain.DataSource := DMMultiColor.DSQMColores;
  DBGMain.DataSource := DMMultiColor.DSQMColores;
end;

procedure TFMMultiColor.RellenarSeleccion(ID_A_M: integer);
begin
  DMMultiColor.RellenarSeleccion(ID_A_M);
end;

procedure TFMMultiColor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMMultiColor);
end;

procedure TFMMultiColor.AMarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DMMultiColor.MarcarTodos(1);
end;

procedure TFMMultiColor.ADesmarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DMMultiColor.MarcarTodos(0);
end;

end.
