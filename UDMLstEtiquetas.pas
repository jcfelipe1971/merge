unit UDMLstEtiquetas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport,
  FR_DSet, DB, FIBDataSetRO, ExtCtrls, Forms, Dialogs, FIBDataSetRW,
  FIBDataSet, FIBTableDataSet, FIBQuery, HYFIBQuery, FR_DBSet, Barras, DateUtils,
  frxClass, frxHYReport, frxBarcode, frxDBSet;

type
  TDMLstEtiquetas = class(TDataModule)
     TLocal: THYTransaction;
     DSxTemp: TDataSource;
     xTemp: TFIBDataSetRO;
     frArticulos: TfrHYReport;
     frDBDSxTemp: TfrDBDataSet;
     CodBarras: TCodeBar;
     frxArticulos: TfrxHYReport;
     frxDBDSxTemp: TfrxDBDataset;
     xCabecera: TFIBDataSetRO;
     xArticuloIdioma: TFIBDataSetRO;
     DSDSxArticuloIdioma: TDataSource;
     procedure frArticulosEnterRect(Memo: TStringList; View: TfrView);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frDBDSxTempFirst(Sender: TObject);
     procedure frDBDSxTempNext(Sender: TObject);
     procedure frArticulosGetValue(const ParName: string; var ParValue: variant);
     procedure frxArticulosBeforePrint(Sender: TfrxReportComponent);
     procedure frxArticulosGetValue(const VarName: string; var Value: variant);
     procedure xTempAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     ICodBarras: TImage;
     Valorado: integer;
     procedure PintaCodigoBarras;
     procedure BorraTemporal;
  public
     { Public declarations }
     LocalMascaraN: string;
     PiezasCaja: string;
     Lote: string;
     Fecha: TDateTime;
     Texto1: string;
     Texto2: string;
     Texto3: string;
     Idioma: string;
     procedure MostrarListadoCodBarras(Ejercicio, Canal: integer; Serie: string; rig: integer; Articulo: string; CantidadEtiquetas, CantidadEtiquetsEnBlanco, Modo, Tipo: integer; Tarifa: string; id: integer; aValorado: integer; CodBarra: string; UsarBultos: integer);
     procedure MostrarLstCodBarrasDevol(SerieD, SerieH, AlmacenD, AlmacenH: string; FechaD, FechaH: TDateTime; Espacios, aValorado, Modo: integer; Tarifa: string);
  end;

var
  DMLstEtiquetas : TDMLstEtiquetas;

implementation

uses UDMListados, UEntorno, UFormGest, UDMMain;

{$R *.dfm}

procedure TDMLstEtiquetas.frArticulosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     if (Memo[0] = '[ImgCodBarras]') then
     begin
        TfrPictureView(View).Picture.Assign(ICodBarras.Picture);
     end;
     if (Memo[0] = '[Empresa]') then
     begin
        Memo.Delete(0);
        Memo.Add(REntorno.NombreEmpresa);
     end;
     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLstEtiquetas.MostrarListadoCodBarras(Ejercicio, Canal: integer; Serie: string; rig: integer; Articulo: string; CantidadEtiquetas, CantidadEtiquetsEnBlanco, Modo, Tipo: integer; tarifa: string; id: integer; aValorado: integer; CodBarra: string; UsarBultos: integer);
var
  Grupo : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE LST_COD_BARRAS ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, ');
        SQL.Add(' :ARTICULO, :NBARRAS, :ESPACIOS, :ENTRADA, ');
        SQL.Add(' :MODO, :TARIFA, :ID, :USARBULTOS) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['RIG'].AsInteger := rig;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['NBARRAS'].AsInteger := CantidadEtiquetas;
        Params.ByName['ESPACIOS'].AsInteger := CantidadEtiquetsEnBlanco;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MODO'].AsInteger := Tipo;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ID'].AsInteger := id;
        Params.ByName['USARBULTOS'].AsInteger := UsarBultos;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Valorado := aValorado;
  if (Valorado = 1) then
     Grupo := 63
  else
     Grupo := 196;

  with xTemp do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['CODIGOBARRAS'].AsString := CodBarra; {Para que salga el que yo selecciono Mirko}
     Open;
  end;

  with xCabecera do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := id;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frArticulos, frxArticulos, nil);

  BorraTemporal;
end;

procedure TDMLstEtiquetas.MostrarLstCodBarrasDevol(SerieD, SerieH, AlmacenD, AlmacenH: string; FechaD, FechaH: TDateTime; Espacios, aValorado, Modo: integer; Tarifa: string);
var
  Grupo : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE LST_COD_BARRAS_DEVOL ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE_DESDE, :SERIE_HASTA, ');
        SQL.Add(' :FECHA_DESDE, :FECHA_HASTA, :ALMACEN_DESDE, :ALMACEN_HASTA, ');
        SQL.Add(' :ESPACIOS, :ENTRADA, :TARIFA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE_DESDE'].AsString := SerieD;
        Params.ByName['SERIE_HASTA'].AsString := SerieH;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaD;
        Params.ByName['FECHA_HASTA'].AsDateTime := EndOfTheDay(FechaH);
        Params.ByName['ALMACEN_DESDE'].AsString := AlmacenD;
        Params.ByName['ALMACEN_HASTA'].AsString := AlmacenH;
        Params.ByName['ESPACIOS'].AsInteger := Espacios;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TARIFA'].AsString := Tarifa;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Valorado := aValorado;
  if (Valorado = 1) then
     Grupo := 63
  else
     Grupo := 196;

  with xTemp do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frArticulos, frxArticulos, nil);

  BorraTemporal;
end;

procedure TDMLstEtiquetas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  AbreData(TDMListados, DMListados);

  ICodBarras := TImage.Create(Self);
end;

procedure TDMLstEtiquetas.DataModuleDestroy(Sender: TObject);
begin
  ICodBarras.Free;
  CierraData(DMListados);
end;

procedure TDMLstEtiquetas.PintaCodigoBarras;
begin
  ICodBarras.Picture := nil;
  with CodBarras do
  begin
     codigo := xTemp.FieldByName('CODIGOBARRAS').AsString; // Este campo es el campo de 'barras'
     VerTexto := cboCodigo;
     Texto := CodBarras.codigo;
     Alto := 60;
     Porcentaje := 10;
     Modulo := 1;
     ChequearDigito := True;
     case xTemp.FieldByName('TIPOBARRAS').AsInteger of
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
  CodBarras.DibujaCodeBar(ICodBarras.Canvas);
  ICodBarras.Refresh;
end;

procedure TDMLstEtiquetas.frDBDSxTempFirst(Sender: TObject);
begin
  pintaCodigoBarras;
end;

procedure TDMLstEtiquetas.frDBDSxTempNext(Sender: TObject);
begin
  pintaCodigoBarras;
end;

procedure TDMLstEtiquetas.frArticulosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
  if ((ParName = 'fecha_listado') or (UpperCase(ParName) = 'TEXTO3')) then
     ParValue := Texto3;
  if ((ParName = 'num_piezas') or (UpperCase(ParName) = 'TEXTO1')) then
     ParValue := Texto1;
  if ((ParName = 'lote_listado') or (UpperCase(ParName) = 'TEXTO2')) then
     ParValue := Texto2;
  if ParName = 'Desglose' then
     ParValue := Valorado;
  if ParName = 'Valorado' then
     ParValue := Valorado;
  if ParName = 'IDIOMA' then
     ParValue := Idioma;
end;

procedure TDMLstEtiquetas.frxArticulosBeforePrint(Sender: TfrxReportComponent);
begin
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
           {
           if Pos('[ImgArticulo]', Memo[0]) > 0 then
           begin
              DMListados.MostrarImagen(xArticulosIMAGEN.AsInteger, TfrxPictureView(Sender));
              TfrxPictureView(Sender).Visible := True;
           end;
           }
           if Pos('[Empresa]', Memo[0]) > 0 then
           begin
              Memo.Delete(0);
              Memo.Add(REntorno.NombreEmpresa);
           end;
        end;
     end;
  end;
end;

procedure TDMLstEtiquetas.frxArticulosGetValue(const VarName: string; var Value: variant);
begin
  frArticulosGetValue(VarName, Value);
end;

procedure TDMLstEtiquetas.BorraTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_COD_BARRAS WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstEtiquetas.xTempAfterOpen(DataSet: TDataSet);
begin
  with xArticuloIdioma do
  begin
     Close;
     Params.ByName['IDIOMA'].AsString := Idioma;
     Open;
  end;
end;

end.
