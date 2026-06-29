unit UDMRectificacionAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados, FIBDataSetRO, HYFIBQuery;

type
  TDMRectificacionAsientos = class(TDataModule)
     DSxRectificacion_Tabla: TDataSource;
     TLocal: THYTransaction;
     xRectificacion_Tabla: TFIBDataSetRO;
     xRectificacion_TablaASIENTO: TIntegerField;
     xRectificacion_TablaRIC: TIntegerField;
     xRectificacion_TablaFECHA: TDateTimeField;
     xRectificacion_TablaTITULO: TFIBStringField;
     xRectificacion_TablaTIPO: TFIBStringField;
     xRectificacion_TablaDEBE: TFloatField;
     xRectificacion_TablaHABER: TFloatField;
     xRectificacion_TablaCANAL_R: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RectificaAsientosNegativos(canal: integer);
     procedure RefrescarTabla(canal: integer);
     function HayDatos: boolean;
  end;

var
  DMRectificacionAsientos : TDMRectificacionAsientos;

implementation

uses UDMMain, UUtiles, UEntorno, UFParada;

{$R *.DFM}

procedure TDMRectificacionAsientos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xRectificacion_TablaFECHA.DisplayFormat := ShortDateFormat;
  xRectificacion_TablaDEBE.DisplayFormat := '#,0.00';
  xRectificacion_TablaHABER.DisplayFormat := '#,0.00';

  RefrescarTabla(REntorno.Canal);
end;

procedure TDMRectificacionAsientos.RectificaAsientosNegativos(canal: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_RECTIFICA_ASIENTOS_NEG_TODOS (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRectificacionAsientos.RefrescarTabla(canal: integer);
begin
  with xRectificacion_Tabla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Open;
  end;
end;

function TDMRectificacionAsientos.HayDatos: boolean;
begin
  Result := (xRectificacion_Tabla.FieldByName('RIC').AsInteger <> 0);
end;

end.
