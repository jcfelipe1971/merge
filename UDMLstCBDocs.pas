unit UDMLstCBDocs;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_DBSet, FR_DSet, FR_Class, Fr_HYReport, DB, FIBDataSetRO, FIBDatabase,
  UFIBModificados, Barras, FIBQuery, HYFIBQuery, FIBDataSet, ExtCtrls,
  frxClass, frxHYReport;

type
  TDMLstCBDocs = class(TDataModule)
     frCodBarras: TfrHYReport;
     frUserDSCodBarras: TfrUserDataset;
     frDBxDetalleDoc: TfrDBDataSet;
     xDetalleDoc: TFIBDataSetRO;
     TLocal: THYTransaction;
     DSxDetalleDoc: TDataSource;
     CodBarras: TCodeBar;
     xArtBarras: TFIBDataSetRO;
     xArtTyC: TFIBDataSetRO;
     DSxArtTyC: TDataSource;
     xArtTarifaNOR: TFIBDataSetRO;
     DSxArtTarifaNOR: TDataSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frxCodBarras: TfrxHYReport;
     frxUserDSCodBarras: TfrxUserDataSet;
     xDocOrigen: TFIBDataSetRO;
     DSxDocOrigen: TDataSource;
     xDocDestino: TFIBDataSetRO;
     DSxDocDestino: TDataSource;
     xDetalleDocOrigen: TFIBDataSetRO;
     DSxDetalleDocOrigen: TDataSource;
     xDetalleDocDestino: TFIBDataSetRO;
     DSxDetalleDocDestino: TDataSource;
     xProveedor: TFIBDataSetRO;
     DSxProveedor: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     procedure DMLstCBDocsCreate(Sender: TObject);
     procedure DMLstCBDocsDestroy(Sender: TObject);
     procedure frCodBarrasEnterRect(Memo: TStringList; View: TfrView);
     procedure frCodBarrasGetValue(const ParName: string; var ParValue: variant);
     procedure frDBxDetalleDocFirst(Sender: TObject);
     procedure frDBxDetalleDocNext(Sender: TObject);
     procedure frxCodBarrasBeforePrint(Sender: TfrxReportComponent);
     procedure frxCodBarrasGetValue(const VarName: string; var Value: variant);
     procedure xDetalleDocAfterOpen(DataSet: TDataSet);
     procedure xDocOrigenAfterOpen(DataSet: TDataSet);
     procedure xDocOrigenBeforeClose(DataSet: TDataSet);
     procedure xDocDestinoAfterOpen(DataSet: TDataSet);
     procedure xDocDestinoBeforeClose(DataSet: TDataSet);
  private
     ImgCodBarras: TImage;
     KriConf159: boolean;
     {procedure FiltrarDatos(var str: string; const Tipo: string); No se utiliza}
     procedure DibujarCodBarras(const CodigoBarra: string; const TipoBarra: integer; ICodBarra: TImage; CodBarras: TCodeBar);
     procedure ActualizarCBarras;
  public
     Eti_Vacias: integer;
     MostrarPVP: boolean;
     procedure MostrarListadoCB(Empresa, Ejercicio, Canal, RIG: integer; const Serie, Tipo: string; Modo: integer);
     procedure MostrarListadoProcedencia(IdDoc: integer);
  end;

var
  DMLstCBDocs : TDMLstCBDocs;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMLstCBDocs.DMLstCBDocsCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  ImgCodBarras := TImage.Create(Self);
  Eti_Vacias := 0;
  KriConf159 := (DMMain.EstadoKri(159) = 0); // Si 1, Imprime etiquetas en albaranes de compra segun BULTOS
end;

procedure TDMLstCBDocs.DMLstCBDocsDestroy(Sender: TObject);
begin
  ImgCodBarras.Free;
  CierraData(DMListados);
end;

procedure TDMLstCBDocs.MostrarListadoCB(Empresa, Ejercicio, Canal, RIG: integer; const Serie, Tipo: string; Modo: integer);
begin
  with xDetalleDoc do
  begin
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM C_CREA_CODBARRAS_ALB_FAC ');
     SelectSQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :VACIAS) ');
     SelectSQL.Add(' ORDER BY LINEA ');
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Params.ByName['VACIAS'].AsInteger := Eti_Vacias;
     Open;
  end;

  if not xDetalleDoc.EOF then
     DMListados.Imprimir(96, 0, Modo, '', _('Etiqueta'), frCodBarras, frxCodBarras, nil, nil);
end;

{No se utiliza
procedure TDMLstCBDocs.FiltrarDatos(var str: string; const Tipo: string);
begin
  if Tipo = 'FAP' then
     str := 'SELECT * FROM VER_DETALLE_FACTURA_PROV '
  else
  if Tipo = 'ALP' then
     str := 'SELECT * FROM VER_DETALLE_ALBARAN_PROV '
  else
  if Tipo = 'PEP' then
     str := 'SELECT * FROM VER_DETALLE_PEDIDO_PROV '
  else
  if Tipo = 'PEC' then
     str := 'SELECT * FROM VER_DETALLE_PEDIDO ';

  str := str + 'WHERE (EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ' +
     'CANAL=?CANAL AND SERIE=?SERIE AND RIG=?RIG ) ORDER BY ORDEN';
end;}

procedure TDMLstCBDocs.frCodBarrasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
     // Imagen del CB
     if (Memo[0] = '[ImgCodBarras]') then
        TfrPictureView(View).Picture.Assign(ImgCodBarras.Picture);

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);
  end;
end;

procedure TDMLstCBDocs.frCodBarrasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'MOSTRARPVP' then
     if MostrarPVP then
        ParValue := 1
     else
        ParValue := 0;

  if ParName = 'PVP' then
     if MostrarPVP then
        ParValue := xArtTarifaNOR.FieldByName('PRECIO_VENTA').AsFloat
     else
        ParValue := 0;

  if ParName = 'Proveedor' then
  begin
     if ((xDetalleDoc.FieldByName('TIPO').AsString = 'FAP') or (xDetalleDoc.FieldByName('TIPO').AsString = 'ALP') or (xDetalleDoc.FieldByName('TIPO').AsString = 'PEP')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              if (xDetalleDoc.FieldByName('TIPO').AsString = 'FAP') then
                 SQL.Add('SELECT PROVEEDOR FROM GES_CABECERAS_E_FAP');
              if (xDetalleDoc.FieldByName('TIPO').AsString = 'ALP') then
                 SQL.Add('SELECT PROVEEDOR FROM GES_CABECERAS_E_ALB');
              if (xDetalleDoc.FieldByName('TIPO').AsString = 'PEP') then
                 SQL.Add('SELECT PROVEEDOR FROM GES_CABECERAS_E_PED');
              SQL.Add('WHERE ID_E = ' + xDetalleDoc.FieldByName('ID_E').AsString);
              ExecQuery;
              ParValue := FieldByName['PROVEEDOR'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMLstCBDocs.frDBxDetalleDocFirst(Sender: TObject);
begin
  ActualizarCBarras;
end;

procedure TDMLstCBDocs.frDBxDetalleDocNext(Sender: TObject);
begin
  ActualizarCBarras;
end;

procedure TDMLstCBDocs.ActualizarCBarras;
begin
  if (not xDetalleDoc.EOF) then
  begin
     with xArtBarras do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger :=
           xDetalleDoc.FieldByName('EMPRESA').AsInteger;
        Params.ByName['ARTICULO'].AsString :=
           xDetalleDoc.FieldByName('ARTICULO').AsString;
        Open;
     end;

     DibujarCodBarras(xArtBarras.FieldByName('BARRAS').AsString, xArtBarras.FieldByName('TIPO').AsInteger,
        ImgCodBarras, CodBarras);

     if (not KriConf159) then
     begin
        frUserDSCodBarras.RangeEndCount := xDetalleDoc.FieldByName('UNIDADES').AsInteger;
        frxUserDSCodBarras.RangeEndCount := xDetalleDoc.FieldByName('UNIDADES').AsInteger;
     end
     else
     begin
        frUserDSCodBarras.RangeEndCount := xDetalleDoc.FieldByName('BULTOS').AsInteger;
        frxUserDSCodBarras.RangeEndCount := xDetalleDoc.FieldByName('BULTOS').AsInteger;
     end;
  end;
end;

// Dibujar el cod.barras
procedure TDMLstCBDocs.DibujarCodBarras(const CodigoBarra: string; const TipoBarra: integer; ICodBarra: TImage; CodBarras: TCodeBar);
begin
  ICodBarra.Picture := nil;
  with CodBarras do
  begin
     Codigo := CodigoBarra;
     VerTexto := cboCodigo;
     Texto := CodBarras.Codigo;
     Alto := 60;
     Porcentaje := 10;
     Modulo := 1;
     ChequearDigito := True;
     case TipoBarra of
        3: // Ean13
        begin
           Tipo := cbEAN13;
           OrigenX := 15;
           OrigenY := 15;
           Ratio := 2;
           Fuente.Size := 8;
        end;
        2: // Ean 8
        begin
           Tipo := cbEAN8;
           OrigenX := 20;
           OrigenY := 15;
           Ratio := 2.6;
           Fuente.Size := 11;
        end;
        1: // Code 128
        begin
           Tipo := cb128;
           OrigenX := 3;
           OrigenY := 15;
           Ratio := 2;
           Fuente.Size := 8;
        end;
     end;
  end;
  // Con estas dos líneas no se corta la impresión
  ICodBarra.Height := CodBarras.Alto + CodBarras.OrigenY * 2;
  ICodBarra.Width := CodBarras.Ancho + CodBarras.OrigenX * 2;

  CodBarras.DibujaCodeBar(ICodBarra.Canvas);
  ICodBarra.Refresh;
end;

procedure TDMLstCBDocs.xDetalleDocAfterOpen(DataSet: TDataSet);
begin
  xArtTyC.Close;
  xArtTyC.Open;
  xArtTarifaNOR.Close;
  xArtTarifaNOR.Open;
  xArticulos.Close;
  xArticulos.Open;
end;

procedure TDMLstCBDocs.frxCodBarrasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraE]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
        end;

  // Tratamiento de las Imagenes
  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = '[ImgCodBarras]') then
     begin
        if (ImgCodBarras.Picture <> nil) then
        begin
           TfrxPictureView(Sender).Visible := True;
           TfrxPictureView(Sender).Picture := ImgCodBarras.Picture;
        end
        else
           TfrxPictureView(Sender).Visible := False;
     end;

     if (TfrxPictureView(Sender).TagStr = 'ImgArticulo') then
     begin
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;
  end;
end;

procedure TDMLstCBDocs.frxCodBarrasGetValue(const VarName: string; var Value: variant);
begin
  frCodBarrasGetValue(VarName, Value);
end;

procedure TDMLstCBDocs.MostrarListadoProcedencia(IdDoc: integer);
begin
  /// Es listado para Lonper.
  /// Muestra etiqetas con información del pedido de cliente del que procede.

  with xDetalleDoc do
  begin
     // Los IDs origen y destino de los documentos relacionados
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT CDES.TIPO O_TIPO, CDES.ID_E, DDES.ID_DETALLES_E, CORI.TIPO D_TIPO, CORI.ID_S, DORI.ID_DETALLES_S, ');
     SelectSQL.Add(' DDES.ID_A, DDES.ARTICULO, ');
     // Campos para que no fallen otros sitios que esperan este campo
     SelectSQL.Add(' DDES.EMPRESA, DDES.BULTOS, DDES.UNIDADES ');
     SelectSQL.Add(' FROM GES_DETALLES_E DDES ');
     SelectSQL.Add(' JOIN GES_DETALLES_RELACIONES R ON DDES.ID_DETALLES_E = R.D_ID_DETALLES_S AND DDES.TIPO = R.D_TIPO ');
     SelectSQL.Add(' JOIN GES_DETALLES_S DORI ON R.O_ID_DETALLES_S = DORI.ID_DETALLES_S ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E CDES ON DDES.ID_E = CDES.ID_E ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S CORI ON DORI.ID_S = CORI.ID_S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DDES.TIPO = :O_TIPO AND ');
     SelectSQL.Add(' DDES.ID_E = :O_ID_E AND ');
     SelectSQL.Add(' DORI.TIPO = :D_TIPO ');
     SelectSQL.Add(' ORDER BY DDES.LINEA ');
     Params.ByName['O_TIPO'].AsString := 'PEP';
     Params.ByName['O_ID_E'].AsInteger := IdDoc;
     Params.ByName['D_TIPO'].AsString := 'PEC';
     Open;
  end;

  // Cabeceras y detalle de pedido de venta origen
  xDocOrigen.Open;
  xDocDestino.Open;

  // Cabeceras y detalle de pedido de compra
  xDetalleDocOrigen.Open;
  xDetalleDocDestino.Open;

  DMListados.Imprimir(209, 0, 0, '', _('Etiqueta Procedencia'), frCodBarras, frxCodBarras, nil, nil);
end;

procedure TDMLstCBDocs.xDocOrigenAfterOpen(DataSet: TDataSet);
begin
  xCliente.Open;
end;

procedure TDMLstCBDocs.xDocOrigenBeforeClose(DataSet: TDataSet);
begin
  xCliente.Close;
end;

procedure TDMLstCBDocs.xDocDestinoAfterOpen(DataSet: TDataSet);
begin
  xProveedor.Open;
end;

procedure TDMLstCBDocs.xDocDestinoBeforeClose(DataSet: TDataSet);
begin
  xProveedor.Close;
end;

end.
