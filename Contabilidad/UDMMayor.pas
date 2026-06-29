unit UDMMayor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, StdCtrls, FIBQuery, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBTableDataSetRO, HYFIBQuery,
  FIBDataSetRW, DateUtils, ComCtrls;

type
  TDMMayor = class(TDataModule)
     xMayor: TFIBTableSetRO;
     xCuentas: TFIBTableSetRO;
     DSxCuentas: TDataSource;
     DSxMayor: TDataSource;
     xSaldos: TFIBDataSetRO;
     DSxSaldos: TDataSource;
     xMayorFECHA: TDateTimeField;
     xMayorDEBE: TFloatField;
     xMayorHABER: TFloatField;
     xMayorD_NUMERO: TIntegerField;
     xMayorD_SERIE: TFIBStringField;
     xMayorD_FECHA: TDateTimeField;
     xMayorLINEA: TIntegerField;
     xMayorSALDO: TFloatField;
     TLocal: THYTransaction;
     xMayorASIENTO: TIntegerField;
     xMayorRIC: TIntegerField;
     xmayor_cuenta_periodo: TFIBDataSetRO;
     xmayor_cuenta_periodoPERIODO: TFIBStringField;
     xmayor_cuenta_periodoTIT_PER: TFIBStringField;
     xmayor_cuenta_periodoDEBE: TFloatField;
     xmayor_cuenta_periodoHABER: TFloatField;
     xmayor_cuenta_periodoSALDO: TFloatField;
     DSxmayor_cuenta_periodo: TDataSource;
     xSaldosDEBE: TFloatField;
     xSaldosHABER: TFloatField;
     xSaldosSALDO: TFloatField;
     xSaldosDEBE_A: TFloatField;
     xSaldosHABER_A: TFloatField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xMayorTEXTO: TFIBStringField;
     xSaldosSALDO_A: TFloatField;
     xSaldosSALDO_RNG: TFloatField;
     xCuentasCUENTA: TFIBStringField;
     xCuentasCANAL: TIntegerField;
     xCuentasTITULO: TFIBStringField;
     xCuentasTIPO: TIntegerField;
     xCuentasSUPERIOR: TFIBStringField;
     xMayorCANAL: TIntegerField;
     xMayorTIPO: TFIBStringField;
     xMayorTIPO_ASIENTO_KRI: TFIBStringField;
     xMayorDIGITO_1: TFIBStringField;
     xMayorDIGITO_2: TFIBStringField;
     xMayorDIGITO_3: TFIBStringField;
     xMayorDIGITO_4: TFIBStringField;
     xMayorDIGITO_5: TFIBStringField;
     xMayorEMPRESA_R: TIntegerField;
     xMayorEJERCICIO_R: TIntegerField;
     TUpdate: THYTransaction;
     xMayorPUNTEO: TIntegerField;
     xMayorFECHA_PUNTEO: TDateTimeField;
     procedure DMMayorCreate(Sender: TObject);
     procedure xCuentasAfterOpen(DataSet: TDataSet);
     procedure xCuentasBeforeOpen(DataSet: TDataSet);
     procedure xCuentasAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     Desde, Hasta: TDateTime;
  public
     { Public declarations }
     Moneda: string;
     LocalMascaraN: string;
     Alcance: integer;
     Canal, Cliente: integer;
     D1, D2, D3, D4, D5: string;
     procedure Filtra(aDesde, aHasta: TDateTime);
     function ABorrador: integer;
     procedure ABorradorConDatos(var Empresa, Ejercicio, RIB: integer);
     procedure Refresca;
     function DameRic: string;
     function DameTipoAsiento: string;
     procedure LanzaListado(D1, D2, D3, D4, D5: string; Desde, Hasta: TDateTime; PBListado: TProgressBar = nil);
     procedure ListadoMayor(nCanal: integer; CuentaDesde, CuentaHasta: string; nFechaD, nFechaH: TDateTime; nMoneda: string; nAlcance, Modo: integer; D1, D2, D3, D4, D5: string; Nivel: integer; Archivo: string = ''; PBListado: TProgressBar = nil);
     procedure BusquedaCompleja;
     procedure CambiaMascara(Moneda: string);
     procedure CambiaTituloMoneda(MonedaTemp: string; Modo: boolean);
     procedure BorraRic;
     procedure FiltraPeriodo;
     function HayDatos: boolean;
     function DameCanal: smallint;
     function DameEjercicio: smallint;
  end;

var
  DMMayor : TDMMayor;

implementation

uses UDMMain, UUtiles, UEntorno, uFBuscaRO, UDMRMayor, UFormGest;

{$R *.DFM}

procedure TDMMayor.DMMayorCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xMayorFECHA.DisplayFormat := ShortDateFormat;
  xMayorD_FECHA.DisplayFormat := ShortDateFormat;
  xMayorFECHA_PUNTEO.DisplayFormat := ShortDateFormat;

  with xCuentas do
  begin
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT CUENTA, CANAL, TITULO, TIPO, SUPERIOR ');
     SelectSQL.Add(' FROM CON_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     if REntorno.ContabilidadRestringida then
        SelectSQL.Add(' RESTRICCION = 0 AND ');
     SelectSQL.Add(' PGC = ?PGC ');
     SelectSQL.Add(' ORDER BY CUENTA ');
     CopiaSelectSQL.Text := SelectSQL.Text;
  end;

  DMMain.FiltraRO(xCuentas, '111001', False);
end;

procedure TDMMayor.LanzaListado(D1, D2, D3, D4, D5: string; Desde, Hasta: TDateTime; PBListado: TProgressBar = nil);
begin
  AbreData(TDMRMayor, DMRMayor);
  DMRMayor.MostrarListado(Canal, xCuentas.FieldByName('CUENTA').AsString,
     xCuentas.FieldByName('CUENTA').AsString,
     Desde, Hasta, Moneda, Alcance, xSaldosDEBE_A.AsFloat, xSaldosHABER_A.AsFloat, True, 0, D1, D2, D3, D4, D5, REntorno.Nivel, '', PBListado);
  CierraData(DMRMayor);
end;

procedure TDMMayor.ListadoMayor(nCanal: integer; CuentaDesde, CuentaHasta: string; nFechaD, nFechaH: TDateTime; nMoneda: string; nAlcance, Modo: integer; D1, D2, D3, D4, D5: string; Nivel: integer; Archivo: string = ''; PBListado: TProgressBar = nil);
begin
  DMRMayor.MostrarListado(nCanal, CuentaDesde, CuentaHasta, nFechaD,
     nFechaH, nMoneda, nAlcance,
     xSaldosDEBE_A.AsFloat, xSaldosHABER_A.AsFloat, False, Modo, D1, D2, D3, D4, D5, Nivel, Archivo, PBListado);
end;

procedure TDMMayor.Filtra(aDesde, aHasta: TDateTime);
begin
  Desde := RecodeTime(aDesde, 0, 0, 0, 0);
  Hasta := RecodeTime(aHasta, 23, 59, 59, 999);

  if not (xCuentas.Active) then
     xCuentas.Open;

  with xMayor do
  begin
     Close;
     if (D1 <= ' ') then
        D1 := ' ';
     if (D2 <= ' ') then
        D2 := ' ';
     if (D3 <= ' ') then
        D3 := ' ';
     if (D4 <= ' ') then
        D4 := ' ';
     if (D5 <= ' ') then
        D5 := ' ';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := DMMayor.Canal;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CUENTA'].AsString := xCuentas.FieldByName('CUENTA').AsString;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Params.ByName['D1'].AsString := D1;
     Params.ByName['D2'].AsString := D2;
     Params.ByName['D3'].AsString := D3;
     Params.ByName['D4'].AsString := D4;
     Params.ByName['D5'].AsString := D5;
     Open;
     Last;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := DMMayor.Canal;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CUENTA'].AsString := xCuentas.FieldByName('CUENTA').AsString;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;
end;

function TDMMayor.ABorrador;
var
  Empresa, Ejercicio, RIB : integer;
begin
  Empresa := xMayorEMPRESA_R.AsInteger;
  Ejercicio := xMayorEJERCICIO_R.AsInteger;
  RIB := xMayorRIC.AsInteger;

  ABorradorConDatos(Empresa, Ejercicio, RIB);

  Result := RIB;
end;

procedure TDMMayor.ABorradorConDatos(var Empresa, Ejercicio, RIB: integer);
begin
  Empresa := xMayorEMPRESA_R.AsInteger;
  Ejercicio := xMayorEJERCICIO_R.AsInteger;
  RIB := xMayorRIC.AsInteger;
  if not ConfirmaMensaje(Format(_('Esta seguro de querer traspasar a Borrador el RIC Nº: %d'), [RIB])) then
     RIB := 0;

  if (RIB <> 0) then
     // try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_DE_ASIENTO(:EMPRESA, :EJERCICIO, :CANAL, :RIC, :ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['CANAL'].AsInteger := xMayorCANAL.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['RIC'].AsInteger := xMayorRIC.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           RIB := FieldByName['RIB'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  {
    except
      Result := -1;
    end;
    }

  if (RIB = 0) then
     RIB := -1;

  if (RIB <> -1) then
     Refresca;
end;

procedure TDMMayor.Refresca;
var
  marca1, marca2, marca3 : TBookmark;
begin
  try
     xCuentas.DisableControls;
     xMayor.DisableControls;
     xSaldos.DisableControls;

     Marca1 := xCuentas.GetBookmark;
     Marca2 := xMayor.GetBookmark;
     Marca3 := xSaldos.GetBookmark;
     try
        xCuentas.Close;
        xCuentas.Open;
        xCuentas.GotoBookmark(Marca1);
        xMayor.GotoBookmark(Marca2);
        xSaldos.GotoBookmark(Marca3);
     except
        xCuentas.First;
        xMayor.First;
        xSaldos.First;
     end;
     xCuentas.FreeBookmark(Marca1);
     xMayor.FreeBookmark(Marca2);
     xSaldos.FreeBookmark(Marca3);
  finally
     xCuentas.EnableControls;
     xMayor.EnableControls;
     xSaldos.EnableControls;
  end;
end;

function TDMMayor.DameRic: string;
begin
  Result := xMayorRIC.AsString;
end;

function TDMMayor.DameTipoAsiento: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TIPO FROM CON_CUENTAS_ASIENTOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' RIC = :RIC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['RIC'].AsInteger := xMayorRIC.AsInteger;
        ExecQuery;
        Result := FieldByName['TIPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMayor.BusquedaCompleja;
var
  Orden : string;
begin
  with xCuentas do
  begin
     DisableControls;
     try
        Close;
        Orden := OrdenadoPor;
        Ordenar('');
        TFBuscaRO.Create(Self).SeleccionaBusqueda(xCuentas, '110001', False);
        SelectSQL.Add('AND TIPO=5 AND CANAL=?CANAL');
        if REntorno.ContabilidadRestringida then
           SelectSQL.Add(' AND RESTRICCION=0 ');
        Ordenar(Orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMMayor.xCuentasAfterOpen(DataSet: TDataSet);
begin
  Hasta := RecodeTime(Hasta, 23, 59, 59, 999);
  Filtra(Desde, Hasta);
end;

procedure TDMMayor.CambiaMascara(Moneda: string);
begin
  LocalMascaraN := DMMain.MascaraMoneda(Moneda);

  xMayorDEBE.DisplayFormat := LocalMascaraN;
  xMayorHABER.DisplayFormat := LocalMascaraN;
  xMayorSALDO.DisplayFormat := LocalMascaraN;

  xMayor_cuenta_PeriodoDEBE.DisplayFormat := LocalMascaraN;
  xMayor_cuenta_PeriodoHABER.DisplayFormat := LocalMascaraN;
  xMayor_cuenta_PeriodoSALDO.DisplayFormat := LocalMascaraN;

  xSaldosDEBE.DisplayFormat := LocalMascaraN;
  xSaldosHABER.DisplayFormat := LocalMascaraN;
  xSaldosSALDO.DisplayFormat := LocalMascaraN;
  xSaldosDEBE_A.DisplayFormat := LocalMascaraN;
  xSaldosHABER_A.DisplayFormat := LocalMascaraN;
  xSaldosSALDO_A.DisplayFormat := LocalMascaraN;
  xSaldosSALDO_RNG.DisplayFormat := LocalMascaraN;
end;

procedure TDMMayor.CambiaTituloMoneda(MonedaTemp: string; Modo: boolean);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := MonedaTemp;
     Open;
  end;

  if Modo then
  begin
     Moneda := MonedaTemp;
     CambiaMascara(MonedaTemp);
     Filtra(Desde, Hasta);
  end;
end;

procedure TDMMayor.BorraRic;
begin
  if ((xMayorRIC.AsInteger <> 0) and ConfirmaMensaje(Format(_('Está seguro de querer eliminar el R.I.C. Nº: %d'), [xMayorRIC.AsInteger]))) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_BORRA_RIC (?EMPRESA, ?EJERCICIO, ?CANAL, ?RIC, ?ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := xMayorEMPRESA_R.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xMayorEJERCICIO_R.AsInteger;
           Params.ByName['CANAL'].AsInteger := xMayorCANAL.AsInteger;
           Params.ByName['RIC'].AsInteger := xMayorRIC.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Filtra(Desde, Hasta);
  end;
end;

procedure TDMMayor.xCuentasBeforeOpen(DataSet: TDataSet);
begin
  xCuentas.Params.ByName['CANAL'].AsInteger := Canal;
end;

procedure TDMMayor.FiltraPeriodo;
begin
  with xMayor_cuenta_periodo do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := DMMayor.Canal;
     Params.ByName['Cuenta'].AsString := xCuentasCUENTA.Value;
     Params.ByName['Moneda'].AsString := Moneda;
     Params.ByName['Alcance'].AsInteger := Alcance;
     Open;
  end;
end;

function TDMMayor.HayDatos: boolean;
begin
  Result := xMayor.RecordCount <> 0;
end;

function TDMMayor.DameCanal: smallint;
begin
  Result := xMayorCANAL.AsInteger;
end;

function TDMMayor.DameEjercicio: smallint;
begin
  Result := xMayorEJERCICIO_R.AsInteger;
end;

procedure TDMMayor.xCuentasAfterScroll(DataSet: TDataSet);
begin
  xMayor.Last;
end;

end.
