unit UProDMMarcajesTe;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDataSetRO, DB, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBTableDataSet, Math;

type
  TProDMMarcajesTe = class(TDataModule)
     QMProCabMarca: TFIBTableSet;
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
     TLocal: THYTransaction;
     DSQMProCabMarca: TDataSource;
     QMProDetMarca: TFIBTableSet;
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
     QMProDetMarcaUNIDADES_FAB: TFloatField;
     QMProDetMarcaUNIDADES_DEFECTUOSAS: TFloatField;
     QMProDetMarcaESTADO: TIntegerField;
     QMProDetMarcaNOTAS: TMemoField;
     QMProDetMarcaTOTAL_RECURSO: TFloatField;
     QMProDetMarcaDescripFase: TStringField;
     QMProDetMarcaDescripTarea: TStringField;
     QMProDetMarcaDescripRec: TStringField;
     DSQMProDetMarca: TDataSource;
     DSxTituloFase: TDataSource;
     xTarea: TFIBDataSetRO;
     xTareaTAREA: TFIBStringField;
     DSxTarea: TDataSource;
     xTituloFase: TFIBDataSetRO;
     xTituloFaseFASE: TFIBStringField;
     QMProCabMarcaDESC_PROVEEDOR: TStringField;
     QMProCabMarcaVARIOS: TFIBStringField;
     xSubOrden: TFIBDataSetRO;
     xSubOrdenSUBORDEN: TIntegerField;
     DSxSubOrden: TDataSource;
     QMProDetMarcaIDTAREA: TIntegerField;
     xDatosTarea: TFIBDataSetRO;
     xDatosTareaEMPRESA: TIntegerField;
     xDatosTareaEJERCICIO: TIntegerField;
     xDatosTareaCANAL: TIntegerField;
     xDatosTareaSERIES: TFIBStringField;
     xDatosTareaRIG_OF: TIntegerField;
     xDatosTareaSUBORDEN: TIntegerField;
     xDatosTareaLINEA_FASE: TIntegerField;
     xDatosTareaLINEA_TAREA: TIntegerField;
     xDatosTareaTAREA: TFIBStringField;
     xDatosTareaORDEN: TIntegerField;
     xDatosTareaTIPOTAREA: TFIBStringField;
     xDatosTareaCOMENTARIO: TMemoField;
     xDatosTareaRECURSO: TFIBStringField;
     xDatosTareaCANTIDAD: TFloatField;
     xDatosTareaPRE_COS_UNI_PRE: TFloatField;
     xDatosTareaTOTAL_VAR_PRE: TFloatField;
     xDatosTareaPRECIO_FIJO_PRE: TFloatField;
     xDatosTareaTOTAL_PRE: TFloatField;
     xDatosTareaPRE_COS_UNI_REAL: TFloatField;
     xDatosTareaTOTAL_VAR_REAL: TFloatField;
     xDatosTareaPRECIO_FIJO_REAL: TFloatField;
     xDatosTareaTOTAL_REAL: TFloatField;
     xDatosTareaESTADO: TIntegerField;
     xDatosTareaIDENTIFICADOR: TIntegerField;
     DSxDatosTarea: TDataSource;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaTIPO_RECURSO: TFIBStringField;
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QMProDetMarcaTIPO_MARCAJE: TFIBStringField;
     QMProDetMarcaIMPUTACION: TFIBStringField;
     QMProDetMarcaTIPOFASE: TFIBStringField;
     QMProDetMarcaTIPOTAREA: TFIBStringField;
     QMProDetMarcaNUEVA_TAREA: TIntegerField;
     QMProDetMarcaENTRADA: TIntegerField;
     QMProDetMarcaCANTIDAD: TFloatField;
     QMProDetMarcaID_ORDEN: TIntegerField;
     xDatosTareaID_ORDEN: TIntegerField;
     xInfoActualizada: TFIBDataSetRO;
     xInfoActualizadaTIEMPO_TOT: TFloatField;
     DSxInfoActualizada: TDataSource;
     TUpdate: THYTransaction;
     QMProCabMarcaID_ORDEN: TIntegerField;
     QMProCabMarcaTIPOFASE: TFIBStringField;
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
     procedure QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
     procedure QMProCabMarcaDESC_PROVEEDORGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProCabMarcaPROVEEDORChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMProDetMarcaRIG_OFChange(Sender: TField);
     procedure QMProDetMarcaTIEMPO_DECChange(Sender: TField);
     procedure QMProDetMarcaID_ORDENChange(Sender: TField);
     procedure QMProCabMarcaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraTE(filtro: string);
  end;

var
  ProDMMarcajesTe : TProDMMarcajesTe;

implementation

uses UDMMain, UEntorno, UFBusca, UDameDato;

{$R *.dfm}

procedure TProDMMarcajesTe.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';

  xInfoActualizadaTIEMPO_TOT.DisplayFormat := '00:00';

  QMProDetMarcaHORA_FIN.DisplayFormat := '00:00';
  QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO.DisplayFormat := '00:00';
  QMProDetMarcaPRECIO_RECURSO.DisplayFormat := MascaraN;
  QMProDetMarcaTOTAL_RECURSO.DisplayFormat := MascaraN;
  QMProDetMarcaTIEMPO_DEC.DisplayFormat := MascaraN;

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

  QMProCabMarca.Params.ByName['TIPO'].AsString := 'TTE';
  DMMain.FiltraTabla(QMProCabMarca, '11110');
end;

procedure TProDMMarcajesTe.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11100', False);
  with QMProCabMarca.SelectSQL do
     Text := StringReplace(UpperCase(Text), 'ORDER', 'AND TIPO = ''TE'' ORDER',
        [rfReplaceAll, rfIgnoreCase]);
  QMProCabMarca.Open;
end;

procedure TProDMMarcajesTe.QMProCabMarcaAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMProDetMarca.Open;
end;

procedure TProDMMarcajesTe.QMProDetMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTituloFase do
  begin
     Close;
     Open;
  end;
  Text := xTituloFaseFase.Value;
end;

procedure TProDMMarcajesTe.QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTarea do
  begin
     Close;
     Open;
  end;
  Text := xTareaTarea.Value;
end;

procedure TProDMMarcajesTe.QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);
end;

procedure TProDMMarcajesTe.QMProDetMarcaLINEA_FASEChange(Sender: TField);
begin
  xTituloFase.Close;
  xTituloFase.Open;
  QMProDetMarcaDescripFase.Text := xTituloFaseFase.Value;
end;

procedure TProDMMarcajesTe.QMProDetMarcaLINEA_TAREAChange(Sender: TField);
begin
  xTarea.Close;
  xTarea.Open;
  QMProDetMarcaDescripTarea.Text := xTareaTarea.Value;
end;

procedure TProDMMarcajesTe.QMProDetMarcaRECURSOChange(Sender: TField);
begin
  QMProDetMarcaDescripRec.Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);
  QMProDetMarcaTIPO_RECURSO.Text := QMProDetMarcaRECURSO.AsString;

  QMProDetMarcaPRECIO_RECURSO.AsFloat := 0;

  //Si se modifica la hora, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesTe.QMProCabMarcaNewRecord(DataSet: TDataSet);
begin
  QMProCabMarcaEMPRESA.AsInteger := REntorno.Empresa;
  QMProCabMarcaEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProCabMarcaCANAL.AsInteger := REntorno.Canal;
  QMProCabMarcaSERIE.AsString := REntorno.Serie;
  QMProCabMarcaFECHA.AsDateTime := REntorno.FechaTrab;
  //QMProCabMarcaTipo.Value := 'MO';
  QMProCabMarcaTipo.AsString := 'TE';
  QMProCabMarcaRIG.AsInteger := DMMain.Contador_EECS(REntorno.Serie, 'ZMA');
  {  2:QMProCabMarcaTipo.Value := 'TE';
  3:QMProCabMarcaTipo.Value := 'VAR';}
  QMProCabMarcaID_ORDEN.AsInteger := 0;
  QMProCabMarcaTIPOFASE.AsString := '';
end;

procedure TProDMMarcajesTe.QMProDetMarcaNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMProDetMarcaEMPRESA.AsInteger := QMProCabMarcaEMPRESA.Value;
  QMProDetMarcaEJERCICIO.AsInteger := QMProCabMarcaEJERCICIO.Value;
  QMProDetMarcaCANAL.AsInteger := QMProCabMarcaCANAL.Value;
  QMProDetMarcaSERIE.AsString := QMProCabMarcaSERIE.Value;
  QMProDetMarcaRIG.AsInteger := QMProCabMarcaRIG.Value;
  QMProDetMarcaTipo.AsString := 'TE';
  QMProDetMarcaTIPO_MARCAJE.AsString := '001';
  QMProCabMarcaTIEMPO_TOT.AsInteger := 0;
  QMProDetMarcaFECHA_PREV.AsDateTime := REntorno.FechaTrabSH;
  QMProDetMarcaFECHA_REAL.AsDateTime := REntorno.FechaTrabSH;
  QMProDetMarcaNUM_REF_SAL.AsInteger := 0;
  //Forzamos le valor 0 a las unidades por defecto
  QMProDetMarcaUNIDADES_DEFECTUOSAS.AsInteger := 0;

  //Escojo el primer recurso trabajo externo y le asigno al marcaje
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RECURSO FROM PRO_RECURSOS WHERE TIPORECURSO = ''TE'' ';
        ExecQuery;
        QMProDetMarcaRECURSO.AsString := FieldByName['RECURSO'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // nº de linea
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA) ');
        SQL.Add(' FROM PRO_ORD_DET_MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' RIG = :RIG ');
        ExecQuery;
        QMProDetMarcaLINEA.AsInteger := FieldByName['MAX'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMProDetMarcaUNIDADES_FAB.AsFloat := 0;
  QMProDetMarcaESTADO.AsInteger := 0;
  QMProDetMarcaHORA_INICIO.AsFloat := 0;
  QMProDetMarcaHORA_FIN.AsFloat := 0;
  QMProDetMarcaTIEMPO.AsFloat := 0;
  QMProDetMarcaTIEMPO.AsFloat := 0;
end;

procedure TProDMMarcajesTe.QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesTe.QMProCabMarcaDESC_PROVEEDORGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloProveedor(QMProCabMarcaPROVEEDOR.AsInteger);
end;

procedure TProDMMarcajesTe.QMProCabMarcaPROVEEDORChange(Sender: TField);
begin
  QMProCabMarcaDESC_PROVEEDOR.Text := DameTituloProveedor(QMProCabMarcaPROVEEDOR.AsInteger);
end;

procedure TProDMMarcajesTe.Graba(DataSet: TDataSet);
begin
  // Actualitzo el temps total de la capçalera
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TProDMMarcajesTe.QMProDetMarcaRIG_OFChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     with xSubOrden do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('Select SUBORDEN From PRO_ORD');
        SelectSQL.Add('Where Empresa=:Empresa and');
        SelectSQL.Add('Ejercicio=:Ejercicio and');
        SelectSQL.Add('Canal=:Canal and');
        SelectSQL.Add('Series=:Serie and');
        SelectSQL.Add('Rig_Of=:RIG_OF');

        Params.ByName['Empresa'].AsInteger := QMProCabMarcaEMPRESA.AsInteger;
        Params.ByName['Ejercicio'].AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
        Params.ByName['Canal'].AsInteger := QMProCabMarcaCANAL.AsInteger;
        Params.ByName['Serie'].AsString := QMProCabMarcaSERIE.AsString;
        Params.ByName['Rig_Of'].AsInteger := QMProDetMarcaRIG_OF.AsInteger;
        Open;
     end;
  QMProDetMarcaSUBORDEN.AsInteger := xSubOrdenSUBORDEN.AsInteger;
end;

procedure TProDMMarcajesTe.QMProDetMarcaTIEMPO_DECChange(Sender: TField);
begin
  //si se modifica la hora final, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesTe.QMProDetMarcaID_ORDENChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     with xSubOrden do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('Select SUBORDEN From PRO_ORD');
        SelectSQL.Add('Where Empresa=:Empresa and');
        SelectSQL.Add('Ejercicio=:Ejercicio and');
        SelectSQL.Add('Canal=:Canal and');
        SelectSQL.Add('Series=:Serie and');
        SelectSQL.Add('Id_orden=:ID_ORDEN');

        Params.ByName['Empresa'].AsInteger := QMProCabMarcaEMPRESA.AsInteger;
        Params.ByName['Ejercicio'].AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
        Params.ByName['Canal'].AsInteger := QMProCabMarcaCANAL.AsInteger;
        Params.ByName['Serie'].AsString := QMProCabMarcaSERIE.AsString;
        Params.ByName['Id_Orden'].AsInteger := QMProDetMarcaID_ORDEN.AsInteger;
        Open;
     end;
  QMProDetMarcaSUBORDEN.AsInteger := xSubOrdenSUBORDEN.AsInteger;
end;

procedure TProDMMarcajesTe.FiltraTE(filtro: string);
begin
  with QMProCabMarca do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM PRO_ORD_CAB_MARCA where ' + filtro;
     Open;
  end;
end;

procedure TProDMMarcajesTe.QMProCabMarcaBeforeClose(DataSet: TDataSet);
begin
  xInfoActualizada.Close;
  QMProDetMarca.Close;
end;

end.
