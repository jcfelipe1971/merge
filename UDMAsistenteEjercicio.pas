unit UDMAsistenteEjercicio;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery;

type
  TDMAsistenteEjercicio = class(TDataModule)
     TLocal: THYTransaction;
     QCreaEjercicio: THYFIBQuery;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function CheckEjercicio(Ejercicio: smallint): boolean;
     function DameMaxEjercicio(Empresa: smallint): smallint;
     function DameMaxEjercicioContable(Empresa, Ejercicio: smallint): smallint;
     procedure TraspasaCuentas(Empresa, Ejercicio, EjercicioDes: smallint; modo: integer);
     procedure TraspasaCondiciones(Empresa, Ejercicio, EjercicioDes: smallint);
     procedure TraspasaListados(Empresa, Ejercicio, EjercicioDes: smallint);
     procedure TraspasaPerfiles(Empresa, Ejercicio, EjercicioDes: smallint);
     procedure TraspasaTarifasProv(Empresa, Ejercicio, EjercicioDes: smallint);
     procedure TraspasaCampanyas(Empresa, Ejercicio, EjercicioDes: smallint);
     procedure TraspasaGenericos(Empresa, Ejercicio, EjercicioDes: smallint);
     procedure TraspasaPromociones(Empresa, Ejercicio, EjercicioDes: smallint);
     procedure TraspasaPrecioCosteKri(Empresa, Ejercicio, EjercicioDes: smallint);
  end;

var
  DMAsistenteEjercicio : TDMAsistenteEjercicio;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMAsistenteEjercicio.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

function TDMAsistenteEjercicio.CheckEjercicio(Ejercicio: smallint): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT EJERCICIO FROM GEN_EJERCICIOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        ExecQuery;
        Result := (FieldByName['EJERCICIO'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAsistenteEjercicio.DameMaxEjercicio(Empresa: smallint): smallint;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(EJERCICIO) FROM GEN_EJERCICIOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        ExecQuery;
        Result := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAsistenteEjercicio.DameMaxEjercicioContable(Empresa, Ejercicio: smallint): smallint;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(C.EJERCICIO) FROM CON_CUENTAS_NIVELES C ');
        SQL.Add(' JOIN EMP_CANALES E ON C.EMPRESA = E.EMPRESA AND C.EJERCICIO = E.EJERCICIO AND C.CANAL = E.CANAL ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO <> :EJERCICIO AND ');
        SQL.Add(' C.NIVEL > 4 AND ');
        SQL.Add(' E.ACTIVO <> 0 ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        ExecQuery;
        Result := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaCampanyas(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASO_CAMPANYAS(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaCondiciones(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRS_CONDICIONES_ESPECIALES_TODO(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO, 1, 0)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaCuentas(Empresa, Ejercicio, EjercicioDes: smallint; modo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_PROPAGA_EJER_TODO_MC(:EMPRESA, :O_EJERCICIO, 0, :D_EJERCICIO, :MODO, 0)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        Params.ByName['MODO'].AsInteger := Modo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaGenericos(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_GENERICOS(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaListados(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_LISTADOS_EJER_TODOC(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaPerfiles(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_PERFILES_EJER_TODOC(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaTarifasProv(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_TARIFAS_PROV_EJER_T_C(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaPromociones(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRS_PROMOCIONES_TODO(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteEjercicio.TraspasaPrecioCosteKri(Empresa, Ejercicio, EjercicioDes: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_PCOSTE_ARTICULOS(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
