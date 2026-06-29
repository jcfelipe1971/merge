unit UDMLstArticulos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados, FIBDataSetRO, DB,
  FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstArticulos = class(TDataModule)
     TLocal: THYTransaction;
     frArticulos: TfrHYReport;
     xTipoIvaD: TFIBDataSetRO;
     DSxTipoIvaD: TDataSource;
     xTipoIvaH: TFIBDataSetRO;
     DSxTipoIvaH: TDataSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xTipoIVA: TFIBDataSetRO;
     DSxTipoIVA: TDataSource;
     frDBxTipoIVA: TfrDBDataSet;
     xTipoIvaDTITULO: TFIBStringField;
     xTipoIvaHTITULO: TFIBStringField;
     QMinTipoIVA: THYFIBQuery;
     QMaxTipoIVA: THYFIBQuery;
     QMaxPrecioCoste: THYFIBQuery;
     QAgrupaciones: TFIBDataSetRO;
     DSQAgrupaciones: TDataSource;
     frDSQAgrupaciones: TfrDBDataSet;
     QArtAgrup: TFIBDataSetRO;
     DSCliAgrup: TDataSource;
     frDSCliAgrup: TfrDBDataSet;
     xAgrupacion: TFIBDataSetRO;
     xAgrupacionAGRUPACION: TFIBStringField;
     xAgrupacionTITULO: TFIBStringField;
     xAgrupacionTIPO: TFIBStringField;
     DSxAgrupacion: TDataSource;
     xMinAgrup: TFIBDataSetRO;
     frxArticulos: TfrxHYReport;
     xCodigoBarras: TFIBDataSetRO;
     DSxCodigoBarras: TDataSource;
     frDSxCodigoBarras: TfrDBDataSet;
     procedure DMLstArticulosCreate(Sender: TObject);
     procedure DMLstArticulosDestroy(Sender: TObject);
     procedure xArticulosAfterScroll(DataSet: TDataSet);
     procedure frArticulosEnterRect(Memo: TStringList; View: TfrView);
     procedure frArticulosGetValue(const ParName: string; var ParValue: variant);
     procedure frxArticulosBeforePrint(Sender: TfrxReportComponent);
     procedure frxArticulosGetValue(const VarName: string; var Value: variant);
     procedure xArticulosAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     SW: integer;
     ArtD, ArtH, FamD, FamH, CComprasD, CComprasH, CVentasD, CVentasH: string;
     TipoIVAD, TipoIVAH: string;
  public
     { Public declarations }
     PCosteD, PCosteH: string;
     procedure MostrarListado(parArtD, parArtH, parFamD, parFamH, parCComprasD, parCComprasH, parCVentasD, parCVentasH, parTipoIVAD, parTipoIVAH, parPCosteD, parPCosteH, Filtro: string; Modo: integer; Orden: integer);
     procedure GenerarSQL(const Filtro: string; Orden: integer);
     procedure RefrescaTipoIVA(Tabla: TFIBDataSetRO; Tipo: string);
     procedure Recargar(var MinArt, MaxArt, MinFam, MaxFam, MinCta, MaxCta, MinTipoIVA, MaxTipoIVA: string);
     procedure TituloAgrupacion(Agrupacion: string);
     procedure DameAgrupacion(var agrupacion: string);
     procedure MostrarFiltradoAgrup(Modo: byte; Agrupacion: string; Orden: byte);
  end;

var
  DMLstArticulos : TDMLstArticulos;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMLstArticulos.DMLstArticulosCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstArticulos.DMLstArticulosDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

{ Listado de Artículos }

procedure TDMLstArticulos.MostrarListado(parArtD, parArtH, parFamD, parFamH, parCComprasD, parCComprasH, parCVentasD, parCVentasH, parTipoIVAD, parTipoIVAH, parPCosteD, parPCosteH, Filtro: string; Modo: integer; Orden: integer);
begin
  SW := 1;

  // Normalizar parámetros Desde-Hasta
  DMListados.Normalizar_Desde_Hasta(parArtD, parArtH);
  DMListados.Normalizar_Desde_Hasta(parFamD, parFamH);
  DMListados.Normalizar_Desde_Hasta(parCComprasD, parCComprasH);
  DMListados.Normalizar_Desde_Hasta(parCVentasD, parCVentasH);
  DMListados.Normalizar_Desde_Hasta(parPCosteD, parPCosteH);
  DMListados.Normalizar_Desde_Hasta(parTipoIVAD, parTipoIVAH);

  // Asignar variables del Listado

  ArtD := parArtD;
  ArtH := parArtH;
  FamD := parFamD;
  FamH := parFamH;
  CComprasD := parCComprasD;
  CComprasH := parCComprasH;
  CVentasD := parCVentasD;
  CVentasH := parCVentasH;
  TipoIVAD := parTipoIVAD;
  TipoIVAH := parTipoIVAH;
  PCosteD := parPCosteD;
  PCosteH := parPCosteH;

  if (Trim(PCosteD) = '') then
     PCosteD := '0';
  if (Trim(PCosteH) = '') then
     PCosteH := '0';

  GenerarSQL(Filtro, Orden);

  with xArticulos do
  begin
     Close;
     Unidirectional := True;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  DMListados.Imprimir(89, 0, Modo, '', '', frArticulos, frxArticulos, nil, nil);
end;

procedure TDMLstArticulos.GenerarSQL(const Filtro: string; Orden: integer);
begin
  with xArticulos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ARTICULOS_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA ');
     SelectSQL.Add(' AND EJERCICIO = :EJERCICIO ');
     SelectSQL.Add(' AND CANAL = :CANAL ');
     if Filtro[1] = '1' then
        SelectSQL.Add(' AND ARTICULO>=''' + ArtD + ''' AND ARTICULO<=''' + ArtH + '''');
     if Filtro[2] = '1' then
        SelectSQL.Add(' AND FAMILIA>=''' + FamD + ''' AND FAMILIA<=''' + FamH + '''');
     if Filtro[3] = '1' then
        SelectSQL.Add(' AND CTA_COMPRAS>=''' + CComprasD + ''' AND CTA_COMPRAS<=''' + CComprasH + '''');
     if Filtro[4] = '1' then
        SelectSQL.Add(' AND CTA_VENTAS>=''' + CVentasD + ''' AND CTA_VENTAS<=''' + CVentasH + '''');
     if (Filtro[5] = '1') and (TipoIVAD <> '') and (TipoIVAH <> '') then
        SelectSQL.Add(' AND TIPO_IVA>=' + TipoIVAD + ' AND TIPO_IVA<=' + TipoIVAH);
     if Filtro[6] = '1' then
     begin
        SelectSQL.Add(' AND P_COSTE>=' + StringReplace(PCosteD, ',', '.', []) + ' AND P_COSTE<=' + StringReplace(PCosteH, ',', '.', []));
     end;

     case Orden of
        1: SelectSQL.Add(' ORDER BY ARTICULO ');
        2: SelectSQL.Add(' ORDER BY TITULO ');
     end;
  end;
end;

{ Refrescar Descripciones }

procedure TDMLstArticulos.RefrescaTipoIVA(Tabla: TFIBDataSetRO; Tipo: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO'].AsString := Tipo;
     Open;
  end;
end;

procedure TDMLstArticulos.xArticulosAfterScroll(DataSet: TDataSet);
begin
  with xTipoIVA do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

procedure TDMLstArticulos.frArticulosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);
  end;
end;

procedure TDMLstArticulos.frArticulosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstArticulos.Recargar(var MinArt, MaxArt, MinFam, MaxFam, MinCta, MaxCta, MinTipoIVA, MaxTipoIVA: string);
begin
  DameMinMax('ART', MinArt, MaxArt);
  DameMinMax('FAM', MinFam, MaxFam);
  DameMinMax('CTA', MinCta, MaxCta);

  // Tipo IVA
  with QMinTipoIVA do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     ExecQuery;
     MinTipoIVA := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxTipoIVA do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     ExecQuery;
     MaxTipoIVA := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;

  // Precio de Coste
  PCosteD := '0';
  PCosteH := '99999999';
end;

procedure TDMLSTArticulos.TituloAgrupacion(Agrupacion: string);
begin
  with xAgrupacion do
  begin
     Close;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMLSTArticulos.DameAgrupacion(var agrupacion: string);
begin
  xMinAgrup.Close;
  xMinAgrup.Open;
  agrupacion := xMinAgrup.FieldByName('AGRUPACION').AsString;
end;

procedure TDMLstArticulos.MostrarFiltradoAgrup(Modo: byte; Agrupacion: string; Orden: byte);
begin
  with QAgrupaciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Params.ByName['TIPO'].AsString := 'T';
     Open;
  end;

  with QArtAgrup do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT A.*, E.AGRUPACION, E.REPLICADO ');
     SelectSQL.Add(' FROM VER_ARTICULOS A ');
     SelectSQL.Add(' JOIN EMP_AGRUPACIONES_ART E ON A.EMPRESA = E.EMPRESA AND A.ARTICULO = E.ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' E.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' E.AGRUPACION = :AGRUPACION ');
     case Orden of
        0: SelectSQL.Add(' ORDER BY A.ARTICULO ');
        1: SelectSQL.Add(' ORDER BY A.TITULO ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  SW := 1;
  DMListados.Imprimir(155, 0, Modo, '', '', frArticulos, frxArticulos, nil, nil);
end;

procedure TDMLstArticulos.frxArticulosBeforePrint(Sender: TfrxReportComponent);
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

  // Tratamiento de las Imagenes
  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = '[ImgArticulo]') then
     begin
        if (xArticulos.FieldByName('IMAGEN').AsInteger <> 0) then
        begin
           DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
           TfrxPictureView(Sender).Visible := True;
        end
        else
           TfrxPictureView(Sender).Visible := False;
     end;
  end;
end;

procedure TDMLstArticulos.frxArticulosGetValue(const VarName: string; var Value: variant);
begin
  frArticulosGetValue(VarName, Value);
end;

procedure TDMLstArticulos.xArticulosAfterOpen(DataSet: TDataSet);
begin
  xCodigoBarras.Close;
  xCodigoBarras.Open;
end;

end.
