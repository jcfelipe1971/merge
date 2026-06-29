unit UDMDescargasGas;

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
  TDMDescargasGas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSxInfoActualizada: TDataSource;
     xInfoActualizada: TFIBDataSetRO;
     DSxSeries: TDataSource;
     xSeries: TFIBDataSetRO;
     QMDescargasGas: TFIBTableSet;
     DSQMDescargasGas: TDataSource;
     QMTanque: TFIBTableSet;
     DSQMTanque: TDataSource;
     QMDispensador: TFIBTableSet;
     DSQMDispensador: TDataSource;
     DSxTanque: TDataSource;
     xTanque: TFIBDataSetRO;
     xTanqueTITULO: TFIBStringField;
     xTanqueCAPACIDAD: TFloatField;
     xTanqueALMACEN: TFIBStringField;
     DSxEstados: TDataSource;
     xEstados: TFIBDataSetRO;
     xEstadosESTADO: TIntegerField;
     xEstadosTITULO: TFIBStringField;
     DSxDispensador: TDataSource;
     xDispensador: TFIBDataSetRO;
     xDispensadorCOD_DISPENSADOR: TIntegerField;
     xDispensadorTITULO: TFIBStringField;
     xDispensadorESTADO: TIntegerField;
     xDispensadorNOTAS: TBlobField;
     QMDescargasGasEMPRESA: TIntegerField;
     QMDescargasGasEJERCICIO: TIntegerField;
     QMDescargasGasCANAL: TIntegerField;
     QMDescargasGasSERIE: TFIBStringField;
     QMDescargasGasRIG: TIntegerField;
     QMDescargasGasID_DESCARGA: TIntegerField;
     QMDescargasGasFECHA_INICIO: TDateTimeField;
     QMDescargasGasFECHA_CIERRE: TDateTimeField;
     QMDescargasGasTIEMPO_DESCARGA: TFloatField;
     QMDescargasGasORDEN_COMPRA: TIntegerField;
     QMDescargasGasCOLA_CAMION: TIntegerField;
     QMDescargasGasTURNO: TFIBStringField;
     QMDescargasGasPRECIO: TFloatField;
     QMDescargasGasPRESION: TFloatField;
     QMDescargasGasTEMPERATURA: TFloatField;
     QMDescargasGasALBARAN_CONDUCE: TFloatField;
     QMDescargasGasNOTAS: TBlobField;
     QMDescargasGasID_DESCARGA_O: TIntegerField;
     QMDescargasGasID_DESCARGA_D: TIntegerField;
     QMDescargasGasENTRADA: TIntegerField;
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
     xInfoActualizadaEMPRESA: TIntegerField;
     xInfoActualizadaEJERCICIO: TIntegerField;
     xInfoActualizadaCANAL: TIntegerField;
     xInfoActualizadaSERIE: TFIBStringField;
     xInfoActualizadaRIG: TIntegerField;
     xInfoActualizadaID_DESCARGA: TIntegerField;
     xInfoActualizadaFECHA_INICIO: TDateTimeField;
     xInfoActualizadaFECHA_CIERRE: TDateTimeField;
     xInfoActualizadaTIEMPO_DESCARGA: TFloatField;
     xInfoActualizadaORDEN_COMPRA: TIntegerField;
     xInfoActualizadaCOLA_CAMION: TIntegerField;
     xInfoActualizadaTURNO: TFIBStringField;
     xInfoActualizadaPRECIO: TFloatField;
     xInfoActualizadaPRESION: TFloatField;
     xInfoActualizadaTEMPERATURA: TFloatField;
     xInfoActualizadaALBARAN_CONDUCE: TFloatField;
     xInfoActualizadaNOTAS: TBlobField;
     xInfoActualizadaID_DESCARGA_O: TIntegerField;
     xInfoActualizadaID_DESCARGA_D: TIntegerField;
     xInfoActualizadaENTRADA: TIntegerField;
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
     QMDescargasGasESTADO: TIntegerField;
     QMDescargasGasORDEN: TIntegerField;
     QMDescargasGasDescEstado: TStringField;
     QMTanqueCapacidad: TStringField;
     QMTanqueDescTanque: TStringField;
     QMDispensadorDescDispensador: TStringField;
     QMDescargasGasDescTurno: TStringField;
     QMDescargasGasDESCARGA_FAC: TFloatField;
     QMDescargasGasNUMERO_FAC: TFIBStringField;
     DSxInfoSumTanque: TDataSource;
     xInfoSumTanque: TFIBDataSetRO;
     xInfoSumTanqueTOTAL_UNID: TFloatField;
     xInfoSumTanqueDIFERENCIA: TFloatField;
     QMDescargasGasRIC: TIntegerField;
     QMDescargasGasPROVEDOR: TIntegerField;
     QMDescargasGasALBARAN_NUM: TIntegerField;
     QMDescargasGasPRESION_ANTE_DESC_COLA: TFloatField;
     QMDescargasGasPRESION_FINAL_DESC_COLA: TFloatField;
     QMDescargasGasTEMPERATURA_INICIAL_COLA: TFloatField;
     QMDescargasGasTEMPERATURA_FINAL_COLA: TFloatField;
     QMDescargasGasFECHA_SALIDA_TERMINAL: TDateTimeField;
     QMDescargasGasFECHA_LLEGADA_SUCURSAL: TDateTimeField;
     QMDescargasGasROTO_GAUGE: TFloatField;
     QMDescargasGasNUM_CABEZOTE: TFIBStringField;
     QMDescargasGasCOD_CAMION: TIntegerField;
     QMDescargasGasCHOFER_COLA: TFIBStringField;
     QMDescargasGasDENSIDAD: TFloatField;
     QMDescargasGasGLS_REC_TEMP_AMBIENTE: TFloatField;
     QMDescargasGasMETODO_DESCARGA: TFIBStringField;
     QMDescargasGasRECIBIDO: TFIBStringField;
     QMTanquePRESION_INICIAL: TFloatField;
     QMTanquePRESION_FINAL: TFloatField;
     QMTanqueTEMPERATURA_INICIAL: TFloatField;
     QMTanqueTEMPERATURA_FINAL: TFloatField;
     QMDescargasGasCAPACIDAD_COLA: TFloatField;
     DSxInfoSumDispensador: TDataSource;
     xInfoSumDispensador: TFIBDataSetRO;
     xInfoSumDispensadorTOTAL_UNID: TFloatField;
     xInfoSumTanqueRECIBIDOS_SUMINISTRADOS: TFloatField;
     QMDescargasGasID_DOC: TIntegerField;
     QMDescargasGasROTOGATE: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMTanqueNewRecord(DataSet: TDataSet);
     procedure QMDispensadoresNewRecord(DataSet: TDataSet);
     procedure QMTanqueAfterPost(DataSet: TDataSet);
     procedure QMDescargasGasNewRecord(DataSet: TDataSet);
     procedure QMDescargasGasBeforePost(DataSet: TDataSet);
     procedure QMTanqueDescTanqueGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTanqueCapacidadGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDescargasGasAfterOpen(DataSet: TDataSet);
     procedure QMDispensadorDescDispensadorGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDescargasGasDescEstadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDescargasGasBeforeDelete(DataSet: TDataSet);
     procedure QMDescargasGasBeforeEdit(DataSet: TDataSet);
     procedure QMTanqueBeforeEdit(DataSet: TDataSet);
     procedure QMDispensadoresBeforeEdit(DataSet: TDataSet);
     procedure QMDispensadorBeforeEdit(DataSet: TDataSet);
     procedure QMTanqueBeforeInsert(DataSet: TDataSet);
     procedure QMDispensadoresBeforeInsert(DataSet: TDataSet);
     procedure QMDescargasGasAfterPost(DataSet: TDataSet);
     procedure QMTanqueBeforeDelete(DataSet: TDataSet);
     procedure QMDispensadoresBeforeDelete(DataSet: TDataSet);
     procedure QMDispensadorBeforeDelete(DataSet: TDataSet);
     procedure QMDispensadorAfterPost(DataSet: TDataSet);
     procedure QMDescargasGasDescTurnoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xInfoSumTanqueDIFERENCIAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDescargasGasBeforeClose(DataSet: TDataSet);
     procedure QMDescargasGasCAPACIDAD_COLAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDescargasGasFECHA_INICIOChange(Sender: TField);
     procedure xInfoSumTanqueRECIBIDOS_SUMINISTRADOSGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDescargasGasFECHA_CIERREChange(Sender: TField);
     procedure QMDescargasGasTIEMPO_DESCARGAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDescargasGasID_DOCGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     SQLFind: string;
     Serie: string;
     procedure SerieChange(SerieVar: string);
     procedure CalculaHorasCola;
  public
     function BusquedaCompleja: integer;
     procedure CambiaSerie(SerieVar: string);
     procedure CrearNuevaDescarga;
     procedure CerrarDescarga(FechaCierre, HoraCierre, FechaInicio, HoraInicio, Turno, IDDescarga: string);
     procedure AbrirDescarga;
     function ExisteFecha(fecha: TDateTime; id_descarga: integer): integer;
     procedure InfoActualizada;
     procedure TraspasaAlbaran;
     function DameCapacidadCola(CodCamion: integer): double;
     function DameTituloCola(CodCamion: integer): string;
  end;

var
  DMDescargasGas : TDMDescargasGas;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, UFMain, UFParada, FIB, DateUtils, UDameDato;

{$R *.dfm}

procedure TDMDescargasGas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDescargasGasPRECIO.DisplayFormat := MascaraN;
  //xInfoActualizadaTOT_INI_TANQUE.DisplayFormat := MascaraN;
  //xInfoActualizadaTOT_FIN_TANQUE.DisplayFormat := MascaraN;
  //xInfoActualizadaTOT_INI_DISP.DisplayFormat := MascaraN;
  //xInfoActualizadaTOT_FIN_DISP.DisplayFormat := MascaraN;
  //xInfoActualizadaTOTAL_COBRADO.DisplayFormat := MascaraN;
  //xInfoActualizadaTOT_DIF_TANQUE.DisplayFormat := MascaraN;
  //xInfoActualizadaTOT_DIF_DISP.DisplayFormat := MascaraN;
  //xInfoActualizadaIMPORTE_DIF_TANQUE.DisplayFormat := MascaraN;
  //xInfoActualizadaIMPORTE_DIF_DISP.DisplayFormat := MascaraN;
  //xInfoActualizadaDIF_COB_TANQUE.DisplayFormat := MascaraN;
  //xInfoActualizadaDIF_TANQUES_DISPENSADORES.DisplayFormat := MascaraN;
  //xInfoActualizadaDIF_IMPORTE_TANQ_DISP.DisplayFormat := MascaraN;
  QMTanquePOR_INICIAL.DisplayFormat := MascaraP;
  QMTanquePOR_FINAL.DisplayFormat := MascaraP;
  QMTanqueCAP_INICIAL.DisplayFormat := MascaraN;
  QMTanqueCAP_FINAL.DisplayFormat := MascaraN;
  QMTanqueUNID_CARGA.DisplayFormat := MascaraN;
  QMTanquePRECIO.DisplayFormat := MascaraN;
  QMTanqueIMPORTE_TOTAL.DisplayFormat := MascaraN;
  QMDispensadorUNID_DISPENSADAS.DisplayFormat := MascaraN;
  QMDispensadorLECTURA_INICIAL.DisplayFormat := MascaraN;
  QMDispensadorLECTURA_FINAL.DisplayFormat := MascaraN;
  //QMDispensadorPRECIO.DisplayFormat := MascaraN;
  //QMDispensadorIMPORTE_TOTAL.DisplayFormat := MascaraN;
  xInfoSumTanqueDIFERENCIA.DisplayFormat := MascaraN;
  xInfoSumTanqueTOTAL_UNID.DisplayFormat := MascaraN;
  xInfoSumTanqueRECIBIDOS_SUMINISTRADOS.DisplayFormat := MascaraN;
  xInfoSumDispensadorTOTAL_UNID.DisplayFormat := MascaraN;
  QMDescargasGasTIEMPO_DESCARGA.DisplayFormat := MascaraN;
  DMMain.FiltraTabla(QMDescargasGas, '11100', False);
  SQLFind := QMDescargasGas.SelectSQL.Text;
  Serie := REntorno.Serie;
end;

function TDMDescargasGas.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMDescargasGas, '11100', True, Serie);
  if (Result = mrAll) then
  begin
     QMDescargasGas.Close;
     QMDescargasGas.SelectSQL.Text := SQLFind;
     DMMain.FiltraTabla(QMDescargasGas, '11100', False);
     CambiaSerie(Serie);
  end;
end;

procedure TDMDescargasGas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  InfoActualizada;
end;

procedure TDMDescargasGas.QMTanqueNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Es mira com esta l'estat
  if (QMDescargasGasESTADO.AsInteger = 1) then
  begin
     QMTanqueEMPRESA.AsInteger := QMDescargasGasEMPRESA.AsInteger;
     QMTanqueEJERCICIO.AsInteger := QMDescargasGasEJERCICIO.AsInteger;
     QMTanqueCANAL.AsInteger := QMDescargasGasCANAL.AsInteger;
     QMTanqueSERIE.AsString := QMDescargasGasSERIE.AsString;
     QMTanqueRIG.AsInteger := QMDescargasGasRIG.AsInteger;
     QMTanqueID_DESCARGA.AsInteger := QMDescargasGasID_DESCARGA.AsInteger;

     QMTanquePOR_INICIAL.AsInteger := 0;
     QMTanquePOR_FINAL.AsInteger := 0;
     QMTanqueCAP_INICIAL.AsInteger := 0;
     QMTanqueCAP_FINAL.AsInteger := 0;
     QMTanqueUNID_CARGA.AsInteger := 0;
     QMTanquePRECIO.AsInteger := 0;

     // nº de linea
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM GES_GAS_DET_DESC_TANQUE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA=?EMPRESA AND ');
           SQL.Add(' EJERCICIO=?EJERCICIO AND ');
           SQL.Add(' CANAL=?CANAL AND ');
           SQL.Add(' SERIE=?SERIE AND ');
           SQL.Add(' ID_DESCARGA=?ID_DESCARGA ');
           Params.ByName['EMPRESA'].AsInteger := QMTanqueEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMTanqueEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMTanqueCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMTanqueSERIE.AsString;
           Params.ByName['ID_DESCARGA'].AsInteger := QMTanqueID_DESCARGA.AsInteger;
           ExecQuery;
           QMTanqueLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end
  else
     ShowMessage(_('No se pueden añadir datos.'));
end;

procedure TDMDescargasGas.QMDispensadoresNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMDispensadorEMPRESA.AsInteger := QMDescargasGasEMPRESA.AsInteger;
  QMDispensadorEJERCICIO.AsInteger := QMDescargasGasEJERCICIO.AsInteger;
  QMDispensadorCANAL.AsInteger := QMDescargasGasCANAL.AsInteger;
  QMDispensadorSERIE.AsString := QMDescargasGasSERIE.AsString;

  QMDispensadorID_DESCARGA.AsInteger := QMDescargasGasID_DESCARGA.AsInteger;
  QMDispensadorRIG.AsInteger := QMDescargasGasRIG.AsInteger;

  // nº de linea
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA) FROM GES_GAS_DET_DESC_DISP ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO AND ');
        SQL.Add(' CANAL=?CANAL AND ');
        SQL.Add(' SERIE=?SERIE AND ');
        SQL.Add(' ID_DESCARGA=?ID_DESCARGA ');
        Params.ByName['EMPRESA'].AsInteger := QMDispensadorEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDispensadorEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDispensadorCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMDispensadorSERIE.AsString;
        Params.ByName['ID_DESCARGA'].AsInteger := QMDispensadorID_DESCARGA.AsInteger;
        ExecQuery;
        QMDispensadorLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMDescargasGas.QMTanqueAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  // QMDescargasGas.Refresh;
end;

procedure TDMDescargasGas.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;
  with QMDescargasGas do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
  SerieChange(Serie);
end;

procedure TDMDescargasGas.SerieChange(SerieVar: string);
begin
  with xSeries do
  begin
     Close;
     Params.ByName['SERIE'].AsString := SerieVar;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMDescargasGas.QMDescargasGasNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
  Resultado : integer;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT ID_DESCARGA FROM GES_GAS_CAB_DESCARGA WHERE ESTADO=1';
     ExecQuery;
     Resultado := FieldByName['ID_DESCARGA'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (Resultado = 0) then
  begin
     QMDescargasGasEMPRESA.Value := REntorno.Empresa;
     QMDescargasGasEJERCICIO.Value := REntorno.Ejercicio;
     QMDescargasGasCANAL.Value := REntorno.Canal;
     QMDescargasGasSERIE.Value := Serie;
     QMDescargasGasESTADO.Value := 1;
     QMDescargasGasENTRADA.Value := REntorno.Entrada;
     QMDescargasGasFECHA_INICIO.Value := REntorno.FechaTrab;
     QMDescargasGasFECHA_CIERRE.Value := 0;
  end
  else
  begin
     MessageDlg(_('Ya existe una descarga abierta'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDescargasGasBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMDescargasGasRIG.AsInteger = 0)) then
  begin
     QMDescargasGasRIG.AsInteger := DMMain.Contador_EECS(Serie, 'ZGD');
  end;
  QMDescargasGasENTRADA.AsInteger := REntorno.Entrada;
end;

function TDMDescargasGas.ExisteFecha(fecha: TDateTime; id_descarga: integer): integer;
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
        SQL.Text := 'SELECT ID_DESCARGA FROM GES_GAS_CAB_DESCARGA WHERE FECHA_INICIO = ?FECHA AND ID_DESCAGA <> ?ID_DESCARGA';
        Params.ByName['FECHA'].AsDateTime := fecha;
        Params.ByName['ID_DESCARGA'].AsInteger := id_descarga;
        ExecQuery;
        Result := FieldByName['ID_DESCARGA'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMDescargasGas.QMTanqueDescTanqueGetText(Sender: TField; var Text: string; DisplayText: boolean);
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

procedure TDMDescargasGas.QMTanqueCapacidadGetText(Sender: TField; var Text: string; DisplayText: boolean);
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

procedure TDMDescargasGas.QMDescargasGasAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMTanque.Open;
  QMDispensador.Open;
  xInfoSumTanque.Open;
  xInfoSumDispensador.Open;
end;

procedure TDMDescargasGas.CrearNuevaDescarga;
var
  Q : THYFIBQuery;
  // ID_DESCARGA_D : integer;
begin
  if ((QMDescargasGasESTADO.AsInteger = 1) and (QMDescargasGasID_DESCARGA_D.AsInteger = 0)) then
  begin
     if (QMDescargasGasFECHA_CIERRE.AsDateTime = 0) then
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
           SQL.Text := 'EXECUTE PROCEDURE Z_C_CREA_NUEVA_VENTA_GAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ID_VENTA_O, :FECHA_CIERRE_O, :TURNO_O, :ESTADO_O)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['ID_DESCARGA_O'].AsInteger := QMDescargasGasID_DESCARGA.AsInteger;
           Params.ByName['FECHA_CIERRE_O'].AsDateTime := QMDescargasGasFECHA_CIERRE.AsDateTime;
           Params.ByName['TURNO_O'].AsString := QMDescargasGasTURNO.AsString;
           Params.ByName['ESTADO_O'].AsInteger := QMDescargasGasESTADO.AsInteger;
           ExecQuery;
           // ID_DESCARGA_D := FieldByName['ID_DESCARGA_D'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     with QMDescargasGas do
     begin
        Close;
        Open;
     end;
     ShowMessage(_('La nueva descarga se ha creado correctamente.'));
  end
  else
  begin
     MessageDlg(_('No se puede crear otra descarga hasta cerrar la anterior.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDispensadorDescDispensadorGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xDispensador do
  begin
     Close;
     Params.ByName['DISPENSADOR'].AsInteger := QMDispensadorCOD_DISP.AsInteger;
     Open;
  end;

  Text := xDispensadorTITULO.AsString;
end;

procedure TDMDescargasGas.QMDescargasGasDescEstadoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xEstados do
  begin
     Close;
     Params.ByName['ESTADO'].AsInteger := QMDescargasGasESTADO.AsInteger;
     Open;
  end;

  Text := xEstadosTITULO.AsString;
end;

procedure TDMDescargasGas.QMDescargasGasBeforeDelete(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (QMDescargasGasESTADO.AsInteger = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE Z_C_ELIMINA_VENTA_GAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ID_VENTA, :ID_VENTA_O)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['ID_DESCARGA'].AsInteger := QMDescargasGasID_DESCARGA.AsInteger;
           Params.ByName['ID_DESCARGA_O'].AsInteger := QMDescargasGasID_DESCARGA_O.AsInteger;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  if ((QMDescargasGasESTADO.AsInteger = 2) and (QMDescargasGasID_DESCARGA_D.AsInteger <> 0)) then
  begin
     MessageDlg(_('Se debe eliminar la descarga destino'), mtWarning, [mbOK], 0);
     Abort;
  end;

  if (QMDescargasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La descarga está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.CerrarDescarga(FechaCierre, HoraCierre, FechaInicio, HoraInicio, Turno, IdDescarga: string);
var
  FechaCierreComp, FechaInicioComp : TDateTime;
  Q : THYFIBQuery;
begin
  if ((FechaCierre = '') or (FechaInicio = '')) then
  begin
     MessageDlg(_('Falta informar la fecha.'), mtWarning, [mbOK], 0);
     Abort;
  end;

  FechaCierreComp := StrToDateTime(FechaCierre + ' ' + HoraCierre);
  FechaInicioComp := StrToDateTime(FechaInicio + ' ' + HoraInicio);

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_C_CERRAR_VENTA_GAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ID_VENTA, :ID_VENTA_D, :ENTRADA, :FECHA_CIERRE, :FECHA_INICIO, :ESTADO, :TURNO, :ID_VENTA_O)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ID_DESCARGA'].AsInteger := QMDescargasGasID_DESCARGA.AsInteger;
        Params.ByName['ID_DESCARGA_D'].AsInteger := QMDescargasGasID_DESCARGA_D.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := QMDescargasGasENTRADA.AsInteger;
        Params.ByName['FECHA_CIERRE'].AsDateTime := FechaCierreComp;
        Params.ByName['FECHA_INICIO'].AsDateTime := FechaInicioComp;
        Params.ByName['ESTADO'].AsInteger := QMDescargasGasESTADO.AsInteger;
        Params.ByName['TURNO'].AsString := Turno;
        Params.ByName['ID_DESCARGA_O'].AsString := IdDescarga;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  with QMDescargasGas do
  begin
     Close;
     Open;
     Last;
  end;
end;

procedure TDMDescargasGas.QMDescargasGasBeforeEdit(DataSet: TDataSet);
begin
  if (QMDescargasGasESTADO.AsInteger > 2) then
  begin
     MessageDlg(_('La descarga no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMTanqueBeforeEdit(DataSet: TDataSet);
begin
  if ((QMDescargasGasESTADO.AsInteger > 2) and (QMDescargasGasID_DESCARGA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La descarga no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDispensadoresBeforeEdit(DataSet: TDataSet);
begin
  if ((QMDescargasGasESTADO.AsInteger > 1) and (QMDescargasGasID_DESCARGA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La descarga no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDispensadorBeforeEdit(DataSet: TDataSet);
begin
  if ((QMDescargasGasESTADO.AsInteger > 1) and (QMDescargasGasID_DESCARGA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('La descarga no se puede modificar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMTanqueBeforeInsert(DataSet: TDataSet);
begin
  if ((QMDescargasGasESTADO.AsInteger > 2) and (QMDescargasGasID_DESCARGA_O.AsInteger <> 0)) then
  begin
     MessageDlg(_('No se pueden añadir datos.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDispensadoresBeforeInsert(DataSet: TDataSet);
begin
  if (QMDescargasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('No se pueden añadir datos.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDescargasGasAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  {Todo: Despues del post se cierra y se abre a si misma???}
  // QMDescargasGas.Close;
  // QMDescargasGas.Open;
end;

procedure TDMDescargasGas.AbrirDescarga;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_C_ABRIR_VENTA_GAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ID_VENTA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ID_DESCARGA'].AsInteger := QMDescargasGasID_DESCARGA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMDescargasGas.Refresh;
end;

procedure TDMDescargasGas.QMTanqueBeforeDelete(DataSet: TDataSet);
begin
  if (QMDescargasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La descarga está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDispensadoresBeforeDelete(DataSet: TDataSet);
begin
  if (QMDescargasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La descarga está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDispensadorBeforeDelete(DataSet: TDataSet);
begin
  if (QMDescargasGasESTADO.AsInteger = 3) then
  begin
     MessageDlg(_('La descarga está cerrada. No se puede eliminar.'), mtWarning, [mbOK], 0);
     Abort;
  end;
end;

procedure TDMDescargasGas.QMDispensadorAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  DataSet.Refresh;
  InfoActualizada;
end;

procedure TDMDescargasGas.QMDescargasGasDescTurnoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTurno(QMDescargasGasTURNO.AsString);
end;

procedure TDMDescargasGas.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMDescargasGas.InfoActualizada;
begin
  with xInfoActualizada do
  begin
     Close;
     Open;
  end;
  xInfoSumTanque.Close;
  xInfoSumTanque.Open;
  xInfoSumDispensador.Close;
  xInfoSumDispensador.Open;
end;

procedure TDMDescargasGas.xInfoSumTanqueDIFERENCIAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraN, xInfoSumTanqueTOTAL_UNID.AsFloat - QMDescargasGasDESCARGA_FAC.AsFloat);
end;

procedure TDMDescargasGas.TraspasaAlbaran;
var
  id_albaran : integer;
  Q : THYFIBQuery;
begin
  if (QMDescargasGasESTADO.AsInteger <> 3) then
  begin
     // Generamos la cabecera del albarán de compra
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID_E FROM Z_GAS_GENERA_ALBARAN_DESCARGA(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?PROVEEDOR, ?REFERENCIA, ?ENTRADA, ?ALMACEN, ?FECHA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := REntorno.Serie;
           Params.ByName['TIPO'].AsString := 'ALP';
           Params.ByName['PROVEEDOR'].AsInteger := QMDescargasGasPROVEDOR.AsInteger;
           Params.ByName['REFERENCIA'].AsString := _('Compra de Gas');
           Params.ByName['ALMACEN'].AsString := xTanqueALMACEN.AsString;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['FECHA'].AsDateTime := QMDescargasGasFECHA_INICIO.AsDateTime;
           try
              ExecQuery;
              id_albaran := FieldByName['ID_E'].AsInteger;
           except
              on E: Exception do
              begin
                 Application.MessageBox(PChar(string(_('Ha ocurrido un error al generar el albarán'))), PChar(string(_('ATENCION!'))), MB_OK + mb_IconStop);
                 id_albaran := 0;
              end;
           end;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     // Generamos el detalle del albarán de compra
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE WEB_INS_DETALLE_COMPRA(:ID_E, :ID_A, :TITULO, :UNIDADES, :NOTAS, :PRECIO, :DESCUENTO)';
           Params.ByName['ID_E'].AsInteger := id_albaran;
           Params.ByName['ID_A'].AsInteger := 10;
           Params.ByName['TITULO'].AsString := 'GAS';
           Params.ByName['UNIDADES'].AsInteger := QMDescargasGasDESCARGA_FAC.AsInteger;
           Params.ByName['NOTAS'].AsString := '';
           Params.ByName['PRECIO'].AsFloat := QMDescargasGasPRECIO.AsFloat;
           Params.ByName['DESCUENTO'].AsFloat := 0;
           try
              ExecQuery;
           except
              on E: Exception do
              begin
                 Application.MessageBox(PChar(string(_('Ha ocurrido un error al generar el detalle del albarán'))), PChar(string(_('ATENCION!'))), MB_OK + mb_IconStop);
              end;
           end;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     if (id_albaran <> 0) then
     begin
        QMDescargasGas.Edit;
        QMDescargasGasID_DOC.AsInteger := id_albaran;
        QMDescargasGasESTADO.AsInteger := 3;
        QMDescargasGas.Post;
     end;
  end;
end;

procedure TDMDescargasGas.QMDescargasGasBeforeClose(DataSet: TDataSet);
begin
  xInfoActualizada.Close;
  QMTanque.Close;
  QMDispensador.Close;
  xInfoSumTanque.Close;
  xInfoSumDispensador.Close;
end;

function TDMDescargasGas.DameTituloCola(CodCamion: integer): string;
var
  Q : THYFIBQuery;
begin
  Result := '';
  if (CodCamion <> 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_GAS_COLA_CAMION WHERE COD_CAMION = ' + IntToStr(CodCamion);
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMDescargasGas.DameCapacidadCola(CodCamion: integer): double;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  if (CodCamion <> 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CAPACIDAD FROM SYS_GAS_COLA_CAMION WHERE COD_CAMION = ' + IntToStr(CodCamion);
        ExecQuery;
        Result := FieldByName['CAPACIDAD'].AsFloat;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMDescargasGas.QMDescargasGasCAPACIDAD_COLAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraN, DameCapacidadCola(QMDescargasGasCOD_CAMION.AsInteger));
end;

procedure TDMDescargasGas.CalculaHorasCola;
begin
  QMDescargasGasTIEMPO_DESCARGA.AsFloat := QMDescargasGasFECHA_CIERRE.AsDateTime - QMDescargasGasFECHA_INICIO.AsDateTime;
end;

procedure TDMDescargasGas.QMDescargasGasFECHA_INICIOChange(Sender: TField);
begin
  CalculaHorasCola;
end;

procedure TDMDescargasGas.xInfoSumTanqueRECIBIDOS_SUMINISTRADOSGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraN, xInfoSumTanqueTOTAL_UNID.AsFloat + xInfoSumDispensadorTOTAL_UNID.AsFloat);
end;

procedure TDMDescargasGas.QMDescargasGasFECHA_CIERREChange(Sender: TField);
begin
  CalculaHorasCola;
end;

procedure TDMDescargasGas.QMDescargasGasTIEMPO_DESCARGAGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  Horas, Minutos : integer;
begin
  Horas := Round(QMDescargasGasTIEMPO_DESCARGA.AsFloat * 24);
  Minutos := Round((QMDescargasGasTIEMPO_DESCARGA.AsFloat - (Horas / 24)) * 24 * 60);
  Text := Format('%.2d:%.2d', [Horas, Minutos]);
end;

procedure TDMDescargasGas.QMDescargasGasID_DOCGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  Q : THYFIBQuery;
begin
  if (QMDescargasGasID_DOC.AsInteger = 0) then
     Text := ''
  else
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_E';
           Params.ByName['ID_E'].AsInteger := QMDescargasGasID_DOC.AsInteger;
           ExecQuery;
           Text := {FieldByName['CANAL'].AsString + '.' +} FieldByName['TIPO'].AsString + '-' + FieldByName['EJERCICIO'].AsString + '-' + FieldByName['SERIE'].AsString + '/' + FieldByName['RIG'].AsString;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

end.
