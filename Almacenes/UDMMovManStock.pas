unit UDMMovManStock;

{Todo: Borrar xArticulos}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport;

type
  TDMMovManStock = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     DSQMDetalle: TDataSource;
     xAlmacenOrig: TFIBDataSetRO;
     xAlmacenDst: TFIBDataSetRO;
     DSxAlmacenOrig: TDataSource;
     DSxAlmacenDst: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraTIPO_OPERACION: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraALMACEN_ORI: TFIBStringField;
     QMCabeceraCANAL_ORI: TIntegerField;
     QMCabeceraALMACEN_DST: TFIBStringField;
     QMCabeceraCANAL_DST: TIntegerField;
     QMCabeceraCOMENTARIO: TFIBStringField;
     QMCabeceraTIPO_VALORACION: TIntegerField;
     QMCabeceraENTRADA: TIntegerField;
     xArticulos: TFIBDataSetRO;
     QMDetalle: TFIBTableSet;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleVALOR: TFloatField;
     QMDetalleMOV_STOCK_A: TIntegerField;
     QMDetalleMOV_STOCK_B: TIntegerField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMDetallePRECIO_VENTA: TFloatField;
     QMDetalleORDEN_PRODUCCION: TFIBStringField;
     QMDetalleID_A: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMDetalleNSERIE: TFIBStringField;
     QMDetalleID_DETALLES_ST: TIntegerField;
     TUpdate: THYTransaction;
     QMDetalleID_C_A: TIntegerField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     QMDetalleID_UBICACION_E: TIntegerField;
     QMDetalleID_A_UBICACION_E: TIntegerField;
     QMDetalleCOMPOSICION_E: TFIBStringField;
     QMDetalleCALLE_E: TFIBStringField;
     QMDetalleESTANTERIA_E: TFIBStringField;
     QMDetalleREPISA_E: TFIBStringField;
     QMDetallePOSICION_E: TFIBStringField;
     QMDetalleID_UBICACION_S: TIntegerField;
     QMDetalleID_A_UBICACION_S: TIntegerField;
     QMDetalleCOMPOSICION_S: TFIBStringField;
     QMDetalleCALLE_S: TFIBStringField;
     QMDetalleESTANTERIA_S: TFIBStringField;
     QMDetalleREPISA_S: TFIBStringField;
     QMDetallePOSICION_S: TFIBStringField;
     QMDetalleTIT_UBICACION_E: TFIBStringField;
     QMDetalleTIT_UBICACION_S: TFIBStringField;
     QMCabeceraID_REG: TIntegerField;
     QMCabeceraDEPOSITO: TIntegerField;
     QMCabeceraDEFINITIVO: TIntegerField;
     QMCabeceraORIGEN: TFIBStringField;
     QMCabeceraID_ORIGEN: TIntegerField;
     QMDetalleTitulo_Lote_OP: TStringField;
     xTotales: TFIBDataSetRO;
     DSxTotales: TDataSource;
     xTotalesUNIDADES: TFloatField;
     xTotalesIMPORTE: TFloatField;
     QMCabeceraRIC: TIntegerField;
     xTotalesRIC: TIntegerField;
     QMCabeceraID_ST: TIntegerField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMDetalleCLASIFICACION: TStringField;
     QMDetalleCANT_LOTE: TFloatField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleSTOCK_ALM: TFloatField;
     QMDetalleSTOCK_ALM2: TFloatField;
     QMDetalleSTOCK_ALM3: TFloatField;
     QMDetalleLOTEABLE: TIntegerField;
     QMDetalleUBICABLE: TIntegerField;
     QMDetalleREF_PROVEEDOR: TFIBStringField;
     QMDetalleSTOCK_ORI: TFloatField;
     QMDetalleSTOCK_DST: TFloatField;
     procedure DMMovManStockCreate(Sender: TObject);
     procedure QMCabeceraALMACEN_ORIChange(Sender: TField);
     procedure QMCabeceraALMACEN_DSTChange(Sender: TField);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMDetalleID_LOTEChange(Sender: TField);
     procedure QMDetalleID_UBICACION_EChange(Sender: TField);
     procedure QMDetalleID_UBICACION_SChange(Sender: TField);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure UbicaDefecto;
     procedure QMCabeceraTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMCabeceraTIPO_OPERACIONChange(Sender: TField);
     procedure QMCabeceraBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
  private
     { Private declarations }
     Serie: string;
     SePuede: boolean;
     FAlmacenOriUbicable: boolean;
     FAlmacenDstUbicable: boolean;
     FUltimoArticulo: string;
     FArticuloUbicable: boolean;
     FArticuloLoteable: boolean;
     Param_MOVSTCK002: string;
     Param_MOVSTCK003: string;
     Param_MOVSTCK004: string;
     Param_MOVSTCK005: string;
     Param_MOVSTCK006: string;
     Param_MOVSTCK007: string;
     Param_MOVSTCK008: boolean;
     Param_MOVSTCK009: boolean;
     Param_ALBETIQ001: integer;
     AlmacenStock, AlmacenStock2, AlmacenStock3: string;
     StockAlm: TStrings;
     MostrarStockOri, MostrarStockDst: boolean;
     // procedure ArticulosUbicacion(Tipo: string); No se utiliza
     // procedure LanzaUbicacion; No se utiliza
     // function DameSentenciaSQL(modo: integer): string; No se utiliza
     function DameArticuloUbicable: boolean;
     function DameArticuloLoteable: boolean;
     procedure RefrescaDatosArticulo;
     procedure RefrescaTotales;
     procedure EnviarMensaje(u: integer; s, f: string);
  public
     { Public declarations }
     NotasLote: boolean; // Controla si se editan las notas del lote
     medida1, medida2, medida3, medida4, gprecio: double;
     // Recuperación de updates en u.ext
     gunidades: integer; // Idem
     NSerie: string;
     Tabla: string;
     procedure BusquedaCompleja;
     procedure CambiaUnidadesExt(Articulo: TField);
     procedure BorraLineaExt;
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure FiltraMovimiento(Empresa, Ejercicio, Rig: integer; aSerie: string);
     procedure InfoLotes;
     procedure DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
     function Serializado: boolean;
     procedure AbreCierra(Estado: integer);
     procedure PreparaSerializacion;
     procedure BusquedaArticulo(Descripcion: string);
     procedure VaciaNumSerie;
     function HayDetalle: boolean;
     procedure MuestraUbicacion(TipoMov: string);
     procedure listarCodBarras;
     procedure Continua;
     property ArticuloUbicable: boolean Read DameArticuloUbicable;
     property ArticuloLoteable: boolean Read DameArticuloLoteable;
     property AlmacenOriUbicable: boolean Read FAlmacenOriUbicable;
     property AlmacenDstUbicable: boolean Read FAlmacenDstUbicable;
     procedure Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste: double);
     procedure DameSqlImpresionEtiquetas(SQL: TStrings);
     procedure AsignaKit;
     procedure CambiaSerie(aSerie: string);
     procedure InsertaModelo(RefProveedor: string);
     procedure ReiniciaStock(Articulo: string = ''; Almacen: string = '');
     procedure MostrarStock(AlmOri, AlmDst: boolean);
     procedure RefrescarCabecera;
  end;

var
  DMMovManStock : TDMMovManStock;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFMUnidadesExtGesST, UFBusca, UFormGest, URecursos,
  UFMNumerosDeSerieMovKri, UFMNumerosDeSerieMOEKri, UFMNumerosDeSerieMOSKri,
  UFMLotesMOEKri, UFMLotesMOSKri, UFMLotesMOVKri,
  {UFMIntroduceLotes,} UFMMovStockUbicaciones, UDMLstEtiquetas, UFPregCodBarras, UFMAsignaLotes,
  UFMSeleccionKit, UParam, DateUtils, UDMLSTMovManStock, UDMListados;

{$R *.DFM}

procedure TDMMovManStock.DMMovManStockCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  StockAlm := TStringList.Create;

  Param_ALBETIQ001 := StrToIntDef(LeeParametro('ALBETIQ001'), 0);

  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  QMDetallePRECIO.DisplayFormat := MascaraE;
  QMDetalleUNIDADES.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_EXT.DisplayFormat := MascaraI;
  QMDetallePRECIO_VENTA.DisplayFormat := MascaraE;
  QMDetalleVALOR.DisplayFormat := MascaraE;

  AsignaDisplayFormat(xTotales, MascaraN, MascaraI, ShortDateFormat);
  xTotalesUNIDADES.DisplayFormat := MascaraI;
  xTotalesIMPORTE.DisplayFormat := MascaraE;

  NotasLote := False;
  FUltimoArticulo := '';

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
     QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  // Filtro pero no abro las tablas, porque por herencia (ZUDMMovManStock)
  // puede que se modifique el SQL
  // Después de crear el DM el FM llama al metodo CambiaSerie()
  DMMain.FiltraTabla(QMCabecera, '11000', False);
end;

procedure TDMMovManStock.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;

  StockAlm.Free;
end;

procedure TDMMovManStock.QMCabeceraALMACEN_ORIChange(Sender: TField);
begin
  // Posicionamos la tabla en su sitio para que nos muestre el título
  if ((Sender.DataSet.State = dsInsert) or (Sender.DataSet.State = dsEdit)) then
     with xAlmacenOrig do
     begin
        Close;
        Open;
     end;
end;

procedure TDMMovManStock.QMCabeceraALMACEN_DSTChange(Sender: TField);
begin
  // Posicionamos la tabla en su sitio para que nos muestre el título
  if ((Sender.DataSet.State = dsInsert) or (Sender.DataSet.State = dsEdit)) then
     with xAlmacenDst do
     begin
        Close;
        Open;
     end;
end;

procedure TDMMovManStock.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  // Abrimos todas sus tablas hijas
  QMDetalle.Open;
  xAlmacenOrig.Open;
  xAlmacenDst.Open;
  xTotales.Open;
end;

procedure TDMMovManStock.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  // Comprobamos que la fecha pertenece al ejercicio
  DMMain.ValidaFecha(REntorno.Empresa, REntorno.Ejercicio,
     QMCabeceraFECHA.AsDateTime);

  // Llamamos al contador
  if (DataSet.State = dsInsert) then
     QMCabeceraRIG.AsInteger := DMMain.Contador_EES(QMCabeceraSERIE.AsString, 'MAN');
end;

procedure TDMMovManStock.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  // Ponemos algunos valores por defecto
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  if (Serie <> '') then
     QMCabeceraSERIE.AsString := Serie
  else
     QMCabeceraSERIE.AsString := REntorno.Serie;
  QMCabeceraTIPO_VALORACION.AsInteger := 1;
  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraALMACEN_ORI.AsString := Param_MOVSTCK006;
  QMCabeceraALMACEN_DST.AsString := Param_MOVSTCK007;
  QMCabeceraCANAL_ORI.AsInteger := REntorno.Canal;
  QMCabeceraCANAL_DST.AsInteger := REntorno.Canal;

  QMCabeceraORIGEN.AsString := 'MAN';
  if (REntorno.Delegacion = 'S') then
     QMCabeceraTIPO_OPERACION.AsString := 'T'
  else
     QMCabeceraTIPO_OPERACION.AsString := Param_MOVSTCK005;

  // Hora para movimiento de tipo (2:Entrada; 3:Salida; 4:Traspaso)
  if ((QMCabeceraTIPO_OPERACION.AsString = 'E') and (Param_MOVSTCK002 <> '')) then
     QMCabeceraFECHA.AsDateTime := RecodeTime(QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK002, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK002, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK002, 7, 2), 0), 0);
  if ((QMCabeceraTIPO_OPERACION.AsString = 'S') and (Param_MOVSTCK003 <> '')) then
     QMCabeceraFECHA.AsDateTime := RecodeTime(QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK003, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK003, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK003, 7, 2), 0), 0);
  if ((QMCabeceraTIPO_OPERACION.AsString = 'T') and (Param_MOVSTCK004 <> '')) then
     QMCabeceraFECHA.AsDateTime := RecodeTime(QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK004, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK004, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK004, 7, 2), 0), 0);
end;

procedure TDMMovManStock.QMDetalleARTICULOChange(Sender: TField);
var
  Baja : boolean;
begin
  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  {
  if (QMCabeceraTIPO_OPERACION.AsString='T') then
     if (ArticuloUbicable(Sender.AsString)) then
        if (DMMain.CompruebaControlUbicacionAlmacen(QMCabeceraALMACEN_ORI.AsString) or
           DMMain.CompruebaControlUbicacionAlmacen(QMCabeceraALMACEN_DST.AsString)) then
           raise Exception.Create(_('No se pueden traspasar entre almacenes articulos ubicables.'+#13+#10+'Debe generar una salida y una entrada.'));
  if SePuede then
  begin
  }
  CambiaUnidadesExt(Sender);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_A, ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7, ALFA_8, BAJA  ');
        SQL.Add(' FROM ART_ARTICULOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Sender.AsString;
        ExecQuery;
        QMDetalleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
        QMDetalleALFA_1.AsString := FieldByName['ALFA_1'].AsString;
        QMDetalleALFA_2.AsString := FieldByName['ALFA_2'].AsString;
        QMDetalleALFA_3.AsString := FieldByName['ALFA_3'].AsString;
        QMDetalleALFA_4.AsString := FieldByName['ALFA_4'].AsString;
        QMDetalleALFA_5.AsString := FieldByName['ALFA_5'].AsString;
        QMDetalleALFA_6.AsString := FieldByName['ALFA_6'].AsString;
        QMDetalleALFA_7.AsString := FieldByName['ALFA_7'].AsString;
        QMDetalleALFA_8.AsString := FieldByName['ALFA_8'].AsString;
        Baja := (FieldByName['BAJA'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if Baja then
     raise Exception.Create(_('El articulo esta dado de baja'));

  // QMDetalleID_A.AsInteger := DMMain.DameIDArticulo(QMDetalleARTICULO.AsString);
  SePuede := False;
  {
  end;
  }
end;

procedure TDMMovManStock.QMDetalleNewRecord(DataSet: TDataSet);
begin
  // Antes de grabar el detalle, grabamos la cabeceras si no lo está ya
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMCabecera.Post;
     QMDetalle.Edit;
  end;

  // Ponemos los valores por defecto
  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMDetalleENTRADA.AsInteger := REntorno.Entrada;
  QMDetalleUNIDADES.AsInteger := 1;
  QMDetalleUNIDADES_EXT.AsInteger := 0;
  QMDetalleNSERIE.AsString := '';
  QMDetallePRECIO_VENTA.AsFloat := 0;
  QMDetalleCALLE_E.AsString := '000';
  QMDetalleESTANTERIA_E.AsString := '000';
  QMDetalleREPISA_E.AsString := '000';
  QMDetallePOSICION_E.AsString := '000';
  QMDetalleCALLE_S.AsString := '000';
  QMDetalleESTANTERIA_S.AsString := '000';
  QMDetalleREPISA_S.AsString := '000';
  QMDetallePOSICION_S.AsString := '000';
  QMDetalleID_A.AsInteger := 0;
  QMDetalleID_UBICACION_E.AsInteger := 0;
  QMDetalleID_UBICACION_S.AsInteger := 0;
  QMDetalleID_LOTE.AsInteger := 0;

  // Calculamos el número de la línea del movimiento
  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente('MOV', QMCabeceraID_ST.AsInteger);

  Tabla := '';
end;

procedure TDMMovManStock.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulos.Open;
end;

procedure TDMMovManStock.BusquedaCompleja;
begin
  // Llamada al buscador
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10000');
end;

procedure TDMMovManStock.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN_ORI.AsString;
end;

procedure TDMMovManStock.CambiaUnidadesExt(Articulo: TField);
var
  Serie, Almacen, TipoOper : string;
  Ejercicio, Rig, Linea, Estado, Canal : integer;
  Unidades, Precio : double;
  Articulo_Old : string;
begin
  Estado := 2;
  if (QMCabeceraESTADO.AsInteger <> 5) then
     if not (QMDetalle.State in [dsEdit, dsInsert]) then
        QMDetalle.Edit;

  Serie := QMCabeceraSERIE.AsString;
  Ejercicio := QMCabeceraEJERCICIO.AsInteger;
  Rig := QMCabeceraRIG.AsInteger;
  Linea := QMDetalleLINEA.AsInteger;
  Almacen := QMCabeceraALMACEN_ORI.AsString;
  TipoOper := QMCabeceraTIPO_OPERACION.AsString;
  Canal := QMCabeceraCANAL_ORI.AsInteger;
  Articulo_Old := xArticulos.FieldByName('ARTICULO').AsString;

  // Precio unitario a utilizar en movimiento
  // ART_ARTICULOS.P_COSTE si es entrada, PMP Si es Salida o Traspaso
  // REntorno.Precio_coste_mov hace que siempre se utilice ART_ARTICULOS.P_COSTE
  // param_MOVSTCK011 fuerza siempre ART_ARTICULOS.P_COSTE
  Precio := DMMain.DamePrecioMovimientoArticulo(REntorno.Empresa, Canal, QMDetalleARTICULO.AsString, Almacen, 0, TipoOper, 0);

  with xArticulos do
  begin
     Close;
     Open;
     if FieldByName('CONTROLA_MEDIDAS').AsInteger <> 0 then
     begin
        if (QMDetalle.State = dsInsert) then
           Estado := 0;
        if (QMDetalle.State = dsEdit) then
        begin
           if (Articulo_Old <> xArticulos.FieldByName('ARTICULO').AsString) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'DELETE FROM GES_DETALLES_ST_UE WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND SERIE = :SERIE AND RIG = :RIG AND LINEA = :LINEA';
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                    Params.ByName['SERIE'].AsString := Serie;
                    Params.ByName['RIG'].AsInteger := Rig;
                    Params.ByName['LINEA'].AsInteger := Linea;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
              Estado := 0;
           end
           else
           begin
              Estado := 1;
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT * FROM GES_DETALLES_ST_UE WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND SERIE = :SERIE AND RIG = :RIG AND LINEA = :LINEA';
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                    Params.ByName['SERIE'].AsString := Serie;
                    Params.ByName['RIG'].AsInteger := Rig;
                    Params.ByName['LINEA'].AsInteger := Linea;
                    ExecQuery;
                    medida1 := FieldByName['MEDIDA1'].AsFloat;
                    medida2 := FieldByName['MEDIDA2'].AsFloat;
                    medida3 := FieldByName['MEDIDA3'].AsFloat;
                    medida4 := FieldByName['MEDIDA4'].AsFloat;
                    gprecio := FieldByName['PRECIO'].AsFloat;
                    gunidades := FieldByName['UNIDADES'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;

        // Devuelve Unidades, Estado y Precio
        Unidades := DevuelveValor(xArticulos, Self, QMDetalleEMPRESA.AsInteger, QMDetalleEJERCICIO.AsInteger, QMCabeceraCANAL_ORI.AsInteger, QMDetalleSERIE.AsString, QMCabeceraTIPO_OPERACION.AsString, QMDetalleRIG.AsInteger, QMDetalleLINEA.AsInteger,
           Almacen, Estado, Precio, QMDetalleARTICULO.AsString);
        if (Estado <> 2) then
           QMDetalleUNIDADES_EXT.AsFloat := Unidades;
        if QMDetalleUNIDADES_EXT.AsFloat = 0 then
           QMDetalleUNIDADES_EXT.AsFloat := 1;
     end
     else
        QMDetalleUNIDADES_EXT.AsFloat := 0;
  end;

  if ((QMDetalleUNIDADES_EXT.AsFloat <> 0) and (Precio <> 0)) then
     QMDetallePRECIO.AsFloat := Precio * QMDetalleUNIDADES_EXT.AsFloat
  else
     QMDetallePRECIO.AsFloat := Precio;

  QMDetalleTITULO.AsString := DameTituloArticulo(QMDetalleARTICULO.AsString);
end;

procedure TDMMovManStock.BorraLineaExt;
begin
  if QMDetalle.State = dsInsert then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM GES_DETALLES_ST_UE WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND SERIE = :SERIE AND RIG = :RIG AND LINEA = :LINEA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
           Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else if QMDetalle.State = dsEdit then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_DETALLES_ST_UE ');
           SQL.Add(' SET ');
           SQL.Add('   UNIDADES = ?UNIDADES ');
           SQL.Add('   ,MEDIDA1 = ?MEDIDA1 ');
           SQL.Add('   ,MEDIDA2 = ?MEDIDA2 ');
           SQL.Add('   ,MEDIDA3 = ?MEDIDA3 ');
           SQL.Add('   ,MEDIDA4 = ?MEDIDA4 ');
           SQL.Add('   ,PRECIO = ?PRECIO ');
           SQL.Add(' WHERE ');
           SQL.Add('   LINEA = ?LINEA AND ');
           SQL.Add('   RIG = ?RIG AND ');
           SQL.Add('   SERIE = ?SERIE AND ');
           SQL.Add('   EJERCICIO = ?EJERCICIO AND ');
           SQL.Add('   EMPRESA = ?EMPRESA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['SERIE'].AsString := QMCabeceraSerie.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           Params.ByName['UNIDADES'].AsInteger := gunidades;
           Params.ByName['MEDIDA1'].AsFloat := medida1;
           Params.ByName['MEDIDA2'].AsFloat := medida2;
           Params.ByName['MEDIDA3'].AsFloat := medida3;
           Params.ByName['MEDIDA4'].AsFloat := medida4;
           Params.ByName['PRECIO'].AsFloat := gprecio;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMovManStock.FiltraMovimiento(Empresa, Ejercicio, Rig: integer; aSerie: string);
begin
  Serie := aSerie;

  with QMCabecera do
  begin
     Close;
     SelectSQL.Text :=
        'SELECT * FROM GES_CABECERAS_ST WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND SERIE = ?SERIE AND RIG = ?RIG ';
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
end;

procedure TDMMovManStock.InfoLotes;
var
  AsignaLotes : TFMAsignaLotes;
begin
  if ((QMDetalle.State = dsBrowse) {and ArticuloLoteable(QMDetalleARTICULO.AsString)}) then
  begin
     AsignaLotes := TFMAsignaLotes.Create(Self);
     try
        AsignaLotes.AsignaDocumento('MO' + QMCabeceraTIPO_OPERACION.AsString, QMDetalleID_DETALLES_ST.AsInteger, (QMCabeceraESTADO.AsInteger = 0));
     finally
        AsignaLotes.Free;
     end;

     QMDetalle.Refresh;
  end;
end;

function TDMMovManStock.Serializado: boolean;
begin
  // Primero miro si el articulo es serializado
  Result := (xArticulos.FieldByName('SERIALIZADO').AsInteger = 1);

  // Si no lo es, miro el detalle de su escandallo
  if not Result then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 D.SERIALIZADO FROM ART_ARTICULOS_ESCANDALLO E ');
           SQL.Add(' JOIN ART_ARTICULOS D ON E.EMPRESA = D.EMPRESA AND E.DETALLE = D.ARTICULO ');
           SQL.Add(' WHERE ');
           SQL.Add(' E.EMPRESA = :EMPRESA AND ');
           SQL.Add(' E.ARTICULO = :ARTICULO AND ');
           SQL.Add(' D.SERIALIZADO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           ExecQuery;
           Result := (FieldByName['SERIALIZADO'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMovManStock.DatosSerializacion(var Ejercicio: smallint; var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
begin
  Serie := QMCabeceraSERIE.AsString;
  Tipo := 'MV' + QMCabeceraTIPO_OPERACION.AsString;
  Rig := QMCabeceraRIG.AsInteger;
  Linea := QMDetalleLINEA.AsInteger;
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN_DST.AsString;
  Fecha := QMCabeceraFECHA.AsDateTime;
  Unidades := QMDetalleUNIDADES.AsFloat;
  Ejercicio := QMCabeceraEjercicio.AsInteger;
  Estado := 0;
end;

procedure TDMMovManStock.AbreCierra(Estado: integer);
var
  s, Fichero, usuarios : string;
  u : integer;
begin
  // Solo si es un 'Movimiento Manual de Stock' o una 'Entrega de Mercancia'
  if ((QMCabeceraORIGEN.AsString = '') or (QMCabeceraORIGEN.AsString = 'MAN') or (QMCabeceraORIGEN.AsString = 'ENT')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_CABECERAS_ST ');
           SQL.Add(' SET ');
           SQL.Add(' ESTADO = ?ESTADO, ');
           SQL.Add(' ENTRADA = ?ENTRADA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' RIG = ?RIG ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           Params.ByName['ESTADO'].AsInteger := Estado;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;

     usuarios := Trim(LeeParametro('MOVSTCK010', QMCabeceraSERIE.AsString));
     if (usuarios > '') then
     begin
        if (Estado = 0) then
           s := format(_('Se ha abierto el movimiento %s/%d - %s'), [QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, QMCabeceraCOMENTARIO.AsString])
        else
           s := format(_('Se ha cerrado el movimiento %s/%d - %s'), [QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, QMCabeceraCOMENTARIO.AsString]);
        s := s + #13#10 + format(_('Movimiento: %s'), [QMCabeceraCOMENTARIO.AsString]);
        s := s + #13#10 + format(_('Tipo: %s'), [QMCabeceraTIPO_OPERACION.AsString]);
        s := s + #13#10 + format(_('Almacen Origen: %s'), [QMCabeceraALMACEN_ORI.AsString]);
        s := s + #13#10 + format(_('Almacen Destino: %s'), [QMCabeceraALMACEN_DST.AsString]);
        s := s + #13#10 + format(_('Usuario %d: %s'), [REntorno.Usuario, DameTituloUsuario(REntorno.Usuario)]);

        AbreData(TDMLSTMovManStock, DMLSTMovManStock);
        try
           Fichero := DMLSTMovManStock.MostrarListado(QMCabeceraID_ST.AsInteger, 2, 507);

           while (Pos(',', usuarios) > 0) do
           begin
              u := StrToIntDef(Copy(usuarios, 1, Pos(',', usuarios) - 1), 0);
              usuarios := Copy(usuarios, Pos(',', usuarios) + 1, Length(usuarios));
              if (u <> 0) then
                 EnviarMensaje(u, s, Fichero);
           end;
           u := StrToIntDef(usuarios, 0);
           if (u <> 0) then
              EnviarMensaje(u, s, Fichero);
        finally
           CierraData(DMLSTMovManStock);
        end;
     end;
  end
  else
     ShowMessage(_('Se debe modificar desde el documento origen'));
end;

procedure TDMMovManStock.PreparaSerializacion;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
end;

procedure TDMMovManStock.QMDetalleBeforePost(DataSet: TDataSet);
var
  NSerieE : TFMNumerosDeSerieMOEKri;
  NSerieS : TFMNumerosDeSerieMOSKri;
  NSerieM : TFMNumerosDeSerieMOVKri;
  LoteS : TFMLotesMOSKri;
  LoteM : TFMLotesMOVKri;
begin
  if ((Tabla = 'SERIE') or (QMDetalleNSERIE.AsString <> '')) then
     if ((QMDetalleUNIDADES.AsFloat <> 1) and (QMDetalleUNIDADES.AsFloat <> -1)) then
        raise Exception.Create(_('No se puede vender más de una unidad de un artículo serializado'));

  if QMCabeceraTIPO_OPERACION.AsString = 'E' then
  begin
     NSerieE := TFMNumerosDeSerieMOEKri.Create(nil);
     NSerieE.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        QMCabeceraCANAL_DST.AsInteger,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN_DST.AsString,
        QMDetalleUNIDADES.AsInteger,
        False,
        False);
     NSerieE.Release;

     {LoteE := TFMLotesMOEKri.Create(nil);
    LoteE.Muestra(REntorno.Empresa,
      REntorno.Ejercicio,
      QMCabeceraCANAL_DST.AsInteger,
      QMDetalleSERIE.AsString,
      QMDetalleRIG.AsInteger,
      QMDetalleLINEA.AsInteger,
      QMCabeceraFECHA.AsDateTime,
      QMDetalleARTICULO.AsString,
      QMCabeceraALMACEN_DST.AsString,
      QMDetalleUNIDADES.AsInteger,
      false,
      false);
    LoteE.Release;}
  end;

  if QMCabeceraTIPO_OPERACION.AsString = 'S' then
  begin
     NSerieS := TFMNumerosDeSerieMOSKri.Create(nil);
     NSerieS.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        QMCabeceraCANAL_ORI.AsInteger,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN_ORI.AsString,
        QMDetalleUNIDADES.AsInteger,
        False,
        False);
     NSerieS.Release;

     LoteS := TFMLotesMOSKri.Create(nil);
     LoteS.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        QMCabeceraCANAL_DST.AsInteger,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN_DST.AsString,
        QMDetalleUNIDADES.AsInteger,
        False,
        False);
     LoteS.Release;
  end;

  if QMCabeceraTIPO_OPERACION.AsString = 'T' then
  begin
     NSerieM := TFMNumerosDeSerieMOVKri.Create(nil);
     NSerieM.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        QMCabeceraCANAL_ORI.AsInteger,
        QMCabeceraCANAL_DST.AsInteger,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN_ORI.AsString,
        QMCabeceraALMACEN_DST.AsString,
        QMDetalleUNIDADES.AsInteger,
        False,
        False);
     NSerieM.Release;

     LoteM := TFMLotesMOVKri.Create(nil);
     LoteM.Muestra(REntorno.Empresa,
        REntorno.Ejercicio,
        QMCabeceraCANAL_ORI.AsInteger,
        QMCabeceraCANAL_DST.AsInteger,
        QMDetalleSERIE.AsString,
        QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger,
        QMCabeceraFECHA.AsDateTime,
        QMDetalleARTICULO.AsString,
        QMCabeceraALMACEN_ORI.AsString,
        QMCabeceraALMACEN_DST.AsString,
        QMDetalleUNIDADES.AsInteger,
        False,
        False);
     LoteM.Release;
  end;
  // Controlamos si se informa lote de un articulo loteable
  {
  if DameArticuloLoteable then
     if (QMDetalleID_LOTE.AsInteger = 0) then
        raise Exception.Create(_('Artículo loteable. Falta informar el lote.'));
  }

  ReiniciaStock(QMDetalleARTICULO.AsString);
end;

procedure TDMMovManStock.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  evt := QMDetalleARTICULO.OnChange;
  try
     QMDetalleARTICULO.OnChange := nil;
     QMDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, QMCabeceraALMACEN_ORI.AsString, 0, QMDetalleNSERIE);
  finally
     QMDetalleARTICULO.OnChange := evt;
  end;
end;

procedure TDMMovManStock.VaciaNumSerie;
begin
  QMDetalleNSERIE.AsString := '';
end;

function TDMMovManStock.HayDetalle: boolean;
begin
  Result := (QMDetalle.FieldByName('LINEA').AsInteger <> 0);
end;

{No se utiliza
procedure TDMMovManStock.ArticulosUbicacion(Tipo: string);
var
  Peso, Volumen, Diametro : double;
  QGen : THYFIBQuery;
  modo, canal : integer;
begin
  if (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
  begin
     if Tipo = 'E' then
     begin
        modo := 0;
        canal := QMCabeceraCANAL_ORI.AsInteger;
     end
     else
     begin
        modo := 1;
        canal := QMCabeceraCANAL_DST.AsInteger;
     end;

     QGen := THYFIBQuery.Create(nil);
     with QGen do
     begin
        DataBase := DMMain.DataBase;
        AutoTrans := True;
        SQL.Text := DameSentenciaSQL(modo);
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
        Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
        Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
        Params.ByName['UNIDADES'].AsFloat := QMDetalleUNIDADES.AsInteger;
        Params.ByName['PESO'].AsFloat := Peso;
        Params.ByName['VOLUMEN'].AsFloat := Volumen;
        Params.ByName['DIAMETRO'].AsFloat := Diametro;
        Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
        Params.ByName['CANAL'].AsInteger := Canal;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(QGen);
  end;
end;
}

{No se utiliza
function TDMMovManStock.DameSentenciaSQL(Modo: integer): string;
begin
  case modo of
     0: Result := 'execute procedure a_art_distribuye_articulos_st(?empresa,?ejercicio,?serie,?rig,?linea,?id_a,?unidades,' +
           '99999,?peso,?volumen,?diametro,?articulo,?canal)';
     1: Result := 'execute procedure a_art_extrae_articulos_st(?empresa,?ejercicio,?serie,?rig,?linea,?id_a,?unidades,' +
           '99999,?peso,?volumen,?diametro,?articulo,?canal)';
  end;
end;
}

{No se utiliza
procedure TDMMovManStock.LanzaUbicacion;
var
  tipo : string;
begin
  tipo := QMCabeceraTIPO_OPERACION.AsString;

  if (tipo = 'E') then
     ArticulosUbicacion('E')
  else if (tipo = 'S') then
     ArticulosUbicacion('S')
  else
  if (tipo = 'T') then
  begin
     ArticulosUbicacion('S');
     ArticulosUbicacion('E');
  end;
end;
}

procedure TDMMovManStock.MuestraUbicacion(TipoMov: string);
var
  peso, volumen, diametro : double;
  canal : integer;
begin
  canal := 0;
  if (QMCabeceraTIPO_OPERACION.AsString = 'E') then
     canal := QMCabeceraCANAL_ORI.AsInteger
  else
  if (QMCabeceraTIPO_OPERACION.AsString = 'S') then
     canal := QMCabeceraCANAL_DST.AsInteger
  else
  begin
     if (TipoMov = 'E') then
        canal := QMCabeceraCANAL_DST.AsInteger
     else
     if (TipoMov = 'S') then
        canal := QMCabeceraCANAL_ORI.AsInteger;
  end;

  if ((QMCabeceraTIPO_OPERACION.AsString = 'E') or (QMCabeceraTIPO_OPERACION.AsString = 'S')) then
     if (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     begin
        TFMMovStockUbicaciones.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
           QMDetalleEJERCICIO.AsInteger, QMDetalleRIG.AsInteger, QMDetalleLINEA.AsInteger,
           QMDetalleID_A.AsInteger, canal, QMDetalleSERIE.AsString, QMCabeceraTIPO_OPERACION.AsString, QMDetalleUNIDADES.AsFloat);
     end;
  if (QMCabeceraTIPO_OPERACION.AsString = 'T') then
     if (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1) then
     begin
        TFMMovStockUbicaciones.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
           QMDetalleEJERCICIO.AsInteger, QMDetalleRIG.AsInteger, QMDetalleLINEA.AsInteger,
           QMDetalleID_A.AsInteger, canal, QMDetalleSERIE.AsString, TipoMov, QMDetalleUNIDADES.AsFloat);
     end;
end;

procedure TDMMovManStock.ListarCodBarras;
var
  modo, numBarras, numespacios, ori, valorado, usarbultos : integer;
  tarifa : string;
  Texto1, Texto2, Texto3, Idioma : string;
begin
  ori := 2;
  AbreData(TDMLstEtiquetas, DMLstEtiquetas);
  TFPregCodBarras.Create(Self).Muestrate(modo, numBarras, numespacios, ori, valorado, usarbultos, tarifa, Texto1, Texto2, Texto3, Idioma);

  if (modo < 2) then
  begin
     DMLstEtiquetas.Texto1 := Texto1;
     DMLstEtiquetas.Texto2 := Texto2;
     DMLstEtiquetas.Texto3 := Texto3;
     DMLstEtiquetas.Idioma := Idioma;
  end;

  DMLstEtiquetas.MostrarListadoCodBarras(QMCabeceraEjercicio.AsInteger, 0,
     QMcabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, '.', numBarras, numespacios, modo, ori,
     tarifa, 0, Valorado, ''{dji lrk kri}, 0);
  CierraData(DMLstEtiquetas);
end;

procedure TDMMovManStock.Continua;
begin
  SePuede := True;
end;

procedure TDMMovManStock.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulos.Close;
end;

procedure TDMMovManStock.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xAlmacenOrig.Close;
  xAlmacenDst.Close;
  xTotales.Close;
end;

procedure TDMMovManStock.RefrescaDatosArticulo;
begin
  if (FUltimoArticulo <> QMDetalleARTICULO.AsString) then
  begin
     FUltimoArticulo := QMDetalleARTICULO.AsString;
     if (FUltimoArticulo = '') then
     begin
        FArticuloUbicable := True;
        FArticuloLoteable := True;
     end
     else
     begin
        FArticuloUbicable := UDameDato.ArticuloUbicable(FUltimoArticulo);
        FArticuloLoteable := UDameDato.ArticuloLoteable(FUltimoArticulo);
     end;
  end;
end;

function TDMMovManStock.DameArticuloUbicable: boolean;
begin
  RefrescaDatosArticulo;
  Result := FArticuloUbicable;
end;

function TDMMovManStock.DameArticuloLoteable: boolean;
begin
  RefrescaDatosArticulo;
  Result := FArticuloLoteable;
end;

procedure TDMMovManStock.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  FAlmacenOriUbicable := DMMain.CompruebaControlUbicacionAlmacen(QMCabeceraALMACEN_ORI.AsString);
  FAlmacenDstUbicable := DMMain.CompruebaControlUbicacionAlmacen(QMCabeceraALMACEN_DST.AsString);
end;

procedure TDMMovManStock.Inserta(Articulo: string; Unidades: double; Lote: string; IdUbicacion: integer; Precio: double; Descripcion: string; PCoste: double);
var
  IdLote : integer;
  Composicion : string;
begin
  // PCoste no se utiliza en movimientos manuales de stock.
  // PCoste := 0;

  IdLote := 0;
  if (UDameDato.ArticuloLoteable(Articulo) = False) then
     Lote := '';
  if (UDameDato.ArticuloUbicable(Articulo) = False) then
     IdUbicacion := 0;

  // Se comprueba que exista el lote
  if (Lote <> '') then
  begin
     IdLote := DameIDLote(Articulo, Lote);

     // Insertamos lote si no existe
     if (IdLote = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE G_CREA_LOTE(:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :LOTE, :FECHA, :RIG, :SERIE)';
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['LOTE'].AsString := Lote;
              Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
              Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
              Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
              ExecQuery;
              IdLote := FieldByName['ID_LOTE'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  // Se comprueba que exista ubicacion
  if (IdUbicacion <> 0) then
  begin
     Composicion := DameComposicionUbicacion(IdUbicacion);
     if (Composicion = '') then
        IdUbicacion := 0;
  end;

  // Precio unitario a utilizar en movimiento
  // ART_ARTICULOS.P_COSTE si es entrada, PMP Si es Salida o Traspaso
  // REntorno.Precio_coste_mov hace que siempre se utilice ART_ARTICULOS.P_COSTE
  // param_MOVSTCK011 fuerza siempre ART_ARTICULOS.P_COSTE
  if (Precio <= 0) then
     Precio := DMMain.DamePrecioMovimientoArticulo(REntorno.Empresa, QMCabeceraCANAL_ORI.AsInteger, Articulo, QMCabeceraALMACEN_ORI.AsString, 0, QMCabeceraTIPO_OPERACION.AsString, 0);

  if (Descripcion = '') then
     Descripcion := DameTituloArticulo(Articulo);
  if (Unidades < 0) then
     Unidades := 1;

  // Se insera el registro
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO VER_DETALLE_MOVS ( ');
        SQL.Add(' EMPRESA, EJERCICIO, SERIE, RIG, LINEA, ARTICULO, TITULO, UNIDADES, UNIDADES_EXT, PRECIO, ENTRADA, PRECIO_VENTA, ');
        SQL.Add(' ORDEN_PRODUCCION, ID_LOTE, CANT_LOTE, ID_UBICACION_E, ID_UBICACION_S) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :SERIE, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :UNIDADES_EXT, :PRECIO, :ENTRADA, :PRECIO_VENTA, ');
        SQL.Add(' :ORDEN_PRODUCCION, :ID_LOTE, :CANT_LOTE, :ID_UBICACION_E, :ID_UBICACION_S) ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := DMMain.DameLineaSiguiente('MOV', QMCabeceraID_ST.AsInteger);
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['TITULO'].AsString := Descripcion;
        Params.ByName['UNIDADES'].AsFloat := Unidades;
        Params.ByName['UNIDADES_EXT'].AsFloat := 0;
        Params.ByName['PRECIO'].AsFloat := Precio;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['PRECIO_VENTA'].AsFloat := Precio;
        Params.ByName['ORDEN_PRODUCCION'].AsString := '';
        Params.ByName['ID_LOTE'].AsInteger := IdLote;
        Params.ByName['CANT_LOTE'].AsFloat := Unidades;
        Params.ByName['ID_UBICACION_E'].AsInteger := IdUbicacion;
        Params.ByName['ID_UBICACION_S'].AsInteger := IdUbicacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Continua;
end;

procedure TDMMovManStock.QMDetalleID_LOTEChange(Sender: TField);
begin
  if (Sender.DataSet.State in [dsInsert, dsEdit]) then
     QMDetalleLOTE.AsString := DameLote(QMDetalleID_LOTE.AsInteger);
end;

procedure TDMMovManStock.QMDetalleID_UBICACION_EChange(Sender: TField);
begin
  if (Sender.DataSet.State in [dsInsert, dsEdit]) then
     QMDetalleTIT_UBICACION_E.AsString := DameTituloUbicacion(QMDetalleID_UBICACION_E.AsInteger);
end;

procedure TDMMovManStock.QMDetalleID_UBICACION_SChange(Sender: TField);
begin
  if (Sender.DataSet.State in [dsInsert, dsEdit]) then
     QMDetalleTIT_UBICACION_S.AsString := DameTituloUbicacion(QMDetalleID_UBICACION_S.AsInteger);
end;

procedure TDMMovManStock.RefrescaTotales;
begin
  xTotales.Close;
  xTotales.Open;
end;

procedure TDMMovManStock.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DMMain.DameUnidadesConFormato(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat);
end;

procedure TDMMovManStock.UbicaDefecto;
var
  Canal : integer;
begin
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     if QMCabeceraTIPO_OPERACION.AsString = 'E' then
        Canal := QMCabeceraCANAL_ORI.AsInteger
     else
        Canal := QMCabeceraCANAL_DST.AsInteger;
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CAB.TIPO_OPERACION, DET.EMPRESA, DET.EJERCICIO, DET.SERIE, DET.RIG, DET.LINEA, DET.ID_A, DET.UNIDADES ');
           SQL.Add(' FROM GES_CABECERAS_ST CAB ');
           SQL.Add(' JOIN GES_DETALLES_ST DET ');
           SQL.Add(' ON (CAB.EMPRESA = DET.EMPRESA AND CAB.EJERCICIO = DET.EJERCICIO AND CAB.SERIE = DET.SERIE AND CAB.RIG = DET.RIG) ');
           SQL.Add(' JOIN ART_ARTICULOS ART ');
           SQL.Add(' ON (DET.ID_A = ART.ID_A) ');
           SQL.Add(' LEFT JOIN GES_DETALLES_ST_UBICACIONES UBI ');
           SQL.Add(' ON (UBI.EMPRESA = DET.EMPRESA AND UBI.EJERCICIO = DET.EJERCICIO AND UBI.SERIE = DET.SERIE AND UBI.RIG = DET.RIG AND UBI.LINEA = DET.LINEA) ');
           SQL.Add(' WHERE ');
           SQL.Add(' CAB.TIPO_OPERACION = ?TIPO_OPERACION AND ');
           SQL.Add(' DET.EMPRESA = ?EMPRESA AND ');
           SQL.Add(' DET.EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' DET.SERIE = ?SERIE AND ');
           SQL.Add(' DET.RIG = ?RIG AND ');
           SQL.Add(' ((CAB.ALMACEN_ORI = ''000'') OR (CAB.ALMACEN_DST = ''000'')) AND ');
           SQL.Add(' ART.UBICABLE = 1 AND ');
           SQL.Add(' ((UBI.ID_UBICACION = 1) OR (UBI.ID_UBICACION IS NULL)) ');
           Params.ByName['TIPO_OPERACION'].AsString := QMCabeceraTIPO_OPERACION.AsString;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
           ExecQuery;
           FreeHandle;
           Close;
           ExecQuery;
           if (not EOF) then
              ShowMessage(_('ATENCIÓN: Hay artículos sin ubicar.'));
           while not EOF do
           begin
              if ((FieldByName['TIPO_OPERACION'].AsString = 'E') or (FieldByName['TIPO_OPERACION'].AsString = 'S')) then
                 TFMMovStockUbicaciones.Create(Self).MuestraUbiArtic(FieldByName['EMPRESA'].AsInteger,
                    FieldByName['EJERCICIO'].AsInteger, FieldByName['RIG'].AsInteger, FieldByName['LINEA'].AsInteger,
                    FieldByName['ID_A'].AsInteger, canal, FieldByName['SERIE'].AsString, FieldByName['TIPO_OPERACION'].AsString, FieldByName['UNIDADES'].AsFloat);
              if (FieldByName['TIPO_OPERACION'].AsString = 'T') then
              begin
                 if (xAlmacenOrig.FieldByName('CTROL_UBICACION').AsInteger = 1) then
                    TFMMovStockUbicaciones.Create(Self).MuestraUbiArtic(FieldByName['EMPRESA'].AsInteger,
                       FieldByName['EJERCICIO'].AsInteger, FieldByName['RIG'].AsInteger, FieldByName['LINEA'].AsInteger,
                       FieldByName['ID_A'].AsInteger, canal, FieldByName['SERIE'].AsString, 'S', FieldByName['UNIDADES'].AsFloat);
                 if (xAlmacenDst.FieldByName('CTROL_UBICACION').AsInteger = 1) then
                    TFMMovStockUbicaciones.Create(Self).MuestraUbiArtic(FieldByName['EMPRESA'].AsInteger,
                       FieldByName['EJERCICIO'].AsInteger, FieldByName['RIG'].AsInteger, FieldByName['LINEA'].AsInteger,
                       FieldByName['ID_A'].AsInteger, canal, FieldByName['SERIE'].AsString, 'E', FieldByName['UNIDADES'].AsFloat);
              end;
              Next;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMovManStock.QMCabeceraTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(QMCabeceraESTADO.AsInteger);
end;

procedure TDMMovManStock.DameSqlImpresionEtiquetas(SQL: TStrings);
begin
  /// Genera SQL para rellenar ART_IMPRESION_CB_DETALLE con los articulos filtrados.
  /// Contiene el parametro NUMERO que sera utilizado dentro de UDMImprimircodBarras.

  with SQL do
  begin
     Clear;
     Add(' INSERT INTO ART_IMPRESION_CB_DETALLE ');
     Add(' (EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, ARTICULO, ID_DETALLE_DOC, COD_BARRAS, TIPO, NUM_COPIAS, FECHA, ALFA_6, ID_LOTE, UNIDADES) ');
     Add(' SELECT DET.EMPRESA, DET.EJERCICIO, CAB.CANAL_ORI, :NUMERO, 0, DET.ARTICULO, DET.ID_DETALLES_ST,');
     Add(' (SELECT FIRST 1 BARRAS ');
     Add(' FROM ART_ARTICULOS_BARRAS ');
     Add(' WHERE EMPRESA = DET.EMPRESA AND ');
     Add(' ARTICULO = DET.ARTICULO ');
     Add(' ORDER BY TIPO DESC), ');
     Add(' (SELECT FIRST 1 TIPO ');
     Add(' FROM ART_ARTICULOS_BARRAS ');
     Add(' WHERE EMPRESA = DET.EMPRESA AND');
     Add('        ARTICULO = DET.ARTICULO');
     Add(' ORDER BY TIPO DESC), ');
     // Obtenemos la cantidad de etiquetas a imprimir
     if (Param_ALBETIQ001 <> 0) then
        Add(format(' %d, ', [Param_ALBETIQ001]))
     else
        Add(' LOT.CANTIDAD, ');
     Add(' CAB.FECHA, AA.ALFA_6, LOT.ID_LOTE, DET.UNIDADES ');
     Add(' FROM GES_DETALLES_ST DET ');
     Add(' LEFT JOIN GES_DETALLES_ST_LOTES LOT ON (DET.ID_DETALLES_ST = LOT.ID_DETALLES_ST)');
     Add(' JOIN GES_CABECERAS_ST CAB ON (DET.ID_ST = CAB.ID_ST)');
     Add(' JOIN ART_ARTICULOS AA ON (AA.EMPRESA = DET.EMPRESA AND AA.ARTICULO = DET.ARTICULO) ');
     Add(' WHERE DET.ID_ST = ' + IntToStr(QMCabeceraID_ST.AsInteger));
     Add(' ORDER BY DET.LINEA, LOT.SUBLINEA ');
  end;
end;

procedure TDMMovManStock.AsignaKit;
var
  id_a_m, id_a_c, id_a_k : integer;
  Cantidad : double;
  DS : TFIBDataSet;
begin
  id_a_m := 0;
  id_a_c := 0;
  id_a_k := 0;
  Cantidad := 1;
  if UFMSeleccionKit.PideDato(id_a_m, id_a_c, id_a_k, Cantidad) then
  begin
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then
                    StartTransaction;
              end;
              SelectSQL.Add(' SELECT A.ARTICULO, KT.UNIDADES ');
              SelectSQL.Add(' FROM ART_ARTICULOS_MODELOS M ');
              SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR C ON M.ID_A_M = C.ID_A_M ');
              SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS T ON T.ID_A_M_C = C.ID_A_M_C ');
              SelectSQL.Add(' JOIN ART_KIT K ON M.ID_G_T = K.ID_G_T ');
              SelectSQL.Add(' JOIN ART_KIT_TALLAS KT ON K.ID_A_K = KT.ID_A_K AND T.ID_A_T = KT.ID_A_T ');
              SelectSQL.Add(' JOIN ART_ARTICULOS A ON M.EMPRESA = A.EMPRESA AND T.ARTICULO = A.ARTICULO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' M.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' M.ID_A_M = :ID_A_M AND ');
              SelectSQL.Add(' C.ID_A_C = :ID_A_C AND ');
              SelectSQL.Add(' K.ID_A_K = :ID_A_K AND ');
              SelectSQL.Add(' KT.UNIDADES <> 0 ');
              SelectSQL.Add(' ORDER BY A.ARTICULO ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ID_A_M'].AsInteger := id_a_m;
              Params.ByName['ID_A_C'].AsInteger := id_a_c;
              Params.ByName['ID_A_K'].AsInteger := id_a_k;
              Open;
              while not EOF do
              begin
                 QMDetalle.Append;
                 QMDetalleARTICULO.AsString := FieldByName('ARTICULO').AsString;
                 QMDetalleUNIDADES.AsFloat := FieldByName('UNIDADES').AsFloat * Cantidad;
                 QMDetalle.Post;

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
  end;
end;

procedure TDMMovManStock.CambiaSerie(aSerie: string);
begin
  Serie := aSerie;

  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM GES_CABECERAS_ST ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO ');

     if (Serie <> '') then
        SelectSQL.Add(' AND SERIE = :SERIE ');

     SelectSQL.Add(' ORDER BY SERIE, RIG ');

     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
  end;

  // Hora para movimiento de tipo (2:Entrada; 3:Salida; 4:Traspaso)
  Param_MOVSTCK002 := Trim(LeeParametro('MOVSTCK002', Serie));
  Param_MOVSTCK003 := Trim(LeeParametro('MOVSTCK003', Serie));
  Param_MOVSTCK004 := Trim(LeeParametro('MOVSTCK004', Serie));

  Param_MOVSTCK005 := Trim(Copy(LeeParametro('MOVSTCK005', Serie), 1, 1));
  if (Param_MOVSTCK005 = '') then
     Param_MOVSTCK005 := 'E';
  Param_MOVSTCK006 := Trim(Copy(LeeParametro('MOVSTCK006', Serie), 1, 3));
  if (Param_MOVSTCK006 = '') then
     Param_MOVSTCK006 := REntorno.AlmacenDefecto;
  Param_MOVSTCK007 := Trim(Copy(LeeParametro('MOVSTCK007', Serie), 1, 3));
  if (Param_MOVSTCK007 = '') then
     Param_MOVSTCK007 := REntorno.AlmacenDefecto;

  // Restringe la modificacion del campo Almacen Origen
  Param_MOVSTCK008 := (LeeParametro('MOVSTCK008', Serie) = 'S');
  // Restringe la modificacion del campo Almacen Destino
  Param_MOVSTCK009 := (LeeParametro('MOVSTCK009', Serie) = 'S');

  AlmacenStock := LeeParametro('MOVSTKA001', Serie);
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  AlmacenStock2 := LeeParametro('MOVSTKA002', Serie);
  if (AlmacenStock2 = '') then
     AlmacenStock2 := 'NOCALC';
  if (AlmacenStock2 <> 'NOCALC') then
     AlmacenStock2 := Copy(AlmacenStock2, 1, 3);

  AlmacenStock3 := LeeParametro('MOVSTKA003', Serie);
  if (AlmacenStock3 = '') then
     AlmacenStock3 := 'NOCALC';
  if (AlmacenStock3 <> 'NOCALC') then
     AlmacenStock3 := Copy(AlmacenStock3, 1, 3);

  DMMain.FiltraTabla(QMCabecera, '11000', True);
end;

procedure TDMMovManStock.InsertaModelo(RefProveedor: string);
begin
  /// Recorro los articulos que perteneces al modelo (todos los colores y tallas)
  /// Tambien inserto los lotes de esos articulos.
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT AM.ID_A_M, AMC.ID_A_M_C, AMCT.ID_A_M_C_T, A.ID_A, A.ARTICULO, A.TITULO_LARGO AS TITULO ');
           SelectSQL.Add(' FROM ART_ARTICULOS_MODELOS AM ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ON AM.ID_A_M = AMC.ID_A_M ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON AMC.ID_A_M_C = AMCT.ID_A_M_C ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON AMCT.ID_A_M_C_T = A.ID_A_M_C_T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' AM.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' AM.REF_PROVEEDOR = :REF_PROVEEDOR ');
           SelectSQL.Add(' ORDER BY A.ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
           Open;
           while not EOF do
           begin
              Inserta(FieldByName('ARTICULO').AsString, 0, '', 0, 0, FieldByName('TITULO').AsString, 0);
              // AgregaArticulo(FieldByName('ID_A').AsInteger, FieldByName('ARTICULO').AsString, FieldByName('TITULO').AsString, 0, 0, FieldByName('LOTE').AsString);
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

  RefrescarCabecera;
  QMDetalle.Last;
end;

procedure TDMMovManStock.EnviarMensaje(u: integer; s, f: string);
var
  email : string;
  BodyMail : TStrings;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TRIM(DIR_CORREO) DIR_CORREO FROM SYS_USUARIOS WHERE USUARIO = :USUARIO';
        Params.ByName['USUARIO'].AsInteger := u;
        ExecQuery;
        email := FieldByName['DIR_CORREO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.EnviaMensajeUsuario(u, s);
  BodyMail := TStringList.Create;
  try
     BodyMail.Text := s;
     DMListados.SendMailPDF(email, BodyMail, DameTempPath + f, f, BodyMail[0], '', 'DLF');
  finally
     BodyMail.Free;
  end;
end;

procedure TDMMovManStock.QMCabeceraAfterPost(DataSet: TDataSet);
{
var
  usuarios, s, Fichero : string;
  u : integer;
}
begin
  RefrescaTotales;
{
  usuarios := Trim(LeeParametro('MOVSTCK010', QMCabeceraSERIE.AsString));
  if (usuarios > '') then
  begin
     s := format(_('Se ha creado el movimiento %s/%d - %s'), [QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger, QMCabeceraCOMENTARIO.AsString]);
     s := s + #13#10 + format(_('Movimiento: %s'), [QMCabeceraCOMENTARIO.AsString]);
     s := s + #13#10 + format(_('Tipo: %s'), [QMCabeceraTIPO_OPERACION.AsString]);
     s := s + #13#10 + format(_('Almacen Origen: %s'), [QMCabeceraALMACEN_ORI.AsString]);
     s := s + #13#10 + format(_('Almacen Destino: %s'), [QMCabeceraALMACEN_DST.AsString]);
     s := s + #13#10 + format(_('Usuario %d: %s'), [REntorno.Usuario, DameTituloUsuario(REntorno.Usuario)]);

     AbreData(TDMLSTMovManStock, DMLSTMovManStock);
     try
        Fichero := DMLSTMovManStock.MostrarListado(QMCabeceraID_ST.AsInteger, 2, 507);

        while (Pos(',', usuarios) > 0) do
        begin
           u := StrToIntDef(Copy(usuarios, 1, Pos(',', usuarios) - 1), 0);
           usuarios := Copy(usuarios, Pos(',', usuarios) + 1, Length(usuarios));
           if (u <> 0) then
              EnviarMensaje(u, s, Fichero);
        end;

        u := StrToIntDef(usuarios, 0);
        if (u <> 0) then
           EnviarMensaje(u, s, fichero);
     finally
        CierraData(DMLSTMovManStock);
     end;
  end;
}
end;

procedure TDMMovManStock.QMDetalleAfterPost(DataSet: TDataSet);
begin
  if (QMDetalleID_LOTE.AsInteger = 0) then
     InfoLotes;

  RefrescaTotales;
end;

procedure TDMMovManStock.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  RefrescaTotales;
end;

procedure TDMMovManStock.QMDetalleCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  s, Articulo : string;
begin
  if (QMDetalleID_LOTE.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT LOTE, CLASIFICACION FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = ?ID_LOTE';
           Params.ByName['ID_LOTE'].AsInteger := QMDetalleID_LOTE.AsInteger;
           ExecQuery;
           QMDetalleTitulo_Lote_OP.AsString := FieldByName['LOTE'].AsString;
           QMDetalleCLASIFICACION.AsString := FieldByName['CLASIFICACION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if DMMain.ArticuloControlaStock(QMDetalleARTICULO.AsString) then
  begin
     Articulo := QMDetalleARTICULO.AsString;

     Stock := 0;
     if (AlmacenStock <> 'NOCALC') then
     begin
        s := format('<%s>%s', [AlmacenStock, Articulo]);
        with StockAlm do
        begin
           i := IndexOfName(s);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, AlmacenStock);
              Values[s] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[s]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock2 <> 'NOCALC') then
     begin
        s := format('<%s>%s', [AlmacenStock2, Articulo]);
        with StockAlm do
        begin
           i := IndexOfName(s);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, AlmacenStock2);
              Values[s] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[s]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM2.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock3 <> 'NOCALC') then
     begin
        s := format('<%s>%s', [AlmacenStock3, Articulo]);
        with StockAlm do
        begin
           i := IndexOfName(s);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, AlmacenStock3);
              Values[s] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[s]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM3.AsFloat := Stock;

     Stock := 0;
     if (MostrarStockOri) then
     begin
        with StockAlm do
        begin
           s := format('<%s>%s', [QMCabeceraALMACEN_ORI.AsString, Articulo]);
           i := IndexOfName(s);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, QMCabeceraALMACEN_ORI.AsString);
              Values[s] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[s]);
           end;
        end;
     end;
     QMDetalleSTOCK_ORI.AsFloat := Stock;

     Stock := 0;
     if (MostrarStockDst) then
     begin
        with StockAlm do
        begin
           s := format('<%s>%s', [QMCabeceraALMACEN_DST.AsString, Articulo]);
           i := IndexOfName(s);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, Articulo, QMCabeceraALMACEN_DST.AsString);
              Values[s] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[s]);
           end;
        end;
     end;
     QMDetalleSTOCK_DST.AsFloat := Stock;
  end
  else
  begin
     QMDetalleSTOCK_ALM.AsFloat := 0;
     QMDetalleSTOCK_ALM2.AsFloat := 0;
     QMDetalleSTOCK_ALM3.AsFloat := 0;
     QMDetalleSTOCK_ORI.AsFloat := 0;
     QMDetalleSTOCK_DST.AsFloat := 0;
  end;
end;

procedure TDMMovManStock.QMCabeceraTIPO_OPERACIONChange(Sender: TField);
var
  Fecha : TDateTime;
begin
  // Hora para movimiento de tipo (2:Entrada; 3:Salida; 4:Traspaso)
  if ((QMCabeceraTIPO_OPERACION.AsString = 'E') and (Param_MOVSTCK002 <> '')) then
     QMCabeceraFECHA.AsDateTime := RecodeTime(QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK002, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK002, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK002, 7, 2), 0), 0)
  else
  if ((QMCabeceraTIPO_OPERACION.AsString = 'S') and (Param_MOVSTCK003 <> '')) then
     QMCabeceraFECHA.AsDateTime := RecodeTime(QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK003, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK003, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK003, 7, 2), 0), 0)
  else
  if ((QMCabeceraTIPO_OPERACION.AsString = 'T') and (Param_MOVSTCK004 <> '')) then
     QMCabeceraFECHA.AsDateTime := RecodeTime(QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK004, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK004, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK004, 7, 2), 0), 0)
  else
  begin
     Fecha := QMCabeceraFECHA.AsDateTime;
     ReplaceTime(Fecha, Now);
     QMCabeceraFECHA.AsDateTime := Fecha;
  end;
end;

procedure TDMMovManStock.ReiniciaStock(Articulo: string = ''; Almacen: string = '');
var
  i : integer;
  s : string;
begin
  if (Articulo <> '') then
  begin
     with StockAlm do
     begin
        for i := Count - 1 downto 0 do
        begin
           s := StockAlm[i];
           if (Copy(s, 6, Pos('=', s) - 6) = Articulo) then
              Delete(i);
        end;
     end;
  end
  else
  begin
     StockAlm.Clear;
  end;
end;

procedure TDMMovManStock.QMCabeceraBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMMovManStock.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMMovManStock.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMMovManStock.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMMovManStock.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
  ReiniciaStock(QMDetalleARTICULO.AsString);
end;

procedure TDMMovManStock.MostrarStock(AlmOri, AlmDst: boolean);
begin
  MostrarStockOri := AlmOri;
  MostrarStockDst := AlmDst;
end;

procedure TDMMovManStock.RefrescarCabecera;
begin
  // Deshabilito temporalmente AfterScroll para evitar recalculos.
  QMCabecera.AfterScroll := nil;
  try
     Refrescar(QMCabecera, 'ID_ST', QMCabeceraID_ST.AsInteger);
  finally
     QMCabecera.AfterScroll := QMCabeceraAfterScroll;
  end;

  QMCabeceraAfterScroll(nil);
end;

end.
