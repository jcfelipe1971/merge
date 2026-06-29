unit UFMDatosLibro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ULFComboBox, ULFEdit, ULFPanel, UFormGest,
  ULFMemo, CheckLst, Mask, rxToolEdit, ComCtrls, ULFPageControl,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFDateEdit, StrUtils, ToolWin, ULFToolBar, UHYDirectoryDialog, ULFLabel,
  ActnList, ULFActionList, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMDatosLibro = class(TG2KForm)
     PMain: TLFPanel;
     PCMain: TLFPageControl;
     TSEmpresario: TTabSheet;
     TSLibros: TTabSheet;
     PnlLibros: TLFPanel;
     LTipo: TLFLabel;
     LFormato: TLFLabel;
     LFichero: TLFLabel;
     LNombre: TLFLabel;
     LNroLibro: TLFLabel;
     LFechaApertura: TLFLabel;
     LFechaCierre: TLFLabel;
     LListaLibros: TLFLabel;
     LNombreDirectorio: TLFLabel;
     LDescripcionLeg: TLFLabel;
     EdtNomFichero: TLFEdit;
     EdtNomLibro: TLFEdit;
     EdtNumLibro: TLFEdit;
     CmbBxTipo: TLFComboBox;
     CmbBxFormato: TLFComboBox;
     BtnBuscar: TButton;
     CmbBxNomTipo: TLFComboBox;
     CmbBxNomFormato: TLFComboBox;
     LstBxLista: TListBox;
     EdtNomDirec: TLFEdit;
     EdtDescrip: TLFEdit;
     PnlBtn: TLFPanel;
     BtnLimpiar: TButton;
     BtnInsertar: TButton;
     BtnEliminar: TButton;
     BtnTerminar: TButton;
     DEApertura: TLFDateEdit;
     DECierre: TLFDateEdit;
     BtnBuscarDir: TButton;
     PnlEmpresario: TLFPanel;
     GBEmpresario: TGroupBox;
     LNombreEmpresario: TLFLabel;
     LApellidosEmpresario: TLFLabel;
     LNIFEmpresario: TLFLabel;
     LCodigoPostalEmpresario: TLFLabel;
     LDomicilioEmpresario: TLFLabel;
     LCiudadEmpresario: TLFLabel;
     LFaxEmpresario: TLFLabel;
     LTelefonoEmpresario: TLFLabel;
     EdtNomE: TLFEdit;
     EdtApe1E: TLFEdit;
     EdtApe2E: TLFEdit;
     EdtCpE: TLFEdit;
     EdtNifE: TLFEdit;
     EdtDomiciE: TLFEdit;
     EdtFaxE: TLFEdit;
     EdtTlfE: TLFEdit;
     EdtCiudadE: TLFEdit;
     GPRepresentante: TGroupBox;
     LNombreRepresentante: TLFLabel;
     LApellidoRepresentante: TLFLabel;
     LNIFRepresentante: TLFLabel;
     LCodigoPostalRepresentante: TLFLabel;
     LDomicilioRepresentante: TLFLabel;
     LCiudadRepresentante: TLFLabel;
     LFaxRepresentante: TLFLabel;
     LTelefonoRepresentante: TLFLabel;
     EdtNomR: TLFEdit;
     EdtApe1R: TLFEdit;
     EdtApe2R: TLFEdit;
     EdtCpR: TLFEdit;
     EdtDniR: TLFEdit;
     EdtDomiciR: TLFEdit;
     EdtFaxR: TLFEdit;
     EdtTlfR: TLFEdit;
     EdtCiudadR: TLFEdit;
     TBMain: TLFToolBar;
     TButtVerificar: TToolButton;
     TButtSalir: TToolButton;
     ALMain: TLFActionList;
     ASalir: TAction;
     AVerificarDatos: TAction;
     LProvinciaEmpresario: TLFLabel;
     EdtProvinE: TLFEdit;
     EdtProvinR: TLFEdit;
     LProvinciaRepresentante: TLFLabel;
     GPRegistro: TGroupBox;
     LRegistroMercantil: TLFLabel;
     LTomo: TLFLabel;
     LFolio: TLFLabel;
     LLibro: TLFLabel;
     LOtros: TLFLabel;
     LHojaRegistro: TLFLabel;
     LTipoRegPublic: TLFLabel;
     LTotalLibro: TLFLabel;
     LSeccion: TLFLabel;
     LFechaSolicitud: TLFLabel;
     EdtRegistro: TLFEdit;
     EdtTomo: TLFEdit;
     EdtFolio: TLFEdit;
     EdtLibro: TLFEdit;
     EdtSeccion: TLFEdit;
     EdtOtros: TLFEdit;
     EdtHoja: TLFEdit;
     EdtTipoRegis: TLFEdit;
     EdtTotal: TLFEdit;
     RGRetencion: TRadioGroup;
     DEFechaSolicitud: TLFDateEdit;
     TSExtracciones: TTabSheet;
     PNLExtracciones: TLFPanel;
     BCarpetaExtraccion: TButton;
     ECarpetaExtraccion: TLFEdit;
     LCarpetaExtraccion: TLFLabel;
     CBSumasYSaldosMensuales: TLFCheckBox;
     CBMayorContable: TLFCheckBox;
     CBDiarioContable: TLFCheckBox;
     LEExtension: TLFLabel;
     CBExtension: TLFComboBox;
     CBDiarioContableCSV: TLFCheckBox;
     CBMayorContableCSV: TLFCheckBox;
     CBMayorContableCSV_6_7: TLFCheckBox;
     CBMayorContableCSV_52: TLFCheckBox;
     CBMayorContableCSV_570: TLFCheckBox;
     CBMayorContableCSV_572: TLFCheckBox;
     CBBalanceCierre: TLFCheckBox;
     CBBalancePerdidasYGanancias: TLFCheckBox;
     AExportar: TAction;
     TBExportar: TToolButton;
     procedure BtnBuscarClick(Sender: TObject);
     procedure CmbBxTipoChange(Sender: TObject);
     procedure CmbBxFormatoChange(Sender: TObject);
     procedure BtnInsertarClick(Sender: TObject);
     procedure EdtNumLibroExit(Sender: TObject);
     procedure BtnLimpiarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BtnEliminarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure BtnBuscarDirClick(Sender: TObject);
     procedure BtnTerminarClick(Sender: TObject);
     procedure EdtNomDirecExit(Sender: TObject);
     procedure DEAperturaExit(Sender: TObject);
     procedure DECierreExit(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure AVerificarDatosExecute(Sender: TObject);
     procedure BCarpetaExtraccionClick(Sender: TObject);
     procedure ECarpetaExtraccionChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure CBExtensionChange(Sender: TObject);
     procedure ECarpetaExtraccionExit(Sender: TObject);
     procedure AExportarExecute(Sender: TObject);
  private
     { Private declarations }
     function verificar_datos(): boolean;
  public
     { Public declarations }
     fecha_apertura, fecha_cierre: string;
     procedure Limpiar();
     function comprobar_datos_libro(): boolean;
     procedure crear_directorio();
     procedure crear_descrip(descripcion: string);
     procedure crear_nombres();
     procedure crear_datos();
     procedure DatosDefecto();
     procedure EscribeNuevaRuta(ruta_nueva: string);
  end;

var
  FMDatosLibro : TFMDatosLibro;

implementation

uses UDMMain, UEntorno, UDMRLibroDiarioConta, UUtiles, UFMain,
  UFPregSumasYSaldos, UFPregMayor, UDMRMayor, UFMCuAnuales;

{$R *.dfm}

procedure TFMDatosLibro.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  DatosDefecto();
  PCMain.ActivePage := TSExtracciones;
  TSLibros.TabVisible := False;
  TSEmpresario.TabVisible := False;
  TButtVerificar.Visible := False;

  ECarpetaExtraccion.Text := IncludeTrailingPathDelimiter(LeeDatoIni('DatosLibros', 'UltimaRutaFicheroExportacion', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  CBExtension.ItemIndex := LeeDatoIni('DatosLibros', 'UltimaIdExtensionFicheroExportacion', 0);
  CBExtension.Text := CBExtension.Items[CBExtension.ItemIndex];

  CBSumasYSaldosMensuales.Checked := LeeDatoIni('DatosLibros', 'CBSumasYSaldosMensuales', CBSumasYSaldosMensuales.Checked);
  CBMayorContable.Checked := LeeDatoIni('DatosLibros', 'CBMayorContable', CBMayorContable.Checked);
  CBDiarioContable.Checked := LeeDatoIni('DatosLibros', 'CBDiarioContable', CBDiarioContable.Checked);
  CBDiarioContableCSV.Checked := LeeDatoIni('DatosLibros', 'CBDiarioContableCSV', CBDiarioContableCSV.Checked);
  CBMayorContableCSV.Checked := LeeDatoIni('DatosLibros', 'CBMayorContableCSV', CBMayorContableCSV.Checked);
  CBMayorContableCSV_6_7.Checked := LeeDatoIni('DatosLibros', 'CBMayorContableCSV_6_7', CBMayorContableCSV_6_7.Checked);
  CBMayorContableCSV_52.Checked := LeeDatoIni('DatosLibros', 'CBMayorContableCSV_52', CBMayorContableCSV_52.Checked);
  CBMayorContableCSV_570.Checked := LeeDatoIni('DatosLibros', 'CBMayorContableCSV_570', CBMayorContableCSV_570.Checked);
  CBMayorContableCSV_572.Checked := LeeDatoIni('DatosLibros', 'CBMayorContableCSV_572', CBMayorContableCSV_572.Checked);
  CBBalanceCierre.Checked := LeeDatoIni('DatosLibros', 'CBBalanceCierre', CBBalanceCierre.Checked);
  CBBalancePerdidasYGanancias.Checked := LeeDatoIni('DatosLibros', 'CBBalancePerdidasYGanancias', CBBalancePerdidasYGanancias.Checked);
end;

procedure TFMDatosLibro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EscribeDatoIni('DatosLibros', 'CBSumasYSaldosMensuales', CBSumasYSaldosMensuales.Checked);
  EscribeDatoIni('DatosLibros', 'CBMayorContable', CBMayorContable.Checked);
  EscribeDatoIni('DatosLibros', 'CBDiarioContable', CBDiarioContable.Checked);
  EscribeDatoIni('DatosLibros', 'CBDiarioContableCSV', CBDiarioContableCSV.Checked);
  EscribeDatoIni('DatosLibros', 'CBMayorContableCSV', CBMayorContableCSV.Checked);
  EscribeDatoIni('DatosLibros', 'CBMayorContableCSV_6_7', CBMayorContableCSV_6_7.Checked);
  EscribeDatoIni('DatosLibros', 'CBMayorContableCSV_52', CBMayorContableCSV_52.Checked);
  EscribeDatoIni('DatosLibros', 'CBMayorContableCSV_570', CBMayorContableCSV_570.Checked);
  EscribeDatoIni('DatosLibros', 'CBMayorContableCSV_572', CBMayorContableCSV_572.Checked);
  EscribeDatoIni('DatosLibros', 'CBBalanceCierre', CBBalanceCierre.Checked);
  EscribeDatoIni('DatosLibros', 'CBBalancePerdidasYGanancias', CBBalancePerdidasYGanancias.Checked);

  LstBxLista.Clear;
  Action := caFree;
end;

procedure TFMDatosLibro.FormShow(Sender: TObject);
begin
  CBExtension.Text := CBExtension.Items[CBExtension.ItemIndex];
end;

procedure TFMDatosLibro.BtnBuscarClick(Sender: TObject);
var
  Archivo : string;
begin
  Archivo := '';
  if MyOpenDialog(Archivo, 'XLS,ODS', '', 'FMDatosLibro-Buscar') then
     EdtNomFichero.Text := Archivo;
end;

procedure TFMDatosLibro.BtnBuscarDirClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  // Si el directorio escogido no existe se crea

  Directorio := ExcludeTrailingPathDelimiter(EdtNomDirec.Text);
  if MySelectDirectory(Directorio, 'FMDatosLibro-NomDirec') then
     EdtNomDirec.Text := IncludeTrailingPathDelimiter(Directorio);

  EscribeNuevaRuta(EdtNomDirec.Text);
end;

procedure TFMDatosLibro.CmbBxTipoChange(Sender: TObject);
begin
  CmbBxNomTipo.ItemIndex := CmbBxTipo.ItemIndex;
end;

procedure TFMDatosLibro.CmbBxFormatoChange(Sender: TObject);
begin
  CmbBxNomFormato.ItemIndex := CmbBxFormato.ItemIndex;
end;

procedure TFMDatosLibro.BtnInsertarClick(Sender: TObject);
var
  nom_ext : string;  // nom_ext es el nombre del fichero destino con el numero de libro y la extension
  errorcode : DWord;
  ErrorMessage : pointer;
begin
  // Poner la fecha sin barras
  fecha_apertura := FormatDateTime('ddmmyyyy', DEApertura.Date);
  fecha_cierre := FormatDateTime('ddmmyyyy', DECierre.Date);

  if comprobar_datos_libro then // Si son correctos los datos, inserta
  begin
     nom_ext := CmbBxNomTipo.Text + '_' + EdtNumLibro.Text + '.' + CmbBxNomFormato.Text;

     // con el nombre d arriba poner el fichero xls dentro del directorio especificado
     // si pilla el mismo xls machaca pero no pone en datos ni en nombres el fichero 2 veces como en legalia
     if not CopyFile(PChar(Trim(EdtNomFichero.Text)),
        PChar(REntorno.RutaLibros + '\' + nom_ext), False) then
     begin
        // para obtener informacion de un error GetLastError
        errorcode := GetLastError;
        FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM, nil,
           errorcode, 0, @ErrorMessage, 0, nil);
        ShowMessage(PChar(errormessage));
     end
     else
     begin
        LstBxLista.Items.Add(nom_ext + '|' + EdtNomLibro.Text + '|' +
           EdtNumLibro.Text + '|' + fecha_apertura + '|' + fecha_cierre);

        // crea el directorio DIARIO donde se guardaran todos los libros de cada asiento en la ruta especificada
        crear_directorio();
        // inserta uno de los ficheros de texto llamado DESC.TXT con la descripcion en la carpeta anterior
        crear_descrip(UpperCase(EdtDescrip.Text));
     end;

     Limpiar();
  end
  else
  begin
     EdtNomDirec.SetFocus;
  end;
end;

procedure TFMDatosLibro.EdtNumLibroExit(Sender: TObject);
begin
  EdtNumLibro.Text := Ajusta(EdtNumLibro.Text, 'I', 3, '0');
end;

procedure TFMDatosLibro.BtnLimpiarClick(Sender: TObject);
begin
  Limpiar();
end;

procedure TFMDatosLibro.Limpiar();
begin
  EdtNomFichero.Text := '';
  EdtNomLibro.Text := '';
  EdtNumLibro.Text := '';
  DEApertura.Date := REntorno.FechaTrab;
  DECierre.Date := REntorno.FechaTrab;
end;

function TFMDatosLibro.comprobar_datos_libro(): boolean;
begin
  if (EdtNomDirec.Text = '') or (EdtDescrip.Text = '') or (EdtNomFichero.Text = '') or
     (EdtNomLibro.Text = '') or (EdtNumLibro.Text = '') or (DEApertura.Text = '') or (DECierre.Text = '') then
  begin
     ShowMessage('Datos incompletos.' + #13#10 + 'Compruebe que los datos son correctos.');
     Result := False;
  end
  else
  begin
     Result := True;
  end;
end;

procedure TFMDatosLibro.DEAperturaExit(Sender: TObject);
begin
  // poner la fecha sin barras
  fecha_apertura := FormatDateTime('ddmmyyyy', DEApertura.Date);
end;

procedure TFMDatosLibro.DECierreExit(Sender: TObject);
begin
  // poner la fecha sin barras
  fecha_cierre := FormatDateTime('ddmmyyyy', DECierre.Date);
end;

procedure TFMDatosLibro.crear_descrip(descripcion: string);
var
  NFic : TextFile; // Fichero
begin
  try
     // nombre del fichero
     AssignFile(NFic, REntorno.RutaLibros + '\DESC.TXT');
     // inicializamos el fichero
     {$I+}
     Rewrite(Nfic);
     {$I-}
     // escribimos la descripcion en él
     Write(NFic, descripcion);
     // cerramos el fichero
     CloseFile(NFic);
  except
     ShowMessage('Imposible abrir el fichero.');
  end;
end;

procedure TFMDatosLibro.crear_directorio();
begin
  // Crea el directorio sino existe.
  if not DirectoryExists(REntorno.RutaLibros) then
     if not CreateDir(REntorno.RutaLibros) then
        raise Exception.Create('Cannot create ' + REntorno.RutaLibros);
end;

procedure TFMDatosLibro.BtnEliminarClick(Sender: TObject);
var
  fichero_lista : string;
  errorcode : DWord;
  ErrorMessage : pointer;
  posicion, i : integer;
begin
  if (LstBxLista.SelCount > 0) then
  begin
     for i := 0 to LstBxLista.Items.Count - 1 do
     begin
        if LstBxLista.Selected[i] then
        begin
           fichero_lista := LstBxLista.Items.Strings[i];//LstBxLista.Items.Text;
           posicion := Pos('|', fichero_lista);
           fichero_lista := Copy(fichero_lista, 0, posicion - 1);
           //borra los ficheros seleccionados en la lista
           if not DeleteFile(PChar(Trim(REntorno.RutaLibros + '\' + fichero_lista))) then
              ShowMessage('No hay ningún libro seleccionado.');
        end;
     end;
     LstBxLista.DeleteSelected;
  end
  else
  begin
     // Para obtener informacion de un error GetLastError
     errorcode := GetLastError;
     FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM, nil, errorcode, 0, @ErrorMessage, 0, nil);
     ShowMessage(PChar(errormessage));
  end;
end;

procedure TFMDatosLibro.crear_nombres();
var
  NFic : TextFile; // Fichero
  nom_fichero : string;
  posicion, i : integer;
begin
  // Nombre del fichero
  AssignFile(NFic, REntorno.RutaLibros + '\NOMBRES.TXT');
  // Inicializamos el fichero
  {$I+}
  Rewrite(Nfic);
  {$I-}

  // Extrae el nombre del fichero xls
  for i := 0 to (LstBxLista.Items.Count - 1) do
  begin
     //obtenemos el nombre del archivo xls
     nom_fichero := LstBxLista.Items.Strings[i];
     posicion := Pos('|', nom_fichero);
     nom_fichero := Copy(nom_fichero, 0, posicion - 1);

     // Escribimos los nombres de los archivos xls en NOMBRES.TXT
     WriteLn(NFic, nom_fichero);
  end;
  // Cerramos el fichero
  CloseFile(NFic);
end;

procedure TFMDatosLibro.BtnTerminarClick(Sender: TObject);
begin
  try
     // Crea el archivo de texto NOMBRES, con los nombres de los ficheros de excel
     crear_nombres();

     // Crea el archivo de texto DATOS, con los datos de la empresa
     crear_datos();

     ShowMessage(_('Proceso terminado correctamente.'));
  except
     ShowMessage(_('Proceso no terminado correctamente.'));
  end;
end;

procedure TFMDatosLibro.crear_datos();
var
  NFic, fichero : TextFile; // Fichero
  {nom_fichero,} linea, descripcion, n_libro, num_libro, cod_prov : string;
  linea_fic, dos_fechas, fecha_apert, fecha_cierr : string;
  posicion, i, aux_libros, i_libro, tope : integer;
  // fecha_a, fecha_c : TDateTime;
begin
  aux_libros := 0;
  // Compruebo que los valores requeridos no sean '' mediante la funcion verificar_datos
  if verificar_datos then
  begin
     // Nombre del fichero
     AssignFile(NFic, REntorno.RutaLibros + '\DATOS.TXT');

     // Inicializamos el fichero
     {$I+}
     Rewrite(Nfic);
     {$I-}

     // Introducimos los datos de la empresa
     if EdtRegistro.Text <> '' then
        WriteLn(NFic, '100' + EdtRegistro.Text);
     if DEFechaSolicitud.Text <> '' then
        WriteLn(NFic, '101' + FormatDateTime('ddmmyyyy', DEFechaSolicitud.Date));
     if EdtNomE.Text <> '' then
        WriteLn(NFic, '102' + EdtNomE.Text);
     if EdtApe1E.Text <> '' then
        WriteLn(NFic, '103' + EdtApe1E.Text);
     if EdtApe2E.Text <> '' then
        WriteLn(NFic, '104' + EdtApe2E.Text);
     if EdtNifE.Text <> '' then
        WriteLn(NFic, '105' + EdtNifE.Text);
     // sin c/ etc
     if EdtDomiciE.Text <> '' then
        WriteLn(NFic, '106' + EdtDomiciE.Text);
     if EdtCiudadE.Text <> '' then
        WriteLn(NFic, '107' + EdtCiudadE.Text);
     if EdtCpE.Text <> '' then
        WriteLn(NFic, '108' + EdtCpE.Text);
     if EdtCpE.Text <> '' then
     begin
        // Extraigo el codigo de la provincia del cod postal
        cod_prov := Copy(EdtCpE.Text, 1, 2);
        WriteLn(NFic, '109' + cod_prov);
     end;
     if EdtFaxE.Text <> '' then
        WriteLn(NFic, '110' + EdtFaxE.Text);
     if EdtTlfE.Text <> '' then
        WriteLn(NFic, '111' + EdtTlfE.Text);
     if EdtTomo.Text <> '' then
        WriteLn(NFic, '201' + EdtTomo.Text);
     if EdtLibro.Text <> '' then
        WriteLn(NFic, '202' + EdtLibro.Text);
     if EdtSeccion.Text <> '' then
        WriteLn(NFic, '203' + EdtSeccion.Text);
     if EdtFolio.Text <> '' then
        WriteLn(NFic, '204' + EdtFolio.Text);
     if EdtTiporegis.Text <> '' then
        WriteLn(NFic, '205' + EdtTiporegis.Text);
     if EdtHoja.Text <> '' then
        WriteLn(NFic, '206' + EdtHoja.Text);
     if EdtOtros.Text <> '' then
        WriteLn(NFic, '207' + EdtOtros.Text);
     if EdtNomR.Text <> '' then
        WriteLn(NFic, '301' + EdtNomR.Text);
     if EdtApe1R.Text <> '' then
        WriteLn(NFic, '302' + EdtApe1R.Text);
     if EdtApe2R.Text <> '' then
        WriteLn(NFic, '303' + EdtApe2R.Text);
     if EdtDniR.Text <> '' then
        WriteLn(NFic, '304' + EdtDniR.Text);
     // sin c/ etc
     if EdtDomiciR.Text <> '' then
        WriteLn(NFic, '305' + EdtDomiciR.Text);
     if EdtCiudadR.Text <> '' then
        WriteLn(NFic, '306' + EdtCiudadR.Text);
     if EdtCpR.Text <> '' then
        WriteLn(NFic, '307' + EdtCpR.Text);
     if EdtCpR.Text <> '' then
     begin
        // Extraer el codigo de la provincia del cod postal
        cod_prov := '';
        cod_prov := Copy(EdtCpR.Text, 1, 2);
        WriteLn(NFic, '308' + cod_prov);
     end;
     if EdtFaxR.Text <> '' then
        WriteLn(NFic, '309' + EdtFaxR.Text);
     if EdtTlfR.Text <> '' then
        WriteLn(NFic, '310' + EdtTlfR.Text);
     if (RGRetencion.ItemIndex = 0) then
        WriteLn(NFic, '401SI')
     else
        WriteLn(NFic, '401NO');
     if EdtTotal.Text = '' then
        WriteLn(NFic, '501' + '0')
     else
        WriteLn(NFic, '501' + EdtTotal.Text);

     // Leemos la descripcion del fichero DESC.TXT
     AssignFile(fichero, REntorno.RutaLibros + '\DESC.TXT');
     Reset(fichero);
     Read(fichero, descripcion);
     CloseFile(fichero);
     descripcion := Copy(descripcion, 0, 32);
     // Leemos los numeros de los libros q estan en el fichero
     AssignFile(fichero, REntorno.RutaLibros + '\NOMBRES.TXT');
     Reset(fichero);
     // xa cada libro...
     for i := 0 to LstBxLista.Items.Count - 1 do
     begin
        n_libro := '';
        ReadLn(fichero, linea);
        num_libro := Copy(linea, 8, 3);
        aux_libros := aux_libros + 1;
        if (aux_libros >= 1) and (aux_libros <= 135) then
        begin
           n_libro := IntToStr(aux_libros);
           tope := Length(n_libro);
           for i_libro := tope to 2 do
           begin
              n_libro := '0' + n_libro;
           end;
        end;
        // Extraer fecha de apertura y cierre
        linea_fic := LstBxLista.Items.Strings[i];
        dos_fechas := RightStr(linea_fic, 17);
        posicion := Pos('|', dos_fechas);
        fecha_apert := Copy(dos_fechas, 0, posicion - 1);
        fecha_cierr := Copy(dos_fechas, posicion + 1, Length(dos_fechas));
        // Escribimos en el fichero DATOS
        WriteLn(NFic, n_libro + '01' + descripcion);
        WriteLn(NFic, n_libro + '02' + num_libro);
        WriteLn(NFic, n_libro + '03' + fecha_apert);
        WriteLn(NFic, n_libro + '04' + fecha_cierr);
     end;
     CloseFile(fichero);
     // fin xa cada libro...

     // Cerramos el fichero
     CloseFile(NFic);
  end;
  {
  else
  begin
    ShowMessage('Faltan datos obligatorios.');
    PCMain.ActivePageIndex := 0;
    EdtNomE.SetFocus;
  end;
  }
end;

procedure TFMDatosLibro.EdtNomDirecExit(Sender: TObject);
begin
  EscribeNuevaRuta(EdtNomDirec.Text);
end;

procedure TFMDatosLibro.DatosDefecto();
begin
  { TODO : Este dato deberia sacarse de la empresa (Provincia?) }
  EdtRegistro.Text := REntorno.PobEmpresa;
  { TODO : Este dato deberia sacarse de la empresa (Reg. Mercantil) }
  EdtTipoRegis.Text := 'REGISTRO MERCANTIL';
  DEFechaSolicitud.Date := REntorno.FechaTrab;
  DEApertura.Date := REntorno.FechaTrab;
  DECierre.Date := REntorno.FechaTrab;

  if (REntorno.RutaLibros = '') then
  begin
     REntorno.RutaLibros := GetSpecialFolderPath(CSIDL_PERSONAL, True) + 'Libros';
     EscribeIni;
  end
  else
  begin
     EdtNomDirec.Text := REntorno.RutaLibros;
  end;
end;

procedure TFMDatosLibro.EscribeNuevaRuta(ruta_nueva: string);
begin
  if (ruta_nueva <> '') then
     if not DirectoryExists(ruta_nueva) then
        if not CreateDir(ruta_nueva) then
           raise Exception.Create(Format(_('No se puede crear %s'), [ruta_nueva]));

  // Escribimos en el ini si escribe la ruta directamente.
  // Si abre el opendialog tambien la graba
  REntorno.RutaLibros := ruta_nueva;
  EscribeIni;
end;

procedure TFMDatosLibro.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMDatosLibro.AVerificarDatosExecute(Sender: TObject);
begin
  PCMain.ActivePage := TSEmpresario;
  if verificar_datos() then
     ShowMessage(_('Datos introducidos correctamente.'));
end;

function TFMDatosLibro.verificar_datos(): boolean;
begin
  if (EdtNomE.Text = '') or (EdtApe1E.Text = '') or (EdtApe2E.Text = '') or (EdtNifE.Text = '') or
     (EdtDomiciE.Text = '') or (EdtCiudadE.Text = '') or (EdtProvinE.Text = '') or (DEFechaSolicitud.Text = '') then
  begin
     ShowMessage(_('Datos de la Identificación del Empresario incompletos.') + #13#10 + _('Compruebe que los datos son correctos.'));
     EdtNomE.SetFocus;
     Result := False;
  end
  else
  if (EdtTomo.Text = '') or (EdtFolio.Text = '') or (EdtHoja.Text = '') or (EdtRegistro.Text = '') or
     (DEFechaSolicitud.Text = '') then
  begin
     ShowMessage(_('Datos Registrales incompletos.') + #13#10 + ('Compruebe que los datos son correctos.'));
     DEFechaSolicitud.SetFocus;
     Result := False;
  end
  else
  begin
     Result := True;
  end;
end;

procedure TFMDatosLibro.BCarpetaExtraccionClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := ExcludeTrailingPathDelimiter(ECarpetaExtraccion.Text);
  if MySelectDirectory(Directorio, 'FMDatosLibro-CarpetaExtraccion') then
     ECarpetaExtraccion.Text := IncludeTrailingPathDelimiter(Directorio);
end;

procedure TFMDatosLibro.AExportarExecute(Sender: TObject);
var
  Extension : string;
  Archivo : string;
  sl : TStrings;
begin
  TBMain.Enabled := False;
  try
     Extension := 'ODS';
     case CBExtension.ItemIndex of
        0: Extension := 'XLS';
        1: Extension := 'ODS';
     end;

     if CBSumasYSaldosMensuales.Checked then
     begin
        CBSumasYSaldosMensuales.Color := clLime;
        Application.ProcessMessages;
        try
           FMain.EjecutaAccion(FMain.AContaSumYSaldos);
           FPregSumasYSaldos.ExportarBalancesMensuales(ECarpetaExtraccion.Text, Extension);
           FPregSumasYSaldos.Close;
        finally
           CBSumasYSaldosMensuales.ParentColor := True;
        end;
     end;

     if CBMayorContable.Checked then
     begin
        CBMayorContable.Color := clLime;
        Application.ProcessMessages;
        try
           AbreForm(TFPregMayor, FPregMayor);
           with FPregMayor do
           begin
              DTPDesde.Date := EncodeDate(REntorno.Ejercicio, 1, 1);
              DTPHasta.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
              EFCuentaDesde.Text := '1';
              EFCuentaHasta.Text := '7999';
              CBSaldoCero.Checked := False;
              DMRMayor.MostrarListado(REntorno.Canal, EFCuentaDesde.Text, EFCuentaHasta.Text, DTPDesde.Date, DTPHasta.Date, REntorno.Moneda, 0,
                 0, 0, False, 2, '', '', '', '', '', CBNivel.ItemIndex + 1, IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Mayor-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, Extension]), PBListado);

           end;
           CierraForm(FPregMayor);
        finally
           CBMayorContable.ParentColor := True;
        end;
     end;

     if CBDiarioContable.Checked then
     begin
        CBDiarioContable.Color := clLime;
        Application.ProcessMessages;
        try
           with DMRLibroDiarioConta do
           begin
              Inidebe := 0;
              IniHaber := 0;
              Fecha_Desde := HourIntoDate(EncodeDate(REntorno.Ejercicio, 1, 1), '00:00:00');
              Fecha_Hasta := HourIntoDate(EncodeDate(REntorno.Ejercicio, 12, 31), '23:59:59');
              Asiento_Desde := 1;
              Asiento_Hasta := Asiento_Hasta;
              TipoAsiento := '0';

              ExportarFichero(IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Diario-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, Extension]));
           end;
        finally
           CBDiarioContable.ParentColor := True;
        end;
     end;

     if CBDiarioContableCSV.Checked then
     begin
        CBDiarioContableCSV.Color := clLime;
        Application.ProcessMessages;
        try
           sl := TStringList.Create;
           try
              sl.Add(' /* DIARIO CONTABLE */ ');
              sl.Add(' /* ');
              sl.Add(' Extraccion de asientos contables de la empresa ');
              sl.Add(' Tiene un poco de formato insertando lineas de pie con sumatorio de debe, haber y saldo ');
              sl.Add(' ');
              sl.Add(' */ ');
              sl.Add(' ');
              sl.Add(' select 0 orden, asiento, null ric, null linea, null cuenta_debe, null cuenta_haber, ');
              sl.Add('        ''------------------------------'' tituo, ''------------------------------'' comentario, null importe_debe, ');
              sl.Add('        null importe_haber, null saldo, null fecha ');
              sl.Add(' from c_crea_libro_diario_s(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', ''' + REntorno.EjercicioStr + '.01.01'', ''' + REntorno.EjercicioStr + '.12.31 23:59:59'', 0, 999999, ''EUR'', ''0'') ');
              sl.Add(' group by asiento ');
              sl.Add(' ');
              sl.Add(' union ');
              sl.Add(' ');
              sl.Add(' select 1 orden, asiento, ric, linea, cuenta_debe, cuenta_haber, titulo, comentario, importe_debe, importe_haber, ');
              sl.Add('        (importe_debe - importe_haber) saldo, fecha ');
              sl.Add(' from c_crea_libro_diario_s(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', ''' + REntorno.EjercicioStr + '.01.01'', ''' + REntorno.EjercicioStr + '.12.31 23:59:59'', 0, 999999, ''EUR'', ''0'') ');
              sl.Add(' ');
              sl.Add(' union ');
              sl.Add(' ');
              sl.Add(' select 2 orden, asiento, null, null, null, null, ''TOTAL'', null, sum(importe_debe), sum(importe_haber), ');
              sl.Add('        sum(importe_debe - importe_haber) saldo, null ');
              sl.Add(' from c_crea_libro_diario_s(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', ''' + REntorno.EjercicioStr + '.01.01'', ''' + REntorno.EjercicioStr + '.12.31 23:59:59'', 0, 999999, ''EUR'', ''0'') ');
              sl.Add(' group by asiento ');
              sl.Add(' ');
              sl.Add(' order by 2, 1, 4 ');

              ExportarCSV(IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Diario-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, 'CSV']), sl.Text);
           finally
              sl.Free;
           end;
        finally
           CBDiarioContableCSV.ParentColor := True;
        end;
     end;

     if CBMayorContableCSV.Checked then
     begin
        CBMayorContableCSV.Color := clLime;
        Application.ProcessMessages;
        try
           sl := TStringList.Create;
           try
              sl.Add(' /* MAYOR CONTABLE */ ');
              sl.Add(' /* ');
              sl.Add(' Extraccion de moyor contable de la empresa ');
              sl.Add(' Tiene un poco de formato insertando lineas de titulo y de pie con sumatorio de debe, haber y saldo ');
              sl.Add(' */ ');
              sl.Add(' select 0 orden, c.cuenta cuenta, null fecha, null asiento, ');
              sl.Add('        ''------------------------------------------------------------'' texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''1'' and ''9'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + 'as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 1 orden, c.cuenta, null fecha, null asiento, c.titulo texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''1'' and ''9'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 2 orden, c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '','' '', '' '', '' '', '' '') m ');
              sl.Add(' on c.empresa = m.empresa and c.ejercicio = m.ejercicio and c.canal = m.canal ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''1'' and ''9'' ');
              sl.Add(' group by c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' having count(m.asiento) > 0 ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 3 orden, c.cuenta, null fecha, null asiento, ''TOTAL '' || c.titulo texto, s.debe, s.haber, s.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join con_cuentas_saldos s on c.empresa = s.empresa and c.ejercicio = s.ejercicio and c.canal = s.canal and c.cuenta = s.cuenta ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''1'' and ''9'' and ');
              sl.Add(' s.periodo = ''19'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add('  ');
              sl.Add(' order by 2, 1, 3, 4 ');

              ExportarCSV(IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Mayor_Contable-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, 'CSV']), sl.Text);
           finally
              sl.Free;
           end;
        finally
           CBMayorContableCSV.ParentColor := True;
        end;
     end;

     if CBMayorContableCSV_6_7.Checked then
     begin
        CBMayorContableCSV_6_7.Color := clLime;
        Application.ProcessMessages;
        try
           sl := TStringList.Create;
           try
              sl.Add(' /* MAYOR CONTABLE */ ');
              sl.Add(' /* ');
              sl.Add(' Extraccion de moyor contable de la empresa ');
              sl.Add(' Tiene un poco de formato insertando lineas de titulo y de pie con sumatorio de debe, haber y saldo ');
              sl.Add(' */ ');
              sl.Add(' select 0 orden, c.cuenta cuenta, null fecha, null asiento, ');
              sl.Add('        ''------------------------------------------------------------'' texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''6'' and ''7999'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + 'as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 1 orden, c.cuenta, null fecha, null asiento, c.titulo texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''6'' and ''7999'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 2 orden, c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '','' '', '' '', '' '', '' '') m ');
              sl.Add(' on c.empresa = m.empresa and c.ejercicio = m.ejercicio and c.canal = m.canal ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''6'' and ''7999'' ');
              sl.Add(' group by c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' having count(m.asiento) > 0 ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 3 orden, c.cuenta, null fecha, null asiento, ''TOTAL '' || c.titulo texto, s.debe, s.haber, s.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join con_cuentas_saldos s on c.empresa = s.empresa and c.ejercicio = s.ejercicio and c.canal = s.canal and c.cuenta = s.cuenta ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta between ''6'' and ''7999'' and ');
              sl.Add(' s.periodo = ''19'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add('  ');
              sl.Add(' order by 2, 1, 3, 4 ');

              ExportarCSV(IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Mayor_Contable_6_7-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, 'CSV']), sl.Text);
           finally
              sl.Free;
           end;
        finally
           CBMayorContableCSV_6_7.ParentColor := True;
        end;
     end;

     if CBMayorContableCSV_52.Checked then
     begin
        CBMayorContableCSV_52.Color := clLime;
        Application.ProcessMessages;
        try
           sl := TStringList.Create;
           try
              sl.Add(' /* MAYOR CONTABLE */ ');
              sl.Add(' /* ');
              sl.Add(' Extraccion de moyor contable de la empresa ');
              sl.Add(' Tiene un poco de formato insertando lineas de titulo y de pie con sumatorio de debe, haber y saldo ');
              sl.Add(' */ ');
              sl.Add(' select 0 orden, c.cuenta cuenta, null fecha, null asiento, ');
              sl.Add('        ''------------------------------------------------------------'' texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''52'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + 'as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 1 orden, c.cuenta, null fecha, null asiento, c.titulo texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''52'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 2 orden, c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '','' '', '' '', '' '', '' '') m ');
              sl.Add(' on c.empresa = m.empresa and c.ejercicio = m.ejercicio and c.canal = m.canal ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''52'' ');
              sl.Add(' group by c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' having count(m.asiento) > 0 ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 3 orden, c.cuenta, null fecha, null asiento, ''TOTAL '' || c.titulo texto, s.debe, s.haber, s.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join con_cuentas_saldos s on c.empresa = s.empresa and c.ejercicio = s.ejercicio and c.canal = s.canal and c.cuenta = s.cuenta ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''52'' and ');
              sl.Add(' s.periodo = ''19'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add('  ');
              sl.Add(' order by 2, 1, 3, 4 ');

              ExportarCSV(IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Mayor_Contable_52-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, 'CSV']), sl.Text);
           finally
              sl.Free;
           end;
        finally
           CBMayorContableCSV_52.ParentColor := True;
        end;
     end;

     if CBMayorContableCSV_570.Checked then
     begin
        CBMayorContableCSV_570.Color := clLime;
        Application.ProcessMessages;
        try
           sl := TStringList.Create;
           try
              sl.Add(' /* MAYOR CONTABLE */ ');
              sl.Add(' /* ');
              sl.Add(' Extraccion de moyor contable de la empresa ');
              sl.Add(' Tiene un poco de formato insertando lineas de titulo y de pie con sumatorio de debe, haber y saldo ');
              sl.Add(' */ ');
              sl.Add(' select 0 orden, c.cuenta cuenta, null fecha, null asiento, ');
              sl.Add('        ''------------------------------------------------------------'' texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''570'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + 'as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 1 orden, c.cuenta, null fecha, null asiento, c.titulo texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''570'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 2 orden, c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '','' '', '' '', '' '', '' '') m ');
              sl.Add(' on c.empresa = m.empresa and c.ejercicio = m.ejercicio and c.canal = m.canal ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''570'' ');
              sl.Add(' group by c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' having count(m.asiento) > 0 ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 3 orden, c.cuenta, null fecha, null asiento, ''TOTAL '' || c.titulo texto, s.debe, s.haber, s.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join con_cuentas_saldos s on c.empresa = s.empresa and c.ejercicio = s.ejercicio and c.canal = s.canal and c.cuenta = s.cuenta ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''570'' and ');
              sl.Add(' s.periodo = ''19'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add('  ');
              sl.Add(' order by 2, 1, 3, 4 ');

              ExportarCSV(IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Mayor_Contable_570-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, 'CSV']), sl.Text);
           finally
              sl.Free;
           end;
        finally
           CBMayorContableCSV_570.ParentColor := True;
        end;
     end;

     if CBMayorContableCSV_572.Checked then
     begin
        CBMayorContableCSV_572.Color := clLime;
        Application.ProcessMessages;
        try
           sl := TStringList.Create;
           try
              sl.Add(' /* MAYOR CONTABLE */ ');
              sl.Add(' /* ');
              sl.Add(' Extraccion de moyor contable de la empresa ');
              sl.Add(' Tiene un poco de formato insertando lineas de titulo y de pie con sumatorio de debe, haber y saldo ');
              sl.Add(' */ ');
              sl.Add(' select 0 orden, c.cuenta cuenta, null fecha, null asiento, ');
              sl.Add('        ''------------------------------------------------------------'' texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''572'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + 'as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 1 orden, c.cuenta, null fecha, null asiento, c.titulo texto, null debe, null haber, null saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''572'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 2 orden, c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '','' '', '' '', '' '', '' '') m ');
              sl.Add(' on c.empresa = m.empresa and c.ejercicio = m.ejercicio and c.canal = m.canal ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''572'' ');
              sl.Add(' group by c.cuenta, m.fecha, m.asiento, m.texto, m.debe, m.haber, m.saldo ');
              sl.Add(' having count(m.asiento) > 0 ');
              sl.Add(' -- ');
              sl.Add(' union ');
              sl.Add(' -- ');
              sl.Add(' select 3 orden, c.cuenta, null fecha, null asiento, ''TOTAL '' || c.titulo texto, s.debe, s.haber, s.saldo ');
              sl.Add(' from con_cuentas c ');
              sl.Add(' left join con_cuentas_saldos s on c.empresa = s.empresa and c.ejercicio = s.ejercicio and c.canal = s.canal and c.cuenta = s.cuenta ');
              sl.Add(' where ');
              sl.Add(' c.empresa = ' + REntorno.EmpresaStr + ' and ');
              sl.Add(' c.ejercicio = ' + REntorno.EjercicioStr + ' and ');
              sl.Add(' c.canal = ' + REntorno.CanalStr + ' and ');
              sl.Add(' c.nivel = 5 and ');
              sl.Add(' c.cuenta starting with ''572'' and ');
              sl.Add(' s.periodo = ''19'' and ');
              sl.Add(' 0 < (select count(*) ');
              sl.Add('      from c_cuentas_mayor(' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', c.cuenta, ''01/01/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''12/31/'' || cast(' + REntorno.EjercicioStr + ' as smallint), ''EUR'', 1, '' '', '' '', '' '', '' '', '' '')) ');
              sl.Add('  ');
              sl.Add(' order by 2, 1, 3, 4 ');

              ExportarCSV(IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text) + format('Mayor_Contable_572-%d-%s.%s', [REntorno.Ejercicio, REntorno.CIFEmpresa, 'CSV']), sl.Text);
           finally
              sl.Free;
           end;
        finally
           CBMayorContableCSV_572.ParentColor := True;
        end;
     end;

     if CBBalanceCierre.Checked then
     begin
        CBBalanceCierre.Color := clLime;
        Application.ProcessMessages;
        try
           FMain.EjecutaAccion(FMain.AContaCuentasAnuales);
           Archivo := Format(ECarpetaExtraccion.Text + _('Balance_Cierre-%d-%s.%s'), [REntorno.Ejercicio, REntorno.CIFEmpresa, Extension]);
           FMCuAnuales.ExportarBalanceCierreExcel(Archivo);
           FMCuAnuales.Close;
        finally
           CBBalanceCierre.ParentColor := True;
        end;
     end;

     if CBBalancePerdidasYGanancias.Checked then
     begin
        CBBalancePerdidasYGanancias.Color := clLime;
        Application.ProcessMessages;
        try
           FMain.EjecutaAccion(FMain.AContaCuentasAnuales);
           Archivo := Format(ECarpetaExtraccion.Text + _('Perdidas_Y_Ganancias-%d-%s.%s'), [REntorno.Ejercicio, REntorno.CIFEmpresa, Extension]);
           FMCuAnuales.ExportarBalancePerdidasYGananciasExcel(Archivo);
           FMCuAnuales.Close;
        finally
           CBBalancePerdidasYGanancias.ParentColor := True;
        end;
     end;
  finally
     TBMain.Enabled := True;
  end;
end;

procedure TFMDatosLibro.ECarpetaExtraccionChange(Sender: TObject);
begin
  EscribeDatoIni('DatosLibros', 'UltimaRutaFicheroExportacion', IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text));
end;

procedure TFMDatosLibro.CBExtensionChange(Sender: TObject);
begin
  EscribeDatoIni('DatosLibros', 'UltimaIdExtensionFicheroExportacion', CBExtension.ItemIndex);
end;

procedure TFMDatosLibro.ECarpetaExtraccionExit(Sender: TObject);
begin
  ECarpetaExtraccion.Text := IncludeTrailingPathDelimiter(ECarpetaExtraccion.Text);
end;

end.
