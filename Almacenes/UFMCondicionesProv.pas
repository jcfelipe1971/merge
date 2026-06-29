unit UFMCondicionesProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, UNavigator, ToolWin, UControlEdit, Menus,
  UTeclas, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, FIBEditFind, Grids, DBGrids, UHYDBGrid,
  UDBDateTimePicker, UFormGest, NsDBGrid, rxToolEdit, RXDBCtrl,
  ULFDBCheckBox, ULFDBEditFind2000, ULFPageControl, ULFPanel, ULFDBEdit,
  ULFToolBar, TFlatCheckBoxUnit, ULFCheckBox, ULFEditFind2000, ULFLabel,
  rxPlacemnt, ULFFormStorage, ULFDBDateEdit, UFPEditSinNavegador, ActnList,
  ULFActionList;

type
  TFMCondicionesProv = class(TFPEditSinNavegador)
     TSep1: TToolButton;
     PCMain: TLFPageControl;
     TSArticulos: TTabSheet;
     TSFamilias: TTabSheet;
     TBArticulos: TLFToolBar;
     PCArticulos: TLFPageControl;
     TSArt_Ficha: TTabSheet;
     TSArt_Tabla: TTabSheet;
     TBFamilias: TLFToolBar;
     PCFamilias: TLFPageControl;
     TSFam_Ficha: TTabSheet;
     TSFam_Tabla: TTabSheet;
     NavFamilias: THYMNavigator;
     NavArticulos: THYMNavigator;
     PNLFam_Ficha: TLFPanel;
     PNLArt_Ficha: TLFPanel;
     EFArticulo: TLFDBEditFind2000;
     DBENom_Articulo: TLFDbedit;
     DBEPrecio_Art: TLFDbedit;
     DBEDescuento_Art: TLFDbedit;
     DBDTPF_Alta_Art: TLFDBDateEdit;
     DBDTPF_Baja_Art: TLFDBDateEdit;
     DBCHKActivo_Art: TLFDBCheckBox;
     LBLArticulo: TLFLabel;
     LBLPrecio: TLFLabel;
     LBLDescuento_1: TLFLabel;
     LBLFAlta: TLFLabel;
     LBLFBaja: TLFLabel;
     HYTDBGArticulos: THYTDBGrid;
     EFFamilia: TLFDBEditFind2000;
     DBENom_Familia: TLFDbedit;
     DBEDescuento_Fam: TLFDbedit;
     DBDTPF_Alta_Fam: TLFDBDateEdit;
     DBDTPF_Baja_Fam: TLFDBDateEdit;
     DBCHKActivo_Fam: TLFDBCheckBox;
     LBLFamilia: TLFLabel;
     LBLDescuentoFam: TLFLabel;
     LBLFAltaFam: TLFLabel;
     LFechaBajaFamilia: TLFLabel;
     HYTDBGFamilias: THYTDBGrid;
     CEFamilias: TControlEdit;
     CEFamiliasPMEdit: TPopUpTeclas;
     DBCBBloqueado: TLFDBCheckBox;
     DBCHKBloqueado: TLFDBCheckBox;
     DBEDescuento_2: TLFDbedit;
     DBEDescuento_3: TLFDbedit;
     DBEDescuentoFam_2: TLFDbedit;
     DBEDescuentoFam_3: TLFDbedit;
     PNLProveedor: TLFPanel;
     LBLProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     DBENom_Prov: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFProveedorChange(Sender: TObject);
     procedure TSFamiliasShow(Sender: TObject);
     procedure TSArticulosShow(Sender: TObject);
     procedure HYTDBGFamiliasDblClick(Sender: TObject);
     procedure HYTDBGArticulosDblClick(Sender: TObject);
     procedure TSFam_TablaShow(Sender: TObject);
     procedure TSArt_TablaShow(Sender: TObject);
     procedure HYTDBGArticulosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure HYTDBGFamiliasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFFamiliaBusqueda(Sender: TObject);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure NavArticulosClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavFamiliasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCondicionesProv : TFMCondicionesProv;

implementation

uses UDMCondicionesProv, UDMMain, UEntorno;

{$R *.DFM}

procedure TFMCondicionesProv.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  CEMainPMEdit.Teclas := DMMain.Teclas;
  CEMain.Teclas := DMMain.Teclas;
  CEFamiliasPMEdit.Teclas := DMMain.Teclas;
  CEFamilias.Teclas := DMMain.Teclas;

  AbreData(TDMCondicionesProv, DMCondicionesProv);
  NavArticulos.DataSource := DMCondicionesProv.DSQMCondArticulos;
  NavFamilias.DataSource := DMCondicionesProv.DSQMCondFamilias;
  PCMain.ActivePage := TSArticulos;
end;

procedure TFMCondicionesProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCondicionesProv);
  FMCondicionesProv := nil;
  Action := caFree;
end;

procedure TFMCondicionesProv.EFProveedorChange(Sender: TObject);
begin
  DMCondicionesProv.FiltrarProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMCondicionesProv.TSFamiliasShow(Sender: TObject);
begin
  ControlEdit := CEFamilias;
end;

procedure TFMCondicionesProv.TSArticulosShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMCondicionesProv.HYTDBGFamiliasDblClick(Sender: TObject);
begin
  PCFAmilias.ActivePage := TSFam_Ficha;
end;

procedure TFMCondicionesProv.HYTDBGArticulosDblClick(Sender: TObject);
begin
  PCArticulos.ActivePage := TSArt_Ficha;
end;

procedure TFMCondicionesProv.TSFam_TablaShow(Sender: TObject);
begin
  HYTDBGFamilias.SetFocus;
end;

procedure TFMCondicionesProv.TSArt_TablaShow(Sender: TObject);
begin
  HYTDBGArticulos.SetFocus;
end;

procedure TFMCondicionesProv.HYTDBGArticulosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     PCArticulos.ActivePage := TSArt_Ficha;
end;

procedure TFMCondicionesProv.HYTDBGFamiliasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     PCFAmilias.ActivePage := TSFam_Ficha;
end;

procedure TFMCondicionesProv.EFFamiliaBusqueda(Sender: TObject);
begin
  EFFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesProv.EFArticuloBusqueda(Sender: TObject);
begin
  {EFArticulo.SelectSQL.Add (
    'select art.articulo,art.titulo from art_articulos art left join con_cuentas_ges_art gart on ' +
    '(art.articulo=gart.articulo)'); }
  EFArticulo.CondicionBusqueda :=
     'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr +
     ' AND CANAL=' + REntorno.CanalStr + ' AND FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesProv.NavArticulosClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbEdit then
  begin
     EFArticulo.Enabled := False;
     EFArticulo.Color := clInfoBk;
  end
  else
  begin
     EFArticulo.Enabled := True;
     EFArticulo.Color := clWindow;
  end;

  if Button = nbInsert then
  begin
     EFArticulo.Enabled := True;
     EFArticulo.Color := clWindow;
     EFArticulo.Font.Color := clWindowText;
  end
  else
  begin
     EFArticulo.Enabled := False;
     EFArticulo.Color := clInfoBk;
     EFArticulo.Font.Color := clGrayText;
  end;
end;

procedure TFMCondicionesProv.NavFamiliasClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbEdit then
  begin
     EFFamilia.Enabled := False;
     EFFamilia.Color := clInfoBk;
  end
  else
  begin
     EFFamilia.Enabled := True;
     EFFamilia.Color := clWindow;
  end;

  if Button = nbInsert then
  begin
     EFFamilia.Enabled := True;
     EFFamilia.Color := clWindow;
     EFFamilia.Font.Color := clWindowText;
  end
  else
  begin
     EFFamilia.Enabled := False;
     EFFamilia.Color := clInfoBk;
     EFFamilia.Font.Color := clGrayText;
  end;
end;

end.
