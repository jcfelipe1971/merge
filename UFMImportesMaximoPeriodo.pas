unit UFMImportesMaximoPeriodo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMImportesMaximoPeriodo = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMImportesMaximoPeriodo : TFMImportesMaximoPeriodo;

implementation

uses
  UDMImportesMaximoPeriodo, UDMMain, UEntorno, UFormGest;

{$R *.dfm}

procedure TFMImportesMaximoPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImportesMaximoPeriodo, DMImportesMaximoPeriodo);
  NavMain.DataSource := DMImportesMaximoPeriodo.DSQMPeriodos;
  DBGMain.DataSource := DMImportesMaximoPeriodo.DSQMPeriodos;
end;

procedure TFMImportesMaximoPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImportesMaximoPeriodo);
end;

end.
