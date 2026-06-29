unit UDMAgrupacionesRecibos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMAgrupacionesRecibos = class(TDataModule)
     TLocal: THYTransaction;
     xAgrupados: TFIBDataSetRO;
     DSxAgrupados: TDataSource;
     xAgrupadosEJERCICIO: TIntegerField;
     xAgrupadosCANAL: TIntegerField;
     xAgrupadosSIGNO: TFIBStringField;
     xAgrupadosREGISTRO: TIntegerField;
     xAgrupadosLIQUIDO: TFloatField;
     xAgrupadosREGISTRO_REC: TIntegerField;
     xAgrupadosFECHA_REGISTRO: TDateTimeField;
     xAgrupadosLINEA: TIntegerField;
     xAgrupadosVENCIMIENTO: TDateTimeField;
     xAgrupadosMONEDA: TFIBStringField;
     xAgrupadosliquido_moneda: TFloatField;
     xAgrupadosLIQUIDO_CANAL: TFloatField;
     procedure DMRecibosAgrupadosCreate(Sender: TObject);
     procedure xAgrupadosliquido_monedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure mostrar(Empresa, Ejercicio, Canal, Registro: integer; Signo: string; EjercicioOrigen: integer);
     function HayDatos: boolean;
  end;

var
  DMAgrupacionesRecibos : TDMAgrupacionesRecibos;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMAgrupacionesRecibos.DMRecibosAgrupadosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  xAgrupadosLIQUIDO_CANAL.DisplayFormat := MascaraN;
  xAgrupadosFECHA_REGISTRO.DisplayFormat := ShortDateFormat;
  xAgrupadosLIQUIDO_CANAL.DisplayFormat := MascaraN;
  xAgrupadosLIQUIDO_MONEDA.DisplayFormat := MascaraN;
  xAgrupadosVENCIMIENTO.DisplayFormat := ShortDateFormat;
end;

procedure TDMAgrupacionesRecibos.mostrar(Empresa, Ejercicio, Canal, Registro: integer; Signo: string; EjercicioOrigen: integer);
begin
  with xAgrupados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['REGISTRO'].AsInteger := Registro;
     Params.ByName['EJERCICIO_ORIGEN'].AsInteger := EjercicioOrigen;
     Open;
  end;
end;

procedure TDMAgrupacionesRecibos.xAgrupadosliquido_monedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(xAgrupadosMONEDA.AsString, 1),
     xAgrupadosLIQUIDO.AsFloat);
end;

function TDMAgrupacionesRecibos.HayDatos: boolean;
begin
  Result := not (xAgrupados.RecordCount = 0);
end;

end.
