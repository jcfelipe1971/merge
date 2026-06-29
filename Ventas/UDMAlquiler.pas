unit UDMAlquiler;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, DBClient;

type
  TDMAlquiler = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMAqluiler: TFIBTableSet;
     DSQMAqluiler: TDataSource;
     QMAqluilerEMPRESA: TIntegerField;
     QMAqluilerCANAL: TIntegerField;
     QMAqluilerID_ALQ: TIntegerField;
     QMAqluilerID_S_PEC: TIntegerField;
     QMAqluilerPEDIDO: TFIBStringField;
     QMAqluilerESTADO_PEDIDO: TIntegerField;
     QMAqluilerALBARAN: TFIBStringField;
     QMAqluilerESTADO_ALBARAN: TIntegerField;
     QMAqluilerID_S_ALB: TIntegerField;
     QMAqluilerEJERCICIO_ALBARAN: TIntegerField;
     QMAqluilerSERIE_ALBARAN: TFIBStringField;
     xCuotas: TFIBTableSet;
     DSCuotas: TDataSource;
     xCuotasEMPRESA: TIntegerField;
     xCuotasCLIENTE: TIntegerField;
     xCuotasCUOTA: TIntegerField;
     xCuotasTERCERO: TIntegerField;
     xCuotasARTICULO: TFIBStringField;
     xCuotasDESCRIPCION: TFIBStringField;
     xCuotasNOTAS: TBlobField;
     xCuotasIMPORTE: TFloatField;
     xCuotasSUPLIDO: TIntegerField;
     xCuotasDESCUENTO: TFloatField;
     xCuotasPERIODICIDAD: TIntegerField;
     xCuotasDIAS: TIntegerField;
     xCuotasFECHA_ULT_CUOTA: TDateTimeField;
     xCuotasFECHA_PROX_CUOTA: TDateTimeField;
     xCuotasSERIE_ULT_CUOTA: TFIBStringField;
     xCuotasTIPO_DOC: TFIBStringField;
     xCuotasAGRUPADA: TIntegerField;
     xCuotasRIG_DOC: TIntegerField;
     xCuotasID_A: TIntegerField;
     xCuotasID_S: TIntegerField;
     xCuotasID_S_D: TIntegerField;
     xCuotasFECHA_FIN_CUOTA: TDateTimeField;
     xCuotasUNIDADES: TFloatField;
     xCuotasCANAL: TIntegerField;
     xCuotasID_ORIGEN: TIntegerField;
     xCuotasTIPO_ORIGEN: TFIBStringField;
     xCuotaDetalle: TFIBTableSet;
     DSCuotaDetalle: TDataSource;
     xCuotaDetalleEMPRESA: TIntegerField;
     xCuotaDetalleCLIENTE: TIntegerField;
     xCuotaDetalleCUOTA: TIntegerField;
     xCuotaDetalleLINEA: TIntegerField;
     xCuotaDetalleTERCERO: TIntegerField;
     xCuotaDetalleARTICULO: TFIBStringField;
     xCuotaDetalleDESCRIPCION: TFIBStringField;
     xCuotaDetalleIMPORTE: TFloatField;
     xCuotaDetalleDESCUENTO: TFloatField;
     xCuotaDetalleSUPLIDO: TIntegerField;
     xCuotaDetalleFECHA: TDateTimeField;
     xCuotaDetalleTIPO_DOC: TFIBStringField;
     xCuotaDetalleAGRUPADA: TIntegerField;
     xCuotaDetallePROCESADA: TIntegerField;
     xCuotaDetalleID_A: TIntegerField;
     xCuotaDetalleID_S: TIntegerField;
     xCuotaDetalleID_S_D: TIntegerField;
     xCuotaDetalleUNIDADES: TFloatField;
     xCuotaDetalleCANAL: TIntegerField;
     xAlquilerRevision: TFIBTableSet;
     DSAlquilerRevision: TDataSource;
     xAlquilerRevisionID_ALQ: TIntegerField;
     xAlquilerRevisionID_S_ALB: TIntegerField;
     xAlquilerRevisionALBARAN: TFIBStringField;
     xAlquilerRevisionFECHA: TDateTimeField;
     xAlquilerRevisionDEVOLUCION: TIntegerField;
     xAlquilerRevisionNUM_MOV_DEPOSITO: TIntegerField;
     xAlquilerRevisionALMACEN_DEPOSITO: TFIBStringField;
     xNrosSerie: TFIBTableSet;
     DSNrosSerie: TDataSource;
     xNrosSerieEMPRESA: TIntegerField;
     xNrosSerieCANAL: TIntegerField;
     xNrosSerieCODIGO: TIntegerField;
     xNrosSerieNSERIE: TFIBStringField;
     xNrosSerieARTICULO: TFIBStringField;
     xNrosSerieALMACEN: TFIBStringField;
     xNrosSerieESTADO: TIntegerField;
     xNrosSerieFECHA_CADUCIDAD: TDateTimeField;
     xNrosSerieFECHA_GARANTIA_CLIENTE: TDateTimeField;
     xNrosSerieFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     xNrosSerieNOTAS: TBlobField;
     xNrosSerieDEVUELTO_PROV: TIntegerField;
     xNrosSerieCONTADOR: TIntegerField;
     xNrosSerieACTIVO: TIntegerField;
     xNrosSerieCLIENTE_REPARACION: TIntegerField;
     xNrosSerieEMPRESA1: TIntegerField;
     xNrosSerieEJERCICIO: TIntegerField;
     xNrosSerieCANAL1: TIntegerField;
     xNrosSerieSERIE: TFIBStringField;
     xNrosSerieTIPO: TFIBStringField;
     xNrosSerieRIG: TIntegerField;
     xNrosSerieLINEA: TIntegerField;
     xNrosSerieCODIGO1: TIntegerField;
     xNrosSerieALMACEN1: TFIBStringField;
     xNrosSerieFECHA: TDateTimeField;
     xNrosSerieSIGNO: TIntegerField;
     xNrosSerieTRASPASADO: TIntegerField;
     xNrosSerieID_GDS: TIntegerField;
     xNrosSerieTIPO_MOV: TFIBStringField;
     xNrosSerieID_DOC: TIntegerField;
     TmpNrosSerie: TClientDataSet;
     TmpNrosSerieEMPRESA: TIntegerField;
     TmpNrosSerieCANAL: TIntegerField;
     TmpNrosSerieCODIGO: TIntegerField;
     TmpNrosSerieALMACEN: TStringField;
     TmpNrosSerieARTICULO: TStringField;
     TmpNrosSerieNSERIE: TStringField;
     DSTmpNroSerie: TDataSource;
     QMAqluilerUNIDADES_SERIALIZADAS: TFloatField;
     QMAqluilerFECHA_FIN_CUOTA: TDateTimeField;
     QMAqluilerCLIENTE: TIntegerField;
     QMAqluilerNOMBRE_R_SOCIAL: TFIBStringField;
     QMAqluilerALMACEN_DEPOSITO: TFIBStringField;
     QMAqluilerFECHA_PROX_CUOTA: TDateTimeField;
     TmpNrosSerieSELECCIONADO: TIntegerField;
     TmpNrosSerieUNIDADES: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAqluilerAfterOpen(DataSet: TDataSet);
     procedure QMAqluilerBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMAqluilerAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure FiltraAlquiler(Filtro: string);
     procedure Refresca;
     function CreaAlabaranRevision: integer;
     function GeneraAlbaranDeposito: integer;
     function GeneraAlbaranDevolucionDeposito: integer;
     procedure CalculaCuotas;
     procedure ActualizarNrosSerie;
     procedure GenerarDeposito;
  end;

var
  DMAlquiler : TDMAlquiler;

implementation

uses
  UDMMain, UUtiles, UEntorno, HYFIBQuery, Dialogs, Variants, UDameDato;

{$R *.dfm}

procedure TDMAlquiler.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  SQLBase := TStringList.Create;
  SQLBase.Text := QMAqluiler.SelectSQL.Text;

  xCuotasFECHA_ULT_CUOTA.DisplayFormat := ShortDateFormat;
  xCuotasFECHA_PROX_CUOTA.DisplayFormat := ShortDateFormat;
  xCuotasFECHA_FIN_CUOTA.DisplayFormat := ShortDateFormat;
  xCuotasIMPORTE.DisplayFormat := MascaraN;
  xCuotasUNIDADES.DisplayFormat := MascaraN;

  xCuotaDetalleFECHA.DisplayFormat := ShortDateFormat;
  xCuotaDetalleIMPORTE.DisplayFormat := MascaraN;
  xCuotaDetalleUNIDADES.DisplayFormat := MascaraN;

  xAlquilerRevisionFECHA.DisplayFormat := ShortDateFormat;

  TmpNrosSerie.CreateDataSet;

  DMMain.FiltraTabla(QMAqluiler, '10100', True);
end;

procedure TDMAlquiler.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMAlquiler.FiltraAlquiler(Filtro: string);
begin
  with QMAqluiler do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     if (Filtro > '') then
        SelectSQL.Add(' AND ' + Filtro);
  end;

  DMMain.FiltraTabla(QMAqluiler, '10100', True);
end;

procedure TDMAlquiler.Refresca;
begin
  Refrescar(QMAqluiler, 'ID_ALQ', QMAqluilerID_ALQ.AsInteger);
  ActualizarNrosSerie;
end;

procedure TDMAlquiler.QMAqluilerAfterOpen(DataSet: TDataSet);
begin
  xCuotas.Open;
  xCuotaDetalle.Open;
  xAlquilerRevision.Open;
  xNrosSerie.Open;
end;

procedure TDMAlquiler.QMAqluilerBeforeClose(DataSet: TDataSet);
begin
  xCuotas.Close;
  xCuotaDetalle.Close;
  xAlquilerRevision.Close;
  xNrosSerie.Close;
end;

function TDMAlquiler.CreaAlabaranRevision: integer;
begin
  // Crea un albaran en el que se retiran los numeros de serie y se asignan nuevos.
  // Devuelve ID_S del albaran

  // Cabecera de Albaran.
  Result := DMMain.ContadorGen('ID_GES_CABECERAS_S');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO VER_CABECERAS_ALBARAN ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, ALMACEN, MONEDA, FECHA, TERCERO, DIRECCION, CLIENTE, CONTACTO, ');
        SQL.Add(' SU_REFERENCIA, FORMA_PAGO, CAMPANYA, AGENTE, DTO_PP, DTO_CIAL, POR_FINANCIACION, ENTRADA, TRANSPORTISTA, PORTES, ');
        SQL.Add(' TARIFA, IDIOMA, TIPO_PORTES, POR_PORTES, I_PORTES, I_PORTES_CANAL, RANGO, INDICE, CAMBIO_FIJO, VALOR_CAMB_FIJO, ');
        SQL.Add(' PROYECTO) ');
        SQL.Add(' SELECT EMPRESA, :EJERCICIO, CANAL, SERIE, ''ALB'', 0, :ID_S, :ALMACEN, MONEDA, :FECHA, TERCERO, DIRECCION, CLIENTE, ');
        SQL.Add('        CONTACTO, :SU_REFERENCIA, FORMA_PAGO, CAMPANYA, AGENTE, DTO_PP, DTO_CIAL, POR_FINANCIACION, :ENTRADA, ');
        SQL.Add('        TRANSPORTISTA, PORTES, TARIFA, IDIOMA, TIPO_PORTES, POR_PORTES, I_PORTES, I_PORTES_CANAL, RANGO, INDICE, ');
        SQL.Add('        CAMBIO_FIJO, VALOR_CAMB_FIJO, PROYECTO ');
        SQL.Add(' FROM VER_CABECERAS_PEDIDO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S_PEC ');
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['ID_S'].AsInteger := Result;
        Params.ByName['ALMACEN'].AsString := QMAqluilerALMACEN_DEPOSITO.AsString;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['SU_REFERENCIA'].AsString := _('Revision');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_S_PEC'].AsInteger := QMAqluilerID_S_PEC.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Creo registro de relacion con el alquiler
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO EMP_ALQUILER_REV (ID_ALQ, ID_S_ALB) VALUES (:ID_ALQ, :ID_S_ALB)';
        Params.ByName['ID_ALQ'].AsInteger := QMAqluilerID_ALQ.AsInteger;
        Params.ByName['ID_S_ALB'].AsInteger := Result;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAlquiler.GeneraAlbaranDeposito: integer;
var
  Empresa, Ejercicio, Canal, RIG : integer;
  Serie : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, RIG FROM GES_CABECERAS_S WHERE ID_S = :ID_S_PEC';
        Params.ByName['ID_S_PEC'].AsInteger := QMAqluilerID_S_PEC.AsInteger;
        ExecQuery;
        Empresa := FieldByName['EMPRESA'].AsInteger;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Serie := FieldByName['SERIE'].AsString;
        RIG := FieldByName['RIG'].AsInteger;
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
        SQL.Text := 'EXECUTE PROCEDURE G_DOC_S_DUPLICA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ENTRADA, :D_EJERCICIO, :FECHA, :NREFERENCIA, :ID_S, :RELACIONA, :TIPO_DOC_TRIBUTARIO_DESTINO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'ALB';
        Params.ByName['RIG'].AsInteger := RIG;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        // Obtenemos el ejercicio desde la fecha
        Params.ByName['D_EJERCICIO'].AsInteger := DameEjercicio(Empresa, REntorno.FechaTrab);
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['NREFERENCIA'].AsString := _('Deposito');
        Params.ByName['ID_S'].AsInteger := QMAqluilerID_S_PEC.AsInteger;
        Params.ByName['RELACIONA'].AsInteger := 0;
        Params.ByName['TIPO_DOC_TRIBUTARIO_DESTINO'].AsString := ''; // Para generar un DTE en Chile
        ExecQuery;
        Result := FieldByName['ID_S_DESTINO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Creo registro de relacion con el alquiler
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO EMP_ALQUILER_REV (ID_ALQ, ID_S_ALB, DEVOLUCION) VALUES (:ID_ALQ, :ID_S_ALB, 0)';
        Params.ByName['ID_ALQ'].AsInteger := QMAqluilerID_ALQ.AsInteger;
        Params.ByName['ID_S_ALB'].AsInteger := Result;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAlquiler.GeneraAlbaranDevolucionDeposito: integer;
var
  Empresa, Ejercicio, Canal, RIG, Linea, IdSDevolucion : integer;
  Serie, Almacen : string;
begin
  // Ya tienen que estar seleccionados los nros de serie a devolver

  // Crear cabecera de devolucion
  IdSDevolucion := DMMain.ContadorGen('ID_GES_CABECERAS_S');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO VER_CABECERAS_ALBARAN ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ALMACEN, MONEDA, FECHA, TERCERO, DIRECCION, CLIENTE, CONTACTO, ');
        SQL.Add(' SU_REFERENCIA, FORMA_PAGO, CAMPANYA, NOTAS, ESTADO, AGENTE, DTO_PP, DTO_CIAL, ENTRADA, TRANSPORTISTA, PORTES, TARIFA, ');
        SQL.Add(' ID_S, AGRUPACION_KRI, IDIOMA, TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE, CAMBIO_FIJO, VALOR_CAMB_FIJO, PROYECTO, ');
        SQL.Add(' NOTAS_INTERNAS_KRI, TIPO_LINEA_KRI, PEDIDO_CLIENTE, ALBARAN_VALORADO, DEVOLUCION_DEPOSITO) ');
        SQL.Add(' SELECT EMPRESA, :EJERCICIO, CANAL, SERIE, ''ALB'', 0, ALMACEN, MONEDA, :FECHA, TERCERO, DIRECCION, CLIENTE, CONTACTO, ');
        SQL.Add(' ''DEVOLUCION MATERIAL'', FORMA_PAGO, CAMPANYA, NOTAS, 0, AGENTE, DTO_PP, DTO_CIAL, :ENTRADA, TRANSPORTISTA, PORTES, ');
        SQL.Add(' TARIFA, :ID_S, AGRUPACION_KRI, IDIOMA, TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE, CAMBIO_FIJO, ');
        SQL.Add(' VALOR_CAMB_FIJO, PROYECTO, NOTAS_INTERNAS_KRI, TIPO_LINEA_KRI, PEDIDO_CLIENTE, 0, 1 ');
        SQL.Add(' FROM VER_CABECERAS_PEDIDO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S_ORIGEN ');
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(REntorno.Empresa, REntorno.FechaTrab);
        Params.ByName['ID_S'].AsInteger := IdSDevolucion;
        Params.ByName['ID_S_ORIGEN'].AsInteger := QMAqluilerID_S_PEC.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Datos del albaran
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, RIG, ALMACEN FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := IdSDevolucion;
        ExecQuery;
        Empresa := FieldByName['EMPRESA'].AsInteger;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Serie := FieldByName['SERIE'].AsString;
        RIG := FieldByName['RIG'].AsInteger;
        Almacen := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Recorro los nros de serie y los agrego al documento de devoulcion
  with TmpNrosSerie do
  begin
     First;
     while not EOF do
     begin
        if (FieldByName('SELECCIONADO').AsInteger = 1) then
        begin
           // Creo una linea para el articulo
           Linea := DMMain.DameLineaSiguiente('ALB', IdSDevolucion);
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO VER_DETALLE_ALBARAN ( ');
                 SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ALMACEN, ARTICULO, UNIDADES, ENTRADA, ID_DETALLES_S, ID_S, ');
                 SQL.Add(' TIPO_UNIDAD_LOGISTICA, TITULO) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ALMACEN, :ARTICULO, :UNIDADES, :ENTRADA, :ID_DETALLES_S, ');
                 SQL.Add(' :ID_S, ');
                 SQL.Add(' (SELECT TIPO ');
                 SQL.Add('  FROM ART_ARTICULOS_UNIDAD_LOGISTICA ');
                 SQL.Add('  WHERE ');
                 SQL.Add('  EMPRESA = :EMPRESA AND ');
                 SQL.Add('  ARTICULO = :ARTICULO AND ');
                 SQL.Add('  DEFECTO = 1), ');
                 SQL.Add(' (SELECT TITULO_ARGO ');
                 SQL.Add('  FROM ART_ARTICULOS ');
                 SQL.Add('  WHERE ');
                 SQL.Add('  EMPRESA = :EMPRESA AND ');
                 SQL.Add('  ARTICULO = :ARTICULO)) ');

                 Params.ByName['EMPRESA'].AsInteger := Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := Canal;
                 Params.ByName['SERIE'].AsString := Serie;
                 Params.ByName['TIPO'].AsString := 'ALB';
                 Params.ByName['RIG'].AsInteger := RIG;
                 Params.ByName['LINEA'].AsInteger := Linea;
                 Params.ByName['ALMACEN'].AsString := Almacen;
                 Params.ByName['ARTICULO'].AsString := TmpNrosSerie.FieldByName('ARTICULO').AsString;
                 Params.ByName['UNIDADES'].AsInteger := -1;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['ID_DETALLES_S'].AsInteger := DMMain.ContadorGen('ID_GES_DETALLES_S');
                 ;
                 Params.ByName['ID_S'].AsInteger := IdSDevolucion;

                 ExecQuery;

                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Asingo el numero de serie
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO GES_DETALLES_SERIALIZACION ( ');
                 SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, CODIGO, ALMACEN, FECHA) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :CODIGO, :ALMACEN, :FECHA) ');
                 Params.ByName['EMPRESA'].AsInteger := Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := Canal;
                 Params.ByName['SERIE'].AsString := Serie;
                 Params.ByName['TIPO'].AsString := 'ALB';
                 Params.ByName['RIG'].AsInteger := RIG;
                 Params.ByName['LINEA'].AsInteger := Linea;
                 Params.ByName['ALMACEN'].AsString := Almacen;
                 Params.ByName['CODIGO'].AsInteger := TmpNrosSerie.FieldByName('CODIGO').AsInteger;
                 Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        Next;
     end;

     First;
  end;

  // Creo registro de relacion con el alquiler
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO EMP_ALQUILER_REV (ID_ALQ, ID_S_ALB, DEVOLUCION) VALUES (:ID_ALQ, :ID_S_ALB, 1)';
        Params.ByName['ID_ALQ'].AsInteger := QMAqluilerID_ALQ.AsInteger;
        Params.ByName['ID_S_ALB'].AsInteger := IdSDevolucion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := IdSDevolucion;
end;

procedure TDMAlquiler.CalculaCuotas;
begin
  /// Calcula y genera cuotas hasta la fecha de trabajo

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CALCULA_CUOTAS_CLIENTE(?EMPRESA, ?CANAL, ?FECHA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

{
SELECT SS.*, S.*
FROM EMP_ALQUILER A
JOIN EMP_ALQUILER_REV R ON A.ID_ALQ = R.ID_ALQ
JOIN GES_CABECERAS_S C ON R.ID_S_ALB = C.ID_S
JOIN GES_CABECERAS_S_ALB CA ON C.ID_S = CA.ID_S
JOIN GES_CABECERAS_ST CS ON CA.EMPRESA = CS.EMPRESA AND CA.EJERCICIO = CS.EJERCICIO AND CA.SERIE = CS.SERIE AND CA.NUM_MOV_DEPOSITO = CS.RIG
JOIN GES_DETALLES_SERIALIZACION S ON S.EMPRESA = CS.EMPRESA AND S.EJERCICIO = CS.EJERCICIO AND S.SERIE = CS.SERIE AND S.RIG = CA.NUM_MOV_DEPOSITO AND ((S.TIPO = 'MVE') OR (S.TIPO = 'MVS'))
JOIN ART_ARTICULOS_SERIALIZACION SS ON S.EMPRESA = SS.EMPRESA AND S.CANAL = SS.CANAL AND S.ALMACEN = SS.ALMACEN AND S.CODIGO = SS.CODIGO
WHERE
ID_ALQ = :ID_ALQ
ORDER BY S.FECHA DESC
}
procedure TDMAlquiler.QMAqluilerAfterScroll(DataSet: TDataSet);
begin
  ActualizarNrosSerie;
end;

procedure TDMAlquiler.ActualizarNrosSerie;
begin
  // Calculo los numeros de serie que tiene el cliente en deposito

  // Borro contenido
  with TmpNrosSerie do
  begin
     First;
     while not EOF do
        Delete;
  end;

  with xNrosSerie do
  begin
     DisableControls;
     try
        // Calculo nros de serie activos
        Last;
        while not BOF do
        begin
           if TmpNrosSerie.Locate('EMPRESA;CANAL;CODIGO;ALMACEN', VarArrayOf([FieldByName('EMPRESA').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('ALMACEN').AsString]), []) then
           begin
              if (FieldByName('TIPO').AsString = 'MVE') then
              begin
                 if (TmpNrosSerie.FieldByName('UNIDADES').AsFloat = -1) then
                    TmpNrosSerie.Delete
                 else
                 begin
                    TmpNrosSerie.Edit;
                    TmpNrosSerie.FieldByName('UNIDADES').AsFloat := TmpNrosSerie.FieldByName('UNIDADES').AsFloat + 1;
                    TmpNrosSerie.Post;
                 end;
              end
              else
              if (FieldByName('TIPO').AsString = 'MVS') then
              begin
                 if (TmpNrosSerie.FieldByName('UNIDADES').AsFloat = 1) then
                    TmpNrosSerie.Delete
                 else
                 begin
                    TmpNrosSerie.Edit;
                    TmpNrosSerie.FieldByName('UNIDADES').AsFloat := TmpNrosSerie.FieldByName('UNIDADES').AsFloat - 1;
                    TmpNrosSerie.Post;
                 end;
              end;
           end
           else
           begin
              if (FieldByName('TIPO').AsString = 'MVE') then
              begin
                 TmpNrosSerie.Append;
                 TmpNrosSerie.FieldByName('EMPRESA').AsInteger := FieldByName('EMPRESA').AsInteger;
                 TmpNrosSerie.FieldByName('CANAL').AsInteger := FieldByName('CANAL').AsInteger;
                 TmpNrosSerie.FieldByName('CODIGO').AsInteger := FieldByName('CODIGO').AsInteger;
                 TmpNrosSerie.FieldByName('ALMACEN').AsString := FieldByName('ALMACEN').AsString;
                 TmpNrosSerie.FieldByName('ARTICULO').AsString := FieldByName('ARTICULO').AsString;
                 TmpNrosSerie.FieldByName('NSERIE').AsString := FieldByName('NSERIE').AsString;
                 TmpNrosSerie.FieldByName('SELECCIONADO').AsInteger := 0;
                 TmpNrosSerie.FieldByName('UNIDADES').AsInteger := 1;
                 TmpNrosSerie.Post;
              end;
              if (FieldByName('TIPO').AsString = 'MVS') then
              begin
                 TmpNrosSerie.Append;
                 TmpNrosSerie.FieldByName('EMPRESA').AsInteger := FieldByName('EMPRESA').AsInteger;
                 TmpNrosSerie.FieldByName('CANAL').AsInteger := FieldByName('CANAL').AsInteger;
                 TmpNrosSerie.FieldByName('CODIGO').AsInteger := FieldByName('CODIGO').AsInteger;
                 TmpNrosSerie.FieldByName('ALMACEN').AsString := FieldByName('ALMACEN').AsString;
                 TmpNrosSerie.FieldByName('ARTICULO').AsString := FieldByName('ARTICULO').AsString;
                 TmpNrosSerie.FieldByName('NSERIE').AsString := FieldByName('NSERIE').AsString;
                 TmpNrosSerie.FieldByName('SELECCIONADO').AsInteger := 0;
                 TmpNrosSerie.FieldByName('UNIDADES').AsInteger := -1;
                 TmpNrosSerie.Post;
              end;
           end;

           Prior;
        end;

        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAlquiler.GenerarDeposito;
begin
  with xAlquilerRevision do
  begin
     DisableControls;
     try
        // Refresco datos
        Close;
        Open;

        // Empiezo por el ultimo
        Last;
        while not BOF do
        begin
           if (xAlquilerRevisionNUM_MOV_DEPOSITO.AsInteger = 0) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'EXECUTE PROCEDURE G_GENERA_MOV_DEPOSITO(:ID_S, :ALMACEN_DEPOSITO)';
                    Params.ByName['ID_S'].AsInteger := xAlquilerRevisionID_S_ALB.AsInteger;
                    Params.ByName['ALMACEN_DEPOSITO'].AsString := QMAqluilerALMACEN_DEPOSITO.AsString;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
           Prior;
        end;

        First;
     finally
        EnableControls;
     end;
  end;
end;

end.
