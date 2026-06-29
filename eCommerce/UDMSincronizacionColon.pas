unit UDMSincronizacionColon;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, ComCtrls, ULFLabel;

type
  TDMSincronizacionColon = class(TDataModule)
     QMConfiguracion: TFIBTableSet;
     DSQMConfiguracion: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSxCabecera: TDataSource;
     xDetalle: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     xCabecera: TFIBTableSet;
     QMConfiguracionEMPRESA: TIntegerField;
     QMConfiguracionPROVEEDOR: TIntegerField;
     QMConfiguracionHOST: TFIBStringField;
     QMConfiguracionPUERTO: TIntegerField;
     QMConfiguracionUSUARIO: TFIBStringField;
     QMConfiguracionCLAVE: TFIBStringField;
     QMConfiguracionDIRECTORIO: TFIBStringField;
     xCabeceraEMPRESA: TIntegerField;
     xCabeceraID_E: TIntegerField;
     xCabeceraCIF_PROVEEDOR: TFIBStringField;
     xCabeceraNRO_DOCUMENTO: TFIBStringField;
     xCabeceraCARGO_ABONO: TFIBStringField;
     xCabeceraFECHA: TDateTimeField;
     xCabeceraCODIGO_CLIENTE: TIntegerField;
     xCabeceraCIF_CLIENTE: TFIBStringField;
     xCabeceraNRO_ENVIO: TFIBStringField;
     xCabeceraDIRECCION_ENVIO: TFIBStringField;
     xCabeceraSU_REFERENCIA: TFIBStringField;
     xCabeceraAGENCIA_TRANSPORTE: TFIBStringField;
     xCabeceraDEBIDOS_PAGADOS: TFIBStringField;
     xCabeceraDESTINO: TFIBStringField;
     xDetalleEMPRESA: TIntegerField;
     xDetalleID_DETALLES_E: TIntegerField;
     xDetalleNRO_DOCUMENTO: TFIBStringField;
     xDetalleREFERENCIA: TFIBStringField;
     xDetalleCODIGO_BARRAS: TFIBStringField;
     xDetalleREF_CATALOGO: TFIBStringField;
     xDetalleDESCRIPCION: TFIBStringField;
     xDetalleCANTIDAD: TFloatField;
     xDetallePRECIO_UNITARIO: TFloatField;
     xDetalleDESCUENTO: TFloatField;
     xDetalleIMPORTE_TOTAL: TFloatField;
     xDetalleID_A: TIntegerField;
     xDetalleLINEA: TIntegerField;
     xDetalleARTICULO: TFIBStringField;
     QMConfiguracionFECHA_ULTIMA_SINC: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xCabeceraAfterOpen(DataSet: TDataSet);
     procedure xCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Desde, Hasta: TDateTime;
  public
     { Public declarations }
     procedure Sincroniza(PBProgreso: TProgressBar; LProgreso: TLFLabel);
     procedure SincronizaAlbaranes(Desde, Hasta: TDateTime; PBProgreso: TProgressBar; LProgreso: TLFLabel);
     procedure Importar(Fichero: string);
     procedure Filtra(aDesde, aHasta: TDateTime; SoloNoSincronizados: boolean);
     procedure CrearALP(IdCabReparacion: integer; Serie: string);
  end;

var
  DMSincronizacionColon : TDMSincronizacionColon;

implementation

uses UFormGest, UDMColon, UEntorno, UDMMain, UDMSincronizacion, UUtiles, UParam, HYFIBQuery, DateUtils, Dialogs, Grids, Forms, IdGlobalProtocols, UDameDato;

{$R *.dfm}

procedure TDMSincronizacionColon.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMColon, DMColon);

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMConfiguracion, '100000');

  AsignaDisplayFormat(QMConfiguracion, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDetalle, MascaraN, MascaraI, ShortDateFormat);

  DMColon.Inicializa(QMConfiguracionHOST.AsString, QMConfiguracionPUERTO.AsInteger, QMConfiguracionUSUARIO.AsString, QMConfiguracionCLAVE.AsString, QMConfiguracionDIRECTORIO.AsString);
end;

procedure TDMSincronizacionColon.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMColon);
end;

procedure TDMSincronizacionColon.CrearALP(IdCabReparacion: integer; Serie: string);
var
  IdDoc, IdDetalleDoc : integer;
  s : string;
  TipoIVA : integer;
begin
  IdDoc := 0;

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

           { Creo SU_REFERENCIA
           s := '';
           if (xCabeceraREGISTRATION.AsString > '') then
              s := s + format('Reg.: %s', [xCabeceraREGISTRATION.AsString]);
           if (xCabeceraOBSERVATIONS.AsString > '') then
              s := s + format('Obs.: %s', [xCabeceraOBSERVATIONS.AsString]);
           if (xCabeceraORDERNUMBER.AsString > '') then
              s := s + format('Orden: %s', [xCabeceraORDERNUMBER.AsString]);
           if (xCabeceraORDEREDBY.AsString > '') then
              s := s + format('Ord.: %s', [xCabeceraORDEREDBY.AsString]);
           }
           s := Copy(xCabeceraSU_REFERENCIA.AsString, 1, 40);

           Params.ByName['REFERENCIA'].AsString := s;
           Params.ByName['ALMACEN'].AsString := DMMain.DameAlmacenDocumento('ALP', Serie);
           Params.ByName['FECHA_DOC'].AsDateTime := xCabeceraFECHA.AsDateTime;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['NUM_ALBARAN_FACTURA'].AsString := xCabeceraNRO_DOCUMENTO.AsString;
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
           SQL.Add(' UPDATE IMP_ALP_COLON_CAB ');
           SQL.Add(' SET ID_E = :ID_E ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' NRO_DOCUMENTO = :NRO_DOCUMENTO ');
           Params.ByName['EMPRESA'].AsInteger := xCabeceraEMPRESA.AsInteger;
           Params.ByName['NRO_DOCUMENTO'].AsString := xCabeceraNRO_DOCUMENTO.AsString;
           Params.ByName['ID_E'].AsInteger := IdDoc;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // TIPO_IVA = -1, tomara el Tipo de IVA del articulo.
     // TipoIVA := DameTipoIva(?);
     TipoIVA := -1;

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
                 Params.ByName['TITULO'].AsString := Copy(xDetalleDESCRIPCION.AsString, 1, 256);
                 Params.ByName['UNIDADES'].AsFloat := xDetalleCANTIDAD.AsFloat;
                 Params.ByName['NOTAS'].AsString := '';
                 Params.ByName['PRECIO'].AsFloat := xDetallePRECIO_UNITARIO.AsFloat;
                 Params.ByName['DESCUENTO'].AsFloat := xDetalleDESCUENTO.AsFloat;
                 Params.ByName['DESCUENTO_2'].AsFloat := 0;
                 Params.ByName['DESCUENTO_3'].AsFloat := 0;
                 Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := 'GRNL';
                 Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := xDetalleCANTIDAD.AsFloat;
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
                 SQL.Add(' UPDATE IMP_ALP_COLON_DET ');
                 SQL.Add(' SET ID_DETALLES_E = :ID_DETALLES_E ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' NRO_DOCUMENTO = :NRO_DOCUMENTO AND ');
                 SQL.Add(' LINEA = :LINEA ');
                 Params.ByName['EMPRESA'].AsInteger := xDetalleEMPRESA.AsInteger;
                 Params.ByName['NRO_DOCUMENTO'].AsString := xDetalleNRO_DOCUMENTO.AsString;
                 Params.ByName['LINEA'].AsInteger := xDetalleLINEA.AsInteger;
                 Params.ByName['ID_DETALLES_E'].AsInteger := IdDetalleDoc;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;

        { TODO : Preguntar si existen artículos especiales para portes/impuestos/etc. }
        (*
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
                 IdDetalleDoc := FieldByName['ID_DETALLES_E'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
        *)

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

procedure TDMSincronizacionColon.Filtra(aDesde, aHasta: TDateTime; SoloNoSincronizados: boolean);
begin
  Desde := RecodeTime(aDesde, 0, 0, 0, 0);
  Hasta := RecodeTime(aHasta, 23, 59, 59, 999);

  with xCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT I.*, ');
     SelectSQL.Add('        (COALESCE((SELECT C.TIPO || '' '' || C.EJERCICIO || ''-'' || C.SERIE || ''/'' || C.RIG ');
     SelectSQL.Add('                   FROM GES_CABECERAS_E C ');
     SelectSQL.Add('                   WHERE ');
     SelectSQL.Add('                   ID_E = I.ID_E), '''')) DESTINO ');
     SelectSQL.Add(' FROM IMP_ALP_COLON_CAB I ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' I.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' I.FECHA BETWEEN :DESDE AND :HASTA ');

     if SoloNoSincronizados then
        SelectSQL.Add(' AND I.ID_E = 0 ');

     SelectSQL.Add(' ORDER BY I.NRO_DOCUMENTO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Open;
  end;
end;

procedure TDMSincronizacionColon.Sincroniza(PBProgreso: TProgressBar; LProgreso: TLFLabel);
var
  Desde : TDateTime;
begin
  // Solo admite los ultimos tres meses
  Desde := QMConfiguracionFECHA_ULTIMA_SINC.AsDateTime;
  if IncMonth(Now, -3) > Desde then
     Desde := IncMonth(Now, -3);

  SincronizaAlbaranes(Desde, Now, PBProgreso, LProgreso);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE IMP_ALP_COLON_CONFIGURACION SET FECHA_ULTIMA_SINC = :FECHA_ULTIMA_SINC WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := QMConfiguracionEMPRESA.AsInteger;
        Params.ByName['FECHA_ULTIMA_SINC'].AsDateTime := Now;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMConfiguracion.Refresh;
  xCabecera.Close;
  xCabecera.Open;
  xCabecera.Last;
end;

procedure TDMSincronizacionColon.SincronizaAlbaranes(Desde, Hasta: TDateTime; PBProgreso: TProgressBar; LProgreso: TLFLabel);
var
  DirectorioDestino : string;
  Ficheros : TStrings;
  sr : TSearchRec;
  i : integer;
begin
  PBProgreso.Visible := True;
  LProgreso.Visible := True;
  try
     PBProgreso.Position := 0;
     PBProgreso.Max := 0;
     DirectorioDestino := IncludeTrailingPathDelimiter(DameTempPath + 'SincronizacionColon');
     LProgreso.Caption := _(format('Directorio Destino: %s', [DirectorioDestino]));

     if (not DirectoryExists(DirectorioDestino)) then
        CreateDir(DirectorioDestino);

     DMColon.TraerDatosFTP(DirectorioDestino, PBProgreso, LProgreso);

     Ficheros := TStringList.Create;
     try
        if FindFirst(DirectorioDestino + '*.csv', SysUtils.faReadOnly + SysUtils.faArchive, sr) = 0 then
        begin
           repeat
              Ficheros.Add(DirectorioDestino + sr.Name);
           until FindNext(sr) <> 0;
           FindClose(sr);
        end;

        for i := 0 to Ficheros.Count - 1 do
        begin
           LProgreso.Caption := Format('Procesando fichero %d de %d - %s', [i + 1, Ficheros.Count, Ficheros[i]]);
           Importar(Ficheros[i]);

           PBProgreso.StepIt;
           Application.ProcessMessages;
        end
     finally
        Ficheros.Free;
     end;
  finally
     PBProgreso.Visible := False;
     LProgreso.Visible := False;
  end;
end;

procedure TDMSincronizacionColon.Importar(Fichero: string);
var
  aGrid : TStringGrid;
  i : integer;
  Q : THYFIBQuery;
  Importado, HayError : boolean;
  CIFProveedor : string;
  NroDocumento : string;
begin
  Importado := False;
  HayError := False;
  CIFProveedor := 'ZZZZZZZZZ';
  NroDocumento := 'ZZZZZZZZZ';

  aGrid := TStringGrid.Create(nil);
  try
     aGrid.ColCount := 19;

     // Leo el fichero en un Grid para facilitar manipulacion
     LeerCSV(aGrid, Fichero, ';');

     for i := 1 to aGrid.RowCount - 1 do
     begin
        // La parte de cabecera se repite en todas las líneas. La importo solo una vez.
        // Si ya existe Importado = True y evita importar otra vez duplicando el detalle
        if (i = 1) then
        begin
           CIFProveedor := Trim(Copy(aGrid.Cells[0, i], 1, 20));
           NroDocumento := Trim(Copy(aGrid.Cells[1, i], 1, 40));

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT NRO_DOCUMENTO FROM IMP_ALP_COLON_CAB WHERE EMPRESA = :EMPRESA AND NRO_DOCUMENTO = :NRO_DOCUMENTO';
                 Params.ByName['EMPRESA'].AsInteger := QMConfiguracionEMPRESA.AsInteger;
                 Params.ByName['NRO_DOCUMENTO'].AsString := Trim(Copy(aGrid.Cells[1, i], 1, 40));
                 ExecQuery;
                 Importado := (FieldByName['NRO_DOCUMENTO'].AsString > '');
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE OR INSERT INTO IMP_ALP_COLON_CAB ( ');
                 SQL.Add(' EMPRESA, ID_E, CIF_PROVEEDOR, NRO_DOCUMENTO, CARGO_ABONO, FECHA, CODIGO_CLIENTE, CIF_CLIENTE, NRO_ENVIO, ');
                 SQL.Add(' DIRECCION_ENVIO, SU_REFERENCIA, AGENCIA_TRANSPORTE, DEBIDOS_PAGADOS) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :EMPRESA, 0, :CIF_PROVEEDOR, :NRO_DOCUMENTO, :CARGO_ABONO, :FECHA, :CODIGO_CLIENTE, :CIF_CLIENTE, :NRO_ENVIO, ');
                 SQL.Add(' :DIRECCION_ENVIO, :SU_REFERENCIA, :AGENCIA_TRANSPORTE, :DEBIDOS_PAGADOS) ');
                 SQL.Add(' MATCHING (EMPRESA, NRO_DOCUMENTO) ');
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;

                 Params.ByName['EMPRESA'].AsInteger := QMConfiguracionEMPRESA.AsInteger;
                 Params.ByName['CIF_PROVEEDOR'].AsString := Trim(Copy(aGrid.Cells[0, i], 1, 20));
                 Params.ByName['NRO_DOCUMENTO'].AsString := Trim(Copy(aGrid.Cells[1, i], 1, 40));
                 Params.ByName['CARGO_ABONO'].AsString := Copy(aGrid.Cells[2, i], 1, 15);
                 Params.ByName['FECHA'].AsDateTime := StrToDateYYYYMMDD(aGrid.Cells[3, i]);
                 Params.ByName['CODIGO_CLIENTE'].AsInteger := StrToIntDef(aGrid.Cells[4, i], 0);
                 Params.ByName['CIF_CLIENTE'].AsString := Copy(aGrid.Cells[5, i], 1, 20);
                 Params.ByName['NRO_ENVIO'].AsString := Copy(aGrid.Cells[6, i], 1, 15);
                 Params.ByName['DIRECCION_ENVIO'].AsString := Copy(aGrid.Cells[7, i], 1, 256);
                 Params.ByName['SU_REFERENCIA'].AsString := Copy(aGrid.Cells[8, i], 1, 40);
                 Params.ByName['AGENCIA_TRANSPORTE'].AsString := Copy(aGrid.Cells[9, i], 1, 40);
                 Params.ByName['DEBIDOS_PAGADOS'].AsString := Copy(aGrid.Cells[10, i], 1, 15);

                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        if not Importado then
        begin
           // Si el primer campo no es el CIF del proveedor, el formato de CSV es incorrecto
           if (CIFProveedor <> Trim(Copy(aGrid.Cells[0, i], 1, 20))) or (NroDocumento <> Trim(Copy(aGrid.Cells[1, i], 1, 40))) then
           begin
              ShowMessage(format(_('El albaran %s tiene formato erroneo y no se pueden importar'), [NroDocumento]));

              // Borro el albaran importado ya que sería erroneo
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'DELETE FROM IMP_ALP_COLON_CAB WHERE EMPRESA = :EMPRESA AND NRO_DOCUMENTO = :NRO_DOCUMENTO';
                    Params.ByName['EMPRESA'].AsInteger := QMConfiguracionEMPRESA.AsInteger;
                    Params.ByName['NRO_DOCUMENTO'].AsString := NroDocumento;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              // Evito importar las siguientes lineas
              Importado := True;

              // Para no borrar el fichero para poder debugar luego
              HayError := True;
           end
           else
           begin
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO IMP_ALP_COLON_DET ( ');
                    SQL.Add(' EMPRESA, ID_DETALLES_E, NRO_DOCUMENTO, REFERENCIA, CODIGO_BARRAS, REF_CATALOGO, DESCRIPCION, CANTIDAD, PRECIO_UNITARIO, ');
                    SQL.Add(' DESCUENTO, IMPORTE_TOTAL, ID_A, LINEA) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :EMPRESA, 0, :NRO_DOCUMENTO, :REFERENCIA, :CODIGO_BARRAS, :REF_CATALOGO, :DESCRIPCION, :CANTIDAD, :PRECIO_UNITARIO, ');
                    SQL.Add(' :DESCUENTO, :IMPORTE_TOTAL, 0, 0) ');
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;

                    Params.ByName['EMPRESA'].AsInteger := QMConfiguracionEMPRESA.AsInteger;
                    Params.ByName['NRO_DOCUMENTO'].AsString := Trim(Copy(aGrid.Cells[1, i], 1, 40));
                    Params.ByName['REFERENCIA'].AsString := Copy(aGrid.Cells[11, i], 1, 40);
                    Params.ByName['CODIGO_BARRAS'].AsString := Copy(aGrid.Cells[12, i], 1, 40);
                    Params.ByName['REF_CATALOGO'].AsString := Copy(aGrid.Cells[13, i], 1, 40);
                    Params.ByName['DESCRIPCION'].AsString := Copy(aGrid.Cells[14, i], 1, 256);
                    Params.ByName['CANTIDAD'].AsFloat := StrToFloatDec(aGrid.Cells[15, i], ',');
                    Params.ByName['PRECIO_UNITARIO'].AsFloat := StrToFloatDec(aGrid.Cells[16, i], ',');
                    Params.ByName['DESCUENTO'].AsFloat := StrToFloatDec(aGrid.Cells[17, i], ',');
                    Params.ByName['IMPORTE_TOTAL'].AsFloat := StrToFloatDec(aGrid.Cells[18, i], ',');

                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
     end;

     // Guardo una copia del fichero si hubo un error
     if HayError then
        CopyFileTo(Fichero, Fichero + '.' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.bak');

     DeleteFile(Fichero);
  finally
     aGrid.Free;
  end;
end;

procedure TDMSincronizacionColon.xCabeceraAfterOpen(DataSet: TDataSet);
begin
  with xDetalle do
  begin
     Params.ByName['PROVEEDOR'].AsInteger := QMConfiguracionPROVEEDOR.AsInteger;
     Open;
  end;
end;

procedure TDMSincronizacionColon.xCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDetalle.Close;
end;

end.
