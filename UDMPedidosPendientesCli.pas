unit UDMPedidosPendientesCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, SysUtils, FIBDataSetRO, HYFIBQuery,
  UFMControlErroresFactura, FIBDataSetRW, Controls, frxClass, frxHYReport,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TDMPedidosPendientesCli = class(TDataModule)
     DSPedidosPendientesCli: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPedidosPendientesCli: TFIBTableSet;
     QMCabecera: TFIBTableSet;
     DSCabecera: TDataSource;
     QMDetalle: TFIBTableSet;
     DSDetalle: TDataSource;
     frListado: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frxListado: TfrxHYReport;
     frDBDetalle: TfrDBDataSet;
     xCliConPedidosPend: TFIBTableSet;
     DSCliConPedidosPen: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxClientes: TDataSource;
     xDireccionClientes: TFIBDataSetRO;
     DSxDireccion_Clientes: TDataSource;
     xRelacion: TFIBTableSet;
     DSxRelacion: TDataSource;
     QMPedidosPendientesCliSTOCK_MINIMO: TFloatField;
     QMPedidosPendientesCliARTICULO: TFIBStringField;
     QMPedidosPendientesCliTITULO: TFIBStringField;
     QMPedidosPendientesCliRIG: TIntegerField;
     QMPedidosPendientesCliCLIENTE: TIntegerField;
     QMPedidosPendientesCliNOMBRE_R_SOCIAL: TFIBStringField;
     QMPedidosPendientesCliUNIDADES: TFloatField;
     QMPedidosPendientesCliALMACEN: TFIBStringField;
     QMPedidosPendientesCliU_SERVIDAS: TFloatField;
     QMPedidosPendientesCliU_PENDIENTES: TFloatField;
     QMPedidosPendientesCliSERVIDO: TIntegerField;
     QMPedidosPendientesCliPRECIO: TFloatField;
     QMPedidosPendientesCliDESCUENTO: TFloatField;
     QMPedidosPendientesCliU_PREPARADAS: TFloatField;
     QMPedidosPendientesCliFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosPendientesCliFECHA_REC_DET: TDateTimeField;
     QMPedidosPendientesCliFECHA_CONF_DET: TDateTimeField;
     QMPedidosPendientesCliENTRADA_AGRUPACION: TIntegerField;
     QMPedidosPendientesCliID_DETALLES_S: TIntegerField;
     QMPedidosPendientesCliID_S: TIntegerField;
     QMPedidosPendientesCliCORREO: TFIBStringField;
     QMPedidosPendientesCliEMPRESA: TIntegerField;
     QMPedidosPendientesCliEJERCICIO: TIntegerField;
     QMPedidosPendientesCliCANAL: TIntegerField;
     QMPedidosPendientesCliSERIE: TFIBStringField;
     QMPedidosPendientesCliTIPO: TFIBStringField;
     QMPedidosPendientesCliLINEA: TIntegerField;
     QMPedidosPendientesCliMODIFICA_DOC: TIntegerField;
     QMPedidosPendientesCliFECHA: TDateTimeField;
     QMPedidosPendientesCliCONTROL_STOCK: TIntegerField;
     QMPedidosPendientesCliID_ORDEN: TIntegerField;
     QMPedidosPendientesCliESTADO_ORDEN: TIntegerField;
     xCliConPedidosPendEMPRESA: TIntegerField;
     xCliConPedidosPendTERCERO: TIntegerField;
     xCliConPedidosPendCLIENTE: TIntegerField;
     QMPedidosPendientesCliSTOCK_ALM: TFloatField;
     xRelacionID_E: TIntegerField;
     xRelacionEMPRESA: TIntegerField;
     xRelacionEJERCICIO: TIntegerField;
     xRelacionCANAL: TIntegerField;
     xRelacionSERIE: TFIBStringField;
     xRelacionTIPO: TFIBStringField;
     xRelacionRIG: TIntegerField;
     xRelacionFECHA: TDateTimeField;
     xRelacionSU_REFERENCIA: TFIBStringField;
     xRelacionPROVEEDOR: TIntegerField;
     xRelacionNOMBRE_R_SOCIAL: TFIBStringField;
     xRelacionFECHA_PRE_CAB: TDateTimeField;
     QMPedidosPendientesCliTITULO_ESTADO: TFIBStringField;
     QMPedidosPendientesCliDIRECCION: TIntegerField;
     QMPedidosPendientesCliDIR_NOMBRE: TFIBStringField;
     QMPedidosPendientesCliNRO_PEDIDO: TFIBStringField;
     QMPedidosPendientesCliUNI_TOTAL: TFloatField;
     QMPedidosPendientesCliUNI_FABRICADAS: TFloatField;
     QMPedidosPendientesCliFECHA_ORD: TDateTimeField;
     QMPedidosPendientesCliDIR_NOMBRE_2: TFIBStringField;
     QMPedidosPendientesCliU_RESERVADAS: TFloatField;
     QMPedidosPendientesCliMANIPULACION: TIntegerField;
     QMPedidosPendientesCliPREPARABLE: TIntegerField;
     QMPedidosPendientesCliFECHA_PRE_PROV: TDateTimeField;
     QMPedidosPendientesCliFAMILIA: TFIBStringField;
     xRelacionARTICULO: TFIBStringField;
     xRelacionTITULO: TFIBStringField;
     xRelacionID_DETALLES_E: TIntegerField;
     QMPedidosPendientesCliALFA_1: TFIBStringField;
     QMPedidosPendientesCliALFA_2: TFIBStringField;
     QMPedidosPendientesCliALFA_3: TFIBStringField;
     QMPedidosPendientesCliALFA_4: TFIBStringField;
     QMPedidosPendientesCliALFA_5: TFIBStringField;
     QMPedidosPendientesCliALFA_6: TFIBStringField;
     QMPedidosPendientesCliALFA_7: TFIBStringField;
     QMPedidosPendientesCliALFA_8: TFIBStringField;
     QMPedidosPendientesCliPEDIR: TIntegerField;
     frDBPedidosPend: TfrDBDataSet;
     frDBRelacion: TfrDBDataSet;
     QMPedidosPendientesCliTITULO_LINEA: TFIBStringField;
     QMPedidosPendientesCliPEDIDOS_A_PRO: TFloatField;
     procedure DMPedidosPendientesCliCreate(Sender: TObject);
     procedure QMLineasPedidosClienteNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure frxListadoGetValue(const VarName: string; var Value: variant);
     procedure frListadoBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxListadoBeforePrint(Sender: TfrxReportComponent);
     procedure QMPedidosPendientesCliAfterOpen(DataSet: TDataSet);
     procedure QMPedidosPendientesCliAfterClose(DataSet: TDataSet);
     procedure QMPedidosPendientesCliSTOCK_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPedidosPendientesCliCalcFields(DataSet: TDataSet);
     procedure QMPedidosPendientesCliSTOCK_MINIMOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     // evaluacion: integer;
     // fecha_eval: TDateTime;
     LocalMascaraN: string;
     SQLMarcar: TStrings;
     Almacen: string;
     CalcularPedidosProveedor: boolean;
     StockAlm, StockMin, PedProv: TStrings;
     procedure RefrescaDatos;
  public
     { Public declarations }
     procedure MarcarPorFecha(FechaEntregaDesde, FechaEntregaHasta: TDateTime; FechaIni, FechaFin: TDateTime; Marca: integer; Serie: string);
     procedure MarcarPorCliente(FechaEntregaDesde, FechaEntregaHasta: TDateTime; ClienteIni, ClienteFin, Marca: integer; Serie: string);
     procedure MarcarPorFechaConfirmadaVacia(FechaEntregaDesde, FechaEntregaHasta: TDateTime; Marca: integer; Serie: string);
     procedure MarcarTodo(Serie: string; Marca: integer; FechaEntregaDesde, FechaEntregaHasta: TDateTime);
     procedure AbreTabla(Serie, Familia: string; Cliente: integer; Articulo: string; DesdeFecEntrega, HastaFecEntrega: TDateTime; CampoOrden: integer = -1);
     procedure EnviarCorreos(Serie: string);
     procedure EnviarPedidos(Serie: string);
     procedure StockAlmacen(aAlmacen: string);
     procedure CalculaPedidosProveedor(aCalcular: boolean);
     procedure GeneraAltaPedidos(Almacen, Serie: string; Responsable, IdUbicacionSimple: integer);
     procedure MarcarListosParaPreparar;
     procedure MarcarSemiPreparables;
     procedure BorrarRelacion;
     procedure MostrarListado;
  end;

var
  DMPedidosPendientesCli : TDMPedidosPendientesCli;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFMain, UFormGest, Dialogs, UDMListados, DateUtils, UDMLstPedidos, UParam;

{$R *.DFM}

procedure TDMPedidosPendientesCli.DMPedidosPendientesCliCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Formatos de visualizacion
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);

  AsignaDisplayFormat(QMPedidosPendientesCli, LocalMascaraN, MascaraI, ShortDateFormat);
  QMPedidosPendientesCliSTOCK_ALM.DisplayFormat := MascaraN;

  AsignaDisplayFormat(xRelacion, LocalMascaraN, MascaraI, ShortDateFormat);

  // Inicializamos la base del contenido del update para luego utilizar en los marcados
  SQLMarcar := TStringList.Create();
  with SQLMarcar do
  begin
     Add(' UPDATE GES_DETALLES_S_PED ');
     Add(' SET ');
     Add(' ENTRADA_AGRUPACION = :MODO ');
     Add(' WHERE ');
     Add(' ID_DETALLES_S IN (SELECT DET.ID_DETALLES_S ');
     Add('                   FROM GES_DETALLES_S_PED DET ');
     Add('                   JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLES_S) ');
     Add('                   JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.ARTICULO = ART.ARTICULO) ');
     Add('                   JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S) ');
     Add('                   WHERE ');
     Add('                   DET.EMPRESA = :EMPRESA AND ');
     Add('                   DET.EJERCICIO <= :EJERCICIO AND ');
     Add('                   DET.CANAL = :CANAL AND ');
     Add('                   ((DET.SERIE = CAST(:SERIE AS VARCHAR(10))) OR (CAST(:SERIE AS VARCHAR(10)) = '''')) AND ');
     Add('                   DET.TIPO = :TIPO AND ');
     Add('                   CAB.ESTADO = 0 AND ');
     Add('                   DET.SERVIDO = 0 AND ');
     Add('                   DET.FECHA_ENTREGA_PREV >= :FECHA_ENTREGA_DESDE AND ');
     Add('                   DET.FECHA_ENTREGA_PREV <= :FECHA_ENTREGA_HASTA ');
  end;

  PedProv := TStringList.Create;
  StockAlm := TStringList.Create;
  StockMin := TStringList.Create;
  Almacen := 'NOCALC';

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMPedidosPendientesCli.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
end;

procedure TDMPedidosPendientesCli.DataModuleDestroy(Sender: TObject);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_DETALLES_S_PED ');
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

  SQLMarcar.Free;
  PedProv.Free;
  StockAlm.Free;
  StockMin.Free;
end;

procedure TDMPedidosPendientesCli.QMLineasPedidosClienteNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPedidosPendientesCli.MarcarTodo(Serie: string; Marca: integer; FechaEntregaDesde, FechaEntregaHasta: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        AutoTrans := False;
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := SQLMarcar.Text;
        SQL.Add(')');
        DMMain.Log(SQL.Text);
        Transaction := TUpdate;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['MODO'].AsInteger := Marca;
        Params.ByName['FECHA_ENTREGA_DESDE'].AsDateTime := FechaEntregaDesde;
        Params.ByName['FECHA_ENTREGA_HASTA'].AsDateTime := FechaEntregaHasta;

        ExecQuery;
        if (Transaction.InTransaction) then
           Transaction.Commit;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPedidosPendientesCli.MarcarPorFecha(FechaEntregaDesde, FechaEntregaHasta: TDateTime; FechaIni, FechaFin: TDateTime; Marca: integer; Serie: string);
begin
  FechaIni := HourIntoDate(FechaIni, '00:00:00');
  FechaFin := HourIntoDate(FechaFin, '23:59:59');

  with THYFIBQuery.Create(nil) do
  begin
     try
        AutoTrans := False;
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := SQLMarcar.Text;
        SQL.Add(' AND DET.FECHA_ENTREGA_PREV >= :FECHA_DESDE ');
        SQL.Add(' AND DET.FECHA_ENTREGA_PREV <= :FECHA_HASTA ');
        SQL.Add(' )');
        DMMain.Log(SQL.Text);
        Transaction := TUpdate;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['FECHA_ENTREGA_DESDE'].AsDateTime := FechaEntregaDesde;
        Params.ByName['FECHA_ENTREGA_HASTA'].AsDateTime := FechaEntregaHasta;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaIni;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
        Params.ByName['MODO'].AsInteger := Marca;

        ExecQuery;
        if (Transaction.InTransaction) then
           Transaction.Commit;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPedidosPendientesCli.MarcarPorCliente(FechaEntregaDesde, FechaEntregaHasta: TDateTime; ClienteIni, ClienteFin, Marca: integer; Serie: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        AutoTrans := False;
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := SQLMarcar.Text;
        SQL.Add(' AND CAB.CLIENTE >= :CLIENTE_DESDE ');
        SQL.Add(' AND CAB.CLIENTE <= :CLIENTE_HASTA ');
        SQL.Add(')');
        Transaction := TUpdate;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['MODO'].AsInteger := Marca;
        Params.ByName['CLIENTE_DESDE'].AsInteger := ClienteIni;
        Params.ByName['CLIENTE_HASTA'].AsInteger := ClienteFin;
        Params.ByName['FECHA_ENTREGA_DESDE'].AsDateTime := FechaEntregaDesde;
        Params.ByName['FECHA_ENTREGA_HASTA'].AsDateTime := FechaEntregaHasta;

        ExecQuery;
        if (Transaction.InTransaction) then
           Transaction.Commit;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPedidosPendientesCli.AbreTabla(Serie, Familia: string; Cliente: integer; Articulo: string; DesdeFecEntrega, HastaFecEntrega: TDateTime; CampoOrden: integer = -1);
begin
  DMMain.LogIni('AbreTabla');

  DesdeFecEntrega := HourIntoDate(DesdeFecEntrega, '00:00:00');
  HastaFecEntrega := HourIntoDate(HastaFecEntrega, '23:59:59');

  with QMPedidosPendientesCli do
  begin
     if Active then
        Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, DET2.TITULO AS TITULO_LINEA, CAB2.RIG, CAB.CLIENTE, TER.NOMBRE_R_SOCIAL, DET2.UNIDADES, DET2.ALMACEN, ');
     SelectSQL.Add('        DET.U_SERVIDAS, DET.U_PENDIENTES, DET.U_RESERVADAS, DET.SERVIDO, DET2.PRECIO, DET2.DESCUENTO, DET.U_PREPARADAS, ');
     SelectSQL.Add('        DET.FECHA_ENTREGA_PREV, DET.FECHA_REC_DET, DET.FECHA_CONF_DET, DET.ENTRADA_AGRUPACION, DET.ID_DETALLES_S, ');
     SelectSQL.Add('        DET.ID_S, TER.EMAIL CORREO, DET2.EMPRESA, DET2.EJERCICIO, DET2.CANAL, DET2.SERIE, DET2.TIPO, DET2.LINEA, ');
     SelectSQL.Add('        CAB.MODIFICA_DOC, CAB.FECHA, ART.CONTROL_STOCK, COALESCE(PRO.ID_ORDEN, 0) AS ID_ORDEN, ORD.SITUACION AS ESTADO_ORDEN, ');
     SelectSQL.Add('        DET2.CANAL, DET2.SERIE, DET2.TIPO, DET2.LINEA, ART.CONTROL_STOCK, ');
     SelectSQL.Add('        EST.TITULO AS TITULO_ESTADO, CAB.DIRECCION, DIR.DIR_NOMBRE, DIR.DIR_NOMBRE_2, CAB.PEDIDO_CLIENTE AS NRO_PEDIDO, ');
     SelectSQL.Add('        ORD.UNI_TOTAL, ORD.UNI_FABRICADAS, ORD.FECHA_ORD, DET2.MANIPULACION, ART.PREPARABLE, ART.FAMILIA, ');
     SelectSQL.Add('        ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ART.ALFA_4, ART.ALFA_5, ART.ALFA_6, ART.ALFA_7, ART.ALFA_8, DET2.PEDIR, ');
     SelectSQL.Add('        (SELECT FIRST 1 P.FECHA_PRE_CAB ');
     SelectSQL.Add('         FROM GES_DETALLES_RELACIONES R ');
     SelectSQL.Add('         JOIN GES_CABECERAS_E C ON R.D_EMPRESA = C.EMPRESA AND R.D_EJERCICIO = C.EJERCICIO AND R.D_CANAL = C.CANAL AND R.D_SERIE = C.SERIE AND R.D_TIPO = C.TIPO AND R.D_RIG = C.RIG ');
     SelectSQL.Add('         JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         R.O_ID_DETALLES_S = DET.ID_DETALLES_S ');
     SelectSQL.Add('         ORDER BY P.FECHA_PRE_CAB) FECHA_PRE_PROV ');
     SelectSQL.Add(' FROM GES_DETALLES_S_PED DET ');
     SelectSQL.Add(' JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLES_S) ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.ARTICULO = ART.ARTICULO) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S_PED CAB2 ON (CAB.ID_S = CAB2.ID_S) ');
     SelectSQL.Add(' JOIN SYS_TERCEROS TER ON (CAB.TERCERO = TER.TERCERO) ');
     SelectSQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES DIR ON (DIR.TERCERO = CAB.TERCERO AND DIR.DIRECCION = CAB.DIRECCION) ');
     SelectSQL.Add(' LEFT JOIN PRO_PEDIDOS_ORD PRO ON (PRO.EMPRESA = DET2.EMPRESA AND PRO.EJERCICIO = DET2.EJERCICIO AND PRO.CANAL = DET2.CANAL AND PRO.SERIE = DET2.SERIE AND PRO.TIPO = DET2.TIPO AND PRO.RIG = DET2.RIG AND PRO.LINEA = DET2.LINEA) ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD ORD ON (ORD.ID_ORDEN = PRO.ID_ORDEN) ');
     SelectSQL.Add(' LEFT JOIN PRO_SYS_ESTADO EST ON (ORD.SITUACION = EST.ESTADO ) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' CAB.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CAB.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' CAB.CANAL = :CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' CAB.SERIE = :SERIE AND ');
     if (Cliente <> 0) then
        SelectSQL.Add(' CAB.CLIENTE = :CLIENTE AND ');
     if (Articulo <> '') then
        SelectSQL.Add(' DET2.ARTICULO = :ARTICULO AND ');
     if (Familia <> '') then
        SelectSQL.Add(' ART.FAMILIA = :FAMILIA AND ');
     SelectSQL.Add(' CAB.TIPO = :TIPO AND ');
     SelectSQL.Add(' CAB.ESTADO = 0 AND ');
     SelectSQL.Add(' DET.U_SERVIDAS < DET2.UNIDADES AND ');
     SelectSQL.Add(' DET.SERVIDO = 0 AND ');
     SelectSQL.Add(' DET.FECHA_ENTREGA_PREV >= :DESDE_FECHA AND ');
     SelectSQL.Add(' DET.FECHA_ENTREGA_PREV <= :HASTA_FECHA ');

     if (CampoOrden = -1) then
        SelectSQL.Add(' ORDER BY CAB2.RIG, DET2.LINEA ')
     else
     begin
        SelectSQL.Add(' ORDER BY ' + IntToStr(Abs(CampoOrden)));
        if (CampoOrden < 0) then
           SelectSQL.Add(' DESC ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Cliente <> 0) then
        Params.ByName['CLIENTE'].AsInteger := Cliente;
     if (Familia <> '') then
        Params.ByName['FAMILIA'].AsString := Familia;
     if (Articulo <> '') then
        Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['TIPO'].AsString := 'PEC';
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecEntrega;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecEntrega;

     Open;
  end;
  DMMain.LogFin('AbreTabla');
end;

procedure TDMPedidosPendientesCli.RefrescaDatos;
begin
  Refrescar(QMPedidosPendientesCli, 'ID_S', QMPedidosPendientesCliID_S.AsInteger);
end;

procedure TDMPedidosPendientesCli.MarcarPorFechaConfirmadaVacia(FechaEntregaDesde, FechaEntregaHasta: TDateTime; Marca: integer; Serie: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        AutoTrans := False;
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := SQLMarcar.Text;

        SQL.Add(' AND DET.FECHA_CONF_DET IS NULL');
        SQL.Add(' )');

        DMMain.Log(SQL.Text);
        Transaction := TUpdate;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEC';
        Params.ByName['MODO'].AsInteger := Marca;
        Params.ByName['FECHA_ENTREGA_DESDE'].AsDateTime := FechaEntregaDesde;
        Params.ByName['FECHA_ENTREGA_HASTA'].AsDateTime := FechaEntregaHasta;

        ExecQuery;
        if (Transaction.InTransaction) then
           Transaction.Commit;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMPedidosPendientesCli.EnviarCorreos(Serie: string);
var
  Asunto, Fichero : string;
  Grupo : integer;
  Listado : smallint;
  CuerpoMail : TStrings;
begin
  AbreData(TDMListados, DMListados);

  Grupo := 2015;

  Listado := 0;
  REntorno.Copias := 1;

  with xCliConPedidosPend do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT CAB.EMPRESA, CAB.TERCERO, CAB.CLIENTE ');
     SelectSQL.Add(' FROM GES_DETALLES_S_PED DET ');
     SelectSQL.Add(' JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLES_S) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' DET.CANAL = :CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' DET.SERIE = :SERIE AND ');
     SelectSQL.Add(' DET.TIPO = :TIPO AND ');
     SelectSQL.Add(' CAB.ESTADO = 0 AND ');
     SelectSQL.Add(' DET.SERVIDO = 0 AND ');
     SelectSQL.Add(' DET.ENTRADA_AGRUPACION = :ENTRADA_ARUPACION ');
     SelectSQL.Add(' ORDER BY DET.ID_DETALLES_S ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := 'PEC';
     Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
     Open;

     while not EOF do
     begin
        with QMCabecera do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_S IN ');
           SelectSQL.Add(' ( ');
           SelectSQL.Add(' SELECT DISTINCT CAB.ID_S ');
           SelectSQL.Add(' FROM GES_DETALLES_S_PED DET ');
           SelectSQL.Add(' JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLES_S) ');
           SelectSQL.Add(' JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' DET.CANAL = :CANAL AND ');
           if (Serie <> '') then
              SelectSQL.Add(' DET.SERIE = :SERIE AND ');
           SelectSQL.Add(' DET.TIPO = :TIPO AND ');
           SelectSQL.Add(' CAB.ESTADO = 0 AND ');
           SelectSQL.Add(' DET.SERVIDO = 0 AND ');
           SelectSQL.Add(' DET.ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION AND ');
           SelectSQL.Add(' CAB.CLIENTE = :CLIENTE) ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           if (Serie <> '') then
              Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'PEC';
           Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
           Params.ByName['CLIENTE'].AsInteger := xCliConPedidosPend.FieldByName('CLIENTE').AsInteger;
           Open;
        end;

        // Genero el PDF
        Fichero := Format(_('EntregasPendientes_%d.pdf'), [xCliConPedidosPend.FieldByName('CLIENTE').AsInteger]);
        DMListados.Imprimir(Grupo, Listado, {Modo} 2, Serie, Asunto, frListado, frxListado, nil, Fichero);

        try
           InicializaVariableEmail(QMCabecera.FieldByName('TIPO').AsString);
           with VariableEmail do
           begin
              Ejercicio := QMCabecera.FieldByName('EJERCICIO').AsInteger;
              Serie := QMCabecera.FieldByName('SERIE').AsString;
              NumeroDocumento := QMCabecera.FieldByName('RIG').AsInteger;
              Fecha := QMCabecera.FieldByName('FECHA').AsDateTime;
              SuReferencia := QMCabecera.FieldByName('SU_REFERENCIA').AsString;
              SuPedido := QMCabecera.FieldByName('PEDIDO_CLIENTE').AsString;
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := Fichero;
              Matricula := DMMain.DameMatriculaFichaTecnica(QMCabecera.FieldByName('ID_FICHA_TECNICA').AsInteger);

              if (QMCabecera.FieldByName('CLIENTE').AsInteger > 0) then
              begin
                 NombreComercial := QMCabecera.FieldByName('NOMBRE_COMERCIAL').AsString;
                 RazonSocial := QMCabecera.FieldByName('TITULO').AsString;
              end
              else
              begin
                 NombreComercial := DameNombreTercerosVarios(QMCabecera.FieldByName('TIPO').AsString, QMCabecera.FieldByName('ID_S').AsInteger);
                 RazonSocial := NombreComercial;
              end;

              OrdenTrabajo := 0;
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(REntorno.Entrada));
           end;
           DamePartesEmail(Asunto, CuerpoMail);

           DMListados.SendMailTerceroPDF(FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Fichero, Fichero, Asunto, 'PEC', -1, False);
        finally
           CuerpoMail.Free;
        end;

        Next;
     end;
  end;

  CierraData(DMListados);
end;

procedure TDMPedidosPendientesCli.EnviarPedidos(Serie: string);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMListados, DMListados);

  with xCliConPedidosPend do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT CAB.EMPRESA, CAB.TERCERO, CAB.CLIENTE ');
     SelectSQL.Add(' FROM GES_DETALLES_S_PED DET ');
     SelectSQL.Add(' JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLES_S) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' DET.CANAL = :CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' DET.SERIE = :SERIE AND ');
     SelectSQL.Add(' DET.TIPO = :TIPO AND ');
     SelectSQL.Add(' CAB.ESTADO = 0 AND ');
     SelectSQL.Add(' DET.SERVIDO = 0 AND ');
     SelectSQL.Add(' DET.ENTRADA_AGRUPACION = :ENTRADA_ARUPACION ');
     SelectSQL.Add(' ORDER BY DET.ID_DETALLES_S ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := 'PEC';
     Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
     Open;

     while not EOF do
     begin
        with QMCabecera do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_S IN ');
           SelectSQL.Add(' ( ');
           SelectSQL.Add(' SELECT DISTINCT CAB.ID_S ');
           SelectSQL.Add(' FROM GES_DETALLES_S_PED DET ');
           SelectSQL.Add(' JOIN GES_DETALLES_S DET2 ON (DET.ID_DETALLES_S = DET2.ID_DETALLES_S) ');
           SelectSQL.Add(' JOIN GES_CABECERAS_S CAB ON (DET.ID_S = CAB.ID_S) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' DET.CANAL = :CANAL AND ');
           if (Serie <> '') then
              SelectSQL.Add(' DET.SERIE = :SERIE AND ');
           SelectSQL.Add(' DET.TIPO = :TIPO AND ');
           SelectSQL.Add(' CAB.ESTADO = 0 AND ');
           SelectSQL.Add(' DET.SERVIDO = 0 AND ');
           SelectSQL.Add(' DET.ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION AND ');
           SelectSQL.Add(' CAB.CLIENTE = :CLIENTE) ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           if (Serie <> '') then
              Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'PEC';
           Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
           Params.ByName['CLIENTE'].AsInteger := xCliConPedidosPend.FieldByName('CLIENTE').AsInteger;
           Open;
        end;

        AbreData(TDMLstPedidos, DMLstPedidos);

        Memo := TStringList.Create;
        try
           DMLstPedidos.MostrarListadoMail(QMCabecera.FieldByName('ID_S').AsInteger, QMCabecera.FieldByName('SERIE').AsString, 2, QMCabecera.FieldByName('EJERCICIO').AsInteger);

           InicializaVariableEmail(QMCabecera.FieldByName('TIPO').AsString);
           with VariableEmail do
           begin
              Ejercicio := QMCabecera.FieldByName('EJERCICIO').AsInteger;
              Serie := QMCabecera.FieldByName('SERIE').AsString;
              NumeroDocumento := QMCabecera.FieldByName('RIG').AsInteger;
              Fecha := QMCabecera.FieldByName('FECHA').AsDateTime;
              SuReferencia := QMCabecera.FieldByName('SU_REFERENCIA').AsString;
              SuPedido := QMCabecera.FieldByName('PEDIDO_CLIENTE').AsString;
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := DMLstPedidos.nombreFich;
              Matricula := DMMain.DameMatriculaFichaTecnica(FieldByName('ID_FICHA_TECNICA').AsInteger);
              if (QMCabecera.FieldByName('CLIENTE').AsInteger > 0) then
              begin
                 NombreComercial := QMCabecera.FieldByName('NOMBRE_COMERCIAL').AsString;
                 RazonSocial := QMCabecera.FieldByName('TITULO').AsString;
              end
              else
              begin
                 NombreComercial := DameNombreTercerosVarios(QMCabecera.FieldByName('TIPO').AsString, QMCabecera.FieldByName('ID_S').AsInteger);
                 RazonSocial := NombreComercial;
              end;
              OrdenTrabajo := 0;
              IdOrdenTrabajo := 0;
              UsuarioCreadorDocumento := '';
           end;
           DamePartesEmail(Asunto, CuerpoMail);

           try
              DMListados.SendMailTerceroPDF2(QMCabecera.FieldByName('TERCERO').AsInteger, CuerpoMail, DMLstPedidos.rutaFich,
                 DMLstPedidos.nombreFich, Asunto, 'PEC', QMCabecera.FieldByName('ID_S').AsInteger, True);
           finally
              CuerpoMail.Free;
           end;
        finally
           Memo.Free;
        end;

        // Marco el documento como listado
        DMLstPedidos.UpdateaDocumentos;

        CierraData(DMLstPedidos);

        Next;
     end;
  end;

  CierraData(DMListados);
end;

procedure TDMPedidosPendientesCli.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xCliente.Open;
  xDireccionClientes.Open;
end;

procedure TDMPedidosPendientesCli.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xCliente.Close;
  xDireccionClientes.Close;
end;

procedure TDMPedidosPendientesCli.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMPedidosPendientesCli.frxListadoGetValue(const VarName: string; var Value: variant);
begin
  frListadoGetValue(VarName, Value);
end;

procedure TDMPedidosPendientesCli.frListadoBeforePrint(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMPedidosPendientesCli.frxListadoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMPedidosPendientesCli.QMPedidosPendientesCliAfterOpen(DataSet: TDataSet);
begin
  xRelacion.Open;
end;

procedure TDMPedidosPendientesCli.QMPedidosPendientesCliAfterClose(DataSet: TDataSet);
begin
  xRelacion.Close;
end;

procedure TDMPedidosPendientesCli.StockAlmacen(aAlmacen: string);
var
  TituloColumanAlmacen : string;
begin
  Almacen := aAlmacen;

  // Cambio el titulo de la columna para informar de que almacen obtengo el stock
  if (Almacen = 'NOCALC') then
     TituloColumanAlmacen := 'OFF'
  else
  if (Almacen = '') then
     TituloColumanAlmacen := 'ALL'
  else
     TituloColumanAlmacen := Almacen;

  QMPedidosPendientesCliSTOCK_ALM.DisplayLabel := Format(_('Stock[%s]'), [TituloColumanAlmacen]);
  QMPedidosPendientesCliSTOCK_MINIMO.DisplayLabel := Format(_('Stock Mín.[%s]'), [TituloColumanAlmacen]);

  // Refresco el detalle
  StockAlm.Clear;
  StockMin.Clear;
  Refrescar(QMPedidosPendientesCli, 'ID_DETALLES_S', QMPedidosPendientesCliID_DETALLES_S.AsInteger);
end;

procedure TDMPedidosPendientesCli.CalculaPedidosProveedor(aCalcular: boolean);
begin
  CalcularPedidosProveedor := aCalcular;
  PedProv.Clear;
  QMPedidosPendientesCli.Refresh;
end;

procedure TDMPedidosPendientesCli.QMPedidosPendientesCliSTOCK_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((Almacen = 'NOCALC') or (QMPedidosPendientesCliCONTROL_STOCK.AsInteger = 0)) then
     Text := ''
  else
     Text := FormatFloat('0.00', QMPedidosPendientesCliSTOCK_ALM.AsFloat);
end;

procedure TDMPedidosPendientesCli.QMPedidosPendientesCliCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock, StockMinimo, Pedidos : double;
  Articulo : string;
begin
  // Calculo de las existencias y minimo del articulo. Si se calcula...

  Articulo := QMPedidosPendientesCliARTICULO.AsString;
  Stock := 0;
  StockMinimo := 0;

  if not ((Almacen = 'NOCALC') or (QMPedidosPendientesCliCONTROL_STOCK.AsInteger = 0)) then
  begin
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, Almacen);
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT STOCK_MINIMO FROM ART_ARTICULOS_ALMACENES_ART ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' ARTICULO = :ARTICULO AND ');
                 SQL.Add(' ALMACEN = :ALMACEN ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['ARTICULO'].AsString := Articulo;
                 Params.ByName['ALMACEN'].AsString := Almacen;
                 ExecQuery;
                 StockMinimo := FieldByName['STOCK_MINIMO'].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Values[Articulo] := FloatToStr(Stock);
           StockMin.Values[Articulo] := FloatToStr(StockMinimo);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
           StockMinimo := StrToFloat(StockMin.Values[Articulo]);
        end;
     end;
  end;
  QMPedidosPendientesCliSTOCK_ALM.AsFloat := Stock;
  QMPedidosPendientesCliSTOCK_MINIMO.AsFloat := StockMinimo;

  Pedidos := 0;
  if (CalcularPedidosProveedor) then
  begin
     with PedProv do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Pedidos := DMMain.DamePedidosAProveedor(REntorno.Empresa, REntorno.Canal, Articulo, '');
           Values[Articulo] := FloatToStr(Pedidos);
        end
        else
        begin
           Pedidos := StrToFloat(Values[Articulo]);
        end;
     end;
  end;
  QMPedidosPendientesCliPEDIDOS_A_PRO.AsFloat := Pedidos;
end;

procedure TDMPedidosPendientesCli.QMPedidosPendientesCliSTOCK_MINIMOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((Almacen = 'NOCALC') or (QMPedidosPendientesCliCONTROL_STOCK.AsInteger = 0)) then
     Text := ''
  else
     Text := FloatToStr(QMPedidosPendientesCliSTOCK_MINIMO.AsFloat);
end;

procedure TDMPedidosPendientesCli.GeneraAltaPedidos(Almacen, Serie: string; Responsable, IdUbicacionSimple: integer);
var
  IdMin, IdMax : integer;
  Filtro : string;
begin
  Filtro := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE GENERA_ALTA_PEDIDOS (:EMPRESA, :CANAL, :SERIE, :ENTRADA, :ALMACEN, :RESPONSABLE, :ID_UBICACION_SIMPLE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['RESPONSABLE'].AsInteger := Responsable;
        Params.ByName['ID_UBICACION_SIMPLE'].AsInteger := IdUbicacionSimple;
        ExecQuery;
        IdMin := FieldByName['ID_MIN'].AsInteger;
        IdMax := FieldByName['ID_MAX'].AsInteger;
        FreeHandle;

        if (IdMin <> 0) then
           Filtro := 'ID BETWEEN ' + IntToStr(IdMin) + ' AND ' + IntToStr(IdMax);
     finally
        Free;
     end;
  end;

  if (IdMin <> 0) then
     FMain.EjecutaAccion(FMain.AHojaDePreparacion, Filtro);
end;

procedure TDMPedidosPendientesCli.MarcarListosParaPreparar;
var
  bm : TBookmark;
begin
  // Marca las lineas que tienen stock suficiente y que no estan completamente preparadas.
  with QMPedidosPendientesCli do
  begin
     bm := GetBookmark;
     try
        DisableControls;
        First;
        while not EOF do
        begin
           if ((QMPedidosPendientesCliPREPARABLE.AsInteger = 1) or
              ((QMPedidosPendientesCliSTOCK_ALM.AsFloat >= (QMPedidosPendientesCliU_PENDIENTES.AsFloat - QMPedidosPendientesCliU_PREPARADAS.AsFloat)) and
              (QMPedidosPendientesCliU_PENDIENTES.AsFloat <> QMPedidosPendientesCliU_PREPARADAS.AsFloat))) then
           begin
              Edit;
              QMPedidosPendientesCliENTRADA_AGRUPACION.AsInteger := REntorno.Entrada;
              Post;
           end;
           Next;
        end;
        GotoBookmark(bm);
     finally
        EnableControls;
        FreeBookmark(bm);
     end;
  end;
end;

procedure TDMPedidosPendientesCli.MarcarSemiPreparables;
var
  bm : TBookmark;
begin
  // Marca las lineas que NO tienen stock suficiente pero tienen stock como para ser parcialmente preparadas.
  with QMPedidosPendientesCli do
  begin
     bm := GetBookmark;
     try
        DisableControls;
        First;
        while not EOF do
        begin
           if ((QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat > 0) and (QMPedidosPendientesCli.FieldByName('STOCK_ALM').AsFloat < (QMPedidosPendientesCli.FieldByName('U_PENDIENTES').AsFloat - QMPedidosPendientesCli.FieldByName('U_PREPARADAS').AsFloat))) then
           begin
              Edit;
              QMPedidosPendientesCliENTRADA_AGRUPACION.AsInteger := REntorno.Entrada;
              Post;
           end;
           Next;
        end;
        GotoBookmark(bm);
     finally
        EnableControls;
        FreeBookmark(bm);
     end;
  end;
end;

procedure TDMPedidosPendientesCli.BorrarRelacion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM GES_DETALLES_RELACIONES R ');
        SQL.Add(' WHERE ');
        SQL.Add(' R.O_EMPRESA = :EMPRESA AND ');
        SQL.Add(' R.O_EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' R.O_CANAL = :CANAL AND ');
        SQL.Add(' R.O_SERIE = :SERIE AND ');
        SQL.Add(' R.O_TIPO = :TIPO AND ');
        SQL.Add(' R.O_RIG = :RIG AND ');
        SQL.Add(' R.O_LINEA = :LINEA AND ');
        SQL.Add(' R.D_ID_DETALLES_S = :ID_DETALLES_E ');
        Params.ByName['EMPRESA'].AsInteger := QMPedidosPendientesCliEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosPendientesCliEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPedidosPendientesCliCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMPedidosPendientesCliSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMPedidosPendientesCliTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMPedidosPendientesCliRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMPedidosPendientesCliLINEA.AsInteger;
        Params.ByName['ID_DETALLES_E'].AsInteger := xRelacionID_DETALLES_E.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xRelacion.Close;
  xRelacion.Open;
end;

procedure TDMPedidosPendientesCli.MostrarListado;
var
  Grupo, Listado : integer;
  Fichero : string;
  id : integer;
begin
  Id := QMPedidosPendientesCliID_DETALLES_S.AsInteger;

  AbreData(TDMListados, DMListados);
  try
     Grupo := 661;
     Listado := 0;

     QMPedidosPendientesCli.First;
     Fichero := Format(_('PedidosPendientes_%s.pdf'), [FormatDateTime('yyyymmdd_hhnnss', Now)]);
     DMListados.Imprimir(Grupo, Listado, {Modo} 0, '', _('Relacion de Pedidos de Venta'), frListado, frxListado, nil, Fichero);
  finally
     CierraData(DMListados);
  end;

  Posicionar(QMPedidosPendientesCli, 'ID_DETALLES_S', Id);
end;

end.
