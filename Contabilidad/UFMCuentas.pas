unit UFMCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dbcgrids, Mask, DBCtrls, StdCtrls, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, URecursos, UFPEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid, ULFComboBox,
  ULFDBCtrlGrid, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMCuentas = class(TFPEdit)
     CBFiltra: TLFComboBox;
     LBLCuenta: TLFLabel;
     DBECuenta: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCGNiveles: TLFDBCtrlGrid;
     DBExSuperior: TLFDbedit;
     DBExTitulo: TLFDbedit;
     DBExNivel: TLFDbedit;
     TButtSeparador2: TToolButton;
     PTitSub: TLFPanel;
     LBLTitCuenta: TLFLabel;
     LBLtitTitulo: TLFLabel;
     LBLTitNivel: TLFLabel;
     LBLNivel: TLFLabel;
     DBRGRegCierre: TDBRadioGroup;
     LBLGestion: TLFLabel;
     DBEEFGestion: TLFDBEditFind2000;
     DBCBCentroDeCoste: TLFDBCheckBox;
     DBCBRestriccion: TLFDBCheckBox;
     TSCC: TTabSheet;
     TBCentroCoste: TLFToolBar;
     NavCuentas: THYMNavigator;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     CECC: TControlEdit;
     CECCPMEdit: TPopUpTeclas;
     DBGFCuentas: TDBGridFind2000;
     LBDBCuenta: TLFDbedit;
     DBCBBloqueada: TLFDBCheckBox;
     DBCBPresupuestar: TLFDBCheckBox;
     DBCBCuadroDeMandos: TLFDBCheckBox;
     LConcepto: TLFLabel;
     DBEConcepto: TLFDbedit;
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBECuentaExit(Sender: TObject);
     procedure CBFiltraChange(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEEFGestionBusqueda(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
  end;

var
  FMCuentas : TFMCuentas;

implementation

uses UDMCuentas, UFormGest, UDMMain, UUtiles, UEntorno, UFCCuentas, UFMain;

{$R *.DFM}

procedure TFMCuentas.FormCreate(Sender: TObject);
begin
  inherited;
  DBECuenta.MaxLength := REntorno.DigitosSub;
  CBFiltra.Items := TSLNiveles;
  CBFiltra.ItemIndex := 0;

  AbreData(TDMCuentas, DMCuentas);

  NavMain.DataSource := DMCuentas.DSQMCuentas;
  DBGMain.DataSource := DMCuentas.DSQMCuentas;

  FMain.AddComponentePunto(DBECuenta);
  TSCC.TabVisible := DMMain.PuedeHacerImputaciones;

  {dji lrk kri - Contabilidad Restringida}
  DBCBRestriccion.Visible := True;
  if REntorno.ContabilidadRestringida then
     DBCBRestriccion.Visible := False;
end;

procedure TFMCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(DBECuenta);
  CierraData(DMCuentas);
end;

procedure TFMCuentas.DBECuentaExit(Sender: TObject);
begin
  DBECuenta.Text := ExpandirCadena(DBECuenta.Text, REntorno.DigitosSub);
end;

procedure TFMCuentas.CBFiltraChange(Sender: TObject);
begin
  DBECuenta.MaxLength := REntorno.DigitAcumula[CBFiltra.ItemIndex];
end;

procedure TFMCuentas.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  Continua := True;
  if ((Button = nbInsert) and (CBFiltra.ItemIndex = 0)) then
  begin
     ShowMessage(_('No se puede añadir una cuenta sin nivel'));
     Continua := False;
  end;
end;

procedure TFMCuentas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMCuentas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCuentas.DBEEFGestionBusqueda(Sender: TObject);
begin
  DBEEFGestion.CondicionBusqueda := 'PAIS=''' + REntorno.Pais + '''';
end;

procedure TFMCuentas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMCuentas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbEdit) then
  begin
     DBECuenta.Enabled := False;
     DBECuenta.Color := clInfoBk;
  end
  else
  begin
     DBECuenta.Enabled := True;
     DBECuenta.Color := clWindow;
  end;
end;

procedure TFMCuentas.FormShow(Sender: TObject);
begin
  inherited;
  if (REntorno.Pais = 'CHL') then
  begin
     DBEConcepto.Visible := True;
     DBETipo.Visible := True;
     LConcepto.Visible := True;
     LTipo.Visible := True;

     DBRGRegCierre.Top := 96;
     DBRGRegCierre.Height := 41;
  end
  else
  begin
     DBEConcepto.Visible := False;
     DBETipo.Visible := False;
     LConcepto.Visible := False;
     LTipo.Visible := False;

     DBRGRegCierre.Top := 52;
     DBRGRegCierre.Height := 77;
  end;
end;

end.
