unit UDMPresenciaEdicionMarcajes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMPresenciaEdicionMarcajes = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMDetalle: TDataSource;
     QMDetalle: TFIBTableSet;
     QMDetalleID_OPE_PRESENCIA_MARCAJE: TIntegerField;
     QMDetalleFECHA_MARCAJE: TDateTimeField;
     QMDetalleIDENTIFICADOR_EMPLEADO: TFIBStringField;
     QMDetalleIDENTIFICADOR_DISPOSITIVO: TFIBStringField;
     QMDetalleIDENTIFICADOR_TIPO_MARCAJE: TFIBStringField;
     QMDetalleIDENTIFICADOR_INCIDENCIA: TFIBStringField;
     QMDetalleLATITUD: TFloatField;
     QMDetalleLONGITUD: TFloatField;
     QMDetalleID_EMPLEADO: TIntegerField;
     QMDetalleID_DISPOSITIVO: TIntegerField;
     QMDetalleTIPO_MARCAJE: TFIBStringField;
     QMDetalleID_INCIDENCIA: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleERROR_AL_PROCESAR: TFIBStringField;
     QMDetalleID_CAB_PRESENCIA: TIntegerField;
     QMDetalleID_DET_PRESENCIA: TIntegerField;
     QMDetalleENTRADA_AGRUPACION: TIntegerField;
     QMDetalleTITULO_INCIDENCIA: TFIBStringField;
     QMDetalleTITULO_EMPLEADO: TFIBStringField;
     QMDetalleTITULO_DISPOSITIVO: TFIBStringField;
     QMDetalleTITULO_TIPO_MARCAJE: TFIBStringField;
     QMDetalleTITULO_ESTADO: TFIBStringField;
     QMDetalleUSUARIO_CREACION: TIntegerField;
     QMDetalleUSUARIO_MODIFICACION: TIntegerField;
     QMDetalleFECHA_CREACION: TDateTimeField;
     QMDetalleFECHA_MODIFICACION: TDateTimeField;
     QMDetalleMOTIVO_MODIFICACION: TFIBStringField;
     QMDetalleVALORES_ORIGINALES: TMemoField;
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(id: integer);
  end;

var
  DMPresenciaEdicionMarcajes : TDMPresenciaEdicionMarcajes;

implementation

uses
  UDMMain, UEntorno, UDameDato, UParam, UDMPresenciaProcesaMarcajes;

{$R *.dfm}

procedure TDMPresenciaEdicionMarcajes.Filtra(id: integer);
begin
  QMDetalle.Close;
  QMDetalle.Params.ByName['ID_OPE_PRESENCIA_MARCAJE'].AsInteger := id;
  QMDetalle.Open;
end;

procedure TDMPresenciaEdicionMarcajes.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if LeeParametro('PRECNTL001') = 'S' then
     QMDetalleTIPO_MARCAJE.AsString := 'PRE';

  QMDetalleFECHA_MARCAJE.AsDateTime := Now;
  QMDetalleID_INCIDENCIA.AsInteger := DameIdIncidenciaDefecto;
  QMDetalleESTADO.AsInteger := 0;

  // Traigo los valores que hubiera en el formulario de importacion de presencia
  QMDetalleID_EMPLEADO.AsInteger := DMPresenciaProcesaMarcajes.QMDetalleID_EMPLEADO.AsInteger;
end;

procedure TDMPresenciaEdicionMarcajes.QMDetalleBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMDetalle, 'CONTA_OPE_PRESENCIA_MARCAJE', 'ID_OPE_PRESENCIA_MARCAJE');

  if QMDetalle.State = dsInsert then
  begin
     QMDetalleUSUARIO_CREACION.AsInteger := REntorno.Usuario;
     QMDetalleFECHA_CREACION.AsDateTime := Now;
  end
  else
  if QMDetalle.State = dsEdit then
  begin
     QMDetalleUSUARIO_MODIFICACION.AsInteger := REntorno.Usuario;
     QMDetalleFECHA_MODIFICACION.AsDateTime := Now;
  end;
end;

end.
