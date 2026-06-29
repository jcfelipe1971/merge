unit UDMCatTransporte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMCatTransporte = class(TDataModule)
     TLocal: THYTransaction;
     QMCatTransporte: TFIBTableSet;
     DSQMCatTransporte: TDataSource;
     QMCatTransporteCODIGO: TIntegerField;
     QMCatTransporteDESCRIPCION: TFIBStringField;
     QMCatTransporteACTIVO: TIntegerField;
     QMCatTransporteNUMERO_UN: TFloatField;
     QMCatTransporteCLASE: TFIBStringField;
     QMCatTransportePACKING_GROUP: TFIBStringField;
     QMCatTransporteETIQUETAS: TFIBStringField;
     QMCatTransportePROVISIONES_ESP: TFIBStringField;
     QMCatTransporteCANTIDADES_LIMITADAS: TFIBStringField;
     QMCatTransporteENVASADO: TFIBStringField;
     QMCatTransporteVEHICULO_TANQUES: TFIBStringField;
     QMCatTransporteCONSIDERACIONES_ESP: TFIBStringField;
     QMCatTransporteIDENTIFICACION_RIESGOS: TFIBStringField;
     QMCatTransporteCATEGORIA_TRANSPORTE: TIntegerField;
     QMCatTransporteCRITERIO_SELECCION: TFIBStringField;
     QMCatTransporteAPARTADO: TFIBStringField;
     QMCatTransporteLETRA: TFIBStringField;
     QMCatTransporteTANQUE_PORTATIL: TFIBStringField;
     QMCatTransporteTANQUE_UN: TFIBStringField;
     QMCatTransporteCOD_CLASIF: TFIBStringField;
     QMCatTransporteCOD_NATURALEZA_PELIGRO: TIntegerField;
     QMCatTransporteCOD_MEDIDAS_PROTECCION: TIntegerField;
     QMCatTransporteCOD_RESTRICCION_TUNEL: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCatTransporteBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMCatTransporte : TDMCatTransporte;

implementation

uses UDMMain, uFBusca;

{$R *.dfm}

procedure TDMCatTransporte.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCatTransporte.Open;
end;

procedure TDMCatTransporte.QMCatTransporteBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_CAT_TRANSPORTE', 'Codigo');
end;

procedure TDMCatTransporte.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCatTransporte, '00000');
end;


end.
