{
  Mantenimiento especial de Marcajes de Operario:
  - En este mantenimiento se pueden marcar directamente las nuevas tareas,
    y despues se insertaran automaticamente en la Orden de produccion.

  Codigo especial marcado con SFG_JLA
}

unit UProDMMarcajesOpeEsp;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs, Math, Graphics;

type
  TProDMMarcajesOpeEsp = class(TDataModule)
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
     QMProCabMarcaVARIOS: TFIBStringField;
     QMProDetMarcaIDTAREA: TIntegerField;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QMProDetMarcaIMPUTACION: TFIBStringField;
     QMProDetMarcaNUEVA_TAREA: TIntegerField; //SFG_JLA
     QMProDetMarcaTIPOFASE: TFIBStringField;  //SFG_JLA
     QMProDetMarcaTIPOTAREA: TFIBStringField; //SFG_JLA
     QMProDetMarcaENTRADA: TIntegerField;
     QMProDetMarcaCANTIDAD: TFloatField;
     QMProDetMarcaTIPO_MARCAJE: TFIBStringField;
     QMProDetMarcaID_ORDEN: TIntegerField;
     TUpdate: THYTransaction;
     QMProCabMarcaID_ORDEN: TIntegerField;
     QMProCabMarcaTIPOFASE: TFIBStringField;
     QMProCabMarcaNOMBRE_R_SOCIAL: TFIBStringField;
     QMProCabMarcaTIPOIMPUTACION: TIntegerField;
     QMProDetMarcaTITULO_FASE: TFIBStringField;
     QMProDetMarcaTITULO_TAREA: TFIBStringField;
     QMProDetMarcaTITULO_RECURSO: TFIBStringField;
     QMProDetMarcaTITULO_IMPUTACION: TFIBStringField;
     QMProDetMarcaTIPO_IMPUTACION: TFIBStringField;
     QMProDetMarcaHORAS: TIntegerField;
     QMProCabMarcaDESCRIPCION_MAQ: TFIBStringField;
     xInfoActualizada: TFIBDataSetRO;
     xInfoActualizadaTIEMPO_TOT: TFloatField;
     DSxInfoActualizada: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProCabMarcaAfterOpen(DataSet: TDataSet);
     procedure QMProDetMarcaLINEA_FASEChange(Sender: TField);
     procedure QMProDetMarcaLINEA_TAREAChange(Sender: TField);
     procedure QMProDetMarcaRECURSOChange(Sender: TField);
     procedure QMProCabMarcaNewRecord(DataSet: TDataSet);
     procedure QMProDetMarcaNewRecord(DataSet: TDataSet);
     procedure QMProCabMarcaOPERARIOChange(Sender: TField);
     procedure QMProDetMarcaTIEMPO_DECChange(Sender: TField);
     procedure QMProDetMarcaIMPUTACIONChange(Sender: TField);
     procedure QMProDetMarcaTIPOFASEChange(Sender: TField);  //SFG_JLA
     procedure QMProDetMarcaTIPOTAREAChange(Sender: TField);
     procedure QMProDetMarcaCANTIDADChange(Sender: TField); //SFG_JLA
     procedure QMProDetMarcaID_ORDENChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMProCabMarcaBeforeClose(DataSet: TDataSet);
     procedure QMProDetMarcaAfterPost(DataSet: TDataSet); //SFG_RSL
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure RecalculaTiempo; // sfg_rsl proceso para recalcular tiempos en marcajes
  end;

var
  ProDMMarcajesOpeEsp : TProDMMarcajesOpeEsp;

implementation

uses UDMMain, UFBusca, UEntorno, UProFMMarcajesOpeEsp, UFParada, UUtiles, UDameDato;

{$R *.dfm}

procedure TProDMMarcajesOpeEsp.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMProCabMarca, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMProDetMarca, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);

  QMProCabMarcaTIEMPO_TOT.DisplayFormat := '00:00';
  QMProDetMarcaHORA_FIN.DisplayFormat := '00:00';
  QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00';
  QMProDetMarcaTIEMPO.DisplayFormat := '00:00';

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

  QMProCabMarca.Params.ByName['TIPO'].AsString := 'MO';
  DMMain.FiltraTabla(QMProCabMarca, '11110');
end;

procedure TProDMMarcajesOpeEsp.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TProDMMarcajesOpeEsp.BusquedaCompleja;
begin
  with QMProCabMarca do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     TFBusca.Create(Self).SeleccionaBusqueda(QMProCabMarca, '11110', False);
     SelectSQL.Add(' AND TIPO = :TIPO ');
     SelectSQL.Add(' ORDER BY FECHA ');
     Params.ByName['TIPO'].AsString := 'MO';
     // Ya viene filtrado EEC harcoded en el SQL. DMMain.FiltraTabla(QMProCabMarca, '11110');
     DMMain.FiltraTabla(QMProCabMarca, '00010');
     Open;
  end;
end;

procedure TProDMMarcajesOpeEsp.QMProCabMarcaAfterOpen(DataSet: TDataSet);
begin
  QMProDetMarca.Open;
  xInfoActualizada.Open;
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaLINEA_FASEChange(Sender: TField);
begin
  QMProDetMarcaTITULO_FASE.Text := DameTituloFase(QMProDetMarcaTIPOFASE.AsString);
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaLINEA_TAREAChange(Sender: TField);
begin
  QMProDetMarcaTITULO_TAREA.Text := DameTituloTarea(QMProDetMarcaTIPOTAREA.AsString);
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaRECURSOChange(Sender: TField);
begin
  QMProDetMarcaTITULO_RECURSO.Text := DameTituloRecurso(QMProDetMarcaRECURSO.AsString);

  // Busco el precio y tipo del recurso
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT IMPORTE, TIPORECURSO FROM PRO_RECURSOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' RECURSO = :RECURSO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RECURSO'].AsString := QMProDetMarcaRECURSO.AsString;
        ExecQuery;
        QMProDetMarcaPRECIO_RECURSO.AsFloat := FieldByName['IMPORTE'].AsFloat;
        QMProDetMarcaTIPO_RECURSO.Text := FieldByName['TIPORECURSO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMProDetMarca.State in [dsEdit, dsInsert])) then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value * QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesOpeEsp.QMProCabMarcaNewRecord(DataSet: TDataSet);
begin
  QMProCabMarcaEMPRESA.AsInteger := REntorno.Empresa;
  QMProCabMarcaEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProCabMarcaCANAL.AsInteger := REntorno.Canal;
  QMProCabMarcaSERIE.AsString := REntorno.Serie;
  QMProCabMarcaFECHA.AsDateTime := REntorno.FechaTrab;
  QMProCabMarcaTipo.AsString := 'MO';
  QMProCabMarcaTIEMPO_TOT.AsFloat := 0;
  QMProCabMarcaRIG.AsInteger := DMMain.Contador_EECS(REntorno.Serie, 'ZMA');
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaNewRecord(DataSet: TDataSet);
var
  Imputacion, TipoImputacion, c : integer;
begin
  QMProDetMarcaEMPRESA.AsInteger := QMProCabMarcaEMPRESA.AsInteger;
  QMProDetMarcaEJERCICIO.AsInteger := QMProCabMarcaEJERCICIO.AsInteger;
  QMProDetMarcaCANAL.AsInteger := QMProCabMarcaCANAL.AsInteger;
  QMProDetMarcaSERIE.AsString := QMProCabMarcaSERIE.AsString;
  QMProDetMarcaRIG.AsInteger := QMProCabMarcaRIG.AsInteger;
  QMProDetMarcaTipo.AsString := 'MO';
  QMProDetMarcaTIPO_MARCAJE.AsString := '001';
  QMProDetMarcaTiempo.AsFloat := 0;
  QMProDetMarcaFECHA_PREV.AsDateTime := REntorno.FechaTrabSH;
  QMProDetMarcaFECHA_REAL.AsDateTime := REntorno.FechaTrabSH;
  QMProDetMarcaENTRADA.AsInteger := REntorno.Entrada;
  QMProDetMarcaNUEVA_TAREA.AsInteger := 1;
  QMProDetMarcaCANTIDAD.AsFloat := 0;

  // Busco el recurs, tarea y la imputación per defecte d'aquest operari
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT RECURSO, TIPOTAREA, IMPUTACION, TIPOIMPUTACION FROM OPE_EMPLEADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMProCabMarcaOPERARIO.AsInteger;
        ExecQuery;
        QMProDetMarcaTIPOTAREA.AsString := FieldByName['TIPOTAREA'].AsString;
        QMProDetMarcaRECURSO.AsString := FieldByName['RECURSO'].AsString;
        TipoImputacion := FieldByName['TIPOIMPUTACION'].AsInteger;
        Imputacion := FieldByName['IMPUTACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Recurso
  if (TipoImputacion = 1) then
  begin
     // Busco el titulo del recurso
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT OPE.RECURSO, REC.TITULO, REC.IMPORTE FROM OPE_EMPLEADO OPE ');
           SQL.Add(' LEFT JOIN PRO_RECURSOS REC ON  OPE.EMPRESA = REC.EMPRESA AND OPE.RECURSO = REC.RECURSO ');
           SQL.Add(' WHERE ');
           SQL.Add(' OPE.EMPRESA = :EMPRESA AND ');
           SQL.Add(' OPE.EMPLEADO = :EMPLEADO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EMPLEADO'].AsInteger := QMProCabMarcaOPERARIO.AsInteger;
           ExecQuery;
           QMProDetMarcaTITULO_RECURSO.AsString := FieldByName['TITULO'].AsString;
           QMProDetMarcaRECURSO.AsString := FieldByName['RECURSO'].AsString;
           QMProDetMarcaTIPO_RECURSO.AsString := QMProDetMarcaRECURSO.AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Imputación
  if (TipoImputacion = 2) then // Imputa el cost per imputació -2-
  begin
     // Agafo el preu de la imputació
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT IMPORTE, IMPUTACION FROM OPE_EMPLEADO_PRE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EMPLEADO = :EMPLEADO AND ');
           SQL.Add(' LINEA = :LINEA ');
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

  // Linea común para recurso e imputación
  QMProDetMarcaUNIDADES_DEFECTUOSAS.AsFloat := 0;  // no existen
  QMProDetMarcaNUM_REF_SAL.AsInteger := 0;   // no existen
  // QMProDetMarcaESTADO.AsInteger := 1; // marco estado a 1 xq ese marcaje está activo

  // Mostro les columnes de Recurso o Imputació
  // Recurso
  c := EncuentraField(ProFMMarcajesOpeEsp.DBGFDetalle, 'RECURSO');
  if (c >= 0) then
     ProFMMarcajesOpeEsp.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 1);

  // Descripción Recurso
  c := EncuentraField(ProFMMarcajesOpeEsp.DBGFDetalle, 'TITULO_RECURSO');
  if (c >= 0) then
     ProFMMarcajesOpeEsp.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 1);

  // Imputación
  c := EncuentraField(ProFMMarcajesOpeEsp.DBGFDetalle, 'IMPUTACION');
  if (c >= 0) then
     ProFMMarcajesOpeEsp.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);

  // Descripción Imputación
  c := EncuentraField(ProFMMarcajesOpeEsp.DBGFDetalle, 'TITULO_IMPUTACION');
  if (c >= 0) then
     ProFMMarcajesOpeEsp.DBGFDetalle.Columns[c].Visible := (TipoImputacion = 2);

  // Miro si la imputació no té hores (cantidad) o no (temps)
  if (QMProDetMarcaHORAS.AsInteger = 0) then
     ProFMMarcajesOpeEsp.DBGFDetalle.FindColumn('CANTIDAD').Visible := (TipoImputacion = 2); //Cantidad Imputación

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
end;

procedure TProDMMarcajesOpeEsp.QMProCabMarcaOPERARIOChange(Sender: TField);
begin
  QMProCabMarcaNOMBRE_R_SOCIAL.Text := DameTituloEmpleado(QMProCabMarcaOPERARIO.AsInteger);
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaTIEMPO_DECChange(Sender: TField);
begin
  // Si se modifica la hora final, tambien el precio total
  if ((QMProDetMarca.State in [dsEdit, dsInsert]) and (QMProDetMarcaHORAS.AsInteger = 0)) then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value *
        QMProDetMarcaTIEMPO_DEC.Value;
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaIMPUTACIONChange(Sender: TField);
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
        QMProDetMarcaTITULO_IMPUTACION.AsString := FieldByName['DESCRIPCION'].AsString;
        QMProDetMarcaPRECIO_RECURSO.AsFloat := FieldByName['IMPORTE'].AsFloat;
        QMProDetMarcaCANTIDAD.AsInteger := 0;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT I.TIPO_IMPUTACION, T.HORAS ');
        SQL.Add(' FROM OPE_SYS_IMPUTACION I ');
        SQL.Add(' JOIN OPE_SYS_TIPOS_IMPUTACION T ON (I.TIPO_IMPUTACION = T.TIPO_IMPUTACION) ');
        SQL.Add(' WHERE ');
        SQL.Add(' I.IMPUTACION = :IMPUTACION ');
        Params.ByName['IMPUTACION'].AsString := QMProDetMarcaIMPUTACION.AsString;
        ExecQuery;
        QMProDetMarcaHORAS.AsInteger := FieldByName['HORAS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaTIPOFASEChange(Sender: TField);
begin
  QMProDetMarcaTITULO_FASE.Text := DameTituloFase(QMProDetMarcaTIPOFASE.AsString);
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaTIPOTAREAChange(Sender: TField);
begin
  QMProDetMarcaTITULO_TAREA.Text := DameTituloTarea(QMProDetMarcaTIPOTAREA.AsString);
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaCANTIDADChange(Sender: TField);
begin
  // Si la imputació no és per hores..
  if (QMProDetMarcaHORAS.AsInteger = 0) then
     QMProDetMarcaTotal_Recurso.Value := QMProDetMarcaPrecio_Recurso.Value * QMProDetMarcaCANTIDAD.Value;
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaID_ORDENChange(Sender: TField);
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

// sfg_rsl proceso para recalcular tiempo en marcajes
procedure TProDMMarcajesOpeEsp.RecalculaTiempo;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_RECALCULA_TIEMPO_MARCAJE';
        TFParada.Create(Self).ExecQuery(Q, _('Recalculando tiempo de marcajes'));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMMarcajesOpeEsp.QMProCabMarcaBeforeClose(DataSet: TDataSet);
begin
  QMProDetMarca.Close;
  xInfoActualizada.Close;
end;

procedure TProDMMarcajesOpeEsp.QMProDetMarcaAfterPost(DataSet: TDataSet);
var
  Linea : integer;
begin
  Linea := QMProDetMarcaLINEA.AsInteger;
  Refrescar(QMProCabMarca, 'RIG', QMProCabMarcaRIG.AsInteger);
  Posicionar(QMProDetMarca, 'LINEA', Linea);
end;

end.
