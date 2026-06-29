unit ZUDMLstPunteoAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSet;

type
  TZDMLstPunteoAsientos = class(TDataModule)
     frPunteos: TfrHYReport;
     TLocal: THYTransaction;
     DSQMPunteos: TDataSource;
     QMPunteos: TFIBDataSetRO;
     frQMPunteos: TfrDBDataSet;
     QMPunteosEMPRESA: TIntegerField;
     QMPunteosEJERCICIO: TIntegerField;
     QMPunteosCANAL: TIntegerField;
     QMPunteosRIC: TIntegerField;
     QMPunteosLINEA: TIntegerField;
     QMPunteosCUENTA: TFIBStringField;
     QMPunteosSIGNO: TFIBStringField;
     QMPunteosTEXTO: TFIBStringField;
     QMPunteosIMPORTE: TFloatField;
     QMPunteosDOC_NUMERO: TIntegerField;
     QMPunteosDOC_SERIE: TFIBStringField;
     QMPunteosDOC_FECHA: TDateTimeField;
     QMPunteosFECHA: TDateTimeField;
     QMPunteosASIENTO: TIntegerField;
     QMPunteosPUNTEO: TIntegerField;
     QMPunteosFECHA_PUNTEO: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frPunteosGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     Cuenta: string;
     Desde, Hasta: TDateTime;
  public
     { Public declarations }
     procedure Muestra(Modo: integer; aCuenta: string; aDesde, aHasta: TDateTime);
  end;

var
  ZDMLstPunteoAsientos : TZDMLstPunteoAsientos;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, HYFIBQuery,
  ZUDMPunteoAsientos, ZUFMPunteoAsientos, UDameDato;

{$R *.dfm}

procedure TZDMLstPunteoAsientos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLstPunteoAsientos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLstPunteoAsientos.frPunteosGetValue(const ParName: string; var ParValue: variant);
var
  Q : THYFIBQuery;
begin
  // Esta parte calcula los valores para parámetros comunes a todos los listados
  // - Datos de usuario
  // - Datos de la empresa
  // - Datos de la sesion
  // - Número de pagina
  // - Datos del listado
  DMListados.GetValue(ParName, ParValue);

  // El Memo de FastReport contiene la variable [Saldo]
  // Esto llama a este procedimiento y en ParName obtengo 'Saldo'
  // En ParValue debo retornar el valor que calcule
  if (ParName = 'Saldo') then
  begin
     // Creo un query para calcular el valor
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SALDO FROM CON_CUENTAS_SALDOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' CUENTA = ?CUENTA AND ');
           SQL.Add(' PERIODO = ''20'' ');
           // Asigno los parámetros según el registro que se está imprimiendo actualmente
           Params.ByName['EMPRESA'].AsInteger := QMPunteos.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMPunteos.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMPunteos.FieldByName('CANAL').AsInteger;
           Params.ByName['CUENTA'].AsString := QMPunteos.FieldByName('CUENTA').AsString;
           ExecQuery;
           // Devuelvo el valor calculado
           ParValue := FormatFloat(MascaraN, FieldByName['SALDO'].AsFloat);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  // Obtengo el título de la cuenta
  if (ParName = 'TituloCuenta') then
     ParValue := DameTituloCuenta(QMPunteos.FieldByName('CUENTA').AsString);

  // Obtengo el balance que el usuario coloca segun el estado del banco en papel fisico
  if (ParName = 'BalanceSBanco') then
     ParValue := StrToFloat(ZFMPunteoAsientos.EBalanceSBanco.Text);

  // Obtengo el balance segun banco despues de postear los debitos y creditos
  if (ParName = 'BalanceSBancoNeto') then
     ParValue := BalanceSegunLibro;

  // Obtengo el Balance anterior que tenia el Banco
  if (ParName = 'BalanceAnterior') then
     ParValue := SaldoAnterior;

  // Obtengo el monto o balance del libro
  if (ParName = 'BalanceSLibro') then
     ParValue := BalanceLibro;

  // Obtengo el total de debitos que no se puntearon en el mes.
  if (ParName = 'TotalDebitoTransito') then
     ParValue := TotalDebitoTransito;

  // Obtengo el total de creditos que no se puntearon en el mes
  if (ParName = 'TotalCreditoTransito') then
     ParValue := TotalCreditoTransito;

  // Obtengo el total de debitos punteados del mes
  if (ParName = 'TotalDebitoMes') then
     ParValue := TotalDebitoMes;

  // Obtengo el total de debitos punteados del mes
  if (ParName = 'TotalCreditoMes') then
     ParValue := TotalCreditoMes;

  // Obtengo diferencia entre banco y libro.
  if (ParName = 'Diferencia') then
     ParValue := Diferencia;

  // Obtengo fecha desde
  if (ParName = 'FechaDesde') then
     ParValue := Desde;

  // Obtengo Fecha Hasta
  if (ParName = 'FechaHasta') then
     ParValue := HourIntoDate(Hasta, '23:59:59');

  if (ParName = 'SaldoAnterior') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SALDO_A FROM C_CUENTAS_MAYOR_SALDOS (?EMPRESA, ?EJERCICIO, ?CANAL, ?CUENTA, ?DFECHA, ?HFECHA, ?MONEDA, ?ALCANCE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['DFECHA'].AsDateTime := Desde;
        Params.ByName['HFECHA'].AsDateTime := Hasta;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['ALCANCE'].AsInteger := 1;
        ExecQuery;
        ParValue := FieldByName['SALDO_A'].AsFloat;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TZDMLstPunteoAsientos.Muestra(Modo: integer; aCuenta: string; aDesde, aHasta: TDateTime);
var
  str : string;
begin
  Cuenta := aCuenta;
  Desde := aDesde;
  Hasta := HourIntoDate(aHasta, '23:59:59');

  with QMPunteos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     // Params.ByName['DFECHA'].AsDateTime := Desde;
     Params.ByName['HFECHA'].AsDateTime := HourIntoDate(Hasta, '23:59:59');
     Open;
  end;

  DMListados.Cargar(999, '');
  with frPunteos do
  begin
     LoadFromFIB(REntorno.Formato, str);
     PrepareReport;
     case Modo of
        0: ShowPreparedReport;
        1: PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

end.
