unit UFmRecibosPendientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Grids,
  DBGrids, UControlEdit, ToolWin, ActnList, UFormGest, ExtCtrls, Mask,
  FIBEditFind, NsDBGrid, ULFActionList, ULFPanel, ULFEdit, ULFToolBar,
  ULFPageControl, ULFEditFind2000, ULFLabel, DBCtrls, ULFDBEdit,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, Menus, UTeclas,
  UEditPanel;

type
  TFMRecibosPendientes = class(TFPEditSinNavegador)
     PCRecPendientes: TLFPageControl;
     TSPagos: TTabSheet;
     PCPagos: TLFPageControl;
     TSProveedores: TTabSheet;
     TSAcreedores: TTabSheet;
     TSCobros: TTabSheet;
     PCCli: TLFPageControl;
     TSClientes: TTabSheet;
     TBCobros: TLFToolBar;
     ALRecPendientes: TLFActionList;
     AMostrarTodos: TAction;
     AMostrarNoPagados: TAction;
     ASalir: TAction;
     TBProv: TLFToolBar;
     TBAcr: TLFToolBar;
     EdFiltroCli: TLFEdit;
     ToolButton3: TToolButton;
     ToolButton4: TToolButton;
     EdFiltroProv: TLFEdit;
     EdFiltroAcr: TLFEdit;
     PNLClientes: TLFPanel;
     DBGFRecPendCli: TDBGridFind2000;
     PNLProv: TLFPanel;
     DBGFRecPendProv: TDBGridFind2000;
     PNLAcr: TLFPanel;
     DBGFRecPendAcr: TDBGridFind2000;
     LBLEjercicio: TLFLabel;
     LEjercicioPagosProv: TLFLabel;
     LEjercicioPagosAcr: TLFLabel;
     EFEjercicioCli: TLFEditFind2000;
     EFEjercicioPro: TLFEditFind2000;
     PNLCtaCliente: TLFPanel;
     LCuentaCobros: TLFLabel;
     EFCliDesde: TLFEditFind2000;
     EDTOldCntCliente: TLFEdit;
     PNLCtaProveedor: TLFPanel;
     LCuentaPagos: TLFLabel;
     EFProvDesde: TLFEditFind2000;
     EDTOldCuentaProveedor: TLFEdit;
     PNLCtaAcreedor: TLFPanel;
     LCuentaPagosAcr: TLFLabel;
     EFAcrDesde: TLFEditFind2000;
     EDTOldCuentaAcreedor: TLFEdit;
     ToolButton1: TToolButton;
     AMostrarImpagados: TAction;
     DBGImpagados: TDBGridFind2000;
     PNLEjercicio: TLFPanel;
     PNLEjercicioPagos: TLFPanel;
     PNLEjercicioPagosAcr: TLFPanel;
     EFEjercicioAcr: TLFEditFind2000;
     PNLRecPendProv: TLFPanel;
     PNLRecPendAcr: TLFPanel;
     LTotalLiquido: TLFLabel;
     DBETotalLiquidoAcr: TLFDbedit;
     DBETotalLiquidoProv: TLFDbedit;
     LTotalLiquidoProv: TLFLabel;
     PNLRecPendCli: TLFPanel;
     PNLImpagados: TLFPanel;
     PNLImpagadosTotales: TLFPanel;
     LTotalLiquidoClientes: TLFLabel;
     DBETotalLiquidoClientes: TLFDbedit;
     TBSep1: TToolButton;
     TBMostrarNoPagados: TToolButton;
     TBMostrarPagados: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSCobrosShow(Sender: TObject);
     procedure TSProveedoresShow(Sender: TObject);
     procedure TSAcreedoresShow(Sender: TObject);
     procedure TSPagosShow(Sender: TObject);
     procedure AMostrarTodosExecute(Sender: TObject);
     procedure AMostrarNoPagadosExecute(Sender: TObject);
     procedure EFCliDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFProvDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFAcrDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFAcrDesdeExit(Sender: TObject);
     procedure EFProvDesdeExit(Sender: TObject);
     procedure EFCliDesdeExit(Sender: TObject);
     procedure EFEjercicioProExit(Sender: TObject);
     procedure EFEjercicioAcrExit(Sender: TObject);
     procedure EFEjercicioCliExit(Sender: TObject);
     procedure DBGFRecPendCliDblClick(Sender: TObject);
     procedure DBGFRecPendAcrDblClick(Sender: TObject);
     procedure DBGFRecPendProvDblClick(Sender: TObject);
     procedure DBGFRecPendCliDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFRecPendProvDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFRecPendAcrDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AMostrarImpagadosExecute(Sender: TObject);
     procedure EFEjercicioCliKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFEjercicioProKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFEjercicioAcrKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure PCRecPendientesChange(Sender: TObject);
     procedure PCPagosChange(Sender: TObject);
  private
     { Private declarations }
     procedure IniciarCamposCuentas;
     procedure LiberarCamposCuentas;
     procedure ExpandeAcreedor;
     procedure ExpandeCliente;
     procedure ExpandeProveedor;
     procedure MuestraCartera;
  public
     { Public declarations }
     procedure RefrescaTitulo(ed: TEdit);
     procedure Expande(Cuenta: TEditFind2000);
     procedure FiltraClientes(Empresa, Canal, Control: integer; Cuenta: string);
  end;

var
  FMRecibosPendientes : TFMRecibosPendientes;

implementation

{$R *.DFM}

uses UDMMain, UFMain, UDMRecibosPendientes, UEntorno, UUtiles;

procedure TFMRecibosPendientes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRecibosPendientes, DMRecibosPendientes);
  PCRecPendientes.ActivePage := TSCobros;
  IniciarCamposCuentas;
  RefrescaTitulo(EdFiltroCli);

  EFEjercicioCli.Text := REntorno.EjercicioStr;
  EFEjercicioPro.Text := REntorno.EjercicioStr;
  EFEjercicioAcr.Text := REntorno.EjercicioStr;
end;

procedure TFMRecibosPendientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  LiberarCamposCuentas;
  CierraData(DMRecibosPendientes);
end;

{ Inicializar los campos de Cuentas }
procedure TFMRecibosPendientes.IniciarCamposCuentas;
begin
  // Añadir a los campos de Cuentas el punto para poder expandir
  FMain.AddComponentePunto(EFCliDesde);
  FMain.AddComponentePunto(EFProvDesde);
  FMain.AddComponentePunto(EFAcrDesde);

  // Establecer el tamaño máximo de las cuentas
  EFCliDesde.MaxLength := REntorno.DigitosSub;
  EFProvDesde.MaxLength := REntorno.DigitosSub;
  EFAcrDesde.MaxLength := REntorno.DigitosSub;
end;

{ Liberar los campos de Cuentas }
procedure TFMRecibosPendientes.LiberarCamposCuentas;
begin
  FMain.DelComponentePunto(EFCliDesde);
  FMain.DelComponentePunto(EFProvDesde);
  FMain.DelComponentePunto(EFAcrDesde);
end;

// Clientes
procedure TFMRecibosPendientes.TSCobrosShow(Sender: TObject);
begin
  EFCliDesde.SetFocus;

  if EDTOldCntCliente.Text <> '' then
     DMRecibosPendientes.Filtra(EDTOldCntCliente.Text, 'C', 'FAC',
        StrToInt(EFEjercicioCli.Text));

  RefrescaTitulo(EdFiltroCli);
end;

// Proveedores
procedure TFMRecibosPendientes.TSProveedoresShow(Sender: TObject);
begin
  EFProvDesde.SetFocus;

  DMRecibosPendientes.xListarRemesa.Close;
  if EDTOldCuentaProveedor.Text <> '' then
     DMRecibosPendientes.Filtra(EDTOldCuentaProveedor.Text, 'P', 'FAP',
        StrToInt(EFEjercicioPro.Text));

  RefrescaTitulo(EdFiltroProv);
end;

// Acreedores
procedure TFMRecibosPendientes.TSAcreedoresShow(Sender: TObject);
begin
  EFAcrDesde.SetFocus;

  DMRecibosPendientes.xListarRemesa.Close;
  if EDTOldCuentaAcreedor.Text <> '' then
     DMRecibosPendientes.Filtra(EDTOldCuentaAcreedor.Text, 'P', 'FCR',
        StrToInt(EFEjercicioAcr.Text));

  RefrescaTitulo(EdFiltroAcr);
end;

// Pagos
procedure TFMRecibosPendientes.TSPagosShow(Sender: TObject);
begin
  PCPagos.ActivePage := TSProveedores;
  EFProvDesde.SetFocus;
  DMRecibosPendientes.xListarRemesa.Close;

  if EDTOldCuentaProveedor.Text <> '' then
     DMRecibosPendientes.Filtra(EDTOldCuentaProveedor.Text, 'P', 'FAP',
        StrToInt(EFEjercicioPro.Text));

  RefrescaTitulo(EdFiltroProv);
end;

procedure TFMRecibosPendientes.AMostrarTodosExecute(Sender: TObject);
begin
  DMRecibosPendientes.Pagado := 1;
  if (PCRecPendientes.ActivePage = TSCobros) then
  begin
     DMRecibosPendientes.Filtra(EDTOldCntCliente.Text, 'C', 'FAC',
        StrToInt(EFEjercicioCli.Text));
     RefrescaTitulo(EdFiltroCli);
     PNLImpagados.Visible := False;
     PNLRecPendCli.Visible := True;
  end
  else if (PCPagos.ActivePage = TSProveedores) then
  begin
     DMRecibosPendientes.Filtra(EDTOldCuentaProveedor.Text, 'P', 'FAP',
        StrToInt(EFEjercicioPro.Text));
     RefrescaTitulo(EdFiltroProv);
  end
  else
  begin
     DMRecibosPendientes.Filtra(EDTOldCuentaAcreedor.Text, 'P', 'FCR',
        StrToInt(EFEjercicioAcr.Text));
     RefrescaTitulo(EdFiltroAcr);
  end;
end;

procedure TFMRecibosPendientes.AMostrarNoPagadosExecute(Sender: TObject);
begin
  DMRecibosPendientes.Pagado := 0;
  if (PCRecPendientes.ActivePage = TSCobros) then
  begin
     DMRecibosPendientes.Filtra(EDTOldCntCliente.Text, 'C', 'FAC',
        StrToInt(EFEjercicioCli.Text));
     RefrescaTitulo(EdFiltroCli);
     PNLImpagados.Visible := False;
     PNLRecPendCli.Visible := True;
  end
  else if (PCPagos.ActivePage = TSProveedores) then
  begin
     DMRecibosPendientes.Filtra(EDTOldCuentaProveedor.Text, 'P', 'FAP',
        StrToInt(EFEjercicioPro.Text));
     RefrescaTitulo(EdFiltroProv);
  end
  else
  begin
     DMRecibosPendientes.Filtra(EDTOldCuentaAcreedor.Text, 'P', 'FCR',
        StrToInt(EFEjercicioAcr.Text));
     RefrescaTitulo(EdFiltroAcr);
  end;
end;

procedure TFMRecibosPendientes.RefrescaTitulo(ed: TEdit);
begin
  if (DMRecibosPendientes.Pagado = 1) then
     ed.Text := _('TODOS LOS RECIBOS')
  else
     ed.Text := _('RECIBOS NO PAGADOS');
end;

{ Expandir Cuenta de Cliente_Desde }
procedure TFMRecibosPendientes.EFCliDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandeCliente;
end;

{ Expandir Cuenta de Proveedor_Desde }
procedure TFMRecibosPendientes.EFProvDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandeProveedor;
end;

{ Expandir Cuenta de Acreedor_Desde }
procedure TFMRecibosPendientes.EFAcrDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandeAcreedor;
end;

procedure TFMRecibosPendientes.Expande(Cuenta: TEditFind2000);
begin
  if Cuenta.Text = '' then
     Exit;

  if Pos('.', Cuenta.Text) <> 0 then
     Cuenta.Text := ExpandirCadena(Cuenta.Text, REntorno.DigitosSub);
end;

procedure TFMRecibosPendientes.ExpandeAcreedor;
begin
  if EFAcrDesde.Text = '' then
     Exit;

  Expande(EFAcrDesde);
  DMRecibosPendientes.Filtra(EFAcrDesde.Text, 'P', 'FCR', StrToInt(EFEjercicioAcr.Text));
  EDTOldCuentaAcreedor.Text := EFAcrDesde.Text;
  EFAcrDesde.Text := '';
  EFAcrDesde.SetFocus;
end;

procedure TFMRecibosPendientes.ExpandeProveedor;
begin
  if EFProvDesde.Text = '' then
     Exit;

  Expande(EFProvDesde);
  DMRecibosPendientes.Filtra(EFProvDesde.Text, 'P', 'FAP', StrToInt(EFEjercicioPro.Text));
  EDTOldCuentaProveedor.Text := EFProvDesde.Text;
  EFProvDesde.Text := '';
  EFProvDesde.SetFocus;
end;

procedure TFMRecibosPendientes.ExpandeCliente;
begin
  if EFCliDesde.Text = '' then
     Exit;

  Expande(EFCliDesde);
  DMRecibosPendientes.Filtra(EFCliDesde.Text, 'C', 'FAC', StrToInt(EFEjercicioCli.Text));
  EDTOldCntCliente.Text := EFCliDesde.Text;
  EFCliDesde.Text := '';
  EFCliDesde.SetFocus;
end;

procedure TFMRecibosPendientes.EFAcrDesdeExit(Sender: TObject);
begin
  ExpandeAcreedor;
end;

procedure TFMRecibosPendientes.EFProvDesdeExit(Sender: TObject);
begin
  ExpandeProveedor;
end;

procedure TFMRecibosPendientes.EFCliDesdeExit(Sender: TObject);
begin
  ExpandeCliente;
end;

procedure TFMRecibosPendientes.EFEjercicioProExit(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
     DMRecibosPendientes.Filtra(EDTOldCuentaProveedor.Text, 'P', 'FAP',
        StrToInt(EFEjercicioPro.Text));
end;

procedure TFMRecibosPendientes.EFEjercicioAcrExit(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
     DMRecibosPendientes.Filtra(EDTOldCuentaAcreedor.Text, 'P', 'FCR',
        StrToInt(EFEjercicioAcr.Text));
end;

procedure TFMRecibosPendientes.EFEjercicioCliExit(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
     DMRecibosPendientes.Filtra(EDTOldCntCliente.Text, 'C', 'FAC',
        StrToInt(EFEjercicioCli.Text));
end;

procedure TFMRecibosPendientes.DBGFRecPendCliDblClick(Sender: TObject);
begin
  MuestraCartera;
end;

procedure TFMRecibosPendientes.MuestraCartera;
var
  Ok : boolean;
  Ejercicio, Registro : integer;
begin
  DMRecibosPendientes.DameRegistro(Registro, Ok, Ejercicio);
  if Ok then
     FMain.MuestraCartera(Ejercicio, DMRecibosPendientes.xListarRemesaCANAL.AsInteger,
        DMRecibosPendientes.xListarRemesaSIGNO.AsString[1], Registro);
end;

procedure TFMRecibosPendientes.DBGFRecPendAcrDblClick(Sender: TObject);
begin
  MuestraCartera;
end;

procedure TFMRecibosPendientes.DBGFRecPendProvDblClick(Sender: TObject);
begin
  MuestraCartera;
end;

procedure TFMRecibosPendientes.DBGFRecPendCliDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMRecibosPendientes.HayDetalle then
  begin
     if ((UpperCase(Column.FieldName) = 'DOC_FECHA') or
        (UpperCase(Column.FieldName) = 'VENCIMIENTO')) then
        CeldaEnlace(DBGFRecPendCli, Rect);
  end;
end;

procedure TFMRecibosPendientes.DBGFRecPendProvDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMRecibosPendientes.HayDetalle then
  begin
     if ((UpperCase(Column.FieldName) = 'DOC_FECHA') or
        (UpperCase(Column.FieldName) = 'VENCIMIENTO')) then
        CeldaEnlace(DBGFRecPendProv, Rect);
  end;
end;

procedure TFMRecibosPendientes.DBGFRecPendAcrDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMRecibosPendientes.HayDetalle then
  begin
     if ((UpperCase(Column.FieldName) = 'DOC_FECHA') or
        (UpperCase(Column.FieldName) = 'VENCIMIENTO')) then
        CeldaEnlace(DBGFRecPendAcr, Rect);
  end;
end;

procedure TFMRecibosPendientes.AMostrarImpagadosExecute(Sender: TObject);
var
  cad : string;
begin
  EdFiltroCli.Text := _('RECIBOS IMPAGADOS');
  if (EDTOldCntCliente.Text <> '') then
     cad := EDTOldCntCliente.Text
  else
  if (EFCliDesde.Text <> '') then
     cad := EFCliDesde.Text
  else
     ShowMessage(_('Introduce una cuenta de cliente válida'));

  DMRecibosPendientes.FiltraImpagados(StrToInt(EFEjercicioCli.Text), cad);
  PNLImpagados.Visible := True;
  PNLRecPendCli.Visible := False;
end;

procedure TFMRecibosPendientes.EFEjercicioCliKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then  {dji lrk kri}
     if (Sender as TEdit).Text <> '' then
        DMRecibosPendientes.Filtra(EDTOldCntCliente.Text, 'C', 'FAC', StrToInt(EFEjercicioCli.Text));
end;

procedure TFMRecibosPendientes.EFEjercicioProKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then  {dji lrk kri}
     if (Sender as TEdit).Text <> '' then
        DMRecibosPendientes.Filtra(EDTOldCuentaProveedor.Text, 'P', 'FAP', StrToInt(EFEjercicioPro.Text));
end;

procedure TFMRecibosPendientes.EFEjercicioAcrKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then  {dji lrk kri}
     if (Sender as TEdit).Text <> '' then
        DMRecibosPendientes.Filtra(EDTOldCuentaAcreedor.Text, 'P', 'FCR', StrToInt(EFEjercicioAcr.Text));
end;

procedure TFMRecibosPendientes.FiltraClientes(Empresa, Canal, Control: integer; Cuenta: string);
begin
  case Control of
     0: // Recibos no cobrados clientes
     begin
        TSCobros.Show;
        EdFiltroCli.Text := _('RECIBOS NO PAGADOS');
        EDTOldCntCliente.Text := Cuenta;
     end;
     1: // Recibos pendientes clientes
     begin
        TSCobros.Show;
        EdFiltroCli.Text := _('TODOS LOS RECIBOS');
        EDTOldCntCliente.Text := Cuenta;
     end;
     2: // Recibos no cobrados proveedores
     begin
        TSPagos.Show;
        EdFiltroProv.Text := _('RECIBOS NO PAGADOS');
        EDTOldCuentaProveedor.Text := Cuenta;
     end;
     3: // Recibos pendientes proveedores
     begin
        TSPagos.Show;
        EdFiltroProv.Text := _('TODOS LOS RECIBOS');
        EDTOldCuentaProveedor.Text := Cuenta;
     end;
     4: // Recibos no cobrados acreedores
     begin
        TSPagos.Show;
        EdFiltroProv.Text := _('RECIBOS NO PAGADOS');
        EDTOldCuentaProveedor.Text := Cuenta;
     end;
     5: // Recibos pendientes acreedores
     begin
        TSPagos.Show;
        EdFiltroProv.Text := _('TODOS LOS RECIBOS');
        EDTOldCuentaProveedor.Text := Cuenta;
     end;
  end;

  DMRecibosPendientes.FiltraClientes(Empresa, Canal, Control, Cuenta);
end;

procedure TFMRecibosPendientes.PCRecPendientesChange(Sender: TObject);
begin
  DMRecibosPendientes.RefrescaTotales;
end;

procedure TFMRecibosPendientes.PCPagosChange(Sender: TObject);
begin
  DMRecibosPendientes.RefrescaTotales;
end;

end.
