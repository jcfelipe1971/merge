unit UDMOrdenesDePago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UHYTickets, FIBDatabase,
  UFIBModificados, CVBNorma19CSB, Math, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, CVBNorma32CSB, CVBNorma58CSB, Confirming,
  HYFIBQuery, FIBDataSetRO, CVBNorma34CSB, CVBNorma34_1CSB, CVBNorma34_14CSB;

type
  TDMOrdenesDePago = class(TDataModule)
     QMOrdenPago: TFIBTableSet;
     DSQMOrdenPago: TDataSource;
     TLocal: THYTransaction;
     xBancos: TFIBDataSetRO;
     xBancosEMPRESA: TIntegerField;
     xBancosBANCO: TIntegerField;
     xBancosTITULO: TFIBStringField;
     DSxBancos: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xInfoActualizada: TFIBDataSetRO;
     DSxInfoActualizada: TDataSource;
     xInfoActualizadaIMPORTE: TFloatField;
     xBancoOrdPago: TFIBDataSetRO;
     xProveedor: TFIBDataSetRO;
     xProveedorBanco: TFIBDataSetRO;
     xRecibos: TFIBDataSetRO;
     DSxRecibos: TDataSource;
     DSxProveedor: TDataSource;
     xDireccionProveedor: TFIBDataSetRO;
     xLoc_T: TFIBDataSetRO;
     DSxLoc_T: TDataSource;
     DSxDireccionProveedor: TDataSource;
     xTerceros: TFIBDataSetRO;
     xFormaPago: TFIBTableSet;
     xAcreedor: TFIBDataSetRO;
     DSxAcreedor: TDataSource;
     xInfoActualizadaCERRADO: TIntegerField;
     Norma34: TCVBNorma34CSB;
     QMOrdenPagoEMPRESA: TIntegerField;
     QMOrdenPagoEJERCICIO: TIntegerField;
     QMOrdenPagoCANAL: TIntegerField;
     QMOrdenPagoSIGNO: TFIBStringField;
     QMOrdenPagoNUM_ORDEN: TIntegerField;
     QMOrdenPagoFECHA: TDateTimeField;
     QMOrdenPagoFECHA_VTO: TDateTimeField;
     QMOrdenPagoIMPORTE: TFloatField;
     QMOrdenPagoBANCO: TIntegerField;
     QMOrdenPagoTITULO: TFIBStringField;
     QMOrdenPagoCERRADO: TIntegerField;
     QMOrdenPagoRIC: TIntegerField;
     QMOrdenPagoASIENTO: TIntegerField;
     QMOrdenPagoLINEAS: TIntegerField;
     QMOrdenPagoCOD_NORMA34: TIntegerField;
     QMOrdenPagoGASTOS: TIntegerField;
     QMOrdenPagoDETALLE_CARGOS: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSIGNO: TFIBStringField;
     QMDetalleREGISTRO: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCOD_CLI_PRO: TIntegerField;
     QMDetalleVENCIMIENTO: TDateTimeField;
     QMDetalleCTA_PAGO: TFIBStringField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetallePAGADO: TIntegerField;
     QMDetalleIMPAGADO: TIntegerField;
     QMDetalleFORMA_PAGO: TFIBStringField;
     QMDetalleTIPO_EFECTO: TFIBStringField;
     QMDetalleREMESAR: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleREMESA: TIntegerField;
     QMDetalleDOC_NUMERO: TIntegerField;
     QMDetalleDOC_SERIE: TFIBStringField;
     QMDetalleDOC_FECHA: TDateTimeField;
     QMDetalleDOC_TIPO: TFIBStringField;
     QMDetalleRIC: TIntegerField;
     QMDetalleRIVA: TIntegerField;
     QMDetalleFECHA_CIERRE: TDateTimeField;
     QMDetalleESTADO_RECIBO: TFIBStringField;
     QMDetalleRECIBIDO: TIntegerField;
     QMDetalleORD_PAGO: TIntegerField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleLIQUIDO_CANAL: TFloatField;
     QMDetalleMONEDA_CANAL: TFIBStringField;
     QMDetalleEJERCICIO_ORD_PAGO: TIntegerField;
     QMDetalleID_CARTERA: TIntegerField;
     QMDetalleID_CARTERA_DETALLE: TIntegerField;
     QMDetalleID_DOC: TIntegerField;
     xRecibosEMPRESA: TIntegerField;
     xRecibosEJERCICIO: TIntegerField;
     xRecibosCANAL: TIntegerField;
     xRecibosSIGNO: TFIBStringField;
     xRecibosREGISTRO: TIntegerField;
     xRecibosLINEA: TIntegerField;
     xRecibosCOD_CLI_PRO: TIntegerField;
     xRecibosVENCIMIENTO: TDateTimeField;
     xRecibosCTA_PAGO: TFIBStringField;
     xRecibosLIQUIDO: TFloatField;
     xRecibosPAGADO: TIntegerField;
     xRecibosIMPAGADO: TIntegerField;
     xRecibosFORMA_PAGO: TFIBStringField;
     xRecibosTIPO_EFECTO: TFIBStringField;
     xRecibosREMESAR: TIntegerField;
     xRecibosESTADO: TIntegerField;
     xRecibosREMESA: TIntegerField;
     xRecibosDOC_NUMERO: TIntegerField;
     xRecibosDOC_SERIE: TFIBStringField;
     xRecibosDOC_FECHA: TDateTimeField;
     xRecibosDOC_TIPO: TFIBStringField;
     xRecibosRIC: TIntegerField;
     xRecibosRIVA: TIntegerField;
     xRecibosFECHA_CIERRE: TDateTimeField;
     xRecibosESTADO_RECIBO: TFIBStringField;
     xRecibosRECIBIDO: TIntegerField;
     xRecibosORD_PAGO: TIntegerField;
     xRecibosMONEDA: TFIBStringField;
     xRecibosLIQUIDO_CANAL: TFloatField;
     xRecibosMONEDA_CANAL: TFIBStringField;
     xRecibosEJERCICIO_ORD_PAGO: TIntegerField;
     xRecibosID_CARTERA: TIntegerField;
     xRecibosID_CARTERA_DETALLE: TIntegerField;
     xRecibosID_DOC: TIntegerField;
     QMDetalleORDENAR_PAGO: TIntegerField;
     xRecibosORDENAR_PAGO: TIntegerField;
     QMOrdenPagoNORMA_CREADA: TIntegerField;
     QMDetalleSOCIEDAD: TFIBStringField;
     QMDetalleCONFIRMING: TIntegerField;
     TUpdate: THYTransaction;
     Norma34_1: TCVBNorma34_1CSB;
     QMDetalleSALDO_DEUDOR: TFloatField;
     QMDetalleSALDO_ACREEDOR: TFloatField;
     QMDetalleSALDO: TFloatField;
     Norma34_14: TCVBNorma34_14CSB;
     QMDetalleTITULO: TFIBStringField;
     xInfoActualizadaCOD_NORMA34: TIntegerField;
     xInfoActualizadaRIC: TIntegerField;
     xInfoActualizadaASIENTO: TIntegerField;
     xRecibosNUM_FACTURA: TFIBStringField;
     QMDetalleNUM_FACTURA: TFIBStringField;
     QMDetallePAGO_AUTORIZADO: TIntegerField;
     procedure DMOrdenesDePagoCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure DMOrdenesDePagoDestroy(Sender: TObject);
     procedure QMOrdenPagoAfterOpen(DataSet: TDataSet);
     procedure QMOrdenPagoBeforePost(DataSet: TDataSet);
     procedure QMOrdenPagoNewRecord(DataSet: TDataSet);
     procedure QMOrdenPagoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMOrdenPagoAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure xRecibosAfterScroll(DataSet: TDataSet);
     procedure QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMOrdenPagoASIENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOrdenPagoAfterPost(DataSet: TDataSet);
     procedure xRecibosBeforeOpen(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMOrdenPagoBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FCalcularSaldo: boolean;
     function DameDireccion: string;
     function QuitaPaisDeNIF(NIF: string): string;
     procedure SetCalcularSaldo(const Value: boolean);
  public
     { Public declarations }
     procedure filtra;
     procedure MostrarRecibosDisponibles(Filtro, EmpresaIndemnizacion: char);
     procedure SeleccionaTodos;
     procedure CierraOrdPago;
     procedure AbreOrdPago;
     procedure FiltraDetalle;
     procedure FormatoConfirming(tipo: integer; codcedente: string);
     procedure ImprimirNorma34;
     procedure ImprimirNorma34_1(AFormato: integer; ASufijo: string);
     procedure ImprimirNorma34_14(AFormato: integer; ASufijo: string);
     procedure ImprimirSEPA(AFormato: integer; ASufijo: string);
     procedure BusquedaCompleja;
     procedure DatosRegistro;
     procedure MarcaNormaCerrada;
     property CalcularSaldo: boolean Read FCalcularSaldo Write SetCalcularSaldo;
  end;

var
  DMOrdenesDePago : TDMOrdenesDePago;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, uFBusca, UFormGest, UFMOrdenesDePago, SEPA;

{$R *.DFM}

procedure TDMOrdenesDePago.DMOrdenesDePagoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  FCalcularSaldo := False;

  xInfoActualizadaIMPORTE.DisplayFormat := MascaraN;
  QMOrdenPagoIMPORTE.DisplayFormat := MascaraN;
  QMDetalleLIQUIDO.DisplayFormat := MascaraN;
  QMDetalleSALDO_DEUDOR.DisplayFormat := MascaraN;
  QMDetalleSALDO_ACREEDOR.DisplayFormat := MascaraN;
  QMDetalleSALDO.DisplayFormat := MascaraN;
  QMDetalleVENCIMIENTO.DisplayFormat := ShortDateFormat;

  xProveedor.Open;
  xAcreedor.Open;
  xLoc_T.Open;
end;

procedure TDMOrdenesDePago.DMOrdenesDePagoDestroy(Sender: TObject);
begin
  if TLocal.InTransaction then
     TLocal.Commit; // Para saltarnos el onchange del banco en el formulario
end;

procedure TDMOrdenesDePago.Filtra;
begin
  DMMain.FiltraTabla(QMOrdenPago, '11100', True);
end;

procedure TDMOrdenesDePago.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMOrdenesDePago.QMOrdenPagoAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMDetalle.Open;
end;

procedure TDMOrdenesDePago.QMOrdenPagoBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and
     ((QMOrdenPagoNUM_ORDEN.AsInteger = 0) or (QMOrdenPagoNUM_ORDEN.IsNull))) then
  begin
     {*********}
     {*********}
     {*********}
     {*********}
     { TODO : Asignar un contador propio. El que utiliza es de confirming }
     QMOrdenPagoNUM_ORDEN.AsInteger := DMMain.Contador_EEC('CON');
     {*********}
     {*********}
     {*********}
     {*********}

     if (Trim(QMOrdenPagoTITULO.AsString) = '') then
        QMOrdenPagoTITULO.AsString := format(_('ORDEN_PAGO-%d-%.3d'), [QMOrdenPagoEJERCICIO.AsInteger, QMOrdenPagoNUM_ORDEN.AsInteger]);
  end;
end;

procedure TDMOrdenesDePago.QMOrdenPagoNewRecord(DataSet: TDataSet);
begin
  QMOrdenPagoEMPRESA.AsInteger := REntorno.Empresa;
  QMOrdenPagoEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMOrdenPagoCANAL.AsInteger := REntorno.Canal;
  QMOrdenPagoSIGNO.AsString := 'P';
  QMOrdenPagoFECHA.AsDateTime := REntorno.FechaTrab;
  QMOrdenPagoBANCO.AsInteger := DameBancoDefecto;
  QMOrdenPagoCERRADO.AsInteger := 0;
  QMOrdenPagoGASTOS.AsInteger := 1;
  QMOrdenPagoDETALLE_CARGOS.AsInteger := 1;
  QMOrdenPagoCOD_NORMA34.AsInteger := 0;

  //Se informa al grid del detalle del formulario
  if QMOrdenPago.State <> dsInsert then
     FMOrdenesDePago.AjustaCheckOrdPago(QMOrdenPagoNUM_ORDEN.AsInteger)
  else
     QMDetalle.Close;
end;

procedure TDMOrdenesDePago.QMOrdenPagoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMOrdenPago.State = dsInsert then
     QMOrdenPagoNUM_ORDEN.Clear;
end;

procedure TDMOrdenesDePago.QMOrdenPagoAfterScroll(DataSet: TDataSet);
begin
  if QMOrdenPago.State <> dsInsert then
  begin
     FMOrdenesDePago.AjustaCheckOrdPago(QMOrdenPagoNUM_ORDEN.AsInteger);
     with QMDetalle do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_ORD_PAGO ');
        SelectSQL.Add(' WHERE');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO_ORD_PAGO = ?EJERCICIO AND ');
        SelectSQL.Add(' CANAL = ?CANAL AND ');
        SelectSQL.Add(' SIGNO = ''P'' AND ');
        SelectSQL.Add(' ORD_PAGO = ?NUM_ORDEN ');
        SelectSQL.Add(' ORDER BY VENCIMIENTO ');
        Open;
     end;
  end;
end;

procedure TDMOrdenesDePago.MostrarRecibosDisponibles(Filtro, EmpresaIndemnizacion: char);
var
  orden : string;
begin
  QMOrdenPagoAfterScroll(QMOrdenPago);
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        orden := OrdenadoPor;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_ORD_PAGO ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ((EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO <= :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' PAGO_AUTORIZADO = 1 AND ');
        SelectSQL.Add(' ORD_PAGO = 0 AND ');
        SelectSQL.Add(' ORDENAR_PAGO = 1 AND ');
        SelectSQL.Add(' PAGADO = 0 AND ');
        SelectSQL.Add(' CONFIRMING = 0) ');
        SelectSQL.Add(' OR ');
        SelectSQL.Add(' (EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO_ORD_PAGO = :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' ORD_PAGO = :ORD_PAGO)) ');

        case Filtro of
           'A': SelectSQL.Add(' AND ((DOC_TIPO = ''FCR'') OR (DOC_TIPO = ''NRA'')) AND (COD_CLI_PRO > -2) ');
           'P': SelectSQL.Add(' AND ((DOC_TIPO = ''FAP'') OR (DOC_TIPO = ''NRP'')) AND (COD_CLI_PRO > -2) ');
           'I': SelectSQL.Add(' AND ((DOC_TIPO = ''NRP'') OR (DOC_TIPO = ''NRA'')) AND (COD_CLI_PRO = -2) AND (SOCIEDAD = ''' + EmpresaIndemnizacion + ''') ');
        end;
        Params.ByName['ORD_PAGO'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Ordenar(orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMOrdenesDePago.QMDetalleAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMOrdenesDePago.SeleccionaTodos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CARTERA_ORD_PAGO ');
        SQL.Add(' SET ');
        SQL.Add(' ORD_PAGO = ' + QMOrdenPagoNUM_ORDEN.AsString + ', ');
        SQL.Add(' EJERCICIO_ORD_PAGO = ' + REntorno.EjercicioStr);
        SQL.Add(' WHERE ');
        QMDetalle.DameFiltroSelect(SQL);
        if Params.ByName['EMPRESA'] <> nil then
        begin
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        end;
        Params.ByName['ORD_PAGO'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Close;
  QMDetalle.Open;
  xInfoactuAlizada.Close;
  xInfoactuAlizada.Open;
end;

procedure TDMOrdenesDePago.CierraOrdPago;
var
  Q : THYFIBQuery;
  Cod_Norma34 : integer;
begin
  if (QMOrdenPagoCOD_NORMA34.AsInteger = 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(COD_NORMA34) FROM EMP_CARTERA_ORD_PAGO WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SIGNO=''P''';
        Params.ByName['EMPRESA'].AsInteger := QMOrdenPagoEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMOrdenPagoCANAL.AsInteger;
        ExecQuery;
        Cod_Norma34 := FieldByName['MAX'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);

     Inc(Cod_Norma34);
     if (Cod_Norma34 > 999) then
        Cod_Norma34 := 1;

     if (QMOrdenPagoCERRADO.AsInteger = 1) then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE CON_CUENTAS_APUNTES SET DOC_NUMERO=?DOC_NUMERO WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND RIC=?RIC';
           Params.ByName['EMPRESA'].AsInteger := QMOrdenPagoEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMOrdenPagoCANAL.AsInteger;
           Params.ByName['RIC'].AsInteger := QMOrdenPagoRIC.AsInteger;
           Params.ByName['DOC_NUMERO'].AsInteger := Cod_Norma34;
           ExecQuery;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;

     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_CARTERA_ORD_PAGO SET COD_NORMA34=?COD_NORMA34 WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SIGNO=''P'' AND NUM_ORDEN=?NUM_ORDEN';
        Params.ByName['EMPRESA'].AsInteger := QMOrdenPagoEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMOrdenPagoCANAL.AsInteger;
        Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Params.ByName['COD_NORMA34'].AsInteger := Cod_Norma34;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);
     QMOrdenPago.Refresh;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_CIERRA_ORD_PAGO(?EMPRESA, ?EJERCICIO, ?CANAL, ?ORD_PAGO, ?FECHA, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ORD_PAGO'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Close;
  xInfoActualizada.Open;
  QMOrdenPago.Refresh;
end;

procedure TDMOrdenesDePago.AbreOrdPago;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_ABRE_ORD_PAGO(?EMPRESA, ?EJERCICIO, ?CANAL, ?ORD_PAGO, ?FECHA, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ORD_PAGO'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xInfoActualizada.Close;
  xInfoActualizada.Open;
  QMOrdenPago.Refresh;
end;

procedure TDMOrdenesDePago.FormatoConfirming(tipo: integer; codcedente: string);
begin
end;

procedure TDMOrdenesDePago.FiltraDetalle;
var
  orden : string;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        orden := OrdenadoPor;
        Ordenar('');
        TFBusca.Create(Self).SeleccionaBusqueda(QMDetalle, '11100', False);
        if Active then
           Close;
        SelectSQL.Add(' AND ((ORD_PAGO=0 AND PAGO_AUTORIZADO = 1) OR (EJERCICIO_ORD_PAGO = ?EJERCICIO AND ORD_PAGO=?NUM_ORDEN))');
        SelectSQL.Add(' AND (PAGADO=0) ');
        SelectSQL.Add(' AND (ORDENAR_PAGO = 1) ');
        SelectSQL.Add(' AND (PAGADO = 0) ');

        Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEJERCICIO.AsInteger;
        Ordenar(orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMOrdenesDePago.xRecibosBeforeOpen(DataSet: TDataSet);
begin
  xProveedor.DataSource := DSxRecibos;
  xAcreedor.DataSource := DSxRecibos;
end;

procedure TDMOrdenesDePago.xRecibosAfterScroll(DataSet: TDataSet);
begin
  if DataSet.RecordCount > 0 then
  begin
     if ((DataSet.FieldByName('DOC_TIPO').AsString = 'FAP') or (DataSet.FieldByName('DOC_TIPO').AsString = 'AGP') or
        (DataSet.FieldByName('DOC_TIPO').AsString = 'NRP')) then
     begin
        xProveedor.Open;
        xDireccionProveedor.Close;
        xDireccionProveedor.DataSource := DSxProveedor;
        xDireccionProveedor.Open;
        xProveedorBanco.Close;
        xProveedorBanco.DataSource := DSxProveedor;
        xProveedorBanco.Open;
        xTerceros.Close;
        xTerceros.DataSource := DSxProveedor;
        xTerceros.Open;
     end;
     if ((DataSet.FieldByName('DOC_TIPO').AsString = 'FCR') or (DataSet.FieldByName('DOC_TIPO').AsString = 'AGA') or
        (DataSet.FieldByName('DOC_TIPO').AsString = 'NRA')) then
     begin
        xAcreedor.Open;
        xDireccionProveedor.Close;
        xDireccionProveedor.DataSource := DSxAcreedor;
        xDireccionProveedor.Open;
        xProveedorBanco.Close;
        xProveedorBanco.DataSource := DSxAcreedor;
        xProveedorBanco.Open;
        xTerceros.Close;
        xTerceros.DataSource := DSxAcreedor;
        xTerceros.Open;
     end;
     xLoc_t.Close;
     xLoc_t.Open;
     xFormaPago.Close;
     xFormaPago.Open;
  end;
end;

function TDMOrdenesDePago.DameDireccion: string;
begin
  Result := xDireccionProveedor.FieldByName('DIR_NOMBRE').AsString;
  if xDireccionProveedor.FieldByName('DIR_NUMERO').AsString <> '' then
     Result := Result + ', ' + xDireccionProveedor.FieldByName('DIR_NUMERO').AsString;
  if xDireccionProveedor.FieldByName('DIR_BLOQUE_ESCALERA').AsString <> '' then
     Result := Result + ' ' + xDireccionProveedor.FieldByName('DIR_BLOQUE_ESCALERA').AsString;
  if xDireccionProveedor.FieldByName('DIR_PISO').AsString <> '' then
     Result := Result + ' ' + xDireccionProveedor.FieldByName('DIR_PISO').AsString;
  if xDireccionProveedor.FieldByName('DIR_PUERTA').AsString <> '' then
     Result := Result + ' ' + xDireccionProveedor.FieldByName('DIR_PUERTA').AsString;
end;

procedure TDMOrdenesDePago.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMOrdenPago, '11100');
end;

procedure TDMOrdenesDePago.QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDetalleMONEDA.AsString, 1),
     QMDetalleLIQUIDO.AsFloat);
end;

procedure TDMOrdenesDePago.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if QMDetalleORD_PAGO.AsInteger = QMOrdenPagoNUM_ORDEN.AsInteger then
     QMDetalleEJERCICIO_ORD_PAGO.AsInteger := QMOrdenPagoEJERCICIO.AsInteger
  else
     QMDetalleEJERCICIO_ORD_PAGO.AsInteger := 0;
end;

procedure TDMOrdenesDePago.ImprimirNorma34;
var
  Q : THYFIBQuery;
  Cod_Norma34 : integer;
  Archivo : string;
begin
  if (REntorno.Moneda = 'PTS') then
     Norma34.Euros := False
  else if (REntorno.Moneda = 'EUR') then
     Norma34.Euros := True
  else
     raise Exception.Create(_('La Norma 34 no está definida para esta moneda'));

  Archivo := Format('OrdenPago-%d-%.3d.txt', [QMOrdenPagoEJERCICIO.AsInteger, QMOrdenPagoNUM_ORDEN.AsInteger]);
  if MySaveDialog(Archivo, 'TXT', '', 'DMOrdenesDePago') then
  begin
     if (QMOrdenPagoCOD_NORMA34.AsInteger = 0) then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(COD_NORMA34) FROM EMP_CARTERA_ORD_PAGO WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SIGNO=''P''';
           Params.ByName['EMPRESA'].AsInteger := QMOrdenPagoEmpresa.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEjercicio.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMOrdenPagoCanal.AsInteger;
           ExecQuery;
           Cod_Norma34 := FieldByName['MAX'].AsInteger;
           FreeHandle;
        end;
        FreeAndNil(Q);

        Inc(Cod_Norma34);
        if (Cod_Norma34 > 999) then
           Cod_Norma34 := 1;

        if (QMOrdenPagoCERRADO.AsInteger = 1) then
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE CON_CUENTAS_APUNTES SET DOC_NUMERO=?DOC_NUMERO WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND RIC=?RIC';
              Params.ByName['EMPRESA'].AsInteger := QMOrdenPagoEmpresa.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEjercicio.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMOrdenPagoCanal.AsInteger;
              Params.ByName['RIC'].AsInteger := QMOrdenPagoRIC.AsInteger;
              Params.ByName['DOC_NUMERO'].AsInteger := Cod_Norma34;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;

        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE EMP_CARTERA_ORD_PAGO SET COD_NORMA34=?COD_NORMA34 WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SIGNO=''P'' AND NUM_ORDEN=?NUM_ORDEN';
           Params.ByName['EMPRESA'].AsInteger := QMOrdenPagoEmpresa.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEjercicio.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMOrdenPagoCanal.AsInteger;
           Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
           Params.ByName['COD_NORMA34'].AsInteger := Cod_Norma34;
           ExecQuery;
           FreeHandle;
        end;
        FreeAndNil(Q);
        QMOrdenPago.Refresh;
     end;

     Norma34.NomFichero := Archivo;

     Norma34.Modalidad := CVBNorma34CSB.moTransfer; {puede ser tambien moCheques}
     {Depura := True o False}

     Norma34.Abrir;

     {Norma34.IniRegistro;}

     Norma34.CodNorma43 := '000' + IntToStr(QMOrdenPagoCOD_NORMA34.AsInteger);
     Norma34.CodNorma43 := Copy(Norma34.CodNorma43, Length(Norma34.CodNorma43) - 2, 3);
     Norma34.CodNorma43 := FormatDateTime('yyyymmdd', QMOrdenPagoFECHA.AsDateTime) + '-' + Norma34.CodNorma43;

     with xBancoOrdPago do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMOrdenPagoBANCO.AsInteger;
        Open;
     end;
     Norma34.Ordenante := REntorno.CifEmpresa; {10}

     Norma34.EntOrd := xBancoOrdPago.FieldByName('ENTIDAD').AsString; {4}
     Norma34.SucOrd := xBancoOrdPago.FieldByName('SUCURSAL').AsString; {4}
     Norma34.CtaOrd := xBancoOrdPago.FieldByName('CUENTA_CORRIENTE').AsString; {10}
     if (QMOrdenPagoDETALLE_CARGOS.AsString = '1') then {1 - ' ', 0 o 1}
        Norma34.DetallCgo := '1'
     else
        Norma34.DetallCgo := '0';
     Norma34.FecEnvSoporte := Now;
     Norma34.FecEmiOrdenes := QMOrdenPagoFECHA.AsDateTime;
     Norma34.cccOrd := xBancoOrdPago.FieldByName('CONTROL').AsString; {2 - Creo que es el dígito de control}
     Norma34.NomOrd := REntorno.NombreEmpresa; {36}
     Norma34.DomOrd := REntorno.DirEmpresa; {36}
     Norma34.PlzOrd := REntorno.PobEmpresa; {36}
     // Opcionales
     Norma34.Nom2Ord := ''; {36}
     Norma34.Dom2Ord := ''; {36}
     Norma34.CompCabecera;

     // Introducimos datos de los recibos

     with xRecibos do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Open;
        First;
     end;

     while (not xRecibos.EOF) do
     begin
        if (QMOrdenPagoGASTOS.AsInteger = 1) then {1 - 1 Ordenante o 2 Beneficiario}
           Norma34.Gastos := '1'
        else
           Norma34.Gastos := '2';
        Norma34.Concepto := '9'; {1 - 1 Nomina, 8 Pension o 9 Otros Conceptos}

        if ((xRecibosCOD_CLI_PRO.AsInteger = -2) and (xRecibosDOC_TIPO.AsString = 'NRP')) then
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT NIF,NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,NUMERO_CUENTA,DIGITO_CONTROL, ' +
                 'IMPORTE,TEXTO,CREGION FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
              Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
              ExecQuery;

              Norma34.DNIBen := FieldByName['NIF'].AsString; {18}
              Norma34.NomBen := FieldByName['NOMBRE'].AsString; {36}
              Norma34.NIdBen := ''; {18}
              Norma34.Referencia := FieldByName['NIF'].AsString; {12 - Debe ser el nif}

              Norma34.DomBen1 := '.'; {36}
              Norma34.DomBen2 := ''; {36}
              Norma34.CPTLPlzBen := FieldByName['CREGION'].AsString + '000'; {36}
              Norma34.ProvBen := '.'; {36}
              Norma34.EntBen := FieldByName['CLAVE_BANCO'].AsString; {4}
              Norma34.SucBen := FieldByName['NUMERO_SUCURSAL'].AsString; {4}
              Norma34.CtaBen := FieldByName['NUMERO_CUENTA'].AsString; {10}
              Norma34.cccBen := FieldByName['DIGITO_CONTROL'].AsString; {2 - Creo que es el dígito de control}

              Norma34.ImportePts := 0;
              Norma34.ImporteEu := xRecibosLIQUIDO.AsCurrency;

              Norma34.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
              Norma34.ConcepBen2 := '.'; {36}

              FreeHandle;
           end;
           FreeAndNil(Q);
        end
        else
        begin
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP')) then
           begin
              Norma34.DNIBen := xProveedor.FieldByName('NIF').AsString; {18}
              Norma34.NomBen := xProveedor.FieldByName('TITULO').AsString; {36}
              Norma34.NIdBen := ''; {18}
              Norma34.Referencia := xProveedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA')) then
           begin
              Norma34.DNIBen := xAcreedor.FieldByName('NIF').AsString; {18}
              Norma34.NomBen := xAcreedor.FieldByName('TITULO').AsString; {36}
              Norma34.NIdBen := ''; {18}
              Norma34.Referencia := xAcreedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           Norma34.DomBen1 := DameDireccion; {36}
           Norma34.DomBen2 := ''; {36}
           Norma34.CPTLPlzBen := xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString; {36}
           Norma34.ProvBen := xLoc_T.FieldByName('PROVINCIA').AsString; {36}
           Norma34.EntBen := xProveedorBanco.FieldByName('ENTIDAD').AsString; {4}
           Norma34.SucBen := xProveedorBanco.FieldByName('SUCURSAL').AsString; {4}
           Norma34.CtaBen := xProveedorBanco.FieldByName('CUENTA').AsString; {10}
           Norma34.cccBen := xProveedorBanco.FieldByName('CONTROL').AsString; {2 - Creo que es el dígito de control}

           Norma34.ImportePts := 0;
           Norma34.ImporteEu := xRecibosLIQUIDO.AsCurrency;

           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'FAP')) then
              Norma34.ConcepBen1 := _('Factura') + ' ' + xRecibosDOC_NUMERO.AsString; {36}
           if ((xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'NRP') or
              (xRecibosDOC_TIPO.AsString = 'AGA') or (xRecibosDOC_TIPO.AsString = 'AGP')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA=?ID_CARTERA';
                    Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                    ExecQuery;
                    Norma34.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
           Norma34.ConcepBen2 := _('Venc.') + ' ' + xRecibosVENCIMIENTO.AsString; {36}
        end;
        Norma34.CompRegistro;
        xRecibos.Next;
     end; {CodCliPro=-2 and DocTipo=NRP}

     Norma34.Cerrar;
     ShowMessage(_('Se ha creado la norma 34'));

     MarcaNormaCerrada;
     QMOrdenPago.Refresh;
  end;
end;

procedure TDMOrdenesDePago.ImprimirNorma34_1(AFormato: integer; ASufijo: string);
var
  Q : THYFIBQuery;
  Procesados : integer;
  Archivo : string;
begin
  {Aformato se utilizara si hay bancos que pida diferencias con este formato}

  if (REntorno.Moneda <> 'EUR') then
     raise Exception.Create(_('La Norma 34 no está definida para esta moneda'));

  Archivo := Format('OrdenPago-%d-%.3d.txt', [QMOrdenPagoEJERCICIO.AsInteger, QMOrdenPagoNUM_ORDEN.AsInteger]);
  if MySaveDialog(Archivo, 'TXT', '', 'DMOrdenesDePago') then
  begin
     with xBancoOrdPago do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMOrdenPagoBANCO.AsInteger;
        Open;
     end;

     Norma34_1.NomFichero := Archivo;
     Norma34_1.Modalidad := CVBNorma34_1CSB.moTransfer; {puede ser tambien moCheques}
     Norma34_1.Depura := False; {Si es true no genera exception y genera los registros que puede}
     Norma34_1.Formato := AFormato;

     Norma34_1.Abrir;

     {Cabecera de ordenante}
     {Registro primero}
     Norma34_1.Ordenante := Copy(REntorno.CifEmpresa, 3, 9); {9}
     Norma34_1.Sufijo := ASufijo;
     Norma34_1.FecEnvSoporte := Now;
     Norma34_1.FecEmiOrdenes := QMOrdenPagoFECHA.AsDateTime;
     Norma34_1.EntOrd := xBancoOrdPago.FieldByName('ENTIDAD').AsString; {4}
     Norma34_1.SucOrd := xBancoOrdPago.FieldByName('SUCURSAL').AsString; {4}
     Norma34_1.cccOrd := xBancoOrdPago.FieldByName('CONTROL').AsString; {2 - Creo que es el dígito de control}
     Norma34_1.CtaOrd := xBancoOrdPago.FieldByName('CUENTA_CORRIENTE').AsString; {10}
     if (QMOrdenPagoDETALLE_CARGOS.AsString = '1') then {1 - ' ', 0 o 1}
        Norma34_1.DetallCgo := '1'
     else
        Norma34_1.DetallCgo := '0';

     {Registro segundo}
     Norma34_1.NomOrd := REntorno.NombreEmpresa; {36}
     {Registro tercero}
     Norma34_1.DomOrd := REntorno.DirEmpresa; {36}
     {Registro cuarto}
     Norma34_1.PlzOrd := REntorno.PobEmpresa; {36}
     {Registro quinto - Opcional}
     Norma34_1.Nom2Ord := ''; {36}
     {Registro sexto - Opcional}
     Norma34_1.Dom2Ord := ''; {36}

     Norma34_1.CompCabecera;

     { Introducimos datos de los recibos nacionales }

     Procesados := 0; {cuento los procesados para saber si tengo que hacer un registro de totales o no}
     with xRecibos do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Open;
        First;

        {Avanzo hasta encontrar un recibo a un español o un NO residente y que el importe sea menor a 12.500,00 Euros}
        while ((not xRecibos.EOF) and
              (((xLoc_T.FieldByName('PAIS_C2').AsString <> 'ES') and (True = True  {ProAcr_EsResidente=True})) or
              ((xLoc_T.FieldByName('PAIS_C2').AsString <> 'ES') and (True = False {ProAcr_EsResidente=False}) and (xRecibosLIQUIDO.AsFloat >= 12500)))) do
           Next;
     end;

     if (not xRecibos.EOF) then
        Norma34_1.CompCabeceraNacional;

     while (not xRecibos.EOF) do
     begin
        if (QMOrdenPagoGASTOS.AsInteger = 0) then {1 - 1 Ordenante o 2 Beneficiario}
           Norma34_1.Gastos := '1'
        else
           Norma34_1.Gastos := '2';
        Norma34_1.Concepto := '9'; {1 - 1 Nomina, 8 Pension o 9 Otros Conceptos}
        Norma34_1.InstruccionOrden := '1'; {1 - Instruccion de orden de abono directo por cuenta, 1 si, 2 no}

        if ((xRecibosCOD_CLI_PRO.AsInteger = -2) and (xRecibosDOC_TIPO.AsString = 'NRP')) then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NIF,NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,NUMERO_CUENTA,DIGITO_CONTROL, ' +
                    'IMPORTE,TEXTO,CREGION FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
                 Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                 ExecQuery;

                 Norma34_1.DNIBen := QuitaPaisDeNIF(FieldByName['NIF'].AsString); {9}
                 Norma34_1.NomBen := FieldByName['NOMBRE'].AsString; {36}
                 Norma34_1.NIdBen := ''; {18}
                 Norma34_1.Referencia := QuitaPaisDeNIF(FieldByName['NIF'].AsString); {12 - Debe ser el nif(9)+Sufijo(3)}

                 Norma34_1.DomBen1 := '.'; {36}
                 Norma34_1.DomBen2 := ''; {36}
                 Norma34_1.CPTLPlzBen := FieldByName['CREGION'].AsString + '000'; {36}
                 Norma34_1.ProvBen := '.'; {36}
                 Norma34_1.EntBen := FieldByName['CLAVE_BANCO'].AsString; {4}
                 Norma34_1.SucBen := FieldByName['NUMERO_SUCURSAL'].AsString; {4}
                 Norma34_1.cccBen := FieldByName['DIGITO_CONTROL'].AsString; {2 - Dígito de control}
                 Norma34_1.CtaBen := FieldByName['NUMERO_CUENTA'].AsString; {10}

                 Norma34_1.Importe := xRecibosLIQUIDO.AsCurrency;

                 Norma34_1.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
                 Norma34_1.ConcepBen2 := '.'; {36}

                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
        end
        else
        begin
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP')) then
           begin
              Norma34_1.DNIBen := QuitaPaisDeNIF(xProveedor.FieldByName('NIF').AsString); {9}
              Norma34_1.NomBen := xProveedor.FieldByName('TITULO').AsString; {36}
              Norma34_1.NIdBen := ''; {18}
              Norma34_1.Referencia := xProveedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA')) then
           begin
              Norma34_1.DNIBen := QuitaPaisDeNIF(xAcreedor.FieldByName('NIF').AsString); {9}
              Norma34_1.NomBen := xAcreedor.FieldByName('TITULO').AsString; {36}
              Norma34_1.NIdBen := ''; {18}
              Norma34_1.Referencia := xAcreedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           Norma34_1.DomBen1 := DameDireccion; {36}
           Norma34_1.DomBen2 := ''; {36}
           Norma34_1.CPTLPlzBen := xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString; {36}
           Norma34_1.ProvBen := xLoc_T.FieldByName('PROVINCIA').AsString; {36}
           Norma34_1.EntBen := xProveedorBanco.FieldByName('ENTIDAD').AsString; {4}
           Norma34_1.SucBen := xProveedorBanco.FieldByName('SUCURSAL').AsString; {4}
           Norma34_1.cccBen := xProveedorBanco.FieldByName('CONTROL').AsString; {2 - Dígito de control}
           Norma34_1.CtaBen := xProveedorBanco.FieldByName('CUENTA').AsString; {10}

           Norma34_1.Importe := xRecibosLIQUIDO.AsCurrency;

           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'FAP')) then
              Norma34_1.ConcepBen1 := _('Factura') + ' ' + xRecibosDOC_SERIE.AsString + '/' + xRecibosDOC_NUMERO.AsString; {36}
           if ((xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'NRP') or
              (xRecibosDOC_TIPO.AsString = 'AGA') or (xRecibosDOC_TIPO.AsString = 'AGP')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA=?ID_CARTERA';
                    Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                    ExecQuery;
                    Norma34_1.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
           Norma34_1.ConcepBen2 := _('Venc.') + ' ' + xRecibosVENCIMIENTO.AsString; {36}
        end;
        Norma34_1.CompRegistroNacional;
        Inc(Procesados);

        xRecibos.Next;
        {Avanzo hasta encontrar un recibo a un español o un NO residente y que el importe sea menor a 12.500,00 Euros}
        while ((not xRecibos.EOF) and
              (((xLoc_T.FieldByName('PAIS_C2').AsString <> 'ES') and (True = True  {ProAcr_EsResidente=True})) or
              ((xLoc_T.FieldByName('PAIS_C2').AsString <> 'ES') and (True = False {ProAcr_EsResidente=False}) and (xRecibosLIQUIDO.AsFloat >= 12500)))) do
           xRecibos.Next;
     end; {while not eof}

     if (Procesados > 0) then
        Norma34_1.CerrarNacional;

     { Introducimos datos de los recibos Transfronterizos }

     Norma34_1.Concepto := '7'; {1 - 2 Nomina Exterior, 6 Pension Exterior o 7 Otros Conceptos Exterior}

     Procesados := 0; {cuento los procesados para saber si tengo que hacer un registro de totales o no}
     with xRecibos do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Num_Orden'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Open;
        First;

        {Avanzo hasta encontrar un recibo a un NO español o un NO residente y que el importe sea menor a 12.500,00 Euros}
        while ((not xRecibos.EOF) and
              (((xLoc_T.FieldByName('PAIS_C2').AsString = 'ES') and (True = True  {ProAcr_EsResidente=True})) or
              ((xLoc_T.FieldByName('PAIS_C2').AsString = 'ES') and (True = False {ProAcr_EsResidente=False}) and (xRecibosLIQUIDO.AsFloat >= 12500)))) do
           xRecibos.Next;
     end;

     if (not xRecibos.EOF) then
        Norma34_1.CompCabeceraTransfronteriza;

     while (not xRecibos.EOF) do
     begin
        {Gastos a cargo de: 1 Ordenante, 2 Beneficiario, 3 Compartidos}
        if (QMOrdenPagoGASTOS.AsInteger = 0) then
           Norma34_1.Gastos := '1'
        else
        if (QMOrdenPagoGASTOS.AsInteger = 1) then
           Norma34_1.Gastos := '2'
        else
           Norma34_1.Gastos := '3';

        Norma34_1.Concepto := '7'; {1 - 2 Nomina Exterior, 6 Pension Exterior o 7 Otros Conceptos Exterior}
        Norma34_1.InstruccionOrden := '1'; {1 - Instruccion de orden de abono directo por cuenta, 1 si, 2 no}

        if ((xRecibosCOD_CLI_PRO.AsInteger = -2) and (xRecibosDOC_TIPO.AsString = 'NRP')) then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NIF,NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,NUMERO_CUENTA,DIGITO_CONTROL, ' +
                    'IMPORTE,TEXTO,CREGION FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
                 Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                 ExecQuery;

                 //Norma34_1.DNIBen := QuitaPaisDeNIF(FieldByName['NIF'].AsString); {9}
                 Norma34_1.NomBen := FieldByName['NOMBRE'].AsString; {36}
                 Norma34_1.NIdBen := ''; {18}
                 Norma34_1.Referencia := FieldByName['NIF'].AsString; {12 - Debe ser el nif}

                 Norma34_1.DomBen1 := '.'; {36}
                 Norma34_1.DomBen2 := ''; {36}
                 Norma34_1.CPTLPlzBen := FieldByName['CREGION'].AsString + '000'; {36}
                 Norma34_1.ProvBen := '.'; {36}
                 Norma34_1.EntBen := FieldByName['CLAVE_BANCO'].AsString; {4}
                 Norma34_1.SucBen := FieldByName['NUMERO_SUCURSAL'].AsString; {4}
                 Norma34_1.cccBen := FieldByName['DIGITO_CONTROL'].AsString; {2 - Dígito de control}
                 Norma34_1.CtaBen := FieldByName['NUMERO_CUENTA'].AsString; {10}

                 Norma34_1.Importe := xRecibosLIQUIDO.AsCurrency;

                 Norma34_1.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
                 Norma34_1.ConcepBen2 := '.'; {36}

                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
        end
        else
        begin
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP')) then
           begin
              //Norma34_1.DNIBen := xProveedor.FieldByName('NIF').AsString; {9}
              Norma34_1.NomBen := xProveedor.FieldByName('TITULO').AsString; {36}
              Norma34_1.NIdBen := ''; {18}
              Norma34_1.Referencia := xProveedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA')) then
           begin
              //Norma34_1.DNIBen := xAcreedor.FieldByName('NIF').AsString; {9}
              Norma34_1.NomBen := xAcreedor.FieldByName('TITULO').AsString; {36}
              Norma34_1.NIdBen := ''; {18}
              Norma34_1.Referencia := xAcreedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           Norma34_1.DomBen1 := DameDireccion; {36}
           Norma34_1.DomBen2 := ''; {36}
           Norma34_1.CPTLPlzBen := xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString; {36}
           Norma34_1.ProvBen := xLoc_T.FieldByName('PROVINCIA').AsString; {36}
           Norma34_1.PaisPlzBen := xLoc_T.FieldByName('TITULO_PAIS').AsString; {36}
           (*Norma34_1.EntBen := xProveedorBanco.FieldByName('ENTIDAD').AsString; {4}
           Norma34_1.SucBen := xProveedorBanco.FieldByName('SUCURSAL').AsString; {4}
           Norma34_1.cccBen := xProveedorBanco.FieldByName('CONTROL').AsString; {2 - Dígito de control}
           Norma34_1.CtaBen := xProveedorBanco.FieldByName('CUENTA').AsString; {10}*)
           Norma34_1.IBAN := xProveedorBanco.FieldByName('IBAN').AsString;
           Norma34_1.BIC := xProveedorBanco.FieldByName('BIC').AsString;
           Norma34_1.PaisBen := xLoc_T.FieldByName('PAIS_C2').AsString;
           Norma34_1.Importe := xRecibosLIQUIDO.AsCurrency;

           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'FAP')) then
              Norma34_1.ConcepBen1 := _('Factura') + ' ' + xRecibosDOC_SERIE.AsString + '/' + xRecibosDOC_NUMERO.AsString; {36}
           if ((xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'NRP') or
              (xRecibosDOC_TIPO.AsString = 'AGA') or (xRecibosDOC_TIPO.AsString = 'AGP')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA=?ID_CARTERA';
                    Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                    ExecQuery;
                    Norma34_1.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
           Norma34_1.ConcepBen2 := _('Venc.') + ' ' + xRecibosVENCIMIENTO.AsString; {36}
        end;
        Norma34_1.CompRegistroTransfronterizo;
        Inc(Procesados);

        xRecibos.Next;
        {Avanzo hasta encontrar un recibo a un NO español o un NO residente y que el importe sea menor a 12.500,00 Euros}
        while ((not xRecibos.EOF) and
              (((xLoc_T.FieldByName('PAIS_C2').AsString = 'ES') and (True = True  {ProAcr_EsResidente=True})) or
              ((xLoc_T.FieldByName('PAIS_C2').AsString = 'ES') and (True = False {ProAcr_EsResidente=False}) and (xRecibosLIQUIDO.AsFloat >= 12500)))) do
           xRecibos.Next;
     end; {while not eof}

     if (Procesados > 0) then
        Norma34_1.CerrarTransfronterizo;

     { Introducimos datos de los recibos Especiales }

     Procesados := 0; {cuento los procesados para saber si tengo que hacer un registro de totales o no}
     with xRecibos do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Open;
        First;

        {Avanzo hasta encontrar un recibo un NO residente y que el importe sea mayor a 12.500,00 Euros}
        while ((not xRecibos.EOF) and
              (not ((True = False {ProAcr_EsResidente=False}) and (xRecibosLIQUIDO.AsFloat >= 12500)))) do
           Next;
     end;

     if (not xRecibos.EOF) then
        Norma34_1.CompCabeceraEspecial;

     while (not xRecibos.EOF) do
     begin
        {Gastos a cargo de: 1 Ordenante, 2 Beneficiario, 3 Compartidos}
        if (QMOrdenPagoGASTOS.AsInteger = 0) then
           Norma34_1.Gastos := '1'
        else
        if (QMOrdenPagoGASTOS.AsInteger = 1) then
           Norma34_1.Gastos := '2'
        else
           Norma34_1.Gastos := '3';

        Norma34_1.Concepto := '7'; {1 - 2 Nomina Exterior, 6 Pension Exterior o 7 Otros Conceptos Exterior}
        Norma34_1.InstruccionOrden := '1'; {1 - Instruccion de orden de abono directo por cuenta, 1 si, 2 no}

        if ((xRecibosCOD_CLI_PRO.AsInteger = -2) and (xRecibosDOC_TIPO.AsString = 'NRP')) then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NIF,NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,NUMERO_CUENTA,DIGITO_CONTROL, ' +
                    'IMPORTE,TEXTO,CREGION FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
                 Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                 ExecQuery;

                 //Norma34_1.DNIBen := FieldByName['NIF'].AsString; {9}
                 Norma34_1.NomBen := FieldByName['NOMBRE'].AsString; {36}
                 Norma34_1.NIdBen := ''; {18}
                 Norma34_1.Referencia := FieldByName['NIF'].AsString; {12 - Debe ser el nif}

                 Norma34_1.DomBen1 := '.'; {36}
                 Norma34_1.DomBen2 := ''; {36}
                 Norma34_1.CPTLPlzBen := FieldByName['CREGION'].AsString + '000'; {36}
                 Norma34_1.ProvBen := '.'; {36}
                 Norma34_1.EntBen := FieldByName['CLAVE_BANCO'].AsString; {4}
                 Norma34_1.SucBen := FieldByName['NUMERO_SUCURSAL'].AsString; {4}
                 Norma34_1.cccBen := FieldByName['DIGITO_CONTROL'].AsString; {2 - Dígito de control}
                 Norma34_1.CtaBen := FieldByName['NUMERO_CUENTA'].AsString; {10}

                 Norma34_1.Importe := xRecibosLIQUIDO.AsCurrency;

                 Norma34_1.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
                 Norma34_1.ConcepBen2 := '.'; {36}

                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
        end
        else
        begin
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP')) then
           begin
              //Norma34_1.DNIBen := xProveedor.FieldByName('NIF').AsString; {9}
              Norma34_1.NomBen := xProveedor.FieldByName('TITULO').AsString; {36}
              Norma34_1.NIdBen := ''; {18}
              Norma34_1.Referencia := xProveedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA')) then
           begin
              //Norma34_1.DNIBen := xAcreedor.FieldByName('NIF').AsString; {9}
              Norma34_1.NomBen := xAcreedor.FieldByName('TITULO').AsString; {36}
              Norma34_1.NIdBen := ''; {18}
              Norma34_1.Referencia := xAcreedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           Norma34_1.DomBen1 := DameDireccion; {36}
           Norma34_1.DomBen2 := ''; {36}
           Norma34_1.CPTLPlzBen := xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString; {36}
           Norma34_1.ProvBen := xLoc_T.FieldByName('PROVINCIA').AsString; {36}
           Norma34_1.PaisPlzBen := xLoc_T.FieldByName('TITULO_PAIS').AsString; {36}
           (*Norma34_1.EntBen := xProveedorBanco.FieldByName('ENTIDAD').AsString; {4}
           Norma34_1.SucBen := xProveedorBanco.FieldByName('SUCURSAL').AsString; {4}
           Norma34_1.cccBen := xProveedorBanco.FieldByName('CONTROL').AsString; {2 - Dígito de control}
           Norma34_1.CtaBen := xProveedorBanco.FieldByName('CUENTA').AsString; {10}*)
           Norma34_1.IBAN := xProveedorBanco.FieldByName('IBAN').AsString;
           Norma34_1.BIC := xProveedorBanco.FieldByName('BIC').AsString;
           Norma34_1.PaisBen := xLoc_T.FieldByName('PAIS_C2').AsString;
           Norma34_1.Importe := xRecibosLIQUIDO.AsCurrency;

           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'FAP')) then
              Norma34_1.ConcepBen1 := _('Factura') + ' ' + xRecibosDOC_SERIE.AsString + '/' + xRecibosDOC_NUMERO.AsString; {36}
           if ((xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'NRP') or
              (xRecibosDOC_TIPO.AsString = 'AGA') or (xRecibosDOC_TIPO.AsString = 'AGP')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA=?ID_CARTERA';
                    Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                    ExecQuery;
                    Norma34_1.ConcepBen1 := FieldByName['TEXTO'].AsString; {36}
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
           Norma34_1.ConcepBen2 := _('Venc.') + ' ' + xRecibosVENCIMIENTO.AsString; {36}
        end;
        Norma34_1.CompRegistroEspecial;
        Inc(Procesados);

        xRecibos.Next;
        {Avanzo hasta encontrar un recibo un NO residente y que el importe sea mayor a 12.500,00 Euros}
        while ((not xRecibos.EOF) and
              (not ((True = False {ProAcr_EsResidente=False}) and (xRecibosLIQUIDO.AsFloat >= 12500)))) do
           xRecibos.Next;
     end; {while not eof}

     if (Procesados > 0) then
        Norma34_1.CerrarEspecial;

     Norma34_1.Cerrar;

     ShowMessage(_('Se ha creado la norma 34.1'));

     MarcaNormaCerrada;
     QMOrdenPago.Refresh;
  end;
end;

procedure TDMOrdenesDePago.DatosRegistro;
begin
  {Si cambia algo aca, cambiar tambien en UDMCartera}
  if (QMDetalleDOC_TIPO.AsString = 'NRP') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,DIGITO_CONTROL,NUMERO_CUENTA, ' +
              'NIF,IMPORTE,TEXTO,CNUMCENTRAL,CPOLIZA FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
           Params.ByName['ID_CARTERA'].AsInteger := QMDetalleID_CARTERA.AsInteger;
           ExecQuery;
           if (Trim(FieldByName['NOMBRE'].AsString) > '') then
           begin
              ShowMessage(_('Nombre') + ': ' + FieldByName['NOMBRE'].AsString + #13#10 +
                 _('Banco') + ': ' + FieldByName['CLAVE_BANCO'].AsString + '-' + FieldByName['NUMERO_SUCURSAL'].AsString + '-' + FieldByName['DIGITO_CONTROL'].AsString + '-' + FieldByName['NUMERO_CUENTA'].AsString + #13#10 +
                 _('NIF') + ': ' + FieldByName['NIF'].AsString + #13#10 +
                 _('Importe') + ': ' + FieldByName['IMPORTE'].AsString + #13#10 +
                 _('Texto') + ': ' + FieldByName['TEXTO'].AsString + #13#10 +
                 _('Num. Central') + ': ' + FieldByName['CNUMCENTRAL'].AsString + #13#10 +
                 _('Num. Poliza') + ': ' + FieldByName['CPOLIZA'].AsString);
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM IMP_SANTA_LUCIA_1 WHERE ID_E=?ID_E';
           Params.ByName['ID_E'].AsInteger := QMDetalleID_DOC.AsInteger;
           ExecQuery;
           if (Trim(FieldByName['NOMBRE'].AsString) > '') then
           begin
              ShowMessage(_('Nombre') + ': ' + FieldByName['NOMBRE'].AsString + #13#10 +
                 _('Banco') + ': ' + FieldByName['CLAVE_BANCO'].AsString + '-' + FieldByName['NUMERO_SUCURSAL'].AsString + '-' + FieldByName['DIGITO_CONTROL'].AsString + '-' + FieldByName['NUMERO_CUENTA'].AsString + #13#10 +
                 _('NIF') + ': ' + FieldByName['NIF'].AsString + #13#10 +
                 _('Importe') + ': ' + FieldByName['IMPORTE'].AsString + #13#10 +
                 _('Num. Factura') + ': ' + FieldByName['NUMFACTU'].AsString + #13#10 +
                 _('Direccion') + ': ' + FieldByName['DIRECCION_1'].AsString + ' ' + FieldByName['DIR_NUMERO'].AsString + ' ' + FieldByName['DIR_PISO'].AsString + ' ' + FieldByName['DIR_PUERTA'].AsString + ' ' + FieldByName['DIR_BLOQUE'].AsString + #13#10 +
                 _('Poblacion') + ': (' + FieldByName['CODIGO_POSTAL'].AsString + ') ' + FieldByName['POBLACION'].AsString + #13#10 +
                 _('Telefono') + ': ' + FieldByName['TELEFONO_1'].AsString + ' - ' + FieldByName['TELEFONO_2'].AsString + ' - Fax ' + FieldByName['FAX'].AsString);
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMOrdenesDePago.QMOrdenPagoASIENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMOrdenPagoCERRADO.AsInteger = 0) then
     Text := ' '
  else
     Text := IntToStr(QMOrdenPagoASIENTO.AsInteger);
end;

procedure TDMOrdenesDePago.QMOrdenPagoAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  if (not QMDetalle.Active) then
     QMDetalle.Open;
end;

function TDMOrdenesDePago.QuitaPaisDeNIF(NIF: string): string;
begin
  if (Length(NIF) = 9) then
     Result := NIF
  else
  begin
     Result := Copy(NIF, Length(NIF) - 9 + 1, 9);
  end;
end;

procedure TDMOrdenesDePago.QMDetalleCalcFields(DataSet: TDataSet);
var
  SaldoDeudor : double;
  SaldoAcreedor : double;
  Saldo : double;
  Tipo : string;
begin
  /// Calculo los saldos contables.
  SaldoDeudor := 0;
  SaldoAcreedor := 0;
  Saldo := 0;
  if ((DataSet.FieldByName('DOC_TIPO').AsString = 'FAP') or (DataSet.FieldByName('DOC_TIPO').AsString = 'AGP') or
     (DataSet.FieldByName('DOC_TIPO').AsString = 'NRP')) then
     Tipo := 'P'
  else
  if ((DataSet.FieldByName('DOC_TIPO').AsString = 'FCR') or (DataSet.FieldByName('DOC_TIPO').AsString = 'AGA') or
     (DataSet.FieldByName('DOC_TIPO').AsString = 'NRA')) then
     Tipo := 'A';

  if FCalcularSaldo then
  begin
     DMMain.DameSaldoCliPro(' ', Tipo, QMDetalleCOD_CLI_PRO.AsInteger, SaldoDeudor, SaldoAcreedor, Saldo);
     QMDetalleSALDO_DEUDOR.AsFloat := SaldoDeudor;
     QMDetalleSALDO_ACREEDOR.AsFloat := SaldoAcreedor;
     QMDetalleSALDO.AsFloat := Saldo;
  end;
  QMDetalleSALDO_DEUDOR.AsFloat := SaldoDeudor;
  QMDetalleSALDO_ACREEDOR.AsFloat := SaldoAcreedor;
  QMDetalleSALDO.AsFloat := Saldo;
end;

procedure TDMOrdenesDePago.SetCalcularSaldo(const Value: boolean);
begin
  FCalcularSaldo := Value;
  QMDetalleCalcFields(QMDetalle);
end;

procedure TDMOrdenesDePago.ImprimirNorma34_14(AFormato: integer; ASufijo: string);
var
  Q : THYFIBQuery;
  Procesados : integer;
  EmitirSiempreTransferencia : boolean;
  Archivo : string;
begin
  {Aformato se utilizara si hay bancos que pida diferencias con este formato}

  // Si EmitirSiempreTransferencia = ture, no tiene en cuenta el tipo de efecto
  // para decidir si hace transferencia o cheque
  EmitirSiempreTransferencia := True;

  if (REntorno.Moneda <> 'EUR') then
     raise Exception.Create(_('La Norma 34 no está definida para esta moneda'));

  Archivo := Format('OrdenPago-%d-%.3d.txt', [QMOrdenPagoEJERCICIO.AsInteger, QMOrdenPagoNUM_ORDEN.AsInteger]);
  if MySaveDialog(Archivo, 'TXT', '', 'DMOrdenesDePago') then
  begin
     with xBancoOrdPago do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMOrdenPagoBANCO.AsInteger;
        Open;
     end;

     Norma34_14.NomFichero := Archivo;
     Norma34_14.Modalidad := CVBNorma34_14CSB.moTransfer; {puede ser tambien moCheques}
     Norma34_14.Depura := False; {Si es true no genera exception y genera los registros que puede}
     Norma34_14.Formato := AFormato;

     Norma34_14.Abrir;

     {Cabecera de ordenante}
     Norma34_14.Ordenante := Copy(REntorno.CifEmpresa, 3, 9); {9}
     Norma34_14.Sufijo := ASufijo;
     Norma34_14.FecEnvSoporte := Now;
     Norma34_14.FecEmiOrdenes := QMOrdenPagoFECHA.AsDateTime;
     Norma34_14.IBAN := xBancoOrdPago.FieldByName('IBAN').AsString;
     Norma34_14.BIC := xBancoOrdPago.FieldByName('BIC').AsString;
     Norma34_14.EntOrd := xBancoOrdPago.FieldByName('ENTIDAD').AsString; {4}
     Norma34_14.SucOrd := xBancoOrdPago.FieldByName('SUCURSAL').AsString; {4}
     Norma34_14.cccOrd := xBancoOrdPago.FieldByName('CONTROL').AsString; {2 - Creo que es el dígito de control}
     Norma34_14.CtaOrd := xBancoOrdPago.FieldByName('CUENTA_CORRIENTE').AsString; {10}

     Norma34_14.NomOrd := REntorno.NombreEmpresa;
     Norma34_14.DomOrd := REntorno.DirEmpresa;
     Norma34_14.PlzOrd := REntorno.PobEmpresa;
     Norma34_14.ProvOrd := REntorno.ProvEmpresa;
     Norma34_14.PaisOrd := DamePaisC2(REntorno.Pais);

     if (QMOrdenPagoDETALLE_CARGOS.AsString = '1') then {1 - ' ', 0 o 1}
        Norma34_14.DetallCgo := '1'
     else
        Norma34_14.DetallCgo := '0';
     Norma34_14.TipoPersonaOrd := '1'; // Ordenante puede ser 1-Organizacion 2-Persona

     Norma34_14.CompCabecera;

     { Introducimos datos de los recibos nacionales }

     Procesados := 0; {cuento los procesados para saber si tengo que hacer un registro de totales o no}
     with xRecibos do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Open;
        First;

        {Avanzo hasta encontrar un recibo a zona SEPA (España, intracomunitario, Noruega, Lichtenstein, Suiza e Islandia), NO cheque}
        while ((not xRecibos.EOF) and
              ((not ((xLoc_T.FieldByName('PERTENECE_CEE').AsInteger = 1) or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'NO') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'LI') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'CH') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'IC')
              )
              ) or
              ((xRecibosTIPO_EFECTO.AsString = 'TAL') and (not EmitirSiempreTransferencia))
              )
           ) do
           xRecibos.Next;
     end;

     {Registro de cabecera ordenante de transferencias SEPA (Paises EURO)}
     if (not xRecibos.EOF) then
        Norma34_14.CompCabeceraSEPA;

     {Registros de beneficiario de transferencia SEPA}
     while (not xRecibos.EOF) do
     begin
        if (QMOrdenPagoGASTOS.AsInteger = 0) then {1 - 1 Ordenante, 2 Beneficiario, 3 compartidos}
           Norma34_14.Gastos := '1'
        else
        if (QMOrdenPagoGASTOS.AsInteger = 1) then
           Norma34_14.Gastos := '2'
        else
           Norma34_14.Gastos := '3';

        Norma34_14.Concepto := '9'; {1 - 1 Nomina, 8 Pension o 9 Otros Conceptos}
        Norma34_14.InstruccionOrden := '1'; {1 - Instruccion de orden de abono directo por cuenta, 1 si, 2 no}
        Norma34_14.PaisBen := xLoc_T.FieldByName('PAIS_C2').AsString;
        if ((xRecibosCOD_CLI_PRO.AsInteger = -2) and (xRecibosDOC_TIPO.AsString = 'NRP')) then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NIF,NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,NUMERO_CUENTA,DIGITO_CONTROL, ' +
                    'IMPORTE,TEXTO,CREGION FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
                 Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                 ExecQuery;

                 Norma34_14.DNIBen := QuitaPaisDeNIF(FieldByName['NIF'].AsString); {9}
                 Norma34_14.NomBen := FieldByName['NOMBRE'].AsString; {70}
                 Norma34_14.NIdBen := ''; {18}
                 Norma34_14.Referencia := QuitaPaisDeNIF(FieldByName['NIF'].AsString); {12 - Debe ser el nif(9)+Sufijo(3)}

                 Norma34_14.DomBen := '.'; {50}
                 Norma34_14.CPTLPlzBen := FieldByName['CREGION'].AsString + '000'; {50}
                 Norma34_14.ProvBen := '.'; {40}
                 Norma34_14.EntBen := FieldByName['CLAVE_BANCO'].AsString; {4}
                 Norma34_14.SucBen := FieldByName['NUMERO_SUCURSAL'].AsString; {4}
                 Norma34_14.cccBen := FieldByName['DIGITO_CONTROL'].AsString; {2 - Dígito de control}
                 Norma34_14.CtaBen := FieldByName['NUMERO_CUENTA'].AsString; {10}

                 Norma34_14.Importe := xRecibosLIQUIDO.AsCurrency;

                 Norma34_14.ConcepBen := FieldByName['TEXTO'].AsString; {140}

                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
        end
        else
        begin
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP')) then
           begin
              Norma34_14.DNIBen := QuitaPaisDeNIF(xProveedor.FieldByName('NIF').AsString); {9}
              Norma34_14.NomBen := xProveedor.FieldByName('TITULO').AsString; {70}
              Norma34_14.NIdBen := ''; {18}
              Norma34_14.Referencia := xProveedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA')) then
           begin
              Norma34_14.DNIBen := QuitaPaisDeNIF(xAcreedor.FieldByName('NIF').AsString); {9}
              Norma34_14.NomBen := xAcreedor.FieldByName('TITULO').AsString; {70}
              Norma34_14.NIdBen := ''; {18}
              Norma34_14.Referencia := xAcreedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           Norma34_14.DomBen := DameDireccion; {50}
           Norma34_14.CPTLPlzBen := xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString; {36}
           Norma34_14.ProvBen := xLoc_T.FieldByName('PROVINCIA').AsString; {36}
           Norma34_14.EntBen := xProveedorBanco.FieldByName('ENTIDAD').AsString; {4}
           Norma34_14.SucBen := xProveedorBanco.FieldByName('SUCURSAL').AsString; {4}
           Norma34_14.cccBen := xProveedorBanco.FieldByName('CONTROL').AsString; {2 - Dígito de control}
           Norma34_14.CtaBen := xProveedorBanco.FieldByName('CUENTA').AsString; {10}
           Norma34_14.IBAN := xProveedorBanco.FieldByName('IBAN').AsString;
           Norma34_14.BIC := xProveedorBanco.FieldByName('BIC').AsString;

           Norma34_14.Importe := xRecibosLIQUIDO.AsCurrency;

           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'FAP')) then
              Norma34_14.ConcepBen := _('Factura') + ' ' + xRecibosDOC_SERIE.AsString + '/' + xRecibosDOC_NUMERO.AsString; {36}
           if ((xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'NRP') or
              (xRecibosDOC_TIPO.AsString = 'AGA') or (xRecibosDOC_TIPO.AsString = 'AGP')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA=?ID_CARTERA';
                    Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                    ExecQuery;
                    Norma34_14.ConcepBen := FieldByName['TEXTO'].AsString; {140}
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
           Norma34_14.ConcepBen := Norma34_14.ConcepBen + ' - ' + _('Venc.') + ' ' + xRecibosVENCIMIENTO.AsString; {140}
        end;
        Norma34_14.CompRegistroSEPA;
        Inc(Procesados);

        xRecibos.Next;
        {Avanzo hasta encontrar un recibo a zona SEPA (España, intracomunitario, Noruega, Lichtenstein, Suiza e Islandia), NO cheque}
        while ((not xRecibos.EOF) and
              ((not ((xLoc_T.FieldByName('PERTENECE_CEE').AsInteger = 1) or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'NO') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'LI') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'CH') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'IC')
              )
              ) or
              ((xRecibosTIPO_EFECTO.AsString = 'TAL') and (not EmitirSiempreTransferencia))
              )
           ) do
           xRecibos.Next;
     end; {while not eof}

     if (Procesados > 0) then
        Norma34_14.CerrarSEPA;

     { Introducimos datos de los recibos "Otras Transferencias" }

     Norma34_14.Concepto := '7'; {1 - 2 Nomina Exterior, 6 Pension Exterior o 7 Otros Conceptos Exterior}

     Procesados := 0; {cuento los procesados para saber si tengo que hacer un registro de totales o no}
     with xRecibos do
     begin
        {Ya esta abierto. Solo debo volver al primer registro
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Num_Orden'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Open;}
        First;
        {Avanzo hasta encontrar un recibo a NO zona SEPA y NO cheque}
        while ((not xRecibos.EOF) and
              (((xLoc_T.FieldByName('PERTENECE_CEE').AsInteger = 1) or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'NO') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'LI') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'CH') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'IC')
              ) or
              ((xRecibosTIPO_EFECTO.AsString = 'TAL') and (not EmitirSiempreTransferencia))
              )
           ) do
           xRecibos.Next;
     end;

     if (not xRecibos.EOF) then
        Norma34_14.CompCabeceraNoSEPA;

     while (not xRecibos.EOF) do
     begin
        {Gastos a cargo de: 1 Ordenante, 2 Beneficiario, 3 Compartidos}
        if (QMOrdenPagoGASTOS.AsInteger = 0) then
           Norma34_14.Gastos := '1'
        else
        if (QMOrdenPagoGASTOS.AsInteger = 1) then
           Norma34_14.Gastos := '2'
        else
           Norma34_14.Gastos := '3';

        Norma34_14.Concepto := '7'; {1 - 2 Nomina Exterior, 6 Pension Exterior o 7 Otros Conceptos Exterior}
        Norma34_14.InstruccionOrden := '1'; {1 - Instruccion de orden de abono directo por cuenta, 1 si, 2 no}

        if ((xRecibosCOD_CLI_PRO.AsInteger = -2) and (xRecibosDOC_TIPO.AsString = 'NRP')) then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NIF,NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,NUMERO_CUENTA,DIGITO_CONTROL, ' +
                    'IMPORTE,TEXTO,CREGION FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
                 Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                 ExecQuery;

                 //Norma34_14.DNIBen := QuitaPaisDeNIF(FieldByName['NIF'].AsString); {9}
                 Norma34_14.NomBen := FieldByName['NOMBRE'].AsString; {36}
                 Norma34_14.NIdBen := ''; {18}
                 Norma34_14.Referencia := FieldByName['NIF'].AsString; {12 - Debe ser el nif}

                 Norma34_14.DomBen := '.'; {36}
                 Norma34_14.CPTLPlzBen := FieldByName['CREGION'].AsString + '000'; {36}
                 Norma34_14.ProvBen := '.'; {36}
                 Norma34_14.EntBen := FieldByName['CLAVE_BANCO'].AsString; {4}
                 Norma34_14.SucBen := FieldByName['NUMERO_SUCURSAL'].AsString; {4}
                 Norma34_14.cccBen := FieldByName['DIGITO_CONTROL'].AsString; {2 - Dígito de control}
                 Norma34_14.CtaBen := FieldByName['NUMERO_CUENTA'].AsString; {10}
                 Norma34_14.IBAN := '';
                 Norma34_14.BIC := '';

                 Norma34_14.Importe := xRecibosLIQUIDO.AsCurrency;

                 Norma34_14.ConcepBen := FieldByName['TEXTO'].AsString; {140}

                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
        end
        else
        begin
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP')) then
           begin
              //Norma34_14.DNIBen := xProveedor.FieldByName('NIF').AsString; {9}
              Norma34_14.NomBen := xProveedor.FieldByName('TITULO').AsString; {36}
              Norma34_14.NIdBen := ''; {18}
              Norma34_14.Referencia := xProveedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA')) then
           begin
              //Norma34_14.DNIBen := xAcreedor.FieldByName('NIF').AsString; {9}
              Norma34_14.NomBen := xAcreedor.FieldByName('TITULO').AsString; {36}
              Norma34_14.NIdBen := ''; {18}
              Norma34_14.Referencia := xAcreedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           Norma34_14.DomBen := DameDireccion; {36}
           Norma34_14.CPTLPlzBen := xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString; {36}
           Norma34_14.ProvBen := xLoc_T.FieldByName('PROVINCIA').AsString; {36}
           Norma34_14.PaisBen := xLoc_T.FieldByName('TITULO_PAIS').AsString; {36}
           (*Norma34_14.EntBen := xProveedorBanco.FieldByName('ENTIDAD').AsString; {4}
           Norma34_14.SucBen := xProveedorBanco.FieldByName('SUCURSAL').AsString; {4}
           Norma34_14.cccBen := xProveedorBanco.FieldByName('CONTROL').AsString; {2 - Dígito de control}
           Norma34_14.CtaBen := xProveedorBanco.FieldByName('CUENTA').AsString; {10}*)
           Norma34_14.IBAN := xProveedorBanco.FieldByName('IBAN').AsString;
           Norma34_14.BIC := xProveedorBanco.FieldByName('BIC').AsString;
           Norma34_14.PaisBen := xLoc_T.FieldByName('PAIS_C2').AsString;
           Norma34_14.Importe := xRecibosLIQUIDO.AsCurrency;

           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'FAP')) then
              Norma34_14.ConcepBen := _('Factura') + ' ' + xRecibosDOC_SERIE.AsString + '/' + xRecibosDOC_NUMERO.AsString; {140}
           if ((xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'NRP') or
              (xRecibosDOC_TIPO.AsString = 'AGA') or (xRecibosDOC_TIPO.AsString = 'AGP')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA=?ID_CARTERA';
                    Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                    ExecQuery;
                    Norma34_14.ConcepBen := FieldByName['TEXTO'].AsString; {140}
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
           Norma34_14.ConcepBen := Norma34_14.ConcepBen + ' - ' + _('Venc.') + ' ' + xRecibosVENCIMIENTO.AsString; {140}
        end;
        Norma34_14.CompRegistroNoSEPA;
        Inc(Procesados);

        xRecibos.Next;
        {Avanzo hasta encontrar un recibo a NO zona SEPA y NO cheque}
        while ((not xRecibos.EOF) and
              (((xLoc_T.FieldByName('PERTENECE_CEE').AsInteger = 1) or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'NO') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'LI') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'CH') or
              (xLoc_T.FieldByName('PAIS_C2').AsString = 'IC')
              ) or
              ((xRecibosTIPO_EFECTO.AsString = 'TAL') and (not EmitirSiempreTransferencia))
              )
           ) do
           xRecibos.Next;
     end; {while not eof}

     if (Procesados > 0) then
        Norma34_14.CerrarNoSEPA;

     { Introducimos datos de los recibos "Cheques" }

     Norma34_14.Concepto := '7'; {1 - 2 Nomina Exterior, 6 Pension Exterior o 7 Otros Conceptos Exterior}

     Procesados := 0; {cuento los procesados para saber si tengo que hacer un registro de totales o no}
     with xRecibos do
     begin
        {Ya esta abierto. Solo debo volver al primer registro
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Num_Orden'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        Open;}
        First;

        {Busco Talones}
        while ((not xRecibos.EOF) and
              ((xRecibosTIPO_EFECTO.AsString <> 'TAL') or EmitirSiempreTransferencia)
           ) do
           xRecibos.Next;
     end;

     if (not xRecibos.EOF) then
        Norma34_14.CompCabeceraCheque;

     while (not xRecibos.EOF) do
     begin
        {Gastos a cargo de: 1 Ordenante, 2 Beneficiario, 3 Compartidos}
        if (QMOrdenPagoGASTOS.AsInteger = 0) then
           Norma34_14.Gastos := '1'
        else
        if (QMOrdenPagoGASTOS.AsInteger = 1) then
           Norma34_14.Gastos := '2'
        else
           Norma34_14.Gastos := '3';

        Norma34_14.Concepto := '7'; {1 - 2 Nomina Exterior, 6 Pension Exterior o 7 Otros Conceptos Exterior}
        Norma34_14.InstruccionOrden := '1'; {1 - Instruccion de orden de abono directo por cuenta, 1 si, 2 no}

        if ((xRecibosCOD_CLI_PRO.AsInteger = -2) and (xRecibosDOC_TIPO.AsString = 'NRP')) then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NIF,NOMBRE,CLAVE_BANCO,NUMERO_SUCURSAL,NUMERO_CUENTA,DIGITO_CONTROL, ' +
                    'IMPORTE,TEXTO,CREGION FROM IMP_SANTA_LUCIA_3 WHERE ID_CARTERA=?ID_CARTERA';
                 Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                 ExecQuery;

                 //Norma34_14.DNIBen := QuitaPaisDeNIF(FieldByName['NIF'].AsString); {9}
                 Norma34_14.NomBen := FieldByName['NOMBRE'].AsString; {36}
                 Norma34_14.NIdBen := ''; {18}
                 Norma34_14.Referencia := FieldByName['NIF'].AsString; {12 - Debe ser el nif}

                 Norma34_14.DomBen := '.'; {36}
                 Norma34_14.CPTLPlzBen := FieldByName['CREGION'].AsString + '000'; {36}
                 Norma34_14.ProvBen := '.'; {36}
                 Norma34_14.EntBen := FieldByName['CLAVE_BANCO'].AsString; {4}
                 Norma34_14.SucBen := FieldByName['NUMERO_SUCURSAL'].AsString; {4}
                 Norma34_14.cccBen := FieldByName['DIGITO_CONTROL'].AsString; {2 - Dígito de control}
                 Norma34_14.CtaBen := FieldByName['NUMERO_CUENTA'].AsString; {10}
                 Norma34_14.IBAN := '';
                 Norma34_14.BIC := '';

                 Norma34_14.Importe := xRecibosLIQUIDO.AsCurrency;

                 Norma34_14.ConcepBen := FieldByName['TEXTO'].AsString; {140}

                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
        end
        else
        begin
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP')) then
           begin
              //Norma34_14.DNIBen := xProveedor.FieldByName('NIF').AsString; {9}
              Norma34_14.NomBen := xProveedor.FieldByName('TITULO').AsString; {36}
              Norma34_14.NIdBen := ''; {18}
              Norma34_14.Referencia := xProveedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA')) then
           begin
              //Norma34_14.DNIBen := xAcreedor.FieldByName('NIF').AsString; {9}
              Norma34_14.NomBen := xAcreedor.FieldByName('TITULO').AsString; {36}
              Norma34_14.NIdBen := ''; {18}
              Norma34_14.Referencia := xAcreedor.FieldByName('NIF').AsString; {12 - Debe ser el nif}
           end;
           Norma34_14.DomBen := DameDireccion; {36}
           Norma34_14.CPTLPlzBen := xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString; {36}
           Norma34_14.ProvBen := xLoc_T.FieldByName('PROVINCIA').AsString; {36}
           Norma34_14.PaisBen := xLoc_T.FieldByName('TITULO_PAIS').AsString; {36}
           (*Norma34_14.EntBen := xProveedorBanco.FieldByName('ENTIDAD').AsString; {4}
           Norma34_14.SucBen := xProveedorBanco.FieldByName('SUCURSAL').AsString; {4}
           Norma34_14.cccBen := xProveedorBanco.FieldByName('CONTROL').AsString; {2 - Dígito de control}
           Norma34_14.CtaBen := xProveedorBanco.FieldByName('CUENTA').AsString; {10}*)
           Norma34_14.IBAN := xProveedorBanco.FieldByName('IBAN').AsString;
           Norma34_14.BIC := xProveedorBanco.FieldByName('BIC').AsString;
           Norma34_14.PaisBen := xLoc_T.FieldByName('PAIS_C2').AsString;
           Norma34_14.Importe := xRecibosLIQUIDO.AsCurrency;

           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'FAP')) then
              Norma34_14.ConcepBen := _('Factura') + ' ' + xRecibosDOC_SERIE.AsString + '/' + xRecibosDOC_NUMERO.AsString; {140}
           if ((xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'NRP') or
              (xRecibosDOC_TIPO.AsString = 'AGA') or (xRecibosDOC_TIPO.AsString = 'AGP')) then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TEXTO FROM EMP_CARTERA_TEXTO WHERE ID_CARTERA=?ID_CARTERA';
                    Params.ByName['ID_CARTERA'].AsInteger := xRecibosID_CARTERA.AsInteger;
                    ExecQuery;
                    Norma34_14.ConcepBen := FieldByName['TEXTO'].AsString; {140}
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
           Norma34_14.ConcepBen := Norma34_14.ConcepBen + ' - ' + _('Venc.') + ' ' + xRecibosVENCIMIENTO.AsString; {140}
        end;
        Norma34_14.CompRegistroCheque;
        Inc(Procesados);

        xRecibos.Next;
        {Busco Talones}
        while ((not xRecibos.EOF) and
              ((xRecibosTIPO_EFECTO.AsString <> 'TAL') or EmitirSiempreTransferencia)
           ) do
           xRecibos.Next;
     end; {while not eof}

     if (Procesados > 0) then
        Norma34_14.CerrarCheque;

     Norma34_14.Cerrar;

     ShowMessage(_('Se ha creado la norma 34.14'));

     MarcaNormaCerrada;
     QMOrdenPago.Refresh;
  end;
end;

procedure TDMOrdenesDePago.ImprimirSEPA(AFormato: integer; ASufijo: string);
var
  // Procesados : integer;
  EmitirSiempreTransferencia : boolean;
  x : TSEPA;
  aux : string;
  OrderId : string;
  Pais : string;
  i : integer;
  SubType : string;
  CtgyPurpCd : string;
  Concepto : string;
  Archivo : string;
begin
  {AFormato se utilizara si hay bancos que pida diferencias con este formato}

  {
  Inicia(...);
  AddPmtInf(...);
  AddTxInf(...);
  Finaliza;
  }

  if (REntorno.Moneda <> 'EUR') then
     raise Exception.Create(_('La Norma no está definida para esta moneda'));

  // Si EmitirSiempreTransferencia = ture, no tiene en cuenta el tipo de efecto
  // para decidir si hace transferencia o cheque
  EmitirSiempreTransferencia := True;

  Archivo := Format('OrdenPago-%d-%.3d.xml', [QMOrdenPagoEJERCICIO.AsInteger, QMOrdenPagoNUM_ORDEN.AsInteger]);
  if MySaveDialog(Archivo, 'XML', '', 'DMOrdenesDePago') then
  begin
     with xBancoOrdPago do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := QMOrdenPagoBANCO.AsInteger;
        Open;
     end;

     x := TSEPA.Create(Self);
     try
        with x do
        begin
           Fichero := ChangeFileExt(Archivo, '.xml');

           // En el caso de ordenes de pago es NIF(9) Sufijo(3)
           Pais := DamePaisC2(REntorno.Pais);
           if (Length(REntorno.CifEmpresa) = 9) then
              OrderId := REntorno.CifEmpresa
           else
           if ((Length(REntorno.CifEmpresa) = 11) and (Copy(REntorno.CifEmpresa, 1, 2) = 'ES')) then
              OrderId := Copy(REntorno.CifEmpresa, 3, 9);
           aux := '';
           for i := 1 to Length(OrderId) do
              if ((OrderId[i] in ['A'..'Z', '0'..'9'])) then
                 aux := aux + OrderId[i];

           OrderId := aux + ASufijo;

           {
           Inicia(Tipo, Nombre, IBAN, BIC, OrderId, MsgId: string; IsOrg : boolean);
           }
           Inicia
           ('CT',
              REntorno.NombreEmpresa,
              xBancoOrdPago.FieldByName('IBAN').AsString,
              xBancoOrdPago.FieldByName('BIC').AsString,
              OrderId,
              'ORD' + IntToStr(QMOrdenPagoNUM_ORDEN.AsInteger),
              False);

           with xRecibos do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
              Open;
              First;
           end;

           while (not xRecibos.EOF) do
           begin
              {
              AddPmtInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, ChrgBr: string);
              // SubType :
              //    "TRF"  : Transferencia
              //    "CHK"  : Cheque bancario o cheque-nómina
              }
              CtgyPurpCd := '';
              if ((EmitirSiempreTransferencia) or (xRecibosTIPO_EFECTO.AsString <> 'TAL')) then
              begin
                 SubType := 'TRF';

                 // PaymentTypeInformation, CategoryPurpose, Code
                 // Es opcional pero CatalunyaCaixa lo requiere
                 // Si otros bancos no se quejan asignaremos la categoria "OTHR (OTROS)" a la transaccion.
                 // SALA (Salary) y PENS (Pension) se utilizarian en el caso de nominas.
                 CtgyPurpCd := 'OTHR';
              end
              else
                 SubType := 'CHK';

              {
              Concepto := Format(_('Factura %s/%d'), [xRecibos.FieldByName('DOC_SERIE').AsString, xRecibos.FieldByName('DOC_NUMERO').AsInteger]) + ' ' +
                 Format(_('Recibo %d.%d'), [xRecibos.FieldByName('REGISTRO').AsInteger, xRecibos.FieldByName('LINEA').AsInteger]);
              }
              Concepto := xRecibosNUM_FACTURA.AsString;

              // El anteultimo parámetro también podría ser 'SUPP' (pagos a proveedores) u 'OTHR' (otros) o varios tipos mas.
              AddPmtInf(SubType, 'NONE', True, xRecibos.FieldByName('VENCIMIENTO').AsDateTime, CtgyPurpCd, 'SLEV');
              {
              AddPmtInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, ChrgBr: string);
              }
              {

              {
              AddTxInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, Id: string; InstdAmt: double; Nombre, IBAN, BIC, RmtInf, MndtId: string; MndtSgntr: TDateTime; BBAN, Country, AdrLine1, AdrLine2: string);
              }
              AddTxInf(
                 SubType,
                 'NONE',
                 True,
                 xRecibos.FieldByName('VENCIMIENTO').AsDateTime,
                 CtgyPurpCd,
                 '',
                 xRecibos.FieldByName('LIQUIDO').AsFloat,
                 xTerceros.FieldByName('NOMBRE_R_SOCIAL').AsString,
                 xProveedorBanco.FieldByName('IBAN').AsString,
                 xProveedorBanco.FieldByName('BIC').AsString,
                 Concepto,
                 xRecibosEJERCICIO.AsString + '-' + xRecibosREGISTRO.AsString + '-' + xRecibosLINEA.AsString,
                 Now,
                 xProveedorBanco.FieldByName('ENTIDAD').AsString + xProveedorBanco.FieldByName('SUCURSAL').AsString + xProveedorBanco.FieldByName('CONTROL').AsString + xProveedorBanco.FieldByName('CUENTA').AsString,
                 xLoc_T.FieldByName('PAIS_C2').AsString,
                 xDireccionProveedor.FieldByName('DIR_COMPLETA').AsString,
                 xLoc_T.FieldByName('CODPOSTAL').AsString + ' ' + xLoc_T.FieldByName('TITULO').AsString);

              xRecibos.Next;
           end;

           Finaliza;
        end;
     finally
        x.Free;
     end;

     MarcaNormaCerrada;
     QMOrdenPago.Refresh;
  end;
end;

procedure TDMOrdenesDePago.MarcaNormaCerrada;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_CARTERA_ORD_PAGO SET NORMA_CREADA=1 WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SIGNO = ''P'' AND NUM_ORDEN = :NUM_ORDEN';
        Params.ByName['EMPRESA'].AsInteger := QMOrdenPagoEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMOrdenPagoEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMOrdenPagoCANAL.AsInteger;
        Params.ByName['NUM_ORDEN'].AsInteger := QMOrdenPagoNUM_ORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMOrdenesDePago.QMOrdenPagoBeforeClose(DataSet: TDataSet);
begin
  xInfoActualizada.Close;
  QMDetalle.Close;
end;

end.
