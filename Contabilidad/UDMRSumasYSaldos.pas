unit UDMRSumasYSaldos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, FIBQuery, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, ComCtrls;

type
  TDMRSumasySaldos = class(TDataModule)
     TSBalance: TFIBTableSet;
     TSBalance_Medio: TFIBTableSet;
     DSBalance: TDataSource;
     DSBalance_Medio: TDataSource;
     TSBalance_Detalle: TFIBTableSet;
     DSBalance_Detalle: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     frSumasySaldos: TfrHYReport;
     frDSBalance: TfrDBDataSet;
     frDSBalance_Medio: TfrDBDataSet;
     frDSBalance_Detalle: TfrDBDataSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     frxSumasySaldos: TfrxHYReport;
     TSBalanceMes: TFIBTableSet;
     DSBalanceMes: TDataSource;
     frDSBalanceMes: TfrDBDataSet;
     xBalanceExportacionExcel: TFIBTableSet;
     DSBalanceExportacionExcel: TDataSource;
     procedure DMRSumasYSaldosCreate(Sender: TObject);
     procedure DMRSumasySaldosDestroy(Sender: TObject);
     procedure frSumasySaldosGetValue(const ParName: string; var ParValue: variant);
     procedure frSumasySaldosEnterRect(Memo: TStringList; View: TfrView);
     procedure frSumasySaldosBeginDoc;
     procedure frxSumasySaldosBeforePrint(Sender: TfrxReportComponent);
     procedure frxSumasySaldosBeginDoc(Sender: TObject);
     procedure frxSumasySaldosGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     LocalMascaraN, LocalMascaraL: string;
     SW: integer;
     TDebeMes, THaberMes, TDebe, THaber, TSaldo_Deudor, TSaldo_Acreedor: double;
     RangoSelec: string;
     FechaDesde, FechaHasta: TDateTime;
     NivelFiltro: smallint;
     NivelDesde, NivelHasta: smallint;
     SeccionDesde, SeccionHasta: string;
     Apertura: boolean;
     procedure GenerarSQL(SaldoCero: boolean; Canal: smallint; LCan: TStringList; PorMeses, Perdidas, Ganancias, Cierre: boolean);
     procedure EstableceMascaras;
     procedure ActualizarRangoSelec(LCan: TStrings; Canal: smallint);
     procedure ActivarConexiones(PorMeses: boolean; CuentaDesde, CuentaHasta: string);
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; Desde, Hasta: TDateTime; PorMeses: boolean; Archivo: string = ''; PBListado: TProgressBar = nil);
     procedure CalculaInforme(SaldoCero, aApertura, NoRegul, NoCierre: boolean; LCan: TStringList; Canal: smallint; D1, D2, D3, D4, D5: string; aFechaDesde, aFechaHasta: TDateTime; CuentaDesde, CuentaHasta: string; aNivelFiltro, aNivelDesde, aNivelHasta: smallint; aSeccionDesde, aSeccionHasta: string; PorMeses, Perdidas, Ganancias, Cierre: boolean);
     procedure Rangos(var FechaDesde, FechaHasta: TDateTime; var CuentaDesde, CuentaHasta: string);
     procedure AjustaCta_De(Cuenta: string);
     procedure AjustaCta_Ha(Cuenta: string);
     function DameCuentaMinMax(Tipo, Clave: string): string;
  end;

var
  DMRSumasySaldos : TDMRSumasySaldos;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UDMMultiSeleccion, UUtiles;

{$R *.DFM}

procedure TDMRSumasySaldos.DMRSumasYSaldosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  xMonedas.Open;
end;

procedure TDMRSumasySaldos.DMRSumasySaldosDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRSumasySaldos.CalculaInforme(SaldoCero, aApertura, NoRegul, NoCierre: boolean; LCan: TStringList; Canal: smallint; D1, D2, D3, D4, D5: string; aFechaDesde, aFechaHasta: TDateTime; CuentaDesde, CuentaHasta: string; aNivelFiltro, aNivelDesde, aNivelHasta: smallint; aSeccionDesde, aSeccionHasta: string; PorMeses, Perdidas, Ganancias, Cierre: boolean);
begin
  FechaDesde := aFechaDesde;
  FechaHasta := aFechaHasta;

  NivelFiltro := aNivelFiltro;
  NivelDesde := aNivelDesde;
  NivelHasta := aNivelHasta;

  SeccionDesde := aSeccionDesde;
  SeccionHasta := aSeccionHasta;

  DMListados.Normalizar_desde_hasta(SeccionDesde, SeccionHasta);
  ActualizarRangoSelec(LCan, Canal);

  Apertura := aApertura;

  if (not PorMeses) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('EXECUTE PROCEDURE C_CUENTAS_BALANCE_DETALLE(:EMPRESA, :EJERCICIO, :CANAL, :USUARIO, ');
           SQL.Add(':FECHA_INI, :FECHA_FIN, :CUENTA_INI, :CUENTA_FIN, ');
           SQL.Add(':MONEDA, :APERTURA, :ENTRADA, :NO_REGUL, :NO_CIERRE, ');
           SQL.Add(':SECCION_INI, :SECCION_FIN, :NIVEL_FILTRO, ');
           SQL.Add(':D1, :D2, :D3, :D4, :D5)');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
           Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
           Params.ByName['CUENTA_INI'].AsString := CuentaDesde;
           Params.ByName['CUENTA_FIN'].AsString := CuentaHasta;
           Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
           Params.ByName['APERTURA'].AsInteger := BoolToInt(Apertura);
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['NO_REGUL'].AsInteger := BoolToInt(NoRegul);
           Params.ByName['NO_CIERRE'].AsInteger := BoolToInt(NoCierre);
           Params.ByName['D1'].AsString := D1;
           Params.ByName['D2'].AsString := D2;
           Params.ByName['D3'].AsString := D3;
           Params.ByName['D4'].AsString := D4;
           Params.ByName['D5'].AsString := D5;
           Params.ByName['SECCION_INI'].AsString := SeccionDesde;
           Params.ByName['SECCION_FIN'].AsString := SeccionHasta;
           Params.ByName['NIVEL_FILTRO'].AsInteger := NivelFiltro;
           ExecQuery;
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
           SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_BALANCE_NIVELES(:EMPRESA, :EJERCICIO, :CANAL, :USUARIO, :NIVEL_INI, :NIVEL_FIN, :ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['NIVEL_INI'].AsInteger := NivelDesde;
           Params.ByName['NIVEL_FIN'].AsInteger := NivelHasta;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  GenerarSQL(SaldoCero, Canal, LCan, PorMeses, Perdidas, Ganancias, Cierre);
  ActivarConexiones(PorMeses, CuentaDesde, CuentaHasta);
end;

procedure TDMRSumasySaldos.ActualizarRangoSelec(LCan: TStrings; Canal: smallint);
var
  i : integer;
begin
  if (LCan.Count = 0) then
     RangoSelec := _('Canal') + ': ' + IntToStr(Canal)
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

procedure TDMRSumasySaldos.GenerarSQL(SaldoCero: boolean; Canal: smallint; LCan: TStringList; PorMeses, Perdidas, Ganancias, Cierre: boolean);
var
  RegCierre : string;
begin
  RegCierre := '';
  // Solo filtro si hay algo seleccionado
  if (Cierre or Perdidas or Ganancias) then
  begin
     RegCierre := '-1';
     if (Cierre) then
        RegCierre := RegCierre + ', 0';

     if (Perdidas) then
        RegCierre := RegCierre + ', 1';

     if (Ganancias) then
        RegCierre := RegCierre + ', 2';
  end;

  if (PorMeses) then
  begin
     with TSBalanceMes do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT CT.EJERCICIO, CT.CUENTA, CT.TITULO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''00'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) APERTURA, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''98'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) REGULARIZACION, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''99'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) CIERRE, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''01'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) ENERO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''02'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) FEBRERO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''03'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) MARZO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''04'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) ABRIL, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''05'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) MAYO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''06'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) JUNIO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''07'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) JULIO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''08'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) AGOSTO, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''09'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) SEPTIEMBRE, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''10'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) OCTUBRE, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''11'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) NOVIEMBRE, ');
        SelectSQL.Add('       SUM(COALESCE((SELECT S.SALDO ');
        SelectSQL.Add('           FROM CON_CUENTAS_SALDOS S ');
        SelectSQL.Add('           WHERE ');
        SelectSQL.Add('           CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('           CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('           CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('           CT.CUENTA = S.CUENTA AND ');
        SelectSQL.Add('           S.PERIODO = ''12'' AND ');
        SelectSQL.Add('           CT.PGC = S.CUENTA_PGC), 0)) DICIEMBRE, ');
        SelectSQL.Add('      MIN(COALESCE((SELECT COUNT(*) ');
        SelectSQL.Add('          FROM CON_CUENTAS_APUNTES S ');
        SelectSQL.Add('          WHERE ');
        SelectSQL.Add('          CT.EMPRESA = S.EMPRESA AND ');
        SelectSQL.Add('          CT.CANAL = S.CANAL AND ');
        SelectSQL.Add('          CT.EJERCICIO = S.EJERCICIO AND ');
        SelectSQL.Add('          S.CUENTA STARTING WITH CT.CUENTA AND ');
        SelectSQL.Add('          CT.PGC = S.CUENTA_PGC), 0)) CANT_APUNTES ');
        SelectSQL.Add(' FROM CON_CUENTAS CT ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' CT.EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' CT.EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CT.CANAL = :CANAL AND ');
        SelectSQL.Add(' CT.CUENTA BETWEEN :CUENTA_INI AND :CUENTA_FIN AND ');
        SelectSQL.Add(' CT.NIVEL >= :NIVELDESDE AND CT.NIVEL <= :NIVELHASTA ');
        if (RegCierre > '') then
           SelectSQL.Add(' AND CT.REG_CIERRE IN (' + RegCierre + ') ');

        // Si no han de aparecer las cuentas de Saldo Cero
        if not (SaldoCero) then
        begin
           SelectSQL.Add(' AND (COALESCE((SELECT COUNT(*) ');
           SelectSQL.Add('                FROM CON_CUENTAS_APUNTES S ');
           SelectSQL.Add('                WHERE ');
           SelectSQL.Add('                CT.EMPRESA = S.EMPRESA AND ');
           SelectSQL.Add('                CT.CANAL = S.CANAL AND ');
           SelectSQL.Add('                CT.EJERCICIO = S.EJERCICIO AND ');
           SelectSQL.Add('                S.CUENTA STARTING WITH CT.CUENTA AND ');
           SelectSQL.Add('                CT.PGC = S.CUENTA_PGC), 0) > 0) ');
        end;

        SelectSQL.Add(' GROUP BY CT.EJERCICIO, CT.CUENTA, CT.TITULO ');
        SelectSQL.Add(' ORDER BY CT.EJERCICIO, CT.CUENTA ');
     end;
  end
  else
  begin
     if (Canal <> 0) then  // Tratamiento Simple
     begin
        with TSBalance do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT T.*, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) > 0) THEN ');
           SelectSQL.Add('              (T.DEBE - T.HABER) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) < 0) THEN ');
           SelectSQL.Add('              (T.HABER - T.DEBE) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS_SUPERIOR T ');
           SelectSQL.Add(' JOIN CON_CUENTAS C ON T.EMPRESA = C.EMPRESA AND T.EJERCICIO = C.EJERCICIO AND T.CANAL = C.CANAL AND T.CUENTA = C.CUENTA AND T.CUENTA_PGC = C.PGC ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO ');
           SelectSQL.Add(DMMultiSeleccion.WhereCanales(LCan));
           SelectSQL.Add(' AND T.USUARIO = :USUARIO ');
           SelectSQL.Add(' AND T.NIVEL = :NIVEL_INI ');
           if (RegCierre > '') then
              SelectSQL.Add(' AND C.REG_CIERRE IN (' + RegCierre + ') ');

           // Si no han de aparecer las cuentas de Saldo Cero
           if not (SaldoCero) then
              SelectSQL.Add(' AND T.DEBE <> T.HABER ');

           SelectSQL.Add(' ORDER BY T.CUENTA ');
        end;

        with xBalanceExportacionExcel do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT T.*, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) > 0) THEN ');
           SelectSQL.Add('              (T.DEBE - T.HABER) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) < 0) THEN ');
           SelectSQL.Add('              (T.HABER - T.DEBE) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS_SUPERIOR T ');
           SelectSQL.Add(' JOIN CON_CUENTAS C ON T.EMPRESA = C.EMPRESA AND T.EJERCICIO = C.EJERCICIO AND T.CANAL = C.CANAL AND T.CUENTA = C.CUENTA AND T.CUENTA_PGC = C.PGC ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO ');
           SelectSQL.Add(DMMultiSeleccion.WhereCanales(LCan));
           SelectSQL.Add(' AND T.USUARIO = :USUARIO ');
           SelectSQL.Add(' AND T.NIVEL BETWEEN :NIVEL_INI AND :NIVEL_FIN ');
           if (RegCierre > '') then
              SelectSQL.Add(' AND C.REG_CIERRE IN (' + RegCierre + ') ');

           // Si no han de aparecer las cuentas de Saldo Cero
           if not (SaldoCero) then
              SelectSQL.Add(' AND T.DEBE <> T.HABER ');

           SelectSQL.Add(' ORDER BY T.CUENTA ');
        end;

        with TSBalance_Medio do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT T.*, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) > 0) THEN ');
           SelectSQL.Add('              (T.DEBE - T.HABER) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) < 0) THEN ');
           SelectSQL.Add('              (T.HABER - T.DEBE) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS_SUPERIOR T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO ');
           SelectSQL.Add(DMMultiSeleccion.WhereCanales(LCan));
           SelectSQL.Add(' AND T.USUARIO = :USUARIO ');
           SelectSQL.Add(' AND T.CUENTA STARTING WITH :CUENTA ');
           SelectSQL.Add(' AND T.NIVEL > :NIVEL_INI AND T.NIVEL <= :NIVEL_FIN ');

           // Si no han de aparecer las cuentas de Saldo Cero
           if not (SaldoCero) then
              SelectSQL.Add(' AND T.DEBE <> T.HABER ');

           SelectSQL.Add(' ORDER BY CUENTA ');
        end;

        with TSBalance_Detalle do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT T.*, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) > 0) THEN ');
           SelectSQL.Add('              (T.DEBE - T.HABER) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((T.DEBE - T.HABER) < 0) THEN ');
           SelectSQL.Add('              (T.HABER - T.DEBE) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' T.CANAL = :CANAL AND ');
           SelectSQL.Add(' T.USUARIO = :USUARIO AND ');
           SelectSQL.Add(' T.SUPERIOR = :CUENTA ');

           // Si no han de aparecer las cuentas de Saldo Cero
           if not (SaldoCero) then
              SelectSQL.Add(' AND T.DEBE <> T.HABER ');

           SelectSQL.Add(' ORDER BY T.CUENTA ');
        end;
     end
     else
     begin
        // Multiselección
        with TSBalance do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT T.EMPRESA, T.EJERCICIO, MIN(T.CANAL) CANAL, T.CUENTA, T.USUARIO, T.TITULO, SUM(T.DEBE) DEBE, SUM(T.HABER) HABER, ');
           SelectSQL.Add('        SUM(T.DEBE_MES) DEBE_MES, SUM(T.HABER_MES) HABER_MES, T.NIVEL, T.SUPERIOR, T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, ');
           SelectSQL.Add('        T.DIGITO_4, T.DIGITO_5, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) > 0) THEN ');
           SelectSQL.Add('              (SUM(T.DEBE) - SUM(T.HABER)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) < 0) THEN ');
           SelectSQL.Add('              (SUM(T.HABER) - SUM(T.DEBE)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS_SUPERIOR T ');
           SelectSQL.Add(' JOIN CON_CUENTAS C ON T.EMPRESA = C.EMPRESA AND T.EJERCICIO = C.EJERCICIO AND T.CANAL = C.CANAL AND T.CUENTA = C.CUENTA AND T.CUENTA_PGC = C.PGC ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO ');
           SelectSQL.Add(DMMultiSeleccion.WhereCanales(LCan));
           SelectSQL.Add(' AND T.USUARIO = :USUARIO ');
           SelectSQL.Add(' AND T.NIVEL = :NIVEL_INI ');
           if (RegCierre > '') then
              SelectSQL.Add(' AND C.REG_CIERRE IN (' + RegCierre + ') ');

           SelectSQL.Add(' GROUP BY T.EMPRESA, T.EJERCICIO, T.CUENTA, T.USUARIO, T.TITULO, T.NIVEL, T.SUPERIOR, T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, T.DIGITO_4, T.DIGITO_5 ');

           if not (SaldoCero) then // Si no han de aparecer las cuentas de Saldo Cero
              SelectSQL.Add(' HAVING SUM(T.DEBE) <> SUM(T.HABER) ');

           SelectSQL.Add(' ORDER BY T.CUENTA ');
        end;

        with xBalanceExportacionExcel do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT T.EMPRESA, T.EJERCICIO, MIN(T.CANAL) CANAL, T.CUENTA, T.USUARIO, T.TITULO, SUM(T.DEBE) DEBE, SUM(T.HABER) HABER, ');
           SelectSQL.Add('        SUM(T.DEBE_MES) DEBE_MES, SUM(T.HABER_MES) HABER_MES, T.NIVEL, T.SUPERIOR, T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, ');
           SelectSQL.Add('        T.DIGITO_4, T.DIGITO_5, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) > 0) THEN ');
           SelectSQL.Add('              (SUM(T.DEBE) - SUM(T.HABER)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) < 0) THEN ');
           SelectSQL.Add('              (SUM(T.HABER) - SUM(T.DEBE)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS_SUPERIOR T ');
           SelectSQL.Add(' JOIN CON_CUENTAS C ON T.EMPRESA = C.EMPRESA AND T.EJERCICIO = C.EJERCICIO AND T.CANAL = C.CANAL AND T.CUENTA = C.CUENTA AND T.CUENTA_PGC = C.PGC ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO ');
           SelectSQL.Add(DMMultiSeleccion.WhereCanales(LCan));
           SelectSQL.Add(' AND T.USUARIO = :USUARIO ');
           SelectSQL.Add(' AND T.NIVEL BETWEEN :NIVEL_INI AND :NIVEL_FIN ');
           if (RegCierre > '') then
              SelectSQL.Add(' AND C.REG_CIERRE IN (' + RegCierre + ') ');

           SelectSQL.Add(' GROUP BY T.EMPRESA, T.EJERCICIO, T.CUENTA, T.USUARIO, T.TITULO, T.NIVEL, T.SUPERIOR, T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, T.DIGITO_4, T.DIGITO_5 ');

           if not (SaldoCero) then // Si no han de aparecer las cuentas de Saldo Cero
              SelectSQL.Add(' HAVING SUM(T.DEBE) <> SUM(T.HABER) ');

           SelectSQL.Add(' ORDER BY T.CUENTA ');
        end;

        with TSBalance_Medio do
        begin
           Close;
           SelectSQL.Clear;

           SelectSQL.Add(' SELECT T.EMPRESA, T.EJERCICIO, T.CUENTA, T.USUARIO, T.TITULO, T.NIVEL, T.SUPERIOR, ');
           SelectSQL.Add('        T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, T.DIGITO_4, T.DIGITO_5, ');
           SelectSQL.Add('        SUM(T.DEBE) AS DEBE, SUM(T.HABER) AS HABER, ');
           SelectSQL.Add('        SUM(T.DEBE_MES) AS DEBE_MES, SUM(T.HABER_MES) AS HABER_MES, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) > 0) THEN ');
           SelectSQL.Add('              (SUM(T.DEBE) - SUM(T.HABER)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) < 0) THEN ');
           SelectSQL.Add('              (SUM(T.HABER) - SUM(T.DEBE)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS_SUPERIOR T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO ');
           SelectSQL.Add(DMMultiSeleccion.WhereCanales(LCan));
           SelectSQL.Add(' AND T.USUARIO = :USUARIO ');
           SelectSQL.Add(' AND T.CUENTA STARTING WITH :CUENTA ');
           SelectSQL.Add(' AND T.NIVEL > :NIVEL_INI AND T.NIVEL <= :NIVEL_FIN ');

           SelectSQL.Add(' GROUP BY T.EMPRESA, T.EJERCICIO, T.CUENTA, T.USUARIO, T.TITULO, T.NIVEL, T.SUPERIOR, T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, T.DIGITO_4, T.DIGITO_5 ');

           if not (SaldoCero) then // Si no han de aparecer las cuentas de Saldo Cero
              SelectSQL.Add(' HAVING SUM(T.DEBE) <> SUM(T.HABER) ');

           SelectSQL.Add(' ORDER BY T.CUENTA ');
        end;

        with TSBalance_Detalle do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT T.EMPRESA, T.EJERCICIO, T.CUENTA, T.USUARIO, T.TITULO, T.SUPERIOR, ');
           SelectSQL.Add('        T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, T.DIGITO_4, T.DIGITO_5, ');
           SelectSQL.Add('        SUM(T.DEBE) AS DEBE, SUM(T.HABER) AS HABER, ');
           SelectSQL.Add('        SUM(T.DEBE_MES) AS DEBE_MES, SUM(T.HABER_MES) AS HABER_MES, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) > 0) THEN ');
           SelectSQL.Add('              (SUM(T.DEBE) - SUM(T.HABER)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_DEUDOR, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN ((SUM(T.DEBE) - SUM(T.HABER)) < 0) THEN ');
           SelectSQL.Add('              (SUM(T.HABER) - SUM(T.DEBE)) ');
           SelectSQL.Add('          ELSE 0 ');
           SelectSQL.Add('        END SALDO_ACREEDOR ');
           SelectSQL.Add(' FROM TMP_CON_BALANCES_SS T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO ');
           SelectSQL.Add(DMMultiSeleccion.WhereCanales(LCan));
           SelectSQL.Add(' AND T.USUARIO = :USUARIO ');
           SelectSQL.Add(' AND T.SUPERIOR = :CUENTA ');

           SelectSQL.Add(' GROUP BY T.EMPRESA, T.EJERCICIO, T.CUENTA, T.USUARIO, T.TITULO, T.SUPERIOR, T.DIGITO_1, T.DIGITO_2, T.DIGITO_3, T.DIGITO_4, T.DIGITO_5 ');

           if not (SaldoCero) then // Si no han de aparecer las cuentas de Saldo Cero
              SelectSQL.Add(' HAVING SUM(T.DEBE) <> SUM(T.HABER) ');

           SelectSQL.Add(' ORDER BY T.CUENTA ');
        end;
     end;
  end;
end;

procedure TDMRSumasySaldos.ActivarConexiones(PorMeses: boolean; CuentaDesde, CuentaHasta: string);
begin
  if PorMeses then
  begin
     with TSBalanceMes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA_INI'].AsString := CuentaDesde;
        Params.ByName['CUENTA_FIN'].AsString := CuentaHasta;
        Params.ByName['NIVELDESDE'].AsInteger := NivelDesde;
        Params.ByName['NIVELHASTA'].AsInteger := NivelHasta;
        Open;
     end;
  end
  else
  begin
     with TSBalance do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['USUARIO'].AsInteger := REntorno.usuario;
        Params.ByName['NIVEL_INI'].AsInteger := NivelDesde;
        Open;
     end;

     with xBalanceExportacionExcel do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['USUARIO'].AsInteger := REntorno.usuario;
        Params.ByName['NIVEL_INI'].AsInteger := NivelDesde;
        Params.ByName['NIVEL_FIN'].AsInteger := NivelHasta;
        Open;
     end;

     with TSBalance_Medio do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
        Params.ByName['USUARIO'].AsInteger := REntorno.usuario;
        Params.ByName['NIVEL_INI'].AsInteger := NivelDesde;
        Params.ByName['NIVEL_FIN'].AsInteger := NivelHasta;
        Open;
     end;

     // Las cuentas de detalle solo tienen que salir si queremos que salga el ultimo nivel
     if (NivelHasta = REntorno.NivelesCont) then
     begin
        with TSBalance_Detalle do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
           Params.ByName['USUARIO'].AsInteger := REntorno.usuario;
           Open;
        end;
     end
     else
        with TSBalance_Detalle do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := 0;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
           Params.ByName['USUARIO'].AsInteger := REntorno.usuario;
           Open;
        end;
  end;
end;

procedure TDMRSumasySaldos.Rangos(var FechaDesde, FechaHasta: TDateTime; var CuentaDesde, CuentaHasta: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_ASIENTOS_MAX_MIN(:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FechaDesde := FieldByName['F_DESDE'].AsDateTime;
        FechaHasta := FieldByName['F_HASTA'].AsDateTime;
        CuentaDesde := FieldByName['C_DESDE'].AsString;
        CuentaHasta := FieldByName['C_HASTA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (FechaDesde = 0) then
     FechaDesde := REntorno.FechaTrab;
  if (FechaHasta = 0) then
     FechaHasta := REntorno.FechaTrab;
end;

procedure TDMRSumasySaldos.AjustaCta_De(Cuenta: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := REntorno.Moneda;
     Open;
  end;
end;

procedure TDMRSumasySaldos.AjustaCta_Ha(Cuenta: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := REntorno.Moneda;
     Open;
  end;
end;

procedure TDMRSumasySaldos.MostrarListado(Modo: integer; Desde, Hasta: TDateTime; PorMeses: boolean; Archivo: string = ''; PBListado: TProgressBar = nil);
var
  Grupo : integer;
begin
  TDebeMes := 0;
  THaberMes := 0;
  TDebe := 0;
  THaber := 0;
  Tsaldo_deudor := 0;
  Tsaldo_acreedor := 0;
  SW := 1;
  FechaDesde := Desde;
  FechaHasta := Hasta;

  EstableceMascaras;

  Grupo := 26;
  if (PorMeses) then
     Grupo := 207;

  if (Modo = 2) then
  begin
     if (Archivo = '') then
     begin
        Archivo := Format(_('SumasYSaldos-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
        if not MySaveDialog(Archivo, 'XLS,ODS', '', 'DMRSumasySaldos') then
           Archivo := '';
     end;

     // Borro fichero antes de volver a crearlo.
     DeleteFile(Archivo);

     if (Archivo <> '') then
     begin
        if PorMeses then
           ExportarExcel(Archivo, DSBalanceMes, True, False, PBListado)
        else
        begin
           xBalanceExportacionExcel.FieldByName('EMPRESA').Visible := False;
           xBalanceExportacionExcel.FieldByName('CANAL').Visible := False;
           xBalanceExportacionExcel.FieldByName('USUARIO').Visible := False;
           ExportarExcel(Archivo, DSBalanceExportacionExcel, True, False, PBListado);
        end;
     end;
  end
  else
     DMListados.Imprimir(Grupo, 0, Modo, '', '', frSumasySaldos, frxSumasySaldos, nil);
end;

procedure TDMRSumasySaldos.frSumasySaldosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Fecha1' then
     ParValue := FechaDesde;
  if ParName = 'Fecha2' then
     ParValue := FechaHasta;
  if ParName = 'Tipo_Razon' then
     ParValue := REntorno.TipoRazon;

  if ParName = 'MDebemes' then
  begin
     TDebeMes := TDebeMes + TSBalance.FieldByName('DEBE_MES').Value;
     ParValue := TSBalance.FieldByName('DEBE_MES').Value;
  end;
  if ParName = 'MHabermes' then
  begin
     THaberMes := THaberMes + TSBalance.FieldByName('HABER_MES').Value;
     ParValue := TSBalance.FieldByName('HABER_MES').Value;
  end;

  if ParName = 'MDebeAcumulado' then
  begin
     TDebe := TDebe + TSBalance.FieldByName('DEBE').Value;
     ParValue := TSBalance.FieldByName('DEBE').Value;
  end;
  if ParName = 'MHaberacumulado' then
  begin
     THaber := THaber + TSBalance.FieldByName('HABER').Value;
     ParValue := TSBalance.FieldByName('HABER').Value;
  end;

  if ParName = 'MSaldoDeudor' then
  begin
     TSaldo_deudor := TSaldo_deudor + TSBalance.FieldByName('SALDO_DEUDOR').Value;
     ParValue := TSBalance.FieldByName('SALDO_DEUDOR').Value;
  end;
  if ParName = 'MSaldoAcreedor' then
  begin
     TSaldo_Acreedor := TSaldo_Acreedor + TSBalance.FieldByName('SALDO_ACREEDOR').Value;
     ParValue := TSBalance.FieldByName('SALDO_ACREEDOR').Value;
  end;

  if ParName = 'TDebemes' then
  begin
     ParValue := TDebeMes;
  end;
  if ParName = 'THabermes' then
  begin
     ParValue := THaberMes;
  end;

  if ParName = 'TDebeAcumulado' then
  begin
     ParValue := TDebe;
  end;
  if ParName = 'THaberacumulado' then
  begin
     ParValue := THaber;
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
     if (Apertura) then
        ParValue := _('DEBE(Ap.)')
     else
        ParValue := _('DEBE(Mes)');

  if ParName = 'TxtHaber' then
     if (Apertura) then
        ParValue := _('HABER(Ap.)')
     else
        ParValue := _('HABER(Mes)');

  if ParName = 'SECCION_INI' then
     ParValue := SeccionDesde;

  if ParName = 'SECCION_FIN' then
     ParValue := SeccionHasta;
end;

procedure TDMRSumasySaldos.frSumasySaldosEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMRSumasySaldos.frSumasySaldosBeginDoc;
begin
  TDebeMes := 0;
  THaberMes := 0;
  TDebe := 0;
  THaber := 0;
  TSaldo_Deudor := 0;
  TSaldo_Acreedor := 0;
end;

procedure TDMRSumasySaldos.EstableceMascaras;
begin
  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('moneda').AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(xMonedas.FieldByName('moneda').AsString, 0);
end;

procedure TDMRSumasySaldos.frxSumasySaldosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRSumasySaldos.frxSumasySaldosBeginDoc(Sender: TObject);
begin
  frSumasySaldosBeginDoc;
end;

procedure TDMRSumasySaldos.frxSumasySaldosGetValue(const VarName: string; var Value: variant);
begin
  frSumasySaldosGetValue(VarName, Value);
end;

function TDMRSumasySaldos.DameCuentaMinMax(Tipo, Clave: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ');

        if (Tipo = 'MAX') then
           SQL.Add('MAX(CUENTA) AS CUENTA ')
        else
           SQL.Add('MIN(CUENTA) AS CUENTA ');

        SQL.Add(' FROM CON_CUENTAS_APUNTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' CUENTA STARTING WITH :CLAVE ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLAVE'].AsString := Clave;
        ExecQuery;
        Result := FieldByName['CUENTA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
