unit UProDMMarcajesMaq;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDataSetRO, DB, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBTableDataSet, Math;

type
  TProDMMarcajesMaq = class(TDataModule)
     QMProCabMarca: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMProCabMarca: TDataSource;
     QMProDetMarca: TFIBTableSet;
     DSQMProDetMarca: TDataSource;
     QMProCabMarcaEMPRESA: TIntegerField;
     QMProCabMarcaEJERCICIO: TIntegerField;
     QMProCabMarcaCANAL: TIntegerField;
     QMProCabMarcaSERIE: TFIBStringField;
     QMProCabMarcaTIPO: TFIBStringField;
     QMProCabMarcaRIG: TIntegerField;
     QMProCabMarcaOPERARIO: TIntegerField;
     QMProCabMarcaMAQUINA: TIntegerField;
     QMProCabMarcaPROVEEDOR: TIntegerField;
     QMProCabMarcaFECHA: TDateTimeField;
     QMProCabMarcaTIEMPO_TOT: TFloatField;
     QMProCabMarcaRIG_OFF: TIntegerField;
     QMProDetMarcaEMPRESA: TIntegerField;
     QMProDetMarcaEJERCICIO: TIntegerField;
     QMProDetMarcaCANAL: TIntegerField;
     QMProDetMarcaSERIE: TFIBStringField;
     QMProDetMarcaTIPO: TFIBStringField;
     QMProDetMarcaRIG: TIntegerField;
     QMProDetMarcaLINEA: TIntegerField;
     QMProDetMarcaRIG_OF: TIntegerField;
     QMProDetMarcaSUBORDEN: TIntegerField;
     QMProDetMarcaLINEA_FASE: TIntegerField;
     QMProDetMarcaLINEA_TAREA: TIntegerField;
     QMProDetMarcaFECHA_PREV: TDateTimeField;
     QMProDetMarcaFECHA_REAL: TDateTimeField;
     QMProDetMarcaNUM_REF_SAL: TIntegerField;
     QMProDetMarcaHORA_INICIO: TFloatField;
     QMProDetMarcaHORA_FIN: TFloatField;
     QMProDetMarcaTIEMPO: TFloatField;
     QMProDetMarcaPRECIO_RECURSO: TFloatField;
     QMProDetMarcaTIPO_RECURSO: TFIBStringField;
     QMProDetMarcaUNIDADES_FAB: TFloatField;
     QMProDetMarcaUNIDADES_DEFECTUOSAS: TFloatField;
     QMProDetMarcaESTADO: TIntegerField;
     QMProDetMarcaNOTAS: TMemoField;
     QMProDetMarcaTOTAL_RECURSO: TFloatField;
     QMProDetMarcaDescripFase: TStringField;
     QMProDetMarcaDescripTarea: TStringField;
     QMProDetMarcaDescripRec: TStringField;
     xTituloFase: TFIBDataSetRO;
     xTituloFaseFASE: TFIBStringField;
     xTarea: TFIBDataSetRO;
     xTareaTAREA: TFIBStringField;
     QMProCabMarcaDescripMaq: TStringField;
     QMProCabMarcaVARIOS: TFIBStringField;
     QMProDetMarcaIDTAREA: TIntegerField;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QMProDetMarcaIMPUTACION: TFIBStringField;
     xInfoActualizada: TFIBDataSetRO;
     xInfoActualizadaTIEMPO_TOT: TFloatField;
     DSxInfoActualizada: TDataSource;
     QMProDetMarcaTIPO_MARCAJE: TFIBStringField;
     QMProDetMarcaID_ORDEN: TIntegerField;
     QMProDetMarcacOMPUESTO: TStringField;
     xCompuestoOP: TFIBDataSetRO;
     DSCompuestoOP: TDataSource;
     xCompuestoOPCOMPUESTO: TFIBStringField;
     QMProDetMarcaDescCompuesto: TStringField;
     xCompuestoOPTITULO: TFIBStringField;
     QMProDetMarcaTIPO_INCIDENCIA_MAQ: TFIBStringField;
     QMProDetMarcaDescIncidencia: TStringField;
     QMProDetMarcaOPERARIO: TIntegerField;
     QMProDetMarcaTitOperario: TStringField;
     QMProDetMarcaEFICIENCIA: TFloatField;
     QMProDetMarcaMOTIVO: TFIBStringField;
     QMProDetMarcaNO_PRODUCTIVA: TIntegerField;
     QMProCabMarcaI: TFIBTableSet;
     DSQMProCabMarcaI: TDataSource;
     QMProCabMarcaIEMPRESA: TIntegerField;
     QMProCabMarcaIEJERCICIO: TIntegerField;
     QMProCabMarcaICANAL: TIntegerField;
     QMProCabMarcaISERIE: TFIBStringField;
     QMProCabMarcaITIPO: TFIBStringField;
     QMProCabMarcaIRIG: TIntegerField;
     QMProCabMarcaILINEA: TIntegerField;
     QMProCabMarcaICODMAQ: TIntegerField;
     QMProCabMarcaIDESCRIPCION_MAQUINA: TFIBStringField;
     QMProCabMarcaIFECHA_DET: TDateTimeField;
     QMProCabMarcaITIPO_INCIDENCIA: TFIBStringField;
     QMProCabMarcaIDESCRIPCION_TIPO: TFIBStringField;
     QMProCabMarcaIHORA_INICIO: TFloatField;
     QMProCabMarcaIHORA_FIN: TFloatField;
     QMProCabMarcaITIEMPO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProCabMarcaAfterOpen(DataSet: TDataSet);
     procedure QMProDetMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaLINEA_FASEChange(Sender: TField);
     procedure QMProDetMarcaLINEA_TAREAChange(Sender: TField);
     procedure QMProDetMarcaRECURSOChange(Sender: TField);
     procedure QMProCabMarcaNewRecord(DataSet: TDataSet);
     procedure QMProDetMarcaNewRecord(DataSet: TDataSet);
     procedure QMProCabMarcaMAQUINAChange(Sender: TField);
     procedure QMProCabMarcaDescripMaqGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMProDetMarcaID_ORDENChange(Sender: TField);
     procedure QMProDetMarcaTIEMPO_DECChange(Sender: TField);
     procedure QMProDetMarcacOMPUESTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaIDTAREAChange(Sender: TField);
     procedure QMProDetMarcaAfterOpen(DataSet: TDataSet);
     procedure QMProDetMarcaBeforeClose(DataSet: TDataSet);
     procedure QMProCabMarcaBeforeClose(DataSet: TDataSet);
     procedure QMProDetMarcaCalcFields(DataSet: TDataSet);
     procedure QMProCabMarcaIBeforeInsert(DataSet: TDataSet);
     procedure QMProCabMarcaIBeforeEdit(DataSet: TDataSet);
     procedure QMProCabMarcaIBeforeDelete(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraMaquina(filtro: string);
     procedure FiltraIncidencias(Maquina: integer; FechaDesde, FechaHasta: TDateTime; Tipo: string);
  end;

var
  ProDMMarcajesMaq : TProDMMarcajesMaq;

implementation

uses UDMMain, UFBusca, UEntorno, UDameDato;

{$R *.dfm}

procedure TProDMMarcajesMaq.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';

  xInfoActualizadaTIEMPO_TOT.DisplayFormat := '00:00';

  QMProDetMarcaHORA_FIN.DisplayFormat := '00:00';
  QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO_DEC.DisplayFormat := MascaraN;
  QMProDetMarcaPRECIO_RECURSO.DisplayFormat := MascaraN;
  QMProDetMarcaTOTAL_RECURSO.DisplayFormat := MascaraN;
  QMProDetMarcaTIEMPO.DisplayFormat := '00:00';

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM PRO_ORD_CAB_MARCA ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = :EMPRESA AND ');
  SQLBase.Add(' EJERCICIO = :EJERCICIO AND ');
  SQLBase.Add(' CANAL = :CANAL AND ');
  SQLBase.Add(' SERIE = :SERIE AND ');
  SQLBase.Add(' TIPO = :TIPO ');

  QMProCabMarca.Close;
  QMProCabMarca.SelectSQL.Text := SQLBase.Text;
  QMProCabMarca.SelectSQL.Add(' ORDER BY FECHA ');

  QMProCabMarca.Params.ByName['TIPO'].AsString := 'HM';
  DMMain.FiltraTabla(QMProCabMarca, '11110');
end;

procedure TProDMMarcajesMaq.BusquedaCompleja;
begin
  with QMProCabMarca do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11110', False);
     SelectSQL.Add(' AND TIPO = :TIPO ');
     SelectSQL.Add(' ORDER BY FECHA ');
     Params.ByName['TIPO'].AsString := 'HM';
     // Ya viene filtrado EEC harcoded en el SQL. DMMain.FiltraTabla(QMProCabMarca, '11110');
     DMMain.FiltraTabla(QMProCabMarca, '00010');
     Open;
  end;
end;

procedure TProDMMarcajesMaq.QMProCabMarcaAfterOpen(DataSet: TDataSet);
begin
  QMProDetMarca.Open;
  xInfoActualizada.Open;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTituloFase do
  begin
     Close;
     Open;
  end;

  Text := xTituloFaseFase.AsString;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTarea do
  begin
     Close;
     Open;
  end;

  Text := xTareaTAREA.AsString;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);
end;

procedure TProDMMarcajesMaq.QMProDetMarcaLINEA_FASEChange(Sender: TField);
begin
  xTituloFase.Close;
  xTituloFase.Open;
  QMProDetMarcaDescripFase.AsString := xTituloFaseFASE.AsString;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaLINEA_TAREAChange(Sender: TField);
begin
  if ((QMProDetMarca.FieldByName('LINEA_TAREA').AsInteger <> 0) and
     (QMProDetMarca.FieldByName('IDTAREA').AsInteger = 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT IDENTIFICADOR FROM PRO_ORD_TAREA WHERE LINEA_TAREA = :LINEA_TAREA AND ID_ORDEN = :ID_ORDEN AND LINEA_FASE = :LINEA_FASE';
           Params.ByName['LINEA_TAREA'].AsInteger := QMProDetMarcaLINEA_TAREA.AsInteger;
           Params.ByName['LINEA_FASE'].AsInteger := QMProDetMarcaLINEA_FASE.AsInteger;
           Params.ByName['ID_ORDEN'].AsInteger := QMProDetMarcaId_Orden.AsInteger;
           ExecQuery;
           QMProDetMarcaIDTAREA.AsInteger := FieldByName['IDENTIFICADOR'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  xTarea.Close;
  xTarea.Open;
  QMProDetMarcaDescripTarea.AsString := xTareaTAREA.AsString;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaRECURSOChange(Sender: TField);
begin
  QMProDetMarcaDescripRec.Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);
  QMProDetMarcaTIPO_RECURSO.Text := QMProDetMarcaRECURSO.AsString;

  // Busco el precio del recurso
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT IMPORTE FROM PRO_RECURSOS WHERE EMPRESA = :EMPRESA AND RECURSO = :RECURSO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RECURSO'].AsString := QMProDetMarcaRECURSO.AsString;
        ExecQuery;
        QMProDetMarcaPRECIO_RECURSO.AsFloat := FieldByName['IMPORTE'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si se modifica la hora, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTOTAL_RECURSO.AsFloat := QMProDetMarcaPRECIO_RECURSO.AsFloat * QMProDetMarcaTIEMPO_DEC.AsFloat;
end;

procedure TProDMMarcajesMaq.QMProCabMarcaNewRecord(DataSet: TDataSet);
begin
  QMProCabMarcaEMPRESA.AsInteger := REntorno.Empresa;
  QMProCabMarcaEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProCabMarcaCANAL.AsInteger := REntorno.Canal;
  QMProCabMarcaSERIE.AsString := REntorno.Serie;
  QMProCabMarcaFECHA.AsDateTime := REntorno.FechaTrab;
  QMProCabMarcaTipo.AsString := 'HM';
  QMProCabMarcaTIEMPO_TOT.AsFloat := 0;
  QMProCabMarcaOPERARIO.AsInteger := 0;
  QMProCabMarcaRIG.AsInteger := DMMain.Contador_EECS(REntorno.Serie, 'ZMA');
end;

procedure TProDMMarcajesMaq.QMProDetMarcaNewRecord(DataSet: TDataSet);
begin
  QMProDetMarcaEMPRESA.AsInteger := QMProCabMarcaEMPRESA.AsInteger;
  QMProDetMarcaEJERCICIO.AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
  QMProDetMarcaCANAL.AsInteger := QMProCabMarcaCANAL.AsInteger;
  QMProDetMarcaSERIE.AsString := QMProCabMarcaSERIE.AsString;
  QMProDetMarcaRIG.AsInteger := QMProCabMarcaRIG.AsInteger;
  QMProDetMarcaTIPO.AsString := 'HM';
  QMProDetMarcaTIPO_MARCAJE.AsString := '001';
  QMProDetMarcaFECHA_PREV.AsDateTime := REntorno.FechaTrabSH;
  QMProDetMarcaFECHA_REAL.AsDateTime := REntorno.FechaTrabSH;

  // Escojo el primer recurso tipo máquina y le asigno al marcaje
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RECURSO FROM PRO_RECURSOS WHERE TIPORECURSO = ''HM'' ';
        ExecQuery;
        QMProDetMarcaRECURSO.AsString := FieldByName['RECURSO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // nº de linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA) FROM PRO_ORD_DET_MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG');
        Params.ByName['EMPRESA'].AsInteger := QMProCabMarcaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProCabMarcaCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMProCabMarcaSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMProCabMarcaTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMProCabMarcaRIG.AsInteger;
        ExecQuery;
        QMProDetMarcaLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProDetMarcaUNIDADES_FAB.AsFloat := 0;
  QMProDetMarcaESTADO.AsInteger := 0;
  QMProDetMarcaHORA_INICIO.AsFloat := 0000;
  QMProDetMarcaHORA_FIN.AsFloat := 0000;
  QMProDetMarcaOPERARIO.AsInteger := QMProCabMarcaOPERARIO.AsInteger;
  QMProDetMarcaEFICIENCIA.AsInteger := 0;
end;

procedure TProDMMarcajesMaq.QMProCabMarcaMAQUINAChange(Sender: TField);
begin
  QMProCabMarcaDescripMaq.Text := DameTituloMaquina(QMProCabMarcaMAQUINA.AsInteger);
end;

procedure TProDMMarcajesMaq.QMProCabMarcaDescripMaqGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloMaquina(QMProCabMarcaMAQUINA.AsInteger);
end;

procedure TProDMMarcajesMaq.QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaq.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  // Actualitzo el temps total de la capçalera
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaID_ORDENChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUBORDEN FROM PRO_ORD ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_ORDEN = :ID_ORDEN ');
           Params.ByName['ID_ORDEN'].AsInteger := QMProDetMarcaID_ORDEN.AsInteger;
           ExecQuery;
           QMProDetMarcaSUBORDEN.AsInteger := FieldByName['SUBORDEN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaTIEMPO_DECChange(Sender: TField);
begin
  // Si se modifica la hora final, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaq.FiltraMaquina(filtro: string);
begin
  with QMProCabMarca do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM PRO_ORD_CAB_MARCA WHERE ' + filtro;
     Open;
  end;
end;

procedure TProDMMarcajesMaq.QMProDetMarcacOMPUESTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xCompuestoOP.Close;
  xCompuestoOP.Open;

  Text := xCompuestoOPCOMPUESTO.AsString;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaDescCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xCompuestoOP.Close;
  xCompuestoOP.Open;

  Text := xCompuestoOPTITULO.AsString;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaIDTAREAChange(Sender: TField);
begin
  if (QMProDetMarca.FieldByName('IDTAREA').AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ESTADO, ID_ORDEN, RIG_OF, LINEA_FASE, LINEA_TAREA FROM PRO_ORD_TAREA WHERE IDENTIFICADOR = :IDENTIFICADOR';
           Params.ByName['IDENTIFICADOR'].AsInteger := QMProDetMarcaIDTAREA.AsInteger;
           ExecQuery;
           if (FieldByName['ESTADO'].AsInteger = 0) then
           begin
              QMProDetMarcaID_ORDEN.AsInteger := FieldByName['ID_ORDEN'].AsInteger;
              QMProDetMarcaRIG_OF.AsInteger := FieldByName['RIG_OF'].AsInteger;
              QMProDetMarcaLINEA_FASE.AsInteger := FieldByName['LINEA_FASE'].AsInteger;
              QMProDetMarcaLINEA_TAREA.AsInteger := FieldByName['LINEA_TAREA'].AsInteger;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaAfterOpen(DataSet: TDataSet);
begin
  xTituloFase.Open;
  xTarea.Open;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaBeforeClose(DataSet: TDataSet);
begin
  xTituloFase.Close;
  xTarea.Close;
end;

procedure TProDMMarcajesMaq.QMProCabMarcaBeforeClose(DataSet: TDataSet);
begin
  QMProDetMarca.Close;
  xInfoActualizada.Close;
end;

procedure TProDMMarcajesMaq.QMProDetMarcaCalcFields(DataSet: TDataSet);
begin
  QMProDetMarcaTitOperario.AsString := DameTituloEmpleado(QMProDetMarca.FieldByName('OPERARIO').AsInteger);

  if (QMProDetMarcaTIPO_INCIDENCIA_MAQ.AsString > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DESCRIPCION FROM SYS_TIPO_INCIDENCIAS_MAQ WHERE TIPO = ?TIPO';
           Params.ByName['TIPO'].AsString := QMProDetMarca.FieldByName('TIPO_INCIDENCIA_MAQ').AsString;
           ExecQuery;
           QMProDetMarcaDescIncidencia.AsString := FieldByName['DESCRIPCION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMProDetMarcaDescIncidencia.AsString := '';
end;

procedure TProDMMarcajesMaq.FiltraIncidencias(Maquina: integer; FechaDesde, FechaHasta: TDateTime; Tipo: string);
begin
  with QMProCabMarcaI do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, D.LINEA, M.CODMAQ, M.DESCRIPCION AS DESCRIPCION_MAQUINA, ');
     SelectSQL.Add('        D.FECHA_DET, I.TIPO TIPO_INCIDENCIA, I.DESCRIPCION AS DESCRIPCION_TIPO, D.HORA_INICIO, D.HORA_FIN, D.TIEMPO ');
     SelectSQL.Add(' FROM PRO_ORD_CAB_MARCA C ');
     SelectSQL.Add(' JOIN PRO_ORD_DET_MARCA D ON (C.EMPRESA = D.EMPRESA AND C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.SERIE = D.SERIE AND C.TIPO = D.TIPO AND C.RIG = D.RIG) ');
     SelectSQL.Add(' JOIN SYS_TIPO_INCIDENCIAS_MAQ I ON (I.TIPO = D.TIPO_INCIDENCIA_MAQ) ');
     SelectSQL.Add(' JOIN PRO_MAQUINAS_C M ON (M.CODMAQ = C.MAQUINA) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.CANAL = :CANAL AND ');
     SelectSQL.Add(' C.TIPO = ''HM'' AND ');
     SelectSQL.Add(' D.TIPO_INCIDENCIA_MAQ <> '''' ');
     if (Maquina > 0) then
        SelectSQL.Add(' AND M.CODMAQ = ?MAQUINA ');
     if (FechaDesde > 0) and (FechaHasta > 0) then
        SelectSQL.Add(' AND D.FECHA_DET BETWEEN ?FECHA_DESDE AND ?FECHA_HASTA ')
     else
     if (FechaDesde > 0) then
        SelectSQL.Add(' AND D.FECHA_DET >= ?FECHA_DESDE ')
     else
     if (FechaHasta > 0) then
        SelectSQL.Add(' AND D.FECHA_DET <= ?FECHA_HASTA ');
     if (Tipo <> '') then
        SelectSQL.Add(' AND I.TIPO = ?TIPO ');

     SelectSQL.Add(' ORDER BY D.FECHA_DET ');
     DMMain.Log(SelectSQL.Text);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Maquina > 0) then
        Params.ByName['MAQUINA'].AsInteger := Maquina;
     if (FechaDesde > 0) and (FechaHasta > 0) then
     begin
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     end
     else
     if (FechaDesde > 0) then
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde
     else
     if (FechaHasta > 0) then
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     if (Tipo <> '') then
        Params.ByName['TIPO'].AsString := TIPO;

     Open;
  end;
end;

procedure TProDMMarcajesMaq.QMProCabMarcaIBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TProDMMarcajesMaq.QMProCabMarcaIBeforeEdit(DataSet: TDataSet);
begin
  Abort;
end;

procedure TProDMMarcajesMaq.QMProCabMarcaIBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

end.
