unit UFMGrupoCuentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMGrupoCuentas = class(TFPEdit)
     LBLGrupoCuentas: TLFLabel;
     DBEGrupoCuentas: TLFDbedit;
     LBLTtulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLCtaCompras: TLFLabel;
     DBEFCtaCompras: TLFDBEditFind2000;
     ETituloCtaCompras: TLFEdit;
     LBLCtaDevCompras: TLFLabel;
     DBEFCtaDevCompras: TLFDBEditFind2000;
     ETituloCtaDevCompras: TLFEdit;
     LBLCtaDevVentas: TLFLabel;
     LBLCtaVentas: TLFLabel;
     DBEFCtaVentas: TLFDBEditFind2000;
     DBEFCtaDevVentas: TLFDBEditFind2000;
     ETituloCtaDevVentas: TLFEdit;
     ETituloCtaVentas: TLFEdit;
     LBLCtaAbonoCompras: TLFLabel;
     DBEFCtaAbonoCompras: TLFDBEditFind2000;
     ETituloCtaAbonoCompras: TLFEdit;
     LBLCtaAbonoVentas: TLFLabel;
     DBEFCtaAbonoVentas: TLFDBEditFind2000;
     ETituloCtaAbonoVentas: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFCtaComprasChange(Sender: TObject);
     procedure DBEFCtaDevComprasChange(Sender: TObject);
     procedure DBEFCtaVentasChange(Sender: TObject);
     procedure DBEFCtaDevVentasChange(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFCtaAbonoComprasChange(Sender: TObject);
     procedure DBEFCtaAbonoVentasChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGrupoCuentas : TFMGrupoCuentas;

implementation

uses UDMGrupoCuentas, UDMMain, UFormGest, UDameDato;

{$R *.dfm}

procedure TFMGrupoCuentas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGrupoCuentas, DMGrupoCuentas);
  CEMainPMEdit.Teclas := DMMain.Teclas;
  NavMain.DataSource := DMGrupoCuentas.DSQMGrupoCuentas;
  DBGMain.DataSource := DMGrupoCuentas.DSQMGrupoCuentas;
end;

procedure TFMGrupoCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGrupoCuentas);
end;

procedure TFMGrupoCuentas.DBEFCtaComprasChange(Sender: TObject);
begin
  inherited;
  ETituloCtaCompras.Text := DameTituloCuenta(DBEFCtaCompras.Text);
end;

procedure TFMGrupoCuentas.DBEFCtaDevComprasChange(Sender: TObject);
begin
  inherited;
  ETituloCtaDevCompras.Text := DameTituloCuenta(DBEFCtaDevCompras.Text);
end;

procedure TFMGrupoCuentas.DBEFCtaVentasChange(Sender: TObject);
begin
  inherited;
  ETituloCtaVentas.Text := DameTituloCuenta(DBEFCtaVentas.Text);
end;

procedure TFMGrupoCuentas.DBEFCtaDevVentasChange(Sender: TObject);
begin
  inherited;
  ETituloCtaDevVentas.Text := DameTituloCuenta(DBEFCtaDevVentas.Text);
end;

procedure TFMGrupoCuentas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     DBEGrupoCuentas.Enabled := False;
     DBEGrupoCuentas.Color := clInfoBk;
  end
  else
  begin
     DBEGrupoCuentas.Enabled := True;
     DBEGrupoCuentas.Color := clWindow;
  end;
end;

procedure TFMGrupoCuentas.DBEFCtaAbonoComprasChange(Sender: TObject);
begin
  inherited;
  ETituloCtaAbonoCompras.Text := DameTituloCuenta(DBEFCtaAbonoCompras.Text);
end;

procedure TFMGrupoCuentas.DBEFCtaAbonoVentasChange(Sender: TObject);
begin
  inherited;
  ETituloCtaAbonoVentas.Text := DameTituloCuenta(DBEFCtaAbonoVentas.Text);
end;

procedure TFMGrupoCuentas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
