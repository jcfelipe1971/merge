unit UProFMTrabExtE;

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
  TProFMTrabExtE = class(TFPEditSimple)
     Label7: TLFLabel;
     Label9: TLFLabel;
     LProveedor: TLFLabel;
     LArticulo: TLFLabel;
     LAlmacen: TLFLabel;
     ETituloProveedor: TLFEdit;
     ETituloArticulo: TLFEdit;
     ETituloAlmacenP: TLFEdit;
     EFProveedor: TDBEditFind2000;
     EFArticulo: TDBEditFind2000;
     DBEFAlmacenP: TDBEditFind2000;
     LFLabel1: TLFLabel;
     EFAlmacenE: TDBEditFind2000;
     ETituloAlmacenE: TLFEdit;
     LUnidadesCalculo: TLFLabel;
     TButtPeticion: TToolButton;
     TButtFinal: TToolButton;
     LFLabel3: TLFLabel;
     EFecha: TDBDateEdit;
     DBEUnidadesCalculo: TLFDbedit;
     EFTipoOperacion: TLFDBEdit;
     EFIdDoc: TLFDBEdit;
     LCompuestoComponente: TLFLabel;
     DBEFCompuestoComponente: TDBEditFind2000;
     ECompuestoComponente: TLFEdit;
     LKilos: TLFLabel;
     DBEKilos: TLFDbedit;
     LPeso: TLFLabel;
     EPeso: TLFEdit;
     EStockAlmacenP: TLFEdit;
     EStockAlmacenE: TLFEdit;
     DBEAlbaranProveedor: TLFDbedit;
     LAlbaranProveedor: TLFLabel;
     DBEUnidadesCompuestoComponente: TLFDbedit;
     LUnidadesCompuestoComponente: TLFLabel;
     procedure EFProveedorChange(Sender: TObject);
     procedure DBEFAlmacenPChange(Sender: TObject);
     procedure EFAlmacenEChange(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFCompuestoComponenteChange(Sender: TObject);
     procedure DBEKilosChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTrabExtE : TProFMTrabExtE;

implementation

uses UDMTareasExternas, UDMMain, UEntorno, UDameDato, UParam;

{$R *.dfm}

procedure TProFMTrabExtE.FormCreate(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs;
end;

procedure TProFMTrabExtE.EFProveedorChange(Sender: TObject);
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TProFMTrabExtE.DBEFAlmacenPChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenP.Text := DameTituloAlmacen(DBEFAlmacenP.Text);
  EStockAlmacenP.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, DBEFAlmacenP.Text));
end;

procedure TProFMTrabExtE.EFAlmacenEChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenE.Text := DameTituloAlmacen(EFAlmacenE.Text);
  EStockAlmacenE.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, EFAlmacenE.Text));
end;

procedure TProFMTrabExtE.EFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TProFMTrabExtE.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbPost, nbCancel]) then
     Close;
end;

procedure TProFMTrabExtE.DBEFCompuestoComponenteChange(Sender: TObject);
begin
  inherited;
  ECompuestoComponente.Text := DameTituloArticulo(DBEFCompuestoComponente.Text);
  EStockAlmacenE.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, EFAlmacenE.Text));
  EStockAlmacenP.Text := FloatToStr(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, DBEFCompuestoComponente.Text, DBEFAlmacenP.Text));
  EPeso.Text := FloatToStr(DMTareasExternas.DamePesoArticulo(DBEFCompuestoComponente.Text));
end;

procedure TProFMTrabExtE.DBEKilosChange(Sender: TObject);
var
  Param_PROTEXC001 : string;
  Kilos, Peso : double;
begin
  inherited;

  Param_PROTEXC001 := LeeParametro('PROTEXC001');
  if (Param_PROTEXC001 = 'S') then
  begin
     Kilos := StrToFloatDef(DBEKilos.Text, 0) * 1000;
     Peso := StrToFloatDef(EPeso.Text, 0);
     DBEUnidadesCompuestoComponente.Text := FloatToStr(Kilos * Peso);
  end;
end;

end.
