unit UDMFacturacionAlbCliDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMFacturacionAlbCliDet = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     TLocal: THYTransaction;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetallePIEZAS_X_BULTO: TIntegerField;
     QMDetalleBULTOS: TIntegerField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMDetalleCOMISION: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleB_COMISION: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleI_COMISION: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleNOTAS: TBlobField;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMDetalleNSERIE: TFIBStringField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleENTRADA_FACTURACION: TIntegerField;
     QMDetalleUNIDADES_FACTURADAS: TFloatField;
     QMDetalleUNIDADES_A_FACTURAR: TFloatField;
     QMDetalleLINEA_SERVIDA: TIntegerField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleCLIENTE: TIntegerField;
     QMDetalleTERCERO: TIntegerField;
     TUpdate: THYTransaction;
     QMDetalleFACTURABLE: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleSERIALIZADO: TIntegerField;
     QMDetalleLOTEADO: TIntegerField;
     xSerializacion: TFIBTableSet;
     DSxSerializacion: TDataSource;
     xSerializacionEMPRESA: TIntegerField;
     xSerializacionEJERCICIO: TIntegerField;
     xSerializacionCANAL: TIntegerField;
     xSerializacionSERIE: TFIBStringField;
     xSerializacionTIPO: TFIBStringField;
     xSerializacionRIG: TIntegerField;
     xSerializacionLINEA: TIntegerField;
     xSerializacionCODIGO: TIntegerField;
     xSerializacionCONTADOR: TIntegerField;
     xSerializacionFECHA: TDateTimeField;
     xSerializacionSIGNO: TIntegerField;
     xSerializacionNSERIE: TFIBStringField;
     xSerializacionARTICULO: TFIBStringField;
     xSerializacionALMACEN: TFIBStringField;
     xSerializacionESTADO: TIntegerField;
     xSerializacionFECHA_CADUCIDAD: TDateTimeField;
     xSerializacionFECHA_GARANTIA_CLIENTE: TDateTimeField;
     xSerializacionFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     xSerializacionNOTAS: TMemoField;
     xSerializacionTRASPASADO: TIntegerField;
     xSerializacionID_DOC: TIntegerField;
     xSerializacionENTRADA_FACTURACION: TIntegerField;
     xClientes: TFIBDataSetRO;
     xClientesID_CLIENTE: TIntegerField;
     xClientesCLIENTE: TIntegerField;
     xClientesNOMBRE_R_SOCIAL: TFIBStringField;
     xClientesAVISOS: TMemoField;
     DSxClientes: TDataSource;
     procedure DMFacturacionAlbaranesCreate(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_A_FACTURARChange(Sender: TField);
     procedure QMDetalleP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     ProcesoMasivo: boolean;
     MostrandoLineasServidas: boolean;
     HacerPost: boolean;
     Abriendo: boolean;
     Cliente: integer;
     Serie: string;
     LocalMascaraN: string;
     procedure CalcularTotal;
  public
     { Public declarations }
     procedure FiltrarAlbaranes(aSerie: string; aCliente: integer);
     procedure RefrescarAlbaranes;
     procedure MostrarLineasServidas(mostrar: boolean);
     procedure TraspasarAlbaranesAFactura(SerieDestino: string; FechaDoc, Fecha_Cont: TDateTime);
     procedure AsignaUnidadesAFacturar;
     procedure QuitaUnidadesAFacturar;
  end;

var
  DMFacturacionAlbCliDet : TDMFacturacionAlbCliDet;

implementation

uses UDMMain, UEntorno, UFMFacturas, UFMain, UFMFacturacionAlbCliDet, UUtiles;

{$R *.DFM}

procedure TDMFacturacionAlbCliDet.DMFacturacionAlbaranesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  HacerPost := False;
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDetalleP_COSTE.DisplayFormat := MascaraL;
  QMDetalleLIQUIDO.DisplayFormat := MascaraL;

  Abriendo := True;
  MostrandoLineasServidas := False;
  ProcesoMasivo := False;
  Serie := REntorno.Serie;
  Cliente := 0;
  Abriendo := False;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
end;

procedure TDMFacturacionAlbCliDet.FiltrarAlbaranes(aSerie: string; aCliente: integer);
begin
  // Solo refresco si cambia algun dato
  if ((Serie <> aSerie) or (Cliente <> aCliente)) then
  begin
     Serie := aSerie;
     Cliente := aCliente;
     RefrescarAlbaranes;
  end;
end;

procedure TDMFacturacionAlbCliDet.MostrarLineasServidas(Mostrar: boolean);
begin
  if (Mostrar <> MostrandoLineasServidas) then
  begin
     MostrandoLineasServidas := Mostrar;

     with QMDetalle do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_DETALLE_ALBARAN_CLI ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
        SelectSQL.Add(' CANAL = ?CANAL AND ');
        SelectSQL.Add(' SERIE = ?SERIE AND ');
        SelectSQL.Add(' CLIENTE = ?CLIENTE ');
        if not Mostrar then
           SelectSQL.Add(' AND LINEA_SERVIDA = 0 AND ESTADO = 0');
        SelectSQL.Add(' ORDER BY EJERCICIO, RIG, LINEA ');
     end;

     RefrescarAlbaranes;
  end;
end;

procedure TDMFacturacionAlbCliDet.TraspasarAlbaranesAFactura(SerieDestino: string; FechaDoc, Fecha_Cont: TDateTime);
var
  Contador : integer;
  Documento, Diferencia : string;
begin
  try
     Screen.Cursor := crHourGlass;
     if QMDetalle.State = dsEdit then
        QMDetalle.Post;

     // Verificar que todos los nros. de serie estan asignados.
     Documento := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT D.SERIE, D.RIG, D.LINEA, DA.UNIDADES_A_FACTURAR, ');
           SQL.Add(' (COALESCE((SELECT COUNT(*) ');
           SQL.Add('            FROM GES_DETALLES_SERIALIZACION ');
           SQL.Add('            WHERE ');
           SQL.Add('            EMPRESA = D.EMPRESA AND ');
           SQL.Add('            EJERCICIO = D.EJERCICIO AND ');
           SQL.Add('            CANAL = D.CANAL AND ');
           SQL.Add('            SERIE = D.SERIE AND ');
           SQL.Add('            TIPO = D.TIPO AND ');
           SQL.Add('            RIG = D.RIG AND ');
           SQL.Add('            LINEA = D.LINEA AND ');
           SQL.Add('            ARTICULO = D.ARTICULO AND ');
           SQL.Add('            ENTRADA_FACTURACION = :ENTRADA AND ');
           SQL.Add('            ALMACEN = D.ALMACEN), 0)) UNIDADES_SERIALIZADAS ');
           SQL.Add(' FROM GES_DETALLES_S D ');
           SQL.Add(' JOIN GES_DETALLES_S_ALB DA ON D.ID_DETALLES_S = DA.ID_DETALLES_S ');
           SQL.Add(' JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S ');
           SQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.EJERCICIO <= :EJERCICIO AND ');
           SQL.Add(' C.CANAL = :CANAL AND ');
           SQL.Add(' C.SERIE = :SERIE AND ');
           SQL.Add(' C.CLIENTE = :CLIENTE AND ');
           SQL.Add(' DA.LINEA_SERVIDA = 0 AND ');
           SQL.Add(' DA.ENTRADA_FACTURACION = :ENTRADA AND ');
           SQL.Add(' C.ESTADO = 0 AND ');
           SQL.Add(' A.SERIALIZADO = 1 AND ');
           SQL.Add(' (COALESCE((SELECT COUNT(*) ');
           SQL.Add('            FROM GES_DETALLES_SERIALIZACION ');
           SQL.Add('            WHERE ');
           SQL.Add('            EMPRESA = D.EMPRESA AND ');
           SQL.Add('            EJERCICIO = D.EJERCICIO AND ');
           SQL.Add('            CANAL = D.CANAL AND ');
           SQL.Add('            SERIE = D.SERIE AND ');
           SQL.Add('            TIPO = D.TIPO AND ');
           SQL.Add('            RIG = D.RIG AND ');
           SQL.Add('            LINEA = D.LINEA AND ');
           SQL.Add('            ARTICULO = D.ARTICULO AND ');
           SQL.Add('            ENTRADA_FACTURACION = :ENTRADA AND ');
           SQL.Add('            ALMACEN = D.ALMACEN), 0) <> DA.UNIDADES_A_FACTURAR) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           if (FieldByName['RIG'].AsInteger <> 0) then
           begin
              Documento := Format(_('Albaran %s/%d Linea %d'), [FieldByName['SERIE'].AsString, FieldByName['RIG'].AsInteger, FieldByName['LINEA'].AsInteger]);
              Diferencia := Format(_('Unidades a Facturar: %f, Nros de Serie: %f'), [FieldByName['UNIDADES_A_FACTURAR'].AsFloat, FieldByName['UNIDADES_SERIALIZADAS'].AsFloat]);
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (Documento > '') then
        ShowMessage(Format(_('El documento %s no tiene suficientes nros de serie seleccionados'#13#10 + 'Diferencia: %s'), [Documento, Diferencia]))
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_ALBARAN_CLI_A_FAC ');
              SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, ');
              SQL.Add(' :CLIENTE, :FECHA, :ENTRADA, :FECHA_CON, :SERIE_D) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['SERIE_D'].AsString := SerieDestino;
              Params.ByName['CLIENTE'].AsInteger := Cliente;
              Params.ByName['FECHA'].AsDateTime := FechaDoc;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['FECHA_CON'].AsDateTime := Fecha_Cont;
              ExecQuery;
              Contador := FieldByName['PROC_AUTO'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        RefrescarAlbaranes;

        // Se abren las facturas que genera la facturacion
        FMain.EjecutaAccion(FMain.AFacturas);
        FMFacturas.AgrupacionPedidosFac(SerieDestino, Contador);
     end;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TDMFacturacionAlbCliDet.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFacturacionAlbCliDet.QMDetalleUNIDADES_A_FACTURARChange(Sender: TField);
begin
  /// Verifico que no se facturen mas unidades de las que se recibieron en el albaran

  if (Sender.AsFloat <> 0) then
  begin
     // Si las unidades son positivas o negativas se verifica de forma diferente si se facturan mas de las pedidas
     if (QMdetalleUNIDADES.AsFloat > 0) then
     begin
        if (QMdetalleUNIDADES.AsFloat < (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat)) then
        begin
           ShowMessage(_('Las unidades facturadas no pueden ser mayores que las originales'));
           QMDetalleENTRADA_FACTURACION.AsInteger := 0;
           QMDetalleLINEA_SERVIDA.AsInteger := 0;
           QMDetalleUNIDADES_A_FACTURAR.AsFloat := 0;
        end
        else
        begin
           QMDetalleENTRADA_FACTURACION.AsInteger := REntorno.Entrada;
           if (QMdetalleUNIDADES.AsFloat = (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat)) then
              QMDetalleLINEA_SERVIDA.AsInteger := 1
           else
              QMDetalleLINEA_SERVIDA.AsInteger := 0;
        end;
     end
     else
     begin
        if (QMdetalleUNIDADES.AsFloat > (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat)) then
        begin
           ShowMessage(_('Las unidades facturadas no pueden ser mayores que las originales'));
           QMDetalleENTRADA_FACTURACION.AsInteger := 0;
           QMDetalleLINEA_SERVIDA.AsInteger := 0;
           QMDetalleUNIDADES_A_FACTURAR.AsFloat := 0;
        end
        else
        begin
           QMDetalleENTRADA_FACTURACION.AsInteger := REntorno.Entrada;
           if (QMdetalleUNIDADES.AsFloat = (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat)) then
              QMDetalleLINEA_SERVIDA.AsInteger := 1
           else
              QMDetalleLINEA_SERVIDA.AsInteger := 0;
        end;
     end;
  end
  else
     QMDetalleENTRADA_FACTURACION.AsInteger := 0;
end;

procedure TDMFacturacionAlbCliDet.QMDetalleAfterPost(DataSet: TDataSet);
begin
  CalcularTotal;
end;

procedure TDMFacturacionAlbCliDet.RefrescarAlbaranes;
begin
  try
     Screen.Cursor := crHourGlass;
     with QMDetalle do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Open;
     end;
  finally
     Screen.Cursor := crDefault;
  end;

  CalcularTotal;
end;

procedure TDMFacturacionAlbCliDet.QMDetalleP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDetalleMONEDA.AsString, 0), QMDetalleP_COSTE.AsFloat);
end;

procedure TDMFacturacionAlbCliDet.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xSerializacion.Open;
  xClientes.Open;
  CalcularTotal;
end;

procedure TDMFacturacionAlbCliDet.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xSerializacion.Close;
  xClientes.Close;
end;

procedure TDMFacturacionAlbCliDet.QMDetalleBeforePost(DataSet: TDataSet);
var
  Entrada : integer;
begin
  // No permito marcar un albaran no facturable
  if (QMDetalleFACTURABLE.AsInteger = 0) then
  begin
     QMDetalleENTRADA_FACTURACION.AsInteger := 0;
     QMDetalleUNIDADES_A_FACTURAR.AsFloat := 0;
  end;

  // Marco o desmarco los nros de serie a asignar a la factura.
  // Si se desmarca o si son todas las unidades lo hago automaticamente.
  // Si solo es parte no lo hago porque no se cuales fueron las ya traspasadas.
  if (QMDetalleSERIALIZADO.AsInteger = 1) then
  begin
     Entrada := 0;
     if ((QMDetalleUNIDADES_A_FACTURAR.AsFloat = QMDetalleUNIDADES.AsFloat) and (QMDetalleENTRADA_FACTURACION.AsInteger = REntorno.Entrada)) then
        Entrada := REntorno.Entrada;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE VER_DETALLE_SERIALIZACION ');
           SQL.Add(' SET ');
           SQL.Add('   ENTRADA_FACTURACION = :ENTRADA_FACTURACION ');
           SQL.Add(' WHERE ');
           SQL.Add('   EMPRESA = :EMPRESA AND ');
           SQL.Add('   EJERCICIO = :EJERCICIO AND ');
           SQL.Add('   CANAL = :CANAL AND ');
           SQL.Add('   SERIE = :SERIE AND ');
           SQL.Add('   TIPO = :TIPO AND ');
           SQL.Add('   RIG = :RIG AND ');
           SQL.Add('   LINEA = :LINEA ');
           Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
           Params.ByName['ENTRADA_FACTURACION'].AsInteger := Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Actualizo la entrada para que restrinja la modificación de documento impreso según usuario.
  QMDetalleENTRADA.AsFloat := REntorno.Entrada;
end;

procedure TDMFacturacionAlbCliDet.CalcularTotal;
var
  ImporteSeleccionado : double;
begin
  if not ProcesoMasivo then
  begin
     // Esta suma no tiene en cuenta importes de cabecera (portes, descuentos, IRPF, etc.)
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(DA.UNIDADES_A_FACTURAR * D.LIQUIDO / D.UNIDADES) ');
           SQL.Add(' FROM GES_DETALLES_S D ');
           SQL.Add(' JOIN GES_DETALLES_S_ALB DA ON D.ID_DETALLES_S = DA.ID_DETALLES_S ');
           SQL.Add(' JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.EJERCICIO <= :EJERCICIO AND ');
           SQL.Add(' C.CANAL = :CANAL AND ');
           SQL.Add(' C.SERIE = :SERIE AND ');
           SQL.Add(' C.CLIENTE = :CLIENTE AND ');
           SQL.Add(' DA.LINEA_SERVIDA = 0 AND ');
           SQL.Add(' DA.ENTRADA_FACTURACION = :ENTRADA AND ');
           SQL.Add(' C.ESTADO = 0 ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           ImporteSeleccionado := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     FMFacturacionAlbCliDet.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
  end;
end;

procedure TDMFacturacionAlbCliDet.AsignaUnidadesAFacturar;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        ProcesoMasivo := True;
        First;
        while not EOF do
        begin
           // Pongo a 0 si no está seleccionada
           if (QMDetalleENTRADA_FACTURACION.AsInteger <> REntorno.Entrada) and (QMDetalleUNIDADES_A_FACTURAR.AsFloat <> 0) then
           begin
              Edit;
              QMDetalleUNIDADES_A_FACTURAR.AsFloat := 0;
              Post;
           end;

           if (QMDetalleENTRADA_FACTURACION.AsInteger <> REntorno.Entrada) then
           begin
              Edit;
              QMDetalleUNIDADES_A_FACTURAR.AsFloat := QMDetalleUNIDADES.AsFloat - QMDetalleUNIDADES_FACTURADAS.AsFloat;
              Post;
           end;

           Next;
        end;
     finally
        ProcesoMasivo := False;
        CalcularTotal;
        EnableControls;
     end;

     Close;
     Open;
  end;
end;

procedure TDMFacturacionAlbCliDet.QuitaUnidadesAFacturar;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        ProcesoMasivo := True;
        First;
        while not EOF do
        begin
           if (QMDetalleUNIDADES_A_FACTURAR.AsFloat <> 0) then
           begin
              Edit;
              QMDetalleUNIDADES_A_FACTURAR.AsFloat := 0;
              Post;
           end;

           Next;
        end;
     finally
        ProcesoMasivo := False;
        CalcularTotal;
        EnableControls;
     end;

     Close;
     Open;
  end;
end;

end.
