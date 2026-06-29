unit UDMDetalleDeLinea;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMDetalleDeLinea = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleREFERENCIA: TFIBStringField;
     QMDetalleSOPORTE: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleACABADO: TFIBStringField;
     QMDetalleEMBALAJE: TFIBStringField;
     QMDetalleFECHA_INSTALACION: TDateTimeField;
     QMDetalleLUGAR_INSTALACION: TFIBStringField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleENTREGA_AAFF: TDateTimeField;
     QMDetalleALTO_AREA_VISIBLE: TFloatField;
     QMDetalleANCHO_AREA_VISIBLE: TFloatField;
     QMDetalleALTO_MEDIDA_TOTAL: TFloatField;
     QMDetalleANCHO_MEDIDA_TOTAL: TFloatField;
     QMDetalleFECHA_INSTALACION_PEND: TIntegerField;
     QMDetalleENTREGA_AAFF_PEND: TIntegerField;
     QMDetalleHORA_INSTALACION_PEND: TIntegerField;
     QMDetallePRECIO: TFloatField;
     QMDetalleID_MARCA: TIntegerField;
     QMDetalleID_MODELO: TIntegerField;
     QMDetalleBASTIDOR: TFIBStringField;
     QMDetalleFECHA_RECOGIDA: TDateTimeField;
     QMDetalleTRANSPORTISTA: TIntegerField;
     QMDetalleFECHA_PREVISTA_RECEPCION: TDateTimeField;
     QMDetalleCOMENTARIO_PREVISION_RECEPCION: TFIBStringField;
     QMDetalleFECHA_RECEPCION: TDateTimeField;
     QMDetalleCOMENTARIO_RECEPCION: TFIBStringField;
     QMDetalleNOTA: TBlobField;
     QMDetalleIMAGEN: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CreaRegistro(IdDetallesS: integer);
  end;

var
  DMDetalleDeLinea : TDMDetalleDeLinea;

implementation

uses UDMMain, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TDMDetalleDeLinea.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMDetalleDeLinea.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMDetalleDeLinea.CreaRegistro(IdDetallesS: integer);
begin
  /// Abro el registro.
  /// Si no existe lo creo.

  with QMDetalle do
  begin
     Close;
     Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
     Open;

     if (RecordCount = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO GES_DETALLES_S_DETALLES ');
              SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, UNIDADES) ');
              SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, UNIDADES FROM GES_DETALLES_S ');
              SQL.Add(' WHERE ID_DETALLES_S  = :ID_DETALLES_S ');
              Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Close;
        Params.ByName['ID_DETALLES_S'].AsInteger := IdDetallesS;
        Open;
     end;
  end;
end;

procedure TDMDetalleDeLinea.QMDetalleBeforePost(DataSet: TDataSet);
begin
  QMDetalleENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TDMDetalleDeLinea.QMDetalleNewRecord(DataSet: TDataSet);
begin
  {
    QMDetalleID_MARCA.AsInteger := 0;
    QMDetalleID_MODELO.AsInteger := 0;
    QMDetalleBASTIDOR.AsString:= '';
    QMDetalleFECHA_RECOGIDA := REntorno.FechaTrab;
    QMDetalleTRANSPORTISTA.AsInteger := 0;
    QMDetalleFECHA_PREVISTA_RECEPCION := REntorno.FechaTrab;
    QMDetalleCOMENTARIO_PREVISION_RECEPCION.AsString:= '';
    QMDetalleFECHA_RECEPCION.AsDateTime := REntorno.FechaTrab;
    QMDetalleCOMENTARIO_RECEPCION.AsString:= '';
    QMDetalleIMAGEN.AsInteger := 0;
    QMDetalleESTADO.AsInteger := 0;
}
end;

end.
