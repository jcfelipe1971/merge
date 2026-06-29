unit UDMLstEntreFechasCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMLstEntreFechasCli = class(TDataModule)
     SPMinMaxFechaCliente: THYFIBQuery;
     TLocal: THYTransaction;
     procedure DMLstEntrefechasCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Rangos(var min_cliente: integer; var max_cliente: integer; var min_fecha: TDateTime; var max_fecha: TDateTime; tipo, serie: string);
  end;

var
  DMLstEntreFechasCli : TDMLstEntreFechasCli;

implementation

uses UDMMain, UEntorno, UDMListados;

{$R *.DFM}

procedure TDMLstEntrefechasCli.DMLstEntrefechasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstEntrefechasCli.Rangos(var min_cliente: integer; var max_cliente: integer; var min_fecha: TDateTime; var max_fecha: TDateTime; tipo, serie: string);
begin
  with SPMinMaxFechaCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['TIPO'].AsString := tipo;
     ExecQuery;

     min_fecha := FieldByName['MINIMO_FECHA'].AsDateTime;
     if min_fecha = 0 then
        min_fecha := Date;

     max_fecha := FieldByName['MAXIMO_FECHA'].AsDateTime;
     if max_fecha = 0 then
        max_fecha := Date;

     min_cliente := FieldByName['MINIMO_CLIENTE'].AsInteger;
     max_cliente := FieldByName['MAXIMO_CLIENTE'].AsInteger;
     FreeHandle;
  end;
end;

end.
