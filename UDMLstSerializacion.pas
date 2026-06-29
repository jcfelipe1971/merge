unit UDMLstSerializacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport, ExtCtrls, Barras,
  FR_DSet, UFormGest, FR_DBSet, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMLstSerializacion = class(TDataModule)
     TLocal: THYTransaction;
     frNumSerie: TfrHYReport;
     frUDNumSerie: TfrUserDataset;
     frDBImpSerie: TfrDBDataSet;
     DSQMImpresion: TDataSource;
     QMImpresion: TFIBTableSet;
     QMImpresionUSUARIO: TIntegerField;
     QMImpresionARTICULO: TFIBStringField;
     QMImpresionNUM_SERIE: TFIBStringField;
     QMImpresionDESCRIPCION: TFIBStringField;
     xArticulos: TFIBDataSetRO;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xArtDesde: TFIBTableSetRO;
     DSxArtDesde: TDataSource;
     xArtHasta: TFIBTableSetRO;
     DSxArtHasta: TDataSource;
     xArtDesdeTITULO: TFIBStringField;
     xArtHastaTITULO: TFIBStringField;
     xSerieDesde: TFIBTableSetRO;
     DSxSerieDesde: TDataSource;
     DSxSerieHasta: TDataSource;
     xSerieDesdeNSERIE: TFIBStringField;
     xSerieHasta: TFIBTableSetRO;
     FIBStringField1: TFIBStringField;
     frSerializacion: TfrHYReport;
     frDBSerializacion: TfrDBDataSet;
     QMLstSerializacion: TFIBDataSetRO;
     DSSerializacion: TDataSource;
     QMLstSerializacionEMPRESA: TIntegerField;
     QMLstSerializacionCANAL: TIntegerField;
     QMLstSerializacionCODIGO: TIntegerField;
     QMLstSerializacionNSERIE: TFIBStringField;
     QMLstSerializacionARTICULO: TFIBStringField;
     QMLstSerializacionALMACEN: TFIBStringField;
     QMLstSerializacionESTADO: TIntegerField;
     QMLstSerializacionFECHA_CADUCIDAD: TDateTimeField;
     QMLstSerializacionFECHA_GARANTIA_CLIENTE: TDateTimeField;
     QMLstSerializacionFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     QMLstSerializacionNOTAS: TBlobField;
     QMLstSerializacionDEVUELTO_PROV: TIntegerField;
     QMLstSerializacionCONTADOR: TIntegerField;
     QMLstSerializacionACTIVO: TIntegerField;
     xOrigen: TFIBDataSetRO;
     xOrigenEMPRESA: TIntegerField;
     xOrigenEJERCICIO: TIntegerField;
     xOrigenCANAL: TIntegerField;
     xOrigenSERIE: TFIBStringField;
     xOrigenRIG: TIntegerField;
     xOrigenLINEA: TIntegerField;
     xOrigenTIPO: TFIBStringField;
     xOrigenID_ORDEN: TIntegerField;
     xOrigenFECHA: TDateTimeField;
     DSxOrigen: TDataSource;
     DSxDestino: TDataSource;
     xDestino: TFIBDataSetRO;
     xDestinoEMPRESA: TIntegerField;
     xDestinoEJERCICIO: TIntegerField;
     xDestinoCANAL: TIntegerField;
     xDestinoSERIE: TFIBStringField;
     xDestinoRIG: TIntegerField;
     xDestinoLINEA: TIntegerField;
     xDestinoTIPO: TFIBStringField;
     xDestinoID_ORDEN: TIntegerField;
     xDestinoFECHA: TDateTimeField;
     frDBxOrigen: TfrDBDataSet;
     frDBxDestino: TfrDBDataSet;
     QEmpresa: THYFIBQuery;
     xMostrarStock: TFIBDataSetRO;
     frDBMostrarStock: TfrDBDataSet;
     DSxMostrarStock: TDataSource;
     xMostrarStockEMPRESA: TIntegerField;
     xMostrarStockCANAL: TIntegerField;
     xMostrarStockCODIGO: TIntegerField;
     xMostrarStockALMACEN: TFIBStringField;
     xMostrarStockNSERIE: TFIBStringField;
     xMostrarStockARTICULO: TFIBStringField;
     xMostrarStockEJERCICIO: TIntegerField;
     xMostrarStockGES_CANAL: TIntegerField;
     xMostrarStockGES_SERIE: TFIBStringField;
     xMostrarStockGES_TIPO: TFIBStringField;
     xMostrarStockGES_RIG: TIntegerField;
     xMostrarStockGES_LINEA: TIntegerField;
     xMostrarStockPRO_TIPO: TIntegerField;
     xMostrarStockPRO_ID_ORDEN: TIntegerField;
     xMostrarStockPRO_LINEA: TIntegerField;
     procedure DMLstSerializacionCreate(Sender: TObject);
     procedure DMLstSerializacionDestroy(Sender: TObject);
     procedure frNumSerieEnterRect(Memo: TStringList; View: TfrView);
     procedure frDBImpSerieFirst(Sender: TObject);
     procedure frDBImpSerieNext(Sender: TObject);
     procedure QMImpresionNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMImpresionNUM_SERIEChange(Sender: TField);
     procedure QMImpresionBeforeOpen(DataSet: TDataSet);
     procedure frNumSerieGetValue(const ParName: string; var ParValue: variant);
     procedure QMLstSerializacionAfterOpen(DataSet: TDataSet);
     procedure frSerializacionGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     ImgCodBarras: TImage;
     CodBarras: TCodeBar;
     EtiquetasVacias: integer;
     NumCopias: integer;
     HayVacias: boolean;
  public
     { Public declarations }
     FechaListado: TDateTime; //sfg.albert
     Comentario, RangoSeries: string; //sfg.albert
     procedure LanzarListado(Vacias, Copias, Columnas, modo: integer);
     procedure DibujaCodBarras(const cod_barra: string; const ICodBarra: TImage; CodBarras: TCodeBar);
     procedure RefrescaArt(Tabla: TFIBDataSetRO; art: string); //sfg.albert
     procedure RefrescaSerie(Tabla: TFIBDataSetRO; serie, canal, almacen, articulo: string); //sfg.albert
     procedure MostrarListado(modo, mostrar, empresa, canal: integer; articulodesde, articulohasta, nseriedesde, nseriehasta, almacen: string); //sfg.abert
  end;

var
  DMLstSerializacion : TDMLstSerializacion;

implementation

uses UDMMain, UDMListados, UEntorno;

{$R *.DFM}

procedure TDMLstSerializacion.DMLstSerializacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMImpresion.Open;
  AbreData(TDMListados, DMListados);
end;

procedure TDMLstSerializacion.LanzarListado(Vacias, Copias, Columnas, modo: integer);
var
  str : string;
begin
  EtiquetasVacias := Vacias;
  NumCopias := Copias;
  ImgCodBarras := TImage.Create(Self);
  CodBarras := TCodeBar.Create(Self);

  with QMImpresion do
  begin
     Close;
     //Params.ByName[ 'ENTRADA' ].AsInteger := REntorno.Entrada ;
     Open;
  end;

  case Columnas of
     2: DMListados.Cargar(76, REntorno.Serie);
     3: DMListados.Cargar(77, REntorno.Serie);
     4: DMListados.Cargar(78, REntorno.Serie);
  end;

  frNumSerie.LoadFromFIB(REntorno.Formato, str);
  frNumSerie.PrepareReport;

  case modo of
     0: frNumSerie.ShowPreparedReport;
     1: frNumSerie.PrintPreparedReport('', REntorno.Copias);
  end;

  DMListados.LimpiaEntorno;
  ImgCodBarras.Free;
  CodBarras.Free;
end;

procedure TDMLstSerializacion.DMLstSerializacionDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstSerializacion.frNumSerieEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[ImgCodBarras]') then
        TfrPictureView(View).Picture.Assign(ImgCodBarras.Picture);
     View.Visible := not (HayVacias);
  end;
end;

procedure TDMLstSerializacion.DibujaCodBarras(const cod_barra: string; const ICodBarra: TImage; CodBarras: TCodeBar);
begin
  // Dibujamos el código de Barras
  ICodBarra.Picture := nil;
  with CodBarras do
  begin
     Codigo := cod_barra;
     VerTexto := cboCodigo;
     Texto := '*' + CodBarras.Codigo + '*';
     Alto := 55;
     Porcentaje := 10;
     Modulo := 1;
     ChequearDigito := True;
     Tipo := cb128;
     Ratio := 2.5;
     Fuente.Size := 10;
     ICodBarra.Width := CodBarras.Ancho + 10;
     OrigenX := Trunc((ICodBarra.Width / 2) - (CodBarras.Ancho / 2));
     OrigenY := 15;
  end;
  CodBarras.DibujaCodeBar(IcodBarra.Canvas);
  ICodBarra.Refresh;
end;

procedure TDMLstSerializacion.frDBImpSerieFirst(Sender: TObject);
begin
  HayVacias := (EtiquetasVacias > 0);
  if (HayVacias) then
     frUDNumSerie.RangeEndCount := EtiquetasVacias
  else
  begin
     frUDNumSerie.RangeEndCount := NumCopias;
     DibujaCodBarras(QMImpresionNUM_SERIE.AsString, ImgCodBarras, CodBarras);
  end;
end;

procedure TDMLstSerializacion.frDBImpSerieNext(Sender: TObject);
begin
  if (HayVacias) then
  begin
     HayVacias := False;
     frUDNumSerie.RangeEndCount := NumCopias;
     QMImpresion.Close;
     QMImpresion.Open;
  end
  else
  begin
     frUDNumSerie.RangeEndCount := NumCopias;
     DibujaCodBarras(QMImpresionNUM_SERIE.AsString, ImgCodBarras, CodBarras);
  end;
end;

procedure TDMLstSerializacion.QMImpresionNewRecord(DataSet: TDataSet);
begin
  QMImpresionUSUARIO.AsInteger := REntorno.Usuario;
end;

procedure TDMLstSerializacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMLstSerializacion.QMImpresionNUM_SERIEChange(Sender: TField);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
  QMImpresionARTICULO.AsString := xArticulos.FieldByName('ARTICULO').AsString;
  QMImpresionDESCRIPCION.AsString := xArticulos.FieldByName('TITULO').AsString;
end;

procedure TDMLstSerializacion.QMImpresionBeforeOpen(DataSet: TDataSet);
begin
  QMImpresion.Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
end;

procedure TDMLstSerializacion.frNumSerieGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstSerializacion.RefrescaArt(Tabla: TFIBDataSetRO; art: string); //sfg.albert
begin
  with Tabla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := art;
     Open;
  end;
end;

procedure TDMLstSerializacion.RefrescaSerie(Tabla: TFIBDataSetRO; serie, canal, almacen, articulo: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := StrToInt(canal);
     Params.ByName['ALMACEN'].AsString := almacen;
     Params.ByName['SERIE'].AsString := serie;
     //Params.ByName['ARTICULO'].AsString := articulo;
     Open;
  end;
end;

procedure TDMLstSerializacion.MostrarListado(modo, mostrar, empresa, canal: integer; articulodesde, articulohasta, nseriedesde, nseriehasta, almacen: string);
var
  str : string;
  grupo : integer;
begin
  {SELECT * FROM ART_ARTICULOS_SERIALIZACION
where EMPRESA=?empresa AND CANAL = ?canal
AND ARTICULO between ?artdesde  and ?arthasta
AND ALMACEN =?almacen
AND ACTIVO = 1
AND NSERIE between ?nseriedesde and ?nseriehasta
}

  grupo := 8210;
  if (mostrar = 0) then
     grupo := 8210
  else
  if (mostrar = 1) then
     grupo := 8211;

  QMLstserializacion.Close;
  QMLstserializacion.Params.ByName['empresa'].AsInteger := empresa;
  QMLstserializacion.Params.ByName['canal'].AsInteger := canal;
  QMLstserializacion.Params.ByName['artdesde'].AsString := articulodesde;
  QMLstserializacion.Params.ByName['arthasta'].AsString := articulohasta;
  QMLstserializacion.Params.ByName['almacen'].AsString := almacen;
  QMLstserializacion.Params.ByName['nseriedesde'].AsString := nseriedesde;
  QMLstserializacion.Params.ByName['nseriehasta'].AsString := nseriehasta;
  QMLstserializacion.Open;

  DMListados.Imprimir(grupo, modo, '', str, frSerializacion, nil); //Listado de serializzcion
end;

procedure TDMLstSerializacion.QMLstSerializacionAfterOpen(DataSet: TDataSet);
begin
  xOrigen.Open;
  xDestino.Open;
  xMostrarStock.Open;
end;

procedure TDMLstSerializacion.frSerializacionGetValue(const ParName: string; var ParValue: variant);
begin
  if (Trim(ParName) = 'FechaListado') then
     ParValue := fechalistado;

  if (Trim(ParName) = 'RangoSeries') then
     ParValue := rangoseries;

  if (Trim(ParName) = 'Comentario') then
     ParValue := comentario;

  if Trim(ParName) = 'Empresa' then
  begin
     with QEmpresa do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        ExecQuery;
        ParValue := FieldByName['titulo'].AsString;
     end;
  end;

  //Llistat de serialització (stock)
  if (Trim(ParName) = 'tipo') then
  begin
     if (xMostrarStockGES_TIPO.AsString <> '') then
        ParValue := xMostrarStockGES_TIPO.AsString
     else if (xMostrarStockPRO_TIPO.AsInteger <> 0) then
        ParValue := _('PRO')
     else
        ParValue := _('MANUAL');
  end;

  if (Trim(ParName) = 'rig') then
  begin
     if (xMostrarStockGES_TIPO.AsString <> '') then
        ParValue := xMostrarStockGES_RIG.AsInteger
     else if (xMostrarStockPRO_TIPO.AsInteger <> 0) then
        ParValue := xMostrarStockPRO_ID_ORDEN.AsInteger
     else
        ParValue := 0;
  end;

  if (Trim(ParName) = 'linea') then
  begin
     if (xMostrarStockGES_TIPO.AsString <> '') then
        ParValue := xMostrarStockGES_LINEA.AsInteger
     else if (xMostrarStockPRO_TIPO.AsInteger <> 0) then
        ParValue := xMostrarStockPRO_LINEA.AsInteger
     else
        ParValue := 0;
  end;
end;

end.
