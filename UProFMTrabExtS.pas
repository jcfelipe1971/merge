unit UProFMTrabExtS;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls, ULFEdit, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, rxToolEdit, ULFDateEdit, UFPEditSimple,
  UNavigator, RXDBCtrl;

type
  TProFMTrabExtS = class(TFPEditSimple)
     LNPedido: TLFLabel;
     LFecha: TLFLabel;
     LProveedor: TLFLabel;
     LTratamiento: TLFLabel;
     LAlmacen: TLFLabel;
     ETituloProveedor: TLFEdit;
     ETituloArticulo: TLFEdit;
     ETituloAlmacenP: TLFEdit;
     EFProveedor: TDBEditFind2000;
     EFArticulo: TDBEditFind2000;
     EFAlmacenP: TDBEditFind2000;
     LAlmacenExterno: TLFLabel;
     EFAlmacenE: TDBEditFind2000;
     ETituloAlmacenE: TLFEdit;
     LUnidades: TLFLabel;
     LTipoOrientacion: TLFLabel;
     LTipoDocumento: TLFLabel;
     EFecha: TDBDateEdit;
     EFUnidades: TLFDBEdit;
     EFTipoOperacion: TLFDBEdit;
     EFTipoDoc: TLFDBEdit;
     EFIdDoc: TLFDBEdit;
     LCompuestoComponente: TLFLabel;
     DBEFCompuestoComponente: TDBEditFind2000;
     ECompuestoComponente: TLFEdit;
     LUnidadesCompuestoComponente: TLFLabel;
     DBEUnidadesCompuestoComponente: TLFDbedit;
     LPeso: TLFLabel;
     EPeso: TLFEdit;
     EStockAlmacenP: TLFEdit;
     EStockAlmacenE: TLFEdit;
     LCajas: TLFLabel;
     DBECajas: TLFDbedit;
     procedure EFProveedorChange(Sender: TObject);
     procedure EFAlmacenPChange(Sender: TObject);
     procedure EFAlmacenEChange(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFCompuestoComponenteChange(Sender: TObject);
     procedure DBEUnidadesCompuestoComponenteChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTrabExtS : TProFMTrabExtS;

implementation

uses UDMTareasExternas, UDMMain, UEntorno, UDameDato, UParam;

{$R *.dfm}

procedure TProFMTrabExtS.FormCreate(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs;
end;

procedure TProFMTrabExtS.EFProveedorChange(Sender: TObject);
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TProFMTrabExtS.EFAlmacenPChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenP.Text := DameTituloAlmacen(EFAlmacenP.Text);
  EStockAlmacenP.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, EFAlmacenP.Text));
end;

procedure TProFMTrabExtS.EFAlmacenEChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenE.Text := DameTituloAlmacen(EFAlmacenE.Text);
  EStockAlmacenE.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, EFAlmacenE.Text));
end;

procedure TProFMTrabExtS.EFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TProFMTrabExtS.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbPost, nbCancel]) then
     Close;
end;

procedure TProFMTrabExtS.DBEFCompuestoComponenteChange(Sender: TObject);
begin
  inherited;
  ECompuestoComponente.Text := DameTituloArticulo(DBEFCompuestoComponente.Text);
  EStockAlmacenP.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, EFAlmacenP.Text));
  EStockAlmacenE.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, EFAlmacenE.Text));
  EPeso.Text := FloatToStr(DMTareasExternas.DamePesoArticulo(DBEFCompuestoComponente.Text));
end;

procedure TProFMTrabExtS.DBEUnidadesCompuestoComponenteChange(Sender: TObject);
var
  UniCompuestoComponente, Peso, UniTotal, UniMaterialOrden, UniTratamiento : double;
  CompuestoComponente, TipoUnidad, Param_PROTEXC001 : string;
begin
  inherited;

  Param_PROTEXC001 := LeeParametro('PROTEXC001');
  CompuestoComponente := DBEFCompuestoComponente.Text;
  UniCompuestoComponente := StrToFloatDef(DBEUnidadesCompuestoComponente.Text, 0);

  if (Param_PROTEXC001 = 'S') then
  begin
     // Calculamos unidades según las unidades de la orden de producción
     UniTotal := DMTareasExternas.QMPro_Ord_Tarea_TexUNI_TOTAL.AsFloat;
     UniMaterialOrden := DMTareasExternas.DameUnidadesComponenteAsociado(EFArticulo.Text);
     UniTratamiento := (UniCompuestoComponente * UniMaterialOrden / UniTotal);
     EFUnidades.Text := FloatToStr(UniTratamiento);
  end
  else
  begin
     TipoUnidad := DMTareasExternas.DameTipoUnidadArticulo(CompuestoComponente);

     // Calculamos las unidades según el peso
     if (TipoUnidad = 'ML') then
     begin
        UniCompuestoComponente := UniCompuestoComponente * 1000; // Multiplicamos unidades a millares
        Peso := DMTareasExternas.DamePesoArticulo(CompuestoComponente);
        EFUnidades.Text := FloatToStr(UniCompuestoComponente * Peso);
     end;
  end;
end;

end.
