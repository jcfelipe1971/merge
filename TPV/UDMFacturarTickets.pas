unit UDMFacturarTickets;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FIBTableDataSetRO, frxClass, frxHYReport,
  UHYReport, FR_Class, Fr_HYReport, frxDBSet, FR_DSet, FR_DBSet;

type
  TDMFacturarTickets = class(TDataModule)
     TLocal: THYTransaction;
     QMTickets: TFIBTableSet;
     DSQMTickets: TDataSource;
     QMTicketsTOTAL_CANAL: TFloatField;
     xRecorre: TFIBTableSet;
     xRecorreEMPRESA_DEV: TIntegerField;
     xRecorreEJERCICIO_DEV: TIntegerField;
     xRecorreCANAL_DEV: TIntegerField;
     xRecorreSERIE_DEV: TFIBStringField;
     xRecorreRIT: TIntegerField;
     xRecorreCLIENTE: TIntegerField;
     xRecorreD_CANAL: TIntegerField;
     xRecorreTIPO_DEV: TFIBStringField;
     xRegistros: TFIBDataSetRO;
     xRegistrosENTRADA: TIntegerField;
     xRegistrosEMPRESA: TIntegerField;
     xRegistrosEJERCICIO: TIntegerField;
     xRegistrosCANAL: TIntegerField;
     xRegistrosSERIE: TFIBStringField;
     xRegistrosRIT: TIntegerField;
     xRegistrosFORMA_PAGO: TFIBStringField;
     xRegistrosSERIED: TFIBStringField;
     xRegistrosRIGD: TIntegerField;
     xRegistrosID_S_D: TIntegerField;
     xRegistrosTIPO: TFIBStringField;
     xRegistrosD_CANAL: TIntegerField;
     xFacturas: TFIBDataSetRO;
     xFacturasID_S_D: TIntegerField;
     xFacturasSERIED: TFIBStringField;
     xFacturasRIGD: TIntegerField;
     xFacturasTIPO: TFIBStringField;
     xFacturasD_CANAL: TIntegerField;
     QMCanales: TFIBTableSet;
     DSQMCanales: TDataSource;
     QMCanalesEMPRESA: TIntegerField;
     QMCanalesCAJA: TIntegerField;
     QMCanalesCANAL: TIntegerField;
     QMCanalesPORCENTAJE: TFloatField;
     QMCanalesRESTO: TIntegerField;
     QMCanalesIMPORTE: TFloatField;
     xFacturaciones: TFIBTableSet;
     DSxFacturaciones: TDataSource;
     xFacturacionesEMPRESA: TIntegerField;
     xFacturacionesEJERCICIO: TIntegerField;
     xFacturacionesCANAL: TIntegerField;
     xFacturacionesSERIE: TFIBStringField;
     xFacturacionesFACTURACION: TIntegerField;
     xFacturacionesTITULO: TFIBStringField;
     xFacturacionesPRIORIZA_FP: TIntegerField;
     xFacturacionesPRIORIZA_STK: TIntegerField;
     xFacturacionesSESION_INICIAL: TIntegerField;
     xFacturacionesSESION_FINAL: TIntegerField;
     xFacturacionesFECHA: TDateTimeField;
     xFacturacionesFECHA_FACTURAS: TDateTimeField;
     xFacturacionesUSUARIO: TIntegerField;
     xFacturacionesPOR_PORCENTAJES: TIntegerField;
     xFacturacionesPOR_IMPORTES: TIntegerField;
     DSxTotal: TDataSource;
     xVerGesPrc: TFIBTableSetRO;
     DSxVerGesPrc: TDataSource;
     xRecorre2: TFIBDataSetRO;
     xRecorre2ENTRADA: TIntegerField;
     xRecorre2EMPRESA: TIntegerField;
     xRecorre2EJERCICIO: TIntegerField;
     xRecorre2CANAL: TIntegerField;
     xRecorre2SERIE: TFIBStringField;
     xRecorre2RIG: TIntegerField;
     xRecorre2ID_S: TIntegerField;
     xRecorre2ESTADO: TIntegerField;
     xRecorre2PROC_AUTO: TIntegerField;
     xRecorre2TIPO: TFIBStringField;
     xVerGesPrcEMPRESA: TIntegerField;
     xVerGesPrcEJERCICIO: TIntegerField;
     xVerGesPrcCANAL: TIntegerField;
     xVerGesPrcSERIE: TFIBStringField;
     xVerGesPrcPROCESO: TFIBStringField;
     xVerGesPrcTIPO: TFIBStringField;
     xVerGesPrcCONTADOR: TIntegerField;
     xVerGesPrcANTERIOR: TIntegerField;
     xVerGesPrcENTRADA: TIntegerField;
     xVerGesPrcUSUARIO: TIntegerField;
     xVerGesPrcNOMBRE: TFIBStringField;
     xVerGesPrcFECHA_E: TDateTimeField;
     xVerGesPrcFECHA_S: TDateTimeField;
     xVerGesPrcUBICACION: TFIBStringField;
     xRegistrosLINEA: TIntegerField;
     xRegistrosLIQUIDO_TICKET: TFloatField;
     xRegistrosBLOQUEO: TIntegerField;
     xRegistrosTIPO_GASTO: TIntegerField;
     DSxVerGesPrcFras: TDataSource;
     DSxVerGesPrcFraE: TDataSource;
     TUpdate: THYTransaction;
     xTotal: TFIBDataSetRO;
     xTotalTOTAL: TFloatField;
     xVerGesPrcFras: TFIBDataSetRO;
     xVerGesPrcFrasEMPRESA: TIntegerField;
     xVerGesPrcFrasEJERCICIO: TIntegerField;
     xVerGesPrcFrasCANAL: TIntegerField;
     xVerGesPrcFrasSERIE: TFIBStringField;
     xVerGesPrcFrasTIPO: TFIBStringField;
     xVerGesPrcFrasRIG: TIntegerField;
     xVerGesPrcFrasFECHA: TDateTimeField;
     xVerGesPrcFrasCLIENTE: TIntegerField;
     xVerGesPrcFraE: TFIBDataSetRO;
     xVerGesPrcFraEEMPRESA: TIntegerField;
     xVerGesPrcFraEEJERCICIO: TIntegerField;
     xVerGesPrcFraECANAL: TIntegerField;
     xVerGesPrcFraESERIE: TFIBStringField;
     xVerGesPrcFraETIPO: TFIBStringField;
     xVerGesPrcFraERIG: TIntegerField;
     xVerGesPrcFraEFECHA: TDateTimeField;
     xVerGesPrcFraEACREEDOR: TIntegerField;
     TRecorre: THYTransaction;
     QMTicketsEMPRESA: TIntegerField;
     QMTicketsEJERCICIO: TIntegerField;
     QMTicketsCANAL: TIntegerField;
     QMTicketsSERIE: TFIBStringField;
     QMTicketsTIPO: TFIBStringField;
     QMTicketsRIT: TIntegerField;
     QMTicketsSESION: TIntegerField;
     QMTicketsCAJA: TIntegerField;
     QMTicketsTITULO_CAJA: TFIBStringField;
     QMTicketsTURNO: TIntegerField;
     QMTicketsNOMBRE: TFIBStringField;
     QMTicketsDESCRIPCION: TFIBStringField;
     QMTicketsESTADO: TIntegerField;
     QMTicketsTITULO_ESTADO: TFIBStringField;
     QMTicketsLIQUIDO: TFloatField;
     QMTicketsMONEDA: TFIBStringField;
     QMTicketsENTRADA_FAC: TIntegerField;
     QMTicketsUSUARIO: TIntegerField;
     QMTicketsFECHA: TDateTimeField;
     QMTicketsALMACEN: TFIBStringField;
     QMTicketsFORMA_PAGO: TFIBStringField;
     QMTicketsCLIENTE: TIntegerField;
     QMTicketsAGENTE: TIntegerField;
     QMTicketsCANAL_A_FACTURAR: TIntegerField;
     QMTicketsID_TICKET: TIntegerField;
     QMTicketsDTO_CIAL: TFloatField;
     QMTicketsI_DTO_CIAL: TFloatField;
     QMTicketsS_BASES: TFloatField;
     QMTicketsNOMBRE_R_SOCIAL: TFIBStringField;
     QMLstTicketsDetalle: TFIBDataSetRO;
     frTickets: TfrHYReport;
     HYReport: THYReport;
     QMLstTicketFP: TFIBDataSetRO;
     DSQLstMTicketFP: TDataSource;
     frxDBQLstMTicketFP: TfrxDBDataset;
     frDBQMLstTicketFP: TfrDBDataSet;
     DSQMLstTicketsDetalle: TDataSource;
     frDBQMLstTicketsDetalle: TfrDBDataSet;
     frxDBQMLstTicketsDetalle: TfrxDBDataset;
     QMLstTickets: TFIBDataSetRO;
     DSQMLstTickets: TDataSource;
     frxDBQMLstTickets: TfrxDBDataset;
     frDBQMLstTickets: TfrDBDataSet;
     DSxTotalAnulados: TDataSource;
     xTotalAnulados: TFIBDataSetRO;
     xTotalAnuladosTOTAL: TFloatField;
     QMTicketsMOTIVO_ANULADO: TFIBStringField;
     frxTickets: TfrxHYReport;
     xCabeceraFacNIF: TFIBDataSetRO;
     DSxCabeceraFacNIF: TDataSource;
     QMLstIngresosEgresos: TFIBDataSetRO;
     DSQMLstIngresosEgresos: TDataSource;
     frxDBQMLstIngresosEgresos: TfrxDBDataset;
     frDBQMLstIngresosEgresos: TfrDBDataSet;
     QMTicketsSFV_AUTORIZACION: TFIBStringField;
     QMTicketsSFV_CODIGO_CONTROL: TFIBStringField;
     QMTicketsFORMAS_PAGO: TFIBStringField;
     QMTicketsFACTURACION: TIntegerField;
     QMTicketsFACTURA: TFIBStringField;
     QMTicketsPERIODO_FACTURACION: TFIBStringField;
     procedure DMFacturarTicketsCreate(Sender: TObject);
     procedure QMTicketsBeforeInsert(DataSet: TDataSet);
     procedure QMTicketsBeforeDelete(DataSet: TDataSet);
     procedure QMTicketsAfterPost(DataSet: TDataSet);
     procedure QMTicketsTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xVerGesPrcAfterOpen(DataSet: TDataSet);
     procedure xVerGesPrcBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMLstTicketsAfterOpen(DataSet: TDataSet);
     procedure QMLstTicketsBeforeClose(DataSet: TDataSet);
     procedure frTicketsGetValue(const ParName: string; var ParValue: variant);
     procedure frxTicketsGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     SelectSQLOld: string;
     Filtrado: boolean;
     Serie: string;
     LocalMascaraN, LocalMascaraL: string;
     procedure RefrescaSeleccion;
     procedure RefrescaTotal(Tipo: string);
  public
     { Public declarations }
     // DesdeSesion, HastaSesion: integer;
     Tipo: string;
     procedure FiltrarSesion(DesdeSesion, HastaSesion, DesdeCaja, HastaCaja, DesdeTurno, HastaTurno: integer; DesdeFecha, HastaFecha: TDateTime; aTipo: string; AnuladoValido, Abierto, Anuladas, Cerradas, NoFacturado, Facturados: boolean; Rit: integer);
     procedure LimpiaEntradas;
     procedure Facturar(PorFecha: smallint; FechaValor: TDateTime);
     procedure Marcar(Entrada, DesdeSesion, HastaSesion, DesdeCaja, HastaCaja, DesdeTurno, HastaTurno: integer; PorFechas: boolean; DesdeFecha, HastaFecha: TDateTime);
     procedure Regenera;
     function DameFacturaUnica(var LimiteFacturacion: double; var Facturar: integer): integer;
     procedure InicializaFacturacionUnica(Modo, DesdeSesion, HastaSesion: integer; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas: boolean; var ProcesoAutomatico, Facturacion: integer);
     procedure FacturaTickets(Empresa, Ejercicio, Canal, RIT, CanalDestino: integer; SerieDestino: string; FacturarFechaEspecifica: boolean; ProcesoAutomatico, Facturacion, UnicaFactura: integer; Tipo: string; LimiteFacturacion: double; FechaValor: TDateTime);
     procedure TraspasaTicket(Empresa, Ejercicio, Canal, RIT, Linea, IDS_Destino, RIG, CanalDestino, Facturacion: integer; SerieDestino, Tipo: string);
     procedure CierraFacturas(Canal, RIG, IDS_Destino: integer; Tipo: string; Facturacion: integer);
     procedure BorraTemporales;
     procedure RegulaIVA;
     procedure Refresca;
     function DameFacturacion(DesdeSesion, HastaSesion: integer; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas: boolean; FechaFactura: TDateTime): integer;
     procedure AbrirFacturaciones;
     procedure DesfacturaFacturacion(facturaciones: boolean);
     function InicializaProceso(Tipo: string): integer;
     procedure AbreFactura(Empresa, Ejercicio, Canal, Rig, id_s: integer);
     procedure AbreFacturaEntrada(Empresa, Ejercicio, Canal, Rig, id_e: integer; aSerie: string = '');
     procedure BorraFactura(Empresa, Ejercicio, Canal, Factura, IDS: integer);
     procedure BorraFacturaEntrada(Empresa, Ejercicio, Canal, Factura, id_e: integer; aSerie: string = '');
     procedure BorraFacturacion(Tipo: string);
     procedure AjustaContadores;
     procedure AjustaContadoresEntrada;
     procedure TipoFacturacion(var PriorizaFP, PriorizaStock, PorImportes, PorLineas: boolean);
     function ComprobarLinea: boolean;
     procedure FacturaUnicaMuestra(SerieDestino: string; DesdeSesion, HastaSesion: integer; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas, FacturarFechaEspecifica: boolean; FechaValor: TDateTime);
     function Desfactura: boolean;
     procedure DameMinMaxSesion(var DesdeSesion, HastaSesion: integer);
     procedure DameMinMaxCaja(DesdeSesion, HastaSesion: integer; var DesdeCaja, HastaCaja: integer);
     procedure DameMinMaxTurno(DesdeSesion, HastaSesion, DesdeCaja, HastaCaja: integer; var DesdeTurno, HastaTurno: integer);
     procedure CambiaSerie(aSerie: string);
     procedure DameDatosTicket(IdTicket: integer; var Valido, SfvNumDosificacion: integer; var SfvCodigoControl, SfvAutorizacion, NIT, NombreCliente: string; var SCcuotaIVA, Liquido: double);
     procedure ExportaTicketsAExcel;
     procedure ExportarSFV;
     procedure MostrarTickets(Modo: integer);
     procedure MostrarTicketsDetalle(Modo: integer);
     procedure ValidaAnulados;
     procedure AnulaTicket;
     procedure MostrarIngresosEgresos(Modo, DesdeSesion, HastaSesion, DesdeCaja, HastaCaja, DesdeTurno, HastaTurno: integer; Serie: string);
     procedure AsignaCanal(Canal: integer);
     procedure FiltraUnTicket(IdTicket: integer);
     function FacturarUnTicket(IdTicket: integer; SerieDestino: string; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas, FacturarFechaEspecifica: boolean; FechaValor: TDateTime): integer;
     procedure TicketAAlbaran(IdTicket: integer; SerieDst: string);
  end;

var
  DMFacturarTickets : TDMFacturarTickets;

implementation

uses UEntorno, UDMMain, UUtiles, UFInfoFacturacionTPV, UHojaCalc,
  UDMListados, UFormGest, UParam, DateUtils;

{$R *.DFM}

procedure TDMFacturarTickets.DMFacturarTicketsCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  SelectSQLOld := '';
  Filtrado := True;
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);

  AsignaDisplayFormat(QMTickets, LocalMascaraN, MascaraI, ShortDateFormat);
  QMTicketsFECHA.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMTicketsDTO_CIAL.DisplayFormat := '0.00';

  AsignaDisplayFormat(QMCanales, LocalMascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  QMCanalesPORCENTAJE.DisplayFormat := '0.00';

  AsignaDisplayFormat(xVerGesPrc, LocalMascaraN, MascaraI, ShortDateFormat);
  xVerGesPrcFECHA_E.DisplayFormat := ShortDateFormat + ' hh:nn';
  xVerGesPrcFECHA_S.DisplayFormat := ShortDateFormat + ' hh:nn';

  AsignaDisplayFormat(xTotal, LocalMascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMCanales, '10000', True);
  AbrirFacturaciones;

  RefrescaTotal('TIC');
end;

procedure TDMFacturarTickets.DataModuleDestroy(Sender: TObject);
begin
  LimpiaEntradas;
end;

procedure TDMFacturarTickets.QMTicketsBeforeInsert(DataSet: TDataSet);
begin
  QMTickets.Cancel;
end;

procedure TDMFacturarTickets.QMTicketsBeforeDelete(DataSet: TDataSet);
begin
  QMTickets.Cancel;
end;

procedure TDMFacturarTickets.QMTicketsAfterPost(DataSet: TDataSet);
begin
  RefrescaTotal(QMTicketsTIPO.AsString);
end;

procedure TDMFacturarTickets.FiltrarSesion(DesdeSesion, HastaSesion, DesdeCaja, HastaCaja, DesdeTurno, HastaTurno: integer; DesdeFecha, HastaFecha: TDateTime; aTipo: string; AnuladoValido, Abierto, Anuladas, Cerradas, NoFacturado, Facturados: boolean; Rit: integer);
var
  Estados, Separador : string;
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');

  Estados := '';
  Separador := '';
  if (AnuladoValido) then
  begin
     Estados := Estados + Separador + '3';
     Separador := ',';
  end;
  if (Abierto) then
  begin
     Estados := Estados + Separador + '0';
     Separador := ',';
  end;
  if (Anuladas) then
  begin
     Estados := Estados + Separador + '2';
     Separador := ',';
  end;
  if (Cerradas) then
  begin
     Estados := Estados + Separador + '5';
     Separador := ',';
  end;

  LimpiaEntradas;

  with QMTickets do
  begin
     if not Filtrado then
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Text := SelectSQLOld;
     end
     else
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_TICKETS_FACTURACION ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' SERIE = :SERIE AND ');
        SelectSQL.Add(' TIPO = :TIPO AND ');
        SelectSQL.Add(' SESION >= :DESDE_SESION AND ');
        SelectSQL.Add(' SESION <= :HASTA_SESION AND ');
        SelectSQL.Add(' CAJA >= :DESDE_CAJA AND ');
        SelectSQL.Add(' CAJA <= :HASTA_CAJA AND ');
        SelectSQL.Add(' TURNO >= :DESDE_TURNO AND ');
        SelectSQL.Add(' TURNO <= :HASTA_TURNO AND ');
        SelectSQL.Add(' FECHA >= :DESDE_FECHA AND ');
        SelectSQL.Add(' FECHA <= :HASTA_FECHA  ');

        if ((AnuladoValido) or (Abierto) or (Anuladas) or (Cerradas)) then
           SelectSQL.Add(' AND ESTADO IN (' + Estados + ') ');

        if (REntorno.Pais = 'BOL') then
        begin
           // Filtramos solo recibos
           if (NoFacturado) then
              SelectSQL.Add(' AND SFV_NUM_DOSIFICACION = 0 ');
           if (Facturados) then
              SelectSQL.Add(' AND SFV_NUM_DOSIFICACION > 0 ');
        end
        else
        begin
           if ((Facturados) and (NoFacturado)) then
              SelectSQL.Add(' /* TODOS AND FACTURA >= '''' */ ')
           else if ((not Facturados) and (not NoFacturado)) then
              SelectSQL.Add(' /* NINGUNO */ AND FACTURA = ''ZZZ'' ')
           else if (Facturados) then
              SelectSQL.Add(' AND FACTURA > '''' ')
           else if (NoFacturado) then
              SelectSQL.Add(' AND FACTURA = '''' ');
        end;

        if (Rit > 0) then
           SelectSQL.Add(' AND RIT = :RIT ');

        SelectSQL.Add(' ORDER BY RIT ');
     end;

     DMMain.FiltraTabla(QMTickets, '11100', False);

     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE_CAJA'].AsInteger := DesdeCaja;
     Params.ByName['HASTA_CAJA'].AsInteger := HastaCaja;
     Params.ByName['DESDE_TURNO'].AsInteger := DesdeTurno;
     Params.ByName['HASTA_TURNO'].AsInteger := HastaTurno;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;

     if (ExisteParametro(QMTickets, 'DESDE_SESION')) then
     begin
        Params.ByName['DESDE_SESION'].AsInteger := DesdeSesion;
        Params.ByName['HASTA_SESION'].AsInteger := HastaSesion;
     end;

     if (ExisteParametro(QMTickets, 'TIPO')) then
        Params.ByName['TIPO'].AsString := aTipo;

     if (Rit > 0) then
        Params.ByName['RIT'].AsInteger := Rit;

     Tipo := aTipo;

     Open;
  end;

  Filtrado := True;

  RefrescaTotal(Tipo);
end;

procedure TDMFacturarTickets.LimpiaEntradas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TICKET_FACTURA_LIMPIA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.Facturar(PorFecha: smallint; FechaValor: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TICKET_FACTURAR ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA, :POR_FECHA, :FECHA_VALOR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['POR_FECHA'].AsInteger := PorFecha;
        Params.ByName['FECHA_VALOR'].AsDateTime := FechaValor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMTickets.Close;
  QMTickets.Open;
end;

procedure TDMFacturarTickets.Marcar(Entrada, DesdeSesion, HastaSesion, DesdeCaja, HastaCaja, DesdeTurno, HastaTurno: integer; PorFechas: boolean; DesdeFecha, HastaFecha: TDateTime);
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TICKET_MARCA ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :SESION_INICIAL, :SESION_FINAL, :CAJA_INICIAL, :CAJA_FINAL, :TURNO_INICIAL, :TURNO_FINAL, :ENTRADA, :TIPO, :POR_FECHAS, :FECHA_DESDE, :FECHA_HASTA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['SESION_INICIAL'].AsInteger := DesdeSesion;
        Params.ByName['SESION_FINAL'].AsInteger := HastaSesion;
        Params.ByName['CAJA_INICIAL'].AsInteger := DesdeCaja;
        Params.ByName['CAJA_FINAL'].AsInteger := HastaCaja;
        Params.ByName['TURNO_INICIAL'].AsInteger := DesdeTurno;
        Params.ByName['TURNO_FINAL'].AsInteger := HastaTurno;
        Params.ByName['ENTRADA'].AsInteger := Entrada;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['POR_FECHAS'].AsInteger := BoolToInt(PorFechas);
        Params.ByName['FECHA_DESDE'].AsDateTime := DesdeFecha;
        Params.ByName['FECHA_HASTA'].AsDateTime := HastaFecha;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaSeleccion;
  RefrescaTotal(Tipo);
end;

procedure TDMFacturarTickets.RefrescaSeleccion;
begin
  with QMTickets do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFacturarTickets.Regenera;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TICKET_REGENERA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaSeleccion;
end;

procedure TDMFacturarTickets.QMTicketsTOTAL_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMTicketsMONEDA.AsString, 1), QMTicketsLIQUIDO.AsFloat);
end;

function TDMFacturarTickets.DameFacturaUnica(var LimiteFacturacion: double; var Facturar: integer): integer;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT UNICA_FAC, LIMITE_FAC, FACTURAR FROM GES_TPV_CONFIGURACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        Result := FieldByName['UNICA_FAC'].AsInteger;
        LimiteFacturacion := FieldByName['LIMITE_FAC'].AsFloat;
        Facturar := FieldByName['FACTURAR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.InicializaFacturacionUnica(Modo, DesdeSesion, HastaSesion: integer; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas: boolean; var ProcesoAutomatico, Facturacion: integer);
begin
  BorraTemporales;

  // Obtengo numero de Facturacion / Proceso automatico
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_TICKETS_PROC_AUTO (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        ProcesoAutomatico := FieldByName['PROC_AUTO'].AsInteger;
        Facturacion := FieldByName['FACTURACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (not TRecorre.InTransaction) then
     TRecorre.StartTransaction;

  with xRecorre do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['SESIONI'].AsInteger := DesdeSesion;
     Params.ByName['SESIONF'].AsInteger := HastaSesion;
     Params.ByName['PRIORIZA_FP'].AsInteger := BoolToInt(PriorizaFormaPago);
     Params.ByName['PRIORIZA_STK'].AsInteger := BoolToInt(PriorizaStock);
     Params.ByName['POR_IMPORTES'].AsInteger := BoolToInt(PorImportes);
     Params.ByName['POR_LINEAS'].AsInteger := BoolToInt(PorLineas);
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['MODO'].AsInteger := Modo;
     Params.ByName['TIPO_TICKET'].AsString := Tipo;
     Open;
     First;
  end;
end;

procedure TDMFacturarTickets.FacturaTickets(Empresa, Ejercicio, Canal, RIT, CanalDestino: integer; SerieDestino: string; FacturarFechaEspecifica: boolean; ProcesoAutomatico, Facturacion, UnicaFactura: integer; Tipo: string; LimiteFacturacion: double; FechaValor: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_FACTURA_TICKETS_REPARTE(:ENTRADA, :EMPRESA, :EJERCICIO, ');
        SQL.Add(' :CANAL, :SERIE, :TIPO, :RIT, :LINEA, :D_CANAL, :D_SERIE, NULL, :POR_FECHA, NULL, ');
        SQL.Add(' :FECHA_VALOR, :LIMITE_FAC, :UNICA_FAC, :PROC_AUTO, :FACTURACION, 0) ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIT'].AsInteger := RIT;
        Params.ByName['LINEA'].AsInteger := 0;
        Params.ByName['D_CANAL'].AsInteger := CanalDestino;
        Params.ByName['D_SERIE'].AsString := SerieDestino;
        Params.ByName['POR_FECHA'].AsInteger := BoolToInt(FacturarFechaEspecifica);
        Params.ByName['FECHA_VALOR'].AsDateTime := FechaValor;
        Params.ByName['LIMITE_FAC'].AsFloat := LimiteFacturacion;
        Params.ByName['UNICA_FAC'].AsInteger := UnicaFactura;
        Params.ByName['PROC_AUTO'].AsInteger := ProcesoAutomatico;
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.TraspasaTicket(Empresa, Ejercicio, Canal, RIT, Linea, IDS_Destino, RIG, CanalDestino, Facturacion: integer; SerieDestino, Tipo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_FACTURA_TICKETS_REPARTE ');
        SQL.Add(' (:ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIT, :LINEA, ');
        SQL.Add(' :D_CANAL, :SERIE_D, :D_RIG, NULL, :ID_S_D, NULL, NULL, NULL, NULL, ');
        SQL.Add(' :FACTURACION, 1) ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIT'].AsInteger := RIT;
        Params.ByName['LINEA'].AsInteger := Linea;
        Params.ByName['D_CANAL'].AsInteger := CanalDestino;
        Params.ByName['SERIE_D'].AsString := SerieDestino;
        Params.ByName['D_RIG'].AsInteger := RIG;
        Params.ByName['ID_S_D'].AsInteger := IDS_Destino;
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.CierraFacturas(Canal, RIG, IDS_Destino: integer; Tipo: string; Facturacion: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_FACTURA_TICKETS_REPARTE ');
        SQL.Add(' (:ENTRADA, :EMPRESA, :EJERCICIO, NULL, NULL, :TIPO, NULL, 0, ');
        SQL.Add(' :D_CANAL, :SERIE_D, :D_RIG, :POR_FECHA, :ID_S_D, NULL, NULL, ');
        SQL.Add(' NULL, NULL, :FACTURACION, 2) ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['D_CANAL'].AsInteger := Canal;
        Params.ByName['SERIE_D'].AsString := Serie;
        Params.ByName['D_RIG'].AsInteger := RIG;
        Params.ByName['POR_FECHA'].AsInteger := 0;
        Params.ByName['ID_S_D'].AsInteger := IDS_Destino;
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_FACTURA_TICKETS WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.RegulaIVA;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_TICKETS_FACTURA_RED (:ENTRADA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMFacturarTickets.DameFacturacion(DesdeSesion, HastaSesion: integer; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas: boolean; FechaFactura: TDateTime): integer;
var
  Facturacion : integer;
  PorPorcentajes : boolean;
begin
  Facturacion := DMMain.ContadorGen('CONTA_FACTURACIONES');
  PorPorcentajes := not PorImportes;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO GES_TPV_FACTURACIONES ');
        SQL.Add(' (EMPRESA,EJERCICIO,CANAL,SERIE,FACTURACION,TITULO, ');
        SQL.Add(' PRIORIZA_FP,PRIORIZA_STK,SESION_INICIAL,SESION_FINAL,FECHA,FECHA_FACTURAS, ');
        SQL.Add(' USUARIO,POR_PORCENTAJES,POR_IMPORTES,POR_LINEAS) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (:EMPRESA,:EJERCICIO,:CANAL,:SERIE,:FACTURACION,:TITULO, ');
        SQL.Add(' :PRIORIZA_FP,:PRIORIZA_STK,:SESIONI,:SESIONF,:FECHA,:FECHA_FAC, ');
        SQL.Add(' :USUARIO,:POR_PORCENTAJES,:POR_IMPORTES,:POR_LINEAS) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['FACTURACION'].AsInteger := facturacion;
        Params.ByName['TITULO'].AsString := Format(_('Facturacion %d del %s'), [facturacion, DateToStr(REntorno.FechaTrab)]);
        Params.ByName['PRIORIZA_FP'].AsInteger := BoolToInt(PriorizaFormaPago);
        Params.ByName['PRIORIZA_STK'].AsInteger := BoolToInt(PriorizaStock);
        Params.ByName['SESIONI'].AsInteger := DesdeSesion;
        Params.ByName['SESIONF'].AsInteger := HastaSesion;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['FECHA_FAC'].AsDateTime := FechaFactura;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['POR_IMPORTES'].AsInteger := BoolToInt(PorImportes);
        Params.ByName['POR_LINEAS'].AsInteger := BoolToInt(PorLineas);
        Params.ByName['POR_PORCENTAJES'].AsInteger := BoolToInt(PorPorcentajes);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := Facturacion;
end;

procedure TDMFacturarTickets.AbrirFacturaciones;
begin
  DMMain.FiltraRO(xVerGesPrc, '11110', True);
end;

procedure TDMFacturarTickets.DesfacturaFacturacion(Facturaciones: boolean);
var
  Facturacion : integer;
begin
  if (Facturaciones) then
     Facturacion := xFacturacionesFACTURACION.AsInteger
  else
     Facturacion := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TICKET_DESFACTURA_FACTURACION(:EMPRESA, :FACTURACION, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FACTURACION'].AsInteger := Facturacion;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.RefrescaTotal(Tipo: string);
begin
  with xTotal do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['TIPO'].AsString := Tipo;
     Open;
  end;

  with xTotalAnulados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['TIPO'].AsString := Tipo;
     Open;
  end;
end;

procedure TDMFacturarTickets.Refresca;
begin
  QMTickets.Close;
  QMTickets.Open;
end;

function TDMFacturarTickets.InicializaProceso(Tipo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ALBARANES_NO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :ENTRADA, :CONTADOR)';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xVerGesPrcCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xVerGesPrcSERIE.AsString;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['CONTADOR'].AsInteger := xVerGesPrcCONTADOR.AsInteger;
        ExecQuery;
        Result := FieldByName['PROCESO_AUTO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xRecorre2 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
     // Params.ByName['CANAL'].AsInteger := xVerGesPrcCANAL.AsInteger;
     // Params.ByName['SERIE'].AsString  := xVerGesPrcSERIE.AsString;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['PROC_AUTO'].AsInteger := xVerGesPrcCONTADOR.AsInteger;
     Open;
     First;
  end;
end;

procedure TDMFacturarTickets.AbreFactura(Empresa, Ejercicio, Canal, Rig, id_s: integer);
begin
  if (xVerGesPrcTIPO.AsString = '+AT') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_DESPAGA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :ID_S)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['RIG'].AsInteger := Rig;
           Params.ByName['ID_S'].AsInteger := id_s;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ABRE(:ID_S)';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.BorraFactura(Empresa, Ejercicio, Canal, Factura, IDS: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_BORRA_RIG_SALIDA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_S)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := Factura;
        Params.ByName['ID_S'].AsInteger := IDS;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.BorraFacturacion(Tipo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_BORRA_PROC_AUTO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :CONTADOR)';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xVerGesPrcCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xVerGesPrcSERIE.AsString;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CONTADOR'].AsInteger := xVerGesPrcCONTADOR.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.AjustaContadores;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CONTADORES_AJUSTA_EMP_EJE_FAC(:EMPRESA, :EJERCICIO )';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.TipoFacturacion(var PriorizaFP, PriorizaStock, PorImportes, PorLineas: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PRIORIZA_FP, PRIORIZA_STK, POR_IMPORTES, FACTURACION_POR_LINEAS ');
        SQL.Add(' FROM GES_TPV_CONFIGURACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        PriorizaFP := (FieldByName['PRIORIZA_FP'].AsInteger = 1);
        PriorizaStock := (FieldByName['PRIORIZA_STK'].AsInteger = 1);
        PorImportes := (FieldByName['POR_IMPORTES'].AsInteger = 1);
        PorLineas := (FieldByName['FACTURACION_POR_LINEAS'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.xVerGesPrcAfterOpen(DataSet: TDataSet);
begin
  xVerGesPrcFras.Close;
  xVerGesPrcFras.Open;
  xVerGesPrcFrae.Close;
  xVerGesPrcFrae.Open;
end;

function TDMFacturarTickets.ComprobarLinea: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) FROM GES_TICKET_CABECERA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' ENTRADA_FAC = :ENTRADA_FAC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ENTRADA_FAC'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.xVerGesPrcBeforeClose(DataSet: TDataSet);
begin
  xVerGesPrcFras.Close;
  xVerGesPrcFrae.Close;
end;

procedure TDMFacturarTickets.AbreFacturaEntrada(Empresa, Ejercicio, Canal, Rig, id_e: integer; aSerie: string = '');
begin
  if (aSerie = '') then
     aSerie := Serie;

  if (xVerGesPrcTIPO.AsString = '+AT') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_DESPAGA_E(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :ID_E)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := aSerie;
           Params.ByName['RIG'].AsInteger := Rig;
           Params.ByName['ID_E'].AsInteger := id_e;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ACR_ABRE(:ID_E)';
        Params.ByName['ID_E'].AsInteger := id_e;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.BorraFacturaEntrada(Empresa, Ejercicio, Canal, Factura, id_e: integer; aSerie: string = '');
begin
  if (aSerie = '') then
     aSerie := Serie;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_BORRA_RIG_ENTRADA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_E)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := aSerie;
        Params.ByName['TIPO'].AsString := 'FCR';
        Params.ByName['RIG'].AsInteger := Factura;
        Params.ByName['ID_E'].AsInteger := id_e;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.AjustaContadoresEntrada;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CONTADORES_AJUSTA_EMP_EJE_FCR(:EMPRESA, :EJERCICIO )';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.FacturaUnicaMuestra(SerieDestino: string; DesdeSesion, HastaSesion: integer; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas, FacturarFechaEspecifica: boolean; FechaValor: TDateTime);
var
  RIT, Empresa, Ejercicio, Canal, CanalDestino, RIGDestino, IDS_Destino, Linea : integer;
  ProcesoAutomatico, Facturacion, FacturaUnica, Facturar : integer;
  aSerie, FormaPago, Tipo : string;
  LimiteFacturacion : double;
  WndList : Pointer;
  FechaFacturacion : TDateTime;
begin
  Screen.Cursor := crHourGlass;
  try
     FInfoFacturacionTPV := TFInfoFacturacionTPV.Create(Self);
     WndList := DisableTaskWindows(FInfoFacturacionTPV.Handle);
     try
        with FinfoFacturacionTPV do
        begin
           LInfoGeneral.Caption := _('Inicializando Facturación');
           GBProcesaCab.Visible := False;
           GBProcesaCab.Caption := _('Procesando Tickets');
           Show;
        end;

        Application.ProcessMessages;

        FacturaUnica := DameFacturaUnica(LimiteFacturacion, Facturar);

        InicializaFacturacionUnica(1, DesdeSesion, HastaSesion, PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas, ProcesoAutomatico, Facturacion);

        FinfoFacturacionTPV.LInfoGeneral.Caption := _('Creando Fac. Destino');
        FinfoFacturacionTPV.GBProcesaCab.Visible := True;

        while not (xRecorre.EOF) do
        begin
           RIT := xRecorreRIT.AsInteger;
           Empresa := xRecorreEMPRESA_DEV.AsInteger;
           Ejercicio := xRecorreEJERCICIO_DEV.AsInteger;
           Canal := xRecorreCANAL_DEV.AsInteger;
           aSerie := xRecorreSERIE_DEV.AsString;
           CanalDestino := xRecorreD_CANAL.AsInteger;
           Tipo := xRecorreTIPO_DEV.AsString;

           with FinfoFacturacionTPV do
           begin
              LInfoEjercicio.Caption := IntToStr(Ejercicio);
              LInfoCanal.Caption := IntToStr(Canal);
              LInfoSerie.Caption := aSerie;
              LInfoRig.Caption := IntToStr(RIT);
              LTipo.Caption := _('Ticket');
           end;
           Application.ProcessMessages;

           FacturaTickets(Empresa, Ejercicio, Canal, RIT, CanalDestino, SerieDestino, FacturarFechaEspecifica,
              ProcesoAutomatico, Facturacion, FacturaUnica, Tipo, LimiteFacturacion, FechaValor);

           xRecorre.Next;
        end;
        xRecorre.Close;

        if TRecorre.InTransaction then
           TRecorre.Commit;

        with FinfoFacturacionTPV do
        begin
           LInfoGeneral.Caption := _('Traspasando Tickets');
           GBProcesaCab.Caption := _('Traspasando Tickets');
        end;
        Application.ProcessMessages;

        // Seguir con proceso factura tickets (detalles)
        with xRegistros do
        begin
           Close;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Open;
           First;
        end;

        while not xRegistros.EOF do
        begin
           Empresa := xRegistrosEMPRESA.AsInteger;
           Ejercicio := xRegistrosEJERCICIO.AsInteger;
           Canal := xRegistrosCANAL.AsInteger;
           aSerie := xRegistrosSERIE.AsString;
           RIT := xRegistrosRIT.AsInteger;
           FormaPago := xRegistrosFORMA_PAGO.AsString;
           SerieDestino := xRegistrosSERIED.AsString;
           RIGDestino := xRegistrosRIGD.AsInteger;
           IDS_Destino := xRegistrosID_S_D.AsInteger;
           CanalDestino := xRegistrosD_CANAL.AsInteger;
           Tipo := xRegistrosTIPO.AsString;
           Linea := xRegistrosLINEA.AsInteger;

           with FinfoFacturacionTPV do
           begin
              LInfoEjercicio.Caption := IntToStr(Ejercicio);
              LInfoCanal.Caption := IntToStr(Canal);
              LInfoSerie.Caption := aSerie;
              LInfoRig.Caption := IntToStr(RIGDestino);
              LTipo.Caption := _('RIG');
           end;
           Application.ProcessMessages;

           TraspasaTicket(Empresa, Ejercicio, Canal, RIT, Linea, IDS_Destino, RIGDestino, CanalDestino, Facturacion, SerieDestino, Tipo);

           xRegistros.Next;
        end;
        xRegistros.Close;

        // Regulando IVAS
        with FinfoFacturacionTPV do
        begin
           LInfoGeneral.Caption := _('Regulando IVAs');
           GBProcesaCab.Caption := _('Regulando IVAs');
        end;
        Application.ProcessMessages;

        RegulaIVA;

        // Cerrar facturas
        with xFacturas do
        begin
           Close;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Open;
           First;
        end;

        with FinfoFacturacionTPV do
        begin
           LInfoGeneral.Caption := _('Cerrando Facturas');
           LInfoEjercicio.Caption := IntToStr(REntorno.Ejercicio);
           LInfoCanal.Caption := IntToStr(REntorno.Canal);
           GBProcesaCab.Caption := _('Procesando Factura');
        end;
        Application.ProcessMessages;

        if (FacturarFechaEspecifica) then
           FechaFacturacion := FechaValor
        else
           FechaFacturacion := 0;

        Facturacion := DameFacturacion(DesdeSesion, HastaSesion, PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas, FechaFacturacion);

        while not (xFacturas.EOF) do
        begin
           IDS_Destino := xFacturasID_S_D.AsInteger;
           aSerie := xFacturasSERIED.AsString;
           RIGDestino := xFacturasRIGD.AsInteger;
           Tipo := xFacturasTIPO.AsString;
           Canal := xFacturasD_CANAL.AsInteger;
           Tipo := xFacturasTIPO.AsString;

           with FinfoFacturacionTPV do
           begin
              LInfoSerie.Caption := aSerie;
              LInfoRig.Caption := IntToStr(RIGDestino);
           end;
           Application.ProcessMessages;

           CierraFacturas(Canal, RIGDestino, IDS_Destino, Tipo, Facturacion);

           xFacturas.Next;
        end;
     finally
        EnableTaskWindows(WndList);

        with FinfoFacturacionTPV do
        begin
           LInfoGeneral.Caption := _('Proceso realizado con éxito');
           BSalir.Enabled := True;
        end;
     end;
  finally
     Screen.Cursor := crDefault;
     if (TRecorre.InTransaction) then
        TRecorre.Commit;
  end;

  BorraTemporales;
  Refresca;
end;

function TDMFacturarTickets.Desfactura: boolean;
var
  WndList : Pointer;
  IDS, ProcesoAutomatico, Empresa, Ejercicio, Canal, Estado, Factura : integer;
  Tipo, aSerie : string;
begin
  // Result := False;
  Screen.Cursor := crHourGlass;

  FinfoFacturacionTPV := TFinfoFacturacionTPV.Create(Self);
  WndList := DisableTaskWindows(FinfoFacturacionTPV.Handle);
  try
     with FinfoFacturacionTPV do
     begin
        LInfoGeneral.Caption := _('Procesando Factura');
        GBProcesaCab.Caption := _('Procesando Factura');
        LInfoEjercicio.Caption := '';
        LInfoCanal.Caption := '';
        LInfoSerie.Caption := '';
        LInfoRig.Caption := '';
        Show;
     end;
     Application.ProcessMessages;
     Tipo := Copy(xVerGesPrcTIPO.AsString, 2, 2);

     // Damos de baja el antiguo proceso damos de alta el nuevo e insertamos
     // en la tabla temporal
     ProcesoAutomatico := InicializaProceso(Tipo);

     // Comezamos a recorrer las facturas
     // Vamos abriendo las cerradas
     while not (xRecorre2.EOF) do
     begin
        IDS := xRecorre2ID_S.AsInteger;
        Factura := xRecorre2RIG.AsInteger;
        Ejercicio := xRecorre2EJERCICIO.AsInteger;
        Estado := xRecorre2ESTADO.AsInteger;
        aSerie := xRecorre2SERIE.AsString;
        Canal := xRecorre2CANAL.AsInteger;
        Empresa := xRecorre2EMPRESA.AsInteger;

        if (Estado = 5) then
        begin
           with FinfoFacturacionTPV do
           begin
              LInfoGeneral.Caption := _('Abriendo Factura') + ' - (' + IntToStr(ProcesoAutomatico) + ')';
              LInfoEjercicio.Caption := IntToStr(Ejercicio);
              LInfoCanal.Caption := IntToStr(Canal);
              LInfoSerie.Caption := aSerie;
              LInfoRig.Caption := IntToStr(Factura);
           end;
           Application.ProcessMessages;
           AbreFactura(Empresa, Ejercicio, Canal, Factura, IDS);
        end;

        xRecorre2.Next;
     end;

     xRecorre2.First;
     // Comenzamos a borrar facturas
     while not (xRecorre2.EOF) do
     begin
        IDS := xRecorre2ID_S.AsInteger;
        Factura := xRecorre2RIG.AsInteger;
        Ejercicio := xRecorre2EJERCICIO.AsInteger;
        // Estado := xRecorre2ESTADO.AsInteger; No se utiliza
        aSerie := xRecorre2SERIE.AsString;
        Canal := xRecorre2CANAL.AsInteger;
        Empresa := xRecorre2EMPRESA.AsInteger;

        with FinfoFacturacionTPV do
        begin
           LInfoGeneral.Caption := _('Borrando Factura');
           LInfoEjercicio.Caption := IntToStr(Ejercicio);
           LInfoCanal.Caption := IntToStr(Canal);
           LInfoSerie.Caption := aSerie;
           LInfoRig.Caption := IntToStr(Factura);
        end;
        Application.ProcessMessages;

        BorraFactura(Empresa, Ejercicio, Canal, Factura, IDS);
        xRecorre2.Next;
     end;
     xRecorre2.Close;

     // Borramos AHORA el proceso
     BorraFacturacion(Tipo);

     Result := True;
  finally
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);
     with FinfoFacturacionTPV do
     begin
        LInfoGeneral.Caption := _('Proceso realizado con éxito');
        BSalir.Enabled := True;
     end;

     // Para evitar problemas
     BorraTemporales;
     // Ajustamos los contadores de la empresa
     AjustaContadores;

     xVerGesPrc.Close;
     xVerGesPrc.Open;
  end;
end;

procedure TDMFacturarTickets.DameMinMaxSesion(var DesdeSesion, HastaSesion: integer);
begin
  /// Busco las sesiones activas. Si no encuentro devuelvo la ultima sesion.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(S.SESION), MAX(S.SESION) ');
        SQL.Add(' FROM GES_TPV_SESIONES S ');
        SQL.Add(' WHERE ');
        SQL.Add(' S.EMPRESA = :EMPRESA AND ');
        SQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' S.CANAL = :CANAL AND ');
        SQL.Add(' S.SERIE = :SERIE AND ');
        SQL.Add(' S.ABIERTA = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;

        DesdeSesion := FieldByName['MIN'].AsInteger;
        HastaSesion := FieldByName['MAX'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;

  if (DesdeSesion = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(S.SESION) ');
           SQL.Add(' FROM GES_TPV_SESIONES S ');
           SQL.Add(' WHERE ');
           SQL.Add(' S.EMPRESA = :EMPRESA AND ');
           SQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' S.CANAL = :CANAL AND ');
           SQL.Add(' S.SERIE = :SERIE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           ExecQuery;

           DesdeSesion := FieldByName['MAX'].AsInteger;
           HastaSesion := DesdeSesion;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFacturarTickets.DameMinMaxCaja(DesdeSesion, HastaSesion: integer; var DesdeCaja, HastaCaja: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(S.CAJA), MAX(S.CAJA) ');
        SQL.Add(' FROM GES_TPV_SESIONES_CAJAS S ');
        SQL.Add(' WHERE ');
        SQL.Add(' S.EMPRESA = :EMPRESA AND ');
        SQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' S.CANAL = :CANAL AND ');
        SQL.Add(' S.SERIE = :SERIE AND ');
        SQL.Add(' S.SESION >= :DESDE_SESION AND ');
        SQL.Add(' S.SESION <= :HASTA_SESION AND ');
        SQL.Add(' S.ABIERTA = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['DESDE_SESION'].AsInteger := DesdeSesion;
        Params.ByName['HASTA_SESION'].AsInteger := HastaSesion;
        ExecQuery;

        DesdeCaja := FieldByName['MIN'].AsInteger;
        HastaCaja := FieldByName['MAX'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.DameMinMaxTurno(DesdeSesion, HastaSesion, DesdeCaja, HastaCaja: integer; var DesdeTurno, HastaTurno: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(T.TURNO), MAX(T.TURNO) ');
        SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO T ');
        SQL.Add(' WHERE ');
        SQL.Add(' T.EMPRESA = :EMPRESA AND ');
        SQL.Add(' T.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' T.CANAL = :CANAL AND ');
        SQL.Add(' T.SERIE = :SERIE AND ');
        SQL.Add(' T.SESION >= :DESDE_SESION AND ');
        SQL.Add(' T.SESION <= :HASTA_SESION AND ');
        SQL.Add(' T.CAJA >= :DESDE_CAJA AND ');
        SQL.Add(' T.CAJA <= :HASTA_CAJA AND ');
        SQL.Add(' T.ABIERTO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['DESDE_SESION'].AsInteger := DesdeSesion;
        Params.ByName['HASTA_SESION'].AsInteger := HastaSesion;
        Params.ByName['DESDE_CAJA'].AsInteger := DesdeCaja;
        Params.ByName['HASTA_CAJA'].AsInteger := HastaCaja;
        ExecQuery;

        DesdeTurno := FieldByName['MIN'].AsInteger;
        HastaTurno := FieldByName['MAX'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.CambiaSerie(aSerie: string);
begin
  LimpiaEntradas;
  Serie := aSerie;
end;

procedure TDMFacturarTickets.ExportaTicketsAExcel;
var
  Archivo : string;
  HCalc : THojaCalc;
  f, c : integer;
begin
  // Obtengo nombre de fichero de exportacion
  Archivo := Format('\ExportacionTicket_%s.xls', [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMFacturarTickets-ExportaTicketsAExcel') then
  begin
     DMMain.Log('Exportacion Excel');
     // Esto mira si el nombre del archivo contienen .xls (.xls, .xlsx);
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcExcel, True)');
        HCalc := THojaCalc.Create(thcExcel, False);
     end
     else
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcOpenOffice, True)');
        HCalc := THojaCalc.Create(thcOpenOffice, False);
     end;

     try
        DMMain.Log('HCalc.FileName = ' + Archivo);
        HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!

        // Exportacion de datos de Parte de Movimientos
        HCalc.ActivateSheetByIndex(1);
        HCalc.ActiveSheetName := _('Registros');

        DMMain.LogIni('Recorro lineas');
        with QMTickets do
        begin
           First;

           f := 1;
           // Nombres de campos
           for c := 0 to FieldCount - 1 do
           begin
              HCalc.Bold(f, c + 1);
              HCalc.CellText[f, c + 1] := Fields[c].FieldName;
           end;

           // Valores
           Inc(f);
           while not EOF do
           begin
              for c := 0 to FieldCount - 1 do
              begin
                 if (Fields[c].AsString <> '') then
                 begin
                    if Fields[c].DataType in [ftSmallint, ftInteger, ftWord] then
                       HCalc.SendNumber(f, c + 1, Fields[c].AsInteger)
                    else
                    if Fields[c].DataType in [ftFloat, ftCurrency] then
                       HCalc.SendNumber(f, c + 1, Fields[c].AsFloat)
                    else
                    if Fields[c].DataType in [ftDateTime, ftDate, ftTime] then
                       HCalc.SendDate(f, c + 1, Fields[c].AsDateTime)
                    else
                       HCalc.CellText[f, c + 1] := Fields[c].AsString;
                 end;
              end;

              Inc(f);
              Next;
           end;

           { TODO : Esto parece no funcionar en LibreOffice. He probado con valor *10 y *150. }
           // Ancho de columna Titulo de Articulo (150 x caracter)
           // for c := 0 to FieldCount - 1 do
           //   HCalc.ColumnWidth(C, Fields[c].DisplayWidth * 150);
        end;

        DMMain.Log('HCalc.SaveDocAs');
        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        DMMain.LogFin('Recorro lineas');
        DMMain.Log('Liberar Excel');
        HCalc.Free;
     end;

     ShowMessage(_('Exportación Realizada con Exito'));
  end;
end;

procedure TDMFacturarTickets.DameDatosTicket(IdTicket: integer; var Valido, SfvNumDosificacion: integer; var SfvCodigoControl, SfvAutorizacion, NIT, NombreCliente: string; var SCcuotaIVA, Liquido: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT VALIDO, SFV_CODIGO_CONTROL, SFV_NUM_DOSIFICACION, SFV_AUTORIZACION, NIT, S_CUOTA_IVA, LIQUIDO, NOMBRE_CLIENTE FROM SFV_DAME_DATOS_TICKET(:ID_TICKET)';
        Params.ByName['ID_TICKET'].AsInteger := IdTicket;
        ExecQuery;
        Valido := FieldByName['VALIDO'].AsInteger;
        SfvCodigoControl := FieldByName['SFV_CODIGO_CONTROL'].AsString;
        SfvNumDosificacion := FieldByName['SFV_NUM_DOSIFICACION'].AsInteger;
        SfvAutorizacion := FieldByName['SFV_AUTORIZACION'].AsString;
        NIT := FieldByName['NIT'].AsString;
        SCcuotaIVA := FieldByName['S_CUOTA_IVA'].AsFloat;
        Liquido := FieldByName['LIQUIDO'].AsFloat;
        NombreCliente := FieldByName['NOMBRE_CLIENTE'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.ExportarSFV;
var
  Archivo : string;
  sl : TStrings;
  Linea : string;
  Contador, Valido, SfvNumDosificacion : integer;
  SfvCodigoControl, SfvAutorizacion, NIT, NombreCliente : string;
  SCuotaIVA, Liquido, Cero : double;

  function DameCodigoSerie(Serie: string): integer;
  begin
     { TODO : Agregar esto a EMP_SERIES }

     Result := 0;

     if (Serie = 'STZ') then
        Result := 1
     else
     if (Serie = 'AMN') then
        Result := 2
     else
     if (Serie = 'CIR') then
        Result := 2
     else
     if (Serie = 'AME') then
        Result := 2;
  end;

  function DameCodigoValido(Valido: integer): string;
  begin
     Result := '0';

     if (Valido = 0) then
        Result := 'V'
     else
     if (Valido = 1) then
        Result := 'A';
  end;

  function LimpiaNIF(NIT: string): string;
  begin
     if (NIT = '') then
        Result := '0'
     else
        Result := NIT;
  end;

  function LimpiaNombreCliente(NombreCliente: string): string;
  begin
     if (NombreCliente = '') then
        Result := 'SIN NOMBRE'
     else
        Result := NombreCliente;
  end;

  function DameImporteIva(Liquido: double): double;
  begin
     Result := (13 / 100) * Liquido;
  end;

begin
  inherited;
  Cero := 0;

  // Obtengo nombre de fichero de exportacion
  Archivo := Format('\ExportacionTicket_%s.txt', [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'TXT', '', 'DMFacturarTickets-ExportarSFV') then
  begin
     sl := TStringList.Create;
     try
        with QMTickets do
        begin
           First;
           Contador := 1;
           while not EOF do
           begin
              DameDatosTicket(QMTicketsID_TICKET.AsInteger, Valido, SfvNumDosificacion, SfvCodigoControl, SfvAutorizacion, NIT, NombreCliente, SCuotaIVA, Liquido);
              // Linea := format('%d|%d|%s|%d|%s|%s|%s|%s|%.2f|%.2f|%.2f|%.2f|%.2f|%.2f|%.2f|%.2f|%s', [...]);
              Linea := '';
              Linea := Linea + Format('%d|', [DameCodigoSerie(QMTicketsSERIE.AsString)]);
              Linea := Linea + Format('%d|', [Contador]);
              Linea := Linea + Format('%s|', [FormatDateTime('dd/mm/yyyy', QMTicketsFECHA.AsDateTime)]);
              Linea := Linea + Format('%d|', [SfvNumDosificacion]);
              Linea := Linea + Format('%s|', [SfvAutorizacion]);
              Linea := Linea + Format('%s|', [DameCodigoValido(Valido)]);
              Linea := Linea + Format('%s|', [LimpiaNIF(NIT)]);
              Linea := Linea + Format('%s|', [LimpiaNombreCliente(NombreCliente)]);
              // Format con parametro tipo %.2f utiliza la configuracion regional. No sirve porque debe serparar siempre con "."
              Linea := Linea + Format('%s|', [FloatToStrDec(Liquido, '.', '0.00')]);
              Linea := Linea + Format('%s|', [FloatToStrDec(Cero, '.', '0.00')]);
              Linea := Linea + Format('%s|', [FloatToStrDec(Cero, '.', '0.00')]);
              Linea := Linea + Format('%s|', [FloatToStrDec(Cero, '.', '0.00')]);
              Linea := Linea + Format('%s|', [FloatToStrDec(Liquido, '.', '0.00')]);
              Linea := Linea + Format('%s|', [FloatToStrDec(Cero, '.', '0.00')]);
              Linea := Linea + Format('%s|', [FloatToStrDec(Liquido, '.', '0.00')]);
              Linea := Linea + Format('%s|', [FloatToStrDec(DameImporteIva(Liquido){SCuotaIVA}, '.', '0.00')]);
              Linea := Linea + Format('%s', [SfvCodigoControl]);
              sl.Add(Linea);
              Next;
           end;
        end;

        sl.SaveToFile(Archivo);
     finally
        sl.Free;
     end;
  end;
end;

procedure TDMFacturarTickets.QMLstTicketsAfterOpen(DataSet: TDataSet);
begin
  QMLstTicketsDetalle.Open;
  QMLstTicketFP.Open;
  xCabeceraFacNIF.Open;
end;

procedure TDMFacturarTickets.QMLstTicketsBeforeClose(DataSet: TDataSet);
begin
  QMLstTicketsDetalle.Close;
  QMLstTicketFP.Close;
  xCabeceraFacNIF.Close;
end;

procedure TDMFacturarTickets.MostrarTickets(Modo: integer);
var
  i : integer;
begin
  // Copio SELECT y asigno parámetros
  with QMLstTickets do
  begin
     Close;
     SelectSQL.Text := QMTickets.SelectSQL.Text;
     for i := 0 to Params.Count - 1 do
        Params[i].Value := QMTickets.Params.ByName[Params[i].Name].Value;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(1040, 0, Modo, Serie, _('Lst. de Tickets'), frTickets, frxTickets, HYReport, nil);
  CierraData(DMListados);
end;

procedure TDMFacturarTickets.MostrarTicketsDetalle(Modo: integer);
var
  i : integer;
begin
  // Copio SELECT y asigno parámetros
  with QMLstTickets do
  begin
     Close;
     SelectSQL.Text := QMTickets.SelectSQL.Text;
     for i := 0 to Params.Count - 1 do
        Params[i].Value := QMTickets.Params.ByName[Params[i].Name].Value;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(1041, 0, Modo, Serie, _('Lst. de Tickets con detalle'), frTickets, frxTickets, HYReport, nil);
  CierraData(DMListados);
end;

procedure TDMFacturarTickets.ValidaAnulados;
begin
  if Confirma then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE GES_TICKET_CABECERA SET ESTADO = 3 WHERE ESTADO = 2 AND ENTRADA_FAC = :ENTRADA_FAC';
           Params.ByName['ENTRADA_FAC'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refrescar(QMTickets, 'ID_TICKET', QMTicketsID_TICKET.AsInteger);
  end;
end;

procedure TDMFacturarTickets.AnulaTicket;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_TICKET_CABECERA ');
        SQL.Add(' SET ');
        SQL.Add(' VALIDO = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_TICKET = :ID_TICKET ');
        Params.ByName['ID_TICKET'].AsInteger := QMTicketsID_TICKET.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMTickets.Refresh;
end;

procedure TDMFacturarTickets.frTicketsGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TotalTarjeta' then
     ParValue := 100;
end;

procedure TDMFacturarTickets.MostrarIngresosEgresos(Modo, DesdeSesion, HastaSesion, DesdeCaja, HastaCaja, DesdeTurno, HastaTurno: integer; Serie: string);
begin
  // Copio SELECT y asigno parámetros
  with QMLstIngresosEgresos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM GES_TPV_INGRESOS_EGRESOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' SERIE = :SERIE AND ');
     SelectSQL.Add(' SESION BETWEEN :DESDE_SESION AND :HASTA_SESION AND ');
     SelectSQL.Add(' CAJA BETWEEN :DESDE_CAJA AND :HASTA_CAJA AND ');
     SelectSQL.Add(' TURNO BETWEEN :DESDE_TURNO AND :HASTA_TURNO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE_SESION'].AsInteger := DesdeSesion;
     Params.ByName['HASTA_SESION'].AsInteger := HastaSesion;
     Params.ByName['DESDE_CAJA'].AsInteger := DesdeCaja;
     Params.ByName['HASTA_CAJA'].AsInteger := HastaCaja;
     Params.ByName['DESDE_TURNO'].AsInteger := DesdeTurno;
     Params.ByName['HASTA_TURNO'].AsInteger := HastaTurno;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(1042, 0, Modo, Serie, _('Lst. de Ingresos y Egresos'), frTickets, frxTickets, HYReport, nil);
  CierraData(DMListados);
end;

procedure TDMFacturarTickets.frxTicketsGetValue(const VarName: string; var Value: variant);
begin
  frTicketsGetValue(VarName, Value);
end;

procedure TDMFacturarTickets.AsignaCanal(Canal: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_TICKETS_FACTURACION ');
        SQL.Add(' SET ');
        SQL.Add(' CANAL_A_FACTURAR = :CANAL_A_FACTURAR ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' ENTRADA_FAC = :ENTRADA_FAC ');
        SQL.Add(' AND CANAL_A_FACTURAR <> :CANAL_A_FACTURAR ');
        SQL.Add(' AND FACTURACION = 0  ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CANAL_A_FACTURAR'].AsInteger := Canal;
        Params.ByName['ENTRADA_FAC'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMTickets, 'ID_TICKET', QMTicketsID_TICKET.AsInteger);
end;

procedure TDMFacturarTickets.FiltraUnTicket(IdTicket: integer);
var
  Empresa, Ejercicio, Canal, RIT, Sesion, Caja, Turno : integer;
  Serie, Tipo : string;
begin
  // Obtengo datos de sesion-caja-turno
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIT, SESION, CAJA, TURNO FROM VER_TICKETS_FACTURACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_TICKET = :ID_TICKET ');
        Params.ByName['ID_TICKET'].AsInteger := IdTicket;
        ExecQuery;
        Empresa := FieldByName['EMPRESA'].AsInteger;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Serie := FieldByName['SERIE'].AsString;
        Tipo := FieldByName['TIPO'].AsString;
        RIT := FieldByName['RIT'].AsInteger;
        Sesion := FieldByName['SESION'].AsInteger;
        Caja := FieldByName['CAJA'].AsInteger;
        Turno := FieldByName['TURNO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((Empresa <> REntorno.Empresa) or (Ejercicio <> REntorno.Ejercicio) or (Canal <> REntorno.Canal)) then
     raise ERangeError.CreateFmt(
        'El ticket no pertenece a la sesion actual %d-%d',
        [Ejercicio, Canal]);

  // Filtro sesion para establecer valores de entorno
  FiltrarSesion(Sesion, Sesion, Caja, Caja, Turno, Turno, EncodeDate(REntorno.Ejercicio, 1, 1), EncodeDate(REntorno.Ejercicio, 12, 31), Tipo, False, False, False, False, False, False, Rit);

  // Desmarco cualquier otro ticket que estuviera marcado
  LimpiaEntradas;

  // Abro tabla de tickets con un solo ticket
  with QMTickets do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_TICKETS_FACTURACION ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_TICKET = :ID_TICKET ');

     Params.ByName['ID_TICKET'].AsInteger := IdTicket;

     Open;
  end;

  Filtrado := True;

  // Refresco totales - Creo que no es necesario pero lo dejo para tener proceso completo
  RefrescaTotal(Tipo);
end;

function TDMFacturarTickets.FacturarUnTicket(IdTicket: integer; SerieDestino: string; PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas, FacturarFechaEspecifica: boolean; FechaValor: TDateTime): integer;
begin
  /// Factura un ticket y devuelve el ID_S de la factura generada

  FiltraUnTicket(IdTicket);

  // Marco el ticket para ser facturado
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_TICKET_CABECERA SET ENTRADA_FAC = :ENTRADA WHERE ID_TICKET = :ID_TICKET';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_TICKET'].AsInteger := IdTicket;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaSeleccion;
  RefrescaTotal(Tipo);

  // Facturo el ticket
  if (ComprobarLinea) then
     FacturaUnicaMuestra(SerieDestino, QMTicketsSESION.AsInteger, QMTicketsSESION.AsInteger, PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas, FacturarFechaEspecifica, FechaValor)
  else
     ShowMessage(_('¡No se ha seleccionado ninguna línea para facturar!'));

  // Obtengo el id de la factura creada
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT D_ID_S FROM GES_CABECERAS_RELACIONES WHERE O_TIPO = ''TIC'' AND O_ID_S = :ID_TICKET';
        Params.ByName['ID_TICKET'].AsInteger := IdTicket;
        ExecQuery;
        Result := FieldByName['D_ID_S'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturarTickets.TicketAAlbaran(IdTicket: integer; SerieDst: string);
begin
  // Buscamos datos del Ticket
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TICKET_A_ALBARAN ( ');
        SQL.Add(' :ID_TICKET, :ENTRADA, :D_CANAL, :POR_FECHA, :FECHA_VALOR, :FACTURACION) ');
        Params.ByName['ID_TICKET'].AsInteger := IdTicket;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['POR_FECHA'].AsInteger := 0;
        Params.ByName['FECHA_VALOR'].AsDateTime := Now;
        Params.ByName['FACTURACION'].AsInteger := 0;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
