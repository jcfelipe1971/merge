unit UFMSincronizacionTiendaWoocommerce;

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
  TFMSincronizacionTiendaWoocommerce = class(TFPEdit)
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
     DBCBUtilizaReferenciaWoocommerce: TLFDBCheckBox;
     TBArticulo: TLFToolBar;
     NavArticulo: THYMNavigator;
     DBGArticulo: TDBGridFind2000;
     LVersionWordPress: TLFLabel;
     DBEVersionWordPress: TLFDbedit;
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
     LWSCustomerKey: TLFLabel;
     DBEWSCustomerKey: TLFDbedit;
     MRecursos: TLFMemo;
     LRecursos: TLFLabel;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGFDetalle: TDBGridFind2000;
     TBSep1: TToolButton;
     TBSincronizarTienda: TToolButton;
     TSTaxRuleGroups: TTabSheet;
     TBTaxRuleGroups: TLFToolBar;
     NavTaxRuleGroups: THYMNavigator;
     PNLFiltroTaxRuleGroups: TLFPanel;
     LFiltroTaxRuleGroups: TLFLabel;
     EFiltroTaxRuleGroups: TLFEdit;
     DBGTaxRuleGroups: TDBGridFind2000;
     DBEWSCustomerSecret: TLFDbedit;
     LWSCustomerSecret: TLFLabel;
     LVersionWoocommerce: TLFLabel;
     DBEVersionWoocommerce: TLFDbedit;
     LTarifa: TLFLabel;
     DBEFTarifa: TLFDBEditFind2000;
     ETituloTarifa: TLFEdit;
     SBAWeb: TSpeedButton;
     SBAWebBackoffice: TSpeedButton;
     ACrearArticulosFiltrados: TAction;
     DBEApiGet: TLFDbedit;
     DBEApiCalc: TLFDbedit;
     LApiGet: TLFLabel;
     LApiCalc: TLFLabel;
     TBPrueba: TToolButton;
     TSProductosWC: TTabSheet;
     LFToolBar1: TLFToolBar;
     DBGridFind20001: TDBGridFind2000;
     DBEInfoProductosTitulo: TLFDbedit;
     NavProductosWC: THYMNavigator;
     LFiltroProductosWC: TLFLabel;
     EFiltroProductosWC: TLFEdit;
     CBProductosWCSoloActivos: TLFCheckBox;
     CBProductosWCSoloNoSincronizados: TLFCheckBox;
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
     procedure DBEWSCustomerKeyExit(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBSincronizacionActivaChange(Sender: TObject);
     procedure EFiltroClienteChange(Sender: TObject);
     procedure DBGArticuloDblClick(Sender: TObject);
     procedure DBGArticuloCellClick(Column: TColumn);
     procedure DBGArticuloDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFiltroTaxRuleGroupsChange(Sender: TObject);
     procedure TSTaxRuleGroupsShow(Sender: TObject);
     procedure DBGTaxRuleGroupsBusqueda(Sender: TObject);
     procedure DBEFTarifaChange(Sender: TObject);
     procedure DBEFTarifaBusqueda(Sender: TObject);
     procedure SBAWebDblClick(Sender: TObject);
     procedure SBAWebBackofficeDblClick(Sender: TObject);
     procedure ACrearArticulosFiltradosExecute(Sender: TObject);
     procedure TBPruebaClick(Sender: TObject);
     procedure DBGridFind20001DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGridFind20001DblClick(Sender: TObject);
     procedure DBGridFind20001CellClick(Column: TColumn);
     procedure DBGridFind20001Busqueda(Sender: TObject);
     procedure EFiltroProductosWCChange(Sender: TObject);
     procedure CBProductosWCSoloNoSincronizadosChange(Sender: TObject);
     procedure CBProductosWCSoloActivosChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure RefrescaDatosWebService;
  public
     { Public declarations }
     procedure SincronizarcionAutomatica;
  end;

var
  FMSincronizacionTiendaWoocommerce : TFMSincronizacionTiendaWoocommerce;

implementation

uses UDMMain, UDMSincronizacionTiendaWoocommerce, UFormGest, UEntorno, HYFIBQuery, DB,
  UDMWoocommerce, UFMain, UUtiles, uLkJSON, ShellAPI, UDameDato;

{$R *.dfm}

procedure TFMSincronizacionTiendaWoocommerce.FormCreate(Sender: TObject);
begin
  inherited;
  DMMain.Log('TFMSincronizacionTiendaWoocommerce.FormCreate');
  AbreData(TDMSincronizacionTiendaWoocommerce, DMSincronizacionTiendaWoocommerce);

  NavMain.DataSource := DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce;
  DBGMain.DataSource := DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce;
  G2KTableLoc.DataSource := DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce;
  NavDetalle.DataSource := DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceSinc;
  DBGFDetalle.DataSource := DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceSinc;
  // Fuerzo a que la toolbar esté en el pie del formulario
  TBActions.Top := Self.Height;
  ColActual := DBGArticulo.Columns[0];

  SolapaControles(SBAWeb, DBEWeb);
  DBEWeb.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAWebBackoffice, DBEWebBackoffice);
  DBEWebBackoffice.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMSincronizacionTiendaWoocommerce.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  DMSincronizacionTiendaWoocommerce.QMConfWoocommerce.Close;
end;

procedure TFMSincronizacionTiendaWoocommerce.ASincronizarExecute(Sender: TObject);
//var
//s : string;
//js : TlkJSONobject;
begin
  inherited;
  ASincronizar.Enabled := False;
  try
     DMSincronizacionTiendaWoocommerce.SincronizaBase;
  finally
     ASincronizar.Enabled := True;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.ASincronizarTodasExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.SincronizaTodas;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFEmpresaChange(Sender: TObject);
begin
  inherited;
  ETituloEmpresa.Text := DameTituloEmpresa(StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFCanalChange(Sender: TObject);
begin
  inherited;
  ETituloCanal.Text := DameTituloCanal(StrToIntDef(DBEFCanal.Text, 0));
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ETituloSerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFAlmacenChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacen.Text := DameTituloAlmacen(DBEFAlmacen.Text, StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFAgenteChange(Sender: TObject);
begin
  inherited;
  ETituloAgente.Text := DameTituloAgente(StrToIntDef(DBEFAgente.Text, 0), StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFCanalBusqueda(Sender: TObject);
begin
  inherited;
  DBEFCanal.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVO = 1';
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFSerieBusqueda(Sender: TObject);
begin
  inherited;
  DBEFSerie.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVO = 1';
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFAlmacenBusqueda(Sender: TObject);
begin
  inherited;
  DBEFAlmacen.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVO = 1';
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFAgenteBusqueda(Sender: TObject);
begin
  inherited;
  DBEFAgente.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text;
end;

procedure TFMSincronizacionTiendaWoocommerce.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMSincronizacionTiendaWoocommerce);
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGClienteBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_CLIENTES_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTiendaWoocommerce.QMConfWoocommerceEMPRESA.AsString + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CLIENTE';
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGDireccionBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_CLIENTES_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTiendaWoocommerce.QMConfWoocommerceEMPRESA.AsString + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CLIENTE';
     end;

     if (Trim(TablaABuscar) = 'SYS_TERCEROS_DIRECCIONES') then
     begin
        CondicionBusqueda :=
           'TERCERO=' + DMSincronizacionTiendaWoocommerce.QMConfWoocommerceClienteDirTERCERO.AsString;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DIRECCION';
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGArticuloBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTiendaWoocommerce.QMConfWoocommerceEMPRESA.AsString + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFTienaArticulosChange(Sender: TObject);
begin
  inherited;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_CONF_WOOCOMMERCE WHERE ID = :ID';
        Params.ByName['ID'].AsInteger := StrToIntDef(DBEFTienaArticulos.Text, 0);
        ExecQuery;
        ETienaArticulos.Text := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.EFiltroDireccionChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.FiltrarDireccion(EFiltroDireccion.Text);
end;

procedure TFMSincronizacionTiendaWoocommerce.EFiltroArticuloChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.FiltrarArticulo(Trim(EFiltroArticulo.Text));
end;

procedure TFMSincronizacionTiendaWoocommerce.RefrescaDatosWebService;
begin
  inherited;
  if ((DMSincronizacionTiendaWoocommerce.QMConfWoocommerceACTIVO.AsInteger = 1) and (DMSincronizacionTiendaWoocommerce.QMConfWoocommerceWS_URL.AsString > '') and (DMSincronizacionTiendaWoocommerce.QMConfWoocommerceWS_CONSUMER_KEY.AsString > '') and (DMSincronizacionTiendaWoocommerce.QMConfWoocommerceWS_CONSUMER_SECRET.AsString > '')) then
  begin
     if (DMSincronizacionTiendaWoocommerce.InicializaWebService) then
     begin
        ColorResaltado2(DBEWSUrl);
     end
     else
     begin
        ColorError(DBEWSUrl);
     end;
  end
  else
     ColorEdicion(DBEWSUrl);
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEWSUrlChange(Sender: TObject);
begin
  inherited;
  if (DMSincronizacionTiendaWoocommerce.QMConfWoocommerce.State = dsBrowse) then
  begin
     DMMain.LogIni('DBEWSUrlChange');
     RefrescaDatosWebService;
     DMMain.LogFin('');
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEWSUrlExit(Sender: TObject);
begin
  inherited;
  DMMain.LogIni('DBEWSUrlExit');
  RefrescaDatosWebService;
  DMMain.LogFin('');
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEWSCustomerKeyExit(Sender: TObject);
begin
  inherited;
  DMMain.LogIni('DBETokenExit');
  RefrescaDatosWebService;
  DMMain.LogFin('');
end;

procedure TFMSincronizacionTiendaWoocommerce.CBSincronizacionActivaChange(Sender: TObject);
begin
  inherited;
  DMMain.LogIni('CBSincronizacionActivaChange');
  RefrescaDatosWebService;
  DMMain.LogFin('');
end;

procedure TFMSincronizacionTiendaWoocommerce.EFiltroClienteChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.FiltrarCliente(EFiltroCliente.Text);
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGArticuloDblClick(Sender: TObject);
begin
  inherited;
  if DMSincronizacionTiendaWoocommerce.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     begin
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMSincronizacionTiendaWoocommerce.QMConfWoocommerceArticuloARTICULO.AsString + '''');
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGArticuloCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGArticuloDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (UpperCase(Column.FieldName) = 'ARTICULO') then
     CeldaEnlace(DBGArticulo, Rect);
end;

procedure TFMSincronizacionTiendaWoocommerce.EFiltroTaxRuleGroupsChange(Sender: TObject);
begin
  inherited;
  // DMSincronizacionTiendaWoocommerce.FiltrarTaxRuleGroups(EFiltroTaxRuleGroups.Text);
end;

procedure TFMSincronizacionTiendaWoocommerce.TSTaxRuleGroupsShow(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.AbreTaxRuleGroups;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGTaxRuleGroupsBusqueda(Sender: TObject);
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
        CondicionBusqueda := 'PAIS = ''' + DMSincronizacionTiendaWoocommerce.QMConfWoocommerceTaxRuleGroupPAIS.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO DESC, TIPO';
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFTarifaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFTarifa.CondicionBusqueda := 'EMPRESA=' + DBEFEmpresa.Text + ' AND ACTIVA = 1';
end;

procedure TFMSincronizacionTiendaWoocommerce.DBEFTarifaChange(Sender: TObject);
begin
  inherited;
  ETituloTarifa.Text := DameTituloTarifa(DBEFTarifa.Text, StrToIntDef(DBEFEmpresa.Text, 0));
end;

procedure TFMSincronizacionTiendaWoocommerce.SBAWebDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar(DBEWeb.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMSincronizacionTiendaWoocommerce.SBAWebBackofficeDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar(DBEWebBackoffice.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMSincronizacionTiendaWoocommerce.ACrearArticulosFiltradosExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.CrearArticulosFiltrados;
end;

procedure TFMSincronizacionTiendaWoocommerce.TBPruebaClick(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.SincronizaUnArticulo(37);
end;

procedure TFMSincronizacionTiendaWoocommerce.SincronizarcionAutomatica;
begin
  { TODO : Finalizar sincronizacion automatica (Ver la de Prestashop como referencia) }
  // SincronizarTodas(True);
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGridFind20001DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
        if (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'TITULO_LARGO') then
        begin
           if (DMSincronizacionTiendaWoocommerce.QMProductosWCARTICULO.AsString = '') then
              ColorResaltado2(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGridFind20001DblClick(Sender: TObject);
begin
  inherited;
  if DMSincronizacionTiendaWoocommerce.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     begin
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + TDBGrid(Sender).DataSource.DataSet.FieldByName('ARTICULO').AsString + '''');
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGridFind20001CellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMSincronizacionTiendaWoocommerce.DBGridFind20001Busqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + DMSincronizacionTiendaWoocommerce.QMConfWoocommerceEMPRESA.AsString + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;
  end;
end;

procedure TFMSincronizacionTiendaWoocommerce.EFiltroProductosWCChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.FiltrarProductosWC(EFiltroProductosWC.Text, CBProductosWCSoloActivos.Checked, CBProductosWCSoloNoSincronizados.Checked);
end;

procedure TFMSincronizacionTiendaWoocommerce.CBProductosWCSoloNoSincronizadosChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.FiltrarProductosWC(EFiltroProductosWC.Text, CBProductosWCSoloActivos.Checked, CBProductosWCSoloNoSincronizados.Checked);
end;

procedure TFMSincronizacionTiendaWoocommerce.CBProductosWCSoloActivosChange(Sender: TObject);
begin
  inherited;
  DMSincronizacionTiendaWoocommerce.FiltrarProductosWC(EFiltroProductosWC.Text, CBProductosWCSoloActivos.Checked, CBProductosWCSoloNoSincronizados.Checked);
end;

end.
