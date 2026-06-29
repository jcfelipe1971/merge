unit ZUDMRecibos;

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
  TZDMRecibos = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     QMCobros: TFIBTableSet;
     QMPagos: TFIBTableSet;
     DSCabecera: TDataSource;
     DsCobros: TDataSource;
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
     QMCobrosID_CAB_Z_RECIBOS: TIntegerField;
     QMCobrosMARCADO: TIntegerField;
     QMPagosID_CAB_Z_RECIBOS: TIntegerField;
     QMPagosMARCADO: TIntegerField;
     QMCobrosC_Pendientes: TFloatField;
     QMPagosP_Pendientes: TFloatField;
     QMCobrosAbrirCartera: TIntegerField;
     QMPagosAbrir_Cartera: TIntegerField;
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
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraNRO_RECIBO: TIntegerField;
     QMCabeceraTIPO_EFECTO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCobrosAfterPost(DataSet: TDataSet);
     procedure BeforePostGeneral(DataSet: TDataSet);
     procedure QMCobrosAbrirCarteraChange(Sender: TField);
     procedure QMCabeceraCLIENTEChange(Sender: TField);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCobrosAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     MonedaMascara: string;
     Serie: string;
     Posicionando: boolean;
     // procedure CalculaPrecios;
     procedure Refresca;
     procedure RefrescaTotales;
     procedure CambiaMascara;
     procedure AbreCarteraCobros;
     procedure RefrescarCobros;
  public
     { Public declarations }
     MascaraMonedaCobro: string;
     procedure CobrarTodosHastaImporte(MontoRecibo: real);
     procedure CobrarMarcadosHastaImporte(MontoRecibo: real);
     procedure CobrarRecibosMarcados;
     procedure Abrir;
     procedure UpdateMarcados;
     procedure EliminarMarcados(Motivo: string);
     procedure AnularRecibo;
     procedure CambiaSerie(SerieVar: string);
  end;

var
  ZDMRecibos : TZDMRecibos;

implementation

uses UDMMain, UUtiles, UEntorno, uFBusca, UFParada, UFMain,
  ZUFMMotivo, UFormGest, UDameDato;

{$R *.dfm}

procedure TZDMRecibos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  MonedaMascara := REntorno.Moneda;
  MascaraMonedacobro := DMMain.MascaraMoneda(MonedaMascara, 1);
  Posicionando := False;

  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCobros, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMPagos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTotales, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TZDMRecibos.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;

  DMMain.FiltraTabla(QMCabecera, '11100', False);
  QMCabecera.Params.ByName['SERIE'].AsString := Serie;
  QMCabecera.Open;
end;

procedure TZDMRecibos.CambiaMascara;
begin
  if (QMCobrosMONEDA.AsString = '') then
     MonedaMascara := REntorno.Moneda;

  if (MonedaMascara <> QMCobrosMONEDA.AsString) then
  begin
     // Tomo la moneda del recibo o la moneda de la empresa
     if (QMCobrosMONEDA.AsString = '') then
        MonedaMascara := REntorno.Moneda
     else
        MonedaMascara := QMCobrosMONEDA.AsString;

     MascaraMonedacobro := DMMain.MascaraMoneda(MonedaMascara, 1);

     QMCabeceraIMPORTE.DisplayFormat := MascaraMonedacobro;
     QMCabeceraMONTO_RECIBO.DisplayFormat := MascaraMonedacobro;
     QMCabeceraMONTO_TARJETA.DisplayFormat := MascaraMonedacobro;
     QMCabeceraMONTO_EFECTIVO.DisplayFormat := MascaraMonedacobro;
     QMCabeceraMONTO_CHEQUE.DisplayFormat := MascaraMonedacobro;

     xTotalesLIQUIDO.DisplayFormat := MascaraMonedacobro;

     QMCobrosZ_MONTO_APLICAR.DisplayFormat := MascaraMonedacobro;
     QMCobrosZ_PENDIENTE.DisplayFormat := MascaraMonedacobro;
     QMCobrosLIQUIDO.DisplayFormat := MascaraMonedacobro;
  end;
end;

procedure TZDMRecibos.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  // QMCabeceraID.AsInteger := DMMain.Contador_EEC('ZRB');

  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := Serie;
  QMCabeceraFECHA.AsDateTime := Date;
  QMCabeceraTIPO_EFECTO.AsString := 'CON';
end;

procedure TZDMRecibos.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  RefrescarCobros;

  xDescripcion.Close;
  xDescripcion.Open;

  xTotales.Close;
  xTotales.Open;
end;

procedure TZDMRecibos.QMCobrosAfterPost(DataSet: TDataSet);
begin
  UpdateMarcados;
  RefrescaTotales;
end;

procedure TZDMRecibos.BeforePostGeneral(DataSet: TDataSet);
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

procedure TZDMRecibos.QMCobrosAbrirCarteraChange(Sender: TField);
begin
  if (QMCobrosAbrirCartera.AsInteger = 1) then
     AbreCarteraCobros;
end;

procedure TZDMRecibos.AbreCarteraCobros;
var
  Signo : string;
begin
  Signo := QMPagosSIGNO.AsString;
  FMain.MuestraCartera(QMCabeceraEJERCICIO.AsInteger,
     QMCabeceraCANAL.AsInteger,
     Signo[1],
     QMPagosREGISTRO.AsInteger);
end;

procedure TZDMRecibos.QMCabeceraCLIENTEChange(Sender: TField);
begin
  if (QMCabecera.State in [dsEdit, dsInsert]) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TITULO, CUENTA FROM VER_CLIENTES_CUENTAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' CLIENTE = :CLIENTE ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
           ExecQuery;
           QMCabeceraTITULO.AsString := FieldByName['TITULO'].AsString;
           QMCabeceraCUENTA.AsString := FieldByName['CUENTA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TZDMRecibos.CobrarTodosHastaImporte(MontoRecibo: real);
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
        SQL.Text := 'EXECUTE PROCEDURE Z_DISTRIBUIR_RECIBOS(:ID, :MONTO_RECIBO, :CUENTA_BANCO)';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['MONTO_RECIBO'].AsFloat := MontoRecibo;
        Params.ByName['CUENTA_BANCO'].AsString := QMCabeceraCUENTA_COBRO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refresca;
end;

procedure TZDMRecibos.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  // Contador normal
  if ((DataSet.State = dsInsert) and (QMCabeceraNRO_RECIBO.AsInteger = 0)) then
     QMCabeceraNRO_RECIBO.AsInteger := DMMain.Contador_EECS(Serie, 'ZRC');

  DMMain.Contador_Gen(DataSet, 'ID_RECIBOS', 'ID');

  // Controlamos que la cuenta banco debe ser informada
  if (QMCabeceraCUENTA_COBRO.AsString = '') then
     raise Exception.Create(_('Falta informar la cuenta del banco'));
end;

procedure TZDMRecibos.CobrarRecibosMarcados;
begin
  // Cobrar marcados
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_COBRAR_MARCADOS(:ID, :CUENTA_BANCO)';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['CUENTA_BANCO'].AsString := QMCabeceraCUENTA_COBRO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Los recibos marcados se han cobrado correctamente'));

  Refresca;
end;

procedure TZDMRecibos.Abrir;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE Z_RECIBOS_CAB SET ESTADO = 0 WHERE ID = :ID';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refresca;
end;

procedure TZDMRecibos.CobrarMarcadosHastaImporte(MontoRecibo: real);
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
        SQL.Text := 'EXECUTE PROCEDURE Z_DISTRIBUIR_RECIBOS_MARCADOS(:ID, :MONTO_RECIBO, :CUENTA_BANCO)';
        Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['MONTO_RECIBO'].AsFloat := MontoRecibo;
        Params.ByName['CUENTA_BANCO'].AsString := QMCabeceraCUENTA_COBRO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refresca;
end;

procedure TZDMRecibos.UpdateMarcados;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_DETALLE  ');
        SQL.Add(' SET ');
        SQL.Add(' VENCIMIENTO = :VENCIMIENTO, ');
        SQL.Add(' TIPO_EFECTO = :TIPO_EFECTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' MARCADO = 1 AND ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SIGNO = ''C'' AND ');
        SQL.Add(' ID_CAB_Z_RECIBOS = :ID ');
        Params.ByName['EMPRESA'].AsInteger := QMCobrosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCobrosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCobrosCANAL.AsInteger;
        Params.ByName['ID'].AsInteger := QMCobrosID_CAB_Z_RECIBOS.AsInteger;
        Params.ByName['VENCIMIENTO'].AsDateTime := QMCabeceraFECHA.AsDateTime;
        Params.ByName['TIPO_EFECTO'].AsString := QMCobrosTIPO_EFECTO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMRecibos.EliminarMarcados(Motivo: string);
begin
  if (QMCabeceraESTADO.AsInteger = 0) then
     raise Exception.Create(_('No existe ningún recibo cobrado'))
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE Z_DESCOBRAR_MARCADOS(:ID)';
           Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Los recibos marcados se han descobrado correctamente'));

     Refresca;
  end;
end;

procedure TZDMRecibos.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDescripcion.Close;
  QMCobros.Close;
  xTotales.Close;
end;

procedure TZDMRecibos.RefrescaTotales;
begin
  with xTotales do
  begin
     Close;
     Open;
  end;
end;

procedure TZDMRecibos.AnularRecibo;
begin
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     raise Exception.Create(_('No existe ningún recibo cobrado'));
  end
  else
  begin
     AbreForm(TZFMMotivo, ZFMMotivo);
     ZFMMotivo.Muestra(QMCabeceraID.AsInteger);

     Refresca;
  end;
end;

procedure TZDMRecibos.QMCobrosAfterScroll(DataSet: TDataSet);
begin
  CambiaMascara;
end;

procedure TZDMRecibos.Refresca;
begin
  Posicionando := True;
  try
     Refrescar(QMCabecera, 'ID', QMCabeceraID.AsInteger);
  finally
     Posicionando := False;
  end;

  RefrescarCobros;
end;

procedure TZDMRecibos.RefrescarCobros;
begin
  if not Posicionando then
  begin
     with QMCobros do
     begin
        DisableControls;
        try
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM EMP_CARTERA_DETALLE DET ');
           SelectSQL.Add(' JOIN EMP_CARTERA CAB ON (DET.ID_CARTERA = CAB.ID_CARTERA) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' CAB.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' DET.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' DET.EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' DET.CANAL = :CANAL AND ');
           SelectSQL.Add(' DET.SIGNO = ''C'' AND ');
           SelectSQL.Add(' DET.VISIBLE = 1 AND ');
           SelectSQL.Add(' ( ');
           if QMCabeceraESTADO.AsInteger = 0 then
           begin
              SelectSQL.Add(' CAB.COD_CLI_PRO = :CLIENTE AND ');
              SelectSQL.Add(' (((DET.MARCADO = 0) AND (DET.PAGADO = 0)) OR ((DET.MARCADO = 1) AND (DET.ID_CAB_Z_RECIBOS = :ID))) ');
           end;
           if QMCabeceraESTADO.AsInteger = 5 then
           begin
              SelectSQL.Add(' DET.ID_CAB_Z_RECIBOS = :ID ');
           end;
           SelectSQL.Add(' ) ');
           SelectSQL.Add(' ORDER BY DET.VENCIMIENTO ');
           Open;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TZDMRecibos.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  RefrescarCobros;
end;

procedure TZDMRecibos.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraTITULO_ESTADO.AsString := DameTituloEstado(QMCabeceraESTADO.AsInteger);
end;

end.
