unit UDMLstEntrefechas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMLstEntrefechas = class(TDataModule)
     TLocal: THYTransaction;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     procedure DMLstEntrefechasCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Rangos(var MinProveedor: integer; var MaxProveedor: integer; var MinFecha: TDateTime; var MaxFecha: TDateTime; Tipo, Serie: string);
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMLstEntrefechas : TDMLstEntrefechas;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMLstEntrefechas.DMLstEntrefechasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstEntrefechas.Rangos(var MinProveedor: integer; var MaxProveedor: integer; var MinFecha: TDateTime; var MaxFecha: TDateTime; Tipo, Serie: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DAME_MIN_MAX_FECHA_PROVEEDOR(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;

        MinFecha := FieldByName['MINIMO_FECHA'].AsDateTime;
        if MinFecha = 0 then
           MinFecha := Date;

        MaxFecha := FieldByName['MAXIMO_FECHA'].AsDateTime;
        if MaxFecha = 0 then
           MaxFecha := Date;

        MinProveedor := FieldByName['MINIMO_PROVEEDOR'].AsInteger;
        MaxProveedor := FieldByName['MAXIMO_PROVEEDOR'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;

  CambiaMoneda(REntorno.Moneda);
end;

procedure TDMLstEntrefechas.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

end.
