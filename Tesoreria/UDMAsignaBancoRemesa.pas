unit UDMAsignaBancoRemesa;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBQuery, HYFIBQuery, FIBDataSetRO, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados;

type
  TDMAsignaBancoRemesa = class(TDataModule)
     TLocal: THYTransaction;
     xCarteraDetalle: TFIBTableSet;
     xBancos: TFIBDataSetRO;
     DSxCarteraDetalle: TDataSource;
     DSxBancos: TDataSource;
     xBancoCliente: TFIBDataSetRO;
     xCliente: TFIBDataSetRO;
     xCarteraDetalleCOD_CLI_PRO: TIntegerField;
     xCarteraDetalleVENCIMIENTO: TDateTimeField;
     xCarteraDetalleLIQUIDO: TFloatField;
     xCarteraDetalleFORMA_PAGO: TFIBStringField;
     xCarteraDetalleDOC_NUMERO: TIntegerField;
     xCarteraDetalleDOC_SERIE: TFIBStringField;
     xCarteraDetalleDOC_FECHA: TDateTimeField;
     xCarteraDetalleBANCO_KRI: TIntegerField;
     xCarteraDetalleRECIBIDO: TIntegerField;
     xBancoClienteTITULO: TFIBStringField;
     DSxCliente: TDataSource;
     DSxBancoCliente: TDataSource;
     xFormaPago: TFIBDataSetRO;
     xFormaPagoTITULO: TFIBStringField;
     DSxFormaPago: TDataSource;
     DSxDireccionCliente: TDataSource;
     xDireccionCliente: TFIBDataSetRO;
     xDireccionClienteDIR_COMPLETA: TFIBStringField;
     xDireccionClienteTITULO: TFIBStringField;
     xBancosBANCO: TIntegerField;
     xBancosTITULO: TFIBStringField;
     xBancosEUROS: TFloatField;
     xCarteraDetalleCANAL: TIntegerField;
     xCarteraDetalleEJERCICIO: TIntegerField;
     xCarteraDetalleEMPRESA: TIntegerField;
     xCarteraDetalleSIGNO: TFIBStringField;
     xCarteraDetalleREGISTRO: TIntegerField;
     xCarteraDetalleLINEA: TIntegerField;
     xClienteNOMBRE_R_SOCIAL: TFIBStringField;
     xClienteTERCERO: TIntegerField;
     xCarteraDetalleEJERCICIO_CARTERA: TIntegerField;
     xCarteraDetalleORIGEN_IMPAGADO: TIntegerField;
     xCarteraDetalleCTA_PAGO: TFIBStringField;
     xCarteraDetalleLIQUIDO_CANAL: TFloatField;
     xCarteraDetallePAGADO: TIntegerField;
     xCarteraDetalleIMPAGADO: TIntegerField;
     xCarteraDetalleTIPO_EFECTO: TFIBStringField;
     xCarteraDetalleACEPTADO: TIntegerField;
     xCarteraDetalleREMESAR: TIntegerField;
     xCarteraDetalleESTADO: TIntegerField;
     xCarteraDetalleREMESA: TIntegerField;
     xCarteraDetalleDOC_TIPO: TFIBStringField;
     xCarteraDetalleRIC: TIntegerField;
     xCarteraDetalleRIVA: TIntegerField;
     xCarteraDetalleFECHA_CIERRE: TDateTimeField;
     xCarteraDetalleESTADO_RECIBO: TFIBStringField;
     xCarteraDetalleFECHA_REGISTRO: TDateTimeField;
     xCarteraDetalleMONEDA: TFIBStringField;
     xCarteraDetalleMONEDA_CANAL: TFIBStringField;
     xCarteraDetalleFP_TITULO: TFIBStringField;
     xCarteraDetalleFECHA_VALOR: TDateTimeField;
     xCarteraDetalleABONO: TIntegerField;
     xCarteraDetalleEJERCICIO_ABONO: TIntegerField;
     xCarteraDetalleTITULO: TFIBStringField;
     xCarteraDetallePAIS: TFIBStringField;
     xCarteraDetalleNOMBRE_COMERCIAL: TFIBStringField;
     xCarteraDetalleNOMBRE_R_SOCIAL: TFIBStringField;
     xCarteraDetalleTERCERO: TIntegerField;
     xCarteraDetalleID_CARTERA: TIntegerField;
     xCarteraDetalleID_CARTERA_DETALLE: TIntegerField;
     xCarteraDetalleID_DOC: TIntegerField;
     xCarteraDetalleID_REMESAS: TIntegerField;
     TUpdate: THYTransaction;
     procedure xBancosEUROSGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DMAsignaBancoRemesaCreate(Sender: TObject);
     procedure xCarteraDetalleAfterPost(DataSet: TDataSet);
     procedure DMAsignaBancoRemesaDestroy(Sender: TObject);
     procedure xCarteraDetalleAfterOpen(DataSet: TDataSet);
     procedure xCarteraDetalleBeforeClose(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     banco_a_calcular: integer;
  public
     { Public declarations }
     procedure FiltraAgrupacion(Agrupacion: string);
  end;

var
  DMAsignaBancoRemesa : TDMAsignaBancoRemesa;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMAsignaBancoRemesa.xBancosEUROSGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  Q : THYFIBQuery;
begin
  if ((banco_a_calcular = -1) or (banco_a_calcular = xBancosBANCO.AsInteger)) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(DET.LIQUIDO) AS EUROS FROM EMP_CARTERA_DETALLE DET ' +
           'LEFT JOIN EMP_CARTERA CAR ON (DET.ID_CARTERA = CAR.ID_CARTERA) ' +
           'LEFT JOIN CON_CUENTAS_GES_FP FP ON ((CAR.EMPRESA=FP.EMPRESA)AND ' +
           '(CAR.EJERCICIO=FP.EJERCICIO)AND(CAR.CANAL=FP.CANAL)AND(CAR.FORMA_PAGO=FP.FORMA_PAGO)) ' +
           'WHERE ' +
           '(DET.VISIBLE=1) AND DET.EMPRESA = ?EMPRESA AND DET.CANAL = ?CANAL AND ' +
           'DET.SIGNO = ''C'' AND DET.REMESA = 0 AND DET.PAGADO = 0 AND ' +
           '(FP.ACEPTAR = 0 OR (FP.ACEPTAR = 1 AND DET.RECIBIDO = 0)) AND ' +
           'DET.BANCO_KRI=?BANCO_KRI';
        Params.ByName['EMPRESA'].AsInteger := xCarteraDetalleEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := xCarteraDetalleCANAL.AsInteger;
        Params.ByName['BANCO_KRI'].AsInteger := xBancosBANCO.AsInteger;
        ExecQuery;
        Text := FormatFloat(',0.00', FieldByName['EUROS'].AsFloat);
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMAsignaBancoRemesa.DMAsignaBancoRemesaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  FiltraAgrupacion('');
  banco_a_calcular := -1;
  xBancos.Close;
  xBancos.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xBancos.Open;
end;

procedure TDMAsignaBancoRemesa.xCarteraDetalleAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
  xBancos.Close;
  xBancos.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xBancos.Open;
end;

procedure TDMAsignaBancoRemesa.DMAsignaBancoRemesaDestroy(Sender: TObject);
begin
  if TLocal.InTransaction then
     TLocal.Commit;
  if TUpdate.InTransaction then
     TUpdate.Commit;
end;

procedure TDMAsignaBancoRemesa.xCarteraDetalleAfterOpen(DataSet: TDataSet);
begin
  xCliente.Close;
  xCliente.Open;
  xFormaPago.Close;
  xFormaPAgo.Open;

  {Dependen de xCliente}
  xBancoCliente.Close;
  xBancoCliente.Open;
  xDireccionCliente.Close;
  xDireccionCliente.Open;
end;

procedure TDMAsignaBancoRemesa.xCarteraDetalleBeforeClose(DataSet: TDataSet);
begin
  xCliente.Close;
  xFormaPago.Close;
  {Dependen de xCliente}
  xBancoCliente.Close;
  xDireccionCliente.Close;
end;

procedure TDMAsignaBancoRemesa.xClienteAfterOpen(DataSet: TDataSet);
begin
  {xBancoCliente.Close;
  xBancoCliente.Open;
  xDireccionCliente.Close;
  xDireccionCliente.Open;}
end;

procedure TDMAsignaBancoRemesa.xClienteBeforeClose(DataSet: TDataSet);
begin
  {xBancoCliente.Close;
  xDireccionCliente.Close;}
end;

procedure TDMAsignaBancoRemesa.FiltraAgrupacion(Agrupacion: string);
begin
  {Primero verifico que sea una agrupacion valida}
  Agrupacion := Trim(Agrupacion);
  if (Length(Agrupacion) > 3) then
     Agrupacion := '';

  with xCarteraDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_CARTERA_REMESA R');
     if (Agrupacion <> '') then
        SelectSQL.Add('JOIN EMP_AGRUPACIONES_CLI C ON R.EMPRESA=C.EMPRESA AND R.COD_CLI_PRO=C.CLIENTE ');
     SelectSQL.Add('WHERE R.EMPRESA=?EMPRESA AND ');
     SelectSQL.Add('R.EJERCICIO in (?EJERCICIO,0) AND R.CANAL=?CANAL AND R.SIGNO=''C'' AND ');
     SelectSQL.Add('R.PAGADO = 0 AND (R.REMESA = 0 OR R.REMESA is null) ');
     if (DMMain.EstadoKri(109) = 1) then
        SelectSQL.Add('AND R.ORIGEN_IMPAGADO = 0 ');
     if (Agrupacion <> '') then
        SelectSQL.Add('AND C.AGRUPACION=?AGRUPACION');
     SelectSQL.Add('ORDER BY R.VENCIMIENTO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Agrupacion <> '') then
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

end.
