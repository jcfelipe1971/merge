unit UDMABCCompras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMABCCompras = class(TDataModule)
     TLocal: THYTransaction;
     QDameFecha: THYFIBQuery;
     frAbc: TfrHYReport;
     QMaxProveedor: THYFIBQuery;
     xTmp_Abc_Proveedores: TFIBDataSetRO;
     DSxTmp_Abc_Proveedores: TDataSource;
     frDBxTmp_Abc_Proveedores: TfrDBDataSet;
     xTmp_Abc_Articulos_Pro: TFIBDataSetRO;
     DSxTmp_Abc_Articulos: TDataSource;
     frDBxTmp_Abc_Articulos: TfrDBDataSet;
     QMinArticulo: THYFIBQuery;
     QMaxArticulo: THYFIBQuery;
     QMinFamilia: THYFIBQuery;
     QMaxFamilia: THYFIBQuery;
     QMaxAcreedor: THYFIBQuery;
     xAcreedorD: TFIBDataSetRO;
     DSxAcreedorD: TDataSource;
     xAcreedorH: TFIBDataSetRO;
     DSxAcreedorH: TDataSource;
     xTmp_Abc_acreedores: TFIBDataSetRO;
     DSxTmp_Abc_acreedores: TDataSource;
     frDBxTmp_Abc_acreedores: TfrDBDataSet;
     SPAcumulaAcr: THYFIBQuery;
     xAgrupProv: TFIBDataSetRO;
     DSxAgrupProv: TDataSource;
     xAgrupProvTITULO: TFIBStringField;
     xAgrupacionProv: TFIBDataSetRO;
     DSxAgrupacionProv: TDataSource;
     xAgrupacionProvTITULO: TFIBStringField;
     frxAbc: TfrxHYReport;
     TUpdate: THYTransaction;
     xTmp_Abc_Familias: TFIBDataSetRO;
     DSxTmp_Abc_familias: TDataSource;
     frDBDSxTmp_Abc_familias: TfrDBDataSet;
     xTmp_Abc_Prov_Art: TFIBDataSetRO;
     DSxTmp_Abc_Prov_Art: TDataSource;
     frDBxTmp_Abc_Prov_Art: TfrDBDataSet;
     xTmp_Abc_Prov_Fam: TFIBDataSetRO;
     DSxTmp_Abc_Prov_Fam: TDataSource;
     frDBxTmp_Abc_Prov_Fam: TfrDBDataSet;
     procedure DMABCComprasCreate(Sender: TObject);
     procedure DMABCComprasDestroy(Sender: TObject);
     procedure frAbcGetValue(const ParName: string; var ParValue: variant);
     procedure frAbcEnterRect(Memo: TStringList; View: TfrView);
     procedure xTmp_Abc_ProveedoresAfterScroll(DataSet: TDataSet);
     procedure frxAbcBeforePrint(Sender: TfrxReportComponent);
     procedure frxAbcGetValue(const VarName: string; var Value: variant);
  private
     Fecha_Desde, Fecha_Hasta: TDateTime;
     clas: integer;
     RangoABCProv, RangoABCAcr, RangoABCArt: string;
     procedure LimpiaTemporales;
  public
     prov_agrupado: smallint;
     procedure AcumulaPro(Canal: integer; Serie, agrupacion: string; Alcance: smallint; ProvD, ProvH, Modo: integer; ArticuloD, ArticuloH, FamiliaD, FamiliaH, SubFamiliaD, SubFamiliaH: string; Borrar: boolean; FechaD, FechaH: TDateTime; Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada, PorArticulos, PorFamilias, DetallaClientes, PrecioCero: boolean; PorAgrupacion: integer);
     procedure AcumulaArt(Canal: integer; Serie: string; Alcance: smallint; ArticuloD, ArticuloH, FamiliaD, FamiliaH, SubFamiliaD, SubFamiliaH: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada: boolean);
     procedure AcumulaAcr(Canal: integer; Serie: string; Alcance: smallint; Acreedor, Acreedorh: integer; Borrar: boolean; FechaD, FechaH: TDateTime);
     function FechaEjercicio: TDateTime;
     procedure Muestra(Modo, Clase, Orden, Agrup: smallint; Fecha1, Fecha2: TDateTime);
     function DameProveedor: integer;
     function DameAcreedor: integer;
     procedure CambiaAcreedorD(acreedor: integer);
     procedure CambiaAcreedorH(acreedor: integer);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameFamiliaMin: string;
     function DameFamiliaMax: string;
     procedure CambiaAgrupacionProv(Agrupacion: string);
     function DameAgrupacionProv(Agrupacion: string): string;
  end;

var
  DMABCCompras : TDMABCCompras;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.DFM}

procedure TDMABCCompras.DMABCComprasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  // Inicializar Rangos de los Listados
  RangoABCProv := '';
  RangoABCAcr := '';
  RangoABCArt := '';
end;

procedure TDMABCCompras.DMABCComprasDestroy(Sender: TObject);
begin
  LimpiaTemporales;

  CierraData(DMListados);
end;

function TDMABCCompras.FechaEjercicio: TDateTime;
var
  duracion : smallint;
  fecha : TDateTime;
begin
  with QDameFecha do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     duracion := FieldByName['DURACION'].AsInteger;
     fecha := FieldByName['APERTURA'].AsDateTime;

     if (duracion = 2) then
        Result := fecha
     else
        Result := EncodeDate(REntorno.Ejercicio, 01, 01);
  end;
end;

function TDMABCCompras.DameArticuloMin: string;
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMABCCompras.DameArticuloMax: string;
begin
  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMABCCompras.DameFamiliaMin: string;
begin
  with QMinFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMABCCompras.DameFamiliaMax: string;
begin
  with QMaxFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMABCCompras.DameProveedor: integer;
begin
  with QMaxProveedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

function TDMABCCompras.DameAcreedor: integer;
begin
  with QMaxAcreedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

procedure TDMABCCompras.CambiaAcreedorD(acreedor: integer);
begin
  with xAcreedorD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Acreedor'].AsInteger := Acreedor;
     Open;
  end;
end;

procedure TDMABCCompras.CambiaAcreedorH(Acreedor: integer);
begin
  with xAcreedorH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Acreedor'].AsInteger := Acreedor;
     Open;
  end;
end;

procedure TDMABCCompras.AcumulaPro(Canal: integer; Serie, agrupacion: string; Alcance: smallint; ProvD, ProvH, Modo: integer; ArticuloD, ArticuloH, FamiliaD, FamiliaH, SubFamiliaD, SubFamiliaH: string; Borrar: boolean; FechaD, FechaH: TDateTime; Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada, PorArticulos, PorFamilias, DetallaClientes, PrecioCero: boolean; PorAgrupacion: integer);
begin
  DMListados.Normalizar_Desde_Hasta(ProvD, ProvH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(FamiliaD, FamiliaH);
  DMListados.Normalizar_Desde_Hasta(SubFamiliaD, SubFamiliaH);

  // Actualizar el Rango del Listado
  if (Modo = 0) then
  begin
     RangoABCProv := Format(_('Del proveedor %d al proveedor %d'), [ProvD, ProvH]);
     Agrupacion := '';
  end
  else
  begin
     RangoABCProv := _('Por agrupación');
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_COMPRAS_ABC_PROVEEDOR(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PROVEEDORD, :PROVEEDORH, :AGRUPACION, ');
        SQL.Add(' :FECHAD, :FECHAH, :BORRAR, :MODO, :ALCANCE, :ENTRADA, :CANAL_CALCULO, :ARTICULOD, :ARTICULOH, :FAMILIAD, :FAMILIAH, ');
        SQL.Add(' :SUBFAMILIAD, :SUBFAMILIAH, :POR_FAMILIAS, :POR_ARTICULOS, :AGRUPACIONH, :PRECIO_CERO, :POR_AGRUPACION, ');
        SQL.Add(' :FACTURAABIERTA, :FACTURACERRADA, :ALBARANABIERTO, :ALBARANCERRADO, :ALBARAN, :DESGLOSA_PRO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['PROVEEDORD'].AsInteger := ProvD;
        Params.ByName['PROVEEDORH'].AsInteger := ProvH;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        Params.ByName['AGRUPACIONH'].AsString := Agrupacion;
        Params.ByName['FECHAD'].AsDateTime := Fecha_Desde;
        Params.ByName['FECHAH'].AsDateTime := Fecha_Hasta;
        Params.ByName['BORRAR'].AsInteger := BoolToInt(Borrar);
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ALCANCE'].AsInteger := Alcance;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['CANAL_CALCULO'].AsInteger := REntorno.Canal;
        Params.ByName['ARTICULOD'].AsString := ArticuloD;
        Params.ByName['ARTICULOH'].AsString := ArticuloH;
        Params.ByName['FAMILIAD'].AsString := FamiliaD;
        Params.ByName['FAMILIAH'].AsString := FamiliaH;
        Params.ByName['SUBFAMILIAD'].AsString := SubFamiliaD;
        Params.ByName['SUBFAMILIAH'].AsString := SubFamiliaH;

        Params.ByName['PRECIO_CERO'].AsInteger := BoolToInt(PrecioCero);
        Params.ByName['POR_FAMILIAS'].AsInteger := BoolToInt(PorFamilias);
        Params.ByName['POR_ARTICULOS'].AsInteger := BoolToInt(PorArticulos);
        Params.ByName['POR_AGRUPACION'].AsInteger := PorAgrupacion;
        Params.ByName['DESGLOSA_PRO'].AsInteger := BoolToInt(DetallaClientes);

        Params.ByName['FACTURAABIERTA'].AsInteger := BoolToInt(FacturaAbierta);
        Params.ByName['FACTURACERRADA'].AsInteger := BoolToInt(FacturaCerrada);
        Params.ByName['ALBARANABIERTO'].AsInteger := BoolToInt(AlbaranAbierto);
        Params.ByName['ALBARANCERRADO'].AsInteger := BoolToInt(AlbaranCerrado);
        Params.ByName['ALBARAN'].AsInteger := BoolToInt(Albaran);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMABCCompras.AcumulaAcr(Canal: integer; Serie: string; Alcance: smallint; Acreedor, AcreedorH: integer; Borrar: boolean; FechaD, FechaH: TDateTime);
begin
  DMListados.Normalizar_Desde_Hasta(Acreedor, AcreedorH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');

  // Actualizar el Rango del Listado
  RangoABCAcr := Format(_('Del acreedor %d al acreedor %d'), [Acreedor, AcreedorH]);

  with SPAcumulaAcr do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     Params.ByName['Serie'].AsString := Serie;
     Params.ByName['AcreedorD'].AsInteger := Acreedor;
     Params.ByName['AcreedorH'].AsInteger := Acreedorh;
     Params.ByName['FechaD'].AsDateTime := Fecha_Desde;
     Params.ByName['FechaH'].AsDateTime := Fecha_Hasta;
     Params.ByName['Borrar'].AsInteger := BoolToInt(Borrar);
     Params.ByName['Alcance'].AsInteger := Alcance;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     Params.ByName['CanalCal'].AsInteger := REntorno.Canal;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMABCCompras.AcumulaArt(Canal: integer; Serie: string; Alcance: smallint; ArticuloD, ArticuloH, FamiliaD, FamiliaH, SubFamiliaD, SubFamiliaH: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada: boolean);
begin
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(FamiliaD, FamiliaH);
  DMListados.Normalizar_Desde_Hasta(SubFamiliaD, SubFamiliaH);

  // Si se pide la segunda opción es por familia y el MODO = 2
  if (Modo = 1) then
     Modo := 2;

  // Actualizar el Rango del Listado
  RangoABCArt := Format(_('Del artículo %s al artículo %s'), [ArticuloD, ArticuloH]);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;

        SQL.Add(' EXECUTE PROCEDURE G_COMPRAS_ABC_ARTICULO ( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ARTICULOD, :ARTICULOH, :FAMILIAD, :FAMILIAH, ');
        SQL.Add(' :SUBFAMILIAD, :SUBFAMILIAH, :FECHAD, :FECHAH, :BORRAR, :ALCANCE, :ENTRADA, :CANAL_CALCULO, ');
        SQL.Add(' :MODO, :FACTURAABIERTA, :FACTURACERRADA, :ALBARANABIERTO, :ALBARANCERRADO, :ALBARAN) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ARTICULOD'].AsString := ArticuloD;
        Params.ByName['ARTICULOH'].AsString := ArticuloH;
        Params.ByName['FAMILIAD'].AsString := FamiliaD;
        Params.ByName['FAMILIAH'].AsString := FamiliaH;
        Params.ByName['SUBFAMILIAD'].AsString := SubFamiliaD;
        Params.ByName['SUBFAMILIAH'].AsString := SubFamiliaH;
        Params.ByName['FECHAD'].AsDateTime := Fecha_Desde;
        Params.ByName['FECHAH'].AsDateTime := Fecha_Hasta;
        Params.ByName['BORRAR'].AsInteger := BoolToInt(Borrar);
        Params.ByName['ALCANCE'].AsInteger := Alcance;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['CANAL_CALCULO'].AsInteger := REntorno.Canal;
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['FACTURAABIERTA'].AsInteger := BoolToInt(FacturaAbierta);
        Params.ByName['FACTURACERRADA'].AsInteger := BoolToInt(FacturaCerrada);
        Params.ByName['ALBARANABIERTO'].AsInteger := BoolToInt(AlbaranAbierto);
        Params.ByName['ALBARANCERRADO'].AsInteger := BoolToInt(AlbaranCerrado);
        Params.ByName['ALBARAN'].AsInteger := BoolToInt(Albaran);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMABCCompras.Muestra(Modo, Clase, Orden, Agrup: smallint; Fecha1, Fecha2: TDateTime);
var
  str, TituloListado, Archivo : string;
  Grupo : integer;
  DS : TDataSource;
begin
  sw := 1;
  clas := Clase;
  Fecha_Desde := Fecha1;
  Fecha_Hasta := Fecha2;
  Grupo := 67;

  // En articulos y acreedores aunque le pasamos cero por no tener agrupacion, ponemos
  // directamente el order by
  case Clase of
     0: // Proveedor
     begin
        DS := DSxTmp_Abc_Proveedores;
        Archivo := 'ABC_Compra_Proveedores';
        Grupo := 67;
        TituloListado := Format(_('ABC de Compras de %s'), [_('proveedor')]);

        case Orden of
           0: str := 'PROVEEDOR';
           1: str := 'PROVEEDOR DESC';
           2: str := 'NOMBRE';
           3: str := 'NOMBRE DESC';
           4: str := 'COMPRAS';
           5: str := 'COMPRAS DESC';
        end;

        with xTmp_Abc_Proveedores do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM TMP_ABC_PROVEEDOR ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ENTRADA=' + IntToStr(REntorno.Entrada) + ' AND ');
           SelectSQL.Add(' TIPO_REGISTROS = 1 ');
           if Agrup <> 0 then
              SelectSQL.Add(' AND AGRUPACION <> '''' ');
           SelectSQL.Add(' ORDER BY ' + str);
           Open;
        end;
     end;
     1: // Articulo
     begin
        //DS := DSxTmp_Abc_Articulos;
        Archivo := 'ABC_Compra_Articulos';
        //Grupo := 68;
        TituloListado := Format(_('ABC de Compras de %s'), [_('articulo')]);

        if Agrup = 0 then
        begin
           DS := DSxTmp_Abc_Articulos;
           Archivo := 'ABC_Compra_Articulos';
           Grupo := 68;

           case Orden of
              0: str := 'ARTICULO';
              1: str := 'ARTICULO DESC';
              2: str := 'NOMBRE';
              3: str := 'NOMBRE DESC';
              4: str := 'COMPRAS';
              5: str := 'COMPRAS DESC';
           end;

           with xTmp_Abc_Articulos_Pro do
           begin
              Close;
              DataSource := nil;
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_ARTICULO_PRO WHERE ENTRADA=' + REntorno.EntradaStr + ' ORDER BY ' + str;
              Open;
           end;
        end
        else
        begin
           DS := DSxTmp_Abc_familias;
           Archivo := 'ABC_Compra_Familias';
           Grupo := 168;
           TituloListado := Format(_('ABC de Compras de %s'), [_('familia')]);

           case Orden of
              0: str := 'FAMILIA, SUBFAMILIA';
              1: str := 'FAMILIA DESC, SUBFAMILIA DESC';
              2: str := 'NOMBRE';
              3: str := 'NOMBRE DESC';
              4: str := 'COMPRAS';
              5: str := 'COMPRAS DESC';
           end;

           with xTmp_Abc_Familias do
           begin
              Close;
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_FAMILIA_PRO WHERE ENTRADA=' + REntorno.EntradaStr + ' ORDER BY ' + str;
              Open;
           end;

           with xTmp_Abc_Articulos_Pro do
           begin
              Close;
              DataSource := DSxTmp_Abc_familias;
              SelectSQL.Text := 'SELECT * FROM TMP_ABC_ARTICULO_PRO WHERE ENTRADA=' + REntorno.EntradaStr + ' AND FAMILIA = :FAMILIA AND SUBFAMILIA = :SUBFAMILIA ORDER BY ARTICULO';
              Open;
           end;
        end;
     end;
     2: // Acreedor
     begin
        DS := DSxTmp_Abc_acreedores;
        Archivo := 'ABC_Compra_Acreedores';
        Grupo := 91;
        TituloListado := Format(_('ABC de Compras de %s'), [_('acreedor')]);

        case Orden of
           0: str := 'ACREEDOR';
           1: str := 'ACREEDOR DESC';
           2: str := 'NOMBRE';
           3: str := 'NOMBRE DESC';
           4: str := 'COMPRAS';
           5: str := 'COMPRAS DESC';
        end;

        with xTmp_Abc_ACREEDORES do
        begin
           Close;
           SelectSQL.Text := 'SELECT * FROM TMP_ABC_ACREEDOR WHERE ENTRADA=' + REntorno.EntradaStr + ' ORDER BY ' + str;
           Open;
        end;
     end;
  end;

  if (Modo = 2) then
  begin
     Archivo := Format(Archivo + '-%s.xls', [FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMABCCompras') then
        ExportarExcel(Archivo, DS);
  end
  else
     DMListados.Imprimir(Grupo, 0, Modo, '', TituloListado, frAbc, frxAbc, nil, nil);
end;

procedure TDMABCCompras.frAbcGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FECHA1' then
     ParValue := Fecha_Desde;
  if ParName = 'FECHA2' then
     ParValue := Fecha_Hasta;
  if ParName = 'TITULO' then
     ParValue := '';
  if ParName = 'RangoABCProv' then
     ParValue := RangoABCProv;
  if ParName = 'RangoABCAcr' then
     ParValue := RangoABCAcr;
  if ParName = 'RangoABCArt' then
     ParValue := RangoABCArt;
  if ParName = 'AgrupVisible' then
     ParValue := prov_agrupado;
end;

procedure TDMABCCompras.frAbcEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMABCCompras.xTmp_Abc_ProveedoresAfterScroll(DataSet: TDataSet);
begin
  with xAgrupProv do
  begin
     Close;
     Open;
  end;
end;

procedure TDMABCCompras.CambiaAgrupacionProv(Agrupacion: string);
begin
  with xAgrupacionProv do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

function TDMABCCompras.DameAgrupacionProv(Agrupacion: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(AGRUPACION) FROM VER_AGRUPACIONES_PROVEEDORES_EF WHERE EMPRESA = ?EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMABCCompras.frxAbcBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMABCCompras.frxAbcGetValue(const VarName: string; var Value: variant);
begin
  frAbcGetValue(VarName, Value);
end;

procedure TDMABCCompras.LimpiaTemporales;
var
  i : integer;
  Tablas : TStrings;
begin
  Tablas := TStringList.Create;
  try
     with Tablas do
     begin
        Add('TMP_ABC_ACREEDOR');
        Add('TMP_ABC_PROVEEDOR');
        Add('TMP_ABC_ARTICULO_PRO');
        Add('TMP_ABC_CLIENTE');
        Add('TMP_ABC_FAMILIA_PRO');
     end;

     for i := 0 to Tablas.Count - 1 do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := format('DELETE FROM %s WHERE ENTRADA = %d', [Tablas[i], REntorno.Entrada]);
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  finally
     Tablas.Free;
  end;
end;

end.
