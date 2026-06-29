unit UFMAsistenteImpArtIdiomas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox;

type
  TFMAsistenteImpArtIdiomas = class(TG2KForm)
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
     LBLImportarTarifas: TLFLabel;
     TSSeleccionarDatos: TTabSheet;
     LBLSeleccionarDatos: TLFLabel;
     GBArchivo: TGroupBox;
     GBAsociarColumnas: TGroupBox;
     SGDatosImp: TStringGrid;
     EdArchivoImp: TLFEdit;
     ButtSelArchivo: TButton;
     CBIdioma: TLFComboBox;
     LBLIdioma: TLFLabel;
     LBLTitulo: TLFLabel;
     CBTitulo: TLFComboBox;
     GBSeleccionarImp: TGroupBox;
     DBGImp: TDBGridFind2000;
     TBSeleccionarDatos: TLFToolBar;
     TButtQuitarSel: TToolButton;
     TButtSelTodas: TToolButton;
     MEMInfo: TLFMemo;
     ButtCrear: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     LBArticulo: TLFLabel;
     CBArticulo: TLFComboBox;
     EFIdioma: TLFEditFind2000;
     CBFuerzaIdioma: TLFCheckBox;
     EIdioma: TLFEdit;
     PNLBotones: TLFPanel;
     PNLAsociarColumnasIdioma: TLFPanel;
     LBLUnicode: TLFLabel;
     CBUnicode: TLFComboBox;
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
     procedure ButtCrearClick(Sender: TObject);
     procedure ButtCerrarClick(Sender: TObject);
     procedure CBFuerzaIdiomaChange(Sender: TObject);
     procedure EFIdiomaChange(Sender: TObject);
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
     //function CheckEjercicio: Boolean;
     //function CheckEjercicioSiguiente: Boolean;
     function CheckArchivoImp: boolean;
     function CheckAsociarCol: boolean;
     procedure LlenarGrid;
     procedure LlenarCombos;
     procedure HabilitaPanelesTar;
  public
     { Public declarations }
  end;

var
  FMAsistenteImpArtIdiomas : TFMAsistenteImpArtIdiomas;

implementation

uses UDMMain, UEntorno, UDMAsistenteImpArtIdiomas, Contnrs, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMAsistenteImpArtIdiomas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsistenteImpArtIdiomas, DMAsistenteImpArtIdiomas);
  DMAsistenteImpArtIdiomas.AsignaLog(MEMInfoProc.Lines);

  InicializaVariables;
end;

procedure TFMAsistenteImpArtIdiomas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsistenteImpArtIdiomas);
  Action := caFree;
  FMAsistenteImpArtIdiomas := nil;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TFMAsistenteImpArtIdiomas.InicializaVariables;
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

  {  RGEjercicio.ItemIndex := 0;
  RGTraspasos.ItemIndex := 0;
  UPEjercicio.Position  := REntorno.Ejercicio + 1;
  GBInformacion.Visible := False;}
  SGDatosImp.ColWidths[0] := 20;
  FilasAMostrar := 15;

  HabilitaPanelesTar;
end;

procedure TFMAsistenteImpArtIdiomas.ActivarTS(Index: integer);
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

procedure TFMAsistenteImpArtIdiomas.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);

  if (ButtCerrar.Visible = True) then
  begin
     ButtCerrar.Visible := False;
     ButtNext.Visible := True;
  end;
end;

procedure TFMAsistenteImpArtIdiomas.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TFMAsistenteImpArtIdiomas.MueveTab(Valor: integer);
begin
  cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Condiciones
  // if (TabIndice = 1) and (RGEjercicio.ItemIndex = 0) then
  //    if Valor < 0 then TabIndice := 0
  //    else
  //       TabIndice := 2;

  // Control Maxima Pestaña
  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin // Proceso de cambio real
     if (Valor > 0) then
        if not (CheckTab(OldTabIndice)) then
           TabIndice := OldTabIndice;
     cambiar := True;
     // if (TabIndice=2) then
     //   TabIndice:=3;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     cambiar := False;
  end;

  ControlaBotones(TabIndice);
end;

procedure TFMAsistenteImpArtIdiomas.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TFMAsistenteImpArtIdiomas.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TFMAsistenteImpArtIdiomas.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TFMAsistenteImpArtIdiomas.ControlaBotones(Index: integer);
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

procedure TFMAsistenteImpArtIdiomas.MueveTabTree(Index: integer);
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

function TFMAsistenteImpArtIdiomas.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckArchivoImp;
     1: Result := CheckAsociarCol;
        // 2: Result := CheckSelTarifa;
        // 3: Result := CheckSelDatos;
     else
        Result := True;
  end;
end;

procedure TFMAsistenteImpArtIdiomas.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpArtIdiomas.ButtSelArchivoClick(Sender: TObject);
var
  Archivo, Carpeta : string;
begin
  Archivo := ExtractFileName(EdArchivoImp.Text);
  Carpeta := ExtractFileDir(EdArchivoImp.Text);
  if (not DirectoryExists(Carpeta)) then
     Carpeta := '';
  if MyOpenDialog(Archivo, 'XLS,ODS,CSV,TXT', Carpeta) then
     EdArchivoImp.Text := Archivo;
end;

procedure TFMAsistenteImpArtIdiomas.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TFMAsistenteImpArtIdiomas.CheckArchivoImp: boolean;
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

  Result := DMAsistenteImpArtIdiomas.LeerDatos(EdArchivoImp.Text);
  if (Result) then
  begin
     LlenarGrid;
     LlenarCombos;
  end;
end;

procedure TFMAsistenteImpArtIdiomas.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := DMAsistenteImpArtIdiomas.DameFilas;
  ColCount := (Filas.Items[0] as TStrings).Count;

  SGDatosImp.RowCount := Filas.Count;
  SGDatosImp.ColCount := ColCount + 1;

  // Ponemos en el grid una muestra de los datos
  if Filas.Count > FilasAMostrar then
     x := FilasAMostrar
  else
     x := Filas.Count;
  for f := 0 to x - 1 do
     for c := 0 to ColCount - 1 do
        SGDatosImp.Cells[c + 1, f] := (Filas.Items[f] as TStrings)[c];
end;

procedure TFMAsistenteImpArtIdiomas.LlenarCombos;
var
  Columnas : TStrings;
begin
  Columnas := DMAsistenteImpArtIdiomas.DameColumnas;

  CBArticulo.Clear;
  CBArticulo.Items.Add(_('Ninguna'));
  CBArticulo.Items.AddStrings(Columnas);
  CBArticulo.ItemIndex := 0;

  CBIdioma.Clear;
  CBIdioma.Items.Add(_('Ninguna'));
  CBIdioma.Items.AddStrings(Columnas);
  CBIdioma.ItemIndex := 0;

  CBTitulo.Clear;
  CBTitulo.Items.Add(_('Ninguna'));
  CBTitulo.Items.AddStrings(Columnas);
  CBTitulo.ItemIndex := 0;

  CBUnicode.Clear;
  CBUnicode.Items.Add(_('Ninguna'));
  CBUnicode.Items.AddStrings(Columnas);
  CBUnicode.ItemIndex := 0;

  {  CBOrigen.Clear ;
  CBOrigen.Items.Add(_('Ninguna'));
  CBOrigen.Items.AddStrings(Columnas);
  CBOrigen.ItemIndex := 0 ;
}
end;

procedure TFMAsistenteImpArtIdiomas.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
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

function TFMAsistenteImpArtIdiomas.CheckAsociarCol: boolean;
begin
  Result := False;

  if (CBArticulo.ItemIndex = 0) then
     Application.MessageBox(PChar(string(_('Debe de asociar al menos el campo Artículo.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else if ((CBIdioma.ItemIndex = CBArticulo.ItemIndex) or
     (CBTitulo.ItemIndex = CBArticulo.ItemIndex)) then
     Application.MessageBox(PChar(string(_('Ha asociado la misma columna a campos distintos.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
  begin
     Result := DMAsistenteImpArtIdiomas.LlenarTablaTemporal(CBArticulo.ItemIndex,
        CBIdioma.ItemIndex, CBTitulo.ItemIndex, CBUnicode.ItemIndex);
  end;
end;

procedure TFMAsistenteImpArtIdiomas.HabilitaPanelesTar;
begin
end;

procedure TFMAsistenteImpArtIdiomas.TButtSelTodasClick(Sender: TObject);
begin
  DMAsistenteImpArtIdiomas.SeleccionarTodas(1);
end;

procedure TFMAsistenteImpArtIdiomas.TButtQuitarSelClick(Sender: TObject);
begin
  DMAsistenteImpArtIdiomas.SeleccionarTodas(0);
end;

procedure TFMAsistenteImpArtIdiomas.ButtCrearClick(Sender: TObject);
begin
  DmAsistenteImpArtIdiomas.Insertar(CBFuerzaIdioma.Checked, EFIdioma.Text);
  ButtCerrar.Visible := True;
  ButtNext.Visible := False;
end;

procedure TFMAsistenteImpArtIdiomas.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAsistenteImpArtIdiomas.CBFuerzaIdiomaChange(Sender: TObject);
begin
  EFIdioma.Enabled := CBFuerzaIdioma.Checked;
end;

procedure TFMAsistenteImpArtIdiomas.EFIdiomaChange(Sender: TObject);
begin
  EIdioma.Text := DameTituloIdioma(EFIdioma.Text);
end;

end.
