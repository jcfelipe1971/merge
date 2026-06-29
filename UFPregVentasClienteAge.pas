unit UFPregVentasClienteAge;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest, Spin,
  rxToolEdit, ULFEditFind2000, ULFDBEdit, ULFCheckBox, ULFActionList,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFLabel, UFPEditListadoSimple,
  rxPlacemnt, ULFFormStorage;

type
  TFPregVentasClienteAge = class(TFPEditListadoSimple)
     GBEjercicio: TGroupBox;
     LEjercicio: TLFLabel;
     SEEjercicioD: TSpinEdit;
     LDesdeCanal: TLFLabel;
     SECanalD: TSpinEdit;
     LHastaCanal: TLFLabel;
     SECanalH: TSpinEdit;
     GBSerie: TGroupBox;
     LHastaSerie: TLFLabel;
     LDesdeSerie: TLFLabel;
     EFSerieD: TLFEditFind2000;
     EFserieH: TLFEditFind2000;
     DBESerieH: TLFDbedit;
     DBESerieD: TLFDbedit;
     GBAgente: TGroupBox;
     LDesdeAgente: TLFLabel;
     LHastaAgente: TLFLabel;
     EFAgenteH: TLFEditFind2000;
     EFAgenteD: TLFEditFind2000;
     DBEAgenteDesde: TLFDbedit;
     DBEAgenteHasta: TLFDbedit;
     GBCliente: TGroupBox;
     LHastaCliente: TLFLabel;
     LDesdeCliente: TLFLabel;
     EFClienteD: TLFEditFind2000;
     EFClienteH: TLFEditFind2000;
     DBECLienteH: TLFDbedit;
     DBEClienteD: TLFDbedit;
     GBArticulo: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     EFArt_Hasta: TLFEditFind2000;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     EFFamiliaH: TLFEditFind2000;
     DBEFamHasta: TLFDbedit;
     DBEFamDesde: TLFDbedit;
     GBOpciones: TGroupBox;
     LMoneda: TLFLabel;
     CBUnificaClientes: TLFCheckBox;
     CBUnificaAgentes: TLFCheckBox;
     EFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     RGDocumentos: TRadioGroup;
     RFacturas: TRadioButton;
     RAlbaranes: TRadioButton;
     ToolButton1: TToolButton;
     procedure AImprimirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFserieHChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
  private
     { Private declarations }
     procedure Imprimir(Modo: integer);
  public
     { Public declarations }
     procedure Muestra(Cliente: string);
  end;

var
  FPregVentasClienteAge : TFPregVentasClienteAge;

implementation

uses UUtiles, UEntorno, UDMMain, UDMLstVentasCliAge, UDameDato;

{$R *.DFM}

procedure TFPregVentasClienteAge.FormCreate(Sender: TObject);
begin
  AbreData(TDMLstVentasCliAge, DMLstVentasCliAge);

  Grupo := 159;
  Listado := DMLstVentascliAge.frHYVentasClientesAgentes;
  ListadoFR3 := DMLstVentascliAge.frxHYVentasClientesAgentes;

  ARecargar.Execute;
end;

procedure TFPregVentasClienteAge.Imprimir(Modo: integer);
begin
  DMLstVentasCliAge.Visualizar(Modo, BoolToInt(CBUnificaClientes.Checked), BoolToInt(CBUnificaAgentes.Checked), BoolToInt(RFacturas.Checked),
     SEEjercicioD.Value, SEcanalD.Value, SEcanalh.Value,
     StrToIntDef(EFClienteD.Text, -1), StrToIntDef(EFClienteH.Text, 9999999),
     StrToIntDef(EFAgenteD.Text, -1), StrToIntDef(EFAgenteH.Text, 9999999),
     EFArt_Desde.Text, EFArt_Hasta.Text, EFFamiliaD.Text, EFFamiliaH.Text, EFSerieD.Text,
     EFSerieH.Text, EFMoneda.Text);
end;

procedure TFPregVentasClienteAge.AImprimirExecute(Sender: TObject);
begin
  Imprimir(1);
end;

procedure TFPregVentasClienteAge.APrevExecute(Sender: TObject);
begin
  Imprimir(0);
end;

procedure TFPregVentasClienteAge.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstVentasCliAge);
end;

procedure TFPregVentasClienteAge.EFArt_DesdeBusqueda(Sender: TObject);
begin
  EFArt_Desde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregVentasClienteAge.EFArt_HastaBusqueda(Sender: TObject);
begin
  EFArt_Hasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregVentasClienteAge.EFArt_DesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstVentascliAge.xArt_Desde, EFArt_Desde.Text);
end;

procedure TFPregVentasClienteAge.EFArt_HastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstVentascliAge.xArt_Hasta, EFArt_Hasta.Text);
end;

procedure TFPregVentasClienteAge.ARecargarExecute(Sender: TObject);
var
  ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH : string;
  ClienteD, ClienteH, AgenteD, AgenteH : integer;
begin
  DMLstVentasCliAge.Rango1(ArticuloD, ArticuloH, ClienteD, ClienteH, AgenteD, AgenteH, FamiliaD, FamiliaH, SerieD, SerieH);

  EFArt_Desde.Text := ArticuloD;
  EFArt_Hasta.Text := ArticuloH;
  EFClienteD.Text := IntToStr(ClienteD);
  EFClienteH.Text := IntToStr(ClienteH);

  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
  begin
     AgenteD := DameAgenteUsuario(REntorno.Usuario);
     AgenteH := AgenteD;
     GBAgente.Enabled := False;
  end;

  EFAgenteD.Text := IntToStr(AgenteD);
  EFAgenteH.Text := IntToStr(AgenteH);

  RALbaranes.Checked := True;
  SEEjercicioD.Value := REntorno.Ejercicio;
  EFSerieD.Text := SerieD;
  EFSerieH.Text := SerieH;
  SECanalD.Value := REntorno.Canal;
  SECanalH.Value := REntorno.Canal;
  EFFamiliaD.Text := FamiliaD;
  EFFamiliaH.Text := FamiliaH;
  EFMoneda.Text := REntorno.Moneda;
end;

procedure TFPregVentasClienteAge.Muestra(Cliente: string);
begin
  EFClienteD.Text := Cliente;
  EFClienteH.Text := Cliente;
  ShowModal;
end;

procedure TFPregVentasClienteAge.EFFamiliaDChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstVentasCliAge.xFam_Desde, EFFamiliaD.Text);
end;

procedure TFPregVentasClienteAge.EFFamiliaHChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstVentasCliAge.xFam_Hasta, EFFamiliaH.Text);
end;

procedure TFPregVentasClienteAge.EFClienteDChange(Sender: TObject);
begin
  Actualiza_ClienteEmpRO(DMLstVentasCliAge.xCli_Desde, EFClienteD.Text);
end;

procedure TFPregVentasClienteAge.EFClienteHChange(Sender: TObject);
begin
  Actualiza_ClienteEmpRO(DMLstVentasCliAge.xCli_Hasta, EFClienteH.Text);
end;

procedure TFPregVentasClienteAge.EFSerieDChange(Sender: TObject);
begin
  Actualiza_SerieEmpRO(DMLstVentascliAge.xSerie_Desde, EFSerieD.Text);
end;

procedure TFPregVentasClienteAge.EFserieHChange(Sender: TObject);
begin
  Actualiza_SerieEmpRO(DMLstVentasCliAge.xSerie_Hasta, EFSerieH.Text);
end;

procedure TFPregVentasClienteAge.EFMonedaChange(Sender: TObject);
begin
  DMLstVentascliAge.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregVentasClienteAge.EFAgenteDChange(Sender: TObject);
begin
  Actualiza_AgenteEmpRO(DMLstVentasCliAge.xagente_Desde, EFAgenteD.Text);
end;

procedure TFPregVentasClienteAge.EFAgenteHChange(Sender: TObject);
begin
  Actualiza_AgenteEmpRO(DMLstVentasCliAge.xagente_Hasta, EFAgenteH.Text);
end;

procedure TFPregVentasClienteAge.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregVentasClienteAge.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

end.
