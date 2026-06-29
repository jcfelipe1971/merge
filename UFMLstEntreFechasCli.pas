unit UFMLstEntreFechasCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UFormGest, rxToolEdit,
  ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar, TFlatCheckBoxUnit,
  ULFEditFind2000, ULFLabel, ULFComboBox, ULFDateEdit, ULFEdit,
  UFPEditListado, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, UFPEditListadoSimple;

type
  TFMLstEntreFechasCli = class(TFPEditListadoSimple)
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     GBClientes: TGroupBox;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EFCliHasta: TLFEditFind2000;
     EFCliDesde: TLFEditFind2000;
     ECliHasta: TLFEdit;
     ECliDesde: TLFEdit;
     TButtConfRapida: TToolButton;
     PNLEstado: TLFPanel;
     RBAbierto: TRadioButton;
     RBCerrados: TRadioButton;
     RBTodos: TRadioButton;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     EMoneda: TLFEdit;
     GBOpciones: TGroupBox;
     ChkBMostrarBImponible: TLFCheckBox;
     ChkBMostrarIntrac: TLFCheckBox;
     CBFechaAlb: TLFCheckBox;
     DTPFechaAlb: TLFDateEdit;
     GBSerie: TGroupBox;
     LDesdeSerie: TLFLabel;
     LHastaSerie: TLFLabel;
     CBFiltroSerie: TLFCheckBox;
     EFSerieD: TLFEditFind2000;
     EFSerieH: TLFEditFind2000;
     CBOrdenKri: TLFComboBox;
     LOrdenKri: TLFLabel;
     CBFechaCreacion: TLFCheckBox;
     ChkBMostrarDetalle: TLFCheckBox;
     TButtExportar: TToolButton;
     GBAgente: TGroupBox;
     EFAgente: TLFEditFind2000;
     EAgente: TLFEdit;
     DTPDesdeCon: TLFDateEdit;
     DTPHastaCon: TLFDateEdit;
     LDesdeFechaCon: TLFLabel;
     LHastaFechaCon: TLFLabel;
     EComentario: TLFEdit;
     LComentario: TLFLabel;
     LFechaListado: TLFLabel;
     TDPFechaListado: TLFDateEdit;
     GBUsuario: TGroupBox;
     EFUsuario: TLFEditFind2000;
     EUsuario: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFCliDesdeChange(Sender: TObject);
     procedure EFCliHastaChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure CBFechaAlbClick(Sender: TObject);
     procedure CBFiltroSerieClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFUsuarioChange(Sender: TObject);
  private
     { Private declarations }
     Serie, Tipo: string;
     fdesde, fhasta: TDateTime;
     p_desde, p_hasta: integer;
     fdesdeCon, fhastaCon: TDateTime;
     procedure TomarDatos;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
     procedure EstableceGrupo;
  public
     { Public declarations }
     procedure Muestra(aTipo, aSerie: string);
     procedure HabilitaFechas(Modo: boolean);
     procedure HabilitaSeries(Modo: boolean);
  end;

var
  FMLstEntreFechasCli : TFMLstEntreFechasCli;

implementation

uses UDMMain, UEntorno, UDMLstEntreFechasCli, UUtiles, UDMLstOfertasCli,
  UDMLstPedidosCli, UDMLstAlbaranesCli, UDMLstFacturaCli, UDameDato;

{$R *.DFM}

procedure TFMLstEntreFechasCli.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstEntreFechasCli, DMLstEntreFechasCli);

  // Inicializo variables globales a este formulario
  Grupo := 0;
  Listado := nil;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := nil;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFMLstEntreFechasCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstEntreFechasCli);
end;

procedure TFMLstEntreFechasCli.Muestra(aTipo, aSerie: string);
begin
  Serie := aSerie;
  Tipo := aTipo;

  ARecargar.Execute;
  // ChkBMostrarBImponible.Visible := (Tipo = 'ALB') or (Tipo = 'FAC');
  // ChkBMostrarDetalle.Visible := (Tipo = 'ALB');
  ChkBMostrarIntrac.Checked := True;
  ChkBMostrarIntrac.Visible := (Tipo = 'FAC');

  DTPDesdeCon.Enabled := False;
  DTPHastaCon.Enabled := False;
  LDesdeFechaCon.Enabled := False;
  LHastaFechaCon.Enabled := False;

  EComentario.Text := '';
  TDPFechaListado.Date := Now;

  CBFechaAlb.Visible := False;
  CBFechaCreacion.Visible := False;

  CBOrdenKri.ItemIndex := 0;

  // Iberfluid - Quiere que se filtre por fecha de creacion
  if (Tipo = 'PEC') then
  begin
     CBFechaCreacion.Visible := True;
     CBFechaCreacion.Checked := DMMain.EstadoKri(257) = 1;
  end;

  if (Tipo = 'ALB') then
  begin
     CBFechaAlb.Visible := True;
     DTPFechaAlb.Date := REntorno.FechaTrab;
     CBFechaAlb.Checked := False;
     HabilitaFechas(CBFechaAlb.Checked);

     if (REntorno.Pais = 'CHL') then
     begin
        CBOrdenKri.Items[0] := _('Tipo Doc. Tributario + Folio');
        CBOrdenKri.ItemIndex := 0;
     end;
  end;

  if (Tipo = 'FAC') then
  begin
     DTPDesdeCon.Enabled := True;
     DTPHastaCon.Enabled := True;

     if (REntorno.Pais = 'CHL') then
     begin
        CBOrdenKri.Items[0] := _('Tipo Doc. Tributario + Folio');
        CBOrdenKri.ItemIndex := 0;
     end;
  end;

  CBOrdenKri.Text := CBOrdenKri.Items[CBOrdenKri.ItemIndex];
  EstableceGrupo;
  ShowModal;

  Close;
end;

procedure TFMLstEntreFechasCli.EFCliDesdeChange(Sender: TObject);
begin
  ECliDesde.Text := DameTituloCliente(StrToIntDef(EFCliDesde.Text, 0));
end;

procedure TFMLstEntreFechasCli.EFCliHastaChange(Sender: TObject);
begin
  ECliHasta.Text := DameTituloCliente(StrToIntDef(EFCliHasta.Text, 0));
end;

procedure TFMLstEntreFechasCli.TomarDatos;
begin
  FDesde := HourIntoDate(DTPDesde.Date, '00:00:00');
  FHasta := HourIntoDate(DTPHasta.Date, '23:59:59');
  FDesdeCon := HourIntoDate(DTPDesdeCon.Date, '00:00:00');
  FHastaCon := HourIntoDate(DTPHastaCon.Date, '23:59:59');
  if EFCliDesde.Text <> '' then
     p_desde := StrToInt(EFCliDesde.Text);
  if EFCliHasta.Text <> '' then
     p_hasta := StrToInt(EFCliHasta.Text);
end;

procedure TFMLstEntreFechasCli.EFMonedaChange(Sender: TObject);
begin
  EMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFMLstEntreFechasCli.CBFechaAlbClick(Sender: TObject);
begin
  HabilitaFechas(CBFechaAlb.Checked);
end;

procedure TFMLstEntreFechasCli.HabilitaFechas(Modo: boolean);
begin
  // PNLEstado.Visible := not Modo;
  DTPFechaAlb.Visible := Modo;
end;

procedure TFMLstEntreFechasCli.HabilitaSeries(Modo: boolean);
begin
  LDesdeSerie.Visible := Modo;
  LHastaSerie.Visible := Modo;
  EFSerieD.Visible := Modo;
  EFSerieH.Visible := Modo;
end;

procedure TFMLstEntreFechasCli.CBFiltroSerieClick(Sender: TObject);
begin
  HabilitaSeries(CBFiltroSerie.Checked);
end;

procedure TFMLstEntreFechasCli.EstableceGrupo;
begin
  // Inicializo variables globales a este formulario
  Grupo := 0;
  Listado := nil;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := nil;

  // Configuro segun quien haya llamado a este formulario
  if (Tipo = 'OFC') then
  begin
     Grupo := 46;
     Listado := DMLstOfertasCli.frOferta;
     ListadoFR3 := DMLstOfertasCli.frxOferta;
  end
  else
  if (Tipo = 'PEC') then
  begin
     Grupo := 45;
     Listado := DMLstPedidosCli.frPedido;
     ListadoFR3 := DMLstPedidosCli.frxPedido;
  end
  else
  if (Tipo = 'ALB') then
  begin
     Grupo := 44;
     Listado := DMLstAlbaranesCli.frAlbaran;
     ListadoFR3 := DMLstAlbaranesCli.frxAlbaran;
  end
  else
  if (Tipo = 'FAC') then
  begin
     Grupo := 47;
     Listado := DMLstFacturaCli.frFactura;
     ListadoFR3 := DMLstFacturaCli.frxFactura;
  end;
end;

procedure TFMLstEntreFechasCli.EFAgenteChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFAgente.Text, 0) = 0) then
     EAgente.Text := _('Todos')
  else
     EAgente.Text := DameTituloAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFMLstEntreFechasCli.EFUsuarioChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFUsuario.Text, 0) = 0) then
     EUsuario.Text := _('Todos')
  else
     EUsuario.Text := DameTituloUsuario(StrToIntDef(EFUsuario.Text, 0));
end;

procedure TFMLstEntreFechasCli.ARecargarExecute(Sender: TObject);
begin
  inherited;
  CBOrdenKri.Visible := True;
  CBOrdenKri.ItemIndex := 0;
  EFAgente.Text := '';
  EFMoneda.Text := REntorno.Moneda;
  ChkBMostrarBImponible.Checked := True;
  RBTodos.Checked := True;

  DMLstEntreFechasCli.Rangos(p_desde, p_hasta, fdesde, fhasta, Tipo, Serie);

  DTPDesde.Date := Trunc(fdesde);
  DTPHasta.Date := Trunc(fhasta);
  DTPDesdeCon.Date := Trunc(fdesde);
  DTPHastaCon.Date := Trunc(fhasta);

  if (p_desde = 0) then
     EFCliDesde.Text := ''
  else
     EFCliDesde.Text := IntToStr(p_desde);
  if (p_hasta = 0) then
     EFCliHasta.Text := ''
  else
     EFCliHasta.Text := IntToStr(p_hasta);

  EFSerieD.Text := REntorno.Serie;
  EFSerieH.Text := REntorno.Serie;

  EFAgente.Text := '';
  EFUsuario.Text := '';

  CBFiltroSerie.Checked := False;
  HabilitaSeries(CBFiltroSerie.Checked);
end;

procedure TFMLstEntreFechasCli.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Forma : integer;
begin
  Forma := 3;
  if (RBAbierto.Checked) then
     Forma := 1;
  if (RBCerrados.Checked) then
     Forma := 2;
  if (RBTodos.Checked) then
     Forma := 3;
  if (not (RBCerrados.Checked) and not (RBAbierto.Checked)) then
     Forma := 3;

  TomarDatos;

  // Mostrar el Listado
  if (Tipo = 'OFC') then
     DMLstOfertasCli.MostrarListado(fdesde, fhasta, p_desde, p_hasta,
        Forma, Modo, Serie, CBFiltroSerie.Checked, EFSerieD.Text, EFSerieH.Text, EFMoneda.Text, ChkBMostrarBImponible.Checked, ChkBMostrarDetalle.Checked, CBOrdenKri.ItemIndex, StrToIntDef(EFAgente.Text, 0), EComentario.Text, TDPFechaListado.Date, StrToIntDef(EFUsuario.Text, 0), PBListado)
  else if (Tipo = 'PEC') then
     DMLstPedidosCli.MostrarListado(fdesde, fhasta, p_desde, p_hasta,
        Forma, Modo, Serie, CBFiltroSerie.Checked, EFSerieD.Text, EFSerieH.Text, EFMoneda.Text, ChkBMostrarBImponible.Checked, ChkBMostrarDetalle.Checked, CBOrdenKri.ItemIndex, StrToIntDef(EFAgente.Text, 0), EComentario.Text, TDPFechaListado.Date, PBListado, CBFechaCreacion.Checked, StrToIntDef(EFUsuario.Text, 0))
  else if (Tipo = 'ALB') then
     DMLstAlbaranesCli.MostrarListado(fdesde, fhasta, DTPFechaAlb.Date, p_desde, p_hasta,
        Forma, Modo, Serie, CBFiltroSerie.Checked, EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
        ChkBMostrarBImponible.Checked, ChkBMostrarDetalle.Checked, CBOrdenKri.ItemIndex, StrToIntDef(EFAgente.Text, 0), CBFechaAlb.Checked, EComentario.Text, TDPFechaListado.Date, StrToIntDef(EFUsuario.Text, 0), PBListado)
  else if (Tipo = 'FAC') then
     DMLstFacturaCli.MostrarListado(fdesde, fhasta, fdesdeCon, fhastaCon, p_desde, p_hasta,
        Forma, Modo, Serie, CBFiltroSerie.Checked, EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
        ChkBMostrarBImponible.Checked, ChkBMostrarDetalle.Checked, ChkBMostrarIntrac.Checked, CBOrdenKri.ItemIndex, StrToIntDef(EFAgente.Text, 0), EComentario.Text, TDPFechaListado.Date, StrToIntDef(EFUsuario.Text, 0), PBListado);
end;

end.
