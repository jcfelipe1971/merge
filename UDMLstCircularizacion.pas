unit UDMLstCircularizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet,
  FIBDatabase, UFIBModificados, FIBQuery, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstCircularizacion = class(TDataModule)
     frCircularizacion: TfrHYReport;
     xCuenta: TFIBDataSetRO;
     DSxCuenta: TDataSource;
     TLocal: THYTransaction;
     frDSxCuenta: TfrDBDataSet;
     xSaldos: TFIBDataSetRO;
     DSxSaldos: TDataSource;
     frxCircularizacion: TfrxHYReport;
     TUpdate: THYTransaction;
     xMaestro: TFIBDataSetRO;
     DSxMaestro: TDataSource;
     frDBDataSet1: TfrDBDataSet;
     xDireccion: TFIBDataSetRO;
     DSxDireccion_Cliente: TDataSource;
     procedure DMRCabeceraDestroy(Sender: TObject);
     procedure frCircularizacionEnterRect(Memo: TStringList; View: TfrView);
     procedure frCircularizacionGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstCircularizacionCreate(Sender: TObject);
     procedure frxCircularizacionBeforePrint(Sender: TfrxReportComponent);
     procedure frxCircularizacionGetValue(const VarName: string; var Value: variant);
     procedure xMaestroAfterOpen(DataSet: TDataSet);
     procedure xCuentaAfterOpen(DataSet: TDataSet);
     procedure xMaestroBeforeClose(DataSet: TDataSet);
     procedure xCuentaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FDesde, FHasta: TDateTime;
  public
     { Public declarations }
     SaldoCero: integer;
     procedure MostrarListadoCliente(Modo: integer; Cliente: integer; Desde, Hasta: TDateTime; Archivo: string);
     procedure MostrarListadoProveedor(Modo, Proveedor: integer; Desde, Hasta: TDateTime; Archivo: string);
     procedure MostrarListadoAcreedor(Modo, Acreedor: integer; Desde, Hasta: TDateTime; Archivo: string);
     procedure MostrarListadoBanco(Modo, Banco: integer; Desde, Hasta: TDateTime; Archivo: string);
  end;

var
  DMLstCircularizacion : TDMLstCircularizacion;

implementation

uses UEntorno, UFormGest, UDMListados, UDMMain, UUtiles;

{$R *.DFM}

procedure TDMLstCircularizacion.DMLstCircularizacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMLstCircularizacion.DMRCabeceraDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstCircularizacion.frCircularizacionEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMLstCircularizacion.frCircularizacionGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FDesde' then
     ParValue := FDesde;
  if ParName = 'FHasta' then
     ParValue := FHasta;
  if ParName = 'FDesdeStr' then
     ParValue := FormatDateTime(ShortDateFormat, FDesde);
  if ParName = 'FHastaStr' then
     ParValue := FormatDateTime(ShortDateFormat, FHasta);
end;

procedure TDMLstCircularizacion.frxCircularizacionBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstCircularizacion.frxCircularizacionGetValue(const VarName: string; var Value: variant);
begin
  frCircularizacionGetValue(VarName, Value);
end;

procedure TDMLstCircularizacion.MostrarListadoCliente(Modo: integer; Cliente: integer; Desde, Hasta: TDateTime; Archivo: string);
begin
  // Añadir la hora a los campos fecha
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  FDesde := Desde;
  FHasta := Hasta;

  with xMaestro do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_CLIENTES_CUENTAS ');
     SelectSQL.Add('WHERE ');
     SelectSQL.Add('EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add('CANAL = :CANAL AND ');
     SelectSQL.Add('CLIENTE = :CLIENTE ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  with xCuenta do
  begin
     Close;
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := FDesde;
     Params.ByName['HASTA'].AsDateTime := FHasta;
     Params.ByName['MONEDA'].AsString := REntorno.Moneda;
     Params.ByName['ALCANCE'].AsInteger := 1; // Solo el canal
     Open;
  end;

  DMListados.DatosInforme(REntorno.FechaTrab, _('Circularizacion Cliente'));
  if (Archivo = '') then
     Archivo := format(_('CircularizacionCliente_%d.pdf'), [Cliente]);
  DMListados.Imprimir(644, 0, Modo, '', _('Circularizacion Cliente'), frCircularizacion, frxCircularizacion, nil, Archivo);
end;

procedure TDMLstCircularizacion.MostrarListadoProveedor(Modo: integer; Proveedor: integer; Desde, Hasta: TDateTime; Archivo: string);
begin
  // Añadir la hora a los campos fecha
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  FDesde := Desde;
  FHasta := Hasta;

  with xMaestro do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_PROVEEDORES_CUENTAS ');
     SelectSQL.Add('WHERE ');
     SelectSQL.Add('EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add('CANAL = :CANAL AND ');
     SelectSQL.Add('PROVEEDOR = :PROVEEDOR ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;

  with xCuenta do
  begin
     Close;
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := FDesde;
     Params.ByName['HASTA'].AsDateTime := FHasta;
     Params.ByName['MONEDA'].AsString := REntorno.Moneda;
     Params.ByName['ALCANCE'].AsInteger := 1; // Solo el canal
     Open;
  end;

  DMListados.DatosInforme(REntorno.FechaTrab, _('Circularizacion Proveedor'));
  if (Archivo = '') then
     Archivo := format(_('CircularizacionProveedor_%d.pdf'), [Proveedor]);
  DMListados.Imprimir(645, 0, Modo, '', _('Circularizacion Proveedor'), frCircularizacion, frxCircularizacion, nil, Archivo);
end;

procedure TDMLstCircularizacion.MostrarListadoAcreedor(Modo: integer; Acreedor: integer; Desde, Hasta: TDateTime; Archivo: string);
begin
  // Añadir la hora a los campos fecha
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  FDesde := Desde;
  FHasta := Hasta;

  with xMaestro do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_ACREEDORES_CUENTAS ');
     SelectSQL.Add('WHERE ');
     SelectSQL.Add('EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add('CANAL = :CANAL AND ');
     SelectSQL.Add('ACREEDOR = :ACREEDOR ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Open;
  end;

  with xCuenta do
  begin
     Close;
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := FDesde;
     Params.ByName['HASTA'].AsDateTime := FHasta;
     Params.ByName['MONEDA'].AsString := REntorno.Moneda;
     Params.ByName['ALCANCE'].AsInteger := 1; // Solo el canal
     Open;
  end;

  DMListados.DatosInforme(REntorno.FechaTrab, _('Circularizacion Acreedor'));
  if (Archivo = '') then
     Archivo := format(_('CircularizacionAcreedor_%d.pdf'), [Acreedor]);
  DMListados.Imprimir(646, 0, Modo, '', _('Circularizacion Acreedor'), frCircularizacion, frxCircularizacion, nil, Archivo);
end;

procedure TDMLstCircularizacion.MostrarListadoBanco(Modo: integer; Banco: integer; Desde, Hasta: TDateTime; Archivo: string);
begin
  // Añadir la hora a los campos fecha
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  FDesde := Desde;
  FHasta := Hasta;

  with xMaestro do
  begin
     Close;
     SelectSQL.Clear;
     // La CUENTA_CONTABLE se renombra a CUENTA para poder hacer maestro/detalle con dataset xCuenta
     SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, BANCO, TITULO, TERCERO, ENTIDAD, SUCURSAL, CONTROL, CUENTA_CORRIENTE, RIESGO_CON, ');
     SelectSQL.Add('        RIESGO_UTI, RIESGO_DES, RIESGO_CFM, ACTIVO, CUENTA_CONTABLE AS CUENTA, CUENTA_CC, CUENTA_AHORRO, ');
     SelectSQL.Add('        CUENTA_CONFIRMING, CUENTA_DTO, SEPARA_APUNTES, CUENTA_GASTOS, CUENTA_GASTOS_DESCUENTO, DIA_VALOR, CUENTA_PAGARES, ');
     SelectSQL.Add('        CUENTAS_GASTOS_PAGARES, CUENTA_INTERESES, CUENTA_GASTOS_IMPAGADO, RIESGO_DES_PAG, IBAN, BIC, CONTADOR_TALON, ');
     SelectSQL.Add('        CONTADOR_TALON_AUTOMATICO, CEDENTE_CONFIRMING, CODIGO_ORDENANTE, ALFANUMERO ');
     SelectSQL.Add(' FROM VER_BANCOS_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' BANCO = :BANCO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['BANCO'].AsInteger := Banco;
     Open;
  end;

  with xCuenta do
  begin
     Close;
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := FDesde;
     Params.ByName['HASTA'].AsDateTime := FHasta;
     Params.ByName['MONEDA'].AsString := REntorno.Moneda;
     Params.ByName['ALCANCE'].AsInteger := 1; // Solo el canal
     Open;
  end;

  DMListados.DatosInforme(REntorno.FechaTrab, _('Circularizacion Banco'));
  if (Archivo = '') then
     Archivo := format(_('CircularizacionBanco_%d.pdf'), [Banco]);
  DMListados.Imprimir(647, 0, Modo, '', _('Circularizacion Banco'), frCircularizacion, frxCircularizacion, nil, Archivo);
end;

procedure TDMLstCircularizacion.xMaestroAfterOpen(DataSet: TDataSet);
begin
  xDireccion.Open;
  xCuenta.Open;
end;

procedure TDMLstCircularizacion.xCuentaAfterOpen(DataSet: TDataSet);
begin
  xSaldos.Open;
end;

procedure TDMLstCircularizacion.xMaestroBeforeClose(DataSet: TDataSet);
begin
  xDireccion.Close;
  xCuenta.Close;
end;

procedure TDMLstCircularizacion.xCuentaBeforeClose(DataSet: TDataSet);
begin
  xSaldos.Close;
end;

end.
