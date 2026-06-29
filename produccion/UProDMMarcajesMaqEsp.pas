{
  Mantenimiento especial de Marcajes de Maquina:
  - En este mantenimiento se pueden marcar directamente las nuevas tareas,
    y despues se insertaran automaticamente en la Orden de produccion.

  Codigo especial marcado con SFG_JLA
}

unit UProDMMarcajesMaqEsp;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDataSetRO, DB, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBTableDataSet, Math;

type
  TProDMMarcajesMaqEsp = class(TDataModule)
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
     QMProCabMarcaVARIOS: TFIBStringField;
     QMProDetMarcaIDTAREA: TIntegerField;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QMProDetMarcaIMPUTACION: TFIBStringField;
     QMProDetMarcaTIPOFASE: TFIBStringField;
     QMProDetMarcaTIPOTAREA: TFIBStringField;
     QMProDetMarcaNUEVA_TAREA: TIntegerField;
     QMProDetMarcaENTRADA: TIntegerField;
     xInfoActualizada: TFIBDataSetRO;
     DSxInfoActualizada: TDataSource;
     xInfoActualizadaTIEMPO_TOT: TFloatField;
     QMProDetMarcaTIPO_MARCAJE: TFIBStringField;
     QMProDetMarcaCANTIDAD: TFloatField;
     QMProDetMarcaID_ORDEN: TIntegerField;
     QMProCabMarcaID_ORDEN: TIntegerField;
     QMProCabMarcaTIPOFASE: TFIBStringField;
     QMProCabMarcaNOMBRE_R_SOCIAL: TFIBStringField;
     QMProCabMarcaTIPOIMPUTACION: TIntegerField;
     QMProCabMarcaDESCRIPCION_MAQ: TFIBStringField;
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
     procedure QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMProDetMarcaTIEMPO_DECChange(Sender: TField);
     procedure QMProDetMarcaID_ORDENChange(Sender: TField);
     procedure QMProCabMarcaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure CalculaCampos(Campo: string);
  end;

var
  ProDMMarcajesMaqEsp : TProDMMarcajesMaqEsp;

implementation

uses UDMMain, UFBusca, UEntorno, UProFMMarcajesMaqEsp, UUtiles, UDameDato;

{$R *.dfm}

procedure TProDMMarcajesMaqEsp.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMProCabMarca, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMProDetMarca, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);

  QMProDetMarcaHORA_FIN.DisplayFormat := '00:00';
  QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO.DisplayFormat := '00:00';
  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';
  xInfoActualizadaTIEMPO_TOT.DisplayFormat := '00:00';

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_PRO_ORD_CAB_MARCA ');
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

procedure TProDMMarcajesMaqEsp.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11100', False);
  with QMProCabMarca.SelectSQL do
     Text := StringReplace(UpperCase(Text), 'ORDER', 'AND TIPO = ''HM'' ORDER',
        [rfReplaceAll, rfIgnoreCase]);
  QMProCabMarca.Open;
end;

procedure TProDMMarcajesMaqEsp.QMProCabMarcaAfterOpen(DataSet: TDataSet);
begin
  QMProDetMarca.Open;
  xInfoActualizada.Open;
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloFase(QMProDetMarcaTIPOFASE.AsString);
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTarea(QMProDetMarcaTIPOTAREA.AsString);
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaLINEA_FASEChange(Sender: TField);
begin
  QMProDetMarcaDescripFase.Text := DameTituloFase(QMProDetMarcaTIPOFASE.AsString);
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaLINEA_TAREAChange(Sender: TField);
begin
  QMProDetMarcaDescripTarea.Text := DameTituloTarea(QMProDetMarcaTIPOTAREA.AsString);
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaRECURSOChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  QMProDetMarcaDescripRec.Text := DameTituloTarea(QMProDetMarcaRECURSO.AsString);

  // Busco el precio y tipo del recurso
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT IMPORTE, TIPORECURSO FROM PRO_RECURSOS WHERE EMPRESA = :EMPRESA AND RECURSO = :RECURSO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RECURSO'].AsString := QMProDetMarcaRECURSO.AsString;
        ExecQuery;
        QMProDetMarcaPRECIO_RECURSO.AsFloat := FieldByName['IMPORTE'].AsFloat;
        QMProDetMarcaTIPO_RECURSO.Text := FieldByName['TIPORECURSO'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Si se modifica la hora, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaqEsp.QMProCabMarcaNewRecord(DataSet: TDataSet);
begin
  QMProCabMarcaEMPRESA.Value := REntorno.Empresa;
  QMProCabMarcaEJERCICIO.Value := REntorno.Ejercicio;
  QMProCabMarcaCANAL.Value := REntorno.Canal;
  QMProCabMarcaSERIE.Value := REntorno.Serie;
  QMProCabMarcaFECHA.Value := REntorno.FechaTrab;
  QMProCabMarcaTipo.Value := 'HM';
  QMProCabMarcaTIEMPO_TOT.Value := 0;
  QMProCabMarcaRIG.AsInteger := DMMain.Contador_EECS(REntorno.Serie, 'ZMA');
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMProDetMarcaEMPRESA.Value := QMProCabMarcaEMPRESA.Value;
  QMProDetMarcaEJERCICIO.Value := QMProCabMarcaEJERCICIO.Value;
  QMProDetMarcaCANAL.Value := QMProCabMarcaCANAL.Value;
  QMProDetMarcaSERIE.Value := QMProCabMarcaSERIE.Value;
  QMProDetMarcaRIG.Value := QMProCabMarcaRIG.Value;
  QMProDetMarcaTipo.Value := 'HM';
  QMProDetMarcaTIPO_MARCAJE.Value := '001';
  QMProDetMarcaFECHA_PREV.Value := REntorno.FechaTrabSH;
  QMProDetMarcaFECHA_REAL.Value := REntorno.FechaTrabSH;
  QMProDetMarcaENTRADA.Value := REntorno.Entrada;
  QMProDetMarcaNUEVA_TAREA.Value := 1;

  // Escojo el primer recurso tipo máquina y le asigno al marcaje
  {
  QGeneral.Close;
  QGeneral.SQL.Clear;
  QGeneral.SQL.Add('select recurso from pro_recursos');
  QGeneral.SQL.Add('where tiporecurso=' + chr(39) + 'HM' + chr(39));
  QGeneral.ExecQuery;
  QMProDetMarcaRECURSO.AsString := QGeneral.Fields[0].AsString;
  }
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RECURSO FROM PRO_MAQUINAS_C WHERE EMPRESA = :EMPRESA AND CODMAQ = :MAQUINA';
        Params.ByName['EMPRESA'].AsInteger := QMProCabMarcaEMPRESA.AsInteger;
        Params.ByName['MAQUINA'].AsInteger := QMProCabMarcaMAQUINA.AsInteger;
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
        Params.ByName['EMPRESA'].AsInteger := QMProCabMarcaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProCabMarcaCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMProCabMarcaSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMProCabMarcaTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMProCabMarcaRIG.AsInteger;
        ExecQuery;
        QMProDetMarcaLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMProDetMarcaUNIDADES_FAB.AsFloat := 0;
  QMProDetMarcaESTADO.AsInteger := 0;
  QMProDetMarcaHORA_INICIO.AsFloat := 0000;
  QMProDetMarcaHORA_FIN.AsFloat := 0000;
end;

procedure TProDMMarcajesMaqEsp.QMProCabMarcaMAQUINAChange(Sender: TField);
begin
  QMProCabMarcaDESCRIPCION_MAQ.Text := DameTituloMaquina(QMProCabMarcaMAQUINA.AsInteger);
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaqEsp.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  // Actualitzo el temps total de la capçalera
  xInfoActualizada.Close;
  xInfoActualizada.Open;

  QMProCabMarca.Refresh;
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaTIEMPO_DECChange(Sender: TField);
begin
  // Si se modifica la hora final, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaqEsp.QMProDetMarcaID_ORDENChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUBORDEN FROM PRO_ORD WHERE ID_ORDEN = :ID_ORDEN';
           Params.ByName['ID_ORDEN'].AsInteger := QMProDetMarcaID_ORDEN.AsInteger;
           ExecQuery;
           QMProDetMarcaSUBORDEN.AsInteger := FieldByName['SUBORDEN'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TProDMMarcajesMaqEsp.CalculaCampos(Campo: string);
var
  Q : THYFIBQuery;
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
  begin
     if (Campo = 'IDTAREA') and
        (QMProDetMarca.FieldByName('IDTAREA').AsString <> '') then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT IDENTIFICADOR, RIG_OF, LINEA_FASE, LINEA_TAREA FROM PRO_ORD_TAREA WHERE IDENTIFICADOR = :IDTAREA';
              Params.ByName['IDTAREA'].AsInteger := QMProDetMarcaIDTAREA.AsInteger;
              ExecQuery;
              if (FieldByName['IDENTIFICADOR'].AsInteger <> 0) then
              begin
                 QMProDetMarcaRIG_OF.AsInteger := FieldByName['RIG_OF'].AsInteger;
                 QMProDetMarcaLINEA_FASE.AsInteger := FieldByName['LINEA_FASE'].AsInteger;
                 QMProDetMarcaLINEA_TAREA.AsInteger := FieldByName['LINEA_TAREA'].AsInteger;
              end;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end;
     if (Campo = 'LINEA_TAREA') and
        (QMProDetMarca.FieldByName('LINEA_TAREA').AsString <> '') and
        (QMProDetMarca.FieldByName('IDTAREA').AsString = '') then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT IDENTIFICADOR FROM PRO_ORD_TAREA WHERE LINEA_TAREA = :LINEA_TAREA AND RIG_OF = :RIG_OF AND LINEA_FASE = :LINEA_FASE';
              Params.ByName['LINEA_TAREA'].AsInteger := QMProDetMarcaLINEA_TAREA.Value;
              Params.ByName['LINEA_FASE'].AsInteger := QMProDetMarcaLINEA_FASE.Value;
              Params.ByName['RIG_OF'].AsInteger := QMProDetMarcaRig_Of.Value;
              ExecQuery;
              QMProDetMarcaIDTAREA.AsInteger := FieldByName['IDENTIFICADOR'].AsInteger;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end;
  end;
end;

procedure TProDMMarcajesMaqEsp.QMProCabMarcaBeforeClose(DataSet: TDataSet);
begin
  QMProDetMarca.Close;
  xInfoActualizada.Close;
end;

end.
