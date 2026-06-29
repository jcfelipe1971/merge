unit UProDMGantt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TProDMGantt = class(TDataModule)
     DSQMGantt: TDataSource;
     TLocal: THYTransaction;
     QMGantt: TFIBTableSet;
     QMGanttID: TIntegerField;
     QMGanttTAREA: TFIBStringField;
     QMGanttRECURSO: TFIBStringField;
     QMGanttINICIO: TDateTimeField;
     QMGanttDURACION: TIntegerField;
     QMGanttIDENTIFICADOR_TAREA: TIntegerField;
     QMGanttDESCRIPCION: TFIBStringField;
     QMGanttPRIORIDAD: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMGanttNewRecord(DataSet: TDataSet);
     procedure QMGanttAfterInsert(DataSet: TDataSet);
  private
     { Private declarations }
     Alta: boolean;
  public
     { Public declarations }
     procedure NuevaTarea;
     procedure NuevoRecurso;
  end;

var
  ProDMGantt : TProDMGantt;

implementation

uses UDMMain, DateUtils;

{$R *.dfm}

procedure TProDMGantt.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Alta := False;
  QMGantt.Open;
end;

procedure TProDMGantt.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  if (Alta) then
  begin
     { dji - Creo que no es necesario porque ya se hace despues de llamar a NuevaTarea y NuevoRecurso en ProFMGantt }
     // ProFMGantt.GT.LeeDatos;
     Alta := False;
  end;
end;

procedure TProDMGantt.QMGanttNewRecord(DataSet: TDataSet);
begin
  //Es posa el codi següent. Es crida al generador de la BDD
  DMMain.Contador_Gen(QMGantt, 'pro_planifica_gantt', 'ID');
end;

procedure TProDMGantt.QMGanttAfterInsert(DataSet: TDataSet);
begin
  Alta := True;
end;

procedure TProDMGantt.NuevaTarea;
begin
  with QMGantt do
  begin
     Insert;
     Post;
     Close;
     Open;
  end;
end;

procedure TProDMGantt.NuevoRecurso;
var
  Tarea : string;
  Fecha : TDateTime;
begin
  with QMGantt do
  begin
     Tarea := FieldByName('TAREA').AsString;
     Fecha := IncSecond(FieldByName('INICIO').AsDateTime, FieldByName('DURACION').AsInteger);

     Insert;
     FieldByName('TAREA').AsString := Tarea;
     FieldByName('INICIO').AsDateTime := Fecha;
     Post;
     Close;
     Open;
  end;
end;

end.
