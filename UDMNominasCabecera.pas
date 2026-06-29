unit UDMNominasCabecera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB,
  FIBDataSet, FIBTableDataSet, FIBDataSetRO;

type
  TDMNominasCabecera = class(TDataModule)
     QMNomCab: TFIBTableSet;
     DSQMNomCab: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMNomDet: TFIBTableSet;
     QMNomConcp: TFIBTableSet;
     DSQMNomConcp: TDataSource;
     DSQMNomDet: TDataSource;
     QMNomDetCONCEPTO: TFIBStringField;
     QMNomDetDESCRIPCION: TFIBStringField;
     QMNomDetID: TIntegerField;
     QMNomDetID_CABECERA: TIntegerField;
     QMNomDetID_CONCEPTO: TIntegerField;
     QMNomDetDEVENGO: TFloatField;
     QMNomDetDEDUCCION: TFloatField;
     DSxInfoActualizada: TDataSource;
     xInfoActualizada: TFIBDataSetRO;
     QMNomCabID: TIntegerField;
     QMNomCabEMPRESA: TIntegerField;
     QMNomCabEJERCICIO: TIntegerField;
     QMNomCabCANAL: TIntegerField;
     QMNomCabEMPLEADO: TIntegerField;
     QMNomCabPERIODO: TFIBStringField;
     QMNomCabCERRADO: TIntegerField;
     QMNomCabEJERCICIO_CIERRE: TIntegerField;
     QMNomCabENTRADA: TIntegerField;
     QMNomCabFECHA_INI_PERIODO: TDateTimeField;
     QMNomCabESTADO: TIntegerField;
     QMNomCabFECHA: TDateTimeField;
     QMNomCabFECHA_FIN_PERIODO: TDateTimeField;
     QMNomCabFECHA_COBRO: TDateTimeField;
     QMNomCabTDEVENGO: TFloatField;
     QMNomCabTDEDUCCION: TFloatField;
     QMNomCabPERCIBIR: TFloatField;
     QMNomCabNOMBRE_R_SOCIAL: TFIBStringField;
     QMNomCabNIF: TFIBStringField;
     QMNomCabCATEGORIA: TFIBStringField;
     QMNomCabTERCERO: TIntegerField;
     QMNomCabDEPARTAMENTO: TFIBStringField;
     QMNomCabSECCION: TFIBStringField;
     QMNomCabN_SEGURIDAD_SOCIAL: TFIBStringField;
     QMNomCabINI_CONTRATO: TDateTimeField;
     xInfoActualizadaTDEVENGO: TFloatField;
     xInfoActualizadaTDEDUCCION: TFloatField;
     xInfoActualizadaPERCIBIR: TFloatField;
     xInfoActualizadaESTADO: TIntegerField;
     xInfoActualizadaTITULO_ESTADO: TStringField;
     QMNomCabTITULO_PERIODO: TFIBStringField;
     QMNomCabID_EMPLEADO: TIntegerField;
     QMNomDetCANTIDAD: TFloatField;
     QMNomDetIMPORTE: TFloatField;
     QMNomDetSUJETO_SEG_SOCIAL: TIntegerField;
     QMNomDetLINEA: TIntegerField;
     QMNomDetHaberes: TFIBTableSet;
     DSQMNomDetHaberes: TDataSource;
     QMNomDetHaberesID: TIntegerField;
     QMNomDetHaberesID_CABECERA: TIntegerField;
     QMNomDetHaberesLINEA: TIntegerField;
     QMNomDetHaberesIMPORTE: TFloatField;
     QMNomDetHaberesCODIGO: TFIBStringField;
     QMNomDetHaberesGLOSA: TFIBStringField;
     QMNomDetHaberesCALCULABLE: TIntegerField;
     QMNomDetHaberesES_IMPONIBLE: TIntegerField;
     QMNomDetDescuentos: TFIBTableSet;
     DSQMNomDetDescuentos: TDataSource;
     QMNomDetDescuentosID: TIntegerField;
     QMNomDetDescuentosID_CABECERA: TIntegerField;
     QMNomDetDescuentosLINEA: TIntegerField;
     QMNomDetDescuentosIMPORTE: TFloatField;
     QMNomDetDescuentosCODIGO: TFIBStringField;
     QMNomDetDescuentosGLOSA: TFIBStringField;
     QMNomDetDescuentosCALCULABLE: TIntegerField;
     QMNomDetDescuentosES_PERSONAL: TIntegerField;
     QMNomDetParametros: TFIBTableSet;
     DSQMNomDetParametros: TDataSource;
     QMNomDetParametrosID: TIntegerField;
     QMNomDetParametrosID_CABECERA: TIntegerField;
     QMNomDetParametrosLINEA: TIntegerField;
     QMNomDetParametrosIMPORTE: TFloatField;
     QMNomDetParametrosCODIGO: TFIBStringField;
     QMNomDetParametrosGLOSA: TFIBStringField;
     QMNomDetParametrosCALCULABLE: TIntegerField;
     QMNomDetParametrosDATO_TEXTO: TFIBStringField;
     QMNomDetParametrosDATO_FECHA: TDateTimeField;
     QMNomDetParametrosTIPO_DATO: TFIBStringField;
     xInfoActualizadaDet: TFIBDataSetRO;
     DSxInfoActualizadaDet: TDataSource;
     xInfoActualizadaDetIMPORTEH012: TFloatField;
     xInfoActualizadaDetIMPORTEH013: TFloatField;
     xInfoActualizadaDetIMPORTEH020: TFloatField;
     xInfoActualizadaDetIMPORTED017: TFloatField;
     QMFirmas: TFIBDataSetRO;
     QMFirmasID_FIRMA: TIntegerField;
     QMFirmasNOMBRE: TFIBStringField;
     QMFirmasNIF: TFIBStringField;
     DSQMFirmas: TDataSource;
     QMNomDetHaberesEMPRESA: TIntegerField;
     QMNomDetHaberesEJERCICIO: TIntegerField;
     QMNomDetHaberesCANAL: TIntegerField;
     QMNomDetHaberesES_TOTAL: TIntegerField;
     QMNomDetDescuentosEMPRESA: TIntegerField;
     QMNomDetDescuentosEJERCICIO: TIntegerField;
     QMNomDetDescuentosCANAL: TIntegerField;
     QMNomDetDescuentosES_TOTAL: TIntegerField;
     QMNomDetParametrosEMPRESA: TIntegerField;
     QMNomDetParametrosEJERCICIO: TIntegerField;
     QMNomDetParametrosCANAL: TIntegerField;
     QMNomDetParametrosES_TOTAL: TIntegerField;
     QMNomDetHaberesORDEN_IMPRESION: TIntegerField;
     QMNomDetDescuentosORDEN_IMPRESION: TIntegerField;
     QMNomDetParametrosORDEN_IMPRESION: TIntegerField;
     xInfoActualizadaLISTADO: TIntegerField;
     xInfoActualizadaPAGADO: TIntegerField;
     QMNomCabLISTADO: TIntegerField;
     QMNomCabPAGADO: TIntegerField;
     QMNomCabRIC_CIERRE: TIntegerField;
     QMNomCabEJERCICIO_PAGO: TIntegerField;
     QMNomCabRIC_PAGO: TIntegerField;
     QMNomCabIMP_PAGADO: TFloatField;
     QMNomCabIMP_ANTICIPO: TFloatField;
     QMNomCabCUENTA_PAGO: TFIBStringField;
     QMNomCabFECHA_PAGO: TDateTimeField;
     QMNomDetSIGNO: TIntegerField;
     QMNomDetTIPO_IMPORTE: TIntegerField;
     DSQPagos: TDataSource;
     QPagos: TFIBTableSet;
     QPagosENTRADA_AGRUPACION: TIntegerField;
     QPagosID: TIntegerField;
     QPagosPAGADO: TIntegerField;
     QPagosRUT: TFIBStringField;
     QPagosNOMBRE: TFIBStringField;
     QPagosMOD_PAGO: TIntegerField;
     QPagosCTA_EMPLEADO: TFIBStringField;
     QPagosCUENTA_PAGO: TFIBStringField;
     QPagosFECHA_PAGO: TDateTimeField;
     QPagosCORREO: TFIBStringField;
     QPagosPERIODO: TFIBStringField;
     QPagosEJERCICIO: TIntegerField;
     QPagosRIC_PAGO: TIntegerField;
     QPagosEJERCICIO_PAGO: TIntegerField;
     QPagosESTADO: TIntegerField;
     QPagosMARCA: TIntegerField;
     QPagosEMPRESA: TIntegerField;
     QPagosCANAL: TIntegerField;
     QPagosEMPLEADO: TIntegerField;
     QPagosCERRADO: TIntegerField;
     QPagosEJERCICIO_CIERRE: TIntegerField;
     QPagosENTRADA: TIntegerField;
     QPagosFECHA_INI_PERIODO: TDateTimeField;
     QPagosFECHA: TDateTimeField;
     QPagosFECHA_FIN_PERIODO: TDateTimeField;
     QPagosFECHA_COBRO: TDateTimeField;
     QPagosTDEVENGO: TFloatField;
     QPagosTDEDUCCION: TFloatField;
     QPagosPERCIBIR: TFloatField;
     QPagosLISTADO: TIntegerField;
     QPagosRIC_CIERRE: TIntegerField;
     QPagosIMP_PAGADO: TFloatField;
     QPagosIMP_ANTICIPO: TFloatField;
     QMNomDetTIPO_CONCEPTO: TIntegerField;
     xInfoActualizadaTOTAL_DEDUCCION_CONCEPTO: TFloatField;
     xInfoActualizadaTOTAL_DEVENGO_CONCEPTO: TFloatField;
     xInfoActualizadaTOTAL_PERCIBIR_CONCEPTO: TFloatField;
     QMNomCabFECHA_INGRESO: TDateTimeField;
     QMNomCabAFP: TFIBStringField;
     QMNomCabISAPRE: TFIBStringField;
     QMNomCabPLAN_ISAPRE: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMNomCabAfterOpen(DataSet: TDataSet);
     procedure QMNomCabBeforeClose(DataSet: TDataSet);
     procedure QMNomCabBeforePost(DataSet: TDataSet);
     procedure QMNomCabNewRecord(DataSet: TDataSet);
     procedure QMNomDetNewRecord(DataSet: TDataSet);
     procedure QMNomDetBeforePost(DataSet: TDataSet);
     procedure QMNomCabPERIODOChange(Sender: TField);
     procedure QMNomDetCONCEPTOChange(Sender: TField);
     procedure QMNomDetAfterOpen(DataSet: TDataSet);
     procedure QMNomDetBeforeClose(DataSet: TDataSet);
     procedure QMNomDetAfterPost(DataSet: TDataSet);
     procedure QMNomDetAfterDelete(DataSet: TDataSet);
     procedure QMNomCabAfterPost(DataSet: TDataSet);
     procedure xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMNomDetHaberesBeforePost(DataSet: TDataSet);
     procedure QMNomDetHaberesNewRecord(DataSet: TDataSet);
     procedure QMNomDetDescuentosBeforePost(DataSet: TDataSet);
     procedure QMNomDetDescuentosNewRecord(DataSet: TDataSet);
     procedure QMNomDetHaberesCODIGOChange(Sender: TField);
     procedure QMNomDetDescuentosCODIGOChange(Sender: TField);
     procedure QMNomDetParametrosBeforePost(DataSet: TDataSet);
     procedure QMNomDetParametrosNewRecord(DataSet: TDataSet);
     procedure QMNomDetParametrosCODIGOChange(Sender: TField);
     procedure QMNomDet_HDPAfterPost(DataSet: TDataSet);
     procedure QMNomCabBeforeEdit(DataSet: TDataSet);
     procedure QMNomDetBeforeDelete(DataSet: TDataSet);
     procedure QMNomDetBeforeInsert(DataSet: TDataSet);
     procedure QMNomDetHaberesAfterInsert(DataSet: TDataSet);
     procedure QMNomDetHaberesBeforeDelete(DataSet: TDataSet);
     procedure QMNomDetDescuentosBeforeEdit(DataSet: TDataSet);
     procedure QMNomDetDescuentosBeforeDelete(DataSet: TDataSet);
     procedure QMNomDetParametrosBeforeDelete(DataSet: TDataSet);
     procedure QMNomDetParametrosBeforeEdit(DataSet: TDataSet);
     procedure QMNomDetParametrosBeforeInsert(DataSet: TDataSet);
     procedure QMNomCabBeforeDelete(DataSet: TDataSet);
     procedure QMNomDetBeforeEdit(DataSet: TDataSet);
     procedure QMNomDetHaberesBeforeEdit(DataSet: TDataSet);
     procedure QMNomDetHaberesBeforeInsert(DataSet: TDataSet);
     procedure QMNomDetDescuentosBeforeInsert(DataSet: TDataSet);
     procedure QMNomDetParametrosIMPORTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMNomCabBeforeInsert(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
     DetParametrosFiltro: string;
     DetHaberesFiltro: string;
     DetDescuentosFiltro: string;
     Periodo: string;
     Empleado: integer;
     procedure InfoActualiza;
     procedure RefrescarDetalleCHL;
     function DameSignoConcepto(Concepto: string): integer;
     function DameTituloConcepto(Concepto: string): string;
  public
     procedure BusquedaCompleja;
     procedure Filtrar(Filtro: string);
     procedure FiltraEmpleado(aEmpleado: integer);
     procedure FiltraPeriodo(aPeriodo: string);
     procedure FiltraNominas;
     function DameEmpleadoSegunId(IdEmpleado: integer): integer;
     procedure RecalcularNomina;
     procedure Visualizar(Tipo: integer; Filtro: string);
     procedure SetPagadoNomina(IdCabecera, aEstado: integer);
     procedure SetEstadoNomina(IdCabecera, aEstado: integer);
     procedure SetListado(IdCabecera, aEstado: integer);
     procedure SetCierreNomina(IdCabecera, aEstado: integer);
     function ConstantesCreadas(Periodo: string): boolean;
     procedure ImportarXLS(Archivo, Periodo: string; Log: TStrings);
     procedure InsertaValor(IdNomina: integer; Concepto: string; Importe: double);
     procedure MarcarPagosTodos(Entrada: integer);
     procedure PagarNominasPeriodo(Banco: integer);
     procedure PagaNomina(Id: integer; Fecha: TDateTime; Cuenta: string);
     procedure DespagarPagosSeleccionados;
     procedure DespagarPago(Id: integer);
     function HayMarca: boolean;
     procedure SetDetalleResumido(Resumido: boolean);
  end;

var
  DMNominasCabecera : TDMNominasCabecera;

implementation

uses
  UDMMain, Variants, UUtiles, UEntorno, StrUtils, UFMSeleccion,
  UParam, SEPA, DateUtils, HYFIBQuery, UFMain, UFBusca, Controls,
  FIBQuery, Dialogs, UHojaCalc, UDameDato;

{$R *.dfm}

procedure TDMNominasCabecera.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Máscaras de visualización a los campos numéricos
  AsignaDisplayFormat(QMNomCab, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMNomDet, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMNomDetHaberes, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMNomDetDescuentos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMNomDetParametros, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizadaDet, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QPagos, MascaraN, MascaraI, ShortDateFormat);

  QMNomCabPLAN_ISAPRE.DisplayFormat := MascaraD;

  DetParametrosFiltro := '';
  DetHaberesFiltro := '';
  DetDescuentosFiltro := '';

  SQLBase := TStringList.Create;

  SQLBase.Add(' SELECT  * FROM VER_EMP_NOMINAS_CABECERA ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = ?EMPRESA  AND ');
  SQLBase.Add(' EJERCICIO = ?EJERCICIO AND ');
  SQLBase.Add(' CANAL= ?CANAL ');

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMNomCab.SelectSQL.Text := SQLBase.Text;
  QMNomCab.SelectSQL.Add(' ORDER BY PERIODO DESC, EMPLEADO ');

  DMMain.FiltraTabla(QMNomCab, '111000', False);

  Periodo := '';
end;

procedure TDMNominasCabecera.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMNominasCabecera.QMNomCabAfterOpen(DataSet: TDataSet);
begin
  QMNomDet.Open;
  QMNomDetHaberes.Open;
  QMNomDetDescuentos.Open;
  QMNomDetParametros.Open;
  QMFirmas.Open;
  xInfoActualizada.Open;
  xInfoActualizadaDet.Open;
  QPagos.Open;
end;

procedure TDMNominasCabecera.QMNomCabBeforeClose(DataSet: TDataSet);
begin
  QMNomDet.Close;
  QMNomDetHaberes.Close;
  QMNomDetDescuentos.Close;
  QMNomDetParametros.Close;
  QMFirmas.Close;
  xInfoActualizada.Close;
  xInfoActualizadaDet.Close;
  QPagos.Close;
end;

procedure TDMNominasCabecera.QMNomCabBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_EMP_NOMINAS_CABECERA', 'ID');
end;

procedure TDMNominasCabecera.QMNomCabBeforeInsert(DataSet: TDataSet);
begin
  if (REntorno.Pais = 'CHL') and (not ConstantesCreadas(Periodo)) then
  begin
     QMNomCab.Cancel;
     ShowMessage(_('Antes de crear las nóminas, se deben crear indicadores, constantes y tramos para el periodo ') + Periodo);
  end;
end;

procedure TDMNominasCabecera.QMNomCabNewRecord(DataSet: TDataSet);
begin
  QMNomCabID.AsInteger := 0;
  QMNomCabEMPRESA.AsInteger := REntorno.Empresa;
  QMNomCabEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMNomCabCANAL.AsInteger := REntorno.Canal;
  QMNomCabENTRADA.AsInteger := REntorno.Entrada;
  QMNomCabFECHA.AsDateTime := Now;
  QMNomCabPERIODO.AsString := Periodo;
end;

function TDMNominasCabecera.ConstantesCreadas(Periodo: string): boolean;
var
  Constantes, Tramos, Indicadores : boolean;
begin
  with TFIBDataSet.Create(nil) do
  begin
     DataBase := DMMain.DataBase;
     Transaction := DameTransactionRO(DMMain.DataBase);
     try
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;

        SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_CONSTANTES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND PERIODO = :PERIODO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := Periodo;
        Open;
        Constantes := RecordCount > 0;
        Close;
        Transaction.Commit;
     finally
        Transaction.Free;
     end;
  end;

  with TFIBDataSet.Create(nil) do
  begin
     DataBase := DMMain.DataBase;
     Transaction := DameTransactionRO(DMMain.DataBase);
     try
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        DataBase := DMMain.DataBase;
        SelectSQL.Text := 'SELECT * FROM EMP_NOMINAS_TRAMOS_RENTA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND PERIODO = :PERIODO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := Periodo;
        Open;
        Tramos := RecordCount > 0;
        Close;
        Transaction.Commit;
     finally
        Transaction.Free;
     end;
  end;

  with TFIBDataSet.Create(nil) do
  begin
     DataBase := DMMain.DataBase;
     Transaction := DameTransactionRO(DMMain.DataBase);
     try
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        SelectSQL.Text := 'SELECT * FROM VER_AFP_EQUIVALENCIA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND PERIODO = :PERIODO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := Periodo;
        Open;
        Indicadores := RecordCount > 0;
        Close;
        Transaction.Commit;
     finally
        Transaction.Free;
     end;
  end;

  Result := Constantes and Tramos and Indicadores;
end;

procedure TDMNominasCabecera.QMNomDetNewRecord(DataSet: TDataSet);
begin
  QMNomDetID_CABECERA.AsInteger := QMNomCabID.AsInteger;
end;

procedure TDMNominasCabecera.QMNomDetBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_EMP_NOMINAS_DETALLE', 'ID');
end;

procedure TDMNominasCabecera.QMNomCabPERIODOChange(Sender: TField);
begin
  if not (QMNomCabPERIODO.IsNull) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO, DESDE, HASTA FROM VER_PERIODOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND PERIODO = :PERIODO';
           Params.ByName['EMPRESA'].AsInteger := QMNomCabEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMNomCabEJERCICIO.AsInteger;
           Params.ByName['PERIODO'].AsString := QMNomCabPERIODO.AsString;
           ExecQuery;
           QMNomCabFECHA_INI_PERIODO.AsDateTime := FieldByName['DESDE'].AsDateTime;
           QMNomCabFECHA_FIN_PERIODO.AsDateTime := FieldByName['HASTA'].AsDateTime;
           QMNomCabTITULO_PERIODO.AsString := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMNominasCabecera.QMNomDetCONCEPTOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, DESCRIPCION FROM SYS_NOMINA_CONCEPTOS WHERE CONCEPTO = :CONCEPTO ';
        Params.ByName['CONCEPTO'].AsString := QMNomDetCONCEPTO.AsString;
        ExecQuery;
        QMNomDet.FieldByName('ID_CONCEPTO').AsInteger := FieldByName['ID'].AsInteger;
        QMNomDet.FieldByName('DESCRIPCION').AsString := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominasCabecera.QMNomDetAfterOpen(DataSet: TDataSet);
begin
  QMNomConcp.Open;
end;

procedure TDMNominasCabecera.QMNomDetBeforeClose(DataSet: TDataSet);
begin
  QMNomConcp.Close;
end;

procedure TDMNominasCabecera.QMNomDetAfterPost(DataSet: TDataSet);
begin
  InfoActualiza;
end;

procedure TDMNominasCabecera.QMNomDetAfterDelete(DataSet: TDataSet);
begin
  InfoActualiza;
end;

procedure TDMNominasCabecera.InfoActualiza;
begin
  xInfoActualizada.Close;
  xInfoActualizada.Open;
  xInfoActualizadaDet.Close;
  xInfoActualizadaDet.Open;
end;

procedure TDMNominasCabecera.QMNomCabAfterPost(DataSet: TDataSet);
begin
  InfoActualiza;
end;

procedure TDMNominasCabecera.xInfoActualizadaTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(xInfoActualizadaESTADO.AsInteger);
end;

procedure TDMNominasCabecera.BusquedaCompleja;
var
  Resultado : integer;
begin
  // Filtro
  Resultado := TFBusca.Create(Self).SeleccionaBusqueda(QMNomCab, '111000', False, '');

  with QMNomCab do
  begin
     if (Resultado = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLBase.Text;
        SelectSQL.Add(' ORDER BY PERIODO DESC, EMPLEADO ');
        DMMain.FiltraTabla(QMNomCab, '111000', True);
     end
     else
     begin
        Open;
     end;
  end;
end;

procedure TDMNominasCabecera.Filtrar(Filtro: string);
begin
  with QMNomCab do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     if (Filtro <> '') then
        SelectSQL.Add(' AND (' + Filtro + ') ');
     SelectSQL.Add(' ORDER BY PERIODO DESC, EMPLEADO ');
     DMMain.FiltraTabla(QMNomCab, '111000', False);
     Open;
  end;
end;

function TDMNominasCabecera.DameEmpleadoSegunId(IdEmpleado: integer): integer;
begin
  /// Devuelve el empleado si existe en esta empresa
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPLEADO FROM OPE_EMPLEADO WHERE EMPRESA = :EMPRESA AND ID_EMPLEADO = :ID_EMPLEADO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_EMPLEADO'].AsInteger := IdEmpleado;
        ExecQuery;
        Result := FieldByName['EMPLEADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominasCabecera.FiltraEmpleado(aEmpleado: integer);
begin
  Empleado := aEmpleado;
  FiltraNominas;
end;

procedure TDMNominasCabecera.FiltraPeriodo(aPeriodo: string);
begin
  Periodo := aPeriodo;
  FiltraNominas;
end;

procedure TDMNominasCabecera.FiltraNominas;
begin
  with QMNomCab do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     if (Periodo > '') then
        SelectSQL.Add(' AND PERIODO = :PERIODO ');
     if (Empleado <> 0) then
        SelectSQL.Add(' AND EMPLEADO = :EMPLEADO ');

     SelectSQL.Add(' ORDER BY PERIODO DESC, EMPLEADO ');
     DMMain.FiltraTabla(QMNomCab, '111000', False);

     if (Periodo > '') then
        Params.ByName['PERIODO'].AsString := Periodo;
     if (Empleado <> 0) then
        Params.ByName['EMPLEADO'].AsInteger := Empleado;

     Open;
  end;

  with QPagos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT N.*, T.NOMBRE_R_SOCIAL AS NOMBRE, T.NIF, 3 AS MOD_PAGO, B.CUENTA AS CTA_EMPLEADO, T.EMAIL AS CORREO ');
     SelectSQL.Add(' FROM EMP_NOMINAS_CABECERA N ');
     SelectSQL.Add(' JOIN OPE_EMPLEADO E ON N.EMPRESA = E.EMPRESA AND N.EMPLEADO = E.EMPLEADO ');
     SelectSQL.Add(' JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO ');
     SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_BANCOS B ON T.TERCERO = B.TERCERO AND B.BANCO = 1 ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' N.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' N.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' N.CANAL = :CANAL ');

     if (Periodo > '') then
        SelectSQL.Add(' AND N.PERIODO = :PERIODO ');
     if (Empleado <> 0) then
        SelectSQL.Add(' AND N.EMPLEADO = :EMPLEADO ');

     SelectSQL.Add(' ORDER BY N.PERIODO DESC, N.EMPLEADO ');

     DMMain.FiltraTabla(QPagos, '111000', False);

     if (Periodo > '') then
        Params.ByName['PERIODO'].AsString := Periodo;
     if (Empleado <> 0) then
        Params.ByName['EMPLEADO'].AsInteger := Empleado;

     Open;
  end;
end;

procedure TDMNominasCabecera.QMNomDetHaberesBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_EMP_NOMINAS_DET_HABERES', 'ID');
end;

procedure TDMNominasCabecera.QMNomDetHaberesNewRecord(DataSet: TDataSet);
begin
  QMNomDetHaberesID_CABECERA.AsInteger := QMNomCabID.AsInteger;
end;

procedure TDMNominasCabecera.QMNomDetDescuentosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_EMP_NOMINAS_DET_DESCUENTOS', 'ID');
end;

procedure TDMNominasCabecera.QMNomDetDescuentosNewRecord(DataSet: TDataSet);
begin
  QMNomDetDescuentosID_CABECERA.AsInteger := QMNomCabID.AsInteger;
end;

procedure TDMNominasCabecera.QMNomDetParametrosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_EMP_NOMINAS_DET_PARAMETROS', 'ID');
end;

procedure TDMNominasCabecera.QMNomDetParametrosNewRecord(DataSet: TDataSet);
begin
  QMNomDetParametrosID_CABECERA.AsInteger := QMNomCabID.AsInteger;
end;

procedure TDMNominasCabecera.QMNomDetHaberesCODIGOChange(Sender: TField);
begin
  DMMain.DameGlosa(1, QMNomDetHaberesCODIGO.AsString, QMNomCabEMPRESA.AsInteger, QMNomCabEJERCICIO.AsInteger, QMNomCabCANAL.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetDescuentosCODIGOChange(Sender: TField);
begin
  DMMain.DameGlosa(2, QMNomDetHaberesCODIGO.AsString, QMNomCabEMPRESA.AsInteger, QMNomCabEJERCICIO.AsInteger, QMNomCabCANAL.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetParametrosCODIGOChange(Sender: TField);
begin
  DMMain.DameGlosa(3, QMNomDetHaberesCODIGO.AsString, QMNomCabEMPRESA.AsInteger, QMNomCabEJERCICIO.AsInteger, QMNomCabCANAL.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDet_HDPAfterPost(DataSet: TDataSet);
begin
  RefrescarDetalleCHL;
  QMNomDetAfterPost(DataSet);
end;

procedure TDMNominasCabecera.RefrescarDetalleCHL;
begin
  Refrescar(QMNomDetHaberes, 'ID', QMNomDetHaberesID.AsInteger);
  Refrescar(QMNomDetDescuentos, 'ID', QMNomDetDescuentosID.AsInteger);
  Refrescar(QMNomDetParametros, 'ID', QMNomDetParametrosID.AsInteger);
end;

procedure TDMNominasCabecera.RecalcularNomina;
begin
  if (QMNomCabID.AsInteger > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE EMP_CALCULA_NOMINA_CHL(:ID)';
           Params.ByName['ID'].AsInteger := QMNomCabID.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     QMNomCab.Refresh;
  end
  else
     ShowMessage(_('No hay nomina que recalcular'));

end;

procedure TDMNominasCabecera.Visualizar(Tipo: integer; Filtro: string);
begin
  case Tipo of
     1:
     begin
        DetParametrosFiltro := Filtro;
        with QMNomDetParametros do
        begin
           Close;
           if (DetParametrosFiltro = 'C') then
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_PARAMETROS WHERE ID_CABECERA = ?ID AND CALCULABLE = 0 ORDER BY LINEA'
           else
           if (DetParametrosFiltro = 'T') then
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_PARAMETROS WHERE ID_CABECERA = ?ID AND ES_TOTAL = 1 ORDER BY LINEA'
           else
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_PARAMETROS WHERE ID_CABECERA = ?ID ORDER BY LINEA';
           Open;
        end;
     end;
     2:
     begin
        DetHaberesFiltro := Filtro;
        with QMNomDetHaberes do
        begin
           Close;
           if (DetHaberesFiltro = 'C') then
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_HABERES WHERE ID_CABECERA = ?ID AND CALCULABLE = 0 ORDER BY LINEA'
           else
           if (DetHaberesFiltro = 'T') then
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_HABERES WHERE ID_CABECERA = ?ID AND ES_TOTAL = 1 ORDER BY LINEA'
           else
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_HABERES WHERE ID_CABECERA = ?ID ORDER BY LINEA';
           Open;
        end;
     end;
     3:
     begin
        DetDescuentosFiltro := Filtro;
        with QMNomDetDescuentos do
        begin
           Close;
           if (DetDescuentosFiltro = 'C') then
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_DESCUENTOS WHERE ID_CABECERA = ?ID AND CALCULABLE = 0 ORDER BY LINEA'
           else
           if (DetDescuentosFiltro = 'T') then
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_DESCUENTOS WHERE ID_CABECERA = ?ID AND ES_TOTAL = 1 ORDER BY LINEA'
           else
              SelectSQL.Text := 'SELECT * FROM VER_EMP_NOMINAS_DET_DESCUENTOS WHERE ID_CABECERA = ?ID ORDER BY LINEA';
           Open;
        end;
     end;
  end;
end;

procedure TDMNominasCabecera.SetEstadoNomina(IdCabecera, aEstado: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_NOMINAS_CABECERA ');
        SQL.Add(' SET ');
        SQL.Add(' ESTADO = :ESTADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID = :ID');
        Params.ByName['ESTADO'].AsInteger := aEstado;
        Params.ByName['ID'].AsInteger := IdCabecera;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMNomCab.Refresh;
end;

procedure TDMNominasCabecera.SetCierreNomina(IdCabecera, aEstado: integer);
begin
  /// Contabiliza/Descontabiliza la nomina

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;

        if (aEstado = 1) then
        begin
           SQL.Text := 'EXECUTE PROCEDURE EMP_NOMINA_CIERRA(?ID, ?ENTRADA)';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        end
        else
        begin
           SQL.Text := 'EXECUTE PROCEDURE EMP_NOMINA_ABRE(?ID)';
        end;

        Params.ByName['ID'].AsInteger := IdCabecera;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMNomCab.Refresh;
end;

procedure TDMNominasCabecera.SetListado(IdCabecera, aEstado: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_NOMINAS_CABECERA ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA = :ENTRADA, ');
        SQL.Add(' LISTADO = :LISTADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID = :ID');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['LISTADO'].AsInteger := aEstado;
        Params.ByName['ID'].AsInteger := IdCabecera;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMNomCab.Refresh;
end;

procedure TDMNominasCabecera.SetPagadoNomina(IdCabecera, aEstado: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_NOMINAS_CABECERA ');
        SQL.Add(' SET ');
        SQL.Add(' ENTRADA = :ENTRADA, ');
        SQL.Add(' PAGADO = :PAGADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID = :ID');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PAGADO'].AsInteger := aEstado;
        Params.ByName['ID'].AsInteger := IdCabecera;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMNomCab.Refresh;
end;

procedure TDMNominasCabecera.QMNomCabBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetHaberesAfterInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetHaberesBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetDescuentosBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetDescuentosBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetParametrosBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetParametrosBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetParametrosBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomCabBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetHaberesBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetHaberesBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetDescuentosBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMNomCabESTADO.AsInteger);
end;

procedure TDMNominasCabecera.QMNomDetParametrosIMPORTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMNomDetParametrosCODIGO.AsString = 'P001') or (QMNomDetParametrosCODIGO.AsString = 'P002') or (QMNomDetParametrosCODIGO.AsString = 'P003') or
     (QMNomDetParametrosCODIGO.AsString = 'P009') or (QMNomDetParametrosCODIGO.AsString = 'P015') or (QMNomDetParametrosCODIGO.AsString = 'P016') or
     (QMNomDetParametrosCODIGO.AsString = 'P070') or (QMNomDetParametrosCODIGO.AsString = 'P177') then
  begin
     if Sender.AsString <> '' then
        Text := IntToStr(Sender.AsInteger);
  end
  else
  begin
     if Sender.AsString <> '' then
        Text := FormatFloat('#,##.##', Sender.AsFloat);
  end;
end;

procedure TDMNominasCabecera.ImportarXLS(Archivo, Periodo: string; Log: TStrings);
var
  HCalc : THojaCalc;
  Error : boolean;
  CantidadFilas, CantidadColumnas, Fila, Columna, ColumnaNIF, ColumnaNombre, FilaConceptos, ColumnaInicialConceptos : integer;
  s, NIF, NombreEmpleado, Concepto, Imp : string;
  Importe : double;
  Empleado, EmpleadoActivo, IdNomina, EstadoNomina : integer;
  Conceptos : array of string;
begin
  Log.Add('Importando fichero: ' + Archivo);
  HCalc := THojaCalc.Create(Archivo, False);
  try
     HCalc.ActivateSheetByIndex(1);
     CantidadFilas := HCalc.LastRow + 1;
     CantidadColumnas := HCalc.LastCol + 1;
     ColumnaNIF := 1;
     ColumnaNombre := 2;
     FilaConceptos := 4;
     ColumnaInicialConceptos := 3;
     Log.Add(format('Fecha:  ', [DateTimeToStr(Now)]));
     Log.Add(format('Filas: %d - Columnas %d ', [CantidadFilas, CantidadColumnas]));

     // Verificacion de conceptos - Se verifica que existan y se crean si no es asi.
     // Recorro las columnas de conceptos

     // Array para guardar los conceptos
     SetLength(Conceptos, CantidadColumnas + 1);
     Error := False;

     DMMain.Log('Verificacion de conceptos');
     for Columna := ColumnaInicialConceptos to CantidadColumnas do
     begin
        // Obtengo codigo de concepto
        try
           Concepto := LimpiaCeldaExcel(HCalc.CellText[FilaConceptos, Columna]);
           if (Pos(' ', Concepto) > 0) then
              Concepto := Trim(Copy(Concepto, 1, Pos(' ', Concepto) - 1));
           Concepto := Copy(Concepto, 1, 5);

           Conceptos[Columna] := Concepto;

           s := DameTituloConcepto(Concepto);
           if (Trim(s) = '') then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO SYS_NOMINA_CONCEPTOS (CONCEPTO, DESCRIPCION) ');
                    SQL.Add(' VALUES (:CONCEPTO, :DESCRIPCION) ');
                    Params.ByName['CONCEPTO'].AsString := Concepto;
                    Params.ByName['DESCRIPCION'].AsString := Copy(LimpiaCeldaExcel(HCalc.CellText[FilaConceptos, Columna]), 1, 100);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Log.Add(format('ERROR - Importando celda [F/C](%d, %d) - Concepto %s no existe.' + #13#10 + 'Se crea, pero debera configurarlo antes de volver a importar.', [FilaConceptos, Columna, Concepto]));
              DMMain.Log(format('ERROR - Importando celda [F/C](%d, %d) - Concepto %s no existe.' + #13#10 + 'Se crea, pero debera configurarlo antes de volver a importar.', [FilaConceptos, Columna, Concepto]));
              Error := True;
           end;
        except
           on E: Exception do
           begin
              Error := True;
              Log.Add(format('ERROR - Importando celda [F/C](%d, %d) - Verificando Concepto' + #13#10 + '%s', [FilaConceptos, Columna, E.Message]));
           end;
        end;
        // Log.Add(format('INFO - Importando celda [F/C](%d, %d) - Concepto: %s. (%s)', [FilaNombres, Columna,Concepto,LimpiaCeldaExcel(HCalc.CellText[FilaNombres, Columna])]));
     end;

     // Verificando Empleados
     DMMain.Log('Verificacion de empleados');
     if not Error then
     begin
        // Recorro las filas que contienen datos
        for Fila := FilaConceptos + 1 to CantidadFilas - 1 do
        begin
           try
              NIF := LimpiaCeldaExcel(HCalc.CellText[Fila, ColumnaNIF]);
           except
              NIF := '';
           end;

           // Busco el empleado con el NIF
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT EMPLEADO, ACTIVO FROM VER_EMPLEADOS_CUENTAS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' NIF = :NIF ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['NIF'].AsString := NIF;
                 ExecQuery;
                 Empleado := FieldByName['EMPLEADO'].AsInteger;
                 EmpleadoActivo := FieldByName['ACTIVO'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (Empleado = 0) then
           begin
              Log.Add(format('ERROR - Importando celda [F/C](%d, %d) - Empleado con NIF %s no existe.' + #13#10 + 'Debera crearlo antes de volver a importar.', [Fila, Columna, NIF]));
              DMMain.Log(format('ERROR - Importando celda [F/C](%d, %d) - Empleado con NIF %s no existe.' + #13#10 + 'Debera crearlo antes de volver a importar.', [Fila, Columna, NIF]));
              Error := True;
           end;

           if (EmpleadoActivo = 0) then
           begin
              Log.Add(format('ATENCION - Importando celda [F/C](%d, %d) - Empleado %d, con NIF %s esta inactivo.', [Fila, Columna, Empleado, NIF]));
           end;
        end;
     end;

     if not Error then
     begin
        // Recorro las filas que contienen datos
        for Fila := FilaConceptos + 1 to CantidadFilas - 1 do
        begin
           Log.Add(format('Importando fila %d', [Fila]));
           DMMain.Log(format('Importando fila %d', [Fila]));

           try
              NIF := LimpiaCeldaExcel(HCalc.CellText[Fila, ColumnaNIF]);
           except
              NIF := '';
           end;
           DMMain.Log(format('    NIF: %s', [NIF]));

           // Busco el empleado con el NIF
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT EMPLEADO, ACTIVO, TITULO FROM VER_EMPLEADOS_CUENTAS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' NIF = :NIF ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['NIF'].AsString := NIF;
                 ExecQuery;
                 Empleado := FieldByName['EMPLEADO'].AsInteger;
                 EmpleadoActivo := FieldByName['ACTIVO'].AsInteger;
                 NombreEmpleado := FieldByName['TITULO'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
           DMMain.Log(format('    Empleado: %d', [Empleado]));
           DMMain.Log(format('    Activo: %d', [EmpleadoActivo]));
           DMMain.Log(format('    Nombre: %s', [NombreEmpleado]));

           Log.Add(format('NIF %s - Empleado : %d (ACTIVO=%d) - %s', [NIF, Empleado, EmpleadoActivo, NombreEmpleado]));

           DMMain.Log('Creando cabecera de nomina si no existe.');
           // Inserto la nomina para el Empleado-Periodo, si no existe.
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO VER_EMP_NOMINAS_CABECERA ( ');
                 SQL.Add(' EMPRESA, EJERCICIO, CANAL, EMPLEADO, PERIODO, ENTRADA, FECHA_INI_PERIODO, FECHA_FIN_PERIODO, FECHA) ');
                 SQL.Add(' SELECT E.EMPRESA, E.EJERCICIO, E.CANAL, E.EMPLEADO, P.PERIODO, CAST(:ENTRADA AS INTEGER), P.DESDE, P.HASTA, ');
                 SQL.Add('        CAST(:FECHA AS DATE) ');
                 SQL.Add(' FROM VER_EMPLEADOS_CUENTAS E ');
                 SQL.Add(' JOIN EMP_PERIODOS P ON E.EMPRESA = P.EMPRESA AND E.EJERCICIO = P.EJERCICIO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' E.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' E.EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' E.CANAL = :CANAL AND ');
                 SQL.Add(' E.EMPLEADO = :EMPLEADO AND ');
                 SQL.Add(' P.PERIODO = :PERIODO AND ');
                 SQL.Add(' NOT EXISTS(SELECT EMPLEADO ');
                 SQL.Add('            FROM VER_EMP_NOMINAS_CABECERA ');
                 SQL.Add('            WHERE ');
                 SQL.Add('            EMPRESA = E.EMPRESA AND ');
                 SQL.Add('            EJERCICIO = E.EJERCICIO AND ');
                 SQL.Add('            CANAL = E.CANAL AND ');
                 SQL.Add('            PERIODO = P.PERIODO AND ');
                 SQL.Add('            EMPLEADO = E.EMPLEADO) ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['PERIODO'].AsString := Periodo;
                 Params.ByName['FECHA'].AsDateTime := Now;
                 Params.ByName['EMPLEADO'].AsInteger := Empleado;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Obtengo ID de la nomina y su estado
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT ID, ESTADO ');
                 SQL.Add(' FROM VER_EMP_NOMINAS_CABECERA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' PERIODO = :PERIODO AND ');
                 SQL.Add(' EMPLEADO = :EMPLEADO ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['PERIODO'].AsString := Periodo;
                 Params.ByName['EMPLEADO'].AsInteger := Empleado;
                 ExecQuery;
                 IdNomina := FieldByName['ID'].AsInteger;
                 EstadoNomina := FieldByName['ESTADO'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
           DMMain.Log(format('    Id Nomina %d', [IdNomina]));
           DMMain.Log(format('    Estado: %d', [EstadoNomina]));

           if (IdNomina = 0) then
              Log.Add(format('ERROR - No existe nomina para el empleado %d en el periodo %s.', [Empleado, Periodo]))
           else
           if (EstadoNomina <> 0) then
              Log.Add(format('ERROR - La nomina para el empleado %d en el periodo %s esta cerrada y no puede modificarse.', [Empleado, Periodo]))
           else
           begin
              // Primero borro registros que hubiera.
              // Al insertar una nomina se crea una copia con datos de la nomina anterior
              // También, por si se hubiera descargado antes
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' DELETE FROM VER_EMP_NOMINAS_DETALLE ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_CABECERA = :ID ');
                    Params.ByName['ID'].AsInteger := IdNomina;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              DMMain.Log('Recorro las columnas de conceptos.');
              // Recorro las columnas de conceptos
              for Columna := ColumnaInicialConceptos to CantidadColumnas do
              begin
                 // Obtengo codigo de concepto
                 Concepto := Conceptos[Columna];

                 // Obtengo el importe
                 try
                    Imp := LimpiaCeldaExcel(HCalc.CellText[Fila, Columna]);
                    Importe := -1;
                    if (Imp <> '') then
                    begin
                       try
                          Imp := StringReplace(Imp, ',', '', []);
                          // Imp := StringReplace(Imp, '.', '', []);
                          Importe := StrToFloatDec(Imp, '.');
                       except
                          on E: Exception do
                          begin
                             Log.Add(format('ERROR - La celda [F/C](%d, %d) = "%s" -> "%s" -> %.2f. No contiene un valor numerico decimal.', [Fila, Columna, HCalc.CellText[Fila, Columna], Imp, Importe]));
                             Imp := '';
                             Importe := -1;
                          end;
                       end;
                    end;
                 except
                    on E: Exception do
                    begin
                       Imp := '';
                       Importe := -1;
                       Log.Add(format('ERROR - Importando celda [F/C](%d, %d) - Importe' + #13#10 + '%s', [Fila, Columna, E.Message]));
                    end;
                 end;
                 // Log.Add(format('INFO - Importando celda [F/C](%d, %d) - Importe: %.2f', [FilaNombres, Columna,Importe]));

                 DMMain.Log(format('Datos de linea de nomina - IdNomina: %d - Concepto: %s - Importe: %.2f', [IdNomina, Concepto, Importe]));
                 // Si el concepto, el importe (contiene valor numerico) vienen rellenados modifico el valor en la nomina
                 if (Concepto <> '') and (Importe > 0) then
                 begin
                    try
                       InsertaValor(IdNomina, Concepto, Importe);
                    except
                       on E: Exception do
                       begin
                          Log.Add(format('Error modificando conceptos de nomina.' + #13#10 + 'NIF: %s - Concepto: %s - Importe: %.2f' + #13#10 + '%s', [NIF, Concepto, Importe, E.Message]));
                       end;
                    end;
                 end;
              end;
           end;
        end;
     end;
  finally
     HCalc.Free;
  end;

  Log.Add('Importacion finalizada.');
end;

procedure TDMNominasCabecera.InsertaValor(IdNomina: integer; Concepto: string; Importe: double);
var
  SignoConcepto : integer;
begin
  Concepto := Copy(Concepto, 1, 5);
  SignoConcepto := DameSignoConcepto(Concepto);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;

        case SignoConcepto of
           1: SQL.Add(' INSERT INTO VER_EMP_NOMINAS_DETALLE (ID_CABECERA, CONCEPTO, DEVENGO) ');
           2: SQL.Add(' INSERT INTO VER_EMP_NOMINAS_DETALLE (ID_CABECERA, CONCEPTO, DEDUCCION) ');
           else
              SQL.Add(' INSERT INTO VER_EMP_NOMINAS_DETALLE (ID_CABECERA, CONCEPTO, IMPORTE) ');
        end;

        SQL.Add(' VALUES(:ID_CABECERA, :CONCEPTO, :IMPORTE ) ');
        Params.ByName['ID_CABECERA'].AsInteger := IdNomina;
        Params.ByName['CONCEPTO'].AsString := Concepto;
        Params.ByName['IMPORTE'].AsFloat := Importe;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMNominasCabecera.DameSignoConcepto(Concepto: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SIGNO FROM SYS_NOMINA_CONCEPTOS WHERE CONCEPTO=:CONCEPTO ';
        Params.ByName['CONCEPTO'].AsString := Copy(Concepto, 1, 5);
        ExecQuery;
        Result := FieldByName['SIGNO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMNominasCabecera.DameTituloConcepto(Concepto: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM SYS_NOMINA_CONCEPTOS WHERE CONCEPTO=:CONCEPTO ';
        Params.ByName['CONCEPTO'].AsString := Copy(Concepto, 1, 5);
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominasCabecera.MarcarPagosTodos(Entrada: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_NOMINAS_CABECERA ');
        SQL.Add(' SET ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' PERIODO = :PERIODO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := Periodo;
        Params.ByName['ENTRADA_AGRUPACION'].AsInteger := Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QPagos.Close;
  QPagos.Open;
end;

procedure TDMNominasCabecera.PagarNominasPeriodo(Banco: integer);
var
  FechaPago : TDateTime;
  CuentaPago : string;
  Id : integer;
begin
  FechaPago := REntorno.FechaTrab;
  if PideDato('DAT', FechaPago, _('Fecha de Pago')) then
  begin
     Id := QPagosID.AsInteger;
     CuentaPago := DMMain.DameCuentaBanco(Banco);
     with QPagos do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if (FieldByName('MARCA').AsInteger = 1) and (FieldByName('PAGADO').AsInteger = 0) then
                 PagaNomina(FieldByName('ID').AsInteger, FechaPago, CuentaPago);
              Next;
           end;
           First;
        finally
           EnableControls;
        end;
     end;

     // Refresco tabla
     Refrescar(QPagos, 'ID', Id);
  end;
end;

function TDMNominasCabecera.HayMarca: boolean;
begin
  Result := False;
  with QPagos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (FieldByName('MARCA').AsInteger = 1) and (FieldByName('RIC_PAGO').AsInteger <> 0) then
           begin
              Result := True;
              Exit;
           end;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMNominasCabecera.PagaNomina(Id: integer; Fecha: TDateTime; Cuenta: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE EMP_NOMINA_PAGA(?ID, ?ENTRADA, ?FECHA_PAGO, ?CUENTA_PAGO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID'].AsInteger := Id;
        Params.ByName['FECHA_PAGO'].AsDateTime := Fecha;
        Params.ByName['CUENTA_PAGO'].AsString := Cuenta;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominasCabecera.DespagarPagosSeleccionados;
var
  Id : integer;
begin
  Id := QPagosID.AsInteger;
  with QPagos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (FieldByName('MARCA').AsInteger = 1) and (FieldByName('RIC_PAGO').AsInteger <> 0) then
              DespagarPago(FieldByName('ID').AsInteger);
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;

  // Refresco tabla 
  Refrescar(QPagos, 'ID', Id);
end;

procedure TDMNominasCabecera.DespagarPago(Id: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE EMP_NOMINA_DESPAGO(?ID)';
        Params.ByName['ID'].AsInteger := Id;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominasCabecera.SetDetalleResumido(Resumido: boolean);
begin
  with QMNomDet do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_EMP_NOMINAS_DETALLE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CABECERA = :ID ');
     if Resumido then
     begin
        // Importes de Empleado o que sean conceptos totales
        SelectSQL.Add(' AND ((TIPO_IMPORTE <> 0) OR (TIPO_CONCEPTO IN (1, 2, 3))) ');
     end;
     SelectSQL.Add(' ORDER BY LINEA ');

     Open;
  end;
end;

end.
