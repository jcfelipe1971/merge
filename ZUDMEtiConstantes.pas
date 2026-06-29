unit ZUDMEtiConstantes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TZDMEtiConstantes = class(TDataModule)
     TLocal: THYTransaction;
     QMConstantes: TFIBTableSet;
     DSConstantes: TDataSource;
     QMConstantesLONGITUD_BOBINA: TFloatField;
     QMConstantesML_CAMBIO_BOBINA: TFloatField;
     QMConstantesID: TIntegerField;
     QMConstantesEMPRESA: TIntegerField;
     QMConstantesHORAS_CAMBIO_BOBINA: TFloatField;
     QMConstantesTAREA_PREPARACION: TFIBStringField;
     QMConstantesTAREA_IMPRESION: TFIBStringField;
     QMConstantesTAREA_POLIMEROS: TFIBStringField;
     QMConstantesTAREA_BOBINAS: TFIBStringField;
     QMConstantesPATH_DOCUMENTOS: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMConstantesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZDMEtiConstantes : TZDMEtiConstantes;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

procedure TZDMEtiConstantes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMConstantes.Close;
  QMConstantes.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMConstantes.Open;
end;

procedure TZDMEtiConstantes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TZDMEtiConstantes.QMConstantesNewRecord(DataSet: TDataSet);
begin
  QMConstantesEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
