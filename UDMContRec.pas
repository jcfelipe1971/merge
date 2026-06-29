unit UDMContRec;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, FIBQuery, DB, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, Fib, Dialogs, HYFIBQuery, FIBDataSetRO,
  SysUtils;

type
  TDMContRec = class(TDataModule)
     DSxContRec_E: TDataSource;
     QMContRec_EE: TFIBTableSet;
     DSxContRec_EE: TDataSource;
     QMContRec_EEC: TFIBTableSet;
     DSxContRec_EEC: TDataSource;
     QMContRec_EECS: TFIBTableSet;
     DSxContRec_EECS: TDataSource;
     QGen: THYFIBQuery;
     QMContRec_EES: TFIBTableSet;
     DSxContRec_EES: TDataSource;
     TLocal: THYTransaction;
     QMContRec_E: TFIBTableSet;
     DSxTipoE: TDataSource;
     xTipoE: TFIBDataSetRO;
     DSxTipoEE: TDataSource;
     xTipoEE: TFIBDataSetRO;
     DSxTipoEEC: TDataSource;
     xTipoEEC: TFIBDataSetRO;
     DSxTipoEECS: TDataSource;
     xTipoEECS: TFIBDataSetRO;
     DSxTipoEES: TDataSource;
     xTipoEES: TFIBDataSetRO;
     QMContRec_EEMPRESA: TIntegerField;
     QMContRec_ETIPO: TFIBStringField;
     QMContRec_ECONTADOR: TIntegerField;
     QMContRec_EFECHA: TDateTimeField;
     QMContRec_EEEMPRESA: TIntegerField;
     QMContRec_EEEJERCICIO: TIntegerField;
     QMContRec_EETIPO: TFIBStringField;
     QMContRec_EECONTADOR: TIntegerField;
     QMContRec_EEFECHA: TDateTimeField;
     QMContRec_EECEMPRESA: TIntegerField;
     QMContRec_EECEJERCICIO: TIntegerField;
     QMContRec_EECCANAL: TIntegerField;
     QMContRec_EECTIPO: TFIBStringField;
     QMContRec_EECCONTADOR: TIntegerField;
     QMContRec_EECFECHA: TDateTimeField;
     QMContRec_EECSEMPRESA: TIntegerField;
     QMContRec_EECSEJERCICIO: TIntegerField;
     QMContRec_EECSCANAL: TIntegerField;
     QMContRec_EECSSERIE: TFIBStringField;
     QMContRec_EECSTIPO: TFIBStringField;
     QMContRec_EECSCONTADOR: TIntegerField;
     QMContRec_EECSFECHA: TDateTimeField;
     QMContRec_EESEMPRESA: TIntegerField;
     QMContRec_EESSERIE: TFIBStringField;
     QMContRec_EESEJERCICIO: TIntegerField;
     QMContRec_EESTIPO: TFIBStringField;
     QMContRec_EESCONTADOR: TIntegerField;
     QMContRec_EESFECHA: TDateTimeField;
     TUpdate: THYTransaction;
     procedure DMContadoresCreate(Sender: TObject);
     procedure NoInserta(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure xTipoEAfterOpen(DataSet: TDataSet);
     procedure xTipoEECSAfterOpen(DataSet: TDataSet);
     procedure xTipoEEAfterOpen(DataSet: TDataSet);
     procedure xTipoEECAfterOpen(DataSet: TDataSet);
     procedure xTipoEESAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Refresca;
     procedure BorraTodosTipo(TabIndex: integer);
     function Dame_TipoE: string;
     function Dame_TipoEE: string;
     function Dame_TipoEEC: string;
     function Dame_TipoEECS: string;
     function Dame_TipoEES: string;
  end;

var
  DMContRec : TDMContRec;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMContRec.DMContadoresCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  Refresca;
end;

procedure TDMContRec.Refresca;
begin
  DMMain.FiltraRO(xTipoE, '10000', True);
  DMMain.FiltraRO(xTipoEE, '11000', True);
  DMMain.FiltraRO(xTipoEEC, '11100', True);
  DMMain.FiltraRO(xTipoEECS, '11100', True);
  DMMain.FiltraRO(xTipoEES, '11000', True);
end;

procedure TDMContRec.BorraTodosTipo(TabIndex: integer);
var
  Consulta : string;
begin
  case TabIndex of
     0: Consulta := 'DELETE FROM EMP_CONT_REC_E WHERE' +
           ' EMPRESA=' + IntToStr(QMContRec_E.FieldByName('EMPRESA').AsInteger) +
           ' AND TIPO=''' + QMContRec_E.FieldByName('TIPO').AsString + '''';
     1: Consulta := 'DELETE FROM EMP_CONT_REC_EE WHERE' +
           ' EMPRESA=' + IntToStr(QMContRec_EE.FieldByName('EMPRESA').AsInteger) +
           ' AND EJERCICIO=' + IntToStr(QMContRec_EE.FieldByName('EJERCICIO').AsInteger) +
           ' AND TIPO=''' + QMContRec_EE.FieldByName('TIPO').AsString + '''';
     2: Consulta := 'DELETE FROM EMP_CONT_REC_EEC WHERE' +
           ' EMPRESA=' + IntToStr(QMContRec_EEC.FieldByName('EMPRESA').AsInteger) +
           ' AND EJERCICIO=' + IntToStr(QMContRec_EEC.FieldByName('EJERCICIO').AsInteger) +
           ' AND CANAL=' + IntToStr(QMContRec_EEC.FieldByName('CANAL').AsInteger) +
           ' AND TIPO=''' + QMContRec_EEC.FieldByName('TIPO').AsString + '''';
     3: Consulta := 'DELETE FROM EMP_CONT_REC_EECS WHERE' +
           ' EMPRESA=' + IntToStr(QMContRec_EECS.FieldByName('EMPRESA').AsInteger) +
           ' AND EJERCICIO=' + IntToStr(QMContRec_EECS.FieldByName('EJERCICIO').AsInteger) +
           ' AND CANAL=' + IntToStr(QMContRec_EECS.FieldByName('CANAL').AsInteger) +
           ' AND SERIE=''' + QMContRec_EECS.FieldByName('SERIE').AsString + '''' +
           ' AND TIPO=''' + QMContRec_EECS.FieldByName('TIPO').AsString + '''';
     4: Consulta := 'DELETE FROM EMP_CONT_REC_EES WHERE' +
           ' EMPRESA=' + IntToStr(QMContRec_EES.FieldByName('EMPRESA').AsInteger) +
           ' AND EJERCICIO=' + IntToStr(QMContRec_EES.FieldByName('EJERCICIO').AsInteger) +
           ' AND SERIE=''' + QMContRec_EES.FieldByName('SERIE').AsString + '''' +
           ' AND TIPO=''' + QMContRec_EES.FieldByName('TIPO').AsString + '''';
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := Consulta;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMContRec.NoInserta(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMContRec.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMContRec.xTipoEAfterOpen(DataSet: TDataSet);
begin
  DMMain.FiltraTabla(QMContRec_E, '10000', True);
end;

procedure TDMContRec.xTipoEEAfterOpen(DataSet: TDataSet);
begin
  DMMain.FiltraTabla(QMContRec_EE, '11000', True);
end;

procedure TDMContRec.xTipoEECAfterOpen(DataSet: TDataSet);
begin
  DMMain.FiltraTabla(QMContRec_EEC, '11100', True);
end;

procedure TDMContRec.xTipoEECSAfterOpen(DataSet: TDataSet);
begin
  DMMain.FiltraTabla(QMContRec_EECS, '11100', True);
end;

procedure TDMContRec.xTipoEESAfterOpen(DataSet: TDataSet);
begin
  DMMain.FiltraTabla(QMContRec_EES, '11000', True);
end;

function TDMContRec.Dame_TipoE: string;
begin
  Result := xTipoE.FieldByName('TIPO').AsString;
end;

function TDMContRec.Dame_TipoEE: string;
begin
  Result := xTipoEE.FieldByName('TIPO').AsString;
end;

function TDMContRec.Dame_TipoEEC: string;
begin
  Result := xTipoEEC.FieldByName('TIPO').AsString;
end;

function TDMContRec.Dame_TipoEECS: string;
begin
  Result := xTipoEECS.FieldByName('TIPO').AsString;
end;

function TDMContRec.Dame_TipoEES: string;
begin
  Result := xTipoEES.FieldByName('TIPO').AsString;
end;

end.
