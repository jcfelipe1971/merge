unit UDMCartera;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Forms, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, FIBDatabase, UFIBModificados, Math, Dialogs, HYFIBQuery,
  FIBDataSetRO;

type
  TDMCartera = class(TDataModule)
     QMCartera: TFIBTableSet;
     DSQMCartera: TDataSource;
     QMCarteraDetalle: TFIBTableSet;
     DSQMCarteraDetalle: TDataSource;
     QMCarteraDetalleEMPRESA: TIntegerField;
     QMCarteraDetalleEJERCICIO: TIntegerField;
     QMCarteraDetalleCANAL: TIntegerField;
     QMCarteraDetalleSIGNO: TFIBStringField;
     QMCarteraDetalleREGISTRO: TIntegerField;
     QMCarteraDetalleLINEA: TIntegerField;
     QMCarteraDetalleVENCIMIENTO: TDateTimeField;
     QMCarteraDetalleCTA_PAGO: TFIBStringField;
     QMCarteraDetalleLIQUIDO: TFloatField;
     QMCarteraDetallePAGADO: TIntegerField;
     QMCarteraDetalleTIPO_EFECTO: TFIBStringField;
     QMCarteraDetalleREMESAR: TIntegerField;
     QMCarteraIVA: TFIBTableSet;
     DSQMCarteraIVA: TDataSource;
     QMCarteraIVAEMPRESA: TIntegerField;
     QMCarteraIVAEJERCICIO: TIntegerField;
     QMCarteraIVACANAL: TIntegerField;
     QMCarteraIVASIGNO: TFIBStringField;
     QMCarteraIVAREGISTRO: TIntegerField;
     QMCarteraIVAT_IVA: TIntegerField;
     QMCarteraIVABASE: TFloatField;
     QMCarteraIVAP_IVA: TFloatField;
     QMCarteraIVAP_RECARGO: TFloatField;
     QMCarteraIVAI_IVA: TFloatField;
     QMCarteraIVAI_RECARGO: TFloatField;
     TLocal: THYTransaction;
     QMCarteraDetalleRECIBIDO: TIntegerField;
     QMCarteraEMPRESA: TIntegerField;
     QMCarteraEJERCICIO: TIntegerField;
     QMCarteraCANAL: TIntegerField;
     QMCarteraSIGNO: TFIBStringField;
     QMCarteraREGISTRO: TIntegerField;
     QMCarteraNOMBRE: TFIBStringField;
     QMCarteraFECHA_REGISTRO: TDateTimeField;
     QMCarteraLINEAS: TIntegerField;
     QMCarteraCUENTA: TFIBStringField;
     QMCarteraDOC_NUMERO: TIntegerField;
     QMCarteraDOC_SERIE: TFIBStringField;
     QMCarteraDOC_FECHA: TDateTimeField;
     QMCarteraDOC_TIPO: TFIBStringField;
     QMCarteraVALOR: TDateTimeField;
     QMCarteraFORMA_PAGO: TFIBStringField;
     QMCarteraBASES: TFloatField;
     QMCarteraLIQUIDO: TFloatField;
     QMCarteraPAGADO: TIntegerField;
     QMCarteraRIC: TIntegerField;
     QMCarteraRIVA: TIntegerField;
     QMCarteraREG_IVA: TIntegerField;
     QMCarteraESTADO: TIntegerField;
     QMCarteraDIA_PAGO_1: TIntegerField;
     QMCarteraDIA_PAGO_2: TIntegerField;
     QMCarteraDIA_PAGO_3: TIntegerField;
     QMCarteraCOD_CLI_PRO: TIntegerField;
     QMCarteraORIGEN_IMPAGADO: TIntegerField;
     QMCarteraASIENTO: TIntegerField;
     QMCarteraTIPO_FACTURA: TStringField;
     QMCarteraDetalleANTICIPADO: TFloatField;
     QMCarteraDetalleREMESA: TIntegerField;
     QMCarteraDetalleDOCUMENTO: TFIBStringField;
     QMCarteraEJERCICIO_FINAL: TIntegerField;
     QMCarteraMONEDA: TFIBStringField;
     QMCarteraLIQUIDO_MONEDA: TFloatField;
     QMCarteraDetalleMONEDA: TFIBStringField;
     QMCarteraDetalleLIQUIDO_CANAL: TFloatField;
     QMCarteraDetalleFECHA_RECIBIDO: TDateTimeField;
     QMCarteraC_PAGADA: TFloatField;
     QMCarteraTIPO_ASIENTO_KRI: TFIBStringField;
     QMCarteraDetalleTITULO: TStringField;
     QMCarteraCAMBIO: TFloatField;
     QMCarteraID_DOC: TIntegerField;
     QMCarteraID_CARTERA: TIntegerField;
     QMCarteraDetalleMONEDA_CANAL: TFIBStringField;
     QMCarteraDetalleFECHA_VALOR: TDateTimeField;
     QMCarteraDetalleID_CARTERA: TIntegerField;
     QMCarteraDetalleID_CARTERA_DETALLE: TIntegerField;
     QMCarteraDetalleID_REMESAS: TIntegerField;
     DSxCarteraDet: TDataSource;
     xCarteraDet: TFIBTableSet;
     xCarteraDetEMPRESA: TIntegerField;
     xCarteraDetEJERCICIO: TIntegerField;
     xCarteraDetCANAL: TIntegerField;
     xCarteraDetSIGNO: TFIBStringField;
     xCarteraDetREGISTRO: TIntegerField;
     xCarteraDetLINEA: TIntegerField;
     xCarteraDetVENCIMIENTO: TDateTimeField;
     xCarteraDetCTA_PAGO: TFIBStringField;
     xCarteraDetLIQUIDO: TFloatField;
     xCarteraDetPAGADO: TIntegerField;
     xCarteraDetMOD_MANUAL: TIntegerField;
     xCarteraDetTIPO_EFECTO: TFIBStringField;
     xCarteraDetREMESAR: TIntegerField;
     xCarteraDetESTADO: TIntegerField;
     xCarteraDetREMESA: TIntegerField;
     xCarteraDetBANCO: TIntegerField;
     xCarteraDetRIC: TIntegerField;
     xCarteraDetIMPAGADO: TIntegerField;
     xCarteraDetFECHA_CIERRE: TDateTimeField;
     xCarteraDetESTADO_RECIBO: TFIBStringField;
     xCarteraDetRECIBIDO: TIntegerField;
     xCarteraDetVISIBLE: TIntegerField;
     xCarteraDetENTRADA: TIntegerField;
     xCarteraDetAGRUPACION: TIntegerField;
     xCarteraDetCONFIRMING: TIntegerField;
     xCarteraDetANTICIPADO: TFloatField;
     xCarteraDetDOCUMENTO: TFIBStringField;
     xCarteraDetDOC_AUTOMATICO: TIntegerField;
     xCarteraDetEJERCICIO_REMESA: TIntegerField;
     xCarteraDetEJERCICIO_AGRUPACION: TIntegerField;
     xCarteraDetMONEDA: TFIBStringField;
     xCarteraDetLIQUIDO_CANAL: TFloatField;
     xCarteraDetCAMBIO: TFloatField;
     xCarteraDetRIC_RECIBIDO: TIntegerField;
     xCarteraDetFECHA_RECIBIDO: TDateTimeField;
     xCarteraDetMONEDA_CANAL: TFIBStringField;
     xCarteraDetEJERCICIO_CONFIRMING: TIntegerField;
     xCarteraDetFECHA_VALOR: TDateTimeField;
     xCarteraDetABONO: TIntegerField;
     xCarteraDetEJERCICIO_ABONO: TIntegerField;
     xCarteraDetAGRUPACION_GENERAL: TIntegerField;
     xCarteraDetBANDERA: TIntegerField;
     xCarteraDetID_CARTERA: TIntegerField;
     xCarteraDetID_CARTERA_DETALLE: TIntegerField;
     xCarteraDetID_REMESAS: TIntegerField;
     xCarteraDetTITULO: TFIBStringField;
     QMCarteraTEXTO: TFIBStringField;
     TUpdate: THYTransaction;
     QMCarteraDetalleCONFIRMING: TIntegerField;
     QMCarteraDetalleEJERCICIO_CONFIRMING: TIntegerField;
     QMCarteraDetalleEJERCICIO_ORD_PAGO: TIntegerField;
     QMCarteraDetalleORD_PAGO: TIntegerField;
     QMCarteraDetalleDOC_AUTOMATICO: TIntegerField;
     QMCarteraOBSERVACIONES: TFIBStringField;
     QMCarteraDetalleOBSERVACIONES: TFIBStringField;
     QMCarteraDetalleBANCO_CLIPRO: TIntegerField;
     QMCarteraDIA_SEMANA_PAGO: TFIBStringField;
     QMCarteraDetalleFORMA_PAGO: TFIBStringField;
     QMCarteraDetalleRIC: TIntegerField;
     QMCarteraDetalleFECHA_CIERRE: TDateTimeField;
     QMCarteraDetalleRESPONSABLE: TIntegerField;
     QMCarteraDetalleCARTA1: TIntegerField;
     QMCarteraDetalleCARTA2: TIntegerField;
     QMCarteraDetalleCARTA3: TIntegerField;
     QMCarteraDetalleCARTA4: TIntegerField;
     QMCarteraDetalleCARTA5: TIntegerField;
     procedure DMCarteraCreate(Sender: TObject);
     procedure DMCarteraDestroy(Sender: TObject);
     procedure QMCarteraNewRecord(DataSet: TDataSet);
     procedure QMCarteraBeforePost(DataSet: TDataSet);
     procedure QMCarteraDetalleNewRecord(DataSet: TDataSet);
     procedure BorraCartera(DataSet: TDataSet);
     procedure GrabaDetalle(DataSet: TDataSet);
     procedure GrabaCartera(DataSet: TDataSet);
     procedure QMCarteraIVANewRecord(DataSet: TDataSet);
     procedure QMCarteraIVAAfterPost(DataSet: TDataSet);
     procedure QMCarteraTIPO_FACTURAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCarteraAfterOpen(DataSet: TDataSet);
     procedure QMCarteraDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMCarteraDetalleBeforePost(DataSet: TDataSet);
     procedure QMCarteraLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCarteraDetalleTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCarteraTIPO_ASIENTO_KRIChange(Sender: TField);
     procedure QMCarteraDetalleVENCIMIENTOChange(Sender: TField);
     procedure xCarteraDetNewRecord(DataSet: TDataSet);
     procedure xCarteraDetBeforeEdit(DataSet: TDataSet);
     procedure SetPGCBeforeOpen(DataSet: TDataSet);
     procedure QMCarteraDetalleDOCUMENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCarteraBeforeClose(DataSet: TDataSet);
  private
     Pagar, Recibido: smallint;
     LocalMascaraN: string;
     SQLBase: TStrings;
     Signo: string;
     // procedure Saldo(var Saldo: double; var Moneda: string);
     function ControlaCuentaDetalle(Cuenta: string): boolean;
  public
     function EsAgrupado: boolean;
     procedure FiltraSigno(aSigno: string; Ejercicio: smallint = -1);
     procedure LimpiaRegistro;
     procedure LimpiaSigno;
     procedure ProcesaIVA;
     procedure GrabaIVA;
     procedure Refresca;
     procedure BusquedaCompleja;
     procedure PagaRecibos(Cuenta: string; Desde, Hasta: TDateTime; Signo: string);
     procedure Invisible;
     procedure Visible;
     procedure DesagrupaRecibos;
     procedure MascarasMoneda;
     procedure DameDatosReciboPagado(var RIC, Pagado, Ejercicio: integer);
     procedure DameDatosReciboRecibido(var RICRecibido, Recibido, Ejercicio: integer);
     procedure AbrexCarteraDet(Signo: string; Importe, masmenos: double; IncPag: boolean; IncInvisibles: boolean = False);
     function HayDatosBusqueda: boolean;
     function PerteneceAgrupacion: boolean;
     procedure DatosRegistro;
     procedure FiltraCartera(Ejercicio, Canal: smallint; Signo: char; registro: integer); overload;
     procedure FiltraCartera(Signo: char; ListaId: string); overload;
     procedure InicializaQMCartera(Signo: string);
     procedure FiltraReciboQueAgrupa;
     procedure AbreRegistroBuscado;
  end;

var
  DMCartera : TDMCartera;

implementation

uses UDMMain, UEntorno, UUtiles, UFMIvaCartera,
  UFBusca, UFPregAnticipo, UFMain, DateUtils, UParam, UDameDato;

{$R *.DFM}

procedure TDMCartera.DMCarteraCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  {
SELECT
*
FROM VER_CARTERA
WHERE
(
    (
    EMPRESA = ?EMPRESA AND
    CANAL = ?CANAL AND
    SIGNO = ?SIGNO
    )
    AND
    (
        (
            EJERCICIO = ?EJERCICIO AND
            EJERCICIO_FINAL < ?EJERCICIO
        )
        OR
        (
            EJERCICIO <= ?EJERCICIO AND
            EJERCICIO_FINAL >= ?EJERCICIO
        )
        OR
        (
            PAGADO <> 1
        )
    )
)
ORDER BY EJERCICIO, REGISTRO
}
  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_CARTERA ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' ((EMPRESA = ?EMPRESA AND ');
  SQLBase.Add('   CANAL = ?CANAL AND ');
  SQLBase.Add('   SIGNO = ?SIGNO) AND ');
  SQLBase.Add('  ((EJERCICIO = ?EJERCICIO AND EJERCICIO_FINAL < ?EJERCICIO) OR ');
  SQLBase.Add('   (EJERCICIO <= ?EJERCICIO AND EJERCICIO_FINAL >= ?EJERCICIO) OR ');
  SQLBase.Add('   (PAGADO <> 1))) ');
  SQLBase.Add(' ORDER BY EJERCICIO, REGISTRO ');

  QMCartera.Close;

  QMCarteraIVAP_IVA.DisplayFormat := MascaraP;
  QMCarteraIVAP_RECARGO.DisplayFormat := MascaraP;
  QMCarteraDetalleCTA_PAGO.EditMask := REntorno.MascaraCuentas;

  QMCarteraFECHA_REGISTRO.DisplayFormat := ShortDateFormat;
  QMCarteraDOC_FECHA.DisplayFormat := ShortDateFormat;

  QMCarteraDetalleVENCIMIENTO.DisplayFormat := ShortDateFormat;
  QMCarteraDetalleFECHA_RECIBIDO.DisplayFormat := ShortDateFormat;
  QMCarteraDetalleFECHA_VALOR.DisplayFormat := ShortDateFormat;
  QMCarteraDetalleFECHA_Cierre.DisplayFormat := ShortDateFormat;

  xCarteraDetVENCIMIENTO.DisplayFormat := ShortDateFormat;
  xCarteraDetFECHA_CIERRE.DisplayFormat := ShortDateFormat;
  xCarteraDetFECHA_RECIBIDO.DisplayFormat := ShortDateFormat;
  xCarteraDetFECHA_VALOR.DisplayFormat := ShortDateFormat;
end;

procedure TDMCartera.DMCarteraDestroy(Sender: TObject);
begin
  SQLBase.Free;
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMCartera.FiltraSigno(aSigno: string; Ejercicio: smallint = -1);
begin
  Signo := aSigno;

  if (Ejercicio = -1) then
     Ejercicio := REntorno.Ejercicio;

  with QMCartera do
  begin
     Close;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['SIGNO'].AsString := Signo;
     Open;
  end;
end;

procedure TDMCartera.QMCarteraNewRecord(DataSet: TDataSet);
begin
  QMCarteraEMPRESA.AsInteger := REntorno.Empresa;
  QMCarteraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCarteraCANAL.AsInteger := REntorno.Canal;
  QMCarteraSIGNO.AsString := Self.Signo;
  QMCarteraFECHA_REGISTRO.AsDateTime := REntorno.FechaTrab;
  QMCarteraDOC_SERIE.AsString := 'A';
  QMCarteraDOC_NUMERO.AsInteger := 0;
  QMCarteraDOC_FECHA.AsDateTime := REntorno.FechaTrab;
  QMCarteraFORMA_PAGO.AsString := 'CON';
  QMCarteraLIQUIDO.AsFloat := 0;
  QMCarteraPAGADO.AsInteger := 0;
  if (Self.Signo = 'C') then
     QMCarteraTIPO_ASIENTO_KRI.AsString := REntorno.Asiento_CAR_C
  else
     QMCarteraTIPO_ASIENTO_KRI.AsString := REntorno.Asiento_CAR_P;
end;

procedure TDMCartera.QMCarteraBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMCarteraREGISTRO.AsInteger := DMMain.Contador_EEC('CA' + Signo);
     DMMain.Contador_Gen(DataSet, 'ID_CARTERA', 'ID_CARTERA');
  end;
  QMCarteraDOC_FECHA.AsDateTime := QMCarteraDOC_FECHA.AsDateTime;
end;

procedure TDMCartera.LimpiaRegistro;
begin
  if (Confirma and ConfirmaGrave) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_LIMPIA_REGISTRO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?REGISTRO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SIGNO'].AsString := Self.Signo;
           Params.ByName['REGISTRO'].AsInteger := QMCarteraREGISTRO.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCartera.Close;
     QMCartera.Open;
  end;
end;

procedure TDMCartera.LimpiaSigno;
begin
  if (Confirma and ConfirmaGrave) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_LIMPIA_SIGNO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SIGNO'].AsString := Self.Signo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCartera.Close;
     QMCartera.Open;
  end;
end;

procedure TDMCartera.QMCarteraDetalleNewRecord(DataSet: TDataSet);
begin
  QMCarteraDetalleEMPRESA.AsInteger := QMCarteraEMPRESA.AsInteger;
  QMCarteraDetalleEJERCICIO.AsInteger := QMCarteraEJERCICIO.AsInteger;
  QMCarteraDetalleCANAL.AsInteger := QMCarteraCANAL.AsInteger;
  QMCarteraDetalleSIGNO.AsString := QMCarteraSIGNO.AsString;
  QMCarteraDetalleREGISTRO.AsInteger := QMCarteraREGISTRO.AsInteger;
  QMCarteraDetalleVENCIMIENTO.AsDateTime := REntorno.FechaTrabSH;
  QMCarteraDetallePAGADO.AsInteger := 0;
  QMCarteraDetalleLIQUIDO.AsInteger := 0;
  QMCarteraDetalleRECIBIDO.AsInteger := 0;
  QMCarteraDetalleMONEDA.AsString := QMCarteraMONEDA.AsString;
  QMCarteraDetalleID_CARTERA.AsInteger := QMCarteraID_CARTERA.AsInteger;
  QMCarteraDetalleOBSERVACIONES.AsString := '';
  // Para que calcule LIQUIDO_CANAL
  QMCarteraDetalleMONEDA_CANAL.AsString := '   ';
  Recibido := 0;
end;

procedure TDMCartera.BorraCartera(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;

  QMCarteraDetalle.Close;
  QMCarteraDetalle.Open;
end;

procedure TDMCartera.GrabaDetalle(DataSet: TDataSet);
var
  Marca : TBookmark;
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;

  marca := DataSet.GetBookmark;
  QMCartera.DisableControls;
  try
     QMCartera.Refresh;
     DataSet.GotoBookmark(Marca);
  finally
     QMCartera.EnableControls;
     DataSet.FreeBookmark(marca);
  end;
end;

procedure TDMCartera.GrabaCartera(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;

  QMCarteraDetalle.Close;
  QMCarteraDetalle.Open;
  if (QMCarteraLIQUIDO.AsFloat = 0) then
     Self.ProcesaIVA;
end;

procedure TDMCartera.ProcesaIVA;
var
  FormaIVA : TFMIvaCartera;
begin
  if not QMCarteraIVa.Transaction.InTransaction then
     QMCarteraIVA.Transaction.StartTransaction;

  QMCarteraIVA.Open;
  FormaIVA := TFMIvaCartera.Create(Self);
  FormaIVA.ShowModal;
  QMCarteraIVA.Close;
end;

procedure TDMCartera.QMCarteraIVANewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
  DataSet.First;
end;

procedure TDMCartera.GrabaIVA;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DE_IVA (?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?REGISTRO, ?ID_CARTERA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := QMCarteraSIGNO.AsString;
        Params.ByName['REGISTRO'].AsInteger := QMCarteraREGISTRO.AsInteger;
        Params.ByName['ID_CARTERA'].AsInteger := QMCarteraID_CARTERA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCartera.Refresh;
end;

procedure TDMCartera.Refresca;
var
  IdCarteraDetalle : integer;
begin
  // Obtengo posición de Detalle
  IdCarteraDetalle := QMCarteraDetalleID_CARTERA_DETALLE.AsInteger;

  Refrescar(QMCartera, 'ID_CARTERA', QMCarteraID_CARTERA.AsInteger);
  Refrescar(QMCarteraDetalle, 'ID_CARTERA_DETALLE', IdCarteraDetalle);
end;

procedure TDMCartera.QMCarteraIVAAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCartera.QMCarteraTIPO_FACTURAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMCarteraDOC_TIPO.AsString = 'FAC' then
     Text := _('Factura Ventas')
  else if QMCarteraDOC_TIPO.AsString = 'FAP' then
     Text := _('Factura de Proveedor')
  else if QMCarteraDOC_TIPO.AsString = 'FCR' then
     Text := _('Factura de Acreedor')
  else if ((QMCarteraDOC_TIPO.AsString = 'AGC') or
     (QMCarteraDOC_TIPO.AsString = 'AGP') or
     (QMCarteraDOC_TIPO.AsString = 'AGA') or
     (QMCarteraDOC_TIPO.AsString = 'AGR')) then
     Text := _('Agrupacion de Recibos')
  else if ((QMCarteraDOC_TIPO.AsString = 'NRC') or
     (QMCarteraDOC_TIPO.AsString = 'NRP') or
     (QMCarteraDOC_TIPO.AsString = 'NRA')) then
     Text := _('Recibo creado')
  else if QMCarteraDOC_TIPO.AsString = 'TIC' then
     Text := _('Ticket de Ventas')
  else if QMCarteraDOC_TIPO.AsString = 'AFC' then
     Text := _('Asiento de Ventas')
  else if QMCarteraDOC_TIPO.AsString = 'AFP' then
     Text := _('Asiento de Proveedor')
  else if QMCarteraDOC_TIPO.AsString = 'AFA' then
     Text := _('Asiento de Acreedor');
end;

procedure TDMCartera.BusquedaCompleja;
var
  //nSigno : smallint;
  orden : string;
begin
  QMCartera.Close;
  QMCartera.SelectSQL := SQLBase;

  TFBusca.Create(Self).SeleccionaBusqueda(QMCartera, '10100', False);
  orden := QMCartera.OrdenadoPor;
  QMCartera.Ordenar('');
  // QMCartera.SelectSQL.Add(' AND((EJERCICIO<=?EJERCICIO)AND(EJERCICIO_FINAL>=?EJERCICIO)) AND SIGNO=?SIGNO');
  // QMCartera.SelectSQL.Add(' AND(EJERCICIO<=?EJERCICIO) AND SIGNO=?SIGNO');

  QMCartera.SelectSQL.Add(' AND(SIGNO=?SIGNO)AND(((EJERCICIO<=?EJERCICIO)AND(EJERCICIO_FINAL>=?EJERCICIO))OR(PAGADO<>1)) ');
  QMCartera.Ordenar(orden);

  FiltraSigno(Signo);
end;

procedure TDMCartera.QMCarteraAfterOpen(DataSet: TDataSet);
begin
  QMCarteraDetalle.Open;
  if (QMCarteraSIGNO.AsString = 'C') then
  begin
     QMCarteraDetalleRECIBIDO.DisplayLabel := _('Rec.');
     QMCarteraDetalleRIC.DisplayLabel := _('R.I.C. Cobro');
  end
  else
  begin
     QMCarteraDetalleRECIBIDO.DisplayLabel := _('Emi.');
     QMCarteraDetalleRIC.DisplayLabel := _('R.I.C. Pago');
  end;
end;

procedure TDMCartera.PagaRecibos(Cuenta: string; Desde, Hasta: TDateTime; Signo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
        SQL.Add(' SET PAGADO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SIGNO = ?SIGNO AND ');
        SQL.Add(' VENCIMIENTO >= ?DESDE AND ');
        SQL.Add(' VENCIMIENTO <= ?HASTA AND ');
        SQL.Add(' CTA_PAGO = ?CUENTA AND ');
        SQL.Add(' PAGADO = 0 AND ');
        SQL.Add(' ESTADO_RECIBO = ''N'' AND ');
        SQL.Add(' VISIBLE = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['DESDE'].AsDateTime := Trunc(Desde);
        Params.ByName['HASTA'].AsDateTime := Trunc(Hasta);
        Params.ByName['SIGNO'].AsString := Signo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCartera.Refresh;
end;

procedure TDMCartera.Invisible;
begin
  { TODO -oDuilio -cCartera : Habría que ver si hay que agregar aqui los recibos que están en un confirming u orden de pago. }
  if ((QMCarteraDetallePAGADO.AsInteger = 0) and (QMCarteraDetalleRECIBIDO.AsInteger = 0) and
     (QMCarteraDetalleDOCUMENTO.AsString = '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
           SQL.Add(' SET VISIBLE = 0 ');
           SQL.Add(' WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE ');
           Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMCarteraDetalleID_CARTERA_DETALLE.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCartera.Refresh;
  end
  else
     ShowMessage(_('Este Recibo no puede hacerse Invisible'));
end;

procedure TDMCartera.Visible;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_RECIBOS_VISIBLES(?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?REGISTRO, ?ID_CARTERA)';
        Params.ByName['EMPRESA'].AsInteger := QMCarteraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCarteraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCarteraCANAL.AsInteger;
        Params.ByName['SIGNO'].AsString := QMCarteraSIGNO.AsString;
        Params.ByName['REGISTRO'].AsInteger := QMCarteraREGISTRO.AsInteger;
        Params.ByName['ID_CARTERA'].AsInteger := QMCarteraID_CARTERA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCartera.Refresh;
end;

procedure TDMCartera.DesagrupaRecibos;
begin
  if EsAgrupado then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESAGRUPA_RECIBOS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?REGISTRO, ?ID_CARTERA)';
           Params.ByName['EMPRESA'].AsInteger := QMCarteraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCarteraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCarteraCANAL.AsInteger;
           Params.ByName['SIGNO'].AsString := QMCarteraSIGNO.AsString;
           Params.ByName['REGISTRO'].AsInteger := QMCarteraREGISTRO.AsInteger;
           Params.ByName['ID_CARTERA'].AsInteger := QMCarteraID_CARTERA.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCartera.Close;
     QMCartera.Open;
  end
  else
     ShowMessage(_('Este Recibo no es agrupado'));
end;

function TDMCartera.EsAgrupado: boolean;
begin
  Result := ((QMCarteraDOC_TIPO.AsString = 'AGC') or (QMCarteraDOC_TIPO.AsString = 'AGP') or (QMCarteraDOC_TIPO.AsString = 'AGA'));
end;

procedure TDMCartera.QMCarteraDetalleBeforeEdit(DataSet: TDataSet);
begin
  Pagar := QMCarteraDetallePAGADO.AsInteger;
  Recibido := QMCarteraDetalleRECIBIDO.AsInteger;
end;

procedure TDMCartera.QMCarteraDetalleBeforePost(DataSet: TDataSet);
var
  Saldo, Tope : double;
  Tipo, Moneda : string;
begin
  if (QMCarteraDetalleConfirming.AsInteger = 0) then
  begin
     if (QMCarteraDetalleVENCIMIENTO.AsDateTime < REntorno.FechaTrabSH) then
        ShowMessage(_('La fecha de vencimiento es anterior a la fecha de trabajo.'));

     if ((YearOf(REntorno.FechaTrab) = YearOf(QMCarteraFECHA_REGISTRO.AsDateTime)) and (LeeParametro('RECCPVE001') = 'N')) or
        ((YearOf(REntorno.FechaTrab) = YearOf(QMCarteraDetalleVENCIMIENTO.AsDateTime)) and (LeeParametro('RECCPVE001') = 'S')) or
        ((REntorno.FechaTrab <> YearOf(QMCarteraFECHA_REGISTRO.AsDateTime)) and (QMCarteraDetallePAGADO.AsInteger = 0)) then
     begin
        { TODO -cCartera : Si se está pagando un recibo de anticipo, no debería preguntar si utilizar saldo de la cuenta de anticipos del cliente }
        if QMCarteraSIGNO.AsString = 'C' then
           Tipo := 'CLI'
        else
        if ((QMCarteraDOC_TIPO.AsString = 'FAP') or (QMCarteraDOC_TIPO.AsString = 'AGP') or
           (QMCarteraDOC_TIPO.AsString = 'NRP') or (QMCarteraDOC_TIPO.AsString = 'AFP')) then
           Tipo := 'PRO'
        else
           Tipo := 'ACR';
        DMMain.SaldoAnticipo(Tipo, QMCarteraCOD_CLI_PRO.AsInteger, QMCarteraDetalleVENCIMIENTO.AsDateTime, Saldo, Moneda);

        QMCarteraDetalleDOCUMENTO.AsString := UpperCase(QMCarteraDetalleDOCUMENTO.AsString);
        if ((DataSet.State = dsEdit) and (Pagar = 0) and (QMCarteraDetallePAGADO.AsInteger = 1) and
           (Saldo <> 0)) then
        begin
           if QMCarteraDetalleMONEDA.AsString = Moneda then
              Tope := QMCarteraDetalleLIQUIDO.AsFloat
           else
              Tope := DMMain.DameCambio(True, QMCarteraDetalleMONEDA.AsString, Moneda, QMCarteraDetalleVENCIMIENTO.AsDateTime, QMCarteraDetalleLIQUIDO.AsFloat);

           if (Tope < Saldo) then
              Saldo := Tope;
           if TFPregAnticipo.Create(Self).Mostrar(Saldo, Moneda, Tope) then
              QMCarteraDetalleANTICIPADO.AsFloat := Saldo;
        end;
        if ((Recibido = 0) and (QMCarteraDetalleRECIBIDO.AsInteger = 1)) then
           QMCarteraDetalleFECHA_RECIBIDO.AsDateTime := REntorno.FechaTrab;

        if not (ControlaCuentaDetalle(QMCarteraDETALLECTA_PAGO.AsString)) then
        begin
           ShowMessage(_('La Cuenta es errónea, o no pertenece a el ejercicio del vencimiento.'));
           DataSet.Cancel;
        end;

        if (DataSet.State = dsInsert) then
        begin
           DMMain.Contador_Gen(DataSet, 'ID_CARTERA_DETALLE', 'ID_CARTERA_DETALLE');
        end;
     end
     else
     begin
        if (LeeParametro('RECCPVE001') = 'N') then
           ShowMessage(Format(_('La fecha de registro: %s no corresponde al ejercicio actual'), [FormatDateTime(ShortDateFormat, QMCarteraFECHA_REGISTRO.AsDateTime)]))
        else
           ShowMessage(Format(_('La fecha de vencimiento: %s no corresponde al ejercicio actual'), [FormatDateTime(ShortDateFormat, QMCarteraDetalleVENCIMIENTO.AsDateTime)]));
        Abort;
     end;
  end
  else
  begin
     ShowMessage(Format(_('Este vencimiento pertenece a un confirming. (Confirming %d)'), [QMCarteraDetalleConfirming.AsInteger]));
     Abort;
  end;
end;

procedure TDMCartera.MascarasMoneda;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCarteraMONEDA.AsString, 1);
  QMCarteraLIQUIDO.DisplayFormat := LocalMascaraN;
  QMCarteraC_PAGADA.DisplayFormat := LocalMascaraN;
  QMCarteraBASES.DisplayFormat := LocalMascaraN;
  QMCarteraDetalleLIQUIDO.DisplayFormat := LocalMascaraN;
  QMCarteraIVABASE.DisplayFormat := LocalMascaraN;
  QMCarteraIVAI_IVA.DisplayFormat := LocalMascaraN;
  QMCarteraIVAI_RECARGO.DisplayFormat := LocalMascaraN;

  QMCarteraDetalleLIQUIDO.DisplayFormat := LocalMascaraN;
  QMCarteraDetalleLIQUIDO_CANAL.DisplayFormat := LocalMascaraN;

  xCarteraDetLIQUIDO.DisplayFormat := LocalMascaraN;
  xCarteraDetLIQUIDO_CANAL.DisplayFormat := LocalMascaraN;
end;

procedure TDMCartera.QMCarteraLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMCarteraMONEDA.AsString, 1),
     QMCarteraLIQUIDO.AsFloat);
end;

procedure TDMCartera.DameDatosReciboPagado(var RIC, Pagado, Ejercicio: integer);
begin
  RIC := 0;
  Ejercicio := 0;

  Pagado := QMCarteraDetallePAGADO.AsInteger;

  if (QMCarteraDetalleREMESA.AsInteger < 1) then
  begin
     // SQL.Add('SELECT RIC, FECHA_CIERRE FROM EMP_CARTERA_DETALLE WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE');
     Ejercicio := DameEjercicio(REntorno.Empresa, QMCarteraDetalleFECHA_CIERRE.AsDateTime);
     RIC := QMCarteraDetalleRIC.AsInteger;
     {
     if (LeeParametro('RECCPVE001') = 'S') then
        Ejercicio := DameEjercicio(REntorno.Empresa, QMCarteraDetalleVENCIMIENTO.AsDateTime)
     else
        Ejercicio := DameEjercicio(REntorno.Empresa, QMCarteraFECHA_REGISTRO.AsDateTime);
     }
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT A.RIC, A.EJERCICIO FROM EMP_CARTERA_DETALLE D ');
           SQL.Add(' JOIN EMP_CARTERA_REMESAS_ABONOS A ON ');
           SQL.Add(' A.EMPRESA = D.EMPRESA AND A.EJERCICIO = D.EJERCICIO_ABONO AND A.CANAL = D.CANAL AND A.ABONO = D.ABONO ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.ID_CARTERA_DETALLE = :ID_CARTERA_DETALLE ');
           Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMCarteraDetalleID_CARTERA_DETALLE.AsInteger;
           ExecQuery;
           RIC := FieldByName['RIC'].AsInteger;
           // Si es una remesa Ejercicio sera 0 y lo tomo de EMP_CARTERA_REMESAS_ABONOS
           if (Ejercicio = 0) then
              Ejercicio := FieldByName['EJERCICIO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMCartera.DameDatosReciboRecibido(var RICRecibido, Recibido, Ejercicio: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT RIC_RECIBIDO FROM EMP_CARTERA_DETALLE WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE';
        Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMCarteraDetalleID_CARTERA_DETALLE.AsInteger;
        ExecQuery;
        RICRecibido := FieldByName['RIC_RECIBIDO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Recibido := QMCarteraDetalleRECIBIDO.AsInteger;
  Ejercicio := DameEjercicio(REntorno.Empresa, QMCarteraDetalleFECHA_RECIBIDO.AsDateTime);
end;

procedure TDMCartera.FiltraReciboQueAgrupa;
var
  s : string;
begin
  /// Filtra el Dataset para mostrar los recibos que agrupan el recibo actual
  /// Si este recibo no pertenece a ninguna agrupación, solo dara un mensaje de error.
  /// Si está agrupado con otro signo, lo mostrará de todas formas.

  with TFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(nil);
        try
           Transaction.DefaultDataBase := DMMain.DataBase;
           Transaction.StartTransaction;
           SQL.Text := 'SELECT SIGNO, ID_CARTERA FROM EMP_CARTERA_DOCUMENTO WHERE ID_CARTERA_REC = ?ID_CARTERA_REC';
           Params.ByName['ID_CARTERA_REC'].AsInteger := QMCarteraID_CARTERA.AsInteger;
           ExecQuery;

           // Formo filtro SQL (ID_CARTERA=n1 AND SINGO='S1') OR (ID_CARTERA=n2 AND SINGO='S2') OR ...
           s := '';
           if (not EOF) then
              s := ' (ID_CARTERA = ' + FieldByName['ID_CARTERA'].AsString + ' AND SIGNO = ''' + FieldByName['SIGNO'].AsString + ''')';
           Next;
           while (not EOF) do
           begin
              s := s + ' OR (ID_CARTERA = ' + FieldByName['ID_CARTERA'].AsString + ' AND SIGNO = ''' + FieldByName['SIGNO'].AsString + ''')';
              Next;
           end;

           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  if (s <> '') then
  begin
     with QMCartera do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA ');
        SelectSQL.Add(' WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL ');
        SelectSQL.Add(' AND (' + s + ') ');
        SelectSQL.Add(' ORDER BY EJERCICIO, REGISTRO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Open;
     end;
  end
  else
     ShowMessage(_('Este recibo no está agrupado'));
end;

procedure TDMCartera.QMCarteraDetalleTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // Titulo de la cuenta en el ejercicio del vencimiento
  Text := DameTituloCuenta(QMCarteraDetalleCTA_PAGO.AsString, DameEjercicio(REntorno.Empresa, QMCarteraDetalleVENCIMIENTO.AsDateTime));
end;

procedure TDMCartera.QMCarteraTIPO_ASIENTO_KRIChange(Sender: TField);
begin
  if (Self.Signo = 'C') then
     REntorno.Asiento_CAR_C := Sender.AsString
  else
     REntorno.Asiento_CAR_P := Sender.AsString;
end;

function TDMCartera.ControlaCuentaDetalle(Cuenta: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT EMPRESA FROM CON_CUENTAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' CUENTA = ?CUENTA AND ');
        SQL.Add(' PGC = ?PGC AND ');
        SQL.Add(' TIPO = 5 ');
        Params.ByName['EMPRESA'].AsInteger := QMCarteraDETALLEEMPRESA.AsInteger;
        if (LeeParametro('RECCPVE001') = 'N') then
           Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(REntorno.Empresa, QMCarteraFECHA_REGISTRO.AsDateTime)
        else
           Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(REntorno.Empresa, QMCarteraDetalleVENCIMIENTO.AsDateTime);
        Params.ByName['CANAL'].AsInteger := QMCarteraDETALLECANAL.AsInteger;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['PGC'].AsInteger := REntorno.PGC;
        ExecQuery;
        Result := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCartera.QMCarteraDetalleVENCIMIENTOChange(Sender: TField);
var
  EjercicioRegistro, EjercicioVencimiento : integer;
begin
  EjercicioVencimiento := DameEjercicio(QMCarteraEMPRESA.AsInteger, QMCarteraDetalleVENCIMIENTO.AsDateTime);
  EjercicioRegistro := DameEjercicio(QMCarteraEMPRESA.AsInteger, QMCarteraFECHA_REGISTRO.AsDateTime);

  if (EjercicioVencimiento < EjercicioRegistro) then
     raise Exception.Create(_('El Ejercicio del Vencimiento no puede ser menor al del Registro.'));
end;

procedure TDMCartera.xCarteraDetNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCartera.xCarteraDetBeforeEdit(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCartera.AbrexCarteraDet(Signo: string; Importe, Masmenos: double; IncPag: boolean; IncInvisibles: boolean = False);
begin
  with xCarteraDet do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ECD.*, CC.TITULO FROM EMP_CARTERA_DETALLE ECD ');
     SelectSQL.Add(' LEFT JOIN EMP_CARTERA VC ON (VC.ID_CARTERA = ECD.ID_CARTERA) ');
     SelectSQL.Add(' LEFT JOIN CON_CUENTAS CC ON ((VC.EMPRESA = CC.EMPRESA)AND(VC.EJERCICIO = CC.EJERCICIO)AND ');
     SelectSQL.Add('                             (VC.CANAL = CC.CANAL)AND(VC.CUENTA = CC.CUENTA)AND(VC.CUENTA_PGC = CC.PGC)) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ECD.EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' ECD.EJERCICIO <= ?EJERCICIO AND ');
     SelectSQL.Add(' ECD.CANAL = ?CANAL AND ');
     SelectSQL.Add(' ECD.SIGNO = ?SIGNO ');

     if MasMenos = 0 then
        SelectSQL.Add(' AND ECD.LIQUIDO = ' + FloatToStrDec(Importe, '.'))
     else
        SelectSQL.Add(' AND ECD.LIQUIDO >= ' + FloatToStrDec(Importe - masmenos, '.') +
           ' AND ECD.LIQUIDO <= ' + FloatToStrDec(Importe + masmenos, '.'));
     if not IncPag then
        SelectSQL.Add(' AND ECD.PAGADO = 0');
     if not IncInvisibles then
        SelectSQL.Add(' AND ECD.VISIBLE = 1 ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Open;
  end;
end;

function TDMCartera.HayDatosBusqueda: boolean;
begin
  Result := not (xCarteraDet.RecordCount = 0);
end;

function TDMCartera.PerteneceAgrupacion: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) ID_CARTERA FROM EMP_CARTERA_DOCUMENTO WHERE ID_CARTERA_REC = ?ID_CARTERA_REC';
        Params.ByName['ID_CARTERA_REC'].AsInteger := QMCarteraID_CARTERA.AsInteger;
        ExecQuery;
        Result := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCartera.DatosRegistro;
begin
  {Si cambia algo aca, cambiar tambien en UDMOrdenesDePago}
  if (QMCarteraDOC_TIPO.AsString = 'NRP') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT NOMBRE, CLAVE_BANCO, NUMERO_SUCURSAL, DIGITO_CONTROL, NUMERO_CUENTA, ');
           SQL.Add(' NIF, IMPORTE, TEXTO, CNUMCENTRAL, CPOLIZA ');
           SQL.Add(' FROM IMP_SANTA_LUCIA_3 ');
           SQL.Add(' WHERE ID_CARTERA = ?ID_CARTERA ');
           Params.ByName['ID_CARTERA'].AsInteger := QMCarteraID_CARTERA.AsInteger;
           ExecQuery;
           if (Trim(FieldByName['NOMBRE'].AsString) > '') then
           begin
              ShowMessage(_('Nombre') + ' : ' + FieldByName['NOMBRE'].AsString + #13#10 +
                 _('Banco') + ' : ' + FieldByName['CLAVE_BANCO'].AsString + '-' + FieldByName['NUMERO_SUCURSAL'].AsString + '-' + FieldByName['DIGITO_CONTROL'].AsString + '-' + FieldByName['NUMERO_CUENTA'].AsString + #13#10 +
                 _('NIF') + ' : ' + FieldByName['NIF'].AsString + #13#10 +
                 _('Importe') + ' : ' + FieldByName['IMPORTE'].AsString + #13#10 +
                 _('Texto') + ' : ' + FieldByName['TEXTO'].AsString + #13#10 +
                 _('Num. Central') + ' : ' + FieldByName['CNUMCENTRAL'].AsString + #13#10 +
                 _('Num. Poliza') + ' : ' + FieldByName['CPOLIZA'].AsString);
           end;
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
           SQL.Text := 'SELECT * FROM IMP_SANTA_LUCIA_1 WHERE ID_E=?ID_E';
           Params.ByName['ID_E'].AsInteger := QMCarteraID_DOC.AsInteger;
           ExecQuery;
           if (Trim(FieldByName['NOMBRE'].AsString) > '') then
           begin
              ShowMessage(_('Nombre') + ' : ' + FieldByName['NOMBRE'].AsString + #13#10 +
                 _('Banco') + ' : ' + FieldByName['CLAVE_BANCO'].AsString + '-' + FieldByName['NUMERO_SUCURSAL'].AsString + '-' + FieldByName['DIGITO_CONTROL'].AsString + '-' + FieldByName['NUMERO_CUENTA'].AsString + #13#10 +
                 _('NIF') + ' : ' + FieldByName['NIF'].AsString + #13#10 +
                 _('Importe') + ' : ' + FieldByName['IMPORTE'].AsString + #13#10 +
                 _('Num. Factura') + ' : ' + FieldByName['NUMFACTU'].AsString + #13#10 +
                 _('Direccion') + ' : ' + FieldByName['DIRECCION_1'].AsString + ' ' + FieldByName['DIR_NUMERO'].AsString + ' ' + FieldByName['DIR_PISO'].AsString + ' ' + FieldByName['DIR_PUERTA'].AsString + ' ' + FieldByName['DIR_BLOQUE'].AsString + #13#10 +
                 _('Poblacion') + ' : (' + FieldByName['CODIGO_POSTAL'].AsString + ') ' + FieldByName['POBLACION'].AsString + #13#10 +
                 _('Telefono') + ' : ' + FieldByName['TELEFONO_1'].AsString + ' - ' + FieldByName['TELEFONO_2'].AsString + ' - Fax ' + FieldByName['FAX'].AsString);
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMCartera.FiltraCartera(Ejercicio, Canal: smallint; Signo: char; Registro: integer);
begin
  // Filtra por PK, es decir, muestra un registro concreto
  with QMCartera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SIGNO = ?SIGNO AND ');
     SelectSQL.Add(' REGISTRO = ?REGISTRO ');
     SelectSQL.Add(' ORDER BY EJERCICIO, REGISTRO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['REGISTRO'].AsInteger := Registro;
     Open;
  end;
end;

procedure TDMCartera.InicializaQMCartera(Signo: string);
begin
  QMCartera.Close;
  QMCartera.SelectSQL.Assign(SQLbase);

  DMMain.FiltraTabla(QMCartera, '10100', False);

  // El open de la tabla se realiza dentro de este procedimiento
  FiltraSigno(Signo);
end;

procedure TDMCartera.SetPGCBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['PGC'].AsInteger :=
     DamePgc(REntorno.Empresa, QMCarteraEJERCICIO.AsInteger, QMCarteraCANAL.AsInteger);
end;

procedure TDMCartera.QMCarteraDetalleDOCUMENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMCarteraDetalleSIGNO.AsString = 'P') then
  begin
     if (QMCarteraDetalleDOC_AUTOMATICO.AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT T.TALON, T.TALON_PAPEL FROM EMP_CARTERA_DETALLE D ');
              SQL.Add(' JOIN EMP_CARTERA_TALONES T ');
              SQL.Add(' ON D.EMPRESA=T.EMPRESA AND D.CANAL=T.CANAL AND D.DOCUMENTO=T.TALON ');
              SQL.Add(' WHERE D.ID_CARTERA_DETALLE=' + QMCarteraDetalleID_CARTERA_DETALLE.AsString);
              ExecQuery;
              Text := _('Tal.') + Trim(FieldByName['TALON_PAPEL'].AsString) + ' (' + Trim(FieldByName['TALON'].AsString) + ')';
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     if (QMCarteraDetalleDOC_AUTOMATICO.AsInteger = 2) then
        Text := _('Pag.') + Trim(QMCarteraDetalleDOCUMENTO.AsString)
     else
        Text := Trim(QMCarteraDetalleDOCUMENTO.AsString);
  end
  else
  begin
     if (QMCarteraDetalleDOC_AUTOMATICO.AsInteger = 3) then
        Text := Trim(QMCarteraDetalleDOCUMENTO.AsString);
  end;
end;

procedure TDMCartera.AbreRegistroBuscado;
var
  sSigno : string;
  cSigno : char;
begin
  if (xCarteraDet.Active) or (not xCarteraDet.IsEmpty) then
  begin
     // Necesito enviar un char
     sSigno := xCarteraDet.FieldByName('SIGNO').AsString;
     cSigno := sSigno[1];
     FMain.MuestraCartera(xCarteraDet.FieldByName('EJERCICIO').AsInteger,
        xCarteraDet.FieldByName('CANAL').AsInteger, cSigno, xCarteraDet.FieldByName('REGISTRO').AsInteger);
  end;
end;

procedure TDMCartera.QMCarteraBeforeClose(DataSet: TDataSet);
begin
  QMCarteraDetalle.Close;
end;

procedure TDMCartera.FiltraCartera(Signo: char; ListaId: string);
begin
  /// Filtra los registros que pertenezcan a esta empresa dentro de la lista de ID_CARTERA
  /// ListaId es un string que contiene numeros correspondientes a ID_CARTERA separados por coma

  with QMCartera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SIGNO = ?SIGNO ');
     SelectSQL.Add(' AND ID_CARTERA IN (' + ListaId + ') ');
     SelectSQL.Add(' ORDER BY EJERCICIO, REGISTRO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Open;
  end;
end;

end.
