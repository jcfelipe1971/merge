unit UCrmFMAsistenteImpLocalidades;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox;

type
  TCrmFMAsistenteImpLocalidades = class(TG2KForm)
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
     LBLProvincia: TLFLabel;
     CBProvincia: TLFComboBox;
     CBCP: TLFComboBox;
     LBLCP: TLFLabel;
     GBSeleccionarTarifasImp: TGroupBox;
     DBGTarifasImp: TDBGridFind2000;
     TBSeleccionarDatos: TLFToolBar;
     TButtQuitarSel: TToolButton;
     TButtSelTodas: TToolButton;
     MEMInfo: TLFMemo;
     ButtCrear: TButton;
     GBInfo: TGroupBox;
     MEMInfoProc: TLFMemo;
     ButtCerrar: TButton;
     LBLTitulo: TLFLabel;
     CBTitulo: TLFComboBox;
     CBCodigo_Provincia: TLFComboBox;
     LBLCodigo_Provincia: TLFLabel;
     LBLPais: TLFLabel;
     CBColonia: TLFComboBox;
     LBLColonia: TLFLabel;
     LBLTipo_Colonia: TLFLabel;
     CBTipo_Colonia: TLFComboBox;
     CBCiudad: TLFComboBox;
     LBLCiudad: TLFLabel;
     PNLBotones: TLFPanel;
     PNLColumnas: TLFPanel;
     EFPais: TLFEditFind2000;
     ETituloPais: TLFEdit;
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
     procedure EFPaisChange(Sender: TObject);
     // procedure ButtCrearClick(Sender: TObject);
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
     // function CheckEjercicio: Boolean;
     // function CheckEjercicioSiguiente: Boolean;
     function CheckArchivoImp: boolean;
     function CheckAsociarCol: boolean;
     procedure LlenarGrid;
     procedure LlenarCombos;
  public
     { Public declarations }
     procedure Log(Texto: string);
  end;

var
  CrmFMAsistenteImpLocalidades : TCrmFMAsistenteImpLocalidades;

implementation

uses UDMMain, UEntorno, UCrmDMAsistenteImpLocalidades, Contnrs, UUtiles, UDameDato;

{$R *.dfm}

procedure TCrmFMAsistenteImpLocalidades.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TCrmDMAsistenteImpLocalidades, CrmDMAsistenteImpLocalidades);
  InicializaVariables;
  EFPais.Text := REntorno.Pais;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TCrmFMAsistenteImpLocalidades.InicializaVariables;
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
  SGDatosImp.ColWidths[0] := 11;
  FilasAMostrar := 50;
end;

procedure TCrmFMAsistenteImpLocalidades.ActivarTS(Index: integer);
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

procedure TCrmFMAsistenteImpLocalidades.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);

  if (ButtCerrar.Visible = True) then
  begin
     ButtCerrar.Visible := False;
     ButtNext.Visible := True;
  end;
end;

procedure TCrmFMAsistenteImpLocalidades.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TCrmFMAsistenteImpLocalidades.MueveTab(Valor: integer);
begin
  cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Condiciones

  // if (TabIndice = 1) and (RGEjercicio.ItemIndex = 0) then
  //    if Valor < 0 then
  //       TabIndice := 0
  //    else
  //       TabIndice := 2;

  // Control Maxima Pestaña

  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin  // Proceso de cambio real
     if (Valor > 0) then
        if not (CheckTab(OldTabIndice)) then
           TabIndice := OldTabIndice;
     cambiar := True;
     // if (TabIndice = 2) then
     //    TabIndice := 3;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     cambiar := False;
  end;

  ControlaBotones(TabIndice);
end;

procedure TCrmFMAsistenteImpLocalidades.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TCrmFMAsistenteImpLocalidades.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TCrmFMAsistenteImpLocalidades.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TCrmFMAsistenteImpLocalidades.ControlaBotones(Index: integer);
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

procedure TCrmFMAsistenteImpLocalidades.MueveTabTree(Index: integer);
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

function TCrmFMAsistenteImpLocalidades.CheckTab(Index: integer): boolean;
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

procedure TCrmFMAsistenteImpLocalidades.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMAsistenteImpLocalidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMAsistenteImpLocalidades);
  Action := caFree;
  CrmFMAsistenteImpLocalidades := nil;
end;

procedure TCrmFMAsistenteImpLocalidades.ButtSelArchivoClick(Sender: TObject);
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

procedure TCrmFMAsistenteImpLocalidades.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TCrmFMAsistenteImpLocalidades.CheckArchivoImp: boolean;
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

  Result := CrmDMAsistenteImpLocalidades.LeerDatos(EdArchivoImp.Text);
  if (Result) then
  begin
     LlenarGrid;
     LlenarCombos;
  end;
end;

procedure TCrmFMAsistenteImpLocalidades.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := CrmDMAsistenteImpLocalidades.DameFilas;
  ColCount := (Filas.Items[0] as TStrings).Count;

  SGDatosImp.RowCount := Filas.Count;
  SGDatosImp.ColCount := ColCount + 1;

  // ponemos en el grid una muestra de los datos
  if Filas.Count > FilasAMostrar then
     x := FilasAMostrar
  else
     x := Filas.Count;
  for f := 0 to x - 1 do
     for c := 0 to ColCount - 1 do
        SGDatosImp.Cells[c + 1, f] := (Filas.Items[f] as TStrings)[c];
end;

procedure TCrmFMAsistenteImpLocalidades.LlenarCombos;
var
  Columnas : TStrings;
begin
  Columnas := CrmDMAsistenteImpLocalidades.DameColumnas;

  CBTitulo.Clear;
  CBTitulo.Items.Add(_('Ninguna'));
  CBTitulo.Items.AddStrings(Columnas);
  CBTitulo.ItemIndex := 0;

  CBCP.Clear;
  CBCP.Items.Add(_('Ninguna'));
  CBCP.Items.AddStrings(Columnas);
  CBCP.ItemIndex := 0;

  CBProvincia.Clear;
  CBProvincia.Items.Add(_('Ninguna'));
  CBProvincia.Items.AddStrings(Columnas);
  CBProvincia.ItemIndex := 0;

  CBCodigo_Provincia.Clear;
  CBCodigo_Provincia.Items.Add(_('Ninguna'));
  CBCodigo_Provincia.Items.AddStrings(Columnas);
  CBCodigo_Provincia.ItemIndex := 0;

  CBCiudad.Clear;
  CBCiudad.Items.Add(_('Ninguna'));
  CBCiudad.Items.AddStrings(Columnas);
  CBCiudad.ItemIndex := 0;

  CBColonia.Clear;
  CBColonia.Items.Add(_('Ninguna'));
  CBColonia.Items.AddStrings(Columnas);
  CBColonia.ItemIndex := 0;

  CBTipo_Colonia.Clear;
  CBTipo_Colonia.Items.Add(_('Ninguna'));
  CBTipo_Colonia.Items.AddStrings(Columnas);
  CBTipo_Colonia.ItemIndex := 0;
end;

procedure TCrmFMAsistenteImpLocalidades.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
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

function TCrmFMAsistenteImpLocalidades.CheckAsociarCol: boolean;
begin
  Result := False;

  if (CBTitulo.ItemIndex = 0) then
     Application.MessageBox(PChar(string(_('Debe de asociar al menos el campo Titulo.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else if ((CBCP.ItemIndex = CBTitulo.ItemIndex) or
     (CBProvincia.ItemIndex = CBTitulo.ItemIndex)) then
     Application.MessageBox(PChar(string(_('Ha asociado la misma columna a campos distintos.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
  begin
     Result := CrmDMAsistenteImpLocalidades.LlenarTablaTemporal(CBTitulo.ItemIndex,
        CBCP.ItemIndex, CBProvincia.ItemIndex, CBCodigo_Provincia.ItemIndex,
        CBCiudad.ItemIndex, CBColonia.ItemIndex, CBTipo_Colonia.ItemIndex, EFPais.Text);
  end;
end;

procedure TCrmFMAsistenteImpLocalidades.TButtSelTodasClick(Sender: TObject);
begin
  CrmDMAsistenteImpLocalidades.SeleccionarTodas(1);
end;

procedure TCrmFMAsistenteImpLocalidades.TButtQuitarSelClick(Sender: TObject);
begin
  CrmDMAsistenteImpLocalidades.SeleccionarTodas(0);
end;

procedure TCrmFMAsistenteImpLocalidades.Log(Texto: string);
begin
  MEMInfoProc.Lines.Add(Texto);
end;

procedure TCrmFMAsistenteImpLocalidades.ButtCrearClick(Sender: TObject);
begin
  CrmDmAsistenteImpLocalidades.InsertarProvincias;
  CrmDmAsistenteImpLocalidades.InsertarLocalidades;
  ButtCerrar.Visible := True;
  ButtNext.Visible := False;
end;

procedure TCrmFMAsistenteImpLocalidades.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMAsistenteImpLocalidades.EFPaisChange(Sender: TObject);
begin
  ETituloPais.Text := DameTituloPais(EFPais.Text);
end;

end.
