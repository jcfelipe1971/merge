unit UFMPromocionesVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, UFIBDBEditfind, UFormGest, ExtCtrls,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, Grids, DBGrids, NsDBGrid,
  UEditPanel, Menus, rxPlacemnt, ActnList, UControlEdit, UNavigator, UTeclas,
  Buttons, UHYDBGrid, DB, ULFDBEdit, ULFEditFind2000,
  {Utiliza BtnClick del HYMNavigator} URecursos, ULFComboBox, ULFToolBar,
  ULFPanel, ULFActionList, ULFFormStorage, ULFPageControl, ULFLabel,
  UFPEditSinNavegador;

type
  TFMPromocionesVenta = class(TFPEditSinNavegador)
     CBTipoPromocion: TLFComboBox;
     PCabecera: TLFPanel;
     PCliente: TLFPanel;
     PAgrupaciones: TLFPanel;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     DBETitCliente: TLFDbedit;
     LAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     DBETitAgrupaciones: TLFDbedit;
     PCDetalle: TLFPageControl;
     SBACliente: TSpeedButton;
     AL: TLFActionList;
     ACliente: TAction;
     TSep1: TToolButton;
     TSFamilia: TTabSheet;
     TBFamilia: TLFToolBar;
     NavFamilia: THYMNavigator;
     DBGFFamilia: TDBGridFind2000;
     CEFamilia: TControlEdit;
     CEFamiliaPMEdit: TPopUpTeclas;
     TSCliFam: TTabSheet;
     DBGFCliFam: TDBGridFind2000;
     TBCliFam: TLFToolBar;
     NavCliFam: THYMNavigator;
     CECliFam: TControlEdit;
     CECliFamPMEdit: TPopUpTeclas;
     TSCliArt: TTabSheet;
     TBCliArt: TLFToolBar;
     NavCliArt: THYMNavigator;
     DBGFCliArt: TDBGridFind2000;
     CECliArt: TControlEdit;
     CECliArtPMEdit: TPopUpTeclas;
     TSAgrFam: TTabSheet;
     DBGFAgrFam: TDBGridFind2000;
     TBAgrFam: TLFToolBar;
     NavAgrFam: THYMNavigator;
     CEAgrFam: TControlEdit;
     CEAgrFamPMEdit: TPopUpTeclas;
     TSAgrArt: TTabSheet;
     DBGFAgrArt: TDBGridFind2000;
     TBAgrArt: TLFToolBar;
     NavAgrArt: THYMNavigator;
     CEAgrArt: TControlEdit;
     CEAgrArtPMEdit: TPopUpTeclas;
     TSArticulo: TTabSheet;
     DBGFArticulo: TDBGridFind2000;
     TBArticulo: TLFToolBar;
     NavArticulo: THYMNavigator;
     CEArticulo: TControlEdit;
     CEArticuloPMEdit: TPopUpTeclas;
     ADetPromo: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure CBTipoPromocionChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure PCDetalleChange(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure DBGFColEnter(Sender: TObject);
     procedure DBGFBusqueda(Sender: TObject);
     procedure TSFamiliaShow(Sender: TObject);
     procedure TSCliFamShow(Sender: TObject);
     procedure TSCliArtShow(Sender: TObject);
     procedure TSAgrFamShow(Sender: TObject);
     procedure TSAgrArtShow(Sender: TObject);
     procedure TSArticuloShow(Sender: TObject);
     procedure NavCliClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavAgrClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure ADetPromoExecute(Sender: TObject);
  private
     { Private declarations }
     SWFil: integer;
     TipoPromo: string;
     procedure HabilitaEnlaces;
     // procedure SolapaControles(solapado: TSpeedButton; asolapar: TDBEdit);
     procedure PCabeceraVisible(Cabecera: boolean; Opcion: integer);
     procedure TabsVisibles(Tipo: integer);
     procedure Refrescar(Tabla: THYMNavigator);
     procedure Foco(Edicion: TEditFind2000);
     procedure VerDetalle;
  public
     { Public declarations }
  end;

var
  FMPromocionesVenta : TFMPromocionesVenta;

implementation

uses UEntorno, UDMMain, UFMain, UDMPromocionesVenta, UFMDetPromo, UUtiles;

{$R *.dfm}

procedure TFMPromocionesVenta.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMPromocionesVenta, DMPromocionesVenta);
  NavFamilia.DataSource := DMPromocionesVenta.DSQMFamilia;

  SWFil := 0;
  TipoPromo := '';
  CBTipoPromocion.ItemIndex := 0;
  CBTipoPromocionChange(Sender);
end;

procedure TFMPromocionesVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPromocionesVenta);
end;

// Muestra los paneles adecuados según tipo de condición
procedure TFMPromocionesVenta.CBTipoPromocionChange(Sender: TObject);
begin
  SWFil := 0;
  ADetPromo.Enabled := True;

  case CBTipoPromocion.ItemIndex of
     0:
     begin
        PCabeceraVisible(False, 1);
        PCDetalle.Visible := False;
        ADetPromo.Enabled := False;
     end;
     1:
     begin
        PCabeceraVisible(False, 1);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoPromocion.ItemIndex);
        PCDetalle.ActivePage := TSFamilia;
     end;
     2:
     begin
        PCabeceraVisible(True, 1);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoPromocion.ItemIndex);
        HabilitaEnlaces;
        PCDetalle.ActivePage := TSCliFam;
        Foco(EFCliente);
     end;
     3:
     begin
        PCabeceraVisible(True, 2);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoPromocion.ItemIndex);
        PCDetalle.ActivePage := TSAgrFam;
        Foco(EFAgrupacion);
     end;
     4:
     begin
        PCabeceraVisible(False, 1);
        PCDetalle.Visible := True;
        TabsVisibles(CBTipoPromocion.ItemIndex);
        PCDetalle.ActivePage := TSArticulo;
     end;
  end;
end;

procedure TFMPromocionesVenta.TabsVisibles(Tipo: integer);
begin
  TSFamilia.TabVisible := False;
  TSCliFam.TabVisible := False;
  TSCliArt.TabVisible := False;
  TSAgrFam.TabVisible := False;
  TSAgrArt.TabVisible := False;
  TSArticulo.TabVisible := False;

  case Tipo of
     2:
     begin
        TSCliFam.TabVisible := True;
        TSCliArt.TabVisible := True;
     end;
     3:
     begin
        TSAgrFam.TabVisible := True;
        TSAgrArt.TabVisible := True;
     end;
  end;
end;

procedure TFMPromocionesVenta.PCabeceraVisible(Cabecera: boolean; Opcion: integer);
begin
  if (not Cabecera) then
  begin
     PCabecera.Height := 0;
     PCabecera.Enabled := False;
     PCabecera.Visible := False;
  end
  else
  begin
     PCabecera.Enabled := True;
     PCabecera.Visible := True;

     case Opcion of
        1:
        begin
           PCliente.Visible := True;
           PCliente.Top := 0;
           PAgrupaciones.Visible := False;
           PCabecera.Height := PCliente.Height;
        end;
        2:
        begin
           PAgrupaciones.Visible := True;
           PAgrupaciones.Top := 0;
           PCliente.Visible := False;
           PCabecera.Height := PAgrupaciones.Height;
        end;
     end;
  end;
end;

procedure TFMPromocionesVenta.PCDetalleChange(Sender: TObject);
begin
  case (PCDetalle.ActivePageIndex) of
     0:
     begin
        PCabeceraVisible(False, 1);
     end;
     1, 2:
     begin
        PCabeceraVisible(True, 1);
        Foco(EFCliente);
     end;
     3, 4:
     begin
        PCabeceraVisible(True, 2);
        Foco(EFAgrupacion);
     end;
  end;
end;

procedure TFMPromocionesVenta.EFClienteChange(Sender: TObject);
begin
  if (EFCliente.Text <> '') then
  begin
     DMPromocionesVenta.MuestraCliente(StrToIntDef(EFCliente.Text, 0));
     if (TipoPromo = 'PCA') then
        DMPromocionesVenta.FiltrarCliArt
     else if (TipoPromo = 'PCF') then
        DMPromocionesVenta.FiltrarCliFam;
  end;
end;

procedure TFMPromocionesVenta.EFAgrupacionChange(Sender: TObject);
begin
  if (EFAgrupacion.Text <> '') then
  begin
     DMPromocionesVenta.MuestraAgrupacion(EFAgrupacion.Text);
     if (TipoPromo = 'PAF') then
        DMPromocionesVenta.FiltrarAgrFam
     else if (TipoPromo = 'PAA') then
        DMPromocionesVenta.FiltrarAgrArt;
  end;
end;

// Action List
procedure TFMPromocionesVenta.AClienteExecute(Sender: TObject);
begin
  if PCliente.Enabled then
  begin
     if EFCliente.Text <> '' then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + EFCliente.Text);
  end
  else
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMPromocionesVenta.xClienteCLIENTE.AsInteger));
end;

procedure TFMPromocionesVenta.SBAClienteDblClick(Sender: TObject);
begin
  ACliente.Execute();
end;

procedure TFMPromocionesVenta.Refrescar(Tabla: THYMNavigator);
begin
  Tabla.BtnClick(nbRefresh); //javi     para esto necesita URecursos
end;

// Activar enlaces
procedure TFMPromocionesVenta.HabilitaEnlaces;
begin
  if (FMain.AClientes.Enabled = False) then
     SBACliente.Width := 0
  else
  begin
     SolapaControles(SBACliente, DBETitCliente);
     DBETitCliente.Color := REntorno.ColorEnlaceActivo;
  end;
end;

{Utiliza el de UUtiles
procedure TFMPromocionesVenta.SolapaControles(solapado: TSpeedButton; asolapar: TDBEdit);
begin
  Solapado.Top := ASolapar.Top;
  Solapado.Width := ASolapar.Width;
  Solapado.Height := Asolapar.Height;
  Solapado.left := ASolapar.left;
end;
}

procedure TFMPromocionesVenta.Foco(Edicion: TEditFind2000);
begin
  Edicion.ClassParent;
  Edicion.SetFocus;
  Edicion.OnChange(Self);
end;

procedure TFMPromocionesVenta.FormActivate(Sender: TObject);
begin
  inherited;
  case (PCDetalle.ActivePageIndex) of
     0: Refrescar(NavFamilia);
     1: Refrescar(NavCliFam);
     2: Refrescar(NavCliArt);
     3: Refrescar(NavAgrFam);
     4: Refrescar(NavAgrArt);
     5: Refrescar(NavArticulo);
  end;
end;

// Asigna el ControlEdit correspondiente
procedure TFMPromocionesVenta.DBGFColEnter(Sender: TObject);
var
  DBGF : TDBGridFind2000;
  i : integer;
  Nav : THYMNavigator;
  nombre : string;
begin
  DBGF := TDBGridFind2000(Sender);
  nombre := DBGF.Name;
  with FMPromocionesVenta do
     for i := 0 to (ComponentCount - 1) do
        if Components[i] is THYMNavigator then
        begin
           nav := THYMNavigator(Components[i]);
           if nav.EditaControl.Name = nombre then
              ControlEdit := nav.ControlEdit;
        end;
end;

procedure TFMPromocionesVenta.DBGFBusqueda(Sender: TObject);
begin
  with (Sender as TDBGridFind2000) do
     if (ColumnaActual = 'ARTICULO') then
     begin
        Filtros := [obEmpresa, obEjercicio, obCanal];
        CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
     end
     else if (ColumnaActual = 'PROMOCION') then
     begin
        Filtros := [obEmpresa, obEjercicio, obCanal];
        CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
     end
     else if (ColumnaActual = 'TARIFA') then
     begin
        Filtros := [obEmpresa];
        CondicionBusqueda := 'PROPAGA = 1 AND ACTIVA = 1';
     end
     else if (ColumnaActual = 'FAMILIA') then
     begin
        Filtros := [obEmpresa];
        CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
     end;
end;

procedure TFMPromocionesVenta.TSFamiliaShow(Sender: TObject);
begin
  TipoPromo := 'PFA';
  ControlEdit := CEFamilia;
end;

procedure TFMPromocionesVenta.TSCliFamShow(Sender: TObject);
begin
  TipoPromo := 'PCF';
  ControlEdit := CECliFam;
end;

procedure TFMPromocionesVenta.TSCliArtShow(Sender: TObject);
begin
  TipoPromo := 'PCA';
  ControlEdit := CECliArt;
end;

procedure TFMPromocionesVenta.TSAgrFamShow(Sender: TObject);
begin
  TipoPromo := 'PAF';
  ControlEdit := CEAgrFam;
end;

procedure TFMPromocionesVenta.TSAgrArtShow(Sender: TObject);
begin
  TipoPromo := 'PAA';
  ControlEdit := CEAgrArt;
end;

procedure TFMPromocionesVenta.TSArticuloShow(Sender: TObject);
begin
  TipoPromo := 'PAR';
  ControlEdit := CEArticulo;
end;

procedure TFMPromocionesVenta.NavCliClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFCliente.Text = '') or (DBETitCliente.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes un Cliente'), mtWarning, [mbOK], 0);
     EFCliente.SetFocus;
     Continua := False;
  end;
end;

procedure TFMPromocionesVenta.NavAgrClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if (((EFAgrupacion.Text = '') or (DBETitAgrupaciones.Text = '')) and
     (Button in [nbInsert, nbEdit])) then
  begin
     MessageDlg(_('Debe especificar antes una Agrupación de Clientes'), mtWarning, [mbOK], 0);
     EFAgrupacion.SetFocus;
     Continua := False;
  end;
end;

procedure TFMPromocionesVenta.VerDetalle;
begin
  AbreForm(TFMDetPromo, FMDetPromo);

  case CBTipoPromocion.ItemIndex of
     1: FMDetPromo.Filtra('PFA', DMPromocionesVenta.QMFamiliaRIG.AsInteger);
     2:
     begin
        if (PCDetalle.ActivePage = TSCliFam) then
           FMDetPromo.Filtra('PCF', DMPromocionesVenta.QMCliFamRIG.AsInteger)
        else if (PCDetalle.ActivePage = TSCliArt) then
           FMDetPromo.Filtra('PCA', DMPromocionesVenta.QMCliArtRIG.AsInteger);
     end;
     3:
     begin
        if (PCDetalle.ActivePage = TSAgrFam) then
           FMDetPromo.Filtra('PAF', DMPromocionesVenta.QMAgrFamRIG.AsInteger)
        else if (PCDetalle.ActivePage = TSAgrArt) then
           FMDetPromo.Filtra('PAA', DMPromocionesVenta.QMAgrArtRIG.AsInteger);
     end;
     4: FMDetPromo.Filtra('PAR', DMPromocionesVenta.QMArticuloRIG.AsInteger);
  end;
end;

procedure TFMPromocionesVenta.ADetPromoExecute(Sender: TObject);
begin
  VerDetalle;
end;

end.
