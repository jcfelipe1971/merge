unit UFMMonedaCuenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DBCtrls, Spin, UDBSpin, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel,
  UG2kTBLoc, ULFEdit;

type
  TFMMonedaCuenta = class(TFPEdit)
     LBLMoneda: TLFLabel;
     DBEMoneda: TLFDbedit;
     ETituloMoneda: TLFEdit;
     LBNegativa: TLFLabel;
     LBPositiva: TLFLabel;
     DBENegativa: TLFDBEditFind2000;
     DBEPositiva: TLFDBEditFind2000;
     ETituloCtaNegativa: TLFEdit;
     ETituloCtaPositiva: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEMonedaChange(Sender: TObject);
     procedure DBENegativaChange(Sender: TObject);
     procedure DBEPositivaChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMonedaCuenta : TFMMonedaCuenta;

implementation

uses UFormGest, UDMMonedaCuenta, UDMMain, uUtiles, UDameDato;

{$R *.DFM}

procedure TFMMonedaCuenta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMonedaCuenta, DMMonedaCuenta);
  DBGMain.DataSource := DMMonedaCuenta.DSQMMonedas;
  NavMain.DataSource := DMMonedaCuenta.DSQMMonedas;
  EPMain.DataSource := DMMonedaCuenta.DSQMMonedas;

  // Color campo ID
  ColorCampoID(DBEMoneda);
end;

procedure TFMMonedaCuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMonedaCuenta);
end;

procedure TFMMonedaCuenta.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMMonedaCuenta.BusquedaCompleja;
  Continua := False;
end;

procedure TFMMonedaCuenta.DBEMonedaChange(Sender: TObject);
begin
  inherited;
  ETituloMoneda.Text := DameTituloMoneda(DBEMoneda.Text);
end;

procedure TFMMonedaCuenta.DBENegativaChange(Sender: TObject);
begin
  inherited;
  ETituloCtaNegativa.Text := DameTituloCuenta(DBENegativa.Text);
end;

procedure TFMMonedaCuenta.DBEPositivaChange(Sender: TObject);
begin
  inherited;
  ETituloCtaPositiva.Text := DameTituloCuenta(DBEPositiva.Text);
end;

procedure TFMMonedaCuenta.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
