unit UDMBorradorContabilidad;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO, Variants;

type
  // Define el tipo necesitado para la lista de asientos a procesar
  TDocInfo = class
     fempresa: integer;
     fejercicio: integer;
     fcanal: integer;
     fasiento: integer;
  public
     property empresa: integer Read fempresa Write fempresa;
     property ejercicio: integer Read fejercicio Write fejercicio;
     property canal: integer Read fcanal Write fcanal;
     property asiento: integer Read fasiento Write fasiento;
  end;

  TDocInfoList = TList;

  TDMBorradorContabilidad = class(TDataModule)
     DSQMAsientos: TDataSource;
     xTipos: TFIBDataSetRO;
     DSxTipos: TDataSource;
     QMApuntes: TFIBTableSet;
     DSQMApuntes: TDataSource;
     QMAsientos: TFIBTableSet;
     QSPValida: TFIBTableSet;
     DSQSPValida: TDataSource;
     QSPTraspasa: THYFIBQuery;
     xCargos: TFIBDataSetRO;
     DSxCargos: TDataSource;
     xAbonos: TFIBDataSetRO;
     DSxAbonos: TDataSource;
     DSxMonedas: TDataSource;
     xCanales: TFIBDataSetRO;
     DSxCanales: TDataSource;
     EntornoFind: TEntornoFind2000;
     TLocal: THYTransaction;
     xInfoActualizada: TFIBDataSetRO;
     DSxInfoActualizada: TDataSource;
     xMonedas: TFIBDataSetRO;
     xMonedasT_DESTINO: TFIBStringField;
     xMonedasCAMBIO: TFloatField;
     xMonedasDESTINO: TFIBStringField;
     xMonedasF_ALTA: TDateTimeField;
     xInfoActualizadaSALDO: TFloatField;
     xInfoActualizadaHABER: TFloatField;
     xInfoActualizadaDEBE: TFloatField;
     SPCambiaMoneda: THYFIBQuery;
     xTerceros: TFIBDataSetRO;
     DSxTerceros: TDataSource;
     xCuentas: TFIBDataSetRO;
     DSxCuentas: TDataSource;
     xModoIva: TFIBDataSetRO;
     DSxModoIva: TDataSource;
     QMAsientosEMPRESA: TIntegerField;
     QMAsientosEJERCICIO: TIntegerField;
     QMAsientosRIB: TIntegerField;
     QMAsientosTIPO: TFIBStringField;
     QMAsientosTITULO: TFIBStringField;
     QMAsientosFECHA: TDateTimeField;
     QMAsientosDEBE: TFloatField;
     QMAsientosHABER: TFloatField;
     QMAsientosSALDO: TFloatField;
     QMAsientosBLOQUEADO: TIntegerField;
     QMAsientosENTRADA: TIntegerField;
     QMAsientosLINEAS: TIntegerField;
     QMAsientosCANAL: TIntegerField;
     QMAsientosMONEDA: TFIBStringField;
     QMAsientosTERCERO: TIntegerField;
     QMAsientosCUENTA: TFIBStringField;
     QMAsientosMODO_IVA: TIntegerField;
     QMAsientosSIGNO: TIntegerField;
     QMApuntesEMPRESA: TIntegerField;
     QMApuntesEJERCICIO: TIntegerField;
     QMApuntesRIB: TIntegerField;
     QMApuntesLINEA: TIntegerField;
     QMApuntesTIPO: TFIBStringField;
     QMApuntesCARGO: TFIBStringField;
     QMApuntesABONO: TFIBStringField;
     QMApuntesTEXTO: TFIBStringField;
     QMApuntesIMPORTE: TFloatField;
     QMApuntesDOC_NUMERO: TIntegerField;
     QMApuntesDOC_SERIE: TFIBStringField;
     QMApuntesDOC_FECHA: TDateTimeField;
     QMApuntesENLACE: TIntegerField;
     QMApuntesREGISTRO: TIntegerField;
     QMApuntesB_IMPONIBLE: TFloatField;
     QMApuntesLINEA_REC: TIntegerField;
     QMAsientosCUENTA_CON: TFIBStringField;
     QMAsientosFORMA_PAGO: TFIBStringField;
     QMAsientosBASE_IMPONIBLE: TFloatField;
     QMAsientosTIPO_IVA: TIntegerField;
     QMAsientosDOC_NUMERO: TIntegerField;
     QMAsientosDOC_SERIE: TFIBStringField;
     QMAsientosNIF: TFIBStringField;
     QMAsientosMAESTRO: TIntegerField;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     xProveedor: TFIBDataSetRO;
     DSxProveedor: TDataSource;
     xAcreedor: TFIBDataSetRO;
     DSxAcreedor: TDataSource;
     xFormasPago: TFIBDataSetRO;
     DSxFormasPago: TDataSource;
     xSerie: TFIBDataSetRO;
     DSxSerie: TDataSource;
     xCuentasCon: TFIBDataSetRO;
     DSxCuentasCon: TDataSource;
     QMAsientosCartera: TFIBTableSet;
     DSQMAsientosCartera: TDataSource;
     QMAsientosCarteraEMPRESA: TIntegerField;
     QMAsientosCarteraEJERCICIO: TIntegerField;
     QMAsientosCarteraRIB: TIntegerField;
     QMAsientosCarteraMAESTRO: TIntegerField;
     QMAsientosCarteraSIGNO: TFIBStringField;
     QMAsientosCarteraCUENTA_CP: TFIBStringField;
     QMAsientosCarteraTIPO_FAC: TFIBStringField;
     QMRecibos: TFIBTableSet;
     DSQMRecibos: TDataSource;
     QMRecibosREGISTRO: TIntegerField;
     QMRecibosLINEA: TIntegerField;
     QMRecibosVENCIMIENTO: TDateTimeField;
     QMRecibosCTA_PAGO: TFIBStringField;
     QMRecibosLIQUIDO: TFloatField;
     QMRecibosPAGADO: TIntegerField;
     QMRecibosFECHA_CIERRE: TDateTimeField;
     QMRecibosRECIBIDO: TIntegerField;
     QMRecibosENTRADA: TIntegerField;
     QMRecibosMONEDA: TFIBStringField;
     QMRecibosLIQUIDO_CANAL: TFloatField;
     QMRecibosEMPRESA: TIntegerField;
     QMRecibosEJERCICIO: TIntegerField;
     QMRecibosCANAL: TIntegerField;
     QMRecibosSIGNO: TFIBStringField;
     QMAsientosTIPO_ASIENTO_KRI: TFIBStringField;
     QMCentroCoste: TFIBTableSet;
     QMCentroCosteEMPRESA: TIntegerField;
     QMCentroCosteEJERCICIO: TIntegerField;
     QMCentroCosteRIB: TIntegerField;
     QMCentroCosteLINEA: TIntegerField;
     QMCentroCosteDIGITO_1: TFIBStringField;
     QMCentroCosteDIGITO_2: TFIBStringField;
     QMCentroCosteDIGITO_3: TFIBStringField;
     QMCentroCosteDIGITO_4: TFIBStringField;
     QMCentroCosteDIGITO_5: TFIBStringField;
     SPCostesIntroducidos: THYFIBQuery;
     QMApuntesCUENTA_CON: TFIBStringField;
     QMRecibosID_CARTERA: TIntegerField;
     QMRecibosID_CARTERA_DETALLE: TIntegerField;
     xDebe: TFIBDataSetRO;
     DSxDebe: TDataSource;
     xHaber: TFIBDataSetRO;
     DSxHaber: TDataSource;
     xDebeSALDO: TFloatField;
     xHaberSALDO: TFloatField;
     QMAsientosNOMBRE: TFIBStringField;
     QMAsientosDIRECCION: TFIBStringField;
     QMAsientosC_POSTAL: TFIBStringField;
     QMAsientosPROVINCIA: TFIBStringField;
     QMAsientosPAIS: TFIBStringField;
     xTipoIva: TFIBDataSetRO;
     DSxTipoIva: TDataSource;
     xTipoIvaTITULO: TFIBStringField;
     xCuentasConDetalle: TFIBDataSetRO;
     DSxCuentasConDetalle: TDataSource;
     QMApuntesPROYECTO: TIntegerField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMApuntesTITULO_PROYECTO: TFIBStringField;
     xTiposTITULO: TFIBStringField;
     xTiposEXT: TIntegerField;
     TUpdate: THYTransaction;
     QSPValidaERROR: TIntegerField;
     QSPValidaCUENTA: TFIBStringField;
     QSPValidaRIB_VALIDADO: TIntegerField;
     QSPValidaLINEA: TIntegerField;
     QSPValidaDESCRIPCION_ERROR: TFIBStringField;
     QMAsientosID_ASIENTO: TIntegerField;
     procedure DMBorradorContabilidadCreate(Sender: TObject);
     procedure QMAsientosBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMAsientosNewRecord(DataSet: TDataSet);
     procedure QMApuntesNewRecord(DataSet: TDataSet);
     procedure QMApuntesDOC_NUMEROValidate(Sender: TField);
     procedure QMApuntesTEXTOChange(Sender: TField);
     procedure QMAsientosAfterDelete(DataSet: TDataSet);
     procedure QMApuntesBeforeEdit(DataSet: TDataSet);
     procedure QMAsientosTIPOChange(Sender: TField);
     procedure QMAsientosMONEDAChange(Sender: TField);
     procedure QMAsientosAfterOpen(DataSet: TDataSet);
     procedure QMApuntesCARGOChange(Sender: TField);
     procedure QMApuntesABONOChange(Sender: TField);
     procedure QMApuntesAfterOpen(DataSet: TDataSet);
     procedure QMApuntesAfterPost(DataSet: TDataSet);
     procedure QMApuntesAfterDelete(DataSet: TDataSet);
     procedure QMApuntesBeforePost(DataSet: TDataSet);
     procedure QMAsientosCANALChange(Sender: TField);
     procedure xMonedasBeforeOpen(DataSet: TDataSet);
     procedure QMAsientosBeforeEdit(DataSet: TDataSet);
     procedure QMAsientosAfterPost(DataSet: TDataSet);
     procedure QMAsientosTERCEROChange(Sender: TField);
     procedure QMAsientosCUENTAChange(Sender: TField);
     procedure QMAsientosMODO_IVAChange(Sender: TField);
     procedure QMApuntesBeforeDelete(DataSet: TDataSet);
     procedure QMApuntesBeforeInsert(DataSet: TDataSet);
     procedure QMAsientosMAESTROChange(Sender: TField);
     procedure QMAsientosCUENTA_CONChange(Sender: TField);
     procedure QMAsientosTIPO_IVAChange(Sender: TField);
     procedure QMAsientosFORMA_PAGOChange(Sender: TField);
     procedure QMAsientosDOC_SERIEChange(Sender: TField);
     procedure QMAsientosAfterInsert(DataSet: TDataSet);
     procedure QMAsientosCarteraNewRecord(DataSet: TDataSet);
     procedure QMRecibosLIQUIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRecibosBeforeInsert(DataSet: TDataSet);
     procedure QMRecibosBeforeDelete(DataSet: TDataSet);
     procedure QMRecibosAfterPost(DataSet: TDataSet);
     procedure QMRecibosBeforePost(DataSet: TDataSet);
     procedure QMRecibosNewRecord(DataSet: TDataSet);
     procedure QMAsientosAfterScroll(DataSet: TDataSet);
     procedure QMApuntesCUENTA_CONChange(Sender: TField);
     procedure xCargosBeforeOpen(DataSet: TDataSet);
     procedure xAbonosBeforeOpen(DataSet: TDataSet);
     procedure CambiaTextoAsiento;
     procedure QMAsientosTITULOChange(Sender: TField);
     procedure QMApuntesPROYECTOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure SetPGCBeforeOpen(DataSet: TDataSet);
     procedure QMAsientosBeforeDelete(DataSet: TDataSet);
  private
     { Private declarations }
     Text: string;  //dji lrk kri
     procedure CambiaMonedaDetalle;
     procedure RenContador(Ejercicio: integer);
     function FillDocInfoListFromDRO(dro: TFIBTableSet): TDocInfoList;
     procedure ReemplazaConcepto(Sender: TField);
  public
     { Public declarations }
     moneda: string;
     monedaold: string;
     tipoold: string;
     refrescaDetalles: boolean;
     apuTipo: string;
     TipoAsiento, TipoAux: string;
     CambioAsiento: string;
     DatosNIF: boolean;
     AsientoActual: TBookmark;
     procedure Valida(Todos: boolean = False);
     function Traspasa(CerrarAlTraspasar: boolean): boolean;
     function AsientoExtendido(pTipo: string): boolean;
     procedure Refresca;
     procedure Cuadrar;
     procedure APlantilla;
     procedure DePlantilla(Plantilla: integer);
     // procedure Muestra(Rib: Integer);
     procedure PosicionaRIB(Empresa, Ejercicio, Rib: integer);
     procedure CambiaMascara;
     procedure FiltraSesion;
     procedure DesFiltraSesion;
     procedure BusquedaCompleja;
     procedure InfoActualizada;
     procedure ObtenerDatosIVA(TipoApunte: string);
     procedure RellenaFacturaBorrador;
     procedure RellenaDatosExtendidos;
     procedure MuestraRecibos;
     procedure MarcaRecibos(Modo: smallint);
     procedure RegeneraAsientoRecibos;
     procedure InsertaCoste(d1, d2, d3, d4, d5: string);
     procedure ActualizaCoste(d1, d2, d3, d4, d5: string);
     procedure BorraCoste;
     function CostesIntroducidos: smallint;
     procedure AbreAuxiliaresNIF;
     function ValidaDocumento(RIG: integer; Serie: string; Modo: byte): boolean;
     function InicializaProceso: TDocInfoList;
     procedure TerminaProceso;
     procedure TraspasaAsiento;
     procedure TraspasaAsientosFiltrados;
     function TraspasaAsientoFiltrado(Empresa, Ejercicio, Canal, Asiento: integer): boolean;
     procedure PedirCentroCoste;
     function DamePaisEEC(Empresa, Ejercicio, Canal: integer): string;
     procedure DuplicarLinea;
  end;

var
  DMBorradorContabilidad : TDMBorradorContabilidad;

implementation

uses UDMMain, UEntorno, UUtiles, UFAltaPlantilla,
  UFMBorradorContabilidad, URecursos, UFMSGInformacion, UFBusca, UFParada,
  UFMain, UFMDatosBorradorFac, UFMImputacionCostes, UFormGest, UFInfoTraspasoACont,
  UFMDigitosCoste, UDameDato;

{$R *.DFM}

procedure TDMBorradorContabilidad.DMBorradorContabilidadCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Introducimos los datos necesarios en el entorno
  EntornoFind.Empresa := REntorno.Empresa;
  EntornoFind.Ejercicio := REntorno.Ejercicio;
  EntornoFind.Canal := REntorno.Canal;
  EntornoFind.Pgc := REntorno.Pgc;  {dji lrk kri}

  // Ponemos las mascaras
  xMonedasCAMBIO.DisplayFormat := MascaraC;
  QMApuntesCARGO.EditMask := REntorno.MascaraCuentas;
  QMApuntesABONO.EditMask := REntorno.MascaraCuentas;
  xInfoActualizadaDEBE.DisplayFormat := MascaraN;
  xInfoActualizadaHABER.DisplayFormat := MascaraN;
  xInfoActualizadaSALDO.DisplayFormat := MascaraN;
  QMRecibosLIQUIDO_CANAL.DisplayFormat := MascaraN;
  xDebeSALDO.DisplayFormat := MascaraN;
  xHaberSALDO.DisplayFormat := MascaraN;

  try
     DMMain.FiltraTabla(QMAsientos, '10000');
  except
     on e: Exception do
        ShowMessage(_('DMMain.FiltraTabla(QMAsientos - Exception:') + ' ' + e.Message);
  end;
  try
     CambiaMascara;
  except
     on e: Exception do
        ShowMessage(_('CambiaMascara - Exception:') + ' ' + e.Message);
  end;

  TipoAux := 'NOR';
end;

procedure TDMBorradorContabilidad.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMBorradorContabilidad.QMAsientosBeforePost(DataSet: TDataSet);
var
  ContadorTipo : string;
begin
  if (DataSet.State = dsEdit) then
     if (((Trim(QMAsientosNOMBRE.AsString) <= '') or
        (Trim(QMAsientosNIF.AsString) <= '') or
        (Trim(QMAsientosDIRECCION.AsString) <= '') or
        (Trim(QMAsientosC_POSTAL.AsString) <= '') or
        (Trim(QMAsientosPROVINCIA.AsString) <= '')) and
        ((QMAsientosTIPO.AsString = 'AFA') or
        (QMAsientosTIPO.AsString = 'APA') or
        (QMAsientosTIPO.AsString = 'AFC'))) then
        if not ConfirmaMensaje(_('Alguno de los campos esta vacio' +
           #13#10 + '¿Grabar cambios?')) then
           QMAsientos.Cancel;

  // Llamamos al contador
  if (DataSet.State = dsInsert) then
     QMAsientosRIB.AsInteger := DMMain.Contador_EE('RIB');

  // Para no hacer un IF incomprensible hacemos 2 IFs separados
  if ((DataSet.State = dsInsert) and
     (QMAsientosBASE_IMPONIBLE.AsFloat = 0)) and
     ((QMAsientosTIPO.AsString = 'AFC') or
     (QMAsientosTIPO.AsString = 'AFP') or
     (QMAsientosTIPO.AsString = 'AFA')) then
     raise Exception.Create(_('No es posible crear un asiento de Factura con base imponible 0'));

  if ((DataSet.State = dsEdit) and
     (QMAsientosBASE_IMPONIBLE.AsFloat = 0) and
     (tipoold <> QMAsientosTIPO.AsString)) and
     ((QMAsientosTIPO.AsString = 'AFC') or
     (QMAsientosTIPO.AsString = 'AFP') or
     (QMAsientosTIPO.AsString = 'AFA')) then
     raise Exception.Create(_('No es posible crear un asiento de Factura con base imponible 0'));

  if ((DataSet.State = dsInsert) and
     (QMAsientosCartera.State = dsInsert) and
     ((QMAsientosTIPO.AsString = 'PRA') or
     (QMAsientosTIPO.AsString = 'PRP') or
     (QMAsientosTIPO.AsString = 'CRC') or
     (QMAsientosTIPO.AsString = 'CPB'))) then
  begin
     QMAsientosCarteraRIB.AsInteger := QMAsientosRIB.AsInteger;
  end;

  QMAsientosMONEDA.AsString := xMonedasDESTINO.AsString;

  // Contadores para asientos de factura
  if ((DataSet.State = dsInsert) and
     (QMAsientosDOC_NUMERO.AsInteger = 0) and
     ((QMAsientosTIPO.AsString = 'AFC') or
     (QMAsientosTIPO.AsString = 'AFA') or
     (QMAsientosTIPO.AsString = 'AFP'))) then
  begin
     if (QMAsientosTIPO.AsString = 'AFC') then
        ContadorTipo := 'FBC';
     if (QMAsientosTIPO.AsString = 'AFP') then
        ContadorTipo := 'FBP';
     if (QMAsientosTIPO.AsString = 'AFA') then
        ContadorTipo := 'FBA';

     QMAsientosDOC_NUMERO.AsInteger := DMMain.Contador_EECS(QMAsientosDOC_SERIE.AsString,
        ContadorTipo);
  end;
end;

procedure TDMBorradorContabilidad.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMBorradorContabilidad.QMAsientosNewRecord(DataSet: TDataSet);
begin
  QMAsientosEMPRESA.AsInteger := REntorno.Empresa;
  QMAsientosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAsientosCANAL.AsInteger := REntorno.Canal;
  QMAsientosTIPO.AsString := {  TipoAux }'NOR';
  QMAsientosFECHA.AsDateTime := REntorno.FechaTrab;
  QMAsientosBLOQUEADO.AsInteger := 0;
  QMAsientosENTRADA.AsInteger := REntorno.Entrada;
  QMAsientosMONEDA.AsString := REntorno.Moneda;
  QMAsientosMODO_IVA.AsInteger := 1;
  QMAsientosID_ASIENTO.AsInteger := 0;
  QMAsientosSIGNO.AsInteger := 0;

  {
  QMAsientosBASE_IMPONIBLE.asFloat := 0;
  QMAsientosNIF.asString := '';
  QMAsientosDOC_NUMERO.asInteger := 0;
  QMAsientosTIPO_IVA.asInteger := 0;
  QMAsientosMAESTRO.asInteger := 0;
  }
end;

procedure TDMBorradorContabilidad.QMApuntesNewRecord(DataSet: TDataSet);
begin
  if ((QMAsientos.State = dsInsert) or (QMAsientos.State = dsEdit)) then
  begin
     QMAsientos.Post;
     QMApuntes.Edit;
  end;
  EntornoFind.Canal := QMAsientosCANAL.AsInteger;
  QMApuntesEMPRESA.AsInteger := REntorno.Empresa;
  QMApuntesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMApuntesRIB.AsInteger := QMAsientosRIB.AsInteger;
  QMApuntesENLACE.AsInteger := 0;
  QMApuntesB_IMPONIBLE.AsFloat := 0;
  QMApuntesLINEA_REC.AsInteger := 0;
  QMApuntesTIPO.AsString := 'NOR';
  QMApuntesDOC_FECHA.AsString := QMAsientosFecha.AsString;
  QMApuntesCUENTA_CON.AsString := QMAsientosCUENTA_CON.AsString;

  // Obtenemos el número de línea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_LINEA_SIGUIENTE(:EMPRESA, :EJERCICIO, :RIB)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
        ExecQuery;
        QMApuntesLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if QMAsientosTIPO.AsString = 'APE' then
     QMApuntesTEXTO.AsString := _('ASIENTO DE APERTURA')
  else
     QMApuntesTEXTO.AsString := Text; {QMAsientosTITULO.AsString dji lrk kri}
end;

procedure TDMBorradorContabilidad.DuplicarLinea;
var
  Cargo : string;
  Abono : string;
  Texto : string;
  Importe : double;
  DocNumero : integer;
  DocSerie : string;
  DocFecha : TDateTime;
  Tipo : string;
  Proyecto : integer;
begin
  if ((QMApuntes.RecordCount = 0) or (QMApuntes.State <> dsBrowse)) then
     Exit;

  with QMApuntes do
  begin
     // Cargar Valores de la linea actual
     Cargo := QMApuntes.FieldByName('CARGO').AsString;
     Abono := QMApuntes.FieldByName('ABONO').AsString;
     Texto := QMApuntes.FieldByName('TEXTO').AsString;
     Importe := QMApuntes.FieldByName('IMPORTE').AsFloat;
     DocNumero := QMApuntes.FieldByName('DOC_NUMERO').AsInteger;
     DocSerie := QMApuntes.FieldByName('DOC_SERIE').AsString;
     DocFecha := QMApuntes.FieldByName('DOC_FECHA').AsDateTime;
     Tipo := QMApuntes.FieldByName('TIPO').AsString;
     Proyecto := QMApuntes.FieldByName('PROYECTO').AsInteger;

     Append;

     QMApuntes.FieldByName('CARGO').AsString := Cargo;
     QMApuntes.FieldByName('ABONO').AsString := Abono;
     QMApuntes.FieldByName('TEXTO').AsString := Texto;
     QMApuntes.FieldByName('IMPORTE').AsFloat := Importe;
     QMApuntes.FieldByName('DOC_NUMERO').AsInteger := DocNumero;
     QMApuntes.FieldByName('DOC_SERIE').AsString := DocSerie;
     QMApuntes.FieldByName('DOC_FECHA').AsDateTime := DocFecha;
     QMApuntes.FieldByName('TIPO').AsString := Tipo;
     QMApuntes.FieldByName('PROYECTO').AsInteger := Proyecto;

     Post;
  end;
end;

procedure TDMBorradorContabilidad.Valida(Todos: boolean = False);
begin
  if (QMApuntes.RecordCount = 0) then
     if (not Todos) then
        Exit;

  // SELECT * FROM C_BORRADOR_VALIDA(:EMPRESA, :EJERCICIO, :CANAL, :RIB)
  with QSPValida do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EntornoFind.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := EntornoFind.Ejercicio;
     Params.ByName['CANAL'].AsInteger := EntornoFind.Canal;
     if (Todos) then
        Params.ByName['RIB'].AsInteger := 0
     else
        Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;

     Open;
     if (RecordCount > 0) then
        TFMSGInformacion.Create(Self).Muestra(DSQSPValida)
     else
        ShowMessage(_('El asiento es correcto'));

     if ((not Todos) and (QSPValidaLINEA.AsInteger <> 0)) then
     begin
        // Posiciono el cursor sobre la linea con error
        with QMApuntes do
        begin
           First;
           while ((not EOF) and (FieldByName('LINEA').AsInteger <> QSPValidaLINEA.AsInteger)) do
              Next;
        end;
     end;
  end;
end;

function TDMBorradorContabilidad.Traspasa(CerrarAlTraspasar: boolean): boolean;
var
  Ric, Asiento, Ejercicio : integer;
  Seguir : boolean;
begin
  Result := False;
  Ejercicio := QMAsientosEJERCICIO.AsInteger;
  Seguir := True;

  if (QMApuntes.RecordCount = 0) then
     Exit;

  if (UDameDato.DameEjercicio(REntorno.Empresa, QMAsientosFECHA.AsDateTime) <> REntorno.Ejercicio) then
     Seguir := ConfirmaMensaje(Format(_('El asiento se contabilizara en otro ejercicio. (Fecha Asiento: %s)'), [DateToStr(QMAsientosFECHA.AsDateTime)]));

  if Seguir then
  begin
     if (QMAsientosCANAL.AsInteger = 0) then
     begin
        with QMAsientos do
        begin
           Edit;
           QMAsientosCANAL.AsInteger := REntorno.Canal;
           Post;
           Transaction.CommitRetaining;
        end;
     end;

     with QSPTraspasa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger; // EntornoFind.Canal;
        Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

        TFParada.Create(Self).ExecQuery(QSPTraspasa);

        Ric := FieldByName['RIC'].AsInteger;
        Asiento := FieldByName['ASIENTODEV'].AsInteger;
        Seguir := (FieldByName['ERROR'].AsInteger = 0);

        FreeHandle;
     end;

     if not Seguir then
        // ShowMessage(_('El asiento no es válido o el importe es cero' + #13#10 + 'Ejecute el proceso de validación'))
        Valida
     else
     begin
        if (RIC = 0) then
           ShowMessage(_('Atención, no se ha generado ningún asiento.'))
        else
        begin
           Result := True;

           if (not CerrarAlTraspasar) then {dji lrk kri - Punteo de Asientos}
           begin
              if (QMAsientosCANAL.AsInteger <> REntorno.Canal) then
              begin
                 if (ConfirmaMensajeCaption(_('Se va a cerrar el canal actual para abrir el canal del documento'), _('Confirmación'))) then
                 begin
                    CierraFormsMenos(FMBorradorContabilidad);
                    FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, QMAsientosCANAL.AsInteger);
                 end
                 else
                 begin
                    QMAsientos.Close;
                    QMAsientos.Open;
                 end;
              end
              else
              begin
                 if (ConfirmaMensajeCaption((Format(_('Atención, el número de RIC es: %s' + #13#10 +
                    'El número de asiento generado es : %s' + #13#10 +
                    '¿Desea ir al movimiento generado?'), [IntToStr(RIC), IntToStr(Asiento)])), _('Aviso'))) then
                    FMain.MuestraMovConta(Format(' RIC= %d AND EJERCICIO = %d', [RIC, Ejercicio]));
              end;
           end; {if not CerrarAlTraspasar}

           AbrirImputacionCostes(RIC, True);
        end;
     end;

     with QMAsientos do
     begin
        if (Result) then
        begin
           Close;
           Open;
           if (RecordCount = 0) then
           begin
              Insert;
              QMAsientosTIPO.AsString := 'NOR';
              Post;
           end;
        end;
     end;
  end;
end;

procedure TDMBorradorContabilidad.Refresca;
begin
  try
     Screen.Cursor := crHourGlass;
     with QMAsientos do
        try
           DisableControls;
           Close;
           {
           Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
           // Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
           if (Params.Count = 3) then
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           }
           Open;
        finally
           EnableControls;
        end;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TDMBorradorContabilidad.QMApuntesDOC_NUMEROValidate(Sender: TField);
begin
  if ((Sender.AsInteger <> 0) and (QMApuntesDOC_FECHA.AsDateTime = 0)) then
     QMApuntesDOC_FECHA.AsDateTime := QMAsientosFECHA.AsDateTime;
end;

procedure TDMBorradorContabilidad.Cuadrar;
var
  Import : double;
  Cargo, Abono : boolean;
begin
  try
     Import := 0;
     QMAsientos.DisableControls;
     QMApuntes.DisableControls;

     if (QMApuntesCARGO.AsString = '') and (QMApuntesABONO.AsString = '') then
        raise Exception.Create(_('No se puede cuadrar un apunte sin cuenta'));

     if (QMApuntesCARGO.AsString <> '') and (QMApuntesABONO.AsString <> '') then
        raise Exception.Create(_('No se puede cuadrar un apunte de cargo y abono a la vez'));

     if (QMApuntesCARGO.AsString <> '') then
        Import := xInfoActualizadaSALDO.AsFloat - QMApuntesIMPORTE.AsFloat;

     if (QMApuntesABONO.AsString <> '') then
        Import := xInfoActualizadaSALDO.AsFloat + QMApuntesIMPORTE.AsFloat;

     if Import < 0 then
        Import := Import * -1;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           SQL.Text := 'SELECT COUNT(CARGO) AS EXISTE FROM CON_BORRADOR_APUNTES ' +
              'WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND RIB = ?RIB AND CARGO > '' ''';
           Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
           Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
           ExecQuery;
           Cargo := FieldByName['EXISTE'].AsInteger > 0;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           SQL.Text := 'SELECT COUNT(ABONO) AS EXISTE FROM CON_BORRADOR_APUNTES ' +
              'WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND RIB = ?RIB AND ABONO > '' ''';
           Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
           Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
           ExecQuery;
           Abono := FieldByName['EXISTE'].AsInteger > 0;
           FreeHandle;
        finally
           Free;
        end;
     end;
     if ((Cargo and not Abono) or (Abono and not Cargo)) then
        raise Exception.Create(_('Imposible cuadrar, no hay contraasiento'));

     QMApuntes.Edit;
     QMApuntesIMPORTE.AsFloat := Import;
     QMApuntes.Post;
  finally
     QMAsientos.EnableControls;
     QMApuntes.EnableControls;
  end;
end;

procedure TDMBorradorContabilidad.ReemplazaConcepto(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM SYS_CONCEPTOS WHERE CONCEPTO = :CONCEPTO';
        Params.ByName['CONCEPTO'].AsString := Copy(UpperCase(Sender.AsString), 1, 3);
        ExecQuery;
        if HayDatos then
           Sender.AsString := FieldByName['TITULO'].AsString + Copy(UpperCase(Sender.AsString), 4, 15);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBorradorContabilidad.QMApuntesTEXTOChange(Sender: TField);
begin
  // Desactivamos el evemto
  QMApuntesTEXTO.OnChange := nil;
  try
     ReemplazaConcepto(Sender);
  finally
     QMApuntesTEXTO.OnChange := QMApuntesTEXTOChange;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosTITULOChange(Sender: TField);
begin
  // Desactivamos el evemto
  QMAsientosTITULO.OnChange := nil;
  try
     ReemplazaConcepto(Sender);
  finally
     QMAsientosTITULO.OnChange := QMAsientosTITULOChange;
  end;
end;

procedure TDMBorradorContabilidad.APlantilla;
var
  r : integer;
  m : string;
begin
  r := 0;
  m := '';
  if (QMApuntes.RecordCount = 0) then
     Exit;
  if (TFAltaPlantilla.Create(Self).Muestra(r, m) <> mrOk) then
     Exit;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_A_PLANTILLA(:EMPRESA, :EJERCICIO, :RIB, :PLANTILLA, :NOMBRE, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
        Params.ByName['PLANTILLA'].AsInteger := r;
        Params.ByName['NOMBRE'].AsString := m;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        r := FieldByName['RESULTADO'].AsInteger;
        case r of
           -1: m := _('Error indefinido');
           0: m := _('No se puede hacer una plantilla sin apuntes');
           else
              m := Format(_('El número de plantilla asignado es %s'), [IntToStr(r)]);
        end;
        ShowMessage(m);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBorradorContabilidad.DePlantilla(Plantilla: integer);
var
  r, Canal : integer;
begin
  {Todo : c_borrador_de_plantilla debería devolver el RIB generado o -1 si hubo error}
  Canal := QMAsientosCANAL.AsInteger;

  if QMAsientosCANAL.IsNull then
     Canal := REntorno.Canal;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_DE_PLANTILLA(:EMPRESA, :EJERCICIO, :CANAL, :RIB, :PLANTILLA, :ENTRADA, :FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['RIB'].AsInteger := 0 {QMAsientosRIB.AsInteger};
        Params.ByName['PLANTILLA'].AsInteger := Plantilla;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        ExecQuery;
        r := FieldByName['RESULTADO'].AsInteger;
        if (r = -1) then
           ShowMessage(_('Error indefinido'));
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refresca;
  // Se pone el last hasta encontrar otra forma más optima y correcta
  with QMAsientos do
  begin
     DisableControls;
     try
        Last;
        {Ahora retrocedo hasta encontrar el de este ejercicio y que pertenezca a esta entrada}
        while (((QMAsientosEJERCICIO.AsInteger <> REntorno.Ejercicio) or (QMAsientosENTRADA.AsInteger <> REntorno.Entrada)) and (not BOF)) do
           Prior;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosAfterDelete(DataSet: TDataSet);
var
  Ejercicio : integer;
begin
  Ejercicio := QMAsientosEJERCICIO.AsInteger;
  Graba(DataSet);
  RenContador(ejercicio);
end;

procedure TDMBorradorContabilidad.QMApuntesBeforeEdit(DataSet: TDataSet);
begin
  EntornoFind.Canal := QMAsientosCANAL.AsInteger;
  if QMApuntesENLACE.AsInteger < 0 then
  begin
     raise Exception.Create(_('Apunte automático de IVA. No se puede modificar debido a que depende del apunte que lo ha generado.'));
  end;
  apuTIPO := QMApuntesTIPO.AsString;

  if (Pos('IVA', QMApuntesTIPO.AsString) > 0) then
     refrescadetalles := True;
end;

procedure TDMBorradorContabilidad.PosicionaRIB(Empresa, Ejercicio, Rib: integer);
begin
  Refresca;
  QMAsientos.Locate('EMPRESA;EJERCICIO;RIB', VarArrayOf([Empresa, Ejercicio, Rib]), []);
  CambiaMascara;
end;

procedure TDMBorradorContabilidad.QMAsientosTIPOChange(Sender: TField);
begin
  if Sender.AsString = 'APE' then
     QMAsientosTITULO.AsString := _('ASIENTO DE APERTURA');

  with xTipos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.CambiaMascara;
var
  LocalMascaraN : string;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMAsientosMONEDA.AsString, 1);
  QMAsientosDEBE.DisplayFormat := LocalMascaraN;
  QMAsientosHABER.DisplayFormat := LocalMascaraN;
  QMAsientosSALDO.DisplayFormat := LocalMascaraN;
  QMApuntesIMPORTE.DisplayFormat := LocalMascaraN;
  QMAsientosBASE_IMPONIBLE.DisplayFormat := LocalMascaraN;
  {
  xDebeSALDO.DisplayFormat := LocalMascaraN ;
  xHaberSALDO.DisplayFormat := LocalMascaraN ;
  }
end;

procedure TDMBorradorContabilidad.QMAsientosMONEDAChange(Sender: TField);
begin
  with xMonedas do
  begin
     Close;
     Open;
  end;
  CambiaMascara;
end;

procedure TDMBorradorContabilidad.QMAsientosAfterOpen(DataSet: TDataSet);
begin
  QMApuntes.Open;
  xTerceros.Open;
  xCuentas.Open;
  xModoIva.Open;
  xTipos.Open;
  xCanales.Open;
  xMonedas.Open;
  xInfoActualizada.Open;
  QMCentroCoste.Open;
end;

procedure TDMBorradorContabilidad.FiltraSesion;
begin
  // Obtenemos los asientos que se han realizado durante esta sesión
  with QMAsientos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_BORRADOR_ASIENTOS');
     SelectSQL.Add('WHERE ((EMPRESA = ?EMPRESA) '); // AND (EJERCICIO=?EJERCICIO)');
     SelectSQL.Add('AND (ENTRADA = ?ENTRADA)) ORDER BY RIB');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.byName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.DesFiltraSesion;
begin
  //Mostramos todos los asientos creados aunque no sean de esta sesión
  with QMAsientos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_BORRADOR_ASIENTOS');
     SelectSQL.Add('WHERE (EMPRESA = ?EMPRESA)'); // (EJERCICIO=?EJERCICIO))');
     SelectSQL.Add('ORDER BY RIB');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Params.byName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAsientos, '11000');
end;

procedure TDMBorradorContabilidad.QMApuntesCARGOChange(Sender: TField);
begin
  with xCargos do
  begin
     Close;
     Open;
     if ((Trim(QMApuntesCARGO.AsString) <> '') and (RecordCount = 0) and (Pos('.', QMApuntesCARGO.AsString) = 0)) then
        MessageDlg(_('Esta cuenta no existe en este ejercicio.'), mtWarning, [mbOK], 0);
  end;

  with xDebe do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMApuntesABONOChange(Sender: TField);
begin
  with xAbonos do
  begin
     Close;
     Open;
     if ((Trim(QMApuntesABONO.AsString) <> '') and (RecordCount = 0) and (Pos('.', QMApuntesABONO.AsString) = 0)) then
        MessageDlg(_('Esta cuenta no existe en este ejercicio.'), mtWarning, [mbOK], 0);
  end;

  with xHaber do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMApuntesAfterOpen(DataSet: TDataSet);
begin
  xCargos.Open;
  xAbonos.Open;
  xProyectos.Open;
end;

procedure TDMBorradorContabilidad.QMApuntesAfterPost(DataSet: TDataSet);
var
  Marca : TBookmark;
begin
  Graba(DataSet);
  if (((apuTipo <> Trim(QMApuntesTIPO.AsString)) and
     ((Pos('IVA', QMApuntesTIPO.AsString) > 0) or (Pos('IVA', apuTipo) > 0)))) then
  begin
     with DataSet.DataSource.DataSet do
     begin
        Marca := DataSet.GetBookmark;
        try
           DisableControls;
           Refresh;
           DataSet.GotoBookmark(Marca);
        finally
           EnableControls;
           DataSet.FreeBookmark(Marca);
        end;
     end;
  end;

  if (refrescaDetalles and (Pos('IVA', QMApuntesTIPO.AsString) > 0)) then
  begin
     with DataSet.DataSource.DataSet do
     begin
        Marca := DataSet.GetBookmark;
        try
           DisableControls;
           Refresh;
           DataSet.GotoBookmark(Marca);
        finally
           EnableControls;
           DataSet.FreeBookmark(Marca);
        end;
     end;
  end;
  refrescaDetalles := False;

  InfoActualizada;

  PedirCentroCoste;
end;

procedure TDMBorradorContabilidad.QMApuntesAfterDelete(DataSet: TDataSet);
begin
  Graba(DataSet);
  if refrescaDetalles then
  begin
     with DataSet.DataSource.DataSet do
     begin
        DisableControls;
        Refresh;
        EnableControls;
     end;
  end;

  InfoActualizada;
  refrescaDetalles := False;
end;

procedure TDMBorradorContabilidad.QMApuntesBeforePost(DataSet: TDataSet);
begin
  // Comprobamos que la fecha pertenece al ejercicio
  {dji lrk kri - La fecha del doc. puede ser del ejer. pasado.
  if QMApuntesDOC_FECHA.AsString <>'' then
    DMMain.ValidaFecha(REntorno.Empresa, REntorno.Ejercicio, QMApuntesDOC_FECHA.AsDateTime);}
  Text := QMApuntesTEXTO.AsString; // dji lrk kri
  QMApuntesCARGO.AsString := Trim(QMApuntesCARGO.AsString);
  QMApuntesABONO.AsString := Trim(QMApuntesABONO.AsString);
end;

procedure TDMBorradorContabilidad.QMAsientosCANALChange(Sender: TField);
begin
  with xCanales do
  begin
     Close;
     Open;
  end;
end;

{procedure TDMBorradorContabilidad.Muestra( Rib : Integer ) ;
begin
  QMAsientos.Close;
  QMAsientos.SelectSQL.Text := 'SELECT * FROM CON_BORRADOR_ASIENTOS where' +
                               '((empresa=?empresa)and(ejercicio=?ejercicio)and(rib=?rib))';
  Self.Rib := Rib;
  Refresca ;
end;}

procedure TDMBorradorContabilidad.xMonedasBeforeOpen(DataSet: TDataSet);
begin
  xMonedas.Params.ByName['ORIGEN'].AsString := REntorno.Moneda;
end;

procedure TDMBorradorContabilidad.InfoActualizada;
begin
  with xInfoActualizada do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosBeforeEdit(DataSet: TDataSet);
begin
  monedaold := QMAsientosMONEDA.AsString;
  tipoold := QMAsientosTIPO.AsString;
end;

procedure TDMBorradorContabilidad.QMAsientosAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  if (monedaold <> QMAsientosMONEDA.AsString) then
     CambiaMonedaDetalle;
  Text := QMAsientosTITULO.AsString;
  TipoAux := QMAsientosTIPO.AsString;
end;

procedure TDMBorradorContabilidad.CambiaMonedaDetalle;
begin
  with SPCambiaMoneda do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
     Params.ByName['MONEDAOLD'].AsString := monedaold;
     Params.ByName['MONEDA'].AsString := QMAsientosMONEDA.AsString;
     Params.ByName['FECHA'].AsDateTime := QMAsientosFECHA.AsDateTime;
     ExecQuery;
     FreeHandle;
  end;
end;

function TDMBorradorContabilidad.AsientoExtendido(pTipo: string): boolean;
begin
  with xTipos do
  begin
     Close;
     Params.ByName['TIPO'].AsString := pTipo;
     Open;
     Result := (FieldByName('EXT').AsInteger = 1);
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosTERCEROChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT T.NOMBRE_R_SOCIAL, T.NIF, D.DIR_COMPLETA_N, L.CODIGO_POSTAL, P.TITULO, L.PAIS ');
        SQL.Add(' FROM SYS_TERCEROS T ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' ON (T.TERCERO = D.TERCERO) ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ');
        SQL.Add(' ON (D.ID_LOCAL = L.ID_LOCAL) ');
        SQL.Add(' JOIN SYS_PROVINCIAS P ');
        SQL.Add(' ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' T.TERCERO = :TERCERO AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        Params.ByName['TERCERO'].AsInteger := QMAsientosTERCERO.AsInteger;
        ExecQuery;
        QMAsientosNOMBRE.AsString := FieldByName['NOMBRE_R_SOCIAL'].AsString;
        QMAsientosDIRECCION.AsString := FieldByName['DIR_COMPLETA_N'].AsString;
        QMAsientosC_POSTAL.AsString := FieldByName['CODIGO_POSTAL'].AsString;
        QMAsientosPROVINCIA.AsString := FieldByName['TITULO'].AsString;
        QMAsientosNIF.AsString := FieldByName['NIF'].AsString;
        QMAsientosPAIS.AsString := FieldByName['PAIS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosMODO_IVAChange(Sender: TField);
begin
  with xModoIva do
  begin
     Close;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosCUENTAChange(Sender: TField);
begin
  with xCuentas do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal; {dji lrk kri}
     Open;
  end;
end;

procedure TDMBorradorContabilidad.ObtenerDatosIVA(TipoApunte: string);
var
  TipoIva : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_DAME_CUENTA_IVA(:EMPRESA, :EJERCICIO, :CANAL, :RIB, :TIPO)';
        Params.ByName['EMPRESA'].AsInteger := QMApuntesEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMApuntesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
        Params.ByName['RIB'].AsInteger := QMApuntesRIB.AsInteger;
        Params.ByName['TIPO'].AsString := TipoApunte;
        ExecQuery;
        if (QMAsientosSIGNO.AsInteger = 0) then
           QMApuntesABONO.AsString := FieldByName['CUENTA'].AsString
        else
           QMApuntesCARGO.AsString := FieldByName['CUENTA'].AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Hallamos TIPO_IVA
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO FROM SYS_TIPO_APUNTE WHERE PAIS = :PAIS AND TIPO_APUNTE = :TIPO_APUNTE';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['TIPO_APUNTE'].AsString := TipoApunte;
        ExecQuery;
        TipoIva := FieldByName['TIPO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_DAME_IVA(:B_IMPONIBLE, :TIPO_IVA, :PAIS, :MONEDA, :MODO_IVA)';
        Params.ByName['B_IMPONIBLE'].AsFloat := QMApuntesB_IMPONIBLE.AsFloat;
        Params.ByName['TIPO_IVA'].AsInteger := TipoIva;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['MONEDA'].AsString := QMAsientosMONEDA.AsString;
        Params.ByName['MODO_IVA'].AsInteger := QMAsientosMODO_IVA.AsInteger;
        ExecQuery;
        QMApuntesIMPORTE.AsFloat := FieldByName['IVA'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBorradorContabilidad.QMApuntesBeforeDelete(DataSet: TDataSet);
begin
  refrescaDetalles := False;
  if (Pos('IVA', QMApuntesTIPO.AsString) > 0) then
     refrescaDetalles := True;
end;

procedure TDMBorradorContabilidad.QMApuntesBeforeInsert(DataSet: TDataSet);
begin
  refrescaDetalles := True;
end;

procedure TDMBorradorContabilidad.QMAsientosMAESTROChange(Sender: TField);
begin
  if (TipoAsiento = 'AFC') then
  begin
     with xClientes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := Sender.AsInteger;
        Open;
        QMAsientosTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMAsientosCUENTA.AsString := FieldByName('CUENTA').AsString;
        QMAsientosFORMA_PAGO.AsString := FieldByName('FORMA_PAGO').AsString;
        QMAsientosMODO_IVA.AsInteger := FieldByName('MODO_IVA').AsInteger;
     end;
  end;
  if (TipoAsiento = 'AFP') then
  begin
     with xProveedor do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
        Params.ByName['PROVEEDOR'].AsInteger := Sender.AsInteger;
        Open;
        QMAsientosTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMAsientosCUENTA.AsString := FieldByName('CUENTA').AsString;
        QMAsientosFORMA_PAGO.AsString := FieldByName('FORMA_PAGO').AsString;
        QMAsientosMODO_IVA.AsInteger := FieldByName('MODO_IVA').AsInteger;
     end;
  end;
  if (TipoAsiento = 'AFA') then
  begin
     with xAcreedor do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
        Params.ByName['ACREEDOR'].AsInteger := Sender.AsInteger;
        Open;
        QMAsientosTERCERO.AsInteger := FieldByName('TERCERO').AsInteger;
        QMAsientosCUENTA.AsString := FieldByName('CUENTA').AsString;
        QMAsientosFORMA_PAGO.AsString := FieldByName('FORMA_PAGO').AsString;
        QMAsientosMODO_IVA.AsInteger := FieldByName('MODO_IVA').AsInteger;
        QMAsientosCUENTA_CON.AsString := FieldByName('CUENTA_GASTOS').AsString;
     end;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosCUENTA_CONChange(Sender: TField);
begin
  with xCuentasCon do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal; {dji lrk kri}
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosTIPO_IVAChange(Sender: TField);
begin
  with xTipoIva do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO_IVA'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosFORMA_PAGOChange(Sender: TField);
begin
  with xFormasPago do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal; {dji lrk kri}
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosDOC_SERIEChange(Sender: TField);
begin
  with xSerie do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal; {dji lrk kri}
     Open;
  end;
end;

procedure TDMBorradorContabilidad.RellenaFacturaBorrador;
begin
  // if((QMAsientos.State = dsInsert)or(CambioAsiento <> TipoAsiento))then
  // begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (TipoAsiento = 'AFC') then
           SQL.Text :=
              'SELECT MIN(CLIENTE) FROM VER_CLIENTES_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        if (TipoAsiento = 'AFP') then
           SQL.Text :=
              'SELECT MIN(PROVEEDOR) FROM VER_PROVEEDORES_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        if (TipoAsiento = 'AFA') then
           SQL.Text :=
              'SELECT MIN(ACREEDOR) FROM VER_ACREEDORES_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCanal.AsInteger;
        ExecQuery;
        QMAsientosMAESTRO.AsInteger := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((TipoAsiento = 'AFC') or (TipoAsiento = 'AFP')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MIN(CUENTA) FROM CON_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND TIPO = :TIPO AND GESTION = :GESTION';
           Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMAsientosCanal.AsInteger;
           Params.ByName['TIPO'].AsInteger := 5;
           if (TipoAsiento = 'AFC') then
              Params.ByName['GESTION'].AsInteger := 2
           else if (TipoAsiento = 'AFP') then
              Params.ByName['GESTION'].AsInteger := 1;
           ExecQuery;
           QMAsientosCUENTA_CON.AsString := FieldByName['MIN'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  QMAsientosDOC_SERIE.AsString := REntorno.Serie;
  QMAsientosBASE_IMPONIBLE.AsInteger := 0;
  QMAsientosDOC_NUMERO.AsInteger := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE DEFECTO = 1 AND PAIS = :PAIS';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        ExecQuery;
        QMAsientosTIPO_IVA.AsInteger := FieldByName['TIPO'].AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  // end;
end;

procedure TDMBorradorContabilidad.QMAsientosAfterInsert(DataSet: TDataSet);
begin
  tipoold := QMAsientosTIPO.AsString;
end;

procedure TDMBorradorContabilidad.QMAsientosCarteraNewRecord(DataSet: TDataSet);
begin
  QMAsientosCarteraEMPRESA.AsInteger := QMAsientosEMPRESA.AsInteger;
  QMAsientosCarteraEJERCICIO.AsInteger := QMAsientosEJERCICIO.AsInteger;
end;

procedure TDMBorradorContabilidad.MuestraRecibos;
var
  signo, signo2 : string;
begin
  if (QMAsientosTIPO.AsString = 'CRC') then
  begin
     signo := 'C';
     signo2 := 'C';
  end
  else
  begin
     signo := 'P';
     signo2 := 'P';
  end;

  if (QMAsientosTIPO.AsString = 'CPB') then
     signo2 := 'C';

  with QMRecibos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
     Params.ByName['SIGNO'].AsString := signo;
     Params.ByName['SIGNO2'].AsString := signo2;
     Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.QMRecibosLIQUIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMRecibosMONEDA.AsString, 1),
     QMRecibosLIQUIDO.AsFloat);
end;

procedure TDMBorradorContabilidad.QMRecibosBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMBorradorContabilidad.QMRecibosBeforeDelete(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMBorradorContabilidad.QMRecibosAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMBorradorContabilidad.QMRecibosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State <> dsEdit) then
     DataSet.Cancel;
end;

procedure TDMBorradorContabilidad.QMRecibosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMBorradorContabilidad.MarcaRecibos(Modo: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_MARCA_ENTRADAS_REC(:EMPRESA, :EJERCICIO, :CANAL, :RIB, :ENTRADA, :TIPO, :MODO)';
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
        Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := QMAsientosTIPO.AsString;
        Params.ByName['MODO'].AsInteger := Modo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBorradorContabilidad.RegeneraAsientoRecibos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_REGENERA_RECIBOS(:EMPRESA, :EJERCICIO, :CANAL, :RIB, :ENTRADA, :TIPO, :MODO)';
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
        Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := QMAsientosTIPO.AsString;
        Params.ByName['MODO'].AsInteger := 0;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Refrescamos
  QMAsientos.Refresh;
  MarcaRecibos(1);
  QMRecibos.Close;
  QMRecibos.Open;
end;

procedure TDMBorradorContabilidad.InsertaCoste(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'insert into con_borrador_apuntes_costes(empresa,ejercicio,rib,' +
           'linea,digito_1,digito_2,digito_3,digito_4,digito_5)values(' +
           QMApuntesEMPRESA.AsString + ',' + QMApuntesEJERCICIO.AsString + ',' +
           QMApuntesRIB.AsString + ',' + QMApuntesLINEA.AsString + ',' +
           '?d1,?d2,?d3,?d4,?d5)';
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  if ((QMApuntes.State = dsInsert) or (QMApuntes.State = dsEdit)) then
     QMApuntes.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update con_borrador_apuntes ' +
           ' set centro_coste=1' +
           ' where empresa=' + QMApuntesEMPRESA.AsString +
           ' and ejercicio=' + QMApuntesEJERCICIO.AsString +
           ' and rib=' + QMApuntesRIB.AsString +
           ' and linea=' + QMApuntesLINEA.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMApuntes.Refresh;
  QMCentroCoste.Close;
  QMCentroCoste.Open;
end;

procedure TDMBorradorContabilidad.ActualizaCoste(d1, d2, d3, d4, d5: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update con_borrador_apuntes_costes ' +
           ' set digito_1=?d1' +
           ' ,digito_2=?d2' + ' ,digito_3=?d3' +
           ' ,digito_4=?d4' + ' ,digito_5=?d5' +
           ' where empresa=' + QMApuntesEMPRESA.AsString + ' and ejercicio=' +
           QMApuntesEJERCICIO.AsString + ' and rib=' + QMApuntesRIB.AsString +
           ' and linea=' + QMApuntesLINEA.AsString;
        Params.ByName['d1'].AsString := d1;
        Params.ByName['d2'].AsString := d2;
        Params.ByName['d3'].AsString := d3;
        Params.ByName['d4'].AsString := d4;
        Params.ByName['d5'].AsString := d5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCentroCoste.Close;
  QMCentroCoste.Open;
end;

procedure TDMBorradorContabilidad.BorraCoste; // dji lrk kri Centros de Coste
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'delete from con_borrador_apuntes_costes ' +
           'where empresa=' + QMApuntesEMPRESA.AsString + ' and ejercicio=' +
           QMApuntesEJERCICIO.AsString + ' and rib=' + QMApuntesRIB.AsString +
           ' and linea=' + QMApuntesLINEA.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((QMApuntes.State = dsInsert) or (QMApuntes.State = dsEdit)) then
     QMApuntes.Post;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update con_borrador_apuntes ' +
           ' set centro_coste=0' +
           ' where empresa=' + QMApuntesEMPRESA.AsString +
           ' and ejercicio=' + QMApuntesEJERCICIO.AsString + ' and rib=' +
           QMApuntesRIB.AsString +
           ' and linea=' + QMApuntesLINEA.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMApuntes.Refresh;
  QMCentroCoste.Close;
  QMCentroCoste.Open;
end;

function TDMBorradorContabilidad.CostesIntroducidos: smallint;
begin
  with SPCostesIntroducidos do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['ejercicio'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['rib'].AsInteger := QMAsientosRIB.AsInteger;
     ExecQuery;
     Result := FieldByName['numero'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMBorradorContabilidad.PedirCentroCoste;
var
  ID : integer;
  Cuenta : string;
begin
  if ((xCargos.FieldByName('CENTRO_COSTE').AsInteger = 1) or
     (xAbonos.FieldByName('CENTRO_COSTE').AsInteger = 1)) then
  begin
     // Paso los centros de coste a una tabla temporal
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID FROM TMP_TRASPASA_CENTRO_COSTE (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?MODO,?ID_TMP)';
           Params.ByName['EMPRESA'].AsInteger := QMApuntesEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMApuntesEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := 'A'; // No se utiliza
           Params.ByName['TIPO'].AsString := 'BOR';
           Params.ByName['RIG'].AsInteger := QMApuntesRIB.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMApuntesLINEA.AsInteger;
           Params.ByName['MODO'].AsInteger := 0;
           Params.ByName['ID_TMP'].AsInteger := 0;
           ExecQuery;
           id := FieldByName['ID'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (xCargos.FieldByName('CENTRO_COSTE').AsInteger = 1) then
        Cuenta := xCargos.FieldByName('CUENTA').AsString;
     if (xAbonos.FieldByName('CENTRO_COSTE').AsInteger = 1) then
        Cuenta := xAbonos.FieldByName('CUENTA').AsString;

     TFMDigitosCoste.Create(Self).Muestra(id, Cuenta);

     // Paso los centros de coste desde la tabla temporal
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID FROM TMP_TRASPASA_CENTRO_COSTE (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?MODO,?ID_TMP)';
           Params.ByName['EMPRESA'].AsInteger := QMApuntesEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMApuntesEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := 'A'; // No se utiliza
           Params.ByName['TIPO'].AsString := 'BOR';
           Params.ByName['RIG'].AsInteger := QMApuntesRIB.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMApuntesLINEA.AsInteger;
           Params.ByName['MODO'].AsInteger := 1;
           Params.ByName['ID_TMP'].AsInteger := id;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosAfterScroll(DataSet: TDataSet);
begin
  Text := '';
end;

procedure TDMBorradorContabilidad.QMApuntesCUENTA_CONChange(Sender: TField);
begin
  with xCuentasConDetalle do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMAsientosCANAL.AsInteger;
     Params.ByName['CUENTA_CON'].AsString := QMApuntesCUENTA_CON.AsString;
     Open;
  end;
end;

procedure TDMBorradorContabilidad.RellenaDatosExtendidos;
begin
  QMAsientosDOC_NUMERO.AsInteger := 1;
  QMAsientosDOC_SERIE.AsString := REntorno.Serie;
end;

procedure TDMBorradorContabilidad.xCargosBeforeOpen(DataSet: TDataSet);
var
  Pgc : integer;
begin
  Pgc := DamePgc(EntornoFind.Empresa, EntornoFind.Ejercicio,
     EntornoFind.Canal);
  xCargos.Params.ByName['Canal'].AsInteger := EntornoFind.Canal;
  xCargos.Params.ByName['Pgc'].AsInteger := Pgc;
end;

procedure TDMBorradorContabilidad.xAbonosBeforeOpen(DataSet: TDataSet);
var
  Pgc : integer;
begin
  Pgc := DamePgc(EntornoFind.Empresa, EntornoFind.Ejercicio,
     EntornoFind.Canal);
  xAbonos.Params.ByName['Canal'].AsInteger := EntornoFind.Canal;
  xAbonos.Params.ByName['Pgc'].AsInteger := Pgc;
end;

procedure TDMBorradorContabilidad.CambiaTextoAsiento;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_BORRADOR_CAMBIA_TEXTO(:EMPRESA, :EJERCICIO, :RIB)';
        Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
        Params.ByName['RIB'].AsInteger := QMAsientosRIB.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  PosicionaRIB(QMAsientosEMPRESA.AsInteger, QMAsientosEJERCICIO.AsInteger, QMAsientosRIB.AsInteger);
end;

procedure TDMBorradorContabilidad.RenContador(Ejercicio: integer);
var
  MaxRIB : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(RIB) FROM CON_BORRADOR_ASIENTOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        ExecQuery;
        MaxRIB := FieldByName['MAX'].AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CONTADORES_AJUSTA_EE(:EMPRESA, :EJERCICIO, ''RIB'', :ACTUAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['ACTUAL'].AsInteger := MaxRIB;
        ExecQuery;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBorradorContabilidad.AbreAuxiliaresNIF;
begin
  QMAsientosMAESTROChange(QMAsientosMAESTRO);
  xFormasPago.Close;
  xFormasPago.Open;
  xSerie.Close;
  xSerie.Open;
  xCuentas.Close;
  xCuentas.Open;
  xCuentasCon.Close;
  xCuentasCon.Open;
  xModoIva.Close;
  xModoIva.Open;
  QMAsientosTIPO_IVAChange(QMAsientosTIPO_IVA);
end;

function TDMBorradorContabilidad.ValidaDocumento(RIG: integer; Serie: string; Modo: byte): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Modo = 0) then
           SQL.Add(' SELECT RDB$DB_KEY FROM GES_CABECERAS_E ')
        else
           SQL.Add(' SELECT RDB$DB_KEY FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO AND ');
        SQL.Add(' RIG = ?RIG ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        if (Modo = 0) then
           Params.ByName['TIPO'].AsString := 'FAP'
        else
           Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := RIG;
        ExecQuery;
        Result := not (HayDatos);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMBorradorContabilidad.InicializaProceso: TDocInfoList;
begin
  QMAsientos.DisableControls;
  Result := FillDocInfoListFromDRO(QMAsientos);
  QMAsientos.Close;
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMBorradorContabilidad.TerminaProceso;
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  QMAsientos.Close;
  QMAsientos.Open;
  QMAsientos.First;
  QMAsientos.EnableControls;
end;

procedure TDMBorradorContabilidad.TraspasaAsiento;
begin
  if (QMAsientosCANAL.AsInteger = 0) then
  begin
     QMAsientos.Edit;
     QMAsientosCANAL.AsInteger := REntorno.Canal;
     QMasientos.Post;
     QMAsientos.Transaction.CommitRetaining;
  end;
  with QSPTraspasa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMAsientosEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMAsientosEJERCICIO.AsInteger;
     Params.ByName['Canal'].AsInteger := QMAsientosCANAL.AsInteger;
     Params.ByName['Rib'].AsInteger := QMAsientosRIB.AsInteger;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMBorradorContabilidad.QMApuntesPROYECTOChange(Sender: TField);
begin
  xProyectos.Close;
  xProyectos.Open;
  QMApuntesTITULO_PROYECTO.AsString := xProyectos.FieldByName('TITULO').AsString;
end;

function TDMBorradorContabilidad.FillDocInfoListFromDRO(dro: TFIBTableSet): TDocInfoList;
var
  List : TDocInfoList;
  node : TDocInfo;
begin
  with dro do
  begin
     First;
     List := TList.Create();
     while not EOF do
     begin
        if (FieldByName('LINEAS').AsInteger > 0) then
        begin
           node := TDocInfo.Create();
           try
              node.empresa := FieldByName('empresa').AsInteger;
           except
              on E: Exception do
                 node.empresa := 0;
           end;

           try
              node.ejercicio := FieldByName('ejercicio').AsInteger;
           except
              on E: Exception do
                 node.ejercicio := 0;
           end;

           try
              node.canal := FieldByName('canal').AsInteger;
           except
              on E: Exception do
                 node.canal := 0;
           end;

           try
              node.asiento := FieldByName('rib').AsInteger;
           except
              on E: Exception do
                 node.asiento := 0;
           end;
           List.Add(node);
        end;
        Next;
     end;
  end;
  Result := List;
end;

function TDMBorradorContabilidad.TraspasaAsientoFiltrado(Empresa, Ejercicio, Canal, Asiento: integer): boolean;
begin
  if (Canal = 0) then
     Canal := REntorno.Canal;
  Result := True;
  try
     with QSPTraspasa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['RIB'].AsInteger := Asiento;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  except
     on E: Exception do
        Result := False;
  end;
end;

procedure TDMBorradorContabilidad.SetPGCBeforeOpen(DataSet: TDataSet);
var
  Pgc : integer;
begin
  Pgc := DamePgc(QMAsientosEmpresa.AsInteger, QMAsientosEjercicio.AsInteger,
     QMAsientosCanal.AsInteger);
  TFIBDataSetRO(DataSet).Params.ByName['Pgc'].AsInteger := Pgc;
end;

procedure TDMBorradorContabilidad.TraspasaAsientosFiltrados;
var
  WndList : Pointer;
  docList : TDocInfoList;
  node : TDocInfo;
  // Errores : integer;
  i : integer;
begin
  Screen.Cursor := crHourGlass;
  FInfoTraspasoACont := TFInfoTraspasoACont.Create(Self);
  try
     WndList := DisableTaskWindows(FInfoTraspasoACont.Handle);
     try
        with FInfoTraspasoACont do
        begin
           LBLGeneral.Caption := _('Inicializando Traspaso...');
           GBProcesaCab.Visible := False;
           Show;
        end;

        docList := InicializaProceso;
        try
           with FInfoTraspasoACont do
           begin
              LBLGeneral.Caption := _('Traspasando asientos a contabilidad...');
              GBProcesaCab.Visible := True;
           end;

           // Errores := 0;
           for i := 0 to docList.Count - 1 do
           begin
              Application.ProcessMessages;
              node := docList[i];
              with FInfoTraspasoACont do
              begin
                 LBLEjercicio.Caption := IntToStr(node.Ejercicio);
                 LBLRIb.Caption := IntToStr(node.Asiento);
              end;
              TraspasaAsientoFiltrado(node.Empresa, node.Ejercicio, node.Canal, node.Asiento);
              // if not (TraspasaAsientoFiltrado(node.Empresa, node.Ejercicio, node.Canal, node.Asiento)) then
              //    Errores := Errores + 1;
           end;

           // Libero la memoria utilizada por cada nodo
           for i := 0 to docList.Count - 1 do
           begin
              node := docList[i];
              node.Free;
           end;
        finally
           // Libero la memoria utilizada por la lista
           docList.Free;
           TerminaProceso;
        end;
     finally
        EnableTaskWindows(WndList);
     end;
  finally
     Screen.Cursor := crDefault;
     FInfoTraspasoACont.Free;
  end;
end;

function TDMBorradorContabilidad.DamePaisEEC(Empresa, Ejercicio, Canal: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PAIS FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        ExecQuery;
        Result := FieldByName['PAIS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBorradorContabilidad.QMAsientosBeforeDelete(DataSet: TDataSet);
begin
  if (DMMain.ExisteAdjunto('ASI', QMAsientosID_ASIENTO.AsInteger)) then
     if not ConfirmaMensaje(_('El asiento asociado tiene adjunto/s. Si borra el registro se perdera el adjunto')) then
        Abort;
end;

end.
