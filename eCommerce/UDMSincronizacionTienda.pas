{ TODO : Terminar la importacion de subfamilias. }
{ TODO : Sincronizar idiomas de articulos }

unit UDMSincronizacionTienda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, HYFIBQuery, StrUtils, DateUtils,
  DB, FIBDataSet, FIBDatabase, FIBTableDataSet, UFIBModificados, XMLDoc, XMLIntf;

type
  TDMSincronizacionTienda = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     QMConfPrestaShop: TFIBTableSet;
     DSQMConfPrestaShop: TDataSource;
     QMConfPrestaShopID: TIntegerField;
     QMConfPrestaShopTITULO: TFIBStringField;
     QMConfPrestaShopWEB: TFIBStringField;
     QMConfPrestaShopSinc: TFIBTableSet;
     DSQMConfPrestaShopSinc: TDataSource;
     QMConfPrestaShopSincID: TIntegerField;
     QMConfPrestaShopSincTIPO: TFIBStringField;
     QMConfPrestaShopSincID_CONFIGURACION: TIntegerField;
     QMConfPrestaShopSincULT_SINCRONIZACION: TDateTimeField;
     QMConfPrestaShopSincULT_REGISTRO: TIntegerField;
     QMConfPrestaShopSincACTIVO: TIntegerField;
     QMConfPrestaShopEMPRESA: TIntegerField;
     QMConfPrestaShopCANAL: TIntegerField;
     QMConfPrestaShopSERIE: TFIBStringField;
     QMConfPrestaShopACTIVO: TIntegerField;
     QMConfPrestaShopPREFIJO_ART: TFIBStringField;
     QMConfPrestaShopALMACEN: TFIBStringField;
     QMConfPrestaShopAGENTE: TIntegerField;
     QMConfPrestaShopSOLO_CLIENTE_CON_PEDIDO: TIntegerField;
     QMConfPrestaShopUTILIZA_MODULO_PAYPAL: TIntegerField;
     QMConfPrestaShopART_SIN_CONTROL_STOCK: TIntegerField;
     QMConfPrestaShopCliente: TFIBTableSet;
     DSQMConfPrestaShopCliente: TDataSource;
     QMConfPrestaShopClienteID_CONFIGURACION: TIntegerField;
     QMConfPrestaShopClienteID_CLIENTE: TIntegerField;
     QMConfPrestaShopClienteID_CUSTOMER: TIntegerField;
     QMConfPrestaShopClienteULT_SINCRONIZACION: TDateTimeField;
     QMConfPrestaShopClienteCLIENTE: TIntegerField;
     QMConfPrestaShopClienteTERCERO: TIntegerField;
     QMConfPrestaShopClienteNOMBRE_R_SOCIAL: TFIBStringField;
     QMConfPrestaShopClienteDir: TFIBTableSet;
     DSQMConfPrestaShopClienteDir: TDataSource;
     QMConfPrestaShopClienteDirID_CONFIGURACION: TIntegerField;
     QMConfPrestaShopClienteDirID_ADDRESS: TIntegerField;
     QMConfPrestaShopClienteDirULT_SINCRONIZACION: TDateTimeField;
     QMConfPrestaShopClienteDirTERCERO: TIntegerField;
     QMConfPrestaShopClienteDirDIRECCION: TIntegerField;
     QMConfPrestaShopClienteDirNOMBRE_R_SOCIAL: TFIBStringField;
     QMConfPrestaShopClienteDirDIR_COMPLETA_N: TFIBStringField;
     QMConfPrestaShopClienteDirCLIENTE: TIntegerField;
     QMConfPrestaShopUTILIZA_REF_PRESTAHOP: TIntegerField;
     QMConfPrestaShopArticulo: TFIBTableSet;
     DSQMConfPrestaShopArticulo: TDataSource;
     QMConfPrestaShopArticuloID_CONFIGURACION: TIntegerField;
     QMConfPrestaShopArticuloID_A: TIntegerField;
     QMConfPrestaShopArticuloID_PRODUCT: TIntegerField;
     QMConfPrestaShopArticuloID_PRODUCT_ATTRIBUTE: TIntegerField;
     QMConfPrestaShopArticuloID_ATTRIBUTE: TIntegerField;
     QMConfPrestaShopArticuloID_ATTRIBUTES: TFIBStringField;
     QMConfPrestaShopArticuloULT_SINCRONIZACION: TDateTimeField;
     QMConfPrestaShopArticuloARTICULO: TFIBStringField;
     QMConfPrestaShopArticuloTITULO: TFIBStringField;
     QMConfPrestaShopVERSION_PRESTASHOP: TFIBStringField;
     QMConfPrestaShopID_TIENDA_ARTICULOS: TIntegerField;
     QMConfPrestaShopWS_URL: TFIBStringField;
     QMConfPrestaShopWS_KEY: TFIBStringField;
     QMConfPrestaShopWS_VERSION: TFIBStringField;
     QMConfPrestaShopWS_DEBUG: TIntegerField;
     QMConfPrestaShopWS_LANGUAGE: TIntegerField;
     QMConfPrestaShopWS_ORDER_STATE: TIntegerField;
     QMConfPrestaShopTaxRuleGroup: TFIBTableSet;
     DSQMConfPrestaShopTaxRuleGroup: TDataSource;
     QMConfPrestaShopTaxRuleGroupID_CONFIGURACION: TIntegerField;
     QMConfPrestaShopTaxRuleGroupID: TIntegerField;
     QMConfPrestaShopTaxRuleGroupDESCRIPCION: TFIBStringField;
     QMConfPrestaShopTaxRuleGroupPAIS: TFIBStringField;
     QMConfPrestaShopTaxRuleGroupTIPO: TIntegerField;
     QMConfPrestaShopTaxRuleGroupTITULO: TFIBStringField;
     QMConfPrestaShopTaxRuleGroupP_IVA: TFloatField;
     QMConfPrestaShopTARIFA: TFIBStringField;
     QMConfPrestaShopSincORDEN: TIntegerField;
     QMConfPrestaShopSincTITULO: TFIBStringField;
     QMConfPrestaShopArticuloID_STOCK_AVAILABLE: TIntegerField;
     QMConfPrestaShopArticuloREFERENCIA: TFIBStringField;
     QMConfPrestaShopArticuloDESCRIPCION_CORTA: TBlobField;
     QMConfPrestaShopArticuloDESCRIPCION_LARGA: TBlobField;
     QMConfPrestaShopArticuloPRECIO: TFloatField;
     QMConfPrestaShopArticuloSTOCK: TFloatField;
     QMConfPrestaShopArticuloTITULO_ARTICULO: TFIBStringField;
     QMConfPrestaShopWEB_BACKOFFICE: TFIBStringField;
     QMConfPrestaShopMANTENER_DESCRIPCIONES: TIntegerField;
     QMConfPrestaShopMANTENER_PRECIO: TIntegerField;
     QMConfPrestaShopCLIENTE_BASE: TIntegerField;
     QMProductosPS: TFIBTableSet;
     DSQMProductosPS: TDataSource;
     QMProductosPSID_CONFIGURACION: TIntegerField;
     QMProductosPSID_PRODUCT: TIntegerField;
     QMProductosPSID_ATTRIBUTE: TIntegerField;
     QMProductosPSID_ATTRIBUTES: TFIBStringField;
     QMProductosPSID_PRODUCT_ATTRIBUTE: TIntegerField;
     QMProductosPSID_MANUFACTURER: TIntegerField;
     QMProductosPSID_SUPPLIER: TIntegerField;
     QMProductosPSID_CATEGORY_DEFAULT: TIntegerField;
     QMProductosPSREFERENCE: TFIBStringField;
     QMProductosPSSUPPLIER_REFERENCE: TFIBStringField;
     QMProductosPSEAN13: TFIBStringField;
     QMProductosPSUPC: TFIBStringField;
     QMProductosPSISBN: TFIBStringField;
     QMProductosPSPRODUCT_NAME: TFIBStringField;
     QMProductosPSDESCRIPCIONCORTA: TMemoField;
     QMProductosPSDESCRIPCIONLARGA: TMemoField;
     QMProductosPSWEIGHT: TFloatField;
     QMProductosPSPRICE: TFloatField;
     QMProductosPSID_TAX_RULES_GROUP: TIntegerField;
     QMProductosPSPRODUCT_ACTIVE: TIntegerField;
     QMProductosPSSTOCK: TFloatField;
     QMProductosPSID_STOCK_AVAILABLE: TIntegerField;
     QMProductosPSDATE_UPD: TDateTimeField;
     QMProductosPSRAW_XML: TMemoField;
     QMProductosPSID_A: TIntegerField;
     QMProductosPSARTICULO: TFIBStringField;
     QMProductosPSTITULO_LARGO: TFIBStringField;
     QMOrdersPS: TFIBTableSet;
     DSQMOrdersPS: TDataSource;
     QMOrdersPSID_CONFIGURACION: TIntegerField;
     QMOrdersPSID_ORDER: TIntegerField;
     QMOrdersPSCURRENT_STATE: TIntegerField;
     QMOrdersPSDATE_ADD: TDateTimeField;
     QMOrdersPSDATE_UPD: TDateTimeField;
     QMOrdersPSINVOICE_NUMBER: TIntegerField;
     QMOrdersPSINVOICE_DATE: TDateTimeField;
     QMOrdersPSDELIVERY_NUMBER: TIntegerField;
     QMOrdersPSDELIVERY_DATE: TDateTimeField;
     QMOrdersPSREFERENCE: TFIBStringField;
     QMOrdersPSID_ADDRESS_DELIVERY: TIntegerField;
     QMOrdersPSID_ADDRESS_INVOICE: TIntegerField;
     QMOrdersPSID_CUSTOMER: TIntegerField;
     QMOrdersPSID_CARRIER: TIntegerField;
     QMOrdersPSMODULE: TFIBStringField;
     QMOrdersPSSHIPPING_NUMBER: TFIBStringField;
     QMOrdersPSPAYMENT: TFIBStringField;
     QMOrdersPSTOTAL_DISCOUNTS: TFloatField;
     QMOrdersPSTOTAL_PAID: TFloatField;
     QMOrdersPSTOTAL_PAID_TAX_INCL: TFloatField;
     QMOrdersPSTOTAL_PAID_TAX_EXCL: TFloatField;
     QMOrdersPSTOTAL_SHIPPING: TFloatField;
     QMOrdersPSCARRIER_TAX_RATE: TFloatField;
     QMOrdersPSRAW_XML: TMemoField;
     QMOrdersPSID_S: TIntegerField;
     QMOrdersPSEMPRESA: TIntegerField;
     QMOrdersPSEJERCICIO: TIntegerField;
     QMOrdersPSCANAL: TIntegerField;
     QMOrdersPSSERIE: TFIBStringField;
     QMOrdersPSTIPO: TFIBStringField;
     QMOrdersPSRIG: TIntegerField;
     QMOrdersPSCLIENTE: TIntegerField;
     QMOrdersPSS_BASES: TFloatField;
     QMOrdersPSS_CUOTA_IVA: TFloatField;
     QMOrdersPSS_CUOTA_RE: TFloatField;
     QMOrdersPSLIQUIDO: TFloatField;
     QMOrdersPSESTADO: TIntegerField;
     QMOrdersPSTITULO_ESTADO: TStringField;
     QMConfPrestaShopCUENTA_CLIENTE: TFIBStringField;
     QMConfPrestaShopIMPORTAR_ARTICULOS_VARIOS: TIntegerField;
     QMOrdersStatesPS: TFIBTableSet;
     DSQMOrdersStatesPS: TDataSource;
     QMOrdersStatesPSID_CONFIGURACION: TIntegerField;
     QMOrdersStatesPSID: TIntegerField;
     QMOrdersStatesPSUNREMOVABLE: TIntegerField;
     QMOrdersStatesPSDELIVERY: TIntegerField;
     QMOrdersStatesPSHIDDEN: TIntegerField;
     QMOrdersStatesPSSEND_EMAIL: TIntegerField;
     QMOrdersStatesPSMOD_NAME: TFIBStringField;
     QMOrdersStatesPSINVOICE: TIntegerField;
     QMOrdersStatesPSCOLOR_HEX: TFIBStringField;
     QMOrdersStatesPSLOGABLE: TIntegerField;
     QMOrdersStatesPSSHIPPED: TIntegerField;
     QMOrdersStatesPSPAID: TIntegerField;
     QMOrdersStatesPSPDF_DELIVERY: TIntegerField;
     QMOrdersStatesPSPDF_INVOICE: TIntegerField;
     QMOrdersStatesPSDELETED: TIntegerField;
     QMOrdersStatesPSNAME: TFIBStringField;
     QMOrdersStatesPSSINCRONIZAR_PEC: TIntegerField;
     QMOrdersStatesPSSINCRONIZAR_FAC: TIntegerField;
     QMOrdersStatesPSSINCRONIZAR_MOV: TIntegerField;
     QMOrdersPSCURRENT_STATE_DESCRIPCION: TFIBStringField;
     QMOrdersPSCURRENT_STATE_COLOR_HEX: TFIBStringField;
     xStockAvailable: TFIBTableSet;
     DSxStockAvailable: TDataSource;
     xStockAvailableID_CONFIGURACION: TIntegerField;
     xStockAvailableID_STOCK_AVAILABLE: TIntegerField;
     xStockAvailableID_PRODUCT: TIntegerField;
     xStockAvailableID_PRODUCT_ATTRIBUTE: TIntegerField;
     xStockAvailableID_SHOP: TIntegerField;
     xStockAvailableID_SHOP_GROUP: TIntegerField;
     xStockAvailableQUANTITY: TFloatField;
     xStockAvailableDEPENDS_ON_STOCK: TIntegerField;
     xStockAvailableOUT_OF_STOCK: TIntegerField;
     xStockAvailableLOCATION: TFIBStringField;
     xStockAvailableULT_SINCRONIZACION: TDateTimeField;
     xStockAvailableREFERENCE: TFIBStringField;
     xStockAvailablePRODUCT_NAME: TFIBStringField;
     xStockAvailableEAN13: TFIBStringField;
     xStockAvailableSTOCK: TFloatField;
     xStockAvailableARTICULO: TFIBStringField;
     xStockAvailableID_A: TIntegerField;
     QMConfPrestaShopDSN_MYSQL: TFIBStringField;
     QMConfPrestaShopUTILIZA_MODULO_MEGAPRODUCT: TIntegerField;
     QMProductosPSIS_PACK: TIntegerField;
     QMConfPrestaShopArticuloIS_PACK: TIntegerField;
     QMPacks: TFIBTableSet;
     DSQMPacks: TDataSource;
     QMPacksID_CONFIGURACION: TIntegerField;
     QMPacksID_PRODUCT_PACK: TIntegerField;
     QMPacksREFERENCE_PACK: TFIBStringField;
     QMPacksPRODUCT_NAME_PACK: TFIBStringField;
     QMPacksID_PRODUCT_ITEM: TIntegerField;
     QMPacksID_PRODUCT_ATTRIBUTE_ITEM: TIntegerField;
     QMPacksREFERENCE_ITEM: TFIBStringField;
     QMPacksPRODUCT_NAME_ITEM: TFIBStringField;
     QMPacksQUANTITY: TFloatField;
     xStockAvailableSTOCK_REAL: TFloatField;
     xStockAvailablePEDIDOS_D_CLI: TFloatField;
     xStockAvailablePRODUCT_ACTIVE: TIntegerField;
     QMOrdersStatesPSTRASPASAR_FAC: TIntegerField;
     QMOrdersStatesPSACTUALIZAR_ESTADO_PS: TIntegerField;
     xMegacart: TFIBTableSet;
     xMegacartID_CONFIGURACION: TIntegerField;
     xMegacartID_MEGACART: TIntegerField;
     xMegacartID_CART: TIntegerField;
     xMegacartID_PRODUCT: TIntegerField;
     xMegacartID_PRODUCT_ATTRIBUTE: TIntegerField;
     xMegacartQUANTITY: TFloatField;
     QMConfPrestaShopFAMILIA_PACK: TFIBStringField;
     QMConfPrestaShopUSUARIO_WARNINGS: TIntegerField;
     QMConfPrestaShopARTICULO_DESCUENTO: TFIBStringField;
     QMCategory: TFIBTableSet;
     DSQMCategory: TDataSource;
     QMCategoryID_CONFIGURACION: TIntegerField;
     QMCategoryID_CATEGORY: TIntegerField;
     QMCategoryID_PARENT: TIntegerField;
     QMCategoryCATEGORY_ACTIVE: TIntegerField;
     QMCategoryID_SHOP_DEFAULT: TIntegerField;
     QMCategoryIS_ROOT_CATEGORY: TIntegerField;
     QMCategoryCATEGORY_POSITION: TIntegerField;
     QMCategoryDATE_ADD: TDateTimeField;
     QMCategoryDATE_UPD: TDateTimeField;
     QMCategoryNAME: TFIBStringField;
     QMCategoryDESCRIPTION: TFIBStringField;
     QMCategoryID_FAMILIA: TIntegerField;
     QMCategoryFAMILIA: TFIBStringField;
     QMCategoryTITULO_FAMILIA: TFIBStringField;
     QMCategoryID_SUBFAMILIA: TIntegerField;
     QMCategorySUBFAMILIA: TFIBStringField;
     QMCategoryTITULO_SUBFAMILIA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMConfPrestaShopAfterOpen(DataSet: TDataSet);
     procedure QMConfPrestaShopBeforeClose(DataSet: TDataSet);
     procedure QMConfPrestaShopAfterInsert(DataSet: TDataSet);
     procedure QMConfPrestaShopBeforePost(DataSet: TDataSet);
     procedure QMConfPrestaShopSincBeforePost(DataSet: TDataSet);
     procedure QMConfPrestaShopSincNewRecord(DataSet: TDataSet);
     procedure QMConfPrestaShopNewRecord(DataSet: TDataSet);
     procedure QMConfPrestaShopClienteCLIENTEChange(Sender: TField);
     procedure QMConfPrestaShopClienteDirCLIENTEChange(Sender: TField);
     procedure QMConfPrestaShopClienteDirDIRECCIONChange(Sender: TField);
     procedure QMConfPrestaShopArticuloARTICULOChange(Sender: TField);
     procedure QMConfPrestaShopSincAfterPost(DataSet: TDataSet);
     procedure QMProductosPSARTICULOChange(Sender: TField);
     procedure QMOrdersPSCalcFields(DataSet: TDataSet);
     procedure QMConfPrestaShopClienteNewRecord(DataSet: TDataSet);
     procedure QMConfPrestaShopClienteDirNewRecord(DataSet: TDataSet);
     procedure QMConfPrestaShopArticuloNewRecord(DataSet: TDataSet);
     procedure QMConfPrestaShopTaxRuleGroupNewRecord(DataSet: TDataSet);
     procedure QMProductosPSNewRecord(DataSet: TDataSet);
     procedure QMPacksNewRecord(DataSet: TDataSet);
     procedure xStockAvailableCalcFields(DataSet: TDataSet);
     procedure QMCategoryFAMILIAChange(Sender: TField);
     procedure QMCategorySUBFAMILIAChange(Sender: TField);
  private
     { Private declarations }
     Pagina: string;
     //UltimoClienteDireccion: integer;
     //UltimoProveedorDireccion: integer;
     FModoIVACanal: integer;
     Log: TStrings;
     DescripcionAtribtos: TStrings;
     SincronizarArticuloSiNoExiste: boolean;
     param_PSHTIVA001: boolean;
     param_PSHTSTK001: integer;
     param_PSHTNAC001: integer;
     param_PSHTINT001: integer;
     SincronizarcionAutomatica: boolean;
     OrderStates: TStrings;
     // empresa: integer;
     // canal: integer;
     // serie: string;

     function SincronizaCarriers(Desde, Hasta: TDateTime): boolean;
     function SincronizaFabricantes(Desde, Hasta: TDateTime): boolean;
     function SincronizaCategorias(Desde, Hasta: TDateTime): boolean;
     function SincronizaFamilias(Desde, Hasta: TDateTime): boolean;
     function SincronizaArticulos(Desde, Hasta: TDateTime): boolean;
     function SincronizaClientes(IdConfiguracion: integer; Desde, Hasta: TDateTime): boolean;
     function SincronizaOrdenesPedidos(Desde, Hasta: TDateTime; IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; IdEstado: integer): boolean;

     function SincronizaProveedores(Desde, Hasta: TDateTime): integer;
     (*
     function SincronizaClientesDirecciones(Desde, Hasta: TDateTime; IdAddress: integer = 0): integer;
     *)
     function SincronizaProveedoresDirecciones(Desde, Hasta: TDateTime): integer;
     function SincronizaOrdenesMovimiento(Desde, Hasta: TDateTime): integer;
     function SincronizaOrdenesFacturas(Desde, Hasta: TDateTime): integer;
     function SincronizaCodProvArticulos(Desde, Hasta: TDateTime): integer;
     function SincronizaStockArticulos(DesdeRegistro: integer): integer;
     function SincronizaStockAvailable(Desde, Hasta: TDateTime; IdConfiguracion: integer): boolean;
     function SincronizaPrecioArticulos(Desde, Hasta: TDateTime): integer;
     function SincronizaEstadoOrdenPrestashop(IdConfiguracion: integer; Desde, Hasta: TDateTime): integer;

     // procedure SincronizaStock;
     function DameModoIva: integer;
     function DameFechaUltimaSincronizacion(Tipo: string): TDateTime;
     function DameRegistroUltimaSincronizacion(Tipo: string): integer;
     function DameIdArticulo(id_configuracion, id_product, id_product_attribute: integer; id_attribute: string; Actualizar: boolean = True): integer;
     function ProductIsPack(id_configuracion, id_product, id_product_attribute: integer): boolean;
     procedure GrabaFechaUltimaSincronizacion(Tipo: string; Fecha: TDateTime);
     procedure GrabaRegistroUltimaSincronizacion(Tipo: string; Registro: integer);
     function DameProveedor(Empresa, IdProveedor: integer): integer;
     function DameFabricante(Empresa, IdFabricante: integer): integer;
     function DameIdClientePrestaShop(IdConfiguracion, IdCustomer: integer): integer;
     function DameIdProveedorPrestaShop(IdConfiguracion, IdSupplier: integer): integer;
     function DameIdFabricantePrestaShop(IdConfiguracion, IdManufacturer: integer): integer;
     function DameDireccionPrestaShop(IdConfiguracion, IdAddress, Tercero: integer): integer;
     function DameIdFamiliaPrestaShop(IdConfiguracion, IdCategory: integer): integer;
     function DameIdSubFamiliaPrestaShop(IdConfiguracion, IdCategory: integer): integer;
     function DameCategoriaPrestashop(IdConfiguracion, IdFamilia: integer): integer;
     function DameSubCategoriaPrestashop(IdConfiguracion, IdSubFamilia: integer): integer;
     function MySQLDateTimeToDateTime(s: string): TDateTime;
     // procedure CreaStockInicial;

     function DameEstado(IdConfiguracion, IdState: integer; Pais: string; CodigoPostal: string = ''): string;
     function DameLocalidad(IdConfiguracion, IdCountry, IdState: integer; City, PostCode: string): string;
     function DamePais(IdConfiguracion, IdCountry: integer): string;

     function DamePorcentajeIVA(id_tax_rules_group, id_country: integer): double;
     function DameIdTax(id_tax_rules_group, id_country: integer): integer;
     function DameTaxRate(id_tax: integer): double;
     function DameStock(id_stock_available: integer): double;

     function DameNombreAtributo(id_attribute: integer): string;
     procedure DameDatosCombinacion(id_combination: integer; var ean13, upc, reference, supplier_reference: string; var price, weight, quantity: double; var id_attribute, sufijo_nombre: string);

     function SincronizaUnaDireccion(IdConfiguracion, id: integer; TerceroAsociado: integer = 0): integer;
     function SincronizaUnCarrier(id: integer): integer;
     function SincronizaUnFabricante(id: integer): integer;
     function SincronizaUnaFamilia(Desde, Hasta: TDateTime; id_category: integer; FamiliaPadre: string = ''): boolean;
     function SincronizaUnaCategoria(id: integer): integer;
     function SincronizaStockUnArticulo(Articulo: string; id_stock_available: integer; Titulo: string): integer;
     function SincronizaPrecioUnArticulo(Precio: double; id_product, id_product_attribute: integer; Articulo, Titulo: string): integer;
     function SincronizaEstadoUnaOrdenPrestashop(IdOrder, NuevoEstado: integer): integer;
     function SincronizaListaArticulos(Desde, Hasta: TDateTime; IdConfiguracion: integer): boolean;
     function SincronizaListaPedidos(Desde, Hasta: TDateTime; IdConfiguracion: integer): boolean;
     function SincronizaListaDetallePedidos(IdConfiguracion, DesdeRegistro: integer): integer;
     function SincronizaListaEstadoPedidos(IdConfiguracion, DesdeRegistro: integer): integer;
     function RequiereLoteSimple(id_a: integer): boolean;
     function SincronizaMegaProduct(IdConfiguracion, DesdeRegistro: integer): integer;
     function DameUsuarioWarning(IdConfiguracion: integer): integer;
  public
     { Public declarations }
     procedure FiltraTienda(Id: integer);
     procedure SincronizaBase;
     procedure SincronizaTodas(aSincronizarcionAutomatica: boolean = False);
     procedure SaveLog(FicheroLog: string);
     procedure FiltrarCliente(Valor: string);
     procedure FiltrarDireccion(Valor: string);
     procedure FiltrarArticulo(Valor: string);
     procedure FiltrarProductosPS(Valor: string; SoloActivos, SoloNoSincronizados: boolean);
     procedure FiltrarCategoriasPS(Valor: string; SoloActivos, SoloNoSincronizados: boolean);
     procedure FiltrarOrdersPS(Valor: string; SoloNoSincronizados: boolean);
     procedure FiltrarStockAvailable(Valor: string; SoloActivos, SoloSincronizados: boolean);
     function SincronizaUnaOrdenPedidos(IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; id_order: integer): integer;
     procedure SincronizaDetallePedido(IdConfiguracion, id_order_detail: integer);
     function SincronizaUnCliente(IdConfiguracion, id_customer: integer): integer;
     function SincronizaUnArticulo(id_product: integer): integer;

     procedure CrearUnArticulo(IdArticulo: integer; SincronizarSiExiste: boolean = False; SaltarConfirmacionSiExiste: boolean = False);
     procedure CrearUnaFamilia(IdFamilia: integer; SincronizarSiExiste: boolean = False);
     procedure CrearUnaSubFamilia(IdFamilia, IdSubFamilia: integer; SincronizarSiExiste: boolean = False);
     function SincronizaItemListaArticulo(id_product, IdConfiguracion: integer): boolean;

     // Webservice
     function InicializaWebService: boolean;
     procedure RellenaIdiomasWS(Items, Values: TStrings);
     procedure RellenaEstadosWS;
     function HayDetalle: boolean;
     procedure AbreTaxRuleGroups;
     procedure CierraTaxRuleGroups;
     procedure CrearArticulosFiltrados;
     procedure RefrescarDatosSincronizacion;
  end;

var
  DMSincronizacionTienda : TDMSincronizacionTienda;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFSendCorreo, UDMPrestashop, UFormGest, Dialogs, Math,
  UFMSincronizacionTiendArticuloNuevo, UDMSincronizacion, UFMArticulos, UParam;

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

procedure TDMSincronizacionTienda.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  SincronizarcionAutomatica := False;
  DescripcionAtribtos := TStringList.Create;
  OrderStates := TStringList.Create;
  Log := TStringList.Create;

  AbreData(TDMPrestashop, DMPrestashop);

  AsignaDisplayFormat(QMConfPrestaShop, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMConfPrestaShopSinc, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMConfPrestaShopCliente, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMConfPrestaShopClienteDir, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMConfPrestaShopArticulo, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMConfPrestaShopTaxRuleGroup, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMProductosPS, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMOrdersPS, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xStockAvailable, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCategory, MascaraN, MascaraI, ShortDateFormat);

  QMConfPrestaShopArticuloPRECIO.DisplayFormat := ',0.00####';

  // En Prestashop el stock es entero
  QMConfPrestaShopArticuloSTOCK.DisplayFormat := MascaraI;

  QMConfPrestaShopSincULT_SINCRONIZACION.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMConfPrestaShopClienteULT_SINCRONIZACION.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMConfPrestaShopClienteDirULT_SINCRONIZACION.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMConfPrestaShopArticuloULT_SINCRONIZACION.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMConfPrestaShopTaxRuleGroupP_IVA.DisplayFormat := MascaraP;
  QMProductosPSDATE_UPD.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMOrdersPSCARRIER_TAX_RATE.DisplayFormat := MascaraP;
  QMOrdersPSDATE_ADD.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMOrdersPSDATE_UPD.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCategoryDATE_ADD.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCategoryDATE_UPD.DisplayFormat := ShortDateFormat + ' hh:nn';

  DMMain.FiltraTabla(QMConfPrestaShop, '101000');

  FModoIVACanal := -1;

  // Si sincronizo articulos tambien sincronizo articulo al traer ordenenes
  SincronizarArticuloSiNoExiste := True;

  // Se asigna el Tipo Iva del canal a los articulos importados
  param_PSHTIVA001 := (LeeParametro('PSHTIVA001', '') = 'S');
  // Tipo de stock para sincronizar a Prestashop (Stock/Real/Virtual)
  param_PSHTSTK001 := StrToIntDef(LeeParametro('PSHTSTK001', ''), 1);
  // Forzar Transportista para envios nacionales
  param_PSHTNAC001 := StrToIntDef(LeeParametro('PSHTNAC001', ''), 0);
  // Forzar Transportista para envios internacionales
  param_PSHTINT001 := StrToIntDef(LeeParametro('PSHTINT001', ''), 0);

  {$IFDEF Debug}
  // Para posicionarme automaticamente en EPI
  with QMConfPrestaShop do
  begin
  while ((not EOF) and (QMConfPrestaShopID.AsInteger <> 24)) do
     Next;
  end;
  {$ENDIF}
end;

procedure TDMSincronizacionTienda.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMPrestashop);
  DescripcionAtribtos.Free;
  OrderStates.Free;
  Log.Free;
end;

function TDMSincronizacionTienda.DameFechaUltimaSincronizacion(Tipo: string): TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACTIVO, ULT_SINCRONIZACION FROM SYS_CONF_PRESTASHOP_SINC WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND TIPO = :TIPO';
        Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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

function TDMSincronizacionTienda.DameRegistroUltimaSincronizacion(Tipo: string): integer;
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
        Params.ByName['ID_CONFIGURACION'].AsFloat := QMConfPrestaShopID.AsInteger;
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

procedure TDMSincronizacionTienda.GrabaFechaUltimaSincronizacion(Tipo: string; Fecha: TDateTime);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONF_PRESTASHOP_SINC SET ULT_SINCRONIZACION = :ULT_SINCRONIZACION WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND TIPO = :TIPO';
        Params.ByName['ID_CONFIGURACION'].AsFloat := QMConfPrestaShopID.AsInteger;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ULT_SINCRONIZACION'].AsDateTime := Fecha;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMSincronizacionTienda.GrabaRegistroUltimaSincronizacion(Tipo: string; Registro: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_CONF_PRESTASHOP_SINC SET ULT_REGISTRO = :ULT_REGISTRO, ULT_SINCRONIZACION = :ULT_SINCRONIZACION WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND TIPO = :TIPO';
        Params.ByName['ID_CONFIGURACION'].AsFloat := QMConfPrestaShopID.AsInteger;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ULT_REGISTRO'].AsInteger := Registro;
        Params.ByName['ULT_SINCRONIZACION'].AsDateTime := Now;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMSincronizacionTienda.SincronizaBase;
var
  FechaHoraSincronizacion, FechaHoraParcialSincronizacion : TDateTime;
  RegistroUltimaSincronizacion : integer;
  UltimaSincronizacion : TDateTime;
  // HayError : boolean;
begin
  /// Sincroniza los datos de la tienda Prestashop con la base de datos de la aplicación.
  /// Solo actua si está marcada como activa.
  FechaHoraSincronizacion := 0;

  if (QMConfPrestaShopACTIVO.AsInteger = 1) then
  begin
     try
        Log.Clear;
        Pagina := QMConfPrestaShopWEB.AsString;
        FSendCorreo := TFSendCorreo.Create(Self);
        try
           if (QMConfPrestaShopDSN_MYSQL.AsString > '') then
           begin
              DMMain.Log(format('Conectando MySQL. DSN=%s', [QMConfPrestaShopDSN_MYSQL.AsString]));
              DMPrestashop.SetDSN(QMConfPrestaShopDSN_MYSQL.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

              // Parametro (SincronizarcionAutomatica=Quiet) utilizado para evitar mensaje de error si falla la llamada a MySQL
              FechaHoraSincronizacion := DMPrestashop.DameFechaServidorMySQL(SincronizarcionAutomatica);

              if not DMPrestashop.MYSQLConnection.Connected then
                 Log.Add(format('No se pudo conectar a MySQL para sincronizar Packs. DSN=%s', [QMConfPrestaShopDSN_MYSQL.AsString]))
              else
              begin
                 if not DMPrestashop.FiltraPacks(SincronizarcionAutomatica) then
                    Log.Add(format('No se pudo obtener informacion de Packs. DSN=%s', [QMConfPrestaShopDSN_MYSQL.AsString]))
                 else
                 begin
                    // Borro los packs para volver a importarlos
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' DELETE FROM SYS_CONF_PRESTASHOP_PACK ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    DMMain.Log('Recorro Packs');
                    DMPrestashop.QMySql.First;
                    try
                       while not DMPrestashop.QMySql.EOF do
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_PACK ( ');
                                SQL.Add(' ID_CONFIGURACION, ID_PRODUCT_PACK, ID_PRODUCT_ITEM, ID_PRODUCT_ATTRIBUTE_ITEM, QUANTITY) ');
                                SQL.Add(' VALUES ( ');
                                SQL.Add(' :ID_CONFIGURACION, :ID_PRODUCT_PACK, :ID_PRODUCT_ITEM, :ID_PRODUCT_ATTRIBUTE_ITEM, :QUANTITY) ');
                                SQL.Add(' MATCHING (ID_CONFIGURACION, ID_PRODUCT_PACK, ID_PRODUCT_ITEM, ID_PRODUCT_ATTRIBUTE_ITEM) ');
                                Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                                Params.ByName['ID_PRODUCT_PACK'].AsInteger := DMPrestashop.QMySql.FieldByName('id_product_pack').AsInteger;
                                Params.ByName['ID_PRODUCT_ITEM'].AsInteger := DMPrestashop.QMySql.FieldByName('id_product_item').AsInteger;
                                Params.ByName['ID_PRODUCT_ATTRIBUTE_ITEM'].AsInteger := DMPrestashop.QMySql.FieldByName('id_product_attribute_item').AsInteger;
                                Params.ByName['QUANTITY'].AsFloat := DMPrestashop.QMySql.FieldByName('quantity').AsFloat;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          DMPrestashop.QMySql.Next;
                       end;
                    except
                       on e: Exception do
                       begin
                          Log.Add(format('Error sincronizando Packs. IdPack: %d - IdProduct: %d - IdAttr: %d', [DMPrestashop.QMySql.FieldByName('id_product_pack').AsInteger, DMPrestashop.QMySql.FieldByName('id_product_item').AsInteger, DMPrestashop.QMySql.FieldByName('id_product_attribute_item').AsInteger]) + #13#10 + e.Message);
                       end;
                    end;
                 end;
              end;
           end;

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

                 with QMConfPrestaShopSinc do
                 begin
                    First;
                    while not EOF do
                    begin
                       if (QMConfPrestaShopSincACTIVO.AsInteger = 1) then
                       begin
                          if (QMConfPrestaShopSincTIPO.AsString = 'MPR') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Megaproduct') + ' ' + Pagina);
                             RegistroUltimaSincronizacion := DameRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (RegistroUltimaSincronizacion >= -1) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Megaproduct') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + IntToStr(RegistroUltimaSincronizacion));
                                RegistroUltimaSincronizacion := SincronizaMegaProduct(QMConfPrestaShopID.AsInteger, RegistroUltimaSincronizacion);
                                if (RegistroUltimaSincronizacion > 0) then
                                   GrabaRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, RegistroUltimaSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'CAR') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Carriers') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Carriers') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaCarriers(UltimaSincronizacion, FechaHoraSincronizacion)) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'FAB') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Fabricantes') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Fabricantes') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaFabricantes(UltimaSincronizacion, FechaHoraSincronizacion)) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'PRO') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Proveedores') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Proveedores') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaProveedores(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'DIP') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Direcciones (Proveedores)') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Direcciones (Proveedores)') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaProveedoresDirecciones(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'CLI') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Clientes') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Clientes') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if SincronizaClientes(QMConfPrestaShopID.AsInteger, UltimaSincronizacion, FechaHoraSincronizacion) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'CAT') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Categorias') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Categorias') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if SincronizaCategorias(UltimaSincronizacion, FechaHoraSincronizacion) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'FAM') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Familias') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Familias') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if SincronizaFamilias(UltimaSincronizacion, FechaHoraSincronizacion) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'LAR') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Lista de Articulos') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                // Para evitar sincornizaciones largas sincronizo de a un año.
                                FechaHoraParcialSincronizacion := FechaHoraSincronizacion;
                                if DaysBetween(FechaHoraSincronizacion, UltimaSincronizacion) > 365 then
                                   FechaHoraParcialSincronizacion := UltimaSincronizacion + 365;

                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Lista de Articulos') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraParcialSincronizacion)));
                                if SincronizaListaArticulos(UltimaSincronizacion, FechaHoraParcialSincronizacion, QMConfPrestaShopID.AsInteger) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraParcialSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'STK') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Stock de Articulos Prestashop') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                // Para evitar sincornizaciones largas sincronizo de a un año.
                                FechaHoraParcialSincronizacion := FechaHoraSincronizacion;
                                if DaysBetween(FechaHoraSincronizacion, UltimaSincronizacion) > 365 then
                                   FechaHoraParcialSincronizacion := UltimaSincronizacion + 365;

                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Stock de Articulos Prestashop') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraParcialSincronizacion)));
                                if SincronizaStockAvailable(UltimaSincronizacion, FechaHoraParcialSincronizacion, QMConfPrestaShopID.AsInteger) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraParcialSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'ART') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Articulos') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Articulos') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if SincronizaArticulos(UltimaSincronizacion, FechaHoraSincronizacion) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'LOR') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Lista de Pedidos') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                // Para evitar sincornizaciones largas sincronizo de a un año.
                                FechaHoraParcialSincronizacion := FechaHoraSincronizacion;
                                if DaysBetween(FechaHoraSincronizacion, UltimaSincronizacion) > 365 then
                                   FechaHoraParcialSincronizacion := UltimaSincronizacion + 365;

                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Lista de Pedidos') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraParcialSincronizacion)));
                                if SincronizaListaPedidos(UltimaSincronizacion, FechaHoraParcialSincronizacion, QMConfPrestaShopID.AsInteger) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraParcialSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'LOD') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Lista de Detalles de Pedidos') + ' ' + Pagina);
                             RegistroUltimaSincronizacion := DameRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (RegistroUltimaSincronizacion >= -1) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Lista de Detalles de Pedidos') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + IntToStr(RegistroUltimaSincronizacion));
                                RegistroUltimaSincronizacion := SincronizaListaDetallePedidos(QMConfPrestaShopID.AsInteger, RegistroUltimaSincronizacion);
                                if (RegistroUltimaSincronizacion > 0) then
                                   GrabaRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, RegistroUltimaSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'STA') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Lista Cambios de Estado de Pedidos') + ' ' + Pagina);
                             RegistroUltimaSincronizacion := DameRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (RegistroUltimaSincronizacion >= -1) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Lista Cambios de Estado de Pedidos') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + IntToStr(RegistroUltimaSincronizacion));
                                RegistroUltimaSincronizacion := SincronizaListaEstadoPedidos(QMConfPrestaShopID.AsInteger, RegistroUltimaSincronizacion);
                                if (RegistroUltimaSincronizacion > 0) then
                                   GrabaRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, RegistroUltimaSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'CPA') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Codigo de Proveedor de Articulos') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Codigo de Proveedor de Articulos') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaCodProvArticulos(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'STO') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Stock') + ' ' + Pagina);
                             RegistroUltimaSincronizacion := DameRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (RegistroUltimaSincronizacion >= -1) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Stock') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + IntToStr(RegistroUltimaSincronizacion));
                                RegistroUltimaSincronizacion := SincronizaStockArticulos(RegistroUltimaSincronizacion);
                                if (RegistroUltimaSincronizacion > 0) then
                                   GrabaRegistroUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, RegistroUltimaSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'PRE') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Precios') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Precios') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaPrecioArticulos(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                          if (QMConfPrestaShopSincTIPO.AsString = 'UST') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Estado de Orden Prestashop') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add('------------------------------------------------------------');
                                Log.Add(_('Sincronizando Estado de Orden Prestashop') + ' ' + Pagina);
                                // Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaEstadoOrdenPrestashop(QMConfPrestaShopID.AsInteger, UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;

                       {
                          if (QMConfPrestaShopSincTIPO.AsString = 'MOV') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Ordenes con Mov. Manuales de Stock') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add(_('Sincronizando Ordenes con Mov. Manuales de Stock') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaOrdenesMovimiento(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;
                       }

                       {
                          if (QMConfPrestaShopSincTIPO.AsString = 'PEC') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Ordenes con Pedidos') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add(_('Sincronizando Ordenes con Pedidos') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if SincronizaOrdenesPedidos(UltimaSincronizacion, FechaHoraSincronizacion, QMConfPrestaShopID.AsInteger, QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, QMConfPrestaShopSERIE.AsString, QMConfPrestaShopALMACEN.AsString, QMConfPrestaShopWS_ORDER_STATE.AsInteger) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;
                       }

                       {
                          if (QMConfPrestaShopSincTIPO.AsString = 'FAC') then
                          begin
                             FSendCorreo.Titulo(_('Sincronizando Ordenes con Facturas') + ' ' + Pagina);
                             UltimaSincronizacion := DameFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString);
                             if (UltimaSincronizacion >= EncodeDate(2000, 01, 01)) then
                             begin
                                Log.Add('');
                                Log.Add(_('Sincronizando Ordenes con Facturas') + ' ' + Pagina);
                                Log.Add(_('Desde') + ': ' + DateTimeToStr(UltimaSincronizacion) + ' ' + _('Hasta' + ': ' + DateTimeToStr(FechaHoraSincronizacion)));
                                if (SincronizaOrdenesFacturas(UltimaSincronizacion, FechaHoraSincronizacion) = 0) then
                                   GrabaFechaUltimaSincronizacion(QMConfPrestaShopSincTIPO.AsString, FechaHoraSincronizacion);
                             end;
                          end;
                       }
                       end;

                       Next;
                    end;
                 end;

                 // CreaStockInicial;
              end;
           end
           else
           begin
              Log.Add('');
              Log.Add(_('Error de sincronizacion'));
              Log.Add(Format(_('No se pudo obtener la fecha del servidor %s'), [DateTimeToStr(FechaHoraSincronizacion)]));
           end;
        finally
           FreeAndNil(FSendCorreo);
        end;
     except
        on E: Exception do
        begin
           Log.Add(_('Error de sincronizacion') + #13#10 + E.Message);
        end;
     end;

     SaveLog(DameTempPath + 'Sincronizacion_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.Log');

     if SincronizarcionAutomatica then
     begin
        try
           DMMain.EnviaMensajeUsuario(REntorno.Usuario, Log.Text);
        except
        end;
     end
     else
     begin
        Refrescar(QMConfPrestaShopSinc, 'TIPO', QMConfPrestaShopSincTIPO.AsString);
        RefrescarDatosSincronizacion;
     end;
  end;
end;

procedure TDMSincronizacionTienda.SaveLog(FicheroLog: string);
begin
  with Log do
  begin
     if (Count > 0) then
     begin
        Insert(0, Format(_('Tienda Prestashop : %s'), [QMConfPrestaShopTITULO.AsString]));
        Insert(1, '--');
        Insert(1, Format(_('URL               : %s'), [QMConfPrestaShopWS_URL.AsString]));
        Insert(1, Format(_('Version           : %s'), [QMConfPrestaShopVERSION_PRESTASHOP.AsString]));
        Insert(1, Format(_('id_lang           : %d'), [QMConfPrestaShopWS_LANGUAGE.AsInteger]));
        Insert(1, Format(_('id_country        : %d'), [DMPrestashop.id_country]));
        SaveToFile(FicheroLog);
        if not SincronizarcionAutomatica then
           DMMain.AbrirArchivo(FicheroLog);
     end;
  end;
end;

function TDMSincronizacionTienda.DameIdArticulo(id_configuracion, id_product, id_product_attribute: integer; id_attribute: string; Actualizar: boolean = True): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_A FROM SYS_CONF_PRESTASHOP_ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_PRODUCT = :ID_PRODUCT AND ');
        SQL.Add(' ID_PRODUCT_ATTRIBUTE = :ID_PRODUCT_ATTRIBUTE ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := id_configuracion;
        Params.ByName['ID_PRODUCT'].AsInteger := id_product;
        Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
        ExecQuery;
        Result := FieldByName['ID_A'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMSincronizacionTienda.ProductIsPack(id_configuracion, id_product, id_product_attribute: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT IS_PACK FROM SYS_CONF_PRESTASHOP_ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_PRODUCT = :ID_PRODUCT AND ');
        SQL.Add(' ID_PRODUCT_ATTRIBUTE = :ID_PRODUCT_ATTRIBUTE ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := id_configuracion;
        Params.ByName['ID_PRODUCT'].AsInteger := id_product;
        Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
        ExecQuery;
        Result := (FieldByName['IS_PACK'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMSincronizacionTienda.SincronizaArticulos(Desde, Hasta: TDateTime): boolean;
var
  i : integer;
  id : integer;
  date_upd : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  RegistroInicial, Cantidad, Registros : integer;
begin
  Result := False;
  DescripcionAtribtos.Clear;

  // Recorremos de a 1000 registros para evitar sobrecargar al servidor.
  RegistroInicial := 0;
  Cantidad := 1000;
  Registros := 1;

  while (Registros > 0) do
  begin
     Registros := 0;
     Sleep(5000);

     Log.Add(format(_('Obteniendo Articulos. (Registro Inicial: %d x %d)'), [RegistroInicial, Cantidad]));
     FSendCorreo.Texto(format(_('Obteniendo Articulos. (Registro Inicial: %d x %d)'), [RegistroInicial, Cantidad]));

     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Filtro por fecha de ultima modificacion apareció aproximadamente en esta versión
        if DMPrestashop.SuperaVersion('1.6.0.8') then
           CodigoRespuesta := DMPrestashop.WS_Get('products', 0, '&display=[id,date_upd]&filter[date_upd]=[' + FormatDateTime('yyyy-mm-dd', Desde) + ',' + FormatDateTime('yyyy-mm-dd', Hasta + 1) + ']&date=1&limit=' + IntToStr(RegistroInicial) + ',' + IntToStr(Cantidad) + '&sort=[id_ASC]', Respuesta)
        else
           CodigoRespuesta := DMPrestashop.WS_Get('products', 0, '&display=[id,date_upd]&limit=' + IntToStr(RegistroInicial) + ',' + IntToStr(Cantidad) + '&sort=[id_ASC]', Respuesta);
        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath+'Respuesta-Products.xml');
        {$ENDIF}

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Recorro los productos
              NodoPadre := DameNodo(Documento.DocumentElement, ['products']);
              if Assigned(NodoPadre) then
              begin
                 Result := True;
                 for i := 0 to NodoPadre.ChildNodes.Count - 1 do
                 begin
                    Inc(Registros);

                    Nodo := NodoPadre.ChildNodes.Get(i);

                    id := StrToInt(DameDato(Nodo, ['id']));
                    date_upd := DameDato(Nodo, ['date_upd']);

                    FSendCorreo.Texto(format(_('Obteniendo Articulos. (Registro Inicial: %d x %d)') + #13#10 + 'Elemento %d - Id Producto: %d - date_upd: %s', [RegistroInicial, Cantidad, i, id, date_upd]));
                    // Si la fecha de modificacion esta dentro de los parametros
                    if ((date_upd > FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
                       (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
                    begin
                       if (SincronizaUnArticulo(id) = 0) then
                          Result := False;
                    end;
                 end;
              end;
           end;
        end
        else
           ShowMessage('(products)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;

     RegistroInicial := RegistroInicial + Cantidad;
  end;
end;

function TDMSincronizacionTienda.DameNombreAtributo(id_attribute: integer): string;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  /// Obtiene los datos de la combinacion para poder crear articulos.

  // Trato de buscarlo de una sincronizacion previa
  Result := DescripcionAtribtos.Values[IntToStr(id_attribute)];

  if (Result = '') then
  begin
     Log.Add(Format(_('Obteniendo datos Atributo %d'), [id_attribute]));
     if Assigned(FSendCorreo) then
        FSendCorreo.Texto(Format(_('Obteniendo datos Atributo %d'), [id_attribute]));

     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Obtengo id y nombre de los fabricantes activos
        CodigoRespuesta := DMPrestashop.WS_Get('product_option_values', id_attribute, '', Respuesta);
        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath+'Respuesta-product_option_values.xml');
        {$ENDIF}

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Recorro los fabricantes
              NodoPadre := DameNodo(Documento.DocumentElement, ['product_option_value']);
              if Assigned(NodoPadre) then
              begin
                 Nodo := DameNodo(NodoPadre, ['name']);
                 Result := DameDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger);

                 DescripcionAtribtos.Values[IntToStr(id_attribute)] := Result;
              end;
           end;
        end
        else
           ShowMessage('(product_option_values)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;
  end;
end;

procedure TDMSincronizacionTienda.DameDatosCombinacion(id_combination: integer; var ean13, upc, reference, supplier_reference: string; var price, weight, quantity: double; var id_attribute, sufijo_nombre: string);
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;

  Atributos : TStrings;
begin
  /// Obtiene los datos de la combinacion para poder crear articulos.

  Log.Add(Format('   ' + _('Obteniendo datos combinacion %d'), [id_combination]));
  if Assigned(FSendCorreo) then
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
     CodigoRespuesta := DMPrestashop.WS_Get('combinations', id_combination, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-combinations.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
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
        ShowMessage('(combinations)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Atributos.Free;
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaUnArticulo(id_product: integer): integer;
var
  i : integer;
  id : integer;
  reference : string;
  ean13 : string;
  upc : string;
  isbn : string;
  product_name : string;
  product_type : string;
  DescripcionCorta : string;
  DescripcionLarga : string;
  id_supplier : integer;
  id_manufacturer : integer;
  id_stock_available : integer;
  quantity : double;
  price : double;
  Stock : double;
  weight : double;
  id_tax_rules_group : integer;
  PrecioVentaIVAIncluido : double;
  rate : double;
  date_upd : string;
  ArticuloConMismoCodigoBarra : string;
  // Primera Familia - Familia por defecto - La familia del articulo
  id_category_default : integer;

  { TODO : Tratar estos campos }
  supplier_reference : string;
  activo : integer;

  Combinaciones, StockAvailable, Categorias : TStrings;
  id_product_attribute : integer;
  id_attribute : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
  s : string;
  A : TArticulo;
  id_a, IdFamilia, IdSubFamilia : integer;
  Tarifa : string;
  Precio : double;
  Fabricante : integer;
  Familia, SubFamilia : string;
  id_combination : integer;
  sufijo_nombre : string;
  ArticuloNuevo : boolean;
begin
  /// Sincroniza el id_product con un articulo.
  /// Si se realiza con exito devuelve el numero de id_articulo asociado

  Log.Add(Format(_('Sincronizando producto %d'), [id_product]));
  Result := 0;
  id_a := 0;

  Tarifa := 'NOR';

  Combinaciones := TStringList.Create;
  StockAvailable := TStringList.Create;
  Categorias := TStringList.Create;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMPrestashop.WS_Get('products', id_product, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Product.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Datos del producto
           NodoPadre := DameNodo(Documento.DocumentElement, ['product']);
           if Assigned(NodoPadre) then
           begin
              id := StrToInt(DameDato(NodoPadre, ['id']));
              id_manufacturer := StrToInt(DameDato(NodoPadre, ['id_manufacturer']));
              id_supplier := StrToInt(DameDato(NodoPadre, ['id_supplier']));
              id_category_default := StrToInt(DameDato(NodoPadre, ['id_category_default']));
              product_type := DameDato(NodoPadre, ['type']);
              reference := DameDato(NodoPadre, ['reference']);
              supplier_reference := DameDato(NodoPadre, ['supplier_reference']);
              ean13 := DameDato(NodoPadre, ['ean13']);
              upc := DameDato(NodoPadre, ['upc']);
              isbn := DameDato(NodoPadre, ['isbn']);

              Nodo := DameNodo(NodoPadre, ['name']);
              product_name := DameDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger);

              Nodo := DameNodo(NodoPadre, ['description_short']);
              DescripcionCorta := DameDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger);

              Nodo := DameNodo(NodoPadre, ['description']);
              DescripcionLarga := DameDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger);

              weight := StrToFloatDec(DameDato(NodoPadre, ['weight']), '.');
              price := StrToFloatDec(DameDato(NodoPadre, ['price']), '.');
              // Este dato esta repartido en id_stock_available
              // quantity := StrToFloatDec(DameDato(NodoPadre, ['quantity']), '.');
              id_tax_rules_group := StrToInt(DameDato(NodoPadre, ['id_tax_rules_group']));

              { TODO : Ver si esto hay que asignarlo al campo ART_ARTICULOS.BAJA }
              activo := StrToInt(DameDato(NodoPadre, ['active']));
              date_upd := DameDato(NodoPadre, ['date_upd']);

              // Obtengo categorias
              Nodo := DameNodo(NodoPadre, ['associations', 'categories', 'category']);
              while Assigned(Nodo) do
              begin
                 if (Trim(DameDato(Nodo, ['id'])) > '') then
                 begin
                    // DMMain.Log(Format('associations->categories->category->id %s.', [DameDato(Nodo, ['id'])]));
                    Categorias.Add(DameDato(Nodo, ['id']));
                 end
                 else
                 if (Trim(DameNodoValorAtributo(Nodo, 'id')) > '') then
                 begin
                    // DMMain.Log(Format('associations->categories->category->Attr(id) %s.', [DameNodoValorAtributo(Nodo, 'id')]));
                    Categorias.Add(DameNodoValorAtributo(Nodo, 'id'));
                 end;

                 Nodo := Nodo.NextSibling;
              end;

              // Dependiendo de la versión de Prestashop las combinacciones estan dentro de combination*S* o combination.
              // Anterior a version 1.6.1.x
              Nodo := DameNodo(NodoPadre, ['associations', 'combinations', 'combinations']);
              while Assigned(Nodo) do
              begin
                 // DMMain.Log(Format('associations->combinations->combinations->id %s.', [DameDato(Nodo, ['id'])]));
                 Combinaciones.Add(DameDato(Nodo, ['id']));
                 Nodo := Nodo.NextSibling;
              end;

              // Posterior a version 1.6.1.x
              Nodo := DameNodo(NodoPadre, ['associations', 'combinations', 'combination']);
              while Assigned(Nodo) do
              begin
                 // DMMain.Log(Format('associations->combinations->combination->id %s.', [DameDato(Nodo, ['id'])]));
                 Combinaciones.Add(DameDato(Nodo, ['id']));
                 Nodo := Nodo.NextSibling;
              end;

              // Ordeno numericamente
              TStringList(Combinaciones).CustomSort(@CompareNumbers);

              // Si no tiene combinaciones, agrego la combinacion 0 para que el bucle se ejecute por lo menos una vez.
              if Combinaciones.Count = 0 then
                 Combinaciones.Add('0');

              Nodo := DameNodo(NodoPadre, ['associations', 'stock_availables', 'stock_available']);
              while Assigned(Nodo) do
              begin
                 // DMMain.Log(Format('associations->stock_availables->stock_available->id_product_attribute %s = id %s.', [DameDato(Nodo, ['id_product_attribute']), DameDato(Nodo, ['id'])]));
                 StockAvailable.Values[DameDato(Nodo, ['id_product_attribute'])] := DameDato(Nodo, ['id']);
                 Nodo := Nodo.NextSibling;
              end;

              // Datos comunes para todas las combinaciones
              rate := DamePorcentajeIVA(id_tax_rules_group, DMPrestashop.id_country);
              // DMMain.Log(Format('DameFabricante(..., %s)', [Categorias[0]]));
              Fabricante := DameFabricante(QMConfPrestaShopEMPRESA.AsInteger, DameIdFabricantePrestaShop(QMConfPrestaShopID.AsInteger, id_manufacturer));
              // DMMain.Log(Format('DameFamilia(..., %s)', [Categorias[0]]));
              Familia := DameFamilia(DameIdFamiliaPrestaShop(QMConfPrestaShopID.AsInteger, id_category_default));
              // DMMain.Log(Format('DameIdFamilia(..., %s)', [Categorias[0]]));
              IdFamilia := DameIdFamilia(Familia, QMConfPrestaShopEMPRESA.AsInteger);

              // Busco la subfamilia dentro de las categorias
              IdSubFamilia := 0;
              while ((IdSubFamilia = 0) and (Categorias.Count > 0)) do
              begin
                 // DMMain.Log(Format('IdSubFamilia: DameIdSubFamiliaPrestaShop(..., %s)', [Categorias[0]]));
                 IdSubFamilia := DameIdSubFamiliaPrestaShop(QMConfPrestaShopID.AsInteger, StrToInt(Categorias[0]));
                 Categorias.Delete(0);
              end;
              SubFamilia := DameSubFamilia(IdSubFamilia);

              DMMain.Log(Format('Combinaciones %d (%s)', [Combinaciones.Count, Combinaciones.CommaText]));

              Log[Log.Count - 1] := Format(_('Sincronizando producto %d - %s - %s'), [id_product, reference, product_name]);

              while Combinaciones.Count > 0 do
              begin
                 id_combination := StrToInt(Combinaciones[0]);
                 DMMain.Log(Format('Sincronizando Combinacion %d', [id_combination]));

                 id_product_attribute := id_combination;
                 // Lista de atributos
                 id_attribute := '';

                 id_stock_available := StrToIntDef(StockAvailable.Values[IntToStr(id_combination)], 0);
                 Stock := DameStock(id_stock_available);

                 if (id_combination <> 0) then
                    DameDatosCombinacion(id_combination, ean13, upc, reference, supplier_reference, price, weight, quantity, id_attribute, sufijo_nombre);

                 Log[Log.Count - 1] := Format('Sincronizando Combinacion %d (Atr: %d - Ref:%s - IdAtr:%s - [%s] + [%s] - IdStockAvail : %d - Stock: %.2f)', [id_combination, id_product_attribute, reference, id_attribute, product_name, sufijo_nombre, id_stock_available, Stock]);
                 ArticuloConMismoCodigoBarra := '';

                 if Assigned(FSendCorreo) then
                    FSendCorreo.Texto(Format(_('Articulo: %d(%s) - %s %s' + #13#10 + 'Modificado: %s'), [id_product, id_attribute, product_name, sufijo_nombre, date_upd]));

                 InicializaArticulo(A);

                 A.Fabricante := Fabricante;
                 PrecioVentaIvaIncluido := price + (price * rate / 100);
                 A.PorcentajeIVA := rate;

                 // Guardo en ALFA_1 la referencia original de Prestashop
                 A.Alfa_1 := reference;

                 // Limpio el codigo de producto para evitar caracteres que interfieran con el uso de la aplicación.
                 s := reference;
                 reference := '';
                 for i := 1 to Length(s) do
                    if (s[i] in [' ', '%', '?', '"', '''', '_', ';']) then
                       reference := reference + '-'
                    else
                       reference := reference + UpperCase(s[i]);

                 // Con esto me fijo si ya esta sincronizado
                 id_a := DameIdArticulo(QMConfPrestaShopID.AsInteger, id_product, id_product_attribute, id_attribute);

                 if (id_a <> 0) then
                    A.Articulo := DameArticulo(id_a)
                 else
                 begin
                    if (QMConfPrestaShopUTILIZA_REF_PRESTAHOP.AsInteger = 0) then
                    begin
                       if (id_product_attribute = 0) then
                          A.Articulo := Format('%s%.5d', [QMConfPrestaShopPREFIJO_ART.AsString, id_product]) // PRE00000 (Prefijo + id_product)
                       else
                          A.Articulo := Format('%s%.5d%.5d', [QMConfPrestaShopPREFIJO_ART.AsString, id_product, id_product_attribute]); // PRE00000-00000 (Prefijo + id_product-id_product_attribute);
                    end
                    else
                    begin
                       A.Articulo := Trim(Copy(QMConfPrestaShopPREFIJO_ART.AsString + reference, 1, 15));
                    end;
                 end;

                 ArticuloNuevo := False;
                 if (id_a = 0) then
                    ArticuloNuevo := True;

                 if ArticuloNuevo or (QMConfPrestaShopMANTENER_DESCRIPCIONES.AsInteger = 0) then
                 begin
                    A.Titulo := Trim(product_name);
                    if (sufijo_nombre > '') then
                       A.Titulo := A.Titulo + ' ' + sufijo_nombre;
                    if (Trim(A.Titulo) = '') then
                       A.Titulo := A.Articulo;
                 end;

                 A.Empresa := QMConfPrestaShopEMPRESA.AsInteger;
                 A.Ejercicio := REntorno.Ejercicio;
                 A.Canal := REntorno.Canal;
                 A.Familia := Familia;
                 A.SubFamilia := SubFamilia;
                 A.Peso := weight;
                 if (QMConfPrestaShopART_SIN_CONTROL_STOCK.AsInteger = 1) then
                    A.control_stock := 0
                 else
                    A.control_stock := 1;
                 A.web := 1;

                 // Creo o modifico articulo
                 if (A.Articulo <> '') then
                 begin
                    if (param_PSHTIVA001) then
                    begin
                       // Se asigna el Tipo Iva del canal
                       A.TipoIva := DameTipoIVACanal;
                       DMMain.Log(Format('Asigna TipoIva %d a articulo: %s', [A.TipoIva, A.Articulo]));
                    end;
                    CreaArticulo(A);

                    // Obtengo el ID del articulo creado/modificado
                    id_a := UDameDato.DameIdArticulo(A.Articulo, A.Empresa);

                    if (DameIdArticulo(QMConfPrestaShopID.AsInteger, id_product, id_product_attribute, id_attribute) = 0) then
                    begin
                       DMMain.Log(Format('Relacionando ID_A, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTE, ID_ATTRIBUTES: %d, %d, %d, %d,  &d, %s', [id_a, id_product, id_product_attribute, StrToIntDef(id_attribute, 0), id_attribute]));
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_ARTICULO (ID_CONFIGURACION, ID_A, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTE, ID_ATTRIBUTES, ID_STOCK_AVAILABLE, ');
                             SQL.Add(' TITULO, REFERENCIA, DESCRIPCION_CORTA, DESCRIPCION_LARGA, PRECIO, STOCK, ULT_SINCRONIZACION, IS_PACK) ');
                             SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_A, :ID_PRODUCT, :ID_PRODUCT_ATTRIBUTE, :ID_ATTRIBUTE, :ID_ATTRIBUTES, :ID_STOCK_AVAILABLE, ');
                             SQL.Add(' :TITULO, :REFERENCIA, :DESCRIPCION_CORTA, :DESCRIPCION_LARGA, :PRECIO, :STOCK, :ULT_SINCRONIZACION, :IS_PACK) ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                             Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
                             Params.ByName['ID_ATTRIBUTE'].AsInteger := StrToIntDef(id_attribute, 0);
                             Params.ByName['ID_ATTRIBUTES'].AsString := id_attribute;
                             Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := id_stock_available;
                             Params.ByName['ID_A'].AsInteger := id_a;
                             if (sufijo_nombre > '') then
                                Params.ByName['TITULO'].AsString := Copy(product_name + ' ' + sufijo_nombre, 1, 256)
                             else
                                Params.ByName['TITULO'].AsString := Copy(product_name, 1, 256);
                             Params.ByName['REFERENCIA'].AsString := Copy(reference, 1, 40);
                             Params.ByName['DESCRIPCION_CORTA'].AsString := DescripcionCorta;
                             Params.ByName['DESCRIPCION_LARGA'].AsString := DescripcionLarga;
                             Params.ByName['PRECIO'].AsFloat := price;
                             Params.ByName['STOCK'].AsFloat := Stock;
                             Params.ByName['ULT_SINCRONIZACION'].AsDateTime := MySQLDateTimeToDateTime(date_upd);
                             if (product_type = 'pack') then
                                Params.ByName['IS_PACK'].AsInteger := 1
                             else
                                Params.ByName['IS_PACK'].AsInteger := 0;
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
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SYS_CONF_PRESTASHOP_ARTICULO ');
                             SQL.Add(' SET  ');
                             SQL.Add(' ULT_SINCRONIZACION = :ULT_SINCRONIZACION, ');
                             SQL.Add(' ID_ATTRIBUTES = :ID_ATTRIBUTES, ');
                             SQL.Add(' ID_STOCK_AVAILABLE = :ID_STOCK_AVAILABLE, ');
                             SQL.Add(' TITULO = :TITULO, ');
                             SQL.Add(' REFERENCIA = :REFERENCIA, ');
                             SQL.Add(' DESCRIPCION_CORTA = :DESCRIPCION_CORTA, ');
                             SQL.Add(' DESCRIPCION_LARGA = :DESCRIPCION_LARGA, ');
                             SQL.Add(' PRECIO = :PRECIO, ');
                             SQL.Add(' STOCK = :STOCK ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                             SQL.Add(' ID_PRODUCT = :ID_PRODUCT AND ');
                             SQL.Add(' ID_PRODUCT_ATTRIBUTE = :ID_PRODUCT_ATTRIBUTE ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                             Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
                             Params.ByName['ID_ATTRIBUTES'].AsString := id_attribute;
                             Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := id_stock_available;
                             if (sufijo_nombre > '') then
                                Params.ByName['TITULO'].AsString := Copy(product_name + ' ' + sufijo_nombre, 1, 256)
                             else
                                Params.ByName['TITULO'].AsString := Copy(product_name, 1, 256);
                             Params.ByName['REFERENCIA'].AsString := Copy(reference, 1, 40);
                             Params.ByName['DESCRIPCION_CORTA'].AsString := DescripcionCorta;
                             Params.ByName['DESCRIPCION_LARGA'].AsString := DescripcionLarga;
                             Params.ByName['PRECIO'].AsFloat := price;
                             Params.ByName['STOCK'].AsFloat := Stock;
                             Params.ByName['ULT_SINCRONIZACION'].AsDateTime := MySQLDateTimeToDateTime(date_upd);
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;

                    // Actualizo el precio de la tarifa de venta
                    if ArticuloNuevo or (QMConfPrestaShopMANTENER_PRECIO.AsInteger = 0) then
                    begin
                       if (TarifaEsIvaIncluido(Tarifa, QMConfPrestaShopEMPRESA.AsInteger)) then
                          Precio := PrecioVentaIvaIncluido
                       else
                          Precio := price;

                       ActualizaPrecio(A.Articulo, Precio, Tarifa, QMConfPrestaShopEMPRESA.AsInteger);
                    end;

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
                 end
                 else
                 begin
                    Log.Add('ERROR Sincronizando articulos ****************************');
                    Log.Add('      No se puede crear artículo sin codigo');
                 end;

                 Combinaciones.Delete(0);
              end;
           end;
        end;

        Result := id_a;
     end
     else
        ShowMessage('(product)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Combinaciones.Free;
     StockAvailable.Free;
     Categorias.Free;
     Respuesta.Free;
     Documento.Free;
  end;

  (*
  DM := TDMPrestashop.Create(Self);
  try
     DM.SetDSN(QMConfPrestaShopDSN.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     FSendCorreo.Texto(_('Obteniendo Articulos'));
     Log.Add('Obteniendo Articulos');
     DMMain.Log('Obteniendo Articulos');
     // Tormo todos los articulos
     try
        DM.FiltraArticulos(IdProductIni, IdProductFin, Desde, Hasta, (QMConfPrestaShopID_TIENDA_ARTICULOS.AsInteger <> 0), Tipo);
     except
        on e: Exception do
           ShowMessage(_('Error al filtrar Articulos de MySQL') + #13#10 + e.Message);
     end;
     Log.Add('Fin Obteniendo Articulos');
     DMMain.Log('Fin Obteniendo Articulos');

     if (DM.QMySQL.Active) then
     begin
        DMMain.Log('DM.QMySQL.Active');
        id_product := 0;
        id_product_attribute := 0;
        id_product_equi := 0;
        id_attribute := '';
        id_attribute_equi := '';
        reference := '';
        ean13 := '';
        upc := '';
        product_name := '';
        id_supplier := 0;
        id_manufacturer := 0;
        quantity := 0;
        price := 0;
        weight := 0;
        rate := 0;
        PrecioVentaIvaIncluido := price + (price * rate / 100);
        ArticuloConMismoCodigoBarra := '';

        InicializaArticulo(A);

        if (DM.QMySQL.EOF) then
        begin
           Result := 0;
           Log.Add('Datos de producto:');
           Log.Add('  Nada que sincronizar');
           DMMain.Log('Nada que sincronizar');
        end;

        // Recorro la tabla de articulos de Prestashop
        try
           while (not DM.QMySQL.EOF) do
           begin
              DMMain.Log('Cargando campos');
              id_product := DM.QMySQL.FieldByName('id_product').AsInteger;
              id_product_attribute := DM.QMySQL.FieldByName('id_product_attribute').AsInteger;
              id_attribute := DM.QMySQL.FieldByName('id_attribute').AsString;
              if (QMConfPrestaShopID_TIENDA_ARTICULOS.AsInteger <> 0) then
              begin
                 id_product_equi := DM.QMySQL.FieldByName('id_product_equi').AsInteger;
                 id_attribute_equi := DM.QMySQL.FieldByName('id_attribute_equi').AsString;
              end;
              reference := DM.QMySQL.FieldByName('reference').AsString;
              ean13 := Trim(DM.QMySQL.FieldByName('ean13').AsString);
              upc := Trim(DM.QMySQL.FieldByName('upc').AsString);
              product_name := Trim(DM.QMySQL.FieldByName('name').AsString);
              id_supplier := DM.QMySQL.FieldByName('id_supplier').AsInteger;
              id_manufacturer := DM.QMySQL.FieldByName('id_manufacturer').AsInteger;
              quantity := DM.QMySQL.FieldByName('quantity').AsFloat;
              price := DM.QMySQL.FieldByName('price').AsFloat;
              weight := DM.QMySQL.FieldByName('weight').AsFloat;
              rate := DM.QMySQL.FieldByName('rate').AsFloat;
              date_upd := DM.QMySQL.FieldByName('date_upd').AsDateTime;

              DMMain.Log('Datos de producto:');
              DMMain.Log('  Leido: ');
              DMMain.Log('  id_product : ' + DM.QMySQL.FieldByName('id_product').AsString);
              DMMain.Log('  id_product_attribute : ' + IntToStr(id_product_attribute));
              DMMain.Log('  id_product_equi : ' + IntToStr(id_product_equi));
              DMMain.Log('  id_attribute_equi : ' + id_attribute_equi);
              DMMain.Log('  id_attribute : ' + id_attribute);
              DMMain.Log('  reference : ' + reference);
              DMMain.Log('  ean13 : ' + ean13);
              DMMain.Log('  upc : ' + upc);
              DMMain.Log('  product_name : ' + product_name);
              DMMain.Log('  id_supplier : ' + IntToStr(id_supplier));
              DMMain.Log('  id_manufacturer : ' + IntToStr(id_manufacturer));
              DMMain.Log('  quantity : ' + FloatToStr(quantity));
              DMMain.Log('  price : ' + FloatToStr(price));
              DMMain.Log('  Porcentaje IVA : ' + FloatToStr(rate));
              DMMain.Log('  weight : ' + FloatToStr(weight));

              DMMain.Log('Fin Cargando campos');

              InicializaArticulo(A);

              PrecioVentaIvaIncluido := 0;

              A.Fabricante := DameFabricante(QMConfPrestaShopEMPRESA.AsInteger, DameIdFabricantePrestaShop(QMConfPrestaShopID.AsInteger, id_manufacturer));

              Accion := 'Ninguna';
              if (date_upd > Desde) then
              begin
                 PrecioVentaIvaIncluido := price + (price * rate / 100);
                 A.PorcentajeIVA := rate;

                 // Guardo en ALFA_1 la referencia original de Prestashop
                 A.Alfa_1 := reference;

                 // Limpio el codigo de producto para evitar caracteres que interfieran con el uso de la aplicación.
                 s := reference;
                 reference := '';
                 for i := 1 to Length(s) do
                    if (s[i] in [' ', '%', '?', '"', '''', '_', ';']) then
                       reference := reference + '-'
                    else
                       reference := reference + UpperCase(s[i]);

                 FSendCorreo.Texto(Format(_('Articulo: %d - %s' + #13#10 + 'Modificado: %s'), [id_product, product_name, FormatDateTime('dd/mm/yyyy hh:nn:ss', date_upd)]));

                 Log.Add(Format(_('id_product: %d - id_product_attribute: %d - id_attribute: %s - Modificado: %s'), [id_product, id_product_attribute, id_attribute, FormatDateTime('dd/mm/yyyy hh:nn:ss', date_upd)]));

                 // Con esto me fijo si ya esta sincronizado
                 id_a := DameIdArticulo(QMConfPrestaShopID.AsInteger, id_product, id_product_attribute, id_attribute);
                 Log.Add(Format(_('id_a: %d'), [id_a]));

                 // Si no encuentro el articulo, lo busco en la equivalencia
                 if (((QMConfPrestaShopID_TIENDA_ARTICULOS.AsInteger <> 0) and (QMConfPrestaShopID_TIENDA_ARTICULOS.AsInteger <> QMConfPrestaShopID.AsInteger))) then
                 begin
                    if (id_a = 0) then
                    begin
                       id_a := DameIdArticulo(QMConfPrestaShopID_TIENDA_ARTICULOS.AsInteger, id_product_equi, -1, id_attribute_equi, False);
                       Log.Add(Format(_('id_a_equi: %d'), [id_a]));
                    end;
                 end;

                 if (id_a <> 0) then
                    A.Articulo := DameArticulo(id_a)
                 else
                 begin
                    if (QMConfPrestaShopUTILIZA_REF_PRESTAHOP.AsInteger = 0) then
                    begin
                       if (id_product_attribute = 0) then
                          A.Articulo := Format('%s%.5d', [QMConfPrestaShopPREFIJO_ART.AsString, id_product]) // PRE00000 (Prefijo + id_product)
                       else
                          A.Articulo := Format('%s%.5d%.5d', [QMConfPrestaShopPREFIJO_ART.AsString, id_product, id_product_attribute]); // PRE00000-00000 (Prefijo + id_product-id_product_attribute);
                    end
                    else
                    begin
                       A.Articulo := Copy(QMConfPrestaShopPREFIJO_ART.AsString + reference, 1, 15);
                    end;

                    with TFMSincronizacionTiendArticuloNuevo.Create(nil) do
                    begin
                       try
                          ArticuloPropuesto := A.Articulo;
                          ReferenciaArticulo := reference;
                          Alfa1Articulo := A.Alfa_1;
                          DatosImportacion.Add('Datos de producto:');
                          DatosImportacion.Add('  id_product : ' + IntToStr(id_product));
                          DatosImportacion.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
                          DatosImportacion.Add('  id_product_equi : ' + IntToStr(id_product_equi));
                          DatosImportacion.Add('  id_attribute_equi : ' + id_attribute_equi);
                          DatosImportacion.Add('  id_attribute : ' + id_attribute);
                          DatosImportacion.Add('  Cod. Articulo Propuesto : ' + A.Articulo);
                          DatosImportacion.Add('  reference : ' + A.Alfa_1);
                          if (A.Alfa_1 <> reference) then
                             DatosImportacion.Add('  reference (limpia) : ' + reference);
                          DatosImportacion.Add('  ean13 : ' + ean13);
                          DatosImportacion.Add('  upc : ' + upc);
                          DatosImportacion.Add('  product_name : ' + product_name);
                          DatosImportacion.Add('  id_supplier : ' + IntToStr(id_supplier));
                          DatosImportacion.Add('  id_manufacturer : ' + IntToStr(id_manufacturer));
                          DatosImportacion.Add('  Fabricante : ' + IntToStr(A.Fabricante));
                          DatosImportacion.Add('  quantity : ' + FloatToStr(quantity));
                          DatosImportacion.Add('  price : ' + FloatToStr(price));
                          DatosImportacion.Add('  Porcentaje IVA : ' + FloatToStr(rate));
                          DatosImportacion.Add('  Precio Venta Iva Incluido : ' + FloatToStr(PrecioVentaIvaIncluido));
                          DatosImportacion.Add('  weight : ' + FloatToStr(weight));

                          A.Articulo := Elegir(ImportarSiNoExisteOtro);
                       finally
                          Free;
                       end;
                    end;

                    Log.Add(Format(_('Articulo a Crear: >%s<'), [A.Articulo]));

                    if (A.Articulo = '') then
                       raise Exception.Create(_('Se ha cancelado la importación de artículos'));

                    // Verifico que no haya otro articulo con el mismo codigo.
                    s := DameTituloArticulo(A.Articulo, QMConfPrestaShopEMPRESA.AsInteger);
                    if (s > '') then
                    begin
                       // raise Exception.Create(Format(_('Ya existe un articulo con la misma referencia que la que se desea insertar (%s)'), [reference]));
                       Log.Add('WARNING sincronizando articulos');
                       Log.Add('Datos de producto:');
                       Log.Add('  Accion: ' + Accion);
                       Log.Add('  id_product : ' + IntToStr(id_product));
                       Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
                       Log.Add('  id_product_equi : ' + IntToStr(id_product_equi));
                       Log.Add('  id_attribute_equi : ' + id_attribute_equi);
                       Log.Add('  id_attribute : ' + id_attribute);
                       Log.Add('  articulo : ' + A.Articulo);
                       Log.Add('  reference : ' + reference);
                       Log.Add('  ean13 : ' + ean13);
                       Log.Add('  upc : ' + upc);
                       Log.Add('  product_name : ' + product_name);
                       Log.Add('  id_supplier : ' + IntToStr(id_supplier));
                       Log.Add('  id_manufacturer : ' + IntToStr(id_manufacturer));
                       Log.Add('  Fabricante : ' + IntToStr(A.Fabricante));
                       Log.Add('  quantity : ' + FloatToStr(quantity));
                       Log.Add('  price : ' + FloatToStr(price));
                       Log.Add('  Porcentaje IVA : ' + FloatToStr(rate));
                       Log.Add('  Precio Venta Iva Incluido : ' + FloatToStr(PrecioVentaIvaIncluido));
                       Log.Add('  weight : ' + FloatToStr(weight));
                       Log.Add(Format(_('Ya existe un articulo con la misma referencia que la que se desea insertar (%s)'), [reference]));

                       {
                       // Trato de generar otro codigo artículo nuevo con un contador
                       i := 0;
                       while (DameTituloArticulo(Articulo, QMConfPrestaShopEMPRESA.AsInteger) <> '') and (i < 100) do
                       begin
                          Inc(i);
                          Articulo := Ajusta(Articulo, 'D', 15, '0');
                          s := IntToStr(i);
                          Articulo := Copy(Articulo, 1, 15 - Length(s)) + s;
                       end;
                       }
                    end;
                 end;

                 Log.Add(Format(_('Articulo: %s'), [A.Articulo]));

                 A.Titulo := product_name;
                 if (product_name = '') then
                 begin
                    A.Titulo := A.Articulo;

                    Log.Add('WARNING sincronizando articulos');
                    Log.Add('Datos de producto:');
                    Log.Add('  Accion: ' + Accion);
                    Log.Add('  id_product : ' + IntToStr(id_product));
                    Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
                    Log.Add('  id_product_equi : ' + IntToStr(id_product_equi));
                    Log.Add('  id_attribute_equi : ' + id_attribute_equi);
                    Log.Add('  id_attribute : ' + id_attribute);
                    Log.Add('  articulo : ' + A.Articulo);
                    Log.Add('  reference : ' + reference);
                    Log.Add('  ean13 : ' + ean13);
                    Log.Add('  upc : ' + upc);
                    Log.Add('  product_name : ' + product_name);
                    Log.Add('  id_supplier : ' + IntToStr(id_supplier));
                    Log.Add('  id_manufacturer : ' + IntToStr(id_manufacturer));
                    Log.Add('  Fabricante : ' + IntToStr(A.Fabricante));
                    Log.Add('  quantity : ' + FloatToStr(quantity));
                    Log.Add('  price : ' + FloatToStr(price));
                    Log.Add('  Porcentaje IVA : ' + FloatToStr(rate));
                    Log.Add('  Precio Venta Iva Incluido : ' + FloatToStr(PrecioVentaIvaIncluido));
                    Log.Add('  weight : ' + FloatToStr(weight));
                    Log.Add(_('El artículo no tiene título'));
                 end;

                 A.Empresa := QMConfPrestaShopEMPRESA.AsInteger;
                 A.Ejercicio := REntorno.Ejercicio;
                 A.Canal := REntorno.Canal;
                 A.Familia := REntorno.FamDefecto;
                 A.Peso := weight;
                 if (QMConfPrestaShopART_SIN_CONTROL_STOCK.AsInteger = 1) then
                    A.control_stock := 0
                 else
                    A.control_stock := 1;
                 A.web := 1;

                 // Creo o modifico articulo
                 CreaArticulo(A);

                 // Obtengo el ID del articulo creado/modificado
                 id_a := DameIdArticulo(A.Articulo, A.Empresa);

                 // Creo relacion si no existe
                 if (DameIdArticulo(QMConfPrestaShopID.AsInteger, id_product, id_product_attribute, id_attribute) = 0) then
                 begin
                    DMMain.Log(Format('Relacionando ID_A, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTE, ID_ATTRIBUTES: %d, %d, %d, %d,  &d, %s', [id_a, id_product, id_product_attribute, StrToIntDef(id_attribute, 0), id_attribute]));
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_ARTICULO (ID_CONFIGURACION, ID_A, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTE, ID_ATTRIBUTES, ULT_SINCRONIZACION) ');
                          SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_A, :ID_PRODUCT, :ID_PRODUCT_ATTRIBUTE, :ID_ATTRIBUTE, :ID_ATTRIBUTES, :ULT_SINCRONIZACION) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                          Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
                          Params.ByName['ID_ATTRIBUTE'].AsInteger := StrToIntDef(id_attribute, 0);
                          Params.ByName['ID_ATTRIBUTES'].AsString := id_attribute;
                          Params.ByName['ID_A'].AsInteger := id_a;
                          Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end
                 else
                 begin
                    DMMain.Log(Format('Actualizando relacionan ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTE: %d, %d, %d, %s', [id_product, id_product_attribute, StrToIntDef(id_attribute, 0), id_attribute]));
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE SYS_CONF_PRESTASHOP_ARTICULO ');
                          SQL.Add(' SET ULT_SINCRONIZACION = :ULT_SINCRONIZACION, ID_ATTRIBUTES = :ID_ATTRIBUTES ');
                          SQL.Add(' WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND ID_PRODUCT = :ID_PRODUCT AND ID_PRODUCT_ATTRIBUTE = :ID_PRODUCT_ATTRIBUTE ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                          Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
                          Params.ByName['ID_ATTRIBUTES'].AsString := id_attribute;
                          Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 // Actualizo el precio de la tarifa de venta
                 if (TarifaEsIvaIncluido(Tarifa, QMConfPrestaShopEMPRESA.AsInteger)) then
                    Precio := PrecioVentaIvaIncluido
                 else
                    Precio := price;
                 ActualizaPrecio(A.Articulo, Precio, Tarifa, QMConfPrestaShopEMPRESA.AsInteger);

                 if (ean13 > '0') then
                 begin
                    DMMain.Log(Format('Actualiza EAN13 (id_a= %d, EAN13=%s)', [id_a, ean13]));
                    // Verifico si ya tiene un codigo de barra EAN13 asignado
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT FIRST (1) BARRAS FROM ART_ARTICULOS_BARRAS WHERE ID_A = :ID_A AND TIPO = :TIPO';
                          Params.ByName['ID_A'].AsInteger := id_a;
                          Params.ByName['TIPO'].AsInteger := 3;
                          ExecQuery;
                          CodigoBarra := Trim(FieldByName['BARRAS'].AsString);
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    // Verifico si otro artículo está utilizando el mismo código de barras
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

                    if (ArticuloConMismoCodigoBarra > '') then
                    begin
                       Log.Add('WARNING sincronizando articulos');
                       Log.Add('Datos de producto:');
                       Log.Add('  Accion: ' + Accion);
                       Log.Add('  id_product : ' + IntToStr(id_product));
                       Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
                       Log.Add('  id_product_equi : ' + IntToStr(id_product_equi));
                       Log.Add('  id_attribute_equi : ' + id_attribute_equi);
                       Log.Add('  id_attribute : ' + id_attribute);
                       Log.Add('  articulo : ' + A.Articulo);
                       Log.Add('  reference : ' + reference);
                       Log.Add('  ean13 : ' + ean13);
                       Log.Add('  upc : ' + upc);
                       Log.Add('  product_name : ' + product_name);
                       Log.Add('  id_supplier : ' + IntToStr(id_supplier));
                       Log.Add('  id_manufacturer : ' + IntToStr(id_manufacturer));
                       Log.Add('  Fabricante : ' + IntToStr(A.Fabricante));
                       Log.Add('  quantity : ' + FloatToStr(quantity));
                       Log.Add('  price : ' + FloatToStr(price));
                       Log.Add('  Porcentaje IVA : ' + FloatToStr(rate));
                       Log.Add('  Precio Venta Iva Incluido : ' + FloatToStr(PrecioVentaIvaIncluido));
                       Log.Add('  weight : ' + FloatToStr(weight));
                       Log.Add('  Hay otro articulo que utiliza el mimsmo codigo de barras EAN13:');
                       Log.Add('  ' + ArticuloConMismoCodigoBarra);
                    end
                    else
                    begin
                       // Si tiene codigo de barra y es distinto del de PrestaShop, lo actualizo
                       if ((CodigoBarra <> ean13) and (CodigoBarra > '')) then
                       begin
                          DMMain.Log(Format('Modifico EAN13 (id_a= %d, OLD_EAN13=%s, NEW_EAN13=%s)', [id_a, CodigoBarra, ean13]));
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Text := 'UPDATE ART_ARTICULOS_BARRAS SET BARRAS = :NEWBARRAS WHERE ID_A = :ID_A AND TIPO = :TIPO AND BARRAS = :OLDBARRAS';
                                Params.ByName['ID_A'].AsInteger := id_a;
                                Params.ByName['TIPO'].AsInteger := 3;
                                Params.ByName['NEWBARRAS'].AsString := ean13;
                                Params.ByName['OLDBARRAS'].AsString := CodigoBarra;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;

                       // Si NO tiene codigo de barra, lo creo
                       if ((CodigoBarra <> ean13) and (CodigoBarra = '')) then
                       begin
                          DMMain.Log(Format('Creo EAN13 (id_a= %d, EAN13=%s)', [id_a, ean13]));
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO ART_ARTICULOS_BARRAS ');
                                SQL.Add(' (EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION, ID_A, TITULO) ');
                                SQL.Add(' VALUES ');
                                SQL.Add(' (:EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION, :ID_A, :TITULO) ');
                                Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                                Params.ByName['BARRAS'].AsString := ean13;
                                Params.ByName['ARTICULO'].AsString := Copy(A.Articulo, 1, 15);
                                Params.ByName['TIPO'].AsInteger := 3;
                                Params.ByName['FUNCION'].AsInteger := 0;
                                Params.ByName['ID_A'].AsInteger := id_a;
                                Params.ByName['TITULO'].AsString := Copy(A.Titulo, 1, 60);
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end;
                 end;

                 if (upc > '') then
                 begin
                    DMMain.Log(Format('Actualiza UPC (id_a= %d, EAN13=%s)', [id_a, upc]));
                    // Verifico si ya tiene un codigo de barra UPC asignado
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT FIRST (1) BARRAS FROM ART_ARTICULOS_BARRAS WHERE ID_A = :ID_A AND TIPO = :TIPO';
                          Params.ByName['ID_A'].AsInteger := id_a;
                          Params.ByName['TIPO'].AsInteger := 4;
                          ExecQuery;
                          CodigoBarra := Trim(FieldByName['BARRAS'].AsString);
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    // Verifico si otro artículo está utilizando el mismo código de barras
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

                    if (ArticuloConMismoCodigoBarra > '') then
                    begin
                       Log.Add('WARNING sincronizando articulos');
                       Log.Add('Datos de producto:');
                       Log.Add('  Accion: ' + Accion);
                       Log.Add('  id_product : ' + IntToStr(id_product));
                       Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
                       Log.Add('  id_product_equi : ' + IntToStr(id_product_equi));
                       Log.Add('  id_attribute_equi : ' + id_attribute_equi);
                       Log.Add('  id_attribute : ' + id_attribute);
                       Log.Add('  articulo : ' + A.Articulo);
                       Log.Add('  reference : ' + reference);
                       Log.Add('  ean13 : ' + ean13);
                       Log.Add('  upc : ' + upc);
                       Log.Add('  product_name : ' + product_name);
                       Log.Add('  id_supplier : ' + IntToStr(id_supplier));
                       Log.Add('  id_manufacturer : ' + IntToStr(id_manufacturer));
                       Log.Add('  Fabricante : ' + IntToStr(A.Fabricante));
                       Log.Add('  quantity : ' + FloatToStr(quantity));
                       Log.Add('  price : ' + FloatToStr(price));
                       Log.Add('  Porcentaje IVA : ' + FloatToStr(rate));
                       Log.Add('  Precio Venta Iva Incluido : ' + FloatToStr(PrecioVentaIvaIncluido));
                       Log.Add('  weight : ' + FloatToStr(weight));
                       Log.Add('  Hay otro articulo que utiliza el mimsmo codigo de barras UPC:');
                       Log.Add('  ' + ArticuloConMismoCodigoBarra);
                    end
                    else
                    begin
                       // Si tiene codigo de barra y es distinto del de PrestaShop, lo actualizo
                       if ((CodigoBarra <> upc) and (CodigoBarra > '')) then
                       begin
                          DMMain.Log(Format('Modifico UPC (id_a= %d, OLD_UPC=%s, NEW_UPC=%s)', [id_a, CodigoBarra, upc]));
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Text := 'UPDATE ART_ARTICULOS_BARRAS SET BARRAS = :NEWBARRAS WHERE ID_A = :ID_A AND TIPO = :TIPO AND BARRAS = :OLDBARRAS';
                                Params.ByName['ID_A'].AsInteger := id_a;
                                Params.ByName['TIPO'].AsInteger := 4;
                                Params.ByName['NEWBARRAS'].AsString := upc;
                                Params.ByName['OLDBARRAS'].AsString := CodigoBarra;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;

                       // Si NO tiene codigo de barra, lo creo
                       if ((CodigoBarra <> upc) and (CodigoBarra = '')) then
                       begin
                          DMMain.Log(Format('Creo UPC (id_a= %d, UPC=%s)', [id_a, upc]));
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO ART_ARTICULOS_BARRAS ');
                                SQL.Add(' (EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION, ID_A, TITULO) ');
                                SQL.Add(' VALUES ');
                                SQL.Add(' (:EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION, :ID_A, :TITULO) ');
                                Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                                Params.ByName['BARRAS'].AsString := upc;
                                Params.ByName['ARTICULO'].AsString := Copy(A.Articulo, 1, 15);
                                Params.ByName['TIPO'].AsInteger := 4;
                                Params.ByName['FUNCION'].AsInteger := 0;
                                Params.ByName['ID_A'].AsInteger := id_a;
                                Params.ByName['TITULO'].AsString := Copy(A.Titulo, 1, 60);
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end;
                 end;
              end; {date_upd > UltimaSincronizacion}

              DMMain.Log('Datos de producto:');
              DMMain.Log('  Accion: ' + Accion);
              DMMain.Log('  id_product : ' + IntToStr(id_product));
              DMMain.Log('  id_product_attribute : ' + IntToStr(id_product_attribute));
              DMMain.Log('  id_product_equi : ' + IntToStr(id_product_equi));
              DMMain.Log('  id_attribute_equi : ' + id_attribute_equi);
              DMMain.Log('  id_attribute : ' + id_attribute);
              DMMain.Log('  articulo : ' + A.Articulo);
              DMMain.Log('  reference : ' + reference);
              DMMain.Log('  ALFA_1 : ' + A.Alfa_1);
              DMMain.Log('  ean13 : ' + ean13);
              DMMain.Log('  upc : ' + upc);
              DMMain.Log('  product_name : ' + product_name);
              DMMain.Log('  Titulo : ' + A.Titulo);
              DMMain.Log('  id_supplier : ' + IntToStr(id_supplier));
              DMMain.Log('  id_manufacturer : ' + IntToStr(id_manufacturer));
              DMMain.Log('  Fabricante : ' + IntToStr(A.Fabricante));
              DMMain.Log('  quantity : ' + FloatToStr(quantity));
              DMMain.Log('  price : ' + FloatToStr(price));
              DMMain.Log('  Porcentaje IVA : ' + FloatToStr(rate));
              DMMain.Log('  Precio Venta Iva Incluido : ' + FloatToStr(PrecioVentaIvaIncluido));
              DMMain.Log('  weight : ' + FloatToStr(weight));
              DMMain.Log('  date_upd : ' + DateTimeToStr(date_upd));
              DMMain.Log('----------');

              id_product := -1;
              DM.QMySQL.Next;
              id_product_attribute := -1;
              id_attribute := '';
           end; { while }
        except
           on e: Exception do
           begin
              Log.Add('ERROR Sincronizando articulos ******************************');
              Log.Add('Datos de producto:');
              Log.Add('  Accion: ' + Accion);
              Log.Add('  id_product : ' + IntToStr(id_product));
              Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
              Log.Add('  id_product_equi : ' + IntToStr(id_product_equi));
              Log.Add('  id_attribute_equi : ' + id_attribute_equi);
              Log.Add('  id_attribute : ' + id_attribute);
              Log.Add('  articulo : ' + A.Articulo);
              Log.Add('  reference : ' + reference);
              Log.Add('  ean13 : ' + ean13);
              Log.Add('  upc : ' + upc);
              Log.Add('  product_name : ' + product_name);
              Log.Add('  id_supplier : ' + IntToStr(id_supplier));
              Log.Add('  id_manufacturer : ' + IntToStr(id_manufacturer));
              Log.Add('  Fabricante : ' + IntToStr(A.Fabricante));
              Log.Add('  quantity : ' + FloatToStr(quantity));
              Log.Add('  price : ' + FloatToStr(price));
              Log.Add('  Porcentaje IVA : ' + FloatToStr(rate));
              Log.Add('  Precio Venta Iva Incluido : ' + FloatToStr(PrecioVentaIvaIncluido));
              Log.Add('  weight : ' + FloatToStr(weight));
              Log.Add('Excepcion');
              Log.Add(E.Message);

              with DM.QMySQL do
              begin
                 if Active then
                 begin
                    for f := 0 to FieldCount - 1 do
                       Log.Add(Fields[f].FieldName + '=' + Fields[f].AsString + '.');
                 end;
              end;

              Result := -1;
           end;
        end;
     end;
  finally
     DM.Free;
  end;
  *)
end;

function TDMSincronizacionTienda.DameIdClientePrestaShop(IdConfiguracion, IdCustomer: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_CLIENTE ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_CLIENTE ');
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

function TDMSincronizacionTienda.DameIdProveedorPrestaShop(IdConfiguracion, IdSupplier: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
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
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMSincronizacionTienda.DameIdFabricantePrestaShop(IdConfiguracion, IdManufacturer: integer): integer;
begin
  /// Por ahora el fabricante y el tercero es lo mismo.
  /// Se utiliza en la ficha del articulo.

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
end;

function TDMSincronizacionTienda.DameDireccionPrestaShop(IdConfiguracion, IdAddress, Tercero: integer): integer;
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
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_CLIENTE_DIR P ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' ON D.TERCERO = P.TERCERO AND D.DIRECCION = P.DIRECCION ');
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
end;

function TDMSincronizacionTienda.DameProveedor(Empresa, IdProveedor: integer): integer;
var
  Q : THYFIBQuery;
begin
  /// Devuelve el proveedor de un IdProveedor.
  /// Se requiere la empresa porqe puede que no sea de la que se quiera

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
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
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMSincronizacionTienda.DameFabricante(Empresa, IdFabricante: integer): integer;
begin
  /// El fabricante y el tercero en este momento es lo mismo

  Result := IdFabricante;
end;

function TDMSincronizacionTienda.SincronizaClientes(IdConfiguracion: integer; Desde, Hasta: TDateTime): boolean;
var
  i : integer;
  id : integer;
  lastname : string;
  firstname : string;
  company : string;
  email : string;
  customer_active : integer;
  date_upd : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  Log.Add(_('Obteniendo Clientes'));
  /// Sincroniza manufacturers con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  Result := False;
  FSendCorreo.Texto(_('Obteniendo Clientes'));

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los fabricantes activos
     Opciones := '&display=[id,lastname,firstname,company,email,active,date_upd]';
     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + '&filter[active]=[1]';
     if DMPrestashop.SuperaVersion('1.6.0.8') then
        Opciones := Opciones + '&filter[date_upd]=[' + FormatDateTime('yyyy-mm-dd', Desde) + ',' + FormatDateTime('yyyy-mm-dd', Hasta + 1) + ']&date=1';
     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('customers', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-customers.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['customers']);
           if Assigned(NodoPadre) then
           begin
              Result := True;
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToInt(DameDato(Nodo, ['id']));
                 lastname := DameDato(Nodo, ['lastname']);
                 firstname := DameDato(Nodo, ['firstname']);
                 company := DameDato(Nodo, ['company']);
                 email := DameDato(Nodo, ['email']);
                 customer_active := StrToInt(DameDato(Nodo, ['active']));
                 date_upd := DameDato(Nodo, ['date_upd']);

                 // Si la fecha de modificacion esta dentro de los parametros
                 if ((date_upd > FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
                    (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
                 begin
                    if (customer_active = 1) then
                    begin
                       // Sincronizo. Espero numero de tercero si es correcto.
                       if (SincronizaUnCliente(IdConfiguracion, id) = 0) then
                          Result := False;
                    end;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(customers)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaUnCliente(IdConfiguracion, id_customer: integer): integer;
var
  //i : integer;
  id : integer;
  lastname : string;
  firstname : string;
  company : string;
  email_customer : string;
  date_upd : string;

  id_address : integer;

  Tercero, TerceroAsociado : integer;
  ClienteAsociado : integer;
  C : TCliente;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
begin
  /// Sincroniza el id_customer con un cliente.
  /// Si se realiza con exito devuelve el numero de cliente asociado.
  /// Si no tiene direccion no se sincroniza, pero devuelve -1. (Tratándolo como un WARNING)

  Log.Add(Format(_('Sincronizando Cliente (Id Customer) %d'), [id_customer]));
  //Result := 0;
  id := 0;
  id_address := 0;

  InicializaCliente(C);
  // Obtenemos datos de cliente base si lo tuviese
  if (QMConfPrestaShopCLIENTE_BASE.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           SQL.Add(' SELECT FIRST 1 TERCERO, CLIENTE, PAIS, PAIS_C2, AGENTE, TIPO,  CUENTA, CUENTA_COMPRA, ');
           SQL.Add(' CUENTA_DTOCIAL, CUENTA_DTOPP, CUENTA_IRPF, CUENTA_VENTA, DESCUENTO_CIAL, DESCUENTO_PP,  ');
           SQL.Add(' MODO_IVA, TARIFA, FORMA_PAGO, USAR_ANTICIPOS, EVAL_FEB, EVAL_FEB_SI, BANCO_PAGOS, ');
           SQL.Add(' TRANSPORTISTA, TIPO_PORTES, FACTURAR_SERIE, SERIE_A_FACTURAR, ALBARANAR_SERIE, SERIE_A_ALBARANAR, ');
           SQL.Add(' NO_AGRUPAR_ALBARANES ');
           SQL.Add(' FROM VER_CLIENTES_CUENTAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' CLIENTE = :CLIENTE_BASE ');
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
              c.usar_anticipos := FieldByName['USAR_ANTICIPOS'].AsInteger;
              c.eval_feb := FieldByName['EVAL_FEB'].AsInteger;
              c.eval_feb_si := FieldByName['EVAL_FEB_SI'].AsInteger;
              c.banco_pagos := FieldByName['BANCO_PAGOS'].AsInteger;
              c.transportista := FieldByName['TRANSPORTISTA'].AsInteger;
              c.tipo_portes := FieldByName['TIPO_PORTES'].AsInteger;
              c.facturar_serie := FieldByName['FACTURAR_SERIE'].AsInteger;
              c.serie_a_facturar := FieldByName['SERIE_A_FACTURAR'].AsString;
              c.albaranar_serie := FieldByName['ALBARANAR_SERIE'].AsInteger;
              c.serie_a_albaranar := FieldByName['SERIE_A_ALBARANAR'].AsString;
              c.no_agrupar_albaranes := FieldByName['NO_AGRUPAR_ALBARANES'].AsInteger;

              // c.Tercero := FieldByName['TERCERO'].AsInteger;
              // c.Cuenta := FieldByName['CUENTA'].AsString;
              // c.Pais := FieldByName['PAIS'].AsString;
              // c.Pais_c2 := FieldByName['PAIS_C2'].AsString;
              { TODO: Resto de campos a tener en cuenta. Hay que implementarlos en UDMSincronizacion
                RIESGO_EMP,
                RIESGO_CYC,
                RIESGO_FACTOR,
                MODO_IVA,
                DIA_PAGO_1,
                DIA_PAGO_2,
                DIA_PAGO_3,
                DESCUENTO_PP,
                DESCUENTO_CIAL,
                AGENTE,
                PERFIL,
                TIPO_IRPF,
                PAIS,
                TIPO,
                PORTES,
                SU_PROVEEDOR,
                MONEDA,
                FINANCIACION,
                FACTURAR_AGENTE,
                FACTURAR_TRANSPORTISTA,
                FACTURAR_REFERENCIA,
                FACTURAR_DIRECCION,
                FACTURAR_ALMACEN,
                FACTURA_DIRECCION_ADMTVA,
                ALBARAN_DIRECCION_ENVIO,
                POR_FINANCIACION,
                NO_ALB_FAC,
                NO_VENTA_RIESGO,
                SU_REFERENCIA,
                CREDITO_Y_CAUCION,
                NRO_EMPLEADOS,
                FACTURACION_TOTAL,
                CONSUMO_MATERIAL,
                PROVEEDORES_HABITUALES,
                RUTA,
                RUTA_ORDEN,
                CLIENTE_POTENCIAL,
                TIPO_CLIENTE,
                NO_CALC_DESC_KRI,
                NO_AGRUPAR_PED_KRI,
                POTENCIAL_DE_COMPRA,
                INTRA,
                INTRA_TRANS,
                FACTURAR_TARIFA,
                CUENTA_DTOPP,
                CUENTA_DTOCIAL,
                CUENTA_IRPF,
                DIAS_ENTREGA,
                IDIOMA,
                APLICAR_PTO_VERDE,
                COD_CREDITO_Y_CAUCION,
                FACTURAS_POR_EMAIL_KRI,
                POR_PORTES,
                I_PORTES,
                RANGO,
                INDICE,
                FRECUENCIA,
                ZONA,
                PROTOCOLO,
                BLOQUEO,
                MOTIVO_BLOQUEO,
                CODIGO_INCOTERM,
                DIR_DEFECTO_VENTAS,
                DIRECCION_DEFECTO,
                FECHA_ENTREGA_X_STOCK,
                SIN_DESCUENTOS,
                UTILIZA_F_PAGO_ALTERNATIVA,
                TIPO_NCF,
                CUENTA_COMPRA,
                CUENTA_VENTA,
                DTO_CIAL_LINEA,
                DTO_CIAL_LINEA_2,
                DTO_CIAL_LINEA_3,
                FEC_PROP_CREDITO_Y_CAUCION,
                RECC,
                PEDIDO_VALORADO,
                ALBARAN_VALORADO,
                PERIODO_FACTURACION,
                SEPARAR_DTO_CIAL,
                DIA_SEMANA_PAGO,
                CATEGORIA,
                CANAL_DST_PEC,
                SERIE_DST_PEC,
                TIPO_DST_PEC,
                IMPORTE_MINIMO_PORTE,
                ALFA_1,
                ALFA_2,
                ALFA_3,
                ALFA_4,
                ALFA_5,
                ALFA_6,
                ALFA_7,
                ALFA_8
              }
           end;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMPrestashop.WS_Get('customers', id_customer, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Customer.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Datos del cliente
           Nodo := DameNodo(Documento.DocumentElement, ['customer']);
           if Assigned(Nodo) then
           begin
              id := StrToInt(DameDato(Nodo, ['id']));
              lastname := DameDato(Nodo, ['lastname']);
              firstname := DameDato(Nodo, ['firstname']);
              company := DameDato(Nodo, ['company']);
              email_customer := DameDato(Nodo, ['email']);
              date_upd := DameDato(Nodo, ['date_upd']);
           end;
        end;
     end
     else
     begin
        if not SincronizarcionAutomatica then
           ShowMessage('(customer)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text)
        else
           Log.Add('(customer)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     end
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  if (not SincronizarcionAutomatica) and Assigned(FSendCorreo) then
  begin
     try
        FSendCorreo.Texto(Format(_('Id Customer: %d - %s %s (%s)' + #13#10 + 'Date Upd: %s'), [id, lastname, firstname, company, date_upd]));
     except
     end;
  end;
  Log[Log.Count - 1] := Format(_('Sincronizando Cliente (Id Customer) %d - %s %s (%s) - Date Upd: %s'), [id, lastname, firstname, company, date_upd]);

  // Id de cliente, Cliente y Tercero relacionado con el id prestashop
  with C do
  begin
     Empresa := QMConfPrestaShopEMPRESA.AsInteger;
     IdCliente := DameIdClientePrestaShop(IdConfiguracion, id);
     Cliente := DMMain.DameCliente(QMConfPrestaShopEMPRESA.AsInteger, IdCliente);
     Tercero.email := email_customer;
     Cuenta := QMConfPrestaShopCUENTA_CLIENTE.AsString;
  end;

  TerceroAsociado := DameTercero('CLI', C.Cliente, QMConfPrestaShopEMPRESA.AsInteger);
  ClienteAsociado := C.Cliente;

  // Direcciones del cliente
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     Opciones := '&display=[id,id_customer]';
     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + format('&filter[id_customer]=[%d]', [id_customer]);

     CodigoRespuesta := DMPrestashop.WS_Get('addresses', 0, Opciones, Respuesta);

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Obtengo datos del fabricante
           NodoPadre := DameNodo(Documento.DocumentElement, ['addresses', 'address']);
           while Assigned(NodoPadre) do
           begin
              if (StrToInt(DameDato(NodoPadre, ['id_customer'])) = id_customer) then
              begin
                 id_address := StrToInt(DameDato(NodoPadre, ['id']));

                 // Sincronizo direccion
                 Tercero := SincronizaUnaDireccion(IdConfiguracion, id_address, TerceroAsociado);
                 TerceroAsociado := Tercero;
              end;

              NodoPadre := NodoPadre.NextSibling;
           end;
        end;
     end
     else
     begin
        if not SincronizarcionAutomatica then
           ShowMessage('(customer.addresses)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text)
        else
           ShowMessage('(customer.addresses)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     end;
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  C.Tercero.Tercero := TerceroAsociado;

  // Si no tiene direccion no lo sincronizo como cliente/tercero.
  if (TerceroAsociado = 0) then
  begin
     Log.Add(Format(_('ERROR: No se sincroniza cliente porque no se pudo crear tercero / direccion / NIF %d'), [id_customer]));
     Result := 0;
  end
  else
  // Si no tiene direccion no lo sincronizo como cliente/tercero.
  if (id_address = 0) then
  begin
     Log.Add(Format(_('WARNING: No se sincroniza cliente porque no tiene direccion asociada %d'), [id_customer]));
     Result := -1;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT P.PAIS, P.PERTENECE_CEE, L.PROVINCIA FROM SYS_TERCEROS_DIRECCIONES D ');
           SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
           SQL.Add(' JOIN SYS_PAISES P ON L.PAIS = P.PAIS ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.TERCERO = :TERCERO AND ');
           SQL.Add(' D.DIR_DEFECTO = 1 ');
           Params.ByName['TERCERO'].AsInteger := C.Tercero.Tercero;
           ExecQuery;
           if (FieldByName['PAIS'].AsString = 'ESP') then
           begin
              // Baleares, Las Palmas, Santa Cruz de Tenerifa, Ceuta y Melilla se tratan como Extranjeros
              if ((FieldByName['PROVINCIA'].AsString = '07') or
                 (FieldByName['PROVINCIA'].AsString = '35') or
                 (FieldByName['PROVINCIA'].AsString = '38') or
                 (FieldByName['PROVINCIA'].AsString = '51') or
                 (FieldByName['PROVINCIA'].AsString = '52')) then
                 C.ModoIVA := 5
              else
                 C.ModoIVA := 1;
           end
           else
           if (FieldByName['PERTENECE_CEE'].AsInteger = 1) then
              C.ModoIVA := 3
           else
              C.ModoIVA := 5;
           FreeHandle;
        finally
           Free;
        end;
     end;

     CreaCliente(C);

     if (ClienteAsociado = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_CLIENTE ( ');
              SQL.Add(' ID_CONFIGURACION, ID_CLIENTE, ID_CUSTOMER /*, ULT_SINCRONIZACION*/ ) ');
              SQL.Add(' SELECT :ID_CONFIGURACION, ID_CLIENTE, :ID_CUSTOMER /*, :ULT_SINCRONIZACION*/ ');
              SQL.Add(' FROM EMP_CLIENTES ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CLIENTE = :CLIENTE ');
              Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
              Params.ByName['ID_CUSTOMER'].AsInteger := id_customer;
              // Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
              Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
              Params.ByName['CLIENTE'].AsInteger := C.Cliente;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     Result := C.Cliente;
  end;
end;

function TDMSincronizacionTienda.SincronizaProveedores(Desde, Hasta: TDateTime): integer;
  //var
  //Q : THYFIBQuery;
  //i : integer;
  //tercero : integer;
  //id_supplier : integer;
  //lastname : string;
  //firstname : string;
  //email : string;
  //dni_original : string;
  //dni : string;
  //vat_number : string;
  //CtaDtoPP : string;
  //PaisC2 : string;
  //Cuenta : string;
  //date_upd : TDateTime;
  //Proveedor : integer;
  //DM : TDMPrestashop;
  //Notas : string;
begin
  Result := -1;
  { TODO : Implementar mediante webservice }

  (*
  DM := TDMPrestashop.Create(Self);
  try
     DM.SetDSN(QMConfPrestaShopDSN.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     FSendCorreo.Texto(_('Obteniendo Proveedores'));
     // El 1 es la de nutrienda por eso pido a partir de la 2
     DM.FiltraProveedores(1, 999999, Desde, Hasta);
     if (DM.QMySQL.Active) then
     begin
        // Datos por defecto para insertar proveedores
        CtaDtoPP := DMMain.DameCuentaGestion(14, -1, QMConfPrestaShopEMPRESA.AsInteger);
        PaisC2 := DamePaisC2(REntorno.Pais);
        id_supplier := 0;
        Proveedor := 0;
        Tercero := 0;

        if (not DM.QMySQL.EOF) then
           Result := 0;

        try
           while (not DM.QMySQL.EOF) do
           begin
              id_supplier := DM.QMySQL.FieldByName('id_supplier').AsInteger;
              lastname := DM.QMySQL.FieldByName('lastname').AsString;
              firstname := DM.QMySQL.FieldByName('firstname').AsString;
              email := LowerCase(Copy(Trim(DM.QMySQL.FieldByName('email').AsString), 1, 100));
              dni_original := Trim(DM.QMySQL.FieldByName('dni').AsString);
              vat_number := Trim(DM.QMySQL.FieldByName('vat_number').AsString);
              date_upd := DM.QMySQL.FieldByName('date_upd').AsDateTime;

              if (date_upd > Desde) then
              begin
                 Log.Add(Format(_('Sincronizando Proveedor %d'), [id_supplier]));
                 Notas := Format(_('Id Suplier: %d - %s %s' + #13#10 + 'email: %s' + #13#10 + 'dni: %s' + #13#10 + 'vat_number: %s'), [id_supplier, lastname, firstname, email, dni_original, vat_number]);
                 FSendCorreo.Texto(Notas);

                 // Si dni viene vacio utilizo vat_number (se da en caso de extranjeros)
                 if (dni_original = '') then
                    dni_original := vat_number;

                 // Limpio el DNI para evitar posibles duplicados
                 dni := '';
                 // Quita espacios en blanco y lo que no sea numero o letra
                 for i := 1 to Length(dni_original) do
                    if (dni_original[i] in ['A'..'Z', 'a'..'z', '0'..'9']) then
                       dni := dni + UpperCase(dni_original[i]);
                 dni := Copy(dni, 1, 20);

                 // Me fijo si ya existe en la base
                 // Obtengo el tercero del Proveedor con ID_PRESTASHOP = id_supplier
                 Tercero := DameTercero('PRO', DameProveedor(QMConfPrestaShopEMPRESA.AsInteger, DameIdProveedorPrestaShop(QMConfPrestaShopID.AsInteger, id_supplier)), QMConfPrestaShopEMPRESA.AsInteger);
                 if (Tercero = 0) then
                 begin
                    // Inserto el tercero
                    Tercero := DMMain.ContadorGen('CONTA_TERCEROS');
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('INSERT INTO VER_TERCEROS_EDICION ');
                          SQL.Add('(TERCERO, NOMBRE_R_SOCIAL, NIF, EMAIL, TIPO_RAZON, DIR_DEFECTO, NOTAS) ');
                          SQL.Add('VALUES ');
                          SQL.Add('(:TERCERO, :NOMBRE_R_SOCIAL, :NIF, :EMAIL, :TIPO_RAZON, :DIR_DEFECTO, :NOTAS) ');
                          Params.ByName['TERCERO'].AsInteger := Tercero;
                          Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(firstname + ' ' + lastname, 1, 60);
                          Params.ByName['NIF'].AsString := dni;
                          Params.ByName['TIPO_RAZON'].AsString := 'DE';
                          Params.ByName['EMAIL'].AsString := email;
                          Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                          Params.ByName['NOTAS'].AsString := Notas;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    // Inserto el Proveedor
                    Proveedor := DMMain.Contador_E('XPR', QMConfPrestaShopEMPRESA.AsInteger);
                    Cuenta := ExpandirCadena(DMMain.DameSemillaCuentaGestion(SemProveedores, 1) + IntToStr(Proveedor), REntorno.DigitosSub);
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('INSERT INTO VER_PROVEEDORES_CUENTAS ');
                          SQL.Add('(EMPRESA, EJERCICIO, CANAL, PROVEEDOR, TERCERO, PAIS, PAIS_C2, CUENTA, FORMA_PAGO, CUENTA_DTOPP, CODIGO_INCOTERM, MODO_IVA, TIPO, NOTAS) ');
                          SQL.Add('VALUES ');
                          SQL.Add('(:EMPRESA, :EJERCICIO, :CANAL, :PROVEEDOR, :TERCERO, :PAIS, :PAIS_C2, :CUENTA, :FORMA_PAGO, :CUENTA_DTOPP, :CODIGO_INCOTERM, :MODO_IVA, :TIPO, :NOTAS) ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                          Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                          Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                          Params.ByName['TERCERO'].AsInteger := Tercero;
                          Params.ByName['PAIS'].AsString := REntorno.Pais;
                          Params.ByName['PAIS_C2'].AsString := PaisC2;
                          Params.ByName['CUENTA'].AsString := Cuenta;
                          Params.ByName['FORMA_PAGO'].AsString := 'CON';
                          Params.ByName['CUENTA_DTOPP'].AsString := CtaDtoPP;
                          Params.ByName['CODIGO_INCOTERM'].AsString := 'EXW';
                          Params.ByName['MODO_IVA'].AsInteger := DameModoIva;
                          Params.ByName['TIPO'].AsInteger := 1;
                          Params.ByName['NOTAS'].AsString := Notas;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    // Asigno ID_PRESTASHOP al Proveedor
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_PROVEEDOR ( ');
                          SQL.Add(' ID_CONFIGURACION, ID_PROVEEDOR, ID_SUPPLIER, ULT_SINCRONIZACION) ');
                          SQL.Add(' SELECT :ID_CONFIGURACION, ID_PROVEEDOR, :ID_SUPPLIER, :ULT_SINCRONIZACION ');
                          SQL.Add(' FROM EMP_PROVEEDORES ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' EMPRESA = :EMPRESA AND ');
                          SQL.Add(' PROVEEDOR = :PROVEEDOR ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_SUPPLIER'].AsInteger := id_supplier;
                          Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end
                 else
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE VER_TERCEROS_EDICION ');
                          SQL.Add(' SET  ');
                          SQL.Add(' NOMBRE_R_SOCIAL = :NOMBRE_R_SOCIAL ');
                          if (dni > '') then
                             SQL.Add(' ,NIF = :NIF  ');
                          if (email > '') then
                             SQL.Add(' ,EMAIL = :EMAIL ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' TERCERO = :TERCERO ');
                          Params.ByName['TERCERO'].AsInteger := Tercero;
                          Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(firstname + ' ' + lastname, 1, 60);
                          if (dni > '') then
                             Params.ByName['NIF'].AsString := dni;
                          if (email > '') then
                             Params.ByName['EMAIL'].AsString := email;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE SYS_CONF_PRESTASHOP_PROVEEDOR ');
                          SQL.Add(' SET  ');
                          SQL.Add(' ULT_SINCRONIZACION = :ULT_SINCRONIZACION ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                          SQL.Add(' ID_SUPPLIER = :ID_SUPPLIER ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_SUPPLIER'].AsInteger := id_supplier;
                          Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;
              end; {date_upd > UltimaSincronizacion}
              DMMain.Log('Datos de Proveedor:');
              DMMain.Log('  id_supplier : ' + IntToStr(id_supplier));
              DMMain.Log('  lastname : ' + lastname);
              DMMain.Log('  firstname : ' + firstname);
              DMMain.Log('  email : ' + email);
              DMMain.Log('  dni : ' + dni_original);
              DMMain.Log('  vat_number : ' + vat_number);
              DMMain.Log('  Proveedor : ' + IntToStr(Proveedor));
              DMMain.Log('  Tercero : ' + IntToStr(Tercero));
              DMMain.Log('  NIF : ' + dni);
              DMMain.Log('----------');

              DM.QMySQL.Next;
           end; { while }
        except
           on e: Exception do
           begin
              Log.Add('ERROR Sincronizando proveedores ****************************');
              Log.Add('Datos de proveedor:');
              Log.Add('  id_supplier : ' + IntToStr(id_supplier));
              Log.Add('  lastname : ' + lastname);
              Log.Add('  firstname : ' + firstname);
              Log.Add('  email : ' + email);
              Log.Add('  dni : ' + dni_original);
              Log.Add('  vat_number : ' + vat_number);
              Log.Add('  Proveedor : ' + IntToStr(Proveedor));
              Log.Add('  Tercero : ' + IntToStr(Tercero));
              Log.Add('  NIF : ' + dni);
              Log.Add('Excepcion');
              Log.Add(E.Message);

              Result := -1;
           end;
        end;
     end;
  finally
     DM.Free;
  end;
  *)
end;

function TDMSincronizacionTienda.DameModoIva: integer;
var
  Q : THYFIBQuery;
begin
  // Consulta para obtener el modo de iva del canal
  if (FModoIVACanal = -1) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL';
           Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FModoIVACanal := FieldByName['MODO_IVA'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
  Result := FModoIVACanal;
end;

(*
function TDMSincronizacionTienda.SincronizaClientesDirecciones(Desde, Hasta: TDateTime; IdAddress: integer = 0): integer;
var
  Q : THYFIBQuery;
  i : integer;
  Tercero : integer;
  id_customer : integer;
  id_address : integer;
  address1 : string;
  address2 : string;
  company : string;
  lastname : string;
  firstname : string;
  postcode : string;
  city : string;
  phone : string;
  phone_mobile : string;
  country : string;
  dni_original : string;
  dni : string;
  dir_localidad : string;
  CodigoPostal : string;
  Pais : string;
  date_upd : TDateTime;
  Direccion : integer;
  DM : TDMPrestashop;
  Accion : string;
begin
  Result := -1;
  Accion := '';
  DM := TDMPrestashop.Create(Self);
  try
     DM.SetDSN(QMConfPrestaShopDSN.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     FSendCorreo.Texto(_('Obteniendo Direcciones'));

     // Si pido un cliente especifico lo filtro sin tener en cuenta la fecha
     if (IdAddress <> 0) then
     begin
        Desde := EncodeDate(2000, 01, 01);
        Hasta := Now;
        DM.FiltraDireccionesClientes(IdAddress, IdAddress, Desde, Hasta, (QMConfPrestaShopSOLO_CLIENTE_CON_PEDIDO.AsInteger = 1));
     end
     else
        DM.FiltraDireccionesClientes(1, 999999, Desde, Hasta, (QMConfPrestaShopSOLO_CLIENTE_CON_PEDIDO.AsInteger = 1));

     if (DM.QMySQL.Active) then
     begin
        id_address := 0;
        id_customer := 0;
        address1 := '';
        address2 := '';
        company := '';
        lastname := '';
        firstname := '';
        postcode := '';
        city := '';
        phone := '';
        phone_mobile := '';
        country := '';
        dni := '';
        date_upd := EncodeDate(2000, 1, 1);
        Tercero := 0;
        Direccion := 0;

        if (not DM.QMySQL.EOF) then
           Result := 0;

        try
           while (not DM.QMySQL.EOF) do
           begin
              id_address := DM.QMySQL.FieldByName('id_address').AsInteger;
              id_customer := DM.QMySQL.FieldByName('id_customer').AsInteger;
              address1 := Trim(DM.QMySQL.FieldByName('address1').AsString);
              address2 := Trim(DM.QMySQL.FieldByName('address2').AsString);
              company := Trim(DM.QMySQL.FieldByName('company').AsString);
              lastname := Trim(DM.QMySQL.FieldByName('lastname').AsString);
              firstname := Trim(DM.QMySQL.FieldByName('firstname').AsString);
              postcode := DM.QMySQL.FieldByName('postcode').AsString;
              city := DM.QMySQL.FieldByName('city').AsString;
              phone := DM.QMySQL.FieldByName('phone').AsString;
              phone_mobile := DM.QMySQL.FieldByName('phone_mobile').AsString;
              country := UpperCase(DM.QMySQL.FieldByName('iso_code').AsString);
              dni := Copy(Trim(DM.QMySQL.FieldByName('dni').AsString), 1, 20);
              date_upd := DM.QMySQL.FieldByName('date_upd').AsDateTime;
              Tercero := 0;
              Direccion := 0;

              if ((id_customer > 0) and (date_upd > Desde)) then
              begin
                 FSendCorreo.Texto(Format(_('Cliente: %d - %d' + #13#10 + '%s' + #13#10 + '%s' + #13#10 + '%s - %s - %s' + #13#10 + '%s %s'), [id_customer, id_address, address1, address2, postcode, city, country, phone, phone_mobile]));

                 // Limpio el DNI para evitar posibles duplicados
                 dni_original := dni;
                 dni := '';
                 // Quita espacios en blanco y lo que no sea numero o letra
                 for i := 1 to Length(dni_original) do
                    if (dni_original[i] in ['A'..'Z', 'a'..'z', '0'..'9']) then
                       dni := dni + UpperCase(dni_original[i]);

                 // Busco el tercero al que pertenece la direecion
                 // Obtengo el tercero del cliente con ID_PRESTASHOP = id_customer
                 Accion := 'Busco el tercero al que pertenece la direecion';
                 Tercero := DameTercero('CLI', DameCliente(QMConfPrestaShopEMPRESA.AsInteger, DameIdClientePrestaShop(QMConfPrestaShopID.AsInteger, id_customer)), QMConfPrestaShopEMPRESA.AsInteger);

                 if (Tercero = 0) then
                 begin
                    Accion := 'Sincronizando Cliente';
                    // Esto sincronizará los datos de este cliente. Luego deberé volver a posicionar este dataset
                    SincronizaUnCliente(QMConfPrestaShopID.AsInteger, id_customer);

                    // Reposiciono dataset
                    // Si pido un cliente especifico lo filtro sin tener en cuenta la fecha
                    if (IdAddress <> 0) then
                    begin
                       Desde := EncodeDate(2000, 01, 01);
                       Hasta := Now;
                       DM.FiltraDireccionesClientes(IdAddress, IdAddress, Desde, Hasta, (QMConfPrestaShopSOLO_CLIENTE_CON_PEDIDO.AsInteger = 1));
                    end
                    else
                       DM.FiltraDireccionesClientes(1, 999999, Desde, Hasta, (QMConfPrestaShopSOLO_CLIENTE_CON_PEDIDO.AsInteger = 1));

                    while ((not DM.QMySQL.EOF) and (id_address <> DM.QMySQL.FieldByName('id_address').AsInteger)) do
                       DM.QMySQL.Next;

                    Tercero := DameTercero('CLI', DameCliente(QMConfPrestaShopEMPRESA.AsInteger, DameIdClientePrestaShop(QMConfPrestaShopID.AsInteger, id_customer)), QMConfPrestaShopEMPRESA.AsInteger);
                 end;

                 if (Tercero > 0) then
                 begin
                    Accion := 'Buscando localidad';
                    Log.Add('  * Buscando localidad');
                    // Averiguo DIR_LOCALIDAD en base al codigo postal, la ciudad y el pais
                    // El pais viene en dos digitos
                    Pais := DamePais(country);
                    Log.Add('  * Pais=' + Pais + ' country= ' + country);
                    if (Pais = '') then
                       dir_localidad := '99999999'
                    else
                    begin
                       Accion := 'Buscando localidad - Coincidencia total';
                       // Busco una coincidencia total
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS = :PAIS AND CODIGO_POSTAL = :CODIGO_POSTAL AND TITULO = :TITULO) ORDER BY LOCALIDAD');
                             Params.ByName['PAIS'].AsString := Pais;
                             Params.ByName['CODIGO_POSTAL'].AsString := Copy(postcode, 1, 10);
                             Params.ByName['TITULO'].AsString := Copy(UpperCase(city), 1, 40);
                             ExecQuery;
                             dir_localidad := Trim(FieldByName['LOCALIDAD'].AsString);
                             if (dir_localidad = '') then
                                dir_localidad := '99999999';
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                       Log.Add('  * Buscando localidad - Coincidencia total - dir_localidad=' + dir_localidad);

                       // Si no encuentro, busco coincidencia de pais y codigo postal (total o parcial)
                       CodigoPostal := postcode;
                       CodigoPostal := UpperCase(Trim(CodigoPostal));
                       while ((CodigoPostal > '') and (dir_localidad = '99999999')) do
                       begin
                          Accion := 'Buscando localidad - Coincidencia Parcial - ' + CodigoPostal;
                          if (dir_localidad = '99999999') then
                          begin
                             Q := THYFIBQuery.Create(nil);
                             try
                                with Q do
                                begin
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS = :PAIS AND CODIGO_POSTAL = :CODIGO_POSTAL) ORDER BY LOCALIDAD');
                                   Params.ByName['PAIS'].AsString := Pais;
                                   Params.ByName['CODIGO_POSTAL'].AsString := Copy(postcode, 1, 10);
                                   ExecQuery;
                                   dir_localidad := Trim(FieldByName['LOCALIDAD'].AsString);
                                   if (dir_localidad = '') then
                                      dir_localidad := '99999999';
                                   FreeHandle;
                                end;
                             finally
                                FreeAndNil(Q);
                             end;
                          end;
                          Log.Add('  * Buscando localidad - Coincidencia Parcial - CodigoPostal=' + CodigoPostal + ' dir_localidad=' + dir_localidad);

                          // Quito último digito/letra del codigo postal
                          CodigoPostal := Copy(CodigoPostal, 1, Length(CodigoPostal) - 1);
                       end;

                       // Si no encuentro, busco coincidencia de pais
                       if (dir_localidad = '99999999') then
                       begin
                          Accion := 'Buscando localidad - Coincidencia Pais - ' + Pais;
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS = :PAIS) ORDER BY LOCALIDAD');
                                Params.ByName['PAIS'].AsString := Pais;
                                ExecQuery;
                                dir_localidad := Trim(FieldByName['LOCALIDAD'].AsString);
                                if (dir_localidad = '') then
                                   dir_localidad := '99999999';
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;
                          Log.Add('  * Buscando localidad - Coincidencia Pais - Pais=' + Pais + ' dir_localidad=' + dir_localidad);

                          Log.Add('WARNING sincronizando clientes direcciones');
                          if IdAddress > 0 then
                             Log.Add('(' + IntToStr(IdAddress) + ')');
                          Log.Add('Datos de cliente:');
                          Log.Add('  id_address : ' + IntToStr(id_address));
                          Log.Add('  id_customer : ' + IntToStr(id_customer));
                          Log.Add('  company : ' + company);
                          Log.Add('  lastname : ' + lastname);
                          Log.Add('  firstname : ' + firstname);
                          Log.Add('  address1 : ' + address1);
                          Log.Add('  address2 : ' + address2);
                          Log.Add('  postcode : ' + postcode);
                          Log.Add('  city : ' + city);
                          Log.Add('  country : ' + country);
                          Log.Add('  phone : ' + phone);
                          Log.Add('  phone_mobile : ' + phone_mobile);
                          Log.Add('  date_upd : ' + DateTimeToStr(date_upd));
                          Log.Add('  Tercero : ' + IntToStr(Tercero));
                          Log.Add('  Direccion : ' + IntToStr(Direccion));
                          Log.Add('  Cod. Localidad : ' + dir_localidad);
                          Log.Add('  Pais : ' + Pais);
                          Log.Add('  Accion : ' + Accion);
                          Log.Add('************************************************************');
                          Log.Add('No se encuentra localidad para el codigo postal.');
                          Log.Add('Se utiliza la primera localidad del pais.');
                          Log.Add('Deberá revisar manualmente la direccion del tercero.');
                          Log.Add('************************************************************');
                       end;
                    end;

                    Log.Add('  * Buscando localidad - Resultado - dir_localidad=' + dir_localidad);

                    // Verifico si existe la direccion
                    Accion := 'Verifico si existe la direccion';
                    Direccion := DameDireccionPrestaShop(QMConfPrestaShopID.AsInteger, id_address, Tercero);

                    // Inserto el tercero direccion
                    if (Direccion = 0) then
                    begin
                       // Busco el siguiente numero de direccion
                       Accion := 'Busco el siguiente numero de direccion';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'SELECT MAX(DIRECCION) FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO';
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             ExecQuery;
                             Direccion := FieldByName['MAX'].AsInteger + 1;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Creo la direccion
                       Accion := 'Creo la direccion';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('INSERT INTO SYS_TERCEROS_DIRECCIONES ');
                             SQL.Add('(TERCERO,DIRECCION,DIR_TIPO,DIR_NOMBRE,DIR_NOMBRE_2,DIR_NOMBRE_3, ');
                             SQL.Add('DIR_TELEFONO01,DIR_TELEFONO02,DIR_LOCALIDAD,DIR_CLASE,DIR_DEFECTO,NOTAS) ');
                             SQL.Add('VALUES ');
                             SQL.Add('(:TERCERO,:DIRECCION,:DIR_TIPO,:DIR_NOMBRE,:DIR_NOMBRE_2,:DIR_NOMBRE_3, ');
                             SQL.Add(':DIR_TELEFONO01,:DIR_TELEFONO02,:DIR_LOCALIDAD,:DIR_CLASE,:DIR_DEFECTO,:NOTAS) ');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['DIR_TIPO'].AsString := 'CL';
                             Params.ByName['DIR_NOMBRE'].AsString := Copy(address1, 1, 40);
                             Params.ByName['DIR_NOMBRE_2'].AsString := Copy(address2, 1, 40);
                             Params.ByName['DIR_NOMBRE_3'].AsString := Copy(company, 1, 40);
                             Params.ByName['DIR_TELEFONO01'].AsString := Copy(phone, 1, 15);
                             Params.ByName['DIR_TELEFONO02'].AsString := Copy(phone_mobile, 1, 15);
                             Params.ByName['DIR_LOCALIDAD'].AsString := dir_localidad;
                             Params.ByName['DIR_CLASE'].AsInteger := 1;
                             Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                             Params.ByName['NOTAS'].AsString := address1 + #13#10 + address2 + #13#10 + '(' + postcode + ')' + city + ' - ' + country + #13#10 + phone + ' - ' + phone_mobile + #13#10 + 'id_address ' + IntToStr(id_address) + #13#10 + 'id_customer ' + IntToStr(id_customer) + #13#10 + 'dni ' + dni + #13#10 + 'company ' + company + #13#10 + 'lastname ' + lastname + #13#10 + 'firstname ' + firstname;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Creo un contacto asociado a la dirección con datos de nombre, teléfono, etc. que podría ser usados como destinatario de la factura
                       Accion := 'Creo un contacto asociado a la dirección';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO SYS_TERCEROS_CONTACTOS ');
                             SQL.Add(' (TERCERO, CONTACTO, NOMBRE, APELLIDOS, ');
                             SQL.Add(' MOVIL, TELEFONO, FAX, EXTENSION, CORREO, ');
                             SQL.Add(' NOTAS, DIRECCION, PADRE, DEPARTAMENTO) ');
                             SQL.Add(' VALUES ');
                             SQL.Add(' (:TERCERO, :CONTACTO, :NOMBRE, :APELLIDOS, ');
                             SQL.Add(' :MOVIL, :TELEFONO, :FAX, :EXTENSION, :CORREO, ');
                             SQL.Add(' :NOTAS, :DIRECCION, :PADRE, :DEPARTAMENTO) ');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['CONTACTO'].AsInteger := 0;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['NOMBRE'].AsString := Copy(firstname, 1, 40);
                             Params.ByName['APELLIDOS'].AsString := Copy(lastname, 1, 40);
                             Params.ByName['MOVIL'].AsString := Copy(phone_mobile, 1, 15);
                             Params.ByName['TELEFONO'].AsString := Copy(phone, 1, 15);
                             Params.ByName['FAX'].AsString := '';
                             Params.ByName['EXTENSION'].AsString := '';
                             Params.ByName['CORREO'].AsString := Copy('', 1, 100);
                             Params.ByName['PADRE'].AsInteger := 0;
                             Params.ByName['DEPARTAMENTO'].AsString := '';
                             Params.ByName['NOTAS'].AsString := 'id_address ' + IntToStr(id_address) + #13#10 + #13#10 + 'id_customer ' + IntToStr(id_customer) + #13#10 + phone + ' - ' + phone_mobile + #13#10 + 'dni ' + dni + #13#10 + 'company ' + company + #13#10 + 'lastname ' + lastname + #13#10 + 'firstname ' + firstname;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Asocio direccion con PrestaShop
                       Accion := 'Asocio direccion con PrestaShop';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_CLIENTE_DIR (ID_CONFIGURACION, ID_ADDRESS, TERCERO, DIRECCION, ULT_SINCRONIZACION) ');
                             SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_ADDRESS, :TERCERO, :DIRECCION, :ULT_SINCRONIZACION) ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_ADDRESS'].AsInteger := id_address;
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Quito la direccion defecto anterior
                       Accion := 'Quito la direccion defecto anterior';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('UPDATE SYS_TERCEROS_DIRECCIONES SET DIR_DEFECTO = 0 WHERE TERCERO = :TERCERO AND DIRECCION <> :DIRECCION AND DIR_DEFECTO = 1');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Quito la direccion vacia que se crea con el tercero
                       Accion := 'Quito la direccion vacia que se crea con el tercero';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('DELETE FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO AND DIR_NOMBRE = '''' and DIR_NOMBRE_2 = '''' AND DIR_LOCALIDAD = ''99999999'' ');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       if (id_address > UltimoClienteDireccion) then
                          UltimoClienteDireccion := id_address;
                    end
                    else
                    begin
                       // Si existe modifico la direccion
                       Accion := 'Modifico la direccion';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SYS_TERCEROS_DIRECCIONES ');
                             SQL.Add(' SET DIR_TIPO = :DIR_TIPO ,DIR_NOMBRE = :DIR_NOMBRE, DIR_NOMBRE_2 = :DIR_NOMBRE_2, DIR_NOMBRE_3 = :DIR_NOMBRE_3,');
                             SQL.Add(' DIR_TELEFONO01 = :DIR_TELEFONO01, DIR_TELEFONO02 = :DIR_TELEFONO02, DIR_LOCALIDAD = :DIR_LOCALIDAD, ');
                             SQL.Add(' DIR_CLASE = :DIR_CLASE, NOTAS = :NOTAS ');
                             SQL.Add(' WHERE TERCERO = :TERCERO AND DIRECCION = :DIRECCION ');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['DIR_TIPO'].AsString := 'CL';
                             Params.ByName['DIR_NOMBRE'].AsString := Copy(address1, 1, 40);
                             Params.ByName['DIR_NOMBRE_2'].AsString := Copy(address2, 1, 40);
                             Params.ByName['DIR_NOMBRE_3'].AsString := Copy(company, 1, 40);
                             Params.ByName['DIR_TELEFONO01'].AsString := Copy(phone, 1, 15);
                             Params.ByName['DIR_TELEFONO02'].AsString := Copy(phone_mobile, 1, 15);
                             Params.ByName['DIR_LOCALIDAD'].AsString := dir_localidad;
                             Params.ByName['DIR_CLASE'].AsInteger := 1;
                             // Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                             Params.ByName['NOTAS'].AsString := address1 + #13#10 + address2 + #13#10 + '(' + postcode + ')' + city + ' - ' + country + #13#10 + phone + ' - ' + phone_mobile + #13#10 + 'id_address ' + IntToStr(id_address);
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Asocio direccion con PrestaShop
                       Accion := 'Asocio direccion con PrestaShop';
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('UPDATE SYS_CONF_PRESTASHOP_CLIENTE_DIR SET ULT_SINCRONIZACION = :ULT_SINCRONIZACION WHERE ID_CONFIGURACION =:ID_CONFIGURACION AND ID_ADDRESS = :ID_ADDRESS');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_ADDRESS'].AsInteger := id_address;
                             Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                    end;

                    { TODO : Si todas las direcciones son intracomunitarias, modifico al cliente / proveedor MODO_IVA =3 }
                    // Si todas las direcciones son intracomunitarias, modifico al cliente / proveedor MODO_IVA =3
                    (-
                    Accion := 'Si todas las direcciones son intracomunitarias, modifico al cliente';
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_ADDRESS'].AsInteger := id_address;
                          Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                    -)
                 end {Tercero > 0}
                 else
                 begin
                    Log.Add('ERROR Sincronizando clientes direcciones *******************');
                    if IdAddress > 0 then
                       Log.Add('(' + IntToStr(IdAddress) + ')');
                    Log.Add('Datos de cliente:');
                    Log.Add('  id_address : ' + IntToStr(id_address));
                    Log.Add('  id_customer : ' + IntToStr(id_customer));
                    Log.Add('  company : ' + company);
                    Log.Add('  lastname : ' + lastname);
                    Log.Add('  firstname : ' + firstname);
                    Log.Add('  address1 : ' + address1);
                    Log.Add('  address2 : ' + address2);
                    Log.Add('  postcode : ' + postcode);
                    Log.Add('  city : ' + city);
                    Log.Add('  country : ' + country);
                    Log.Add('  phone : ' + phone);
                    Log.Add('  phone_mobile : ' + phone_mobile);
                    Log.Add('  date_upd : ' + DateTimeToStr(date_upd));
                    Log.Add('  Tercero : ' + IntToStr(Tercero));
                    Log.Add('  Direccion : ' + IntToStr(Direccion));
                    Log.Add('  Pais : ' + Pais);
                    Log.Add('  Cod. Localidad : ' + dir_localidad);
                    Log.Add('  Accion : ' + Accion);
                    Log.Add('No se encuentra el tercero asociado al cliente');
                 end;
              end; {date_upd > UltimaSincronizacion}

              DMMain.Log('Datos de direccion:');
              DMMain.Log('  id_address : ' + IntToStr(id_address));
              DMMain.Log('  id_customer : ' + IntToStr(id_customer));
              DMMain.Log('  company : ' + company);
              DMMain.Log('  lastname : ' + lastname);
              DMMain.Log('  firstname : ' + firstname);
              DMMain.Log('  address1 : ' + address1);
              DMMain.Log('  address2 : ' + address2);
              DMMain.Log('  postcode : ' + postcode);
              DMMain.Log('  city : ' + city);
              DMMain.Log('  country : ' + country);
              DMMain.Log('  phone : ' + phone);
              DMMain.Log('  phone_mobile : ' + phone_mobile);
              DMMain.Log('  date_upd : ' + DateTimeToStr(date_upd));
              DMMain.Log('  Tercero : ' + IntToStr(Tercero));
              DMMain.Log('  Direccion : ' + IntToStr(Direccion));
              DMMain.Log('  Cod. Localidad : ' + dir_localidad);
              DMMain.Log('  Pais : ' + Pais);
              DMMain.Log('  Accion : ' + Accion);
              DMMain.Log('----------');

              DM.QMySQL.Next;
           end; { while }
        except
           on e: Exception do
           begin
              Log.Add('ERROR Sincronizando clientes direcciones *******************');
              Log.Add('Datos de direccion:');
              Log.Add('  id_address : ' + IntToStr(id_address));
              Log.Add('  id_customer : ' + IntToStr(id_customer));
              Log.Add('  company : ' + company);
              Log.Add('  lastname : ' + lastname);
              Log.Add('  firstname : ' + firstname);
              Log.Add('  address1 : ' + address1);
              Log.Add('  address2 : ' + address2);
              Log.Add('  postcode : ' + postcode);
              Log.Add('  city : ' + city);
              Log.Add('  country : ' + country);
              Log.Add('  phone : ' + phone);
              Log.Add('  phone_mobile : ' + phone_mobile);
              Log.Add('  date_upd : ' + DateTimeToStr(date_upd));
              Log.Add('  Tercero : ' + IntToStr(Tercero));
              Log.Add('  Direccion : ' + IntToStr(Direccion));
              Log.Add('  Cod. Localidad : ' + dir_localidad);
              Log.Add('  Pais : ' + Pais);
              Log.Add('  Accion : ' + Accion);
              Log.Add('Excepcion');
              Log.Add(E.Message);

              Result := -1;
           end;
        end;
     end;
  finally
     DM.Free;
  end;
end;
*)

function TDMSincronizacionTienda.SincronizaProveedoresDirecciones(Desde, Hasta: TDateTime): integer;
(*
var
  Q : THYFIBQuery;
  tercero : integer;
  id_supplier : integer;
  id_address : integer;
  address1 : string;
  address2 : string;
  postcode : string;
  city : string;
  phone : string;
  phone_mobile : string;
  country : string;
  dir_localidad : string;
  Pais : string;
  date_upd : TDateTime;
  Direccion : integer;
  DM : TDMPrestashop;
*)
begin
  Result := -1;
  { TODO : Implementar mediante webservice }

  (*
  DM := TDMPrestashop.Create(Self);
  try
     DM.SetDSN(QMConfPrestaShopDSN.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     FSendCorreo.Texto(_('Obteniendo Direcciones'));
     // La direccion 2 es la de nutrienda por eso pido a partir de la 3
     DM.FiltraDireccionesProveedores(1, 999999, Desde, Hasta);
     if (DM.QMySQL.Active) then
     begin
        id_address := 0;
        id_supplier := 0;
        address1 := '';
        address2 := '';
        postcode := '';
        city := '';
        phone := '';
        phone_mobile := '';
        country := '';

        if (not DM.QMySQL.EOF) then
           Result := 0;

        try
           while (not DM.QMySQL.EOF) do
           begin
              id_address := DM.QMySQL.FieldByName('id_address').AsInteger;
              id_supplier := DM.QMySQL.FieldByName('id_supplier').AsInteger;
              address1 := DM.QMySQL.FieldByName('address1').AsString;
              address2 := DM.QMySQL.FieldByName('address2').AsString;
              postcode := DM.QMySQL.FieldByName('postcode').AsString;
              city := DM.QMySQL.FieldByName('city').AsString;
              phone := DM.QMySQL.FieldByName('phone').AsString;
              phone_mobile := DM.QMySQL.FieldByName('phone_mobile').AsString;
              country := UpperCase(DM.QMySQL.FieldByName('iso_code').AsString);
              date_upd := DM.QMySQL.FieldByName('date_upd').AsDateTime;

              if ((id_supplier > 0) and (date_upd > Desde)) then
              begin
                 FSendCorreo.Texto(Format(_('Proveedor: %d - %d' + #13#10 + '%s' + #13#10 + '%s' + #13#10 + '%s - %s - %s' + #13#10 + '%s %s'), [id_supplier, id_address, address1, address2, postcode, city, country, phone, phone_mobile]));

                 // Busco el tercero al que pertenece la direecion
                 // Obtengo el tercero del proveedor con ID_PRESTASHOP = id_supplier
                 Tercero := DameTercero('PRO', DameProveedor(QMConfPrestaShopEMPRESA.AsInteger, DameIdProveedorPrestaShop(QMConfPrestaShopID.AsInteger, id_supplier)), QMConfPrestaShopEMPRESA.AsInteger);
                 if (Tercero > 0) then
                 begin
                    // Averiguo DIR_LOCALIDAD en base al codigo postal, la ciudad y el pais
                    // El pais viene en dos digitos
                    Pais := DamePais(country);
                    if (Pais = '') then
                       dir_localidad := '99999999'
                    else
                    begin
                       // Busco una coincidencia total
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS=:PAIS AND CODIGO_POSTAL=:CODIGO_POSTAL AND TITULO=:TITULO) OR LOCALIDAD=''99999999'' ORDER BY LOCALIDAD');
                             Params.ByName['PAIS'].AsString := Pais;
                             Params.ByName['CODIGO_POSTAL'].AsString := Copy(postcode, 1, 10);
                             Params.ByName['TITULO'].AsString := Copy(UpperCase(city), 1, 40);
                             ExecQuery;
                             dir_localidad := FieldByName['LOCALIDAD'].AsString;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                       // Si no encuentro, busco coincidencia de pais y codigo postal
                       if (dir_localidad = '99999999') then
                       begin
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS=:PAIS AND CODIGO_POSTAL=:CODIGO_POSTAL) OR LOCALIDAD=''99999999'' ORDER BY LOCALIDAD');
                                Params.ByName['PAIS'].AsString := Pais;
                                Params.ByName['CODIGO_POSTAL'].AsString := Copy(postcode, 1, 10);
                                ExecQuery;
                                dir_localidad := FieldByName['LOCALIDAD'].AsString;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;
                       end;
                       // Si no encuentro, busco coincidencia de pais
                       if (dir_localidad = '99999999') then
                       begin
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS=:PAIS) OR LOCALIDAD=''99999999'' ORDER BY LOCALIDAD');
                                Params.ByName['PAIS'].AsString := Pais;
                                ExecQuery;
                                dir_localidad := FieldByName['LOCALIDAD'].AsString;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;
                       end;
                    end;

                    // Verifico si existe la direccion
                    Direccion := DameDireccionPrestaShop(QMConfPrestaShopID.AsInteger, id_address, Tercero);

                    // Inserto el tercero direccion
                    if (Direccion = 0) then
                    begin
                       // Busco el siguiente numero de direccion
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'SELECT MAX(DIRECCION) FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO';
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             ExecQuery;
                             Direccion := FieldByName['MAX'].AsInteger + 1;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('INSERT INTO SYS_TERCEROS_DIRECCIONES ');
                             SQL.Add('(TERCERO,DIRECCION,DIR_TIPO,DIR_NOMBRE,DIR_NOMBRE_2, ');
                             SQL.Add('DIR_TELEFONO01,DIR_TELEFONO02,DIR_LOCALIDAD,DIR_CLASE,DIR_DEFECTO,NOTAS) ');
                             SQL.Add('VALUES ');
                             SQL.Add('(:TERCERO,:DIRECCION,:DIR_TIPO,:DIR_NOMBRE,:DIR_NOMBRE_2, ');
                             SQL.Add(':DIR_TELEFONO01,:DIR_TELEFONO02,:DIR_LOCALIDAD,:DIR_CLASE,:DIR_DEFECTO,:NOTAS) ');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['DIR_TIPO'].AsString := 'CL';
                             Params.ByName['DIR_NOMBRE'].AsString := Copy(address1, 1, 40);
                             Params.ByName['DIR_NOMBRE_2'].AsString := Copy(address2, 1, 40);
                             Params.ByName['DIR_TELEFONO01'].AsString := Copy(phone, 1, 15);
                             Params.ByName['DIR_TELEFONO02'].AsString := Copy(phone_mobile, 1, 15);
                             Params.ByName['DIR_LOCALIDAD'].AsString := dir_localidad;
                             Params.ByName['DIR_CLASE'].AsInteger := 1;
                             Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                             Params.ByName['NOTAS'].AsString := address1 + #13#10 + address2 + #13#10 + '(' + postcode + ')' + city + ' - ' + country + #13#10 + phone + ' - ' + phone_mobile + #13#10 + 'id_address ' + IntToStr(id_address) + #13#10 + 'id_supplier ' + IntToStr(id_supplier);
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Asocio direccion con PrestaShop
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_PROV_DIR (ID_CONFIGURACION, ID_ADDRESS, TERCERO, DIRECCION, ULT_SINCRONIZACION) ');
                             SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_ADDRESS, :TERCERO, :DIRECCION, :ULT_SINCRONIZACION) ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_ADDRESS'].AsInteger := id_address;
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Quito la direccion defecto anterior
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('UPDATE SYS_TERCEROS_DIRECCIONES SET DIR_DEFECTO = 0 WHERE TERCERO = :TERCERO AND DIRECCION <> :DIRECCION');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Quito la direccion vacia que se crea con el tercero
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('DELETE FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO AND DIR_NOMBRE = '''' and DIR_NOMBRE_2 = '''' AND DIR_LOCALIDAD = ''99999999'' ');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       if (id_address > UltimoProveedorDireccion) then
                          UltimoProveedorDireccion := id_address;
                    end
                    else
                    begin
                       // Si existe modifico la direccion
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SYS_TERCEROS_DIRECCIONES ');
                             SQL.Add(' SET DIR_TIPO = :DIR_TIPO ,DIR_NOMBRE = :DIR_NOMBRE, DIR_NOMBRE_2 = :DIR_NOMBRE_2, ');
                             SQL.Add(' DIR_TELEFONO01 = :DIR_TELEFONO01, DIR_TELEFONO02 = :DIR_TELEFONO02, DIR_LOCALIDAD = :DIR_LOCALIDAD, ');
                             SQL.Add(' DIR_CLASE = :DIR_CLASE, DIR_DEFECTO = :DIR_DEFECTO, NOTAS = :NOTAS ');
                             SQL.Add(' WHERE TERCERO = :TERCERO AND DIRECCION = :DIRECCION ');
                             Params.ByName['TERCERO'].AsInteger := Tercero;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['DIR_TIPO'].AsString := 'CL';
                             Params.ByName['DIR_NOMBRE'].AsString := Copy(address1, 1, 40);
                             Params.ByName['DIR_NOMBRE_2'].AsString := Copy(address2, 1, 40);
                             Params.ByName['DIR_TELEFONO01'].AsString := Copy(phone, 1, 15);
                             Params.ByName['DIR_TELEFONO02'].AsString := Copy(phone_mobile, 1, 15);
                             Params.ByName['DIR_LOCALIDAD'].AsString := dir_localidad;
                             Params.ByName['DIR_CLASE'].AsInteger := 1;
                             Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                             Params.ByName['NOTAS'].AsString := address1 + #13#10 + address2 + #13#10 + '(' + postcode + ')' + city + ' - ' + country + #13#10 + phone + ' - ' + phone_mobile + #13#10 + 'id_address ' + IntToStr(id_address);
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Asocio direccion con PrestaShop
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('UPDATE SYS_CONF_PRESTASHOP_PROV_DIR SET ULT_SINCRONIZACION = :ULT_SINCRONIZACION WHERE ID_CONFIGURACION =:ID_CONFIGURACION AND ID_ADDRESS = :ID_ADDRESS');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_ADDRESS'].AsInteger := id_address;
                             Params.ByName['ULT_SINCRONIZACION'].AsDateTime := date_upd;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                    end;
                 end {Tercero > 0}
                 else
                 begin
                    Log.Add('Error sincronizando proveedores direcciones');
                    Log.Add('Datos de proveedor:');
                    Log.Add('  id_address : ' + IntToStr(id_address));
                    Log.Add('  id_supplier : ' + IntToStr(id_supplier));
                    Log.Add('  address1 : ' + address1);
                    Log.Add('  address2 : ' + address2);
                    Log.Add('  postcode : ' + postcode);
                    Log.Add('  city : ' + city);
                    Log.Add('  country : ' + country);
                    Log.Add('  phone : ' + phone);
                    Log.Add('  phone_mobile : ' + phone_mobile);
                    Log.Add('No se encuentra el tercero asociado al proveedor');
                    Log.Add('  Cod. Localidad : ' + dir_localidad);
                 end;
              end; {date_upd > UltimaSincronizacion}

              DMMain.Log('Datos de direccion:');
              DMMain.Log('  id_address : ' + IntToStr(id_address));
              DMMain.Log('  id_supplier : ' + IntToStr(id_supplier));
              DMMain.Log('  address1 : ' + address1);
              DMMain.Log('  address2 : ' + address2);
              DMMain.Log('  postcode : ' + postcode);
              DMMain.Log('  city : ' + city);
              DMMain.Log('  country : ' + country);
              DMMain.Log('  phone : ' + phone);
              DMMain.Log('  phone_mobile : ' + phone_mobile);
              DMMain.Log('  Cod. Localidad : ' + dir_localidad);
              DMMain.Log('----------');

              DM.QMySQL.Next;
           end; { while }
        except
           on e: Exception do
           begin
              Log.Add('ERROR Sincronizando proveedores direcciones ****************');
              Log.Add('Datos de direccion:');
              Log.Add('  id_address : ' + IntToStr(id_address));
              Log.Add('  id_supplier : ' + IntToStr(id_supplier));
              Log.Add('  address1 : ' + address1);
              Log.Add('  address2 : ' + address2);
              Log.Add('  postcode : ' + postcode);
              Log.Add('  city : ' + city);
              Log.Add('  country : ' + country);
              Log.Add('  phone : ' + phone);
              Log.Add('  phone_mobile : ' + phone_mobile);
              Log.Add('  Cod. Localidad : ' + dir_localidad);
              Log.Add('Excepcion');
              Log.Add(E.Message);

              Result := -1;
           end;
        end;
     end;
  finally
     DM.Free;
  end;
  *)
end;

function TDMSincronizacionTienda.SincronizaOrdenesMovimiento(Desde, Hasta: TDateTime): integer;
(*
var
  Q : THYFIBQuery;
  id_order : integer;
  id_order_detail : integer;
  id_order_ant : integer;
  // total_paid_real : double;
  id_customer : integer;
  id_product : integer;
  id_product_attribute : integer;
  id_attribute : string;
  quantity : double;
  price : double;
  VAT : double;
  // order_date : string;
  // Fecha : TDateTime;
  reference : string;
  RIG : integer;
  id_st : integer;
  id_detalles_st : integer;
  id_a : integer;
  Articulo : string;
  Linea : integer;
  HayError : boolean;
  current_state : integer;
  date_add, date_upd : TDateTime;
  DM : TDMPrestashop;
*)
begin
  Result := -1;
  { TODO : Implementar mediante webservice }

  (*
  DM := TDMPrestashop.Create(Self);
  try
     DM.SetDSN(QMConfPrestaShopDSN.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     HayError := False;

     FSendCorreo.Texto(_('Descargando Ordenes'));
     // Tormo todos los articulos
     DM.FiltraOrdenes(1, 999999, Desde, Hasta, False);
     if (DM.QMySQL.Active) then
     begin
        id_order_ant := 0;
        id_st := 0;

        while (not DM.QMySQL.EOF) do
        begin
           id_order := DM.QMySQL.FieldByName('id_order').AsInteger;
           id_order_detail := DM.QMySQL.FieldByName('id_order_detail').AsInteger;
           id_customer := DM.QMySQL.FieldByName('id_customer').AsInteger;
           id_product := DM.QMySQL.FieldByName('id_product').AsInteger;
           id_product_attribute := DM.QMySQL.FieldByName('id_product_attribute').AsInteger;
           id_attribute := DM.QMySQL.FieldByName('id_attribute').AsString;
           quantity := DM.QMySQL.FieldByName('product_quantity').AsFloat;
           price := DM.QMySQL.FieldByName('unit_price_tax_excl').AsFloat;
           VAT := DM.QMySQL.FieldByName('tax_rate').AsFloat;
           // total_paid_real := DM.QMySQL.FieldByName('total_paid_real').AsFloat;
           date_add := DM.QMySQL.FieldByName('date_add').AsDateTime;
           reference := DM.QMySQL.FieldByName('reference').AsString;
           current_state := DM.QMySQL.FieldByName('current_state').AsInteger;
           date_upd := DM.QMySQL.FieldByName('date_upd').AsDateTime;

           if ((date_upd > Desde) and (current_state = QMConfPrestaShopESTADO_PRESTASHOP.AsInteger)) then
           begin
              try
                 FSendCorreo.Texto(Format(_('Orden: %d' + #13#10 + ' Cliente: %d' + #13#10 + 'Producto: %d'), [id_order, id_customer, id_product]));

                 // Busco si ya está entrado
                 if (id_order_ant <> id_order) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' SELECT ID_ST FROM SYS_CONF_PRESTASHOP_MOV ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ID_ORDER = :ID_ORDER ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_ORDER'].AsInteger := id_order;
                          ExecQuery;
                          id_st := FieldByName['ID_ST'].AsInteger;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Si no existe creo cabecera
                 if (id_st = 0) then
                 begin
                    RIG := DMMain.Contador_EES(QMConfPrestaShopSERIE.AsString, 'MAN', QMConfPrestaShopEMPRESA.AsInteger, DameEjercicio(QMConfPrestaShopEMPRESA.AsInteger, date_add));
                    id_st := DMMain.ContadorGen('ID_GES_CABECERAS_ST');

                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' INSERT INTO GES_CABECERAS_ST ');
                          SQL.Add(' (EMPRESA,SERIE,EJERCICIO,RIG,TIPO_OPERACION,FECHA, ');
                          SQL.Add(' ALMACEN_ORI,CANAL_ORI,COMENTARIO,ENTRADA,ORIGEN,TIPO_VALORACION,ID_ST) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:EMPRESA, :SERIE, :EJERCICIO, :RIG, :TIPO_OPERACION, :FECHA, ');
                          SQL.Add(' :ALMACEN_ORI, :CANAL_ORI, :COMENTARIO, :ENTRADA, :ORIGEN, :TIPO_VALORACION, :ID_ST) ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['SERIE'].AsString := QMConfPrestaShopSERIE.AsString;
                          Params.ByName['EJERCICIO'].AsInteger := YearOf(date_add);
                          Params.ByName['RIG'].AsInteger := RIG;
                          Params.ByName['TIPO_OPERACION'].AsString := 'S';
                          Params.ByName['FECHA'].AsDateTime := date_add;
                          Params.ByName['ALMACEN_ORI'].AsString := QMConfPrestaShopALMACEN.AsString;
                          Params.ByName['CANAL_ORI'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                          Params.ByName['COMENTARIO'].AsString := Copy(Format(_('Orden Web: %d'), [reference]), 1, 40);
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          Params.ByName['ORIGEN'].AsString := 'MAN';
                          Params.ByName['TIPO_VALORACION'].AsInteger := 1;
                          Params.ByName['ID_ST'].AsInteger := id_st;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    // Grabo la relacion
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_MOV (ID_CONFIGURACION, ID_ST, ID_ORDER) ');
                          SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_ST, :ID_ORDER) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_ST'].AsInteger := id_st;
                          Params.ByName['ID_ORDER'].AsInteger := id_order;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    id_order_ant := id_order;
                 end;

                 // Busco si ya está entrada la linea
                 if ((id_st > 0) and (id_order_detail > 0)) then
                 begin
                    // Obtengo id del detalle para ver si ya ha sido importado
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' SELECT ID_DETALLES_ST FROM SYS_CONF_PRESTASHOP_MOV_DET ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ID_ORDER_DETAIL = :ID_ORDER_DETAIL ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                          ExecQuery;
                          id_detalles_st := FieldByName['ID_DETALLES_ST'].AsInteger;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    if (id_order_detail > 0) then
                    begin
                       id_a := DameIdArticulo(QMConfPrestaShopID.AsInteger, id_product, id_product_attribute, id_attribute);
                       Articulo := DameArticulo(id_a);

                       if (id_detalles_st = 0) then
                       begin
                          // Obtengo RIG para poder hacer los inserts en el detalle
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Text := 'SELECT RIG FROM GES_CABECERAS_ST WHERE ID_ST = :ID_ST';
                                Params.ByName['ID_ST'].AsInteger := id_st;
                                ExecQuery;
                                RIG := FieldByName['RIG'].AsInteger;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;

                          // Creo linea
                          id_detalles_st := DMMain.ContadorGen('ID_DETALLES_ST');
                          // Busco el siguiente numero de direccion
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_ST WHERE ID_ST = :ID_ST';
                                Params.ByName['ID_ST'].AsInteger := id_st;
                                ExecQuery;
                                Linea := FieldByName['MAX'].AsInteger + 1;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;

                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' INSERT INTO VER_DETALLE_MOVS ');
                                SQL.Add(' (EMPRESA,SERIE,EJERCICIO,RIG,LINEA,ARTICULO,TITULO,UNIDADES,PRECIO,ENTRADA,ID_DETALLES_ST) ');
                                SQL.Add(' VALUES ');
                                SQL.Add(' (:EMPRESA, :SERIE, :EJERCICIO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_DETALLES_ST) ');
                                Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                                Params.ByName['SERIE'].AsString := QMConfPrestaShopSERIE.AsString;
                                Params.ByName['EJERCICIO'].AsInteger := YearOf(date_add);
                                Params.ByName['RIG'].AsInteger := RIG;
                                Params.ByName['LINEA'].AsInteger := Linea;
                                Params.ByName['ARTICULO'].AsString := Articulo;
                                Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, QMConfPrestaShopEMPRESA.AsInteger);
                                Params.ByName['UNIDADES'].AsFloat := quantity;
                                Params.ByName['PRECIO'].AsFloat := price + (price * vat / 100);
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['ID_DETALLES_ST'].AsInteger := id_detalles_st;
                                ExecQuery;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;

                          // Grabo la relacion
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_MOV_DET (ID_CONFIGURACION, ID_DETALLES_ST, ID_ORDER_DETAIL) ');
                                SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_DETALLES_ST, :ID_ORDER_DETAIL) ');
                                Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                                Params.ByName['ID_DETALLES_ST'].AsInteger := id_detalles_st;
                                Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                                ExecQuery;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;
                       end
                       else
                       begin
                          // Modifico linea
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' UPDATE VER_DETALLE_MOVS ');
                                SQL.Add(' SET ARTICULO = :ARTICULO, TITULO = :TITULO, UNIDADES = :UNIDADES, PRECIO = :PRECIO, ENTRADA = :ENTRADA ');
                                SQL.Add(' WHERE ID_DETALLES_ST = :ID_DETALLES_ST ');
                                Params.ByName['ID_DETALLES_ST'].AsInteger := id_detalles_st;
                                Params.ByName['ARTICULO'].AsString := Articulo;
                                Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, QMConfPrestaShopEMPRESA.AsInteger);
                                Params.ByName['UNIDADES'].AsFloat := quantity;
                                Params.ByName['PRECIO'].AsFloat := price + (price * vat / 100);
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                ExecQuery;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;
                       end;
                    end;
                 end;

                 Result := 0;
              except
                 on e: Exception do
                 begin
                    Log.Add('ERROR Sincronizando ordenes (Movimiento) ********************');
                    Log.Add('Datos de orden:');
                    Log.Add('  id_order : ' + IntToStr(id_order));
                    Log.Add('  id_customer : ' + IntToStr(id_customer));
                    Log.Add('  id_product : ' + IntToStr(id_product));
                    Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
                    Log.Add('  id_attribute : ' + id_attribute);
                    Log.Add('  quantity : ' + FormatFloat(',0.00', quantity));
                    Log.Add('  price : ' + FormatFloat(',0.00', price));
                    Log.Add('  VAT : ' + FormatFloat(',0.00', VAT));
                    Log.Add('  date_add : ' + DateTimeToStr(date_add));
                    Log.Add('  date_upd : ' + DateTimeToStr(date_upd));
                    Log.Add('Excepcion');
                    Log.Add(E.Message);

                    HayError := True;
                 end;
              end;

              DMMain.Log('Datos de orden:');
              DMMain.Log('  id_order : ' + IntToStr(id_order));
              DMMain.Log('  id_customer : ' + IntToStr(id_customer));
              DMMain.Log('  id_product : ' + IntToStr(id_product));
              DMMain.Log('  id_product_attribute : ' + IntToStr(id_product_attribute));
              DMMain.Log('  id_attribute : ' + id_attribute);
              DMMain.Log('  quantity : ' + FormatFloat(',0.00', quantity));
              DMMain.Log('  price : ' + FormatFloat(',0.00', price));
              DMMain.Log('  VAT : ' + FormatFloat(',0.00', VAT));
              DMMain.Log('  date_add : ' + DateTimeToStr(date_add));
              DMMain.Log('  date_upd : ' + DateTimeToStr(date_upd));
              DMMain.Log('----------');
           end;

           DM.QMySQL.Next;
        end; { while }
     end;
  finally
     DM.Free;
  end;

  if (HayError) then
     Result := -1;
  *)
end;

function TDMSincronizacionTienda.MySQLDateTimeToDateTime(s: string): TDateTime;
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

{
procedure TDMSincronizacionTienda.SincronizaStock;
var
  DS : TFIBDataSet;
  articulo : string;
  Stock : double;
  ID_A : integer;
begin
  // Recorro los articulos
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
           end;
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ARTICULO, EXISTENCIAS FROM A_ART_STOCK_POR_ALMACEN(:ENTRADA, ');
           SelectSQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :ALMACEN, :ART_INI, :ART_FIN, :FAM_INI, ');
           SelectSQL.Add(' :FAM_FIN, :FECHA, :TIPO_VALOR, :MONEDA, :TARIFA, 0 /*BAJA*/) ');
           SelectSQL.Add(' :TIPO_ARTICULO,  ');
           SelectSQL.Add(' :CODIGO_GENERO_DESDE, :CODIGO_GENERO_HASTA, :CODIGO_TEMPORADA_DESDE, :CODIGO_TEMPORADA_HASTA, ');
           SelectSQL.Add(' :MARCA_DESDE, :MARCA_HASTA) ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ALMACEN'].AsString := QMConfPrestaShopALMACEN.AsString;
           Params.ByName['ART_INI'].AsString := '0';
           Params.ByName['ART_FIN'].AsString := '999999999999999';
           Params.ByName['FAM_INI'].AsString := '.';
           Params.ByName['FAM_FIN'].AsString := '¿?';
           // Las regularizaciones de stock se hacen con hora 23:59:59,
           // por lo que tomo el dia siguiente a las 00:00:00
           Params.ByName['FECHA'].AsDateTime := Today + 1;
           Params.ByName['TIPO_VALOR'].AsInteger := 1;
           Params.ByName['MONEDA'].AsString := REntorno.MonedaEmpresa;
           Params.ByName['TARIFA'].AsString := 'NOR';
           Params.ByName['TIPO_ARTICULO'].AsString := '';
           Params.ByName['CODIGO_GENERO_DESDE'].AsString := '';
           Params.ByName['CODIGO_GENERO_HASTA'].AsString := '';
           Params.ByName['CODIGO_TEMPORADA_DESDE'].AsString := '';
           Params.ByName['CODIGO_TEMPORADA_HASTA'].AsString := '';
           Params.ByName['MARCA_DESDE'].AsString := '';
           Params.ByName['MARCA_HASTA'].AsString := '';
           Params.ByName['CODIGO_ALMACEN'].AsString := CodigoAlmacen;
           Open;

           while not EOF do
           begin
              Articulo := FieldByName('ARTICULO').AsString;
              Stock := FieldByName('EXISTENCIAS').AsFloat;
              ID_A := DameIDArticulo(Articulo);

              FSendCorreo.Texto(Format(_('Articulo: %s, Stock: %8.2f'), [Articulo, Stock]));

              // Si es stock es negativo envio 0
              if (Stock < 0) then
                 Stock := 0;

              // Envio Stock
              DMPrestashop.ModificarStockTiendaAbsoluto(ID_A, Stock);

              Next;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;
}

(*
procedure TDMSincronizacionTienda.CreaStockInicial;
var
  Q : THYFIBQuery;
  Temporal : string;
  sl : TStrings;
  ts : TStrings;
  XML : string;
  XML_Linea : string;
  Token : string;
  Token_Linea : string;
  id_product : string;
  product_name : string;
  id_supplier : integer;
  id_manufacturer : integer;
  quantity : double;
  price : double;
  weight : double;
  Pais : string;
  CtaCompras : string;
  CtaVentas : string;
  CtaDevolucionCompras : string;
  CtaDevolucionVentas : string;
  CtaAbonoCompras : string;
  CtaAbonoVentas : string;
  TmpDecimalSeparator : char;
begin
  /// Este procedimiento no se utiliza.
  /// Genera un SQL que inserta las lineas en VER_DETALLE_MOVS
  /// Deja el SQL en UEntorno.DirectorioBase + StockInicial.txt
  
  ts := TStringList.Create;

  FSendCorreo.Texto(_('Descargando'));
  // Creo archivo temporal
  Temporal := GetTempFile('.tmp');
  // Leo la pagina al archivo temporal
  if (DMMain.Download_HTM(Pagina + 'admin2346/productos_nutrienda.php?Id_desde=1&Id_hasta=999999999', Temporal)) then
  begin
     // Meto el archivo en un string para tratarlo en memoria
     sl := TStringList.Create;
     try
        sl.LoadFromFile(Temporal);
        XML := sl.Text;
        // Quito <br> del texto pues no me interesa
        XML := RemoveTag_br(XML);
        //XML := AnsiReplaceStr(XML, '<br>', '');
     finally
        sl.Free;
     end;

     // Datos por defecto para insertar articulos
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM VER_FAMILIAS_CUENTAS where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?canal)and(familia=?familia))';
           Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FAMILIA'].AsString := REntorno.FamDefecto;
           ExecQuery;
           Pais := FieldByName['PAIS'].AsString;
           //TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
           CtaCompras := FieldByName['CTA_COMPRAS'].AsString;
           CtaVentas := FieldByName['CTA_VENTAS'].AsString;
           CtaDevolucionCompras := FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
           CtaDevolucionVentas := FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
           CtaAbonoCompras := FieldByName['CTA_ABONO_COMPRAS'].AsString;
           CtaAbonoVentas := FieldByName['CTA_ABONO_VENTAS'].AsString;
           //Disponibilidad := FieldByName['VENTA'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     // Recorro cada parte del xml importando
     // <tr> <td>id_product</td> <td>name</td> <td>id_supplier</td> <td>id_manufacturer</td> <td>quantity</td> <td>price</td> <td>weight</td> </tr>
     Token := DameToken(XML);
     while Token = 'tr' do
     begin
        try
           // Guardo el caracter separador de decimales y utilizo el . (punto)
           TmpDecimalSeparator := DecimalSeparator;
           DecimalSeparator := '.';

           XML_Linea := DameDato(XML, Token);
           Token_Linea := DameToken(XML_Linea);
           id_product := DameDato(XML_Linea, Token_Linea);
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           product_name := DameDato(XML_Linea, Token_Linea);
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           id_supplier := StrToIntDef(DameDato(XML_Linea, Token_Linea), 0);
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           id_manufacturer := StrToIntDef(DameDato(XML_Linea, Token_Linea), 0);
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           quantity := StrToFloat(DameDato(XML_Linea, Token_Linea));
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           price := StrToFloat(DameDato(XML_Linea, Token_Linea));
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           weight := StrToFloat(DameDato(XML_Linea, Token_Linea));
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           //TipoIVA := DameTipoIVA(StrToFloat(DameDato(XML_Linea, Token_Linea)));
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           //date_upd := MySQLDateTimeToDateTime(DameDato(XML_Linea, Token_Linea));
           XML_Linea := BorraDato(XML_Linea, Token_Linea);
           // Restauro el caracter separador de decimales

           FSendCorreo.Texto(Format(_('Producto: %s - %s'), [id_product, product_name]));

           ts.Add('INSERT INTO VER_DETALLE_MOVS (EMPRESA,SERIE,EJERCICIO,RIG,LINEA,ARTICULO,TITULO,UNIDADES,PRECIO,ENTRADA) ');
           ts.Add('VALUES (1, ''A'', 2011, 1, 0, ''' + id_product + ''', ''' + product_name + ''', ' + FloatToStr(quantity) + ', ' + FloatToStr(price) + ', 1);');

           DecimalSeparator := TmpDecimalSeparator;
        except
           on e: Exception do
           begin
              Log.Add('Error sincronizando articulos');
              Log.Add('Datos de producto:');
              Log.Add('  id_product : ' + id_product);
              Log.Add('  product_name : ' + product_name);
              Log.Add('  id_supplier : ' + IntToStr(id_supplier));
              Log.Add('  id_manufacturer : ' + IntToStr(id_manufacturer));
              Log.Add('  quantity : ' + FloatToStr(quantity));
              Log.Add('  price : ' + FloatToStr(price));
              Log.Add('  weight : ' + FloatToStr(weight));
              Log.Add('Excepcion');
              Log.Add(E.Message);
           end;
        end;

        // Borro la linea y leo la siguiente
        XML := BorraDato(XML, Token);
        Token := DameToken(XML);
     end; { while }
  end;
  ts.SaveToFile(DirectorioBase + 'StockInicial.txt');
  ts.Free;
  DeleteFile(Temporal);
end;
*)

procedure TDMSincronizacionTienda.QMConfPrestaShopAfterOpen(DataSet: TDataSet);
begin
  DMMain.LogIni('QMConfPrestaShopAfterOpen');
  try
     DMMain.Log('QMConfPrestaShopSinc.Open');
     QMConfPrestaShopSinc.Open;
     DMMain.Log('QMConfPrestaShopCliente.Open');
     QMConfPrestaShopCliente.Open;
     DMMain.Log('QMConfPrestaShopClienteDir.Open');
     QMConfPrestaShopClienteDir.Open;
     DMMain.Log('QMConfPrestaShopArticulo.Open');
     QMConfPrestaShopArticulo.Open;
     DMMain.Log('QMProductosPS.Open');
     QMProductosPS.Open;
     DMMain.Log('QMOrdersPS.Open');
     QMOrdersPS.Open;
     DMMain.Log('QMOrdersStatesPS.Open');
     QMOrdersStatesPS.Open;
     DMMain.Log('xStockAvailable.Open');
     xStockAvailable.Open;
     DMMain.Log('QMPacks.Open');
     QMPacks.Open;
     DMMain.Log('QMCategory.Open');
     QMCategory.Open;
  finally
     DMMain.LogFin('');
  end;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopBeforeClose(DataSet: TDataSet);
begin
  QMConfPrestaShopSinc.Close;
  QMConfPrestaShopCliente.Close;
  QMConfPrestaShopClienteDir.Close;
  QMConfPrestaShopArticulo.Close;
  QMProductosPS.Close;
  QMOrdersPS.Close;
  QMOrdersStatesPS.Close;
  QMPacks.Close;
  QMCategory.Close;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopAfterInsert(DataSet: TDataSet);
begin
  QMConfPrestaShopSinc.Close;
  QMConfPrestaShopSinc.Open;
  QMConfPrestaShopCliente.Close;
  QMConfPrestaShopCliente.Open;
  QMConfPrestaShopClienteDir.Close;
  QMConfPrestaShopClienteDir.Open;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopBeforePost(DataSet: TDataSet);
var
  VersionPrestashop : string;
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_CONF_PRESTASHOP', 'ID');
  if ((QMConfPrestaShopACTIVO.AsInteger = 1) and (QMConfPrestaShopWS_URL.AsString > '') and (QMConfPrestaShopWS_KEY.AsString > '')) then
  begin
     try
        if (DMSincronizacionTienda.InicializaWebService) then
        begin
           VersionPrestashop := DMPrestashop.WS_DameVersion;
           if (Trim(VersionPrestashop) > '') then
              QMConfPrestaShopVERSION_PRESTASHOP.AsString := VersionPrestashop;
        end;
     except
     end;
  end;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopSincBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_CONF_PRESTASHOP', 'ID');
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopSincNewRecord(DataSet: TDataSet);
begin
  QMConfPrestaShopSincID_CONFIGURACION.AsInteger := QMConfPrestaShopID.AsInteger;
end;

function TDMSincronizacionTienda.SincronizaListaPedidos(Desde, Hasta: TDateTime; IdConfiguracion: integer): boolean;
var
  i : integer;
  Opciones : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;

  id : string;
  id_cart : string;
  reference : string;
  current_state : string;
  date_add : string;
  date_upd : string;
  invoice_number : string;
  invoice_date : string;
  delivery_number : string;
  delivery_date : string;
  id_address_delivery : string;
  id_address_invoice : string;
  id_customer : string;
  id_carrier : string;
  module : string;
  shipping_number : string;
  payment : string;
  total_discounts : string;
  total_paid : string;
  total_paid_tax_incl : string;
  total_paid_tax_excl : string;
  total_shipping : string;
  carrier_tax_rate : string;
begin
  DMMain.Log('Sincronizando Lista de Ordenes');

  Log.Add(_('Obteniendo Lista de Ordenes'));
  /// Sincroniza orders con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  Result := False;
  if Assigned(FSendCorreo) then
  begin
     try
        FSendCorreo.Texto(_('Obteniendo Lista de Ordenes'));
     except
     end;
  end;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del pedido Prestashop
     Opciones := '&display=[id,id_cart,reference,current_state,date_add,date_upd,invoice_number,invoice_date,delivery_number,delivery_date,id_address_delivery,id_address_invoice,';
     Opciones := Opciones + 'id_customer,id_carrier,module,shipping_number,payment,total_discounts,total_paid,total_paid_tax_incl,total_paid_tax_excl,total_shipping,carrier_tax_rate]';

     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + '&filter[date_upd]=[' + FormatDateTime('yyyy-mm-dd', Desde) + ',' + FormatDateTime('yyyy-mm-dd', Hasta + 1) + ']&date=1';

     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('orders', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-orders_list.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        if Assigned(FSendCorreo) then
        begin
           try
              FSendCorreo.Texto(_('Obteniendo Lista de Ordenes') + ' (Resp.: ' + IntToStr(CodigoRespuesta) + ')');
           except
           end;
        end;
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['orders']);
           if Assigned(NodoPadre) then
           begin
              Result := True;
              if Assigned(FSendCorreo) then
              begin
                 try
                    FSendCorreo.Texto(format(_('Obteniendo Lista de Ordenes') + ' (/%d)', [NodoPadre.ChildNodes.Count]));
                 except
                 end;
              end;
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 if Assigned(FSendCorreo) then
                 begin
                    try
                       FSendCorreo.Texto(format(_('Obteniendo Lista de Ordenes') + ' (%d/%d)', [i, NodoPadre.ChildNodes.Count]));
                    except
                    end;
                 end;
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := DameDato(Nodo, ['id']);
                 id_cart := DameDato(Nodo, ['id_cart']);
                 reference := DameDato(Nodo, ['reference']);
                 current_state := DameDato(Nodo, ['current_state']);
                 invoice_number := DameDato(Nodo, ['invoice_number']);
                 invoice_date := DameDato(Nodo, ['invoice_date']);
                 delivery_number := DameDato(Nodo, ['delivery_number']);
                 delivery_date := DameDato(Nodo, ['delivery_date']);
                 id_address_delivery := DameDato(Nodo, ['id_address_delivery']);
                 id_address_invoice := DameDato(Nodo, ['id_address_invoice']);
                 id_customer := DameDato(Nodo, ['id_customer']);
                 id_carrier := DameDato(Nodo, ['id_carrier']);
                 module := DameDato(Nodo, ['module']);
                 shipping_number := DameDato(Nodo, ['shipping_number']);
                 payment := DameDato(Nodo, ['payment']);
                 total_discounts := DameDato(Nodo, ['total_discounts']);
                 total_paid := DameDato(Nodo, ['total_paid']);
                 total_paid_tax_incl := DameDato(Nodo, ['total_paid_tax_incl']);
                 total_paid_tax_excl := DameDato(Nodo, ['total_paid_tax_excl']);
                 total_shipping := DameDato(Nodo, ['total_shipping']);
                 carrier_tax_rate := DameDato(Nodo, ['carrier_tax_rate']);
                 date_add := DameDato(Nodo, ['date_upd']);
                 date_upd := DameDato(Nodo, ['date_upd']);

                 if ((date_upd >= FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
                    (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
                 begin
                    Log.Add(Format(_('SINCRONIZANDO Id Order %s - current_state: %s - date_upd: %s (%s - %s)'), [id, current_state, date_upd, FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde), FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta)]));

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_ORDER ( ');
                          SQL.Add(' ID_CONFIGURACION, ID_ORDER, ID_CART, CURRENT_STATE, DATE_ADD, DATE_UPD, INVOICE_NUMBER, INVOICE_DATE, DELIVERY_NUMBER, ');
                          SQL.Add(' DELIVERY_DATE, REFERENCE, ID_ADDRESS_DELIVERY, ID_ADDRESS_INVOICE, ID_CUSTOMER, ID_CARRIER, MODULE, SHIPPING_NUMBER, ');
                          SQL.Add(' PAYMENT, TOTAL_DISCOUNTS, TOTAL_PAID, TOTAL_PAID_TAX_INCL, TOTAL_PAID_TAX_EXCL, TOTAL_SHIPPING, CARRIER_TAX_RATE/*, RAW_XML*/) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :ID_CONFIGURACION, :ID_ORDER, :ID_CART, :CURRENT_STATE, :DATE_ADD, :DATE_UPD, :INVOICE_NUMBER, :INVOICE_DATE, :DELIVERY_NUMBER, ');
                          SQL.Add(' :DELIVERY_DATE, :REFERENCE, :ID_ADDRESS_DELIVERY, :ID_ADDRESS_INVOICE, :ID_CUSTOMER, :ID_CARRIER, :MODULE, ');
                          SQL.Add(' :SHIPPING_NUMBER, :PAYMENT, :TOTAL_DISCOUNTS, :TOTAL_PAID, :TOTAL_PAID_TAX_INCL, :TOTAL_PAID_TAX_EXCL, :TOTAL_SHIPPING, ');
                          SQL.Add(' :CARRIER_TAX_RATE/*, RAW_XML*/) ');
                          SQL.Add(' MATCHING (ID_CONFIGURACION, ID_ORDER) ');

                          Params.ByName['ID_CONFIGURACION'].AsInteger := Idconfiguracion;
                          Params.ByName['ID_ORDER'].AsInteger := StrToIntDef(Id, 0);
                          Params.ByName['ID_CART'].AsInteger := StrToIntDef(id_cart, 0);
                          Params.ByName['CURRENT_STATE'].AsInteger := StrToIntDef(current_state, 0);
                          Params.ByName['INVOICE_NUMBER'].AsInteger := StrToIntDef(invoice_number, 0);
                          Params.ByName['DELIVERY_NUMBER'].AsInteger := StrToIntDef(delivery_number, 0);
                          Params.ByName['REFERENCE'].AsString := reference;
                          Params.ByName['ID_ADDRESS_DELIVERY'].AsInteger := StrToIntDef(id_address_delivery, 0);
                          Params.ByName['ID_ADDRESS_INVOICE'].AsInteger := StrToIntDef(id_address_invoice, 0);
                          Params.ByName['ID_CUSTOMER'].AsInteger := StrToIntDef(id_customer, 0);
                          Params.ByName['ID_CARRIER'].AsInteger := StrToIntDef(id_carrier, 0);
                          Params.ByName['MODULE'].AsString := module;
                          Params.ByName['SHIPPING_NUMBER'].AsString := shipping_number;
                          Params.ByName['PAYMENT'].AsString := Copy(payment, 1, 256);
                          Params.ByName['TOTAL_DISCOUNTS'].AsFloat := StrToFloatDec(total_discounts, '.');
                          Params.ByName['TOTAL_PAID'].AsFloat := StrToFloatDec(total_paid, '.');
                          Params.ByName['TOTAL_PAID_TAX_INCL'].AsFloat := StrToFloatDec(total_paid_tax_incl, '.');
                          Params.ByName['TOTAL_PAID_TAX_EXCL'].AsFloat := StrToFloatDec(total_paid_tax_excl, '.');
                          Params.ByName['TOTAL_SHIPPING'].AsFloat := StrToFloatDec(total_shipping, '.');
                          Params.ByName['CARRIER_TAX_RATE'].AsFloat := StrToFloatDec(carrier_tax_rate, '.');
                          try
                             Params.ByName['DATE_ADD'].AsDateTime := DateISO8601ToDateTime(date_add);
                          except
                             Params.ByName['DATE_ADD'].AsDateTime := EncodeDate(REntorno.Ejercicio, 1, 1);
                          end;
                          try
                             Params.ByName['DATE_UPD'].AsDateTime := DateISO8601ToDateTime(date_upd);
                          except
                             Params.ByName['DATE_UPD'].AsDateTime := EncodeDate(REntorno.Ejercicio, 1, 1);
                          end;
                          try
                             Params.ByName['INVOICE_DATE'].AsDateTime := DateISO8601ToDateTime(invoice_date);
                          except
                             Params.ByName['INVOICE_DATE'].AsDateTime := EncodeDate(REntorno.Ejercicio, 1, 1);
                          end;
                          try
                             Params.ByName['DELIVERY_DATE'].AsDateTime := DateISO8601ToDateTime(delivery_date);
                          except
                             Params.ByName['DELIVERY_DATE'].AsDateTime := EncodeDate(REntorno.Ejercicio, 1, 1);
                          end;
                          // Aparentemente esto hace que la base crezca mucho
                          // Params.ByName['RAW_XML'].AsString := XML.Text;
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
     end
     else
        ShowMessage('(list-orders)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  // Sincronizar los pedidos con DATE_UPD posteriores a la sincronización que tengan estado para sincronizar.
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT O.ID_ORDER, O.DATE_UPD, O.CURRENT_STATE ');
           SelectSQL.Add(' FROM SYS_CONF_PRESTASHOP_ORDER O ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP_O_STATE S ON O.ID_CONFIGURACION = S.ID_CONFIGURACION AND O.CURRENT_STATE = S.ID ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' O.ID_CONFIGURACION = :ID_CONFIGURACION AND ');
           SelectSQL.Add(' S.SINCRONIZAR_PEC = 1 AND ');
           SelectSQL.Add(' O.DATE_UPD >= :DESDE_FECHA ');
           SelectSQL.Add(' ORDER BY O.DATE_UPD, O.ID_ORDER ');
           Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
           Params.ByName['DESDE_FECHA'].AsDateTime := Desde;
           Open;
           First;
           while not EOF do
           begin
              i := FieldByName('ID_ORDER').AsInteger;
              if Assigned(FSendCorreo) then
              begin
                 try
                    FSendCorreo.Texto(format(_('Sincronizando Ordenes - ID_ORDER: %d'), [i]));
                 except
                 end;
              end;

              if (SincronizaUnaOrdenPedidos(QMConfPrestaShopID.AsInteger, QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, QMConfPrestaShopSERIE.AsString, QMConfPrestaShopALMACEN.AsString, i) = 0) then
                 Result := False;

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
end;

function TDMSincronizacionTienda.SincronizaListaDetallePedidos(IdConfiguracion, DesdeRegistro: integer): integer;
var
  i : integer;
  Opciones : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  //HayError : boolean;
  id : integer;
begin
  Result := DesdeRegistro;
  //HayError := False;
  FSendCorreo.Texto(_('Obteniendo Detalles de Pedido a sincrinizar stock.'));
  DMMain.LogIni(_('Sincronizando Detalles de Pedido'));
  Log.Add(_('Sincronizando Detalles de Pedido'));

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del pedido Prestashop
     Opciones := '&display=[id]';

     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + format('&filter[id]=[%d,%d]', [DesdeRegistro, DesdeRegistro + 1000]);

     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('order_details', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-order_details_list.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        if Assigned(FSendCorreo) then
        begin
           try
              FSendCorreo.Texto(_('Obteniendo Lista de Detalle de Ordenes') + ' (Resp.: ' + IntToStr(CodigoRespuesta) + ')');
           except
           end;
        end;

        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['order_details']);
           if Assigned(NodoPadre) then
           begin
              if Assigned(FSendCorreo) then
              begin
                 try
                    FSendCorreo.Texto(format(_('Obteniendo Lista de Detalle de Ordenes') + ' (/%d)', [NodoPadre.ChildNodes.Count]));
                 except
                 end;
              end;
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 if Assigned(FSendCorreo) then
                 begin
                    try
                       FSendCorreo.Texto(format(_('Obteniendo Lista de Detalle de Ordenes') + ' (%d/%d)', [i, NodoPadre.ChildNodes.Count]));
                    except
                    end;
                 end;
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToIntDef(DameDato(Nodo, ['id']), 0);

                 if (id > DesdeRegistro) then
                 begin
                    Log.Add(Format(_('SINCRONIZANDO Id Order Details %d'), [id]));

                    SincronizaDetallePedido(IdConfiguracion, id);

                    if (id > Result) then
                       Result := id;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(list-order_detailss)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTienda.SincronizaListaEstadoPedidos(IdConfiguracion, DesdeRegistro: integer): integer;
var
  i : integer;
  Opciones : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  //HayError : boolean;
  id, id_employee, id_order_state, id_order : integer;
  date_add : TDateTime;

  EjercicioDestino : integer;
  DS : TFIBDataSet;
begin
  Result := DesdeRegistro;
  //HayError := False;
  FSendCorreo.Texto(_('Obteniendo Lista de Cambios de Estados'));
  DMMain.LogIni(_('Sincronizando Lista de Cambios de Estados'));
  Log.Add(_('Sincronizando Lista de Cambios de Estados'));

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Quiero todos los datos que tenga
     Opciones := '&display=full';

     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + format('&filter[id]=[%d,%d]', [DesdeRegistro, DesdeRegistro + 10000]);

     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('order_histories', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-order_histories.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        if Assigned(FSendCorreo) then
        begin
           try
              FSendCorreo.Texto(_('Procesando Cambios de Estado de Ordenes') + ' (Resp.: ' + IntToStr(CodigoRespuesta) + ')');
           except
           end;
        end;

        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['order_histories']);
           if Assigned(NodoPadre) then
           begin
              if Assigned(FSendCorreo) then
              begin
                 try
                    FSendCorreo.Texto(format(_('Procesando Cambios de Estado de Ordenes') + ' (/%d)', [NodoPadre.ChildNodes.Count]));
                 except
                 end;
              end;

              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 if Assigned(FSendCorreo) then
                 begin
                    try
                       FSendCorreo.Texto(format(_('Procesando Cambios de Estado de Ordenes') + ' (%d/%d)', [i, NodoPadre.ChildNodes.Count]));
                    except
                    end;
                 end;
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToIntDef(DameDato(Nodo, ['id']), 0);
                 id_employee := StrToIntDef(DameDato(Nodo, ['id_employee']), 0);
                 id_order_state := StrToIntDef(DameDato(Nodo, ['id_order_state']), 0);
                 id_order := StrToIntDef(DameDato(Nodo, ['id_order']), 0);
                 date_add := DateISO8601ToDateTime(DameDato(Nodo, ['date_add']));

                 if (id > DesdeRegistro) then
                 begin
                    DMMain.Log('   ' + format('Sincronizando Lista de Cambios de Estados - id_order: %d - id_order_state: %d', [id_order, id_order_state]));
                    if Assigned(FSendCorreo) then
                    begin
                       try
                          FSendCorreo.Texto(format('Sincronizando Lista de Cambios de Estados - id_order: %d - id_order_state: %d', [id_order, id_order_state]));
                       except
                       end;
                    end;
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_STATE_H ( ');
                          SQL.Add(' ID_CONFIGURACION, ID, ID_EMPLOYEE, ID_ORDER_STATE, ID_ORDER, DATE_ADD) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :ID_CONFIGURACION, :ID, :ID_EMPLOYEE, :ID_ORDER_STATE, :ID_ORDER, :DATE_ADD) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                          Params.ByName['ID'].AsInteger := id;
                          Params.ByName['ID_EMPLOYEE'].AsInteger := id_employee;
                          Params.ByName['ID_ORDER_STATE'].AsInteger := id_order_state;
                          Params.ByName['ID_ORDER'].AsInteger := id_order;
                          Params.ByName['DATE_ADD'].AsDateTime := date_add;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    if (id > Result) then
                       Result := id;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(order_histories)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  DMMain.Log(_('Facturando Albaranes de Ordenes'));
  if Assigned(FSendCorreo) then
  begin
     try
        FSendCorreo.Texto(_('Facturando Albaranes de Ordenes'));
     except
     end;
  end;

  DS := TFIBDataSet.Create(nil);
  with DS do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           // Agrego DISTINCT porque puede ser que el cambio de estado esté multibles veces
           SelectSQL.Add(' SELECT DISTINCT CA.EMPRESA, CA.EJERCICIO, CA.CANAL, CA.SERIE, CA.RIG, CA.ID_S, CA.TRANSPORTISTA, O.INVOICE_NUMBER, O.INVOICE_DATE /*, CA.TIPO, CA.ESTADO*/ ');
           SelectSQL.Add(' FROM SYS_CONF_PRESTASHOP_STATE_H H ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP_O_STATE S ON H.ID_CONFIGURACION = S.ID_CONFIGURACION AND H.ID_ORDER_STATE = S.ID ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP_ORDER O ON H.ID_CONFIGURACION = O.ID_CONFIGURACION AND H.ID_ORDER = O.ID_ORDER ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP_PEC P ON O.ID_CONFIGURACION = P.ID_CONFIGURACION AND O.ID_ORDER = P.ID_ORDER ');
           SelectSQL.Add(' LEFT JOIN GES_CABECERAS_RELACIONES RA ON P.ID_S = RA.O_ID_S AND RA.O_TIPO = ''PEC'' AND RA.D_TIPO = ''ALB'' ');
           SelectSQL.Add(' JOIN GES_CABECERAS_S CA ON CA.ID_S = RA.D_ID_S ');
           SelectSQL.Add(' LEFT JOIN GES_CABECERAS_RELACIONES RF ON RA.D_ID_S = RF.O_ID_S AND RA.D_TIPO = RF.O_TIPO AND RF.D_TIPO = ''FAC'' ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' H.ID_CONFIGURACION = :ID_CONFIGURACION AND ');
           SelectSQL.Add(' H.ID > :DESDE_ID AND ');
           SelectSQL.Add(' O.INVOICE_NUMBER <> 0 AND ');
           SelectSQL.Add(' S.TRASPASAR_FAC = 1 AND ');
           SelectSQL.Add(' COALESCE(RA.D_ID_S, 0) <> 0 AND ');
           SelectSQL.Add(' COALESCE(RF.D_ID_S, 0) = 0 ');
           SelectSQL.Add(' ORDER BY H.ID DESC ');
           Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
           Params.ByName['DESDE_ID'].AsInteger := DesdeRegistro;
           Open;
           while not EOF do
           begin
              EjercicioDestino := DameEjercicio(REntorno.Empresa, DS.FieldByName('INVOICE_DATE').AsDateTime);
              Log.Add('   ' + format('ALB %s/%d --> Invoice: %d (%s)', [DS.FieldByName('SERIE').AsString, DS.FieldByName('RIG').AsInteger, DS.FieldByName('INVOICE_NUMBER').AsInteger, FormatDateTime('dd/mm/yyyy', DS.FieldByName('INVOICE_DATE').AsDateTime)]));
              DMMain.Log('   ' + format('ALB %s/%d --> Invoice: %d (%s)', [DS.FieldByName('SERIE').AsString, DS.FieldByName('RIG').AsInteger, DS.FieldByName('INVOICE_NUMBER').AsInteger, FormatDateTime('dd/mm/yyyy', DS.FieldByName('INVOICE_DATE').AsDateTime)]));
              if Assigned(FSendCorreo) then
              begin
                 try
                    FSendCorreo.Texto(format('ALB %s/%d --> Invoice: %d (%s)', [DS.FieldByName('SERIE').AsString, DS.FieldByName('RIG').AsInteger, DS.FieldByName('INVOICE_NUMBER').AsInteger, FormatDateTime('dd/mm/yyyy', DS.FieldByName('INVOICE_DATE').AsDateTime)]));
                 except
                 end;
              end;

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_ALBARAN_A_OTRO_MUL ');
                    SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ');
                    SQL.Add(' ?D_TIPO, ?ENTRADA, ?FECHA, ?TRANSPORTISTA, ');
                    SQL.Add(' ?D_EJERCICIO, ?D_CANAL, ?D_SERIE, ?ID_S, 0, 0, 0, 1, 0) ');
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := 'ALB';
                    Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                    Params.ByName['D_TIPO'].AsString := 'FAC';
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['FECHA'].AsDateTime := DS.FieldByName('INVOICE_DATE').AsDateTime;
                    Params.ByName['TRANSPORTISTA'].AsInteger := DS.FieldByName('TRANSPORTISTA').AsInteger;
                    Params.ByName['D_EJERCICIO'].AsInteger := EjercicioDestino;
                    Params.ByName['D_CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['D_SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
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

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTienda.SincronizaOrdenesPedidos(Desde, Hasta: TDateTime; IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; IdEstado: integer): boolean;
var
  reference : string;
  current_state : integer;

  Opciones : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;

  i : integer;
  id : integer;
  //FechaModificacion : TDateTime;
  date_add, date_upd, invoice_date : TDateTime;
begin
  Log.Add(_('Obteniendo Ordenes'));
  /// Sincroniza orders con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  Result := False;
  FSendCorreo.Texto(_('Obteniendo Ordenes'));

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id, referencia y estado de las ordenes filtradas por estado.
     Opciones := '&display=[id,reference,current_state,date_add,date_upd,invoice_date]';

     // Aparentemente esta version de Prestashop no tiene el campo current_state filtrable.
     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + format('&filter[current_state]=[%d]', [IdEstado]);

     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + '&filter[date_upd]=[' + FormatDateTime('yyyy-mm-dd', Desde) + ',' + FormatDateTime('yyyy-mm-dd', Hasta + 1) + ']&date=1';

     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('orders', 0, Opciones, Respuesta);
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
                 try
                    date_add := DateISO8601ToDateTime(DameDato(Nodo, ['date_add']));
                 except
                    date_add := EncodeDate(2000, 1, 1);
                 end;
                 try
                    date_upd := DateISO8601ToDateTime(DameDato(Nodo, ['date_upd']));
                 except
                    date_upd := EncodeDate(2000, 1, 1);
                 end;
                 try
                    invoice_date := DateISO8601ToDateTime(DameDato(Nodo, ['invoice_date']));
                 except
                    invoice_date := EncodeDate(REntorno.Ejercicio, 1, 1);
                 end;

                 Log.Add(Format(_('Id Order %d - current_state: %d - date_upd: %s'), [id, current_state, FormatDateTime('yyyy-mm-dd hh:nn:ss', date_upd)]));
                 // Sincronizo todas las ordenes que tengan estado deseado
                 if (current_state = IdEstado) then
                 begin
                    if ((date_upd >= Desde) and (date_upd < Hasta)) then
                    begin
                       if (DameEjercicio(QMConfPrestaShopEMPRESA.AsInteger, date_add) >= REntorno.Ejercicio) then
                       begin
                          Log.Add(Format(_('SINCRONIZANDO Id Order %d - current_state: %d - date_upd: %s (%s - %s), invoice_date: %s'), [id, current_state, FormatDateTime('yyyy-mm-dd hh:nn:ss', date_upd), FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde), FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta), FormatDateTime('yyyy-mm-dd hh:nn:ss', invoice_date)]));
                          // Sincronizo. Espero numero de id_s.
                          if (SincronizaUnaOrdenPedidos(IdConfiguracion, Empresa, Canal, Serie, Almacen, id) = 0) then
                             Result := False;
                       end;
                    end;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(orders)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaUnaOrdenPedidos(IdConfiguracion, Empresa, Canal: integer; Serie, Almacen: string; id_order: integer): integer;
var
  i, j, l, RepetirLinea : integer;
  id : integer;
  DS : TFIBDataSet;

  attr : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoDetalle : IXMLNode;
  Nodo : IXMLNode;

  reference : string;
  current_state : integer;
  date_add, date_upd : string;
  id_cart : integer;
  id_megacart : integer;
  id_customer : integer;
  id_address_invoice : integer;
  id_address_delivery : integer;
  id_s : integer;
  total_shipping_tax_excl : double;
  total_shipping_tax_incl : double;
  total_discounts : double;
  total_discounts_tax_incl : double;
  total_discounts_tax_excl : double;
  paypal_id_transaction : string;
  paypal_total_paid : double;
  total_paid : double;
  paypal_shipping : double;
  paypal_currency : string;
  payment : string;

  total_paid_real : double;

  IdCliente : integer;
  Cliente : integer;
  Tercero : integer;
  Direccion : integer;
  DireccionEntrega : integer;
  Fecha : TDateTime;
  Contacto : integer;
  Estado : integer;
  RIG : integer;
  Tarifa : string;
  TarifaIvaIncluido : boolean;

  Transportista : integer;
  Ejercicio : integer;
  CuotaPaypal : double;

  id_order_detail : integer;

  id_product : integer;
  id_product_attribute : integer;
  id_attribute : string;

  id_detalles_s : integer;
  id_a : integer;
  Articulo : string;
  IdPromocion : integer;
  TipoIVA : integer;

  PorcentajeIVA : double;
  Precio : double;

  product_quantity : double;
  product_price : double;
  product_name : string;
  product_reference : string;
  product_ean13 : string;
  product_isbn : string;
  product_upc : string;
  unit_price_tax_incl : double;
  unit_price_tax_excl : double;
  C : TCliente;
  EjercicioCliente : integer;

  invoice_number : string;
  invoice_date : TDateTime;
  delivery_number : string;
  delivery_date : TDateTime;

  Liquido, TotalPaid : double;
  ModoIVA : integer;
begin
  /// Sincroniza orders con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve ID_S
  id_s := 0;
  Log.Add(Format(_('Sincronizando orden (Id Order) %d'), [id_order]));
  //Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los fabricantes activos
     CodigoRespuesta := DMPrestashop.WS_Get('orders', id_order, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+format('Respuesta-order_%d.xml', [id_order]));
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['order']);
           if Assigned(NodoPadre) then
           begin
              // id := StrToInt(DameDato(Nodo, ['id']));
              reference := DameDato(NodoPadre, ['reference']);
              current_state := StrToInt(DameDato(NodoPadre, ['current_state']));
              id_customer := StrToInt(DameDato(NodoPadre, ['id_customer']));
              id_cart := StrToInt(DameDato(NodoPadre, ['id_cart']));
              date_add := DameDato(NodoPadre, ['date_add']);
              date_upd := DameDato(NodoPadre, ['date_upd']);
              id_address_invoice := StrToInt(DameDato(NodoPadre, ['id_address_invoice']));
              id_address_delivery := StrToInt(DameDato(NodoPadre, ['id_address_delivery']));
              total_shipping_tax_excl := StrToFloatDec(DameDato(NodoPadre, ['total_shipping_tax_excl']), '.');
              total_shipping_tax_incl := StrToFloatDec(DameDato(NodoPadre, ['total_shipping_tax_incl']), '.');
              total_discounts := StrToFloatDec(DameDato(NodoPadre, ['total_discounts']), '.');
              total_discounts_tax_incl := StrToFloatDec(DameDato(NodoPadre, ['total_discounts_tax_incl']), '.');
              total_discounts_tax_excl := StrToFloatDec(DameDato(NodoPadre, ['total_discounts_tax_excl']), '.');
              total_paid := StrToFloatDec(DameDato(NodoPadre, ['total_paid']), '.');
              total_paid_real := StrToFloatDec(DameDato(NodoPadre, ['total_paid_real']), '.');

              payment := DameDato(NodoPadre, ['payment']);

              paypal_id_transaction := DameDato(NodoPadre, ['paypal_id_transaction']);
              // Agrego un 0 a la izquierda por si viene vacio (cuando no existe el campo).
              paypal_total_paid := StrToFloatDec('0' + DameDato(NodoPadre, ['paypal_total_paid']), '.');
              paypal_shipping := StrToFloatDec('0' + DameDato(NodoPadre, ['paypal_shipping']), '.');
              paypal_currency := DameDato(NodoPadre, ['paypal_currency']);

              if Assigned(FSendCorreo) then
              begin
                 try
                    FSendCorreo.Texto(Format(_('Id Order: %d - %s' + #13#10 + ' Id Customer: %d' + #13#10 + 'DateUpd: %s'), [id_order, reference, id_customer, date_add]));
                 except
                 end;
              end;
              Log[Log.Count - 1] := Format(_('Sincronizando orden (Id Order) %d - %s -  Id Customer: %d - DateUpd: %s'), [id_order, reference, id_customer, date_add]);
              Fecha := DateISO8601ToDateTime(date_add);
              Ejercicio := DameEjercicio(QMConfPrestaShopEMPRESA.AsInteger, Fecha);

              invoice_number := DameDato(NodoPadre, ['invoice_number']);
              try
                 invoice_date := DateISO8601ToDateTime(DameDato(NodoPadre, ['invoice_date']));
              except
                 invoice_date := EncodeDate(REntorno.Ejercicio, 1, 1);
              end;
              delivery_number := DameDato(NodoPadre, ['delivery_number']);
              try
                 delivery_date := DateISO8601ToDateTime(DameDato(NodoPadre, ['delivery_date']));
              except
                 delivery_date := EncodeDate(REntorno.Ejercicio, 1, 1);
              end;

              // Veo si la orden ya esta sincronizada con un pedido
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' SELECT ID_S FROM SYS_CONF_PRESTASHOP_PEC ');
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

              IdCliente := DameIdClientePrestaShop(IdConfiguracion, id_customer);
              if (IdCliente = 0) then
                 Cliente := SincronizaUnCliente(IdConfiguracion, id_customer)
              else
                 Cliente := DMMain.DameCliente(Empresa, IdCliente);

              if (Cliente = 0) then
                 Log.Add(format('Error obteniendo cliente (id_customer=%d)', [id_customer]))
              else
              begin
                 // Veo si el cliente existe en este ejercicio
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT EJERCICIO FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND CLIENTE = ?CLIENTE';
                       Params.ByName['EMPRESA'].AsInteger := Empresa;
                       Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                       Params.ByName['CANAL'].AsInteger := Canal;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       ExecQuery;
                       EjercicioCliente := FieldByName['EJERCICIO'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (EjercicioCliente = 0) then
                 begin
                    InicializaCliente(C);

                    C.Empresa := Empresa;
                    C.Ejercicio := Ejercicio;
                    C.Canal := Canal;
                    C.Cliente := Cliente;

                    CreaCliente(C);
                 end;
              end;

              if (Cliente <> 0) then
              begin
                 Tercero := DameTercero('CLI', Cliente, Empresa);
                 if (Tercero = 0) then
                    Log.Add(format('Error obteniendo Tercero (Cliente=%d)', [Cliente]));

                 Direccion := DameDireccionPrestaShop(IdConfiguracion, id_address_invoice, Tercero);
                 if (Direccion = 0) then
                 begin
                    Tercero := SincronizaUnaDireccion(IdConfiguracion, id_address_invoice, Tercero);
                    Direccion := DameDireccionPrestaShop(IdConfiguracion, id_address_invoice, Tercero);
                    if (Direccion = 0) then
                       Log.Add(format('Error obteniendo Direccion (id_customer=%d, id_address_invoice=%d)', [id_customer, id_address_invoice]));
                 end;

                 DireccionEntrega := DameDireccionPrestaShop(IdConfiguracion, id_address_delivery, Tercero);
                 if (DireccionEntrega = 0) then
                 begin
                    Tercero := SincronizaUnaDireccion(IdConfiguracion, id_address_delivery, Tercero);
                    DireccionEntrega := DameDireccionPrestaShop(IdConfiguracion, id_address_delivery, Tercero);
                    if (DireccionEntrega = 0) then
                       Log.Add(format('Error obteniendo Direccion Entrega (id_customer=%d, id_address_delivery=%d)', [id_customer, id_address_delivery]));
                 end;

                 if (Cliente <> 0) and (Direccion <> 0) and (DireccionEntrega <> 0) then
                 begin
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

                    // Si no existe creo cabecera
                    if (id_s = 0) then
                    begin
                       // Obtengo Modo de IVA para el pedido según la direccion de facturación.
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Clear;
                             SQL.Add(' SELECT C.CLIENTE, CC.MODO_IVA, LF.PROVINCIA, LF.PAIS, PF.PERTENECE_CEE, LE.PAIS PAIS_ENTREGA, DE.DIR_TRANSPORTISTA ');
                             SQL.Add(' FROM CON_CUENTAS_GES_CLI CC ');
                             SQL.Add(' JOIN EMP_CLIENTES C ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
                             SQL.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES DF ON C.TERCERO = DF.TERCERO AND DF.DIRECCION = :DIRECCION ');
                             SQL.Add(' LEFT JOIN SYS_LOCALIDADES LF ON DF.ID_LOCAL = LF.ID_LOCAL ');
                             SQL.Add(' LEFT JOIN SYS_PAISES PF ON LF.PAIS = PF.PAIS ');
                             SQL.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES DE ON C.TERCERO = DE.TERCERO AND DE.DIRECCION = :DIRECCION_ENTREGA ');
                             SQL.Add(' LEFT JOIN SYS_LOCALIDADES LE ON DE.ID_LOCAL = LE.ID_LOCAL ');
                             SQL.Add(' LEFT JOIN SYS_PAISES PE ON LE.PAIS = PE.PAIS ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' CC.EMPRESA = :EMPRESA AND ');
                             SQL.Add(' CC.EJERCICIO = :EJERCICIO AND ');
                             SQL.Add(' CC.CANAL = :CANAL AND ');
                             SQL.Add(' CC.CLIENTE = :CLIENTE ');
                             Params.ByName['EMPRESA'].AsInteger := Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                             Params.ByName['CANAL'].AsInteger := Canal;
                             Params.ByName['CLIENTE'].AsInteger := Cliente;
                             Params.ByName['DIRECCION'].AsInteger := Direccion;
                             Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                             ExecQuery;

                             // Trasportista.
                             // Por defecto el del cliente
                             // Si la direccion tiene uno asignado el de la direccion
                             // Finalmente miro si debo forzar el transportista segun parametros
                             if (FieldByName['DIR_TRANSPORTISTA'].AsInteger <> 0) then
                                Transportista := FieldByName['DIR_TRANSPORTISTA'].AsInteger;
                             if (param_PSHTNAC001 <> 0) and (FieldByName['PAIS'].AsString = 'ESP') then
                                Transportista := param_PSHTNAC001;
                             if (param_PSHTINT001 <> 0) and (FieldByName['PAIS'].AsString <> 'ESP') then
                                Transportista := param_PSHTINT001;

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
                             Log.Add(format('Modo IVA segun direccion (Cliente=%d, Direccion=%d, PAIS,%s, PROVINCIA=%s, ModoIVA=%d)', [Cliente, Direccion, FieldByName['PAIS'].AsString, FieldByName['PROVINCIA'].AsString, ModoIVA]));
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       id_s := DMMain.ContadorGen('ID_GES_CABECERAS_S');

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
                             Params.ByName['CLIENTE'].AsInteger := Cliente;
                             Params.ByName['DIRECCION'].AsInteger := DireccionEntrega;
                             Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                             Params.ByName['SU_REFERENCIA'].AsString := Copy(reference, 1, 40);
                             Params.ByName['Z_OBSERVACION'].AsString := Copy(Format(_('Fac. Web: %s (%s)'), [invoice_number, DateToStr(invoice_date)]), 1, 256);
                             Params.ByName['ID_S'].AsInteger := id_s;
                             Params.ByName['TARIFA'].AsString := Tarifa;
                             Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                             Params.ByName['CONTACTO'].AsInteger := Contacto;
                             Params.ByName['MODO_IVA'].AsInteger := ModoIVA;
                             Params.ByName['ORIGEN_DOCUMENTO'].AsString := 'PSH';
                             TarifaIvaIncluido := (TarifaEsIvaIncluido(Tarifa, Empresa));
                             if (total_shipping_tax_excl > 0) then
                             begin
                                Params.ByName['TIPO_PORTES'].AsInteger := 4;
                                if TarifaIvaIncluido then
                                   Params.ByName['I_PORTES'].AsFloat := total_shipping_tax_incl
                                else
                                   Params.ByName['I_PORTES'].AsFloat := total_shipping_tax_excl;
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

                       // Grabo la relacion
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Clear;
                             SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_PEC ( ');
                             SQL.Add(' ID_CONFIGURACION, ID_S, ID_ORDER, INVOICE_NUMBER, INVOICE_DATE, DELIVERY_NUMBER, DELIVERY_DATE, REFERENCE, DATE_ADD) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :ID_CONFIGURACION, :ID_S, :ID_ORDER, :INVOICE_NUMBER, :INVOICE_DATE, :DELIVERY_NUMBER, :DELIVERY_DATE, :REFERENCE, :DATE_ADD) ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                             Params.ByName['ID_S'].AsInteger := id_s;
                             Params.ByName['ID_ORDER'].AsInteger := id_order;
                             Params.ByName['INVOICE_NUMBER'].AsInteger := StrToIntDef(invoice_number, 0);
                             Params.ByName['INVOICE_DATE'].AsDateTime := invoice_date;
                             Params.ByName['DELIVERY_NUMBER'].AsInteger := StrToIntDef(delivery_number, 0);
                             Params.ByName['DELIVERY_DATE'].AsDateTime := delivery_date;
                             Params.ByName['REFERENCE'].AsString := Copy(reference, 1, 40);
                             Params.ByName['DATE_ADD'].AsDateTime := Fecha;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;

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

                    if (Estado = 0) then
                    begin
                       Log.Add('   ' + Format(_('Sincronizando con pedido %s/%d - Cliente: %d'), [Serie, RIG, Cliente]));
                       if (invoice_number > '') then
                          Log.Add('   ' + Format(_('Factura Web: %s (%s)'), [invoice_number, DateToStr(invoice_date)]));

                       TarifaIvaIncluido := (TarifaEsIvaIncluido(Tarifa, Empresa));

                       // Agrego los descuentos si los tiene (CUPONES, por ejemplo)
                       if ((id_s > 0) and (total_discounts > 0)) then
                       begin
                          // Utilizaré el articulo "Texto Libre"
                          Articulo := QMConfPrestaShopARTICULO_DESCUENTO.AsString;

                          // ***
                          // Si se modifica el calculo, modificar también procedure SincronizaOrdenesFacturas
                          // ***
                          Log.Add(Format('   ' + _('Sincronizando linea Descuento. (%.2f)'), [total_discounts]));

                          // Busco la linea con los descuentos
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' SELECT ID_DETALLES_S FROM GES_DETALLES_S ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_S = :ID_S AND ARTICULO = :ARTICULO AND TITULO STARTING WITH ''TOTAL DESCUENTOS'' ');
                                Params.ByName['ID_S'].AsInteger := id_s;
                                Params.ByName['ARTICULO'].AsString := Articulo;
                                ExecQuery;
                                id_detalles_s := FieldByName['ID_DETALLES_S'].AsInteger;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                          DMMain.Log(format('id_detalles_s: %d', [id_detalles_s]));
                          if (id_detalles_s = 0) then
                          begin
                             id_a := UDameDato.DameIDArticulo(Articulo, Empresa);
                             DMMain.Log(format('id_a: %d', [id_a]));

                             // Creo linea
                             id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');
                             DMMain.Log(format('Nuevo id_detalles_s: %d', [id_detalles_s]));

                             // Obtengo el Tipo de IVA Excento
                             TipoIVA := -1;
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Text := 'SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ARTICULO = :ARTICULO';
                                   Params.ByName['EMPRESA'].AsInteger := Empresa;
                                   Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                   Params.ByName['CANAL'].AsInteger := Canal;
                                   Params.ByName['ARTICULO'].AsString := Articulo;
                                   ExecQuery;
                                   if (HayDatos) then
                                   begin
                                      TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
                                   end;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;
                             DMMain.Log(format('TipoIVA: %d', [TipoIVA]));

                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Clear;
                                   SQL.Add(' INSERT INTO VER_DETALLE_PEDIDO ');
                                   SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                   SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, ORDEN, DIRECCION_ENTREGA, ALMACEN) ');
                                   SQL.Add(' VALUES ');
                                   SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                   SQL.Add(' ''GRNL'', :TIPO_IVA, 101, :DIRECCION_ENTREGA, :ALMACEN) ');
                                   Params.ByName['EMPRESA'].AsInteger := Empresa;
                                   Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                   Params.ByName['CANAL'].AsInteger := Canal;
                                   Params.ByName['SERIE'].AsString := Serie;
                                   Params.ByName['TIPO'].AsString := 'PEC';
                                   Params.ByName['RIG'].AsInteger := RIG;
                                   Params.ByName['LINEA'].AsInteger := 0;
                                   Params.ByName['ARTICULO'].AsString := Articulo;
                                   Params.ByName['TITULO'].AsString := 'TOTAL DESCUENTOS';
                                   Params.ByName['UNIDADES'].AsFloat := -1;
                                   if TarifaIvaIncluido then
                                      Params.ByName['PRECIO'].AsFloat := total_discounts_tax_incl
                                   else
                                      Params.ByName['PRECIO'].AsFloat := total_discounts_tax_excl;
                                   Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                   Params.ByName['ID_S'].AsInteger := id_s;
                                   Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                   Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                   Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                                   Params.ByName['ALMACEN'].AsString := Almacen;
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;
                             DMMain.Log('INSERT INTO VER_DETALLE_PEDIDO');
                          end
                          else
                          begin
                             // Modifico linea
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Clear;
                                   SQL.Add(' UPDATE VER_DETALLE_PEDIDO ');
                                   SQL.Add(' SET ARTICULO = :ARTICULO, TITULO = :TITULO, UNIDADES = :UNIDADES, PRECIO = :PRECIO, ENTRADA = :ENTRADA, ORDEN = 100, DIRECCION_ENTREGA = :DIRECCION_ENTREGA ');
                                   SQL.Add(' WHERE ID_DETALLES_S = :ID_DETALLES_S AND ((PRECIO <> :PRECIO) OR (UNIDADES <> :UNIDADES)) ');
                                   Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                   Params.ByName['ARTICULO'].AsString := Articulo;
                                   Params.ByName['TITULO'].AsString := 'TOTAL DESCUENTOS';
                                   Params.ByName['UNIDADES'].AsFloat := -1;
                                   if TarifaIvaIncluido then
                                      Params.ByName['PRECIO'].AsFloat := total_discounts_tax_incl
                                   else
                                      Params.ByName['PRECIO'].AsFloat := total_discounts_tax_excl;
                                   Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                   Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;
                             DMMain.Log('UPDATE INTO VER_DETALLE_PEDIDO');
                          end;
                       end;

                       // Agrego los costes PayPal, si los tiene.
                       if ((id_s > 0) and (Pos('PAYPAL', UpperCase(payment)) > 0)) then
                          // if ((id_s > 0) and (paypal_id_transaction > ' ')) then
                       begin
                          DMMain.Log(format('payment PAYPAL: %s', [UpperCase(payment)]));
                          // Utilizaré el articulo "Texto Libre"
                          Articulo := REntorno.ArtTextoLibre;

                          // ***
                          // Si se modifica el calculo, modificar también procedure SincronizaOrdenesFacturas
                          // ***
                    {
                    CuotaPaypal := paypal_shipping - RoundTo((total_shipping_tax_excl + (total_shipping_tax_excl * 21 / 100)), -2);
                    CuotaPaypal := RoundTo(CuotaPaypal, -2);
                    }
                          CuotaPaypal := RoundTo(total_paid - total_paid_real, -2);

                          Log.Add(Format('   ' + _('Sincronizando linea Cuota PayPal: %s. (%.2f)'), [payment, CuotaPaypal]));

                          // Busco la linea con los costes PayPal
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' SELECT ID_DETALLES_S FROM GES_DETALLES_S ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_S = :ID_S AND ARTICULO = :ARTICULO AND TITULO STARTING WITH ''CUOTA PAYPAL'' ');
                                Params.ByName['ID_S'].AsInteger := id_s;
                                Params.ByName['ARTICULO'].AsString := Articulo;
                                ExecQuery;
                                id_detalles_s := FieldByName['ID_DETALLES_S'].AsInteger;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          if (id_detalles_s = 0) then
                          begin
                             DMMain.Log(format('INSERT payment PAYPAL: %s', [UpperCase(payment)]));
                             id_a := UDameDato.DameIDArticulo(Articulo, Empresa);

                             // Creo linea
                             id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                             // Obtengo el Tipo de IVA Excento
                             TipoIVA := -1;
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND P_IVA = :P_IVA';
                                   Params.ByName['PAIS'].AsString := REntorno.Pais;
                                   Params.ByName['P_IVA'].AsFloat := 0;
                                   ExecQuery;
                                   if (HayDatos) then
                                      TipoIVA := FieldByName['TIPO'].AsInteger;
                                   FreeHandle;
                                finally
                                   Free;
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
                                      SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, ORDEN, DIRECCION_ENTREGA, ALMACEN) ');
                                      SQL.Add(' VALUES ');
                                      SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                      SQL.Add(' ''GRNL'', :TIPO_IVA, 100, :DIRECCION_ENTREGA, :ALMACEN) ');
                                      Params.ByName['EMPRESA'].AsInteger := Empresa;
                                      Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                      Params.ByName['CANAL'].AsInteger := Canal;
                                      Params.ByName['SERIE'].AsString := Serie;
                                      Params.ByName['TIPO'].AsString := 'PEC';
                                      Params.ByName['RIG'].AsInteger := RIG;
                                      Params.ByName['LINEA'].AsInteger := 0;
                                      Params.ByName['ARTICULO'].AsString := Articulo;
                                      Params.ByName['TITULO'].AsString := 'CUOTA PAYPAL' {+ ' Trans. ' + paypal_id_transaction};
                                      Params.ByName['UNIDADES'].AsFloat := 1;
                                      Params.ByName['PRECIO'].AsFloat := CuotaPaypal;
                                      Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                      Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                      Params.ByName['ID_S'].AsInteger := id_s;
                                      Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                      Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                                      Params.ByName['ALMACEN'].AsString := Almacen;
                                      ExecQuery;
                                      FreeHandle;
                                   finally
                                      Free;
                                   end;
                                end;
                             end
                             else
                                raise Exception.Create(_('No se pudo determinar el IVA a aplciar (PEC-PAYPAL)'));
                          end
                          else
                          begin
                             DMMain.Log(format('UPDATE payment PAYPAL: %s', [UpperCase(payment)]));
                             // Modifico linea
                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Clear;
                                   SQL.Add(' UPDATE VER_DETALLE_PEDIDO ');
                                   SQL.Add(' SET ARTICULO = :ARTICULO, TITULO = :TITULO, UNIDADES = :UNIDADES, PRECIO = :PRECIO, ENTRADA = :ENTRADA, ORDEN = 100, DIRECCION_ENTREGA = :DIRECCION_ENTREGA ');
                                   SQL.Add(' WHERE ID_DETALLES_S = :ID_DETALLES_S AND ((PRECIO <> :PRECIO) OR (UNIDADES <> :UNIDADES)) ');
                                   Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                   Params.ByName['ARTICULO'].AsString := Articulo;
                                   Params.ByName['TITULO'].AsString := 'CUOTA PAYPAL' {+ ' Trans. ' + paypal_id_transaction};
                                   Params.ByName['UNIDADES'].AsFloat := 1;
                                   Params.ByName['PRECIO'].AsFloat := CuotaPaypal;
                                   Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                   Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;
                          end;
                       end;

                       // Recorro las lineas
                       NodoDetalle := DameNodo(NodoPadre, ['associations', 'order_rows']);
                       if Assigned(NodoDetalle) then
                       begin
                          DMMain.Log('order_rows');
                          i := 0;
                          while (i <= NodoDetalle.ChildNodes.Count - 1) do
                          begin
                             Nodo := NodoDetalle.ChildNodes.Get(i);

                             id_order_detail := StrToInt(DameDato(Nodo, ['id']));
                             id_product := StrToInt(DameDato(Nodo, ['product_id']));
                             id_product_attribute := StrToIntDef(DameDato(Nodo, ['product_attribute_id']), 0);
                             id_attribute := '';
                             // ??? id_attribute := StrToInt(DameDato(Nodo, ['product_id']));
                             product_quantity := StrToFloatDec(DameDato(Nodo, ['product_quantity']), '.');
                             product_name := DameDato(Nodo, ['product_name']);
                             product_reference := DameDato(Nodo, ['product_reference']);
                             product_ean13 := DameDato(Nodo, ['product_ean13']);
                             product_isbn := DameDato(Nodo, ['product_isbn']);
                             product_upc := DameDato(Nodo, ['product_upc']);
                             product_price := StrToFloatDec(DameDato(Nodo, ['product_price']), '.');
                             unit_price_tax_incl := StrToFloatDec(DameDato(Nodo, ['unit_price_tax_incl']), '.');
                             unit_price_tax_excl := StrToFloatDec(DameDato(Nodo, ['unit_price_tax_excl']), '.');

                             Log.Add(Format('   ' + _('Sincronizando linea %d - %s'), [id_order_detail, product_name]));

                             SincronizaDetallePedido(IdConfiguracion, id_order_detail);

                             // Busco si ya está entrada la linea
                             if ((id_s > 0) and (id_order_detail > 0)) then
                             begin
                                // Obtengo id del detalle para ver si ya ha sido importado
                                with THYFIBQuery.Create(nil) do
                                begin
                                   try
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Clear;
                                      SQL.Add(' SELECT ID_DETALLES_S FROM SYS_CONF_PRESTASHOP_PEC_DET ');
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
                                   id_a := DameIdArticulo(IdConfiguracion, id_product, id_product_attribute, id_attribute);
                                   if (id_a = 0) then
                                   begin
                                      if SincronizarArticuloSiNoExiste then
                                         id_a := SincronizaUnArticulo(id_product)
                                      else
                                      begin
                                         // Importar articulos que no existen con "TEXTO VARIO"
                                         if (QMConfPrestaShopIMPORTAR_ARTICULOS_VARIOS.AsInteger = 1) then
                                            id_a := UDameDato.DameIDArticulo(REntorno.ArtTextoLibre, Empresa);
                                         { ID_A seguiria siendo 0 y fallaría en la siguiente sentencia.
                                         else
                                         }
                                      end;
                                   end;

                                   if (id_a = 0) then
                                   begin
                                      Log.Add(Format('   ' + _('No se puede crear linea para producto %s (id_prod: %d_%d_%s). Se elimina pedido.'), [product_name, id_product, id_product_attribute, id_attribute]));

                                      with THYFIBQuery.Create(nil) do
                                      begin
                                         try
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Clear;
                                            SQL.Text := 'DELETE FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
                                            Params.ByName['ID_S'].AsInteger := id_s;
                                            ExecQuery;
                                            FreeHandle;
                                         finally
                                            Free;
                                         end;
                                      end;

                                      // Inidicamos que no se ha podido crear el pedido
                                      id_s := 0;

                                      // Rompemos el bucle para no tratar el resto de líneas
                                      i := NodoDetalle.ChildNodes.Count;
                                   end;

                                   Articulo := DameArticulo(id_a);
                                   // Precio := product_price;

                                   if (unit_price_tax_excl <> 0) then
                                      PorcentajeIVA := RoundTo((((unit_price_tax_incl / unit_price_tax_excl) - 1) * 100), 0)
                                   else
                                   begin
                                      // Esto se daría si el precio de la linea viene a cero
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
                                   end;

                                   Precio := unit_price_tax_excl;
                                   if TarifaIvaIncluido then
                                      // product_price := product_price + (product_price * PorcentajeIVA / 100);
                                      Precio := unit_price_tax_incl;

                                   if (id_s <> 0) and (id_detalles_s = 0) then
                                   begin
                                      // Creo linea

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
                                               Params.ByName['EMPRESA'].AsInteger := Empresa;
                                               Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                               Params.ByName['CANAL'].AsInteger := Canal;
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
                                               Params.ByName['EMPRESA'].AsInteger := Empresa;
                                               Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                               Params.ByName['CANAL'].AsInteger := Canal;
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
                                         // Si requiere LOTE_SIMPLE debe dividirse de a una unidad por linea
                                         l := 1;
                                         if RequiereLoteSimple(id_a) then
                                         begin
                                            l := Trunc(product_quantity);
                                            product_quantity := 1;
                                         end;

                                         for RepetirLinea := 1 to l do
                                         begin
                                            id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                                            with THYFIBQuery.Create(nil) do
                                            begin
                                               try
                                                  Close;
                                                  DataBase := DMMain.DataBase;
                                                  SQL.Clear;
                                                  SQL.Add(' SELECT ID_P FROM G_PROMOCION_EXISTE(:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :UNIDADES, 0, :FECHA, :CLIENTE, 0) ');
                                                  Params.ByName['EMPRESA'].AsInteger := Empresa;
                                                  Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                                  Params.ByName['CANAL'].AsInteger := Canal;
                                                  Params.ByName['ARTICULO'].AsString := Articulo;
                                                  Params.ByName['UNIDADES'].AsFloat := product_quantity;
                                                  Params.ByName['FECHA'].AsDateTime := Fecha;
                                                  Params.ByName['CLIENTE'].AsInteger := Cliente;
                                                  ExecQuery;
                                                  IdPromocion := FieldByName['ID_P'].AsInteger;
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
                                                  SQL.Clear;
                                                  SQL.Add(' INSERT INTO VER_DETALLE_PEDIDO ');
                                                  SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                                  SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, DIRECCION_ENTREGA, ALMACEN, ID_P, PROC_PROMOCION) ');
                                                  SQL.Add(' VALUES ');
                                                  SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                                  SQL.Add(' ''GRNL'', :TIPO_IVA, :DIRECCION_ENTREGA, :ALMACEN, :ID_P, :PROC_PROMOCION) ');
                                                  Params.ByName['EMPRESA'].AsInteger := Empresa;
                                                  Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                                  Params.ByName['CANAL'].AsInteger := Canal;
                                                  Params.ByName['SERIE'].AsString := Serie;
                                                  Params.ByName['TIPO'].AsString := 'PEC';
                                                  Params.ByName['RIG'].AsInteger := RIG;
                                                  Params.ByName['LINEA'].AsInteger := 0;
                                                  Params.ByName['ARTICULO'].AsString := Articulo;
                                                  if (Articulo = REntorno.ArtTextoLibre) then
                                                     Params.ByName['TITULO'].AsString := product_name
                                                  else
                                                     Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, Empresa);
                                                  Params.ByName['UNIDADES'].AsFloat := product_quantity;
                                                  Params.ByName['PRECIO'].AsFloat := Precio;
                                                  Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                                  Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                                  Params.ByName['ID_S'].AsInteger := id_s;
                                                  Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                                  Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                                                  Params.ByName['ALMACEN'].AsString := Almacen;
                                                  Params.ByName['ID_P'].AsInteger := IdPromocion;
                                                  Params.ByName['PROC_PROMOCION'].AsInteger := BoolToInt(IdPromocion > 0);
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
                                                  SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_PEC_DET (ID_CONFIGURACION, ID_DETALLES_S, ID_ORDER_DETAIL) ');
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
                                         end;

                                         // Veo si es un Megaproduct
                                         with THYFIBQuery.Create(nil) do
                                         begin
                                            try
                                               Close;
                                               DataBase := DMMain.DataBase;
                                               SQL.Text := 'SELECT ID_MEGACART FROM SYS_CONF_PRESTASHOP_MEGAPROD WHERE ID_CONFIGURACION = :ID_CONFIGURACION AND ID_CART = :ID_CART AND ID_PRODUCT = :ID_PRODUCT';
                                               Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                                               Params.ByName['ID_CART'].AsInteger := id_cart;
                                               Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                                               ExecQuery;
                                               id_megacart := FieldByName['ID_MEGACART'].AsInteger;
                                               FreeHandle;
                                            finally
                                               Free;
                                            end;
                                         end;

                                         if (id_megacart > 0) then
                                         begin
                                            with xMegacart do
                                            begin
                                               Close;
                                               Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                                               Params.ByName['ID_MEGACART'].AsInteger := id_megacart;
                                               Open;
                                            end;

                                            while not xMegacart.EOF do
                                            begin
                                               id_a := DameIdArticulo(IdConfiguracion, xMegacartID_PRODUCT.AsInteger, xMegacartID_PRODUCT_ATTRIBUTE.AsInteger, '');
                                               if (id_a = 0) then
                                               begin
                                                  if SincronizarArticuloSiNoExiste then
                                                     id_a := SincronizaUnArticulo(id_product)
                                                  else
                                                  begin
                                                     // Importar articulos que no existen con "TEXTO VARIO"
                                                     if (QMConfPrestaShopIMPORTAR_ARTICULOS_VARIOS.AsInteger = 0) then
                                                        id_a := UDameDato.DameIDArticulo(REntorno.ArtTextoLibre, Empresa);
                                                     { ID_A seguiria siendo 0 y fallaría en la siguiente sentencia.
                                                     else

                                                     }
                                                  end;
                                               end;

                                               Articulo := DameArticulo(id_a);

                                               TipoIVA := 1;
                                               with THYFIBQuery.Create(nil) do
                                               begin
                                                  try
                                                     Close;
                                                     DataBase := DMMain.DataBase;
                                                     SQL.Text := 'SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ARTICULO = :ARTICULO';
                                                     Params.ByName['EMPRESA'].AsInteger := Empresa;
                                                     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                                     Params.ByName['CANAL'].AsInteger := Canal;
                                                     Params.ByName['ARTICULO'].AsString := Articulo;
                                                     ExecQuery;
                                                     if (HayDatos) then
                                                        TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
                                                     FreeHandle;
                                                  finally
                                                     Free;
                                                  end;
                                               end;

                                               // Si requiere LOTE_SIMPLE debe dividirse de a una unidad por linea
                                               l := 1;
                                               product_quantity := xMegacartQUANTITY.AsInteger;
                                               if RequiereLoteSimple(id_a) then
                                               begin
                                                  l := xMegacartQUANTITY.AsInteger;
                                                  product_quantity := 1;
                                               end;

                                               for RepetirLinea := 1 to l do
                                               begin
                                                  id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                                                  with THYFIBQuery.Create(nil) do
                                                  begin
                                                     try
                                                        Close;
                                                        DataBase := DMMain.DataBase;
                                                        SQL.Clear;
                                                        SQL.Add(' SELECT ID_P FROM G_PROMOCION_EXISTE(:EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :UNIDADES, 0, :FECHA, :CLIENTE, 0) ');
                                                        Params.ByName['EMPRESA'].AsInteger := Empresa;
                                                        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                                        Params.ByName['CANAL'].AsInteger := Canal;
                                                        Params.ByName['ARTICULO'].AsString := Articulo;
                                                        Params.ByName['UNIDADES'].AsFloat := product_quantity;
                                                        Params.ByName['FECHA'].AsDateTime := Fecha;
                                                        Params.ByName['CLIENTE'].AsInteger := Cliente;
                                                        ExecQuery;
                                                        IdPromocion := FieldByName['ID_P'].AsInteger;
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
                                                        SQL.Clear;
                                                        SQL.Add(' INSERT INTO VER_DETALLE_PEDIDO ');
                                                        SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                                        SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, DIRECCION_ENTREGA, ALMACEN, ID_P, PROC_PROMOCION) ');
                                                        SQL.Add(' VALUES ');
                                                        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                                        SQL.Add(' ''GRNL'', :TIPO_IVA, :DIRECCION_ENTREGA, :ALMACEN, :ID_P, :PROC_PROMOCION) ');
                                                        Params.ByName['EMPRESA'].AsInteger := Empresa;
                                                        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                                        Params.ByName['CANAL'].AsInteger := Canal;
                                                        Params.ByName['SERIE'].AsString := Serie;
                                                        Params.ByName['TIPO'].AsString := 'PEC';
                                                        Params.ByName['RIG'].AsInteger := RIG;
                                                        Params.ByName['LINEA'].AsInteger := 0;
                                                        Params.ByName['ARTICULO'].AsString := Articulo;
                                                        if (Articulo = REntorno.ArtTextoLibre) then
                                                           Params.ByName['TITULO'].AsString := format('Prod.: %s - Attr: %s', [xMegacartID_PRODUCT.AsInteger, xMegacartID_PRODUCT_ATTRIBUTE.AsInteger])
                                                        else
                                                           Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, Empresa);
                                                        Params.ByName['UNIDADES'].AsFloat := product_quantity;
                                                        Params.ByName['PRECIO'].AsFloat := 0;
                                                        Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                                        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                                        Params.ByName['ID_S'].AsInteger := id_s;
                                                        Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                                        Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                                                        Params.ByName['ALMACEN'].AsString := Almacen;
                                                        Params.ByName['ID_P'].AsInteger := IdPromocion;
                                                        Params.ByName['PROC_PROMOCION'].AsInteger := BoolToInt(IdPromocion > 0);
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
                                                        SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_PEC_DET (ID_CONFIGURACION, ID_DETALLES_S, ID_ORDER_DETAIL) ');
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
                                               end;

                                               xMegacart.Next;
                                            end;

                                            xMegacart.Close;
                                         end;
                                      end
                                      else
                                         raise Exception.Create(_('No se pudo determinar el IVA a aplciar (PEC)' + '(' + FloatToStr(PorcentajeIVA) + ')'));
                                   end
                                   else
                                   begin
                                      if not ProductIsPack(IdConfiguracion, id_product, id_product_attribute) then
                                      begin
                                         // Modifico linea
                                         with THYFIBQuery.Create(nil) do
                                         begin
                                            try
                                               Close;
                                               DataBase := DMMain.DataBase;
                                               SQL.Clear;
                                               SQL.Add(' UPDATE VER_DETALLE_PEDIDO ');
                                               SQL.Add(' SET ');
                                               SQL.Add(' ARTICULO = :ARTICULO, ');
                                               SQL.Add(' TITULO = :TITULO, ');
                                               if not RequiereLoteSimple(id_a) then
                                                  SQL.Add(' UNIDADES = :UNIDADES, ');
                                               SQL.Add(' PRECIO = :PRECIO, ');
                                               SQL.Add(' ENTRADA = :ENTRADA, ');
                                               SQL.Add(' DIRECCION_ENTREGA = :DIRECCION_ENTREGA ');
                                               SQL.Add(' WHERE ');
                                               SQL.Add(' ID_DETALLES_S IN (SELECT ID_DETALLES_S ');
                                               SQL.Add('                   FROM SYS_CONF_PRESTASHOP_PEC_DET ');
                                               SQL.Add('                   WHERE ');
                                               SQL.Add('                   ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                                               SQL.Add('                   ID_ORDER_DETAIL = :ID_ORDER_DETAIL) ');
                                               Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                                               Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                                               Params.ByName['ARTICULO'].AsString := Articulo;
                                               if (Articulo = REntorno.ArtTextoLibre) then
                                                  Params.ByName['TITULO'].AsString := product_name
                                               else
                                                  Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, Empresa);
                                               if not RequiereLoteSimple(id_a) then
                                                  Params.ByName['UNIDADES'].AsFloat := product_quantity;
                                               Params.ByName['PRECIO'].AsFloat := Precio;
                                               Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                               Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
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

                             Inc(i);
                             DMMain.Log('next order_rows');
                          end;

                          DMMain.Log('Ordeno lineas (Muevo linea con "CUOTA PAYPAL" al final)');
                          // Ordeno lineas (Muevo linea con 'CUOTA PAYPAL' al final)
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' UPDATE GES_DETALLES_S ');
                                SQL.Add(' SET ORDEN = (SELECT COALESCE(MAX(ORDEN) + 1, 0) FROM GES_DETALLES_S WHERE ID_S = :ID_S) ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_S = :ID_S AND ');
                                SQL.Add(' TITULO STARTING WITH ''CUOTA PAYPAL'' AND ');
                                SQL.Add(' ORDEN <> (SELECT COALESCE(MAX(ORDEN), 0) FROM GES_DETALLES_S WHERE ID_S = :ID_S) ');
                                Params.ByName['ID_S'].AsInteger := id_s;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          DMMain.Log('Ordeno lineas (Muevo linea con "TOTAL DESCUENTOS" al final)');
                          // Ordeno lineas (Muevo linea con 'TOTAL DESCUENTOS' al final)
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' UPDATE GES_DETALLES_S ');
                                SQL.Add(' SET ORDEN = (SELECT COALESCE(MAX(ORDEN) + 1, 0) FROM GES_DETALLES_S WHERE ID_S = :ID_S) ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_S = :ID_S AND ');
                                SQL.Add(' TITULO STARTING WITH ''TOTAL DESCUENTOS'' AND ');
                                SQL.Add(' ORDEN <> (SELECT COALESCE(MAX(ORDEN), 0) FROM GES_DETALLES_S WHERE ID_S = :ID_S) ');
                                Params.ByName['ID_S'].AsInteger := id_s;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;

                       DMMain.Log('Ahora miro si hay descuadre de centimos');
                       // Ahora miro si hay descuadre de centimos
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' SELECT LIQUIDO, TOTAL_PAID FROM VER_SYS_CONF_PRESTASHOP_ORDER ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                             SQL.Add(' ID_ORDER = :ID_ORDER ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                             Params.ByName['ID_ORDER'].AsInteger := id_order;
                             ExecQuery;
                             Liquido := FieldByName['LIQUIDO'].AsFloat;
                             TotalPaid := FieldByName['TOTAL_PAID'].AsFloat;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       DMMain.Log(format('Liq: %.3f TotalPaid: %.3f Diferencia: %.3f', [Liquido, TotalPaid, abs(Liquido - TotalPaid)]));

                       // Si la diferencia es hasta 3 centimos lo agrego como linea de redondeo
                       if ((abs(Liquido - TotalPaid) >= 0.01) and (abs(Liquido - TotalPaid) < 0.04)) then
                       begin
                          id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

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
                                Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                                Params.ByName['TITULO'].AsString := _('REDONDEOS');
                                if (Liquido > TotalPaid) then
                                   Params.ByName['UNIDADES'].AsFloat := -1
                                else
                                   Params.ByName['UNIDADES'].AsFloat := 1;
                                Params.ByName['PRECIO'].AsFloat := abs(Liquido - TotalPaid);
                                Params.ByName['TIPO_IVA'].AsInteger := DameTipoIVAArticulo(REntorno.ArtTextoLibre);
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['ID_S'].AsInteger := id_s;
                                Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                Params.ByName['DIRECCION_ENTREGA'].AsInteger := DireccionEntrega;
                                Params.ByName['ALMACEN'].AsString := Almacen;
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
        ShowMessage('(order)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  Result := id_s;
end;

procedure TDMSincronizacionTienda.SincronizaDetallePedido(IdConfiguracion, id_order_detail: integer);
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoDetalle : IXMLNode;
  Nodo : IXMLNode;

  id_order : integer;
  product_id : integer;
  product_attribute_id : integer;
  product_quantity_reinjected : double;
  group_reduction : double;
  discount_quantity_applied : double;
  id_order_invoice : integer;
  id_warehouse : integer;
  id_shop : integer;
  id_customization : integer;
  product_name : string;
  product_quantity : double;
  product_quantity_in_stock : double;
  product_quantity_return : double;
  product_quantity_refunded : double;
  product_price : double;
  reduction_percent : double;
  reduction_amount : double;
  reduction_amount_tax_incl : double;
  reduction_amount_tax_excl : double;
  product_quantity_discount : double;
  product_ean13 : string;
  product_isbn : string;
  product_upc : string;
  product_reference : string;
  product_supplier_reference : string;
  product_weight : double;
  tax_computation_method : integer;
  id_tax_rules_group : integer;
  ecotax : double;
  ecotax_tax_rate : double;
  unit_price_tax_incl : double;
  unit_price_tax_excl : double;
  total_price_tax_incl : double;
  total_price_tax_excl : double;
  total_shipping_price_tax_excl : double;
  total_shipping_price_tax_incl : double;
  purchase_supplier_price : double;
  original_product_price : double;
  original_wholesale_price : double;
begin
  Log.Add(Format(_('Sincronizando detalle de orden (Id_Order_Detail) %d'), [id_order_detail]));

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los fabricantes activos
     CodigoRespuesta := DMPrestashop.WS_Get('order_details', id_order_detail, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+format('Respuesta-order_detail_%d.xml', [id_order_detail]));
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['order_detail']);
           if Assigned(NodoPadre) then
           begin
              DMMain.Log('leer nodos');
              DMMain.Log('id_order ' + DameDato(NodoPadre, ['id_order']));
              id_order := StrToIntDef(DameDato(NodoPadre, ['id_order']), 0);

              DMMain.Log('product_id ' + DameDato(NodoPadre, ['product_id']));
              product_id := StrToIntDef(DameDato(NodoPadre, ['product_id']), 0);

              DMMain.Log('product_attribute_id ' + DameDato(NodoPadre, ['product_attribute_id']));
              product_attribute_id := StrToIntDef(DameDato(NodoPadre, ['product_attribute_id']), 0);

              DMMain.Log('product_quantity_reinjected ' + DameDato(NodoPadre, ['product_quantity_reinjected']));
              product_quantity_reinjected := StrToFloatDec(DameDato(NodoPadre, ['product_quantity_reinjected']), '.');

              DMMain.Log('group_reduction ' + DameDato(NodoPadre, ['group_reduction']));
              group_reduction := StrToFloatDec(DameDato(NodoPadre, ['group_reduction']), '.');

              DMMain.Log('discount_quantity_applied ' + DameDato(NodoPadre, ['discount_quantity_applied']));
              discount_quantity_applied := StrToFloatDec(DameDato(NodoPadre, ['discount_quantity_applied']), '.');

              DMMain.Log('id_order_invoice ' + DameDato(NodoPadre, ['id_order_invoice']));
              id_order_invoice := StrToIntDef(DameDato(NodoPadre, ['id_order_invoice']), 0);

              DMMain.Log('id_warehouse ' + DameDato(NodoPadre, ['id_warehouse']));
              id_warehouse := StrToIntDef(DameDato(NodoPadre, ['id_warehouse']), 0);

              DMMain.Log('id_shop ' + DameDato(NodoPadre, ['id_shop']));
              id_shop := StrToIntDef(DameDato(NodoPadre, ['id_shop']), 0);

              DMMain.Log('id_customization ' + DameDato(NodoPadre, ['id_customization']));
              id_customization := StrToIntDef(DameDato(NodoPadre, ['id_customization']), 0);

              DMMain.Log('product_name ' + DameDato(NodoPadre, ['product_name']));
              product_name := DameDato(NodoPadre, ['product_name']);

              DMMain.Log('product_quantity ' + DameDato(NodoPadre, ['product_quantity']));
              product_quantity := StrToFloatDec(DameDato(NodoPadre, ['product_quantity']), '.');

              DMMain.Log('product_quantity_in_stock ' + DameDato(NodoPadre, ['product_quantity_in_stock']));
              product_quantity_in_stock := StrToFloatDec(DameDato(NodoPadre, ['product_quantity_in_stock']), '.');

              DMMain.Log('product_quantity_return ' + DameDato(NodoPadre, ['product_quantity_return']));
              product_quantity_return := StrToFloatDec(DameDato(NodoPadre, ['product_quantity_return']), '.');

              DMMain.Log('product_quantity_refunded ' + DameDato(NodoPadre, ['product_quantity_refunded']));
              product_quantity_refunded := StrToFloatDec(DameDato(NodoPadre, ['product_quantity_refunded']), '.');

              DMMain.Log('product_price ' + DameDato(NodoPadre, ['product_price']));
              product_price := StrToFloatDec(DameDato(NodoPadre, ['product_price']), '.');

              DMMain.Log('reduction_percent ' + DameDato(NodoPadre, ['reduction_percent']));
              reduction_percent := StrToFloatDec(DameDato(NodoPadre, ['reduction_percent']), '.');

              DMMain.Log('reduction_amount ' + DameDato(NodoPadre, ['reduction_amount']));
              reduction_amount := StrToFloatDec(DameDato(NodoPadre, ['reduction_amount']), '.');

              DMMain.Log('reduction_amount_tax_incl ' + DameDato(NodoPadre, ['reduction_amount_tax_incl']));
              reduction_amount_tax_incl := StrToFloatDec(DameDato(NodoPadre, ['reduction_amount_tax_incl']), '.');

              DMMain.Log('reduction_amount_tax_excl ' + DameDato(NodoPadre, ['reduction_amount_tax_excl']));
              reduction_amount_tax_excl := StrToFloatDec(DameDato(NodoPadre, ['reduction_amount_tax_excl']), '.');

              DMMain.Log('product_quantity_discount ' + DameDato(NodoPadre, ['product_quantity_discount']));
              product_quantity_discount := StrToFloatDec(DameDato(NodoPadre, ['product_quantity_discount']), '.');
              DMMain.Log('leer nodos mitad');

              product_ean13 := DameDato(NodoPadre, ['product_ean13']);
              product_isbn := DameDato(NodoPadre, ['product_isbn']);
              product_upc := DameDato(NodoPadre, ['product_upc']);
              product_reference := DameDato(NodoPadre, ['product_reference']);
              product_supplier_reference := DameDato(NodoPadre, ['product_supplier_reference']);
              product_weight := StrToFloatDec(DameDato(NodoPadre, ['product_weight']), '.');
              tax_computation_method := StrToIntDef(DameDato(NodoPadre, ['tax_computation_method']), 0);
              id_tax_rules_group := StrToIntDef(DameDato(NodoPadre, ['id_tax_rules_group']), 0);
              ecotax := StrToFloatDec(DameDato(NodoPadre, ['ecotax']), '.');
              ecotax_tax_rate := StrToFloatDec(DameDato(NodoPadre, ['ecotax_tax_rate']), '.');
              unit_price_tax_incl := StrToFloatDec(DameDato(NodoPadre, ['unit_price_tax_incl']), '.');
              unit_price_tax_excl := StrToFloatDec(DameDato(NodoPadre, ['unit_price_tax_excl']), '.');
              total_price_tax_incl := StrToFloatDec(DameDato(NodoPadre, ['total_price_tax_incl']), '.');
              total_price_tax_excl := StrToFloatDec(DameDato(NodoPadre, ['total_price_tax_excl']), '.');
              total_shipping_price_tax_excl := StrToFloatDec(DameDato(NodoPadre, ['total_shipping_price_tax_excl']), '.');
              total_shipping_price_tax_incl := StrToFloatDec(DameDato(NodoPadre, ['total_shipping_price_tax_incl']), '.');
              purchase_supplier_price := StrToFloatDec(DameDato(NodoPadre, ['purchase_supplier_price']), '.');
              original_product_price := StrToFloatDec(DameDato(NodoPadre, ['original_product_price']), '.');
              original_wholesale_price := StrToFloatDec(DameDato(NodoPadre, ['original_wholesale_price']), '.');
              DMMain.Log('fin leer nodos');

              if Assigned(FSendCorreo) then
              begin
                 try
                    FSendCorreo.Texto(Format(_('Id Order Detail: %d - %s'), [id_order_detail, product_name]));
                 except
                 end;
              end;
              Log[Log.Count - 1] := Format(_('Sincronizando orden (Id Order Detail) %d - %s'), [id_order_detail, product_name]);

              // Veo si la orden ya esta sincronizada con un pedido
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_ORDER_D ( ');
                    SQL.Add(' ID_CONFIGURACION, ID_ORDER_DETAIL, ID_ORDER, PRODUCT_ID, PRODUCT_ATTRIBUTE_ID, PRODUCT_QUANTITY_REINJECTED, ');
                    SQL.Add('  GROUP_REDUCTION, DISCOUNT_QUANTITY_APPLIED, ID_ORDER_INVOICE, ID_WAREHOUSE, ID_SHOP, ID_CUSTOMIZATION, PRODUCT_NAME, ');
                    SQL.Add('  PRODUCT_QUANTITY, PRODUCT_QUANTITY_IN_STOCK, PRODUCT_QUANTITY_RETURN, PRODUCT_QUANTITY_REFUNDED, PRODUCT_PRICE, ');
                    SQL.Add('  REDUCTION_PERCENT, REDUCTION_AMOUNT, REDUCTION_AMOUNT_TAX_INCL, REDUCTION_AMOUNT_TAX_EXCL, PRODUCT_QUANTITY_DISCOUNT, ');
                    SQL.Add('  PRODUCT_EAN13, PRODUCT_ISBN, PRODUCT_UPC, PRODUCT_REFERENCE, PRODUCT_SUPPLIER_REFERENCE, PRODUCT_WEIGHT, ');
                    SQL.Add('  TAX_COMPUTATION_METHOD, ID_TAX_RULES_GROUP, ECOTAX, UNIT_PRICE_TAX_INCL, UNIT_PRICE_TAX_EXCL, TOTAL_PRICE_TAX_INCL, ');
                    SQL.Add('  TOTAL_PRICE_TAX_EXCL, ECOTAX_TAX_RATE, TOTAL_SHIPPING_PRICE_TAX_EXCL, TOTAL_SHIPPING_PRICE_TAX_INCL, ');
                    SQL.Add('  PURCHASE_SUPPLIER_PRICE, ORIGINAL_PRODUCT_PRICE, ORIGINAL_WHOLESALE_PRICE/*, RAW_XML*/) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :ID_CONFIGURACION, :ID_ORDER_DETAIL, :ID_ORDER, :PRODUCT_ID, :PRODUCT_ATTRIBUTE_ID, :PRODUCT_QUANTITY_REINJECTED, ');
                    SQL.Add('  :GROUP_REDUCTION, :DISCOUNT_QUANTITY_APPLIED, :ID_ORDER_INVOICE, :ID_WAREHOUSE, :ID_SHOP, :ID_CUSTOMIZATION, ');
                    SQL.Add('  :PRODUCT_NAME, :PRODUCT_QUANTITY, :PRODUCT_QUANTITY_IN_STOCK, :PRODUCT_QUANTITY_RETURN, :PRODUCT_QUANTITY_REFUNDED, ');
                    SQL.Add('  :PRODUCT_PRICE, :REDUCTION_PERCENT, :REDUCTION_AMOUNT, :REDUCTION_AMOUNT_TAX_INCL, :REDUCTION_AMOUNT_TAX_EXCL, ');
                    SQL.Add('  :PRODUCT_QUANTITY_DISCOUNT, :PRODUCT_EAN13, :PRODUCT_ISBN, :PRODUCT_UPC, :PRODUCT_REFERENCE, ');
                    SQL.Add('  :PRODUCT_SUPPLIER_REFERENCE, :PRODUCT_WEIGHT, :TAX_COMPUTATION_METHOD, :ID_TAX_RULES_GROUP, :ECOTAX, ');
                    SQL.Add('  :UNIT_PRICE_TAX_INCL, :UNIT_PRICE_TAX_EXCL, :TOTAL_PRICE_TAX_INCL, :TOTAL_PRICE_TAX_EXCL, :ECOTAX_TAX_RATE, ');
                    SQL.Add('  :TOTAL_SHIPPING_PRICE_TAX_EXCL, :TOTAL_SHIPPING_PRICE_TAX_INCL, :PURCHASE_SUPPLIER_PRICE, :ORIGINAL_PRODUCT_PRICE, ');
                    SQL.Add('  :ORIGINAL_WHOLESALE_PRICE/*, RAW_XML*/) ');
                    SQL.Add(' MATCHING (ID_CONFIGURACION, ID_ORDER_DETAIL) ');
                    Params.ByName['ID_CONFIGURACION'].AsInteger := Idconfiguracion;
                    Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                    Params.ByName['ID_ORDER'].AsInteger := id_order;
                    Params.ByName['PRODUCT_ID'].AsInteger := product_id;
                    Params.ByName['PRODUCT_ATTRIBUTE_ID'].AsInteger := product_attribute_id;
                    Params.ByName['PRODUCT_QUANTITY_REINJECTED'].AsFloat := product_quantity_reinjected;
                    Params.ByName['GROUP_REDUCTION'].AsFloat := group_reduction;
                    Params.ByName['DISCOUNT_QUANTITY_APPLIED'].AsFloat := discount_quantity_applied;
                    Params.ByName['ID_ORDER_INVOICE'].AsInteger := id_order_invoice;
                    Params.ByName['ID_WAREHOUSE'].AsInteger := id_warehouse;
                    Params.ByName['ID_SHOP'].AsInteger := id_shop;
                    Params.ByName['ID_CUSTOMIZATION'].AsInteger := id_customization;
                    Params.ByName['PRODUCT_NAME'].AsString := product_name;
                    Params.ByName['PRODUCT_QUANTITY'].AsFloat := product_quantity;
                    Params.ByName['PRODUCT_QUANTITY_IN_STOCK'].AsFloat := product_quantity_in_stock;
                    Params.ByName['PRODUCT_QUANTITY_RETURN'].AsFloat := product_quantity_return;
                    Params.ByName['PRODUCT_QUANTITY_REFUNDED'].AsFloat := product_quantity_refunded;
                    Params.ByName['PRODUCT_PRICE'].AsFloat := product_price;
                    Params.ByName['REDUCTION_PERCENT'].AsFloat := reduction_percent;
                    Params.ByName['REDUCTION_AMOUNT'].AsFloat := reduction_amount;
                    Params.ByName['REDUCTION_AMOUNT_TAX_INCL'].AsFloat := reduction_amount_tax_incl;
                    Params.ByName['REDUCTION_AMOUNT_TAX_EXCL'].AsFloat := reduction_amount_tax_excl;
                    Params.ByName['PRODUCT_QUANTITY_DISCOUNT'].AsFloat := product_quantity_discount;
                    Params.ByName['PRODUCT_EAN13'].AsString := product_ean13;
                    Params.ByName['PRODUCT_ISBN'].AsString := product_isbn;
                    Params.ByName['PRODUCT_UPC'].AsString := product_upc;
                    Params.ByName['PRODUCT_REFERENCE'].AsString := product_reference;
                    Params.ByName['PRODUCT_SUPPLIER_REFERENCE'].AsString := product_supplier_reference;
                    Params.ByName['PRODUCT_WEIGHT'].AsFloat := product_weight;
                    Params.ByName['TAX_COMPUTATION_METHOD'].AsInteger := tax_computation_method;
                    Params.ByName['ID_TAX_RULES_GROUP'].AsInteger := id_tax_rules_group;
                    Params.ByName['ECOTAX'].AsFloat := ecotax;
                    Params.ByName['ECOTAX_TAX_RATE'].AsFloat := ecotax_tax_rate;
                    Params.ByName['UNIT_PRICE_TAX_INCL'].AsFloat := unit_price_tax_incl;
                    Params.ByName['UNIT_PRICE_TAX_EXCL'].AsFloat := unit_price_tax_excl;
                    Params.ByName['TOTAL_PRICE_TAX_INCL'].AsFloat := total_price_tax_incl;
                    Params.ByName['TOTAL_PRICE_TAX_EXCL'].AsFloat := total_price_tax_excl;
                    Params.ByName['TOTAL_SHIPPING_PRICE_TAX_EXCL'].AsFloat := total_shipping_price_tax_excl;
                    Params.ByName['TOTAL_SHIPPING_PRICE_TAX_INCL'].AsFloat := total_shipping_price_tax_incl;
                    Params.ByName['PURCHASE_SUPPLIER_PRICE'].AsFloat := purchase_supplier_price;
                    Params.ByName['ORIGINAL_PRODUCT_PRICE'].AsFloat := original_product_price;
                    Params.ByName['ORIGINAL_WHOLESALE_PRICE'].AsFloat := original_wholesale_price;
                    // Aparentemente esto hace que la base crezca mucho
                    // Params.ByName['RAW_XML'].AsString := XML.Text;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(order_detail)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaOrdenesFacturas(Desde, Hasta: TDateTime): integer;
(*
var
  Q : THYFIBQuery;
  id_order : integer;
  id_order_detail : integer;
  id_order_ant : integer;
  // total_paid_real : double;
  id_customer : integer;
  id_address_invoice : integer;
  id_address_delivery : integer;
  id_product : integer;
  id_product_attribute : integer;
  id_attribute : string;
  quantity : double;
  price : double;
  VAT : double;
  // order_date : string;
  reference : string;
  // Apertura, Cierre : TDateTime;
  Estado : integer;
  RIG : integer;
  id_s : integer;
  id_detalles_s : integer;
  id_a : integer;
  Articulo : string;
  // Linea : integer;
  IdCliente : integer;
  Cliente : integer;
  Tercero : integer;
  Direccion : integer;
  DireccionEntrega : integer;
  Contacto : integer;
  Tarifa : string;
  TipoIVA : integer;
  HayError : boolean;
  total_shipping_tax_excl : double;
  total_shipping_tax_incl : double;
  current_state : integer;
  paypal_id_transaction : string;
  paypal_total_paid : double;
  paypal_shipping : double;
  spaypal_total_paid : string;
  spaypal_shipping : string;
  paypal_currency : string;
  date_add, date_upd : TDateTime;
  Transportista : integer;
  DM : TDMPrestashop;
  CuotaPaypal : double;
*)
begin
  Result := -1;

  { TODO : Implementar mediante webservice }
  (*
  HayError := False;

  DM := TDMPrestashop.Create(Self);
  try
     DM.SetDSN(QMConfPrestaShopDSN.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);
     {Por ahora no voy a verificar si la fecha esta dentro del ejercicio porque debería guardar la ultima fecha de importación por ejercicio
  DameMinMax('EJE', Apertura, Cierre, QMConfPrestaShopEMPRESA.AsInteger, REntorno.Ejercicio);
  }

     FSendCorreo.Texto(_('Descargando Ordenes -> Factura'));
     DM.FiltraOrdenes(1, 999999, Desde, Hasta, (QMConfPrestaShopUTILIZA_MODULO_PAYPAL.AsInteger = 1));

     if (DM.QMySQL.Active) then
     begin
        id_order_ant := 0;
        id_order := 0;
        id_customer := 0;
        IdCliente := 0;
        Cliente := 0;
        Tercero := 0;
        id_address_invoice := 0;
        id_address_delivery := 0;
        Direccion := 0;
        DireccionEntrega := 0;
        Contacto := 0;
        id_product := 0;
        id_product_attribute := 0;
        id_attribute := '';
        id_a := 0;
        quantity := 0;
        price := 0;
        VAT := 0;
        TipoIVA := 0;
        id_s := 0;
        total_shipping_tax_excl := 0;
        total_shipping_tax_incl := 0;
        current_state := 0;
        paypal_id_transaction := '';
        paypal_total_paid := 0;
        paypal_shipping := 0;
        spaypal_total_paid := '';
        spaypal_shipping := '';
        paypal_currency := '';
        date_add := EncodeDate(2000, 1, 1);
        date_upd := EncodeDate(2000, 1, 1);
        reference := '';
        CuotaPaypal := 0;

        if (not DM.QMySQL.EOF) then
           Result := 0;

        try
           while (not DM.QMySQL.EOF) do
           begin
              id_order := 0;
              id_customer := 0;
              id_address_invoice := 0;
              id_address_delivery := 0;
              id_product := 0;
              id_product_attribute := 0;
              id_attribute := '';
              quantity := 0;
              price := 0;
              VAT := 0;
              date_add := EncodeDate(2000, 1, 1);
              reference := '';
              total_shipping_tax_excl := 0;
              total_shipping_tax_incl := 0;
              current_state := 0;
              paypal_id_transaction := '';
              paypal_total_paid := 0;
              paypal_shipping := 0;
              spaypal_total_paid := '';
              spaypal_shipping := '';
              paypal_currency := '';
              date_upd := EncodeDate(2000, 1, 1);

              IdCliente := 0;
              Cliente := 0;
              Tercero := 0;
              Direccion := 0;
              Contacto := 0;
              id_a := 0;
              TipoIVA := 0;
              CuotaPaypal := 0;

              id_order := DM.QMySQL.FieldByName('id_order').AsInteger;
              id_order_detail := DM.QMySQL.FieldByName('id_order_detail').AsInteger;
              id_customer := DM.QMySQL.FieldByName('id_customer').AsInteger;
              id_address_invoice := DM.QMySQL.FieldByName('id_address_invoice').AsInteger;
              id_address_delivery := DM.QMySQL.FieldByName('id_address_delivery').AsInteger;
              id_product := DM.QMySQL.FieldByName('id_product').AsInteger;
              id_product_attribute := DM.QMySQL.FieldByName('id_product_attribute').AsInteger;
              id_attribute := DM.QMySQL.FieldByName('id_attribute').AsString;
              quantity := DM.QMySQL.FieldByName('product_quantity').AsFloat;
              price := DM.QMySQL.FieldByName('unit_price_tax_excl').AsFloat;
              VAT := DM.QMySQL.FieldByName('tax_rate').AsFloat;
              // total_paid_real := DM.QMySQL.FieldByName('total_paid_real').AsFloat;
              date_add := DM.QMySQL.FieldByName('date_add').AsDateTime;
              reference := DM.QMySQL.FieldByName('reference').AsString;
              total_shipping_tax_excl := DM.QMySQL.FieldByName('total_shipping_tax_excl').AsFloat;
              total_shipping_tax_incl := DM.QMySQL.FieldByName('total_shipping_tax_incl').AsFloat;
              current_state := DM.QMySQL.FieldByName('current_state').AsInteger;
              paypal_id_transaction := DM.QMySQL.FieldByName('paypal_id_transaction').AsString;

              spaypal_total_paid := DM.QMySQL.FieldByName('paypal_total_paid').AsString;
              spaypal_shipping := DM.QMySQL.FieldByName('paypal_shipping').AsString;
              paypal_total_paid := StrToFloatDec(spaypal_total_paid, '.');
              paypal_shipping := StrToFloatDec(spaypal_shipping, '.');
              {
              paypal_total_paid := StrToFloatDef(DM.QMySQL.FieldByName('paypal_total_paid').AsString, 0);
              paypal_shipping := StrToFloatDef(DM.QMySQL.FieldByName('paypal_shipping').AsString, 0);
              }
              paypal_currency := DM.QMySQL.FieldByName('paypal_currency').AsString;
              date_upd := DM.QMySQL.FieldByName('date_upd').AsDateTime;

              if ((date_upd > Desde) and (current_state = QMConfPrestaShopESTADO_PRESTASHOP.AsInteger)) then
              begin
                 FSendCorreo.Texto(Format(_('Orden: %d' + #13#10 + ' Cliente: %d' + #13#10 + 'Producto: %d'), [id_order, id_customer, id_product]));

                 // Busco si ya está entrado
                 if (id_order_ant <> id_order) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' SELECT ID_S FROM SYS_CONF_PRESTASHOP_FAC ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ID_ORDER = :ID_ORDER ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_ORDER'].AsInteger := id_order;
                          ExecQuery;
                          id_s := FieldByName['ID_S'].AsInteger;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Si no existe creo cabecera
                 if (id_s = 0) then
                 begin
                    IdCliente := DameIdClientePrestaShop(QMConfPrestaShopID.AsInteger, id_customer);
                    Cliente := DameCliente(QMConfPrestaShopEMPRESA.AsInteger, IdCliente);
                    Tercero := DameTercero('CLI', Cliente, QMConfPrestaShopEMPRESA.AsInteger);

                    if (Tercero = 0) then
                    begin
                       // Esto sincronizará los datos de este cliente. Luego deberé volver a posicionar este dataset
                       SincronizaUnCliente(QMConfPrestaShopID.AsInteger, id_customer);

                       IdCliente := DameIdClientePrestaShop(QMConfPrestaShopID.AsInteger, id_customer);
                       Cliente := DameCliente(QMConfPrestaShopEMPRESA.AsInteger, IdCliente);
                       Tercero := DameTercero('CLI', Cliente, QMConfPrestaShopEMPRESA.AsInteger);
                    end;

                    Direccion := DameDireccionPrestaShop(QMConfPrestaShopID.AsInteger, id_address_invoice, Tercero);

                    if (Direccion = 0) then
                    begin
                       // Esto sincronizará los datos de este cliente. Luego deberé volver a posicionar este dataset
                       SincronizaClientesDirecciones(Desde, Hasta, id_address_invoice);

                       Direccion := DameDireccionPrestaShop(QMConfPrestaShopID.AsInteger, id_address_invoice, Tercero);
                    end;

                    DireccionEntrega := DameDireccionPrestaShop(QMConfPrestaShopID.AsInteger, id_address_delivery, Tercero);
                    if (DireccionEntrega = 0) then
                    begin
                       // Esto sincronizará los datos de este cliente. Luego deberé volver a posicionar este dataset
                       SincronizaClientesDirecciones(Desde, Hasta, DireccionEntrega);

                       DireccionEntrega := DameDireccionPrestaShop(QMConfPrestaShopID.AsInteger, id_address_delivery, Tercero);
                    end;

                    DM.FiltraOrdenes(1, 999999, Desde, Hasta, (QMConfPrestaShopUTILIZA_MODULO_PAYPAL.AsInteger = 1));
                    while ((not DM.QMySQL.EOF) and (id_order <> DM.QMySQL.FieldByName('id_order').AsInteger)) do
                       DM.QMySQL.Next;

                    // Tarifa del cliente
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT TARIFA, TRANSPORTISTA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['CLIENTE'].AsInteger := Cliente;
                          ExecQuery;
                          Tarifa := FieldByName['TARIFA'].AsString;
                          Transportista := FieldByName['TRANSPORTISTA'].AsInteger;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    // Contacto asociado a la dirección.
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT CONTACTO FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO = :TERCERO AND DIRECCION = :DIRECCION';
                          Params.ByName['TERCERO'].AsInteger := Tercero;
                          Params.ByName['DIRECCION'].AsInteger := Direccion;
                          ExecQuery;
                          Contacto := FieldByName['CONTACTO'].AsInteger;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    id_s := DMMain.ContadorGen('ID_GES_CABECERAS_S');
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' INSERT INTO VER_CABECERAS_FACTURA ');
                          SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, FECHA, ');
                          SQL.Add(' ALMACEN, CLIENTE, DIRECCION, ENTRADA, ID_S, SU_REFERENCIA, TARIFA, ');
                          SQL.Add(' TIPO_PORTES, I_PORTES, TRANSPORTISTA, CONTACTO)');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :FECHA, ');
                          SQL.Add(' :ALMACEN, :CLIENTE, :DIRECCION, :ENTRADA, :ID_S, :SU_REFERENCIA, :TARIFA, ');
                          SQL.Add(' :TIPO_PORTES, :I_PORTES, :TRANSPORTISTA, :CONTACTO)');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := YearOf(date_add);
                          Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                          Params.ByName['SERIE'].AsString := QMConfPrestaShopSERIE.AsString;
                          Params.ByName['TIPO'].AsString := 'FAC';
                          Params.ByName['RIG'].AsInteger := 0;
                          Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab; // date_add
                          Params.ByName['ALMACEN'].AsString := QMConfPrestaShopALMACEN.AsString;
                          Params.ByName['CLIENTE'].AsInteger := Cliente;
                          Params.ByName['DIRECCION'].AsInteger := Direccion;
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          Params.ByName['SU_REFERENCIA'].AsString := Copy(Format(_('Orden Web: %s'), [reference]), 1, 40);
                          Params.ByName['ID_S'].AsInteger := id_s;
                          Params.ByName['TARIFA'].AsString := Tarifa;
                          Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                          Params.ByName['CONTACTO'].AsInteger := Contacto;
                          if (total_shipping_tax_excl > 0) then
                          begin
                             Params.ByName['TIPO_PORTES'].AsInteger := 4;
                             Params.ByName['I_PORTES'].AsFloat := total_shipping_tax_excl;
                          end
                          else
                          begin
                             Params.ByName['TIPO_PORTES'].AsInteger := 0;
                             Params.ByName['I_PORTES'].AsFloat := 0;
                          end;

                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    // Grabo la relacion
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_FAC (ID_CONFIGURACION, ID_S, ID_ORDER) ');
                          SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_S, :ID_ORDER) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_S'].AsInteger := id_s;
                          Params.ByName['ID_ORDER'].AsInteger := id_order;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    id_order_ant := id_order;
                 end;

                 // Obtengo RIG para poder hacer los inserts en el detalle y la tarifa para ver si es IVA incluido o no
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
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
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 if (Estado = 0) then
                 begin
                    // Agrego los costes PayPal, si los tiene.
                    if ((id_s > 0) and (paypal_id_transaction > ' ')) then
                    begin
                       // Utilizaré el articulo "Texto Libre"
                       Articulo := REntorno.ArtTextoLibre;

                       // ***
                       // Si se modifica el calculo, modificar también procedure SincronizaOrdenesPedidos
                       // ***
                       CuotaPaypal := paypal_shipping - RoundTo((total_shipping_tax_excl + (total_shipping_tax_excl * 21 / 100)), -2);
                       CuotaPaypal := RoundTo(CuotaPaypal, -2);

                       // Busco la linea con los costes PayPal
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Clear;
                             SQL.Add(' SELECT ID_DETALLES_S FROM GES_DETALLES_S ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_S = :ID_S AND ARTICULO = :ARTICULO AND TITULO STARTING WITH ''CUOTA PAYPAL'' ');
                             Params.ByName['ID_S'].AsInteger := id_s;
                             Params.ByName['ARTICULO'].AsString := Articulo;
                             ExecQuery;
                             id_detalles_s := FieldByName['ID_DETALLES_S'].AsInteger;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       if (id_detalles_s = 0) then
                       begin
                          id_a := DameIDArticulo(Articulo, QMConfPrestaShopEMPRESA.AsInteger);

                          // Creo linea
                          id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                          // Obtengo el Tipo de IVA Excento
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND P_IVA = :P_IVA';
                                Params.ByName['PAIS'].AsString := REntorno.Pais;
                                Params.ByName['P_IVA'].AsFloat := 0;
                                ExecQuery;
                                if (Q.HayDatos) then
                                   TipoIVA := FieldByName['TIPO'].AsInteger
                                else
                                   TipoIVA := -1;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;

                          if (TipoIVA >= 0) then
                          begin
                             Q := THYFIBQuery.Create(nil);
                             try
                                with Q do
                                begin
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Clear;
                                   SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ');
                                   SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                   SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA) ');
                                   SQL.Add(' VALUES ');
                                   SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                   SQL.Add(' ''GRNL'', :TIPO_IVA) ');
                                   Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                                   Params.ByName['EJERCICIO'].AsInteger := YearOf(date_add);
                                   Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                                   Params.ByName['SERIE'].AsString := QMConfPrestaShopSERIE.AsString;
                                   Params.ByName['TIPO'].AsString := 'FAC';
                                   Params.ByName['RIG'].AsInteger := RIG;
                                   Params.ByName['LINEA'].AsInteger := 0;
                                   Params.ByName['ARTICULO'].AsString := Articulo;
                                   Params.ByName['TITULO'].AsString := 'CUOTA PAYPAL' {+ ' Trans. ' + paypal_id_transaction};
                                   Params.ByName['UNIDADES'].AsFloat := 1;
                                   Params.ByName['PRECIO'].AsFloat := CuotaPaypal;
                                   Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                   Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                   Params.ByName['ID_S'].AsInteger := id_s;
                                   Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                   ExecQuery;
                                   FreeHandle;
                                end;
                             finally
                                FreeAndNil(Q);
                             end;
                          end
                          else
                             raise Exception.Create(_('No se pudo determinar el IVA a aplciar (FAC-PAYPAL)'));
                       end
                       else
                       begin
                          // Modifico linea
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Clear;
                                SQL.Add(' UPDATE VER_DETALLE_FACTURA ');
                                SQL.Add(' SET ARTICULO = :ARTICULO, TITULO = :TITULO, UNIDADES = :UNIDADES, PRECIO = :PRECIO, ENTRADA = :ENTRADA ');
                                SQL.Add(' WHERE ID_DETALLES_S = :ID_DETALLES_S AND PRECIO <> :PRECIO ');
                                Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                Params.ByName['ARTICULO'].AsString := Articulo;
                                Params.ByName['TITULO'].AsString := 'CUOTA PAYPAL' {+ ' Trans. ' + paypal_id_transaction};
                                Params.ByName['UNIDADES'].AsFloat := 1;
                                Params.ByName['PRECIO'].AsFloat := CuotaPaypal;
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                ExecQuery;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;
                       end;
                    end;

                    // Busco si ya está entrada la linea
                    if ((id_s > 0) and (id_order_detail > 0)) then
                    begin
                       // Obtengo id del detalle para ver si ya ha sido importado
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Clear;
                             SQL.Add(' SELECT ID_DETALLES_S FROM SYS_CONF_PRESTASHOP_FAC_DET ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ID_ORDER_DETAIL = :ID_ORDER_DETAIL ');
                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                             ExecQuery;
                             id_detalles_s := FieldByName['ID_DETALLES_S'].AsInteger;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       if (id_order_detail > 0) then
                       begin
                          id_a := DameIdArticulo(QMConfPrestaShopID.AsInteger, id_product, id_product_attribute, id_attribute);
                          Articulo := DameArticulo(id_a);
                          if (TarifaEsIvaIncluido(Tarifa, QMConfPrestaShopEMPRESA.AsInteger)) then
                             price := price + (price * vat / 100);

                          if (id_detalles_s = 0) then
                          begin
                             // Creo linea
                             id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                             Q := THYFIBQuery.Create(nil);
                             try
                                with Q do
                                begin
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND P_IVA = :P_IVA';
                                   Params.ByName['PAIS'].AsString := REntorno.Pais;
                                   Params.ByName['P_IVA'].AsFloat := vat;
                                   ExecQuery;
                                   if (Q.HayDatos) then
                                      TipoIVA := FieldByName['TIPO'].AsInteger
                                   else
                                      TipoIVA := -1;
                                   FreeHandle;
                                end;
                             finally
                                FreeAndNil(Q);
                             end;

                             if (TipoIVA >= 0) then
                             begin
                                Q := THYFIBQuery.Create(nil);
                                try
                                   with Q do
                                   begin
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Clear;
                                      SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ');
                                      SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                      SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA) ');
                                      SQL.Add(' VALUES ');
                                      SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                      SQL.Add(' ''GRNL'', :TIPO_IVA) ');
                                      Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                                      Params.ByName['EJERCICIO'].AsInteger := YearOf(date_add);
                                      Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                                      Params.ByName['SERIE'].AsString := QMConfPrestaShopSERIE.AsString;
                                      Params.ByName['TIPO'].AsString := 'FAC';
                                      Params.ByName['RIG'].AsInteger := RIG;
                                      Params.ByName['LINEA'].AsInteger := 0;
                                      Params.ByName['ARTICULO'].AsString := Articulo;
                                      Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, QMConfPrestaShopEMPRESA.AsInteger);
                                      Params.ByName['UNIDADES'].AsFloat := quantity;
                                      Params.ByName['PRECIO'].AsFloat := price;
                                      Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                      Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                      Params.ByName['ID_S'].AsInteger := id_s;
                                      Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                      ExecQuery;
                                      FreeHandle;
                                   end;
                                finally
                                   FreeAndNil(Q);
                                end;

                                // Ordeno lineas (Muevo linea con 'CUOTA PAYPAL' al final)
                                Q := THYFIBQuery.Create(nil);
                                try
                                   with Q do
                                   begin
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Clear;
                                      SQL.Add(' UPDATE GES_DETALLES_S ');
                                      SQL.Add(' SET ORDEN = (SELECT COALESCE(MAX(ORDEN) + 1, 0) FROM GES_DETALLES_S WHERE ID_S = :ID_S) ');
                                      SQL.Add(' WHERE ');
                                      SQL.Add(' ID_S = :ID_S AND ');
                                      SQL.Add(' TITULO STARTING WITH ''CUOTA PAYPAL'' ');
                                      Params.ByName['ID_S'].AsInteger := id_s;
                                      ExecQuery;
                                      FreeHandle;
                                   end;
                                finally
                                   FreeAndNil(Q);
                                end;

                                // Grabo la relacion
                                Q := THYFIBQuery.Create(nil);
                                try
                                   with Q do
                                   begin
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Clear;
                                      SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_FAC_DET (ID_CONFIGURACION, ID_DETALLES_S, ID_ORDER_DETAIL) ');
                                      SQL.Add(' VALUES (:ID_CONFIGURACION, :ID_DETALLES_S, :ID_ORDER_DETAIL) ');
                                      Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                                      Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                      Params.ByName['ID_ORDER_DETAIL'].AsInteger := id_order_detail;
                                      ExecQuery;
                                      FreeHandle;
                                   end;
                                finally
                                   FreeAndNil(Q);
                                end;
                             end
                             else
                                raise Exception.Create(_('No se pudo determinar el IVA a aplciar (FAC)'));
                          end
                          else
                          begin
                             // Modifico linea
                             Q := THYFIBQuery.Create(nil);
                             try
                                with Q do
                                begin
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Clear;
                                   SQL.Add(' UPDATE VER_DETALLE_FACTURA ');
                                   SQL.Add(' SET ARTICULO = :ARTICULO, TITULO = :TITULO, UNIDADES = :UNIDADES, PRECIO = :PRECIO, ENTRADA = :ENTRADA ');
                                   SQL.Add(' WHERE ID_DETALLES_S = :ID_DETALLES_S ');
                                   Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                   Params.ByName['ARTICULO'].AsString := Articulo;
                                   Params.ByName['TITULO'].AsString := DameTituloArticulo(Articulo, QMConfPrestaShopEMPRESA.AsInteger);
                                   Params.ByName['UNIDADES'].AsFloat := quantity;
                                   Params.ByName['PRECIO'].AsFloat := price;
                                   Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                   ExecQuery;
                                   FreeHandle;
                                end;
                             finally
                                FreeAndNil(Q);
                             end;
                          end;
                       end;
                    end;

                    Result := 0;

                    DMMain.Log('Datos de orden (factura):');
                    DMMain.Log('  id_order : ' + IntToStr(id_order));
                    DMMain.Log('  id_customer : ' + IntToStr(id_customer));
                    DMMain.Log('     - IdCliente : ' + IntToStr(IdCliente));
                    DMMain.Log('     - Cliente : ' + IntToStr(Cliente));
                    DMMain.Log('     - Tercero : ' + IntToStr(Tercero));
                    DMMain.Log('  id_address_invoice : ' + IntToStr(id_address_invoice));
                    DMMain.Log('     - Direccion : ' + IntToStr(Direccion));
                    DMMain.Log('     - Contacto : ' + IntToStr(Contacto));
                    DMMain.Log('  id_address_delivery : ' + IntToStr(id_address_delivery));
                    DMMain.Log('     - DireccionEntrega : ' + IntToStr(DireccionEntrega));
                    DMMain.Log('  id_product : ' + IntToStr(id_product));
                    DMMain.Log('  id_product_attribute : ' + IntToStr(id_product_attribute));
                    DMMain.Log('  id_attribute : ' + id_attribute);
                    DMMain.Log('    - id_a : ' + IntToStr(id_a));
                    DMMain.Log('    - Articulo : ' + Articulo);
                    DMMain.Log('  quantity : ' + FormatFloat(',0.00', quantity));
                    DMMain.Log('  price : ' + FormatFloat(',0.00', price));
                    DMMain.Log('    - TipoIVA : ' + IntToStr(TipoIVA));
                    DMMain.Log('  VAT : ' + FormatFloat(',0.00', VAT));
                    DMMain.Log('  reference : ' + reference);
                    DMMain.Log('  paypal_id_transaction : ' + paypal_id_transaction);
                    DMMain.Log('  paypal_total_paid : ' + FormatFloat(',0.00', paypal_total_paid) + ' (' + spaypal_total_paid + ')');
                    DMMain.Log('  paypal_shipping : ' + FormatFloat(',0.00', paypal_shipping) + ' (' + spaypal_shipping + ')');
                    DMMain.Log('  paypal_currency : ' + paypal_currency);
                    DMMain.Log('  CuotaPaypal : ' + FormatFloat(',0.00', CuotaPaypal));
                    DMMain.Log('  date_add : ' + DateTimeToStr(date_add));
                    DMMain.Log('  date_upd : ' + DateTimeToStr(date_upd));
                    DMMain.Log('  total_shipping_tax_excl : ' + FormatFloat(',0.00', total_shipping_tax_excl));
                    DMMain.Log('  total_shipping_tax_incl : ' + FormatFloat(',0.00', total_shipping_tax_incl));
                    DMMain.Log('  current_state : ' + IntToStr(current_state));
                    DMMain.Log('----------');
                 end
                 else
                 begin
                    Log.Add('Error sincronizando ordenes (factura)');
                    Log.Add('La factura a la que corresponde tiene estado ' + IntToStr(Estado));
                    Log.Add('Datos de orden:');
                    Log.Add('  id_order : ' + IntToStr(id_order));
                    Log.Add('  id_customer : ' + IntToStr(id_customer));
                    Log.Add('     - IdCliente : ' + IntToStr(IdCliente));
                    Log.Add('     - Cliente : ' + IntToStr(Cliente));
                    Log.Add('     - Tercero : ' + IntToStr(Tercero));
                    Log.Add('  id_address_invoice : ' + IntToStr(id_address_invoice));
                    Log.Add('     - Direccion : ' + IntToStr(Direccion));
                    Log.Add('     - Contacto : ' + IntToStr(Contacto));
                    Log.Add('  id_address_delivery : ' + IntToStr(id_address_delivery));
                    Log.Add('     - DireccionEntrega : ' + IntToStr(DireccionEntrega));
                    Log.Add('  id_product : ' + IntToStr(id_product));
                    Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
                    Log.Add('  id_attribute : ' + id_attribute);
                    Log.Add('    - id_a : ' + IntToStr(id_a));
                    Log.Add('    - Articulo : ' + Articulo);
                    Log.Add('  quantity : ' + FormatFloat(',0.00', quantity));
                    Log.Add('  price : ' + FormatFloat(',0.00', price));
                    Log.Add('    - TipoIVA : ' + IntToStr(TipoIVA));
                    Log.Add('  VAT : ' + FormatFloat(',0.00', VAT));
                    Log.Add('  reference : ' + reference);
                    Log.Add('  paypal_id_transaction : ' + paypal_id_transaction);
                    Log.Add('  paypal_total_paid : ' + FormatFloat(',0.00', paypal_total_paid) + ' (' + spaypal_total_paid + ')');
                    Log.Add('  paypal_shipping : ' + FormatFloat(',0.00', paypal_shipping) + ' (' + spaypal_shipping + ')');
                    Log.Add('  paypal_currency : ' + paypal_currency);
                    Log.Add('  CuotaPaypal : ' + FormatFloat(',0.00', CuotaPaypal));
                    Log.Add('  date_add : ' + DateTimeToStr(date_add));
                    Log.Add('  date_upd : ' + DateTimeToStr(date_upd));
                    Log.Add('  total_shipping_tax_excl : ' + FormatFloat(',0.00', total_shipping_tax_excl));
                    Log.Add('  total_shipping_tax_incl : ' + FormatFloat(',0.00', total_shipping_tax_incl));
                    Log.Add('  current_state : ' + IntToStr(current_state));
                 end;
              end;

              DM.QMySQL.Next;
           end; { while }
        except
           on e: Exception do
           begin
              Log.Add('ERROR Sincronizando ordenes (factura) ***********************');
              Log.Add('Datos de orden:');
              Log.Add('  id_order : ' + IntToStr(id_order));
              Log.Add('  id_customer : ' + IntToStr(id_customer));
              Log.Add('     - IdCliente : ' + IntToStr(IdCliente));
              Log.Add('     - Cliente : ' + IntToStr(Cliente));
              Log.Add('     - Tercero : ' + IntToStr(Tercero));
              Log.Add('  id_address_invoice : ' + IntToStr(id_address_invoice));
              Log.Add('     - Direccion : ' + IntToStr(Direccion));
              Log.Add('     - Contacto : ' + IntToStr(Contacto));
              Log.Add('  id_address_delivery : ' + IntToStr(id_address_delivery));
              Log.Add('     - DireccionEntrega : ' + IntToStr(DireccionEntrega));
              Log.Add('  id_product : ' + IntToStr(id_product));
              Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
              Log.Add('  id_attribute : ' + id_attribute);
              Log.Add('    - id_a : ' + IntToStr(id_a));
              Log.Add('    - Articulo : ' + Articulo);
              Log.Add('  quantity : ' + FormatFloat(',0.00', quantity));
              Log.Add('  price : ' + FormatFloat(',0.00', price));
              Log.Add('    - TipoIVA : ' + IntToStr(TipoIVA));
              Log.Add('  VAT : ' + FormatFloat(',0.00', VAT));
              Log.Add('  reference : ' + reference);
              Log.Add('  paypal_id_transaction : ' + paypal_id_transaction);
              Log.Add('  paypal_total_paid : ' + FormatFloat(',0.00', paypal_total_paid) + ' (' + spaypal_total_paid + ')');
              Log.Add('  paypal_shipping : ' + FormatFloat(',0.00', paypal_shipping) + ' (' + spaypal_shipping + ')');
              Log.Add('  paypal_currency : ' + paypal_currency);
              Log.Add('  CuotaPaypal : ' + FormatFloat(',0.00', CuotaPaypal));
              Log.Add('  date_add : ' + DateTimeToStr(date_add));
              Log.Add('  date_upd : ' + DateTimeToStr(date_upd));
              Log.Add('  total_shipping_tax_excl : ' + FormatFloat(',0.00', total_shipping_tax_excl));
              Log.Add('  total_shipping_tax_incl : ' + FormatFloat(',0.00', total_shipping_tax_incl));
              Log.Add('  current_state : ' + IntToStr(current_state));
              Log.Add('Excepcion');
              Log.Add(E.Message);

              HayError := True;
           end;
        end;
     end;
  finally
     DM.Free;
  end;

  if (HayError) then
     Result := -1;
  *)
end;

function TDMSincronizacionTienda.SincronizaCodProvArticulos(Desde, Hasta: TDateTime): integer;
(*
var
  Q : THYFIBQuery;
  i : integer;
  id_supplier : integer;
  id_product : integer;
  id_product_attribute : integer;
  id_attribute : string;
  product_supplier_reference : string;
  product_supplier_price_te : double;
  id_currency : integer;
  articulo : string;
  id_a : integer;
  Proveedor : integer;
  CodigoProveedor : string;
  ExisteProveedor : boolean;
  s : string;
  Rig : integer;
  DM : TDMPrestashop;
*)
begin
  Result := -1;
  { TODO : Implementar mediante webservice }

  (*
  DM := TDMPrestashop.Create(Self);
  try
     DM.SetDSN(QMConfPrestaShopDSN.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     FSendCorreo.Texto(_('Obteniendo Codigos de Proveedor de Articulos'));
     // Tormo todos los articulos
     DM.FiltraCodProvArticulos(0, 999999, Desde, Hasta);
     if (DM.QMySQL.Active) then
     begin
        id_supplier := 0;
        id_product := 0;
        id_product_attribute := 0;
        id_attribute := '';
        product_supplier_reference := '';
        product_supplier_price_te := 0;
        id_currency := 0;
        Articulo := '';
        Proveedor := 0;

        if (not DM.QMySQL.EOF) then
           Result := 0;

        // Recorro la tabla de articulos de Prestashop
        try
           while (not DM.QMySQL.EOF) do
           begin
              id_supplier := DM.QMySQL.FieldByName('id_supplier').AsInteger;
              id_product := DM.QMySQL.FieldByName('id_product').AsInteger;
              id_product_attribute := DM.QMySQL.FieldByName('id_product_attribute').AsInteger;
              id_attribute := DM.QMySQL.FieldByName('id_attribute').AsString;
              product_supplier_reference := Copy(Trim(DM.QMySQL.FieldByName('product_supplier_reference').AsString), 1, 40);
              product_supplier_price_te := DM.QMySQL.FieldByName('product_supplier_price_te').AsFloat;
              id_currency := DM.QMySQL.FieldByName('id_currency').AsInteger;

              id_a := DameIdArticulo(QMConfPrestaShopID.AsInteger, id_product, id_product_attribute, id_attribute);
              Articulo := DameArticulo(id_a);
              Proveedor := DameProveedor(QMConfPrestaShopEMPRESA.AsInteger, DameIdProveedorPrestaShop(QMConfPrestaShopID.AsInteger, id_supplier));

              if (Proveedor <> 0) then
              begin
                 // Limpio el codigo de producto para evitar caracteres que interfieran con el uso de la aplicación.
                 s := product_supplier_reference;
                 product_supplier_reference := '';
                 for i := 1 to Length(s) do
                    if (s[i] in [' ', '%', '?', '"', '''', '_', ';']) then
                       product_supplier_reference := product_supplier_reference + '-'
                    else
                       product_supplier_reference := product_supplier_reference + UpperCase(s[i]);

                 // Verifico si ya tiene un proveedor asignado
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT FIRST (1) PROVEEDOR FROM ART_ARTICULOS_PROVEEDORES ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' ARTICULO = :ARTICULO AND ');
                       SQL.Add(' PROVEEDOR = :PROVEEDOR ');
                       Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                       Params.ByName['ARTICULO'].AsString := Articulo;
                       Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                       ExecQuery;
                       ExisteProveedor := (FieldByName['PROVEEDOR'].AsInteger > 0);
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 // Si ya tiene, le modifico el precio de coste con el de PrestaShop
                 if (ExisteProveedor) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE ART_ARTICULOS_PROVEEDORES ');
                          SQL.Add(' SET P_COSTE = :P_COSTE, ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' EMPRESA = :EMPRESA AND ');
                          SQL.Add(' ARTICULO = :ARTICULO AND ');
                          SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
                          SQL.Add(' P_COSTE <> :P_COSTE ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                          Params.ByName['P_COSTE'].AsFloat := product_supplier_price_te;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Si NO tiene, creo un proveedor para el articulo con el precio de coste de PrestaShop
                 if (not ExisteProveedor) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO ART_ARTICULOS_PROVEEDORES ');
                          SQL.Add(' (EMPRESA, ARTICULO, PROVEEDOR, ACTIVO, P_COSTE, ID_A) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:EMPRESA, :ARTICULO, :PROVEEDOR, :ACTIVO, :P_COSTE, :ID_A) ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                          Params.ByName['ACTIVO'].AsInteger := 1;
                          Params.ByName['P_COSTE'].AsFloat := product_supplier_price_te;
                          Params.ByName['ID_A'].AsInteger := id_a;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Verifico si ya tiene un codigo de proveedor asignado
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT FIRST (1) CODIGO_PROVEEDOR FROM ART_ARTICULOS_CODPROV ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' ARTICULO = :ARTICULO AND ');
                       SQL.Add(' PROVEEDOR = :PROVEEDOR ');
                       Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                       Params.ByName['ARTICULO'].AsString := Articulo;
                       Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                       ExecQuery;
                       CodigoProveedor := Trim(FieldByName['CODIGO_PROVEEDOR'].AsString);
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 // Si ya tiene, lo modifico por el de PrestaShop
                 if ((CodigoProveedor > '') and (product_supplier_reference > '') and (product_supplier_reference <> CodigoProveedor)) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE ART_ARTICULOS_CODPROV ');
                          SQL.Add(' SET CODIGO_PROVEEDOR = :NEWCODIGO_PROVEEDOR ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' EMPRESA = :EMPRESA AND ');
                          SQL.Add(' ARTICULO = :ARTICULO AND ');
                          SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
                          SQL.Add(' CODIGO_PROVEEDOR = :OLDCODIGO_PROVEEDOR ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                          Params.ByName['OLDCODIGO_PROVEEDOR'].AsString := CodigoProveedor;
                          Params.ByName['NEWCODIGO_PROVEEDOR'].AsString := product_supplier_reference;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Si NO tiene, inserto el de PrestaShop
                 if ((CodigoProveedor = '') and (product_supplier_reference > '')) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO ART_ARTICULOS_CODPROV ');
                          SQL.Add(' (EMPRESA, ARTICULO, PROVEEDOR, CODIGO_PROVEEDOR, ID_A) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:EMPRESA, :ARTICULO, :PROVEEDOR, :CODIGO_PROVEEDOR, :ID_A) ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                          Params.ByName['CODIGO_PROVEEDOR'].AsString := product_supplier_reference;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Crear condicion especial de compra
                 if (product_supplier_price_te > 0) then
                 begin
                    // Miro si ya hay una condicion especial de compra
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' SELECT RIG FROM ART_COND_COM_C ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' EMPRESA = :EMPRESA AND ');
                          SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                          SQL.Add(' CANAL = :CANAL AND ');
                          SQL.Add(' TIPO = :TIPO AND ');
                          SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
                          SQL.Add(' ARTICULO = :ARTICULO ');
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                          Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                          Params.ByName['TIPO'].AsString := 'PRA';
                          Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                          Params.ByName['ARTICULO'].AsString := Articulo;
                          ExecQuery;
                          Rig := FieldByName['RIG'].AsInteger;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    // Si existe modifico el precio
                    if (Rig <> 0) then
                    begin
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE ART_COND_COM_D ');
                             SQL.Add(' SET PRECIO = :PRECIO ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' EMPRESA = :EMPRESA AND ');
                             SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                             SQL.Add(' CANAL = :CANAL AND ');
                             SQL.Add(' TIPO = :TIPO AND ');
                             SQL.Add(' RIG = :RIG AND ');
                             SQL.Add(' LINEA = :LINEA ');
                             Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                             Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                             Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                             Params.ByName['TIPO'].AsString := 'PRA';
                             Params.ByName['RIG'].AsInteger := Rig;
                             Params.ByName['LINEA'].AsInteger := 1;
                             Params.ByName['PRECIO'].AsFloat := product_supplier_price_te;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                    end
                    else
                    begin
                       // Obtengo el nro de RIG
                       Rig := DMMain.Contador_EEC('PRA', QMConfPrestaShopEMPRESA.AsInteger, REntorno.Ejercicio, QMConfPrestaShopCANAL.AsInteger);

                       // Inserto cabecera de condicion especial
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO ART_COND_COM_C ');
                             SQL.Add(' (EMPRESA, EJERCICIO, CANAL, TIPO, RIG, PROVEEDOR, ARTICULO, ALTA, BAJA, ACTIVO) ');
                             SQL.Add(' VALUES ');
                             SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :TIPO, :RIG, :PROVEEDOR, :ARTICULO, ''01.01.1900'', ''31.12.3000'', 1) ');
                             Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                             Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                             Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                             Params.ByName['TIPO'].AsString := 'PRA';
                             Params.ByName['RIG'].AsInteger := Rig;
                             Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                             Params.ByName['ARTICULO'].AsString := Articulo;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;

                       // Inserto linea de condicion especial
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO ART_COND_COM_D ');
                             SQL.Add(' (EMPRESA, EJERCICIO, CANAL, TIPO, RIG, LINEA, UNID_MINIMAS, PRECIO, DESCUENTO, DESCUENTO_2, DESCUENTO_3) ');
                             SQL.Add(' VALUES ');
                             SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :TIPO, :RIG, 0, 0, :PRECIO, :DESCUENTO, :DESCUENTO_2, :DESCUENTO_3) ');
                             Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                             Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                             Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                             Params.ByName['TIPO'].AsString := 'PRA';
                             Params.ByName['RIG'].AsInteger := Rig;
                             Params.ByName['PRECIO'].AsFloat := product_supplier_price_te;
                             Params.ByName['DESCUENTO'].AsFloat := 0;
                             Params.ByName['DESCUENTO_2'].AsFloat := 0;
                             Params.ByName['DESCUENTO_3'].AsFloat := 0;
                             ExecQuery;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                    end;
                 end;

                 DMMain.Log('Datos de proveedor/producto:');
                 DMMain.Log('  id_supplier : ' + IntToStr(id_supplier));
                 DMMain.Log('  id_product : ' + IntToStr(id_product));
                 DMMain.Log('  id_product_attribute : ' + IntToStr(id_product_attribute));
                 DMMain.Log('  id_attribute : ' + id_attribute);
                 DMMain.Log('  product_supplier_reference : ' + product_supplier_reference);
                 DMMain.Log('  product_supplier_price_te : ' + FloatToStr(product_supplier_price_te));
                 DMMain.Log('  id_currency : ' + IntToStr(id_currency));
                 DMMain.Log('  Articulo : ' + Articulo);
                 DMMain.Log('  Proveedor : ' + IntToStr(Proveedor));
                 DMMain.Log('----------');
              end;

              id_product := -1;
              DM.QMySQL.Next;
              id_product_attribute := -1;
              id_attribute := '';
           end; { while }
        except
           on e: Exception do
           begin
              Log.Add('ERROR Sincronizando codigo proveedor articulos **************');
              Log.Add('Datos de proveedor/producto:');
              Log.Add('  id_supplier : ' + IntToStr(id_supplier));
              Log.Add('  id_product : ' + IntToStr(id_product));
              Log.Add('  id_product_attribute : ' + IntToStr(id_product_attribute));
              Log.Add('  id_attribute : ' + id_attribute);
              Log.Add('  product_supplier_reference : ' + product_supplier_reference);
              Log.Add('  product_supplier_price_te : ' + FloatToStr(product_supplier_price_te));
              Log.Add('  id_currency : ' + IntToStr(id_currency));
              Log.Add('  Articulo : ' + Articulo);
              Log.Add('  Proveedor : ' + IntToStr(Proveedor));
              Log.Add('Excepcion');
              Log.Add(E.Message);

              Result := -1;
           end;
        end;
     end;
  finally
     DM.Free;
  end;
  *)
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopNewRecord(DataSet: TDataSet);
begin
  QMConfPrestaShopEMPRESA.AsInteger := REntorno.Empresa;
  QMConfPrestaShopCANAL.AsInteger := REntorno.Canal;
  QMConfPrestaShopSERIE.AsString := REntorno.Serie;
  QMConfPrestaShopPREFIJO_ART.AsString := '';
  QMConfPrestaShopALMACEN.AsString := REntorno.AlmacenDefecto;
  QMConfPrestaShopAGENTE.AsInteger := -1;
  QMConfPrestaShopACTIVO.AsInteger := 0;
  QMConfPrestaShopSOLO_CLIENTE_CON_PEDIDO.AsInteger := 1;
  QMConfPrestaShopUTILIZA_MODULO_PAYPAL.AsInteger := 0;
  QMConfPrestaShopART_SIN_CONTROL_STOCK.AsInteger := 0;
  QMConfPrestaShopUTILIZA_REF_PRESTAHOP.AsInteger := 0;
  QMConfPrestaShopID_TIENDA_ARTICULOS.AsInteger := 0;
  QMConfPrestaShopMANTENER_DESCRIPCIONES.AsInteger := 0;
  QMConfPrestaShopMANTENER_PRECIO.AsInteger := 0;
  QMConfPrestaShopCLIENTE_BASE.AsInteger := 0;
  QMConfPrestaShopIMPORTAR_ARTICULOS_VARIOS.AsInteger := 0;
  // Webservice
  QMConfPrestaShopWS_URL.AsString := '';
  QMConfPrestaShopWS_KEY.AsString := '';
  QMConfPrestaShopWS_VERSION.AsString := '';
  QMConfPrestaShopWS_DEBUG.AsInteger := 0;
  QMConfPrestaShopWS_LANGUAGE.AsInteger := 0;
  QMConfPrestaShopWS_ORDER_STATE.AsInteger := 0;
end;

procedure TDMSincronizacionTienda.SincronizaTodas(aSincronizarcionAutomatica: boolean = False);
begin
  SincronizarcionAutomatica := aSincronizarcionAutomatica;

  with QMConfPrestaShop do
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

procedure TDMSincronizacionTienda.QMConfPrestaShopClienteCLIENTEChange(Sender: TField);
begin
  QMConfPrestaShopClienteID_CLIENTE.AsInteger := DameIDCliente(QMConfPrestaShopClienteCLIENTE.AsInteger, QMConfPrestaShopEMPRESA.AsInteger);
  QMConfPrestaShopClienteTERCERO.AsInteger := DameTercero('CLI', QMConfPrestaShopClienteCLIENTE.AsInteger, QMConfPrestaShopEMPRESA.AsInteger);
  QMConfPrestaShopClienteNOMBRE_R_SOCIAL.AsString := DameTituloTercero(QMConfPrestaShopClienteTERCERO.AsInteger);
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopClienteDirCLIENTEChange(Sender: TField);
var
  Direccion : string;
begin
  QMConfPrestaShopClienteDirTERCERO.AsInteger := DameTercero('CLI', QMConfPrestaShopClienteDirCLIENTE.AsInteger, QMConfPrestaShopEMPRESA.AsInteger);
  QMConfPrestaShopClienteDirNOMBRE_R_SOCIAL.AsString := DameTituloTercero(QMConfPrestaShopClienteDirTERCERO.AsInteger);
  Direccion := DameDireccionTercero(QMConfPrestaShopClienteDirTERCERO.AsInteger, QMConfPrestaShopClienteDirDIRECCION.AsInteger);
  if (Direccion = '') then
     QMConfPrestaShopClienteDirDIRECCION.AsInteger := 1;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopClienteDirDIRECCIONChange(Sender: TField);
begin
  QMConfPrestaShopClienteDirDIR_COMPLETA_N.AsString := DameDireccionTercero(QMConfPrestaShopClienteDirTERCERO.AsInteger, QMConfPrestaShopClienteDirDIRECCION.AsInteger);
end;

function TDMSincronizacionTienda.SincronizaCarriers(Desde, Hasta: TDateTime): boolean;
var
  i : integer;
  id : integer;
  nombre : string;
  // date_upd : string;
  //carrier_active : integer;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  Log.Add(_('Obteniendo Carriers'));
  /// Sincroniza manufacturers con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  FSendCorreo.Texto(_('Obteniendo Carriers'));
  Result := False;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los fabricantes activos
     Opciones := '&display=full';
     {
     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + '&filter[active]=[1]';
     }
     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('carriers', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-carriers.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['carriers']);
           if Assigned(NodoPadre) then
           begin
              Result := False;

              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToInt(DameDato(Nodo, ['id']));
                 nombre := DameDato(Nodo, ['name']);
                 //carrier_active := StrToInt(DameDato(Nodo, ['active']));

                 // Trato de sincronizar una vez por 12 horas
                 // Log.Add(Format(_('%s < %s'), [FormatDateTime('yyyy-mm-dd hh:nn:ss', IncHour(Desde,12)), FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)]));
                 if (IncHour(Desde, 12) < Now) then
                 begin
                    // Sincronizo todos porque no tengo fecha de ultima modificacion
                    // if (carrier_active = 1) then
                    // begin
                    // Sincronizo. Espero numero de id si es correcto.
                    if (SincronizaUnCarrier(id) <> 0) then
                       Result := True;
                    // end;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(carriers)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaUnCarrier(id: integer): integer;
var
  //i : integer;
  nombre : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  //Nodo : IXMLNode;
begin
  /// Si se realiza con exito devuelve el numero de carrier

  Log.Add(Format(_('Sincronizando carrier %d'), [id]));
  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMPrestashop.WS_Get('carriers', id, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Carrier.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Obtengo datos del fabricante
           NodoPadre := DameNodo(Documento.DocumentElement, ['carrier']);
           if Assigned(NodoPadre) then
           begin
              id := StrToInt(DameDato(NodoPadre, ['id']));
              nombre := Copy(DameDato(NodoPadre, ['name']), 1, 256);

              FSendCorreo.Texto(Format(_('Carrier: %d - %s'), [id, nombre]));

              // Asigno ID_PRESTASHOP al Fabricante
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_CARRIER ( ');
                    SQL.Add(' ID_CONFIGURACION, ID_CARRIER, DELETED, IS_MODULE, ID_TAX_RULES_GROUP, ID_REFERENCE, NAME, CARRIER_ACTIVE, IS_FREE, URL, ');
                    SQL.Add(' SHIPPING_HANDLING, SHIPPING_EXTERNAL, RANGE_BEHAVIOR, SHIPPING_METHOD, MAX_WIDTH, MAX_HEIGHT, MAX_DEPTH, MAX_WEIGHT, ');
                    SQL.Add(' GRADE, EXTERNAL_MODULE_NAME, NEED_RANGE, CARRIER_POSITION, DELAY) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :ID_CONFIGURACION, :ID_CARRIER, :DELETED, :IS_MODULE, :ID_TAX_RULES_GROUP, :ID_REFERENCE, :NAME, :CARRIER_ACTIVE, ');
                    SQL.Add(' :IS_FREE, :URL, :SHIPPING_HANDLING, :SHIPPING_EXTERNAL, :RANGE_BEHAVIOR, :SHIPPING_METHOD, :MAX_WIDTH, :MAX_HEIGHT, ');
                    SQL.Add(' :MAX_DEPTH, :MAX_WEIGHT, :GRADE, :EXTERNAL_MODULE_NAME, :NEED_RANGE, :CARRIER_POSITION, :DELAY) ');
                    SQL.Add(' MATCHING (ID_CONFIGURACION, ID_CARRIER) ');
                    Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                    Params.ByName['ID_CARRIER'].AsInteger := id;
                    Params.ByName['DELETED'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['deleted']), 0);
                    Params.ByName['IS_MODULE'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['is_module']), 0);
                    Params.ByName['ID_TAX_RULES_GROUP'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['id_tax_rules_group']), 0);
                    Params.ByName['ID_REFERENCE'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['id_reference']), 0);
                    Params.ByName['NAME'].AsString := nombre;
                    Params.ByName['CARRIER_ACTIVE'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['active']), 0);
                    Params.ByName['IS_FREE'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['is_free']), 0);
                    Params.ByName['URL'].AsString := Copy(DameDato(NodoPadre, ['url']), 1, 256);
                    Params.ByName['SHIPPING_HANDLING'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['shipping_handling']), 0);
                    Params.ByName['SHIPPING_EXTERNAL'].AsString := Copy(DameDato(NodoPadre, ['shipping_external']), 1, 256);
                    Params.ByName['RANGE_BEHAVIOR'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['range_behavior']), 0);
                    Params.ByName['SHIPPING_METHOD'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['shipping_method']), 0);
                    Params.ByName['MAX_WIDTH'].AsFloat := StrToFloatDec(DameDato(NodoPadre, ['max_width']), '.');
                    Params.ByName['MAX_HEIGHT'].AsFloat := StrToFloatDec(DameDato(NodoPadre, ['max_height']), '.');
                    Params.ByName['MAX_DEPTH'].AsFloat := StrToFloatDec(DameDato(NodoPadre, ['max_depth']), '.');
                    Params.ByName['MAX_WEIGHT'].AsFloat := StrToFloatDec(DameDato(NodoPadre, ['max_weight']), '.');
                    Params.ByName['GRADE'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['grade']), 0);
                    Params.ByName['EXTERNAL_MODULE_NAME'].AsString := Copy(DameDato(NodoPadre, ['external_module_name']), 1, 256);
                    Params.ByName['NEED_RANGE'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['need_range']), 0);
                    Params.ByName['CARRIER_POSITION'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['position']), 0);
                    Params.ByName['DELAY'].AsString := Copy(DameDato(NodoPadre, ['delay']), 1, 256);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Log[Log.Count - 1] := Format(_('Sincronizando carrier %d - %s'), [id, nombre]);
              Result := id;
           end;
        end;
     end
     else
        ShowMessage('(carrier)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaFabricantes(Desde, Hasta: TDateTime): boolean;
var
  i : integer;
  id : integer;
  nombre : string;
  date_upd : string;
  manufacturer_active : integer;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  Log.Add(_('Obteniendo Fabricantes'));
  /// Sincroniza manufacturers con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  FSendCorreo.Texto(_('Obteniendo Fabricantes'));
  Result := False;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los fabricantes activos
     Opciones := '&display=[id,name,active,date_upd]';
     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + '&filter[active]=[1]';
     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('manufacturers', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-manufacturers.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
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
                 manufacturer_active := StrToInt(DameDato(Nodo, ['active']));
                 date_upd := DameDato(Nodo, ['date_upd']);

                 // Si la fecha de modificacion esta dentro de los parametros
                 if ((date_upd > FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
                    (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
                 begin
                    if (manufacturer_active = 1) then
                    begin
                       // Sincronizo. Espero numero de id si es correcto.
                       if (SincronizaUnFabricante(id) = 0) then
                          Result := False;
                    end;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(manufacturers)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaUnFabricante(id: integer): integer;
var
  i : integer;
  id_address : integer;
  nombre : string;
  date_upd : string;
  Tercero, TerceroAsociado : integer;
  DireccionAsociada : integer;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  ATercero : TTercero;
begin
  /// Sincroniza el manufacturer con un tercero.
  /// Si se realiza con exito devuelve el numero de tercero asociado

  Log.Add(Format(_('Sincronizando fabricante %d'), [id]));
  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMPrestashop.WS_Get('manufacturers', id, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Manufacturer.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
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

              TerceroAsociado := DameFabricante(QMConfPrestaShopEMPRESA.AsInteger, DameIdFabricantePrestaShop(QMConfPrestaShopID.AsInteger, id));

              if NodoPadre.ChildNodes.Count = 0 then
              begin
                 // Si no tiene direccion en Prestashop, lo creo como tercero con direccion desconocida;
                 InicializaTercero(ATercero);

                 DireccionAsociada := DameDireccionPrestaShop(QMConfPrestaShopID.AsInteger, -1, TerceroAsociado);

                 with ATercero do
                 begin
                    NombreRSocial := Copy(nombre, 1, 60);
                    Nif := '';
                    Tercero := TerceroAsociado;
                    // Debo al menos poner este texto para que cree una direccion asociada al tercero.
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
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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
        ShowMessage('(manufacturer)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaCategorias(Desde, Hasta: TDateTime): boolean;
var
  i : integer;
  id : integer;
  nombre : string;
  date_upd : string;
  //category_active : integer;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  Log.Add(_('Obteniendo Categorias'));
  /// Sincroniza manufacturers con modificaciones entre la fechas del parametro.
  /// Si finaliza correctamente devuelve
  FSendCorreo.Texto(_('Obteniendo Categorias'));
  Result := False;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de las categorias
     Opciones := '&display=[id,name,active,date_upd]';
     {
     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + '&filter[active]=[1]';
     }
     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('categories', 0, Opciones, Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-categories.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           NodoPadre := DameNodo(Documento.DocumentElement, ['categories']);
           if Assigned(NodoPadre) then
           begin
              Result := True;
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToInt(DameDato(Nodo, ['id']));
                 nombre := DameDato(Nodo, ['name']);
                 //category_active := StrToInt(DameDato(Nodo, ['active']));
                 date_upd := DameDato(Nodo, ['date_upd']);

                 // Si la fecha de modificacion esta dentro de los parametros
                 if ((date_upd > FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
                    (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
                 begin
                    // if (category_active = 1) then
                    // begin
                    // Sincronizo. Espero numero de id si es correcto.
                    if (SincronizaUnaCategoria(id) = 0) then
                       Result := False;
                    // end;
                 end;
              end;
           end;
        end;
     end
     else
        ShowMessage('(categories)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaUnaCategoria(id: integer): integer;
var
  //i : integer;
  //id_address : integer;
  nombre : string;
  date_upd : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  //Nodo : IXMLNode;
begin
  /// Si se realiza con exito devuelve el numero de categoria

  Log.Add(Format(_('Sincronizando categoria %d'), [id]));
  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMPrestashop.WS_Get('categories', id, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Category.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Obtengo datos del fabricante
           NodoPadre := DameNodo(Documento.DocumentElement, ['category']);
           if Assigned(NodoPadre) then
           begin
              id := StrToInt(DameDato(NodoPadre, ['id']));
              nombre := Copy(DameDato(NodoPadre, ['name']), 1, 256);
              date_upd := DameDato(NodoPadre, ['date_upd']);

              FSendCorreo.Texto(Format(_('Categoria: %d - %s' + #13#10 + 'Modificado: %s'), [id, nombre, date_upd]));

              // Asigno ID_PRESTASHOP al Fabricante
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_CATEGORY ( ');
                    SQL.Add(' ID_CONFIGURACION, ID_CATEGORY, ID_PARENT, CATEGORY_ACTIVE, ID_SHOP_DEFAULT, IS_ROOT_CATEGORY, CATEGORY_POSITION, ');
                    SQL.Add(' DATE_ADD, DATE_UPD, NAME, DESCRIPTION) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :ID_CONFIGURACION, :ID_CATEGORY, :ID_PARENT, :CATEGORY_ACTIVE, :ID_SHOP_DEFAULT, :IS_ROOT_CATEGORY, :CATEGORY_POSITION, ');
                    SQL.Add(' :DATE_ADD, :DATE_UPD, :NAME, :DESCRIPTION) ');
                    SQL.Add(' MATCHING (ID_CONFIGURACION, ID_CATEGORY) ');
                    Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                    Params.ByName['ID_CATEGORY'].AsInteger := id;
                    Params.ByName['ID_PARENT'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['id_parent']), 0);
                    Params.ByName['CATEGORY_ACTIVE'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['active']), 0);
                    Params.ByName['ID_SHOP_DEFAULT'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['id_shop_default']), 0);
                    Params.ByName['IS_ROOT_CATEGORY'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['is_root_category']), 0);
                    Params.ByName['CATEGORY_POSITION'].AsInteger := StrToIntDef(DameDato(NodoPadre, ['position']), 0);
                    Params.ByName['DATE_ADD'].AsDateTime := DateISO8601ToDateTime(DameDato(NodoPadre, ['date_add']));
                    Params.ByName['DATE_UPD'].AsDateTime := DateISO8601ToDateTime(date_upd);
                    Params.ByName['NAME'].AsString := nombre;
                    Params.ByName['DESCRIPTION'].AsString := Copy(DameDato(NodoPadre, ['description']), 1, 256);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              Log[Log.Count - 1] := Format(_('Sincronizando categoria %d - %s - Modificado: %s'), [id, nombre, date_upd]);
              Result := id;
           end;
        end;
     end
     else
        ShowMessage('(categories)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaUnaDireccion(IdConfiguracion, id: integer; TerceroAsociado: integer = 0): integer;
var
  id_customer : integer;
  id_manufacturer : integer;
  id_supplier : integer;
  id_warehouse : integer;

  company : string;
  lastname : string;
  firstname : string;

  alias : string;
  address1 : string;
  address2 : string;
  id_country : integer;
  id_state : integer;
  city : string;
  postcode : string;

  phone : string;
  phone_mobile : string;

  PaisCustomer : string;
  vat_number : string;
  dni : string;
  date_add, date_upd : string;
  deleted : integer;

  Valido : boolean;
  MensajeError : string;
  s : string;

  ATercero : TTercero;
  DireccionAsociada : integer;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
begin
  /// Si el tercero es 0, lo busco por NIF y si no lo encuentro, lo creo.
  /// Si es diferente de 0 agrego la dirección sin importar si el NIF es diferente.
  /// Devuelve el tercero creado/modificado.
  id_customer := 0;
  id_manufacturer := 0;
  id_supplier := 0;
  id_warehouse := 0;
  id_country := 0;
  id_state := 0;
  Log.Add(Format(_('Sincronizando direccion %d'), [id]));
  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMPrestashop.WS_Get('addresses', id, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Address.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Recorro los fabricantes
           Nodo := DameNodo(Documento.DocumentElement, ['address']);
           if Assigned(Nodo) then
           begin
              id := StrToInt(DameDato(Nodo, ['id']));
              alias := Copy(DameDato(Nodo, ['alias']), 1, 40);
              company := DameDato(Nodo, ['company']);
              lastname := DameDato(Nodo, ['lastname']);
              firstname := DameDato(Nodo, ['firstname']);

              address1 := DameDato(Nodo, ['address1']);
              address2 := DameDato(Nodo, ['address2']);
              id_country := StrToIntDef(DameDato(Nodo, ['id_country']), 0);
              id_state := StrToIntDef(DameDato(Nodo, ['id_state']), 0);
              city := DameDato(Nodo, ['city']);
              postcode := Copy(UpperCase(Trim(DameDato(Nodo, ['postcode']))), 1, 40);

              phone := Copy(DameDato(Nodo, ['phone']), 1, 20);
              phone_mobile := Copy(DameDato(Nodo, ['phone_mobile']), 1, 20);
              vat_number := DameDato(Nodo, ['vat_number']);
              dni := DameDato(Nodo, ['dni']);

              deleted := StrToIntDef(DameDato(Nodo, ['deleted']), 0);

              date_add := DameDato(Nodo, ['date_add']);
              date_upd := DameDato(Nodo, ['date_upd']);
           end;

           PaisCustomer := DamePais(IdConfiguracion, id_country);
           vat_number := Copy(LimpiaNIF(PaisCustomer, vat_number), 1, 20);
           dni := Copy(LimpiaNIF(PaisCustomer, dni), 1, 20);

           id_customer := StrToIntDef(DameDato(Nodo, ['id_customer']), 0);
           id_manufacturer := StrToIntDef(DameDato(Nodo, ['id_manufacturer']), 0);
           id_supplier := StrToIntDef(DameDato(Nodo, ['id_supplier']), 0);
           id_warehouse := StrToIntDef(DameDato(Nodo, ['id_warehouse']), 0);

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_ADDRESSES ( ');
                 SQL.Add(' ID_CONFIGURACION, ID_ADDRESS, ID_CUSTOMER, ID_MANUFACTURER, ID_SUPPLIER, ID_WAREHOUSE, ID_COUNTRY, ID_STATE, ALIAS, ');
                 SQL.Add(' COMPANY, LASTNAME, FIRSTNAME, VAT_NUMBER, ADDRESS1, ADDRESS2, POSTCODE, CITY, OTHER, PHONE, PHONE_MOBILE, DNI, DELETED, ');
                 SQL.Add(' DATE_ADD, DATE_UPD/*, RAW_XML*/) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :ID_CONFIGURACION, :ID_ADDRESS, :ID_CUSTOMER, :ID_MANUFACTURER, :ID_SUPPLIER, :ID_WAREHOUSE, :ID_COUNTRY, :ID_STATE, ');
                 SQL.Add(' :ALIAS, :COMPANY, :LASTNAME, :FIRSTNAME, :VAT_NUMBER, :ADDRESS1, :ADDRESS2, :POSTCODE, :CITY, :OTHER, :PHONE, ');
                 SQL.Add(' :PHONE_MOBILE, :DNI, :DELETED, :DATE_ADD, :DATE_UPD/*, RAW_XML*/) ');
                 SQL.Add(' MATCHING (ID_CONFIGURACION, ID_ADDRESS) ');
                 Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                 Params.ByName['ID_ADDRESS'].AsInteger := id;
                 Params.ByName['ID_CUSTOMER'].AsInteger := id_customer;
                 Params.ByName['ID_MANUFACTURER'].AsInteger := id_manufacturer;
                 Params.ByName['ID_SUPPLIER'].AsInteger := id_supplier;
                 Params.ByName['ID_WAREHOUSE'].AsInteger := id_warehouse;
                 Params.ByName['ID_COUNTRY'].AsInteger := id_country;
                 Params.ByName['ID_STATE'].AsInteger := id_state;
                 Params.ByName['ALIAS'].AsString := alias;
                 Params.ByName['COMPANY'].AsString := company;
                 Params.ByName['LASTNAME'].AsString := lastname;
                 Params.ByName['FIRSTNAME'].AsString := firstname;
                 Params.ByName['VAT_NUMBER'].AsString := vat_number;
                 Params.ByName['ADDRESS1'].AsString := address1;
                 Params.ByName['ADDRESS2'].AsString := address2;
                 Params.ByName['POSTCODE'].AsString := postcode;
                 Params.ByName['CITY'].AsString := city;
                 Params.ByName['OTHER'].AsString := DameDato(Nodo, ['other']);
                 Params.ByName['PHONE'].AsString := phone;
                 Params.ByName['PHONE_MOBILE'].AsString := phone_mobile;
                 Params.ByName['DNI'].AsString := dni;
                 Params.ByName['DELETED'].AsInteger := deleted;
                 Params.ByName['DATE_ADD'].AsDateTime := DateISO8601ToDateTime(date_add);
                 Params.ByName['DATE_UPD'].AsDateTime := DateISO8601ToDateTime(date_upd);
                 // Aparentemente esto hace que la base crezca mucho
                 // Params.ByName['RAW_XML'].AsString := Respuesta.Text;
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
        if not SincronizarcionAutomatica then
           ShowMessage('(addresses)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text)
        else
           Log.Add('(addresses)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     end;
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  // Si dni viene vacio utilizo vat_number (se da en caso de extranjeros)
  if (dni = '') then
     dni := vat_number;

  Valido := True;
  MensajeError := '';
  DMMain.VerificaDocumentoIdentificacion(PaisCustomer, 'NIF', dni, Valido, MensajeError);

  // Log.Add(Format('EnviaMensajeUsuario(%d, PaisCustomer=%s - dni=%s - MensajeError=%s)', [DameUsuarioWarning(IdConfiguracion), PaisCustomer, dni, MensajeError]));

  if not Valido then
  begin
     try
        s := _('Nro. Identificacion Fiscal Erroneo');
        if id_customer <> 0 then
           s := s + #13#10 + format('id_customer: %d', [id_customer]);
        if id_manufacturer <> 0 then
           s := s + #13#10 + format('id_manufacturer: %d', [id_manufacturer]);
        if id_supplier <> 0 then
           s := s + #13#10 + format('id_supplier: %d', [id_supplier]);
        if id_warehouse <> 0 then
           s := s + #13#10 + format('id_warehouse: %d', [id_warehouse]);
        s := s + #13#10 + format('d_address: %d', [id]);
        s := s + #13#10 + format('country: %d - %s', [id_country, PaisCustomer]);
        s := s + #13#10 + format('dni / vat_number: %s', [dni]);
        s := s + #13#10 + MensajeError;

        if SincronizarcionAutomatica then
        begin
           try
              DMMain.EnviaMensajeUsuario(DameUsuarioWarning(IdConfiguracion), s);
           except
           end;
        end
        else
        begin
           Valido := ConfirmaMensaje(s + #13#10 + _('Desea importar de todos modos?'));
        end;

        Log.Add(Format(_('NIF "%s" no es valido') + #13#10 + s, [dni]));
     except
     end;
  end;

  if Valido then
  begin
     DireccionAsociada := DameDireccionPrestaShop(IdConfiguracion, id, TerceroAsociado);

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

        Pais := PaisCustomer;
        CodigoPostal := postcode;
        Provincia := DameEstado(IdConfiguracion, id_state, Pais, CodigoPostal);
        Localidad := city;
        DirNombre1 := Copy(address1, 1, 40);
        DirNombre2 := Copy(address2, 1, 40);
        DirNombre3 := Copy(company, 1, 40);
        DirTelefono1 := Copy(phone, 1, 15);
        DirTelefono2 := Copy(phone_mobile, 1, 15);
        Notas := 'Importacion Prestashop:';
        Notas := Notas + #13#10 + Format('id: %d', [id]);
        Notas := Notas + #13#10 + Format('address1: %s', [address1]);
        Notas := Notas + #13#10 + Format('address2: %s', [address2]);
        Notas := Notas + #13#10 + Format('city: %s', [city]);
        Notas := Notas + #13#10 + Format('postcode: %s', [postcode]);
        Notas := Notas + #13#10 + Format('Pais: %s', [Pais]);
        Notas := Notas + #13#10 + Format('phone: %s', [phone]);
        Notas := Notas + #13#10 + Format('phone_mobile: %s', [phone_mobile]);
        Notas := Notas + #13#10 + Format('vat_number: %s', [vat_number]);
        Notas := Notas + #13#10 + Format('dni: %s', [dni]);
        Notas := Notas + #13#10 + Format('date_upd: %s', [date_upd]);
     end;

     // Esto crea/modifica el tercero y la direccion
     CreaTercero(ATercero);

     // Si no habia direccion le creo un contacto asociado y la relaciono a la direccion Prestashop
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
  end;
end;

function TDMSincronizacionTienda.DameLocalidad(IdConfiguracion, IdCountry, IdState: integer; City, PostCode: string): string;
var
  Pais, Provincia : string;
begin
  Result := '';
  Pais := DamePais(IdConfiguracion, IdCountry);
  Provincia := DameEstado(IdConfiguracion, IdState, Pais, PostCode);

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
  end;
end;

function TDMSincronizacionTienda.DamePais(IdConfiguracion, IdCountry: integer): string;
var
  id : integer;
  iso_code : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
begin
  Result := '';
  iso_code := '';

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del pais
     CodigoRespuesta := DMPrestashop.WS_Get('countries', IdCountry, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-countries.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
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

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_COUNTRIES ( ');
                 SQL.Add(' ID_CONFIGURACION, ID_COUNTRY, ID_ZONE, ID_CURRENCY, CALL_PREFIX, ISO_CODE, IS_ACTIVE, CONTAINS_STATES, ');
                 SQL.Add(' NEED_IDENTIFICATION_NUMBER, NEED_ZIP_CODE, ZIP_CODE_FORMAT, DISPLAY_TAX_LABEL, NAME/*, RAW_XML*/) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :ID_CONFIGURACION, :ID_COUNTRY, :ID_ZONE, :ID_CURRENCY, :CALL_PREFIX, :ISO_CODE, :IS_ACTIVE, :CONTAINS_STATES, ');
                 SQL.Add(' :NEED_IDENTIFICATION_NUMBER, :NEED_ZIP_CODE, :ZIP_CODE_FORMAT, :DISPLAY_TAX_LABEL, :NAME/*, RAW_XML*/) ');
                 SQL.Add(' MATCHING (ID_CONFIGURACION, ID_COUNTRY) ');

                 Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                 Params.ByName['ID_ZONE'].AsInteger := StrToIntDef(DameDato(Nodo, ['id_zone']), 0);
                 Params.ByName['ID_COUNTRY'].AsInteger := id;
                 Params.ByName['ID_CURRENCY'].AsInteger := StrToIntDef(DameDato(Nodo, ['id_currency']), 0);
                 Params.ByName['CALL_PREFIX'].AsString := DameDato(Nodo, ['call_prefix']);
                 Params.ByName['ISO_CODE'].AsString := iso_code;
                 Params.ByName['IS_ACTIVE'].AsInteger := StrToIntDef(DameDato(Nodo, ['active']), 0);
                 Params.ByName['CONTAINS_STATES'].AsInteger := StrToIntDef(DameDato(Nodo, ['contains_states']), 0);
                 Params.ByName['NEED_IDENTIFICATION_NUMBER'].AsInteger := StrToIntDef(DameDato(Nodo, ['need_identification_number']), 0);
                 Params.ByName['NEED_ZIP_CODE'].AsInteger := StrToIntDef(DameDato(Nodo, ['need_zip_code']), 0);
                 Params.ByName['ZIP_CODE_FORMAT'].AsString := DameDato(Nodo, ['zip_code_format']);
                 Params.ByName['DISPLAY_TAX_LABEL'].AsInteger := StrToIntDef(DameDato(Nodo, ['display_tax_label']), 0);
                 Params.ByName['NAME'].AsString := DameDato(Nodo, ['name']);
                 // Aparentemente esto hace que la base crezca mucho
                 // Params.ByName['RAW_XML'].AsString := Respuesta.Text;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

        end;
     end
     else
        ShowMessage('(countries)' + _('No se ha podido obtener datos de Prestashop. (DamePais)') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  Result := UDameDato.DamePais(iso_code);
end;

function TDMSincronizacionTienda.DameEstado(IdConfiguracion, IdState: integer; Pais: string; CodigoPostal: string = ''): string;
var
  id : integer;
  iso_code : string;
  state_name : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
begin
  Result := '';
  iso_code := '';
  state_name := '';

  if (IdState <> 0) then
  begin
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Obtengo datos del estado
        CodigoRespuesta := DMPrestashop.WS_Get('states', IdState, '', Respuesta);

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
                 iso_code := Trim(DameDato(Nodo, ['iso_code']));
                 state_name := Trim(DameDato(Nodo, ['name']));
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_STATES ( ');
                 SQL.Add(' ID_CONFIGURACION, ID_STATE, ID_COUNTRY, ID_ZONE, ISO_CODE, NAME, IS_ACTIVE/*, RAW_XML*/) ');
                 SQL.Add(' VALUES ( ');
                 SQL.Add(' :ID_CONFIGURACION, :ID_STATE, :ID_COUNTRY, :ID_ZONE, :ISO_CODE, :NAME, :IS_ACTIVE/*, RAW_XML*/) ');
                 SQL.Add(' MATCHING (ID_CONFIGURACION, ID_STATE) ');

                 Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                 Params.ByName['ID_STATE'].AsInteger := id;
                 Params.ByName['ID_COUNTRY'].AsInteger := StrToIntDef(DameDato(Nodo, ['id_cuuntry']), 0);
                 Params.ByName['ID_ZONE'].AsInteger := StrToIntDef(DameDato(Nodo, ['id_zone']), 0);
                 Params.ByName['ISO_CODE'].AsString := iso_code;
                 Params.ByName['NAME'].AsString := state_name;
                 Params.ByName['IS_ACTIVE'].AsInteger := StrToIntDef(DameDato(Nodo, ['active']), 0);
                 // Aparentemente esto hace que la base crezca mucho
                 // Params.ByName['RAW_XML'].AsString := Respuesta.Text;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end
        else
        begin
           if not SincronizarcionAutomatica then
              ShowMessage('(states)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text)
           else
              Log.Add('(states)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
        end;
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
           Params.ByName['TITULO'].AsString := Trim(UpperCase(Copy(state_name, 1, 40)));
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
              Params.ByName['PROVINCIA'].AsString := UpperCase(Copy(iso_code, 1, 2));
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
              Params.ByName['PROVINCIA'].AsString := UpperCase(Copy(iso_code, 1, 2));
              Params.ByName['TITULO'].AsString := Trim(Copy(UpperCase(state_name), 1, 40));
              ExecQuery;
              Result := UpperCase(Copy(iso_code, 1, 2));
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopArticuloARTICULOChange(Sender: TField);
begin
  QMConfPrestaShopArticuloID_A.AsInteger := UDameDato.DameIDArticulo(QMConfPrestaShopArticuloARTICULO.AsString, QMConfPrestaShopEMPRESA.AsInteger);
  QMConfPrestaShopArticuloTITULO.AsString := DameTituloArticulo(QMConfPrestaShopArticuloID_A.AsInteger);
end;

procedure TDMSincronizacionTienda.FiltrarCliente(Valor: string);
begin
  /// Filtra clientes

  with QMConfPrestaShopCliente do
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
end;

procedure TDMSincronizacionTienda.FiltrarDireccion(Valor: string);
begin
  /// Filtra direccion de clientes

  with QMConfPrestaShopClienteDir do
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
end;

procedure TDMSincronizacionTienda.FiltrarArticulo(Valor: string);
begin
  /// Filtra articulos

  with QMConfPrestaShopArticulo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CONF_PRESTASHOP_ARTICULO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_PRODUCT = :VALOR OR ');
           SelectSQL.Add(' ID_PRODUCT_ATTRIBUTE = :VALOR OR ');
           SelectSQL.Add(' ID_A = :VALOR OR ');
           SelectSQL.Add(' ID_ATTRIBUTE = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(ID_ATTRIBUTES) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 25) || ''%'' OR ');
        SelectSQL.Add(' UPPER(ARTICULO) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 15) || ''%'' OR ');
        SelectSQL.Add(' UPPER(TITULO) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' OR ');
        SelectSQL.Add(' UPPER(TITULO_ARTICULO) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_PRODUCT, ID_PRODUCT_ATTRIBUTE');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
end;

procedure TDMSincronizacionTienda.FiltrarProductosPS(Valor: string; SoloActivos, SoloNoSincronizados: boolean);
begin
  /// Filtra productos

  with QMProductosPS do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_SYS_CONF_PRESTASHOP_PRODUCT ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if SoloActivos then
        SelectSQL.Add(' AND PRODUCT_ACTIVE = 1 ');
     if SoloNoSincronizados then
        SelectSQL.Add(' AND COALESCE(ID_A, 0) = 0 ');

     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_PRODUCT = :VALOR OR ');
           SelectSQL.Add(' ID_PRODUCT_ATTRIBUTE = :VALOR OR ');
           SelectSQL.Add(' ID_A = :VALOR OR ');
           SelectSQL.Add(' ID_ATTRIBUTE = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(ID_ATTRIBUTES) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 25) || ''%'' OR ');
        SelectSQL.Add(' UPPER(ARTICULO) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 15) || ''%'' OR ');
        SelectSQL.Add(' UPPER(TITULO_LARGO) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' OR ');

        SelectSQL.Add(' UPPER(SUPPLIER_REFERENCE) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' OR ');
        SelectSQL.Add(' UPPER(EAN13) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 25) || ''%'' OR ');
        SelectSQL.Add(' UPPER(UPC) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 25) || ''%'' OR ');
        SelectSQL.Add(' UPPER(ISBN) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 25) || ''%'' OR ');
        SelectSQL.Add(' UPPER(PRODUCT_NAME) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_PRODUCT, ID_PRODUCT_ATTRIBUTE');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
end;

procedure TDMSincronizacionTienda.FiltrarCategoriasPS(Valor: string; SoloActivos, SoloNoSincronizados: boolean);
begin
  /// Filtra productos

  with QMCategory do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_SYS_CONF_PS_CATEGORY ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if SoloActivos then
        SelectSQL.Add(' AND CATEGORY_ACTIVE = 1 ');
     if SoloNoSincronizados then
        SelectSQL.Add(' AND COALESCE(ID_FAMILIA, 0) = 0 ');

     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_CATEGORY = :VALOR OR ');
           SelectSQL.Add(' ID_PARENT = :VALOR OR ');
           SelectSQL.Add(' ID_FAMILIA = :VALOR OR ');
           SelectSQL.Add(' ID_SUBFAMILIA = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(NAME) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' OR ');
        SelectSQL.Add(' UPPER(FAMILIA) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 5) || ''%'' OR ');
        SelectSQL.Add(' UPPER(SUBFAMILIA) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 5) || ''%'' OR ');

        SelectSQL.Add(' UPPER(TITULO_FAMILIA) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 40) || ''%'' OR ');
        SelectSQL.Add(' UPPER(TITULO_SUBFAMILIA) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 40) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_CATEGORY');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
end;

function TDMSincronizacionTienda.InicializaWebService: boolean;
begin
  Result := DMPrestashop.WS_Inicializa(QMConfPrestaShopWS_URL.AsString, QMConfPrestaShopWS_KEY.AsString, QMConfPrestaShopWS_VERSION.AsString, (QMConfPrestaShopWS_DEBUG.AsInteger = 1));
  DMMain.Log(Format('InicializaWebService - Version WS = %s.', [DMPrestashop.WSVersion]));
end;

procedure TDMSincronizacionTienda.RellenaIdiomasWS(Items, Values: TStrings);
var
  id, nombre : string;
  language_active : integer;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
begin
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  Items.BeginUpdate;
  Values.BeginUpdate;
  try
     Items.Clear;
     Values.Clear;

     // Obtengo id y nombre de los idiomas activos
     Opciones := '&display=[id,name,active]';
     if DMPrestashop.SuperaVersion('1.6.0.6') then
        Opciones := Opciones + '&filter[active]=[1]';
     Opciones := Opciones + '&sort=[id_ASC]';

     CodigoRespuesta := DMPrestashop.WS_Get('languages', 0, Opciones, Respuesta);

     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Languages.xml');
     {$ENDIF}

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
              language_active := StrToInt(DameDato(Nodo, ['active']));

              if (language_active = 1) then
              begin
                 id := DameDato(Nodo, ['id']);
                 Values.Add(id);

                 Nombre := DameDato(Nodo, ['name']);
                 Items.Add(Nombre);
              end;

              Nodo := Nodo.NextSibling;
           end;
        end;
     end
     else
        ShowMessage('(languages)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
     Items.EndUpdate;
     Values.EndUpdate;
  end;
end;

procedure TDMSincronizacionTienda.RellenaEstadosWS;
var
  id : string;
  Nombre : string;
  unremovable : string;
  delivery : string;
  hidden : string;
  send_email : string;
  module_name : string;
  invoice : string;
  Color : string;
  logable : string;
  shipped : string;
  paid : string;
  pdf_delivery : string;
  pdf_invoice : string;
  deleted : string;
  ColorHEX : string;
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
begin
  OrderStates.Clear;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo id y nombre de los idiomas activos
     CodigoRespuesta := DMPrestashop.WS_Get('order_states', 0, '&display=full', Respuesta);

     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Order_States.xml');
     {$ENDIF}

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
              Nombre := DameDatoLenguage(DameNodo(Nodo, ['name']), QMConfPrestaShopWS_LANGUAGE.AsInteger);
              unremovable := DameDato(Nodo, ['unremovable']);
              delivery := DameDato(Nodo, ['delivery']);
              hidden := DameDato(Nodo, ['hidden']);
              send_email := DameDato(Nodo, ['send_email']);
              module_name := DameDato(Nodo, ['module_name']);
              invoice := DameDato(Nodo, ['invoice']);
              Color := DameDato(Nodo, ['color']);
              logable := DameDato(Nodo, ['logable']);
              shipped := DameDato(Nodo, ['shipped']);
              paid := DameDato(Nodo, ['paid']);
              pdf_delivery := DameDato(Nodo, ['pdf_delivery']);
              pdf_invoice := DameDato(Nodo, ['pdf_invoice']);
              deleted := DameDato(Nodo, ['deleted']);

              ColorHEX := HTMLToColorToHex(Color);
              if (ColorHEX = '') then
                 ColorHEX := Color;
              DMMain.Log(format(_('OrderState: %s (%s)- color: %s - ColorHex: %s'), [id, Nombre, Color, ColorHEX]));

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_O_STATE ( ');
                    SQL.Add(' ID_CONFIGURACION, ID, UNREMOVABLE, DELIVERY, HIDDEN, SEND_EMAIL, MOD_NAME, INVOICE, COLOR_HEX, LOGABLE, SHIPPED, PAID, ');
                    SQL.Add(' PDF_DELIVERY, PDF_INVOICE, DELETED, DESCRIPCION) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :ID_CONFIGURACION, :ID, :UNREMOVABLE, :DELIVERY, :HIDDEN, :SEND_EMAIL, :MOD_NAME, :INVOICE, :COLOR_HEX, :LOGABLE, :SHIPPED, ');
                    SQL.Add(' :PAID, :PDF_DELIVERY, :PDF_INVOICE, :DELETED, :DESCRIPCION) ');
                    SQL.Add(' MATCHING (ID_CONFIGURACION, ID) ');
                    Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                    Params.ByName['ID'].AsInteger := StrToInt(id);
                    Params.ByName['UNREMOVABLE'].AsInteger := StrToIntDef(unremovable, 0);
                    Params.ByName['DELIVERY'].AsInteger := StrToIntDef(delivery, 0);
                    Params.ByName['HIDDEN'].AsInteger := StrToIntDef(hidden, 0);
                    Params.ByName['SEND_EMAIL'].AsInteger := StrToIntDef(send_email, 0);
                    Params.ByName['MOD_NAME'].AsString := Copy(module_name, 1, 256);
                    Params.ByName['INVOICE'].AsInteger := StrToIntDef(invoice, 0);
                    Params.ByName['COLOR_HEX'].AsString := Copy(Trim(UpperCase(ColorHEX)), 1, 7);
                    Params.ByName['LOGABLE'].AsInteger := StrToIntDef(logable, 0);
                    Params.ByName['SHIPPED'].AsInteger := StrToIntDef(shipped, 0);
                    Params.ByName['PAID'].AsInteger := StrToIntDef(paid, 0);
                    Params.ByName['PDF_DELIVERY'].AsInteger := StrToIntDef(pdf_delivery, 0);
                    Params.ByName['PDF_INVOICE'].AsInteger := StrToIntDef(pdf_invoice, 0);
                    Params.ByName['DELETED'].AsInteger := StrToIntDef(deleted, 0);
                    Params.ByName['DESCRIPCION'].AsString := Copy(Nombre, 1, 100);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              OrderStates.Values[id] := Nombre;

              Nodo := Nodo.NextSibling;
           end;
        end;
     end
     else
        ShowMessage('(order_states)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;

  QMOrdersStatesPS.Close;
  QMOrdersStatesPS.Open;
end;

function TDMSincronizacionTienda.SincronizaFamilias(Desde, Hasta: TDateTime): boolean;
var
  i, j : integer;
  //id_root_category : integer;
  nombre : string;
  date_upd : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, NodoSubcategorias : IXMLNode;
  Nodo : IXMLNode;

  ListaCategorias : TStrings;
begin
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
        CodigoRespuesta := DMPrestashop.WS_Get('categories', 0, '&display=full&filter[is_root_category]=[1]', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Categories-root_category.xml');
     {$ENDIF}

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
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

                    //id_root_category := StrToInt(DameDato(Nodo, ['id']));
                    date_upd := DameDato(Nodo, ['date_upd']);

                    Nombre := DameDatoLenguage(DameNodo(Nodo, ['name']), QMConfPrestaShopWS_LANGUAGE.AsInteger);

                    // Recorro las categorias asociadas. Esto seran las familias a importar
                    NodoSubcategorias := DameNodo(Nodo, ['associations', 'categories']);
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
           ShowMessage('(categories-root)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
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
end;

function TDMSincronizacionTienda.SincronizaUnaFamilia(Desde, Hasta: TDateTime; id_category: integer; FamiliaPadre: string = ''): boolean;
var
  i, j : integer;
  id : integer;
  nombre, Descripcion : string;
  date_upd : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;

  ListaSubCategorias, ListaProductos : TStrings;
  IdFamilia, IdSubFamilia : integer;
  SubFamilia : string;
  CtaCompras, CtaVentas, CtaDevCompras, CtaDevVentas : string;
  Ejercicio, MaxEjercicio : integer;
  TipoIVA : integer;
  Pais : string;
begin
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
        CodigoRespuesta := DMPrestashop.WS_Get('categories', id_category, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Category.xml');
     {$ENDIF}

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
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

                 Nombre := DameDatoLenguage(DameNodo(NodoPadre, ['name']), QMConfPrestaShopWS_LANGUAGE.AsInteger);
                 Descripcion := DameDatoLenguage(DameNodo(NodoPadre, ['description']), QMConfPrestaShopWS_LANGUAGE.AsInteger);

                 if (FamiliaPadre = '') then
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
           ShowMessage('(categories-familias)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;

     //IdFamilia := 0;
     //IdSubFamilia := 0;
     SubFamilia := '';

     // Sincronizo la categoria con la familia
     if (FamiliaPadre = '') then
     begin
        if ((date_upd > FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
           (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
        begin
           // Log[Log.Count - 1] := Format('   ' + _('Sincronizando categoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]);
           Log.Add(Format('   ' + _('Sincronizando categoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]));

           // Obtengo IdFamilia si ya esta sincronizada
           IdFamilia := DameIdFamiliaPrestaShop(QMConfPrestaShopID.AsInteger, id_category);

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
                 IdFamilia := DameIdFamilia(FamiliaPadre, QMConfPrestaShopEMPRESA.AsInteger);

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
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
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
                       Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
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
                       Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
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
                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
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

                          Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
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
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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
           IdFamilia := DameIdFamiliaPrestaShop(QMConfPrestaShopID.AsInteger, id_category);
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
        if ((date_upd > FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
           (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
        begin
           // Log[Log.Count - 1] := Format('   ' + _('Sincronizando subcategoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]);
           Log.Add(Format('   ' + _('Sincronizando subcategoria %d - %s - Modificado: %s'), [id_category, nombre, date_upd]));

           IdFamilia := DameIdFamilia(FamiliaPadre);
           IdSubFamilia := DameIdSubFamiliaPrestaShop(QMConfPrestaShopID.AsInteger, id_category);

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
                       Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
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
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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

  (*
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
  *)
  finally
     ListaSubCategorias.Free;
     ListaProductos.Free;
  end;
end;

function TDMSincronizacionTienda.DameIdFamiliaPrestaShop(IdConfiguracion, IdCategory: integer): integer;
begin
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
end;

function TDMSincronizacionTienda.DameIdSubFamiliaPrestaShop(IdConfiguracion, IdCategory: integer): integer;
begin
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
end;

function TDMSincronizacionTienda.DamePorcentajeIVA(id_tax_rules_group, id_country: integer): double;
var
  id_tax : integer;
begin
  // DMMain.Log(Format('   DamePorcentajeIVA(%d, %d)', [id_tax_rules_group, id_country]));

  // Grupo de Reglas para IVA. Esto ya lo tenemos en el parámetro id_tax_rules_group. Contiene *id*, name, active y deleted.
  // http://prestashop.delfos.net/api/tax_rule_groups/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  // Regla de IVA segun grupo y pais. Contiene id, id_state, id_countrey, *id_tax* y otros
  // http://prestashop.delfos.net/api/tax_rules?ws_key=ABC123ABC123ABC123ABC123ABC123AB&display=full&filter[id_tax_rules_group]=[2]&filter[id_country]=[3]

  // Porcentaje de IVA. Contiene id, *rate*, active, delete y name
  // http://prestashop.delfos.net/api/taxes/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  id_tax := DameIdTax(id_tax_rules_group, id_country);
  Result := DameTaxRate(id_tax);
end;

function TDMSincronizacionTienda.DameIdTax(id_tax_rules_group, id_country: integer): integer;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
  nid_tax, nid_country, nid_tax_rules_group : integer;
begin
  // DMMain.Log(Format('   DameIdTax(%d, %d)', [id_tax_rules_group, id_country]));

  // Regla de IVA segun grupo y pais. Contiene id, id_state, id_countrey, *id_tax* y otros
  // http://prestashop.delfos.net/api/tax_rules?ws_key=ABC123ABC123ABC123ABC123ABC123AB&display=full&filter[id_tax_rules_group]=[2]&filter[id_country]=[3]

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos de la regla de impuestos
     CodigoRespuesta := DMPrestashop.WS_Get('tax_rules', 0, '&display=[id_tax,id_country,id_tax_rules_group]', Respuesta);
     if DMPrestashop.SuperaVersion('1.6.0.8') then
        Opciones := Opciones + '&filter[id_tax_rules_group]=[' + IntToStr(id_tax_rules_group) + ']&filter[id_country]=[' + IntToStr(id_country) + ']';

     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-tax_rules.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoPadre := DameNodo(Documento.DocumentElement, ['tax_rules', 'tax_rule']);
           while Assigned(NodoPadre) do
           begin
              nid_tax := StrToIntDef(DameDato(Nodo, ['id_tax']), 0);
              nid_country := StrToIntDef(DameDato(Nodo, ['id_country']), 0);
              nid_tax_rules_group := StrToIntDef(DameDato(Nodo, ['id_tax_rules_group']), 0);

              if ((id_country = nid_country) and (id_tax_rules_group = nid_tax_rules_group)) then
              begin
                 Result := nid_tax;
                 NodoPadre := nil;
              end
              else
                 NodoPadre := NodoPadre.NextSibling;
           end;
        end;
     end
     else
        ShowMessage('(tax_rules)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.DameTaxRate(id_tax: integer): double;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
begin
  // DMMain.Log(Format('   DameTaxRate(%d)', [id_tax]));

  // Porcentaje de IVA. Contiene id, *rate*, active, delete y name
  // http://prestashop.delfos.net/api/taxes/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del impuesto
     CodigoRespuesta := DMPrestashop.WS_Get('taxes', id_tax, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-taxes.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
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
        ShowMessage('(taxes)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.DameStock(id_stock_available: integer): double;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
begin
  // Stock para el producto/combinacion
  // http://prestashop.delfos.net/api/stock_availables/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del stock
     CodigoRespuesta := DMPrestashop.WS_Get('stock_availables', id_stock_available, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-stock_availables.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['stock_available']);
           if Assigned(Nodo) then
           begin
              Result := StrToFloatDec(DameDato(Nodo, ['quantity']), '.');
           end;
        end;
     end
     else
        ShowMessage('(stock_availables)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.HayDetalle: boolean;
begin
  Result := (QMConfPrestaShopArticulo.RecordCount > 0);
end;

procedure TDMSincronizacionTienda.CrearUnArticulo(IdArticulo: integer; SincronizarSiExiste: boolean = False; SaltarConfirmacionSiExiste: boolean = False);
var
  Q : THYFIBQuery;
  Combinaciones : TStrings;
  Respuesta : TStrings;
  Documento : TXMLDocument;
  CodigoRespuesta : integer;
  NodoPadre, Nodo : IXMLNode;
  id_product, id_tax_rules_group, id_category, id_stock_available : integer;
  //id_product_attribute : integer;
  idFamilia, idSubFamilia : integer;
  Titulo, Referencia, DescripcionCorta, DescripcionLarga : string;
  Precio, Stock, StockMinimo : double;
  CodigoBarra : string;
begin
  /// Crea un producto en Prestashop

  Log.Add(Format(_('Creando producto del articulo %d'), [IdArticulo]));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, TITULO, REFERENCIA, DESCRIPCION_CORTA, DESCRIPCION_LARGA, PRECIO, STOCK FROM SYS_CONF_PRESTASHOP_ARTICULO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
           SelectSQL.Add(' ID_A = :ID_A ');
           Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
           Params.ByName['ID_A'].AsInteger := IdArticulo;
           Open;

           id_product := FieldByName('ID_PRODUCT').AsInteger;
           //id_product_attribute := FieldByName('ID_PRODUCT_ATTRIBUTE').AsInteger;
           Titulo := FieldByName('TITULO').AsString;
           Referencia := FieldByName('REFERENCIA').AsString;
           DescripcionCorta := FieldByName('DESCRIPCION_CORTA').AsString;
           DescripcionLarga := FieldByName('DESCRIPCION_LARGA').AsString;
           Precio := FieldByName('PRECIO').AsFloat;
           Stock := FieldByName('STOCK').AsFloat;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  if ((id_product = 0) or (SincronizarSiExiste and (SaltarConfirmacionSiExiste or ConfirmaMensaje(_('El articulo ya esta asociado a un producto Prestashop.' + #13#10 + 'Desea continuar?'))))) then
  begin
     Q := THYFIBQuery.Create(nil);
     Combinaciones := TStringList.Create;
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM VER_ARTICULOS_CUENTAS WHERE ID_A = :ID_A AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
           Params.ByName['ID_A'].AsInteger := IdArticulo;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
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
           Precio := DMMain.DamePrecioTarifa(QMConfPrestaShopTARIFA.AsString, Q.FieldByName['ARTICULO'].AsString, QMConfPrestaShopEMPRESA.AsInteger);
        if (Stock = 0) then
           Stock := DMMain.DameStockArticulo(QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, Q.FieldByName['ARTICULO'].AsString, QMConfPrestaShopALMACEN.AsString);

        // Obtengo datos del articulo
        CodigoRespuesta := DMPrestashop.WS_Get('products', 0, '&schema=blank', Respuesta);
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-Product-blank.xml');

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Datos del producto
              NodoPadre := DameNodo(Documento.DocumentElement, ['product']);
              if Assigned(NodoPadre) then
              begin
                 // Borro nodos ReadOnly
                 NodoPadre.ChildNodes.Delete('manufacturer_name');
                 NodoPadre.ChildNodes.Delete('quantity');

                 // Borro nodos que no se utilizan
                 NodoPadre.ChildNodes.Delete('id');

                 // Es obligatorio o se elimina
                 NodoPadre.ChildNodes.Delete('position_in_category');

                 Nodo := DameNodo(NodoPadre, ['reference']);
                 Nodo.Text := Referencia; // Q.FieldByName['ARTICULO'].AsString;

                 Nodo := DameNodo(NodoPadre, ['price']);
                 Nodo.Text := FormatAmount(Precio, 6);

                 Nodo := DameNodo(NodoPadre, ['show_price']);
                 if Assigned(Nodo) then
                    Nodo.Text := '1';

                 Nodo := DameNodo(NodoPadre, ['name']);
                 SetDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger, Titulo {Q.FieldByName['TITULO'].AsString});

                 Nodo := DameNodo(NodoPadre, ['description']);
                 SetDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger, DescripcionLarga);
                 Nodo := DameNodo(NodoPadre, ['description_short']);
                 SetDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger, DescripcionCorta);

                 // Descuento
                 { TODO : Averiguar donde se agrega un descuento }

                 Nodo := DameNodo(NodoPadre, ['state']);
                 if Assigned(Nodo) then
                    Nodo.Text := '1';

                 Nodo := DameNodo(NodoPadre, ['active']);
                 Nodo.Text := '1';

                 Nodo := DameNodo(NodoPadre, ['minimal_quantity']);
                 if Assigned(Nodo) then
                    Nodo.Text := '1';

                 Nodo := DameNodo(NodoPadre, ['available_for_order']);
                 if Assigned(Nodo) then
                    Nodo.Text := '1';

                 if (Q.FieldByName['PESO'].AsFloat > 0) then
                 begin
                    Nodo := DameNodo(NodoPadre, ['weight']);
                    Nodo.Text := FormatAmount(Q.FieldByName['PESO'].AsFloat, 2);
                 end;

                 // ean13
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE ID_A = :ID_A AND TIPO = 3';
                       Params.ByName['ID_A'].AsInteger := IdArticulo;
                       ExecQuery;
                       CodigoBarra := Trim(FieldByName['BARRAS'].AsString);
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (Trim(CodigoBarra) > '') then
                 begin
                    Nodo := DameNodo(NodoPadre, ['ean13']);
                    if Assigned(Nodo) then
                       Nodo.Text := CodigoBarra;
                 end;

                 // upc
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE ID_A = :ID_A AND TIPO = 4';
                       Params.ByName['ID_A'].AsInteger := IdArticulo;
                       ExecQuery;
                       CodigoBarra := Trim(FieldByName['BARRAS'].AsString);
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (Trim(CodigoBarra) > '') then
                 begin
                    Nodo := DameNodo(NodoPadre, ['upc']);
                    if Assigned(Nodo) then
                       Nodo.Text := CodigoBarra;
                 end;

                 // isbn
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE ID_A = :ID_A AND TIPO = 5';
                       Params.ByName['ID_A'].AsInteger := IdArticulo;
                       ExecQuery;
                       CodigoBarra := Trim(FieldByName['BARRAS'].AsString);
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (Trim(CodigoBarra) > '') then
                 begin
                    Nodo := DameNodo(NodoPadre, ['isbn']);
                    if Assigned(Nodo) then
                       Nodo.Text := CodigoBarra;
                 end;

                 // <mpn> - Manufacturer Part Number
                 // Habria que ver si esto es un codigo de barra.

                 // <low_stock_threshold>
                 // <low_stock_alert>
                 // Esto seria STOCK_MINIMO del almacen asociado a la tienda Prestashop.
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT STOCK_MINIMO FROM ART_ARTICULOS_ALMACENES_ART ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' CANAL = :CANAL AND ');
                       SQL.Add(' ALMACEN = :ALMACEN AND ');
                       SQL.Add(' ARTICULO = :ARTICULO ');
                       Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
                       Params.ByName['ALMACEN'].AsString := QMConfPrestaShopALMACEN.AsString;
                       Params.ByName['ARTICULO'].AsString := Q.FieldByName['ARTICULO'].AsString;
                       ExecQuery;
                       StockMinimo := FieldByName['STOCK_MINIMO'].AsFloat;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (StockMinimo >= 1) then
                 begin
                    Nodo := DameNodo(NodoPadre, ['low_stock_threshold']);
                    Nodo.Text := FormatAmount(StockMinimo, 0);
                    Nodo := DameNodo(NodoPadre, ['low_stock_alert']);
                    Nodo.Text := FormatAmount(StockMinimo, 0);
                 end;

                 // Familia
                 idFamilia := DameIDFamilia(Q.FieldByName['FAMILIA'].AsString, Q.FieldByName['EMPRESA'].AsInteger);
                 id_category := DameCategoriaPrestashop(QMConfPrestaShopID.AsInteger, IdFamilia);
                 if (id_category = 0) then
                    id_category := DMPrestashop.id_root_category;
                 Nodo := DameNodo(NodoPadre, ['id_category_default']);
                 Nodo.Text := IntToStr(id_category);
                 Nodo := DameNodo(NodoPadre, ['associations', 'categories', 'category', 'id']);
                 Nodo.Text := IntToStr(id_category);
                 // Nodo := DameNodo(NodoPadre, ['position_in_category']);
                 // Nodo.Text := IntToStr(0);

                 // SubFamilia
                 idSubFamilia := DameIDSubFamilia(IdFamilia, Q.FieldByName['SUBFAMILIA'].AsString, Q.FieldByName['EMPRESA'].AsInteger);
                 id_category := DameSubCategoriaPrestashop(QMConfPrestaShopID.AsInteger, idSubFamilia);
                 if (id_category <> 0) then
                 begin
                    Nodo := DameNodo(NodoPadre, ['associations', 'categories']);
                    Nodo := Nodo.AddChild('category');
                    Nodo := Nodo.AddChild('id');
                    Nodo.Text := IntToStr(id_category);
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT ID FROM SYS_CONF_PRESTASHOP_TAX_RULE_GR ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                       SQL.Add(' PAIS = :PAIS AND ');
                       SQL.Add(' TIPO = :TIPO ');
                       SQL.Add(' ORDER BY ID ');
                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                       Params.ByName['PAIS'].AsString := Q.FieldByName['PAIS'].AsString;
                       Params.ByName['TIPO'].AsInteger := Q.FieldByName['TIPO_IVA'].AsInteger;
                       ExecQuery;
                       id_tax_rules_group := FieldByName['ID'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 Nodo := DameNodo(NodoPadre, ['id_tax_rules_group']);
                 Nodo.Text := IntToStr(id_tax_rules_group);

                 // Enviar datos.
                 XML.SaveToFile(DameTempPath + 'Respuesta-Product-blank-Rellenado.xml');
                 CodigoRespuesta := DMPrestashop.WS_Add('products', XML, Respuesta);
                 {$IFDEF Debug}
                 Respuesta.SaveToFile(DameTempPath+'Respuesta-Product-Add.xml');
                 {$ENDIF}
                 DMMain.Log(Format('Respuesta ADD : %d', [CodigoRespuesta]));
                 // HTTP Response code 201: Created
                 if (CodigoRespuesta = 201) then
                 begin
                    // En la respuesta estará el id con el que tengo que sincronizar.
                    Active := False;
                    XML.Text := Respuesta.Text;
                    Active := True;

                    NodoPadre := DameNodo(Documento.DocumentElement, ['product']);
                    id_product := StrToInt(DameDato(NodoPadre, ['id']));

                    // Este es el id para mantener el stock del producto.
                    // Supongo que si hay mas de una Shop, habrá mas de un id.
                    NodoPadre := DameNodo(Documento.DocumentElement, ['product', 'associations', 'stock_availables', 'stock_available']);
                    id_stock_available := StrToInt(DameDato(NodoPadre, ['id']));

                    DMMain.Log(Format('Relacionando ID_A, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTE, ID_ATTRIBUTES: %d, %d, %d, %d,  &d, %s', [IdArticulo, id_product, 0, 0, '']));
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_ARTICULO ( ');
                          SQL.Add(' ID_CONFIGURACION, ID_A, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTE, ID_ATTRIBUTES, ID_STOCK_AVAILABLE, ');
                          SQL.Add(' TITULO, REFERENCIA, DESCRIPCION_CORTA, DESCRIPCION_LARGA, PRECIO, STOCK) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :ID_CONFIGURACION, :ID_A, :ID_PRODUCT, :ID_PRODUCT_ATTRIBUTE, :ID_ATTRIBUTE, :ID_ATTRIBUTES, :ID_STOCK_AVAILABLE, ');
                          SQL.Add(' :TITULO, :REFERENCIA, :DESCRIPCION_CORTA, :DESCRIPCION_LARGA, :PRECIO, :STOCK) ');
                          SQL.Add(' MATCHING (ID_CONFIGURACION, ID_A) ');
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                          Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                          Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := 0;
                          Params.ByName['ID_ATTRIBUTE'].AsInteger := 0;
                          Params.ByName['ID_ATTRIBUTES'].AsString := '';
                          Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := id_stock_available;
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

                    // Ahora actualizare el stock con WS_Edit
                    // Obtengo datos del stock
                    CodigoRespuesta := DMPrestashop.WS_Get('stock_availables', id_stock_available, '', Respuesta);
                    Respuesta.SaveToFile(DameTempPath + 'Respuesta-stock_availables.xml');

                    // Si la respuesta es correcta
                    if (CodigoRespuesta = 200) then
                    begin
                       with Documento do
                       begin
                          XML.Text := Respuesta.Text;
                          Active := True;

                          // Datos del producto
                          NodoPadre := DameNodo(Documento.DocumentElement, ['stock_available']);
                          if Assigned(NodoPadre) then
                          begin
                             Nodo := DameNodo(NodoPadre, ['quantity']);
                             // En Prestashop es un entero
                             Nodo.Text := IntToStr(Trunc(Stock)); // FormatAmount(Stock, 2)
                          end;

                          // Enviar datos.
                          XML.SaveToFile(DameTempPath + 'Respuesta-Pstock_availables-Rellenado.xml');
                          CodigoRespuesta := DMPrestashop.WS_Edit('stock_availables', id_stock_available, XML, Respuesta);
                          {$IFDEF Debug}
                          Respuesta.SaveToFile(DameTempPath+'Respuesta-stock_availables-Edit.xml');
                          {$ENDIF}
                          DMMain.Log(Format('Respuesta PUT : %d', [CodigoRespuesta]));
                          // HTTP Response code 202: Accepted (significa dato aceptado pendiente de procesar)
                          if ((CodigoRespuesta = 200) or (CodigoRespuesta = 202)) then
                          begin
                             // En la respuesta estará el id con el que tengo que sincronizar.
                             Active := False;
                             XML.Text := Respuesta.Text;
                             Active := True;
                          end
                          else
                          begin
                             ShowMessage('(product)' + _('No se ha podido actualizar el stock.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
                          end;
                       end;
                    end;
                 end;
              end;
           end;
        end
        else
           ShowMessage('(product)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Q.Free;
        Combinaciones.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  end
  else
  begin
     Log[Log.Count - 1] := Format(_('El articulo ya esta asociado. Id Articulo %d - IdProduct :%d'), [IdArticulo, id_product]);
  end;
end;

procedure TDMSincronizacionTienda.FiltraTienda(Id: integer);
begin
  with QMConfPrestaShop do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_CONF_PRESTASHOP ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID = :ID ');
     Params.ByName['ID'].AsInteger := Id;
     Open;
  end;
end;

procedure TDMSincronizacionTienda.AbreTaxRuleGroups;
var
  i : integer;
  TaxRuleGroups : TStrings;
begin
  TaxRuleGroups := TStringList.Create;
  try
     // Obtengo lista de grupos de reglas de impuesto
     DMPrestashop.WS_DameTaxRuleGroups(TaxRuleGroups);

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
              Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopSincID_CONFIGURACION.AsInteger;
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

  QMConfPrestaShopTaxRuleGroup.Close;
  QMConfPrestaShopTaxRuleGroup.Open;
end;

procedure TDMSincronizacionTienda.CierraTaxRuleGroups;
begin
  QMConfPrestaShopTaxRuleGroup.Close;
end;

function TDMSincronizacionTienda.DameCategoriaPrestashop(IdConfiguracion, IdFamilia: integer): integer;
begin
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
end;

function TDMSincronizacionTienda.DameSubCategoriaPrestashop(IdConfiguracion, IdSubFamilia: integer): integer;
begin
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
end;

procedure TDMSincronizacionTienda.CrearUnaFamilia(IdFamilia: integer; SincronizarSiExiste: boolean = False);
var
  Q : THYFIBQuery;
  Respuesta : TStrings;
  Documento : TXMLDocument;
  CodigoRespuesta : integer;
  NodoPadre, Nodo : IXMLNode;
  id_category : integer;
  Titulo : string;
begin
  /// Crea una familia (categoria) en Prestashop
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
           Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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
        CodigoRespuesta := DMPrestashop.WS_Get('categories', 0, '&schema=blank', Respuesta);
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-Categories-blank.xml');

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
                 Nodo.Text := IntToStr(DMPrestashop.id_root_category);
                 Nodo := DameNodo(NodoPadre, ['is_root_category']);
                 Nodo.Text := '0';
                 Nodo := DameNodo(NodoPadre, ['active']);
                 Nodo.Text := '1';

                 Titulo := Trim(Q.FieldByName['TITULO_WEB'].AsString);
                 if (Titulo = '') then
                    Titulo := Trim(Q.FieldByName['TITULO'].AsString);
                 Nodo := DameNodo(NodoPadre, ['name']);
                 SetDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger, Titulo);

                 Nodo := DameNodo(NodoPadre, ['description']);
                 SetDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger, Titulo);

                 // Enviar datos.
                 XML.SaveToFile(DameTempPath + 'Respuesta-Categories-blank-Rellenado.xml');
                 CodigoRespuesta := DMPrestashop.WS_Add('categories', XML, Respuesta);
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
                    Log.Add(Format('   ' + _('Categoria Prestashop: %d'), [id_category]));
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
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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
           ShowMessage('(category)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Q.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  end;
end;

procedure TDMSincronizacionTienda.CrearUnaSubFamilia(IdFamilia, IdSubFamilia: integer; SincronizarSiExiste: boolean = False);
var
  Q : THYFIBQuery;
  Respuesta : TStrings;
  Documento : TXMLDocument;
  CodigoRespuesta : integer;
  NodoPadre, Nodo : IXMLNode;
  id_category, id_parent : integer;
begin
  /// Crea una subfamilia (categoria) en Prestashop
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
           Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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
        id_parent := DameCategoriaPrestashop(QMConfPrestaShopID.AsInteger, IdFamilia);
        if (id_parent = 0) then
           id_parent := DMPrestashop.id_root_category;

        // Obtengo datos del fabricantes
        CodigoRespuesta := DMPrestashop.WS_Get('categories', 0, '&schema=blank', Respuesta);
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-Categories-blank.xml');

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
                 SetDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger, Q.FieldByName['TITULO'].AsString);

                 Nodo := DameNodo(NodoPadre, ['description']);
                 SetDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger, Q.FieldByName['TITULO'].AsString);

                 // Enviar datos.
                 XML.SaveToFile(DameTempPath + 'Respuesta-Categories-blank-Rellenado.xml');
                 CodigoRespuesta := DMPrestashop.WS_Add('categories', XML, Respuesta);
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
                    Log.Add(Format('   ' + _('Categoria Prestashop: %d'), [id_category]));
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
                          Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
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
           ShowMessage('(subcategory)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Q.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  end;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopSincAfterPost(DataSet: TDataSet);
begin
  Refrescar(DataSet, 'TIPO', QMConfPrestaShopSincTIPO.AsString);
end;

function TDMSincronizacionTienda.SincronizaStockArticulos(DesdeRegistro: integer): integer;
var
  CodigoRespuesta : integer;
  HayError : boolean;
begin
  Result := DesdeRegistro;
  //HayError := False;
  FSendCorreo.Texto(_('Obteniendo Articulos a sincrinizar stock.'));
  DMMain.LogIni(_('Sincronizando Stock Articulos'));
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
           SelectSQL.Add(' SELECT (SELECT MAX(ID_MOV_STOCKS) ');
           SelectSQL.Add('         FROM ART_MOV_STOCKS ');
           SelectSQL.Add('         WHERE ');
           SelectSQL.Add('         EMPRESA = C.EMPRESA AND ');
           SelectSQL.Add('         CANAL = :CANAL AND ');
           SelectSQL.Add('         ALMACEN = :ALMACEN AND ');
           SelectSQL.Add('         ARTICULO = A.ARTICULO) ULT_MODIFICACION, ');
           SelectSQL.Add('        P.ID_CONFIGURACION, P.ID_A, P.ID_PRODUCT, P.ID_PRODUCT_ATTRIBUTE, P.ID_ATTRIBUTE, P.ID_ATTRIBUTES, ');
           SelectSQL.Add('        P.ID_STOCK_AVAILABLE, A.ARTICULO, P.TITULO, P.STOCK, A.TITULO_LARGO TITULO_ARTICULO ');
           SelectSQL.Add(' FROM SYS_CONF_PRESTASHOP_ARTICULO P ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP C ON P.ID_CONFIGURACION = C.ID ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON P.ID_A = A.ID_A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' P.ID_CONFIGURACION = :ID ');
           // Solo los que tiene control de stock.
           // SelectSQL.Add(' AND A.WEB = 1 ');
           SelectSQL.Add(' AND A.CONTROL_STOCK = 1 ');
           SelectSQL.Add(' ORDER BY 1 ');
           Params.ByName['ALMACEN'].AsString := QMConfPrestaShopALMACEN.AsString;
           Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
           Params.ByName['ID'].AsInteger := QMConfPrestaShopID.AsInteger;
           Open;
           // Sincronizo los articulos aunque se generen errores
           HayError := False;
           while ((not EOF) {and (not HayError)}) do
           begin
              FSendCorreo.Texto(format(_('Sincronizando Stock Articulo %s %s'), [FieldByName('ARTICULO').AsString, FieldByName('TITULO_ARTICULO').AsString]));
              if (FieldByName('ULT_MODIFICACION').AsInteger > DesdeRegistro) then
              begin
                 if (FieldByName('ID_STOCK_AVAILABLE').AsInteger > 0) then
                 begin
                    CodigoRespuesta := SincronizaStockUnArticulo(FieldByName('ARTICULO').AsString, FieldByName('ID_STOCK_AVAILABLE').AsInteger, FieldByName('TITULO_ARTICULO').AsString);

                    if (CodigoRespuesta <> 200) then
                       HayError := True;

                    if (CodigoRespuesta = 200) and (not HayError) and (FieldByName('ULT_MODIFICACION').AsInteger > Result) then
                       Result := FieldByName('ULT_MODIFICACION').AsInteger;
                 end
                 else
                    Log.Add('   ' + Format(_('Articulo %s no tiene informacion de stock de Prestashop'), [FieldByName('ARTICULO').AsString]));
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

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTienda.SincronizaStockUnArticulo(Articulo: string; id_stock_available: integer; Titulo: string): integer;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
  Stock, StockPrestashop : double;
begin
  /// https://www.agricaldes.com/api/stock_availables/323/?ws_key=1P1KEC8MKZCEYCQ1VIPYDCUETV******
  {
  <?xml version="1.0" encoding="UTF-8"?>
  <prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
  <stock_available>
          <id>323></id>
          <id_product xlink:href="https://www.agricaldes.com/api/products/255">255></id_product>
          <id_product_attribute>0></id_product_attribute>
          <id_shop xlink:href="https://www.agricaldes.com/api/shops/1">1></id_shop>
          <id_shop_group>0></id_shop_group>

          <quantity>4></quantity>

          <depends_on_stock>0></depends_on_stock>
          <out_of_stock>2></out_of_stock>
          <location></location>
  </stock_available>
  </prestashop>
  }
  Result := 0;

  // Stock para el producto/combinacion
  // http://prestashop.delfos.net/api/stock_availables/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  //StockPrestashop := 0;

  Log.Add('   ' + Format(_('Sincronizando stock de %s - %s'), [Articulo, Titulo]));
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del stock
     CodigoRespuesta := DMPrestashop.WS_Get('stock_availables', id_stock_available, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-stock_availables.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoPadre := DameNodo(Documento.DocumentElement, ['stock_available']);
           if Assigned(NodoPadre) then
           begin
              Nodo := DameNodo(NodoPadre, ['quantity']);
              StockPrestashop := StrToFloatDec(Nodo.Text, '.');

              case param_PSHTSTK001 of
                 1: Stock := DMMain.DameStockArticulo(QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, Articulo, QMConfPrestaShopALMACEN.AsString);
                 2: Stock := DMMain.DameStockRealArticulo(QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, Articulo, QMConfPrestaShopALMACEN.AsString);
                 3: Stock := DMMain.DameStockVirtualArticulo(QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, Articulo, QMConfPrestaShopALMACEN.AsString);
                 else
                    Stock := DMMain.DameStockArticulo(QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, Articulo, QMConfPrestaShopALMACEN.AsString);
              end;

              Log[Log.Count - 1] := '   ' + Format(_('Sincronizando stock de %s (%d --> %d) - %s'), [Articulo, Trunc(StockPrestashop), Trunc(Stock), Titulo]);

              // Solo modifico si hay una diferencia razonable
              // Prestashop solo maneja stock de enteros
              if (abs(StockPrestashop - Stock) > 0.01) then
              begin
                 Log[Log.Count - 1] := '   ' + Format(_('Modificando stock de %s (%d --> %d) - %s'), [Articulo, Trunc(StockPrestashop), Trunc(Stock), Titulo]);
                 DMMain.Log(Format(_('Modificando stock de %s (%d --> %d) - %s'), [Articulo, Trunc(StockPrestashop), Trunc(Stock), Titulo]));
                 if (Stock < 0) then
                    Nodo.Text := IntToStr(Trunc(0))
                 else
                    Nodo.Text := IntToStr(Trunc(Stock));

                 // Obtengo datos del stock
                 CodigoRespuesta := DMPrestashop.WS_Edit('stock_availables', id_stock_available, XML, Respuesta);
                 {$IFDEF Debug}
                 Respuesta.SaveToFile(DameTempPath+'Respuesta-stock_availables-EDIT.xml');
                 {$ENDIF}

                 DMMain.Log(Format(_('Modificando stock de %s (%d --> %d) - Cod. Respuesta: %d - %s'), [Articulo, Trunc(StockPrestashop), Trunc(Stock), CodigoRespuesta, Titulo]));

                 if (CodigoRespuesta <> 200) then
                 begin
                    Log[Log.Count - 1] := '   ' + Format(_('Error Modificando stock de %s (%d --> %d) - Cod. Respuesta: %d - %s'), [Articulo, Trunc(StockPrestashop), Trunc(Stock), CodigoRespuesta, Titulo]);
                    Log.Add(Respuesta.Text);

                    DMMain.Log(Format(_('Error Modificando stock de %s (%d --> %d) - Cod. Respuesta: %d - %s'), [Articulo, Trunc(StockPrestashop), Trunc(Stock), CodigoRespuesta, Titulo]));
                    DMMain.Log(Respuesta.Text);
                 end;

                 Result := CodigoRespuesta;
              end
              else
                 Result := 200;
           end;
        end;
     end
     else
        Log.Add('   ' + '(stock_availables)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('id_stock_available: %d - articulo: %s- Respuesta: %d', [id_stock_available, Articulo, CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaStockAvailable(Desde, Hasta: TDateTime; IdConfiguracion: integer): boolean;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  //Nodo : IXMLNode;

  idStockAvailable : integer;
  id_product : integer;
  id_product_attribute : integer;
  id_shop : integer;
  id_shop_group : integer;
  quantity : double;
  depends_on_stock : integer;
  out_of_stock : integer;
  location : string;
begin
  Result := True;
  //CodigoRespuesta := 200;
  FSendCorreo.Texto(_('Obteniendo Articulos a sincrinizar stock.'));
  DMMain.LogIni(_('Sincronizando Stock Articulos Prestashop'));
  Log.Add(_('Sincronizando Stock Articulos Prestashop'));

  // Stock para el producto/combinacion
  // http://prestashop.delfos.net/api/stock_availables/2?ws_key=ABC123ABC123ABC123ABC123ABC123AB

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del stock
     CodigoRespuesta := DMPrestashop.WS_Get('stock_availables', 0, '&display=full', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-stock_availables.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoPadre := DameNodo(Documento.DocumentElement, ['stock_availables']);
           if Assigned(NodoPadre) then
           begin
              NodoPadre := DameNodo(NodoPadre, ['stock_available']);
              while Assigned(NodoPadre) do
              begin
                 idStockAvailable := StrToIntDef(DameDato(NodoPadre, ['id']), 0);
                 id_product := StrToIntDef(DameDato(NodoPadre, ['id_product']), 0);
                 id_product_attribute := StrToIntDef(DameDato(NodoPadre, ['id_product_attribute']), 0);
                 id_shop := StrToIntDef(DameDato(NodoPadre, ['id_shop']), 0);
                 id_shop_group := StrToIntDef(DameDato(NodoPadre, ['id_shop_group']), 0);
                 quantity := StrToFloatDec(DameDato(NodoPadre, ['quantity']), '.');
                 depends_on_stock := StrToIntDef(DameDato(NodoPadre, ['depends_on_stock']), 0);
                 out_of_stock := StrToIntDef(DameDato(NodoPadre, ['out_of_stock']), 0);
                 location := DameDato(NodoPadre, ['location']);

                 FSendCorreo.Texto(Format(_('Sincronizando Stock Articulos Prestashop - idStockAvailable: %d'), [idStockAvailable]));
                 Log[Log.Count - 1] := '   ' + Format(_('Sincronizando Stock Articulos Prestashop - idStockAvailable: %d'), [idStockAvailable]);

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_STOCK_AV ( ');
                       SQL.Add(' ID_CONFIGURACION, ID_STOCK_AVAILABLE, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_SHOP, ID_SHOP_GROUP, QUANTITY, ');
                       SQL.Add(' DEPENDS_ON_STOCK, OUT_OF_STOCK, LOCATION, /*RAW_XML,*/ ULT_SINCRONIZACION) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :ID_CONFIGURACION, :ID_STOCK_AVAILABLE, :ID_PRODUCT, :ID_PRODUCT_ATTRIBUTE, :ID_SHOP, :ID_SHOP_GROUP, :QUANTITY, ');
                       SQL.Add(' :DEPENDS_ON_STOCK, :OUT_OF_STOCK, :LOCATION, /*RAW_XML,*/ :ULT_SINCRONIZACION) ');
                       SQL.Add(' MATCHING (ID_CONFIGURACION, ID_STOCK_AVAILABLE) ');

                       Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                       Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := idStockAvailable;
                       Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                       Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
                       Params.ByName['ID_SHOP'].AsInteger := id_shop;
                       Params.ByName['ID_SHOP_GROUP'].AsInteger := id_shop_group;
                       Params.ByName['QUANTITY'].AsFloat := quantity;
                       Params.ByName['DEPENDS_ON_STOCK'].AsInteger := depends_on_stock;
                       Params.ByName['OUT_OF_STOCK'].AsInteger := out_of_stock;
                       Params.ByName['LOCATION'].AsString := location;
                       Params.ByName['ULT_SINCRONIZACION'].AsDateTime := Now;
                       // Aparentemente esto hace que la base crezca mucho
                       // Params.ByName['RAW_XML'].AsString := XML.Text;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 NodoPadre := NodoPadre.NextSibling;
              end;
              Log.Add(_('Sincronizando Stock Articulos Prestashop - Finalizada'));
           end;
        end;
     end
     else
     begin
        ShowMessage('(stock_availables)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
        Result := False;
     end;
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaPrecioArticulos(Desde, Hasta: TDateTime): integer;
var
  CodigoRespuesta : integer;
  TarifaIVAIncluido : boolean;
  Precio : double;
begin
  Result := 0;
  //CodigoRespuesta := 200;
  FSendCorreo.Texto(_('Obteniendo Articulos a sincrinizar precio.'));
  DMMain.LogIni(_('Sincronizando Precio Articulos'));
  Log.Add(_('Sincronizando Precio Articulos'));

  TarifaIVAIncluido := TarifaEsIvaIncluido(QMConfPrestaShopTARIFA.AsString);

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT T.ID_A, T.ARTICULO, T.PRECIO_VENTA, P.ID_PRODUCT, P.ID_PRODUCT_ATTRIBUTE, T.ULT_MODIFICACION, A.TITULO_LARGO AS TITULO, I.P_IVA ');
           SelectSQL.Add(' FROM ART_TARIFAS_PRECIOS T ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON T.ID_A = A.ID_A ');
           SelectSQL.Add(' JOIN CON_CUENTAS_GES_ART C ON A.EMPRESA = C.EMPRESA AND A.ARTICULO = C.ARTICULO ');
           SelectSQL.Add(' JOIN EMP_CANALES CC ON C.EMPRESA = CC.EMPRESA AND C.EJERCICIO = CC.EJERCICIO AND C.CANAL = CC.CANAL ');
           SelectSQL.Add(' JOIN SYS_TIPO_IVA I ON C.TIPO_IVA = I.TIPO AND CC.PAIS = I.PAIS ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP_ARTICULO P ON T.ID_A = P.ID_A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' C.CANAL = :CANAL AND ');
           SelectSQL.Add(' T.TARIFA = :TARIFA AND ');
           SelectSQL.Add(' T.ULT_MODIFICACION > :ULT_MODIFICACION AND ');
           SelectSQL.Add(' P.ID_CONFIGURACION = :ID ');
           SelectSQL.Add(' AND A.WEB = 1 ');
           SelectSQL.Add(' ORDER BY T.ULT_MODIFICACION ');
           Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
           Params.ByName['TARIFA'].AsString := QMConfPrestaShopTARIFA.AsString;
           Params.ByName['ID'].AsInteger := QMConfPrestaShopID.AsInteger;
           Params.ByName['ULT_MODIFICACION'].AsDateTime := Desde;
           Open;

           // Sincronizo los articulos aunque se generen errores
           while ((not EOF) {and (CodigoRespuesta = 200)}) do
           begin
              FSendCorreo.Texto(format(_('Sincronizando Precio Articulo %s %s'), [FieldByName('ARTICULO').AsString, FieldByName('TITULO').AsString]));
              if (FieldByName('ULT_MODIFICACION').AsDateTime > Desde) then
              begin
                 Precio := FieldByName('PRECIO_VENTA').AsFloat;
                 if TarifaIVAIncluido then
                 begin
                    // Quito la cuota del IVA dejando 6 dígitos decimales.
                    Precio := SimpleRoundTo(Precio / (1 + FieldByName('P_IVA').AsFloat / 100), -6);
                 end;

                 CodigoRespuesta := SincronizaPrecioUnArticulo(Precio, FieldByName('ID_PRODUCT').AsInteger, FieldByName('ID_PRODUCT_ATTRIBUTE').AsInteger, FieldByName('ARTICULO').AsString, FieldByName('TITULO').AsString);

                 if (CodigoRespuesta <> 200) then
                    Result := CodigoRespuesta;
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

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTienda.SincronizaPrecioUnArticulo(Precio: double; id_product, id_product_attribute: integer; Articulo, Titulo: string): integer;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
  PrecioPrestashop : double;
begin
  Result := 0;

  //PrecioPrestashop := 0;

  Log.Add('   ' + Format(_('Sincronizando precio de %s - %s'), [Articulo, Titulo]));
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del stock
     CodigoRespuesta := DMPrestashop.WS_Get('products', id_product, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-products.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoPadre := DameNodo(Documento.DocumentElement, ['product']);
           if Assigned(NodoPadre) then
           begin
              // Nodos ReadOnly
              NodoPadre.ChildNodes.Delete('quantity');
              NodoPadre.ChildNodes.Delete('manufacturer_name');
              {
              Nodo := DameNodo(NodoPadre, ['quantity']);
              FreeAndNil(Nodo);
              Nodo := DameNodo(NodoPadre, ['manufacturer_name']);
              FreeAndNil(Nodo);
              }

              Nodo := DameNodo(NodoPadre, ['price']);
              PrecioPrestashop := StrToFloatDec(Nodo.Text, '.');

              Log[Log.Count - 1] := '   ' + Format(_('Sincronizando precio de %s (%.2f --> %.2f) - %s'), [Articulo, PrecioPrestashop, Precio, Titulo]);

              // Solo modifico si hay una diferencia razonable
              // Prestashop solo maneja stock de enteros
              if (abs(PrecioPrestashop - Precio) > 0.01) then
              begin
                 Log[Log.Count - 1] := '   ' + Format(_('Modificando precio de %s (%.2f --> %.2f) - %s'), [Articulo, PrecioPrestashop, Precio, Titulo]);
                 DMMain.Log(Format(_('Modificando precio de %s (%.2f --> %.2f) - %s'), [Articulo, PrecioPrestashop, Precio, Titulo]));
                 Nodo.Text := FormatAmount(Precio, 6);

                 // Obtengo datos del stock
                 CodigoRespuesta := DMPrestashop.WS_Edit('products', id_product, XML, Respuesta);
                 {$IFDEF Debug}
                 Respuesta.SaveToFile(DameTempPath+'Respuesta-products-EDIT.xml');
                 {$ENDIF}

                 // Para evitar colapsar el servidor web
                 Sleep(500);

                 DMMain.Log(Format(_('Modificando precio de %s (%.2f --> %.2f) - Cod. Respuesta: %d - %s'), [Articulo, PrecioPrestashop, Precio, CodigoRespuesta, Titulo]));

                 if (CodigoRespuesta <> 200) then
                 begin
                    Log[Log.Count - 1] := '   ' + Format(_('Error Modificando precio de %s (%.2f --> %.2f) - Cod. Respuesta: %d - %s'), [Articulo, PrecioPrestashop, Precio, CodigoRespuesta, Titulo]);
                    Log.Add(Respuesta.Text);
                    DMMain.Log(Format(_('Error Modificando precio de %s (%.2f --> %.2f) - Cod. Respuesta: %d - %s'), [Articulo, PrecioPrestashop, Precio, CodigoRespuesta, Titulo]));
                    DMMain.Log(Respuesta.Text);
                 end;

                 Result := CodigoRespuesta;
              end
              else
                 Result := 200;
           end;
        end;
     end
     else
        ShowMessage('(products)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionTienda.SincronizaEstadoOrdenPrestashop(IdConfiguracion: integer; Desde, Hasta: TDateTime): integer;
var
  CodigoRespuesta : integer;
  //TarifaIVAIncluido : boolean;
  //Precio : double;
begin
  Result := 0;
  //CodigoRespuesta := 200;
  FSendCorreo.Texto(_('Obteniendo ordenes a sincrinizar.'));
  DMMain.LogIni(_('Sincronizando Estado Orden Prestashop'));
  Log.Add(_('Sincronizando Estado Orden Prestashop'));


  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           // Ordenes con pedido hecho y traspasado a albarán que tienen un "Cambio de Estado PS" establecido.
           SelectSQL.Add(' SELECT DISTINCT O.ID_CONFIGURACION, O.ID_ORDER, O.CURRENT_STATE, S.ACTUALIZAR_ESTADO_PS, C.ESTADO, R.D_TIPO ');
           SelectSQL.Add(' FROM SYS_CONF_PRESTASHOP_ORDER O ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP_O_STATE S ON O.ID_CONFIGURACION = S.ID_CONFIGURACION AND O.CURRENT_STATE = S.ID ');
           SelectSQL.Add(' JOIN SYS_CONF_PRESTASHOP_PEC P ON O.ID_CONFIGURACION = P.ID_CONFIGURACION AND O.ID_ORDER = P.ID_ORDER ');
           SelectSQL.Add(' JOIN GES_CABECERAS_S C ON P.ID_S = C.ID_S ');
           SelectSQL.Add(' JOIN GES_CABECERAS_RELACIONES R ON R.O_ID_S = C.ID_S ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' O.ID_CONFIGURACION = :ID_CONFIGURACION AND ');
           SelectSQL.Add(' O.INVOICE_NUMBER <> 0 AND ');
           SelectSQL.Add(' S.ACTUALIZAR_ESTADO_PS <> 0 AND ');
           SelectSQL.Add(' C.ESTADO = 5 AND ');
           SelectSQL.Add(' R.D_TIPO = ''ALB'' ');
           SelectSQL.Add(' ORDER BY O.ID_ORDER ');
           Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
           Open;

           // Sincronizo los estados aunque se generen errores
           while ((not EOF) {and (CodigoRespuesta = 200)}) do
           begin
              FSendCorreo.Texto(format(_('Sincronizando Estado de Orden %d (%d -> %d)'), [FieldByName('ID_ORDER').AsInteger, FieldByName('CURRENT_STATE').AsInteger, FieldByName('ACTUALIZAR_ESTADO_PS').AsInteger]));
              {No se tiene en cuenta filtro de fecha
              if (FieldByName('ULT_MODIFICACION').AsDateTime > Desde) then
              begin
              }
              CodigoRespuesta := SincronizaEstadoUnaOrdenPrestashop(FieldByName('ID_ORDER').AsInteger, FieldByName('ACTUALIZAR_ESTADO_PS').AsInteger);

              if (CodigoRespuesta <> 200) and (CodigoRespuesta <> 201) then
                 Result := CodigoRespuesta;
              {
              end;
              }

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

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTienda.SincronizaEstadoUnaOrdenPrestashop(IdOrder, NuevoEstado: integer): integer;
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
  //PrecioPrestashop : double;
begin
  Result := 0;

  Log.Add('   ' + Format(_('Sincronizando estado de orden %d a %d'), [IdOrder, NuevoEstado]));
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del stock
     CodigoRespuesta := DMPrestashop.WS_Get('order_histories', 0, '&schema=blank', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-order_histories-blank.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoPadre := DameNodo(Documento.DocumentElement, ['order_history']);
           if Assigned(NodoPadre) then
           begin
              { Dejamos en blanco ya que es un INSERT
              Nodo := DameNodo(NodoPadre, ['id']);
              if Assigned(Nodo) then
                 Nodo.Text := IntToStr(IdOrder);
              }
              Nodo := DameNodo(NodoPadre, ['id_employee']);
              if Assigned(Nodo) then
                 Nodo.Text := IntToStr(1);

              Nodo := DameNodo(NodoPadre, ['id_order_state']);
              if Assigned(Nodo) then
                 Nodo.Text := IntToStr(NuevoEstado);

              Nodo := DameNodo(NodoPadre, ['id_order']);
              if Assigned(Nodo) then
                 Nodo.Text := IntToStr(IdOrder);

              { Dejamos en blanco ya que es un INSERT
              Nodo := DameNodo(NodoPadre, ['date_add']);
              if Assigned(Nodo) then
                 Nodo.Text := Now;
              }

              // Envio nuevo estado para la orden
              CodigoRespuesta := DMPrestashop.WS_Add('order_histories', XML, Respuesta);
              // CodigoRespuesta := 200;
              // Respuesta.Text := XML.Text;

                 {$IFDEF Debug}
                 Respuesta.SaveToFile(DameTempPath+format('Respuesta-order_histories-%d.xml', [IdOrder]));
                 {$ENDIF}

              // Para evitar colapsar el servidor web
              Sleep(250);

              if (CodigoRespuesta <> 200) and (CodigoRespuesta <> 201) then
              begin
                 Log[Log.Count - 1] := '   ' + Format(_('Error Modificando estado de ordern %d - Cod. Respuesta: %d'), [IdOrder, CodigoRespuesta]);
                 Log.Add(Respuesta.Text);
                 DMMain.Log(Format(_('Error Modificando estado de ordern %d - Cod. Respuesta: %d'), [IdOrder, CodigoRespuesta]));
                 DMMain.Log(Respuesta.Text);
              end;

              Result := CodigoRespuesta;
           end;
        end;
     end
     else
        ShowMessage('(order_histories)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;
end;

procedure TDMSincronizacionTienda.CrearArticulosFiltrados;
begin
  if Assigned(FMArticulos) then
  begin
     with FMArticulos.DM.QMArticulos do
     begin
        Last;
        if ConfirmaMensaje(format(_('Desea subir %d articulos a la tienda Prestashop'), [RecordCount])) then
        begin
           if (InicializaWebService) then
           begin
              First;
              while not EOF do
              begin
                 if (FieldByName('WEB').AsInteger = 1) then
                    CrearUnArticulo(FieldByName('ID_A').AsInteger);

                 Next;
              end;
           end
           else
              ShowMessage(_('No se pudo inicializar el servicio web'));
        end;
        SaveLog('Sincronizacion' + FormatDateTime('_yyyymmdd_hhnnss', Now) + '.Log');
     end;
  end;
end;

function TDMSincronizacionTienda.SincronizaListaArticulos(Desde, Hasta: TDateTime; IdConfiguracion: integer): boolean;
var
  i : integer;
  id : integer;
  date_upd : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  RegistroInicial, Cantidad, RegistrosLeidos, RegistrosTratados : integer;
begin
  Result := True;
  DescripcionAtribtos.Clear;

  // Recorremos de a 100 registros y esperamos 30 segundos para evitar sobrecargar al servidor.
  Cantidad := 50;
  RegistroInicial := 0;
  RegistrosLeidos := 1;
  //RegistrosTratados := 0;

  while (RegistrosLeidos > 0) do
  begin
     RegistrosLeidos := 0;
     RegistrosTratados := 0;

     Log.Add(format(_('Obteniendo Articulos. (Registro Inicial: %d x %d)'), [RegistroInicial, Cantidad]));
     FSendCorreo.Texto(format(_('Obteniendo Articulos. (Registro Inicial: %d x %d)'), [RegistroInicial, Cantidad]));

     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        // Filtro por fecha de ultima modificacion apareció aproximadamente en esta versión
        if DMPrestashop.SuperaVersion('1.6.0.8') then
           CodigoRespuesta := DMPrestashop.WS_Get('products', 0, '&display=[id,date_upd]&filter[date_upd]=[' + FormatDateTime('yyyy-mm-dd', Desde) + ',' + FormatDateTime('yyyy-mm-dd', Hasta + 1) + ']&date=1&limit=' + IntToStr(RegistroInicial) + ',' + IntToStr(Cantidad) + '&sort=[id_ASC]', Respuesta)
        else
           CodigoRespuesta := DMPrestashop.WS_Get('products', 0, '&display=[id,date_upd]&limit=' + IntToStr(RegistroInicial) + ',' + IntToStr(Cantidad) + '&sort=[id_ASC]', Respuesta);
        {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath+'Respuesta-Products.xml');
        {$ENDIF}

        // Si la respuesta es correcta
        if (CodigoRespuesta = 200) then
        begin
           with Documento do
           begin
              XML.Text := Respuesta.Text;
              Active := True;

              // Recorro los productos
              NodoPadre := DameNodo(Documento.DocumentElement, ['products']);
              if Assigned(NodoPadre) then
              begin
                 for i := 0 to NodoPadre.ChildNodes.Count - 1 do
                 begin
                    Inc(RegistrosLeidos);

                    Nodo := NodoPadre.ChildNodes.Get(i);

                    id := StrToInt(DameDato(Nodo, ['id']));
                    date_upd := DameDato(Nodo, ['date_upd']);

                    FSendCorreo.Texto(format(_('Obteniendo Articulos. (Registro Inicial: %d x %d)') + #13#10 + 'Elemento %d - Id Producto: %d - date_upd: %s', [RegistroInicial, Cantidad, i, id, date_upd]));
                    DMMain.Log(format(_('Obteniendo Articulos. (Registro Inicial: %d x %d)') + #13#10 + 'Elemento %d - Id Producto: %d - date_upd: %s', [RegistroInicial, Cantidad, i, id, date_upd]));
                    DMMain.Log(FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta) + ' > ' + date_upd + ' > ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde));
                    // Si la fecha de modificacion esta dentro de los parametros
                    if ((date_upd > FormatDateTime('yyyy-mm-dd hh:nn:ss', Desde)) and
                       (date_upd < FormatDateTime('yyyy-mm-dd hh:nn:ss', Hasta))) then
                    begin
                       Inc(RegistrosTratados);

                       if (not SincronizaItemListaArticulo(id, IdConfiguracion)) then
                       begin
                          Result := False;
                          DMMain.Log('Error sincronizadondo');
                       end;
                    end;
                 end;
              end;
           end;
        end
        else
           ShowMessage('(products)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     finally
        Respuesta.Free;
        Documento.Free;
     end;

     RegistroInicial := RegistroInicial + Cantidad;

     // Pausa para evitar subrecargar al servidor Prestashop
     if (RegistrosTratados <> 0) and (RegistrosLeidos <> 0) then
     begin
        for i := 1 to 30 do
        begin
           FSendCorreo.Texto(format(_('Obteniendo Articulos. (Esperando %d de 30 sgundos)'), [i]));
           {$IFDEF DEBUG}
           Sleep(1);
           {$ENDIF}
           {$IFNDEF DEBUG}
           Sleep(1000);
           {$ENDIF}
        end;
     end;
  end;
end;

function TDMSincronizacionTienda.SincronizaItemListaArticulo(id_product, IdConfiguracion: integer): boolean;
var
  //i : integer;
  //id : integer;
  product_type : string;
  reference : string;
  ean13 : string;
  upc : string;
  isbn : string;
  product_name, product_name_combination : string;
  DescripcionCorta : string;
  DescripcionLarga : string;
  id_supplier : integer;
  id_manufacturer : integer;
  id_stock_available : integer;
  quantity : double;
  price : double;
  Stock : double;
  weight : double;
  id_tax_rules_group : integer;
  //PrecioVentaIVAIncluido : double;
  //rate : double;
  date_upd : string;
  //ArticuloConMismoCodigoBarra : string;
  // Primera Familia - Familia por defecto - La familia del articulo
  id_category_default : integer;

  { TODO : Tratar estos campos }
  supplier_reference : string;
  activo : integer;

  Combinaciones, StockAvailable, Categorias : TStrings;
  id_product_attribute : integer;
  id_attribute : string;

  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
  //s : string;
  //Precio : double;
  //Fabricante : integer;
  //Familia, SubFamilia : string;
  id_combination : integer;
  sufijo_nombre : string;
  //ArticuloNuevo : boolean;
begin
  /// Sincroniza el id_product con un articulo.
  /// Si se realiza con exito devuelve el numero de id_articulo asociado

  Log.Add(Format(_('Sincronizando producto %d'), [id_product]));
  Result := True;

  Combinaciones := TStringList.Create;
  StockAvailable := TStringList.Create;
  Categorias := TStringList.Create;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Obtengo datos del fabricantes
     CodigoRespuesta := DMPrestashop.WS_Get('products', id_product, '', Respuesta);
     {$IFDEF Debug}
     Respuesta.SaveToFile(DameTempPath+'Respuesta-Product.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           // Datos del producto
           NodoPadre := DameNodo(Documento.DocumentElement, ['product']);
           if Assigned(NodoPadre) then
           begin
              //id := StrToInt(DameDato(NodoPadre, ['id']));
              id_manufacturer := StrToInt(DameDato(NodoPadre, ['id_manufacturer']));
              id_supplier := StrToInt(DameDato(NodoPadre, ['id_supplier']));
              id_category_default := StrToInt(DameDato(NodoPadre, ['id_category_default']));
              product_type := DameDato(NodoPadre, ['type']);
              reference := DameDato(NodoPadre, ['reference']);
              supplier_reference := DameDato(NodoPadre, ['supplier_reference']);
              ean13 := DameDato(NodoPadre, ['ean13']);
              upc := DameDato(NodoPadre, ['upc']);
              isbn := DameDato(NodoPadre, ['isbn']);

              Nodo := DameNodo(NodoPadre, ['name']);
              product_name := DameDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger);

              Nodo := DameNodo(NodoPadre, ['description_short']);
              DescripcionCorta := DameDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger);

              Nodo := DameNodo(NodoPadre, ['description']);
              DescripcionLarga := DameDatoLenguage(Nodo, QMConfPrestaShopWS_LANGUAGE.AsInteger);

              weight := StrToFloatDec(DameDato(NodoPadre, ['weight']), '.');
              price := StrToFloatDec(DameDato(NodoPadre, ['price']), '.');
              // Este dato esta repartido en id_stock_available
              // quantity := StrToFloatDec(DameDato(NodoPadre, ['quantity']), '.');
              id_tax_rules_group := StrToInt(DameDato(NodoPadre, ['id_tax_rules_group']));

              { TODO : Ver si esto hay que asignarlo al campo ART_ARTICULOS.BAJA }
              activo := StrToInt(DameDato(NodoPadre, ['active']));
              date_upd := DameDato(NodoPadre, ['date_upd']);

              // Obtengo categorias
              Nodo := DameNodo(NodoPadre, ['associations', 'categories', 'category']);
              while Assigned(Nodo) do
              begin
                 Categorias.Add(DameDato(Nodo, ['id']));
                 Nodo := Nodo.NextSibling;
              end;

              // Dependiendo de la versión de Prestashop las combinacciones estan dentro de combination*S* o combination.
              // Anterior a version 1.6.1.x
              Nodo := DameNodo(NodoPadre, ['associations', 'combinations', 'combinations']);
              while Assigned(Nodo) do
              begin
                 Combinaciones.Add(DameDato(Nodo, ['id']));
                 Nodo := Nodo.NextSibling;
              end;

              // Posterior a version 1.6.1.x
              Nodo := DameNodo(NodoPadre, ['associations', 'combinations', 'combination']);
              while Assigned(Nodo) do
              begin
                 Combinaciones.Add(DameDato(Nodo, ['id']));
                 Nodo := Nodo.NextSibling;
              end;

              // Ordeno numericamente
              TStringList(Combinaciones).CustomSort(@CompareNumbers);

              // Si no tiene combinaciones, agrego la combinacion 0 para que el bucle se ejecute por lo menos una vez.
              if Combinaciones.Count = 0 then
                 Combinaciones.Add('0');

              Nodo := DameNodo(NodoPadre, ['associations', 'stock_availables', 'stock_available']);
              while Assigned(Nodo) do
              begin
                 StockAvailable.Values[DameDato(Nodo, ['id_product_attribute'])] := DameDato(Nodo, ['id']);
                 Nodo := Nodo.NextSibling;
              end;

              {
              // Datos comunes para todas las combinaciones
              rate := DamePorcentajeIVA(id_tax_rules_group, DMPrestashop.id_country);
              Fabricante := DameFabricante(QMConfPrestaShopEMPRESA.AsInteger, DameIdFabricantePrestaShop(IdConfiguracion, id_manufacturer));
              Familia := DameFamilia(DameIdFamiliaPrestaShop(IdConfiguracion, id_category_default));
              IdFamilia := DameIdFamilia(Familia, QMConfPrestaShopEMPRESA.AsInteger);

              // Busco la subfamilia dentro de las categorias
              IdSubFamilia := 0;
              while ((IdSubFamilia = 0) and (Categorias.Count > 0)) do
              begin
                 IdSubFamilia := DameIdSubFamiliaPrestaShop(IdConfiguracion, StrToInt(Categorias[0]));
                 Categorias.Delete(0);
              end;
              SubFamilia := DameSubFamilia(IdSubFamilia);
              }
              DMMain.Log(Format('Combinaciones %d (%s)', [Combinaciones.Count, Combinaciones.CommaText]));

              Log[Log.Count - 1] := Format(_('Sincronizando producto %d - %s - %s'), [id_product, reference, product_name]);

              while Combinaciones.Count > 0 do
              begin
                 id_combination := StrToInt(Combinaciones[0]);
                 DMMain.Log(Format('Sincronizando Combinacion %d', [id_combination]));

                 id_product_attribute := id_combination;
                 // Lista de atributos
                 id_attribute := '';

                 id_stock_available := StrToIntDef(StockAvailable.Values[IntToStr(id_combination)], 0);
                 Stock := DameStock(id_stock_available);

                 if (id_combination <> 0) then
                    DameDatosCombinacion(id_combination, ean13, upc, reference, supplier_reference, price, weight, quantity, id_attribute, sufijo_nombre);

                 Log[Log.Count - 1] := Format('Sincronizando Combinacion %d (Atr: %d - Ref:%s - IdAtr:%s - [%s] + [%s] - IdStockAvail : %d - Stock: %.2f)', [id_combination, id_product_attribute, reference, id_attribute, product_name, sufijo_nombre, id_stock_available, Stock]);
                 FSendCorreo.Texto(Format(_('Articulo: %d(%s) - %s %s' + #13#10 + 'Modificado: %s'), [id_product, id_attribute, product_name, sufijo_nombre, date_upd]));

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       product_name_combination := Trim(product_name);
                       if (sufijo_nombre > '') then
                          product_name_combination := product_name_combination + ' ' + sufijo_nombre;
                       if (Trim(product_name_combination) = '') then
                          product_name_combination := reference;

                       DMMain.Log('ID_CONFIGURACION ' + IntToStr(IdConfiguracion));
                       DMMain.Log('ID_PRODUCT ' + IntToStr(id_product));
                       DMMain.Log('ID_COMBINATION ' + IntToStr(id_combination));
                       DMMain.Log('TITULO ' + product_name_combination);
                       DMMain.Log('PRECIO ' + FloatToStr(price));
                       DMMain.Log('STOCK ' + FloatToStr(Stock));
                       DMMain.Log('ULT_SINCRONIZACION ' + DateTimeToStr(MySQLDateTimeToDateTime(date_upd)));

                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_PRODUCT ( ');
                       SQL.Add(' ID_CONFIGURACION, ID_PRODUCT, ID_ATTRIBUTE, ID_ATTRIBUTES, ID_PRODUCT_ATTRIBUTE, ID_MANUFACTURER, ID_SUPPLIER, ');
                       SQL.Add(' ID_CATEGORY_DEFAULT, REFERENCE, SUPPLIER_REFERENCE, EAN13, UPC, ISBN, PRODUCT_NAME, DESCRIPCIONCORTA, DESCRIPCIONLARGA, ');
                       SQL.Add(' WEIGHT, PRICE, ID_TAX_RULES_GROUP, PRODUCT_ACTIVE, STOCK, ID_STOCK_AVAILABLE, DATE_UPD, /*RAW_XML,*/ IS_PACK) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :ID_CONFIGURACION, :ID_PRODUCT, :ID_ATTRIBUTE, :ID_ATTRIBUTES, :ID_PRODUCT_ATTRIBUTE, :ID_MANUFACTURER, :ID_SUPPLIER, ');
                       SQL.Add(' :ID_CATEGORY_DEFAULT, :REFERENCE, :SUPPLIER_REFERENCE, :EAN13, :UPC, :ISBN, :PRODUCT_NAME, :DESCRIPCIONCORTA, ');
                       SQL.Add(' :DESCRIPCIONLARGA, :WEIGHT, :PRICE, :ID_TAX_RULES_GROUP, :PRODUCT_ACTIVE, :STOCK, :ID_STOCK_AVAILABLE, :DATE_UPD, ');
                       SQL.Add(' /*RAW_XML,*/ :IS_PACK) ');
                       SQL.Add(' MATCHING (ID_CONFIGURACION, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE) ');
                       Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
                       Params.ByName['ID_PRODUCT'].AsInteger := id_product;
                       Params.ByName['ID_ATTRIBUTE'].AsInteger := StrToIntDef(id_attribute, 0);
                       Params.ByName['ID_ATTRIBUTES'].AsString := Copy(id_attribute, 1, 25);
                       Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := id_product_attribute;
                       Params.ByName['ID_MANUFACTURER'].AsInteger := id_manufacturer;
                       Params.ByName['ID_SUPPLIER'].AsInteger := id_supplier;
                       Params.ByName['ID_CATEGORY_DEFAULT'].AsInteger := id_category_default;
                       Params.ByName['REFERENCE'].AsString := Copy(reference, 1, 256);
                       Params.ByName['SUPPLIER_REFERENCE'].AsString := supplier_reference;
                       Params.ByName['EAN13'].AsString := Copy(ean13, 1, 25);
                       Params.ByName['UPC'].AsString := Copy(upc, 1, 25);
                       Params.ByName['ISBN'].AsString := Copy(isbn, 1, 25);
                       Params.ByName['PRODUCT_NAME'].AsString := Copy(product_name_combination, 1, 256);
                       Params.ByName['DESCRIPCIONCORTA'].AsString := DescripcionCorta;
                       Params.ByName['DESCRIPCIONLARGA'].AsString := DescripcionLarga;
                       Params.ByName['ID_STOCK_AVAILABLE'].AsInteger := id_stock_available;
                       Params.ByName['WEIGHT'].AsFloat := weight;
                       Params.ByName['PRICE'].AsFloat := price;
                       Params.ByName['ID_TAX_RULES_GROUP'].AsInteger := id_tax_rules_group;
                       Params.ByName['PRODUCT_ACTIVE'].AsInteger := activo;
                       Params.ByName['DATE_UPD'].AsDateTime := MySQLDateTimeToDateTime(date_upd);
                       // Aparentemente esto hace que la base crezca mucho
                       // Params.ByName['RAW_XML'].AsString := Respuesta.Text;
                       if (product_type = 'pack') then
                          Params.ByName['IS_PACK'].AsInteger := 1
                       else
                          Params.ByName['IS_PACK'].AsInteger := 0;

                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 Combinaciones.Delete(0);
              end;
           end;
        end;
     end
     else
     begin
        Result := False;
        ShowMessage('(product)' + _('No se ha podido obtener datos de Prestashop.') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
     end;
  finally
     Combinaciones.Free;
     StockAvailable.Free;
     Categorias.Free;
     Respuesta.Free;
     Documento.Free;
  end;
end;

procedure TDMSincronizacionTienda.QMProductosPSARTICULOChange(Sender: TField);
begin
  QMProductosPSID_A.AsInteger := UDameDato.DameIdArticulo(QMProductosPSARTIcULO.AsString, QMConfPrestaShopEMPRESA.AsInteger);
end;

procedure TDMSincronizacionTienda.QMOrdersPSCalcFields(DataSet: TDataSet);
begin
  QMOrdersPSTITULO_ESTADO.AsString := DameTituloEstado(QMOrdersPSESTADO.AsInteger);
end;

procedure TDMSincronizacionTienda.FiltrarOrdersPS(Valor: string; SoloNoSincronizados: boolean);
begin
  /// Filtra Orders

  with QMOrdersPS do
  begin
     Close;
     SelectSQL.Clear;

     SelectSQL.Add(' SELECT * FROM VER_SYS_CONF_PRESTASHOP_ORDER ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if SoloNoSincronizados then
        SelectSQL.Add(' AND COALESCE(ID_S, 0) = 0 ');

     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_ORDER = :VALOR OR ');
           SelectSQL.Add(' CURRENT_STATE = :VALOR OR ');
           SelectSQL.Add(' DELIVERY_NUMBER = :VALOR OR ');
           SelectSQL.Add(' INVOICE_NUMBER = :VALOR OR ');
           SelectSQL.Add(' RIG = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(REFERENCE) LIKE ''%'' || UPPER(:VALOR) || ''%'' OR ');
        SelectSQL.Add(' UPPER(SHIPPING_NUMBER) LIKE ''%'' || UPPER(:VALOR) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_ORDER DESC');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
end;

procedure TDMSincronizacionTienda.RefrescarDatosSincronizacion;
begin
  /// Refresca los datos sincronizados

  Refrescar(QMConfPrestaShopCliente, 'ID_CUSTOMER', QMConfPrestaShopClienteID_CUSTOMER.AsInteger);
  Refrescar(QMConfPrestaShopClienteDir, 'ID_ADDRESS', QMConfPrestaShopClienteDirID_ADDRESS.AsInteger);
  Refrescar(QMConfPrestaShopArticulo, 'ID_ATTRIBUTE', QMConfPrestaShopArticuloID_ATTRIBUTE.AsInteger);
  Refrescar(QMProductosPS, 'ID_PRODUCT_ATTRIBUTE', QMProductosPSID_PRODUCT_ATTRIBUTE.AsInteger);
  Refrescar(QMOrdersPS, 'ID_ORDER', QMOrdersPSID_ORDER.AsInteger);
  Refrescar(QMOrdersStatesPS, 'ID', QMOrdersStatesPSID.AsInteger);
end;

function TDMSincronizacionTienda.RequiereLoteSimple(id_a: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT REQUIERE_LOTE_SIMPLE FROM ART_ARTICULOS WHERE ID_A = :ID_A';
        Params.ByName['ID_A'].AsInteger := id_a;
        ExecQuery;
        Result := (FieldByName['REQUIERE_LOTE_SIMPLE'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopClienteNewRecord(DataSet: TDataSet);
begin
  QMConfPrestaShopClienteID_CONFIGURACION.AsInteger := QMConfPrestaShopID.AsInteger;
  QMConfPrestaShopClienteULT_SINCRONIZACION.AsDateTime := Now;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopClienteDirNewRecord(DataSet: TDataSet);
begin
  QMConfPrestaShopClienteDirID_CONFIGURACION.AsInteger := QMConfPrestaShopID.AsInteger;
  QMConfPrestaShopClienteDirULT_SINCRONIZACION.AsDateTime := Now;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopArticuloNewRecord(DataSet: TDataSet);
begin
  QMConfPrestaShopArticuloID_CONFIGURACION.AsInteger := QMConfPrestaShopID.AsInteger;
  QMConfPrestaShopArticuloULT_SINCRONIZACION.AsDateTime := Now;
end;

procedure TDMSincronizacionTienda.QMConfPrestaShopTaxRuleGroupNewRecord(DataSet: TDataSet);
begin
  QMConfPrestaShopTaxRuleGroupID_CONFIGURACION.AsInteger := QMConfPrestaShopID.AsInteger;
end;

procedure TDMSincronizacionTienda.QMProductosPSNewRecord(DataSet: TDataSet);
begin
  QMProductosPSID_CONFIGURACION.AsInteger := QMConfPrestaShopID.AsInteger;
end;

procedure TDMSincronizacionTienda.QMPacksNewRecord(DataSet: TDataSet);
begin
  QMPacksID_CONFIGURACION.AsInteger := QMConfPrestaShopID.AsInteger;
end;

procedure TDMSincronizacionTienda.xStockAvailableCalcFields(DataSet: TDataSet);
begin
  if (xStockAvailableARTICULO.AsString > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           AutoTrans := False;
           Transaction := DameTransactionRW(DataBase);
           try
              Transaction.StartTransaction;
              SQL.Add(' SELECT STOCK, PEDIDOS_D_CLI FROM A_ART_DAME_STOCK2_PED(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA) ');
              Params.ByName['EMPRESA'].AsInteger := QMConfPrestaShopEMPRESA.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMConfPrestaShopCANAL.AsInteger;
              Params.ByName['ARTICULO'].AsString := xStockAvailableARTICULO.AsString;
              Params.ByName['ALMACEN'].AsString := QMConfPrestaShopALMACEN.AsString;
              Params.ByName['FECHA'].AsDateTime := EncodeDate(3000, 01, 01);
              ExecQuery;
              xStockAvailableSTOCK.AsFloat := FieldByName['STOCK'].AsFloat;
              xStockAvailablePEDIDOS_D_CLI.AsFloat := FieldByName['PEDIDOS_D_CLI'].AsFloat;
              xStockAvailableSTOCK_REAL.AsFloat := FieldByName['STOCK'].AsFloat - FieldByName['PEDIDOS_D_CLI'].AsFloat;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     xStockAvailableSTOCK.AsFloat := 0;
     xStockAvailablePEDIDOS_D_CLI.AsFloat := 0;
     xStockAvailableSTOCK_REAL.AsFloat := 0;
  end;
end;

procedure TDMSincronizacionTienda.FiltrarStockAvailable(Valor: string; SoloActivos, SoloSincronizados: boolean);
begin
  /// Filtra productos

  with xStockAvailable do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_SYS_CONF_PS_STOCK_AV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CONFIGURACION = :ID ');
     if SoloActivos then
        SelectSQL.Add(' AND PRODUCT_ACTIVE = 1 ');
     if SoloSincronizados then
        SelectSQL.Add(' AND COALESCE(ID_A, 0) <> 0 ');

     if (Trim(Valor) <> '') then
     begin
        SelectSQL.Add(' AND ( ');
        if (StrToIntDef(Valor, 0) <> 0) then
        begin
           SelectSQL.Add(' ID_STOCK_AVAILABLE = :VALOR OR ');
           SelectSQL.Add(' ID_PRODUCT = :VALOR OR ');
           SelectSQL.Add(' ID_PRODUCT_ATTRIBUTE = :VALOR OR ');
           SelectSQL.Add(' ID_A = :VALOR OR ');
        end;
        SelectSQL.Add(' UPPER(LOCATION) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' OR ');
        SelectSQL.Add(' UPPER(ARTICULO) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 15) || ''%'' OR ');
        SelectSQL.Add(' UPPER(REFERENCE) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' OR ');
        SelectSQL.Add(' UPPER(EAN13) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 25) || ''%'' OR ');
        SelectSQL.Add(' UPPER(PRODUCT_NAME) LIKE ''%'' || SUBSTRING(UPPER(:VALOR) FROM 1 FOR 256) || ''%'' ');
        SelectSQL.Add(' ) ');
     end;
     SelectSQL.Add(' ORDER BY ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_STOCK_AVAILABLE ');
     if (Trim(Valor) <> '') then
        Params.ByName['VALOR'].AsString := Trim(Valor);
     Open;
  end;
end;

function TDMSincronizacionTienda.SincronizaMegaProduct(IdConfiguracion, DesdeRegistro: integer): integer;
var
  //HayError : boolean;
  productattributes, s : string;
  i : integer;
  IdProduct, IdProductAttribute, Quantity : integer;
begin
  Result := DesdeRegistro;
  //HayError := False;
  FSendCorreo.Texto(_('Obteniendo Lista de Carritos MegaProduct'));
  DMMain.LogIni(_('Sincronizando Lista de Carritos MegaProduct'));
  Log.Add(_('Sincronizando Lista de Carritos MegaProduct'));

  if (QMConfPrestaShopDSN_MYSQL.AsString > '') then
  begin
     DMMain.Log(format('Conectando MySQL. DSN=%s', [QMConfPrestaShopDSN_MYSQL.AsString]));
     DMPrestashop.SetDSN(QMConfPrestaShopDSN_MYSQL.AsString, QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     if not DMPrestashop.MYSQLConnection.Connected then
        Log.Add(format('No se pudo conectar a MySQL para sincronizar Carritos MegaProduct. DSN=%s', [QMConfPrestaShopDSN_MYSQL.AsString]))
     else
     begin
        if not DMPrestashop.FiltraMegaProductCart(DesdeRegistro, SincronizarcionAutomatica) then
           Log.Add(format('No se pudo obtener informacion de Carritos MegaProduct. DSN=%s', [QMConfPrestaShopDSN_MYSQL.AsString]))
        else
        begin
           DMMain.Log('Recorro Carritos MegaProduct');
           DMPrestashop.QMySql.First;
           while (Result >= 0) and (not DMPrestashop.QMySql.EOF) do
           begin
              FSendCorreo.Texto(format(_('Carritos %d'), [DMPrestashop.QMySql.FieldByName('ID_MEGACART').AsInteger]));
              try
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE OR INSERT INTO SYS_CONF_PRESTASHOP_MEGAPROD ( ');
                       SQL.Add(' ID_CONFIGURACION, ID_MEGACART, ID_CART, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, QUANTITY, WIDTH, HEIGHT, MP_LENGTH, PRICE, ');
                       SQL.Add(' TAX_RATE, DISCOUNTS, PRICEATTR, CONFIG, ATTRIBUTES, PERSONALIZATION, QUANTITYATTRIBUTES, CONFIG_PRODUCT, EDITOPTIONS, ');
                       SQL.Add(' PRODUCTATTRIBUTES, EXTRACONTENT, ID_CUSTOMIZATION) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :ID_CONFIGURACION, :ID_MEGACART, :ID_CART, :ID_PRODUCT, :ID_PRODUCT_ATTRIBUTE, :QUANTITY, :WIDTH, :HEIGHT, :MP_LENGTH, ');
                       SQL.Add(' :PRICE, :TAX_RATE, :DISCOUNTS, :PRICEATTR, :CONFIG, :ATTRIBUTES, :PERSONALIZATION, :QUANTITYATTRIBUTES, ');
                       SQL.Add(' :CONFIG_PRODUCT, :EDITOPTIONS, :PRODUCTATTRIBUTES, :EXTRACONTENT, :ID_CUSTOMIZATION) ');
                       SQL.Add(' MATCHING (ID_CONFIGURACION, ID_MEGACART) ');

                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                       Params.ByName['ID_MEGACART'].AsInteger := DMPrestashop.QMySql.FieldByName('ID_MEGACART').AsInteger;
                       Params.ByName['ID_CART'].AsInteger := DMPrestashop.QMySql.FieldByName('ID_CART').AsInteger;
                       Params.ByName['ID_PRODUCT'].AsInteger := DMPrestashop.QMySql.FieldByName('id_product').AsInteger;
                       Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := DMPrestashop.QMySql.FieldByName('id_product_attribute').AsInteger;
                       Params.ByName['QUANTITY'].AsFloat := DMPrestashop.QMySql.FieldByName('quantity').AsFloat;
                       Params.ByName['WIDTH'].AsFloat := DMPrestashop.QMySql.FieldByName('WIDTH').AsFloat;
                       Params.ByName['MP_LENGTH'].AsFloat := DMPrestashop.QMySql.FieldByName('LENGTH').AsFloat;
                       Params.ByName['PRICE'].AsFloat := DMPrestashop.QMySql.FieldByName('PRICE').AsFloat;
                       Params.ByName['TAX_RATE'].AsFloat := DMPrestashop.QMySql.FieldByName('TAX_RATE').AsFloat;
                       Params.ByName['DISCOUNTS'].AsFloat := DMPrestashop.QMySql.FieldByName('DISCOUNTS').AsFloat;
                       Params.ByName['PRICEATTR'].AsFloat := DMPrestashop.QMySql.FieldByName('PRICEATTR').AsFloat;
                       Params.ByName['CONFIG'].AsString := Copy(DMPrestashop.QMySql.FieldByName('CONFIG').AsString, 1, 256);
                       Params.ByName['ATTRIBUTES'].AsString := Copy(DMPrestashop.QMySql.FieldByName('ATTRIBUTES').AsString, 1, 256);
                       Params.ByName['PERSONALIZATION'].AsString := Copy(DMPrestashop.QMySql.FieldByName('PERSONALIZATION').AsString, 1, 256);
                       Params.ByName['QUANTITYATTRIBUTES'].AsString := Copy(DMPrestashop.QMySql.FieldByName('QUANTITYATTRIBUTES').AsString, 1, 256);
                       Params.ByName['CONFIG_PRODUCT'].AsInteger := DMPrestashop.QMySql.FieldByName('CONFIG_PRODUCT').AsInteger;
                       Params.ByName['EDITOPTIONS'].AsString := Copy(DMPrestashop.QMySql.FieldByName('EDITOPTIONS').AsString, 1, 256);
                       Params.ByName['PRODUCTATTRIBUTES'].AsString := Copy(DMPrestashop.QMySql.FieldByName('PRODUCTATTRIBUTES').AsString, 1, 256);
                       Params.ByName['EXTRACONTENT'].AsString := Copy(DMPrestashop.QMySql.FieldByName('EXTRACONTENT').AsString, 1, 256);
                       Params.ByName['ID_CUSTOMIZATION'].AsInteger := DMPrestashop.QMySql.FieldByName('ID_CUSTOMIZATION').AsInteger;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 // Recorro el detalle del carrito
                 // Ejemplo: 1036|1-1072|1-813|1|0|12442
                 // Separado por guiones
                 //    > IdProduct|Quantity
                 //    > IdProduct|Quantity|0|IdProductAttribute

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' DELETE FROM SYS_CONF_PRESTASHOP_MEGAPRODD ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
                       SQL.Add(' ID_MEGACART = :ID_MEGACART ');

                       Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                       Params.ByName['ID_MEGACART'].AsInteger := DMPrestashop.QMySql.FieldByName('ID_MEGACART').AsInteger;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 productattributes := Copy(DMPrestashop.QMySql.FieldByName('PRODUCTATTRIBUTES').AsString, 1, 256);
                 DMMain.Log(format('productattributes=%s', [productattributes]));
                 while (Pos('-', productattributes) > 0) or (Length(productattributes) > 0) do
                 begin
                    // Obtengo primer termino
                    if (Pos('-', productattributes) > 0) then
                    begin
                       s := Copy(productattributes, 1, Pos('-', productattributes) - 1);
                       productattributes := Copy(productattributes, Pos('-', productattributes) + 1, Length(productattributes));
                    end
                    else
                    begin
                       s := productattributes;
                       productattributes := '';
                    end;
                    DMMain.Log(format('productattributes - Termino=%s', [s]));

                    // Obtengo IdProduct
                    IdProduct := StrToIntDef(Copy(s, 1, Pos('|', s) - 1), -1);
                    IdProductAttribute := 0;
                    //Quantity := 0;

                    // Obtengo la cantidad
                    s := Copy(s, Pos('|', s) + 1, Length(s));
                    if (Pos('|', s) > 0) then
                    begin
                       Quantity := StrToIntDef(Copy(s, 1, Pos('|', s) - 1), -1);
                       s := Copy(s, Pos('|', s) + 1, Length(s));
                    end
                    else
                    begin
                       Quantity := StrToIntDef(s, 0);
                       s := '';
                    end;

                    // Veo si esta el separador "0" para ver si hay atributo
                    if (Pos('|', s) > 0) then
                    begin
                       i := StrToIntDef(Copy(s, 1, Pos('|', s) - 1), -1);
                       s := Copy(s, Pos('|', s) + 1, Length(s));
                       if (i = 0) then
                       begin
                          IdProductAttribute := StrToIntDef(s, -1);
                       end;
                    end;

                    DMMain.Log(format('productattributes - IdProduct=%d, IdProductAttribute=%d, Quantity=%d', [IdProduct, IdProductAttribute, Quantity]));
                    if (IdProduct > 0) then
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO SYS_CONF_PRESTASHOP_MEGAPRODD ( ');
                             SQL.Add(' ID_CONFIGURACION, ID_MEGACART, ID_CART, ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, QUANTITY) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :ID_CONFIGURACION, :ID_MEGACART, :ID_CART, :ID_PRODUCT, :ID_PRODUCT_ATTRIBUTE, :QUANTITY) ');

                             Params.ByName['ID_CONFIGURACION'].AsInteger := QMConfPrestaShopID.AsInteger;
                             Params.ByName['ID_MEGACART'].AsInteger := DMPrestashop.QMySql.FieldByName('ID_MEGACART').AsInteger;
                             Params.ByName['ID_CART'].AsInteger := DMPrestashop.QMySql.FieldByName('ID_CART').AsInteger;
                             Params.ByName['ID_PRODUCT'].AsInteger := IdProduct;
                             Params.ByName['ID_PRODUCT_ATTRIBUTE'].AsInteger := IdProductAttribute;
                             Params.ByName['QUANTITY'].AsFloat := Quantity;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;
                 end;

                 Result := DMPrestashop.QMySql.FieldByName('ID_MEGACART').AsInteger;
              except
                 on E: Exception do
                 begin
                    DMMain.Log(format(_('ERROR insertando Carrito MegaProduct. (Id_MegaCart: %d)'), [DMPrestashop.QMySql.FieldByName('ID_MEGACART').AsInteger]) + #13#10 + E.Message);
                    Log.Add(format(_('ERROR insertando Carrito MegaProduct. (Id_MegaCart: %d)'), [DMPrestashop.QMySql.FieldByName('ID_MEGACART').AsInteger]) + #13#10 + E.Message);
                    Result := -1;
                 end;
              end;

              DMPrestashop.QMySql.Next;
           end;
        end;
     end;
  end;

  DMMain.LogFin('----------');
end;

function TDMSincronizacionTienda.DameUsuarioWarning(IdConfiguracion: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT USUARIO_WARNINGS FROM SYS_CONF_PRESTASHOP ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID = :ID ');
        Params.ByName['ID'].AsInteger := IdConfiguracion;
        ExecQuery;
        Result := FieldByName['USUARIO_WARNINGS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Result = 0) then
     Result := REntorno.Usuario;
end;

procedure TDMSincronizacionTienda.QMCategoryFAMILIAChange(Sender: TField);
begin
  QMCategoryID_FAMILIA.AsInteger := DameIDFamilia(QMCategoryFAMILIA.AsString, QMConfPrestaShopEMPRESA.AsInteger);
end;

procedure TDMSincronizacionTienda.QMCategorySUBFAMILIAChange(Sender: TField);
begin
  QMCategoryID_SUBFAMILIA.AsInteger := DameIDSubFamilia(QMCategoryID_FAMILIA.AsInteger, QMCategorySUBFAMILIA.AsString, QMConfPrestaShopEMPRESA.AsInteger);
end;

end.
