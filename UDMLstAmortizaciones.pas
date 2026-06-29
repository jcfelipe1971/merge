unit UDMLstAmortizaciones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FR_Class, Fr_HYReport,
  FR_DSet, FR_DBSet, FIBDataSet, FIBQuery, HYFIBQuery, frxClass,
  frxHYReport, DateUtils;

type
  TDMLstAmortizaciones = class(TDataModule)
     TLocal: THYTransaction;
     DSxAmortizaciones: TDataSource;
     xAmortizaciones: TFIBDataSetRO;
     frDBxAmortizacion: TfrDBDataSet;
     frAmortizacion: TfrHYReport;
     xInmovilizado: TFIBDataSetRO;
     DSInmovilizado: TDataSource;
     frDBDxInmovilizado: TfrDBDataSet;
     DSxArt_Desde: TDataSource;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Hasta: TDataSource;
     DSQTitGrupo: TDataSource;
     QTitGrupo: TFIBDataSetRO;
     frDSQTitGrupo: TfrDBDataSet;
     DSQTitMetodo: TDataSource;
     QTitMetodo: TFIBDataSetRO;
     frDSQTitMetodo: TfrDBDataSet;
     DSQTitPeriodo: TDataSource;
     QTitPeriodo: TFIBDataSetRO;
     frDSQTitPeriodo: TfrDBDataSet;
     frxAmortizacion: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMLstAmortizacionesCreate(Sender: TObject);
     procedure DMLstAmortizacionesDestroy(Sender: TObject);
     procedure frAmortizacionGetValue(const ParName: string; var ParValue: variant);
     procedure frAmortizacionEnterRect(Memo: TStringList; View: TfrView);
     procedure xInmovilizadoAfterOpen(DataSet: TDataSet);
     procedure frxAmortizacionBeforePrint(Sender: TfrxReportComponent);
     procedure frxAmortizacionGetValue(const VarName: string; var Value: variant);
     procedure xInmovilizadoBeforeClose(DataSet: TDataSet);
     procedure xInmovilizadoAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     ListadoPorFichas, MostrarBaja: boolean;
     FechaDesdeAmortizacion, FechaHastaAmortizacion: TDateTime;
     FechaDesdeCompra, FechaHastaCompra: TDateTime;
     function DameSegundaCuota(factor: smallint): double;
     function DameFechaPrimeraCuotaPendiente: TDateTime;
     function CambiaImporte(Importe: double): double;
  public
     procedure MostrarListado(Modo: integer; aFechaDesdeAmortizacion, aFechaHastaAmortizacion, aFechaDesdeCompra, aFechaHastaCompra: TDateTime; ArticuloDesde, ArticuloHasta: string; aListadoPorFichas, aMostrarBaja: boolean);
     procedure Rangos(var ArticuloDesde, ArticuloHasta: string; var FechaDesdeAmortizacion, FechaHastaAmortizacion, FechaDesdeCompra, FechaHastaCompra: TDateTime);
  end;

var
  DMLstAmortizaciones : TDMLstAmortizaciones;

implementation

uses UDMMain, UDMListados, UFormGest, UUtiles, UEntorno;

{$R *.DFM}

procedure TDMLstAmortizaciones.DMLstAmortizacionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstAmortizaciones.DMLstAmortizacionesDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstAmortizaciones.MostrarListado(Modo: integer; aFechaDesdeAmortizacion, aFechaHastaAmortizacion, aFechaDesdeCompra, aFechaHastaCompra: TDateTime; ArticuloDesde, ArticuloHasta: string; aListadoPorFichas, aMostrarBaja: boolean);
var
  Grupo : integer;
begin
  DMMain.Log('MostrarListado');
  DMListados.Normalizar_Desde_Hasta(ArticuloDesde, ArticuloHasta);
  DMListados.Normalizar_Desde_Hasta(FechaDesdeAmortizacion, FechaHastaAmortizacion);
  ListadoPorFichas := aListadoPorFichas;
  MostrarBaja := aMostrarBaja;
  FechaDesdeAmortizacion := aFechaDesdeAmortizacion;
  FechaHastaAmortizacion := aFechaHastaAmortizacion;
  FechaDesdeCompra := aFechaDesdeCompra;
  FechaHastaCompra := aFechaHastaCompra;

  DMMain.Log('xInmovilizado.Open');
  with xInmovilizado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO_INI'].AsString := ArticuloDesde;
     Params.ByName['ARTICULO_FIN'].AsString := ArticuloHasta;
     Params.ByName['FECHA_ADQUISICION_DESDE'].AsDateTime := FechaDesdeCompra;
     Params.ByName['FECHA_ADQUISICION_HASTA'].AsDateTime := FechaHastaCompra;
     Params.ByName['CANCELADO'].AsInteger := BoolToInt(MostrarBaja);
     Open;
  end;

  // Tipo listado por fichas
  if ListadoPorFichas then
     Grupo := 516
  else
     Grupo := 97;

  DMMain.LogIni('Imprimir');
  DMListados.Imprimir(Grupo, 0, Modo, '', _('Amortizaciones'), frAmortizacion, frxAmortizacion, nil, nil);
  DMMain.LogFin('Imprimir');
end;

procedure TDMLstAmortizaciones.frAmortizacionGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ListadoPorFichas then
  begin
     // Valor total amortizado que esté contablizado y sin contabilidad
     if ParName = 'V_TEORICO' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(VALOR_AMORTIZADO) FROM CON_INMOVILIZADOS_DETALLE ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' ARTICULO = ?ARTICULO AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
              Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesdeAmortizacion;
              Params.ByName['FECHA_HASTA'].AsDateTime := FechaHastaAmortizacion;
              ExecQuery;
              ParValue := FieldByName['SUM'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Valor total amortizado que esté contablizado
     if ParName = 'V_AMORTIZADO' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(VALOR_AMORTIZADO) FROM CON_INMOVILIZADOS_DETALLE ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' ARTICULO = ?ARTICULO AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA AND ');
              SQL.Add(' CONTABILIZADO = 1 ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
              Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesdeAmortizacion;
              Params.ByName['FECHA_HASTA'].AsDateTime := FechaHastaAmortizacion;
              ExecQuery;
              ParValue := FieldByName['SUM'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Valores para Fercam - V_AMORTIZADO sin tener en cuenta contabilizado
     if ParName = 'V_AMORTIZADO_TODO' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(VALOR_AMORTIZADO) FROM CON_INMOVILIZADOS_DETALLE ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' ARTICULO = ?ARTICULO AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
              Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesdeAmortizacion;
              Params.ByName['FECHA_HASTA'].AsDateTime := FechaHastaAmortizacion;
              ExecQuery;
              ParValue := FieldByName['SUM'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Valores para Fercam - V_AMORTIZADO del ejercicio de la fecha hasta
     if ParName = 'V_AMORTIZADO_EJERCICIO' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(VALOR_AMORTIZADO) FROM CON_INMOVILIZADOS_DETALLE ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' ARTICULO = ?ARTICULO AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA AND ');
              SQL.Add(' CONTABILIZADO = 1 ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
              Params.ByName['FECHA_DESDE'].AsDateTime := EncodeDateTime(YearOf(FechaHastaAmortizacion), 01, 01, 00, 00, 00, 000);
              Params.ByName['FECHA_HASTA'].AsDateTime := EncodeDateTime(YearOf(FechaHastaAmortizacion), 12, 31, 23, 59, 59, 999);
              ExecQuery;
              ParValue := FieldByName['SUM'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Valores para Fercam - V_AMORTIZADO del ejercicio de la fecha hasta sin tener en cuenta contabilizado
     if ParName = 'V_AMORTIZADO_EJERCICIO_TODO' then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(VALOR_AMORTIZADO) FROM CON_INMOVILIZADOS_DETALLE ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' ARTICULO = ?ARTICULO AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
              Params.ByName['FECHA_DESDE'].AsDateTime := EncodeDateTime(YearOf(FechaHastaAmortizacion), 01, 01, 00, 00, 00, 000);
              Params.ByName['FECHA_HASTA'].AsDateTime := EncodeDateTime(YearOf(FechaHastaAmortizacion), 12, 31, 23, 59, 59, 999);
              ExecQuery;
              ParValue := FieldByName['SUM'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Segunda cuota de amortización
     if ParName = 'v_mensual' then
     begin
        if xInmovilizado.FieldByName('PERIODOS_AMORTIZACION').AsInteger = 4 then
           ParValue := 0
        else
           ParValue := DameSegundaCuota(1);
     end;

     if ParName = 'v_compra' then
        ParValue := CambiaImporte(xInmovilizado.FieldByName('VALOR_COMPRA').AsFloat);
     if ParName = 'v_residual' then
        ParValue := CambiaImporte(xInmovilizado.FieldByName('VALOR_RESIDUAL').AsFloat);

     // Amortización anual
     if ParName = 'v_anual' then
     begin
        if xInmovilizado.FieldByName('TIPO_AMORTIZACION').AsString = 'VAR' then
           ParValue := DameSegundaCuota(12) // mensual
        else
           case xInmovilizado.FieldByName('PERIODOS_AMORTIZACION').AsInteger of
              1: ParValue := DameSegundaCuota(12); // mensual
              2: ParValue := DameSegundaCuota(4); // trimestral
              3: ParValue := DameSegundaCuota(2); // semestral
              4: ParValue := DameSegundaCuota(1); // anual
           end;
     end;
  end;

  if UpperCase(ParName) = 'FECHA_SIGUIENTE_CUOTA' then
     ParValue := DameFechaPrimeraCuotaPendiente;

  if ParName = 'fecha_ficha' then
     ParValue := FechaHastaAmortizacion;
  if ParName = 'moneda' then
     ParValue := REntorno.Moneda;
end;

procedure TDMLstAmortizaciones.frAmortizacionEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstAmortizaciones.Rangos(var ArticuloDesde, ArticuloHasta: string; var FechaDesdeAmortizacion, FechaHastaAmortizacion, FechaDesdeCompra, FechaHastaCompra: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(ARTICULO) MIN_ARTICULO, MAX(ARTICULO) MAX_ARTICULO, ');
        SQL.Add('        MIN(FECHA_ADQUISICION) MIN_FECHA_ADQUISICION, MAX(FECHA_ADQUISICION) MAX_FECHA_ADQUISICION ');
        SQL.Add(' FROM CON_INMOVILIZADOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL = :CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        ArticuloDesde := FieldByName['MIN_ARTICULO'].AsString;
        ArticuloHasta := FieldByName['MAX_ARTICULO'].AsString;
        FechaDesdeCompra := FieldByName['MIN_FECHA_ADQUISICION'].AsDateTime;
        FechaHastaCompra := FieldByName['MAX_FECHA_ADQUISICION'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;

  {
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(FECHA), MAX(FECHA) FROM CON_INMOVILIZADOS_DETALLE WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FechaDesdeAmortizacion := FieldByName['MIN'].AsDateTime;
        FechaHastaAmortizacion := FieldByName['MAX'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
  }

  // Obtengo rango de fechas del ejercicio ejercicio
  DameMinMax('EJE', FechaDesdeAmortizacion, FechaHastaAmortizacion);

  if (FechaDesdeCompra = 0) then
     FechaDesdeCompra := FechaDesdeAmortizacion;
  if (FechaHastaCompra = 0) then
     FechaHastaCompra := FechaHastaAmortizacion;
end;

function TDMLstAmortizaciones.CambiaImporte(Importe: double): double;
begin
  if (xInmovilizado.FieldByName('MONEDA').AsString <> REntorno.Moneda) then
     Result := DMMain.DameCambio(True, xInmovilizado.FieldByName('MONEDA').AsString, REntorno.Moneda, REntorno.FechaTrab, Importe)
  else
     Result := Importe;
end;

function TDMLstAmortizaciones.DameSegundaCuota(Factor: smallint): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST(2) SKIP(1) VALOR_AMORTIZADO FROM CON_INMOVILIZADOS_DETALLE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ARTICULO = ?ARTICULO AND ');
        SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
        SQL.Add(' FECHA <= ?FECHA_HASTA AND ');
        SQL.Add(' CONTABILIZADO = 1 ');
        SQL.Add(' ORDER BY FECHA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesdeAmortizacion;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHastaAmortizacion;
        ExecQuery;
        Result := (CambiaImporte(FieldByName['VALOR_AMORTIZADO'].AsFloat)) * Factor;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstAmortizaciones.DameFechaPrimeraCuotaPendiente: TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST(1) FECHA FROM CON_INMOVILIZADOS_DETALLE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ARTICULO = ?ARTICULO AND ');
        SQL.Add(' CONTABILIZADO = 0 ');
        SQL.Add(' ORDER BY FECHA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
        ExecQuery;
        Result := FieldByName['FECHA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstAmortizaciones.xInmovilizadoAfterOpen(DataSet: TDataSet);
begin
  QTitGrupo.Open;
  QTitMetodo.Open;
  QTitPeriodo.Open;
end;

procedure TDMLstAmortizaciones.xInmovilizadoBeforeClose(DataSet: TDataSet);
begin
  QTitGrupo.Close;
  QTitMetodo.Close;
  QTitPeriodo.Close;
  xAmortizaciones.Close;
end;

procedure TDMLstAmortizaciones.frxAmortizacionBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstAmortizaciones.frxAmortizacionGetValue(const VarName: string; var Value: variant);
begin
  frAmortizacionGetValue(VarName, Value);
end;

procedure TDMLstAmortizaciones.xInmovilizadoAfterScroll(DataSet: TDataSet);
begin
  DMMain.Log('xInmovilizadoAfterScroll');
  with xAmortizaciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xInmovilizado.FieldByName('EMPRESA').AsInteger;
     Params.ByName['CANAL'].AsInteger := xInmovilizado.FieldByName('CANAL').AsInteger;
     Params.ByName['ARTICULO'].AsString := xInmovilizado.FieldByName('ARTICULO').AsString;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesdeAmortizacion;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHastaAmortizacion;
     Open;
  end;
end;

end.
