unit UDMHojaDeTrabajo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMHojaDeTrabajo = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     DSxAsignado: TDataSource;
     xDisponible: TFIBDataSetRO;
     DSxDisponible: TDataSource;
     xDisponibleEMPRESA: TIntegerField;
     xDisponibleEJERCICIO: TIntegerField;
     xDisponibleCANAL: TIntegerField;
     xDisponibleSERIE: TFIBStringField;
     xDisponibleRIG_OF: TIntegerField;
     xDisponibleLINEA_FASE: TIntegerField;
     xDisponibleLINEA_TAREA: TIntegerField;
     xDisponibleRECURSO: TFIBStringField;
     xDisponibleTITULO_RECURSO: TFIBStringField;
     xDisponibleTIPO_RECURSO: TFIBStringField;
     xDisponibleIDENTIFICADOR: TIntegerField;
     xDisponibleTAREA: TFIBStringField;
     xDisponibleSITUACION: TIntegerField;
     xDisponibleUNI_PENDIENTES: TFloatField;
     xDisponibleCOMPUESTO: TFIBStringField;
     xDisponibleTITULO_COMPUESTO: TFIBStringField;
     xDisponibleID_ORDEN: TIntegerField;
     xDisponibleTITULO_TAREA: TFIBStringField;
     xDisponibleTIPO_TAREA: TFIBStringField;
     xDisponibleTIPO_FASE: TFIBStringField;
     xDisponibleTITULO_FASE: TFIBStringField;
     xAsignado: TFIBTableSet;
     xAsignadoID_HOJA_TRABAJO: TIntegerField;
     xAsignadoEMPRESA: TIntegerField;
     xAsignadoSECCION: TFIBStringField;
     xAsignadoEMPLEADO: TIntegerField;
     xAsignadoID_ORDEN: TIntegerField;
     xAsignadoLINEA_FASE: TIntegerField;
     xAsignadoLINEA_TAREA: TIntegerField;
     xAsignadoFECHA_TRABAJO: TDateTimeField;
     xAsignadoPRIORIDAD: TIntegerField;
     xAsignadoVISIBLE: TIntegerField;
     xAsignadoFINALIZADO: TIntegerField;
     xAsignadoID_IMAGEN: TIntegerField;
     xAsignadoFECHA_INI: TDateTimeField;
     xAsignadoFECHA_FIN: TDateTimeField;
     xAsignadoCANTIDAD: TFloatField;
     xAsignadoCANTIDAD_REALIZADA: TFloatField;
     xAsignadoCLIENTE: TIntegerField;
     xAsignadoNOMBRE_R_SOCIAL: TFIBStringField;
     xAsignadoPEDIDO: TIntegerField;
     xAsignadoARTICULO: TFIBStringField;
     xAsignadoTITULO_ARTICULO: TFIBStringField;
     xAsignadoTIPOTAREA: TFIBStringField;
     xAsignadoTITULO_TAREA: TFIBStringField;
     xAsignadoTIPO: TFIBStringField;
     DSxAsignadoNotas: TDataSource;
     xAsignadoNotas: TFIBTableSet;
     xAsignadoID_ORDEN2: TIntegerField;
     xAsignadoMAQUINA: TIntegerField;
     QMAsignadoTIEMPO_PREVISTO: TFIBStringField;
     QMAsignadoTIEMPO_REAL: TFIBStringField;
     QMAsignadoTOTAL_UNIDADES_FAB: TFloatField;
     QMAsignadoTOTAL_UNIDADES_DEFECTUOSAS: TFloatField;
     QMAsignadoUNIDADES_FAB: TFloatField;
     QMAsignadoUNIDADES_DEFECTUOSAS: TFloatField;
     QMAsignadoTOTAL_UNIDADES_ORDEN: TFloatField;
     xPausas: TFIBDataSetRO;
     DSxPausas: TDataSource;
     xPausasID_PAUSA_TRABAJO: TIntegerField;
     xPausasID_HOJA_TRABAJO: TIntegerField;
     xPausasINICIO: TDateTimeField;
     xPausasFINAL: TDateTimeField;
     xPausasCOMENTARIO: TMemoField;
     xPausasTIPO_INCIDENCIA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xAsignadoNewRecord(DataSet: TDataSet);
     procedure xAsignadoBeforePost(DataSet: TDataSet);
     procedure xAsignadoAfterOpen(DataSet: TDataSet);
     procedure xAsignadoBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Seccion: string;
     TipoFiltro: integer;
     procedure CambiaEstado(IdHojaTrabajo: integer; Estado, Incidencia: string; Comentario: string = '');
     function EstaPausado: boolean;
     {procedure ActualizaTiempoProduccion;}
  public
     { Public declarations }
     procedure AsignaTarea;
     procedure SubirPrioridad;
     procedure BajarPrioridad;
     procedure CambiaSeccion(aSeccion: string);
     procedure RefrescarDisponibles;
     procedure Filtra(aTipoFiltro: integer);
     procedure PreparaNotas;
     procedure ActuVisible(Visible: integer);
     procedure Filtrar(Tipo: string; id: integer);
     procedure LimpiarYOrdenar;
     procedure IniciarHoja;
     procedure FinalizarHoja;
     procedure PausarReanudarHoja;
  end;

var
  DMHojaDeTrabajo : TDMHojaDeTrabajo;

implementation

uses UDMMain, UFParada, UUtiles, UEntorno, UFSeleccionaPausaHojaDeTrabajo;

{$R *.dfm}

procedure TDMHojaDeTrabajo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  TipoFiltro := 0;

  CambiaSeccion('');

  DMMain.FiltraRO(xDisponible, '10100', True);
end;

procedure TDMHojaDeTrabajo.AsignaTarea;
var
  Identificador : integer;
begin
  Identificador := xDisponibleIDENTIFICADOR.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO OPE_HOJAS_TRABAJO ( ');
        SQL.Add(' EMPRESA, TIPO, SECCION, EMPLEADO, ID_DOC, ID_ORDEN, LINEA_FASE, LINEA_TAREA, FECHA_TRABAJO, /*PRIORIDAD,*/ VISIBLE, FINALIZADO, ');
        SQL.Add(' ID_IMAGEN, FECHA_INI, FECHA_FIN, CANTIDAD, CANTIDAD_REALIZADA, TIPOTAREA, CLIENTE, ARTICULO, MAQUINA) ');
        SQL.Add(' SELECT T.EMPRESA, :TIPO, :SECCION, ');
        SQL.Add('        (SELECT MIN(EMPLEADO) ');
        SQL.Add('         FROM OPE_EMPLEADO ');
        SQL.Add('         WHERE ');
        SQL.Add('         EMPRESA = T.EMPRESA), T.IDENTIFICADOR, O.ID_ORDEN, T.LINEA_FASE, T.LINEA_TAREA, ''TODAY'', /*PRIORIDAD,*/ 1, 0, F.ID_IMAGEN, NULL, ');
        SQL.Add('        NULL, T.CANTIDAD, 0, T.TIPOTAREA, O.CLIENTE, O.COMPUESTO, T.MAQUINA ');
        SQL.Add(' FROM PRO_ORD O ');
        SQL.Add(' JOIN PRO_ORD_FASES F ON O.ID_ORDEN = F.ID_ORDEN                                                                                                                                       ');
        SQL.Add(' JOIN PRO_ORD_TAREA T ON F.EMPRESA = T.EMPRESA AND F.EJERCICIO = T.EJERCICIO AND F.CANAL = T.CANAL AND F.SERIES = T.SERIE AND F.RIG_OF = T.RIG_OF AND F.LINEA_FASE = T.LINEA_FASE ');
        SQL.Add(' WHERE ');
        SQL.Add(' T.IDENTIFICADOR = :IDENTIFICADOR ');
        Params.ByName['SECCION'].AsString := Seccion;
        Params.ByName['TIPO'].AsString := 'TAR';
        Params.ByName['IDENTIFICADOR'].AsInteger := Identificador;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarDisponibles;
  xAsignado.Last;
  Posicionar(xDisponible, 'IDENTIFICADOR', Identificador);
end;

procedure TDMHojaDeTrabajo.SubirPrioridad;
var
  IdHojaTrabajo : integer;
  Identificador : integer;
begin
  IdHojaTrabajo := xAsignadoID_HOJA_TRABAJO.AsInteger;
  Identificador := xDisponibleIDENTIFICADOR.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OPE_HOJAS_TRABAJO ');
        SQL.Add(' SET PRIORIDAD = PRIORIDAD -1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_HOJA_TRABAJO = :ID_HOJA_TRABAJO ');
        SQL.Add(' AND PRIORIDAD > 1 ');
        Params.ByName['ID_HOJA_TRABAJO'].AsInteger := IdHojaTrabajo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarDisponibles;
  Posicionar(xAsignado, 'ID_HOJA_TRABAJO', IdHojaTrabajo);
  Posicionar(xDisponible, 'IDENTIFICADOR', Identificador);
end;

procedure TDMHojaDeTrabajo.CambiaSeccion(aSeccion: string);
begin
  // Cambial la seccion teniendo en cuenta el filtro actual.
  /// Tipo Filtro:
  /// 0 Todos
  /// 1 Visibles
  /// 2 No visibles
  /// 3 Iniciados
  /// 4 Cerrados

  Seccion := Trim(aSeccion);

  with xAsignado do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_OPE_HOJAS_TRABAJO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');

     if (Seccion > '') then
        SelectSQL.Add(' AND SECCION = ?SECCION ');

     case TipoFiltro of
        0: SelectSQL.Add(' ');
        1: SelectSQL.Add(' AND FINALIZADO = 0 AND VISIBLE = 1 ');
        2: SelectSQL.Add(' AND FINALIZADO = 0 AND VISIBLE = 0 ');
        3: SelectSQL.Add(' AND FINALIZADO = 0 AND VISIBLE = 1 AND (FECHA_INI IS NOT NULL) ');
        4: SelectSQL.Add(' AND FINALIZADO = 1 ');
     end;

     SelectSQL.Add(' ORDER BY SECCION, PRIORIDAD ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (Seccion > '') then
        Params.ByName['SECCION'].AsString := Seccion;

     Open;
  end;
end;

procedure TDMHojaDeTrabajo.RefrescarDisponibles;
begin
  CambiaSeccion(Seccion);
  xDisponible.Close;
  xDisponible.Open;
end;

procedure TDMHojaDeTrabajo.BajarPrioridad;
var
  IdHojaTrabajo : integer;
  Identificador : integer;
begin
  IdHojaTrabajo := xAsignadoID_HOJA_TRABAJO.AsInteger;
  Identificador := xDisponibleIDENTIFICADOR.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OPE_HOJAS_TRABAJO H ');
        SQL.Add(' SET ');
        SQL.Add(' H.PRIORIDAD = PRIORIDAD + 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' H.ID_HOJA_TRABAJO = :ID_HOJA_TRABAJO AND ');
        SQL.Add(' H.PRIORIDAD < (SELECT MAX(PRIORIDAD) ');
        SQL.Add('                FROM OPE_HOJAS_TRABAJO ');
        SQL.Add('                WHERE ');
        SQL.Add('                EMPRESA = H.EMPRESA AND ');
        SQL.Add('                SECCION = H.SECCION AND ');
        SQL.Add('                EMPLEADO = H.EMPLEADO) ');
        Params.ByName['ID_HOJA_TRABAJO'].AsInteger := IdHojaTrabajo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarDisponibles;
  Posicionar(xAsignado, 'ID_HOJA_TRABAJO', IdHojaTrabajo);
  Posicionar(xDisponible, 'IDENTIFICADOR', Identificador);
end;

procedure TDMHojaDeTrabajo.xAsignadoNewRecord(DataSet: TDataSet);
begin
  xAsignadoEMPRESA.AsInteger := REntorno.Empresa;
  xAsignadoID_IMAGEN.AsInteger := 0;
  xAsignadoCANTIDAD.AsFloat := 0;
  xAsignadoCANTIDAD_REALIZADA.AsFloat := 0;
  xAsignadoVISIBLE.AsInteger := 0;
  xAsignadoFINALIZADO.AsInteger := 0;
  if (Seccion <> '') then
     xAsignadoSECCION.AsString := Seccion;
  xAsignadoTIPO.AsString := 'HOJ';
end;

procedure TDMHojaDeTrabajo.xAsignadoBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_HOJA_TRABAJO', 'ID_HOJA_TRABAJO');
end;

procedure TDMHojaDeTrabajo.Filtra(aTipoFiltro: integer);
begin
  TipoFiltro := aTipoFiltro;
  CambiaSeccion(Seccion);
end;

procedure TDMHojaDeTrabajo.PreparaNotas;
begin
  if (xAsignado.State in [dsEdit, dsInsert]) then
     xAsignado.Post;
  if (xAsignadoFINALIZADO.AsInteger = 0) then
     xAsignadoNotas.Edit;
end;

procedure TDMHojaDeTrabajo.xAsignadoAfterOpen(DataSet: TDataSet);
begin
  xAsignadoNotas.Open;
  xPausas.Open;
end;

procedure TDMHojaDeTrabajo.xAsignadoBeforeClose(DataSet: TDataSet);
begin
  xAsignadoNotas.Close;
  xPausas.Close;
end;

procedure TDMHojaDeTrabajo.ActuVisible(Visible: integer);
var
  IdHojaTrabajo : integer;
begin
  if Confirma and ConfirmaGrave then
  begin
     IdHojaTrabajo := xAsignadoID_HOJA_TRABAJO.AsInteger;
     with xAsignado do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if (xAsignadoVISIBLE.AsInteger <> Visible) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE OPE_HOJAS_TRABAJO SET VISIBLE = ?VISIBLE WHERE ID_HOJA_TRABAJO = ?ID_HOJA_TRABAJO';
                       Params.ByName['VISIBLE'].AsInteger := Visible;
                       Params.ByName['ID_HOJA_TRABAJO'].AsInteger := xAsignadoID_HOJA_TRABAJO.AsInteger;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              Next;
           end;
        finally
           EnableControls;
        end;
     end;

     Refrescar(xAsignado, 'ID_HOJA_TRABAJO', IdHojaTrabajo);
  end;
end;

procedure TDMHojaDeTrabajo.Filtrar(Tipo: string; id: integer);
var
  Pedido, Ejercicio, Empresa, Canal : integer;
  Serie : string;
begin
  /// Filtro contiene ID_S de un pedido.

  // Busco Nro de pedido segun ID_S
  Empresa := 0;
  Ejercicio := 0;
  Canal := 0;
  Serie := '';
  Pedido := 0;
  if ((Tipo = 'PEC') and (id <> 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, RIG FROM GES_CABECERAS_S WHERE ID_S = ?ID_S';
           Params.ByName['ID_S'].AsInteger := Id;
           ExecQuery;
           Empresa := FieldByName['EMPRESA'].AsInteger;
           Ejercicio := FieldByName['EJERCICIO'].AsInteger;
           Canal := FieldByName['CANAL'].AsInteger;
           Serie := FieldByName['SERIE'].AsString;
           Pedido := FieldByName['RIG'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Filtro Asignados para ver solo hojas relacionadas con ese pedido
  with xAsignado do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_OPE_HOJAS_TRABAJO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     // Filtramos por pedido o por id_orden
     if ((Tipo = 'PEC') and (Pedido <> 0)) then
     begin
        SelectSQL.Add('AND EJERCICIO = ?EJERCICIO ');
        SelectSQL.Add('AND CANAL = ?CANAL ');
        SelectSQL.Add('AND SERIE = ?SERIE ');
        SelectSQL.Add('AND PEDIDO = ?PEDIDO ');
     end
     else
     if ((Tipo = 'PRO') and (id <> 0)) then
        SelectSQL.Add('AND ID_ORDEN = ?ID_ORDEN ')
     else
     if ((Tipo = 'REP') and (id <> 0)) then
        SelectSQL.Add('AND ID_ORDEN = ?ID_ORDEN_REP ');

     SelectSQL.Add(' ORDER BY PRIORIDAD ');

     // Sin filtro
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Con filtro
     if ((Tipo = 'PEC') and (Pedido <> 0)) then
     begin
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['PEDIDO'].AsInteger := Pedido;
     end
     else
     if ((Tipo = 'PRO') and (id <> 0)) then
        Params.ByName['ID_ORDEN'].AsInteger := Id
     else
     if ((Tipo = 'REP') and (id <> 0)) then
        Params.ByName['ID_ORDEN_REP'].AsInteger := Id;

     Open;
  end;
end;

procedure TDMHojaDeTrabajo.LimpiarYOrdenar;
var
  IdHojaTrabajo : integer;
  Identificador : integer;
begin
  IdHojaTrabajo := xAsignadoID_HOJA_TRABAJO.AsInteger;
  Identificador := xDisponibleIDENTIFICADOR.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE OPE_HOJAS_TRABAJO_LIMPIA_ORDENA');
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarDisponibles;
  Posicionar(xAsignado, 'ID_HOJA_TRABAJO', IdHojaTrabajo);
  Posicionar(xDisponible, 'IDENTIFICADOR', Identificador);
end;

procedure TDMHojaDeTrabajo.CambiaEstado(IdHojaTrabajo: integer; Estado, Incidencia: string; Comentario: string = '');
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE OPE_HOJAS_TRABAJO_CAMBIA_ESTADO(:ID_HOJA_TRABAJO, :ESTADO, :ID_INCIDENCIA, :COMENTARIO)');
        Params.ByName['ID_HOJA_TRABAJO'].AsInteger := IdHojaTrabajo;
        Params.ByName['ESTADO'].AsString := Estado;
        Params.ByName['ID_INCIDENCIA'].AsString := Incidencia;
        Params.ByName['COMENTARIO'].AsString := Comentario;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Ya se llama al ejecutar OPE_HOJAS_TRABAJO_CAMBIA_ESTADO
  // ActualizaTiempoProduccion;
end;

procedure TDMHojaDeTrabajo.FinalizarHoja;
begin
  // Debe estar iniciada y no finalizada
  if (xAsignadoFECHA_INI.AsDateTime > EncodeDate(1900, 1, 1)) and (xAsignadoFINALIZADO.AsInteger = 0) then
  begin
     CambiaEstado(xAsignadoID_HOJA_TRABAJO.AsInteger, 'F', '');
     Refrescar(xAsignado, 'ID_HOJA_TRABAJO', xAsignadoID_HOJA_TRABAJO.AsInteger, False, True);
  end;
end;

procedure TDMHojaDeTrabajo.IniciarHoja;
begin
  // No debe estar iniciada
  if (xAsignadoFECHA_INI.AsDateTime <= EncodeDate(1900, 1, 1)) then
  begin
     CambiaEstado(xAsignadoID_HOJA_TRABAJO.AsInteger, 'I', '');
     Refrescar(xAsignado, 'ID_HOJA_TRABAJO', xAsignadoID_HOJA_TRABAJO.AsInteger, False, True);
  end;
end;

procedure TDMHojaDeTrabajo.PausarReanudarHoja;
var
  CodIncidencia, Comentario : string;
begin
  CodIncidencia := '';
  Comentario := '';
  if ((xAsignadoFECHA_INI.AsDateTime > EncodeDate(1900, 1, 1)) and (xAsignadoFINALIZADO.AsInteger = 0)) then
  begin
     if ((xPausas.RecordCount = 0) or ((xPausasINICIO.AsDateTime > EncodeDate(1900, 1, 1)) and (xPausasFINAL.AsDateTime > EncodeDate(1900, 1, 1)))) then
     begin
        with TFSeleccionaPausaHojaDeTrabajo do
        begin
           if PideDato(CodIncidencia, Comentario) then
              CambiaEstado(xAsignadoID_HOJA_TRABAJO.AsInteger, 'P', CodIncidencia, Comentario);
        end;
     end
     else
     begin
        if (not EstaPausado) then
           CambiaEstado(xAsignadoID_HOJA_TRABAJO.AsInteger, 'R', '', Comentario);
     end;

     Refrescar(xPausas, 'ID_PAUSA_TRABAJO', xPausasID_PAUSA_TRABAJO.AsInteger, False, True);
  end;
end;

function TDMHojaDeTrabajo.EstaPausado: boolean;
begin
  //Result := False;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(ID_PAUSA_TRABAJO) EXISTE ');
        SQL.Add(' FROM OPE_HOJAS_TRABAJO_PAUSAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_PAUSA_TRABAJO = :ID_PAUSA_TRABAJO AND ');
        SQL.Add(' INICIO > ''01-01-1900'' AND ');
        SQL.Add(' FINAL IS NULL ');
        Params.ByName['ID_PAUSA_TRABAJO'].AsInteger := xPausasID_PAUSA_TRABAJO.AsInteger;
        Result := (FieldByName['EXISTE'].AsInteger = 1);

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

{procedure TDMHojaDeTrabajo.ActualizaTiempoProduccion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE ACTUALIZA_TIEMPOS_PRODUCCION(:ID_HOJA_TRABAJO)';
        Params.ByName['ID_HOJA_TRABAJO'].AsInteger := xAsignadoID_HOJA_TRABAJO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;}

end.
