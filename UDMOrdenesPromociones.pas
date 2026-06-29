unit UDMOrdenesPromociones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMOrdenesPromociones = class(TDataModule)
     TLocal: THYTransaction;
     QMPromociones: TFIBTableSet;
     DSQMPromociones: TDataSource;
     QMPromocionesEMPRESA: TIntegerField;
     QMPromocionesTIPO: TFIBStringField;
     QMPromocionesTITULO: TFIBStringField;
     QMPromocionesORDEN: TIntegerField;
     QMPromocionesCONTINUA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPromocionesNewRecord(DataSet: TDataSet);
     procedure QMPromocionesAfterDelete(DataSet: TDataSet);
     procedure QMPromocionesAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMOrdenesPromociones : TDMOrdenesPromociones;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMOrdenesPromociones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMPromociones, '10000', True);
end;

procedure TDMOrdenesPromociones.QMPromocionesNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMOrdenesPromociones.QMPromocionesAfterDelete(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMOrdenesPromociones.QMPromocionesAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
