unit UDMPedidosPendientesProv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, SysUtils, FIBDataSetRO, HYFIBQuery,
  UFMControlErroresFactura, FIBDataSetRW, Controls, frxClass, frxHYReport,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TDMPedidosPendientesProv = class(TDataModule)
     DSPedidosPendientesProv: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPedidosPendientesProvARTICULO: TFIBStringField;
     QMPedidosPendientesProvTITULO: TFIBStringField;
     QMPedidosPendientesProvUNIDADES_ORIGINALES: TFloatField;
     QMPedidosPendientesProvUNIDADES_SERVIDAS: TFloatField;
     QMPedidosPendientesProvUNIDADES_POR_SERVIR: TFloatField;
     QMPedidosPendientesProvLINEA_SERVIDA: TIntegerField;
     QMPedidosPendientesProvP_COSTE: TFloatField;
     QMPedidosPendientesProvUNIDADES_RECEPCION: TFloatField;
     QMPedidosPendientesProvFECHA_PRE_DET: TDateTimeField;
     QMPedidosPendientesProvFECHA_REC_DET: TDateTimeField;
     QMPedidosPendientesProvSERVIR_LINEA: TIntegerField;
     QMPedidosPendientesProvFECHA_CONF_KRI: TDateTimeField;
     QMPedidosPendientesProvPLAZO_CONFIRM_KRI: TDateTimeField;
     QMPedidosPendientesProv: TFIBTableSet;
     QMPedidosPendientesProvENTRADA_RECEPCION: TIntegerField;
     QMPedidosPendientesProvID_DETALLES_E: TIntegerField;
     QMPedidosPendientesProvRIG: TIntegerField;
     QMPedidosPendientesProvPROVEEDOR: TIntegerField;
     QMPedidosPendientesProvUNIDADES: TFloatField;
     QMPedidosPendientesProvALMACEN: TFIBStringField;
     QMPedidosPendientesProvDESCUENTO: TFloatField;
     QMPedidosPendientesProvID_ORDEN: TIntegerField;
     QMPedidosPendientesProvCORREO: TFIBStringField;
     QMPedidosPendientesProvEMPRESA: TIntegerField;
     QMPedidosPendientesProvEJERCICIO: TIntegerField;
     QMPedidosPendientesProvCANAL: TIntegerField;
     QMPedidosPendientesProvSERIE: TFIBStringField;
     QMPedidosPendientesProvTIPO: TFIBStringField;
     QMPedidosPendientesProvLINEA: TIntegerField;
     QMPedidosPendientesProvID_E: TIntegerField;
     QMPedidosPendientesProvMODIFICA_DOC: TIntegerField;
     QMPedidosPendientesProvFECHA: TDateTimeField;
     QMPedidosPendientesProvINCR_PEDIDO: TFloatField;
     QMPedidosPendientesProvSTOCK_ALM: TFloatField;
     QMPedidosPendientesProvSTOCK_ALM_2: TFloatField;
     QMCabecera: TFIBTableSet;
     DSCabecera: TDataSource;
     QMDetalle: TFIBTableSet;
     DSDetalle: TDataSource;
     frListado: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frxListado: TfrxHYReport;
     frDBDetalle: TfrDBDataSet;
     xProvConPedidosPend: TFIBTableSet;
     DSProvConPedidosPen: TDataSource;
     xProveedores: TFIBDataSetRO;
     DSxProveedores: TDataSource;
     xDireccionProveedores: TFIBDataSetRO;
     DSxDireccion_Proveedores: TDataSource;
     xRelacion: TFIBTableSet;
     DSxRelacion: TDataSource;
     xRelacionID_S: TIntegerField;
     xRelacionCANAL: TIntegerField;
     xRelacionSERIE: TFIBStringField;
     xRelacionTIPO: TFIBStringField;
     xRelacionRIG: TIntegerField;
     xRelacionFECHA: TDateTimeField;
     xRelacionSU_REFERENCIA: TFIBStringField;
     xRelacionCLIENTE: TIntegerField;
     xRelacionNOMBRE_R_SOCIAL: TFIBStringField;
     xRelacionEJERCICIO: TIntegerField;
     xRelacionEMPRESA: TIntegerField;
     xRelacionFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosPendientesProvCONTROL_STOCK: TIntegerField;
     QMPedidosPendientesProvSTOCK_MINIMO: TFloatField;
     QMPedidosPendientesProvFECHA_ENTREGA_PREV_CLI: TDateTimeField;
     QMPedidosPendientesProvPEDIDOS_A_PROV: TFloatField;
     QMPedidosPendientesProvFAMILIA: TFIBStringField;
     xRelacionLINEA: TIntegerField;
     xRelacionARTICULO: TFIBStringField;
     xRelacionTITULO: TFIBStringField;
     xRelacionID_DETALLES_S: TIntegerField;
     QMPedidosPendientesProvALFA_1: TFIBStringField;
     QMPedidosPendientesProvALFA_2: TFIBStringField;
     QMPedidosPendientesProvALFA_3: TFIBStringField;
     QMPedidosPendientesProvALFA_4: TFIBStringField;
     QMPedidosPendientesProvALFA_5: TFIBStringField;
     QMPedidosPendientesProvALFA_6: TFIBStringField;
     QMPedidosPendientesProvALFA_7: TFIBStringField;
     QMPedidosPendientesProvALFA_8: TFIBStringField;
     QMPedidosPendientesProvESTADO_ORDEN: TIntegerField;
     QMPedidosPendientesProvTITULO_ESTADO: TFIBStringField;
     QMPedidosPendientesProvTITULO_LINEA: TFIBStringField;
     QMPedidosPendientesProvNOMBRE_COMERCIAL: TFIBStringField;
     QMPedidosPendientesProvNOMBRE_R_SOCIAL: TFIBStringField;
     QMPedidosPendientesProvPEDIDOS_D_CLI: TFloatField;
     procedure DMPedidosPendientesProvCreate(Sender: TObject);
     procedure QMLineasPedidosProveedorNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure frxListadoGetValue(const VarName: string; var Value: variant);
     procedure frListadoBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxListadoBeforePrint(Sender: TfrxReportComponent);
     procedure QMPedidosPendientesProvAfterOpen(DataSet: TDataSet);
     procedure QMPedidosPendientesProvAfterClose(DataSet: TDataSet);
     procedure QMPedidosPendientesProvSTOCK_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPedidosPendientesProvCalcFields(DataSet: TDataSet);
     procedure QMPedidosPendientesProvSTOCK_MINIMOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPedidosPendientesProvSTOCK_ALM_2GetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     // evaluacion: integer;
     // fecha_eval: TDateTime;
     LocalMascaraN: string;
     SQLMarcarBase, SQLMarcar: TStrings;
     Almacen, Almacen2: string;
     StockAlm, StockAlm2, StockMin, PedCli: TStrings;
     CalcularPedidosCliente: boolean;
     procedure RefrescaDatos;
  public
     { Public declarations }
     procedure MarcarPorFecha(FechaIni, FechaFin: TDateTime; Marca: integer; Serie: string);
     procedure MarcarPorProveedor(ProveedorIni, ProveedorFin, Marca: integer; Serie: string);
     procedure MarcarPorFechaConfirmadaVacia(Marca: integer; Serie: string);
     procedure MarcarTodo(Serie: string; Marca: integer);
     procedure AbreTabla(Serie, Familia, Articulo: string; Proveedor, Cliente: integer; CampoOrden: integer = -1; Abrir: boolean = True);
     procedure EnviarCorreos(Serie: string);
     procedure EnviarPedidos(Serie: string);
     procedure StockAlmacen(aAlmacen: string);
     procedure StockAlmacen2(aAlmacen: string);
     procedure CalculaPedidosCliente(aCalcular: boolean);
     procedure BorrarRelacion;
  end;

var
  DMPedidosPendientesProv : TDMPedidosPendientesProv;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFMain, UFormGest, Dialogs, UDMListados, DateUtils, UDMLstPedidos_prov, UParam;

{$R *.DFM}

procedure TDMPedidosPendientesProv.DMPedidosPendientesProvCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Formatos de visualizacion
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);

  AsignaDisplayFormat(QMPedidosPendientesProv, LocalMascaraN, MascaraI, ShortDateFormat);

  QMPedidosPendientesProvUNIDADES.DisplayFormat := MascaraI;
  QMPedidosPendientesProvUNIDADES_ORIGINALES.DisplayFormat := MascaraI;
  QMPedidosPendientesProvUNIDADES_SERVIDAS.DisplayFormat := MascaraI;
  QMPedidosPendientesProvUNIDADES_POR_SERVIR.DisplayFormat := MascaraI;
  QMPedidosPendientesProvUNIDADES_RECEPCION.DisplayFormat := MascaraI;
  QMPedidosPendientesProvSTOCK_ALM.DisplayFormat := MascaraN;
  QMPedidosPendientesProvSTOCK_ALM_2.DisplayFormat := MascaraN;
  QMPedidosPendientesProvSTOCK_MINIMO.DisplayFormat := MascaraN;
  QMPedidosPendientesProvPEDIDOS_A_PROV.DisplayFormat := MascaraN;

  AsignaDisplayFormat(xRelacion, LocalMascaraN, MascaraI, ShortDateFormat);

  // Inicializamos la base del contenido del update para luego utilizar en los marcados
  SQLMarcarBase := TStringList.Create();
  with SQLMarcarBase do
  begin
     Add(' UPDATE GES_DETALLES_E_PED ');
     Add(' SET ');
     Add(' ENTRADA_RECEPCION = :MODO ');
     Add(' WHERE ');
     Add(' ID_DETALLES_E IN (SELECT DET.ID_DETALLES_E ');
     Add('                   FROM GES_DETALLES_E_PED DET ');
     Add('                   JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLES_E) ');
     Add('                   JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.ARTICULO = ART.ARTICULO) ');
     Add('                   JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E) ');
     Add('                   JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E) ');
     Add('                   WHERE ');
     Add('                   DET.EMPRESA = :EMPRESA AND ');
     Add('                   DET.EJERCICIO <= :EJERCICIO AND ');
     Add('                   DET.CANAL = :CANAL AND ');
     Add('                   ((DET.SERIE = CAST(:SERIE AS VARCHAR(10))) OR (CAST(:SERIE AS VARCHAR(10)) = '''')) AND ');
     Add('                   DET.TIPO = :TIPO AND ');
     Add('                   CAB.ESTADO = 0 AND ');
     Add('                   DET.LINEA_SERVIDA = 0 ');
  end;

  SQLMarcar := TStringList.Create();
  SQLMarcar.Text := SQLMarcarBase.Text;

  PedCli := TStringList.Create;
  StockAlm := TStringList.Create;
  StockAlm2 := TStringList.Create;
  StockMin := TStringList.Create;
  Almacen := 'NOCALC';

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMPedidosPendientesProv.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
end;

procedure TDMPedidosPendientesProv.DataModuleDestroy(Sender: TObject);
begin
  SQLMarcar.Free;
  SQLMarcarBase.Free;
  PedCli.Free;
  StockAlm.Free;
  StockAlm2.Free;
  StockMin.Free;
end;

procedure TDMPedidosPendientesProv.QMLineasPedidosProveedorNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPedidosPendientesProv.MarcarTodo(Serie: string; Marca: integer);
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
        Params.ByName['TIPO'].AsString := 'PEP';
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

procedure TDMPedidosPendientesProv.MarcarPorFecha(FechaIni, FechaFin: TDateTime; Marca: integer; Serie: string);
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
        SQL.Add(' AND DET.FECHA_PRE_DET >= :FECHA_DESDE ');
        SQL.Add(' AND DET.FECHA_PRE_DET <= :FECHA_HASTA ');
        SQL.Add(' )');
        DMMain.Log(SQL.Text);
        Transaction := TUpdate;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEP';
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

procedure TDMPedidosPendientesProv.MarcarPorProveedor(ProveedorIni, ProveedorFin, Marca: integer; Serie: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        AutoTrans := False;
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := SQLMarcar.Text;
        SQL.Add(' AND CAB2.PROVEEDOR >= :PROVEEDOR_DESDE ');
        SQL.Add(' AND CAB2.PROVEEDOR <= :PROVEEDOR_HASTA ');
        SQL.Add(')');
        Transaction := TUpdate;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEP';
        Params.ByName['MODO'].AsInteger := Marca;
        Params.ByName['PROVEEDOR_DESDE'].AsInteger := ProveedorIni;
        Params.ByName['PROVEEDOR_HASTA'].AsInteger := ProveedorFin;

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

procedure TDMPedidosPendientesProv.AbreTabla(Serie, Familia, Articulo: string; Proveedor, Cliente: integer; CampoOrden: integer = -1; Abrir: boolean = True);
begin
  DMMain.LogIni('AbreTabla');
  with QMPedidosPendientesProv do
  begin
     if Active then
        Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, DET2.TITULO AS TITULO_LINEA, CAB2.RIG, CAB2.PROVEEDOR, TER.NOMBRE_R_SOCIAL, ');
     SelectSQL.Add('        TER.NOMBRE_COMERCIAL, DET2.UNIDADES, DET2.ALMACEN, ');
     SelectSQL.Add('        DET.UNIDADES_ORIGINALES, DET.UNIDADES_SERVIDAS, DET.UNIDADES_POR_SERVIR, DET.LINEA_SERVIDA, DET.P_COSTE, ');
     SelectSQL.Add('        DET2.DESCUENTO, DET.UNIDADES_RECEPCION, DET.FECHA_PRE_DET, DET.FECHA_REC_DET, DET.SERVIR_LINEA, ');
     SelectSQL.Add('        DET.FECHA_CONF_KRI, DET.PLAZO_CONFIRM_KRI, DET.ENTRADA_RECEPCION, DET.ID_DETALLES_E, DET.ID_E, CAB2.ID_ORDEN, ');
     SelectSQL.Add('        ORD.ESTADO AS ESTADO_ORDEN, EST.TITULO AS TITULO_ESTADO, TER.EMAIL CORREO, CAB.MODIFICA_DOC, CAB.FECHA, ');
     SelectSQL.Add('        DET2.EMPRESA, DET2.EJERCICIO, DET2.CANAL, DET2.SERIE, DET2.TIPO, DET2.LINEA, ');
     SelectSQL.Add('        COALESCE(APR.INCR_PEDIDO, 0) AS INCR_PEDIDO, ART.CONTROL_STOCK, ART.FAMILIA, ART.ALFA_1, ART.ALFA_2, ART.ALFA_3, ');
     SelectSQL.Add('        ART.ALFA_4, ART.ALFA_5, ART.ALFA_6, ART.ALFA_7, ART.ALFA_8, ');
     SelectSQL.Add('        (SELECT FIRST 1 P.FECHA_ENTREGA_PREV ');
     SelectSQL.Add('         FROM GES_DETALLES_RELACIONES R ');
     SelectSQL.Add('         JOIN GES_CABECERAS_S C ON R.O_EMPRESA = C.EMPRESA AND R.O_EJERCICIO = C.EJERCICIO AND R.O_CANAL = C.CANAL AND R.O_SERIE = C.SERIE AND R.O_TIPO = C.TIPO AND R.O_RIG = C.RIG ');
     SelectSQL.Add('         LEFT JOIN GES_CABECERAS_S_PED P ON C.ID_S = P.ID_S ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         R.D_ID_DETALLES_S = DET.ID_DETALLES_E ');
     SelectSQL.Add('         ORDER BY P.FECHA_ENTREGA_PREV) FECHA_ENTREGA_PREV_CLI, ');
     SelectSQL.Add('        (COALESCE((SELECT SUM(P.UNIDADES_POR_SERVIR) ');
     SelectSQL.Add('                   FROM GES_DETALLES_E_PED P ');
     SelectSQL.Add('                   JOIN GES_DETALLES_E D ON (P.ID_DETALLES_E = D.ID_DETALLES_E) ');
     SelectSQL.Add('                   JOIN GES_CABECERAS_E G ON (P.ID_E = G.ID_E) ');
     SelectSQL.Add('                   WHERE ');
     SelectSQL.Add('                   D.EMPRESA = DET.EMPRESA AND ');
     SelectSQL.Add('                   D.CANAL = DET.CANAL AND ');
     SelectSQL.Add('                   D.ARTICULO = DET2.ARTICULO AND ');
     SelectSQL.Add('                   P.LINEA_SERVIDA = 0 AND ');
     SelectSQL.Add('                   G.ESTADO = 0), 0)) PEDIDOS_A_PROV ');
     SelectSQL.Add(' FROM GES_DETALLES_E_PED DET ');
     SelectSQL.Add(' JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLES_E) ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.ARTICULO = ART.ARTICULO) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E) ');
     SelectSQL.Add(' JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_PROVEEDORES APR ON (ART.EMPRESA = APR.EMPRESA AND ART.ARTICULO = APR.ARTICULO AND CAB2.PROVEEDOR = APR.PROVEEDOR AND APR.ACTIVO = 1) ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD ORD ON (ORD.ID_ORDEN = CAB2.ID_ORDEN) ');
     SelectSQL.Add(' LEFT JOIN PRO_SYS_ESTADO EST ON (ORD.ESTADO = EST.ESTADO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' DET.CANAL = :CANAL AND ');
     SelectSQL.Add(' DET.TIPO = :TIPO AND ');
     SelectSQL.Add(' CAB.ESTADO = 0 AND ');
     SelectSQL.Add(' DET.UNIDADES_SERVIDAS < DET2.UNIDADES AND ');
     SelectSQL.Add(' DET.LINEA_SERVIDA = 0 ');

     if (Serie <> '') then
        SelectSQL.Add(' AND DET.SERIE = :SERIE ');
     if (Proveedor <> 0) then
        SelectSQL.Add(' AND CAB2.PROVEEDOR = :PROVEEDOR ');
     if (Familia <> '') then
        SelectSQL.Add(' AND ART.FAMILIA = :FAMILIA ');
     if (Articulo <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        SelectSQL.Add('     (UPPER(ART.TITULO_LARGO) LIKE ''%' + UpperCase(Trim(Copy(Articulo, 1, 256))) + '%'') OR ');
        SelectSQL.Add('     (UPPER(DET2.ARTICULO) LIKE ''%' + UpperCase(Trim(Copy(Articulo, 1, 15))) + '%'') ');
        SelectSQL.Add('     ) ');
     end;

     if (Cliente <> 0) then
     begin
        SelectSQL.Add(' AND EXISTS(SELECT C.CLIENTE ');
        SelectSQL.Add('            FROM GES_DETALLES_RELACIONES R ');
        SelectSQL.Add('            JOIN GES_CABECERAS_S C ON R.O_EMPRESA = C.EMPRESA AND R.O_EJERCICIO = C.EJERCICIO AND R.O_CANAL = C.CANAL AND R.O_SERIE = C.SERIE AND R.O_TIPO = C.TIPO AND R.O_RIG = C.RIG ');
        SelectSQL.Add('            WHERE ');
        SelectSQL.Add('            R.D_EMPRESA = DET.EMPRESA AND ');
        SelectSQL.Add('            R.D_EJERCICIO = DET.EJERCICIO AND ');
        SelectSQL.Add('            R.D_CANAL = DET.CANAL AND ');
        SelectSQL.Add('            R.D_SERIE = DET.SERIE AND ');
        SelectSQL.Add('            R.D_TIPO = DET.TIPO AND ');
        SelectSQL.Add('            R.D_RIG = DET.RIG AND ');
        SelectSQL.Add('            R.D_LINEA = DET.LINEA AND');
        SelectSQL.Add('            C.CLIENTE = :CLIENTE)');
     end;

     // LONPER: lo quiere ordenado por fecha descendiente
     // Si otro cliente se queja parametrizar
     if (CampoOrden = -1) then
        SelectSQL.Add(' ORDER BY CAB.FECHA DESC ')
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
     if (Proveedor <> 0) then
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     if (Familia <> '') then
        Params.ByName['FAMILIA'].AsString := Familia;
     if (Cliente <> 0) then
        Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['TIPO'].AsString := 'PEP';

     if Abrir then
        Open;
  end;

  SQLMarcar.Text := SQLMarcarBase.Text;
  if (Proveedor <> 0) then
     SQLMarcar.Add(' AND CAB2.PROVEEDOR = ' + IntToStr(Proveedor));

  DMMain.LogFin('AbreTabla');
end;

procedure TDMPedidosPendientesProv.RefrescaDatos;
begin
  Refrescar(QMPedidosPendientesProv, 'ID_E', QMPedidosPendientesProvID_E.AsInteger);
end;

procedure TDMPedidosPendientesProv.MarcarPorFechaConfirmadaVacia(Marca: integer; Serie: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        AutoTrans := False;
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := SQLMarcar.Text;

        SQL.Add(' AND DET.PLAZO_CONFIRM_KRI IS NULL');
        SQL.Add(' )');

        DMMain.Log(SQL.Text);
        Transaction := TUpdate;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'PEP';
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

procedure TDMPedidosPendientesProv.EnviarCorreos(Serie: string);
var
  Asunto, Fichero : string;
  Grupo : integer;
  Listado : smallint;
  CuerpoMail : TStrings;
begin
  AbreData(TDMListados, DMListados);

  Grupo := 2012;

  Listado := 0;
  REntorno.Copias := 1;

  with xProvConPedidosPend do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT CAB2.EMPRESA, CAB2.TERCERO, CAB2.PROVEEDOR ');
     SelectSQL.Add(' FROM GES_DETALLES_E_PED DET ');
     SelectSQL.Add(' JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLES_E) ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.ARTICULO = ART.ARTICULO) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E) ');
     SelectSQL.Add(' JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' DET.CANAL = :CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' DET.SERIE = :SERIE AND ');
     SelectSQL.Add(' DET.TIPO = :TIPO AND ');
     SelectSQL.Add(' CAB.ESTADO = 0 AND ');
     SelectSQL.Add(' DET.LINEA_SERVIDA = 0 AND ');
     SelectSQL.Add(' DET.ENTRADA_RECEPCION = :ENTRADA_RECEPCION ');
     SelectSQL.Add(' ORDER BY DET.ID_DETALLES_E ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := 'PEP';
     Params.ByName['ENTRADA_RECEPCION'].AsInteger := REntorno.Entrada;
     Open;

     while not EOF do
     begin
        with QMCabecera do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_PROV ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_E IN ');
           SelectSQL.Add(' ( ');
           SelectSQL.Add(' SELECT DISTINCT CAB.ID_E ');
           SelectSQL.Add(' FROM GES_DETALLES_E_PED DET ');
           SelectSQL.Add(' JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLES_E) ');
           SelectSQL.Add(' JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E) ');
           SelectSQL.Add(' JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' DET.CANAL = :CANAL AND ');
           if (Serie <> '') then
              SelectSQL.Add(' DET.SERIE = :SERIE AND ');
           SelectSQL.Add(' DET.TIPO = :TIPO AND ');
           SelectSQL.Add(' CAB.ESTADO = 0 AND ');
           SelectSQL.Add(' DET.LINEA_SERVIDA = 0 AND ');
           SelectSQL.Add(' DET.ENTRADA_RECEPCION = :ENTRADA_RECEPCION AND ');
           SelectSQL.Add(' CAB2.PROVEEDOR = :PROVEEDOR) ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           if (Serie <> '') then
              Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'PEP';
           Params.ByName['ENTRADA_RECEPCION'].AsInteger := REntorno.Entrada;
           Params.ByName['PROVEEDOR'].AsInteger := xProvConPedidosPend.FieldByName('PROVEEDOR').AsInteger;
           Open;
        end;

        // Genero el PDF
        Fichero := Format(_('EntregasPendientes_%d.pdf'), [xProvConPedidosPend.FieldByName('PROVEEDOR').AsInteger]);
        DMListados.Imprimir(Grupo, Listado, {Modo} 2, Serie, Asunto, frListado, frxListado, nil, Fichero);

        try
           InicializaVariableEmail('RPP');
           with VariableEmail do
           begin
              Ejercicio := QMCabecera.FieldByName('EJERCICIO').AsInteger;
              Serie := QMCabecera.FieldByName('SERIE').AsString;
              NumeroDocumento := QMCabecera.FieldByName('RIG').AsInteger;
              Fecha := QMCabecera.FieldByName('FECHA').AsDateTime;
              SuReferencia := QMCabecera.FieldByName('SU_REFERENCIA').AsString;
              SuPedido := '';
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := Fichero;
              Matricula := '';
              if (QMCabecera.FieldByName('PROVEEDOR').AsInteger > 0) then
              begin
                 NombreComercial := QMCabecera.FieldByName('NOMBRE_COMERCIAL').AsString;
                 RazonSocial := QMCabecera.FieldByName('TITULO').AsString;
              end
              else
              begin
                 NombreComercial := DameNombreTercerosVarios(QMCabecera.FieldByName('TIPO').AsString, QMCabecera.FieldByName('ID_E').AsInteger);
                 RazonSocial := NombreComercial;
              end;
              OrdenTrabajo := DameOrdenDeTrabajo(QMPedidosPendientesProvID_ORDEN.AsInteger);
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(QMPedidosPendientesProvENTRADA_RECEPCION.AsInteger));
           end;
           DamePartesEmail(Asunto, CuerpoMail);

           DMListados.SendMailTerceroPDF(FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Fichero, Fichero, Asunto, 'PEP', -1, False);
           // SendMailTerceroPDF(Tercero: integer; BodyMail: TStrings; rutafichero, nombrefichero, SubjectMail: string; Tipo: string = ''; ID_A: integer = -1; MuestraCuerpo: boolean = True));
        finally
           CuerpoMail.Free;
           CuerpoMail := nil;
        end;

        Next;
     end;
  end;

  CierraData(DMListados);
end;

procedure TDMPedidosPendientesProv.EnviarPedidos(Serie: string);
var
  Memo : TStrings;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  AbreData(TDMListados, DMListados);

  with xProvConPedidosPend do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT CAB2.EMPRESA, CAB2.TERCERO, CAB2.PROVEEDOR, CAB.ID_E, CAB.SERIE, CAB.EJERCICIO, CAB.RIG, CAB.FECHA ');
     SelectSQL.Add(' FROM GES_DETALLES_E_PED DET ');
     SelectSQL.Add(' JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLES_E) ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON (DET2.EMPRESA = ART.EMPRESA AND DET2.ARTICULO = ART.ARTICULO) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E) ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E) ');
     SelectSQL.Add(' JOIN SYS_TERCEROS TER ON (CAB2.TERCERO = TER.TERCERO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
     SelectSQL.Add(' DET.CANAL = :CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' DET.SERIE = :SERIE AND ');
     SelectSQL.Add(' DET.TIPO = :TIPO AND ');
     SelectSQL.Add(' CAB.ESTADO = 0 AND ');
     SelectSQL.Add(' DET.LINEA_SERVIDA = 0 AND ');
     SelectSQL.Add(' DET.ENTRADA_RECEPCION = :ENTRADA_RECEPCION ');
     SelectSQL.Add(' ORDER BY DET.ID_DETALLES_E ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := 'PEP';
     Params.ByName['ENTRADA_RECEPCION'].AsInteger := REntorno.Entrada;
     Open;

     while not EOF do
     begin
        with QMCabecera do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_PROV ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_E IN ');
           SelectSQL.Add(' ( ');
           SelectSQL.Add(' SELECT distinct CAB.ID_E ');
           SelectSQL.Add(' FROM GES_DETALLES_E_PED DET ');
           SelectSQL.Add(' JOIN GES_DETALLES_E DET2 ON (DET.ID_DETALLES_E = DET2.ID_DETALLES_E) ');
           SelectSQL.Add(' JOIN GES_CABECERAS_E CAB ON (DET.ID_E = CAB.ID_E) ');
           SelectSQL.Add(' JOIN GES_CABECERAS_E_PED CAB2 ON (CAB.ID_E = CAB2.ID_E) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' DET.CANAL = :CANAL AND ');
           if (Serie <> '') then
              SelectSQL.Add(' DET.SERIE = :SERIE AND ');
           SelectSQL.Add(' DET.TIPO = :TIPO AND ');
           SelectSQL.Add(' CAB.ESTADO = 0 AND ');
           SelectSQL.Add(' DET.LINEA_SERVIDA = 0 AND ');
           SelectSQL.Add(' DET.ENTRADA_RECEPCION = :ENTRADA_RECEPCION AND ');
           SelectSQL.Add(' CAB2.PROVEEDOR = :PROVEEDOR) ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           if (Serie <> '') then
              Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'PEP';
           Params.ByName['ENTRADA_RECEPCION'].AsInteger := REntorno.Entrada;
           Params.ByName['PROVEEDOR'].AsInteger := xProvConPedidosPend.FieldByName('PROVEEDOR').AsInteger;
           Open;
        end;

        AbreData(TDMLstPedidos_prov, DMLstPedidos_prov);

        Memo := TStringList.Create;
        try
           DMLstPedidos_prov.MostrarListadoMail(QMCabecera.FieldByName('ID_E').AsInteger, QMCabecera.FieldByName('SERIE').AsString, 2, QMCabecera.FieldByName('EJERCICIO').AsInteger, Memo);

           InicializaVariableEmail('PEP'{FieldByName('TIPO').AsString});
           with VariableEmail do
           begin
              Ejercicio := QMCabecera.FieldByName('EJERCICIO').AsInteger;
              Serie := QMCabecera.FieldByName('SERIE').AsString;
              NumeroDocumento := QMCabecera.FieldByName('RIG').AsInteger;
              Fecha := QMCabecera.FieldByName('FECHA').AsDateTime;
              SuReferencia := QMCabecera.FieldByName('SU_REFERENCIA').AsString;
              SuPedido := '';
              Folio := '';
              TituloDocTributario := '';
              NombreFichero := DMLstPedidos_prov.nombreFich;
              Matricula := '';
              NombreComercial := QMCabecera.FieldByName('NOMBRE_COMERCIAL').AsString;
              RazonSocial := QMCabecera.FieldByName('TITULO').AsString;
              OrdenTrabajo := DameOrdenDeTrabajo(QMCabecera.FieldByName('ID_ORDEN').AsInteger);
              UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));
           end;
           DamePartesEmail(Asunto, CuerpoMail);

           try
              DMListados.SendMailTerceroPDF2(QMCabecera.FieldByName('TERCERO').AsInteger, CuerpoMail, DMLstPedidos_prov.rutaFich,
                 DMLstPedidos_prov.nombreFich, Asunto, 'PEP', QMCabecera.FieldByName('ID_E').AsInteger, True);
           finally
              CuerpoMail.Free;
              CuerpoMail := nil;
           end;
        finally
           Memo.Free;
        end;

        // Marco el documento como listado
        DMLstPedidos_prov.UpdateaDocumentos;

        CierraData(DMLstPedidos_prov);

        Next;
     end;
  end;

  CierraData(DMListados);
end;

procedure TDMPedidosPendientesProv.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xProveedores.Open;
  xDireccionProveedores.Open;
end;

procedure TDMPedidosPendientesProv.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xProveedores.Close;
  xDireccionProveedores.Close;
end;

procedure TDMPedidosPendientesProv.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMPedidosPendientesProv.frxListadoGetValue(const VarName: string; var Value: variant);
begin
  frListadoGetValue(VarName, Value);
end;

procedure TDMPedidosPendientesProv.frListadoBeforePrint(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMPedidosPendientesProv.frxListadoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMPedidosPendientesProv.QMPedidosPendientesProvAfterOpen(DataSet: TDataSet);
begin
  xRelacion.Open;
end;

procedure TDMPedidosPendientesProv.QMPedidosPendientesProvAfterClose(DataSet: TDataSet);
begin
  xRelacion.Close;
end;

procedure TDMPedidosPendientesProv.CalculaPedidosCliente(aCalcular: boolean);
begin
  CalcularPedidosCliente := aCalcular;
  PedCli.Clear;
  QMPedidosPendientesProv.Refresh;
end;

procedure TDMPedidosPendientesProv.StockAlmacen(aAlmacen: string);
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

  QMPedidosPendientesProvSTOCK_ALM.DisplayLabel := Format(_('Stock[%s]'), [TituloColumanAlmacen]);
  QMPedidosPendientesProvSTOCK_MINIMO.DisplayLabel := Format(_('Stock Mín.[%s]'), [TituloColumanAlmacen]);

  // Refresco el detalle
  StockAlm.Clear;
  StockMin.Clear;
  QMPedidosPendientesProv.Refresh;
end;

procedure TDMPedidosPendientesProv.StockAlmacen2(aAlmacen: string);
var
  TituloColumanAlmacen : string;
begin
  Almacen2 := aAlmacen;

  // Cambio el titulo de la columna para informar de que almacen obtengo el stock
  if (Almacen2 = 'NOCALC') then
     TituloColumanAlmacen := 'OFF'
  else
  if (Almacen2 = '') then
     TituloColumanAlmacen := 'ALL'
  else
     TituloColumanAlmacen := Almacen2;

  QMPedidosPendientesProvSTOCK_ALM_2.DisplayLabel := Format(_('Stock[%s]'), [TituloColumanAlmacen]);

  // Refresco el detalle
  StockAlm2.Clear;
  QMPedidosPendientesProv.Refresh;
end;

procedure TDMPedidosPendientesProv.QMPedidosPendientesProvSTOCK_ALMGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((Almacen = 'NOCALC') or (QMPedidosPendientesProvCONTROL_STOCK.AsInteger = 0)) then
     Text := ''
  else
     Text := FormatFloat('0.00', QMPedidosPendientesProvSTOCK_ALM.AsFloat);
end;

procedure TDMPedidosPendientesProv.QMPedidosPendientesProvSTOCK_ALM_2GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((Almacen2 = 'NOCALC') or (QMPedidosPendientesProvCONTROL_STOCK.AsInteger = 0)) then
     Text := ''
  else
     Text := FormatFloat('0.00', QMPedidosPendientesProvSTOCK_ALM_2.AsFloat);
end;

procedure TDMPedidosPendientesProv.QMPedidosPendientesProvCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock, StockMinimo, Pedidos : double;
  Articulo : string;
begin
  // Calculo de las existencias y minimo del articulo. Si se calcula...

  Articulo := QMPedidosPendientesProvARTICULO.AsString;

  Stock := 0;
  StockMinimo := 0;
  if not ((Almacen = 'NOCALC') or (QMPedidosPendientesProvCONTROL_STOCK.AsInteger = 0)) then
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
  QMPedidosPendientesProvSTOCK_ALM.AsFloat := Stock;
  QMPedidosPendientesProvSTOCK_MINIMO.AsFloat := StockMinimo;

  Stock := 0;
  if not ((Almacen2 = 'NOCALC') or (QMPedidosPendientesProvCONTROL_STOCK.AsInteger = 0)) then
  begin
     with StockAlm2 do
     begin
        i := IndexOfName(Articulo);
        if (i < 0) then
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, Almacen2);
           Values[Articulo] := FloatToStr(Stock);
        end
        else
        begin
           Stock := StrToFloat(Values[Articulo]);
        end;
     end;
  end;
  QMPedidosPendientesProvSTOCK_ALM_2.AsFloat := Stock;

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
  QMPedidosPendientesProvPEDIDOS_D_CLI.AsFloat := Pedidos;
end;

procedure TDMPedidosPendientesProv.QMPedidosPendientesProvSTOCK_MINIMOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((Almacen = 'NOCALC') or (QMPedidosPendientesProvCONTROL_STOCK.AsInteger = 0)) then
     Text := ''
  else
     Text := FormatFloat('0.00', QMPedidosPendientesProvSTOCK_MINIMO.AsFloat);
end;

procedure TDMPedidosPendientesProv.BorrarRelacion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM GES_DETALLES_RELACIONES R ');
        SQL.Add(' WHERE ');
        SQL.Add(' R.D_EMPRESA = :EMPRESA AND ');
        SQL.Add(' R.D_EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' R.D_CANAL = :CANAL AND ');
        SQL.Add(' R.D_SERIE = :SERIE AND ');
        SQL.Add(' R.D_TIPO = :TIPO AND ');
        SQL.Add(' R.D_RIG = :RIG AND ');
        SQL.Add(' R.D_LINEA = :LINEA AND ');
        SQL.Add(' R.O_ID_DETALLES_S = :ID_DETALLES_S ');
        Params.ByName['EMPRESA'].AsInteger := QMPedidosPendientesProvEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosPendientesProvEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPedidosPendientesProvCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMPedidosPendientesProvSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMPedidosPendientesProvTIPO.AsString;
        Params.ByName['RIG'].AsInteger := QMPedidosPendientesProvRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMPedidosPendientesProvLINEA.AsInteger;
        Params.ByName['ID_DETALLES_S'].AsInteger := xRelacionID_DETALLES_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xRelacion.Close;
  xRelacion.Open;
end;

end.
