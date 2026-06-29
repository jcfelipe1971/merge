unit UDMLSTMovManStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_Class, Fr_HYReport, DB, FIBDataSetRO, FR_DSet,
  FR_DBSet, FIBDatabase, UFIBModificados, Messages, Dialogs, Windows, Graphics,
  Controls, Forms, FIBDataSet, FIBTableDataSet, FIBQuery, HYFIBQuery,
  UHYReport, frxClass, frxHYReport;

type
  TDMLSTMovManStock = class(TDataModule)
     FRMovManStock: TfrHYReport;
     QMCabecera: TFIBDataSetRO;
     TLocal: THYTransaction;
     DSQMCabecera: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSQMDetalle: TDataSource;
     FRDSQMcabecera: TfrDBDataSet;
     FRDBSQMDetalle: TfrDBDataSet;
     xAlmacenOrig: TFIBDataSetRO;
     xAlmacenDst: TFIBDataSetRO;
     xCanalOrig: TFIBDataSetRO;
     xCanalDst: TFIBDataSetRO;
     DSxAlmacenOrig: TDataSource;
     DSxAlmacenDst: TDataSource;
     DSxCanalOrig: TDataSource;
     DSxCanalDst: TDataSource;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSAlmacenOrig: THYReportSource;
     HYRSAlmacenDst: THYReportSource;
     HYRSCanalOrig: THYReportSource;
     HYRSCanalDst: THYReportSource;
     xArticuloD: TFIBDataSetRO;
     DSxArticuloD: TDataSource;
     DSxArticuloH: TDataSource;
     xArticuloH: TFIBDataSetRO;
     xFamiliaH: TFIBDataSetRO;
     DSxFamiliaH: TDataSource;
     DSxFamiliaD: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     xAlmacenH: TFIBDataSetRO;
     DSxAlmacenH: TDataSource;
     DSxAlmacenD: TDataSource;
     xAlmacenD: TFIBDataSetRO;
     QMinArticulo: THYFIBQuery;
     QMaxArticulo: THYFIBQuery;
     QMinFamilia: THYFIBQuery;
     QMaxFamilia: THYFIBQuery;
     QMinAlmacen: THYFIBQuery;
     QMaxAlmacen: THYFIBQuery;
     xCanales: TFIBQuery;
     xAlmacenes: TFIBQuery;
     QDatosCabecera: TFIBDataSetRO;
     DSQDatosCabecera: TDataSource;
     frDBDSQDatosCabecera: TfrDBDataSet;
     HYRSDatosCabecera: THYReportSource;
     xArticulosKRI: TFIBDataSetRO;
     xDirAlmOrig: TFIBDataSetRO;
     xDirAlmDst: TFIBDataSetRO;
     QLoteKri: TFIBDataSetRO;
     QNroSerieKri: TFIBDataSetRO;
     frUDNroSerieLote: TfrUserDataset;
     QNroSerieKriEMPRESA: TIntegerField;
     QNroSerieKriARTICULO: TFIBStringField;
     QNroSerieKriNRO_SERIE: TFIBStringField;
     frxMovManStock: TfrxHYReport;
     frDBDSQSerializacion: TfrDBDataSet;
     DSQSerializacion: TDataSource;
     QMSerializacion: TFIBDataSetRO;
     frDBQMDetalleLotes: TfrDBDataSet;
     DSQMDetalleLotes: TDataSource;
     QMDetalleLotes: TFIBDataSetRO;
     xCodProv: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure FRMovManStockGetValue(const ParName: string; var ParValue: variant);
     procedure FRMovManStockEnterRect(Memo: TStringList; View: TfrView);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure xArticulosKRIAfterScroll(DataSet: TDataSet);
     procedure frUDNroSerieLoteFirst(Sender: TObject);
     procedure frUDNroSerieLoteNext(Sender: TObject);
     procedure frUDNroSerieLoteCheckEOF(Sender: TObject; var EOF: boolean);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure frxMovManStockBeforePrint(Sender: TfrxReportComponent);
     procedure frxMovManStockGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QDatosCabeceraAfterOpen(DataSet: TDataSet);
     procedure QDatosCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     SW: integer;
     i: integer;
     LotesNroSerie: string;
  public
     { Public declarations }
     procedure CambiaAlmacenD(Almacen: string);
     procedure CambiaAlmacenH(Almacen: string);
     procedure CambiaArticuloD(Articulo: string);
     procedure CambiaArticuloH(Articulo: string);
     procedure CambiaFamiliaD(Familia: string);
     procedure CambiaFamiliaH(Familia: string);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameFamiliaMin: string;
     function DameFamiliaMax: string;
     function MostrarListado(IdST, Modo, Grupo: integer): string;
     procedure MostrarListadoFiltrado(Cadena, Serie: string; Modo, Grupo: integer);
     procedure MatricialesEnterFields(var Source: string);
  end;

var
  DMLSTMovManStock : TDMLSTMovManStock;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles;

procedure TDMLSTMovManStock.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLSTMovManStock.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

function TDMLSTMovManStock.MostrarListado(IdST, Modo, Grupo: integer): string;
var
  Archivo : string;
begin
  /// Devuelve el nombre del fichero PDF creado

  with QMCabecera do
  begin
     if Active then
        Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM GES_CABECERAS_ST ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_ST = :ID_ST ');
     Params.ByName['ID_ST'].AsInteger := IdST;
     Open;

     Archivo := format('Movimiento_%s-%d.pdf', [FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger]);
  end;

  SW := 1;
  DMListados.Imprimir(Grupo, 0, Modo, QMCabecera.FieldByName('SERIE').AsString, '', FRMovManStock, FRxMovManStock, HyReport, nil, Archivo);
  Result := Archivo;
end;

procedure TDMLSTMovManStock.MostrarListadoFiltrado(Cadena, Serie: string; Modo, Grupo: integer);
begin
  with QMCabecera do
  begin
     if Active then
        Close;
     SelectSQL.Clear;
     SelectSQL.Text := Cadena;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;

  QMDetalle.Close;
  QMDetalle.Open;

  SW := 1;
  DMListados.Imprimir(Grupo, 0, Modo, Serie, '', FRMovManStock, FRxMovManStock, HyReport, nil);
end;

procedure TDMLSTMovManStock.FRMovManStockGetValue(const ParName: string; var ParValue: variant);
var
  s : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloAlmO' then
     ParValue := xAlmacenOrig.FieldByName('TITULO').AsString;

  if ParName = 'TituloAlmD' then
     ParValue := xAlmacenDst.FieldByName('TITULO').AsString;

  if ParName = 'TituloCanO' then
     ParValue := xCanalOrig.FieldByName('TITULO').AsString;

  if ParName = 'TituloCanD' then
     ParValue := xCanalDst.FieldByName('TITULO').AsString;

  if (ParName = 'NroSerieLote') then
  begin
     LotesNroSerie := '';
     QNroSerieKri.Close;
     QLoteKri.Close;

     if (xArticulosKRI.FieldByName('SERIALIZADO_KRI').AsInteger = 1) then
     begin
        QNroSerieKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
        QNroSerieKri.Params.ByName['ARTICULO'].AsString := QMDetalle.FieldByName('ARTICULO').AsString;
        QNroSerieKri.Params.ByName['EJERCICIO'].AsInteger :=
           QMDetalle.FieldByName('EJERCICIO').AsInteger;
        QNroSerieKri.Params.ByName['CANAL'].AsInteger :=
           QDatosCabecera.FieldByName('CANAL_ORI').AsInteger;
        QNroSerieKri.Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
        QNroSerieKri.Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
        QNroSerieKri.Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
        QNroSerieKri.Open;
        LotesNroSerie := Format(_('Nro. Serie: %s'), [QNroSerieKri.FieldByName('NRO_SERIE').AsString]);
        QNroSerieKri.Next;
        while not QNroSerieKri.EOF do
        begin
           LotesNroSerie := LotesNroSerie + ', ' + QNroSerieKri.FieldByName('NRO_SERIE').AsString;
           QNroSerieKri.Next;
        end;
     end;

     if (xArticulosKRI.FieldByName('LOTES_KRI').AsInteger = 1) then
     begin
        QLoteKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
        QLoteKri.Params.ByName['ARTICULO'].AsString := QMDetalle.FieldByName('ARTICULO').AsString;
        QLoteKri.Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
        QLoteKri.Params.ByName['CANAL'].AsInteger := QDatosCabecera.FieldByName('CANAL_ORI').AsInteger;
        QLoteKri.Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
        QLoteKri.Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
        QLoteKri.Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
        QLoteKri.Open;
        LotesNroSerie := Format(_('Lote: %d x %s - %s'), [QLoteKri.FieldByName('COUNT').AsInteger, QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString]);
        QLoteKri.Next;
        while (not QLoteKri.EOF) do
        begin
           LotesNroSerie := Format(', %d x %s - %s', [QLoteKri.FieldByName('COUNT').AsInteger, QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString]);
           QLoteKri.Next;
        end;
     end;

     ParValue := LotesNroSerie;
     LotesNroSerie := '';
  end;

  if ParName = 'NroSerieLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT S.ARTICULO, A.TITULO_LARGO AS TITULO, LIST(S.NSERIE, '', '') ');
              SelectSQL.Add(' FROM VER_DETALLE_SERIALIZACION S ');
              SelectSQL.Add(' JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A.ARTICULO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
              SelectSQL.Add(' S.CANAL = :CANAL AND ');
              SelectSQL.Add(' S.SERIE = :SERIE AND ');
              SelectSQL.Add(' S.TIPO STARTING WITH :TIPO AND ');
              SelectSQL.Add(' S.RIG = :RIG AND ');
              SelectSQL.Add(' S.LINEA = :LINEA ');
              SelectSQL.Add(' GROUP BY S.ARTICULO, A.TITULO_LARGO ');
              Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
              Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
              Params.ByName['TIPO'].AsString := 'MV'; // MVE, MVS, MVT
              Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
              Open;

              // Salto de linea antes de cada registro, excepto el primero.
              s := '';
              ParValue := '';
              while not EOF do
              begin
                 ParValue := ParValue + s + FieldByName('ARTICULO').AsString + ' - ' + FieldByName('TITULO').AsString;
                 s := #13#10;
                 ParValue := ParValue + s + FieldByName('LIST').AsString;
                 Next;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'LotesLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT LIST(LOTE, '', '') ');
              SelectSQL.Add(' FROM GES_DETALLES_ST_LOTES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' ID_DETALLES_ST = :ID_DETALLES_ST ');
              Params.ByName['ID_DETALLES_ST'].AsInteger := QMDetalle.FieldByName('ID_DETALLES_ST').AsInteger;
              Open;

              ParValue := FieldByName('LIST').AsString;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMLSTMovManStock.FRMovManStockEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[NroSerieLote]') then
     begin
        LotesNroSerie := '';
        QNroSerieKri.Close;
        QLoteKri.Close;

        if (xArticulosKRI.FieldByName('SERIALIZADO_KRI').AsInteger = 1) then
        begin
           QNroSerieKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
           QNroSerieKri.Params.ByName['ARTICULO'].AsString := QMDetalle.FieldByName('ARTICULO').AsString;
           QNroSerieKri.Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
           QNroSerieKri.Params.ByName['CANAL'].AsInteger := QDatosCabecera.FieldByName('CANAL_ORI').AsInteger;
           QNroSerieKri.Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
           QNroSerieKri.Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
           QNroSerieKri.Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
           QNroSerieKri.Open;
           LotesNroSerie := Format(_('Nro. Serie: %s'), [QNroSerieKri.FieldByName('NRO_SERIE').AsString]);
           QNroSerieKri.Next;
           while not QNroSerieKri.EOF do
           begin
              LotesNroSerie := LotesNroSerie + ', ' + QNroSerieKri.FieldByName('NRO_SERIE').AsString;
              QNroSerieKri.Next;
           end;
        end;

        if (xArticulosKRI.FieldByName('LOTES_KRI').AsInteger = 1) then
        begin
           QLoteKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
           QLoteKri.Params.ByName['ARTICULO'].AsString := QMDetalle.FieldByName('ARTICULO').AsString;
           QLoteKri.Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
           QLoteKri.Params.ByName['CANAL'].AsInteger := QDatosCabecera.FieldByName('CANAL_ORI').AsInteger;
           QLoteKri.Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
           QLoteKri.Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
           QLoteKri.Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
           QLoteKri.Open;
           LotesNroSerie := Format(_('Lote: %d x %s - %s'), [QLoteKri.FieldByName('COUNT').AsInteger, QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString]);
           QLoteKri.Next;
           while (not QLoteKri.EOF) do
           begin
              LotesNroSerie := Format(', %d x %s - %s', [QLoteKri.FieldByName('COUNT').AsInteger, QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString]);
              QLoteKri.Next;
           end;
        end;

        if (LotesNroSerie > '') then
        begin
           memo.Delete(0);
           memo.Add(LotesNroSerie);
           view.Parent.Visible := True;
        end
        else
           view.Parent.Visible := False;
     end;
  end;
end;

procedure TDMLSTMovManStock.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
begin
  MatricialesEnterFields(Source);
end;

// ******* Filtrado de Almacenes, canales, familias, etc **************************
procedure TDMLSTMovManStock.MatricialesEnterFields(var Source: string);
begin
  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;
  if Source = ' ' then
     Source := '';
end;

procedure TDMLSTMovManStock.CambiaAlmacenD(Almacen: string);
begin
  with xAlmacenD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMLSTMovManStock.CambiaAlmacenH(Almacen: string);
begin
  with xAlmacenH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMLSTMovManStock.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLSTMovManStock.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMLSTMovManStock.CambiaFamiliaD(Familia: string);
begin
  with xFamiliaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

procedure TDMLSTMovManStock.CambiaFamiliaH(Familia: string);
begin
  with xFamiliaH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

function TDMLSTMovManStock.DameArticuloMin: string;
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMLSTMovManStock.DameArticuloMax: string;
begin
  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMLSTMovManStock.DameFamiliaMin: string;
begin
  with QMinFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMLSTMovManStock.DameFamiliaMax: string;
begin
  with QMaxFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

// ****************************************************************************

procedure TDMLSTMovManStock.xArticulosKRIAfterScroll(DataSet: TDataSet);
begin
  LotesNroSerie := '';
end;

procedure TDMLSTMovManStock.frUDNroSerieLoteFirst(Sender: TObject);
begin
  i := 0;
end;

procedure TDMLSTMovManStock.frUDNroSerieLoteNext(Sender: TObject);
begin
  i := i + 1;
end;

procedure TDMLSTMovManStock.frUDNroSerieLoteCheckEOF(Sender: TObject; var EOF: boolean);
begin
  if (((xArticulosKRI.FieldByName('LOTES_KRI').AsInteger = 0) and
     (xArticulosKRI.FieldByName('SERIALIZADO_KRI').AsInteger = 0)) or (i = 1)) then
     EOF := True;
end;

procedure TDMLSTMovManStock.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  with QMSerializacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;

     if (QMCabecera.FieldByName('TIPO_OPERACION').AsString = 'E') then
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL_DST').AsInteger;
     if (QMCabecera.FieldByName('TIPO_OPERACION').AsString = 'S') then
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL_ORI').AsInteger;
     if (QMCabecera.FieldByName('TIPO_OPERACION').AsString = 'T') then
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL_ORI').AsInteger;

     Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
     Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
     Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
     Open;
  end;
end;

procedure TDMLSTMovManStock.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulosKRI.Open;
  xCodProv.Open;
  QMDetalleLotes.Open;
end;

procedure TDMLSTMovManStock.frxMovManStockBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLSTMovManStock.frxMovManStockGetValue(const VarName: string; var Value: variant);
begin
  frMovManStockGetValue(VarName, Value);
end;

procedure TDMLSTMovManStock.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QDatosCabecera.Open;
  QMDetalle.Open;
end;

procedure TDMLSTMovManStock.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QDatosCabecera.Close;
  QMDetalle.Close;
end;

procedure TDMLSTMovManStock.QDatosCabeceraAfterOpen(DataSet: TDataSet);
begin
  xAlmacenOrig.Open;
  xAlmacenDst.Open;
  xCanalOrig.Open;
  xCanalDst.Open;
end;

procedure TDMLSTMovManStock.QDatosCabeceraBeforeClose(DataSet: TDataSet);
begin
  xAlmacenOrig.Close;
  xAlmacenDst.Close;
  xCanalOrig.Close;
  xCanalDst.Close;
end;

procedure TDMLSTMovManStock.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulosKRI.Close;
  xCodProv.Close;
  QMDetalleLotes.Open;
end;

end.
