unit UFPregPrevisionCobro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFCheckBox, ULFDBEdit, ULFEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, ULFComboBox, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregPrevisionCobro = class(TFPEditListadoSimple)
     Fecha_del_listado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     PNLComentario: TLFPanel;
     Comentario: TLFLabel;
     EComentario: TLFEdit;
     Vencimiento: TGroupBox;
     Moneda: TLFLabel;
     TButtConfRapida: TToolButton;
     PNLDatos: TLFPanel;
     RGAgrupadoPor: TRadioGroup;
     EFCliente: TLFEditFind2000;
     ECliente: TLFEdit;
     Desde: TLFLabel;
     DTPDesde: TLFDateEdit;
     Hasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     RGVencimiento: TRadioGroup;
     GBFormaPago: TGroupBox;
     EFFormaPago: TLFEditFind2000;
     EFormaPago: TLFEdit;
     ChkBFiltrar: TLFCheckBox;
     EFAgente: TLFEditFind2000;
     EAgente: TLFEdit;
     ChkBCartaReclamacion: TLFCheckBox;
     CBCanales: TLFComboBox;
     CBImpagadosKRI: TLFCheckBox;
     RGCarta: TRadioGroup;
     CBSoloNoRemesadosKRI: TLFCheckBox;
     GBSerieKri: TGroupBox;
     CBBC: TLFCheckBox;
     CBIR: TLFCheckBox;
     CBSE: TLFCheckBox;
     CBGJ: TLFCheckBox;
     CBMAR: TLFCheckBox;
     CBGAS: TLFCheckBox;
     CBAgrup: TLFCheckBox;
     GBFiltraEfecto: TGroupBox;
     CBFiltraEfecto: TLFCheckBox;
     EFTipoEfectoDesde: TLFEditFind2000;
     EFTipoEfectoHasta: TLFEditFind2000;
     ETipoEfectoDesde: TLFEdit;
     ETipoEfectoHasta: TLFEdit;
     LDesdeEfecto: TLFLabel;
     LHastaEfecto: TLFLabel;
     CBMarcarCartaEnviada: TLFCheckBox;
     EFMoneda: TLFEditFind2000;
     EMoneda: TLFEdit;
     GBOtrosFiltros: TGroupBox;
     EFIncidencia: TLFEditFind2000;
     ETituloIncidencia: TLFEdit;
     CBFiltraIncidencia: TLFCheckBox;
     CBFiltraPais: TLFCheckBox;
     EFPais: TLFEditFind2000;
     EPais: TLFEdit;
     RBOrdCliente: TRadioButton;
     RBOrdVencimiento: TRadioButton;
     CBFiltraNIF: TLFCheckBox;
     ENIF: TLFEdit;
     CBLC: TLFCheckBox;
     CBCalcularPrevisionPedidos: TLFCheckBox;
     CBCalcularPrevisionAlbaranes: TLFCheckBox;
     CBMAN: TLFCheckBox;
     CBBL: TLFCheckBox;
     CBSoloRecibidos: TLFCheckBox;
     CBSoloNoRecibidos: TLFCheckBox;
     TBExportar: TToolButton;
     LDocFechaDesde: TLFLabel;
     DEDesdeDocFecha: TLFDateEdit;
     LDofFechaHasta: TLFLabel;
     DEHastaDocFecha: TLFDateEdit;
     CBExcluirRemesables: TLFCheckBox;
     PBExportacion: TProgressBar;
     GBSerie: TGroupBox;
     CBFiltraSerie: TLFCheckBox;
     CBSerie: TComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure RGAgrupadoPorClick(Sender: TObject);
     procedure RGVencimientoClick(Sender: TObject);
     procedure ChkBFiltrarClick(Sender: TObject);
     procedure EFFormaPagoChange(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure DTPDesdeClick(Sender: TObject);
     procedure DTPHastaClick(Sender: TObject);
     procedure CBFiltraEfectoClick(Sender: TObject);
     procedure EFTipoEfectoDesdeChange(Sender: TObject);
     procedure EFTipoEfectoHastaChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFIncidenciaChange(Sender: TObject);
     procedure CBFiltraIncidenciaClick(Sender: TObject);
     procedure EFPaisChange(Sender: TObject);
     procedure CBFiltraPaisClick(Sender: TObject);
     procedure CBFiltraNIFClick(Sender: TObject);
     procedure ChkBCartaReclamacionClick(Sender: TObject);
     procedure CBSoloRecibidosClick(Sender: TObject);
     procedure CBSoloNoRecibidosClick(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure FiltraUnCliente(Cliente: integer; Carta: boolean = False);
  end;

var
  FPregPrevisionCobro : TFPregPrevisionCobro;

implementation

uses UDMMain, UFormGest, UDMRPrevisionCobro, UEntorno, UFMListConfig, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFPregPrevisionCobro.FormCreate(Sender: TObject);
var
  Serie : string;
begin
  inherited;

  AbreData(TDMRPrevisionCobro, DMRPrevisionCobro);
  RellenaCanales(CBCanales.Items);
  ARecargarExecute(Self);
  ChkBCartaReclamacion.Enabled := False;
  RGCarta.Enabled := False;
  GBSerieKri.Visible := DMMain.EstadoKri(221) = 1;

  Grupo := 31;
  Listado := DMRPrevisionCobro.frHYPrevisionCobro;
  ListadoFR3 := DMRPrevisionCobro.frxHYPrevisionCobro;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  RellenaSeries(CBSerie.Items);
  CBSerie.Items[0] := _('Sin Serie');

  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;

  // Me posiciono en la serie
  CBSerie.ItemIndex := 0;
  while ((CBSerie.ItemIndex < CBSerie.Items.Count - 1) and
        (Copy(CBSerie.Items[CBSerie.ItemIndex], 1, Length(Serie + ' ')) <> Serie + ' ')) do
     CBSerie.ItemIndex := CBSerie.ItemIndex + 1;
end;

procedure TFPregPrevisionCobro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRPrevisionCobro);
end;

procedure TFPregPrevisionCobro.ARecargarExecute(Sender: TObject);
var
  VencDesde, VencHasta : TDateTime;
  DocFechaDesde, DocFechaHasta : TDateTime;
begin
  inherited;

  DTPFechaListado.Date := REntorno.FechaTrab;
  DMRPrevisionCobro.Rangos(VencDesde, VencHasta, DocFechaDesde, DocFechaHasta, RGVencimiento.ItemIndex = 0);
  DTPDesde.Date := VencDesde;
  DTPHasta.Date := VencHasta;
  DEDesdeDocFecha.Date := DocFechaDesde;
  DEHastaDocFecha.Date := DocFechaHasta;
  RGVencimiento.ItemIndex := 1;
  RGVencimientoClick(Sender);
  EFMoneda.Text := REntorno.Moneda;
  EComentario.Text := '';
  EFCliente.Text := '-1';
  EFAgente.Text := '1';
  ChkBFiltrar.Checked := False;
  EFFormaPago.Text := 'CON';
  EFFormaPago.Visible := False;
  EFormaPago.Visible := False;
  CBCanales.ItemIndex := REntorno.Canal;
  EFTipoEfectoDesde.Visible := False;
  EFTipoEfectoHasta.Visible := False;
  ETipoEfectoDesde.Visible := False;
  ETipoEfectoHasta.Visible := False;
  LDesdeEfecto.Visible := False;
  LHastaEfecto.Visible := False;
end;

procedure TFPregPrevisionCobro.EFClienteChange(Sender: TObject);
begin
  ECliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
end;

procedure TFPregPrevisionCobro.RGAgrupadoPorClick(Sender: TObject);
begin
  if (RGAgrupadoPor.ItemIndex = 1) or (RGAgrupadoPor.ItemIndex = 2) then
     ChkBCartaReclamacion.Enabled := True
  else
     ChkBCartaReclamacion.Enabled := False;

  // Varias Cartas de Reclamacion
  if (RGAgrupadoPor.ItemIndex = 1) or (RGAgrupadoPor.ItemIndex = 2) then
     RGCarta.Enabled := True
  else
     RGCarta.Enabled := False;

  if (RGAgrupadoPor.ItemIndex = 2) then
  begin
     EFCliente.Visible := True;
     ECliente.Visible := True;
  end
  else
  begin
     EFCliente.Visible := False;
     ECliente.Visible := False;
  end;
  if (RGAgrupadoPor.ItemIndex = 4) then
  begin
     EFAgente.Visible := True;
     EAgente.Visible := True;
     RBOrdCliente.Visible := True;
     RBOrdVencimiento.Visible := True;
     CBFiltraPais.Checked := False;
     CBFiltraPais.Visible := False;
     EFPais.Visible := False;
     EPais.Visible := False;
  end
  else
  begin
     EFAgente.Visible := False;
     EAgente.Visible := False;
     CBFiltraPais.Visible := True;
     RBOrdCliente.Visible := False;
     RBOrdVencimiento.Visible := False;
  end;
end;

procedure TFPregPrevisionCobro.RGVencimientoClick(Sender: TObject);
var
  VencDesde, VencHasta : TDateTime;
  DocFechaDesde, DocFechaHasta : TDateTime;
begin
  DMRPrevisionCobro.Rangos(VencDesde, VencHasta, DocFechaDesde, DocFechaHasta, RGVencimiento.ItemIndex = 0);
  DTPDesde.Date := VencDesde;
  DTPHasta.Date := VencHasta;
end;

procedure TFPregPrevisionCobro.ChkBFiltrarClick(Sender: TObject);
begin
  if ChkBFiltrar.Checked then
  begin
     EFFormaPago.Visible := True;
     EFormaPago.Visible := True;
     EFFormaPago.SetFocus;
  end
  else
  begin
     EFFormaPago.Visible := False;
     EFormaPago.Visible := False;
  end;
end;

procedure TFPregPrevisionCobro.EFFormaPagoChange(Sender: TObject);
begin
  EFormaPago.Text := DameTituloFormaPago(EFFormaPago.Text);
end;

procedure TFPregPrevisionCobro.EFAgenteChange(Sender: TObject);
begin
  EAgente.Text := DameTituloAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFPregPrevisionCobro.DTPDesdeClick(Sender: TObject);
begin
  RGVencimiento.ItemIndex := -1;
end;

procedure TFPregPrevisionCobro.DTPHastaClick(Sender: TObject);
begin
  RGVencimiento.ItemIndex := -1;
end;

procedure TFPregPrevisionCobro.CBFiltraEfectoClick(Sender: TObject);
begin
  inherited;
  EFTipoEfectoDesde.Visible := CBFiltraEfecto.Checked;
  EFTipoEfectoHasta.Visible := CBFiltraEfecto.Checked;
  ETipoEfectoDesde.Visible := CBFiltraEfecto.Checked;
  ETipoEfectoHasta.Visible := CBFiltraEfecto.Checked;
  LDesdeEfecto.Visible := CBFiltraEfecto.Checked;
  LHastaEfecto.Visible := CBFiltraEfecto.Checked;

  if CBFiltraEfecto.Checked then
     EFTipoEfectoDesde.SetFocus;
end;

procedure TFPregPrevisionCobro.EFTipoEfectoDesdeChange(Sender: TObject);
begin
  inherited;
  ETipoEfectoDesde.Text := DameTituloEfecto(EFTipoEfectoDesde.Text);
end;

procedure TFPregPrevisionCobro.EFTipoEfectoHastaChange(Sender: TObject);
begin
  inherited;
  ETipoEfectoHasta.Text := DameTituloEfecto(EFTipoEfectoHasta.Text);
end;

procedure TFPregPrevisionCobro.EFMonedaChange(Sender: TObject);
begin
  inherited;
  EMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFPregPrevisionCobro.EFIncidenciaChange(Sender: TObject);
begin
  inherited;
  ETituloIncidencia.Text := DameTituloTipoIncidencia(EFIncidencia.Text);
end;

procedure TFPregPrevisionCobro.CBFiltraIncidenciaClick(Sender: TObject);
begin
  inherited;
  EFIncidencia.Visible := CBFiltraIncidencia.Checked;
  ETituloIncidencia.Visible := CBFiltraIncidencia.Checked;
end;

procedure TFPregPrevisionCobro.EFPaisChange(Sender: TObject);
begin
  inherited;
  EPais.Text := DameTituloPais(EFPais.Text);
end;

procedure TFPregPrevisionCobro.CBFiltraPaisClick(Sender: TObject);
begin
  inherited;
  EFPais.Visible := CBFiltraPais.Checked;
  EPais.Visible := CBFiltraPais.Checked;
end;

procedure TFPregPrevisionCobro.CBFiltraNIFClick(Sender: TObject);
begin
  inherited;
  ENIF.Visible := CBFiltraNIF.Checked;
end;

procedure TFPregPrevisionCobro.ChkBCartaReclamacionClick(Sender: TObject);
begin
  inherited;
  CBSoloNoRecibidos.Checked := True;
end;

procedure TFPregPrevisionCobro.CBSoloRecibidosClick(Sender: TObject);
begin
  inherited;
  if (CBSoloRecibidos.Checked) then
     CBSoloNoRecibidos.Checked := False;
end;

procedure TFPregPrevisionCobro.CBSoloNoRecibidosClick(Sender: TObject);
begin
  inherited;
  if (CBSoloNoRecibidos.Checked) then
     CBSoloRecibidos.Checked := False;
end;

procedure TFPregPrevisionCobro.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  SerieKri : string;
  Union : string;
  OrdenAgente : integer;
begin
  SerieKri := '';
  Union := '(';
  if (CBBC.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''BC'') OR (SERIE = ''BCA''))';
     Union := ' OR ';
  end;
  if (CBBL.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''BL'') OR (SERIE = ''BLA''))';
     Union := ' OR ';
  end;
  if (CBIR.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''IR'') OR (SERIE = ''IRA''))';
     Union := ' OR ';
  end;
  if (CBSE.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''SE'') OR (SERIE = ''SEA''))';
     Union := ' OR ';
  end;
  if (CBGJ.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''GJ'') OR (SERIE = ''GJA''))';
     Union := ' OR ';
  end;
  if (CBLC.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''LC'') OR (SERIE = ''LCA''))';
     Union := ' OR ';
  end;
  if (CBMAR.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''MAR'') OR (SERIE = ''MARA''))';
     Union := ' OR ';
  end;
  if (CBMAN.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''MAN'') OR (SERIE = ''MANA''))';
     Union := ' OR ';
  end;
  if (CBGAS.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''GAS'') OR (SERIE = ''GASA''))';
     Union := ' OR ';
  end;
  if (CBAgrup.Checked) then
  begin
     SerieKri := SerieKri + Union + 'SERIE=''''';
     Union := ' OR ';
  end;
  if (Length(SerieKri) > 1) then
     SerieKri := SerieKri + ')';

  if (CBFiltraSerie.Checked) then
  begin
     if CBSerie.ItemIndex = 0 then
        SerieKri := '(SERIE='''')'
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        SerieKri := CBSerie.Items[CBSerie.ItemIndex];
        SerieKri := Copy(SerieKri, 1, Pos(' ', SerieKri) - 1);
        SerieKri := format('(SERIE=''%s'')', [SerieKri]);
     end;
  end;

  if (RBOrdCliente.Checked) then
     OrdenAgente := 1
  else
     OrdenAgente := 2;

  DMRPrevisionCobro.CalculaInforme(DTPDesde.Date, DTPHasta.Date, DEDesdeDocFecha.Date, DEHastaDocFecha.Date, DTPFechaListado.Date,
     EFMoneda.Text, EComentario.Text,
     RGAgrupadoPor.ItemIndex,
     StrToIntDef(EFCliente.Text, 0),
     StrToIntDef(EFAgente.Text, 0),
     ChkBFiltrar.Checked, EFFormaPago.Text, CBCanales.ItemIndex, CBImpagadosKRI.Checked,
     CBSoloNoRemesadosKRI.Checked, CBExcluirRemesables.Checked, SerieKri,
     CBFiltraEfecto.Checked, EFTipoEfectoDesde.Text, EFTipoEfectoHasta.Text, ChkBCartaReclamacion.Checked {SoloNoRecibidos},
     CBFiltraIncidencia.Checked, EFIncidencia.Text, CBFiltraPais.Checked, EFPais.Text, OrdenAgente, CBFiltraNIF.Checked, ENIF.Text,
     CBCalcularPrevisionPedidos.Checked, CBCalcularPrevisionAlbaranes.Checked, CBSoloRecibidos.Checked, CBSoloNORecibidos.Checked);

  if (Modo = 2) then
  begin
     try
        PBExportacion.Visible := True;
        DMRPrevisionCobro.ExportarExcel(RGAgrupadoPor.ItemIndex, OrdenAgente, PBExportacion);
     finally
        PBExportacion.Visible := False;
     end;
  end
  else
     DMRPrevisionCobro.MostrarListado(Modo, RGAgrupadoPor.ItemIndex,
        ChkBCartaReclamacion.Checked, RGCarta.ItemIndex, CBMarcarCartaEnviada.Checked, OrdenAgente);
end;

procedure TFPregPrevisionCobro.AConfigurarExecute(Sender: TObject);
begin
  Grupo := 0;
  case RGAgrupadoPor.ItemIndex of
     0: Grupo := 31;                              // Vencimiento
     1, 2:                                        // Clientes - Un Cliente
        if ChkBCartaReclamacion.Checked then      // Si esta activado el check de carta.
        begin
           {Grupo := 509;
        if CBImpagadosKRI.Checked then - dji lrk kri - lo saque por fercam no se para quien se hizo}
           case RGCarta.ItemIndex of
              0: Grupo := 5610;
              1: Grupo := 5611;
              2: Grupo := 5612;
              3: Grupo := 5613;
              4: Grupo := 5614;
           end;
        end
        else
           Grupo := 84;
     3: Grupo := 137;                             // Cuenta
     4:
     begin                                        // Un Agente
        if (RBOrdVencimiento.Checked) then
           Grupo := 508;
        if (RBOrdCliente.Checked) then
           Grupo := 2008;
     end;
     else
        Grupo := 0;
  end;

  inherited;
end;

procedure TFPregPrevisionCobro.FiltraUnCliente(Cliente: integer; Carta: boolean = False);
begin
  RGAgrupadoPor.ItemIndex := 2;
  EFCliente.Text := IntToStr(Cliente);
  ChkBCartaReclamacion.Checked := Carta;
end;

end.
