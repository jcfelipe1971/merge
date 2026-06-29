unit UDMClaseDir;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMClaseDir = class(TDataModule)
     QMClaseDir: TFIBTableSet;
     DSQMClaseDir: TDataSource;
     TLocal: THYTransaction;
     QMClaseDirCLASE: TIntegerField;
     QMClaseDirTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMClaseDirCreate(Sender: TObject);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMClaseDir : TDMClaseDir;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMClaseDir.DMClaseDirCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMClaseDir.Open;
end;

procedure TDMClaseDir.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMClaseDir, '00000');
end;

end.
