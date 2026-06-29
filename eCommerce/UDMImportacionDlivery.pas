unit UDMImportacionDlivery;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMImportacionDlivery = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPedidosDlivery: TFIBTableSet;
     DSQMPedidosDlivery: TDataSource;
     QMPedidosDliveryID: TIntegerField;
     QMPedidosDliveryID_ORIGEN: TIntegerField;
     QMPedidosDliveryFECHA: TDateTimeField;
     QMPedidosDliveryNOMBRE_CLIENTE: TFIBStringField;
     QMPedidosDliveryDIRECCION_RECOGIDA: TFIBStringField;
     QMPedidosDliveryCOMUNA_RECOGIDA: TFIBStringField;
     QMPedidosDliveryPERSONA_ENTREGA: TFIBStringField;
     QMPedidosDliveryTELEFONO_ENTREGA: TFIBStringField;
     QMPedidosDliveryDIRECCION_ENTREGA: TFIBStringField;
     QMPedidosDliveryCOMUNA_ENTREGA: TFIBStringField;
     QMPedidosDliveryMOVIL: TFIBStringField;
     QMPedidosDliveryESTADO: TFIBStringField;
     QMPedidosDliveryFECHA_ENTREGA: TDateTimeField;
     QMPedidosDliveryEMPRESA: TIntegerField;
     QMPedidosDliveryCLIENTE: TIntegerField;
     QMPedidosDliveryDIRECCION: TIntegerField;
     QMPedidosDliveryAGENTE: TIntegerField;
     QMPedidosDliveryARTICULO: TFIBStringField;
     QMPedidosDliveryFECHA_RETIRO: TDateTimeField;
     QMPedidosDliveryID_DETALLES_S: TIntegerField;
     QMPedidosDliveryENTRADA_AGRUPACION: TIntegerField;
     QMPedidosDliveryCOMENTARIO: TFIBStringField;
     QMPedidosDliveryCOMENTARIO_ENTREGA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMPedidosDliveryNewRecord(DataSet: TDataSet);
     procedure QMPedidosDliveryBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AgregaDelivery(IdOrigen: integer; NombreCliente: string; Fecha: TDateTime; DireccionRecogida, ComunaRecogida, PersonaEntrega, TelefonoEntrega, DireccionEntrega, ComunaEntrega, CodPostalEntrega, Comentario, Movil,{ NombreAgente,} Estado: string; {FechaRetiro, }FechaEntrega: TDateTime; ComentarioEntrega: string);
     procedure Refrescar;
     procedure FiltraDelivery(ClienteDesde, ClienteHasta: integer; FechaDesde, FechaHasta: TDateTime; VerSoloPendientes: boolean; Orden: integer);
     procedure Marcar(Entrada, DesdeCliente, HastaCliente: integer; FechaDesde, FechaHasta: TDateTime);
     procedure GeneraPedidos;
     procedure BorraRegistrosPendientes;
  end;

var
  DMImportacionDlivery : TDMImportacionDlivery;

implementation

uses
  UDMMain, UEntorno, HYFIBQuery, UUtiles;

{$R *.dfm}

procedure TDMImportacionDlivery.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMImportacionDlivery.DataModuleDestroy(Sender: TObject);
begin
  QMPedidosDlivery.Close;
end;

procedure TDMImportacionDlivery.AgregaDelivery(IdOrigen: integer; NombreCliente: string; Fecha: TDateTime; DireccionRecogida, ComunaRecogida, PersonaEntrega, TelefonoEntrega, DireccionEntrega, ComunaEntrega, CodPostalEntrega, Comentario, Movil,{ NombreAgente,} Estado: string; {FechaRetiro, }FechaEntrega: TDateTime; ComentarioEntrega: string);
var
  Existe : boolean;
begin
  // Verifico si esta línea ya fue importada
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_ORIGEN FROM IMP_DLIVERY WHERE ID_ORIGEN = :ID_ORIGEN');
        Params.ByName['ID_ORIGEN'].AsInteger := IdOrigen;
        ExecQuery;
        Existe := (FieldByName['ID_ORIGEN'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (not Existe) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO IMP_DLIVERY ');
           SQL.Add(' (ID_ORIGEN, FECHA, NOMBRE_CLIENTE, DIRECCION_RECOGIDA, COMUNA_RECOGIDA, /*FECHA_RETIRO,*/ ');
           SQL.Add(' PERSONA_ENTREGA, TELEFONO_ENTREGA, DIRECCION_ENTREGA, COMUNA_ENTREGA, COMENTARIO, ');
           SQL.Add(' MOVIL, ESTADO, FECHA_ENTREGA, COMENTARIO_ENTREGA, ');
           SQL.Add(' EMPRESA, CLIENTE, DIRECCION, AGENTE, ARTICULO, ID_DETALLES_S) ');
           SQL.Add(' VALUES ');
           SQL.Add(' (:ID_ORIGEN, :FECHA, :NOMBRE_CLIENTE, :DIRECCION_RECOGIDA, :COMUNA_RECOGIDA, /*:FECHA_RETIRO,*/ ');
           SQL.Add(' :PERSONA_ENTREGA, :TELEFONO_ENTREGA, :DIRECCION_ENTREGA, :COMUNA_ENTREGA, :COMENTARIO, ');
           SQL.Add(' :MOVIL, :ESTADO, :FECHA_ENTREGA, :COMENTARIO_ENTREGA, ');
           SQL.Add(' :EMPRESA, :CLIENTE, :DIRECCION, :AGENTE, :ARTICULO, :ID_DETALLES_S) ');

           Params.ByName['ID_ORIGEN'].AsInteger := IdOrigen;
           Params.ByName['NOMBRE_CLIENTE'].AsString := NombreCliente;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           Params.ByName['DIRECCION_RECOGIDA'].AsString := DireccionRecogida;
           Params.ByName['COMUNA_RECOGIDA'].AsString := ComunaRecogida;
           // Params.ByName['FECHA_RETIRO'].AsDateTime := FechaRetiro;
           Params.ByName['PERSONA_ENTREGA'].AsString := PersonaEntrega;
           Params.ByName['TELEFONO_ENTREGA'].AsString := TelefonoEntrega;
           Params.ByName['DIRECCION_ENTREGA'].AsString := DireccionEntrega;
           Params.ByName['COMUNA_ENTREGA'].AsString := ComunaEntrega;
           Params.ByName['COMENTARIO'].AsString := Comentario;
           Params.ByName['MOVIL'].AsString := Movil;
           Params.ByName['ESTADO'].AsString := Estado;
           Params.ByName['FECHA_ENTREGA'].AsDateTime := FechaEntrega;
           Params.ByName['COMENTARIO_ENTREGA'].AsString := ComentarioEntrega;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CLIENTE'].AsInteger := 0;
           Params.ByName['DIRECCION'].AsInteger := 0;
           Params.ByName['AGENTE'].AsInteger := 0;
           Params.ByName['ARTICULO'].AsString := '';
           Params.ByName['ID_DETALLES_S'].AsInteger := 0;

           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMImportacionDlivery.QMPedidosDliveryNewRecord(DataSet: TDataSet);
begin
  QMPedidosDliveryID_ORIGEN.AsInteger := 0;
  QMPedidosDliveryFECHA.AsDateTime := REntorno.FechaTrab;
  QMPedidosDliveryNOMBRE_CLIENTE.AsString := '';
  QMPedidosDliveryDIRECCION_RECOGIDA.AsString := '';
  QMPedidosDliveryCOMUNA_RECOGIDA.AsString := '';
  QMPedidosDliveryFECHA_RETIRO.AsDateTime := REntorno.FechaTrab;
  QMPedidosDliveryPERSONA_ENTREGA.AsString := '';
  QMPedidosDliveryTELEFONO_ENTREGA.AsString := '';
  QMPedidosDliveryDIRECCION_ENTREGA.AsString := '';
  QMPedidosDliveryCOMUNA_ENTREGA.AsString := '';
  QMPedidosDliveryCOMENTARIO.AsString := '';
  QMPedidosDliveryMOVIL.AsString := '';
  QMPedidosDliveryESTADO.AsString := '';
  QMPedidosDliveryFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMPedidosDliveryCOMENTARIO_ENTREGA.AsString := '';
  QMPedidosDliveryEMPRESA.AsInteger := REntorno.Empresa;
  QMPedidosDliveryCLIENTE.AsInteger := 0;
  QMPedidosDliveryDIRECCION.AsInteger := 0;
  QMPedidosDliveryAGENTE.AsInteger := 0;
  QMPedidosDliveryARTICULO.AsString := '';
  QMPedidosDliveryID_DETALLES_S.AsInteger := 0;
end;

procedure TDMImportacionDlivery.QMPedidosDliveryBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_IMPORTACION_DLIVERY', 'ID');
end;

procedure TDMImportacionDlivery.Refrescar;
begin
  QMPedidosDlivery.Close;
  QMPedidosDlivery.Open;
end;

procedure TDMImportacionDlivery.Marcar(Entrada, DesdeCliente, HastaCliente: integer; FechaDesde, FechaHasta: TDateTime);
begin
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE IMP_DLIVERY ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA_AGRUPACION = :ENTRADA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA_AGRUPACION <> :ENTRADA AND ');
        SQL.Add(' EMPRESA >= :EMPRESA AND ');
        SQL.Add(' ID_DETALLES_S = 0 AND ');
        SQL.Add(' CLIENTE >= :CLIENTE_DESDE AND ');
        SQL.Add(' CLIENTE <= :CLIENTE_HASTA AND ');
        SQL.Add(' FECHA >= :FECHA_DESDE AND ');
        SQL.Add(' FECHA <= :FECHA_HASTA ');
        Params.ByName['ENTRADA'].AsInteger := Entrada;
        Params.ByName['CLIENTE_DESDE'].AsInteger := DesdeCliente;
        Params.ByName['CLIENTE_HASTA'].AsInteger := HastaCliente;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar;
end;

procedure TDMImportacionDlivery.FiltraDelivery(ClienteDesde, ClienteHasta: integer; FechaDesde, FechaHasta: TDateTime; VerSoloPendientes: boolean; Orden: integer);
begin
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');

  with QMPedidosDlivery do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM IMP_DLIVERY ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA >= :EMPRESA AND ');
     if VerSoloPendientes then
        SelectSQL.Add(' ID_DETALLES_S = 0 AND ');
     SelectSQL.Add(' ((ENTRADA_AGRUPACION = :ENTRADA) OR ');
     SelectSQL.Add(' (CLIENTE >= :CLIENTE_DESDE AND ');
     SelectSQL.Add(' CLIENTE <= :CLIENTE_HASTA AND ');
     SelectSQL.Add(' FECHA >= :FECHA_DESDE AND ');
     SelectSQL.Add(' FECHA <= :FECHA_HASTA)) ');
     case Orden of
        0: SelectSQL.Add(' ORDER BY ID_ORIGEN ASC');
        1: SelectSQL.Add(' ORDER BY NOMBRE_CLIENTE, ID_ORIGEN ASC  ')
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['CLIENTE_DESDE'].AsInteger := ClienteDesde;
     Params.ByName['CLIENTE_HASTA'].AsInteger := ClienteHasta;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;
end;

procedure TDMImportacionDlivery.GeneraPedidos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_GENERA_DOCUMENTO_DLIVERY(:EMPRESA, :CANAL, :SERIE, :TIPO, :ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar;
end;

procedure TDMImportacionDlivery.BorraRegistrosPendientes;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM IMP_DLIVERY WHERE ID_DETALLES_S = 0';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
