unit UDMLstLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  Messages, FIBQuery, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  UFormGest, Controls, Dialogs, Graphics, Forms, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO, frxClass, frxHYReport;

type
  TDMLstLotes = class(TDataModule)
     TLocal: THYTransaction;
     DSxMovimientosLote: TDataSource;
     frLotes: TfrHYReport;
     frDBxMovimientosLote: TfrDBDataSet;
     FREti1Col: TfrUserDataset;
     FREti2Col: TfrUserDataset;
     FREti3Col: TfrUserDataset;
     frxLotes: TfrxHYReport;
     FRxEti1Col: TfrxUserDataSet;
     FRxEti2Col: TfrxUserDataSet;
     FRxEti3Col: TfrxUserDataSet;
     TUpdate: THYTransaction;
     xMovimientosLote: TFIBDataSetRO;
     DSQMSof_ARticulosLotes: TDataSource;
     xStockLotes: TFIBDataSetRO;
     frDBSofArtLotes: TfrDBDataSet;
     DSxLote: TDataSource;
     xLote: TFIBDataSetRO;
     frDBxLote: TfrDBDataSet;
     xArticuloIdioma: TFIBDataSetRO;
     DSDSxArticuloIdioma: TDataSource;
     QMPastada: TFIBDataSetRO;
     DSPastada: TDataSource;
     frDBPastada: TfrDBDataSet;
     procedure frLotesGetValue(const ParName: string; var ParValue: variant);
     procedure frLotesEnterRect(Memo: TStringList; View: TfrView);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frxLotesBeforePrint(Sender: TfrxReportComponent);
     procedure frxLotesGetValue(const VarName: string; var Value: variant);
     procedure xMovimientosLoteAfterOpen(DataSet: TDataSet);
     procedure xLoteAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
     IdLote: integer;
     AlmacenX, AgrupacionX, FamiliaX, ArticuloX, LoteX, FFabricacionx, FEnvasadoX, FCaducidadX, CompraX, VentaX, SW, NumEtiquetas: integer;
     LoteDesde, LoteHasta, AlmacenDesde, AlmacenHasta, FamD, FamH, AgrD, AgrH, ArticuloDesde, ArticuloHasta, Serie, Clasificacion, Descripcion, Idioma: string;
     FFabricacionDesde, FFabricacionHasta, FEnvasadoDesde, FEnvasadoHasta, FCaducidadDesde, FCaducidadHasta, CompD, CompH, VentD, VentH: TDateTime;
     Sufijo: string;
     procedure GeneraSentencia(TipoDoc: char; s: TStrings);
  public
     { Public declarations }
     Filtro: string[11];
     Orden: string[6];
     TipoDoc: char;
     procedure Recargar(var MinLote, MaxLote, MinAlmacen, MaxAlmacen, MinFam, MaxFam, MinAgr, MaxAgr, MinArt, MaxArt: string);
     procedure MostrarListado(aLoteDesde, aLoteHasta, aAlmacenDesde, aAlmacenHasta, aFamDesde, aFamHasta, aAgruDesde, aAgruHasta, aArtDesde, aArtHasta: string; aFabricacionD, aFabricacionH, aEnvasadoD, aEnvasadoH, aCaducidadD, aCaducidadH, aCompraD, aCompraH, aVentaD, aVentaH: TDateTime; Modo: integer);
     function DameTitulo(Tipo: string): string;
     procedure LanzaEtiquetas(Grupo, aNumEtiquetas, aIdLote, Modo: integer; aArticulo, aDescripcion, aSerie, aClasificacion, aIdioma: string; aFFabricacion, aFCaducidad, aFEnvasado: TDateTime; Pastadas, PastadasCantEtiq: integer; aSufijo: string);
     procedure InfoPastadas(Articulo: string; var Pastadas, PastadasCantEtiq: integer);
  end;

var
  DMLstLotes : TDMLstLotes;

implementation

uses UDMMain, UDMListados, UUtiles, UEntorno, UDameDato;

{$R *.dfm}

procedure TDMLstLotes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  // Inicializacion de variable
  Idioma := REntorno.IdiomaCanal;
end;

procedure TDMLstLotes.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstLotes.Recargar(var MinLote, MaxLote, MinAlmacen, MaxAlmacen, MinFam, MaxFam, MinAgr, MaxAgr, MinArt, MaxArt: string);
begin
  // Lotes
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(LOTE), MAX(LOTE) FROM ART_ARTICULOS_LOTES WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        MinLote := FieldByName['MIN'].AsString;
        MaxLote := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DameMinMax('ALM', MinAlmacen, MaxAlmacen);
  DameMinMax('FAM', MinFam, MaxFam);
  DameMinMax('AGA', MinAgr, MaxAgr);
  DameMinMax('ART', MinArt, MaxArt);
end;

procedure TDMLstLotes.MostrarListado(aLoteDesde, aLoteHasta, aAlmacenDesde, aAlmacenHasta, aFamDesde, aFamHasta, aAgruDesde, aAgruHasta, aArtDesde, aArtHasta: string; aFabricacionD, aFabricacionH, aEnvasadoD, aEnvasadoH, aCaducidadD, aCaducidadH, aCompraD, aCompraH, aVentaD, aVentaH: TDateTime; Modo: integer);
var
  Grupo : integer;
begin
  SW := 1;
  // Normalizar parámetros Desde-Hasta
  DMListados.Normalizar_Desde_Hasta(aLoteDesde, aLoteHasta);
  DMListados.Normalizar_Desde_Hasta(aAlmacenDesde, aAlmacenHasta);
  DMListados.Normalizar_Desde_Hasta(aFamDesde, aFamHasta);
  DMListados.Normalizar_Desde_Hasta(aAgruDesde, aAgruHasta);
  DMListados.Normalizar_Desde_Hasta(aArtDesde, aArtHasta);

  DMListados.Normalizar_Desde_Hasta(aFabricacionD, aFabricacionH);
  aFabricacionD := HourIntoDate(aFabricacionD, '00:00:00');
  aFabricacionH := HourIntoDate(aFabricacionH, '23:59:59');

  DMListados.Normalizar_Desde_Hasta(aEnvasadoD, aEnvasadoH);
  aEnvasadoD := HourIntoDate(aEnvasadoD, '00:00:00');
  aEnvasadoH := HourIntoDate(aEnvasadoH, '23:59:59');

  DMListados.Normalizar_Desde_Hasta(aCaducidadD, aCaducidadH);
  aCaducidadD := HourIntoDate(aCaducidadD, '00:00:00');
  aCaducidadH := HourIntoDate(aCaducidadH, '23:59:59');

  DMListados.Normalizar_Desde_Hasta(aCompraD, aCompraH);
  aCompraD := HourIntoDate(aCompraD, '00:00:00');
  aCompraH := HourIntoDate(aCompraH, '23:59:59');

  DMListados.Normalizar_Desde_Hasta(aVentaD, aVentaH);
  aVentaD := HourIntoDate(aVentaD, '00:00:00');
  aVentaH := HourIntoDate(aVentaH, '23:59:59');

  // Asignar variables del Listado
  LoteDesde := aLoteDesde;
  LoteHasta := aLoteHasta;
  AlmacenDesde := aAlmacenDesde;
  AlmacenHasta := aAlmacenHasta;
  FamD := aFamDesde;
  FamH := aFamHasta;
  AgrD := aAgruDesde;
  AgrH := aAgruHasta;
  ArticuloDesde := aArtDesde;
  ArticuloHasta := aArtHasta;
  FFabricacionDesde := aFabricacionD;
  FFabricacionHasta := aFabricacionH;
  FEnvasadoDesde := aEnvasadoD;
  FEnvasadoHasta := aEnvasadoH;
  FCaducidadDesde := aCaducidadD;
  FCaducidadHasta := aCaducidadH;
  CompD := aCompraD;
  CompH := aCompraH;
  VentD := aVentaD;
  VentH := aVentaH;

  Lotex := StrToInt(Filtro[1]);
  Almacenx := StrToInt(Filtro[2]);
  Familiax := StrToInt(Filtro[3]);
  Agrupacionx := StrToInt(Filtro[4]);
  Articulox := StrToInt(Filtro[5]);
  FFabricacionx := StrToInt(Filtro[6]);
  FEnvasadoX := StrToInt(Filtro[7]);
  FCaducidadx := StrToInt(Filtro[8]);
  Comprax := StrToInt(Filtro[9]);
  Ventax := StrToInt(Filtro[10]);

  with xMovimientosLote do
  begin
     Close;
     GeneraSentencia(TipoDoc, SelectSQL);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['LOTEX'].AsInteger := LoteX;
     Params.ByName['ALMACENX'].AsInteger := Almacenx;
     Params.ByName['FAMILIAX'].AsInteger := Familiax;
     Params.ByName['AGRUPACIONX'].AsInteger := Agrupacionx;
     Params.ByName['ARTICULOX'].AsInteger := Articulox;
     Params.ByName['FABRICACIONX'].AsInteger := FFabricacionx;
     Params.ByName['ENVASADOX'].AsInteger := FEnvasadoX;
     Params.ByName['CADUCIDADX'].AsInteger := FCaducidadx;
     Params.ByName['LOTED'].AsString := LoteDesde;
     Params.ByName['LOTEH'].AsString := LoteHasta;
     Params.ByName['ALMD'].AsString := AlmacenDesde;
     Params.ByName['FAMD'].AsString := FamD;
     Params.ByName['FAMH'].AsString := FamH;
     Params.ByName['AGRD'].AsString := AgrD;
     Params.ByName['AGRH'].AsString := AgrH;
     Params.ByName['ARTD'].AsString := ArticuloDesde;
     Params.ByName['ARTH'].AsString := ArticuloHasta;
     Params.ByName['FABRICADOD'].AsDateTime := FFabricacionDesde;
     Params.ByName['FABRICADOH'].AsDateTime := FFabricacionHasta;
     Params.ByName['ENVASADOD'].AsDateTime := FEnvasadoDesde;
     Params.ByName['ENVASADOH'].AsDateTime := FEnvasadoHasta;
     Params.ByName['CADUCIDADD'].AsDateTime := FCaducidadDesde;
     Params.ByName['CADUCIDADH'].AsDateTime := FCaducidadHasta;
     if (TipoDoc <> 'I') then
     begin
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['COMPRAX'].AsInteger := Comprax;
        Params.ByName['VENTAX'].AsInteger := Ventax;
        Params.ByName['FCOMPRAD'].AsDateTime := CompD;
        Params.ByName['FCOMPRAH'].AsDateTime := CompH;
        Params.ByName['FVENTAD'].AsDateTime := VentD;
        Params.ByName['FVENTAH'].AsDateTime := VentH;
        Params.ByName['ALMH'].AsString := AlmacenHasta;
     end;
     Open;
  end;

  Grupo := 0;
  if (TipoDoc = 'I') then
     Grupo := 121;
  if (TipoDoc = 'C') then
     Grupo := 122;
  if (TipoDoc = 'V') then
     Grupo := 123;
  if (TipoDoc = 'M') then
     Grupo := 125;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frLotes, frxLotes, nil);
end;

procedure TDMLstLotes.GeneraSentencia(TipoDoc: char; s: TStrings);
var
  Modo : byte;
  Separador : string;
begin
  // TipoDoc = 'M' - Modo 0 - Movimientos
  // TipoDoc = 'C' - Modo 1 - Compras / Entradas
  // TipoDoc = 'V' - Modo 2 - Ventas / Salidas
  // TipoDoc = 'I' - Modo 3 - Inventario

  Modo := 0;
  case TipoDoc of
     'M': Modo := 0;
     'C': Modo := 1;
     'V': Modo := 2;
     'I': Modo := 3;
  end;

  with s do
  begin
     Clear;
     if (Modo < 3) then
     begin
        Add(' SELECT * FROM LST_LOTES_MOVIMIENTOS( ');
        Add(' :EMPRESA, :EJERCICIO, :CANAL, ');
        Add(' :ALMD, :ALMH, :AGRD, :AGRH, ');
        Add(' :FAMD, :FAMH, :ARTD, :ARTH, ');
        Add(' :LOTED, :LOTEH, :FABRICADOD, :FABRICADOH, ');
        Add(' :ENVASADOD, :ENVASADOH, :CADUCIDADD, :CADUCIDADH, ');
        Add(' :FCOMPRAD, :FCOMPRAH, :FVENTAD, :FVENTAH, ');
        Add(' :ALMACENX, :AGRUPACIONX, :FAMILIAX, :ARTICULOX, :LOTEX, ');
        Add(' :FABRICACIONX, :ENVASADOX, :CADUCIDADX, :COMPRAX, ');
        Add(' :VENTAX,' + IntToStr(Modo) + ') ');
        if (Modo = 0) then
        begin
           if (Orden[5] = '1') then
              Add(' ORDER BY FECHAC ')
           else
           if (Orden[6] = '1') then
              Add(' ORDER BY FECHAV ');
        end
        else
        begin
           // Ordenación de los resultados
           if (Orden <> '000000') then
           begin
              Add(' ORDER BY ');
              Separador := '';
              if (Orden[1] = '1') then
              begin
                 Add(Separador + ' FAMILIA ');
                 Separador := ', ';
              end;
              // Si ordeno por articulo o solo por familia, ordeno tambien por articulo
              if ((Orden[2] = '1') or (Orden = '100000')) then
              begin
                 Add(Separador + ' ARTICULO ');
                 Separador := ', ';
              end;
              if (Orden[3] = '1') then
              begin
                 Add(Separador + ' LOTE ');
                 Separador := ', ';
              end;
              if (Orden[5] = '1') then
              begin
                 Add(Separador + ' FECHAC ');
                 Separador := ', ';
              end;
              if (Orden[6] = '1') then
              begin
                 Add(Separador + ' FECHAV ');
                 Separador := ', ';
              end;
           end
           else
              Add(' ORDER BY ARTICULO, LOTE ');
        end;
     end
     else
     begin
        Add(' SELECT * ');
        Add(' FROM SOF_ARTICULOS_LOTES_RECORRE(:EMPRESA, :ALMD) AL ');
        Add(' LEFT JOIN ART_ARTICULOS AR ');
        Add(' ON (AL.ID_A = AR.ID_A) ');

        // if (Filtro[4] = '1') then
        //     Add(' LEFT JOIN EMP_AGRUPACIONES_ART AG ON (AL.ID_A = AG.ID_A) ');

        Add(' WHERE ');
        Add(' AL.EMPRESA = :EMPRESA ');
        Add(' AND AL.CANAL = :CANAL ');
        Add(' AND (AL.ID_A IN(SELECT ID_A FROM EMP_AGRUPACIONES_ART WHERE EMPRESA=:EMPRESA AND AGRUPACION >= :AGRD AND AGRUPACION <= :AGRH AND :AGRUPACIONX = 1) OR (:AGRUPACIONX = 0)) ');

        // Condiciones...
        // if (Filtro[1]='1') then
        Add(' AND ((((AL.LOTE >= :LOTED) AND (AL.LOTE <= :LOTEH)) AND (:LOTEX = 1)) OR (:LOTEX = 0)) ');
        // if (Filtro[2]='1') then
        Add(' AND (((AL.ALMACEN=:ALMD) AND (:ALMACENX=1)) OR (:ALMACENX=0)) ');
        // if (Filtro[3]='1') then
        Add(' AND ((((AR.FAMILIA <= :FAMH) AND (AR.FAMILIA >= :FAMD)) AND (:FAMILIAX = 1)) OR (:FAMILIAX = 0)) ');
        // if (Filtro[4]='1') then
        //    Add(' AND ((((AG.AGRUPACION <= :AGRH) AND (AG.AGRUPACION <= :AGRH)) AND (:AGRUPACIONX = 1)) OR (:AGRUPACIONX = 0)) ');
        // if (Filtro[5]='1') then
        Add(' AND ((((AL.ARTICULO <= :ARTH) AND (AL.ARTICULO >= :ARTD)) AND (:ARTICULOX = 1)) OR (:ARTICULOX = 0)) ');
        // if (Filtro[6]='1') then
        Add(' AND ((((AL.F_FABRICACION <= :FABRICADOH) AND (AL.F_FABRICACION >= :FABRICADOD)) AND (:FABRICACIONX = 1)) OR (:FABRICACIONX = 0)) ');
        // if (Filtro[7]='1') then
        Add(' AND ((((AL.F_ENVASADO <= :ENVASADOH) AND (AL.F_ENVASADO >= :ENVASADOD)) AND (:ENVASADOX = 1)) OR (:ENVASADOX = 0)) ');
        // if (Filtro[8]='1') then
        Add(' AND ((((AL.F_CADUCIDAD <= :CADUCIDADH) AND (AL.F_CADUCIDAD >= :CADUCIDADD)) AND (:CADUCIDADX = 1)) OR (:CADUCIDADX = 0)) ');

        if (Filtro[11] = '0') then
           Add(' AND AL.STOCK_UBICACION > 0 ');

        // Ordenación de los resultados
        if (Orden <> '000000') then
        begin
           Add(' ORDER BY ');
           Separador := '';
           if (Orden[1] = '1') then
           begin
              Add(Separador + ' AR.FAMILIA ');
              Separador := ', ';
           end;
           // Si ordeno por articulo o solo por familia, ordeno tambien por articulo
           if ((Orden[2] = '1') or (Orden = '100000')) then
           begin
              Add(Separador + ' AL.ARTICULO ');
              Separador := ', ';
           end;
           if (Orden[3] = '1') then
           begin
              Add(Separador + ' AL.LOTE ');
              Separador := ', ';
           end;
           if (Orden[4] = '1') then
           begin
              Add(Separador + ' AL.F_CADUCIDAD ');
              Separador := ', ';
           end;
        end
        else
           Add(' ORDER BY AR.FAMILIA, AL.ARTICULO, AL.LOTE ');
     end;
  end;
end;

procedure TDMLstLotes.frLotesGetValue(const ParName: string; var ParValue: variant);
var
  TipoLst : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TITULO' then
  begin
     if TipoDoc = 'C' then
        ParValue := _('LISTADO DE LOTES PARA COMPRAS/ENTRADAS');
     if TipoDoc = 'V' then
        ParValue := _('LISTADO DE LOTES PARA VENTAS/SALIDAS');
     if TipoDoc = 'M' then
        ParValue := _('LISTADO DE LOTES PARA MOVIMIENTOS');
  end;

  if (ParName = 'RANGOLOTES') then
     ParValue := Format(_('Desde Lote: %s hasta lote: %s'), [LoteDesde, LoteHasta]);
  if (ParName = 'RANGOALMACEN') then
     if (Filtro[2] = '0') then
        ParValue := ''
     else
        ParValue := Format(_('Desde Almacén: %s hasta Almacén: %s'), [AlmacenDesde, AlmacenHasta]);
  if (ParName = 'RANGOFAMILIA') then
     ParValue := Format(_('Desde Familia: %s hasta Familia: %s'), [FamD, FamH]);
  if (ParName = 'RANGOAGRUPACION') then
     if (Filtro[4] = '0') then
        ParValue := ''
     else
        ParValue := Format(_('Desde Agrupación: %s hasta Agrupación: %s'), [AgrD, AgrH]);

  if (ParName = 'RANGOARTICULO') then
     if (Filtro[5] = '0') then
        ParValue := ''
     else
        ParValue := Format(_('Desde Artículo: %s hasta artículo: %s'), [ArticuloDesde, ArticuloHasta]);
  if (ParName = 'TITULOFAM') then
     ParValue := DameTituloFamilia(xMovimientosLote.FieldByName('FAMILIA').AsString);

  if (ParName = 'RANGOFECHAS') then
     if (Filtro[9] = '0') then
        ParValue := ''
     else
        ParValue := Format(_('Desde Fecha de Compra: %s hasta Fecha de Compra: %s'), [DateToStr(CompD), DateToStr(CompH)]);

  if (ParName = 'RANGOFECHAS') then
     if (Filtro[10] = '0') then
        ParValue := ''
     else
        ParValue := Format(_('Desde Fecha de Venta: %s hasta Fecha de Venta: %s'), [DateToStr(VentD), DateToStr(VentH)]);

  if (ParName = 'CLI/PRO') then
  begin
     TipoLst := xMovimientosLote.FieldByName('TIPO').AsString;
     if ((TipoLst = 'MVE') or (TipoLst = 'MVS')) then
        ParValue := ''
     else
        ParValue := DameTitulo(TipoLst);
  end;

  if (ParName = 'PROVEEDOR') then
     ParValue := DameTitulo(xMovimientosLote.FieldByName('TIPO').AsString);
  if (ParName = 'CLIENTE') then
     ParValue := DameTitulo(xMovimientosLote.FieldByName('TIPO').AsString);
  if (ParName = 'FECHA') and (TipoDoc <> 'I') then
  begin
     if ((xMovimientosLote.FieldByName('TIPO').AsString = 'FAP') or
        (xMovimientosLote.FieldByName('TIPO').AsString = 'ALP') or
        (xMovimientosLote.FieldByName('TIPO').AsString = 'MVE')) then
        ParValue := xMovimientosLote.FieldByName('FechaC').AsDateTime;
     if ((xMovimientosLote.FieldByName('TIPO').AsString = 'FAC') or
        (xMovimientosLote.FieldByName('TIPO').AsString = 'ALB') or
        (xMovimientosLote.FieldByName('TIPO').AsString = 'MVS')) then
        ParValue := xMovimientosLote.FieldByName('Fechav').AsDateTime;
  end;
  if ((ParName = 'Tipo') and ((TipoDoc = 'C') or (TipoDoc = 'V'))) then
  begin
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'FAP') then
        ParValue := _('Factura)');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'ALP') then
        ParValue := _('Albarán');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'FAC') then
        ParValue := _('Factura');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'ALB') then
        ParValue := _('Albarán');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'MVE') then
        ParValue := _('Mov. Man. Stock');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'MVS') then
        ParValue := _('Mov. Man. Stock');
  end;
  if ((ParName = 'Tipo') and (TipoDoc = 'M')) then
  begin
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'FAP') then
        ParValue := _('Factura proveedor');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'ALP') then
        ParValue := _('Albarán proveedor');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'FAC') then
        ParValue := _('Factura cliente');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'ALB') then
        ParValue := _('Albarán cliente');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'MVE') then
        ParValue := _('Mov. Man. Stock E');
     if (xMovimientosLote.FieldByName('TIPO').AsString = 'MVS') then
        ParValue := _('Mov. Man. Stock S');
  end;
  if (ParName = 'TipoDoc') then
     ParValue := TipoDoc;
  if (ParName = 'Almacen') then
     ParValue := xMovimientosLote.FieldByName('Almacen').AsString;
  if (ParName = 'Lote') then
     ParValue := LoteDesde;
  if (ParName = 'Serie') then
     ParValue := Serie;
  if (ParName = 'Clasificacion') then
     ParValue := Clasificacion;
  if (ParName = 'Articulo') then
     ParValue := ArticuloDesde;
  if (ParName = 'Descripcion') then
     ParValue := Descripcion;
  if (ParName = 'FFabricacion') then
     ParValue := FFabricacionDesde;
  if (ParName = 'FFenvasado') then
     ParValue := FEnvasadoDesde;
  if (ParName = 'FCaducidad') then
     ParValue := FCaducidadDesde;
  if ParName = 'IDIOMA' then
     ParValue := Idioma;
  if ParName = 'Sufijo' then
     ParValue := Sufijo;
end;

procedure TDMLstLotes.frLotesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

function TDMLstLotes.DameTitulo(Tipo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ST.NOMBRE_R_SOCIAL FROM ');
        if (tipo = 'FAP') then
           SQL.Add(' GES_CABECERAS_E_FAC GC ');
        if (tipo = 'ALP') then
           SQL.Add(' GES_CABECERAS_E_ALB GC ');
        if (tipo = 'FAC') then
           SQL.Add(' GES_CABECERAS_S GC ');
        if (tipo = 'ALB') then
           SQL.Add(' GES_CABECERAS_S GC ');
        SQL.Add(' LEFT JOIN SYS_TERCEROS ST ');
        SQL.Add(' ON (GC.TERCERO = ST.TERCERO) ');
        SQL.Add(' WHERE ');
        SQL.Add(' GC.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' GC.EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' GC.CANAL = ?CANAL AND ');
        SQL.Add(' GC.SERIE = ?SERIE AND ');
        SQL.Add(' GC.RIG = ?RIG AND ');
        SQL.Add(' GC.TIPO = ?TIPO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xMovimientosLote.FieldByName('SERIE').AsString;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := xMovimientosLote.FieldByName('RIG').AsInteger;
        ExecQuery;
        Result := FieldByName['NOMBRE_R_SOCIAL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstLotes.LanzaEtiquetas(Grupo, aNumEtiquetas, aIdLote, Modo: integer; aArticulo, aDescripcion, aSerie, aClasificacion, aIdioma: string; aFFabricacion, aFCaducidad, aFEnvasado: TDateTime; Pastadas, PastadasCantEtiq: integer; aSufijo: string);
var
  col : integer;
begin
  NumEtiquetas := aNumEtiquetas;
  IdLote := aIdLote;
  LoteDesde := DameLote(IdLote);
  Serie := aSerie;
  Clasificacion := aClasificacion;
  ArticuloDesde := aArticulo;
  Descripcion := aDescripcion;
  FFabricacionDesde := aFFabricacion;
  FEnvasadoDesde := aFEnvasado;
  FCaducidadDesde := aFCaducidad;
  Idioma := aIdioma;
  Sufijo := aSufijo;

  with xLote do
  begin
     Close;
     Params.ByName['ID_LOTE'].AsInteger := IdLote;
     Open;
  end;

  with QMPastada do
  begin
     Close;
     Params.ByName['PASTADAS'].AsInteger := Pastadas;
     Params.ByName['ETIQUETAS'].AsInteger := PastadasCantEtiq;
     Open;
  end;

  FREti1Col.RangeEndCount := NumEtiquetas;
  if (NumEtiquetas mod 2) > 0 then
     col := (NumEtiquetas div 2) + 1
  else
     col := (NumEtiquetas div 2);
  FREti2Col.RangeEndCount := col;

  if (NumEtiquetas mod 3) > 0 then
     col := (NumEtiquetas div 3) + 1
  else
     col := (NumEtiquetas div 3);
  FREti3Col.RangeEndCount := col;

  // Columnas fr3
  FRxEti1Col.RangeEndCount := FREti1Col.RangeEndCount;
  FRxEti2Col.RangeEndCount := FREti2Col.RangeEndCount;
  FRxEti3Col.RangeEndCount := FREti3Col.RangeEndCount;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frLotes, frxLotes, nil);
end;

procedure TDMLstLotes.frxLotesBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstLotes.frxLotesGetValue(const VarName: string; var Value: variant);
begin
  frLotesGetValue(VarName, Value);
end;

procedure TDMLstLotes.xMovimientosLoteAfterOpen(DataSet: TDataSet);
begin
  with xStockLotes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := xMovimientosLote.FieldByName('ARTICULO').AsString;
     Open;
  end;
end;

procedure TDMLstLotes.xLoteAfterOpen(DataSet: TDataSet);
begin
  with xArticuloIdioma do
  begin
     Close;
     Params.ByName['IDIOMA'].AsString := Idioma;
     Open;
  end;
end;

procedure TDMLstLotes.InfoPastadas(Articulo: string; var Pastadas, PastadasCantEtiq: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PASTADAS, PASTADA_CANT_ETIQUETAS FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Pastadas := FieldByName['PASTADAS'].AsInteger;
        PastadasCantEtiq := FieldByName['PASTADA_CANT_ETIQUETAS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Pastadas = 0) then
     Pastadas := 1;
  if (PastadasCantEtiq = 0) then
     PastadasCantEtiq := 1;
end;

end.
