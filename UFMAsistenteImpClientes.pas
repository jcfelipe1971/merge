unit UFMAsistenteImpClientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox, Menus,
  ValEdit, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, UTeclas, UControlEdit, UEditPanel;

type
  TFMAsistenteImpClientes = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     ButtCancel: TButton;
     ButtAnt: TButton;
     ButtNext: TButton;
     TSSeleccionArchivo: TTabSheet;
     LBLSeleccionarArticulo: TLFLabel;
     TVMain: TTreeView;
     TSAsociarColumnas: TTabSheet;
     LBLAsociarColumnas: TLFLabel;
     TSImportar: TTabSheet;
     LImportarClientes: TLFLabel;
     GBArchivo: TGroupBox;
     GBAsociarColumnas: TGroupBox;
     SGDatosImp: TStringGrid;
     EdArchivoImp: TLFEdit;
     ButtSelArchivo: TButton;
     MEMInfo: TLFMemo;
     ButtCrear: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     PNLBotones: TLFPanel;
     PNLAsosciarColumnas: TLFPanel;
     PNLArticulo: TLFPanel;
     PNLImportar: TLFPanel;
     ProgresoImportacion: TProgressBar;
     Splitter: TSplitter;
     PMCamposDisponibles: TPopupMenu;
     MINoImportar: TMenuItem;
     LFCBPrimeraFilaTitulos: TLFCheckBox;
     LInformacionHoja: TLFLabel;
     BInformacionHoja: TButton;
     CBHojaAImportar: TLFComboBox;
     VLEValoresConstantes: TValueListEditor;
     PNLTitulos: TLFPanel;
     LUltimaFilaImportada: TLFLabel;
     EUltimaFilaImportada: TLFEdit;
     PProgresoImportacion: TProgressBar;
     BContinuar: TButton;
     LSeparadorDecimal: TLFLabel;
     ESeparadorDecimal: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure ButtAntClick(Sender: TObject);
     procedure ButtNextClick(Sender: TObject);
     procedure TVMainCollapsed(Sender: TObject; Node: TTreeNode);
     procedure TVMainChange(Sender: TObject; Node: TTreeNode);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtCancelClick(Sender: TObject);
     procedure TSSeleccionArchivoShow(Sender: TObject);
     procedure ButtSelArchivoClick(Sender: TObject);
     procedure SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure ButtCrearClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure PMCamposDisponiblesClick(Sender: TObject);
     procedure LFCBPrimeraFilaTitulosChange(Sender: TObject);
     procedure VLEValoresConstantesExit(Sender: TObject);
     procedure EdArchivoImpChange(Sender: TObject);
     procedure CBHojaAImportarChange(Sender: TObject);
     procedure TSImportarShow(Sender: TObject);
     procedure BContinuarClick(Sender: TObject);
     procedure ESeparadorDecimalChange(Sender: TObject);
  private
     { Private declarations }
     TabIndice: integer;
     OldTabIndice: integer;
     Cambiar: boolean;
     MueveTreeAbierto: boolean;
     FilasAMostrar: smallint;
     procedure InicializaVariables;
     procedure ActivarTS(Index: integer);
     procedure MueveTab(Valor: integer);
     procedure MueveTabTree(Index: integer);
     procedure ActivarTree(Index: integer);
     procedure ControlaBotones(Index: integer);
     function CheckTab(Index: integer): boolean;
     function CheckArchivoImp: boolean;
     procedure RefrescaInformacionArchivo;
     procedure LlenarGrid;
     procedure LlenarConstantes;
     procedure LimpiarLog;
     procedure ImportarClientes(BorraLog: boolean = True);
  public
     { Public declarations }
     procedure Log(Texto: string; NuevaLinea: boolean = True);
  end;

var
  FMAsistenteImpClientes : TFMAsistenteImpClientes;

implementation

uses UDMMain, UEntorno, UDMAsistenteImpClientes, Contnrs, UUtiles;

{$R *.dfm}

procedure TFMAsistenteImpClientes.FormCreate(Sender: TObject);
var
  i : integer;
  Campos : TStrings;
  MI : TMenuItem;
begin
  inherited;

  AbreData(TDMAsistenteImpClientes, DMAsistenteImpClientes);
  InicializaVariables;

  EdArchivoImp.Text := LeeDatoIni('ImportacionClientes', 'UltimoArchivo', '');
  CBHojaAImportar.Text := LeeDatoIni('ImportacionClientes', 'UltimaHoja', '');

  // Refresco los datos a importar
  RefrescaInformacionArchivo;

  Campos := TStringList.Create;
  try
     DMAsistenteImpClientes.RellenaCampos(Campos);
     for i := 0 to Campos.Count - 1 do
     begin
        MI := TMenuItem.Create(PMCamposDisponibles);
        MI.Caption := Campos[i];
        MI.Tag := 1;
        MI.OnClick := PMCamposDisponiblesClick;
        MI.OnDrawItem := CE_OwnerDrawMenuItem;
        MI.OnMeasureItem := CE_MeasureMenuItem;
        PMCamposDisponibles.Items.Add(MI);
     end;
  finally
     Campos.Free;
  end;
end;

procedure TFMAsistenteImpClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteImpClientes);
  Action := caFree;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteImpClientes.InicializaVariables;
begin
  // Expandir nodo
  TVMain.Items[0].Expanded := True;
  TabIndice := 0;
  OldTabIndice := 0;
  ActivarTS(0);
  ActivarTree(0);
  MueveTreeAbierto := False; // -> No dejo que se mueva de mas de uno en uno

  ControlaBotones(0);

  // Especificas al asistente
  SGDatosImp.ColWidths[0] := 11;
  FilasAMostrar := 11;
end;

procedure TFMAsistenteImpClientes.ActivarTS(Index: integer);
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

procedure TFMAsistenteImpClientes.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteImpClientes.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteImpClientes.MueveTab(Valor: integer);
begin
  Cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Control Maxima Pestaña
  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin // Proceso de cambio real
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

procedure TFMAsistenteImpClientes.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteImpClientes.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteImpClientes.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteImpClientes.ControlaBotones(Index: integer);
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

procedure TFMAsistenteImpClientes.MueveTabTree(Index: integer);
begin
  if not (Cambiar) then
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

function TFMAsistenteImpClientes.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckArchivoImp;
     else
        Result := True;
  end;
end;

procedure TFMAsistenteImpClientes.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpClientes.ButtSelArchivoClick(Sender: TObject);
var
  Filas, Columnas, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
  Archivo, Carpeta : string;
begin
  Archivo := ExtractFileName(EdArchivoImp.Text);
  Carpeta := ExtractFileDir(EdArchivoImp.Text);
  if (not DirectoryExists(Carpeta)) then
     Carpeta := '';
  if MyOpenDialog(Archivo, 'XLS,ODS,CSV', Carpeta) then
  begin
     EdArchivoImp.Text := Archivo;
     Sheets := TStringList.Create;
     try
        HojaActiva := CBHojaAImportar.Text;
        DMAsistenteImpClientes.ActualizaDatosImportacion(Archivo, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);

        CBHojaAImportar.Items.Clear;
        CBHojaAImportar.Items.AddStrings(Sheets);

        CBHojaAImportar.Text := HojaActiva;
        LInformacionHoja.Caption := format(_('Filas: %d - Columnas %d'), [Filas, Columnas]);
     finally
        Sheets.Free;
     end;
  end;
end;

procedure TFMAsistenteImpClientes.RefrescaInformacionArchivo;
var
  Filas, Columnas, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
begin
  Sheets := TStringList.Create;
  try
     HojaActiva := CBHojaAImportar.Text;
     DMAsistenteImpClientes.ActualizaDatosImportacion(EdArchivoImp.Text, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);

     CBHojaAImportar.Items.Clear;
     CBHojaAImportar.Items.AddStrings(Sheets);

     CBHojaAImportar.Text := HojaActiva;
     CBHojaAImportar.ItemIndex := CBHojaAImportar.Items.IndexOf(HojaActiva);
     LInformacionHoja.Caption := format(_('Hoja: %s - Filas: %d - Columnas %d'), [HojaActiva, Filas, Columnas]);
  finally
     Sheets.Free;
  end;
end;

procedure TFMAsistenteImpClientes.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TFMAsistenteImpClientes.CheckArchivoImp: boolean;
begin
  Result := False;

  if (EdArchivoImp.Text = '') then
  begin
     Application.MessageBox(PChar(string(_('Debe de seleccionar el archivo a importar.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
     Exit;
  end;

  if (not FileExists(EdArchivoImp.Text)) then
  begin
     Application.MessageBox(PChar(string(_('El archivo seleccionado no existe.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
     Exit;
  end;

  Result := DMAsistenteImpClientes.LeerDatos(EdArchivoImp.Text, CBHojaAImportar.Text);
  if (Result) then
  begin
     LlenarGrid;
     LlenarConstantes;

     EscribeDatoIni('ImportacionClientes', 'UltimoArchivo', Trim(EdArchivoImp.Text));
     EscribeDatoIni('ImportacionClientes', 'UltimaHoja', Trim(CBHojaAImportar.Text));
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'FechaImportacion', Now);

     LFCBPrimeraFilaTitulos.Checked := LeeDatoIni('ImportacionClientes', 'PrimeraFilaTitulos', False);
     ESeparadorDecimal.Text := LeeDatoIni('ImportacionClientes', 'SeparadorDecimal', '');
  end;
end;

procedure TFMAsistenteImpClientes.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := DMAsistenteImpClientes.DameFilas;
  ColCount := (Filas.Items[0] as TStrings).Count;

  SGDatosImp.RowCount := Filas.Count;
  SGDatosImp.ColCount := ColCount + 1;

  // Ponemos en el grid una muestra de los datos
  {
  if Filas.Count > FilasAMostrar then
     x := FilasAMostrar
  else
  }
  x := Filas.Count;
  for f := 0 to x - 1 do
     for c := 0 to ColCount - 1 do
        SGDatosImp.Cells[c + 1, f] := (Filas.Items[f] as TStrings)[c];

  for c := 1 to ColCount do
     SGDatosImp.Cells[c, 0] := LeeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'columna_' + IntToStr(c), '');
end;

procedure TFMAsistenteImpClientes.LlenarConstantes;
var
  i : integer;
  Campos : TStrings;
begin
  Campos := TStringList.Create;
  try
     DMAsistenteImpClientes.RellenaCampos(Campos);
     for i := 0 to Campos.Count - 1 do
        VLEValoresConstantes.InsertRow(Campos[i], LeeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), Campos[i], ''), False);
  finally
     Campos.Free;
  end;
end;

procedure TFMAsistenteImpClientes.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  with SGDatosImp.Canvas do
  begin
     if not (gdFixed in State) then
     begin
        if (SGDatosImp.Cells[ACol, 0] = '') then
           Brush.Color := clInfoBk
        else
           Brush.Color := clYellow;
        Font.Color := clGrayText;

        FillRect(Rect);
     end;

     TextRect(Rect, Rect.Left + 2, Rect.Top + 2, SGDatosImp.Cells[ACol, ARow]);
  end;
end;

procedure TFMAsistenteImpClientes.LimpiarLog;
begin
  MEMInfoProc.Lines.Clear;
end;

procedure TFMAsistenteImpClientes.Log(Texto: string; NuevaLinea: boolean = True);
begin
  if NuevaLinea then
     MEMInfoProc.Lines.Add(Texto)
  else
     MEMInfoProc.Lines[MEMInfoProc.Lines.Count - 1] := Texto;
end;

procedure TFMAsistenteImpClientes.ImportarClientes(BorraLog: boolean = True);
var
  f, Fila, PrimeraFila : integer;
  c : integer;
  Seguir : boolean;
begin
  if BorraLog then
     LimpiarLog;

  Log(_('Inicializando...'));

  PrimeraFila := 1;
  if LFCBPrimeraFilaTitulos.Checked then
     PrimeraFila := 2;

  Fila := StrToInt(EUltimaFilaImportada.Text);
  Log(Format(_('Comenzando en fila %d'), [Fila]));

  PrimeraFila := PrimeraFila + Fila;

  PProgresoImportacion.Min := 0;
  PProgresoImportacion.Max := SGDatosImp.RowCount;
  PProgresoImportacion.Position := Fila;

  if (ESeparadorDecimal.Text = '') then
     ESeparadorDecimal.Text := DecimalSeparator;

  DMAsistenteImpClientes.InicializaImportacion(ESeparadorDecimal.Text[1]);
  Seguir := True;
  f := PrimeraFila;

  Log(Format(_('Linea: %d'), [Fila]));
  while Seguir and (f < SGDatosImp.RowCount) do
  begin
     DMAsistenteImpClientes.NuevoCliente;
     Log(Format(_('Linea: %d'), [Fila]), False);

     try
        for c := 0 to SGDatosImp.ColCount - 1 do
        begin
           if (SGDatosImp.Cells[c, 0] <> '') then
           begin
              DMAsistenteImpClientes.AsignaParametro(SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]);
              // Log(format(_('Importando: "%s" -> "%s"'), [SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]]));
           end;
        end;
     except
        Seguir := False;
        Log(format(_('Error rellenando parametro : "%s" -> "%s"'), [SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]]));
     end;

     // Primera linea contiene los titulos ("Key" - "Value")
     try
        for c := 1 to VLEValoresConstantes.RowCount - 1 do
        begin
           if (VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]] <> '') then
           begin
              DMAsistenteImpClientes.AsignaParametro(VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]);
              // Log(format(_('Constantes: "%s" -> "%s"'), [VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]]));
           end;
        end;
     except
        Seguir := False;
        Log(format(_('Error rellenando constantes : "%s" -> "%s"'), [VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]]));
     end;

     try
        DMAsistenteImpClientes.CrearCliente;
     except
        on e: Exception do
        begin
           Seguir := False;
           Log(_('Error al importar cliente'));
           Log('----------');
           Log(E.Message);
           Log('----------');
           for c := 0 to SGDatosImp.ColCount - 1 do
           begin
              if (SGDatosImp.Cells[c, 0] <> '') then
                 Log(format(_('Parametro : "%s" -> "%s"'), [SGDatosImp.Cells[c, 0], SGDatosImp.Cells[c, f]]));
           end;

           // Primera linea contiene los titulos ("Key" - "Value")
           for c := 1 to VLEValoresConstantes.RowCount - 1 do
           begin
              if (VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]] <> '') then
                 Log(format(_('Constantes: "%s" -> "%s"'), [VLEValoresConstantes.Keys[c], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[c]]]));
           end;
        end
     end;

     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'UltimaFilaImportada', Fila);
     EUltimaFilaImportada.Text := IntToStr(Fila);
     Inc(f);
     Inc(Fila);
     PProgresoImportacion.Position := Fila;
  end;
  Log(_('Importacion Finalizada'));
end;

procedure TFMAsistenteImpClientes.ButtCrearClick(Sender: TObject);
begin
  ImportarClientes;
end;

procedure TFMAsistenteImpClientes.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpClientes.PMCamposDisponiblesClick(Sender: TObject);
begin
  // Asigna el campo seleccionado a la fila 2 del stringgrid.
  if (TMenuItem(Sender).Tag > 0) then
  begin
     SGDatosImp.Cells[SGDatosImp.Col, 0] := TMenuItem(Sender).Caption;
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'columna_' + IntToStr(SGDatosImp.Col), TMenuItem(Sender).Caption);
  end
  else
  begin
     SGDatosImp.Cells[SGDatosImp.Col, 0] := '';
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'columna_' + IntToStr(SGDatosImp.Col), '');
  end;

  SGDatosImp.Refresh;
end;

procedure TFMAsistenteImpClientes.LFCBPrimeraFilaTitulosChange(Sender: TObject);
begin
  if LFCBPrimeraFilaTitulos.Checked then
     SGDatosImp.FixedRows := 2
  else
     SGDatosImp.FixedRows := 1;

  EscribeDatoIni('ImportacionClientes', 'PrimeraFilaTitulos', LFCBPrimeraFilaTitulos.Checked);
end;

procedure TFMAsistenteImpClientes.VLEValoresConstantesExit(Sender: TObject);
var
  i : integer;
begin
  // Primera linea contiene los titulos ("Key" - "Value")
  for i := 1 to VLEValoresConstantes.RowCount - 1 do
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), VLEValoresConstantes.Keys[i], VLEValoresConstantes.Values[VLEValoresConstantes.Keys[i]]);
end;

procedure TFMAsistenteImpClientes.EdArchivoImpChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpClientes.CBHojaAImportarChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

procedure TFMAsistenteImpClientes.TSImportarShow(Sender: TObject);
begin
  inherited;
  EUltimaFilaImportada.Text := IntToStr(LeeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'UltimaFilaImportada', 0));
end;

procedure TFMAsistenteImpClientes.BContinuarClick(Sender: TObject);
begin
  inherited;
  // Incremento la linea y lanzo la importación, sin borrar log.
  EUltimaFilaImportada.Text := IntToStr(StrToInt(EUltimaFilaImportada.Text) + 1);
  ImportarClientes(False);
end;

procedure TFMAsistenteImpClientes.ESeparadorDecimalChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('ImportacionClientes', 'SeparadorDecimal', ESeparadorDecimal.Text);
end;

end.
