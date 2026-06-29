unit UDMLstPropConfirmProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstPropConfirmProv = class(TDataModule)
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     frPropConfirm: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     xProveedores: TFIBDataSetRO;
     TLocal: THYTransaction;
     xProveedoresEMPRESA: TIntegerField;
     xProveedoresEJERCICIO: TIntegerField;
     xProveedoresCANAL: TIntegerField;
     xProveedoresPROVEEDOR: TIntegerField;
     xProveedoresTERCERO: TIntegerField;
     xProveedoresTITULO: TFIBStringField;
     xProveedoresNIF: TFIBStringField;
     xProveedoresDESCUENTO: TFloatField;
     xProveedoresFORMA_PAGO: TFIBStringField;
     xProveedoresDIA_PAGO_1: TIntegerField;
     xProveedoresDIA_PAGO_2: TIntegerField;
     xProveedoresDESCUENTO_PP: TFloatField;
     xProveedoresNOTAS: TBlobField;
     xProveedoresMODO_IVA: TIntegerField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraPROVEEDOR: TIntegerField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraBULTOS: TIntegerField;
     QMCabeceraLINEAS: TIntegerField;
     QMCabeceraBRUTO: TFloatField;
     QMCabeceraI_DTO_LINEAS: TFloatField;
     QMCabeceraS_BASES: TFloatField;
     QMCabeceraS_CUOTA_IVA: TFloatField;
     QMCabeceraS_CUOTA_RE: TFloatField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraI_DTO_CIAL: TFloatField;
     QMCabeceraI_DTO_PP: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraFORMA_DE_PAGO: TFIBStringField;
     xEstados: TFIBDataSetRO;
     DSxEstado: TDataSource;
     xEstadosTITULO: TFIBStringField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraID_E: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMCabeceraPROYECTO: TIntegerField;
     frxPropConfirm: TfrxHYReport;
     procedure frPropConfirmGetValue(const ParName: string; var ParValue: variant);
     procedure frPropConfirmEnterRect(Memo: TStringList; View: TfrView);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraPROYECTOChange(Sender: TField);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxPropConfirmBeforePrint(Sender: TfrxReportComponent);
     procedure frxPropConfirmGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Moneda: string;
     LocalMascaraN, LocalMascaraL: string;
     FechaDesde, FechaHasta: TDateTime;
     SW: integer;
  public
     { Public declarations }
     Estado: integer;
     procedure MostrarListadoFiltrado(modo: byte; Filtro: integer; serie: string);
     procedure MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
  end;

var
  DMLstPropConfirmProv : TDMLstPropConfirmProv;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados;

{$R *.DFM}

procedure TDMLstPropConfirmProv.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Estado := -1;
end;

procedure TDMLstPropConfirmProv.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPropConfirmProv.MostrarListadoFiltrado(modo: byte; Filtro: integer; serie: string);
begin
  SW := 1;
  with QMCabecera do
  begin
     Close;
     Open;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := serie;
        Open;
     end;
  end;

  Moneda := REntorno.Moneda;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Imprimir(521, 0, Modo, Serie, '', frPropConfirm, frxPropConfirm, nil, nil);
end;

procedure TDMLstPropConfirmProv.MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
var
  Orden : string;
begin
  SW := 1;

  FechaDesde := Desde;
  FechaHasta := Hasta;
  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);
  DMListados.Normalizar_Desde_Hasta(ProveedorDesde, ProveedorHasta);

  DMListados.DatosInforme(aFechaListado, aComentario);

  Moneda := Moneda_Listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  if Ord then
     Orden := 'SERIE, RIG'
  else
     Orden := 'FECHA, SERIE, RIG';

  with QMCabecera do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_OCP ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' SERIE = ?SERIE AND ');
     if (Estado >= 0) then
        SelectSQL.Add(' ESTADO = ?ESTADO AND ');
     SelectSQL.Add(' ((FECHA >= ?FECHA_DESDE) AND (FECHA <= ?FECHA_HASTA)) AND ');
     SelectSQL.Add(' ((PROVEEDOR >= ?PROVEEDOR_DESDE) AND (PROVEEDOR <= ?PROVEEDOR_HASTA)) ');
     SelectSQL.Add(' ORDER BY ' + Orden);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Estado >= 0) then
        Params.ByName['ESTADO'].AsInteger := Estado;
     Params.ByName['FECHA_DESDE'].AsDateTime := Desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Hasta;
     Params.ByName['PROVEEDOR_DESDE'].AsInteger := ProveedorDesde;
     Params.ByName['PROVEEDOR_HASTA'].AsInteger := ProveedorHasta;
     Open;
  end;

  DMListados.Imprimir(521, 0, Modo, Serie, '', frPropConfirm, frxPropConfirm, nil, nil);
end;

procedure TDMLstPropConfirmProv.frPropConfirmGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Desde' then
     ParValue := FechaDesde;
  if ParName = 'Hasta' then
     ParValue := FechaHasta;
  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := Moneda;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

  if ParName = 'Total_Propuesta' then
     ParValue := DMMain.DameCambio(False, QMCabeceraMONEDA.AsString, Moneda, QMCabeceraFECHA.AsDateTime, QMCabeceraLIQUIDO.AsFloat);
end;

procedure TDMLstPropConfirmProv.frPropConfirmEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstPropConfirmProv.QMCabeceraPROYECTOChange(Sender: TField);
begin
  {xProyectos.Close;
  xProyectos.Open;}
end;

procedure TDMLstPropConfirmProv.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xEstados.Open;
  xProveedores.Open;
end;

procedure TDMLstPropConfirmProv.frxPropConfirmBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstPropConfirmProv.frxPropConfirmGetValue(const VarName: string; var Value: variant);
begin
  frPropConfirmGetValue(VarName, Value);
end;

procedure TDMLstPropConfirmProv.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xEstados.Close;
  xProveedores.Close;
end;

end.
