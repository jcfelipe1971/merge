unit ZUDMTalones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBQuery, HYFIBQuery,
  FIBDatabase, UFIBModificados, FIBDataSetRO;

type
  TZDMTalones = class(TDataModule)
     TLocal: THYTransaction;
     QTemp: THYFIBQuery;
     QMCabecera: TFIBTableSet;
     QMCobros: TFIBTableSet;
     QMAnticipos: TFIBTableSet;
     QMPagos: TFIBTableSet;
     DSCabecera: TDataSource;
     DsCobros: TDataSource;
     DsAnticipos: TDataSource;
     DsPagos: TDataSource;
     QMCabeceraID: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraTALON: TFIBStringField;
     QMCabeceraDESCRIPCION: TFIBStringField;
     QMCabeceraBANCO: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraLUGAR: TFIBStringField;
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
     QMCobrosID_CAB_Z_TALONES: TIntegerField;
     QMCobrosMARCADO: TIntegerField;
     QMPagosID_CAB_Z_TALONES: TIntegerField;
     QMPagosMARCADO: TIntegerField;
     DSxTerceros: TDataSource;
     xTerceros: TFIBDataSetRO;
     xTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     DSxEstado: TDataSource;
     xEstado: TFIBDataSetRO;
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
     QMAnticiposID_CAB_Z_TALONES: TIntegerField;
     QMAnticiposMARCADO: TIntegerField;
     QMAnticiposP_anticipos: TFloatField;
     xCuenta: TFIBDataSetRO;
     xCuentaCUENTA: TFIBStringField;
     xCuentaTITULO: TFIBStringField;
     DSxCuenta: TDataSource;
     QMCabeceraIMPORTE: TFloatField;
     QMCabeceraCUENTA: TFIBStringField;
     QMCabeceraDiferencia: TFloatField;
     QMCobrosAbrirCartera: TIntegerField;
     QMPagosAbrir_Cartera: TIntegerField;
     QMCabeceraCUENTA_COBRO: TFIBStringField;
     XCuentaCobro: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     FIBStringField2: TFIBStringField;
     DSxCuentaCobro: TDataSource;
     QMCabeceraZ_CONTADOR: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraTERCEROChange(Sender: TField);
     procedure QMCabeceraBANCOChange(Sender: TField);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCobrosBeforeOpen(DataSet: TDataSet);
     procedure QMPagosBeforeOpen(DataSet: TDataSet);
     procedure QMCabeceraIDChange(Sender: TField);
     procedure xTercerosBeforeOpen(DataSet: TDataSet);
     procedure xBancosBeforeOpen(DataSet: TDataSet);
     procedure QMCobrosAfterPost(DataSet: TDataSet);
     procedure QMPagosAfterPost(DataSet: TDataSet);
     procedure BeforePostGeneral(DataSet: TDataSet);
     procedure QMCobrosAfterOpen(DataSet: TDataSet);
     procedure QMPagosAfterOpen(DataSet: TDataSet);
     procedure QMAnticiposBeforeOpen(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraCUENTAChange(Sender: TField);
     procedure QMAnticiposBeforePost(DataSet: TDataSet);
     procedure QMPagosBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMCobrosAfterScroll(DataSet: TDataSet);
     procedure QMAnticiposAfterScroll(DataSet: TDataSet);
     procedure QMPagosAfterScroll(DataSet: TDataSet);
     procedure QMPagosAbrir_CarteraChange(Sender: TField);
     procedure QMCobrosAbrirCarteraChange(Sender: TField);
     procedure QMCabeceraCUENTA_COBROChange(Sender: TField);
  private
     procedure CalculaPrecios;
     procedure MontaSelectCobros;
     procedure Refresca;
     procedure MontaSelectPagos;
     procedure MontaSelectAnticipos;
     { Private declarations }
  public
     { Public declarations }
     procedure AbreCartera;
     procedure Bloquear;
     procedure Marcar_Todos;
  end;

var
  ZDMTalones : TZDMTalones;

implementation

uses UDMMain, UUtiles, UEntorno, uFBusca, UFMCartera, ZUFMTalones, UFParada;

{$R *.dfm}

{Todo : Utilizar TLocal/TUpdate}

procedure TZDMTalones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCabecera, '111000', True);
end;

procedure TZDMTalones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  Refresca;
end;

procedure TZDMTalones.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  //Generamos el contador de procesos automaticos
  DMMain.Contador_Gen(QMCabecera, 'ID_Z_TALONES', 'ID');

  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraFECHA.AsDateTime := Date;
end;

procedure TZDMTalones.QMCabeceraTERCEROChange(Sender: TField);
begin
  xTerceros.Close;
  xTerceros.Open;
end;

procedure TZDMTalones.QMCabeceraBANCOChange(Sender: TField);
begin
  xBancos.Close;
  xBancos.Open;
end;

procedure TZDMTalones.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  Refresca;
end;

procedure TZDMTalones.Refresca;
begin
  //Detalle
  QMPagos.Close;
  QMPagos.Open;

  //Calculos de pagos, cobros y anticipos
  QMCobros.Close;
  QMCobros.Open;

  QMPagos.Close;
  QMPagos.Open;

  //Descripciones
  xEstado.Close;
  xEstado.Open;

  xBancos.Close;
  xBancos.Open;

  xTerceros.Close;
  xTerceros.Open;

  xCuenta.Close;
  xCuenta.Open;

  CalculaPrecios;
end;

procedure TZDMTalones.QMCobrosBeforeOpen(DataSet: TDataSet);
begin
  MontaSelectCobros;
end;

procedure TZDMTalones.MontaSelectCobros;
begin
  with QMCobros do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := 'select * from emp_cartera_detalle ' +
        'where empresa=?empresa ' +
        'and ejercicio=?ejercicio ' +
        'and canal=?canal ' +
        'and signo=?signo ' +
        'and pagado<>1    ' +
        'and ((marcado = 0) or ((marcado=1) ' +
        'and (ID_CAB_Z_TALONES=?ID_CAB))) ' +
        'and id_Cartera in ' +
        '(select id_cartera from emp_cartera ' +
        'where cod_cli_pro in (select cliente ' +
        'from emp_clientes where tercero =?tercero))';

     Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['tercero'].AsInteger := QMCabeceraTERCERO.AsInteger;
     Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
     Params.ByName['signo'].AsString := 'C';
  end;

  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     with QMCobros do
     begin
        Close;
        SelectSQL.Text := 'select * from emp_cartera_detalle ' +
           'where empresa=?empresa ' +
           'and ejercicio=?ejercicio ' +
           'and canal=?canal ' +
           'and signo=?signo ' +
           'and (ID_CAB_Z_TALONES=?ID_CAB) ';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['signo'].AsString := 'C';
     end;
  end;
end;

procedure TZDMTalones.MontaSelectPagos;
begin
  with QMPagos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := 'select * from emp_cartera_detalle ' +
        'where empresa=?empresa ' +
        'and ejercicio=?ejercicio ' +
        'and canal=?canal ' +
        'and signo=?signo ' +
        'and pagado<>1    ' +
        'and ((marcado = 0) or ((marcado=1) ' +
        'and (ID_CAB_Z_TALONES=?ID_CAB))) ' +
        'and id_Cartera in ' +
        '(select id_cartera from emp_cartera ' +
        'where cod_cli_pro in (select proveedor ' +
        'from emp_proveedores where tercero =?tercero))';

     Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['tercero'].AsInteger := QMCabeceraTERCERO.AsInteger;
     Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
     Params.ByName['signo'].AsString := 'P';
  end;

  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     with QMPagos do
     begin
        Close;
        SelectSQL.Text := 'select * from emp_cartera_detalle ' +
           'where empresa=?empresa ' +
           'and ejercicio=?ejercicio ' +
           'and canal=?canal ' +
           'and signo=?signo ' +
           'and (ID_CAB_Z_TALONES=?ID_CAB) ';

        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['signo'].AsString := 'P';
     end;
  end;
end;

procedure TZDMTalones.QMPagosBeforeOpen(DataSet: TDataSet);
begin
  MontaSelectPagos;
end;

procedure TZDMTalones.QMCabeceraIDChange(Sender: TField);
begin
  // Buscar el nuevo estado
  xEstado.Close;
  xEstado.Open;
end;

procedure TZDMTalones.xTercerosBeforeOpen(DataSet: TDataSet);
begin
  xTerceros.Params.ByName['TERCERO'].AsInteger := QMCabeceraTERCERO.AsInteger;
end;

procedure TZDMTalones.xBancosBeforeOpen(DataSet: TDataSet);
begin
  xBancos.Params.ByName['banco'].AsInteger := QMCabeceraBANCO.AsInteger;
  xBancos.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
end;

procedure TZDMTalones.QMCobrosAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  CalculaPrecios;
end;

procedure TZDMTalones.CalculaPrecios;
begin
  QMCobrosC_Pendientes.AsFloat := 0;
  QMPagosP_Pendientes.AsFloat := 0;
  QMAnticiposP_anticipos.AsFloat := 0;
  QMCabeceraDiferencia.AsFloat := 0;

  //Calcular precio cobros
  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'select sum(liquido) as liquido ' +
        'from emp_cartera_detalle ' +
        'where marcado=1 and id_cab_z_talones=?id and signo=?signo';
     Params.ByName['id'].AsInteger := QMCabeceraID.AsInteger;
     Params.ByName['signo'].AsString := 'C';
     ExecQuery;
  end;

  QMCobrosC_Pendientes.AsFloat := QTemp.FieldByName['liquido'].AsFloat;
  QTemp.FreeHandle;

  //Calcular precio pagos
  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'select sum(liquido) as liquido from emp_cartera_detalle ' +
        'where marcado=1 and id_cab_z_talones = ?id and signo=?signo';
     Params.ByName['id'].AsInteger := QMCabeceraID.AsInteger;
     Params.ByName['signo'].AsString := 'P';
     ExecQuery;
  end;

  QMPagosP_Pendientes.AsFloat := QTemp.FieldByName['liquido'].AsFloat;
  QTemp.FreeHandle;

  //Calcular precio anticipos
  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'select sum(cantidad) as liquido from emp_cartera_anticipos ' +
        'where marcado=1 and id_cab_z_talones = ?id';
     Params.ByName['id'].AsInteger := QMCabeceraID.AsInteger;
     ExecQuery;
  end;

  QMAnticiposP_anticipos.AsFloat := QTemp.FieldByName['liquido'].AsFloat;
  QTemp.FreeHandle;

  QMCabeceraDiferencia.AsFloat := QMPagosP_Pendientes.AsFloat +
     QMCobrosC_Pendientes.AsFloat -
     QMAnticiposP_anticipos.AsFloat;

  //Actualizar el precio en BD
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     with QTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Text := 'update z_talones_cab ' +
           'set importe=?importe ' +
           'where id=?id';
        Params.ByName['id'].AsInteger := QMCabeceraID.AsInteger;
        Params.ByName['importe'].AsFloat := QMCabeceraDiferencia.AsFloat;
        ExecQuery;
        FreeHandle;
     end;
  end;
end;

procedure TZDMTalones.QMPagosAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  CalculaPrecios;
end;

procedure TZDMTalones.BeforePostGeneral(DataSet: TDataSet);
begin
  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end;

  if (DataSet.State = dsEdit) then
  begin
     QMCobrosID_CAB_Z_TALONES.AsInteger := QMCabeceraID.AsInteger;
     QMPagosID_CAB_Z_TALONES.AsInteger := QMCabeceraID.AsInteger;
     QMAnticiposID_CAB_Z_TALONES.AsInteger := QMCabeceraID.AsInteger;
  end;
end;

procedure TZDMTalones.QMCobrosAfterOpen(DataSet: TDataSet);
begin
  CalculaPrecios;
end;

procedure TZDMTalones.QMPagosAfterOpen(DataSet: TDataSet);
begin
  CalculaPrecios;
end;

procedure TZDMTalones.MontaSelectAnticipos;
begin
  with QMAnticipos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := 'select * from emp_cartera_anticipos ' +
        'where empresa=?empresa ' +
        'and ejercicio=?ejercicio ' +
        'and canal=?canal ' +
        'and ((marcado = 0) or ((marcado=1) ' +
        'and (ID_CAB_Z_TALONES=?ID_CAB))) ' +
        'and cod_cli_pro in ' +
        '(select proveedor ' +
        'from emp_proveedores where tercero =?tercero)';

     Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['tercero'].AsInteger := QMCabeceraTERCERO.AsInteger;
     Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
  end;

  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     with QMAnticipos do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Text := 'select * from emp_cartera_anticipos ' +
           'where empresa=?empresa ' +
           'and ejercicio=?ejercicio ' +
           'and canal=?canal ' +
           'and ID_CAB_Z_TALONES=?ID_CAB ';
        Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['ejercicio'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['canal'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
     end;
  end;
end;

procedure TZDMTalones.QMAnticiposBeforeOpen(DataSet: TDataSet);
begin
  MontaSelectAnticipos;
end;

procedure TZDMTalones.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  MontaSelectCobros;
  QMCobros.Open;

  MontaSelectPagos;
  QMPagos.Open;

  MontaSelectAnticipos;
  QMAnticipos.Open;
end;

procedure TZDMTalones.AbreCartera;
begin
  {  FMCartera.Create(self).mostrar(QMCabeceraEMPRESA.AsInteger,QMCabeceraEJERCICIO.AsInteger,
      QMCabeceraCANAL.AsInteger,QMCobrosID_CARTERA.AsInteger);}
end;

procedure TZDMTalones.Bloquear;
begin
  //Calcular precio cobros
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     with QTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Text := 'execute procedure z_bloquear_talones(?id_cab)';
        Params.ByName['id_cab'].AsInteger := QMCabeceraID.AsInteger;
        TFParada.Create(Self).ExecQuery(QTemp);
        FreeHandle;
     end;
  end
  else
  begin
     with QTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Text := 'execute procedure z_desbloquear_talones(?id_cab)';
        Params.ByName['id_cab'].AsInteger := QMCabeceraID.AsInteger;
        TFParada.Create(Self).ExecQuery(QTemp);
        FreeHandle;
     end;
  end;
  QMCabecera.Refresh;
  Refresca;
end;

procedure TZDMTalones.QMCabeceraCUENTAChange(Sender: TField);
begin
  xCuenta.Close;
  xCuenta.Open;
end;

procedure TZDMTalones.QMAnticiposBeforePost(DataSet: TDataSet);
begin
  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end;
end;

procedure TZDMTalones.QMPagosBeforePost(DataSet: TDataSet);
begin
  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end;
end;

procedure TZDMTalones.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'update emp_cartera_detalle ' +
        'set marcado=0,id_cab_z_talones=0 ' +
        'where id_cab_z_talones = ?id ';
     Params.ByName['id'].AsInteger := QMCabeceraID.AsInteger;
     ExecQuery;
     FreeHandle;
  end;

  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'update emp_cartera_anticipos ' +
        'set marcado=0,id_cab_z_talones=0 ' +
        'where id_cab_z_talones = ?id ';
     Params.ByName['id'].AsInteger := QMCabeceraID.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TZDMTalones.QMCobrosAfterScroll(DataSet: TDataSet);
begin
  CalculaPrecios;
end;

procedure TZDMTalones.QMAnticiposAfterScroll(DataSet: TDataSet);
begin
  CalculaPrecios;
end;

procedure TZDMTalones.QMPagosAfterScroll(DataSet: TDataSet);
begin
  CalculaPrecios;
end;

procedure TZDMTalones.QMPagosAbrir_CarteraChange(Sender: TField);
begin
  if (QMPagosAbrir_Cartera.AsInteger = 1) then
     ZFMTalones.AbreCarteraPagos;
end;

procedure TZDMTalones.QMCobrosAbrirCarteraChange(Sender: TField);
begin
  if (QMCobrosAbrirCartera.AsInteger = 1) then
     ZFMTalones.AbreCarteraCobros;
end;

procedure TZDMTalones.QMCabeceraCUENTA_COBROChange(Sender: TField);
begin
  xCuentaCobro.Close;
  xCuentaCobro.Open;
end;

procedure TZDMTalones.Marcar_Todos;
begin
  // cobros
  with QTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'execute procedure z_marcar_talones(?id)';
     Params.ByName['id'].AsInteger := QMCabeceraID.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  Refresca;
end;

end.
