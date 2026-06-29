unit UDMVentasGas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math, Windows, Messages, Forms, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ActnList, Buttons, UFormGest,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdPOP3, IdSocks, IdSMTP, IdEMailAddress, IdNNTP, URecursos,
  rxPlacemnt, NsDBGrid, ULFDBMemo, ULFDBEdit, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, Clipbrd;

type
  TDMVentasGas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSxInfoActualizada: TDataSource;
     xInfoActualizada: TFIBDataSetRO;
     DSxSeries: TDataSource;
     xSeries: TFIBDataSetRO;
     QMVentasGas: TFIBTableSet;
     DSQMVentasGas: TDataSource;
     QMVentasGasEMPRESA: TIntegerField;
     QMVentasGasEJERCICIO: TIntegerField;
     QMVentasGasCANAL: TIntegerField;
     QMVentasGasSERIE: TFIBStringField;
     QMVentasGasRIG: TIntegerField;
     QMVentasGasID_VENTA: TIntegerField;
     QMVentasGasFECHA_INICIO: TDateTimeField;
     QMVentasGasFECHA_CIERRE: TDateTimeField;
     QMVentasGasTURNO: TFIBStringField;
     QMVentasGasDIF_TANQUES_DISPENSADORES: TFloatField;
     QMVentasGasNOTAS: TBlobField;
     QMTanque: TFIBTableSet;
     DSQMTanque: TDataSource;
     QMTanqueEMPRESA: TIntegerField;
     QMTanqueSERIE: TFIBStringField;
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
     QMEmpleado: TFIBTableSet;
     DSQMEmpleado: TDataSource;
     QMEmpleadoEMPRESA: TIntegerField;
     QMEmpleadoEJERCICIO: TIntegerField;
     QMEmpleadoCANAL: TIntegerField;
     QMEmpleadoSERIE: TFIBStringField;
     QMEmpleadoRIG: TIntegerField;
     QMEmpleadoID_VENTA: TIntegerField;
     QMEmpleadoLINEA: TIntegerField;
     QMEmpleadoEMPLEADO: TIntegerField;
     QMDispensador: TFIBTableSet;
     DSQMDispensador: TDataSource;
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
     QMFPago: TFIBTableSet;
     DSQMFPago: TDataSource;
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
     QMMonedas: TFIBTableSet;
     DSQMMonedas: TDataSource;
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
     QMVentasGasACTIVO: TIntegerField;
     QMVentasGasESTADO: TIntegerField;
     QMTanqueDescTanque: TStringField;
     QMTanqueCAPACIDAD: TIntegerField;
     DSxTanque: TDataSource;
     xTanque: TFIBDataSetRO;
     xTanqueTITULO: TFIBStringField;
     xTanqueCAPACIDAD: TFloatField;
     DSxEstados: TDataSource;
     xEstados: TFIBDataSetRO;
     xEstadosESTADO: TIntegerField;
     xEstadosTITULO: TFIBStringField;
     QMEmpleadoDescEmpleado: TStringField;
     QMDispensadorDescDispensador: TStringField;
     DSxDispensador: TDataSource;
     xDispensador: TFIBDataSetRO;
     xDispensadorTITULO: TFIBStringField;
     QMFPagoDescFPago: TStringField;
     QMVentasGasDescEstado: TStringField;
     QMVentasGasID_VENTA_O: TIntegerField;
     QMVentasGasID_VENTA_D: TIntegerField;
     QMVentasGasTOT_INI_TANQUE: TFloatField;
     QMVentasGasTOT_FIN_TANQUE: TFloatField;
     QMVentasGasTOT_INI_DISP: TFloatField;
     QMVentasGasTOT_FIN_DISP: TFloatField;
     QMVentasGasTOTAL_COBRADO: TFloatField;
     QMTanqueIMPORTE_TOTAL: TFloatField;
     QMVentasGasTOT_DIF_TANQUE: TFloatField;
     QMVentasGasTOT_DIF_DISP: TFloatField;
     QMVentasGasIMPORTE_DIF_TANQUE: TFloatField;
     QMVentasGasIMPORTE_DIF_DISP: TFloatField;
     QMVentasGasENTRADA: TIntegerField;
     QMVentasGasDIF_COB_TANQUE: TFloatField;
     QMMonedasDescMoneda: TStringField;
     DSxTipoMoneda: TDataSource;
     xTipoMoneda: TFIBDataSetRO;
     xTipoMonedaDESCRIPCION: TFIBStringField;
     xTipoMonedaVALOR: TFloatField;
     QMMonedasVALOR: TIntegerField;
     QMTanqueEJERCICIO: TIntegerField;
     QMTanqueCANAL: TIntegerField;
     QMTanqueRIG_MOV: TIntegerField;
     QMDispensadorIMPORTE_TOTAL: TFloatField;
     QMVentasGasARTICULO: TFIBStringField;
     QMVentasGasPRECIO: TFloatField;
     QMVentasGasORDEN: TIntegerField;
     QMDispensadorPRECIO: TFloatField;
     QMVentasGasDIF_IMPORTE_TANQ_DISP: TFloatField;
     xInfoActualizadaEMPRESA: TIntegerField;
     xInfoActualizadaEJERCICIO: TIntegerField;
     xInfoActualizadaCANAL: TIntegerField;
     xInfoActualizadaSERIE: TFIBStringField;
     xInfoActualizadaRIG: TIntegerField;
     xInfoActualizadaID_VENTA: TIntegerField;
     xInfoActualizadaFECHA_INICIO: TDateTimeField;
     xInfoActualizadaFECHA_CIERRE: TDateTimeField;
     xInfoActualizadaACTIVO: TIntegerField;
     xInfoActualizadaTURNO: TFIBStringField;
     xInfoActualizadaDIF_TANQUES_DISPENSADORES: TFloatField;
     xInfoActualizadaDIF_COB_TANQUE: TFloatField;
     xInfoActualizadaNOTAS: TBlobField;
     xInfoActualizadaESTADO: TIntegerField;
     xInfoActualizadaID_VENTA_O: TIntegerField;
     xInfoActualizadaID_VENTA_D: TIntegerField;
     xInfoActualizadaTOT_INI_TANQUE: TFloatField;
     xInfoActualizadaTOT_FIN_TANQUE: TFloatField;
     xInfoActualizadaTOT_INI_DISP: TFloatField;
     xInfoActualizadaTOT_FIN_DISP: TFloatField;
     xInfoActualizadaTOTAL_COBRADO: TFloatField;
     xInfoActualizadaTOT_DIF_TANQUE: TFloatField;
     xInfoActualizadaTOT_DIF_DISP: TFloatField;
     xInfoActualizadaIMPORTE_DIF_TANQUE: TFloatField;
     xInfoActualizadaIMPORTE_DIF_DISP: TFloatField;
     xInfoActualizadaENTRADA: TIntegerField;
     xInfoActualizadaARTICULO: TFIBStringField;
     xInfoActualizadaPRECIO: TFloatField;
     xInfoActualizadaORDEN: TIntegerField;
     xInfoActualizadaDIF_IMPORTE_TANQ_DISP: TFloatField;
     QMDispensadorEMPLEADO: TIntegerField;
     QMEmpleadoIMPORTE_DISPENSADOR: TFloatField;
     QMEmpleadoIMPORTE_PAGADO: TFloatField;
     QMEmpleadoIMPORTE_DIFERENCIA: TFloatField;
     QMFPagoEMPLEADO: TIntegerField;
     QMVentasGasTOTAL_SOBRANTE: TFloatField;
     QMVentasGasTOTAL_FALTANTE: TFloatField;
     xInfoActualizadaTOTAL_SOBRANTE: TFloatField;
     xInfoActualizadaTOTAL_FALTANTE: TFloatField;
     QMVentasGasTOT_DESCARGA_TANQ: TFloatField;
     QMVentasGasTOT_DESCARGA_DISP: TFloatField;
     QMVentasGasRIC: TIntegerField;
     QMVentasGasCONTABILIZADO: TIntegerField;
     xInfoActualizadaTOT_DESCARGA_TANQ: TFloatField;
     xInfoActualizadaTOT_DESCARGA_DISP: TFloatField;
     xInfoActualizadaCONTABILIZADO: TIntegerField;
     xInfoActualizadaRIC: TIntegerField;
     QMTanqueUNID_DESCARGA_TANQ: TFloatField;
     QMDispensadorUNID_DESCARGADAS: TFloatField;
     QMEmpleadoUNIDADES_DISPENSADAS: TFloatField;
     QMVentasGasCOSTE: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMEmpleadoAfterOpen(DataSet: TDataSet);
     procedure QMEmpleadoBeforeClose(DataSet: TDataSet);
     procedure QMTanqueNewRecord(DataSet: TDataSet);
     procedure QMEmpleadoNewRecord(DataSet: TDataSet);
     procedure QMDispensadorNewRecord(DataSet: TDataSet);
     procedure QMFPagoNewRecord(DataSet: TDataSet);
     procedure QMMonedasNewRecord(DataSet: TDataSet);
     procedure QMTanqueAfterEdit(DataSet: TDataSet);
     procedure QMEmpleadoAfterEdit(DataSet: TDataSet);
     procedure QMDispensadorAfterEdit(DataSet: TDataSet);
     procedure QMFPagoAfterEdit(DataSet: TDataSet);
     procedure QMMonedasAfterEdit(DataSet: TDataSet);
     procedure QMTanqueAfterPost(DataSet: TDataSet);
     procedure QMVentasGasNewRecord(DataSet: TDataSet);
     procedure QMVentasGasBeforePost(DataSet: TDataSet);
     procedure QMTanqueDescTanqueGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTanqueCapacidadGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMVentasGasAfterOpen(DataSet: TDataSet);
     procedure QMEmpleadoDescEmpleadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDispensadorDescDispensadorGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFPagoDescFPagoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMVentasGasDescEstadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMVentasGasBeforeDelete(DataSet: TDataSet);
     procedure QMVentasGasBeforeEdit(DataSet: TDataSet);
     procedure QMTanqueBeforeEdit(DataSet: TDataSet);
     procedure QMEmpleadoBeforeEdit(DataSet: TDataSet);
     procedure QMDispensadorBeforeEdit(DataSet: TDataSet);
     procedure QMFPagoBeforeEdit(DataSet: TDataSet);
     procedure QMMonedasBeforeEdit(DataSet: TDataSet);
     procedure QMTanqueBeforeInsert(DataSet: TDataSet);
     procedure QMEmpleadoBeforeInsert(DataSet: TDataSet);
     procedure QMDispensadorBeforeInsert(DataSet: TDataSet);
     procedure QMFPagoBeforeInsert(DataSet: TDataSet);
     procedure QMMonedasBeforeInsert(DataSet: TDataSet);
     procedure QMVentasGasAfterPost(DataSet: TDataSet);
     procedure QMMonedasDescMonedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMonedasValorGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTanqueBeforeDelete(DataSet: TDataSet);
     procedure QMEmpleadoBeforeDelete(DataSet: TDataSet);
     procedure QMDispensadorBeforeDelete(DataSet: TDataSet);
     procedure QMFPagoBeforeDelete(DataSet: TDataSet);
     procedure QMMonedasBeforeDelete(DataSet: TDataSet);
     procedure QMMonedasTOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDispensadorAfterPost(DataSet: TDataSet);
     procedure QMFPagoAfterPost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMMonedasAfterPost(DataSet: TDataSet);
     procedure QMVentasGasFECHA_INICIOChange(Sender: TField);
     procedure QMVentasGasBeforeClose(DataSet: TDataSet);
     procedure QMDispensadorAfterDelete(DataSet: TDataSet);
     procedure QMFPagoAfterDelete(DataSet: TDataSet);
     procedure QMMonedasAfterDelete(DataSet: TDataSet);
     procedure QMTanqueCOD_TANQUEValidate(Sender: TField);
  private
     { Private declarations }
     SQLFind: string;
     Serie: string;
     procedure SerieChange(SerieVar: string);
     procedure RefrescaEmpleado(DataSet: TDataSet = nil);
     function DameDescarga(Tanque: integer; Turno: string; Fecha: TDateTime): double;
  public
     function BusquedaCompleja: integer;
     function NoAccesActivo(modul: TFIBTableSet): integer;
     procedure CrearNuevaVenta;
     procedure CambiaSerie(SerieVar: string);
     procedure CerrarVenta(FechaCierre, FechaInicio: TDateTime; Turno: string; IdVenta, Origen: integer);
     procedure AbrirVenta;
     function ExisteFecha(Fecha: TDateTime; id_venta: integer): integer;
     procedure InfoActualizada;
     function DameTituloTurno(Turno: string): string;
  end;

var
  DMVentasGas : TDMVentasGas;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, UFMain, UDameDato;

{$R *.dfm}

procedure TDMVentasGas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMVentasGasPRECIO.DisplayFormat := MascaraN;
  xInfoActualizadaTOT_INI_TANQUE.DisplayFormat := MascaraN;
  xInfoActualizadaTOT_FIN_TANQUE.DisplayFormat := MascaraN;
  xInfoActualizadaTOT_INI_DISP.DisplayFormat := MascaraN;
  xInfoActualizadaTOT_FIN_DISP.DisplayFormat := MascaraN;
  xInfoActualizadaTOTAL_COBRADO.DisplayFormat := MascaraN;
  xInfoActualizadaTOT_DIF_TANQUE.DisplayFormat := MascaraN;
  xInfoActualizadaTOT_DIF_DISP.DisplayFormat := MascaraN;
  xInfoActualizadaIMPORTE_DIF_TANQUE.DisplayFormat := MascaraN;
  xInfoActualizadaIMPORTE_DIF_DISP.DisplayFormat := MascaraN;
  xInfoActualizadaDIF_COB_TANQUE.DisplayFormat := MascaraN;
  xInfoActualizadaDIF_TANQUES_DISPENSADORES.DisplayFormat := MascaraN;
  xInfoActualizadaDIF_IMPORTE_TANQ_DISP.DisplayFormat := MascaraN;
  QMTanquePOR_INICIAL.DisplayFormat := MascaraP;
  QMTanquePOR_FINAL.DisplayFormat := MascaraP;
  QMTanqueCAP_INICIAL.DisplayFormat := MascaraN;
  QMTanqueCAP_FINAL.DisplayFormat := MascaraN;
  QMTanqueUNID_SALIDA.DisplayFormat := MascaraN;
  QMTanquePRECIO.DisplayFormat := MascaraN;
  QMTanqueIMPORTE_TOTAL.DisplayFormat := MascaraN;
  QMDispensadorUNID_DISPENSADAS.DisplayFormat := MascaraN;
  QMDispensadorLECTURA_INICIAL.DisplayFormat := MascaraN;
  QMDispensadorLECTURA_FINAL.DisplayFormat := MascaraN;
  QMDispensadorPRECIO.DisplayFormat := MascaraN;
  QMDispensadorIMPORTE_TOTAL.DisplayFormat := MascaraN;
  QMFPagoIMPORTE.DisplayFormat := MascaraN;
  QMMonedasCANTIDAD.DisplayFormat := MascaraN;
  QMMonedasTOTAL.DisplayFormat := MascaraN;
  QMEmpleadoIMPORTE_DISPENSADOR.DisplayFormat := MascaraN;
  QMEmpleadoIMPORTE_PAGADO.DisplayFormat := MascaraN;
  QMEmpleadoIMPORTE_DIFERENCIA.DisplayFormat := MascaraN;
  QMEmpleadoUNIDADES_DISPENSADAS.DisplayFormat := MascaraN;
  xInfoActualizadaTOTAL_SOBRANTE.DisplayFormat := MascaraN;
  xInfoActualizadaTOTAL_FALTANTE.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMVentasGas, '11100', False);
  SQLFind := QMVentasGas.SelectSQL.Text;
  Serie := REntorno.Serie;
end;

function TDMVentasGas.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMVentasGas, '11100', True, Serie);
  if (Result = mrAll) then
  begin
     QMVentasGas.Close;
     QMVentasGas.SelectSQL.Text := SQLFind;
     DMMain.FiltraTabla(QMVentasGas, '11100', False);
     CambiaSerie(Serie);
  end;
end;

procedure TDMVentasGas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  InfoActualizada;
end;

procedure TDMVentasGas.QMEmpleadoAfterOpen(DataSet: TDataSet);
begin
  QMDispensador.Open;
  QMFPago.Open;
  QMMonedas.Open;
end;

procedure TDMVentasGas.QMEmpleadoBeforeClose(DataSet: TDataSet);
begin
  QMDispensador.Close;
  QMFPago.Close;
  QMMonedas.Close;
end;

procedure TDMVentasGas.QMTanqueNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Es mira com esta l'estat
  // if (QMVentasGasESTADO.AsInteger = 1) then
  // begin
  if (NoAccesActivo(QMVentasGas) = 0) then
  begin
     QMTanqueEMPRESA.AsInteger := QMVentasGasEMPRESA.AsInteger;
     QMTanqueEJERCICIO.AsInteger := QMVentasGasEJERCICIO.AsInteger;
     QMTanqueCANAL.AsInteger := QMVentasGasCANAL.AsInteger;
     QMTanqueSERIE.AsString := QMVentasGasSERIE.AsString;

     QMTanqueID_VENTA.AsInteger := QMVentasGasID_VENTA.AsInteger;
     QMTanqueRIG.AsInteger := QMVentasGasRIG.AsInteger;
     QMTanquePOR_INICIAL.AsInteger := 0;
     QMTanquePOR_FINAL.AsInteger := 0;
     QMTanqueCAP_INICIAL.AsInteger := 0;
     QMTanqueCAP_FINAL.AsInteger := 0;
     QMTanqueUNID_SALIDA.AsInteger := 0;
     QMTanquePRECIO.AsInteger := 0;

     // nº de linea
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA) FROM GES_GAS_DET_TANQUE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' ID_VENTA = ?ID_VENTA ');
        Params.ByName['EMPRESA'].AsInteger := QMTanqueEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMTanqueEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMTanqueCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMTanqueSERIE.AsString;
        Params.ByName['ID_VENTA'].AsInteger := QMTanqueID_VENTA.AsInteger;
        ExecQuery;
        QMTanqueLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
  // end;
  // else
  //    ShowMessage(_('No se pueden añadir datos.'));
end;

procedure TDMVentasGas.QMEmpleadoNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Es mira com esta l'estat
  if (NoAccesActivo(QMVentasGas) = 0) then
  begin
     QMEmpleadoEMPRESA.AsInteger := QMVentasGasEMPRESA.AsInteger;
     QMEmpleadoEJERCICIO.AsInteger := QMVentasGasEJERCICIO.AsInteger;
     QMEmpleadoCANAL.AsInteger := QMVentasGasCANAL.AsInteger;
     QMEmpleadoSERIE.AsString := QMVentasGasSERIE.AsString;

     QMEmpleadoID_VENTA.AsInteger := QMVentasGasID_VENTA.AsInteger;
     QMEmpleadoRIG.AsInteger := QMVentasGasRIG.AsInteger;

     // nº de linea
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA) FROM GES_GAS_DET_EMPLEADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' ID_VENTA = ?ID_VENTA ');
        Params.ByName['EMPRESA'].AsInteger := QMEmpleadoEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMEmpleadoEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMEmpleadoCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMEmpleadoSERIE.AsString;
        Params.ByName['ID_VENTA'].AsInteger := QMEmpleadoID_VENTA.AsInteger;
        ExecQuery;
        QMEmpleadoLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMVentasGas.QMDispensadorNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Es mira com esta l'estat
  if (NoAccesActivo(QMVentasGas) = 0) then
  begin
     if (QMEmpleado['Linea'] = null) then
        ShowMessage(_('Debe de especificarse el empleado que se imputa el dispensador.'))
     else
     begin
        QMDispensadorEMPRESA.AsInteger := QMVentasGasEMPRESA.AsInteger;
        QMDispensadorEJERCICIO.AsInteger := QMVentasGasEJERCICIO.AsInteger;
        QMDispensadorCANAL.AsInteger := QMVentasGasCANAL.AsInteger;
        QMDispensadorSERIE.AsString := QMVentasGasSERIE.AsString;
        QMDispensadorRIG.AsInteger := QMVentasGasRIG.AsInteger;
        QMDispensadorID_VENTA.AsInteger := QMVentasGasID_VENTA.AsInteger;
        QMDispensadorLINEA_EMPLEADO.AsInteger := QMEmpleadoLINEA.AsInteger;
        QMDispensadorEMPLEADO.AsInteger := QMEmpleadoEMPLEADO.AsInteger;

        // nº de linea
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM GES_GAS_DET_DISPENSADOR ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' ID_VENTA = ?ID_VENTA ');
           Params.ByName['EMPRESA'].AsInteger := QMEmpleadoEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMEmpleadoEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMEmpleadoCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMEmpleadoSERIE.AsString;
           Params.ByName['ID_VENTA'].AsInteger := QMEmpleadoID_VENTA.AsInteger;
           ExecQuery;
           QMDispensadorLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMVentasGas.QMFPagoNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Es mira com esta l'estat
  if (NoAccesActivo(QMVentasGas) = 0) then
  begin
     if (QMEmpleado['Linea'] = null) then
        ShowMessage(_('Debe de especificarse el empleado que se imputa la forma de pago.'))
     else
     begin
        QMFPagoEMPRESA.AsInteger := QMVentasGasEMPRESA.AsInteger;
        QMFPagoEJERCICIO.AsInteger := QMVentasGasEJERCICIO.AsInteger;
        QMFPagoCANAL.AsInteger := QMVentasGasCANAL.AsInteger;
        QMFPagoSERIE.AsString := QMVentasGasSERIE.AsString;
        QMFPagoRIG.AsInteger := QMVentasGasRIG.AsInteger;
        QMFPagoID_VENTA.AsInteger := QMVentasGasID_VENTA.AsInteger;
        QMFPagoLINEA_EMPLEADO.AsInteger := QMEmpleadoLINEA.AsInteger;
        QMFPagoEMPLEADO.AsInteger := QMEmpleadoEMPLEADO.AsInteger;

        QMFPagoIMPORTE.AsInteger := 0;

        // nº de linea
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM GES_GAS_DET_FPAGO ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' ID_VENTA = ?ID_VENTA ');
           Params.ByName['EMPRESA'].AsInteger := QMEmpleadoEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMEmpleadoEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMEmpleadoCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMEmpleadoSERIE.AsString;
           Params.ByName['ID_VENTA'].AsInteger := QMEmpleadoID_VENTA.AsInteger;
           ExecQuery;
           QMFPagoLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMVentasGas.QMMonedasNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (NoAccesActivo(QMVentasGas) = 0) then
  begin
     if (QMEmpleado['Linea'] = null) then
     begin
        ShowMessage(_('Debe de especificarse el empleado que se imputa la moneda.'));
     end
     else
     begin
        QMMonedasEMPRESA.AsInteger := QMVentasGasEMPRESA.AsInteger;
        QMMonedasEJERCICIO.AsInteger := QMVentasGasEJERCICIO.AsInteger;
        QMMonedasCANAL.AsInteger := QMVentasGasCANAL.AsInteger;
        QMMonedasSERIE.AsString := QMVentasGasSERIE.AsString;
        QMMonedasRIG.AsInteger := QMVentasGasRIG.AsInteger;
        QMMonedasID_VENTA.AsInteger := QMVentasGasID_VENTA.AsInteger;
        QMMonedasLINEA_EMPLEADO.AsInteger := QMEmpleadoLINEA.AsInteger;

        // nº de linea
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM GES_GAS_DET_MONEDAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' ID_VENTA = ?ID_VENTA ');
           Params.ByName['EMPRESA'].AsInteger := QMEmpleadoEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMEmpleadoEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMEmpleadoCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMEmpleadoSERIE.AsString;
           Params.ByName['ID_VENTA'].AsInteger := QMEmpleadoID_VENTA.AsInteger;
           ExecQuery;
           QMMonedasLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end;
end;

function TDMVentasGas.NoAccesActivo(modul: TFIBTableSet): integer;
begin
  Result := 0;
  if (QMVentasGasACTIVO.AsInteger = 1) then
  begin
     ShowMessage(_('No se puede modificar, la venta está activa'));
     modul.Cancel;
     Result := 1;
  end;
end;

procedure TDMVentasGas.QMTanqueAfterEdit(DataSet: TDataSet);
begin
  NoAccesActivo(QMVentasGas);
end;

procedure TDMVentasGas.QMEmpleadoAfterEdit(DataSet: TDataSet);
begin
  NoAccesActivo(QMVentasGas);
end;

procedure TDMVentasGas.QMDispensadorAfterEdit(DataSet: TDataSet);
begin
  InfoActualizada;
  NoAccesActivo(QMVentasGas);
end;

procedure TDMVentasGas.QMFPagoAfterEdit(DataSet: TDataSet);
begin
  NoAccesActivo(QMVentasGas);
end;

procedure TDMVentasGas.QMMonedasAfterEdit(DataSet: TDataSet);
begin
  NoAccesActivo(QMVentasGas);
end;

procedure TDMVentasGas.QMTanqueAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMVentasGas.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;
  with QMVentasGas do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
  SerieChange(Serie);
end;

procedure TDMVentasGas.SerieChange(SerieVar: string);
begin
  with xSeries do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := SerieVar;
     Open;
  end;
end;

procedure TDMVentasGas.QMVentasGasNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
  Resultado : integer;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT ID_VENTA FROM GES_GAS_CAB_VENTA WHERE ESTADO = 1';
     ExecQuery;
     Resultado := FieldByName['ID_VENTA'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (Resultado = 0) then
  begin
     QMVentasGasEMPRESA.Value := REntorno.Empresa;
     QMVentasGasEJERCICIO.Value := REntorno.Ejercicio;
     QMVentasGasCANAL.Value := REntorno.Canal;
     QMVentasGasSERIE.Value := Serie;
     QMVentasGasESTADO.Value := 1;
     QMVentasGasFECHA_INICIO.Value := REntorno.FechaTrab;
     QMVentasGasFECHA_CIERRE.Value := REntorno.FechaTrab;
     QMVentasGasENTRADA.Value := REntorno.Entrada;
  end
  else
  begin
     MessageDlg(_('Ya existe una venta abierta'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMVentasGasBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMVentasGasRIG.AsInteger = 0)) then
  begin
     QMVentasGasRIG.AsInteger := DMMain.Contador_EECS(Serie, 'ZGR');
     QMVentasGasID_VENTA.AsInteger := DMMain.Contador_E('ZGP');

     if (ExisteFecha(QMVentasGasFECHA_INICIO.AsDateTime, QMVentasGasID_VENTA.AsInteger) <> 0) then
     begin
        MessageDlg(_('Ya existe venta con esta fecha de inicio.'), mtWarning, [mbOK], 0);
        Abort;
     end;
  end;
  QMVentasGasENTRADA.AsInteger := REntorno.Entrada;
end;

function TDMVentasGas.ExisteFecha(Fecha: TDateTime; id_venta: integer): integer;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  if (fecha <> 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_VENTA FROM GES_GAS_CAB_VENTA WHERE FECHA_INICIO = ?FECHA AND ID_VENTA <> ?ID_VENTA';
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Params.ByName['ID_VENTA'].AsInteger := id_venta;
        ExecQuery;
        Result := FieldByName['ID_VENTA'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMVentasGas.QMTanqueDescTanqueGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTanque do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMTanqueEMPRESA.AsInteger;
     Params.ByName['COD_TANQUE'].AsInteger := QMTanqueCOD_TANQUE.AsInteger;
     Open;
  end;

  Text := xTanqueTITULO.AsString;
end;

procedure TDMVentasGas.QMTanqueCapacidadGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTanque do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMTanqueEMPRESA.AsInteger;
     Params.ByName['COD_TANQUE'].AsInteger := QMTanqueCOD_TANQUE.AsInteger;
     Open;
  end;

  Text := xTanqueCAPACIDAD.AsString;
end;

procedure TDMVentasGas.QMVentasGasAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMTanque.Open;
  QMEmpleado.Open;
  xEstados.Open;
end;

procedure TDMVentasGas.QMVentasGasBeforeClose(DataSet: TDataSet);
begin
  xInfoActualizada.Close;
  QMTanque.Close;
  QMEmpleado.Close;
  xEstados.Close;
end;

procedure TDMVentasGas.CrearNuevaVenta;
var
  Q : THYFIBQuery;
begin
  if ((QMVentasGasESTADO.AsInteger = 1) and (QMVentasGasID_VENTA_D.AsInteger = 0)) then
  begin
     if (QMVentasGasFECHA_CIERRE.AsDateTime = 0) then
     begin
        MessageDlg(_('Falta informar la fecha de Cierre.'), mtWarning, [mbOK], 0);
        Abort;
     end;

     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('EXECUTE PROCEDURE Z_C_CREA_NUEVA_VENTA_GAS ');
           SQL.Add('(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ID_VENTA_O, ?FECHA_CIERRE_O, ?TURNO_O, ?ESTADO_O)');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['ID_VENTA_O'].AsInteger := QMVentasGasID_VENTA.AsInteger;
           Params.ByName['FECHA_CIERRE_O'].AsDateTime := QMVentasGasFECHA_CIERRE.AsDateTime;
           Params.ByName['TURNO_O'].AsString := QMVentasGasTURNO.AsString;
           Params.ByName['ESTADO_O'].AsInteger := QMVentasGasESTADO.AsInteger;
           ExecQuery;
           // ID_VENTA_D := FieldByName['ID_VENTA_D'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     with QMVentasGas do
     begin
        Close;
        Open;
     end;
     ShowMessage(_('La nueva venta se ha creado correctamente.'));
  end
  else
  begin
     MessageDlg(_('No se puede crear otra venta hasta cerrar la anterior.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMEmpleadoDescEmpleadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEmpleado(QMEmpleadoEMPLEADO.AsInteger);
end;

procedure TDMVentasGas.QMDispensadorDescDispensadorGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xDispensador do
  begin
     Close;
     Params.ByName['COD_DISPENSADOR'].AsInteger := QMDispensadorCOD_DISPENSADOR.AsInteger;
     Open;
  end;

  Text := xDispensadorTITULO.AsString;
end;

procedure TDMVentasGas.QMFPagoDescFPagoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloFormaPago(QMFPagoFORMA_PAGO.AsString);
end;

procedure TDMVentasGas.QMVentasGasDescEstadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {DataSource
  with xEstados do
  begin
     Close;
     Params.ByName['ESTADO'].AsInteger := QMVentasGasESTADO.AsInteger;
     Open;
  end;
  }
  Text := xEstadosTITULO.AsString;
end;

procedure TDMVentasGas.QMVentasGasBeforeDelete(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (QMVentasGasESTADO.AsInteger = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('EXECUTE PROCEDURE Z_C_ELIMINA_VENTA_GAS ');
           SQL.Add('(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ID_VENTA, ?ID_VENTA_O) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['ID_VENTA'].AsInteger := QMVentasGasID_VENTA.AsInteger;
           Params.ByName['ID_VENTA_O'].AsInteger := QMVentasGasID_VENTA_O.AsInteger;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  if ((QMVentasGasESTADO.AsInteger = 2) and (QMVentasGasID_VENTA_D.AsInteger <> 0)) then
  begin
     MessageDlg(_('Se debe eliminar la venta destino'), mtWarning, [mbOK], 0);
     Abort;
  end;

  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La venta está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.CerrarVenta(FechaCierre, FechaInicio: TDateTime; Turno: string; IdVenta, Origen: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE Z_C_CERRAR_VENTA_GAS ');
        SQL.Add('(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ID_VENTA, ?ID_VENTA_D, ?ENTRADA, ');
        SQL.Add('?FECHA_CIERRE, ?FECHA_INICIO, ?ESTADO, ?TURNO, ?ID_VENTA_O, ?ORIGEN) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ID_VENTA'].AsInteger := QMVentasGasID_VENTA.AsInteger;
        Params.ByName['ID_VENTA_D'].AsInteger := QMVentasGasID_VENTA_D.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := QMVentasGasENTRADA.AsInteger;
        Params.ByName['FECHA_CIERRE'].AsDateTime := FechaCierre;
        Params.ByName['FECHA_INICIO'].AsDateTime := FechaInicio;
        Params.ByName['ESTADO'].AsInteger := QMVentasGasESTADO.AsInteger;
        Params.ByName['TURNO'].AsString := Turno;
        Params.ByName['ID_VENTA_O'].AsInteger := IdVenta;
        Params.ByName['ORIGEN'].AsInteger := Origen;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Reutilizo variable IdVenta para guardar la posicion y refrescar datos.
  IdVenta := QMVentasGasID_VENTA.AsInteger;
  with QMVentasGas do
  begin
     DisableControls;
     try
        Close;
        Open;
        while ((IdVenta <> QMVentasGasID_VENTA.AsInteger) and (not EOF)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMVentasGas.QMVentasGasBeforeEdit(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger > 2) then
  begin
     MessageDlg(_('La venta no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMTanqueBeforeEdit(DataSet: TDataSet);
begin
  if ((QMVentasGasESTADO.AsInteger > 2) and (QMVentasGasID_VENTA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La venta no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMEmpleadoBeforeEdit(DataSet: TDataSet);
begin
  if ((QMVentasGasESTADO.AsInteger > 2) and (QMVentasGasID_VENTA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La venta no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMDispensadorBeforeEdit(DataSet: TDataSet);
begin
  if ((QMVentasGasESTADO.AsInteger > 2) and (QMVentasGasID_VENTA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La venta no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMFPagoBeforeEdit(DataSet: TDataSet);
begin
  if ((QMVentasGasESTADO.AsInteger > 2) and (QMVentasGasID_VENTA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La venta no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMMonedasBeforeEdit(DataSet: TDataSet);
begin
  if ((QMVentasGasESTADO.AsInteger > 2) and (QMVentasGasID_VENTA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La venta no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMTanqueBeforeInsert(DataSet: TDataSet);
begin
  // if ((QMVentasGasESTADO.AsInteger == 2) and (QMVentasGasID_VENTA_O.AsInteger <> 0)) then
  // begin
  //    MessageDlg(_('No se pueden añadir datos.'), mtWarning, [mbOK], 0);
  //    Abort;
  // end;
end;

procedure TDMVentasGas.QMEmpleadoBeforeInsert(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('No se pueden añadir datos.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMDispensadorBeforeInsert(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('No se pueden añadir datos.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMFPagoBeforeInsert(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('No se pueden añadir datos.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMMonedasBeforeInsert(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('No se pueden añadir datos.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMVentasGasAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMVentasGas.AbrirVenta;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE Z_C_ABRIR_VENTA_GAS ');
        SQL.Add('(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ID_VENTA, ?RIG_MOV) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ID_VENTA'].AsInteger := QMVentasGasID_VENTA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMVentasGas.Refresh;
end;

procedure TDMVentasGas.QMMonedasDescMonedaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTipoMoneda do
  begin
     Close;
     Params.ByName['COD_MONEDA'].AsInteger := QMMonedasCOD_MONEDA.AsInteger;
     Open;
  end;

  Text := xTipoMonedaDESCRIPCION.AsString;
end;

procedure TDMVentasGas.QMMonedasValorGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTipoMoneda do
  begin
     Close;
     Params.ByName['COD_MONEDA'].AsInteger := QMMonedasCOD_MONEDA.AsInteger;
     Open;
  end;

  Text := xTipoMonedaVALOR.AsString;
end;

procedure TDMVentasGas.QMTanqueBeforeDelete(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La venta está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMEmpleadoBeforeDelete(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La venta está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMDispensadorBeforeDelete(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La venta está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMFPagoBeforeDelete(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La venta está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMMonedasBeforeDelete(DataSet: TDataSet);
begin
  if (QMVentasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La venta está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMVentasGas.QMMonedasTOTALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := IntToStr(xTipoMonedaVALOR.AsInteger * QMMonedasCANTIDAD.AsInteger);
end;

procedure TDMVentasGas.RefrescaEmpleado(DataSet: TDataSet = nil);
var
  DS : TDataSource;
  Linea : integer;
begin
  /// Refresca el empleado para que actualice los totales sin mover el DataSet asociado

  if (DataSet <> nil) then
  begin
     with TFIBTableSet(DataSet) do
     begin
        DisableControls;
        try
           // Guardo la posicion
           Linea := FieldByName('LINEA').AsInteger;
           // Primero quito la relacion para que no mueva el registro en el que estoy.
           DS := DataSource;
           DataSource := nil;

           QMEmpleado.Refresh;

           // Vuelvo a conectar y reposiciono
           DataSource := DS;
           Open;
           while ((Linea <> FieldByName('LINEA').AsInteger) and (not EOF)) do
              Next;

           // Si No pude ubicar la linea, puede ser que esté borrando.
           // En ese caso me posiciono en la siguiente, si es posible.
           if ((Linea <> FieldByName('LINEA').AsInteger) and (EOF)) then
           begin
              First;
              while ((Linea < FieldByName('LINEA').AsInteger) and (not EOF)) do
                 Next;
           end;
        finally
           EnableControls
        end;
     end;
  end
  else
     QMEmpleado.Refresh;
end;

procedure TDMVentasGas.QMDispensadorAfterPost(DataSet: TDataSet);
begin
  InfoActualizada;
  RefrescaEmpleado(DataSet);
end;

procedure TDMVentasGas.QMFPagoAfterPost(DataSet: TDataSet);
begin
  InfoActualizada;
  RefrescaEmpleado(DataSet);
end;

procedure TDMVentasGas.QMMonedasAfterPost(DataSet: TDataSet);
begin
  InfoActualizada;
  RefrescaEmpleado(DataSet);
end;

procedure TDMVentasGas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMVentasGas.InfoActualizada;
begin
  with xInfoActualizada do
  begin
     Close;
     Open;
  end;
end;

function TDMVentasGas.DameTituloTurno(Turno: string): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM PRO_TURNOS WHERE TURNO=?TURNO';
        Params.ByName['TURNO'].AsString := Turno;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMVentasGas.QMVentasGasFECHA_INICIOChange(Sender: TField);
begin
  QMVentasGasFECHA_CIERRE.Value := QMVentasGasFECHA_INICIO.Value;
end;

procedure TDMVentasGas.QMDispensadorAfterDelete(DataSet: TDataSet);
begin
  InfoActualizada;
  RefrescaEmpleado(DataSet);
end;

procedure TDMVentasGas.QMFPagoAfterDelete(DataSet: TDataSet);
begin
  InfoActualizada;
  RefrescaEmpleado(DataSet);
end;

procedure TDMVentasGas.QMMonedasAfterDelete(DataSet: TDataSet);
begin
  InfoActualizada;
  RefrescaEmpleado(DataSet);
end;

procedure TDMVentasGas.QMTanqueCOD_TANQUEValidate(Sender: TField);
begin
  QMTanque.FieldByName('UNID_DESCARGA_TANQ').AsFloat := DameDescarga(QMTanque.FieldByName('COD_TANQUE').AsInteger, QMVentasGas.FieldByName('TURNO').AsString, QMVentasGas.FieldByName('FECHA_INICIO').AsDateTime);
end;

function TDMVentasGas.DameDescarga(Tanque: integer; Turno: string; Fecha: TDateTime): double;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT SUM(D.UNID_CARGA) FROM GES_GAS_DET_DESC_TANQUE D ');
        SQL.Add(' INNER JOIN GES_GAS_CAB_DESCARGA C ');
        SQL.Add(' ON D.ID_DESCARGA = C.ID_DESCARGA ');
        SQL.Add(' WHERE ');
        // Habría que poner EMPRESA, EJERCICIO, CANAL, SERIE
        SQL.Add(' C.SERIE = :SERIE AND ');
        SQL.Add(' CAST(EXTRACT(DAY FROM C.FECHA_INICIO)||''.''|| EXTRACT(MONTH FROM C.FECHA_INICIO)||''.''|| EXTRACT(YEAR FROM C.FECHA_INICIO) AS DATE) = :FECHA_INICIO AND ');
        SQL.Add(' D.COD_TANQUE = :COD_TANQUE ');
        // Falta poner TURNO
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['FECHA_INICIO'].AsDateTime := Fecha;
        // ???
        // Params.ByName['TURNO'].AsString := Turno;
        // ???
        Params.ByName['COD_TANQUE'].AsInteger := Tanque;
        ExecQuery;
        Result := Abs(FieldByName['SUM'].AsFloat);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
