unit UDMLstProvArt;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Forms, SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDataSet;

type
  TDMLstProvArt = class(TDataModule)
     TLocal: THYTransaction;
     QMinArticulo: THYFIBQuery;
     QMaxArticulo: THYFIBQuery;
     xArticuloD: TFIBDataSetRO;
     DSxArticuloD: TDataSource;
     xArticuloH: TFIBDataSetRO;
     DSxArticuloH: TDataSource;
     xCanales: TFIBQuery;
     xSeries: TFIBQuery;
     QDameFecha: THYFIBQuery;
     xLstProvArt: TFIBDataSetRO;
     DSxLstProvArt: TDataSource;
     frProvArt: TfrHYReport;
     frDBDSLstProvArt: TfrDBDataSet;
     QMinProv: THYFIBQuery;
     QMaxProv: THYFIBQuery;
     xProvD: TFIBDataSetRO;
     DSxProvD: TDataSource;
     xProvH: TFIBDataSetRO;
     DSxProvH: TDataSource;
     xLstProvArtPROVEEDOR: TIntegerField;
     xLstProvArtNOMBRE_PROVEEDOR: TFIBStringField;
     xLstProvArtARTICULO: TFIBStringField;
     xLstProvArtTITULO: TFIBStringField;
     xLstProvArtSUMA_UD: TFloatField;
     xLstProvArtSUMA_UE: TFloatField;
     xLstProvArtVALOR: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frProvArtGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     function RellenaCanales: TStringList;
     function RellenaSeries: TStringList;
     function FechaEjercicio: TDateTime;
     procedure Muestra(Modo: smallint; fecha1, fecha2: TDateTime; ArticuloD, ArticuloH: string; ProvD, ProvH: integer; Alcance, Canal: integer; Serie: string);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameProvMin: string;
     function DameProvMax: string;
     procedure CambiaArticuloD(Articulo: string);
     procedure CambiaArticuloH(Articulo: string);
     procedure CambiaProvD(Proveedor: integer);
     procedure CambiaProvH(Proveedor: integer);
  end;

var
  DMLstProvArt : TDMLstProvArt;

implementation

uses UEntorno, UDMListados, UFormGest, UUtiles, UDMMain, UFPregLstProvArt;

{$R *.dfm}

procedure TDMLstProvArt.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMlistados, DMListados);
end;

procedure TDMLstProvArt.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

function TDMLstProvArt.RellenaCanales: TStringList;
var
  Canal : integer;
begin
  Result := TStringList.Create;
  Result.AddObject('Todos los Canales', Pointer(0));
  with xCanales do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        Canal := FieldByName['canal'].AsInteger;
        Result.AddObject('Canal ' + IntToStr(Canal), Pointer(Canal));
        Next;
     end;
     Close;
  end;
end;

function TDMLstProvArt.RellenaSeries: TStringList;
var
  Serie : string;
begin
  Result := TStringList.Create;
  Result.AddObject('Todas las Series', Pointer(0));
  with xSeries do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ExecQuery;
     while not EOF do
     begin
        Serie := FieldByName['serie'].AsString;
        Result.AddObject(Serie, Pointer(Serie));
        Next;
     end;
     Close;
  end;
end;

function TDMLstProvArt.FechaEjercicio: TDateTime;
var
  duracion : smallint;
  fecha : TDateTime;
begin
  with QDameFecha do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     duracion := FieldByName['DURACION'].AsInteger;
     fecha := FieldByName['APERTURA'].AsDateTime;

     if (duracion = 2) then
        Result := fecha
     else
        Result := EncodeDate(REntorno.Ejercicio, 01, 01);
  end;
end;

function TDMLstProvArt.DameArticuloMin: string;
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMLstProvArt.DameArticuloMax: string;
begin
  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMLstProvArt.DameProvMin: string;
begin
  with QMinProv do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := IntToStr(FieldByName['MINIMO'].AsInteger);
  end;
end;

function TDMLstProvArt.DameProvMax: string;
begin
  with QMaxProv do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := IntToStr(FieldByName['MAXIMO'].AsInteger);
  end;
end;

procedure TDMLstProvArt.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstProvArt.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstProvArt.CambiaProvD(Proveedor: integer);
begin
  with xProvD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Proveedor'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMLstProvArt.CambiaProvH(Proveedor: integer);
begin
  with xProvH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Proveedor'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMLstProvArt.Muestra(Modo: smallint; fecha1, fecha2: TDateTime; ArticuloD, ArticuloH: string; ProvD, ProvH: integer; Alcance, Canal: integer; Serie: string);
var
  str : string;
begin
  DMListados.Normalizar_Desde_Hasta(Fecha1, Fecha2);
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(ProvD, ProvH);

  with xLstProvArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['ARTICULO_D'].AsString := ArticuloD;
     Params.ByName['ARTICULO_H'].AsString := ArticuloH;
     Params.ByName['PROV_D'].AsInteger := ProvD;
     Params.ByName['PROV_H'].AsInteger := ProvH;
     Params.ByName['FECHA_D'].AsDateTime := HourIntoDate(Fecha1, '00:00:00');
     Params.ByName['FECHA_H'].AsDateTime := HourIntoDate(Fecha2, '23:59:59');
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Params.ByName['CANALCAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  DMListados.Cargar(154, '');
  frProvArt.LoadFromFIB(REntorno.Formato, str);
  frProvArt.PrepareReport;
  case Modo of
     0: frProvArt.ShowPreparedReport;
     1: frProvArt.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstProvArt.frProvArtGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'FechaListado' then
     ParValue := REntorno.FechaTrabSH;

  if ParName = 'FechaDesde' then
     ParValue := StrToDate(DateToStr(FPregLstProvArt.DTPFechaD.Date));

  if ParName = 'FechaHasta' then
     ParValue := StrToDate(DateToStr(FPregLstProvArt.DTPFechaH.Date));

  if ParName = 'ProvDesde' then
     ParValue := FPregLstProvArt.EFProvD.Text;

  if ParName = 'ProvHasta' then
     ParValue := FPregLstProvArt.EFProvH.Text;

  if ParName = 'ArticuloDesde' then
     ParValue := FPregLstProvArt.EFArticuloD.Text;

  if ParName = 'ArticuloHasta' then
     ParValue := FPregLstProvArt.EFArticuloH.Text;

  if ParName = 'Comentario' then
     ParValue := FPregLstProvArt.EComentario.Text;
end;

end.
