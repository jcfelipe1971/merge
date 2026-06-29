unit UFMAsistenteImpAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox;

type
  TFMAsistenteImpAsientos = class(TG2KForm)
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
     LBLImportarAsientos: TLFLabel;
     TSSeleccionarDatos: TTabSheet;
     LBLSeleccionarDatos: TLFLabel;
     GBArchivo: TGroupBox;
     GBAsociarColumnas: TGroupBox;
     SGDatosImp: TStringGrid;
     EdArchivoImp: TLFEdit;
     ButtSelArchivo: TButton;
     LBLAsientos: TLFLabel;
     CBAsientos: TLFComboBox;
     CBCuentas: TLFComboBox;
     LBLCuentas: TLFLabel;
     LBLFecha: TLFLabel;
     CBFecha: TLFComboBox;
     GBSeleccionarAsientosImp: TGroupBox;
     DBGAsientosImp: TDBGridFind2000;
     TBSeleccionarDatos: TLFToolBar;
     TButtQuitarSel: TToolButton;
     TButtSelTodas: TToolButton;
     MEMInfo: TLFMemo;
     ButtImportar: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     LFLTextoAsiento: TLFLabel;
     CBTextoAsiento: TLFComboBox;
     LBLLinea: TLFLabel;
     CBLineas: TLFComboBox;
     LBLTipoAsiento: TLFLabel;
     CBTipoAsiento: TLFComboBox;
     LBLImporte: TLFLabel;
     CBImporte: TLFComboBox;
     LFCBDebeYHaber: TLFCheckBox;
     PNLBotones: TLFPanel;
     PNLSeleccionarColumnas: TLFPanel;
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
     procedure TButtSelTodasClick(Sender: TObject);
     procedure TButtQuitarSelClick(Sender: TObject);
     procedure ButtImportarClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure LFCBDebeYHaberChange(Sender: TObject);
     //procedure ButtCrearClick(Sender: TObject);
  private
     { Private declarations }
     TabIndice: integer;
     OldTabIndice: integer;
     cambiar: boolean;
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
     function CheckAsociarCol: boolean;
     function CheckSelDatos: boolean;
     procedure LlenarGrid;
     procedure LlenarCombos;
     procedure LimpiarLog;
     procedure Log(Texto: string);
     procedure ImportarAsientos;
  public
     { Public declarations }
  end;

var
  FMAsistenteImpAsientos : TFMAsistenteImpAsientos;

implementation

uses UDMMain, UEntorno, UDMAsistenteImpAsientos, Contnrs, UUtiles, UParam;

{$R *.dfm}

procedure TFMAsistenteImpAsientos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsistenteImpAsientos, DMAsistenteImpAsientos);
  InicializaVariables;
end;

procedure TFMAsistenteImpAsientos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteImpAsientos);
  Action := caFree;
  FMAsistenteImpAsientos := nil;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteImpAsientos.InicializaVariables;
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
  FilasAMostrar := 1024;
end;

procedure TFMAsistenteImpAsientos.ActivarTS(Index: integer);
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

procedure TFMAsistenteImpAsientos.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);
end;

procedure TFMAsistenteImpAsientos.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteImpAsientos.MueveTab(Valor: integer);
begin
  cambiar := False;
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
     cambiar := True;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     cambiar := False;
  end;

  ControlaBotones(TabIndice);
end;

procedure TFMAsistenteImpAsientos.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteImpAsientos.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteImpAsientos.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteImpAsientos.ControlaBotones(Index: integer);
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

procedure TFMAsistenteImpAsientos.MueveTabTree(Index: integer);
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

function TFMAsistenteImpAsientos.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckArchivoImp;
     1: Result := CheckAsociarCol;
     2: Result := CheckSelDatos;
     else
        Result := True;
  end;
end;

procedure TFMAsistenteImpAsientos.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

{ PROCEDIMIENTOS ESPECIFICOS PARA ESTE ASISTENTE }

procedure TFMAsistenteImpAsientos.ButtSelArchivoClick(Sender: TObject);
var
  Archivo, Carpeta : string;
begin
  Archivo := ExtractFileName(EdArchivoImp.Text);
  Carpeta := ExtractFileDir(EdArchivoImp.Text);
  if (not DirectoryExists(Carpeta)) then
     Carpeta := '';
  if MyOpenDialog(Archivo, 'XLS,ODS,CSV,TXT', Carpeta, 'FMAsistenteImpAsientos-SelArchivo') then
     EdArchivoImp.Text := Archivo;
end;

procedure TFMAsistenteImpAsientos.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TFMAsistenteImpAsientos.CheckArchivoImp: boolean;
var
  param_IMPCALC001 : string;
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

  param_IMPCALC001 := LeeParametro('IMPCALC001');
  if (param_IMPCALC001 = 'S') then
     Result := DMAsistenteImpAsientos.LeerDatosCalc(EdArchivoImp.Text)
  else
     Result := DMAsistenteImpAsientos.LeerDatos(EdArchivoImp.Text);

  if (Result) then
  begin
     LlenarGrid;
     LlenarCombos;
  end;
end;

procedure TFMAsistenteImpAsientos.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := DMAsistenteImpAsientos.DameFilas;

  // Ponemos en el grid una muestra de los datos
  x := Filas.Count;
  if (Filas.Count > FilasAMostrar) then
     x := FilasAMostrar;

  SGDatosImp.RowCount := x;
  ColCount := (Filas.Items[0] as TStrings).Count;
  SGDatosImp.ColCount := ColCount + 1;

  for f := 0 to x - 1 do
     for c := 0 to ColCount - 1 do
        SGDatosImp.Cells[c + 1, f] := (Filas.Items[f] as TStrings)[c];
end;

procedure TFMAsistenteImpAsientos.LlenarCombos;
var
  Columnas : TStrings;
begin
  Columnas := DMAsistenteImpAsientos.DameColumnas;

  CBAsientos.Clear;
  CBAsientos.Items.Add(_('Ninguna'));
  CBAsientos.Items.AddStrings(Columnas);
  CBAsientos.ItemIndex := 0;

  CBLineas.Clear;
  CBLineas.Items.Add(_('Ninguna'));
  CBLineas.Items.AddStrings(Columnas);
  CBLineas.ItemIndex := 0;

  CBCuentas.Clear;
  CBCuentas.Items.Add(_('Ninguna'));
  CBCuentas.Items.AddStrings(Columnas);
  CBCuentas.ItemIndex := 0;

  CBFecha.Clear;
  CBFecha.Items.Add(_('Ninguna'));
  CBFecha.Items.AddStrings(Columnas);
  CBFecha.ItemIndex := 0;

  CBTextoAsiento.Clear;
  CBTextoAsiento.Items.Add(_('Ninguna'));
  CBTextoAsiento.Items.AddStrings(Columnas);
  CBTextoAsiento.ItemIndex := 0;

  CBTipoAsiento.Clear;
  CBTipoAsiento.Items.Add(_('Ninguna'));
  CBTipoAsiento.Items.AddStrings(Columnas);
  CBTipoAsiento.ItemIndex := 0;

  CBImporte.Clear;
  CBImporte.Items.Add(_('Ninguna'));
  CBImporte.Items.AddStrings(Columnas);
  CBImporte.ItemIndex := 0;
end;

procedure TFMAsistenteImpAsientos.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  with SGDatosImp.Canvas do
  begin
     if not (gdFixed in State) then
     begin
        Brush.Color := clInfoBk;
        Font.Color := clGrayText;
        FillRect(Rect);
     end;

     TextRect(Rect, Rect.Left + 2, Rect.Top + 2, SGDatosImp.Cells[ACol, ARow]);
  end;
end;

function TFMAsistenteImpAsientos.CheckAsociarCol: boolean;
begin
  Result := False;

  if ({(CBAsientos.ItemIndex     = 0) or
      (CBLineas.ItemIndex       = 0) or}
     (CBCuentas.ItemIndex = 0) or
     (CBTextoAsiento.ItemIndex = 0) or
     (CBTipoAsiento.ItemIndex = 0) or
     (CBImporte.ItemIndex = 0)) then
     Application.MessageBox(PChar(string(_('Debe de asociar al menos los campos Asiento, Línea, Cuenta, Texto, Tipo e Importe.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else if ({(CBAsientos.ItemIndex      = CBLineas.ItemIndex      ) or
           (CBAsientos.ItemIndex      = CBCuentas.ItemIndex     ) or
           (CBAsientos.ItemIndex      = CBTextoAsiento.ItemIndex) or
           (CBAsientos.ItemIndex      = CBTipoAsiento.ItemIndex ) or
           (CBAsientos.ItemIndex      = CBImporte.ItemIndex     ) or
           (CBLineas.ItemIndex        = CBCuentas.ItemIndex     ) or
           (CBLineas.ItemIndex        = CBTextoAsiento.ItemIndex) or
           (CBLineas.ItemIndex        = CBTipoAsiento.ItemIndex ) or
           (CBLineas.ItemIndex        = CBImporte.ItemIndex     ) or}
     (CBCuentas.ItemIndex = CBTextoAsiento.ItemIndex) or
     (CBCuentas.ItemIndex = CBTipoAsiento.ItemIndex) or
     (CBCuentas.ItemIndex = CBImporte.ItemIndex) or
     (CBTextoAsiento.ItemIndex = CBTipoAsiento.ItemIndex) or
     (CBTextoAsiento.ItemIndex = CBImporte.ItemIndex) or
     (CBTipoAsiento.ItemIndex = CBImporte.ItemIndex)) then
     Application.MessageBox(PChar(string(_('Ha asociado la misma columna a campos distintos.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
     Result := DMAsistenteImpAsientos.LlenarTablaTemporal(CBAsientos.ItemIndex,
        CBLineas.ItemIndex, CBCuentas.ItemIndex, CBFecha.ItemIndex,
        CBTextoAsiento.ItemIndex, CBTipoAsiento.ItemIndex, CBImporte.ItemIndex,
        LFCBDebeYHaber.Checked);

  if (Result) then
  begin
     DBGAsientosImp.Columns[4].Visible := (CBTipoAsiento.ItemIndex > 0) and (CBImporte.ItemIndex > 0);
     DBGAsientosImp.Columns[5].Visible := not DBGAsientosImp.Columns[4].Visible;
     DBGAsientosImp.Columns[6].Visible := not DBGAsientosImp.Columns[4].Visible;
     if (DBGAsientosImp.Columns[4].Visible) then
        DBGAsientosImp.Columns[3].Width := 285
     else
        DBGAsientosImp.Columns[3].Width := 250;
  end;
end;

procedure TFMAsistenteImpAsientos.TButtSelTodasClick(Sender: TObject);
begin
  DMAsistenteImpAsientos.SeleccionarTodas(1);
end;

procedure TFMAsistenteImpAsientos.TButtQuitarSelClick(Sender: TObject);
begin
  DMAsistenteImpAsientos.SeleccionarTodas(0);
end;

procedure TFMAsistenteImpAsientos.LimpiarLog;
begin
  MEMInfoProc.Lines.Clear;
end;

procedure TFMAsistenteImpAsientos.Log(Texto: string);
begin
  MEMInfoProc.Lines.Add(Texto);
end;

procedure TFMAsistenteImpAsientos.ButtImportarClick(Sender: TObject);
begin
  ImportarAsientos;
end;

function TFMAsistenteImpAsientos.CheckSelDatos: boolean;
begin
  Result := DMAsistenteImpAsientos.Seleccionados;
  if (not Result) then
     Application.MessageBox(PChar(string(_('No ha seleccionado ningún asiento.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok);
end;

procedure TFMAsistenteImpAsientos.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpAsientos.LFCBDebeYHaberChange(Sender: TObject);
begin
  if (TLFCheckBox(Sender).Checked) then
  begin
     LBLTipoAsiento.Caption := _('Debe');
     LBLImporte.Caption := _('Haber');
  end
  else
  begin
     LBLTipoAsiento.Caption := _('Tipo (D/H)');
     LBLImporte.Caption := _('Importe');
  end;
end;

procedure TFMAsistenteImpAsientos.ImportarAsientos;
var
  i, Errores : integer;
  docList : TDocInfoList;
  docInfo : TDocInfo;
begin
  Errores := 0;
  LimpiarLog;
  Log(_('Inicializando'));

  with DMAsistenteImpAsientos do
  begin
     docList := InicializaProceso();
     for i := 0 to docList.Count - 1 do
     begin
        docInfo := docList[i];
        Log(Format(_('Importando asiento %d'), [docInfo.asiento]));
        if (not ImportarAsiento(docInfo.asiento, docInfo.fecha)) then
        begin
           Log(_('Error:'));
           Log(Error);
           Errores := Errores + 1;
        end
        else
        begin
           if (not ImportarApuntes(docInfo.asiento)) then
           begin
              Log(_('Error:'));
              Log(Error);
              Errores := Errores + 1;
           end;
        end;
     end;
     docList.Clear;
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
end;

end.
