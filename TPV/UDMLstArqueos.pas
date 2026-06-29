unit UDMLstArqueos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBQuery, UHYReport,
  HYFIBQuery, FIBDataSetRO, FRD_Mngr, Variants, frxClass, frxHYReport,
  frxDBSet;

const
  CT_SESION = 0;
  CT_CAJA = 1;
  CT_TURNO = 2;

type
  TDMLstArqueos = class(TDataModule)
     TLocal: THYTransaction;
     frArqueos: TfrHYReport;
     HYReport: THYReport;
     xCabSesion: TFIBDataSetRO;
     QFormaPago: THYFIBQuery;
     QSaldoInicial: THYFIBQuery;
     xCabCaja: TFIBDataSetRO;
     xCabTurno: TFIBDataSetRO;
     DSxCabecera: TDataSource;
     xDetalleSesion: TFIBDataSetRO;
     xDetalleCaja: TFIBDataSetRO;
     xDetalleTurno: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     xDetalleCajaEMPRESA: TIntegerField;
     xDetalleCajaEJERCICIO: TIntegerField;
     xDetalleCajaCANAL: TIntegerField;
     xDetalleCajaSERIE: TFIBStringField;
     xDetalleCajaCAJA: TIntegerField;
     xDetalleCajaFORMA_PAGO: TFIBStringField;
     xDetalleCajaTOTAL_COBRADO: TFloatField;
     xDetalleTurnoEMPRESA: TIntegerField;
     xDetalleTurnoEJERCICIO: TIntegerField;
     xDetalleTurnoCANAL: TIntegerField;
     xDetalleTurnoSERIE: TFIBStringField;
     xDetalleTurnoCAJA: TIntegerField;
     xDetalleTurnoTURNO: TIntegerField;
     xDetalleTurnoFORMA_PAGO: TFIBStringField;
     xDetalleTurnoTOTAL_COBRADO: TFloatField;
     HYRSxCabSesion: THYReportSource;
     HYRSxCabCaja: THYReportSource;
     frDBxCabecera: TfrDBDataSet;
     HYRSxCabecera: THYReportSource;
     HYRSxDetSesion: THYReportSource;
     HYRSxDetCaja: THYReportSource;
     frDBxDetalle: TfrDBDataSet;
     HYRSDetalle: THYReportSource;
     xCabSesionEMPRESA: TIntegerField;
     xCabSesionEJERCICIO: TIntegerField;
     xCabSesionCANAL: TIntegerField;
     xCabSesionSERIE: TFIBStringField;
     xCabSesionSESION: TIntegerField;
     xCabSesionABIERTA: TIntegerField;
     xCabSesionI_IVA: TFloatField;
     xCabSesionB_IMPONIBLE: TFloatField;
     xCabSesionTOTAL_SESION: TFloatField;
     xCabSesionFECHA_INICIO: TDateTimeField;
     xCabSesionFECHA_FIN: TDateTimeField;
     xCabSesionUSUARIO_ABRE: TIntegerField;
     xCabSesionUSUARIO_CIERRA: TIntegerField;
     xCabCajaEMPRESA: TIntegerField;
     xCabCajaEJERCICIO: TIntegerField;
     xCabCajaCANAL: TIntegerField;
     xCabCajaSERIE: TFIBStringField;
     xCabCajaSESION: TIntegerField;
     xCabCajaCAJA: TIntegerField;
     xCabCajaABIERTA: TIntegerField;
     xCabCajaI_IVA: TFloatField;
     xCabCajaB_IMPONIBLE: TFloatField;
     xCabCajaTOTAL_SESION: TFloatField;
     xCabCajaFECHA_INICIO: TDateTimeField;
     xCabCajaFECHA_FIN: TDateTimeField;
     xCabCajaUSUARIO_ABRE: TIntegerField;
     xCabCajaUSUARIO_CIERRA: TIntegerField;
     xCabTurnoEMPRESA: TIntegerField;
     xCabTurnoEJERCICIO: TIntegerField;
     xCabTurnoCANAL: TIntegerField;
     xCabTurnoSERIE: TFIBStringField;
     xCabTurnoSESION: TIntegerField;
     xCabTurnoCAJA: TIntegerField;
     xCabTurnoTURNO: TIntegerField;
     xCabTurnoABIERTO: TIntegerField;
     xCabTurnoI_IVA: TFloatField;
     xCabTurnoB_IMPONIBLE: TFloatField;
     xCabTurnoTOTAL_TURNO: TFloatField;
     xCabTurnoFECHA_INICIO: TDateTimeField;
     xCabTurnoFECHA_FIN: TDateTimeField;
     xCabTurnoUSUARIO_ABRE: TIntegerField;
     xCabTurnoUSUARIO_CIERRA: TIntegerField;
     xCabTurnoCAMBIO_ENTREGADO: TFloatField;
     xDetalleSesionEMPRESA: TIntegerField;
     xDetalleSesionEJERCICIO: TIntegerField;
     xDetalleSesionCANAL: TIntegerField;
     xDetalleSesionSERIE: TFIBStringField;
     xDetalleSesionFORMA_PAGO: TFIBStringField;
     xDetalleSesionTOTAL_COBRADO: TFloatField;
     xMonedas: TFIBDataSetRO;
     xCreditos: TFIBDataSetRO;
     DSxCreditos: TDataSource;
     DSxMonedas: TDataSource;
     frDBxMonedas: TfrDBDataSet;
     HYRSxCreditos: THYReportSource;
     HYRSxMonedas: THYReportSource;
     frDBDSxCreditos: TfrDBDataSet;
     xCobros: TFIBDataSetRO;
     DSxCobros: TDataSource;
     frDBDSxCobros: TfrDBDataSet;
     HYRSxCobros: THYReportSource;
     xGastos: TFIBDataSetRO;
     HYRSxGastos: THYReportSource;
     frDBDSxGastos: TfrDBDataSet;
     DSxGastos: TDataSource;
     xMonedasMONEDA: TFIBStringField;
     xMonedasLIQUIDO: TFloatField;
     xMonedasLIQUIDO_CANAL: TFloatField;
     xCreditosCLIENTE: TIntegerField;
     xCreditosNOMBRE_R_SOCIAL: TFIBStringField;
     xCreditosLIQUIDO_CANAL: TFloatField;
     xCobrosCLIENTE: TIntegerField;
     xCobrosNOMBRE_R_SOCIAL: TFIBStringField;
     xCobrosLIQUIDO_CANAL: TFloatField;
     xBancos: TFIBDataSetRO;
     DSxBancos: TDataSource;
     frDBDSxBancos: TfrDBDataSet;
     HYRSxBancos: THYReportSource;
     xBancosFORMA_PAGO: TFIBStringField;
     xBancosTITULO: TFIBStringField;
     xBancosLIQUIDO_CANAL: TFloatField;
     QTotalVenta: THYFIBQuery;
     xContado: TFIBDataSetRO;
     DSxContado: TDataSource;
     frDBDSxContado: TfrDBDataSet;
     HYRSxContado: THYReportSource;
     xCabTurnoDIFERENCIA: TFloatField;
     xCabTurnoSALDO: TFloatField;
     DSxCabSesion: TDataSource;
     frDBDSxCabSesion: TfrDBDataSet;
     DSxCabCaja: TDataSource;
     frDBDSxCabCaja: TfrDBDataSet;
     DSxDetalleSesion: TDataSource;
     frDSxDetalleSesion: TfrDBDataSet;
     DSxDetalleCaja: TDataSource;
     frDSxDetalleCaja: TfrDBDataSet;
     QEntregas: THYFIBQuery;
     QVales: THYFIBQuery;
     frxArqueos: TfrxHYReport;
     frxDSxDetalleSesion: TfrxDBDataset;
     frxDSxDetalleCaja: TfrxDBDataset;
     frxDBxDetalle: TfrxDBDataset;
     frxDBDSxCabSesion: TfrxDBDataset;
     frxDBDSxCabCaja: TfrxDBDataset;
     frxDBxCabecera: TfrxDBDataset;
     frxDBxMonedas: TfrxDBDataset;
     frxDBDSxCreditos: TfrxDBDataset;
     frxDBDSxCobros: TfrxDBDataset;
     frxDBDSxGastos: TfrxDBDataset;
     frxDBDSxBancos: TfrxDBDataset;
     frxDBDSxContado: TfrxDBDataset;
     xArqueoTurno: TFIBDataSetRO;
     DSxArqueoTurno: TDataSource;
     frDBxArqueoTurno: TfrDBDataSet;
     HYRxArqueoTurno: THYReportSource;
     frxDBxArqueoTurno: TfrxDBDataset;
     xArqueoTurnoEMPRESA: TIntegerField;
     xArqueoTurnoEJERCICIO: TIntegerField;
     xArqueoTurnoCANAL: TIntegerField;
     xArqueoTurnoSERIE: TFIBStringField;
     xArqueoTurnoSESION: TIntegerField;
     xArqueoTurnoCAJA: TIntegerField;
     xArqueoTurnoTURNO: TIntegerField;
     xArqueoTurnoTIPO: TFIBStringField;
     xArqueoTurnoORDEN: TIntegerField;
     xArqueoTurnoTITULO: TFIBStringField;
     xArqueoTurnoIMPORTE: TFloatField;
     xArqueoTurnoUNIDADES: TIntegerField;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     frDSxSeries: TfrDBDataSet;
     xGastosEMPRESA: TIntegerField;
     xGastosEJERCICIO: TIntegerField;
     xGastosCANAL: TIntegerField;
     xGastosSERIE: TFIBStringField;
     xGastosTIPO: TFIBStringField;
     xGastosRIT: TIntegerField;
     xGastosRVT: TIntegerField;
     xGastosSESION: TIntegerField;
     xGastosCAJA: TIntegerField;
     xGastosTURNO: TIntegerField;
     xGastosUSUARIO: TIntegerField;
     xGastosALMACEN: TFIBStringField;
     xGastosMONEDA: TFIBStringField;
     xGastosFECHA: TDateTimeField;
     xGastosDESCRIPCION: TFIBStringField;
     xGastosFORMA_PAGO: TFIBStringField;
     xGastosNOTAS: TBlobField;
     xGastosTERCERO: TIntegerField;
     xGastosCLIENTE: TIntegerField;
     xGastosESTADO: TIntegerField;
     xGastosMODO_IVA: TIntegerField;
     xGastosENTRADA: TIntegerField;
     xGastosBRUTO: TFloatField;
     xGastosI_DTO_LINEAS: TFloatField;
     xGastosS_CUOTA_IVA: TFloatField;
     xGastosS_CUOTA_RE: TFloatField;
     xGastosDTO_CIAL: TFloatField;
     xGastosI_DTO_CIAL: TFloatField;
     xGastosDTO_PP: TFloatField;
     xGastosI_DTO_PP: TFloatField;
     xGastosS_BASES: TFloatField;
     xGastosLINEAS: TIntegerField;
     xGastosLIQUIDO: TFloatField;
     xGastosB_DTO_LINEAS: TFloatField;
     xGastosCONTROL_STOCK: TIntegerField;
     xGastosA_DEVOLVER: TFloatField;
     xGastosENTRADA_FAC: TIntegerField;
     xGastosDEVOLUCION: TIntegerField;
     xGastosTARIFA: TFIBStringField;
     xGastosS_CUOTA_IVA_CANAL: TFloatField;
     xGastosS_CUOTA_RE_CANAL: TFloatField;
     xGastosS_BASES_CANAL: TFloatField;
     xGastosCHG_MONEDA: TIntegerField;
     xGastosA_DEVOLVER_CANAL: TFloatField;
     xGastosLIQUIDO_CANAL: TFloatField;
     xGastosACREEDOR: TIntegerField;
     xGastosTIPO_GASTO: TIntegerField;
     xGastosTIPO_RELACION: TFIBStringField;
     xGastosCANAL_A_FACTURAR: TIntegerField;
     xGastosAGENTE: TIntegerField;
     xGastosFACTURACION: TIntegerField;
     xGastosID_TICKET: TIntegerField;
     xGastosID_TICKET_DEVOLUCION: TIntegerField;
     xContadoFORMA_PAGO: TFIBStringField;
     xContadoTITULO: TFIBStringField;
     xContadoLIQUIDO_CANAL: TFloatField;
     QTotalIngresos: THYFIBQuery;
     QTotalEgresos: THYFIBQuery;
     procedure DMLstArqueosCreate(Sender: TObject);
     procedure DMLstArqueosDestroy(Sender: TObject);
     procedure frArqueosGetValue(const ParName: string; var ParValue: variant);
     procedure frArqueosEnterRect(Memo: TStringList; View: TfrView);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frxArqueosBeforePrint(Sender: TfrxReportComponent);
     procedure xArqueoTurnoAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     TipoListado: integer;
     Serie: string;
     Sesion, Caja, Turno: integer;
     FechaDesde, FechaHasta: TDateTime;
     Total, SaldoIni, Entregas, Vales: double;
     PorFechas: byte;
     procedure GenerarSQL(Filtro: byte);
     function GetFormaPago: string;
     function GetTotal: double;
     function GetSaldoInicial: double;
     procedure AbrirDataSets(DSCabecera, DSDetalle: TFIBDataSetRO; FiltrarFechas: boolean; var HayDatos: boolean);
     procedure AbrirDataSet(DS: TFIBDataSetRO; FiltrarFechas: boolean);
     function GetTotalVenta: double;
     function GetSaldoFinal: double;
     procedure AbrirSaldos;
     function GetDiferencia: double;
     procedure DameSesionMenor(FechaDesde, FechaHasta: TDateTime);
     function DameTotales: double;
     function DameDistintasSesiones: string;
     function GetVales: double;
     function GetEntregas: double;
     procedure AbrirTotalIngresos;
     function GetTotalIngresos: double;
     procedure AbrirTotalEgresos;
     function GetTotalEgresos: double;
  public
     { Public declarations }
     procedure MostrarListado(const aSerie: string; aSesion, aCaja, aTurno: integer; aTipoListado, Modo: integer);
     procedure MostrarListadoFechas(const aSerie: string; aSesion, aCaja, aTurno: integer; aFechaDesde, aFechaHasta: TDateTime; aTipoListado, Modo: integer);
  end;

var
  DMLstArqueos : TDMLstArqueos;

implementation

uses UDMListados, UEntorno, UFormGest, UUtiles, UDMMain, UFMain;

{$R *.DFM}

procedure TDMLstArqueos.DMLstArqueosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMLstArqueos.DMLstArqueosDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

{ Listado de Arqueos }
procedure TDMLstArqueos.MostrarListado(const aSerie: string; aSesion, aCaja, aTurno: integer; aTipoListado, Modo: integer);
var
  Titulo : string;
  HayDatos : boolean;
  Grupo : integer;
begin
  // Asignar variables
  PorFechas := 0;
  TipoListado := aTipoListado;
  Serie := aSerie;
  Sesion := aSesion;
  Caja := aCaja;
  Turno := aTurno;

  GenerarSQL(PorFechas);

  case TipoListado of
     CT_SESION: AbrirDataSets(xCabSesion, xDetalleSesion, False, HayDatos);
     CT_CAJA: AbrirDataSets(xCabCaja, xDetalleCaja, False, HayDatos);
     CT_TURNO:
     begin
        AbrirDataSets(xCabTurno, xDetalleTurno, False, HayDatos);
        AbrirDataSet(xArqueoTurno, False);
     end;
  end;

  if (not HayDatos) then
  begin
     if (TipoListado = CT_TURNO) then
        HayDatos := (not xArqueoTurno.IsEmpty);

     if (not HayDatos) then
     begin
        ShowMessage(_('El Listado no Contiene Datos'));
        Exit;
     end;
  end;

  // Cargar el listado
  Grupo := 99;
  case TipoListado of
     CT_SESION:
     begin
        Grupo := 87;
        Titulo := _('Listados por Sesión');
     end;
     CT_CAJA:
     begin
        Grupo := 98;
        Titulo := _('Listados por Caja');
     end;
     CT_TURNO:
     begin
        Grupo := 99;
        Titulo := _('Listados por Turno');
     end;
  end;

  frArqueos.ChangePrinter(0, GetPrinterIndex(REntorno.Ticketera));
  frxArqueos.Report.PrintOptions.Printer := GetPrinterName(REntorno.Ticketera);

  DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frArqueos, frxArqueos, HYReport, nil);
end;

{ Listado de Arqueos Filtrado por Fechas }
procedure TDMLstArqueos.MostrarListadoFechas(const aSerie: string; aSesion, aCaja, aTurno: integer; aFechaDesde, aFechaHasta: TDateTime; aTipoListado, Modo: integer);
var
  Titulo : string;
  HayDatos : boolean;
  Grupo : integer;
begin
  // Asignar variables
  PorFechas := 1;
  TipoListado := aTipoListado;
  Serie := aSerie;
  Sesion := aSesion;
  Caja := aCaja;
  Turno := aTurno;
  FechaDesde := aFechaDesde;
  FechaHasta := aFechaHasta;

  DameSesionMenor(FechaDesde, FechaHasta);
  GenerarSQL(PorFechas);  // Filtrado por Fechas

  case TipoListado of
     CT_SESION: AbrirDataSets(xCabSesion, xDetalleSesion, True, HayDatos);
     CT_CAJA: AbrirDataSets(xCabCaja, xDetalleCaja, True, HayDatos);
     CT_TURNO:
     begin
        AbrirDataSets(xCabTurno, xDetalleTurno, True, HayDatos);
        AbrirDataSet(xArqueoTurno, True);
     end;
  end;

  if (not HayDatos) then
  begin
     if (TipoListado = CT_TURNO) then
        HayDatos := (not xArqueoTurno.IsEmpty);

     if (not HayDatos) then
     begin
        ShowMessage(_('El Listado no Contiene Datos'));
        Exit;
     end;
  end;

  // Cargar el listado
  Grupo := 99;
  case TipoListado of
     CT_SESION:
     begin
        Grupo := 87;
        Titulo := _('Listados por Sesión');
     end;
     CT_CAJA:
     begin
        Grupo := 98;
        Titulo := _('Listados por Caja');
     end;
     CT_TURNO:
     begin
        Grupo := 99;
        Titulo := _('Listados por Turno');
     end;
  end;

  frArqueos.ChangePrinter(0, GetPrinterIndex(REntorno.Ticketera));
  frxArqueos.Report.PrintOptions.Printer := GetPrinterName(REntorno.Ticketera);

  DMListados.Imprimir(Grupo, 0, Modo, '', Titulo, frArqueos, frxArqueos, HYReport, nil);
end;

procedure TDMLstArqueos.GenerarSQL(Filtro: byte);
begin
  with xGastos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM GES_TICKET_CABECERA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TIPO = ''TAC'' AND ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE ');
  end;

  case TipoListado of
     CT_SESION:
     begin
        // Listado por SESIÓN
        with xCabSesion do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM GES_TPV_SESIONES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SelectSQL.Add(' CANAL = ?CANAL AND ');
           SelectSQL.Add(' SERIE = ?SERIE AND ');
           SelectSQL.Add(' SESION = ?SESION ');
        end;
        with xDetalleSesion do
        begin
           Close;
           if (Filtro = 0) then
           begin
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT * FROM GES_TPV_SESIONES_FP ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SelectSQL.Add(' CANAL = ?CANAL AND ');
              SelectSQL.Add(' SERIE = ?SERIE AND ');
              SelectSQL.Add(' SESION = ?SESION ');
           end
           else
              SelectSQL.Text := 'SELECT * FROM LST_ARQUEO_DET_SESION(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?FECHA_DESDE, ?FECHA_HASTA)';
        end;

        with xGastos.QSelect.SQL do
        begin
           if (Filtro = 0) then
              Add(' AND SESION = ?SESION')
           else
              Add(' AND FECHA >= ?FECHA_DESDE AND FECHA <= ?FECHA_HASTA');
        end;
     end;
     CT_CAJA:
     begin
        with xCabCaja do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM GES_TPV_SESIONES_CAJAS ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SelectSQL.Add(' CANAL = ?CANAL AND ');
           SelectSQL.Add(' SERIE = ?SERIE AND ');
           SelectSQL.Add(' CAJA = ?CAJA AND ');
           SelectSQL.Add(' SESION = ?SESION ');
        end;
        with xDetalleCaja do
        begin
           Close;
           if (Filtro = 0) then
           begin
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT * FROM GES_TPV_SESIONES_CAJAS_FP ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SelectSQL.Add(' CANAL = ?CANAL AND ');
              SelectSQL.Add(' SERIE = ?SERIE AND ');
              SelectSQL.Add(' SESION = ?SESION AND ');
              SelectSQL.Add(' CAJA = ?CAJA ');
           end
           else
              SelectSQL.Text := 'SELECT * FROM LST_ARQUEO_DET_SESION_CAJA(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?CAJA, ?FECHA_DESDE, ?FECHA_HASTA)';
        end;

        with xGastos.QSelect.SQL do
        begin
           if (Filtro = 0) then
              Add(' AND SESION = ?SESION AND CAJA = ?CAJA ')
           else
              Add(' AND FECHA >= ?FECHA_DESDE AND FECHA <= ?FECHA_HASTA ');
        end;
     end;
     CT_TURNO:
     begin
        with xCabTurno do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM GES_TPV_SESIONES_CAJAS_TURNO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SelectSQL.Add(' CANAL = ?CANAL AND ');
           SelectSQL.Add(' SERIE = ?SERIE AND ');
           SelectSQL.Add(' CAJA = ?CAJA AND ');
           SelectSQL.Add(' TURNO = ?TURNO AND ');
           SelectSQL.Add(' SESION = ?SESION ');
        end;
        with xDetalleTurno do
        begin
           Close;
           if (Filtro = 0) then
           begin
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT * FROM GES_TPV_SESIONES_CAJAS_TURNO_FP ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SelectSQL.Add(' CANAL = ?CANAL AND ');
              SelectSQL.Add(' SERIE = ?SERIE AND ');
              SelectSQL.Add(' SESION = ?SESION AND ');
              SelectSQL.Add(' CAJA = ?CAJA AND ');
              SelectSQL.Add(' TURNO = ?TURNO ');
           end
           else
              SelectSQL.Text := 'SELECT * FROM LST_ARQUEO_DET_SESION_TURNO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?CAJA, ?TURNO, ?FECHA_DESDE, ?FECHA_HASTA)';
        end;

        with xGastos.QSelect.SQL do
        begin
           if (Filtro = 0) then
           begin
              Add(' AND SESION = ?SESION ');
              Add(' AND CAJA = ?CAJA ');
              Add(' AND TURNO = ?TURNO ');
           end
           else
           begin
              Add(' AND FECHA >= ?FECHA_DESDE ');
              Add(' AND FECHA <= ?FECHA_HASTA ');
           end;
        end;

        with xArqueoTurno do
        begin
           Close;
           if (Filtro = 0) then
              SelectSQL.Text := 'SELECT * FROM LST_ARQUEO_TURNO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?SESION, ?CAJA, ?TURNO) ORDER BY TIPO, ORDEN'
           else
              SelectSQL.Text := 'SELECT * FROM LST_ARQUEO_TURNO_FECHAS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?CAJA, ?FECHA_DESDE, ?FECHA_HASTA) ORDER BY TIPO, ORDEN';
        end;
     end;
  end;

  with QSaldoInicial do
  begin
     Close;
     SQL.Clear;
     case TipoListado of
        CT_SESION:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(CAMBIO_ENTREGADO) AS TOTAL, SUM(SALDO),SUM(DIFERENCIA) AS TOTAL_DIFERENCIA ');
              SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(CAMBIO_ENTREGADO) AS TOTAL,SUM(SALDO), SUM(DIFERENCIA) AS TOTAL_DIFERENCIA ');
              SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA ) ');
           end;
        end;
        CT_CAJA:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(CAMBIO_ENTREGADO) AS TOTAL,SUM(SALDO) AS TOTAL_SALDO, SUM(DIFERENCIA) as TOTAL_DIFERENCIA ');
              SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA ');
           end
           else
              SQL.Add(' SELECT SUM(CAMBIO_ENTREGADO) AS TOTAL, SUM(SALDO) AS TOTAL_SALDO,SUM(DIFERENCIA) AS TOTAL_DIFERENCIA ');
           SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' CAJA = ?CAJA AND ');
           SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
           SQL.Add('            WHERE ');
           SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
           SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
           SQL.Add('            TPV.CANAL = ?CANAL AND ');
           SQL.Add('            TPV.SERIE = ?SERIE AND ');
           SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
           SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA ) ');
        end;
        CT_TURNO:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT CAMBIO_ENTREGADO AS TOTAL,SALDO AS TOTAL_SALDO, DIFERENCIA AS TOTAL_DIFERENCIA ');
              SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO ');
           end
           else
           begin
              SQL.Add(' SELECT CAMBIO_ENTREGADO AS TOTAL, SALDO AS TOTAL_SALDO, DIFERENCIA AS TOTAL_DIFERENCIA ');
              SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA) ');
           end;
        end;
     end;
  end;

  // Vales
  with QVales do
  begin
     Close;
     SQL.Clear;
     case TipoListado of
        CT_SESION:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS VALES FROM EMP_CLIENTES_VALES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS VALES FROM EMP_CLIENTES_VALES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO= ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
           end;
        end;
        CT_CAJA:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS VALES FROM EMP_CLIENTES_VALES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS VALES FROM EMP_CLIENTES_VALES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
           end;
        end;
        CT_TURNO:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS VALES FROM EMP_CLIENTES_VALES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS VALES FROM EMP_CLIENTES_VALES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL =?CANAL AND ');
              SQL.Add(' SERIE =?SERIE AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
           end;
        end;
     end;
  end;

  // Entregas
  with QEntregas do
  begin
     Close;
     case TipoListado of
        CT_SESION:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS ENTREGAS FROM EMP_CLIENTES_ENTREGAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS ENTREGAS FROM EMP_CLIENTES_ENTREGAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
           end;
        end;
        CT_CAJA:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS ENTREGAS FROM EMP_CLIENTES_ENTREGAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS ENTREGAS FROM EMP_CLIENTES_ENTREGAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
           end;
        end;
        CT_TURNO:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS ENTREGAS FROM EMP_CLIENTES_ENTREGAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS ENTREGAS FROM EMP_CLIENTES_ENTREGAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA <= ?FECHA_HASTA ');
           end;
        end;
     end;
  end;

  // Total Igresos
  with QTotalIngresos do
  begin
     Close;
     SQL.Clear;
     case TipoListado of
        CT_SESION:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''ENT'' ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''ENT'' AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA ) ');
           end;
        end;
        CT_CAJA:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''ENT''');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''ENT'' AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA ) ');
           end;
        end;
        CT_TURNO:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''ENT'' ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''ENT'' AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA) ');
           end;
        end;
     end;
  end;

  // Total Egresos
  with QTotalEgresos do
  begin
     Close;
     SQL.Clear;
     case TipoListado of
        CT_SESION:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''SAL'' ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''SAL'' AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA ) ');
           end;
        end;
        CT_CAJA:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''SAL''');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''SAL'' AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA ) ');
           end;
        end;
        CT_TURNO:
        begin
           if (Filtro = 0) then
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' SESION = ?SESION AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''SAL'' ');
           end
           else
           begin
              SQL.Add(' SELECT SUM(IMPORTE) AS TOTAL ');
              SQL.Add(' FROM GES_TPV_INGRESOS_EGRESOS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' TIPO_MOVIMIENTO = ''SAL'' AND ');
              SQL.Add(' SESION IN (SELECT SESION FROM GES_TPV_SESIONES TPV ');
              SQL.Add('            WHERE ');
              SQL.Add('            TPV.EMPRESA = ?EMPRESA AND ');
              SQL.Add('            TPV.EJERCICIO = ?EJERCICIO AND ');
              SQL.Add('            TPV.CANAL = ?CANAL AND ');
              SQL.Add('            TPV.SERIE = ?SERIE AND ');
              SQL.Add('            TPV.FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add('            TPV.FECHA_INICIO <= ?FECHA_HASTA) ');
           end;
        end;
     end;
  end;
end;

procedure TDMLstArqueos.AbrirDataSet(DS: TFIBDataSetRO; FiltrarFechas: boolean);
var
  Fecha_Desde, Fecha_Hasta : TDateTime;
begin
  with DS do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;

     if Params.ByName['SESION'] <> nil then
        Params.ByName['SESION'].AsInteger := Sesion;

     if Params.ByName['CAJA'] <> nil then
        Params.ByName['CAJA'].AsInteger := -1;

     if Params.ByName['TURNO'] <> nil then
        Params.ByName['TURNO'].AsInteger := -1;

     if (TipoListado = CT_CAJA) then
     begin
        if Params.ByName['CAJA'] <> nil then
           Params.ByName['CAJA'].AsInteger := Caja;
     end;

     if (TipoListado = CT_TURNO) then
     begin
        if Params.ByName['CAJA'] <> nil then
           Params.ByName['CAJA'].AsInteger := Caja;
        if Params.ByName['TURNO'] <> nil then
           Params.ByName['TURNO'].AsInteger := Turno;
     end;

     if (FiltrarFechas) then
     begin
        Fecha_Desde := HourIntoDate(FechaDesde, '00:00:00');
        Fecha_Hasta := HourIntoDate(FechaHasta, '23:59:59');
        if Params.ByName['FECHA_DESDE'] <> nil then
           Params.ByName['FECHA_DESDE'].AsDateTime := Fecha_Desde; // FechaDesde;
        if Params.ByName['FECHA_HASTA'] <> nil then
           Params.ByName['FECHA_HASTA'].AsDateTime := Fecha_Hasta; // int(FechaHasta)+0.999998
     end;
     Open;
  end;
end;

procedure TDMLstArqueos.AbrirDataSets(DSCabecera, DSDetalle: TFIBDataSetRO; FiltrarFechas: boolean; var HayDatos: boolean);
begin
  HayDatos := False;
  AbrirDataSet(DSCabecera, FiltrarFechas);
  AbrirDataSet(DSDetalle, FiltrarFechas);
  AbrirDataSet(xCreditos, False);
  AbrirDataSet(xCobros, False);
  AbrirDataSet(xGastos, FiltrarFechas{false});
  AbrirDataSet(xBancos, False);
  AbrirDataSet(xContado, False);
  DsxCabecera.DataSet := DSCabecera;
  DsxDetalle.DataSet := DSDetalle;
  HayDatos := (DSCabecera.RecordCount > 0);
end;

procedure TDMLstArqueos.frArqueosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Empresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'TituloListado' then
     case TipoListado of
        CT_SESION: ParValue := _('Listado de Arqueo por Sesión');
        CT_CAJA: ParValue := _('Listado de Arqueo por Caja');
        CT_TURNO: ParValue := _('Listado de Arqueo por Turno');
     end;

  if ParName = 'Fecha' then
     if (PorFechas = 0) then
        case TipoListado of
           0: ParValue := xCabSesionFECHA_INICIO.AsDateTime;
           1: ParValue := xCabCajaFECHA_INICIO.AsDateTime;
           2: ParValue := xCabTurnoFECHA_INICIO.AsDateTime;
        end
     else
        ParValue := FormatDateTime(_('"Desde: "dd/mm/yyyy'), Trunc(FechaDesde)) + ' ' + FormatDateTime(_('"Hasta: "dd/mm/yyyy'), Trunc(FechaHasta));

  if ParName = 'ParamsListado' then
  begin
     ParValue := Format(_('SESIÓN: %s'), [IntToStr(Sesion)]);
     if (TipoListado > CT_SESION) then
        ParValue := ParValue + ' ' + Format(_(' CAJA: %s'), [IntToStr(Caja)]);
     if (TipoListado = CT_TURNO) then
        ParValue := ParValue + ' ' + Format(_(' TURNO: %s'), [IntToStr(Turno)]);
  end;

  if ParName = 'TXT_SESION_CAJA_TURNO' then
  begin
     if (PorFechas = 0) then
        case TipoLIstado of
           0: ParValue := Format(_('Sesion: %s'), [IntToStr(xCabSesionSESION.AsInteger)]);
           1: ParValue := Format(_('Sesion: %s'), [IntToStr(xCabCajaSESION.AsInteger)]) + ' ' + Format(_(' Caja: %s'), [IntToStr(xCabCajaCAJA.AsInteger)]);
           2: ParValue := Format(_('Sesion: %s'), [IntToStr(xCabTurnoSESION.AsInteger)]) + ' ' + Format(_(' Caja: %s'), [IntToStr(xCabTurnoCAJA.AsInteger)]) + ' ' + Format(_('Turno: %s'), [IntToStr(xCabTurnoTURNO.AsInteger)]);
        end
     else
     begin
        ParValue := DameDistintasSesiones;
        if (TipoListado = 1) then
           ParValue := ParValue + ' ' + Format(_('Caja: %s'), [IntToStr(xCabCajaCAJA.AsInteger)]);
        if (TipoListado = 2) then
           ParValue := ParValue + ' ' + Format(_('Caja: %s'), [IntToStr(xCabTurnoCAJA.AsInteger)]) + ' ' + Format(_('Turno: %s'), [IntToStr(xCabTurnoTURNO.AsInteger)]);
     end;
  end;

  if ParName = 'Serie' then
     ParValue := _('Serie') + ': ' + Serie;

  if ParName = 'Saldo_Inicial' then
     ParValue := GetSaldoInicial;

  if ParName = 'Saldo_Final' then
     ParValue := GetSaldoFinal;

  if ParName = 'Diferencia' then
     ParValue := GetDiferencia;

  if ParName = 'Total_Venta' then
     ParValue := GetTotalVenta;

  if ParName = 'Forma_Pago' then
     ParValue := GetFormaPago;

  if ParName = 'Total' then
  begin
     ParValue := GetTotal;
  end;

  if ParName = 'Total_Ingresos' then
     ParValue := GetTotalIngresos;

  if ParName = 'Total_Egresos' then
     ParValue := GetTotalEgresos;

  if ParName = 'Total_Cobrado' then
     case TipoListado of
        CT_SESION: ParValue := xDetalleSesionTOTAL_COBRADO.AsFloat;
        CT_CAJA: ParValue := xDetalleCajaTOTAL_COBRADO.AsFloat;
        CT_TURNO: ParValue := xDetalleTurnoTOTAL_COBRADO.AsFloat;
     end;
end;

procedure TDMLstArqueos.frArqueosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     if (Pos('[MascaraI]', Memo[0]) > 0) then
        View.FormatStr := MascaraI;
     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := MascaraN;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
     if (Pos('[MascaraP]', Memo[0]) > 0) then
        View.FormatStr := MascaraP;
  end;
end;

procedure TDMLstArqueos.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
begin
  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;

  if Source = '[TITULO_LISTADO]' then
     case TipoListado of
        CT_SESION: Source := _('Listado de Arqueo por Sesión');
        CT_CAJA: Source := _('Listado de Arqueo por Caja');
        CT_TURNO: Source := _('Listado de Arqueo por Turno');
     end;

  if Source = '[FECHA]' then
     if (PorFechas = 0) then
        case TipoListado of
           0: Source := Format(_('Fecha: %s'), [xCabSesionFECHA_INICIO.AsString]);
           1: Source := Format(_('Fecha: %s'), [xCabCajaFECHA_INICIO.AsString]);
           2: Source := Format(_('Fecha: %s'), [xCabTurnoFECHA_INICIO.AsString]);
        end
     else
        Source := FormatDateTime(_('"Desde: "dd/mm/yyyy'), Trunc(FechaDesde)) + ' ' + FormatDateTime(_('"hasta: "dd/mm/yyyy'), Trunc(FechaHasta));

  if Source = '[TXT_SERIE]' then
     Source := _('Serie') + ': ' + Serie;

  if Source = '[PARAMS_LISTADO]' then
  begin
     Source := Format(_('SESIÓN: %s'), [IntToStr(Sesion)]);
     if (TipoListado > CT_SESION) then
        Source := Source + ' ' + Format(_('CAJA: %s'), [IntToStr(Caja)]);
     if (TipoListado = CT_TURNO) then
        Source := Source + ' ' + Format(_('TURNO: %s'), [IntToStr(Turno)]);
  end;

  if Source = '[TXT_SESION_CAJA_TURNO]' then
  begin
     if (PorFechas = 0) then
        case TipoLIstado of
           0: Source := Format(_('Sesion: %s'), [IntToStr(xCabSesionSESION.AsInteger)]);
           1: Source := Format(_('Sesion: %s'), [IntToStr(xCabCajaSESION.AsInteger)]) + ' ' + Format(_('Caja: %s'), [IntToStr(xCabCajaCAJA.AsInteger)]);
           2: Source := Format(_('Sesion: %s'), [IntToStr(xCabTurnoSESION.AsInteger)]) + ' ' + Format(_('Caja: %s'), [IntToStr(xCabTurnoCAJA.AsInteger)]) + ' ' + Format(_('Turno: %s'), [IntToStr(xCabTurnoTURNO.AsInteger)]);
        end
     else
     begin
        Source := DameDistintasSesiones;
        if (TipoListado = 1) then
           Source := Source + ' ' + Format(_('Caja: %s'), [IntToStr(xCabCajaCAJA.AsInteger)]);
        if (TipoListado = 2) then
           Source := Source + ' ' + Format(_('Caja: %s'), [IntToStr(xCabTurnoCAJA.AsInteger)]) + ' ' + Format(_('Turno: %s'), [IntToStr(xCabTurnoTURNO.AsInteger)]);
     end;
  end;

  if Source = '[FORMA_PAGO]' then
     Source := GetFormaPago;

  if Source = '[TOTAL_COBRADO]' then
     case TipoListado of
        CT_SESION: Source := FormatFloat(MascaraN, xDetalleSesionTOTAL_COBRADO.AsFloat);
        CT_CAJA: Source := FormatFloat(MascaraN, xDetalleCajaTOTAL_COBRADO.AsFloat);
        CT_TURNO: Source := FormatFloat(MascaraN, xDetalleTurnoTOTAL_COBRADO.AsFloat);
     end;

  if Source = '[TOTAL]' then
  begin
     Total := GetTotal;
     Source := FormatFloat(MascaraN, Total);
  end;

  if Source = '[SALDO_INICIAL]' then
  begin
     SaldoIni := GetSaldoInicial;
     Source := FormatFloat(MascaraN, SaldoIni);
  end;

  if Source = '[ENTREGAS]' then
  begin
     Entregas := GetEntregas;
     Source := FormatFloat(MascaraN, Entregas);
  end;

  if Source = '[VALES]' then
  begin
     Vales := GetVales;
     Source := FormatFloat(MascaraN, Vales);
  end;

  if Source = '[SALDO_FINAL]' then
  begin
     Source := FormatFloat(MascaraN, GetSaldoFinal);
  end;

  if Source = '[DIFERENCIA]' then
  begin
     Source := FormatFloat(MascaraN, GetDiferencia);
  end;

  if Source = '[TOTAL_VENTA]' then
  begin
     Source := FormatFloat(MascaraN, GetTotalVenta);
  end;

  if Source = '[TOTAL_SALDOS]' then
     Source := FormatFloat(MascaraN, Total + SaldoIni + Entregas + Vales);

  if Source = '' then
     Source := ' ';

end;

function TDMLstArqueos.GetFormaPago: string;
var
  FP : string;
begin
  case TipoListado of
     CT_SESION: FP := xDetalleSesionFORMA_PAGO.AsString;
     CT_CAJA: FP := xDetalleCajaFORMA_PAGO.AsString;
     CT_TURNO: FP := xDetalleTurnoFORMA_PAGO.AsString;
  end;

  with QFormaPago do
  begin
     Result := '';
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FORMA_PAGO'].AsString := FP;
     ExecQuery;
     Result := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

function TDMLstArqueos.GetTotal: double;
begin
  Result := 0;
  if (PorFechas = 1) then
     Result := DameTotales
  else
     case TipoListado of
        CT_SESION: Result := xCabSesionTOTAL_SESION.AsFloat;
        CT_CAJA: Result := xCabCajaTOTAL_SESION.AsFloat;
        CT_TURNO: Result := xCabTurnoTOTAL_TURNO.AsFloat;
     end;
end;

function TDMLstArqueos.GetEntregas: double;
begin
  //Result := 0;
  with QEntregas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['SESION'].AsInteger := Sesion;
     if (TipoListado = CT_CAJA) then
        Params.ByName['CAJA'].AsInteger := Caja
     else if (TipoListado = CT_TURNO) then
     begin
        Params.ByName['CAJA'].AsInteger := Caja;
        Params.ByName['TURNO'].AsInteger := Turno;
     end;
     if (PorFechas = 1) then
     begin
        if Params.ByName['FECHA_DESDE'] <> nil then
           Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        if Params.ByName['FECHA_HASTA'] <> nil then
           Params.ByName['FECHA_HASTA'].AsDateTime := int(FechaHasta) + 0.999998;
     end;

     ExecQuery;
     Result := FieldByName['ENTREGAS'].AsFloat;
     FreeHandle;
  end;
end;

function TDMLstArqueos.GetVales: double;
begin
  //Result := 0;
  with QVales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['SESION'].AsInteger := Sesion;
     if (TipoListado = CT_CAJA) then
        Params.ByName['CAJA'].AsInteger := Caja
     else if (TipoListado = CT_TURNO) then
     begin
        Params.ByName['CAJA'].AsInteger := Caja;
        Params.ByName['TURNO'].AsInteger := Turno;
     end;

     if (PorFechas = 1) then
     begin
        if Params.ByName['FECHA_DESDE'] <> nil then
           Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        if Params.ByName['FECHA_HASTA'] <> nil then
           Params.ByName['FECHA_HASTA'].AsDateTime := int(FechaHasta) + 0.999998;
     end;

     ExecQuery;
     Result := FieldByName['VALES'].AsFloat;
     FreeHandle;
  end;
end;

function TDMLstArqueos.GetSaldoInicial: double;
begin
  AbrirSaldos;
  Result := QSaldoInicial.FieldByName['TOTAL'].AsFloat;
end;

function TDMLstArqueos.GetTotalIngresos: double;
begin
  AbrirTotalIngresos;
  Result := QTotalIngresos.FieldByName['TOTAL'].AsFloat;
end;

function TDMLstArqueos.GetTotalEgresos: double;
begin
  AbrirTotalEgresos;
  Result := QTotalEgresos.FieldByName['TOTAL'].AsFloat;
end;

function TDMLstArqueos.GetDiferencia: double;
begin
  AbrirSaldos;
  Result := QSaldoInicial.FieldByName['TOTAL_DIFERENCIA'].AsFloat;
end;

procedure TDMLstArqueos.AbrirSaldos;
begin
  with QSaldoInicial do
     if not prepared then
     begin
        prepare;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        if Params.ByName['SESION'] <> nil then
           Params.ByName['SESION'].AsInteger := Sesion;
        if (TipoListado = CT_CAJA) then
           Params.ByName['CAJA'].AsInteger := Caja
        else if (TipoListado = CT_TURNO) then
        begin
           Params.ByName['CAJA'].AsInteger := Caja;
           Params.ByName['TURNO'].AsInteger := Turno;
        end;
        if Params.ByName['FECHA_DESDE'] <> nil then
           Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        if Params.ByName['FECHA_HASTA'] <> nil then
           Params.ByName['FECHA_HASTA'].AsDateTime := int(FechaHasta) + 0.999998;
        ExecQuery;
     end;
end;

procedure TDMLstArqueos.AbrirTotalIngresos;
begin
  with QTotalIngresos do
     if not prepared then
     begin
        prepare;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        if Params.ByName['SESION'] <> nil then
           Params.ByName['SESION'].AsInteger := Sesion;
        if (TipoListado = CT_CAJA) then
           Params.ByName['CAJA'].AsInteger := Caja
        else if (TipoListado = CT_TURNO) then
        begin
           Params.ByName['CAJA'].AsInteger := Caja;
           Params.ByName['TURNO'].AsInteger := Turno;
        end;
        if Params.ByName['FECHA_DESDE'] <> nil then
           Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        if Params.ByName['FECHA_HASTA'] <> nil then
           Params.ByName['FECHA_HASTA'].AsDateTime := int(FechaHasta) + 0.999998;
        ExecQuery;
     end;
end;

procedure TDMLstArqueos.AbrirTotalEgresos;
begin
  with QTotalEgresos do
     if not prepared then
     begin
        prepare;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        if Params.ByName['SESION'] <> nil then
           Params.ByName['SESION'].AsInteger := Sesion;
        if (TipoListado = CT_CAJA) then
           Params.ByName['CAJA'].AsInteger := Caja
        else if (TipoListado = CT_TURNO) then
        begin
           Params.ByName['CAJA'].AsInteger := Caja;
           Params.ByName['TURNO'].AsInteger := Turno;
        end;
        if Params.ByName['FECHA_DESDE'] <> nil then
           Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        if Params.ByName['FECHA_HASTA'] <> nil then
           Params.ByName['FECHA_HASTA'].AsDateTime := int(FechaHasta) + 0.999998;
        ExecQuery;
     end;
end;

function TDMLstArqueos.GetSaldoFinal: double;
begin
  AbrirSaldos;
  Result := QSaldoInicial.FieldByName['TOTAL_SALDO'].AsFloat;
end;

function TDMLstArqueos.GetTotalVenta: double;
begin
  // Result := 0;
  with QTotalVenta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['SESION'].AsInteger := Sesion;
     Params.ByName['CAJA'].AsInteger := -1;
     Params.ByName['TURNO'].AsInteger := -1;
     if (TipoListado = CT_CAJA) then
        Params.ByName['CAJA'].AsInteger := Caja
     else if (TipoListado = CT_TURNO) then
     begin
        Params.ByName['CAJA'].AsInteger := Caja;
        Params.ByName['TURNO'].AsInteger := Turno;
     end;

     ExecQuery;
     Result := FieldByName['LIQUIDO_CANAL'].AsFloat;
     FreeHandle;
  end;
end;

procedure TDMLstArqueos.DameSesionMenor(FechaDesde, FechaHasta: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(SESION) AS SESION FROM GES_TPV_SESIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
        SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        ExecQuery;
        Sesion := FieldByName['SESION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstArqueos.DameTotales: double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;

        case TipoListado of    //Modificar
           CT_SESION:
           begin
              SQL.Add(' SELECT SUM(TOTAL_SESION) AS TOTAL_SESION FROM GES_TPV_SESIONES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
           CT_CAJA:
           begin
              SQL.Add(' SELECT SUM(TOTAL_SESION) AS TOTAL_SESION FROM GES_TPV_SESIONES_CAJAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
           CT_TURNO:
           begin
              SQL.Add(' SELECT SUM(TOTAL_TURNO) AS TOTAL_SESION FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
        end;

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := int(FechaHasta) + 0.999998;
        if Params.ByName['CAJA'] <> nil then
           Params.ByName['CAJA'].AsInteger := Caja;
        if Params.ByName['TURNO'] <> nil then
           Params.ByName['TURNO'].AsInteger := Turno;
        ExecQuery;
        Result := FieldByName['TOTAL_SESION'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstArqueos.DameDistintasSesiones: string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        // Maximos
        case TipoListado of
           0:
           begin
              SQL.Add(' SELECT MIN(SESION) AS SESION FROM GES_TPV_SESIONES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
           1:
           begin
              SQL.Add(' SELECT MIN(SESION) AS SESION FROM GES_TPV_SESIONES_CAJAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
           2:
           begin
              SQL.Add(' SELECT MIN(SESION) AS SESION FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['FECHA_DESDE'].AsDateTime := fechadesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := fechahasta;
        if Params.ByName['CAJA'] <> nil then
           Params.ByName['CAJA'].AsInteger := caja;
        if Params.ByName['TURNO'] <> nil then
           Params.ByName['TURNO'].AsInteger := Turno;
        ExecQuery;
        Result := Format('Sesión: %s', [FieldByName['SESION'].AsString]) + ' - ';
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        // Minimos
        case TipoListado of
           0:
           begin
              SQL.Add(' SELECT MAX(SESION) AS SESION FROM GES_TPV_SESIONES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
           1:
           begin
              SQL.Add(' SELECT MAX(SESION) AS SESION FROM GES_TPV_SESIONES_CAJAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
           2:
           begin
              SQL.Add(' SELECT MAX(SESION) AS SESION FROM GES_TPV_SESIONES_CAJAS_TURNO ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' CAJA = ?CAJA AND ');
              SQL.Add(' TURNO = ?TURNO AND ');
              SQL.Add(' FECHA_INICIO >= ?FECHA_DESDE AND ');
              SQL.Add(' FECHA_INICIO <= ?FECHA_HASTA ');
           end;
        end;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['FECHA_DESDE'].AsDateTime := fechadesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := fechahasta;
        if Params.ByName['CAJA'] <> nil then
           Params.ByName['CAJA'].AsInteger := caja;
        if Params.ByName['TURNO'] <> nil then
           Params.ByName['TURNO'].AsInteger := Turno;
        ExecQuery;
        Result := Result + FieldByName['SESION'].AsString + ' ';
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstArqueos.frxArqueosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxMemoView) then
     with TfrxMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if (Pos('[MascaraI]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := MascaraI;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraN]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraE]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraP]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraL]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;

  if (Sender is TfrxPictureView) then
     if (TfrxPictureView(Sender).TagStr = 'Imagen') then
     begin
        DMListados.MostrarImagen(REntorno.ImagenEmpresa, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;
end;

procedure TDMLstArqueos.xArqueoTurnoAfterOpen(DataSet: TDataSet);
begin
  xSeries.Close;
  xSeries.Open;
end;

end.
