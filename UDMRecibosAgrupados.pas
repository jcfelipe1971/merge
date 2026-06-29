unit UDMRecibosAgrupados;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMRecibosAgrupados = class(TDataModule)
     TLocal: THYTransaction;
     xAgrupados: TFIBDataSetRO;
     DSxAgrupados: TDataSource;
     xAgrupadosEMPRESA: TIntegerField;
     xAgrupadosEJERCICIO: TIntegerField;
     xAgrupadosCANAL: TIntegerField;
     xAgrupadosSIGNO: TFIBStringField;
     xAgrupadosREGISTRO: TIntegerField;
     xAgrupadosREGISTRO_REC: TIntegerField;
     xAgrupadosLINEA_REC: TIntegerField;
     xAgrupadosVENCIMIENTO: TDateTimeField;
     xAgrupadosLIQUIDO: TFloatField;
     xAgrupadosDOC_NUMERO: TIntegerField;
     xAgrupadosDOC_SERIE: TFIBStringField;
     xAgrupadosDOC_FECHA: TDateTimeField;
     xAgrupadosDOC_TIPO: TFIBStringField;
     xAgrupadosEJERCICIO_REC: TIntegerField;
     xAgrupadosliquido_moneda: TFloatField;
     xAgrupadosMONEDA: TFIBStringField;
     xAgrupadosSIGNO_REC: TFIBStringField;
     xAgrupadosLIQUIDO_DET: TFloatField;
     procedure DMRecibosAgrupadosCreate(Sender: TObject);
     procedure xAgrupadosliquido_monedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure mostrar(Empresa, Ejercicio_rec, Canal, Registro, Ejercicio: integer; Signo: string);
     function HayDatos: boolean;
  end;

var
  DMRecibosAgrupados : TDMRecibosAgrupados;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMRecibosAgrupados.DMRecibosAgrupadosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xAgrupadosLIQUIDO.DisplayFormat := MascaraN;
  xAgrupadosLIQUIDO_DET.DisplayFormat := MascaraN;
  xAgrupadosLIQUIDO_MONEDA.DisplayFormat := MascaraN;
  xAgrupadosDOC_FECHA.DisplayFormat := ShortDateFormat;
  xAgrupadosVENCIMIENTO.DisplayFormat := ShortDateFormat;
end;

procedure TDMRecibosAgrupados.Mostrar(Empresa, Ejercicio_rec, Canal, Registro, Ejercicio: integer; Signo: string);
begin
  with xAgrupados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO_REC'].AsInteger := Ejercicio_rec;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['REGISTRO'].AsInteger := Registro;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Open;
  end;
end;

procedure TDMRecibosAgrupados.xAgrupadosliquido_monedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(xAgrupadosMONEDA.AsString, 1),
     xAgrupadosLIQUIDO_DET.AsFloat);
end;

function TDMRecibosAgrupados.HayDatos: boolean;
begin
  Result := not (xAgrupados.RecordCount = 0);
end;

end.
