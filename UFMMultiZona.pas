unit UFMMultiZona;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, UNavigator, Menus,
  UTeclas, UControlEdit, NsDBGrid, ULFActionList, ULFPanel, ULFToolBar;

type
  TFMMultiZona = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtMarcarTodos: TToolButton;
     TButtDesmarcarTodos: TToolButton;
     PMain: TLFPanel;
     DBGSeleccion: TDBGridFind2000;
     TButtSalir: TToolButton;
     ALMain: TLFActionList;
     AMarcarTodos: TAction;
     ADesmarcarTodos: TAction;
     ASalir: TAction;
     NavMain: THYMNavigator;
     ToolButton1: TToolButton;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASalirExecute(Sender: TObject);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure ADesmarcarTodosExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMultiZona : TFMMultiZona;

implementation

uses UDMMultiZona, UDMMain, UEntorno;

{$R *.DFM}

procedure TFMMultiZona.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMMultiZona, DMMultiZona);
end;

procedure TFMMultiZona.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMultiZona);
  Action := caFree;
end;

procedure TFMMultiZona.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMMultiZona.AMarcarTodosExecute(Sender: TObject);
begin
  DMMultiZona.MarcarTodos(1);
end;

procedure TFMMultiZona.ADesmarcarTodosExecute(Sender: TObject);
begin
  DMMultiZona.MarcarTodos(0);
end;

end.
