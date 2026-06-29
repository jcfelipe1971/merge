unit UFPregCobrosVencidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, DBCtrls,
  ULFDBEdit, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, Mask, rxToolEdit, ULFLabel, ULFComboBox,
  TFlatCheckBoxUnit, ULFCheckBox, ULFEdit, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TFPregCobrosVencidos = class(TFPEditListado)
     TSClientes: TTabSheet;
     TSProAcre: TTabSheet;
     PNProvAcr: TLFPanel;
     PNClientes: TLFPanel;
     GBAcreedores: TGroupBox;
     LDesdeAcreedor: TLFLabel;
     LHastaAcreedor: TLFLabel;
     ETituloAcreedorDesde: TLFEdit;
     ETituloAcreedorHasta: TLFEdit;
     GBTitulo: TGroupBox;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EFCliDesde: TLFEditFind2000;
     EFCliHasta: TLFEditFind2000;
     ETituloClienteDesde: TLFEdit;
     ETituloClienteHasta: TLFEdit;
     GBProveedores: TGroupBox;
     LBProvdesde: TLFLabel;
     LBProvHasta: TLFLabel;
     EFProvDesde: TLFEditFind2000;
     EFProvHasta: TLFEditFind2000;
     ETituloProveedorDesde: TLFEdit;
     ETituloProveedorHasta: TLFEdit;
     LBProAcre: TLFLabel;
     EFAcrDesde: TLFEditFind2000;
     EFAcrHasta: TLFEditFind2000;
     PNFormulario: TLFPanel;
     PNFechas: TLFPanel;
     GBFechasProv: TGroupBox;
     LBLHastaProv: TLFLabel;
     DEFechaCalculo: TLFDateEdit;
     GBFechasVTO: TGroupBox;
     LDesdeVencimiento: TLFLabel;
     LHastaVencimiento: TLFLabel;
     DEFechaD: TLFDateEdit;
     DEFechaH: TLFDateEdit;
     GBOpciones: TGroupBox;
     LBTipoListado: TLFLabel;
     LMoneda: TLFLabel;
     LFechaListado: TLFLabel;
     LComentario: TLFLabel;
     CBProACr: TLFComboBox;
     CBMoneda: TLFCheckBox;
     EFMoneda: TLFEditFind2000;
     ETituloMoneda: TLFEdit;
     DEFechaLst: TLFDateEdit;
     EComentario: TLFEdit;
     TButtConfigurar: TToolButton;
     GBFP: TGroupBox;
     CBFP: TLFCheckBox;
     EFFormaPago: TLFEditFind2000;
     ETituloFormaPago: TLFEdit;
     GBSerieKri: TGroupBox;
     CBBC: TLFCheckBox;
     CBIR: TLFCheckBox;
     CBSE: TLFCheckBox;
     CBGJ: TLFCheckBox;
     CBMAR: TLFCheckBox;
     CBGAS: TLFCheckBox;
     CBAgrup: TLFCheckBox;
     LOrdenadoPorKri: TLFLabel;
     CBOrdenadoPorKri: TLFComboBox;
     LZona: TLFLabel;
     ETituloZona: TLFEdit;
     DBEFZona: TLFEditFind2000;
     CBTodosLosCanal: TLFCheckBox;
     procedure ARecargarExecute(Sender: TObject);
     procedure AbreTab(Sender: TObject);
     procedure EFCliDesdeChange(Sender: TObject);
     procedure EFCliHastaChange(Sender: TObject);
     procedure EFProvDesdeChange(Sender: TObject);
     procedure EFProvHastaChange(Sender: TObject);
     procedure EFAcrDesdeChange(Sender: TObject);
     procedure EFAcrHastaChange(Sender: TObject);
     procedure CBProACrChange(Sender: TObject);
     procedure CBMonedaClick(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure CBFPClick(Sender: TObject);
     procedure EFFormaPagoChange(Sender: TObject);
     procedure DBEFZona_Change(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure CargaCliProAge(Modo: integer);
     procedure Carga(Indice: integer);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregCobrosVencidos : TFPregCobrosVencidos;

implementation

uses UDMLstCobrosVencidos, UDMMain, UEntorno, UFormGest, UDMListados,
  UFMListConfig, UDameDato;

{$R *.dfm}

procedure TFPregCobrosVencidos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstCobrosVencidos, DMLstCobrosVencidos);
  PCMain.ActivePage := TSClientes;
  GBSerieKri.Visible := DMMain.EstadoKri(221) = 1;

  Grupo := 513;
  Listado := DMLstCobrosVencidos.frCobros;
  ListadoFR3 := DMLstCobrosVencidos.frxCobros;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregCobrosVencidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstCobrosVencidos);
end;

procedure TFPregCobrosVencidos.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Carga(PCMain.TabIndex);
end;

procedure TFPregCobrosVencidos.Carga(Indice: integer);
begin
  CBProACr.ItemIndex := 0;
  LBTipoListado.Visible := (1 = indice);
  CBProACr.Visible := (1 = indice);
  CBMoneda.Checked := (1 = indice);
  DEFechaCalculo.Date := REntorno.FechaTrabSH;
  DEFechaLst.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
  EFMoneda.Text := REntorno.MonedaEmpresa;
  if (indice = 0) then
     CBMoneda.Caption := _('Moneda origen del cliente')
  else
     CBMoneda.Caption := _('Moneda origen del Prov./Acr.');
  CargaCliProAge(Indice);
  DMLstCobrosVencidos.ClienteProveedor := Indice;
  CBFP.State := cbUnchecked;
  CBFPClick(CBFP);
end;

procedure TFPregCobrosVencidos.CargaCliProAge(modo: integer);
begin
  case modo of
     0:
     begin
        EFCliDesde.Text := IntToStr(DMLstCobrosVencidos.DameMinCliProAge(0));
        EFCliHasta.Text := IntToStr(DMLstCobrosVencidos.DameMinCliProAge(1));
     end;
     1:
     begin
        EFProvDesde.Text := IntToStr(DMLstCobrosVencidos.DameMinCliProAge(2));
        EFProvHasta.Text := IntToStr(DMLstCobrosVencidos.DameMinCliProAge(3));
        EFAcrDesde.Text := IntToStr(DMLstCobrosVencidos.DameMinCliProAge(4));
        EFAcrHasta.Text := IntToStr(DMLstCobrosVencidos.DameMinCliProAge(5));
     end;
  end;
  DEFechaD.Date := DMLstCobrosVencidos.DameMaxMinVTO(modo, 0);
  DEFechaH.Date := DMLstCobrosVencidos.DameMaxMinVTO(modo, 1);
end;

procedure TFPregCobrosVencidos.AbreTab(Sender: TObject);
begin
  inherited;
  Carga(PCMain.TabIndex);
end;

procedure TFPregCobrosVencidos.EFCliDesdeChange(Sender: TObject);
begin
  inherited;
  ETituloClienteDesde.Text := DameTituloCliente(StrToIntDef(EFCliDesde.Text, 0));
end;

procedure TFPregCobrosVencidos.EFCliHastaChange(Sender: TObject);
begin
  inherited;
  ETituloClienteHasta.Text := DameTituloCliente(StrToIntDef(EFCliHasta.Text, 0));
end;

procedure TFPregCobrosVencidos.EFProvDesdeChange(Sender: TObject);
begin
  inherited;
  ETituloProveedorDesde.Text := DameTituloProveedor(StrToIntDef(EFProvDesde.Text, 0));
end;

procedure TFPregCobrosVencidos.EFProvHastaChange(Sender: TObject);
begin
  inherited;
  ETituloProveedorHasta.Text := DameTituloProveedor(StrToIntDef(EFProvHasta.Text, 0));
end;

procedure TFPregCobrosVencidos.EFAcrDesdeChange(Sender: TObject);
begin
  inherited;
  ETituloAcreedorDesde.Text := DameTituloProveedor(StrToIntDef(EFAcrDesde.Text, 0));
end;

procedure TFPregCobrosVencidos.EFAcrHastaChange(Sender: TObject);
begin
  inherited;
  ETituloAcreedorDesde.Text := DameTituloProveedor(StrToIntDef(EFAcrDesde.Text, 0));
end;

procedure TFPregCobrosVencidos.CBProACrChange(Sender: TObject);
begin
  inherited;
  if (CBProAcr.ItemIndex = 2) then
  begin
     GBAcreedores.Enabled := True;
     GBProveedores.Enabled := True;
  end
  else
  begin
     GBAcreedores.Enabled := (CBProAcr.ItemIndex = 1);
     GBProveedores.Enabled := (CBProAcr.ItemIndex = 0);
  end;
end;

procedure TFPregCobrosVencidos.CBMonedaClick(Sender: TObject);
begin
  inherited;
  EFMoneda.Visible := not (CBMoneda.Checked);
  ETituloMoneda.Visible := not (CBMoneda.Checked);
  LMoneda.Visible := not (CBMoneda.Checked);
end;

procedure TFPregCobrosVencidos.EFMonedaChange(Sender: TObject);
begin
  inherited;
  ETituloMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFPregCobrosVencidos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  monedaentidad : integer;
  SerieKri : string;
  Union : string;
  Canal : integer;
begin
  SerieKri := '';
  if (CBTodosLosCanal.Checked) then
     Canal := 0
  else
     Canal := REntorno.Canal;

  Union := '(';
  if (CBBC.Checked) then
  begin
     SerieKri := SerieKri + Union + 'DOC_SERIE=''BC''';
     Union := ' OR ';
  end;
  if (CBIR.Checked) then
  begin
     SerieKri := SerieKri + Union + 'DOC_SERIE=''IR''';
     Union := ' OR ';
  end;
  if (CBSE.Checked) then
  begin
     SerieKri := SerieKri + Union + 'DOC_SERIE=''SE''';
     Union := ' OR ';
  end;
  if (CBGJ.Checked) then
  begin
     SerieKri := SerieKri + Union + 'DOC_SERIE=''GJ''';
     Union := ' OR ';
  end;
  if (CBMAR.Checked) then
  begin
     SerieKri := SerieKri + Union + 'DOC_SERIE=''MAR''';
     Union := ' OR ';
  end;
  if (CBGAS.Checked) then
  begin
     SerieKri := SerieKri + Union + 'DOC_SERIE=''GAS''';
     Union := ' OR ';
  end;
  if (CBAgrup.Checked) then
  begin
     SerieKri := SerieKri + Union + 'DOC_SERIE=''''';
     Union := ' OR ';
  end;
  if (Length(SerieKri) > 1) then
     SerieKri := SerieKri + ')';

  if (CBMoneda.Checked) then
     monedaentidad := 1
  else
     monedaentidad := 0;
  AbreData(TDMListados, DMListados);
  DMLstCobrosVencidos.MostrarListado(DEFechaD.Date, DEFechaH.Date, DEFechaCalculo.Date, DEFechaLst.Date, monedaentidad, PCMain.TabIndex, CBProACr.ItemIndex, StrToInt(EFCliDesde.Text), StrToIntDef(EFCliHasta.Text, 0), StrToIntDef(EFProvDesde.Text, 0), StrToIntDef(EFProvHasta.Text, 0),
     StrToIntDef(EFAcrDesde.Text, 0), StrToIntDef(EFAcrHasta.Text, 0), EFMoneda.Text, EComentario.Text, EFFormaPago.Text, Modo, Ord(CBFP.State), SerieKri, DBEFZona.Text, CBOrdenadoPorKri.ItemIndex, Canal);
  CierraData(DMListados);
end;

procedure TFPregCobrosVencidos.CBFPClick(Sender: TObject);
begin
  inherited;
  EFFormaPago.Enabled := (CBFP.State = cbChecked);

  if (CBFP.State = cbChecked) then
     EFFormaPago.Text := DMLstCobrosVencidos.DameMinFP
  else
     EFFormaPago.Text := '';
end;

procedure TFPregCobrosVencidos.EFFormaPagoChange(Sender: TObject);
begin
  inherited;
  ETituloFormaPago.Text := DameTituloFormaPago(EFFormaPago.Text);
end;

procedure TFPregCobrosVencidos.DBEFZona_Change(Sender: TObject);
begin
  inherited;
  ETituloZona.Text := DameTituloZona(DBEFZona.Text);
end;

end.
