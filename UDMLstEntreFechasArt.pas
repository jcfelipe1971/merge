unit UDMLstEntreFechasArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMLstEntreFechasArt = class(TDataModule)
     xEstados: TFIBDataSetRO;
     DSxEstados: TDataSource;
     TLocal: THYTransaction;
     procedure DMLstEntrefechasCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Rangos(var min_articulo: string; var max_articulo: string; var min_fecha: TDateTime; var max_fecha: TDateTime; Tipo, Serie, Almacen: string);
  end;

var
  DMLstEntreFechasArt : TDMLstEntreFechasArt;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMLstEntreFechasArt.DMLstEntrefechasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstEntreFechasArt.Rangos(var min_articulo: string; var max_articulo: string; var min_fecha: TDateTime; var max_fecha: TDateTime; Tipo, Serie, Almacen: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DAME_MIN_MAX_FECHA_ARTICULO (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?ALMACEN)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ALMACEN'].AsString := Almacen;
        ExecQuery;
        min_articulo := FieldByName['MINIMO_ARTICULO'].AsString;
        max_articulo := FieldByName['MAXIMO_ARTICULO'].AsString;
        min_fecha := FieldByName['MINIMO_FECHA'].AsDateTime;
        max_fecha := FieldByName['MAXIMO_FECHA'].AsDateTime;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if min_fecha = 0 then
     min_fecha := Date;
  if max_fecha = 0 then
     max_fecha := Date;
end;

end.
