unit UHTMLInf;

interface

uses Classes, Windows, DB;

const
  ihInicio = 0;
  ihFin = 1;
  ihTopeTotales = 50;

type
  TihPosBloque = ihInicio..ihFin;

  tInfHTML = class(TObject)
  private
     FHojaEstilos, FPagina, FLstTmp: TStringList;
     FDir, FArchivo: string;
     FTotal: array[1..ihTopeTotales] of double;
     FLinea: string;
     FHeGrabado, FHojaExterna: boolean;
     procedure CreaHojaEstilos; dynamic;
     function GetTemp: string;
     function GetTotal(i: integer): double;
     procedure SetTotal(i: integer; const Value: double);
     function GetDir: string;
     procedure SetDir(const Value: string);
     function GetHayTemporal: boolean;
     procedure SetHojaExterna(const Value: boolean);
  public
     Fto1, Fto2, Fto3: string;
     GuardandoTemporales: boolean;
     LineasEnTemporal: integer;
     LineasTotales: integer;
     constructor Create(Titulo: string = '');
     destructor Destroy; override;

     procedure CreaCabeceraCompleta(Titulo: string); dynamic;
     procedure Pie;
     function Graba: boolean;
     function LanzaInforme(hndl: HWND): boolean;
     function GuardaTemporal: integer;

     procedure Limite(Etiqueta, Valor: string); overload;
     procedure Limite(bloque: TihPosBloque); overload;

     procedure Add(Valor: string);
     procedure TD(Valor: string; id: string = ''; colspan: integer = 0);
     procedure TH(Valor: string; id: string = ''; colspan: integer = 0; Mas: string = '');
     procedure TR(id: string = ''; Mas: string = ''); overload;
     procedure TR(bloque: TihPosBloque); overload;

     function ArreglaStr(Tit: string): string;
     function Formatea(Tipo: integer; Valor: double): string;
     function Incremento(Val1, Val2: double): string;
     function Comparativo(Act, Ant: double): string;
     function Peso(Act, Total: double; var Acum: double): string; overload;
     function Peso(Act, Total: double; iTot: integer): string; overload;
     procedure BorraTotales(hasta: integer = 0);
     procedure Acumula(Valor: double; iTot: integer);
     function Busca(id: string; var Valor: double): boolean;
     procedure Reemplaza(id: string; Valor: string);

     property Pag: TStringList Read FPagina Write FPagina;
     property Total[i: integer]: double Read GetTotal Write SetTotal;
     property Directorio: string Read GetDir Write SetDir;
     property ListaTemporales: TStringList Read FLstTmp Write FLstTmp;
     property HayTemporal: boolean Read GetHayTemporal;
     property Archivo: string Read FArchivo;
     property HojaExterna: boolean Read FHojaExterna Write SetHojaExterna;
  end;

  tLstHTML = class(tInfHTML)
  private
     procedure CreaHojaEstilos; override;
  public
     procedure CreaCabeceraCompleta(Titulo: string); override;
     function GeneraInforme(Datos: TDataSource): boolean;
  end;

implementation

uses SysUtils, ShellApi;

{ tInfHTML }

procedure tInfHTML.Acumula(Valor: double; iTot: integer);
begin
  if ((iTot > 0) and (iTot <= ihTopeTotales)) then
     FTotal[iTot] := FTotal[iTot] + Valor;
end;

procedure tInfHTML.Add(Valor: string);
begin
  FPagina.Add(Valor);
  if GuardandoTemporales and (FPagina.Count > LineasEnTemporal) then
     GuardaTemporal;
end;

function tInfHTML.ArreglaStr(Tit: string): string;
begin
  Result := Tit;
  Result := StringReplace(Result, ' ', '&nbsp;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ñ', '&Ntilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ñ', '&ntilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'º', '&ordm;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ª', '&ordf;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Á', '&Aacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'É', '&Eacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Í', '&Iacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ó', '&Oacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ú', '&Uacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'á', '&aacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'é', '&eacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'í', '&iacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ó', '&oacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ú', '&uacute;', [rfReplaceAll]);
end;

procedure tInfHTML.BorraTotales(hasta: integer);
var
  i : integer;
begin
  if hasta = 0 then
     hasta := ihTopeTotales;
  for i := 1 to hasta do
     FTotal[i] := 0;
end;

function tInfHTML.Busca(id: string; var Valor: double): boolean;
var
  i, p : integer;
  linea, trozo : string;
begin
  Result := False;
  Valor := 0;
  for i := 0 to FPagina.Count - 1 do
  begin
     linea := FPagina[i];
     p := Pos('<TD id=' + id, linea);
     if p > 0 then
     begin
        Result := True;
        trozo := Copy(Linea, p, Length(Linea));
        p := Pos('>', trozo);
        trozo := Copy(trozo, p + 1, Length(trozo));
        p := Pos('<', trozo);
        trozo := Copy(trozo, 1, p - 1);
        try
           Valor := StrToFloat(trozo);
        except
           Valor := 0;
        end;
     end;
     if Result then
        Break;
  end;
end;

function tInfHTML.Comparativo(Act, Ant: double): string;
var
  Valor : double;
begin
  Valor := 0;
  //Redondeo antes (a 6 dec.) porque si no puede dar problemas con muchos decimales
  Act := Round(Act * 1000000) / 1000000;
  Ant := Round(Ant * 1000000) / 1000000;
  if ((Act <> 0) and (Ant <> 0)) then
     Valor := (Act - Ant) / Ant * 100;
  Valor := Round(Valor * 100) / 100;
  Result := Formatea(2, Valor);
end;

procedure tInfHTML.CreaCabeceraCompleta(Titulo: string);
begin
  with FPagina do
  begin
     Clear;
     Add('<HTML><HEAD>');
     Add('<TITLE>' + Titulo + '</TITLE>');
     Add('<LINK REL="stylesheet" TYPE="text/css" HREF="style.css">');
     Add('</HEAD>');
     Add('<BODY>');
     Add('<DIV id=contenedor>');
     Add('<DIV id=titulo>');
     Add(ArreglaStr(Titulo));
     Add('</DIV>');
  end;
end;

procedure tInfHTML.CreaHojaEstilos;
begin
  with FHojaEstilos do
  begin
     Clear;
     Add('BODY {');
     Add('	FONT-SIZE: 8pt;');
     Add('	FONT-FAMILY: tahoma,arial,helvetica,sans-serif;');
     Add('	BACKGROUND-COLOR: #fffffa;');
     Add('}');
     Add('DIV {');
     Add('       MARGIN-BOTTOM: 5px');
     Add('}');
     Add('#titulo {');
     Add('       WIDTH: 100%;');
     Add('	FONT-SIZE: 12pt;');
     Add('       TEXT-ALIGN: center;');
     Add('       FONT-WEIGHT: bold;');
     Add('       TEXT-DECORATION: underline;');
     Add('}');
     Add('TABLE {');
     Add('       FONT-SIZE: 8pt;');
     Add('       FONT-FAMILY: tahoma,arial,helvetica,sans-serif;');
     Add('       BORDER-COLLAPSE: collapse;');
     Add('}');
     Add('TD {');
     Add('	BORDER: 1px solid #000;');
     Add('	PADDING: 1px;');
     Add('}');
     Add('TH {');
     Add('	BORDER: 1px solid #000;');
     Add('	PADDING: 1px;');
     Add('	BACKGROUND-COLOR: #99CC00;');
     Add('}');
     Add('#datos TH {');
     Add('       TEXT-ALIGN: center;');
     Add('       FONT-WEIGHT: bold;');
     Add('	PADDING: 5px 2px 5px 2px;');
     Add('}');
     Add('#limites TH {');
     Add('       WIDTH: 100px;');
     Add('       TEXT-ALIGN: left;');
     Add('       FONT-WEIGHT: bold;');
     Add('}');
     Add('#limites TD {');
     Add('       WIDTH: 200px;');
     Add('}');
     Add('#nb {');
     Add('	BORDER: 0;');
     Add('	BACKGROUND-COLOR: #fffffa;');
     Add('}');
     Add('#titrow {');
     Add('	BACKGROUND-COLOR: #FFCC99;');
     Add('}');
     Add('.titrow {');
     Add('	BACKGROUND-COLOR: #FFCC99;');
     Add('}');
     Add('#imp {');
     Add('	TEXT-ALIGN: right;');
     Add('}');
     Add('.imp {');
     Add('	TEXT-ALIGN: right;');
     Add('}');
     Add('#imp1 {');
     Add('	TEXT-ALIGN: right;');
     Add('	WIDTH: 60px;');
     Add('}');
  end;
end;

constructor tInfHTML.Create(Titulo: string);
begin
  Fto1 := '#,##0';
  Fto2 := '#0.00';
  Fto3 := '#,##0.00';
  FHojaEstilos := TStringList.Create;
  FPagina := TStringList.Create;
  FLstTmp := TStringList.Create;
  GuardandoTemporales := False;
  LineasEnTemporal := 5000;
  LineasTotales := 0;
  FHojaExterna := True;
  CreaHojaEstilos;
  if Titulo <> '' then
     CreaCabeceraCompleta(Titulo);
end;

destructor tInfHTML.Destroy;
begin
  FHojaEstilos.Free;
  FPagina.Free;
  FLstTmp.Free;
  inherited;
end;

function tInfHTML.Formatea(Tipo: integer; Valor: double): string;
begin
  Result := '';
  case Tipo of
     1: Result := FormatFloat(Fto1, Valor);
     2: Result := FormatFloat(Fto2, Valor);
     3: Result := FormatFloat(Fto3, Valor);
  end;
end;

function tInfHTML.GetDir: string;
var
  Buffer : array[0..MAX_PATH] of char;
  ftmp : string;
begin
  if FDir = '' then
  begin
     GetTempPath(SizeOf(Buffer) - 1, Buffer);
     SetString(FDir, Buffer, StrLen(Buffer));
     FDir := IncludeTrailingPathDelimiter(FDir) + 'Pegasus';
     if not (DirectoryExists(FDir)) then
        CreateDir(FDir);
     GetTempFileName(PChar(FDir), 'INF', 0, Buffer);
     SetString(ftmp, Buffer, StrLen(Buffer));
     FDir := ChangeFileExt(ftmp, '');
     DeleteFile(ftmp);
     if not (DirectoryExists(FDir)) then
        CreateDir(FDir);
  end;
  Result := FDir;
end;

function tInfHTML.GetHayTemporal: boolean;
begin
  Result := (FLstTmp.Count > 0);
end;

function tInfHTML.GetTemp: string;
var
  Buffer : array[0..MAX_PATH] of char;
begin
  GetTempFileName(PChar(Directorio), 'TMP', 0, Buffer);
  SetString(Result, Buffer, StrLen(Buffer));
end;

function tInfHTML.GetTotal(i: integer): double;
begin
  Result := 0;
  if ((i > 0) and (i < ihTopeTotales)) then
     Result := FTotal[i];
end;

function tInfHTML.Graba: boolean;

  procedure Concatena;
  var
     fOri, fDes : TextFile;
     linea : string;
     i : integer;
  begin
     AssignFile(fDes, FArchivo);
     Rewrite(fDes);
     for i := 0 to FLstTmp.Count - 1 do
     begin
        AssignFile(fOri, FLstTmp[i]);
        Reset(fOri);
        while not (EOF(fOri)) do
        begin
           Readln(fOri, linea);
           Writeln(fDes, linea);
        end;
        CloseFile(fOri);
        DeleteFile(FLstTmp[i]);
     end;
     CloseFile(fDes);
     FLstTmp.Clear;
  end;

begin
  try
     if FHojaExterna then
        FHojaEstilos.SaveToFile(Directorio + '\style.css');
     FArchivo := Directorio + '\Informe.html';
     if HayTemporal then
     begin
        GuardaTemporal;
        Concatena;
     end
     else
     begin
        FPagina.SaveToFile(FArchivo);
        LineasTotales := LineasTotales + FPagina.Count;
     end;
     Result := True;
     FHeGrabado := True;
  except
     FHeGrabado := False;
     Result := False;
  end;
end;

function tInfHTML.GuardaTemporal: integer;
var
  Fic : string;
begin
  Fic := GetTemp();
  Result := FLstTmp.Add(Fic);
  LineasTotales := LineasTotales + FPagina.Count;
  FPagina.SaveToFile(Fic);
  FPagina.Clear;
  FreeAndNil(FPagina);
  FPagina := TStringList.Create;
end;

function tInfHTML.Incremento(Val1, Val2: double): string;
var
  Valor : double;
begin
  Valor := 0;
  //Redondeo antes (a 6 dec.) porque si no puede dar problemas con muchos decimales
  Val1 := Round(Val1 * 1000000) / 1000000;
  Val2 := Round(Val2 * 1000000) / 1000000;
  if Val1 <> 0 then
     Valor := (Val2 * 100 / Val1);
  Valor := Round(Valor * 100) / 100;
  Result := Formatea(2, Valor);
end;

function tInfHTML.LanzaInforme(hndl: HWND): boolean;
begin
  Result := False;
  if not (FHeGrabado) then
     Graba;
  if FHeGrabado then
  begin
     Result := True;
     ShellExecute(hndl, nil, PChar(FArchivo), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure tInfHTML.Limite(Etiqueta, Valor: string);
begin
  with FPagina do
  begin
     Add('<TR>');
     Add('<TH>' + ArreglaStr(Etiqueta + ' ') + '</TH>');
     Add('<TD>' + ArreglaStr(Valor + ' ') + '</TD>');
     Add('</TR>');
  end;
end;

procedure tInfHTML.Limite(bloque: TihPosBloque);
begin
  with FPagina do
  begin
     case bloque of
        ihInicio:
        begin
           Add('<DIV id=limites>');
           Add('<TABLE>');
           Add('<COLGROUP>');
           Add('<COL>');
           Add('<COL id=titrow>');
        end;
        ihFin:
        begin
           Add('</TABLE>');
           Add('</DIV>');
        end;
     end;
  end;
end;

function tInfHTML.Peso(Act, Total: double; var Acum: double): string;
var
  Valor : double;
begin
  Valor := 0;
  //Redondeo antes (a 6 dec.) porque si no puede dar problemas con muchos decimales
  Act := Round(Act * 1000000) / 1000000;
  Total := Round(Total * 1000000) / 1000000;
  if Total <> 0 then
     Valor := Act * 100 / Total;
  Acum := Acum + Valor;
  Valor := Round(Valor * 100) / 100;
  Result := Formatea(2, Valor);
end;

function tInfHTML.Peso(Act, Total: double; iTot: integer): string;
var
  Acum : double;
begin
  Result := Peso(Act, Total, Acum);
  FTotal[iTot] := FTotal[iTot] + Acum;
end;

procedure tInfHTML.Pie;
begin
  with FPagina do
  begin
     Add('</DIV>');
     Add('</BODY></HTML>');
  end;
end;

procedure tInfHTML.Reemplaza(id: string; Valor: string);
var
  i, p : integer;
  linea, trozo : string;
  Encontrado : boolean;
begin
  Encontrado := False;
  for i := 0 to FPagina.Count - 1 do
  begin
     linea := FPagina[i];
     p := Pos('<TD id=' + id, linea);
     if p > 0 then
     begin
        Encontrado := True;
        trozo := Copy(linea, p, Length(Linea));
        linea := Copy(linea, 1, p - 1);
        p := Pos('>', trozo);
        trozo := Copy(trozo, p + 1, Length(trozo));
        p := Pos('<', trozo);
        trozo := Copy(trozo, p, Length(trozo));
        linea := linea + '<TD>' + Valor + trozo;
        FPagina[i] := linea;
     end;
     if Encontrado then
        Break;
  end;
end;

procedure tInfHTML.SetDir(const Value: string);
var
  Buffer : array[0..MAX_PATH] of char;
  fTmp, dTmp : string;

begin
  if Value <> FDir then
  begin
     dTmp := ExcludeTrailingPathDelimiter(Value);
     if not (DirectoryExists(dTmp)) then
        CreateDir(dTmp);
     if DirectoryExists(dTmp) then
     begin
        GetTempFileName(PChar(dTmp), 'INF', 0, Buffer);
        SetString(fTmp, Buffer, StrLen(Buffer));
        FDir := ChangeFileExt(fTmp, '');
        DeleteFile(fTmp);
        if not (DirectoryExists(FDir)) then
           if not (CreateDir(FDir)) then
              FDir := '';
     end;
  end;
end;

procedure tInfHTML.SetHojaExterna(const Value: boolean);
var
  x, i : integer;
begin
  if FHojaExterna <> Value then
  begin
     FHojaExterna := Value;
     if FHojaExterna then
     begin
        x := FPagina.IndexOf('<STYLE TYPE="text/css">');
        if x >= 0 then
           repeat
              FPagina.Delete(x);
           until (x >= FPagina.Count) or (FPagina[x] = '</STYLE>');
        FPagina[x] := '<LINK REL="stylesheet" TYPE="text/css" HREF="style.css">';
     end
     else
     begin
        x := FPagina.IndexOf('<LINK REL="stylesheet" TYPE="text/css" HREF="style.css">');
        if x >= 0 then
        begin
           FPagina.Delete(x);
           FPagina.Insert(x, '</STYLE>');
           for i := FHojaEstilos.Count - 1 downto 0 do
              FPagina.Insert(x, FHojaEstilos[i]);
           FPagina.Insert(x, '<STYLE TYPE="text/css">');
        end;
     end;
  end;
end;

procedure tInfHTML.SetTotal(i: integer; const Value: double);
begin
  if ((i > 0) and (i < ihTopeTotales)) then
     FTotal[i] := Value;
end;

procedure tInfHTML.TD(Valor, id: string; colspan: integer);
var
  Res : string;
begin
  Res := '<TD';
  if id <> '' then
     Res := Res + ' id=' + id;
  if colspan <> 0 then
     Res := Res + ' colspan=' + IntToStr(colspan);
  Res := Res + '>' + ArreglaStr(Valor) + '</TD>';
  FLinea := FLinea + Res;
end;

procedure tInfHTML.TH(Valor, id: string; colspan: integer; Mas: string);
var
  Res : string;
begin
  Res := '<TH';
  if id <> '' then
     Res := Res + ' id=' + id;
  if colspan <> 0 then
     Res := Res + ' colspan=' + IntToStr(colspan);
  if Mas <> '' then
     Res := Res + ' ' + Mas;
  Res := Res + '>' + ArreglaStr(Valor) + '</TH>';
  FLinea := FLinea + Res;
end;

procedure tInfHTML.TR(id: string = ''; Mas: string = '');
begin
  TR(ihFin);
  FLinea := '<TR';
  if id <> '' then
     FLinea := FLinea + ' id=' + id;
  if Mas <> '' then
     FLinea := FLinea + ' ' + Mas;
  FLinea := FLinea + '>';
end;

procedure tInfHTML.TR(bloque: TihPosBloque);
begin
  case bloque of
     ihInicio: TR('', '');
     ihFin:
     begin
        if FLinea <> '' then
           Self.Add(FLinea + '</TR>');
        FLinea := '';
     end;
  end;
end;

{ tLstHTML }

procedure tLstHTML.CreaCabeceraCompleta(Titulo: string);
begin
  inherited;
  with FPagina do
  begin
     Clear;
     Add('<HTML><HEAD>');
     Add('<TITLE>' + Titulo + '</TITLE>');
     Add('<LINK REL="stylesheet" TYPE="text/css" HREF="style.css">');
     Add('</HEAD>');
     Add('<BODY>');
     Add('<DIV id=datos>');
     Add('<TABLE><CAPTION>' + ArreglaStr(Titulo) + '</CAPTION>');
  end;
end;

procedure tLstHTML.CreaHojaEstilos;
begin
  with FHojaEstilos do
  begin
     Clear;
     Add('BODY {');
     Add('	FONT-SIZE: 9px; FONT-FAMILY: tahoma,arial,helvetica,sans-serif');
     Add('}');
     Add('CAPTION {');
     Add('       PADDING-RIGHT: 0px;');
     Add('       PADDING-LEFT: 0px;');
     Add('       BACKGROUND: #f2f3f4;');
     Add('       PADDING-BOTTOM: 3px;');
     Add('       PADDING-TOP: 3px;');
     Add('       BORDER-BOTTOM: #666 2px solid;');
     Add('}');
     Add('TABLE {');
     Add('	WIDTH: 100%;');
     Add('       BORDER-COLLAPSE: collapse;');
     Add('}');
     Add('TD {');
     Add('	FONT-SIZE: 10px;');
     Add('	BORDER: 1px solid;');
     Add('	PADDING: 3px;');
     Add('}');
     Add('TH {');
     Add('	FONT-SIZE: 11px;');
     Add('}');
     Add('TH A {');
     Add('       CURSOR: help;');
     Add('}');
     Add('#imp {');
     Add('	TEXT-ALIGN: right;');
     Add('}');
  end;
end;

function tLstHTML.GeneraInforme(Datos: TDataSource): boolean;
var
  x : integer;
begin
  Result := False;
  with Datos.DataSet do
  begin
     Add('<COLGROUP>');
     for x := 0 to FieldCount - 1 do
        if Fields[x].Visible then
           if Fields[x] is TStringField then
              Add('<COL>')
           else
              Add('<COL id=imp>');
     TR;
     for x := 0 to FieldCount - 1 do
        if Fields[x].Visible then
           TH(Fields[x].DisplayLabel);
     TR(ihFin);
     while not (EOF) do
     begin
        TR;
        for x := 0 to FieldCount - 1 do
           if Fields[x].Visible then
              if Fields[x] is TStringField then
                 TD(Fields[x].AsString)
              else
              if Fields[x] is TDateTimeField then
                 TD(DateToStr(Fields[x].AsDateTime))
              else
              if Fields[x] is TBlobField then
                 TD(Fields[x].AsString)
              else
                 TD(FormatFloat(TNumericField(Fields[x]).DisplayFormat, Fields[x].AsFloat));
        TR(ihFin);
        Next;
     end;
     Add('</TABLE>');
     Add('</DIV>');
     Pie;
  end;
end;

end.
