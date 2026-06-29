{
  Mantenimiento especial de Marcajes de Maquina por Turnos:
  - En este mantenimiento se pueden marcar directamente las nuevas tareas,
    y despues se insertaran automaticamente en la Orden de produccion.

  Codigo especial marcado con SFG_RSP
}

unit UProDMMarcajesMaqEspTurno;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDataSetRO, DB, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBTableDataSet, Math;

type
  TProDMMarcajesMaqEspTurno = class(TDataModule)
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
     Pro_Precio_Recurso: THYFIBQuery;
     QVarios: THYFIBQuery;
     QMProCabMarcaDescripMaq: TStringField;
     QMProCabMarcaVARIOS: TFIBStringField;
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
     Pro_Precio_Recurso2: THYFIBQuery;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QGeneral: THYFIBQuery;
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
     QMProDetMarcaMARCAJE_DIRECTO_BD: TIntegerField;
     QMProDetMarcaMOTIVO: TFIBStringField;
     QMProDetMarcaTURNO: TFIBStringField;
     QMProDetMarcaCANTIDAD_RECHAZADA: TFloatField;
     QMProDetMarcaFECHA_DET: TDateTimeField;
     QMProCabMarcaDescripFase: TStringField;
     QMProDetMarcaNO_PRODUCTIVA: TIntegerField;
     QMProDetMarcaCAUSA: TFIBStringField;
     QMProDetMarcaDescCausa: TStringField;
     xCausa: TFIBDataSetRO;
     DSxCausa: TDataSource;
     xCausaDESCRIPCION: TFIBStringField;
     xTurno: TFIBDataSetRO;
     DSxTurno: TDataSource;
     QMProDetMarcaDescTurno: TStringField;
     xTurnoDESCRIPCION: TFIBStringField;
     QMProDetMarcaTIPO_DEFECTO: TIntegerField;
     QMProDetMarcaDescDefecto: TStringField;
     TUpdate: THYTransaction;
     QMProDetMarcaHORAS_NO_PRODUCTIVAS: TFloatField;
     QMProCabMarcaCompuesto: TStringField;
     xCompuesto: TFIBDataSetRO;
     DSxCompuesto: TDataSource;
     xCompuestoCOMPUESTO: TFIBStringField;
     xTarea: TFIBDataSetRO;
     xTareaTITULO: TFIBStringField;
     DSxTarea: TDataSource;
     xRecurso: TFIBDataSetRO;
     xRecursoTITULO: TFIBStringField;
     DSxRecurso: TDataSource;
     xDefecto: TFIBDataSetRO;
     DSxDefecto: TDataSource;
     xDefectoDESCRIPCION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProCabMarcaAfterOpen(DataSet: TDataSet);
     procedure QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaLINEA_TAREAChange(Sender: TField);
     procedure QMProDetMarcaRECURSOChange(Sender: TField);
     procedure QMProCabMarcaNewRecord(DataSet: TDataSet);
     procedure QMProDetMarcaNewRecord(DataSet: TDataSet);
     procedure QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
     procedure QMProDetMarcaTIEMPO_DECChange(Sender: TField);
     procedure QMProDetMarcaID_ORDENChange(Sender: TField);
     procedure QMProDetMarcaDescCausaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescTurnoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescDefectoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProCabMarcaCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProCabMarcaBeforeClose(DataSet: TDataSet);
     procedure QMProCabMarcaDescripMaqGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProCabMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProCabMarcaID_ORDENChange(Sender: TField);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMMarcajesMaqEspTurno : TProDMMarcajesMaqEspTurno;

implementation

uses UDMMain, UFBusca, UEntorno, UDameDato;

{$R *.dfm}

procedure TProDMMarcajesMaqEspTurno.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Pongo las mascaras primero. Es mas rapido
  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';

  xInfoActualizadaTIEMPO_TOT.DisplayFormat := '00:00';

  QMProDetMarcaHORA_FIN.DisplayFormat := '00:00';
  QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO_DEC.DisplayFormat := MascaraN;
  QMProDetMarcaPRECIO_RECURSO.DisplayFormat := MascaraN;
  QMProDetMarcaTOTAL_RECURSO.DisplayFormat := MascaraN;
  QMProDetMarcaCANTIDAD_RECHAZADA.DisplayFormat := MascaraN;
  QMProDetMarcaHORAS_NO_PRODUCTIVAS.DisplayFormat := '00:00';

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

procedure TProDMMarcajesMaqEspTurno.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11100', False);
  with QMProCabMarca.SelectSQL do
     Text := StringReplace(UpperCase(Text), 'ORDER', 'AND TIPO = ''HM'' ORDER',
        [rfReplaceAll, rfIgnoreCase]);
  QMProCabMarca.Open;
end;

procedure TProDMMarcajesMaqEspTurno.QMProCabMarcaAfterOpen(DataSet: TDataSet);
begin
  QMProDetMarca.Open;
  xCompuesto.Open;
  xInfoActualizada.Open;
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTarea(QMProDetMarcaTIPOTAREA.AsString);
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaLINEA_TAREAChange(Sender: TField);
begin
  if (QMProDetMarca.State in [dsEdit, dsInsert]) then
     QMProDetMarcaDescripTarea.Text := DameTituloTarea(QMProDetMarcaTIPOTAREA.AsString);
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaRECURSOChange(Sender: TField);
begin
  {rsp
  if (QMProDetMarca.State in [dsEdit, dsInsert]) then
     QMProDetMarcaDescripRec.Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);
  }
  QMProDetMarcaTIPO_RECURSO.Text := QMProDetMarcaRECURSO.AsString;

  // Busco el precio del recurso
  QGeneral.Close;
  QGeneral.SQL.Clear;
  QGeneral.SQL.Add(' SELECT IMPORTE FROM PRO_RECURSOS ');
  QGeneral.SQL.Add(' WHERE ');
  QGeneral.SQL.Add(' EMPRESA = :EMPRESA AND ');
  QGeneral.SQL.Add(' RECURSO = :RECURSO ');
  QGeneral.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QGeneral.Params.ByName['RECURSO'].AsString := QMProDetMarcaRECURSO.AsString;
  QGeneral.Prepare;
  QGeneral.ExecQuery;
  QMProDetMarcaPRECIO_RECURSO.AsFloat := QGeneral.FieldByName['IMPORTE'].AsFloat;

  // Si se modifica la hora, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaqEspTurno.QMProCabMarcaNewRecord(DataSet: TDataSet);
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

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaNewRecord(DataSet: TDataSet);
begin
  if ((QMProCabMarca.State = dsInsert) or (QMProCabMarca.State = dsEdit)) then
  begin
     QMProCabMarca.Post;
     QMProDetMarca.Edit;
  end;

  QMProDetMarcaEMPRESA.Value := QMProCabMarcaEMPRESA.Value;
  QMProDetMarcaEJERCICIO.Value := QMProCabMarcaEJERCICIO.Value;
  QMProDetMarcaCANAL.Value := QMProCabMarcaCANAL.Value;
  QMProDetMarcaSERIE.Value := QMProCabMarcaSERIE.Value;
  QMProDetMarcaRIG.Value := QMProCabMarcaRIG.Value;
  QMProDetMarcaTipo.Value := 'HM';
  QMProDetMarcaTIPO_MARCAJE.Value := '001';
  QMProDetMarcaFECHA_PREV.Value := REntorno.FechaTrabSH;
  QMProDetMarcaFECHA_REAL.Value := REntorno.FechaTrabSH;
  QMProDetMarcaENTRADA.Value := REntorno.Entrada; //SFG_JLA
  QMProDetMarcaNUEVA_TAREA.Value := 1; //SFG_JLA
  QMProDetMarcaID_ORDEN.Value := QMProCabMarcaID_ORDEN.Value; //SFG_RSP
  QMProDetMarcaTIPOFASE.Value := QMProCabMarcaTIPOFASE.Value; //SFG_RSP


  {
  // Escojo el primer recurso tipo máquina y le asigno al marcaje
  QGeneral.Close;
  QGeneral.SQL.Clear;
  QGeneral.SQL.Add('select recurso from pro_recursos');
  QGeneral.SQL.Add('where tiporecurso='+chr(39)+'HM'+chr(39));
  QGeneral.ExecQuery;
  QMProDetMarcaRECURSO.AsString:=QGeneral.Fields[0].AsString;
  }

  // SFG RSP Seleccionamos el recurso maquina de la cabecera
  QGeneral.Close;
  QGeneral.SQL.Clear;
  QGeneral.SQL.Add('select recurso from pro_maquinas_c');
  QGeneral.SQL.Add('where codmaq=?maquina');
  QGeneral.Params.ByName['maquina'].AsInteger := QMProCabMarcaMAQUINA.AsInteger;
  QGeneral.ExecQuery;
  QMProDetMarcaRECURSO.AsString := QGeneral.Fields[0].AsString;

  // nº de linea
  QVarios.Close;
  QVarios.SQL.Clear;
  QVarios.SQL.Add('Select Max(LINEA)As NLinea From PRO_ORD_DET_MARCA Where ((EMPRESA=?EMPRESA) and ');
  QVarios.SQL.Add('(EJERCICIO=?Ejercicio) and ');
  QVarios.SQL.Add('(CANAL=?Canal) and ');
  QVarios.SQL.Add('(SERIE=?Serie) and ');
  QVarios.SQL.Add('(Tipo=?Tipo) and ');
  QVarios.SQL.Add('(RIG=?Rig))');
  QVarios.Params.ByName['Empresa'].AsString := QMProCabMarcaEMPRESA.AsString;
  QVarios.Params.ByName['Ejercicio'].AsString := QMProCabMarcaEJERCICIO.AsString;
  QVarios.Params.ByName['Canal'].AsString := QMProCabMarcaCANAL.AsString;
  QVarios.Params.ByName['Serie'].AsString := QMProCabMarcaSERIE.AsString;
  QVarios.Params.ByName['Tipo'].AsString := QMProCabMarcaTIPO.AsString;
  QVarios.Params.ByName['Rig'].AsString := QMProCabMarcaRIG.AsString;
  QVarios.ExecQuery;
  QMProDetMarcaLINEA.AsInteger := QVArios.FieldByName['NLinea'].AsInteger + 1;

  QMProDetMarcaUNIDADES_FAB.AsFloat := 0;
  QMProDetMarcaESTADO.AsInteger := 0;
  QMProDetMarcaHORA_INICIO.AsFloat := 0000;
  QMProDetMarcaHORA_FIN.AsFloat := 0000;
  QMProDetMarcaNO_PRODUCTIVA.AsInteger := 0;
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaTIEMPO_DECChange(Sender: TField);
begin
  // Si se modifica la hora final, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaID_ORDENChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  if (QMProDetMarca.State in [dsEdit, dsInsert]) then
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

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaDescCausaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xCausa do
  begin
     Close;
     Open;
  end;

  Text := xCausaDESCRIPCION.Value;
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaDescTurnoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTurno do
  begin
     Close;
     Open;
  end;

  Text := xTurnoDESCRIPCION.Value;
end;

procedure TProDMMarcajesMaqEspTurno.QMProDetMarcaDescDefectoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xDefecto do
  begin
     Close;
     Open;
  end;

  Text := xDefectoDESCRIPCION.Value;
end;

procedure TProDMMarcajesMaqEspTurno.QMProCabMarcaCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xCompuesto do
  begin
     Close;
     Open;
  end;

  Text := xCompuestoCOMPUESTO.AsString;
end;

procedure TProDMMarcajesMaqEspTurno.QMProCabMarcaBeforeClose(DataSet: TDataSet);
begin
  QMProDetMarca.Close;
  xCompuesto.Close;
  xInfoActualizada.Open;
end;

procedure TProDMMarcajesMaqEspTurno.QMProCabMarcaDescripMaqGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloMaquina(QMProCabMarcaMAQUINA.AsInteger);
end;

procedure TProDMMarcajesMaqEspTurno.QMProCabMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloFase(QMProCabMarcaTIPOFASE.AsString);
end;

procedure TProDMMarcajesMaqEspTurno.QMProCabMarcaID_ORDENChange(Sender: TField);
begin
  with xCompuesto do
  begin
     Close;
     Open;
  end;
end;

end.
