unit UFMCondicionesVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, UFIBDBEditfind, UFormGest, ExtCtrls,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, Grids, DBGrids, NsDBGrid,
  UEditPanel, Menus, rxPlacemnt, ActnList, UControlEdit, UNavigator, UTeclas,
  Buttons, UHYDBGrid, DB, ULFDBEdit, ULFEditFind2000,
  {Utiliza BtnClick del HYMNavigator} URecursos, ULFComboBox, ULFToolBar,
  ULFPanel, ULFActionList, ULFFormStorage, ULFPageControl, ULFLabel,
  ULFEdit, UG2kTBLoc, UFPEditSinNavegador;

type
  TFMCondicionesVenta = class(TFPEditSinNavegador)
     CBTipoCondicion: TLFComboBox;
     PCabecera: TLFPanel;
     PCliente: TLFPanel;
     PPerfil: TLFPanel;
     PAgrupaciones: TLFPanel;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     DBETitCliente: TLFDbedit;
     LPerfil: TLFLabel;
     EFPerfil: TLFEditFind2000;
     DBETitPerfil: TLFDbedit;
     LAgrupCliente: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     DBETitAgrupaciones: TLFDbedit;
     PCDetalle: TLFPageControl;
     TSCondCliArt: TTabSheet;
     TSCondCliFam: TTabSheet;
     TSCondArt: TTabSheet;
     TSCondFam: TTabSheet;
     TSCondPer: TTabSheet;
     TSCondPerArt: TTabSheet;
     TSCondPerFam: TTabSheet;
     TSCondAgr: TTabSheet;
     TSCondAgrArt: TTabSheet;
     TSCondAgrFam: TTabSheet;
     TBCondCliArt: TLFToolBar;
     TBCondCliFam: TLFToolBar;
     NavCondCliFam: THYMNavigator;
     TBCondArt: TLFToolBar;
     NavCondArt: THYMNavigator;
     DBGFCondArt: TDBGridFind2000;
     TBCondFam: TLFToolBar;
     NavCondFam: THYMNavigator;
     DBGFCondFam: TDBGridFind2000;
     TBCondPer: TLFToolBar;
     NavCondPer: THYMNavigator;
     DBGFCondPer: TDBGridFind2000;
     TBCondPerArt: TLFToolBar;
     NavCondPerArt: THYMNavigator;
     DBGFCondPerArt: TDBGridFind2000;
     TBCondPerFam: TLFToolBar;
     NavCondPerFam: THYMNavigator;
     DBGFCondPerFam: TDBGridFind2000;
     TBCondAgr: TLFToolBar;
     NavCondAgr: THYMNavigator;
     DBGFCondAgr: TDBGridFind2000;
     TBCondAgrArt: TLFToolBar;
     NavCondAgrArt: THYMNavigator;
     DBGFCondAgrArt: TDBGridFind2000;
     TBCondAgrFam: TLFToolBar;
     NavCondAgrFam: THYMNavigator;
     DBGFCondAgrFam: TDBGridFind2000;
     NavCondCliArt: THYMNavigator;
     SBACliente: TSpeedButton;
     AL: TLFActionList;
     ACliente: TAction;
     DBGFCondCliArt: TDBGridFind2000;
     CECondCliArt: TControlEdit;
     CECliArtPMEdit: TPopUpTeclas;
     CECondArt: TControlEdit;
     CECondArtPMEdit: TPopUpTeclas;
     CECondFam: TControlEdit;
     ControlEdit1PMEdit: TPopUpTeclas;
     CECondPer: TControlEdit;
     CECondPerPMEdit: TPopUpTeclas;
     CECondPerArt: TControlEdit;
     CECondPerArtPMEdit: TPopUpTeclas;
     CECondPerFam: TControlEdit;
     CECondPerFamPMEdit: TPopUpTeclas;
     CECondAgr: TControlEdit;
     CECondAgrPMEdit: TPopUpTeclas;
     CECondAgrArticulos: TControlEdit;
     CECondAgrArticulosPMEdit: TPopUpTeclas;
     CECondAgrArt: TControlEdit;
     CECondAgrArtPMEdit: TPopUpTeclas;
     CECondAgrFam: TControlEdit;
     CECondAgrFamPMEdit: TPopUpTeclas;
     DBGFCondCliFam: TDBGridFind2000;
     CECondCliFam: TControlEdit;
     CECondCliFamPMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     AEscalado: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PnlModeloArticulos: TLFPanel;
     EFModelo: TLFEditFind2000;
     EPrecio: TLFEdit;
     EDesc1: TLFEdit;
     EDesc2: TLFEdit;
     EDesc3: TLFEdit;
     LModelo: TLFLabel;
     LPrecio: TLFLabel;
     LDesc1: TLFLabel;
     LDesc2: TLFLabel;
     LDesc3: TLFLabel;
     AEliminaCondicionesCliente: TAction;
     AAgregaCondicionesVenta: TAction;
     btnAgregaCondicionesVenta: TButton;
     btnEliminaCondicionesVenta: TButton;
     PNLArticulosModelo: TLFPanel;
     LFArticuloModeloModelo: TLFLabel;
     LFArticuloModeloPrecio: TLFLabel;
     LFArticuloModeloDesc1: TLFLabel;
     LFArticuloModeloDesc2: TLFLabel;
     LFArticuloModeloDesc3: TLFLabel;
     EFArticuloModeloModelo: TLFEditFind2000;
     LFEArticuloModeloPrecio: TLFEdit;
     LFEArticuloModeloDesc1: TLFEdit;
     LFEArticuloModeloDesc2: TLFEdit;
     LFEArticuloModeloDesc3: TLFEdit;
     BTNArticuloModeloAgrega: TButton;
     BTNArticuloModeloElimina: TButton;
     AAgregaCondionesArticuloModelo: TAction;
     AEliminaCondicionesArticuloModelo: TAction;
     G2kTableLoc: TG2KTBLoc;
     AImportarExcel: TAction;
     AActualizarPreciosTarifa: TAction;
     AActualizarPreciosTarifaCli: TAction;
     TSCondAgrArticulos: TTabSheet;
     TBCondAgrArticulos: TLFToolBar;
     NavCondAgrArticulos: THYMNavigator;
     DBGCondAgrArticulos: TDBGridFind2000;
     PNLAgrArticulosModelo: TLFPanel;
     LAgrModelo: TLFLabel;
     LAgrPrecio: TLFLabel;
     LAgrDesc1: TLFLabel;
     LAgrDesc2: TLFLabel;
     LAgrDesc3: TLFLabel;
     EFAgrArticuloModeloModelo: TLFEditFind2000;
     EAgrPrecio: TLFEdit;
     EAgrDesc1: TLFEdit;
     EAgrDesc2: TLFEdit;
     EAgrDesc3: TLFEdit;
     BTNAgrArticuloModeloAgrega: TButton;
     BTNAgrArticuloModeloElimina: TButton;
     procedure CBTipoCondicionChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure PCDetalleChange(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure EFPerfilChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFColEnter(Sender: TObject);
     procedure DBGFCondCliArtBusqueda(Sender: TObject);
     procedure DBGFCondArtBusqueda(Sender: TObject);
     procedure DBGFCondPerArtBusqueda(Sender: TObject);
     procedure DBGFCondAgrArtBusqueda(Sender: TObject);
     procedure TSCondCliArtShow(Sender: TObject);
     procedure TSCondCliFamShow(Sender: TObject);
     procedure TSCondArtShow(Sender: TObject);
     procedure TSCondFamShow(Sender: TObject);
     procedure TSCondPerShow(Sender: TObject);
     procedure TSCondPerArtShow(Sender: TObject);
     procedure TSCondPerFamShow(Sender: TObject);
     procedure TSCondAgrShow(Sender: TObject);
     procedure TSCondAgrArtShow(Sender: TObject);
     procedure TSCondAgrFamShow(Sender: TObject);
     procedure DBGFCondCliFamBusqueda(Sender: TObject);
     procedure DBGFCondFamBusqueda(Sender: TObject);
     procedure DBGFCondPerFamBusqueda(Sender: TObject);
     procedure DBGFCondAgrFamBusqueda(Sender: TObject);
     procedure AEscaladoExecute(Sender: TObject);
     procedure NavCondCliArtClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavCondCliFamClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavCondPerArtClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavCondPerFamClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavCondAgrArtClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavCondAgrFamClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AAgregaCondicionesVentaExecute(Sender: TObject);
     procedure AEliminaCondicionesClienteExecute(Sender: TObject);
     procedure AAgregaCondionesArticuloModeloExecute(Sender: TObject);
     procedure AEliminaCondicionesArticuloModeloExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormShow(Sender: TObject);
     procedure AImportarExcelExecute(Sender: TObject);
     procedure AActualizarPreciosTarifaExecute(Sender: TObject);
     procedure AActualizarPreciosTarifaCliExecute(Sender: TObject);
     procedure BTNAgrArticuloModeloAgregaClick(Sender: TObject);
     procedure BTNAgrArticuloModeloEliminaClick(Sender: TObject);
  private
     { Private declarations }
     SWFil: integer;
     procedure HabilitaEnlaces;
     procedure PCabeceraVisible(Cabecera: boolean; Opcion: integer);
     procedure TabsVisibles(Tipo: integer);
     procedure Refrescar(Tabla: THYMNavigator);
     procedure VerEscalado();
     procedure Foco(Edicion: TEditFind2000);
  public
     { Public declarations }
     procedure Posicionar(Tipo: string; Rig, Linea: integer);
  end;

var
  FMCondicionesVenta : TFMCondicionesVenta;

implementation

uses UEntorno, UDMMain, UFMain, UDMCondicionesVenta, UFMEscCond, UFMListConfig, UUtiles, UParam, HYFIBQuery, UFMImpConEspVentas;

{$R *.dfm}

procedure TFMCondicionesVenta.FormCreate(Sender: TObject);

  procedure CamposBusquedaGrid(G: TDBGridFind2000);
  var
     i : integer;
  begin
     with g do
     begin
        for i := 0 to Tablas.Count - 1 do
        begin
           if (Trim(UpperCase(Tablas[i])) = 'VER_ARTICULOS_EF') and
              (CamposDesplegar[i] = '1') then
           begin
              Numericos[i] := LeeParametro('ARTBUSQ001');
              CamposADevolver[i] := 'ARTICULO';
              OrdenadosPor[i] := LeeParametro('ARTBUSQ001');
           end;
        end;
     end;
  end;

begin
  inherited;
  AbreData(TDMCondicionesVenta, DMCondicionesVenta);
  NavCondCliArt.DataSource := DMCondicionesVenta.DSQMCondCliArt;
  NavCondCliFam.DataSource := DMCondicionesVenta.DSQMCondCliFam;
  NavCondArt.DataSource := DMCondicionesVenta.DSQMCondArt;
  NavCondFam.DataSource := DMCondicionesVenta.DSQMCondFam;
  NavCondPer.DataSource := DMCondicionesVenta.DSQMCondPer;
  NavCondPerArt.DataSource := DMCondicionesVenta.DSCondPerArt;
  NavCondPerFam.DataSource := DMCondicionesVenta.DSCondPerFam;
  NavCondAgr.DataSource := DMCondicionesVenta.DSCondAgr;
  NavCondAgrArt.DataSource := DMCondicionesVenta.DSCondAgrArt;
  NavCondAgrFam.DataSource := DMCondicionesVenta.DSCondAgrFam;

  SWFil := 0;
  CBTipoCondicion.ItemIndex := 0;
  CBTipoCondicionChange(Sender);

  // Campo para realizar busqueda de articulo en documentos de compra/venta. Por ejemplo ARTICULO, ALFA_1, etc.
  if ((LeeParametro('ARTBUSQ001') <> 'ARTICULO') and (LeeParametro('ARTBUSQ001') <> '')) then
  begin
     CamposBusquedaGrid(DBGFCondCliArt);
     CamposBusquedaGrid(DBGFCondArt);
     CamposBusquedaGrid(DBGFCondPerArt);
     CamposBusquedaGrid(DBGFCondAgrArt);
  end;
end;

procedure TFMCondicionesVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCondicionesVenta);
  Action := caFree;
end;

// Muestra los paneles adecuados según tipo de condición
procedure TFMCondicionesVenta.CBTipoCondicionChange(Sender: TObject);
begin
  EPMain.Enabled := True;
  AEscalado.Enabled := True;
  SWFil := 0;

  case CBTipoCondicion.ItemIndex of
     0: // Elija Tipo de Condición Especial:
     begin
        PCabeceraVisible(False, 1);
        PCDetalle.Visible := False;
        EPMain.Enabled := False;
        AEscalado.Enabled := False;
     end;
     1: // Cond. Cliente
     begin
        PCabeceraVisible(True, 1);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoCondicion.ItemIndex);
        PCDetalle.ActivePage := TSCondCliArt;
        HabilitaEnlaces;
        Foco(EFCliente);
        PCDetalleChange(Self);
     end;
     2: // Cond. Artículo
     begin
        PCabeceraVisible(False, 1);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoCondicion.ItemIndex);
        // PCDetalle.ActivePage := TSCondArt;
     end;
     3: // Cond. Familia
     begin
        PCabeceraVisible(False, 1);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoCondicion.ItemIndex);
        PCDetalle.ActivePage := TSCondFam;
     end;
     4: // Cond. Perfil
     begin
        PCabeceraVisible(False, 1);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoCondicion.ItemIndex);
        PCDetalle.ActivePage := TSCondPer;
     end;
     5: // Cond. Agrupación Cliente
     begin
        PCabeceraVisible(False, 3);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoCondicion.ItemIndex);
        PCDetalle.ActivePage := TSCondAgr;
     end;
     6: // Cond. Agrupación Articulo
     begin
        PCabeceraVisible(False, 3);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoCondicion.ItemIndex);
        PCDetalle.ActivePage := TSCondAgrArticulos;
     end;
  end;

  if (CBTipoCondicion.ItemIndex > 0) then
     PCDetalleChange(Sender);
end;

procedure TFMCondicionesVenta.TabsVisibles(Tipo: integer);
begin
  TSCondCliArt.TabVisible := (Tipo = 1);
  TSCondCliFam.TabVisible := (Tipo = 1);
  TSCondArt.TabVisible := (Tipo = 2);

  TSCondFam.TabVisible := False;

  TSCondPer.TabVisible := (Tipo = 4);
  TScondPerArt.TabVisible := (Tipo = 4);
  TSCondPerFam.TabVisible := (Tipo = 4);
  TSCondAgr.TabVisible := (Tipo = 5);
  TSCondAgrArt.TabVisible := (Tipo = 5);
  TSCondAgrFam.TabVisible := (Tipo = 5);
  TSCondAgrArticulos.TabVisible := (Tipo = 6);
end;

procedure TFMCondicionesVenta.PCabeceraVisible(Cabecera: boolean; Opcion: integer);
begin
  PCabecera.Height := 0;
  PCabecera.Enabled := Cabecera;
  PCabecera.Visible := Cabecera;

  case opcion of
     1:
     begin
        PCliente.Enabled := True;
        PCliente.Top := 0;
        PPerfil.Enabled := False;
        PPerfil.Top := 50;
        PAgrupaciones.Enabled := False;
        PAgrupaciones.Top := 50;
        PCabecera.Height := PCliente.Height;
     end;
     2:
     begin
        PCliente.Enabled := False;
        PCliente.Top := 50;
        PPerfil.Enabled := True;
        PPerfil.Top := 0;
        PAgrupaciones.Enabled := False;
        PAgrupaciones.Top := 50;
        PCabecera.Height := PPerfil.Height;
     end;
     3:
     begin
        PCliente.Enabled := False;
        PCliente.Top := 50;
        PPerfil.Enabled := False;
        PPerfil.Top := 50;
        PAgrupaciones.Enabled := True;
        PAgrupaciones.Top := 0;
        PCabecera.Height := PAgrupaciones.Height;
     end;
  end;
end;

procedure TFMCondicionesVenta.PCDetalleChange(Sender: TObject);
begin
  if (PCDetalle.ActivePage = TSCondPer{4}) then
     PCabeceraVisible(False, 1);

  if ((PCDetalle.ActivePage = TSCondPerArt{5}) or (PCDetalle.ActivePage = TSCondPerFam{6})) then
  begin
     PCabeceraVisible(True, 2);
     Foco(EFPerfil);
  end;

  if (PCDetalle.ActivePage = TSCondAgr{7}) then
     PCabeceraVisible(False, 3);

  if ((PCDetalle.ActivePage = TSCondAgrArt{8}) or (PCDetalle.ActivePage = TSCondAgrFam{9})) then
  begin
     PCabeceraVisible(True, 3);
     Foco(EFAgrupacion);
     EFAgrupacion.CondicionBusqueda := 'TIPO=''C''';
  end;

  if (PCDetalle.ActivePage = TSCondAgrArticulos{7}) then
     PCabeceraVisible(False, 3);


  AActualizarPreciosTarifa.Visible := (PCDetalle.ActivePage = TSCondCliArt);
  AActualizarPreciosTarifaCli.Visible := (PCDetalle.ActivePage = TSCondCliArt);
  AActualizarPreciosTarifaCli.Enabled := StrToIntDef(EFCliente.Text, -999) > -999;
end;

procedure TFMCondicionesVenta.EFClienteChange(Sender: TObject);
begin
  if (EFCliente.Text <> '') then
     DMCondicionesVenta.FiltrarCliente(StrToIntDef(EFCliente.Text, 0));
  AActualizarPreciosTarifaCli.Caption := _('Actualizar Precios Tarifa al Cliente') + ' ' + DBETitCliente.Text;
  AActualizarPreciosTarifaCli.Enabled := (StrToIntDef(EFCliente.Text, -999) > -999);
end;

procedure TFMCondicionesVenta.EFPerfilChange(Sender: TObject);
begin
  if (EFPerfil.Text <> '') then
     DMCondicionesVenta.FiltrarPerfil(EFPerfil.Text);
end;

procedure TFMCondicionesVenta.EFAgrupacionChange(Sender: TObject);
begin
  if (EFAgrupacion.Text <> '') then
     DMCondicionesVenta.FiltrarAgrupaciones(EFAgrupacion.Text);
end;

// Action List
procedure TFMCondicionesVenta.AClienteExecute(Sender: TObject);
begin
  if PCliente.Enabled then
  begin
     if EFCliente.Text <> '' then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + EFCliente.Text);
  end
  else
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMCondicionesVenta.QMCliCLIENTE.AsInteger));
end;

procedure TFMCondicionesVenta.VerEscalado();
begin
  AbreForm(TFMEscCond, FMEscCond);

  case CBTipoCondicion.ItemIndex of
     1:
     begin
        if (PCDetalle.ActivePage = TSCondCliArt) then
           FMEscCond.Filtra('CCA', DMCondicionesVenta.QMCondCliArtRIG.AsInteger);
        if (PCDetalle.ActivePage = TSCondCliFam) then
           FMEscCond.Filtra('CCF', DMCondicionesVenta.QMCondCliFamRIG.AsInteger);
     end;
     2: FMEscCond.Filtra('CAR', DMCondicionesVenta.QMCondArtRIG.AsInteger);
     3: FMEscCond.Filtra('CFA', DMCondicionesVenta.QMCondFamRIG.AsInteger);
     4:
     begin
        if (PCDetalle.ActivePage = TSCondPer) then
           FMEscCond.Filtra('CPE', DMCondicionesVenta.QMCondPerRIG.AsInteger)
        else if (PCDetalle.ActivePage = TSCondPerArt) then
           FMEscCond.Filtra('CPA', DMCondicionesVenta.QMCondPerArtRIG.AsInteger)
        else if (PCDetalle.ActivePage = TSCondPerFam) then
           FMEscCond.Filtra('CPF', DMCondicionesVenta.QMCondPerFamRIG.AsInteger);
     end;
     5:
     begin
        if (PCDetalle.ActivePage = TSCondAgr) then
           FMEscCond.Filtra('CAG', DMCondicionesVenta.QMCondAgrRIG.AsInteger)
        else if (PCDetalle.ActivePage = TSCondAgrArt) then
           FMEscCond.Filtra('CAA', DMCondicionesVenta.QMCondAgrArtRIG.AsInteger)
        else if (PCDetalle.ActivePage = TSCondAgrFam) then
           FMEscCond.Filtra('CAF', DMCondicionesVenta.QMCondAgrFamRIG.AsInteger);
     end;
  end;
end;

procedure TFMCondicionesVenta.SBAClienteDblClick(Sender: TObject);
begin
  ACliente.Execute();
end;

procedure TFMCondicionesVenta.Refrescar(Tabla: THYMNavigator);
begin
  Tabla.BtnClick(nbRefresh); // javi para esto necesita URecursos
end;

// Activar enlaces
procedure TFMCondicionesVenta.HabilitaEnlaces;
begin
  if (FMain.AClientes.Enabled = False) then
     SBACliente.Width := 0
  else
  begin
     SolapaControles(SBACliente, DBETitCliente);
     DBETitCliente.Color := REntorno.ColorEnlaceActivo;
  end;
end;

procedure TFMCondicionesVenta.Foco(Edicion: TEditFind2000);
begin
  Edicion.ClassParent;
  Edicion.SetFocus;
end;

procedure TFMCondicionesVenta.FormActivate(Sender: TObject);
begin
  inherited;
  if (PCDetalle.ActivePage = TSCondCliArt) then
     Refrescar(NavCondCliArt);
  if (PCDetalle.ActivePage = TSCondCliFam) then
     Refrescar(NavCondCliFam);
  if (PCDetalle.ActivePage = TSCondArt) then
     Refrescar(NavCondArt);
  if (PCDetalle.ActivePage = TSCondFam) then
     Refrescar(NavCondFam);
  if (PCDetalle.ActivePage = TSCondPer) then
     Refrescar(NavCondPer);
  if (PCDetalle.ActivePage = TSCondPerArt) then
     Refrescar(NavCondPerArt);
  if (PCDetalle.ActivePage = TSCondPerFam) then
     Refrescar(NavCondPerFam);
  if (PCDetalle.ActivePage = TSCondAgr) then
     Refrescar(NavCondAgr);
  if (PCDetalle.ActivePage = TSCondAgrArt) then
     Refrescar(NavCondAgrArt);
  if (PCDetalle.ActivePage = TSCondAgrFam) then
     Refrescar(NavCondAgrFam);
end;

// Asigna el ControlEdit correspondiente
procedure TFMCondicionesVenta.DBGFColEnter(Sender: TObject);
var
  DBGF : TDBGridFind2000;
  i : integer;
  Nav : THYMNavigator;
  nombre : string;
begin
  DBGF := TDBGridFind2000(Sender);
  nombre := DBGF.Name;
  with FMCondicionesVenta do
  begin
     for i := 0 to (ComponentCount - 1) do
     begin
        if Components[i] is THYMNavigator then
        begin
           nav := THYMNavigator(Components[i]);
           if nav.EditaControl.Name = nombre then
              ControlEdit := nav.ControlEdit;
        end;
     end;
  end;
end;

procedure TFMCondicionesVenta.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  if (PCDetalle.ActivePage = TSCondCliArt{0}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondCliArt,
        'CCA', 0) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondCliFam{1}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondCliFam,
        'CCF', 1) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondArt{2}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondArt,
        'CAR', 2) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondFam{3}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondFam,
        'CFA', 3) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondPer{4}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondPer,
        'CPE', 4) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondPerArt{5}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondPerArt,
        'CPA', 5) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondPerFam{6}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondPerFam,
        'CPF', 6) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondAgr{7}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondAgr,
        'CAG', 7) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondAgrArt{8}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondAgrArt,
        'CAA', 8) in [mrOk, mrAll]) then
        SWFil := 1;
  if (PCDetalle.ActivePage = TSCondAgrFam{9}) then
     if (DMCondicionesVenta.BusquedaCompleja(DMCondicionesVenta.QMCondAgrFam,
        'CAF', 9) in [mrOk, mrAll]) then
        SWFil := 1;

  Continua := False;
end;

procedure TFMCondicionesVenta.DBGFCondCliArtBusqueda(Sender: TObject);
begin
  DBGFCondCliArt.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.DBGFCondArtBusqueda(Sender: TObject);
begin
  DBGFCondArt.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.DBGFCondPerArtBusqueda(Sender: TObject);
begin
  DBGFCondPerArt.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.DBGFCondAgrArtBusqueda(Sender: TObject);
begin
  DBGFCondAgrArt.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.TSCondCliArtShow(Sender: TObject);
begin
  ControlEdit := CECondCliArt;
end;

procedure TFMCondicionesVenta.TSCondCliFamShow(Sender: TObject);
begin
  ControlEdit := CECondCliFam;
end;

procedure TFMCondicionesVenta.TSCondArtShow(Sender: TObject);
begin
  ControlEdit := CECondArt;
end;

procedure TFMCondicionesVenta.TSCondFamShow(Sender: TObject);
begin
  ControlEdit := CECondFam;
end;

procedure TFMCondicionesVenta.TSCondPerShow(Sender: TObject);
begin
  ControlEdit := CECondPer;
end;

procedure TFMCondicionesVenta.TSCondPerArtShow(Sender: TObject);
begin
  ControlEdit := CECondPerArt;
end;

procedure TFMCondicionesVenta.TSCondPerFamShow(Sender: TObject);
begin
  ControlEdit := CECondPerFam;
end;

procedure TFMCondicionesVenta.TSCondAgrShow(Sender: TObject);
begin
  ControlEdit := CECondAgr;
end;

procedure TFMCondicionesVenta.TSCondAgrArtShow(Sender: TObject);
begin
  ControlEdit := CECondAgrArt;
end;

procedure TFMCondicionesVenta.TSCondAgrFamShow(Sender: TObject);
begin
  ControlEdit := CECondAgrFam;
end;

procedure TFMCondicionesVenta.DBGFCondCliFamBusqueda(Sender: TObject);
begin
  DBGFCondCliFam.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.DBGFCondFamBusqueda(Sender: TObject);
begin
  DBGFCondFam.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.DBGFCondPerFamBusqueda(Sender: TObject);
begin
  DBGFCondPerFam.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.DBGFCondAgrFamBusqueda(Sender: TObject);
begin
  DBGFCondAgrFam.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesVenta.AEscaladoExecute(Sender: TObject);
begin
  VerEscalado();
end;

procedure TFMCondicionesVenta.NavCondCliArtClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFCliente.Text = '') or (DBETitCliente.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes un Cliente'), mtWarning, [mbOK], 0);
     EFCliente.SetFocus;
     Continua := False;
  end;
end;

procedure TFMCondicionesVenta.NavCondCliFamClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFCliente.Text = '') or (DBETitCliente.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes un Cliente'), mtWarning, [mbOK], 0);
     EFCliente.SetFocus;
     Continua := False;
  end;
end;

procedure TFMCondicionesVenta.NavCondPerArtClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFPerfil.Text = '') or (DBETitPerfil.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes un Perfil'), mtWarning, [mbOK], 0);
     EFPerfil.SetFocus;
     Continua := False;
  end;
end;

procedure TFMCondicionesVenta.NavCondPerFamClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFPerfil.Text = '') or (DBETitPerfil.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes un Perfil'), mtWarning, [mbOK], 0);
     EFPerfil.SetFocus;
     Continua := False;
  end;
end;

procedure TFMCondicionesVenta.NavCondAgrArtClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFAgrupacion.Text = '') or (DBETitAgrupaciones.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes una Agrupación de Clientes'), mtWarning, [mbOK], 0);
     EFAgrupacion.SetFocus;
     Continua := False;
  end;
end;

procedure TFMCondicionesVenta.NavCondAgrFamClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFAgrupacion.Text = '') or (DBETitAgrupaciones.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes una Agrupación de Clientes'), mtWarning, [mbOK], 0);
     EFAgrupacion.SetFocus;
     Continua := False;
  end;
end;

procedure TFMCondicionesVenta.AAgregaCondicionesVentaExecute(Sender: TObject);
begin
  DMCondicionesVenta.AgregaCondicionModeloArticulos(EFModelo.Text, StrToFloat(EPrecio.Text), StrToFloat(EDesc1.Text), StrToFloat(EDesc2.Text), StrToFloat(EDesc3.Text));
end;

procedure TFMCondicionesVenta.AEliminaCondicionesClienteExecute(Sender: TObject);
begin
  DMCondicionesVenta.EliminaCondicionModeloArticulos(EFCliente.Text, EFModelo.Text);
end;

procedure TFMCondicionesVenta.AAgregaCondionesArticuloModeloExecute(Sender: TObject);
begin
  DMCondicionesVenta.AgregaCondicionArticulosDeModelo('CAR', EFArticuloModeloModelo.Text, StrToFloat(LFEArticuloModeloPrecio.Text), StrToFloat(LFEArticuloModeloDesc1.Text), StrToFloat(LFEArticuloModeloDesc2.Text), StrToFloat(LFEArticuloModeloDesc3.Text));
end;

procedure TFMCondicionesVenta.AEliminaCondicionesArticuloModeloExecute(Sender: TObject);
begin
  DMCondicionesVenta.EliminaCondicionArticulosDeModelo('CAR', EFArticuloModeloModelo.Text);
end;

procedure TFMCondicionesVenta.BTNAgrArticuloModeloAgregaClick(Sender: TObject);
begin
  inherited;
  DMCondicionesVenta.AgregaCondicionArticulosDeModelo('CAA', EFAgrArticuloModeloModelo.Text, StrToFloat(EAgrPrecio.Text), StrToFloat(EAgrDesc1.Text), StrToFloat(EAgrDesc2.Text), StrToFloat(EAgrDesc3.Text));
end;

procedure TFMCondicionesVenta.BTNAgrArticuloModeloEliminaClick(Sender: TObject);
begin
  inherited;
  DMCondicionesVenta.EliminaCondicionArticulosDeModelo('CAA', EFAgrArticuloModeloModelo.Text);
end;

procedure TFMCondicionesVenta.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  if (PCDetalle.ActivePage = TSCondCliArt) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSQMCondCliArt;
        CampoNum := 'ARTICULO';
        CampoStr := 'TITULO_ARTICULO';
        Tabla_a_buscar := 'VER_CONDICIONES_CLIENTE';
        OrdenadoPor.Text := 'ARTICULO';
        CondicionBusqueda := 'TIPO=''CCA'' AND CLIENTE = ' + IntToStr(StrToIntDef(EFCliente.Text, 0));
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondCliFam) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSQMCondCliFam;
        CampoNum := 'FAMILIA';
        CampoStr := 'TITULO_FAMILIA';
        Tabla_a_buscar := 'VER_CONDICIONES_CLIENTE';
        OrdenadoPor.Text := 'FAMILIA';
        CondicionBusqueda := 'TIPO=''CCF'' AND CLIENTE = ' + IntToStr(StrToIntDef(EFCliente.Text, 0));
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondArt) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSQMCondArt;
        CampoNum := 'ARTICULO';
        CampoStr := 'TITULO_ARTICULO';
        Tabla_a_buscar := 'VER_CONDICIONES_CLIENTE';
        OrdenadoPor.Text := 'ARTICULO';
        CondicionBusqueda := 'TIPO=''CAR''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondFam) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSQMCondFam;
        CampoNum := 'FAMILIA';
        CampoStr := 'TITULO_FAMILIA';
        Tabla_a_buscar := 'VER_CONDICIONES_CLIENTE';
        OrdenadoPor.Text := 'FAMILIA';
        CondicionBusqueda := 'TIPO=''CFA''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondPer) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSQMCondPer;
        CampoNum := 'PERFIL';
        CampoStr := 'TITULO_PERFIL';
        Tabla_a_buscar := 'VER_CONDICIONES_PERFIL';
        OrdenadoPor.Text := 'PERFIL';
        CondicionBusqueda := 'TIPO=''CPE''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondPerArt) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSCondPerArt;
        CampoNum := 'ARTICULO';
        CampoStr := 'TITULO_ARTICULO';
        Tabla_a_buscar := 'VER_CONDICIONES_PERFIL';
        OrdenadoPor.Text := 'ARTICULO';
        CondicionBusqueda := 'TIPO=''CPA'' AND PERFIL = ''' + EFPerfil.Text + '''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondPerFam) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSCondPerFam;
        CampoNum := 'FAMILIA';
        CampoStr := 'TITULO_FAMILIA';
        Tabla_a_buscar := 'VER_CONDICIONES_PERFIL';
        OrdenadoPor.Text := 'FAMILIA';
        CondicionBusqueda := 'TIPO=''CPF'' AND PERFIL = ''' + EFPerfil.Text + '''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondAgr) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSCondAgr;
        CampoNum := 'AGRUPACION';
        CampoStr := 'TITULO_AGRUPACION';
        Tabla_a_buscar := 'VER_CONDICIONES_AGRUPACION';
        OrdenadoPor.Text := 'AGRUPACION';
        CondicionBusqueda := 'TIPO=''CAG''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondAgrArt) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSCondAgrArt;
        CampoNum := 'ARTICULO';
        CampoStr := 'TITULO_ARTICULO';
        Tabla_a_buscar := 'VER_CONDICIONES_AGRUPACION';
        OrdenadoPor.Text := 'ARTICULO';
        CondicionBusqueda := 'TIPO=''CAA'' AND AGRUPACION = ''' + EFAgrupacion.Text + '''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  if (PCDetalle.ActivePage = TSCondAgrFam) then
  begin
     with G2kTableLoc do
     begin
        DataSource := DMCondicionesVenta.DSCondAgrFam;
        CampoNum := 'FAMILIA';
        CampoStr := 'TITULO_FAMILIA';
        Tabla_a_buscar := 'VER_CONDICIONES_AGRUPACION';
        OrdenadoPor.Text := 'FAMILIA';
        CondicionBusqueda := 'TIPO=''CAF'' AND AGRUPACION = ''' + EFAgrupacion.Text + '''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end;
  end;

  G2KTableLoc.Click;
end;

procedure TFMCondicionesVenta.Posicionar(Tipo: string; Rig, Linea: integer);
var
  Articulo, Familia : string;
begin
  if (Tipo = 'CCA') or (Tipo = 'CCF') then
     CBTipoCondicion.ItemIndex := 1;
  if (Tipo = 'CAR') then
     CBTipoCondicion.ItemIndex := 2;
  if (Tipo = 'CFA') then
     CBTipoCondicion.ItemIndex := 3;
  if (Tipo = 'CPE') or (Tipo = 'CPA') or (Tipo = 'CPF') then
     CBTipoCondicion.ItemIndex := 4;
  if (Tipo = 'CAG') or (Tipo = 'CGA') or (Tipo = 'CAF') then
     CBTipoCondicion.ItemIndex := 5;

  CBTipoCondicionChange(Self);

  if (Tipo = 'CCA') or (Tipo = 'CCF') then
     TabsVisibles(1);
  if (Tipo = 'CAR') then
     TabsVisibles(2);
  if (Tipo = 'CFA') then
     TabsVisibles(0);
  if (Tipo = 'CPE') or (Tipo = 'CPA') or (Tipo = 'CPF') then
     TabsVisibles(4);
  if (Tipo = 'CAG') or (Tipo = 'CGA') or (Tipo = 'CAF') then
     TabsVisibles(5);

  if (Tipo = 'CCA') or (Tipo = 'CCF') then
     TabsVisibles(1);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CLIENTE, ARTICULO, FAMILIA, PERFIL, AGRUPACION ');
        SQL.Add(' FROM ART_CONDICIONES_C ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' RIG = :RIG ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := Rig;
        ExecQuery;
        if (FieldByName['CLIENTE'].AsInteger <> 0) then
           EFCliente.Text := IntToStr(FieldByName['CLIENTE'].AsInteger);
        if (FieldByName['PERFIL'].AsString <> '') then
           EFPerfil.Text := FieldByName['PERFIL'].AsString;
        if (FieldByName['AGRUPACION'].AsString <> '') then
           EFAgrupacion.Text := FieldByName['AGRUPACION'].AsString;
        if (FieldByName['ARTICULO'].AsString <> '') then
           Articulo := FieldByName['ARTICULO'].AsString;
        if (FieldByName['FAMILIA'].AsString <> '') then
           Familia := FieldByName['FAMILIA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  case CBTipoCondicion.ItemIndex of
     1:
     begin
        if Tipo = 'CCA' then
           PCDetalle.ActivePage := TSCondCliArt;

        if Tipo = 'CCF' then
           PCDetalle.ActivePage := TSCondCliFam;
     end;
     // 2: 'CAR'
     // 3: 'CFA'
     4:
     begin
        if Tipo = 'CPE' then
           PCDetalle.ActivePage := TSCondPer;
        if Tipo = 'CPA' then
           PCDetalle.ActivePage := TSCondPerArt;
        if Tipo = 'CPF' then
           PCDetalle.ActivePage := TSCondPerFam;
     end;
     5:
     begin
        if Tipo = 'CAG' then
           PCDetalle.ActivePage := TSCondAgr;
        if Tipo = 'CAA' then
           PCDetalle.ActivePage := TSCondAgrArt;
        if Tipo = 'CAF' then
           PCDetalle.ActivePage := TSCondAgrFam;
     end;
  end;

  case CBTipoCondicion.ItemIndex of
     1:
     begin
        if Tipo = 'CCA' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondCliArt, 'ARTICULO', Articulo);
        if Tipo = 'CCF' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondCliFam, 'FAMILIA', Familia);
     end;
     2: UUtiles.Posicionar(DMCondicionesVenta.QMCondArt, 'ARTICULO', Articulo);
     3: UUtiles.Posicionar(DMCondicionesVenta.QMCondFam, 'FAMILIA', Familia);
     4:
     begin
        if Tipo = 'CPE' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondPer, 'LINEA', Linea);
        if Tipo = 'CPA' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondPerArt, 'ARTICULO', Articulo);
        if Tipo = 'CPF' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondPerFam, 'FAMILIA', Familia);
     end;
     5:
     begin
        if Tipo = 'CAG' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondAgr, 'LINEA', Linea);
        if Tipo = 'CAA' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondAgrArt, 'ARTICULO', Articulo);
        if Tipo = 'CAF' then
           UUtiles.Posicionar(DMCondicionesVenta.QMCondAgrFam, 'FAMILIA', Familia);
     end;
  end;
end;

procedure TFMCondicionesVenta.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
  DescripcionAlfa : string;
begin
  inherited;
  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     DescripcionAlfa := LeeParametro(format('ARTDESC%3.3d', [i]));

     IdColumna := EncuentraField(DBGFCondCliArt, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondCliArt.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondCliFam, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondCliFam.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondArt, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondArt.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondFam, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondFam.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondPer, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondPer.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondPerArt, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondPerArt.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondPerFam, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondPerFam.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondAgr, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondAgr.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondAgrArt, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondAgrArt.Columns[IdColumna].Title.Caption := DescripcionAlfa;

     IdColumna := EncuentraField(DBGFCondAgrFam, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFCondAgrFam.Columns[IdColumna].Title.Caption := DescripcionAlfa;
  end;
end;

procedure TFMCondicionesVenta.AImportarExcelExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMImpConEspVentas, FMImpConEspVentas, Sender);
end;

procedure TFMCondicionesVenta.AActualizarPreciosTarifaExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Desea modificar los precios de las condiciones DE TODOS LOS CLIENTES por los precios de la tarifa del cliente?')) then
     DMCondicionesVenta.ActualizarPreciosTarifa;
end;

procedure TFMCondicionesVenta.AActualizarPreciosTarifaCliExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFCliente.Text, -999) > -999) then
  begin
     if ConfirmaMensaje(_('Desea modificar los precios de las condiciones por los precios de la tarifa del cliente?')) then
        DMCondicionesVenta.ActualizarPreciosTarifa(StrToInt(EFCliente.Text));
  end;
end;

end.
