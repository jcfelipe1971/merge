unit UFMCondicionesCompra;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, UFIBDBEditfind, UFormGest, ExtCtrls,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, Grids, DBGrids, NsDBGrid,
  UEditPanel, Menus, rxPlacemnt, ActnList, UControlEdit, UNavigator, UTeclas,
  Buttons, UHYDBGrid, DB, ULFDBEdit, ULFEditFind2000,
  {Utiliza BtnClick del HYMNavigator} URecursos, ULFComboBox, ULFToolBar,
  ULFPanel, ULFActionList, ULFFormStorage, ULFPageControl, ULFLabel,
  ULFEdit, UFPEditSinNavegador;

type
  TFMCondicionesCompra = class(TFPEditSinNavegador)
     PCDetalle: TLFPageControl;
     TSCondProvArt: TTabSheet;
     TSCondProvFam: TTabSheet;
     TSCondProvAgrArt: TTabSheet;
     TBCondProvArt: TLFToolBar;
     TBCondProvFam: TLFToolBar;
     NavCondProvFam: THYMNavigator;
     TBCondProvAgrArt: TLFToolBar;
     NavCondProvAgrArt: THYMNavigator;
     DBGFCondProvAgrArt: TDBGridFind2000;
     NavCondProvArt: THYMNavigator;
     AL: TLFActionList;
     AProveedor: TAction;
     DBGFCondProvArt: TDBGridFind2000;
     DBGFCondProvFam: TDBGridFind2000;
     CAOtros: TLFCategoryAction;
     AEscalado: TAction;
     CAListados: TLFCategoryAction;
     AImprimir: TAction;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     ETitProv: TLFEdit;
     SBAProveedor: TSpeedButton;
     TSep1: TToolButton;
     CECondProArt: TControlEdit;
     CECondProArtPMEdit: TPopUpTeclas;
     CECondProvFam: TControlEdit;
     CECondProvFamPMEdit: TPopUpTeclas;
     CAResumido: TLFCategoryAction;
     ACCC: TAction;
     CECondProvFamGru: TControlEdit;
     CECondProvFamGruPMEdit: TPopUpTeclas;
     TSCondProvAg: TTabSheet;
     TBCondProvProvAgr: TLFToolBar;
     NavCondProvAgr: THYMNavigator;
     DBGFCondProvAgr: TDBGridFind2000;
     CECondProvAgrArt: TControlEdit;
     CECondProvAgrArtPMEdit: TPopUpTeclas;
     CECondProvAgr: TControlEdit;
     CECondProvAgrPMEdit: TPopUpTeclas;
     PCPrincipal: TLFPageControl;
     TSPorUnidades: TTabSheet;
     TSPorPrecio: TTabSheet;
     PCDetallePorPrecio: TLFPageControl;
     TSCondProvArtPorPrecio: TTabSheet;
     TBCondProvArtProPrecio: TLFToolBar;
     NavCondProvArtPorPrecio: THYMNavigator;
     DBGFCondProvArtPorPrecio: TDBGridFind2000;
     TSCondProvFamPorPrecio: TTabSheet;
     TBCondProvFamPorPrecio: TLFToolBar;
     NavCondProvFamPorPrecio: THYMNavigator;
     DBGFCondProvFamPorPrecio: TDBGridFind2000;
     TSCondProvAgrArtPorPrecio: TTabSheet;
     TBCondProvAgrArtPorPrecio: TLFToolBar;
     NavCondProvAgrArtPorPrecio: THYMNavigator;
     DBGFCondProvAgrArtPorPrecio: TDBGridFind2000;
     TSCondProvProvAgrPorPrecio: TTabSheet;
     TBCondProvProvAgrPorPrecio: TLFToolBar;
     NavCondProvAgrPorPrecio: THYMNavigator;
     DBGFCondProvAgrPorPrecio: TDBGridFind2000;
     CECondProArtPorPrecio: TControlEdit;
     CECondProArtPorPrecioPMEdit: TPopUpTeclas;
     CECondProvFamPorPrecio: TControlEdit;
     CECondProvFamPorPrecioPMEdit: TPopUpTeclas;
     CECondProvAgrArtPorPrecio: TControlEdit;
     CECondProvAgrArtPorPrecioPMEdit: TPopUpTeclas;
     CECondProvAgrPorPrecio: TControlEdit;
     CECondProvAgrPorPrecioPMEdit: TPopUpTeclas;
     PNLFiltroArticulo: TLFPanel;
     LFiltroArticulo: TLFLabel;
     EFFiltroArticulo: TLFEditFind2000;
     EFiltroArticulo: TLFEdit;
     PNLFiltroFamilia: TLFPanel;
     LFamilia: TLFLabel;
     EFFiltroFamilia: TLFEditFind2000;
     EFiltroFamilia: TLFEdit;
     PNLFiltroArticuloPorPrecio: TLFPanel;
     LFiltroArticuloPorPrecio: TLFLabel;
     EFFiltroArticuloPorPrecio: TLFEditFind2000;
     EFiltroArticuloPorPrecio: TLFEdit;
     PNLFiltraFamiliaPorPrecio: TLFPanel;
     LFiltraFamiliaPorPrecio: TLFLabel;
     EFFiltraFamiliaPorPrecio: TLFEditFind2000;
     EFiltraFamiliaPorPrecio: TLFEdit;
     ToolButton2: TToolButton;
     TButtEscaladoArticuloUnidades: TToolButton;
     ToolButton4: TToolButton;
     ToolButton3: TToolButton;
     TButtEscaladoArticuloPrecio: TToolButton;
     ToolButton6: TToolButton;
     ToolButton5: TToolButton;
     TButtEscaladoFamiliaUnidades: TToolButton;
     ToolButton8: TToolButton;
     ToolButton7: TToolButton;
     TButtEscaladoAgrupArtUnidades: TToolButton;
     ToolButton9: TToolButton;
     TButtEscaladoAgrupProvUnidades: TToolButton;
     ToolButton10: TToolButton;
     TButtEscaladoFamiliaPrecio: TToolButton;
     ToolButton12: TToolButton;
     ToolButton11: TToolButton;
     TButtEscaladoAgrupArtPrecio: TToolButton;
     ToolButton13: TToolButton;
     TButtEscaladoAgrupProvPrecio: TToolButton;
     AImportarExcel: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFProveedorChange(Sender: TObject);
     procedure AProveedorExecute(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure SBAProveedorDblClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFColEnter(Sender: TObject);
     procedure DBGFCondProvArtBusqueda(Sender: TObject);
     procedure DBGFCondProvAgrArtBusqueda(Sender: TObject);
     procedure DBGFCondProvFamBusqueda(Sender: TObject);
     procedure AEscaladoExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ACCCExecute(Sender: TObject);
     procedure TSCondProvArtShow(Sender: TObject);
     procedure TSCondProvFamShow(Sender: TObject);
     procedure TSCondProvAgrArtShow(Sender: TObject);
     procedure TSCondProvAgShow(Sender: TObject);
     procedure TSCondProvArtPorPrecioShow(Sender: TObject);
     procedure TSCondProvFamPorPrecioShow(Sender: TObject);
     procedure TSCondProvAgrArtPorPrecioShow(Sender: TObject);
     procedure TSCondProvProvAgrPorPrecioShow(Sender: TObject);
     procedure DBGFCondProvArtPorPrecioBusqueda(Sender: TObject);
     procedure DBGFCondProvFamPorPrecioBusqueda(Sender: TObject);
     procedure DBGFCondProvArtDblClick(Sender: TObject);
     procedure DBGFCondProvArtCellClick(Column: TColumn);
     procedure DBGFCondProvArtDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFFiltroArticuloChange(Sender: TObject);
     procedure EFFiltroFamiliaChange(Sender: TObject);
     procedure EFFiltroArticuloPorPrecioChange(Sender: TObject);
     procedure EFFiltraFamiliaPorPrecioChange(Sender: TObject);
     procedure AImportarExcelExecute(Sender: TObject);
  private
     { Private declarations }
     SWFil: integer;
     ColActual: TColumn;
     procedure HabilitaEnlaces;
     procedure Refrescar(Navegador: THYMNavigator);
     procedure VerEscalado(cod: integer);
     procedure Foco(Edicion: TEditFind2000);
     function elemento_PCDetalle: string;
  public
     { Public declarations }
  end;

var
  FMCondicionesCompra : TFMCondicionesCompra;

implementation

uses UEntorno, UDMMain, UFMain, UFMListConfig, UDMCondicionesCompra,
  UFMEscCondCom, UDMLstCondicionesCompra, UFPregCondicionesCompra, UUtiles, UDameDato, UFMImpConEspCompras;

{$R *.dfm}

function TFMCondicionesCompra.elemento_PCDetalle: string;
begin
  Result := EFProveedor.Text;
end;

procedure TFMCondicionesCompra.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMCondicionesCompra, DMCondicionesCompra);

  NavCondProvArt.DataSource := DMCondicionesCompra.DSQMCondProvArt;
  NavCondProvFam.DataSource := DMCondicionesCompra.DSQMCondProvFam;
  NavCondProvAgrArt.DataSource := DMCondicionesCompra.DSCondProvAgrArt;
  NavCondProvAgr.DataSource := DMCondicionesCompra.DSCondProvAgr;

  NavCondProvArtPorPrecio.DataSource := DMCondicionesCompra.DSQMCondProvArtPorPrecio;
  NavCondProvFamPorPrecio.DataSource := DMCondicionesCompra.DSQMCondProvFamPorPrecio;
  NavCondProvAgrArtPorPrecio.DataSource := DMCondicionesCompra.DSCondProvAgrArtPorPrecio;
  NavCondProvAgrPorPrecio.DataSource := DMCondicionesCompra.DSCondProvAgrPorPrecio;

  PCPrincipal.ActivePage := TSPorUnidades;
  PCDetalle.ActivePage := TSCondProvArt;
  PCDetallePorPrecio.ActivePage := TSCondProvArtPorPrecio;
  SWFil := 0;
  ColActual := DBGFCondProvArt.Columns[0];
  HabilitaEnlaces;
end;

procedure TFMCondicionesCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCondicionesCompra);
end;

procedure TFMCondicionesCompra.EFProveedorChange(Sender: TObject);
begin
  ETitProv.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
  DMCondicionesCompra.FiltrarProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMCondicionesCompra.AProveedorExecute(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AProveedores, 'Proveedor = ' + IntToStr(StrToIntDef(EFProveedor.Text, 0)));
end;

procedure TFMCondicionesCompra.VerEscalado(cod: integer);
begin
  if (cod > 0) then
  begin
     AbreForm(TFMEscCondCom, FMEscCondCom);

     if (PCPrincipal.ActivePage = TSPorUnidades) then
        case PCDetalle.ActivePageIndex of
           0: FMEscCondCom.Filtra('PRA', DMCondicionesCompra.QMCondProvArtRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
           1: FMEscCondCom.Filtra('PRF', DMCondicionesCompra.QMCondProvFamRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
           2: FMEscCondCom.Filtra('PRG', DMCondicionesCompra.QMCondProvAgrArtRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
           3: FMEscCondCom.Filtra('PRU', DMCondicionesCompra.QMCondProvAgrRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
        end
     else
        case PCDetallePorPrecio.ActivePageIndex of
           0: FMEscCondCom.Filtra('PRA', DMCondicionesCompra.QMCondProvArtPorPrecioRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
           1: FMEscCondCom.Filtra('PRF', DMCondicionesCompra.QMCondProvFamPorPrecioRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
           2: FMEscCondCom.Filtra('PRG', DMCondicionesCompra.QMCondProvAgrArtPorPrecioRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
           3: FMEscCondCom.Filtra('PRU', DMCondicionesCompra.QMCondProvAgrPorPrecioRIG.AsInteger, PCPrincipal.ActivePage = TSPorPrecio);
        end;
  end;
end;

procedure TFMCondicionesCompra.SBAProveedorDblClick(Sender: TObject);
begin
  AProveedor.Execute();
end;

procedure TFMCondicionesCompra.Refrescar(Navegador: THYMNavigator);
begin
  Navegador.BtnClick(nbRefresh); // necesita URecursos
end;

// Activar enlaces
procedure TFMCondicionesCompra.HabilitaEnlaces;
begin
  if (FMain.AProveedores.Enabled = False) then
     SBAProveedor.Width := 0
  else
  begin
     SolapaControles(SBAProveedor, ETitProv);
     ETitProv.Color := REntorno.ColorEnlaceActivo;
  end;
end;

procedure TFMCondicionesCompra.Foco(Edicion: TEditFind2000);
begin
  Edicion.ClassParent;
  Edicion.SetFocus;
end;

procedure TFMCondicionesCompra.FormActivate(Sender: TObject);
begin
  inherited;
  if (PCPrincipal.ActivePage = TSPorUnidades) then
     case (PCDetalle.ActivePageIndex) of
        0: Refrescar(NavCondProvArt);
        1: Refrescar(NavCondProvFam);
        2: Refrescar(NavCondProvAgrArt);
        3: Refrescar(NavCondProvAgr);
     end
  else
     case (PCDetallePorPrecio.ActivePageIndex) of
        0: Refrescar(NavCondProvArtPorPrecio);
        1: Refrescar(NavCondProvFamPorPrecio);
        2: Refrescar(NavCondProvAgrArtPorPrecio);
        3: Refrescar(NavCondProvAgrPorPrecio);
     end;
  Foco(EFProveedor);
end;

// Asigna el ControlEdit correspondiente
procedure TFMCondicionesCompra.DBGFColEnter(Sender: TObject);
var
  DBGF : TDBGridFind2000;
  i : integer;
  Nav : THYMNavigator;
  Nombre : string;
begin
  DBGF := TDBGridFind2000(Sender);
  Nombre := DBGF.Name;
  for i := 0 to (ComponentCount - 1) do
     if Components[i] is THYMNavigator then
     begin
        Nav := THYMNavigator(Components[i]);
        if Nav.EditaControl.Name = Nombre then
           ControlEdit := Nav.ControlEdit;
     end;
end;

procedure TFMCondicionesCompra.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  if ((EFProveedor.Text = '') or (ETitProv.Text = '')) then
  begin
     MessageDlg(_('Debe especificar antes un Proveedor'), mtWarning, [mbOK], 0);
     EFProveedor.SetFocus;
     Continua := False;
  end
  else
  if (PCPrincipal.ActivePage = TSPorUnidades) then
     case (PCDetalle.ActivePageIndex) of
        0: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvArt,
              'PRA') in [mrOk, mrAll]) then
              SWFil := 1;
        1: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvFam,
              'PRF') in [mrOk, mrAll]) then
              SWFil := 1;
        2: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvAgrArt,
              'PRG') in [mrOk, mrAll]) then
              SWFil := 1;
        3: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvAgrArt,
              'PRU') in [mrOk, mrAll]) then
              SWFil := 1;
     end
  else
     case (PCDetallePorPrecio.ActivePageIndex) of
        0: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvArtPorPrecio,
              'PRA') in [mrOk, mrAll]) then
              SWFil := 1;
        1: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvFamPorPrecio,
              'PRF') in [mrOk, mrAll]) then
              SWFil := 1;
        2: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvAgrArtPorPrecio,
              'PRG') in [mrOk, mrAll]) then
              SWFil := 1;
        3: if (DMCondicionesCompra.BusquedaCompleja(DMCondicionesCompra.QMCondProvAgrArtPorPrecio,
              'PRU') in [mrOk, mrAll]) then
              SWFil := 1;
     end;
  Continua := False;
end;

procedure TFMCondicionesCompra.DBGFCondProvArtBusqueda(Sender: TObject);
begin
  DBGFCondProvArt.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesCompra.DBGFCondProvAgrArtBusqueda(Sender: TObject);
begin
  DBGFCondProvAgrArt.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesCompra.DBGFCondProvFamBusqueda(Sender: TObject);
begin
  DBGFCondProvFam.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesCompra.AEscaladoExecute(Sender: TObject);
var
  cod : integer;
begin
  cod := 0;
  if (PCPrincipal.ActivePage = TSPorUnidades) then
     case PCDetalle.ActivePageIndex of
        0: cod := DMCondicionesCompra.QMCondProvArtRIG.AsInteger;
        1: cod := DMCondicionesCompra.QMCondProvFamRIG.AsInteger;
        2: cod := DMCondicionesCompra.QMCondProvAgrArtRIG.AsInteger;
        3: cod := DMCondicionesCompra.QMCondProvAgrRIG.AsInteger;
     end
  else
     case PCDetallePorPrecio.ActivePageIndex of
        0: cod := DMCondicionesCompra.QMCondProvArtPorPrecioRIG.AsInteger;
        1: cod := DMCondicionesCompra.QMCondProvFamPorPrecioRIG.AsInteger;
        2: cod := DMCondicionesCompra.QMCondProvAgrArtPorPrecioRIG.AsInteger;
        3: cod := DMCondicionesCompra.QMCondProvAgrPorPrecioRIG.AsInteger;
     end;
  VerEscalado(cod);
end;

procedure TFMCondicionesCompra.AImprimirExecute(Sender: TObject);
begin
  AbreData(TDMlstCondicionesCompra, DMlstCondicionesCompra);

  AbreForm(TFPregCondicionesCompra, FPregCondicionesCompra, Sender);
  FPregCondicionesCompra.Heredar(elemento_PCDetalle);

  CierraData(DMLstCondicionesCompra);
end;

procedure TFMCondicionesCompra.ACCCExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstCondicionesCompra, DMLstCondicionesCompra);
  TFMListConfig.Create(Self).Muestra(161, formato, cabecera, copias,
     pijama, '', DMLstCondicionesCompra.frCondicionesCompras,
     DMLstCondicionesCompra.HYReport);
  CierraData(DMLstCondicionesCompra);
end;

procedure TFMCondicionesCompra.TSCondProvArtShow(Sender: TObject);
begin
  ControlEdit := CECondProArt;
end;

procedure TFMCondicionesCompra.TSCondProvFamShow(Sender: TObject);
begin
  ControlEdit := CECondProvFam;
end;

procedure TFMCondicionesCompra.TSCondProvAgrArtShow(Sender: TObject);
begin
  ControlEdit := CECondProvAgrArt;
end;

procedure TFMCondicionesCompra.TSCondProvAgShow(Sender: TObject);
begin
  ControlEdit := CECondProvAgr;
end;

procedure TFMCondicionesCompra.TSCondProvArtPorPrecioShow(Sender: TObject);
begin
  ControlEdit := CECondProArtPorPrecio;
end;

procedure TFMCondicionesCompra.TSCondProvFamPorPrecioShow(Sender: TObject);
begin
  ControlEdit := CECondProvFamPorPrecio;
end;

procedure TFMCondicionesCompra.TSCondProvAgrArtPorPrecioShow(Sender: TObject);
begin
  ControlEdit := CECondProvAgrArtPorPrecio;
end;

procedure TFMCondicionesCompra.TSCondProvProvAgrPorPrecioShow(Sender: TObject);
begin
  ControlEdit := CECondProvAgrPorPrecio;
end;

procedure TFMCondicionesCompra.DBGFCondProvArtPorPrecioBusqueda(Sender: TObject);
begin
  DBGFCondProvArtPorPrecio.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesCompra.DBGFCondProvFamPorPrecioBusqueda(Sender: TObject);
begin
  DBGFCondProvFamPorPrecio.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesCompra.DBGFCondProvArtDblClick(Sender: TObject);
begin
  if DMCondicionesCompra.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
        FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMCondicionesCompra.QMCondProvArtARTICULO.AsString + '''');
  end;
end;

procedure TFMCondicionesCompra.DBGFCondProvArtCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMCondicionesCompra.DBGFCondProvArtDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMCondicionesCompra.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(DBGFCondProvArt, Rect);
  end;
  DBGFCondProvArt.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMCondicionesCompra.EFFiltroArticuloChange(Sender: TObject);
begin
  EFiltroArticulo.Text := DameTituloArticulo(EFFiltroArticulo.Text);
  DMCondicionesCompra.PosicionaArticulo(EFFiltroArticulo.Text);
end;

procedure TFMCondicionesCompra.EFFiltroFamiliaChange(Sender: TObject);
begin
  EFiltroFamilia.Text := DameTituloFamilia(EFFiltroFamilia.Text);
  DMCondicionesCompra.PosicionaFamilia(EFFiltroFamilia.Text);
end;

procedure TFMCondicionesCompra.EFFiltroArticuloPorPrecioChange(Sender: TObject);
begin
  EFiltroArticulo.Text := DameTituloArticulo(EFFiltroArticulo.Text);
  DMCondicionesCompra.PosicionaArticuloPorPrecio(EFFiltroArticulo.Text);
end;

procedure TFMCondicionesCompra.EFFiltraFamiliaPorPrecioChange(Sender: TObject);
begin
  EFiltroFamilia.Text := DameTituloFamilia(EFFiltroFamilia.Text);
  DMCondicionesCompra.PosicionaFamiliaPorPrecio(EFFiltroFamilia.Text);
end;

procedure TFMCondicionesCompra.AImportarExcelExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMImpConEspCompras, FMImpConEspCompras, Sender);
end;

end.
