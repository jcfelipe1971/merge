unit UFPregPedPdte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, StdCtrls, ComCtrls, ExtCtrls,
  ToolWin, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, DateUtils,
  UDBDateTimePicker, Grids, DBGrids, rxToolEdit, ULFDBEdit, ULFActionList,
  ULFComboBox, ULFEdit, ULFPanel, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, ULFDateEdit, TFlatCheckBoxUnit, ULFCheckBox,
  rxPlacemnt, ULFFormStorage;

type
  TFPregPedPdte = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     TSCliente: TTabSheet;
     TSArticulo: TTabSheet;
     TSFechaE: TTabSheet;
     PNLFecjaEntrega: TLFPanel;
     PNLArticulo: TLFPanel;
     PNLCliente: TLFPanel;
     LClienteD: TLFLabel;
     EFClienteD: TLFEditFind2000;
     EClienteD: TLFEdit;
     EClienteH: TLFEdit;
     EFClienteH: TLFEditFind2000;
     LClienteH: TLFLabel;
     LClienteDesdeFecha: TLFLabel;
     LClienteHastaFecha: TLFLabel;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     LArtFechaD: TLFLabel;
     DTPFechaArtD: TLFDateEdit;
     DTPFechaArtH: TLFDateEdit;
     LArtFechaH: TLFLabel;
     RBServido: TRadioButton;
     RBPdteServir: TRadioButton;
     RBTodos: TRadioButton;
     DTPFechaED: TLFDateEdit;
     DTPFechaEH: TLFDateEdit;
     LFechaD: TLFLabel;
     LFechaEH: TLFLabel;
     TSAgente: TTabSheet;
     PNLAgente: TLFPanel;
     LabelAgenteD: TLFLabel;
     LabelAgenteH: TLFLabel;
     DBEAgenteD: TLFDbedit;
     DBEAgenteH: TLFDbedit;
     EFAgenteD: TLFEditFind2000;
     EFAgenteH: TLFEditFind2000;
     LabelFechaD: TLFLabel;
     LabelFechaH: TLFLabel;
     DTPFechaAgenteD: TLFDateEdit;
     DTPFechaAgenteH: TLFDateEdit;
     TButtMultiSerie: TToolButton;
     AMultiSerie: TAction;
     LBLFamDesde: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     DBEFamiliaD: TLFDbedit;
     LBLFamHasta: TLFLabel;
     EFFamiliaH: TLFEditFind2000;
     DBEFamiliaH: TLFDbedit;
     LArticuloD: TLFLabel;
     EFArticuloD: TLFEditFind2000;
     DBEArticuloD: TLFDbedit;
     LArticuloH: TLFLabel;
     EFArticuloH: TLFEditFind2000;
     DBEArticuloH: TLFDbedit;
     RBAnulado: TRadioButton;
     CBAgrupadoPorModelo: TLFCheckBox;
     PNLBottom: TLFPanel;
     LDesdeTemporada: TLFLabel;
     LHastaTemporada: TLFLabel;
     EFDesdeTemporada: TLFEditFind2000;
     EDesdeTemporada: TLFEdit;
     EFHastaTemporada: TLFEditFind2000;
     EHastaTemporada: TLFEdit;
     LMarca: TLFLabel;
     EFMarca: TLFEditFind2000;
     EMarca: TLFEdit;
     LFecEntregaDesdeCli: TLFLabel;
     LFecEntregaHastaCli: TLFLabel;
     EFFecEntregaDesdeCli: TLFEditFind2000;
     EFFecEntregaHastaCli: TLFEditFind2000;
     EFecEntregaDesdeCli: TLFEdit;
     EFecEntregaHastaCli: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
     procedure AMultiSerieExecute(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure EFDesdeTemporadaChange(Sender: TObject);
     procedure EFHastaTemporadaChange(Sender: TObject);
     procedure EFMarcaBusqueda(Sender: TObject);
     procedure EFMarcaChange(Sender: TObject);
     procedure EFFecEntregaDesdeCliChange(Sender: TObject);
     procedure EFFecEntregaHastaCliChange(Sender: TObject);
  private
     { Private declarations }
     SentenciaWhere: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregPedPdte : TFPregPedPdte;

implementation

uses UDMMain, UDMLstPedPdte, UFormGest, UFMain, UEntorno, UFMMultiSerie, UFMListConfig,
  UUtiles, UDameDato;

{$R *.dfm}

procedure TFPregPedPdte.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstPedPdte, DMLstPedPdte);
  PNLTop.Visible := True;

  ARecargar.Execute;
  PCMain.ActivePage := TSCliente;
  CBOrden.Clear;
  CBOrden.Items.Add(_('Por Cliente'));
  CBOrden.Items.Add(_('Por Fecha del Pedido'));
  CBOrden.Items.Add(_('Por Número de Pedido'));
  CBOrden.ItemIndex := 0;

  // Copio el stringlist al formulario del listado
  SentenciaWhere := TStringList.Create;

  TDPFechaListado.Date := REntorno.FechaTrabSH;
  Grupo := 141;
  Listado := DMLstPedPdte.frPedPdte;
  ListadoFR3 := DMLstPedPdte.frxPedPdte;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregPedPdte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SentenciaWhere.Free;
  CierraData(DMLstPedPdte);
end;

procedure TFPregPedPdte.ARecargarExecute(Sender: TObject);
var
  year, month, day, dias : word;
begin
  inherited;
  DMLstPedPdte.Recargar;
  EFClienteD.Text := DMLstPedPdte.CliMin;
  EFClienteH.Text := DMLstPedPdte.CliMax;
  EFFecEntregaDesdeCli.Text := DMLstPedPdte.CliMin;
  EFFecEntregaHastaCli.Text := DMLstPedPdte.CliMax;
  EFFamiliaD.Text := DMLstPedPdte.FamMin;
  EFFamiliaH.Text := DMLstPedPdte.FamMax;
  EFArticuloD.Text := DMLstPedPdte.ArtMin;
  EFArticuloH.Text := DMLstPedPdte.ArtMax;
  EFAgenteD.Text := DMLstPedPdte.AgenteMin;
  EFAgenteH.Text := DMLstPedPdte.AgenteMax;

  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  DTPFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DTPFechaArtD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaArtH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DTPFechaED.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaEH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DTPFechaAgenteD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaAgenteH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
end;

procedure TFPregPedPdte.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSCliente) then
  begin
     EFClienteD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Cliente'));
     CBOrden.Items.Add(_('Por Fecha Pedido'));
     CBOrden.Items.Add(_('Por Número Pedido'));
     // Orden por cliente y num. pedido
     CBOrden.ItemIndex := 0;
     Grupo := 141;
  end;
  if (PCMain.ActivePage = TSArticulo) then
  begin
     EFFamiliaD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Artículo'));
     CBOrden.Items.Add(_('Por Fecha'));
     // Orden por artículo y fecha de pedido
     CBOrden.ItemIndex := 0;
     Grupo := 142;
  end;
  if (PCMain.ActivePage = TSFechaE) then
  begin
     DTPFechaED.SetFocus;
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Fecha Entrega'));
     // Orden por artículo y fecha de pedido
     CBOrden.ItemIndex := 0;
     Grupo := 143;
  end;
  if (PCMain.ActivePage = TSAgente) then
  begin
     EFAgenteD.SetFocus;
     ARecargarExecute(Sender);
     CBOrden.Clear;
     CBOrden.Items.Add(_('Por Agente'));
     CBOrden.Items.Add(_('Por Fecha Pedido'));
     CBOrden.Items.Add(_('Por Número Pedido'));
     // Orden por agente y num. pedido
     CBOrden.ItemIndex := 0;
     Grupo := 144;
  end;
end;

procedure TFPregPedPdte.EFClienteDChange(Sender: TObject);
begin
  inherited;
  EClienteD.Text := DameTituloCliente(StrToIntDef(EFClienteD.Text, 0));
end;

procedure TFPregPedPdte.EFClienteHChange(Sender: TObject);
begin
  inherited;
  EClienteH.Text := DameTituloCliente(StrToIntDef(EFClienteH.Text, 0));
end;

procedure TFPregPedPdte.EFArticuloDChange(Sender: TObject);
begin
  inherited;
  DMLstPedPdte.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPregPedPdte.EFArticuloHChange(Sender: TObject);
begin
  inherited;
  DMLstPedPdte.CambiaArticuloH(EFArticuloH.Text);
end;

procedure TFPregPedPdte.EFAgenteDChange(Sender: TObject);
begin
  inherited;
  DMLSTPedPdte.CambiaAgenteD(StrToIntDef(EFAgenteD.Text, 0));
end;

procedure TFPregPedPdte.EFAgenteHChange(Sender: TObject);
begin
  inherited;
  DMLSTPedPdte.CambiaAgenteH(StrToIntDef(EFAgenteH.Text, 0));
end;

procedure TFPregPedPdte.AMultiSerieExecute(Sender: TObject);
begin
  inherited;
  SentenciaWhere.Clear;
  TFMMultiSerie.Create(Self).RellenaSeries(SentenciaWhere);
end;

procedure TFPregPedPdte.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregPedPdte.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregPedPdte.EFFamiliaDChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstPedPdte.xFamiliaD, EFFamiliaD.Text);
end;

procedure TFPregPedPdte.EFFamiliaHChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstPedPdte.xFamiliaH, EFFamiliaH.Text);
end;

procedure TFPregPedPdte.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregPedPdte.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregPedPdte.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  tipo_servido : integer;
  Ficha : char;
begin
  tipo_servido := -1;
  if (RBPdteServir.Checked) then
     tipo_servido := 0; // Mostrará sólo los pendientes de servir
  if (RBServido.Checked) then
     tipo_servido := 1; // Mostrará sólo los servidos
  if (RBTodos.Checked) then
     tipo_servido := 10; // Los mostrará todos
  if (RBAnulado.Checked) then
     tipo_servido := 11; // sfg.albert - Mostrarà los anulados

  Ficha := ' ';
  if (PCMain.ActivePage = TSCliente) then
     Ficha := 'C';
  if (PCMain.ActivePage = TSArticulo) then
     Ficha := 'A';
  if (PCMain.ActivePage = TSFechaE) then
     Ficha := 'F';
  if (PCMain.ActivePage = TSAgente) then
     Ficha := 'G';

  DMLstPedPdte.CrearSQL(Ficha, CBAgrupadoPorModelo.Checked, SentenciaWhere.Text, CBOrden.ItemIndex);

  if PCMain.ActivePage = TSCliente then
  begin
     DMLstPedPdte.MostrarListado(Modo, DTPFechaD.Date, DTPFechaH.Date,
        StrToIntDef(EFClienteD.Text, 0),
        StrToIntDef(EFClienteH.Text, 0), DMLstPedPdte.FamMin, DMLstPedPdte.FamMax,
        DMLstPedPdte.ArtMin,
        DMLstPedPdte.ArtMax, tipo_servido, 1, CBOrden.Items[CBOrden.ItemIndex], TDPFechaListado.Date, EComentario.Text,
        StrToIntDef(DMLstPedPdte.AgenteMin, 0), StrToIntDef(DMLstPedPdte.AgenteMax, 0), EFDesdeTemporada.Text, EFHastaTemporada.Text, StrToIntDef(EFMarca.Text, 0));
  end;
  if PCMain.ActivePage = TSArticulo then
  begin
     DMLstPedPdte.MostrarListado(Modo, DTPFechaArtD.Date, DTPFechaArtH.Date,
        StrToIntDef(DMLstPedPdte.CliMin, 0),
        StrToIntDef(DMLstPedPdte.CliMax, 0), EFFamiliaD.Text,
        EFFamiliaH.Text, EFArticuloD.Text,
        EFArticuloH.Text, tipo_servido, 2, CBOrden.Items[CBOrden.ItemIndex], TDPFechaListado.Date, EComentario.Text,
        StrToIntDef(DMLstPedPdte.AgenteMin, 0),
        StrToIntDef(DMLstPedPdte.AgenteMax, 0), EFDesdeTemporada.Text, EFHastaTemporada.Text, StrToIntDef(EFMarca.Text, 0));
  end;
  if PCMain.ActivePage = TSFechaE then
  begin
     DMLstPedPdte.MostrarListado(Modo, DTPFechaED.Date, DTPFechaEH.Date,
        StrToIntDef(EFFecEntregaDesdeCli.Text, 0),
        StrToIntDef(EFFecEntregaHastaCli.Text, 0), DMLstPedPdte.FamMin,
        DMLstPedPdte.FamMax, DMLstPedPdte.ArtMin,
        DMLstPedPdte.ArtMax, tipo_servido, 3, CBOrden.Items[CBOrden.ItemIndex], TDPFechaListado.Date, EComentario.Text,
        StrToIntDef(DMLstPedPdte.AgenteMin, 0),
        StrToIntDef(DMLstPedPdte.AgenteMax, 0), EFDesdeTemporada.Text, EFHastaTemporada.Text, StrToIntDef(EFMarca.Text, 0));
  end;
  if PCMain.ActivePage = TSAgente then
  begin
     DMLstPedPdte.MostrarListado(Modo, DTPFechaAgenteD.Date, DTPFechaAgenteH.Date,
        StrToIntDef(DMLstPedPdte.CliMin, 0),
        StrToIntDef(DMLstPedPdte.CliMax, 0), DMLstPedPdte.FamMin,
        DMLstPedPdte.FamMax, DMLstPedPdte.ArtMin,
        DMLstPedPdte.ArtMax, tipo_servido, 4, CBOrden.Items[CBOrden.ItemIndex], TDPFechaListado.Date, EComentario.Text,
        StrToIntDef(EFAgenteD.Text, 0),
        StrToIntDef(EFAgenteH.Text, 0), EFDesdeTemporada.Text, EFHastaTemporada.Text, StrToIntDef(EFMarca.Text, 0));
  end;
end;

procedure TFPregPedPdte.EFDesdeTemporadaChange(Sender: TObject);
begin
  inherited;
  EDesdeTemporada.Text := DameTituloArtModTemporada(EFDesdeTemporada.Text);
end;

procedure TFPregPedPdte.EFHastaTemporadaChange(Sender: TObject);
begin
  inherited;
  EHastaTemporada.Text := DameTituloArtModTemporada(EFHastaTemporada.Text);
end;

procedure TFPregPedPdte.EFMarcaBusqueda(Sender: TObject);
begin
  inherited;
  EFMarca.CondicionBusqueda := '((ID_MARCA=' + IntToStr(REntorno.Empresa * (-1)) + ') OR (ID_MARCA > 0 AND EMPRESA = ' + REntorno.EmpresaStr + '))';
end;

procedure TFPregPedPdte.EFMarcaChange(Sender: TObject);
begin
  inherited;
  EMarca.Text := DameTituloMarcaModelo(StrToIntDef(EFMarca.Text, 0));
end;

procedure TFPregPedPdte.EFFecEntregaDesdeCliChange(Sender: TObject);
begin
  inherited;
  EFecEntregaDesdeCli.Text := DameTituloCliente(StrToIntDef(EFFecEntregaDesdeCli.Text, 0));
end;

procedure TFPregPedPdte.EFFecEntregaHastaCliChange(Sender: TObject);
begin
  inherited;
  EFecEntregaHastaCli.Text := DameTituloCliente(StrToIntDef(EFFecEntregaHastaCli.Text, 0));
end;

end.
