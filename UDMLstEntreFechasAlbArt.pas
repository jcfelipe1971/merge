unit UDMLstEntrefechasAlbArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMLstEntrefechasAlbArt = class(TDataModule)
     xArt_Desde: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     SPMinMaxFechaArticulo: THYFIBQuery;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Hasta: TDataSource;
     xEstados: TFIBDataSetRO;
     DSxEstados: TDataSource;
     TLocal: THYTransaction;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     procedure ZDMLstEntrefechasCreate(Sender: TObject);
  private
     { Private declarations }
  public
     procedure Rangos(var min_articulo: string; var max_articulo: string; var min_fecha: TDateTime; var max_fecha: TDateTime; tipo, serie, almacen: string);
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMLstEntrefechasAlbArt : TDMLstEntrefechasAlbArt;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMLstEntrefechasAlbArt.ZDMLstEntrefechasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstEntrefechasAlbArt.Rangos(var min_articulo: string; var max_articulo: string; var min_fecha: TDateTime; var max_fecha: TDateTime; tipo, serie, almacen: string);
begin
  with SPMinMaxFechaArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['ALMACEN'].AsString := Almacen;
     ExecQuery;
     min_fecha := FieldByName['MINIMO_FECHA'].AsDateTime;
     if min_fecha = 0 then
        min_fecha := Date;
     max_fecha := FieldByName['MAXIMO_FECHA'].AsDateTime;
     if max_fecha = 0 then
        max_fecha := Date;
     min_articulo := FieldByName['MINIMO_ARTICULO'].AsString;
     max_articulo := FieldByName['MAXIMO_ARTICULO'].AsString;
     FreeHandle;
  end;

  CambiaMoneda(REntorno.Moneda);
end;

procedure TDMLstEntrefechasAlbArt.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

end.
