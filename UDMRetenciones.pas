unit UDMRetenciones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, HYFIBQuery;

type
  TDMRetenciones = class(TDataModule)
     QMRetenciones: TFIBTableSet;
     DSQMRetenciones: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMRetencionesID_CARTERA_DETALLE: TIntegerField;
     QMRetencionesIMPORTE_RETENCION: TFloatField;
     QMRetencionesIMPORTE_ISR: TFloatField;
     QMRetencionesTIPO_RETENCION: TIntegerField;
     QMRetencionesEMPRESA: TIntegerField;
     QMRetencionesEJERCICIO: TIntegerField;
     QMRetencionesCANAL: TIntegerField;
     QMRetencionesRIC: TIntegerField;
     QMRetencionesCUENTA_ITBIS: TFIBStringField;
     QMRetencionesCUENTA_ISR: TFIBStringField;
     QMRetencionesBASE: TFloatField;
     QMRetencionesLIQUIDO: TFloatField;
     QMRetencionesRESTO: TFloatField;
     procedure QMRetencionesNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(id_cartera_detalle: integer);
  end;

var
  DMRetenciones : TDMRetenciones;

implementation

uses UDMMain, UEntorno, UUtiles, SysUtils;

{$R *.DFM}

procedure TDMRetenciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMRetenciones.Muestra(id_cartera_detalle: integer);
begin
  AsignaDisplayFormat(QMRetenciones, MascaraN, MascaraI, ShortDateFormat);

  with QMRetenciones do
  begin
     Close;
     Params.ByName['ID_CARTERA_DETALLE'].AsInteger := id_cartera_detalle;
     Open;
  end;
end;

procedure TDMRetenciones.QMRetencionesNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

end.
