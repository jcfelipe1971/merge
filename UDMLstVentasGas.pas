unit UDMLstVentasGas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, Forms, FIBQuery,
  HYFIBQuery, frxClass, frxDBSet, frxHYReport, frxFIBHYComponents,
  FIBTableDataSet, frxExportPDF;

type
  TDMLstVentasGas = class(TDataModule)
     xVentasGas: TFIBDataSetRO;
     DSxVentasGas: TDataSource;
     TLocal: THYTransaction;
     QGen: THYFIBQuery;
     frxDBxVentasGas: TfrxDBDataset;
     frVentasGas: TfrHYReport;
     frDSQMVentasGas: TfrDBDataSet;
     frxVentasGas: TfrxHYReport;
     xVentasGasEMPRESA: TIntegerField;
     xVentasGasEJERCICIO: TIntegerField;
     xVentasGasCANAL: TIntegerField;
     xVentasGasSERIE: TFIBStringField;
     xVentasGasRIG: TIntegerField;
     xVentasGasID_VENTA: TIntegerField;
     xVentasGasFECHA_INICIO: TDateTimeField;
     xVentasGasFECHA_CIERRE: TDateTimeField;
     xVentasGasACTIVO: TIntegerField;
     xVentasGasTURNO: TFIBStringField;
     xVentasGasDIF_TANQUES_DISPENSADORES: TFloatField;
     xVentasGasDIF_COB_TANQUE: TFloatField;
     xVentasGasNOTAS: TBlobField;
     xVentasGasESTADO: TIntegerField;
     xVentasGasID_VENTA_O: TIntegerField;
     xVentasGasID_VENTA_D: TIntegerField;
     xVentasGasTOT_INI_TANQUE: TFloatField;
     xVentasGasTOT_FIN_TANQUE: TFloatField;
     xVentasGasTOT_INI_DISP: TFloatField;
     xVentasGasTOT_FIN_DISP: TFloatField;
     xVentasGasTOTAL_COBRADO: TFloatField;
     xVentasGasTOT_DIF_TANQUE: TFloatField;
     xVentasGasTOT_DIF_DISP: TFloatField;
     xVentasGasIMPORTE_DIF_TANQUE: TFloatField;
     xVentasGasIMPORTE_DIF_DISP: TFloatField;
     xVentasGasENTRADA: TIntegerField;
     xVentasGasARTICULO: TFIBStringField;
     xVentasGasPRECIO: TFloatField;
     xVentasGasORDEN: TIntegerField;
     xVentasGasDIF_IMPORTE_TANQ_DISP: TFloatField;
     DSxTurnos: TDataSource;
     xTurnos: TFIBDataSetRO;
     xTurnosDESCRIPCION: TFIBStringField;
     QMTanque: TFIBTableSet;
     QMTanqueEMPRESA: TIntegerField;
     QMTanqueRIG: TIntegerField;
     QMTanqueID_VENTA: TIntegerField;
     QMTanqueLINEA: TIntegerField;
     QMTanqueCOD_TANQUE: TIntegerField;
     QMTanquePOR_INICIAL: TFloatField;
     QMTanquePOR_FINAL: TFloatField;
     QMTanqueCAP_INICIAL: TFloatField;
     QMTanqueCAP_FINAL: TFloatField;
     QMTanqueUNID_SALIDA: TFloatField;
     QMTanquePRECIO: TFloatField;
     QMTanqueDescTanque: TStringField;
     QMTanqueCapacidad: TIntegerField;
     QMTanqueIMPORTE_TOTAL: TFloatField;
     QMTanqueSERIE: TFIBStringField;
     QMTanqueEJERCICIO: TIntegerField;
     QMTanqueCANAL: TIntegerField;
     QMTanqueRIG_MOV: TIntegerField;
     DSQMTanque: TDataSource;
     QMEmpleado: TFIBTableSet;
     QMEmpleadoEMPRESA: TIntegerField;
     QMEmpleadoEJERCICIO: TIntegerField;
     QMEmpleadoCANAL: TIntegerField;
     QMEmpleadoSERIE: TFIBStringField;
     QMEmpleadoRIG: TIntegerField;
     QMEmpleadoID_VENTA: TIntegerField;
     QMEmpleadoLINEA: TIntegerField;
     QMEmpleadoEMPLEADO: TIntegerField;
     QMEmpleadoDescEmpleado: TStringField;
     DSQMEmpleado: TDataSource;
     QMDispensador: TFIBTableSet;
     QMDispensadorEMPRESA: TIntegerField;
     QMDispensadorEJERCICIO: TIntegerField;
     QMDispensadorCANAL: TIntegerField;
     QMDispensadorSERIE: TFIBStringField;
     QMDispensadorRIG: TIntegerField;
     QMDispensadorID_VENTA: TIntegerField;
     QMDispensadorLINEA_EMPLEADO: TIntegerField;
     QMDispensadorLINEA: TIntegerField;
     QMDispensadorCOD_DISPENSADOR: TIntegerField;
     QMDispensadorLECTURA_INICIAL: TFloatField;
     QMDispensadorLECTURA_FINAL: TFloatField;
     QMDispensadorUNID_DISPENSADAS: TFloatField;
     QMDispensadorDescDispensador: TStringField;
     QMDispensadorPRECIO: TFloatField;
     QMDispensadorIMPORTE_TOTAL: TFloatField;
     DSQMDispensador: TDataSource;
     QMFPago: TFIBTableSet;
     QMFPagoEMPRESA: TIntegerField;
     QMFPagoEJERCICIO: TIntegerField;
     QMFPagoCANAL: TIntegerField;
     QMFPagoSERIE: TFIBStringField;
     QMFPagoRIG: TIntegerField;
     QMFPagoID_VENTA: TIntegerField;
     QMFPagoLINEA_EMPLEADO: TIntegerField;
     QMFPagoLINEA: TIntegerField;
     QMFPagoFORMA_PAGO: TFIBStringField;
     QMFPagoIMPORTE: TFloatField;
     QMFPagoDescFPago: TStringField;
     DSQMFPago: TDataSource;
     QMMonedas: TFIBTableSet;
     QMMonedasEMPRESA: TIntegerField;
     QMMonedasEJERCICIO: TIntegerField;
     QMMonedasCANAL: TIntegerField;
     QMMonedasSERIE: TFIBStringField;
     QMMonedasRIG: TIntegerField;
     QMMonedasID_VENTA: TIntegerField;
     QMMonedasLINEA_EMPLEADO: TIntegerField;
     QMMonedasLINEA: TIntegerField;
     QMMonedasCOD_MONEDA: TIntegerField;
     QMMonedasCANTIDAD: TFloatField;
     QMMonedasTOTAL: TFloatField;
     QMMonedasDescMoneda: TStringField;
     QMMonedasValor: TIntegerField;
     DSQMMonedas: TDataSource;
     frDBDTanque: TfrDBDataSet;
     frDBDEmpleado: TfrDBDataSet;
     frDBDDispensador: TfrDBDataSet;
     frDBDFPago: TfrDBDataSet;
     frDBDMonedas: TfrDBDataSet;
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
     procedure frVentasGasEnterRect(Memo: TStringList; View: TfrView);
     procedure frxVentasGasBeforePrint(Sender: TfrxReportComponent);
     procedure MostrarListado(id_venta, rig: integer; serie: string; Modo: integer);
     procedure frVentasGasGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMLstVentasGas : TDMLstVentasGas;

implementation

{$R *.dfm}

uses UDMMain, UDMListados, UEntorno, UFormGest, UUtiles{, frx2xto30};

procedure TDMLstVentasGas.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstVentasGas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.commit;
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstVentasGas.frVentasGasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstVentasGas.frxVentasGasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstVentasGas.MostrarListado(id_venta, rig: integer; serie: string; Modo: integer);
var
  str : string;
begin
  with xVentasGas do
  begin
     Close;
     Params.ByName['ID_VENTA'].AsInteger := id_venta;
     Open;
  end;

  DMListados.Cargar(9906, serie);

  if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
     REntorno.Copias := DMListados.Copias;

  if (Modo = 0) then
     REntorno.Copias := 1;

  if (REntorno.TipoListado = 'FRF') then
  begin
     frVentasGas.LoadFromFIB(REntorno.Formato, str);
     frVentasGas.PrepareReport;
     case Modo of
        0:
        begin
           frVentasGas.DefaultCopies := REntorno.Copias;
           frVentasGas.ShowPreparedReport;
        end;
        1: frVentasGas.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  if (REntorno.TipoListado = 'FR3') then
  begin
     frxVentasGas.LoadFromFIB(REntorno.Formato, str);
     frxVentasGas.PrepareReport;
     case Modo of
        0:
        begin
           frxVentasGas.PrintOptions.Copies := REntorno.Copias;
           frxVentasGas.ShowPreparedReport;
        end;
        1: frxVentasGas.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
  DMListados.Copias := 0;
end;


procedure TDMLstVentasGas.frVentasGasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'DescTurno' then
     with xTurnos do
     begin
        Close;
        Params.ByName['Turno'].AsString := xVentasGasTURNO.Value;
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

  if ParName = 'DescEmpleado' then
     with xEmpleado do
     begin
        Close;
        Params.ByName['empresa'].AsInteger := QMEmpleadoEMPRESA.Value;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.Value;
        Open;
        ParValue := xEmpleadoTITULO.Value;
     end;

  if ParName = 'DescDispensador' then
     with xDispensador do
     begin
        Close;
        Params.ByName['dispensador'].AsInteger := QMDispensadorCOD_DISPENSADOR.Value;
        Open;
        ParValue := xDispensadorTITULO.Value;
     end;

  if ParName = 'DescFPago' then
     with xFPago do
     begin
        Close;
        Params.ByName['Forma'].AsString := QMFPagoFORMA_PAGO.Value;
        Open;
        ParValue := xFPagoTITULO.Value;
     end;

  if ParName = 'DescMoneda' then
     with xTipoMoneda do
     begin
        Close;
        Params.ByName['cod_moneda'].AsInteger := QMMonedasCOD_MONEDA.Value;
        Open;
        ParValue := xTipoMonedaDESCRIPCION.Value;
     end;
end;

end.
