unit UDMABCComprasKri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FR_Chart, FIBDataSetRO,
  HYFIBQuery;

type
  TDMABCComprasKri = class(TDataModule)
     TLocal: THYTransaction;
     QDameFecha: THYFIBQuery;
     xProveedorD: TFIBDataSetRO;
     DSxProveedorD: TDataSource;
     xProveedorH: TFIBDataSetRO;
     DSxProveedorH: TDataSource;
     QMaxProveedor: THYFIBQuery;
     xTmp_Abc_Proveedores: TFIBDataSetRO;
     DSxTmp_Abc_Proveedores: TDataSource;
     frDBxTmp_Abc_Proveedores: TfrDBDataSet;
     xTmp_Abc_Compras_Articulos: TFIBDataSetRO;
     DSxTmp_Abc_Articulos: TDataSource;
     frDBxTmp_Abc_Articulos: TfrDBDataSet;
     xArticuloD: TFIBDataSetRO;
     DSxArticuloD: TDataSource;
     DSxArticuloH: TDataSource;
     xArticuloH: TFIBDataSetRO;
     xFamiliaH: TFIBDataSetRO;
     DSxFamiliaH: TDataSource;
     DSxFamiliaD: TDataSource;
     xFamiliaD: TFIBDataSetRO;
     SPAcumulaArt: THYFIBQuery;
     frChartObject1: TfrChartObject;
     SPAcumulaArtFam: THYFIBQuery;
     xCanales: TFIBQuery;
     xAlmacenes: TFIBQuery;
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
     frAbc: TfrHYReport;
     SPAcumulaPro: THYFIBQuery;
     QTitulo_Almacenes: THYFIBQuery;
     xTmp_Abc_Familias: TFIBDataSetRO;
     DSxTmp_Abc_Familias: TDataSource;
     frDBxTmp_Abc_Familias: TfrDBDataSet;
     xTmp_Abc_Compras_ArticulosEMPRESA: TIntegerField;
     xTmp_Abc_Compras_ArticulosENTRADA: TIntegerField;
     xTmp_Abc_Compras_ArticulosARTICULO: TFIBStringField;
     xTmp_Abc_Compras_ArticulosEJERCICIO: TIntegerField;
     xTmp_Abc_Compras_ArticulosEJERCICIOB: TIntegerField;
     xTmp_Abc_Compras_ArticulosCANAL: TIntegerField;
     xTmp_Abc_Compras_ArticulosTITULO: TFIBStringField;
     xTmp_Abc_Compras_ArticulosALMACEN1: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN2: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN3: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN4: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN5: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN6: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN7: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN8: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES1: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES2: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES3: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES4: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES5: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES6: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES7: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES8: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES: TFloatField;
     xTmp_Abc_Compras_ArticulosCOMPRAS_CANAL: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN1B: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN2B: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN3B: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN4B: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN5B: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN6B: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN7B: TFloatField;
     xTmp_Abc_Compras_ArticulosALMACEN8B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES1B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES2B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES3B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES4B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES5B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES6B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES7B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADES8B: TFloatField;
     xTmp_Abc_Compras_ArticulosUNIDADESB: TFloatField;
     xTmp_Abc_Compras_ArticulosCOMPRAS_CANALB: TFloatField;
     xTmp_Abc_Compras_ArticulosPOR_COMPRAS_CANAL: TFloatField;
     xTmp_Abc_Compras_ArticulosPOR_COMPRAS_CANALB: TFloatField;
     xTmp_Abc_FamiliasEMPRESA: TIntegerField;
     xTmp_Abc_FamiliasENTRADA: TIntegerField;
     xTmp_Abc_FamiliasFAMILIA: TFIBStringField;
     xTmp_Abc_FamiliasEJERCICIO: TIntegerField;
     xTmp_Abc_FamiliasEJERCICIOB: TIntegerField;
     xTmp_Abc_FamiliasCANAL: TIntegerField;
     xTmp_Abc_FamiliasTITULO: TFIBStringField;
     xTmp_Abc_FamiliasALMACEN1: TFloatField;
     xTmp_Abc_FamiliasALMACEN2: TFloatField;
     xTmp_Abc_FamiliasALMACEN3: TFloatField;
     xTmp_Abc_FamiliasALMACEN4: TFloatField;
     xTmp_Abc_FamiliasALMACEN5: TFloatField;
     xTmp_Abc_FamiliasALMACEN6: TFloatField;
     xTmp_Abc_FamiliasALMACEN7: TFloatField;
     xTmp_Abc_FamiliasALMACEN8: TFloatField;
     xTmp_Abc_FamiliasCOMPRAS_CANAL: TFloatField;
     xTmp_Abc_FamiliasALMACEN1V: TFloatField;
     xTmp_Abc_FamiliasALMACEN2V: TFloatField;
     xTmp_Abc_FamiliasALMACEN3V: TFloatField;
     xTmp_Abc_FamiliasALMACEN4V: TFloatField;
     xTmp_Abc_FamiliasALMACEN5V: TFloatField;
     xTmp_Abc_FamiliasALMACEN6V: TFloatField;
     xTmp_Abc_FamiliasALMACEN7V: TFloatField;
     xTmp_Abc_FamiliasALMACEN8V: TFloatField;
     xTmp_Abc_FamiliasVENTAS_CANAL: TFloatField;
     xTmp_Abc_FamiliasALMACEN1B: TFloatField;
     xTmp_Abc_FamiliasALMACEN2B: TFloatField;
     xTmp_Abc_FamiliasALMACEN3B: TFloatField;
     xTmp_Abc_FamiliasALMACEN4B: TFloatField;
     xTmp_Abc_FamiliasALMACEN5B: TFloatField;
     xTmp_Abc_FamiliasALMACEN6B: TFloatField;
     xTmp_Abc_FamiliasALMACEN7B: TFloatField;
     xTmp_Abc_FamiliasALMACEN8B: TFloatField;
     xTmp_Abc_FamiliasCOMPRAS_CANALB: TFloatField;
     xTmp_Abc_FamiliasALMACEN1VB: TFloatField;
     xTmp_Abc_FamiliasALMACEN2VB: TFloatField;
     xTmp_Abc_FamiliasALMACEN3VB: TFloatField;
     xTmp_Abc_FamiliasALMACEN4VB: TFloatField;
     xTmp_Abc_FamiliasALMACEN5VB: TFloatField;
     xTmp_Abc_FamiliasALMACEN6VB: TFloatField;
     xTmp_Abc_FamiliasALMACEN7VB: TFloatField;
     xTmp_Abc_FamiliasALMACEN8VB: TFloatField;
     xTmp_Abc_FamiliasVENTAS_CANALB: TFloatField;
     xTmp_Abc_FamiliasDESVIACION: TFloatField;
     xTmp_Abc_FamiliasNIVEL: TIntegerField;
     xTmp_Abc_FamiliasDESVIACIONB: TFloatField;
     xTmp_Abc_FamiliasSTOCK1: TFloatField;
     xTmp_Abc_FamiliasSTOCK2: TFloatField;
     xTmp_Abc_FamiliasSTOCK3: TFloatField;
     xTmp_Abc_FamiliasSTOCK4: TFloatField;
     xTmp_Abc_FamiliasSTOCK5: TFloatField;
     xTmp_Abc_FamiliasSTOCK6: TFloatField;
     xTmp_Abc_FamiliasSTOCK7: TFloatField;
     xTmp_Abc_FamiliasSTOCK8: TFloatField;
     procedure Graba(DataSet: TDataSet);
     procedure DMABCVentasCreate(Sender: TObject);
     procedure DMABCVentasDestroy(Sender: TObject);
     procedure frAbcGetValue(const ParName: string; var ParValue: variant);
     procedure frAbcEnterRect(Memo: TStringList; View: TfrView);
  private
     Fecha_Desde, Fecha_Hasta: TDateTime;
     clas: integer;
     RangoABCProv, RangoABCAcr, RangoABCArt: string;
     function damedescripcion(Almacen: string): string;
  public
     grupo, ejercicio2, NivelRep: integer;
     Almacen1, Almacen2, Almacen3, Almacen4, Almacen5, Almacen6, Almacen7, Almacen8: string;
     procedure RellenaCanales(Lista: TStrings);
     procedure RellenaAlmacenes(Lista: TStrings);
     procedure AcumulaPro(canal: integer; Almacen: string; ejercicioB, Todos_Almacenes, Todos_Canales, comparar: smallint; ProvD, ProvH, modo, borrar: integer; FechaD, FechaH: TDateTime);
     procedure AcumulaArt(canal, Todos_canales, todos_Almacenes, modo, borrar, comparar, ejercicioB, nivel, conventas: integer; Almacen, ArticuloD, ArticuloH, FamiliaD, FamiliaH: string; FechaD, FechaH: TDateTime);
     function FechaEjercicio: TDateTime;
     procedure Muestra(modo, clase, orden, nivel: smallint; fecha1, fecha2: TDateTime);
     function DameProveedor: integer;
     function DameAcreedor: integer;
     procedure CambiaAcreedorD(acreedor: integer);
     procedure CambiaProveedorD(proveedor: integer);
     procedure CambiaProveedorH(proveedor: integer);
     procedure CambiaAcreedorH(acreedor: integer);
     procedure CambiaFamiliaD(Familia: string);
     procedure CambiaFamiliaH(Familia: string);
     procedure CambiaArticuloD(Articulo: string);
     procedure CambiaArticuloH(Articulo: string);
     procedure DameGrupoArt(Todos_Almacenes, comparar: integer; Almacen: string);
     procedure DamegrupoPro(Todos_Almacenes, comparar: integer);
     procedure DameGrupoFam(Todos_Almacenes, comparar, conventas: integer; Almacen: string);
     function DameArticuloMin: string;
     function DameArticuloMax: string;
     function DameFamiliaMin: string;
     function DameFamiliaMax: string;
  end;

var
  DMABCComprasKri : TDMABCComprasKri;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.DFM}

procedure TDMABCComprasKri.DMABCVentasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMlistados, DMListados);

  // Inicializar Rangos de los Listados
  RangoABCProv := '';
  RangoABCAcr := '';
  RangoABCArt := '';
end;

procedure TDMABCComprasKri.DMABCVentasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMABCComprasKri.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMABCComprasKri.RellenaCanales(Lista: TStrings);
var
  Canal : integer;
begin
  {dji lrk kri - Memory Leak}
  Lista.AddObject(_('Todos los Canales'), Pointer(0));
  with xCanales do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        Canal := FieldByName['canal'].AsInteger;
        Lista.AddObject(_('Canal') + ' ' + IntToStr(Canal), Pointer(Canal));
        Next;
     end;
     Close;
  end;
end;

function TDMABCComprasKri.FechaEjercicio: TDateTime;
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

function TDMABCComprasKri.DameArticuloMin: string;
begin
  with QMinArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMABCComprasKri.DameArticuloMax: string;
begin
  with QMaxArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMABCComprasKri.DameFamiliaMin: string;
begin
  with QMinFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsString;
  end;
end;

function TDMABCComprasKri.DameFamiliaMax: string;
begin
  with QMaxFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsString;
  end;
end;

function TDMABCComprasKri.DameProveedor: integer;
begin
  with QMaxProveedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

function TDMABCComprasKri.DameAcreedor: integer;
begin
  with QMaxAcreedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
  end;
end;

procedure TDMABCComprasKri.RellenaAlmacenes(Lista: TStrings);
var
  Almacen : string;
begin
  {dji lrk kri - Memory Leak}
  if (REntorno.AlmacenRestringido = '') then
     Lista.AddObject(_('Todos los Almacenes'), Pointer(0));
  with xAlmacenes do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ExecQuery;
     while not EOF do
     begin
        Almacen := FieldByName['Almacen'].AsString;
        if ((REntorno.AlmacenRestringido = '') or
           (REntorno.AlmacenRestringido = FieldByName['almacen'].AsString)) then
           Lista.AddObject(Almacen, Pointer(Almacen));
        Next;
     end;
     Close;
  end;
end;

procedure TDMABCComprasKri.CambiaProveedorD(proveedor: integer);
begin
  with xProveedorD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Proveedor'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMABCComprasKri.CambiaAcreedorD(acreedor: integer);
begin
  with xAcreedorD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Acreedor'].AsInteger := Acreedor;
     Open;
  end;
end;

procedure TDMABCComprasKri.CambiaAcreedorH(Acreedor: integer);
begin
  with xAcreedorH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Acreedor'].AsInteger := Acreedor;
     Open;
  end;
end;

procedure TDMABCComprasKri.CambiaProveedorH(Proveedor: integer);
begin
  with xProveedorH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['proveedor'].AsInteger := Proveedor;
     Open;
  end;
end;

procedure TDMABCComprasKri.DamegrupoPro(Todos_Almacenes, comparar: integer);
begin
  if ((Todos_Almacenes = 0) and (comparar = 0)) then
     grupo := 5016;
  if ((Todos_Almacenes = 0) and (comparar = 1)) then
     grupo := 5017;
  if ((Todos_Almacenes = 1) and (comparar = 0)) then
     grupo := 5015;
  if ((Todos_Almacenes = 1) and (comparar = 1)) then
     grupo := 5018;
end;

procedure TDMABCComprasKri.AcumulaPro(canal: integer; Almacen: string; ejercicioB, Todos_Almacenes, Todos_Canales, comparar: smallint; ProvD, ProvH, modo, borrar: integer; FechaD, FechaH: TDateTime);

begin
  ejercicio2 := ejercicioB;
  DMListados.Normalizar_Desde_Hasta(ProvD, ProvH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');

  //Seleccionamos el nº de listado según los parámetros de cálculo
  DamegrupoPro(Todos_almacenes, comparar);

  // Actualizar el Rango del Listado

  if (modo = 0) then
     RangoABCProv := Format(_('Del Proveedor %d al Proveedor %d'), [ProvD, ProvH])
  else
     RangoABCProv := _('Por Agrupación');

  with SPAcumulaPro do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     Params.ByName['Borrado'].AsInteger := Borrar;
     Params.ByName['Comparado'].AsInteger := Comparar;
     Params.ByName['Fecha_Ini'].AsDateTime := Fecha_Desde;
     Params.ByName['Fecha_Fin'].AsDateTime := Fecha_Hasta;
     Params.ByName['Proveedor_Ini'].AsInteger := ProvD;
     Params.ByName['Proveedor_Fin'].AsInteger := ProvH;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['EjercicioB'].AsInteger := EjercicioB;
     Params.ByName['Canal'].AsInteger := Canal;
     Params.ByName['Todos_Canales'].AsInteger := Todos_Canales;
     Params.ByName['Almacen0'].AsString := Almacen;
     Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
     Params.ByName['Moneda_Actual'].AsString := REntorno.moneda;
     ExecQuery;
     Transaction.CommitRetaining;
     Almacen1 := FieldByName['Almacen1'].AsString;
     Almacen2 := FieldByName['Almacen2'].AsString;
     Almacen3 := FieldByName['Almacen3'].AsString;
     Almacen4 := FieldByName['Almacen4'].AsString;
     Almacen5 := FieldByName['Almacen5'].AsString;
     Almacen6 := FieldByName['Almacen6'].AsString;
     Almacen7 := FieldByName['Almacen7'].AsString;
     Almacen8 := FieldByName['Almacen8'].AsString;
     Close;
  end;
end;

procedure TDMABCComprasKri.DameGrupoArt(Todos_Almacenes, comparar: integer; Almacen: string);
begin
  if ((Todos_Almacenes = 0) and (comparar = 0)) then
  begin
     grupo := 5019;
     Almacen1 := Almacen;
     // Almacen1 es el campo por defecto que se rellena para un sólo Almacen
  end;
  // más adelante en el OnGetValue del report nos servirá para sacar el nombre

  if ((Todos_Almacenes = 0) and (comparar = 1)) then
  begin
     grupo := 5020;
     Almacen1 := Almacen;
  end;
  if ((Todos_Almacenes = 1) and (comparar = 0)) then
     grupo := 5021;

  if ((Todos_Almacenes = 1) and (comparar = 1)) then
     grupo := 5022;
end;

procedure TDMABCComprasKri.DameGrupoFam(Todos_Almacenes, comparar, conventas: integer; Almacen: string);
begin
  if ((Todos_Almacenes = 0) and (comparar = 0)) then
  begin
     grupo := 5023;
     Almacen1 := Almacen;
     // Almacen1 es el campo por defecto que se rellena para un sólo Almacen
  end;
  // más adelante en el OnGetValue del report nos servirá para sacar el nombre

  if ((Todos_Almacenes = 0) and (comparar = 1)) then
  begin
     grupo := 5024;
     Almacen1 := Almacen;
  end;

  if ((Todos_Almacenes = 1) and (comparar = 0)) then
  begin
     grupo := 5025;
     Almacen1 := Almacen;
  end;

  if ((Todos_Almacenes = 1) and (comparar = 1)) then
  begin
     grupo := 5026;
     Almacen1 := Almacen;
  end;
  if ((Todos_Almacenes = 1) and (comparar = 0) and (conventas = 1)) then
  begin
     grupo := 5027;
     Almacen1 := Almacen;
  end;
end;

procedure TDMABCComprasKri.AcumulaArt(canal, Todos_canales, todos_Almacenes, modo, borrar, comparar, ejercicioB, nivel, conventas: integer; Almacen, ArticuloD, ArticuloH, FamiliaD, FamiliaH: string; FechaD, FechaH: TDateTime);
begin
  ejercicio2 := ejercicioB;
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  Fecha_Desde := HourIntoDate(FechaD, '00:00:00');
  Fecha_Hasta := HourIntoDate(FechaH, '23:59:59');
  nivelRep := nivel;
  if (modo = 0) then  // Por Artículos
  begin
     DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);

     // Actualizar el Rango del Listado
     RangoABCArt := Format(_('Del Artículo %s al Artículo %s'), [ArticuloD, ArticuloH]);
     DameGrupoArt(Todos_Almacenes, Comparar, Almacen);

     with SPAcumulaArt do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['comparado'].AsInteger := comparar;
        Params.ByName['Fecha_Ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_Fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Articulo_ini'].AsString := ArticuloD;
        Params.ByName['Articulo_fin'].AsString := ArticuloH;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_Canales;
        Params.ByName['Almacen0'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['moneda_actual'].AsString := REntorno.Moneda;
        ExecQuery;
        Transaction.CommitRetaining;
        Almacen1 := FieldByName['Almacen1'].AsString;
        Almacen2 := FieldByName['Almacen2'].AsString;
        Almacen3 := FieldByName['Almacen3'].AsString;
        Almacen4 := FieldByName['Almacen4'].AsString;
        Almacen5 := FieldByName['Almacen5'].AsString;
        Almacen6 := FieldByName['Almacen6'].AsString;
        Almacen7 := FieldByName['Almacen7'].AsString;
        Almacen8 := FieldByName['Almacen8'].AsString;
        Close;
     end;
  end
  else if (modo = 1) then  // Por Familias
  begin
     NivelRep := Nivel; //Mostrará el nivel elegido en el Report.
     DMListados.Normalizar_Desde_Hasta(FamiliaD, FamiliaH);

     // Actualizar el Rango del Listado
     RangoABCArt := Format(_('Del la Familia %s al la Familia %s'), [FamiliaD, FamiliaH]);
     DameGrupoFam(Todos_Almacenes, comparar, conventas, Almacen);

     with SPAcumulaArtFam do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['Borrado'].AsInteger := Borrar;
        Params.ByName['Comparado'].AsInteger := Comparar;
        Params.ByName['Fecha_ini'].AsDateTime := Fecha_Desde;
        Params.ByName['Fecha_fin'].AsDateTime := Fecha_Hasta;
        Params.ByName['Familia_ini'].AsString := FamiliaD;
        Params.ByName['Familia_fin'].AsString := FamiliaH;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['EjercicioB'].AsInteger := EjercicioB;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Todos_Canales'].AsInteger := Todos_Canales;
        Params.ByName['Almacen0'].AsString := Almacen;
        Params.ByName['Todos_Almacenes'].AsInteger := Todos_Almacenes;
        Params.ByName['moneda_actual'].AsString := REntorno.Moneda;
        Params.ByName['Nivel'].AsInteger := nivel;
        Params.ByName['Con_ventas'].AsInteger := Conventas;
        ExecQuery;
        Transaction.CommitRetaining;
        Almacen1 := FieldByName['Almacen1'].AsString;
        Almacen2 := FieldByName['Almacen2'].AsString;
        Almacen3 := FieldByName['Almacen3'].AsString;
        Almacen4 := FieldByName['Almacen4'].AsString;
        Almacen5 := FieldByName['Almacen5'].AsString;
        Almacen6 := FieldByName['Almacen6'].AsString;
        Almacen7 := FieldByName['Almacen7'].AsString;
        Almacen8 := FieldByName['Almacen8'].AsString;
        Close;
     end;
  end;
end;

procedure TDMABCComprasKri.Muestra(modo, clase, orden, nivel: smallint; fecha1, fecha2: TDateTime);
var
  str : string;

begin
  sw := 1;
  clas := Clase;
  Fecha_Desde := fecha1;
  Fecha_Hasta := fecha2;

  case clase of   //Proveedor
     0:
     begin
        case orden of
           0: str := 'PROVEEDOR';
           1: str := 'PROVEEDOR DESC';
           2: str := 'TITULO';
           3: str := 'TITULO DESC';
           4: str := 'COMPRAS_CANAL';
           5: str := 'COMPRAS_CANAL DESC';
        end;
        with xTmp_Abc_PROVEEDORES do
        begin
           Close;
           xTmp_Abc_PROVEEDORES.SelectSQL.Text :=
              'SELECT * FROM tmp_abc_compras_proveedor ' +
              'where entrada=' + IntToStr(REntorno.Entrada) + ' and empresa=' +
              IntToStr(REntorno.Empresa) + ' order by ' + str;
           Open;
        end;
     end;
     1:
     begin   // Articulo
        case orden of
           0: str := 'ARTICULO';
           1: str := 'ARTICULO DESC';
           2: str := 'TITULO';
           3: str := 'TITULO DESC';
           4: str := 'COMPRAS_CANAL';
           5: str := 'COMPRAS_CANAL DESC';
        end;
        with xTmp_Abc_Compras_Articulos do
        begin
           Close;
           xTmp_Abc_Compras_Articulos.SelectSQL.Text :=
              'SELECT * FROM TMP_ABC_compras_Articulo ' +
              'where entrada=' + IntToStr(REntorno.Entrada) + ' and empresa=' +
              IntToStr(REntorno.Empresa) + ' order by ' + str;
           Open;
        end;
     end;
     2:
     begin
        case orden of
           0: str := 'FAMILIA';
           1: str := 'FAMILIA DESC';
           2: str := 'TITULO';
           3: str := 'TITULO DESC';
           4: str := 'COMPRAS_CANAL';
           5: str := 'COMPRAS_CANAL DESC';
        end;
        with xTmp_Abc_Familias do
        begin
           Close;
           xTmp_Abc_Familias.SelectSQL.Text := 'SELECT * FROM TMP_ABC_compras_Familia ' +
              'where entrada=' + IntToStr(REntorno.Entrada) + ' and empresa=' +
              IntToStr(REntorno.Empresa) + ' and nivel<=' + IntToStr(Nivel) +
              ' order by ' + str;
           Open;
        end;
     end;
  end;

  DMListados.Cargar(grupo, '');
  frAbc.LoadFromFIB(REntorno.Formato, str);
  frAbc.PrepareReport;
  case Modo of
     0: frAbc.ShowPreparedReport;
     1: frAbc.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMABCComprasKri.frAbcGetValue(const ParName: string; var ParValue: variant);
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
  if ParName = 'RangoABCArt' then
     ParValue := RangoABCArt;
  if ((ParName = 'Almacen1') or (ParName = 'Almacen1B')) then
     ParValue := damedescripcion(Almacen1);
  if ((ParName = 'Almacen2') or (ParName = 'Almacen2B')) then
     ParValue := damedescripcion(Almacen2);
  if ((ParName = 'Almacen3') or (ParName = 'Almacen3B')) then
     ParValue := damedescripcion(Almacen3);
  if ((ParName = 'Almacen4') or (ParName = 'Almacen4B')) then
     ParValue := damedescripcion(Almacen4);
  if ((ParName = 'Almacen5') or (ParName = 'Almacen5B')) then
     ParValue := damedescripcion(Almacen5);
  if ((ParName = 'Almacen6') or (ParName = 'Almacen6B')) then
     ParValue := damedescripcion(Almacen6);
  if ((ParName = 'Almacen7') or (ParName = 'Almacen7B')) then
     ParValue := damedescripcion(Almacen7);
  if ((ParName = 'Almacen8') or (ParName = 'Almacen8B')) then
     ParValue := damedescripcion(Almacen8);
  if ParName = 'Compras1' then
     ParValue := 'Compras ' + REntorno.Ejerciciostr;
  if ParName = 'Porcompras1' then
     ParValue := ' % Compras ' + REntorno.Ejerciciostr;
  if ParName = 'Compras2' then
     ParValue := 'Compras ' + IntToStr(REntorno.Ejercicio - 1);
  if ParName = 'Porcompras2' then
     ParValue := ' % Compras ' + IntToStr(REntorno.Ejercicio - 1);
  if ParName = 'ANO1' then
     ParValue := REntorno.EjercicioStr;
  if ParName = 'ANO2' then
     ParValue := IntToStr(Ejercicio2);
  if ParName = 'nivel' then
     ParValue := NivelRep;
end;

procedure TDMABCComprasKri.frAbcEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
     {
    if (Memo[0] = '[L]') then
    begin
      if (SW = 0) and (REntorno.Pijama = 1) then
      begin
        SW := 1;
        View.Visible := true;
      end
      else
      begin
        SW := 0;
        View.Visible := false;
      end
    end;

    if (pos('[MascaraN]', Memo[0]) > 0) then
      View.FormatStr := MascaraN;
    if (pos('[MascaraL]', Memo[0]) > 0) then
      View.FormatStr := MascaraL;
    if (pos('[MascaraI]', Memo[0]) > 0) then
      View.FormatStr := MascaraI;
    if (pos('[MascaraP]', Memo[0]) > 0) then
      View.FormatStr := MascaraP;

    if (Memo[0] = '[Imagen]') and (View is TfrPictureView) then
    begin
      TfrPictureView(View).Picture.Assign(REntorno.ImagenEmpresa);
      View.Visible := true;
    end;

    if (pos('[C]', Memo[0]) > 0) then
      View.Visible := false;
}
  end;
end;

procedure TDMABCComprasKri.CambiaArticuloD(Articulo: string);
begin
  with xArticuloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMABCComprasKri.CambiaArticuloH(Articulo: string);
begin
  with xArticuloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMABCComprasKri.CambiaFamiliaD(Familia: string);
begin
  with xFamiliaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

procedure TDMABCComprasKri.CambiaFamiliaH(Familia: string);
begin
  with xFamiliaH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := Familia;
     Open;
  end;
end;

function TDMABCComprasKri.damedescripcion(Almacen: string): string;
begin
  with QTitulo_Almacenes do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Almacen'].AsString := Almacen;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
  end;
end;

end.
