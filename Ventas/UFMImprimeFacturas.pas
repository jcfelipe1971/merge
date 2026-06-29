unit UFMImprimeFacturas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, ULFCheckBox, TFlatCheckBoxUnit, StdCtrls,
  ULFEdit, ULFLabel, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ULFComboBox, Buttons, uUtiles, Mask, rxToolEdit,
  ULFDateEdit;

type
  TFMImprimeFacturas = class(TFPEditSimple)
     DBGFacturas: THYTDBGrid;
     TButtCancelar: TToolButton;
     TbuttMarcar: TToolButton;
     TButtSeparador1: TToolButton;
     TButtSeparador2: TToolButton;
     TButtImprimir: TToolButton;
     PMImprime: TPopupMenu;
     MIImprimirEnivarFacturas: TMenuItem;
     MIConfiguracionRapida: TMenuItem;
     MIMandarporEmail: TMenuItem;
     N1: TMenuItem;
     MIEnvioPDF: TMenuItem;
     TButtSeparador3: TToolButton;
     TButtRefrescarKri: TToolButton;
     CBDocsPendientes: TLFCheckBox;
     PnlPedidos: TLFPanel;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     EDesdeDocumento: TLFEdit;
     EHastaDocumento: TLFEdit;
     BtnFiltrar: TSpeedButton;
     BtnLimpiar: TSpeedButton;
     PNLSoloPendientes: TLFPanel;
     PNLForzarCopias: TLFPanel;
     CBForzarCopias: TLFCheckBox;
     ECopias: TLFEdit;
     LSerie: TLFLabel;
     CBSeries: TLFComboBox;
     PNLSeries: TLFPanel;
     MIImprimirFacturas: TMenuItem;
     PNLCopiasAgente: TLFPanel;
     LCarpetaCopiasAgente: TLFLabel;
     ECarpetaCopiasAgente: TLFEdit;
     BBuscarCarpeta: TButton;
     PNLFechaCon: TLFPanel;
     LFechaCon: TLFLabel;
     DEFechaCon: TLFDateEdit;
     MIGuardaCopiaPDF: TMenuItem;
     CBMarcarImpreso: TLFCheckBox;
     PNLMarcarImpreso: TLFPanel;
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure DBGFacturasKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFacturasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFacturasCellClick(Column: TColumn);
     procedure MIImprimirEnivarFacturasClick(Sender: TObject);
     procedure MIConfiguracionRapidaClick(Sender: TObject);
     procedure MIMandarporEmailClick(Sender: TObject);
     procedure MIEnvioPDFClick(Sender: TObject);
     procedure TButtRefrescarKriClick(Sender: TObject);
     procedure CBDocsPendientesChange(Sender: TObject);
     procedure BtnFiltrarClick(Sender: TObject);
     procedure BtnLimpiarClick(Sender: TObject);
     procedure CBForzarCopiasChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure DBGFacturasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFacturasDblClick(Sender: TObject);
     procedure MIImprimirFacturasClick(Sender: TObject);
     procedure BBuscarCarpetaClick(Sender: TObject);
     procedure DEFechaConChange(Sender: TObject);
     procedure MIGuardaCopiaPDFClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     Serie: string;
     SemaforoClick: boolean;
     ColActual: TColumn;
     function DameTipo(Grupo: integer): smallint;
     procedure HabilitarForm(Habilitado: boolean);
  public
     { Public declarations }
     function Seleccionado: boolean;
     procedure Marca;
     function Muestra(Query: TDataSet): integer;
  end;

var
  FMImprimeFacturas : TFMImprimeFacturas;

implementation

uses UDMImprimeFacturas, UDMMain, UFMListConfig, UDMLstFactura, UDMListConfig, UEntorno,
  UFMain, UHYDirectoryDialog, UParam, URellenaLista;

{$R *.DFM}

procedure TFMImprimeFacturas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImprimeFacturas, DMImprimeFacturas);
  NavMain.DataSource := DMImprimeFacturas.DSQMFacturas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
  SemaforoClick := False;
  CBForzarCopiasChange(Self);
  CBMarcarImpreso.Checked := True;

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  Serie := '';
  CBSeriesChange(Sender);

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(BtnLimpiar, 1, DMMain.ILMain_Ac, 26);
  GetBitmapFromImageList(BtnLimpiar, 2, DMMain.ILMain_In, 26);
  GetBitmapFromImageList(BtnFiltrar, 1, DMMain.ILMain_Ac, 5);
  GetBitmapFromImageList(BtnFiltrar, 2, DMMain.ILMain_In, 5);

  ColActual := DBGFacturas.Columns[0];

  DEFechaCon.Date := REntorno.FechaTrab;
  PNLFechaCon.Visible := ((LeeParametro('FACIMPR002', Serie) = 'S') and (LeeParametro('FACIMPR001', Serie) = 'S'));
end;

procedure TFMImprimeFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EscribeDatoIni('CopiasAgente', 'Carpeta', IncludeTrailingPathDelimiter(ECarpetaCopiasAgente.Text));
  CierraData(DMImprimeFacturas);
end;

procedure TFMImprimeFacturas.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  MIImprimirEnivarFacturasClick(Sender);
end;

function TFMImprimeFacturas.Seleccionado: boolean;
begin
  Result := DBGFacturas.SelectedRows.CurrentRowSelected;
end;

procedure TFMImprimeFacturas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMImprimeFacturas.BusquedaCompleja(CBDocsPendientes.Checked, Serie);
  Continua := False;
end;

function TFMImprimeFacturas.Muestra(Query: TDataSet): integer;
begin
  EPMain.VisibleButtons := [neReport, neSalir];
  EPMain.Width := 23;
  DMImprimeFacturas.Filtra(Query);
  DMImprimeFacturas.MarcaSesion(Self, Query.FieldByName('CONTADOR').AsInteger);
  Result := ShowModal;
end;

procedure TFMImprimeFacturas.TbuttMarcarClick(Sender: TObject);
begin
  DBGFacturas.SelectedRows.Clear;
  DMImprimeFacturas.Marcatodas(Self);
end;

procedure TFMImprimeFacturas.Marca;
begin
  DBGFacturas.SelectedRows.CurrentRowSelected := True;
end;

procedure TFMImprimeFacturas.TButtCancelarClick(Sender: TObject);
begin
  DBGFacturas.SelectedRows.Clear;
end;

procedure TFMImprimeFacturas.DBGFacturasKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Shift = [ssShift, ssCtrl]) then
     SemaforoClick := True;
end;

procedure TFMImprimeFacturas.DBGFacturasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Shift = [] then
     SemaforoClick := False;
end;

procedure TFMImprimeFacturas.DBGFacturasCellClick(Column: TColumn);
begin
  ColActual := Column;

  if SemaforoClick then
  begin
     DBGFacturas.SelectedRows.CurrentRowSelected := False;
     DMImprimeFacturas.MarcaHasta(Self);
     SemaforoClick := False;
  end;
end;

procedure TFMImprimeFacturas.HabilitarForm(Habilitado: boolean);
begin
  DBGFacturas.Enabled := Habilitado;
  TBMain.Enabled := Habilitado;
  PnlPedidos.Enabled := Habilitado;
end;

procedure TFMImprimeFacturas.MIImprimirEnivarFacturasClick(Sender: TObject);
begin
  // Imprimir Facturas o enviarlas por correo segun configuracino de cliente
  HabilitarForm(False);
  try
     DMImprimeFacturas.ImprimeFacturas(Self, DameTipo(36), CBForzarCopias.Checked, StrToIntDef(ECopias.Text, 0), True, IncludeTrailingPathDelimiter(ECarpetaCopiasAgente.Text), CBMarcarImpreso.Checked);
  finally
     HabilitarForm(True);
  end;
end;

procedure TFMImprimeFacturas.MIEnvioPDFClick(Sender: TObject);
begin
  // Mandar Facturas por Mail en pdf
  HabilitarForm(False);
  try
     DMImprimeFacturas.ImprimeFacturas(Self, 3, False, 0, False, IncludeTrailingPathDelimiter(ECarpetaCopiasAgente.Text), CBMarcarImpreso.Checked);
  finally
     HabilitarForm(True);
  end;
end;

procedure TFMImprimeFacturas.MIImprimirFacturasClick(Sender: TObject);
begin
  inherited;
  // Imprimir Facturas Normales
  HabilitarForm(False);
  try
     DMImprimeFacturas.ImprimeFacturas(Self, DameTipo(36), CBForzarCopias.Checked, StrToIntDef(ECopias.Text, 0), False, IncludeTrailingPathDelimiter(ECarpetaCopiasAgente.Text), CBMarcarImpreso.Checked);
  finally
     HabilitarForm(True);
  end;
end;

procedure TFMImprimeFacturas.MIMandarporEmailClick(Sender: TObject);
begin
  // Mandar Facturas por Mail como texto
  HabilitarForm(False);
  try
     DMImprimeFacturas.ImprimeFacturas(Self, 2, False, 0, False, IncludeTrailingPathDelimiter(ECarpetaCopiasAgente.Text), CBMarcarImpreso.Checked);
  finally
     HabilitarForm(True);
  end;
end;

procedure TFMImprimeFacturas.MIGuardaCopiaPDFClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  // Guarda una copia en formato PDF en una carpeta
  Directorio := Trim(ExcludeTrailingPathDelimiter(ECarpetaCopiasAgente.Text));
  if (Directorio = '') then
  begin
     if not MySelectDirectory(Directorio, 'FMImprimeFacturas') then
        Directorio := '';
  end;

  if (Directorio <> '') then
  begin
     HabilitarForm(False);
     try
        DMImprimeFacturas.ImprimeFacturas(Self, 4, False, 0, False, IncludeTrailingPathDelimiter(Directorio), CBMarcarImpreso.Checked);
     finally
        HabilitarForm(True);
     end;
  end;
end;

procedure TFMImprimeFacturas.MIConfiguracionRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstFactura, DMLstFactura);
  TFMListConfig.Create(Self).Muestra(36, formato, cabecera, copias,
     pijama, '', DMLstFactura.frFactura, DMLstFactura.HYReport, DMLstFactura.HYReportMail);
  CierraData(DMLstFactura);
end;

procedure TFMImprimeFacturas.CBDocsPendientesChange(Sender: TObject);
begin
  DMImprimeFacturas.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
end;

procedure TFMImprimeFacturas.BtnFiltrarClick(Sender: TObject);
begin
  DMImprimeFacturas.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);
end;

procedure TFMImprimeFacturas.BtnLimpiarClick(Sender: TObject);
begin
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  DMImprimeFacturas.CambiarSeleccion(CBDocsPendientes.Checked, 0, 0, Serie);
end;

procedure TFMImprimeFacturas.CBSeriesChange(Sender: TObject);
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

     DMImprimeFacturas.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), Serie);

     // Parametro LSTFACT001 - El listado masivo de facturas deja una copia en formato pdf en una carpeta, agrupado por agente.
     if (LeeParametro('LSTFAC0002', Serie) = 'S') then
     begin
        PNLCopiasAgente.Visible := True;
        ECarpetaCopiasAgente.Text := LeeDatoIni('CopiasAgente', 'Carpeta', '');
     end
     else
     begin
        PNLCopiasAgente.Visible := False;
        ECarpetaCopiasAgente.Text := '';
     end;

     PNLFechaCon.Visible := ((LeeParametro('FACIMPR002', Serie) = 'S') and (LeeParametro('FACIMPR001', Serie) = 'S'));
  end;
end;

procedure TFMImprimeFacturas.DBGFacturasDblClick(Sender: TObject);
begin
  inherited;
  if (DMImprimeFacturas.QMFacturas.FieldByName('ID_S').AsInteger <> 0) then
  begin
     if (UpperCase(ColActual.FieldName) = 'RIG') then
        FMain.TraspasoDeDocumentosSalida(DMImprimeFacturas.QMFacturas.FieldByName('ID_S').AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DMImprimeFacturas.QMFacturas.FieldByName('CLIENTE').AsString);
  end;
end;

procedure TFMImprimeFacturas.DBGFacturasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'CLIENTE')) then
     CeldaEnlace(THYTDBGrid(Sender), Rect);

  with THYTDBGrid(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'ESTADO') or (UpperCase(Column.FieldName) = 'TITULO_ESTADO')) then
        ColorSegunEstado(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger)
     else
     if (UpperCase(Column.FieldName) = 'FOLIO') then
     begin
        if (DataSource.DataSet.FieldByName('FOLIO').AsInteger = 0) then
           ColorError(Canvas)
        else
           ColorInfo(Canvas);
     end;
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

function TFMImprimeFacturas.DameTipo(Grupo: integer): smallint;
var
  Formato, Cabecera, Copias, Pijama : integer;
  Grupostr, TipoListado : string;
begin
  TipoListado := REntorno.TipoListado;

  if (TipoListado = '') then
  begin
     AbreData(TDMListConfig, DMListConfig);
     DMListConfig.Carga(Grupo, Formato, Cabecera, Copias, Pijama, Grupostr,
        TipoListado, REntorno.Serie);
     CierraData(DMListConfig);
  end;

  if ((TipoListado = 'FRF') or (TipoListado = 'FR3')) then
     Result := 0
  else
     Result := 1;
end;

procedure TFMImprimeFacturas.TButtRefrescarKriClick(Sender: TObject);
begin
  DMImprimeFacturas.Refrescar;
end;

procedure TFMImprimeFacturas.CBForzarCopiasChange(Sender: TObject);
begin
  ECopias.Visible := CBForzarCopias.Checked;
end;

procedure TFMImprimeFacturas.BBuscarCarpetaClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;

  Directorio := ECarpetaCopiasAgente.Text;
  if MySelectDirectory(Directorio, 'FMImprimeFacturas') then
     ECarpetaCopiasAgente.Text := IncludeTrailingPathDelimiter(Directorio);
end;

procedure TFMImprimeFacturas.DEFechaConChange(Sender: TObject);
begin
  inherited;
  DMImprimeFacturas.FechaContabilizacion := DEFechaCon.Date;
end;

procedure TFMImprimeFacturas.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := EncuentraField(DBGFacturas, 'FOLIO');
  if (i >= 0) then
     DBGFacturas.Columns.Items[i].Visible := (REntorno.Pais = 'CHL');
end;

end.
