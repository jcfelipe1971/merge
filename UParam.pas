unit UParam;

interface

function LeeParametro(Param: string; Serie: string = ''): string;
function CheckNivelParametro(Param: string): boolean;
function CheckValorParametro(Param: string; Valor: string): boolean;

implementation

uses HYFIBQuery, UEntorno, UDMMain, FIBQuery, SysUtils, Dialogs;

function LeeParametro(Param: string; Serie: string = ''): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        AutoTrans := True;
        SQL.Text := 'EXECUTE PROCEDURE G_LEE_PARAMETRO(?EMPRESA, ?SERIE, ?USUARIO, ?PARAMETRO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        if Serie <> '' then
           Params.ByName['SERIE'].AsString := UpperCase(Serie);
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['PARAMETRO'].AsString := UpperCase(Param);
        ExecQuery;
        Result := FieldByName['VALOR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function CheckNivelParametro(Param: string): boolean;
var
  Nivel : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        AutoTrans := True;
        SQL.Text := 'SELECT NIVEL FROM SYS_PARAMETROS_DEFINICION WHERE (PARAMETRO = ?PARAMETRO)';
        Params.ByName['PARAMETRO'].AsString := Param;
        ExecQuery;
        Nivel := FieldByName['NIVEL'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := True;
  if Nivel > REntorno.Nivel then
  begin
     Result := False;
     MessageDlg('Nivel insuficiente', mtWarning, [mbOK], 0);
     abort;
  end;
end;

function CheckValorParametro(Param: string; Valor: string): boolean;
var
  Tipo, Valores_Posibles, Msg : string;
  Longitud : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        AutoTrans := True;
        SQL.Text := 'SELECT TIPO, LONGITUD, VALORES_POSIBLES FROM SYS_PARAMETROS_DEFINICION WHERE (PARAMETRO = ?PARAMETRO)';
        Params.ByName['PARAMETRO'].AsString := Param;
        ExecQuery;
        Tipo := FieldByName['TIPO'].AsString;
        Valores_Posibles := FieldByName['VALORES_POSIBLES'].AsString;
        Longitud := FieldByName['LONGITUD'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Msg := '';
  if ((Tipo = 'N') and (Valor <> '0') and (StrToIntDef(Valor, -999999) = -999999)) then
     Msg := 'El valor debe ser numérico';
  if (Tipo = 'A') and (Length(Trim(Valor)) > Longitud) then
     Msg := 'Longitud Incorrecta';
  if tipo = 'V' then
     if Pos(Valor, Valores_Posibles) = 0 then
        Msg := 'Valor fuera de rango';

  if Msg <> '' then
  begin
     MessageDlg(Msg, mtError, [mbOK], 0);
     Result := False;
     abort;
  end
  else
     Result := True;
end;

end.
