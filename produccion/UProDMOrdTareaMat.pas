unit UProDMOrdTareaMat;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, Dialogs;

type
  TProDMOrdTareaMat = class(TDataModule)
     TLocal: THYTransaction;
     QMTareaMatCab: TFIBTableSet;
     QMTareaMatDet: TFIBTableSet;
     DSTareaMatCab: TDataSource;
     DSTareaMatDet: TDataSource;
     QMTareaMatCabID_TAREA: TIntegerField;
     QMTareaMatCabFECHA: TDateTimeField;
     QMTareaMatCabID_ORDEN: TIntegerField;
     QMTareaMatCabTIPOFASE: TFIBStringField;
     QMTareaMatCabEMPRESA: TIntegerField;
     QMTareaMatDetID_TAREA: TIntegerField;
     QMTareaMatDetLINEA: TIntegerField;
     QMTareaMatDetFECHA: TDateTimeField;
     QMTareaMatDetOPERARIO: TIntegerField;
     QMTareaMatDetARTICULO: TFIBStringField;
     QMTareaMatDetCANTIDAD: TFloatField;
     QMTareaMatDetEMPRESA: TIntegerField;
     xTareasAbiertas: TFIBDataSetRO;
     xTareasAbiertasTIPO_FASE: TFIBStringField;
     xTareasAbiertasTITULO_FASE: TFIBStringField;
     xTareasAbiertasID_ORDEN: TIntegerField;
     DSxTareasAbiertas: TDataSource;
     QMTareaMatCabDescFase: TStringField;
     QMTareaMatDetDescOperario: TStringField;
     QMTareaMatDetDescArticulo: TStringField;
     DSxOrden: TDataSource;
     xOrden: TFIBDataSetRO;
     xOrdenCOMPUESTO: TFIBStringField;
     xOrdenTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTareaMatCabNewRecord(DataSet: TDataSet);
     procedure QMTareaMatCabID_TAREAChange(Sender: TField);
     procedure QMTareaMatCabAfterOpen(DataSet: TDataSet);
     procedure QMTareaMatDetNewRecord(DataSet: TDataSet);
     procedure QMTareaMatDetDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTareaMatDetDescOperarioGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTareaMatCabAfterScroll(DataSet: TDataSet);
     procedure QMTareaMatDetOPERARIOChange(Sender: TField);
     procedure QMTareaMatDetARTICULOChange(Sender: TField);
     procedure QMTareaMatCabID_ORDENChange(Sender: TField);
     procedure QMTareaMatCabBeforeClose(DataSet: TDataSet);
     procedure QMTareaMatDetBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     procedure RefrescaTareasAbiertas;
  public
     { Public declarations }
  end;

var
  ProDMOrdTareaMat : TProDMOrdTareaMat;

implementation

uses UDMMain, UEntorno, UDameDato, HYFIBQuery;

{$R *.dfm}

procedure TProDMOrdTareaMat.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTareamatCab.Close;
  QMTareamatCab.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMTareamatCab.Open;
end;

procedure TProDMOrdTareaMat.QMTareaMatCabNewRecord(DataSet: TDataSet);
begin
  QMTareaMatCabEMPRESA.AsInteger := REntorno.Empresa;
  QMTareaMatCabFECHA.AsDateTime := REntorno.FechaTrabSH;
end;

procedure TProDMOrdTareaMat.QMTareaMatCabID_TAREAChange(Sender: TField);
begin
  RefrescaTareasAbiertas;

  QMTareaMatCabTIPOFASE.AsString := xTareasAbiertasTIPO_FASE.AsString;
  QMTareaMatCabID_ORDEN.AsInteger := xTareasAbiertasID_ORDEN.AsInteger;
  QMTareaMatCabDescFase.AsString := xTareasAbiertasTITULO_FASE.AsString;
end;

procedure TProDMOrdTareaMat.QMTareaMatCabAfterOpen(DataSet: TDataSet);
begin
  QMTareaMatDet.Open;
  xOrden.Open;
end;

procedure TProDMOrdTareaMat.QMTareaMatDetNewRecord(DataSet: TDataSet);
begin
  if (QMTareaMatCab.State in [dsInsert, dsEdit]) then
     QMTareaMatCab.Post;

  QMTareaMatDetEMPRESA.AsInteger := QMTareaMatCabEMPRESA.AsInteger;
  QMTareaMatDetID_TAREA.AsInteger := QMTareaMatCabID_TAREA.AsInteger;
  QMTareaMatDetFECHA.AsDateTime := REntorno.FechaTrabSH;
end;

procedure TProDMOrdTareaMat.QMTareaMatDetDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(ProDMordTareaMat.QMTareaMatDetARTICULO.AsString);
end;

procedure TProDMOrdTareaMat.QMTareaMatDetDescOperarioGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEmpleado(ProDMOrdTareaMat.QMTareaMatDetOPERARIO.AsInteger);
end;

procedure TProDMOrdTareaMat.QMTareaMatCabAfterScroll(DataSet: TDataSet);
begin
  RefrescaTareasAbiertas;

  QMTareaMatCabDescFase.AsString := xTareasAbiertasTITULO_FASE.AsString;
end;

procedure TProDMOrdTareaMat.QMTareaMatDetOPERARIOChange(Sender: TField);
begin
  QMTareaMatDetDescOperario.AsString := DameTituloEmpleado(ProDMOrdTareaMat.QMTareaMatDetOPERARIO.AsInteger);
end;

procedure TProDMOrdTareaMat.QMTareaMatDetARTICULOChange(Sender: TField);
begin
  QMTareaMatDetDescArticulo.AsString := DameTituloArticulo(ProDMordTareaMat.QMTareaMatDetARTICULO.AsString);
end;

procedure TProDMOrdTareaMat.QMTareaMatCabID_ORDENChange(Sender: TField);
begin
  xOrden.Close;
  xOrden.Open;
end;

procedure TProDMOrdTareaMat.RefrescaTareasAbiertas;
begin
  with xTareasAbiertas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['IDENTIFICADOR'].AsInteger := QMTareaMatCabID_TAREA.AsInteger;
     Open;
  end;
end;

procedure TProDMOrdTareaMat.QMTareaMatCabBeforeClose(DataSet: TDataSet);
begin
  QMTareaMatDet.Close;
  xOrden.Close;
end;

procedure TProDMOrdTareaMat.QMTareaMatDetBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM PRO_ORD_TAREA_MAT_DET WHERE ID_TAREA = :ID_TAREA';
        Params.ByName['ID_TAREA'].AsInteger := QMTareaMatCabID_TAREA.AsInteger;
        ExecQuery;
        QMTareaMatDetLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
