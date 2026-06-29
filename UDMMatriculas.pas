unit UDMMatriculas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados, FIBDataSetRO;

type
  TDMMatriculas = class(TDataModule)
     DSQMMatriculas: TDataSource;
     TLocal: THYTransaction;
     QMMatriculas: TFIBTableSet;
     QMMatriculasEMPRESA: TIntegerField;
     QMMatriculasMATRICULA: TFIBStringField;
     QMMatriculasTITULO: TFIBStringField;
     QMMatriculasTRANSPORTISTA: TIntegerField;
     QMMatriculasDEFECTO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMatriculasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMMatriculas : TDMMatriculas;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMMatriculas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with QMMatriculas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMMatriculas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMatriculas, '10000');
end;

procedure TDMMatriculas.QMMatriculasNewRecord(DataSet: TDataSet);
begin
  QMMatriculasEMPRESA.AsInteger := REntorno.Empresa;
  QMMatriculasDEFECTO.AsInteger := 0;
end;

end.
