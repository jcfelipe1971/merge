unit UCrmDMArticulos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TCrmDmArticulos = class(TDataModule)
     TLocal: THYTransaction;
     QMArticulos: TFIBTableSet;
     DSQMArticulo: TDataSource;
     QMArticulosID_ARTICULO: TIntegerField;
     QMArticulosCODIGO: TFIBStringField;
     QMArticulosDESCRIPCION: TFIBStringField;
     QMArticulosCANTIDAD: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMArticulosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmDmArticulos : TCrmDmArticulos;

implementation

uses UDMMain;

{$R *.dfm}

procedure TCrmDmArticulos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMArticulos.Close;
  QMArticulos.Open;
end;

procedure TCrmDmArticulos.QMArticulosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'CRM_ID_ARTICULOS', 'ID_ARTICULO');
  end;
end;

end.
