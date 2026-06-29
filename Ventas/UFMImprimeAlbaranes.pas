unit UFMImprimeAlbaranes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, ULFCheckBox, StdCtrls, ULFEdit, ULFLabel,
  TFlatCheckBoxUnit, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ULFComboBox, Buttons, uUtiles;

type
  TFMimprimeAlbaranes = class(TFPEditSimple)
     DBGAlbaranes: THYTDBGrid;
     TButtCancelar: TToolButton;
     TbuttMarcar: TToolButton;
     TButtSeparador1: TToolButton;
     TButtSeparador2: TToolButton;
     TButtImprimir: TToolButton;
     PMImprime: TPopupMenu;
     MIImprimirAlbaranes: TMenuItem;
     MIConfiguracionRapida: TMenuItem;
     N1: TMenuItem;
     TSep1: TToolButton;
     TButtRefrescarKri: TToolButton;
     MIEnvioPDF: TMenuItem;
     CBDocsPendientes: TLFCheckBox;
     PNLFiltro: TLFPanel;
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
     TBHojaDeRuta: TToolButton;
     TBHojaDeCarga: TToolButton;
     TBSepHojas: TToolButton;
     PNLHojaDeRuta: TLFPanel;
     PNLHojaDeCarga: TLFPanel;
     EPlantillaHojaDeRuta: TLFEdit;
     EPlantillaHojaDeCarga: TLFEdit;
     LPlantillaHojaDeRuta: TLFLabel;
     LPlantillaHojaDeCarga: TLFLabel;
     BPlantillaHojaDeRuta: TButton;
     BPlantillaHojaDeCarga: TButton;
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure DBGAlbaranesKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGAlbaranesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGAlbaranesCellClick(Column: TColumn);
     procedure MIImprimirAlbaranesClick(Sender: TObject);
     procedure MIConfiguracionRapidaClick(Sender: TObject);
     procedure TButtRefrescarKriClick(Sender: TObject);
     procedure MIEnvioPDFClick(Sender: TObject);
     procedure CBDocsPendientesChange(Sender: TObject);
     procedure BtnFiltrarClick(Sender: TObject);
     procedure BtnLimpiarClick(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure DBGAlbaranesDblClick(Sender: TObject);
     procedure DBGAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBHojaDeRutaClick(Sender: TObject);
     procedure TBHojaDeCargaClick(Sender: TObject);
     procedure BPlantillaHojaDeRutaClick(Sender: TObject);
     procedure BPlantillaHojaDeCargaClick(Sender: TObject);
     procedure EPlantillaHojaDeRutaChange(Sender: TObject);
     procedure EPlantillaHojaDeCargaChange(Sender: TObject);
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
  FMimprimeAlbaranes : TFMimprimeAlbaranes;

implementation

uses UDMImprimeAlbaranes, UDMMain, UFMListConfig, UDMLstAlbaranes, UFMain, URellenaLista;

{$R *.DFM}

procedure TFMimprimeAlbaranes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImprimeAlbaranes, DMImprimeAlbaranes);
  NavMain.DataSource := DMImprimeAlbaranes.DSQMAlbaranes;
  CEMainPMEdit.Teclas := DMMain.teclas;
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

  ColActual := DBGAlbaranes.Columns[0];

  EPlantillaHojaDeRuta.Text := LeeDatoIni('FMimprimeAlbaranes', 'PlantillaHojaDeRuta', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_DESKTOP, False)) + 'HojaRuta.xls');
  EPlantillaHojaDeCarga.Text := LeeDatoIni('FMimprimeAlbaranes', 'PlantillaHojaDeCarga', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_DESKTOP, False)) + 'HojaCarga.xls');
end;

procedure TFMimprimeAlbaranes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImprimeAlbaranes);
end;

procedure TFMimprimeAlbaranes.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  MIImprimirAlbaranesClick(Sender);
end;

function TFMimprimeAlbaranes.Seleccionado: boolean;
begin
  Result := DBGAlbaranes.SelectedRows.CurrentRowSelected;
end;

procedure TFMimprimeAlbaranes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMImprimeAlbaranes.BusquedaCompleja(CBDocsPendientes.Checked, Serie);
  Continua := False;
end;

function TFMimprimeAlbaranes.Muestra(Query: TDataSet): integer;
begin
  EPMain.VisibleButtons := [neReport, neSalir];
  DMImprimeAlbaranes.Filtra(Query);
  Result := ShowModal;
end;

procedure TFMimprimeAlbaranes.TbuttMarcarClick(Sender: TObject);
begin
  DBGAlbaranes.SelectedRows.Clear;
  DMImprimeAlbaranes.MarcaTodas(Self);
end;

procedure TFMimprimeAlbaranes.Marca;
begin
  DBGAlbaranes.SelectedRows.CurrentRowSelected := True;
end;

procedure TFMimprimeAlbaranes.TButtCancelarClick(Sender: TObject);
begin
  DBGAlbaranes.SelectedRows.Clear;
end;

procedure TFMimprimeAlbaranes.DBGAlbaranesKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Shift = [ssShift, ssCtrl]) then
     SemaforoClick := True;
end;

procedure TFMimprimeAlbaranes.DBGAlbaranesKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Shift = [] then
     SemaforoClick := False;
end;

procedure TFMimprimeAlbaranes.DBGAlbaranesCellClick(Column: TColumn);
begin
  ColActual := Column;

  if SemaforoClick then
  begin
     DBGAlbaranes.SelectedRows.CurrentRowSelected := False;
     DMImprimeAlbaranes.MarcaHasta(Self);
     SemaforoClick := False;
  end;
end;

procedure TFMimprimeAlbaranes.MIImprimirAlbaranesClick(Sender: TObject);
begin
  // Imprimir Albaranes Normales
  DBGAlbaranes.Enabled := False;
  try
     DMImprimeAlbaranes.ImprimeAlbaranes(Self, 0);
  finally
     DBGAlbaranes.Enabled := True;
  end;
end;

procedure TFMimprimeAlbaranes.MIConfiguracionRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  TFMListConfig.Create(Self).Muestra(34, formato, cabecera, copias,
     pijama, '', DMLstAlbaranes.frAlbaranes);
  CierraData(DMLstAlbaranes);
end;

procedure TFMimprimeAlbaranes.TButtRefrescarKriClick(Sender: TObject);
begin
  DMImprimeAlbaranes.Refrescar;
end;

procedure TFMimprimeAlbaranes.MIEnvioPDFClick(Sender: TObject);
begin
  DBGAlbaranes.Enabled := False;
  try
     DMImprimeAlbaranes.ImprimeAlbaranes(Self, 3);
  finally
     DBGAlbaranes.Enabled := True;
  end;
end;

procedure TFMimprimeAlbaranes.CBDocsPendientesChange(Sender: TObject);
begin
  DMImprimeAlbaranes.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
end;

procedure TFMimprimeAlbaranes.BtnFiltrarClick(Sender: TObject);
begin
  DMImprimeAlbaranes.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
end;

procedure TFMimprimeAlbaranes.BtnLimpiarClick(Sender: TObject);
begin
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  DMImprimeAlbaranes.CambiarSeleccion(CBDocsPendientes.Checked, 0, 0, Serie);
end;

procedure TFMimprimeAlbaranes.CBSeriesChange(Sender: TObject);
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

     DMImprimeAlbaranes.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
  end;
end;

procedure TFMimprimeAlbaranes.DBGAlbaranesDblClick(Sender: TObject);
begin
  inherited;
  if (DMImprimeAlbaranes.QMAlbaranes.FieldByName('ID_S').AsInteger <> 0) then
  begin
     if (UpperCase(ColActual.FieldName) = 'RIG') then
        FMain.TraspasoDeDocumentosSalida(DMImprimeAlbaranes.QMAlbaranes.FieldByName('ID_S').AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DMImprimeAlbaranes.QMAlbaranes.FieldByName('CLIENTE').AsString);
  end;
end;

procedure TFMimprimeAlbaranes.DBGAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'CLIENTE')) then
     CeldaEnlace(THYTDBGrid(Sender), Rect);

  THYTDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMimprimeAlbaranes.TBHojaDeRutaClick(Sender: TObject);
begin
  inherited;
  // Exportacion a Excel
  DMImprimeAlbaranes.HojaDeRuta(Self, EPlantillaHojaDeRuta.Text);
end;

procedure TFMimprimeAlbaranes.TBHojaDeCargaClick(Sender: TObject);
begin
  inherited;
  // Exportacion a Excel
  DMImprimeAlbaranes.HojaDeCarga(Self, EPlantillaHojaDeCarga.Text);
end;

procedure TFMimprimeAlbaranes.BPlantillaHojaDeRutaClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  if MyOpenDialog(Archivo, 'ALL', EPlantillaHojaDeRuta.Text, 'FMimprimeAlbaranes-HojaDeRuta') then
     EPlantillaHojaDeRuta.Text := Archivo;
end;

procedure TFMimprimeAlbaranes.BPlantillaHojaDeCargaClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  if MyOpenDialog(Archivo, 'ALL', EPlantillaHojaDeCarga.Text, 'FMimprimeAlbaranes-HojaDeCarga') then
     EPlantillaHojaDeCarga.Text := Archivo;
end;

procedure TFMimprimeAlbaranes.EPlantillaHojaDeRutaChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('FMimprimeAlbaranes', 'PlantillaHojaDeRuta', EPlantillaHojaDeRuta.Text);
end;

procedure TFMimprimeAlbaranes.EPlantillaHojaDeCargaChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('FMimprimeAlbaranes', 'PlantillaHojaDeCarga', EPlantillaHojaDeCarga.Text);
end;

end.
