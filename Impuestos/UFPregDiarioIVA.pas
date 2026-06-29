unit UFPregDiarioIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, rxToolEdit,
  ULFPanel, ULFDBEdit, ULFComboBox, ULFEdit, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, TFlatCheckBoxUnit, ULFCheckBox, UFPEditListadoSimple,
  Buttons;

type
  TFPregDiarioIVA = class(TFPEditListadoSimple)
     GBListado: TGroupBox;
     ETituloListado: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     LFechaListado: TLFLabel;
     LTituloListado: TLFLabel;
     RGFacturas: TRadioGroup;
     CBTipoOperacion: TLFComboBox;
     GBFiltros: TGroupBox;
     TButtConfigurar: TToolButton;
     RGOrden: TRadioGroup;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPFecha_Desde: TLFDateEdit;
     DTPFecha_Hasta: TLFDateEdit;
     LDesdeFactura: TLFLabel;
     LHastaFactura: TLFLabel;
     EFFras_Desde: TLFEditFind2000;
     EFFras_Hasta: TLFEditFind2000;
     BEjercicio: TSpeedButton;
     BMes: TSpeedButton;
     PNLLimites: TLFPanel;
     LTipoOperacion: TLFLabel;
     PNLOtros: TLFPanel;
     CBPorFechas: TLFCheckBox;
     CBPorNumeroFactura: TLFCheckBox;
     CBPorSeries: TLFCheckBox;
     EFSerie: TLFEditFind2000;
     ETituloSerie: TLFEdit;
     CBTodasSeries: TLFCheckBox;
     LSerie: TLFLabel;
     CBPorTipoIVA: TLFCheckBox;
     BMesAnterior: TSpeedButton;
     BMesSiguiente: TSpeedButton;
     BEjercicioAnterior: TSpeedButton;
     BEjercicioSiguiente: TSpeedButton;
     BTrimestre1: TSpeedButton;
     BTrimestre2: TSpeedButton;
     BTrimestre3: TSpeedButton;
     BTrimestre4: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFFras_DesdeBusqueda(Sender: TObject);
     procedure EFFras_HastaBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBTodasSeriesClick(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure CBPorFechasClick(Sender: TObject);
     procedure CBPorNumeroFacturaClick(Sender: TObject);
     procedure HabilitaLimites;
     procedure CBPorFechasChange(Sender: TObject);
     procedure CBPorNumeroFacturaChange(Sender: TObject);
     procedure BMesAnteriorClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure CBPorTipoIVAChange(Sender: TObject);
     procedure CBPorSeriesClick(Sender: TObject);
     procedure BEjercicioAnteriorClick(Sender: TObject);
     procedure BEjercicioSiguienteClick(Sender: TObject);
     procedure BTrimestre1Click(Sender: TObject);
     procedure BTrimestre2Click(Sender: TObject);
     procedure BTrimestre3Click(Sender: TObject);
     procedure BTrimestre4Click(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
     procedure HabilitaFiltros;
  public
     { Public declarations }
  end;

var
  FPregDiarioIVA : TFPregDiarioIVA;

implementation

uses UDMMain, UDMRDiarioIVA, UEntorno, UFormGest, UFMListConfig, DateUtils, UUtiles, UDameDato;

{$R *.DFM}

procedure TFPregDiarioIVA.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRDiarioIVA, DMRDiarioIVA);

  // Inicializamos algunos valores
  CBTipoOperacion.ItemIndex := 3; // Todas
  RGFacturas.ItemIndex := 0; // Emitidas

  ARecargarExecute(Sender);

  CBPorFechas.Checked := True;
  HabilitaLimites;
  CBPorSeries.Checked := True;
  HabilitaFiltros;

  Grupo := 3;
  Listado := DMRDiarioIVA.frDiarioIVA;
  ListadoFR3 := DMRDiarioIVA.frxDiarioIVA;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  // Asignacion de imagenes a botones
  GetBitmapFromImageList(BEjercicioAnterior, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(BEjercicioAnterior, 2, DMMain.ILMain_In, 51);
  GetBitmapFromImageList(BEjercicio, 1, DMMain.ILMain_Ac, 50);
  GetBitmapFromImageList(BEjercicio, 2, DMMain.ILMain_In, 50);
  GetBitmapFromImageList(BEjercicioSiguiente, 1, DMMain.ILMain_Ac, 25);
  GetBitmapFromImageList(BEjercicioSiguiente, 2, DMMain.ILMain_In, 25);
  GetBitmapFromImageList(BMesAnterior, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(BMesAnterior, 2, DMMain.ILMain_In, 51);
  GetBitmapFromImageList(BMes, 1, DMMain.ILMain_Ac, 9);
  GetBitmapFromImageList(BMes, 2, DMMain.ILMain_In, 9);
  GetBitmapFromImageList(BMesSiguiente, 1, DMMain.ILMain_Ac, 25);
  GetBitmapFromImageList(BMesSiguiente, 2, DMMain.ILMain_In, 25);
  GetBitmapFromImageList(BTrimestre1, 1, DMMain.ILMain_Ac, 134);
  GetBitmapFromImageList(BTrimestre1, 2, DMMain.ILMain_In, 134);
  GetBitmapFromImageList(BTrimestre2, 1, DMMain.ILMain_Ac, 134);
  GetBitmapFromImageList(BTrimestre2, 2, DMMain.ILMain_In, 134);
  GetBitmapFromImageList(BTrimestre3, 1, DMMain.ILMain_Ac, 134);
  GetBitmapFromImageList(BTrimestre3, 2, DMMain.ILMain_In, 134);
  GetBitmapFromImageList(BTrimestre4, 1, DMMain.ILMain_Ac, 134);
  GetBitmapFromImageList(BTrimestre4, 2, DMMain.ILMain_In, 134);
end;

procedure TFPregDiarioIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRDiarioIVA);
end;

procedure TFPregDiarioIVA.EFSerieChange(Sender: TObject);
begin
  if CBTodasSeries.Checked then
  begin
     DMRDiarioIVA.Serie := 'TODAS';
     EFSerie.Text := '';
     ETituloSerie.Text := _('Todas');
  end
  else
  begin
     DMRDiarioIVA.Serie := EFSerie.Text;
     ETituloSerie.Text := DameTituloSerie(EFSerie.Text);
  end;
end;

procedure TFPregDiarioIVA.EFFras_DesdeBusqueda(Sender: TObject);
begin
  // Emitidas || IVA (R)epercutido
  if RGFacturas.ItemIndex = 0 then
     EFFras_Desde.CondicionBusqueda := 'SIGNO = ''R'' AND DOC_SERIE=''' + EFSerie.Text + ''''
  else // Recibidas || IVA (S)oportado
     EFFras_Desde.CondicionBusqueda := 'SIGNO = ''S'' AND DOC_SERIE=''' + EFSerie.Text + '''';
end;

procedure TFPregDiarioIVA.EFFras_HastaBusqueda(Sender: TObject);
begin
  // Emitidas || IVA (R)epercutido
  if RGFacturas.ItemIndex = 0 then
     EFFras_Hasta.CondicionBusqueda := 'SIGNO = ''R'' AND DOC_SERIE=''' + EFSerie.Text + ''''
  else // Recibidas || IVA (S)oportado
     EFFras_Hasta.CondicionBusqueda := 'SIGNO = ''S'' AND DOC_SERIE=''' + EFSerie.Text + '''';
end;

procedure TFPregDiarioIVA.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  AuxSigno : string;
  AuxTipo : integer;
  Titulo : string;
  AuxTitulo : string;
begin
  AuxTipo := 0;
  // Obtenemos el signo y el título del listado
  if RGFacturas.ItemIndex = 0 then // Emitidas || IVA (R)epercutido
  begin
     AuxSigno := 'R';
     AuxTitulo := _('EMITIDAS');
  end
  else // Recibidas || IVA (S)oportado
  begin
     AuxSigno := 'S';
     AuxTitulo := _('RECIBIDAS');
  end;

  // Determinación del Tipo de IVA
  case CBTipoOperacion.ItemIndex of
     0: AuxTipo := 0;  // Nacional
     1: AuxTipo := 1;  // Intracomunitario
     2: AuxTipo := 2;  // Extranjero
     3: AuxTipo := -1; // Todos los tipos
  end;

  with DMRDiarioIVA do
  begin
     sSigno := AuxSigno;
     sTipo := AuxTipo;

     CalculaInforme(StrToIntDef(EFFras_Desde.Text, 0), StrToIntDef(EFFras_Hasta.Text, 0),
        DTPFecha_Desde.Date, DTPFecha_Hasta.Date, RGOrden.ItemIndex, CBPorFechas.Checked, CBPorSeries.Checked);
  end;

  // Imprimir o previsualizar
  Titulo := ETituloListado.Text + ' ' + AuxTitulo;

  DMRDiarioIVA.MostrarInforme(Modo, Grupo, Titulo, DTPFechaListado.Date);
end;

procedure TFPregDiarioIVA.ARecargarExecute(Sender: TObject);
begin
  DMRDiarioIVA.Rangos;

  // Obtenemos los valores por defecto
  DTPFechaListado.Date := DMRDiarioIVA.Fecha_Lista;
  DTPFecha_Desde.Date := DMRDiarioIVA.FechaDesde;
  DTPFecha_Hasta.Date := DMRDiarioIVA.FechaHasta;
  EFSerie.Text := DMRDiarioIVA.Serie;
  EFFras_Desde.Text := IntToStr(DMRDiarioIVA.FraDesde);
  EFFras_Hasta.Text := IntToStr(DMRDiarioIVA.FraHasta);
  RGOrden.ItemIndex := 1;
end;

procedure TFPregDiarioIVA.CBTodasSeriesClick(Sender: TObject);
begin
  EFSerieChange(Sender);
end;

procedure TFPregDiarioIVA.BEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'EJE');
end;

procedure TFPregDiarioIVA.BMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'MES');
end;

procedure TFPregDiarioIVA.CBPorFechasClick(Sender: TObject);
begin
  inherited;
  CBPorNumeroFactura.Checked := not CBPorFechas.Checked;
end;

procedure TFPregDiarioIVA.CBPorNumeroFacturaClick(Sender: TObject);
begin
  inherited;
  CBPorFechas.Checked := not CBPorNumeroFactura.Checked;
end;

procedure TFPregDiarioIVA.HabilitaLimites;
begin
  DTPFecha_Desde.Enabled := CBPorFechas.Checked;
  DTPFecha_Hasta.Enabled := CBPorFechas.Checked;
  EFFras_Desde.Enabled := CBPorNumeroFactura.Checked;
  EFFras_Hasta.Enabled := CBPorNumeroFactura.Checked;
  BEjercicio.Enabled := CBPorFechas.Checked;
  BMes.Enabled := CBPorFechas.Checked;
  BMesAnterior.Enabled := CBPorFechas.Checked;
  BMesSiguiente.Enabled := CBPorFechas.Checked;
  BEjercicioAnterior.Enabled := CBPorFechas.Checked;
  BEjercicioSiguiente.Enabled := CBPorFechas.Checked;
  BMesAnterior.Enabled := CBPorFechas.Checked;
  BMesSiguiente.Enabled := CBPorFechas.Checked;
  BTrimestre1.Enabled := CBPorFechas.Checked;
  BTrimestre2.Enabled := CBPorFechas.Checked;
  BTrimestre3.Enabled := CBPorFechas.Checked;
  BTrimestre4.Enabled := CBPorFechas.Checked;
end;

procedure TFPregDiarioIVA.CBPorFechasChange(Sender: TObject);
begin
  inherited;
  HabilitaLimites;
end;

procedure TFPregDiarioIVA.CBPorNumeroFacturaChange(Sender: TObject);
begin
  inherited;
  HabilitaLimites;
end;

procedure TFPregDiarioIVA.BMesAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'M-');
end;

procedure TFPregDiarioIVA.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'M+');
end;

procedure TFPregDiarioIVA.CBPorTipoIVAChange(Sender: TObject);
begin
  inherited;
  CBPorSeries.Checked := not CBPorTipoIVA.Checked;
  HabilitaFiltros;
end;

procedure TFPregDiarioIVA.CBPorSeriesClick(Sender: TObject);
begin
  inherited;
  CBPorTipoIVA.Checked := not CBPorSeries.Checked;
  HabilitaFiltros;
end;

procedure TFPregDiarioIVA.HabilitaFiltros;
begin
  EFSerie.Enabled := CBPorSeries.Checked;
  ETituloSerie.Enabled := CBPorSeries.Checked;
  CBTodasSeries.Enabled := CBPorSeries.Checked;

  if CBPorSeries.Checked then
  begin
     Grupo := 3;
  end;

  if CBPorTipoIVA.Checked then
  begin
     DMRDiarioIVA.Serie := 'TODAS';
     Grupo := 206;
  end;
end;

procedure TFPregDiarioIVA.BEjercicioAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'E-');
end;

procedure TFPregDiarioIVA.BEjercicioSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'E+');
end;

procedure TFPregDiarioIVA.BTrimestre1Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'T1');
end;

procedure TFPregDiarioIVA.BTrimestre2Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'T2');
end;

procedure TFPregDiarioIVA.BTrimestre3Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'T3');
end;

procedure TFPregDiarioIVA.BTrimestre4Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPFecha_Desde, DTPFecha_Hasta, 'T4');
end;

end.
