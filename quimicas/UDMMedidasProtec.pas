unit udmMedidasProtec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMMedidasProtec = class(TDataModule)
     TLocal: THYTransaction;
     DSQMMedidasProtec: TDataSource;
     QMMedidasProtec: TFIBTableSet;
     QMMedidasProtecCOD_MEDIDAS_PROTECCION: TIntegerField;
     QMMedidasProtecTEXTO: TBlobField;
     QMMedidasProtecDESCRIPCION_CORTA: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMedidasProtecBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMMedidasProtec : TDMMedidasProtec;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMMedidasProtec.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMMedidasProtec.Open;
end;

procedure TDMMedidasProtec.QMMedidasProtecBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_MEDIDAS_PROTEC', 'Cod_medidas_proteccion');
end;

end.
