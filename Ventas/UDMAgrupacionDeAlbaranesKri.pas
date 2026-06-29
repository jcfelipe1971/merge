unit UDMAgrupacionDeAlbaranesKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDataSetRW, FIBQuery, HYFIBQuery, Excel2000, OleServer, Windows, OleCtrls, Variants,
  frxClass, frxHYReport;

type
  TDMAgrupacionDeAlbaranesKri = class(TDataModule)
     TLocal: THYTransaction;
     QAgrupacionAlbaranes: TFIBTableSet;
     QAgrupacionAlbaranesEMPRESA: TIntegerField;
     QAgrupacionAlbaranesCANAL: TIntegerField;
     QAgrupacionAlbaranesID_S_AG: TIntegerField;
     QAgrupacionAlbaranesTAREA_1: TIntegerField;
     QAgrupacionAlbaranesTAREA_2: TIntegerField;
     QAgrupacionAlbaranesTAREA_3: TIntegerField;
     QAgrupacionAlbaranesTAREA_4: TIntegerField;
     QAgrupacionAlbaranesTAREA_5: TIntegerField;
     QAgrupacionAlbaranesTAREA_6: TIntegerField;
     QAgrupacionAlbaranesTAREA_7: TIntegerField;
     QAgrupacionAlbaranesTAREA_8: TIntegerField;
     QAgrupacionAlbaranesTAREA_9: TIntegerField;
     QAgrupacionAlbaranesTAREA_10: TIntegerField;
     DSQAgrupacionAlbaranes: TDataSource;
     DSQCabecerasAlbaran: TDataSource;
     DSQPackingListTotales: TDataSource;
     QPackingListTotales: TFIBDataSetRO;
     QPackingListTotalesREF_PROVEEDOR: TFIBStringField;
     QPackingListTotalesS_COLOR: TFIBStringField;
     QPackingListTotalesID_S: TIntegerField;
     QPackingListTotalesID_A_M_C: TIntegerField;
     QPackingListTotalesID_G_T: TIntegerField;
     QPackingListTotalesP_COMPRA: TFloatField;
     QPackingListTotalesP_VENTA: TFloatField;
     QPackingListTotalesTITM: TFIBStringField;
     QPackingListTotalesTITMC: TFIBStringField;
     QPackingListTotalesID_D_S_GR: TIntegerField;
     QPackingListTotalesT01: TFloatField;
     QPackingListTotalesT02: TFloatField;
     QPackingListTotalesT03: TFloatField;
     QPackingListTotalesT04: TFloatField;
     QPackingListTotalesT05: TFloatField;
     QPackingListTotalesT06: TFloatField;
     QPackingListTotalesT07: TFloatField;
     QPackingListTotalesT08: TFloatField;
     QPackingListTotalesT09: TFloatField;
     QPackingListTotalesT10: TFloatField;
     QPackingListTotalesT11: TFloatField;
     QPackingListTotalesT12: TFloatField;
     QPackingListTotalesT13: TFloatField;
     QPackingListTotalesT14: TFloatField;
     QPackingListTotalesT15: TFloatField;
     QPackingListTotalesT16: TFloatField;
     QPackingListTotalesT17: TFloatField;
     QPackingListTotalesT18: TFloatField;
     QPackingListTotalesT19: TFloatField;
     QPackingListTotalesT20: TFloatField;
     QPackingListTotalesT21: TFloatField;
     QPackingListTotalesT22: TFloatField;
     QPackingListTotalesUTOTAL: TFloatField;
     QPackingListTotalesPTOTAL: TFloatField;
     QPackingListTotalesCAMBIA: TIntegerField;
     QPackingListTotalesCAJA_EDI: TIntegerField;
     QPackingListTotalesTIPO_CAJA_EDI: TFIBStringField;
     frListado: TfrHYReport;
     frDBQPackingListTotales: TfrDBDataSet;
     xTallas: TFIBDataSetRO;
     DSxTallas: TDataSource;
     frDBxTallas: TfrDBDataSet;
     xTallasNVISIBLE: TIntegerField;
     xTallasID_G_T: TIntegerField;
     xTallasGRUPO: TFIBStringField;
     xTallasT01: TFIBStringField;
     xTallasT02: TFIBStringField;
     xTallasT03: TFIBStringField;
     xTallasT04: TFIBStringField;
     xTallasT05: TFIBStringField;
     xTallasT06: TFIBStringField;
     xTallasT07: TFIBStringField;
     xTallasT08: TFIBStringField;
     xTallasT09: TFIBStringField;
     xTallasT10: TFIBStringField;
     xTallasT11: TFIBStringField;
     xTallasT12: TFIBStringField;
     xTallasT13: TFIBStringField;
     xTallasT14: TFIBStringField;
     xTallasT15: TFIBStringField;
     xTallasT16: TFIBStringField;
     xTallasT17: TFIBStringField;
     xTallasT18: TFIBStringField;
     xTallasT19: TFIBStringField;
     xTallasT20: TFIBStringField;
     xTallasT21: TFIBStringField;
     xTallasT22: TFIBStringField;
     frDBxEtiquetas: TfrDBDataSet;
     xEtiquetas: TFIBDataSetRW;
     xEtiquetasCODPOSTAL: TFIBStringField;
     xEtiquetasPOBLACION: TFIBStringField;
     xEtiquetasPROVINCIA: TFIBStringField;
     xEtiquetasTRANSPORTISTA: TFIBStringField;
     xEtiquetasEMPRESA_CLI: TFIBStringField;
     xEtiquetasDIRECCION: TFIBStringField;
     xEtiquetasBULTOS: TIntegerField;
     xEtiquetasPORTES: TIntegerField;
     xEtiquetasPAIS: TFIBStringField;
     xEtiquetasPESO: TFloatField;
     DSxEtiquetas: TDataSource;
     SPTraspasoAlbaranMul: THYFIBQuery;
     QCierra: THYFIBQuery;
     QDestino: THYFIBQuery;
     QAgrupacionAlbaranesTIPO: TFIBStringField;
     xEtiquetasFECHA: TDateTimeField;
     xEtiquetasDIRECCION1: TFIBStringField;
     xEtiquetasDIRECCION2: TFIBStringField;
     DSQMCartaPortesTransportista: TDataSource;
     DSQMCartaPortesAlbaranes: TDataSource;
     QMCartaPortesTransportista: TFIBDataSetRO;
     QMCartaPortesTransportistaTRANSPORTISTA: TIntegerField;
     QMCartaPortesTransportistaNOMBRE_R_SOCIAL: TFIBStringField;
     QMCartaPortesTransportistaPORTES: TIntegerField;
     QMCartaPortesAlbaranes: TFIBDataSetRO;
     QMCartaPortesAlbaranesFECHA: TDateTimeField;
     QMCartaPortesAlbaranesSERIE: TFIBStringField;
     QMCartaPortesAlbaranesRIG: TIntegerField;
     QMCartaPortesAlbaranesBULTOS: TIntegerField;
     QMCartaPortesAlbaranesBULTOS_KRI: TIntegerField;
     QMCartaPortesAlbaranesNOMBRE_R_SOCIAL: TFIBStringField;
     QMCartaPortesAlbaranesDIR_TIPO: TFIBStringField;
     QMCartaPortesAlbaranesDIR_NOMBRE: TFIBStringField;
     QMCartaPortesAlbaranesDIR_NOMBRE_2: TFIBStringField;
     QMCartaPortesAlbaranesDIR_NUMERO: TFIBStringField;
     QMCartaPortesAlbaranesDIR_BLOQUE_ESCALERA: TFIBStringField;
     QMCartaPortesAlbaranesDIR_PISO: TFIBStringField;
     QMCartaPortesAlbaranesDIR_PUERTA: TFIBStringField;
     QMCartaPortesAlbaranesDIR_COMPLETA: TFIBStringField;
     QMCartaPortesAlbaranesDIR_COMPLETA_N: TFIBStringField;
     QMCartaPortesAlbaranesDIR_TELEFONO01: TFIBStringField;
     QMCartaPortesAlbaranesDIR_TELEFONO02: TFIBStringField;
     QMCartaPortesAlbaranesDIR_TELEFAX: TFIBStringField;
     QMCartaPortesAlbaranesLOCALIDAD: TFIBStringField;
     QMCartaPortesAlbaranesCODIGO_POSTAL: TFIBStringField;
     QMCartaPortesAlbaranesNOTAS: TBlobField;
     QMCartaPortesAlbaranesSU_REFERENCIA: TFIBStringField;
     frDBCartaPortesTransportista: TfrDBDataSet;
     frDBCartaPortesAlbaranes: TfrDBDataSet;
     QMCartaPortesAlbaranesPAIS: TFIBStringField;
     QMCartaPortesAlbaranesPROVINCIA: TFIBStringField;
     xEtiquetasSU_REFERENCIA: TFIBStringField;
     xEtiquetasDIRECCION_EDI: TFIBStringField;
     QMCartaPortesAlbaranesDIRECCION_EDI: TFIBStringField;
     QAgrupacionAlbaranesINTERVALO: TFIBStringField;
     xArticuloKri: TFIBDataSetRO;
     xArticuloKriALFA_1: TFIBStringField;
     xArticuloKriALFA_2: TFIBStringField;
     xArticuloKriALFA_3: TFIBStringField;
     xArticuloKriALFA_4: TFIBStringField;
     xArticuloKriALFA_5: TFIBStringField;
     xArticuloKriTITULO_CORTO: TFIBStringField;
     xArticuloKriSERIALIZADO_KRI: TIntegerField;
     xArticuloKriLOTES_KRI: TIntegerField;
     DSxArticuloKri: TDataSource;
     QPackingListTotalesID_A: TIntegerField;
     TUpdate: THYTransaction;
     QCabecerasAlbaran: TFIBTableSet;
     QCabecerasAlbaranEMPRESA: TIntegerField;
     QCabecerasAlbaranEJERCICIO: TIntegerField;
     QCabecerasAlbaranCANAL: TIntegerField;
     QCabecerasAlbaranSERIE: TFIBStringField;
     QCabecerasAlbaranTIPO: TFIBStringField;
     QCabecerasAlbaranRIG: TIntegerField;
     QCabecerasAlbaranALMACEN: TFIBStringField;
     QCabecerasAlbaranFECHA: TDateTimeField;
     QCabecerasAlbaranTITULO: TFIBStringField;
     QCabecerasAlbaranCLIENTE: TIntegerField;
     QCabecerasAlbaranSU_REFERENCIA: TFIBStringField;
     QCabecerasAlbaranESTADO: TIntegerField;
     QCabecerasAlbaranTRANSPORTISTA: TIntegerField;
     QCabecerasAlbaranID_S: TIntegerField;
     QCabecerasAlbaranAGRUPACION_KRI: TIntegerField;
     QCabecerasAlbaranENTRADA_AGRUP: TIntegerField;
     QMCartaPortesTransportistaEMPRESA: TIntegerField;
     QMCartaPortesTransportistaEJERCICIO: TIntegerField;
     QMCartaPortesTransportistaCANAL: TIntegerField;
     QMCartaPortesTransportistaTIPO_PORTES: TIntegerField;
     QMCartaPortesTransportistaIDIOMA: TFIBStringField;
     xDireccion: TFIBDataSetRO;
     xDireccionDIR_TIPO: TFIBStringField;
     xDireccionDIR_NOMBRE: TFIBStringField;
     xDireccionDIR_NUMERO: TFIBStringField;
     xDireccionDIR_BLOQUE_ESCALERA: TFIBStringField;
     xDireccionDIR_PISO: TFIBStringField;
     xDireccionDIR_PUERTA: TFIBStringField;
     xDireccionLOCALIDAD: TFIBStringField;
     xDireccionTITULO_LOCALIDAD: TFIBStringField;
     xDireccionCODIGO_POSTAL: TFIBStringField;
     xDireccionTITULO_PROVINCIA: TFIBStringField;
     xDireccionTITULO_PAIS: TFIBStringField;
     xDireccionDIR_NOMBRE_2: TFIBStringField;
     DSxDireccion: TDataSource;
     xDireccionDIR_TELEFONO01: TFIBStringField;
     xDireccionDIR_TELEFONO02: TFIBStringField;
     xDireccionDIR_TELEFAX: TFIBStringField;
     xPackingList: TFIBDataSetRO;
     DSxPackingList: TDataSource;
     ExcelApplication: TExcelApplication;
     ExcelWorkbook: TExcelWorkbook;
     xPackingList2: TFIBDataSetRO;
     DSxPackingList2: TDataSource;
     xPackingListARTICULO: TFIBStringField;
     xPackingListPEDIDO: TFIBStringField;
     xPackingListCOLOR: TFIBStringField;
     xPackingListPATRON: TFIBStringField;
     xPackingListCAJA: TFIBStringField;
     xPackingListALMACEN: TIntegerField;
     xPackingListTIENDA: TIntegerField;
     xPackingListT01: TFloatField;
     xPackingListT02: TFloatField;
     xPackingListT03: TFloatField;
     xPackingListT04: TFloatField;
     xPackingListT05: TFloatField;
     xPackingListT06: TFloatField;
     xPackingListT07: TFloatField;
     xPackingList2PEDIDO: TFIBStringField;
     xPackingList2PATRON: TFIBStringField;
     xPackingList2COLOR: TFIBStringField;
     xPackingList2T01: TFloatField;
     xPackingList2T02: TFloatField;
     xPackingList2T03: TFloatField;
     xPackingList2T04: TFloatField;
     xPackingList2T05: TFloatField;
     xPackingList2T06: TFloatField;
     xPackingList2T07: TFloatField;
     xPackingList2T08: TFloatField;
     xPackingList2T09: TFloatField;
     xPackingList2T10: TFloatField;
     xPackingList2T11: TFloatField;
     xPackingList2T12: TFloatField;
     xPackingList2T13: TFloatField;
     xPackingList2T14: TFloatField;
     xPackingList2T15: TFloatField;
     xPackingList2T16: TFloatField;
     xPackingList2T17: TFloatField;
     xPackingList2T18: TFloatField;
     xPackingList2T19: TFloatField;
     xPackingList2T20: TFloatField;
     xPackingList2T21: TFloatField;
     xPackingList2T22: TFloatField;
     xPackingListUNID: TFloatField;
     QAgrupacionAlbaranesSeleccion: TFIBTableSet;
     DSQAgrupacionAlbaranesSeleccion: TDataSource;
     QAgrupacionAlbaranesSeleccionEMPRESA: TIntegerField;
     QAgrupacionAlbaranesSeleccionCANAL: TIntegerField;
     QAgrupacionAlbaranesSeleccionTIPO: TFIBStringField;
     QAgrupacionAlbaranesSeleccionID_S_AG: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_1: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_2: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_3: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_4: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_5: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_6: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_7: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_8: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_9: TIntegerField;
     QAgrupacionAlbaranesSeleccionTAREA_10: TIntegerField;
     QAgrupacionAlbaranesSeleccionINTERVALO: TFIBStringField;
     xPackingList2ARTICULO: TFIBStringField;
     QMCartaPortesTransportistaID_S_AG: TIntegerField;
     QMCartaPortesTransportistaENTRADA_AGRUP: TIntegerField;
     xPackingListT08: TFloatField;
     frxListado: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure QPackingListTotalesAfterOpen(DataSet: TDataSet);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure QMCartaPortesTransportistaAfterOpen(DataSet: TDataSet);
     procedure QAgrupacionAlbaranesAfterOpen(DataSet: TDataSet);
     procedure QAgrupacionAlbaranesBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QCabecerasAlbaranNewRecord(DataSet: TDataSet);
     procedure QPackingListTotalesBeforeClose(DataSet: TDataSet);
     procedure QCabecerasAlbaranBeforeOpen(DataSet: TDataSet);
     procedure QCabecerasAlbaranAfterOpen(DataSet: TDataSet);
     procedure QCabecerasAlbaranBeforeClose(DataSet: TDataSet);
     procedure QAgrupacionAlbaranesSeleccionAfterOpen(DataSet: TDataSet);
     procedure QAgrupacionAlbaranesSeleccionAfterPost(DataSet: TDataSet);
     procedure QMCartaPortesTransportistaBeforeClose(DataSet: TDataSet);
     procedure frxListadoGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Intervalo: string;
     SuProveedor: string;
     procedure DamePatronColor(Articulo: string; var Patron, Color: string);
  public
     { Public declarations }
     procedure ImprimirAlbaranes(Modo: byte);
     procedure ImprimirPackingList(Modo: byte);
     procedure ImprimirPackingListTotal(Modo: byte);
     procedure ImprimirEtiquetas(Modo, Copias, Vacias: byte);
     procedure FacturaAlbaranes;
     procedure ImprimirFacturas(Modo: byte);
     procedure ImprimirCartaPortes(Modo: byte);
     procedure CalculaIntervalo(id_s_ag: integer);
     procedure Marcar(Entrada: integer);
     procedure Refresca;
     procedure ImprimirEtiquetasSEUR(Modo, Copias, Vacias: byte);
     procedure ExportarPackingList(Archivo: string);
     procedure AbrirPackingList;
     procedure EportarCSV(Palets: integer; NroProveedor, Separador: string);
  end;

var
  DMAgrupacionDeAlbaranesKri : TDMAgrupacionDeAlbaranesKri;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest, UDMLstAlbaranes,
  UDMLstFactura, UUtiles, UHojaCalc, Graphics, UDameDato;

{$R *.dfm}

procedure TDMAgrupacionDeAlbaranesKri.DataModuleCreate(Sender: TObject);
var
  no_id_s_ag : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(ID_S_AG) FROM GES_CABECERAS_S_AGRUP WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL AND TIPO = ''ALB''';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        no_id_s_ag := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QAgrupacionAlbaranes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NO_ID_S_AG'].AsInteger := no_id_s_ag;
     Open;
     Last;
  end;

  with QAgrupacionAlbaranesSeleccion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NO_ID_S_AG'].AsInteger := no_id_s_ag;
     Open;
     Last;
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.QPackingListTotalesAfterOpen(DataSet: TDataSet);
begin
  xTallas.Close;
  xTallas.Open;
  xArticuloKri.Close;
  xArticuloKri.Open;
end;

procedure TDMAgrupacionDeAlbaranesKri.ImprimirAlbaranes(Modo: byte);
begin
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  QCabecerasAlbaran.First;
  while (not QCabecerasAlbaran.EOF) do
  begin
     if (QCabecerasAlbaranENTRADA_AGRUP.AsInteger = REntorno.Entrada) then
        DMLstAlbaranes.MostrarListado(QCabecerasAlbaranID_S.AsInteger,
           QCabecerasAlbaranRIG.AsInteger, QCabecerasAlbaranSERIE.AsString, Modo,
           1{modelo 34}, QCabecerasAlbaranEJERCICIO.AsInteger);
     QCabecerasAlbaran.Next;
  end;
  QCabecerasAlbaran.First;
  CierraData(DMLstAlbaranes);

  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_1.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.ImprimirPackingList(Modo: byte);
begin
  AbreData(TDMLstAlbaranes, DMLstAlbaranes);
  QCabecerasAlbaran.First;
  while (not QCabecerasAlbaran.EOF) do
  begin
     if (QCabecerasAlbaranENTRADA_AGRUP.AsInteger = REntorno.Entrada) then
        DMLstAlbaranes.MostrarListado(QCabecerasAlbaranID_S.AsInteger,
           QCabecerasAlbaranRIG.AsInteger, QCabecerasAlbaranSERIE.AsString, Modo,
           2{modelo 113}, QCabecerasAlbaranEJERCICIO.AsInteger);
     QCabecerasAlbaran.Next;
  end;
  QCabecerasAlbaran.First;
  CierraData(DMLstAlbaranes);

  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_2.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.ImprimirPackingListTotal(Modo: byte);
begin
  AbreData(TDMListados, DMListados);
  with QPackingListTotales do
  begin
     Close;
     Params.ByName['ID_S_AG'].AsInteger := QAgrupacionAlbaranesID_S_AG.AsInteger;
     Open;
     CalculaIntervalo(QAgrupacionAlbaranesID_S_AG.AsInteger);

     DMListados.Imprimir(5101, 0, Modo, '', '', frListado, frxListado, nil, nil);

     Close;
  end;

  CierraData(DMListados);

  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_3.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.ImprimirEtiquetas(Modo, Copias, Vacias: byte);
begin
  AbreData(TDMListados, DMListados);
  with xEtiquetas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QAgrupacionAlbaranesEMPRESA.AsInteger;
     Params.ByName['ID_S_AG'].AsInteger := QAgrupacionAlbaranesID_S_AG.AsInteger;
     Params.ByName['VACIAS'].AsInteger := 0;
     Params.ByName['COPIAS'].AsInteger := 0; {Si 0 imprime cantidad de bultos_kri}
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;

     DMListados.Imprimir(58, 0, Modo, '', '', frListado, frxListado, nil, nil);

     Close;
  end;

  CierraData(DMListados);

  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_4.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.FacturaAlbaranes;
var
  EstadoKri : integer;
begin
  EstadoKri := DMMain.EstadoKri(4);
  QCabecerasAlbaran.First;
  while (not QCabecerasAlbaran.EOF) do
  begin
     if ((QCabecerasAlbaranESTADO.AsInteger = 0) and
        (QCabecerasAlbaranENTRADA_AGRUP.AsInteger = REntorno.Entrada)) then
     begin
        with SPTraspasoAlbaranMul do
        begin
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           Params.ByName['EMPRESA'].AsInteger := QCabecerasAlbaranEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger :=
              QCabecerasAlbaranEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QCabecerasAlbaranCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QCabecerasAlbaranSERIE.AsString;
           Params.ByName['TIPO'].AsString := QCabecerasAlbaranTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QCabecerasAlbaranRIG.AsInteger;
           Params.ByName['TIPO_DESTINO'].AsString := 'FAC';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           if EstadoKri = 1 then
              Params.ByName['FECHA'].AsDateTime := QCabecerasAlbaranFECHA.AsDateTime
           else
              Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
           Params.ByName['TRANSPORTISTA'].AsInteger :=
              QCabecerasAlbaranTRANSPORTISTA.AsInteger;
           Params.ByName['D_EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['D_CANAL'].AsInteger := QCabecerasAlbaranCANAL.AsInteger;
           Params.ByName['D_SERIE'].AsString := QCabecerasAlbaranSERIE.AsString;
           Params.ByName['ID_S'].AsInteger := QCabecerasAlbaranID_S.AsInteger;
           ExecQuery;
           Transaction.Commit;

           with QDestino do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := QCabecerasAlbaranEMPRESA.AsInteger;
              Params.ByName['Ejercicio'].AsInteger := QCabecerasAlbaranEJERCICIO.AsInteger;
              Params.ByName['Canal'].AsInteger := QCabecerasAlbaranCANAL.AsInteger;
              Params.ByName['Serie'].AsString := QCabecerasAlbaranSERIE.AsString;
              Params.ByName['Tipo'].AsString := QCabecerasAlbaranTIPO.AsString;
              Params.ByName['Rig'].AsInteger := QCabecerasAlbaranRIG.AsInteger;
              ExecQuery;
           end;

           with QCierra do
           begin
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              Close;
              Params.ByName['Empresa'].AsInteger := QDestino.FieldByName['D_EMPRESA'].AsInteger;
              Params.ByName['Ejercicio'].AsInteger := QDestino.FieldByName['D_EJERCICIO'].AsInteger;
              Params.ByName['Canal'].AsInteger := QDestino.FieldByName['D_CANAL'].AsInteger;
              Params.ByName['Serie'].AsString := QDestino.FieldByName['D_SERIE'].AsString;
              Params.ByName['Rig'].AsInteger := QDestino.FieldByName['D_RIG'].AsInteger;
              Params.ByName['Fecha'].AsDateTime := QDestino.FieldByName['FECHA'].AsDateTime;
              Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
              Params.ByName['ID_S'].AsInteger := QDestino.FieldByName['ID_S'].AsInteger;
              ExecQuery;
              Transaction.Commit;
           end;

           QDestino.FreeHandle;
        end;
     end;
     QCabecerasAlbaran.Next;
  end;
  QCabecerasAlbaran.First;
  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_5.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.ImprimirFacturas(Modo: byte);
begin
  AbreData(TDMLstFactura, DMLstFactura);
  QCabecerasAlbaran.First;
  while (not QCabecerasAlbaran.EOF) do
  begin
     if ((QCabecerasAlbaranESTADO.AsInteger = 5) and
        (QCabecerasAlbaranENTRADA_AGRUP.AsInteger = REntorno.Entrada)) then
     begin
        with QDestino do
        begin
           Close;
           Params.ByName['Empresa'].AsInteger := QCabecerasAlbaranEMPRESA.AsInteger;
           Params.ByName['Ejercicio'].AsInteger := QCabecerasAlbaranEJERCICIO.AsInteger;
           Params.ByName['Canal'].AsInteger := QCabecerasAlbaranCANAL.AsInteger;
           Params.ByName['Serie'].AsString := QCabecerasAlbaranSERIE.AsString;
           Params.ByName['Tipo'].AsString := QCabecerasAlbaranTIPO.AsString;
           Params.ByName['Rig'].AsInteger := QCabecerasAlbaranRIG.AsInteger;
           ExecQuery;
           DMLstFactura.MostrarListado(FieldByName['ID_S'].AsInteger,
              FieldByName['D_RIG'].AsInteger, FieldByName['D_SERIE'].AsString, Modo, 1,
              FieldByName['D_EJERCICIO'].AsInteger);
           FreeHandle;
        end;
     end;
     QCabecerasAlbaran.Next;
  end;
  QCabecerasAlbaran.First;

  CierraData(DMLstFactura);
  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_6.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.ImprimirCartaPortes(Modo: byte);
begin
  AbreData(TDMListados, DMListados);
  with QMCartaPortesTransportista do
  begin
     Close;
     Params.ByName['ENTRADA_AGRUP'].AsInteger := REntorno.Entrada;
     Open;
     CalculaIntervalo(QAgrupacionAlbaranesID_S_AG.AsInteger);

     DMListados.Imprimir(5127, 0, Modo, '', '', frListado, frxListado, nil, nil);

     Close;
  end;

  CierraData(DMListados);

  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_7.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Intervalo') then
     ParValue := Intervalo;

  // Portes en documentos
  if ParName = 'PorteVisible' then
     ParValue := not (QMCartaPortesTransportistaTIPO_PORTES.AsInteger = 0);

  if ParName = 'DescPortes' then
     ParValue := DameTituloPorte(QMCartaPortesTransportistaTIPO_PORTES.AsInteger, QMCartaPortesTransportistaIDIOMA.AsString);
end;

procedure TDMAgrupacionDeAlbaranesKri.QMCartaPortesTransportistaAfterOpen(DataSet: TDataSet);
begin
  QMCartaPortesAlbaranes.Close;
  {QMCartaPortesAlbaranes.Params.ByName['ID_S_AG'].AsInteger :=
    QAgrupacionAlbaranesID_S_AG.AsInteger;
  QMCartaPortesAlbaranes.Params.ByName['ENTRADA_AGRUP'].AsInteger :=
    REntorno.Entrada;}
  QMCartaPortesAlbaranes.Open;
end;

procedure TDMAgrupacionDeAlbaranesKri.CalculaIntervalo(id_s_ag: integer);
begin
  if (QCabecerasAlbaranAGRUPACION_KRI.AsString > '') and
     (QCabecerasAlbaranID_S.AsString > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT INTERVALO FROM GES_CABECERAS_S_AGRUP WHERE ID_S_AG=' + IntToStr(id_s_ag);
           try
              ExecQuery;
              Intervalo := FieldByName['INTERVALO'].AsString;
           except
              Intervalo := '';
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.Marcar(Entrada: integer);
var
  id_s_ag : integer;
  id_s : integer;
begin
  id_s_ag := QAgrupacionAlbaranesID_S_AG.AsInteger;
  id_s := QCabecerasAlbaranID_S.AsInteger;
  QCabecerasAlbaran.Close;
  QAgrupacionAlbaranes.Close;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_CABECERAS_S_AGRUP_DET ');
        SQL.Add(' SET ENTRADA_AGRUP = :ENTRADA_AGRUP ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S_AG = :ID_S_AG ');
        Params.ByName['ENTRADA_AGRUP'].AsInteger := Entrada;
        Params.ByName['ID_S_AG'].AsInteger := id_s_ag;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Reposiciono la agrupacion y luego el albaran
  with QAgrupacionAlbaranes do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
  end;
  Posicionar(QAgrupacionAlbaranes, 'ID_S_AG', id_s_ag);

  with QCabecerasAlbaran do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
  end;
  Posicionar(QCabecerasAlbaran, 'ID_S', id_s);
end;

procedure TDMAgrupacionDeAlbaranesKri.QAgrupacionAlbaranesAfterOpen(DataSet: TDataSet);
begin
  QCabecerasAlbaran.Open;
end;

procedure TDMAgrupacionDeAlbaranesKri.QAgrupacionAlbaranesBeforeClose(DataSet: TDataSet);
begin
  QCabecerasAlbaran.Close;
end;

procedure TDMAgrupacionDeAlbaranesKri.DataModuleDestroy(Sender: TObject);
begin
  // Desmarco todo lo de mi entrada
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE GES_CABECERAS_S_AGRUP_DET ');
        SQL.Add(' SET ENTRADA_AGRUP = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA_AGRUP = :ENTRADA_AGRUP ');
        Params.ByName['ENTRADA_AGRUP'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMAgrupacionDeAlbaranesKri.QCabecerasAlbaranNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAgrupacionDeAlbaranesKri.QPackingListTotalesBeforeClose(DataSet: TDataSet);
begin
  xTallas.Close;
  xArticuloKri.Close;
end;

procedure TDMAgrupacionDeAlbaranesKri.QCabecerasAlbaranBeforeOpen(DataSet: TDataSet);
begin
  QCabecerasAlbaran.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
end;

procedure TDMAgrupacionDeAlbaranesKri.Refresca;
begin
  Refrescar(QAgrupacionAlbaranes, 'ID_S_AG', 0);
end;

procedure TDMAgrupacionDeAlbaranesKri.ImprimirEtiquetasSEUR(Modo, Copias, Vacias: byte);
var
  CodigoIntegracion : integer;
  Transportista : integer;
begin
  AbreData(TDMListados, DMListados);
  with QCabecerasAlbaran do
  begin
     First;
     // Busco el primer Transportista SEUR. Modificare albaranes si no tiene un transportista SEUR
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MIN(ACREEDOR) FROM SEUR_CONFIGURACION WHERE EMPRESA=?EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := QCabecerasAlbaranEMPRESA.AsInteger;
           ExecQuery;
           Transportista := FieldByName['MIN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Recorro los albaranes
     while (not EOF) do
     begin
        // Proceso solo los marcados
        if (QCabecerasAlbaranENTRADA_AGRUP.AsInteger = REntorno.Entrada) then
        begin
           // Miro si el transportista es SEUR
           // CodigoIntegracion := 0;
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT CODIGO_INTEGRACION FROM SEUR_CONFIGURACION WHERE EMPRESA=?EMPRESA AND ACREEDOR=?TRANSPORTISTA';
                 Params.ByName['EMPRESA'].AsInteger := QCabecerasAlbaranEMPRESA.AsInteger;
                 Params.ByName['TRANSPORTISTA'].AsInteger := QCabecerasAlbaranTRANSPORTISTA.AsInteger;
                 ExecQuery;
                 CodigoIntegracion := FieldByName['CODIGO_INTEGRACION'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Si no es SEUR lo cambio por el primero que lo sea
           if (CodigoIntegracion = 0) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE VER_CABECERAS_ALBARAN SET TRANSPORTISTA=?TRANSPORTISTA WHERE ID_S=?ID_S';
                    Params.ByName['ID_S'].AsInteger := QCabecerasAlbaranID_S.AsInteger;
                    Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                    ExecQuery;
                    // CodigoIntegracion := FieldByName['CODIGO_INTEGRACION'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           // Imprimo la etiqueta SEUR
           DMListados.Imprimir(2006, 0, Modo, '', '', frListado, frxListado, nil, nil);

           // Guardo los datos para el registro de envios
        end;

        Next;
     end;
  end;

  CierraData(DMListados);
  try
     QAgrupacionAlbaranes.Edit;
     QAgrupacionAlbaranesTAREA_8.AsInteger := 1;
     QAgrupacionAlbaranes.Post;
  except
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.QCabecerasAlbaranAfterOpen(DataSet: TDataSet);
begin
  xDireccion.Open;
end;

procedure TDMAgrupacionDeAlbaranesKri.QCabecerasAlbaranBeforeClose(DataSet: TDataSet);
begin
  xDireccion.Close;
end;

procedure TDMAgrupacionDeAlbaranesKri.DamePatronColor(Articulo: string; var Patron, Color: string);
var
  i : integer;
  Alfa1, Alfa3 : string;
begin
  /// Campo ALFA_1. Hasta el "-" se asigna a Patron.
  ///               Desde el "-" se asigna a Color.
  /// campo ALFA_3 se concatena a Patron.
  ///
  /// Ejemplo ALFA_1 = 'PPP-CCC', ALFA_3 = 'ABC' --> Patron = 'PPP ABC', Color = 'CCC'.

  Patron := '';
  Color := '';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ALFA_1, ALFA_3 FROM ART_ARTICULOS WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND ARTICULO= ''' + Articulo + '''';
        ExecQuery;
        Alfa1 := Trim(FieldByName['ALFA_1'].AsString);
        Alfa3 := Trim(FieldByName['ALFA_3'].AsString);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Length(Alfa1) > 0) then
  begin
     i := 1;
     if (Length(Alfa1) >= 1) then
     begin
        while (Alfa1[i] <> '-') and (Length(Alfa1) >= i) do
        begin
           Patron := Patron + Alfa1[i];
           Inc(i);
        end;
     end;

     if (Length(Alfa1) > i) then
     begin
        if (Alfa1[i] = '-') then
           Inc(i);
     end;

     for i := i to Length(Alfa1) do
     begin
        Color := Color + Alfa1[i];
     end;
  end;

  if (Length(Alfa3) > 0) then
  begin
     Patron := Patron + ' ' + Alfa3;
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.ExportarPackingList(Archivo: string);
var
  MarcaFila, FilaTotalUnidades : integer;
  Suma1, Suma2, Suma3, Suma4 : real;
  Num_Ped, NumPed2, Patron, Color : string;
  ListaPedidos : TStrings;

  HCalc : THojaCalc;
  c, f : integer;

  procedure SetBold(HCalc: THojaCalc; f1, c1, f2, c2: integer);
  var
     f : integer;
  begin
     f := f1;
     while c1 <= c2 do
     begin
        while f1 <= f2 do
        begin
           HCalc.Bold(f1, c1);

           Inc(f1);
        end;

        f1 := f;
        Inc(c1);
     end;
  end;

  procedure SetBackgroundColor(HCalc: THojaCalc; f1, c1, f2, c2: integer; Color: TColor);
  var
     f : integer;
  begin
     f := f1;
     while c1 <= c2 do
     begin
        while f1 <= f2 do
        begin
           HCalc.BackgroundColor(f1, c1, Color);

           Inc(f1);
        end;

        f1 := f;
        Inc(c1);
     end;
  end;

  procedure SetFontSize(HCalc: THojaCalc; f1, c1, f2, c2: integer; Size: integer);
  var
     f : integer;
  begin
     f := f1;
     while c1 <= c2 do
     begin
        while f1 <= f2 do
        begin
           HCalc.FontSize(f1, c1, Size);

           Inc(f1);
        end;

        f1 := f;
        Inc(c1);
     end;
  end;

begin
  DMMain.LogIni(Format('ExportarPackingList(%s)', [Archivo]));

  try
     HCalc := THojaCalc.Create(thcOpenOffice, False); //OpenOffice doc if possible, please
     with HCalc do
     begin
        try
           FileName := Archivo; //Needs a file name before you SaveDoc!

           // Range['A1', 'P' + IntToStr(Filas)].Borders.Weight := 2;

           DMMain.Log('Ajuste de tamaño de columna');
           ColumnWidth(1, 2900); //Width in 1/100 of mm.
           ColumnWidth(2, 700); //Width in 1/100 of mm.

           ColumnWidth(3, 1700); //Width in 1/100 of mm.
           ColumnWidth(4, 1700); //Width in 1/100 of mm.
           ColumnWidth(5, 1700); //Width in 1/100 of mm.
           ColumnWidth(6, 1700); //Width in 1/100 of mm.

           ColumnWidth(7, 700); //Width in 1/100 of mm.
           ColumnWidth(8, 700); //Width in 1/100 of mm.
           ColumnWidth(9, 700); //Width in 1/100 of mm.
           ColumnWidth(10, 700); //Width in 1/100 of mm.
           ColumnWidth(11, 700); //Width in 1/100 of mm.
           ColumnWidth(12, 700); //Width in 1/100 of mm.
           ColumnWidth(13, 700); //Width in 1/100 of mm.
           ColumnWidth(14, 700); //Width in 1/100 of mm.
           ColumnWidth(15, 800); //Width in 1/100 of mm.

           DMMain.Log('Cabecera');
           f := 1;
           SetBold(HCalc, f, 1, f, 15);
           SetFontSize(HCalc, f, 1, f, 15, 10);
           SetBackgroundcolor(HCalc, f, 1, f, 15, clSilver);

           CellText[f, 1] := 'DIRECCION DESTINATARIO';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           CellText[f, 7] := 'CADENA';
           // Range['A1', 'G1'].Mergecells := True;
           // Range['H1', 'P1'].Mergecells := True;

           Inc(f);
           // SetBold(HCalc, f, 1, f, 6);
           SetFontSize(HCalc, f, 1, f, 6, 7);
           // SetBackgroundcolor(HCalc, f, 1, f, 6, clSilver);

           CellText[f, 1] := 'ALM. REG. COMPRAS CORTEFIEL';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;

           SetBold(HCalc, f, 6, f, 6);
           SetFontSize(HCalc, f, 6, f, 6, 12);
           // SetBackgroundcolor(HCalc, f, 6, f, 6, clSilver);

           CellText[f, 6] := 'CORTEFIEL';
           // Range['H' + IntToStr(Filas), 'P' + IntToStr(Filas + 2)].Mergecells := True;

           Inc(f);
           // SetBold(HCalc, f, 1, f, 6);
           SetFontSize(HCalc, f, 1, f, 6, 7);
           // SetBackgroundcolor(HCalc, f, 1, f, 6, clSilver);
           CellText[f, 1] := 'PASEO DEL DELEITE S/N';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;

           Inc(f);
           // SetBold(HCalc, f, 1, f, 6);
           SetFontSize(HCalc, f, 1, f, 6, 7);
           // SetBackgroundcolor(HCalc, f, 1, f, 6, clSilver);

           CellText[f, 1] := '28300 ARANJUEZ - MADRID';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;

           Inc(f);
           SetBold(HCalc, f, 1, f, 15);
           SetFontSize(HCalc, f, 1, f, 15, 10);
           SetBackgroundcolor(HCalc, f, 1, f, 15, clSilver);

           CellText[f, 1] := 'NOMBRE DEL PROVEEDOR';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := 'FECHA DE ENTREGA EN ALMACEN';
           CellText[f, 7] := '';
           CellText[f, 8] := '';
           CellText[f, 9] := '';
           CellText[f, 10] := '';
           CellText[f, 11] := '';
           CellText[f, 12] := '';
           CellText[f, 13] := '';
           CellText[f, 14] := '';
           CellText[f, 15] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;
           // Range['H' + IntToStr(Filas), 'P' + IntToStr(Filas)].Mergecells := True;

           Inc(f);
           SetBold(HCalc, f, 1, f, 1);
           SetFontSize(HCalc, f, 1, f, 1, 12);
           // SetBackgroundcolor(HCalc, f, 1, f, 1, clSilver);

           CellText[f, 1] := REntorno.NombreEmpresa;
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;
           // Range['H' + IntToStr(Filas), 'P' + IntToStr(Filas)].Mergecells := True;

           Inc(f);
           SetBold(HCalc, f, 1, f, 7);
           SetFontSize(HCalc, f, 1, f, 15, 10);
           SetBackgroundcolor(HCalc, f, 1, f, 15, clSilver);

           CellText[f, 1] := 'CODIGO DEL PROVEEDOR';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := 'Nº DE PEDIDO(S)';
           CellText[f, 7] := '';
           CellText[f, 8] := '';
           CellText[f, 9] := '';
           CellText[f, 10] := '';
           CellText[f, 11] := '';
           CellText[f, 12] := '';
           CellText[f, 13] := '';
           CellText[f, 14] := '';
           CellText[f, 15] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;
           // Range['H' + IntToStr(Filas), 'P' + IntToStr(Filas)].Mergecells := True;

           Inc(f);
           SetBold(HCalc, f, 1, f, 6);
           SetFontSize(HCalc, f, 1, f, 6, 12);
           // SetBackgroundcolor(HCalc, f, 1, f, 6, clSilver);

           CellText[f, 1] := SuProveedor;
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].MergeCells;

           DMMain.Log('Lista de Pedidos');
           Inc(f);
           xPackingList.First;
           ListaPedidos := TStringList.Create;
           try
              c := 3;
              while (not xPackingList.EOF) do
              begin
                 Num_Ped := xPackingListPEDIDO.AsString;

                 // Si no esta en la lista de pedidos
                 if (ListaPedidos.IndexOf(Num_Ped) = -1) then
                 begin
                    ListaPedidos.Add(Num_Ped);
                    CellText[f, c] := Num_Ped;
                    Inc(c);
                 end;

                 if (c >= 8) then
                 begin
                    c := 3;
                    Inc(f);
                 end;

                 xPackingList.Next;
              end; {while}
           finally
              ListaPedidos.Free;
           end;
           // Range['A' + IntToStr(Filas2), 'G' + IntToStr(Filas)].Mergecells := True;
           // Range['A1', 'O' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

           DMMain.Log('Cabecera para totales');
           Inc(f);
           SetBold(HCalc, f, 1, f, 7);
           SetFontSize(HCalc, f, 1, f, 7, 10);
           SetBackgroundcolor(HCalc, f, 1, f, 15, clSilver);

           CellText[f, 1] := 'CANTIDAD TOTAL PRENDAS';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := 'CANTIDAD TOTAL CAJAS/ SETS';
           CellText[f, 7] := '';
           CellText[f, 8] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;
           // Range['H' + IntToStr(Filas), 'P' + IntToStr(Filas)].Mergecells := True;
           // Range['A' + IntToStr(Filas), 'P' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

           // Esta fila contendrá el total de unidades
           Inc(f);
           FilaTotalUnidades := f;
           SetBold(HCalc, f, 1, f, 7);
           SetFontSize(HCalc, f, 1, f, 7, 12);
           // SetBackgroundcolor(HCalc, f, 1, f, 16, clSilver);

           CellText[f, 1] := '';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           CellText[f, 7] := '';
           // Range['A' + IntToStr(Filas), 'G' + IntToStr(Filas)].Mergecells := True;
           // Range['H' + IntToStr(Filas), 'P' + IntToStr(Filas)].Mergecells := True;
           // Range['H1', 'P' + IntToStr(Filas)].MergeCells;

           Inc(f);
           SetBold(HCalc, f, 1, f, 15);
           SetFontSize(HCalc, f, 1, f, 15, 10);
           SetBackgroundcolor(HCalc, f, 1, f, 15, clSilver);

           DMMain.Log('Detalle de Packing List');
           CellText[f, 1] := 'DETALLE PACKING LIST';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := '';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           CellText[f, 7] := '';
           CellText[f, 8] := '';
           CellText[f, 9] := '';
           CellText[f, 10] := '';
           CellText[f, 11] := '';
           CellText[f, 12] := '';
           CellText[f, 13] := '';
           CellText[f, 14] := '';
           CellText[f, 15] := '';
           // Range['A' + IntToStr(Filas), 'P' + IntToStr(Filas)].Mergecells := True;

           Inc(f);
           SetBold(HCalc, f, 1, f, 15);
           SetFontSize(HCalc, f, 1, f, 15, 7);
           // SetBackgroundcolor(HCalc, f, 1, f, 16, clSilver);

           CellText[f, 1] := 'C. EAN';
           CellText[f, 2] := 'ALMACEN';
           CellText[f, 3] := 'TIENDA';
           CellText[f, 4] := 'Nº PEDIDO';
           CellText[f, 5] := 'PATRON';
           CellText[f, 6] := 'COLOR';
           CellText[f, 7] := 'TALLA';
           CellText[f, 8] := '';
           CellText[f, 9] := '';
           CellText[f, 10] := '';
           CellText[f, 11] := '';
           CellText[f, 12] := '';
           CellText[f, 13] := '';
           CellText[f, 14] := '';
           CellText[f, 15] := 'UDS';
           // Range['H' + IntToStr(Filas), 'O' + IntToStr(Filas)].Mergecells := True;
           // Range['A' + IntToStr(Filas3), 'P' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

           Inc(f);
           SetBold(HCalc, f, 7, f, 14);
           SetFontSize(HCalc, f, 7, f, 14, 7);
           SetBackgroundcolor(HCalc, f, 7, f, 14, clSilver);

           CellText[f, 7] := '75';
           CellText[f, 8] := '85';
           CellText[f, 9] := '90';
           CellText[f, 10] := '95';
           CellText[f, 11] := '100';
           CellText[f, 12] := '105';
           CellText[f, 13] := '110';
           CellText[f, 14] := '115';

           MarcaFila := f + 1;
           Suma1 := 0;

           DMMain.Log('Inicio recorrido de detalle de packing list');
           xPackingList.First;
           while not (xPackingList.EOF) do
           begin
              Inc(f);
              // Obtengo patron y color de ALFA_1
              DamePatronColor(xPackingListARTICULO.AsString, Patron, Color);

              SetBold(HCalc, f, 15, f, 15);
              SetFontSize(HCalc, f, 1, f, 15, 7);
              // SetBackgroundcolor(HCalc, f, 1, f, 15, clSilver);

              CellText[f, 1] := xPackingListCAJA.AsString;
              CellText[f, 2] := xPackingListALMACEN.AsString;
              CellText[f, 3] := xPackingListTIENDA.AsString;
              CellText[f, 4] := xPackingListPEDIDO.AsString;
              CellText[f, 5] := Patron;
              CellText[f, 6] := Color;
              SendNumber(f, 7, xPackingListT01.AsFloat);
              SendNumber(f, 8, xPackingListT02.AsFloat);
              SendNumber(f, 9, xPackingListT03.AsFloat);
              SendNumber(f, 10, xPackingListT04.AsFloat);
              SendNumber(f, 11, xPackingListT05.AsFloat);
              SendNumber(f, 12, xPackingListT06.AsFloat);
              SendNumber(f, 13, xPackingListT07.AsFloat);
              SendNumber(f, 14, xPackingListT08.AsFloat);
              SendNumber(f, 15, xPackingListUNID.AsFloat);

              Suma1 := Suma1 + xPackingListUNID.AsFloat;
              xPackingList.Next;
           end;

           DMMain.Log('Formato numerico para columnas');
           NumberFormat(Format('%s%d:%s%d', ['A', MarcaFila, 'A', f]), '#');
           NumberFormat(Format('%s%d:%s%d', ['F', MarcaFila, 'F', f]), '###000');
           NumberFormat(Format('%s%d:%s%d', ['G', MarcaFila, 'O', f]), '#');

           Inc(f);
           SetBold(HCalc, f, 1, f, 15);
           SetFontSize(HCalc, f, 1, f, 15, 7);
           // SetBackgroundcolor(HCalc, f, 1, f, 15, clSilver);
           NumberFormat(Format('%s%d:%s%d', ['N', f, 'O', f]), '#');

           CellText[f, 1] := '';
           CellText[f, 2] := '';
           CellText[f, 3] := '';
           CellText[f, 4] := 'TOTAL UNIDADES';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           CellText[f, 7] := '';
           CellText[f, 8] := '';
           CellText[f, 9] := '';
           CellText[f, 10] := '';
           CellText[f, 11] := '';
           CellText[f, 12] := '';
           CellText[f, 13] := '';
           CellText[f, 14] := '';
           SendNumber(f, 15, Suma1);
           // Range['A' + IntToStr(Filas), 'O' + IntToStr(Filas)].Mergecells := True;
           // Range['A' + IntToStr(Filas3), 'O' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

           SendNumber(FilaTotalUnidades, 1, Suma1);
           CellText[FilaTotalUnidades, 2] := '';
           CellText[FilaTotalUnidades, 3] := '';
           CellText[FilaTotalUnidades, 4] := '';
           CellText[FilaTotalUnidades, 5] := '';
           CellText[FilaTotalUnidades, 6] := '';
           CellText[FilaTotalUnidades, 7] := '';
           CellText[FilaTotalUnidades, 8] := '';
           CellText[FilaTotalUnidades, 9] := '';
           CellText[FilaTotalUnidades, 10] := '';
           CellText[FilaTotalUnidades, 11] := '';
           CellText[FilaTotalUnidades, 12] := '';
           CellText[FilaTotalUnidades, 13] := '';
           CellText[FilaTotalUnidades, 14] := '';
           CellText[FilaTotalUnidades, 15] := '';

           // Dejo una linea en blanco
           Inc(f);

           Inc(f);
           SetBold(HCalc, f, 4, f, 15);
           SetFontSize(HCalc, f, 4, f, 15, 10);
           SetBackgroundcolor(HCalc, f, 4, f, 15, clSilver);

           CellText[f, 4] := 'RESUMEN PACKING LIST';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           CellText[f, 7] := '';
           CellText[f, 8] := '';
           CellText[f, 9] := '';
           CellText[f, 10] := '';
           CellText[f, 11] := '';
           CellText[f, 12] := '';
           CellText[f, 13] := '';
           CellText[f, 14] := '';
           CellText[f, 15] := '';
           // Range['E' + IntToStr(Filas), 'P' + IntToStr(Filas)].Mergecells := True;
           // Range['E' + IntToStr(Filas3), 'P' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

           Inc(f);
           SetBold(HCalc, f, 4, f, 15);
           SetFontSize(HCalc, f, 4, f, 15, 7);
           // SetBackgroundcolor(HCalc, f, 5, f, 16, clSilver);

           CellText[f, 4] := 'Nº PEDIDO';
           CellText[f, 5] := 'PATRON';
           CellText[f, 6] := 'COLOR';
           CellText[f, 7] := '75';
           CellText[f, 8] := '85';
           CellText[f, 9] := '90';
           CellText[f, 10] := '95';
           CellText[f, 11] := '100';
           CellText[f, 12] := '105';
           CellText[f, 13] := '110';
           CellText[f, 14] := '115';
           CellText[f, 15] := 'UDS';

           MarcaFila := f + 1;

           // Se hace Resumen de Pedidos
           DMMain.Log('Resumen de Packing List');

           Suma3 := 0;
           Suma4 := 0;
           xPackingList2.First;
           NumPed2 := xPackingList2Pedido.AsString;
           while not (xPackingList2.EOF) do
           begin
              Suma2 := xPackingList2T01.AsFloat +
                 xPackingList2T02.AsFloat +
                 xPackingList2T03.AsFloat +
                 xPackingList2T04.AsFloat +
                 xPackingList2T05.AsFloat +
                 xPackingList2T06.AsFloat +
                 xPackingList2T07.AsFloat +
                 xPackingList2T08.AsFloat +
                 xPackingList2T09.AsFloat +
                 xPackingList2T10.AsFloat +
                 xPackingList2T11.AsFloat +
                 xPackingList2T12.AsFloat +
                 xPackingList2T13.AsFloat +
                 xPackingList2T14.AsFloat +
                 xPackingList2T15.AsFloat +
                 xPackingList2T16.AsFloat +
                 xPackingList2T17.AsFloat +
                 xPackingList2T18.AsFloat +
                 xPackingList2T19.AsFloat +
                 xPackingList2T20.AsFloat +
                 xPackingList2T21.AsFloat +
                 xPackingList2T22.AsFloat;
              Suma3 := Suma3 + Suma2;
              Suma4 := Suma4 + Suma2;

              // Saco Patron y Color de ALFA_1
              DamePatronColor(xPackingList2ARTICULO.AsString, Patron, Color);

              Inc(f);
              SetBold(HCalc, f, 15, f, 15);
              SetFontSize(HCalc, f, 4, f, 15, 7);
              // SetBackgroundcolor(HCalc, f, 4, f, 15, clSilver);

              CellText[f, 4] := xPackingList2PEDIDO.Value;
              CellText[f, 5] := Patron;
              CellText[f, 6] := Color;
              SendNumber(f, 7, xPackingList2T01.AsFloat);
              SendNumber(f, 8, xPackingList2T02.AsFloat);
              SendNumber(f, 9, xPackingList2T03.AsFloat);
              SendNumber(f, 10, xPackingList2T04.AsFloat);
              SendNumber(f, 11, xPackingList2T05.AsFloat);
              SendNumber(f, 12, xPackingList2T06.AsFloat);
              SendNumber(f, 13, xPackingList2T07.AsFloat);
              SendNumber(f, 14, xPackingList2T08.AsFloat);
              SendNumber(f, 15, Suma2);

              xPackingList2.Next;

              if NumPed2 <> xPackingList2Pedido.AsString then
              begin
                 Inc(f);
                 SetBold(HCalc, f, 4, f, 15);
                 SetFontSize(HCalc, f, 4, f, 15, 7);
                 // SetBackgroundcolor(HCalc, f, 4, f, 15, clSilver);

                 CellText[f, 4] := 'TOTAL PEDIDO';
                 CellText[f, 5] := '';
                 CellText[f, 6] := '';
                 CellText[f, 7] := '';
                 CellText[f, 8] := '';
                 CellText[f, 9] := '';
                 CellText[f, 10] := '';
                 CellText[f, 11] := '';
                 CellText[f, 12] := '';
                 CellText[f, 13] := '';
                 CellText[f, 14] := '';
                 SendNumber(f, 15, Suma3);
                 // Range['E' + IntToStr(Filas), 'O' + IntToStr(Filas)].Mergecells := True;
                 // Range['E' + IntToStr(Filas), 'O' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

                 Suma3 := 0;
                 NumPed2 := xPackingList2Pedido.AsString;

                 // Dejo un alinea en blanco despues de total
                 Inc(f);
              end;
           end;

           DMMain.Log('Totales');
           if (xPackingList2.EOF) and (xPackingList2Pedido.AsString <> '') then
           begin
              Inc(f);
              SetBold(HCalc, f, 4, f, 15);
              SetFontSize(HCalc, f, 4, f, 15, 7);
              // SetBackgroundcolor(HCalc, f, 5, f, 16, clSilver);

              CellText[f, 4] := 'TOTAL PEDIDO';
              CellText[f, 5] := '';
              CellText[f, 6] := '';
              CellText[f, 7] := '';
              CellText[f, 8] := '';
              CellText[f, 9] := '';
              CellText[f, 10] := '';
              CellText[f, 11] := '';
              CellText[f, 12] := '';
              CellText[f, 13] := '';
              CellText[f, 14] := '';
              SendNumber(f, 15, Suma3);
              // Range['E' + IntToStr(Filas), 'O' + IntToStr(Filas)].Mergecells := True;
              // Range['E' + IntToStr(Filas), 'O' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

              // Dejo un alinea en blanco despues de total
              Inc(f);
           end;

           Inc(f);
           SetBold(HCalc, f, 4, f, 15);
           SetFontSize(HCalc, f, 4, f, 15, 7);
           // SetBackgroundcolor(HCalc, f, 5, f, 16, clSilver);

           CellText[f, 4] := 'TOTAL';
           CellText[f, 5] := '';
           CellText[f, 6] := '';
           CellText[f, 7] := '';
           CellText[f, 8] := '';
           CellText[f, 9] := '';
           CellText[f, 10] := '';
           CellText[f, 11] := '';
           CellText[f, 12] := '';
           CellText[f, 13] := '';
           CellText[f, 14] := '';
           SendNumber(f, 15, Suma4);
           // Range['E' + IntToStr(Filas), 'O' + IntToStr(Filas)].Mergecells := True;
           // Range['E' + IntToStr(Filas3), 'O' + IntToStr(Filas)].HorizontalAlignment := xlVAlignCenter;

           NumberFormat(Format('%s%d:%s%d', ['F', MarcaFila, 'F', f]), '###000');
           NumberFormat(Format('%s%d:%s%d', ['G', MarcaFila, 'N', f]), '#');

           // SaveDoc;
           DMMain.Log('SaveDocAs');
           SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
        finally
           Sleep(1000);
           Free;
        end;
     end;
  finally
     DMMain.LogFin(Format('ExportarPackingList(%s)', [Archivo]));
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.AbrirPackingList;
begin
  with xPackingList do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QAgrupacionAlbaranesSeleccionEMPRESA.AsInteger;
     Params.ByName['CANAL'].AsInteger := QAgrupacionAlbaranesSeleccionCANAL.AsInteger;
     Params.ByName['TIPO'].AsString := QAgrupacionAlbaranesSeleccionTIPO.AsString;
     Params.ByName['ID_S_AG'].AsInteger := QAgrupacionAlbaranesSeleccionID_S_AG.AsInteger;
     Open;
  end;

  with xPackingList2 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QAgrupacionAlbaranesSeleccionEMPRESA.AsInteger;
     Params.ByName['CANAL'].AsInteger := QAgrupacionAlbaranesSeleccionCANAL.AsInteger;
     Params.ByName['TIPO'].AsString := QAgrupacionAlbaranesSeleccionTIPO.AsString;
     Params.ByName['ID_S_AG'].AsInteger := QAgrupacionAlbaranesSeleccionID_S_AG.AsInteger;
     Open;
  end;

  // Obtengo SU_PROVEEDOR del cliente para la exportacion a Excel
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 C.SU_PROVEEDOR ');
        SQL.Add(' FROM GES_CABECERAS_S_AGRUP_DET AD ');
        SQL.Add(' JOIN GES_CABECERAS_S_AGRUP AC ON AD.ID_S_AG = AC.ID_S_AG ');
        SQL.Add(' JOIN GES_CABECERAS_S A ON AD.ID_S = A.ID_S ');
        SQL.Add(' JOIN EMP_CLIENTES C ON A.EMPRESA = C.EMPRESA AND A.CLIENTE = C.CLIENTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' AC.EMPRESA = :EMPRESA AND ');
        SQL.Add(' AC.CANAL = :CANAL AND ');
        SQL.Add(' AC.TIPO = :TIPO AND ');
        SQL.Add(' AC.TAREA_10 = 1 AND ');
        SQL.Add(' C.SU_PROVEEDOR > '' '' ');
        SQL.Add(' ORDER BY AD.ID_S_AG ');
        Params.ByName['EMPRESA'].AsInteger := QAgrupacionAlbaranesSeleccionEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QAgrupacionAlbaranesSeleccionCANAL.AsInteger;
        Params.ByName['TIPO'].AsString := QAgrupacionAlbaranesSeleccionTIPO.AsString;
        ExecQuery;
        SuProveedor := FieldByName['SU_PROVEEDOR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgrupacionDeAlbaranesKri.QAgrupacionAlbaranesSeleccionAfterOpen(DataSet: TDataSet);
begin
  AbrirPackingList;
end;

procedure TDMAgrupacionDeAlbaranesKri.QAgrupacionAlbaranesSeleccionAfterPost(DataSet: TDataSet);
begin
  AbrirPackingList;
end;

procedure TDMAgrupacionDeAlbaranesKri.QMCartaPortesTransportistaBeforeClose(DataSet: TDataSet);
begin
  QMCartaPortesAlbaranes.Close;
end;

procedure TDMAgrupacionDeAlbaranesKri.frxListadoGetValue(const VarName: string; var Value: variant);
begin
  frListadoGetValue(VarName, Value);
end;

procedure TDMAgrupacionDeAlbaranesKri.EportarCSV(Palets: integer; NroProveedor, Separador: string);
var
  Archivo : string;
  Ubicacion : string;
  Lineas : TStrings;
  s : string;
  i : integer;
begin
  inherited;
  {
  Ejemplo según El Corte Ingles.

  Proveedor;Empresa Recepción;Lugar Recepción;Empresa Destino;Lugar destino;Uneco;Pedido;Albarán;Bultos;Embalaje;Transportista;Expedición
  XXXXXX;1;50;1;6;106;12345678;1234567;1;b;Agencia;0
  XXXXXX;1;50;1;11;106;12345679;2345678;1;b;Agencia;B03258
  XXXXXX;1;50;1;3;106;12345680;3456789;1;b;9;
  ;;;;;;;;;;TOTAL LINEAS;3
  ;;;;;;;;;;TOTAL PALETS;5
  }
  NroProveedor := Trim(NroProveedor);
  Archivo := '';
  Archivo := LeeDatoIni('AgrupacionDeAlbaranes', 'UltimaNombreFicheroExportacionECI', REntorno.NombreEmpresa + '_' + NroProveedor);
  Ubicacion := LeeDatoIni('AgrupacionDeAlbaranes', 'UltimaRutaFicheroExportacionECI', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if (MySaveDialog(Archivo, 'CSV,ALL', Ubicacion)) then
  begin
     EscribeDatoIni('AgrupacionDeAlbaranes', 'UltimaRutaFicheroExportacionECI', ExtractFilePath(Archivo));
     Lineas := TStringList.Create;
     try
        s := '';
        s := s + 'Proveedor' + Separador;
        s := s + 'Empresa Recepción' + Separador;
        s := s + 'Lugar Recepción' + Separador;
        s := s + 'Empresa Destino' + Separador;
        s := s + 'Lugar destino' + Separador;
        s := s + 'Uneco' + Separador;
        s := s + 'Pedido' + Separador;
        s := s + 'Albarán' + Separador;
        s := s + 'Bultos' + Separador;
        s := s + 'Embalaje' + Separador;
        s := s + 'Transportista' + Separador;
        s := s + 'Expedición';
        Lineas.Add(s);
        i := 0;
        QCabecerasAlbaran.First;
        while (not QCabecerasAlbaran.EOF) do
        begin
           if (QCabecerasAlbaranENTRADA_AGRUP.AsInteger = REntorno.Entrada) then
           begin
              Inc(i);
              s := '';
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT ');
                    SQL.Add('        CAST(''' + NroProveedor + ''' AS INTEGER) PROV, -- ');
                    SQL.Add('        CAST(''1'' AS INTEGER) EMP_RECEP, -- ');
                    SQL.Add('        C.DIRECCION LUGAR_RECEP, -- ');
                    SQL.Add('        CAST(''1'' AS INTEGER) EMP_DEST, -- ');
                    SQL.Add('        D.DIRECCION LUGAR_DEST, -- ');
                    SQL.Add('        CASE C.SERIE ');
                    SQL.Add('          WHEN ''C2C'' THEN ');
                    SQL.Add('              108 ');
                    SQL.Add('          WHEN ''C2R'' THEN ');
                    SQL.Add('              108 ');
                    SQL.Add('          WHEN ''CIC'' THEN ');
                    SQL.Add('              98 ');
                    SQL.Add('          WHEN ''CIR'' THEN ');
                    SQL.Add('              98 ');
                    SQL.Add('          WHEN ''UNI'' THEN ');
                    SQL.Add('              108 ');
                    SQL.Add('          WHEN ''UNT'' THEN ');
                    SQL.Add('              108 ');
                    SQL.Add('          ELSE 0 ');
                    SQL.Add('        END UNECO, ');
                    SQL.Add('        -- ');
                    SQL.Add('        CAST(C.SU_REFERENCIA AS INTEGER) PEDIDO, -- REFERENCIA COMO INTEGER ');
                    SQL.Add('        -- ');
                    SQL.Add('        CASE C.SERIE ');
                    SQL.Add('          WHEN ''C2C'' THEN ');
                    SQL.Add('              -- 108 ');
                    SQL.Add('              CAST(''1'' || RIG AS INTEGER) ');
                    SQL.Add('          WHEN ''C2R'' THEN ');
                    SQL.Add('              -- 108 ');
                    SQL.Add('              CAST(''2'' || RIG AS INTEGER) ');
                    SQL.Add('          WHEN ''CIC'' THEN ');
                    SQL.Add('              -- 98 ');
                    SQL.Add('              CAST(''3'' || RIG AS INTEGER) ');
                    SQL.Add('          WHEN ''CIR'' THEN ');
                    SQL.Add('              -- 98 ');
                    SQL.Add('              CAST(''4'' || RIG AS INTEGER) ');
                    SQL.Add('          WHEN ''UNI'' THEN ');
                    SQL.Add('              -- 108 ');
                    SQL.Add('              CAST(''5'' || RIG AS INTEGER) ');
                    SQL.Add('          WHEN ''UNT'' THEN ');
                    SQL.Add('              -- 108 ');
                    SQL.Add('              CAST(''6'' || RIG AS INTEGER) ');
                    SQL.Add('          ELSE CAST(''0'' || RIG AS INTEGER) ');
                    SQL.Add('        END ALBARAN, ');
                    SQL.Add('        -- ');
                    SQL.Add('        A.BULTOS_KRI BULTOS, -- CAB.BULTOS ');
                    SQL.Add('        CAST(''b'' AS VARCHAR(10)) EMBALAJE, -- ');
                    SQL.Add('        CAST(''9'' AS INTEGER) TRANSP, -- ');
                    SQL.Add('        CAST('''' AS VARCHAR(10)) EXPEDICION ');
                    SQL.Add(' FROM GES_CABECERAS_S C ');
                    SQL.Add(' JOIN GES_CABECERAS_S_ALB A ON C.ID_S = A.ID_S ');
                    SQL.Add(' JOIN EDI_ALB_CAB E ON C.EMPRESA = E.EMPRESA AND C.EJERCICIO = E.EJERCICIO AND C.CANAL = E.CANAL AND C.SERIE = E.SERIE AND C.RIG = E.RIG ');
                    SQL.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO AND D.CODIGO_EDI = E.COMPRADOR ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' C.ID_S = :ID_S ');
                    Params.ByName['ID_S'].AsInteger := QCabecerasAlbaranID_S.AsInteger;
                    ExecQuery;
                    s := s + FieldByName['PROV'].AsString + Separador;
                    s := s + FieldByName['EMP_RECEP'].AsString + Separador;
                    s := s + FieldByName['LUGAR_RECEP'].AsString + Separador;
                    s := s + FieldByName['EMP_DEST'].AsString + Separador;
                    s := s + FieldByName['LUGAR_DEST'].AsString + Separador;
                    s := s + FieldByName['UNECO'].AsString + Separador;
                    s := s + FieldByName['PEDIDO'].AsString + Separador;
                    s := s + FieldByName['ALBARAN'].AsString + Separador;
                    s := s + FieldByName['BULTOS'].AsString + Separador;
                    s := s + FieldByName['EMBALAJE'].AsString + Separador;
                    s := s + FieldByName['TRANSP'].AsString + Separador;
                    s := s + FieldByName['EXPEDICION'].AsString;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Lineas.Add(s);
           end;

           QCabecerasAlbaran.Next;
        end;
        QCabecerasAlbaran.First;

        Lineas.Add(Separador + Separador + Separador + Separador + Separador + Separador + Separador + Separador + Separador + Separador + 'TOTAL LINEAS' + Separador + IntToStr(i));
        Lineas.Add(Separador + Separador + Separador + Separador + Separador + Separador + Separador + Separador + Separador + Separador + 'TOTAL PALETS' + Separador + IntToStr(Palets));
        Lineas.SaveToFile(Archivo);
     finally
        Lineas.Free;
     end;
  end;
end;

end.
