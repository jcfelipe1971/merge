unit UDMComprasProv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDataSetRO, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery;

type
  TDMComprasProv = class(TDataModule)
     TLocal: THYTransaction;
     xComprasProveedor: TFIBDataSetRO;
     DSxComprasProveedor: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     SPTotal: THYFIBQuery;
     SPComprasProv: THYFIBQuery;
     xComprasProveedorARTICULO: TFIBStringField;
     xComprasProveedorTITULO: TFIBStringField;
     xComprasProveedorUNIDADES: TFloatField;
     xComprasProveedorCOSTE: TFloatField;
     xComprasProveedorENTRADA: TIntegerField;
     procedure DMComprasProvCreate(Sender: TObject);
  private
     { Private declarations }
     Prov: integer;
     LocalMascaraL: string;
  public
     { Public declarations }
     LocalMascaraN: string;
     procedure ActualizaTabla(Proveedor, Modo: integer; var Total: double; MonedaAMostrar: string);
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMComprasProv : TDMComprasProv;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMComprasProv.DMComprasProvCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);

  xComprasProveedorCOSTE.DisplayFormat := LocalMascaraL;
  xComprasProveedorUNIDADES.DisplayFormat := MascaraI;
end;

procedure TDMComprasProv.ActualizaTabla(Proveedor, Modo: integer; var Total: double; MonedaAMostrar: string);
begin
  Prov := proveedor;
  with SPComprasProv do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['BORRAR'].AsInteger := 1;
     Params.ByName['MODO'].AsInteger := Modo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['MONEDA'].AsString := MonedaAMostrar;
     ExecQuery;
     FreeHandle;
  end;
  with xComprasProveedor do
  begin
     Close;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     Open;
  end;
  with SpTotal do
  begin
     Close;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     ExecQuery;
     Total := FieldByName['TOTAL'].AsDouble;
     FreeHandle;
  end;
end;

procedure TDMComprasProv.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;

  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  xComprasProveedorCOSTE.DisplayFormat := LocalMascaraL;
end;

end.
