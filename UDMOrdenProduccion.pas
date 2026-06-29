unit UDMOrdenProduccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMOrdenProduccion = class(TDataModule)
     TLocal: THYTransaction;
     DSxSeries: TDataSource;
     DSxArticulos: TDataSource;
     QMOrdenProd: TFIBTableSet;
     DSQMOrdenProd: TDataSource;
     DSxMaterial: TDataSource;
     DSxEstados: TDataSource;
     DSxAlmacenes: TDataSource;
     xSeries: TFIBDataSetRO;
     xArticulos: TFIBDataSetRO;
     xMaterial: TFIBDataSetRO;
     xEstados: TFIBDataSetRO;
     xAlmacenes: TFIBDataSetRO;
     xLotes: TFIBDataSetRO;
     QMOrdenProd_lotes: TFIBTableSet;
     DSQMOrdenProd_lotes: TDataSource;
     QMOrdenProd_lotesEMPRESA: TIntegerField;
     QMOrdenProd_lotesEJERCICIO: TIntegerField;
     QMOrdenProd_lotesCANAL: TIntegerField;
     QMOrdenProd_lotesTIPO: TFIBStringField;
     QMOrdenProd_lotesNORDEN: TIntegerField;
     QMOrdenProd_lotesN_SERIE: TFIBStringField;
     QMOrdenProd_lotesCLASIFICACION: TFIBStringField;
     QMOrdenProd_lotesF_FABRICACION: TDateTimeField;
     QMOrdenProd_lotesF_ENVASADO: TDateTimeField;
     QMOrdenProd_lotesF_CADUCIDAD: TDateTimeField;
     QMOrdenProd_lotesCANTIDAD: TFloatField;
     QMOrdenProd_lotesARTICULO: TFIBStringField;
     QMOrdenProd_lotesALMACEN: TFIBStringField;
     QMOrdenProd_lotesLINEA: TIntegerField;
     QMProcesos: TFIBTableSet;
     DSProcesos: TDataSource;
     QMProcesosEMPRESA: TIntegerField;
     QMProcesosEJERCICIO: TIntegerField;
     QMProcesosCANAL: TIntegerField;
     QMProcesosNORDEN: TIntegerField;
     QMProcesosPROCESO: TIntegerField;
     QMProcesosOPERARIO: TIntegerField;
     QMProcesosDURACION: TFloatField;
     QMProcesosORDEN: TIntegerField;
     QMProcesosTITULO: TFIBStringField;
     QMProcesosTITULO_OPERARIO: TFIBStringField;
     QMOrdenProdEMPRESA: TIntegerField;
     QMOrdenProdEJERCICIO: TIntegerField;
     QMOrdenProdCANAL: TIntegerField;
     QMOrdenProdNORDEN: TIntegerField;
     QMOrdenProdESTADO: TIntegerField;
     QMOrdenProdSERIE: TFIBStringField;
     QMOrdenProdPEDIDO: TIntegerField;
     QMOrdenProdLINEA: TIntegerField;
     QMOrdenProdARTICULO: TFIBStringField;
     QMOrdenProdUNIDADES: TFloatField;
     QMOrdenProdALMACEN: TFIBStringField;
     QMOrdenProdESCANDALLO: TIntegerField;
     QMOrdenProdPRIORIDAD: TIntegerField;
     QMOrdenProdP_MERMA: TFloatField;
     QMOrdenProdCANT_ORDENADA: TFloatField;
     QMOrdenProdCANT_ESPERADA: TFloatField;
     QMOrdenProdCANT_FINAL: TFloatField;
     QMOrdenProdFECHA_ENTREGA: TDateTimeField;
     QMOrdenProdFECHA_INICIO: TDateTimeField;
     QMOrdenProdFECHA_INICIO_PROD: TDateTimeField;
     QMOrdenProdMATERIAL: TIntegerField;
     QMOrdenProdFECHA_ORDEN: TDateTimeField;
     QMOrdenProdTERCERO_OPERARIO: TIntegerField;
     QMOrdenProdNOTAS: TBlobField;
     QMProcesosPRECIO: TFloatField;
     QMOrdenProdFECHA_CIERRE: TDateTimeField;
     QMProcesosDURACION_INICIAL: TIntegerField;
     QMProcesosPRECIO_INICIAL: TIntegerField;
     QMOrdenProd_lotesID_A: TIntegerField;
     QMOrdenProd_lotesLOTE: TFIBStringField;
     QMOrdenProd_lotesPROVEEDOR: TIntegerField;
     QMOrdenProd_lotesID_LOTE: TIntegerField;
     xOrdenProdLotesMat: TFIBDataSetRO;
     DSxOrdenProdLotesMat: TDataSource;
     xOrdenProdLotesMatLOTE: TFIBStringField;
     xOrdenProdLotesMatSERIE: TFIBStringField;
     xOrdenProdLotesMatARTICULO: TFIBStringField;
     xOrdenProdLotesMatALMACEN: TFIBStringField;
     xOrdenProdLotesMatCLASIFICACION: TFIBStringField;
     xOrdenProdLotesMatF_FABRICACION: TDateTimeField;
     xOrdenProdLotesMatF_ENVASADO: TDateTimeField;
     xOrdenProdLotesMatF_CADUCIDAD: TDateTimeField;
     xOrdenProdLotesMatCANTIDAD: TFloatField;
     TUpdate: THYTransaction;
     procedure DMOrdenProduccionCreate(Sender: TObject);
     procedure QMOrdenProdAfterOpen(DataSet: TDataSet);
     procedure QMOrdenProdSERIEChange(Sender: TField);
     procedure QMOrdenProdARTICULOChange(Sender: TField);
     procedure QMOrdenProdMATERIALChange(Sender: TField);
     procedure QMOrdenProdPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMOrdenProdBeforePost(DataSet: TDataSet);
     procedure QMOrdenProdNewRecord(DataSet: TDataSet);
     procedure QMOrdenProdESTADOChange(Sender: TField);
     procedure QMOrdenProdLINEAChange(Sender: TField);
     procedure QMOrdenProdALMACENChange(Sender: TField);
     procedure QMOrdenProdUNIDADESChange(Sender: TField);
     procedure DMOrdenProduccionDestroy(Sender: TObject);
     procedure QMOrdenProdFECHA_ENTREGAChange(Sender: TField);
     procedure QMOrdenProdFECHA_INICIO_PRODChange(Sender: TField);
     procedure QMOrdenProdFECHA_INICIOChange(Sender: TField);
     procedure QMProcesosBeforePost(DataSet: TDataSet);
     procedure QMProcesosOPERARIOChange(Sender: TField);
     procedure QMProcesosPROCESOChange(Sender: TField);
     procedure QMProcesosNewRecord(DataSet: TDataSet);
     procedure QMOrdenProd_lotesAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     procedure ProponerDistribucionLotes(Empresa, Ejercicio, Canal, Orden, Linea: integer);
  public
     { Public declarations }
     Serie: string;
     procedure BusquedaCompleja;
     function DameOrden: integer;
     procedure LanzaOrden;
     procedure CerrarOrden(Tipo: string; Cantidad: real);
     procedure AbrirOrden;
     procedure DeslanzarOrden;
     function FechaInicioProd(Modo: integer): TDateTime;
     procedure ModificaFecha(Fecha: TDateTime);
     function Infolotes(linea: integer; cantidad: real; modo: smallint): boolean;
     procedure Limpialote;
     procedure FiltrarLotes(Norden: integer);
     procedure BorraTemporales;
  end;

var
  DMOrdenProduccion : TDMOrdenProduccion;

implementation

uses UDMMain, UFBusca, UEntorno, UUtiles, UFMIntroduceLotes, UFMLotesMateriales, UDameDato;

{$R *.DFM}

procedure TDMOrdenProduccion.DMOrdenProduccionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Ponemos las máscaras
  QMOrdenProdUNIDADES.DisplayFormat := MascaraI;
  QMOrdenProdP_MERMA.DisplayFormat := MascaraP;
  QMOrdenProdCANT_ORDENADA.DisplayFormat := MascaraI;
  QMOrdenProdCANT_ESPERADA.DisplayFormat := MascaraI;
  QMOrdenProdCANT_FINAL.DisplayFormat := MascaraI;
  QMProcesosDURACION.DisplayFormat := ',##0.##';
  QMProcesosPRECIO.DisplayFormat := MascaraE;
  QMProcesosDURACION_INICIAL.DisplayFormat := ',##0.##';
  QMProcesosPRECIO_INICIAL.DisplayFormat := MascaraE;

  // Abrimos la tabla maestra
  DMMain.FiltraTabla(QMOrdenProd, '11100', True);
end;

procedure TDMOrdenProduccion.BusquedaCompleja;
begin
  // Llamada al buscador
  TFBusca.Create(Self).SeleccionaBusqueda(QMOrdenProd, '10100', True); {dji lrk kri - para que salgan de ejercicios anteriores}
end;

procedure TDMOrdenProduccion.QMOrdenProdAfterOpen(DataSet: TDataSet);
begin
  // Abrimos las tablas hijas
  xSeries.Open;
  xArticulos.Open;
  xMaterial.Open;
  xEstados.Open;
  xAlmacenes.Open;
  QMPRocesos.Open;
end;

procedure TDMOrdenProduccion.QMOrdenProdSERIEChange(Sender: TField);
begin
  // Cambio título de la serie
  with xSeries do
  begin
     Close;
     Open;
  end;
end;

procedure TDMOrdenProduccion.QMOrdenProdARTICULOChange(Sender: TField);
begin
  // Cambio título artículo
  with xArticulos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMOrdenProduccion.QMOrdenProdMATERIALChange(Sender: TField);
begin
  // Cambio título tipo del material
  with xMaterial do
  begin
     Close;
     Open;
  end;
end;

procedure TDMOrdenProduccion.QMOrdenProdPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMOrdenProd.State = dsInsert then
     QMOrdenProdNORDEN.Clear;
end;

procedure TDMOrdenProduccion.QMOrdenProdBeforePost(DataSet: TDataSet);
begin
  // Llamada al contador
  if (DataSet.State = dsInsert) then
     {QMOrdenProdNORDEN.AsInteger := DameContador('OPR'); dji lrk kri}
     QMOrdenProdNORDEN.AsInteger := DMMain.Contador_EECS(QMOrdenProdSERIE.AsString, 'OPK');
end;

procedure TDMOrdenProduccion.QMOrdenProdNewRecord(DataSet: TDataSet);
begin
  // Inicializamos los campos
  QMOrdenProdEMPRESA.AsInteger := REntorno.Empresa;
  QMOrdenProdEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMOrdenProdCANAL.AsInteger := REntorno.Canal;
  QMOrdenProdSERIE.AsString := Serie;
  QMOrdenProdESTADO.AsInteger := 0;
  QMOrdenProdUNIDADES.AsFloat := 1;
  QMOrdenProdPRIORIDAD.AsInteger := 0;
  QMOrdenProdFECHA_ENTREGA.AsDateTime := REntorno.FechaTrab;
  QMOrdenProdFECHA_INICIO.AsDateTime := REntorno.FechaTrab;
  QMOrdenProdFECHA_INICIO_PROD.AsDateTime := REntorno.FechaTrab;
  QMOrdenProdFECHA_ORDEN.AsDateTime := REntorno.FechaTrabSH;
  QMOrdenProdFECHA_CIERRE.AsDateTime := REntorno.FechaTrabSH;
  QMOrdenProdMATERIAL.AsInteger := 1;
  QMOrdenProdP_MERMA.AsFloat := 0;
  QMOrdenProdCANT_ORDENADA.AsFloat := 1;
  QMOrdenProdCANT_ESPERADA.AsFloat := 1;
  QMOrdenProdCANT_FINAL.AsFloat := 0;
  QMOrdenProdTERCERO_OPERARIO.AsInteger := REntorno.Tercero;
end;

procedure TDMOrdenProduccion.QMOrdenProdESTADOChange(Sender: TField);
begin
  // Cambio de Título del estado
  with xEstados do
  begin
     Close;
     Open;
  end;
end;

procedure TDMOrdenProduccion.QMOrdenProdLINEAChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  // Obtenemos el artículo y unidades de la línea de pedido asociada
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ARTICULO, UNIDADES, ALMACEN FROM GES_DETALLES_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO AND ');
        SQL.Add(' CANAL=?CANAL AND ');
        SQL.Add(' SERIE=?SERIE AND ');
        SQL.Add(' TIPO=''PEC'' AND ');
        SQL.Add(' RIG=?RIG AND ');
        SQL.Add(' LINEA=?LINEA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
        Params.ByName['RIG'].AsInteger := QMOrdenProdPEDIDO.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMOrdenProdLINEA.AsInteger;
        ExecQuery;
        QMOrdenProdARTICULO.AsString := FieldByName['ARTICULO'].AsString;
        QMOrdenProdUNIDADES.AsFloat := FieldByName['UNIDADES'].AsFloat;
        QMOrdenProdALMACEN.AsString := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMOrdenProduccion.DameOrden: integer;
begin
  Result := QMOrdenProdNORDEN.AsInteger;
end;

procedure TDMOrdenProduccion.QMOrdenProdALMACENChange(Sender: TField);
begin
  // Cambio del título del almacén
  with xAlmacenes do
  begin
     Close;
     Open;
  end;
end;

procedure TDMOrdenProduccion.LanzaOrden;
var
  DS : TFIBDataSet;
  Stock : double;
  Errores : TStrings;
  Q : THYFIBQuery;
begin
  // Antes de lanzar la orden verifico que hay stock de los componentes

  DMMain.Log(Format('LanzaOrden %d', [QMOrdenProdNORDEN.AsInteger]));
  Errores := TStringList.Create;
  try
     // Recorro el detalle del escandallo asociado a la orden
     // Solo los que controlan stock y no permiten stock negativo
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT E.DETALLE, E.TITULO, E.CANTIDAD / O.UNIDADES AS CANTIDAD FROM ART_ARTICULOS_ESC_ORDEN_DETALLE E ');
              SelectSQL.Add(' JOIN ART_ARTICULOS_ESC_ORDEN O ');
              SelectSQL.Add(' ON ');
              SelectSQL.Add(' E.EMPRESA = O.EMPRESA AND ');
              SelectSQL.Add(' E.EJERCICIO = O.EJERCICIO AND ');
              SelectSQL.Add(' E.CANAL = O.CANAL AND ');
              SelectSQL.Add(' E.SERIE = O.SERIE AND ');
              SelectSQL.Add(' E.ORDEN = O.ORDEN ');
              SelectSQL.Add(' LEFT JOIN ART_ARTICULOS A ');
              SelectSQL.Add(' ON E.EMPRESA = A.EMPRESA AND E.DETALLE = A.ARTICULO ');
              SelectSQL.Add(' JOIN CON_CUENTAS_GES_FAM F ');
              SelectSQL.Add(' ON E.EMPRESA = F.EMPRESA AND E.EJERCICIO = F.EJERCICIO AND E.CANAL = F.CANAL AND A.FAMILIA = F.FAMILIA ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' E.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' E.EJERCICIO = :EJERCICIO AND ');
              SelectSQL.Add(' E.CANAL = :CANAL AND ');
              SelectSQL.Add(' E.SERIE = :SERIE AND ');
              SelectSQL.Add(' E.ORDEN = :ORDEN AND ');
              SelectSQL.Add(' A.CONTROL_STOCK = 1 AND ');
              SelectSQL.Add(' F.VENTA = 0 ');
              SelectSQL.Add(' ORDER BY E.LINEA ');

              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
              Params.ByName['ORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;

              Open;
              while not EOF do
              begin
                 // Verifico stock de componente
                 Stock := DMMain.DameStockArticulo(QMOrdenProdEMPRESA.AsInteger, QMOrdenProdCANAL.AsInteger, DS.FieldByName('DETALLE').AsString, QMOrdenProdALMACEN.AsString);
                 if (Stock < (QMOrdenProdUNIDADES.AsFloat * DS.FieldByName('CANTIDAD').AsFloat)) then
                    Errores.Add(Format(_('No hay stock suficiente del artículo %s'), [DS.FieldByName('DETALLE').AsString]));
                 DMMain.Log(Format('Articulo: %s - Stock: %s - Unidades: %s - Cantidad: %s', [DS.FieldByName('DETALLE').AsString, FloatToStr(Stock), QMOrdenProdUNIDADES.AsString, DS.FieldByName('CANTIDAD').AsString]));
                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     // Si hay componentes bajo stock informo con un mensaje
     if (Errores.Count > 0) then
     begin
        ShowMessage(Errores.Text);
        DMMain.Log('Errores');
        DMMain.Log(Errores.Text);
     end
     else
     begin
        // Lanzamos la orden de producción
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE A_ART_LANZA_ORDEN(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ORDEN, ?FECHA, ?ENTRADA)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
              Params.ByName['ORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
              Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              ExecQuery;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;

        QMOrdenProd.Refresh;
     end;
  finally
     Errores.Free;
  end;
end;

procedure TDMOrdenProduccion.CerrarOrden(Tipo: string; Cantidad: real);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_CIERRA_ORDEN(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ORDEN, ?CANTIDAD, ?TIPO, ?ENTRADA, ?FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMOrdenProdEJERCICIO.AsInteger; {REntorno.Ejercicio; dji lrk kri - muestro del ejercicio ant. tmabien}
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
        Params.ByName['ORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
        Params.ByName['CANTIDAD'].AsFloat := Cantidad;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMOrdenProd.Refresh;
end;

procedure TDMOrdenProduccion.QMOrdenProdUNIDADESChange(Sender: TField);
begin
  // Será la cantidad ordenada
  QMOrdenProdCANT_ORDENADA.AsFloat := QMOrdenProdUNIDADES.AsFloat;
  QMOrdenProdCANT_ESPERADA.AsFloat := QMOrdenProdUNIDADES.AsFloat;
end;

procedure TDMOrdenProduccion.AbrirOrden;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_ABRE_ORDEN (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ORDEN)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
        Params.ByName['ORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMOrdenProd.Refresh;
end;

procedure TDMOrdenProduccion.DeslanzarOrden;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_DESLANZA_ORDEN (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ORDEN)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
        Params.ByName['ORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMOrdenProd.Refresh;
end;

procedure TDMOrdenProduccion.DMOrdenProduccionDestroy(Sender: TObject);
begin
  Application.ProcessMessages;
end;

function TDMOrdenProduccion.FechaInicioProd(Modo: integer): TDateTime;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE A_ART_CALCULA_FECHA_INICIO_PROD ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?ORDEN, ?ARTICULO, ');
        SQL.Add(' ?CANT_ORDENADA, ?ESCANDALLO, ?FECHA_ENTREGA, ?MODO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
        Params.ByName['ORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMOrdenProdARTICULO.AsString;
        Params.ByName['CANT_ORDENADA'].AsFloat := QMOrdenProdCANT_ORDENADA.AsFloat;
        Params.ByName['ESCANDALLO'].AsInteger := QMOrdenProdESCANDALLO.AsInteger;
        Params.ByName['FECHA_ENTREGA'].AsDateTime := QMOrdenProdFECHA_ENTREGA.AsDateTime;
        Params.ByName['MODO'].AsInteger := Modo;
        ExecQuery;
        Result := FieldByName['FECHA_PROD'].AsDateTime;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMOrdenProduccion.QMOrdenProdFECHA_ENTREGAChange(Sender: TField);
begin
  if (QMOrdenProd.State = dsInsert) then
     QMOrdenProdFECHA_INICIO_PROD.AsDateTime := FechaInicioProd(0)
  else
     QMOrdenProdFECHA_INICIO_PROD.AsDateTime := FechaInicioProd(1);
end;

procedure TDMOrdenProduccion.ModificaFecha(Fecha: TDateTime);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE ART_ORDENES_PRODUCCION ');
        SQL.Add(' SET ');
        SQL.Add(' FECHA_INICIO_PROD=?FECHA_INICIO_PROD ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO AND ');
        SQL.Add(' CANAL=?CANAL AND ');
        SQL.Add(' SERIE=?SERIE AND ');
        SQL.Add(' NORDEN=?ORDEN ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
        Params.ByName['ORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
        Params.ByName['FECHA_INICIO_PROD'].AsDateTime := Fecha;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMOrdenProd.Refresh;

  if (QMOrdenProdFECHA_INICIO_PROD.AsDateTime < QMOrdenProdFECHA_INICIO.AsDateTime) then
     ShowMessage(_('El tiempo de producción del artículo es superior al acotado entre las fechas de inicio y entrega'));
end;

procedure TDMOrdenProduccion.QMOrdenProdFECHA_INICIO_PRODChange(Sender: TField);
begin
  if (Sender.AsDateTime < QMOrdenProdFECHA_INICIO.AsDateTime) then
     ShowMessage(_('El tiempo de producción del artículo es superior al acotado entre las fechas de inicio y entrega'));
end;

procedure TDMOrdenProduccion.QMOrdenProdFECHA_INICIOChange(Sender: TField);
begin
  if (Sender.AsDateTime < QMOrdenProdFECHA_INICIO_PROD.AsDateTime) then
     ShowMessage(_('El tiempo de producción del artículo es superior al acotado entre las fechas de inicio y entrega'));
end;

function TDMOrdenProduccion.Infolotes(Linea: integer; Cantidad: real; Modo: smallint): boolean;
var
  id_a, Proveedor : integer;
  IdLote : integer;
  Q : THYFIBQuery;
begin
  Result := True;
  if (ArticuloLoteable(QMOrdenProdARTICULO.AsString)) then
  begin
     Result := False;
     if (Linea < 1) then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT MAX(LINEA) FROM TMP_ART_ORDENES_PROD_LOTES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA=?EMPRESA AND ');
              SQL.Add(' EJERCICIO=?EJERCICIO AND ');
              SQL.Add(' CANAL=?CANAL AND ');
              SQL.Add(' NORDEN=?NORDEN ');

              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['NORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
              ExecQuery;
              Linea := FieldByName['MAX'].AsInteger;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
        if (Linea < 1) then
           Linea := 1
        else
           Linea := Linea + 1;

        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MIN(PROVEEDOR) FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND TERCERO = ?TERCERO';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TERCERO'].AsInteger := REntorno.Tercero;
              ExecQuery;
              Proveedor := FieldByName['MIN'].AsInteger;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end
     else
     begin
        Linea := QMOrdenProd_lotesLINEA.AsInteger;
        Cantidad := QMOrdenProd_lotesCANTIDAD.AsFloat;
        Proveedor := QMOrdenProd_lotesPROVEEDOR.AsInteger;
     end;

     id_a := DameIDArticulo(QMOrdenProdARTICULO.AsString);

     // if QMOrdenProd_lotes.RecordCount > 0 then
     if ((Linea > 0) and (Cantidad > 0)) then
     begin
        IdLote := TFMIntroduceLotes.Create(Self).AsignaArticulo('PRO', QMOrdenProdSERIE.AsString,
           QMOrdenProdARTICULO.AsString, QMOrdenProdEJERCICIO.AsInteger,
           QMOrdenProdNORDEN.AsInteger,
           Linea, Cantidad, QMOrdenProdALMACEN.AsString,
           QMOrdenProdALMACEN.AsString, QMOrdenProdCANAL.AsInteger,
           QMOrdenProdCANAL.AsInteger,
           {(QMOrdenProdESTADO.AsInteger < 3)}(Modo = 0), id_a, 0, Proveedor, True);

        if ((IdLote <> 0) and (Modo = 0)) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO TMP_ART_ORDENES_PROD_LOTES ( ');
                 SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, NORDEN, LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, F_CADUCIDAD, ');
                 SQL.Add('  CANTIDAD, ARTICULO, ALMACEN, LINEA, ID_A, PROVEEDOR, ID_LOTE) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :NORDEN, :LOTE, :N_SERIE, :CLASIFICACION, :F_FABRICACION, :F_ENVASADO, ');
                 SQL.Add('  :F_CADUCIDAD, :CANTIDAD, :ARTICULO, :ALMACEN, :LINEA, :ID_A, :PROVEEDOR, :ID_LOTE) ');
                 Params.ByName['EMPRESA'].AsInteger := QMOrdenProdEMPRESA.AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := QMOrdenProdEJERCICIO.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMOrdenProdCANAL.AsInteger;
                 Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
                 Params.ByName['TIPO'].AsString := 'PRO';
                 Params.ByName['NORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
                 Params.ByName['LOTE'].AsString := DameLote(IdLote);
                 // Params.ByName['N_SERIE'].AsString := ;
                 // Params.ByName['CLASIFICACION'].AsString := ;
                 // Params.ByName['F_FABRICACION'].AsInteger := ;
                 // Params.ByName['F_ENVASADO'].AsInteger := ;
                 // Params.ByName['F_CADUCIDAD'].AsInteger := ;
                 Params.ByName['CANTIDAD'].AsFloat := Cantidad;
                 Params.ByName['ARTICULO'].AsString := QMOrdenProdARTICULO.AsString;
                 Params.ByName['ALMACEN'].AsString := QMOrdenProdALMACEN.AsString;
                 Params.ByName['LINEA'].AsInteger := Linea;
                 Params.ByName['ID_A'].AsInteger := 0;
                 Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                 Params.ByName['ID_LOTE'].AsInteger := IdLote;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           ProponerDistribucionLotes(QMOrdenProdEMPRESA.AsInteger, QMOrdenProdEJERCICIO.AsInteger,
              QMOrdenProdCANAL.AsInteger, QMOrdenProdNORDEN.AsInteger, Linea);

           Result := AsignarLotesMateriales(Self, QMOrdenProdNORDEN.AsInteger, Linea);
        end;
     end;
  end;
end;

procedure TDMOrdenProduccion.Limpialote;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM ART_ORDENES_PRODUCCION_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO AND ');
        SQL.Add(' CANAL=?CANAL AND ');
        SQL.Add(' NORDEN=?NORDEN ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMOrdenProduccion.FiltrarLotes(Norden: integer);
begin
  with QMOrdenProd_lotes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NORDEN'].AsInteger := Norden;
     Open;
  end;
end;

procedure TDMOrdenProduccion.QMProcesosBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if QMProcesos.State = dsInsert then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(ORDEN) FROM ART_ORDENES_PROD_PROCESOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA=?EMPRESA AND ');
           SQL.Add(' EJERCICIO=?EJERCICIO AND ');
           SQL.Add(' CANAL=?CANAL AND ');
           SQL.Add(' NORDEN=?NORDEN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['NORDEN'].AsInteger := QMOrdenProdNORDEN.AsInteger;
           ExecQuery;
           QMProcesosORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMOrdenProduccion.QMProcesosOPERARIOChange(Sender: TField);
begin
  QMPRocesosTITULO_OPERARIO.AsString := DameTituloTercero(Sender.AsInteger);
end;

procedure TDMOrdenProduccion.QMProcesosPROCESOChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TITULO, DURACION, PRECIO ');
        SQL.Add(' FROM EMP_PROCESOS_PRODUCCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND PROCESO=?PROCESO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROCESO'].AsInteger := Sender.AsInteger;
        ExecQuery;
        QMPRocesosTITULO.AsString := FieldByName['TITULO'].AsString;
        QMPRocesosDURACION_INICIAL.AsFloat := FieldByName['DURACION'].AsFloat;
        QMPRocesosPRECIO_INICIAL.AsFloat := FieldByName['PRECIO'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT OPERARIO FROM ART_ARTICULOS_ESC_PROCESOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND PROCESO=?PROCESO ');
        Params.ByName['EMPRESA'].AsInteger := QMOrdenProdEMPRESA.AsInteger;
        Params.ByName['PROCESO'].AsInteger := Sender.AsInteger;
        ExecQuery;
        QMPRocesosOPERARIO.AsInteger := FieldByName['OPERARIO'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMOrdenProduccion.QMProcesosNewRecord(DataSet: TDataSet);
begin
  QMProcesosEMPRESA.AsInteger := QMOrdenProdEMPRESA.AsInteger;
  QMProcesosEJERCICIO.AsInteger := QMOrdenProdEJERCICIO.AsInteger;
  QMProcesosCANAL.AsInteger := QMOrdenProdCANAL.AsInteger;
  QMProcesosNORDEN.AsInteger := QMOrdenProdNORDEN.AsInteger;
  QMProcesosPRECIO_INICIAL.AsInteger := 0;
  QMProcesosDURACION_INICIAL.AsInteger := 0;
end;

procedure TDMOrdenProduccion.QMOrdenProd_lotesAfterOpen(DataSet: TDataSet);
begin
  xOrdenProdLotesMat.Close;
  xOrdenProdLotesMat.Open;
end;

procedure TDMOrdenProduccion.BorraTemporales;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'delete from tmp_art_ordenes_prod_lotes where empresa=?empresa and ejercicio=?ejercicio and' +
        ' canal=?canal and norden=?norden';
     Params.ByName['EMPRESA'].AsInteger := QMOrdenProdEmpresa.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMOrdenProdEjercicio.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMOrdenProdCanal.AsInteger;
     Params.ByName['NORDEN'].AsInteger := QMOrdenProdNOrden.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMOrdenProduccion.ProponerDistribucionLotes(Empresa, Ejercicio, Canal, Orden, Linea: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_DITRIBUYE_LOTES(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ORDEN, :LINEA)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := QMOrdenProdSERIE.AsString;
        Params.ByName['ORDEN'].AsInteger := Orden;
        Params.ByName['LINEA'].AsInteger := Linea;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
