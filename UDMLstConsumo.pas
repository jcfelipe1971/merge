unit UDMLstConsumo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, HYFIBQuery, FIBDataSet, FR_DSet,
  FR_DBSet, FIBDataSetRO, FR_Class, Fr_HYReport, FIBDatabase,
  UFIBModificados;

type
  TDMLstConsumo = class(TDataModule)
     TLocal: THYTransaction;
     frConsumo: TfrHYReport;
     xLstCabConsumo: TFIBDataSetRO;
     DSxLstCabConsumo: TDataSource;
     frDBLstCabConsumo: TfrDBDataSet;
     xLstFactConsumo: TFIBDataSetRO;
     DSxLstFactConsumo: TDataSource;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frConsumoGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     Grupo: integer;
     SerieD: string;
     SerieH: string;
     ClienteD: integer;
     ClienteH: integer;
     AgenteD: integer;
     AgenteH: integer;
     Consumo_Desde: string;
     Consumo_Hasta: string;
     Agrupacion: string;
     Fecha_Desde: string;
     Fecha_Hasta: string;
     SerieDLst: string;
     SerieHLst: string;
     ClienteDLst: string;
     ClienteHLst: string;
     AgenteDLst: string;
     AgenteHLst: string;
     ConsumoDLst: string;
     ConsumoHLst: string;
     AgrupacionLst: string;
     min_fecha: TDateTime;
     max_fecha: TDateTime;
     procedure RecargaConsumo;
     procedure MostrarListado(Modo: word; SerieD: string; SerieH: string; Agrupacion: string; ClienteD, ClienteH, AgenteD, AgenteH: integer; min_fecha, max_fecha: TDateTime);
  end;

var
  DMLstConsumo : TDMLstConsumo;

implementation

uses UDMListados, UEntorno, UUtiles, UFormGest, UDMMain;

{$R *.dfm}

procedure TDMLstConsumo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstConsumo.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstConsumo.RecargaConsumo;
var
  Q : THYFIBQuery;
begin
  DameMinMax('SER', SerieD, SerieH);
  DameMinMax('CLI', ClienteD, ClienteH);
  DameMinMax('AGE', AgenteD, AgenteH);

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 AGRUPACION FROM SYS_AGRUPACIONES WHERE TIPO = ''T'' ';
        ExecQuery;
        Agrupacion := FieldByName['AGRUPACION'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMLstConsumo.MostrarListado(Modo: word; SerieD: string; SerieH: string; Agrupacion: string; ClienteD, ClienteH, AgenteD, AgenteH: integer; min_fecha, max_fecha: TDateTime);
var
  datad, datah : string;
begin
  SerieDLst := SerieD;
  SerieHLst := SerieH;
  ClienteDLst := IntToStr(ClienteD);
  ClienteHLst := IntToStr(ClienteH);
  AgenteDLst := IntToStr(AgenteD);
  AgenteHLst := IntToStr(AgenteH);
  AgrupacionLst := Agrupacion;
  datad := DateToStr(Min_fecha);
  datah := DateToStr(Max_fecha);
  min_fecha := StrToDateTime(datad + ' 00:00:00');
  max_fecha := StrToDateTime(datah + ' 23:59:59');

  with xLstCabConsumo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE_DESDE'].AsInteger := ClienteD;
     Params.ByName['CLIENTE_HASTA'].AsInteger := ClienteH;
     Params.ByName['AGENTE_DESDE'].AsInteger := AgenteD;
     Params.ByName['AGENTE_HASTA'].AsInteger := AgenteH;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;

  with xLstFactConsumo do
  begin
     Close;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Params.ByName['SERIE_DESDE'].AsString := SerieD;
     Params.ByName['SERIE_HASTA'].AsString := SerieH;
     Params.ByName['FECHA_DESDE'].AsDateTime := min_fecha;
     Params.ByName['FECHA_HASTA'].AsDateTime := max_fecha;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  DMListados.Imprimir(Grupo, Modo, '', '', frConsumo, nil);
end;

procedure TDMLstConsumo.frConsumoGetValue(const ParName: string; var ParValue: variant);
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
     if ParName = 'AgenteD' then
        ParValue := AgenteDLst;
     if ParName = 'AgenteH' then
        ParValue := AgenteHLst;
     if ParName = 'fecha_desde' then
        ParValue := xLstFactConsumo.Params.ByName['fecha_desde'].AsDateTime;
     if ParName = 'fecha_hasta' then
        ParValue := xLstFactConsumo.Params.ByName['fecha_hasta'].AsDateTime; // if parname = 'AgrH' then parvalue := AgrHLst;
  end;
end;

end.
