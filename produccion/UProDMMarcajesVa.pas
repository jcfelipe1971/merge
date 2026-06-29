unit UProDMMarcajesVa;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FIBDataSetRO, DB, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBTableDataSet, Dialogs, Math;

type
  TProDMMarcajesVa = class(TDataModule)
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
     QMProDetMarcaTIPO_RECURSO: TFIBStringField;
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
     DSxRecurso: TDataSource;
     xRecurso: TFIBDataSetRO;
     xRecursoTITULO: TFIBStringField;
     xTituloFase: TFIBDataSetRO;
     xTituloFaseFASE: TFIBStringField;
     Pro_Precio_Recurso: THYFIBQuery;
     QVarios: THYFIBQuery;
     xCabRecurso: TFIBDataSetRO;
     DSxCabRecurso: TDataSource;
     QMProCabMarcaDescripVar: TStringField;
     xCabRecursoTITULO: TFIBStringField;
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
     Pro_Precio_Recurso2: THYFIBQuery;
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QGeneral: THYFIBQuery;
     QMProCabMarcaVARIOS: TFIBStringField;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaTIPO_MARCAJE: TFIBStringField;
     QMProDetMarcaIMPUTACION: TFIBStringField;
     QMProDetMarcaTIPOFASE: TFIBStringField;
     QMProDetMarcaTIPOTAREA: TFIBStringField;
     QMProDetMarcaNUEVA_TAREA: TIntegerField;
     QMProDetMarcaENTRADA: TIntegerField;
     QMProDetMarcaCANTIDAD: TFloatField;
     QMProDetMarcaID_ORDEN: TIntegerField;
     QMProDetMarcaMARCAJE_DIRECTO_BD: TIntegerField;
     xDatosTareaID_ORDEN: TIntegerField;
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
     procedure QMProDetMarcaAfterPost(DataSet: TDataSet);
     procedure QMProCabMarcaDescripVarGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProCabMarcaAfterScroll(DataSet: TDataSet);
     procedure QMProCabMarcaVARIOSChange(Sender: TField);
     procedure QMProDetMarcaRIG_OFChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMProDetMarcaTIEMPO_DECChange(Sender: TField);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraVA(filtro: string);
  end;

var
  ProDMMarcajesVa : TProDMMarcajesVa;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TProDMMarcajesVa.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';

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

  QMProCabMarca.Params.ByName['TIPO'].AsString := 'VAR';
  DMMain.FiltraTabla(QMProCabMarca, '11110');

  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';
end;

procedure TProDMMarcajesVa.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11100', False);
  with QMProCabMarca.SelectSQL do
     Text := StringReplace(UpperCase(Text), 'ORDER', 'AND TIPO = ''VAR'' ORDER',
        [rfReplaceAll, rfIgnoreCase]);
  QMProCabMarca.Open;
end;

procedure TProDMMarcajesVa.QMProCabMarcaAfterOpen(DataSet: TDataSet);
begin
  QMProDetMarca.Open;
end;

procedure TProDMMarcajesVa.QMProDetMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTituloFase do
  begin
     Close;
     Open;
  end;
  Text := xTituloFaseFase.Value;
end;

procedure TProDMMarcajesVa.QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTarea do
  begin
     Close;
     Open;
  end;
  Text := xTareaTarea.Value;
end;

procedure TProDMMarcajesVa.QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xRecurso do
  begin
     Close;
     Open;
  end;
  Text := xRecursoTitulo.Value;
end;

procedure TProDMMarcajesVa.QMProDetMarcaLINEA_FASEChange(Sender: TField);
begin
  xTituloFase.Close;
  xTituloFase.Open;
  QMProDetMarcaDescripFase.Text := xTituloFaseFase.Value;
end;

procedure TProDMMarcajesVa.QMProDetMarcaLINEA_TAREAChange(Sender: TField);
begin
  xTarea.Close;
  xTarea.Open;
  QMProDetMarcaDescripTarea.Text := xTareaTarea.Value;
end;

procedure TProDMMarcajesVa.QMProDetMarcaRECURSOChange(Sender: TField);
begin
  xRecurso.Close;
  xRecurso.Open;
  QMProDetMarcaDescripRec.Text := xRecursoTITULO.Value;
  QMProDetMarcaTIPO_RECURSO.Text := QMProDetMarcaRECURSO.AsString;

  //No busco recurso, ya que trabajo externo puede ser variable
  { //Busco el precio del recurso
  QGeneral.Close;
  QGeneral.SQL.Clear;
  QGeneral.SQL.Add('select Importe from Pro_recursos');
  QGeneral.SQL.Add('where((empresa=:empresa)and (recurso=:recurso))');
  QGeneral.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  QGeneral.Params.ByName['recurso'].AsString := QMProDetMarcaRECURSO.AsString;
  QGeneral.Prepare;
  QGeneral.ExecQuery;
  QMProDetMarca.FieldByName('Precio_Recurso').AsFloat :=
     QGeneral.FieldByName['Importe'].AsFloat;}
  QMProDetMarcaPRECIO_RECURSO.AsFloat := 0;

  //Si se modifica la hora, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesVa.QMProCabMarcaNewRecord(DataSet: TDataSet);
begin
  QMProCabMarcaEMPRESA.Value := REntorno.Empresa;
  QMProCabMarcaEJERCICIO.Value := REntorno.Ejercicio;
  QMProCabMarcaCANAL.Value := REntorno.Canal;
  QMProCabMarcaSERIE.Value := REntorno.Serie;
  QMProCabMarcaFECHA.Value := REntorno.FechaTrab;
  QMProCabMarcaTipo.Value := 'VAR';
  QMProCabMarcaRIG.AsInteger := DMMain.Contador_EECS(REntorno.Serie, 'ZMA');
end;

procedure TProDMMarcajesVa.QMProDetMarcaNewRecord(DataSet: TDataSet);
begin
  QMProDetMarcaEMPRESA.Value := QMProCabMarcaEMPRESA.Value;
  QMProDetMarcaEJERCICIO.Value := QMProCabMarcaEJERCICIO.Value;
  QMProDetMarcaCANAL.Value := QMProCabMarcaCANAL.Value;
  QMProDetMarcaSERIE.Value := QMProCabMarcaSERIE.Value;
  QMProDetMarcaRIG.Value := QMProCabMarcaRIG.Value;
  QMProDetMarcaTipo.Value := 'VAR';
  QMProDetMarcaTIPO_MARCAJE.Value := '001';
  QMProDetMarcaFECHA_PREV.Value := REntorno.FechaTrabSH;
  QMProDetMarcaFECHA_REAL.Value := REntorno.FechaTrabSH;

  //Escojo el primer recurso trabajo externo y le asigno al marcaje
  QGeneral.Close;
  QGeneral.SQL.Clear;
  QGeneral.SQL.Add('select recurso from pro_recursos');
  QGeneral.SQL.Add('where tiporecurso=' + chr(39) + 'VAR' + chr(39));
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
end;

procedure TProDMMarcajesVa.QMProDetMarcaPRECIO_RECURSOChange(Sender: TField);
begin
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesVa.QMProDetMarcaAfterPost(DataSet: TDataSet);
begin
  QMProCabMarca.Refresh;
end;

procedure TProDMMarcajesVa.QMProCabMarcaDescripVarGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xCabRecurso do
  begin
     Close;
     Open;
  end;
  Text := xCabRecursoTITULO.Value;
end;

procedure TProDMMarcajesVa.QMProCabMarcaAfterScroll(DataSet: TDataSet);
begin
  with xCabRecurso do
  begin
     Close;
     Open;
  end;
end;

procedure TProDMMarcajesVa.QMProCabMarcaVARIOSChange(Sender: TField);
begin
  xCabRecurso.Close;
  xCabRecurso.Open;
  QMProCabMarcaDescripVar.Text := xCabRecursoTitulo.Value;
end;

procedure TProDMMarcajesVa.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  QMProCabMarca.Refresh;
end;

procedure TProDMMarcajesVa.QMProDetMarcaRIG_OFChange(Sender: TField);
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

procedure TProDMMarcajesVa.QMProDetMarcaTIEMPO_DECChange(Sender: TField);
begin
  //si se modifica la hora final, tambien el precio total
  if QMProDetMarca.State in [dsEdit, dsInsert] then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesVa.FiltraVA(filtro: string);
begin
  with QMProCabMarca do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM PRO_ORD_CAB_MARCA where ' + filtro;
     Open;
  end;
end;

end.
