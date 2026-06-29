unit UProDMAgrupaEscRec;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TProDMAgrupaEscRec = class(TDataModule)
     DSQMProEscRec: TDataSource;
     TLocal: THYTransaction;
     QMProEscRec: TFIBTableSet;
     QMProEscRecID: TIntegerField;
     QMProEscRecID_ESC: TIntegerField;
     QMProEscRecLINEA_FASE: TIntegerField;
     QMProEscRecRECURSO: TFIBStringField;
     QMProEscRecPRECIO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProEscRecID_ESCChange(Sender: TField);
     procedure QMProEscRecLINEA_FASEChange(Sender: TField);
     procedure QMProEscRecRECURSOChange(Sender: TField);
     procedure QMProEscRecNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMProEscRecAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     procedure DescRecurso;
     procedure DescFase;
     procedure DescEscandallo;
  public
     { Public declarations }
     function RecalculaPrecio: double;
     procedure CargaEscandallo(IdEsc, LineaFase: integer);
     procedure BotonRecalculaPrecio;
     procedure BusquedaCompleja;
  end;

var
  ProDMAgrupaEscRec : TProDMAgrupaEscRec;

implementation

uses UDMMain, UEntorno, UProFMAgrupaEscRec, UFBusca;

{$R *.dfm}

procedure TProDMAgrupaEscRec.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProEscRec.Open;
  DescRecurso;
  DescFase;
  DescEscandallo;
end;

procedure TProDMAgrupaEscRec.QMProEscRecID_ESCChange(Sender: TField);
begin
  DescEscandallo;
end;

procedure TProDMAgrupaEscRec.DescEscandallo;
begin
  if (QMProEscRecID_ESC.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COMPUESTO FROM PRO_ESCANDALLO WHERE ID_ESC = :ID_ESC';
           Params.ByName['id_esc'].AsInteger := QMProEscRecID_ESC.AsInteger;
           ExecQuery;
           ProFMAgrupaEscRec.LFDescEsc.Text := FieldByName['COMPUESTO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMAgrupaEscRec.QMProEscRecLINEA_FASEChange(Sender: TField);
begin
  DescFase;
end;

procedure TProDMAgrupaEscRec.DescFase;
begin
  if (QMProEscRecLINEA_FASE.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FIRST(1) FASE AS TITULO_FASE FROM PRO_FASES_ESC WHERE ID_ESC = :ID_ESC AND LINEA_FASE = :LINEA_FASE';
           Params.ByName['ID_ESC'].AsInteger := QMProEscRecID_ESC.AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMProEscRecLINEA_FASE.AsInteger;
           ExecQuery;
           ProFMAgrupaEscRec.LFDescFase.Text := FieldByName['TITULO_FASE'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMAgrupaEscRec.QMProEscRecRECURSOChange(Sender: TField);
begin
  DescRecurso;
end;

procedure TProDMAgrupaEscRec.DescRecurso;
begin
  if (QMProEscRecRECURSO.AsString <> '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM PRO_RECURSOS WHERE EMPRESA = :EMPRESA AND RECURSO = :RECURSO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['RECURSO'].AsString := QMProEscRecRECURSO.AsString;
           ExecQuery;
           ProFMAgrupaEscRec.LFDescRecurso.Text := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TProDMAgrupaEscRec.RecalculaPrecio: double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(PRE_COS_UNI) / COUNT(PRE_COS_UNI) AS PRECIO ');
        SQL.Add(' FROM PRO_TAREA_ESC ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ESC = :ID_ESC AND ');
        SQL.Add(' LINEA_FASE = :LINEA_FASE ');
        Params.ByName['ID_ESC'].AsInteger := QMProEscRecID_ESC.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMProEscRecLINEA_FASE.AsInteger;
        ExecQuery;
        Result := FieldByName['PRECIO'].AsFloat;
     finally
        Free;
     end;
  end;
end;

procedure TProDMAgrupaEscRec.QMProEscRecNewRecord(DataSet: TDataSet);
begin
  ProFMAgrupaEscRec.LFDescFase.Text := '';
  ProFMAgrupaEscRec.LFDescEsc.Text := '';
  ProFMAgrupaEscRec.LFDescRecurso.Text := '';
end;

procedure TProDMAgrupaEscRec.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMAgrupaEscRec.CargaEscandallo(IdEsc, LineaFase: integer);
var
  Existe : boolean;
begin
  // Mirar si existe
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_ESC, LINEA_FASE FROM PRO_ESCANDALLO_RECURSO WHERE ID_ESC = :ID_ESC AND LINEA_FASE = :LINEA_FASE';
        Params.ByName['ID_ESC'].AsInteger := IdEsc;
        Params.ByName['LINEA_FASE'].AsInteger := LineaFase;
        ExecQuery;
        Existe := (FieldByName['ID_ESC'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Existe) then
  begin
     // Si existe cargar los datos
     QMProEscRec.Close;
     QMProEscRec.SelectSQL.Text := 'SELECT * FROM PRO_ESCANDALLO_RECURSO WHERE ID_ESC = :ID_ESC AND LINEA_FASE = :LINEA_FASE';
     QMProEscRec.Params.ByName['ID_ESC'].AsInteger := IdEsc;
     QMProEscRec.Params.ByName['LINEA_FASE'].AsInteger := LineaFase;
     QMProEscRec.Open;
     DescRecurso;
     DescFase;
     DescEscandallo;
  end
  else
  begin
     // Si no existe estado insert con nuevos datos
     QMProEscRec.Insert;
     QMProEscRecID_ESC.AsInteger := IdEsc;
     QMProEscRecLINEA_FASE.AsInteger := LineaFase;
  end;
end;

procedure TProDMAgrupaEscRec.BotonRecalculaPrecio;
begin
  if (QMProEscRec.State <> dsInsert) and
     (QMProEscRec.State <> dsEdit) then
  begin
     QMProEscRec.Edit;
     QMProEscRecPRECIO.AsFloat := RecalculaPrecio;
     QMProEscRec.Post;
  end;
end;

procedure TProDMAgrupaEscRec.QMProEscRecAfterScroll(DataSet: TDataSet);
begin
  DescRecurso;
  DescFase;
  DescEscandallo;
end;

procedure TProDMAgrupaEscRec.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProEscRec, '00000');
end;

end.
