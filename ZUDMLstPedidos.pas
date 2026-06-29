unit ZUDMLstPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, Forms, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, DB, FIBDataSetRO, FIBDataSet;

type
  TZDMLstPedidos = class(TDataModule)
     TLocal: THYTransaction;
     frPedidoEsp: TfrHYReport;
     frDBDSPedidoEspCab: TfrDBDataSet;
     xLstPedidoEspCab: TFIBDataSetRO;
     DSxLstPedidoEspCab: TDataSource;
     frPedidoEspDet: TfrHYReport;
     frDBDSCabecera: TfrDBDataSet;
     xLstCabecera: TFIBDataSetRO;
     DSxLstCabecera: TDataSource;
     frDBDSDetalle: TfrDBDataSet;
     xLstDetalle: TFIBDataSetRO;
     DSxLstDetalle: TDataSource;
     frDBDSDetallado: TfrDBDataSet;
     xLstDetallado: TFIBDataSetRO;
     DSxLstDetallado: TDataSource;
     frDBDSPedidoEsp: TfrDBDataSet;
     xLstPedidoEsp: TFIBDataSetRO;
     DSxLstPedidoEsp: TDataSource;
     QMOrden: TFIBDataSetRO;
     DSxQMOrden: TDataSource;
     frDBOrdenes: TfrDBDataSet;
     DSxLstPedidoEsp2: TDataSource;
     xLstPedidoesp2: TFIBDataSetRO;
     frDBDSPedidoEsp2: TfrDBDataSet;
     xLstPedidoEspNavL: TFIBDataSetRO;
     DSxLstPedidoEspNavL: TDataSource;
     frDBDPedidoEspNAvL: TfrDBDataSet;
     DSxLstPedidoEspNavT: TDataSource;
     xLstPedidoEspNavT: TFIBDataSetRO;
     DSxLstPedidoEspNavC: TDataSource;
     xLstPedidoEspNavC: TFIBDataSetRO;
     frDBDPedidoEspNAvT: TfrDBDataSet;
     frDBDPedidoEspNAvC: TfrDBDataSet;
     xLstDetalleEti: TFIBDataSetRO;
     DSxLstDetalleEti: TDataSource;
     frDBDetalleEti: TfrDBDataSet;
     xTextoBultos: TFIBDataSetRO;
     DSxTextoBultos: TDataSource;
     frDBCabBultos: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPedidoEspEnterRect(Memo: TStringList; View: TfrView);
     procedure frPedidoEspGetValue(const ParName: string; var ParValue: variant);
     procedure frPedidoEspPrintReport;
  private
     { Private declarations }
     ID_S: integer;
     EsListadoFinal: integer;
  public
     { Public declarations }
     procedure MostrarListadoLinea(Modo: byte; ID_S, linea: integer);
     procedure MostrarListado(Modo: byte; ID_S: integer);
     procedure MostrarListadoDet(Modo: byte; ID_S: integer);
     procedure MostrarListadoNav(Modo: byte; vID_S: integer; Listado, EsFinal: integer);
     procedure MostrarListadoEtiLinea(Modo: byte; ID_S, linea: integer);
  end;

var
  ZDMLstPedidos : TZDMLstPedidos;

implementation

uses UDMListados, UEntorno, UDMMain, UFormGest, HYFIBQuery, UUtiles, UDMAdjunto;

{$R *.dfm}

procedure TZDMLstPedidos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLstPedidos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLstPedidos.MostrarListado(Modo: byte; ID_S: integer);
begin
  MostrarListadoLinea(Modo, id_s, 0);
end;

procedure TZDMLstPedidos.MostrarListadoLinea(Modo: byte; ID_S, linea: integer);
begin
  with xLstCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstDetalle do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEspCab do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEsp do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEsp2 do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with QMOrden do
  begin
     Close;
     Open;
  end;

  with xTextoBultos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PEC';
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  DMListados.Imprimir(9002, 0, Modo, REntorno.Serie, '', frPedidoEsp, nil, nil, nil);
end;

procedure TZDMLstPedidos.MostrarListadoEtiLinea(Modo: byte; ID_S, linea: integer);
begin
  with xLstCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstDetalleEti do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  DMListados.Imprimir(9012, 0, Modo, REntorno.Serie, '', frPedidoEsp, nil, nil, nil);
end;

procedure TZDMLstPedidos.MostrarListadoNav(Modo: byte; vID_S: integer; Listado, EsFinal: integer);
begin
  ID_S := vID_S;
  EsListadoFinal := EsFinal;

  with xLstCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstDetalle do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEspCab do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEsp do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEspNavL do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEspNavT do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEspNavC do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstPedidoEsp2 do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  QMOrden.DataSource := DSxLstPedidoEsp2;

  with QMOrden do
  begin
     Close;
     Open;
  end;

  REntorno.Copias := 1;
  DMListados.Imprimir(Listado, 0, Modo, REntorno.Serie, '', frPedidoEsp, nil, nil, nil);
end;

procedure TZDMLstPedidos.frPedidoEspEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[ImgBambalina]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xLstPedidoEspNavL.FieldByName('IMAGEN_BAMBALINA').AsInteger, View);

     if (Memo[0] = '[ImgBambalinaL]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xLstPedidoesp2.FieldByName('IMAGEN_BAMBALINA').AsInteger, View);
  end;
end;

procedure TZDMLstPedidos.frPedidoEspGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Z_CodBarras') then
     ParValue := xLstPedidoEsp.FieldByName('COD_BARRAS_PED').AsString + '2'; // Añadimos Digito Control '2'

  if (ParName = 'z_fecha_con_dia_semana') then
     ParValue := FormatDateTime(_('dddd d "de" mmmm "de" yyyy'), xLstPedidoEsp.FieldByName('FECHA').AsDateTime);

  if (ParName = 'z_tiene_motor') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MOTOR FROM Z_GES_DETALLES_S_PED_CAB ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_DETALLES_S = (SELECT ID_DETALLES_S FROM GES_DETALLES_S ');
           SQL.Add('                  WHERE EMPRESA = ?EMPRESA AND ');
           SQL.Add('                  EJERCICIO = ?EJERCICIO AND ');
           SQL.Add('                  CANAL = ?CANAL AND ');
           SQL.Add('                  SERIE = ?SERIES AND ');
           SQL.Add('                  TIPO = ''PEC'' AND ');
           SQL.Add('                  RIG = ?PEDIDO AND ');
           SQL.Add('                  LINEA = ?LINEA_PED) ');
           Params.ByName['EMPRESA'].AsInteger := QMOrden.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMOrden.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMOrden.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIES'].AsString := QMOrden.FieldByName('SERIES').AsString;
           Params.ByName['PEDIDO'].AsInteger := QMOrden.FieldByName('PEDIDO').AsInteger;
           Params.ByName['LINEA_PED'].AsInteger := QMOrden.FieldByName('LINEA_PED').AsInteger;
           ExecQuery;
           ParValue := FieldByName['MOTOR'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (ParName = 'Texto') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE Z_CREA_TEXTO_BULTOS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?ID_S)';
           Params.ByName['EMPRESA'].AsInteger := xLstCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xLstCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := xLstCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := xLstCabecera.FieldByName('SERIE').AsString;
           Params.ByName['TIPO'].AsString := xLstCabecera.FieldByName('TIPO').AsString;
           Params.ByName['ID_S'].AsInteger := xLstCabecera.FieldByName('ID_S').AsInteger;
           ExecQuery;
           ParValue := FieldByName['TEXTO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TZDMLstPedidos.MostrarListadoDet(Modo: byte; ID_S: integer);
begin
  with xLstCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with xLstDetalle do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  DMListados.Imprimir(9003, 0, Modo, REntorno.Serie, '', frPedidoEspDet, nil, nil, nil);
end;

procedure TZDMLstPedidos.frPedidoEspPrintReport;
var
  IdAdjunto : integer;
  Fichero : string;
begin
  // Guardo el PDF de este listado como adjunto del documento.
  // Si existe Borro la version anterior.
  if (EsListadoFinal = 1) then
  begin
     Fichero := _('Informe Especial') + '_' + xLstCabecera.FieldByName('TIPO').AsString + '_' + xLstCabecera.FieldByName('SERIE').AsString + '_' + IntToStr(xLstCabecera.FieldByName('RIG').AsInteger) + '.pdf';
     frPedidoEsp.ShowProgress := False;
     Fichero := ExportarPDF(frPedidoEsp, Fichero);
     frPedidoEsp.ShowProgress := True;

     // Verifico si existe
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID_ADJUNTO FROM VER_ADJUNTOS WHERE ID = :ID_S AND TIPO = :TIPO AND TITULO_ADJUNTO = :TITULO_ADJUNTO';
           Params.ByName['ID_S'].AsInteger := ID_S;
           Params.ByName['TIPO'].AsString := xLstCabecera.FieldByName('TIPO').AsString;
           Params.ByName['TITULO_ADJUNTO'].AsString := _('Informe Especial');
           ExecQuery;
           IdAdjunto := FieldByName['ID_ADJUNTO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (IdAdjunto <> 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'DELETE FROM VER_ADJUNTOS WHERE ID_ADJUNTO = :ID_ADJUNTO AND TIPO = :TIPO AND ID = :ID_S';
              Params.ByName['ID_ADJUNTO'].AsInteger := IdAdjunto;
              Params.ByName['TIPO'].AsString := xLstCabecera.FieldByName('TIPO').AsString;
              Params.ByName['ID_S'].AsInteger := ID_S;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     AbreData(TDMAdjunto, DMAdjunto);
     //IdAdjunto := DMAdjunto.CreaAdjunto(xLstCabecera.FieldByName('TIPO').AsString, ID_S, Fichero, _('Informe Especial'));
     CierraData(DMAdjunto);
  end;
end;

end.
