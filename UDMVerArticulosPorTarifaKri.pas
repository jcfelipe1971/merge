unit UDMVerArticulosPorTarifaKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMVerArticulosPorTarifaKri = class(TDataModule)
     TLocal: THYTransaction;
     xVerArticulosPorTarifa: TFIBDataSetRO;
     DSxVerArticulosPorTarifa: TDataSource;
     xVerArticulosPorTarifaEMPRESA: TIntegerField;
     xVerArticulosPorTarifaEJERCICIO: TIntegerField;
     xVerArticulosPorTarifaCANAL: TIntegerField;
     xVerArticulosPorTarifaPROVEEDOR: TIntegerField;
     xVerArticulosPorTarifaARTICULO: TFIBStringField;
     xVerArticulosPorTarifaTARIFA: TFIBStringField;
     xVerArticulosPorTarifaTITULO_TARIFA: TFIBStringField;
     xVerArticulosPorTarifaFECHA_INICIO: TDateTimeField;
     xVerArticulosPorTarifaFECHA_FINAL: TDateTimeField;
     xVerArticulosPorTarifaDESCUENTO1: TFloatField;
     xVerArticulosPorTarifaDESCUENTO2: TFloatField;
     xVerArticulosPorTarifaDESCUENTO3: TFloatField;
     xVerArticulosPorTarifaMONEDA: TFIBStringField;
     xVerArticulosPorTarifaP_COSTE: TFloatField;
     xVerArticulosPorTarifaARTICULO_PROVEEDOR: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Articulo: string);
  end;

var
  DMVerArticulosPorTarifaKri : TDMVerArticulosPorTarifaKri;

implementation

uses UEntorno;

{$R *.dfm}

procedure TDMVerArticulosPorTarifaKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  xVerArticulosPorTarifaP_COSTE.DisplayFormat := MascaraE;
  xVerArticulosPorTarifaDESCUENTO1.DisplayFormat := MascaraP;
  xVerArticulosPorTarifaDESCUENTO2.DisplayFormat := MascaraP;
  xVerArticulosPorTarifaDESCUENTO3.DisplayFormat := MascaraP;
  xVerArticulosPorTarifaFECHA_INICIO.DisplayFormat := ShortDateFormat;
  xVerArticulosPorTarifaFECHA_FINAL.DisplayFormat := ShortDateFormat;
end;

procedure TDMVerArticulosPorTarifaKri.Inicializa(Articulo: string);
begin
  with xVerArticulosPorTarifa do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMVerArticulosPorTarifaKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

end.
