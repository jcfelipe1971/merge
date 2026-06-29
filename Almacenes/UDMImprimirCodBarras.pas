unit UDMImprimirCodBarras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_DSet, FR_Class, Fr_HYReport,
  ExtCtrls, Barras, FR_DBSet, HYFIBQuery, FIBDataSetRO;

type
  TDMImprimirCodBarras = class(TDataModule)
     TLocal: THYTransaction;
     QMImpCBCabecera: TFIBTableSet;
     DSQMImpCBCabecera: TDataSource;
     QMImpCBDetalle: TFIBTableSet;
     DSQMImpCBDetalle: TDataSource;
     QMImpCBCabeceraEMPRESA: TIntegerField;
     QMImpCBCabeceraEJERCICIO: TIntegerField;
     QMImpCBCabeceraCANAL: TIntegerField;
     QMImpCBCabeceraNUMERO: TIntegerField;
     QMImpCBCabeceraTITULO: TFIBStringField;
     frCodBarras: TfrHYReport;
     frUserDSCodBarras: TfrUserDataset;
     frDBQMImpCBDetalle: TfrDBDataSet;
     TUpdate: THYTransaction;
     QMImpCBCabeceraTIPO_DOC: TFIBStringField;
     QMImpCBCabeceraID_DOC: TIntegerField;
     DSQMImpCBArticulo: TDataSource;
     QMImpCBArticulo: TFIBDataSetRO;
     QMImpCBCabeceraDOCUMENTO: TStringField;
     DSQMImpCBLote: TDataSource;
     QMImpCBLote: TFIBDataSetRO;
     DSQMImpCBCodCliente: TDataSource;
     QMImpCBCodCliente: TFIBDataSetRO;
     QMImpCBCabeceraCLIENTE: TIntegerField;
     xTrabajoExterno: TFIBDataSetRO;
     DSxTrabajoExterno: TDataSource;
     QMImpCBDetalleEMPRESA: TIntegerField;
     QMImpCBDetalleEJERCICIO: TIntegerField;
     QMImpCBDetalleCANAL: TIntegerField;
     QMImpCBDetalleNUMERO: TIntegerField;
     QMImpCBDetalleLINEA: TIntegerField;
     QMImpCBDetalleARTICULO: TFIBStringField;
     QMImpCBDetalleCOD_BARRAS: TFIBStringField;
     QMImpCBDetalleNUM_COPIAS: TIntegerField;
     QMImpCBDetalleTIPO: TIntegerField;
     QMImpCBDetalleID_DETALLE_DOC: TIntegerField;
     QMImpCBDetalleFECHA: TDateTimeField;
     QMImpCBDetalleALFA_6: TFIBStringField;
     QMImpCBDetalleID_LOTE: TIntegerField;
     QMImpCBDetalleUNIDADES: TIntegerField;
     QMImpCBDetalleLOTE: TFIBStringField;
     QMImpCBDetalleTARIFA: TFIBStringField;
     QMImpCBDetallePRECIO_VENTA: TFloatField;
     QMImpCBDetallePESO: TFloatField;
     QMImpCBDetalleIMPORTE_VENTA: TFloatField;
     QMImpCBDetalleTITULO: TFIBStringField;
     procedure DMImprimirCodBarrasCreate(Sender: TObject);
     procedure QMImpCBCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMImpCBCabeceraNewRecord(DataSet: TDataSet);
     procedure QMImpCBCabeceraBeforePost(DataSet: TDataSet);
     procedure QMImpCBDetalleNewRecord(DataSet: TDataSet);
     procedure QMImpCBDetalleCOD_BARRASChange(Sender: TField);
     procedure frCodBarrasEnterRect(Memo: TStringList; View: TfrView);
     procedure DMImprimirCodBarrasDestroy(Sender: TObject);
     procedure frDBQMImpCBDetalleNext(Sender: TObject);
     procedure frDBQMImpCBDetalleFirst(Sender: TObject);
     procedure frCodBarrasGetValue(const ParName: string; var ParValue: variant);
     procedure QMImpCBCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMImpCBDetalleBeforePost(DataSet: TDataSet);
     procedure QMImpCBDetalleAfterOpen(DataSet: TDataSet);
     procedure QMImpCBDetalleBeforeClose(DataSet: TDataSet);
     procedure QMImpCBDetalleBeforeInsert(DataSet: TDataSet);
     procedure QMImpCBDetalleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMImpCBDetalleARTICULOChange(Sender: TField);
     procedure QMImpCBDetalleTARIFAChange(Sender: TField);
     procedure QMImpCBCabeceraCalcFields(DataSet: TDataSet);
     procedure QMImpCBCabeceraAfterPost(DataSet: TDataSet);
     procedure QMImpCBCodClienteBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
     ImgCodBarras: TImage;
     CodBarras: TCodeBar;
     // SQLDetalleBase: TStrings;
     cb_id_lote, cb_id_detalle_doc: integer;
     cb_tipo, cb_cod_barra, cb_articulo: string;
     Param_ALBETIQ001: integer;
     Param_ALBETIQ002: boolean;
     NumeroInsertado: integer;
     function TipoCodBarras(const cb, art: string): integer;
     procedure ActualizaPrecio;
  public
     { Public declarations }
     procedure DibujarCodBarras(const cod_barra: string; tipo_barra: integer; ICodBarra: TImage; CodBarras: TCodeBar);
     function DevolverArticulo: string;
     procedure ImprimirCodBarras(Modo: integer; ImgCB: TImage; Listado: smallint; EtiquetasVacias: integer = 0);
     procedure ImportarDatos(TipoDoc: string; IdDoc: integer; IdArticulo: integer = 0);
     procedure ImportarDatosSql(TipoDoc: string; IdDoc: integer; sqlImpresion: TStrings);
     procedure BusquedaArticulo(Descripcion: string);
     // procedure FiltrarDetalle(Articulo: string; FechaCreacion: TDateTime);
     procedure EstableceCantidadCopias(Cantidad: integer);
  end;

var
  DMImprimirCodBarras : TDMImprimirCodBarras;

implementation

{$R *.DFM}

uses UDMMain, UUtiles, UDameDato, UEntorno, UDMListados, UFormGest, IdGlobal, UParam;

procedure TDMImprimirCodBarras.DMImprimirCodBarrasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Param_ALBETIQ001 := StrToIntDef(LeeParametro('ALBETIQ001'), 0);

  DMMain.FiltraTabla(QMImpCBCabecera, '11100', True);
  AbreData(TDMListados, DMListados);  // Abrir DM de Listados

  AsignaDisplayFormat(QMImpCBCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMImpCBDetalle, MascaraN, MascaraI, ShortDateFormat);

  NumeroInsertado := 0;
end;

procedure TDMImprimirCodBarras.DMImprimirCodBarrasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMImprimirCodBarras.QMImpCBCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMImpCBDetalle.Open;
end;

procedure TDMImprimirCodBarras.QMImpCBCabeceraNewRecord(DataSet: TDataSet);
begin
  QMImpCBCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMImpCBCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMImpCBCabeceraCANAL.AsInteger := REntorno.Canal;
  QMImpCBCabeceraNUMERO.AsInteger := 0;
  QMImpCBCabeceraTIPO_DOC.AsString := 'ALP';
  QMImpCBCabeceraID_DOC.AsInteger := 0;
end;

procedure TDMImprimirCodBarras.QMImpCBCabeceraBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMImpCBCabeceraNUMERO.AsInteger = 0)) then
     QMImpCBCabeceraNUMERO.AsInteger := DMMain.Contador_EEC('ICB');

  if (Trim(QMImpCBCabeceraTITULO.AsString) = '') then
     QMImpCBCabeceraTITULO.AsString := Format(_('Etiquetas Nro %d'), [QMImpCBCabeceraNUMERO.AsInteger]);
  NumeroInsertado := QMImpCBCabeceraNUMERO.AsInteger;
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleNewRecord(DataSet: TDataSet);
begin
  // Antes de grabar el detalle, grabamos la cabeceras
  if ((QMImpCBCabecera.State = dsInsert) or (QMImpCBCabecera.State = dsEdit)) then
  begin
     QMImpCBCabecera.Post;
     QMImpCBDetalle.Edit;
  end;

  // Valores por defecto
  QMImpCBDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMImpCBDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMImpCBDetalleCANAL.AsInteger := REntorno.Canal;
  QMImpCBDetalleNUMERO.AsInteger := QMImpCBCabeceraNUMERO.AsInteger;
  QMImpCBDetalleNUM_COPIAS.AsInteger := 1;
  QMImpCBDetalleLINEA.AsInteger := 0;
  QMImpCBDetalleID_DETALLE_DOC.AsInteger := 0;
  QMImpCBDetalleTARIFA.AsString := REntorno.TarifaDefecto;
end;

function TDMImprimirCodBarras.DevolverArticulo: string;
begin
  Result := QMImpCBDetalleARTICULO.AsString;
end;

// Obtener el tipo del código de Barras
procedure TDMImprimirCodBarras.QMImpCBDetalleCOD_BARRASChange(Sender: TField);
begin
  QMImpCBDetalleTIPO.AsInteger := TipoCodBarras(QMImpCBDetalleCOD_BARRAS.AsString,
     QMImpCBDetalleARTICULO.AsString);
end;

// Obtener el tipo del código de barras
function TDMImprimirCodBarras.TipoCodBarras(const cb, art: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = :EMPRESA AND BARRAS = :BARRAS AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['BARRAS'].AsString := cb;
        Params.ByName['ARTICULO'].AsString := art;
        ExecQuery;
        Result := FieldByName['TIPO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// ---------------   Impresión de Cód. de Barras   ---------------

procedure TDMImprimirCodBarras.ImprimirCodBarras(Modo: integer; ImgCB: TImage; Listado: smallint; EtiquetasVacias: integer = 0);
var
  str : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO ART_IMPRESION_CB_DETALLE ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, NUM_COPIAS, ARTICULO) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :NUMERO, :LINEA, :NUM_COPIAS, :ARTICULO) ');
        SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, ARTICULO) ');
        Params.ByName['EMPRESA'].AsInteger := QMImpCBCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMImpCBCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMImpCBCabeceraCANAL.AsInteger;
        Params.ByName['NUMERO'].AsInteger := QMImpCBCabeceraNUMERO.AsInteger;
        Params.ByName['LINEA'].AsInteger := -1;
        Params.ByName['NUM_COPIAS'].AsInteger := EtiquetasVacias;
        Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMImpCBDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT D.*, ');
     SelectSQL.Add('        (SELECT FIRST 1 TITULO_LARGO ');
     SelectSQL.Add('         FROM ART_ARTICULOS ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         EMPRESA = D.EMPRESA AND ');
     SelectSQL.Add('         ARTICULO = D.ARTICULO) AS TITULO, ');
     SelectSQL.Add('        (SELECT FIRST 1 LOTE ');
     SelectSQL.Add('         FROM ART_ARTICULOS_LOTES ');
     SelectSQL.Add('         WHERE ');
     SelectSQL.Add('         ID_LOTE = D.ID_LOTE) AS LOTE ');
     SelectSQL.Add(' FROM ART_IMPRESION_CB_DETALLE D ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' D.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' D.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' D.CANAL = :CANAL AND ');
     SelectSQL.Add(' D.NUMERO = :NUMERO ');
     SelectSQL.Add(' ORDER BY D.LINEA ');

     Open;
  end;

  // Asignamos la imagen del CB
  ImgCodBarras := ImgCB;

  // Creamos el Codigo de barras
  CodBarras := TCodeBar.Create(Self);
  try
     DMListados.Cargar(69, '', Listado);
     frCodBarras.LoadFromFIB(REntorno.Formato, str);
     frCodBarras.PrepareReport;
     case modo of
        0: frCodBarras.ShowPreparedReport;
        1: frCodBarras.PrintPreparedReport('', REntorno.Copias);
     end;

     DMListados.LimpiaEntorno;
  finally
     // Eliminamos el cod.barras
     CodBarras.Free;
  end;
end;

procedure TDMImprimirCodBarras.frDBQMImpCBDetalleFirst(Sender: TObject);
begin
  DibujarCodBarras(QMImpCBDetalleCOD_BARRAS.AsString, QMImpCBDetalleTIPO.AsInteger,
     ImgCodBarras, CodBarras);
  frUserDSCodBarras.RangeEndCount := QMImpCBDetalleNUM_COPIAS.AsInteger;
end;

procedure TDMImprimirCodBarras.frDBQMImpCBDetalleNext(Sender: TObject);
begin
  DibujarCodBarras(QMImpCBDetalleCOD_BARRAS.AsString, QMImpCBDetalleTIPO.AsInteger,
     ImgCodBarras, CodBarras);
  frUserDSCodBarras.RangeEndCount := QMImpCBDetalleNUM_COPIAS.AsInteger;
end;

procedure TDMImprimirCodBarras.frCodBarrasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[ImgCodBarras]') then
        TfrPictureView(View).Picture.Assign(ImgCodBarras.Picture);

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(QMImpCBArticulo.FieldByName('IMAGEN').AsInteger, View);
  end;
end;

// ---------------------------------------------------------

// Dibujar el cod.barras
procedure TDMImprimirCodBarras.DibujarCodBarras(const cod_barra: string; tipo_barra: integer; ICodBarra: TImage; CodBarras: TCodeBar);
var
  i : integer;
begin
  ICodBarra.Picture := nil;

  // Si el codigo de barras tiene letras lo represento como CODE128
  for i := 1 to Length(cod_barra) do
     if (not IsNumeric(cod_barra[i])) then
        tipo_barra := 1;

  with CodBarras do
  begin
     Codigo := cod_barra;
     VerTexto := cboCodigo;
     Texto := CodBarras.Codigo;
     Alto := 60;
     Porcentaje := 10;
     Modulo := 1;
     ChequearDigito := True;
     case tipo_barra of
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

  CodBarras.DibujaCodeBar(ICodBarra.Canvas);

  ICodBarra.Refresh;
end;

procedure TDMImprimirCodBarras.frCodBarrasGetValue(const ParName: string; var ParValue: variant);
var
  Idioma : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if Copy(UpperCase(ParName), 1, 13) = 'TITULOIDIOMA_' then
  begin
     Idioma := Copy(UpperCase(ParName), 14, 3);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM ART_ARTICULOS_IDIOMAS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO AND IDIOMA = :IDIOMA';
           Params.ByName['EMPRESA'].AsInteger := QMImpCBDetalleEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMImpCBDetalleARTICULO.AsString;
           Params.ByName['IDIOMA'].AsString := Copy(Idioma, 1, 3);
           ExecQuery;
           ParValue := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if Copy(UpperCase(ParName), 1, 4) = 'GS1_' then
  begin
     if UpperCase(ParName) = 'GS1_01_17_10' then
     begin
        // Para DRASA
        // (01)DUN14 (17)FECHA CADUCIDAD (10)LOTE
        ParValue := '¿' + '01' + QMImpCBDetalleALFA_6.AsString + '17' + FormatDateTime('yymmdd', QMImpCBLote.FieldByName('F_CADUCIDAD').AsDateTime) + '10' + QMImpCBDetalleLOTE.AsString;
     end;
  end;

  if Copy(UpperCase(ParName), 1, 10) = 'TEXTO_GS1_' then
  begin
     if UpperCase(ParName) = 'TEXTO_GS1_01_17_10' then
     begin
        // Para DRASA
        // (01)DUN14 (17)FECHA CADUCIDAD (10)LOTE
        ParValue := '(01)' + QMImpCBDetalleALFA_6.AsString + '(17)' + FormatDateTime('yymmdd', QMImpCBLote.FieldByName('F_CADUCIDAD').AsDateTime) + '(10)' + QMImpCBDetalleLOTE.AsString;
     end;
  end;
end;

procedure TDMImprimirCodBarras.QMImpCBCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMImpCBDetalle.Close;
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleBeforePost(DataSet: TDataSet);
begin
  // Calculamos el número de línea siguiente
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_CABECERA_CB_LINEA_SIGUIENTE (:EMPRESA, :EJERCICIO, :CANAL, :NUMERO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['NUMERO'].AsInteger := QMImpCBDetalleNUMERO.AsInteger;
           ExecQuery;
           QMImpCBDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Si los datos del nuevo registro son vacios o cero asignamos los datos del anterior
  if (QMImpCBDetalleARTICULO.AsString = '') then
  begin
     QMImpCBDetalleARTICULO.AsString := cb_articulo;

     if (QMImpCBDetalleID_LOTE.AsInteger = 0) then
        QMImpCBDetalleID_LOTE.AsInteger := cb_id_lote;
     if (QMImpCBDetalleID_DETALLE_DOC.AsInteger = 0) then
        QMImpCBDetalleID_DETALLE_DOC.AsInteger := cb_id_detalle_doc;
  end;
end;

procedure TDMImprimirCodBarras.ImportarDatos(TipoDoc: string; IdDoc: integer; IdArticulo: integer = 0);
var
  TablaCabecera, TablaDetalle : string;
  CampoId, CampoIdDetalle, CampoOrden, CampoArticulo, CampoUnidades : string;
  Descripcion : string;
  Numero : integer;
begin
  // Datos que dependen de donde sacaré los datos
  CampoId := '';
  CampoArticulo := 'ARTICULO';
  CampoUnidades := 'UNIDADES';
  if (Pos(TipoDoc, 'OFC,PEC,ALB,FAC') > 0) then
  begin
     TablaCabecera := 'GES_CABECERAS_S';
     TablaDetalle := 'GES_DETALLES_S';
     CampoId := 'ID_S';
     CampoIdDetalle := 'ID_DETALLES_S';
     CampoOrden := 'ORDEN';
     if (Param_ALBETIQ002) then
        CampoUnidades := 'BULTOS';
  end
  else
  if (Pos(TipoDoc, 'OFP,OCP,PEP,ALP,FAP') > 0) then
  begin
     TablaCabecera := 'GES_CABECERAS_E';
     TablaDetalle := 'GES_DETALLES_E';
     CampoId := 'ID_E';
     CampoIdDetalle := 'ID_DETALLES_E';
     CampoOrden := 'ORDEN';
     if (Param_ALBETIQ002) then
        CampoUnidades := 'BULTOS';
  end
  else
  if (Pos(TipoDoc, 'MOE,MOS,MOT') > 0) then
  begin
     TablaCabecera := 'GES_CABECERAS_ST';
     TablaDetalle := 'GES_DETALLES_ST';
     CampoId := 'ID_ST';
     CampoIdDetalle := 'ID_DETALLES_ST';
     CampoOrden := 'LINEA';
  end
  else
  if (Pos(TipoDoc, 'REG') > 0) then
  begin
     TablaCabecera := 'ART_REG_INVENTARIO';
     TablaDetalle := 'ART_REG_INVENTARIO_DETALLE';
     CampoId := 'ID_REG';
     CampoIdDetalle := 'ID_REG_DETALLE';
     CampoOrden := 'LINEA';
  end
  else
  if (Pos(TipoDoc, 'PRO') > 0) then
  begin
     TablaCabecera := 'PRO_ORD';
     TablaDetalle := 'PRO_ORD_MAT';
     CampoId := 'ID_ORDEN';
     CampoIdDetalle := 'ID_ORDEN_MAT';
     CampoOrden := 'LINEA_MAT';
     CampoArticulo := 'COMPONENTE';
     CampoUnidades := 'UNIDADES_NEC';
  end;

  // ?Otros

  // Si es uno de los tipos validos
  if (CampoId > '') then
  begin
     // Busco datos del documento origen para crear descripcion de cabecera
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM ' + TablaCabecera + ' WHERE ' + CampoId + '=:ID';
           Params.ByName['ID'].AsInteger := IdDoc;
           ExecQuery;
           if (TipoDoc = 'REG') then
              Descripcion := TipoDoc + '-' + FieldByName['EJERCICIO_MOV'].AsString + '-' + FieldByName['RIG'].AsString
           else
           if (TipoDoc = 'PRO') then
              Descripcion := TipoDoc + '-' + FieldByName['EJERCICIO'].AsString + '-' + FieldByName['RIG_OF'].AsString
           else
              Descripcion := TipoDoc + '-' + FieldByName['EJERCICIO'].AsString + '-' + FieldByName['RIG'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Creo cabecera
     Numero := DMMain.Contador_EEC('ICB');
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO ART_IMPRESION_CB_CABECERA (EMPRESA, EJERCICIO, CANAL, NUMERO, TITULO, TIPO_DOC, ID_DOC) VALUES (:EMPRESA, :EJERCICIO, :CANAL, :NUMERO, :TITULO, :TIPO_DOC, :ID_DOC)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['NUMERO'].AsInteger := Numero;
           Params.ByName['TITULO'].AsString := Descripcion;
           Params.ByName['TIPO_DOC'].AsString := TipoDoc;
           Params.ByName['ID_DOC'].AsInteger := IdDoc;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Creo detalles
     // Inserto los articulos que tienen codigo de barra.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO ART_IMPRESION_CB_DETALLE ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, NUMERO, LINEA, ARTICULO, ID_DETALLE_DOC, COD_BARRAS, NUM_COPIAS, TIPO, FECHA, UNIDADES ');

           SQL.Add(')');
           SQL.Add(' SELECT :EMPRESA, :EJERCICIO, :CANAL, :NUMERO, 0, D.' + CampoArticulo + ', D.' + CampoIdDetalle + ', ');
           SQL.Add('        (SELECT FIRST 1 BARRAS ');
           SQL.Add('         FROM ART_ARTICULOS_BARRAS ');

           SQL.Add('         WHERE ');
           SQL.Add('         EMPRESA = D.EMPRESA AND ');
           SQL.Add('         ARTICULO = D.' + CampoArticulo + ' ');
           SQL.Add('         ORDER BY TIPO DESC), ');
           // Obtenemos la cantidad de etiquetas a imprimir
           if (Param_ALBETIQ001 <> 0) then
              SQL.Add(format(' %d, ', [Param_ALBETIQ001]))
           else
              SQL.Add(' D.' + CampoUnidades + ', ');

           SQL.Add('        (SELECT FIRST 1 TIPO ');
           SQL.Add('         FROM ART_ARTICULOS_BARRAS ');
           SQL.Add('         WHERE ');
           SQL.Add('         EMPRESA = D.EMPRESA AND ');
           SQL.Add('         ARTICULO = D.' + CampoArticulo + ' ');
           SQL.Add('         ORDER BY TIPO DESC) ');

           // Si se trata de un inventario se inserta la fecha de creacion
           if (TipoDoc = 'REG') then
              SQL.Add(' , D.FECHA_CREACION ')
           else
              SQL.Add(' , ''NOW'' ');
           SQL.Add(' , ' + CampoUnidades);
           SQL.Add(' FROM ' + TablaDetalle + ' D ');
           SQL.Add(' WHERE ');
           if (IdArticulo > 0) then
              SQL.Add(' ID_A = ' + IntToStr(IdArticulo) + ' AND ');
           SQL.Add(' D.' + CampoId + ' = :ID AND ');
           SQL.Add(' (EXISTS(SELECT BARRAS ');
           SQL.Add('         FROM ART_ARTICULOS_BARRAS ');
           SQL.Add('         WHERE ');
           SQL.Add('         EMPRESA = D.EMPRESA AND ');
           SQL.Add('         ARTICULO = D.' + CampoArticulo + ')) ');
           SQL.Add(' ORDER BY D.' + CampoOrden);
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['NUMERO'].AsInteger := Numero;
           Params.ByName['ID'].AsInteger := IdDoc;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with QMImpCBCabecera do
     begin
        Close;
        Open;
        Last;
        while ((not BOF) and (FieldByName('NUMERO').AsInteger <> Numero)) do
           Prior;
     end;
  end;
end;

procedure TDMImprimirCodBarras.ImportarDatosSql(TipoDoc: string; IdDoc: integer; sqlImpresion: TStrings);
var
  Numero : integer;
begin
  // Creo cabecera
  Numero := DMMain.Contador_EEC('ICB');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO ART_IMPRESION_CB_CABECERA (EMPRESA, EJERCICIO, CANAL, NUMERO, TITULO, TIPO_DOC, ID_DOC) VALUES (:EMPRESA, :EJERCICIO, :CANAL, :NUMERO, :TITULO, :TIPO_DOC, :ID_DOC)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NUMERO'].AsInteger := Numero;
        Params.ByName['TITULO'].AsString := TipoDoc + '-' + IntToStr(IdDoc) + ' (SQL)';
        Params.ByName['TIPO_DOC'].AsString := TipoDoc;
        Params.ByName['ID_DOC'].AsInteger := IdDoc;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Creo detalles
  // Inserto los articulos que tienen codigo de barra.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := sqlImpresion.Text;
        Params.ByName['NUMERO'].AsInteger := Numero;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMImpCBCabecera do
  begin
     Close;
     Open;
     Last;
     while ((not BOF) and (FieldByName('NUMERO').AsInteger <> Numero)) do
        Prior;
  end;
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleAfterOpen(DataSet: TDataSet);
begin
  QMImpCBArticulo.Open;
  QMImpCBLote.Open;
  QMImpCBCodCliente.Open;
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleBeforeClose(DataSet: TDataSet);
begin
  QMImpCBArticulo.Close;
  QMImpCBLote.Close;
  QMImpCBCodCliente.Close;
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleBeforeInsert(DataSet: TDataSet);
begin
  cb_id_lote := QMImpCBDetalleID_LOTE.AsInteger;
  cb_tipo := QMImpCBDetalleTIPO.AsString;
  cb_cod_barra := QMImpCBDetalleCOD_BARRAS.AsString;
  cb_articulo := QMImpCBDetalleARTICULO.AsString;
  cb_id_detalle_doc := QMImpCBDetalleID_DETALLE_DOC.AsInteger;
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMImpCBDetalleID_LOTE.AsInteger);
end;

procedure TDMImprimirCodBarras.ActualizaPrecio;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PRECIO_VENTA FROM A_ART_DAME_PRECIOS_TARIFA(:EMPRESA, :TARIFA, :ARTICULO, :UNIDADES) ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := QMImpCBDetalleTARIFA.AsString;
        Params.ByName['ARTICULO'].AsString := QMImpCBDetalleARTICULO.AsString;
        Params.ByName['UNIDADES'].AsFloat := QMImpCBDetalleUNIDADES.AsFloat;
        ExecQuery;
        QMImpCBDetallePRECIO_VENTA.AsFloat := FieldByName['PRECIO_VENTA'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleARTICULOChange(Sender: TField);
begin
  // Si no existe el articulo lo busco en otras tablas (Cod. Barra, Nro. Serie, Cod. Cliente)
  if (DameIdArticulo(Sender.AsString) <= 0) then
     BusquedaArticulo(Sender.AsString);

  ActualizaPrecio;

  if (QMImpCBDetalleARTICULO.AsString <> '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 BARRAS, TIPO ');
           SQL.Add(' FROM ART_ARTICULOS_BARRAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ARTICULO = :ARTICULO ');
           SQL.Add(' ORDER BY TIPO DESC ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := QMImpCBDetalleARTICULO.AsString;
           ExecQuery;
           QMImpCBDetalleCOD_BARRAS.AsString := FieldByName['BARRAS'].AsString;
           QMImpCBDetalleTIPO.AsString := FieldByName['TIPO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  QMImpCBDetalleTITULO.AsString := DameTituloArticulo(QMImpCBDetalleARTICULO.AsString);
end;

procedure TDMImprimirCodBarras.QMImpCBDetalleTARIFAChange(Sender: TField);
begin
  ActualizaPrecio;
end;

procedure TDMImprimirCodBarras.QMImpCBCabeceraCalcFields(DataSet: TDataSet);
var
  Tipo : string;
  Id : integer;
begin
  Tipo := QMImpCBCabeceraTIPO_DOC.AsString;
  Id := QMImpCBCabeceraID_DOC.AsInteger;

  if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (Tipo = 'OFC') then
              SQL.Text := 'SELECT ''' + _('Oferta') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG, CLIENTE FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           if (Tipo = 'PEC') then
              SQL.Text := 'SELECT ''' + _('Pedido') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG, CLIENTE FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           if (Tipo = 'ALB') then
              SQL.Text := 'SELECT ''' + _('Albaran') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG, CLIENTE FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           if (Tipo = 'FAC') then
              SQL.Text := 'SELECT ''' + _('Factura') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG, CLIENTE FROM GES_CABECERAS_S WHERE ID_S=' + IntToStr(ID);
           ExecQuery;
           QMImpCBCabeceraDOCUMENTO.AsString := Fields[0].AsString;
           QMImpCBCabeceraCLIENTE.AsInteger := Fields[1].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP') or (Tipo = 'FCR')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (Tipo = 'OFP') then
              SQL.Text := 'SELECT ''' + _('Oferta Prov.') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'OCP') then
              SQL.Text := 'SELECT ''' + _('Oferta Confirmada Prov.') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'PEP') then
              SQL.Text := 'SELECT ''' + _('Pedido') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'ALP') then
              SQL.Text := 'SELECT ''' + _('Albaran') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'FAP') then
              SQL.Text := 'SELECT ''' + _('Factura') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
           if (Tipo = 'FCR') then
              SQL.Text := 'SELECT ''' + _('Factura') + ' - ''||EJERCICIO||''.''||SERIE||''/''||RIG FROM GES_CABECERAS_E WHERE ID_E=' + IntToStr(ID);
           ExecQuery;
           QMImpCBCabeceraDOCUMENTO.AsString := Fields[0].AsString;
           QMImpCBCabeceraCLIENTE.AsInteger := 0;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMImprimirCodBarras.QMImpCBCabeceraAfterPost(DataSet: TDataSet);
begin
  if (QMImpCBCabeceraNUMERO.AsInteger = NumeroInsertado) then
  begin
     if ((QMImpCBCabeceraID_DOC.AsInteger > 0) and (Trim(QMImpCBCabeceraTIPO_DOC.AsString) <> '')) then
        ImportarDatos(QMImpCBCabeceraTIPO_DOC.AsString, QMImpCBCabeceraID_DOC.AsInteger);
     NumeroInsertado := 0;
  end;
end;

procedure TDMImprimirCodBarras.BusquedaArticulo(Descripcion: string);
var
  evt : TFieldNotifyEvent;
begin
  evt := QMImpCBDetalleARTICULO.OnChange;
  try
     QMImpCBDetalleARTICULO.OnChange := nil;
     QMImpCBDetalleARTICULO.AsString := DMMain.BusquedaArticulo(Descripcion, '', 0);
  finally
     QMImpCBDetalleARTICULO.OnChange := evt;
  end;
end;

procedure TDMImprimirCodBarras.EstableceCantidadCopias(Cantidad: integer);
var
  Unidades : integer;
begin
  with QMImpCBDetalle do
  begin
     First;
     while (not EOF) do
     begin
        if (Cantidad = -1) then
        begin
           Unidades := FieldByName('UNIDADES').AsInteger;
           if (Unidades < 0) then
              Unidades := 0;
        end
        else
           Unidades := Cantidad;

        if (FieldByName('NUM_COPIAS').AsInteger <> Unidades) then
        begin
           Edit;
           FieldByName('NUM_COPIAS').AsInteger := Unidades;
           Post;
        end;

        Next;
     end;

     First;
  end;
end;

procedure TDMImprimirCodBarras.QMImpCBCodClienteBeforeOpen(DataSet: TDataSet);
begin
  QMImpCBCodCliente.Params.ByName['CLIENTE'].AsInteger := QMImpCBCabeceraCLIENTE.AsInteger;
end;

end.
