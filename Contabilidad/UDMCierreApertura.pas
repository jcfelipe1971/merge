unit UDMCierreApertura;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Controls, Forms, Dialogs,
  FIBQuery, DB, FIBDataSet, FIBDatabase, UFIBModificados, HYFIBQuery,
  FIBDataSetRO, FIBTableDataSetRO, SysUtils;

type
  TDMCierreApertura = class(TDataModule)
     TLocal: THYTransaction;
     xEjercicioActivo: TFIBDataSetRO;
     xCompNivel: TFIBDataSetRO;
     TUpdate: THYTransaction;
     procedure DMCierreAperturaCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CreaRegularizacion(cuenta: string);
     procedure CreaAmortizaciones;
     procedure BorraRegularizacion;
     procedure CreaCierre;
     procedure BorraCierre;
     function CreaApertura: boolean;
     procedure BorraApertura;
     procedure TraspasaCuentas;
     procedure TraspasoInmovilizado;
     function DameRIC(Tipo: string): integer;
     function GeneraContabilidad: boolean;
     function CompruebaNiveles: byte;
     function CompruebaFases: integer;
     function DameMaxNivel: integer;
     function ExisteCuenta(Cuenta: string): boolean;
  end;

var
  DMCierreApertura : TDMCierreApertura;

implementation

uses UDMMain, UUtiles, UFormGest, UEntorno, UDameDato;

{$R *.DFM}

procedure TDMCierreApertura.DMCierreAperturaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMCierreApertura.CreaRegularizacion(Cuenta: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_ASIENTO_REGULARIZACION (?EMPRESA, ?EJERCICIO, ?CANAL, ?ENTRADA, ?CUENTA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['CUENTA'].AsString := Cuenta;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierreApertura.BorraRegularizacion;
begin
  if ConfirmaMensaje(_('Va a borrar el asiento de regularización, ¿Está seguro?')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_ASIENTO_REGULARIZACION_BORRA (?EMPRESA, ?EJERCICIO, ?CANAL)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Se ha borrado el asiento de Regularización'));
  end;
end;

procedure TDMCierreApertura.CreaCierre;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_ASIENTO_CIERRE (?EMPRESA, ?EJERCICIO, ?CANAL, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierreApertura.BorraCierre;
begin
  if ConfirmaMensaje(_('Va a borrar el asiento de cierre, ¿Está seguro?')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_ASIENTO_CIERRE_BORRA (?EMPRESA, ?EJERCICIO, ?CANAL)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Se ha borrado el asiento de Cierre'));
  end;
end;

function TDMCierreApertura.CreaApertura: boolean;
begin
  Result := True;

  with xEjercicioActivo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
     Open;
     if (IsEmpty) then
     begin
        if MessageDlg(_('El ejercicio no ha sido generado. ¿Generar ahora?'),
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE G_EJERCICIOS_ALTA(?EMPRESA)';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 ExecQuery;
                 ShowMessage(Format(_('Se ha dado de alta el ejercicio: %d'), [FieldByName['EJERCICIO'].AsInteger]));
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE GEN_EJERCICIOS SET ACTIVO = 1 WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end
        else
        begin
           Result := False;
           Exit;
        end;
     end
     else
     if (FieldByName('ACTIVO').AsInteger = 0) then
     begin
        if MessageDlg(_('El ejercicio no está activo. ¿Activar ahora?'),
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE GEN_EJERCICIOS SET ACTIVO = 1 WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end
        else
        begin
           Result := False;
           Exit;
        end;
     end;
  end;

  if GeneraContabilidad then
  begin
     TraspasoInmovilizado;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_ASIENTO_APERTURA (?EMPRESA, ?EJERCICIO, ?CANAL, ?ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Se ha creado el asiento de Apertura'));
  end
  else
     Result := False;
end;

procedure TDMCierreApertura.BorraApertura;
begin
  if ConfirmaMensaje(_('Va a borrar el asiento de apertura del ejercicio próximo, ¿Está seguro?')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_ASIENTO_APERTURA_BORRA (?EMPRESA, ?EJERCICIO, ?CANAL)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Se ha borrado el asiento de Apertura'));
  end;
end;

function TDMCierreApertura.DameRic(Tipo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ATO_CIERRE, ATO_REGULARIZACION ');
        SQL.Add(' FROM EMP_CANALES ');
        SQL.Add(' WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        if (Tipo = 'CIE') then
           Result := FieldByName['ATO_CIERRE'].AsInteger
        else
           Result := FieldByName['ATO_REGULARIZACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMCierreApertura.GeneraContabilidad: boolean;
var
  Resultado : byte;
begin
  Result := False;
  Resultado := CompruebaNiveles;

  if Resultado = 1 then
  begin
     if ConfirmaMensaje(_('Se van a crear los niveles contables y las cuentas, ¿Desea continuar?')) then
     begin
        TraspasaCuentas;
        Result := True;
     end
     else
     begin
        Result := False;
        Exit;
     end;
  end;

  if Resultado = 0 then
  begin
     ShowMessage(_('Los niveles contables no coinciden.'));
     Result := False;
  end;

  if Resultado = 2 then
  begin
     Result := True;
     TraspasaCuentas;
  end;
end;

procedure TDMCierreApertura.TraspasaCuentas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PROCESADOS FROM C_CUENTAS_PROPAGA_CANALES_MODO ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?D_EMPRESA, ?D_EJERCICIO, ?D_CANAL, ?MODO, ?MODIFICAR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
        Params.ByName['D_CANAL'].AsInteger := 1;
        Params.ByName['MODO'].AsInteger := 4095; //Sin Contabilidad A.
        Params.ByName['MODIFICAR'].AsInteger := 0;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMCierreApertura.CompruebaNiveles: byte;
var
  o_digitos, d_digitos, o_total, d_total, Niveles, maxnivel : integer;
begin
  Result := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT NIVELES FROM EMP_CANALES WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Niveles := FieldByName['NIVELES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Niveles = 0) then
     Result := 1
  else
  begin
     with xCompNivel do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NIVEL'].AsInteger := REntorno.NivelesCont;
        Open;
        o_digitos := xCompNivel.FieldByName('DIGITOS').AsInteger;
        o_total := xCompNivel.FieldByName('TOTAL_DIGITOS').AsInteger;
        MaxNivel := DameMaxNivel;

        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NIVEL'].AsInteger := MaxNivel;
        Open;
        d_digitos := xCompNivel.FieldByName('DIGITOS').AsInteger;
        d_total := xCompNivel.FieldByName('TOTAL_DIGITOS').AsInteger;
     end;

     if ((o_digitos = d_digitos) and (o_total = d_total)) then
        Result := 2;
  end;
end;

function TDMCierreApertura.CompruebaFases: integer;
var
  AperturaEjercicioSiguiente, Cierre, Regularizacion, Niveles : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ACTIVO, ATO_APERTURA, ATO_CIERRE, ATO_REGULARIZACION, NIVELES ');
        SQL.Add(' FROM EMP_CANALES ');
        SQL.Add(' WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Regularizacion := FieldByName['ATO_REGULARIZACION'].AsInteger;
        Cierre := FieldByName['ATO_CIERRE'].AsInteger;
        Niveles := FieldByName['NIVELES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ACTIVO, ATO_APERTURA, ATO_CIERRE, ATO_REGULARIZACION, NIVELES ');
        SQL.Add(' FROM EMP_CANALES ');
        SQL.Add(' WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        AperturaEjercicioSiguiente := FieldByName['ATO_APERTURA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Niveles = 0) then
     Result := 1
  else if (Regularizacion = 0) then
     Result := 2
  else if (Cierre = 0) then
     Result := 3
  else if (AperturaEjercicioSiguiente = 0) then
     Result := 4
  else
     Result := 5;
end;

procedure TDMCierreApertura.CreaAmortizaciones;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_ASIENTOS_AMORTIZACION_ANUAL (?EMPRESA, ?EJERCICIO, ?CANAL, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierreApertura.TraspasoInmovilizado;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_INMOV_TRASPASA (?EMPRESA, ?EJERCICIO, ?CANAL)';
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

function TDMCierreApertura.DameMaxNivel: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_NIVELES_CONTABLES (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio + 1;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['NIVELES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMCierreApertura.ExisteCuenta(Cuenta: string): boolean;
begin
  Result := (DameTituloCuenta(Cuenta) > '');
end;

end.
