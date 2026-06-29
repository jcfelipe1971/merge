unit UDMMonedasMaestros;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSetRW, FIBQuery, HYFIBQuery;

type
  TDMMonedasMaestros = class(TDataModule)
     TLocal: THYTransaction;
     QCambiaMoneda: THYFIBQuery;
     QCambiaMonedaTodos: THYFIBQuery;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameAgrupacionPrimeraCliente: string;
     procedure CambiaMonedas(Modo, Maestro: integer; Agrupacion, MonedaO, MonedaD: string);
     procedure CambiaMonedasTodos(Modo, Maestro: integer; Agrupacion, MonedaD: string);
  end;

var
  DMMonedasMaestros : TDMMonedasMaestros;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMMonedasMaestros.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

function TDMMonedasMaestros.DameAgrupacionPrimeraCliente: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(AGRUPACION) FROM EMP_AGRUPACIONES_CLI WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMonedasMaestros.CambiaMonedas(Modo, Maestro: integer; Agrupacion, MonedaO, MonedaD: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CAMBIA_MONEDAS_MAESTROS (:EMPRESA, :EJERCICIO, :CANAL, :MAESTRO, :MODO, :AGRUPACION, :MONEDAO, :MONEDAD)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MAESTRO'].AsInteger := Maestro;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['MONEDAO'].AsString := MonedaO;
        Params.ByName['MONEDAD'].AsString := MonedaD;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMonedasMaestros.CambiaMonedasTodos(Modo, Maestro: integer; Agrupacion, MonedaD: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CAMBIA_MONEDAS_MAESTROS_TODOS (:EMPRESA, :EJERCICIO, :CANAL, :MAESTRO, :MODO, :AGRUPACION, :MONEDAD)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MAESTRO'].AsInteger := Maestro;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['MONEDAD'].AsString := MonedaD;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
