unit UDMRecalculaConta;

interface

uses
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados;

type
  TDMRecalculaConta = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xAsientos: TFIBDataSetRO;
     xAsientosRIC: TIntegerField;
     DSxAsientos: TDataSource;
  private
     { Private declarations }
  public
     { Public declarations }
     function TotalAsientosRecal: integer;
     procedure BorraSaldos;
     procedure RecalculaAsiento(Ric: integer);
  end;

var
  DMRecalculaConta : TDMRecalculaConta;

implementation

uses
  UDMMain, HYFIBQuery, UEntorno;

{$R *.dfm}

{ TDMRecalculaConta }

procedure TDMRecalculaConta.BorraSaldos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM CON_CUENTAS_SALDOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecalculaConta.RecalculaAsiento(Ric: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_SALDOS_RECALCULA_ASI(:EMPRESA, :EJERCICIO, :CANAL, :RIC)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['RIC'].AsInteger := Ric;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMRecalculaConta.TotalAsientosRecal: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM CON_CUENTAS_ASIENTOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
