unit UDMPreparacionReserva;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, frxClass, frxHYReport,
  FIBDataSet;

type
  TDMPreparacionReserva = class(TDataModule)
     frListado: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     DSCabecera: TDataSource;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     frDBDetalle: TfrDBDataSet;
     DSQMDetalle: TDataSource;
     QMDetalle: TFIBDataSetRO;
     frDBLoteCabecera: TfrDBDataSet;
     DSQMLoteCabecera: TDataSource;
     QMLoteCabecera: TFIBDataSetRO;
     frDBLoteDetalle: TfrDBDataSet;
     DSQMLoteDetalle: TDataSource;
     QMLoteDetalle: TFIBDataSetRO;
     frxListado: TfrxHYReport;
     DSComponente: TDataSource;
     xComponente: TFIBDataSetRO;
     xEmpleadoUltimaMod: TFIBDataSetRO;
     DSxEmpleadoOP: TDataSource;
     frDBxEmpleadoOP: TfrDBDataSet;
     xEmpleadoResponsable: TFIBDataSetRO;
     DSxEmpleadoResp: TDataSource;
     frDBxEmpleadoResp: TfrDBDataSet;
     DSxCompuesto: TDataSource;
     xCompuesto: TFIBDataSetRO;
     xLoteProveedor: TFIBDataSetRO;
     DSxLoteProveedor: TDataSource;
     frDBxLoteProveedor: TfrDBDataSet;
     xMaquinasTareasOP: TFIBDataSetRO;
     frDBxMaquinasTareasOP: TfrDBDataSet;
     DSxMaquinasTareasOP: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure frListadoEnterRect(Memo: TStringList; View: TfrView);
     procedure frxListadoGetValue(const VarName: string; var Value: variant);
     procedure frxListadoBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListadoPreparacion(Modo: byte; IdReserva: integer);
     procedure MostrarListadoReserva(Modo: byte; IdReserva: integer);
     procedure MostrarListadoEtiqueta(Modo: byte; IdReserva, Copias: integer);
  end;

var
  DMPreparacionReserva : TDMPreparacionReserva;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest;

{$R *.dfm}

procedure TDMPreparacionReserva.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMPreparacionReserva.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMPreparacionReserva.MostrarListadoPreparacion(Modo: byte; IdReserva: integer);
var
  Serie, Titulo : string;
  Grupo : integer;
  Listado : smallint;
begin
  Grupo := 2010;
  REntorno.Grupo := 2010;
  Listado := 0;

  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIES, MAT.RIG_OF, MAT.SUBORDEN, MAT.LINEA_MAT, MAT.ALMACEN, ');
     SelectSQL.Add('        MAT.COMPONENTE, MAT.ORDEN, MAT.UNIDADES_NEC, UNIDADES_UTIL, MAT.PORCENTAJE, MAT.LINEA_FASE, MAT.PRE_COS_UNI, ');
     SelectSQL.Add('        MAT.TOTAL_VAR, MAT.PRECIO_FIJO, MAT.TOTAL, MAT.PRODUCCION, MAT.MATESC, MAT.ENTRADA, ID_ORDEN, MAT.ID_ORDEN_MAT, ');
     SelectSQL.Add('        RES.UNIDADES AS UNIDADES_FAB, MAT.UNIDADES_STOCK, MAT.PRE_COS_UNI_REAL, MAT.ID_MOV_STOCK, MAT.UNIDADES_PREV, ');
     SelectSQL.Add('        PRECIO_FIJO_REAL, MAT.TOTAL_VAR_REAL, MAT.TOTAL_REAL, MAT.NOTAS_MAT, MAT.MEDIDAS, MAT.TIPO_PIEZA, MAT.NUM_PIEZAS, ');
     SelectSQL.Add('        MAT.ID_MOV_STOCK_B, ID_MOV_STOCK_C, MAT.UNIDAD_ART, MAT.UNIDAD_FAB, MAT.ID_EQUIVAL, MAT.COMPRAR, ');
     SelectSQL.Add('        MAT.PROVEEDOR_COMPRA, MAT.MOV_STOCK_COMPRA, MAT.ID_A, MAT.UDS_COMPRA, RESERVA_STOCK, MAT.N_MOV_STOCK, ');
     SelectSQL.Add('        MAT.MINI_NOTA, MAT.RESULTADO_FORMULA, MAT.FORMULA, MAT.DESACTIVA_TRIGGER, MAT.DES_ALTO, MAT.DES_ANCHO, ');
     SelectSQL.Add('        DES_GRUESO, MAT.ESTADO, MAT.LINEA_TAREA, MAT.ID_DETALLES_ST, MAT.MERMA, MAT.UNIDADES_DEVOLVER, ALMACEN_DEVOLVER, ');
     SelectSQL.Add('        MAT.N_MOV_STOCK_RESERVA, MAT.ALMACEN_SAL, ALM.CTROL_UBICACION, ART.UBICABLE, ART.LOTES, ART.CONTROL_STOCK, ');
     SelectSQL.Add('        ART.TITULO_LARGO AS TITULO, MAT.ID_LOTE ID_LOTE_MAT, MAT.LOTE LOTE_MAT, MAT.ID_UBICACION, RES.LINEA_RES, RES.ID_RESERVA_MAT, ');
     SelectSQL.Add('        RES.UNIDADES_ENVIAR, RES.PREPARADO, ');
     SelectSQL.Add('        (SELECT FIRST 1 ID_LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES ');
     SelectSQL.Add('         ORDER BY ID_LOTE) ID_LOTE, ');
     SelectSQL.Add('        (SELECT FIRST 1 LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES ');
     SelectSQL.Add('         ORDER BY ID_LOTE) LOTE, ');
     SelectSQL.Add('        (SELECT COUNT(ID_LOTE) ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES) CANT_LOTE, ');
     SelectSQL.Add('         R.ESTADO ESTADO_RESERVA ');
     SelectSQL.Add(' FROM PRO_ORD_MAT MAT ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD_MAT_RESERVA RES ON (MAT.ID_ORDEN_MAT = RES.ID_ORDEN_MAT /*AND RES.LINEA_RES = :LINEA_RES*/) ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD_RESERVA R ON (RES.ID_RESERVA = R.ID_RESERVA) ');
     SelectSQL.Add(' LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = MAT.EMPRESA AND ALM.ALMACEN = MAT.ALMACEN) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = MAT.EMPRESA AND ART.ARTICULO = MAT.COMPONENTE) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' R.ID_RESERVA = :ID_RESERVA ');
     SelectSQL.Add(' ORDER BY MAT.ORDEN, MAT.LINEA_FASE, MAT.LINEA_MAT ');
     Params.ByName['ID_RESERVA'].AsInteger := IdReserva;

     // Open; Se abrira cuando se abra la cabecera
  end;

  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT COMP.*, RES.UNIDADES UNIDADES_RES, RES.LINEA_RES, ART.SERIALIZADO, ART.SERIALIZADO_KRI, ');
     SelectSQL.Add('        ART.UBICABLE, ART.LOTES, RES.ID_RESERVA, RES.ID_LOTE ID_LOTE_RESERVA, RES.FECHA AS FECHA_RESERVA, ');
     SelectSQL.Add('        (SELECT COUNT(*) ');
     SelectSQL.Add('         FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN = COMP.ID_ORDEN/* AND ');
     SelectSQL.Add('         LINEA_RES <> RES.LINEA_RES*/) CANT_RESERVAS, ');
     SelectSQL.Add('        (SELECT SUM(UNIDADES) ');
     SelectSQL.Add('         FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN = COMP.ID_ORDEN/* AND ');
     SelectSQL.Add('         LINEA_RES <> RES.LINEA_RES*/) UNIDADES_RESERVAS, ');
     SelectSQL.Add('        (SELECT FIRST 1 CAB.RIG ');
     SelectSQL.Add('         FROM PRO_ORD_TAREA TA ');
     SelectSQL.Add('         JOIN PRO_ORD_TAREA_TEX TE ');
     SelectSQL.Add('         ON (TA.EMPRESA = TE.EMPRESA AND TA.EJERCICIO = TE.EJERCICIO AND TA.CANAL = TE.CANAL AND TA.SERIE = TE.SERIE AND TA.RIG_OF = TE.RIG_OF AND TA.LINEA_FASE = TE.LINEA_FASE AND TA.LINEA_TAREA = TE.LINEA_TAREA) ');
     SelectSQL.Add('         JOIN GES_CABECERAS_E_PED CAB ON (CAB.ID_E = TE.ID_E_PEDIDO) ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         TA.ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('         TA.RECURSO = ''T1'' ');
     SelectSQL.Add('         ORDER BY TA.LINEA_TAREA DESC) RIG_PEDIDO_PROVEEDOR, ');
     SelectSQL.Add('        (SELECT PRO.PROVEEDOR ');
     SelectSQL.Add('         FROM ART_ALMACENES ALM ');
     SelectSQL.Add('         JOIN SYS_TERCEROS TER ON (ALM.TERCERO = TER.TERCERO) ');
     SelectSQL.Add('         JOIN EMP_PROVEEDORES PRO ON (PRO.TERCERO = TER.TERCERO) ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         PRO.EMPRESA = COMP.EMPRESA AND ');
     SelectSQL.Add('         ALM.EMPRESA = COMP.EMPRESA AND ');
     SelectSQL.Add('         ALM.ALMACEN = (SELECT FIRST 1 POM.ALMACEN ');
     SelectSQL.Add('                        FROM PRO_ORD_TAREA POT ');
     SelectSQL.Add('                        JOIN PRO_ORD_MAT POM ON (POT.ID_ORDEN = POM.ID_ORDEN AND POT.LINEA_FASE = POM.LINEA_FASE) ');
     SelectSQL.Add('                        WHERE ');
     SelectSQL.Add('                        POT.ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('                        POT.RECURSO = ''T1'' ');
     SelectSQL.Add('                        ORDER BY POT.LINEA_TAREA DESC)) PROVEEDOR ');
     SelectSQL.Add(' FROM PRO_ORD_RESERVA RES ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD COMP ON (COMP.ID_ORDEN = RES.ID_ORDEN /*AND RES.LINEA_RES = :LINEA_RES*/) ');
     SelectSQL.Add(' LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = COMP.EMPRESA AND ALM.ALMACEN = COMP.ALMACEN_SAL) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = COMP.EMPRESA AND ART.ARTICULO = COMP.COMPUESTO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' RES.ID_RESERVA = :ID_RESERVA ');
     Params.ByName['ID_RESERVA'].AsInteger := IdReserva;
     Open;
  end;

  REntorno.Copias := 1;
  Serie := '';
  if (Modo = 0) then
     REntorno.Copias := 1;

  Titulo := _('Preparacion') + '_' + IntToStr(IdReserva);
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frListado, frxListado, nil);
end;

procedure TDMPreparacionReserva.MostrarListadoReserva(Modo: byte; IdReserva: integer);
var
  Serie, Titulo : string;
  Grupo : integer;
  Listado : smallint;
begin
  Grupo := 2011;
  REntorno.Grupo := 2011;
  Listado := 0;

  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIES, MAT.RIG_OF, MAT.SUBORDEN, MAT.LINEA_MAT, MAT.ALMACEN, ');
     SelectSQL.Add('        MAT.COMPONENTE, MAT.ORDEN, MAT.UNIDADES_NEC, UNIDADES_UTIL, MAT.PORCENTAJE, MAT.LINEA_FASE, MAT.PRE_COS_UNI, ');
     SelectSQL.Add('        MAT.TOTAL_VAR, MAT.PRECIO_FIJO, MAT.TOTAL, MAT.PRODUCCION, MAT.MATESC, MAT.ENTRADA, ID_ORDEN, MAT.ID_ORDEN_MAT, ');
     SelectSQL.Add('        RES.UNIDADES AS UNIDADES_FAB, MAT.UNIDADES_STOCK, MAT.PRE_COS_UNI_REAL, MAT.ID_MOV_STOCK, MAT.UNIDADES_PREV, ');
     SelectSQL.Add('        PRECIO_FIJO_REAL, MAT.TOTAL_VAR_REAL, MAT.TOTAL_REAL, MAT.NOTAS_MAT, MAT.MEDIDAS, MAT.TIPO_PIEZA, MAT.NUM_PIEZAS, ');
     SelectSQL.Add('        MAT.ID_MOV_STOCK_B, ID_MOV_STOCK_C, MAT.UNIDAD_ART, MAT.UNIDAD_FAB, MAT.ID_EQUIVAL, MAT.COMPRAR, ');
     SelectSQL.Add('        MAT.PROVEEDOR_COMPRA, MAT.MOV_STOCK_COMPRA, MAT.ID_A, MAT.UDS_COMPRA, RESERVA_STOCK, MAT.N_MOV_STOCK, ');
     SelectSQL.Add('        MAT.MINI_NOTA, MAT.RESULTADO_FORMULA, MAT.FORMULA, MAT.DESACTIVA_TRIGGER, MAT.DES_ALTO, MAT.DES_ANCHO, ');
     SelectSQL.Add('        DES_GRUESO, MAT.ESTADO, MAT.LINEA_TAREA, MAT.ID_DETALLES_ST, MAT.MERMA, MAT.UNIDADES_DEVOLVER, ALMACEN_DEVOLVER, ');
     SelectSQL.Add('        MAT.N_MOV_STOCK_RESERVA, MAT.ALMACEN_SAL, ALM.CTROL_UBICACION, ART.UBICABLE, ART.LOTES, ART.CONTROL_STOCK, ');
     SelectSQL.Add('        ART.TITULO_LARGO AS TITULO, MAT.ID_LOTE ID_LOTE_MAT, MAT.LOTE LOTE_MAT, MAT.ID_UBICACION, RES.LINEA_RES, RES.ID_RESERVA_MAT, ');
     SelectSQL.Add('        RES.UNIDADES_ENVIAR, RES.PREPARADO, ');
     SelectSQL.Add('        (SELECT FIRST 1 ID_LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES ');
     SelectSQL.Add('         ORDER BY ID_LOTE) ID_LOTE, ');
     SelectSQL.Add('        (SELECT FIRST 1 LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES ');
     SelectSQL.Add('         ORDER BY ID_LOTE) LOTE, ');
     SelectSQL.Add('        (SELECT COUNT(ID_LOTE) ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES) CANT_LOTE, ');
     SelectSQL.Add('         R.ESTADO ESTADO_RESERVA ');
     SelectSQL.Add(' FROM PRO_ORD_MAT MAT ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD_MAT_RESERVA RES ON (MAT.ID_ORDEN_MAT = RES.ID_ORDEN_MAT /*AND RES.LINEA_RES = :LINEA_RES*/) ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD_RESERVA R ON (RES.ID_RESERVA = R.ID_RESERVA) ');
     SelectSQL.Add(' LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = MAT.EMPRESA AND ALM.ALMACEN = MAT.ALMACEN) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = MAT.EMPRESA AND ART.ARTICULO = MAT.COMPONENTE) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' R.ID_RESERVA = :ID_RESERVA ');
     SelectSQL.Add(' ORDER BY MAT.ORDEN, MAT.LINEA_FASE, MAT.LINEA_MAT ');
     Params.ByName['ID_RESERVA'].AsInteger := IdReserva;

     // Open; Se abrira cuando se abra la cabecera
  end;

  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT COMP.*, RES.UNIDADES UNIDADES_RES, RES.LINEA_RES, ART.SERIALIZADO, ART.SERIALIZADO_KRI, ART.UBICABLE, ART.LOTES, ');
     SelectSQL.Add(' RES.ID_RESERVA, RES.ID_LOTE ID_LOTE_RESERVA, RES.FECHA FECHA_RESERVA, ');
     SelectSQL.Add(' (SELECT COUNT(*) ');
     SelectSQL.Add('  FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  ID_ORDEN = COMP.ID_ORDEN) CANT_RESERVAS, ');
     SelectSQL.Add(' (SELECT SUM(UNIDADES) ');
     SelectSQL.Add('  FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  ID_ORDEN = COMP.ID_ORDEN) UNIDADES_RESERVAS, ');
     SelectSQL.Add(' (SELECT FIRST 1 CAB.RIG ');
     SelectSQL.Add('  FROM PRO_ORD_TAREA TA ');
     SelectSQL.Add('  JOIN PRO_ORD_TAREA_TEX TE ');
     SelectSQL.Add('  ON (TA.EMPRESA = TE.EMPRESA AND TA.EJERCICIO = TE.EJERCICIO AND TA.CANAL = TE.CANAL AND TA.SERIE = TE.SERIE AND TA.RIG_OF = TE.RIG_OF AND TA.LINEA_FASE = TE.LINEA_FASE AND TA.LINEA_TAREA = TE.LINEA_TAREA) ');
     SelectSQL.Add('  JOIN GES_CABECERAS_E_PED CAB ON (CAB.ID_E = TE.ID_E_PEDIDO) ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  TA.ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('  TA.RECURSO = ''T1'' ');
     SelectSQL.Add('  ORDER BY TA.LINEA_TAREA DESC) RIG_PEDIDO_PROVEEDOR, ');
     SelectSQL.Add(' (SELECT FIRST 1 TAREA ');
     SelectSQL.Add('  FROM PRO_ORD_TAREA ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('  RECURSO = ''T1'' ');
     SelectSQL.Add('  ORDER BY LINEA_TAREA DESC) TAREA, ');
     SelectSQL.Add(' (SELECT PRO.PROVEEDOR ');
     SelectSQL.Add('  FROM ART_ALMACENES ALM ');
     SelectSQL.Add('  JOIN SYS_TERCEROS TER ON (ALM.TERCERO = TER.TERCERO) ');
     SelectSQL.Add('  JOIN EMP_PROVEEDORES PRO ON (PRO.TERCERO = TER.TERCERO) ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  PRO.EMPRESA = COMP.EMPRESA AND  ');
     SelectSQL.Add('  ALM.EMPRESA = COMP.EMPRESA AND ');
     SelectSQL.Add('  ALM.ALMACEN = (SELECT FIRST 1 POM.ALMACEN ');
     SelectSQL.Add('                 FROM PRO_ORD_TAREA POT ');
     SelectSQL.Add('                 JOIN PRO_ORD_MAT POM ON (POT.ID_ORDEN = POM.ID_ORDEN AND POT.LINEA_FASE = POM.LINEA_FASE) ');
     SelectSQL.Add('                 WHERE ');
     SelectSQL.Add('                 POT.ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('                 POT.RECURSO = ''T1'' ');
     SelectSQL.Add('                 ORDER BY POT.LINEA_TAREA DESC)) PROVEEDOR ');
     SelectSQL.Add(' FROM PRO_ORD_RESERVA RES ');
     SelectSQL.Add(' JOIN PRO_ORD COMP ON (COMP.ID_ORDEN = RES.ID_ORDEN) ');
     SelectSQL.Add(' /* JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = COMP.EMPRESA AND ALM.ALMACEN = COMP.ALMACEN_SAL) */ ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON (ART.EMPRESA = COMP.EMPRESA AND ART.ARTICULO = COMP.COMPUESTO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' RES.ID_RESERVA = :ID_RESERVA ');

     Params.ByName['ID_RESERVA'].AsInteger := IdReserva;
     Open;
  end;

  REntorno.Copias := 1;
  Serie := '';
  if (Modo = 0) then
     REntorno.Copias := 1;

  Titulo := _('Preparacion') + '_' + IntToStr(IdReserva);
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frListado, frxListado, nil);
end;

procedure TDMPreparacionReserva.MostrarListadoEtiqueta(Modo: byte; IdReserva, Copias: integer);
var
  Serie, Titulo : string;
  Grupo : integer;
  Listado : smallint;
begin
  Grupo := 2013;
  REntorno.Grupo := 2013;
  Listado := 0;

  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIES, MAT.RIG_OF, MAT.SUBORDEN, MAT.LINEA_MAT, MAT.ALMACEN, ');
     SelectSQL.Add('        MAT.COMPONENTE, MAT.ORDEN, MAT.UNIDADES_NEC, UNIDADES_UTIL, MAT.PORCENTAJE, MAT.LINEA_FASE, MAT.PRE_COS_UNI, ');
     SelectSQL.Add('        MAT.TOTAL_VAR, MAT.PRECIO_FIJO, MAT.TOTAL, MAT.PRODUCCION, MAT.MATESC, MAT.ENTRADA, ID_ORDEN, MAT.ID_ORDEN_MAT, ');
     SelectSQL.Add('        RES.UNIDADES AS UNIDADES_FAB, MAT.UNIDADES_STOCK, MAT.PRE_COS_UNI_REAL, MAT.ID_MOV_STOCK, MAT.UNIDADES_PREV, ');
     SelectSQL.Add('        PRECIO_FIJO_REAL, MAT.TOTAL_VAR_REAL, MAT.TOTAL_REAL, MAT.NOTAS_MAT, MAT.MEDIDAS, MAT.TIPO_PIEZA, MAT.NUM_PIEZAS, ');
     SelectSQL.Add('        MAT.ID_MOV_STOCK_B, ID_MOV_STOCK_C, MAT.UNIDAD_ART, MAT.UNIDAD_FAB, MAT.ID_EQUIVAL, MAT.COMPRAR, ');
     SelectSQL.Add('        MAT.PROVEEDOR_COMPRA, MAT.MOV_STOCK_COMPRA, MAT.ID_A, MAT.UDS_COMPRA, RESERVA_STOCK, MAT.N_MOV_STOCK, ');
     SelectSQL.Add('        MAT.MINI_NOTA, MAT.RESULTADO_FORMULA, MAT.FORMULA, MAT.DESACTIVA_TRIGGER, MAT.DES_ALTO, MAT.DES_ANCHO, ');
     SelectSQL.Add('        DES_GRUESO, MAT.ESTADO, MAT.LINEA_TAREA, MAT.ID_DETALLES_ST, MAT.MERMA, MAT.UNIDADES_DEVOLVER, ALMACEN_DEVOLVER, ');
     SelectSQL.Add('        MAT.N_MOV_STOCK_RESERVA, MAT.ALMACEN_SAL, ALM.CTROL_UBICACION, ART.UBICABLE, ART.LOTES, ART.CONTROL_STOCK, ');
     SelectSQL.Add('        ART.TITULO_LARGO AS TITULO, MAT.ID_LOTE ID_LOTE_MAT, MAT.LOTE LOTE_MAT, MAT.ID_UBICACION, RES.LINEA_RES, RES.ID_RESERVA_MAT, ');
     SelectSQL.Add('        RES.UNIDADES_ENVIAR, RES.PREPARADO, ');
     SelectSQL.Add('        (SELECT FIRST 1 ID_LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES ');
     SelectSQL.Add('         ORDER BY ID_LOTE) ID_LOTE, ');
     SelectSQL.Add('        (SELECT FIRST 1 LOTE ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES ');
     SelectSQL.Add('         ORDER BY ID_LOTE) LOTE, ');
     SelectSQL.Add('        (SELECT COUNT(ID_LOTE) ');
     SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND ');
     SelectSQL.Add('         LINEA_RES = RES.LINEA_RES) CANT_LOTE, ');
     SelectSQL.Add('         R.ESTADO ESTADO_RESERVA ');
     SelectSQL.Add(' FROM PRO_ORD_MAT MAT ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD_MAT_RESERVA RES ON (MAT.ID_ORDEN_MAT = RES.ID_ORDEN_MAT /*AND RES.LINEA_RES = :LINEA_RES*/) ');
     SelectSQL.Add(' LEFT JOIN PRO_ORD_RESERVA R ON (RES.ID_RESERVA = R.ID_RESERVA) ');
     SelectSQL.Add(' LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = MAT.EMPRESA AND ALM.ALMACEN = MAT.ALMACEN) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = MAT.EMPRESA AND ART.ARTICULO = MAT.COMPONENTE) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' R.ID_RESERVA = :ID_RESERVA ');
     SelectSQL.Add(' ORDER BY MAT.ORDEN, MAT.LINEA_FASE, MAT.LINEA_MAT ');
     Params.ByName['ID_RESERVA'].AsInteger := IdReserva;

     // Open; Se abrira cuando se abra la cabecera
  end;

  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT COMP.*, RES.UNIDADES UNIDADES_RES, RES.LINEA_RES, ART.SERIALIZADO, ART.SERIALIZADO_KRI, ART.UBICABLE, ART.LOTES, ');
     SelectSQL.Add(' RES.ID_RESERVA, RES.ID_LOTE ID_LOTE_RESERVA, RES.FECHA FECHA_RESERVA, ');
     SelectSQL.Add(' (SELECT COUNT(*) ');
     SelectSQL.Add('  FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  ID_ORDEN = COMP.ID_ORDEN) CANT_RESERVAS, ');
     SelectSQL.Add(' (SELECT SUM(UNIDADES) ');
     SelectSQL.Add('  FROM PRO_ORD_RESERVA ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  ID_ORDEN = COMP.ID_ORDEN) UNIDADES_RESERVAS, ');
     SelectSQL.Add(' (SELECT FIRST 1 CAB.RIG ');
     SelectSQL.Add('  FROM PRO_ORD_TAREA TA ');
     SelectSQL.Add('  JOIN PRO_ORD_TAREA_TEX TE ');
     SelectSQL.Add('  ON (TA.EMPRESA = TE.EMPRESA AND TA.EJERCICIO = TE.EJERCICIO AND TA.CANAL = TE.CANAL AND TA.SERIE = TE.SERIE AND TA.RIG_OF = TE.RIG_OF AND TA.LINEA_FASE = TE.LINEA_FASE AND TA.LINEA_TAREA = TE.LINEA_TAREA) ');
     SelectSQL.Add('  JOIN GES_CABECERAS_E_PED CAB ON (CAB.ID_E = TE.ID_E_PEDIDO) ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  TA.ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('  TA.RECURSO = ''T1'' ');
     SelectSQL.Add('  ORDER BY TA.LINEA_TAREA DESC) RIG_PEDIDO_PROVEEDOR, ');
     SelectSQL.Add(' (SELECT FIRST 1 TAREA ');
     SelectSQL.Add('  FROM PRO_ORD_TAREA ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('  RECURSO = ''T1'' ');
     SelectSQL.Add('  ORDER BY LINEA_TAREA DESC) TAREA, ');
     SelectSQL.Add(' (SELECT PRO.PROVEEDOR ');
     SelectSQL.Add('  FROM ART_ALMACENES ALM ');
     SelectSQL.Add('  JOIN SYS_TERCEROS TER ON (ALM.TERCERO = TER.TERCERO) ');
     SelectSQL.Add('  JOIN EMP_PROVEEDORES PRO ON (PRO.TERCERO = TER.TERCERO) ');
     SelectSQL.Add('  WHERE ');
     SelectSQL.Add('  PRO.EMPRESA = COMP.EMPRESA AND ');
     SelectSQL.Add('  ALM.EMPRESA = COMP.EMPRESA AND ');
     SelectSQL.Add('  ALM.ALMACEN = (SELECT FIRST 1 POM.ALMACEN ');
     SelectSQL.Add('                 FROM PRO_ORD_TAREA POT ');
     SelectSQL.Add('                 JOIN PRO_ORD_MAT POM ON (POT.ID_ORDEN = POM.ID_ORDEN AND POT.LINEA_FASE = POM.LINEA_FASE) ');
     SelectSQL.Add('                 WHERE ');
     SelectSQL.Add('                 POT.ID_ORDEN = COMP.ID_ORDEN AND ');
     SelectSQL.Add('                 POT.RECURSO = ''T1'' ');
     SelectSQL.Add('                 ORDER BY POT.LINEA_TAREA DESC)) PROVEEDOR ');
     SelectSQL.Add(' FROM PRO_ORD_RESERVA RES ');
     SelectSQL.Add(' JOIN PRO_ORD COMP ON (COMP.ID_ORDEN = RES.ID_ORDEN) ');
     SelectSQL.Add(' /* JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = COMP.EMPRESA AND ALM.ALMACEN = COMP.ALMACEN_SAL) */ ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON (ART.EMPRESA = COMP.EMPRESA AND ART.ARTICULO = COMP.COMPUESTO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' RES.ID_RESERVA = :ID_RESERVA ');

     Params.ByName['ID_RESERVA'].AsInteger := IdReserva;
     Open;
  end;

  REntorno.Copias := Copias;
  Serie := '';
  if (Modo = 0) then
     REntorno.Copias := 1;

  Titulo := _('Preparacion') + '_' + IntToStr(IdReserva);
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frListado, frxListado, nil);
end;

procedure TDMPreparacionReserva.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  QMLoteCabecera.Open;
  xCompuesto.Open;
  xEmpleadoUltimaMod.Open;
  xEmpleadoResponsable.Open;
  xMaquinasTareasOP.Open;
end;

procedure TDMPreparacionReserva.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMLoteCabecera.Close;
  xCompuesto.Close;
  xEmpleadoUltimaMod.Close;
  xEmpleadoResponsable.Close;
  xMaquinasTareasOP.Close;
end;

procedure TDMPreparacionReserva.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QMLoteDetalle.Open;
  xComponente.Open;
  xLoteProveedor.Open;
end;

procedure TDMPreparacionReserva.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QMLoteDetalle.Close;
  xComponente.Close;
  xLoteProveedor.Close;
end;

procedure TDMPreparacionReserva.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMPreparacionReserva.frListadoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMPreparacionReserva.frxListadoGetValue(const VarName: string; var Value: variant);
begin
  frListadoGetValue(VarName, Value);
end;

procedure TDMPreparacionReserva.frxListadoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

end.
