unit UDMLstDescargasGas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, Forms, FIBQuery,
  HYFIBQuery, frxClass, frxDBSet, frxHYReport, frxFIBHYComponents,
  FIBTableDataSet, frxExportPDF;

type
  TDMLstDescargasGas = class(TDataModule)
     xDescargasGas: TFIBDataSetRO;
     DSxDescargasGas: TDataSource;
     TLocal: THYTransaction;
     QGen: THYFIBQuery;
     frxDBxDescargasGas: TfrxDBDataset;
     frDescargasGas: TfrHYReport;
     frDSQMDescargasGas: TfrDBDataSet;
     frxDescargasGas: TfrxHYReport;
     DSxTurnos: TDataSource;
     xTurnos: TFIBDataSetRO;
     xTurnosDESCRIPCION: TFIBStringField;
     xDescargasGasEMPRESA: TIntegerField;
     xDescargasGasEJERCICIO: TIntegerField;
     xDescargasGasCANAL: TIntegerField;
     xDescargasGasSERIE: TFIBStringField;
     xDescargasGasRIG: TIntegerField;
     xDescargasGasID_DESCARGA: TIntegerField;
     xDescargasGasFECHA_INICIO: TDateTimeField;
     xDescargasGasFECHA_CIERRE: TDateTimeField;
     xDescargasGasTIEMPO_DESCARGA: TFloatField;
     xDescargasGasORDEN_COMPRA: TIntegerField;
     xDescargasGasCOLA_CAMION: TIntegerField;
     xDescargasGasTURNO: TFIBStringField;
     xDescargasGasPRECIO: TFloatField;
     xDescargasGasPRESION: TFloatField;
     xDescargasGasTEMPERATURA: TFloatField;
     xDescargasGasALBARAN_CONDUCE: TFloatField;
     xDescargasGasNOTAS: TBlobField;
     xDescargasGasID_DESCARGA_O: TIntegerField;
     xDescargasGasID_DESCARGA_D: TIntegerField;
     xDescargasGasENTRADA: TIntegerField;
     xDescargasGasESTADO: TIntegerField;
     xDescargasGasORDEN: TIntegerField;
     QMTanque: TFIBTableSet;
     QMTanqueEMPRESA: TIntegerField;
     QMTanqueEJERCICIO: TIntegerField;
     QMTanqueCANAL: TIntegerField;
     QMTanqueSERIE: TFIBStringField;
     QMTanqueRIG: TIntegerField;
     QMTanqueID_DESCARGA: TIntegerField;
     QMTanqueLINEA: TIntegerField;
     QMTanqueCOD_TANQUE: TIntegerField;
     QMTanqueCAP_INICIAL: TFloatField;
     QMTanqueCAP_FINAL: TFloatField;
     QMTanqueUNID_CARGA: TFloatField;
     QMTanquePRECIO: TFloatField;
     QMTanqueIMPORTE_TOTAL: TFloatField;
     QMTanqueRIG_MOV: TIntegerField;
     QMTanquePOR_INICIAL: TFloatField;
     QMTanquePOR_FINAL: TFloatField;
     QMTanqueCapacidad: TStringField;
     QMTanqueDescTanque: TStringField;
     DSQMTanque: TDataSource;
     QMDispensador: TFIBTableSet;
     QMDispensadorEMPRESA: TIntegerField;
     QMDispensadorEJERCICIO: TIntegerField;
     QMDispensadorCANAL: TIntegerField;
     QMDispensadorSERIE: TFIBStringField;
     QMDispensadorRIG: TIntegerField;
     QMDispensadorID_DESCARGA: TIntegerField;
     QMDispensadorLINEA: TIntegerField;
     QMDispensadorCOD_DISP: TIntegerField;
     QMDispensadorLECTURA_INICIAL: TFloatField;
     QMDispensadorLECTURA_FINAL: TFloatField;
     QMDispensadorUNID_DISPENSADAS: TFloatField;
     QMDispensadorDescDispensador: TStringField;
     DSQMDispensador: TDataSource;
     frDBDTanque: TfrDBDataSet;
     frDBDDispensador: TfrDBDataSet;
     xTanque: TFIBDataSetRO;
     xTanqueEMPRESA: TIntegerField;
     xTanqueSERIE: TFIBStringField;
     xTanqueCOD_TANQUE: TIntegerField;
     xTanqueTITULO: TFIBStringField;
     xTanqueEVAPORACION: TFloatField;
     xTanqueCAPACIDAD: TFloatField;
     xTanqueALMACEN: TFIBStringField;
     xTanqueARTICULO: TFIBStringField;
     xTanqueTARIFA: TFIBStringField;
     xTanqueESTADO: TIntegerField;
     xTanqueNOTAS: TBlobField;
     DSxTanque: TDataSource;
     xEmpleado: TFIBDataSetRO;
     xEmpleadoEMPRESA: TIntegerField;
     xEmpleadoEMPLEADO: TIntegerField;
     xEmpleadoTERCERO: TIntegerField;
     xEmpleadoTITULO: TFIBStringField;
     xEmpleadoNIF: TFIBStringField;
     xEmpleadoID_EMPLEADO: TIntegerField;
     DSxEmpleado: TDataSource;
     xDispensador: TFIBDataSetRO;
     xDispensadorCOD_DISPENSADOR: TIntegerField;
     xDispensadorTITULO: TFIBStringField;
     xDispensadorESTADO: TIntegerField;
     xDispensadorNOTAS: TBlobField;
     DSxDispensador: TDataSource;
     xFPago: TFIBDataSetRO;
     xFPagoFORMA: TFIBStringField;
     xFPagoTITULO: TFIBStringField;
     xFPagoPLAZOS: TIntegerField;
     xFPagoDIAS_1_PLAZO: TIntegerField;
     xFPagoDIAS_E_PLAZOS: TIntegerField;
     xFPagoTIPO_EFECTO: TFIBStringField;
     xFPagoREMESAR: TIntegerField;
     xFPagoPRONTO_PAGO: TIntegerField;
     xFPagoPAGO_AUTOMATICO: TIntegerField;
     xFPagoACEPTAR: TIntegerField;
     xFPagoDATOS_BANCARIOS: TFIBStringField;
     xFPagoHEREDA_FINANCIACION: TIntegerField;
     xFPagoORDENAR_PAGO: TIntegerField;
     xFPagoMES_NATURAL: TIntegerField;
     DSxFPago: TDataSource;
     xTipoMoneda: TFIBDataSetRO;
     xTipoMonedaDESCRIPCION: TFIBStringField;
     xTipoMonedaVALOR: TFloatField;
     DSxTipoMoneda: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frDescargasGasEnterRect(Memo: TStringList; View: TfrView);
     procedure frxDescargasGasBeforePrint(Sender: TfrxReportComponent);
     procedure MostrarListado(id_descarga, rig: integer; serie: string; Modo: integer);
     procedure frDescargasGasGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMLstDescargasGas : TDMLstDescargasGas;

implementation

{$R *.dfm}

uses UDMMain, UDMListados, UEntorno, UFormGest, UUtiles{, frx2xto30};

procedure TDMLstDescargasGas.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstDescargasGas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.commit;
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstDescargasGas.frDescargasGasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstDescargasGas.frxDescargasGasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstDescargasGas.MostrarListado(id_descarga, rig: integer; serie: string; Modo: integer);
var
  str : string;
begin
  with xDescargaSGas do
  begin
     Close;
     Params.ByName['ID_DESCARGA'].AsInteger := id_descarga;
     Open;
  end;

  DMListados.Cargar(9907, serie);

  if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
     REntorno.Copias := DMListados.Copias;

  if (Modo = 0) then
     REntorno.Copias := 1;

  if (REntorno.TipoListado = 'FRF') then
  begin
     frDescargasGas.LoadFromFIB(REntorno.Formato, str);
     frDescargasGas.PrepareReport;
     case Modo of
        0:
        begin
           frDescargasGas.DefaultCopies := REntorno.Copias;
           frDescargasGas.ShowPreparedReport;
        end;
        1: frDescargasGas.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  if (REntorno.TipoListado = 'FR3') then
  begin
     frxDescargasGas.LoadFromFIB(REntorno.Formato, str);
     frxDescargasGas.PrepareReport;
     case Modo of
        0:
        begin
           frxDescargasGas.PrintOptions.Copies := REntorno.Copias;
           frxDescargasGas.ShowPreparedReport;
        end;
        1: frxDescargasGas.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
  DMListados.Copias := 0;
end;


procedure TDMLstDescargasGas.frDescargasGasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'DescTurno' then
     with xTurnos do
     begin
        Close;
        Params.ByName['Turno'].AsString := xDescargasGasTURNO.Value;
        Open;
        ParValue := xTurnosDESCRIPCION.Value;
     end;

  if ParName = 'DescTanque' then
     with xTanque do
     begin
        Close;
        Params.ByName['empresa'].AsInteger := QMTanqueEMPRESA.Value;
        Params.ByName['ejercicio'].AsInteger := QMTanqueEJERCICIO.Value;
        Params.ByName['canal'].AsInteger := QMTanqueCANAL.Value;
        Params.ByName['serie'].AsString := QMTanqueSERIE.Value;
        Params.ByName['tanque'].AsInteger := QMTanqueCOD_TANQUE.Value;
        Open;
        ParValue := xTanqueTITULO.Value;
     end;

  if ParName = 'DescDispensador' then
     with xDispensador do
     begin
        Close;
        Params.ByName['dispensador'].AsInteger := QMDispensadorCOD_DISP.Value;
        Open;
        ParValue := xDispensadorTITULO.Value;
     end;
end;

end.
