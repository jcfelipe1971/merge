unit UDMPresenciaIncidencia;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TDMPresenciaIncidencia = class(TDataModule)
     TLocal: THYTransaction;
     QMIncPre: TFIBTableSet;
     DSQMIncPre: TDataSource;
     QMIncPreTIPO: TFIBStringField;
     QMIncPreDESCRIPCION: TFIBStringField;
     QMIncPreID_INCIDENCIA: TIntegerField;
     QMIncPreIDENTIFICADOR_INCIDENCIA: TFIBStringField;
     TUpdate: THYTransaction;
     QMIncPreREMUNERACION: TIntegerField;
     QMIncPreBOLSA_HORAS: TIntegerField;
     QMIncPreDEFECTO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMIncPreNewRecord(DataSet: TDataSet);
     procedure QMIncPreBeforePost(DataSet: TDataSet);
     procedure QMIncPreAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPresenciaIncidencia : TDMPresenciaIncidencia;

implementation

uses UDMMain, UUtiles, UEntorno;

{$R *.dfm}

procedure TDMPresenciaIncidencia.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMIncPre, MascaraN, MascaraI, ShortDateFormat + 'hh:nn');

  QMIncPre.Open;
end;

procedure TDMPresenciaIncidencia.QMIncPreNewRecord(DataSet: TDataSet);
begin
  QMIncPreTIPO.AsString := '';
  QMIncPreDESCRIPCION.AsString := '';
  QMIncPreIDENTIFICADOR_INCIDENCIA.AsString := '';
  QMIncPreREMUNERACION.AsInteger := 1;
  QMIncPreBOLSA_HORAS.AsInteger := 0;
  QMIncPreDEFECTO.AsInteger := 0;
end;

procedure TDMPresenciaIncidencia.QMIncPreBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMIncPreID_INCIDENCIA.AsInteger = 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(ID_INCIDENCIA) FROM PRO_SYS_TIPO_INCIDENCIA';
           ExecQuery;
           QMIncPreID_INCIDENCIA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPresenciaIncidencia.QMIncPreAfterPost(DataSet: TDataSet);
begin
  if (QMIncPreDEFECTO.AsInteger = 1) then
     Refrescar(QMIncPre, 'DEFECTO', 1);
end;

end.
