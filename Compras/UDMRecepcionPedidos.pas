unit UDMRecepcionPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMRecepcionPedidos = class(TDataModule)
     QMDetalle: TFIBTableSet;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleUNIDADES_ORIGINALES: TFloatField;
     QMDetalleUNIDADES_SERVIDAS: TFloatField;
     QMDetalleUNIDADES_POR_SERVIR: TFloatField;
     QMDetalleLINEA_SERVIDA: TIntegerField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetallePAIS: TFIBStringField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     DSQMDetalle: TDataSource;
     QMDetallePROVEEDOR: TIntegerField;
     QMDetalleUNIDADES_RECEPCION: TFloatField;
     QMDetalleENTRADA_RECEPCION: TIntegerField;
     TLocal: THYTransaction;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleSU_REFERENCIA: TFIBStringField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMDetalleID_A: TIntegerField;
     QMDetalleCODIGO_PROVEEDOR: TFIBStringField;
     QMDetalleBARRAS: TFIBStringField;
     xDocumentos: TFIBDataSetRO;
     DSxDocumentos: TDataSource;
     QMDetalleSERVIR_LINEA: TIntegerField;
     TUpdate: THYTransaction;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleALFA_6: TFIBStringField;
     xArticulo: TFIBDataSetRO;
     DSxArticulo: TDataSource;
     xDetalleNota: TFIBDataSetRO;
     DSDetalleNota: TDataSource;
     xDetalleNotaNOTAS: TBlobField;
     DSxRelacion: TDataSource;
     xRelacion: TFIBTableSet;
     xRelacionID_DETALLES_S: TIntegerField;
     xRelacionID_S: TIntegerField;
     xRelacionARTICULO: TFIBStringField;
     xRelacionTITULO: TFIBStringField;
     xRelacionUNIDADES: TFloatField;
     xRelacionFECHA_ENTREGA_PREV: TDateTimeField;
     xRelacionU_PENDIENTES: TFloatField;
     xRelacionDIRECCION_ENTREGA: TIntegerField;
     xRelacionALMACEN: TFIBStringField;
     xRelacionCLIENTE: TIntegerField;
     xRelacionSU_REFERENCIA: TFIBStringField;
     xRelacionFECHA: TDateTimeField;
     xRelacionDIRECCION: TIntegerField;
     xRelacionNOMBRE_R_SOCIAL: TFIBStringField;
     xRelacionNOMBRE_COMERCIAL: TFIBStringField;
     xRelacionEJERCICIO: TIntegerField;
     xRelacionCANAL: TIntegerField;
     xRelacionSERIE: TFIBStringField;
     xRelacionTIPO: TFIBStringField;
     xRelacionRIG: TIntegerField;
     xRelacionLINEA: TIntegerField;
     xRelacionAGENTE: TIntegerField;
     xRelacionTITULO_AGENTE: TFIBStringField;
     xRelacionMANIPULACION: TIntegerField;
     xRelacionU_PREPARADAS: TFloatField;
     QMDetalleLOTE: TFIBStringField;
     QMDetalleLOTEABLE: TIntegerField;
     QMDetalleREF_PROVEEDOR: TFIBStringField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMDetalleORDEN: TIntegerField;
     QMDetallePEDIDOS_D_CLI: TFloatField;
     QMDetalleSTOCK_ALM: TFloatField;
     procedure DMRecepcionPedidosCreate(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_RECEPCIONChange(Sender: TField);
     procedure QMDetalleP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleENTRADA_RECEPCIONChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     Param_MOVSTKC001: integer;
     MostrandoLineasServidas: boolean;
     Contador: integer;
     Serie: string;
     Canal: integer;
     Proveedor: integer;
     AlmacenStock: string;
     StockAlm, PedCli: TStrings;
     CalcularStock, CalcularPedidosCliente: boolean;
     procedure AbreDocumentos(Destino: string; Contador: integer);
     procedure CompruebaCambioUnidades;
     function LotesCorrectamenteAsignados: boolean;
     procedure MuestraDocumentos(Destino, aSerie: string; contador, CanalDestino: integer);
     function AceptaCambioCanal: boolean;
     function HayPedidosPorRecibir: boolean;
     procedure TraspasarPedidos(destino: string; Proc_Masivo: boolean; CanalDestino: integer; FechaCont, FechaRec, FechaDoc: TDateTime; Tipo_Portes: integer; Por_Portes, I_Portes: double; Separar_Pedidos_Recepcion: boolean; id_e_dest: integer);
     procedure LimpiaLotesTemporales;
  public
     { Public declarations }
     LocalMascaraL: string;
     Control: boolean;
     Ejercicio: integer;
     NumPedido: integer;
     procedure FiltrarPedidos(aProveedor: integer; aSerie: string; aEjercicio, aNumPedido: integer);
     procedure RefrescarPedidos;
     procedure MostrarLineasServidas(mostrar: boolean);
     procedure MarcarLineasPedidos;
     procedure TraspasarPedidosAAlbaran(Proc_Masivo: boolean; CanalDestino: integer; FechaCont, FechaRec, FechaDoc: TDateTime; Tipo_Portes: integer; Por_Portes, I_Portes: double; Separar_Pedidos_Recepcion: boolean; id_e_dest: integer);
     procedure TraspasarPedidosAFactura(Proc_Masivo: boolean; CanalDestino: integer; FechaCont, FechaRec, FechaDoc: TDateTime; Tipo_Portes: integer; Por_Portes, I_Portes: double; Separar_Pedidos_Recepcion: boolean; id_e_dest: integer);
     procedure RecibirUnidadesLinea;
     procedure RecibirUnidadesLineaTodas;
     procedure InicializarUnidadesTodas;
     procedure ServirMarcados(Fecha_Rec: TDateTime);
     procedure MuestraErrores;
     function HayErrores: boolean;
     procedure ConfiguraLotes;
     procedure MarcarLineasPedidosProc(Marcar: boolean);
     procedure MarcarServidos;
     procedure MascaraMonedas;
     procedure DamePortes(Proveedor: integer; var I_Portes, Por_Portes: double; var Tipo_Portes: integer);
     function SepararPedidosRecepcion: integer;
     procedure ImportarXLS(Archivo: string);
     procedure CalculaPedidosCliente(aCalcular: boolean);
     procedure CalculaStock(aCalcular: boolean; Almacen: string);
     procedure IniciaCalculoStock;
  end;

var
  DMRecepcionPedidos : TDMRecepcionPedidos;

implementation

uses UDMMain, UEntorno, UFMAlbaranesAProveedor, UFMFacturasAProveedor, UFormGest,
  UFMControlErroresFactura, UUtiles, UFMConfigTraspasoLotes,
  UFMain, UFMControlAgrupPedidos, UFMRecepcionPedidos, ComObj, Variants, UParam, UDameDato;

{$R *.DFM}

procedure TDMRecepcionPedidos.DMRecepcionPedidosCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRelacion, MascaraN, MascaraI, ShortDateFormat);

  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetalleUNIDADES_ORIGINALES.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_SERVIDAS.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_RECEPCION.DisplayFormat := MascaraI;

  PedCli := TStringList.Create;
  StockAlm := TStringList.Create;

  // Para que al abrir, antes de establecer la serie el parámetro tenga un valor.
  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', REntorno.Serie), 0);

  MascaraMonedas;
  MostrandoLineasServidas := False;

  Serie := REntorno.Serie;
  Canal := REntorno.Canal;
  QMDetalle.Close;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
end;

procedure TDMRecepcionPedidos.DataModuleDestroy(Sender: TObject);
begin
  LimpiaLotesTemporales;
  PedCli.Free;
  StockAlm.Free;
end;

procedure TDMRecepcionPedidos.RefrescarPedidos;
var
  IdDetallesE : integer;
begin
  IdDetallesE := QMDetalleID_DETALLES_E.AsInteger;

  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DETALLE_PEDIDO_RECEP ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA=?EMPRESA AND ');
     SelectSQL.Add(' CANAL=?CANAL AND ');
     SelectSQL.Add(' SERIE=?SERIE AND ');
     SelectSQL.Add(' TIPO=''PEP'' AND ');
     SelectSQL.Add(' PROVEEDOR=?PROVEEDOR ');
     if (Ejercicio <> 0) then
        SelectSQL.Add(' AND EJERCICIO=?EJERCICIO ')
     else
        SelectSQL.Add(' AND EJERCICIO<=?EJERCICIO ');
     if (NumPedido <> 0) then
        SelectSQL.Add(' AND RIG=' + IntToStr(NumPedido));
     if (not MostrandoLineasServidas) then
        SelectSQL.Add(' AND LINEA_SERVIDA = 0 ');
     if (REntorno.ListaPedCompra = 1) then
        SelectSQL.Add(' AND ESTADO=1 ');

     SelectSQL.Add(' ORDER BY EJERCICIO, RIG, ORDEN, LINEA ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (Ejercicio <> 0) then
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;

     if (Proveedor <> 0) then
     begin
        Open;
        Posicionar(QMDetalle, 'ID_DETALLES_E', IdDetallesE, False, True);
     end;
  end;
end;

procedure TDMRecepcionPedidos.FiltrarPedidos(aProveedor: integer; aSerie: string; aEjercicio, aNumPedido: integer);
begin
  Serie := aSerie;
  Proveedor := aProveedor;
  NumPedido := aNumPedido;
  Ejercicio := aEjercicio;

  Param_MOVSTKC001 := StrToIntDef(LeeParametro('MOVSTKC001', Serie), 0);

  RefrescarPedidos;
end;

procedure TDMRecepcionPedidos.MostrarLineasServidas(mostrar: boolean);
begin
  if mostrar <> MostrandoLineasServidas then
  begin
     MostrandoLineasServidas := mostrar;
     RefrescarPedidos;
  end;
end;

procedure TDMRecepcionPedidos.MarcarLineasPedidos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_PEDIDOS_PROV_MARCA (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?PROVEEDOR, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecepcionPedidos.TraspasarPedidosAAlbaran(Proc_Masivo: boolean; CanalDestino: integer; FechaCont, FechaRec, FechaDoc: TDateTime; Tipo_Portes: integer; Por_Portes, I_Portes: double; Separar_Pedidos_Recepcion: boolean; id_e_dest: integer);
begin
  TraspasarPedidos('ALP', Proc_Masivo, CanalDestino, FechaCont, FechaRec, FechaDoc, Tipo_Portes, Por_Portes, I_Portes, Separar_Pedidos_Recepcion, id_e_dest);
  // Fuerzo a inicializar cache de stocks
  CalculaStock(CalcularStock, AlmacenStock);
end;

procedure TDMRecepcionPedidos.TraspasarPedidosAFactura(Proc_Masivo: boolean; CanalDestino: integer; FechaCont, FechaRec, FechaDoc: TDateTime; Tipo_Portes: integer; Por_Portes, I_Portes: double; Separar_Pedidos_Recepcion: boolean; id_e_dest: integer);
begin
  TraspasarPedidos('FAP', Proc_Masivo, CanalDestino, FechaCont, FechaRec, FechaDoc, Tipo_Portes, Por_Portes, I_Portes, Separar_Pedidos_Recepcion, id_e_dest);
  // Fuerzo a inicializar cache de stocks
  CalculaStock(CalcularStock, AlmacenStock);
end;

procedure TDMRecepcionPedidos.TraspasarPedidos(destino: string; Proc_Masivo: boolean; CanalDestino: integer; FechaCont, FechaRec, FechaDoc: TDateTime; Tipo_Portes: integer; Por_Portes, I_Portes: double; Separar_Pedidos_Recepcion: boolean; id_e_dest: integer);
begin
  if QMDetalle.State = dsEdit then
     QMDetalle.Post;

  if (not LotesCorrectamenteAsignados) then
     raise Exception.Create(_('Las unidades enviadas no coinciden con las definidas en los lotes. No se puede traspasar.'))
  else
  begin
     Contador := 0;

     while ((HayPedidosPorRecibir) and (not HayErrores)) do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_PEDIDOS_PROV_A_OTRO ');
              SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PROVEEDOR, ');
              SQL.Add(' :DESTINO, :FECHA, :ENTRADA, :FECHA_CON, :FECHA_REC, ');
              SQL.Add(' :PROC_MASIVO, :TIPO_PORTES, :POR_PORTES, :I_PORTES, ');
              SQL.Add(' :D_CANAL, :LINEAS_PROC, :PROC_AUTO_INI, ');
              SQL.Add(' :SEPARAR_PEDIDOS_RECEPCION, :ID_E_DEST) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
              Params.ByName['DESTINO'].AsString := destino;
              Params.ByName['FECHA'].AsDateTime := FechaDoc;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['FECHA_CON'].AsDateTime := FechaCont;
              Params.ByName['FECHA_REC'].AsDateTime := FechaRec;
              Params.ByName['PROC_MASIVO'].AsInteger := BoolToInt(Proc_Masivo);
              Params.ByName['TIPO_PORTES'].AsInteger := Tipo_Portes;
              Params.ByName['POR_PORTES'].AsFloat := Por_Portes;
              Params.ByName['I_PORTES'].AsFloat := I_Portes;
              Params.ByName['D_CANAL'].AsInteger := CanalDestino;
              Params.ByName['LINEAS_PROC'].AsInteger := REntorno.LineasAProc;
              Params.ByName['SEPARAR_PEDIDOS_RECEPCION'].AsInteger := BoolToInt(Separar_Pedidos_Recepcion);
              Params.ByName['PROC_AUTO_INI'].AsInteger := Contador;
              Params.ByName['ID_E_DEST'].AsInteger := id_e_dest;
              ExecQuery;
              Contador := FieldByName['PROC_AUTO'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if HayErrores then
        MuestraErrores;

     RefrescarPedidos;

     LimpiaLotesTemporales;

     if (REntorno.Canal = CanalDestino) then
        AbreDocumentos(destino, contador)
     else
        MuestraDocumentos(Destino, Serie, contador, CanalDestino);
  end;
end;

procedure TDMRecepcionPedidos.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMRecepcionPedidos.QMDetalleUNIDADES_RECEPCIONChange(Sender: TField);
begin
  if Sender.AsFloat <> 0 then
     QMDetalleENTRADA_RECEPCION.AsInteger := REntorno.Entrada
  else
     QMDetalleENTRADA_RECEPCION.AsInteger := 0;

  if QMDetalleUNIDADES_ORIGINALES.AsFloat <= (Sender.AsFloat + QMDetalleUNIDADES_SERVIDAS.AsFloat) then
     QMDetalleSERVIR_LINEA.AsInteger := 1
  else
     QMDetalleSERVIR_LINEA.AsInteger := 0;

  CompruebaCambioUnidades;
end;

procedure TDMRecepcionPedidos.AbreDocumentos(Destino: string; Contador: integer);
begin
  // Se abren los albaranes o facturas que genera la recepcion
  if (Destino = 'ALP') then
  begin
     FMain.EjecutaAccion(FMain.AAlbaranesProv);
     FMAlbaranesAProveedor.RecepcionPedidos(Serie, Contador);
  end
  else
  begin
     FMain.EjecutaAccion(FMain.AFacturasProv);
     FMFacturasAProveedor.FiltraFacturacion(Serie, Contador);
  end;
end;

procedure TDMRecepcionPedidos.RecibirUnidadesLinea;
begin
  with QMDetalle do
  begin
     if (RecordCount > 0) then
     begin
        if (QMDetalleUNIDADES_RECEPCION.AsFloat <> QMDetalleUNIDADES_ORIGINALES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat) then
        begin
           if not (State = dsEdit) then
              Edit;
           QMDetalleUNIDADES_RECEPCION.AsFloat := QMDetalleUNIDADES_ORIGINALES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat;
           Post;
        end;
     end;
  end;
end;

procedure TDMRecepcionPedidos.RecibirUnidadesLineaTodas;
begin
  if Confirma then
  begin
     with QMDetalle do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              RecibirUnidadesLinea;
              Next;
           end;
        finally
           EnableControls;
        end;
     end;

     RefrescarPedidos;
  end;
end;

procedure TDMRecepcionPedidos.InicializarUnidadesTodas;
begin
  if (QMDetalle.RecordCount > 0) then
  begin
     if Confirma then
     begin
        with QMDetalle do
        begin
           DisableControls;
           try
              First;
              while not EOF do
              begin
                 if not (QMDetalle.State = dsEdit) then
                    QMDetalle.Edit;
                 QMDetalleUNIDADES_RECEPCION.AsFloat := 0;
                 QMDetalle.Post;
                 Next;
              end;
           finally
              EnableControls;
           end;
        end;

        RefrescarPedidos;
     end;
  end;
end;

procedure TDMRecepcionPedidos.QMDetalleP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(LocalMascaraL, QMDetalleP_COSTE.AsFloat);
end;

procedure TDMRecepcionPedidos.ServirMarcados(Fecha_Rec: TDateTime);
begin
  if (QMDetalle.State = dsEdit) then
     QMDetalle.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_PEDIDOS_CERRAR_SERVIDOS_E (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?PROVEEDOR, ?ENTRADA, ?FECHA_REC)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['PROVEEDOR'].AsInteger := QMDetallePROVEEDOR.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA_REC'].AsDateTime := Fecha_Rec;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarPedidos;
end;

function TDMRecepcionPedidos.HayErrores: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecepcionPedidos.MuestraErrores;
begin
  FMControlErroresFactura := TFMControlErroresFactura.Create(Self);
  FMControlErroresFactura.ShowModal;
  FMControlErroresFactura.Free;
end;

procedure TDMRecepcionPedidos.ConfiguraLotes;
begin
  if (QMDetalleLOTEABLE.AsInteger = 1) then
  begin
     if (QMDetalle.State in [dsEdit]) then
        QMDetalle.Post;

     TFMConfigTraspasoLotes.Create(Self).AsignaLote(QMDetalleTIPO.AsString,
        QMDetalleSERIE.AsString,
        QMDetalleARTICULO.AsString, QMDetalleALMACEN.AsString,
        QMDetalleEJERCICIO.AsInteger, QMDetalleRIG.AsInteger,
        QMDetalleCANAL.AsInteger, QMDetalleID_A.AsInteger,
        QMDetalleID_DETALLES_E.AsInteger, QMDetallePROVEEDOR.AsInteger,
        QMDetalleUNIDADES_RECEPCION.AsFloat);

     // RefrescarPedidos;
     QMDetalle.Refresh;
  end;
end;

procedure TDMRecepcionPedidos.CompruebaCambioUnidades;
var
  Total : integer;
begin
  // No se porque esta esto aca. Teoricamente no se va a ejecutar nunca,
  // porque la marca de lotes nunca es true. (se utiliza lotes_kri)

  if (QMDetalleLOTEABLE.AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(UNIDADES) FROM TMP_TRASPASO_PEDIDO_LOTES WHERE ENTRADA = ?ENTRADA AND ID_DETALLES = ?ID_DETALLES_E AND TIPO = ?TIPO';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
           Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
           ExecQuery;
           Total := FieldByName['SUM'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if ((Total > QMDetalleUNIDADES_RECEPCION.AsFloat) and (Total <> 0)) then
     begin
        ShowMessage(_('Las unidades a servir son menores que las unidades definidas en los lotes'));
        QMDetalleUNIDADES_RECEPCION.AsFloat := Total;
     end;

     if ((Total < QMDetalleUNIDADES_RECEPCION.AsFloat) and (Total <> 0)) then
     begin
        ShowMessage(_('Las unidades a servir son mayores que las unidades definidas en los lotes por favor defínalas en los lotes'));
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE TMP_TRASPASO_PEDIDO_LOTES SET ERROR = 1 WHERE ENTRADA = ?ENTRADA AND ID_DETALLES = ?ID_DETALLES_E AND TIPO = ?TIPO';
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
              Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if ((Total = QMDetalleUNIDADES_RECEPCION.AsFloat) and (Total <> 0)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE TMP_TRASPASO_PEDIDO_LOTES SET ERROR = 0 WHERE ENTRADA = ?ENTRADA AND ID_DETALLES = ?ID_DETALLES_E AND TIPO = ?TIPO';
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalleID_DETALLES_E.AsInteger;
              Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function TDMRecepcionPedidos.LotesCorrectamenteAsignados: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_TRASPASO_PEDIDO_LOTES WHERE ENTRADA = ?ENTRADA AND TIPO = ?TIPO AND ERROR = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := 'PEP';
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecepcionPedidos.MarcarLineasPedidosProc(Marcar: boolean);
begin
  // Los datos se introducen en edicion porque desde un procedimiento, al hacer commit, la linea_servida cambia y
  // se quedan como servidas y no aparecen en el grid
  with QMDetalle do
  begin
     First;
     while not EOF do
     begin
        Edit;
        QMDetalleSERVIR_LINEA.AsInteger := BoolToInt(Marcar);
        if (Marcar) then
           QMDetalleUNIDADES_RECEPCION.AsFloat := QMDetalleUNIDADES_ORIGINALES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat
        else
           QMDetalleUNIDADES_RECEPCION.AsFloat := 0;
        Next;
     end;
     First;
  end;
end;

procedure TDMRecepcionPedidos.MarcarServidos;
var
  id : integer;
  ts : TStrings;
begin
  // Los datos se introducen en edicion porque desde un procedimiento, al hacer commit, la linea_servida cambia y
  // se quedan como servidas y no aparecen en el grid

  ts := TStringList.Create;
  try
     with QMDetalle do
     begin
        id := QMDetalleID_DETALLES_E.AsInteger;
        DisableControls;
        try
           // Busco los documentos que tienen alguna línea marcada
           First;
           while not EOF do
           begin
              if (QMDetalleENTRADA_RECEPCION.AsInteger = REntorno.Entrada) then
                 ts.Add(QMDetalleID_E.AsString);
              Next;
           end;

           // Marco el resto de lineas de los documentos encontrados
           First;
           while not EOF do
           begin
              if (ts.IndexOf(QMDetalleID_E.AsString) >= 0) then
              begin
                 Edit;
                 QMDetalleENTRADA_RECEPCION.AsInteger := REntorno.Entrada;
                 QMDetalleSERVIR_LINEA.AsInteger := 1;
                 Post;
              end;

              Next;
           end;

           Posicionar(QMDetalle, 'ID_DETALLES_E', id);
        finally
           EnableControls;
        end;
     end;
  finally
     ts.Free;
  end;
end;

procedure TDMRecepcionPedidos.MascaraMonedas;
begin
  // De momento se pone el la moneda de la empresa
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
  QMDetalleP_COSTE.DisplayFormat := LocalMascaraL;
end;

procedure TDMRecepcionPedidos.DamePortes(Proveedor: integer; var I_Portes, Por_Portes: double; var Tipo_Portes: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Add(' SELECT I_PORTES, POR_PORTES, TIPO_PORTES FROM CON_CUENTAS_GES_PRO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' PROVEEDOR = ?PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        I_Portes := FieldByName['I_PORTES'].AsFloat;
        Por_Portes := FieldByName['POR_PORTES'].AsFloat;
        Tipo_Portes := FieldByName['TIPO_PORTES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecepcionPedidos.QMDetalleENTRADA_RECEPCIONChange(Sender: TField);
begin
  {
  if QMDetalleENTRADA_RECEPCION.AsInteger <> 0 then
     if QMDetalleUNIDADES_RECEPCION.AsFloat = 0 then
        QMDetalleENTRADA_RECEPCION.AsInteger := 0;
  }
end;

procedure TDMRecepcionPedidos.MuestraDocumentos(Destino, aSerie: string; contador, CanalDestino: integer);
begin
  with xDocumentos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := aSerie;
     Params.ByName['TIPO'].AsString := destino;
     Params.ByName['CONTADOR'].AsInteger := contador;
     Open;
  end;

  if (AceptaCambioCanal) then
  begin
     CierraFormsMenos(FMRecepcionPedidos);
     FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, CanalDestino);
     AbreDocumentos(Destino, Contador);
     FMRecepcionPedidos.Close;
  end;
end;

function TDMRecepcionPedidos.AceptaCambioCanal: boolean;
begin
  AbreForm(TFMControlAgrupPedidos, FMControlAgrupPedidos);
  with FMControlAgrupPedidos do
  begin
     AsignaDataSource(DMRecepcionPedidos.DSxDocumentos);
     Result := Inicializa;
     Free;
  end;
end;

function TDMRecepcionPedidos.HayPedidosPorRecibir: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 (CAB.EMPRESA) FROM GES_CABECERAS_E_PED CAB ');
        SQL.Add(' JOIN GES_DETALLES_E_PED PED ');
        SQL.Add(' ON (PED.ID_E = CAB.ID_E) ');
        SQL.Add(' /* JOIN GES_DETALLES_E DET ');
        SQL.Add('    ON (DET.ID_DETALLES_E = PED.ID_DETALLES_E) */ ');
        SQL.Add(' WHERE ');
        SQL.Add(' CAB.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' CAB.EJERCICIO <= ?EJERCICIO AND ');
        SQL.Add(' CAB.CANAL = ?CANAL AND ');
        SQL.Add(' CAB.SERIE = ?SERIE AND ');
        SQL.Add(' CAB.TIPO = ?TIPO AND ');
        SQL.Add(' CAB.PROVEEDOR = ?PROVEEDOR AND ');
        SQL.Add(' PED.ENTRADA_RECEPCION = ?ENTRADA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEP';
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['EMPRESA'].AsInteger > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMRecepcionPedidos.SepararPedidosRecepcion: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        Transaction := TLocal;
        SQL.Text := 'SELECT SEPARAR_PEDIDOS_RECEPCION FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['SEPARAR_PEDIDOS_RECEPCION'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecepcionPedidos.LimpiaLotesTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_TRASPASO_PEDIDO_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecepcionPedidos.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulo.Open;
  xDetalleNota.Open;
  xRelacion.Open;
end;

procedure TDMRecepcionPedidos.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulo.Close;
  xDetalleNota.Close;
  xRelacion.Close;
end;

procedure TDMRecepcionPedidos.ImportarXLS(Archivo: string);
var
  Excel, Libro, Hoja, Rango : olevariant;
  Data : variant;
  Fila, CantidadFilas, CantidadFilasVacias, Modificados : integer;
  Articulo, sUnidadesRecibidas, Pedido : string;
  UnidadesRecibidas, UnidesPendientes : double;
  Log : TStrings;
  ArchivoLog : string;
  PermitirSobrepasarUnidadesPedidas : boolean;
const
  // Sacado de https://msdn.microsoft.com/en-us/library/office/ff820880.aspx
  xlDown = -4121;
begin
  DMMain.Log('Importando fichero: ' + Archivo);

  // Esto es para Lonper. Si se utiliza para otro cliente hay que parametrizarlo.
  PermitirSobrepasarUnidadesPedidas := True;

  Excel := CreateOleObject('Excel.Application');
  Log := TStringList.Create;
  try
     Log.Add(format(_('Importando fichero: %s'), [Archivo]));
     Libro := Excel.WorkBooks.Open(Archivo);
     try
        Hoja := Libro.Worksheets.Item[1];
     except
        begin
           Log.Add(_('No se cuentra hoja a importar'));
           Exit;
        end;
     end;

     try
        // No funciona si la columna K tiene celdas vacias.
        // Rango := Hoja.Range['A1', Hoja.Range['K1'].end[xlDown]]; //para escoger el rango desde hasta en las columnas de excel
        Rango := Hoja.Range['A1', 'K1048576'];
        Data := Rango.Value;
     except
        begin
           Log.Add(_('No se puede definir el rango A1-Knnn'));
           Exit;
        end;
     end;

     // Formato
     // Fecha      Numero de albarán  Pedido Gaviota   Pedido del cliente    Referencia del cliente    Código Articulo Gaviota  Código Cliente   Cantidad    Unidad    descripción    Observaciones
     // 24/04/2023   Gal2314951   GPV2316746   1526                     1526                    80170848                            70   Metros   MTS PERFIL B.CARGA SC NEXUS 80-100 BRUT 7M   7016 TXT
     // 24/04/2023   Gal2314951   GPV2316780   1534                      1534                    80140393                            80   Metros   MTS TUBO GUIA 80X40 RAL ESP 5M

     try
        CantidadFilas := VarArrayHighBound(Data, 1);
        // CantidadColumnas := VarArrayHighBound(Data, 2);
     except
        begin
           Log.Add(_('No se puede obtener la cantidad de filas a importar'));
           CantidadFilas := 1048576; // Maxima cantidad de filas de Excel
        end;
     end;

     Log.Add(format(_('CantidadFilas: %d'), [CantidadFilas]));
     Modificados := 0;
     CantidadFilasVacias := 0;
     with QMDetalle do
     begin
        DisableControls;
        try
           // Fila 1 son los nombres de los campos ( Data[Fila, Columna] ) no empiezan en 0 empiezan en 1
           Fila := 2;
           while ((CantidadFilasVacias < 5) and (Fila <= CantidadFilas)) do
           begin
              Pedido := '';
              Articulo := '';
              //UnidadesRecibidas := 0;
              try
                 Pedido := Trim(Copy(Data[Fila, 4], 1, 20));
                 Articulo := Trim(Copy(Data[Fila, 6], 1, 15));
                 sUnidadesRecibidas := Data[Fila, 8];
                 UnidadesRecibidas := StrToFloatDef(sUnidadesRecibidas, 0);
              except
                 on E: Exception do
                 begin
                    Log.Add(format('***' + _('Error leyendo fila %d'), [Fila]) + #13#10 + E.Message);
                    Pedido := '';
                    Articulo := '';
                    UnidadesRecibidas := 0;
                 end;
              end;

              if ((Pedido = '') and (Articulo = '')) then
              begin
                 Inc(CantidadFilasVacias);
              end
              else
              begin
                 if (CantidadFilasVacias > 0) then
                    Log.Add(format('*** ' + _('%d Fila(s) vacia(s). (Sin informacion de Pedido o Articulo)'), [CantidadFilasVacias]));

                 Log.Add(format(_('Fila: %d - Pedido: %s - Articulo: %s - Unidades: %.2f (%s)'), [Fila, Pedido, Articulo, UnidadesRecibidas, sUnidadesRecibidas]));

                 if (UnidadesRecibidas = 0) then
                    Log.Add('*** ' + _('Unidades a Recibir = 0'));

                 // Si es una fila valida, comienzo a contar filas vacias desde 0.
                 CantidadFilasVacias := 0;
                 First;
                 while (not EOF) and (UnidadesRecibidas > 0) do
                 begin
                    if (PermitirSobrepasarUnidadesPedidas) then
                    begin
                       if (QMDetalleRIG.AsString = Pedido) and (QMDetalleARTICULO.AsString = Articulo) then
                       begin
                          Edit;

                          UnidesPendientes := QMDetalleUNIDADES_ORIGINALES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat - QMDetalleUNIDADES_RECEPCION.AsFloat;
                          QMDetalleUNIDADES_RECEPCION.AsFloat := QMDetalleUNIDADES_RECEPCION.AsFloat + UnidadesRecibidas;
                          UnidadesRecibidas := UnidesPendientes - UnidadesRecibidas;

                          Post;
                       end;
                    end
                    else
                    begin
                       UnidesPendientes := QMDetalleUNIDADES_ORIGINALES.AsFloat - QMDetalleUNIDADES_SERVIDAS.AsFloat - QMDetalleUNIDADES_RECEPCION.AsFloat;
                       if (QMDetalleRIG.AsString = Pedido) and (QMDetalleARTICULO.AsString = Articulo) and (UnidesPendientes > 0) then
                       begin
                          Edit;

                          if (UnidadesRecibidas < UnidesPendientes) then
                          begin
                             QMDetalleUNIDADES_RECEPCION.AsFloat := QMDetalleUNIDADES_RECEPCION.AsFloat + UnidadesRecibidas;
                             UnidadesRecibidas := 0;
                          end
                          else
                          begin
                             QMDetalleUNIDADES_RECEPCION.AsFloat := QMDetalleUNIDADES_RECEPCION.AsFloat + UnidesPendientes;
                             UnidadesRecibidas := UnidadesRecibidas - UnidesPendientes;
                          end;

                          Post;
                       end;
                    end;

                    Next;
                 end;

                 if (UnidadesRecibidas > 0) then
                    Log.Add(format('*** ' + _('Quedaron %.2f unidades pendientes de Recibir'), [UnidadesRecibidas]));
                 if (UnidadesRecibidas < 0) then
                    Log.Add(format('*** ' + _('Se recibieron %.2f mas unidades que la pendientes de Recibir'), [UnidadesRecibidas * (-1)]));
              end;

              Inc(Fila);
           end;
        finally
           EnableControls;
        end;
     end;
     Log.Add(format(_('Importando Finalizada - Lineas modificadas: %d'), [Modificados]));

     ArchivoLog := GetSpecialFolderPath(CSIDL_PERSONAL, True) + '\RecepcionPedCompras-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.txt';
     if FileExists(ArchivoLog) then
        DeleteFile(ArchivoLog);
     Log.SaveToFile(ArchivoLog);
  finally
     // Clean up all references so Excel will close cleanly
     Rango := Unassigned;
     Hoja := Unassigned;
     Libro := Unassigned;
     Excel.Quit;
     Excel := Unassigned;
     Log.Free;
  end;

  DMMain.AbrirArchivo(ArchivoLog);
end;

procedure TDMRecepcionPedidos.CalculaPedidosCliente(aCalcular: boolean);
begin
  CalcularPedidosCliente := aCalcular;
  PedCli.Clear;
  if QMDetalle.Active then
     Refrescar(QMDetalle, 'ID_DETALLES_E', QMDetalleID_DETALLES_E.AsInteger);
end;

procedure TDMRecepcionPedidos.CalculaStock(aCalcular: boolean; Almacen: string);
begin
  CalcularStock := aCalcular;
  AlmacenStock := Trim(Almacen);

  // Valido si existe almacen
  if (DameTituloalmacen(AlmacenStock) = '') then
     AlmacenStock := 'NOCALC';

  QMDetalleSTOCK_ALM.DisplayLabel := format('Stock_%s', [AlmacenStock]);

  IniciaCalculoStock;
  if QMDetalle.Active then
     Refrescar(QMDetalle, 'ID_DETALLES_E', QMDetalleID_DETALLES_E.AsInteger);
end;

procedure TDMRecepcionPedidos.QMDetalleCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock, Pedidos : double;
  //StockMinimo : double;
  Articulo : string;
  Canal : integer;
begin
  // Calculo Stock y Pedidos de Cliente

  Articulo := QMDetalleARTICULO.AsString;

  Pedidos := 0;
  if (CalcularPedidosCliente) then
  begin
     with PedCli do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Pedidos := DMMain.DamePedidosDeCliente(REntorno.Empresa, REntorno.Canal, Articulo, '');
           Values[Articulo] := FloatToStr(Pedidos);
        end
        else
        begin
           Pedidos := StrToFloat(Values[Articulo]);
        end;
     end;
  end;
  QMDetallePEDIDOS_D_CLI.AsFloat := Pedidos;

  Stock := 0;
  if (CalcularStock) and (AlmacenStock <> 'NOCALC') then
  begin
     Canal := Param_MOVSTKC001;
     if (Canal = 0) then
        Canal := REntorno.Canal;

     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, Canal, Articulo, AlmacenStock);
           Values[Articulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
        end;
     end;
  end;
  QMDetalleSTOCK_ALM.AsFloat := Stock;
end;

procedure TDMRecepcionPedidos.IniciaCalculoStock;
begin
  StockAlm.Clear;
end;

end.
