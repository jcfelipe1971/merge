unit UCrmFMAsistenteImpContactos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, rxToolEdit, ULFEdit, Buttons, ExtDlgs, ULFCheckBox, DB, HYFIBQuery,
  ULFPanel, ULFMemo, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  TFlatCheckBoxUnit, ULFDBCheckBox, ULFToolBar, ToolWin, ULFComboBox;

type
  TCrmFMAsistenteImpContactos = class(TG2KForm)
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
     LBLArticulos: TLFLabel;
     CBPContacto: TLFComboBox;
     CB_CP: TLFComboBox;
     LBLMargenes: TLFLabel;
     LBLPrecio: TLFLabel;
     CBDireccion: TLFComboBox;
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
     LFLFamilia: TLFLabel;
     CBTelefono1: TLFComboBox;
     LBTituloArt: TLFLabel;
     CBNombreCom: TLFComboBox;
     LBTitFamilia: TLFLabel;
     CBTelefono2: TLFComboBox;
     LBTipoIva: TLFLabel;
     CBEMail: TLFComboBox;
     LWeb: TLFLabel;
     CBWeb: TLFComboBox;
     LObservaciones: TLFLabel;
     CBObservaciones: TLFComboBox;
     LFFax: TLFLabel;
     CBFax: TLFComboBox;
     LNIF: TLFLabel;
     CBNif: TLFComboBox;
     LCliPro: TLFLabel;
     LFormaPago: TLFLabel;
     CBCliente: TLFComboBox;
     CBFormaPago: TLFComboBox;
     LOrigenCliPro: TLFLabel;
     CBOrigen: TLFComboBox;
     LAgente: TLFLabel;
     CBAgente: TLFComboBox;
     CBZona: TLFComboBox;
     LZona: TLFLabel;
     PNLBotones: TLFPanel;
     PNLSeleccionColumnas: TLFPanel;
     CBRSocial: TLFComboBox;
     LBLRSocial: TLFLabel;
     LBLNombreCorto: TLFLabel;
     LBLNotas: TLFLabel;
     CBNotas: TLFComboBox;
     CBNombreCorto: TLFComboBox;
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
     procedure CargarOrigenes;
     procedure CargarAgentes;
  public
     { Public declarations }
     procedure Log(Texto: string);
  end;

var
  CrmFMAsistenteImpContactos : TCrmFMAsistenteImpContactos;

implementation

uses UDMMain, UEntorno, UCrmDMAsistenteImpContactos, Contnrs, UUtiles, URellenaLista;

{$R *.dfm}

procedure TCrmFMAsistenteImpContactos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TCrmDMAsistenteImpContactos, CrmDMAsistenteImpContactos);
  InicializaVariables;
  CargarOrigenes;
  CargarAgentes;
end;

{ PROCEDIMIENTOS DEL MOTOR DEL ASISTENTE }

procedure TCrmFMAsistenteImpContactos.InicializaVariables;
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
  FilasAMostrar := 11;
end;

procedure TCrmFMAsistenteImpContactos.ActivarTS(Index: integer);
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

procedure TCrmFMAsistenteImpContactos.ButtAntClick(Sender: TObject);
begin
  MueveTab(-1);

  if (ButtCerrar.Visible = True) then
  begin
     ButtCerrar.Visible := False;
     ButtNext.Visible := True;
  end;
end;

procedure TCrmFMAsistenteImpContactos.ButtNextClick(Sender: TObject);
begin
  MueveTab(1);
end;

procedure TCrmFMAsistenteImpContactos.MueveTab(Valor: integer);
begin
  cambiar := False;
  OldTabIndice := TabIndice;
  TabIndice := TabIndice + Valor;

  // Condiciones

  //  if (TabIndice = 1) and (RGEjercicio.ItemIndex = 0) then
  //    if Valor < 0 then TabIndice := 0
  //    else
  //      TabIndice := 2;

  // Control Maxima Pestaña

  if (TabIndice < 0) or (TabIndice > PCMain.PageCount - 1) then
     TabIndice := OldTabIndice
  else
  begin  // Proceso de cambio real
     if (Valor > 0) then
        if not (CheckTab(OldTabIndice)) then
           TabIndice := OldTabIndice;
     cambiar := True;
     //    if (TabIndice=2) then
     //      TabIndice:=3;
     ActivarTS(TabIndice);
     ActivarTree(TabIndice);
     cambiar := False;
  end;

  ControlaBotones(TabIndice);
end;

procedure TCrmFMAsistenteImpContactos.ActivarTree(Index: integer);
begin
  TVMain.Items[0].Item[index].Selected := True;
end;

procedure TCrmFMAsistenteImpContactos.TVMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  TVMain.Items[0].Expanded := True;
end;

procedure TCrmFMAsistenteImpContactos.TVMainChange(Sender: TObject; Node: TTreeNode);
begin
  MueveTabTree(Node.Index);
end;

procedure TCrmFMAsistenteImpContactos.ControlaBotones(Index: integer);
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

procedure TCrmFMAsistenteImpContactos.MueveTabTree(Index: integer);
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

function TCrmFMAsistenteImpContactos.CheckTab(Index: integer): boolean;
begin
  // Control por pestaña, es especifico por asistente
  case Index of
     0: Result := CheckArchivoImp;
     1: Result := CheckAsociarCol;
        //2: Result := CheckSelTarifa;
        //3: Result := CheckSelDatos;
     else
        Result := True;
  end;
end;

procedure TCrmFMAsistenteImpContactos.ButtCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMAsistenteImpContactos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMAsistenteImpContactos);
  Action := caFree;
  CrmFMAsistenteImpContactos := nil;
end;

procedure TCrmFMAsistenteImpContactos.ButtSelArchivoClick(Sender: TObject);
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

procedure TCrmFMAsistenteImpContactos.TSSeleccionArchivoShow(Sender: TObject);
begin
  EdArchivoImp.SetFocus;
end;

function TCrmFMAsistenteImpContactos.CheckArchivoImp: boolean;
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

  Result := CrmDMAsistenteImpContactos.LeerDatos(EdArchivoImp.Text);
  if (Result) then
  begin
     LlenarGrid;
     LlenarCombos;
  end;
end;

procedure TCrmFMAsistenteImpContactos.LlenarGrid;
var
  ColCount, x, f, c : integer;
  Filas : TObjectList;
begin
  Filas := CrmDMAsistenteImpContactos.DameFilas;
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

procedure TCrmFMAsistenteImpContactos.LlenarCombos;
var
  Columnas : TStrings;
begin
  Columnas := CrmDMAsistenteImpContactos.DameColumnas;

  CBNombreCom.Clear;
  CBNombreCom.Items.Add(_('Ninguna'));
  CBNombreCom.Items.AddStrings(Columnas);
  CBNombreCom.ItemIndex := 0;

  CBRSocial.Clear;
  CBRSocial.Items.Add(_('Ninguna'));
  CBRSocial.Items.AddStrings(Columnas);
  CBRSocial.ItemIndex := 0;

  CBNombreCorto.Clear;
  CBNombreCorto.Items.Add(_('Ninguna'));
  CBNombreCorto.Items.AddStrings(Columnas);
  CBNombreCorto.ItemIndex := 0;

  CBNotas.Clear;
  CBNotas.Items.Add(_('Ninguna'));
  CBNotas.Items.AddStrings(Columnas);
  CBNotas.ItemIndex := 0;

  CB_CP.Clear;
  CB_CP.Items.Add(_('Ninguna'));
  CB_CP.Items.AddStrings(Columnas);
  CB_CP.ItemIndex := 0;

  CBTelefono1.Clear;
  CBTelefono1.Items.Add(_('Ninguna'));
  CBTelefono1.Items.AddStrings(Columnas);
  CBTelefono1.ItemIndex := 0;

  CBEMail.Clear;
  CBEMail.Items.Add(_('Ninguna'));
  CBEMail.Items.AddStrings(Columnas);
  CBEMail.ItemIndex := 0;

  CBNombreCom.Clear;
  CBNombreCom.Items.Add(_('Ninguna'));
  CBNombreCom.Items.AddStrings(Columnas);
  CBNombreCom.ItemIndex := 0;

  CBTelefono2.Clear;
  CBTelefono2.Items.Add(_('Ninguna'));
  CBTelefono2.Items.AddStrings(Columnas);
  CBTelefono2.ItemIndex := 0;

  CBWeb.Clear;
  CBWeb.Items.Add(_('Ninguna'));
  CBWeb.Items.AddStrings(Columnas);
  CBWeb.ItemIndex := 0;

  CBPContacto.Clear;
  CBPContacto.Items.Add(_('Ninguna'));
  CBPContacto.Items.AddStrings(Columnas);
  CBPContacto.ItemIndex := 0;

  CBDireccion.Clear;
  CBDireccion.Items.Add(_('Ninguna'));
  CBDireccion.Items.AddStrings(Columnas);
  CBDireccion.ItemIndex := 0;

  CBObservaciones.Clear;
  CBObservaciones.Items.Add(_('Ninguna'));
  CBObservaciones.Items.AddStrings(Columnas);
  CBObservaciones.ItemIndex := 0;

  CBFax.Clear;
  CBFax.Items.Add(_('Ninguna'));
  CBFax.Items.AddStrings(Columnas);
  CBFax.ItemIndex := 0;

  CBNif.Clear;
  CBNif.Items.Add(_('Ninguna'));
  CBNif.Items.AddStrings(Columnas);
  CBNif.ItemIndex := 0;

  CBCliente.Clear;
  CBCliente.Items.Add(_('Ninguna'));
  CBCliente.Items.AddStrings(Columnas);
  CBCliente.ItemIndex := 0;

  CBFormaPago.Clear;
  CBFormaPago.Items.Add(_('Ninguna'));
  CBFormaPago.Items.AddStrings(Columnas);
  CBFormaPago.ItemIndex := 0;

  CBZona.Clear;
  CBZona.Items.Add(_('Ninguna'));
  CBZona.Items.AddStrings(Columnas);
  CBZona.ItemIndex := 0;

  {  CBAgente.Clear ;
  CBAgente.Items.Add(_('Ninguna'));
  CBAgente.Items.AddStrings(Columnas);
  CBAgente.ItemIndex := 0 ;
}
  {  CBOrigen.Clear ;
  CBOrigen.Items.Add(_('Ninguna'));
  CBOrigen.Items.AddStrings(Columnas);
  CBOrigen.ItemIndex := 0 ;
}
end;

procedure TCrmFMAsistenteImpContactos.SGDatosImpDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
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

function TCrmFMAsistenteImpContactos.CheckAsociarCol: boolean;
begin
  Result := False;

  if (CBNombreCom.ItemIndex = 0) then
     Application.MessageBox(PChar(string(_('Debe de asociar al menos el campo Nombre Comercial.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else if ((CB_CP.ItemIndex = CBNombreCom.ItemIndex) or
     (CBDireccion.ItemIndex = CBNombreCom.ItemIndex) or
     (CBPContacto.ItemIndex = CBNombreCom.ItemIndex) or
     (CBObservaciones.ItemIndex = CBNombreCom.ItemIndex) or
     (CBTelefono2.ItemIndex = CBNombreCom.ItemIndex) or
     (CBTelefono2.ItemIndex = CBNombreCom.ItemIndex) or
     (CBEMail.ItemIndex = CBNombreCom.ItemIndex) or
     (CBWeb.ItemIndex = CBNombreCom.ItemIndex) or
     (CBFax.ItemIndex = CBNombreCom.ItemIndex) or
     (CBZona.ItemIndex = CBNombreCom.ItemIndex) or
     (CBRSocial.ItemIndex = CBNombreCom.ItemIndex) or
     (CBNombreCorto.ItemIndex = CBNombreCom.ItemIndex) or
     (CBNotas.ItemIndex = CBNombreCom.ItemIndex) or
     (CBNif.ItemIndex = CBNombreCom.ItemIndex)) then
     Application.MessageBox(PChar(string(_('Ha asociado la misma columna a campos distintos.'))),
        PChar(string(_('Datos Incompletos'))), mb_iconstop + mb_ok)
  else
  begin
     Result := CrmDMAsistenteImpContactos.LlenarTablaTemporal(CBNombreCom.ItemIndex,
        CB_CP.ItemIndex, CBDireccion.ItemIndex, CBPContacto.ItemIndex, CBObservaciones.ItemIndex,
        CBTelefono1.ItemIndex, CBTelefono2.ItemIndex, CBEMail.ItemIndex, CBWeb.ItemIndex, CBFax.ItemIndex, CBNif.ItemIndex,
        CBCliente.ItemIndex, CBFormaPago.ItemIndex, CBZona.ItemIndex, CBRSocial.ItemIndex,
        CBNombreCorto.ItemIndex, CBNotas.ItemIndex, CBOrigen.Text, integer(CBAgente.Items.Objects[CBAgente.ItemIndex]));
  end;
end;

procedure TCrmFMAsistenteImpContactos.TButtSelTodasClick(Sender: TObject);
begin
  CrmDMAsistenteImpContactos.SeleccionarTodas(1);
end;

procedure TCrmFMAsistenteImpContactos.TButtQuitarSelClick(Sender: TObject);
begin
  CrmDMAsistenteImpContactos.SeleccionarTodas(0);
end;

procedure TCrmFMAsistenteImpContactos.Log(Texto: string);
begin
  MEMInfoProc.Lines.Add(Texto);
end;

procedure TCrmFMAsistenteImpContactos.ButtCrearClick(Sender: TObject);
begin
  CrmDmAsistenteImpContactos.InsertarContactos;
  ButtCerrar.Visible := True;
  ButtNext.Visible := False;
end;

procedure TCrmFMAsistenteImpContactos.ButtCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMAsistenteImpContactos.CargarOrigenes;
begin
  CRMDMAsistenteImpContactos.xTiposOrigenes.Close;
  CRMDMAsistenteImpContactos.xTiposOrigenes.Open;

  while not CRMDMAsistenteImpContactos.xTiposOrigenes.EOF do
  begin
     CBOrigen.Items.Add(CRMDMAsistenteImpContactos.xTiposOrigenesTORIGEN.AsString);
     CRMDMAsistenteImpContactos.xTiposOrigenes.Next;
  end;

  CBOrigen.ItemIndex := 0;
end;

procedure TCrmFMAsistenteImpContactos.CargarAgentes;
begin
  RellenaAgentes(CBAgente.Items);
  // Borro item 'Todos los agentes'
  CBAgente.Items.Delete(0);
  CBAgente.ItemIndex := 0;
end;

end.
