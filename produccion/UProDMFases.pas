unit UProDMFases;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TProDMFases = class(TDataModule)
     TLocal: THYTransaction;
     QMProSysFases: TFIBTableSet;
     DSQMProSysFases: TDataSource;
     QMProSysFasesFASE: TFIBStringField;
     QMProSysFasesTITULO: TFIBStringField;
     frProFases: TfrHYReport;
     frDBLstFases: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
  end;

var
  ProDMFases : TProDMFases;

implementation

uses UDMMain, UFBusca, UProFMLstCodBarras, UFormGest;

{$R *.dfm}

procedure TProDMFases.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProSysFases, '00000');
end;

procedure TProDMFases.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMProSysFases.Open;
end;

procedure TProDMFases.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
