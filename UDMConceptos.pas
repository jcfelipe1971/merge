unit UDMConceptos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMConceptos = class(TDataModule)
     DSQMConceptos: TDataSource;
     QMConceptos: TFIBTableSet;
     QMConceptosCONCEPTO: TFIBStringField;
     QMConceptosTITULO: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DMConceptosCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMConceptos : TDMConceptos;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMConceptos.DMConceptosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMConceptos.Open;
end;

procedure TDMConceptos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMConceptos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMConceptos, '00000');
end;

end.
