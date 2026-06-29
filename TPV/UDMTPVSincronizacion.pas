unit UDMTPVSincronizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBQuery, HYFIBQuery, FIBDatabase,
  UFIBModificados, FIBDataSetRO;

type
  TDMTPVSincronizacion = class(TDataModule)
     DBDestino: THYDatabase;
     TOrigen: THYTransaction;
     TDestino: THYTransaction;
     QDestino: THYFIBQuery;
     QOrigen: TFIBDataSetRO;
     DSQOrigen: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function dameSesionASincronizar: integer;
     function VerificaSiExisteTercero(NIF: string): integer;
     procedure CreaTerceroEnDestino(NIF, NombreCliente: string);
     function ExisteTicket(RIT: integer): boolean;
     function VerificaSiExisteLineaTicket(RIT, Linea: integer): integer;
     function VerificaSiExisteDetalleTicketenFP(RIT: integer; Forma_pago: string): integer;
     function VerificaSiExisteSesionCajaTurnoFP(Sesion, Caja, Turno: integer; Forma_pago: string): integer;
     function VerificaSiExisteSesionCajaTurno(Sesion, Caja, Turno: integer): integer;
  end;

var
  DMTPVSincronizacion : TDMTPVSincronizacion;

implementation

uses
  UDMMain, UEntorno, Dialogs;

{$R *.dfm}

procedure TDMTPVSincronizacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

function TDMTPVSincronizacion.dameSesionASincronizar: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DBDestino;
        SQL.Text :=
           'SELECT FIRST 1 SESION FROM GES_TPV_SESIONES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ' +
           'CANAL = :CANAL AND SERIE = :SERIE AND ABIERTA = 1 ORDER BY SESION DESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        ExecQuery;
        if (FieldByName['SESION'].isNull) then
           Result := -1
        else
           Result := FieldByName['SESION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTPVSincronizacion.VerificaSiExisteTercero(NIF: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DBDestino;
        SQL.Text := 'SELECT COUNT(*) EXISTE FROM SYS_TERCEROS WHERE NIF=:NIF';
        Params.ByName['NIF'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['EXISTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTPVSincronizacion.CreaTerceroEnDestino(NIF, NombreCliente: string);
begin

end;

function TDMTPVSincronizacion.ExisteTicket(RIT: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        //VERIFICAR CONEXION
        DataBase := DBDestino;
        SQL.Text := 'SELECT RIT FROM GES_TICKET_CABECERA WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND ' +
           'CANAL=:CANAL AND SERIE=:SERIE AND TIPO=:TIPO AND RIT=:RIT ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['TIPO'].AsString := 'TIC';
        Params.ByName['RIT'].AsInteger := RIT;
        ExecQuery;
        Result := (FieldByName['RIT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTPVSincronizacion.VerificaSiExisteLineaTicket(RIT, Linea: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        //VERIFICAR CONEXION
        DataBase := DBDestino;
        SQL.Text := 'SELECT COUNT(*) EXISTE FROM GES_TICKET_DETALLE WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ' +
           'CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND RIT = :RIT AND LINEA=:LINEA ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['TIPO'].AsString := 'TIC';
        Params.ByName['RIT'].AsInteger := RIT;
        Params.ByName['LINEA'].AsInteger := Linea;
        ExecQuery;
        Result := FieldByName['EXISTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTPVSincronizacion.VerificaSiExisteDetalleTicketenFP(RIT: integer; Forma_pago: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        //VERIFICAR CONEXION
        DataBase := DBDestino;
        SQL.Text := 'SELECT COUNT(*) EXISTE FROM GES_TICKET_FP WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND ' +
           'CANAL=:CANAL AND SERIE=:SERIE AND TIPO=:TIPO AND RIT=:RIT AND FORMA_PAGO=:FORMA_PAGO ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['TIPO'].AsString := 'TIC';
        Params.ByName['RIT'].AsInteger := RIT;
        Params.ByName['FORMA_PAGO'].AsString := Forma_pago;
        ExecQuery;
        Result := FieldByName['EXISTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTPVSincronizacion.VerificaSiExisteSesionCajaTurnoFP(Sesion, Caja, Turno: integer; Forma_pago: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        //VERIFICAR CONEXION
        DataBase := DBDestino;
        SQL.Text := 'SELECT COUNT(*) EXISTE  FROM GES_TPV_SESIONES_CAJAS_TURNO_FP WHERE ' +
           'EMPRESA=:EMPRESA AND ejercicio = :EJERCICIO AND CANAL=:CANAL and ' +
           'SERIE=:SERIE AND SESION=:SESION AND CAJA=:CAJA AND TURNO=:TURNO AND FORMA_PAGO=:FORMA_PAGO ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := Sesion;
        Params.ByName['CAJA'].AsInteger := Caja;
        Params.ByName['TURNO'].AsInteger := Turno;
        Params.ByName['FORMA_PAGO'].AsString := Forma_pago;
        ExecQuery;
        Result := FieldByName['EXISTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTPVSincronizacion.VerificaSiExisteSesionCajaTurno(Sesion, Caja, Turno: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        //VERIFICAR CONEXION
        DataBase := DBDestino;
        SQL.Text := 'SELECT COUNT(*)EXISTE FROM GES_TPV_SESIONES_CAJAS_TURNO WHERE ' +
           'EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ' +
           'SERIE = :SERIE AND SESION = :SESION AND CAJA = :CAJA AND TURNO = :TURNO ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := Sesion;
        Params.ByName['CAJA'].AsInteger := Caja;
        Params.ByName['TURNO'].AsInteger := Turno;
        ExecQuery;
        Result := FieldByName['EXISTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
