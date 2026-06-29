unit UDMTPVConfSincronizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMTPVConfSincronizacion = class(TDataModule)
     QMPartametrosSerie: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMPartametrosSerie: TDataSource;
     QMPartametrosSerieSERIE: TFIBStringField;
     QMPartametrosSerieRUTA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTPVConfSincronizacion : TDMTPVConfSincronizacion;

implementation

uses
  UDMMain;

{$R *.dfm}

procedure TDMTPVConfSincronizacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMTPVConfSincronizacion.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

end.
