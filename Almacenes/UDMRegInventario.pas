unit UDMRegInventario;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, FIBTableDataSetRO, HYFIBQuery,
  Dialogs, Forms, Windows;

type
  TDMRegInventario = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     QMDetalle: TFIBTableSet;
     DSQMCabecera: TDataSource;
     DSQMDetalle: TDataSource;
     QMCabeceraID_REG: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraFECHA_MOV: TDateTimeField;
     QMCabeceraEJERCICIO_MOV: TIntegerField;
     QMCabeceraSERIE_MOV: TFIBStringField;
     QMCabeceraTIPO: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraTIPO_INV: TIntegerField;
     QMCabeceraDESCRIPCION: TFIBStringField;
     QMCabeceraSTOCK_FECHA: TIntegerField;
     xInfoMovimientos: TFIBDataSetRO;
     xInfoMovimientosEMPRESA: TIntegerField;
     xInfoMovimientosRIG: TIntegerField;
     xInfoMovimientosFECHA: TDateTimeField;
     xInfoMovimientosCOMENTARIO: TFIBStringField;
     xInfoMovimientosSERIE: TFIBStringField;
     xInfoMovimientosEJERCICIO: TIntegerField;
     DSxInfoMovimientos: TDataSource;
     TUpdate: THYTransaction;
     xArticulos: TFIBDataSetRO;
     TInsertaArticulo: THYTransaction;
     QInsertaArticulo: THYFIBQuery;
     xLotes: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     QMDetalleID_REG_DETALLE: TIntegerField;
     QMDetalleID_REG: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleSTOCK: TFloatField;
     QMDetalleNSERIE: TFIBStringField;
     QMDetallePROCESADO: TIntegerField;
     QMDetalleFECHA_CREACION: TDateTimeField;
     QMDetalleFAMILIA: TFIBStringField;
     QMDetalleSUBFAMILIA: TFIBStringField;
     QMDetalleALFA_4: TFIBStringField;
     QMDetalleALFA_6: TFIBStringField;
     QMDetalleLOTEABLE: TIntegerField;
     QMDetalleTITULO_FAMILIA: TFIBStringField;
     QMDetallePROVEEDOR: TIntegerField;
     QMDetalleCODIGO_PROVEEDOR: TFIBStringField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     QMDetalleCONTROL_STOCK: TIntegerField;
     QMDetalleALMACEN: TStringField;
     QMDetalleCLASIFICACION: TFIBStringField;
     QMDetalleALFA_2: TFIBStringField;
     QMDetalleALFA_1: TFIBStringField;
     QMDetalleALFA_3: TFIBStringField;
     QMDetalleALFA_5: TFIBStringField;
     QMDetalleALFA_7: TFIBStringField;
     QMDetalleALFA_8: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleDECIMALES: TIntegerField;
     QMDetalleUNIDAD: TFIBStringField;
     QMDetalleTIPO_ARTICULO: TFIBStringField;
     QMDetallePESO: TFloatField;
     QMDetalleVOLUMEN_UNIT: TFloatField;
     QMDetalleDIAMETRO_UNIT: TFloatField;
     QMDetalleALTO: TFloatField;
     QMDetalleANCHO: TFloatField;
     QMDetalleFONDO: TFloatField;
     QMDetalleLITROS_POR_UNIDAD: TFloatField;
     QMDetallePROVEEDOR_LOTE: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraALMACENChange(Sender: TField);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure GrabaDetalle(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMDetalleALMACENGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
  private
     { Private declarations }
     InsercionMasivaLote: boolean;
     ParPrecio: boolean;
     AlmacenControlaUbicacion: boolean;
     SQLDetalleBase: TStrings;
     Param_ALBETIQ001: integer;
     procedure MuestraUbicacion; //SFG_JLA
     procedure InsertaArticulo(IdA: integer; Articulo, Titulo: string; Precio, Unidades: double; Tipo, ReemplazarUnidades, ModoStock: byte; IdLote: integer);
     function LotesAsignados: boolean;
     procedure EnviarMensaje(u: integer; s, Fichero: string);
  public
     { Public declarations }
     NotasLote: boolean; // Controla si se editan las notas del lote
     procedure BusquedaArticulo(Descripcion: string);
     procedure InsertarVariosArticulos(ModoStock: byte);
     procedure Cierra;
     procedure Abre;
     procedure EliminaCero;
     procedure BusquedaCompleja;
     procedure BusquedaComplejaDetalle;
     procedure RefrescaStock;
     procedure InfoLotes;
     procedure DatosSerializacion(var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
     function Serializado: boolean;
     function CompruebaLotes: boolean;
     procedure FiltraInventario(Empresa, Ejercicio, Rig: integer; Serie: string);
     procedure PreparaSerializacion;
     procedure PonerUnidadesACero;
     procedure SetFechaApertura;
     procedure DescargaStockTiendaVirtual;
     procedure MuestraMovimientos;
     procedure AsignaLote(Lote: string; Cantidad: double);
     procedure AsignaLoteComponente;
     procedure AgregaArticulo(id_a: integer; Articulo, Titulo: string; Unidades, Precio: double; Lote: string);
     procedure RefrescaPrecio;
     procedure FiltrarDetalle(Articulo: string);
     procedure DameSqlImpresionEtiquetas(Articulo: string; SQL: TStrings);
     function EliminaLoteDetalleInventario(id_reg_detalle: integer): boolean;
     procedure TraspasoMovimientoStock;
     procedure InsertaModelo(Modelo: string);
     procedure ModificaValorALFA(Alfa: integer; Articulo, Valor: string);
  end;

var
  DMRegInventario : TDMRegInventario;

implementation

uses UDMMain, UEntorno, UFParada, UFMArticulos, UFBusca, UUtiles, UDameDato, UFMIntroduceLotes,
  UFMRegInventario, UFormGest, UDMPrestashop, UFMRegInventarioUbicaciones,
  UFRegInventarioMovimientos, UFMain, Controls, UParam, UDMMovManStock, UFMSeleccion,
  UDMLstRegInventario, UDMListados;

{$R *.dfm}

procedure TDMRegInventario.DataModuleCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  Param_ALBETIQ001 := StrToIntDef(LeeParametro('ALBETIQ001'), 0);

  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);

  QMDetallePRECIO.DisplayFormat := MascaraL;
  QMDetalleUNIDADES.DisplayFormat := MascaraI;
  QMDetalleSTOCK.DisplayFormat := MascaraI;
  QMDetalleALTO.DisplayFormat := MascaraI;
  QMDetalleANCHO.DisplayFormat := MascaraI;
  QMDetalleFONDO.DisplayFormat := MascaraI;
  QMDetallePESO.DisplayFormat := MascaraI;
  QMDetalleVOLUMEN_UNIT.DisplayFormat := MascaraI;
  QMDetalleDIAMETRO_UNIT.DisplayFormat := MascaraI;
  QMDetalleLITROS_POR_UNIDAD.DisplayFormat := MascaraI;

  // Guardo SQL para hacer filtros
  SQLDetalleBase := TStringList.Create;
  SQLDetalleBase.Text := QMDetalle.SelectSQL.Text;
  QMDetalle.SelectSQL.Add('ORDER BY LINEA');

  DMMain.FiltraTabla(QMCabecera, '11100', True);

  NotasLote := False;
  InsercionMasivaLote := False;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PAR_PRECIO FROM SYS_CONSTANTES';
        ExecQuery;
        ParPrecio := (FieldByName['PAR_PRECIO'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
  begin
     if Assigned(QMDetalle.Fields.FindField(Format('ALFA_%d', [i]))) then
        QMDetalle.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TDMRegInventario.DataModuleDestroy(Sender: TObject);
begin
  SQLDetalleBase.Free;
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMRegInventario.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  AlmacenControlaUbicacion := DMMain.CompruebaControlUbicacionAlmacen(QMCabeceraALMACEN.AsString);
  QMDetalle.Open;
end;

procedure TDMRegInventario.QMCabeceraALMACENChange(Sender: TField);
begin
  AlmacenControlaUbicacion := DMMain.CompruebaControlUbicacionAlmacen(QMCabeceraALMACEN.AsString);
end;

procedure TDMRegInventario.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO_MOV.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraFECHA_MOV.AsDateTime := REntorno.FechaTrab;
  if (LeeParametro('INVFECH001') = 'N') then
     QMCabeceraFECHA_MOV.AsDateTime := HourIntoDate(QMCabeceraFECHA_MOV.AsDateTime, '23:59:59');
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraESTADO.AsInteger := 0;
  QMCabeceraTIPO.AsInteger := StrToIntDef(LeeParametro('INVPREC001'), 1);
  QMCabeceraTIPO_INV.AsInteger := 0; // Absoluto
  QMCabeceraSERIE_MOV.AsString := REntorno.Serie;
  QMCabeceraSTOCK_FECHA.AsInteger := 1;
end;

procedure TDMRegInventario.Graba(DataSet: TDataSet);
begin
  // TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMRegInventario.GrabaDetalle(DataSet: TDataSet);
begin
  DataSet.Refresh;

  if (DataSet.State = dsInsert) then
     if not (NotasLote) then
        InfoLotes;

  MuestraUbicacion;
end;

procedure TDMRegInventario.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMCabecera.Post;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMDetalleRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMDetalleID_REG.AsInteger := QMCabeceraID_REG.AsInteger;
  QMDetalleUNIDADES.AsInteger := 1;
  QMDetallePRECIO.AsInteger := 0;
  QMDetalleARTICULO.AsString := '';
  QMDetalleNSERIE.AsString := '';

  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente('REG', QMCabeceraID_REG.AsInteger);
end;

procedure TDMRegInventario.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     // Contador normal
     QMCabeceraRIG.AsInteger := DMMain.Contador_EC('RGI');
     // ID
     DMMain.Contador_Gen(DataSet, 'ID_REG_STOCK', 'ID_REG');
  end;

  // Permite modificar la hora de la fecha de inventario. Por defecto los inventarios se hacen con hora 23:59:59
  if (LeeParametro('INVFECH001') = 'N') then
     QMCabeceraFECHA_MOV.AsDateTime := HourIntoDate(QMCabeceraFECHA_MOV.AsDateTime, '23:59:58');
end;

procedure TDMRegInventario.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_REG_STOCK_DET', 'ID_REG_DETALLE');

  // Comprobación de, si es un número de serie, sea siempre una unidad
  if (QMDetalleNSERIE.AsString <> '') then
     if ((QMDetalleUNIDADES.AsFloat <> 1) and (QMDetalleUNIDADES.AsFloat <> -1)) then
        raise Exception.Create(_('No se puede vender más de una unidad de un artículo serializado'));
end;

procedure TDMRegInventario.QMDetalleARTICULOChange(Sender: TField);
begin
  if ((QMDetalle.State in [dsInsert, dsEdit]) and (Trim(Sender.AsString) <> '')) then
  begin
     // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
     if (DameIdArticulo(Sender.AsString) <= 0) then
        BusquedaArticulo(Sender.AsString);

     QMDetalleID_A.AsInteger := DameIDArticulo(QMDetalleARTICULO.AsString);
     QMDetalleTITULO.AsString := DameTituloArticulo(QMDetalleARTICULO.AsString);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT STOCK, PMP, P_COSTE FROM A_ART_DAME_STOCK2(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA)';
           // SQL.Text := 'SELECT STOCK, PMP, P_COSTE FROM A_ART_DAME_STOCK(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL)';
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
           Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
           Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
           if (QMCabeceraSTOCK_FECHA.AsInteger = 1) then
              Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA_MOV.AsDateTime
           else
              Params.ByName['FECHA'].AsDateTime := EncodeDate(3000, 12, 31);

           ExecQuery;

           QMDetalleSTOCK.AsFloat := FieldByName['STOCK'].AsFloat;
           // PRECIO
           case QMCabeceraTIPO.AsInteger of
              0: QMDetallePRECIO.AsFloat := FieldByName['PMP'].AsFloat;
              1:
              begin
                 if (ParPrecio) then
                    QMDetallePRECIO.AsFloat := FieldByName['P_COSTE'].AsFloat
                 else
                    QMDetallePRECIO.AsFloat := FieldByName['PMP'].AsFloat;
              end;
              2: QMDetallePRECIO.AsFloat := FieldByName['P_COSTE'].AsFloat;
              3: QMDetallePRECIO.AsFloat := DMMain.DamePrecioCosteArticulo(QMDetalleARTICULO.AsString);
           end;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRegInventario.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  evt := QMDetalleArticulo.OnChange;
  try
     QMDetalleArticulo.OnChange := nil;
     QMDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, QMCabeceraALMACEN.AsString, 0, QMDetalleNSERIE);
  finally
     QMDetalleArticulo.OnChange := evt;
  end;
end;

procedure TDMRegInventario.InsertaArticulo(IdA: integer; Articulo, Titulo: string; Precio, Unidades: double; Tipo, ReemplazarUnidades, ModoStock: byte; IdLote: integer);
var
  Loteable, Linea, IdRegDetalle : integer;
  ModoPrecio : integer;
begin
  /// Tipo 0 = Toma los precios que se le pasan
  ///      1 = Toma los precios según ModoPrecio
  /// Modo Precio 0 = PMP
  ///             1 = Según configuracion (SYS_CONSTANTES.PAR_PRECIO -> 0=PMP, 1=P.Coste)
  ///             2 = P. Coste
  ///             3 = P. Coste Artículo

  ModoPrecio := QMCabeceraTIPO.AsInteger;

  // Si tiene que calcular el precio, tomo el valor de SYS_CONSTANTES para ahorrar lecturas
  if (Tipo = 1) then
  begin
     if (ModoPrecio = 1) then
     begin
        if (ParPrecio) then
           ModoPrecio := 2 // P.Coste
        else
           ModoPrecio := 0; // PMP
     end;
  end;

  with QInsertaArticulo do
  begin
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
     Params.ByName['ID_A'].AsInteger := IdA;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['TITULO'].AsString := Titulo;
     Params.ByName['UNIDADES'].AsFloat := Unidades;
     Params.ByName['PRECIO'].AsFloat := Precio;
     Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
     Params.ByName['TIPO'].AsInteger := Tipo;
     Params.ByName['MODO'].AsInteger := ModoPrecio;
     Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA_MOV.AsDateTime;
     Params.ByName['REEMPLAZAR_UNIDADES'].AsInteger := ReemplazarUnidades;
     Params.ByName['MODO_STOCK'].AsInteger := 0;
     Params.ByName['TIPO_INV'].AsInteger := QMCabeceraTIPO_INV.AsInteger;
     Params.ByName['STOCK_FECHA'].AsInteger := QMCabeceraSTOCK_FECHA.AsInteger;
     ExecQuery;
     Loteable := FieldByName['LOTEABLE'].AsInteger;
     Linea := FieldByName['LINEA'].AsInteger;
     IdRegDetalle := FieldByName['ID_REG_DETALLE'].AsInteger;
  end;

  if (Loteable <> 0) then
  begin
     if (not InsercionMasivaLote) then
     begin
        if (not NotasLote) then
        begin
           TFMIntroduceLotes.Create(Self).AsignaArticulo('REG', '', Articulo,
              REntorno.Ejercicio, QMCabeceraRIG.AsInteger,
              Linea, Unidades, QMCabeceraALMACEN.AsString,
              QMCabeceraALMACEN.AsString, QMCabeceraCANAL.AsInteger,
              QMCabeceraCANAL.AsInteger,
              (QMCabeceraESTADO.AsInteger = 0), IdA, IdRegDetalle, 0, False);
        end;
     end
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              AutoTrans := False;
              Transaction := TInsertaArticulo;
              SQL.Add(' INSERT INTO ART_REG_INVENTARIO_LOTES ( ');
              SQL.Add(' ID_REG, ID_REG_DETALLE, EMPRESA, CANAL, RIG, LINEA, ID_A, ARTICULO, LOTE, N_SERIE, CANTIDAD, ALMACEN, STOCK_LOTE, ID_LOTE) ');
              SQL.Add(' VALUES ( ');
              SQL.Add(' :ID_REG, :ID_REG_DETALLE, :EMPRESA, :CANAL, :RIG, :LINEA, :ID_A, :ARTICULO, :LOTE, '''', :CANTIDAD, :ALMACEN, 0, :ID_LOTE) ');
              Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
              Params.ByName['ID_REG_DETALLE'].AsInteger := IdRegDetalle;
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
              Params.ByName['LINEA'].AsInteger := Linea;
              Params.ByName['ID_A'].AsInteger := IdA;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['LOTE'].AsString := '';
              Params.ByName['CANTIDAD'].AsFloat := Unidades;
              Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
              Params.ByName['ID_LOTE'].AsInteger := IdLote;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Traspaso stock y unidades de lotes a linea de inventario
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           AutoTrans := False;
           Transaction := TInsertaArticulo;
           SQL.Add(' UPDATE ART_REG_INVENTARIO_DETALLE I  ');
           SQL.Add(' SET  ');
           SQL.Add(' I.UNIDADES = (SELECT STOCK_LOTE FROM ART_REG_INVENTARIO_LOTES WHERE ID_REG_DETALLE = I.ID_REG_DETALLE), ');
           SQL.Add(' I.STOCK = (SELECT STOCK_LOTE FROM ART_REG_INVENTARIO_LOTES WHERE ID_REG_DETALLE = I.ID_REG_DETALLE) ');
           SQL.Add(' WHERE ');
           SQL.Add(' I.ID_REG = :ID_REG AND ');
           SQL.Add(' I.ID_REG_DETALLE = :ID_REG_DETALLE AND ');
           SQL.Add(' ((SELECT LOTES FROM ART_ARTICULOS WHERE EMPRESA = I.EMPRESA AND ARTICULO = I.ARTICULO) = 1) ');
           Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
           Params.ByName['ID_REG_DETALLE'].AsInteger := IdRegDetalle;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRegInventario.InsertarVariosArticulos(ModoStock: byte);
var
  i, IdA, p, IdLote : integer;
  Articulo, Titulo : string;
  ArticulosATratar, ArticulosTatados, RegistrosTatados, CantidadLotes : integer;
begin
  DMMain.LogIni('InsertarVariosArticulos');

  TInsertaArticulo.StartTransaction;
  with QInsertaArticulo do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'EXECUTE PROCEDURE A_ART_REG_INSERTA_ARTICULO(:EMPRESA, :CANAL, :RIG, :ID_REG, :ID_A, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ALMACEN, :TIPO, :MODO, :FECHA, :REEMPLAZAR_UNIDADES, :MODO_STOCK, :TIPO_INV, :STOCK_FECHA)';
     Prepare;
  end;

  InsercionMasivaLote := True;
  if (Assigned(FMArticulos) or (ModoStock = 4)) then
  begin
     if ((ModoStock = 4) or (Application.MessageBox(PChar(string(_('Se va a proceder a la insercion de todos los artículos filtrados, en ventana de artículos'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes)) then
     begin
        with xArticulos do
        begin
           Close;
           if (ModoStock <> 4) then
           begin
              // Copio SQL de artículos de DMArticulos
              // TableName := FMArticulos.DM.QMArticulos.TableName;
              SelectSQL.Assign(FMArticulos.DM.QMArticulos.SelectSQL);
              // Solo selecciono los campos que necesito
              p := Pos('FROM', UpperCase(SelectSQL.Text));
              SelectSQL.Text := 'SELECT ID_A, TITULO_LARGO, ARTICULO, CONTROL_STOCK, ABIERTO, LOTES ' + Copy(SelectSQL.Text, p, Length(SelectSQL.Text));
              for i := 0 to FMArticulos.DM.QMArticulos.Params.Count - 1 do
                 Params[i].Assign(FMArticulos.DM.QMArticulos.Params[i]);
           end
           else
           begin
              // Hago un Select especial para tomar solo los artículos que han tenido movimientos en el almacén.
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT A.ID_A, A.TITULO_LARGO, A.ARTICULO, A.CONTROL_STOCK, A.ABIERTO, A.LOTES ');
              SelectSQL.Add(' FROM ART_ARTICULOS A ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' A.CONTROL_STOCK = 1 AND ');
              SelectSQL.Add(' A.ABIERTO = 0 AND ');
              SelectSQL.Add(' EXISTS(SELECT MOV.EMPRESA ');
              SelectSQL.Add('        FROM ART_MOV_STOCKS MOV ');
              SelectSQL.Add('        LEFT JOIN ART_STOCKS_ALMACENES ALM ON (MOV.EMPRESA = ALM.EMPRESA AND MOV.CANAL = ALM.CANAL AND MOV.ALMACEN = ALM.ALMACEN) ');
              SelectSQL.Add('        WHERE ');
              SelectSQL.Add('        ALM.EMPRESA_D = A.EMPRESA AND ');
              SelectSQL.Add('        ALM.CANAL_D = :CANAL AND ');
              SelectSQL.Add('        ALM.ALMACEN_D = :ALMACEN AND ');
              SelectSQL.Add('        /* TIPO_OPER = ''E'' AND */ ');
              SelectSQL.Add('        MOV.ARTICULO = A.ARTICULO) ');
              SelectSQL.Add(' ORDER BY A.ARTICULO ');
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
              Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;

              // Inserta todos.
              ModoStock := 0;
           end;
           Open;

           // Averiguo cuantos registros hay
           Last;
           ArticulosATratar := RecordCount;

           // Cierro y abro porque es UniDirectional
           Close;
           Open;

           RegistrosTatados := 0;
           ArticulosTatados := 0;
           // Recorro los artículos
           while (not EOF) do
           begin
              Inc(ArticulosTatados);
              Inc(RegistrosTatados);

              // Solo insertamos los ARTICULOS con CONTROL DE STOCK
              if ((FieldByName('CONTROL_STOCK').AsInteger > 0) and (FieldByName('ABIERTO').AsInteger = 0)) then
              begin
                 // DMMain.LogIni('Articulos' + Articulo);
                 Titulo := FieldByName('TITULO_LARGO').AsString;
                 Articulo := FieldByName('ARTICULO').AsString;
                 IdA := FieldByName('ID_A').AsInteger;
                 CantidadLotes := 0;
                 if (FieldByName('LOTES').AsInteger > 0) then
                 begin
                    // Abrir tabla de lotes del articulo
                    with xLotes do
                    begin
                       Close;
                       Params.ByName['ID_A'].AsInteger := IdA;
                       Open;

                       while (not EOF) do
                       begin
                          Inc(CantidadLotes);
                          Inc(RegistrosTatados);

                          IdLote := FieldByName('ID_LOTE').AsInteger;
                          InsertaArticulo(IdA, Articulo, Titulo, 0, 0, 1, 0, ModoStock, IdLote);

                          if ((CantidadLotes mod 100) = 0) then
                          begin
                             FMRegInventario.Caption := Format(_('Regularización de Stock - Insertado articulos %d de %d (Art+Lot %d)'), [ArticulosTatados, ArticulosATratar, RegistrosTatados]) + ' - ' + _('Lotes') + ' ' + IntToStr(CantidadLotes);
                             Application.ProcessMessages;

                             TInsertaArticulo.Commit;
                             TInsertaArticulo.StartTransaction;
                             QInsertaArticulo.Prepare;
                          end;

                          Next;
                       end;
                       Close;
                    end;
                 end
                 else
                    InsertaArticulo(IdA, Articulo, Titulo, 0, 0, 1, 0, ModoStock, 0);
                 // DMMain.LogFin('Articulo: ' + Articulo + ' - Lotes: ' + IntToStr(CantidadLotes));
              end;

              if ((ArticulosTatados mod 10) = 0) then
              begin
                 FMRegInventario.Caption := Format(_('Regularización de Stock - Insertado articulos %d de %d (Art+Lot %d)'), [ArticulosTatados, ArticulosATratar, RegistrosTatados]);
                 Application.ProcessMessages;
                 if ((ArticulosTatados mod 1000) = 0) then
                 begin
                    TInsertaArticulo.Commit;
                    TInsertaArticulo.StartTransaction;
                    QInsertaArticulo.Prepare;
                 end;
              end;

              Next;
           end;

           TInsertaArticulo.Commit;
           QMCabecera.Refresh;
           Close;
        end;
     end;
  end
  else
  begin
     InsercionMasivaLote := False;
     Application.MessageBox(PChar(string(_('No se puede insertar masivamente articulos con la ventana de articulos cerrada ...'))),
        PChar(string(_('Error'))),
        mb_iconstop);
  end;
  InsercionMasivaLote := False;
  FMRegInventario.Caption := _('Regularización de Stock');

  DMMain.LogIni('RefrescaStock');
  RefrescaStock;
  DMMain.LogFin('RefrescaStock');

  DMMain.LogFin('InsertarVariosArticulos');
end;

procedure TDMRegInventario.EnviarMensaje(u: integer; s, Fichero: string);
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
     DMListados.SendMailPDF(email, BodyMail, DameTempPath + Fichero, Fichero, BodyMail[0], '', 'DLF');
  finally
     BodyMail.Free;
  end;
end;

procedure TDMRegInventario.Cierra;
var
  Continuar : boolean;
  Q : THYFIBQuery;
  s, MyCaption : string;
  usuarios, Fichero : string;
  u : integer;
begin
  MyCaption := FMRegInventario.Caption;
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     s := '';
     if (QMCabeceraTIPO_INV.AsInteger = 0) then
     begin
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT D.ARTICULO, A.TITULO_LARGO, COALESCE(L.LOTE, '''') LOTE ');
                 SelectSQL.Add(' FROM ART_REG_INVENTARIO_DETALLE D ');
                 SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
                 SelectSQL.Add(' LEFT JOIN ART_REG_INVENTARIO_LOTES L ON D.ID_REG_DETALLE = L.ID_REG_DETALLE ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' D.ID_REG = :ID_REG ');
                 SelectSQL.Add(' GROUP BY D.ARTICULO, A.TITULO_LARGO, LOTE ');
                 SelectSQL.Add(' HAVING COUNT(*) > 1 ');
                 Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
                 Open;
                 while not EOF do
                 begin
                    s := s + format(#13#10 + '%s (%s) - %s', [FieldByName('ARTICULO').AsString, FieldByName('LOTE').AsString, FieldByName('TITULO_LARGO').AsString]);
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
     end;

     Continuar := True;
     if (s > '') then
        Continuar := ConfirmaMensajeCaption(_('Estos articulos estan repetidos. Desea cerrar de todos modos?') + #13#10 + s, _('Cerrar'));

     if Continuar then
     begin
        RefrescaStock;

        if (LotesAsignados) then
        begin
           QMDetalle.Last;
           FMRegInventario.Caption := MyCaption + ' ' + Format(_('Cerrando Inventario. Quedan %d lineas.'), [QMDetalle.RecordCount]);
           Application.ProcessMessages;
           Continuar := True;
           while (Continuar) do
           begin
              try
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'EXECUTE PROCEDURE A_ART_REG_INVENTARIO_CIERRA (?ID_REG)';
                       Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
                       TFParada.Create(Self).ExecQuery(Q);
                       Continuar := (FieldByName['TOTAL'].AsInteger > 0);
                       FMRegInventario.Caption := MyCaption + ' ' + Format(_('Cerrando Inventario. Quedan %d lineas.'), [FieldByName['TOTAL'].AsInteger]);
                       Application.ProcessMessages;
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;
              except
                 {Todo : Si falla el cierre, habría que borrar los movimientos manuales generados. ESTO TAMBIEN PUEDE GENERAR EXCEPTIONS!!!}
                 on e: Exception do
                 begin
                    MensajesDeError(e);
                    Continuar := False;
                 end;
              end;
           end;

           QMCabecera.Refresh;
           Application.ProcessMessages;

           usuarios := Trim(LeeParametro('MOVSTCK010', ''));
           if (usuarios > '') then
           begin
              s := format(_('Se ha creado regularizacion de stock %d - %s'), [QMCabeceraRIG.AsInteger, QMCabeceraDESCRIPCION.AsString]);
              s := s + #13#10 + format(_('Regularizacion: %s'), [QMCabeceraDESCRIPCION.AsString]);
              s := s + #13#10 + format(_('Almacen: %s'), [QMCabeceraALMACEN.AsString]);
              s := s + #13#10 + format(_('Usuario %d: %s'), [REntorno.Usuario, DameTituloUsuario(REntorno.Usuario)]);

              AbreData(TDMLstRegInventario, DMLstRegInventario);
              try
                 Fichero := DMLstRegInventario.MostrarListado(DMRegInventario.QMCabeceraID_REG.AsInteger, 2, 655);

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
                 CierraData(DMLstRegInventario);
              end;
           end;
        end
        else
           ShowMessage(_('Falta asignar lotes'));
     end;
  end;
  FMRegInventario.Caption := MyCaption;
end;

procedure TDMRegInventario.Abre;
var
  Q : THYFIBQuery;
begin
  if ((QMCabeceraESTADO.AsInteger = 5) or (QMCabeceraESTADO.AsInteger = 3)) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE A_ART_REG_INVENTARIO_ABRE (?ID_REG)';
           Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     QMCabecera.Refresh;
  end;
end;

procedure TDMRegInventario.EliminaCero;
var
  Q : THYFIBQuery;
begin
  if (QMCabeceraESTADO.AsInteger <> 5) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM ART_REG_INVENTARIO_DETALLE WHERE ID_REG = ?ID_REG AND UNIDADES = 0';
           Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     QMCabecera.Refresh;
  end;
end;

procedure TDMRegInventario.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10100');
end;

procedure TDMRegInventario.BusquedaComplejaDetalle;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMDetalle, '10100');
end;

procedure TDMRegInventario.RefrescaStock;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_REG_INVENTARIO_STOCK (?ID_REG)';
        Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCabecera.Refresh;
end;

procedure TDMRegInventario.RefrescaPrecio;
var
  Precio : double;
  TipoPrecio : integer;
  Fecha : TDateTime;
begin
  /// Tipo Precio
  /// 0 - Precio PMP
  /// 1 - Precio Configuración
  /// 2 - Precio Coste
  /// 3 - Precio Coste Ficha
  TipoPrecio := QMCabeceraTIPO.AsInteger;
  if (TipoPrecio = 1) then
  begin
     if (ParPrecio) then
        TipoPrecio := 2
     else
        TipoPrecio := 0;
  end;

  if (QMCabeceraSTOCK_FECHA.AsInteger = 1) then
     Fecha := QMCabeceraFECHA_MOV.AsDateTime
  else
     Fecha := EncodeDate(3000, 12, 31);

  with QMDetalle do
  begin
     First;
     try
        DisableControls;
        while not (EOF) do
        begin
           if (TipoPrecio = 3) then
              Precio := DMMain.DamePrecioCosteArticulo(QMDetalleARTICULO.AsString)
           else
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT P_COSTE, PMP FROM A_ART_DAME_STOCK2(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA)';
                    // SQL.Text := 'SELECT P_COSTE, PMP FROM A_ART_DAME_STOCK(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL)';
                    Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                    Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
                    Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
                    Params.ByName['FECHA'].AsDateTime := Fecha;
                    ExecQuery;
                    if (TipoPrecio = 0) then
                       Precio := FieldByName['PMP'].AsFloat
                    else
                       Precio := FieldByName['P_COSTE'].AsFloat;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE ART_REG_INVENTARIO_DETALLE SET PRECIO = :PRECIO WHERE ID_REG_DETALLE = :ID_REG_DETALLE';
                 Params.ByName['ID_REG_DETALLE'].AsInteger := QMDetalleID_REG_DETALLE.AsInteger;
                 Params.ByName['PRECIO'].AsFloat := Precio;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMRegInventario.InfoLotes;
var
  id_lote : integer;
begin
  if (CompruebaLotes) then
  begin
     if (QMDetalle.State in [dsInsert, dsEdit]) then
        QMDetalle.Post;

     id_lote := TFMIntroduceLotes.Create(Self).AsignaArticulo('REG', '',
        QMDetalleARTICULO.AsString, REntorno.Ejercicio, QMDetalleRIG.AsInteger,
        QMDetalleLINEA.AsInteger, QMDetalleUNIDADES.AsFloat,
        QMCabeceraALMACEN.AsString,
        QMCabeceraALMACEN.AsString, QMDetalleCANAL.AsInteger,
        QMDetalleCANAL.AsInteger,
        (QMCabeceraESTADO.AsInteger = 0), QMDetalleID_A.AsInteger,
        QMDetalleID_REG_DETALLE.AsInteger, 0, True);

     if (id_lote <> 0) then
     begin
        AsignaLote(DameLote(id_lote), QMDetalleUNIDADES.AsFloat);

        QMDetalle.Refresh;
     end;
  end;
end;

procedure TDMRegInventario.DatosSerializacion(var Serie, Tipo, Almacen, Articulo: string; var Rig, Linea: integer; var Fecha: TDateTime; var Unidades: double; var Estado: integer);
begin
  if QMCabeceraTIPO_INV.AsInteger = 0 then
  begin
     if QMDetalleUNIDADES.AsFloat < QMDetalleSTOCK.AsFloat then
     begin
        Tipo := 'RGS';
        Unidades := (QMDetalleUNIDADES.AsFloat - QMDetalleSTOCK.AsFloat) * (-1);
     end;
     if QMDetalleUNIDADES.AsFloat > QMDetalleSTOCK.AsFloat then
     begin
        Tipo := 'RGE';
        Unidades := QMDetalleUNIDADES.AsFloat - QMDetalleSTOCK.AsFloat;
     end;
     if QMDetalleUNIDADES.AsFloat = QMDetalleSTOCK.AsFloat then
        Unidades := 0;
  end
  else
  begin
     Unidades := QMDetalleUNIDADES.AsFloat;
     if Unidades < 0 then
     begin
        Unidades := Unidades * (-1);
        Tipo := 'RGS';
     end
     else
        Tipo := 'RGE';
  end;

  Serie := QMCabeceraSERIE_MOV.AsString;
  Rig := QMDetalleRIG.AsInteger;
  Linea := QMDetalleLINEA.AsInteger;
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMCabeceraALMACEN.AsString;
  Fecha := QMCabeceraFECHA_MOV.AsDateTime;
  Estado := QMCabeceraESTADO.AsInteger;
end;

function TDMRegInventario.CompruebaLotes: boolean;
begin
  Result := ArticuloLoteable(QMDetalleARTICULO.AsString);
end;

function TDMRegInventario.Serializado: boolean;
begin
  Result := ArticuloSerializado(QMDetalleARTICULO.AsString);
end;

procedure TDMRegInventario.FiltraInventario(Empresa, Ejercicio, Rig: integer; Serie: string);
begin
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM ART_REG_INVENTARIO WHERE EMPRESA = ?EMPRESA AND EJERCICIO_MOV = ?EJERCICIO AND RIG = ?RIG';
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
end;

procedure TDMRegInventario.PreparaSerializacion;
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;
end;

procedure TDMRegInventario.PonerUnidadesACero;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_REG_INVENTARIO_DETALLE SET UNIDADES = ?UNIDADES WHERE ID_REG = ?ID_REG';
        Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
        Params.ByName['UNIDADES'].AsFloat := 0;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCabecera.Refresh;
end;

procedure TDMRegInventario.SetFechaApertura;
var
  Apertura, Cierre : TDateTime;
begin
  DameMinMax('EJE', Apertura, Cierre, REntorno.Empresa, QMCabeceraEJERCICIO_MOV.AsInteger);
  QMCabeceraFECHA_MOV.AsDateTime := Apertura;
end;

procedure TDMRegInventario.DescargaStockTiendaVirtual;
begin
  AbreData(TDMPrestashop, DMPrestashop);
  with QMDetalle do
  begin
     // Primero cargo todas las lineas, para que el SrollBar se mueva
     FetchAll;
     // Recorro todas las lineas buscando el stock de la tienda virtual
     First;
     while not EOF do
     begin
        Edit;
        QMDetalleUNIDADES.AsFloat := DMPrestashop.DameStockTienda(QMDetalleID_A.AsInteger);
        Post;
        Next;
     end;
  end;
  CierraData(DMPrestashop);
end;

procedure TDMRegInventario.QMDetalleUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(CalculaMascara(QMDetalleDECIMALES.AsInteger, True), QMDetalleUNIDADES.AsFloat);
end;

procedure TDMRegInventario.QMDetalleSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(CalculaMascara(QMDetalleDECIMALES.AsInteger, True), QMDetalleSTOCK.AsFloat);
end;

procedure TDMRegInventario.MuestraUbicacion;
var
  Peso, Volumen, Diametro : double;
begin
  if (AlmacenControlaUbicacion and (CompruebaCheckUbicaciones(QMDetalleID_A.AsInteger, Peso, Volumen, Diametro) = 1)) then
  begin
     TFMRegInventarioUbicaciones.Create(Self).MuestraUbiArtic(QMDetalleEMPRESA.AsInteger,
        QMCabeceraEJERCICIO_MOV.AsInteger, QMDetalleCANAL.AsInteger,
        QMDetalleRIG.AsInteger, QMDetalleLINEA.AsInteger,
        QMDetalleID_REG.AsInteger, QMDetalleID_REG_DETALLE.AsInteger,
        QMDetalleID_A.AsInteger, QMCabeceraSERIE_MOV.AsString, QMDetalleUNIDADES.AsFloat);
  end;
end;

procedure TDMRegInventario.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  AlmacenControlaUbicacion := DMMain.CompruebaControlUbicacionAlmacen(QMCabeceraALMACEN.AsString);
end;

procedure TDMRegInventario.MuestraMovimientos;
var
  Empresa, Ejercicio, RIG : integer;
  Serie : string;
begin
  inherited;
  if (QMCabeceraESTADO.AsInteger = 5) then
  begin
     FRegInventarioMovimientos := TFRegInventarioMovimientos.Create(Self);
     try
        xInfoMovimientos.Open;

        if (FRegInventarioMovimientos.ShowModal = mrOk) then
        begin
           if (xInfoMovimientos.RecordCount <> 0) then
           begin
              Empresa := xInfoMovimientosEMPRESA.AsInteger;
              Ejercicio := xInfoMovimientosEJERCICIO.AsInteger;
              Serie := xInfoMovimientosSERIE.AsString;
              RIG := xInfoMovimientosRIG.AsInteger;

              FMain.MuestraMovimiento(Empresa, Ejercicio, RIG, Serie);
           end;
        end;
     finally
        FreeAndNil(FRegInventarioMovimientos);
        xInfoMovimientos.Close;
     end;
  end;
end;

procedure TDMRegInventario.AsignaLote(Lote: string; Cantidad: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO ART_REG_INVENTARIO_LOTES (ID_REG, ID_REG_DETALLE, EMPRESA, CANAL, RIG, LINEA, ID_A, ARTICULO, LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, ');
        SQL.Add('  F_ENVASADO, F_CADUCIDAD, CANTIDAD, ALMACEN, STOCK_LOTE, PROVEEDOR, ID_LOTE) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :ID_REG, :ID_REG_DETALLE, :EMPRESA, :CANAL, :RIG, :LINEA, :ID_A, :ARTICULO, :LOTE, :N_SERIE, :CLASIFICACION, ');
        SQL.Add('  :F_FABRICACION, :F_ENVASADO, :F_CADUCIDAD, :CANTIDAD, :ALMACEN, :STOCK_LOTE, :PROVEEDOR, :ID_LOTE) ');
        Params.ByName['ID_REG'].AsInteger := QMDetalleID_REG.AsInteger;
        Params.ByName['ID_REG_DETALLE'].AsInteger := QMDetalleID_REG_DETALLE.AsInteger;
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
        Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
        Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
        Params.ByName['LOTE'].AsString := Lote;
        Params.ByName['N_SERIE'].AsString := '';
        Params.ByName['CLASIFICACION'].AsString := '';
        Params.ByName['F_FABRICACION'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['F_ENVASADO'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['F_CADUCIDAD'].AsDateTime := REntorno.FechaTrabSH;
        Params.ByName['CANTIDAD'].AsFloat := Cantidad;
        Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
        Params.ByName['STOCK_LOTE'].AsInteger := 0;
        Params.ByName['PROVEEDOR'].AsInteger := -1;
        // Crea el lote y devuelve el ID. Si ya existe, solo devuelve el ID.
        Params.ByName['ID_LOTE'].AsInteger := DMMain.CrearLote(QMDetalleID_A.AsInteger, Lote, '', QMCabeceraALMACEN.AsString);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Traspaso stock y unidades de lotes a linea de inventario
  {
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE ART_REG_INVENTARIO_DETALLE I  ');
        SQL.Add(' SET  ');
        SQL.Add(' I.UNIDADES = (SELECT STOCK_LOTE FROM ART_REG_INVENTARIO_LOTES WHERE ID_REG_DETALLE = I.ID_REG_DETALLE), ');
        SQL.Add(' I.STOCK = (SELECT STOCK_LOTE FROM ART_REG_INVENTARIO_LOTES WHERE ID_REG_DETALLE = I.ID_REG_DETALLE) ');
        SQL.Add(' WHERE ');
        SQL.Add(' I.ID_REG = :ID_REG AND ');
        SQL.Add(' I.ID_REG_DETALLE = :ID_REG_DETALLE AND ');
        SQL.Add(' ((SELECT LOTES FROM ART_ARTICULOS WHERE EMPRESA = I.EMPRESA AND ARTICULO = I.ARTICULO) = 1) ');
        Params.ByName['ID_REG'].AsInteger := QMCabeceraID_REG.AsInteger;
        Params.ByName['ID_REG_DETALLE'].AsInteger := QMDetalleID_REG_DETALLE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  }
end;

procedure TDMRegInventario.AgregaArticulo(id_a: integer; Articulo, Titulo: string; Unidades, Precio: double; Lote: string);
var
  Existe : boolean;
  Loteable : boolean;
  id_lote : integer;
begin
  id_lote := 0;
  Existe := False;
  Loteable := ArticuloLoteable(id_a);

  with QMDetalle do
  begin
     DisableControls;
     try
        // Posiciono el cursor en el ARTICULO-LOTE
        if (Loteable) then
        begin
           // Si es loteable y no tiene lote asignado, le asigno uno.
           if (Lote = '') then
              Lote := 'SIN_LOTE'; // DMMain.DameLoteSiguiente(id_a, QMCabeceraRIG.AsInteger, 'REG', QMCabeceraID_REG.AsInteger)

           // Devuelve el id_lote de un Lote. Si no existe lo crea.
           id_lote := DMMain.CrearLote(id_a, Lote);
           Lote := DameLote(id_lote);

           First;
           while ((not EOF) and (not Existe)) do
           begin
              if ((QMDetalleARTICULO.AsString = Articulo) and (QMDetalleID_LOTE.AsInteger = id_lote)) then
                 Existe := True
              else
                 Next;
           end;
        end
        else
        begin
           // Si NO es loteable y tiene lote asignado, se lo quito.
           if (Lote <> '') then
              Lote := '';

           // Busco una linea con el articulo a importar
           First;
           while ((not EOF) and (not Existe)) do
           begin
              if (QMDetalleARTICULO.AsString = Articulo) then
                 Existe := True
              else
                 Next;
           end;
        end;

        if (Existe) then
        begin
           Edit;
           QMDetalleUNIDADES.AsFloat := DMRegInventario.QMDetalleUNIDADES.AsFloat + Unidades;

           if (Precio <> 0) then
              QMDetallePRECIO.AsFloat := Precio;
           Post;
        end
        else
        begin
           Insert;
           QMDetalleID_A.AsInteger := id_a;
           QMDetalleARTICULO.AsString := Articulo;
           QMDetalleUNIDADES.AsFloat := Unidades;
           if (Precio <> 0) then
              QMDetallePRECIO.AsFloat := Precio;
           Post;

           // Si tiene lote lo asigno a esta linea (creada o modificada)
           if ((Loteable) and (id_lote <> 0)) then
           begin
              // Insertar registro en ART_REG_INVENTARIO_LOTES
              DMRegInventario.AsignaLote(Lote, Unidades);
           end;
        end;

        // Se necesita para refrescar el ID_LOTE asignado a la linea.
        Refresh;
     finally
        EnableControls;
     end;
  end;
end;

function TDMRegInventario.LotesAsignados: boolean;
var
  MyCaption : string;
begin
  MyCaption := FMRegInventario.Caption;
  with QMDetalle do
  begin
     DisableControls;
     try
        Last;
        FMRegInventario.Caption := MyCaption + ' ' + Format(_('Verificando lotes. Quedan %d lineas.'), [QMDetalle.RecordCount]);
        Result := True;
        First;
        while ((not EOF) and Result) do
        begin
           if (ArticuloLoteable(QMDetalleID_A.AsInteger) and (QMDetalleID_LOTE.AsInteger = 0)) then
              Result := False
           else
              Next;
           FMRegInventario.Caption := MyCaption + ' ' + Format(_('Verificando lotes. Quedan %d lineas.'), [QMDetalle.RecordCount - QMDetalle.RecNo]);
           Application.ProcessMessages;
        end;
     finally
        EnableControls;
     end;
  end;
  FMRegInventario.Caption := MyCaption;
end;

procedure TDMRegInventario.AsignaLoteComponente;
var
  Lote : string;
begin
  // Buscamos nuevo lote a asignar
  Lote := DMMain.DameLoteSiguiente(QMDetalleID_A.AsInteger, QMCabeceraRIG.AsInteger, 'REG', QMCabeceraID_REG.AsInteger);
  // Creamos lote
  AsignaLote(Lote, QMDetalleUNIDADES.AsFloat);
  QMDetalle.Refresh;
end;

procedure TDMRegInventario.FiltrarDetalle(Articulo: string);
var
  Orden : string;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        Orden := OrdenadoPor;
        Ordenar('');
        if Active then
           Close;
        SelectSQL.Text := SQLDetalleBase.Text;

        if (Trim(Articulo) > '') then
           SelectSQL.Add(' AND ARTICULO = ?ARTICULO ');

        if (Trim(Articulo) > '') then
           Params.ByName['ARTICULO'].AsString := Articulo;

        Ordenar(Orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMRegInventario.DameSqlImpresionEtiquetas(Articulo: string; SQL: TStrings);
begin
  /// Genera SQL para rellenar ART_IMPRESION_CB_DETALLE con los articulos filtrados.
  /// Contiene el parametro NUMERO que sera utilizado dentro de UDMImprimircodBarras.

  with SQL do
  begin
     Clear;
     Add(' INSERT INTO ART_IMPRESION_CB_DETALLE ');
     Add(' (EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, ARTICULO, ID_DETALLE_DOC, COD_BARRAS, TIPO, NUM_COPIAS, FECHA, ALFA_6, ID_LOTE, UNIDADES) ');
     Add(' SELECT D.EMPRESA,' + IntToStr(QMCabeceraEJERCICIO_MOV.AsInteger) + ', D.CANAL, :NUMERO, D.LINEA, D.ARTICULO, D.ID_REG_DETALLE, ');
     Add(' (SELECT FIRST 1 BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = D.EMPRESA AND ARTICULO = D.ARTICULO ORDER BY TIPO DESC), ');
     Add(' (SELECT FIRST 1 TIPO   FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = D.EMPRESA AND ARTICULO = D.ARTICULO ORDER BY TIPO DESC), ');
     // Obtenemos la cantidad de etiquetas a imprimir
     if (Param_ALBETIQ001 <> 0) then
        Add(format(' %d, ', [Param_ALBETIQ001]))
     else
        Add(' D.UNIDADES, ');
     Add(' D.FECHA_CREACION, D.ALFA_6, D.ID_LOTE, D.UNIDADES ');
     Add(' FROM VER_ART_REG_INVENTARIO_DETALLE D');
     Add(' WHERE ');
     Add(' D.ID_REG = ' + IntToStr(QMCabeceraID_REG.AsInteger));
     if (Trim(Articulo) > '') then
        Add(' AND D.ARTICULO = ''' + Articulo + ''' ');
     { Envio todas las lineas. Lo utiliza JVV para imprimir etiquetas con lote y ubicacion, sin utilizar codigo de barras.
     Add(' AND (EXISTS(SELECT BARRAS ');
     Add('             FROM ART_ARTICULOS_BARRAS ');
     Add('             WHERE ');
     Add('             EMPRESA = D.EMPRESA AND ');
     Add('             ARTICULO = D.ARTICULO)) ');
     }
     Add(' ORDER BY D.LINEA ');
  end;
end;

function TDMRegInventario.EliminaLoteDetalleInventario(id_reg_detalle: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM ART_REG_INVENTARIO_LOTES WHERE ID_REG_DETALLE = :ID_REG_DETALLE';
        Params.ByName['ID_REG_DETALLE'].AsInteger := id_reg_detalle;
        ExecQuery;
        Result := True;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRegInventario.QMDetalleALMACENGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := QMCabeceraALMACEN.AsString;
end;

procedure TDMRegInventario.TraspasoMovimientoStock;
var
  Almacen : string;
begin
  { TODO : Unificar esto en una función }
  (*
  Si se modifica esto modificar también:
  - DMRegInventario.TraspasoMovimientoStock;
  - DMAlbaranes.TraspasoMovimientoStock;
  *)

  if (UFMSeleccion.PideDato('ALM', Almacen, _('Almacen de entrada'), 'ACTIVO=1')) then
  begin
     // Abro Movimientos Manuales de Stock
     FMain.EjecutaAccion(FMain.AMvStMan);

     // Creo cabecera
     DMMovManStock.QMCabecera.Insert;
     DMMovManStock.QMCabeceraEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
     DMMovManStock.QMCabeceraEJERCICIO.AsInteger := QMCabeceraEJERCICIO_MOV.AsInteger;
     DMMovManStock.QMCabeceraSERIE.AsString := QMCabeceraSERIE_MOV.AsString;
     DMMovManStock.QMCabeceraFECHA.AsDateTime := REntorno.FechaTrab;
     DMMovManStock.QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
     DMMovManStock.QMCabeceraALMACEN_DST.AsString := Almacen;
     DMMovManStock.QMCabeceraCANAL_DST.AsInteger := QMCabeceraCANAL.AsInteger;
     DMMovManStock.QMCabeceraTIPO_OPERACION.AsString := 'E';
     DMMovManStock.QMCabeceraCOMENTARIO.AsString := Copy(Format(_('%s %s/%d - %s'), ['INV', QMCabeceraSERIE_MOV.AsString, QMCabeceraRIG.AsInteger, QMCabeceraDESCRIPCION.AsString]), 1, 40);
     DMMovManStock.QMCabecera.Post;

     // Recorro detalle de Albaran creando detalle de Movimiento Manual de Stock
     QMDetalle.First;
     while not QMDetalle.EOF do
     begin
        // Solo tiene en cuenta un lote. Si hay multiples lotes por linea, modificar origen de datos.
        DMMovManStock.Inserta(QMDetalleARTICULO.AsString, QMDetalleUNIDADES.AsFloat, QMDetalleLOTE.AsString, 0, QMDetallePRECIO.AsFloat, '', 0);
        QMDetalle.Next;
     end;

     DMMovManStock.AbreCierra(5);
  end;
end;

procedure TDMRegInventario.InsertaModelo(Modelo: string);
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
           SelectSQL.Add(' SELECT AM.ID_A_M, AMC.ID_A_M_C, AMCT.ID_A_M_C_T, A.ID_A, A.ARTICULO, A.TITULO_LARGO, A.LOTES, L.ID_LOTE, L.LOTE ');
           SelectSQL.Add(' FROM ART_ARTICULOS_MODELOS AM ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ON AM.ID_A_M = AMC.ID_A_M ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON AMC.ID_A_M_C = AMCT.ID_A_M_C ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON AMCT.ID_A_M_C_T = A.ID_A_M_C_T ');
           SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_LOTES L ON A.ID_A = L.ID_A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' AM.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' AM.REF_PROVEEDOR = :REF_PROVEEDOR ');
           SelectSQL.Add(' ORDER BY A.ARTICULO, L.LOTE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['REF_PROVEEDOR'].AsString := Modelo;
           Open;
           while not EOF do
           begin
              AgregaArticulo(FieldByName('ID_A').AsInteger, FieldByName('ARTICULO').AsString, FieldByName('TITULO_LARGO').AsString, 0, 0, FieldByName('LOTE').AsString);
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
end;

procedure TDMRegInventario.ModificaValorALFA(Alfa: integer; Articulo, Valor: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_ARTICULOS SET ALFA_' + IntToStr(Alfa) + ' = :ALFA WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['ALFA'].AsString := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRegInventario.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMRegInventario.QMCabeceraBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMRegInventario.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMRegInventario.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMRegInventario.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

end.
