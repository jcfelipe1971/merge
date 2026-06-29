unit UFPregPrevisionPago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DBCtrls,
  Mask, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFCheckBox, ULFDBEdit, ULFEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, ULFComboBox, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregPrevisionPago = class(TFPEditListadoSimple)
     Fecha_del_listado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     Vencimiento: TGroupBox;
     Desde: TLFLabel;
     Hasta: TLFLabel;
     DTPHasta: TLFDateEdit;
     DTPDesde: TLFDateEdit;
     PNLComentario: TLFPanel;
     Comentario: TLFLabel;
     EComentario: TLFEdit;
     Moneda: TLFLabel;
     TButtConfRapida: TToolButton;
     RGAgrupadoPor: TRadioGroup;
     EFProveedor: TLFEditFind2000;
     DBEProveedor: TLFDbedit;
     EFAcreedor: TLFEditFind2000;
     DBEAcreedor: TLFDbedit;
     PNLDatos: TLFPanel;
     RGVencimiento: TRadioGroup;
     GBFormaPago: TGroupBox;
     EFFormaPago: TLFEditFind2000;
     DBEFormaPago: TLFDbedit;
     ChkBFiltrar: TLFCheckBox;
     CBCanales: TLFComboBox;
     GBSerieKri: TGroupBox;
     CBBC: TLFCheckBox;
     CBIR: TLFCheckBox;
     CBSE: TLFCheckBox;
     CBGJ: TLFCheckBox;
     CBMAR: TLFCheckBox;
     CBGAS: TLFCheckBox;
     CBAgrup: TLFCheckBox;
     EFCuenta: TLFEditFind2000;
     ECuenta: TLFEdit;
     GBTipoEfecto: TGroupBox;
     CBFiltraTipoEfecto: TLFCheckBox;
     EFTipoEfectoDesde: TLFEditFind2000;
     EFTipoEfectoHasta: TLFEditFind2000;
     ETipoEfectoDesde: TLFEdit;
     ETipoEfectoHasta: TLFEdit;
     EFMoneda: TLFEditFind2000;
     EMoneda: TLFEdit;
     GBOtrosFiltros: TGroupBox;
     EFPais: TLFEditFind2000;
     CBFiltraPais: TLFCheckBox;
     EPais: TLFEdit;
     GBFiltroBanco: TGroupBox;
     EFBanco: TLFEditFind2000;
     CBFiltraBanco: TLFCheckBox;
     EBanco: TLFEdit;
     CBFiltraNIF: TLFCheckBox;
     ENIF: TLFEdit;
     CBLC: TLFCheckBox;
     CBCalcularPrevisionPedidos: TLFCheckBox;
     CBCalcularPrevisionAlbaranes: TLFCheckBox;
     CBBL: TLFCheckBox;
     CBMAN: TLFCheckBox;
     TBExportar: TToolButton;
     PBExportacion: TProgressBar;
     GBSerie: TGroupBox;
     CBFiltraSerie: TLFCheckBox;
     CBSerie: TComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure RGAgrupadoPorClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure EFAcreedorChange(Sender: TObject);
     procedure RGVencimientoClick(Sender: TObject);
     procedure ChkBFiltrarClick(Sender: TObject);
     procedure EFFormaPagoChange(Sender: TObject);
     procedure DTPDesdeClick(Sender: TObject);
     procedure DTPHastaClick(Sender: TObject);
     procedure EFCuentaChange(Sender: TObject);
     procedure EFTipoEfectoDesdeChange(Sender: TObject);
     procedure EFTipoEfectoHastaChange(Sender: TObject);
     procedure CBFiltraTipoEfectoClick(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFPaisChange(Sender: TObject);
     procedure CBFiltraPaisClick(Sender: TObject);
     procedure EFBancoChange(Sender: TObject);
     procedure CBFiltraBancoClick(Sender: TObject);
     procedure CBFiltraNIFClick(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Previsualizar(TipoEfecto: string; DesdeVenc, HastaVenc: TDateTime);
  end;

var
  FPregPrevisionPago : TFPregPrevisionPago;

implementation

uses UDMMain, UFormGest, UDMRPrevisionPago, UEntorno, UFMListConfig, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFPregPrevisionPago.FormCreate(Sender: TObject);
var
  Serie : string;
begin
  inherited;

  AbreData(TDMRPrevisionPago, DMRPrevisionPago);
  RellenaCanales(CBCanales.Items);
  ARecargarExecute(Self);
  GBSerieKri.Visible := DMMain.EstadoKri(221) = 1;
  CBFiltraTipoEfecto.Checked := False;
  EFTipoEfectoDesde.Visible := False;
  EFTipoEfectoHasta.Visible := False;
  ETipoEfectoDesde.Visible := False;
  ETipoEfectoHasta.Visible := False;

  // Inicializo variables globales a este formulario
  Grupo := 30;
  Listado := DMRPrevisionPago.frHYPrevisionPago;
  ListadoFR3 := DMRPrevisionPago.frxHYPrevisionPago;
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

procedure TFPregPrevisionPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRPrevisionPago);
end;

procedure TFPregPrevisionPago.ARecargarExecute(Sender: TObject);
var
  VencDesde, VencHasta : TDateTime;
  DocFechaDesde, DocFechaHasta : TDateTime;
begin
  inherited;

  DTPFechaListado.Date := REntorno.FechaTrab;
  DMRPrevisionPago.Rangos(VencDesde, VencHasta, DocFechaDesde, DocFechaHasta, RGVencimiento.ItemIndex = 0);
  DTPDesde.Date := VencDesde;
  DTPHasta.Date := VencHasta;
  RGVencimiento.ItemIndex := 1;
  RGVencimientoClick(Sender);
  EFMoneda.Text := REntorno.Moneda;
  EComentario.Text := '';
  EFProveedor.Text := '-1';
  EFAcreedor.Text := '-1';
  ChkBFiltrar.Checked := False;
  EFFormaPago.Text := 'CON';
  EFFormaPago.Visible := False;
  DBEFormaPago.Visible := False;
  CBCanales.ItemIndex := REntorno.Canal;

  EFCuenta.Text := '';
  EFCuenta.Visible := (RGAgrupadoPor.ItemIndex = 5);
  ECuenta.Visible := (RGAgrupadoPor.ItemIndex = 5);
end;

procedure TFPregPrevisionPago.RGAgrupadoPorClick(Sender: TObject);
begin
  if (RGAgrupadoPor.ItemIndex = 2) then
  begin
     EFProveedor.Visible := True;
     DBEProveedor.Visible := True;
     EFAcreedor.Visible := False;
     DBEAcreedor.Visible := False;
  end
  else if (RGAgrupadoPor.ItemIndex = 3) then
  begin
     EFAcreedor.Visible := True;
     DBEAcreedor.Visible := True;
     EFProveedor.Visible := False;
     DBEProveedor.Visible := False;
  end
  else
  begin
     EFProveedor.Visible := False;
     DBEProveedor.Visible := False;
     EFAcreedor.Visible := False;
     DBEAcreedor.Visible := False;
  end;

  EFCuenta.Visible := (RGAgrupadoPor.ItemIndex = 5);
  ECuenta.Visible := (RGAgrupadoPor.ItemIndex = 5);
end;

procedure TFPregPrevisionPago.EFProveedorChange(Sender: TObject);
begin
  DMRPrevisionPago.CambiaProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFPregPrevisionPago.EFAcreedorChange(Sender: TObject);
begin
  DMRPrevisionPago.CambiaAcreedor(StrToIntDef(EFAcreedor.Text, 0));
end;

procedure TFPregPrevisionPago.RGVencimientoClick(Sender: TObject);
var
  Desde, Hasta : TDateTime;
  DocFechaDesde, DocFechaHasta : TDateTime;
begin
  DMRPrevisionPago.Rangos(Desde, Hasta, DocFechaDesde, DocFechaHasta, RGVencimiento.ItemIndex = 0);
  DTPDesde.Date := Desde;
  DTPHasta.Date := Hasta;
end;

procedure TFPregPrevisionPago.ChkBFiltrarClick(Sender: TObject);
begin
  if ChkBFiltrar.Checked then
  begin
     EFFormaPago.Visible := True;
     DBEFormaPago.Visible := True;
     EFFormaPago.SetFocus;
  end
  else
  begin
     EFFormaPago.Visible := False;
     DBEFormaPago.Visible := False;
  end;
end;

procedure TFPregPrevisionPago.EFFormaPagoChange(Sender: TObject);
begin
  DMRPrevisionPago.CambiaFormaPago(EFFormaPago.Text);
end;

procedure TFPregPrevisionPago.DTPDesdeClick(Sender: TObject);
begin
  RGVencimiento.ItemIndex := -1;
end;

procedure TFPregPrevisionPago.DTPHastaClick(Sender: TObject);
begin
  RGVencimiento.ItemIndex := -1;
end;

procedure TFPregPrevisionPago.EFCuentaChange(Sender: TObject);
begin
  inherited;
  ECuenta.Text := DameTituloCuenta(EFCuenta.Text);
end;

procedure TFPregPrevisionPago.EFTipoEfectoDesdeChange(Sender: TObject);
begin
  inherited;
  ETipoEfectoDesde.Text := DameTituloEfecto(EFTipoEfectoDesde.Text);
end;

procedure TFPregPrevisionPago.EFTipoEfectoHastaChange(Sender: TObject);
begin
  inherited;
  ETipoEfectoHasta.Text := DameTituloEfecto(EFTipoEfectoHasta.Text);
end;

procedure TFPregPrevisionPago.CBFiltraTipoEfectoClick(Sender: TObject);
begin
  inherited;
  EFTipoEfectoDesde.Visible := CBFiltraTipoEfecto.Checked;
  EFTipoEfectoHasta.Visible := CBFiltraTipoEfecto.Checked;
  ETipoEfectoDesde.Visible := CBFiltraTipoEfecto.Checked;
  ETipoEfectoHasta.Visible := CBFiltraTipoEfecto.Checked;
  if CBFiltraTipoEfecto.Checked then
     EFTipoEfectoDesde.SetFocus;
end;

procedure TFPregPrevisionPago.EFMonedaChange(Sender: TObject);
begin
  inherited;
  EMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFPregPrevisionPago.EFPaisChange(Sender: TObject);
begin
  inherited;
  EPais.Text := DameTituloPais(EFPais.Text);
end;

procedure TFPregPrevisionPago.CBFiltraPaisClick(Sender: TObject);
begin
  inherited;
  EFPais.Visible := CBFiltraPais.Checked;
  EPais.Visible := CBFiltraPais.Checked;
end;

procedure TFPregPrevisionPago.EFBancoChange(Sender: TObject);
begin
  inherited;
  EBanco.Text := DameTituloBanco(StrToIntDef(EFBanco.Text, 0));
end;

procedure TFPregPrevisionPago.CBFiltraBancoClick(Sender: TObject);
begin
  inherited;
  EFBanco.Visible := CBFiltraBanco.Checked;
  EBanco.Visible := CBFiltraBanco.Checked;
end;

procedure TFPregPrevisionPago.CBFiltraNIFClick(Sender: TObject);
begin
  inherited;
  ENIF.Visible := CBFiltraNIF.Checked;
end;

procedure TFPregPrevisionPago.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  SerieKri : string;
  Union : string;
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
  if (CBMAN.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''MAN'') OR (SERIE = ''MANA''))';
     Union := ' OR ';
  end;
  if (CBMAR.Checked) then
  begin
     SerieKri := SerieKri + Union + '((SERIE=''MAR'') OR (SERIE = ''MARA''))';
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

  if RGAgrupadoPor.ItemIndex <> 5 then
     EFCuenta.Text := '';

  DMRPrevisionPago.CalculaInforme(DTPDesde.Date, DTPHasta.Date, DTPFechaListado.Date,
     EFMoneda.Text, EComentario.Text,
     RGAgrupadoPor.ItemIndex,
     StrToIntDef(EFProveedor.Text, 0),
     StrToIntDef(EFAcreedor.Text, 0),
     ChkBFiltrar.Checked, EFFormaPago.Text, CBCanales.ItemIndex, SerieKri, CBFiltraTipoEfecto.Checked,
     EFTipoEfectoDesde.Text, EFTipoEfectoHasta.Text,
     EFCuenta.Text, CBFiltraPais.Checked, EFPais.Text, CBFiltraBanco.Checked, StrToIntDef(EFBanco.Text, 0), CBFiltraNIF.Checked, ENIF.Text,
     CBCalcularPrevisionPedidos.Checked, CBCalcularPrevisionAlbaranes.Checked);

  if (Modo = 2) then
  begin
     try
        PBExportacion.Visible := True;
        DMRPrevisionPago.ExportarExcel(Modo, PBExportacion);
     finally
        PBExportacion.Visible := False;
     end;
  end
  else
     DMRPrevisionPago.MostrarListado(Modo, RGAgrupadoPor.ItemIndex);
end;

procedure TFPregPrevisionPago.AConfigurarExecute(Sender: TObject);
begin
  case RGAgrupadoPor.ItemIndex of
     0: Grupo := 30;
     1, 2, 3: Grupo := 83;
     4: Grupo := 136;
     else
        Grupo := 0;
  end;

  inherited;
end;

procedure TFPregPrevisionPago.Previsualizar(TipoEfecto: string; DesdeVenc, HastaVenc: TDateTime);
begin
  if (Trim(TipoEfecto) <> '') then
  begin
     CBFiltraTipoEfecto.Checked := True;
     EFTipoEfectoDesde.Text := TipoEfecto;
     EFTipoEfectoHasta.Text := TipoEfecto;
  end;
  DTPDesde.Date := DesdeVenc;
  DTPHasta.Date := HastaVenc;
  APrev.Execute;
end;

end.
