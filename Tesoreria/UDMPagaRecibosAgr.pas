unit UDMPagaRecibosAgr;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBQuery, SysUtils, FIBDataSetRO, HYFIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TDMPagaRecibosAgr = class(TDataModule)
     QMRecibos: TFIBTableSet;
     DSQMRecibos: TDataSource;
     TLocal: THYTransaction;
     QMRecibosEMPRESA: TIntegerField;
     QMRecibosEJERCICIO: TIntegerField;
     QMRecibosCANAL: TIntegerField;
     QMRecibosSIGNO: TFIBStringField;
     QMRecibosREGISTRO: TIntegerField;
     QMRecibosLINEA: TIntegerField;
     QMRecibosCOD_CLI_PRO: TIntegerField;
     QMRecibosVENCIMIENTO: TDateTimeField;
     QMRecibosLIQUIDO: TFloatField;
     QMRecibosDOC_NUMERO: TIntegerField;
     QMRecibosDOC_SERIE: TFIBStringField;
     QMRecibosDOC_FECHA: TDateTimeField;
     QMRecibosDOC_TIPO: TFIBStringField;
     QMRecibosRECIBIDO: TIntegerField;
     QMRecibosENTRADA: TIntegerField;
     QMRecibosCTA_PAGO: TFIBStringField;
     xClientes: TFIBDataSetRO;
     xProveedores: TFIBDataSetRO;
     xAcreedores: TFIBDataSetRO;
     QMRecibosEJERCICIO_AGRUPACION: TIntegerField;
     QMRecibosliquido_moneda: TFloatField;
     QMRecibosLIQUIDO_CANAL: TFloatField;
     QMRecibosMONEDA: TFIBStringField;
     QMCPRecMarcados: TFIBTableSet;
     DSQMCPRecMarcados: TDataSource;
     QMCPRecMarcadosCOD_CLI_PRO: TIntegerField;
     QMCPRecMarcadosSIGNO: TFIBStringField;
     QMCPRecMarcadosCUENTA: TFIBStringField;
     QMCPRecMarcadosCANTIDAD: TFloatField;
     QMCPRecMarcadosTIPO: TFIBStringField;
     QMCPRecMarcadosIMPORTE: TFloatField;
     QMCPRecMarcadosRECIBOS: TIntegerField;
     QMCPRecMarcadosENTRADA: TIntegerField;
     QMRecibosSU_REFERENCIA: TStringField;
     QMRecibosNUM_FACTURA: TFIBStringField;
     QMRecibosFORMA_PAGO: TFIBStringField;
     TUpdate: THYTransaction;
     frListado: TfrHYReport;
     xLstCliente: TFIBDataSetRO;
     xLstClienteNOMBRE: TFIBStringField;
     xLstClienteDIRECCION: TFIBStringField;
     xLstClienteCOD_POSTAL: TFIBStringField;
     xLstClientePROVINCIA: TFIBStringField;
     xLstClienteLOCALIDAD: TFIBStringField;
     xLstRecibo: TFIBDataSetRO;
     xLstReciboVENCIMIENTO: TDateTimeField;
     xLstReciboLIQUIDO: TFloatField;
     xLstDetRecibo: TFIBDataSetRO;
     xLstDetReciboEMPRESA: TIntegerField;
     xLstDetReciboEJERCICIO: TIntegerField;
     xLstDetReciboCANAL: TIntegerField;
     xLstDetReciboSIGNO: TFIBStringField;
     xLstDetReciboREGISTRO: TIntegerField;
     xLstDetReciboREGISTRO_REC: TIntegerField;
     xLstDetReciboLINEA_REC: TIntegerField;
     xLstDetReciboEJERCICIO_REC: TIntegerField;
     xLstDetReciboEMPRESA1: TIntegerField;
     xLstDetReciboEJERCICIO1: TIntegerField;
     xLstDetReciboCANAL1: TIntegerField;
     xLstDetReciboSIGNO1: TFIBStringField;
     xLstDetReciboREGISTRO1: TIntegerField;
     xLstDetReciboLINEA: TIntegerField;
     xLstDetReciboVENCIMIENTO: TDateTimeField;
     xLstDetReciboCTA_PAGO: TFIBStringField;
     xLstDetReciboLIQUIDO: TFloatField;
     xLstDetReciboPAGADO: TIntegerField;
     xLstDetReciboMOD_MANUAL: TIntegerField;
     xLstDetReciboTIPO_EFECTO: TFIBStringField;
     xLstDetReciboREMESAR: TIntegerField;
     xLstDetReciboESTADO: TIntegerField;
     xLstDetReciboREMESA: TIntegerField;
     xLstDetReciboBANCO: TIntegerField;
     xLstDetReciboRIC: TIntegerField;
     xLstDetReciboIMPAGADO: TIntegerField;
     xLstDetReciboFECHA_CIERRE: TDateTimeField;
     xLstDetReciboESTADO_RECIBO: TFIBStringField;
     xLstDetReciboRECIBIDO: TIntegerField;
     xLstDetReciboVISIBLE: TIntegerField;
     xLstDetReciboENTRADA: TIntegerField;
     xLstDetReciboAGRUPACION: TIntegerField;
     xLstDetReciboCONFIRMING: TIntegerField;
     xLstDetReciboANTICIPADO: TFloatField;
     xLstDetReciboDOCUMENTO: TFIBStringField;
     xLstDetReciboDOC_AUTOMATICO: TIntegerField;
     xLstDetReciboEJERCICIO_REMESA: TIntegerField;
     xLstDetReciboEJERCICIO_AGRUPACION: TIntegerField;
     xLstDetReciboMONEDA: TFIBStringField;
     xLstDetReciboLIQUIDO_CANAL: TFloatField;
     xLstDetReciboCAMBIO: TFloatField;
     xLstDetReciboRIC_RECIBIDO: TIntegerField;
     xLstDetReciboFECHA_RECIBIDO: TDateTimeField;
     xLstDetReciboEJERCICIO_CONFIRMING: TIntegerField;
     xLstDetReciboMONEDA_CANAL: TFIBStringField;
     xLstDetReciboEMPRESA2: TIntegerField;
     xLstDetReciboEJERCICIO2: TIntegerField;
     xLstDetReciboCANAL2: TIntegerField;
     xLstDetReciboSIGNO2: TFIBStringField;
     xLstDetReciboREGISTRO2: TIntegerField;
     xLstDetReciboFECHA_REGISTRO: TDateTimeField;
     xLstDetReciboLINEAS: TIntegerField;
     xLstDetReciboCUENTA: TFIBStringField;
     xLstDetReciboDOC_NUMERO: TIntegerField;
     xLstDetReciboDOC_SERIE: TFIBStringField;
     xLstDetReciboDOC_FECHA: TDateTimeField;
     xLstDetReciboDOC_TIPO: TFIBStringField;
     xLstDetReciboVALOR: TDateTimeField;
     xLstDetReciboFORMA_PAGO: TFIBStringField;
     xLstDetReciboBASES: TFloatField;
     xLstDetReciboLIQUIDO1: TFloatField;
     xLstDetReciboPAGADO1: TIntegerField;
     xLstDetReciboRIC1: TIntegerField;
     xLstDetReciboRIVA: TIntegerField;
     xLstDetReciboREG_IVA: TIntegerField;
     xLstDetReciboESTADO1: TIntegerField;
     xLstDetReciboDIA_PAGO_1: TIntegerField;
     xLstDetReciboDIA_PAGO_2: TIntegerField;
     xLstDetReciboDIA_PAGO_3: TIntegerField;
     xLstDetReciboCOD_CLI_PRO: TIntegerField;
     xLstDetReciboORIGEN_IMPAGADO: TIntegerField;
     xLstDetReciboASIENTO: TIntegerField;
     xLstDetReciboEJERCICIO_FINAL: TIntegerField;
     xLstDetReciboMONEDA1: TFIBStringField;
     xLstDetReciboLIQUIDO_CANAL1: TFloatField;
     xLstDetReciboCAMBIO1: TFloatField;
     xLstDetReciboC_PAGADA: TFloatField;
     xLstDetReciboMONEDA_CANAL1: TFIBStringField;
     frdbLstDetRecibo: TfrDBDataSet;
     QMRecibosID_CARTERA: TIntegerField;
     QMRecibosID_DOC: TIntegerField;
     QMRecibosID_CARTERA_DETALLE: TIntegerField;
     QMRecibosFOLIO: TFIBStringField;
     QMRecibosOBSERVACIONES: TFIBStringField;
     procedure DMPagaRecibosAgrupCreate(Sender: TObject);
     procedure QMRecibosENTRADAChange(Sender: TField);
     procedure QMRecibosBeforePost(DataSet: TDataSet);
     procedure QMRecibosliquido_monedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRecibosNewRecord(DataSet: TDataSet);
     procedure QMRecibosBeforeInsert(DataSet: TDataSet);
     procedure QMCPRecMarcadosAfterScroll(DataSet: TDataSet);
     procedure QMCPRecMarcadosAfterOpen(DataSet: TDataSet);
     procedure QMRecibosCalcFields(DataSet: TDataSet);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure frListadoBeforePrint(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
     Importe: double;
  public
     { Public declarations }
     function DameFormaPago(Tipo: string): string;
     function EsAgrupado: boolean;
     function Dameregistro: integer;
     procedure BusquedaCompleja(tipo: string; Cod_cli_pro: integer);
     procedure PagaRecibos(Signo, TipoFac, CtaPago: string; Cod_Cli_Pro: integer; Fecha: TDateTime; Cantidad: double; UnificaCuentaGastos: boolean; TipoAsientoKri, TipoEfecto, Observaciones: string; ImporteGastos: double; CuentaGastos: string);
     procedure Filtra(tipo: string; cod_cli_pro: integer);
     procedure CambiaCod_Cli(Tipo: string; Cod_cli_pro: integer; var Titulo: string; Procedimiento: integer);
     procedure AgrupaRecibos(TipoFac: string; Cod_cli_pro: integer; FormaPago: string; Fecha: TDateTime; Modo: smallint; TipoAsientoKri, Serie: string; ImporteGastos: double; CuentaGastos, Observaciones: string);
     procedure LimpiaEntradas;
     procedure Anticipos(Fecha: TDateTime);
     procedure PonImporte(Valor: double);
     procedure InsCPRecMarc(Cli_Pro: integer; Signo, Tipo, Cuenta: string; Cantidad, Importe: double; Entrada, Recibos: integer);
     procedure ActCPRecMarc(Cli_Pro: integer; Signo, Tipo_Doc, Cuenta: string; Fecha: TDateTime; Cantidad: double);
     procedure LimpiaCPRecMarc;
     // procedure CalculaImporte(Cli_Pro: integer; Tipo_Doc: string; Fecha: TDateTime; var Importe: double; var Moneda: string);
     function HayDetalle: boolean;
     procedure MostrarListado(Grupo, Modo, CodCliPro, Empresa, Ejercicio, Canal, Registro: integer; Signo: string; Archivo: string); // vquimicas_jla
     function CalculaImporteTotal(Signo: string; Procedimiento: integer): double;
     function DameClienteCartera(IdCarteraDetalle: integer): integer;
     procedure SeleccionaRecibo(IdCarteraDetalle: integer);
     function DameAcreedorCuenta(Cuenta: string): integer;
  end;

var
  DMPagaRecibosAgr : TDMPagaRecibosAgr;

implementation

uses UFBusca, UEntorno, UFormGest, UDMMain,
  UFMPagaRecibosAgr, UFPregAnticipo, UDMListados, UUtiles, UFMain;

{$R *.DFM}

procedure TDMPagaRecibosAgr.DMPagaRecibosAgrupCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMRecibos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCPRecMarcados, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMRecibos, '10100', True);
  with QMCPRecMarcados do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  end;
end;

procedure TDMPagaRecibosAgr.Filtra(Tipo: string; cod_cli_pro: integer);
var
  TipoAgrupado, TipoNuevo, TipoAsiento : string;
begin
  TipoAgrupado := 'AGC';
  TipoNuevo := 'NRC';
  TipoAsiento := 'AFC';
  if Tipo = 'FAP' then
  begin
     TipoAgrupado := 'AGP';
     TipoNuevo := 'NRP';
     TipoAsiento := 'AFP';
  end
  else if Tipo = 'FCR' then
  begin
     TipoAgrupado := 'AGA';
     TipoNuevo := 'NRA';
     TipoAsiento := 'AFA';
  end;
  with QMRecibos do
  begin
     if Active then
        Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['TIPOAGRUPADO'].AsString := TipoAgrupado;
     Params.ByName['TIPONUEVO'].AsString := TipoNuevo;
     Params.ByName['COD_CLI_PRO'].AsInteger := cod_cli_pro;
     Params.ByName['TIPOASIENTO'].AsString := TipoAsiento;
     Open;
  end;
end;

procedure TDMPagaRecibosAgr.PagaRecibos(Signo, TipoFac, CtaPago: string; Cod_Cli_Pro: integer; Fecha: TDateTime; Cantidad: double; UnificaCuentaGastos: boolean; TipoAsientoKri, TipoEfecto, Observaciones: string; ImporteGastos: double; CuentaGastos: string);
begin
  if QMRecibos.State = dsEdit then
     QMRecibos.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE E_CARTERA_PAGO_REC_AGRUP_CANT ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?ENTRADA, ?FECHA, ?UNIFICADA_CUENTA_GASTOS, ?TIPO_ASIENTO_KRI, ?TIPO_EFECTO, ?OBSERVACIONES, ?IMPORTE_GASTOS, ?CUENTA_GASTOS) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['UNIFICADA_CUENTA_GASTOS'].AsInteger := BoolToInt(UnificaCuentaGastos);
        Params.ByName['TIPO_ASIENTO_KRI'].AsString := TipoAsientoKri;
        Params.ByName['TIPO_EFECTO'].AsString := TipoEfecto;
        Params.ByName['OBSERVACIONES'].AsString := Observaciones;
        Params.ByName['IMPORTE_GASTOS'].AsFloat := ImporteGastos;
        Params.ByName['CUENTA_GASTOS'].AsString := CuentaGastos;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMRecibos.Close;
  QMRecibos.Open;

  LimpiaCPRecMarc;
end;

procedure TDMPagaRecibosAgr.BusquedaCompleja(Tipo: string; Cod_cli_pro: integer);
var
  Orden, TipoAgrupado, TipoNuevo, TipoAsiento : string;
begin
  TipoAgrupado := 'AGC';
  TipoNuevo := 'NRC';
  TipoAsiento := 'AFC';

  if Tipo = 'FAP' then
  begin
     TipoAgrupado := 'AGP';
     TipoNuevo := 'NRP';
     TipoAsiento := 'AFP';
  end
  else if Tipo = 'FCR' then
  begin
     TipoAgrupado := 'AGA';
     TipoNuevo := 'NRA';
     TipoAsiento := 'AFA';
  end;

  with QMRecibos do
  begin
     Close;
     if TFBusca.Create(Self).SeleccionaBusqueda(QMRecibos, '10100', False) = mrOk then
     begin
        Orden := OrdenadoPor;
        Ordenar('');
        if SelectSQL.Count <> 0 then
           SelectSQL.Add(
              'AND((DOC_TIPO=?TIPO)OR(DOC_TIPO=?TIPOAGRUPADO)OR(DOC_TIPO=?TIPONUEVO) OR (DOC_TIPO=?TIPOASIENTO)) AND COD_CLI_PRO=?COD_CLI_PRO');
        Ordenar(Orden);
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['TIPOAGRUPADO'].AsString := TipoAgrupado;
        Params.ByName['TIPONUEVO'].AsString := TipoNuevo;
        Params.ByName['COD_CLI_PRO'].AsInteger := Cod_Cli_Pro;
     end;
     Open;
  end;
end;

procedure TDMPagaRecibosAgr.CambiaCod_Cli(Tipo: string; Cod_cli_pro: integer; var Titulo: string; Procedimiento: integer);
var
  Signo : string;
begin
  /// Se devuelve el Titulo y quedan abierto los datasets para obtener la forma de pago.

  if Tipo = 'FAC' then
  begin
     Signo := 'C';
     with xClientes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLIENTE'].AsInteger := Cod_cli_pro;
        Open;
        Titulo := FieldByName('TITULO').AsString;
     end;
  end;

  if Tipo = 'FAP' then
  begin
     Signo := 'P';
     with xProveedores do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Cod_cli_pro;
        Open;
        Titulo := FieldByName('TITULO').AsString;
     end;
  end;

  if Tipo = 'FCR' then
  begin
     Signo := 'P';
     with xAcreedores do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ACREEDOR'].AsInteger := Cod_cli_pro;
        Open;
        Titulo := FieldByName('TITULO').AsString;
     end;
  end;

  FMPagaRecibosAgr.Importe(CalculaImporteTotal(Signo, Procedimiento), QMRecibosMONEDA.AsString);
end;

procedure TDMPagaRecibosAgr.QMRecibosENTRADAChange(Sender: TField);
var
  Cli_Pro, Recibos, Procedimiento : integer;
  Signo, Tipo, Cuenta : string;
  Cantidad : double;
begin
  if (Sender.AsInteger = REntorno.Entrada) then
     Recibos := 1
  else
     Recibos := -1;

  FMPagaRecibosAgr.ObtDatosCli_Pro(Cli_Pro, Procedimiento, Signo, Tipo, Cuenta, Cantidad);

  if (Procedimiento = 0) then
  begin
     if (Cuenta <= '') then
     begin
        QMRecibos.Cancel;
        ShowMessage(_('La cuenta de Cobro/Pago es incorrecta'));
     end
     else
     begin
        QMRecibos.Post;
        InsCPRecMarc(Cli_Pro, Signo, Tipo, Cuenta, Cantidad, QMRecibosLIQUIDO.AsFloat,
           REntorno.Entrada, Recibos);
     end;
  end
  else
     QMRecibos.Post;

  FMPagaRecibosAgr.Importe(CalculaImporteTotal(Signo, Procedimiento), QMRecibosMONEDA.AsString);
  FMPagaRecibosAgr.PMain.Enabled := True;
end;

function TDMPagaRecibosAgr.CalculaImporteTotal(Signo: string; Procedimiento: integer): double;
var
  SignoImporte : double;
begin
  if (Procedimiento = 0) then
  begin
     // Cambio signo para restar (COBROS - PAGOS) o (PAGOS - COBROS)
     SignoImporte := 1;
     if (Signo = 'P') then
        SignoImporte := -1;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(IMPORTE) FROM TMP_CARTERA_CP_REC_MARC WHERE ENTRADA = :ENTRADA AND SIGNO = :SIGNO';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

           // Importe de los cobros
           Params.ByName['SIGNO'].AsString := 'C';
           ExecQuery;
           Result := FieldByName['SUM'].AsFloat * SignoImporte;

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
           SQL.Text := 'SELECT SUM(IMPORTE) FROM TMP_CARTERA_CP_REC_MARC WHERE ENTRADA = :ENTRADA AND SIGNO = :SIGNO';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

           // Importe de los pagos
           Params.ByName['SIGNO'].AsString := 'P';
           ExecQuery;
           Result := Result + (FieldByName['SUM'].AsFloat * SignoImporte * (-1));
           Close;

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
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_SUMA_IMPORTES_AGRUP (?EMPRESA, ?EJERCICIO_AGRUPACION, ?CANAL, ?SIGNO, ?ENTRADA, ?FECHA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO_AGRUPACION'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SIGNO'].AsString := Signo;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
           ExecQuery;
           Result := FieldByName['IMPORTE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMPagaRecibosAgr.DameFormaPago(Tipo: string): string;
begin
  if Tipo = 'FAC' then
     Result := xClientes.FieldByName('FORMA_PAGO').AsString
  else if Tipo = 'FAP' then
     Result := xProveedores.FieldByName('FORMA_PAGO').AsString
  else
     Result := xAcreedores.FieldByName('FORMA_PAGO').AsString;
end;

procedure TDMPagaRecibosAgr.AgrupaRecibos(TipoFac: string; Cod_cli_pro: integer; FormaPago: string; Fecha: TDateTime; Modo: smallint; TipoAsientoKri, Serie: string; ImporteGastos: double; CuentaGastos, Observaciones: string);
var
  Registro : integer;
  Signo : char;
begin
  if QMRecibos.State = dsEdit then
     QMRecibos.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT REGISTRO FROM E_CARTERA_AGRUPA_RECIBOS ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?COD_CLI_PRO, ?TIPO_DOC, ?FORMA_PAGO, ?FECHA, ?MODO, ?ENTRADA, ?TIPO_ASIENTO, ?SERIE, ?OBSERVACIONES, ?IMPORTE_GASTOS, ?CUENTA_GASTOS) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['COD_CLI_PRO'].AsInteger := Cod_cli_pro;
        Params.ByName['TIPO_DOC'].AsString := TipoFac;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Params.ByName['FORMA_PAGO'].AsString := FormaPago;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO_ASIENTO'].AsString := TipoAsientoKri;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['OBSERVACIONES'].AsString := Observaciones;
        Params.ByName['IMPORTE_GASTOS'].AsFloat := ImporteGastos;
        Params.ByName['CUENTA_GASTOS'].AsString := CuentaGastos;
        ExecQuery;
        Registro := FieldByName['REGISTRO'].AsInteger;
        FreeHandle;
        if (Registro <> 0) then
        begin
           if (TipoFac = 'FAC') then
              Signo := 'C'
           else
              Signo := 'P';

           FMain.MuestraCartera(REntorno.Ejercicio, REntorno.Canal, Signo, Registro);
        end;
     finally
        Free;
     end;
  end;

  QMRecibos.Close;
  QMRecibos.Open;
end;

function TDMPagaRecibosAgr.EsAgrupado: boolean;
begin
  if ((QMRecibosDOC_TIPO.AsString = 'AGC') or (QMRecibosDOC_TIPO.AsString = 'AGP') or
     (QMRecibosDOC_TIPO.AsString = 'AGA')) then
     Result := True
  else
     Result := False;
end;

function TDMPagaRecibosAgr.Dameregistro: integer;
begin
  Result := QMRecibosREGISTRO.AsInteger;
end;

procedure TDMPagaRecibosAgr.LimpiaEntradas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA = 0, ');
        SQL.Add(' EJERCICIO_AGRUPACION = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO_AGRUPACION = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ENTRADA = ?ENTRADA AND ');
        SQL.Add(' PAGADO = 0 AND ');
        SQL.Add(' AGRUPACION = 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPagaRecibosAgr.Anticipos(Fecha: TDateTime);
var
  Saldo, Tope : double;
  Moneda, Tipo : string;
begin
  // Saldo(Fecha, Saldo, Moneda);

  if (QMRecibosSIGNO.AsString = 'C') then
     Tipo := 'CLI'
  else
  begin
     if ((QMRecibosDOC_TIPO.AsString = 'FAP') or (QMRecibosDOC_TIPO.AsString = 'AGP') or
        (QMRecibosDOC_TIPO.AsString = 'NRP') or (QMRecibosDOC_TIPO.AsString = 'AFP')) then
        Tipo := 'PRO'
     else
        Tipo := 'ACR';
  end;
  DMMain.SaldoAnticipo(Tipo, QMRecibosCOD_CLI_PRO.AsInteger, Fecha, Saldo, Moneda);

  if (Saldo <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_SUMA_IMPORTES_AGRUP (?EMPRESA, ?EJERCICIO_AGRUPACION, ?CANAL, ?SIGNO, ?ENTRADA, ?FECHA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO_AGRUPACION'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SIGNO'].AsString := QMRecibosSIGNO.AsString;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;
           Tope := FieldByName['IMPORTE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (Tope < Saldo) then
        Saldo := Tope;

     if TFPregAnticipo.Create(Self).Mostrar(Saldo, Moneda, Tope) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_PON_ANTICIPO (?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?ENTRADA, ?ANTICIPO)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SIGNO'].AsString := QMRecibosSIGNO.AsString;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ANTICIPO'].AsFloat := Saldo;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMPagaRecibosAgr.QMRecibosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsEdit) then
  begin
     {if (QMRecibosEJERCICIO_AGRUPACION.Value > 0)
      then QMRecibosEJERCICIO_AGRUPACION.Value := 0
      else QMRecibosEJERCICIO_AGRUPACION.Value := Rentorno.Ejercicio;}
     if (QMRecibosENTRADA.AsInteger = REntorno.Entrada) then
        QMRecibosEJERCICIO_AGRUPACION.Value := REntorno.Ejercicio
     else
        QMRecibosEJERCICIO_AGRUPACION.Value := 0;
  end
  else
     DataSet.Cancel;
end;

procedure TDMPagaRecibosAgr.QMRecibosliquido_monedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMRecibosMONEDA.AsString, 1),
     QMRecibosLIQUIDO.AsFloat);
end;

procedure TDMPagaRecibosAgr.PonImporte(Valor: double);
begin
  Importe := Valor;
end;

procedure TDMPagaRecibosAgr.QMRecibosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPagaRecibosAgr.QMRecibosBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPagaRecibosAgr.InsCPRecMarc(Cli_Pro: integer; Signo, Tipo, Cuenta: string; Cantidad, Importe: double; Entrada, Recibos: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_INS_REC_MARC (?COD_CLI_PRO, ?SIGNO, ?TIPO, ?CUENTA, ?CANTIDAD, ?IMPORTE, ?ENTRADA, ?RECIBOS)';
        Params.ByName['COD_CLI_PRO'].AsInteger := Cli_Pro;
        Params.ByName['SIGNO'].AsString := Signo;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['CANTIDAD'].AsDouble := Cantidad;
        Params.ByName['IMPORTE'].AsDouble := Importe;
        Params.ByName['ENTRADA'].AsInteger := Entrada;
        Params.ByName['RECIBOS'].AsInteger := recibos;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCPRecMarcados.Close;
  QMCPRecMarcados.Open;
  QMCPRecMarcados.Last;
end;

procedure TDMPagaRecibosAgr.LimpiaCPRecMarc;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_CARTERA_CP_REC_MARC WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCPRecMarcados.Close;
  QMCPRecMarcados.Open;
end;

procedure TDMPagaRecibosAgr.ActCPRecMarc(Cli_Pro: integer; Signo, Tipo_Doc, Cuenta: string; Fecha: TDateTime; Cantidad: double);
begin
  if QMCPRecMarcados.RecordCount > 0 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE TMP_CARTERA_CP_REC_MARC ');
           SQL.Add(' SET ');
           SQL.Add(' CUENTA = ?CUENTA, ');
           SQL.Add(' CANTIDAD = ?CANTIDAD ');
           SQL.Add(' WHERE ');
           SQL.Add(' COD_CLI_PRO = ?COD_CLI_PRO AND ');
           SQL.Add(' SIGNO = ?SIGNO AND ');
           SQL.Add(' TIPO = ?TIPO_DOC AND ');
           SQL.Add(' ENTRADA = ?ENTRADA ');
           Params.ByName['COD_CLI_PRO'].AsInteger := Cli_Pro;
           Params.ByName['SIGNO'].AsString := Signo;
           Params.ByName['TIPO_DOC'].AsString := Tipo_Doc;
           Params.ByName['CUENTA'].AsString := Cuenta;
           Params.ByName['CANTIDAD'].AsDouble := Cantidad;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCPRecMarcados.Refresh;
  end;
end;

procedure TDMPagaRecibosAgr.QMCPRecMarcadosAfterScroll(DataSet: TDataSet);
// var
//   Imp : double;
//   Mon : string;
begin
  {
  if (QMRecibos.State <> dsEdit) and ( QMRecibos.State <> dsInsert) then
  begin
     FMPagaRecibosAgr.PonDatosCli_Pro(QMCPRecMarcadosCOD_CLI_PRO.AsInteger,
                                        QMCPRecMarcadosTIPO_DOC.AsString,
                                        QMCPRecMarcadosCUENTA.AsString,
                                        QMCPRecMarcadosFECHA.AsDateTime,
                                        QMCPRecMarcadosCANTIDAD.AsFloat);
    CalculaImporte(QMCPRecMarcadosCOD_CLI_PRO.AsInteger,QMCPRecMarcadosTIPO_DOC.AsString,
                    QMCPRecMarcadosFECHA.AsDateTime, Imp, Mon);
    FMPagaRecibosAgr.Importe(Imp, Mon);
    PonImporte(Imp);
  end;
}
end;

(*
procedure TDMPagaRecibosAgr.CalculaImporte(Cli_Pro: integer; Tipo_Doc: string; Fecha: TDateTime; var Importe: double; var Moneda: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_CAL_IMP_REC_MARC(?EMPRESA, ?EJERCICIO_AGRUPACION, ?CANAL, ?TIPO_DOC, ?COD_CLI_PRO, ?ENTRADA, ?FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO_AGRUPACION'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO_DOC'].AsString := Tipo_Doc;
        Params.ByName['COD_CLI_PRO'].AsInteger := Cli_Pro;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        Importe := FieldByName['IMPORTE'].AsFloat;
        Moneda := FieldByName['MONEDA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;
*)

procedure TDMPagaRecibosAgr.QMCPRecMarcadosAfterOpen(DataSet: TDataSet);
begin
  QMCPRecMarcadosIMPORTE.DisplayFormat := MascaraN;
end;

function TDMPagaRecibosAgr.HayDetalle: boolean;
begin
  Result := (QMRecibos.RecordCount > 0);
end;

procedure TDMPagaRecibosAgr.QMRecibosCalcFields(DataSet: TDataSet);
begin
  QMRecibosSU_REFERENCIA.AsString := '';

  if ((QMRecibosDOC_TIPO.AsString = 'FAP') or (QMRecibosDOC_TIPO.AsString = 'FCR') or (QMRecibosDOC_TIPO.AsString = 'FAC')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (QMRecibosDOC_TIPO.AsString = 'FAC') then
              SQL.Text := 'SELECT SU_REFERENCIA, CAST('''' AS VARCHAR(15)) AS NUM_FACTURA FROM GES_CABECERAS_S WHERE EMPRESA = ' +
                 QMRecibosEMPRESA.AsString + ' AND EJERCICIO=' + QMRecibosEJERCICIO.AsString +
                 ' AND CANAL=' + QMRecibosCANAL.AsString + ' AND SERIE=''' + QMRecibosDOC_SERIE.AsString + '''' +
                 ' AND TIPO=''' + QMRecibosDOC_TIPO.AsString + ''' AND RIG=' + QMRecibosDOC_NUMERO.AsString;

           if (QMRecibosDOC_TIPO.AsString = 'FAP') then
              SQL.Text := 'SELECT C.SU_REFERENCIA, F.NUM_FACTURA FROM GES_CABECERAS_E C ' +
                 ' LEFT JOIN GES_CABECERAS_E_FAC F ON (C.ID_E = F.ID_E) ' +
                 ' WHERE C.EMPRESA =' + QMRecibosEMPRESA.AsString + ' AND C.EJERCICIO=' + QMRecibosEJERCICIO.AsString +
                 ' AND C.CANAL=' + QMRecibosCANAL.AsString + ' AND C.SERIE=''' + QMRecibosDOC_SERIE.AsString + '''' +
                 ' AND C.TIPO=''' + QMRecibosDOC_TIPO.AsString + ''' AND C.RIG=' + QMRecibosDOC_NUMERO.AsString;

           if (QMRecibosDOC_TIPO.AsString = 'FCR') then
              SQL.Text := 'SELECT C.SU_REFERENCIA, F.NUM_FACTURA FROM GES_CABECERAS_E C ' +
                 ' LEFT JOIN GES_CABECERAS_E_FCR F ON (C.ID_E = F.ID_E) ' +
                 ' WHERE C.EMPRESA =' + QMRecibosEMPRESA.AsString + ' AND C.EJERCICIO=' + QMRecibosEJERCICIO.AsString +
                 ' AND C.CANAL=' + QMRecibosCANAL.AsString + ' AND C.SERIE=''' + QMRecibosDOC_SERIE.AsString + '''' +
                 ' AND C.TIPO=''' + QMRecibosDOC_TIPO.AsString + ''' AND C.RIG=' + QMRecibosDOC_NUMERO.AsString;
           ExecQuery;

           QMRecibosSU_REFERENCIA.AsString := FieldByName['SU_REFERENCIA'].AsString;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPagaRecibosAgr.MostrarListado(Grupo, Modo, CodCliPro, Empresa, Ejercicio, Canal, Registro: integer; Signo: string; Archivo: string);
begin
  with xLstRecibo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['REGISTRO'].AsInteger := Registro;
     Open;
  end;

  with xLstDetRecibo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['REGISTRO'].AsInteger := Registro;
     Open;
  end;

  with xLstCliente do
  begin
     Close;
     SelectSQL.Clear;
     if (Signo = 'C') then
     begin
        SelectSQL.Add(' SELECT NOMBRE, DIRECCION, COD_POSTAL, PROVINCIA, LOCALIDAD ');
        SelectSQL.Add(' FROM VER_CLIENTES_CPOSTAL ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' CLIENTE = :CODCLIPRO ');
     end
     else
     if ((xLstDetReciboDOC_TIPO.AsString = 'FAP') or (xLstDetReciboDOC_TIPO.AsString = 'AGP') or
        (xLstDetReciboDOC_TIPO.AsString = 'NRP') or (xLstDetReciboDOC_TIPO.AsString = 'AFP')) then
     begin
        SelectSQL.Add(' SELECT NOMBRE, DIRECCION, COD_POSTAL, PROVINCIA, LOCALIDAD ');
        SelectSQL.Add(' FROM VER_PROVEEDORES_CPOSTAL ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' PROVEEDOR = :CODCLIPRO ');
     end
     else
     begin
        SelectSQL.Add(' SELECT NOMBRE, DIRECCION, COD_POSTAL, PROVINCIA, LOCALIDAD ');
        SelectSQL.Add(' FROM VER_ACREEDORES_CPOSTAL ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' ACREEDOR = :CODCLIPRO ');
     end;

     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['CODCLIPRO'].AsInteger := CodCliPro;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(Grupo, Modo, REntorno.Serie, _('Listado de Agrupación de Recibos'), frListado, nil, Archivo);
  CierraData(DMListados);
end;

procedure TDMPagaRecibosAgr.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMPagaRecibosAgr.frListadoBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

function TDMPagaRecibosAgr.DameClienteCartera(IdCarteraDetalle: integer): integer;
begin
  // Obtengo cliente que corresponde con IdCarteraDetalle
  // Si no lo encuentro devuelvo 0.
  // Puede que no lo encuentre porque este pagado/remesado/invisible/Id incorrecto/etc.

  Result := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SIGNO, COD_CLI_PRO FROM VER_CARTERA_AGRUPACION_FAC WHERE ID_CARTERA_DETALLE = :ID_CARTERA_DETALLE';
        Params.ByName['ID_CARTERA_DETALLE'].AsInteger := IdCarteraDetalle;
        ExecQuery;
        if (FieldByName['SIGNO'].AsString = 'C') then
           Result := FieldByName['COD_CLI_PRO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPagaRecibosAgr.SeleccionaRecibo(IdCarteraDetalle: integer);
begin
  // Busco y marco el registro que corresponda con IdCarteraDetalle

  Posicionar(QMRecibos, 'ID_CARTERA_DETALLE', IdCarteraDetalle);

  if (QMRecibosID_CARTERA_DETALLE.AsInteger = IdCarteraDetalle) then
  begin
     with QMRecibos do
     begin
        if (QMRecibosENTRADA.AsInteger <> REntorno.Entrada) then
        begin
           Edit;
           QMRecibosENTRADA.AsInteger := REntorno.Entrada;

           // Con el Autocommit de los campos checkbox puede que no sea necesario hacer el Post.
           if (QMRecibos.State = dsEdit) then
              Post;
        end;
     end;
  end;
end;

function TDMPagaRecibosAgr.DameAcreedorCuenta(Cuenta: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT ACREEDOR FROM CON_CUENTAS_GES_ACR ');
        SQL.Add('WHERE  ');
        SQL.Add('EMPRESA = :EMPRESA AND ');
        SQL.Add('EJERCICIO = :EJERCICIO AND ');
        SQL.Add('CANAL =:CANAL AND ');
        SQL.Add('CUENTA = :CUENTA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        ExecQuery;
        Result := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
