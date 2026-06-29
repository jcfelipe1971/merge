unit UDMNumerosDeAutorizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMNumerosDeAutorizacion = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMNumerosDeAutorizacion: TFIBTableSet;
     DSQMNumerosDeAutorizacion: TDataSource;
     QMNumerosDeAutorizacionEMPRESA: TIntegerField;
     QMNumerosDeAutorizacionTIPO: TFIBStringField;
     QMNumerosDeAutorizacionAUTORIZACION: TFIBStringField;
     QMNumerosDeAutorizacionLLAVE_DOSIFICACION: TFIBStringField;
     QMNumerosDeAutorizacionCONTADOR: TIntegerField;
     QMNumerosDeAutorizacionFECHA_DESDE: TDateTimeField;
     QMNumerosDeAutorizacionFECHA_HASTA: TDateTimeField;
     QMNumerosDeAutorizacionCOD_CLI_PRO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMNumerosDeAutorizacionBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMNumerosDeAutorizacion : TDMNumerosDeAutorizacion;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMNumerosDeAutorizacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMNumerosDeAutorizacion.Close;
  QMNumerosDeAutorizacion.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMNumerosDeAutorizacion.Params.ByName['TIPO'].AsString := 'E';
  QMNumerosDeAutorizacion.Open;
end;

procedure TDMNumerosDeAutorizacion.QMNumerosDeAutorizacionBeforePost(DataSet: TDataSet);
begin
  QMNumerosDeAutorizacionEMPRESA.AsInteger := REntorno.Empresa;
  QMNumerosDeAutorizacionTIPO.AsString := 'E';
end;

end.
