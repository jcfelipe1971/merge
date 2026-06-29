unit UDMLstTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  FIBTableDataSetRO, frxClass, frxHYReport, frxDBSet;

type
  TDMLstTarifas = class(TDataModule)
     TTarifas: TFIBDataSetRO;
     TDetalleTarifas: TFIBTableSet;
     DSTarifas: TDataSource;
     DSDetalleTarifas: TDataSource;
     frTarifas: TfrHYReport;
     frDBTarifas: TfrDBDataSet;
     frDBDetalleTarifas: TfrDBDataSet;
     frDBDColumnas: TfrDBDataSet;
     frDBFilas: TfrDBDataSet;
     TColumnas: TFIBDataSetRO;
     TArticulos: TFIBDataSetRO;
     DSColumnas: TDataSource;
     DSArticulos: TDataSource;
     QPrecio: THYFIBQuery;
     min_tarifa: THYFIBQuery;
     xTarifa_Desde: TFIBDataSetRO;
     xTarifa_Hasta: TFIBDataSetRO;
     TLocal: THYTransaction;
     DSxTarifa_Desde: TDataSource;
     DSxTarifa_Hasta: TDataSource;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     max_tarifa: THYFIBQuery;
     QMinArticulo: THYFIBQuery;
     QMaxArticulo: THYFIBQuery;
     SPPrecioMasIva: THYFIBQuery;
     DSxMonedas: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxFamilia_Desde: TDataSource;
     xFamilia_Desde: TFIBDataSetRO;
     QMinFamilia: THYFIBQuery;
     QMaxFamilia: THYFIBQuery;
     xAlmacen_Hasta: TFIBDataSetRO;
     DSxAlmacen_Desde: TDataSource;
     DSxAlmacen_Hasta: TDataSource;
     xAlmacen_Desde: TFIBDataSetRO;
     QMinAlmacen: THYFIBQuery;
     QMaxAlmacen: THYFIBQuery;
     DSxFamilia_Hasta: TDataSource;
     xFamilia_Hasta: TFIBDataSetRO;
     xDisponibilidad: TFIBDataSetRO;
     DSxDisponibilidad: TDataSource;
     TTarifasDetallado: TFIBDataSetRO;
     DSTarifasDetallado: TDataSource;
     frDBTarifasDetallado: TfrDBDataSet;
     TTarifasDetalladoEMPRESA: TIntegerField;
     TTarifasDetalladoARTICULO: TFIBStringField;
     TTarifasDetalladoTITULO: TFIBStringField;
     TTarifasDetalladoEXISTENCIAS: TFloatField;
     TTarifasDetalladoP_COSTE: TFloatField;
     TTarifasDetalladoPRECIO_VENTA: TFloatField;
     TTarifasDetalladoTARIFA: TFIBStringField;
     TTarifasDetalladoFAMILIA: TFIBStringField;
     TTarifasDetalladoALMACEN: TFIBStringField;
     DSxTitTarifa: TDataSource;
     xTitTarifa: TFIBDataSetRO;
     DSxTitFamilia: TDataSource;
     xTitFamilia: TFIBDataSetRO;
     xTitTarifaTITULO: TFIBStringField;
     xTitFamiliaTITULO: TFIBStringField;
     DSxTitFamilia2: TDataSource;
     xTitFamilia2: TFIBDataSetRO;
     xTitFamilia2TITULO: TFIBStringField;
     frxTarifas: TfrxHYReport;
     frxDBFilas: TfrxDBDataset;
     TTarifasDetalladoBAJA: TIntegerField;
     procedure frTarifasEnterRect(Memo: TStringList; View: TfrView);
     procedure frTarifasGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstTarifasDestroy(Sender: TObject);
     procedure DMLstTarifasCreate(Sender: TObject);
     procedure TTarifasAfterOpen(DataSet: TDataSet);
     procedure TTarifasDetalladoTARIFAChange(Sender: TField);
     procedure TTarifasDetalladoFAMILIAChange(Sender: TField);
     procedure frxTarifasBeforePrint(Sender: TfrxReportComponent);
     procedure frxTarifasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     SW, Cantidad: integer;
     PrecioSinIva, ImporteIva, PVP: double;
     LocalMascaraN: string;
     procedure RecalcularPreciosIva;
  public
     { Public declarations }
     Art_D, Art_H, Tarifa_D, Tarifa_H, Almacen_D, Almacen_H, Familia_D, Familia_H: string;
     Dispo, OpPaginado: integer;
     ConDis: boolean;
     ArtPrecioCero, OrdenFam: boolean;
     procedure Rangos(var tarifa_d, tarifa_h: string);
     procedure Rangos1(var articulo_d, articulo_h: string);
     procedure RangosFamilia(var familia_d, familia_h: string);
     procedure RangosAlmacenes(var almacen_d, almacen_h: string);
     procedure MuestraListado(tar_ini, tar_fin: string; Orden, Vender, D_IVA, PrecioCero: boolean; Modo: integer; ArticulosBaja: boolean);
     procedure MuestraListadoDetallado(Art_Desde, Art_Hasta, Tarifa_Desde, Tarifa_Hasta, Almacen_Desde, Almacen_Hasta, Familia_Desde, Familia_Hasta, Disponibilidad: string; ConDisponibilidad: boolean; Ordenado, modo: byte; ArticulosBaja: boolean);
     procedure MuestraColumnas(art_ini, art_fin, tar_ini, tar_fin, Fam_ini, Fam_fin: string; Cant, Modo: integer; ArticulosBaja, OrderPorTitulo: boolean);
     procedure MostrarFiltrado(Modo, SWFil: integer);
     procedure MostrarListadoFiltrado(Art_Desde: string; Art_Hasta: string; Orden, Vender: boolean; modo, SWFil: integer; ArticulosBaja: boolean);
     procedure ConstruirSelect(SqlFiltro: TStringList);
     procedure ActualizaDis(Dis: string);
     // procedure ListadoTarifasDesgloseIVA(TarIni,TarFin:string;Orden:Boolean;Modo:integer);
  end;

var
  DMLstTarifas : TDMLstTarifas;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles;

{$R *.DFM}

procedure TDMLstTarifas.DMLstTarifasCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  LocalMascaraN := MascaraN;
end;

procedure TDMLstTarifas.DMLstTarifasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstTarifas.ActualizaDis(Dis: string);
begin
  with xDisponibilidad do
  begin
     Close;
     Params.ByName['DISPONIBILIDAD'].AsInteger := StrToInt(dis);
     Open;
  end;
end;

// Listado de Precios por Tarifa detallado
procedure TDMLstTarifas.MuestraListadoDetallado(Art_Desde, Art_Hasta, Tarifa_Desde, Tarifa_Hasta, Almacen_Desde, Almacen_Hasta, Familia_Desde, Familia_Hasta, Disponibilidad: string; ConDisponibilidad: boolean; Ordenado, modo: byte; ArticulosBaja: boolean);
var
  Archivo : string;
  //Ubicacion : string;
begin
  Art_D := Art_Desde;
  Art_H := Art_Hasta;
  Tarifa_D := Tarifa_Desde;
  Tarifa_H := Tarifa_Hasta;
  Almacen_D := Almacen_Desde;
  Almacen_H := Almacen_Hasta;
  Familia_D := Familia_Desde;
  FAmilia_H := FAmilia_Hasta;
  Dispo := StrToInt(Disponibilidad);
  ConDis := ConDisponibilidad;

  with TTarifasDetallado do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM LST_PRECIO_TARIFA_DET(:EMPRESA, :EJERCICIO, :CANAL, ');
     SelectSQL.Add(' :TARIFA_DESDE, :TARIFA_HASTA, ');
     SelectSQL.Add(' :FAMILIA_DESDE, :FAMILIA_HASTA, ');
     SelectSQL.Add(' :ARTICULO_DESDE, :ARTICULO_HASTA, ');
     SelectSQL.Add(' :ALMACEN_DESDE, :ALMACEN_HASTA, :DISPONIBILIDAD) ');
     SelectSQL.Add(' WHERE  ');
     SelectSQL.Add(' EMPRESA = :EMPRESA ');
     if (not ArtPrecioCero) then
        SelectSQL.Add(' AND PRECIO_VENTA <> 0 ');
     if (not ArticulosBaja) then
        SelectSQL.Add(' AND BAJA = 0 ');
     if (Ordenado = 0) then
        SelectSQL.Add(' ORDER BY TARIFA, FAMILIA, ARTICULO ')
     else
        SelectSQL.Add(' ORDER BY TARIFA, FAMILIA, TITULO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO_DESDE'].AsString := Art_Desde;
     Params.ByName['ARTICULO_HASTA'].AsString := Art_Hasta;
     Params.ByName['TARIFA_DESDE'].AsString := Tarifa_Desde;
     Params.ByName['TARIFA_HASTA'].AsString := Tarifa_Hasta;
     Params.ByName['ALMACEN_DESDE'].AsString := Almacen_Desde;
     Params.ByName['ALMACEN_HASTA'].AsString := Almacen_Hasta;
     Params.ByName['FAMILIA_DESDE'].AsString := Familia_Desde;
     Params.ByName['FAMILIA_HASTA'].AsString := Familia_Hasta;
     Params.ByName['DISPONIBILIDAD'].AsString := Disponibilidad;
     Open;
  end;

  if (Modo = 2) then
  begin
     Archivo := Format(_('LstTarifaDetallado-%s'), [FormatDateTime('yyyymmdd_hhnnss', Now)]);
     if not MySaveDialog(Archivo, 'ODS,XLS,ALL', '', 'DMLstTarifas') then
        ExportarExcel(Archivo, DSTarifasDetallado);
  end
  else
     DMListados.Imprimir(149, 0, Modo, '', '', frTarifas, frxTarifas, nil, nil);
end;

// Listado de Tarifas detalladas
procedure TDMLstTarifas.MuestraListado(tar_ini, tar_fin: string; Orden, Vender, D_IVA, PrecioCero: boolean; Modo: integer; ArticulosBaja: boolean);
var
  Grupo : integer;
begin
  SW := 1;
  DMListados.Normalizar_Desde_Hasta(tar_ini, tar_fin);

  with TDetalleTarifas do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT TAR.EMPRESA, TAR.TARIFA, ART.ARTICULO, ART.TITULO_LARGO AS TITULO, ART.FAMILIA, TAR.UNID_MINIMAS, ');
     SelectSQL.Add('                 TAR.UNID_MAXIMAS, TAR.PRECIO_VENTA, ART.P_COSTE, ART.BAJA ');
     if not Vender then  // Opción de ver artículos según su disponibilidad para vender
        SelectSQL.Add(' , GART.DISPONIBILIDAD ');
     SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS TAR ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON ART.EMPRESA = TAR.EMPRESA AND ART.ARTICULO = TAR.ARTICULO ');
     if not Vender then  // Opción de ver artículos según su disponibilidad para vender
        SelectSQL.Add(' JOIN CON_CUENTAS_GES_ART GART ON ART.EMPRESA = GART.EMPRESA AND ART.ARTICULO = GART.ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TAR.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' TAR.TARIFA = :TARIFA AND ');
     SelectSQL.Add(' ART.FAMILIA <> :FAMILIA ');
     if not Vender then  // Opción de ver artículos según su disponibilidad para vender
     begin
        SelectSQL.Add(' AND ((GART.DISPONIBILIDAD = 1) OR (GART.DISPONIBILIDAD = 2)) ');
        SelectSQL.Add(' AND GART.EJERCICIO = :EJERCICIO ');
        SelectSQL.Add(' AND GART.CANAL = :CANAL ');
     end;
     if not PrecioCero then
        SelectSQL.Add(' AND TAR.PRECIO_VENTA <> 0 ');
     if not ArticulosBaja then
        SelectSQL.Add(' AND ART.BAJA = 0 ');
     if Orden then
        SelectSQL.Add(' ORDER BY ART.TITULO_LARGO ')
     else
        SelectSQL.Add(' ORDER BY ART.ARTICULO ');

     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     if not Vender then
     begin
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     end;
  end;

  with TTarifas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TAR_INI'].AsString := tar_ini;
     Params.ByName['TAR_FIN'].AsString := tar_fin;
     Open;
  end;

  if D_IVA then
     Grupo := 90
  else
     Grupo := 53;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frTarifas, frxTarifas, nil, nil);
end;

// Listado de Artículos por Tarifa
procedure TDMLstTarifas.MostrarListadoFiltrado(Art_Desde: string; Art_Hasta: string; Orden, Vender: boolean; Modo, SWFil: integer; ArticulosBaja: boolean);
begin
  with TTarifas do
  begin
     Close;
     Open;
     if (SWFil = 0) then
        DMMain.FiltraRO(TTarifas, '10000', True);
  end;

  with TDetalleTarifas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT TAR.EMPRESA, TAR.TARIFA, ART.ARTICULO, ART.TITULO_LARGO AS TITULO, ART.FAMILIA, ');
     SelectSQL.Add(' TAR.UNID_MINIMAS, TAR.UNID_MAXIMAS, TAR.PRECIO_VENTA, ART.P_COSTE, ART.BAJA ');
     if not Vender then  // Opción de ver artículos según su disponibilidad para vender
        SelectSQL.Add(' , GART.DISPONIBILIDAD ');
     SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS TAR ');
     SelectSQL.Add(' JOIN ART_ARTICULOS ART ON ART.EMPRESA = TAR.EMPRESA AND ART.ARTICULO = TAR.ARTICULO ');
     if not Vender then  // Opción de ver artículos según su disponibilidad para vender
        SelectSQL.Add(' JOIN CON_CUENTAS_GES_ART GART ON ART.EMPRESA = GART.EMPRESA AND ART.ARTICULO = GART.ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TAR.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' TAR.TARIFA = :TARIFA AND ');
     SelectSQL.Add(' ART.FAMILIA <> :FAMILIA ');
     if not Vender then  // Opción de ver artículos según su disponibilidad para vender
     begin
        SelectSQL.Add(' AND ((GART.DISPONIBILIDAD = 1) OR (GART.DISPONIBILIDAD = 2)) ');
        SelectSQL.Add(' AND GART.EJERCICIO = :EJERCICIO ');
        SelectSQL.Add(' AND GART.CANAL = :CANAL ');
     end;
     SelectSQL.Add(' AND ART.ARTICULO >= :ART_DESDE ');
     SelectSQL.Add(' AND ART.ARTICULO <= :ART_HASTA ');
     if not ArticulosBaja then
        SelectSQL.Add(' AND ART.BAJA = 0 ');
     if Orden then
        SelectSQL.Add(' ORDER BY ART.TITULO_LARGO ')
     else
        SelectSQL.Add(' ORDER BY ART.ARTICULO ');

     Params.ByName['ART_DESDE'].AsString := Art_Desde;
     Params.ByName['ART_HASTA'].AsString := Art_Hasta;
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     if not Vender then
     begin
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     end;
     Open;
  end;

  SW := 1;
  DMListados.Imprimir(52, 0, Modo, '', '', frTarifas, frxTarifas, nil, nil);
end;

procedure TDMLstTarifas.MuestraColumnas(art_ini, art_fin, tar_ini, tar_fin, fam_ini, fam_fin: string; Cant, Modo: integer; ArticulosBaja, OrderPorTitulo: boolean);
var
  Grupo : integer;
begin
  Cantidad := Cant;

  with TColumnas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TAR_INI'].AsString := tar_ini;
     Params.ByName['TAR_FIN'].AsString := tar_fin;
     Open;
  end;

  DMListados.Normalizar_Desde_Hasta(art_ini, art_fin);

  with TArticulos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ART.ARTICULO, ART.TITULO_LARGO AS TITULO, ART.P_COSTE, ART.FAMILIA, ART.BAJA ');
     SelectSQL.Add(' FROM ART_ARTICULOS ART ');
     SelectSQL.Add(' JOIN CON_CUENTAS_GES_ART GART ON ART.ID_A = GART.ID_A ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ART.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' GART.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' GART.CANAL = :CANAL AND ');
     SelectSQL.Add(' ART.ARTICULO >= :ART_INI AND ');
     SelectSQL.Add(' ART.ARTICULO <= :ART_FIN AND ');
     SelectSQL.Add(' ART.FAMILIA >= :FAM_INI AND ');
     SelectSQL.Add(' ART.FAMILIA <= :FAM_FIN AND ');
     SelectSQL.Add(' ART.FAMILIA <> :FAMILIA ');

     if not ArticulosBaja then
        SelectSQL.Add(' AND ART.BAJA = 0 ');

     SelectSQL.Add(' ORDER BY ');
     if OrdenFam then
     begin
        SelectSQL.Add(' ART.FAMILIA ');
        if OrderPorTitulo then
           SelectSQL.Add(' , ART.TITULO_LARGO ')
        else
           SelectSQL.Add(' , ART.ARTICULO ');
     end
     else
     begin
        if OrderPorTitulo then
           SelectSQL.Add(' ART.TITULO_LARGO ')
        else
           SelectSQL.Add(' ART.ARTICULO ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ART_INI'].AsString := art_ini;
     Params.ByName['ART_FIN'].AsString := art_fin;
     Params.ByName['FAM_INI'].AsString := fam_ini;
     Params.ByName['FAM_FIN'].AsString := fam_fin;
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     Open;
  end;

  if OrdenFam then
     Grupo := 150
  else
     Grupo := 54;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frTarifas, frxTarifas, nil, nil);
end;

procedure TDMLstTarifas.frTarifasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if ((ConDis = False) and (Memo[0] = '[Disponibilidad]')) then
        View.Visible := False;
     if ((Memo[0] = '[PagT]') and ((OpPaginado = 1) or (OpPaginado = 2))) then
        View.Parent.NewPageAfter := True;
     if ((Memo[0] = '[PagF]') and (OpPaginado = 2)) then
        View.Parent.NewPageAfter := True;
  end;
end;

procedure TDMLstTarifas.frTarifasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'PagT' then
     ParValue := '';
  if ParName = 'PagF' then
     ParValue := '';
  if ParName = 'Almacen_Desde' then
     ParValue := almacen_d;
  if ParName = 'Almacen_Hasta' then
     if (almacen_d = almacen_h) then
        ParValue := ''
     else
        ParValue := almacen_h;
  if ParName = 'AlmacenDTxt' then
     ParValue := xAlmacen_Desde.FieldByName('TITULO').AsString;
  if ParName = 'AlmacenHTxt' then
     if (almacen_d = almacen_h) then
        ParValue := ''
     else
        ParValue := xAlmacen_Hasta.FieldByName('TITULO').AsString;

  if ParName = 'Articulo_Desde' then
     ParValue := art_d;
  if ParName = 'Articulo_Hasta' then
     if (art_d = art_h) then
        ParValue := ''
     else
        ParValue := art_h;
  if ParName = 'ArticuloDTxt' then
     ParValue := xArt_Desde.FieldByName('TITULO').AsString;
  if ParName = 'ArticuloHTxt' then
     if (art_d = art_h) then
        ParValue := ''
     else
        ParValue := xArt_Hasta.FieldByName('TITULO').AsString;

  if ParName = 'Tarifa_Desde' then
     ParValue := Tarifa_D;
  if ParName = 'Tarifa_Hasta' then
     if (Tarifa_D = Tarifa_H) then
        ParValue := ''
     else
        ParValue := Tarifa_H;
  if ParName = 'TarifaDTxt' then
     ParValue := xTarifa_Desde.FieldByName('TITULO').AsString;
  if ParName = 'TarifaHTxt' then
     if (Tarifa_D = Tarifa_H) then
        ParValue := ''
     else
        ParValue := xTarifa_Hasta.FieldByName('TITULO').AsString;

  if ParName = 'Familia_Desde' then
     ParValue := Familia_D;
  if ParName = 'Familia_Hasta' then
     if (Familia_D = Familia_H) then
        ParValue := ''
     else
        ParValue := Familia_H;
  if ParName = 'FamiliaDTxt' then
     ParValue := xFamilia_Desde.FieldByName('TITULO').AsString;
  if ParName = 'FamiliaHTxt' then
     if (Familia_D = Familia_H) then
        ParValue := ''
     else
        ParValue := xFamilia_Hasta.FieldByName('TITULO').AsString;

  if ParName = 'Disponibilidad' then
     ParValue := Dispo;
  if ParName = 'DisponibilidadTxt' then
     ParValue :=
        xDisponibilidad.FieldByName('TITULO').AsString;

  if ParName = 'celda' then
  begin
     with QPrecio do
     begin
        Params.ByName['EMPRESA'].AsInteger := TColumnas.FieldByName('EMPRESA').AsInteger;
        Params.ByName['ARTICULO'].AsString :=
           TArticulos.FieldByName('ARTICULO').AsString;
        Params.ByName['TARIFA'].AsString := TColumnas.FieldByName('TARIFA').AsString;
        Params.ByName['CANTIDAD'].AsInteger := Cantidad;
        ExecQuery;
        if HayDatos then
           ParValue := FormatFloat(DMMain.MascaraMoneda(TColumnas.FieldByName('MONEDA').AsString, 0),
              FieldByName['PRECIO_VENTA'].AsFloat)
        else
           ParValue := 'No Tiene';
        FreeHandle;
     end;
  end;

  if ParName = 'PrecioSinIva' then
  begin
     RecalcularPreciosIva;
     ParValue := PrecioSinIva;
  end;

  if ParName = 'ImporteIva' then
     ParValue := ImporteIVA;
  if ParName = 'PVP' then
     ParValue := PVP;

  if ParName = 'ActualizaMascara' then
     LocalMascaraN := DMMain.MascaraMoneda(TTarifas.FieldByName('MONEDA').AsString, 1);

  if ParName = 'Unid_Maximas' then
  begin
     if (TDetalleTarifas.FieldByName('UNID_MAXIMAS').AsFloat = 1999999999) then
        ParValue := '--------------'
     else
        ParValue := FormatFloat(MascaraI, TDetalleTarifas.FieldByName('UNID_MAXIMAS').AsFloat);
  end;

  if ParName = 'Titulo_Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := TTarifas.FieldByName('MONEDA').AsString;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

  if ParName = 'Titulo_Moneda_Cruzado' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := TColumnas.FieldByName('MONEDA').AsString;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;
  if ParName = 'Titulo_Familia' then
     with xtitFamilia2 do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FAMILIA'].AsString := TArticulos.FieldByName('FAMILIA').AsString;
        Open;
        ParValue := xtitFamilia2.FieldByName('TITULO').AsString;
     end;
end;

procedure TDMLstTarifas.Rangos(var tarifa_d, tarifa_h: string);
begin
  with min_tarifa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Tarifa_D := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with max_tarifa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Tarifa_H := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLstTarifas.Rangos1(var articulo_d, articulo_h: string);
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     articulo_d := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     articulo_h := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLstTarifas.RangosFamilia(var familia_d, familia_h: string);
begin
  with QMinFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAM_SISTEMA'].AsString := REntorno.FamSistema;
     ExecQuery;
     familia_d := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAM_SISTEMA'].AsString := REntorno.FamSistema;
     ExecQuery;
     familia_h := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLstTarifas.RangosAlmacenes(var almacen_d, almacen_h: string);
begin
  with QMinAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Almacen_d := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Almacen_h := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLstTarifas.MostrarFiltrado(Modo, SWFil: integer);
//var
//CR : string;
begin
  with TDetalleTarifas do
  begin
     Close;
  end;

  SW := 1;

  TTarifas.Close;
  TTarifas.Open;

  if (SWFil = 0) then
     DMMain.FiltraRO(TTarifas, '10000', True);

  DMListados.Imprimir(53, 0, Modo, '', '', frTarifas, frxTarifas, nil, nil);
end;

procedure TDMLstTarifas.TTarifasAfterOpen(DataSet: TDataSet);
begin
  with TDetalleTarifas do
  begin
     Close;
     Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
     Open;
  end;
end;

procedure TDMLstTarifas.ConstruirSelect(SqlFiltro: TStringList);
{var
  Orden : String  ;}
begin
  // Sustitución del select para el listado de artículos por tarifas filtradas

  // Para obtener las tarifas filtradas en el formulario principal
  with TTarifas do
  begin
     Close;
     SelectSQL.Assign(SqlFiltro);
  end;

  // Introducimos el filtro por artículos
  {  with TDetalleTarifas do
    begin
      Orden := OrdenadoPor;
      Ordenar('');
      Close;
      SelectSQL.Text := SelectSQL.Text + //Filtro por artículos
        ' AND ARTICULO>=?ART_DESDE AND ARTICULO<=?ART_HASTA';
      Ordenar(Orden);
    end;}
end;

// Listado de Tarifas con IVA desglosado
{procedure TDMLstTarifas.ListadoTarifasDesgloseIVA(TarIni,TarFin:string;Orden,Vender:Boolean;Modo:integer);
var
  CR, str, str2, str3, str4 : string ;
begin
  SW := 1;
  DMListados.Normalizar_Desde_Hasta(TarIni,TarFin);

  with TDetalleTarifas do
    begin
      Close;
      if Orden then str:='art.titulo'
               else str:='art.articulo';
      if Vender  // Opción de ver artículos según su disponibilidad para vender
        then begin
          str2:='';
          str3:='';
          str4:=''
        end
        else begin
          str2:=',gart.disponibilidad ';
          str3:='join con_cuentas_ges_art gart on(art.empresa=gart.empresa and art.articulo=gart.articulo) ';
          str4:='and (gart.disponibilidad = 1 or gart.disponibilidad = 2) '
        end;

      SelectSQL.Text:='SELECT tar.empresa, tar.tarifa, art.articulo, art.titulo, art.familia, '+
                      'tar.unid_minimas, tar.unid_maximas, tar.precio_venta '+
                      'FROM ART_TARIFAS_PRECIOS tar join art_articulos art '+
                      'on art.empresa=tar.empresa and art.articulo=tar.articulo '+
                      'where tar.empresa=?empresa and tar.tarifa=?Tarifa '+
                      'and art.familia<>?familia order by ' + str;
    end;

  with TTarifas do
    begin
      Close;
      Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
      Params.ByName['TAR_INI'].AsString  := TarIni;
      Params.ByName['TAR_FIN'].AsString  := TarFin;
      Open ;
    end;

  //QEmpresa.DataSource := DSTarifas ;
  QEmpresa.Open ;  // ?

  with frTarifas do
    begin
      DMListados.Cargar(90,'');
      LoadFromFIB(REntorno.Formato,CR);
      PrepareReport ;
      case Modo of
        0 : ShowPreparedReport ;
        1 : PrintPreparedReport('', REntorno.Copias);
      end ;
      DMListados.LimpiaEntorno;
    end ;
end ;}

procedure TDMLstTarifas.RecalcularPreciosIva;
begin
  with SPPrecioMasIva do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := TDetalleTarifas.FieldByName('ARTICULO').AsString;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['MONEDA'].AsString := TTarifas.FieldByName('MONEDA').AsString;
     Params.ByName['PRECIO'].AsFloat := TDetalleTarifas.FieldByName('PRECIO_VENTA').AsFloat;
     Params.ByName['IVA_INCLUIDO'].AsInteger :=
        TTarifas.FieldByName('IVA_INCLUIDO').AsInteger;
     ExecQuery;
     PrecioSinIva := FieldByName['PRECIO_SIN_IVA'].AsFloat;
     ImporteIva := FieldByName['IMPORTE_IVA'].AsFloat;
     PVP := PrecioSinIva + ImporteIva;
     FreeHandle;
  end;
end;

procedure TDMLstTarifas.TTarifasDetalladoTARIFAChange(Sender: TField);
begin
  with xTitTarifa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMLstTarifas.TTarifasDetalladoFAMILIAChange(Sender: TField);
begin
  with xTitFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMLstTarifas.frxTarifasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
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
           if ((ConDis = False) and (Pos('[Disponibilidad]', Memo[0]) > 0)) then
           begin
              Visible := False;
           end;
           if ((Pos('[PagT]', Memo[0]) > 0) and ((OpPaginado = 1) or (OpPaginado = 2))) then
              (Parent as TfrxGroupHeader).StartNewPage := True;
           if ((Pos('[PagF]', Memo[0]) > 0) and ((OpPaginado = 2))) then
              (Parent as TfrxGroupHeader).StartNewPage := True;
        end;
end;

procedure TDMLstTarifas.frxTarifasGetValue(const VarName: string; var Value: variant);
begin
  frTarifasGetValue(VarName, Value);
end;

end.
