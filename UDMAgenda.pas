unit UDMAgenda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMAgenda = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMAgenda: TFIBTableSet;
     DSQMAgenda: TDataSource;
     DSQMAgendaEventos: TDataSource;
     DSQMAgendaEventoPeriodos: TDataSource;
     QMAgendaEventos: TFIBTableSet;
     QMAgendaEventoPeriodos: TFIBTableSet;
     QMAgendaID_AGENDA: TIntegerField;
     QMAgendaID_AGENDA_EVENTO: TIntegerField;
     QMAgendaUSUARIO: TIntegerField;
     QMAgendaFECHA: TDateTimeField;
     QMAgendaTITULO: TFIBStringField;
     QMAgendaDESCRIPCION: TMemoField;
     QMAgendaESTADO: TIntegerField;
     QMAgendaEventosID_AGENDA_EVENTO: TIntegerField;
     QMAgendaEventosUSUARIO: TIntegerField;
     QMAgendaEventosTITULO: TFIBStringField;
     QMAgendaEventosDESCRIPCION: TMemoField;
     QMAgendaEventoPeriodosUSUARIO: TIntegerField;
     QMAgendaEventoPeriodosTITULO: TFIBStringField;
     QMAgendaEventoPeriodosDESCRIPCION: TMemoField;
     QMAgendaEventoPeriodosID_AGENDA_EVENTO: TIntegerField;
     QMAgendaEventoPeriodosID_AGENDA_EVENTO_PERIODO: TIntegerField;
     QMAgendaEventoPeriodosDIA_SEMANA: TFIBStringField;
     QMAgendaEventoPeriodosDIA_MES: TIntegerField;
     QMAgendaEventoPeriodosMES: TIntegerField;
     QMAgendaEventoPeriodosFECHA_INICIO: TDateTimeField;
     QMAgendaEventoPeriodosFECHA_FIN: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAgendaEventoPeriodosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure GeneraAgenda;
     procedure GrabaEvento;
     procedure GrabaAgenda;
  end;

var
  DMAgenda : TDMAgenda;

implementation

uses
  UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMAgenda.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAgenda.Open;

  with QMAgendaEventoPeriodos do
  begin
     Close;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
  end;
end;

procedure TDMAgenda.QMAgendaEventoPeriodosNewRecord(DataSet: TDataSet);
begin
  QMAgendaEventoPeriodosUSUARIO.AsInteger := REntorno.Usuario;
end;

procedure TDMAgenda.GeneraAgenda;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CREA_AGENDA_USUARIO (?USUARIO)';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMAgenda do
  begin
     Close;
     Open;
     Last;
  end;
end;

procedure TDMAgenda.GrabaAgenda;
begin
  with QMAgenda do
  begin
     if (State = dsEdit) then
     begin
        Post;
        Refresh;
     end;
  end;
end;

procedure TDMAgenda.GrabaEvento;
begin
  with QMAgendaEventoPeriodos do
  begin
     if (State = dsEdit) then
     begin
        Post;
        Refresh;
     end;
  end;
end;

end.
