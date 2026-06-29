unit UDMCierreParcialOrden;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet, FIBTableDataSet, UEntorno, HYFIBQuery, DateUtils, FR_Class,
  Fr_HYReport;

type
  TDMCierreParcialOrden = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMCierreParcial: TDataSource;
     QMCierreParcial: TFIBTableSet;
     QMCierreParcialDetalle: TFIBTableSet;
     QMCierreParcialDetalleLote: TFIBTableSet;
     DSQMCierreParcialDetalle: TDataSource;
     DSQMCierreParcialDetalleLote: TDataSource;
     QMCierreParcialEMPRESA: TIntegerField;
     QMCierreParcialEJERCICIO: TIntegerField;
     QMCierreParcialCANAL: TIntegerField;
     QMCierreParcialSERIE: TFIBStringField;
     QMCierreParcialCIERRE: TIntegerField;
     QMCierreParcialFECHA_CREACION: TDateTimeField;
     QMCierreParcialESTADO: TIntegerField;
     QMCierreParcialCOMENTARIO: TFIBStringField;
     QMCierreParcialID: TIntegerField;
     QMCierreParcialENTRADA: TIntegerField;
     QMCierreParcialDetalleEMPRESA: TIntegerField;
     QMCierreParcialDetalleEJERCICIO: TIntegerField;
     QMCierreParcialDetalleCANAL: TIntegerField;
     QMCierreParcialDetalleSERIE: TFIBStringField;
     QMCierreParcialDetalleCIERRE: TIntegerField;
     QMCierreParcialDetalleLINEA: TIntegerField;
     QMCierreParcialDetalleRIG_OF: TIntegerField;
     QMCierreParcialDetalleARTICULO: TFIBStringField;
     QMCierreParcialDetalleORIGEN: TFIBStringField;
     QMCierreParcialDetalleALMACEN: TFIBStringField;
     QMCierreParcialDetalleID: TIntegerField;
     QMCierreParcialDetalleID_CIERRE: TIntegerField;
     QMCierreParcialDetalleID_ORDEN: TIntegerField;
     QMCierreParcialDetalleRIG_MOV: TIntegerField;
     QMCierreParcialDetalleENTRADA: TIntegerField;
     QMCierreParcialDetalleLoteEMPRESA: TIntegerField;
     QMCierreParcialDetalleLoteEJERCICIO: TIntegerField;
     QMCierreParcialDetalleLoteCANAL: TIntegerField;
     QMCierreParcialDetalleLoteSERIE: TFIBStringField;
     QMCierreParcialDetalleLoteCIERRE: TIntegerField;
     QMCierreParcialDetalleLoteLINEA: TIntegerField;
     QMCierreParcialDetalleLoteSUB_LINEA: TIntegerField;
     QMCierreParcialDetalleLoteRIG_OF: TIntegerField;
     QMCierreParcialDetalleLoteALM_DEST: TFIBStringField;
     QMCierreParcialDetalleLoteUBICACION: TFIBStringField;
     QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS: TFloatField;
     QMCierreParcialDetalleLoteUNIDADES_POR_UL: TFloatField;
     QMCierreParcialDetalleLoteUNIDADES: TFloatField;
     QMCierreParcialDetalleLoteID: TIntegerField;
     QMCierreParcialDetalleLoteID_DET: TIntegerField;
     QMCierreParcialDetalleLoteID_CIERRE: TIntegerField;
     QMCierreParcialDetalleLoteESTADO: TIntegerField;
     QMCierreParcialDetalleLoteID_DETALLES_ST: TIntegerField;
     QMCierreParcialDetalleLoteID_UBICACION: TIntegerField;
     QMCierreParcialDetalleLoteLINEA_UBICACION: TIntegerField;
     QMCierreParcialDetalleLoteID_D_ST_UBICACION: TIntegerField;
     QMCierreParcialDetalleLoteENTRADA: TIntegerField;
     QMCierreParcialDetalleTITULO: TFIBStringField;
     QMCierreParcialDetalleUNIDADES: TFloatField;
     QMCierreParcialDetalleID_LOTE: TIntegerField;
     QMCierreParcialDetalleDescLote: TStringField;
     QMCierreParcialDetalleLoteDescLote: TStringField;
     QMCierreParcialDetalleLoteID_LOTE: TIntegerField;
     QMCierreParcialDetalleLoteLOTE: TFIBStringField;
     QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMCierreParcialDetalleLoteOPERARIO: TIntegerField;
     QMCierreParcialDetalleLoteNOTAS: TBlobField;
     QMCierreParcialDetalleLoteCALIDAD: TFIBStringField;
     QMCierreParcialDetalleLoteFECHA: TDateTimeField;
     QMCierreParcialDetalleLoteNUM_ETIQUETAS: TIntegerField;
     frLotes: TfrHYReport;
     QMCierreParcialDetalleDescSituacion: TStringField;
     QMCierreParcialDetalleLoteORDEN_LOTE_SECUENCIAL: TIntegerField;
     QMCierreParcialDetalleLoteARTICULO: TFIBStringField;
     QMCierreParcialDetalleLoteDescArticulo: TStringField;
     QMCierreParcialDetalleLoteSUM_UNIDADES: TFloatField;
     QMCierreParcialDetalleComponente: TFIBTableSet;
     DSQMCierreParcialDetalleComponente: TDataSource;
     QMCierreParcialDetalleComponenteEMPRESA: TIntegerField;
     QMCierreParcialDetalleComponenteEJERCICIO: TIntegerField;
     QMCierreParcialDetalleComponenteCANAL: TIntegerField;
     QMCierreParcialDetalleComponenteSERIE: TFIBStringField;
     QMCierreParcialDetalleComponenteCIERRE: TIntegerField;
     QMCierreParcialDetalleComponenteLINEA: TIntegerField;
     QMCierreParcialDetalleComponenteSUB_LINEA: TIntegerField;
     QMCierreParcialDetalleComponenteSUB_LINEA_COMPONENTE: TIntegerField;
     QMCierreParcialDetalleComponenteRIG_OF: TIntegerField;
     QMCierreParcialDetalleComponenteARTICULO: TFIBStringField;
     QMCierreParcialDetalleComponenteTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMCierreParcialDetalleComponenteLOTE: TFIBStringField;
     QMCierreParcialDetalleComponenteALM_DEST: TFIBStringField;
     QMCierreParcialDetalleComponenteUBICACION: TFIBStringField;
     QMCierreParcialDetalleComponenteUNIDADES_LOGISITCAS: TFloatField;
     QMCierreParcialDetalleComponenteUNIDADES_POR_UL: TFloatField;
     QMCierreParcialDetalleComponenteUNIDADES: TFloatField;
     QMCierreParcialDetalleComponenteID: TIntegerField;
     QMCierreParcialDetalleComponenteID_CIERRE: TIntegerField;
     QMCierreParcialDetalleComponenteID_DET: TIntegerField;
     QMCierreParcialDetalleComponenteESTADO: TIntegerField;
     QMCierreParcialDetalleComponenteID_DETALLES_ST: TIntegerField;
     QMCierreParcialDetalleComponenteID_UBICACION: TIntegerField;
     QMCierreParcialDetalleComponenteLINEA_UBICACION: TIntegerField;
     QMCierreParcialDetalleComponenteID_D_ST_UBICACION: TIntegerField;
     QMCierreParcialDetalleComponenteENTRADA: TIntegerField;
     QMCierreParcialDetalleComponenteID_LOTE: TIntegerField;
     QMCierreParcialDetalleComponenteOPERARIO: TIntegerField;
     QMCierreParcialDetalleComponenteFECHA: TDateTimeField;
     QMCierreParcialDetalleLoteUNIDADES_RECHAZO: TFloatField;
     QMCierreParcialDetalleLoteID_RESERVA: TIntegerField;
     QMCierreParcialDetalleCLASIFICACION: TStringField;
     QMCierreParcialDetalleLoteCLASIFICACION: TStringField;
     QMCierreParcialDetalleComponenteCLASIFICACION: TStringField;
     QMCierreParcialDetalleComponenteUNIDADES_DEVOLVER: TFloatField;
     QMCierreParcialDetalleComponenteALMACEN_DEVOLVER: TFIBStringField;
     QMCierreParcialDetalleComponenteID_LOTE_DEV: TIntegerField;
     QMCierreParcialDetalleComponenteLOTE_DEV: TFIBStringField;
     QMCierreParcialDetalleComponenteTITULO: TFIBStringField;
     QMCierreParcialDetalleComponenteUNIDADES_REALES: TFloatField;
     QMCierrePCompuesto: TFIBTableSet;
     DSQMCierrePCompuesto: TDataSource;
     QMCierrePCompuestoEMPRESA: TIntegerField;
     QMCierrePCompuestoEJERCICIO: TIntegerField;
     QMCierrePCompuestoCANAL: TIntegerField;
     QMCierrePCompuestoSERIE: TFIBStringField;
     QMCierrePCompuestoCIERRE: TIntegerField;
     QMCierrePCompuestoLINEA: TIntegerField;
     QMCierrePCompuestoSUB_LINEA: TIntegerField;
     QMCierrePCompuestoSUB_LINEA_COMPUESTO: TIntegerField;
     QMCierrePCompuestoRIG_OF: TIntegerField;
     QMCierrePCompuestoARTICULO: TFIBStringField;
     QMCierrePCompuestoTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMCierrePCompuestoLOTE: TFIBStringField;
     QMCierrePCompuestoALM_DEST: TFIBStringField;
     QMCierrePCompuestoUBICACION: TFIBStringField;
     QMCierrePCompuestoUNIDADES_LOGISITCAS: TFloatField;
     QMCierrePCompuestoUNIDADES_POR_UL: TFloatField;
     QMCierrePCompuestoUNIDADES: TFloatField;
     QMCierrePCompuestoID: TIntegerField;
     QMCierrePCompuestoID_CIERRE: TIntegerField;
     QMCierrePCompuestoID_DET: TIntegerField;
     QMCierrePCompuestoID_DETALLES_ST: TIntegerField;
     QMCierrePCompuestoID_UBICACION: TIntegerField;
     QMCierrePCompuestoLINEA_UBICACION: TIntegerField;
     QMCierrePCompuestoID_D_ST_UBICACION: TIntegerField;
     QMCierrePCompuestoENTRADA: TIntegerField;
     QMCierrePCompuestoID_LOTE: TIntegerField;
     QMCierrePCompuestoOPERARIO: TIntegerField;
     QMCierrePCompuestoFECHA: TDateTimeField;
     QMCierrePCompuestoUNIDADES_RECHAZO: TFloatField;
     QMCierrePCompuestoID_DETALLES_ST_REC: TIntegerField;
     QMCierrePCompuestoID_RESERVA: TIntegerField;
     QMCierrePCompuestoTITULO: TFIBStringField;
     procedure QMCierreParcialNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCierreParcialBeforePost(DataSet: TDataSet);
     procedure QMCierreParcialDetalleNewRecord(DataSet: TDataSet);
     procedure QMCierreParcialDetalleBeforePost(DataSet: TDataSet);
     procedure QMCierreParcialAfterOpen(DataSet: TDataSet);
     procedure QMCierreParcialBeforeClose(DataSet: TDataSet);
     procedure QMCierreParcialDetalleAfterOpen(DataSet: TDataSet);
     procedure QMCierreParcialDetalleBeforeClose(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteBeforePost(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteNewRecord(DataSet: TDataSet);
     procedure QMCierreParcialESTADOChange(Sender: TField);
     procedure QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
     procedure QMCierreParcialDetalleLoteUNIDADESChange(Sender: TField);
     procedure QMCierreParcialDetalleLoteUNIDADES_POR_ULChange(Sender: TField);
     procedure QMCierreParcialDetalleLoteID_UBICACIONChange(Sender: TField);
     procedure QMCierreParcialDetalleLoteUNIDADES_LOGISITCASChange(Sender: TField);
     procedure QMCierreParcialDetalleLoteALM_DESTChange(Sender: TField);
     procedure QMCierreParcialDetalleDescLoteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCierreParcialDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteBeforeEdit(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteBeforeInsert(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteAfterEdit(DataSet: TDataSet);
     procedure frLotesGetValue(const ParName: string; var ParValue: variant);
     procedure QMCierreParcialDetalleDescSituacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCierreParcialDetalleLoteDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCierreParcialDetalleLoteARTICULOChange(Sender: TField);
     procedure QMCierreParcialDetalleLoteSUM_UNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCierreParcialDetalleLoteAfterPost(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteAfterCancel(DataSet: TDataSet);
     procedure QMCierreParcialDetalleComponenteNewRecord(DataSet: TDataSet);
     procedure QMCierreParcialDetalleComponenteID_LOTEChange(Sender: TField);
     procedure QMCierreParcialDetalleComponenteAfterScroll(DataSet: TDataSet);
     procedure DameSqlImpresionEtiquetas(SQL: TStrings);
     procedure QMCierreParcialDetalleCLASIFICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCierreParcialDetalleLoteCLASIFICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCierreParcialDetalleComponenteCLASIFICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCierreParcialDetalleComponenteID_LOTE_DEVChange(Sender: TField);
     procedure QMCierreParcialDetalleComponenteUNIDADES_REALESChange(Sender: TField);
     procedure QMCierrePCompuestoNewRecord(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteAfterOpen(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteBeforeClose(DataSet: TDataSet);
     procedure QMCierrePCompuestoBeforePost(DataSet: TDataSet);
     procedure QMCierreParcialDetalleLoteFECHAChange(Sender: TField);
  private
     { Private declarations }
     Serie: string;
     NoExcederUnidadesReservadas: boolean;
     CierreParcialSecuencial: boolean;
     InsertandoDetalleLote: boolean;
     FAlmacenUbicable: boolean;
     FUltimoArticulo: string;
     FArticuloUbicable: boolean;
     FArticuloLoteable: boolean;
     CalculaUnidadesDevolver: boolean;
     Param_ALBETIQ001: integer;
     procedure EstadoSituacion;
     function DameMaxSubLinea(Cierre, Linea: integer): integer; //sfg.albert
     function DameMaxOrdenLoteSecuencial(id_orden: integer): integer; //sfg.albert
     procedure ObrirDetallLote(Crear: integer);
     procedure RefrescaDatosArticulo;
  public
     { Public declarations }
     CrearLoteLanzarOP: boolean;
     CalculaUnidadLogistica: boolean;
     CambiaEstdoCierre: boolean;
     procedure Filtra(ASerie: string);
     procedure CambiaEstado(Direccion: integer);
     procedure BusquedaCompleja; //sfg.albert
     function HayDetalle: boolean; //sfg.ruth
     procedure ImprimirEtiquetas(numEtiquetas: integer; lote: string; modo: integer; articulo: string);//sfg.albert
     function ObtenerModelo_TyC: integer;
     procedure FiltraCierre(id_cierre: integer); //sfg.albert
     function HayDetalleComponente: boolean;
     function DameAlmacenUbicable: boolean;
     function DameArticuloLoteable: boolean;
     function DameArticuloUbicable: boolean;
     procedure CrearCierre(id_orden: integer);
     procedure InfoLotes(Tipo: integer);
     function LotesComponentesAsignados: string;
     function DameUnidadesPendientesCierre(IdReserva: integer): double;
     procedure CalculaLote;
  end;

var
  DMCierreParcialOrden : TDMCierreParcialOrden;

implementation

uses UDMMain, Dialogs, UFormGest, UUtiles, UDameDato, UFBusca,
  UFMCierreParcialOrdenDetalle, UDMListados, UFMAsignaLotes, UParam;

{$R *.dfm}

procedure TDMCierreParcialOrden.DataModuleCreate(Sender: TObject);
//var
//i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Param_ALBETIQ001 := StrToIntDef(LeeParametro('ALBETIQ001'), 0);

  {Busco el valor de la constante CrearLoteLanzarOP}
  CrearLoteLanzarOP := (DMMain.DameConstanteProduccion('OF_CREAR_LOTE_LANZAR_OP') = 1);
  CierreParcialSecuencial := (DMMain.DameConstanteProduccion('OF_CIERRE_PARCIAL_SECUENCIAL') = 1);
  NoExcederUnidadesReservadas := (DMMain.DameConstanteProduccion('NO_EXCEDER_UNIDADES_RESERVADAS') = 1);
  CalculaUnidadesDevolver := (LeeParametro('CIPUDEV001') = 'S');

  AsignaDisplayFormat(QMCierreParcial, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCierreParcialDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCierreParcialDetalleLote, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCierreParcialDetalleComponente, MascaraN, MascaraI, ShortDateFormat);

  CalculaUnidadLogistica := True;
  Serie := '';
  FUltimoArticulo := '';
end;

procedure TDMCierreParcialOrden.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMCierreParcialOrden.Filtra(ASerie: string);
begin
  if (Serie <> ASerie) then
  begin
     Serie := ASerie;
     with QMCierreParcial do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Open;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialNewRecord(DataSet: TDataSet);
begin
  QMCierreParcialEMPRESA.AsInteger := REntorno.Empresa;
  QMCierreParcialEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCierreParcialCANAL.AsInteger := REntorno.Canal;
  QMCierreParcialSERIE.AsString := Serie;
  QMCierreParcialFECHA_CREACION.AsDateTime := REntorno.FechaTrab;
  QMCierreParcialENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TDMCierreParcialOrden.QMCierreParcialBeforePost(DataSet: TDataSet);
begin
  if QMCierreParcialESTADO.AsInteger = 2 then
  begin
     QMCierreParcialDetalle.Cancel;
     ShowMessage(_('Imposible insertar o modificar un Cierre Cerrado'));
  end;

  if (QMCierreParcial.State = dsInsert) then
  begin
     QMCierreParcialCIERRE.AsInteger := DMMain.Contador_EEC('CPO');
     DMMain.Contador_Gen(QMCierreParcial, 'CONTA_CIERRE_ORDEN', 'ID', False);
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleNewRecord(DataSet: TDataSet);
begin
  QMCierreParcialDetalleEMPRESA.AsInteger := QMCierreParcialEMPRESA.AsInteger;
  QMCierreParcialDetalleEJERCICIO.AsInteger := QMCierreParcialEJERCICIO.AsInteger;
  QMCierreParcialDetalleCANAL.AsInteger := QMCierreParcialCANAL.AsInteger;
  QMCierreParcialDetalleSERIE.AsString := QMCierreParcialSERIE.AsString;
  QMCierreParcialDetalleCIERRE.AsInteger := QMCierreParcialCIERRE.AsInteger;
  QMCierreParcialDetalleID_CIERRE.AsInteger := QMCierreParcialID.AsInteger;
  QMCierreParcialDetalleORIGEN.AsString := 'T';
  QMCierreParcialDetalleENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleBeforePost(DataSet: TDataSet);
begin
  if QMCierreParcialESTADO.AsInteger = 2 then
  begin
     QMCierreParcialDetalle.Cancel;
     ShowMessage(_('Imposible insertar o modificar un Cierre Cerrado'));
  end;

  if QMCierreParcialDetalleID_ORDEN.AsInteger < 1 then
  begin
     QMCierreParcialDetalle.Cancel;
     ShowMessage(_('Orden de Produccion Inválido'));
  end;

  if QMCierreParcialDetalleLote.RecordCount > 0 then
  begin
     QMCierreParcialDetalle.Cancel;
     ShowMessage(_('Registro no editable'));
  end;

  if (QMCierreParcialDetalle.State = dsInsert) then
  begin
     ////////// BUSCO ID DETALLE CIERRE ///////////
     DMMain.Contador_Gen(QMCierreParcialDetalle, 'CONTA_CIERRE_ORDEN', 'ID', False);

     ////////// BUSCO LINEA DETALLE CIERRE ///////////
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM PRO_ORD_CIERRE_PARCIAL_DET ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' CIERRE = :CIERRE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CIERRE'].AsInteger := QMCierreParcialCIERRE.AsInteger;
           ExecQuery;
           QMCierreParcialDetalleLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialAfterOpen(DataSet: TDataSet);
begin
  QMCierreParcialDetalle.Open;
end;

procedure TDMCierreParcialOrden.QMCierreParcialBeforeClose(DataSet: TDataSet);
begin
  QMCierreParcialDetalle.Close;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleAfterOpen(DataSet: TDataSet);
begin
  QMCierreParcialDetalleLote.Open;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleBeforeClose(DataSet: TDataSet);
begin
  QMCierreParcialDetalleLote.Close;
end;

function TDMCierreParcialOrden.DameMaxSubLinea(Cierre, Linea: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(SUB_LINEA) FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' CIERRE = :CIERRE AND ');
        SQL.Add(' LINEA = :LINEA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CIERRE'].AsInteger := Cierre;
        Params.ByName['LINEA'].AsInteger := Linea;
        ExecQuery;
        Result := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteBeforePost(DataSet: TDataSet);
var
  unidades_pendientes : double;
  Articulo : string;
begin
  // Validamos que las unidades del cierre sean menores o igual a las unidades pendientes de cerrar de la reserva
  unidades_pendientes := DMCierreParcialOrden.DameUnidadesPendientesCierre(QMCierreParcialDetalleLoteID_RESERVA.AsInteger);

  Articulo := LotesComponentesAsignados;
  if (Articulo <> '') then
     raise Exception.Create(Format(_('Faltan asignar lotes. Artículo %s'), [Articulo]));

  if ((QMCierreParcialDetalleLoteUNIDADES.AsFloat > unidades_pendientes) and (NoExcederUnidadesReservadas)) then
  begin
     raise Exception.Create(_('No se puede hacer un cierre parcial con más unidades disponibles de la reserva'));
  end
  else
  begin
     if (QMCierreParcialDetalleLote.State = dsInsert) then
     begin
        ////////// BUSCO ID DETALLE CIERRE ///////////
        DMMain.Contador_Gen(QMCierreParcialDetalleLote, 'CONTA_CIERRE_ORDEN', 'ID', False);

        ////////// BUSCO LINEA DETALLE CIERRE ///////////
        QMCierreParcialDetalleLoteSUB_LINEA.AsInteger := DameMaxSubLinea(QMCierreParcialCIERRE.AsInteger, QMCierreParcialDetalleLINEA.AsInteger);
        if (ArticuloLoteable(QMCierreParcialDetalleLoteARTICULO.AsString)) then
           QMCierreParcialDetalleLoteID_LOTE.AsInteger := DMMain.CrearLote(DameIDArticulo(QMCierreParcialDetalleLoteARTICULO.AsString), QMCierreParcialDetalleLoteLOTE.AsString);
        InsertandoDetalleLote := True;
     end
     else
        InsertandoDetalleLote := False;

     { Validamos que no se cree un registro con cero unidades }
     if (QMCierreParcialDetalleLoteUNIDADES.AsFloat = 0) then
     begin
        raise Exception.Create(_('El registro no puede tener cero unidades'));
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteNewRecord(DataSet: TDataSet);
begin
  QMCierreParcialDetalleLoteEMPRESA.AsInteger := QMCierreParcialEMPRESA.AsInteger;
  QMCierreParcialDetalleLoteEJERCICIO.AsInteger := QMCierreParcialEJERCICIO.AsInteger;
  QMCierreParcialDetalleLoteCANAL.AsInteger := QMCierreParcialCANAL.AsInteger;
  QMCierreParcialDetalleLoteCIERRE.AsInteger := QMCierreParcialCIERRE.AsInteger;
  QMCierreParcialDetalleLoteSERIE.AsString := QMCierreParcialDetalleSERIE.AsString;
  QMCierreParcialDetalleLoteLINEA.AsInteger := QMCierreParcialDetalleLINEA.AsInteger;
  QMCierreParcialDetalleLoteID_CIERRE.AsInteger := QMCierreParcialID.AsInteger;
  QMCierreParcialDetalleLoteID_DET.AsInteger := QMCierreParcialDetalleID.AsInteger;
  QMCierreParcialDetalleLoteALM_DEST.AsString := QMCierreParcialDetalleALMACEN.AsString;
  QMCierreParcialDetalleLoteUNIDADES.AsFloat := 1;
  QMCierreParcialDetalleLoteRIG_OF.AsInteger := QMCierreParcialDetalleRIG_OF.AsInteger;
  QMCierreParcialDetalleLoteENTRADA.AsInteger := REntorno.Entrada;
  QMCierreParcialDetalleLoteNUM_ETIQUETAS.AsInteger := 1;
  QMCierreParcialDetalleLoteOPERARIO.AsInteger := 1;
  QMCierreParcialDetalleLoteCALIDAD.AsString := 'A';
  QMCierreParcialDetalleLoteFECHA.AsDateTime := REntorno.FechaTrab;
  // sfg.albert - TyC - Es posa el compost de la OP
  QMCierreParcialDetalleLoteARTICULO.AsString := QMCierreParcialDetalleARTICULO.AsString;

  QMCierreParcialDetalleLoteID_RESERVA.AsInteger := 0;
  {
  // Busco la primera reserva
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_RESERVA, UNIDADES, ID_LOTE FROM PRO_ORD_RESERVA WHERE ID_ORDEN = :ID_ORDEN ORDER BY LINEA_RES';
        Params.ByName['ID_ORDEN'].AsInteger := QMCierreParcialDetalleID_ORDEN.AsInteger;
        ExecQuery;
        QMCierreParcialDetalleLoteID_RESERVA.AsInteger := FieldByName['ID_RESERVA'].AsInteger;
        if (FieldByName['ID_RESERVA'].AsInteger <> 0) then
        begin
           QMCierreParcialDetalleLoteUNIDADES.AsFloat := FieldByName['UNIDADES'].AsFloat;
           if (QMCierreParcialDetalleLoteID_LOTE.AsInteger = 0) then
           begin
              QMCierreParcialDetalleLoteID_LOTE.AsInteger := FieldByName['ID_LOTE'].AsInteger;
              QMCierreParcialDetalleLoteLOTE.AsString := DameLote(FieldByName['ID_LOTE'].AsInteger);
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
  }
  // Si hay una sola reserva la utilizo 
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(ID_RESERVA), COUNT(ID_RESERVA) ');
        SQL.Add(' FROM PRO_ORD_RESERVA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ORDEN = :ID_ORDEN ');

        Params.ByName['ID_ORDEN'].AsInteger := QMCierreParcialDetalleID_ORDEN.AsInteger;
        ExecQuery;
        if (FieldByName['COUNT'].AsInteger = 1) then
           QMCierreParcialDetalleLoteID_RESERVA.AsInteger := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (CierreParcialSecuencial) then // Telco
  begin
     // agafa la sublinea del trigger
     QMCierreParcialDetalleLoteORDEN_LOTE_SECUENCIAL.AsInteger := DameMaxOrdenLoteSecuencial(QMCierreParcialDetalleID_ORDEN.AsInteger);
     QMCierreParcialDetalleLoteLOTE.AsString := DameLote(QMCierreParcialDetalleID_LOTE.AsInteger) + '-' + IntToStr(QMCierreParcialDetalleLoteORDEN_LOTE_SECUENCIAL.AsInteger);
     QMCierreParcialDetalleLoteID_LOTE.AsInteger := DMMain.CrearLote(DameIDArticulo(QMCierreParcialDetalleLoteARTICULO.AsString), QMCierreParcialDetalleLoteLOTE.AsString); // QMCierreParcialDetalleID_LOTE.AsInteger;
  end
  else // Reytraplast
  begin
     if (CrearLoteLanzarOP) then
     begin
        QMCierreParcialDetalleLoteID_LOTE.AsInteger := QMCierreParcialDetalleID_LOTE.AsInteger;
        QMCierreParcialDetalleLoteLOTE.AsString := DameLote(QMCierreParcialDetalleID_LOTE.AsInteger);
     end;
  end; // fi IF

  // Busco Tipo y Unidades por Unidad Logistica
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO, UNIDADES FROM VER_ARTICULOS_UNID_LOG WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO AND DEFECTO = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMCierreParcialDetalleARTICULO.AsString;
        ExecQuery;
        QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICA.AsString := FieldByName['TIPO'].AsString;
        QMCierreParcialDetalleLoteUNIDADES_POR_UL.AsFloat := FieldByName['UNIDADES'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Busco Ubicacion Generica de este almacen
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_UBICACION FROM ART_ALMACENES_UBICACIONES WHERE EMPRESA = :EMPRESA AND ALMACEN = :ALMACEN AND GENERAL = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ALMACEN'].AsString := QMCierreParcialDetalleALMACEN.AsString;
        ExecQuery;
        QMCierreParcialDetalleLoteID_UBICACION.AsInteger := FieldByName['ID_UBICACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if not Assigned(FMCierreParcialOrdenDetalle) then
  begin
     AbreForm(TFMCierreParcialOrdenDetalle, FMCierreParcialOrdenDetalle);
     FMCierreParcialOrdenDetalle.Hide;
     FMCierreParcialOrdenDetalle.ShowModal;
     // Al cerrarse se destruye. Lo establezco como nil para futuras comprobaciones
     FMCierreParcialOrdenDetalle := nil;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialESTADOChange(Sender: TField);
begin
  CambiaEstdoCierre := True;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICAChange(Sender: TField);
begin
  if CalculaUnidadLogistica then
  begin
     CalculaUnidadLogistica := False;
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT UNIDADES FROM VER_ARTICULOS_UNID_LOG WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := QMCierreParcialDetalleARTICULO.AsString;
           Params.ByName['TIPO'].AsString := QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICA.AsString;
           ExecQuery;
           QMCierreParcialDetalleLoteUNIDADES_POR_UL.AsFloat := FieldByName['UNIDADES'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCierreParcialDetalleLoteUNIDADES.AsFloat := QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsFloat * QMCierreParcialDetalleLoteUNIDADES_POR_UL.AsFloat;

     CalculaLote;

     CalculaUnidadLogistica := True;
  end;
end;

procedure TDMCierreParcialOrden.CalculaLote;
var
  Lote : string;
  OldIDLote : integer;
begin
  // Guardardamos el ID_LOTE actual para restaurarlo si es necesario
  OldIDLote := QMCierreParcialDetalleLoteID_LOTE.AsInteger;

  // Mantener el existente
  if (OldIDLote <> 0) then
     QMCierreParcialDetalleLoteID_LOTE.AsInteger := OldIDLote
  else
  begin
     if ArticuloLoteable(QMCierreParcialDetalleLoteARTICULO.AsString) then
     begin
        // Se mira si tiene el check marcado. Si=1, cogerá el lote de la orden
        if (not CierreParcialSecuencial) then
        begin
           if (CrearLoteLanzarOP) then
              QMCierreParcialDetalleLoteLOTE.AsString := QMCierreParcialDetalleDescLote.Text
           else
           begin
              Lote := DMMain.DameLoteSiguiente(DameIdArticulo(QMCierreParcialDetalleARTICULO.AsString), QMCierreParcialDetalleRIG_OF.AsInteger, 'PRO', QMCierreParcialDetalleID_ORDEN.AsInteger);

              if (LeeParametro('CIPLOTE001') = 'S') then
              begin
                 // Asigno lote segun fecha + maquina + secuencia (Ej. YYYYMMDD-MAQ-01)
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT (SELECT FIRST 1 MAQUINA ');
                       SQL.Add('         FROM PRO_ORD_TAREA ');
                       SQL.Add('         WHERE ');
                       SQL.Add('         ID_ORDEN = :ID_ORDEN ');
                       SQL.Add('         ORDER BY LINEA_TAREA) MAQUINA, ');
                       SQL.Add('         -- ');
                       SQL.Add('         (CAST((COALESCE((SELECT COUNT(*) ');
                       SQL.Add('                          FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE LL ');
                       SQL.Add('                          JOIN PRO_ORD_CIERRE_PARCIAL_DET DD ON LL.ID_DET = DD.ID ');
                       SQL.Add('                          WHERE ');
                       SQL.Add('                          DD.ID_ORDEN = :ID_ORDEN AND ');
                       SQL.Add('                          EXTRACT(YEARDAY FROM LL.FECHA) = EXTRACT(YEARDAY FROM CAST(:FECHA AS DATE))), 0) + 1) AS INTEGER)) AS CONTADOR ');
                       SQL.Add(' FROM RDB$DATABASE ');

                       Params.ByName['ID_ORDEN'].AsInteger := QMCierreParcialDetalleID_ORDEN.AsInteger;
                       Params.ByName['FECHA'].AsDateTime := QMCierreParcialDetalleLoteFECHA.AsDateTime;
                       ExecQuery;
                       QMCierreParcialDetalleLoteLOTE.AsString := FormatDateTime('yyyymmdd', QMCierreParcialDetalleLoteFECHA.AsDateTime) + '-' + FieldByName['MAQUINA'].AsString + '-' + FieldByName['CONTADOR'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end
              else
              if (StrToIntDef(LeeParametro('SYSCONF005'), 0) = 1) then
              begin
                 // Si utiliza unidades logisticas agrego el tipo delante del lote
                 QMCierreParcialDetalleLoteLOTE.AsString := QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICA.AsString + '-' + Lote;
              end
              else
              begin
                 // Utiliza unidades logisticas=0
                 QMCierreParcialDetalleLoteLOTE.AsString := Lote;
              end;
           end;

           // No creo el lote. Se creará al guardar el cierre.
           // QMCierreParcialDetalleLoteID_LOTE.AsInteger := DMMain.CrearLote(DameIDArticulo(QMCierreParcialDetalleLoteARTICULO.AsString), QMCierreParcialDetalleLoteLOTE.AsString);
        end
        else // Telco - CierreParcialSecuencial = True
        begin
           // Obtengo sublinea
           QMCierreParcialDetalleLoteORDEN_LOTE_SECUENCIAL.AsInteger := DameMaxOrdenLoteSecuencial(QMCierreParcialDetalleID_ORDEN.AsInteger);
           QMCierreParcialDetalleLoteLOTE.AsString := DameLote(QMCierreParcialDetalleID_LOTE.AsInteger) + '-' + IntToStr(QMCierreParcialDetalleLoteORDEN_LOTE_SECUENCIAL.AsInteger);

           // Creo el Lote
           QMCierreParcialDetalleLoteID_LOTE.AsInteger := DMMain.CrearLote(DameIDArticulo(QMCierreParcialDetalleLoteARTICULO.AsString), QMCierreParcialDetalleLoteLOTE.AsString);
        end;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteUNIDADESChange(Sender: TField);
var
  Unidades, UnidadesPorUL : double;
begin
  if CalculaUnidadLogistica then
  begin
     CalculaUnidadLogistica := False;

     Unidades := QMCierreParcialDetalleLoteUNIDADES.AsFloat;
     UnidadesPorUL := QMCierreParcialDetalleLoteUNIDADES_POR_UL.AsFloat;

     if UnidadesPorUL <> 0 then
        QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsFloat := Unidades / UnidadesPorUL
     else
        QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsFloat := 1;

     if QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsFloat = 0 then
        QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsFloat := 1;

     CalculaUnidadLogistica := True;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteUNIDADES_POR_ULChange(Sender: TField);
begin
  if CalculaUnidadLogistica then
  begin
     CalculaUnidadLogistica := False;
     QMCierreParcialDetalleLoteUNIDADES.AsFloat := QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsFloat * QMCierreParcialDetalleLoteUNIDADES_POR_UL.AsFloat;
     CalculaUnidadLogistica := True;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteID_UBICACIONChange(Sender: TField);
begin
  QMCierreParcialDetalleLoteUBICACION.AsString := DameTituloUbicacion(QMCierreParcialDetalleLoteID_UBICACION.AsInteger);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteUNIDADES_LOGISITCASChange(Sender: TField);
begin
  if CalculaUnidadLogistica then
  begin
     CalculaUnidadLogistica := False;
     QMCierreParcialDetalleLoteUNIDADES.AsFloat := QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsFloat * QMCierreParcialDetalleLoteUNIDADES_POR_UL.AsFloat;
     CalculaUnidadLogistica := True;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteALM_DESTChange(Sender: TField);
begin
  {Buscamos la Ubicación y Composición general del Almacén}
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) ID_UBICACION, COMPOSICION FROM ART_ALMACENES_UBICACIONES WHERE EMPRESA = :EMPRESA AND ALMACEN = :ALMACEN ORDER BY GENERAL DESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ALMACEN'].AsString := QMCierreParcialDetalleLoteALM_DEST.AsString;
        ExecQuery;
        QMCierreParcialDetalleLoteID_UBICACION.AsInteger := FieldByName['ID_UBICACION'].AsInteger;
        // QMCierreParcialDetalleLoteUBICACION.AsString := FieldByName['COMPOSICION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierreParcialOrden.CambiaEstado(Direccion: integer);
begin
  if ((Direccion = -1) or (Direccion = 1)) then
  begin
     if (((Direccion = 1) and (QMCierreParcialESTADO.AsInteger < 1)) or
        ((Direccion = -1) and (QMCierreParcialESTADO.AsInteger > 0))) then
     begin
        QMCierreParcial.Edit;
        QMCierreParcialESTADO.AsInteger := QMCierreParcialESTADO.AsInteger + Direccion;
        QMCierreParcial.Post;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleDescLoteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMCierreParcialDetalleID_LOTE.AsInteger);
end;

procedure TDMCierreParcialOrden.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCierreParcial, '11110');
end;

function TDMCierreParcialOrden.HayDetalle: boolean;
begin
  Result := (QMCierreParcialDetalle.RecordCount > 0);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleBeforeEdit(DataSet: TDataSet);
begin
  EstadoSituacion; // Miramos la situacion de la orden. Si esta cerrada no dejamos modificar
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteBeforeEdit(DataSet: TDataSet);
begin
  EstadoSituacion; // Miramos la situacion de la orden. Si esta cerrada no dejamos modificar
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteBeforeInsert(DataSet: TDataSet);
begin
  EstadoSituacion; // Miramos la situacion de la orden. Si esta cerrada no dejamos modificar
end;

procedure TDMCierreParcialOrden.ObrirDetallLote(Crear: integer);
begin
  if (Crear = 1) then
     AbreForm(TFMCierreParcialOrdenDetalle, FMCierreParcialOrdenDetalle)
  else
  begin
     if (Crear = 2) then
     begin
        ObrirDetallLote(1);
        Crear := 0;
     end;

     if (Crear = 0) then
     begin
        QMCierreParcialDetalleLoteID_LOTE.AsInteger := QMCierreParcialDetalleID_LOTE.AsInteger;
        // Se esconde el formulario porque se crea el form con AbreFrom y luego se muestra
        // con un ShowModal. Se quiere que pare el codigo y sea modal
        FMCierreParcialOrdenDetalle.Hide;
        FMCierreParcialOrdenDetalle.ShowModal;
        CierraForm(FMCierreParcialOrdenDetalle);
        FMCierreParcialOrdenDetalle := nil;
     end;

     if (Crear = 3) then
     begin
        QMCierreParcialDetalleLoteID_LOTE.AsInteger := QMCierreParcialDetalleID_LOTE.AsInteger;
        FMCierreParcialOrdenDetalle.Show;
        {
        // Se esconde el formulario porque se crea el form con AbreFrom y luego se muestra
        // con un ShowModal. Se quiere que pare el codigo y sea modal
        FMCierreParcialOrdenDetalle.Hide;
        FMCierreParcialOrdenDetalle.ShowModal;
        CierraForm(FMCierreParcialOrdenDetalle);
        FMCierreParcialOrdenDetalle := nil;
        }
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteAfterEdit(DataSet: TDataSet);
begin
  if (not Assigned(FMCierreParcialOrdenDetalle)) then
     ObrirDetallLote(2);
end;

// sfg.albert - Llistat etiquetas cierre
procedure TDMCierreParcialOrden.ImprimirEtiquetas(numEtiquetas: integer; lote: string; modo: integer; articulo: string);
var
  str : string;
begin
  AbreData(TDMListados, DMListados);
  DMListados.Cargar(9908, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frLotes.LoadFromFIB(REntorno.Formato, str);
     frLotes.PrepareReport;
     case Modo of
        0: frLotes.ShowPreparedReport;
        1: frLotes.PrintPreparedReport('', numEtiquetas);
     end;
  end;

  DMListados.LimpiaEntorno;
  CierraData(DMListados);
end;

procedure TDMCierreParcialOrden.frLotesGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'Lote') then
     ParValue := QMCierreParcialDetalleLoteLOTE.AsString;

  if (ParName = 'Articulo') then
     ParValue := QMCierreParcialDetalleARTICULO.AsString;

  if (ParName = 'Descripcion') then
     ParValue := QMCierreParcialDetalleTITULO.AsString;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleDescSituacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloSituacionProduccion(DMMain.DameSituacionOrden(QMCierreParcialDetalleID_ORDEN.AsInteger));
end;

procedure TDMCierreParcialOrden.EstadoSituacion;
begin
  if (DMMain.DameSituacionOrden(QMCierreParcialDetalleID_ORDEN.AsInteger) = 4) then
  begin
     ShowMessage(_('Esta OP esta cerrada. ' + #13#10 + 'No es posible su modificación'));
     Abort;
  end;
end;

function TDMCierreParcialOrden.DameMaxOrdenLoteSecuencial(id_orden: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LOT.ORDEN_LOTE_SECUENCIAL) FROM PRO_ORD_CIERRE_PARCIAL_DET DET ');
        SQL.Add(' LEFT JOIN PRO_ORD_CIERRE_PARCIAL_DET_LOTE LOT ');
        SQL.Add(' ON ');
        SQL.Add(' DET.EMPRESA = LOT.EMPRESA AND ');
        SQL.Add(' DET.EJERCICIO = LOT.EJERCICIO AND ');
        SQL.Add(' DET.CANAL = LOT.CANAL AND ');
        SQL.Add(' DET.SERIE = LOT.SERIE AND ');
        SQL.Add(' DET.CIERRE = LOT.CIERRE AND ');
        SQL.Add(' DET.LINEA = LOT.LINEA ');
        SQL.Add(' LEFT JOIN PRO_ORD OP ON (DET.ID_ORDEN = OP.ID_ORDEN) ');
        SQL.Add(' WHERE ');
        SQL.Add(' LOT.EMPRESA = :EMPRESA AND ');
        SQL.Add(' LOT.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' LOT.CANAL = :CANAL AND ');
        SQL.Add(' DET.ID_ORDEN = :ID_ORDEN AND ');
        SQL.Add(' OP.SITUACION = 3 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ID_ORDEN'].AsInteger := id_orden;
        ExecQuery;
        Result := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMCierreParcialOrden.ObtenerModelo_TyC: integer;
begin
  /// Devuelvo el Modelo Tallas y Colores de un articulo
  /// Los articulos sin Tallas y Colores tienen el modelo -1

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT C.ID_A_M FROM ART_ARTICULOS_MOD_COLOR C ');
        SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS T ON T.ID_A_M_C = C.ID_A_M_C ');
        SQL.Add(' JOIN ART_ARTICULOS A ON A.ID_A_M_C_T = T.ID_A_M_C_T ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.EMPRESA = :EMPRESA AND ');
        SQL.Add(' A.ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMCierreParcialDetalleARTICULO.AsString;
        ExecQuery;
        Result := FieldByName['ID_A_M'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMCierreParcialDetalleLoteARTICULO.AsString);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteARTICULOChange(Sender: TField);
begin
  // DameTituloArticulo(QMCierreParcialDetalleARTICULO.AsString);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteSUM_UNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if ((QMCierreParcialCIERRE.AsString > '') and (QMCierreParcialDetalleLINEA.AsString > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(UNIDADES) FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
           SQL.Add(' AND EJERCICIO = ' + REntorno.EjercicioStr);
           SQL.Add(' AND CANAL = ' + REntorno.CanalStr);
           SQL.Add(' AND SERIE = ''' + QMCierreParcialSERIE.AsString + '''');
           SQL.Add(' AND CIERRE = ' + QMCierreParcialCIERRE.AsString);
           SQL.Add(' AND LINEA = ' + QMCierreParcialDetalleLINEA.AsString);
           ExecQuery;
           Text := FieldByName['SUM'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMCierreParcialOrden.FiltraCierre(id_cierre: integer);
begin
  if (id_cierre <> 0) then
  begin
     with QMCierreParcial do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM PRO_ORD_CIERRE_PARCIAL ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID = :ID_CIERRE ');
        Params.ByName['ID_CIERRE'].AsInteger := id_cierre;
        Open;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteAfterPost(DataSet: TDataSet);
begin
  (* Se traspasa código a Trigger PRO_ORD_CIERRE_P_D_LOTE_AI0 *)

  // Refresco datos
  QMCierreParcialDetalleComponente.Close;
  QMCierreParcialDetalleComponente.Open;

  FMCierreParcialOrdenDetalle.PCMain.ActivePage := FMCierreParcialOrdenDetalle.TSComponentes;

  if (FMCierreParcialOrdenDetalle.TSTabla.TabVisible) then
     FMCierreParcialOrdenDetalle.TSTabla.TabVisible := False;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteAfterCancel(DataSet: TDataSet);
begin
  // Refresco datos
  QMCierreParcialDetalleComponente.Close;
  QMCierreParcialDetalleComponente.Open;

  FMCierreParcialOrdenDetalle.PCMain.ActivePage := FMCierreParcialOrdenDetalle.TSComponentes;
  if (FMCierreParcialOrdenDetalle.TSTabla.TabVisible) then
     FMCierreParcialOrdenDetalle.TSTabla.TabVisible := False;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleComponenteNewRecord(DataSet: TDataSet);
begin
  QMCierreParcialDetalleComponenteEMPRESA.AsInteger := QMCierreParcialEMPRESA.AsInteger;
  QMCierreParcialDetalleComponenteEJERCICIO.AsInteger := QMCierreParcialEJERCICIO.AsInteger;
  QMCierreParcialDetalleComponenteCANAL.AsInteger := QMCierreParcialCANAL.AsInteger;
  QMCierreParcialDetalleComponenteCIERRE.AsInteger := QMCierreParcialCIERRE.AsInteger;
  QMCierreParcialDetalleComponenteSERIE.AsString := QMCierreParcialDetalleSERIE.AsString;
  QMCierreParcialDetalleComponenteLINEA.AsInteger := QMCierreParcialDetalleLINEA.AsInteger;
  QMCierreParcialDetalleComponenteSUB_LINEA.AsInteger := QMCierreParcialDetalleLoteSUB_LINEA.AsInteger;
  QMCierreParcialDetalleComponenteID_CIERRE.AsInteger := QMCierreParcialID.AsInteger;
  QMCierreParcialDetalleComponenteID_DET.AsInteger := QMCierreParcialDetalleID.AsInteger;
  QMCierreParcialDetalleComponenteALM_DEST.AsString := QMCierreParcialDetalleLoteALM_DEST.AsString;
  QMCierreParcialDetalleComponenteUNIDADES_POR_UL.AsFloat := 1;
  QMCierreParcialDetalleComponenteUNIDADES.AsFloat := 1;
  QMCierreParcialDetalleComponenteRIG_OF.AsInteger := QMCierreParcialDetalleRIG_OF.AsInteger;
  QMCierreParcialDetalleComponenteENTRADA.AsInteger := REntorno.Entrada;
  QMCierreParcialDetalleComponenteOPERARIO.AsInteger := 1;
  QMCierreParcialDetalleComponenteFECHA.AsDateTime := Now;
  QMCierreParcialDetalleComponenteARTICULO.AsString := QMCierreParcialDetalleARTICULO.AsString;

  {
  if not Assigned(FMCierreParcialOrdenDetalle) then
  begin
     AbreForm(TFMCierreParcialOrdenDetalle, FMCierreParcialOrdenDetalle);
     FMCierreParcialOrdenDetalle.Hide;
     FMCierreParcialOrdenDetalle.ShowModal;
     // Al cerrarce se destruye. Lo establezco como nil para futuras comprobaciones
     FMCierreParcialOrdenDetalle := nil;
  end;
  }
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleComponenteID_LOTEChange(Sender: TField);
begin
  QMCierreParcialDetalleComponenteLOTE.AsString := DameLote(QMCierreParcialDetalleComponenteID_LOTE.AsInteger);
end;

function TDMCierreParcialOrden.HayDetalleComponente: boolean;
begin
  Result := (QMCierreParcialDetalleComponente.FieldByName('EMPRESA').AsInteger <> 0);
end;

procedure TDMCierreParcialOrden.RefrescaDatosArticulo;
begin
  if (FUltimoArticulo <> QMCierreParcialDetalleComponenteARTICULO.AsString) then
  begin
     FUltimoArticulo := QMCierreParcialDetalleComponenteARTICULO.AsString;
     if (FUltimoArticulo = '') then
     begin
        FArticuloUbicable := True;
        FArticuloLoteable := True;
     end
     else
     begin
        FArticuloUbicable := ArticuloUbicable(FUltimoArticulo);
        FArticuloLoteable := ArticuloLoteable(FUltimoArticulo);
     end;
  end;
end;

function TDMCierreParcialOrden.DameArticuloUbicable: boolean;
begin
  RefrescaDatosArticulo;
  Result := FArticuloUbicable;
end;

function TDMCierreParcialOrden.DameArticuloLoteable: boolean;
begin
  RefrescaDatosArticulo;
  Result := FArticuloLoteable;
end;

function TDMCierreParcialOrden.DameAlmacenUbicable: boolean;
begin
  Result := FAlmacenUbicable;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleComponenteAfterScroll(DataSet: TDataSet);
begin
  FAlmacenUbicable := DMMain.CompruebaControlUbicacionAlmacen(QMCierreParcialDetalleComponenteALM_DEST.AsString);
end;

procedure TDMCierreParcialOrden.CrearCierre(id_orden: integer);
begin
  QMCierreParcial.Insert;
  QMCierreParcialCOMENTARIO.AsString := Format(_('Cierre parcial de orden %d'), [id_orden]);
  QMCierreParcial.Post;

  QMCierreParcialDetalle.Insert;
  QMCierreParcialDetalleID_ORDEN.AsInteger := id_orden;
  QMCierreParcialDetalle.Post;

  // Necesario para refrescar datos para que QMCierreParcialDetalleLote pueda obtenerlos.
  QMCierreParcialDetalle.Close;
  QMCierreParcialDetalle.Open;

  QMCierreParcialDetalleLote.Insert;

  if (QMCierreParcialDetalleLote.RecordCount > 0) then
     CambiaEstado(1)
  else
     QMCierreParcial.Delete;
end;

procedure TDMCierreParcialOrden.InfoLotes(Tipo: integer);
var
  AsignaLotes : TFMAsignaLotes;
  // IntroduceLotes : TFMIntroduceLotes;
  Articulo : string;
begin
  // Si Tipo = 1 Componente
  // Si Tipo = 2 Compuesto
  // Si Tipo = 3 Devolucion componente consumido

  if (Tipo = 2) then
     raise Exception.Create(_('No implementado lotes multiples para compuesto en cierre parical'));

  if ((Tipo = 1) or (Tipo = 3)) then
     Articulo := QMCierreParcialDetalleComponenteARTICULO.AsString
  else
     Articulo := QMCierreParcialDetalleLoteARTICULO.AsString;

  if (ArticuloLoteable(Articulo)) then
  begin
     if (Tipo = 1) then
     begin
        if (QMCierreParcialDetalleComponente.State = dsEdit) then
           QMCierreParcialDetalleComponente.Post;

        AsignaLotes := TFMAsignaLotes.Create(Self);
        try
           with AsignaLotes do
           begin
              AsignaDocumento('PCP', QMCierreParcialDetalleComponenteID.AsInteger, (DMCierreParcialOrden.QMCierreParcialESTADO.AsInteger = 0));
           end;
        finally
           AsignaLotes.Free;
        end;

        QMCierreParcialDetalleComponente.Refresh;
     end
     else if (Tipo = 3) then
     begin
        if (QMCierreParcialDetalleComponente.State = dsEdit) then
           QMCierreParcialDetalleComponente.Post;

        AsignaLotes := TFMAsignaLotes.Create(Self);
        try
           with AsignaLotes do
           begin
              AsignaDocumento('PCD', QMCierreParcialDetalleComponenteID.AsInteger, (DMCierreParcialOrden.QMCierreParcialESTADO.AsInteger = 0));
           end;
        finally
           AsignaLotes.Free;
        end;

        QMCierreParcialDetalleComponente.Refresh;
     end;

     // Creació del lot del compost
     {begin
         No implementado

        IntroduceLotes := TFMIntroduceLotes.Create(Self);
        try
           with IntroduceLotes do
           begin
              QMCompuestoID_LOTE.AsInteger := AsignaArticulo('COM',
                 QMCompuestoSERIES.AsString,
                 QMCompuestoCOMPUESTO.AsString, QMCompuestoEJERCICIO.AsInteger,
                 QMCompuestoRIG_OF.AsInteger,
                 0, QMCompuestoUNI_TOTAL.AsFloat,
                 QMCompuestoALMACEN_ENT.AsString,
                 QMCompuestoALMACEN_ENT.AsString, QMCompuestoCANAL.AsInteger,
                 QMCompuestoCANAL.AsInteger,
                 True, QMCompuestoID_A.AsInteger,
                 QMCompuestoID_ORDEN.AsInteger, 0, False);

              // Informo la ubicacion seleccionada en la seleccion de lote
              if (ArticuloUbicable(QMCompuestoCOMPUESTO.AsString)) then
                 QMCompuestoID_UBICACION.AsInteger := IntroduceLotes.IDUbicacion;
           end;
        finally
           IntroduceLotes.Free;
        end;

     end;}
  end;
end;

function TDMCierreParcialOrden.LotesComponentesAsignados: string;
var
  Msg : string;
  // UnidadesCierre, UnidadesLote : double;
begin
  /// Devolverá el articulo cuyos lotes no están completamente informados.

  Result := '';
  if (QMCierreParcialDetalleComponente.State = dsEdit) then
     QMCierreParcialDetalleComponente.Post;

  {
   - El lote de los compuestos se crea según las unidades fabricadas.
   - Ademas, habría que tener en cuetna multilote

  // Obtengo compuestos con cantidad de lotes diferente a las unidades fabricadas
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT L.ARTICULO, L.UNIDADES UNIDADES_LOTE, D.UNIDADES UNIDADES_CIERRE ');
        SQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE L ');
        SQL.Add(' JOIN PRO_ORD_CIERRE_PARCIAL_DET D ON L.ID_DET = D.ID ');
        SQL.Add(' WHERE ');
        SQL.Add(' L.ID_CIERRE = :ID_CIERRE AND ');
        SQL.Add(' L.UNIDADES <> D.UNIDADES ');
        Params.ByName['ID_CIERRE'].AsInteger := QMCierreParcialDetalleComponenteID_CIERRE.AsInteger;
        ExecQuery;
        Result := FieldByName['ARTICULO'].AsString;
        // UnidadesCierre := FieldByName['UNIDADES_CIERRE'].AsFloat;
        // UnidadesLote := FieldByName['UNIDADES_LOTE'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
  }

  // Obtengo componentes con cantidad de lotes diferente a las unidades utilizadas
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT D.ARTICULO ');
        SQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_COM D ');
        SQL.Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A.ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.LOTES = 1 AND ');
        SQL.Add(' D.ID_CIERRE = :ID_CIERRE AND ');
        SQL.Add(' ( ');
        SQL.Add('  ((ABS((SELECT SUM(CANTIDAD) ');
        SQL.Add('         FROM PRO_ORD_CIE_PAR_DET_C_LOT ');
        SQL.Add('         WHERE ');
        SQL.Add('         ID_CIERRE_PAR_DET_COM = D.ID)) - ABS(D.UNIDADES_REALES) > 0.001)) ');
        SQL.Add('  OR ');
        SQL.Add('  ((ABS((SELECT SUM(CANTIDAD) ');
        SQL.Add('         FROM PRO_ORD_CIE_PAR_DET_C_LOT ');
        SQL.Add('         WHERE ');
        SQL.Add('         ID_CIERRE_PAR_DET_COM = D.ID)) - ABS(D.UNIDADES_REALES) < -0.001)) ');
        SQL.Add(' ) ');
        Params.ByName['ID_CIERRE'].AsInteger := QMCierreParcialDetalleComponenteID_CIERRE.AsInteger;
        ExecQuery;
        Result := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Msg := '';
  // Se verifica que el lote seleccionado tenga stock suficiente
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           // Obtengo stock de lotes de articulos loteables
           SelectSQL.Add(' SELECT C.ARTICULO, CL.CANTIDAD, CL.LOTE, -- ');
           SelectSQL.Add('        COALESCE((SELECT SUM(STOCK) ');
           SelectSQL.Add('                  FROM A_ART_STOCK_LOTE(C.EMPRESA, C.ARTICULO, C.CANAL, CL.ALMACEN, -1) L ');
           SelectSQL.Add('                  WHERE ');
           SelectSQL.Add('                  L.LOTE = CL.LOTE), 0) STOCK_LOTE ');
           SelectSQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_COM C ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO ');
           SelectSQL.Add(' LEFT JOIN PRO_ORD_CIE_PAR_DET_C_LOT CL ON CL.ID_CIERRE_PAR_DET_COM = C.ID ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' C.CANAL = :CANAL AND ');
           SelectSQL.Add(' C.SERIE = :SERIE AND ');
           SelectSQL.Add(' C.CIERRE = :CIERRE AND ');
           SelectSQL.Add(' C.LINEA = :LINEA AND ');
           SelectSQL.Add(' C.SUB_LINEA = :SUB_LINEA AND ');
           SelectSQL.Add(' A.LOTES = 1 ');

           Params.ByName['EMPRESA'].AsInteger := QMCierreParcialDetalleComponenteEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCierreParcialDetalleComponenteEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCierreParcialDetalleComponenteCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCierreParcialDetalleComponenteSERIE.AsString;
           Params.ByName['CIERRE'].AsInteger := QMCierreParcialDetalleComponenteCIERRE.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMCierreParcialDetalleComponenteLINEA.AsInteger;
           Params.ByName['SUB_LINEA'].AsInteger := QMCierreParcialDetalleComponenteSUB_LINEA.AsInteger;

           Open;
           while not EOF do
           begin
              if (FieldByName('STOCK_LOTE').AsFloat < FieldByName('CANTIDAD').AsFloat) then
              begin
                 Msg := #13#10 + Msg + format(_('No hay stock suficiente del lote %s para el articulo %s'), [FieldByName('LOTE').AsString, FieldByName('ARTICULO').AsString]);
                 Result := FieldByName('ARTICULO').AsString;
              end;

              Next;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  if (Msg > '') then
     ShowMessage(Msg);
end;

function TDMCierreParcialOrden.DameUnidadesPendientesCierre(IdReserva: integer): double;
var
  UnidadesReservadas, UnidadesCerradas : double;
begin
  // Buscamos unidades de la reserva
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT UNIDADES FROM PRO_ORD_RESERVA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_RESERVA = :ID_RESERVA ');
        Params.ByName['ID_RESERVA'].AsInteger := IdReserva;
        ExecQuery;
        UnidadesReservadas := FieldByName['UNIDADES'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Buscamos unidades cerradas de la reserva
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(LOT.UNIDADES) UNIDADES_CERRADAS ');
        SQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL CAB ');
        SQL.Add(' JOIN PRO_ORD_CIERRE_PARCIAL_DET DET ON CAB.ID = DET.ID_CIERRE ');
        SQL.Add(' LEFT JOIN PRO_ORD_CIERRE_PARCIAL_DET_LOTE LOT ON DET.ID = LOT.ID_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' LOT.ID_RESERVA = :ID_RESERVA and CAB.ESTADO = 1 ');
        Params.ByName['ID_RESERVA'].AsInteger := IdReserva;
        ExecQuery;
        UnidadesCerradas := FieldByName['UNIDADES_CERRADAS'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := UnidadesReservadas - UnidadesCerradas;
end;

procedure TDMCierreParcialOrden.DameSqlImpresionEtiquetas(SQL: TStrings);
begin
  /// Genera SQL para rellenar ART_IMPRESION_CB_DETALLE con los articulos filtrados.
  /// Contiene el parametro NUMERO que sera utilizado dentro de UDMImprimircodBarras.

  with SQL do
  begin
     Clear;
     Add(' INSERT INTO ART_IMPRESION_CB_DETALLE ');
     Add(' (EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, ARTICULO, ID_DETALLE_DOC, COD_BARRAS, TIPO, NUM_COPIAS, FECHA, ALFA_6, ID_LOTE, UNIDADES) ');
     Add(' SELECT ' + REntorno.EmpresaStr + ', ' + REntorno.EjercicioStr + ', ' + REntorno.CanalStr + ', ');
     Add(' :NUMERO, 0, CPL.ARTICULO, CPL.ID, ');
     Add(' (SELECT FIRST 1 BARRAS  ');
     Add('  FROM ART_ARTICULOS_BARRAS ');
     Add('  WHERE ');
     Add('  EMPRESA = CPL.EMPRESA AND  ');
     Add('  ARTICULO = CPL.ARTICULO ');
     Add('  ORDER BY TIPO DESC), ');
     Add(' (SELECT FIRST 1 TIPO ');
     Add('  FROM ART_ARTICULOS_BARRAS ');
     Add('  WHERE ');
     Add('  EMPRESA = CPL.EMPRESA AND ');
     Add('  ARTICULO = CPL.ARTICULO ');
     Add('  ORDER BY TIPO DESC), ');
     // Obtenemos la cantidad de etiquetas a imprimir
     if (Param_ALBETIQ001 <> 0) then
        Add(format(' %d, ', [Param_ALBETIQ001]))
     else
        Add(' CPL.UNIDADES, ');
     Add(' CPL.FECHA, ');
     Add(' AA.ALFA_6, ');
     Add(' CPL.ID_LOTE ');
     Add(' CPL.UNIDADES ');
     Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE CPL ');
     Add(' JOIN ART_ARTICULOS AA on (CPL.EMPRESA = AA.EMPRESA and CPL.ARTICULO = AA.ARTICULO) ');
     Add(' WHERE ');
     Add(' CPL.CIERRE = ' + IntToStr(QMCierreParcialDetalleLoteCIERRE.AsInteger) + ' AND ');
     Add(' CPL.SERIE = ''' + QMCierreParcialDetalleLoteSERIE.AsString + ''' AND ');
     Add(' CPL.CANAL = ' + IntToStr(QMCierreParcialDetalleLoteCANAL.AsInteger) + ' AND ');
     Add(' CPL.EJERCICIO = ' + IntToStr(QMCierreParcialDetalleLoteEJERCICIO.AsInteger) + ' AND ');
     Add(' CPL.EMPRESA = ' + IntToStr(QMCierreParcialDetalleLoteEMPRESA.AsInteger));
     Add(' ORDER BY CPL.LINEA, CPL.SUB_LINEA ');
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleCLASIFICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameClasificacionLote(QMCierreParcialDetalleID_LOTE.AsInteger);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteCLASIFICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameClasificacionLote(QMCierreParcialDetalleLoteID_LOTE.AsInteger);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleComponenteCLASIFICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameClasificacionLote(QMCierreParcialDetalleComponenteID_LOTE.AsInteger);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleComponenteID_LOTE_DEVChange(Sender: TField);
begin
  QMCierreParcialDetalleComponenteLOTE_DEV.AsString := DameLote(QMCierreParcialDetalleComponenteID_LOTE_DEV.AsInteger);
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleComponenteUNIDADES_REALESChange(Sender: TField);
var
  UnidadesDevolver : double;
begin
  if (CalculaUnidadesDevolver) then
  begin
     // Calculamos unidades a devolver
     UnidadesDevolver := QMCierreParcialDetalleComponenteUNIDADES.AsFloat - QMCierreParcialDetalleComponenteUNIDADES_REALES.AsFloat;
     if (UnidadesDevolver > 0) then
        QMCierreParcialDetalleComponenteUNIDADES_DEVOLVER.AsFloat := UnidadesDevolver
     else
        QMCierreParcialDetalleComponenteUNIDADES_DEVOLVER.AsFloat := 0;
  end;
end;

procedure TDMCierreParcialOrden.QMCierrePCompuestoNewRecord(DataSet: TDataSet);
begin
  QMCierrePCompuestoEMPRESA.AsInteger := QMCierreParcialDetalleLoteEMPRESA.AsInteger;
  QMCierrePCompuestoEJERCICIO.AsInteger := QMCierreParcialDetalleLoteEJERCICIO.AsInteger;
  QMCierrePCompuestoCANAL.AsInteger := QMCierreParcialDetalleLoteCANAL.AsInteger;
  QMCierrePCompuestoCIERRE.AsInteger := QMCierreParcialDetalleLoteCIERRE.AsInteger;
  QMCierrePCompuestoSERIE.AsString := QMCierreParcialDetalleLoteSERIE.AsString;
  QMCierrePCompuestoLINEA.AsInteger := QMCierreParcialDetalleLoteLINEA.AsInteger;
  QMCierrePCompuestoSUB_LINEA.AsInteger := QMCierreParcialDetalleLoteSUB_LINEA.AsInteger;
  QMCierrePCompuestoID_CIERRE.AsInteger := QMCierreParcialDetalleLoteID_CIERRE.AsInteger;
  QMCierrePCompuestoID_DET.AsInteger := QMCierreParcialDetalleLoteID_DET.AsInteger;
  QMCierrePCompuestoALM_DEST.AsString := QMCierreParcialDetalleLoteALM_DEST.AsString;
  QMCierrePCompuestoTIPO_UNIDAD_LOGISTICA.AsString := 'GRNL';
  QMCierrePCompuestoUNIDADES_POR_UL.AsFloat := 1;
  QMCierrePCompuestoUNIDADES.AsFloat := 1;
  QMCierrePCompuestoRIG_OF.AsInteger := QMCierreParcialDetalleLoteRIG_OF.AsInteger;
  QMCierrePCompuestoENTRADA.AsInteger := REntorno.Entrada;
  QMCierrePCompuestoOPERARIO.AsInteger := QMCierreParcialDetalleLoteOPERARIO.AsInteger;
  QMCierrePCompuestoFECHA.AsDateTime := QMCierreParcialDetalleLoteFECHA.AsDateTime;
  // QMCierrePCompuestoARTICULO.AsString := QMCierreParcialDetalleLoteARTICULO.AsString;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteAfterOpen(DataSet: TDataSet);
begin
  QMCierrePCompuesto.Open;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteBeforeClose(DataSet: TDataSet);
begin
  QMCierrePCompuesto.Close;
end;

procedure TDMCierreParcialOrden.QMCierrePCompuestoBeforePost(DataSet: TDataSet);
begin
  if (QMCierrePCompuesto.State = dsInsert) then
  begin
     ////////// BUSCO LINEA DETALLE CIERRE ///////////
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(SUB_LINEA_COMPUESTO) FROM PRO_ORD_CIERRE_PARCIAL_DET_CPO ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' CIERRE = :CIERRE AND ');
           SQL.Add(' LINEA = :LINEA AND ');
           SQL.Add(' SUB_LINEA = :SUB_LINEA ');
           Params.ByName['EMPRESA'].AsInteger := QMCierreParcialDetalleLoteEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCierreParcialDetalleLoteEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCierreParcialDetalleLoteCANAL.AsInteger;
           Params.ByName['CIERRE'].AsInteger := QMCierreParcialDetalleLoteCIERRE.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMCierreParcialDetalleLoteLINEA.AsInteger;
           Params.ByName['SUB_LINEA'].AsInteger := QMCierreParcialDetalleLoteSUB_LINEA.AsInteger;
           ExecQuery;
           QMCierrePCompuestoSUB_LINEA_COMPUESTO.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMCierreParcialOrden.QMCierreParcialDetalleLoteFECHAChange(Sender: TField);
begin
  DMCierreParcialOrden.CalculaLote;
end;

end.
