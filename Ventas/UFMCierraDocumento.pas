unit UFMCierraDocumento;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls, UControlEdit,
  UFormGest, NsDBGrid, ULFPanel, ULFToolBar, rxPlacemnt, ULFFormStorage,
  ULFLabel, UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas,
  UFPEditSimple, UNavigator;

type
  TFMCierraDocumento = class(TFPEditSimple)
     TButtSep2: TToolButton;
     TButtTodos: TToolButton;
     TButtDesmarcar: TToolButton;
     TButtSep3: TToolButton;
     TButtCerrar: TToolButton;
     DBLCBSerie: TDBLookupComboBox;
     LSerie: TLFLabel;
     TButtSep4: TToolButton;
     TButtRefrescar: TToolButton;
     DBGCierraDocumento: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtDesmarcarClick(Sender: TObject);
     procedure TButtCerrarClick(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure DBGCierraDocumentoDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCierraDocumento : TFMCierraDocumento;

implementation

uses UDMMain, UDMCierraDocumento, UEntorno, UUtiles, UFMain;

{$R *.DFM}

procedure TFMCierraDocumento.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCierraDocumento, DMCierraDocumento);
  DBGCierraDocumento.ColumnasChecked.Strings[DBGCierraDocumento.ColumnasCheckBoxes.IndexOf('ENTRADA_FACTURACION')] := REntorno.EntradaStr;
  DBLCBSerie.KeyValue := REntorno.Serie;
end;

procedure TFMCierraDocumento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCierraDocumento);
end;

procedure TFMCierraDocumento.TButtTodosClick(Sender: TObject);
begin
  DMCierraDocumento.MarcarTodo(REntorno.Entrada);
end;

procedure TFMCierraDocumento.TButtDesmarcarClick(Sender: TObject);
begin
  DMCierraDocumento.MarcarTodo(0);
end;

procedure TFMCierraDocumento.TButtCerrarClick(Sender: TObject);
begin
  if Confirma then
     DMCierraDocumento.Cerrar;
end;

procedure TFMCierraDocumento.TButtRefrescarClick(Sender: TObject);
begin
  DMCierraDocumento.xSeries.Refresh;
end;

procedure TFMCierraDocumento.DBGCierraDocumentoDblClick(Sender: TObject);
begin
  FMain.TraspasoDeDocumentosSalida(DMCierraDocumento.QMCabecerasID_S.AsInteger);
end;

end.
