unit UDMTiposRedondeo;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMTiposRedondeo = class(TDataModule)
     TLocal: THYTransaction;
     QMTiposRedondeo: TFIBTableSet;
     DSQMTiposRedondeo: TDataSource;
     QMTiposRedondeoTIPO_REDONDEO: TIntegerField;
     QMTiposRedondeoTITULO: TFIBStringField;
     QMTiposRedondeoSISTEMA: TIntegerField;
     QMTiposRedondeoUSO_TRUNCA: TIntegerField;
     QMTiposRedondeoUSO_MULT: TIntegerField;
     QMTiposRedondeoVALOR: TFloatField;
     QMTiposRedondeoDECIMALES: TIntegerField;
     QMTiposRedondeoALZA_BAJA_TERMINACION: TIntegerField;
     QMTiposRedondeoTIPO_TERMINACION: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTiposRedondeoNewRecord(DataSet: TDataSet);
     procedure QMTiposRedondeoAfterPost(DataSet: TDataSet);
     procedure QMTiposRedondeoBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTiposRedondeo : TDMTiposRedondeo;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMTiposRedondeo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
  QMTiposRedondeo.Open;
end;

procedure TDMTiposRedondeo.QMTiposRedondeoNewRecord(DataSet: TDataSet);
begin
  QMTiposRedondeoSISTEMA.AsInteger := 0;
  QMTiposRedondeoVALOR.AsFloat := 0;
  QMTiposRedondeoDECIMALES.AsInteger := 0;
  QMTiposRedondeoTITULO.AsString := '';
  QMTiposRedondeoUSO_TRUNCA.AsInteger := 0;
  QMTiposRedondeoUSO_MULT.AsInteger := 0;
  QMTiposRedondeoALZA_BAJA_TERMINACION.AsInteger := 1;
  QMTiposRedondeoTIPO_TERMINACION.AsInteger := 0;
end;

procedure TDMTiposRedondeo.QMTiposRedondeoAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTiposRedondeo.QMTiposRedondeoBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'conta_tipos_redondeo', 'TIPO_REDONDEO');
end;

end.
