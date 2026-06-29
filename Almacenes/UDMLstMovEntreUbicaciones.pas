unit UDMLstMovEntreUbicaciones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, HYFIBQuery, Forms, FR_Class, Fr_HYReport, FR_DSet,
  FR_DBSet, frxClass, frxHYReport;

type
  TDMLstMovEntreUbicaciones = class(TDataModule)
     TLocal: THYTransaction;
     xArticuloD: TFIBDataSetRO;
     xArticuloDTITULO: TFIBStringField;
     xArticuloH: TFIBDataSetRO;
     xArticuloHTITULO: TFIBStringField;
     DSxArticuloD: TDataSource;
     DSxArticuloH: TDataSource;
     frMovEntreUbic: TfrHYReport;
     xMovEntreUbic: TFIBDataSetRO;
     DSxMovEntreUbic: TDataSource;
     frDBxMovEntreUbic: TfrDBDataSet;
     xMovEntreUbicTITULO_O: TFIBStringField;
     xMovEntreUbicCOMPOSICION_O: TFIBStringField;
     xMovEntreUbicFECHA: TDateTimeField;
     xMovEntreUbicUNIDADES: TFloatField;
     xMovEntreUbicENTRADA: TIntegerField;
     xMovEntreUbicTITULO_D: TFIBStringField;
     xMovEntreUbicCOMPOSICION_D: TFIBStringField;
     xMovEntreUbicARTICULO: TFIBStringField;
     xMovEntreUbicTITULO_ART: TFIBStringField;
     xMovEntreUbicMOVIMIENTO: TIntegerField;
     frxMovEntreUbic: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frMovEntreUbicGetValue(const ParName: string; var ParValue: variant);
     procedure frMovEntreUbicEnterRect(Memo: TStringList; View: TfrView);
     procedure frxMovEntreUbicBeforePrint(Sender: TfrxReportComponent);
     procedure frxMovEntreUbicGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure DameTitulosArticulo(Articulo: string; Modo: byte);
     procedure DameValoresMaxMin(var MaxArticulo, MinArticulo: string);
     procedure MostrarListado(ArticD, ArticH: string; fecha_d, fecha_h: TDateTime; modo: integer);
  end;

var
  DMLstMovEntreUbicaciones : TDMLstMovEntreUbicaciones;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.dfm}

procedure TDMLstMovEntreUbicaciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstMovEntreUbicaciones.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstMovEntreUbicaciones.DameTitulosArticulo(Articulo: string; Modo: byte);
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

procedure TDMLstMovEntreUbicaciones.DameValoresMaxMin(var MaxArticulo, MinArticulo: string);
var
  QGen : THYFIBQuery;
begin
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     Transaction := TLocal;

     Close;
     SQL.Text := 'select max(articulo) as MaxArt from art_articulos where empresa = ?empresa and ubicable = 1';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     MaxArticulo := FieldByName['MAXART'].AsString;

     Close;
     SQL.Text := 'select min(articulo) as MinArt from art_articulos where empresa = ?empresa and ubicable = 1';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     MinArticulo := FieldByName['MINART'].AsString;

     FreeHandle;
  end;
  FreeAndNil(QGen);
end;

procedure TDMLstMovEntreUbicaciones.MostrarListado(ArticD, ArticH: string; fecha_d, fecha_h: TDateTime; modo: integer);
var
  str : string;
  FechaDesde, FechaHasta : TDateTime;
begin
  DMListados.Normalizar_desde_Hasta(ArticD, ArticH);
  DMListados.Normalizar_Desde_Hasta(Fecha_d, Fecha_H);
  FechaDesde := HourIntoDate(Fecha_d, '00:00:00');
  FechaHasta := HourIntoDate(Fecha_h, '23:59:59');

  with xMovEntreUbic do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTD'].AsString := ArticD;
     Params.ByName['ARTH'].AsString := ArticH;
     Params.ByName['FECHAD'].AsDateTime := FechaDesde;
     Params.ByName['FECHAH'].AsDateTime := FechaHasta;
     Open;
  end;

  DMListados.Cargar(195, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frMovEntreUbic.LoadFromFIB(REntorno.Formato, str);
     frMovEntreUbic.PrepareReport;
     case Modo of
        0: frMovEntreUbic.ShowPreparedReport;
        1: frMovEntreUbic.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxMovEntreUbic.LoadFromFIB(REntorno.Formato, str);
     frxMovEntreUbic.PrepareReport;
     case Modo of
        0: frxMovEntreUbic.ShowPreparedReport;
        1: frxMovEntreUbic.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstMovEntreUbicaciones.frMovEntreUbicGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstMovEntreUbicaciones.frMovEntreUbicEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstMovEntreUbicaciones.frxMovEntreUbicBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstMovEntreUbicaciones.frxMovEntreUbicGetValue(const VarName: string; var Value: variant);
begin
  frMovEntreUbicGetValue(VarName, Value);
end;

end.
