unit UFPImportaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, TFlatCheckBoxUnit, ULFCheckBox, Grids,
  StdCtrls, ULFLabel, ULFComboBox, ULFEdit, ComCtrls, ULFPageControl,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel, ToolWin, ULFToolBar, ExtCtrls, ULFPanel,
  OleServer, Excel2000, Contnrs, ValEdit, ULFMemo;

type
  TFPImportaciones = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSHojaCalculo: TTabSheet;
     TSImportacion2: TTabSheet;
     PNLSeleccionFichero: TLFPanel;
     EdArchivoImp: TLFEdit;
     ButtSelArchivo: TButton;
     CBHojaAImportar: TLFComboBox;
     LInformacionHoja: TLFLabel;
     BInformacionHoja: TButton;
     PNLCeldas: TLFPanel;
     SGDatosImp: TStringGrid;
     PNLImportacion: TLFPanel;
     BImportar: TButton;
     PBProgresoImportacion: TProgressBar;
     Splitter: TSplitter;
     VLETipoColumna: TValueListEditor;
     CBPrimeraFilaTitulos: TLFCheckBox;
     LSeparadorDecimal: TLFLabel;
     ESeparadorDecimal: TLFEdit;
     PNLAsociaciones: TLFPanel;
     VLECampoAsociado: TValueListEditor;
     PBProgreso: TProgressBar;
     MLog: TLFMemo;
     BBorrarLog: TButton;
     LProgreso: TLFLabel;
     procedure EdArchivoImpChange(Sender: TObject);
     procedure ButtSelArchivoClick(Sender: TObject);
     procedure CBHojaAImportarChange(Sender: TObject);
     procedure BImportarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure VLETipoColumnaValidate(Sender: TObject; ACol, ARow: integer; const KeyName, KeyValue: string);
     procedure PNLAsociacionesResize(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure VLECampoAsociadoValidate(Sender: TObject; ACol, ARow: integer; const KeyName, KeyValue: string);
     procedure BBorrarLogClick(Sender: TObject);
  private
     { Private declarations }
     Campos: TStrings;
     procedure RefrescaInformacionArchivo;
     procedure ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
     function LeerDatos(Archivo, Hoja: string): boolean;
     procedure LlenarCampos;
  public
     { Public declarations }
     function DameColumnaSegunCampo(Campo: string): integer;
     procedure AgregaCampo(Campo: string);
  end;

var
  FPImportaciones : TFPImportaciones;

function ImportarExcel: boolean;

implementation

uses UDMMain, UHojaCalc, UUtiles;

{$R *.dfm}

function ImportarExcel: boolean;
var
  F : TForm;
begin
  F := Application.FindComponent('FPImportaciones') as TForm;
  if Assigned(F) then
     Result := False
  else
  begin
     // Formularios
     Application.CreateForm(TFPImportaciones, FPImportaciones);
     with FPImportaciones do
     begin
        // Campos de ejemplo
        AgregaCampo('CLIENTE');
        AgregaCampo('PEDIDO');
        AgregaCampo('ARTICULO');
        AgregaCampo('UNIDADES');
        AgregaCampo('TITULO');
        ShowModal;
        Free;
     end;
     Result := True;
  end;
end;

procedure TFPImportaciones.FormCreate(Sender: TObject);
begin
  inherited;
  Campos := TStringList.Create;

  // Valor para columnas no asociadas a ningun campo
  AgregaCampo('-');

  EdArchivoImp.Text := LeeDatoIni('ImportacionExcel-' + Self.Name, 'UltimoArchivo', '');
  CBHojaAImportar.Text := LeeDatoIni('ImportacionExcel-' + Self.Name, 'UltimaHoja', '');
  CBPrimeraFilaTitulos.Checked := LeeDatoIni('ImportacionExcel-' + Self.Name, 'PrimeraFilaTitulos', True);
  ESeparadorDecimal.Text := LeeDatoIni('ImportacionExcel-' + Self.Name, 'SeparadorDecimal', '.');

  RefrescaInformacionArchivo;

  PCMain.ActivePage := TSHojaCalculo;
end;

procedure TFPImportaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Campos.Free;
end;

procedure TFPImportaciones.ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
var
  i : integer;
begin
  aLastRow := 0;
  aLastCol := 0;
  aCountSheet := 0;
  Sheets.Clear;

  if FileExists(aFileName) then
  begin
     DMMain.Log('ActualizaDatosImportacion - Create Excel');
     with THojaCalc.Create(aFileName, False) do
     begin
        try
           DMMain.Log('ActualizaDatosImportacion - HCalc.FileName = ' + aFileName);
           FileName := aFileName;

           // Obtengo lista de hojas
           for i := 1 to CountSheets do
           begin
              ActivateSheetByIndex(i);
              Sheets.Add(ActiveSheetName);
           end;

           // Si el parametro contiene una hoja, la utilizo para obtener la informacion
           if (aActiveSheetName = '') then
              aActiveSheetName := ActiveSheetName
           else
           begin
              try
                 ActivateSheetByName(aActiveSheetName, False);
              except
                 ActivateSheetByIndex(1);
                 aActiveSheetName := ActiveSheetName;
              end;
           end;

           ActivateSheetByName(aActiveSheetName, False);
           aLastRow := LastRow + 1;
           aLastCol := LastCol + 1;
           aCountSheet := CountSheets;
        finally
           Sleep(100);
           Free;
        end;
     end;
  end;
end;

procedure TFPImportaciones.RefrescaInformacionArchivo;
var
  Filas, Columnas, CantidadHojas : integer;
  HojaActiva : string;
  Sheets : TStrings;
begin
  Sheets := TStringList.Create;
  try
     with CBHojaAImportar do
     begin
        HojaActiva := Text;

        ActualizaDatosImportacion(EdArchivoImp.Text, Filas, Columnas, CantidadHojas, HojaActiva, Sheets);

        Items.Clear;
        Items.AddStrings(Sheets);

        if (Items.Count > 0) then
        begin
           // Si no existe la HojaActiva, tomo la primera hoja del fichero
           if (Items.IndexOf(HojaActiva) >= 0) then
              ItemIndex := Items.IndexOf(HojaActiva)
           else
              ItemIndex := 0;

           Text := Items[0];
        end
        else
           Text := '';
     end;

     LInformacionHoja.Caption := format('Hoja: %s - Filas: %d - Columnas %d', [CBHojaAImportar.Text, Filas, Columnas]);
  finally
     Sheets.Free;
  end;
end;

procedure TFPImportaciones.ButtSelArchivoClick(Sender: TObject);
var
  Archivo : string;
begin
  Archivo := ExtractFileName(EdArchivoImp.Text);

  if MyOpenDialog(Archivo, 'XLS,ODS,CSV', '', 'ImportacionExcel-' + Self.Name + '-SelArchivo') then
  begin
     EdArchivoImp.Text := Archivo;
     // RefrescaInformacionArchivo;
  end;
end;

procedure TFPImportaciones.EdArchivoImpChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

procedure TFPImportaciones.CBHojaAImportarChange(Sender: TObject);
begin
  inherited;
  RefrescaInformacionArchivo;
end;

function TFPImportaciones.LeerDatos(Archivo, Hoja: string): boolean;
var
  HCalc : THojaCalc;
  f, c, MaxRow, MaxCol, FilaDatos : integer;
begin
  DMMain.LogIni('LeerDatos');
  /// Inserta los datos del archivo en filas y columnas.
  /// La primera fila la dejará vacia para rellenarlo con el campo donde insertar el dato.

  Result := True;
  try
     DMMain.Log('LeerDatos - Create Excel');
     HCalc := THojaCalc.Create(Archivo, False); // OpenOffice doc if possible, please
     try
        DMMain.Log('LeerDatos - HCalc.FileName = ' + Archivo);
        HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

        DMMain.Log('HCalc.ActivateSheetByName(' + Hoja + ')');
        HCalc.ActivateSheetByName(Hoja, False);

        DMMain.Log('HCalc.Last Row/Col');
        MaxRow := HCalc.LastRow + 1;
        MaxCol := HCalc.LastCol + 1;
        DMMain.Log(format('LastRow:%d - LastCol:%d', [MaxRow, MaxCol]));

        // Para que ponga los datos importados a partir de la segunda ficha, si no tiene titulos
        FilaDatos := 0;
        if CBPrimeraFilaTitulos.Checked then
           FilaDatos := 1;

        // Progreso de 0 a CANTIDAD_DE_CELDAS
        PBProgresoImportacion.Min := 0;
        PBProgresoImportacion.Max := MaxCol * MaxRow;

        // Invisible para acelerar importacion. Evita refrescos
        SGDatosImp.Visible := False;
        SGDatosImp.ColCount := MaxCol;
        if CBPrimeraFilaTitulos.Checked then
           SGDatosImp.RowCount := MaxRow
        else
           SGDatosImp.RowCount := MaxRow + 1;
        try
           for c := 1 to MaxCol do
           begin
              for f := 1 to MaxRow do
              begin
                 // DMMain.Log(format('Leyendo celda (F:%d, C:%d) - (NroCelda: %d)', [f, c, ((c - 1) * MaxRow) + f]));
                 try
                    SGDatosImp.Cells[c - 1, f - FilaDatos] := LimpiaCeldaExcel(HCalc.CellText[f, c]);
                 except
                    SGDatosImp.Cells[c - 1, f - FilaDatos] := 'ERROR';
                 end;

                 PBProgresoImportacion.Position := ((c - 1) * MaxRow) + f;
              end;
           end;

           // Asigno nombre de columnas a mano
           if not CBPrimeraFilaTitulos.Checked then
           begin
              for c := 1 to MaxCol do
                 SGDatosImp.Cells[c - 1, 0] := format(_('COLUMNA_%d'), [c]);
           end;
        finally
           SGDatosImp.Visible := True;
        end;
        DMMain.Log('Fin importacion');
     finally
        Sleep(1000);
        DMMain.Log('LeerDatos - Liberar Excel');
        HCalc.Free;
     end;
  except
     on E: Exception do
     begin
        DMMain.Log('Error importacion' + #13#10 + E.Message);
        ShowMessage(_('Error de importacion') + #13#10 + E.Message);
        Result := False;
     end;
  end;
  DMMain.LogFin('LeerDatos');
end;

procedure TFPImportaciones.LlenarCampos;
var
  MaxCol, c, f : integer;
  PropCampo : TItemProp;
  Valor, Columna : string;
begin
  DMMain.LogIni('LlenarCampos');

  DMMain.Log('Clear');
  with VLETipoColumna do
  begin
     DMMain.Log(format('RowCount: %d', [RowCount]));
     for f := RowCount - 1 downto 1 do
     begin
        DMMain.Log(format('DeleteRow( %d )', [f]));
        DeleteRow(f);
     end;
  end;

  DMMain.Log('Clear');
  with VLECampoAsociado do
  begin
     DMMain.Log(format('RowCount: %d', [RowCount]));
     for f := RowCount - 1 downto 1 do
     begin
        DMMain.Log(format('DeleteRow( %d )', [f]));
        DeleteRow(f);
     end;
  end;

  MaxCol := SGDatosImp.ColCount;
  DMMain.Log(format('MaxCol: %d', [MaxCol]));
  for c := 0 to MaxCol - 1 do
  begin
     DMMain.Log(format('Columna: %d', [c]));
     Columna := SGDatosImp.Cells[c, 0];
     DMMain.Log(format('Columna: %s', [Columna]));
     if (Columna > '') then
     begin
        DMMain.Log(format('InsertRow - Columna: %s', [Columna]));
        VLETipoColumna.InsertRow(Columna, '', True);

        PropCampo := VLETipoColumna.ItemProps[Columna];
        if not Assigned(PropCampo) then
        begin
           DMMain.Log(format('Creo PropCampo: %s', [Columna]));
           PropCampo := TItemProp.Create(VLETipoColumna);
           VLETipoColumna.ItemProps[Columna] := PropCampo;
        end;

        DMMain.Log(format('Relleno PickList de PropCampo: %s', [Columna]));
        with PropCampo.PickList do
        begin
           Clear;
           Add('Texto');
           Add('Entero');
           Add('Decimal');
           Add('Fecha');
        end;

        DMMain.Log(format('Obtengo valor para Columna: %s', [Columna]));
        Valor := LeeDatoIni('ImportacionExcel-Tipo-' + Self.Name, Columna, 'Texto');

        DMMain.Log(format('Key:%s - Value: %s', [Columna, Valor]));
        VLETipoColumna.Values[Columna] := Valor;
     end;
  end;

  MaxCol := SGDatosImp.ColCount;
  DMMain.Log(format('MaxCol: %d', [MaxCol]));
  for c := 0 to MaxCol - 1 do
  begin
     DMMain.Log(format('Columna: %d', [c]));
     Columna := SGDatosImp.Cells[c, 0];
     DMMain.Log(format('Campo: %s', [Columna]));
     if (Columna > '') then
     begin
        DMMain.Log(format('InsertRow - Campo: %s', [Columna]));
        VLECampoAsociado.InsertRow(Columna, '', True);

        PropCampo := VLECampoAsociado.ItemProps[Columna];
        if not Assigned(PropCampo) then
        begin
           DMMain.Log(format('Creo PropCampo: %s', [Columna]));
           PropCampo := TItemProp.Create(VLECampoAsociado);
           VLECampoAsociado.ItemProps[Columna] := PropCampo;
        end;

        DMMain.Log(format('Relleno PickList de PropCampo: %s', [Columna]));
        with PropCampo.PickList do
        begin
           Clear;
           AddStrings(Campos);
        end;

        DMMain.Log(format('Obtengo valor para Campo: %s', [Columna]));
        Valor := LeeDatoIni('ImportacionExcel-Campo-' + Self.Name, Columna, '-');

        DMMain.Log(format('Key:%s - Value: %s', [Columna, Valor]));
        VLECampoAsociado.Values[Columna] := Valor;
     end;
  end;
  DMMain.LogFin('LlenarCampos');
end;

procedure TFPImportaciones.BImportarClick(Sender: TObject);
var
  DatosLeidos : boolean;
  i : integer;
  Clave : string;
begin
  if (EdArchivoImp.Text = '') then
  begin
     Application.MessageBox(PChar(string('Debe de seleccionar el archivo a importar.')),
        PChar(string('Datos Incompletos')), mb_iconstop + mb_ok);
     Exit;
  end;

  if (not FileExists(EdArchivoImp.Text)) then
  begin
     Application.MessageBox(PChar(string('El archivo seleccionado no existe.')),
        PChar(string('Datos Incompletos')), mb_iconstop + mb_ok);
     Exit;
  end;

  PBProgresoImportacion.Visible := True;
  try
     DatosLeidos := LeerDatos(EdArchivoImp.Text, CBHojaAImportar.Text);
  finally
     PBProgresoImportacion.Visible := False;
  end;

  if (DatosLeidos) then
  begin
     LlenarCampos;

     // Actualiza datos en el ini
     DMMain.Log('EscribeDatoIni ImportacionExcel-UltimoArchivo :' + Trim(EdArchivoImp.Text));
     EscribeDatoIni('ImportacionExcel-' + Self.Name, 'UltimoArchivo', Trim(EdArchivoImp.Text));

     DMMain.Log('EscribeDatoIni ImportacionExcel-UltimaHoja :' + Trim(CBHojaAImportar.Text));
     EscribeDatoIni('ImportacionExcel-' + Self.Name, 'UltimaHoja', Trim(CBHojaAImportar.Text));

     DMMain.Log('EscribeDatoIni ' + Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text) + ' - FechaImportacion : NOW');
     EscribeDatoIni(Trim(EdArchivoImp.Text) + '||' + Trim(CBHojaAImportar.Text), 'FechaImportacion', Now);

     DMMain.Log('EscribeDatoIni ImportacionExcel-PrimeraFilaTitulos :' + IntToStr(BoolToInt(CBPrimeraFilaTitulos.Checked)));
     EscribeDatoIni('ImportacionExcel-' + Self.Name, 'PrimeraFilaTitulos', CBPrimeraFilaTitulos.Checked);

     DMMain.Log('EscribeDatoIni ImportacionExcel-SeparadorDecimal :' + ESeparadorDecimal.Text);
     EscribeDatoIni('ImportacionExcel-' + Self.Name, 'SeparadorDecimal', ESeparadorDecimal.Text);

     DMMain.Log(format('Lineas : %d', [VLETipoColumna.RowCount]));
     for i := 1 to VLETipoColumna.RowCount - 1 do
     begin
        DMMain.Log(format('Linea : %d', [i]));
        Clave := VLETipoColumna.Keys[i];
        DMMain.Log(format('Clave : %s', [Clave]));

        DMMain.Log('EscribeDatoIni ImportacionExcel-Tipo-' + Clave + ' :' + VLETipoColumna.Values[Clave]);
        EscribeDatoIni('ImportacionExcel-Tipo-' + Self.Name, Clave, VLETipoColumna.Values[Clave]);
     end;

     DMMain.Log(format('Lineas : %d', [VLECampoAsociado.RowCount]));
     for i := 1 to VLECampoAsociado.RowCount - 1 do
     begin
        DMMain.Log(format('Linea : %d', [i]));
        Clave := VLECampoAsociado.Keys[i];
        DMMain.Log(format('Clave : %s', [Clave]));

        DMMain.Log('EscribeDatoIni ImportacionExcel-Campo-' + Clave + ' :' + VLECampoAsociado.Values[Clave]);
        EscribeDatoIni('ImportacionExcel-Campo-' + Self.Name, Clave, VLECampoAsociado.Values[Clave]);
     end;
  end;
end;

procedure TFPImportaciones.VLETipoColumnaValidate(Sender: TObject; ACol, ARow: integer; const KeyName, KeyValue: string);
var
  i : integer;
  Clave : string;
begin
  inherited;
  for i := 1 to VLETipoColumna.RowCount - 1 do
  begin
     Clave := VLETipoColumna.Keys[i];

     DMMain.Log('VLETipoColumnaValidate - EscribeDatoIni ImportacionExcel-' + Clave + ' :' + VLETipoColumna.Values[Clave]);
     EscribeDatoIni('ImportacionExcel-Tipo-' + Self.Name, Clave, VLETipoColumna.Values[Clave]);
  end;
end;

procedure TFPImportaciones.VLECampoAsociadoValidate(Sender: TObject; ACol, ARow: integer; const KeyName, KeyValue: string);
var
  i : integer;
  Clave : string;
begin
  inherited;
  for i := 1 to VLECampoAsociado.RowCount - 1 do
  begin
     Clave := VLECampoAsociado.Keys[i];

     DMMain.Log('VLETipoColumnaValidate - EscribeDatoIni ImportacionExcel-' + Clave + ' :' + VLECampoAsociado.Values[Clave]);
     EscribeDatoIni('ImportacionExcel-Campo-' + Self.Name, Clave, VLECampoAsociado.Values[Clave]);
  end;
end;

procedure TFPImportaciones.PNLAsociacionesResize(Sender: TObject);
begin
  inherited;
  VLETipoColumna.Width := PNLAsociaciones.Width div 2;
end;

procedure TFPImportaciones.AgregaCampo(Campo: string);
begin
  Campos.Add(Campo);
end;

function TFPImportaciones.DameColumnaSegunCampo(Campo: string): integer;
var
  i : integer;
  Titulo : string;
begin
  /// Devuelve el nro de columna importada de Excel relacionada con el campo

  Result := -1;

  // Recorro la tabla de asosciacion de campos
  for i := 1 to VLECampoAsociado.RowCount - 1 do
  begin
     if (VLECampoAsociado.Values[VLECampoAsociado.Keys[i]] = Campo) then
        Titulo := VLECampoAsociado.Keys[i];
  end;

  // Recorro datos importados buscado columna con ese titulo
  for i := 0 to SGDatosImp.ColCount - 1 do
     if (Trim(SGDatosImp.Cells[i, 0]) > '') and (SGDatosImp.Cells[i, 0] = Titulo) then
        Result := i;
end;

procedure TFPImportaciones.BBorrarLogClick(Sender: TObject);
begin
  inherited;
  MLog.Lines.Clear;
  LProgreso.Caption := _('Progreso');
end;

end.
