unit UIsoDMPlanning;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDataSetRO, UFIBModificados;

type
  TIsoDMPlanning = class(TDataModule)
     TLocal: TFIBTransaction;
     QMCabPlanning: TFIBTableSet;
     DSCabPlanning: TDataSource;
     DSDetPlanning: TDataSource;
     QMDetPlanning: TFIBTableSet;
     QMCabPlanningEMPRESA: TIntegerField;
     QMCabPlanningEJERCICIO: TIntegerField;
     QMCabPlanningRIG: TIntegerField;
     QMCabPlanningFECHA: TDateTimeField;
     QMCabPlanningNOTAS: TBlobField;
     QMCabPlanningTOTAL_COSTE: TFloatField;
     QMCabPlanningISO_APROBADO: TIntegerField;
     QMCabPlanningISO_VERIFICADO: TIntegerField;
     QMCabPlanningISO_VALIDADO: TIntegerField;
     QMCabPlanningENTRADA: TIntegerField;
     QMDetPlanningEMPRESA: TIntegerField;
     QMDetPlanningEJERCICIO: TIntegerField;
     QMDetPlanningRIG: TIntegerField;
     QMDetPlanningLINEA: TIntegerField;
     QMDetPlanningACCION: TFIBStringField;
     QMDetPlanningIMPARTIDOR: TFIBStringField;
     QMDetPlanningCOSTE: TFloatField;
     QMCabPlanningDESCRIPCION: TFIBStringField;
     QMDetPlanningFECHA: TDateTimeField;
     frPlanning: TfrHYReport;
     frDBCabPlanning: TfrDBDataSet;
     frDBDetPlanning: TfrDBDataSet;
     QMDetPlanningEVALUACION: TIntegerField;
     xDescCurso: TFIBDataSetRO;
     QMDetPlanningFECHA_INICIO: TDateTimeField;
     QMDetPlanningFECHA_FIN: TDateTimeField;
     QMDetPlanningID_CURSO: TIntegerField;
     QMDetPlanningDescCurso: TStringField;
     xDescCursoDESCRIPCION: TFIBStringField;
     xDescCursoPROFESOR: TFIBStringField;
     QMRelEmplCursos: TFIBTableSet;
     DSQMRelEmplCursos: TDataSource;
     QMRelEmplCursosEMPRESA: TIntegerField;
     QMRelEmplCursosEJERCICIO: TIntegerField;
     QMRelEmplCursosID_CURSO: TIntegerField;
     QMRelEmplCursosID_EMPLEADO: TIntegerField;
     xDescEmpleado: TFIBDataSetRO;
     xDescEmpleadoTITULO: TFIBStringField;
     QMRelEmplCursosDescEmpleado: TStringField;
     QMRelEmplCursosAPTO: TIntegerField;
     QMRelEmplCursosDescApto: TStringField;
     xDescResultados: TFIBDataSetRO;
     xDescResultadosNOMBRE: TFIBStringField;
     QMRelEmplCursosRIG_DET: TIntegerField;
     QMRelEmplCursosLINEA_DET: TIntegerField;
     frDBRelEmplCurso: TfrDBDataSet;
     TUpdate: THYTransaction;
     QMCabPlanningID_CAB_PLANNING: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabPlanningNewRecord(DataSet: TDataSet);
     procedure QMCabPlanningBeforePost(DataSet: TDataSet);
     procedure QMCabPlanningAfterOpen(DataSet: TDataSet);
     procedure QMDetPlanningNewRecord(DataSet: TDataSet);
     procedure frPlanningGetValue(const ParName: string; var ParValue: variant);
     procedure QMDetPlanningID_CURSOChange(Sender: TField);
     procedure QMDetPlanningDescCursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRelEmplCursosNewRecord(DataSet: TDataSet);
     procedure QMDetPlanningAfterOpen(DataSet: TDataSet);
     procedure QMRelEmplCursosID_EMPLEADOChange(Sender: TField);
     procedure QMRelEmplCursosDescEmpleadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRelEmplCursosAPTOChange(Sender: TField);
     procedure QMRelEmplCursosDescAptoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabPlanningBeforeClose(DataSet: TDataSet);
     procedure QMDetPlanningBeforeClose(DataSet: TDataSet);
     procedure frPlanningEnterRect(Memo: TStringList; View: TfrView);
     procedure QMRelEmplCursosBeforeInsert(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMPlanning : TIsoDMPlanning;

implementation

uses UDMMain, UEntorno, UFormGest, UFBusca, UDMListados, UUtiles;

{$R *.dfm}

procedure TIsoDMPlanning.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabPlanning, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetPlanning, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMRelEmplCursos, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMCabPlanning, '11000');
end;

procedure TIsoDMPlanning.QMCabPlanningNewRecord(DataSet: TDataSet);
begin
  QMCabPlanningEMPRESA.AsInteger := REntorno.Empresa;
  QMCabPlanningEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabPlanningENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TIsoDMPlanning.QMCabPlanningBeforePost(DataSet: TDataSet);
begin
  // S'incrementa el contador
  if (DataSet.State = dsInsert) then
     QMCabPlanningRIG.AsInteger := DMMain.Contador_EE('ISP');

  DMMain.Contador_Gen(DataSet, 'ID_CAB_PLANNINGS', 'ID_CAB_PLANNING');
end;

procedure TIsoDMPlanning.QMCabPlanningAfterOpen(DataSet: TDataSet);
begin
  QMDetPlanning.Open;
end;

procedure TIsoDMPlanning.QMDetPlanningNewRecord(DataSet: TDataSet);
begin
  QMDetPlanningEMPRESA.AsInteger := QMCabPlanningEMPRESA.AsInteger;
  QMDetPlanningEJERCICIO.AsInteger := QMCabPlanningEJERCICIO.AsInteger;
  QMDetPlanningRIG.AsInteger := QMCabPlanningRIG.AsInteger;

  // Obtenemos siguiente numero de linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM ISO_DET_PLANNING WHERE EMPRESA=:EMPRESA  AND EJERCICIO=:EJERCICIO AND RIG=:RIG';
        Params.ByName['EMPRESA'].AsInteger := QMCabPlanningEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabPlanningEJERCICIO.AsInteger;
        Params.ByName['RIG'].AsInteger := QMCabPlanningRIG.AsInteger;
        ExecQuery;
        QMDetPlanningLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMPlanning.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabPlanning, '11000');
end;

procedure TIsoDMPlanning.frPlanningGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

procedure TIsoDMPlanning.QMDetPlanningID_CURSOChange(Sender: TField);
begin
  xDescCurso.Close;
  xDescCurso.Open;

  QMDetPlanningDescCurso.AsString := xDescCursoDESCRIPCION.AsString;
  QMDetPlanningIMPARTIDOR.AsString := xDescCursoPROFESOR.AsString;
end;

procedure TIsoDMPlanning.QMDetPlanningDescCursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescCurso.Close;
  xDescCurso.Open;

  Text := xDescCursoDESCRIPCION.AsString;
end;

procedure TIsoDMPlanning.QMRelEmplCursosNewRecord(DataSet: TDataSet);
begin
  QMRelEmplCursosEMPRESA.AsInteger := QMDetPlanningEMPRESA.AsInteger;
  QMRelEmplCursosEJERCICIO.AsInteger := QMDetPlanningEJERCICIO.AsInteger;
  QMRelEmplCursosRIG_DET.AsInteger := QMDetPlanningRIG.AsInteger;
  QMRelEmplCursosLINEA_DET.AsInteger := QMDetPlanningLINEA.AsInteger;
  QMRelEmplCursosID_CURSO.AsInteger := QMDetPlanningID_CURSO.AsInteger;
  QMRelEmplCursosAPTO.AsInteger := 0;
end;

procedure TIsoDMPlanning.QMDetPlanningAfterOpen(DataSet: TDataSet);
begin
  QMRelEmplCursos.Close;
  QMRelEmplCursos.Open;
end;

procedure TIsoDMPlanning.QMRelEmplCursosID_EMPLEADOChange(Sender: TField);
begin
  xDescEmpleado.Close;
  xDescEmpleado.Open;

  QMRelEmplCursosDescEmpleado.AsString := xDescEmpleadoTITULO.AsString;
end;

procedure TIsoDMPlanning.QMRelEmplCursosDescEmpleadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescEmpleado.Close;
  xDescEmpleado.Open;

  Text := xDescEmpleadoTITULO.AsString;
end;

procedure TIsoDMPlanning.QMRelEmplCursosAPTOChange(Sender: TField);
begin
  xDescResultados.Close;
  xDescResultados.Open;

  QMRelEmplCursosDescApto.AsString := xDescResultadosNOMBRE.AsString;
end;

procedure TIsoDMPlanning.QMRelEmplCursosDescAptoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescResultados.Close;
  xDescResultados.Open;

  Text := xDescResultadosNOMBRE.AsString;
end;

procedure TIsoDMPlanning.QMCabPlanningBeforeClose(DataSet: TDataSet);
begin
  QMDetPlanning.Close;
end;

procedure TIsoDMPlanning.QMDetPlanningBeforeClose(DataSet: TDataSet);
begin
  QMRelEmplCursos.Close;
end;

procedure TIsoDMPlanning.frPlanningEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TIsoDMPlanning.QMRelEmplCursosBeforeInsert(DataSet: TDataSet);
begin
  if (QMDetPlanningID_CURSO.AsInteger = 0) then
  begin
     raise Exception.Create(_('No hay curso para asociar este empleado'));
  end;
end;

end.
