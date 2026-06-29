unit UExcel;

interface

uses
  ADODB, OleServer, Excel2000;

var
  WorkBook : _WorkBook;
  WorkSheet : _WorkSheet;
  LCID : integer;
  fila, col : integer;

function InicializarExcel: boolean;
function CerrarExcel: boolean;
function SalvarDatosEnExcel(Archivo: string): boolean;
function EscribirEnExcel(Fila, Columna: integer; Valor: variant): boolean;

implementation

function InicializarExcel: boolean;
begin
  Result := True;
  LCID := GetUserDefaultLCID;
  XLApp.DisplayAlerts[LCID] := False;
  XLApp.Connect;
  WorkBook := XLApp.Workbooks.Add(EmptyParam, LCID);
  WorkSheet := WorkBook.WorkSheets.Get_Item(1) as _WorkSheet;
  WorkSheet.Activate(LCID);
end;

function CerrarExcel: boolean;
begin
  Result := True;
  XLApp.Disconnect;
end;

function SalvarDatosEnExcel(Archivo: string): boolean;
var
  FileFormat : olevariant;
begin
  Result := True;
  try
     FileFormat := xlWorkbookNormal;
     if (LowerCase(ExtractFileExt(Archivo)) = '.csv') then
        FileFormat := xlCSV;
     WorkBook.SaveAs(Archivo, FileFormat, '', '', False, False, xlNoChange,
        xlLocalSessionChanges, True, 0, 0, LCID);
  except
     on E: Exception do
     begin
        ShowMessage(E.Message);
        Result := False;
     end;
  end;
end;

function EscribirEnExcel(Fila, Columna: integer; Valor: variant): boolean;
begin
  Result := True;
  WorkSheet.Cells.Item[Fila, Columna].NumberFormat := '@';
  WorkSheet.Cells.Item[Fila, Columna].Value := Valor;
end;


end.
 