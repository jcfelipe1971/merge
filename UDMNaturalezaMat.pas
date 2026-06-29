unit UDMNaturalezaMat;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMNaturalezaMat = class(TDataModule)
     DSQMNaturalezaMat: TDataSource;
     QMNaturalezaMat: TFIBTableSet;
     TLocal: THYTransaction;
     QMNaturalezaMatNATURALEZA: TIntegerField;
     QMNaturalezaMatTITULO: TFIBStringField;
     QMNaturalezaMatDEFECTO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMNaturalezaMatNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMNaturalezaMat : TDMNaturalezaMat;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMNaturalezaMat.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMNaturalezaMat.Open;
end;

procedure TDMNaturalezaMat.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMNaturalezaMat, '00000');
end;

procedure TDMNaturalezaMat.QMNaturalezaMatNewRecord(DataSet: TDataSet);
begin
  QMNaturalezaMatDEFECTO.AsInteger := 0;
end;

end.
