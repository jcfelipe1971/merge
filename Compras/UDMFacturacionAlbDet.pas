unit UDMFacturacionAlbDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  HYFIBQuery, FIBDataSetRO;

type
  TDMFacturacionAlbDet = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xSeries: TFIBTableSet;
     DSxSeries: TDataSource;
     xSeriesEMPRESA: TIntegerField;
     xSeriesEJERCICIO: TIntegerField;
     xSeriesCANAL: TIntegerField;
     xSeriesSERIE: TFIBStringField;
     xSeriesTITULO: TFIBStringField;
     TLocal: THYTransaction;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetallePROVEEDOR: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleUNIDADES_ORIGINALES: TFloatField;
     QMDetalleUNIDADES_FACTURADAS: TFloatField;
     QMDetalleUNIDADES_POR_FACTURAR: TFloatField;
     QMDetalleUNIDADES_A_FACTURAR: TFloatField;
     QMDetalleLINEA_SERVIDA: TIntegerField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetallePAIS: TFIBStringField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleENTRADA_FACTURACION: TIntegerField;
     QMDetalleNUM_ALBARAN: TStringField;
     xSeriesDest: TFIBTableSet;
     DSxSeriesDest: TDataSource;
     xSeriesDestEMPRESA: TIntegerField;
     xSeriesDestEJERCICIO: TIntegerField;
     xSeriesDestCANAL: TIntegerField;
     xSeriesDestSERIE: TFIBStringField;
     xSeriesDestTITULO: TFIBStringField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     xDocumentos: TFIBDataSetRO;
     DSxDocumentos: TDataSource;
     TUpdate: THYTransaction;
     QMDetalleFAMILIA: TStringField;
     QMDetalleSUBFAMILIA: TStringField;
     QMDetalleESTADO: TIntegerField;
     procedure DMFacturacionAlbaranesCreate(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure xSeriesAfterScroll(DataSet: TDataSet);
     procedure QMDetalleUNIDADES_A_FACTURARChange(Sender: TField);
     procedure QMDetalleP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleENTRADA_FACTURACIONChange(Sender: TField);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     MostrandoLineasServidas: boolean;
     ProcesoMasivo: boolean;
     HacerPost: boolean;
     Contador: integer;
     Canal: integer;
     Proveedor: integer;
     ImporteSeleccionado: double;
     LocalMascaraN: string;
     procedure AbreDocumentos;
     procedure FiltraQuery(aProveedor: integer; Serie: string);
     function AceptaCambioCanal: boolean;
     procedure MuestraDocumentos(Destino, ser: string; Contador, CanalDestino: integer);
  public
     { Public declarations }
     procedure FiltrarAlbaranes(aProveedor: integer);
     procedure RefrescarAlbaranes;
     procedure MostrarLineasServidas(mostrar: boolean);
     procedure TraspasarAlbaranesAFactura(Fecha_Cont: TDateTime);
     procedure MuestraErrores;
     function HayErrores: boolean;
     procedure SetCanalDestino(aCanal: integer);
     procedure AsignaUnidadesAFacturar;
     procedure QuitaUnidadesAFacturar;
  end;

var
  DMFacturacionAlbDet : TDMFacturacionAlbDet;

implementation

uses UDMMain, UEntorno, UFormGest, UFMFacturasAProveedor,
  UFMControlErroresFactura, UFMFacturacionAlbDet, UFMain,
  UFMControlAgrupPedidos;

{$R *.DFM}

procedure TDMFacturacionAlbDet.DMFacturacionAlbaranesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  HacerPost := False;
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  // QMDetalleP_COSTE.DisplayFormat := MascaraL;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  ImporteSeleccionado := 0;
  FMFacturacionAlbDet.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));

  DMMain.FiltraTabla(xSeries, '11100', True);
  DMMain.FiltraTabla(xSeriesDest, '11100', True);
  MostrandoLineasServidas := False;
  ProcesoMasivo := False;
end;

procedure TDMFacturacionAlbDet.FiltrarAlbaranes(aProveedor: integer);
begin
  FiltraQuery(aProveedor, xSeriesSERIE.AsString);
end;

procedure TDMFacturacionAlbDet.RefrescarAlbaranes;
begin
  try
     Screen.Cursor := crHourGlass;
     FiltraQuery(Proveedor, xSeriesSERIE.AsString);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TDMFacturacionAlbDet.MostrarLineasServidas(Mostrar: boolean);
begin
  if (Mostrar <> MostrandoLineasServidas) then
  begin
     MostrandoLineasServidas := Mostrar;
     with QMDetalle do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_DETALLE_ALBARAN_FAC ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
        SelectSQL.Add(' CANAL = ?CANAL AND ');
        SelectSQL.Add(' SERIE = ?SERIE AND ');
        SelectSQL.Add(' TIPO = ''ALP'' AND ');
        SelectSQL.Add(' PROVEEDOR = ?PROVEEDOR ');
        if not Mostrar then
           SelectSQL.Add(' AND LINEA_SERVIDA = 0 ');
        SelectSQL.Add(' ORDER BY EJERCICIO, RIG, LINEA ');
        Open;
     end;
     RefrescarAlbaranes;
  end;
end;

procedure TDMFacturacionAlbDet.TraspasarAlbaranesAFactura(Fecha_Cont: TDateTime);
begin
  Screen.Cursor := crHourGlass;
  try
     if QMDetalle.State = dsEdit then
        QMDetalle.Post;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_ALBARAN_PROV_A_FAC ');
           SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?PROVEEDOR, ');
           SQL.Add(' ?FECHA, ?ENTRADA, ?FECHA_CON, ?SERIE_D, ?D_CANAL) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := xSeriesSERIE.AsString;
           Params.ByName['SERIE_D'].AsString := xSeriesDestSERIE.AsString;
           Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['FECHA_CON'].AsDateTime := Fecha_Cont;
           Params.ByName['D_CANAL'].AsInteger := Canal;
           ExecQuery;
           Contador := FieldByName['PROC_AUTO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if HayErrores then
        MuestraErrores;

     RefrescarAlbaranes;
     if (REntorno.Canal = Canal) then
        AbreDocumentos
     else
        MuestraDocumentos('FAP', xSeries.FieldByName('SERIE').AsString, Contador, Canal);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TDMFacturacionAlbDet.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFacturacionAlbDet.QMDetalleUNIDADES_A_FACTURARChange(Sender: TField);
begin
  if Sender.AsFloat <> 0 then
     QMDetalleENTRADA_FACTURACION.AsInteger := REntorno.Entrada{Entrada}
  else
     QMDetalleENTRADA_FACTURACION.AsInteger := 0;

  if ((QMdetalleUNIDADES_ORIGINALES.AsFloat > 0) and (QMdetalleUNIDADES_ORIGINALES.AsFloat < (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat))) or
     ((QMdetalleUNIDADES_ORIGINALES.AsFloat < 0) and (QMdetalleUNIDADES_ORIGINALES.AsFloat > (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat))) then
  begin
     ShowMessage(_('Las unidades facturadas no pueden ser mayores que las originales'));
     QMDetalleLINEA_SERVIDA.AsInteger := 0;
     QMDetalleUNIDADES_A_FACTURAR.AsFloat := 0;
     QMDetalleENTRADA_FACTURACION.AsInteger := 0;
  end
  else
  begin
     if QMdetalleUNIDADES_ORIGINALES.AsFloat =
        (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat) then
     begin
        QMDetalleLINEA_SERVIDA.AsInteger := 1;
     end;

     if QMdetalleUNIDADES_ORIGINALES.AsFloat >
        (Sender.AsFloat + QMDetalleUNIDADES_FACTURADAS.AsFloat) then
     begin
        QMDetalleLINEA_SERVIDA.AsInteger := 0;
     end;
  end;
end;

procedure TDMFacturacionAlbDet.xSeriesAfterScroll(DataSet: TDataSet);
begin
  RefrescarAlbaranes;
end;

procedure TDMFacturacionAlbDet.AbreDocumentos;
begin
  // Se abren las facturas que genera la facturacion
  FMain.EjecutaAccion(FMain.AFacturasProv);
  FMFacturasAProveedor.FiltraFacturacion(xSeriesDestSERIE.AsString, Contador);
end;

procedure TDMFacturacionAlbDet.FiltraQuery(aProveedor: integer; Serie: string);
begin
  Proveedor := aProveedor;

  with QMDetalle do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMFacturacionAlbDet.QMDetalleP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDetalleMONEDA.AsString, 0),
     QMDetalleP_COSTE.AsFloat);
end;

function TDMFacturacionAlbDet.HayErrores: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturacionAlbDet.MuestraErrores;
begin
  FMControlErroresFactura := TFMControlErroresFactura.Create(Self);
  FMControlErroresFactura.ShowModal;
  FMControlErroresFactura.Free;
end;

procedure TDMFacturacionAlbDet.SetCanalDestino(aCanal: integer);
begin
  Canal := aCanal;
end;

procedure TDMFacturacionAlbDet.MuestraDocumentos(Destino, ser: string; Contador, CanalDestino: integer);
begin
  with xDocumentos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := Ser;
     Params.ByName['TIPO'].AsString := destino;
     Params.ByName['CONTADOR'].AsInteger := Contador;
     Open;
  end;

  if (AceptaCambioCanal) then
  begin
     CierraFormsMenos(FMFacturacionAlbDet);
     FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, Canal);
     AbreDocumentos;
     FMFacturacionAlbDet.Close;
  end;
end;

function TDMFacturacionAlbDet.AceptaCambioCanal: boolean;
begin
  FMControlAgrupPedidos := TFMControlAgrupPedidos.Create(DMFacturacionAlbDet);
  FMControlAgrupPedidos.AsignaDataSource(DMFacturacionAlbDet.DSxDocumentos);
  Result := (FMControlAgrupPedidos as TFMControlAgrupPedidos).Inicializa;
  FMControlAgrupPedidos.Free;
end;

procedure TDMFacturacionAlbDet.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  { TODO : El calculo debe tener en cuenta las unidades seleccionadas de cada linea }

  ImporteSeleccionado := 0;

  with DataSet do
  begin
     DisableControls;
     try
        if RecordCount > 0 then
        begin
           while not EOF do
           begin
              if (QMDetalleENTRADA_FACTURACION.AsInteger = REntorno.Entrada) then
                 ImporteSeleccionado := ImporteSeleccionado + QMDetalleLIQUIDO.AsFloat;
              Next;
           end;
           First;
        end;
     finally
        EnableControls;
     end;
  end;

  FMFacturacionAlbDet.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
end;

procedure TDMFacturacionAlbDet.QMDetalleENTRADA_FACTURACIONChange(Sender: TField);
begin
  { TODO : El calculo debe tener en cuenta las unidades seleccionadas de cada linea }

  if (QMDetalleENTRADA_FACTURACION.AsInteger = REntorno.Entrada) then
     ImporteSeleccionado := ImporteSeleccionado + QMDetalleLIQUIDO.AsFloat
  else
     ImporteSeleccionado := ImporteSeleccionado - QMDetalleLIQUIDO.AsFloat;

  FMFacturacionAlbDet.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
end;

procedure TDMFacturacionAlbDet.QMDetalleCalcFields(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FAMILIA, SUBFAMILIA FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULIO';
        Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
        Params.ByName['ARTICULIO'].AsString := QMDetalleARTICULO.AsString;
        ExecQuery;
        QMDetalleFAMILIA.AsString := FieldByName['FAMILIA'].AsString;
        QMDetalleSUBFAMILIA.AsString := FieldByName['SUBFAMILIA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturacionAlbDet.QMDetalleBeforePost(DataSet: TDataSet);
begin
  // Actualizo la entrada para que restrinja la modificación de documento impreso según usuario.
  QMDetalleENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TDMFacturacionAlbDet.AsignaUnidadesAFacturar;
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
        EnableControls;
     end;

     Close;
     Open;
  end;
end;

procedure TDMFacturacionAlbDet.QuitaUnidadesAFacturar;
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
        EnableControls;
     end;

     Close;
     Open;
  end;
end;

end.
