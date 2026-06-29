unit UFMSysCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, DBCtrls, StdCtrls,
  dbcgrids, Mask, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt,
  NsDBGrid, ULFDBCtrlGrid, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel,
  UG2kTBLoc;

type

  TFMSysCuentas = class(TFPEdit)
     PNLPaises: TLFPanel;
     LPGC: TLFLabel;
     PNLCabecera: TLFPanel;
     LCuenta: TLFLabel;
     LTitulo: TLFLabel;
     DBECuenta: TLFDbedit;
     DBETitulo: TLFDbedit;
     PTitSub: TLFPanel;
     LCabCuenta: TLFLabel;
     LCabTitulo: TLFLabel;
     LCabNivel: TLFLabel;
     LGestion: TLFLabel;
     DBETituloGestion: TLFDbedit;
     EFGestion: TLFDBEditFind2000;
     LTipoTercero: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     DBETipoTercero: TLFDbedit;
     DBLBPGC: TDBLookupComboBox;
     LFLSuperior: TLFLabel;
     LFDBESuperior: TLFDbedit;
     LFLNivel: TLFLabel;
     LFDBENIvel: TLFDbedit;
     LFLTipo: TLFLabel;
     LFDBETipo: TLFDbedit;
     DBRGRegCierre: TDBRadioGroup;
     NoScrollLFDBCtrlGrid1: TNoScrollLFDBCtrlGrid;
     DBExSuperior: TLFDbedit;
     DBExTitulo: TLFDbedit;
     DBExNivel: TLFDbedit;
     LFDBEPais: TLFDbedit;
     LPais: TLFLabel;
     DBGFCuentas: TDBGridFind2000;
     ALstGestion: TAction;
     AConfGestion: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     procedure EFGestionBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFCuentasDblClick(Sender: TObject);
     procedure DBGFCuentasBusqueda(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure ALstGestionExecute(Sender: TObject);
     procedure AConfGestionExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSysCuentas : TFMSysCuentas;

implementation

uses UDMSysCuentas, UDMMain, UFormGest, UEntorno, UDMLstSysCuentas, UFMListConfig, uUtiles;

{$R *.DFM}

procedure TFMSysCuentas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSysCuentas, DMSysCuentas);
  DBLBPGC.KeyValue := REntorno.PGC;
  NavMain.DataSource := DMSysCuentas.DSCuentas;

  // Color campo ID
  ColorCampoID(DBECuenta);
end;

procedure TFMSysCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSysCuentas);
end;

procedure TFMSysCuentas.EFGestionBusqueda(Sender: TObject);
begin
  inherited;
  EFGestion.CondicionBusqueda := 'PGC=' + DMSysCuentas.xPGCPGC.AsString;
end;

procedure TFMSysCuentas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMSysCuentas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMSysCuentas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbInsert]) then
     if (PCMain.ActivePage = TSFicha) then
     begin
        DBECuenta.Enabled := True;
        DBECuenta.SetFocus;
     end
     else if (PCMain.ActivePage = TSTabla) then
        DBGFCuentas.SetFocus;

  if (Button in [nbEdit]) then
     if (PCMain.ActivePage = TSFicha) then
     begin
        DBECuenta.Enabled := False;
        LFDBESuperior.SetFocus;
     end
     else if (PCMain.ActivePage = TSTabla) then
        DBGFCuentas.SetFocus;

  if (not (Button in [nbEdit, nbInsert])) then
  begin
     DBECuenta.Enabled := False;
  end;
end;

procedure TFMSysCuentas.DBGFCuentasDblClick(Sender: TObject);
begin
  inherited;
  TSFicha.Show;
end;

procedure TFMSysCuentas.DBGFCuentasBusqueda(Sender: TObject);
begin
  inherited;
  if (Trim(DBGFCuentas.TablaABuscar) = 'SYS_CUENTAS_GESTION') then
     DBGFCuentas.CondicionBusqueda := 'PGC=' + IntToStr(REntorno.Pgc)
  else
     DBGFCuentas.CondicionBusqueda := '';
end;

procedure TFMSysCuentas.TSTablaShow(Sender: TObject);
begin
  inherited;
  DBGFCuentas.SetFocus;
end;

procedure TFMSysCuentas.ALstGestionExecute(Sender: TObject);
begin
  AbreData(TDMLstSysCuentas, DMLstSysCuentas);
  DMLstSysCuentas.MostrarListado(DMSysCuentas.QMCuentasPGC.AsInteger, DMSysCuentas.QMCuentasPAIS.AsString);
  CierraData(DMLstSysCuentas);
end;

procedure TFMSysCuentas.AConfGestionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstSysCuentas, DMLstSysCuentas);
  TFMListConfig.Create(Self).Muestra(911, formato, cabecera, copias,
     pijama, '', DMLstSysCuentas.frGestiones);
  CierraData(DMLstSysCuentas);
end;

end.
