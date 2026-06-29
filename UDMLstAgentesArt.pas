unit UDMLstAgentesArt;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Forms, SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDataSet;

type
  TDMLstEstadisticasVentas = class(TDataModule)
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
     xLstAgentesArt: TFIBDataSetRO;
     DSxLstAgentesArt: TDataSource;
     frAgentesArt: TfrHYReport;
     frDBDSLstAgentesArt: TfrDBDataSet;
     QMinAgente: THYFIBQuery;
     QMaxAgente: THYFIBQuery;
     xAgenteD: TFIBDataSetRO;
     DSxAgenteD: TDataSource;
     xAgenteH: TFIBDataSetRO;
     DSxAgenteH: TDataSource;
     xLstAgentesArtAGENTE: TIntegerField;
     xLstAgentesArtNOMBRE_AGENTE: TFIBStringField;
     xLstAgentesArtARTICULO: TFIBStringField;
     xLstAgentesArtTITULO: TFIBStringField;
     xLstAgentesArtSUMA_UD: TFloatField;
     xLstAgentesArtSUMA_UE: TFloatField;
     xLstAgentesArtCOSTES: TFloatField;
     xLstAgentesArtVENTAS: TFloatField;
     xLstAgentesArtMARGEN: TFloatField;
     xLstAgentesArtPORCENTAJE: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frAgentesArtGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     function RellenaCanales: TStringList;
     function RellenaSeries: TStringList;
     function FechaEjercicio: TDateTime;
     procedure Muestra(Modo: smallint; fecha1, fecha2: TDateTime; ArticuloD, ArticuloH: string; AgenteD, AgenteH: integer; Alcance, Canal: integer; Serie: string);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameAgenteMin: string;
     function DameAgenteMax: string;
     procedure CambiaArticuloD(Articulo: string);
     procedure CambiaArticuloH(Articulo: string);
     procedure CambiaAgenteD(Agente: integer);
     procedure CambiaAgenteH(Agente: integer);
  end;

var
  DMLstEstadisticasVentas : TDMLstEstadisticasVentas;

implementation

uses UEntorno, UDMListados, UFormGest, UUtiles, UDMMain, UFPregLstAgentesArt;

{$R *.dfm}

procedure TDMLstEstadisticasVentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMlistados, DMListados);
end;

procedure TDMLstEstadisticasVentas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

function TDMLstEstadisticasVentas.RellenaCanales: TStringList;
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

function TDMLstEstadisticasVentas.RellenaSeries: TStringList;
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

function TDMLstEstadisticasVentas.FechaEjercicio: TDateTime;
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

function TDMLstEstadisticasVentas.DameArticuloMin: string;
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMLstEstadisticasVentas.DameArticuloMax: string;
begin
  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMLstEstadisticasVentas.DameAgenteMin: string;
begin
  with QMinAgente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := IntToStr(FieldByName['MINIMO'].AsInteger);
  end;
end;

function TDMLstEstadisticasVentas.DameAgenteMax: string;
begin
  with QMaxAgente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := IntToStr(FieldByName['MAXIMO'].AsInteger);
  end;
end;

procedure TDMLstEstadisticasVentas.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstEstadisticasVentas.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstEstadisticasVentas.CambiaAgenteD(Agente: integer);
begin
  with xAgenteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := Agente;
     Open;
  end;
end;

procedure TDMLstEstadisticasVentas.CambiaAgenteH(Agente: integer);
begin
  with xAgenteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := Agente;
     Open;
  end;
end;

procedure TDMLstEstadisticasVentas.Muestra(Modo: smallint; fecha1, fecha2: TDateTime; ArticuloD, ArticuloH: string; AgenteD, AgenteH: integer; Alcance, Canal: integer; Serie: string);
var
  str : string;
begin
  DMListados.Normalizar_Desde_Hasta(Fecha1, Fecha2);
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(AgenteD, AgenteH);

  with xLstAgentesArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['ARTICULO_D'].AsString := ArticuloD;
     Params.ByName['ARTICULO_H'].AsString := ArticuloH;
     Params.ByName['AGENTE_D'].AsInteger := AgenteD;
     Params.ByName['AGENTE_H'].AsInteger := AgenteH;
     Params.ByName['FECHA_D'].AsDateTime := HourIntoDate(Fecha1, '00:00:00');
     Params.ByName['FECHA_H'].AsDateTime := HourIntoDate(Fecha2, '23:59:59');
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Params.ByName['CANALCAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  DMListados.Cargar(152, '');
  frAgentesArt.LoadFromFIB(REntorno.Formato, str);
  frAgentesArt.PrepareReport;
  case Modo of
     0: frAgentesArt.ShowPreparedReport;
     1: frAgentesArt.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstEstadisticasVentas.frAgentesArtGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'FechaListado' then
     ParValue := REntorno.FechaTrabSH;

  if ParName = 'FechaDesde' then
     ParValue := StrToDate(DateToStr(FPregLstAgentesArt.DTPFechaD.Date));

  if ParName = 'FechaHasta' then
     ParValue := StrToDate(DateToStr(FPregLstAgentesArt.DTPFechaH.Date));

  if ParName = 'AgenteDesde' then
     ParValue := FPregLstAgentesArt.EFAgenteD.Text;

  if ParName = 'AgenteHasta' then
     ParValue := FPregLstAgentesArt.EFAgenteH.Text;

  if ParName = 'ArticuloDesde' then
     ParValue := FPregLstAgentesArt.EFArticuloD.Text;

  if ParName = 'ArticuloHasta' then
     ParValue := FPregLstAgentesArt.EFArticuloH.Text;

  if ParName = 'Comentario' then
     ParValue := FPregLstAgentesArt.EComentario.Text;
end;

end.
