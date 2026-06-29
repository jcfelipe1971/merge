unit UDMLstEtiArticulosKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados,
  DB, FIBDataSet, Barras, FIBDataSetRO, FR_DBSet, FR_DSet, ExtCtrls, HYFIBQuery,
  frxClass, frxDBSet, frxHYReport;

type
  TDMLstEtiArticulosKri = class(TDataModule)
     frCodBarras: TfrHYReport;
     frUserDSCodBarras: TfrUserDataset;
     frDBxDetalleDoc: TfrDBDataSet;
     xDetalleDoc: TFIBDataSetRO;
     TLocal: THYTransaction;
     DSxDetalleDoc: TDataSource;
     CodBarras: TCodeBar;
     xArtBarras: TFIBDataSetRO;
     xArtBarrasEMPRESA: TIntegerField;
     xArtBarrasBARRAS: TFIBStringField;
     xArtBarrasARTICULO: TFIBStringField;
     xArtBarrasTIPO: TIntegerField;
     xArtBarrasFUNCION: TIntegerField;
     xArtTyC: TFIBDataSetRO;
     DSxArtTyC: TDataSource;
     frxCodBarras: TfrxHYReport;
     frxDBxDetalleDoc: TfrxDBDataset;
     frxUserDSCodBarras: TfrxUserDataSet;
     procedure DataModuleDestroy(Sender: TObject);
     procedure DataModuleCreate(Sender: TObject);
     procedure frDBxDetalleDocFirst(Sender: TObject);
     procedure frDBxDetalleDocNext(Sender: TObject);
     procedure frCodBarrasGetValue(const ParName: string; var ParValue: variant);
     procedure frCodBarrasEnterRect(Memo: TStringList; View: TfrView);
     procedure frxCodBarrasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     ImgCodBarras: TImage;
     Almacen: string;
     procedure DibujarCodBarras(const cod_barra: string; const tipo_barra: integer; ICodBarra: TImage; CodBarras: TCodeBar);
     procedure ActualizarCBarras;
  public
     { Public declarations }
     Cant: integer;
     MostrarPVP: boolean;
     procedure MostrarListado(Modo: integer; ArtDesde, ArtHasta, FamDesde, FamHasta: string; Cantidad: integer; Alm: string);
  end;

var
  DMLstEtiArticulosKri : TDMLstEtiArticulosKri;

implementation

uses UDMListados, UFormGest, UEntorno, UDMMain;

{$R *.dfm}

procedure TDMLstEtiArticulosKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  MostrarPVP := False;
end;

procedure TDMLstEtiArticulosKri.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstEtiArticulosKri.frDBxDetalleDocFirst(Sender: TObject);
begin
  ActualizarCBarras;
end;

procedure TDMLstEtiArticulosKri.frDBxDetalleDocNext(Sender: TObject);
begin
  ActualizarCBarras;
end;

procedure TDMLstEtiArticulosKri.ActualizarCBarras;
var
  // Q : THYFIBQuery;
  Existencias : double;
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
     DibujarCodBarras(xArtBarrasBARRAS.AsString,
        xArtBarrasTIPO.AsInteger, ImgCodBarras, CodBarras);
     if (Cant = -1) then
     begin
        Existencias := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, xDetalleDoc.FieldByName('ARTICULO').AsString, Almacen);

        if (Existencias > 0) then
        begin
           frUserDSCodBarras.RangeEndCount := Trunc(Existencias);
           frxUserDSCodBarras.RangeEndCount := Trunc(Existencias);
        end
        else
        begin
           frUserDSCodBarras.RangeEndCount := 0;
           frxUserDSCodBarras.RangeEndCount := 0;
        end;
     end
     else
     begin
        frUserDSCodBarras.RangeEndCount := Cant;
        frxUserDSCodBarras.RangeEndCount := Cant;
     end;
  end;
end;

// Dibujar el cod.barras
procedure TDMLstEtiArticulosKri.DibujarCodBarras(const cod_barra: string; const tipo_barra: integer; ICodBarra: TImage; CodBarras: TCodeBar);
begin
  ICodBarra.Picture := nil;
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
  //Con estas dos líneas no se corta la impresión
  ICodBarra.Height := CodBarras.Alto + CodBarras.OrigenY * 2;
  ICodBarra.Width := CodBarras.Ancho + CodBarras.OrigenX * 2;

  CodBarras.DibujaCodeBar(ICodBarra.Canvas);
  ICodBarra.Refresh;
end;

procedure TDMLstEtiArticulosKri.frCodBarrasGetValue(const ParName: string; var ParValue: variant);
var
  Q : THYFIBQuery;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'MostrarPVP' then
     if MostrarPVP then
        ParValue := 1
     else
        ParValue := 0;
  if ParName = 'PVP' then
     if MostrarPVP then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select precio_venta from art_tarifas_precios where ' +
              'empresa=' + REntorno.EmpresaStr + ' and tarifa=''NOR'' and ' +
              'articulo=''' + xDetalleDoc.FieldByName('ARTICULO').AsString + ''' and linea=1';
           ExecQuery;
           ParValue := FieldByName['PRECIO_VENTA'].AsFloat;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end
     else
        ParValue := 0;
end;

procedure TDMLstEtiArticulosKri.frCodBarrasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     // Máscaras
     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := MascaraN;
     if (Pos('[MascaraI]', Memo[0]) > 0) then
        View.FormatStr := MascaraI;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
     if (Pos('[MascaraP]', Memo[0]) > 0) then
        View.FormatStr := MascaraP;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := MascaraL;

     // Imagen del CB
     if (Memo[0] = '[ImgCodBarras]') then
        TfrPictureView(View).Picture.Assign(ImgCodBarras.Picture);
  end;
end;

procedure TDMLstEtiArticulosKri.MostrarListado(Modo: integer; ArtDesde, ArtHasta, FamDesde, FamHasta: string; Cantidad: integer; Alm: string);
var
  str : string;
begin
  ImgCodBarras := TImage.Create(Self);
  Cant := Cantidad;
  Almacen := Alm;

  with xDetalleDoc do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DARTICULO'].AsString := ArtDesde;
     Params.ByName['HARTICULO'].AsString := ArtHasta;
     Params.ByName['DFAMILIA'].AsString := FamDesde;
     Params.ByName['HFAMILIA'].AsString := FamHasta;
     Open;
  end;

  if (xDetalleDoc.EOF) then
  begin
     ImgCodBarras.Free;
     Exit;
  end;

  DMListados.Cargar(96, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frCodBarras.LoadFromFIB(REntorno.Formato, str);
     frCodBarras.PrepareReport;
     case Modo of
        0: frCodBarras.ShowPreparedReport;
        1: frCodBarras.PrintPreparedReport('', REntorno.Copias);
     end;
  end
  else
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxCodBarras.LoadFromFIB(REntorno.Formato, str);
     frxCodBarras.PrepareReport;
     case Modo of
        0: frxCodBarras.ShowPreparedReport;
        1: frxCodBarras.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
  ImgCodBarras.Free;
end;

procedure TDMLstEtiArticulosKri.frxCodBarrasGetValue(const VarName: string; var Value: variant);
begin
  frCodBarrasGetValue(VarName, Value);
end;

end.
