unit UProDMTipoMarcajes;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TProDMTipoMarcajes = class(TDataModule)
     TLocal: THYTransaction;
     DSQMProTipoMarc: TDataSource;
     QMProTipoMarc: TFIBTableSet;
     QMProTipoMarcTIPO: TFIBStringField;
     QMProTipoMarcDESCRIPCION: TFIBStringField;
     QMProTipoMarcPRODUCTIVO: TIntegerField;
     frHYTipoMarcajes: TfrHYReport;
     frDBQMTipoMarc: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMProTipoMarcNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMTipoMarcajes : TProDMTipoMarcajes;

implementation

uses UDMMain, UFBusca;

{$R *.dfm}

procedure TProDMTipoMarcajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMProTipoMarc.Open;
end;

procedure TProDMTipoMarcajes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMTipoMarcajes.QMProTipoMarcNewRecord(DataSet: TDataSet);
begin
  QMProTipoMarcPRODUCTIVO.AsInteger := 1;
end;

procedure TProDMTipoMarcajes.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProTipoMarc, '00000');
end;

end.
