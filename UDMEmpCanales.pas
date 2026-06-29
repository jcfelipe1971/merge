unit UDMEmpCanales;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMEmpCanales = class(TDataModule)
     TLocal: THYTransaction;
     QMEmpCanales: TFIBTableSet;
     DSQMEmpCanales: TDataSource;
     QMEmpCanalesEMPRESA: TIntegerField;
     QMEmpCanalesEJERCICIO: TIntegerField;
     QMEmpCanalesCANAL: TIntegerField;
     QMEmpCanalesATO_APERTURA: TIntegerField;
     QMEmpCanalesATO_CIERRE: TIntegerField;
     QMEmpCanalesACTIVO: TIntegerField;
     QMEmpCanalesAPERTURA: TDateTimeField;
     QMEmpCanalesCIERRE: TDateTimeField;
     QMEmpCanalesLIMITE: TDateTimeField;
     QMEmpCanalesNIVELES: TIntegerField;
     QMEmpCanalesACTIVACION: TDateTimeField;
     QMEmpCanalesPAIS: TFIBStringField;
     QMEmpCanalesTIPO_IVA: TIntegerField;
     QMEmpCanalesMODO_IVA: TIntegerField;
     QMEmpCanalesMONEDA: TFIBStringField;
     QMEmpCanalesATO_REGULARIZACION: TIntegerField;
     QMEmpCanalesPERFIL: TFIBStringField;
     xTipoIVA: TFIBDataSetRO;
     DSxTipoIVA: TDataSource;
     QMEmpCanalesLIQUIDAR_IVA_MODELO_300: TIntegerField;
     QMEmpCanalesCIERRE_PERIODO: TDateTimeField;
     QMEmpCanalesPGC: TIntegerField;
     xPGC: TFIBDataSetRO;
     DSxPGC: TDataSource;
     xPGCTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     QMEmpCanalesULTIMO_REGISTRO_REPERCUTIDO: TIntegerField;
     QMEmpCanalesULTIMO_PERIODO_SOPORTADO: TFIBStringField;
     QMEmpCanalesULTIMO_REGISTRO_SOPORTADO: TIntegerField;
     QMEmpCanalesULTIMO_PERIODO_REPERCUTIDO: TFIBStringField;
     QMEmpCanalesCIERRE_FACTURACION_VENTAS: TDateTimeField;
     QMEmpCanalesCIERRE_FACTURACION_COMPRAS: TDateTimeField;
     procedure DMEmpCanalesCreate(Sender: TObject);
     procedure QMEmpCanalesAfterOpen(DataSet: TDataSet);
     procedure QMEmpCanalesTIPO_IVAChange(Sender: TField);
     procedure QMEmpCanalesPGCChange(Sender: TField);
     procedure QMEmpCanalesCIERRE_PERIODOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RevisaAsientos;
  end;

var
  DMEmpCanales : TDMEmpCanales;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMEmpCanales.DMEmpCanalesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  with QMEmpCanales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
     First;
     while ((not (EOF)) and
           ((QMEmpCanalesEJERCICIO.AsInteger <> REntorno.Ejercicio) or (QMEmpCanalesCANAL.AsInteger <> REntorno.Canal))) do
        Next;
  end;
end;

procedure TDMEmpCanales.QMEmpCanalesAfterOpen(DataSet: TDataSet);
begin
  xTipoIVA.Open;
  xPGC.Open;
end;

procedure TDMEmpCanales.QMEmpCanalesTIPO_IVAChange(Sender: TField);
begin
  xTipoIVA.Close;
  xTipoIVA.Open;
end;

procedure TDMEmpCanales.RevisaAsientos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_ASIENTOS_REVISA_ANUALES (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := QMEmpCanalesEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMEmpCanalesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMEmpCanalesCANAL.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMEmpCanales.Refresh;
end;

procedure TDMEmpCanales.QMEmpCanalesPGCChange(Sender: TField);
begin
  xPGC.Close;
  xPGC.Open;
end;

procedure TDMEmpCanales.QMEmpCanalesCIERRE_PERIODOChange(Sender: TField);
begin
  if (QMEmpCanalesCIERRE_PERIODO.AsDateTime > QMEmpCanalesCIERRE_FACTURACION_COMPRAS.AsDateTime) then
     QMEmpCanalesCIERRE_FACTURACION_COMPRAS.AsDateTime := QMEmpCanalesCIERRE_PERIODO.AsDateTime;

  if (QMEmpCanalesCIERRE_PERIODO.AsDateTime > QMEmpCanalesCIERRE_FACTURACION_VENTAS.AsDateTime) then
     QMEmpCanalesCIERRE_FACTURACION_VENTAS.AsDateTime := QMEmpCanalesCIERRE_PERIODO.AsDateTime;
end;

end.
