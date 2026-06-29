unit UProDMMarcajesOpe;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs, Math, Graphics;

type
  TProDMMarcajesOpe = class(TDataModule)
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
     DSxRecurso: TDataSource;
     xRecurso: TFIBDataSetRO;
     xRecursoTITULO: TFIBStringField;
     xTituloFase: TFIBDataSetRO;
     xTituloFaseFASE: TFIBStringField;
     xTarea: TFIBDataSetRO;
     xTareaTAREA: TFIBStringField;
     DSxTarea: TDataSource;
     DSxTituloFase: TDataSource;
     xOperario: TFIBDataSetRO;
     DSxOperario: TDataSource;
     xOperarioNOMBRE_R_SOCIAL: TFIBStringField;
     QMProCabMarcaDescripOpe: TStringField;
     QMProCabMarcaVARIOS: TFIBStringField;
     xSubOrden: TFIBDataSetRO;
     xSubOrdenSUBORDEN: TIntegerField;
     DSxSubOrden: TDataSource;
     QMProDetMarcaIDTAREA: TIntegerField;
     xDatosTarea: TFIBDataSetRO;
     xDatosTareaEMPRESA: TIntegerField;
     xDatosTareaEJERCICIO: TIntegerField;
     xDatosTareaCANAL: TIntegerField;
     xDatosTareaSERIE: TFIBStringField;
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
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QMProDetMarcaIMPUTACION: TFIBStringField;
     QMProDetMarcaCANTIDAD: TFloatField;
     xTipoImputacionH: TFIBDataSetRO;
     xTipoImputacionHTIPO_IMPUTACION: TFIBStringField;
     xTipoImputacionHHORAS: TIntegerField;
     QMProDetMarcaTIPOFASE: TFIBStringField;
     QMProDetMarcaTIPOTAREA: TFIBStringField;
     QMProDetMarcaNUEVA_TAREA: TIntegerField;
     QMProDetMarcaENTRADA: TIntegerField;
     QMProDetMarcaTIPO_MARCAJE: TFIBStringField;
     QMProDetMarcaID_ORDEN: TIntegerField;
     xDatosTareaID_ORDEN: TIntegerField;
     QMProDetMarcaMOTIVO: TFIBStringField;
     QMProDetMarcaNO_PRODUCTIVA: TIntegerField;
     QMProDetMarcaDESCRIPCION_IMP: TFIBStringField;
     QMProDetMarcaDESCRIPCION_REC: TFIBStringField;
     QMProDetMarcaDESCRIPCION_TAREA: TFIBStringField;
     QMProDetMarcaDESCRIPCION_FASE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProCabMarcaAfterOpen(DataSet: TDataSet);
     procedure QMProDetMarcaLINEA_FASEChange(Sender: TField);
     procedure QMProDetMarcaLINEA_TAREAChange(Sender: TField);
     procedure QMProDetMarcaRECURSOChange(Sender: TField);
     procedure QMProCabMarcaNewRecord(DataSet: TDataSet);
     procedure QMProDetMarcaNewRecord(DataSet: TDataSet);
     procedure QMProCabMarcaOPERARIOChange(Sender: TField);
     procedure QMProCabMarcaDescripOpeGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProCabMarcaAfterScroll(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMProDetMarcaID_ORDENChange(Sender: TField);
     procedure QMProDetMarcaTIEMPO_DECChange(Sender: TField);
     procedure QMProDetMarcaIMPUTACIONChange(Sender: TField);
     procedure QMProDetMarcaCANTIDADChange(Sender: TField);
     procedure QMProDetMarcaIDTAREAChange(Sender: TField);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraOperario(filtro: string);
  end;

var
  ProDMMarcajesOpe : TProDMMarcajesOpe;

implementation

uses UDMMain, UFBusca, UEntorno, UProFMMarcajesOpe, DBGrids, UUtiles, UDameDato;

{$R *.dfm}

procedure TProDMMarcajesOpe.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';

  QMProDetMarcaHORA_FIN.DisplayFormat := '00:00';
  QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO_DEC.DisplayFormat := MascaraN;
  QMProDetMarcaPRECIO_RECURSO.DisplayFormat := MascaraN;
  QMProDetMarcaTOTAL_RECURSO.DisplayFormat := MascaraN;

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM PRO_ORD_CAB_MARCA ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = :EMPRESA AND ');
  SQLBase.Add(' EJERCICIO = :EJERCICIO AND ');
  SQLBase.Add(' CANAL = :CANAL AND ');
  // No se filtra por serie SQLBase.Add(' SERIE = :SERIE AND ');
  SQLBase.Add(' TIPO = :TIPO ');

  QMProCabMarca.Close;
  QMProCabMarca.SelectSQL.Text := SQLBase.Text;
  QMProCabMarca.SelectSQL.Add(' ORDER BY FECHA ');

  QMProCabMarca.Params.ByName['TIPO'].AsString := 'MO';
  // No se filtra por serie DMMain.FiltraTabla(QMProCabMarca, '11110');
  DMMain.FiltraTabla(QMProCabMarca, '11100');
end;

procedure TProDMMarcajesOpe.BusquedaCompleja;
begin
  with QMProCabMarca do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     // TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11110', False);
     TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11100', False);
     SelectSQL.Add(' AND TIPO = :TIPO ');
     SelectSQL.Add(' ORDER BY FECHA ');
     Params.ByName['TIPO'].AsString := 'MO';
     // Ya viene filtrado EEC harcoded en el SQL. DMMain.FiltraTabla(QMProCabMarca, '11110');
     // No se filtra por serie DMMain.FiltraTabla(QMProCabMarca, '00010');
     Open;
  end;
end;

procedure TProDMMarcajesOpe.QMProCabMarcaAfterOpen(DataSet: TDataSet);
begin
  QMProDetMarca.Open;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaLINEA_FASEChange(Sender: TField);
begin
  xTituloFase.Close;
  xTituloFase.Open;
  QMProDetMarcaDESCRIPCION_FASE.Text := xTituloFaseFase.Value;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaLINEA_TAREAChange(Sender: TField);
begin
  xTarea.Close;
  xTarea.Open;
  QMProDetMarcaDESCRIPCION_TAREA.Text := xTareaTarea.Value;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaRECURSOChange(Sender: TField);
begin
  xRecurso.Close;
  xRecurso.Open;

  QMProDetMarcaDESCRIPCION_REC.Text := xRecursoTITULO.Value;
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
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesOpe.QMProCabMarcaNewRecord(DataSet: TDataSet);
begin
  QMProCabMarcaEMPRESA.Value := REntorno.Empresa;
  QMProCabMarcaEJERCICIO.Value := REntorno.Ejercicio;
  QMProCabMarcaCANAL.Value := REntorno.Canal;
  QMProCabMarcaSERIE.Value := REntorno.Serie; // ???
  QMProCabMarcaFECHA.Value := REntorno.FechaTrab;
  QMProCabMarcaTipo.Value := 'MO';
  QMProCabMarcaTIEMPO_TOT.Value := 0;
  QMProCabMarcaRIG.AsInteger := DMMain.Contador_EECS(REntorno.Serie, 'ZMA');
end;

procedure TProDMMarcajesOpe.QMProDetMarcaNewRecord(DataSet: TDataSet);
var
  Imputacion, TipoImputacion, c : integer;
begin
  QMProDetMarcaEMPRESA.AsInteger := QMProCabMarcaEMPRESA.AsInteger;
  QMProDetMarcaEJERCICIO.AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
  QMProDetMarcaCANAL.AsInteger := QMProCabMarcaCANAL.AsInteger;
  QMProDetMarcaSERIE.AsString := QMProCabMarcaSERIE.AsString;
  QMProDetMarcaRIG.AsInteger := QMProCabMarcaRIG.AsInteger;
  QMProDetMarcaTIPO.AsString := 'MO';
  QMProDetMarcaTIPO_MARCAJE.AsString := '001';
  QMProDetMarcaTIEMPO.AsFloat := 0;
  QMProDetMarcaFECHA_PREV.AsDateTime := REntorno.FechaTrabSH;
  QMProDetMarcaFECHA_REAL.AsDateTime := REntorno.FechaTrabSH;
  QMProDetMarcaENTRADA.AsInteger := REntorno.Entrada;
  QMProDetMarcaCANTIDAD.AsFloat := 0;
  QMProDetMarcaNO_PRODUCTIVA.AsInteger := 0;
  QMProDetMarcaMOTIVO.AsString := '';

  // Escojo el recurso o la imputación
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT IMPUTACION, TIPOIMPUTACION FROM OPE_EMPLEADO WHERE EMPRESA = ?EMPRESA AND EMPLEADO = ?EMPLEADO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMProCabMarcaOPERARIO.AsInteger;
        ExecQuery;
        TipoImputacion := FieldByName['TIPOIMPUTACION'].AsInteger;
        Imputacion := FieldByName['IMPUTACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // RECURSO ...
  if (TipoImputacion = 1) then
  begin
     // Busco el titulo del recurso
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT OPE.RECURSO, REC.TITULO, REC.IMPORTE FROM OPE_EMPLEADO OPE ');
           SQL.Add(' LEFT JOIN PRO_RECURSOS REC ON (OPE.EMPRESA = REC.EMPRESA AND OPE.RECURSO = REC.RECURSO) ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EMPLEADO = ?EMPLEADO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EMPLEADO'].AsInteger := QMProCabMarcaOPERARIO.AsInteger;
           ExecQuery;
           QMProDetMarcaDESCRIPCION_REC.AsString := Fields[1].AsString;
           QMProDetMarcaRECURSO.AsString := Fields[0].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
     QMProDetMarcaTIPO_RECURSO.AsString := QMProDetMarcaRECURSO.AsString;
  end;

  // IMPUTACIÓN ...
  if (TipoImputacion = 2) then // Imputa el cost per imputació -2-
  begin
     // Agafo el preu de la imputació
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT IMPORTE, IMPUTACION FROM OPE_EMPLEADO_PRE WHERE EMPRESA = ?EMPRESA AND EMPLEADO = ?EMPLEADO AND LINEA = ?LINEA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EMPLEADO'].AsInteger := QMProCabMarcaOPERARIO.AsInteger;
           Params.ByName['LINEA'].AsInteger := Imputacion;
           ExecQuery;
           QMProDetMarcaIMPUTACION.AsString := FieldByName['IMPUTACION'].AsString;
           QMProDetMarcaPRECIO_RECURSO.AsFloat := FieldByName['IMPORTE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Linia común para recurso y imputación
  QMProDetMarcaUNIDADES_DEFECTUOSAS.AsFloat := 0;  // no existen
  QMProDetMarcaNUM_REF_SAL.AsInteger := 0;   // no existen
  // QMProDetMarcaESTADO.AsInteger := 1; // marco estado a 1 xq ese marcaje está activo

  // Mostro les columnes de Recurso o Imputació
  // Recurso
  c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'RECURSO');
  if (c >= 0) then
     ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 1);

  // Descripción Recurso
  c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'DESCRIPCION_REC');
  if (c >= 0) then
     ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 1);

  // Imputación
  c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'IMPUTACION');
  if (c >= 0) then
     ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);

  // Descripción Imputación
  c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'DESCRIPCION_IMP');
  if (c >= 0) then
     ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);

  // Miro si la imputació no té hores (cantidad) o no (temps)
  xTipoImputacionH.Close;
  xTipoImputacionH.Open;
  if (xTipoImputacionHHORAS.AsInteger = 0) then
  begin
     // Cantidad Imputación
     c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'CANTIDAD');
     if (c >= 0) then
        ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);
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
        SQL.Add(' RIG = ?RIG ');
        Params.ByName['EMPRESA'].AsString := QMProCabMarcaEMPRESA.AsString;
        Params.ByName['EJERCICIO'].AsString := QMProCabMarcaEJERCICIO.AsString;
        Params.ByName['CANAL'].AsString := QMProCabMarcaCANAL.AsString;
        Params.ByName['SERIE'].AsString := QMProCabMarcaSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMProCabMarcaTIPO.AsString;
        Params.ByName['RIG'].AsString := QMProCabMarcaRIG.AsString;
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
end;

procedure TProDMMarcajesOpe.QMProCabMarcaOPERARIOChange(Sender: TField);
begin
  QMProCabMarcaDescripOpe.Text := DameTituloEmpleado(QMProCabMarcaOPERARIO.AsInteger);
end;

procedure TProDMMarcajesOpe.QMProCabMarcaDescripOpeGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEmpleado(QMProCabMarcaOPERARIO.AsInteger);
end;

procedure TProDMMarcajesOpe.QMProCabMarcaAfterScroll(DataSet: TDataSet);
var
  c, TipoImputacion : integer;
begin
  // Depende del tipo de imputación del operario, muestro en el grid la impitación o recurso
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPOIMPUTACION FROM OPE_EMPLEADO WHERE EMPRESA = ?EMPRESA AND EMPLEADO = ?EMPLEADO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMProCabMarcaOPERARIO.AsInteger;
        ExecQuery;
        TipoImputacion := FieldByName['TIPOIMPUTACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;

     // Recurso
     c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'RECURSO');
     if (c >= 0) then
        ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 1);

     // Descripción Recurso
     c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'DESCRIPCION_REC');
     if (c >= 0) then
        ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 1);

     // Imputación
     c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'IMPUTACION');
     if (c >= 0) then
        ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);

     // Descripción Imputación
     c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'DESCRIPCION_IMP');
     if (c >= 0) then
        ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);

     // Miro si la imputació no té hores (cantidad) o no (temps)
     xTipoImputacionH.Close;
     xTipoImputacionH.Open;
     if (xTipoImputacionHHORAS.AsInteger = 0) then
     begin
        // Cantidad Imputación
        c := EncuentraField(ProFMMarcajesOpe.DBGFDetalle, 'CANTIDAD');
        if (c >= 0) then
           ProFMMarcajesOpe.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);
     end;
  end;
end;

procedure TProDMMarcajesOpe.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  // DataSet.Refresh;
  QMProCabMarca.Refresh;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaID_ORDENChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     with xSubOrden do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT SUBORDEN FROM PRO_ORD');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' SERIES = :SERIE AND ');
        SelectSQL.Add(' ID_ORDEN = :ID_ORDEN ');

        Params.ByName['EMPRESA'].AsInteger := QMProCabMarcaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProCabMarcaCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMProCabMarcaSERIE.AsString;
        Params.ByName['ID_ORDEN'].AsInteger := QMProDetMarcaID_ORDEN.AsInteger;
        Open;
     end;

  QMProDetMarcaSUBORDEN.AsInteger := xSubOrdenSUBORDEN.AsInteger;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaTIEMPO_DECChange(Sender: TField);
begin
  // si se modifica la hora final, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaIMPUTACIONChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCRIPCION, IMPORTE FROM OPE_EMPLEADO_PRE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO AND ');
        SQL.Add(' IMPUTACION = :IMPUTACION ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMProCabMarcaOPERARIO.AsInteger;
        Params.ByName['IMPUTACION'].AsString := QMProDetMarcaIMPUTACION.AsString;
        ExecQuery;
        QMProDetMarcaDESCRIPCION_IMP.AsString := FieldByName['DESCRIPCION'].AsString;
        QMProDetMarcaPRECIO_RECURSO.AsFloat := FieldByName['IMPORTE'].AsFloat;
        QMProDetMarcaCANTIDAD.AsInteger := 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaCANTIDADChange(Sender: TField);
begin
  xTipoImputacionH.Close;
  xTipoImputacionH.Open;

  // Si la imputació no és per hores..
  if ((xTipoImputacionHHORAS.AsInteger = 0) and (QMProDetMarca.State in [dsEdit, dsInsert])) then
     QMProDetMarcaTOTAL_RECURSO.Value := QMProDetMarcaPRECIO_RECURSO.Value *
        QMProDetMarcaCANTIDAD.Value;
end;

procedure TProDMMarcajesOpe.FiltraOperario(filtro: string);
begin
  with QMProCabMarca do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM PRO_ORD_CAB_MARCA WHERE ' + filtro;
     Open;
  end;
end;

procedure TProDMMarcajesOpe.QMProDetMarcaIDTAREAChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_ORDEN, RIG_OF, LINEA_FASE, LINEA_TAREA FROM PRO_ORD_TAREA WHERE IDENTIFICADOR = :IDENTIFICADOR';
        Params.ByName['IDENTIFICADOR'].AsInteger := QMProDetMarcaIDTAREA.AsInteger;
        ExecQuery;
        QMProDetMarcaID_ORDEN.AsInteger := FieldByName['ID_ORDEN'].AsInteger;
        QMProDetMarcaRIG_OF.AsInteger := FieldByName['RIG_OF'].AsInteger;
        QMProDetMarcaLINEA_FASE.AsInteger := FieldByName['LINEA_FASE'].AsInteger;
        QMProDetMarcaLINEA_TAREA.AsInteger := FieldByName['LINEA_TAREA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
