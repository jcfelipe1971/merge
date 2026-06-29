unit UDMRDepositosActivos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, DBTables, FIBDataSet, FIBTableDataSet, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport;

type
  TDMRDepositosActivos = class(TDataModule)
     frDepositosActivos: TfrHYReport;
     TLocal: THYTransaction;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     QEjercicios: THYFIBQuery;
     xDepositosActivos: TFIBDataSetRO;
     DSxDepositosActivos: TDataSource;
     frDBxDepositosActivos: TfrDBDataSet;
     xAlm_Desde: TFIBDataSetRO;
     DSxAlm_Desde: TDataSource;
     xAlm_Hasta: TFIBDataSetRO;
     DSxAlm_Hasta: TDataSource;
     xProveedorD: TFIBDataSetRO;
     DSxProveedorD: TDataSource;
     xProveedorH: TFIBDataSetRO;
     DSxProveedorH: TDataSource;
     xDepositosActivosALBARAN_NUM: TFloatField;
     xDepositosActivosFECHA: TDateTimeField;
     xDepositosActivosPROVEEDOR: TFloatField;
     xDepositosActivosNOMBRE_PROVEEDOR: TFIBStringField;
     xDepositosActivosARTICULO: TFIBStringField;
     xDepositosActivosTITULO_ARTICULO: TFIBStringField;
     xDepositosActivosALMACEN: TFIBStringField;
     xDepositosActivosCANT_TOTAL: TFloatField;
     xDepositosActivosCANT_PENDIENTE: TFloatField;
     xDepositosActivosCANT_FACTURADA: TFloatField;
     xDepositosActivosIMPORTE_FAC: TFloatField;
     xDepositosActivosMEDIA: TFloatField;
     QMinArt: THYFIBQuery;
     QMaxArt: THYFIBQuery;
     QMaxProv: THYFIBQuery;
     QMaxAlmacen: THYFIBQuery;
     QMinProv: THYFIBQuery;
     QMinAlmacen: THYFIBQuery;
     xProveedorDPROVEEDOR: TIntegerField;
     xProveedorDTITULO: TFIBStringField;
     xProveedorHPROVEEDOR: TIntegerField;
     xProveedorHTITULO: TFIBStringField;
     xArt_DesdeARTICULO: TFIBStringField;
     xArt_DesdeTITULO: TFIBStringField;
     xArt_HastaARTICULO: TFIBStringField;
     xArt_HastaTITULO: TFIBStringField;
     xAlm_DesdeALMACEN: TFIBStringField;
     xAlm_DesdeTITULO: TFIBStringField;
     xAlm_HastaALMACEN: TFIBStringField;
     xAlm_HastaTITULO: TFIBStringField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     frxDepositosActivos: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRInventario_StocksDestroy(Sender: TObject);
     procedure DMRDepositosActivosCreate(Sender: TObject);
     procedure frDepositosActivosEnterRect(Memo: TStringList; View: TfrView);
     procedure frDepositosActivosGetValue(const ParName: string; var ParValue: variant);
     procedure frxDepositosActivosBeforePrint(Sender: TfrxReportComponent);
     procedure frxDepositosActivosGetValue(const VarName: string; var Value: variant);
  private
     LocalMascaraN: string;
  public
     ProvDesde, ProvHasta: integer;
     ArticuloDesde, ArticuloHasta: string;
     AlmacenDesde, AlmacenHasta: string;
     FechaDesde, FechaHasta: TDateTime;
     procedure Rangos;
     procedure MostrarListado(MTrabajo, Modo: integer);
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMRDepositosActivos : TDMRDepositosActivos;
  SW : integer;
  ModoTrabajo : smallint;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest;

procedure TDMRDepositosActivos.DMRDepositosActivosCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRDepositosActivos.DMRInventario_StocksDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMRDepositosActivos.MostrarListado(MTrabajo, Modo: integer);
var
  str : string;
begin
  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  with xDepositosActivos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROV_INI'].AsInteger := xProveedorDPROVEEDOR.AsInteger;
     Params.ByName['PROV_FIN'].AsInteger := xProveedorHPROVEEDOR.AsInteger;
     Params.ByName['ARTICULO_INI'].AsString := xArt_DesdeARTICULO.AsString;
     Params.ByName['ARTICULO_FIN'].AsString := xArt_HastaARTICULO.AsString;
     Params.ByName['ALMACEN_INI'].AsString := xAlm_DesdeALMACEN.AsString;
     Params.ByName['ALMACEN_FIN'].AsString := xAlm_HastaALMACEN.AsString;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['MODO'].AsInteger := MTrabajo;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Open;
  end;

  SW := 1;
  ModoTrabajo := MTrabajo;
  DMListados.Cargar(505, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frDepositosActivos.LoadFromFIB(REntorno.Formato, str);
     frDepositosActivos.PrepareReport;
     case Modo of
        0: frDepositosActivos.ShowPreparedReport;
        1: frDepositosActivos.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxDepositosActivos.LoadFromFIB(REntorno.Formato, str);
     frxDepositosActivos.PrepareReport;
     case Modo of
        0: frxDepositosActivos.ShowPreparedReport;
        1: frxDepositosActivos.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMRDepositosActivos.Rangos;
begin
  // Proveedores

  with QMinProv do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     ProvDesde := FieldByName['MINIMO'].AsInteger;
     FreeHandle;
  end;

  with QMaxProv do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     ProvHasta := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;

  // Articulos
  with QMinArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     ArticuloDesde := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     ArticuloHasta := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;

  // Almacenes
  with QMinAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     AlmacenDesde := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     AlmacenHasta := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;

  //Ejercicios
  with QEjercicios do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     FechaDesde := FieldByName['APERTURA'].AsDateTime;
     FechaHasta := FieldByName['CIERRE'].AsDateTime;
     FreeHandle;
  end;
end;

procedure TDMRDepositosActivos.frDepositosActivosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
  end;
end;

procedure TDMRDepositosActivos.frDepositosActivosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Descripcion' then
     if (xDepositosActivosALMACEN.AsString = 'TO1') then
        ParValue := 'TOTAL PROVEEDOR '
     else if (xDepositosActivosALMACEN.AsString = 'TO2') then
        ParValue := 'TOTAL ARTÍCULO '
     else if (xDepositosActivosALMACEN.AsString = 'TO3') then
        ParValue := 'TOTAL ALMACÉN '
     else
        ParValue := xDepositosActivosTITULO_ARTICULO.AsString;

  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMRDepositosActivos.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

procedure TDMRDepositosActivos.frxDepositosActivosBeforePrint(Sender: TfrxReportComponent);
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
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraE]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRDepositosActivos.frxDepositosActivosGetValue(const VarName: string; var Value: variant);
begin
  frDepositosActivosGetValue(VarName, Value);
end;

end.
