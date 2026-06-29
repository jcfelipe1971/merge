unit UUtilesFR;

interface

uses Classes, SysUtils, Forms, Windows, Variants, FR_Class;

type
  TfrLocale = class
  private
     FDllHandle: THandle;
     FLoaded: boolean;
     FLocalizedPropertyNames: boolean;
     FOnLocalize: TLocalizeEvent;
     FIDEMode: boolean;
  public
     constructor Create;
     procedure LoadDll(Name: string);
     procedure UnloadDll;
     property LocalizedPropertyNames: boolean Read FLocalizedPropertyNames Write FLocalizedPropertyNames;
     property OnLocalize: TLocalizeEvent Read FOnLocalize Write FOnLocalize;
  end;

  TfrGlobals = class
  public
     constructor Create;
     destructor Destroy; override;
  end;

var
  frGlobals : TfrGlobals;

implementation

type
  TfrSeparaString = class(TfrFunctionLibrary)
  public
     constructor Create; override;
     procedure DoFunction(FNo: integer; p1, p2, p3: variant; var val: variant); override;
  end;

{ TfrLocale }

constructor TfrLocale.Create;
begin
  FIDEMode := AnsiUpperCase(ExtractFileName(Application.ExeName)) = 'DELPHI32.EXE';
end;

procedure TfrLocale.LoadDll(Name: string);
begin
  if FLoaded then
     UnloadDll;
  FDllHandle := LoadLibrary(PChar(Name));
  FLoaded := FDllHandle <> HINSTANCE_ERROR;
end;

procedure TfrLocale.UnloadDll;
begin
  if FLoaded then
     FreeLibrary(FDllHandle);
  FLoaded := False;
end;

{ TfrGlobals }

constructor TfrGlobals.Create;
begin
  frRegisterFunctionLibrary(TfrSeparaString);
end;

destructor TfrGlobals.Destroy;
begin
  frUnRegisterFunctionLibrary(TfrSeparaString);
  inherited Destroy;
end;

{TSeparaString}

constructor TfrSeparaString.Create;
begin
  inherited Create;
  with List do
  begin
     Add('SEP_STRING');
  end;
  AddFunctionDesc('SEP_STRING', 'Merge', 'SEP_STRING(<Separador>, <Num>, <Cadena>)/Devuelve la Subnota del Num indicado.');
end;

function SeparaString(Sep: string; Num: integer; Cadena: string): string;
var
  i, CadenaL, PosSep : integer;
begin
  for i := 1 to Num do
  begin
     CadenaL := Length(Cadena);
     if (Sep = '#13#10') then
     begin
        if (Pos(#13#10, Cadena) = 0) then
           PosSep := CadenaL
        else
           PosSep := Pos(#13#10, Cadena) - 1;

        Result := Copy(Cadena, 1, PosSep);
        Cadena := Copy(Cadena, PosSep + 3, CadenaL);
     end
     else
     begin
        if (Pos(Sep, Cadena) = 0) then
           PosSep := CadenaL
        else
           PosSep := Pos(Sep, Cadena) - 1;

        Result := Copy(Cadena, 1, PosSep);
        Cadena := Copy(Cadena, PosSep + Length(Sep) + 1, CadenaL);
     end;
  end;
end;

procedure TfrSeparaString.DoFunction(FNo: integer; p1, p2, p3: variant; var val: variant);
begin
  case FNo of
     0: val := SeparaString(frParser.Calc(p1), frParser.Calc(p2), frParser.Calc(p3));
  end;
end;

initialization
  frGlobals := TfrGlobals.Create;

finalization
  frGlobals.Free;
  frGlobals := nil;

end.
