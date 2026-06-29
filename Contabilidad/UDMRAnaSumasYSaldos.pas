unit UDMRAnaSumasYSaldos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, FIBQuery, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, UFIBModificados, FIBDataSetRO, HYFIBQuery;

type
  TDMRAnaSumasySaldos = class(TDataModule)
     TSBalance: TFIBTableSet;
     TSBalance_Medio: TFIBTableSet;
     DSBalance: TDataSource;
     DSBalance_Medio: TDataSource;
     TSBalance_MedioSALDO_DEUDOR: TFloatField;
     TSBalance_MedioSALDO_ACREEDOR: TFloatField;
     TSBalance_Detalle: TFIBTableSet;
     TSBalance_DetalleSALDO_DEUDOR: TFloatField;
     TSBalance_DetalleSALDO_ACREEDOR: TFloatField;
     DSBalance_Detalle: TDataSource;
     SPBalanceDetalle: THYFIBQuery;
     SPBalanceSuperior: THYFIBQuery;
     SPRangos: THYFIBQuery;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xCC_Desde: TFIBDataSetRO;
     DSxCC_Desde: TDataSource;
     xCC_Hasta: TFIBDataSetRO;
     DSxCC_Hasta: TDataSource;
     frSumasySaldos: TfrHYReport;
     frDSBalance: TfrDBDataSet;
     frDSBalance_Medio: TfrDBDataSet;
     frDSBalance_Detalle: TfrDBDataSet;
     TLocal: THYTransaction;
     xPlan: TFIBDataSetRO;
     DSxPlan: TDataSource;
     xPlanPLAN_CONTABLE: TFIBStringField;
     xPlanTITULO: TFIBStringField;
     TSBalanceENTRADA: TIntegerField;
     TSBalanceEMPRESA: TIntegerField;
     TSBalanceEJERCICIO: TIntegerField;
     TSBalanceCANAL: TIntegerField;
     TSBalancePLAN_CONTABLE: TFIBStringField;
     TSBalanceCENTRO_COSTE: TFIBStringField;
     TSBalanceTITULO: TFIBStringField;
     TSBalanceDEBE: TFloatField;
     TSBalanceHABER: TFloatField;
     TSBalanceDEBE_MES: TFloatField;
     TSBalanceHABER_MES: TFloatField;
     TSBalanceNIVEL: TIntegerField;
     TSBalanceCENTRO_COSTE_PADRE: TFIBStringField;
     TSBalanceSALDO_ACREEDOR: TFloatField;
     TSBalanceSALDO_DEUDOR: TFloatField;
     TSBalance_MedioENTRADA: TIntegerField;
     TSBalance_MedioEMPRESA: TIntegerField;
     TSBalance_MedioEJERCICIO: TIntegerField;
     TSBalance_MedioCANAL: TIntegerField;
     TSBalance_MedioPLAN_CONTABLE: TFIBStringField;
     TSBalance_MedioCENTRO_COSTE: TFIBStringField;
     TSBalance_MedioTITULO: TFIBStringField;
     TSBalance_MedioDEBE: TFloatField;
     TSBalance_MedioHABER: TFloatField;
     TSBalance_MedioDEBE_MES: TFloatField;
     TSBalance_MedioHABER_MES: TFloatField;
     TSBalance_MedioNIVEL: TIntegerField;
     TSBalance_MedioCENTRO_COSTE_PADRE: TFIBStringField;
     TSBalance_DetalleENTRADA: TIntegerField;
     TSBalance_DetalleEMPRESA: TIntegerField;
     TSBalance_DetalleEJERCICIO: TIntegerField;
     TSBalance_DetalleCANAL: TIntegerField;
     TSBalance_DetallePLAN_CONTABLE: TFIBStringField;
     TSBalance_DetalleCENTRO_COSTE: TFIBStringField;
     TSBalance_DetalleTITULO: TFIBStringField;
     TSBalance_DetalleCENTRO_COSTE_PADRE: TFIBStringField;
     TSBalance_DetalleDEBE: TFloatField;
     TSBalance_DetalleHABER: TFloatField;
     TSBalance_DetalleDEBE_MES: TFloatField;
     TSBalance_DetalleHABER_MES: TFloatField;
     procedure TSBalanceCalcFields(DataSet: TDataSet);
     procedure DMRSumasYSaldosCreate(Sender: TObject);
     procedure TSBalance_MedioCalcFields(DataSet: TDataSet);
     procedure TSBalance_DetalleCalcFields(DataSet: TDataSet);
     procedure DMRSumasySaldosDestroy(Sender: TObject);
     procedure frSumasySaldosGetValue(const ParName: string; var ParValue: variant);
     procedure frSumasySaldosEnterRect(Memo: TStringList; View: TfrView);
     procedure frSumasySaldosBeginDoc;
     procedure Actualiza_CentroCoste(Tabla: TFIBDataSetRO; CentroCoste: string);
  private
     Tdebemes, Thabermes, Tdebe, Thaber, TSaldo_Deudor, TSaldo_Acreedor: double;
     SW: integer;
     fdesde, fhasta: TDateTime;
     LocalMascaraN, LocalMascaraL: string;
     RangoSelec: string;
     procedure GenerarSQL(Modo: boolean; Canal: smallint; LCan: TStringList);
     procedure EstableceMascaras;
     procedure ActualizarRangoSelec(LCan: TStrings; Canal: smallint);
     procedure BorraTemporales;
  public
     CentroCoste_Desde: string;
     CentroCoste_Hasta: string;
     Fecha_Desde: TDateTime;
     Fecha_Hasta: TDateTime;
     Nivel_Desde: smallint;
     Nivel_Hasta: smallint;
     Nivel_Filtro: smallint;
     SeccionDesde, SeccionHasta: string;
     Niveles: TStringList;
     PlanContableMin: string;
     procedure MostrarListado(modo: integer; desde, hasta: TDateTime);
     procedure ActivarConexiones;
     procedure CalculaInforme(Modo: boolean; LCan: TStringList; Canal: smallint);
     procedure Rangos;
     // procedure AjustaCta_De(Cuenta: String);
     // procedure AjustaCta_Ha(Cuenta: String);
     procedure MinPlanContable;
     procedure LlenarNiveles;
     procedure Actualiza_Plan(PlanContable: string);
     function DamePlanContable: string;
  end;

var
  DMRAnaSumasySaldos : TDMRAnaSumasySaldos;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UDMMultiSeleccion;

{$R *.DFM}

procedure TDMRAnaSumasySaldos.DMRSumasYSaldosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  TSBalance.Open;
  TSBalance_Medio.Open;
  TSBalance_Detalle.Open;
  xMonedas.Open;

  Niveles := TStringList.Create;
end;

procedure TDMRAnaSumasySaldos.DMRSumasySaldosDestroy(Sender: TObject);
begin
  BorraTemporales;
  Niveles.Free;
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMRAnaSumasySaldos.CalculaInforme(Modo: boolean; LCan: TStringList; Canal: smallint);
begin
  DMListados.Normalizar_desde_hasta(SeccionDesde, SeccionHasta);
  ActualizarRangoSelec(LCan, Canal);

  with SPBalanceDetalle do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE_INI'].AsString := CentroCoste_desde;
     Params.ByName['CENTRO_COSTE_FIN'].AsString := CentroCoste_hasta;
     Params.ByName['FECHA_INI'].AsDateTime := Fecha_desde;
     Params.ByName['FECHA_FIN'].AsDateTime := Fecha_hasta;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['SECCION_INI'].AsString := SeccionDesde;
     Params.ByName['SECCION_FIN'].AsString := SeccionHasta;
     Params.ByName['NIVEL_FILTRO'].AsInteger := Nivel_Filtro;
     ExecQuery;
     FreeHandle;
  end;

  with SPBalanceSuperior do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['NIVEL_INI'].AsInteger := Nivel_Desde;
     Params.ByName['NIVEL_FIN'].AsInteger := Nivel_Hasta;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;

  GenerarSQL(Modo, Canal, LCan);
  ActivarConexiones;
end;

procedure TDMRAnaSumasySaldos.ActualizarRangoSelec(LCan: TStrings; Canal: smallint);
var
  i : integer;
begin
  if (LCan.Count = 0) then
     RangoSelec := 'Canal: ' + IntToStr(Canal)
  else
  begin
     RangoSelec := '';
     for i := 0 to (LCan.Count - 1) do
     begin
        if (i > 0) then
           RangoSelec := RangoSelec + ', ';
        RangoSelec := RangoSelec + _('Canal') + ' ' + LCan[i];
     end;
  end;
end;

procedure TDMRAnaSumasySaldos.GenerarSQL(Modo: boolean; Canal: smallint; LCan: TStringList);
var
  Sentencia : string;
begin
  if (canal <> 0) then  // Tratamiento Simple
  begin
     with TSBalance do
     begin
        Close;
        Sentencia := 'SELECT * FROM ANA_TMP_BALANCES_SS_CC_PADRE ' +
           'WHERE EMPRESA=?EMPRESA  AND EJERCICIO=?EJERCICIO ' +
           DMMultiSeleccion.WhereCanales(LCan) +
           ' AND PLAN_CONTABLE=?PLAN_CONTABLE AND ENTRADA=?ENTRADA AND ' +
           ' NIVEL=?NIVEL_INI ';

        if not (Modo) then // Si no han de aparecer las cuentas de Saldo Cero
           Sentencia := Sentencia + 'AND DEBE<>HABER ';

        Sentencia := Sentencia + 'ORDER BY CENTRO_COSTE';
        SelectSQL.Text := Sentencia;
     end;

     with TSBalance_Medio do
     begin
        Close;
        Sentencia := 'SELECT * FROM ANA_TMP_BALANCES_SS_CC_PADRE ' +
           'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO ' +
           DMMultiSeleccion.WhereCanales(LCan) +
           ' AND ENTRADA=?ENTRADA AND PLAN_CONTABLE=?PLAN_CONTABLE AND ' +
           ' CENTRO_COSTE STARTING WITH ?CENTRO_COSTE AND ' +
           ' NIVEL>?NIVEL_INI AND NIVEL<=?NIVEL_FIN ';

        if not (Modo) then // Si no han de aparecer las cuentas de Saldo Cero
           Sentencia := Sentencia + 'AND DEBE<>HABER ';

        Sentencia := Sentencia + 'ORDER BY CENTRO_COSTE';
        SelectSQL.Text := Sentencia;
     end;

     with TSBalance_Detalle do
     begin
        Close;
        Sentencia := 'SELECT * FROM ANA_TMP_BALANCES_SS WHERE EMPRESA=?EMPRESA ' +
           'AND EJERCICIO=?EJERCICIO AND ENTRADA=?ENTRADA ' +
           DMMultiSeleccion.WhereCanales(LCan) +
           ' AND PLAN_CONTABLE=?PLAN_CONTABLE AND CENTRO_COSTE=?CENTRO_COSTE ';

        if not (Modo) then // Si no han de aparecer las cuentas de Saldo Cero
           Sentencia := Sentencia + 'AND DEBE<>HABER ';

        Sentencia := Sentencia + 'ORDER BY CENTRO_COSTE';
        SelectSQL.Text := Sentencia;
     end;
  end
  else // Multiselección
  begin
     with TSBalance do
     begin
        Close;
        Sentencia :=
           'SELECT EMPRESA,EJERCICIO,PLAN_CONTABLE,CENTRO_COSTE,ENTRADA,TITULO,' +
           'NIVEL,CENTRO_COSTE_PADRE,sum(debe) as debe,sum(haber) as haber,' +
           'sum(debe_mes) as debe_mes ,sum(haber_mes) as haber_mes ' +
           'FROM ANA_TMP_BALANCES_SS_SUPERIOR ' +
           'WHERE ENTRADA=?ENTRADA AND EMPRESA=?EMPRESA  AND EJERCICIO=?EJERCICIO ' +
           DMMultiSeleccion.WhereCanales(LCan) +
           ' AND PLAN_CONTABLE=?PLAN_CONTABLE AND NIVEL=?NIVEL_INI ';

        if not (Modo) then // Si no han de aparecer las cuentas de Saldo Cero
           Sentencia := Sentencia + 'AND DEBE<>HABER ';

        Sentencia := Sentencia +
           'GROUP BY EMPRESA,EJERCICIO,PLAN_CONTABLE,CENTRO_COSTE,ENTRADA,TITULO,' +
           'NIVEL,CENTRO_COSTE_PADRE ';
        Sentencia := Sentencia + 'ORDER BY CENTRO_COSTE';
        SelectSQL.Text := Sentencia;
     end;

     with TSBalance_Medio do
     begin
        Close;
        Sentencia :=
           'SELECT EMPRESA,EJERCICIO,PLAN_CONTABLE,CENTRO_COSTE,ENTRADA,TITULO,' +
           'NIVEL,CENTRO_COSTE_PADRE,sum(debe) as debe,sum(haber) as haber,' +
           'sum(debe_mes) as debe_mes ,sum(haber_mes) as haber_mes ' +
           'FROM ANA_TMP_BALANCES_SS_SUPERIOR ' +
           'WHERE ENTRADA=?ENTRADA AND EMPRESA=?EMPRESA  AND EJERCICIO=?EJERCICIO ' +
           DMMultiSeleccion.WhereCanales(LCan) +
           ' AND PLAN_CONTABLE=?PLAN_CONTABLE AND CENTRO_COSTE STARTING ' +
           'WITH ?CENTRO_COSTE AND NIVEL>?NIVEL_INI AND NIVEL<=?NIVEL_FIN ';

        if not (Modo) then // Si no han de aparecer las cuentas de Saldo Cero
           Sentencia := Sentencia + 'AND DEBE<>HABER ';

        Sentencia := Sentencia +
           'GROUP BY EMPRESA,EJERCICIO,PLAN_CONTABLE,CENTRO_COSTE,ENTRADA,TITULO,' +
           'NIVEL,CENTRO_COSTE_PADRE ';
        Sentencia := Sentencia + 'ORDER BY CENTRO_COSTE';
        SelectSQL.Text := Sentencia;
     end;

     with TSBalance_Detalle do
     begin
        Close;
        Sentencia :=
           'SELECT EMPRESA,EJERCICIO,PLAN_CONTABLE,CENTRO_COSTE,ENTRADA,TITULO,' +
           'CENTRO_COSTE_PADRE,sum(debe) as debe,sum(haber) as haber,' +
           'sum(debe_mes) as debe_mes ,sum(haber_mes) as haber_mes ' +
           'FROM ANA_TMP_BALANCES_SS ' +
           'WHERE ENTRADA=?ENTRADA AND EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO ' +
           DMMultiSeleccion.WhereCanales(LCan) +
           ' AND PLAN_CONTABLE=?PLAN_CONTABLE AND ' +
           ' CENTRO_COSTE=?CENTRO_COSTE ';

        if not (Modo) then // Si no han de aparecer las cuentas de Saldo Cero
           Sentencia := Sentencia + 'AND DEBE<>HABER ';

        Sentencia := Sentencia + 'GROUP BY EMPRESA,EJERCICIO,PLAN_CONTABLE,' +
           'CENTRO_COSTE,ENTRADA,TITULO,CENTRO_COSTE ';
        Sentencia := Sentencia + 'ORDER BY CENTRO_COSTE';
        SelectSQL.Text := Sentencia;
     end;
  end;
end;

procedure TDMRAnaSumasySaldos.ActivarConexiones;
begin
  with TSBalance do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['NIVEL_INI'].AsInteger := Nivel_Desde;
     Open;
  end;

  with TSBalance_Medio do
  begin
     Close;
     {Params.ByName['ENTRADA'].AsInteger   := REntorno.Entrada;
    Params.ByName['EMPRESA'].AsInteger   := REntorno.Empresa;
    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
    Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;}
     Params.ByName['NIVEL_INI'].AsInteger := Nivel_Desde;
     Params.ByName['NIVEL_FIN'].AsInteger := Nivel_Hasta;
     Open;
  end;

  {Las cuentas de detalle solo tienen que salir si queremos que salga el último
    nivel}
  {  if (Nivel_Hasta = Niveles.Count - 1) then
  begin
    with TSBalance_Detalle do
    begin
      Close;
      Params.ByName['ENTRADA'].AsInteger   := REntorno.Entrada;
      Params.ByName['EMPRESA'].AsInteger   := REntorno.Empresa;
      Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
      Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
      Open;
    end;
  end
  else
    with TSBalance_Detalle do
    begin
      Close;
      Params.ByName['ENTRADA'].AsInteger   := 0;
      Params.ByName['EMPRESA'].AsInteger   := 0;
      Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
      Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
      Open;
    end;}
end;

procedure TDMRAnaSumasySaldos.TSBalanceCalcFields(DataSet: TDataSet);
begin
  if (TSBalanceDEBE.AsFloat > TSBalanceHABER.AsFloat) then
  begin
     TSBalanceSALDO_DEUDOR.AsFloat := TSBalanceDEBE.AsFloat - TSBalanceHABER.AsFloat;
     TSBalanceSALDO_ACREEDOR.AsFloat := 0;
  end
  else
  begin
     TSBalanceSALDO_ACREEDOR.AsFloat := TSBalanceHABER.AsFloat - TSBalanceDEBE.AsFloat;
     TSBalanceSALDO_DEUDOR.AsFloat := 0;
  end;
end;

procedure TDMRAnaSumasySaldos.TSBalance_MedioCalcFields(DataSet: TDataSet);
begin
  if (TSBalance_MedioDEBE.AsFloat > TSBalance_MedioHABER.AsFloat) then
  begin
     TSBalance_MedioSALDO_DEUDOR.AsFloat := TSBalance_MedioDEBE.AsFloat -
        TSBalance_MedioHABER.AsFloat;
     TSBalance_MedioSALDO_ACREEDOR.AsFloat := 0;
  end
  else
  begin
     TSBalance_MedioSALDO_ACREEDOR.AsFloat :=
        TSBalance_MedioHABER.AsFloat - TSBalance_MedioDEBE.AsFloat;
     TSBalance_MedioSALDO_DEUDOR.AsFloat := 0;
  end;
end;

procedure TDMRAnaSumasySaldos.TSBalance_DetalleCalcFields(DataSet: TDataSet);
begin
  if (TSBalance_DetalleDEBE.AsFloat > TSBalance_DetalleHABER.AsFloat) then
  begin
     TSBalance_DetalleSALDO_DEUDOR.AsFloat :=
        TSBalance_DetalleDEBE.AsFloat - TSBalance_DetalleHABER.AsFloat;
     TSBalance_DetalleSALDO_ACREEDOR.AsFloat := 0;
  end
  else
  begin
     TSBalance_DetalleSALDO_ACREEDOR.AsFloat :=
        TSBalance_DetalleHABER.AsFloat - TSBalance_DetalleDEBE.AsFloat;
     TSBalance_DetalleSALDO_DEUDOR.AsFloat := 0;
  end;
end;

procedure TDMRAnaSumasySaldos.Rangos;
begin
  with SPRangos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     ExecQuery;
     Fecha_Desde := FieldByName['F_DESDE'].AsDateTime;
     Fecha_Hasta := FieldByName['F_HASTA'].AsDateTime;
     CentroCoste_Desde := FieldByName['CC_DESDE'].AsString;
     CentroCoste_Hasta := FieldByName['CC_HASTA'].AsString;
     Close;
     FreeHandle;
  end;

  if (Fecha_Desde = 0) then
     Fecha_Desde := REntorno.FechaTrab;
  if (Fecha_Hasta = 0) then
     Fecha_Hasta := REntorno.FechaTrab;
  // Secciones
  SeccionDesde := '';
  SeccionHasta := '';
end;

{procedure TDMRAnaSumasySaldos.AjustaCta_De(Cuenta: String);
begin
  with xMonedas do
  begin
    Close;
    Params.ByName['MONEDA'].AsString := REntorno.Moneda;
    Open;
  end;
end;

procedure TDMRAnaSumasySaldos.AjustaCta_Ha(Cuenta: String);
begin
  with xMonedas do
  begin
    Close;
    Params.ByName['MONEDA'].AsString := REntorno.Moneda;
    Open;
  end;
end;}

procedure TDMRAnaSumasySaldos.MostrarListado(modo: integer; desde, hasta: TDateTime);
var
  str : string;
begin
  Tdebemes := 0;
  Thabermes := 0;
  Tdebe := 0;
  Thaber := 0;
  Tsaldo_deudor := 0;
  Tsaldo_acreedor := 0;
  SW := 1;
  fdesde := desde;
  fhasta := hasta;

  EstableceMascaras;

  //Carga del listado
  DMListados.Cargar(602, '');
  frSumasySaldos.LoadFromFIB(REntorno.Formato, str);
  frSumasySaldos.PrepareReport;
  case modo of
     0: frSumasySaldos.ShowPreparedReport;
     1: frSumasySaldos.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMRAnaSumasySaldos.frSumasySaldosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Fecha1' then
     ParValue := fdesde;
  if ParName = 'Fecha2' then
     ParValue := fhasta;
  if ParName = 'Tipo_Razon' then
     ParValue := REntorno.TipoRazon;
  if ParName = 'MDebemes' then
  begin
     Tdebemes := Tdebemes + TSBalanceDEBE_MES.Value;
     ParValue := TSBalanceDEBE_MES.Value;
  end;
  if ParName = 'MHabermes' then
  begin
     Thabermes := Thabermes + TSBalanceHABER_MES.Value;
     ParValue := TSBalanceHABER_MES.Value;
  end;
  if ParName = 'MDebeAcumulado' then
  begin
     Tdebe := Tdebe + TSBalanceDEBE.Value;
     ParValue := TSBalanceDEBE.Value;
  end;
  if ParName = 'MHaberacumulado' then
  begin
     Thaber := Thaber + TSBalanceHABER.Value;
     ParValue := TSBalanceHABER.Value;
  end;
  if ParName = 'MSaldoDeudor' then
  begin
     TSaldo_deudor := TSaldo_deudor + TSBalanceSALDO_DEUDOR.Value;
     ParValue := TSBalanceSALDO_DEUDOR.Value;
  end;
  if ParName = 'MSaldoAcreedor' then
  begin
     TSaldo_Acreedor := TSaldo_Acreedor + TSBalanceSALDO_ACREEDOR.Value;
     ParValue := TSBalanceSALDO_ACREEDOR.Value;
  end;
  if ParName = 'TDebemes' then
  begin
     ParValue := Tdebemes;
  end;
  if ParName = 'THabermes' then
  begin
     ParValue := Thabermes;
  end;
  if ParName = 'TDebeAcumulado' then
  begin
     ParValue := TDebe;
  end;
  if ParName = 'THaberacumulado' then
  begin
     ParValue := Thaber;
  end;
  if ParName = 'TSaldoDeudor' then
  begin
     ParValue := TSaldo_Deudor;
  end;
  if ParName = 'TSaldoAcreedor' then
  begin
     ParValue := TSaldo_Acreedor;
  end;
  if ParName = 'Fecha' then
  begin
     ParValue := REntorno.FechaTrab;
  end;
  if ParName = 'TxtDebe' then
     ParValue := _('DEBE(Mes)');
  if ParName = 'TxtHaber' then
     ParValue := _('HABER(Mes)');

  if ParName = 'SECCION_INI' then
     ParValue := SeccionDesde;
  if ParName = 'SECCION_FIN' then
     ParValue := SeccionHasta;
end;

procedure TDMRAnaSumasySaldos.frSumasySaldosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
  end;
end;

procedure TDMRAnaSumasySaldos.frSumasySaldosBeginDoc;
begin
  Tdebemes := 0;
  Thabermes := 0;
  Tdebe := 0;
  Thaber := 0;
  TSaldo_Deudor := 0;
  TSaldo_Acreedor := 0;
end;

{ Actualiza la cuenta (bien Desde o bien Hasta) de la tabla deseada }
procedure TDMRAnaSumasySaldos.Actualiza_CentroCoste(Tabla: TFIBDataSetRO; CentroCoste: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := CentroCoste;
     Open;
  end;
end;

procedure TDMRAnaSumasySaldos.EstableceMascaras;
begin
  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('moneda').AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(xMonedas.FieldByName('moneda').AsString, 0);

  TSBalanceDEBE.DisplayFormat := LocalMascaraN;
  TSBalanceHABER.DisplayFormat := LocalMascaraN;
  TSBalanceDEBE_MES.DisplayFormat := LocalMascaraN;
  TSBalanceHABER_MES.DisplayFormat := LocalMascaraN;
  TSBalanceSALDO_ACREEDOR.DisplayFormat := LocalMascaraN;
  TSBalanceSALDO_DEUDOR.DisplayFormat := LocalMascaraN;
  TSBalance_MedioDEBE.DisplayFormat := LocalMascaraN;
  TSBalance_MedioHABER.DisplayFormat := LocalMascaraN;
  TSBalance_MedioDEBE_MES.DisplayFormat := LocalMascaraN;
  TSBalance_MedioHABER_MES.DisplayFormat := LocalMascaraN;
  TSBalance_MedioSALDO_ACREEDOR.DisplayFormat := LocalMascaraN;
  TSBalance_MedioSALDO_DEUDOR.DisplayFormat := LocalMascaraN;
  TSBalance_DetalleDEBE.DisplayFormat := LocalMascaraN;
  TSBalance_DetalleHABER.DisplayFormat := LocalMascaraN;
  TSBalance_DetalleDEBE_MES.DisplayFormat := LocalMascaraN;
  TSBalance_DetalleHABER_MES.DisplayFormat := LocalMascaraN;
  TSBalance_DetalleSALDO_ACREEDOR.DisplayFormat := LocalMascaraN;
  TSBalance_DetalleSALDO_DEUDOR.DisplayFormat := LocalMascaraN;
end;

procedure TDMRAnaSumasySaldos.LlenarNiveles;
var
  Ro : TFIBDataSetRO;
begin
  Ro := TFIBDataSetRO.Create(Self);
  with Ro do
     try
        Database := DMMain.DataBase;
        SelectSQL.Text := 'select distinct nivel from ana_centros_coste ' +
           ' where empresa=?empresa and ejercicio=?ejercicio and ' +
           ' canal=?canal and plan_contable=?plan_contable ' +
           ' order by nivel';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Open;

        Niveles.Clear;
        while not EOF do
        begin
           Niveles.Add(FieldByName('NIVEL').AsString);
           Next;
        end;
     finally
        Free;
     end;
end;

procedure TDMRAnaSumasySaldos.MinPlanContable;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'execute procedure n_apuntes_plan_min_max(?empresa,' +
           '?ejercicio,?canal)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        PlanContableMin := FieldByName['PLAN_DESDE'].AsString;
     finally
        Free;
     end;
end;

procedure TDMRAnaSumasySaldos.Actualiza_Plan(PlanContable: string);
begin
  with xPlan do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := PlanContable;
     Open;
  end;
end;

function TDMRAnaSumasySaldos.DamePlanContable: string;
begin
  Result := xPlanPLAN_CONTABLE.AsString;
end;

procedure TDMRAnaSumasySaldos.BorraTemporales;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'delete from ana_tmp_balances_ss where entrada=' +
           REntorno.EntradaStr;
        ExecQuery;

        SQL.Text := 'delete from ana_tmp_balances_ss_cc_padre where entrada=' +
           REntorno.EntradaStr;
        ExecQuery;
     finally
        Free;
     end;
end;

end.
