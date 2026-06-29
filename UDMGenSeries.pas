unit UDMGenSeries;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMGenSeries = class(TDataModule)
     TLocal: THYTransaction;
     QMGenSeries: TFIBTableSet;
     DSQMGenSeries: TDataSource;
     xProvincia: TFIBDataSetRO;
     DSxPronvicia: TDataSource;
     QMGenSeriesEMPRESA: TIntegerField;
     QMGenSeriesSERIE: TFIBStringField;
     QMGenSeriesACTIVO: TIntegerField;
     QMGenSeriesTITULO: TFIBStringField;
     QMGenSeriesPROVINCIA: TFIBStringField;
     QMGenSeriesRECT: TIntegerField;
     TUpdate: THYTransaction;
     QMGenSeriesSFV_AUTORIZACION: TFIBStringField;
     QMGenSeriesZ_TIPO_NCF: TIntegerField;
     QMGenSeriesEMITIDA_POR_TERCEROS: TIntegerField;
     QMGenSeriesPREFIJO_FAC_TERCERO: TFIBStringField;
     procedure DMGenSeriesCreate(Sender: TObject);
     procedure QMGenSeriesPROVINCIAChange(Sender: TField);
     procedure QMGenSeriesAfterOpen(DataSet: TDataSet);
     procedure QMGenSeriesBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ActivarSerie(Accion: smallint);
  end;

var
  DMGenSeries : TDMGenSeries;

implementation

uses UDMMain;

{$R *.DFM}

procedure TDMGenSeries.DMGenSeriesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMGenSeries, '10000', True);
end;

procedure TDMGenSeries.ActivarSerie(Accion: smallint);
begin
  with QMGenSeries do
  begin
     Edit;
     QMGenSeriesACTIVO.AsInteger := Accion;
     Post;
     Refresh;
  end;
end;

procedure TDMGenSeries.QMGenSeriesPROVINCIAChange(Sender: TField);
begin
  xProvincia.Close;
  xProvincia.Open;
end;

procedure TDMGenSeries.QMGenSeriesAfterOpen(DataSet: TDataSet);
begin
  xProvincia.Open;
end;

procedure TDMGenSeries.QMGenSeriesBeforeClose(DataSet: TDataSet);
begin
  xProvincia.Close;
end;

end.
