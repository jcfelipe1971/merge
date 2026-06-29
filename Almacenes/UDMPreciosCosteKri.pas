unit UDMPreciosCosteKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMPreciosCosteKri = class(TDataModule)
     TLocal: THYTransaction;
     DSQMPreciosCoste: TDataSource;
     QMPreciosCoste: TFIBTableSet;
     QMPreciosCosteEMPRESA: TIntegerField;
     QMPreciosCosteEJERCICIO: TIntegerField;
     QMPreciosCosteCANAL: TIntegerField;
     QMPreciosCosteARTICULO: TFIBStringField;
     QMPreciosCosteALMACEN: TFIBStringField;
     QMPreciosCostePCOSTE: TFloatField;
     QMPreciosCosteTITULO: TFIBStringField;
     QMPreciosCosteFAMILIA: TFIBStringField;
     QMPreciosCosteID_A: TIntegerField;
     QMPreciosCosteID_C_A: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPreciosCosteBeforeInsert(DataSet: TDataSet);
     procedure QMPreciosCosteBeforeDelete(DataSet: TDataSet);
     procedure QMPreciosCosteAfterPost(DataSet: TDataSet);
     procedure QMPreciosCosteNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraAlmacen(Almacen: string);
  end;

var
  DMPreciosCosteKri : TDMPreciosCosteKri;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMPreciosCosteKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMPreciosCostePCOSTE.DisplayFormat := MascaraE;
end;

procedure TDMPreciosCosteKri.QMPreciosCosteBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPreciosCosteKri.QMPreciosCosteBeforeDelete(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPreciosCosteKri.QMPreciosCosteAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPreciosCosteKri.QMPreciosCosteNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPreciosCosteKri.FiltraAlmacen(Almacen: string);
begin
  with QMPreciosCoste do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Open;
  end;
end;

end.
