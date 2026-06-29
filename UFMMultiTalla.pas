unit UFMMultiTalla;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMMultiTalla = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     AMarcarTodos: TAction;
     ADesmarcarTodos: TAction;
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
     procedure RellenarSeleccion(ID_G_T: integer; Pack: string = '');
  end;

var
  FMMultiTalla : TFMMultiTalla;

implementation

uses UDMMultiTalla, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMMultiTalla.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMultiTalla, DMMultiTalla);
  NavMain.DataSource := DMMultiTalla.DSQMTallas;
  DBGMain.DataSource := DMMultiTalla.DSQMTallas;
end;

procedure TFMMultiTalla.RellenarSeleccion(ID_G_T: integer; Pack: string = '');
begin
  DMMultiTalla.RellenarSeleccion(ID_G_T, Pack);
end;

procedure TFMMultiTalla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMMultiTalla);
end;

procedure TFMMultiTalla.AMarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DMMultiTalla.MarcarTodos(1);
end;

procedure TFMMultiTalla.ADesmarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DMMultiTalla.MarcarTodos(0);
end;

end.
