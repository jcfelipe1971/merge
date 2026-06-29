unit UFPregVentasCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest, Spin,
  rxToolEdit, ULFActionList, ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, ULFDateEdit,
  UFPEditListadoSimple, rxPlacemnt, ULFFormStorage, ULFEdit;

type
  TFPregVentasCliente = class(TFPEditListadoSimple)
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     EFamDesde: TLFEdit;
     EFamHasta: TLFEdit;
     EFFamiliaH: TLFEditFind2000;
     LHastaFamilia: TLFLabel;
     GBArticulo: TGroupBox;
     LDesdeArticulo: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     EFArt_Hasta: TLFEditFind2000;
     LHastaArticulo: TLFLabel;
     EArticuloHasta: TLFEdit;
     EArticuloDesde: TLFEdit;
     GBCliente: TGroupBox;
     LDesdeCliente: TLFLabel;
     EFClienteD: TLFEditFind2000;
     EClienteD: TLFEdit;
     EClienteH: TLFEdit;
     EFClienteH: TLFEditFind2000;
     LHastaCliente: TLFLabel;
     GBSerie: TGroupBox;
     LDesdeSerie: TLFLabel;
     EFSerieD: TLFEditFind2000;
     ESerieD: TLFEdit;
     ESerieH: TLFEdit;
     EFserieH: TLFEditFind2000;
     LHastaSerie: TLFLabel;
     GBFechas: TGroupBox;
     LDesdeEjercicio: TLFLabel;
     SEAnoD: TSpinEdit;
     LHastaEjercicio: TLFLabel;
     SEAnoH: TSpinEdit;
     LHastaCanal: TLFLabel;
     LDesdeCanal: TLFLabel;
     SECanalD: TSpinEdit;
     SECanalH: TSpinEdit;
     LHastaFecha: TLFLabel;
     LDesdeFecha: TLFLabel;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     GBOpciones: TGroupBox;
     LMoneda: TLFLabel;
     CBAlbaranes: TLFCheckBox;
     CBFacCerradas: TLFCheckBox;
     CBFacAbiertas: TLFCheckBox;
     EFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     ChkBMostrarInfoLotes: TLFCheckBox;
     GBAgente: TGroupBox;
     LDesdeAgente: TLFLabel;
     EFAgenteD: TLFEditFind2000;
     EAgenteD: TLFEdit;
     EAgenteH: TLFEdit;
     EFAgenteH: TLFEditFind2000;
     LHastaAgente: TLFLabel;
     CBAgente: TLFCheckBox;
     RGOrdenKri: TRadioGroup;
     TButtConfRapida: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFserieHChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFAgenteDBusqueda(Sender: TObject);
     procedure EFAgenteHBusqueda(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(Cliente: string);
  end;

var
  FPregVentasCliente : TFPregVentasCliente;

implementation

uses UUtiles, UDameDato, UEntorno, UFMListConfig, UDMMain, UDMLstVentasCliente, DateUtils;

{$R *.DFM}

procedure TFPregVentasCliente.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstVentasCliente, DMLstVentasCliente);

  Grupo := 511;
  Listado := DMLstVentasCliente.frHYVentasClientes;
  ListadoFR3 := DMLstVentasCliente.frxHYVentasClientes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargar.Execute;
end;

procedure TFPregVentasCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstVentasCliente);
end;

procedure TFPregVentasCliente.EFArt_DesdeBusqueda(Sender: TObject);
begin
  EFArt_Desde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregVentasCliente.EFArt_HastaBusqueda(Sender: TObject);
begin
  EFArt_Hasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregVentasCliente.EFArt_DesdeChange(Sender: TObject);
begin
  EArticuloDesde.Text := DameTituloArticulo(EFArt_Desde.Text);
end;

procedure TFPregVentasCliente.EFArt_HastaChange(Sender: TObject);
begin
  EArticuloHasta.Text := DameTituloArticulo(EFArt_Hasta.Text);
end;

procedure TFPregVentasCliente.AConfigurarExecute(Sender: TObject);
begin
  if (CBAgente.Checked) then
     Grupo := 511
  else
     Grupo := 140;

  inherited;
end;

procedure TFPregVentasCliente.ARecargarExecute(Sender: TObject);
var
  ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH : string;
  ClienteD, ClienteH, AgenteD, AgenteH : integer;
begin
  DMLstVentasCliente.Rango(ArticuloD, ArticuloH, FamiliaD,
     FamiliaH, SerieD, SerieH, ClienteD, ClienteH, AgenteD, AgenteH);
  EFArt_Desde.Text := ArticuloD;
  EFArt_Hasta.Text := ArticuloH;
  EFClienteD.Text := IntToStr(ClienteD);
  EFClienteH.Text := IntToStr(ClienteH);
  CBALbaranes.Checked := True;
  CBFacAbiertas.Checked := True;
  CBFacCerradas.Checked := True;
  SEAnoD.Value := REntorno.Ejercicio;
  SEAnoH.Value := REntorno.Ejercicio;
  DTPFechaD.Date := RecodeMonth(REntorno.FechaTrabSH, 1);
  DTPFechaH.Date := REntorno.FechaTrabSH;
  EFSerieD.Text := SerieD;
  EFSerieH.Text := SerieH;
  SECanalD.Value := REntorno.Canal;
  SECanalH.Value := REntorno.Canal;
  EFFamiliaD.Text := FamiliaD;
  EFFamiliaH.Text := FamiliaH;
  EFMoneda.Text := REntorno.Moneda;

  EFAgenteD.Text := IntToStr(AgenteD);
  EFAgenteH.Text := IntToStr(AgenteH);
  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
  begin
     EFAgenteD.Text := IntToStr(DameAgenteUsuario(REntorno.Usuario));
     EFAgenteH.Text := EFAgenteD.Text;
     GBAgente.Enabled := False;
  end;
end;

procedure TFPregVentasCliente.Muestra(Cliente: string);
begin
  EFClienteD.Text := Cliente;
  EFClienteH.Text := Cliente;
  ShowModal;
end;

procedure TFPregVentasCliente.EFFamiliaDChange(Sender: TObject);
begin
  EFamDesde.Text := DameTituloFamilia(EFFamiliaD.Text);
end;

procedure TFPregVentasCliente.EFFamiliaHChange(Sender: TObject);
begin
  EFamHasta.Text := DameTituloFamilia(EFFamiliaH.Text);
end;

procedure TFPregVentasCliente.EFClienteDChange(Sender: TObject);
begin
  EClienteD.Text := DameTituloCliente(StrToIntDef(EFClienteD.Text, 0));
end;

procedure TFPregVentasCliente.EFClienteHChange(Sender: TObject);
begin
  EClienteH.Text := DameTituloCliente(StrToIntDef(EFClienteH.Text, 0));
end;

procedure TFPregVentasCliente.EFSerieDChange(Sender: TObject);
begin
  ESerieD.Text := DameTituloSerie(EFSerieD.Text);
end;

procedure TFPregVentasCliente.EFserieHChange(Sender: TObject);
begin
  ESerieH.Text := DameTituloSerie(EFSerieH.Text);
end;

procedure TFPregVentasCliente.EFMonedaChange(Sender: TObject);
begin
  DMLstVentasCliente.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregVentasCliente.EFAgenteDBusqueda(Sender: TObject);
begin
  EFAgenteD.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
end;

procedure TFPregVentasCliente.EFAgenteHBusqueda(Sender: TObject);
begin
  EFAgenteH.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
end;

procedure TFPregVentasCliente.EFAgenteDChange(Sender: TObject);
begin
  EAgenteD.Text := DameTituloAgente(0, StrToIntDef(EFAgenteD.Text, 0));
end;

procedure TFPregVentasCliente.EFAgenteHChange(Sender: TObject);
begin
  EAgenteH.Text := DameTituloAgente(0, StrToIntDef(EFAgenteH.Text, 0));
end;

procedure TFPregVentasCliente.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstVentasCliente.Visualizar(Modo, CBAlbaranes.Checked, CBFacCerradas.Checked, CBFacAbiertas.Checked,
     CBAgente.Checked, ChkBMostrarInfoLotes.Checked, SEAnoD.Value,
     SEAnoH.Value, SEcanalD.Value, SEcanalh.Value, StrToIntDef(EFClienteD.Text, -1),
     StrToIntDef(EFClienteH.Text, 9999999),
     StrToIntDef(EFAgenteD.Text, -1), StrToIntDef(EFAgenteH.Text, 9999999),
     EFArt_Desde.Text, EFArt_Hasta.Text, EFFamiliaD.Text, EFFamiliaH.Text,
     EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
     DTPfechaD.Date, DTPfechaH.Date, RGOrdenKri.ItemIndex);
end;

end.
