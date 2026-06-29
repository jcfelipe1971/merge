unit UDMRStockAlmacen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport, FIBTableDataSetRO, ComCtrls, FIBDataSetRW;

type
  TDMRStockAlmacen = class(TDataModule)
     frStockAlmacen: TfrHYReport;
     DSSPStockAlmacen: TDataSource;
     frDSSPStockAlmacen: TfrDBDataSet;
     TLocal: THYTransaction;
     SPStockAlmacen: TFIBDataSetRO;
     QMCodProv: TFIBDataSetRO;
     DSQMCodProv: TDataSource;
     frxStockAlmacen: TfrxHYReport;
     TUpdate: THYTransaction;
     QMArticulo: TFIBDataSetRO;
     DSQMArticulo: TDataSource;
     xLotes: TFIBDataSetRO;
     DSxLotes: TDataSource;
     frDBDxLotes: TfrDBDataSet;
     xNrosSerie: TFIBDataSetRO;
     DSxNrosSerie: TDataSource;
     frDBxNrosSerie: TfrDBDataSet;
     DSModelo: TDataSource;
     frDBModelo: TfrDBDataSet;
     xModelo: TFIBDataSetRO;
     xModeloColorStock: TFIBDataSetRW; // TFIBTableSet;
     DSxModeloColor: TDataSource;
     frDBModeloColor: TfrDBDataSet;
     TStocks: THYTransaction;
     QMTituloTalla: TFIBDataSetRO;
     DSTituloTalla: TDataSource;
     QMColor: TFIBDataSetRO;
     DSColor: TDataSource;
     xUnidLogistica: TFIBDataSetRO;
     DSxUnidLogistica: TDataSource;
     procedure DMRCabeceraDestroy(Sender: TObject);
     procedure frStockAlmacenGetValue(const ParName: string; var ParValue: variant);
     procedure frStockAlmacenEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRStockAlmacenCreate(Sender: TObject);
     procedure frxStockAlmacenBeforePrint(Sender: TfrxReportComponent);
     procedure frxStockAlmacenGetValue(const VarName: string; var Value: variant);
     procedure SPStockAlmacenBeforeOpen(DataSet: TDataSet);
     procedure SPStockAlmacenBeforeClose(DataSet: TDataSet);
     procedure xModeloAfterOpen(DataSet: TDataSet);
     procedure xModeloBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     RangoSelec: string;
     Moneda, LocalMascaraN: string;
     CalcularLotesNrosSerie: boolean;
     procedure ActualizarRangoSelec(LCan, LAlm: TStrings; Canal: smallint);
  public
     { Public declarations }
     Fecha: TDateTime;
     TipoValor: byte;
     TipoStock: byte;
     SinStock, SoloSinStock, Baja: boolean;
     ArtD, ArtH, FamD, FamH, SubFamD, SubFamH, Almacen, Tarifa: string;
     GeneroD, GeneroH, TemporadaD, TemporadaH, MarcaD, MarcaH: string;
     TipoArticulo: string;
     Cliente: integer;
     procedure Rangos;
     procedure MostrarListado(LCan, LAlm: TStrings; Canal, Modo, Orden: integer; aMoneda, aTipoArticulo: string; aCalcularLotesNrosSerie, CalcularProveedorPrioritario, CalcularDatosArticulos: boolean; PBListado: TProgressBar);
     procedure ExportarExcel(CalcularDatosArticulos, CalcularLotesNrosSerie, CalcularProveedorPrioritario: boolean; PBListado: TProgressBar);
  end;

var
  DMRStockAlmacen : TDMRStockAlmacen;

implementation

uses UEntorno, UDMListados, UFormGest, UDMMain, UDMPrestashop, UUtiles, UHojaCalc, UParam, DateUtils, UDameDato;

{$R *.DFM}

procedure TDMRStockAlmacen.DMRStockAlmacenCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  AbreData(TDMPrestashop, DMPrestashop);
end;

procedure TDMRStockAlmacen.DMRCabeceraDestroy(Sender: TObject);
begin
  inherited;
  // Transaccion ReadWrite TStocks para poder calcular stocks si es necesario
  if (TStocks.InTransaction) then
     TStocks.Commit;

  CierraData(DMPrestashop);
  CierraData(DMListados);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_AGRUPACIONES WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRStockAlmacen.MostrarListado(LCan, LAlm: TStrings; Canal, Modo, Orden: integer; aMoneda, aTipoArticulo: string; aCalcularLotesNrosSerie, CalcularProveedorPrioritario, CalcularDatosArticulos: boolean; PBListado: TProgressBar);
begin
  CalcularLotesNrosSerie := aCalcularLotesNrosSerie;
  if (LAlm.Count = 1) then
     LAlm[0] := Almacen;
  DMListados.Normalizar_Desde_Hasta(ArtD, ArtH);
  DMListados.Normalizar_Desde_Hasta(FamD, FamH);
  ActualizarRangoSelec(LCan, LAlm, Canal);
  Moneda := aMoneda;
  TipoArticulo := aTipoArticulo;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);

  with SPStockAlmacen do
  begin
     Close;
     SelectSQL.Clear;

     SelectSQL.Add(' SELECT X.* ');
     SelectSQL.Add('        -- ');
     SelectSQL.Add('        , M.REF_PROVEEDOR, M.COD_MOD, M.CLIENTE, M.REF_CLIENTE, A.FAMILIA FAMILIA_ART, F.TITULO AS TITULO_FAMILIA, A.SUBFAMILIA, ');
     SelectSQL.Add('        S.TITULO AS TITULO_SUBFAMILIA, M.PROVEEDOR, M.COD_ESTRUCTURA, M.CODIGO_TEMPORADA, TT.TITULO AS TITULO_TEMPORADA, ');
     SelectSQL.Add('        M.CODIGO_GENERO, G.TITULO AS TITULO_GENERO, M.P_COMPRA, M.P_COSTE, M.P_VENTA, M.PACK, ');
     SelectSQL.Add('        MM.MARCA, MM.TITULO TITULO_MARCA ');
     SelectSQL.Add('        -- ');
     SelectSQL.Add('        , A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8 ');
     SelectSQL.Add(' FROM A_ART_STOCK_POR_ALMACEN(:ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, :ALMACEN, :ART_INI, ');
     SelectSQL.Add('                              :ART_FIN, :FAM_INI, :FAM_FIN, :SUBFAM_INI, :SUBFAM_FIN, ');
     SelectSQL.Add('                              :FECHA, :TIPO_VALOR, :MONEDA, :TARIFA, :BAJA, :TIPO_ARTICULO, ');
     SelectSQL.Add('                              :CODIGO_GENERO_DESDE, :CODIGO_GENERO_HASTA, ');
     SelectSQL.Add('                              :CODIGO_TEMPORADA_DESDE, :CODIGO_TEMPORADA_HASTA, ');
     SelectSQL.Add('                              :MARCA_DESDE, :MARCA_HASTA) X ');
     SelectSQL.Add(' -- ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON X.EMPRESA = A.EMPRESA AND X.ARTICULO = A.ARTICULO ');
     SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS T ON (A.ID_A_M_C_T = T.ID_A_M_C_T) ');
     SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR C ON (T.ID_A_M_C = C.ID_A_M_C) ');
     SelectSQL.Add(' JOIN ART_ARTICULOS_MODELOS M ON (C.ID_A_M = M.ID_A_M) ');
     SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_MARCAS MM ON A.ID_MARCA = MM.ID_MARCA ');
     SelectSQL.Add(' JOIN ART_FAMILIAS F ON (A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.FAMILIA) ');
     SelectSQL.Add(' LEFT JOIN ART_SUBFAMILIAS S ON (A.EMPRESA = S.EMPRESA AND F.ID_FAMILIA = S.ID_FAMILIA AND A.SUBFAMILIA = S.SUBFAMILIA) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_MOD_GENERO G ON (M.CODIGO_GENERO = G.CODIGO) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_MOD_TEMPORADA TT ON (M.CODIGO_TEMPORADA = TT.CODIGO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' X.EMPRESA = :EMPRESA ');

     {
     SelectSQL.Add(' SELECT S.* FROM A_ART_STOCK_POR_ALMACEN (?ENTRADA, ?EMPRESA, ?EJERCICIO, ');
     SelectSQL.Add(' ?CANAL, ?ALMACEN, ?ART_INI, ?ART_FIN, ?FAM_INI, ?FAM_FIN, ?SUBFAM_INI, ?SUBFAM_FIN, ?FECHA, ');
     SelectSQL.Add(' ?TIPO_VALOR, ?MONEDA, ?TARIFA, ?BAJA, ?TIPO_ARTICULO) S ');

     if (Orden >= 3) then
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A.ARTICULO ');
     }

     if (GeneroD > '') then
        SelectSQL.Add(' AND M.CODIGO_GENERO >= :CODIGO_GENERO_DESDE ');
     if (GeneroH > '') then
        SelectSQL.Add(' AND M.CODIGO_GENERO <= :CODIGO_GENERO_HASTA ');
     if (TemporadaD > '') then
        SelectSQL.Add(' AND M.CODIGO_TEMPORADA >= :CODIGO_TEMPORADA_DESDE ');
     if (TemporadaH > '') then
        SelectSQL.Add(' AND M.CODIGO_TEMPORADA <= :CODIGO_TEMPORADA_HASTA ');
     if (MarcaD > '') then
        SelectSQL.Add(' AND MM.MARCA >= :MARCA_DESDE ');
     if (MarcaH > '') then
        SelectSQL.Add(' AND MM.MARCA <= :MARCA_HASTA ');
     if (Cliente <> 0) then
     begin
        SelectSQL.Add(' AND EXISTS(SELECT EMPRESA ');
        SelectSQL.Add('            FROM ART_ARTICULOS_CODCLI ');
        SelectSQL.Add('            WHERE ');
        SelectSQL.Add('            EMPRESA = X.EMPRESA AND ');
        SelectSQL.Add('            ARTICULO = X.ARTICULO AND ');
        SelectSQL.Add('            CLIENTE = :CLIENTE) ');
     end;

     if (TipoStock = 0) then
     begin
        // Existencias
        if SoloSinStock then
           SelectSQL.Add(' AND (X.EXISTENCIAS > -0.01) AND (X.EXISTENCIAS < 0.01) ')
        else
        if not SinStock then
           SelectSQL.Add(' AND NOT ((X.EXISTENCIAS > -0.01) AND (X.EXISTENCIAS < 0.01)) ');
     end
     else
     if (TipoStock = 1) then
     begin
        // Stock Virtual
        if SoloSinStock then
           SelectSQL.Add(' AND (X.STOCK_VIRTUAL > -0.01) AND (X.STOCK_VIRTUAL < 0.01) ')
        else
        if not SinStock then
           SelectSQL.Add(' AND NOT ((X.STOCK_VIRTUAL > -0.01) AND (X.STOCK_VIRTUAL < 0.01)) ');
     end;

     case Orden of
        1: SelectSQL.Add(' ORDER BY X.ARTICULO ');
        2: SelectSQL.Add(' ORDER BY X.FAMILIA, X.ARTICULO ');
        3: SelectSQL.Add(' ORDER BY A.ALFA_1, A.ARTICULO ');
        4: SelectSQL.Add(' ORDER BY A.ALFA_2, A.ARTICULO ');
        5: SelectSQL.Add(' ORDER BY A.ALFA_3, A.ARTICULO ');
        6: SelectSQL.Add(' ORDER BY A.ALFA_4, A.ARTICULO ');
        7: SelectSQL.Add(' ORDER BY A.ALFA_5, A.ARTICULO ');
        8: SelectSQL.Add(' ORDER BY A.ALFA_6, A.ARTICULO ');
        9: SelectSQL.Add(' ORDER BY A.ALFA_7, A.ARTICULO ');
        10: SelectSQL.Add(' ORDER BY A.ALFA_8, A.ARTICULO ');
        11: SelectSQL.Add(' ORDER BY MM.MARCA, M.CODIGO_TEMPORADA, M.CODIGO_GENERO, A.FAMILIA, A.SUBFAMILIA, M.REF_PROVEEDOR, A.ARTICULO ');
        else
           SelectSQL.Add(' ORDER BY X.ARTICULO ');
     end;

     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['ART_INI'].AsString := ArtD;
     Params.ByName['ART_FIN'].AsString := ArtH;
     Params.ByName['FAM_INI'].AsString := FamD;
     Params.ByName['FAM_FIN'].AsString := FamH;
     Params.ByName['SUBFAM_INI'].AsString := SubFamD;
     Params.ByName['SUBFAM_FIN'].AsString := SubFamH;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     // Tipo Valor: 0:PMP; 1:PCoste; 2:Tarifa
     Params.ByName['TIPO_VALOR'].AsInteger := TipoValor;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TARIFA'].AsString := Tarifa;
     Params.ByName['BAJA'].AsInteger := BooltoInt(Baja);
     Params.ByName['TIPO_ARTICULO'].AsString := aTipoArticulo;
     if (GeneroD > '') then
        Params.ByName['CODIGO_GENERO_DESDE'].AsString := GeneroD;
     if (GeneroH > '') then
        Params.ByName['CODIGO_GENERO_HASTA'].AsString := GeneroH;
     if (TemporadaD > '') then
        Params.ByName['CODIGO_TEMPORADA_DESDE'].AsString := TemporadaD;
     if (TemporadaH > '') then
        Params.ByName['CODIGO_TEMPORADA_HASTA'].AsString := TemporadaH;
     if (MarcaD > '') then
        Params.ByName['MARCA_DESDE'].AsString := MarcaD;
     if (MarcaH > '') then
        Params.ByName['MARCA_HASTA'].AsString := MarcaH;
     if (Cliente <> 0) then
        Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;

     Last;
     PBListado.Position := 0;
     PBListado.Max := RecordCount;
     First;
  end;

  with xModelo do
  begin
     // Transaccion ReadWrite TStocks para poder calcular stocks si es necesario
     if (Transaction.InTransaction) then
        Transaction.Commit;

     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;

     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT M.*, F.TITULO AS TITULO_FAMILIA, S.TITULO AS TITULO_SUBFAMILIA, TT.TITULO AS TITULO_TEMPORADA, ');
     SelectSQL.Add('        G.TITULO AS TITULO_GENERO, MM.TITULO TITULO_MARCA ');
     SelectSQL.Add(' FROM ART_ARTICULOS_MODELOS M ');
     SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_MARCAS MM ON M.ID_MARCA = MM.ID_MARCA ');
     SelectSQL.Add(' JOIN ART_FAMILIAS F ON (M.EMPRESA = F.EMPRESA AND M.FAMILIA = F.FAMILIA) ');
     SelectSQL.Add(' LEFT JOIN ART_SUBFAMILIAS S ON (F.EMPRESA = S.EMPRESA AND F.ID_FAMILIA = S.ID_FAMILIA AND M.SUBFAMILIA = S.SUBFAMILIA) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_MOD_GENERO G ON (M.CODIGO_GENERO = G.CODIGO) ');
     SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_MOD_TEMPORADA TT ON (M.CODIGO_TEMPORADA = TT.CODIGO) ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' M.EMPRESA = :EMPRESA ');
     SelectSQL.Add(' AND M.FAMILIA >= :FAM_INI ');
     SelectSQL.Add(' AND M.FAMILIA <= :FAM_FIN ');
     if (SubFamD > '') then
        SelectSQL.Add(' AND M.SUBFAMILIA >= :SUBFAM_INI ');
     if (SubFamH > '') then
        SelectSQL.Add(' AND M.SUBFAMILIA <= :SUBFAM_FIN ');
     if (GeneroD > '') then
        SelectSQL.Add(' AND M.CODIGO_GENERO >= :CODIGO_GENERO_DESDE ');
     if (GeneroH > '') then
        SelectSQL.Add(' AND M.CODIGO_GENERO <= :CODIGO_GENERO_HASTA ');
     if (TemporadaD > '') then
        SelectSQL.Add(' AND M.CODIGO_TEMPORADA >= :CODIGO_TEMPORADA_DESDE ');
     if (TemporadaH > '') then
        SelectSQL.Add(' AND M.CODIGO_TEMPORADA <= :CODIGO_TEMPORADA_HASTA ');
     if (MarcaD > '') then
        SelectSQL.Add(' AND MM.MARCA >= :MARCA_DESDE ');
     if (MarcaH > '') then
        SelectSQL.Add(' AND MM.MARCA <= :MARCA_HASTA ');

     if SoloSinStock then
     begin
        SelectSQL.Add(' AND ((SELECT SUM(ABS(UNIDADES)) FROM XGET_STOCK_AM(M.EMPRESA, :CANAL, :ALMACEN, M.ID_A_M, :FECHA, :MODO, :TIPO_VALOR, :TARIFA)) >= -0.01 AND ');
        SelectSQL.Add('      (SELECT SUM(ABS(UNIDADES)) FROM XGET_STOCK_AM(M.EMPRESA, :CANAL, :ALMACEN, M.ID_A_M, :FECHA, :MODO, :TIPO_VALOR, :TARIFA))  <= 0.01) ');
     end
     else
     begin
        if (not SinStock) then
        begin
           SelectSQL.Add(' AND ((SELECT SUM(ABS(UNIDADES)) FROM XGET_STOCK_AM(M.EMPRESA, :CANAL, :ALMACEN, M.ID_A_M, :FECHA, :MODO, :TIPO_VALOR, :TARIFA)) >= 0.01 OR ');
           SelectSQL.Add('      (SELECT SUM(ABS(UNIDADES)) FROM XGET_STOCK_AM(M.EMPRESA, :CANAL, :ALMACEN, M.ID_A_M, :FECHA, :MODO, :TIPO_VALOR, :TARIFA)) <= -0.01) ');
        end;
     end;

     SelectSQL.Add(' ORDER BY MM.MARCA, M.CODIGO_TEMPORADA, M.CODIGO_GENERO, M.FAMILIA, M.SUBFAMILIA, M.REF_PROVEEDOR ');
     SelectSQL.SaveToFile(DameTempPath + '\Modelo.sql');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAM_INI'].AsString := FamD;
     Params.ByName['FAM_FIN'].AsString := FamH;
     if (SubFamD > '') then
        Params.ByName['SUBFAM_INI'].AsString := SubFamD;
     if (SubFamH > '') then
        Params.ByName['SUBFAM_FIN'].AsString := SubFamH;
     if (GeneroD > '') then
        Params.ByName['CODIGO_GENERO_DESDE'].AsString := GeneroD;
     if (GeneroH > '') then
        Params.ByName['CODIGO_GENERO_HASTA'].AsString := GeneroH;
     if (TemporadaD > '') then
        Params.ByName['CODIGO_TEMPORADA_DESDE'].AsString := TemporadaD;
     if (TemporadaH > '') then
        Params.ByName['CODIGO_TEMPORADA_HASTA'].AsString := TemporadaH;
     if (MarcaD > '') then
        Params.ByName['MARCA_DESDE'].AsString := MarcaD;
     if (MarcaH > '') then
        Params.ByName['MARCA_HASTA'].AsString := MarcaH;

     if SoloSinStock or (not SinStock) then
     begin
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        // 0 Existencias - 1 Stock Virtual
        case TipoStock of
           0: Params.ByName['MODO'].AsInteger := 0;
           1: Params.ByName['MODO'].AsInteger := 3;
           else
              Params.ByName['MODO'].AsInteger := 0;
        end;
        Params.ByName['TIPO_VALOR'].AsInteger := 0; {PMP porque no se utilizara y es el mas eficiente}
        Params.ByName['TARIFA'].AsString := Tarifa;
     end;
     Open;
  end;

  with xModeloColorStock do
  begin
     // Transaccion ReadWrite TStocks para poder calcular stocks si es necesario
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;

     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM XGET_STOCK_AM(:EMPRESA, :CANAL, :ALMACEN, :ID_A_M, :FECHA, :MODO, :TIPO_VALOR, :TARIFA ) ');
     // Existencias
     if SoloSinStock then
        SelectSQL.Add(' WHERE (UNIDADES > -0.01) AND (UNIDADES < 0.01) ')
     else
     if not SinStock then
        SelectSQL.Add(' WHERE NOT ((UNIDADES > -0.01) AND (UNIDADES < 0.01)) ');
     SelectSQL.SaveToFile(DameTempPath + '\ModeloColor.sql');

     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     // 0 Existencias - 1 Stock Virtual
     case TipoStock of
        0: Params.ByName['MODO'].AsInteger := 0;
        1: Params.ByName['MODO'].AsInteger := 3;
     end;
     // Tipo Valor: 0:PMP; 1:PCoste; 2:Tarifa
     Params.ByName['TIPO_VALOR'].AsInteger := TipoValor;
     Params.ByName['TARIFA'].AsString := Tarifa;
     Open;
  end;

  if (CalcularDatosArticulos) then
  begin
     with QMArticulo do
     begin
        Close;
        DataSource := DSSPStockAlmacen;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := SPStockAlmacen.FieldByName('ARTICULO').AsString;
        Open;
     end;
  end
  else
  begin
     with QMArticulo do
     begin
        Close;
        DataSource := nil;
        Params.ByName['EMPRESA'].AsInteger := 0;
        Params.ByName['EJERCICIO'].AsInteger := 0;
        Params.ByName['CANAL'].AsInteger := 0;
        Params.ByName['ARTICULO'].AsString := SPStockAlmacen.FieldByName('ARTICULO').AsString;
        Open;
     end;
  end;

  with xUnidLogistica do
  begin
     Close;
     DataSource := DSSPStockAlmacen;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := SPStockAlmacen.FieldByName('ARTICULO').AsString;
     Open;
  end;

  if (CalcularLotesNrosSerie) then
  begin
     with xLotes do
     begin
        Close;
        DataSource := DSSPStockAlmacen;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := SPStockAlmacen.FieldByName('ARTICULO').AsString;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Open;
     end;

     with xNrosSerie do
     begin
        Close;
        DataSource := DSSPStockAlmacen;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULO'].AsString := SPStockAlmacen.FieldByName('ARTICULO').AsString;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Open;
     end;
  end
  else
  begin
     with xLotes do
     begin
        Close;
        DataSource := nil;
        Params.ByName['EMPRESA'].AsInteger := 0;
        Open;
     end;

     with xNrosSerie do
     begin
        Close;
        DataSource := nil;
        Params.ByName['EMPRESA'].AsInteger := 0;
        Open;
     end;
  end;

  if (CalcularProveedorPrioritario) then
  begin
     with QMCodProv do
     begin
        Close;
        DataSource := DSSPStockAlmacen;
        Open;
     end;
  end
  else
  begin
     with QMCodProv do
     begin
        Close;
        DataSource := nil;
        Params.ByName['EMPRESA'].AsInteger := 0;
        Params.ByName['ARTICULO'].AsString := SPStockAlmacen.FieldByName('ARTICULO').AsString;
        Open;
     end;
  end;

  if Modo = 2 then
     ExportarExcel(CalcularDatosArticulos, CalcularLotesNrosSerie, CalcularProveedorPrioritario, PBListado)
  else
     DMListados.Imprimir(25, 0, Modo, '', _('Listado de Stock por Almacen'), frStockAlmacen, frxStockAlmacen, nil);

  if (TStocks.InTransaction) then
     TStocks.Commit;
end;

procedure TDMRStockAlmacen.ExportarExcel(CalcularDatosArticulos, CalcularLotesNrosSerie, CalcularProveedorPrioritario: boolean; PBListado: TProgressBar);
var
  s, ns, Fichero : string;
  HCalc : THojaCalc;
  i, j, c, f : integer;
  ColumnaDescripcion, FilaExistencia, ColumnaExistencia : integer;
  TotalLotes, TotalSerie : double;
  Exportar : boolean;

  procedure EscribeCampo(HC: THojaCalc; f, c: integer; Campo: TField);
  begin
     // Campo tipo String
     if (Campo is TStringField) and (Trim(Campo.AsString) > '') then
        HC.CellText[f, c] := Trim(Campo.AsString);

     // Campo tipo Float
     if (Campo is TFloatField) and (Campo.AsFloat <> 0) then
        HC.SendNumber(f, c, Campo.AsFloat);

     // Campo tipo Integer
     if (Campo is TIntegerField) and (Campo.AsInteger <> 0) then
        HC.SendNumber(f, c, Campo.AsInteger);

     // Campo tipo Fecha
     if (Campo is TDateTimeField) and (YearOf(Campo.AsDateTime) > 1900) then
     begin
        if (HC.IsOpenOffice) then
           HC.CellText[f, c] := DateToStr(Campo.AsDateTime)
        else
           HC.CellText[f, c] := Trim(FormatDateTime('MM/DD/YYYY', Campo.AsDateTime));
     end;

     // Campo tipo Blob
     // Los blobs exportan solo caracteres basicos.
     if (Campo is TBlobField) and (Trim(LimpiaCadena(Campo.AsString)) > '') then
     begin
        try
           HC.CellText[f, c] := Trim(LimpiaCadena(Campo.AsString));
        except
           HC.CellText[f, c] := 'BLOB';
        end;
     end;
  end;

begin
  /// Exporta en formato Excel los datasets que ya estan abiertos y segun sean
  /// los parametros que son los checkbox de el formulario .

  // Almacenar la máscara
  {auxMascaraN := MascaraN;
  MascaraN := DMMain.MascaraMoneda(Moneda, 1);}

  Fichero := Format(_('StockAlmacen-%s'), [FormatDateTime('yyyymmdd_hhnnss', Now)]);
  Exportar := MySaveDialog(Fichero, 'ODS,XLS,ALL', '', 'FPregStockAlmacen');

  if Exportar then
  begin
     if (UpperCase(ExtractFileExt(Fichero)) = '.ODS') then
        HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
     else
        HCalc := THojaCalc.Create(thcExcel, False);

     try
        HCalc.FileName := Fichero;

        with SPStockAlmacen do
        begin
           First;

           f := 0;
           Inc(f);
           ColumnaDescripcion := MaxInt;
           c := 1;
           // Primera linea son los titulos de los campos
           for i := 0 to FieldCount - 1 do
           begin
              // Dejo dos columnas para caducidad y cantidad de lote
              if (i < ColumnaDescripcion) then
                 c := i + 1
              else
                 c := i + 3;

              if (Fields[i].Visible) then
              begin
                 if (Copy(Fields[i].FieldName, 1, 5) = 'ALFA_') then
                 begin
                    j := StrToIntDef(Copy(Fields[i].FieldName, 6, 1), 0);
                    HCalc.CellText[f, c] := LeeParametro(format('ARTDESC%3.3d', [j]));
                 end
                 else
                    HCalc.CellText[f, c] := Fields[i].FieldName;
              end;

              if (Fields[i].FieldName = 'DESCRIPCION') then
              begin
                 ColumnaDescripcion := c;
              end;
           end;

           if CalcularProveedorPrioritario then
           begin
              Inc(c);
              HCalc.CellText[f, c] := QMCodProv.FieldByName('PROVEEDOR').FieldName;
              Inc(c);
              HCalc.CellText[f, c] := QMCodProv.FieldByName('CODIGO_PROVEEDOR').FieldName;
              Inc(c);
              HCalc.CellText[f, c] := QMCodProv.FieldByName('DIAS_ENTREGA').FieldName;
           end;

           c := 1;
           ColumnaExistencia := -1;
           FilaExistencia := -1;
           while not EOF do //SPStockAlmacen
           begin
              Inc(f);
              PBListado.Position := PBListado.Position + 1;

              for i := 0 to FieldCount - 1 do // Recorre las columnas
              begin
                 // Dejo dos columnas para caducidad y cantidad de lote
                 if (i < ColumnaDescripcion) then
                    c := i + 1
                 else
                    c := i + 3;

                 if (Fields[i].Visible) then
                 begin
                    // Registro de stock
                    EscribeCampo(HCalc, f, c, Fields[i]);

                    if (Fields[i].FieldName = 'EXISTENCIAS') then
                    begin
                       FilaExistencia := f;
                       ColumnaExistencia := c;
                       // Fondo Rojo si EXISTENCIAS es negativa en el stock
                       if (Fields[i].AsFloat < 0) then
                          HCalc.BackgroundColor(f, c, clRed);
                    end;
                 end;
              end;

              if CalcularProveedorPrioritario then
              begin
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMCodProv.FieldByName('PROVEEDOR'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMCodProv.FieldByName('CODIGO_PROVEEDOR'));
                 Inc(c);
                 EscribeCampo(HCalc, f, c, QMCodProv.FieldByName('DIAS_ENTREGA'));
              end;

              TotalLotes := 0;
              if CalcularLotesNrosSerie then
              begin
                 // Registro de Lote
                 while not xLotes.EOF do
                 begin
                    // Solo muestro los que tienen stock (positivo o negativo).
                    if (abs(xLotes.FieldByName('STOCK').AsFloat) > 0.001) then
                    begin
                       Inc(f);

                       c := ColumnaDescripcion;
                       EscribeCampo(HCalc, f, c, xLotes.FieldByName('LOTE'));
                       HCalc.BackgroundColor(f, c, clSkyBlue);
                       HCalc.Italic(f, c);
                       Inc(c);

                       EscribeCampo(HCalc, f, c, xLotes.FieldByName('F_CADUCIDAD'));

                       // Fondo Amarillo si CADUCIDAD es menor a HOY en el lote
                       if xLotes.FieldByName('F_CADUCIDAD').AsDateTime < Date then
                          HCalc.BackgroundColor(f, c, clYellow)
                       else
                          HCalc.BackgroundColor(f, c, clSkyBlue);
                       HCalc.Italic(f, c);

                       Inc(c);
                       EscribeCampo(HCalc, f, c, xLotes.FieldByName('STOCK'));

                       // Fondo Rojo si EXISTENCIAS es negativa en el lotes
                       if (xLotes.FieldByName('STOCK').AsFloat < 0) then
                          HCalc.BackgroundColor(f, c, clSilver)
                       else
                          HCalc.BackgroundColor(f, c, clSkyBlue);
                       HCalc.Italic(f, c);

                       TotalLotes := TotalLotes + xLotes.FieldByName('STOCK').AsFloat;
                    end;

                    xLotes.Next;
                 end;

                 TotalSerie := 0;
                 // Registro de Series
                 while not xNrosSerie.EOF do
                 begin
                    Inc(f);

                    ns := xNrosSerie.FieldByName('LISTA').AsString;

                    if (Trim(ns) > '') then
                    begin
                       TotalSerie := TotalSerie + xNrosSerie.FieldByName('CANTIDAD').AsInteger;
                       EscribeCampo(HCalc, f, ColumnaDescripcion + 2, xNrosSerie.FieldByName('CANTIDAD'));
                       HCalc.Italic(f, ColumnaDescripcion + 2);
                       HCalc.BackgroundColor(f, ColumnaDescripcion + 2, clSkyBlue);
                    end;

                    // Divido la lista de nros de serie en cadenas de aproximadamente 50 caracteres
                    s := '';
                    for j := 1 to Length(ns) do
                    begin
                       s := s + Copy(ns, j, 1);

                       if (Copy(ns, j, 1) = ',') and (Length(s) > 50) then
                       begin
                          HCalc.CellText[f, ColumnaDescripcion] := Trim(s);
                          HCalc.Italic(f, ColumnaDescripcion);
                          HCalc.BackgroundColor(f, ColumnaDescripcion, clSkyBlue);
                          s := '';
                          Inc(f);
                       end;
                    end;

                    if (Trim(s) > '') then
                    begin
                       HCalc.CellText[f, ColumnaDescripcion] := Trim(s);
                       HCalc.Italic(f, ColumnaDescripcion);
                       HCalc.BackgroundColor(f, ColumnaDescripcion, clSkyBlue);
                    end
                    else
                       Dec(f);

                    xNrosSerie.Next;
                 end;

                 // Fondo Amarillo si EXISTENCIAS en el stock no cuadra con la suma de EXISTENCIAS de lotes
                 if (ColumnaExistencia >= 0) and (FilaExistencia >= 0) then
                 begin
                    if (ArticuloLoteable(FieldByName('ARTICULO').AsString)) and (TotalLotes <> FieldByName('EXISTENCIAS').AsFloat) then
                       HCalc.BackgroundColor(FilaExistencia, ColumnaExistencia, clFuchsia);

                    // Fondo Amarillo si EXISTENCIAS en el stock no cuadra con la cantidad d enros de serie
                    if (ArticuloSerializado(FieldByName('ARTICULO').AsString)) and (TotalSerie <> FieldByName('EXISTENCIAS').AsFloat) then
                       HCalc.BackgroundColor(FilaExistencia, ColumnaExistencia, clFuchsia);
                 end;
              end;

              Next;
           end;

           for c := 0 to FieldCount - 1 do
           begin
              if (Fields[c].Visible) then
              begin
                 // Campo tipo String
                 if (Fields[c] is TStringField) then
                    HCalc.AutoFit(c + 1);

                 // Formato de columna
                 if (Fields[c] is TFloatField) then
                    if (HCalc.IsOpenOffice) then
                       HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
              end;
           end;

           if CalcularProveedorPrioritario then
              HCalc.AutoFit(FieldCount - 1 + 3);
        end;// with SPStockAlmacen

        HCalc.SaveDocAs(Fichero, (Pos('.XLS', UpperCase(ExtractFileExt(Fichero))) > 0));
     finally
        Sleep(1000);
        Application.ProcessMessages;
        HCalc.Free;
     end;
  end;

  // Restaurar la máscara
  //MascaraN := auxMascaraN;
end;

procedure TDMRStockAlmacen.Rangos;
begin
  Fecha := REntorno.FechaTrab;
  Tarifa := REntorno.TarifaDefecto;
  Almacen := REntorno.AlmacenDefecto;

  DameMinMax('CAR', ArtD, ArtH);
  DameMinMax('FAM', FamD, FamH);
end;

procedure TDMRStockAlmacen.frStockAlmacenGetValue(const ParName: string; var ParValue: variant);
begin
  DMMain.Log('frStockAlmacenGetValue(' + ParName + ') - ' + SPStockAlmacen.FieldByName('ARTICULO').AsString + ' ' + xModelo.FieldByName('REF_PROVEEDOR').AsString + ' - ' + xModeloColorStock.FieldByName('ID_A_C').AsString);
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'RangoSelec' then
     ParValue := RangoSelec;

  if ParName = 'ArtDesde' then
     ParValue := ArtD;

  if ParName = 'ArtHasta' then
     ParValue := ArtH;

  if ParName = 'FamDesde' then
     ParValue := FamD;

  if ParName = 'FamHasta' then
     ParValue := FamH;

  if ParName = 'TipoArticulo' then
     ParValue := TipoArticulo;

  if ParName = 'TipoValor' then
  begin
     case TipoValor of
        0: ParValue := _('P.M.P.');
        1: ParValue := _('Precio de Coste');
        2: ParValue := _('Precio Tarifa');
        else
           ParValue := _('Sin Tipo Valor');
     end;
  end;

  if ParName = 'TipoStock' then
  begin
     case TipoStock of
        0: ParValue := _('Existencias');
        1: ParValue := _('Stock Virtual');
        else
           ParValue := _('Existencias');
     end;
  end;

  if ParName = 'Stock' then
  begin
     case TipoStock of
        0: ParValue := SPStockAlmacen.FieldByName('EXISTENCIAS').AsFloat;
        1: ParValue := SPStockAlmacen.FieldByName('STOCK_VIRTUAL').AsFloat;
        else
           ParValue := SPStockAlmacen.FieldByName('EXISTENCIAS').AsFloat;
     end;
  end;

  if ParName = 'Titulo_Moneda' then
     ParValue := DameTituloMoneda(Moneda);

  if ParName = 'FechaValoracion' then
     ParValue := Fecha;

  if (SPStockAlmacen.Active) then
  begin
     if ParName = 'StockTiendaVirtual' then
        ParValue := DMPrestashop.DameStockTienda(DameIDArticulo(SPStockAlmacen.FieldByName('ARTICULO').AsString));
     if ParName = 'Barras' then
        ParValue := DameCodigoBarras(SPStockAlmacen.FieldByName('ARTICULO').AsString);
  end;

  if ParName = 'CalcularLotesNrosSerie' then
     ParValue := CalcularLotesNrosSerie;
end;

procedure TDMRStockAlmacen.frStockAlmacenEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMRStockAlmacen.ActualizarRangoSelec(LCan, LAlm: TStrings; Canal: smallint);
var
  i : integer;
begin
  if (LCan.Count = 0) then
  begin
     Almacen := REntorno.AlmacenDefecto;
     RangoSelec := Format(_('Canal: %s Almacén %s'), [IntToStr(Canal), Almacen]);
  end
  else
  begin
     RangoSelec := '';
     for i := 0 to (LCan.Count - 1) do
     begin
        if (i > 0) then
           RangoSelec := RangoSelec + ', ';
        RangoSelec := RangoSelec + Format(_('Canal: %s Almacén %s'), [LCan[i], LAlm[i]]);
     end;
  end;
end;

procedure TDMRStockAlmacen.frxStockAlmacenBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMRStockAlmacen.frxStockAlmacenGetValue(const VarName: string; var Value: variant);
begin
  frStockAlmacenGetValue(VarName, Value);
end;

procedure TDMRStockAlmacen.SPStockAlmacenBeforeOpen(DataSet: TDataSet);
begin
  // QMCodProv.Open;
end;

procedure TDMRStockAlmacen.SPStockAlmacenBeforeClose(DataSet: TDataSet);
begin
  // QMCodProv.Close;
end;

procedure TDMRStockAlmacen.xModeloAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
end;

procedure TDMRStockAlmacen.xModeloBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
end;

end.
