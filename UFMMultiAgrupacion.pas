unit UFMMultiAgrupacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, UNavigator, Menus,
  UTeclas, UControlEdit, NsDBGrid, ULFActionList, ULFPanel, ULFToolBar;

type
  TFMMultiAgrupacion = class(TG2KForm)
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
     procedure SetTipo(Tipo: string);
  end;

var
  FMMultiAgrupacion : TFMMultiAgrupacion;

implementation

uses UDMMultiAgrupacion, UDMMain, UEntorno;

{$R *.DFM}

procedure TFMMultiAgrupacion.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMMultiAgrupacion, DMMultiAgrupacion);
end;

procedure TFMMultiAgrupacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMultiAgrupacion);
  Action := caFree;
end;

procedure TFMMultiAgrupacion.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMMultiAgrupacion.AMarcarTodosExecute(Sender: TObject);
begin
  DMMultiAgrupacion.MarcarTodos(1);
end;

procedure TFMMultiAgrupacion.ADesmarcarTodosExecute(Sender: TObject);
begin
  DMMultiAgrupacion.MarcarTodos(0);
end;

procedure TFMMultiAgrupacion.SetTipo(Tipo: string);
begin
  /// A : Acreedores
  /// C : Clientes
  /// P : Proveedores
  /// R : Representantes
  /// T : Artículos

  DMMultiAgrupacion.SetTipo(Tipo);
end;

end.
