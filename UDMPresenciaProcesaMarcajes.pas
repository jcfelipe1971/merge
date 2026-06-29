{CORREGIR UPDATE BLOB QMDetalle.NOTAS}
unit UDMPresenciaProcesaMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TDMPresenciaProcesaMarcajes = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMDetalle: TDataSource;
     QMDetalle: TFIBTableSet;
     QMDetalleID_OPE_PRESENCIA_MARCAJE: TIntegerField;
     QMDetalleFECHA_MARCAJE: TDateTimeField;
     QMDetalleIDENTIFICADOR_EMPLEADO: TFIBStringField;
     QMDetalleIDENTIFICADOR_DISPOSITIVO: TFIBStringField;
     QMDetalleIDENTIFICADOR_TIPO_MARCAJE: TFIBStringField;
     QMDetalleIDENTIFICADOR_INCIDENCIA: TFIBStringField;
     QMDetalleLATITUD: TFloatField;
     QMDetalleLONGITUD: TFloatField;
     QMDetalleID_EMPLEADO: TIntegerField;
     QMDetalleID_DISPOSITIVO: TIntegerField;
     QMDetalleTIPO_MARCAJE: TFIBStringField;
     QMDetalleID_INCIDENCIA: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleERROR_AL_PROCESAR: TFIBStringField;
     QMDetalleID_CAB_PRESENCIA: TIntegerField;
     QMDetalleID_DET_PRESENCIA: TIntegerField;
     QMDetalleENTRADA_AGRUPACION: TIntegerField;
     QMDetalleTITULO_INCIDENCIA: TFIBStringField;
     QMDetalleTITULO_EMPLEADO: TFIBStringField;
     QMDetalleTITULO_DISPOSITIVO: TFIBStringField;
     QMDetalleTITULO_TIPO_MARCAJE: TFIBStringField;
     QMDetalleTITULO_ESTADO: TFIBStringField;
     QMDetalleUSUARIO_CREACION: TIntegerField;
     QMDetalleUSUARIO_MODIFICACION: TIntegerField;
     QMDetalleFECHA_CREACION: TDateTimeField;
     QMDetalleFECHA_MODIFICACION: TDateTimeField;
     QMDetalleMOTIVO_MODIFICACION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleID_INCIDENCIAChange(Sender: TField);
  private
     { Private declarations }
     Marcando: boolean;
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure FiltraMarcajes(IdEmpleadoDesde, IdEmpleadoHasta: integer; FechaDesde, FechaHasta: TDateTime; SoloPendientes: boolean);
     procedure MarcaMarcajes(Modo: integer);
     procedure ProcesaMarcajesMarcados;
     procedure BusquedaCompleja;
     function DameIdIncidencia(IdentificadorIncidencia: string): integer;
     procedure ImportaRegistro(IdEmpleado: integer; Fecha: TDateTime; IdIncidencia: integer);
     procedure RefrescarDatos(id: integer = 0);
  end;

var
  DMPresenciaProcesaMarcajes : TDMPresenciaProcesaMarcajes;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, UFBusca, DateUtils;

{$R *.dfm}

procedure TDMPresenciaProcesaMarcajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  QMDetalleLATITUD.DisplayFormat := ',0.00000';
  QMDetalleLONGITUD.DisplayFormat := ',0.00000';

  // Evito seleccionar el BLOB de valores originales por temas de velocidad.
  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT ');
  SQLBase.Add('     ID_OPE_PRESENCIA_MARCAJE, ');
  SQLBase.Add('     FECHA_MARCAJE, ');
  SQLBase.Add('     IDENTIFICADOR_EMPLEADO, ');
  SQLBase.Add('     IDENTIFICADOR_DISPOSITIVO, ');
  SQLBase.Add('     IDENTIFICADOR_TIPO_MARCAJE, ');
  SQLBase.Add('     IDENTIFICADOR_INCIDENCIA, ');
  SQLBase.Add('     LATITUD, ');
  SQLBase.Add('     LONGITUD, ');
  SQLBase.Add('     ID_EMPLEADO, ');
  SQLBase.Add('     TITULO_EMPLEADO, ');
  SQLBase.Add('     ID_DISPOSITIVO, ');
  SQLBase.Add('     TITULO_DISPOSITIVO, ');
  SQLBase.Add('     TIPO_MARCAJE, ');
  SQLBase.Add('     TITULO_TIPO_MARCAJE, ');
  SQLBase.Add('     ID_INCIDENCIA, ');
  SQLBase.Add('     TITULO_INCIDENCIA, ');
  SQLBase.Add('     ESTADO, ');
  SQLBase.Add('     TITULO_ESTADO, ');
  SQLBase.Add('     ERROR_AL_PROCESAR, ');
  SQLBase.Add('     ID_CAB_PRESENCIA, ');
  SQLBase.Add('     ID_DET_PRESENCIA, ');
  SQLBase.Add('     ENTRADA_AGRUPACION, ');
  SQLBase.Add('     USUARIO_CREACION, ');
  SQLBase.Add('     USUARIO_MODIFICACION, ');
  SQLBase.Add('     FECHA_CREACION, ');
  SQLBase.Add('     FECHA_MODIFICACION, ');
  SQLBase.Add('     MOTIVO_MODIFICACION ');
  SQLBase.Add(' FROM VER_OPE_PRESENCIA_MARCAJE ');

  with QMDetalle do
  begin
     if Active then
        Close;

     UpdateSQL.Clear;
     UpdateSQL.Add(' UPDATE OPE_PRESENCIA_MARCAJE ');
     UpdateSQL.Add(' SET ');
     UpdateSQL.Add('   ID_EMPLEADO = :ID_EMPLEADO ');
     UpdateSQL.Add('   ,ID_DISPOSITIVO = :ID_DISPOSITIVO ');
     UpdateSQL.Add('   ,TIPO_MARCAJE = :TIPO_MARCAJE ');
     UpdateSQL.Add('   ,ID_INCIDENCIA = :ID_INCIDENCIA ');
     UpdateSQL.Add('   ,ESTADO = :ESTADO ');
     UpdateSQL.Add('   ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION ');
     UpdateSQL.Add(' WHERE ');
     UpdateSQL.Add('   ID_OPE_PRESENCIA_MARCAJE = :ID_OPE_PRESENCIA_MARCAJE ');

     SelectSQL.Clear;
     SelectSQL.Text := SQLBase.Text;
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY FECHA_MARCAJE ');
  end;

  Marcando := False;
end;

procedure TDMPresenciaProcesaMarcajes.DataModuleDestroy(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OPE_PRESENCIA_MARCAJE ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA_AGRUPACION = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION ');
        Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  SQLBase.Free;
end;

procedure TDMPresenciaProcesaMarcajes.FiltraMarcajes(IdEmpleadoDesde, IdEmpleadoHasta: integer; FechaDesde, FechaHasta: TDateTime; SoloPendientes: boolean);
begin
  with QMDetalle do
  begin
     if Active then
        Close;

     SelectSQL.Text := SQLBase.Text;
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' FECHA_MARCAJE BETWEEN :FECHA_D AND :FECHA_H ');
     if ((IdEmpleadoDesde <> 0) and (IdEmpleadoHasta <> 0)) then
        SelectSQL.Add(' AND ID_EMPLEADO BETWEEN :ID_EMPLEADO_D AND :ID_EMPLEADO_H ');
     if SoloPendientes then
        SelectSQL.Add(' AND ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY FECHA_MARCAJE ');

     if ((IdEmpleadoDesde <> 0) and (IdEmpleadoHasta <> 0)) then
     begin
        Params.ByName['ID_EMPLEADO_D'].AsInteger := IdEmpleadoDesde;
        Params.ByName['ID_EMPLEADO_H'].AsInteger := IdEmpleadoHasta;
     end;
     Params.ByName['FECHA_D'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_H'].AsDateTime := RecodeTime(FechaHasta, 23, 59, 59, 999);

     Open;
  end;
end;

procedure TDMPresenciaProcesaMarcajes.MarcaMarcajes(Modo: integer);
var
  id : integer;
  Valor : integer;
begin
  // Guardo ID para refrescar datos al final.
  id := QMDetalleID_OPE_PRESENCIA_MARCAJE.AsInteger;

  if (Modo = 0) then
     Valor := 0
  else
     Valor := REntorno.Entrada;

  with QMDetalle do
  begin
     DisableControls;
     try
        Marcando := True;
        First;
        while not EOF do
        begin
           if (QMDetalleENTRADA_AGRUPACION.AsInteger <> Valor) and (QMDetalleESTADO.AsInteger = 0) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OPE_PRESENCIA_MARCAJE SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION WHERE ID_OPE_PRESENCIA_MARCAJE = :ID_OPE_PRESENCIA_MARCAJE ');
                    Params.ByName['ID_OPE_PRESENCIA_MARCAJE'].AsInteger := QMDetalleID_OPE_PRESENCIA_MARCAJE.AsInteger;
                    Params.ByName['ENTRADA_AGRUPACION'].AsInteger := Valor;
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
        Marcando := False;
        EnableControls;
     end;
  end;

  RefrescarDatos(id);
end;

procedure TDMPresenciaProcesaMarcajes.ProcesaMarcajesMarcados;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE PRESENCIA_PROCESA_MARCAJE(:ENTRADA_AGRUPACION) ');
        Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TDMPresenciaProcesaMarcajes.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMDetalle, '00000');
end;

procedure TDMPresenciaProcesaMarcajes.QMDetalleAfterPost(DataSet: TDataSet);
begin
  // Refresco y reposiciono registro
  if not Marcando then
     RefrescarDatos(QMDetalleID_OPE_PRESENCIA_MARCAJE.AsInteger);
end;

function TDMPresenciaProcesaMarcajes.DameIdIncidencia(IdentificadorIncidencia: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_INCIDENCIA FROM PRO_SYS_TIPO_INCIDENCIA WHERE IDENTIFICADOR_INCIDENCIA = :IDENTIFICADOR_INCIDENCIA';
        Params.ByName['IDENTIFICADOR_INCIDENCIA'].AsString := IdentificadorIncidencia;
        ExecQuery;
        Result := FieldByName['ID_INCIDENCIA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPresenciaProcesaMarcajes.ImportaRegistro(IdEmpleado: integer; Fecha: TDateTime; IdIncidencia: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO OPE_PRESENCIA_MARCAJE ( ');
        SQL.Add(' TIPO, ID_EMPLEADO, FECHA_MARCAJE, ID_INCIDENCIA, ENTRADA) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' ''PRE'', :ID_EMPLEADO, :FECHA_MARCAJE, :ID_INCIDENCIA, :ENTRADA) ');

        Params.ByName['ID_EMPLEADO'].AsInteger := IdEmpleado;
        Params.ByName['FECHA_MARCAJE'].AsDateTime := Fecha;
        Params.ByName['ID_INCIDENCIA'].AsInteger := IdIncidencia;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPresenciaProcesaMarcajes.RefrescarDatos(id: integer = 0);
begin
  if (id = 0) then
     id := QMDetalleID_OPE_PRESENCIA_MARCAJE.AsInteger;

  Refrescar(QMDetalle, 'ID_OPE_PRESENCIA_MARCAJE', id);
end;

procedure TDMPresenciaProcesaMarcajes.QMDetalleID_INCIDENCIAChange(Sender: TField);
begin
  QMDetalleTITULO_INCIDENCIA.AsString := DameTituloIncidencia(QMDetalleID_INCIDENCIA.AsInteger);
end;

end.
