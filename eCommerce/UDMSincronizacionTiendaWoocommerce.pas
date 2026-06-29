{ TODO : Terminar la importacion de subfamilias. }
{ TODO : Sincronizar idiomas de articulos }

unit UDMSincronizacionTiendaWoocommerce;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, HYFIBQuery, StrUtils, DateUtils,
  DB, FIBDataSet, FIBDatabase, FIBTableDataSet, UFIBModificados, XMLDoc, XMLIntf, uLkJSON;

type
  TDMSincronizacionTiendaWoocommerce = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     QMConfWoocommerce: TFIBTableSet;
     DSQMConfWoocommerce: TDataSource;
     QMConfWoocommerceSinc: TFIBTableSet;
     DSQMConfWoocommerceSinc: TDataSource;
     QMConfWoocommerceCliente: TFIBTableSet;
     DSQMConfWoocommerceCliente: TDataSource;
     QMConfWoocommerceClienteID_CONFIGURACION: TIntegerField;
     QMConfWoocommerceClienteID_CLIENTE: TIntegerField;
     QMConfWoocommerceClienteID_CUSTOMER: TIntegerField;
     QMConfWoocommerceClienteULT_SINCRONIZACION: TDateTimeField;
     QMConfWoocommerceClienteCLIENTE: TIntegerField;
     QMConfWoocommerceClienteTERCERO: TIntegerField;
     QMConfWoocommerceClienteNOMBRE_R_SOCIAL: TFIBStringField;
     QMConfWoocommerceClienteDir: TFIBTableSet;
     DSQMConfWoocommerceClienteDir: TDataSource;
     QMConfWoocommerceClienteDirID_CONFIGURACION: TIntegerField;
     QMConfWoocommerceClienteDirID_ADDRESS: TIntegerField;
     QMConfWoocommerceClienteDirULT_SINCRONIZACION: TDateTimeField;
     QMConfWoocommerceClienteDirTERCERO: TIntegerField;
     QMConfWoocommerceClienteDirDIRECCION: TIntegerField;
     QMConfWoocommerceClienteDirNOMBRE_R_SOCIAL: TFIBStringField;
     QMConfWoocommerceClienteDirDIR_COMPLETA_N: TFIBStringField;
     QMConfWoocommerceClienteDirCLIENTE: TIntegerField;
     QMConfWoocommerceArticulo: TFIBTableSet;
     DSQMConfWoocommerceArticulo: TDataSource;
     QMConfWoocommerceArticuloID_CONFIGURACION: TIntegerField;
     QMConfWoocommerceArticuloID_A: TIntegerField;
     QMConfWoocommerceArticuloID_PRODUCT: TIntegerField;
     QMConfWoocommerceArticuloULT_SINCRONIZACION: TDateTimeField;
     QMConfWoocommerceArticuloARTICULO: TFIBStringField;
     QMConfWoocommerceArticuloTITULO: TFIBStringField;
     QMConfWoocommerceTaxRuleGroup: TFIBTableSet;
     DSQMConfWoocommerceTaxRuleGroup: TDataSource;
     QMConfWoocommerceTaxRuleGroupID_CONFIGURACION: TIntegerField;
     QMConfWoocommerceTaxRuleGroupID: TIntegerField;
     QMConfWoocommerceTaxRuleGroupDESCRIPCION: TFIBStringField;
     QMConfWoocommerceTaxRuleGroupPAIS: TFIBStringField;
     QMConfWoocommerceTaxRuleGroupTIPO: TIntegerField;
     QMConfWoocommerceTaxRuleGroupTITULO: TFIBStringField;
     QMConfWoocommerceTaxRuleGroupP_IVA: TFloatField;
     QMConfWoocommerceID: TIntegerField;
     QMConfWoocommerceWEB: TFIBStringField;
     QMConfWoocommerceEMPRESA: TIntegerField;
     QMConfWoocommerceCANAL: TIntegerField;
     QMConfWoocommerceSERIE: TFIBStringField;
     QMConfWoocommerceACTIVO: TIntegerField;
     QMConfWoocommercePREFIJO_ART: TFIBStringField;
     QMConfWoocommerceALMACEN: TFIBStringField;
     QMConfWoocommerceAGENTE: TIntegerField;
     QMConfWoocommerceWS_URL: TFIBStringField;
     QMConfWoocommerceID_TIENDA_ARTICULOS: TIntegerField;
     QMConfWoocommerceTARIFA: TFIBStringField;
     QMConfWoocommerceWS_ORDER_STATE: TIntegerField;
     QMConfWoocommerceUTILIZA_REF_WOOCOMMERCE: TIntegerField;
     QMConfWoocommerceART_SIN_CONTROL_STOCK: TIntegerField;
     QMConfWoocommerceVERSION_WORDPRESS: TFIBStringField;
     QMConfWoocommerceWS_VERSION: TFIBStringField;
     QMConfWoocommerceWS_CONSUMER_KEY: TFIBStringField;
     QMConfWoocommerceWS_CONSUMER_SECRET: TFIBStringField;
     QMConfWoocommerceWEB_BACKOFFICE: TFIBStringField;
     QMConfWoocommerceSincID: TIntegerField;
     QMConfWoocommerceSincTIPO: TFIBStringField;
     QMConfWoocommerceSincID_CONFIGURACION: TIntegerField;
     QMConfWoocommerceSincULT_SINCRONIZACION: TDateTimeField;
     QMConfWoocommerceSincULT_REGISTRO: TIntegerField;
     QMConfWoocommerceSincACTIVO: TIntegerField;
     QMConfWoocommerceSincORDEN: TIntegerField;
     QMConfWoocommerceSincTITULO: TFIBStringField;
     QMConfWoocommerceTITULO: TFIBStringField;
     QMConfWoocommerceWS_API_GET: TFIBStringField;
     QMConfWoocommerceWS_API_CALC: TFIBStringField;
     QMConfWoocommerceArticuloREFERENCIA: TFIBStringField;
     QMConfWoocommerceArticuloDESCRIPCION_CORTA: TBlobField;
     QMConfWoocommerceArticuloDESCRIPCION_LARGA: TBlobField;
     QMConfWoocommerceArticuloPRECIO: TFloatField;
     QMConfWoocommerceArticuloTITULO_ARTICULO: TFIBStringField;
     QMConfWoocommerceArticuloPRODUCT_TYPE: TFIBStringField;
     QMConfWoocommerceArticuloID_VARIATION: TIntegerField;
     QMConfWoocommerceArticuloSTOCK: TIntegerField;
     QMConfWoocommerceCLIENTE_BASE: TIntegerField;
     QMProductosWC: TFIBTableSet;
     DSQMProductosWC: TDataSource;
     QMProductosWCID_CONFIGURACION: TIntegerField;
     QMProductosWCID_PRODUCT: TIntegerField;
     QMProductosWCID_VARIATION: TIntegerField;
     QMProductosWCTITLE: TFIBStringField;
     QMProductosWCPRODUCT_TYPE: TFIBStringField;
     QMProductosWCSKU: TFIBStringField;
     QMProductosWCPRICE: TFloatField;
     QMProductosWCSTOCK_QUANTITY: TFloatField;
     QMProductosWCCATALOG_VISIBILITY: TFIBStringField;
     QMProductosWCPRODUCT_WEIGHT: TFloatField;
     QMProductosWCPRODUCT_LENGTH: TFloatField;
     QMProductosWCPRODUCT_WIDTH: TFloatField;
     QMProductosWCPRODUCT_HEIGHT: TFloatField;
     QMProductosWCPRODUCT_UNIT: TFIBStringField;
     QMProductosWCDESCRIPTION: TMemoField;
     QMProductosWCSHORT_DESCRIPTION: TMemoField;
     QMProductosWCPARENT_ID: TIntegerField;
     QMProductosWCDATE_MODIFIED: TDateTimeField;
     QMProductosWCID_A: TIntegerField;
     QMProductosWCARTICULO: TFIBStringField;
     QMProductosWCTITULO_LARGO: TFIBStringField;
     QMProductosWCRAW_JSON: TMemoField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMConfWoocommerceAfterOpen(DataSet: TDataSet);
     procedure QMConfWoocommerceBeforeClose(DataSet: TDataSet);
     procedure QMConfWoocommerceAfterInsert(DataSet: TDataSet);
     procedure QMConfWoocommerceBeforePost(DataSet: TDataSet);
     procedure QMConfWoocommerceSincBeforePost(DataSet: TDataSet);
     procedure QMConfWoocommerceSincNewRecord(DataSet: TDataSet);
     procedure QMConfWoocommerceNewRecord(DataSet: TDataSet);
     procedure QMConfWoocommerceClienteCLIENTEChange(Sender: TField);
     procedure QMConfWoocommerceClienteDirCLIENTEChange(Sender: TField);
     procedure QMConfWoocommerceClienteDirDIRECCIONChange(Sender: TField);
     procedure QMConfWoocommerceArticuloARTICULOChange(Sender: TField);
     procedure QMProductosWCARTICULOChange(Sender: TField);
  private
     { Private declarations }
     Pagina: string;
     //UltimoClienteDireccion: integer;
     //UltimoProveedorDireccion: integer;
     FModoIVACanal: integer;
     Log: TStrings;
     DescripcionAtribtos: TStrings;
     // empresa: integer;
     // canal: integer;
     // serie: string;

     //function SincronizaFabricantes(Desde, Hasta: TDateTime): boolean;
     //function SincronizaFamilias(Desde, Hasta: TDateTime): boolean;
     function SincronizaArticulos(Desde, Hasta: TDateTime): boolean;
     //function SincronizaClientes(IdConfiguracion: integer; Desde, Hasta: TDateTime): boolean;
     function SincronizaOrdenesPedidos(IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; IdEstado: integer; Desde, Hasta: TDateTime): boolean;

     //function SincronizaProveedores(Desde, Hasta: TDateTime): integer;
     //function SincronizaClientesDirecciones(Desde, Hasta: TDateTime; IdAddress: integer = 0): integer;
     //function SincronizaProveedoresDirecciones(Desde, Hasta: TDateTime): integer;
     //function SincronizaOrdenesMovimiento(Desde, Hasta: TDateTime): integer;
     //function SincronizaOrdenesFacturas(Desde, Hasta: TDateTime): integer;
     //function SincronizaCodProvArticulos(Desde, Hasta: TDateTime): integer;

     // procedure SincronizaStock;
     //function DameModoIva: integer;
     function DameFechaUltimaSincronizacion(Tipo: string): TDateTime;
     // function DameRegistroUltimaSincronizacion(Tipo: string): integer;
     function DameIdArticulo(id_configuracion, id_product, id_variation: integer; Actualizar: boolean = True): integer;
     procedure GrabaFechaUltimaSincronizacion(Tipo: string; Fecha: TDateTime);
     // procedure GrabaRegistroUltimaSincronizacion(Tipo: string; Registro: integer);
     //function DameCliente(Empresa, IdCliente: integer): integer;
     //function DameProveedor(Empresa, IdProveedor: integer): integer;
     //function DameFabricante(Empresa, IdFabricante: integer): integer;
     function DameIdClienteWoocommerce(IdConfiguracion, IdCustomer: integer): integer;
     //function DameIdProveedorWoocommerce(IdConfiguracion, IdSupplier: integer): integer;
     //function DameIdFabricanteWoocommerce(IdConfiguracion, IdManufacturer: integer): integer;
     //function DameDireccionWoocommerce(IdConfiguracion, IdAddress, Tercero: integer): integer;
     //function DameIdFamiliaWoocommerce(IdConfiguracion, IdCategory: integer): integer;
     //function DameIdSubFamiliaWoocommerce(IdConfiguracion, IdCategory: integer): integer;
     //function DameCategoriaWoocommerce(IdConfiguracion, IdFamilia: integer): integer;
     //function DameSubCategoriaWoocommerce(IdConfiguracion, IdSubFamilia: integer): integer;
     function MySQLDateTimeToDateTime(s: string): TDateTime;
     // procedure CreaStockInicial;

     // Webservice
     function DameNodo(Nodo: TlkJSONBase; a: array of string): TlkJSONObject;
     function DameDato(Nodo: TlkJSONObject; a: array of string): string;

     //function DameNodoLenguage(Nodo: IXMLNode; lang_id: integer): IXMLNode;
     //function DameDatoLenguage(Nodo: IXMLNode; lang_id: integer): string;

     //procedure SetDatoLenguage(Nodo: IXMLNode; lang_id: integer; s: string);

     //function DameEstado(IdState: integer; Pais: string; CodigoPostal: string = ''): string;
     //function DameLocalidad(IdCountry, IdState: integer; City, PostCode: string): string;
     //function DamePais(IdCountry: integer): string;

     //function DamePorcentajeIVA(id_tax_rules_group, id_country: integer): double;
     //function DameIdTax(id_tax_rules_group, id_country: integer): integer;
     //function DameTaxRate(id_tax: integer): double;

     //function DameNombreAtributo(id_attribute: integer): string;
     //procedure DameDatosCombinacion(id_combination: integer; var ean13, upc, reference, supplier_reference: string; var price, weight, quantity: double; var id_attribute, sufijo_nombre: string);

     //function SincronizaUnaDireccion(IdConfiguracion, id: integer; TerceroAsociado: integer = 0): integer;
     //function SincronizaUnFabricante(id: integer): integer;
     //function SincronizaUnCliente(IdConfiguracion, id_customer: integer): integer;
     //function SincronizaUnaFamilia(Desde, Hasta: TDateTime; id_category: integer; FamiliaPadre: string = ''): boolean;
     // function SincronizaUnArticulo(id_product: integer): integer;
     function SincronizaUnaOrdenPedidos(IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; id_order: integer): integer;
     //function DameCantidadArticulos: integer;
     function DameArticuloALFA_1(Empresa: integer; Referencia: string): string;
     function SincronizaProductType(id_product: integer): integer;
     function SincronizaStockArticulos(Desde, Hasta: TDateTime): integer;
     function SincronizaStockUnArticulo(Articulo: string; id_product, id_variation: integer; Titulo: string): integer;
     function SincronizaPrecioArticulos(Desde, Hasta: TDateTime): integer;
     procedure DameDatosVariacion(id_product, id_variation: integer; var sku, product_name: string; var price, weight: double; stock_quantity: integer; var sufijo_nombre: string);
     function SincronizaListaArticulos(Desde, Hasta: TDateTime): boolean;
  public
     { Public declarations }
     function SincronizaUnArticulo(id_product: integer): integer;
     function SincronizaItemListaArticulo(id_product: integer): integer;
     procedure FiltraTienda(Id: integer);
     procedure SincronizaBase;
     procedure SincronizaTodas;
     procedure SaveLog(FicheroLog: string);
     procedure RellenaEstados(Items, Values: TStrings);
     procedure FiltrarCliente(Valor: string);
     procedure FiltrarDireccion(Valor: string);
     procedure FiltrarArticulo(Valor: string);

     function CrearUnArticulo(IdArticulo: integer; SincronizarSiExiste: boolean = False): integer;
     procedure CrearUnaFamilia(IdFamilia: integer; SincronizarSiExiste: boolean = False);
     procedure CrearUnaSubFamilia(IdFamilia, IdSubFamilia: integer; SincronizarSiExiste: boolean = False);

     // Webservice
     function InicializaWebService: boolean;
     procedure RellenaIdiomasWS(Items, Values: TStrings);
     procedure RellenaEstadosWS(Items, Values: TStrings);
     function HayDetalle: boolean;
     procedure AbreTaxRuleGroups;
     procedure CierraTaxRuleGroups;
     procedure CrearArticulosFiltrados;
     function SincronizaPrecioUnArticulo(Precio: double; id_product, id_variation: integer; Articulo, Titulo: string): integer;
     procedure FiltrarProductosWC(Valor: string; SoloActivos, SoloNoSincronizados: boolean);

  end;

var
  DMSincronizacionTiendaWoocommerce : TDMSincronizacionTiendaWoocommerce;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFSendCorreo, UDMWoocommerce, UFormGest, Dialogs, Math,
  UFMSincronizacionTiendArticuloNuevo, UDMSincronizacion, Variants,
  UFMArticulos;

{$R *.dfm}

function CompareNumbers(List: TStringList; Index1, Index2: integer): integer;
var
  i1, i2 : integer;
begin
  i1 := StrToIntDef(List[Index1], 0);
  i2 := StrToIntDef(List[Index2], 0);
  Result := i1 - i2;
  {
  if (i1 > i2), 0) then
     Result := 1
  else
  if (i1 < i2) then
     Result := -1
  else
     Result := 0;
  }
end;

procedure TDMSincronizacionTiendaWoocommerce.DataModuleCreate(Sender: TObject);
begin
  DMMain.Log('TDMSincronizacionTiendaWoocommerce.DataModuleCreate');
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DescripcionAtribtos := TStringList.Create;
  Log := TStringList.Create;

  AbreData(TDMWoocommerce, DMWoocommerce);

  QMConfWoocommerceArticuloSTOCK.DisplayFormat := MascaraN;

  DMMain.Log('QMConfWoocommerce.Open');
  QMConfWoocommerce.Open;

  FModoIVACanal := -1;
end;

procedure TDMSincronizacionTiendaWoocommerce.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMWoocommerce);
  DescripcionAtribtos.Free;
  Log.Free;
end;

function TDMSincronizacionTiendaWoocommerce.DameFechaUltimaSincronizacion(Tipo: string): TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACTIVO, ULT_SINCRONIZACION FROM SYS_CONF_WOOCOMMERCE_SINC WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND TIPO = :TIPO';
        Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        if (FieldByName['ACTIVO'].AsInteger = 1) then
        begin
           Result := FieldByName['ULT_SINCRONIZACION'].AsDateTime;
           if (Result < EncodeDate(1900, 01, 01)) then
              Result := EncodeDate(2000, 01, 01);
        end
        else
           Result := EncodeDate(1900, 01, 01);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

{
function TDMSincronizacionTiendaWoocommerce.DameRegistroUltimaSincronizacion(Tipo: string): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACTIVO, ULT_REGISTRO FROM SYS_CONF_PRESTASHOP_SINC WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND TIPO = :TIPO';
        Params.ByName['ID_CONFIGURACION'].AsFloat := QMConfWoocommerceID.AsInteger;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        if (FieldByName['ACTIVO'].AsInteger = 1) then
           Result := FieldByName['ULT_REGISTRO'].AsInteger
        else
           Result := -1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}

procedure TDMSincronizacionTiendaWoocommerce.GrabaFechaUltimaSincronizacion(Tipo: string; Fecha: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONF_WOOCOMMERCE_SINC SET ULT_SINCRONIZACION = :ULT_SINCRONIZACION WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND TIPO = :TIPO';
        Params.ByName['ID_CONFIGURACION'].AsFloat := QMConfWoocommerceID.AsInteger;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ULT_SINCRONIZACION'].AsDateTime := Fecha;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

{
procedure TDMSincronizacionTiendaWoocommerce.GrabaRegistroUltimaSincronizacion(Tipo: string; Registro: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONF_PRESTASHOP_SINC SET ULT_REGISTRO = :ULT_REGISTRO WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND TIPO = :TIPO';
        Params.ByName['ID_CONFIGURACION'].AsFloat := QMConfWoocommerceID.AsInteger;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ULT_REGISTRO'].AsInteger := Registro;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
procedure TDMSincronizacionTiendaWoocommerce.SincronizaBase;
var
  FechaHoraSincronizacion : TDateTime;
  // UltimaOrden : integer;
  UltimaSincronizacion : TDateTime;
  // HayError : boolean;
  //FicheroLog : string;
  //SincArticulos1, SincArticulos2 : integer;
begin
  /// Sincroniza los datos de la tienda Woocommerce con la base de datos de la aplicación.
  /// Solo actua si está marcada como activa.

  if (QMConfWoocommerceACTIVO.AsInteger = 1) then
  begin
     Log.Clear;
     Pagina := QMConfWoocommerceWEB.AsString;
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        // FechaHoraSincronizacion := DMWoocommerce.DameFechaServidorMySQL;
        if (InicializaWebService) then
        begin
           FechaHoraSincronizacion := Now;
           if (FechaHoraSincronizacion > 0) then
           begin
              Log.Add(_('Fechas'));
              Log.Add(_('Web') + ': ' + DateTimeToStr(FechaHoraSincronizacion));
              Log.Add(_('Local') + ': ' + DateTimeToStr(Now));
              FSendCorreo.CambiarSizeFont(10);
              FSendCorreo.AlineamientoFont(taLeftJustify);
              FSendCorreo.Show;
              {
              FSendCorreo.Titulo(_('Sincronizando Fabricantes') + ' ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('FAB');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaFabricantes(UltimaSincronizacion, FechaHoraSincronizacion)) then
                    GrabaFechaUltimaSincronizacion('FAB', FechaHoraSincronizacion);
              }
              {
              FSendCorreo.Titulo('Sincronizando Clientes ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('CLI');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if SincronizaClientes(QMConfWoocommerceID.AsInteger, UltimaSincronizacion, FechaHoraSincronizacion) then
                    GrabaFechaUltimaSincronizacion('CLI', FechaHoraSincronizacion);
              }
              {
              FSendCorreo.Titulo(_('Sincronizando Familias') + ' ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('FAM');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
              begin
                 if SincronizaFamilias(UltimaSincronizacion, FechaHoraSincronizacion) then
                    GrabaFechaUltimaSincronizacion('FAM', FechaHoraSincronizacion);
              end;
              }
              FSendCorreo.Titulo(_('Sincronizando Lista de Articulos') + ' ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('LAR');
              DMMain.Log('se obtien UltimaSincronizacion');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
              begin
                 DMMain.Log('UltimaSincronizacion es mayor al 2000');
                 if SincronizaListaArticulos(UltimaSincronizacion, FechaHoraSincronizacion) then
                 begin
                    DMMain.Log('Se sincroniza lista articulo');
                    GrabaFechaUltimaSincronizacion('LAR', FechaHoraSincronizacion);
                 end;
              end;

              FSendCorreo.Titulo(_('Sincronizando Articulos') + ' ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('ART');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
              begin
                 if SincronizaArticulos(UltimaSincronizacion, FechaHoraSincronizacion) then
                    GrabaFechaUltimaSincronizacion('ART', FechaHoraSincronizacion);
              end;

              {
              FSendCorreo.Titulo('Sincronizando Ordenes con Mov. Manuales de Stock' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('MOV');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaOrdenesMovimiento(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                    GrabaFechaUltimaSincronizacion('MOV', FechaHoraSincronizacion);
              }
              FSendCorreo.Titulo('Sincronizando Ordenes con Pedidos' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('PEC');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if SincronizaOrdenesPedidos(QMConfWoocommerceID.AsInteger, QMConfWoocommerceEMPRESA.AsInteger, QMConfWoocommerceCANAL.AsInteger, QMConfWoocommerceSERIE.AsString, QMConfWoocommerceALMACEN.AsString, QMConfWoocommerceWS_ORDER_STATE.AsInteger, UltimaSincronizacion, FechaHoraSincronizacion) then
                    GrabaFechaUltimaSincronizacion('PEC', FechaHoraSincronizacion);

              {FSendCorreo.Titulo('Sincronizando Ordenes con Facturas' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('FAC');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaOrdenesFacturas(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                    GrabaFechaUltimaSincronizacion('FAC', FechaHoraSincronizacion);

              FSendCorreo.Titulo('Sincronizando Proveedores ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('PRO');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaProveedores(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                    GrabaFechaUltimaSincronizacion('PRO', FechaHoraSincronizacion);

              FSendCorreo.Titulo('Sincronizando Direcciones (Proveedores) ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('DIP');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaProveedoresDirecciones(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                    GrabaFechaUltimaSincronizacion('DIP', FechaHoraSincronizacion);

              FSendCorreo.Titulo(_('Sincronizando Codigo de Proveedor de Articulos') + ' ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('CPA');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaCodProvArticulos(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                    GrabaFechaUltimaSincronizacion('CPA', FechaHoraSincronizacion);
              }

              FSendCorreo.Titulo('Sincronizando Stock ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('STO');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaStockArticulos(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                    GrabaFechaUltimaSincronizacion('STO', FechaHoraSincronizacion);

              FSendCorreo.Titulo('Sincronizando Precios ' + Pagina);
              UltimaSincronizacion := DameFechaUltimaSincronizacion('PRE');
              if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                 if (SincronizaPrecioArticulos(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                    GrabaFechaUltimaSincronizacion('PRE', FechaHoraSincronizacion);

              // CreaStockInicial;
           end
           else
           begin
              Log.Add(_('Error de sincronizacion'));
              Log.Add(Format(_('No se pudo obtener la fecha del servidor %s'), [DateTimeToStr(FechaHoraSincronizacion)]));
           end;
        end;
     finally
        FreeAndNil(FSendCorreo);

        SaveLog(DameTempPath + 'Sincronizacion_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.Log');
     end;

     QMConfWoocommerceSinc.Close;
     QMConfWoocommerceSinc.Open;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.SaveLog(FicheroLog: string);
begin
  with Log do
  begin
     if (Count > 0) then
     begin
        Insert(0, Format(_('Sincronizacrion con %s'), [QMConfWoocommerceTITULO.AsString]));
        Insert(1, 'id_lang : ' + IntToStr(DMWoocommerce.id_lang));
        Insert(1, 'id_country : ' + IntToStr(DMWoocommerce.id_country));
        Insert(1, '--');
        SaveToFile(FicheroLog);
        DMMain.AbrirArchivo(FicheroLog);
     end;

     // Limpio despues de guardado
     Clear;
  end;
end;

function TDMSincronizacionTiendaWoocommerce.DameIdArticulo(id_configuracion, id_product, id_variation: integer; Actualizar: boolean = True): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_A FROM SYS_CONF_WOOCOMMERCE_ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_PRODUCT = :ID_PRODUCT AND ');
        SQL.Add(' ID_VARIATION = :ID_VARIATION ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := id_configuracion;
        Params.ByName['ID_PRODUCT'].AsInteger := id_product;
        Params.ByName['ID_VARIATION'].AsInteger := id_variation;
        ExecQuery;
        Result := FieldByName['ID_A'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaListaArticulos(Desde, Hasta: TDateTime): boolean;
var
  i : integer;
  id : integer;
  //id_root_category : integer;
  date_upd : string;
  //attr : string;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONbase;
  //NodoSubcategorias, NodoName : IXMLNode;
  // RegistroInicial, RegistrosAProcesar: integer;
  Page, RegistrosProcesados : integer;
begin
  /// Recorreremos paginas de productos. Page iniciara en 1.
  /// 1. Obtenemos lista de productos del la pagina. Nos devolvera una lista de articulos.
  /// 2. Recorremos los articulos, sincronizandolos si toca y registrando la cantidad de registros procesados
  /// 3. Si hemos procesado productos, incrmenetamos Page y volvemos a empezar.

  DMMain.LogIni('SincronizaListaArticulos');
  try
     Result := True;

     Page := 1;
     WP_Total := 0;
     WP_TotalPages := 0;
     CodigoRespuesta := 0;

     RegistrosProcesados := 1;
     while (RegistrosProcesados > 0) and Result do
     begin
        RegistrosProcesados := 0;
        Log.Add(format(_('Obteniendo Articulos.' + #13#10 + 'Pagina %d'), [Page]));
        FSendCorreo.Texto(format(_('Obteniendo Articulos.' + #13#10 + 'Pagina %d'), [Page]));

        Respuesta := TStringList.Create;
        try
           DMMain.LogIni(format('WS_Get.products(0) page=%d', [page]));
           try
              CodigoRespuesta := DMWoocommerce.WS_Get('products', 0, '&order_by=id&order=asc&_fields=id,date_modified&per_page=100&page=' + IntToStr(Page), Respuesta, WP_Total, WP_TotalPages);
           finally
              DMMain.LogFin('WS_Get.products(0)');
              DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
              DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
              DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
           end;

           {$IFDEF Debug}
           Respuesta.SaveToFile(DameTempPath + format('Respuesta-products-%.3d.json', [Page]));
           {$ENDIF}

           // Si la respuesta es correcta
           if (CodigoRespuesta = 200) then
           begin
              DMMain.Log('Si codrespuesta 200');
              Documento := TlkJSON.ParseText(Respuesta.Text);
              try
                 if Assigned(Documento) then
                 begin
                    DMMain.Log('Assigned(Documento)');

                    NodoPadre := Documento;
                    for i := 0 to NodoPadre.Count - 1 do
                    begin
                       FSendCorreo.Texto(format(_('Obteniendo Articulos.' + #13#10 + 'Pagina %d' + #13#10 + 'Sincronizando Articulo %d - Modificado: %s'), [Page, id, date_upd]));
                       Inc(RegistrosProcesados);

                       nodo := TlkJSONObject(NodoPadre).child[i];
                       id := nodo.Field['id'].Value;
                       date_upd := nodo.Field['date_modified'].Value;
                       DMMain.Log('id_product: ' + IntToStr(id) + ' date_modified:' + date_upd);
                       if ((MySQLDateTimeToDateTime(date_upd) > Desde) and
                          (MySQLDateTimeToDateTime(date_upd) < Hasta)) then
                       begin
                          if (SincronizaItemListaArticulo(id) = 0) then
                             Result := False;
                       end;
                    end;
                 end;
              finally
                 Documento.Free;
              end;
           end
           else
           begin
              ShowMessage('(products)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
              Result := False;
           end;
        finally
           Respuesta.Free;
        end;

        Inc(Page);
     end;
  finally
     DMMain.LogFin('SincronizaListaArticulos');
  end;
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaArticulos(Desde, Hasta: TDateTime): boolean;
var
  i : integer;
  id : integer;
  //id_root_category : integer;
  date_upd : string;
  //attr : string;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONbase;
  //NodoSubcategorias, NodoName : IXMLNode;
  // RegistroInicial, RegistrosAProcesar: integer;
  Page, RegistrosProcesados : integer;
begin
  /// Recorreremos paginas de productos. Page iniciara en 1.
  /// 1. Obtenemos lista de productos del la pagina. Nos devolvera una lista de articulos.
  /// 2. Recorremos los articulos, sincronizandolos si toca y registrando la cantidad de registros procesados
  /// 3. Si hemos procesado productos, incrmenetamos Page y volvemos a empezar.

  DMMain.LogIni('SincronizaArticulos');
  try
     Result := True;

     Page := 1;
     WP_Total := 0;
     WP_TotalPages := 0;
     CodigoRespuesta := 0;

     RegistrosProcesados := 1;
     while (RegistrosProcesados > 0) and Result do
     begin
        RegistrosProcesados := 0;
        Log.Add(format(_('Obteniendo Articulos.' + #13#10 + 'Pagina %d'), [Page]));
        FSendCorreo.Texto(format(_('Obteniendo Articulos.' + #13#10 + 'Pagina %d'), [Page]));

        Respuesta := TStringList.Create;
        try
           DMMain.LogIni(format('WS_Get.products(0) page=%d', [page]));
           try
              CodigoRespuesta := DMWoocommerce.WS_Get('products', 0, '&order_by=id&order=asc&_fields=id,date_modified&per_page=100&page=' + IntToStr(Page), Respuesta, WP_Total, WP_TotalPages);
           finally
              DMMain.LogFin('WS_Get.products(0)');
              DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
              DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
              DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
           end;

           {$IFDEF Debug}
           Respuesta.SaveToFile(DameTempPath + format('Respuesta-products-%.3d.json', [Page]));
           {$ENDIF}

           // Si la respuesta es correcta
           if (CodigoRespuesta = 200) then
           begin
              Documento := TlkJSON.ParseText(Respuesta.Text);
              try
                 if Assigned(Documento) then
                 begin
                    NodoPadre := Documento;
                    for i := 0 to NodoPadre.Count - 1 do
                    begin
                       FSendCorreo.Texto(format(_('Obteniendo Articulos.' + #13#10 + 'Pagina %d' + #13#10 + 'Sincronizando Articulo %d - Modificado: %s'), [Page, id, date_upd]));
                       Inc(RegistrosProcesados);

                       nodo := TlkJSONObject(NodoPadre).child[i];
                       id := nodo.Field['id'].Value;
                       date_upd := nodo.Field['date_modified'].Value;
                       DMMain.Log('id_product: ' + IntToStr(id) + ' date_modified:' + date_upd);
                       if ((MySQLDateTimeToDateTime(date_upd) > Desde) and
                          (MySQLDateTimeToDateTime(date_upd) < Hasta)) then
                       begin
                          if (SincronizaUnArticulo(id) = 0) then
                             Result := False;
                       end;
                    end;
                 end;
              finally
                 Documento.Free;
              end;
           end
           else
           begin
              ShowMessage('(products)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
              Result := False;
           end;
        finally
           Respuesta.Free;
        end;

        Inc(Page);
     end;
  finally
     DMMain.LogFin('SincronizaArticulos');
  end;
end;

{function TDMSincronizacionTiendaWoocommerce.DameNombreAtributo(id_attribute: integer): string;
(*
var
  i, j : integer;
  id : integer;
  nombre : string;
  date_upd : string;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoName : IXMLNode;
  Nodo : IXMLNode;
*)
begin
(*
  /// Obtiene los datos de la combinacion para poder crear articulos.

  // Trato de buscarlo de una suncronizacion previa
  Result := DescripcionAtribtos.Values[IntToStr(id_attribute)];

  if (Result = '') then
  begin
     Log.Add(Format(_('Obteniendo datos Atributo %d'), [id_attribute]));
     FSendCorreo.Texto(Format(_('Obteniendo datos Atributo %d'), [id_attribute]));

     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Obtengo id y nombre de los fabricantes activos
        CodigoRespuesta := DMWoocommerce.WS_Get('product_option_values', id_attribute, '', Respuesta);
       {$IFDEF Debug}
       {Respuesta.SaveToFile(DameTempPath+'Respuesta-product_option_values.xml');
       {$ENDIF}

        // Si la respuesta es correcta
        {if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Recorro los fabricantes
              NodoPadre := DameNodo(Documento.DocumentElement, ['product_option_value']);
              if Assigned(NodoPadre) then
              begin
                 {
                 Nodo := DameNodo(NodoPadre, ['name']);
                 Result := DameDatoLenguage(Nodo, QMConfWoocommerceWS_LANGUAGE.AsInteger);

                 DescripcionAtribtos.Values[IntToStr(id_attribute)] := Result;
                 }
              {end;
           end;
        end
        else
           ShowMessage('(product_option_values)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;
  end;
*)
end;}

{procedure TDMSincronizacionTiendaWoocommerce.DameDatosCombinacion(id_combination: integer; var ean13, upc, reference, supplier_reference: string; var price, weight, quantity: double; var id_attribute, sufijo_nombre: string);
(*
var
  i, j : integer;
  id : integer;
  nombre : string;
  date_upd : string;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoName : IXMLNode;
  Nodo : IXMLNode;

  Atributos : TStrings;
*)
begin
(*
  /// Obtiene los datos de la combinacion para poder crear articulos.

  Log.Add(Format('   ' + _('Obteniendo datos combinacion %d'), [id_combination]));
  FSendCorreo.Texto(Format(_('Obteniendo datos combinacion %d'), [id_combination]));

  ean13 := '';
  upc := '';
  reference := '';
  supplier_reference := '';
  price := 0;
  weight := 0;
  quantity := 0;
  id_attribute := '';
  sufijo_nombre := '';

  Atributos := TStringList.Create;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los fabricantes activos
     CodigoRespuesta := DMWoocommerce.WS_Get('combinations', id_combination, '', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-combinations.xml');
     {$ENDIF}

// Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['combination']);
           if Assigned(NodoPadre) then
           begin
              ean13 := DameDato(NodoPadre, ['ean13']);
              upc := DameDato(NodoPadre, ['upc']);
              reference := DameDato(NodoPadre, ['reference']);
              supplier_reference := DameDato(NodoPadre, ['supplier_reference']);
              price := StrToFloatDec(DameDato(NodoPadre, ['price']), '.');
              weight := StrToFloatDec(DameDato(NodoPadre, ['weight']), '.');
              quantity := StrToFloatDec(DameDato(NodoPadre, ['quantity']), '.');

              Nodo := DameNodo(NodoPadre, ['associations', 'product_option_values', 'product_option_value']);
              while Assigned(Nodo) do
              begin
                 Atributos.Add(DameDato(Nodo, ['id']));
                 Nodo := Nodo.NextSibling;
              end;
              // Ordeno numericamente
              TStringList(Atributos).CustomSort(@CompareNumbers);
              Log.Add(Format('      ' + _('Atributos: %s'), [Atributos.CommaText]));

              id_attribute := Atributos.CommaText;
              while Atributos.Count > 0 do
              begin
                 // Obtengo Datos del atributo para crear el nombre del articulo
                 sufijo_nombre := Trim(sufijo_nombre + ' ' + DameNombreAtributo(StrToInt(Atributos[0])));

                 Atributos.Delete(0);
              end;
           end;
        end;
     end
     else
        ShowMessage('(combinations)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Atributos.Free;
     Respuesta.Free;
     Documento.Free;
  end;
*)
end;}

function TDMSincronizacionTiendaWoocommerce.SincronizaItemListaArticulo(id_product: integer): integer;
var
  i : integer;
  id : integer;
  sku : string;
  //ean13 : string;
  //upc : string;
  product_name : string;
  DescripcionCorta : string;
  DescripcionLarga : string;
  //id_supplier : integer;
  //id_manufacturer : integer;
  stock_quantity : integer;
  price : double;
  weight : double;
  //id_tax_rules_group : integer;
  //PrecioVentaIVAIncluido : double;
  //rate : double;
  date_modified : TDateTime;
  //ArticuloConMismoCodigoBarra : string;
  // Primera Familia - Familia por defecto - La familia del articulo
  //id_category_default : integer;

  { TODO : Tratar estos campos }
  //supplier_reference : string;
  status : string;
  Variaciones, Categorias : TStrings;
  //id_product_attribute : integer;
  //id_attribute : string;
  product_type : string;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Documento, NodoPadre : TlkJSONObject;
  //Nodo : TlkJSONObject;
  JSONArray : TlkJSONList;
  s : string;
  IdFamilia, IdSubFamilia : integer;
  Tarifa : string;
  Precio : double;
  Fabricante : integer;
  Familia, SubFamilia : string;
  id_variation : integer;
  sufijo_nombre : string;
  ArticuloNuevo : boolean;
  sku_variacion : string;
  product_name_variacion : string;
  price_variacion : double;
  weight_variacion : double;
  stock_quantity_variacion : integer;
  catalog_visibility, product_unit : string;
  product_length, product_width, product_height : double;
  parent_id : integer;
begin
  /// Sincroniza el id_product con un articulo.
  /// Si se realiza con exito devuelve el numero de id_articulo asociado
  Log.Add(Format(_('Sincronizando producto %d'), [id_product]));
  DMMain.Log(Format(_('Sincronizando producto %d'), [id_product]));

  Result := 0;
  Tarifa := 'NOR';

  Variaciones := TStringList.Create;
  // Categorias := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     try
        // Obtenemos datos del Producto
        CodigoRespuesta := DMWoocommerce.WS_Get('products', id_product, '', Respuesta, WP_Total, WP_TotalPages);
        DMMain.Log(format('WS_Get.products(%d)', [id_product]));
        DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
        DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
        DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-Products-uno.json');
        {$ENDIF}

        (*
        // Para pruebas
        CodigoRespuesta := 200;
        Respuesta.LoadFromFile(DameTempPath + 'Product-37.json');
        *)

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
           try
              if Assigned(Documento) then
              begin
                 //Nodo := Documento;

                 // Id producto Woocommerce
                 id := StrToIntDef(DameDato(Documento, ['id']), 0);
                 if (id <> id_product) then
                    raise Exception.Create(_('El id de producto a sincronizar no conicide que el id obtenido de Woocommerce'));

                 DMMain.LogIni('Obteniendo datos de JSON');
                 // Nombre producto Woocommerce
                 product_name := DameDato(Documento, ['name']);

                 // simple / variation (articulo simple o articulo con combinaciones)
                 product_type := DameDato(Documento, ['type']);

                 // Peso producto Woocommerce
                 s := DameDato(Documento, ['weight']);
                 try
                    if (s = '') then
                       weight := 0
                    else
                       weight := StrToFloatDec(s, '.');
                 except
                    weight := 0;
                 end;

                 catalog_visibility := DameDato(Documento, ['catalog_visibility']);
                 product_unit := '';
                 product_length := 0;
                 product_height := 0;
                 product_width := 0;
                 parent_id := StrToIntDef(DameDato(Documento, ['parent_id']), 0);

                 // Precio producto Woocommerce
                 { TODO : Averiguar que es el campo "price" que es readonly. }
                 s := DameDato(Documento, ['regular_price']);
                 try
                    if (s = '') then
                       Price := 0
                    else
                       Price := StrToFloatDec(s, '.');
                 except
                    Price := 0;
                 end;

                 // Stock producto Woocommerce
                 s := DameDato(Documento, ['stock_quantity']);
                 try
                    if (s = '') then
                       stock_quantity := 0
                    else
                       stock_quantity := StrToIntDef(s, 0);
                 except
                    stock_quantity := 0;
                 end;

                 // Estado del producto Woocommerce publish, ?, ?, ?
                 status := DameDato(Documento, ['status']);

                 // Fecha de modificacion producto Woocommerce
                 try
                    date_modified := MySQLDateTimeToDateTime(DameDato(Documento, ['date_modified']));
                 except
                    date_modified := EncodeDate(2000, 1, 1);
                 end;

                 // Descripcion corta producto Woocommerce
                 DescripcionCorta := DameDato(Documento, ['short_description']);

                 // Descripcion larga producto Woocommerce
                 DescripcionLarga := DameDato(Documento, ['description']);

                 // Referencia producto Woocommerce
                 sku := DameDato(Documento, ['sku']);
                 DMMain.LogFin('');

                 // Lista de variaciones
                 JSONArray := TlkJSONList(DameNodo(Documento, ['variations']));
                 if Assigned(JSONArray) then
                 begin
                    for i := 0 to JSONArray.Count - 1 do
                       Variaciones.Add(IntToStr(TlkJSONObject(JSONArray.Child[i]).Value));
                 end;

                 // Ordeno numericamente
                 TStringList(Variaciones).CustomSort(@CompareNumbers);

                 if Variaciones.Count = 0 then
                    Variaciones.Add('0');

                 DMMain.Log(format('Sincronizo Producto - id_product: %d, sku: %s - %s', [id_product, sku, product_name]));

                 while Variaciones.Count > 0 do
                 begin
                    id_variation := StrToInt(Variaciones[0]);
                    DMMain.Log(Format('Sincronizando Variacion %d', [id_variation]));

                    sku_variacion := sku;
                    product_name_variacion := product_name;
                    price_variacion := price;
                    weight_variacion := weight;
                    stock_quantity_variacion := stock_quantity;
                    sufijo_nombre := '';

                    if (id_variation <> 0) then
                       DameDatosVariacion(id_product, id_variation, sku_variacion, product_name_variacion, price_variacion, weight_variacion, stock_quantity_variacion, sufijo_nombre);

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          DMMain.Log('ID_CONFIGURACION ' + IntToStr(QMConfWoocommerceID.AsInteger));
                          DMMain.Log('ID_PRODUCT ' + IntToStr(id_product));
                          DMMain.Log('ID_VARIATION ' + IntToStr(id_variation));
                          DMMain.Log('TITULO ' + product_name_variacion);
                          DMMain.Log('TYPE ' + product_type);
                          DMMain.Log('SKU ' + sku_variacion);
                          DMMain.Log('DESCRIPCION_CORTA ' + DescripcionCorta);
                          DMMain.Log('DESCRIPCION_LARGA ' + DescripcionLarga);
                          DMMain.Log('PRECIO ' + FloatToStr(price_variacion));
                          DMMain.Log('STOCK ' + IntToStr(stock_quantity_variacion));
                          DMMain.Log('ULT_SINCRONIZACION ' + DateTimeToStr(date_modified));

                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_WOOCOMMERCE_PRODUCT ( ');
                          SQL.Add(' ID_CONFIGURACION, ID_PRODUCT, ID_VARIATION, TITLE, PRODUCT_TYPE, SKU, PRICE, STOCK_QUANTITY, CATALOG_VISIBILITY, ');
                          SQL.Add(' PRODUCT_WEIGHT, PRODUCT_LENGTH, PRODUCT_WIDTH, PRODUCT_HEIGHT, PRODUCT_UNIT, DESCRIPTION, SHORT_DESCRIPTION, PARENT_ID, ');
                          SQL.Add(' DATE_MODIFIED, RAW_JSON) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :ID_CONFIGURACION, :ID_PRODUCT, :ID_VARIATION, :TITLE, :PRODUCT_TYPE, :SKU, :PRICE, :STOCK_QUANTITY, ');
                          SQL.Add(' :CATALOG_VISIBILITY, :PRODUCT_WEIGHT, :PRODUCT_LENGTH, :PRODUCT_WIDTH, :PRODUCT_HEIGHT, :PRODUCT_UNIT, :DESCRIPTION, ');
                          SQL.Add(' :SHORT_DESCRIPTION, :PARENT_ID, :DATE_MODIFIED, :RAW_JSON) ');
                          SQL.Add(' MATCHING (ID_CONFIGURACION, ID_PRODUCT, ID_VARIATION) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                          Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                          Params.ByName['ID_VARIATION'].AsInteger := id_variation;
                          // Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := id_stock_available;
                          Params.ByName['TITLE'].AsString := Copy(Trim(product_name_variacion), 1, 256);
                          // Params.ByName['PRODUCT_NAME'].AsString := Copy(Trim(product_name), 1, 256);
                          Params.ByName['PRODUCT_TYPE'].AsString := Copy(product_type, 1, 40);
                          Params.ByName['SKU'].AsString := Copy(sku_variacion, 1, 40);
                          Params.ByName['PRICE'].AsFloat := price_variacion;
                          Params.ByName['STOCK_QUANTITY'].AsFloat := stock_quantity_variacion;
                          Params.ByName['CATALOG_VISIBILITY'].AsString := catalog_visibility;
                          Params.ByName['PRODUCT_WEIGHT'].AsFloat := weight_variacion;
                          Params.ByName['PRODUCT_LENGTH'].AsFloat := product_length;
                          Params.ByName['PRODUCT_WIDTH'].AsFloat := product_width;
                          Params.ByName['PRODUCT_HEIGHT'].AsFloat := product_height;
                          Params.ByName['PRODUCT_UNIT'].AsString := product_unit;
                          Params.ByName['DESCRIPTION'].AsString := DescripcionCorta;
                          Params.ByName['SHORT_DESCRIPTION'].AsString := DescripcionLarga;
                          Params.ByName['PARENT_ID'].AsInteger := parent_id;
                          Params.ByName['DATE_MODIFIED'].AsDateTime := date_modified;
                          Params.ByName['RAW_JSON'].AsString := Respuesta.Text;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    Variaciones.Delete(0);
                 end;
              end
              else
              begin
                 Log.Add('ERROR Sincronizando lista de articulos ****************************');
                 Log.Add('      Respuesta vacia');
              end;
           finally
              Documento.Free;
           end;

           Result := id_product;
        end
        else
           ShowMessage('(product)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     except
        on E: Exception do
        begin
           Log.Add(Format(_('No se ha podido obtener el producto con id (%d)') + #13#10 + E.Message, [id_product]));
           DMMain.Log(format(_('No se ha podido obtener el producto con id (%d)') + #13#10 + E.Message, [id_product]));
        end;
     end;
  finally
     Variaciones.Free;
     Respuesta.Free;
  end;
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaUnArticulo(id_product: integer): integer;
(*
var
  i, f : integer;
  id_product : integer;
  id_product_attribute : integer;
  id_product_equi : integer;
  id_attribute : string;
  id_attribute_equi : string;
  Pais : string;
  TipoIVA : integer;
  CtaCompras : string;
  CtaVentas : string;
  CtaDevolucionCompras : string;
  CtaDevolucionVentas : string;
  CtaAbonoCompras : string;
  CtaAbonoVentas : string;
  Disponibilidad : integer;
  date_upd : TDateTime;
  id_a : integer;
  CodigoBarra : string;
  DM : TDMWoocommerce;
  ControlStock : boolean;
  s : string;
  Precio : double;
  Accion : string;
  A : TArticulo;
*)
var
  i : integer;
  id : integer;
  sku : string;
  //ean13 : string;
  //upc : string;
  product_name : string;
  DescripcionCorta : string;
  DescripcionLarga : string;
  //id_supplier : integer;
  id_manufacturer : integer;
  stock_quantity : integer;
  price : double;
  weight : double;
  id_tax_rules_group : integer;
  PrecioVentaIVAIncluido : double;
  rate : double;
  date_upd : TDateTime;
  ArticuloConMismoCodigoBarra : string;
  // Primera Familia - Familia por defecto - La familia del articulo
  id_category_default : integer;

  { TODO : Tratar estos campos }
  supplier_reference : string;
  status : string;
  Variaciones, Categorias : TStrings;
  id_product_attribute : integer;
  id_attribute : string;
  product_type : string;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONObject;
  JSONArray : TlkJSONList;
  s : string;
  A : TArticulo;
  id_a, IdFamilia, IdSubFamilia : integer;
  Tarifa : string;
  Precio : double;
  Fabricante : integer;
  Familia, SubFamilia : string;
  id_variation : integer;
  sufijo_nombre : string;
  ArticuloNuevo : boolean;
  sku_variacion : string;
  product_name_variacion : string;
  price_variacion : double;
  weight_variacion : double;
  stock_quantity_variacion : integer;
begin
  /// Sincroniza el id_product con un articulo.
  /// Si se realiza con exito devuelve el numero de id_articulo asociado
  Log.Add(Format(_('Sincronizando producto %d'), [id_product]));
  DMMain.Log(Format(_('Sincronizando producto %d'), [id_product]));

  Result := 0;
  Tarifa := 'NOR';

  Variaciones := TStringList.Create;
  // Categorias := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     try
        // Obtenemos datos del Producto
        CodigoRespuesta := DMWoocommerce.WS_Get('products', id_product, '', Respuesta, WP_Total, WP_TotalPages);
        DMMain.Log(format('WS_Get.products(%d)', [id_product]));
        DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
        DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
        DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-Products-uno.json');
        {$ENDIF}

        (*
        // Para pruebas
        CodigoRespuesta := 200;
        Respuesta.LoadFromFile(DameTempPath + 'Product-37.json');
        *)

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
           try
              if Assigned(Documento) then
              begin
                 //Nodo := Documento;

                 // Id producto Woocommerce
                 id := StrToIntDef(DameDato(Documento, ['id']), 0);
                 if (id <> id_product) then
                    raise Exception.Create(_('El id de producto a sincronizar no conicide que el id obtenido de Woocommerce'));

                 DMMain.LogIni('Obteniendo datos de JSON');
                 // Nombre producto Woocommerce
                 product_name := DameDato(Documento, ['name']);

                 // simple / variation (articulo simple o articulo con combinaciones)
                 product_type := DameDato(Documento, ['type']);

                 // Peso producto Woocommerce
                 s := DameDato(Documento, ['weight']);
                 try
                    if (s = '') then
                       weight := 0
                    else
                       weight := StrToFloatDec(s, '.');
                 except
                    weight := 0;
                 end;

                 // Precio producto Woocommerce
                 { TODO : Averiguar que es el campo "price" que es readonly. }
                 s := DameDato(Documento, ['regular_price']);
                 try
                    if (s = '') then
                       Price := 0
                    else
                       Price := StrToFloatDec(s, '.');
                 except
                    Price := 0;
                 end;

                 // Stock producto Woocommerce
                 s := DameDato(Documento, ['stock_quantity']);
                 try
                    if (s = '') then
                       stock_quantity := 0
                    else
                       stock_quantity := StrToIntDef(s, 0);
                 except
                    stock_quantity := 0;
                 end;

                 // Estado del producto Woocommerce publish, ?, ?, ?
                 status := DameDato(Documento, ['status']);

                 // Fecha de modificacion producto Woocommerce
                 try
                    date_upd := MySQLDateTimeToDateTime(DameDato(Documento, ['date_modified']));
                 except
                    date_upd := Now;
                 end;

                 // Descripcion corta producto Woocommerce
                 DescripcionCorta := DameDato(Documento, ['short_description']);

                 // Descripcion larga producto Woocommerce
                 DescripcionLarga := DameDato(Documento, ['description']);

                 // Referencia producto Woocommerce
                 sku := DameDato(Documento, ['sku']);
                 DMMain.LogFin('');

                 // Lista de variaciones
                 JSONArray := TlkJSONList(DameNodo(Documento, ['variations']));
                 if Assigned(JSONArray) then
                 begin
                    for i := 0 to JSONArray.Count - 1 do
                       Variaciones.Add(IntToStr(TlkJSONObject(JSONArray.Child[i]).Value));
                 end;

                 // Ordeno numericamente
                 TStringList(Variaciones).CustomSort(@CompareNumbers);

                 if Variaciones.Count = 0 then
                    Variaciones.Add('0');

                 DMMain.Log(format('Sincronizo Producto - id_product: %d, sku: %s - %s', [id_product, sku, product_name]));

                 while Variaciones.Count > 0 do
                 begin
                    id_variation := StrToInt(Variaciones[0]);
                    DMMain.Log(Format('Sincronizando Variacion %d', [id_variation]));

                    sku_variacion := sku;
                    product_name_variacion := product_name;
                    price_variacion := price;
                    weight_variacion := weight;
                    stock_quantity_variacion := stock_quantity;
                    sufijo_nombre := '';

                    if (id_variation <> 0) then
                       DameDatosVariacion(id_product, id_variation, sku_variacion, product_name_variacion, price_variacion, weight_variacion, stock_quantity_variacion, sufijo_nombre);

                    // Creamos objeto articulo y le asignamos valores
                    InicializaArticulo(A);

                    // Verificamos si ya esta sincronizado
                    id_a := DameIdArticulo(QMConfWoocommerceID.AsInteger, id_product, id_variation);

                    // Obtengo el código de artículo a utilizar
                    if (id_a <> 0) then
                       A.Articulo := DameArticulo(id_a)
                    else
                    begin
                       // Busco un artículo con ALFA_1 = SKU
                       A.Articulo := DameArticuloALFA_1(QMConfWoocommerceEMPRESA.AsInteger, sku_variacion);

                       // Si no encuentro un articulo con el ALFA_1 = SKU creo un codigo nuevo
                       if (A.Articulo = '') then
                       begin
                          if (QMConfWoocommerceUTILIZA_REF_WOOCOMMERCE.AsInteger = 1) then
                             A.Articulo := Trim(Copy(sku_variacion, 1, 15))
                          else
                             A.Articulo := Trim(QMConfWoocommercePREFIJO_ART.AsString + IntToStr(id_product));
                       end;
                    end;

                    if (id_a = 0) then
                    begin
                       Log[Log.Count - 1] := Format(_('Sincronizando producto %6.d (  NUEVO  ) Art.: %-15s - SKU: %-15s - %s'), [id_product, A.Articulo, sku_variacion, product_name_variacion]);
                       DMMain.Log(format('Articulo (NUEVO): %s', [A.Articulo]));
                       ArticuloNuevo := True;
                    end
                    else
                    begin
                       Log[Log.Count - 1] := Format(_('Sincronizando producto %6.d (EXISTENTE) Art.: %-15s - SKU: %-15s - %s'), [id_product, A.Articulo, sku_variacion, product_name_variacion]);
                       ArticuloNuevo := False;
                    end;

                    if (ArticuloNuevo) then
                       A.Titulo := Copy(Trim(product_name_variacion), 1, 256)
                    else
                       A.Familia := DMMain.DameFamiliaArticulo(A.Articulo, A.Empresa);

                    // Guardo en ALFA_1 el SKU original de Woocommerce
                    A.Alfa_1 := Copy(sku_variacion, 1, 40);

                    A.Empresa := QMConfWoocommerceEMPRESA.AsInteger;
                    A.Ejercicio := REntorno.Ejercicio;
                    A.Canal := REntorno.Canal;

                    A.Peso := weight_variacion;

                    if (QMConfWoocommerceART_SIN_CONTROL_STOCK.AsInteger = 1) then
                       A.control_stock := 0
                    else
                       A.control_stock := 1;

                    A.web := 1;

                    if (A.Articulo <> '') then
                    begin
                       CreaArticulo(A);

                       // PrecioVentaIvaIncluido := price + (price * rate / 100);

                       // Obtengo el ID del articulo creado/modificado
                       id_a := UDameDato.DameIdArticulo(A.Articulo, A.Empresa);
                       Tarifa := 'NOR';

                       if (DameIdArticulo(QMConfWoocommerceID.AsInteger, id_product, id_variation) = 0) then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                DMMain.Log('ID_CONFIGURACION ' + IntToStr(QMConfWoocommerceID.AsInteger));
                                DMMain.Log('ID_PRODUCT ' + IntToStr(id_product));
                                DMMain.Log('ID_VARIATION ' + IntToStr(id_variation));
                                DMMain.Log('ID_A ' + IntToStr(id_a));
                                DMMain.Log('TITULO ' + product_name_variacion);
                                DMMain.Log('TYPE ' + product_type);
                                DMMain.Log('SKU ' + sku_variacion);
                                DMMain.Log('DESCRIPCION_CORTA ' + DescripcionCorta);
                                DMMain.Log('DESCRIPCION_LARGA ' + DescripcionLarga);
                                DMMain.Log('PRECIO ' + FloatToStr(price_variacion));
                                DMMain.Log('STOCK ' + IntToStr(stock_quantity_variacion));
                                DMMain.Log('ULT_SINCRONIZACION ' + DateTimeToStr(date_upd));

                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO SYS_CONF_WOOCOMMERCE_ARTICULO ( ');
                                SQL.Add(' ID_CONFIGURACION, ID_A, ID_PRODUCT, ID_VARIATION, TITULO, REFERENCIA, PRECIO, STOCK, DESCRIPCION_CORTA, DESCRIPCION_LARGA, PRODUCT_TYPE) ');
                                SQL.Add(' VALUES ( ');
                                SQL.Add(' :ID_CONFIGURACION, :ID_A, :ID_PRODUCT, :ID_VARIATION, :TITULO, :REFERENCIA, :PRECIO, :STOCK, :DESCRIPCION_CORTA, :DESCRIPCION_LARGA, :PRODUCT_TYPE) ');
                                Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                                Params.ByName['ID_A'].AsInteger := id_a;
                                Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                                Params.ByName['ID_VARIATION'].AsInteger := id_variation;
                                // Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := id_stock_available;
                                Params.ByName['TITULO'].AsString := Copy(product_name_variacion, 1, 256);
                                Params.ByName['REFERENCIA'].AsString := Copy(sku_variacion, 1, 40);
                                Params.ByName['DESCRIPCION_CORTA'].AsString := DescripcionCorta;
                                Params.ByName['DESCRIPCION_LARGA'].AsString := DescripcionLarga;
                                Params.ByName['PRECIO'].AsFloat := price_variacion;
                                Params.ByName['STOCK'].AsInteger := stock_quantity_variacion;
                                Params.ByName['PRODUCT_TYPE'].AsString := product_type;
                                {
                                if (product_type = 'simple') then
                                   Params.ByName['PRODUCT_TYPE'].AsInteger := 0
                                else
                                if (product_type = 'variable') then
                                   Params.ByName['PRODUCT_TYPE'].AsInteger := 1
                                else
                                   Params.ByName['PRODUCT_TYPE'].AsInteger := -1;
                                }
                                // Params.ByName['ULT_SINCRONIZACION'].AsDateTime := MySQLDateTimeToDateTime(date_upd);

                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end
                       else
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                DMMain.Log('UPDATE SYS_CONF_WOOCOMMERCE_ARTICULO');
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' UPDATE SYS_CONF_WOOCOMMERCE_ARTICULO ');
                                SQL.Add(' SET  ');
                                SQL.Add(' ULT_SINCRONIZACION = :ULT_SINCRONIZACION, ');
                                //  SQL.Add(' ID_STOCK_AVAILABLE = :ID_STOCK_AVAILABLE, ');
                                SQL.Add(' TITULO = :TITULO, ');
                                SQL.Add(' REFERENCIA = :REFERENCIA, ');
                                SQL.Add(' DESCRIPCION_CORTA = :DESCRIPCION_CORTA, ');
                                SQL.Add(' DESCRIPCION_LARGA = :DESCRIPCION_LARGA, ');
                                SQL.Add(' PRECIO = :PRECIO, ');
                                SQL.Add(' STOCK = :STOCK, ');
                                SQL.Add(' PRODUCT_TYPE = :PRODUCT_TYPE ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                                SQL.Add(' ID_PRODUCT = :ID_PRODUCT AND ');
                                SQL.Add(' ID_VARIATION = :ID_VARIATION ');
                                Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                                Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                                Params.ByName['ID_VARIATION'].AsInteger := id_variation;
                                //  Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := id_stock_available;
                                Params.ByName['TITULO'].AsString := Copy(product_name_variacion, 1, 256);
                                Params.ByName['REFERENCIA'].AsString := Copy(sku_variacion, 1, 40);
                                Params.ByName['DESCRIPCION_CORTA'].AsString := DescripcionCorta;
                                Params.ByName['DESCRIPCION_LARGA'].AsString := DescripcionLarga;
                                Params.ByName['PRECIO'].AsFloat := price_variacion;
                                Params.ByName['STOCK'].AsInteger := stock_quantity_variacion;
                                Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                                Params.ByName['PRODUCT_TYPE'].AsString := product_type;
                                {
                                if (product_type = 'simple') then
                                   Params.ByName['PRODUCT_TYPE'].AsInteger := 0
                                else
                                if (product_type = 'variable') then
                                   Params.ByName['PRODUCT_TYPE'].AsInteger := 1
                                else
                                   Params.ByName['PRODUCT_TYPE'].AsInteger := -1;
                                }
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;

                      {
                      // Actualizo el precio de la tarifa de venta
                      if (TarifaEsIvaIncluido(Tarifa, QMConfWoocommerceEMPRESA.AsInteger)) then
                         Precio := PrecioVentaIvaIncluido
                      else
                      }
                       Precio := price_variacion;

                       ActualizaPrecio(A.Articulo, Precio, Tarifa, QMConfWoocommerceEMPRESA.AsInteger);

                    (*
                    if (ean13 > '') then
                    begin
                       // EAN13 Verifico si otro artículo está utilizando el mismo código de barras
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'SELECT FIRST (1) ARTICULO FROM ART_ARTICULOS_BARRAS WHERE ID_A <> :ID_A AND EMPRESA = :EMPRESA AND BARRAS = :BARRAS';
                             Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                             Params.ByName['ID_A'].AsInteger := id_a;
                             Params.ByName['BARRAS'].AsString := ean13;
                             ExecQuery;
                             ArticuloConMismoCodigoBarra := Trim(FieldByName['ARTICULO'].AsString);
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       if (ArticuloConMismoCodigoBarra = '') then
                       begin
                          // Inserto el codigo de barras si no existe
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO ART_ARTICULOS_BARRAS ( ');
                                SQL.Add(' EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION, ID_A) ');
                                SQL.Add(' SELECT :EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION, :ID_A ');
                                SQL.Add(' FROM RDB$DATABASE ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' NOT EXISTS(SELECT EMPRESA ');
                                SQL.Add('            FROM ART_ARTICULOS_BARRAS ');
                                SQL.Add('            WHERE ');
                                SQL.Add('            EMPRESA = :EMPRESA AND ');
                                SQL.Add('            BARRAS = :BARRAS AND ');
                                SQL.Add('            ID_A = :ID_A) ');
                                Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                                Params.ByName['BARRAS'].AsString := ean13;
                                Params.ByName['ARTICULO'].AsString := Copy(A.Articulo, 1, 15);
                                Params.ByName['TIPO'].AsInteger := 3;
                                Params.ByName['FUNCION'].AsInteger := 0;
                                Params.ByName['ID_A'].AsInteger := id_a;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end
                       else
                          Log.Add(Format(_('Ya existe un articulo con mismo cod. barras. (Insertando: (%d) %s - %s, Cod. Barras (EAN13): %s)'), [id_product, reference, A.Titulo, ean13]));
                    end;
                    *)

                    (*
                    if (upc > '') then
                    begin
                       // UPC Verifico si otro artículo está utilizando el mismo código de barras
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'SELECT FIRST (1) ARTICULO FROM ART_ARTICULOS_BARRAS WHERE ID_A <> :ID_A AND EMPRESA = :EMPRESA AND BARRAS = :BARRAS';
                             Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                             Params.ByName['ID_A'].AsInteger := id_a;
                             Params.ByName['BARRAS'].AsString := upc;
                             ExecQuery;
                             ArticuloConMismoCodigoBarra := Trim(FieldByName['ARTICULO'].AsString);
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       if (ArticuloConMismoCodigoBarra = '') then
                       begin
                          // Inserto el codigo de barras si no existe
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO ART_ARTICULOS_BARRAS ( ');
                                SQL.Add(' EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION, ID_A) ');
                                SQL.Add(' SELECT :EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION, :ID_A ');
                                SQL.Add(' FROM RDB$DATABASE ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' NOT EXISTS(SELECT EMPRESA ');
                                SQL.Add('            FROM ART_ARTICULOS_BARRAS ');
                                SQL.Add('            WHERE ');
                                SQL.Add('            EMPRESA = :EMPRESA AND ');
                                SQL.Add('            BARRAS = :BARRAS AND ');
                                SQL.Add('            ID_A = :ID_A) ');
                                Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                                Params.ByName['BARRAS'].AsString := upc;
                                Params.ByName['ARTICULO'].AsString := Copy(A.Articulo, 1, 15);
                                Params.ByName['TIPO'].AsInteger := 4;
                                Params.ByName['FUNCION'].AsInteger := 0;
                                Params.ByName['ID_A'].AsInteger := id_a;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end
                       else
                          Log.Add(Format(_('Ya existe un articulo con mismo cod. barras. (Insertando: (%d) %s - %s, Cod. Barras (UPC): %s)'), [id_product, reference, A.Titulo, upc]));
                    end;
                   *)
                    end;

                    Variaciones.Delete(0);
                 end;
              end
              else
              begin
                 Log.Add('ERROR Sincronizando articulos ****************************');
                 Log.Add('      No se puede crear artículo sin codigo');
              end;
           finally
              Documento.Free;
           end;

           Result := id_a;
        end
        else
           ShowMessage('(product)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     except
        on E: Exception do
        begin
           Log.Add(Format(_('No se ha podido crear el articulo con id_a (%d)') + #13#10 + E.Message, [id_a]));
           DMMain.Log(format(_('No se ha podido crear el articulo con id_a (%d)') + #13#10 + E.Message, [id_a]));
        end;
     end;
  finally
     Variaciones.Free;
     Respuesta.Free;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.DameDatosVariacion(id_product, id_variation: integer; var sku, product_name: string; var price, weight: double; stock_quantity: integer; var sufijo_nombre: string);
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  WP_Total, WP_TotalPages : integer;
  Documento : TlkJSONObject;
  //NodoPadre, Nodo : TlkJSONObject;
  JSONArray : TlkJSONList;
  i : integer;
  s : string;

  id : integer;
  status : string;
  date_upd : TDateTime;
begin
  Log.Add(Format(_('Sincronizando Variacion %d'), [id_variation]));
  DMMain.Log(Format(_('Sincronizando Variacion %d'), [id_variation]));

  Respuesta := TStringList.Create;
  try
     try
        // Obtenemos datos del Producto
        CodigoRespuesta := DMWoocommerce.WS_Get(format('products/%d/variations', [id_product]), id_variation, '', Respuesta, WP_Total, WP_TotalPages);
        DMMain.Log(format('products/%d/variations/%d', [id_product, id_variation]));
        DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
        DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
        DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-Products-Variations-uno.json');
        {$ENDIF}

        (*
        // Para Pruebas
        CodigoRespuesta := 200;
        Respuesta.LoadFromFile(DameTempPath + 'Product-37-Variations-39.json');
        *)

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
           try
              if Assigned(Documento) then
              begin
                 // Id Variacion Woocommerce
                 id := StrToIntDef(DameDato(Documento, ['id']), 0);
                 if (id <> id_variation) then
                    raise Exception.Create(_('El id de Variacion a sincronizar no conicide que el id obtenido de Woocommerce'));

                 DMMain.LogIni('Obteniendo datos de JSON');

                 // Nombre producto-variacion Woocommerce
                 s := DameDato(Documento, ['description']);
                 if (Trim(s) > '') then
                    product_name := s;

                 // Peso producto Woocommerce
                 s := DameDato(Documento, ['weight']);
                 try
                    if (s = '') then
                       weight := 0
                    else
                       weight := StrToFloatDec(s, '.');
                 except
                    weight := 0;
                 end;

                 // Precio producto Woocommerce
                 { TODO : Averiguar que es el campo "price" que es readonly. }
                 s := DameDato(Documento, ['regular_price']);
                 try
                    if (s = '') then
                       Price := 0
                    else
                       Price := StrToFloatDec(s, '.');
                 except
                    Price := 0;
                 end;

                 // Stock producto Woocommerce
                 s := DameDato(Documento, ['stock_quantity']);
                 try
                    if (s = '') then
                       stock_quantity := 0
                    else
                       stock_quantity := StrToIntDef(s, 0);
                 except
                    stock_quantity := 0;
                 end;

                 // Estado del producto Woocommerce publish, ?, ?, ?
                 status := DameDato(Documento, ['status']);

                 // Fecha de modificacion producto Woocommerce
                 try
                    date_upd := MySQLDateTimeToDateTime(DameDato(Documento, ['date_modified']));
                 except
                    date_upd := Now;
                 end;

                 // Referencia producto Woocommerce
                 s := DameDato(Documento, ['sku']);
                 if (Trim(s) > '') then
                    sku := s;

                 // Lista de variaciones
                 JSONArray := TlkJSONList(DameNodo(Documento, ['attributes']));
                 if Assigned(JSONArray) then
                 begin
                    for i := 0 to JSONArray.Count - 1 do
                       sufijo_nombre := sufijo_nombre + DameDato(TlkJSONObject(JSONArray.Child[i]), ['option']) + ' ';
                 end;
                 sufijo_nombre := Trim(sufijo_nombre);

                 product_name := product_name + ' ' + sufijo_nombre;

                 DMMain.LogFin('');
              end
              else
              begin
                 Log.Add('ERROR Sincronizando variacion ****************************');
                 Log.Add('      No se ha recibido respuesta');
              end;
           finally
              Documento.Free;
           end;
        end
        else
           ShowMessage('(variation)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     except
        on E: Exception do
        begin
           Log.Add(Format(_('No se ha podido obtener variacion (%d)') + #13#10 + E.Message, [id_variation]));
           DMMain.Log(format(_('No se ha podido obtener variacion (%d)') + #13#10 + E.Message, [id_variation]));
        end;
     end;
  finally
     Respuesta.Free;
  end;
end;

function TDMSincronizacionTiendaWoocommerce.DameIdClienteWoocommerce(IdConfiguracion, IdCustomer: integer): integer;
begin

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_CLIENTE ');
        SQL.Add(' FROM SYS_CONF_WOOCOMMERCE_CLIENTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_CUSTOMER = :ID_CUSTOMER ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_CUSTOMER'].AsInteger := IdCustomer;
        ExecQuery;
        Result := FieldByName['ID_CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

{function TDMSincronizacionTiendaWoocommerce.DameIdProveedorWoocommerce(IdConfiguracion, IdSupplier: integer): integer;
begin
  (*
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_PROVEEDOR ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_PROVEEDOR ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_SUPPLIER = :ID_SUPPLIER ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_SUPPLIER'].AsInteger := IdSupplier;
        ExecQuery;
        Result := FieldByName['ID_PROVEEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  *)
end;}

{function TDMSincronizacionTiendaWoocommerce.DameIdFabricanteWoocommerce(IdConfiguracion, IdManufacturer: integer): integer;
begin
  /// Por ahora el fabricante y el tercero es lo mismo.
  /// Se utiliza en la ficha del articulo.

  (*
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_FABRICANTE ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_FABRICANTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_MANUFACTURER = :ID_MANUFACTURER ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_MANUFACTURER'].AsInteger := IdManufacturer;
        ExecQuery;
        Result := FieldByName['ID_FABRICANTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  *)
end;}


{function TDMSincronizacionTiendaWoocommerce.DameCliente(Empresa, IdCliente: integer): integer;
begin
  /// Devuelve el cliente de un IdCliente.
  /// Se requiere la empresa porqe puede que no sea de la que se quiera

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CLIENTE ');
        SQL.Add(' FROM EMP_CLIENTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ID_CLIENTE = :ID_CLIENTE ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ID_CLIENTE'].AsInteger := IdCliente;
        ExecQuery;
        Result := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;}

{function TDMSincronizacionTiendaWoocommerce.DameProveedor(Empresa, IdProveedor: integer): integer;
begin
  /// Devuelve el proveedor de un IdProveedor.
  /// Se requiere la empresa porqe puede que no sea de la que se quiera

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PROVEEDOR ');
        SQL.Add(' FROM EMP_PROVEEDORES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ID_PROVEEDOR = :ID_PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ID_PROVEEDOR'].AsInteger := IdProveedor;
        ExecQuery;
        Result := FieldByName['PROVEEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;}

{function TDMSincronizacionTiendaWoocommerce.DameFabricante(Empresa, IdFabricante: integer): integer;
begin
  /// El fabricante y el tercero en este momento es lo mismo

  Result := IdFabricante;
end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaClientes(IdConfiguracion: integer; Desde, Hasta: TDateTime): boolean;
(*
var
  i : integer;
  id, id_root_category : integer;
  date_upd : string;
  attr : string;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONbase;
  NodoSubcategorias, NodoName : IXMLNode;
  // RegistroInicial, RegistrosAProcesar: integer;
  Page, RegistrosProcesados : integer;*)
begin
  (*DMMain.LogIni('SincronizaClientes');
  try
     Result := True;

     Page := 1;
     WP_Total := 0;
     WP_TotalPages := 0;
     CodigoRespuesta := 0;

     RegistrosProcesados := 1;
     while (RegistrosProcesados > 0) and Result do
     begin
        RegistrosProcesados := 0;
        Log.Add(format(_('Obteniendo Clientes.' + #13#10 + 'Pagina %d'), [Page]));
        FSendCorreo.Texto(format(_('Obteniendo Clientes.' + #13#10 + 'Pagina %d'), [Page]));

        Respuesta := TStringList.Create;
        try
           DMMain.LogIni(format('WS_Get.customers(0) page=%d', [page]));
           try
              CodigoRespuesta := DMWoocommerce.WS_Get('customers', 0, '&order_by=id&order=asc&_fields=id,date_modified&per_page=100&page=' + IntToStr(Page), Respuesta, WP_Total, WP_TotalPages);
           finally
              DMMain.LogFin('WS_Get.customers(0)');
              DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
              DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
              DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
           end;

           {$IFDEF Debug}
           {Respuesta.SaveToFile(DameTempPath + format('Respuesta-customers-%.3d.json', [Page]));
           {$ENDIF}

// Si la respuesta es correcta
           {if (CodigoRespuesta = 200) then
           begin
              Documento := TlkJSON.ParseText(Respuesta.Text);
              try
                 if Assigned(Documento) then
                 begin
                    NodoPadre := Documento;
                    for i := 0 to NodoPadre.Count - 1 do
                    begin
                       FSendCorreo.Texto(format(_('Obteniendo Clientes.' + #13#10 + 'Pagina %d' + #13#10 + 'Sincronizando Cliente %d - Modificado: %s'), [Page, id, date_upd]));
                       Inc(RegistrosProcesados);

                       nodo := TlkJSONObject(NodoPadre).child[i];
                       id := nodo.Field['id'].Value;
                       date_upd := nodo.Field['date_modified'].Value;
                       DMMain.Log('IdConfiguracion: ' + IntToStr(IdConfiguracion) +', id_customer: ' + IntToStr(id) + ', date_modified:' + date_upd);
                       {if ((MySQLDateTimeToDateTime(date_upd) > Desde) and
                          (MySQLDateTimeToDateTime(date_upd) < Hasta)) then
                       begin}
                          {if (SincronizaUnCliente(IdConfiguracion, id) = 0) then
                             Result := False;
                       //end;
                    end;
                 end;
              finally
                 Documento.Free;
              end;
           end
           else
           begin
              ShowMessage('(customers)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
              Result := False;
           end;
        finally
           Respuesta.Free;
        end;

        Inc(Page);
     end;
  finally
     DMMain.LogFin('SincronizaClientes');
  end;  *)}
{end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaUnCliente(IdConfiguracion, id_customer: integer): integer;
(*
var
  i : integer;
  id : integer;
  company : string;
  date_upd : string;

  id_address : integer;

  Tercero, TerceroAsociado : integer;
  ClienteAsociado : integer;
  C : TCliente;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
*)
  //var
  //last_name : string;
  //first_name : string;
  //FechaModificacion, FechaCreacion : string;
  //Fecha : TDateTime;
  //Pais, Pais_cliente : string;
  //WP_Total, WP_TotalPages : integer;
  //Documento, NodoPadre, Nodo : TlkJSONObject;
  //Respuesta : TStrings;
  //CodigoRespuesta : integer;
  //id : integer;
  //FirstName, LastName, Direccion_literal, Ciudad, CodigoPostal, email : string;
  //C : TCliente;
 { i : integer;
  id : integer;
  sku : string;
  ean13 : string;
  upc : string;
  product_name : string;
  DescripcionCorta : string;
  DescripcionLarga : string;
  id_supplier : integer;
  id_manufacturer : integer;
  stock_quantity : integer;
  price : double;
  weight : double;
  id_tax_rules_group : integer;
  PrecioVentaIVAIncluido : double;
  rate : double;
  date_upd : TDateTime;
  ArticuloConMismoCodigoBarra : string;
  // Primera Familia - Familia por defecto - La familia del articulo
  id_category_default : integer;    }

{ TODO : Tratar estos campos }
 { supplier_reference : string;
  status : string;
  Variaciones, Categorias : TStrings;
  id_product_attribute : integer;
  id_attribute : string;

  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONObject;
  JSONArray : TlkJSONList;
  s : string;
  A : TArticulo;
  id_a, IdFamilia, IdSubFamilia : integer;
  Tarifa : string;
  Precio : double;
  Fabricante : integer;
  Familia, SubFamilia : string;
  id_variation : integer;
  sufijo_nombre : string;
  ArticuloNuevo : boolean;
  sku_variacion : string;
  product_name_variacion : string;
  price_variacion : double;
  weight_variacion : double;
  //  stock_quantity_variacion : integer;  }
{begin
  // Sincroniza el id_customer con un cliente.
  // Si se realiza con exito devuelve el numero de cliente asociado.
  // Si no tiene direccion no se sincroniza, pero devuelve -1. (Tratándolo como un WARNING)
 (*
  Log.Add(Format(_('Sincronizando cliente %d'), [id_customer]));
  DMMain.Log(Format(_('Sincronizando cliente %d'), [id_customer]));

  InicializaCliente(C);
  if (QMConfPrestaShopCLIENTE_BASE.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           SQL.Add('SELECT FIRST 1 TERCERO, CLIENTE, PAIS, PAIS_C2, AGENTE, TIPO,  CUENTA, CUENTA_COMPRA, ');
           SQL.Add('CUENTA_DTOCIAL, CUENTA_DTOPP, CUENTA_IRPF, CUENTA_VENTA, DESCUENTO_CIAL, DESCUENTO_PP, MODO_IVA, TARIFA,FORMA_PAGO ');
           SQL.Add('FROM VER_CLIENTES_CUENTAS ');
           SQL.Add('WHERE ');
           SQL.Add('EMPRESA = :EMPRESA AND ');
           SQL.Add('EJERCICIO = :EJERCICIO AND ');
           SQL.Add('CANAL = :CANAL AND ');
           SQL.Add('CLIENTE = :CLIENTE_BASE ');
           Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CLIENTE_BASE'].AsInteger := QMConfPrestaShopCLIENTE_BASE.AsInteger;
           ExecQuery;
           if (FieldByName['CLIENTE'].AsInteger > 0) then
           begin
              c.Empresa := QMConfPrestaShopEMPRESA.AsInteger;
              c.Ejercicio := REntorno.Ejercicio;
              c.Canal := REntorno.Canal;
              c.Tipo := FieldByName['TIPO'].AsInteger;
              c.Agente := FieldByName['AGENTE'].AsInteger;
              c.Tarifa := FieldByName['TARIFA'].AsString;
              c.FormaPago := FieldByName['FORMA_PAGO'].AsString;
           end;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Result := 0;
//  Tarifa := 'NOR';

  Respuesta := TStringList.Create;
  try
     try
        // Obtenemos datos del Producto
        CodigoRespuesta := DMWoocommerce.WS_Get('customers', id_customer, '', Respuesta, WP_Total, WP_TotalPages);
        DMMain.Log(format('WS_Get.customers(%d)', [id_customer]));
        DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
        DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
        DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
        {$IFDEF Debug}
        {Respuesta.SaveToFile(DameTempPath + 'Respuesta-Customers-uno.json');
        {$ENDIF}

// Si la respuesta es correcta
        {if (CodigoRespuesta = 200) then
        begin
           Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
           try
              if Assigned(Documento) then
              begin

                 NodoPadre := Documento;
                 // Id producto Woocommerce
                 id := StrToIntDef(DameDato(NodoPadre, ['id']), 0);
                 if (id <> id_customer) then
                    raise Exception.Create(_('El id de cliente a sincronizar no conicide que el id obtenido de Woocommerce'));

                 DMMain.LogIni('Obteniendo datos JSON Id customer:' + IntToStr(id));

                FechaCreacion := DameDato(NodoPadre, ['date_created']);
                DMMain.Log(format('FechaCreacion(%s)', [FechaCreacion]));
                Fecha := DateISO8601ToDateTime(FechaCreacion);

                FechaModificacion := DameDato(NodoPadre, ['date_modified']);
                DMMain.Log(format('FechaModificacion(%s)', [FechaModificacion]));

                /**/email := DameDato(NodoPadre, ['email']);
                DMMain.Log(format('email(%s)', [email]));

                 //Obtenemos datos de la direccion de envio del cliente
                 Nodo := DameNodo(NodoPadre, ['shipping']);

                 /**/FirstName := DameDato(Nodo, ['first_name']);
                 DMMain.Log(format('FirstName(%s)', [FirstName]));

                 /**/LastName := DameDato(Nodo, ['last_name']);
                 DMMain.Log(format('last_name(%s)', [LastName]));

                 /**/Company := DameDato(Nodo, ['Company']);
                 DMMain.Log(format('Company(%s)', [Company]));

                 Direccion_literal := DameDato(Nodo, ['address_1']);
                 DMMain.Log(format('Direccion(%s)', [Direccion_literal]));

                 Ciudad := DameDato(Nodo, ['city']);
                 DMMain.Log(format('Ciudad(%s)', [Ciudad]));

                 CodigoPostal := DameDato(Nodo, ['postcode']);
                 DMMain.Log(format('CodigoPostal(%s)', [CodigoPostal]));

                 Pais_cliente := DameDato(Nodo, ['country']);
                 DMMain.Log(format('Pais(%s)', [Pais]));

                 Pais := DamePais(Pais_cliente);
                 DMMain.Log(format('Pais(%s)', [Pais]));
              end
              else
                 Log.Add('ERROR de lectura JSon - Al acceder a la informnacion del Cliente ');
           finally
              Documento.Free;
           end;

           // Id de cliente, Cliente y Tercero relacionado con el id prestashop
           with C do
           begin
              C.Empresa := QMConfWoocommerceEMPRESA.AsInteger;
              IdCliente := DameIdClienteWoocommerce(IdConfiguracion, id);
              Cliente := DMMain.DameCliente(QMConfWoocommerceEMPRESA.AsInteger, IdCliente);
              Tercero.email := email;
           end;
           TerceroAsociado := DameTercero('CLI', C.Cliente, QMConfWoocommerceEMPRESA.AsInteger);
           ClienteAsociado := C.Cliente;

           //El id_address sera el id customer porque la relacion es uno a uno
           id_address := id;

           // Sincronizamos direccion  y obtenemos tercero,
           Tercero := SincronizaUnaDireccion(IdConfiguracion, id_address, TerceroAsociado);



          {Log.Add(Format(_('Sincronizando direccion %d'), [id]));
            Result := 0;


            // Si dni viene vacio utilizo vat_number (se da en caso de extranjeros)
            if (dni = '') then
               dni := vat_number;

            DireccionAsociada := DameDireccionWoocommerce(IdConfiguracion, id, TerceroAsociado);

            InicializaTercero(ATercero);

            with ATercero do
            begin
               if (company > '') then
                  NombreRSocial := Copy(company, 1, 60)
               else
                  NombreRSocial := Copy(firstname + ' ' + lastname, 1, 60);
               Nif := dni;
               Tercero := TerceroAsociado;

               Telefono1 := Copy(phone, 1, 15);
               Telefono2 := Copy(phone_mobile, 1, 15);
            end;

            with ATercero.Direccion do
            begin
               Direccion := DireccionAsociada;

               Pais := DamePais(id_country);
               CodigoPostal := postcode;
               Provincia := DameEstado(id_state, Pais, CodigoPostal);
               Localidad := city;
               DirNombre1 := Copy(address1, 1, 40);
               DirNombre2 := Copy(address2, 1, 40);
               DirNombre3 := Copy(company, 1, 40);
               DirTelefono1 := Copy(phone, 1, 15);
               DirTelefono2 := Copy(phone_mobile, 1, 15);
               Notas := 'Importacion Woocommerce:';
               Notas := Notas + #13#10 + Format('id: %d', [id]);
               Notas := Notas + #13#10 + Format('address1: %s', [address1]);
               Notas := Notas + #13#10 + Format('address2: %s', [address2]);
               Notas := Notas + #13#10 + Format('city: %s', [city]);
               Notas := Notas + #13#10 + Format('postcode: %s', [postcode]);
               Notas := Notas + #13#10 + Format('phone: %s', [phone]);
               Notas := Notas + #13#10 + Format('phone_mobile: %s', [phone_mobile]);
               Notas := Notas + #13#10 + Format('vat_number: %s', [vat_number]);
               Notas := Notas + #13#10 + Format('dni: %s', [dni]);
               Notas := Notas + #13#10 + Format('date_upd: %s', [date_upd]);
            end;

            // Esto crea/modifica el tercero y la direccion
            CreaTercero(ATercero);

            // Si no habia direccion le creo un contacto asociado y la relaciono a la direccion Woocommerce
            if (DireccionAsociada = 0) then
            begin
               // Creo un contacto asociado a la dirección con datos de nombre, teléfono, etc. que podría ser usados como destinatario de la factura
               with THYFIBQuery.Create(nil) do
               begin
                  try
                     Close;
                     DataBase := DMMain.DataBase;
                     SQL.Add(' INSERT INTO SYS_TERCEROS_CONTACTOS ');
                     SQL.Add(' (TERCERO, CONTACTO, NOMBRE, APELLIDOS, ');
                     SQL.Add(' MOVIL, TELEFONO, FAX, EXTENSION, CORREO, ');
                     SQL.Add(' /*NOTAS,*/ DIRECCION, PADRE, DEPARTAMENTO) ');
                     SQL.Add(' VALUES ');
                     SQL.Add(' (:TERCERO, :CONTACTO, :NOMBRE, :APELLIDOS, ');
                     SQL.Add(' :MOVIL, :TELEFONO, :FAX, :EXTENSION, :CORREO, ');
                     SQL.Add(' /*:NOTAS,*/ :DIRECCION, :PADRE, :DEPARTAMENTO) ');
                     Params.ByName['TERCERO'].AsInteger := ATercero.Tercero;
                     Params.ByName['CONTACTO'].AsInteger := 0;
                     Params.ByName['DIRECCION'].AsInteger := ATercero.Direccion.Direccion;
                     Params.ByName['NOMBRE'].AsString := Trim(Copy(firstname, 1, 40));
                     Params.ByName['APELLIDOS'].AsString := Trim(Copy(lastname, 1, 40));
                     Params.ByName['MOVIL'].AsString := Trim(Copy(phone_mobile, 1, 15));
                     Params.ByName['TELEFONO'].AsString := Trim(Copy(phone, 1, 15));
                     Params.ByName['FAX'].AsString := '';
                     Params.ByName['EXTENSION'].AsString := '';
                     Params.ByName['CORREO'].AsString := Trim(Copy('', 1, 100));
                     Params.ByName['PADRE'].AsInteger := 0;
                     Params.ByName['DEPARTAMENTO'].AsString := '';
                     // Params.ByName['NOTAS'].AsString := 'id_address ' + IntToStr(id_address) + #13#10 + #13#10 + 'id_customer ' + IntToStr(id_customer) + #13#10 + phone + ' - ' + phone_mobile + #13#10 + 'dni ' + dni + #13#10 + 'company ' + company + #13#10 + 'lastname ' + lastname + #13#10 + 'firstname ' + firstname;
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
                     SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_CLIENTE_DIR (ID_CONFIGURACION, ID_ADDRESS, TERCERO, DIRECCION) ');
                     SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_ADDRESS, :TERCERO, :DIRECCION) ');
                     Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                     Params.ByName['ID_ADDRESS'].AsInteger := id;
                     Params.ByName['TERCERO'].AsInteger := ATercero.Tercero;
                     Params.ByName['DIRECCION'].AsInteger := ATercero.Direccion.Direccion;
                     // Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                     ExecQuery;
                     FreeHandle;
                  finally
                     Free;
                  end;
               end;
            end;

            Result := ATercero.Tercero;
          }

           {
           TerceroAsociado := Tercero;

           Result := id;
        end
        else
           ShowMessage('(product)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     except
        on E: Exception do
        begin
           Log.Add(Format(_('No se ha podido crear el cliente con id (%d)') + #13#10 + E.Message, [id]));
           DMMain.Log(format(_('No se ha podido crear el cliente con id (%d)') + #13#10 + E.Message, [id]));
        end;
     end;
  finally
     Respuesta.Free;
  end;
*)
end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaProveedores(Desde, Hasta: TDateTime): integer;
begin
  { TODO : Falta implementar }
  {Result := -1;
end;}

{function TDMSincronizacionTiendaWoocommerce.DameModoIva: integer;
begin
  // Consulta para obtener el modo de iva del canal
  if (FModoIVACanal = -1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL';
           Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FModoIVACanal := FieldByName['MODO_IVA'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  Result := FModoIVACanal;}
{end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaClientesDirecciones(Desde, Hasta: TDateTime; IdAddress: integer = 0): integer;
begin
  Result := -1;
  { TODO : Falta implementar }
{end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaProveedoresDirecciones(Desde, Hasta: TDateTime): integer;
begin
  Result := -1;
  { TODO : Falta implementar }
{end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaOrdenesMovimiento(Desde, Hasta: TDateTime): integer;
begin
  Result := -1;
  { TODO : Falta implementar }
{end;}

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMConfWoocommerceAfterOpen');
  try
     DMMain.Log('QMConfWoocommerceSinc.Open');
     QMConfWoocommerceSinc.Open;
     DMMain.Log('QMConfWoocommerceCliente.Open');
     QMConfWoocommerceCliente.Open;
     DMMain.Log('QMConfWoocommerceClienteDir.Open');
     QMConfWoocommerceClienteDir.Open;
     DMMain.Log('QMConfWoocommerceArticulo.Open');
     QMConfWoocommerceArticulo.Open;
     DMMain.Log('QMProductosWC.Open');
     QMProductosWC.Open;
  finally
     DMMain.LogFin('');
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceBeforeClose(DataSet: TDataSet);
begin
  QMConfWoocommerceSinc.Close;
  QMConfWoocommerceCliente.Close;
  QMConfWoocommerceClienteDir.Close;
  QMConfWoocommerceArticulo.Close;
  QMProductosWC.Close;
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceAfterInsert(DataSet: TDataSet);
begin
  QMConfWoocommerceSinc.Close;
  QMConfWoocommerceSinc.Open;
  QMConfWoocommerceCliente.Close;
  QMConfWoocommerceCliente.Open;
  QMConfWoocommerceClienteDir.Close;
  QMConfWoocommerceClienteDir.Open;
  QMProductosWC.Close;
  QMProductosWC.Open;
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceBeforePost(DataSet: TDataSet);
var
  Version : string;
  s : string;
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_CONF_WOOCOMMERCE', 'ID');

  // Aseguro que la direccion termine con /
  s := QMConfWoocommerceWS_URL.AsString;
  if (s > '') and (Copy(s, Length(s), 1) <> '/') then
     QMConfWoocommerceWS_URL.AsString := QMConfWoocommerceWS_URL.AsString + '/';

  if ((QMConfWoocommerceACTIVO.AsInteger = 1) and (QMConfWoocommerceWS_URL.AsString > '') and (QMConfWoocommerceWS_CONSUMER_KEY.AsString > '') and (QMConfWoocommerceWS_CONSUMER_SECRET.AsString > '')) then
  begin
     if (DMSincronizacionTiendaWoocommerce.InicializaWebService) then
     begin
        Version := DMWoocommerce.WS_DameVersionWS;
        if (Trim(Version) > '') then
           QMConfWoocommerceWS_VERSION.AsString := Version;

        Version := DMWoocommerce.WS_DameVersionWP;
        if (Trim(Version) > '') then
           QMConfWoocommerceVERSION_WORDPRESS.AsString := Version;
     end;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceSincBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_CONF_WOOCOMMERCE', 'ID');
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceSincNewRecord(DataSet: TDataSet);
begin
  QMConfWoocommerceSincID_CONFIGURACION.AsInteger := QMConfWoocommerceID.AsInteger;
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaOrdenesPedidos(IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; IdEstado: integer; Desde, Hasta: TDateTime): boolean;
var
  id : integer;
  date_upd : string;
  Page, RegistrosProcesados : integer;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Respuesta : TStrings;
  Documento, NodoPadre, Nodo : TlkJSONbase;
  i : integer;
  status : string;
(*  i, j : integer;
  id : integer;
  reference : string;
  current_state : integer;
  date_upd : string;

  Opciones : string;
  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoName : IXMLNode;
  Nodo : IXMLNode;
*)
begin
  DMMain.LogIni('Sincroniza Ordenes');
  try
     Result := True;

     Page := 1;
     WP_Total := 0;
     WP_TotalPages := 0;
     CodigoRespuesta := 0;

     RegistrosProcesados := 1;
     while (RegistrosProcesados > 0) and Result do
     begin
        RegistrosProcesados := 0;
        Log.Add(format(_('Obteniendo Pedidos.' + #13#10 + 'Pagina %d'), [Page]));
        FSendCorreo.Texto(format(_('Obteniendo Pedidos.' + #13#10 + 'Pagina %d'), [Page]));

        Respuesta := TStringList.Create;
        try
           DMMain.LogIni(format('WS_Get.orders(0) page=%d', [page]));
           try
              CodigoRespuesta := DMWoocommerce.WS_Get('orders', 0, '&order_by=id&order=asc&_fields=id,date_modified,status&per_page=100&page=' + IntToStr(Page), Respuesta, WP_Total, WP_TotalPages);
           finally
              DMMain.LogFin('WS_Get.orders(0)');
              DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
              DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
              DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
           end;

           {$IFDEF Debug}
           Respuesta.SaveToFile(DameTempPath + format('Respuesta-orders-%.3d.json', [Page]));
           {$ENDIF}

           // Si la respuesta es correcta
           if (CodigoRespuesta = 200) then
           begin
              DMMain.Log('CodigoRespuesta : 200');
              Documento := TlkJSON.ParseText(Respuesta.Text);
              try
                 if Assigned(Documento) then
                 begin
                    NodoPadre := Documento;
                    for i := 0 to NodoPadre.Count - 1 do
                    begin
                       Inc(RegistrosProcesados);
                       nodo := TlkJSONObject(NodoPadre).child[i];
                       id := nodo.Field['id'].Value;
                       date_upd := nodo.Field['date_modified'].Value;
                       status := nodo.Field['status'].Value;
                       FSendCorreo.Texto(format(_('Obteniendo Pedidos.' + #13#10 + 'Pagina %d' + #13#10 + 'Sincronizando pedido %d - Modificado: %s' + #13#10 + 'Status: %s'), [Page, id, date_upd, status]));
                       DMMain.Log('id_order: ' + IntToStr(id) + ' date_modified:' + date_upd);
                       if ((MySQLDateTimeToDateTime(date_upd) > Desde) and
                          (MySQLDateTimeToDateTime(date_upd) < Hasta) and
                          (status = 'completed')) then
                       begin
                          if (SincronizaUnaOrdenPedidos(IdConfiguracion, Empresa, Canal, Serie, Almacen, id) = 0) then
                             Result := False;
                       end;
                    end;
                 end;
              finally
                 Documento.Free;
              end;
           end
           else
           begin
              ShowMessage('(orders)' + _('No se ha podido obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
              Result := False;
           end;
        finally
           Respuesta.Free;
        end;

        Inc(Page);
     end;
  finally
     DMMain.LogFin('Sincroniza Ordenes');
  end;
(*
  Log.Add(_('Obteniendo Ordenes'));
  /// Sincroniza orders con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  Result := False;
  FSendCorreo.Texto(_('Obteniendo Ordenes'));

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id, referencia y estado de las ordenes filtradas por estado.
     Opciones := '&display=[id,reference,current_state,date_upd]&filter[current_state]=[' + IntToStr(IdEstado) + ']&sort=[id_ASC]';

     // Aparentemente esta version de Woocommerce no tiene el campo current_state filtrable.
   {  if (QMConfWoocommerceVERSION_WOOCOMMERCE.AsString = '1.6.0.14') then
        Opciones := '&display=[id,reference,current_state,date_upd]&sort=[id_ASC]';}

     CodigoRespuesta := DMWoocommerce.WS_Get('orders', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-orders.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['orders']);
           if Assigned(NodoPadre) then
           begin
              Result := True;
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToInt(DameDato(Nodo, ['id']));
                 reference := DameDato(Nodo, ['reference']);
                 current_state := StrToInt(DameDato(Nodo, ['current_state']));
                 date_upd := DameDato(Nodo, ['date_upd']);

                 // Sincronizo todas las ordenes que tengan estado deseado
                 if (current_state = IdEstado) then
                 begin
                    // Sincronizo. Espero numero de id_s.
                    if (SincronizaUnaOrdenPedidos(IdConfiguracion, Empresa, Canal, Serie, Almacen, id) = 0) then
                       Result := False;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(orders)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
*)
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaUnaOrdenPedidos(IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; id_order: integer): integer;
var
  ImporteTotal, ImporteTotalTax, ShippingTotal, ShippingTax : double;
  i, j, k : integer;
  id : integer;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONObject;
  NodoDetalle : TlkJSONList;
  FirstName, LastName, Direccion_literal, Ciudad, postcode, CodigoPostal, email, nombre_producto, sku_producto, Telefono : string;
  id_order_detail, producto_id, variation_id, producto_cantidad : integer;
  producto_precio : double;
  FechaModificacion, FechaCreacion : string;
  id_customer : integer;
  id_address_invoice : integer;
  id_address_delivery : integer;
  id_s : integer;
  IdCliente : integer;
  Cliente : integer;
  Tercero : integer;
  Direccion : integer;
  DireccionEntrega : integer;
  Ejercicio : integer;
  ModoIVA : integer;
  Fecha : TDateTime;
  Contacto : integer;
  Estado : integer;
  RIG : integer;
  Tarifa : string;
  WP_Total, WP_TotalPages : integer;
  Transportista : integer;
  id_detalles_s : integer;
  id_a : integer;
  Articulo : string;
  TipoIVA : integer;
  PorcentajeIVA : double;
  Pais, Pais_c2 : string;
  TarifaIvaIncluido : boolean;
begin
  /// Sincroniza orders con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve ID_S
  Log.Add(Format(_('Sincronizando order %d'), [id_order]));
  DMMain.Log(Format(_('Sincronizando order %d'), [id_order]));

  Result := 0;
  Tarifa := 'NOR';

  // Variaciones := TStringList.Create;
  // Categorias := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     try
        // Obtenemos datos de la orden
        CodigoRespuesta := DMWoocommerce.WS_Get('orders', id_order, '', Respuesta, WP_Total, WP_TotalPages);
        DMMain.Log(format('WS_Get.orders(%d)', [id_order]));
        DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
        DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
        DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));

        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-orders-uno.json');
        {$ENDIF}

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           DMMain.Log('CodigoRespuesta = 200');
           Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
           try
              if Assigned(Documento) then
              begin
                 DMMain.Log('Assigned Documento');
                 NodoPadre := Documento;
                 id := NodoPadre.Field['id'].Value;
                 FechaCreacion := DameDato(NodoPadre, ['date_created']);
                 Fecha := DateISO8601ToDateTime(FechaCreacion);
                 FechaModificacion := DameDato(NodoPadre, ['date_modified']);
                 id_customer := StrToIntDef(DameDato(NodoPadre, ['customer_id']), 0);
                 Direccion := 1;
                 //Importe Total
                 ImporteTotal := StrToFloatDec(DameDato(NodoPadre, ['total']), '.');
                 //Importe Total Taxes
                 ImporteTotalTax := StrToFloatDec(DameDato(NodoPadre, ['total_tax']), '.');
                 //Total gastos de envio
                 ShippingTotal := StrToFloatDec(DameDato(NodoPadre, ['shipping_total']), '.');
                 ShippingTax := StrToFloatDec(DameDato(NodoPadre, ['shipping_tax']), '.');
                 Nodo := DameNodo(NodoPadre, ['billing']);
                 FirstName := DameDato(Nodo, ['first_name']);
                 LastName := DameDato(Nodo, ['last_name']);
                 Direccion_literal := DameDato(Nodo, ['address_1']);
                 Pais_c2 := DameDato(Nodo, ['country']);
                 // Obtenemos codigo pais desde codigo pais_c2
                 Pais := UDameDato.DamePais(Pais_c2);
                 // Si no tiene pais, asignamos el pais del entorno
                 if (Pais = '') then
                    Pais := REntorno.Pais;

                 Ciudad := DameDato(Nodo, ['city']);

                 postcode := DameDato(Nodo, ['postcode']);

                 // Esto funciona para Chile.
                 if (REntorno.Pais = 'CHL') then
                 begin
                    if (postcode > '') then
                    begin
                       // Verificamos si existe el codigo postal
                       if (not DMMain.ExisteCodigoPostal(Pais, postcode)) then
                       begin
                          // Probamos buscar el codigo postal suponiendo que han escrito el nombre.
                          CodigoPostal := DMMain.DameCodigoPostal(REntorno.Pais, postcode);
                       end;
                    end;
                 end
                 else
                 begin
                    // Esto funciona para España.
                    if (postcode > '') then
                    begin
                      {
                      with THYFIBQuery.Create(nil) do
                      begin
                         try
                            Close;
                            DataBase := DMMain.DataBase;
                            SQL.Add(' SELECT FIRST 1 LOCALIDAD ');
                            SQL.Add(' FROM SYS_LOCALIDADES ');
                            SQL.Add(' WHERE ');
                            SQL.Add(' PAIS = :PAIS AND ');
                            SQL.Add(' CODIGO_POSTAL = :CODIGO_POSTAL ');
                            SQL.Add(' ORDER BY LOCALIDAD ');
                            Params.ByName['PAIS'].AsString := Pais;
                            Params.ByName['CODIGO_POSTAL'].AsString := postcode;
                            ExecQuery;
                            Localidad := FieldByName['LOCALIDAD'].AsString;
                            FreeHandle;
                         finally
                            Free;
                         end;
                      end;
                      }
                    end;
                 end;

                 email := DameDato(Nodo, ['email']);
                 Telefono := DameDato(Nodo, ['phone']);

                 Ejercicio := DameEjercicio(QMConfWoocommerceEMPRESA.AsInteger, Fecha);

                 {$IFDEF Debug}
                 DMMain.Log(format('FechaCreacion (%s)', [FechaCreacion]));
                 DMMain.Log(format('FechaModificacion (%s)', [FechaModificacion]));
                 DMMain.Log(format('id_customer (%d)', [id_customer]));
                 DMMain.Log(format('ImporteTotal (%n)', [ImporteTotal]));
                 DMMain.Log(format('ImporteTotalTax (%n)', [ImporteTotalTax]));
                 DMMain.Log(format('ShippingTotal (%n)', [ShippingTotal]));
                 DMMain.Log(format('ShippingTax (%n)', [ShippingTax]));
                 DMMain.Log(format('first_name (%s)', [FirstName]));
                 DMMain.Log(format('last_name (%s)', [LastName]));
                 DMMain.Log(format('address_1 (%s)', [Direccion_literal]));
                 DMMain.Log(format('city (%s)', [Ciudad]));
                 DMMain.Log(format('postcode (%s)', [postcode]));
                 DMMain.Log(format('CodigoPostal (%s) (obtenido a partir de postcode)', [CodigoPostal]));
                 DMMain.Log(format('country (%s)', [Pais_c2]));
                 DMMain.Log(format('Pais (%s) (obtenido a partid de country)', [Pais]));
                 DMMain.Log(format('email (%s)', [email]));
                 DMMain.Log(format('Telefono (%s)', [Telefono]));
                 {$ENDIF}

                 // Verificamos si la orden ya esta sincronizada con un pedido
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Clear;
                       SQL.Add(' SELECT ID_S FROM SYS_CONF_WOOCOMMERCE_PEC ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ID_ORDER = :ID_ORDER ');
                       Params.ByName['ID_CONFIGURACION'].AsInteger := Idconfiguracion;
                       Params.ByName['ID_ORDER'].AsInteger := id_order;
                       ExecQuery;
                       id_s := FieldByName['ID_S'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 DMMain.Log(format('Orden esta sincronizada con un pedido (ID_S): %d', [id_s]));

                 IdCliente := DameIdClienteWoocommerce(IdConfiguracion, id_customer);
                 DMMain.Log(format('IdConfiguracion: %d - id_customer: %d --> IdCliente: %d', [IdConfiguracion, id_customer, IdCliente]));

                 // Asignamos el cliente -1 al documento
                 Cliente := -1;
                 DMMain.Log('Forzamos Cliente: -1');

                 Tercero := DameTercero('CLI', Cliente, Empresa);
                 DMMain.Log('Tercero: ' + IntToStr(Tercero));

                 if (Tercero = 0) then
                    Log.Add(format('Error obteniendo Tercero (Cliente=%d)', [Cliente]));

                 // Obtenemos datos del cliente

                 // Tarifa y Transportista por defecto del cliente
                 // ---------------------------------------------------------------
                 // Se podria tener en cuenta:
                 //    id_carrier,
                 //    carrier_tax_rate,
                 //    delivery_number,
                 //    delivery_date,
                 //    shipping_number
                 // ---------------------------------------------------------------
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT TARIFA, TRANSPORTISTA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
                       Params.ByName['EMPRESA'].AsInteger := Empresa;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       ExecQuery;
                       Tarifa := FieldByName['TARIFA'].AsString;
                       Transportista := FieldByName['TRANSPORTISTA'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 DMMain.Log('Tarifa: ' + Tarifa);
                 DMMain.Log('Transportista: ' + IntToStr(Transportista));

                 // Contacto asociado a la dirección.
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT CONTACTO FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO = :TERCERO AND DIRECCION = :DIRECCION';
                       Params.ByName['TERCERO'].AsInteger := Tercero;
                       Params.ByName['DIRECCION'].AsInteger := Direccion;
                       ExecQuery;
                       Contacto := FieldByName['CONTACTO'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 DMMain.Log('Contacto: ' + IntToStr(Contacto));

                 // Si no existe el pedido se  crea la cabecera
                 if (id_s = 0) then
                 begin
                    DMMain.Log('Crea cabecera');

                    // Obtengo Modo de IVA para el pedido según la direccion de facturación.
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' SELECT C.CLIENTE, CC.MODO_IVA, L.PROVINCIA, L.PAIS, P.PERTENECE_CEE ');
                          SQL.Add(' FROM CON_CUENTAS_GES_CLI CC ');
                          SQL.Add(' JOIN EMP_CLIENTES C ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
                          SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO ');
                          SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
                          SQL.Add(' JOIN SYS_PAISES P ON L.PAIS = P.PAIS ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' CC.EMPRESA = :EMPRESA AND ');
                          SQL.Add(' CC.EJERCICIO = :EJERCICIO AND ');
                          SQL.Add(' CC.CANAL = :CANAL AND ');
                          SQL.Add(' CC.CLIENTE = :CLIENTE AND ');
                          SQL.Add(' D.DIRECCION = :DIRECCION ');
                          Params.ByName['EMPRESA'].AsInteger := Empresa;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := Canal;
                          Params.ByName['CLIENTE'].AsInteger := Cliente;
                          Params.ByName['DIRECCION'].AsInteger := Direccion;
                          ExecQuery;

                          { TODO : PARAMETRIZAR! }
                          // El modo de IVA siempre será 1
                          ModoIVA := 1;
                       {
                       if (FieldByName['PAIS'].AsString = 'ESP') then
                       begin
                          // Baleares, Las Palmas, Santa Cruz de Tenerifa, Ceuta y Melilla se tratan como Extranjeros
                          if ((FieldByName['PROVINCIA'].AsString = '07') or
                              (FieldByName['PROVINCIA'].AsString = '35') or
                              (FieldByName['PROVINCIA'].AsString = '38') or
                              (FieldByName['PROVINCIA'].AsString = '51') or
                              (FieldByName['PROVINCIA'].AsString = '52')) then
                             ModoIVA := 5
                          else
                             ModoIVA := 1;
                       end
                       else
                       if (FieldByName['PERTENECE_CEE'].AsInteger = 1) then
                          ModoIVA := 3
                       else
                          ModoIVA := 5;
                       }
                          Log.Add(format('Modo IVA segun direccion (Direccion=%d, PAIS,%s, PROVINCIA=%s, ModoIVA=%d)', [Direccion, FieldByName['PAIS'].AsString, FieldByName['PROVINCIA'].AsString, ModoIVA]));
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    id_s := DMMain.ContadorGen('ID_GES_CABECERAS_S');
                    DMMain.Log('id_s:' + IntToStr(id_s));
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' INSERT INTO VER_CABECERAS_PEDIDO ');
                          SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, FECHA, ');
                          SQL.Add(' ALMACEN, CLIENTE, DIRECCION, ENTRADA, ID_S, SU_REFERENCIA, TARIFA, ');
                          SQL.Add(' TIPO_PORTES, I_PORTES, TRANSPORTISTA, CONTACTO, Z_OBSERVACION, MODO_IVA, ORIGEN_DOCUMENTO)');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :FECHA, ');
                          SQL.Add(' :ALMACEN, :CLIENTE, :DIRECCION, :ENTRADA, :ID_S, :SU_REFERENCIA, :TARIFA, ');
                          SQL.Add(' :TIPO_PORTES, :I_PORTES, :TRANSPORTISTA, :CONTACTO, :Z_OBSERVACION, :MODO_IVA, :ORIGEN_DOCUMENTO)');

                          Params.ByName['EMPRESA'].AsInteger := Empresa;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := Canal;
                          Params.ByName['SERIE'].AsString := Serie;
                          Params.ByName['TIPO'].AsString := 'PEC';
                          Params.ByName['RIG'].AsInteger := 0;
                          Params.ByName['FECHA'].AsDateTime := Fecha;
                          Params.ByName['ALMACEN'].AsString := Almacen;
                          Params.ByName['CLIENTE'].AsInteger := -1;
                          Params.ByName['DIRECCION'].AsInteger := Direccion;
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          Params.ByName['SU_REFERENCIA'].AsString := Copy(Format(_('Orden Web: %d'), [id]), 1, 40);
                          Params.ByName['ID_S'].AsInteger := id_s;
                          Params.ByName['TARIFA'].AsString := Tarifa;
                          Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                          Params.ByName['CONTACTO'].AsInteger := Contacto;
                          Params.ByName['Z_OBSERVACION'].AsString := ''; // Copy(Format(_('Fac. Web: %s (%s)'), [invoice_number, DateToStr(invoice_date)]), 1, 256);
                          Params.ByName['MODO_IVA'].AsInteger := ModoIVA;
                          Params.ByName['ORIGEN_DOCUMENTO'].AsString := 'WOO';
                          if (ShippingTotal > 0) then
                          begin
                             TarifaIvaIncluido := (TarifaEsIvaIncluido(Tarifa, Empresa));
                             Params.ByName['TIPO_PORTES'].AsInteger := 4;
                             if TarifaIvaIncluido then
                                Params.ByName['I_PORTES'].AsFloat := ShippingTotal + ShippingTax
                             else
                                Params.ByName['I_PORTES'].AsFloat := ShippingTotal;
                          end
                          else
                          begin
                             Params.ByName['TIPO_PORTES'].AsInteger := 0;
                             Params.ByName['I_PORTES'].AsFloat := 0;
                          end;

                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    DMMain.Log('Graba relacion');
                    // Grabo la relacion
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' INSERT INTO SYS_CONF_WOOCOMMERCE_PEC (ID_CONFIGURACION, ID_S, ID_ORDER) ');
                          SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_S, :ID_ORDER) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                          Params.ByName['ID_S'].AsInteger := id_s;
                          Params.ByName['ID_ORDER'].AsInteger := id_order;
                          ExecQuery;
                          FreeHandle;
                          DMMain.Log('id_s: ' + IntToStr(id_s) + ' - id_order: ' + IntToStr(id_order));
                       finally
                          Free;
                       end;
                    end;
                 end;
                 DMMain.Log('Se obtiene datos de cabecera con id_s:' + IntToStr(id_s));

                 // Obtengo RIG para poder hacer los inserts en el detalle y la tarifa para ver si es IVA incluido o no
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Clear;
                       SQL.Text := 'SELECT ESTADO, RIG, TARIFA FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
                       Params.ByName['ID_S'].AsInteger := id_s;
                       ExecQuery;
                       RIG := FieldByName['RIG'].AsInteger;
                       Tarifa := FieldByName['TARIFA'].AsString;
                       Estado := FieldByName['ESTADO'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 DMMain.Log('Se obtiene Rig:' + IntToStr(RIG) + ' Tarifa:' + Tarifa + ' Estado:' + IntToStr(Estado));

                 // Si el documento esta abierto seguimos
                 if (Estado = 0) then
                 begin
                    // TODO - Grabamos datos del cliente - Si id_customer=0 grabamos sus datos en GES_CABECERAS_S_FAC_NIF
                    // TODO - Si tiene asignado id_customer realizar la sincronizacion para clientes Nota - En Woocommerce no se registra ningun tipo de numero de identificacion(DNI,NIF,etc.)
                    if (Cliente < 0) then
                    begin
                       DMMain.Log('Insertamos en ges_cabeceras_fac_nif:');
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE OR INSERT INTO GES_CABECERAS_S_FAC_NIF ( ');
                             SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, NIF, DIRECCION, ');
                             SQL.Add(' C_POSTAL,PROVINCIA, NOMBRE, PAIS, TELEFONO01, EMAIL, NOTAS) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :NIF, :DIRECCION, ');
                             SQL.Add(' :C_POSTAL, :PROVINCIA, :NOMBRE, :PAIS, :TELEFONO01, ');
                             SQL.Add(' :EMAIL, :NOTAS) ');
                             SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG)   ');
                             Params.ByName['EMPRESA'].AsInteger := Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                             Params.ByName['CANAL'].AsInteger := Canal;
                             Params.ByName['SERIE'].AsString := Serie;
                             Params.ByName['TIPO'].AsString := 'PEC';
                             Params.ByName['RIG'].AsInteger := RIG;
                             Params.ByName['NIF'].AsString := '';
                             Params.ByName['PAIS'].AsString := Pais;
                             Params.ByName['DIRECCION'].AsString := Copy(Direccion_literal, 1, 100);
                             Params.ByName['C_POSTAL'].AsString := Copy(CodigoPostal, 1, 10);
                             Params.ByName['PROVINCIA'].AsString := Copy(Ciudad, 1, 40);
                             Params.ByName['NOMBRE'].AsString := Copy(Trim(Trim(FirstName) + ' ' + Trim(LastName)), 1, 60);
                             Params.ByName['TELEFONO01'].AsString := Copy(Telefono, 1, 20);
                             Params.ByName['EMAIL'].AsString := Copy(email, 1, 100);
                             Params.ByName['NOTAS'].AsString := _('WooCommerce Billing Address') + #13#10 +
                                format('first_name: %s', [FirstName]) + #13#10 +
                                format('last_name: %s', [LastName]) + #13#10 +
                                format('address_1: %s', [Direccion_literal]) + #13#10 +
                                format('city: %s', [Ciudad]) + #13#10 +
                                format('postcode: %s', [CodigoPostal]) + #13#10 +
                                format('country: %s', [Pais_c2]);

                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;

                    // Creamos detalle
                    NodoDetalle := TlkJSONList(DameNodo(NodoPadre, ['line_items']));
                    if Assigned(NodoDetalle) then
                    begin
                       DMMain.Log('Recorremos NodoDetalle (line_items)');
                       for j := 0 to NodoDetalle.Count - 1 do
                       begin
                          Nodo := TlkJSONObject(NodoDetalle.Child[j]);

                          id_order_detail := StrToIntDef(DameDato(Nodo, ['id']), 0);
                          producto_id := StrToIntDef(DameDato(Nodo, ['product_id']), 0);
                          variation_id := StrToIntDef(DameDato(Nodo, ['variation_id']), 0);
                          nombre_producto := DameDato(Nodo, ['name']);
                          producto_cantidad := StrToIntDef(DameDato(Nodo, ['quantity']), 0);
                          producto_precio := StrToFloatDec(DameDato(Nodo, ['price']), '.');
                          sku_producto := DameDato(Nodo, ['sku']);

                          {$IFDEF Debug}
                          DMMain.Log(format('id_order_detail (%d)', [id_order_detail]));
                          DMMain.Log(format('producto_id (%d)', [producto_id]));
                          DMMain.Log(format('variation_id (%d)', [variation_id]));
                          DMMain.Log(format('nombre_producto (%s)', [nombre_producto]));
                          DMMain.Log(format('producto_cantidad (%d)', [producto_cantidad]));
                          DMMain.Log(format('producto_precio (%n)', [producto_precio]));
                          DMMain.Log(format('sku_producto (%s)', [sku_producto]));
                          {$ENDIF}

                          if ((id_s > 0) and (id_order_detail > 0)) then
                          begin
                             // Obtenemos id del detalle para ver si ya ha sido importado
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Clear;
                                   SQL.Add(' SELECT ID_DETALLES_S FROM SYS_CONF_WOOCOMMERCE_PEC_DET ');
                                   SQL.Add(' WHERE ');
                                   SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ID_ORDER_DETAIL = :ID_ORDER_DETAIL ');
                                   Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                                   Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                                   ExecQuery;
                                   id_detalles_s := FieldByName['ID_DETALLES_S'].AsInteger;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;

                             if (id_order_detail > 0) then
                             begin
                                id_a := DameIdArticulo(IdConfiguracion, producto_id, variation_id);

                                if (id_a = 0) then
                                   if (sku_producto > '') then
                                      id_a := UDameDato.DameIDArticulo(sku_producto);

                                if (id_a = 0) then
                                   id_a := SincronizaUnArticulo(producto_id);

                                Articulo := DameArticulo(id_a);

                                // Obtenemos porcentaje IVA por defecto
                                with THYFIBQuery.Create(nil) do
                                begin
                                   try
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Text := 'SELECT P_IVA FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND DEFECTO = 1';
                                      Params.ByName['PAIS'].AsString := REntorno.Pais;
                                      ExecQuery;
                                      PorcentajeIVA := FieldByName['P_IVA'].AsFloat;
                                      FreeHandle;
                                   finally
                                      Free;
                                   end;
                                end;

                                if (id_detalles_s = 0) then
                                begin
                                   id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                                   TipoIVA := -1;
                                   with THYFIBQuery.Create(nil) do
                                   begin
                                      try
                                         Close;
                                         DataBase := DMMain.DataBase;
                                         SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND P_IVA = :P_IVA';
                                         Params.ByName['PAIS'].AsString := REntorno.Pais;
                                         Params.ByName['P_IVA'].AsFloat := PorcentajeIVA;
                                         ExecQuery;
                                         if (HayDatos) then
                                            TipoIVA := FieldByName['TIPO'].AsInteger
                                         else
                                            Log.Add(Format('   ' + _('No se encuentra tipo de iva para porcentaje: %.2f.'), [PorcentajeIVA]));
                                         FreeHandle;
                                      finally
                                         Free;
                                      end;
                                   end;

                                   // Si no encuentro el IVA, lo tomo del articulo
                                   if (TipoIVA < 0) then
                                   begin
                                      with THYFIBQuery.Create(nil) do
                                      begin
                                         try
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Text := 'SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ARTICULO = :ARTICULO';
                                            Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                            Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                                            Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                            Params.ByName['ARTICULO'].AsString := Articulo;
                                            ExecQuery;
                                            if (HayDatos) then
                                            begin
                                               TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
                                               Log.Add('   ' + _('Se toma el IVA del articulo.'));
                                            end;
                                            FreeHandle;
                                         finally
                                            Free;
                                         end;
                                      end;
                                   end;

                                   // Si no encuentro el IVA, lo tomo del canal
                                   if (TipoIVA < 0) then
                                   begin
                                      with THYFIBQuery.Create(nil) do
                                      begin
                                         try
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Text := 'SELECT TIPO_IVA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
                                            Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                            Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                                            Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                            ExecQuery;
                                            if (HayDatos) then
                                            begin
                                               TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
                                               Log.Add('   ' + _('Se toma el IVA del canal.'));
                                            end;
                                            FreeHandle;
                                         finally
                                            Free;
                                         end;
                                      end;
                                   end;

                                   if (TipoIVA >= 0) then
                                   begin
                                      with THYFIBQuery.Create(nil) do
                                      begin
                                         try
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Clear;
                                            SQL.Add(' INSERT INTO VER_DETALLE_PEDIDO ');
                                            SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                            SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, DIRECCION_ENTREGA, ALMACEN) ');
                                            SQL.Add(' VALUES ');
                                            SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                            SQL.Add(' ''GRNL'', :TIPO_IVA, :DIRECCION_ENTREGA, :ALMACEN) ');
                                            Params.ByName['EMPRESA'].AsInteger := Empresa;
                                            Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                            Params.ByName['CANAL'].AsInteger := Canal;
                                            Params.ByName['SERIE'].AsString := Serie;
                                            Params.ByName['TIPO'].AsString := 'PEC';
                                            Params.ByName['RIG'].AsInteger := RIG;
                                            Params.ByName['LINEA'].AsInteger := 0;
                                            Params.ByName['ARTICULO'].AsString := Articulo;
                                            Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, Empresa);
                                            Params.ByName['UNIDADES'].AsFloat := producto_cantidad;
                                            Params.ByName['PRECIO'].AsFloat := producto_precio;
                                            Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                            Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                            Params.ByName['ID_S'].AsInteger := id_s;
                                            Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                            Params.ByName['DIRECCION_ENTREGA'].AsInteger := 1;
                                            Params.ByName['ALMACEN'].AsString := Almacen;
                                            ExecQuery;
                                            FreeHandle;
                                         finally
                                            Free;
                                         end;
                                      end;

                                      // Grabo la relacion
                                      with THYFIBQuery.Create(nil) do
                                      begin
                                         try
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Clear;
                                            SQL.Add(' INSERT INTO SYS_CONF_WOOCOMMERCE_PEC_DET (ID_CONFIGURACION, ID_DETALLES_S, ID_ORDER_DETAIL) ');
                                            SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_DETALLES_S, :ID_ORDER_DETAIL) ');
                                            Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                                            Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                            Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                                            ExecQuery;
                                            FreeHandle;
                                         finally
                                            Free;
                                         end;
                                      end;
                                   end
                                   else
                                      raise Exception.Create(_('No se pudo determinar el IVA a aplciar (PEC)' + '(' + FloatToStr(PorcentajeIVA) + ')'));
                                end
                                else
                                begin
                                   DMMain.Log(format('Modificamos linea del detalle id:(%d)', [id_detalles_s]));
                                   // Modificamos linea del detalle
                                   with THYFIBQuery.Create(nil) do
                                   begin
                                      try
                                         Close;
                                         DataBase := DMMain.DataBase;
                                         SQL.Clear;
                                         SQL.Add(' UPDATE VER_DETALLE_PEDIDO ');
                                         SQL.Add(' SET ARTICULO = :ARTICULO, TITULO = :TITULO, UNIDADES = :UNIDADES, PRECIO = :PRECIO, ENTRADA = :ENTRADA, DIRECCION_ENTREGA = :DIRECCION_ENTREGA ');
                                         SQL.Add(' WHERE ID_DETALLES_S = :ID_DETALLES_S ');
                                         Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                         Params.ByName['ARTICULO'].AsString := Articulo;
                                         Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, Empresa);
                                         Params.ByName['UNIDADES'].AsFloat := producto_cantidad;
                                         Params.ByName['PRECIO'].AsFloat := producto_precio;
                                         Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                         Params.ByName['DIRECCION_ENTREGA'].AsInteger := 1;
                                         ExecQuery;
                                         FreeHandle;
                                      finally
                                         Free;
                                      end;
                                   end;
                                end;
                             end;
                          end;
                       end;
                    end;
                 end;
              end
              else
              begin
                 Log.Add('ERROR Sincronizando ordenes ****************************');
                 Log.Add('      No se puede crear artículo sin codigo');
              end;
           finally
              Documento.Free;
           end;

           Result := id_order;
        end
        else
           ShowMessage('(order)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     except
        on E: Exception do
        begin
           // Log.Add(Format(_('No se ha podido crear pedido de la orden %d')') + #13#10 + E.Message, [id_order]));
           DMMain.Log(format(_('No se ha podido crear pedido de la orden %d') + #13#10 + E.Message, [id_order]));
        end;
     end;
  finally
     // Variaciones.Free;
     Respuesta.Free;
  end;
end;

{function TDMSincronizacionTiendaWoocommerce.SincronizaOrdenesFacturas(Desde, Hasta: TDateTime): integer;
begin
  Result := -1;
  { TODO : Falta implementar }
{end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaCodProvArticulos(Desde, Hasta: TDateTime): integer;
begin
  Result := -1;
  { TODO : Falta implementar }
{end;}

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceNewRecord(DataSet: TDataSet);
begin
  QMConfWoocommerceEMPRESA.AsInteger := REntorno.Empresa;
  QMConfWoocommerceCANAL.AsInteger := REntorno.Canal;
  QMConfWoocommerceSERIE.AsString := REntorno.Serie;
  QMConfWoocommercePREFIJO_ART.AsString := '';
  QMConfWoocommerceALMACEN.AsString := REntorno.AlmacenDefecto;
  QMConfWoocommerceAGENTE.AsInteger := -1;
  // QMConfWoocommerceESTADO_WOOCOMMERCE.AsInteger := 0;
  QMConfWoocommerceACTIVO.AsInteger := 0;
  // QMConfWoocommerceSOLO_CLIENTE_CON_PEDIDO.AsInteger := 1;
  // QMConfWoocommerceUTILIZA_MODULO_PAYPAL.AsInteger := 0;
  QMConfWoocommerceART_SIN_CONTROL_STOCK.AsInteger := 0;
  QMConfWoocommerceUTILIZA_REF_WOOCOMMERCE.AsInteger := 0;
  QMConfWoocommerceID_TIENDA_ARTICULOS.AsInteger := 0;
  QMConfWoocommerceCLIENTE_BASE.AsInteger := 0;
  // Webservice
  QMConfWoocommerceWS_URL.AsString := '';
  QMConfWoocommerceWS_API_GET.AsString := '';
  QMConfWoocommerceWS_API_CALC.AsString := '';
  QMConfWoocommerceWS_CONSUMER_KEY.AsString := '';
  QMConfWoocommerceWS_CONSUMER_SECRET.AsString := '';
  QMConfWoocommerceWS_VERSION.AsString := '';
  // QMConfWoocommerceWS_DEBUG.AsInteger := 0;
  // QMConfWoocommerceWS_LANGUAGE.AsInteger := 0;
  QMConfWoocommerceWS_ORDER_STATE.AsInteger := 0;
end;

procedure TDMSincronizacionTiendaWoocommerce.RellenaEstados(Items, Values: TStrings);
begin
  Items.Clear;
  Values.Clear;
end;

procedure TDMSincronizacionTiendaWoocommerce.SincronizaTodas;
begin
  with QMConfWoocommerce do
  begin
     First;
     while not EOF do
     begin
        SincronizaBase;
        Next;
     end;
     First;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceClienteCLIENTEChange(Sender: TField);
begin
  QMConfWoocommerceClienteID_CLIENTE.AsInteger := DameIDCliente(QMConfWoocommerceClienteCLIENTE.AsInteger, QMConfWoocommerceEMPRESA.AsInteger);
  QMConfWoocommerceClienteTERCERO.AsInteger := DameTercero('CLI', QMConfWoocommerceClienteCLIENTE.AsInteger, QMConfWoocommerceEMPRESA.AsInteger);
  QMConfWoocommerceClienteNOMBRE_R_SOCIAL.AsString := DameTituloTercero(QMConfWoocommerceClienteTERCERO.AsInteger);
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceClienteDirCLIENTEChange(Sender: TField);
var
  Direccion : string;
begin
  QMConfWoocommerceClienteDirTERCERO.AsInteger := DameTercero('CLI', QMConfWoocommerceClienteDirCLIENTE.AsInteger, QMConfWoocommerceEMPRESA.AsInteger);
  QMConfWoocommerceClienteDirNOMBRE_R_SOCIAL.AsString := DameTituloTercero(QMConfWoocommerceClienteDirTERCERO.AsInteger);
  Direccion := DameDireccionTercero(QMConfWoocommerceClienteDirTERCERO.AsInteger, QMConfWoocommerceClienteDirDIRECCION.AsInteger);
  if (Direccion = '') then
     QMConfWoocommerceClienteDirDIRECCION.AsInteger := 1;
end;

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceClienteDirDIRECCIONChange(Sender: TField);
begin
  QMConfWoocommerceClienteDirDIR_COMPLETA_N.AsString := DameDireccionTercero(QMConfWoocommerceClienteDirTERCERO.AsInteger, QMConfWoocommerceClienteDirDIRECCION.AsInteger);
end;

{function TDMSincronizacionTiendaWoocommerce.SincronizaFabricantes(Desde, Hasta: TDateTime): boolean;
(*
var
  i, j : integer;
  id : integer;
  nombre : string;
  date_upd : string;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoName : IXMLNode;
  Nodo : IXMLNode;
*)
begin
(*
  Log.Add(_('Obteniendo Fabricantes'));
  /// Sincroniza manufacturers con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  FSendCorreo.Texto(_('Obteniendo Fabricantes'));
  Result := False;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los fabricantes activos
     CodigoRespuesta := DMWoocommerce.WS_Get('manufacturers', 0, '&display=[id,name,date_upd]&filter[active]=[1]&sort=[id_ASC]', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-manufacturers.xml');
     {$ENDIF}

// Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['manufacturers']);
           if Assigned(NodoPadre) then
           begin
              Result := True;
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToInt(DameDato(Nodo, ['id']));
                 nombre := DameDato(Nodo, ['name']);
                 date_upd := DameDato(Nodo, ['date_upd']);

                 // Si la fecha de modificacion esta dentro de los parametros
                 if ((MySQLDateTimeToDateTime(date_upd) > Desde) and
                    (MySQLDateTimeToDateTime(date_upd) < Hasta)) then
                 begin
                    // Sincronizo. Espero numero de id si es correcto.
                    if (SincronizaUnFabricante(id) = 0) then
                       Result := False;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(manufacturers)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;}
{*)
end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaUnFabricante(id: integer): integer;
(*
var
  i : integer;
  id_address : integer;
  nombre : string;
  date_upd : string;
  Tercero, TerceroAsociado : integer;
  DireccionAsociada : integer;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoName : IXMLNode;
  Nodo : IXMLNode;
  ATercero : TTercero;
*)
begin
(*
  /// Sincroniza el manufacturer con un tercero.
  /// Si se realiza con exito devuelve el numero de tercero asociado

  Log.Add(Format(_('Sincronizando fabricante %d'), [id]));
  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMWoocommerce.WS_Get('manufacturers', id, '', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-Manufacturer.xml');
     {$ENDIF}

// Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Obtengo datos del fabricante
           NodoPadre := DameNodo(Documento.DocumentElement, ['manufacturer']);
           if Assigned(NodoPadre) then
           begin
              id := StrToInt(DameDato(NodoPadre, ['id']));
              nombre := DameDato(NodoPadre, ['name']);
              date_upd := DameDato(NodoPadre, ['date_upd']);

              FSendCorreo.Texto(Format(_('Fabricante: %d - %s' + #13#10 + 'Modificado: %s'), [id, nombre, date_upd]));

              NodoPadre := DameNodo(NodoPadre, ['associations', 'addresses']);

              TerceroAsociado := DameFabricante(QMConfWoocommerceEMPRESA.AsInteger, DameIdFabricanteWoocommerce(QMConfWoocommerceID.AsInteger, id));

              if NodoPadre.ChildNodes.Count = 0 then
              begin
                 // Si no tiene direccion en Woocommerce, lo creo como tercero con direccion desconocida;
                 InicializaTercero(ATercero);

                 DireccionAsociada := DameDireccionWoocommerce(QMConfWoocommerceID.AsInteger, -1, TerceroAsociado);

                 with ATercero do
                 begin
                    NombreRSocial := Copy(nombre, 1, 60);
                    Nif := '';
                    Tercero := TerceroAsociado;
                    // Debo al menos poner este texto para que cree una direccin asociada al tercero.
                    Direccion.Direccion := DireccionAsociada;
                    Direccion.DirNombre1 := _('SIN DIRECCION');
                 end;

                 // Esto crea/modifica el tercero y la direccion
                 CreaTercero(ATercero);

                 if (DireccionAsociada = 0) then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_CLIENTE_DIR (ID_CONFIGURACION, ID_ADDRESS, TERCERO, DIRECCION) ');
                          SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_ADDRESS, :TERCERO, :DIRECCION) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                          Params.ByName['ID_ADDRESS'].AsInteger := -1;
                          Params.ByName['TERCERO'].AsInteger := ATercero.Tercero;
                          Params.ByName['DIRECCION'].AsInteger := ATercero.Direccion.Direccion;
                          // Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 Tercero := ATercero.Tercero;
              end
              else
              begin
                 Tercero := TerceroAsociado;
                 for i := 0 to NodoPadre.ChildNodes.Count - 1 do
                 begin
                    Nodo := NodoPadre.ChildNodes.Get(i);

                    id_address := StrToInt(DameDato(Nodo, ['id']));

                    // Sincronizo direccion
                    Tercero := SincronizaUnaDireccion(id_address, Tercero);
                 end;
              end;

              // Si no estaba asociado a un tercero, lo hago ahora.
              if (TerceroAsociado = 0) then
              begin
                 // Asigno ID_PRESTASHOP al Fabricante
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_FABRICANTE ( ');
                       SQL.Add(' ID_CONFIGURACION, ID_FABRICANTE, ID_MANUFACTURER /*, ULT_SINCRONIZACION*/) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :ID_CONFIGURACION, :ID_FABRICANTE, :ID_MANUFACTURER /*, :ULT_SINCRONIZACION*/) ');
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                       Params.ByName['ID_MANUFACTURER'].AsInteger := id;
                       // Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                       Params.ByName['ID_FABRICANTE'].AsInteger := Tercero;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              Log[Log.Count - 1] := Format(_('Sincronizando fabricante %d - %s - Modificado: %s'), [id, nombre, date_upd]);
              Result := Tercero;
           end;
        end;
     end
     else
        ShowMessage('(manufacturer)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
*)
end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaUnaDireccion(IdConfiguracion, id: integer; TerceroAsociado: integer = 0): integer;
(*
var
  i : integer;
  company : string;
  lastname : string;
  firstname : string;

  address1 : string;
  address2 : string;
  id_country : integer;
  id_state : integer;
  city : string;
  postcode : string;

  phone : string;
  phone_mobile : string;

  vat_number : string;
  dni : string;
  date_upd : string;

  Pais, Provincia : string;
  ATercero : TTercero;
  ATerceroDireccion : TDireccionTercero;
  DireccionAsociada : integer;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
*)
begin

  /// Si el tercero es 0, lo busco por NIF y si no lo encuentro, lo creo.
  /// Si es diferente de 0 agrego la dirección sin importar si el NIF es diferente.
  /// Devuelve el tercero creado/modificado.
 (*
  Log.Add(Format(_('Sincronizando direccion %d'), [id]));
  Result := 0;

  id := StrToInt(DameDato(Nodo, ['id']));
  company := DameDato(Nodo, ['company']);
  lastname := DameDato(Nodo, ['lastname']);
  firstname := DameDato(Nodo, ['firstname']);

  address1 := DameDato(Nodo, ['address1']);
  address2 := DameDato(Nodo, ['address2']);
  id_country := StrToInt(DameDato(Nodo, ['id_country']));
  id_state := StrToInt(DameDato(Nodo, ['id_state']));
  city := DameDato(Nodo, ['city']);
  postcode := DameDato(Nodo, ['postcode']);

  phone := DameDato(Nodo, ['phone']);
  phone_mobile := DameDato(Nodo, ['phone_mobile']);

  vat_number := DameDato(Nodo, ['vat_number']);
  dni := DameDato(Nodo, ['dni']);

  date_upd := DameDato(Nodo, ['date_upd']);

  // Si dni viene vacio utilizo vat_number (se da en caso de extranjeros)
  if (dni = '') then
     dni := vat_number;

  DireccionAsociada := DameDireccionWoocommerce(IdConfiguracion, id, TerceroAsociado);

  InicializaTercero(ATercero);

  with ATercero do
  begin
     if (company > '') then
        NombreRSocial := Copy(company, 1, 60)
     else
        NombreRSocial := Copy(firstname + ' ' + lastname, 1, 60);
     Nif := dni;
     Tercero := TerceroAsociado;

     Telefono1 := Copy(phone, 1, 15);
     Telefono2 := Copy(phone_mobile, 1, 15);
  end;

  with ATercero.Direccion do
  begin
     Direccion := DireccionAsociada;

     Pais := DamePais(id_country);
     CodigoPostal := postcode;
     Provincia := DameEstado(id_state, Pais, CodigoPostal);
     Localidad := city;
     DirNombre1 := Copy(address1, 1, 40);
     DirNombre2 := Copy(address2, 1, 40);
     DirNombre3 := Copy(company, 1, 40);
     DirTelefono1 := Copy(phone, 1, 15);
     DirTelefono2 := Copy(phone_mobile, 1, 15);
     Notas := 'Importacion Woocommerce:';
     Notas := Notas + #13#10 + Format('id: %d', [id]);
     Notas := Notas + #13#10 + Format('address1: %s', [address1]);
     Notas := Notas + #13#10 + Format('address2: %s', [address2]);
     Notas := Notas + #13#10 + Format('city: %s', [city]);
     Notas := Notas + #13#10 + Format('postcode: %s', [postcode]);
     Notas := Notas + #13#10 + Format('phone: %s', [phone]);
     Notas := Notas + #13#10 + Format('phone_mobile: %s', [phone_mobile]);
     Notas := Notas + #13#10 + Format('vat_number: %s', [vat_number]);
     Notas := Notas + #13#10 + Format('dni: %s', [dni]);
     Notas := Notas + #13#10 + Format('date_upd: %s', [date_upd]);
  end;

  // Esto crea/modifica el tercero y la direccion
  CreaTercero(ATercero);

  // Si no habia direccion le creo un contacto asociado y la relaciono a la direccion Woocommerce
  if (DireccionAsociada = 0) then
  begin
     // Creo un contacto asociado a la dirección con datos de nombre, teléfono, etc. que podría ser usados como destinatario de la factura
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO SYS_TERCEROS_CONTACTOS ');
           SQL.Add(' (TERCERO, CONTACTO, NOMBRE, APELLIDOS, ');
           SQL.Add(' MOVIL, TELEFONO, FAX, EXTENSION, CORREO, ');
           SQL.Add(' /*NOTAS,*/ DIRECCION, PADRE, DEPARTAMENTO) ');
           SQL.Add(' VALUES ');
           SQL.Add(' (:TERCERO, :CONTACTO, :NOMBRE, :APELLIDOS, ');
           SQL.Add(' :MOVIL, :TELEFONO, :FAX, :EXTENSION, :CORREO, ');
           SQL.Add(' /*:NOTAS,*/ :DIRECCION, :PADRE, :DEPARTAMENTO) ');
           Params.ByName['TERCERO'].AsInteger := ATercero.Tercero;
           Params.ByName['CONTACTO'].AsInteger := 0;
           Params.ByName['DIRECCION'].AsInteger := ATercero.Direccion.Direccion;
           Params.ByName['NOMBRE'].AsString := Trim(Copy(firstname, 1, 40));
           Params.ByName['APELLIDOS'].AsString := Trim(Copy(lastname, 1, 40));
           Params.ByName['MOVIL'].AsString := Trim(Copy(phone_mobile, 1, 15));
           Params.ByName['TELEFONO'].AsString := Trim(Copy(phone, 1, 15));
           Params.ByName['FAX'].AsString := '';
           Params.ByName['EXTENSION'].AsString := '';
           Params.ByName['CORREO'].AsString := Trim(Copy('', 1, 100));
           Params.ByName['PADRE'].AsInteger := 0;
           Params.ByName['DEPARTAMENTO'].AsString := '';
           // Params.ByName['NOTAS'].AsString := 'id_address ' + IntToStr(id_address) + #13#10 + #13#10 + 'id_customer ' + IntToStr(id_customer) + #13#10 + phone + ' - ' + phone_mobile + #13#10 + 'dni ' + dni + #13#10 + 'company ' + company + #13#10 + 'lastname ' + lastname + #13#10 + 'firstname ' + firstname;
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
           SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_CLIENTE_DIR (ID_CONFIGURACION, ID_ADDRESS, TERCERO, DIRECCION) ');
           SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_ADDRESS, :TERCERO, :DIRECCION) ');
           Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
           Params.ByName['ID_ADDRESS'].AsInteger := id;
           Params.ByName['TERCERO'].AsInteger := ATercero.Tercero;
           Params.ByName['DIRECCION'].AsInteger := ATercero.Direccion.Direccion;
           // Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Result := ATercero.Tercero;
*)
end;}

{function TDMSincronizacionTiendaWoocommerce.DameLocalidad(IdCountry, IdState: integer; City, PostCode: string): string;
var
  Pais, Provincia : string;
begin
  Result := '';
  Pais := DamePais(IdCountry);
  Provincia := DameEstado(IdState, Pais, PostCode);

  // Busco una provincia con coincidencia total
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE PAIS = :PAIS AND PROVINCIA = :PROVINCIA AND CODIGO_POSTAL = :CODIGO_POSTAL AND UPPER(TITULO) = :TITULO ORDER BY LOCALIDAD');
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['PROVINCIA'].AsString := Provincia;
        Params.ByName['CODIGO_POSTAL'].AsString := PostCode;
        Params.ByName['TITULO'].AsString := Trim(Copy(UpperCase(City), 1, 40));
        ExecQuery;
        Result := Trim(FieldByName['PROVINCIA'].AsString);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Result = '') then
  begin
     // Busco una provincia con coincidencia de codigos
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE PAIS = :PAIS AND PROVINCIA = :PROVINCIA AND CODIGO_POSTAL = :CODIGO_POSTAL ORDER BY LOCALIDAD');
           Params.ByName['PAIS'].AsString := Pais;
           Params.ByName['PROVINCIA'].AsString := Provincia;
           Params.ByName['CODIGO_POSTAL'].AsString := PostCode;
           ExecQuery;
           Result := Trim(FieldByName['PROVINCIA'].AsString);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (Result = '') then
  begin
     // Si no existe devuelvo 99999999 - DESCONOCIDA
     Result := '99999999';
     {
    // Si no existe la creo?
    with THYFIBQuery.Create(nil) do
    begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('INSERT INTO SYS_LOCALIDADES ...');
           Params.ByName['PAIS'].AsString := Pais;
           Params.ByName['PROVINCIA'].AsString := Provincia;
           Params.ByName['CODIGO_POSTAL'].AsString := PostCode;
           Params.ByName['TITULO'].AsString := Trim(Copy(UpperCase(City), 1, 40));
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
    end;
    }
  {end;
end;}

{function TDMSincronizacionTiendaWoocommerce.DamePais(IdCountry: integer): string;
(*
var
  i : integer;
  id : integer;
  iso_code : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  Result := '';
  iso_code := '';

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del pais
     CodigoRespuesta := DMWoocommerce.WS_Get('countries', IdCountry, '', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-countries.xml');
     {$ENDIF}

// Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           Nodo := DameNodo(Documento.DocumentElement, ['country']);
           if Assigned(Nodo) then
           begin
              id := StrToInt(DameDato(Nodo, ['id']));
              iso_code := DameDato(Nodo, ['iso_code']);
           end;
        end;
     end
     else
        ShowMessage('(countries)' + _('No se ha obtener datos de Woocommerce. (DamePais)') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  Result := DamePais(iso_code);
*)
end;}

{function TDMSincronizacionTiendaWoocommerce.DameEstado(IdState: integer; Pais: string; CodigoPostal: string = ''): string;
(*
var
  i : integer;
  id : integer;
  iso_code : string;
  state_name : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  Result := '';
  iso_code := '';
  state_name := '';

  if (IdState <> 0) then
  begin
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Obtengo datos del pais
        CodigoRespuesta := DMWoocommerce.WS_Get('states', IdState, '', Respuesta);

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Recorro los fabricantes
              Nodo := DameNodo(Documento.DocumentElement, ['state']);
              if Assigned(Nodo) then
              begin
                 id := StrToInt(DameDato(Nodo, ['id']));
                 iso_code := DameDato(Nodo, ['iso_code']);
                 state_name := DameDato(Nodo, ['name']);
              end;
           end;
        end
        else
           ShowMessage('(states)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;

     // Busco una provincia con coincidencia total
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT PROVINCIA FROM SYS_PROVINCIAS WHERE PAIS = :PAIS AND UPPER(TITULO) = :TITULO ORDER BY PROVINCIA');
           Params.ByName['PAIS'].AsString := Pais;
           Params.ByName['TITULO'].AsString := Copy(state_name, 1, 40);
           ExecQuery;
           Result := Trim(FieldByName['PROVINCIA'].AsString);
           FreeHandle;
        finally
           Free;
        end;
     end;

     // ***En caso de España*** Busco una provincia con coincidencia en codigo postal
     if ((Result = '') and (Pais = 'ESP')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add('SELECT PROVINCIA FROM SYS_PROVINCIAS WHERE PAIS = :PAIS AND PROVINCIA = :PROVINCIA');
              Params.ByName['PAIS'].AsString := Pais;
              Params.ByName['PROVINCIA'].AsString := Copy(CodigoPostal, 1, 2);
              ExecQuery;
              Result := Trim(FieldByName['PROVINCIA'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Busco una provincia con coincidencia en codigo
     if (Result = '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add('SELECT PROVINCIA FROM SYS_PROVINCIAS WHERE PAIS = :PAIS AND PROVINCIA = :PROVINCIA');
              Params.ByName['PAIS'].AsString := Pais;
              Params.ByName['PROVINCIA'].AsString := Copy(iso_code, 1, 2);
              ExecQuery;
              Result := Trim(FieldByName['PROVINCIA'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si no la encuentro, la creo
     if (Result = '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add('INSERT INTO SYS_PROVINCIAS (PAIS, PROVINCIA, TITULO) VALUES (:PAIS, :PROVINCIA, :TITULO) ');
              Params.ByName['PAIS'].AsString := Pais;
              Params.ByName['PROVINCIA'].AsString := Copy(iso_code, 1, 2);
              Params.ByName['TITULO'].AsString := Trim(Copy(UpperCase(state_name), 1, 40));
              ExecQuery;
              Result := iso_code;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
*)
end;}

procedure TDMSincronizacionTiendaWoocommerce.QMConfWoocommerceArticuloARTICULOChange(Sender: TField);
begin
  QMConfWoocommerceArticuloID_A.AsInteger := UDameDato.DameIDArticulo(QMConfWoocommerceArticuloARTICULO.AsString, QMConfWoocommerceEMPRESA.AsInteger);
  QMConfWoocommerceArticuloTITULO.AsString := DameTituloArticulo(QMConfWoocommerceArticuloID_A.AsInteger);
end;

procedure TDMSincronizacionTiendaWoocommerce.FiltrarCliente(Valor: string);
begin
  /// Filtra clientes

  (*
  with QMConfWoocommerceCliente do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONF_PRESTASHOP_CLIENTE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_CUSTOMER = :VALOR OR ');
           SelectSQL.Add(' ID_CLIENTE = :VALOR OR ');
           SelectSQL.Add(' CLIENTE = :VALOR OR ');
           SelectSQL.Add(' TERCERO = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(NOMBRE_R_SOCIAL) LIKE ''%'' || UPPER(:VALOR) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_CUSTOMER ');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
  *)
end;

procedure TDMSincronizacionTiendaWoocommerce.FiltrarDireccion(Valor: string);
begin
  /// Filtra direccion de clientes

  (*
  with QMConfWoocommerceClienteDir do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONF_PRESTASHOP_CLIENTE_DIR ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_ADDRESS = :VALOR OR ');
           SelectSQL.Add(' DIRECCION = :VALOR OR ');
           SelectSQL.Add(' CLIENTE = :VALOR OR ');
           SelectSQL.Add(' TERCERO = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(DIR_COMPLETA_N) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR');
        SelectSQL.Add(' UPPER(NOMBRE_R_SOCIAL) LIKE ''%'' || UPPER(:VALOR) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_ADDRESS ');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
  *)
end;

procedure TDMSincronizacionTiendaWoocommerce.FiltrarArticulo(Valor: string);
begin
  /// Filtra articulos

  with QMConfWoocommerceArticulo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONF_WOOCOMMERCE_ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_PRODUCT = :VALOR OR ');
           SelectSQL.Add(' ID_A = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(ARTICULO) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR');
        SelectSQL.Add(' UPPER(TITULO) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(REFERENCIA) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(DESCRIPCION_CORTA) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(DESCRIPCION_LARGA) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(TITULO_ARTICULO) LIKE ''%'' || UPPER(:VALOR) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_PRODUCT');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
end;

function TDMSincronizacionTiendaWoocommerce.DameNodo(Nodo: TlkJSONBase; a: array of string): TlkJSONObject;
var
  i : integer;
begin
  Result := nil;
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.Field[a[i]];
     Inc(i);
  end;

  Result := TlkJSONObject(Nodo);
end;

function TDMSincronizacionTiendaWoocommerce.DameDato(Nodo: TlkJSONObject; a: array of string): string;
var
  i : integer;
  aux : array of string;
  Campo : string;
begin
  ///  {Cabecera:
  ///     {Detalle:
  ///        {Subdetalle:"Dato"}
  ///    }
  ///  }
  /// a['Cabecera', 'Detalle', 'Subdetalle']
  /// Nodo := DameNodo(Nodo, ['Cabecera', 'Detalle'])
  /// Dato := Nodo.Field('Subdetalle').Value

  /// Devuelve el valor del nodo como string.

  Result := '';

  // El ultimo valor es el campo a obtener
  Campo := a[Length(a) - 1];

  // Quito el ultimo elemento del array
  for i := 0 to Length(a) - 2 do
     aux[i] := a[i];

  // Obtengo Nodo
  Nodo := DameNodo(Nodo, aux);

  if Assigned(Nodo) then
  begin
     // Obtengo datos del campo.
     if (Nodo.Field[Campo] is TlkJSONnull) then
        Result := '';

     if (Nodo.Field[Campo] is TlkJSONstring) then
        Result := Nodo.Field[Campo].Value;

     // Devolvemos como string con separador decimal = "."
     if (Nodo.Field[Campo] is TlkJSONnumber) then
        Result := FloatToStrDec(Nodo.Field[Campo].Value, '.');

     if (Nodo.Field[Campo] is TlkJSONboolean) then
        if Nodo.Field[Campo].Value then
           Result := 'true'
        else
           Result := 'false';
  end;
end;

{function TDMSincronizacionTiendaWoocommerce.DameNodoLenguage(Nodo: IXMLNode; lang_id: integer): IXMLNode;
var
  i : integer;
  attr : string;
  ListaAttr : IXMLNodeList;
  NodoLang, NodoAttr : IXMLNode;
begin
  /// Nodo es el nodo padre.
  /// Dentro de este nodo hay varios nodos <language> que tienen un atributo id que identifica al lenguage
  {Ejemplo:
  <name>
     <language id="1" xlink:href="http://Woocommerce.myshop.com/api/languages/1">Clothes</language>
     <language id="2" xlink:href="http://Woocommerce.myshop.com/api/languages/2">Clothes</language>
     <language id="3" xlink:href="http://Woocommerce.myshop.com/api/languages/3">Clothes</language>
     <language id="4" xlink:href="http://Woocommerce.myshop.com/api/languages/4">Clothes</language>
  </name>
  }
  {
  Result := nil;

  // Recorro los nodos.
  for i := 0 to Nodo.ChildNodes.Count - 1 do
  begin
     NodoLang := Nodo.ChildNodes.Get(i);
     attr := '';

     // Obtengo la lista de atributos del nodo
     ListaAttr := NodoLang.AttributeNodes;
     if Assigned(ListaAttr) then
     begin
        // Busco el atributo "id"
        NodoAttr := ListaAttr.FindNode('id');
        if Assigned(NodoAttr) then
           attr := NodoAttr.Text;

        // Si es el que busco lo devuelvo
        if (StrToInt(attr) = lang_id) then
           Result := NodoLang;
     end;
  end;
end;}

{procedure TDMSincronizacionTiendaWoocommerce.SetDatoLenguage(Nodo: IXMLNode; lang_id: integer; s: string);
(*
var
  NodoLang : IXMLNode;
  i : integer;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  NodoLang := DameNodoLenguage(Nodo, lang_id);
  if Assigned(NodoLang) then
     NodoLang.Text := s;
*)
end;

{function TDMSincronizacionTiendaWoocommerce.DameDatoLenguage(Nodo: IXMLNode; lang_id: integer): string;
(*
var
  NodoLang : IXMLNode;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  /// Nodo es el nodo padre.
  /// Dentro de este nodo hay varios nodos <language> que tienen un atributo id que identifica al lenguage
  {Ejemplo:
  <name>
     <language id="1" xlink:href="http://Woocommerce.myshop.com/api/languages/1">Clothes</language>
     <language id="2" xlink:href="http://Woocommerce.myshop.com/api/languages/2">Clothes</language>
     <language id="3" xlink:href="http://Woocommerce.myshop.com/api/languages/3">Clothes</language>
     <language id="4" xlink:href="http://Woocommerce.myshop.com/api/languages/4">Clothes</language>
  </name>
  }
  {
  Result := '';
  NodoLang := DameNodoLenguage(Nodo, lang_id);
  if Assigned(NodoLang) then
     Result := DameDato(NodoLang, []);
*)
end;}

function TDMSincronizacionTiendaWoocommerce.InicializaWebService: boolean;
begin
  try
     Result := DMWoocommerce.WS_Inicializa(QMConfWoocommerceWS_URL.AsString, QMConfWoocommerceWS_API_GET.AsString, QMConfWoocommerceWS_API_CALC.AsString, QMConfWoocommerceWS_CONSUMER_KEY.AsString, QMConfWoocommerceWS_CONSUMER_SECRET.AsString, {(QMConfWoocommerceWS_DEBUG.AsInteger = 1)}True);
  except
     on E: Exception do
     begin
        DMMain.Log('Error InicializaWebService' + #13#10 + E.Message);
        ShowMessage(_('Error inicializando WebService') + #13#10 + E.Message);
        Result := False;
     end;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.RellenaIdiomasWS(Items, Values: TStrings);
(*
var
  i : integer;
  id, nombre : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  Items.Clear;
  Values.Clear;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los idiomas activos
     CodigoRespuesta := DMWoocommerce.WS_Get('languages', 0, '&display=[id,name]&filter[active]=[1]', Respuesta);

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['languages', 'language']);
           while Assigned(Nodo) do
           begin
              id := DameDato(Nodo, ['id']);
              Values.Add(id);

              Nombre := DameDato(Nodo, ['name']);
              Items.Add(Nombre);

              Nodo := Nodo.NextSibling;
           end;

           {
           NodoPadre := DameNodo(Documento.DocumentElement, ['languages']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 Values.Add(DameDato(Nodo, ['id']));
                 Items.Add(DameDato(Nodo, ['name']));
              end;
           end;
           }
        end;
     end
     else
        ShowMessage('(languages)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
*)
end;

procedure TDMSincronizacionTiendaWoocommerce.RellenaEstadosWS(Items, Values: TStrings);
(*
var
  i : integer;
  id, nombre : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
*)begin
  raise Exception.Create(_('No Implementado'));
(*
Items.Clear;
  Values.Clear;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los idiomas activos
     CodigoRespuesta := DMWoocommerce.WS_Get('order_states', 0, '&display=[id,name]', Respuesta);

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['order_states', 'order_state']);
           while Assigned(Nodo) do
           begin
              id := DameDato(Nodo, ['id']);
              Values.Add(id);

              Nombre := ''{DameDatoLenguage(DameNodo(Nodo, ['name']), QMConfWoocommerceWS_LANGUAGE.AsInteger)};
              Items.Add(Nombre);

              Nodo := Nodo.NextSibling;
           end;

           {
           NodoPadre := DameNodo(Documento.DocumentElement, ['order_states']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := DameDato(Nodo, ['id']);
                 Values.Add(id);

                 Nombre := DameDatoLenguage(DameNodo(Nodo, ['name']), QMConfWoocommerceWS_LANGUAGE.AsInteger);

                 Items.Add(Nombre);
              end;
           end;
           }
        end;
     end
     else
        ShowMessage('(order_states)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
*)
end;

{function TDMSincronizacionTiendaWoocommerce.SincronizaFamilias(Desde, Hasta: TDateTime): boolean;
(*
var
  i, j : integer;
  id, id_root_category : integer;
  nombre : string;
  date_upd : string;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoSubcategorias, NodoName : IXMLNode;
  Nodo : IXMLNode;

  ListaCategorias : TStrings;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  Log.Add(_('Obteniendo Familias'));
  /// Sincroniza categorias con modificaciones entre la fechas del parametro.
  /// La primera categoria será una familia y la segunda categoria será una subfamilia
  /// La marcada como raiz no se sincroniza (normalmente Home)

  FSendCorreo.Texto(_('Obteniendo Familias'));
  Result := False;

  // Obtengo lista de categorias que dependen de la raiz.
  // Las importaremos como familias
  ListaCategorias := TStringList.Create;
  try

     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Obtengo datos de la categoria raiz. De aqui dependen las demas categorias.
        CodigoRespuesta := DMWoocommerce.WS_Get('categories', 0, '&display=full&filter[is_root_category]=[1]', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-Categories-root_category.xml');
     {$ENDIF}

// Si la respuesta es correcta
        {if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Recorro los categorias
              NodoPadre := DameNodo(Documento.DocumentElement, ['categories']);
              if Assigned(NodoPadre) then
              begin
                 Result := True;
                 for i := 0 to NodoPadre.ChildNodes.Count - 1 do
                 begin
                    Nodo := NodoPadre.ChildNodes.Get(i);

                    id_root_category := StrToInt(DameDato(Nodo, ['id']));
                    date_upd := DameDato(Nodo, ['date_upd']);

                    Nombre := ''{DameDatoLenguage(DameNodo(Nodo, ['name']), QMConfWoocommerceWS_LANGUAGE.AsInteger)}

// Recorro las categorias asociadas. Esto seran las familias a importar
                    {NodoSubcategorias := DameNodo(Nodo, ['associations', 'categories']);
                    for j := 0 to NodoSubcategorias.ChildNodes.Count - 1 do
                    begin
                       Nodo := NodoSubcategorias.ChildNodes.Get(j);
                       ListaCategorias.Add(IntToStr(StrToInt(DameDato(Nodo, ['id']))));
                    end;
                 end;
              end;
           end;
        end
        else
           ShowMessage('(categories-root)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;

     // Recorro la lista, importando familias.
     for i := 0 to ListaCategorias.Count - 1 do
     begin
        if not SincronizaUnaFamilia(Desde, Hasta, StrToInt(ListaCategorias[i])) then
           Result := False;
     end;
  finally
     ListaCategorias.Free;
  end;
*)}
{end;}

{function TDMSincronizacionTiendaWoocommerce.SincronizaUnaFamilia(Desde, Hasta: TDateTime; id_category: integer; FamiliaPadre: string = ''): boolean;
(*
var
  i, j : integer;
  id : integer;
  nombre, Descripcion : string;
  date_upd : string;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoName : IXMLNode;
  Nodo : IXMLNode;

  ListaSubCategorias, ListaProductos : TStrings;
  IdFamilia, IdSubFamilia : integer;
  Familia, SubFamilia : string;
  CtaCompras, CtaVentas, CtaDevCompras, CtaDevVentas : string;
  Ejercicio, MaxEjercicio : integer;
  TipoIVA : integer;
  Pais : string;
*)begin
  raise Exception.Create(_('No Implementado'));
(*
  /// Sincroniza categoria con una familia
  /// La primera categoria será una familia y la subcategoria será una subfamilia
  /// Si familia = "" se importa como familia.
  /// Si familia <> "" se importa como subfamilia de la familia pasada como parametro.

  {
  if (FamiliaPadre = '') then
     Log.Add(Format(_('Sincronizando categoria %d'), [id_category]))
  else
     Log.Add(Format(_('Sincronizando subcategoria %d - Familia Padre %s'), [id_category, FamiliaPadre]));
  }
  {
  Result := False;

  // Obtengo lista de categorias que dependen de la raiz.
  // Las importaremos como familias
  ListaSubCategorias := TStringList.Create;
  ListaProductos := TStringList.Create;
  try
     // Por cada categoria se asigna familia a los articulos.
     // Por cada categoria se importan las subcategorias.
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Obtengo datos de la categoria raiz. De aqui dependen las demas categorias.
        CodigoRespuesta := DMWoocommerce.WS_Get('categories', id_category, '', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-Category.xml');
     {$ENDIF}

// Si la respuesta es correcta
        {if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              Result := True;

              // Recorro los campos de la categoria
              NodoPadre := DameNodo(Documento.DocumentElement, ['category']);
              if Assigned(NodoPadre) then
              begin
                 id := StrToInt(DameDato(NodoPadre, ['id']));
                 date_upd := DameDato(NodoPadre, ['date_upd']);

                 Nombre := ''{DameDatoLenguage(DameNodo(NodoPadre, ['name']), QMConfWoocommerceWS_LANGUAGE.AsInteger)}
{Descripcion := ''{DameDatoLenguage(DameNodo(NodoPadre, ['description']), QMConfWoocommerceWS_LANGUAGE.AsInteger)}

                 {if (FamiliaPadre = '') then
                    FSendCorreo.Texto(Format(_('Familia: %d - %s' + #13#10 + 'Modificado: %s'), [id, Nombre, date_upd]))
                 else
                    FSendCorreo.Texto(Format(_('Subfamilia %d - Familia Padre: %s - %s' + #13#10 + 'Modificado: %s'), [id, FamiliaPadre, Nombre, date_upd]));

                 // Recorro las categorias asociadas. Esto seran las familias a importar
                 Nodo := DameNodo(NodoPadre, ['associations', 'categories']);
                 for j := 0 to Nodo.ChildNodes.Count - 1 do
                 begin
                    ListaSubCategorias.Add(IntToStr(StrToInt(DameDato(Nodo.ChildNodes.Get(j), ['id']))));
                 end;

                 // Recorro los productos asociados. Se asignara la familia a los articulos asociados a estos productos.
                 Nodo := DameNodo(NodoPadre, ['associations', 'products']);
                 for j := 0 to Nodo.ChildNodes.Count - 1 do
                 begin
                    ListaProductos.Add(IntToStr(StrToInt(DameDato(Nodo.ChildNodes.Get(j), ['id']))));
                 end;
              end;
           end;
        end
        else
           ShowMessage('(categories-familias)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;

     IdFamilia := 0;
     IdSubFamilia := 0;
     SubFamilia := '';

     // Sincronizo la categoria con la familia
     if (FamiliaPadre = '') then
     begin
        if ((MySQLDateTimeToDateTime(date_upd) > Desde) and
           (MySQLDateTimeToDateTime(date_upd) < Hasta)) then
        begin
           // Log[Log.Count - 1] := Format('   ' + _('Sincronizando categoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]);
           Log.Add(Format('   ' + _('Sincronizando categoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]));

           // Obtengo IdFamilia si ya esta sincronizada
           IdFamilia := DameIdFamiliaWoocommerce(QMConfWoocommerceID.AsInteger, id_category);

           // Si no esta sincronizada
           if (IdFamilia = 0) then
           begin
              // Codigo de la familia a sincronizar
              FamiliaPadre := Format('%.5d', [id_category]);

              if (Length(FamiliaPadre) > 5) then
              begin
                 FamiliaPadre := InputBox(_('Familia'), format(_('Codigo para la familia %d - %s' + #13#10 + 'Vacio cancela importacion'), [id_category, Nombre]), '');
              end;

              if (Length(FamiliaPadre) <> 0) then
              begin
                 // Veo si ya existe el codigo de familia en esta empresa
                 IdFamilia := DameIdFamilia(FamiliaPadre, QMConfWoocommerceEMPRESA.AsInteger);

                 // Si no existe
                 if (IdFamilia = 0) then
                 begin
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO ART_FAMILIAS ( ');
                          SQL.Add(' EMPRESA, FAMILIA, TITULO, WEB ');
                          SQL.Add(' /*, ACT_TAR_AUTOM, MARGEN, TIPO_REDONDEO, UN_DIGITO, DOS_DIGITOS, TRES_DIGITOS, CUATRO_DIGITOS, ');
                          SQL.Add('  DIAS_MIN, DIAS_MAX, ULT_MODIFICACION, ID_FAMILIA, TITULO_WEB, IMAGEN_WEB, PLAZAS_MAXIMAS, ORDEN, TIPO_PRECIO_BASE, ');
                          SQL.Add('  TIPO_REGISTRO_FITOSANITARIO, DISPONIBILIDAD*/ ) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :EMPRESA, :FAMILIA, :TITULO, 1) ');
                          SQL.Add(' RETURNING ID_FAMILIA ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
                          Params.ByName['FAMILIA'].AsString := FamiliaPadre;
                          Params.ByName['TITULO'].AsString := Nombre;
                          ExecQuery;
                          IdFamilia := FieldByName['ID_FAMILIA'].AsInteger;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end
                 else
                 begin
                    // Obtengo la familia
                    FamiliaPadre := DameFamilia(IdFamilia);
                 end;

                 // Ahora la cuenta
                 // Obtengo el ultimo ejercicio en el que existe esta cuenta
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT MAX(EJERCICIO) FROM CON_CUENTAS_GES_FAM WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL AND FAMILIA = :FAMILIA';
                       Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMConfWoocommerceCANAL.AsInteger;
                       Params.ByName['FAMILIA'].AsString := FamiliaPadre;
                       ExecQuery;
                       Ejercicio := FieldByName['MAX'].AsInteger;
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
                       SQL.Add(' SELECT MIN(PAIS) PAIS, MIN(TIPO_IVA) TIPO_IVA, MAX(EJERCICIO) EJERCICIO ');
                       SQL.Add(' FROM EMP_CANALES ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' CANAL = :CANAL ');
                       SQL.Add(' GROUP BY EMPRESA, CANAL ');
                       Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMConfWoocommerceCANAL.AsInteger;
                       ExecQuery;
                       Pais := FieldByName['PAIS'].AsString;
                       TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
                       MaxEjercicio := FieldByName['EJERCICIO'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if ((Ejercicio = 0) or (Ejercicio <> MaxEjercicio)) then
                 begin
                    Ejercicio := MaxEjercicio;

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT * FROM DAME_CUENTAS_COMPRA_VENTA(:EMPRESA, :EJERCICIO, :CANAL)';
                          Close;
                          Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := QMConfWoocommerceCANAL.AsInteger;
                          ExecQuery;
                          CtaCompras := FieldByName['CTA_COMPRAS'].AsString;
                          CtaVentas := FieldByName['CTA_VENTAS'].AsString;
                          CtaDevCompras := FieldByName['CTA_DEV_COMPRAS'].AsString;
                          CtaDevVentas := FieldByName['CTA_DEV_VENTAS'].AsString;
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
                          SQL.Add(' INSERT INTO CON_CUENTAS_GES_FAM ( ');
                          SQL.Add(' EMPRESA, EJERCICIO, CANAL, FAMILIA, PAIS, CTA_COMPRAS, CTA_VENTAS, CTA_DEVOLUCION_COMPRAS, CTA_DEVOLUCION_VENTAS, ');
                          SQL.Add(' CTA_ABONO_COMPRAS, CTA_ABONO_VENTAS, TIPO_IVA, VENTA ');
                          SQL.Add(' /*, PTO_VERDE, ULT_MODIFICACION, CTA_COMPRAS_PGC, CTA_VENTAS_PGC, ');
                          SQL.Add(' CTA_DEVOLUCION_COMPRAS_PGC, CTA_DEVOLUCION_VENTAS_PGC, CTA_ABONO_COMPRAS_PGC, CTA_ABONO_VENTAS_PGC*/ ) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :FAMILIA, :PAIS, :CTA_COMPRAS, :CTA_VENTAS, :CTA_DEVOLUCION_COMPRAS, :CTA_DEVOLUCION_VENTAS, ');
                          SQL.Add(' :CTA_ABONO_COMPRAS, :CTA_ABONO_VENTAS, :TIPO_IVA, :VENTA ');
                          SQL.Add(' ) ');

                          Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := QMConfWoocommerceCANAL.AsInteger;
                          Params.ByName['FAMILIA'].AsString := FamiliaPadre;
                          Params.ByName['PAIS'].AsString := Pais;
                          Params.ByName['CTA_COMPRAS'].AsString := CtaCompras;
                          Params.ByName['CTA_VENTAS'].AsString := CtaVentas;
                          Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := CtaDevCompras;
                          Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := CtaDevVentas;
                          Params.ByName['CTA_ABONO_COMPRAS'].AsString := CtaCompras;
                          Params.ByName['CTA_ABONO_VENTAS'].AsString := CtaVentas;
                          Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                          Params.ByName['VENTA'].AsInteger := 1;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 // Relaciono categoria y familia
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_FAMILIA ( ');
                       SQL.Add(' ID_CONFIGURACION, ID_FAMILIA, ID_CATEGORY) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :ID_CONFIGURACION, :ID_FAMILIA, :ID_CATEGORY) ');
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                       Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
                       Params.ByName['ID_CATEGORY'].AsInteger := id_category;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
           end
           else
           begin
              // Si la familia ya existe actualizo datos (descripcion)
              FamiliaPadre := DameFamilia(IdFamilia);

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE ART_FAMILIAS ');
                    SQL.Add(' SET ');
                    SQL.Add(' TITULO = :TITULO ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_FAMILIA = :ID_FAMILIA ');
                    Params.ByName['TITULO'].AsString := Nombre;
                    Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;

        // Si no se sincronizo por que no cae dentro de fechas obtengo la familia padre.
        if (FamiliaPadre = '') then
        begin
           IdFamilia := DameIdFamiliaWoocommerce(QMConfWoocommerceID.AsInteger, id_category);
           FamiliaPadre := DameFamilia(IdFamilia);
        end;

        // Recorro la lista, importando subfamilias.
        for i := 0 to ListaSubCategorias.Count - 1 do
        begin
           if not SincronizaUnaFamilia(Desde, Hasta, StrToInt(ListaSubCategorias[i]), FamiliaPadre) then
              Result := False;
        end;
     end
     else
     begin
        // Es una subfamilia
        if ((MySQLDateTimeToDateTime(date_upd) > Desde) and
           (MySQLDateTimeToDateTime(date_upd) < Hasta)) then
        begin
           // Log[Log.Count - 1] := Format('   ' + _('Sincronizando subcategoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]);
           Log.Add(Format('   ' + _('Sincronizando subcategoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]));

           IdFamilia := DameIdFamilia(FamiliaPadre);
           IdSubFamilia := DameIdSubFamiliaWoocommerce(QMConfWoocommerceID.AsInteger, id_category);

           if (IdSubFamilia = 0) then
           begin
              // Codigo de la familia a sincronizar
              SubFamilia := Format('%.5d', [id_category]);

              if (Length(SubFamilia) > 5) then
              begin
                 SubFamilia := InputBox(_('SubFamilia'), format(_('Codigo para la SubFamilia %d - %s' + #13#10 + 'Vacio cancela importacion'), [id_category, Nombre]), '');
              end;

              if (Length(SubFamilia) <> 0) then
              begin
                 // Creo subfamilia
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO ART_SUBFAMILIAS ( ');
                       SQL.Add(' EMPRESA, SUBFAMILIA, TITULO, ORDEN, ID_FAMILIA, WEB) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :EMPRESA, :SUBFAMILIA, :TITULO, :ORDEN, :ID_FAMILIA, :WEB) ');
                       SQL.Add(' RETURNING ID_SUBFAMILIA ');
                       Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
                       Params.ByName['SUBFAMILIA'].AsString := SubFamilia;
                       Params.ByName['TITULO'].AsString := Nombre;
                       Params.ByName['ORDEN'].AsInteger := 0;
                       Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
                       Params.ByName['WEB'].AsInteger := 1;
                       ExecQuery;
                       IdSubFamilia := FieldByName['ID_SUBFAMILIA'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 // Relaciono categoria y familia
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_FAMILIA ( ');
                       SQL.Add(' ID_CONFIGURACION, ID_FAMILIA, ID_SUBFAMILIA, ID_CATEGORY) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :ID_CONFIGURACION, :ID_FAMILIA, :ID_SUBFAMILIA, :ID_CATEGORY) ');
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                       Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
                       Params.ByName['ID_SUBFAMILIA'].AsInteger := IdSubFamilia;
                       Params.ByName['ID_CATEGORY'].AsInteger := id_category;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end
              else
                 Result := False;
           end
           else
           begin
              // Actualizo subfamilia
              if (Nombre > '') then
              begin
                 // Creo subfamilia
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE ART_SUBFAMILIAS ');
                       SQL.Add(' SET ');
                       SQL.Add(' TITULO = :TITULO ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_SUBFAMILIA = :ID_SUBFAMILIA ');
                       Params.ByName['TITULO'].AsString := Nombre;
                       Params.ByName['ID_SUBFAMILIA'].AsInteger := IdSubFamilia;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
           end;
        end;
     end;

  (-*
  // Asocio la familia o subfamilia a los articulos
  if (IdSubFamilia = 0) then
  begin
     // Recorro la lista de productos asignado la familia.
     for i := 0 to ListaProductos.Count - 1 do
     begin
        // Obtener articulo de id_product y asingarle la familia si es distinta
        // id_product := StrToInt(ListaProductos[i])
        // ...
        // Params.ByName['FAMILIA'].AsString := FamiliaPadre;
     end;
  end
  else
  begin
     // Recorro la lista de productos asignado la subfamilia.
     for i := 0 to ListaProductos.Count - 1 do
     begin
        // Obtener articulo de id_product y asingarle la subfamilia si es distinta
        // id_product := StrToInt(ListaProductos[i])
        // ...
        // Params.ByName['FAMILIA'].AsString := FamiliaPadre;
        // Params.ByName['SUBFAMILIA'].AsString := SubFamilia;

        // Recorro la lista, asignando subfamilias.
        for i := 0 to ListaSubCategorias.Count - 1 do
        begin
           // Asignar subfamilia a producto
        end;
     end;
  end;
  *-)
  finally
     ListaSubCategorias.Free;
     ListaProductos.Free;
  end;
*)
end;}

{function TDMSincronizacionTiendaWoocommerce.DameIdFamiliaWoocommerce(IdConfiguracion, IdCategory: integer): integer;
begin
  (*
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_FAMILIA ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_FAMILIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_CATEGORY = :ID_CATEGORY ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_CATEGORY'].AsInteger := IdCategory;
        ExecQuery;
        Result := FieldByName['ID_FAMILIA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  *)
end;}

{function TDMSincronizacionTiendaWoocommerce.DameIdSubFamiliaWoocommerce(IdConfiguracion, IdCategory: integer): integer;
begin
  (*
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_SUBFAMILIA ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_FAMILIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_CATEGORY = :ID_CATEGORY ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_CATEGORY'].AsInteger := IdCategory;
        ExecQuery;
        Result := FieldByName['ID_SUBFAMILIA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  *)
end;}

{function TDMSincronizacionTiendaWoocommerce.DamePorcentajeIVA(id_tax_rules_group, id_country: integer): double;
var
  //i : integer;
  //id : integer;
  id_tax : integer;
  //Respuesta : TStrings;
  //CodigoRespuesta : integer;
  //Documento : TXMLDocument;
  //Nodo : IXMLNode;
begin
  // Grupo de Reglas para IVA. Esto ya lo tenemos en el parámetro id_tax_rules_group. Contiene *id*, name, active y deleted.
  // http://Woocommerce.delfos.net/api/tax_rule_groups/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  // Regla de IVA segun grupo y pais. Contiene id, id_state, id_countrey, *id_tax* y otros
  // http://Woocommerce.delfos.net/api/tax_rules?ws_key=ABC123ABC123ABC123ABC123ABC123AB&display=full&filter[id_tax_rules_group]=[2]&filter[id_country]=[3]

  // Porcentaje de IVA. Contiene id, *rate*, active, delete y name
  // http://Woocommerce.delfos.net/api/taxes/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  id_tax := DameIdTax(id_tax_rules_group, id_country);
  Result := DameTaxRate(id_tax);
end;}

{function TDMSincronizacionTiendaWoocommerce.DameIdTax(id_tax_rules_group, id_country: integer): integer;
(*
var
  i : integer;
  id : integer;
  iso_code : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  // Regla de IVA segun grupo y pais. Contiene id, id_state, id_countrey, *id_tax* y otros
  // http://Woocommerce.delfos.net/api/tax_rules?ws_key=ABC123ABC123ABC123ABC123ABC123AB&display=full&filter[id_tax_rules_group]=[2]&filter[id_country]=[3]

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del pais
     CodigoRespuesta := DMWoocommerce.WS_Get('tax_rules', 0, '&display=[id_tax]&filter[id_tax_rules_group]=[' + IntToStr(id_tax_rules_group) + ']&filter[id_country]=[' + IntToStr(id_country) + ']', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-tax_rules.xml');
     {$ENDIF}

// Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['tax_rules', 'tax_rule']);
           if Assigned(Nodo) then
           begin
              Result := StrToInt(DameDato(Nodo, ['id_tax']));
           end;
        end;
     end
     else
        ShowMessage('(tax_rules)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
*)
end;}

{function TDMSincronizacionTiendaWoocommerce.DameTaxRate(id_tax: integer): double;
(*
var
  i : integer;
  id : integer;
  iso_code : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  // Porcentaje de IVA. Contiene id, *rate*, active, delete y name
  // http://Woocommerce.delfos.net/api/taxes/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del pais
     CodigoRespuesta := DMWoocommerce.WS_Get('taxes', id_tax, '', Respuesta);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-taxes.xml');
     {$ENDIF}

// Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['tax']);
           if Assigned(Nodo) then
           begin
              Result := StrToFloatDec(DameDato(Nodo, ['rate']), '.');
           end;
        end;
     end
     else
        ShowMessage('(taxes)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
*)
end;}

function TDMSincronizacionTiendaWoocommerce.HayDetalle: boolean;
begin
  Result := (QMConfWoocommerceArticulo.RecordCount > 0);
end;

function TDMSincronizacionTiendaWoocommerce.CrearUnArticulo(IdArticulo: integer; SincronizarSiExiste: boolean = False): integer;
var
  Q : THYFIBQuery;
  //Combinaciones : TStrings;
  Respuesta : TStrings;
  JSONString : TStrings;
  Documento, NodoPadre, Nodo : TlkJSONbase;
  JSONObject : TlkJSONObject;
  //JSONArray : TlkJSONList;
  CodigoRespuesta : integer;
  id_product, id_variation : integer;
  //id_product_attribute, id_tax_rules_group, id_category : integer;
  product_type : string;
  //idFamilia, idSubFamilia : integer;
  //FicheroLog : string;
  Articulo, Titulo, Referencia, DescripcionCorta, DescripcionLarga : string;
  Precio : double;
  Stock, i : integer;
begin
  /// Crea un producto en Woocommerce
  Articulo := DameArticulo(IdArticulo);
  Result := 0;
  DMMain.LogIni(Format(_('Creando producto del articulo %s (id: %d)'), [Articulo, IdArticulo]));
  try
     Log.Add(Format(_('Creando producto del articulo  %s (id: %d)'), [Articulo, IdArticulo]));
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT ID_PRODUCT, ID_VARIATION, TITULO, REFERENCIA, DESCRIPCION_CORTA, DESCRIPCION_LARGA, PRECIO, STOCK, PRODUCT_TYPE ');
              SelectSQL.Add(' FROM SYS_CONF_WOOCOMMERCE_ARTICULO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
              SelectSQL.Add(' ID_A = :ID_A ');
              Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
              Params.ByName['ID_A'].AsInteger := IdArticulo;
              Open;

              id_product := FieldByName('ID_PRODUCT').AsInteger;
              id_variation := FieldByName('ID_VARIATION').AsInteger;
              Titulo := FieldByName('TITULO').AsString;
              Referencia := FieldByName('REFERENCIA').AsString;
              DescripcionCorta := FieldByName('DESCRIPCION_CORTA').AsString;
              DescripcionLarga := FieldByName('DESCRIPCION_LARGA').AsString;
              Precio := FieldByName('PRECIO').AsFloat;
              Stock := FieldByName('STOCK').AsInteger;
              if (id_variation <> 0) then
                 product_type := 'variation'
              else
                 product_type := 'simple';

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     DMMain.Log('Se obtuvo el id_product:' + IntToStr(id_product));

     if (id_variation > 0) then
        raise Exception.Create('No implementado creacion de variaciones');

     Log[Log.Count - 1] := Format(_('Creando producto del articulo %s (id: %d) - %s'), [Articulo, IdArticulo, Titulo]);
     if ((id_product = 0) or SincronizarSiExiste or (ConfirmaMensaje(_('El articulo ya esta asociado a un producto Woocommerce.' + #13#10 + 'Desea continuar?')))) then
     begin
        // Combinaciones := TStringList.Create;
        Respuesta := TStringList.Create;
        JSONString := TStringList.Create;
        try
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT * FROM VER_ARTICULOS_CUENTAS WHERE ID_A = :ID_A AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
                 Params.ByName['ID_A'].AsInteger := IdArticulo;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 ExecQuery;
              end;

              // Inicializo datos si estan vacios
              if (Trim(Titulo) = '') then
                 Titulo := Q.FieldByName['TITULO'].AsString;
              if (Trim(Referencia) = '') then
                 Referencia := Q.FieldByName['ARTICULO'].AsString;
              if (Trim(DescripcionCorta) = '') then
                 DescripcionCorta := Q.FieldByName['TITULO'].AsString;
              if (Trim(DescripcionLarga) = '') then
                 DescripcionLarga := Q.FieldByName['TITULO'].AsString;
              if (Precio = 0) then
                 Precio := DMMain.DamePrecioTarifa(QMConfWoocommerceTARIFA.AsString, Q.FieldByName['ARTICULO'].AsString, QMConfWoocommerceEMPRESA.AsInteger);
              if (Stock = 0) then
                 Stock := Trunc(DMMain.DameStockArticulo(QMConfWoocommerceEMPRESA.AsInteger, QMConfWoocommerceCANAL.AsInteger, Q.FieldByName['ARTICULO'].AsString, QMConfWoocommerceALMACEN.AsString));

              // Creamos json para envio
              Documento := TlkJSONObject.Create;
              try
                 with TlkJSONObject(Documento) do
                 begin
                    Add('name', Titulo);
                    Add('type', product_type); // simple / variation
                    Add('status', 'draft'); // draft / publish
                    Add('regular_price', FloatToStrDec(Precio, '.'));
                    // Esto es ReadOnly Add('price', FloatToStrDec(Precio, '.'));
                    Add('description', DescripcionLarga);
                    Add('short_description', DescripcionCorta);
                    Add('sku', Q.FieldByName['ARTICULO'].AsString);
                    Add('stock_quantity', Int(DMMain.DameStockArticulo(QMConfWoocommerceEMPRESA.AsInteger, QMConfWoocommerceCANAL.AsInteger, Q.FieldByName['ARTICULO'].AsString, QMConfWoocommerceALMACEN.AsString)));
                    Add('weight', FloatToStrDec(Q.FieldByName['PESO'].AsFloat, '.'));

                    // Dimensiones
                    (*
                    Objeto con tres atributos
                    "dimensions": {
                      "length": "",
                      "width": "",
                      "height": ""
                    }
                    *)
                    // Creo un objeto
                    JSONObject := TlkJSONObject.Create;
                    // Agrego atributos al objeto
                    JSONObject.Add('length', FloatToStrDec(0, '.'));
                    JSONObject.Add('width', FloatToStrDec(Q.FieldByName['DIAMETRO_UNIT'].AsFloat, '.'));
                    JSONObject.Add('height', FloatToStrDec(0, '.'));
                    // Agrego el objeto al documento
                    Add('dimensions', JSONObject);

                    // Categorias
                    (* Array con objetos con tres atributos.
                    *** name y slug son ReadOnly ***
                    "categories": [
                      {
                        "id": 9,
                        "name": "Clothing",
                        "slug": "clothing"
                      },
                      {
                        "id": 14,
                        "name": "T-shirts",
                        "slug": "t-shirts"
                      }
                    ]
                    *)
                    { Ejemplo:
                    // Creo array para insertar una o mas categorias
                    JSONArray := TlkJSONlist.Create;
                    // Creo objeto con valores de categoria
                    JSONObject := TlkJSONObject.Create;
                    JSONObject.Add('id', 9);
                    JSONObject.Add('name', 'Clothing'); // ReadOnly
                    JSONObject.Add('slug', 'clothing'); // ReadOnly
                    // Agrego la categoria al array
                    JSONArray.Add(JSONObject);

                    // Repito con segunda categoria
                    JSONObject := TlkJSONObject.Create;
                    JSONObject.Add('id', 14);
                    JSONObject.Add('name', 'T-shirts'); // ReadOnly
                    JSONObject.Add('slug', 't-shirts'); // ReadOnly
                    JSONArray.Add(JSONObject);

                    // Agrego array de categorias al documento
                    Add('categories', JSONArray);
                    }
                 end;

                 (* Ejemplo de como queda el JSON a enviar
                   {
                     "name":"SUELO FRAGIL 230X210,GLASSPACK",
                     "type":"simple",
                     "regular_price":"1234.56",
                     "description":"SUELO FRAGIL 230x210,Glasspack",
                     "short_description":"SUELO FRAGIL 230x210,Glasspack",
                     "sku":"00021",
                     "stock_quantity":0,
                     "weight":"1234.56",
                     "dimensions":{
                       "length":"0",
                       "width":"1234.56",
                       "height":"0"
                     },
                     "categories":[
                       {
                         "id":1,
                         "name":"Nombre de categoria 1 (ReadOnly)",
                         "slug":"Nombre de slug 1 (ReadOnly)"
                       },
                       {
                         "id":2,
                         "name":"Nombre de categoria 2 (ReadOnly)",
                         "slug":"Nombre de slug 2 (ReadOnly)"
                       }
                     ]
                   }
                 *)

                 i := 0;
                 JSONString.Text := GenerateReadableText(Documento, i);
              finally
                 Documento.Free;
              end;
           finally
              Q.Free;
           end;

           {$IFDEF Debug}
           JSONString.SaveToFile(DameTempPath + 'Products-Add.json');
           {$ENDIF}

           // Enviamos JSON
           CodigoRespuesta := DMWoocommerce.WS_Add('products', JSONString, Respuesta);

           {$IFDEF Debug}
           Respuesta.SaveToFile(DameTempPath+'Respuesta-Products-Add.json');
           {$ENDIF}

           DMMain.Log(Format('Respuesta ADD : %d', [CodigoRespuesta]));

           // HTTP Response code 200: Ok
           // HTTP Response code 201: Created
           if ((CodigoRespuesta = 200) or (CodigoRespuesta = 201)) then
           begin
              // Creamos documento json de respuesta
              Documento := TlkJSON.ParseText(Respuesta.Text);
              try
                 if Assigned(Documento) then
                 begin
                    NodoPadre := Documento;
                    // Id producto Generado
                    Nodo := NodoPadre.Field['id'];
                    if Assigned(Nodo) then
                       id_product := Nodo.Field['id'].Value;

                    DMMain.Log('El ID_procuct creado en woocommerce es:' + IntToStr(id_product));
                    DMMain.Log('El ID Conf:' + IntToStr(QMConfWoocommerceID.AsInteger));
                    DMMain.Log('El ID_A:' + IntToStr(IdArticulo));

                    if (id_product > 0) then
                    begin
                       // Actualizamos con el nuevo id producto
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_WOOCOMMERCE_ARTICULO ( ');
                             SQL.Add(' ID_CONFIGURACION, ID_A, ID_PRODUCT, ');
                             SQL.Add(' TITULO, REFERENCIA, DESCRIPCION_CORTA, DESCRIPCION_LARGA, PRECIO, STOCK) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :ID_CONFIGURACION, :ID_A, :ID_PRODUCT, ');
                             SQL.Add(' :TITULO, :REFERENCIA, :DESCRIPCION_CORTA, :DESCRIPCION_LARGA, :PRECIO, :STOCK) ');
                             SQL.Add(' MATCHING (ID_CONFIGURACION, ID_A) ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                             Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                             Params.ByName['ID_A'].AsInteger := IdArticulo;

                             Params.ByName['TITULO'].AsString := Titulo;
                             Params.ByName['REFERENCIA'].AsString := Referencia;
                             Params.ByName['DESCRIPCION_CORTA'].AsString := DescripcionCorta;
                             Params.ByName['DESCRIPCION_LARGA'].AsString := DescripcionLarga;
                             Params.ByName['PRECIO'].AsFloat := Precio;
                             Params.ByName['STOCK'].AsFloat := Stock;

                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                       Result := id_product;
                       Log.Add('Producto Woocommerce ' + IntToStr(id_product) + ' creado correctamente');
                       // SaveLog(DameTempPath + 'Creacion_producto_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.Log');
                    end;
                 end;
              finally
                 Documento.Free;
              end;
           end
           else
           begin
              Log[Log.Count - 1] := _('No se ha podido crear producto en Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text;
              ShowMessage('(products)' + _('No se ha podido crear producto en Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
           end;
        finally
           Respuesta.Free;
           JSONString.Free;
        end;
     end
     else
     begin
        Log[Log.Count - 1] := Format(_('El articulo %s ya esta asociado. Id Articulo %d - IdProduct :%d'), [Articulo, IdArticulo, id_product]);
     end;
  finally
     DMMain.LogFin(Format(_('Creando producto del articulo %s (id: %d)'), [Articulo, IdArticulo]));
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.FiltraTienda(Id: integer);
begin
  with QMConfWoocommerce do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_CONF_WOOCOMMERCE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID = :ID ');
     Params.ByName['ID'].AsInteger := Id;
     Open;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.AbreTaxRuleGroups;
//var
//i : integer;
//TaxRuleGroups : TStrings;
begin
  (*
  TaxRuleGroups := TStringList.Create;
  try
     // Obtengo lista de grupos de reglas de impuesto
     DMWoocommerce.WS_DameTaxRuleGroups(TaxRuleGroups);

     // Creo registros si no existen
     for i := 0 to TaxRuleGroups.Count - 1 do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_TAX_RULE_GR ( ');
              SQL.Add(' ID_CONFIGURACION, ID, DESCRIPCION, PAIS, TIPO) ');
              SQL.Add(' SELECT :ID_CONFIGURACION, :ID, :DESCRIPCION, :PAIS, :TIPO ');
              SQL.Add(' FROM RDB$DATABASE ');
              SQL.Add(' WHERE ');
              SQL.Add(' NOT EXISTS(SELECT ID ');
              SQL.Add('            FROM SYS_CONF_PRESTASHOP_TAX_RULE_GR ');
              SQL.Add('            WHERE ');
              SQL.Add('            ID_CONFIGURACION = :ID_CONFIGURACION AND ');
              SQL.Add('            ID = :ID) ');
              Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceSincID_CONFIGURACION.AsInteger;
              Params.ByName['ID'].AsInteger := integer(TaxRuleGroups.Objects[i]);
              Params.ByName['DESCRIPCION'].AsString := TaxRuleGroups[i];
              Params.ByName['PAIS'].AsString := REntorno.Pais;
              Params.ByName['TIPO'].AsInteger := 0;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  finally
     TaxRuleGroups.Free;
  end;

  QMConfWoocommerceTaxRuleGroup.Close;
  QMConfWoocommerceTaxRuleGroup.Open;
  *)
end;

procedure TDMSincronizacionTiendaWoocommerce.CierraTaxRuleGroups;
begin
  QMConfWoocommerceTaxRuleGroup.Close;
end;

{function TDMSincronizacionTiendaWoocommerce.DameCategoriaWoocommerce(IdConfiguracion, IdFamilia: integer): integer;
begin
  (*
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_CATEGORY ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_FAMILIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_FAMILIA = :ID_FAMILIA AND ');
        SQL.Add(' ID_SUBFAMILIA = 0 ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
        ExecQuery;
        Result := FieldByName['ID_CATEGORY'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  *)
end;}

{function TDMSincronizacionTiendaWoocommerce.DameSubCategoriaWoocommerce(IdConfiguracion, IdSubFamilia: integer): integer;
begin
  (*
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_CATEGORY ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_FAMILIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_SUBFAMILIA = :ID_SUBFAMILIA ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_SUBFAMILIA'].AsInteger := IdSubFamilia;
        ExecQuery;
        Result := FieldByName['ID_CATEGORY'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  *)
end;}

procedure TDMSincronizacionTiendaWoocommerce.CrearUnaFamilia(IdFamilia: integer; SincronizarSiExiste: boolean = False);
(*
var
  Q : THYFIBQuery;
  Respuesta : TStrings;
  Documento : TXMLDocument;
  CodigoRespuesta : integer;
  NodoPadre, Nodo, NodoLang : IXMLNode;
  id_category : integer;
  idSubFamilia : integer;
  Titulo : string;
  FicheroLog : string;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  /// Crea una familia (categoria) en Woocommerce
  /// Dependera de la familia root (root_category)

  Log.Add(Format(_('Creando familia id: %d'), [IdFamilia]));
  DMMain.Log(Format(_('Creando familia id: %d'), [IdFamilia]));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ID_CATEGORY FROM SYS_CONF_PRESTASHOP_FAMILIA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
           SelectSQL.Add(' ID_FAMILIA = :ID_FAMILIA AND ');
           SelectSQL.Add(' ID_SUBFAMILIA = 0 ');
           Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
           Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
           Open;

           id_category := FieldByName('ID_CATEGORY').AsInteger;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  DMMain.Log(Format(_('Creando familia id: %d - id_category asociada: %d'), [IdFamilia, id_category]));
  if ((id_category = 0) or SincronizarSiExiste) then
  begin
     Q := THYFIBQuery.Create(nil);
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM VER_FAMILIAS_CUENTAS WHERE ID_FAMILIA = :ID_FAMILIA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
           Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
        end;

        Log[Log.Count - 1] := Format(_('Creando familia id: %d - %s %s'), [IdFamilia, Q.FieldByName['FAMILIA'].AsString, Q.FieldByName['TITULO'].AsString]);

        // Obtengo datos del fabricantes
        CodigoRespuesta := DMWoocommerce.WS_Get('categories', 0, '&schema=blank', Respuesta);
        Respuesta.SaveToFile(DameTempPath+'Respuesta-Categories-blank.xml');

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Datos del producto
              NodoPadre := DameNodo(Documento.DocumentElement, ['category']);
              if Assigned(NodoPadre) then
              begin
                 Nodo := DameNodo(NodoPadre, ['id_parent']);
                 Nodo.Text := IntToStr(DMWoocommerce.id_root_category);
                 Nodo := DameNodo(NodoPadre, ['is_root_category']);
                 Nodo.Text := '0';
                 Nodo := DameNodo(NodoPadre, ['active']);
                 Nodo.Text := '1';

                 Titulo := Trim(Q.FieldByName['TITULO_WEB'].AsString);
                 if (Titulo = '') then
                    Titulo := Trim(Q.FieldByName['TITULO'].AsString);
                 Nodo := DameNodo(NodoPadre, ['name']);
                 SetDatoLenguage(Nodo, QMConfWoocommerceWS_LANGUAGE.AsInteger, Titulo);

                 Nodo := DameNodo(NodoPadre, ['description']);
                 SetDatoLenguage(Nodo, QMConfWoocommerceWS_LANGUAGE.AsInteger, Titulo);

                 // Enviar datos.
                 XML.SaveToFile(DameTempPath+'Respuesta-Categories-blank-Rellenado.xml');
                 CodigoRespuesta := DMWoocommerce.WS_Add('categories', XML, Respuesta);
                       {$IFDEF Debug}
                       Respuesta.SaveToFile(DameTempPath+'Respuesta-Categories-Add.xml');
                       {$ENDIF}
                 DMMain.Log(Format('Respuesta ADD : %d', [CodigoRespuesta]));
                 // HTTP Response code 201: Created
                 if (CodigoRespuesta = 201) then
                 begin
                    // En la respuesta estará el id con el que tengo que sincronizar.
                    Active := False;
                    XML.Text := Respuesta.Text;
                    Active := True;

                    NodoPadre := DameNodo(Documento.DocumentElement, ['category']);
                    id_category := StrToInt(DameDato(NodoPadre, ['id']));
                    Log.Add(Format('   ' + _('Categoria Woocommerce: %d'), [id_category]));
                    DMMain.Log(Format('Relacionando ID_FAMILIA, ID_CATEGORY: %d, %d', [IdFamilia, id_category]));
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_FAMILIA ( ');
                          SQL.Add(' ID_CONFIGURACION, ID_FAMILIA, ID_CATEGORY, ID_SUBFAMILIA) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :ID_CONFIGURACION, :ID_FAMILIA, :ID_CATEGORY, 0) ');
                          SQL.Add(' MATCHING (ID_CONFIGURACION, ID_FAMILIA, ID_SUBFAMILIA) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                          Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
                          Params.ByName['ID_CATEGORY'].AsInteger := id_category;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
              end;
           end;
        end
        else
           ShowMessage('(category)' + _('No se ha obtener datos de Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Q.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  end;
  *)
end;

procedure TDMSincronizacionTiendaWoocommerce.CrearUnaSubFamilia(IdFamilia, IdSubFamilia: integer; SincronizarSiExiste: boolean = False);
(*
var
  Q : THYFIBQuery;
  Respuesta : TStrings;
  Documento : TXMLDocument;
  CodigoRespuesta : integer;
  NodoPadre, Nodo, NodoLang : IXMLNode;
  id_category, id_parent : integer;
  FicheroLog : string;
*)
begin
  raise Exception.Create(_('No Implementado'));
(*
  /// Crea una subfamilia (categoria) en Woocommerce
  /// Dependera de la familia.
  /// Si la familia no existe se utilizara la familia root (root_category)

  Log.Add(Format(_('Creando subfamilia id: %d'), [IdSubFamilia]));
  DMMain.Log(Format(_('Creando subfamilia id: %d'), [IdSubFamilia]));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ID_CATEGORY FROM SYS_CONF_PRESTASHOP_FAMILIA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
           SelectSQL.Add(' ID_FAMILIA = :ID_FAMILIA AND ');
           SelectSQL.Add(' ID_SUBFAMILIA = :ID_SUBFAMILIA ');
           Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
           Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
           Params.ByName['ID_SUBFAMILIA'].AsInteger := IdSubFamilia;
           Open;

           id_category := FieldByName('ID_CATEGORY').AsInteger;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  DMMain.Log(Format(_('Creando subfamilia %d - id_category : %d'), [IdSubFamilia, id_category]));
  if ((id_category = 0) or SincronizarSiExiste) then
  begin
     Q := THYFIBQuery.Create(nil);
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM ART_SUBFAMILIAS WHERE ID_SUBFAMILIA = :ID_SUBFAMILIA';
           Params.ByName['ID_SUBFAMILIA'].AsInteger := IdSubFamilia;
           ExecQuery;
        end;

        Log[Log.Count - 1] := Format(_('Creando subfamilia id %d - %s %s'), [IdSubFamilia, Q.FieldByName['SUBFAMILIA'].AsString, Q.FieldByName['TITULO'].AsString]);

        // Obtengo la categoria padre para la familia de esta subfamilia
        id_parent := DameCategoriaWoocommerce(QMConfWoocommerceID.AsInteger, IdFamilia);
        if (id_parent = 0) then
           id_parent := DMWoocommerce.id_root_category;

        // Obtengo datos del fabricantes
        CodigoRespuesta := DMWoocommerce.WS_Get('categories', 0, '&schema=blank', Respuesta);
        Respuesta.SaveToFile(DameTempPath+'Respuesta-Categories-blank.xml');

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Datos del producto
              NodoPadre := DameNodo(Documento.DocumentElement, ['category']);
              if Assigned(NodoPadre) then
              begin
                 Nodo := DameNodo(NodoPadre, ['id_parent']);
                 Nodo.Text := IntToStr(id_parent);
                 Nodo := DameNodo(NodoPadre, ['is_root_category']);
                 Nodo.Text := '0';
                 Nodo := DameNodo(NodoPadre, ['active']);
                 Nodo.Text := '1';
                 Nodo := DameNodo(NodoPadre, ['name']);
                 SetDatoLenguage(Nodo, QMConfWoocommerceWS_LANGUAGE.AsInteger, Q.FieldByName['TITULO'].AsString);

                 Nodo := DameNodo(NodoPadre, ['description']);
                 SetDatoLenguage(Nodo, QMConfWoocommerceWS_LANGUAGE.AsInteger, Q.FieldByName['TITULO'].AsString);

                 // Enviar datos.
                 XML.SaveToFile(DameTempPath+'Respuesta-Categories-blank-Rellenado.xml');
                 CodigoRespuesta := DMWoocommerce.WS_Add('categories', XML, Respuesta);
                       {$IFDEF Debug}
                       Respuesta.SaveToFile(DameTempPath+'Respuesta-Categories-Add.xml');
                       {$ENDIF}
                 DMMain.Log(Format('Respuesta ADD : %d', [CodigoRespuesta]));
                 // HTTP Response code 201: Created
                 if (CodigoRespuesta = 201) then
                 begin
                    // En la respuesta estará el id con el que tengo que sincronizar.
                    Active := False;
                    XML.Text := Respuesta.Text;
                    Active := True;

                    NodoPadre := DameNodo(Documento.DocumentElement, ['category']);
                    id_category := StrToInt(DameDato(NodoPadre, ['id']));
                    Log.Add(Format('   ' + _('Categoria Woocommerce: %d'), [id_category]));
                    DMMain.Log(Format('Relacionando ID_FAMILIA, ID_SUBFAMILIA, ID_CATEGORY: %d, %d, %d', [IdFamilia, IdSubFamilia, id_category]));
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_FAMILIA ( ');
                          SQL.Add(' ID_CONFIGURACION, ID_FAMILIA, ID_CATEGORY, ID_SUBFAMILIA) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :ID_CONFIGURACION, :ID_FAMILIA, :ID_CATEGORY, :ID_SUBFAMILIA) ');
                          SQL.Add(' MATCHING (ID_CONFIGURACION, ID_FAMILIA, ID_SUBFAMILIA) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                          Params.ByName['ID_FAMILIA'].AsInteger := IdFamilia;
                          Params.ByName['ID_SUBFAMILIA'].AsInteger := IdSubFamilia;
                          Params.ByName['ID_CATEGORY'].AsInteger := id_category;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
              end;
           end;
        end
        else
           ShowMessage('(subcategory)' + _('No se ha obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Q.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  end;
*)
end;

{function TDMSincronizacionTiendaWoocommerce.DameCantidadArticulos: integer;
var
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  Documento : TlkJSONbase;
begin
  Result := 0;
  //obtenemos el total de articulos
  Respuesta := TStringList.Create;
  try
     if (DMWoocommerce.WS_Get('products/count', 0, '', respuesta, WP_Total, WP_TotalPages) = 200) then
     begin
        Documento := TlkJSON.ParseText(Respuesta.Text);
        {$IFDEF Debug}
        {Respuesta.SaveToFile(DameTempPath + 'Respuesta-products-count.json');
        {$ENDIF}
        {try
           if Assigned(Documento) then
              Result := Documento.Field['count'].Value;
        finally
           Documento.Free;
        end;
     end;
  finally
     Respuesta.Free;
  end;
end;}

function TDMSincronizacionTiendaWoocommerce.MySQLDateTimeToDateTime(s: string): TDateTime;
var
  AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond : word;
  AValue : TDateTime;
begin
  { 1234567890123456789 }
  { YYYY-MM-DD hh:nn:ss }

  AYear := StrToIntDef(Copy(s, 1, 4), 0);
  AMonth := StrToIntDef(Copy(s, 6, 2), 0);
  ADay := StrToIntDef(Copy(s, 9, 2), 0);
  AHour := StrToIntDef(Copy(s, 12, 2), 0);
  AMinute := StrToIntDef(Copy(s, 15, 2), 0);
  ASecond := StrToIntDef(Copy(s, 18, 2), 0);
  AMilliSecond := 0;

  if TryEncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond, AValue) then
     Result := AValue
  else
     Result := EncodeDate(1900, 01, 01);
end;

function TDMSincronizacionTiendaWoocommerce.DameArticuloALFA_1(Empresa: integer; Referencia: string): string;
begin
  /// Devuelve el articulo cuyo campo ALFA_1 = Referencia

  Result := '';
  if (Referencia > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ARTICULO FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ALFA_1 = :REFERENCIA';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['REFERENCIA'].AsString := Referencia;
           ExecQuery;
           Result := FieldByName['ARTICULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.CrearArticulosFiltrados;
//var
// WndList : Pointer;
//IdProducto : integer;
begin
  if Assigned(FMArticulos) then
  begin
     with FMArticulos.DM.QMArticulos do
     begin
        // Para obtener RecordCount
        Last;
        First;

        if ConfirmaMensaje(format(_('Desea subir %d articulos a la tienda Woocommerce'), [RecordCount])) then
        begin
           FSendCorreo := TFSendCorreo.Create(Self);
           // WndList := DisableTaskWindows(FInformacionProcesoProgreso.Handle);
           try
              with FSendCorreo do
              begin
                 Titulo(_('Creando articulos'));
                 MuestraBarraProgreso(FMArticulos.DM.QMArticulos.RecordCount);
              end;

              if (InicializaWebService) then
              begin
                 while not EOF do
                 begin
                    if (FieldByName('WEB').AsInteger = 1) then
                    begin
                       if (CrearUnArticulo(FieldByName('ID_A').AsInteger) > 0) then
                          FSendCorreo.Texto(Format(_('Se ha creado el articulo: %s - %s'), [FieldByName('ARTICULO').AsString, FieldByName('TITULO').AsString]))
                       else
                          FSendCorreo.Texto(Format(_('No se ha podido crear el articulo: %s - %s'), [FieldByName('ARTICULO').AsString, FieldByName('TITULO').AsString]));
                    end;

                    FSendCorreo.PBProgreso.StepIt;
                    Next;
                 end;
              end
              else
                 ShowMessage(_('No se pudo inicializar el servicio web'));
           finally
              SaveLog('Sincronizacion' + FormatDateTime('_yyyymmdd_hhnnss', Now) + '.Log');

              // FInformacionProcesoProgreso.Screen.Cursor := crDefault;
              // EnableTaskWindows(WndList);
              FSendCorreo.Close;
           end;
        end;
     end;
  end
  else
     ShowMessage(_('No existen articulos filtrados'));
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaStockArticulos(Desde, Hasta: TDateTime): integer;
var
  CodigoRespuesta : integer;
begin
  Result := 0;
  CodigoRespuesta := 200;
  FSendCorreo.Texto(_('Obteniendo Articulos a sincrinizar stock.'));
  DMMain.LogIni(_('Sincronizando Stock Articulos'));
  Log.Add('----------');
  Log.Add(_('Sincronizando Stock Articulos'));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT (SELECT MAX(FECHA) ');
           SelectSQL.Add('         FROM ART_MOV_STOCKS ');
           SelectSQL.Add('         WHERE ');
           SelectSQL.Add('         EMPRESA = C.EMPRESA AND ');
           SelectSQL.Add('         CANAL = :CANAL AND ');
           SelectSQL.Add('         ALMACEN = :ALMACEN AND ');
           SelectSQL.Add('         ARTICULO = A.ARTICULO) ULT_MODIFICACION, ');
           SelectSQL.Add('        P.ID_CONFIGURACION, P.ID_A, P.ID_PRODUCT, P.ID_VARIATION, ');
           SelectSQL.Add('        A.ARTICULO, P.TITULO, P.STOCK, A.TITULO_LARGO TITULO_ARTICULO, P.PRODUCT_TYPE ');
           SelectSQL.Add(' FROM SYS_CONF_WOOCOMMERCE_ARTICULO P ');
           SelectSQL.Add(' JOIN SYS_CONF_WOOCOMMERCE C ON P.ID_CONFIGURACION = C.ID ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON P.ID_A = A.ID_A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' P.ID_CONFIGURACION = :ID ');
           SelectSQL.Add(' ORDER BY 1 ');
           Params.ByName['ALMACEN'].AsString := QMConfWoocommerceALMACEN.AsString;
           Params.ByName['CANAL'].AsInteger := QMConfWoocommerceCANAL.AsInteger;
           Params.ByName['ID'].AsInteger := QMConfWoocommerceID.AsInteger;
           Open;
           DMMain.Log('Select : ' + SelectSQL.Text);
           while ((not EOF) {and (CodigoRespuesta = 200)}) do
           begin
              FSendCorreo.Texto(format(_('Sincronizando Stock Articulo %s %s' + #13#10 + 'Ult. Modificacion: %s'), [FieldByName('ARTICULO').AsString, FieldByName('TITULO_ARTICULO').AsString, DateTimeToStr(FieldByName('ULT_MODIFICACION').AsDateTime)]));

              if (FieldByName('PRODUCT_TYPE').AsString = 'simple') then
                 SincronizaProductType(FieldByName('ID_PRODUCT').AsInteger);

              if (FieldByName('ULT_MODIFICACION').AsDateTime > Desde) then
              begin
                 if (FieldByName('ID_PRODUCT').AsInteger > 0) then
                 begin
                    try
                       Log.Add('   ' + Format(_('Wincronizando stock de articulo %s'), [FieldByName('ARTICULO').AsString]));
                       CodigoRespuesta := SincronizaStockUnArticulo(FieldByName('ARTICULO').AsString, FieldByName('ID_PRODUCT').AsInteger, FieldByName('ID_VARIATION').AsInteger, FieldByName('TITULO_ARTICULO').AsString)
                    except
                       on e: Exception do
                          Log.Add('   ' + Format(_('No se pudo sincronizar stock de articulo %s'), [FieldByName('ARTICULO').AsString]) + #13#10 + e.message);

                    end;
                 end
                 else
                    Log.Add('   ' + Format(_('Articulo %s no esta relacionado con Woocommerce'), [FieldByName('ARTICULO').AsString]));
              end;

              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  if (CodigoRespuesta <> 200) then
     Result := CodigoRespuesta;

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaStockUnArticulo(Articulo: string; id_product, id_variation: integer; Titulo: string): integer;
var
  Respuesta : TStrings;
  CodigoRespuesta, i, IdArticulo, id_product_respuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONbase;
  Stock : double;
  //StockWoocommerce : double;
  JSONString : TStrings;
begin
  Result := 0;

  Respuesta := TStringList.Create;
  JSONString := TStringList.Create;
  try
     Stock := DMMain.DameStockArticulo(QMConfWoocommerceEMPRESA.AsInteger, QMConfWoocommerceCANAL.AsInteger, Articulo, QMConfWoocommerceALMACEN.AsString);
     if (Stock < 0) then
        Stock := 0;
     IdArticulo := UDameDato.DameIDArticulo(Articulo, QMConfWoocommerceEMPRESA.AsInteger);

     DMMain.Log(format('Articulo: %s --> Stock: %d', [Articulo, Trunc(Stock)]));
     Log.Add('   ' + format('Articulo: %s --> Stock: %d', [Articulo, Trunc(Stock)]));

     // Creamos JSON para envio
     Documento := TlkJSONObject.Create;
     try
        with TlkJSONObject(Documento) do
        begin
           Add('manage_stock', True);
           // El stock en Woocommerce es en enteros
           Add('stock_quantity', Trunc(Stock));
        end;

        i := 0;
        JSONString.Text := GenerateReadableText(Documento, i);
     finally
        Documento.Free;
     end;

  {$IFDEF Debug}
  JSONString.SaveToFile(DameTempPath + 'Products-Edit-Stock.json');
  {$ENDIF}

     // Enviamos JSON
     if (id_variation = 0) then
        CodigoRespuesta := DMWoocommerce.WS_edit('products', id_product, JSONString, Respuesta)
     else
        CodigoRespuesta := DMWoocommerce.WS_edit(format('products/%d/variations', [id_product]), id_variation, JSONString, Respuesta);

  {$IFDEF Debug}
  Respuesta.SaveToFile(DameTempPath + 'Respuesta-Edit-Stock-Respuesta.json');
  {$ENDIF}

     // HTTP Response code 200: Ok
     // HTTP Response code 201: Created
     if ((CodigoRespuesta = 200) or (CodigoRespuesta = 201)) then
     begin
        // Creamos documento json de respuesta
        Documento := TlkJSON.ParseText(Respuesta.Text);
        try
           if Assigned(Documento) then
           begin
              NodoPadre := Documento;
              // Id producto Generado
              Nodo := NodoPadre.Field['id'];
              if Assigned(Nodo) then
                 id_product_respuesta := Nodo.Field['id'].Value;

              if (id_product_respuesta = id_product) then
              begin
                 // Insertamos o actualizamos con el nuevo id producto
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add('UPDATE OR INSERT INTO SYS_CONF_WOOCOMMERCE_ARTICULO (  ');
                       SQL.Add('ID_CONFIGURACION, ID_A, ID_PRODUCT, STOCK)  ');
                       SQL.Add('VALUES (  ');
                       SQL.Add(':ID_CONFIGURACION, :ID_A, :ID_PRODUCT, :STOCK)  ');
                       SQL.Add('MATCHING (ID_CONFIGURACION, ID_A)  ');

                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                       Params.ByName['ID_PRODUCT'].AsInteger := id_product_respuesta;
                       Params.ByName['ID_A'].AsInteger := IdArticulo;
                       Params.ByName['STOCK'].AsFloat := Trunc(Stock);
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                    Result := CodigoRespuesta;
                 end;
              end
              else
              begin
                 DMMain.Log(format(_('*** Id_product (%d) y su respuesta (%d) no coinciden respuesta'), [id_product, id_product_respuesta]));
              end;
           end;
        finally
           Documento.Free;
        end;
     end
     else
     begin
        Log.Add(_('No se ha podido modificar el stock del producto en Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
        // ShowMessage('(products)' + _('No se ha podido modificar el stock del producto en Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     end;
  finally
     Respuesta.Free;
     JSONString.Free;
  end;
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaPrecioArticulos(Desde, Hasta: TDateTime): integer;
var
  CodigoRespuesta : integer;
  TarifaIVAIncluido : boolean;
  Precio : double;
begin
  Result := 0;

  CodigoRespuesta := 200;
  FSendCorreo.Texto(_('Obteniendo Articulos a sincrinizar precio.'));
  DMMain.LogIni(_('Sincronizando Precio Articulos'));
  Log.Add(_('Sincronizando Precio Articulos'));

  TarifaIVAIncluido := TarifaEsIvaIncluido(QMConfWoocommerceTARIFA.AsString);

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT T.ID_A, T.ARTICULO, T.PRECIO_VENTA, P.ID_PRODUCT, P.ID_VARIATION, T.ULT_MODIFICACION, A.TITULO_LARGO AS TITULO, I.P_IVA ');
           SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS T ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON T.ID_A = A.ID_A ');
           SelectSQL.Add(' JOIN CON_CUENTAS_GES_ART C ON A.EMPRESA = C.EMPRESA AND A.ARTICULO = C.ARTICULO ');
           SelectSQL.Add(' JOIN EMP_CANALES CC ON C.EMPRESA = CC.EMPRESA AND C.EJERCICIO = CC.EJERCICIO AND C.CANAL = CC.CANAL ');
           SelectSQL.Add(' JOIN SYS_TIPO_IVA I ON C.TIPO_IVA = I.TIPO AND CC.PAIS = I.PAIS ');
           SelectSQL.Add(' JOIN SYS_CONF_WOOCOMMERCE_ARTICULO P ON T.ID_A = P.ID_A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' C.CANAL = :CANAL AND ');
           SelectSQL.Add(' T.TARIFA = :TARIFA AND ');
           SelectSQL.Add(' T.ULT_MODIFICACION > :ULT_MODIFICACION AND ');
           SelectSQL.Add(' P.ID_CONFIGURACION = :ID ');
           SelectSQL.Add(' ORDER BY T.ULT_MODIFICACION ');
           Params.ByName['EMPRESA'].AsInteger := QMConfWoocommerceEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := QMConfWoocommerceCANAL.AsInteger;
           Params.ByName['TARIFA'].AsString := QMConfWoocommerceTARIFA.AsString;
           Params.ByName['ID'].AsInteger := QMConfWoocommerceID.AsInteger;
           Params.ByName['ULT_MODIFICACION'].AsDateTime := Desde;
           Open;

           while ((not EOF) {and (CodigoRespuesta = 200)}) do
           begin
              FSendCorreo.Texto(format(_('Sincronizando Precio Articulo %s %s' + #13#10 + 'Ult. Modificacion: %s'), [FieldByName('ARTICULO').AsString, FieldByName('TITULO').AsString, DateTimeToStr(FieldByName('ULT_MODIFICACION').AsDateTime)]));
              if (FieldByName('ULT_MODIFICACION').AsDateTime > Desde) then
              begin
                 Precio := FieldByName('PRECIO_VENTA').AsFloat;
                 if TarifaIVAIncluido then
                 begin
                    // Quito la cuota del IVA dejando 6 dígitos decimales.
                    Precio := SimpleRoundTo(Precio / (1 + FieldByName('P_IVA').AsFloat / 100), -6);
                 end;
                 CodigoRespuesta := SincronizaPrecioUnArticulo(Precio, FieldByName('ID_PRODUCT').AsInteger, FieldByName('ID_VARIATION').AsInteger, FieldByName('ARTICULO').AsString, FieldByName('TITULO').AsString);
              end;

              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  if (CodigoRespuesta <> 200) then
     Result := CodigoRespuesta;

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaPrecioUnArticulo(Precio: double; id_product, id_variation: integer; Articulo, Titulo: string): integer;
var
  Respuesta : TStrings;
  CodigoRespuesta, IdArticulo, i, id_product_respuesta : integer;
  Documento, NodoPadre, Nodo : TlkJSONbase;
  JSONString : TStrings;
begin
  Log.Add('   ' + Format(_('Sincronizando precio de %s - %s - Precio: %.2f'), [Articulo, Titulo, Precio]));
  DMMain.Log('   ' + Format(_('Sincronizando precio de %s - %s - Precio: %.3f'), [Articulo, Titulo, Precio]));

  Respuesta := TStringList.Create;
  JSONString := TStringList.Create;
  try
     IdArticulo := UDameDato.DameIDArticulo(Articulo, QMConfWoocommerceEMPRESA.AsInteger);

     // Creamos json para envio
     Documento := TlkJSONObject.Create;
     try
        with TlkJSONObject(Documento) do
        begin
           // Add('price', FloatToStrDec(Precio, '.')); Este campo es Read-Only
           Add('regular_price', FloatToStrDec(Precio, '.'));

           if (Titulo > '') then
              Add('name', Titulo);
        end;

        i := 0;
        JSONString.Text := GenerateReadableText(Documento, i);
     finally
        Documento.Free;
     end;

    {$IFDEF Debug}
    JSONString.SaveToFile(DameTempPath + 'Products-Edit-Price.json');
    {$ENDIF}

     Result := 0;

     // Enviamos JSON
     if (id_variation = 0) then
        CodigoRespuesta := DMWoocommerce.WS_edit('products', id_product, JSONString, Respuesta)
     else
        CodigoRespuesta := DMWoocommerce.WS_edit(format('products/%d/variations', [id_product]), id_variation, JSONString, Respuesta);

    {$IFDEF Debug}
    Respuesta.SaveToFile(DameTempPath + 'Respuesta-Edit-Price-Respuesta.json');
    {$ENDIF}

     // HTTP Response code 200: Ok
     // HTTP Response code 201: Created
     if ((CodigoRespuesta = 200) or (CodigoRespuesta = 201)) then
     begin
        // Creamos documento json de respuesta
        Documento := TlkJSON.ParseText(Respuesta.Text);
        try
           if Assigned(Documento) then
           begin
              NodoPadre := Documento;
              // Id producto Generado
              Nodo := NodoPadre.Field['id'];
              if Assigned(Nodo) then
                 id_product_respuesta := Nodo.Field['id'].Value;

              if (id_product = id_product_respuesta) then
              begin
                 //Actualizamos con el nuevo id producto
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add('UPDATE SYS_CONF_WOOCOMMERCE_ARTICULO ');
                       SQL.Add('SET ');
                       SQL.Add('ID_PRODUCT = :ID_PRODUCT, ');
                       SQL.Add('PRECIO = :PRECIO ');
                       SQL.Add('WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                       SQL.Add('ID_A = :ID_A ');

                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                       Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                       Params.ByName['ID_A'].AsInteger := IdArticulo;
                       Params.ByName['PRECIO'].AsFloat := Precio;

                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 Result := CodigoRespuesta;
              end
              else
              begin
                 DMMain.Log(format(_('*** Id_product (%d) y su respuesta (%d) no coinciden respuesta'), [id_product, id_product_respuesta]));
              end;
           end;
        finally
           Documento.Free;
        end;
     end
     else
     begin
        Log.Add(_('No se ha podido modificar el precio del producto en Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
        // ShowMessage('(products)' + _('No se ha podido modificar el precio del producto en Woocommerce.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     end;
  finally
     Respuesta.Free;
     JSONString.Free;
  end;
end;

function TDMSincronizacionTiendaWoocommerce.SincronizaProductType(id_product: integer): integer;
var
  //i : integer;
  id : integer;
  product_type : string;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  CodigoRespuesta : integer;
  Documento : TlkJSONObject;
  //Nodo : TlkJSONObject;
  //NodoPadre : TlkJSONObject;
  //s : string;
begin
  /// Sincroniza el tipo de producto de un id_product con un articulo existente.
  /// Si se realiza con exito devuelve el tipo de producto (0-simple, 1-variation)
  Log.Add(Format(_('Sincronizando ProductType de producto %d'), [id_product]));
  DMMain.Log(Format(_('Sincronizando ProductType de producto %d'), [id_product]));

  Result := 0;

  Respuesta := TStringList.Create;
  try
     try
        // Obtenemos datos del Producto
        CodigoRespuesta := DMWoocommerce.WS_Get('products', id_product, '', Respuesta, WP_Total, WP_TotalPages);
        DMMain.Log(format('WS_Get.products(%d)', [id_product]));
        DMMain.Log(format('WS_Get.WP_Total     : %d', [WP_Total]));
        DMMain.Log(format('WS_Get.WP_TotalPages: %d', [WP_TotalPages]));
        DMMain.Log(format('WS_Get.Respuesta    : %d', [CodigoRespuesta]));
        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-Products-uno.json');
        {$ENDIF}

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
           try
              if Assigned(Documento) then
              begin
                 //Nodo := Documento;

                 // Id producto Woocommerce
                 id := StrToIntDef(DameDato(Documento, ['id']), 0);
                 if (id <> id_product) then
                    raise Exception.Create(_('El id de producto a sincronizar no conicide que el id obtenido de Woocommerce'));

                 DMMain.LogIni('Obteniendo datos de JSON');
                 // simple / variation (articulo simple o articulo con combinaciones)
                 product_type := DameDato(Documento, ['type']);
                 DMMain.Log(format('Tipo de Producto: %s', [product_type]));
                 DMMain.LogFin('');

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       DMMain.Log('UPDATE SYS_CONF_WOOCOMMERCE_ARTICULO');
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE SYS_CONF_WOOCOMMERCE_ARTICULO ');
                       SQL.Add(' SET  ');
                       SQL.Add(' PRODUCT_TYPE = :PRODUCT_TYPE ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                       SQL.Add(' ID_PRODUCT = :ID_PRODUCT');
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfWoocommerceID.AsInteger;
                       Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                       Params.ByName['PRODUCT_TYPE'].AsString := product_type;
                       {
                       if (product_type = 'simple') then
                          Params.ByName['PRODUCT_TYPE'].AsInteger := 0
                       else
                       if (product_type = 'variation') then
                          Params.ByName['PRODUCT_TYPE'].AsInteger := 1
                       else
                          Params.ByName['PRODUCT_TYPE'].AsInteger := -1;
                       }
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
           finally
              Documento.Free;
           end;

           if (product_type = 'simple') then
              Result := 0
           else
           if (product_type = 'variation') then
              Result := 1
           else
              Result := -1;
        end
        else
           Result := -1;
     except
        on E: Exception do
        begin
           Log.Add(Format(_('No se ha podido sincronizar tipo de producto del id_product %d') + #13#10 + E.Message, [id_product]));
           DMMain.Log(Format(_('No se ha podido sincronizar tipo de producto del id_product %d') + #13#10 + E.Message, [id_product]));
        end;
     end;
  finally
     Respuesta.Free;
  end;
end;

{function TDMSincronizacionTiendaWoocommerce.DameDireccionWoocommerce(IdConfiguracion, IdAddress, Tercero: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DIRECCION ');
        SQL.Add(' FROM SYS_CONF_WOOCOMMERCE_CLI_DIR P ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON D.TERCERO = P.TERCERO AND D.DIRECCION = P.DIRECCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' P.ID_ADDRESS = :ID_ADDRESS AND ');
        SQL.Add(' P.TERCERO = :TERCERO ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_ADDRESS'].AsInteger := IdAddress;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        Result := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;}

procedure TDMSincronizacionTiendaWoocommerce.FiltrarProductosWC(Valor: string; SoloActivos, SoloNoSincronizados: boolean);
begin
  /// Filtra productos

  with QMProductosWC do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_SYS_CONF_WOOCOMMERCE_PROD ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');

     { TODO : Determinar como saber si esta marcado como producto/varicaion activo. }
     {
     if SoloActivos then
        SelectSQL.Add(' AND PRODUCT_ACTIVE = 1 ');
     }
     if SoloNoSincronizados then
        SelectSQL.Add(' AND COALESCE(ID_A, 0) = 0 ');

     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_PRODUCT = :VALOR OR ');
           SelectSQL.Add(' ID_VARIATION = :VALOR OR ');
           SelectSQL.Add(' ID_A = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(TITLE) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(ARTICULO) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(TITULO_LARGO) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');

        SelectSQL.Add(' UPPER(PRODUCT_TYPE) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(SKU) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(CATALOG_VISIBILITY) LIKE ''%'' || UPPER(:VALOR) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_PRODUCT, ID_VARIATION');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
end;

procedure TDMSincronizacionTiendaWoocommerce.QMProductosWCARTICULOChange(Sender: TField);
begin
  QMProductosWCID_A.AsInteger := UDameDato.DameIdArticulo(QMProductosWCARTIcULO.AsString, QMConfWoocommerceEMPRESA.AsInteger);
end;

end.
