unit UFMSincronizacionTienda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFDBEditFind2000, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, RxDBComb, ULFMemo, UFPEdit, Buttons;

type
  TFMSincronizacionTienda = class(TFPEdit)
     LNombreFicha: TLFLabel;
     DBETitulo: TLFDbedit;
     LWeb: TLFLabel;
     DBEWeb: TLFDbedit;
     LWebBackoffice: TLFLabel;
     DBEWebBackoffice: TLFDbedit;
     LEmpresa: TLFLabel;
     DBEFEmpresa: TLFDBEditFind2000;
     ETituloEmpresa: TLFEdit;
     ETituloCanal: TLFEdit;
     DBEFCanal: TLFDBEditFind2000;
     LCanal: TLFLabel;
     LSerie: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     ETituloSerie: TLFEdit;
     ASincronizar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LPrefijoArticulo: TLFLabel;
     CBSincronizacionActiva: TLFDBCheckBox;
     DBEPrefijoArticulo: TLFDbedit;
     LAlmacen: TLFLabel;
     DBEFAlmacen: TLFDBEditFind2000;
     ETituloAlmacen: TLFEdit;
     LAgente: TLFLabel;
     DBEFAgente: TLFDBEditFind2000;
     ETituloAgente: TLFEdit;
     DBCBSoloClientesConPedido: TLFDBCheckBox;
     CBUtilizaModuloPaypal: TLFDBCheckBox;
     ASincronizarTodas: TAction;
     DBCBControlStockDesactivado: TLFDBCheckBox;
     TSClientes: TTabSheet;
     TSDirecciones: TTabSheet;
     TSArticulos: TTabSheet;
     TBCliente: TLFToolBar;
     DBGCliente: TDBGridFind2000;
     NavCliente: THYMNavigator;
     DBGDireccion: TDBGridFind2000;
     TBDireccion: TLFToolBar;
     NavDireccion: THYMNavigator;
     DBCBUtilizaReferenciaPrestashop: TLFDBCheckBox;
     TBArticulo: TLFToolBar;
     NavArticulo: THYMNavigator;
     DBGArticulo: TDBGridFind2000;
     LVersionPrestashop: TLFLabel;
     DBEVersionPrestashop: TLFDbedit;
     LTienaArticulos: TLFLabel;
     DBEFTienaArticulos: TLFDBEditFind2000;
     ETienaArticulos: TLFEdit;
     PNLFiltroIdCustomer: TLFPanel;
     LFiltroCliente: TLFLabel;
     EFiltroCliente: TLFEdit;
     PNLIdAddress: TLFPanel;
     LFiltroDireccion: TLFLabel;
     EFiltroDireccion: TLFEdit;
     PNLIdProduct: TLFPanel;
     LFiltroArticulo: TLFLabel;
     EFiltroArticulo: TLFEdit;
     LWSUrl: TLFLabel;
     DBEWSUrl: TLFDbedit;
     LWSIdioma: TLFLabel;
     DBCBWSIdioma: TRxDBComboBox;
     LWSToken: TLFLabel;
     DBEToken: TLFDbedit;
     MRecursos: TLFMemo;
     LRecursos: TLFLabel;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     TBSep1: TToolButton;
     TBSincronizarTienda: TToolButton;
     TSTaxRuleGroups: TTabSheet;
     TBTaxRuleGroups: TLFToolBar;
     NavTaxRuleGroups: THYMNavigator;
     PNLFiltroTaxRuleGroups: TLFPanel;
     LFiltroTaxRuleGroups: TLFLabel;
     EFiltroTaxRuleGroups: TLFEdit;
     DBGTaxRuleGroups: TDBGridFind2000;
     DBEWSIdioma: TLFDbedit;
     LTarifa: TLFLabel;
     DBEFTarifa: TLFDBEditFind2000;
     ETituloTarifa: TLFEdit;
     SBAWeb: TSpeedButton;
     SBAWebBackoffice: TSpeedButton;
     DBCBMantenerDescripciones: TLFDBCheckBox;
     DBCBMantenerPrecio: TLFDBCheckBox;
     ACrearArticulosFiltrados: TAction;
     LClienteBase: TLFLabel;
     DBEClienteBase: TLFDBEditFind2000;
     ETituloClienteBase: TLFEdit;
     TSProductosPS: TTabSheet;
     TBProductosPS: TLFToolBar;
     NavProductosPS: THYMNavigator;
     PNLProductosPS: TLFPanel;
     LFiltroProductosPS: TLFLabel;
     EFiltroProductosPS: TLFEdit;
     DBGProductosPS: TDBGridFind2000;
     CBProductosPSSoloActivos: TLFCheckBox;
     CBProductosPSSoloNoSincronizados: TLFCheckBox;
     PNLConfiguracion: TLFPanel;
     PNLSincronizacion: TLFPanel;
     NavSincronizacion: THYMNavigator;
     TBSincronizacion: TLFToolBar;
     DBGFSincronizacion: TDBGridFind2000;
     TSOrdersPS: TTabSheet;
     TBOrdersPS: TLFToolBar;
     NavOrdersPS: THYMNavigator;
     LFPanel1: TLFPanel;
     LFLabel1: TLFLabel;
     EFiltroOrdersPS: TLFEdit;
     CBOrdersSoloNoSincrinizado: TLFCheckBox;
     DBGOrdersPS: TDBGridFind2000;
     LCuentaCliente: TLFLabel;
     DBEFCuentaCliente: TLFDBEditFind2000;
     ECuentaCliente: TLFEdit;
     DBCBImportarArticulosVarios: TLFDBCheckBox;
     TSOrderStates: TTabSheet;
     DBGOrderStates: TDBGridFind2000;
     TBOrderStates: TLFToolBar;
     NavOrderStates: THYMNavigator;
     PNLOrderStates: TLFPanel;
     LFiltroOrderStates: TLFLabel;
     EOrderStates: TLFEdit;
     PNLInfoClientes: TLFPanel;
     DBEInfoClientesTitulo: TLFDbedit;
     PNLInfoDirecciones: TLFPanel;
     DBEInfoDireccionesTitulo: TLFDbedit;
     PNLInfoClientes1: TLFPanel;
     DBEInfoArticulosTitulo: TLFDbedit;
     PNLInfoReglasIVA: TLFPanel;
     DBEInfoReglasIVATitulo: TLFDbedit;
     PNLInfoProductos: TLFPanel;
     DBEInfoProductosTitulo: TLFDbedit;
     PNLInfoOrders: TLFPanel;
     DBEInfoOrdersTitulo: TLFDbedit;
     PNLInfoOrderStates: TLFPanel;
     DBEInfoOrderStatesTitulo: TLFDbedit;
     TSStockAvailable: TTabSheet;
     TBStockAvailable: TLFToolBar;
     PNLStockAvailable: TLFPanel;
     DBEStockAvailableTitulo: TLFDbedit;
     NavStockAvailable: THYMNavigator;
     PNLStockAvailable1: TLFPanel;
     LFLabel2: TLFLabel;
     EFiltroStockAvailable: TLFEdit;
     CBSoloActivosStockAvailable: TLFCheckBox;
     CBSoloSincronizadosStockAvailable: TLFCheckBox;
     DBGStockAvailable: TDBGridFind2000;
     LDSNMySQL: TLFLabel;
     DBEDSNMySQL: TLFDbedit;
     DBCBUtilizaModuloMegaproduct: TLFDBCheckBox;
     TSPack: TTabSheet;
     TBPack: TLFToolBar;
     PNLPackInfo: TLFPanel;
     DBEPackTitulo: TLFDbedit;
     NavPack: THYMNavigator;
     DBGPacks: TDBGridFind2000;
     LUsuarioWarnigns: TLFLabel;
     LFamiliaPacks: TLFLabel;
     EUsuarioWarnigns: TLFEdit;
     DBEFFamiliaPacks: TLFDBEditFind2000;
     DBEFUsuarioWarnigns: TLFDBEditFind2000;
     EFamiliaPacks: TLFEdit;
     LArticuloDescuento: TLFLabel;
     DBEFArticuloDescuento: TLFDBEditFind2000;
     EArticuloDescuento: TLFEdit;
     TSCategories: TTabSheet;
     TBCategories: TLFToolBar;
     PNLInfoCategories: TLFPanel;
     DBEInfoCategoriasTitulo: TLFDbedit;
     NavCategorias: THYMNavigator;
     PNLFiltroCategorias: TLFPanel;
     LFiltroCategories: TLFLabel;
     EFiltroCategoriasPS: TLFEdit;
     CBCategoriasPSSoloActivos: TLFCheckBox;
     CBCategoriasPSSoloNoSincronizados: TLFCheckBox;
     DBGCategoriasPS: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure ASincronizarExecute(Sender: TObject);
     procedure DBEFEmpresaChange(Sender: TObject);
     procedure DBEFCanalChange(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure DBEFAlmacenChange(Sender: TObject);
     procedure DBEFAgenteChange(Sender: TObject);
     procedure DBEFCanalBusqueda(Sender: TObject);
     procedure DBEFSerieBusqueda(Sender: TObject);
     procedure DBEFAlmacenBusqueda(Sender: TObject);
     procedure DBEFAgenteBusqueda(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure ASincronizarTodasExecute(Sender: TObject);
     procedure DBGClienteBusqueda(Sender: TObject);
     procedure DBGDireccionBusqueda(Sender: TObject);
     procedure DBGArticuloBusqueda(Sender: TObject);
     procedure DBEFTienaArticulosChange(Sender: TObject);
     procedure EFiltroDireccionChange(Sender: TObject);
     procedure EFiltroArticuloChange(Sender: TObject);
     procedure DBEWSUrlChange(Sender: TObject);
     procedure DBEWSUrlExit(Sender: TObject);
     procedure DBETokenExit(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBSincronizacionActivaChange(Sender: TObject);
     procedure EFiltroClienteChange(Sender: TObject);
     procedure DBGArticuloDblClick(Sender: TObject);
     procedure DBGArticuloCellClick(Column: TColumn);
     procedure DBGArticuloDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFiltroTaxRuleGroupsChange(Sender: TObject);
     procedure TSTaxRuleGroupsShow(Sender: TObject);
     procedure DBGTaxRuleGroupsBusqueda(Sender: TObject);
     procedure SBAWebDblClick(Sender: TObject);
     procedure SBAWebBackofficeDblClick(Sender: TObject);
     procedure DBEFTarifaBusqueda(Sender: TObject);
     procedure DBEFTarifaChange(Sender: TObject);
     procedure ACrearArticulosFiltradosExecute(Sender: TObject);
     procedure DBEClienteBaseChange(Sender: TObject);
     procedure EFiltroProductosPSChange(Sender: TObject);
     procedure TSProductosPSShow(Sender: TObject);
     procedure DBGOrdersPSDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFiltroOrdersPSChange(Sender: TObject);
     procedure DBGOrdersPSCellClick(Column: TColumn);
     procedure DBGOrdersPSDblClick(Sender: TObject);
     procedure DBEFCuentaClienteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGOrdersPSKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGOrderStatesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGStockAvailableDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGStockAvailableDblClick(Sender: TObject);
     procedure DBEDSNMySQLChange(Sender: TObject);
     procedure DBEDSNMySQLExit(Sender: TObject);
     procedure CBSoloActivosStockAvailableChange(Sender: TObject);
     procedure DBGStockAvailableCellClick(Column: TColumn);
     procedure DBEFFamiliaPacksBusqueda(Sender: TObject);
     procedure DBEFFamiliaPacksChange(Sender: TObject);
     procedure DBEFUsuarioWarnignsChange(Sender: TObject);
     procedure DBEFArticuloDescuentoBusqueda(Sender: TObject);
     procedure DBEFArticuloDescuentoChange(Sender: TObject);
     procedure EFiltroCategoriasPSChange(Sender: TObject);
     procedure DBGCategoriasPSCellClick(Column: TColumn);
     procedure DBGCategoriasPSBusqueda(Sender: TObject);
     procedure DBGCategoriasPSDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     ColActual: TColumn;
     SincAutomatica: boolean;
     procedure RefrescaDatosWebService;
     procedure RefrescaDatosMySQL;
  public
     { Public declarations }
     procedure SincronizarcionAutomatica;
  end;

var
  FMSincronizacionTienda : TFMSincronizacionTienda;

implementation

uses UDMMain, UDMSincronizacionTienda, UFormGest, UEntorno, HYFIBQuery, DB,
  UDMPrestashop, UFMain, UUtiles, UDameDato, ShellAPI, UFSendCorreo;

{$R *.dfm}

procedure TFMSincronizacionTienda.FormCreate(Sender: TObject);
begin
  inherited;
  SincAutomatica := False;
  AbreData(TDMSincronizacionTienda, DMSincronizacionTienda);

  NavMain.DataSource := DMSincronizacionTienda.DSQMConfPrestaShop;
  DBGMain.DataSource := DMSincronizacionTienda.DSQMConfPrestaShop;
  G2KTableLoc.DataSource := DMSincronizacionTienda.DSQMConfPrestaShop;
  NavSincronizacion.DataSource := DMSincronizacionTienda.DSQMConfPrestaShopSinc;
  DBGFSincronizacion.DataSource := DMSincronizacionTienda.DSQMConfPrestaShopSinc;
  // Fuerzo a que la toolbar esté en el pie del formulario
  TBActions.Top := Self.Height;
  ColActual := DBGArticulo.Columns[0];

  SolapaControles(SBAWeb, DBEWeb);
  DBEWeb.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAWebBackoffice, DBEWebBackoffice);
  DBEWebBackoffice.Color := REntorno.ColorEnlaceActivo;

  DBEFCuentaCliente.MaxLength := REntorno.DigitosSub;
  FMain.AddComponentePunto(DBEFCuentaCliente);

  EFiltroProductosPSChange(Sender);
  EFiltroOrdersPSChange(Sender);
  CBSoloActivosStockAvailableChange(Sender);
end;

procedure TFMSincronizacionTienda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FMain.DelComponentePunto(DBEFCuentaCliente);
  DMSincronizacionTienda.QMConfPrestaShop.Close;
end;

procedure TFMSincronizacionTienda.ASincronizarExecute(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSFicha;

  ASincronizar.Enabled := False;
  try
     DMSincronizacionTienda.SincronizaBase;
  finally
     ASincronizar.Enabled := True;
  end;
end;

procedure TFMSincronizacionTienda.ASincronizarTodasExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.SincronizaTodas;
end;

procedure TFMSincronizacionTienda.DBEFEmpresaChange(Sender: TObject);
begin
  inherited;
  ETituloEmpresa.Text := DameTituloEmpresa(StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTienda.DBEFCanalChange(Sender: TObject);
begin
  inherited;
  ETituloCanal.Text := DameTituloCanal(StrToIntDef(DBEFCanal.Text, 0));
end;

procedure TFMSincronizacionTienda.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ETituloSerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMSincronizacionTienda.DBEFAlmacenChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacen.Text := DameTituloAlmacen(DBEFAlmacen.Text, StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTienda.DBEFAgenteChange(Sender: TObject);
begin
  inherited;
  ETituloAgente.Text := DameTituloAgente(StrToIntDef(DBEFAgente.Text, 0), StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTienda.DBEFCanalBusqueda(Sender: TObject);
begin
  inherited;
  DBEFCanal.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVO = 1';
end;

procedure TFMSincronizacionTienda.DBEFSerieBusqueda(Sender: TObject);
begin
  inherited;
  DBEFSerie.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVO = 1';
end;

procedure TFMSincronizacionTienda.DBEFAlmacenBusqueda(Sender: TObject);
begin
  inherited;
  DBEFAlmacen.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVO = 1';
end;

procedure TFMSincronizacionTienda.DBEFAgenteBusqueda(Sender: TObject);
begin
  inherited;
  DBEFAgente.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text;
end;

procedure TFMSincronizacionTienda.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMSincronizacionTienda);
end;

procedure TFMSincronizacionTienda.DBGClienteBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_CLIENTES_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTienda.QMConfPrestaShopEMPRESA.AsString + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CLIENTE';
     end;
  end;
end;

procedure TFMSincronizacionTienda.DBGDireccionBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_CLIENTES_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTienda.QMConfPrestaShopEMPRESA.AsString + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CLIENTE';
     end;

     if (Trim(TablaABuscar) = 'SYS_TERCEROS_DIRECCIONES') then
     begin
        CondicionBusqueda :=
           'TERCERO=' + DMSincronizacionTienda.QMConfPrestaShopClienteDirTERCERO.AsString;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DIRECCION';
     end;
  end;
end;

procedure TFMSincronizacionTienda.DBGArticuloBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTienda.QMConfPrestaShopEMPRESA.AsString + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;
  end;
end;

procedure TFMSincronizacionTienda.DBEFTienaArticulosChange(Sender: TObject);
begin
  inherited;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_CONF_PRESTASHOP WHERE ID = :ID';
        Params.ByName['ID'].AsInteger := StrToIntDef(DBEFTienaArticulos.Text, 0);
        ExecQuery;
        ETienaArticulos.Text := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMSincronizacionTienda.EFiltroDireccionChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.FiltrarDireccion(EFiltroDireccion.Text);
end;

procedure TFMSincronizacionTienda.EFiltroArticuloChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.FiltrarArticulo(EFiltroArticulo.Text);
end;

procedure TFMSincronizacionTienda.RefrescaDatosWebService;
begin
  inherited;

  if ((DMSincronizacionTienda.QMConfPrestaShopACTIVO.AsInteger = 1) and (DMSincronizacionTienda.QMConfPrestaShopWS_URL.AsString > '') and (DMSincronizacionTienda.QMConfPrestaShopWS_KEY.AsString > '')) then
  begin
     try
        if (DMSincronizacionTienda.InicializaWebService) then
        begin
           DBCBWSIdioma.DataSource := nil;
           // DBCBWSEstadoAImportar.DataSource := nil;

           DMSincronizacionTienda.RellenaEstadosWS;
           DMSincronizacionTienda.RellenaIdiomasWS(DBCBWSIdioma.Items, DBCBWSIdioma.Values);
           DMPrestashop.WS_DameRecursos(MRecursos.Lines);

           DBCBWSIdioma.DataSource := DMSincronizacionTienda.DSQMConfPrestaShop;
           // DBCBWSEstadoAImportar.DataSource := DMSincronizacionTienda.DSQMConfPrestaShop;

           ColorResaltado2(DBEWSUrl);
        end
        else
        begin
           ColorError(DBEWSUrl);
        end;
     except
        ColorError(DBEWSUrl);
     end;
  end
  else
     ColorEdicion(DBEWSUrl);
end;

procedure TFMSincronizacionTienda.DBEWSUrlChange(Sender: TObject);
begin
  inherited;

  if (DMSincronizacionTienda.QMConfPrestaShop.State = dsBrowse) then
  begin
     DMMain.LogIni('DBEWSUrlChange');
     RefrescaDatosWebService;
     DMMain.LogFin('');
  end;
end;

procedure TFMSincronizacionTienda.DBEWSUrlExit(Sender: TObject);
begin
  inherited;

  DMMain.LogIni('DBEWSUrlExit');
  RefrescaDatosWebService;
  DMMain.LogFin('');
end;

procedure TFMSincronizacionTienda.DBETokenExit(Sender: TObject);
begin
  inherited;

  DMMain.LogIni('DBETokenExit');
  RefrescaDatosWebService;
  DMMain.LogFin('');
end;

procedure TFMSincronizacionTienda.CBSincronizacionActivaChange(Sender: TObject);
begin
  inherited;

  DMMain.LogIni('CBSincronizacionActivaChange');
  RefrescaDatosWebService;
  DMMain.LogFin('');
end;

procedure TFMSincronizacionTienda.RefrescaDatosMySQL;
var
  FechaServidor : TDateTime;
begin
  inherited;

  if ((DMSincronizacionTienda.QMConfPrestaShopACTIVO.AsInteger = 1) and (DMSincronizacionTienda.QMConfPrestaShopDSN_MYSQL.AsString > '')) then
  begin
     DMPrestashop.SetDSN(DMSincronizacionTienda.QMConfPrestaShopDSN_MYSQL.AsString, DMSincronizacionTienda.QMConfPrestaShopVERSION_PRESTASHOP.AsString);

     try
        // Obtengo la fecha del servidor MySQL, sin emitir mensaje de error si lo hubiera
        FechaServidor := DMPrestashop.DameFechaServidorMySQL(True);

        if (FechaServidor > 0) then
           ColorResaltado2(DBEDSNMySQL)
        else
           ColorError(DBEDSNMySQL);
     except
        ColorError(DBEDSNMySQL);
     end;
  end
  else
     ColorEdicion(DBEDSNMySQL);
end;

procedure TFMSincronizacionTienda.DBEDSNMySQLChange(Sender: TObject);
begin
  inherited;

  if (DMSincronizacionTienda.QMConfPrestaShop.State = dsBrowse) then
  begin
     DMMain.LogIni('DBEDSNMySQLChange');
     RefrescaDatosMySQL;
     DMMain.LogFin('');
  end;
end;

procedure TFMSincronizacionTienda.DBEDSNMySQLExit(Sender: TObject);
begin
  inherited;

  DMMain.LogIni('DBEDSNMySQLExit');
  RefrescaDatosMySQL;
  DMMain.LogFin('');
end;

procedure TFMSincronizacionTienda.EFiltroClienteChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.FiltrarCliente(EFiltroCliente.Text);
end;

procedure TFMSincronizacionTienda.DBGArticuloDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     if (TDBGrid(Sender).DataSource.DataSet.FieldByName('ARTICULO').AsString > '') then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + TDBGrid(Sender).DataSource.DataSet.FieldByName('ARTICULO').AsString + '''');
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ID_PRODUCT') then
  begin
     if (TDBGrid(Sender).DataSource.DataSet.FieldByName('ID_PRODUCT').AsInteger > 0) then
     begin
        DMSincronizacionTienda.SincronizaUnArticulo(TDBGrid(Sender).DataSource.DataSet.FieldByName('ID_PRODUCT').AsInteger);
        if CBProductosPSSoloNoSincronizados.Checked then
           CBProductosPSSoloNoSincronizados.Checked := False;
        Refrescar(DMSincronizacionTienda.QMProductosPS, 'ID_PRODUCT', TDBGrid(Sender).DataSource.DataSet.FieldByName('ID_PRODUCT').AsInteger);
     end;
  end;
end;

procedure TFMSincronizacionTienda.DBGArticuloCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionTienda.DBGArticuloDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ARTICULO') then
        begin
           if (DMSincronizacionTienda.QMProductosPSARTICULO.AsString = '') then
              ColorResaltado2(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionTienda.EFiltroTaxRuleGroupsChange(Sender: TObject);
begin
  inherited;
  // DMSincronizacionTienda.FiltrarTaxRuleGroups(EFiltroTaxRuleGroups.Text);
end;

procedure TFMSincronizacionTienda.TSTaxRuleGroupsShow(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.AbreTaxRuleGroups;
end;

procedure TFMSincronizacionTienda.DBGTaxRuleGroupsBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'SYS_PAISES') then
     begin
        CondicionBusqueda := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PAIS';
     end;

     if (Trim(TablaABuscar) = 'SYS_TIPO_IVA') then
     begin
        CondicionBusqueda := 'PAIS = ''' + DMSincronizacionTienda.QMConfPrestaShopTaxRuleGroupPAIS.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO DESC, TIPO';
     end;
  end;
end;

procedure TFMSincronizacionTienda.SBAWebDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar(DBEWeb.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMSincronizacionTienda.SBAWebBackofficeDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar(DBEWebBackoffice.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMSincronizacionTienda.DBEFTarifaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFTarifa.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVA = 1';
end;

procedure TFMSincronizacionTienda.DBEFTarifaChange(Sender: TObject);
begin
  inherited;
  ETituloTarifa.Text := DameTituloTarifa(DBEFTarifa.Text, StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTienda.ACrearArticulosFiltradosExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.CrearArticulosFiltrados;
end;

procedure TFMSincronizacionTienda.DBEClienteBaseChange(Sender: TObject);
begin
  inherited;
  ETituloClienteBase.Text := DameTituloCliente(StrToIntDef(DBEClienteBase.Text, 0));
end;

procedure TFMSincronizacionTienda.EFiltroProductosPSChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.FiltrarProductosPS(EFiltroProductosPS.Text, CBProductosPSSoloActivos.Checked, CBProductosPSSoloNoSincronizados.Checked);
end;

procedure TFMSincronizacionTienda.TSProductosPSShow(Sender: TObject);
begin
  inherited;
  EFiltroProductosPSChange(Sender);
end;

procedure TFMSincronizacionTienda.SincronizarcionAutomatica;
begin
  SincAutomatica := True;
  try
     DMSincronizacionTienda.SincronizaTodas(True);
  finally
     SincAutomatica := False;
  end;
end;

procedure TFMSincronizacionTienda.DBGOrdersPSDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'RIG')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) = 'LIQUIDO') or (UpperCase(Column.FieldName) = 'TOTAL_PAID')) then
        begin
           if (DMSincronizacionTienda.QMOrdersPSID_S.AsInteger <> 0) and (abs(DMSincronizacionTienda.QMOrdersPSLIQUIDO.AsFloat - DMSincronizacionTienda.QMOrdersPSTOTAL_PAID.AsFloat) >= 0.005) then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if ((DMSincronizacionTienda.QMOrdersPSID_S.AsInteger <> 0) and (Column.FieldName = 'ESTADO') or (Column.FieldName = 'TITULO_ESTADO')) then
        begin
           ColorSegunEstado(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger);
        end
        else
        if ((UpperCase(Column.FieldName) = 'EJERCICIO') or (UpperCase(Column.FieldName) = 'CANAL') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'RIG')) then
        begin
           if (DMSincronizacionTienda.QMOrdersPSID_S.AsInteger <> 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if ((Column.FieldName = 'ESTADO') or (Column.FieldName = 'TITULO_ESTADO')) then
        begin
           ColorSegunEstado(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger);
        end
        else
        if ((Column.FieldName = 'CURRENT_STATE') or (Column.FieldName = 'CURRENT_STATE_DESCRIPCION') or (Column.FieldName = 'CURRENT_STATE_COLOR_HEX')) then
        begin
           ColorObjeto(Canvas, HEXToColor(DataSource.DataSet.FieldByName('CURRENT_STATE_COLOR_HEX').AsString), clWindowText);
        end
        else
        if (Column.FieldName = 'INVOICE_NUMBER') then
        begin
           if (DMSincronizacionTienda.QMOrdersPSINVOICE_NUMBER.AsInteger = 0) then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionTienda.EFiltroOrdersPSChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.FiltrarOrdersPS(EFiltroOrdersPS.Text, CBOrdersSoloNoSincrinizado.Checked);
end;

procedure TFMSincronizacionTienda.DBGOrdersPSCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionTienda.DBGOrdersPSDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'RIG') then
  begin
     if (DMSincronizacionTienda.QMOrdersPSID_S.AsInteger <> 0) then
        FMain.TraspasoDeDocumentosSalida(DMSincronizacionTienda.QMOrdersPSID_S.AsInteger)
     else
     begin
        with DMSincronizacionTienda do
        begin
           SincronizaUnaOrdenPedidos(QMConfPrestaShopID.AsInteger, QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, QMConfPrestaShopSERIE.AsString, QMConfPrestaShopALMACEN.AsString, QMOrdersPSID_ORDER.AsInteger);
           QMOrdersPS.Refresh;
        end;
     end;
  end
  else
  if (UpperCase(ColActual.FieldName) = 'ID_CUSTOMER') then
  begin
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        with DMSincronizacionTienda do
        begin
           SincronizaUnCliente(QMConfPrestaShopID.AsInteger, QMOrdersPSID_CUSTOMER.AsInteger);
           QMOrdersPS.Refresh;
        end;
     finally
        FreeAndNil(FSendCorreo);
     end;
  end;
end;

procedure TFMSincronizacionTienda.DBEFCuentaClienteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(DBEFCuentaCliente);
end;

procedure TFMSincronizacionTienda.DBGOrdersPSKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssShift, ssAlt, ssCtrl] then
  begin
     if (Key = VK_F5) then
     begin
        with DMSincronizacionTienda do
        begin
           while not QMOrdersPS.BOF do
           begin
              if ((QMOrdersPSID_S.AsInteger = 0) and (QMOrdersPSINVOICE_NUMBER.AsInteger > 0)) then
              begin
                 SincronizaUnaOrdenPedidos(QMConfPrestaShopID.AsInteger, QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, QMConfPrestaShopSERIE.AsString, QMConfPrestaShopALMACEN.AsString, QMOrdersPSID_ORDER.AsInteger);
                 QMOrdersPS.Refresh;
              end;
              QMOrdersPS.Prior;
           end;
        end;
     end;
  end
  else
  if (Key = VK_F5) then
  begin
     with DMSincronizacionTienda do
     begin
        if ((QMOrdersPSID_S.AsInteger = 0) and (QMOrdersPSINVOICE_NUMBER.AsInteger > 0)) then
           SincronizaUnaOrdenPedidos(QMConfPrestaShopID.AsInteger, QMConfPrestaShopEMPRESA.AsInteger, QMConfPrestaShopCANAL.AsInteger, QMConfPrestaShopSERIE.AsString, QMConfPrestaShopALMACEN.AsString, QMOrdersPSID_ORDER.AsInteger);
        QMOrdersPS.Refresh;
     end;
  end;
end;

procedure TFMSincronizacionTienda.DBGOrderStatesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'COLOR_HEX') then
           ColorObjeto(Canvas, HEXToColor(DataSource.DataSet.FieldByName('COLOR_HEX').AsString), clWindowText)
        else
        if (UpperCase(Column.FieldName) = 'DELETED') then
        begin
           if (DataSource.DataSet.FieldByName('DELETED').AsInteger = 1) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'HIDDEN') then
        begin
           if (DataSource.DataSet.FieldByName('HIDDEN').AsInteger = 1) then
              ColorBloqueado(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionTienda.DBGStockAvailableDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (DMSincronizacionTienda.xStockAvailableID_A.AsInteger = 0) then
           ColorInactivo(Canvas)
        else
        if (UpperCase(Column.FieldName) = 'QUANTITY') or (UpperCase(Column.FieldName) = 'STOCK_REAL') then
        begin
           if (Abs(DMSincronizacionTienda.xStockAvailableQUANTITY.AsFloat - DMSincronizacionTienda.xStockAvailableSTOCK_REAL.AsFloat) > 0.01) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionTienda.DBGStockAvailableDblClick(Sender: TObject);
begin
  inherited;

  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos,
        'Articulo = ''' + TDBGrid(Sender).DataSource.DataSet.FieldByName('ARTICULO').AsString + '''');
  end;
end;

procedure TFMSincronizacionTienda.CBSoloActivosStockAvailableChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.FiltrarStockAvailable(EFiltroStockAvailable.Text, CBSoloActivosStockAvailable.Checked, CBSoloSincronizadosStockAvailable.Checked);
end;

procedure TFMSincronizacionTienda.DBGStockAvailableCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionTienda.DBEFFamiliaPacksBusqueda(Sender: TObject);
begin
  inherited;
  DBEFFamiliaPacks.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
end;

procedure TFMSincronizacionTienda.DBEFFamiliaPacksChange(Sender: TObject);
begin
  inherited;
  EFamiliaPacks.Text := DameTituloFamilia(DBEFFamiliaPacks.Text);
end;

procedure TFMSincronizacionTienda.DBEFUsuarioWarnignsChange(Sender: TObject);
begin
  inherited;
  EUsuarioWarnigns.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioWarnigns.Text, 0));
end;

procedure TFMSincronizacionTienda.DBEFArticuloDescuentoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFArticuloDescuento.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND CANAL = ' + DBEFCanal.Text + ' AND EJERCICIO = ' + REntorno.EjercicioStr;
end;

procedure TFMSincronizacionTienda.DBEFArticuloDescuentoChange(Sender: TObject);
begin
  inherited;
  EArticuloDescuento.Text := DameTituloArticulo(DBEFArticuloDescuento.Text);
end;

procedure TFMSincronizacionTienda.EFiltroCategoriasPSChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTienda.FiltrarCategoriasPS(EFiltroCategoriasPS.Text, CBCategoriasPSSoloActivos.Checked, CBCategoriasPSSoloNoSincronizados.Checked);
end;

procedure TFMSincronizacionTienda.DBGCategoriasPSCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionTienda.DBGCategoriasPSBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'ART_FAMILIAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTienda.QMConfPrestaShopEMPRESA.AsString;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'FAMILIA';
     end
     else
     if (Trim(TablaABuscar) = 'ART_SUBFAMILIAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTienda.QMConfPrestaShopEMPRESA.AsString + ' AND ID_FAMILIA = ' + IntToStr(DMSincronizacionTienda.QMCategoryID_FAMILIA.AsInteger);
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'SUBFAMILIA';
     end;
  end;
end;

procedure TFMSincronizacionTienda.DBGCategoriasPSDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'FAMILIA') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'FAMILIA') then
        begin
           if (DMSincronizacionTienda.QMCategoryFAMILIA.AsString = '') then
              ColorResaltado2(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
