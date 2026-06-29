unit UDMLmpTablasTmp;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMLmpTablasTmp = class(TDataModule)
     TLocal: THYTransaction;
     DSQMTablasTemporales: TDataSource;
     QMTablasTemporales: TFIBTableSet;
     QMTablasTemporalesNOMBRE: TFIBStringField;
     QMTablasTemporalesENTRADA: TIntegerField;
     QMTablasTemporalesMARCADO: TIntegerField;
     xTablasMarcadas: TFIBDataSetRO;
     procedure DMLmpTablasTmpCreate(Sender: TObject);
     procedure QMTablasTemporalesNewRecord(DataSet: TDataSet);
     procedure QMTablasTemporalesMARCADOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     procedure MarcarTodos(Marcar: boolean);
     procedure LimpiaTablasTemporales(SoloEntradaActual: boolean = False);
     procedure RefrescaTablas;
  end;

var
  DMLmpTablasTmp : TDMLmpTablasTmp;

implementation

uses UDMMain, UEntorno, UFormGest, UUtiles;

{$R *.DFM}

procedure TDMLmpTablasTmp.DMLmpTablasTmpCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  RefrescaTablas;
end;

procedure TDMLmpTablasTmp.DataModuleDestroy(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_TEMPORALES WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLmpTablasTmp.MarcarTodos(Marcar: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_TEMPORALES SET MARCADO = :MARCA WHERE ENTRADA = :ENTRADA';
        Params.ByName['MARCA'].AsInteger := BoolToInt(Marcar);
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMTablasTemporales.Close;
  QMTablasTemporales.Open;
end;

procedure TDMLmpTablasTmp.QMTablasTemporalesNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMLmpTablasTmp.QMTablasTemporalesMARCADOChange(Sender: TField);
begin
  if (QMTablasTemporales.State = dsInsert) or (QMTablasTemporales.State = dsEdit) then
     QMTablasTemporales.Post;
end;

procedure TDMLmpTablasTmp.LimpiaTablasTemporales(SoloEntradaActual: boolean = False);
var
  TablaTemporal : string;
  Procesar : boolean;
  Q : THYFIBQuery;
begin
  with xTablasMarcadas do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;

     First;
     while not EOF do
     begin
        TablaTemporal := xTablasMarcadas.FieldByName('NOMBRE').AsString;
        Procesar := True;

        if SoloEntradaActual then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT RDB$FIELD_NAME AS CAMPO_ENTRADA FROM RDB$RELATION_FIELDS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' RDB$RELATION_NAME = ''' + TablaTemporal + ''' AND ');
                 SQL.Add(' RDB$FIELD_NAME = ''ENTRADA'' ');
                 ExecQuery;

                 Procesar := (Trim(FieldByName['CAMPO_ENTRADA'].AsString) > '');

                 FreeHandle;
              end;
           finally
              Q.Free;
           end;
        end;

        if Procesar then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' DELETE FROM ' + TablaTemporal);

                 if SoloEntradaActual then
                    SQL.Add(' WHERE ENTRADA = ' + REntorno.EntradaStr + ' ');

                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        Next;
     end;
  end;

  QMTablasTemporales.Close;
end;

procedure TDMLmpTablasTmp.RefrescaTablas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_RELLENA_TEMPORALES (:ENTRADA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMTablasTemporales do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

end.
