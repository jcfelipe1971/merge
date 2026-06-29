unit UDMRecibosDesglose;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Messages, Classes, DB, FIBDataSet, FIBTableDataSet, FIBQuery, HYFIBQuery,
  FIBDatabase, UFIBModificados, FIBDataSetRO, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  Buttons, ActnList, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit,
  ULFDBMemo, ULFLabel, UG2kTBLoc, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker;

type
  TDMRecibosDesglose = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     QMCobros: TFIBTableSet;
     QMAnticipos: TFIBTableSet;
     QMPagos: TFIBTableSet;
     DSCabecera: TDataSource;
     DsCobros: TDataSource;
     DsAnticipos: TDataSource;
     DsPagos: TDataSource;
     QMCobrosEMPRESA: TIntegerField;
     QMCobrosEJERCICIO: TIntegerField;
     QMCobrosCANAL: TIntegerField;
     QMCobrosSIGNO: TFIBStringField;
     QMCobrosREGISTRO: TIntegerField;
     QMCobrosLINEA: TIntegerField;
     QMCobrosVENCIMIENTO: TDateTimeField;
     QMCobrosCTA_PAGO: TFIBStringField;
     QMCobrosLIQUIDO: TFloatField;
     QMCobrosPAGADO: TIntegerField;
     QMCobrosMOD_MANUAL: TIntegerField;
     QMCobrosTIPO_EFECTO: TFIBStringField;
     QMCobrosREMESAR: TIntegerField;
     QMCobrosESTADO: TIntegerField;
     QMCobrosREMESA: TIntegerField;
     QMCobrosBANCO: TIntegerField;
     QMCobrosRIC: TIntegerField;
     QMCobrosIMPAGADO: TIntegerField;
     QMCobrosFECHA_CIERRE: TDateTimeField;
     QMCobrosESTADO_RECIBO: TFIBStringField;
     QMCobrosRECIBIDO: TIntegerField;
     QMCobrosVISIBLE: TIntegerField;
     QMCobrosENTRADA: TIntegerField;
     QMCobrosAGRUPACION: TIntegerField;
     QMCobrosCONFIRMING: TIntegerField;
     QMCobrosANTICIPADO: TFloatField;
     QMCobrosDOCUMENTO: TFIBStringField;
     QMCobrosDOC_AUTOMATICO: TIntegerField;
     QMCobrosEJERCICIO_REMESA: TIntegerField;
     QMCobrosEJERCICIO_AGRUPACION: TIntegerField;
     QMCobrosMONEDA: TFIBStringField;
     QMCobrosLIQUIDO_CANAL: TFloatField;
     QMCobrosCAMBIO: TFloatField;
     QMCobrosRIC_RECIBIDO: TIntegerField;
     QMCobrosFECHA_RECIBIDO: TDateTimeField;
     QMCobrosMONEDA_CANAL: TFIBStringField;
     QMCobrosEJERCICIO_CONFIRMING: TIntegerField;
     QMCobrosFECHA_VALOR: TDateTimeField;
     QMCobrosABONO: TIntegerField;
     QMCobrosEJERCICIO_ABONO: TIntegerField;
     QMCobrosAGRUPACION_GENERAL: TIntegerField;
     QMCobrosBANDERA: TIntegerField;
     QMCobrosID_CARTERA: TIntegerField;
     QMCobrosID_CARTERA_DETALLE: TIntegerField;
     QMCobrosID_REMESAS: TIntegerField;
     QMPagosEMPRESA: TIntegerField;
     QMPagosEJERCICIO: TIntegerField;
     QMPagosCANAL: TIntegerField;
     QMPagosSIGNO: TFIBStringField;
     QMPagosREGISTRO: TIntegerField;
     QMPagosLINEA: TIntegerField;
     QMPagosVENCIMIENTO: TDateTimeField;
     QMPagosCTA_PAGO: TFIBStringField;
     QMPagosLIQUIDO: TFloatField;
     QMPagosPAGADO: TIntegerField;
     QMPagosMOD_MANUAL: TIntegerField;
     QMPagosTIPO_EFECTO: TFIBStringField;
     QMPagosREMESAR: TIntegerField;
     QMPagosESTADO: TIntegerField;
     QMPagosREMESA: TIntegerField;
     QMPagosBANCO: TIntegerField;
     QMPagosRIC: TIntegerField;
     QMPagosIMPAGADO: TIntegerField;
     QMPagosFECHA_CIERRE: TDateTimeField;
     QMPagosESTADO_RECIBO: TFIBStringField;
     QMPagosRECIBIDO: TIntegerField;
     QMPagosVISIBLE: TIntegerField;
     QMPagosENTRADA: TIntegerField;
     QMPagosAGRUPACION: TIntegerField;
     QMPagosCONFIRMING: TIntegerField;
     QMPagosANTICIPADO: TFloatField;
     QMPagosDOCUMENTO: TFIBStringField;
     QMPagosDOC_AUTOMATICO: TIntegerField;
     QMPagosEJERCICIO_REMESA: TIntegerField;
     QMPagosEJERCICIO_AGRUPACION: TIntegerField;
     QMPagosMONEDA: TFIBStringField;
     QMPagosLIQUIDO_CANAL: TFloatField;
     QMPagosCAMBIO: TFloatField;
     QMPagosRIC_RECIBIDO: TIntegerField;
     QMPagosFECHA_RECIBIDO: TDateTimeField;
     QMPagosMONEDA_CANAL: TFIBStringField;
     QMPagosEJERCICIO_CONFIRMING: TIntegerField;
     QMPagosFECHA_VALOR: TDateTimeField;
     QMPagosABONO: TIntegerField;
     QMPagosEJERCICIO_ABONO: TIntegerField;
     QMPagosAGRUPACION_GENERAL: TIntegerField;
     QMPagosBANDERA: TIntegerField;
     QMPagosID_CARTERA: TIntegerField;
     QMPagosID_CARTERA_DETALLE: TIntegerField;
     QMPagosID_REMESAS: TIntegerField;
     xBancos: TFIBDataSetRO;
     xBancosBANCO: TIntegerField;
     xBancosTITULO: TFIBStringField;
     DSxBancos: TDataSource;
     QMCobrosID_CAB_Z_recibos: TIntegerField;
     QMCobrosMARCADO: TIntegerField;
     QMPagosID_CAB_Z_recibos: TIntegerField;
     QMPagosMARCADO: TIntegerField;
     QMCobrosC_Pendientes: TFloatField;
     QMPagosP_Pendientes: TFloatField;
     QMAnticiposEMPRESA: TIntegerField;
     QMAnticiposEJERCICIO: TIntegerField;
     QMAnticiposCANAL: TIntegerField;
     QMAnticiposANTICIPO: TIntegerField;
     QMAnticiposTIPO_TERCERO: TFIBStringField;
     QMAnticiposCOD_CLI_PRO: TIntegerField;
     QMAnticiposCUENTA_CLI_PRO: TFIBStringField;
     QMAnticiposC_CONTRAPARTIDA: TFIBStringField;
     QMAnticiposCANTIDAD: TFloatField;
     QMAnticiposCONTABILIZAR: TIntegerField;
     QMAnticiposREGISTRO: TIntegerField;
     QMAnticiposASIENTO: TIntegerField;
     QMAnticiposFECHA: TDateTimeField;
     QMAnticiposID_CAB_Z_recibos: TIntegerField;
     QMAnticiposMARCADO: TIntegerField;
     QMAnticiposP_anticipos: TFloatField;
     xCuenta: TFIBDataSetRO;
     xCuentaTITULO: TFIBStringField;
     DSxCuenta: TDataSource;
     QMCobrosAbrirCartera: TIntegerField;
     QMPagosAbrir_Cartera: TIntegerField;
     xCuentaCobro: TFIBDataSetRO;
     DSxCuentaCobro: TDataSource;
     QMCobrosZ_MONTO_APLICAR: TFloatField;
     QMCobrosZ_PENDIENTE: TFloatField;
     xDescripcion: TFIBDataSetRO;
     DSxDescripcion: TDataSource;
     xDescripcionTEXTO: TFIBStringField;
     xDescripcionEMPRESA: TIntegerField;
     xDescripcionEJERCICIO: TIntegerField;
     xDescripcionCANAL: TIntegerField;
     xDescripcionID: TIntegerField;
     xTotales: TFIBDataSetRO;
     DSxTotales: TDataSource;
     xTotalesLIQUIDO: TFloatField;
     xCuentaCobroTITULO: TFIBStringField;
     QMCobrosDOC_NUMERO: TIntegerField;
     QMCabeceraID: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraRECIBO: TFIBStringField;
     QMCabeceraBANCO: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraLUGAR: TFIBStringField;
     QMCabeceraIMPORTE: TFloatField;
     QMCabeceraCUENTA: TFIBStringField;
     QMCabeceraCUENTA_COBRO: TFIBStringField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraMONTO_RECIBO: TFloatField;
     QMCabeceraMONTO_TARJETA: TFloatField;
     QMCabeceraMONTO_EFECTIVO: TFloatField;
     QMCabeceraMONTO_CHEQUE: TFloatField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMFacturasDesglose: TFIBTableSet;
     DSFacturasDesglose: TDataSource;
     QMFacturasDesgloseID_REGISTRO: TIntegerField;
     dtmfldQMFacturasDesgloseFECHA: TDateTimeField;
     QMFacturasDesgloseUNIDADES: TFloatField;
     QMFacturasDesglosePRECIO: TFloatField;
     QMFacturasDesgloseBRUTO: TFloatField;
     QMFacturasDesgloseTITULO_IDIOMA: TFIBStringField;
     QMFacturasDesglosePRO_NUM_PLANO: TFIBStringField;
     QMFacturasDesgloseRIG: TIntegerField;
     QMFacturasDesgloseLINEA: TIntegerField;
     QMFacturasDesgloseTITULO: TFIBStringField;
     QMFacturasDesgloseID_RECIBO: TIntegerField;
     QMFacturasDesgloseID_DETALLES_S: TIntegerField;
     TUpdate: THYTransaction;
     QMFacturasDesgloseIMPORTE_DESGLOSE: TFloatField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraNRO_RECIBO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforeOpen(DataSet: TDataSet);
     procedure QMCabeceraBANCOChange(Sender: TField);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCobrosBeforeOpen(DataSet: TDataSet);
     procedure QMCobrosAfterPost(DataSet: TDataSet);
     procedure QMPagosAfterPost(DataSet: TDataSet);
     procedure BeforePostGeneral(DataSet: TDataSet);
     procedure QMCabeceraCUENTAChange(Sender: TField);
     procedure QMCobrosAbrirCarteraChange(Sender: TField);
     procedure QMCabeceraCUENTA_COBROChange(Sender: TField);
     procedure QMCabeceraCLIENTEChange(Sender: TField);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCobrosAfterScroll(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMFacturasDesgloseID_RECIBOChange(Sender: TField);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     MonedaMascara: string;
     //Moneda: string;
     SQLFind: string;
     Serie: string;
     procedure MontaSelectCobros;
     procedure RefrescaTotales;
     procedure CambiaMascara;
     procedure AbreCarteraCobros;
  public
     { Public declarations }
     MascaraMonedaCobro: string;
     NSerie: string;
     // Filtrado, NumSerie: boolean;
     procedure Todos(MontoRecibo: real);
     procedure Marcados(MontoRecibo: real);
     procedure Marcar;
     function DameCuentaCliente: string;
     procedure Abrir;
     procedure UpdateMarcados;
     procedure EliminarMarcados(Motivo: string);
     procedure EliminarRecibo;
     procedure CambiaSerie(SerieVar: string);
     procedure MarcaDesmarca(valor: integer);
  end;

var
  DMRecibosDesglose : TDMRecibosDesglose;

implementation

uses UDMMain, UUtiles, UEntorno, uFBusca, UFMCartera, UFParada, UFMain,
  ZUFMMotivo, UFormGest, UDameDato;

{$R *.dfm}

{Todo : Utilizar TLocal/TUpdate}

procedure TDMRecibosDesglose.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  MonedaMascara := REntorno.Moneda;
  MascaraMonedacobro := DMMain.MascaraMoneda(MonedaMascara, 1);
  // NumSerie := False;

  SQLFind := QMCabecera.SelectSQL.Text;

  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCobros, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMPagos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMAnticipos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTotales, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TDMRecibosDesglose.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMRecibosDesglose.CambiaMascara;
begin
  if (QMCobrosMONEDA.AsString = '') then
     MonedaMascara := REntorno.Moneda;

  if (MonedaMascara <> QMCobrosMONEDA.AsString) then
  begin
     MonedaMascara := QMCobrosMONEDA.AsString;
     MascaraMonedaCobro := DMMain.MascaraMoneda(MonedaMascara, 1);

     QMCabeceraIMPORTE.DisplayFormat := MascaraMonedaCobro;
     QMCabeceraMONTO_RECIBO.DisplayFormat := MascaraMonedaCobro;
     QMCabeceraMONTO_TARJETA.DisplayFormat := MascaraMonedaCobro;
     QMCabeceraMONTO_EFECTIVO.DisplayFormat := MascaraMonedaCobro;
     QMCabeceraMONTO_CHEQUE.DisplayFormat := MascaraMonedaCobro;

     QMCobrosZ_MONTO_APLICAR.DisplayFormat := MascaraMonedaCobro;
     QMCobrosZ_PENDIENTE.DisplayFormat := MascaraMonedaCobro;
     QMCobrosLIQUIDO.DisplayFormat := MascaraMonedaCobro;

     xTotalesLIQUIDO.DisplayFormat := MascaraMonedaCobro;

     QMFacturasDesglosePRECIO.DisplayFormat := MascaraMonedaCobro;
     QMFacturasDesgloseBRUTO.DisplayFormat := MascaraMonedaCobro;
     QMFacturasDesgloseIMPORTE_DESGLOSE.DisplayFormat := MascaraMonedaCobro;
  end;
end;

procedure TDMRecibosDesglose.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMRecibosDesglose.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraFECHA.AsDateTime := Date;
end;

procedure TDMRecibosDesglose.QMCabeceraBeforeOpen(DataSet: TDataSet);
begin
  with QMCabecera do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
  end;
end;

procedure TDMRecibosDesglose.QMCabeceraBANCOChange(Sender: TField);
begin
  xBancos.Close;
  xBancos.Open;
end;

procedure TDMRecibosDesglose.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xDescripcion.Close;
  xDescripcion.Open;
  xBancos.Close;
  xBancos.Open;
  xCuenta.Close;
  xCuenta.Open;
  xCuentaCobro.Close;
  xCuentaCobro.Open;
  QMCobros.Close;
  QMCobros.Open;
  QMFacturasdesglose.Close;
  QMFacturasdesglose.Open;
end;

procedure TDMRecibosDesglose.QMCobrosBeforeOpen(DataSet: TDataSet);
begin
  MontaSelectCobros;
end;

procedure TDMRecibosDesglose.MontaSelectCobros;
begin
  with QMCobros do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM EMP_CARTERA_DETALLE DET ');
     SelectSQL.Add(' JOIN EMP_CARTERA CAB ON (DET.ID_CARTERA=CAB.ID_CARTERA) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' AND (DET.EJERCICIO = ?EJERCICIO OR DET.EJERCICIO <= ?EJERCICIO) ');
     SelectSQL.Add(' AND DET.CANAL = ?CANAL ');
     SelectSQL.Add(' AND DET.SIGNO = ''C'' ');
     SelectSQL.Add(' AND DET.VISIBLE = 1 ');
     SelectSQL.Add(' AND DET.PAGADO <> 1 ');
     SelectSQL.Add(' AND ((DET.MARCADO = 0) OR ((DET.MARCADO = 1) AND (DET.ID_CAB_Z_RECIBOS = ?ID))) ');
     SelectSQL.Add(' AND CAB.COD_CLI_PRO = ?CLIENTE ');
     SelectSQL.Add(' ORDER BY DET.VENCIMIENTO');
  end;

  { TODO : Verificar si esto es necesario }
  // ESTE UPDATE CREO QUE NO ES NECESARIO
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
           SQL.Add(' SET ');
           SQL.Add(' ID_CAB_Z_RECIBOS = ?ID_CAB ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_CARTERA_DETALLE IN (SELECT DET.ID_CARTERA_DETALLE FROM EMP_CARTERA_DETALLE DET ');
           SQL.Add('                        JOIN EMP_CARTERA CAB ON(DET.ID_CARTERA = CAB.ID_CARTERA) ');
           SQL.Add('                        WHERE ');
           SQL.Add('                        DET.EMPRESA = ?EMPRESA ');
           SQL.Add('                        AND DET.EJERCICIO <= ?EJERCICIO ');
           SQL.Add('                        AND DET.CANAL = ?CANAL ');
           SQL.Add('                        AND DET.SIGNO = ?SIGNO ');
           SQL.Add('                        AND DET.VISIBLE = 1 ');
           SQL.Add('                        AND DET.PAGADO <> 1 ');
           SQL.Add('                        AND CAB.COD_CLI_PRO = ?CLIENTE) ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
           Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
           Params.ByName['SIGNO'].AsString := 'C';
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     with QMCobros do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM EMP_CARTERA_DETALLE DET ');
        SelectSQL.Add(' JOIN EMP_CARTERA CAB ON(DET.ID_CARTERA = CAB.ID_CARTERA) ');
        SelectSQL.Add(' WHERE DET.EMPRESA = ?EMPRESA ');
        SelectSQL.Add(' AND DET.EJERCICIO <= ?EJERCICIO ');
        SelectSQL.Add(' AND DET.CANAL = ?CANAL ');
        SelectSQL.Add(' AND DET.VISIBLE = 1 ');
        SelectSQL.Add(' AND DET.MARCADO = 1 ');
        SelectSQL.Add(' AND DET.PAGADO = 1 ');
        SelectSQL.Add(' AND DET.SIGNO = ''C'' ');
        SelectSQL.Add(' AND DET.ID_CAB_Z_RECIBOS = ?ID ');
     end;
  end;
end;

procedure TDMRecibosDesglose.QMCobrosAfterPost(DataSet: TDataSet);
begin
  UpdateMarcados;
  RefrescaTotales;
  QMFacturasDesglose.Close;
  QMFacturasDesglose.Open;
end;

procedure TDMRecibosDesglose.QMPagosAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMRecibosDesglose.BeforePostGeneral(DataSet: TDataSet);
begin
  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end;

  if (DataSet.State = dsEdit) then
  begin
     QMCobrosID_CAB_Z_RECIBOS.AsInteger := QMCabeceraID.AsInteger;
  end;
end;

procedure TDMRecibosDesglose.QMCabeceraCUENTAChange(Sender: TField);
begin
  xCuenta.Close;
  xCuenta.Open;
end;

procedure TDMRecibosDesglose.QMCobrosAbrirCarteraChange(Sender: TField);
begin
  if (QMCobrosAbrirCartera.AsInteger = 1) then
     AbreCarteraCobros;
end;

procedure TDMRecibosDesglose.AbreCarteraCobros;
var
  Signo : string;
begin
  Signo := QMPagosSIGNO.AsString;
  FMain.MuestraCartera(QMCabeceraEJERCICIO.AsInteger,
     QMCabeceraCANAL.AsInteger,
     Signo[1],
     QMPagosREGISTRO.AsInteger);
end;

procedure TDMRecibosDesglose.QMCabeceraCUENTA_COBROChange(Sender: TField);
begin
  xCuentaCobro.Close;
  xCuentaCobro.Open;
end;

procedure TDMRecibosDesglose.QMCabeceraCLIENTEChange(Sender: TField);
begin
  if (QMCabecera.State in [dsEdit, dsInsert]) then
     QMCabeceraCUENTA.AsString := DameCuentaCliente;
end;

procedure TDMRecibosDesglose.Todos(MontoRecibo: real);
begin
  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
  end;

  // Distribuir
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_DISTRIBUIR_RECIBOS(?ID, ?MONTO_RECIBO, ?CUENTA_BANCO)';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['MONTO_RECIBO'].AsFloat := MontoRecibo;
        Params.ByName['CUENTA_BANCO'].AsString := QMCabeceraCUENTA_COBRO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

function TDMRecibosDesglose.DameCuentaCliente: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 CUENTA FROM CON_CUENTAS_GES_CLI ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA ');
        SQL.Add(' AND EJERCICIO <= ?EJERCICIO ');
        SQL.Add(' AND CANAL = ?CANAL ');
        SQL.Add(' AND CLIENTE = ?CLIENTE ');
        SQL.Add(' ORDER BY EJERCICIO DESC ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
        ExecQuery;
        Result := FieldByName['CUENTA'].AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecibosDesglose.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  // Controlamos que la cuenta banco debe ser informada
  if (QMCabeceraCUENTA_COBRO.AsString = '') then
     raise Exception.Create(_('Falta informar la cuenta del banco'));

  QMCabeceraMONTO_RECIBO.AsFloat := QMCabeceraMONTO_TARJETA.AsFloat + QMCabeceraMONTO_EFECTIVO.AsFloat + QMCabeceraMONTO_CHEQUE.AsFloat;

  if ((DataSet.State = dsInsert) and (QMCabeceraNRO_RECIBO.AsInteger = 0)) then
     QMCabeceraNRO_RECIBO.AsInteger := DMMain.Contador_EECS(Serie, 'ZRC');

  DMMain.Contador_Gen(DataSet, 'ID_RECIBOS', 'ID');
end;

procedure TDMRecibosDesglose.Marcar;
begin
  // Cobrar marcados
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_COBRAR_MARCADOS(?ID, ?CUENTA_BANCO)';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['CUENTA_BANCO'].AsString := QMCabeceraCUENTA_COBRO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Los recibos marcados se han cobrado correctamente'));

  QMCabecera.Refresh;
end;

procedure TDMRecibosDesglose.Abrir;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE Z_RECIBOS_CAB SET ESTADO = 0 WHERE ID = ?ID';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMRecibosDesglose.Marcados(MontoRecibo: real);
begin
  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
  end;

  // Distribuir
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_DISTRIBUIR_RECIBOS_MARCADOS(?ID, ?MONTO_RECIBO, ?CUENTA_BANCO)';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['MONTO_RECIBO'].AsFloat := MontoRecibo;
        Params.ByName['CUENTA_BANCO'].AsString := QMCabeceraCUENTA_COBRO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMRecibosDesglose.UpdateMarcados;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
        SQL.Add(' SET ');
        SQL.Add(' VENCIMIENTO = ?CAB_VENCIMIENTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' MARCADO = 1 AND ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SIGNO = ''C'' AND ');
        SQL.Add(' ID_CAB_Z_RECIBOS = ?ID_CAB_Z_RECIBOS ');
        Params.ByName['EMPRESA'].AsInteger := QMCobrosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCobrosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCobrosCANAL.AsInteger;
        Params.ByName['ID_CAB_Z_RECIBOS'].AsInteger := QMCobrosID_CAB_Z_RECIBOS.AsInteger;
        Params.ByName['CAB_VENCIMIENTO'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecibosDesglose.EliminarMarcados(motivo: string);
begin
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     raise Exception.Create(_('No existe ningún recibo cobrado'));
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE Z_DESCOBRAR_MARCADOS(?ID)';
           Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Los recibos marcados se han descobrado correctamente'));

     QMCabecera.Refresh;
  end;
end;

procedure TDMRecibosDesglose.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDescripcion.Close;
  xBancos.Close;
  xCuenta.Close;
  xCuentaCobro.Close;
  QMCobros.Close;
  QMFacturasdesglose.Close;
end;

procedure TDMRecibosDesglose.RefrescaTotales;
begin
  xTotales.Close;
  xTotales.Open;
end;

procedure TDMRecibosDesglose.EliminarRecibo;
begin
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     raise Exception.Create(_('No existe ningún recibo cobrado'));
  end
  else
  begin
     AbreForm(TZFMMotivo, ZFMMotivo);
     ZFMMotivo.Muestra(QMCabeceraID.AsInteger);
     QMCabecera.Refresh;
  end;
end;

procedure TDMRecibosDesglose.QMCobrosAfterScroll(DataSet: TDataSet);
begin
  CambiaMascara;
end;

procedure TDMRecibosDesglose.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  QMCabecera.Params.ByName['SERIE'].AsString := Serie;
  QMCabecera.Open;
end;

procedure TDMRecibosDesglose.QMFacturasDesgloseID_RECIBOChange(Sender: TField);
begin
  /// Al marcar la linea, IMPORTE_DESGLOSE se inicializa con BRUTO si es igual 0.

  if (QMFacturasDesgloseID_RECIBO.AsInteger = 0) then
     QMFacturasDesgloseIMPORTE_DESGLOSE.AsFloat := 0
  else
  if (QMFacturasDesgloseID_RECIBO.AsInteger = QMCabeceraID.AsInteger) then
     if (QMFacturasDesgloseIMPORTE_DESGLOSE.AsFloat = 0) then
        QMFacturasDesgloseIMPORTE_DESGLOSE.AsFloat := QMFacturasDesgloseBRUTO.AsFloat;
end;

procedure TDMRecibosDesglose.MarcaDesmarca(Valor: integer);
begin
  with QMFacturasDesglose do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (QMFacturasDesgloseID_RECIBO.AsInteger <> Valor) then
           begin
              Edit;
              QMFacturasDesgloseID_RECIBO.AsInteger := Valor;
              Post;
           end;

           Next;
        end;

        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMRecibosDesglose.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);
end;

end.
