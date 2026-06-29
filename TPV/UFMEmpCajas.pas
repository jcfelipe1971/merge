unit UFMEmpCajas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, ActnList, StdCtrls,
  DBCtrls, Mask, UHYEdits, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxPlacemnt, ULFFormStorage, ULFActionList, NsDBGrid, ULFPageControl,
  ULFToolBar, ULFPanel, ULFDBEditFind2000, ULFDBEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, UG2kTBLoc, ULFEdit, ULFComboBox, ULFLabel;

type
  TFMEmpCajas = class(TFPEdit)
     LBTipo: TLabel;
     LBTitulo: TLabel;
     DBCHKActivo: TLFDBCheckBox;
     DBCaja: TLFDbedit;
     DBTitulo: TLFDbedit;
     DBEFAlmacen: TLFDBEditFind2000;
     LAlmacen: TLabel;
     AAjustaCajas: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PDetallle: TLFPanel;
     PCDetalle: TLFPageControl;
     TSUsuario: TTabSheet;
     TsFormPago: TTabSheet;
     LAgente: TLabel;
     TBUsuario: TLFToolBar;
     TBFormasPago: TLFToolBar;
     NavFP: THYMNavigator;
     DBFAgente: TDBEditFind2000;
     ETituloAgente: TLFEdit;
     LFConf: TLFPanel;
     GBPeticionUsuario: TGroupBox;
     RGAgente: TDBRadioGroup;
     ToolButton1: TToolButton;
     TButRecargarFP: TToolButton;
     ARecargarFP: TAction;
     DBCBTicketUsuario: TLFDBCheckBox;
     DBCBTicketClave: TLFDBCheckBox;
     NavUsuarios: THYMNavigator;
     LFDBCBProv: TLFDBCheckBox;
     CEUsuarios: TControlEdit;
     CEFormasPago: TControlEdit;
     CEUsuariosPMEdit: TPopUpTeclas;
     CEFormasPagoPMEdit: TPopUpTeclas;
     LFPDetalleUsuarios: TLFPanel;
     DBGUsuario: TDBGridFind2000;
     LFPDetalleFormas: TLFPanel;
     DBGFormasPago: TDBGridFind2000;
     LSerie: TLabel;
     DBESerie: TLFDbedit;
     PNLSerie: TLFPanel;
     LSerieVenta: TLFLabel;
     CBSerie: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AAjustaCajasExecute(Sender: TObject);
     procedure ARecargarFPExecute(Sender: TObject);
     procedure DBCBTicketUsuarioChange(Sender: TObject);
     procedure TsFormPagoShow(Sender: TObject);
     procedure TSUsuarioShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure DBFAgenteChange(Sender: TObject);
     procedure DBGUsuarioBusqueda(Sender: TObject);
     procedure CBSerieChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEmpCajas : TFMEmpCajas;

implementation

uses UDMEmpCajas, UFormGest, UDMMain, UEntorno, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMEmpCajas.FormCreate(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  AbreData(TDMEmpCajas, DMEmpCajas);
  NavMain.DataSource := DMEmpCajas.DSQMEmpCajas;
  DBGMain.DataSource := DMEmpCajas.DSQMEmpCajas;
  ControlEdit := CEMain;

  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;

  CBSerie.Enabled := (REntorno.SerieRestringida = '');

  RellenaSeries(CBSerie.Items);
  // Pongo la serie por defecto/restringida
  CBSerie.ItemIndex := 0;
  while ((Copy(CBSerie.Text, 1, Length(Serie)) + ' ') <> Serie + ' ') do
     CBSerie.ItemIndex := CBSerie.ItemIndex + 1;
  CBSerieChange(Self);
end;

procedure TFMEmpCajas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEmpCajas);
end;

procedure TFMEmpCajas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMEmpCajas.BusquedaCompleja;
end;

procedure TFMEmpCajas.AAjustaCajasExecute(Sender: TObject);
begin
  inherited;
  DMEmpCajas.AjustaCajas;
end;

procedure TFMEmpCajas.ARecargarFPExecute(Sender: TObject);
begin
  inherited;
  DMEmpCajas.RecargarFP;
end;

procedure TFMEmpCajas.DBCBTicketUsuarioChange(Sender: TObject);
begin
  inherited;
  if (DBCBTicketUsuario.Checked) then
     DBCBTicketClave.Enabled := True
  else
  begin
     DBCBTicketClave.Enabled := False;
     DBCBTicketClave.Checked := False;
  end;
end;

procedure TFMEmpCajas.TsFormPagoShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFormasPago;
end;

procedure TFMEmpCajas.TSUsuarioShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEUsuarios;
end;

procedure TFMEmpCajas.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMEmpCajas.DBFAgenteChange(Sender: TObject);
begin
  inherited;
  ETituloAgente.Text := DameTituloAgente(StrToIntDef(DBFAgente.Text, 0));
end;

procedure TFMEmpCajas.DBGUsuarioBusqueda(Sender: TObject);
begin
  inherited;
  with DBGUsuario do
  begin
     CondicionBusqueda := '';
     if Pos('VER_AGENTES', Trim(TablaABuscar)) > 0 then
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
  end;
end;

procedure TFMEmpCajas.CBSerieChange(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  if (CBSerie.ItemIndex = 0) then
     Serie := ''
  else
     Serie := Copy(CBSerie.Text, 1, Pos(' ', CBSerie.Text) - 1);
  DMEmpCajas.FiltraSerie(Serie);
end;

end.
