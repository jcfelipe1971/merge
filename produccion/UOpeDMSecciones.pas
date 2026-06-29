unit UOpeDMSecciones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, FIBQuery, HYFIBQuery;

type
  TOpeDMSecciones = class(TDataModule)
     QMSecciones: TFIBTableSet;
     DSQMSecciones: TDataSource;
     TLocal: THYTransaction;
     QMSeccionesEMPRESA: TIntegerField;
     QMSeccionesSECCION: TFIBStringField;
     QMSeccionesDESCRIPCION: TFIBStringField;
     QMSeccionesD: TFIBTableSet;
     DSQMSeccionesD: TDataSource;
     QMSeccionesDSECCION: TFIBStringField;
     QMSeccionesDEMPRESA: TIntegerField;
     QMSeccionesDLINEA: TIntegerField;
     QMSeccionesDDESCRIPCION: TFIBStringField;
     QMTareasD: TFIBTableSet;
     DSQMTareasD: TDataSource;
     xVerTareaD: TFIBTableSet;
     xVerTareaDEMPRESA: TIntegerField;
     xVerTareaDEMPLEADO: TIntegerField;
     xVerTareaDSECCION: TFIBStringField;
     xVerTareaDTAREA: TIntegerField;
     xVerTareaDCAPACITACION: TIntegerField;
     xVerEmpleado: TFIBTableSet;
     DSxVerTareaD: TDataSource;
     xVerEmpleadoEMPLEADO: TIntegerField;
     xVerEmpleadoTERCERO: TIntegerField;
     xVerEmpleadoTITULO: TFIBStringField;
     xVerEmpleadoNIF: TFIBStringField;
     QMCapacitacionTotales: TFIBTableSet;
     QMCapacitacionTotalesEMPLEADO: TIntegerField;
     QMCapacitacionTotalesSECCION: TFIBStringField;
     QMCapacitacionTotalesCAPACITACION: TFloatField;
     QMCapacitacionTotalesTOTAL_REAL: TIntegerField;
     QMCapacitacionTotalesTOTAL_POSIBLE: TIntegerField;
     QMCapacitacionTotalesEMPRESA: TIntegerField;
     QMSeccionesNTAREAS: TIntegerField;
     QMSeccionesNPERSONAS: TIntegerField;
     QMSeccionesDTOTAL_REAL: TIntegerField;
     QMSeccionesDTOTAL_POSIBLE: TIntegerField;
     QMSeccionesDPOLIVALENCIA: TFloatField;
     QMSeccionesTOTAL_REAL: TIntegerField;
     QMSeccionesTOTAL_POSIBLE: TIntegerField;
     frIsoSeccCapaci: TfrHYReport;
     frDBSecciones: TfrDBDataSet;
     frDBSeccionesD: TfrDBDataSet;
     frDBTareasD: TfrDBDataSet;
     QMTareasDEMPRESA: TIntegerField;
     QMTareasDSECCION: TFIBStringField;
     QMTareasDEMPLEADO: TIntegerField;
     QMSeccionesMOSTRAR_EN_MAQUINAS: TIntegerField;
     TUpdate: THYTransaction;
     QMSeccionesCAPACITACION: TIntegerField;
     QMSeccionesTAREA: TIntegerField;
     QMSeccionesCRITERIO_ORDEN: TMemoField;
     QMSeccionesESTADO_MARCAJE_PEDIDO: TIntegerField;
     QMSeccionesSECUENCIA: TIntegerField;
     QMSeccionesHOJA_SIEMPRE_VISIBLE: TIntegerField;
     procedure Graba(DataSet: TDataSet);
     procedure OpeDMSeccionesCreate(Sender: TObject);
     procedure QMSeccionesBeforePost(DataSet: TDataSet);
     procedure QMSeccionesAfterPost(DataSet: TDataSet);
     procedure QMSeccionesAfterOpen(DataSet: TDataSet);
     procedure QMSeccionesDNewRecord(DataSet: TDataSet);
     procedure QMSeccionesNewRecord(DataSet: TDataSet);
     procedure frIsoSeccCapaciGetValue(const ParName: string; var ParValue: variant);
     procedure frIsoSeccCapaciEnterRect(Memo: TStringList; View: TfrView);
     procedure QMSeccionesBeforeClose(DataSet: TDataSet);
     procedure xVerTareaDAfterOpen(DataSet: TDataSet);
     procedure xVerTareaDBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraSeccion(Filtro: string);
  end;

var
  OpeDMSecciones : TOpeDMSecciones;
  NumTareas : integer;

implementation

uses UDMMain, UFBusca, UEntorno, UOpeFMSecciones, URecursos, UDMListados, UUtiles;

{$R *.DFM}

procedure TOpeDMSecciones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMSecciones, '10000');
end;

procedure TOpeDMSecciones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  QMSecciones.Refresh;
end;

procedure TOpeDMSecciones.OpeDMSeccionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMSecciones, '10000');
  // QMSecciones.Open;
end;

procedure TOpeDMSecciones.QMSeccionesBeforePost(DataSet: TDataSet);
begin
  QMSeccionesSECCION.AsString := UpperCase(QMSeccionesSECCION.AsString);
end;

procedure TOpeDMSecciones.QMSeccionesAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  Refrescar(QMSecciones, 'SECCION', QMSeccionesSECCION.AsString);
end;

procedure TOpeDMSecciones.QMSeccionesAfterOpen(DataSet: TDataSet);
begin
  QMSeccionesD.Open;
end;

procedure TOpeDMSecciones.QMSeccionesDNewRecord(DataSet: TDataSet);
begin
  if ((QMSecciones.State = dsInsert) or (QMSecciones.State = dsEdit)) then
  begin
     QMSecciones.Post;
     OpeFMSecciones.NavMain.BtnClick(nbRefresh);
     QMSeccionesD.Edit;
  end;

  QMSeccionesDEMPRESA.AsInteger := REntorno.Empresa;
  QMSeccionesDSECCION.AsString := QMSeccionesSECCION.AsString;

  // Obtenemos el numero de linea mas alto en el INC actual
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM OPE_SECCIONES_D WHERE EMPRESA = :EMPRESA AND SECCION = :SECCION';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SECCION'].AsString := QMSeccionesSECCION.AsString;
        ExecQuery;
        QMSeccionesDLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMSecciones.QMSeccionesNewRecord(DataSet: TDataSet);
begin
  QMSeccionesEMPRESA.AsInteger := REntorno.Empresa;
  QMSeccionesNTAREAS.AsInteger := 0;
  QMSeccionesNPERSONAS.AsInteger := 0;
  QMSeccionesMOSTRAR_EN_MAQUINAS.AsInteger := 0;
  QMSeccionesSECUENCIA.AsInteger := 0;
end;

procedure TOpeDMSecciones.frIsoSeccCapaciGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'Capacitacion' then
  begin
     with xVerTareaD do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SECCION'].AsString := QMSeccionesDSECCION.AsString;
        Params.ByName['TAREA'].AsInteger := QMSeccionesDLINEA.AsInteger;
        Params.ByName['EMPLEADO'].AsInteger := QMTareasDEMPLEADO.AsInteger;
        Open;
     end;
     ParValue := xVerTareaDCAPACITACION.AsString;
  end;

  if ParName = 'Empleados' then
  begin
     xVerEmpleado.Close;
     xVerEmpleado.Open;
     ParValue := xVerEmpleadoTITULO.AsString;
     QMCapacitacionTotales.Close;
     QMCapacitacionTotales.Open;
  end;

  if ParName = 'NumTareas' then
  begin
     QMSeccionesD.Last;
     NumTareas := QMSeccionesD.RecordCount;
     ParValue := NumTareas;
     QMSeccionesD.First;
  end;

  if ParName = 'NumEmpleados' then
  begin
     QMTareasD.Last;
     ParValue := QMTareasD.RecordCount;
     QMTareasD.First;
  end;
end;

procedure TOpeDMSecciones.frIsoSeccCapaciEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);

  if (Memo.Count > 0) then
  begin
     if Memo[0] = '[QMSeccionesD."DESCRIPCION"]' then
     begin
        View.Parent.dx := 484 div (NumTareas);
        View.dx := 484 div (NumTareas);
     end;

     if Memo[0] = '[Capacitacion]' then
     begin
        View.Parent.dx := 484 div (NumTareas);
        View.dx := 484 div (NumTareas);
     end;

     if Memo[0] = '[QMSeccionesD."TOTAL_REAL"]' then
     begin
        View.Parent.dx := 484 div (NumTareas);
        View.dx := 484 div (NumTareas);
     end;

     if Memo[0] = '[QMSeccionesD."TOTAL_POSIBLE"]' then
     begin
        View.Parent.dx := 484 div (NumTareas);
        View.dx := 484 div (NumTareas);
     end;

     if Memo[0] = '[QMSeccionesD."POLIVALENCIA"]%' then
     begin
        View.Parent.dx := 484 div (NumTareas);
        View.dx := 484 div (NumTareas);
     end;
  end;
end;

procedure TOpeDMSecciones.QMSeccionesBeforeClose(DataSet: TDataSet);
begin
  QMSeccionesD.Close;
end;

procedure TOpeDMSecciones.xVerTareaDAfterOpen(DataSet: TDataSet);
begin
  xVerEmpleado.Open;
  QMCapacitacionTotales.Open;
end;

procedure TOpeDMSecciones.xVerTareaDBeforeClose(DataSet: TDataSet);
begin
  xVerEmpleado.Close;
  QMCapacitacionTotales.Close;
end;

procedure TOpeDMSecciones.FiltraSeccion(Filtro: string);
begin
  with QMSecciones do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM OPE_SECCIONES ');
     SelectSQL.Add('WHERE EMPRESA = ?EMPRESA ');
     if (Filtro <> '') then
        SelectSQL.Add(' AND ' + Filtro);
     SelectSQL.Add(' ORDER BY EMPRESA, SECCION ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

end.
