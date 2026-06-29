unit UFMProcesosMasivosLineas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, UNavigator, ToolWin, ComCtrls,
  ULFToolBar, StdCtrls, Buttons, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel, UFPEditSimple;

type
  TFMProcesosMasivosLineas = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     TBSep1: TToolButton;
     TBMarcarTodo: TToolButton;
     TBDesmarcarTodo: TToolButton;
     TBSep2: TToolButton;
     TBConfirmar: TToolButton;
     TBSep3: TToolButton;
     TBCancelar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure TBMarcarTodoClick(Sender: TObject);
     procedure TBDesmarcarTodoClick(Sender: TObject);
     procedure TBConfirmarClick(Sender: TObject);
     procedure TBCancelarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     procedure Inicializar(Tipo: string; ID_Doc: integer);
     procedure BorrarTemporal;
  end;

var
  FMProcesosMasivosLineas : TFMProcesosMasivosLineas;

implementation

uses UDMMain, UEntorno, UFMain, UDMProcesosMasivosLineas, UFormGest;

{$R *.dfm}

procedure TFMProcesosMasivosLineas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMProcesosMasivosLineas, DMProcesosMasivosLineas);

  NavMain.DataSource := DMProcesosMasivosLineas.DSQMDocLineas;
  DBGMain.DataSource := DMProcesosMasivosLineas.DSQMDocLineas;
end;

procedure TFMProcesosMasivosLineas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMProcesosMasivosLineas);
end;

procedure TFMProcesosMasivosLineas.Inicializar(Tipo: string; ID_Doc: integer);
begin
  DMProcesosMasivosLineas.Inicializar(Tipo, ID_Doc);
end;

procedure TFMProcesosMasivosLineas.BorrarTemporal;
begin
  DMProcesosMasivosLineas.BorrarTemporal;
end;

procedure TFMProcesosMasivosLineas.TBMarcarTodoClick(Sender: TObject);
begin
  inherited;
  DMProcesosMasivosLineas.MarcarTodo(True);
end;

procedure TFMProcesosMasivosLineas.TBDesmarcarTodoClick(Sender: TObject);
begin
  inherited;
  DMProcesosMasivosLineas.MarcarTodo(False);
end;

procedure TFMProcesosMasivosLineas.TBConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFMProcesosMasivosLineas.TBCancelarClick(Sender: TObject);
begin
  inherited;
  DMProcesosMasivosLineas.BorrarTemporal;
  ModalResult := mrCancel;
end;

end.
