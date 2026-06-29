unit UDMPedidosEntreAlmacenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, HYFIBQuery, Dialogs;

type
  TDMPedidosEntreAlmacenes = class(TDataModule)
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMCabeceraID: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraALMACEN_ORI: TFIBStringField;
     QMCabeceraALMACEN_DST: TFIBStringField;
     QMCabeceraCOMENTARIO: TFIBStringField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraNOTAS: TBlobField;
     QMDetalleID: TIntegerField;
     QMDetalleID_CAB: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES_PED: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleUNIDADES_ENV: TFloatField;
     QMDetalleUNIDADES_REC: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMCabeceraMOV_MAN_STOCK: TIntegerField;
     TUpdate: THYTransaction;
     QMDetalleSTOCK_ALM: TFloatField;
     QMDetalleSTOCK_ALM2: TFloatField;
     QMDetalleSTOCK_ALM3: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure QMCabeceraAfterEdit(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMCabeceraBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
  private
     { Private declarations }
     Serie: string;
     VerTodos: boolean;
     SQLBase: TStrings;
     AlmacenStock, AlmacenStock2, AlmacenStock3: string;
     StockAlm, StockAlm2, StockAlm3: TStrings;
  public
     { Public declarations }
     procedure CambiaSerie(SerieVar: string);
     procedure CambiaEstado(Estado: integer);
     function BusquedaCompleja: integer;
     procedure GenerarPedidoStockMinimo;
     procedure CambiaVisibilidad(Todos: boolean);
     procedure AgrupaPedidosAbiertos;
     procedure EnviarTodas;
     procedure RecibirTodas;
     procedure ReiniciaStock(Articulo: string = '');
  end;

var
  DMPedidosEntreAlmacenes : TDMPedidosEntreAlmacenes;

implementation

uses UDMMain, UEntorno, uFBusca, Controls, UParam, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMPedidosEntreAlmacenes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);

  QMDetalleUNIDADES_PED.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_ENV.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_REC.DisplayFormat := MascaraI;

  Serie := '';
  VerTodos := True;

  StockAlm := TStringList.Create;
  StockAlm2 := TStringList.Create;
  StockAlm3 := TStringList.Create;

  AlmacenStock := 'NOCALC';
  AlmacenStock2 := 'NOCALC';
  AlmacenStock3 := 'NOCALC';

  SQLBase := TStringList.Create;

  with SQLBase do
  begin
     Clear;
     Add(' SELECT * FROM GES_CABECERAS_PEA ');
     Add(' WHERE ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' ((EJERCICIO = ?EJERCICIO) OR (ESTADO = 0)) AND ');
     Add(' CANAL = ?CANAL ');
     if (Trim(REntorno.AlmacenRestringido) > ' ') then
        Add(' AND ((ALMACEN_ORI = ?ALMACEN) OR (ALMACEN_DST = ?ALMACEN)) ');
  end;

  CambiaVisibilidad(VerTodos);
end;

procedure TDMPedidosEntreAlmacenes.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;

  StockAlm.Free;
  StockAlm2.Free;
  StockAlm3.Free;

  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMCabeceraRIG.AsInteger := DMMain.Contador_EECS(QMCabeceraSERIE.AsString, 'PEA');
     DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_PEA', 'ID');
  end;
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleBeforePost(DataSet: TDataSet);
var
  Stock : double;
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_DETALLES_PEA', 'ID');

  if ((DataSet.State = dsInsert) or (DataSet.State = dsEdit)) then
     if (DMMain.EstadoKri(248) = 1) then
     begin
        if (DMMain.ArticuloControlaStock(QMDetalleARTICULO.AsString)) then
        begin
           Stock := DMMain.DameStockArticuloFecha(QMDetalleEMPRESA.AsInteger, QMDetalleCANAL.AsInteger, QMDetalleARTICULO.AsString, QMCabeceraALMACEN_DST.AsString, QMCabeceraFECHA.AsDateTime);
           if ((Stock - QMDetalleUNIDADES_PED.AsInteger) < 0) then
              MessageDlg(_('No hay stock suficiente en el almacén al que pide.'), mtWarning, [mbOK], 0);
        end;
     end;
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
  QMCabeceraFECHA.AsDateTime := Now;
  QMCabeceraSERIE.AsString := Serie;
  if (Trim(REntorno.AlmacenRestringido) > ' ') then
     QMCabeceraALMACEN_ORI.AsString := REntorno.AlmacenRestringido;

  QMCabeceraALMACEN_DST.AsString := LeeParametro('ALMDPEA001');
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
  begin
     QMCabecera.Post;
     QMDetalle.Edit;
  end;

  QMDetalleID_CAB.AsInteger := QMCabeceraID.AsInteger;
  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleRIG.AsInteger := QMCabeceraRIG.AsInteger;
  QMDetalleUNIDADES_PED.AsInteger := 1;
  QMDetalleUNIDADES_ENV.AsInteger := 0;
  QMDetalleUNIDADES_REC.AsInteger := 0;

  QMDetalleLINEA.AsInteger := DMMain.DameLineaSiguiente('PEA', QMCabeceraID.AsInteger);
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleARTICULOChange(Sender: TField);
begin
  // El precio debe ser del ALMACEN_DST. Es el almacen destino del pedido pero ORIGEN del movimiento generado.
  QMDetallePRECIO.AsFloat := DMMain.DamePrecioMovimientoArticulo(QMDetalleEMPRESA.AsInteger, QMDetalleCANAL.AsInteger, QMDetalleARTICULO.AsString, QMCabeceraALMACEN_DST.AsString, 0, 'T', QMDetallePRECIO.AsFloat);
  QMDetalleTITULO.AsString := DameTituloArticulo(QMDetalleARTICULO.AsString);
end;

procedure TDMPedidosEntreAlmacenes.CambiaEstado(Estado: integer);
begin
  // Por si cambió el estado otro usuario
  QMCabecera.Refresh;

  if (QMCabeceraESTADO.AsInteger <> Estado) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE GES_CABECERAS_PEA SET ESTADO = ?ESTADO WHERE ID = ?ID';
           Params.ByName['ESTADO'].AsInteger := Estado;
           Params.ByName['ID'].AsInteger := QMCabeceraID.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Refresh;
  end;
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraAfterEdit(DataSet: TDataSet);
begin
  if (Trim(REntorno.AlmacenRestringido) > ' ') then
  begin
     if (Trim(REntorno.AlmacenRestringido) = QMCabeceraALMACEN_DST.AsString) then
        QMCabecera.Cancel;
  end;
end;

function TDMPedidosEntreAlmacenes.BusquedaCompleja: integer;
var
  Orden : string;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '1110', False);

  with QMCabecera do
  begin
     Close;
     if (Result <> mrAll) then
     begin
        Orden := OrdenadoPor;
        Ordenar('');

        if not VerTodos then
           SelectSQL.Add(' AND ESTADO = 0 ');
        if (Trim(REntorno.AlmacenRestringido) > ' ') then
           SelectSQL.Add(' AND ((ALMACEN_ORI = ?ALMACEN) OR (ALMACEN_DST = ?ALMACEN)) ');
        if (Trim(Serie) > '') then
           SelectSQL.Add(' AND SERIE = ?SERIE ');

        Ordenar(Orden);

        if (Trim(Serie) > '') then
           Params.ByName['SERIE'].AsString := Serie;
        if (Trim(REntorno.AlmacenRestringido) > ' ') then
           Params.ByName['ALMACEN'].AsString := REntorno.AlmacenRestringido;

        Open;
     end
     else
     begin
        CambiaVisibilidad(VerTodos);
     end;
  end;
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

procedure TDMPedidosEntreAlmacenes.GenerarPedidoStockMinimo;
var
  almacen_dst : string;
begin
  almacen_dst := LeeParametro('ALMDPEA001');

  if (almacen_dst = '') then
  begin
     MessageDlg(_('No hay un almacén de destino por defecto para pedidos entre almacenes'), mtWarning, [mbOK], 0);
  end
  else
  begin
     if (Serie = '') then
        ShowMessage(_('Seleccione una SERIE primero.'))
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE GENERA_PEDIDO_PEA_STOCK_MIN(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA, :ALMACEN_ORI, :ALMACEN_DST)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ALMACEN_ORI'].AsString := REntorno.AlmacenDefecto;
              Params.ByName['ALMACEN_DST'].AsString := almacen_dst;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        QMCabecera.Close;
        QMCabecera.Open;
        QMCabecera.Last;

        ShowMessage(_('Proceso finalizado.'));
     end;
  end;
end;

procedure TDMPedidosEntreAlmacenes.CambiaVisibilidad(Todos: boolean);
begin
  VerTodos := Todos;

  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     if (Trim(Serie) > '') then
        SelectSQL.Add(' AND SERIE = ?SERIE ');
     if not VerTodos then
        SelectSQL.Add(' AND ESTADO = 0 ');
     SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Trim(Serie) > '') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Trim(REntorno.AlmacenRestringido) > ' ') then
        Params.ByName['ALMACEN'].AsString := REntorno.AlmacenRestringido;
     Open;
  end;
end;

procedure TDMPedidosEntreAlmacenes.CambiaSerie(SerieVar: string);
begin
  Serie := SerieVar;

  AlmacenStock := LeeParametro('PEASTKA001', Serie);
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  AlmacenStock2 := LeeParametro('PEASTKA002', Serie);
  if (AlmacenStock2 = '') then
     AlmacenStock2 := 'NOCALC';
  if (AlmacenStock2 <> 'NOCALC') then
     AlmacenStock2 := Copy(AlmacenStock2, 1, 3);

  AlmacenStock3 := LeeParametro('PEASTKA003', Serie);
  if (AlmacenStock3 = '') then
     AlmacenStock3 := 'NOCALC';
  if (AlmacenStock3 <> 'NOCALC') then
     AlmacenStock3 := Copy(AlmacenStock3, 1, 3);

  CambiaVisibilidad(VerTodos);
end;

procedure TDMPedidosEntreAlmacenes.AgrupaPedidosAbiertos;
begin
  if (Serie = '') then
     ShowMessage(_('Seleccione una SERIE primero.'))
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE AGRUPA_PEDIDOS_PEA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabecera.Close;
     QMCabecera.Open;
     QMCabecera.Last;

     ShowMessage(_('Proceso finalizado.'));
  end;
end;

procedure TDMPedidosEntreAlmacenes.EnviarTodas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_DETALLES_PEA SET UNIDADES_ENV = UNIDADES_PED WHERE ID_CAB = :ID_CAB';
        Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPedidosEntreAlmacenes.RecibirTodas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_DETALLES_PEA SET UNIDADES_REC = UNIDADES_ENV WHERE ID_CAB = :ID_CAB';
        Params.ByName['ID_CAB'].AsInteger := QMCabeceraID.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Refresh;
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleCalcFields(DataSet: TDataSet);
var
  i : integer;
  Stock : double;
  Articulo : string;
begin
  if DMMain.ArticuloControlaStock(QMDetalleARTICULO.AsString) then
  begin
     Articulo := QMDetalleARTICULO.AsString;

     Stock := 0;
     if (AlmacenStock <> 'NOCALC') then
     begin
        with StockAlm do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, QMDetalleCANAL.AsInteger, Articulo, AlmacenStock);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock2 <> 'NOCALC') then
     begin
        with StockAlm2 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, QMDetalleCANAL.AsInteger, Articulo, AlmacenStock2);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM2.AsFloat := Stock;

     Stock := 0;
     if (AlmacenStock3 <> 'NOCALC') then
     begin
        with StockAlm3 do
        begin
           i := IndexOfName(Articulo);
           if (i < 0) then
           begin
              Stock := DMMain.DameStockArticulo(REntorno.Empresa, QMDetalleCANAL.AsInteger, Articulo, AlmacenStock3);
              Values[Articulo] := FloatToStr(Stock);
           end
           else
           begin
              Stock := StrToFloat(Values[Articulo]);
           end;
        end;
     end;
     QMDetalleSTOCK_ALM3.AsFloat := Stock;
  end
  else
  begin
     QMDetalleSTOCK_ALM.AsFloat := 0;
     QMDetalleSTOCK_ALM2.AsFloat := 0;
     QMDetalleSTOCK_ALM3.AsFloat := 0;
  end;
end;

procedure TDMPedidosEntreAlmacenes.ReiniciaStock(Articulo: string = '');
var
  i : integer;
begin
  if (Articulo <> '') then
  begin
     with StockAlm do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlm2 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;

     with StockAlm3 do
     begin
        i := IndexOfName(Articulo);
        if (i >= 0) then
           Delete(i);
     end;
  end
  else
  begin
     StockAlm.Clear;
     StockAlm2.Clear;
     StockAlm3.Clear;
  end;
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleAfterPost(DataSet: TDataSet);
begin
  ReiniciaStock(QMDetalleARTICULO.AsString);
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosEntreAlmacenes.QMCabeceraBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

procedure TDMPedidosEntreAlmacenes.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  DMMain.RestingeEdicion(DataSet, QMCabeceraESTADO.AsInteger);
end;

end.
