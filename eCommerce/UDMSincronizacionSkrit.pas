unit UDMSincronizacionSkrit;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMSincronizacionSkrit = class(TDataModule)
     QMConfiguracion: TFIBTableSet;
     DSQMConfiguracion: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMConfiguracionEMPRESA: TIntegerField;
     QMConfiguracionPROVEEDOR: TIntegerField;
     QMConfiguracionTOKEN: TFIBStringField;
     QMConfiguracionURL_BASE: TFIBStringField;
     QMConfiguracionASSOCIATE: TFIBStringField;
     QMConfiguracionCLIENT: TFIBStringField;
     QMConfiguracionFECHA_ULTIMA_SINC: TDateTimeField;
     DSxCabecera: TDataSource;
     xDetalle: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     xCabecera: TFIBTableSet;
     xCabeceraEMPRESA: TIntegerField;
     xCabeceraSERIE: TFIBStringField;
     xCabeceraCODE: TFIBStringField;
     xCabeceraPAYMENT: TIntegerField;
     xCabeceraDN_DATE: TDateTimeField;
     xCabeceraNAME: TFIBStringField;
     xCabeceraNIF: TFIBStringField;
     xCabeceraADDRESS: TFIBStringField;
     xCabeceraCOUNTRY: TFIBStringField;
     xCabeceraPROVINCE: TFIBStringField;
     xCabeceraPROVINCEDESCRIPTION: TFIBStringField;
     xCabeceraCITY: TFIBStringField;
     xCabeceraCITYDESCRIPTION: TFIBStringField;
     xCabeceraCP: TFIBStringField;
     xCabeceraPHONE: TFIBStringField;
     xCabeceraEMAIL: TFIBStringField;
     xCabeceraWAREHOUSE: TFIBStringField;
     xCabeceraREGISTRATION: TFIBStringField;
     xCabeceraORDEREDBY: TFIBStringField;
     xCabeceraORDERNUMBER: TFIBStringField;
     xCabeceraGROSSTOTAL: TFloatField;
     xCabeceraSHIPPING: TFloatField;
     xCabeceraTAX: TFloatField;
     xCabeceraRATES: TFloatField;
     xCabeceraPRONTOPAGO: TFloatField;
     xCabeceraRECARGOFINANCIERO: TFloatField;
     xCabeceraBASEIMPONIBLE: TFloatField;
     xCabeceraENTAJEIVA: TFloatField;
     xCabeceraPROMPTPAYMENT: TFloatField;
     xCabeceraTOTAL: TFloatField;
     xCabeceraDISCOUNT: TFloatField;
     xCabeceraOBSERVATIONS: TFIBStringField;
     xCabeceraINVOICED: TIntegerField;
     xCabeceraID_E: TIntegerField;
     xDetalleEMPRESA: TIntegerField;
     xDetalleSERIE: TFIBStringField;
     xDetalleCODE: TFIBStringField;
     xDetalleLINE: TIntegerField;
     xDetalleREFERENCE: TFIBStringField;
     xDetalleEAN: TFIBStringField;
     xDetalleDESCRIPTION: TFIBStringField;
     xDetalleUNITS: TFloatField;
     xDetallePRICE: TFloatField;
     xDetalleDTO1: TFloatField;
     xDetalleDTO2: TFloatField;
     xDetalleDTO3: TFloatField;
     xDetalleDTOTOTAL: TFloatField;
     xDetalleNETLINE: TFloatField;
     xDetalleID_DETALLES_E: TIntegerField;
     xDetalleARTICULO: TFIBStringField;
     xCabeceraDESTINO: TFIBStringField;
     QMConfiguracionNOMBRE_R_SOCIAL: TFIBStringField;
     xCabeceraPROVEEDOR: TIntegerField;
     xDetallePROVEEDOR: TIntegerField;
     QMConfiguracionCli: TFIBTableSet;
     DSQMConfiguracionCli: TDataSource;
     QMConfiguracionCliEMPRESA: TIntegerField;
     QMConfiguracionCliPROVEEDOR: TIntegerField;
     QMConfiguracionCliASSOCIATE: TFIBStringField;
     QMConfiguracionCliCLIENT: TFIBStringField;
     QMConfiguracionCliFECHA_ULTIMA_SINC: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xCabeceraAfterOpen(DataSet: TDataSet);
     procedure xCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMConfiguracionAfterOpen(DataSet: TDataSet);
     procedure QMConfiguracionBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Log: TStrings;
     Desde, Hasta: TDateTime;
  public
     { Public declarations }
     procedure Sincroniza;
     procedure SincronizaAlbaranes(Desde, Hasta: TDateTime);
     procedure SincronizaAlbaranesDetalle(Serie, Code: string);
     procedure Filtra(aDesde, aHasta: TDateTime; SoloNoSincronizados: boolean);
     procedure CrearALP(IdCabReparacion: integer; Serie, Almacen: string);
  end;

var
  DMSincronizacionSkrit : TDMSincronizacionSkrit;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, UDMSkrit, UDMSincronizacion, UParam, HYFIBQuery, DateUtils, uLkJSON, Dialogs;

{$R *.dfm}

function DameNodo(Nodo: TlkJSONBase; a: array of string): TlkJSONObject;
var
  i : integer;
begin
  //Result := nil;
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.Field[a[i]];
     Inc(i);
  end;

  Result := TlkJSONObject(Nodo);
end;

function DameDato(Nodo: TlkJSONObject; a: array of string): string;
var
  i : integer;
  aux : array of string;
  Campo : string;
begin
  ///  {Cabecera:
  ///     {Detalle:
  ///        {Subdetalle:"Dato"}
  ///    }
  ///  }
  /// a['Cabecera', 'Detalle', 'Subdetalle']
  /// Nodo := DameNodo(Nodo, ['Cabecera', 'Detalle'])
  /// Dato := Nodo.Field('Subdetalle').Value

  /// Devuelve el valor del nodo como string.

  Result := '';

  // El ultimo valor es el campo a obtener
  Campo := a[Length(a) - 1];

  // Quito el ultimo elemento del array
  for i := 0 to Length(a) - 2 do
     aux[i] := a[i];

  // Obtengo Nodo
  Nodo := DameNodo(Nodo, aux);

  if Assigned(Nodo) then
  begin
     // Obtengo datos del campo.
     if (Nodo.Field[Campo] is TlkJSONnull) then
        Result := '';

     if (Nodo.Field[Campo] is TlkJSONstring) then
        Result := Nodo.Field[Campo].Value;

     { TODO : Ver si hay que hacer alguna transformacion (separador decimal/miles) }
     if (Nodo.Field[Campo] is TlkJSONnumber) then
        Result := Nodo.Field[Campo].Value;

     if (Nodo.Field[Campo] is TlkJSONboolean) then
        if Nodo.Field[Campo].Value then
           Result := 'true'
        else
           Result := 'false';
  end;
end;

procedure TDMSincronizacionSkrit.CrearALP(IdCabReparacion: integer; Serie, Almacen: string);
var
  IdDoc, IdDetalleDoc : integer;
  s : string;
  TipoIVA : integer;
begin
  IdDoc := 0;
  //IdDetalleDoc := 0;

  try
     // Creo cabecera de albran
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE INS_CABECERA_COMPRA ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :PROVEEDOR, :REFERENCIA, ');
           SQL.Add(' :ALMACEN, :FECHA_DOC, :ENTRADA, :NUM_ALBARAN_FACTURA) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'ALP';
           Params.ByName['PROVEEDOR'].AsInteger := QMConfiguracionPROVEEDOR.AsInteger;
           s := '';
           if (xCabeceraREGISTRATION.AsString > '') then
              s := s + format('Reg.: %s', [xCabeceraREGISTRATION.AsString]);
           if (xCabeceraOBSERVATIONS.AsString > '') then
              s := s + format('Obs.: %s', [xCabeceraOBSERVATIONS.AsString]);
           if (xCabeceraORDERNUMBER.AsString > '') then
              s := s + format('Orden: %s', [xCabeceraORDERNUMBER.AsString]);
           if (xCabeceraORDEREDBY.AsString > '') then
              s := s + format('Ord.: %s', [xCabeceraORDEREDBY.AsString]);
           Params.ByName['REFERENCIA'].AsString := Copy(s, 1, 40);
           Params.ByName['ALMACEN'].AsString := Almacen;
           Params.ByName['FECHA_DOC'].AsDateTime := xCabeceraDN_DATE.AsDateTime;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['NUM_ALBARAN_FACTURA'].AsString := Copy(format('%s/%s', [xCabeceraSERIE.AsString, xCabeceraCODE.AsString]), 1, 40);
           ExecQuery;
           IdDoc := FieldByName['ID_E'].AsInteger;
           // FieldByName['RIG'].AsInteger;
           // FieldByName['FECHA'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Establezco relacion
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE SKRIT_DELIVERY_NOTES ');
           SQL.Add(' SET ID_E = :ID_E ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' CODE = :CODE ');
           Params.ByName['EMPRESA'].AsInteger := xCabeceraEMPRESA.AsInteger;
           Params.ByName['PROVEEDOR'].AsInteger := xCabeceraPROVEEDOR.AsInteger;
           Params.ByName['SERIE'].AsString := xCabeceraSERIE.AsString;
           Params.ByName['CODE'].AsString := xCabeceraCODE.AsString;
           Params.ByName['ID_E'].AsInteger := IdDoc;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     TipoIVA := DameTipoIva(xCabeceraENTAJEIVA.AsFloat);

     // Inserto lineas
     with xDetalle do
     begin
        First;

        while not EOF do
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' EXECUTE PROCEDURE WEB_INS_DETALLE_COMPRA_4 ( ');
                 SQL.Add(' :ID_E, :ID_A, :TITULO, :UNIDADES, :NOTAS, :PRECIO, :DESCUENTO, :DESCUENTO_2, :DESCUENTO_3, ');
                 SQL.Add(' :TIPO_UNIDAD_LOGISTICA, :UNIDADES_LOGISTICAS, :TIPO_IVA) ');
                 Params.ByName['ID_E'].AsInteger := IdDoc;
                 Params.ByName['ID_A'].AsInteger := DameIdArticulo(xDetalleARTICULO.AsString);
                 Params.ByName['TITULO'].AsString := Copy(xDetalleDESCRIPTION.AsString, 1, 256);
                 Params.ByName['UNIDADES'].AsFloat := xDetalleUNITS.AsFloat;
                 Params.ByName['NOTAS'].AsString := '';
                 Params.ByName['PRECIO'].AsFloat := xDetallePRICE.AsFloat;
                 Params.ByName['DESCUENTO'].AsFloat := xDetalleDTO1.AsFloat;
                 Params.ByName['DESCUENTO_2'].AsFloat := xDetalleDTO2.AsFloat;
                 Params.ByName['DESCUENTO_3'].AsFloat := xDetalleDTO3.AsFloat;
                 Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := 'GRNL';
                 Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := xDetalleUNITS.AsFloat;
                 Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                 ExecQuery;
                 IdDetalleDoc := FieldByName['ID_DETALLES_E'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Establezco relacion
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE SKRIT_DELIVERY_NOTES_DET ');
                 SQL.Add(' SET ID_DETALLES_E = :ID_DETALLES_E ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
                 SQL.Add(' SERIE = :SERIE AND ');
                 SQL.Add(' CODE = :CODE AND ');
                 SQL.Add(' LINE = :LINE ');
                 Params.ByName['EMPRESA'].AsInteger := xDetalleEMPRESA.AsInteger;
                 Params.ByName['PROVEEDOR'].AsInteger := xDetallePROVEEDOR.AsInteger;
                 Params.ByName['SERIE'].AsString := xDetalleSERIE.AsString;
                 Params.ByName['CODE'].AsString := xDetalleCODE.AsString;
                 Params.ByName['LINE'].AsInteger := xDetalleLINE.AsInteger;
                 Params.ByName['ID_DETALLES_E'].AsInteger := IdDetalleDoc;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;

        // Impuestos
        if (xCabeceraTAX.AsFloat <> 0) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' EXECUTE PROCEDURE WEB_INS_DETALLE_COMPRA_4 ( ');
                 SQL.Add(' :ID_E, :ID_A, :TITULO, :UNIDADES, :NOTAS, :PRECIO, :DESCUENTO, :DESCUENTO_2, :DESCUENTO_3, ');
                 SQL.Add(' :TIPO_UNIDAD_LOGISTICA, :UNIDADES_LOGISTICAS, :TIPO_IVA) ');
                 Params.ByName['ID_E'].AsInteger := IdDoc;
                 Params.ByName['ID_A'].AsInteger := DameIdArticulo(REntorno.ArtTextoLibre);
                 Params.ByName['TITULO'].AsString := _('Impuestos');
                 Params.ByName['UNIDADES'].AsFloat := 1;
                 Params.ByName['NOTAS'].AsString := '';
                 Params.ByName['PRECIO'].AsFloat := xCabeceraTAX.AsFloat;
                 Params.ByName['DESCUENTO'].AsFloat := 0;
                 Params.ByName['DESCUENTO_2'].AsFloat := 0;
                 Params.ByName['DESCUENTO_3'].AsFloat := 0;
                 Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := 'GRNL';
                 Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := 1;
                 Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                 ExecQuery;
                 //IdDetalleDoc := FieldByName['ID_DETALLES_E'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        if (IdCabReparacion <> 0) then
        begin
           // Relacionamos con reparacion (Traspaso de lineas indicando PRECIO_VENTA = P_COSTE)
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO REPAR_DET_REPARACIONES ( ');
                 SQL.Add(' EMPRESA, EJERCICIO, CANAL, IDCABREPARAR, ARTICULO, TITULO_ART, UNIDADES, PRECIO, PRECIO_VENTA, TIPO_IVA, ID_DETALLES_E_ORIGEN) ');
                 SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, :IDCABREPARAR, ARTICULO, TITULO, UNIDADES, 0, P_COSTE, TIPO_IVA, ID_DETALLES_E ');
                 SQL.Add(' FROM GES_DETALLES_E ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_E = :ID_E ');
                 SQL.Add(' ORDER BY ORDEN ');
                 Params.ByName['ID_E'].AsInteger := IdDoc;
                 Params.ByName['IDCABREPARAR'].AsInteger := IdCabReparacion;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  except
     on E: Exception do
     begin
        // Borro el documento
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' DELETE FROM VER_CABECERAS_ALBARAN_PROV ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_E = :ID_E ');
              Params.ByName['ID_E'].AsInteger := IdDoc;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        ShowMessage(E.Message);
     end;
  end;
end;

procedure TDMSincronizacionSkrit.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMSkrit, DMSkrit);

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMConfiguracion, '100000');

  AsignaDisplayFormat(QMConfiguracion, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(QMConfiguracionCli, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDetalle, MascaraN, MascaraI, ShortDateFormat);

  DMSkrit.WS_Inicializa(QMConfiguracionURL_BASE.AsString, QMConfiguracionTOKEN.AsString, QMConfiguracionCliASSOCIATE.AsString, QMConfiguracionCliCLIENT.AsString, False);
end;

procedure TDMSincronizacionSkrit.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMSkrit);
end;

procedure TDMSincronizacionSkrit.Filtra(aDesde, aHasta: TDateTime; SoloNoSincronizados: boolean);
begin
  Desde := RecodeTime(aDesde, 0, 0, 0, 0);
  Hasta := RecodeTime(aHasta, 23, 59, 59, 999);

  with xCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT S.*, ');
     SelectSQL.Add('        (COALESCE((SELECT C.TIPO || '' '' || C.EJERCICIO || ''-'' || C.SERIE || ''/'' || C.RIG ');
     SelectSQL.Add('                   FROM GES_CABECERAS_E C ');
     SelectSQL.Add('                   WHERE ');
     SelectSQL.Add('                   ID_E = S.ID_E), '''')) DESTINO ');
     SelectSQL.Add(' FROM SKRIT_DELIVERY_NOTES S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' S.PROVEEDOR = :PROVEEDOR AND ');
     SelectSQL.Add(' S.DN_DATE BETWEEN :DESDE AND :HASTA ');
     if SoloNoSincronizados then
        SelectSQL.Add(' AND S.ID_E = 0 ');
     SelectSQL.Add(' ORDER BY S.SERIE, S.CODE ');

     Params.ByName['EMPRESA'].AsInteger := QMConfiguracionEMPRESA.AsInteger;
     Params.ByName['PROVEEDOR'].AsInteger := QMConfiguracionPROVEEDOR.AsInteger;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Open;
  end;
end;

procedure TDMSincronizacionSkrit.Sincroniza;
var
  Desde : TDateTime;
begin
  with QMConfiguracionCli do
  begin
     First;
     while not EOF do
     begin
        // En el caso de sincronizacion de Repuestos Migues se da que
        // crean albaranes confecha de "ayer" y que luego son ignorados.
        // Por esto sincronizamos siempre la ultima semana
        Desde := IncDay(QMConfiguracionCliFECHA_ULTIMA_SINC.AsDateTime, -7);

        // Solo admite los ultimos tres meses
        if IncMonth(Now, -3) > Desde then
           Desde := IncMonth(Now, -3);

        DMSkrit.WS_Inicializa(QMConfiguracionURL_BASE.AsString, QMConfiguracionTOKEN.AsString, QMConfiguracionCliASSOCIATE.AsString, QMConfiguracionCliCLIENT.AsString, False);

        DMMain.Log(format('SincronizaAlbaranes (Associate: %s - Client: %s - Desde: %s)', [QMConfiguracionCliASSOCIATE.AsString, QMConfiguracionCliCLIENT.AsString, DateToStr(Desde)]));
        SincronizaAlbaranes(Desde, Now);

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE SKRIT_CONFIGURACION_CLIENT SET FECHA_ULTIMA_SINC = :FECHA_ULTIMA_SINC WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :PROVEEDOR AND ASSOCIATE = :ASSOCIATE AND CLIENT = :CLIENT';
              Params.ByName['EMPRESA'].AsInteger := QMConfiguracionCliEMPRESA.AsInteger;
              Params.ByName['PROVEEDOR'].AsInteger := QMConfiguracionCliPROVEEDOR.AsInteger;
              Params.ByName['ASSOCIATE'].AsString := QMConfiguracionCliASSOCIATE.AsString;
              Params.ByName['CLIENT'].AsString := QMConfiguracionCliCLIENT.AsString;
              Params.ByName['FECHA_ULTIMA_SINC'].AsDateTime := Now;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Next;
     end;
  end;

  QMConfiguracion.Refresh;
  xCabecera.Close;
  xCabecera.Open;
  xCabecera.Last;
end;

procedure TDMSincronizacionSkrit.SincronizaAlbaranes(Desde, Hasta: TDateTime);
var
  Q : THYFIBQuery;
  JSON, Respuesta : TStrings;
  Resultado : integer;
  Documento : TlkJSONObject;
  //NodoPadre, Nodo : TlkJSONObject;
  JSONArray : TlkJSONList;
  i : integer;
  s : string;
  //j : integer;
  Serie, Code : string;
begin
  JSON := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     Resultado := DMSkrit.WS_Get('deliveryNotes', '', format('?from=%s&to=%s', [FormatDateTime('yyyy-mm-dd', Desde), FormatDateTime('yyyy-mm-dd', Hasta)]), Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'deliveryNotes.json');
     {$ENDIF}
     if (Resultado = 200) then
     begin
        Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
        try
           if Assigned(Documento) then
           begin
              DMMain.LogIni('Procesando documento');
              // Lista de variaciones
              JSONArray := TlkJSONList(DameNodo(Documento, ['deliveryNotes']));
              if Assigned(JSONArray) then
              begin
                 for i := 0 to JSONArray.Count - 1 do
                 begin
                    DMMain.LogIni(format('Procesando Array[%d]', [i]));
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE OR INSERT INTO SKRIT_DELIVERY_NOTES ( ');
                       SQL.Add(' EMPRESA, PROVEEDOR, SERIE, CODE, PAYMENT, DN_DATE, NAME, NIF, ADDRESS, COUNTRY, PROVINCE, PROVINCEDESCRIPTION, CITY, ');
                       SQL.Add(' CITYDESCRIPTION, CP, PHONE, EMAIL, WAREHOUSE, REGISTRATION, ORDEREDBY, ORDERNUMBER, GROSSTOTAL, SHIPPING, TAX, RATES, ');
                       SQL.Add(' PRONTOPAGO, RECARGOFINANCIERO, BASEIMPONIBLE, ENTAJEIVA, PROMPTPAYMENT, TOTAL, DISCOUNT, OBSERVATIONS, INVOICED) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :EMPRESA, :PROVEEDOR, :SERIE, :CODE, :PAYMENT, :DN_DATE, :NAME, :NIF, :ADDRESS, :COUNTRY, :PROVINCE, :PROVINCEDESCRIPTION, :CITY, ');
                       SQL.Add(' :CITYDESCRIPTION, :CP, :PHONE, :EMAIL, :WAREHOUSE, :REGISTRATION, :ORDEREDBY, :ORDERNUMBER, :GROSSTOTAL, :SHIPPING, ');
                       SQL.Add(' :TAX, :RATES, :PRONTOPAGO, :RECARGOFINANCIERO, :BASEIMPONIBLE, :ENTAJEIVA, :PROMPTPAYMENT, :TOTAL, :DISCOUNT, ');
                       SQL.Add(' :OBSERVATIONS, :INVOICED) ');
                       SQL.Add(' MATCHING (EMPRESA, PROVEEDOR, SERIE, CODE) ');
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                    end;

                    Q.Params.ByName['EMPRESA'].AsInteger := QMConfiguracionCliEMPRESA.AsInteger;
                    Q.Params.ByName['PROVEEDOR'].AsInteger := QMConfiguracionCliPROVEEDOR.AsInteger;
                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['serie']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['SERIE'].AsString := s
                    else
                       Q.Params.ByName['SERIE'].AsString := '';
                    Serie := s;
                    //DMMain.Log(format('serie=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['code']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['CODE'].AsString := s
                    else
                       Q.Params.ByName['CODE'].AsString := '';
                    Code := s;
                    //DMMain.Log(format('code=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['payment']));
                    if (Trim(s) = 'true') then
                       Q.Params.ByName['PAYMENT'].AsInteger := 1
                    else
                       Q.Params.ByName['PAYMENT'].AsInteger := 0;
                    //DMMain.Log(format('payment=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['date']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['DN_DATE'].AsDateTime := DateISO8601ToDateTime(s)
                    else
                       Q.Params.ByName['DN_DATE'].AsDateTime := Today;
                    //DMMain.Log(format('date=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['name']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['NAME'].AsString := s
                    else
                       Q.Params.ByName['NAME'].AsString := '';
                    //DMMain.Log(format('name=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['nif']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['NIF'].AsString := s
                    else
                       Q.Params.ByName['NIF'].AsString := '';
                    //DMMain.Log(format('nif=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['address']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['ADDRESS'].AsString := s
                    else
                       Q.Params.ByName['ADDRESS'].AsString := '';
                    //DMMain.Log(format('address=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['country']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['COUNTRY'].AsString := s
                    else
                       Q.Params.ByName['COUNTRY'].AsString := '';
                    //DMMain.Log(format('country=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['province']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['PROVINCE'].AsString := s
                    else
                       Q.Params.ByName['PROVINCE'].AsString := '';
                    //DMMain.Log(format('province=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['provinceDescription']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['PROVINCEDESCRIPTION'].AsString := s
                    else
                       Q.Params.ByName['PROVINCEDESCRIPTION'].AsString := '';
                    //DMMain.Log(format('provinceDescription=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['city']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['CITY'].AsString := s
                    else
                       Q.Params.ByName['CITY'].AsString := '';
                    //DMMain.Log(format('city=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['cityDescription']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['CITYDESCRIPTION'].AsString := s
                    else
                       Q.Params.ByName['CITYDESCRIPTION'].AsString := '';
                    //DMMain.Log(format('cityDescription=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['cp']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['CP'].AsString := s
                    else
                       Q.Params.ByName['CP'].AsString := '';
                    //DMMain.Log(format('cp=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['phone']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['PHONE'].AsString := s
                    else
                       Q.Params.ByName['PHONE'].AsString := '';
                    //DMMain.Log(format('phone=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['email']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['EMAIL'].AsString := s
                    else
                       Q.Params.ByName['EMAIL'].AsString := '';
                    //DMMain.Log(format('email=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['warehouse']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['WAREHOUSE'].AsString := s
                    else
                       Q.Params.ByName['WAREHOUSE'].AsString := '';
                    //DMMain.Log(format('warehouse=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['registration']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['REGISTRATION'].AsString := s
                    else
                       Q.Params.ByName['REGISTRATION'].AsString := '';
                    //DMMain.Log(format('registration=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['orderedBy']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['ORDEREDBY'].AsString := s
                    else
                       Q.Params.ByName['ORDEREDBY'].AsString := '';
                    //DMMain.Log(format('orderedBy=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['orderNumber']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['ORDERNUMBER'].AsString := s
                    else
                       Q.Params.ByName['ORDERNUMBER'].AsString := '';
                    //DMMain.Log(format('orderNumber=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['grossTotal']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['GROSSTOTAL'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['GROSSTOTAL'].AsFloat := 0;
                    //DMMain.Log(format('grossTotal=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['shipping']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['SHIPPING'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['SHIPPING'].AsFloat := 0;
                    //DMMain.Log(format('shipping=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['tax']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['TAX'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['TAX'].AsFloat := 0;
                    //DMMain.Log(format('tax=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['rates']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['RATES'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['RATES'].AsFloat := 0;
                    //DMMain.Log(format('rates=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['ProntoPago']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['PRONTOPAGO'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['PRONTOPAGO'].AsFloat := 0;
                    //DMMain.Log(format('ProntoPago=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['RecargoFinanciero']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['RECARGOFINANCIERO'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['RECARGOFINANCIERO'].AsFloat := 0;
                    //DMMain.Log(format('RecargoFinanciero=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['BaseImponible']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['BASEIMPONIBLE'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['BASEIMPONIBLE'].AsFloat := 0;
                    //DMMain.Log(format('BaseImponible=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['entajeIva']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['ENTAJEIVA'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['ENTAJEIVA'].AsFloat := 0;
                    //DMMain.Log(format('entajeIva=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['promptPayment']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['PROMPTPAYMENT'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['PROMPTPAYMENT'].AsFloat := 0;
                    //DMMain.Log(format('promptPayment=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['total']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['TOTAL'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['TOTAL'].AsFloat := 0;
                    //DMMain.Log(format('total=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['discount']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['DISCOUNT'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['DISCOUNT'].AsFloat := 0;
                    //DMMain.Log(format('discount=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['observations']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['OBSERVATIONS'].AsString := s
                    else
                       Q.Params.ByName['OBSERVATIONS'].AsString := '';
                    //DMMain.Log(format('observations=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['invoiced']));
                    if (Trim(s) = 'true') then
                       Q.Params.ByName['INVOICED'].AsInteger := 1
                    else
                       Q.Params.ByName['INVOICED'].AsInteger := 0;
                    //DMMain.Log(format('invoiced=%s', [s]));

                    {
                    DMMain.Log('Parametros');
                    for j := 0 to Q.Params.Count - 1 do
                    begin
                       DMMain.Log(format('%s=%s', [Q.Params[j].Name, Q.Params[j].AsString]));
                    end;
                    }
                    with Q do
                    begin
                       ExecQuery;
                       FreeHandle;
                       Free;
                    end;

                    SincronizaAlbaranesDetalle(Serie, Code);

                    DMMain.LogFin('----------');
                 end;
              end;

              DMMain.LogFin('');
           end
           else
           begin
              Log.Add('ERROR Sincronizando Cabecera - No se ha recibido respuesta');
           end;
        finally
           Documento.Free;
        end;
     end
     else
     begin
        ShowMessage('Ha ocurrido un error al sincronizar cabecera' + #13#10 + Respuesta.Text);
     end;
  finally
     JSON.Free;
     Respuesta.Free;
  end;
end;

procedure TDMSincronizacionSkrit.SincronizaAlbaranesDetalle(Serie, Code: string);
var
  Q : THYFIBQuery;
  JSON, Respuesta : TStrings;
  Resultado : integer;
  Documento : TlkJSONObject;
  //NodoPadre, Nodo : TlkJSONObject;
  JSONArray : TlkJSONList;
  i : integer;
  s : string;
  //j : integer;
begin
  JSON := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     Resultado := DMSkrit.WS_Get('deliveryNotes', Code, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'deliveryNotes_'+Code+'.json');
     {$ENDIF}
     if (Resultado = 200) then
     begin
        Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
        try
           if Assigned(Documento) then
           begin
              DMMain.LogIni('Procesando documento');
              // Lista de variaciones
              JSONArray := TlkJSONList(DameNodo(Documento, ['products']));
              if Assigned(JSONArray) then
              begin
                 for i := 0 to JSONArray.Count - 1 do
                 begin
                    DMMain.LogIni(format('Procesando Array[%d]', [i]));
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE OR INSERT INTO SKRIT_DELIVERY_NOTES_DET ( ');
                       SQL.Add(' EMPRESA, PROVEEDOR, SERIE, CODE, LINE, REFERENCE, EAN, DESCRIPTION, UNITS, PRICE, DTO1, DTO2, DTO3, DTOTOTAL, NETLINE) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :EMPRESA, :PROVEEDOR, :SERIE, :CODE, :LINE, :REFERENCE, :EAN, :DESCRIPTION, :UNITS, :PRICE, :DTO1, :DTO2, :DTO3, :DTOTOTAL, ');
                       SQL.Add('  :NETLINE) ');
                       SQL.Add(' MATCHING (EMPRESA, PROVEEDOR, SERIE, CODE, LINE) ');
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                    end;

                    Q.Params.ByName['EMPRESA'].AsInteger := QMConfiguracionCliEMPRESA.AsInteger;
                    Q.Params.ByName['PROVEEDOR'].AsInteger := QMConfiguracionCliPROVEEDOR.AsInteger;
                    Q.Params.ByName['SERIE'].AsString := Serie;
                    Q.Params.ByName['CODE'].AsString := Code;

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['line']));
                    Q.Params.ByName['LINE'].AsInteger := StrToIntDef(s, 0);
                    //DMMain.Log(format('line=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['reference']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['REFERENCE'].AsString := s
                    else
                       Q.Params.ByName['REFERENCE'].AsString := '';
                    //DMMain.Log(format('reference=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['ean']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['EAN'].AsString := s
                    else
                       Q.Params.ByName['EAN'].AsString := '';
                    //DMMain.Log(format('ean=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['description']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['DESCRIPTION'].AsString := s
                    else
                       Q.Params.ByName['DESCRIPTION'].AsString := '';
                    //DMMain.Log(format('description=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['units']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['UNITS'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['UNITS'].AsFloat := 0;
                    //DMMain.Log(format('units=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['price']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['PRICE'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['PRICE'].AsFloat := 0;
                    //DMMain.Log(format('price=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['dto1']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['DTO1'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['DTO1'].AsFloat := 0;
                    //DMMain.Log(format('dto1=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['dto2']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['DTO2'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['DTO2'].AsFloat := 0;
                    //DMMain.Log(format('dto2=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['dto3']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['DTO3'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['DTO3'].AsFloat := 0;
                    //DMMain.Log(format('dto3=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['dtoTotal']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['DTOTOTAL'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['DTOTOTAL'].AsFloat := 0;
                    //DMMain.Log(format('dtoTotal=%s', [s]));

                    s := Trim(DameDato(TlkJSONObject(JSONArray.Child[i]), ['netLine']));
                    if (Trim(s) > '') then
                       Q.Params.ByName['NETLINE'].AsFloat := StrToFloatDec(s, ' ')
                    else
                       Q.Params.ByName['NETLINE'].AsFloat := 0;
                    //DMMain.Log(format('netLine=%s', [s]));

                    {
                    DMMain.Log('Parametros');
                    for j := 0 to Q.Params.Count - 1 do
                    begin
                       DMMain.Log(format('%s=%s', [Q.Params[j].Name, Q.Params[j].AsString]));
                    end;
                    }
                    with Q do
                    begin
                       ExecQuery;
                       FreeHandle;
                       Free;
                    end;

                    DMMain.LogFin('----------');
                 end;
              end;

              DMMain.LogFin('');
           end
           else
           begin
              Log.Add(format('ERROR Sincronizando Detalle de %s/%s', [Serie, Code]) + #13#10 + 'No se ha recibido respuesta');
           end;
        finally
           Documento.Free;
        end;
     end
     else
     begin
        ShowMessage(format('Ha ocurrido un error al sincronizar detalle de %s/%s', [Serie, Code]) + #13#10 + Respuesta.Text);
     end;
  finally
     JSON.Free;
     Respuesta.Free;
  end;
end;

procedure TDMSincronizacionSkrit.xCabeceraAfterOpen(DataSet: TDataSet);
begin
  xDetalle.Open;
end;

procedure TDMSincronizacionSkrit.xCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDetalle.Close;
end;

procedure TDMSincronizacionSkrit.QMConfiguracionAfterOpen(DataSet: TDataSet);
begin
  QMConfiguracionCli.Open;
end;

procedure TDMSincronizacionSkrit.QMConfiguracionBeforeClose(DataSet: TDataSet);
begin
  QMConfiguracionCli.Close;
end;

end.
