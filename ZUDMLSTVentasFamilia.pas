unit ZUDMLSTVentasFamilia;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FR_Class, Fr_HYReport,
  FIBDataSetRO, FIBDatabase, UFIBModificados, FIBDataSet, Forms;

type
  TZDMLSTVentasFamilia = class(TDataModule)
     TLocal: THYTransaction;
     xLstDiarioVenta: TFIBDataSetRO;
     frDiarioVenta: TfrHYReport;
     DSxLstDiarioVenta: TDataSource;
     frDBLstDiarioVenta: TfrDBDataSet;
     xSerie: TFIBDataSetRO;
     xSerieTITULO: TFIBStringField;
     xCaja: TFIBDataSetRO;
     xCajaFORMA: TFIBStringField;
     xCajaTITULO: TFIBStringField;
     xCajaLIQUIDO: TFloatField;
     DSxCaja: TDataSource;
     frDBLstCaja: TfrDBDataSet;
     xLstDiarioVentaFAMILIA: TFIBStringField;
     xLstDiarioVentaTITULO: TFIBStringField;
     xLstDiarioVentaARTICULO: TFIBStringField;
     xLstDiarioVentaRIG: TIntegerField;
     xLstDiarioVentaFECHA: TDateTimeField;
     xLstDiarioVentaDESCRIPCION: TFIBStringField;
     xLstDiarioVentaUNIDADES: TFloatField;
     xLstDiarioVentaPRECIO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frDiarioVentaGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     FechaDesde: TDateTime;
     FechaHasta: TDateTime;
     Serie: string;
  public
     { Public declarations }
     procedure MostrarListado(Modo: word; aFechaDesde, aFechaHasta: TDateTime; aSerie: string);
  end;

var
  ZDMLSTVentasFamilia : TZDMLSTVentasFamilia;

implementation

uses UDMMain, UDMListados, UEntorno, UUtiles, UFormGest;

{$R *.dfm}

{Todo: Utilizar TLocal/TUpdate}

procedure TZDMLSTVentasFamilia.MostrarListado(Modo: word; aFechaDesde, aFechaHasta: TDateTime; aSerie: string);
var
  str : string;
begin
  Serie := aSerie;
  FechaDesde := aFechaDesde;
  FechaHasta := aFechaHasta;

  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');

  xSerie.Close;
  xSerie.Params.ByName['SERIE'].AsString := Serie;
  xSerie.Open;

  with xCaja do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_D'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_H'].AsDateTime := FechaHasta;
     Open;
  end;

  xLstDiarioVenta.Close;
  xLstDiarioVenta.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xLstDiarioVenta.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  xLstDiarioVenta.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  xLstDiarioVenta.Params.ByName['SERIE'].AsString := Serie;
  xLstDiarioVenta.Params.ByName['FECHA_D'].AsDateTime := FechaDesde;
  xLstDiarioVenta.Params.ByName['FECHA_H'].AsDateTime := FechaHasta;
  xLstDiarioVenta.Open;

  DMListados.Cargar(9001, '');

  frDiarioVenta.LoadFromFIB(REntorno.Formato, str);
  frDiarioVenta.PrepareReport;
  case Modo of
     0: frDiarioVenta.ShowPreparedReport;
     1: frDiarioVenta.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TZDMLSTVentasFamilia.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLSTVentasFamilia.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TZDMLSTVentasFamilia.frDiarioVentaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FechaDesde' then
     ParValue := FechaDesde;
  if ParName = 'FechaHasta' then
     ParValue := FechaHasta;
  if ParName = 'Serie' then
     ParValue := Serie;
end;

end.
