unit UDMLstFamilias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, FIBQuery, FR_Class, Fr_HYReport, FR_DSet,
  FR_DBSet, DB, FIBDataSet, FIBTableDataSet, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstFamilias = class(TDataModule)
     QMinFamilia: THYFIBQuery;
     TLocal: THYTransaction;
     frFamilias: TfrHYReport;
     xArt_Mov_Stock: TFIBDataSetRO;
     xArt_Articulos: TFIBDataSetRO;
     DSxArt_Mov_Stock: TDataSource;
     frDSxArt_Mov_Stock: TfrDBDataSet;
     xArtDesde: TFIBDataSetRO;
     xArtHasta: TFIBDataSetRO;
     DSxArtDesde: TDataSource;
     DSxArtHasta: TDataSource;
     SPRSaldos: THYFIBQuery;
     xCabecera: TFIBDataSetRO;
     xDetalle: TFIBDataSetRO;
     DSxCabecera: TDataSource;
     frDBxDetalle: TfrDBDataSet;
     frDBxCabecera: TfrDBDataSet;
     DSxDetalle: TDataSource;
     QMaxFamilia: THYFIBQuery;
     xFamilia: TFIBDataSetRO;
     DSxFamilia: TDataSource;
     xArt_Mov_StockEMPRESA: TIntegerField;
     xArt_Mov_StockEJERCICIO: TIntegerField;
     xArt_Mov_StockCANAL: TIntegerField;
     xArt_Mov_StockN_MOV_STOCK: TIntegerField;
     xArt_Mov_StockPERIODO: TFIBStringField;
     xArt_Mov_StockALMACEN: TFIBStringField;
     xArt_Mov_StockARTICULO: TFIBStringField;
     xArt_Mov_StockTIPO_OPER: TFIBStringField;
     xArt_Mov_StockFECHA: TDateTimeField;
     xArt_Mov_StockCOMENTARIO: TFIBStringField;
     xArt_Mov_StockUNIDADES: TFloatField;
     xArt_Mov_StockPRECIO: TFloatField;
     xArt_Mov_StockORIGEN: TFIBStringField;
     xArt_Mov_StockIMPORTE: TFloatField;
     xArt_Mov_StockDOC_NUMERO: TIntegerField;
     xArt_Mov_StockDOC_SERIE: TFIBStringField;
     xArt_Mov_StockENTRADA: TIntegerField;
     xArt_Mov_StockACTIVO: TIntegerField;
     xArt_Mov_StockUNIDADES_EXT: TFloatField;
     xArt_Mov_StockPRECIO_SIN_DTO: TFloatField;
     xArt_Mov_StockMOV_VIRTUAL: TIntegerField;
     xArt_ArticulosEMPRESA: TIntegerField;
     xArt_ArticulosARTICULO: TFIBStringField;
     xArt_ArticulosTITULO: TFIBStringField;
     xArt_ArticulosFAMILIA: TFIBStringField;
     xArt_ArticulosP_COSTE: TFloatField;
     xArt_ArticulosABIERTO: TIntegerField;
     xArt_ArticulosCONTROL_STOCK: TIntegerField;
     xArt_ArticulosENTRADA: TIntegerField;
     xArt_ArticulosUNIDADES: TFIBStringField;
     xArt_ArticulosVIRTUAL: TIntegerField;
     xArt_ArticulosNOTAS: TBlobField;
     xArt_ArticulosTITULO_CORTO: TFIBStringField;
     xArt_ArticulosCONTROLA_MEDIDAS: TIntegerField;
     xArt_ArticulosSERIALIZADO: TIntegerField;
     xArt_ArticulosGARANTIA: TIntegerField;
     xArt_ArticulosPRODUCCION: TIntegerField;
     xArt_ArticulosDESCUENTO: TFloatField;
     xArt_ArticulosDESCUENTO_2: TFloatField;
     xArt_ArticulosDESCUENTO_3: TFloatField;
     xDetalleEMPRESA: TIntegerField;
     xDetalleEJERCICIO: TIntegerField;
     xDetalleCANAL: TIntegerField;
     xDetalleARTICULO: TFIBStringField;
     xDetalleTITULO: TFIBStringField;
     xDetalleTARIFA: TFIBStringField;
     xDetalleUNID_MINIMAS: TFloatField;
     xDetalleUNID_MAXIMAS: TFloatField;
     xDetalleCOSTE: TFloatField;
     xDetallePVP: TFloatField;
     xDetalleFAMILIA: TFIBStringField;
     xDetalleMONEDA: TFIBStringField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QTituloMoneda: THYFIBQuery;
     xTipoIva: TFIBDataSetRO;
     xTipoIvaTITULO: TFIBStringField;
     xTipoIvaP_IVA: TFloatField;
     xTipoIvaP_RECARGO: TFloatField;
     DSxTipoIva: TDataSource;
     xCabeceraEMPRESA: TIntegerField;
     xCabeceraEJERCICIO: TIntegerField;
     xCabeceraCANAL: TIntegerField;
     xCabeceraFAMILIA: TFIBStringField;
     xCabeceraTITULO: TFIBStringField;
     xCabeceraPAIS: TFIBStringField;
     xCabeceraTIPO_IVA: TIntegerField;
     xCabeceraCTA_COMPRAS: TFIBStringField;
     xCabeceraCTA_VENTAS: TFIBStringField;
     xCabeceraVENTA: TIntegerField;
     xCabeceraPTO_VERDE: TFloatField;
     xCabeceraMARGEN: TFloatField;
     xCabeceraTIPO_REDONDEO: TIntegerField;
     xCabeceraACT_TAR_AUTOM: TIntegerField;
     QGen: THYFIBQuery;
     xPeriodos: TFIBDataSetRO;
     xPeriodosTITULO: TFIBStringField;
     DSxPeriodos: TDataSource;
     frxFamilias: TfrxHYReport;
     procedure DMLstFamiliasDestroy(Sender: TObject);
     procedure frFamiliasGetValue(const ParName: string; var ParValue: variant);
     procedure frFamiliasEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstFamiliasCreate(Sender: TObject);
     procedure xCabeceraAfterScroll(DataSet: TDataSet);
     procedure frxFamiliasBeforePrint(Sender: TfrxReportComponent);
     procedure frxFamiliasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     desde, hasta: string;
     // variables para el detalle
     unid_E, unid_S: integer;
     valor_E, valor_S: double;
     Saldo: double;
     // Valores que retorna el procedimiento 'Saldo Anterior'
     Unid_Ent, Unid_Sal: integer;
     Valo_Ent, Valo_Sal: double;
     // Parametros que requiere el procedimiento 'Saldo Anterior'
     VAlmacen, VArticulo: string;
     VPer_Ini: string;
     MascaraN_Tarifa, MascaraL_Tarifa: string;
     LocalMascaraN, LocalMascaraL: string;
     MascaraN_Emp, MascaraL_Emp: string;
     Detalle: boolean;
     PeriodoLst: string;
     FechaDLst, FechaHLst: TDateTime;
     procedure SaldoAnterior;
  public
     { Public declarations }
     Familia: string;
     procedure DameMinMaxArticulo(aFamilia: string; var Desde, Hasta: string);
     procedure MostrarListado(art_desde, art_hasta, Periodo: string; modo: integer; fechad, fechah: TDateTime);
     procedure MostrarListadoFiltrado(modo: byte; SWFil: integer; SQLFiltro: TStrings);
     procedure MostrarFamiliasFiltradas(modo: byte; SWFil: integer; SQLFiltro: TStrings);
     procedure CambiaMoneda(Moneda: string);
     procedure DameTituloPeriodo(Periodo: string);
     procedure DameFechasPeriodo(Periodo: string; var FechaD, FechaH: TDateTime);
  end;

var
  DMLstFamilias : TDMLstFamilias;
  SW : integer;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles;

{$R *.DFM}

procedure TDMLstFamilias.DMLstFamiliasCreate(Sender: TObject);
begin
  Detalle := True;
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  MascaraN_Tarifa := MascaraN;
  MascaraL_Tarifa := MascaraL;
  MascaraN_Emp := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  MascaraL_Emp := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
end;

procedure TDMLstFamilias.DMLstFamiliasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstFamilias.MostrarListadoFiltrado(Modo: byte; SWFil: integer; SQLFiltro: TStrings);
var
  str : string;
begin
  with xCabecera do
  begin
     Close;
     SelectSQL.Assign(SqlFiltro);
     if SWFil = 0 then
        DMMain.FiltraRO(xCabecera, '11100', False);
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     Open;
  end;

  SW := 1;
  DMListados.Cargar(51, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frFamilias.LoadFromFIB(REntorno.Formato, str);
     frFamilias.PrepareReport;
     case Modo of
        0: frFamilias.ShowPreparedReport;
        1: frFamilias.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxFamilias.LoadFromFIB(REntorno.Formato, str);
     frxFamilias.PrepareReport;
     case Modo of
        0: frxFamilias.ShowPreparedReport;
        1: frxFamilias.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstFamilias.DameMinMaxArticulo(aFamilia: string; var Desde, Hasta: string);
begin
  Familia := aFamilia;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(ARTICULO), MAX(ARTICULO) FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND FAMILIA = :FAMILIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FAMILIA'].AsString := Familia;
        ExecQuery;
        Desde := FieldByName['MIN'].AsString;
        Hasta := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstFamilias.MostrarListado(art_desde, art_hasta, periodo: string; modo: integer; FechaD, FechaH: TDateTime);
var
  str : string;
  FechaDesde, FechaHasta : TDateTime;
begin
  PeriodoLst := Periodo;
  SW := 1;
  desde := art_desde;
  hasta := art_hasta;
  DMListados.Normalizar_Desde_Hasta(art_desde, art_hasta);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  FechaDLst := FechaD;
  FechaHLst := FechaH;
  FechaDesde := HourIntoDate(FechaD, '00:00:00');
  FechaHasta := HourIntoDate(FechaH, '23:59:59');

  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 0);

  with xArt_Mov_Stock do
  begin
     Close;
     Params.ByName['EMP'].AsInteger := REntorno.Empresa;
     Params.ByName['EJE'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CAN'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_ARTICULO'].AsString := art_desde;
     Params.ByName['HASTA_ARTICULO'].AsString := art_hasta;
     Params.ByName['FAMILIA'].AsString := Familia;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Params.ByName['FECHAD'].AsDateTime := FechaDesde;
     Params.ByName['FECHAH'].AsDateTime := FechaHasta;
     Open;
  end;

  with xArt_Articulos do
  begin
     Close;
     Params.ByName['FAMILIA'].AsString := Familia;
     Open;
  end;

  DMListados.Cargar(50, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frFamilias.LoadFromFIB(REntorno.Formato, str);
     frFamilias.PrepareReport;
     case modo of
        0: frFamilias.ShowPreparedReport;
        1: frFamilias.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxFamilias.LoadFromFIB(REntorno.Formato, str);
     frxFamilias.PrepareReport;
     case Modo of
        0: frxFamilias.ShowPreparedReport;
        1: frxFamilias.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstFamilias.frFamiliasGetValue(const ParName: string; var ParValue: variant);
var
  cambio : extended;
begin
  cambio := 0;
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Inicializa' then
  begin
     Unid_Ent := 0;
     Unid_Sal := 0;
     Valo_Ent := 0;
     Valo_Sal := 0;
     unid_E := 0;
     unid_S := 0;
     valor_E := 0;
     valor_S := 0;
     saldo := 0;
  end;

  if ParName = 'Fam' then
     ParValue := Familia;
  if ParName = 'Articulo_Desde' then
     ParValue := desde;
  if ParName = 'Articulo_Hasta' then
     ParValue := hasta;

  if ParName = 'Unidades Entrada' then
  begin
     if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'E') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'A') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'D') then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('UNIDADES').AsInteger;
        Unid_E := Unid_E + xArt_Mov_Stock.FieldByName('UNIDADES').AsInteger;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Valor Entrada' then
  begin
     if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'E') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'A') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'D') then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        Valor_E := Valor_E + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Unidades Salida' then
  begin
     if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O') then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('UNIDADES').AsInteger;
        Unid_S := Unid_S + xArt_Mov_Stock.FieldByName('UNIDADES').AsInteger;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Valor Salida' then
  begin
     if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O') then
     begin
        ParValue := xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        Valor_S := Valor_S + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
     end
     else
        ParValue := 0;
  end;

  if ParName = 'Saldo' then
  begin
     if (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'S') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'C') or
        (xArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'O') then
     begin
        saldo := saldo + xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        ParValue := saldo;
     end
     else
     begin
        saldo := saldo - xArt_Mov_Stock.FieldByName('IMPORTE').AsFloat;
        ParValue := saldo;
     end;
  end;

  if ParName = 'Saldo_Anterior' then
  begin
     unid_E := 0;
     unid_S := 0;
     valor_E := 0;
     valor_S := 0;
     VAlmacen := xArt_Mov_Stock.FieldByName('ALMACEN').AsString;
     VArticulo := xArt_Mov_Stock.FieldByName('ARTICULO').AsString;
     SaldoAnterior;
     Saldo := Valo_Sal - Valo_Ent;
     ParValue := Saldo;
  end;

  if ParName = 'Actualiza_Mascara' then
  begin
     MascaraN_Tarifa := DMMain.MascaraMoneda(xDetalle.FieldByName('MONEDA').AsString, 1);
     MascaraL_Tarifa := DMMain.MascaraMoneda(xDetalle.FieldByName('MONEDA').AsString, 0);
  end;

  if ParName = 'Moneda_Canal' then
     with QTituloMoneda do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        ExecQuery;
        ParValue := FieldByName['TITULO'].AsString;
        FreeHandle;
     end;

  if ParName = 'Moneda_Empresa' then
     with QTituloMoneda do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.MonedaEmpresa;
        ExecQuery;
        ParValue := FieldByName['TITULO'].AsString;
        FreeHandle;
     end;

  if ParName = 'MonCan' then
     ParValue := REntorno.Moneda;

  if ParName = 'MonEmp' then
     ParValue := REntorno.MonedaEmpresa;

  if ParName = 'PVP_Canal' then
     ParValue := DMMain.DameCambio(True, xDetalle.FieldByName('MONEDA').AsString, REntorno.Moneda, REntorno.FechaTrab, xDetalle.FieldByName('PVP').AsFloat, Cambio);

  if ParName = 'PC_Canal' then
     ParValue := DMMain.DameCambio(True, REntorno.MonedaEmpresa, REntorno.Moneda, REntorno.FechaTrab, xDetalle.FieldByName('COSTE').AsFloat, Cambio);

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;

  if ParName = 'Unid_Maximas' then
  begin
     if (xDetalleUNID_MAXIMAS.AsFloat = 1999999999) then
        ParValue := '--------------'
     else
        ParValue := FormatFloat(MascaraI, xDetalleUNID_MAXIMAS.AsFloat);
  end;

  if ParName = 'Sum_U_E' then
     ParValue := Unid_E;
  if ParName = 'Sum_V_E' then
     ParValue := Valor_E;
  if ParName = 'Sum_U_S' then
     ParValue := Unid_S;
  if ParName = 'Sum_V_S' then
     ParValue := Valor_S;
  if ParName = 'Acu_U_E' then
     ParValue := (Unid_E + Unid_Ent);
  if ParName = 'Acu_V_E' then
     ParValue := (Valor_E + Valo_Ent);
  if ParName = 'Acu_U_S' then
     ParValue := (Unid_S + Unid_Sal);
  if ParName = 'Acu_V_S' then
     ParValue := (Valor_S + Valo_Sal);

  if ParName = 'Periodo' then
     if (PeriodoLst <> '') then
        ParValue := _('Periodo') + ' ' + PeriodoLst + '  ' + xPeriodosTITULO.AsString
     else
        ParValue := '';

  if ParName = 'FechaDesde' then
     ParValue := FechaDLst;

  if ParName = 'FechaHasta' then
     ParValue := FechaHLst;
end;

procedure TDMLstFamilias.frFamiliasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN_Tarifa]', Memo[0]) > 0) then
        View.FormatStr := MascaraN_Tarifa;
     if (Pos('[MascaraL_Tarifa]', Memo[0]) > 0) then
        View.FormatStr := MascaraL_Tarifa;
     if (Pos('[MascaraN_Emp]', Memo[0]) > 0) then
        View.FormatStr := MascaraN_Emp;
     if (Pos('[MascaraL_Emp]', Memo[0]) > 0) then
        View.FormatStr := MascaraL_Emp;
     if (Pos('[MascaraL_M]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
     if (Pos('[MascaraN_M]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

//Retorna los saldos y unidades anteriores.
procedure TDMLstFamilias.SaldoAnterior;
begin
  with SPRSaldos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := VAlmacen;
     Params.ByName['ARTICULO'].AsString := VArticulo;
     Params.ByName['PER_INI'].AsString := VPer_Ini;
     ExecQuery;
     Unid_Ent := FieldByName['UNID_ENT'].AsInteger;
     Valo_Ent := FieldByName['VALO_ENT'].AsFloat;
     Unid_Sal := FieldByName['UNID_SAL'].AsInteger;
     Valo_Sal := FieldByName['VALO_SAL'].AsFloat;
     FreeHandle;
  end;
end;

procedure TDMLstFamilias.xCabeceraAfterScroll(DataSet: TDataSet);
begin
  if detalle then
     with xDetalle do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := xCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['FAMILIA'].AsString := xCabecera.FieldByName('FAMILIA').AsString;
        Params.ByName['EJERCICIO'].AsString := xCabecera.FieldByName('EJERCICIO').AsString;
        Params.ByName['CANAL'].AsString := xCabecera.FieldByName('CANAL').AsString;
        Open;
     end;

  with xTipoIva do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

procedure TDMLstFamilias.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

procedure TDMLstFamilias.MostrarFamiliasFiltradas(Modo: byte; SWFil: integer; SQLFiltro: TStrings);
var
  str : string;
begin
  detalle := False;

  with xCabecera do
  begin
     Close;
     SelectSQL.Assign(SqlFiltro);
     if SWFil = 0 then
        DMMain.FiltraRO(xCabecera, '11100', False);
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     Open;
  end;

  SW := 1;
  DMListados.Cargar(127, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frFamilias.LoadFromFIB(REntorno.Formato, str);
     frFamilias.PrepareReport;
     case Modo of
        0: frFamilias.ShowPreparedReport;
        1: frFamilias.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxFamilias.LoadFromFIB(REntorno.Formato, str);
     frxFamilias.PrepareReport;
     case Modo of
        0: frxFamilias.ShowPreparedReport;
        1: frxFamilias.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstFamilias.DameTituloPeriodo(Periodo: string);
begin
  with xPeriodos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PERIODO'].AsString := Periodo;
     Open;
  end;
end;

procedure TDMLstFamilias.DameFechasPeriodo(Periodo: string; var FechaD, FechaH: TDateTime);
var
  dia, mes, anyo : word;
begin
  DameDesdeHastaPeriodo(Periodo, FechaD, FechaH);

  DecodeDate(FechaD, Anyo, Mes, Dia);
  FechaD := EncodeDate(Anyo, Mes, Dia);
  DecodeDate(FechaH, Anyo, Mes, Dia);
  FechaH := EncodeDate(Anyo, Mes, Dia);
end;

procedure TDMLstFamilias.frxFamiliasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN_Tarifa]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN_Tarifa;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL_Tarifa]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL_Tarifa;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraN_Emp]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN_Emp;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL_Emp]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL_Emp;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL_M]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraN_M]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstFamilias.frxFamiliasGetValue(const VarName: string; var Value: variant);
begin
  frFamiliasGetValue(VarName, Value);
end;

end.
