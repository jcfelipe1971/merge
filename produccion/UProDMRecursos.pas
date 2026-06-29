unit UProDMRecursos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TProDMRecursos = class(TDataModule)
     TLocal: THYTransaction;
     QMProRecursos: TFIBTableSet;
     DSQMProRecursos: TDataSource;
     QMProRecursosRECURSO: TFIBStringField;
     QMProRecursosTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
  end;

var
  ProDMRecursos : TProDMRecursos;

implementation

uses UDMMain, uFBusca;

{$R *.dfm}

procedure TProDMRecursos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMProRecursos.Open;
end;

procedure TProDMRecursos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProRecursos, '00000');
end;

procedure TProDMRecursos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
