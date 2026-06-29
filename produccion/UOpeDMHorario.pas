unit UOpeDMHorario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TOpeDMHorario = class(TDataModule)
     QMHorario: TFIBTableSet;
     DSQMHorario: TDataSource;
     TLocal: THYTransaction;
     QMHorarioEMPRESA: TIntegerField;
     QMHorarioHORARIO: TFIBStringField;
     QMHorarioDESCRIPCION: TFIBStringField;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleHORARIO: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleHORA_FIN: TFloatField;
     QMDetalleHORA_PRODUCTIVA: TIntegerField;
     QLinea: THYFIBQuery;
     QMDetalleHORA_INI: TFloatField;
     xTotalHoras: TFIBDataSetRO;
     DSxTotalHoras: TDataSource;
     xTotalHorasHORAS_PROD: TFloatField;
     xTotalHorasHORAS_NO_PROD: TFloatField;
     xTotalHorasHORAS_LAB: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMHorarioNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMHorarioAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
  private
     { Private declarations }
     procedure RecalcularTotalHoras;
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  OpeDMHorario : TOpeDMHorario;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TOpeDMHorario.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMHorario, '10000');

  xTotalHorasHORAS_PROD.DisplayFormat := MascaraN;
  xTotalHorasHORAS_NO_PROD.DisplayFormat := MascaraN;
  xTotalHorasHORAS_LAB.DisplayFormat := MascaraN;
end;

procedure TOpeDMHorario.QMHorarioNewRecord(DataSet: TDataSet);
begin
  QMHorarioEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TOpeDMHorario.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if (QMHorario.State = dsInsert) then
  begin
     QMHorario.Post;
  end;

  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleHORARIO.AsString := QMHorarioHORARIO.AsString;

  // Busco el número de línia corresponent, que serà el següent
  with QLinea do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
     Params.ByName['HORARIO'].AsString := QMHorarioHORARIO.AsString;
     ExecQuery;
  end;
  QMDetalleLINEA.AsInteger := QLinea.FieldByName['NLINEA'].AsInteger + 1;
end;

procedure TOpeDMHorario.QMHorarioAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;

  RecalcularTotalHoras;
end;

procedure TOpeDMHorario.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMHorario, '00000');
end;

procedure TOpeDMHorario.QMDetalleAfterPost(DataSet: TDataSet);
begin
  RecalcularTotalHoras;
end;

procedure TOpeDMHorario.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  RecalcularTotalHoras;
end;

procedure TOpeDMHorario.RecalcularTotalHoras;
begin
  xTotalHoras.Close;
  xTotalHoras.Open;
end;

end.
