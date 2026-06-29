unit UDMLstTrazabilidadLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, HYFIBQuery, DB,
  FIBDataSetRO, FIBDataSet, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  FIBTableDataSet, frxClass, frxHYReport;

type
  TDMLstTrazabilidadLotes = class(TDataModule)
     TLocal: THYTransaction;
     xLotes: TFIBDataSetRO;
     DSxLotes: TDataSource;
     xLotesEMPRESA: TIntegerField;
     xLotesCANAL: TIntegerField;
     xLotesALMACEN: TFIBStringField;
     xLotesARTICULO: TFIBStringField;
     xLotesLOTE: TFIBStringField;
     xLotesSERIE: TFIBStringField;
     xLotesCLASIFICACION: TFIBStringField;
     xLotesF_ENVASADO: TDateTimeField;
     xLotesF_CADUCIDAD: TDateTimeField;
     xLotesF_FABRICACION: TDateTimeField;
     xLotesID_A: TIntegerField;
     xLotesAUTO_REETIQUETADO: TIntegerField;
     xLotesCODIGO: TIntegerField;
     xLotesPROVEEDOR: TIntegerField;
     xLotesID_LOTE: TIntegerField;
     DSxLoteFiltrado: TDataSource;
     frLotes: TfrHYReport;
     DSxListado: TDataSource;
     frDBxListado: TfrDBDataSet;
     xLoteFiltrado: TFIBDataSetRO;
     xLoteFiltradoLOTE: TFIBStringField;
     xLoteFiltradoSERIE: TFIBStringField;
     xLoteFiltradoID_LOTE: TIntegerField;
     xLoteFiltradoALMACEN: TFIBStringField;
     frxLotes: TfrxHYReport;
     TUpdate: THYTransaction;
     xListado: TFIBTableSet;
     DSxTransformacion: TDataSource;
     xTransformacion: TFIBTableSet;
     frDBxTransformacion: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frLotesGetValue(const ParName: string; var ParValue: variant);
     procedure frLotesEnterRect(Memo: TStringList; View: TfrView);
     procedure frxLotesBeforePrint(Sender: TfrxReportComponent);
     procedure frxLotesGetValue(const VarName: string; var Value: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     SQLBase: TStrings;
     procedure BorraTemporales;
     procedure CargaTrazabilidadLote;
  public
     { Public declarations }
     procedure MostrarListado(Modo: byte);
     procedure CierraLotes;
     procedure AbreLotes;
     procedure AbreLotesFiltrado(StrLote: string);
     procedure AsignaLote;
  end;

var
  DMLstTrazabilidadLotes : TDMLstTrazabilidadLotes;

implementation

uses UDMMain, UEntorno, UFPregTrazabilidadLotes, UDMListados, UFormGest;

{$R *.dfm}

procedure TDMLstTrazabilidadLotes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  SQLBase := TStringList.Create;
  SQLBase.Clear;
  SQLBase.Add(' SELECT * FROM ART_ARTICULOS_LOTES ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = ?EMPRESA AND ');
  SQLBase.Add(' CANAL=?CANAL ');
end;

procedure TDMLstTrazabilidadLotes.MostrarListado(Modo: byte);
begin
  if (xLoteFiltrado.FieldByName('LOTE').IsNull) then
     raise Exception.Create(_('El campo lote no puede ser vacío.'));

  CargaTrazabilidadLote;

  with xListado do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xTransformacion do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(517, 0, Modo, '', '', frLotes, frxLotes, nil, nil);
  CierraData(DMListados);

  BorraTemporales;
end;

procedure TDMLstTrazabilidadLotes.AbreLotes;
begin
  with xLotes do
  begin
     Close;
     SelectSQL := SQLBase;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMLstTrazabilidadLotes.CierraLotes;
begin
  xLotes.Close;
end;

procedure TDMLstTrazabilidadLotes.AsignaLote;
begin
  with xLoteFiltrado do
  begin
     Close;
     Params.ByName['ID_LOTE'].AsInteger := xLotesID_LOTE.AsInteger;
     Open;
  end;
end;

procedure TDMLstTrazabilidadLotes.frLotesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  //Datos del Lote inicial
  if ParName = 'Lote' then
     ParValue := xLoteFiltradoLOTE.AsString;

  if ParName = 'Id_lote' then
     ParValue := xLoteFiltradoID_LOTE.AsString;

  if ParName = 'Articulo' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ARTICULO FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = :ID_LOTE';
           Params.ByName['ID_LOTE'].AsInteger := xLoteFiltradoID_LOTE.AsInteger;
           ExecQuery;
           ParValue := FieldByName['ARTICULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'FechaLst' then
     ParValue := REntorno.FechaTrabSH;
end;

procedure TDMLstTrazabilidadLotes.frLotesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstTrazabilidadLotes.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_TRAZABILIDAD_LOTES WHERE ENTRADA=?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_PRO_LST_LOTE_TRAZABILIDAD WHERE ENTRADA=?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstTrazabilidadLotes.AbreLotesFiltrado(StrLote: string);
begin
  with xLotes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL := SQLBase;
     SelectSQL.Add(' AND LOTE LIKE ''%' + Trim(StrLote) + '%'' ');
     SelectSQL.Add(' ORDER BY ALMACEN, ARTICULO, PROVEEDOR, SERIE ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMLstTrazabilidadLotes.frxLotesBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstTrazabilidadLotes.frxLotesGetValue(const VarName: string; var Value: variant);
begin
  frLotesGetValue(VarName, Value);
end;

procedure TDMLstTrazabilidadLotes.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMLstTrazabilidadLotes.CargaTrazabilidadLote;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_LST_LOTE_TRAZABILIDAD(?ENTRADA, 0, ?EMPRESA, ?ID_LOTE)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_LOTE'].AsInteger := xLoteFiltradoID_LOTE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
