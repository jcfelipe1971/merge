unit UDMFacturaAlbaranes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, SysUtils, FIBDataSetRO, HYFIBQuery,
  UFMControlErroresFactura, FIBDataSetRW, Controls;

type
  TDMFacturaAlbaranes = class(TDataModule)
     QMAlbaranes: TFIBTableSet;
     DSQMAlbaranes: TDataSource;
     QMAlbaranesRIG: TIntegerField;
     QMAlbaranesCLIENTE: TIntegerField;
     QMAlbaranesCANAL: TIntegerField;
     QMAlbaranesEMPRESA: TIntegerField;
     QMAlbaranesEJERCICIO: TIntegerField;
     QMAlbaranesSERIE: TFIBStringField;
     QMAlbaranesTIPO: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMAlbaranesFECHA: TDateTimeField;
     QMAlbaranesTITULO: TFIBStringField;
     QMAlbaranesCAMPANYA: TIntegerField;
     QMAlbaranesESTADO: TIntegerField;
     QMAlbaranesLIQUIDO: TFloatField;
     QMAlbaranesSU_REFERENCIA: TFIBStringField;
     QMAlbaranesMONEDA: TFIBStringField;
     QMAlbaranesALMACEN: TFIBStringField;
     QMAlbaranesFORMA_PAGO: TFIBStringField;
     QMAlbaranesPROYECTO: TIntegerField;
     QMAlbaranesID_S: TIntegerField;
     QMAlbaranesTOTAL_ANTICIPADO: TFloatField;
     xRecorre: TFIBDataSetRO;
     xProcesar: TFIBDataSetRO;
     xFacturas: TFIBDataSetRO;
     DSxDocumentos: TDataSource;
     xDocumentos: TFIBDataSetRO;
     QMAlbaranesENTRADA_FACTURACION: TIntegerField;
     QMAlbaranesDOCUMENTO_MUESTRAS: TIntegerField;
     QMAlbaranesTIPO_PORTES: TIntegerField;
     QMAlbaranesPOR_PORTES: TFloatField;
     QMAlbaranesI_PORTES: TFloatField;
     QMAlbaranesRANGO: TIntegerField;
     QMAlbaranesINDICE: TIntegerField;
     QMAlbaranesFACTURABLE: TIntegerField;
     QMAlbaranesNOMBRE_COMERCIAL: TFIBStringField;
     QMAlbaranesFOLIO: TIntegerField;
     QMAlbaranesAGENTE: TIntegerField;
     QMAlbaranesPEDIDO_CLIENTE: TFIBStringField;
     QMAlbaranesZ_OBSERVACION: TFIBStringField;
     QMAlbaranesO_COMPRA: TStringField;
     QMAlbaranesDIA_PAGO_1: TIntegerField;
     QMAlbaranesDIA_PAGO_2: TIntegerField;
     QMAlbaranesDIA_PAGO_3: TIntegerField;
     procedure DMFacturaAlbaranesCreate(Sender: TObject);
     procedure QMAlbaranesNewRecord(DataSet: TDataSet);
     procedure QMAlbaranesAfterOpen(DataSet: TDataSet);
     procedure QMAlbaranesENTRADA_FACTURACIONChange(Sender: TField);
     procedure QMAlbaranesBeforePost(DataSet: TDataSet);
     procedure QMAlbaranesCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     // evaluacion: integer;
     // fecha_eval: TDateTime;
     ImporteSeleccionado: double;
     LocalMascaraN: string;
     procedure AbreDocumentos(Contador: integer; Serie: string);
     function AceptaCambioCanal: boolean;
     procedure MuestraDocumentos(Destino, Serie: string; Contador, CanalDestino: integer);
     procedure RefrescaDatos;
  public
     { Public declarations }
     PermitirCerrarFacturasCero: boolean;
     procedure DameMinMaxFechaCliente(var min_fecha, max_fecha: TDateTime; var min_cliente, max_cliente: integer);
     procedure MarcarPorAgrupacion(Agrupacion: string; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     procedure MarcarPorCliente(ClienteIni, ClienteFin: integer; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     procedure MarcarPorFecha(FechaIni, FechaFin: TDateTime; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     procedure MarcarPorFormaPago(FormaPagoIni, FormaPagoFin: string; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     procedure MarcarPorImporte(Importe: double; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     procedure MarcarPorProyecto(Proyecto: integer; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     procedure MarcarTodos(Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; OcultarMuestras: boolean; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     function DameFacturados(Serie: string; Contador: integer): boolean;
     procedure MuestraErrores;
     function HayErrores: boolean;
     procedure FacturaAlbaran(FechaFactura: TDateTime; SerieDestino: string; id_s, proc_auto, Facturacion, D_Canal: integer; Proyecto, Certifica: integer; FechaAlbaran: boolean);
     procedure InicializaFacturacion(var proc_auto, Facturacion: integer; Proyecto, Certifica: integer; FechaAlbaran: boolean);
     procedure TraspasaAlbaran(FechaFactura: TDateTime; id_s, id_s_d, Facturacion: integer; Proyecto, Certifica: integer; FacturaResumida: boolean);
     procedure Final(proc_auto, CanalDestino: integer; serie_fac: string);
     procedure BorraTemporales;
     procedure CierraFacturas(id_s, facturacion: integer; FechaFactura: TDateTime; cerrar: boolean);
     procedure DameMinProyecto(var min_Proyecto: integer);
     procedure CertificaAlbaran(id_s, id_s_d, Facturacion: integer; Proyecto, Certifica: integer);
     procedure RecorreProcesados(Entrada: integer);
     procedure RecorreFacturas(Entrada: integer);
     procedure AbreTabla(Serie: TStrings; PeriodoFacturacion: string; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente, Agente: string; OcultarMuestras: boolean; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
     procedure DameMinAgrupacion(var min_Agrupacion: string);
     procedure Facturar(SerieDestino: string; CanalDestino, Proyecto: integer; aCertifica: boolean; FechaFactura: TDateTime; Cerrar, FacturaResumida, FechaEntregaPrev, FechaAlbaran: boolean);
     function LotesIntroducidosCorrectamente(Proyecto: integer; Certifica: boolean): boolean;
     function NroSerieIntroducidosCorrectamente(Proyecto: integer; Certifica: boolean): boolean;
     function DocumentoTraspasado(Proyecto: integer; Certifica: boolean): boolean;
     function PermitirAlbaranesImporteCero(Proyecto: integer; Certifica: boolean): boolean;
     procedure DameNotasFacturacion(NotasFacturacion: TStrings);
     procedure AsignaEntrada;
     procedure DesmarcarAlbaranes;
     procedure BorraCabecerasSinAsignar(proc_auto, CanalDestino: integer; serie_fac: string);
  end;

var
  DMFacturaAlbaranes : TDMFacturaAlbaranes;

implementation

uses UDMMain, UEntorno, UUtiles, UFMFacturas, UFParada, UFMFacturaAlbaranes,
  UFMain, UFMControlAgrupPedidos, UFormGest, UFParadaExt, UFInfoFacturacionAlb, Dialogs, UParam;

{$R *.DFM}

procedure TDMFacturaAlbaranes.DMFacturaAlbaranesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  QMAlbaranesFECHA.DisplayFormat := ShortDateFormat;
  QMAlbaranesLIQUIDO.DisplayFormat := LocalMascaraN;
  QMAlbaranesTOTAL_ANTICIPADO.DisplayFormat := LocalMascaraN;
  QMAlbaranesI_PORTES.DisplayFormat := LocalMascaraN;
  QMAlbaranesPOR_PORTES.DisplayFormat := MascaraP;
  ImporteSeleccionado := 0;
  FMFacturaAlbaranes.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT CIERRA_DOC_CERO FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        PermitirCerrarFacturasCero := (FieldByName['CIERRA_DOC_CERO'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Me apropio de las marcas de otros
  if (DMMain.EstadoKri(473) <> 0) then
     AsignaEntrada;
end;

procedure TDMFacturaAlbaranes.QMAlbaranesNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFacturaAlbaranes.DameMinMaxFechaCliente(var min_fecha, max_fecha: TDateTime; var min_cliente, max_cliente: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DAME_MIN_MAX_FECHA_CLIENTE_DOC(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi no tiene en cuenta la serie
        Params.ByName['TIPO'].AsString := 'ALB';
        ExecQuery;
        min_fecha := FieldByName['MINIMO_FECHA'].AsDateTime;
        max_fecha := FieldByName['MAXIMO_FECHA'].AsDateTime;
        min_cliente := FieldByName['MINIMO_CLIENTE'].AsInteger;
        max_cliente := FieldByName['MAXIMO_CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturaAlbaranes.MarcarTodos(Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; OcultarMuestras: boolean; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_MARCAR_ALBARANES_TODO( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :MODO, :DESDE_FECHA, :HASTA_FECHA, :DESDE_FORMA_PAGO, :HASTA_FORMA_PAGO, ');
        SQL.Add(' :DESDE_CLIENTE, :HASTA_CLIENTE, :PERIODO_FACTURACION, :ENTRADA, :IGNORAR_MUESTRAS, ');
        SQL.Add(' :DESDE_DIA_PAGO, :HASTA_DIA_PAGO, :SIN_DIA_PAGO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi llamara recursivamente a las series seleccionadas en Multiserie
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
        Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, -2147483648);
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 2147483647);
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['IGNORAR_MUESTRAS'].AsInteger := BoolToInt(OcultarMuestras);
        Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
        Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
        Params.ByName['SIN_DIA_PAGO'].AsInteger := BoolToInt(SinDiaPago);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturaAlbaranes.MarcarPorFecha(FechaIni, FechaFin: TDateTime; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_MARCAR_ALBARANES_POR_FECHA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :FECHA_INI, :FECHA_FIN, :MODO, ');
        SQL.Add(' :DESDE_FECHA, :HASTA_FECHA, :DESDE_FORMA_PAGO, :HASTA_FORMA_PAGO, :DESDE_CLIENTE, :HASTA_CLIENTE, :PERIODO_FACTURACION, :ENTRADA, ');
        SQL.Add(' :DESDE_DIA_PAGO, :HASTA_DIA_PAGO, :SIN_DIA_PAGO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi llamara recursivamente a las series seleccionadas en Multiserie
        Params.ByName['FECHA_INI'].AsDateTime := HourIntoDate(FechaIni, '00:00:00');
        Params.ByName['FECHA_FIN'].AsDateTime := HourIntoDate(FechaFin, '23:59:59');
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
        Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, -2147483648);
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 2147483647);
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
        Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
        Params.ByName['SIN_DIA_PAGO'].AsInteger := BoolToInt(SinDiaPago);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturaAlbaranes.MarcarPorCliente(ClienteIni, ClienteFin: integer; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_MARCAR_ALBARANES_POR_CLIENTE (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTE_INI, :CLIENTE_FIN, :MODO, ');
        SQL.Add(' :DESDE_FECHA, :HASTA_FECHA, :DESDE_FORMA_PAGO, :HASTA_FORMA_PAGO, :DESDE_CLIENTE, :HASTA_CLIENTE, :PERIODO_FACTURACION, :ENTRADA, ');
        SQL.Add(' :DESDE_DIA_PAGO, :HASTA_DIA_PAGO, :SIN_DIA_PAGO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi llamara recursivamente a las series seleccionadas en Multiserie
        Params.ByName['CLIENTE_INI'].AsInteger := ClienteIni;
        Params.ByName['CLIENTE_FIN'].AsInteger := ClienteFin;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
        Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, -2147483648);
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 2147483647);
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
        Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
        Params.ByName['SIN_DIA_PAGO'].AsInteger := BoolToInt(SinDiaPago);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturaAlbaranes.AbreDocumentos(Contador: integer; Serie: string);
begin
  // Comprobamos si existen documentos facturados
  if (DameFacturados(Serie, Contador)) then
  begin
     FMain.EjecutaAccion(FMain.AFacturas);
     FMFacturas.AgrupacionPedidosFac(Serie, Contador);
  end;
end;

function TDMFacturaAlbaranes.HayErrores: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT COUNT(*) FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = ?ENTRADA');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMFacturaAlbaranes.DameFacturados(Serie: string; Contador: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT VER.* FROM VER_CABECERAS_FACTURA VER ');
        SQL.Add(' JOIN TMP_PROCESOS_AUTO TMP ');
        SQL.Add(' ON ');
        SQL.Add(' VER.EMPRESA = TMP.EMPRESA AND ');
        SQL.Add(' VER.EJERCICIO = TMP.EJERCICIO AND ');
        SQL.Add(' VER.CANAL = TMP.CANAL AND ');
        SQL.Add(' VER.SERIE = TMP.SERIE AND ');
        SQL.Add(' VER.TIPO = TMP.TIPO AND ');
        SQL.Add(' VER.RIG = TMP.RIG ');
        SQL.Add(' WHERE ');
        SQL.Add(' VER.EMPRESA = :EMPRESA AND ');
        SQL.Add(' VER.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' VER.CANAL = :CANAL AND ');
        SQL.Add(' VER.SERIE = :SERIE AND ');
        SQL.Add(' VER.TIPO = ''FAC'' AND ');
        SQL.Add(' TMP.CONTADOR = :CONTADOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['CONTADOR'].AsInteger := Contador;
        ExecQuery;
        Result := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturaAlbaranes.MuestraErrores;
begin
  FMControlErroresFactura := TFMControlErroresFactura.Create(Self);
  FMControlErroresFactura.ShowModal;
  FMControlErroresFactura.Free;
end;

procedure TDMFacturaAlbaranes.FacturaAlbaran(FechaFactura: TDateTime; SerieDestino: string; id_s, proc_auto, Facturacion, D_Canal: integer; Proyecto, Certifica: integer; FechaAlbaran: boolean);
var
  Q : THYFIBQuery;
begin
  DMMain.LogIni('FacturaAlbaran');

  if (REntorno.PAis = 'CHL') then
     DMMain.ReNumerarOrdenDetalleVenta(id_s);

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ALBARANES_PROCESA_ALB(:EMPRESA, :EJERCICIO, :CANAL, :SERIE_DST, :FECHA, :ENTRADA, :ID_S, :FACTURACION, :PROC_AUTO, :D_CANAL, :PROYECTO, :CERTIFICA, :FACTURAR_FECHA_ALBARAN)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE_DST'].AsString := SerieDestino;
        Params.ByName['FECHA'].AsDateTime := FechaFactura + Frac(REntorno.FechaTrab);
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        Params.ByName['PROC_AUTO'].AsInteger := proc_auto;
        Params.ByName['D_CANAL'].AsInteger := D_Canal;
        Params.ByName['PROYECTO'].AsInteger := Proyecto;
        Params.ByName['CERTIFICA'].AsInteger := Certifica;
        Params.ByName['FACTURAR_FECHA_ALBARAN'].AsInteger := BoolToInt(FechaAlbaran);
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat
              until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.LogFin('FacturaAlbaran');
end;

procedure TDMFacturaAlbaranes.InicializaFacturacion(var proc_auto, Facturacion: integer; Proyecto, Certifica: integer; FechaAlbaran: boolean);
begin
  DMMain.LogIni('InicializaFacturacion');
  BorraTemporales;

  // Creamos proceso de facturacion
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_FACTURA_ALBARANES_PROC_AUTO (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        proc_auto := FieldByName['PROC_AUTO'].AsInteger;
        Facturacion := FieldByName['FACTURACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  { TODO : xRecorre - habría que ver si se puede cambiar por un select normal }
  with xRecorre do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ID_S, EJERCICIODEV AS EJERCICIO, CANALDEV AS CANAL, SERIEDEV AS SERIE, RIG ');
     SelectSQL.Add(' FROM G_FACTURA_ALBARANES_RECORRE (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ENTRADA, ?PROYECTO, ?CERTIFICA) ');
     // Orden por defecto segun el procedimiento es C.PROYECTO, C.CLIENTE, C.FECHA, A.DEVOLUCION_DEPOSITO DESC
     if FechaAlbaran then
        SelectSQL.Add(' ORDER BY FECHA, SERIEDEV, RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := ' '; // Recorre sin tener en cuenta la serie
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['PROYECTO'].AsInteger := Proyecto;
     Params.ByName['CERTIFICA'].AsInteger := Certifica;
     Open;
     Last;
     First;
  end;

  DMMain.LogFin('InicializaFacturacion');
end;

procedure TDMFacturaAlbaranes.TraspasaAlbaran(FechaFactura: TDateTime; id_s, id_s_d, Facturacion: integer; Proyecto, Certifica: integer; FacturaResumida: boolean);
var
  Q : THYFIBQuery;
begin
  DMMain.LogIni('TraspasaAlbaran');

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ALBARANES_FACTURA(:ID_S, :ID_S_D, :FECHA, :ENTRADA, :FACTURACION, :PROYECTO, :CERTIFICA, :FACTURA_RESUMIDA)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ID_S_D'].AsInteger := id_s_d;
        Params.ByName['FECHA'].AsDateTime := FechaFactura + Frac(REntorno.FechaTrab);
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PROYECTO'].AsInteger := Proyecto;
        Params.ByName['CERTIFICA'].AsInteger := Certifica;
        Params.ByName['FACTURA_RESUMIDA'].AsInteger := BoolToInt(FacturaResumida);
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat
              until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.LogFin('TraspasaAlbaran');
end;

procedure TDMFacturaAlbaranes.Final(proc_auto, CanalDestino: integer; serie_fac: string);
begin
  DMMain.LogIni('Final');
  xRecorre.Close;
  xProcesar.Close;
  xFacturas.Close;
  if HayErrores then
     MuestraErrores;
  RefrescaDatos;

  if (REntorno.Canal = CanalDestino) then
     AbreDocumentos(proc_auto, serie_fac)
  else
     MuestraDocumentos('FAC', Serie_fac, proc_auto, CanalDestino);
  DMMain.LogFin('Final');
end;

procedure TDMFacturaAlbaranes.BorraTemporales;
begin
  DMMain.LogIni('BorraTemporales');
  // Borramos tablas de errores y agrupacion
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_FACTURA_ALBARANES WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
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
        SQL.Text := 'DELETE FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  DMMain.LogFin('BorraTemporales');
end;

procedure TDMFacturaAlbaranes.CierraFacturas(id_s, Facturacion: integer; FechaFactura: TDateTime; Cerrar: boolean);
var
  Q : THYFIBQuery;
begin
  DMMain.LogIni('CierraFacturas');

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ALBARANES_CIERRA(:ID_S, :EMPRESA, :EJERCICIO, :CANAL, :FACTURACION, :ENTRADA, :FECHA, :CERRAR)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := FechaFactura + Frac(REntorno.FechaTrab);
        Params.ByName['CERRAR'].AsInteger := integer(Cerrar);
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat
              until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.LogFin('CierraFacturas');
end;

procedure TDMFacturaAlbaranes.QMAlbaranesAfterOpen(DataSet: TDataSet);
begin
  ImporteSeleccionado := 0;

  with DataSet do
  begin
     try
        DisableControls;
        if RecordCount > 0 then
        begin
           while not EOF do
           begin
              if (QMAlbaranesENTRADA_FACTURACION.AsInteger <> 0) then
                 ImporteSeleccionado := ImporteSeleccionado + QMAlbaranesLIQUIDO.AsFloat;
              Next;
           end;
           First;
        end;
     finally
        EnableControls;
     end;
  end;

  FMFacturaAlbaranes.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
end;

procedure TDMFacturaAlbaranes.MuestraDocumentos(Destino, Serie: string; Contador, CanalDestino: integer);
begin
  with xDocumentos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := destino;
     Params.ByName['CONTADOR'].AsInteger := contador;
     Open;
  end;

  if (AceptaCambioCanal) then
  begin
     xDocumentos.Close;
     CierraFormsMenos(FMFacturaAlbaranes);
     FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, CanalDestino);
     AbreDocumentos(Contador, Serie);
     FMFacturaAlbaranes.Close;
  end;
end;

function TDMFacturaAlbaranes.AceptaCambioCanal: boolean;
begin
  FMControlAgrupPedidos := TFMControlAgrupPedidos.Create(DMFacturaAlbaranes);
  FMControlAgrupPedidos.AsignaDataSource(DMFacturaAlbaranes.DSxDocumentos);
  Result := (FMControlAgrupPedidos as TFMControlAgrupPedidos).Inicializa;
  FMControlAgrupPedidos.Free;
end;

procedure TDMFacturaAlbaranes.DameMinProyecto(var min_Proyecto: integer);
begin
  // Devuelve el proyecto que tiene la cabecera del albaran,
  // sino tiene o no hay albaran, Devuelve el minimo proyecto filtrado por empresa
  if (QMAlbaranesPROYECTO.AsInteger > 0) then
     min_Proyecto := QMAlbaranesPROYECTO.AsInteger
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MIN(PROYECTO) FROM EMP_PROYECTOS WHERE EMPRESA = :EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;
           min_Proyecto := FieldByName['MIN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturaAlbaranes.MarcarPorProyecto(Proyecto: integer; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_MARCAR_ALBARANES_POR_PROYECTO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PROYECTO, :MODO, ');
        SQL.Add(' :DESDE_FECHA, :HASTA_FECHA, :DESDE_FORMA_PAGO, :HASTA_FORMA_PAGO, :DESDE_CLIENTE, :HASTA_CLIENTE, :PERIODO_FACTURACION, :ENTRADA, ');
        SQL.Add(' :DESDE_DIA_PAGO, :HASTA_DIA_PAGO, :SIN_DIA_PAGO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi llamara recursivamente a las series seleccionadas en Multiserie
        Params.ByName['PROYECTO'].AsInteger := Proyecto;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
        Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, -2147483648);
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 2147483647);
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
        Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
        Params.ByName['SIN_DIA_PAGO'].AsInteger := BoolToInt(SinDiaPago);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturaAlbaranes.CertificaAlbaran(id_s, id_s_d, Facturacion: integer; Proyecto, Certifica: integer);
var
  Q : THYFIBQuery;
begin
  DMMain.LogIni('CertificaAlbaran');
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ALBARANES_CERTIFICA(:ENTRADA, :PROYECTO, :FACTURACION, :ID_S, :ID_S_D)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['ID_S_D'].AsInteger := id_s_d;
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PROYECTO'].AsInteger := Proyecto;
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat
              until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.LogFin('CertificaAlbaran');
end;

procedure TDMFacturaAlbaranes.RecorreProcesados(Entrada: integer);
begin
  DMMain.LogIni('RecorreProcesados');
  with xProcesar do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := Entrada;
     Open;
  end;
  DMMain.LogFin('RecorreProcesados');
end;

procedure TDMFacturaAlbaranes.RecorreFacturas(Entrada: integer);
begin
  DMMain.LogIni('RecorreFacturas');
  with xFacturas do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := Entrada;
     Open;
  end;
  DMMain.LogFin('RecorreFacturas');
end;

procedure TDMFacturaAlbaranes.AbreTabla(Serie: TStrings; PeriodoFacturacion: string; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente, Agente: string; OcultarMuestras: boolean; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  DMMain.LogIni('AbreTabla');
  with QMAlbaranes do
  begin
     if Active then
        Close;
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ALMACEN, CLIENTE, FECHA, TITULO, NOMBRE_COMERCIAL, CAMPANYA, ');
     SelectSQL.Add(' ESTADO, LIQUIDO, SU_REFERENCIA, MONEDA, FORMA_PAGO, PROYECTO, ID_S, TOTAL_ANTICIPADO, ENTRADA_FACTURACION, ');
     SelectSQL.Add(' DOCUMENTO_MUESTRAS, TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE, FACTURABLE, FOLIO, AGENTE, ');
     SelectSQL.Add(' PEDIDO_CLIENTE, Z_OBSERVACION, DIA_PAGO_1, DIA_PAGO_2, DIA_PAGO_3 ');
     SelectSQL.Add(' FROM VER_CABECERAS_ALBARAN ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO > 2001 AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' TIPO = ''ALB'' AND ');
     SelectSQL.Add(' ESTADO <> 2 AND ESTADO <> 5 AND ESTADO <> 6 AND ');
     SelectSQL.Add(' ((EJERCICIO = :EJERCICIO) OR (EJERCICIO < :EJERCICIO)) AND ');
     SelectSQL.Add(' GARANTIA = 0 AND');
     SelectSQL.Add(' FECHA >= :DESDE_FECHA AND ');
     SelectSQL.Add(' FECHA <= :HASTA_FECHA AND ');
     SelectSQL.Add(' ((DIA_PAGO_1 BETWEEN :DESDE_DIA_PAGO AND :HASTA_DIA_PAGO) OR ');
     SelectSQL.Add('  (DIA_PAGO_2 BETWEEN :DESDE_DIA_PAGO AND :HASTA_DIA_PAGO) OR ');
     SelectSQL.Add('  (DIA_PAGO_3 BETWEEN :DESDE_DIA_PAGO AND :HASTA_DIA_PAGO) ');
     if (SinDiaPago) then
        SelectSQL.Add(' OR (DIA_PAGO_1 = 0 AND DIA_PAGO_2 = 0 AND DIA_PAGO_3 = 0) ');
     SelectSQL.Add(' ) ');
     if (DesdeFormaPago <> '') then
        SelectSQL.Add(' AND FORMA_PAGO >= :DESDE_FORMA_PAGO ');
     if (HastaFormaPago <> '') then
        SelectSQL.Add(' AND FORMA_PAGO <= :HASTA_FORMA_PAGO ');
     if (DesdeCliente <> '') then
        SelectSQL.Add(' AND CLIENTE >= :DESDE_CLIENTE ');
     if (HastaCliente <> '') then
        SelectSQL.Add(' AND CLIENTE <= :HASTA_CLIENTE ');
     if (Agente <> '') then
        SelectSQL.Add(' AND AGENTE = :AGENTE ');
     if (Trim(PeriodoFacturacion) <> '') then
     begin
        SelectSQL.Add(' AND ');
        SelectSQL.Add(' CLIENTE IN (SELECT CLIENTE ');
        SelectSQL.Add('             FROM EMP_CLIENTES ');
        SelectSQL.Add('             WHERE ');
        SelectSQL.Add('             EMPRESA = :EMPRESA AND ');
        SelectSQL.Add('             PERIODO_FACTURACION = :PERIODO_FACTURACION) ');
     end;
     if (Serie.Count > 0) then
        SelectSQL.Add(' AND SERIE IN ' + Serie.Text);
     if OcultarMuestras then
        SelectSQL.Add(' AND DOCUMENTO_MUESTRAS <> 1 ');

     if (LeeParametro('ALBTRAS010') = 'S') then
        SelectSQL.Add(' AND LIQUIDO <> 0 ');

     if (REntorno.Pais = 'CHL') then
     begin
        if (LeeParametro('ALBTRAS006') = 'S') then
        begin
           // Filtramos las guias de despacho que tengan folio y una referencia de orden de compra
           SelectSQL.Add(' AND FOLIO > 0 ');
           SelectSQL.Add(' AND TIPO_DOC_TRIBUTARIO = ''52'' ');
           SelectSQL.Add(' AND ID_S IN (SELECT ID_S FROM SII_DTE_REFERENCIA ');
           SelectSQL.Add('              WHERE ');
           SelectSQL.Add('              TPODOCREF = ''801'') ');
        end;
     end;
     {
     else
        SelectSQL.Add(' AND SERIE = '''' ');
     }
     if (LeeParametro('ALBTRAS008') = 'S') then
        SelectSQL.Add(' ORDER BY EXTRACT(YEAR FROM FECHA), EXTRACT(YEARDAY FROM FECHA), SERIE, RIG')
     else
        SelectSQL.Add(' ORDER BY EJERCICIO, SERIE, RIG');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := HourIntoDate(FechaHasta, '23:59:59');
     Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
     Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
     if (DesdeFormaPago <> '') then
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
     if (HastaFormaPago <> '') then
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
     if (DesdeCliente <> '') then
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, 0);
     if (HastacLIENTE <> '') then
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 0);
     if (Agente <> '') then
        Params.ByName['AGENTE'].AsInteger := StrToIntDef(Agente, 0);
     if (Trim(PeriodoFacturacion) <> '') then
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
     // if (Serie <> ' ') then
     //    Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
  DMMain.LogFin('AbreTabla');
end;

procedure TDMFacturaAlbaranes.DameMinAgrupacion(var min_Agrupacion: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(AGRUPACION) FROM SYS_AGRUPACIONES WHERE TIPO = ''C''';
        ExecQuery;
        min_agrupacion := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturaAlbaranes.MarcarPorAgrupacion(Agrupacion: string; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_MARCAR_ALBARANES_POR_AGR (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :AGRUPACION, :MODO, ');
        SQL.Add(' :DESDE_FECHA, :HASTA_FECHA, :DESDE_FORMA_PAGO, :HASTA_FORMA_PAGO, :DESDE_CLIENTE, :HASTA_CLIENTE, :PERIODO_FACTURACION, :ENTRADA, ');
        SQL.Add(' :DESDE_DIA_PAGO, :HASTA_DIA_PAGO, :SIN_DIA_PAGO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi llamara recursivamente a las series seleccionadas en Multiserie
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
        Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, -2147483648);
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 2147483647);
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
        Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
        Params.ByName['SIN_DIA_PAGO'].AsInteger := BoolToInt(SinDiaPago);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturaAlbaranes.Facturar(SerieDestino: string; CanalDestino, Proyecto: integer; aCertifica: boolean; FechaFactura: TDateTime; Cerrar, FacturaResumida, FechaEntregaPrev, FechaAlbaran: boolean);
var
  id_s, id_s_d, proc_auto, Facturacion, Certifica : integer;
  ejercicio, Canal, rig : integer;
  seriedev : string;
  WndList : Pointer;
  TiempoUltimaFactura : TDateTime;
begin
  DMMain.LogIni('Facturar');
  Screen.Cursor := crHourGlass;

  // Me posiciono en el proximo registro no marcado para reposicionar después de generar factuaras
  with QMAlbaranes do
  begin
     DisableControls;
     try
        while ((not EOF) and (QMAlbaranesENTRADA_FACTURACION.AsInteger <> 0)) do
           Next;

        // Si no encuentro un registro busco hacia atras
        if (QMAlbaranesENTRADA_FACTURACION.AsInteger <> 0) then
           while ((not BOF) and (QMAlbaranesENTRADA_FACTURACION.AsInteger <> 0)) do
              Prior;
     finally
        EnableControls;
     end;
  end;

  Certifica := BoolToInt(aCertifica);

  FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
  WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);

  try
     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Inicializando Facturación ...');
        GBProcesaCab.Visible := False;
        Show;
     end;

     Application.ProcessMessages;

     FInfoFacturacionAlb.LBLGeneral.Caption := _('Creando Fac. Destino ...');
     FInfoFacturacionAlb.GBProcesaCab.Visible := True;

     // Recorriendo y creando cabeceras
     InicializaFacturacion(proc_auto, Facturacion, Proyecto, Certifica, FechaAlbaran);
     TiempoUltimaFactura := Now;
     with xRecorre do
     begin
        First;
        while not EOF do
        begin
           id_s := FieldByName('ID_S').AsInteger;
           ejercicio := FieldByName('EJERCICIO').AsInteger;
           Canal := FieldByName('CANAL').AsInteger;
           seriedev := FieldByName('SERIE').AsString;
           rig := FieldByName('RIG').AsInteger;

           with FInfoFacturacionAlb do
           begin
              Caption := _('Información de Facturación') + ' (' + FormatDateTime('hh:nn:ss', Now - TiempoUltimaFactura) + ')';
              TiempoUltimaFactura := Now;
              LBLEjercicio.Caption := IntToStr(Ejercicio);
              LBLCanal.Caption := IntToStr(Canal);
              LBLSerie.Caption := SerieDev;
              LBLRig.Caption := IntToStr(Rig);
           end;
           Application.ProcessMessages;

           FacturaAlbaran(FechaFactura, SerieDestino, id_s, proc_auto, Facturacion, CanalDestino, Proyecto, Certifica, FechaAlbaran);

           Application.ProcessMessages;
           Next;
        end;
        Close;
     end;

     // Recorrer los grupos generados
     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Traspasando Albaranes');
        GBProcesaCab.Caption := _('Traspasando Albaran :');
     end;

     RecorreProcesados(REntorno.Entrada);
     with xProcesar do
     begin
        First;
        while not EOF do
        begin
           id_s := FieldByName('ID_S').AsInteger;
           ejercicio := FieldByName('EJERCICIO').AsInteger;
           Canal := FieldByName('CANAL').AsInteger;
           seriedev := FieldByName('SERIE').AsString;
           rig := FieldByName('RIG').AsInteger;
           id_s_d := FieldByName('ID_S_D').AsInteger;

           with FInfoFacturacionAlb do
           begin
              Caption := _('Información de Facturación') + ' (' + FormatDateTime('hh:nn:ss', Now - TiempoUltimaFactura) + ')';
              TiempoUltimaFactura := Now;
              LBLEjercicio.Caption := IntToStr(Ejercicio);
              LBLCanal.Caption := IntToStr(Canal);
              LBLSerie.Caption := SerieDev;
              LBLRig.Caption := IntToStr(Rig);
           end;

           Application.ProcessMessages;
           TraspasaAlbaran(FechaFactura, id_s, id_s_d, Facturacion, Proyecto, Certifica, FacturaResumida);
           Application.ProcessMessages;
           Next;
        end;
        Close;
     end;

     // Crear las Certificaciones
     if (Certifica = 1) then
     begin
        with FInfoFacturacionAlb do
        begin
           LBLGeneral.Caption := _('Certificando Facturas :');
           GBProcesaCab.Caption := _('Certificando Facturas :');
        end;

        RecorreProcesados(REntorno.Entrada);
        with xProcesar do
        begin
           First;
           while not EOF do
           begin
              id_s := FieldByName('ID_S').AsInteger;
              ejercicio := FieldByName('EJERCICIO').AsInteger;
              Canal := FieldByName('CANAL').AsInteger;
              seriedev := FieldByName('SERIE').AsString;
              rig := FieldByName('RIG').AsInteger;
              id_s_d := FieldByName('ID_S_D').AsInteger;

              with FInfoFacturacionAlb do
              begin
                 Caption := _('Información de Facturación') + ' (' + FormatDateTime('hh:nn:ss', Now - TiempoUltimaFactura) + ')';
                 TiempoUltimaFactura := Now;
                 LBLEjercicio.Caption := IntToStr(Ejercicio);
                 LBLCanal.Caption := IntToStr(Canal);
                 LBLSerie.Caption := SerieDev;
                 LBLRig.Caption := IntToStr(Rig);
              end;
              Application.ProcessMessages;
              CertificaAlbaran(id_s, id_s_d, Facturacion, Proyecto, Certifica);
              Application.ProcessMessages;
              Next;
           end;
           Close;
        end;
     end;

     // Cerrar las facturas si toca
     with FInfoFacturacionAlb do
     begin
        if (Cerrar) then
           LBLGeneral.Caption := _('Cerrando Facturas')
        else
           LBLGeneral.Caption := _('Terminando Proceso');

        LBLEjercicio.Caption := IntToStr(REntorno.Ejercicio);
        LBLCanal.Caption := IntToStr(CanalDestino);
        GBProcesaCab.Caption := _('Procesando Factura:');
     end;
     Application.ProcessMessages;

     RecorreFacturas(REntorno.Entrada);
     with xFacturas do
     begin
        First;
        while not EOF do
        begin
           ejercicio := FieldByName('EJERCICIO').AsInteger;
           Canal := FieldByName('CANAL').AsInteger;
           seriedev := FieldByName('SERIE').AsString;
           rig := FieldByName('RIG').AsInteger;
           id_s_d := FieldByName('ID_S_D').AsInteger;

           with FInfoFacturacionAlb do
           begin
              Caption := _('Información de Facturación') + ' (' + FormatDateTime('hh:nn:ss', Now - TiempoUltimaFactura) + ')';
              TiempoUltimaFactura := Now;
              LBLEjercicio.Caption := IntToStr(Ejercicio);
              LBLCanal.Caption := IntToStr(Canal);
              LBLSerie.Caption := SerieDev;
              LBLRig.Caption := IntToStr(Rig);
           end;
           Application.ProcessMessages;
           CierraFacturas(id_s_d, Facturacion, FechaFactura, Cerrar);
           Application.ProcessMessages;
           Next;
        end;
        Close;
     end;
  finally
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);
     FInfoFacturacionAlb.Close;
     Application.ProcessMessages;
     Final(proc_auto, CanalDestino, SerieDev);
     BorraTemporales;
     BorraCabecerasSinAsignar(proc_auto, CanalDestino, SerieDev);
     Application.ProcessMessages;
  end;
  DMMain.LogFin('Facturar');
end;

function TDMFacturaAlbaranes.LotesIntroducidosCorrectamente(Proyecto: integer; Certifica: boolean): boolean;
var
  Rig, Linea : integer;
  Serie, Articulo : string;
  Diferencia : double;
begin
  Result := True;

  if (LeeParametro('ALBFACT004') = 'S') then
  begin
     with xRecorre do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PROYECTO'].AsInteger := Proyecto;
        Params.ByName['CERTIFICA'].AsInteger := BoolToInt(Certifica);
        Open;
        First;
        while not EOF do
        begin
           // Busco alguna linea en donde la cantidad de lotes asignados sea diferente de las unidades de la linea
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Transaction := TFIBTransaction.Create(nil);
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    with Transaction do
                    begin
                       DefaultDatabase := DMMain.DataBase;
                       TRParams.Clear;
                       TRParams.Add('read_committed');
                       TRParams.Add('read');
                       if (not InTransaction) then
                          StartTransaction;
                    end;
                    SelectSQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA, D.ARTICULO, ');
                    SelectSQL.Add(' (D.UNIDADES - (SELECT COALESCE(SUM(CANTIDAD), 0) ');
                    SelectSQL.Add('                FROM GES_DETALLES_S_LOTES L ');
                    SelectSQL.Add('                WHERE ');
                    SelectSQL.Add('                D.ID_DETALLES_S = L.ID_DETALLES_S)) DIFERENCIA ');
                    SelectSQL.Add(' FROM GES_DETALLES_S D ');
                    SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' D.ID_S = :ID_S AND ');
                    SelectSQL.Add(' A.LOTES = 1 AND ');
                    SelectSQL.Add(' A.CONTROL_STOCK = 1 AND ');
                    SelectSQL.Add(' D.UNIDADES <> (SELECT COALESCE(SUM(CANTIDAD), 0) ');
                    SelectSQL.Add('                FROM GES_DETALLES_S_LOTES L ');
                    SelectSQL.Add('                WHERE ');
                    SelectSQL.Add('                D.ID_DETALLES_S = L.ID_DETALLES_S) ');
                    Params.ByName['ID_S'].AsInteger := xRecorre.FieldByName('ID_S').AsInteger;
                    Open;

                    // Si encuentro algo es qye faltan/sobran lotes
                    while not EOF do
                    begin
                       Articulo := FieldByName('ARTICULO').AsString;
                       Serie := FieldByName('SERIE').AsString;
                       Rig := FieldByName('RIG').AsInteger;
                       Linea := FieldByName('LINEA').AsInteger;
                       Diferencia := FieldByName('DIFERENCIA').AsFloat;

                       if (Rig <> 0) and (Abs(Diferencia) > 0.001) then
                       begin
                          Result := False;

                          if (
                             MessageDlg(
                             Format(
                             _('El albaran %s/%d en la linea %d (art. %s) no tiene los lotes completamente asignados (%8.2n)'), [Serie, Rig, Linea, Articulo, Diferencia]
                             ), mtError, [mbOK, mbCancel], 0
                             ) = mrCancel
                             ) then
                          begin
                             // Vamos al último registro para no controlar nada mas.
                             Last;
                             xRecorre.Last;
                          end;
                       end;

                       Next;
                    end;
                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              finally
                 Free;
              end;
           end;

           Next;
        end;
        Close;
     end;
  end;
end;

function TDMFacturaAlbaranes.NroSerieIntroducidosCorrectamente(Proyecto: integer; Certifica: boolean): boolean;
var
  Rig, Linea : integer;
  Serie, Articulo : string;
  Diferencia : double;
begin
  Result := True;

  if (LeeParametro('ALBFACT003') = 'S') then
  begin
     with xRecorre do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PROYECTO'].AsInteger := Proyecto;
        Params.ByName['CERTIFICA'].AsInteger := BoolToInt(Certifica);
        Open;
        First;
        while not EOF do
        begin
           // Busco alguna linea en donde la cantidad de lotes asignados sea diferente de las unidades de la linea
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Transaction := TFIBTransaction.Create(nil);
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    with Transaction do
                    begin
                       DefaultDatabase := DMMain.DataBase;
                       TRParams.Clear;
                       TRParams.Add('read_committed');
                       TRParams.Add('read');
                       if (not InTransaction) then
                          StartTransaction;
                    end;
                    SelectSQL.Add(' SELECT D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA, D.ARTICULO, ');
                    SelectSQL.Add('        (ABS(D.UNIDADES) - (SELECT COUNT(*) ');
                    SelectSQL.Add('                            FROM GES_DETALLES_SERIALIZACION ');
                    SelectSQL.Add('                            WHERE ');
                    SelectSQL.Add('                            EMPRESA = D.EMPRESA AND ');
                    SelectSQL.Add('                            EJERCICIO = D.EJERCICIO AND ');
                    SelectSQL.Add('                            CANAL = D.CANAL AND ');
                    SelectSQL.Add('                            SERIE = D.SERIE AND ');
                    SelectSQL.Add('                            TIPO = D.TIPO AND ');
                    SelectSQL.Add('                            RIG = D.RIG AND ');
                    SelectSQL.Add('                            LINEA = D.LINEA)) DIFERENCIA ');
                    SelectSQL.Add(' FROM GES_DETALLES_S D ');
                    SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' D.ID_S = :ID_S AND ');
                    SelectSQL.Add(' A.SERIALIZADO = 1 AND ');
                    SelectSQL.Add(' A.CONTROL_STOCK = 1 AND ');
                    SelectSQL.Add(' (ABS(D.UNIDADES) <> (SELECT COUNT(*) ');
                    SelectSQL.Add('                      FROM GES_DETALLES_SERIALIZACION ');
                    SelectSQL.Add('                      WHERE ');
                    SelectSQL.Add('                      EMPRESA = D.EMPRESA AND ');
                    SelectSQL.Add('                      EJERCICIO = D.EJERCICIO AND ');
                    SelectSQL.Add('                      CANAL = D.CANAL AND ');
                    SelectSQL.Add('                      SERIE = D.SERIE AND ');
                    SelectSQL.Add('                      TIPO = D.TIPO AND ');
                    SelectSQL.Add('                      RIG = D.RIG AND ');
                    SelectSQL.Add('                      LINEA = D.LINEA)) ');
                    Params.ByName['ID_S'].AsInteger := xRecorre.FieldByName('ID_S').AsInteger;
                    Open;

                    // Si encuentro algo es que faltan/sobran lotes
                    while not EOF do
                    begin
                       Articulo := FieldByName('ARTICULO').AsString;
                       Serie := FieldByName('SERIE').AsString;
                       Rig := FieldByName('RIG').AsInteger;
                       Linea := FieldByName('LINEA').AsInteger;
                       Diferencia := FieldByName('DIFERENCIA').AsFloat;

                       if (Rig <> 0) and (Abs(Diferencia) > 0.001) then
                       begin
                          Result := False;

                          if (
                             MessageDlg(
                             Format(
                             _('El albaran %s/%d en la linea %d (art. %s) no tiene los nros. de serie completamente asignados (%8.2n)'), [Serie, Rig, Linea, Articulo, Diferencia]
                             ), mtError, [mbOK, mbCancel], 0
                             ) = mrCancel
                             ) then
                          begin
                             // Vamos al último registro para no controlar nada mas.
                             Last;
                             xRecorre.Last;
                          end;
                       end;

                       Next;
                    end;
                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              finally
                 Free;
              end;
           end;

           Next;
        end;
        Close;
     end;
  end;
end;

function TDMFacturaAlbaranes.DocumentoTraspasado(Proyecto: integer; Certifica: boolean): boolean;
var
  id_s_d, Rig : integer;
  s, Serie : string;
begin
  Result := True;

  with xRecorre do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := ' ';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['PROYECTO'].AsInteger := Proyecto;
     Params.ByName['CERTIFICA'].AsInteger := BoolToInt(Certifica);
     Open;
     First;
     while not EOF do
     begin
        Serie := FieldByName('SERIE').AsString;
        Rig := FieldByName('RIG').AsInteger;

        // Busco alguna linea que ya esté traspasada a factura
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT FIRST 1 D_ID_S, D_TIPO || ''-'' || D_EJERCICIO || ''-'' || D_SERIE || ''/'' || D_RIG AS DESTINO ');
              SQL.Add(' FROM GES_CABECERAS_RELACIONES ');
              SQL.Add(' WHERE ');
              SQL.Add(' O_ID_S = :ID_S AND ');
              SQL.Add(' O_TIPO = ''ALB'' AND ');
              SQL.Add(' D_TIPO = ''FAC'' ');
              SQL.Add(' ORDER BY D_ID_S ');
              Params.ByName['ID_S'].AsInteger := xRecorre.FieldByName('ID_S').AsInteger;
              ExecQuery;
              id_s_d := FieldByName['D_ID_S'].AsInteger;
              s := FieldByName['DESTINO'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (id_s_d > 0) then
        begin
           Result := False;

           MessageDlg(
              Format(
              _('El albaran %s/%d ya ha sido traspasado al documento %s'), [Serie, Rig, s]
              ), mtError, [mbOK, mbCancel], 0
              );
        end;

        Next;
     end;
     Close;
  end;
end;

procedure TDMFacturaAlbaranes.RefrescaDatos;
begin
  Refrescar(QMAlbaranes, 'ID_S', QMAlbaranesID_S.AsInteger, False, True);
end;

procedure TDMFacturaAlbaranes.DameNotasFacturacion(NotasFacturacion: TStrings);
begin
  NotasFacturacion.Clear;

  if (QMAlbaranesCLIENTE.AsInteger <> 0) then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then
                    StartTransaction;
              end;
              SelectSQL.Add(' SELECT C.ID_CLIENTE, C.CLIENTE, T.NOMBRE_R_SOCIAL ');
              SelectSQL.Add('        -- ');
              SelectSQL.Add('        , ');
              SelectSQL.Add('        (SELECT LIST(''---'' || TIPO_DOCUMENTO || ''---'' || ASCII_CHAR(13) || MENSAJE, ASCII_CHAR(13)) ');
              SelectSQL.Add('         FROM (SELECT TIPO_DOCUMENTO, MENSAJE ');
              SelectSQL.Add('               FROM EMP_AVISOS ');
              SelectSQL.Add('               WHERE ');
              SelectSQL.Add('               TIPO_OBJETO = ''CLI'' AND ');
              SelectSQL.Add('               ID_OBJETO = C.ID_CLIENTE AND ');
              SelectSQL.Add('               TIPO_DOCUMENTO IN (''FAC'') ');
              SelectSQL.Add('               UNION ');
              SelectSQL.Add('               SELECT ''NOTA'', NOTAS_FACTURACION_KRI AS MENSAJE ');
              SelectSQL.Add('               FROM EMP_CLIENTES ');
              SelectSQL.Add('               WHERE ');
              SelectSQL.Add('               EMPRESA = :EMPRESA AND ');
              SelectSQL.Add('               CLIENTE = :CLIENTE ');
              SelectSQL.Add('               ORDER BY 1)) AVISOS ');
              SelectSQL.Add('        -- ');
              SelectSQL.Add(' FROM EMP_CLIENTES C ');
              SelectSQL.Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' C.CLIENTE = :CLIENTE ');
              Params.ByName['EMPRESA'].AsInteger := QMAlbaranesEMPRESA.AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMAlbaranesCLIENTE.AsInteger;
              Open;
              NotasFacturacion.Text := FieldByName('AVISOS').AsString;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturaAlbaranes.MarcarPorFormaPago(FormaPagoIni, FormaPagoFin: string; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_MARCAR_ALBARANES_POR_FP (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :FORMA_PAGO_INI, :FORMA_PAGO_FIN, :MODO, ');
        SQL.Add(' :DESDE_FECHA, :HASTA_FECHA, :DESDE_FORMA_PAGO, :HASTA_FORMA_PAGO, :DESDE_CLIENTE, :HASTA_CLIENTE, :PERIODO_FACTURACION, :ENTRADA, ');
        SQL.Add(' :DESDE_DIA_PAGO, :HASTA_DIA_PAGO, :SIN_DIA_PAGO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi llamara recursivamente a las series seleccionadas en Multiserie
        Params.ByName['FORMA_PAGO_INI'].AsString := FormaPagoIni;
        Params.ByName['FORMA_PAGO_FIN'].AsString := FormaPagoFin;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
        Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, -2147483648);
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 2147483647);
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
        Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
        Params.ByName['SIN_DIA_PAGO'].AsInteger := BoolToInt(SinDiaPago);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturaAlbaranes.AsignaEntrada;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('UPDATE GES_CABECERAS_S_ALB  SET ENTRADA_FACTURACION = :ENTRADA WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL AND ENTRADA_FACTURACION > 0 AND ENTRADA_FACTURACION <> :ENTRADA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMAlbaranes.Close;
  QMAlbaranes.Open;
end;

procedure TDMFacturaAlbaranes.QMAlbaranesENTRADA_FACTURACIONChange(Sender: TField);
begin
  if (QMAlbaranesENTRADA_FACTURACION.AsInteger <> 0) then
     ImporteSeleccionado := ImporteSeleccionado + QMAlbaranesLIQUIDO.AsFloat
  else
     ImporteSeleccionado := ImporteSeleccionado - QMAlbaranesLIQUIDO.AsFloat;

  FMFacturaAlbaranes.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
end;

procedure TDMFacturaAlbaranes.DesmarcarAlbaranes;
var
  min_fecha, max_fecha : TDateTime;
  min_cliente, max_cliente : integer;
begin
  // Desmarco los albaranes marcados para liberarlos y que puedan ser marcados por otra sesion
  DameMinMaxFechaCliente(min_fecha, max_fecha, min_cliente, max_cliente);
  MarcarTodos(1, min_fecha, max_fecha, '', '', IntToStr(min_cliente), IntToStr(max_cliente), ' ', False, 1, 31, True);
end;

procedure TDMFacturaAlbaranes.QMAlbaranesBeforePost(DataSet: TDataSet);
begin
  // No permito marcar un albaran no facturable
  if (QMAlbaranesFACTURABLE.AsInteger = 0) then
     QMAlbaranesENTRADA_FACTURACION.AsInteger := 0;
end;

function TDMFacturaAlbaranes.PermitirAlbaranesImporteCero(Proyecto: integer; Certifica: boolean): boolean;
var
  Rig : integer;
  Serie : string;
  Liquido : double;
begin
  /// Si se permiten facturas con importe 0, permito que se facture cualquier albaran
  /// Si no se permiten, verifico que ningun albaran tenga importe 0.

  Result := PermitirCerrarFacturasCero;

  if (not Result) then
  begin
     // Inicializo asumiento que no hay albaranes con importe 0
     Result := True;

     with xRecorre do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' ';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PROYECTO'].AsInteger := Proyecto;
        Params.ByName['CERTIFICA'].AsInteger := BoolToInt(Certifica);
        Open;
        First;
        while not EOF do
        begin
           // Obtengo el liquido del albaran
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT SERIE, RIG, LIQUIDO ');
                 SQL.Add(' FROM GES_CABECERAS_S ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_S = :ID_S AND ');
                 SQL.Add(' LIQUIDO = 0 ');
                 Params.ByName['ID_S'].AsInteger := xRecorre.FieldByName('ID_S').AsInteger;
                 ExecQuery;
                 Serie := FieldByName['SERIE'].AsString;
                 Rig := FieldByName['RIG'].AsInteger;
                 Liquido := FieldByName['LIQUIDO'].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Verifico que el liquido sea 0 (o casi)
           if (Rig <> 0) and (Abs(Liquido) < 0.001) then
           begin
              Result := False;

              if (
                 MessageDlg(
                 Format(
                 _('El albaran %s/%d tiene total 0 y no podrá cerrar la factura.'), [Serie, Rig]
                 ), mtError, [mbOK, mbCancel], 0
                 ) = mrCancel
                 ) then
              begin
                 // Vamos al último registro para no controlar nada mas.
                 Last;
                 xRecorre.Last;
              end;
           end;

           Next;
        end;
        Close;
     end;
  end;
end;

procedure TDMFacturaAlbaranes.MarcarPorImporte(Importe: double; Modo: integer; FechaDesde, FechaHasta: TDateTime; DesdeFormaPago, HastaFormaPago, DesdeCliente, HastaCliente: string; PeriodoFacturacion: string; DesdeDiaPago, HastaDiaPago: integer; SinDiaPago: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_MARCAR_ALBARANES_POR_IMPORTE (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :IMPORTE, :MODO, ');
        SQL.Add(' :DESDE_FECHA, :HASTA_FECHA, :DESDE_FORMA_PAGO, :HASTA_FORMA_PAGO, :DESDE_CLIENTE, :HASTA_CLIENTE, :PERIODO_FACTURACION, :ENTRADA, ');
        SQL.Add(' :DESDE_DIA_PAGO, :HASTA_DIA_PAGO, :SIN_DIA_PAGO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' '; // Asi llamara recursivamente a las series seleccionadas en Multiserie
        Params.ByName['IMPORTE'].AsFloat := Importe;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
        Params.ByName['HASTA_FECHA'].AsDateTime := FechaHasta;
        Params.ByName['DESDE_FORMA_PAGO'].AsString := DesdeFormaPago;
        Params.ByName['HASTA_FORMA_PAGO'].AsString := HastaFormaPago;
        Params.ByName['DESDE_CLIENTE'].AsInteger := StrToIntDef(DesdeCliente, -2147483648);
        Params.ByName['HASTA_CLIENTE'].AsInteger := StrToIntDef(HastaCliente, 2147483647);
        Params.ByName['PERIODO_FACTURACION'].AsString := PeriodoFacturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['DESDE_DIA_PAGO'].AsInteger := DesdeDiaPago;
        Params.ByName['HASTA_DIA_PAGO'].AsInteger := HastaDiaPago;
        Params.ByName['SIN_DIA_PAGO'].AsInteger := BoolToInt(SinDiaPago);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMFacturaAlbaranes.QMAlbaranesCalcFields(DataSet: TDataSet);
begin
  if (REntorno.Pais = 'CHL') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 COALESCE(FOLIOREF, '''') AS FOLIOREF ');
           SQL.Add(' FROM SII_DTE_REFERENCIA ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_S = :ID_S AND ');
           SQL.Add(' TPODOCREF = ''801'' ');
           SQL.Add(' ORDER BY ID_S ');
           Params.ByName['ID_S'].AsInteger := QMAlbaranesID_S.AsInteger;
           ExecQuery;
           QMAlbaranesO_COMPRA.AsString := FieldByName['FOLIOREF'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     QMAlbaranesO_COMPRA.AsString := '';
end;

procedure TDMFacturaAlbaranes.BorraCabecerasSinAsignar(proc_auto, CanalDestino: integer; serie_fac: string);
begin
  /// Eliminamos cabeceras de documentos con estado 4 (Sin Asignar)
  /// ya que pueden haber sido creadas en el proceso de facturacion
  /// y al dar un error queden cabeceras vacías en estado 4

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM GES_CABECERAS_S C ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' C.SERIE = :SERIE AND ');
        SQL.Add(' C.TIPO = :TIPO AND ');
        SQL.Add(' C.ESTADO = 4 AND ');
        SQL.Add(' EXISTS(SELECT * ');
        SQL.Add('        FROM TMP_PROCESOS_AUTO ');
        SQL.Add('        WHERE ');
        SQL.Add('        EMPRESA = C.EMPRESA AND ');
        SQL.Add('        EJERCICIO = C.EJERCICIO AND ');
        SQL.Add('        CANAL = C.CANAL AND ');
        SQL.Add('        SERIE = C.SERIE AND ');
        SQL.Add('        TIPO = C.TIPO AND ');
        SQL.Add('        RIG = C.RIG AND ');
        SQL.Add('        CONTADOR = :CONTADOR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := CanalDestino;
        Params.ByName['SERIE'].AsString := serie_fac;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['CONTADOR'].AsInteger := proc_auto;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;


end.
