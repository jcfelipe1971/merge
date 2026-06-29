{
FUNCIOMANENT:
S'insertarà els articles del fitxer excel amb l'estructura concretada.
Si l'article que està insertant ja existeix a la taula d'articles generals
insertarà a la pestanya de proveidors l'article, el proveïdor i la
ref. proveïdor.
Ho farà sempre que no existeixi previament.
Si quan fa la lectura de l'excel, aquell article ja existeix a la taula d'
art. importats actualitzarà la informacio. Sinó el crearà de nou. Té en compte
per duplicitat: article, proveïdor
}

unit UFMImportacionArticulosExcelArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, StdCtrls, ExtCtrls, UFormGest, Grids, ImgList,
  ComCtrls, ToolWin, UEditPanel, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ActnList, Spin, rxPlacemnt,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, StrUtils, ULFLabel,
  ULFEdit, ULFPanel, ULFActionList, ULFToolBar;

type
  TFMImportacionArticulosExcelArt = class(TG2KForm)
     lbFichero: TLFLabel;
     TBMain: TLFToolBar;
     tbSeleccionarFichero: TToolButton;
     tbLeerSeleccion: TToolButton;
     tbGuardarSeleccion: TToolButton;
     tbSeparador1: TToolButton;
     tbVerificarDatos: TToolButton;
     tbAbrirExcel: TToolButton;
     sgDatosImportados: TStringGrid;
     HYMEditPanel1: THYMEditPanel;
     RightMenu: TPopupMenu;
     ALMain: TActionList;
     AEliminaCol: TAction;
     AEliminaFila: TAction;
     EliminarColumna1: TMenuItem;
     EliminaFila1: TMenuItem;
     N1: TMenuItem;
     PUnidadesPrecio: TLFPanel;
     LTarifa: TLFLabel;
     EFTarifa: TEditFind2000;
     tbColUdsPrecio: TToolButton;
     ToolButton2: TToolButton;
     tbColdUdsEmbalaje: TToolButton;
     AColUdsPrecio: TAction;
     ACreaCol: TAction;
     ACreaFila: TAction;
     CrearColumna1: TMenuItem;
     CrearFila1: TMenuItem;
     sbEstado: TStatusBar;
     LProveedor: TLFLabel;
     FormPlacement1: TFormPlacement;
     CBImpSoloExist: TLFDBCheckBox;
     EProveedor: TEditFind2000;
     ETituloProveedor: TLFEdit;
     ETituloTarifa: TLFEdit;
     ASeleccionarFichero: TAction;
     AAbrirExcel: TAction;
     ALeerSeleccion: TAction;
     AVerificarDatos: TAction;
     AGuardarSeleccion: TAction;
     PNLMain: TLFPanel;
     PNLGrid: TLFPanel;
     PNLFichero: TLFPanel;
     ENombreFichero: TLFEdit;
     BSeleccionarFichero: TButton;
     ToolButton1: TToolButton;
     ToolButton3: TToolButton;
     PMConfiguracion: TPopupMenu;
     AGuardarConfiguracion: TAction;
     MIGuardarconfiguracion: TMenuItem;
     ADesasignarCampo: TAction;
     DesasignarCampo1: TMenuItem;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure sgDatosImportadosMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure FieldNameClick(Sender: TObject);
     procedure AEliminaColExecute(Sender: TObject);
     procedure AEliminaFilaExecute(Sender: TObject);
     procedure EFTarifaChange(Sender: TObject);
     procedure sgDatosImportadosSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
     procedure ACreaColExecute(Sender: TObject);
     procedure ACreaFilaExecute(Sender: TObject);
     procedure FormShortCut(var Msg: TWMKey; var Handled: boolean);
     procedure EProveedorChange(Sender: TObject);
     procedure ASeleccionarFicheroExecute(Sender: TObject);
     procedure AAbrirExcelExecute(Sender: TObject);
     procedure ALeerSeleccionExecute(Sender: TObject);
     procedure AVerificarDatosExecute(Sender: TObject);
     procedure AGuardarSeleccionExecute(Sender: TObject);
     procedure AGuardarConfiguracionExecute(Sender: TObject);
     procedure MIConfiguracionClick(Sender: TObject);
     procedure ADesasignarCampoExecute(Sender: TObject);
     procedure sgDatosImportadosDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
  private
     { Private declarations }
     FicheroAbierto: boolean;
     XLApp: variant;
     Fichero: string;
     WorkBk: variant;
     ColCount: integer;
     PopupColumn: integer;
     PopupFila: integer;
     procedure InhabilitarBotones;
     procedure LeerSeleccion;
     procedure Verificar(MarcarImportar, MsgErrorCodArt: boolean);
     procedure EliminarFila(Fila: integer);
     procedure BuscaCampos;
     function ExisteArticulo(Codigo: string): boolean;
     procedure VerificaCodigos(MarcarImportar: boolean);
     function GetCellString(FieldId, row: integer): string;
     function GetCellFloat(FieldId, row: integer): double;
     procedure LeerConfiguraciones;
     procedure GuardarConfiguracion;
     // procedure BorrarConfiguracion;
  public
     { Public declarations }
  end;

var
  FMImportacionArticulosExcelArt : TFMImportacionArticulosExcelArt;

implementation

uses UDMImportacionArticulosExcelArt, ComObj, Types, UDMMain, UEntorno, FIBQuery, HYFIBQuery,
  UUtiles, UDameDato, IniFiles, UFMain;

{$R *.dfm}

type
  TColInfo = record
     ColLabel: string;
     FieldName: string;
     ColIndex: integer;
     EsTexto: boolean;
     LongTxt: integer;
  end;
  TPalabras = array of string;

const
  iarticulo = 01;
  ititulo = 02;
  ifamilia = 03;
  ipventa1 = 04;
  ipiezas = 05;
  ipventa2 = 06;
  ipcompra1 = 07;
  idescuento1 = 08;
  ipcoste1 = 09;
  ipcompra2 = 10;
  idescuento2 = 11;
  ipcoste2 = 12;
  iref_proveedor = 13;
  iobservaciones = 14;
  ialfa1 = 15;
  ialfa2 = 16;
  ialfa3 = 17;
  ialfa4 = 18;
  ialfa5 = 19;
  ialfa6 = 20;
  iEAN13 = 21;
  ipventarecomendado = 22;
  FieldsCount = 22;

var
  HayPrecioVenta : boolean;
  HayModArt : boolean;
  Descuentos : boolean;

  Fields : array [1..FieldsCount] of TColInfo;

procedure TFMImportacionArticulosExcelArt.FormCreate(Sender: TObject);
var
  menItem : TMenuItem;
  i : integer;
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMImportacionArticulosExcelArt, DMImportacionArticulosExcelArt);

  // Estructura que guarda los campos que se pueden importar
  with Fields[iarticulo] do
  begin
     ColLabel := _('Articulo');
     FieldName := '';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 15;
  end;
  with Fields[ititulo] do
  begin
     ColLabel := _('Titulo');
     FieldName := '';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 60;
  end;
  with Fields[ifamilia] do
  begin
     ColLabel := _('Familia');
     FieldName := '';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 5;
  end;
  with Fields[ipventa1] do
  begin
     ColLabel := _('Precio Venta 1');
     FieldName := 'PVENTA1';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[ipiezas] do
  begin
     ColLabel := _('Piezas');
     FieldName := 'PIEZAS';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[ipventa2] do
  begin
     ColLabel := _('Precio Venta 2');
     FieldName := 'PVENTA2';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[ipcompra1] do
  begin
     ColLabel := _('Precio Compra 1');
     FieldName := 'PCOMPRA1';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[idescuento1] do
  begin
     ColLabel := _('Descuento 1');
     FieldName := 'DESCUENTO1';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[ipcoste1] do
  begin
     ColLabel := _('Precio Coste 1');
     FieldName := 'PCOSTE1';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[ipcompra2] do
  begin
     ColLabel := _('Precio Compra 2');
     FieldName := 'PCOMPRA2';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[idescuento2] do
  begin
     ColLabel := _('Descuento 2');
     FieldName := 'DESCUENTO2';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[ipcoste2] do
  begin
     ColLabel := _('Precio Coste 2');
     FieldName := 'PCOSTE2';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;
  with Fields[iref_proveedor] do
  begin
     ColLabel := _('Ref. Proveedor');
     FieldName := 'REF_PROVEEDOR';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 40;
  end;
  with Fields[iobservaciones] do
  begin
     ColLabel := _('Observaciones');
     FieldName := 'NOTAS';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 255;
  end;
  with Fields[ialfa1] do
  begin
     ColLabel := _('Alfa 1');
     FieldName := 'ALFA_1';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 40;
  end;
  with Fields[ialfa2] do
  begin
     ColLabel := _('Alfa 2');
     FieldName := 'ALFA_2';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 40;
  end;
  with Fields[ialfa3] do
  begin
     ColLabel := _('Alfa 3');
     FieldName := 'ALFA_3';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 40;
  end;
  with Fields[ialfa4] do
  begin
     ColLabel := _('Alfa 4');
     FieldName := 'ALFA_4';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 40;
  end;
  with Fields[ialfa5] do
  begin
     ColLabel := _('Alfa 5');
     FieldName := 'ALFA_5';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 40;
  end;
  with Fields[ialfa6] do
  begin
     ColLabel := _('Alfa 6');
     FieldName := 'ALFA_6';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 40;
  end;
  with Fields[iEAN13] do
  begin
     ColLabel := _('EAN13');
     FieldName := 'BARRAS';
     ColIndex := -1;
     EsTexto := True;
     LongTxt := 13;
  end;
  with Fields[ipventarecomendado] do
  begin
     ColLabel := _('P. Venta Recom.');
     FieldName := 'P_VENTA_RECOMENDADO';
     ColIndex := -1;
     EsTexto := False;
     LongTxt := 14;
  end;

  // Crea el menu para poder seleccionar los campos
  for i := 1 to FieldsCount do
  begin
     menItem := TMenuItem.Create(Self);
     menItem.Caption := Fields[i].ColLabel;
     menItem.Tag := i;
     menItem.OnClick := FieldNameClick;
     RightMenu.Items.Add(menItem);
  end;

  InhabilitarBotones; // Desctiva las opciones
  sbEstado.SimpleText := _('No se ha abierto el documento');
  EFTarifa.Text := 'NOR'; // Tarifa Normal (Defecto)   [REntorno.TarifaDefecto]

  LeerConfiguraciones;
end;

procedure TFMImportacionArticulosExcelArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMImportacionArticulosExcelArt);
end;

procedure TFMImportacionArticulosExcelArt.InhabilitarBotones;
begin
  AAbrirExcel.Enabled := False;
  ALeerSeleccion.Enabled := False;
  AVerificarDatos.Enabled := False;
  AGuardarSeleccion.Enabled := False;
  {$IFDEF Debug}
  AGuardarSeleccion.Enabled := True;
  {$ENDIF}
  FicheroAbierto := False;
end;

procedure TFMImportacionArticulosExcelArt.LeerSeleccion;
var
  i, k, y, StartRow, RowCount : integer;
  MatrizTraspaso : variant;
begin
  /// Lee el area seleccionada del Excel abierto y lo importa al StringGrid

  if FicheroAbierto then
  begin
     // Obtengo las coordenadas de la última celda
     // X := XLApp.ActiveCell.Row;
     Y := XLApp.ActiveCell.Column;

     // Defino las columnas en el Grid
     sgDatosImportados.ColCount := Y;

     // Asigno la seleccion a la matriz de traspaso de Delphi
     MatrizTraspaso := XLApp.Selection.Value;

     RowCount := XLApp.Selection.Rows.Count;
     ColCount := XLApp.Selection.Columns.Count;

     sgDatosImportados.ColCount := ColCount + 2;
     sgDatosImportados.RowCount := RowCount;

     if ConfirmaMensaje(_('¿La primera fila contiene los nombres de las columnas?')) then
        StartRow := 0
     else
     begin
        StartRow := 1;
        for k := 3 to ColCount + 2 do
           sgDatosImportados.Cells[(k - 1), 0] := Format(_('Columna %d'), [k - 2]);
        sgDatosImportados.RowCount := RowCount + 1;
     end;

     // Traspaso la Matriz al StringGrid
     for i := 1 to RowCount do
        for k := 1 to ColCount do
           sgDatosImportados.Cells[(k + 1), ((i + StartRow) - 1)] := MatrizTraspaso[i, k];

     // Titulo de columnas iniciales
     sgDatosImportados.Cells[0, 0] := _('Importar?');
     sgDatosImportados.Cells[1, 0] := _('Estado');

     // Inicializo estado de columnas iniciales
     for i := 1 to RowCount + StartRow do
        sgDatosImportados.Cells[0, (i)] := _('Importar'); // sfg.albert - 'No Importar';
     for i := 1 to RowCount + StartRow do
        sgDatosImportados.Cells[1, (i)] := _('Sin Verificar');

     MatrizTraspaso := Unassigned;

     // Desconecto el servidor y quito el EXCEL
     WorkBk.Close(False);
     XLApp.Quit;
     FicheroAbierto := False;
  end
  else
     Application.MessageBox(PChar(string(_('Debe selecionar un archivo de excel y abrirlo en el Excel antes de poder selecionar un rango'))), PChar(string(_('Error'))), mb_ok + mb_IconStop);
end;

procedure TFMImportacionArticulosExcelArt.sgDatosImportadosMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  sgDatosImportados.MouseToCell(X, Y, PopupColumn, PopupFila);
  if ((PopupFila = 0) and (Button = mbRight) and (PopupColumn > 1)) then
  begin
     AEliminaFila.Enabled := False;
     AEliminaCol.Enabled := True;
     RightMenu.Popup(Self.Left + x, Self.Top + y);
  end
  else
  if ((PopupFila > 0) and (Button = mbRight) and (PopupColumn = 0)) then
  begin
     AEliminaFila.Enabled := True;
     AEliminaCol.Enabled := False;
     RightMenu.Popup(Self.Left + x, Self.Top + y);
  end;
end;

function EvaluarSimilitud(a, b: string): integer;
const
  coeficientedeaproximacion = 1024;

  function zTrim(s: string): string;
  begin
     /// Quita espacios y caracteres raros al principio y final de un string

     // Quito espacios delante y detras del string
     Result := Trim(s);

     // Quito caracters especiales delante del string
     try
        while Result[1] <= ' ' do
           Delete(Result, 1, 1);
     except
     end;

     // Quito caracters especiales detras del string
     try
        while Result[Length(Result)] <= ' ' do
           Delete(Result, Length(Result), 1);
     except
     end;
  end;

  procedure Limpia(var s: string);
  var
     i : integer;
  begin
     /// converte a minusculas y convierte caracteres acentuados a caracteres normales

     // Convierto a minusculas
     s := LowerCase(s);

     // Quito acentos
     i := 1;
     while i <= Length(s) do
        if s[i] in ['a'..'z', ' ', '0'..'9'] then
           Inc(i)
        else
           case s[i] of
              'á', 'Á', 'à', 'À': s[i] := 'a';
              'é', 'É', 'è', 'È': s[i] := 'e';
              'í', 'Í', 'ì', 'Ì': s[i] := 'i';
              'ó', 'Ó', 'ò', 'Ò': s[i] := 'o';
              'ú', 'Ú', 'ù', 'Ù', 'ü', 'Ü': s[i] := 'u';
              'ñ', 'Ñ': s[i] := 'n';
              'ç', 'Ç': s[i] := 'c';
              else
                 s[i] := ' ';
           end;
  end;

  procedure SacarPalabras(s: string; var l: TPalabras);
  var
     nueva : string;
  begin
     SetLength(l, 0);

     while s > '' do
     begin
        // Quito espacios iniciales
        while (s > '') and (s[1] = ' ') do
           Delete(s, 1, 1);

        if s > '' then
        begin
           // Obtengo la primera palabra (hasta el siguiente espacio)
           if Pos(' ', s) > 0 then
              nueva := Copy(s, 1, Pos(' ', s) - 1)
           else
              nueva := s;

           // Agrego la palabra al array de palabras
           SetLength(l, Length(l) + 1);
           l[Length(l) - 1] := nueva;

           // Borro la palabra del string original
           Delete(s, 1, Length(nueva));
        end; // if
     end; // while
  end;

var
  palabrasA : TPalabras;
  palabrasB : TPalabras;
  i : integer;
  j : integer;
begin
  Limpia(a);
  Limpia(b);
  a := zTrim(a);
  b := zTrim(b);

  if a = b then
     Result := MaxInt
  else
  begin
     SacarPalabras(a, palabrasA);
     SacarPalabras(b, palabrasB);
     Result := 0;
     for i := 0 to Length(palabrasA) - 1 do
        for j := 0 to Length(palabrasB) - 1 do
        begin
           Result := Result + Abs(integer(Pos(palabrasA[i], palabrasB[j]) > 0)) * coeficientedeaproximacion + Abs(integer(Pos(palabrasB[j], palabrasA[i]) > 0)) * coeficientedeaproximacion - Abs(integer(Pos(palabrasA[i], palabrasB[j]) = 0)) - Abs(integer(Pos(palabrasB[j], palabrasA[i]) = 0));
        end; //for
  end; //if a=b
end;

function NoFieldIn(col: integer): boolean;
var
  i : integer;
begin
  Result := True;
  for i := 1 to FieldsCount do
     if Fields[i].ColIndex = col then
        Result := False;
end;

procedure TFMImportacionArticulosExcelArt.BuscaCampos;
var
  i, j : integer;
  max : integer;
  min : integer;
  straux1 : string;
  straux2 : string;
  intaux : integer;
begin
  /// Aparentemente busca los campos que mas se parecen al nombre de la columna

  for i := 2 to sgDatosImportados.ColCount - 1 do
  begin
     max := 0;
     intaux := -1;
     if NoFieldIn(i) then
     begin
        for j := 1 to FieldsCount do
        begin
           if Fields[j].ColIndex = -1 then
           begin
              straux1 := Trim(UpperCase(Fields[j].ColLabel));
              straux2 := Trim(UpperCase(sgDatosImportados.Cells[i, 0]));
              min := EvaluarSimilitud(straux2, straux1 + ' ' + Fields[j].FieldName);
              if (min > max) and (min > 0) then
              begin
                 max := min;
                 intaux := j;
              end;
           end;
        end;
     end;

     // Ajusto el tamaño de la columna
     if (intaux > -1) then
     begin
        Fields[intaux].ColIndex := i;
        sgDatosImportados.Cells[i, 0] := '*' + Fields[intaux].ColLabel;
        sgDatosImportados.ColWidths[i] := sgDatosImportados.Canvas.TextWidth(StringOfChar('w', Fields[intaux].LongTxt + 1));
     end;
  end;
end;

function TFMImportacionArticulosExcelArt.ExisteArticulo(Codigo: string): boolean;
begin
  Result := (DameTituloArticulo(Copy(Codigo, 1, 15)) <> '');
end;

procedure TFMImportacionArticulosExcelArt.VerificaCodigos(MarcarImportar: boolean);
var
  i : integer;
  CodArticulo : string;
begin
  /// Marca la existencia del artículo en la base de datos de la empresa y lo marca para importar

  for i := 1 to sgDatosImportados.RowCount - 1 do
  begin
     CodArticulo := Trim(sgDatosImportados.Cells[Fields[iarticulo].ColIndex, i]);

     if ((CodArticulo <> '') and ExisteArticulo(CodArticulo)) then
        sgDatosImportados.Cells[1, i] := _('Existente')
     else
        sgDatosImportados.Cells[1, i] := _('Nuevo');

     if (MarcarImportar) then
        sgDatosImportados.Cells[0, i] := _('Importar');
  end;
end;

procedure TFMImportacionArticulosExcelArt.Verificar(MarcarImportar, MsgErrorCodArt: boolean);
begin
  // Si hay codigo de articulo lo verificamos
  if ((Fields[iarticulo].ColIndex > -1)) then
     VerificaCodigos(MarcarImportar)
  else
  if MsgErrorCodArt then
     MessageDlg(_('Debe haber una columna de Código de Artículo'), mtError, [mbOK], 0);
end;

procedure TFMImportacionArticulosExcelArt.FieldNameClick(Sender: TObject);
var
  Posicion : integer;
  Descripcion : string;
begin
  // Quito '&' del Caption del MenuItem y lo asigno al titulo de la columna
  Descripcion := TMenuItem(Sender).Caption;
  Posicion := Pos('&', Descripcion);
  if (Posicion > 0) then
     Delete(Descripcion, Posicion, 1);

  sgDatosImportados.Cells[PopupColumn, 0] := '*' + Descripcion;
  Fields[TMenuItem(Sender).Tag].ColIndex := PopupColumn;

  // Verificar(False,False);
  sgDatosImportados.Repaint;
end;

// Elimina la columna seleccionada del grid
procedure TFMImportacionArticulosExcelArt.AEliminaColExecute(Sender: TObject);
var
  n, i : integer;
begin
  // No me atrevo a confiarme
  for n := PopupColumn to sgDatosImportados.ColCount - 2 do
     for i := 0 to sgDatosImportados.RowCount - 1 do
        sgDatosImportados.Cells[n, i] := sgDatosImportados.Cells[n + 1, i];

  for i := 0 to sgDatosImportados.RowCount - 1 do
     sgDatosImportados.Cells[sgDatosImportados.ColCount - 1, i] := '';

  sgDatosImportados.ColCount := sgDatosImportados.ColCount - 1;

  for i := 1 to FieldsCount do
  begin
     if Fields[i].ColIndex = PopupColumn then
        Fields[i].ColIndex := -1;
     if Fields[i].ColIndex > PopupColumn then
        Dec(Fields[i].ColIndex);
  end;

  // No tiene sentido no traspasar ninguna columna
  // por esta razon no lo dejo eliminar.
  // Ademas si lo elimino queda poco estetico.
  if (sgDatosImportados.ColCount = 2) then
     with sgDatosImportados do
     begin
        ColCount := 3;
        FixedCols := 2;
     end;

  sgDatosImportados.Repaint;
end;

// Elimina la fila seleccionada del grid
procedure TFMImportacionArticulosExcelArt.AEliminaFilaExecute(Sender: TObject);
begin
  EliminarFila(PopupFila);
  sgDatosImportados.Repaint;
end;

procedure TFMImportacionArticulosExcelArt.EliminarFila(Fila: integer);
var
  n, i : integer;
begin
  for n := 0 to sgDatosImportados.ColCount - 1 do
     for i := Fila to sgDatosImportados.RowCount - 2 do
     begin
        sgDatosImportados.Cells[n, i] := sgDatosImportados.Cells[n, i + 1];
        sgDatosImportados.Cells[n, i + 1] := '';
     end;
  sgDatosImportados.RowCount := sgDatosImportados.RowCount - 1;
end;

procedure TFMImportacionArticulosExcelArt.EFTarifaChange(Sender: TObject);
begin
  ETituloTarifa.Text := DameTituloTarifa(EFTarifa.Text);
end;

procedure TFMImportacionArticulosExcelArt.sgDatosImportadosSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  sbEstado.SimpleText := Format(_('Fila: %d Columna: %d'), [ARow, ACol]);
end;

procedure TFMImportacionArticulosExcelArt.ACreaColExecute(Sender: TObject);
begin
  sgDatosImportados.ColCount := sgDatosImportados.ColCount + 1;
  sgDatosImportados.Repaint;
end;

procedure TFMImportacionArticulosExcelArt.ACreaFilaExecute(Sender: TObject);
begin
  sgDatosImportados.RowCount := sgDatosImportados.RowCount + 1;

  // Verificar(True, False);
  sgDatosImportados.Repaint;
end;

procedure TFMImportacionArticulosExcelArt.FormShortCut(var Msg: TWMKey; var Handled: boolean);
begin
  // Con este trozo de codigo conseguimos que el grid
  // se desplace con la tecla Tabulador siempre y cuando no este
  // en modo edicion.

  if GetFocus = sgDatosImportados.Handle then
     if Msg.CharCode = 9 then
     begin
        Msg.CharCode := 39;
        Msg.Result := 0;
     end;
end;

function TFMImportacionArticulosExcelArt.GetCellString(FieldId, row: integer): string;
begin
  if (Fields[FieldId].ColIndex > -1) then
     Result := sgDatosImportados.cells[Fields[FieldId].ColIndex, row]
  else
     Result := '';
end;

function TFMImportacionArticulosExcelArt.GetCellFloat(FieldId, row: integer): double;
begin
  if (Fields[FieldId].ColIndex > -1) then
     GetCellFloat := StrToFloatDef(sgDatosImportados.cells[Fields[FieldId].ColIndex, row], 0)
  else
     GetCellFloat := 0;
end;

procedure TFMImportacionArticulosExcelArt.EProveedorChange(Sender: TObject);
begin
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EProveedor.Text, 0));
end;

procedure TFMImportacionArticulosExcelArt.ASeleccionarFicheroExecute(Sender: TObject);
var
  Archivo : string;
begin
  /// Selecciona archivo Excel y lo abre

  if MyOpenDialog(Archivo, 'XLS', '', 'FMImportacionArticulosExcelArt-SeleccionarFichero') then
  begin
     ENombreFichero.Text := Archivo;
     AAbrirExcel.Enabled := True;
     sbEstado.SimpleText := _('Fichero EXCEL de importación seleccionado');
     AAbrirExcel.Execute;
  end;
end;

procedure TFMImportacionArticulosExcelArt.AAbrirExcelExecute(Sender: TObject);
var
  IIndex : byte;
begin
  /// Abre Excel con el fichero que se ha seleccionado

  Fichero := ENombreFichero.Text;

  // Verifico que se halla entrado un nombre de fichero y que no ha sido borrado desde la entrada hasta la selección
  if (Fichero <> '') and (FileExists(Fichero)) then
  begin
     IIndex := 1;
     XLApp := CreateOleObject('Excel.Application');
     XLApp.WorkBooks.Open(Fichero, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
     WorkBk := XLApp.WorkBooks.Item[IIndex];
     FicheroAbierto := True;
     sbEstado.SimpleText := _('El EXCEL se encuentra abierto');
     XLApp.Visible := True;
     ALeerSeleccion.Enabled := True;
  end
  else
  begin
     FicheroAbierto := False;
     Application.MessageBox(PChar(string(_('No hay fichero para abrir'))), PChar(string(_('Error'))), mb_ok + mb_iconstop);
  end;
end;

procedure TFMImportacionArticulosExcelArt.ALeerSeleccionExecute(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to FieldsCount do
     Fields[i].ColIndex := -1;

  LeerSeleccion;
  AVerificarDatos.Enabled := True;
  AGuardarSeleccion.Enabled := True;
  sbEstado.SimpleText := _('El EXCEL se ha cerrado');

  sgDatosImportados.FixedCols := 2;
  sgDatosImportados.FixedRows := 1;

  BuscaCampos;

  // Verificamos los datos
  Verificar(True, False);
end;

procedure TFMImportacionArticulosExcelArt.AVerificarDatosExecute(Sender: TObject);
begin
  Verificar(True, True);
end;

procedure TFMImportacionArticulosExcelArt.AGuardarSeleccionExecute(Sender: TObject);

  function LimitesCorrectos: boolean;
     {var
     li : array [0..4] of integer;
     i : integer;
     f : integer;}
  begin
     Result := True;
     {li[0] := 0;
    f := 0;
    for i:=1 to 4 do
      li[i] := 1999999999;
    if Fields[iprecioventa4].ColIndex>-1 then begin
      li[3] := EUnidPrecio3.Value;
      f := 4;
    end;
    if Fields[iprecioventa3].ColIndex>-1 then begin
      li[2] := EUnidPrecio2.Value;
      if (f<3) then f := 3;
    end;
    if Fields[iprecioventa2].ColIndex>-1 then begin
      li[1] := EUnidPrecio1.Value;
      if (f<1) then f := 1;
    end;

    for i := 1 to f do
      if not (li[i]>li[i-1]) then
        Result := False;
    EUnidPrecio1.Value := li[1];
    EUnidPrecio2.Value := li[2];
    EUnidPrecio3.Value := li[3];
    }
  end;

var
  i : integer;
  Articulo : string;
  Titulo : string;
  Familia : string;
  Alfa1, Alfa2, Alfa3, Alfa4, Alfa5, Alfa6, EAN13 : string;
  PVenta1, PVenta2, Piezas, PCompra1, Descuento1, PCoste1, PCompra2, Descuento2, PCoste2, PVentaRecomendado : double;
  RefProveedor, Notas : string;
  id_a : integer;
  Proveedor : integer;
begin
  ///////////////////////////////////////////////////////////////////////////////////////////
  // Precios por rango de unidades (ejemplo del insert y del delete) ////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////
  // delete from art_tarifas_precio where empresa = 1 and articulo = '.';                  //
  // insert into art_tarifas_precios                                                       //
  //    (empresa,tarifa,articulo,calculo,unid_minimas,unid_maximas,precio_venta,bloqueado) //
  //                            values(1,'NOR','.',1,50,100,123.456,1);                    //
  ///////////////////////////////////////////////////////////////////////////////////////////

  // Verificamos los datos
  Verificar(False, True);
  HayPrecioVenta := False;
  HayModArt := False;
  Descuentos := False;

  if (Fields[iarticulo].ColIndex = -1) then
     MessageDlg(_('No hay columna marcada como codigo de articulo'), mtInformation, [mbOK], 0)
  else
  if (StrToIntDef(EProveedor.Text, 0) = 0) then
     MessageDlg(_('No hay proveedor seleccionado'), mtInformation, [mbOK], 0)
  else
  if (Trim(EFTarifa.Text) = '') then
     MessageDlg(_('No hay tarifa seleccionado'), mtInformation, [mbOK], 0)
  else
  begin
     i := 0;
     Proveedor := StrToInt(EProveedor.Text);

     while i < sgDatosImportados.RowCount - 1 do
     begin
        Inc(i);

        // Solo importo los registros marcados para importar
        if sgDatosImportados.Cells[0, i] = _('Importar') then
        begin
           Articulo := LeftStr(GetCellString(iarticulo, i), Fields[iarticulo].LongTxt);
           Titulo := LeftStr(GetCellString(ititulo, i), Fields[ititulo].LongTxt);
           Familia := LeftStr(GetCellString(ifamilia, i), Fields[ifamilia].LongTxt);
           RefProveedor := LeftStr(GetCellString(iref_proveedor, i), Fields[iref_proveedor].LongTxt);
           Notas := LeftStr(GetCellString(iobservaciones, i), Fields[iobservaciones].LongTxt);
           Piezas := GetCellFloat(ipiezas, i);
           PVenta1 := GetCellFloat(ipventa1, i);
           PVenta2 := GetCellFloat(ipventa2, i);
           PCompra1 := GetCellFloat(ipcompra1, i);
           PCompra2 := GetCellFloat(ipcompra2, i);
           Descuento1 := GetCellFloat(idescuento1, i);
           Descuento2 := GetCellFloat(idescuento2, i);
           PCoste1 := GetCellFloat(ipcoste1, i);
           PCoste2 := GetCellFloat(ipcoste2, i);
           Alfa1 := LeftStr(GetCellString(ialfa1, i), Fields[ialfa1].LongTxt);
           Alfa2 := LeftStr(GetCellString(ialfa2, i), Fields[ialfa2].LongTxt);
           Alfa3 := LeftStr(GetCellString(ialfa3, i), Fields[ialfa3].LongTxt);
           Alfa4 := LeftStr(GetCellString(ialfa4, i), Fields[ialfa4].LongTxt);
           Alfa5 := LeftStr(GetCellString(ialfa5, i), Fields[ialfa5].LongTxt);
           Alfa6 := LeftStr(GetCellString(ialfa6, i), Fields[ialfa6].LongTxt);
           EAN13 := LeftStr(GetCellString(iEAN13, i), Fields[iEAN13].LongTxt);
           PVentaRecomendado := GetCellFloat(ipventarecomendado, i);

           // Si no existeix article+proveïdor+ref.proveïdor a art_importados, insertarà. Sinó modificarà
           if not DMImportacionArticulosExcelArt.ExisteArticulo(Articulo, RefProveedor, Proveedor) then
           begin
              if CBImpSoloExist.Checked then
                 Dec(i)
              else
                 DMImportacionArticulosExcelArt.InsertarArticulo(Articulo, Titulo, Familia, PVenta1, PVenta2, Piezas, PCompra1, Descuento1, PCoste1,
                    PCompra2, Descuento2, PCoste2, RefProveedor, Notas, LeftStr(EFTarifa.Text, 3), Proveedor, Alfa1, Alfa2, Alfa3, Alfa4, Alfa5, Alfa6, EAN13, PVentaRecomendado);

           end
           else
              DMImportacionArticulosExcelArt.UpdateArticulo(Articulo, Titulo, Familia, PVenta1, PVenta2, Piezas, PCompra1, Descuento1, PCoste1,
                 PCompra2, Descuento2, PCoste2, RefProveedor, Notas, LeftStr(EFTarifa.Text, 3), Proveedor, Alfa1, Alfa2, Alfa3, Alfa4, Alfa5, Alfa6, EAN13, PVentaRecomendado);

           // Comprobar si existeix l'article a Articles. Si existeix mira si
           // el proveïdor que s'està entrant i la ref. proveïdor ja existeix
           // Si no existeix el proveïdor i la ref. proveïdor, l'inserta
           if (DMImportacionArticulosExcelArt.ExisteArticuloPadre(Articulo, id_a) = True) then
           begin
              // Posa l'article com a principal
              if (DMImportacionArticulosExcelArt.ExistePrincipal(Articulo)) then
                 DMImportacionArticulosExcelArt.EstablecePrincipal(Articulo, Proveedor, RefProveedor);

              // Inserta el proveïdor a l'article
              if (not (DMImportacionArticulosExcelArt.ExisteArticuloPadreProv(RefProveedor, Proveedor)) and (RefProveedor <> '')) then
                 DMImportacionArticulosExcelArt.InsertarArtProveedor(Articulo, RefProveedor, Proveedor, id_a);
           end;
        end; // if sgDatosImportados.Cells[0, i] = _('Importar')
     end;

     MessageDlg(Format(_('Importación/actualización realizada con éxito'#10#13'Importados/actualizados %d registros'), [i]), mtInformation, [mbOK], 0);
  end;
end;

procedure TFMImportacionArticulosExcelArt.LeerConfiguraciones;
var
  oini : TIniFile;
  NewItem : TMenuItem;
  ts : TStrings;
  i : integer;
begin
  /// Lee la configuracion y la agrega al menú desplegable

  // Primero borro los items del menu
  for i := PMConfiguracion.Items.Count - 1 downto 0 do
     if (TMenuItem(PMConfiguracion.Items[i]).Tag > 0) then
        PMConfiguracion.Items.Delete(i);

  // Ahora agrego los qe hay en el ini
  oini := TIniFile.Create(REntorno.FicheroINI);
  ts := TStringList.Create();
  try
     oini.ReadSectionValues('ConfiguracionImportacionArticulosExcel', ts);

     for i := 0 to ts.Count - 1 do
     begin
        NewItem := TMenuItem.Create(PMConfiguracion.Items);
        try
           NewItem.Caption := ts.Names[i];
           NewItem.Tag := 1;
           NewItem.OnDrawItem := FMain.OwnerDrawMenuItem;
           NewItem.OnMeasureItem := FMain.MeasureMenuItem;
           NewItem.OnClick := MIConfiguracionClick;
           // PMConfiguracion.Items.Insert(0, NewItem);
           PMConfiguracion.Items.Add(NewItem);
        except
           NewItem.Free;
           raise;
        end;
     end;
  finally
     oini.Free;
     ts.Free;
  end;
end;

{
procedure TFMImportacionArticulosExcelArt.BorrarConfiguracion;
begin
  /// Pregunta un nombre de configuracion y la borra del INI.

end;
}

procedure TFMImportacionArticulosExcelArt.GuardarConfiguracion;
var
  ts : TStrings;
  Configuracion : string;
  i : integer;
begin
  /// Pregunta un nombre para la configuracino y la guarda en el INI.
  /// Si ya existe la reemplaza

  Configuracion := InputBox('Configuracion a Guardar', 'Nombre de la configuracion', '');
  if (Trim(Configuracion) > '') then
  begin
     ts := TStringList.Create();
     try
        for i := 1 to FieldsCount do
           ts.Values[Fields[i].ColLabel] := IntToStr(Fields[i].ColIndex);

        EscribeDatoIni('ConfiguracionImportacionArticulosExcel', Configuracion, ts.CommaText);
     finally
        ts.Free;
     end;
  end;

  LeerConfiguraciones;
end;

procedure TFMImportacionArticulosExcelArt.AGuardarConfiguracionExecute(Sender: TObject);
begin
  GuardarConfiguracion;
end;

procedure TFMImportacionArticulosExcelArt.MIConfiguracionClick(Sender: TObject);
var
  oini : TIniFile;
  ts : TStrings;
  Configuracion : TStrings;
  i, Campo : integer;
begin
  /// Aplica la configuracion de columnas

  // Primero borro los titulos asignados
  for i := 2 to sgDatosImportados.ColCount - 1 do
     sgDatosImportados.Cells[i, 0] := '';

  // Ahora asigno los titulos segun la configuracion
  with TMenuItem(Sender) do
  begin
     oini := TIniFile.Create(REntorno.FicheroINI);
     ts := TStringList.Create();
     Configuracion := TStringList.Create();
     try
        oini.ReadSectionValues('ConfiguracionImportacionArticulosExcel', Configuracion);
        ts.CommaText := Configuracion.Values[TMenuItem(Sender).Caption];

        // Leer configuracion y aplicar a columnas
        if (Trim(TMenuItem(Sender).Caption) > '') then
        begin
           for Campo := 1 to FieldsCount do
           begin
              Fields[Campo].ColIndex := StrToIntDef(ts.Values[Fields[Campo].ColLabel], -1);
              if ((Fields[Campo].ColIndex >= 2) and (Fields[Campo].ColIndex <= sgDatosImportados.ColCount - 1)) then
              begin
                 sgDatosImportados.Cells[Fields[Campo].ColIndex, 0] := '*' + Fields[Campo].ColLabel;
                 sgDatosImportados.ColWidths[Fields[Campo].ColIndex] := sgDatosImportados.Canvas.TextWidth(StringOfChar('w', Fields[Campo].LongTxt + 1));
              end;
           end;
        end;
     finally
        oini.Free;
        ts.Free;
     end;
  end;
end;

procedure TFMImportacionArticulosExcelArt.ADesasignarCampoExecute(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to FieldsCount do
     if (Fields[i].ColIndex = PopupColumn) then
     begin
        Fields[i].ColIndex := -1;
        sgDatosImportados.Cells[PopupColumn, 0] := '*';
     end;
  sgDatosImportados.Repaint;
end;

procedure TFMImportacionArticulosExcelArt.sgDatosImportadosDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  i : integer;
  CampoAsignado : boolean;
begin
  CampoAsignado := False;
  for i := 1 to FieldsCount do
     if (Fields[i].ColIndex = ACol) then
        CampoAsignado := True;

  with Sender as TStringGrid do
  begin
     if gdFocused in State then
     begin
        ColorFocused(Canvas);
        Canvas.DrawFocusRect(Rect);
     end
     else
     if gdFixed in State then
     begin
        with Canvas do
        begin
           Brush.Color := FixedColor;
           Font.Color := clWindowText;
        end;
     end
     else
     begin
        if (CampoAsignado) then
           Canvas.Brush.Color := clGreen
        else
           Canvas.Brush.Color := Color;
        Canvas.Font.Color := clWindowText;
     end;

     Canvas.FillRect(Rect);

     Canvas.TextOut(Rect.Left + 5, Rect.Top + 2, Cells[ACol, ARow]);
  end;
end;

end.
