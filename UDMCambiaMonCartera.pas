unit UDMCambiaMonCartera;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSetRW, FIBQuery, HYFIBQuery;

type
  TDMCambiaMonCartera = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CambiaMonedas(Signo: integer; TodosCanales: boolean; RegistroIni, RegistroFin: integer; MonedaOrigen, MonedaDestino: string);
     function DameMaximoRegistro(Signo: integer; TodosCanales: boolean): integer;
  end;

var
  DMCambiaMonCartera : TDMCambiaMonCartera;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMCambiaMonCartera.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMCambiaMonCartera.CambiaMonedas(Signo: integer; TodosCanales: boolean; RegistroIni, RegistroFin: integer; MonedaOrigen, MonedaDestino: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_CAMBIA_MONEDA (:EMPRESA, :EJERCICIO, :CANAL, :TODOS_CANALES, :MONEDA_ORI, :MONEDA_DEST, :REGISTRO_INI, :REGISTRO_FIN, :TIPO_SIGNO, :FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TODOS_CANALES'].AsInteger := BoolToInt(TodosCanales);
        Params.ByName['MONEDA_ORI'].AsString := MonedaOrigen;
        Params.ByName['MONEDA_DEST'].AsString := MonedaDestino;
        Params.ByName['REGISTRO_INI'].AsInteger := RegistroIni;
        Params.ByName['REGISTRO_FIN'].AsInteger := RegistroFin;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        if Signo = 0 then
           Params.ByName['TIPO_SIGNO'].AsString := 'C';
        if Signo = 1 then
           Params.ByName['TIPO_SIGNO'].AsString := 'P';
        if Signo = 2 then
           Params.ByName['TIPO_SIGNO'].AsString := 'T';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMCambiaMonCartera.DameMaximoRegistro(Signo: integer; TodosCanales: boolean): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT MAX(REGISTRO) FROM EMP_CARTERA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO ');

        if (Signo < 2) then
           SQL.Add(' AND SIGNO = ?SIGNO ');

        if not TodosCanales then
           SQL.Add(' AND CANAL = ?CANAL ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;

        if not TodosCanales then
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;

        if Signo = 0 then
           Params.ByName['SIGNO'].AsString := 'C';
        if Signo = 1 then
           Params.ByName['SIGNO'].AsString := 'P';

        ExecQuery;
        Result := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
