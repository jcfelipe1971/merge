unit UFMConfiguracionTPV;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, StdCtrls, ULFLabel,
  Mask, DBCtrls, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  ULFPageControl, UFormGest, DB, ULFEdit, UFPEditSimple, UNavigator,
  ULFEditFind2000;

type
  TFMConfiguracionTPV = class(TFPEditSimple)
     PCMain: TLFPageControl;
     TSConfiguracion: TTabSheet;
     DBCFacturarSesAuto: TLFDBCheckBox;
     DBCAgrupaTickets: TLFDBCheckBox;
     DBCImprimeRolloHacienda: TLFDBCheckBox;
     DBCObligaTicketDev: TLFDBCheckBox;
     DBCObligaArtEnDev: TLFDBCheckBox;
     DBCGeneraValeDev: TLFDBCheckBox;
     DBCObligaFPDev: TLFDBCheckBox;
     DBCDesplegaBusqVales: TLFDBCheckBox;
     DBCUsarMediosVales: TLFDBCheckBox;
     DBCUsarMediasEntregas: TLFDBCheckBox;
     DBCAutoGrabarCabTicket: TLFDBCheckBox;
     DBCFacPriorizaFP: TLFDBCheckBox;
     DBCFacPrioPorStock: TLFDBCheckBox;
     DBCFacPorImportes: TLFDBCheckBox;
     DBCFacPorLineas: TLFDBCheckBox;
     DBCRegulMovStock: TLFDBCheckBox;
     DBCObligaClienteConcretoEnPagos: TLFDBCheckBox;
     DBCPermiteTicketConValorCero: TLFDBCheckBox;
     DBEDiasCaducidadReservas: TLFDbedit;
     DBEDiasCaducidadVales: TLFDbedit;
     DBEDiasPropuestaPedido: TLFDbedit;
     LDiasCaducidadRemesa: TLFLabel;
     LDiasCaducidadVales: TLFLabel;
     LDiasPropuestaPedidos: TLFLabel;
     LFPPorDefecto: TLFLabel;
     LFPAbonos: TLFLabel;
     DBEFPPorDefecto: TLFDBEditFind2000;
     DBEFPAbonos: TLFDBEditFind2000;
     DBECliente: TLFDBEditFind2000;
     DBEControlStock: TLFDBEditFind2000;
     DBEAcreedor: TLFDBEditFind2000;
     DBECanalFraccion: TLFDBEditFind2000;
     LTituloCliente: TLFEdit;
     DBECuentaVales: TLFDbedit;
     DBELimiteFraccion: TLFDbedit;
     LCliente: TLFLabel;
     LControlStock: TLFLabel;
     LAcreedor: TLFLabel;
     LCanalFraccion: TLFLabel;
     LLimiteFraccion: TLFLabel;
     LTituloAcreedor: TLFEdit;
     LTituloCanal: TLFEdit;
     DBETituloControlStock: TLFDbedit;
     LCuentaVales: TLFLabel;
     PNLTitiSerie: TLFPanel;
     LSerie: TLFLabel;
     ETitSerie: TLFEdit;
     EFSerie: TLFEditFind2000;
     PEdit: TLFPanel;
     DBCControlaDisponibilidad: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEClienteChange(Sender: TObject);
     procedure DBEAcreedorChange(Sender: TObject);
     procedure DBECanalFraccionChange(Sender: TObject);
     procedure DBCAgrupaTicketsClick(Sender: TObject);
     procedure DBEControlStockBusqueda(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
  private
     { Private declarations }
     procedure HazVisible(Modo: integer);
  public
     { Public declarations }
  end;

var
  FMConfiguracionTPV : TFMConfiguracionTPV;

implementation

uses
  UDMConfiguracionTPV, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMConfiguracionTPV.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMConfiguracionTPV, DMConfiguracionTPV);

  NavMain.DataSource := DMConfiguracionTPV.DSQMConfiguracion;

  EFSerie.Text := REntorno.Serie;
  EFSerieChange(Sender);
end;

procedure TFMConfiguracionTPV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMConfiguracionTPV.Cancela;
  CierraData(DMConfiguracionTPV);
end;

procedure TFMConfiguracionTPV.DBEClienteChange(Sender: TObject);
begin
  inherited;
  LTituloCliente.Text := DameTituloCliente(StrToIntDef(DBECliente.Text, 0));
end;

procedure TFMConfiguracionTPV.DBEAcreedorChange(Sender: TObject);
begin
  inherited;
  LTituloAcreedor.Text := DameTituloAcreedor(StrToIntDef(DBEAcreedor.Text, 0));
end;

procedure TFMConfiguracionTPV.DBECanalFraccionChange(Sender: TObject);
begin
  inherited;
  LTituloCanal.Text := DameTituloCanal(StrToIntDef(DBECanalFraccion.Text, 0));
end;

procedure TFMConfiguracionTPV.DBCAgrupaTicketsClick(Sender: TObject);
begin
  inherited;
  if (DMConfiguracionTPV.Editando) then
     if DBCAgrupaTickets.Checked then
        HazVisible(1)
     else
        HazVisible(0);
end;

procedure TFMConfiguracionTPV.HazVisible(Modo: integer);
begin
  LLimiteFraccion.Visible := (Modo = 1);
  DBELimiteFraccion.Visible := (Modo = 1);
  if not (Modo = 1) then
     DMConfiguracionTPV.RestauraLimite;
end;

procedure TFMConfiguracionTPV.DBEControlStockBusqueda(Sender: TObject);
begin
  inherited;
  DBEControlStock.CondicionBusqueda := 'TIPO<>0';
end;

procedure TFMConfiguracionTPV.EFSerieChange(Sender: TObject);
begin
  inherited;
  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  DMConfiguracionTPV.FiltraSerie(EFSerie.Text);
  HazVisible(DMConfiguracionTPV.QMConfiguracionUNICA_FAC.AsInteger);
end;

end.
