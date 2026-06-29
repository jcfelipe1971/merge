unit UFMAsistenteExpAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox, Spin, ULFDateEdit;

type
  TFMAsistenteExpAsientos = class(TG2KForm)
     PCMain: TLFPageControl;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     TSSeleccionArchivo: TTabSheet;
     LBLSeleccionarArticulo: TLFLabel;
     TSExportar: TTabSheet;
     LBLExportarAsientos: TLFLabel;
     TSSeleccionarDatos: TTabSheet;
     LBLSeleccionarDatos: TLFLabel;
     GBArchivo: TGroupBox;
     EdArchivoExp: TLFEdit;
     ButtSelArchivo: TButton;
     GBSeleccionarAsientosExp: TGroupBox;
     DBGSaldosExp: TDBGridFind2000;
     TBSeleccionarDatos: TLFToolBar;
     TButtQuitarSel: TToolButton;
     TButtSelTodas: TToolButton;
     MEMInfo: TLFMemo;
     ButtExportar: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     TSFiltros: TTabSheet;
     TSColumnasExp: TTabSheet;
     TVMain: TTreeView;
     LFiltroSeleccion: TLFLabel;
     LBLColumnasExportar: TLFLabel;
     GBColumnasExportar: TGroupBox;
     ChkEncabezamiento: TLFDBCheckBox;
     TBSeleccionarColumnas: TLFToolBar;
     TBSelecColTodas: TToolButton;
     TBQuitarColTodas: TToolButton;
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LBLTipo: TLFLabel;
     LAsientoDesde: TLFLabel;
     LAsientoHasta: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     CBTipoAsiento: TLFComboBox;
     SEAsientoHasta: TSpinEdit;
     SEAsientoDesde: TSpinEdit;
     DBGColumnas: TDBGridFind2000;
     PNLBotones: TLFPanel;
     ToolButton1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure ButtAntClick(Sender: TObject);
     procedure ButtNextClick(Sender: TObject);
     procedure TVMainCollapsed(Sender: TObject; Node: TTreeNode);
     procedure TVMainChange(Sender: TObject; Node: TTreeNode);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtCancelClick(Sender: TObject);
     procedure TSSeleccionArchivoShow(Sender: TObject);
     procedure ButtSelArchivoClick(Sender: TObject);
     procedure TButtSelTodasClick(Sender: TObject);
     procedure TButtQuitarSelClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure ButtExportarClick(Sender: TObject);
     procedure DBGColumnasExit(Sender: TObject);
     procedure TBSelecColTodasClick(Sender: TObject);
     procedure TBQuitarColTodasClick(Sender: TObject);
  private
     { Private declarations }
     TabIndice: integer;
     OldTabIndice: integer;
     Cambiar: boolean;
     MueveTreeAbierto: boolean;
     procedure InicializaVariables;
     procedure ActivarTS(Index: integer);
     procedure MueveTab(Valor: integer);
     procedure MueveTabTree(Index: integer);
     procedure ActivarTree(Index: integer);
     procedure ControlaBotones(Index: integer);
     function CheckTab(Index: integer): boolean;
     function CheckArchivoExp: boolean;
     function CheckSelDatos: boolean;
     function CheckFiltrosSeleccion: boolean;
     function CheckColumnas: boolean;
     procedure LimpiarLog;
     procedure Log(Texto: string);
     procedure ExportarAsientos;
  public
     { Public declarations }
  end;

var
  FMAsistenteExpAsientos : TFMAsistenteExpAsientos;

implementation

uses UDMMain, UEntorno, UDMAsistenteExpAsientos, Contnrs, UUtiles, URellenaLista;

{$R *.dfm}

procedure TFMAsistenteExpAsientos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsistenteExpAsientos, DMAsistenteExpAsientos);
  InicializaVariables;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteExpAsientos.InicializaVariables;
begin
  // Expandir nodo
  TVMain.Items[0].Expanded := True;
  TabIndice := 0;
  OldTabIndice := 0;
  ActivarTS(0);
  ActivarTree(0);
  MueveTreeAbierto := False; // -> No dejo que se mueva de mas de uno en uno
  ControlaBotones(0);

  // CBTipoAsiento.Items := DMAsistenteExpAsientos.RellenaTiposAsientos;
  RellenaTiposAsientos(CBTipoAsiento.Items); {dji lrk kri - Memory Leak}
  CBTipoAsiento.ItemIndex := 0;

  DMAsistenteExpAsientos.Rangos;

  DTPDesde.Date := DMAsistenteExpAsientos.Fecha_Desde;
  DTPHasta.Date := DMAsistenteExpAsientos.Fecha_Hasta;
  SEAsientoDesde.Value := 1;
  SEAsientoHasta.Value := DMAsistenteExpAsientos.Asiento_Hasta;

  ChkEncabezamiento.Checked := True;
end;

procedure TFMAsistenteExpAsientos.ActivarTS(Index: integer);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
     if Self.Components[i] is TTabSheet then
        if TTabSheet(Self.Components[i]).PageIndex = Index then
        begin
           PCMain.ActivePageIndex := Index;
           TTabSheet(Self.Components[i]).Visible := True;
        end
        else
           TTabSheet(Self.Components[i]).Visible := False;
end;

procedure TFMAsistenteExpAsientos.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteExpAsientos.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteExpAsientos.MueveTab(Valor: integer);
begin
  Cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Control Maxima Pestaña
  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin  // Proceso de cambio real
     if (Valor > 0) then
        if not (CheckTab(OldTabIndice)) then
           TabIndice := OldTabIndice;
     Cambiar := True;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     Cambiar := False;
  end;

  ControlaBotones(TabIndice);
end;

procedure TFMAsistenteExpAsientos.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteExpAsientos.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteExpAsientos.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteExpAsientos.ControlaBotones(Index: integer);
begin
  if (TabIndice = 0) then
     ButtAnt.Enabled := False
  else
     ButtAnt.Enabled := True;

  if (TabIndice = PCMain.PageCount - 1) then
     ButtNext.Enabled := False
  else
     ButtNext.Enabled := True;
end;

procedure TFMAsistenteExpAsientos.MueveTabTree(Index: integer);
begin
  if not (cambiar) then
  begin
     if MueveTreeAbierto then
        MueveTab(Index - TabIndice)
     else
     begin
        if (Index > TabIndice) then
           MueveTab(1);
        if (Index < TabIndice) then
           MueveTab(-1);
     end;
  end;
end;

function TFMAsistenteExpAsientos.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckFiltrosSeleccion;
     1: Result := CheckSelDatos;
     2: Result := CheckColumnas;
     3: Result := CheckArchivoExp;
     else
        Result := True;
  end;
end;

procedure TFMAsistenteExpAsientos.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteExpAsientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteExpAsientos);
  Action := caFree;
  FMAsistenteExpAsientos := nil;
end;

{ PROCEDIMIENTOS ESPECIFICOS PARA ESTE ASISTENTE }

procedure TFMAsistenteExpAsientos.ButtSelArchivoClick(Sender: TObject);
var
  Archivo, Carpeta : string;
begin
  Carpeta := ExtractFileDir(EdArchivoExp.Text);
  if (not DirectoryExists(Carpeta)) then
     Carpeta := '';

  Archivo := EdArchivoExp.Text;

  if MySaveDialog(Archivo, 'XLS,CSV', Carpeta) then
     EdArchivoExp.Text := Archivo;
end;

procedure TFMAsistenteExpAsientos.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoExp.SetFocus;
end;

function TFMAsistenteExpAsientos.CheckArchivoExp: boolean;
begin
  Result := True;

  if (ExtractFileName(EdArchivoExp.Text) = '') or
     (not DirectoryExists(ExtractFilePath(EdArchivoExp.Text))) then
  begin
     Application.MessageBox(PChar(string(_('Directorio o archivo incorrecto.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
     Result := False;
  end;
end;

procedure TFMAsistenteExpAsientos.TButtSelTodasClick(Sender: TObject);
begin
  DMAsistenteExpAsientos.MarcarAsientosExp(1);
end;

procedure TFMAsistenteExpAsientos.TButtQuitarSelClick(Sender: TObject);
begin
  DMAsistenteExpAsientos.MarcarAsientosExp(0);
end;

procedure TFMAsistenteExpAsientos.LimpiarLog;
begin
  MEMInfoProc.Lines.Clear;
end;

procedure TFMAsistenteExpAsientos.Log(Texto: string);
begin
  MEMInfoProc.Lines.Add(Texto);
end;

function TFMAsistenteExpAsientos.CheckSelDatos: boolean;
begin
  Result := DMAsistenteExpAsientos.AsientosSeleccionados;
  if (not Result) then
     Application.MessageBox(PChar(string(_('No ha seleccionado ningún saldo.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
  begin
     DMAsistenteExpAsientos.InsertarColumnas;
     DMAsistenteExpAsientos.AbrirColumnas;
  end;
end;

procedure TFMAsistenteExpAsientos.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

function TFMAsistenteExpAsientos.CheckFiltrosSeleccion: boolean;
begin
  Result := True;
  with DMAsistenteExpAsientos do
  begin
     Fecha_Desde := HourIntoDate(DTPDesde.Date, '00:00:00');
     Fecha_Hasta := HourIntoDate(DTPHasta.Date, '23:59:59');

     Asiento_Desde := SEAsientoDesde.Value;
     Asiento_Hasta := SEAsientoHasta.Value;

     if CBTipoAsiento.ItemIndex = 0 then
        TipoAsiento := '0'
     else
        TipoAsiento := Copy(CBTipoAsiento.Text, 0, 3);
     try
        Screen.Cursor := crHourGlass;
        ProcesarFiltros;
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMAsistenteExpAsientos.ButtExportarClick(Sender: TObject);
begin
  ExportarAsientos;
end;

procedure TFMAsistenteExpAsientos.DBGColumnasExit(Sender: TObject);
begin
  DMAsistenteExpAsientos.GrabarDatosColumnas;
end;

function TFMAsistenteExpAsientos.CheckColumnas: boolean;
begin
  Result := not ChkEncabezamiento.Checked;
  if (not Result) then
  begin
     Result := DMAsistenteExpAsientos.ColumnasSeleccionadas;
     if (not Result) then
        Application.MessageBox(PChar(string(_('Ha seleccionado que la exportación tenga encabezamiento, pero no ha seleccionado ninguna columna.'))),
           PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
  end;
end;

procedure TFMAsistenteExpAsientos.TBSelecColTodasClick(Sender: TObject);
begin
  DMAsistenteExpAsientos.MarcarColumnas(1);
end;

procedure TFMAsistenteExpAsientos.TBQuitarColTodasClick(Sender: TObject);
begin
  DMAsistenteExpAsientos.MarcarColumnas(0);
end;

procedure TFMAsistenteExpAsientos.ExportarAsientos;
var
  Errores : integer;
begin
  Errores := 0;
  LimpiarLog;
  Log(_('Inicializando...'));
  try
     DMAsistenteExpAsientos.InicializaProceso;

     if (ChkEncabezamiento.Checked) then
     begin
        Log(_('Exportando el encabezamiento de las columnas...'));
        if (not DMAsistenteExpAsientos.ExportarEncabezado) then
        begin
           Log(_('Error'));
           Log(DMAsistenteExpAsientos.Error);
           Inc(Errores);
        end;
     end;

     if (Errores = 0) then
        while (not DMAsistenteExpAsientos.Final) do
        begin
           Log(DMAsistenteExpAsientos.Actual);
           if (not DMAsistenteExpAsientos.ExportarAsiento) then
           begin
              Log(_('Error'));
              Log(DMAsistenteExpAsientos.Error);
              Inc(Errores);
           end;
           DMAsistenteExpAsientos.Siguiente;
        end;

     if (Errores = 0) then
        if (not DMAsistenteExpAsientos.SalvarDatosEnExcel(EdArchivoExp.Text)) then
        begin
           Log(_('Error'));
           Log(DMAsistenteExpAsientos.Error);
           Inc(Errores);
        end;

     if (Errores = 0) then
     begin
        Log(_('El proceso concluyó con éxito.'));
        ButtCancel.Visible := False;
        ButtAnt.Visible := False;
        ButtNext.Visible := False;
        ButtCerrar.Visible := True;
     end
     else
        Log(_('El proceso concluyó con errores.'));
  finally
     DMAsistenteExpAsientos.CerrarExcel;
  end;
end;

end.
