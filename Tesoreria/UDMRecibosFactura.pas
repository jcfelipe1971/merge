unit UDMRecibosFactura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBDataSetRW, FIBQuery, HYFIBQuery;

type
  TDMRecibosFactura = class(TDataModule)
     TLocal: THYTransaction;
     DSxRecibos: TDataSource;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     xSeriesEMPRESA: TIntegerField;
     xSeriesEJERCICIO: TIntegerField;
     xSeriesCANAL: TIntegerField;
     xSeriesSERIE: TFIBStringField;
     xSeriesTITULO: TFIBStringField;
     xRecibos: TFIBDataSetRO;
     xRecibosREGISTRO: TIntegerField;
     xRecibosLINEA: TIntegerField;
     xRecibosVENCIMIENTO: TDateTimeField;
     xRecibosLIQUIDO: TFloatField;
     xRecibosPAGADO: TIntegerField;
     xRecibosIMPAGADO: TIntegerField;
     xRecibosVISIBLE: TIntegerField;
     xRecibosMONEDA: TFIBStringField;
     xRecibosEJERCICIO_C: TIntegerField;
     xRecibosID_CARTERA_DET: TIntegerField;
     TUpdate: THYTransaction;
     xRecibosSIGNO: TFIBStringField;
     xTotales: TFIBDataSetRO;
     DSxTotales: TDataSource;
     xTotalesTOTAL: TFloatField;
     xRecibosTEXTO: TFIBStringField;
     procedure DMRecibosFacturaCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     LocalMascaraN: string;
     procedure Mostrar(Serie, Tipo: string; Rig, Ejercicio: integer);
     procedure CambiaSerie(Serie: string; ejercicio: integer);
     function DatosCartera(var Signo: string; var Ejercicio, Registro: integer): boolean;
     procedure Refresca;
  end;

var
  DMRecibosFactura : TDMRecibosFactura;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMRecibosFactura.DMRecibosFacturaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xRecibosLIQUIDO.DisplayFormat := MascaraN;
  xRecibosVENCIMIENTO.DisplayFormat := ShortDateFormat;
  xTotalesTOTAL.DisplayFormat := MascaraN;
end;

procedure TDMRecibosFactura.Mostrar(Serie, Tipo: string; Rig, Ejercicio: integer);
var
  Moneda : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        AutoTrans := True;
        SQL.Text := 'DELETE FROM TMP_RECIBOS_FACTURA WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
        Close;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_BUSCA_FACTURA_CREA (?EMPRESA, ?EJERCICIO, ?CANAL,?SERIE, ?TIPO, ?RIG, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := Rig;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Moneda := FieldByName['MONEDA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  xRecibosLIQUIDO.DisplayFormat := LocalMascaraN;
  xTotalesTOTAL.DisplayFormat := MascaraN;

  with xRecibos do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xTotales do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMRecibosFactura.CambiaSerie(Serie: string; Ejercicio: integer);
begin
  with xSeries do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

function TDMRecibosFactura.DatosCartera(var Signo: string; var Ejercicio, Registro: integer): boolean;
begin
  Signo := xRecibosSIGNO.AsString;
  Registro := xRecibosREGISTRO.AsInteger;
  Ejercicio := xRecibosEJERCICIO_C.AsInteger;
  Result := (xRecibos.RecordCount > 0);
end;

procedure TDMRecibosFactura.Refresca;
begin
  xRecibos.Close;
  xRecibos.Open;

  xTotales.Close;
  xTotales.Open;
end;

end.
