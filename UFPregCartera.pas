unit UFPregCartera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ComCtrls, ToolWin, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ActnList, ExtCtrls, UControlEdit, rxToolEdit,
  ULFActionList, ULFCheckBox, ULFPanel, ULFDBEdit, ULFComboBox,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, ULFDateEdit,
  ULFEdit, UFPEditListado, rxPlacemnt, ULFFormStorage;

type
  TFPregCartera = class(TFPEditListado)
     TSPagos: TTabSheet;
     TSCobros: TTabSheet;
     PCCobros: TLFPageControl;
     TSClientes: TTabSheet;
     TSAgentes: TTabSheet;
     PNClientes: TLFPanel;
     GBFechasVencimiento: TGroupBox;
     LBLDesdeVencimiento: TLFLabel;
     LBLHastaVencimiento: TLFLabel;
     DTPFechaDesdeVencimiento: TLFDateEdit;
     DTPFechaHastaVencimiento: TLFDateEdit;
     GBTitulo: TGroupBox;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EFCliDesde: TLFEditFind2000;
     EFCliHasta: TLFEditFind2000;
     GBAgente: TGroupBox;
     LDesdeAgente: TLFLabel;
     EFAgente: TLFEditFind2000;
     CHKCuentas: TLFCheckBox;
     CHKCuentasAgente: TLFCheckBox;
     GBEstadoAgente: TGroupBox;
     PCPAGOS: TLFPageControl;
     TSProveedores: TTabSheet;
     TSAcreedores: TTabSheet;
     LDesdeProveedor: TLFLabel;
     LHastaProveedor: TLFLabel;
     EFProvDesde: TLFEditFind2000;
     EFProvHasta: TLFEditFind2000;
     LDesdeAcreedor: TLFLabel;
     LHastaAcreedor: TLFLabel;
     EFAcrDesde: TLFEditFind2000;
     EFAcrHasta: TLFEditFind2000;
     DBEProvDesde: TLFEdit;
     DBEProvHasta: TLFEdit;
     DBEAgenteDesde: TLFEdit;
     DBECliDesde: TLFEdit;
     DBECliHasta: TLFEdit;
     DBEAcrDesde: TLFEdit;
     DBEAcrHasta: TLFEdit;
     CBRecibido: TLFComboBox;
     LBLRecibido: TLFLabel;
     CBAceptar: TLFComboBox;
     LBLAceptar: TLFLabel;
     TButtConfRapida: TToolButton;
     LMoneda: TLFLabel;
     DBLCBMoneda: TDBLookupComboBox;
     PNEstado: TLFPanel;
     LFCBCobrado: TLFCheckBox;
     LFCBNormal: TLFCheckBox;
     LFCBImpagado: TLFCheckBox;
     LFCBRemesado: TLFCheckBox;
     LFCBPagConta: TLFCheckBox;
     PNLComun: TLFPanel;
     RGOrden: TRadioGroup;
     GBFechasFactura: TGroupBox;
     LBLDesdeFactura: TLFLabel;
     LBLHastaFactura: TLFLabel;
     DTPFechaDesdeFactura: TLFDateEdit;
     DTPFechaHastaFactura: TLFDateEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFProvHastaChange(Sender: TObject);
     procedure EFProvDesdeChange(Sender: TObject);
     procedure EFCliHastaChange(Sender: TObject);
     procedure EFCliDesdeChange(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure EFAcrDesdeChange(Sender: TObject);
     procedure EFAcrHastaChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
  private
     { Private declarations }
     function DameRecibido(rec: integer): integer;
     function DameAceptar(acep: integer): integer;
     procedure LanzaListado(Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregCartera : TFPregCartera;

implementation

uses UDMLstCartera, UDMMain, UFormGest, UUtiles, UFMListConfig, UEntorno, UDameDato;

{$R *.DFM}

procedure TFPregCartera.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLSTCartera, DMLSTCartera);
  ARecargar.Execute;
  PCCobros.ActivePage := TSClientes;
  PCPagos.ActivePage := TSProveedores;
  PCMain.ActivePage := TSCobros;
  CBRecibido.ItemIndex := 0;
  CBAceptar.ItemIndex := 0;

  Grupo := 28;
  Listado := DMLSTCartera.frRecibos;
  ListadoFR3 := DMLSTCartera.frxRecibos;
end;

procedure TFPregCartera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstCartera);
  Action := caFree;
end;

procedure TFPregCartera.ARecargarExecute(Sender: TObject);
begin
  DMLstCartera.Recargar;
  DTPFechaDesdeVencimiento.Date := DMLstCartera.DesdeFecha;
  DTPFechaHastaVencimiento.Date := DMLstCartera.HastaFecha;
  DTPFechaDesdeFactura.Date := EncodeDate(REntorno.Ejercicio, 1, 1);
  DTPFechaHastaFactura.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  EFProvDesde.Text := DMLstCartera.ProvMin;
  EFProvHasta.Text := DMLstCartera.ProvMax;
  EFAcrDesde.Text := DMLstCartera.AcrMin;
  EFAcrHasta.Text := DMLstCartera.AcrMax;
  EFCliDesde.Text := DMLstCartera.CliMin;
  EFCliHasta.Text := DMLstCartera.CliMax;
  EFAgente.Text := DMLstCartera.Agente;
  DBLCBMoneda.KeyValue := REntorno.Moneda;
end;

procedure TFPregCartera.EFProvDesdeChange(Sender: TObject);
begin
  DBEProvDesde.Text := DameTituloProveedor(StrToIntDef(EFProvDesde.Text, 0));
end;

procedure TFPregCartera.EFProvHastaChange(Sender: TObject);
begin
  DBEProvHasta.Text := DameTituloProveedor(StrToIntDef(EFProvHasta.Text, 0));
end;

procedure TFPregCartera.EFCliHastaChange(Sender: TObject);
begin
  DBECliHasta.Text := DameTituloCliente(StrToIntDef(EFCliHasta.Text, 0));
end;

procedure TFPregCartera.EFCliDesdeChange(Sender: TObject);
begin
  DBECliDesde.Text := DameTituloCliente(StrToIntDef(EFCliDesde.Text, 0));
end;

procedure TFPregCartera.EFAgenteChange(Sender: TObject);
begin
  DBEAgenteDesde.Text := DameTituloAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFPregCartera.EFAcrDesdeChange(Sender: TObject);
begin
  DBEAcrDesde.Text := DameTituloAcreedor(StrToIntDef(EFAcrDesde.Text, 0));
end;

procedure TFPregCartera.EFAcrHastaChange(Sender: TObject);
begin
  DBEAcrHasta.Text := DameTituloAcreedor(StrToIntDef(EFAcrHasta.Text, 0));
end;

function TFPregCartera.DameRecibido(rec: integer): integer;
begin
  case rec of
     1: Result := 0;
     2: Result := 1;
     else
        Result := 2;
  end;
end;

function TFPregCartera.DameAceptar(Acep: integer): integer;
begin
  case Acep of
     1: Result := 0;
     2: Result := 1;
     else
        Result := 2;
  end;
end;

procedure TFPregCartera.LanzaListado(Modo: integer);
var
  Recibido, Aceptar : integer;
begin
  with DMLstCartera do
  begin
     Cobrado := LFCBCobrado.Checked;
     Impagado := LFCBImpagado.Checked;
     Normal := LFCBNormal.Checked;
     Remesado := LFCBRemesado.Checked;
     PagareConta := LFCBPagConta.Checked;
  end;
  Recibido := DameRecibido(CBRecibido.ItemIndex);
  Aceptar := DameAceptar(CBaceptar.ItemIndex);

  if PCMain.ActivePage = TSPagos then
     if PCPagos.ActivePage = TSProveedores then
     begin
        DMLSTCartera.MostrarListado(DTPFechaDesdeVencimiento.Date, DTPFechaHastaVencimiento.Date,
           DTPFechaDesdeFactura.Date, DTPFechaHastaFactura.Date,
           StrToIntDef(EFProvDesde.Text, 0), StrToIntDef(EFProvHasta.Text, 0),
           2, Modo, Recibido, Aceptar, RGOrden.ItemIndex);
     end
     else
     begin
        DMLSTCartera.MostrarListado(DTPFechaDesdeVencimiento.Date, DTPFechaHastaVencimiento.Date,
           DTPFechaDesdeFactura.Date, DTPFechaHastaFactura.Date,
           StrToIntDef(EFAcrDesde.Text, 0), StrToIntDef(EFAcrHasta.Text, 0),
           5, Modo, Recibido, Aceptar, RGOrden.ItemIndex);
     end
  else if PCCobros.ActivePage = TSClientes then
  begin
     if CHKCuentas.State = cbunchecked then
        DMLSTCartera.MostrarListado(DTPFechaDesdeVencimiento.Date, DTPFechaHastaVencimiento.Date,
           DTPFechaDesdeFactura.Date, DTPFechaHastaFactura.Date,
           StrToIntDef(EFCliDesde.Text, 0), StrToIntDef(EFCliHasta.Text, 0),
           1, Modo, Recibido, Aceptar, RGOrden.ItemIndex)
     else
        DMLSTCartera.MostrarListado(DTPFechaDesdeVencimiento.Date, DTPFechaHastaVencimiento.Date,
           DTPFechaDesdeFactura.Date, DTPFechaHastaFactura.Date,
           StrToIntDef(EFCliDesde.Text, 0), StrToIntDef(EFCliHasta.Text, 0),
           3, Modo, Recibido, Aceptar, RGOrden.ItemIndex);
  end
  else
  begin
     if CHKCuentasAgente.State = cbunchecked then
        DMLSTCartera.MostrarListadoAge(DTPFechaDesdeVencimiento.Date, DTPFechaHastaVencimiento.Date,
           DTPFechaDesdeFactura.Date, DTPFechaHastaFactura.Date,
           StrToIntDef(EFAgente.Text, 0), 1, Modo, Recibido, Aceptar, RGOrden.ItemIndex)
     else
        DMLSTCartera.MostrarListadoAge(DTPFechaDesdeVencimiento.Date, DTPFechaHastaVencimiento.Date,
           DTPFechaDesdeFactura.Date, DTPFechaHastaFactura.Date,
           StrToIntDef(EFAgente.Text, 0), 4, Modo, Recibido, Aceptar, RGOrden.ItemIndex);
  end;
end;

procedure TFPregCartera.AConfigurarExecute(Sender: TObject);
begin
  // Primero decidimos el grupo
  if (PCMain.ActivePage = TSCobros) and (PCCobros.ActivePage = TSAgentes) then
     Grupo := 33
  else
     Grupo := 28;  // Proveedores, Acreedores o Clientes

  inherited;
end;

procedure TFPregCartera.AImprimirExecute(Sender: TObject);
begin
  inherited;
  LanzaListado(1);
end;

procedure TFPregCartera.APrevExecute(Sender: TObject);
begin
  inherited;
  LanzaListado(0);
end;

end.
