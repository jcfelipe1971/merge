unit UDMLstStockUbicacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, HYFIBQuery, FIBDatabase, UFIBModificados, DB,
  FIBDataSetRO, FIBDataSet, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstStockUbicacion = class(TDataModule)
     TLocal: THYTransaction;
     xArticuloD: TFIBDataSetRO;
     xArticuloH: TFIBDataSetRO;
     xArticuloDTITULO: TFIBStringField;
     xArticuloHTITULO: TFIBStringField;
     xUbicacionD: TFIBDataSetRO;
     xUbicacionH: TFIBDataSetRO;
     xUbicacionDTITULO: TFIBStringField;
     xUbicacionHTITULO: TFIBStringField;
     DSxArticuloD: TDataSource;
     DSxArticuloH: TDataSource;
     DSxUbicacionD: TDataSource;
     DSxUbicacionH: TDataSource;
     frStockUb: TfrHYReport;
     xListado: TFIBDataSetRO;
     DSxListado: TDataSource;
     frDBxListado: TfrDBDataSet;
     frxStockUb: TfrxHYReport;
     TUpdate: THYTransaction;
     xLote: TFIBDataSetRO;
     DSxLote: TDataSource;
     xLoteLOTE: TFIBStringField;
     xLoteCADUCIDAD: TDateTimeField;
     xLoteEXISTENCIA: TIntegerField;
     frDBDxLote: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frStockUbEnterRect(Memo: TStringList; View: TfrView);
     procedure frStockUbGetValue(const ParName: string; var ParValue: variant);
     procedure frxStockUbBeforePrint(Sender: TfrxReportComponent);
     procedure frxStockUbGetValue(const VarName: string; var Value: variant);
     procedure xListadoAfterOpen(DataSet: TDataSet);
     procedure xListadoBeforeClose(DataSet: TDataSet);
     procedure xLoteBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
     UbicacionDesde, UbicacionHasta, ArticuloDesde, ArticuloHasta: string;
     function DameCondicionListado(SinStock: integer): string;
     function DameOrdenListado(Orden: integer): string;
  public
     { Public declarations }
     procedure DameValoresMaxMin(var MaxUbicacion, MinUbicacion, MaxArticulo, MinArticulo: string);
     procedure DameTitulosArticulo(Articulo: string; Modo: byte);
     procedure DameTitulosUbicacion(Ubicacion: string; Modo: byte);
     procedure MostrarListado(UbicacionD, UbicacionH, ArticuloD, ArticuloH, Comentario: string; FechaListado: TDateTime; Orden, SinStock, CanalSeleccion: integer; Modo: byte);
  end;

var
  DMLstStockUbicacion : TDMLstStockUbicacion;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles;

{$R *.dfm}

procedure TDMLstStockUbicacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMLstStockUbicacion.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstStockUbicacion.DameValoresMaxMin(var MaxUbicacion, MinUbicacion, MaxArticulo, MinArticulo: string);
begin
  DameMinMax('ART', MinArticulo, MaxArticulo);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(COMPOSICION), MAX(COMPOSICION) FROM ART_ALMACENES_UBICACIONES WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        MinUbicacion := FieldByName['MIN'].AsString;
        MaxUbicacion := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstStockUbicacion.DameTitulosUbicacion(Ubicacion: string; Modo: byte);
begin
  case Modo of
     0: with xUbicacionD do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['COMPOSICION'].AsString := Ubicacion;
           Open;
        end;
     1: with xUbicacionH do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['COMPOSICION'].AsString := Ubicacion;
           Open;
        end;
  end;
end;

procedure TDMLstStockUbicacion.DameTitulosArticulo(Articulo: string; Modo: byte);
begin
  case Modo of
     0: with xArticuloD do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Open;
        end;
     1: with xArticuloH do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Open;
        end;
  end;
end;

procedure TDMLstStockUbicacion.MostrarListado(UbicacionD, UbicacionH, ArticuloD, ArticuloH, Comentario: string; FechaListado: TDateTime; Orden, SinStock, CanalSeleccion: integer; Modo: byte);
var
  Orderby, Condicion : string;
begin
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(UbicacionD, UbicacionH);
  DMListados.DatosInforme(FechaListado, Comentario);
  UbicacionDesde := UbicacionD;
  UbicacionHasta := UbicacionH;
  ArticuloDesde := ArticuloD;
  ArticuloHasta := ArticuloH;

  OrderBy := DameOrdenListado(Orden);
  Condicion := DameCondicionListado(SinStock);

  with xListado do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM LST_STOCK_POR_UBICACION ');
     SelectSQL.Add(' (:ENTRADA, :EMPRESA, :CANAL, :UBICACION_DESDE, ');
     SelectSQL.Add(' :UBICACION_HASTA, :ARTICULO_DESDE, :ARTICULO_HASTA)');
     SelectSQL.Add(Condicion);
     SelectSQL.Add(OrderBy);
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := CanalSeleccion;
     Params.ByName['UBICACION_DESDE'].AsString := UbicacionD;
     Params.ByName['UBICACION_HASTA'].AsString := UbicacionH;
     Params.ByName['ARTICULO_DESDE'].AsString := ArticuloD;
     Params.ByName['ARTICULO_HASTA'].AsString := ArticuloH;
     Open;
  end;

  DMListados.Imprimir(194, 0, Modo, '', '', frStockUb, frxStockUb, nil, nil);
end;

procedure TDMLstStockUbicacion.frStockUbEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstStockUbicacion.frStockUbGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'FechaLst') then
     DMListados.GetValue('FechaListado', ParValue);

  if (ParName = 'ComentarioLst') then
     DMListados.GetValue('Comentario', ParValue);

  if (ParName = 'UD') then
     ParValue := UbicacionDesde;

  if (ParName = 'UH') then
     ParValue := UbicacionHasta;

  if (ParName = 'AD') then
     ParValue := ArticuloDesde;

  if (ParName = 'AH') then
     ParValue := ArticuloHasta;
end;

function TDMLstStockUbicacion.DameOrdenListado(Orden: integer): string;
begin
  Result := '';
  case Orden of
     0: Result := ' ORDER BY COMPOSICION, ARTICULO ';
     1: Result := ' ORDER BY ARTICULO ';
     2: Result := ' ORDER BY EXISTENCIAS ';
     3: Result := ' ORDER BY FAMILIA ';
  end;
end;

function TDMLstStockUbicacion.DameCondicionListado(SinStock: integer): string;
begin
  Result := '';
  case SinStock of
     0: Result := ' WHERE EXISTENCIAS > 0 ';
     1: Result := '';
  end;
end;

procedure TDMLstStockUbicacion.frxStockUbBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstStockUbicacion.frxStockUbGetValue(const VarName: string; var Value: variant);
begin
  frStockUbGetValue(VarName, Value);
end;

procedure TDMLstStockUbicacion.xListadoAfterOpen(DataSet: TDataSet);
begin
  xLote.Open;
end;

procedure TDMLstStockUbicacion.xListadoBeforeClose(DataSet: TDataSet);
begin
  xLote.Close;
end;

procedure TDMLstStockUbicacion.xLoteBeforeOpen(DataSet: TDataSet);
begin
  xLote.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

end.
