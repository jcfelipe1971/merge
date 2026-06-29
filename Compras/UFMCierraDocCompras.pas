unit UFMCierraDocCompras;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls, UControlEdit,
  UFormGest, NsDBGrid, ULFPanel, ULFToolBar, rxPlacemnt, ULFFormStorage,
  ULFLabel, UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas,
  UFPEditSimple, UNavigator;

type
  TFMCierraDocCompras = class(TFPEditSimple)
     TButtSep2: TToolButton;
     TButtTodos: TToolButton;
     TButtDesmarcar: TToolButton;
     TButtSep3: TToolButton;
     TButtCerrar: TToolButton;
     DBLCBSerie: TDBLookupComboBox;
     LBLSerie: TLFLabel;
     TButtSep4: TToolButton;
     TButtRefrescar: TToolButton;
     DBGProveedor: TDBGridFind2000;
     PNTipoFactura: TLFPanel;
     RBFacturaProveedor: TRadioButton;
     RBFacturaAcreedor: TRadioButton;
     DBGAcreedor: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtDesmarcarClick(Sender: TObject);
     procedure TButtCerrarClick(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure RBFacturaProveedorClick(Sender: TObject);
     procedure RBFacturaAcreedorClick(Sender: TObject);
     procedure DBGAcreedorDblClick(Sender: TObject);
     procedure DBGProveedorDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCierraDocCompras : TFMCierraDocCompras;

implementation

uses UDMMain, UEntorno, UDMCierraDocCompras, UFMain;

{$R *.DFM}

procedure TFMCierraDocCompras.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMCierraDocCompras, DMCierraDocCompras);

  DBGProveedor.ColumnasChecked.Strings[DBGProveedor.ColumnasCheckBoxes.IndexOf('ENTRADA')] := REntorno.EntradaStr;
  DBGAcreedor.ColumnasChecked.Strings[DBGACreedor.ColumnasCheckBoxes.IndexOf('ENTRADA')] := REntorno.EntradaStr;
  DBLCBSerie.KeyValue := REntorno.Serie;

  RBFacturaProveedor.Checked := True;
  RBFacturaProveedorClick(Sender);
end;

procedure TFMCierraDocCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCierraDocCompras);
end;

procedure TFMCierraDocCompras.TButtTodosClick(Sender: TObject);
begin
  DMCierraDocCompras.MarcarTodo(REntorno.Entrada, RBFacturaProveedor.Checked);
end;

procedure TFMCierraDocCompras.TButtDesmarcarClick(Sender: TObject);
begin
  DMCierraDocCompras.MarcarTodo(1, RBFacturaProveedor.Checked);
end;

procedure TFMCierraDocCompras.TButtCerrarClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMCierraDocCompras.CierraFacturas(RBFacturaProveedor.Checked);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMCierraDocCompras.TButtRefrescarClick(Sender: TObject);
begin
  DMCierraDocCompras.Muestra;
end;

procedure TFMCierraDocCompras.RBFacturaProveedorClick(Sender: TObject);
begin
  DBGAcreedor.Visible := False;
  DBGProveedor.Visible := True;
  DMCierraDocCompras.SeleccionaTipo(True);
end;

procedure TFMCierraDocCompras.RBFacturaAcreedorClick(Sender: TObject);
begin
  DBGProveedor.Visible := False;
  DBGAcreedor.Visible := True;
  DMCierraDocCompras.SeleccionaTipo(False);
end;

procedure TFMCierraDocCompras.DBGAcreedorDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMCierraDocCompras.QMCabecerasAcreID_E.AsInteger);
end;

procedure TFMCierraDocCompras.DBGProveedorDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMCierraDocCompras.QMCabecerasProID_E.AsInteger);
end;

end.
