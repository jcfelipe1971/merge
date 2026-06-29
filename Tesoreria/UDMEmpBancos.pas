unit UDMEmpBancos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, DB, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, FIBQuery, FIBDataSetRO, HYFIBQuery,
  Dialogs, Controls;

type
  TDMEmpBancos = class(TDataModule)
     QMEmp_Bancos: TFIBTableSet;
     DSQMEmp_Bancos: TDataSource;
     QMEmp_BancosEMPRESA: TIntegerField;
     QMEmp_BancosEJERCICIO: TIntegerField;
     QMEmp_BancosCANAL: TIntegerField;
     QMEmp_BancosBANCO: TIntegerField;
     QMEmp_BancosTITULO: TFIBStringField;
     QMEmp_BancosSUCURSAL: TFIBStringField;
     QMEmp_BancosCONTROL: TFIBStringField;
     QMEmp_BancosRIESGO_CON: TFloatField;
     QMEmp_BancosRIESGO_UTI: TFloatField;
     QMEmp_BancosACTIVO: TIntegerField;
     QMEmp_BancosCUENTA_CONTABLE: TFIBStringField;
     QMEmp_BancosRIESGO_DIF: TFloatField;
     QMEmp_BancosCUENTA_CC: TFIBStringField;
     QMEmp_BancosCUENTA_AHORRO: TFIBStringField;
     QMEmp_BancosCUENTA_DTO: TFIBStringField;
     QMEmp_BancosENTIDAD: TFIBStringField;
     TLocal: THYTransaction;
     QMEmp_BancosSEPARA_APUNTES: TIntegerField;
     QMEmp_BancosRIESGO_DES: TFloatField;
     QMEmp_BancosRIESGO_CFM: TFloatField;
     QMEmp_BancosCUENTA_CONFIRMING: TFIBStringField;
     QMEmp_BancosTERCERO: TIntegerField;
     QMEmp_BancosCUENTA_GASTOS: TFIBStringField;
     QMEmp_BancosCUENTA_GASTOS_DESCUENTO: TFIBStringField;
     QMEmp_BancosDIA_VALOR: TIntegerField;
     QMEmp_BancosCUENTA_PAGARES: TFIBStringField;
     QMEmp_BancosCUENTAS_GASTOS_PAGARES: TFIBStringField;
     QMEmp_BancosCUENTA_INTERESES: TFIBStringField;
     QMEmp_BancosRIESGO_DES_PAG: TFloatField;
     QMEmp_BancosIBAN: TFIBStringField;
     QMEmp_BancosBIC: TFIBStringField;
     QMEmp_BancosCUENTA_CORRIENTE: TFIBStringField;
     TUpdate: THYTransaction;
     QMEmp_BancosCONTADOR_TALON: TIntegerField;
     QMEmp_BancosCONTADOR_TALON_AUTOMATICO: TIntegerField;
     QMEmp_BancosCUENTA_GASTOS_IMPAGADO: TFIBStringField;
     QMEmp_BancosCEDENTE_CONFIRMING: TFIBStringField;
     QMCendentesPorMoneda: TFIBTableSet;
     DSQMCendentesPorMoneda: TDataSource;
     QMCendentesPorMonedaEMPRESA: TIntegerField;
     QMCendentesPorMonedaBANCO: TIntegerField;
     QMCendentesPorMonedaMONEDA: TFIBStringField;
     QMCendentesPorMonedaCEDENTE: TFIBStringField;
     QMEmp_BancosCODIGO_ORDENANTE: TFIBStringField;
     QMEmp_BancosALFANUMERO: TFIBStringField;
     QMEmp_BancosPAIS: TFIBStringField;
     procedure DMEmp_BancosCreate(Sender: TObject);
     procedure QMEmp_BancosNewRecord(DataSet: TDataSet);
     procedure QMEmp_BancosRIESGO_DIFGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMEmp_BancosBeforePost(DataSet: TDataSet);
     procedure QMEmp_BancosBeforeEdit(DataSet: TDataSet);
     procedure QMEmp_BancosAfterPost(DataSet: TDataSet);
     procedure QMEmp_BancosAfterInsert(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure SetPGCBeforeOpen(DataSet: TDataSet);
     procedure QMCendentesPorMonedaNewRecord(DataSet: TDataSet);
     procedure QMEmp_BancosAfterOpen(DataSet: TDataSet);
     procedure QMEmp_BancosBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     DiasOld: integer;
     SQLBase: TStrings;
     procedure CambiaDiasValor;
     procedure VenceRemesas;
     procedure DesvenceRemesas;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure ActualizaRiesgos;
     procedure FiltraBanco(aFiltro: string);
     procedure ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
  end;

var
  DMEmpBancos : TDMEmpBancos;

implementation

uses UDMMain, UUtiles, uFBusca, UEntorno, UFMFechaVenceRecibos, UFormGest,
  UDMLstCircularizacion, UDMListados;

{$R *.DFM}

procedure TDMEmpBancos.DMEmp_BancosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMEmp_BancosRIESGO_CON.DisplayFormat := MascaraN;
  QMEmp_BancosRIESGO_UTI.DisplayFormat := MascaraN;
  QMEmp_BancosRIESGO_DIF.DisplayFormat := MascaraN;
  QMEmp_BancosRIESGO_DES.DisplayFormat := MascaraN;
  QMEmp_BancosRIESGO_CFM.DisplayFormat := MascaraN;
  QMEmp_BancosRIESGO_DES_PAG.DisplayFormat := MascaraN;

  SQLBase := TStringList.Create;
  SQLBase.Text := QMEmp_Bancos.SelectSQL.Text;

  DMMain.FiltraTabla(QMEmp_Bancos, '11100', True);
end;

procedure TDMEmpBancos.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  SQLBase.Free;
end;

procedure TDMEmpBancos.BusquedaCompleja;
begin
  FiltraBanco('');
  TFBusca.Create(Self).SeleccionaBusqueda(QMEmp_Bancos, '11100');
end;

procedure TDMEmpBancos.QMEmp_BancosNewRecord(DataSet: TDataSet);
begin
  QMEmp_BancosEMPRESA.AsInteger := REntorno.Empresa;
  QMEmp_BancosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEmp_BancosCANAL.AsInteger := REntorno.Canal;
  QMEmp_BancosSEPARA_APUNTES.AsInteger := 0;
  QMEmp_BancosTERCERO.AsInteger := REntorno.Tercero;
  QMEmp_BancosDIA_VALOR.AsInteger := 10;
  QMEmp_BancosCODIGO_ORDENANTE.AsString := '000';
  QMEmp_BancosPAIS.AsString := REntorno.Pais;
end;

procedure TDMEmpBancos.QMEmp_BancosRIESGO_DIFGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(MascaraN, (QMEmp_BancosRIESGO_CON.AsFloat -
     QMEmp_BancosRIESGO_UTI.AsFloat));
end;

procedure TDMEmpBancos.QMEmp_BancosBeforePost(DataSet: TDataSet);
var
  Cuenta : string;
begin
  if ((DataSet.State = dsInsert) and (QMEmp_BancosBANCO.AsInteger = 0)) then
     QMEmp_BancosBANCO.AsInteger := DMMain.Contador_E('XBA');

  Cuenta := QMEmp_BancosCUENTA_CC.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_CC.AsString := ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemCC) +
        QMEmp_BancosBANCO.AsString);

  { El campo CUENTA_CONTABLE debe desaparecer.
  Cuenta := QMEmp_BancosCUENTA_CONTABLE.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_CONTABLE.AsString :=
        ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemEfectosDescontados) +
        QMEmp_BancosBANCO.AsString);
  }
  QMEmp_BancosCUENTA_CONTABLE.AsString := QMEmp_BancosCUENTA_CC.AsString;

  Cuenta := QMEmp_BancosCUENTA_AHORRO.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_AHORRO.AsString :=
        ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemCA) + QMEmp_BancosBANCO.AsString);

  Cuenta := QMEmp_BancosCUENTA_DTO.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_DTO.AsString :=
        ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemDescuentosEfectos) +
        QMEmp_BancosBANCO.AsString);

  Cuenta := QMEmp_BancosCUENTA_PAGARES.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_PAGARES.AsString :=
        ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemDescuentosEfectos) +
        QMEmp_BancosBANCO.AsString);
  {
  Cuenta := QMEmp_BancosCUENTA_GASTOS_IMPAGADO.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_GASTOS_IMPAGADO.AsString :=
        ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemDescuentosEfectos) +
        QMEmp_BancosBANCO.AsString);

  Cuenta := QMEmp_BancosCUENTA_GASTOS.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_GASTOS.AsString :=
        ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemCGASTOS) +
        QMEmp_BancosBANCO.AsString);

  Cuenta := QMEmp_BancosCUENTA_GASTOS_DESCUENTO.AsString;
  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
     QMEmp_BancosCUENTA_GASTOS_DESCUENTO.AsString :=
     ExpandirCadena(DMMain.DameSemillaCuentaGestionMin(SemCGASTOSDes) +
     QMEmp_BancosBANCO.AsString);
}
end;

procedure TDMEmpBancos.ActualizaRiesgos;
begin
  DMMain.AjustaRiesgoConfirming;
end;

procedure TDMEmpBancos.QMEmp_BancosBeforeEdit(DataSet: TDataSet);
begin
  DiasOld := QMEmp_BancosDIA_VALOR.AsInteger;
end;

procedure TDMEmpBancos.QMEmp_BancosAfterPost(DataSet: TDataSet);
begin
  if (DiasOld <> QMEmp_BancosDIA_VALOR.AsInteger) then
     CambiaDiasValor;
end;

procedure TDMEmpBancos.CambiaDiasValor;
begin
  if (DiasOld > QMEmp_BancosDIA_VALOR.AsInteger) then
  begin
     if MessageDlg(_('¿Desea vencer los vencimientos pendientes de contabilizar según su fecha ' +
        'valor?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        VenceRemesas;
  end
  else
  begin
     if MessageDlg(_('¿Desea desvencer los recibos remesados al descuento asociados a este banco que ' +
        #13#10 + 'quedan fuera de los días de valor?'), mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        DesvenceRemesas;
  end;
end;

procedure TDMEmpBancos.DesvenceRemesas;
var
  FechaValor : TDateTime;
  Forzar : boolean;
begin
  FechaValor := DevuelveFechaValor(0, Self, Forzar);

  if (FechaValor <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESVENCE_REMESA_BANCO (?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA_VALOR, ?BANCO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA_VALOR'].AsDateTime := FechaValor;
           Params.ByName['BANCO'].AsInteger := QMEmp_BancosBANCO.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMEmpBancos.VenceRemesas;
var
  FechaValor : TDateTime;
  Forzar : boolean;
begin
  Forzar := False;
  FechaValor := DevuelveFechaValor(1, Self, Forzar);

  if (FechaValor <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_VENCE_REMESA (?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA, ?ENTRADA, ?FORZAR)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := FechaValor;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['FORZAR'].AsInteger := BoolToInt(Forzar);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMEmpBancos.QMEmp_BancosAfterInsert(DataSet: TDataSet);
begin
  DiasOld := QMEmp_BancosDIA_VALOR.AsInteger;
end;

procedure TDMEmpBancos.SetPGCBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['PGC'].AsInteger := REntorno.PGC;
end;

procedure TDMEmpBancos.QMCendentesPorMonedaNewRecord(DataSet: TDataSet);
begin
  QMCendentesPorMonedaEMPRESA.AsInteger := QMEmp_BancosEMPRESA.AsInteger;
  QMCendentesPorMonedaBANCO.AsInteger := QMEmp_BancosBANCO.AsInteger;
end;

procedure TDMEmpBancos.QMEmp_BancosAfterOpen(DataSet: TDataSet);
begin
  QMCendentesPorMoneda.Open;
end;

procedure TDMEmpBancos.QMEmp_BancosBeforeClose(DataSet: TDataSet);
begin
  QMCendentesPorMoneda.Close;
end;

procedure TDMEmpBancos.FiltraBanco(aFiltro: string);
begin
  with QMEmp_Bancos do
  begin
     Close;
     SelectSQL.Clear;
     if (aFiltro = '') then
        SelectSQL.Text := SQLBase.Text
     else
     begin
        SelectSQL.Add(' SELECT * FROM VER_BANCOS_CUENTAS ');
        SelectSQL.Add(' WHERE  ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SelectSQL.Add(' CANAL = ?CANAL ');
        SelectSQL.Add(' AND ' + aFiltro);
        SelectSQL.Add(' ORDER BY BANCO ');
     end;

     DMMain.FiltraTabla(QMEmp_Bancos, '11100', True);
  end;
end;

procedure TDMEmpBancos.ImprimirCircularizacion(Modo: integer; MedianteClienteCorreo, MuestraCuerpo: boolean);
var
  CuerpoMail : TStrings;
  Archivo : string;
  FDesde, FHasta : TDateTime;
begin

  Archivo := format(_('CircularizacionBanco_%d.pdf'), [QMEmp_BancosBANCO.AsInteger]);
  DameMinMax('EJE', FDesde, FHasta);
  AbreData(TDMLstCircularizacion, DMLstCircularizacion);
  DMLstCircularizacion.MostrarListadoBanco(Modo, QMEmp_BancosBANCO.AsInteger, FDesde, FHasta, Archivo);
  CierraData(DMLstCircularizacion);

  // Modo 2 es para enviar por email. Genera un PDF y lo deja en %TEMP%
  if (Modo = 2) then
  begin
     AbreData(TDMListados, DMListados);
     CuerpoMail := TStringList.Create;
     try
        CuerpoMail.Add('Este correo ha sido enviado desde:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('Y contiene el fichero adjunto ' + UpperCase(Archivo));
        CuerpoMail.Add('Correspondiente al documento: ' + _('Circularizacion'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This email has been sent from:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('And contains the attached file ' + UpperCase(Archivo));
        CuerpoMail.Add('Corresponding to the document: ' + _('Circularizacion'));

        if MedianteClienteCorreo then
           DMListados.SendMailTerceroPDF2(QMEmp_Bancos.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMEmp_Bancos.FieldByName('TERCERO').AsInteger, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(QMEmp_Bancos.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Circularizacion'), 'TER', QMEmp_Bancos.FieldByName('TERCERO').AsInteger, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;


end.
