unit ZUDMPuestos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TZDMPuestos = class(TDataModule)
     TLocal: THYTransaction;
     QMPuestos: TFIBTableSet;
     QMPuestosPUESTO: TFIBStringField;
     QMPuestosDESCRIPCION: TFIBStringField;
     QMPuestosTAREA: TFIBStringField;
     QMPuestosDESPRECIA_DC: TIntegerField;
     DSQMPuestos: TDataSource;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPuestosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZDMPuestos : TZDMPuestos;

implementation

uses UDMMain;

{$R *.dfm}

procedure TZDMPuestos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMPuestos.Open;
end;

procedure TZDMPuestos.QMPuestosNewRecord(DataSet: TDataSet);
begin
  QMPuestosDESPRECIA_DC.AsInteger := 1;
end;

end.
