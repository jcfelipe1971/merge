unit ZUDMPunteoAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TZDMPunteoAsientos = class(TDataModule)
     TLocal: THYTransaction;
     QMPunteos: TFIBTableSet;
     DSQMPunteos: TDataSource;
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
     QMNorma43: TFIBTableSet;
     DSQMNorma43: TDataSource;
     QMNorma43ID: TIntegerField;
     QMNorma43EMPRESA: TIntegerField;
     QMNorma43OFICINA: TFIBStringField;
     QMNorma43FECHA_OPERACION: TDateTimeField;
     QMNorma43FECHA_VALOR: TDateTimeField;
     QMNorma43CONCEPTO_COMUN: TIntegerField;
     QMNorma43CONCEPTO_PROPIO: TIntegerField;
     QMNorma43SIGNO: TFIBStringField;
     QMNorma43IMPORTE: TFloatField;
     QMNorma43DOC_NUMERO: TIntegerField;
     QMNorma43REFERENCIA1: TFIBStringField;
     QMNorma43REFERENCIA2: TFIBStringField;
     QMNorma43LINEA_IMPORTADA: TFIBStringField;
     QMNorma43TIT_CONC_COMUN: TStringField;
     QMNorma43TIT_CONC_PROPIO: TStringField;
     QMNorma43PUNTEO: TIntegerField;
     QMNorma43BANCO: TIntegerField;
     TUpdate: THYTransaction;
     QMNorma43RIC: TIntegerField;
     QMNorma43LINEA: TIntegerField;
     QMPunteosFECHA_PUNTEO: TDateTimeField;
     procedure DMPunteoAsientosCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMPunteosNewRecord(DataSet: TDataSet);
     procedure DMPunteoAsientosDestroy(Sender: TObject);
     procedure QMPunteosAfterScroll(DataSet: TDataSet);
     procedure QMNorma43TIT_CONC_COMUNGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMNorma43TIT_CONC_PROPIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMNorma43AfterScroll(DataSet: TDataSet);
     procedure QMPunteosPUNTEOChange(Sender: TField);
     procedure QMNorma43PUNTEOChange(Sender: TField);
     procedure QMPunteosFECHA_PUNTEOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPunteosBeforePost(DataSet: TDataSet);
     procedure QMPunteosAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     CalculaDetalle: boolean; {dji lrk kri - Norma 43}
     PUNTEOChange: boolean;
     ActualizarSaldos: boolean;
  public
     SQLBase: TStrings;
     Entidad: string; {dji lrk kri - Norma 43}
     CuentaKri: string;
     function DameSaldo(cuenta: string): string;
     function DameSaldoPunteado: string;
     function DameSaldoPunteadoAnterior(cSigno: string): double;
     function DameSaldoTransitoAnterior(cSigno: string): double;
     function DameSaldoTransitoPosterior(cSigno: string): double;
     function DameSaldoAnterior: double;
     function DameSaldoConciliado: string;
     function DameSaldoPunteadoSigno(cSigno, cEstado: string): double;
     function DameSaldoPuntTranAnoAnteriores(cSigno, cEstado: string): double;
     function DameSaldoMes(cSigno: string): double;
     procedure ActualizaCalculos;
     function DameSaldoPunteadoN43: string;
     procedure AbrirNorma43; {dji lrk kri - Norma 43}
     procedure CerrarNorma43; {dji lrk kri - Norma 43}
     procedure VincularN43; {dji lrk kri - Norma 43}
     procedure FiltraN43(Filtro: string); {dji lrk kri - Norma 43}
     procedure FiltraPunteos(Cuenta: string; DesdeFecha, HastaFecha: TDateTime); {dji lrk kri - Norma 43}
     procedure Refresca;
  end;

var
  ZDMPunteoAsientos : TZDMPunteoAsientos;
  TotalDebitoPunteado, TotalCreditoPunteado, NetoPunteado : double;
  TotalDebitoTransito, TotalCreditoTransito, NetoTransito : double;
  TotalDebTranPuntAnt, TotalCreTranPuntAnt : double;
  TotalDebTranTranAnt, TotalCreTranTranAnt : double;
  TotalDebPosterior, TotalCrePosterior : double;
  SaldoAnterior, TotalDebito, TotalCredito : double;
  BalanceBanco, BalanceSegunLibro, BalanceLibro : double;
  Diferencia : double;
  TotalDebPunteadoAnoAnterior, TotalCredPunteadoAnoAnterior : double;
  TotalDebTransitoAnoAnterior, TotalCredTransitoAnoanterior : double;
  TotalDebitoMes, TotalCreditoMes : double;

implementation

uses UDMMain, UUtiles, UEntorno, URecursos, uFBusca, ZUFMPunteoAsientos,
  UDMPunteoAsientos, StdCtrls;

{$R *.DFM}

procedure TZDMPunteoAsientos.DMPunteoAsientosCreate(Sender: TObject);
begin
  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT P.* ');
  SQLBase.Add(' ,(SELECT COUNT(*) FROM CON_NORMA_43_REL_KRI R ');
  SQLBase.Add('   WHERE ');
  SQLBase.Add('   P.EMPRESA = R.EMPRESA AND ');
  SQLBase.Add('   P.EJERCICIO = R.EJERCICIO AND ');
  SQLBase.Add('   P.CANAL = R.CANAL AND ');
  SQLBase.Add('   P.RIC = R.RIC AND ');
  SQLBase.Add('   P.LINEA = R.LINEA) AS RELACIONES ');
  SQLBase.Add(' FROM VER_CUENTAS_PUNTEOS P');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' P.EMPRESA = ?EMPRESA AND ');
  SQLBase.Add(' P.EJERCICIO = ?EJERCICIO AND ');
  SQLBase.Add(' P.CANAL = ?CANAL AND ');
  SQLBase.Add(' P.CUENTA = ?CUENTA AND ');
  SQLBase.Add(' P.FECHA BETWEEN ?DFECHA AND ?HFECHA ');
  SQLBase.Add(' ORDER BY P.FECHA, P.RIC, P.LINEA');

  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMPunteosIMPORTE.DisplayFormat := MascaraN;
  QMNorma43IMPORTE.DisplayFormat := MascaraN;
  QMNorma43FECHA_OPERACION.DisplayFormat := StringReplace(ShortDateFormat, 'yyyy', 'yy', [rfIgnoreCase]);
  QMNorma43FECHA_VALOR.DisplayFormat := StringReplace(ShortDateFormat, 'yyyy', 'yy', [rfIgnoreCase]);

  QMPunteos.SelectSQL.Assign(SQLBase);
  // DMMain.FiltraTabla(QMPunteos, '11100', False);

  {dji lrk kri - Norma 43}
  Entidad := '2038';
  CalculaDetalle := True;
  PUNTEOChange := True;
  CuentaKri := '';
  ActualizarSaldos := True;
end;

procedure TZDMPunteoAsientos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  ActualizaCalculos;
end;

procedure TZDMPunteoAsientos.QMPunteosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TZDMPunteoAsientos.DMPunteoAsientosDestroy(Sender: TObject);
begin
  QMPunteos.Close;
  SQLBase.Free;
end;

function TZDMPunteoAsientos.DameSaldo(Cuenta: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SALDO FROM CON_CUENTAS_SALDOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' CUENTA = ?CUENTA AND ');
        SQL.Add(' PERIODO = ''20'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        ExecQuery;
        Result := FormatFloat(MascaraN, FieldByName['SALDO'].AsFloat);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPunteoAsientos.DameSaldoPunteado: string;
var
  Saldo : real;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA = S.EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = S.EJERCICIO AND ');
        SQL.Add(' P.CANAL = S.CANAL AND ');
        SQL.Add(' P.RIC = S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.PUNTEO = 1 AND ');
        SQL.Add(' S.FECHA BETWEEN ?DFECHA AND ?HFECHA AND ');
        SQL.Add(' P.SIGNO = ''D'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := CuentaKri {xCuentas.FieldByName('CUENTA').AsString};
        Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
        Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        ExecQuery;
        Saldo := FieldByName['SUM'].AsFloat;
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
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA = S.EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = S.EJERCICIO AND ');
        SQL.Add(' P.CANAL = S.CANAL AND ');
        SQL.Add(' P.RIC = S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.PUNTEO = 1 AND ');
        SQL.Add(' S.FECHA BETWEEN ?DFECHA AND ?HFECHA AND ');
        SQL.Add(' P.SIGNO = ''H'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := CuentaKri {xCuentas.FieldByName('CUENTA').AsString};
        Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
        Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        ExecQuery;
        Saldo := Saldo - FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := FormatFloat(MascaraN, Saldo);
end;

function TZDMPunteoAsientos.DameSaldoConciliado: string;
var
  Saldo : real;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA = S.EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = S.EJERCICIO AND ');
        SQL.Add(' P.CANAL = S.CANAL AND ');
        SQL.Add(' P.RIC = S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.PUNTEO = 1 AND ');
        SQL.Add(' P.FECHA_PUNTEO < ?DFECHA AND ');
        SQL.Add(' P.SIGNO = ''D'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := ZFMPunteoAsientos.ECuenta.Text;
        Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
        // Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        ExecQuery;
        Saldo := FieldByName['SUM'].AsFloat;
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
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA = S.EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = S.EJERCICIO AND ');
        SQL.Add(' P.CANAL = S.CANAL AND ');
        SQL.Add(' P.RIC = S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.PUNTEO = 1 AND ');
        SQL.Add(' P.FECHA_PUNTEO < ?DFECHA AND ');
        SQL.Add(' P.SIGNO = ''H'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := CuentaKri {xCuentas.FieldByName('CUENTA').AsString};
        Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
        // Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        ExecQuery;
        Saldo := Saldo - FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := FormatFloat(MascaraN, Saldo);
end;

function TZDMPunteoAsientos.DameSaldoAnterior: double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SALDO_A FROM C_CUENTAS_MAYOR_SALDOS (?EMPRESA, ?EJERCICIO, ?CANAL, ?CUENTA, ?DFECHA, ?HFECHA, ?MONEDA, ?ALCANCE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := CuentaKri {xCuentas.FieldByName('CUENTA').AsString};
        Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
        Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['ALCANCE'].AsInteger := 1;
        ExecQuery;
        Result := FieldByName['SALDO_A'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPunteoAsientos.DameSaldoPunteadoN43: string;
  // var
  // Q : THYFIBQuery;
  // Saldo : real;
begin
  {
  Result := '';
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT SUM(IMPORTE) FROM CON_NORMA_43_CAB_KRI WHERE EMPRESA=?EMPRESA AND BANCO=?BANCO AND FECHA_OPERACION between ?DFECHA and ?HFECHA AND PUNTEO=1 AND SIGNO=''D''';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
//     Params.ByName['BANCO'].AsInteger := StrToIntDef(ZFMPunteoAsientos.EFBanco.Text, 0);
     Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
     Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
     ExecQuery;
     Saldo := FieldByName['SUM'].AsFloat;
     FreeHandle;
  end;
  FreeAndNil(Q);

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT SUM(IMPORTE) FROM CON_NORMA_43_CAB_KRI WHERE EMPRESA=?EMPRESA AND BANCO=?BANCO AND FECHA_OPERACION between ?DFECHA and ?HFECHA AND PUNTEO=1 AND SIGNO=''H''';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['BANCO'].AsInteger := StrToIntDef(ZFMPunteoAsientos.EFBanco.Text, 0);
     Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
     Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
     ExecQuery;
     Saldo := Saldo - FieldByName['SUM'].AsFloat;
     FreeHandle;
  end;
  FreeAndNil(Q);

  Result := FormatFloat(MascaraN, Saldo);
}
end;

procedure TZDMPunteoAsientos.QMPunteosAfterScroll(DataSet: TDataSet);
var
  Coincide : boolean;
begin
  {dji lrk kri - Norma 43}
  {1ro busco uno que coincida completamente y que no este punteado}
  {2do busco uno que coincida parcialmente y que no este punteado}
  {3ro busco uno que coincida parcialmente y este puntedo}
  with QMNorma43 do
  begin
     if (Active) then
     begin
        Coincide := False;
        DisableControls;
        try
           CalculaDetalle := False;

           {Voy al primero, busco hasta que me paso.}
           First;
           while ((not EOF) and (QMPunteosIMPORTE.AsFloat >= QMNorma43IMPORTE.AsFloat)) do
              Next;

           {Busco mientras no encuentre una coincidencia completa}
           while ((not BOF) and (QMPunteosIMPORTE.AsFloat <= QMNorma43IMPORTE.AsFloat) and not ((QMPunteosIMPORTE.AsFloat = QMNorma43IMPORTE.AsFloat) and
                 (Trunc(QMPunteosFECHA.AsDateTime) = Trunc(QMNorma43FECHA_OPERACION.AsDateTime)) and
                 (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
                 (0 = QMNorma43PUNTEO.AsInteger))) do
              Prior;

           if ((QMPunteosIMPORTE.AsFloat = QMNorma43IMPORTE.AsFloat) and
              (Trunc(QMPunteosFECHA.AsDateTime) = Trunc(QMNorma43FECHA_OPERACION.AsDateTime)) and
              (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
              (0 = QMNorma43PUNTEO.AsInteger)) then
              Coincide := True;

           {Si no encuentro una conicidencia completa busco una coincidencia parcial}
           if (not Coincide) then
           begin
              {Busco hasta que me paso.}
              while ((not EOF) and (QMPunteosIMPORTE.AsFloat >= QMNorma43IMPORTE.AsFloat)) do
                 Next;

              {Busco mientras no encuentre una coincidencia completa}
              while ((not BOF) and (QMPunteosIMPORTE.AsFloat <= QMNorma43IMPORTE.AsFloat) and not ((QMPunteosIMPORTE.AsFloat = QMNorma43IMPORTE.AsFloat) and
                    (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
                    (0 = QMNorma43PUNTEO.AsInteger))) do
                 Prior;

              if ((QMPunteosIMPORTE.AsFloat = QMNorma43IMPORTE.AsFloat) and
                 (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString) and
                 (0 = QMNorma43PUNTEO.AsInteger)) then
                 Coincide := True;
           end;

           {Si no encuentro una conicidencia parcial busco una coincidencia por importe y signo}
           if (not Coincide) then
           begin
              {Busco hasta que me paso.}
              while ((not EOF) and (QMPunteosIMPORTE.AsFloat >= QMNorma43IMPORTE.AsFloat)) do
                 Next;

              {Busco mientras no encuentre una coincidencia completa}
              while ((not BOF) and (QMPunteosIMPORTE.AsFloat <= QMNorma43IMPORTE.AsFloat) and not ((QMPunteosIMPORTE.AsFloat = QMNorma43IMPORTE.AsFloat) and
                    (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString))) do
                 Prior;

              if ((QMPunteosIMPORTE.AsFloat = QMNorma43IMPORTE.AsFloat) and
                 (QMPunteosSIGNO.AsString = QMNorma43SIGNO.AsString)) then
                 Coincide := True;
           end;

           {Si no encuentro nada, voy al importe más cercano}
           if (not Coincide) then
           begin
              {Busco hasta que me paso.}
              while ((not EOF) and (QMPunteosIMPORTE.AsFloat >= QMNorma43IMPORTE.AsFloat)) do
                 Next;

              {Luego vuelvo uno para atras.}
              if (QMPunteosIMPORTE.AsFloat < QMNorma43IMPORTE.AsFloat) then
                 Prior;
           end;
        finally
           EnableControls;
        end;
        CalculaDetalle := True;
        QMNorma43AfterScroll(DataSet);
     end;
  end;
end;

procedure TZDMPunteoAsientos.AbrirNorma43;
begin
  {dji lrk kri - Norma 43}
  {
  QMNorma43.Close;
  QMNorma43.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMNorma43.Params.ByName['BANCO'].AsInteger := StrToIntDef(ZFMPunteoAsientos.EFBanco.Text, 0);
  QMNorma43.Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
  QMNorma43.Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
  QMNorma43.Open;
  QMPunteosAfterScroll(QMPunteos);
}
end;

procedure TZDMPunteoAsientos.CerrarNorma43;
begin
  {dji lrk kri - Norma 43}
  QMNorma43.Close;
end;

procedure TZDMPunteoAsientos.QMNorma43TIT_CONC_COMUNGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {dji lrk kri - Norma 43}
  if (QMNorma43CONCEPTO_COMUN.AsString > '0') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_TIPO_NORMA43 WHERE ENTIDAD=''0000'' AND CONCEPTO_COMUN=' + QMNorma43CONCEPTO_COMUN.AsString + ' AND CONCEPTO_PROPIO=-1';
           ExecQuery;
           Text := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TZDMPunteoAsientos.QMNorma43TIT_CONC_PROPIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {dji lrk kri - Norma 43}
  if (QMNorma43CONCEPTO_COMUN.AsString > '0') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_TIPO_NORMA43 WHERE ENTIDAD=''' + Entidad + ''' AND CONCEPTO_COMUN=' + QMNorma43CONCEPTO_COMUN.AsString + ' AND CONCEPTO_PROPIO=' + QMNorma43CONCEPTO_PROPIO.AsString;
           ExecQuery;
           Text := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     {Si no encuentro el concepto propio dentro del concepto comun, lo busco sin tener en cuente el concepto comun (Banesto)}
     if (Text = '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT TITULO FROM SYS_TIPO_NORMA43 WHERE ENTIDAD=''' + Entidad + ''' AND CONCEPTO_PROPIO=' + QMNorma43CONCEPTO_PROPIO.AsString;
              ExecQuery;
              Text := FieldByName['TITULO'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TZDMPunteoAsientos.QMNorma43AfterScroll(DataSet: TDataSet);
// var
//   DS : TFIBDataSet;
begin
  {dji lrk kri - Norma 43}
  if CalculaDetalle then
  begin
     // ZFMPunteoAsientos.LNorma43Det.Caption := '';
     // if (QMNorma43CONCEPTO_COMUN.AsString>'0') then
     // begin
     {
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then
                    StartTransaction;
              end;
              SelectSQL.Text := 'SELECT CONCEPTO1,CONCEPTO2 FROM CON_NORMA_43_DET_KRI WHERE ID_CAB=' + IntToStr(QMNorma43ID.AsInteger) + ' order by COD_DATO ';
              Open;
              while (not EOF) do
              begin
                 FMPunteoAsientos.LNorma43Det.Caption := ZFMPunteoAsientos.LNorma43Det.Caption + FieldByName('CONCEPTO1').AsString + #13#10 + FieldByName('CONCEPTO2').AsString + #10 + #13;
                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
}
     // end;
  end;
end;

procedure TZDMPunteoAsientos.QMPunteosPUNTEOChange(Sender: TField);
var
  BMNorma43 : TBookmark;
  DS : TFIBDataSet;
begin
  {dji lrk kri - Norma 43}
  if (QMPunteosPUNTEO.AsInteger = 0) and (PUNTEOChange) then
  begin
     if (QMNorma43.Active) then {Si está abierta quitamos las marcas sino, lo hacemos por SQL}
     begin
        CalculaDetalle := False;
        PUNTEOChange := False;

        BMNorma43 := QMNorma43.GetBookmark;
        try
           QMNorma43.DisableControls;
           DS := TFIBDataSet.Create(nil);
           try
              with DS do
              begin
                 Transaction := TFIBTransaction.Create(nil);
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    with Transaction do
                    begin
                       DefaultDatabase := DMMain.DataBase;
                       TRParams.Clear;
                       TRParams.Add('read_committed');
                       TRParams.Add('read');
                       if (not InTransaction) then
                          StartTransaction;
                    end;
                    SelectSQL.Text := 'SELECT ID FROM CON_NORMA_43_REL_KRI WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND RIC=?RIC AND LINEA=?LINEA';
                    Params.ByName['EMPRESA'].AsInteger := QMPunteosEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMPunteosEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMPunteosCANAL.AsInteger;
                    Params.ByName['RIC'].AsInteger := QMPunteosRIC.AsInteger;
                    Params.ByName['LINEA'].AsInteger := QMPunteosLINEA.AsInteger;
                    Open;
                    while (not EOF) do
                    begin
                       QMNorma43.First;
                       while (not QMNorma43.EOF) do
                       begin
                          if ((QMNorma43ID.AsInteger = FieldByName('ID').AsInteger) and (QMNorma43PUNTEO.AsInteger = 1)) then
                          begin
                             QMNorma43.Edit;
                             QMNorma43PUNTEO.AsInteger := 0;
                             QMNorma43.Post;
                          end;
                          QMNorma43.Next;
                       end;
                       Next;
                    end;
                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              end;
           finally
              FreeAndNil(DS);
           end;

           QMNorma43.GotoBookmark(BMNorma43);
        finally
           QMNorma43.EnableControls;
           QMNorma43.FreeBookmark(BMNorma43);
        end;
        CalculaDetalle := True;
        PUNTEOChange := True;
     end; {QMNorma43.Active}
  end;

  ActualizarSaldos := True;
end;

procedure TZDMPunteoAsientos.QMNorma43PUNTEOChange(Sender: TField);
var
  BMPunteo, BMNorma43 : TBookmark;
  DS : TFIBDataSet;
begin
  {dji lrk kri - Norma 43}
  if (QMNorma43PUNTEO.AsInteger = 0) and (PUNTEOChange) then
  begin
     CalculaDetalle := False;
     PUNTEOChange := False;
     BMNorma43 := QMNorma43.GetBookmark;
     BMPunteo := QMPunteos.GetBookmark;
     try
        QMNorma43.DisableControls;
        QMPunteos.DisableControls;

        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Text := 'SELECT EMPRESA,EJERCICIO,CANAL,RIC,LINEA FROM CON_NORMA_43_REL_KRI WHERE ID=?ID';
                 Params.ByName['ID'].AsInteger := QMNorma43ID.AsInteger;
                 Open;
                 while (not EOF) do
                 begin
                    QMPunteos.First;
                    while (not QMPunteos.EOF) do
                    begin
                       if ((QMPunteosEMPRESA.AsInteger = FieldByName('EMPRESA').AsInteger) and
                          (QMPunteosEJERCICIO.AsInteger = FieldByName('EJERCICIO').AsInteger) and
                          (QMPunteosCANAL.AsInteger = FieldByName('CANAL').AsInteger) and
                          (QMPunteosRIC.AsInteger = FieldByName('RIC').AsInteger) and
                          (QMPunteosLINEA.AsInteger = FieldByName('LINEA').AsInteger) and
                          (QMPunteosPUNTEO.AsInteger = 1)) then
                       begin
                          QMPunteos.Edit;
                          QMPunteosPUNTEO.AsInteger := 0;
                          QMPunteos.Post;
                       end;
                       QMPunteos.Next;
                    end;
                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           end;
        finally
           FreeAndNil(DS);
        end;

        QMPunteos.GotoBookmark(BMPunteo);
        QMNorma43.GotoBookmark(BMNorma43);
     finally
        QMPunteos.EnableControls;
        QMNorma43.EnableControls;
        QMPunteos.FreeBookmark(BMPunteo);
        QMNorma43.FreeBookmark(BMNorma43);
     end;
     CalculaDetalle := True;
     PUNTEOChange := True;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM CON_NORMA_43_REL_KRI WHERE ID=?ID';
           Params.ByName['ID'].AsInteger := QMNorma43ID.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TZDMPunteoAsientos.VincularN43;
var
  Vincular : boolean;
begin
  {dji lrk kri - Norma 43}
  Vincular := True;
  if (QMPunteosIMPORTE.AsFloat <> QMNorma43IMPORTE.AsFloat) then
     Vincular := MessageDlg(_('Los importes no son iguales, Desea vincular de todos modos?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes;

  if (Vincular) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO CON_NORMA_43_REL_KRI (ID,EMPRESA,EJERCICIO,CANAL,RIC,LINEA) VALUES (?ID,?EMPRESA,?EJERCICIO,?CANAL,?RIC,?LINEA)';
           Params.ByName['ID'].AsInteger := QMNorma43ID.AsInteger;
           Params.ByName['EMPRESA'].AsInteger := QMPunteosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMPunteosEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMPunteosCANAL.AsInteger;
           Params.ByName['RIC'].AsInteger := QMPunteosRIC.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMPunteosLINEA.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with QMNorma43 do
     begin
        if (QMNorma43PUNTEO.AsInteger = 0) then
        begin
           Edit;
           QMNorma43PUNTEO.AsInteger := 1;
           Post;
        end;
     end;

     with QMPunteos do
     begin
        if (QMPunteosPUNTEO.AsInteger = 0) then
        begin
           Edit;
           QMPunteosPUNTEO.AsInteger := 1;
           Post;
        end;
     end;

     ZFMPunteoAsientos.ESaldoPunteado.Text := {DMPunteoAsientos.}DameSaldoPunteado;
     // ZFMPunteoAsientos.ESaldoPunteadoN43.Text := {DMPunteoAsientos.}DameSaldoPunteadoN43;

     QMPunteos.Next;
  end;
end;

procedure TZDMPunteoAsientos.FiltraN43(Filtro: string);
begin
  {dji lrk kri - Norma 43}
  {
  with QMNorma43 do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ');
     SelectSQL.Add(' c.*, r.ric, r.linea ');
     SelectSQL.Add(' FROM CON_NORMA_43_CAB_KRI c ');
     SelectSQL.Add(' LEFT JOIN CON_NORMA_43_REL_KRI r ');
     SelectSQL.Add(' ON c.id=r.id ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' c.EMPRESA=?EMPRESA AND ');
     SelectSQL.Add(' c.BANCO=?BANCO AND ');
     SelectSQL.Add(' c.FECHA_OPERACION between ?DFECHA and ?HFECHA ');
     if (Filtro > '') then
        SelectSQL.Add(' AND ' + Filtro + ' ');
     SelectSQL.Add(' ORDER BY c.IMPORTE, c.FECHA_OPERACION ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['BANCO'].AsInteger := StrToIntDef(ZFMPunteoAsientos.EFBanco.Text, 0);
     Params.ByName['DFECHA'].AsDateTime := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
     Params.ByName['HFECHA'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
     Open;
     QMPunteosAfterScroll(QMPunteos);
  end;
}
end;

procedure TZDMPunteoAsientos.FiltraPunteos(Cuenta: string; DesdeFecha, HastaFecha: TDateTime);
begin
  with QMPunteos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Params.ByName['DFECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HFECHA'].AsDateTime := HourIntoDate(HastaFecha, '23:59:59');
     Open;
     CuentaKri := QMPunteosCUENTA.AsString;
  end;
end;

procedure TZDMPunteoAsientos.QMPunteosFECHA_PUNTEOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMPunteosPUNTEO.AsInteger = 0) then
     Text := ''
  else
     Text := DateTimeToStr(QMPunteosFECHA_PUNTEO.AsDateTime);
end;

function TZDMPunteoAsientos.DameSaldoPunteadoSigno(cSigno, cEstado: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA=S.EMPRESA AND P.EJERCICIO=S.EJERCICIO AND P.CANAL=S.CANAL AND P.RIC=S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.SIGNO = ?SIGNO ');
        if (cEstado = 'T') then
           SQL.Add(' AND ((S.FECHA <= ?FECHA2) AND ( (P.PUNTEO = 0) OR ((P.FECHA_PUNTEO > ?FECHA2) AND (P.PUNTEO = 1)))) ');
        if (cEstado = 'P') then
           SQL.Add(' AND (CAST(EXTRACT(DAY FROM P.FECHA_PUNTEO)||''.''|| EXTRACT(MONTH FROM P.FECHA_PUNTEO)||''.''|| EXTRACT(YEAR FROM P.FECHA_PUNTEO) AS DATE) = ?FECHA2 AND P.PUNTEO = 1) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := ZFMPunteoAsientos.Ecuenta.Text;
        Params.ByName['SIGNO'].AsString := cSigno;
        // Params.ByName['DFECHA'].AsDateTime   := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
        if cEstado = 'T' then
           Params.ByName['FECHA2'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        if cEstado = 'P' then
           Params.ByName['FECHA2'].AsDateTime := Trunc(ZFMPunteoAsientos.LFDEHastaFecha.Date);
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPunteoAsientos.DameSaldoPuntTranAnoAnteriores(cSigno, cEstado: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA=S.EMPRESA AND P.EJERCICIO=S.EJERCICIO AND P.CANAL=S.CANAL AND P.RIC=S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO < ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.SIGNO = ?SIGNO ');
        if (cEstado = 'T') then
           SQL.Add(' AND ((S.FECHA <= ?FECHA2) AND ( (P.PUNTEO = 0) OR ((P.FECHA_PUNTEO > ?FECHA2) AND (P.PUNTEO = 1)))) ');
        if (cEstado = 'P') then
           SQL.Add(' AND (CAST(EXTRACT(DAY FROM P.FECHA_PUNTEO)||''.''|| EXTRACT(MONTH FROM P.FECHA_PUNTEO)||''.''|| EXTRACT(YEAR FROM P.FECHA_PUNTEO) AS DATE) = ?FECHA2 AND P.PUNTEO = 1) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := ZFMPunteoAsientos.Ecuenta.Text;
        Params.ByName['SIGNO'].AsString := cSigno;
        // Params.ByName['DFECHA'].AsDateTime   := ZFMPunteoAsientos.LFDEDesdeFecha.Date;
        if cEstado = 'T' then
           Params.ByName['FECHA2'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        if cEstado = 'P' then
           Params.ByName['FECHA2'].AsDateTime := Trunc(ZFMPunteoAsientos.LFDEHastaFecha.Date);
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPunteoAsientos.DameSaldoPunteadoAnterior(cSigno: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA=S.EMPRESA AND  P.EJERCICIO=S.EJERCICIO AND P.CANAL=S.CANAL AND P.RIC=S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.SIGNO = ?SIGNO ');
        if cSigno = 'D' then
           SQL.Add(' AND ( (S.FECHA < ?FECHA1) AND (P.PUNTEO = 1) AND (P.FECHA_PUNTEO = ?FECHA2)) ');
        if cSigno = 'H' then
           SQL.Add(' AND ( (S.FECHA < ?FECHA1) AND (P.PUNTEO = 1) AND (P.FECHA_PUNTEO = ?FECHA2)) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := ZFMPunteoAsientos.Ecuenta.Text;
        Params.ByName['SIGNO'].AsString := cSigno;
        Params.ByName['FECHA1'].AsDateTime := Trunc(ZFMPunteoAsientos.LFDEDesdeFecha.Date);
        Params.ByName['FECHA2'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPunteoAsientos.DameSaldoTransitoAnterior(cSigno: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA=S.EMPRESA AND  P.EJERCICIO=S.EJERCICIO AND P.CANAL=S.CANAL AND P.RIC=S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.SIGNO = ?SIGNO ');
        if (cSigno = 'D') then
           SQL.Add(' AND ((S.FECHA < ?FECHA1) AND (P.PUNTEO = 0) AND (P.FECHA_PUNTEO < ?FECHA1)) ');
        if (cSigno = 'H') then
           SQL.Add(' AND ((S.FECHA < ?FECHA1) AND (P.PUNTEO = 0) AND (P.FECHA_PUNTEO < ?FECHA1)) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := ZFMPunteoAsientos.Ecuenta.Text;
        Params.ByName['SIGNO'].AsString := cSigno;
        Params.ByName['FECHA1'].AsDateTime := Trunc(ZFMPunteoAsientos.LFDEDesdeFecha.Date);
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPunteoAsientos.DameSaldoTransitoPosterior(cSigno: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA=S.EMPRESA AND  P.EJERCICIO=S.EJERCICIO AND P.CANAL=S.CANAL AND P.RIC=S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.SIGNO = ?SIGNO ');
        if cSigno = 'D' then
           SQL.Add(' AND ( (S.FECHA < ?FECHA1) AND (P.PUNTEO = 1) AND (P.FECHA_PUNTEO > ?FECHA2)) ');
        if cSigno = 'H' then
           SQL.Add(' AND ( (S.FECHA < ?FECHA1) AND (P.PUNTEO = 1) AND (P.FECHA_PUNTEO > ?FECHA2)) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := ZFMPunteoAsientos.Ecuenta.Text;
        Params.ByName['SIGNO'].AsString := cSigno;
        Params.ByName['FECHA1'].AsDateTime := Trunc(ZFMPunteoAsientos.LFDEDesdeFecha.Date);
        Params.ByName['FECHA2'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPunteoAsientos.DameSaldoMes(cSigno: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(P.IMPORTE) FROM CON_CUENTAS_APUNTES P ');
        SQL.Add(' JOIN CON_CUENTAS_ASIENTOS S ');
        SQL.Add(' ON P.EMPRESA=S.EMPRESA AND  P.EJERCICIO=S.EJERCICIO AND P.CANAL=S.CANAL AND P.RIC=S.RIC ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' P.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' P.CANAL = ?CANAL AND ');
        SQL.Add(' P.CUENTA = ?CUENTA AND ');
        SQL.Add(' P.SIGNO = ?SIGNO ');
        if cSigno = 'D' then
           SQL.Add(' AND ( (S.FECHA > ?FECHA1) AND (S.FECHA < ?FECHA2)) ');
        if cSigno = 'H' then
           SQL.Add(' AND ( (S.FECHA > ?FECHA1) AND (S.FECHA < ?FECHA2)) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := ZFMPunteoAsientos.Ecuenta.Text;
        Params.ByName['SIGNO'].AsString := cSigno;
        Params.ByName['FECHA1'].AsDateTime := Trunc(ZFMPunteoAsientos.LFDEDesdeFecha.Date);
        Params.ByName['FECHA2'].AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59');
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPunteoAsientos.ActualizaCalculos;
begin
  // Obtengo datos
  TotalDebitoPunteado := DameSaldoPunteadoSigno('D', 'P');
  TotalCreditoPunteado := DameSaldoPunteadoSigno('H', 'P');
  TotalDebitoTransito := DameSaldoPunteadoSigno('D', 'T');
  TotalCreditoTransito := DameSaldoPunteadoSigno('H', 'T');
  TotalDebTranPuntAnt := DameSaldoPunteadoAnterior('D');
  TotalCreTranPuntAnt := DameSaldoPunteadoAnterior('H');
  TotalDebTranTranAnt := DameSaldotransitoAnterior('D');
  TotalCreTranTranAnt := DameSaldotransitoAnterior('H');
  TotalDebPosterior := DameSaldoTransitoPosterior('D');
  TotalCrePosterior := DameSaldoTransitoPosterior('H');
  TotalDebitoMes := DameSaldoMes('D');
  TotalCreditoMes := DameSaldoMes('H');

  TotalDebPunteadoAnoAnterior := DameSaldoPuntTranAnoAnteriores('D', 'P');
  TotalCredPunteadoAnoAnterior := DameSaldoPuntTranAnoAnteriores('H', 'P');
  TotalDebTransitoAnoAnterior := DameSaldoPuntTranAnoAnteriores('D', 'T');
  TotalCredTransitoAnoanterior := DameSaldoPuntTranAnoAnteriores('H', 'T');
  SaldoAnterior := DameSaldoAnterior;
  BalanceBanco := StrToFloatDef(StringReplace(ZFMPunteoAsientos.EBalanceSBanco.Text, ThousandSeparator, '', [rfReplaceAll]), 0.00);

  // Hago cálculos
  TotalDebito := TotalDebitoTransito + TotalDebitoPunteado;
  TotalCredito := TotalCreditoTransito + TotalCreditoPunteado;
  NetoPunteado := TotalDebitoPunteado - TotalCreditoPunteado;
  NetoTransito := TotalDebitoTransito - TotalCreditoTransito;
  BalanceSegunLibro := (BalanceBanco + (TotalDebitoTransito - TotalCreditoTransito));
  BalanceLibro := ((SaldoAnterior + TotalDebitoPunteado - TotalCreditoPunteado) + TotalDebitoTransito - TotalCreditoTransito);
  BalanceLibro := BalanceLibro - (TotalDebTranPuntAnt + TotalDebTranTranAnt) + (TotalCreTranPuntAnt + TotalCreTranTranAnt);
  BalanceLibro := BalanceLibro - TotalDebPosterior + TotalCrePosterior;
  balancelibro := Balancelibro - (TotalDebPunteadoAnoAnterior + TotalDebTransitoAnoAnterior) + (TotalCredPunteadoAnoAnterior + TotalCredTransitoAnoanterior);
  Diferencia := BalanceLibro - BalanceSegunLibro;

  // Presento resultados
  ZFMPunteoAsientos.ETotalDebitoPunteado.Text := FormatFloat(MascaraN, TotalDebitoPunteado);
  ZFMPunteoAsientos.ETotalCreditoPunteado.Text := FormatFloat(MascaraN, TotalCreditoPunteado);
  ZFMPunteoAsientos.ESaldoPunteado.Text := FormatFloat(MascaraN, NetoPunteado);

  ZFMPunteoAsientos.ETotalDebitoTransito.Text := FormatFloat(MascaraN, TotalDebitoTransito);
  ZFMPunteoAsientos.ETotalCrebitoTransito.Text := FormatFloat(MascaraN, TotalCreditoTransito);
  ZFMPunteoAsientos.ESaldoTransito.Text := FormatFloat(MascaraN, NetoTransito);
  ZFMPunteoAsientos.ETotalDebito.Text := FormatFloat(MascaraN, TotalDebito);
  ZFMPunteoAsientos.ETotalCredito.Text := FormatFloat(MascaraN, TotalCredito);

  ZFMPunteoAsientos.ESaldoAnterior.Text := FormatFloat(MascaraN, DameSaldoAnterior);
  ZFMPunteoAsientos.EBalanceSegunLibro.Text := FormatFloat(MascaraN, BalanceSegunLibro);
  ZFMPunteoAsientos.EDiferencia.Text := FormatFloat(MascaraN, Diferencia);
  ZFMPunteoAsientos.EBalanceLibro.Text := FormatFloat(MascaraN, BalanceLibro);

  { Borrar
  ZFMPunteoAsientos.ETotalDebitoPunteado.Text := DameSaldoPunteadoSigno('D', 'P');
  ZFMPunteoAsientos.ETotalCreditoPunteado.Text := DameSaldoPunteadoSigno('H', 'P');
  ZFMPunteoAsientos.ETotalDebitoTransito.Text := DameSaldoPunteadoSigno('D', 'T');
  ZFMPunteoAsientos.ETotalCrebitoTransito.Text := DameSaldoPunteadoSigno('H', 'T');
  ZFMPunteoAsientos.ESaldoPunteado.Text := FormatFloat(MascaraN, StrToFloatDef(ZFMPunteoAsientos.ETotalDebitoPunteado.Text, 0.00) - StrToFloatDef(ZFMPunteoAsientos.ETotalCreditoPunteado.Text, 0.00));
  ZFMPunteoAsientos.ESaldoTransito.Text := FormatFloat(MascaraN, StrToFloatDef(ZFMPunteoAsientos.ETotalDebitoTransito.Text, 0.00) - StrToFloatDef(ZFMPunteoAsientos.ETotalCrebitoTransito.Text, 0.00));
  ZFMPunteoAsientos.ESaldoAnterior.Text := DameSaldoAnterior; // DameSaldoConciliado;
  ZFMPunteoAsientos.EBalanceSegunLibro.Text := FormatFloat(MascaraN, StrToFloatDef(ZFMPunteoAsientos.ESaldoAnterior.Text, 0.00) + StrToFloatDef(ZFMPunteoAsientos.ETotalDebitoPunteado.Text, 0.00) - StrToFloatDef(ZFMPunteoAsientos.ETotalCreditoPunteado.Text, 0.00));
  ZFMPunteoAsientos.dbDiferencia.Text := FormatFloat(MascaraN, StrToFloatDef(ZFMPunteoAsientos.EBalanceSBanco.Text, 0.00) - StrToFloatDef(ZFMPunteoAsientos.EBalanceSegunLibro.Text, 0.00));
}
end;

procedure TZDMPunteoAsientos.QMPunteosBeforePost(DataSet: TDataSet);
begin
  if (QMPunteos.FieldByName('FECHA_PUNTEO').AsDateTime <> EncodeDate(1900, 1, 1)) then
     ShowMessage('Cuidado esta intentando conciliar un monto ya punteado');

  if (QMPunteos.FieldByName('PUNTEO').AsInteger = 1) then
     QMPunteos.FieldByName('FECHA_PUNTEO').AsDateTime := HourIntoDate(ZFMPunteoAsientos.LFDEHastaFecha.Date, '23:59:59')
  else
     QMPunteos.FieldByName('FECHA_PUNTEO').AsDateTime := EncodeDate(1900, 1, 1);
end;

procedure TZDMPunteoAsientos.QMPunteosAfterPost(DataSet: TDataSet);
begin
  if (ActualizarSaldos) then
  begin
     ActualizarSaldos := False;
     ZFMPunteoAsientos.ESaldoPunteado.Text := {DMPunteoAsientos.}DameSaldoPunteado;
     ZFMPunteoAsientos.ESaldoPunteadoN43.Text := {DMPunteoAsientos.}DameSaldoPunteadoN43;
  end;
  ActualizaCalculos;
end;

procedure TZDMPunteoAsientos.Refresca;
var
  id : integer;
  ric, linea : integer;
begin
  QMPunteos.DisableControls;
  QMNorma43.DisableControls;
  try
     id := QMNorma43ID.AsInteger;
     ric := QMPunteosRIC.AsInteger;
     linea := QMPunteosLINEA.AsInteger;

     QMNorma43.Close;
     QMPunteos.Close;
     QMPunteos.Open;
     QMNorma43.Open;

     if ((ric <> QMPunteosRIC.AsInteger) or (linea <> QMPunteosLINEA.AsInteger)) then
        repeat
           QMPunteos.Next;
        until (((ric = QMPunteosRIC.AsInteger) and (linea = QMPunteosLINEA.AsInteger)) or (QMPunteos.EOF));

     while ((id <> QMNorma43ID.AsInteger) and (not QMNorma43.EOF)) do
        QMNorma43.Next;
  finally
     QMNorma43.EnableControls;
     QMPunteos.EnableControls;
  end;
end;

end.
