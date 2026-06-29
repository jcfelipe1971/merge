unit UIsoDMCursos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  FIBDataSetRO;

type
  TIsoDMCursos = class(TDataModule)
     TLocal: TFIBTransaction;
     QMCursos: TFIBTableSet;
     DSCursos: TDataSource;
     QMCursosEMPRESA: TIntegerField;
     QMCursosID_CURSO: TIntegerField;
     QMCursosDESCRIPCION: TFIBStringField;
     QMCursosHORAS: TIntegerField;
     QMCursosNOTAS: TBlobField;
     SPLineaCursos: THYFIBQuery;
     QMCursosPROFESOR: TFIBStringField;
     frCertificado: TfrHYReport;
     frDBCertificado: TfrDBDataSet;
     QMAsistents: TFIBDataSetRO;
     QMAsistentsEMPRESA: TIntegerField;
     QMAsistentsEMPLEADO: TIntegerField;
     QMAsistentsTERCERO: TIntegerField;
     QMAsistentsTITULO: TFIBStringField;
     QMAsistentsNIF: TFIBStringField;
     QMAsistentsCATEGORIA: TFIBStringField;
     QMAsistentsDESCRIPCION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCursosNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure frCertificadoGetValue(const ParName: string; var ParValue: variant);
     procedure QMCursosAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMCursos : TIsoDMCursos;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TIsoDMCursos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCursos, '10000', True);
end;

procedure TIsoDMCursos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMCursos.QMCursosNewRecord(DataSet: TDataSet);
begin
  QMCursosEMPRESA.AsInteger := REntorno.Empresa;

  //sfg.albert - Ponemos el número de linea
  with SPLineaCursos do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     ExecQuery;

     QMCursosID_CURSO.AsInteger := SPLineaCursos.FieldByName['ID_CURSO'].AsInteger + 1;
  end;
end;

procedure TIsoDMCursos.frCertificadoGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

procedure TIsoDMCursos.QMCursosAfterOpen(DataSet: TDataSet);
begin
  QMAsistents.Close;
  QMAsistents.Open;
end;

procedure TIsoDMCursos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCursos, '10000');
end;

end.
