unit UDMPresenciaDiario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMPresenciaDiario = class(TDataModule)
     QMProDetPre: TFIBTableSet;
     DSQMProDetPre: TDataSource;
     TLocal: THYTransaction;
     DSxCalendario: TDataSource;
     xCalendario: TFIBDataSetRO;
     xHorario: TFIBDataSetRO;
     DSxHorario: TDataSource;
     QMProDetPreTiempos: TFIBTableSet;
     DSQMProPreTiempos: TDataSource;
     xCalendarioDESCRIPCION: TFIBStringField;
     xHorarioDESCRIPCION: TFIBStringField;
     QMProDetPreEMPRESA: TIntegerField;
     QMProDetPreEJERCICIO: TIntegerField;
     QMProDetPreCANAL: TIntegerField;
     QMProDetPreSERIE: TFIBStringField;
     QMProDetPreTIPO: TFIBStringField;
     QMProDetPreRIG: TIntegerField;
     QMProDetPreID_CAB_PRESENCIA: TIntegerField;
     QMProDetPreOPERARIO: TIntegerField;
     QMProDetPreFECHA: TDateTimeField;
     QMProDetPreHORARIO: TFIBStringField;
     QMProDetPreDESC_HORARIO: TFIBStringField;
     QMProDetPreCALENDARIO: TIntegerField;
     QMProDetPreDESC_CALENDARIO: TFIBStringField;
     QMProDetPreESTADO_CAB: TIntegerField;
     QMProDetPreLINEA: TIntegerField;
     QMProDetPreID_DET_PRESENCIA: TIntegerField;
     QMProDetPreTIPO_PRE: TFIBStringField;
     QMProDetPreID_INCIDENCIA: TIntegerField;
     QMProDetPreDESC_INCIDENCIA: TFIBStringField;
     QMProDetPreESTADO_DET: TIntegerField;
     QMProDetPreTIEMPO_DEC: TFloatField;
     QMProDetPreDESC_OPERARIO: TFIBStringField;
     xIncidencia: TFIBDataSetRO;
     DSxIncidencia: TDataSource;
     xIncidenciaDESCRIPCION: TFIBStringField;
     QMProDetPreTIEMPO_TOTAL: TDateTimeField;
     QMProDetPreHORA_ENTRADA: TDateTimeField;
     QMProDetPreHORA_SALIDA: TDateTimeField;
     QMProDetPreTIEMPO: TDateTimeField;
     QMProDetPreTiemposTIEMPO: TDateTimeField;
     QMProDetPreHORA_ENTRADA_ORIGINAL: TDateTimeField;
     QMProDetPreHORA_SALIDA_ORIGINAL: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMPresenciaDiario : TDMPresenciaDiario;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TDMPresenciaDiario.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProDetPreHORA_ENTRADA.DisplayFormat := 'hh:nn';
  QMProDetPreHORA_SALIDA.DisplayFormat := 'hh:nn';
  QMProDetPreTIEMPO.DisplayFormat := 'hh:nn';
  QMProDetPreHORA_ENTRADA_ORIGINAL.DisplayFormat := 'hh:nn';
  QMProDetPreHORA_SALIDA_ORIGINAL.DisplayFormat := 'hh:nn';
  // Mascaras Totales
  //QMProDetPreTiemposTIEMPOTOTAL.DisplayFormat := '0.0000';//'##00:00'; //MascaraI; //##:##
  QMProDetPreTIEMPO_TOTAL.DisplayFormat := 'dd hh:nn';
end;

procedure TDMPresenciaDiario.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPresenciaDiario.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProDetPre, '10000');
end;

end.
