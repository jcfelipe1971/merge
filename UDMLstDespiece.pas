unit UDMLstDespiece;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBDataSet, jpeg, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstDespiece = class(TDataModule)
     frDespiece: TfrHYReport;
     frDBCab: TfrDBDataSet;
     frDBComponente: TfrDBDataSet;
     frDBTarea: TfrDBDataSet;
     DSDespieceCab: TDataSource;
     DSDespieceCom: TDataSource;
     DSDespieceTar: TDataSource;
     xDespieceCab: TFIBDataSetRO;
     TLocal: THYTransaction;
     xDespieceCom: TFIBDataSetRO;
     xDespieceTar: TFIBDataSetRO;
     xImagenModelo: TFIBDataSetRO;
     xImagenComponente: TFIBDataSetRO;
     xEscandallo: TFIBDataSetRO;
     DSxDescEscandallo: TDataSource;
     xComponente: TFIBDataSetRO;
     DSxComponente: TDataSource;
     frxDespiece: TfrxHYReport;
     DSCabDocumento: TDataSource;
     QMCabDocumento: TFIBDataSetRO;
     DSDetDocumento: TDataSource;
     QMDetDocumento: TFIBDataSetRO;
     procedure xDespieceCabAfterOpen(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure frDespieceEnterRect(Memo: TStringList; View: TfrView);
     procedure xDespieceCabBeforeClose(DataSet: TDataSet);
     procedure frDespieceGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frxDespieceBeforePrint(Sender: TfrxReportComponent);
     procedure frxDespieceGetValue(const VarName: string; var Value: variant);
     procedure xDespieceComAfterOpen(DataSet: TDataSet);
     procedure xDespieceComBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; Despiece: integer);
  end;

var
  DMLstDespiece : TDMLstDespiece;

implementation

uses UDMMain, UFormGest, UDMListados, UEntorno, UDameDato;

{$R *.dfm}

procedure TDMLstDespiece.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstDespiece.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstDespiece.MostrarListado(Modo, Despiece: integer);
begin
  xDespieceCab.Close;
  xDespieceCab.Params.ByName['ID_DESPIECE_CAB'].AsInteger := despiece;
  xDespieceCab.Open;

  DMListados.Imprimir(9913, 0, Modo, '', '', frDespiece, frxDespiece, nil, nil); // Listado del despiece
end;

procedure TDMLstDespiece.xDespieceCabAfterOpen(DataSet: TDataSet);
begin
  xEscandallo.Open;
  xDespieceCom.Open;
  xDespieceTar.Open;
  QMCabDocumento.Open;
  QMDetDocumento.Open;
end;

procedure TDMLstDespiece.xDespieceCabBeforeClose(DataSet: TDataSet);
begin
  xEscandallo.Close;
  xDespieceCom.Close;
  xDespieceTar.Close;
  QMCabDocumento.Close;
  QMDetDocumento.Close;
end;

procedure TDMLstDespiece.xDespieceComAfterOpen(DataSet: TDataSet);
begin
  xComponente.Open;
end;

procedure TDMLstDespiece.xDespieceComBeforeClose(DataSet: TDataSet);
begin
  xComponente.Close;
end;

procedure TDMLstDespiece.frDespieceEnterRect(Memo: TStringList; View: TfrView);
var
  JPG : TJpegImage;
  m : TStream;
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[ImagenModelo]') and (View is TfrPictureView) then
     begin
        with xImagenModelo do
        begin
           Close;
           Params.ByName['MODELO'].AsString := xDespieceCab.FieldByName('MODELO').AsString;
           Open;
           DMListados.MostrarImagen(FieldByName('IMAGEN').AsInteger, View);
        end;
     end;

     if (Memo[0] = '[ImagenDespiece]') and (View is TfrPictureView) then
     begin
        DMListados.MostrarImagen(xDespieceCab.FieldByName('ID_IMAGEN').AsInteger, View);
     end;

     if (Memo[0] = '[ImagenComponente]') and (View is TfrPictureView) then
     begin
        try
           xImagenComponente.Close;
           xImagenComponente.Params.ByName['ID_A'].AsInteger := DameIDArticulo(xDespieceCom.FieldByName('COMPONENTE').AsString);
           xImagenComponente.Open;

           if not (xImagenComponente.FieldByName('IMAGEN').IsNull) then
           begin
              JPG := TJpegImage.Create;
              try
                 m := xImagenComponente.CreateBlobStream(xImagenComponente.FieldByName('IMAGEN'), bmRead);
                 JPG.LoadFromStream(m);
                 TfrPictureView(View).Picture.Assign(JPG);
              finally
                 JPG.Free;
              end;
           end
           else
              TfrPictureView(View).Picture.Assign(nil);
        except
        end;
     end;
  end;
end;

procedure TDMLstDespiece.frDespieceGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstDespiece.frxDespieceBeforePrint(Sender: TfrxReportComponent);
var
  JPG : TJpegImage;
  m : TStream;
  s : string;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
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
  end;

  // Tratamiento de las Imagenes
  if (Sender is TfrxPictureView) then
  begin
     s := TfrxPictureView(Sender).TagStr;
     if (s = 'ImagenModelo') then
     begin
        with xImagenModelo do
        begin
           Close;
           Params.ByName['MODELO'].AsString := xDespieceCab.FieldByName('MODELO').AsString;
           Open;

           DMListados.MostrarImagen(FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        end;
     end;

     if (s = 'ImagenDespiece') then
     begin
        DMListados.MostrarImagen(xDespieceCab.FieldByName('ID_IMAGEN').AsInteger, TfrxPictureView(Sender));
     end;

     if (s = 'ImagenModelo') then
     begin
        try
           xImagenComponente.Close;
           xImagenComponente.Params.ByName['ID_A'].AsInteger := DameIDArticulo(xDespieceCom.FieldByName('COMPONENTE').AsString);
           xImagenComponente.Open;

           if not (xImagenComponente.FieldByName('IMAGEN').IsNull) then
           begin
              JPG := TJpegImage.Create;
              try
                 m := xImagenComponente.CreateBlobStream(xImagenComponente.FieldByName('IMAGEN'), bmRead);
                 JPG.LoadFromStream(m);
                 TfrxPictureView(Sender).Picture.Assign(JPG);
              finally
                 JPG.Free;
              end;
           end
           else
              TfrxPictureView(Sender).Picture.Assign(nil);
        except
        end;
     end;
  end;
end;

procedure TDMLstDespiece.frxDespieceGetValue(const VarName: string; var Value: variant);
begin
  frDespieceGetValue(VarName, Value);
end;

end.
