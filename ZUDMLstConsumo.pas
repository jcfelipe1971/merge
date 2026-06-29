unit ZUDMLstConsumo;

interface

uses
  SysUtils, Classes, DB, FIBQuery, HYFIBQuery, FIBDataSet, FR_DSet,
  FR_DBSet, FIBDataSetRO, FR_Class, Fr_HYReport, FIBDatabase,
  UFIBModificados;

type
  TZDMLstConsumo = class(TDataModule)
     TLocal: THYTransaction;
     frConsumo: TfrHYReport;
     xLstCabConsumo: TFIBDataSetRO;
     DSxLstCabConsumo: TDataSource;
     frDBLstCabConsumo: TfrDBDataSet;
     xAgrupacion: TFIBDataSetRO;
     xAgrupacionTITULO: TFIBStringField;
     DSxAgrupacion: TDataSource;
     xSerie_Desde: TFIBDataSetRO;
     xSerie_DesdeTITULO: TFIBStringField;
     DSxSerie_Desde: TDataSource;
     xSerie_Hasta: TFIBDataSetRO;
     xSerie_HastaTITULO: TFIBStringField;
     DSxSerie_Hasta: TDataSource;
     QGeneral: THYFIBQuery;
     xCliente_Desde: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxCliente_Desde: TDataSource;
     xCliente_Hasta: TFIBDataSetRO;
     DSxCliente_Hasta: TDataSource;
     xCliente_HastaTITULO: TFIBStringField;
     xLstFactConsumo: TFIBDataSetRO;
     DSxLstFactConsumo: TDataSource;
     frDBLstDetConsumo: TfrDBDataSet;
     xLstFactConsumoCONSUMOFACT: TFloatField;
     xClientes: TFIBDataSetRO;
     xClientesTERCERO: TIntegerField;
     xClientesNOMBRE_R_SOCIAL: TFIBStringField;
     DSxClientes: TDataSource;
     xLstCabConsumoIDDETCONSUMO: TIntegerField;
     xLstCabConsumoAGRUPACION: TFIBStringField;
     xLstCabConsumoLINEA: TIntegerField;
     xLstCabConsumoCONSUMO: TFloatField;
     xLstCabConsumoCLIENTE: TIntegerField;
     xLstCabConsumoEMPRESA: TIntegerField;
     xLstCabConsumoEJERCICIO: TIntegerField;
     xLstCabConsumoTERCERO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frConsumoGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     SerieD: string;
     SerieH: string;
     ClienteD: string;
     ClienteH: string;
     Consumo_Desde: string;
     Consumo_Hasta: string;
     Agrupacion: string;
     Fecha_Desde: string;
     Fecha_Hasta: string;
     SerieDLst: string;
     SerieHLst: string;
     ClienteDLst: string;
     ClienteHLst: string;
     ConsumoDLst: string;
     ConsumoHLst: string;
     AgrupacionLst: string;
     min_fecha: TDateTime;
     max_fecha: TDateTime;
     procedure recargaConsumo;
     procedure MostrarListado(Modo: word; SerieD: string; SerieH: string; Agrupacion: string; ClienteD: string; ClienteH: string; min_fecha, max_fecha: TDateTime);
  end;

var
  ZDMLstConsumo : TZDMLstConsumo;

implementation

uses UDMListados, UEntorno, UUtiles, UFormGest {,ZUFMLSTConsumo No se utiliza};

{$R *.dfm}

procedure TZDMLstConsumo.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLstConsumo.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLSTConsumo.recargaConsumo;
begin
  with QgeneraL do
  begin
     if Open then
        Close;

     SQL.Clear;
     SQL.Add('SELECT MIN(SERIE) as minser, MAX(SERIE) as maxser ');
     SQL.Add('FROM GEN_SERIES ');
     SQL.Add('WHERE ACTIVO=1 ');
     ExecQuery;
     SerieD := FieldByName['MINSER'].AsString;
     SerieH := FieldByName['MAXSER'].AsString;
     SQL.Clear;

     SQL.Clear;
     SQL.Add('SELECT MIN(CLIENTE) as mincli, MAX(CLIENTE) as maxcli ');
     SQL.Add('FROM EMP_CLIENTES ');
     ExecQuery;
     ClienteD := FieldByName['MINCLI'].AsString;
     ClienteH := FieldByName['MAXCLI'].AsString;
     SQL.Clear;

     SQL.Add('SELECT FIRST 1 (AGRUPACION) as agrupacion ');
     SQL.Add('FROM  SYS_AGRUPACIONES ');
     SQL.Add('WHERE TIPO=''T'' ');
     ExecQuery;
     Agrupacion := FieldByName['agrupacion'].AsString;
     SQL.Clear;
  end;
end;

procedure TZDMLSTConsumo.MostrarListado(Modo: word; SerieD: string; SerieH: string; Agrupacion: string; ClienteD: string; ClienteH: string; min_fecha, max_fecha: TDateTime);
var
  str : string;
  datad, datah : string;
begin
  SerieDLst := SerieD;
  SerieHLst := SerieH;
  ClienteDLst := ClienteD;
  ClienteHLst := ClienteH;
  AgrupacionLst := Agrupacion;
  datad := DateToStr(Min_fecha);
  datah := DateToStr(Max_fecha);
  min_fecha := StrToDateTime(datad + ' 00:00:00');
  max_fecha := StrToDateTime(datah + ' 23:59:59');

  xLstCabConsumo.Close;
  xLstCabConsumo.Params.ByName['cliente_desde'].AsString := ClienteD;
  xLstCabConsumo.Params.ByName['cliente_hasta'].AsString := ClienteH;
  xLstCabConsumo.Params.ByName['agrupacion'].AsString := Agrupacion;
  xLstCabConsumo.Open;

  {  xLstDetConsumo.Close;
  xLstDetConsumo.Params.ByName['agrupacion'    ].AsString  := Agrupacion;
  xLstCabConsumo.Params.ByName['cliente_desde'    ].AsString  := ClienteD;
  xLstCabConsumo.Params.ByName['cliente_hasta'    ].AsString  := ClienteH;
  xLstDetConsumo.Open;
}
  xLstFactConsumo.Close;
  xLstFactConsumo.Params.ByName['agrupacion'].AsString := Agrupacion;
  xLstFactConsumo.Params.ByName['serie_desde'].AsString := SerieD;
  xLstFactConsumo.Params.ByName['serie_hasta'].AsString := SerieH;
  xLstFactConsumo.Params.ByName['fecha_desde'].AsDateTime := min_fecha;
  xLstFactConsumo.Params.ByName['fecha_hasta'].AsDateTime := max_fecha;
  xLstFactConsumo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xLstFactConsumo.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  xLstFactConsumo.Open;

  DMListados.Cargar(10002, '');

  frConsumo.LoadFromFIB(REntorno.Formato, str);
  frConsumo.PrepareReport;
  case Modo of
     0: frConsumo.ShowPreparedReport;
     1: frConsumo.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TZDMLstConsumo.frConsumoGetValue(const ParName: string; var ParValue: variant);
begin
  begin
     DMListados.GetValue(ParName, ParValue);

     if ParName = 'SerieD' then
        ParValue := SerieDLst;
     if ParName = 'SerieH' then
        ParValue := SerieHLst;
     if ParName = 'Agrupacion' then
        ParValue := AgrupacionLst;
     if ParName = 'ClienteD' then
        ParValue := ClienteDLst;
     if ParName = 'ClienteH' then
        ParValue := ClienteHLst;
     if ParName = 'fecha_desde' then
        ParValue := xLstFactConsumo.Params.ByName['fecha_desde'].AsDateTime;
     if ParName = 'fecha_hasta' then
        ParValue := xLstFactConsumo.Params.ByName['fecha_hasta'].AsDateTime;//  if parname = 'AgrH' then parvalue := AgrHLst;
  end;
end;

end.
