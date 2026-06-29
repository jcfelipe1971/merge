unit UDMLstClientesArt;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Forms, SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDataSet;

type
  TDMLstClientesArt = class(TDataModule)
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
     xLstClientesArt: TFIBDataSetRO;
     DSxLstClientesArt: TDataSource;
     frClientesArt: TfrHYReport;
     frDBDSLstClientesArt: TfrDBDataSet;
     QMinCliente: THYFIBQuery;
     QMaxCliente: THYFIBQuery;
     xClienteD: TFIBDataSetRO;
     DSxClienteD: TDataSource;
     xClienteH: TFIBDataSetRO;
     DSxClienteH: TDataSource;
     xLstClientesArtCLIENTE: TIntegerField;
     xLstClientesArtNOMBRE_CLIENTE: TFIBStringField;
     xLstClientesArtARTICULO: TFIBStringField;
     xLstClientesArtTITULO: TFIBStringField;
     xLstClientesArtSUMA_UD: TFloatField;
     xLstClientesArtSUMA_UE: TFloatField;
     xLstClientesArtCOSTES: TFloatField;
     xLstClientesArtVENTAS: TFloatField;
     xLstClientesArtMARGEN: TFloatField;
     xLstClientesArtPORCENTAJE: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frClientesArtGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     function RellenaCanales: TStringList;
     function RellenaSeries: TStringList;
     function FechaEjercicio: TDateTime;
     procedure Muestra(Modo: smallint; fecha1, fecha2: TDateTime; ArticuloD, ArticuloH: string; ClienteD, ClienteH: integer; Alcance, Canal: integer; Serie: string);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameClienteMin: string;
     function DameClienteMax: string;
     procedure CambiaArticuloD(Articulo: string);
     procedure CambiaArticuloH(Articulo: string);
     procedure CambiaClienteD(Cliente: integer);
     procedure CambiaClienteH(Cliente: integer);
  end;

var
  DMLstClientesArt : TDMLstClientesArt;

implementation

uses UEntorno, UDMListados, UFormGest, UUtiles, UDMMain, UFPregLstClientesArt;

{$R *.dfm}

procedure TDMLstClientesArt.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMlistados, DMListados);
end;

procedure TDMLstClientesArt.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

function TDMLstClientesArt.RellenaCanales: TStringList;
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

function TDMLstClientesArt.RellenaSeries: TStringList;
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

function TDMLstClientesArt.FechaEjercicio: TDateTime;
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

function TDMLstClientesArt.DameArticuloMin: string;
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMLstClientesArt.DameArticuloMax: string;
begin
  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMLstClientesArt.DameClienteMin: string;
begin
  with QMinCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := IntToStr(FieldByName['MINIMO'].AsInteger);
  end;
end;

function TDMLstClientesArt.DameClienteMax: string;
begin
  with QMaxCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := IntToStr(FieldByName['MAXIMO'].AsInteger);
  end;
end;

procedure TDMLstClientesArt.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstClientesArt.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLstClientesArt.CambiaClienteD(Cliente: integer);
begin
  with xClienteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMLstClientesArt.CambiaClienteH(Cliente: integer);
begin
  with xClienteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMLstClientesArt.Muestra(Modo: smallint; fecha1, fecha2: TDateTime; ArticuloD, ArticuloH: string; ClienteD, ClienteH: integer; Alcance, Canal: integer; Serie: string);
var
  str : string;
begin
  DMListados.Normalizar_Desde_Hasta(Fecha1, Fecha2);
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(ClienteD, ClienteH);

  with xLstClientesArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['ARTICULO_D'].AsString := ArticuloD;
     Params.ByName['ARTICULO_H'].AsString := ArticuloH;
     Params.ByName['CLIENTE_D'].AsInteger := ClienteD;
     Params.ByName['CLIENTE_H'].AsInteger := ClienteH;
     Params.ByName['FECHA_D'].AsDateTime := HourIntoDate(Fecha1, '00:00:00');
     Params.ByName['FECHA_H'].AsDateTime := HourIntoDate(Fecha2, '23:59:59');
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Params.ByName['CANALCAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  DMListados.Cargar(153, '');
  frClientesArt.LoadFromFIB(REntorno.Formato, str);
  frClientesArt.PrepareReport;
  case Modo of
     0: frClientesArt.ShowPreparedReport;
     1: frClientesArt.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstClientesArt.frClientesArtGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'FechaListado' then
     ParValue := REntorno.FechaTrabSH;

  if ParName = 'FechaDesde' then
     ParValue := StrToDate(DateToStr(FPregLstClientesArt.DTPFechaD.Date));

  if ParName = 'FechaHasta' then
     ParValue := StrToDate(DateToStr(FPregLstClientesArt.DTPFechaH.Date));

  if ParName = 'ClienteDesde' then
     ParValue := FPregLstClientesArt.EFClienteD.Text;

  if ParName = 'ClienteHasta' then
     ParValue := FPregLstClientesArt.EFClienteH.Text;

  if ParName = 'ArticuloDesde' then
     ParValue := FPregLstClientesArt.EFArticuloD.Text;

  if ParName = 'ArticuloHasta' then
     ParValue := FPregLstClientesArt.EFArticuloH.Text;

  if ParName = 'Comentario' then
     ParValue := FPregLstClientesArt.EComentario.Text;
end;

end.
