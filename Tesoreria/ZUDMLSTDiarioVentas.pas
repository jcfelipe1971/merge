unit ZUDMLSTDiarioVentas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FR_Class, Fr_HYReport,
  FIBDataSetRO, FIBDatabase, UFIBModificados, FIBDataSet, Forms;

type
  TZDMLSTDiarioVentas = class(TDataModule)
     TLocal: THYTransaction;
     xLstDiarioVenta: TFIBDataSetRO;
     frDiarioVenta: TfrHYReport;
     DSxLstDiarioVenta: TDataSource;
     frDBLstDiarioVenta: TfrDBDataSet;
     xSerie: TFIBDataSetRO;
     xSerieTITULO: TFIBStringField;
     xLstDiarioVentaFAMILIA: TFIBStringField;
     xLstDiarioVentaARTICULO: TFIBStringField;
     xLstDiarioVentaTITULO: TFIBStringField;
     xLstDiarioVentaB_IMPONIBLE: TFloatField;
     xLstDiarioVentaC_IVA: TFloatField;
     xLstDiarioVentaLIQUIDO: TFloatField;
     xCaja: TFIBDataSetRO;
     xCajaFORMA: TFIBStringField;
     xCajaTITULO: TFIBStringField;
     xCajaLIQUIDO: TFloatField;
     DSxCaja: TDataSource;
     frDBLstCaja: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frDiarioVentaGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     FechaLst: TDateTime;
     SerieLst: string;
  public
     { Public declarations }
     procedure MostrarListado(Modo: word; Fecha: TDateTime; Serie: string);
  end;

var
  ZDMLSTDiarioVentas : TZDMLSTDiarioVentas;

implementation

uses UDMMain, UDMListados, UEntorno, UUtiles, UFormGest;

{$R *.dfm}

{Todo : Utilizar TLocal/TUpdate}

procedure TZDMLSTDiarioVentas.MostrarListado(Modo: word; Fecha: TDateTime; Serie: string);
var
  str : string;
  Fecha_Desde, Fecha_Hasta : TDateTime;
begin
  FechaLst := Fecha;
  SerieLst := Serie;

  Fecha_Desde := HourIntoDate(Fecha, '00:00:00');
  Fecha_Hasta := HourIntoDate(Fecha, '23:59:59');

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
     Params.ByName['FECHA_D'].AsDateTime := Fecha_Desde;
     Params.ByName['FECHA_H'].AsDateTime := Fecha_Hasta;
     Open;
  end;

  xLstDiarioVenta.Close;
  xLstDiarioVenta.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xLstDiarioVenta.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  xLstDiarioVenta.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  xLstDiarioVenta.Params.ByName['SERIE'].AsString := Serie;
  xLstDiarioVenta.Params.ByName['FECHA_D'].AsDateTime := Fecha_Desde;
  xLstDiarioVenta.Params.ByName['FECHA_H'].AsDateTime := Fecha_Hasta;
  xLstDiarioVenta.Open;

  DMListados.Cargar(9000, '');

  frDiarioVenta.LoadFromFIB(REntorno.Formato, str);
  frDiarioVenta.PrepareReport;
  case Modo of
     0: frDiarioVenta.ShowPreparedReport;
     1: frDiarioVenta.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TZDMLSTDiarioVentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLSTDiarioVentas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TZDMLSTDiarioVentas.frDiarioVentaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Fecha' then
     ParValue := FechaLst;
  if ParName = 'Serie' then
     ParValue := SerieLst;
end;

end.
