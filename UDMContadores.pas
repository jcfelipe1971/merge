unit UDMContadores;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, FIBQuery, DB, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, Fib, Dialogs, HYFIBQuery, FIBDataSetRO, SysUtils;

type
  TDMContadores = class(TDataModule)
     DSxConta_E: TDataSource;
     QMConta_EE: TFIBTableSet;
     DSxConta_EE: TDataSource;
     QMConta_EEC: TFIBTableSet;
     DSxConta_EEC: TDataSource;
     QMConta_EECS: TFIBTableSet;
     DSxConta_EECS: TDataSource;
     QMConta_EES: TFIBTableSet;
     DSxConta_EES: TDataSource;
     TLocal: THYTransaction;
     QMConta_EEEMPRESA: TIntegerField;
     QMConta_EEEJERCICIO: TIntegerField;
     QMConta_EETIPO: TFIBStringField;
     QMConta_EETITULO: TFIBStringField;
     QMConta_EECONTADOR: TIntegerField;
     QMConta_EEACTIVO: TIntegerField;
     QMConta_EERECUPERA: TIntegerField;
     QMConta_EEBLOQUEADO: TIntegerField;
     QMConta_EECEMPRESA: TIntegerField;
     QMConta_EECEJERCICIO: TIntegerField;
     QMConta_EECCANAL: TIntegerField;
     QMConta_EECTIPO: TFIBStringField;
     QMConta_EECTITULO: TFIBStringField;
     QMConta_EECCONTADOR: TIntegerField;
     QMConta_EECACTIVO: TIntegerField;
     QMConta_EECRECUPERA: TIntegerField;
     QMConta_EECSEMPRESA: TIntegerField;
     QMConta_EECSEJERCICIO: TIntegerField;
     QMConta_EECSCANAL: TIntegerField;
     QMConta_EECSSERIE: TFIBStringField;
     QMConta_EECSTIPO: TFIBStringField;
     QMConta_EECSTITULO: TFIBStringField;
     QMConta_EECSCONTADOR: TIntegerField;
     QMConta_EECSACTIVO: TIntegerField;
     QMConta_EECSRECUPERA: TIntegerField;
     QMConta_EESEMPRESA: TIntegerField;
     QMConta_EESEJERCICIO: TIntegerField;
     QMConta_EESSERIE: TFIBStringField;
     QMConta_EESTIPO: TFIBStringField;
     QMConta_EESTITULO: TFIBStringField;
     QMConta_EESCONTADOR: TIntegerField;
     QMConta_EESACTIVO: TIntegerField;
     QMConta_EESRECUPERA: TIntegerField;
     QMConta_E: TFIBTableSet;
     QMConta_EEMPRESA: TIntegerField;
     QMConta_ETIPO: TFIBStringField;
     QMConta_ETITULO: TFIBStringField;
     QMConta_ECONTADOR: TIntegerField;
     QMConta_EACTIVO: TIntegerField;
     QMConta_ERECUPERA: TIntegerField;
     QMContaEC: TFIBTableSet;
     DSQMContaEC: TDataSource;
     QMContaECEMPRESA: TIntegerField;
     QMContaECCANAL: TIntegerField;
     QMContaECTIPO: TFIBStringField;
     QMContaECTITULO: TFIBStringField;
     QMContaECCONTADOR: TIntegerField;
     QMContaECACTIVO: TIntegerField;
     QMContaECRECUPERA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMContadoresCreate(Sender: TObject);
     procedure NoInserta(DataSet: TDataSet);
  private
     { Private declarations }
     procedure Refresca;
  public
     { Public declarations }
     procedure AjustaGenericos;
     procedure AltaTodos;
  end;

var
  DMContadores : TDMContadores;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMContadores.DMContadoresCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Refresca;
end;

procedure TDMContadores.Refresca;
begin
  DMMain.FiltraTabla(QMConta_E, '10000', True);
  DMMain.FiltraTabla(QMConta_EE, '11000', True);
  DMMain.FiltraTabla(QMConta_EEC, '11100', True);
  DMMain.FiltraTabla(QMConta_EECS, '11100', True);
  DMMain.FiltraTabla(QMConta_EES, '11000', True);
  DMMain.FiltraTabla(QMContaEC, '10100', True);
end;

procedure TDMContadores.AjustaGenericos;
begin
  DMMain.AjustaMovimientos;

  Refresca;
end;

procedure TDMContadores.AltaTodos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CONTADORES_ALTA_TODOS';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refresca;
end;

procedure TDMContadores.NoInserta(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

end.
