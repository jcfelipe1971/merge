unit UFMImprimePedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, ULFCheckBox, StdCtrls, ULFEdit, ULFLabel,
  TFlatCheckBoxUnit, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ULFComboBox, Buttons, uUtiles;

type
  TFMimprimePedidos = class(TFPEditSimple)
     DBGPedidos: THYTDBGrid;
     TButtCancelar: TToolButton;
     TbuttMarcar: TToolButton;
     TButtSeparador1: TToolButton;
     TButtSeparador2: TToolButton;
     TButtImprimir: TToolButton;
     PMImprime: TPopupMenu;
     MIImprimirPedidos: TMenuItem;
     MIConfiguracionRapida: TMenuItem;
     N1: TMenuItem;
     ToolButton1: TToolButton;
     TButtRefrescarKri: TToolButton;
     MIEnvioPDF: TMenuItem;
     CBDocsPendientes: TLFCheckBox;
     PnlPedidos: TLFPanel;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     EDesdeDocumento: TLFEdit;
     EHastaDocumento: TLFEdit;
     BtnFiltrar: TSpeedButton;
     BtnLimpiar: TSpeedButton;
     PNLSoloPendientes: TLFPanel;
     PNLSeries: TLFPanel;
     LSerie: TLFLabel;
     CBSeries: TLFComboBox;
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure DBGPedidosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGPedidosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGPedidosCellClick(Column: TColumn);
     procedure MIImprimirPedidosClick(Sender: TObject);
     procedure MIConfiguracionRapidaClick(Sender: TObject);
     procedure TButtRefrescarKriClick(Sender: TObject);
     procedure MIEnvioPDFClick(Sender: TObject);
     procedure CBDocsPendientesChange(Sender: TObject);
     procedure BtnFiltrarClick(Sender: TObject);
     procedure BtnLimpiarClick(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure DBGPedidosDblClick(Sender: TObject);
     procedure DBGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     SemaforoClick: boolean;
     Serie: string;
     ColActual: TColumn;
  public
     { Public declarations }
     function Seleccionado: boolean;
     procedure Marca;
     function Muestra(Query: TDataSet): integer;
  end;

var
  FMimprimePedidos : TFMimprimePedidos;

implementation

uses UDMImprimePedidos, UDMMain, UFMListConfig, UDMLstPedidos, UFMain, URellenaLista;

{$R *.DFM}

procedure TFMimprimePedidos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImprimePedidos, DMImprimePedidos);
  NavMain.DataSource := DMImprimePedidos.DSQMPedidos;
  CEMain.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
  SemaforoClick := False;

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  Serie := '';

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(BtnLimpiar, 1, DMMain.ILMain_Ac, 26);
  GetBitmapFromImageList(BtnLimpiar, 2, DMMain.ILMain_In, 26);
  GetBitmapFromImageList(BtnFiltrar, 1, DMMain.ILMain_Ac, 5);
  GetBitmapFromImageList(BtnFiltrar, 2, DMMain.ILMain_In, 5);

  ColActual := DBGPedidos.Columns[0];
end;

procedure TFMimprimePedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImprimePedidos);
end;

procedure TFMimprimePedidos.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  MIImprimirPedidosClick(Sender);
end;

function TFMimprimePedidos.Seleccionado: boolean;
begin
  Result := DBGPedidos.SelectedRows.CurrentRowSelected;
end;

procedure TFMimprimePedidos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMImprimePedidos.BusquedaCompleja(CBDocsPendientes.Checked, Serie);
  Continua := False;
end;

function TFMimprimePedidos.Muestra(Query: TDataSet): integer;
begin
  EPMain.VisibleButtons := [neReport, neSalir];
  DMImprimePedidos.Filtra(Query);
  Result := ShowModal;
end;

procedure TFMimprimePedidos.TbuttMarcarClick(Sender: TObject);
begin
  DBGPedidos.SelectedRows.Clear;
  DMImprimePedidos.Marcatodas(Self);
end;

procedure TFMimprimePedidos.Marca;
begin
  DBGPedidos.SelectedRows.CurrentRowSelected := True;
end;

procedure TFMimprimePedidos.TButtCancelarClick(Sender: TObject);
begin
  DBGPedidos.SelectedRows.Clear;
end;

procedure TFMimprimePedidos.DBGPedidosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Shift = [ssShift, ssCtrl]) then
     SemaforoClick := True;
end;

procedure TFMimprimePedidos.DBGPedidosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Shift = [] then
     SemaforoClick := False;
end;

procedure TFMimprimePedidos.DBGPedidosCellClick(Column: TColumn);
begin
  ColActual := Column;

  if SemaforoClick then
  begin
     DBGPedidos.SelectedRows.CurrentRowSelected := False;
     DMImprimePedidos.MarcaHasta(Self);
     SemaforoClick := False;
  end;
end;

procedure TFMimprimePedidos.MIImprimirPedidosClick(Sender: TObject);
begin
  // Imprimir Pedidos Normales
  DMImprimePedidos.ImprimePedidos(Self, 0);
end;

procedure TFMimprimePedidos.MIConfiguracionRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPedidos, DMLstPedidos);
  TFMListConfig.Create(Self).Muestra(39, formato, cabecera, copias,
     pijama, '', DMLstPedidos.frPedidos);
  CierraData(DMLstPedidos);
end;

procedure TFMimprimePedidos.TButtRefrescarKriClick(Sender: TObject);
begin
  DMImprimePedidos.Refrescar;
end;

procedure TFMimprimePedidos.MIEnvioPDFClick(Sender: TObject);
begin
  DMImprimePedidos.ImprimePedidos(Self, 3);
end;

procedure TFMimprimePedidos.CBDocsPendientesChange(Sender: TObject);
begin
  DMImprimePedidos.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
end;

procedure TFMimprimePedidos.BtnFiltrarClick(Sender: TObject);
begin
  DMImprimePedidos.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
end;

procedure TFMimprimePedidos.BtnLimpiarClick(Sender: TObject);
begin
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  DMImprimePedidos.CambiarSeleccion(CBDocsPendientes.Checked, 0, 0, Serie);
end;

procedure TFMimprimePedidos.CBSeriesChange(Sender: TObject);
begin
  if (CBSeries.Text <> '') then
  begin
     if (CBSeries.ItemIndex = 0) then
        Serie := ''
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSeries.Items[CBSeries.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;

     DMImprimePedidos.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
  end;
end;

procedure TFMimprimePedidos.DBGPedidosDblClick(Sender: TObject);
begin
  inherited;
  if (DMImprimePedidos.QMPedidos.FieldByName('ID_S').AsInteger <> 0) then
  begin
     if (UpperCase(ColActual.FieldName) = 'RIG') then
        FMain.TraspasoDeDocumentosSalida(DMImprimePedidos.QMPedidos.FieldByName('ID_S').AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DMImprimePedidos.QMPedidos.FieldByName('CLIENTE').AsString);
  end;
end;

procedure TFMimprimePedidos.DBGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'CLIENTE')) then
     CeldaEnlace(THYTDBGrid(Sender), Rect);

  THYTDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
