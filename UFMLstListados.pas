unit UFMLstListados;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, UFMLst, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  ExtCtrls, ULFEdit, DBCtrls, rxToolEdit, StdCtrls, ULFComboBox, ULFPanel,
  Mask, ULFDBEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, Menus, ULFDateEdit, Grids, ValEdit,
  DBGrids, NsDBGrid, AbBase, AbBrowse, AbZBrows, AbZipper, ShellApi,
  ExtDlgs, ABUtils, AbZipTyp, AbArcTyp, AbUnzPrc, ULFDBCheckBox, ULFMemo,
  ULFDBMemo;

const
  sufijo_desde = '_d';
  sufijo_hasta = '_h';
  sufijo_titulo = '_t';
  sufijo_listbox = '_l_b';
  sufijo_boton = '_btn';
  prefijo_componentes = '_lst_';
  prefijo_groupbox = '_gb_';
  prefijo_label = '_lb';

type
  TFMLstListados = class(TFMLst)
     GBEjemploListaDeValores: TGroupBox;
     LFLabel1: TLFLabel;
     LFEditFind20001: TLFEditFind2000;
     LFDbedit1: TLFDbedit;
     ListBox1: TListBox;
     Button1: TButton;
     Button2: TButton;
     GBEjemploEditFind: TGroupBox;
     LFLabel2: TLFLabel;
     LFEditFind20002: TLFEditFind2000;
     LFDbedit2: TLFDbedit;
     popUpListados: TPopupMenu;
     Panel1: TLFPanel;
     DBETituloListado: TLFDbedit;
     GBEjemploCheckBox: TGroupBox;
     AAA1: TMenuItem;
     tbEliminar: TToolButton;
     TButtEstablecerPorDefecto: TToolButton;
     GBEjemploFechaDesdeHasta: TGroupBox;
     LFLabel5: TLFLabel;
     LFLabel6: TLFLabel;
     LFDateEdit3: TLFDateEdit;
     LFDateEdit4: TLFDateEdit;
     Button3: TButton;
     tbDesarrollo: TToolButton;
     popDesarrollo: TPopupMenu;
     MICrearFiltros: TMenuItem;
     MILimpiarFiltros: TMenuItem;
     TSDesarrollo: TTabSheet;
     PCDebug: TLFPageControl;
     tsDebug: TTabSheet;
     memLog: TLFMemo;
     tsParametros: TTabSheet;
     vleParametros: TValueListEditor;
     tsOrdenes: TTabSheet;
     vleOrdenes: TValueListEditor;
     tsFiltros: TTabSheet;
     vleFiltros: TValueListEditor;
     TSSQl: TTabSheet;
     memSQL: TLFMemo;
     vleParamssql: TValueListEditor;
     BMostrarConsultaYPrametros: TButton;
     tsAyuda: TTabSheet;
     memAyuda: TLFMemo;
     TSListado: TTabSheet;
     BAbreEdicion: TButton;
     BGuardaEdicion: TButton;
     DBMConsulaSQL: TLFDBMemo;
     DBETitulo: TLFDBEdit;
     DBCBPermitirDisenarListados: TLFDBCheckBox;
     DBCBPerimitirDefinirNuevosListados: TLFDBCheckBox;
     DBCBPermitirEliminarListados: TLFDBCheckBox;
     LConsultaSQL: TLFLabel;
     LTitulo: TLFLabel;
     LOrden: TLFLabel;
     DBEOrden: TLFDBEdit;
     TSEdicionFiltros: TTabSheet;
     DBGFDetalle: TDBGridFind2000;
     PopupMenu1: TPopupMenu;
     Limpiar1: TMenuItem;
     tsDebOrdenes: TTabSheet;
     DBGOrdenes: TDBGridFind2000;
     GBEjemploFecha: TGroupBox;
     LFLabel4: TLFLabel;
     LFDateEdit2: TLFDateEdit;
     GBEjemploCadena: TGroupBox;
     LFLabel7: TLFLabel;
     LFEdit2: TLFEdit;
     LFCheckBox1: TLFCheckBox;
     BTestearListado: TButton;
     DBGResultadoTesteo: TDBGridFind2000;
     MIExportarConfiguracionListado: TMenuItem;
     AbZipper1: TAbZipper;
     AbZipBrowser1: TAbZipBrowser;
     DBCBMostrarTabSalida: TLFDBCheckBox;
     tbExportar: TToolButton;
     PNLTesteoTop: TLFPanel;
     PNLTesteoParametros: TLFPanel;
     Splitter1: TSplitter;
     Splitter2: TSplitter;
     AEstablecerPorDefecto: TAction;
     AEliminar: TAction;
     AExportarListadoHTML: TAction;
     ACrearFiltros: TAction;
     ALimpiarFiltros: TAction;
     AExportarConfiguracionListado: TAction;
     PNLDesConsultaCabecera: TLFPanel;
     PNLDesConsultaSQL: TLFPanel;
     PNLDesConsultaDatos: TLFPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BusquedaEF(Sender: TObject);
     procedure PonTitulo(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure ClickMenuListados(Sender: TObject);
     procedure TButtPrevisualizarClick(Sender: TObject);
     procedure popUpListadosPopup(Sender: TObject);
     procedure BtnEliminarClick(Sender: TObject);
     procedure BtnEliminarTodosClick(Sender: TObject);
     procedure BtnAniadir(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure BMostrarConsultaYPrametrosClick(Sender: TObject);
     procedure BAbreEdicionClick(Sender: TObject);
     procedure PCDebugChanging(Sender: TObject; var AllowChange: boolean);
     procedure BGuardaEdicionClick(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure Limpiar1Click(Sender: TObject);
     procedure CambiaCH(Sender: TObject);
     procedure CambiaTX(Sender: TObject);
     procedure CBOrdenChange(Sender: TObject);
     procedure PCDebugChange(Sender: TObject);
     procedure CambiaDE(Sender: TObject);
     procedure BTestearListadoClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AEstablecerPorDefectoExecute(Sender: TObject);
     procedure AEliminarExecute(Sender: TObject);
     procedure AExportarListadoHTMLExecute(Sender: TObject);
     procedure ACrearFiltrosExecute(Sender: TObject);
     procedure ALimpiarFiltrosExecute(Sender: TObject);
     procedure AExportarConfiguracionListadoExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     _grupo, _listado: integer;
     permitir_nuevo_listado: boolean;
     slComponentes: TStringList;
     Desarrollo: boolean;
     procedure AddUnoSolo;
     procedure AddDesdeHastaFecha;
     function GetSelected(lb: tListBox): integer;
     procedure RepasaLB;
     procedure AddLista;
     procedure AddFecha;
     procedure AddCheck;
     procedure AddTexto;
     procedure LimpiaComponentes;
     procedure AddDesdeHasta;
     procedure AddDE(gb: TGroupBox; mostrarLabel: boolean = False; desde: boolean = True);
     procedure AddCH(gb: TGroupBox);
     procedure AddTX(gb: TGroupBox);
     procedure AddEF(gb: TGroupBox; MostrarLabel: boolean = False; Desde: boolean = True);
     procedure RepasaTabOrder;
     procedure ActualizaParametros;
     procedure ActualizaOrdenes;
     procedure RecargaListado(Grupo, Listado: integer);
     procedure ActualizaFiltros;
  public
     procedure Mostrar(Grupo, Listado: integer);
     //Creamos en tiempo de ejecucion los desde hasta de los filtros que haya
     procedure AbreFiltros;
     procedure cDebug(cadena: string; proridad: integer = 0);
  end;

  THelper = class
  public
     procedure UnzipProc(Sender: TObject; Item: TAbArchiveItem; const NewName: string);
  end;

var
  FMLstListados : TFMLstListados;

procedure ImportaListados;
procedure ImportaListado(Archivo: string);
// procedure UnZipHelper(Sender:TObject; Item:TAbArchiveItem;const NewName:string);

implementation

uses UDMLstListados, UFormGest, UDMMain, UUtiles, {UFunciones,
  UDMFunciones,} UHTMLInf, UParam;

{$R *.dfm}

procedure THelper.UnzipProc(Sender: TObject; Item: TAbArchiveItem; const NewName: string);
begin
  // AbUnzip(Sender, TAbZipItem(Item), NewName) ;
  AbUnzip(TAbZipArchive(Sender), TAbZipItem(Item), NewName);
end;

procedure ImportaListados;
var
  i : integer;
begin
  with TOpenDialog.Create(Application) do
     try
        Filter := _('Listados Personalizados|*.nls');
        DefaultExt := '*.nls';
        Options := [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing];
        InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, True);
        if Execute then
        begin
           for i := 0 to Files.Count - 1 do
              ImportaListado(Files.Strings[i]);
        end;
     finally
        Free;
     end;
end;

procedure ImportaListado(Archivo: string);
var
  zb : TAbZipArchive;
  i, p : integer;
  grupoc, listadoc : string;
  Grupo, Listado : integer;
  cadena : string;
  nombre, fichero, fichero_tmp : string;
  DirectorioTemporal : string;
  Helper : THelper;
begin
  DirectorioTemporal := DameTempPath;
  // zb := TAbZipBrowser.Create(Application);
  try
     zb := TAbZipArchive.Create(Archivo, fmOpenRead or fmShareDenyNone);
  except
     ShowMessage(_('No se ha podido abrir el fichero. El formato no es válido'));
     Exit;
  end;

  fichero_tmp := ExtractFileName(GetTempFile('.nls'));
  Helper := THelper.Create;
  try
     // zb.BaseDIrectory:=ExtractFilePath(donde);
     // zb.OpenArchive(donde);
     zb.TempDirectory := DirectorioTemporal;
     zb.BaseDirectory := DirectorioTemporal;
     zb.Load;
     zb.ExtractOptions := [eoCreateDirs];
     zb.ExtractHelper := Helper.UnzipProc;

     for i := 0 to zb.Count - 1 do
     begin
        cadena := zb.Items[i].DiskPath;
        fichero := ExtractFileName(zb.Items[i].DiskFileName);
        nombre := ChangeFileExt(fichero, EmptyStr);
        if cadena[1] = '\' then
           cadena := Copy(cadena, 2, Length(cadena));
        if cadena[Length(cadena)] = '\' then
           cadena := Copy(cadena, 1, Length(cadena) - 1);
        p := Pos('\', cadena);
        if p > 0 then
        begin
           grupoc := Copy(cadena, 1, p - 1);
           listadoc := Copy(cadena, p + 1, Length(cadena));
           Grupo := DMLstListados.NuevoGrupo(grupoc);
           Listado := DMLstListados.NuevoListado(Grupo, listadoc);

           if FileExists(DirectorioTemporal + fichero_tmp) then
              DeleteFile(DirectorioTemporal + fichero_tmp);

           zb.Extract(zb.Items[i], fichero_tmp);

           if ExtractFileExt(fichero) = '.sql' then
              DMLstListados.TomaSQlListado(Grupo, Listado, DirectorioTemporal + fichero_tmp);

           if ExtractFileExt(fichero) = '.fr3' then
              DMLstListados.TomaFR3Listado(Grupo, Listado, DirectorioTemporal + fichero_tmp, nombre);

           if ExtractFileExt(fichero) = '.def' then
              DMLstListados.TomaDefListado(Grupo, Listado, DirectorioTemporal + fichero_tmp);
        end;
     end;
  finally
     zb.Free;
     Helper.Free;
  end;
end;

procedure TFMLstListados.RecargaListado(Grupo, Listado: integer);
var
  hay_orden, permitir_modificar, mostrar_tipo, permitir_eliminar, ver_salida : boolean;
  Titulo : string;
begin
  DMLstListados.SetDatos(Grupo, Listado, permitir_modificar,
     permitir_nuevo_listado, permitir_eliminar,
     ver_salida, mostrar_tipo, Titulo);
  Caption := Titulo;
  if not Desarrollo then
  begin
     LimpiaComponentes;
     TButtConf.Visible := permitir_modificar;
     tbEliminar.Visible := permitir_eliminar;
     // RGTipoInforme.Visible := mostrar_tipo;
     TSAgrupOrd.TabVisible := ver_salida;
     hay_orden := DMLstListados.CargaOrdenes(CBOrden) > 0;
     // PNLOpcGen.Visible := Hay_Orden;
     if ((not ver_salida) and (not hay_orden)) then
        TSAgrupOrd.TabVisible := False;
     AbreFiltros;
     RepasaTabOrder;
     ARecargar.Execute;
     tbDesarrollo.Visible := False;
     tsDesarrollo.TabVisible := False;
  end
  else
  begin
     DMLstListados.CargaOrdenes(CBOrden);
     memLog.Visible := True;
     tbDesarrollo.Visible := True;
     tsDesarrollo.TabVisible := True;
     DMLstListados.AbreDesarrollo;
  end;
  CBOrdenChange(CBOrden);
end;

procedure TFMLstListados.FormCreate(Sender: TObject);
begin
  slComponentes := TStringList.Create;
  // Se debe crear el DM antes de llamar ainherited, porque se llamará a ARecargar.
  AbreData(TDMLstListados, DMLstListados);

  inherited;
end;

procedure TFMLstListados.Mostrar(Grupo, Listado: integer);
begin
  Desarrollo := False;
  Desarrollo := LeeParametro('MODREST024') = 'S';

  _listado := Listado;
  _grupo := Grupo;
  LimpiaComponentes;
  RecargaListado(Grupo, Listado);

  if (Desarrollo) then
  begin
     PCMain.ActivePage := TSAgrupOrd;
  end;

  {
  DBGFDetalle.Titulos.Clear;
  DBGFDetalle.Titulos.Add('RDB$FIELD_NAME');
  DBGFDetalle.Titulos.Add('RDB$FIELD_NAME');
  DBGFDetalle.Titulos.Add('RDB$RELATION_NAME');
  DBGFDetalle.Tablas.Clear;
  DBGFDetalle.Tablas.Add('RDB$RELATION_FIELDS');
  DBGFDetalle.Tablas.Add('RDB$RELATION_FIELDS');
  DBGFDetalle.Tablas.Add('RDB$RELATIONS');
  DBGFDetalle.Numericos.Clear;
  DBGFDetalle.Numericos.Add('RDB$FIELD_NAME');
  DBGFDetalle.Numericos.Add('RDB$FIELD_NAME');
  DBGFDetalle.Numericos.Add('RDB$RELATION_NAME');
}
end;

procedure TFMLstListados.LimpiaComponentes;
var
  i : integer;
begin
  memLog.Lines.Clear;
  cDebug(_('Limpiando componentes'));
  i := 0;
  with TSLimites do
     while i < ComponentCount do
     begin
        if Components[i] is TGroupBox then
        begin
           // tslimites.RemoveComponent(Components[x]);
           TGroupBox(Components[i]).Free;
           continue;
        end;
        Inc(i);
     end;
  DMLstListados.Limpia;
end;

procedure TFMLstListados.RepasaTabOrder;
var
  i : integer;
begin
  cDebug(_('Repasamos TabOrder'));
  // Corregimos los taborder
  with TSLimites do
     for i := 0 to ComponentCount - 1 do
        if Components[i] is TGroupBox then
           if TGroupBox(Components[i]).Visible then
              TGroupBox(Components[i]).TabOrder := TGroupBox(Components[i]).Tag;
end;

procedure TFMLstListados.AddCH(gb: TGroupBox);
var
  parametro : string;
  orden : integer;
  ch : TLFCheckBox;
begin
  cDebug(_('Añadimos Check'));
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;

  // Creamos el componente de DateEdit
  ch := TLFCheckBox.Create(gb);
  with ch do
  begin
     Parent := gb;
     Left := 64;
     Width := 385;
     Top := 16;
     Tag := orden;
     Name := prefijo_componentes + parametro;
     Hint := parametro;
     Caption := DMLstListados.QFiltros.FieldByName('texto').AsString;
     OnChange := CambiaCH;
     CambiaCH(ch);
  end;
end;

procedure TFMLstListados.AddTX(gb: TGroupBox);
var
  parametro : string;
  orden : integer;
  ch : TLFEdit;
  lb : TLFLabel;
begin
  cDebug(_('Añadimos Check'));
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;

  // Creamos el componente de DateEdit
  ch := TLFEdit.Create(gb);
  with ch do
  begin
     Parent := gb;
     Left := 104;
     Width := 233;
     Top := 14;
     Tag := orden;
     Name := prefijo_componentes + parametro;
     Hint := parametro;
     Caption := EmptyStr;
     OnChange := CambiaTX;
     CambiaTX(ch);
  end;

  lb := TLFLabel.Create(gb);
  with lb do
  begin
     Parent := gb;
     Left := 94;
     Autosize := True;
     Name := prefijo_label + parametro;
     Caption := EmptyStr;
     Alignment := taRightJustify;
     Top := 18;
     Caption := DMLstListados.QFiltros.FieldByName('texto').AsString;
  end;
end;

procedure TFMLstListados.AddDE(gb: TGroupBox; mostrarLabel: boolean = False; desde: boolean = True);
var
  parametro : string;
  orden : integer;
  de : TLFDateEdit;
  lb : TLFLabel;
begin
  cDebug(_('Añadimos Date Edit'));
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;

  // Creamos el componente de DateEdit
  de := TLFDateEdit.Create(gb);
  with de do
  begin
     Parent := gb;
     Left := 104;
     Width := 121;
     if desde then
        Top := 14
     else
        Top := 42;
     Tag := orden;
     OnChange := CambiaDE;
     if desde then
        Name := prefijo_componentes + parametro + sufijo_desde
     else
        Name := prefijo_componentes + parametro + sufijo_hasta;
     if desde then
        Hint := parametro + sufijo_desde
     else
        Hint := parametro + sufijo_hasta;
     // cDebug('Creamos parametro '+Name+' con tag '+IntToStr(Tag));
  end;

  if mostrarLabel then
  begin
     lb := TLFLabel.Create(gb);
     with lb do
     begin
        Parent := gb;
        Left := 94;
        Autosize := True;
        if desde then
           Name := prefijo_label + parametro + sufijo_desde
        else
           Name := prefijo_label + parametro + sufijo_hasta;
        Caption := EmptyStr;
        Alignment := taRightJustify;
        if desde then
           Top := 18
        else
           Top := 38;
        if desde then
           Caption := _('Desde')
        else
           Caption := _('Hasta');
     end;
  end;
end;

procedure TFMLstListados.AddEF(gb: TGroupBox; MostrarLabel: boolean = False; Desde: boolean = True);
var
  parametro, tabla, campo_codigo, campo_titulo : string;
  orden : integer;
begin
  cDebug(_('Añadimos Desde Hasta EF'));
  tabla := DMLstListados.QFiltros.FieldByName('tabla').AsString;
  campo_codigo := DMLstListados.QFiltros.FieldByName('campo_codigo').AsString;
  campo_titulo := DMLstListados.QFiltros.FieldByName('campo_titulo').AsString;
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;

  // Creamos el componente de busqueda
  with TLFEditFind2000.Create(gb) do
  begin
     Parent := gb;
     Transaction := DMLstListados.TLocal;
     Base_de_datos := DMMain.Database;
     BuscarChars := True;
     BuscarNums := True;
     CampoNum := campo_codigo;
     CampoStr := campo_titulo;
     Tabla_a_buscar := tabla;
     if Desde then
        Name := prefijo_componentes + parametro + sufijo_desde
     else
        Name := prefijo_componentes + parametro + sufijo_hasta;
     Text := EmptyStr;
     SalirSiVacio := False;
     SalirSiNoExiste := False;
     Left := 104;
     Width := 81;
     if Desde then
        Top := 16
     else
        Top := 38;
     Tag := orden;
     OnBusqueda := BusquedaEF;
     OnChange := PonTitulo;
  end;

  // Creamos el componente titulo
  with TLFEdit.Create(gb) do
  begin
     Parent := gb;
     if Desde then
        Name := prefijo_componentes + parametro + sufijo_desde + sufijo_titulo
     else
        Name := prefijo_componentes + parametro + sufijo_hasta + sufijo_titulo;
     Text := EmptyStr;
     Left := 186;
     Width := 487;
     if Desde then
        Top := 16
     else
        Top := 38;
     TabStop := False;
     ReadOnly := True;
     Color := clInfoBk;
     Anchors := [akLeft, akTop, akRight];
  end;

  if MostrarLabel then
  begin
     with TLFLabel.Create(gb) do
     begin
        Parent := gb;
        Left := 94;
        Autosize := True;
        if Desde then
           Name := prefijo_label + parametro + sufijo_desde
        else
           Name := prefijo_label + parametro + sufijo_hasta;
        Caption := EmptyStr;
        Alignment := taRightJustify;
        if Desde then
           Top := 20
        else
           Top := 38;
        if Desde then
           Caption := _('Desde')
        else
           Caption := _('Hasta');
     end;
  end;
end;

procedure TFMLstListados.AddUnoSolo;
var
  // variables del desde hasta
  Orden : integer;
  Texto : string;
  Parametro : string;
  MostrarTitulo : boolean;
  CondicionBusqueda : string;
  // componentes necesarios
  gb : TGroupBox;
begin
  cDebug(_('Añadimos un solo valor'));
  // Cogemos valores
  Orden := DMLstListados.QFiltros.FieldByName('ORDEN').AsInteger;
  Texto := DMLstListados.QFiltros.FieldByName('TEXTO').AsString;
  Parametro := Trim(DMLstListados.QFiltros.FieldByName('PARAMETRO').AsString);
  MostrarTitulo := DMLstListados.QFiltros.FieldByName('MOSTRAR_TITULO').AsInteger = 1;
  CondicionBusqueda := DMLstListados.QFiltros.FieldByName('CONDICION_BUSQUEDA').AsString;

  gb := TGroupBox.Create(TSLimites);
  with gb do
  begin
     Parent := TSLimites;
     Height := 48;
     Align := ALTop;
     Tag := Orden;
     Caption := Texto;
     Name := prefijo_groupbox + Parametro;
  end;

  if MostrarTitulo then
  begin
     DMLstListados.AddFiltro(Orden, CondicionBusqueda);
     AddEF(gb);
  end;
end;

procedure TFMLstListados.AddDesdeHasta;
var
  // variables del desde hasta
  orden : integer;
  texto : string;
  parametro : string;
  mostrarTitulo : boolean;
  condicion_busqueda : string;
  // componentes necesarios
  gb : TGroupBox;
begin
  cDebug(_('Añadimos desde hasta'));
  // Cogemos valores
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;
  texto := DMLstListados.QFiltros.FieldByName('texto').AsString;
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);
  mostrarTitulo := DMLstListados.QFiltros.FieldByName('mostrar_titulo').AsInteger = 1;
  condicion_busqueda := DMLstListados.QFiltros.FieldByName('condicion_busqueda').AsString;

  gb := TGroupBox.Create(TSLimites);
  with gb do
  begin
     Parent := TSLimites;
     Height := 65;
     Align := ALTop;
     Tag := orden;
     Caption := texto;
     Name := prefijo_groupbox + parametro;
  end;

  if mostrarTitulo then
  begin
     DMLstListados.AddFiltro(orden, condicion_busqueda);
     AddEF(gb, True, True);
     AddEF(gb, True, False);
  end;
end;

procedure TFMLstListados.AddFecha;
var
  // variables del desde hasta
  orden : integer;
  texto : string;
  parametro : string;
  // componentes necesarios
  gb : TGroupBox;
begin
  cDebug(_('Añadimos Fecha'));
  // Cogemos valores
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;
  texto := DMLstListados.QFiltros.FieldByName('texto').AsString;
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);

  gb := TGroupBox.Create(TSLimites);
  with gb do
  begin
     Parent := TSLimites;
     Height := 43;
     Align := ALTop;
     Tag := orden;
     Caption := texto;
     Name := prefijo_groupbox + parametro;
  end;

  AddDE(gb, False, True);
end;

procedure TFMLstListados.AddTexto;
var
  // variables del desde hasta
  orden : integer;
  texto : string;
  parametro : string;
  //componentes necesarios
  gb : TGroupBox;
begin
  cDebug(_('Añadimos Check'));
  // Cogemos valores
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;
  texto := DMLstListados.QFiltros.FieldByName('texto').AsString;
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);

  gb := TGroupBox.Create(TSLimites);
  with gb do
  begin
     Parent := TSLimites;
     Height := 43;
     Align := ALTop;
     Tag := orden;
     Caption := texto;
     Name := prefijo_groupbox + parametro;
  end;

  AddTX(gb);
end;

procedure TFMLstListados.AddCheck;
var
  // variables del desde hasta
  orden : integer;
  texto : string;
  parametro : string;

  // componentes necesarios
  gb : TGroupBox;
begin
  cDebug(_('Añadimos Check'));
  // Cogemos valores
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;
  texto := DMLstListados.QFiltros.FieldByName('texto').AsString;
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);

  gb := TGroupBox.Create(TSLimites);
  with gb do
  begin
     Parent := TSLimites;
     Height := 43;
     Align := ALTop;
     Tag := orden;
     Caption := texto;
     Name := prefijo_groupbox + parametro;
  end;

  AddCH(gb);
end;

procedure TFMLstListados.AddDesdeHastaFecha;
var
  // variables del desde hasta
  orden : integer;
  texto : string;
  parametro : string;

  // componentes necesarios
  gb : TGroupBox;
begin
  cDebug(_('Añadimos desde hasta fecha'));
  // Cogemos valores
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;
  texto := DMLstListados.QFiltros.FieldByName('texto').AsString;
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);

  gb := TGroupBox.Create(TSLimites);
  with gb do
  begin
     Parent := TSLimites;
     Height := 65;
     Align := ALTop;
     Tag := orden;
     Caption := texto;
     Name := prefijo_groupbox + parametro;
  end;

  AddDE(gb, True, True);
  AddDE(gb, True, False);
end;

procedure TFMLstListados.AddLista;
var
  // variables del desde hasta
  orden : integer;
  texto : string;
  parametro : string;
  condicion_busqueda : string;

  // componentes necesarios
  gb : TGroupBox;
  lb : TListBox;
  btn : TButton;
begin
  cDebug(_('Añadimos lista de valores'));
  // Cogemos valores
  orden := DMLstListados.QFiltros.FieldByName('orden').AsInteger;
  texto := DMLstListados.QFiltros.FieldByName('texto').AsString;
  parametro := Trim(DMLstListados.QFiltros.FieldByName('parametro').AsString);
  condicion_busqueda := DMLstListados.QFiltros.FieldByName('condicion_busqueda').AsString;

  gb := TGroupBox.Create(TSLimites);
  with gb do
  begin
     Parent := TSLimites;
     Height := 144;
     Align := ALTop;
     Tag := orden;
     Caption := texto;
     Name := prefijo_groupbox + parametro;
  end;

  DMLstListados.AddFiltro(orden, condicion_busqueda);
  AddEF(gb, True);

  // Creamos el ListBox
  lb := TListBox.Create(gb);
  with lb do
  begin
     Parent := gb;
     Name := prefijo_componentes + parametro + sufijo_desde + sufijo_listbox;
     Items.Clear;
     Left := 104;
     Width := 427;
     Top := 40;
     TabStop := False;
     Anchors := [akLeft, akTop, akRight];
  end;

  btn := TButton.Create(gb);
  with btn do
  begin
     Parent := gb;
     Name := prefijo_componentes + parametro + sufijo_desde + sufijo_boton + '_aniadir';
     Left := 592;
     Width := 89;
     Tag := orden;
     Top := 40;
     TabStop := True;
     Anchors := [akTop, akRight];
     Caption := _('Añadir');
     OnClick := btnAniadir;
  end;

  btn := TButton.Create(gb);
  with btn do
  begin
     Parent := gb;
     Name := prefijo_componentes + parametro + sufijo_desde + sufijo_boton + '_eliminar';
     Left := 592;
     Width := 89;
     Top := 72;
     Tag := orden;
     TabStop := True;
     Anchors := [akTop, akRight];
     Caption := _('Eliminar');
     OnClick := btnEliminarClick;
  end;

  btn := TButton.Create(gb);
  with btn do
  begin
     Parent := gb;
     Name := prefijo_componentes + parametro + sufijo_desde + sufijo_boton + '_todos';
     Left := 592;
     Width := 89;
     Top := 104;
     Tag := orden;
     TabStop := True;
     Anchors := [akTop, akRight];
     Caption := _('Eliminar todos');
     OnClick := btnEliminarTodosClick;
  end;
end;

procedure TFMLstListados.AbreFiltros;
begin
  try
     DMLstListados.AbreFiltros;
     with DMLstListados.QFiltros do
     begin
        while not EOF do
        begin
           cDebug(Format(_('Procesando parametro "%s"'), [FieldByName('parametro').AsString]));
           case FieldByName('TIPO').AsInteger of
              0: // UN solo valor
                 AddUnoSolo;
              1: // Desde Hasta
                 AddDesdeHasta;
              2: // Lista
                 AddLista;
              3: // Desde Hasta Fecha
                 AddDesdeHastaFecha;
              4: // Desde Hasta Fecha
                 AddFecha;
              5: // Texto
                 AddTexto;
              6: // Check
                 AddCheck;
           end;
           Next;
        end;
     end;
  finally
     ActualizaFiltros;
  end;
end;

procedure TFMLstListados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstListados);
  slComponentes.Free;
  Action := caFree;
end;

procedure TFMLstListados.BusquedaEF(Sender: TObject);
begin
  inherited;
  TLFEditFind2000(Sender).CondicionBusqueda := DMLstListados.GetCondicionBusqueda(TLFEditFind2000(Sender).Tag);
  cDebug(_('Busqueda'));
  cDebug(Format(_('La condicion de busqueda ha sido %s'), [TLFEditFind2000(Sender).CondicionBusqueda]));
  if Desarrollo then
     ActualizaParametros;
end;

procedure TFMLstListados.PonTitulo(Sender: TObject);
var
  titulo : string;
  ed : TComponent;
begin
  inherited;
  cDebug(_('Ponemos titulo'));
  // Le ponemos el valor al parametro
  titulo := Copy(TLFEditFind2000(Sender).Name, Length(prefijo_componentes) + 1, Length(TLFEditFind2000(Sender).Name));

  DMLstListados.TomaValorParametro(titulo, TLFEditFind2000(Sender).Text);

  if TLFEditFind2000(Sender).Text <> EmptyStr then
     titulo := DMLstListados.DameTitulo(TLFEditFind2000(Sender))
  else
     titulo := EmptyStr;

  ed := TLFEditFind2000(Sender).Parent.FindComponent(TLFEditFind2000(Sender).Name + sufijo_titulo);
  if ed <> nil then
     TLFEdit(ed).Text := titulo;
end;

procedure TFMLstListados.RepasaLB;
var
  x, y : integer;
begin
  // PDTE
  Exit;
  with TSLimites do
     for x := 0 to ComponentCount - 1 do
        if Components[x] is TGroupBox then
           if TGroupBox(Components[x]).Visible then
              with TGroupBox(Components[x]) do
                 for y := 0 to ComponentCount - 1 do
                    if (Components[y].Tag > 0) and (Components[y] is TListBox) then
                       if TListBox((Components[y])).Items.Count = 0 then
                          raise Exception.Create(_('No hay ningun elemento seleccionado en la lista'));
end;

procedure TFMLstListados.ARecargarExecute(Sender: TObject);
var
  x, y : integer;
begin
  cDebug(_('Recargamos los desde/hasta'));

  inherited;

  // Creo los componentes para filtrar
  ACrearFiltrosExecute(Sender);

  // Se rellenan con valores por defecto
  with TSLimites do
     for x := 0 to ComponentCount - 1 do
        if Components[x] is TGroupBox then
        begin
           cDebug(Format(_('Encontramos %s'), [Components[x].Name]));
           if TGroupBox(Components[x]).Visible then
              with TGroupBox(Components[x]) do
              begin
                 //cDebug('Visible '+TSLimites.Components[x].Name);
                 for y := 0 to ComponentCount - 1 do
                 begin
                    //cDebug('Vemos '+Components[y].Name);
                    if (Components[y].Tag > 0) and (Components[y] is TLFEditFind2000) then
                    begin
                       cDebug(Format(_('Recargamos EF %s'), [Components[y].Name]));
                       DMLstListados.RecargaEF(TLFEditFind2000(Components[y]));
                    end;
                    if (Components[y].Tag > 0) and (Components[y] is TLFDateEdit) then
                    begin
                       DMLstListados.RecargaDE(TLFDateEdit((Components[y])));
                       cDebug(Format(_('Recargamos DE %s'), [Components[y].Name]));
                    end;
                    if (Components[y].Tag > 0) and (Components[y] is TLFEdit) then
                       TLFEdit((Components[y])).Text := EMptyStr;

                 end; // for y:=0 to Component
              end; // With GRoupBox
        end; // If Component is TGroupBox
end;

procedure TFMLstListados.ClickMenuListados(Sender: TObject);
var
  Nombre : string;
  Listado : integer;
begin
  inherited;
  with TMenuItem(Sender) do
  begin
     if (Tag > 0) then
     begin
        _listado := Tag;
        DMLstListados.CargaListado(Tag);
     end;
     if (Tag = -1) then
     begin
        Nombre := InputBox(_('Listado'), _('Nombre del Listado'), _('Nuevo Listado'));
        if (nombre <> EmptyStr) then
        begin
           Listado := DMLstListados.NuevoListadoCarga(Nombre);
           DMLstListados.CargaListado(Listado);
        end;
     end;
  end;
end;

procedure TFMLstListados.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLstListados.AbreDatasets;
  DMLstListados.Imprimir(False);
end;

procedure TFMLstListados.TButtPrevisualizarClick(Sender: TObject);
begin
  inherited;
  RepasaLB;
  DMLstListados.AbreDatasets;
  DMLstListados.Imprimir(True);
end;

procedure TFMLstListados.popUpListadosPopup(Sender: TObject);
var
  PopupItem, Listado : integer;
  aMenuItem : TMenuItem;
begin
  inherited;
  Listado := DMLstListados.DameListado;
  DMLstListados.MenuListados(popUPListados);
  for PopupItem := 0 to popUpListados.Items.Count - 1 do
  begin
     popUpListados.Items.Items[PopupItem].OnClick := ClickMenuListados;
     if (Listado = popUpListados.Items.Items[PopupItem].Tag) then
        popUpListados.Items.Items[PopupItem].Checked := True;
  end;

  if permitir_nuevo_listado then
  begin
     aMenuItem := TMenuItem.Create(popUPListados);
     aMenuItem.Caption := _('Nuevo Diseño');
     aMenuItem.OnClick := ClickMenuListados;
     aMenuItem.Tag := -1;
     popUPListados.Items.Add(aMenuItem);
  end;
end;

procedure TFMLstListados.CambiaDE(Sender: TObject);
var
  titulo : string;
  fecha : tDate;
begin
  inherited;
  // Le ponemos el valor al parametro
  titulo := TLFDateEdit(Sender).Hint;
  fecha := TLFDateEdit(Sender).Date;
  if TLFDateEdit(Sender).Top = 14 then
     fecha := HourIntoDate(fecha, '00:00:00')
  else
     fecha := HourIntoDate(fecha, '23:59:59');
  DMLstListados.TomaValorParametro(titulo, FormatDateTime('dd/mm/yyyy hh:nn:ss', fecha));
  cDebug(Format(_('la fecha ha cambiado "%s" a "%s"'), [titulo, DateToStr(fecha)]));
  if Desarrollo then
     ActualizaParametros;
end;

procedure TFMLstListados.AEstablecerPorDefectoExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Quiere establecer por defecto este listado?')) then
     DMLstListados.EstaBlecePorDefecto(DMLstListados.DameListado);
end;

procedure TFMLstListados.AEliminarExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Quiere eliminar el listado?')) then
     DMLstListados.Elimina(DMLstListados.DameListado);
end;

procedure TFMLstListados.BtnEliminarTodosClick(Sender: TObject);
var
  x : integer;
begin
  for x := 0 to TButton(Sender).Parent.ComponentCount - 1 do
     if TButton(Sender).Parent.Components[x] is tListBox then
     begin
        tListBox(TButton(Sender).Parent.Components[x]).Items.Clear;
        DMLstListados.ClearLB(TButton(Sender).Tag);
     end;
end;

function TFMLstListados.GetSelected(lb: tListBox): integer;
var
  x : integer;
begin
  Result := -1;
  for x := 0 to lb.Items.Count - 1 do
  begin
     if lb.Selected[x] then
     begin
        if Result < 0 then
           Result := x
        else
        begin
           Result := -1;
           Break;
        end;
     end;
  end;
end;

procedure TFMLstListados.BtnEliminarClick(Sender: TObject);
var
  x, y : integer;
begin
  for x := 0 to TButton(Sender).Parent.ComponentCount - 1 do
     if TButton(Sender).Parent.Components[x] is tListBox then
     begin
        y := GetSelected(tListBox(TButton(Sender).Parent.Components[x]));
        if y > -1 then
        begin
           DMLstListados.DeleteLB(TButton(Sender).Tag, y);
           tListBox(TButton(Sender).Parent.Components[x]).DeleteSelected;
        end;
     end;
end;

procedure TFMLstListados.BtnAniadir(Sender: TObject);
var
  x, y, z : integer;
  codigo, titulo : string;
  orden : integer;
begin
  for x := 0 to TButton(Sender).Parent.ComponentCount - 1 do
     if TButton(Sender).Parent.Components[x] is tListBox then
        for y := 0 to TButton(Sender).Parent.ComponentCount - 1 do
           if TButton(Sender).Parent.Components[y] is TLFEditFind2000 then
              if TLFEditFind2000(TButton(Sender).Parent.Components[y]).Text <> EmptyStr then
                 for z := 0 to TButton(Sender).Parent.ComponentCount - 1 do
                    if TButton(Sender).Parent.Components[z] is TLFEdit then
                    begin
                       codigo := TLFEditFind2000(TButton(Sender).Parent.Components[y]).Text;
                       titulo := TLFEdit(TButton(Sender).Parent.Components[z]).Text;
                       titulo := codigo + ' - ' + titulo;

                       if tListBox(TButton(Sender).Parent.Components[x]).Items.IndexOf(titulo) < 0 then
                       begin
                          orden := tListBox(TButton(Sender).Parent.Components[x]).Items.Add(titulo);
                          DMLstListados.AddLB(TButton(Sender).Tag, orden, codigo);
                       end;
                    end;
  cDebug(_('Añadimos a la lista'));
  if Desarrollo then
     ActualizaParametros;
end;

procedure TFMLstListados.FormShow(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSOpciones;
  PCMain.ActivePage := TSLimites;
end;

procedure TFMLstListados.CBOrdenChange(Sender: TObject);
begin
  inherited;
  DMLstListados.TomaOrden(TLFComboBox(Sender).ItemIndex);
  cDebug(_('Cambiamos Orden'));
  if Desarrollo then
     ActualizaOrdenes;
end;

procedure TFMLstListados.ActualizaParametros;
begin
  DMLstListados.Parametros(vleParametros);
end;

procedure TFMLstListados.ActualizaFiltros;
begin
  DMLstListados.Filtros(vleFiltros);
end;

procedure TFMLstListados.ActualizaOrdenes;
begin
  DMLstListados.Ordenes(vleOrdenes);
end;

procedure TFMLstListados.cDebug(cadena: string; proridad: integer = 0);
begin
  if Desarrollo then
     memLog.Lines.Add(cadena);
end;

procedure TFMLstListados.BMostrarConsultaYPrametrosClick(Sender: TObject);
begin
  inherited;
  DMLstListados.DatosSQL(memSQL, vleParamssql);
end;

procedure TFMLstListados.BAbreEdicionClick(Sender: TObject);
begin
  inherited;
  DMLstListados.AbreEdicion;
end;

procedure TFMLstListados.PCDebugChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if PCDebug.ActivePage = TSListado then
  begin
     if DMLStListados.QMEdicionListado.State in [dsEdit] then
     begin
        if ConfirmaMensaje(_('Grabamos cambios')) then
        begin
           DMLStListados.QMEdicionListado.Post;
           RecargaListado(_grupo, _listado);
        end
        else
           DMLStListados.QMEdicionListado.Cancel;
     end;
  end;
  DMLStListados.QMEdicionListado.Close;
end;

procedure TFMLstListados.BGuardaEdicionClick(Sender: TObject);
begin
  if DMLStListados.QMEdicionListado.State in [dsEdit] then
     DMLStListados.QMEdicionListado.Post;
  DMLStListados.QMEdicionListado.Close;
  RecargaListado(_grupo, _listado);
end;

procedure TFMLstListados.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if TDBGridFind2000(Sender).ColumnaActual = 'TABLA' then
  begin
     {       TDBGridFind2000(Sender).TablaABuscar:='RDB$RELATIONS';
       TDBGridFind2000(Sender).titu}
  end;
end;

procedure TFMLstListados.Limpiar1Click(Sender: TObject);
begin
  inherited;
  memLog.Clear;
end;

procedure TFMLstListados.CambiaCH(Sender: TObject);
var
  Titulo : string;
begin
  inherited;
  Titulo := TLFCheckBox(Sender).Hint;
  if TLFCheckBox(Sender).Checked then
     DMLstListados.TomaValorParametro(Titulo, '1')
  else
     DMLstListados.TomaValorParametro(Titulo, '0');
  cDebug(Format(_('El Check ha cambiado "%s"'), [Titulo]));
  if Desarrollo then
     ActualizaParametros;
end;

procedure TFMLstListados.CambiaTX(Sender: TObject);
var
  titulo : string;
begin
  inherited;
  titulo := TLFEdit(Sender).Hint;
  DMLstListados.TomaValorParametro(titulo, TLFEdit(Sender).Text);
  cDebug(Format(_('El Edit ha cambiado "%s" a "%s"'), [titulo, TLFEdit(Sender).Text]));
  if Desarrollo then
     ActualizaParametros;
end;

procedure TFMLstListados.PCDebugChange(Sender: TObject);
begin
  inherited;
  if PCDebug.ActivePage = tsParametros then
     ActualizaParametros;
end;

procedure TFMLstListados.BTestearListadoClick(Sender: TObject);
begin
  inherited;
  DMLstListados.AbreDataSets;
end;

procedure TFMLstListados.AExportarListadoHTMLExecute(Sender: TObject);
var
  hInf : tLstHTML;
begin
  inherited;
  DMLstListados.AbreDatasets;
  hInf := tLstHTML.Create(DMLstListados.DameNombreListado);
  try
     hInf.GeneraInforme(DMLstListados.DSQMListado);
     hInf.LanzaInforme(0);
  finally
     hInf.Free;
  end;
end;

procedure TFMLstListados.ACrearFiltrosExecute(Sender: TObject);
begin
  inherited;
  LimpiaComponentes;
  cDebug(_('Abriendo Filtros'));
  AbreFiltros;
  RepasaTabOrder;
  // crea referencia circular ARecargar.Execute;
end;

procedure TFMLstListados.ALimpiarFiltrosExecute(Sender: TObject);
begin
  inherited;
  // LimpiarFiltros
  LimpiaComponentes;
end;

procedure TFMLstListados.AExportarConfiguracionListadoExecute(Sender: TObject);
var
  Archivo, fichero_zip, temporal_raiz, temporal : string;
  Grupo, Listado : string;
  DirectorioTemporal : string;
begin
  inherited;
  /// Exporta la configuracion de listado
  /// Genera un ZIP con listado + sql +

  DirectorioTemporal := DameTempPath;
  temporal := DirectorioTemporal + 'listados_nil';
  temporal_raiz := temporal;
  Grupo := DMLstListados.DameNombreGrupo;
  Listado := DMLstListados.DameNombreListado;
  if DIrectoryExists(temporal) then
     if not DelTree(temporal) then
     begin
        ShowMessage(Format(_('No se ha podido borrar el directorio temporal %s'), [temporal]));
        Exit;
     end;

  CreateDir(temporal);
  temporal := temporal + '\' + Grupo + '\';
  CreateDir(temporal);
  temporal := temporal + Listado + '\';
  CreateDir(temporal);
  // Creamos la estructura en el directorio
  DMLstListados.GuardaListado(temporal);
  fichero_zip := 'exportacion.zip';

  with TSaveDialog.Create(Self) do
  begin
     try
        InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, True);
        FileName := Trim(DBETituloListado.Text) + '.nls';
        Filter := _('Listados Personalizados|*.nls');
        DefaultExt := '*.nls';

        if (Execute) then
           Archivo := FileName;
     finally
        Free;
     end;
  end;

  if (Archivo > '') then
  begin
     AbZipper1.BaseDirectory := temporal_raiz;
     AbZipper1.FileName := temporal_raiz + '\' + fichero_zip;
     AbZipper1.TempDirectory := DirectorioTemporal;
     ABZipper1.Logging := False;
     ABZipper1.AddFiles('*.*', 0);
     ABZipper1.Save;
     ABZIpper1.CloseArchive;

     if FileExists(Archivo) then
        DeleteFile(Archivo);

     CopyFile(PChar(temporal_raiz + '\' + fichero_zip), PChar(Archivo), False);
  end;

  // ShellExecute(Handle, 'open', PChar(temporal_raiz), nil, nil, SW_SHOWNORMAL);
  // DMMain.AbrirArchivo(Trim(temporal_raiz));
end;

procedure TFMLstListados.AConfigurarExecute(Sender: TObject);
begin
  RepasaLB;
  DMLstListados.DiseniaListado(_listado);

  // inherited;
end;

end.
