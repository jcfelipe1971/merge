unit UDMLstRiesgoClientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDataSet, FIBQuery, FIBTableDataSetRO, FR_DSet,
  FR_DBSet, HYFIBQuery, frxClass, frxHYReport, DateUtils;

type
  TDMLstRiesgoClientes = class(TDataModule)
     TLocal: THYTransaction;
     frRiesgoClientes: TfrHYReport;
     DSxEmpClientes: TDataSource;
     xRecibosRemesados: TFIBDataSetRO;
     DSxRecibosRemesados: TDataSource;
     frDBDSEmpClientes: TfrDBDataSet;
     frDBDSxRecibosRemesados: TfrDBDataSet;
     xEmpClientes: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     xMonedasMONEDA: TFIBStringField;
     xMonedasTITULO: TFIBStringField;
     xMonedasSIGNO_MONEDA: TFIBStringField;
     xMonedasDEC_VER: TIntegerField;
     xMonedasDEC_CALCULOS: TIntegerField;
     xMonedasDEFECTO: TIntegerField;
     DSxMonedas: TDataSource;
     QMaxCliente: THYFIBQuery;
     xRecibosCartera: TFIBDataSetRO;
     DSxRecibosCartera: TDataSource;
     frDBDSxRecibosCartera: TfrDBDataSet;
     frxRiesgoClientes: TfrxHYReport;
     TUpdate: THYTransaction;
     QMaxAgente: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frRiesgoClientesGetValue(const ParName: string; var ParValue: variant);
     procedure frRiesgoClientesBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxRiesgoClientesBeforePrint(Sender: TfrxReportComponent);
     procedure frxRiesgoClientesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     FechaListado: TDateTime;
     Comentario: string;
     LocalMascaraN: string;
  public
     { Public declarations }
     Fecha_Desde, Fecha_Hasta: TDateTime;
     procedure MostrarListadoFiltrado(Modo: byte; ClienteD, ClienteH, AgenteD, AgenteH: integer; FechaD, FechaH: TDateTime; FechaL: TDateTime; Coment: string);
     function DameClienteH: integer;
     function DameAgenteH: integer;
     procedure Rangos;
  end;

var
  DMLstRiesgoClientes : TDMLstRiesgoClientes;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

procedure TDMLstRiesgoClientes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  xMonedas.Open;
end;

procedure TDMLstRiesgoClientes.MostrarListadoFiltrado(Modo: byte; ClienteD, ClienteH, AgenteD, AgenteH: integer; FechaD, FechaH: TDateTime; FechaL: TDateTime; Coment: string);
begin
  DMListados.Normalizar_Desde_Hasta(ClienteD, ClienteH);
  DMListados.Normalizar_Desde_Hasta(fechaD, fechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');

  FechaListado := FechaL;
  Comentario := Coment;

  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  with xEmpClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE_DESDE'].AsInteger := ClienteD;
     Params.ByName['CLIENTE_HASTA'].AsInteger := ClienteH;
     Params.ByName['AGENTE_DESDE'].AsInteger := AgenteD;
     Params.ByName['AGENTE_HASTA'].AsInteger := AgenteH;
     Open;
  end;

  with xRecibosCartera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := xEmpClientes.FieldByName('CLIENTE').AsInteger;
     Params.ByName['FECHAD'].AsDateTime := Fecha_Desde;
     Params.ByName['FECHAH'].AsDateTime := Fecha_Hasta;
     // Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     Open;
  end;

  with xRecibosRemesados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := xEmpClientes.FieldByName('CLIENTE').AsInteger;
     Params.ByName['FECHAD'].AsDateTime := Fecha_Desde;
     Params.ByName['FECHAH'].AsDateTime := Fecha_Hasta;
     // Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     Open;
  end;

  DMListados.Imprimir(203, 0, Modo, '', _('Listado de Riesgo de Cliente'), frRiesgoClientes, frxRiesgoClientes, nil, nil);
end;

procedure TDMLstRiesgoClientes.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstRiesgoClientes.frRiesgoClientesGetValue(const ParName: string; var ParValue: variant);
var
  cambio : extended;
begin
  cambio := 0;
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'FechaDesde' then
     ParValue := StrToDate(DateToStr(Fecha_Desde));

  if ParName = 'FechaHasta' then
     ParValue := StrToDate(DateToStr(Fecha_Hasta));

  if ParName = 'FechaListado' then
     ParValue := FechaListado;

  if ParName = 'Comentario' then
     ParValue := Comentario;

  if ParName = 'Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;

  if ParName = 'ImporteReciboCartera' then
     ParValue := DMMain.DameCambio(True, xRecibosCartera.FieldByName('MONEDA').AsString, xMonedas.FieldByName('MONEDA').AsString, xRecibosCartera.FieldByName('VENCIMIENTO').AsDateTime, xRecibosCartera.FieldByName('LIQUIDO').AsFloat, Cambio);

  if ParName = 'ImporteReciboRemesa' then
     ParValue := DMMain.DameCambio(True, xRecibosRemesados.FieldByName('MONEDA').AsString, xMonedas.FieldByName('MONEDA').AsString, xRecibosRemesados.FieldByName('VENCIMIENTO').AsDateTime, xRecibosRemesados.FieldByName('LIQUIDO').AsFloat, Cambio);

  if ParName = 'RiesgoAutorizadoCliente' then
     ParValue := DMMain.DameCambio(True, xEmpClientes.FieldByName('MONEDA').AsString, xMonedas.FieldByName('MONEDA').AsString, REntorno.FechaTrab, xEmpClientes.FieldByName('RIESGO_AUT').AsFloat, Cambio);

  // Agregamos dias des del vencimiento hasta fecha sistema para listado especial 9009 en arroceras
  if ParName = 'Dias' then
     ParValue := DaysBetween(xRecibosCartera.FieldByName('VENCIMIENTO').AsDateTime, Now);

  // RD para arroceras Agregamos descripcion de texto por si estan agrupados
  if ParName = 'Texto' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA = :ID_CARTERA';
           Params.ByName['ID_CARTERA'].AsInteger := xRecibosCartera.FieldByName('ID_CARTERA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['TEXTO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Observaciones' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT OBSERVACIONES FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA = :ID_CARTERA';
           Params.ByName['ID_CARTERA'].AsInteger := xRecibosCartera.FieldByName('ID_CARTERA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['OBSERVACIONES'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMLstRiesgoClientes.frRiesgoClientesBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

function TDMLstRiesgoClientes.DameClienteH: integer;
begin
  with QMaxCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

procedure TDMLstRiesgoClientes.Rangos;
begin
  DameMinMax('EJE', Fecha_Desde, Fecha_Hasta);
end;

procedure TDMLstRiesgoClientes.frxRiesgoClientesBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
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
        end;
end;

procedure TDMLstRiesgoClientes.frxRiesgoClientesGetValue(const VarName: string; var Value: variant);
begin
  frRiesgoClientesGetValue(VarName, Value);
end;

function TDMLstRiesgoClientes.DameAgenteH: integer;
begin
  with QMaxAgente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

end.
