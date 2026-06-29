unit UFMMonedas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DBCtrls, Spin, UDBSpin, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, DbComboBoxValue, rxPlacemnt, NsDBGrid, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFLabel, UG2kTBLoc, ULFDBEditFind2000,
  ULFEdit;

type
  TFMMonedas = class(TFPEdit)
     LBLMoneda: TLFLabel;
     LBLNombre: TLFLabel;
     LBLClave: TLFLabel;
     LBLDecVer: TLFLabel;
     LBLDecCalc: TLFLabel;
     DBEMoneda: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEClave: TLFDbedit;
     DBSEDecVer: TDBSpinEdit;
     DBCHKDefecto: TLFDBCheckBox;
     DBSEDecCal: TDBSpinEdit;
     DBCBVGenero: TDBComboBoxValue;
     LBLGenero: TLFLabel;
     TSIdiomas: TTabSheet;
     PNIdioma: TLFPanel;
     LFToolBar1: TLFToolBar;
     PNIdiomas: TLFPanel;
     CEIdiomas: TControlEdit;
     CEIdiomasPMEdit: TPopUpTeclas;
     NavIdiomas: THYMNavigator;
     DBEMonea: TLFDbedit;
     ToolButton1: TToolButton;
     DBGFIdiomas: TDBGridFind2000;
     LFDescDecimales: TLFDbedit;
     LBLDescDecimales: TLFLabel;
     DBEVentas: TLFDBEditFind2000;
     DBECompras: TLFDBEditFind2000;
     LBLVentas: TLFLabel;
     LBLCompras: TLFLabel;
     LBLCli: TLFLabel;
     LFDBECli: TLFDBEditFind2000;
     LFDBEPro: TLFDBEditFind2000;
     LBLProv: TLFLabel;
     ETituloCuentaVentas: TLFEdit;
     ETituloCuentaCompras: TLFEdit;
     ETituloCuentaClientes: TLFEdit;
     ETituloCuentaProveedores: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFIdiomasBusqueda(Sender: TObject);
     procedure TSIdiomasShow(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEVentasChange(Sender: TObject);
     procedure DBEComprasChange(Sender: TObject);
     procedure LFDBECliChange(Sender: TObject);
     procedure LFDBEProChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMonedas : TFMMonedas;

implementation

uses UFormGest, UDMMonedas, UDMMain, UEntorno, UDameDato;

{$R *.DFM}

procedure TFMMonedas.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;

  AbreData(TDMMonedas, DMMonedas);
  CEMainPMEdit.Teclas := DMMain.Teclas;
  NavMain.DataSource := DMMonedas.DSQMMonedas;
  DBGMain.DataSource := DMMonedas.DSQMMonedas;
  if (REntorno.Pais <> 'DOM') then
  begin
     LBLVentas.Visible := False;
     LBLCompras.Visible := False;
     LBLCli.Visible := False;
     LBLProv.Visible := False;
     DBEVentas.Visible := False;
     DBECompras.Visible := False;
     LFDBECli.Visible := False;
     LFDBEPro.Visible := False;
     ETituloCuentaVentas.Visible := False;
     ETituloCuentaCompras.Visible := False;
     ETituloCuentaClientes.Visible := False;
     ETituloCuentaProveedores.Visible := False;

     // Bajo todos los componentes para centrarlos en la ventana
     with PEdit do
        for i := 0 to ControlCount - 1 do
           Controls[i].Top := Controls[i].Top + 40;
  end;
end;

procedure TFMMonedas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMonedas);
end;

procedure TFMMonedas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMMonedas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMMonedas.DBGFIdiomasBusqueda(Sender: TObject);
begin
  inherited;
  if Pos('SYS_IDIOMAS', Trim(DBGFIdiomas.TablaABuscar)) > 0 then
  begin
     DBGFIdiomas.CondicionBusqueda := 'DEFECTO <> 1';
  end;
end;

procedure TFMMonedas.TSIdiomasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEIdiomas;
  DBGFIdiomas.SetFocus;
end;

procedure TFMMonedas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMMonedas.DBEVentasChange(Sender: TObject);
begin
  inherited;
  ETituloCuentaVentas.Text := DameTituloCuenta(DBEVentas.Text);
end;

procedure TFMMonedas.DBEComprasChange(Sender: TObject);
begin
  inherited;
  ETituloCuentaCompras.Text := DameTituloCuenta(DBECompras.Text);
end;

procedure TFMMonedas.LFDBECliChange(Sender: TObject);
begin
  inherited;
  ETituloCuentaClientes.Text := DameTituloCuenta(LFDBECli.Text);
end;

procedure TFMMonedas.LFDBEProChange(Sender: TObject);
begin
  inherited;
  ETituloCuentaProveedores.Text := DameTituloCuenta(LFDBEPro.Text);
end;

end.
