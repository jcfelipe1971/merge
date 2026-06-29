unit UProDMRecursoEmp;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TProDMRecursoEmp = class(TDataModule)
     DSQMProRecursos: TDataSource;
     TLocal: THYTransaction;
     QMProRecursos: TFIBTableSet;
     DSQMProRecPre: TDataSource;
     QMProRecursosEMPRESA: TIntegerField;
     QMProRecursosTITULO: TFIBStringField;
     QMProRecursosUNIDAD: TFIBStringField;
     QMProRecursosTIPORECURSO: TFIBStringField;
     QMProRecursosIMPORTE: TFloatField;
     xRecurso: TFIBDataSetRO;
     xTipoUnidad: TFIBDataSetRO;
     QMProRecPre: TFIBTableSet;
     QMProRecPreEMPRESA: TIntegerField;
     QMProRecPrePRECIO_EST: TFloatField;
     QMProRecPrePRECIO_REA: TFloatField;
     QMProRecPreFECHA_INI: TDateTimeField;
     QMProRecPreFECHA_FIN: TDateTimeField;
     xRecursoTITULO: TFIBStringField;
     QMProRecursosDescRecurso: TStringField;
     xTipoUnidadTITULO: TFIBStringField;
     QMProRecursosDescUnidad: TStringField;
     QMProRecursosRECURSO: TFIBStringField;
     QMProRecPreRECURSO: TFIBStringField;
     xRecursoRECURSO: TFIBStringField;
     QMProRecursosPLANIFICABLE: TIntegerField;
     QMProRecursosPORCEN_CAPACIDAD: TFloatField;
     QMProRecursosID_HORARIO: TFIBStringField;
     xHorarios: TFIBDataSetRO;
     DSxHorarios: TDataSource;
     xHorariosHORARIO: TFIBStringField;
     xHorariosDESCRIPCION: TFIBStringField;
     QMProRecursosID_RECURSO: TIntegerField;
     QMProRecursosOPERACIONES_NUM: TIntegerField;
     QMProRecursosOPERACIONES_TIEMPO: TIntegerField;
     QMProRecursosImporteOperacion: TFloatField;
     frProRecursos: TfrHYReport;
     frDBLstRecursos: TfrDBDataSet;
     QMProRecursosFASES: TFIBStringField;
     QMProRecursosDescFase: TStringField;
     QMProRecursosCODMAQ: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProRecursosBeforePost(DataSet: TDataSet);
     procedure DSQMProRecPreStateChange(Sender: TObject);
     procedure QMProRecPreNewRecord(DataSet: TDataSet);
     procedure QMProRecursosAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMProRecursosDescRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProRecursosDescUnidadGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProRecursosID_HORARIOChange(Sender: TField);
     procedure QMProRecursosImporteOperacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProRecursosNewRecord(DataSet: TDataSet);
     procedure QMProRecursosDescFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
  end;

var
  ProDMRecursoEmp : TProDMRecursoEmp;

implementation

uses UDMMain, UEntorno, UFBusca, UDameDato;

{$R *.dfm}

procedure TProDMRecursoEmp.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProRecursos, '10000');
end;

procedure TProDMRecursoEmp.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProRecursosIMPORTE.DisplayFormat := MascaraN;
  QMProRecPrePRECIO_EST.DisplayFormat := MascaraN;
  QMProRecPrePRECIO_REA.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMProRecursos, '10000', True);
  // QMProRecursos.Open;
end;

procedure TProDMRecursoEmp.QMProRecursosBeforePost(DataSet: TDataSet);
begin
  QMProRecursos.FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
end;

procedure TProDMRecursoEmp.DSQMProRecPreStateChange(Sender: TObject);
begin
  if QMProRecPre.State = dsInsert then
  begin
     QMProRecPrePRECIO_EST.Value := QMProRecursosIMPORTE.Value;
     QMProRecPrePRECIO_REA.Value := QMProRecursosIMPORTE.Value;
  end;
end;

procedure TProDMRecursoEmp.QMProRecPreNewRecord(DataSet: TDataSet);
begin
  QMProRecPreEMPRESA.Value := REntorno.Empresa;
  QMProRecPreRECURSO.Value := QMProRecursosRECURSO.Value;
end;

procedure TProDMRecursoEmp.QMProRecursosAfterOpen(DataSet: TDataSet);
begin
  QMProRecPre.Open;
  xHorarios.Open;
end;

procedure TProDMRecursoEmp.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMRecursoEmp.QMProRecursosDescRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xRecurso.Close;
  xRecurso.Open;

  Text := xRecursoTITULO.AsString;
end;

procedure TProDMRecursoEmp.QMProRecursosDescUnidadGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xTipoUnidad.Close;
  xTipoUnidad.Open;

  Text := xTipoUnidadTITULO.AsString;
end;

procedure TProDMRecursoEmp.QMProRecursosID_HORARIOChange(Sender: TField);
begin
  xHorarios.Close;
  xHorarios.Open;
end;

procedure TProDMRecursoEmp.QMProRecursosImporteOperacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMProRecursosOPERACIONES_NUM.AsInteger <> 0) then
     Text := FormatFloat(',##0.00000',
        (QMProRecursosIMPORTE.AsFloat * QMProRecursosOPERACIONES_TIEMPO.AsInteger) /
        (3600 * QMProRecursosOPERACIONES_NUM.AsInteger))
  else
     Text := FormatFloat(',##0.00000', 0);
end;

procedure TProDMRecursoEmp.QMProRecursosNewRecord(DataSet: TDataSet);
begin
  QMProRecursosOPERACIONES_NUM.AsInteger := 1;
  QMProRecursosOPERACIONES_TIEMPO.AsInteger := 3600;
end;

procedure TProDMRecursoEmp.QMProRecursosDescFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloFase(QMProRecursosFASES.AsString);
end;

end.
