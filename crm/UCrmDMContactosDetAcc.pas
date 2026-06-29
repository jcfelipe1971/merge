unit UCrmDMContactosDetAcc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TCrmDMContactosDetAcc = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMAccionesDet: TDataSource;
     QMAccionesDet: TFIBTableSet;
     QMAccionesDetID_ACCION_DET: TIntegerField;
     QMAccionesDetID_ACCION: TIntegerField;
     QMAccionesDetORDEN: TIntegerField;
     QMAccionesDetFECHA: TDateTimeField;
     QMAccionesDetHORA_ACCION: TFIBStringField;
     QMAccionesDetNOTAS: TBlobField;
     QMAccionesDetID_CONTACTO: TIntegerField;
     QMAccionesDetLINEA_CAB: TIntegerField;
     QMAccionesDetFIN_SEG: TIntegerField;
     QMAccionesDetID_SEG_SIGUIENTE: TIntegerField;
     QMAccionesDetFECHA_SEG_SIGUIENTE: TDateTimeField;
     QMAccionesDetTIPO_SEG: TFIBStringField;
     QMAccionesDetDESCRIPCION_SEGUIMIENTO: TFIBStringField;
     QMAccionesDetPROGRESO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAccionesDetNewRecord(DataSet: TDataSet);
     procedure QMAccionesDetBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     id_accion, id_accion_det: integer;
  public
     { Public declarations }
     procedure Mostrar(aid_accion, aid_accion_det: integer);
  end;

var
  CrmDMContactosDetAcc : TCrmDMContactosDetAcc;

implementation

uses UDMMain, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TCrmDMContactosDetAcc.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TCrmDMContactosDetAcc.Mostrar(aid_accion, aid_accion_det: integer);
begin
  /// Filtro el seguimiento segun ID_ACCION_DET
  /// Si hay registro, edito, de lo contrario inserto.

  id_accion := aid_accion;
  id_accion_det := aid_accion_det;

  with QMAccionesDet do
  begin
     Close;
     Params.ByName['ID_ACCION_DET'].AsInteger := id_accion_det;
     Open;

     if (EOF) then
        Insert
     else
        Edit;
  end;
end;

procedure TCrmDMContactosDetAcc.QMAccionesDetNewRecord(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add('SELECT A.ID_CONTACTO, A.LINEA, S.TIPO_SEG FROM CRM_CONTACTOS_ACCIONES A ');
        SQL.Add('LEFT JOIN CRM_SYS_ACCIONES S ');
        SQL.Add('ON S.ACCION = A.TIPO_ACCION ');
        SQL.Add('WHERE A.ID_ACCION = ' + IntToStr(id_accion));
        ExecQuery;
        QMAccionesDetID_CONTACTO.AsInteger := FieldByName['ID_CONTACTO'].AsInteger;
        QMAccionesDetLINEA_CAB.AsInteger := FieldByName['LINEA'].AsInteger;
        QMAccionesDetTIPO_SEG.AsString := FieldByName['TIPO_SEG'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMAccionesDetID_ACCION.AsInteger := id_accion;
  QMAccionesDetID_ACCION_DET.AsInteger := 0;
  QMAccionesDetFECHA.AsDateTime := REntorno.FechaTrabSH;
  QMAccionesDetHORA_ACCION.AsString := TimeToStr(Time);
  QMAccionesDetFIN_SEG.AsInteger := 0;
  QMAccionesDetORDEN.AsInteger := 0;
end;

procedure TCrmDMContactosDetAcc.QMAccionesDetBeforePost(DataSet: TDataSet);
begin
  if (QMAccionesDet.State = dsInsert) then
  begin
     id_accion_det := DMMain.Contador_Gen(QMAccionesDet, 'CRM_ACCIONES_DET', 'ID_ACCION_DET', False);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add('SELECT MAX(ORDEN) FROM CRM_CONTACTOS_ACCIONES_DET');
           SQL.Add('WHERE ID_ACCION = ' + IntToStr(id_accion));
           ExecQuery;
           QMAccionesDetORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
