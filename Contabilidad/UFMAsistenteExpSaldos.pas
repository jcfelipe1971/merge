unit UFMAsistenteExpSaldos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox, ULFDateEdit;

type
  TFMAsistenteExpSaldos = class(TG2KForm)
     PCMain: TLFPageControl;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     TSSeleccionArchivo: TTabSheet;
     LBLSeleccionarArticulo: TLFLabel;
     TSExportar: TTabSheet;
     LBLExportarSaldos: TLFLabel;
     TSSeleccionarDatos: TTabSheet;
     LBLSeleccionarDatos: TLFLabel;
     GBArchivo: TGroupBox;
     EdArchivoExp: TLFEdit;
     ButtSelArchivo: TButton;
     GBSeleccionarSaldosExp: TGroupBox;
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
     GBCuentas: TGroupBox;
     LDesdeCuenta: TLFLabel;
     LHastaCuenta: TLFLabel;
     EFDesde: TLFEditFind2000;
     EFHasta: TLFEditFind2000;
     DBECtaDesde: TLFDbedit;
     DBECtaHasta: TLFDbedit;
     GBSeccion: TGroupBox;
     LHastaSeccion: TLFLabel;
     LDesdeSeccion: TLFLabel;
     LBNivel: TLFLabel;
     ESeccionD: TLFEdit;
     ESeccionH: TLFEdit;
     CBNivelFiltro: TLFComboBox;
     PNivFecha: TLFPanel;
     GBNiveles: TGroupBox;
     LDesdeNivel: TLFLabel;
     LHastaNivel: TLFLabel;
     CBDesde: TLFComboBox;
     CBHasta: TLFComboBox;
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     ChkAsientoApertura: TLFCheckBox;
     ChkAsientoCierre: TLFCheckBox;
     ChkAsientoReg: TLFCheckBox;
     SDArchivoExp: TSaveDialog;
     LFiltroSeleccion: TLFLabel;
     GBCanales: TGroupBox;
     DBGFCanales: TDBGridFind2000;
     TBMultiCanal: TLFToolBar;
     TButtSelTodosCanales: TToolButton;
     TButtQuitarTodosCanales: TToolButton;
     LBLColumnasExportar: TLFLabel;
     GBColumnasExportar: TGroupBox;
     DBGColumnas: TDBGridFind2000;
     ChkEncabezamiento: TLFDBCheckBox;
     TBSeleccionarColumnas: TLFToolBar;
     TBSelecColTodas: TToolButton;
     TBQuitarColTodas: TToolButton;
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
     procedure CBNivelFiltroChange(Sender: TObject);
     procedure EFDesdeChange(Sender: TObject);
     procedure EFHastaChange(Sender: TObject);
     procedure EFDesdeExit(Sender: TObject);
     procedure EFDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFHastaExit(Sender: TObject);
     procedure EFHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure CBDesdeChange(Sender: TObject);
     procedure TButtSelTodosCanalesClick(Sender: TObject);
     procedure TButtQuitarTodosCanalesClick(Sender: TObject);
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
     Canal: integer;
     ListaCanales: TStringList;
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
     procedure ExportarSaldos;
  public
     { Public declarations }
  end;

var
  FMAsistenteExpSaldos : TFMAsistenteExpSaldos;

implementation

uses UDMMain, UEntorno, UDMAsistenteExpSaldos, Contnrs, UUtiles;

{$R *.dfm}

procedure TFMAsistenteExpSaldos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsistenteExpSaldos, DMAsistenteExpSaldos);
  InicializaVariables;
end;

procedure TFMAsistenteExpSaldos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteExpSaldos);
  ListaCanales.Free;
  Action := caFree;
  FMAsistenteExpSaldos := nil;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteExpSaldos.InicializaVariables;
begin
  // Expandir nodo
  TVMain.Items[0].Expanded := True;
  TabIndice := 0;
  OldTabIndice := 0;
  ActivarTS(0);
  ActivarTree(0);
  MueveTreeAbierto := False; // -> No dejo que se mueva de mas de uno en uno
  ControlaBotones(0);

  DMAsistenteExpSaldos.Rangos;
  CBDesde.Items := TSLNiveles;
  CBDesde.ItemIndex := 1;

  CBNivelFiltro.Items := TSLNiveles;
  CBNivelFiltro.Items.Delete(0); // Borramos el  item correspondiente a 'Todos'
  CBNivelFiltro.Items.Insert(0, _('No Filtrar'));
  CBNivelFiltro.ItemIndex := 0;
  CBNivelFiltroChange(CBNivelFiltro);

  CBHasta.Items := TSLNiveles;
  CBHasta.Items.Delete(0);  // Borramos el  item correspondiente a 'Todos'
  CBHasta.ItemIndex := CBHasta.Items.Count - 1;

  DTPDesde.Date := DMAsistenteExpSaldos.Fecha_Desde;
  DTPHasta.Date := DMAsistenteExpSaldos.Fecha_Hasta;

  // Ajustar el tamaño de la cuenta por EEC
  EFDesde.MaxLength := REntorno.DigitosSub;
  EFDesde.Text := DMAsistenteExpSaldos.Cuent_Desde;
  EFHasta.MaxLength := REntorno.DigitosSub;
  EFHasta.Text := DMAsistenteExpSaldos.Cuent_Hasta;

  ChkAsientoApertura.Checked := True;
  ChkAsientoCierre.Checked := True;
  ChkAsientoReg.Checked := False;

  Canal := REntorno.Canal;
  ListaCanales := TStringList.Create;
  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);

  DMAsistenteExpSaldos.RellenaMultiseleccion;
  DMAsistenteExpSaldos.MarcarCanalActual;
  DMAsistenteExpSaldos.AbrirMultiseleccion;

  ChkEncabezamiento.Checked := True;
end;

procedure TFMAsistenteExpSaldos.ActivarTS(Index: integer);
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

procedure TFMAsistenteExpSaldos.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteExpSaldos.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteExpSaldos.MueveTab(Valor: integer);
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

procedure TFMAsistenteExpSaldos.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteExpSaldos.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteExpSaldos.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteExpSaldos.ControlaBotones(Index: integer);
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

procedure TFMAsistenteExpSaldos.MueveTabTree(Index: integer);
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

function TFMAsistenteExpSaldos.CheckTab(Index: integer): boolean;
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

procedure TFMAsistenteExpSaldos.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

{ PROCEDIMIENTOS ESPECIFICOS PARA ESTE ASISTENTE }

procedure TFMAsistenteExpSaldos.ButtSelArchivoClick(Sender: TObject);
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

procedure TFMAsistenteExpSaldos.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoExp.SetFocus;
end;

function TFMAsistenteExpSaldos.CheckArchivoExp: boolean;
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

procedure TFMAsistenteExpSaldos.TButtSelTodasClick(Sender: TObject);
begin
  DMAsistenteExpSaldos.MarcarSaldosExp(1);
end;

procedure TFMAsistenteExpSaldos.TButtQuitarSelClick(Sender: TObject);
begin
  DMAsistenteExpSaldos.MarcarSaldosExp(0);
end;

procedure TFMAsistenteExpSaldos.LimpiarLog;
begin
  MEMInfoProc.Lines.Clear;
end;

procedure TFMAsistenteExpSaldos.Log(Texto: string);
begin
  MEMInfoProc.Lines.Add(Texto);
end;

function TFMAsistenteExpSaldos.CheckSelDatos: boolean;
begin
  Result := DMAsistenteExpSaldos.SaldosSeleccionados;
  if (not Result) then
     Application.MessageBox(PChar(string(_('No ha seleccionado ningún saldo.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
  begin
     DMAsistenteExpSaldos.InsertarColumnas;
     DMAsistenteExpSaldos.AbrirColumnas;
  end;
end;

procedure TFMAsistenteExpSaldos.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteExpSaldos.CBNivelFiltroChange(Sender: TObject);
begin
  if (CBNivelFiltro.ItemIndex = 0) then
  begin
     // Selecciona no filtrar
     ESeccionD.Text := '';
     ESeccionH.Text := '';
     ESeccionD.Enabled := False;
     ESeccionH.Enabled := False;
  end
  else
  begin
     // Selecciona no filtrar
     ESeccionD.Text := '';
     ESeccionH.Text := '';
     ESeccionD.Enabled := True;
     ESeccionH.Enabled := True;
  end;
end;

procedure TFMAsistenteExpSaldos.EFDesdeChange(Sender: TObject);
begin
  DMAsistenteExpSaldos.Actualiza_Cuenta(DMAsistenteExpSaldos.xCta_Desde, EFDesde.Text);
end;

procedure TFMAsistenteExpSaldos.EFHastaChange(Sender: TObject);
begin
  DMAsistenteExpSaldos.Actualiza_Cuenta(DMAsistenteExpSaldos.xCta_Hasta, EFHasta.Text);
end;

procedure TFMAsistenteExpSaldos.EFDesdeExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFDesde);
end;

procedure TFMAsistenteExpSaldos.EFDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFDesde);
end;

procedure TFMAsistenteExpSaldos.EFHastaExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFHasta);
end;

procedure TFMAsistenteExpSaldos.EFHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFHasta);
end;

procedure TFMAsistenteExpSaldos.CBDesdeChange(Sender: TObject);
begin
  if (CBDesde.ItemIndex > CBHasta.ItemIndex) then
     CBHasta.ItemIndex := CBDesde.ItemIndex - 1;
  if (CBDesde.ItemIndex = 0) then
     CBHasta.Enabled := False
  else
     CBHasta.Enabled := True;
end;

procedure TFMAsistenteExpSaldos.TButtSelTodosCanalesClick(Sender: TObject);
begin
  DMAsistenteExpSaldos.MarcarCanales(1);
end;

procedure TFMAsistenteExpSaldos.TButtQuitarTodosCanalesClick(Sender: TObject);
begin
  DMAsistenteExpSaldos.MarcarCanales(0);
end;

function TFMAsistenteExpSaldos.CheckFiltrosSeleccion: boolean;
begin
  Result := True;

  with DMAsistenteExpSaldos do
  begin
     SeccionDesde := ESeccionD.Text;
     SeccionHasta := ESeccionH.Text;

     Fecha_Desde := HourIntoDate(DTPDesde.Date, '00:00:00');
     Fecha_Hasta := HourIntoDate(DTPHasta.Date, '23:59:59');

     Cuent_Desde := EFDesde.Text;
     Cuent_Hasta := EFHasta.Text;

     if CBDesde.ItemIndex = 0 then
     begin
        Nivel_Desde := 1;
        Nivel_Hasta := REntorno.NivelesCont;
     end
     else
     begin
        Nivel_Desde := CBDesde.ItemIndex;
        Nivel_Hasta := CBHasta.ItemIndex + 1;
     end;

     Nivel_Filtro := CBNivelFiltro.ItemIndex;

     try
        Screen.Cursor := crHourGlass;
        ProcesarFiltros(ChkAsientoApertura.Checked, ChkAsientoReg.Checked,
           ChkAsientoCierre.Checked);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMAsistenteExpSaldos.ButtExportarClick(Sender: TObject);
begin
  ExportarSaldos;
end;

procedure TFMAsistenteExpSaldos.DBGColumnasExit(Sender: TObject);
begin
  DMAsistenteExpSaldos.GrabarDatosColumnas;
end;

function TFMAsistenteExpSaldos.CheckColumnas: boolean;
begin
  Result := not ChkEncabezamiento.Checked;
  if (not Result) then
  begin
     Result := DMAsistenteExpSaldos.ColumnasSeleccionadas;
     if (not Result) then
        Application.MessageBox(PChar(string(_('Ha seleccionado que la exportación tenga encabezamiento, pero no ha seleccionado ninguna columna.'))),
           PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
  end;
end;

procedure TFMAsistenteExpSaldos.TBSelecColTodasClick(Sender: TObject);
begin
  DMAsistenteExpSaldos.MarcarColumnas(1);
end;

procedure TFMAsistenteExpSaldos.TBQuitarColTodasClick(Sender: TObject);
begin
  DMAsistenteExpSaldos.MarcarColumnas(0);
end;

procedure TFMAsistenteExpSaldos.ExportarSaldos;
var
  Errores : integer;
begin
  Errores := 0;
  LimpiarLog;
  Log(_('Inicializando...'));
  try
     DMAsistenteExpSaldos.InicializaProceso;

     if (ChkEncabezamiento.Checked) then
     begin
        Log(_('Exportando el encabezamiento de las columnas...'));
        if (not DMAsistenteExpSaldos.ExportarEncabezado) then
        begin
           Log(_('Error'));
           Log(DMAsistenteExpSaldos.Error);
           Inc(Errores);
        end;
     end;

     if (Errores = 0) then
        while (not DMAsistenteExpSaldos.Final) do
        begin
           Log(DMAsistenteExpSaldos.Actual);
           if (not DMAsistenteExpSaldos.ExportarSaldo) then
           begin
              Log(_('Error'));
              Log(DMAsistenteExpSaldos.Error);
              Inc(Errores);
           end;

           DMAsistenteExpSaldos.Siguiente;
        end;

     if (Errores = 0) then
        if (not DMAsistenteExpSaldos.SalvarDatosEnExcel(EdArchivoExp.Text)) then
        begin
           Log(_('Error'));
           Log(DMAsistenteExpSaldos.Error);
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
     DMAsistenteExpSaldos.CerrarExcel;
  end;
end;

end.
