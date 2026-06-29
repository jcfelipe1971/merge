unit UDMLstPackingList;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport,
  DB, FIBDataSetRO, FIBTableDataSetRO, FR_DSet, FR_DBSet, FIBDataSet,
  FIBTableDataSet, frxClass, frxHYReport;

type
  TDMLstPackingList = class(TDataModule)
     TLocal: THYTransaction;
     frPackingList: TfrHYReport;
     DSBultos: TDataSource;
     frDBBultos: TfrDBDataSet;
     QMBultos: TFIBDataSetRO;
     QMBultosDet: TFIBDataSetRO;
     DSBultosDet: TDataSource;
     frDBBultosDet: TfrDBDataSet;
     QMBultosHijos: TFIBDataSetRO;
     DSBultosHijos: TDataSource;
     frDBBultosHijos: TfrDBDataSet;
     QMBultosHijosDet: TFIBDataSetRO;
     DSBultosHijosDet: TDataSource;
     frDBBultosHijosDet: TfrDBDataSet;
     frUserBultosDet: TfrUserDataset;
     xArticulo: TFIBDataSetRO;
     DSxArticulo: TDataSource;
     xArticuloHijo: TFIBDataSetRO;
     DSxArticuloHijo: TDataSource;
     QMDocumento: TFIBDataSetRO;
     DSDocumento: TDataSource;
     QMDatosEmbarque: TFIBDataSetRO;
     DSQMDatosEmbarque: TDataSource;
     QMCliente: TFIBDataSetRO;
     DSQMCliente: TDataSource;
     QMTercero: TFIBDataSetRO;
     DSQMTercero: TDataSource;
     QMDireccion: TFIBDataSetRO;
     DSQMDireccion: TDataSource;
     frxPackingList: TfrxHYReport;
     QMBultosResumen: TFIBDataSetRO;
     DSQMBultosResumen: TDataSource;
     QMTransportista: TFIBDataSetRO;
     DSQMTransportista: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPackingListGetValue(const ParName: string; var ParValue: variant);
     procedure frPackingListEnterRect(Memo: TStringList; View: TfrView);
     procedure frDBBultosDetFirst(Sender: TObject);
     procedure frDBBultosDetNext(Sender: TObject);
     procedure QMBultosBeforeClose(DataSet: TDataSet);
     procedure QMBultosHijosAfterOpen(DataSet: TDataSet);
     procedure QMBultosHijosBeforeClose(DataSet: TDataSet);
     procedure QMBultosAfterOpen(DataSet: TDataSet);
     procedure QMBultosDetBeforeClose(DataSet: TDataSet);
     procedure QMBultosHijosDetBeforeClose(DataSet: TDataSet);
     procedure QMDocumentoAfterOpen(DataSet: TDataSet);
     procedure QMDocumentoBeforeOpen(DataSet: TDataSet);
     procedure QMBultosDetAfterOpen(DataSet: TDataSet);
     procedure QMBultosHijosDetAfterOpen(DataSet: TDataSet);
     procedure frxPackingListGetValue(const VarName: string; var Value: variant);
     procedure frxPackingListBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
     IdDoc: integer;
     procedure FiltrarDocumento(const ID_S: integer);
  public
     { Public declarations }
     rutaFich: string;
     procedure MostrarListado(const ID_S: integer; Modo: smallint; const Serie: string);
     procedure MostrarListadoMail(const ID_S: integer; Modo: smallint; const Serie: string);
     procedure MostrarEtiquetas(const ID_S: integer; Modo: smallint; const Serie: string);
  end;

var
  DMLstPackingList : TDMLstPackingList;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, UFormGest, UDMListados, HYFIBQuery;

procedure TDMLstPackingList.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstPackingList.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPackingList.FiltrarDocumento(const ID_S: integer);
begin
  IdDoc := ID_S;

  with QMBultos do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := IdDoc;
     Open;
  end;

  with QMBultosResumen do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := IdDoc;
     Open;
  end;

  with QMDocumento do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := IdDoc;
     Open;
  end;

  with QMDatosEmbarque do
  begin
     Close;
     SelectSQL.Clear;
     if (QMDocumento.FieldByName('TIPO').AsString = 'FAC') then
        SelectSQL.Add(' SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKING_LIST FROM GES_CABECERAS_S_FAC ');
     if (QMDocumento.FieldByName('TIPO').AsString = 'ALB') then
        SelectSQL.Add(' SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKING_LIST FROM GES_CABECERAS_S_ALB ');
     if (QMDocumento.FieldByName('TIPO').AsString = 'PEC') then
        SelectSQL.Add(' SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKING_LIST FROM GES_CABECERAS_S_PED ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_S = ?ID_S ');

     Params.ByName['ID_S'].AsInteger := IdDoc;
     Open;
  end;
end;

procedure TDMLstPackingList.MostrarListado(const ID_S: integer; Modo: smallint; const Serie: string);
var
  Titulo : string;
begin
  DMMain.LogIni('MostrarEtiquetas()');

  DMMain.LogIni('FiltrarDocumento()');
  FiltrarDocumento(ID_S);
  DMMain.LogFin('FiltrarDocumento()');

  Titulo := format(_('PackingList-%s-%d'), [QMDocumento.FieldByName('SERIE').AsString, QMDocumento.FieldByName('RIG').AsInteger]);

  DMMain.LogIni('Imprimir()');
  DMListados.Imprimir(600, 0, Modo, Serie, Titulo, frPackingList, frxPackingList, nil);
  DMMain.LogFin('Imprimir()');

  DMMain.LogFin('MostrarEtiquetas()');
end;

procedure TDMLstPackingList.MostrarListadoMail(const ID_S: integer; Modo: smallint; const Serie: string);
var
  Titulo : string;
begin
  FiltrarDocumento(ID_S);

  Titulo := format('%s_%d-%s-%.5d', [_('PackingList'), QMDocumento.FieldByName('EJERCICIO').AsInteger, QMDocumento.FieldByName('SERIE').AsString, QMDocumento.FieldByName('RIG').AsInteger]);
  rutaFich := Titulo + '.pdf';

  DMListados.Imprimir(600, 0, Modo, Serie, Titulo, frPackingList, frxPackingList, nil, rutaFich);
end;

procedure TDMLstPackingList.MostrarEtiquetas(const ID_S: integer; Modo: smallint; const Serie: string);
begin
  DMMain.LogIni('MostrarEtiquetas()');

  DMMain.LogIni('FiltrarDocumento()');
  FiltrarDocumento(ID_S);
  DMMain.LogFin('FiltrarDocumento()');

  DMMain.LogIni('Imprimir()');
  DMListados.Imprimir(635, 0, Modo, Serie, _('Etiqueta Packing List'), frPackingList, frxPackingList, nil);
  DMMain.LogFin('Imprimir()');

  DMMain.LogFin('MostrarEtiquetas()');
end;

procedure TDMLstPackingList.frPackingListGetValue(const ParName: string; var ParValue: variant);
begin
  DMMain.Log(Format('GetValue(%s)', [ParName]));

  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'NoBultos') then
  begin
     ParValue := '1';
     if (QMBultos.FieldByName('AGRUPADO').AsInteger = 1) then
        ParValue := IntToStr(QMBultos.FieldByName('CANT_AGRUPADOS').AsInteger)
     else if (QMBultos.FieldByName('ESPADRE').AsInteger = 1) then
        ParValue := '1/' + IntToStr(QMBultos.FieldByName('CANT_SUBBULTOS').AsInteger);
  end;

  if (ParName = 'TituloBulto') then
     ParValue := QMBultos.FieldByName('TITULO_BULTO').AsString;

  if (ParName = 'TituloBultoHijos') then
     ParValue := QMBultosHijos.FieldByName('TITULO_BULTO').AsString;

  if (ParName = 'PesoNetoDet') then
     ParValue := QMBultosDet.FieldByName('UNIDADES').AsFloat * QMBultosDet.FieldByName('PESO_UNITARIO').AsFloat;

  if (ParName = 'PesoBrutoDet') then
     ParValue := QMBultosDet.FieldByName('UNIDADES').AsFloat * QMBultosDet.FieldByName('PESO_UNITARIO').AsFloat +
        QMBultos.FieldByName('PESO').AsFloat;

  if (ParName = 'UnidadesAgrup') then
     ParValue := QMBultosDet.FieldByName('UNIDADES').AsFloat * QMBultos.FieldByName('CANT_AGRUPADOS').AsFloat;

  if (ParName = 'PesoNetoDetAgrup') then
     ParValue := QMBultosDet.FieldByName('UNIDADES').AsFloat * QMBultosDet.FieldByName('PESO_UNITARIO').AsFloat *
        QMBultos.FieldByName('CANT_AGRUPADOS').AsFloat;

  if (ParName = 'PesoBrutoDetAgrup') then
     ParValue := (QMBultosDet.FieldByName('UNIDADES').AsFloat * QMBultosDet.FieldByName('PESO_UNITARIO').AsFloat +
        QMBultos.FieldByName('PESO').AsFloat) * QMBultos.FieldByName('CANT_AGRUPADOS').AsFloat;

  if (ParName = 'PesoBrutoTotal') then
  begin
     with THYFIBQuery.Create(Self) do
     begin
        try
           Database := DMMain.Database;
           SQL.Text := 'SELECT SUM(PESO_BRUTO) FROM GES_CABECERAS_S_BULTOS WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := IdDoc;
           ExecQuery;
           ParValue := FieldByName['SUM'].AsFloat;
        finally
           Free;
        end;
     end;
  end;

  if (ParName = 'CantBultosPadre') then
  begin
     // Bultos que contienen otros bultos. (Pallets)

     with THYFIBQuery.Create(Self) do
     begin
        try
           Database := DMMain.Database;
           SQL.Add(' SELECT COUNT(*) FROM GES_CABECERAS_S_BULTOS C ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.ID_S = :ID_S AND ');
           SQL.Add(' ID_B_PADRE = 0 AND ');
           SQL.Add(' EXISTS(SELECT ID_B ');
           SQL.Add('        FROM GES_CABECERAS_S_BULTOS ');
           SQL.Add('        WHERE ');
           SQL.Add('        ID_B_PADRE = C.ID_B) ');
           Params.ByName['ID_S'].AsInteger := IdDoc;
           ExecQuery;
           ParValue := FieldByName['COUNT'].AsFloat;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMLstPackingList.frPackingListEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraI]', Memo[0]) > 0) then
        View.FormatStr := MascaraI;
  end;
end;

procedure TDMLstPackingList.frDBBultosDetFirst(Sender: TObject);
begin
  frUserBultosDet.RangeEndCount := QMBultosDet.FieldByName('CANTIDAD_ETIQUETAS').AsInteger;
end;

procedure TDMLstPackingList.frDBBultosDetNext(Sender: TObject);
begin
  frUserBultosDet.RangeEndCount := QMBultosDet.FieldByName('CANTIDAD_ETIQUETAS').AsInteger;
end;

procedure TDMLstPackingList.QMBultosAfterOpen(DataSet: TDataSet);
begin
  QMBultosDet.Open;
  QMBultosHijos.Open;
end;

procedure TDMLstPackingList.QMBultosBeforeClose(DataSet: TDataSet);
begin
  QMBultosDet.Close;
  QMBultosHijos.Close;
end;

procedure TDMLstPackingList.QMBultosHijosAfterOpen(DataSet: TDataSet);
begin
  QMBultosHijosDet.Open;
end;

procedure TDMLstPackingList.QMBultosHijosBeforeClose(DataSet: TDataSet);
begin
  QMBultosHijosDet.Close;
end;

procedure TDMLstPackingList.QMBultosDetBeforeClose(DataSet: TDataSet);
begin
  xArticulo.Close;
end;

procedure TDMLstPackingList.QMBultosHijosDetBeforeClose(DataSet: TDataSet);
begin
  xArticuloHijo.Close;
end;

procedure TDMLstPackingList.QMDocumentoAfterOpen(DataSet: TDataSet);
begin
  QMCliente.Open;
  QMTercero.Open;
  QMDireccion.Open;
  QMTransportista.Open;
end;

procedure TDMLstPackingList.QMDocumentoBeforeOpen(DataSet: TDataSet);
begin
  QMCliente.Close;
  QMTercero.Close;
  QMDireccion.Close;
  QMTransportista.Close;
end;

procedure TDMLstPackingList.QMBultosDetAfterOpen(DataSet: TDataSet);
begin
  xArticulo.Open;
end;

procedure TDMLstPackingList.QMBultosHijosDetAfterOpen(DataSet: TDataSet);
begin
  xArticuloHijo.Open;
end;

procedure TDMLstPackingList.frxPackingListGetValue(const VarName: string; var Value: variant);
begin
  frPackingListGetValue(VarName, Value);
end;

procedure TDMLstPackingList.frxPackingListBeforePrint(Sender: TfrxReportComponent);
begin
  DMMain.Log(Format('frxPackingListBeforePrint(%s)', [Sender.Name]));
  DMListados.BeforePrint(Sender);
end;

end.
