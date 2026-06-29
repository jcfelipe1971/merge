unit UFMLmpTablasTmp;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  UEditPanel, ComCtrls, ToolWin, UFormGest, ActnList, ULFActionList,
  ULFToolBar, NsDBGrid, ULFPanel, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, Menus, UTeclas, UControlEdit;

type
  TFMLmpTablasTmp = class(TFPEditSinNavegador)
     DBGridFTablas: TDBGridFind2000;
     TButtTodas: TToolButton;
     TButtDesmarcar: TToolButton;
     TButtRefrescar: TToolButton;
     TButtSep2: TToolButton;
     TButtLimpiar: TToolButton;
     TButtSep3: TToolButton;
     ASeleccionarTodo: TAction;
     ADesSeleccionar: TAction;
     ARefrescar: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtLimpiarClick(Sender: TObject);
     procedure ASeleccionarTodoExecute(Sender: TObject);
     procedure ADesSeleccionarExecute(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLmpTablasTmp : TFMLmpTablasTmp;

implementation

uses UDMLmpTablasTmp, UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMLmpTablasTmp.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLmpTablasTmp, DMLmpTablasTmp);
end;

procedure TFMLmpTablasTmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLmpTablasTmp);
end;

procedure TFMLmpTablasTmp.TButtLimpiarClick(Sender: TObject);
begin
  if ConfirmaMensaje(_('Esta operación puede afectar a diferente usuarios. ¿Desea continuar?')) then
     DMLmpTablasTmp.LimpiaTablasTemporales;

  ARefrescarExecute(Sender);
end;

procedure TFMLmpTablasTmp.ASeleccionarTodoExecute(Sender: TObject);
begin
  DMLmpTablasTmp.MarcarTodos(True);
end;

procedure TFMLmpTablasTmp.ADesSeleccionarExecute(Sender: TObject);
begin
  DMLmpTablasTmp.MarcarTodos(False);
end;

procedure TFMLmpTablasTmp.ARefrescarExecute(Sender: TObject);
begin
  DMLmpTablasTmp.RefrescaTablas;
end;

end.
