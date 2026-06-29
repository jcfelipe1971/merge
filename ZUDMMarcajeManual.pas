unit ZUDMMarcajeManual;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TZDMMarcajeManual = class(TDataModule)
     TLocal: THYTransaction;
     QMMarcajes: TFIBTableSet;
     DSMMarcajes: TDataSource;
     QMMarcajesEMPRESA: TIntegerField;
     QMMarcajesEJERCICIO: TIntegerField;
     QMMarcajesCANAL: TIntegerField;
     QMMarcajesSERIE: TFIBStringField;
     QMMarcajesTIPO: TFIBStringField;
     QMMarcajesRIG: TIntegerField;
     QMMarcajesID_S: TIntegerField;
     QMMarcajesTERCERO: TIntegerField;
     QMMarcajesCLIENTE: TIntegerField;
     QMMarcajesDESC_CLIENTE: TFIBStringField;
     QMMarcajesSU_REFERENCIA: TFIBStringField;
     QMMarcajesFECHA_CORTE: TDateTimeField;
     QMMarcajesOPERARIO_CORTE: TIntegerField;
     QMMarcajesFECHA_UNION: TDateTimeField;
     QMMarcajesOPERARIO_UNION: TIntegerField;
     QMMarcajesFECHA_MACARRON: TDateTimeField;
     QMMarcajesOPERARIO_MACARRON: TIntegerField;
     QMMarcajesFECHA_MONTAJE: TDateTimeField;
     QMMarcajesOPERARIO_MONTAJE: TIntegerField;
     QMMarcajesFECHA_TERMINADO: TDateTimeField;
     QMMarcajesOPERARIO_TERMINADO: TIntegerField;
     QMMarcajesFECHA_PREPARADO: TDateTimeField;
     QMMarcajesOPERARIO_PREPARADO: TIntegerField;
     QMDetMarcajes: TFIBTableSet;
     DSDetMarcajes: TDataSource;
     QMDetMarcajesID_DETALLE: TIntegerField;
     QMDetMarcajesID_S: TIntegerField;
     QMDetMarcajesLINEA_PED: TIntegerField;
     QMDetMarcajesID_ORDEN: TIntegerField;
     QMDetMarcajesFECHA_CREACION: TDateTimeField;
     QMDetMarcajesFECHA_CORTE: TDateTimeField;
     QMDetMarcajesOPERARIO_CORTE: TIntegerField;
     QMDetMarcajesFECHA_UNION: TDateTimeField;
     QMDetMarcajesOPERARIO_UNION: TIntegerField;
     QMDetMarcajesFECHA_MACARRON: TDateTimeField;
     QMDetMarcajesOPERARIO_MACARRON: TIntegerField;
     QMDetMarcajesFECHA_MONTAJE: TDateTimeField;
     QMDetMarcajesOPERARIO_MONTAJE: TIntegerField;
     QMDetMarcajesFECHA_TERMINADO: TDateTimeField;
     QMDetMarcajesOPERARIO_TERMINADO: TIntegerField;
     QMDetMarcajesFECHA_PREPARADO: TDateTimeField;
     QMDetMarcajesOPERARIO_PREPARADO: TIntegerField;
     QMDetMarcajesMAIL_ENVIADO: TIntegerField;
     QMMarcajesCOD_BARRAS: TIntegerField;
     QMMarcajesFECHA_MOTOR: TDateTimeField;
     QMMarcajesOPERARIO_MOTOR: TIntegerField;
     QMDetMarcajesFECHA_MOTOR: TDateTimeField;
     QMDetMarcajesOPERARIO_MOTOR: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMarcajesAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ZDMMarcajeManual : TZDMMarcajeManual;

implementation

uses UDMMain, uFBusca;

{$R *.dfm}

procedure TZDMMarcajeManual.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Máscaras fechas
  QMDetMarcajesFECHA_CREACION.DisplayFormat := 'dd/mm/yyyy hh:mm:ss';
  QMDetMarcajesFECHA_CORTE.DisplayFormat := 'dd/mm/yyyy hh:mm:ss';
  QMDetMarcajesFECHA_UNION.DisplayFormat := 'dd/mm/yyyy hh:mm:ss';
  QMDetMarcajesFECHA_MACARRON.DisplayFormat := 'dd/mm/yyyy hh:mm:ss';
  QMDetMarcajesFECHA_MONTAJE.DisplayFormat := 'dd/mm/yyyy hh:mm:ss';
  QMDetMarcajesFECHA_TERMINADO.DisplayFormat := 'dd/mm/yyyy hh:mm:ss';
  QMDetMarcajesFECHA_PREPARADO.DisplayFormat := 'dd/mm/yyyy hh:mm:ss';

  DMMain.FiltraTabla(QMMarcajes, '11110');
end;

procedure TZDMMarcajeManual.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMarcajes, '11110');
end;

procedure TZDMMarcajeManual.QMMarcajesAfterOpen(DataSet: TDataSet);
begin
  QMDetMarcajes.Open;
end;

end.
