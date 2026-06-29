unit UFMLSTIva;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, Grids, DBGrids, UControlEdit,
  UFormGest, ActnList, Mask, rxToolEdit, ULFActionList, ULFCheckBox,
  ULFToolBar, ULFEdit, ULFPanel, TFlatCheckBoxUnit, ULFLabel, ULFDateEdit,
  UFPEditListado, rxPlacemnt, ULFFormStorage, ULFPageControl, UFPEditListadoSimple,
  Buttons;

type
  TFMLSTIva = class(TFPEditListadoSimple)
     RGSignoIVA: TRadioGroup;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     TButtConfigurar: TToolButton;
     ButtComprueba: TToolButton;
     ACompruebaIvaRep: TAction;
     RGOrden: TRadioGroup;
     GBOpciones: TGroupBox;
     ChkBMostrarTotal: TLFCheckBox;
     PNLBottom: TLFPanel;
     CBSepararNegativos: TLFCheckBox;
     PNLLimites: TLFPanel;
     LDesdeRegistro: TLFLabel;
     EDTRegDesde: TLFEdit;
     EDTRegHasta: TLFEdit;
     LHastaRegistro: TLFLabel;
     CBPorFechas: TLFCheckBox;
     CBPorNumeroFactura: TLFCheckBox;
     BEjercicio: TSpeedButton;
     BMes: TSpeedButton;
     BMesAnterior: TSpeedButton;
     BMesSiguiente: TSpeedButton;
     BEjercicioAnterior: TSpeedButton;
     BEjercicioSiguiente: TSpeedButton;
     BTrimestre1: TSpeedButton;
     BTrimestre2: TSpeedButton;
     BTrimestre3: TSpeedButton;
     BTrimestre4: TSpeedButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure RGSignoIVAClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure ACompruebaIvaRepExecute(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BMesAnteriorClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure HabilitaLimites;
     procedure CBPorFechasChange(Sender: TObject);
     procedure CBPorNumeroFacturaChange(Sender: TObject);
     procedure CBPorFechasClick(Sender: TObject);
     procedure CBPorNumeroFacturaClick(Sender: TObject);
     procedure BEjercicioAnteriorClick(Sender: TObject);
     procedure BEjercicioSiguienteClick(Sender: TObject);
     procedure BTrimestre1Click(Sender: TObject);
     procedure BTrimestre2Click(Sender: TObject);
     procedure BTrimestre3Click(Sender: TObject);
     procedure BTrimestre4Click(Sender: TObject);
  private
     { Private declarations }
     Signo: string;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure EstablecerDefectoIva(Tipo: string);
  end;

var
  FMLSTIva : TFMLSTIva;

implementation

uses UDMLSTIva, UFMListConfig, UDMListados, UUtiles, UDMMain, DateUtils, UEntorno;

{$R *.DFM}

procedure TFMLSTIva.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLSTIva, DMLSTIva);

  // Ponemos los valores por defecto
  ARecargarExecute(Sender);

  Grupo := 2;
  Listado := DMLSTIva.frIVARepercutido;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := DMLSTIva.frxIVARepercutido;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  CBPorFechas.Checked := True;
  HabilitaLimites;

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

procedure TFMLSTIva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTIva);
end;

procedure TFMLSTIva.RGSignoIVAClick(Sender: TObject);
var
  FechaDesde, FechaHasta : TDateTime;
  Min, Max : integer;
begin
  if RGSignoIva.ItemIndex = 0 then
     Signo := 'R'
  else
     Signo := 'S';

  // Calculamos las fechas y registros mínimos y máximos para ese signo
  DMLstIva.DameFechas(Signo, FechaDesde, FechaHasta);
  DMLstIva.DameRegistros(Signo, Min, Max);

  // Asignamos los datos obtenidos a los campos
  DTPDesde.Date := FechaDesde;
  DTPHasta.Date := FechaHasta;

  EDTRegDesde.Text := IntToStr(Min);
  EDTRegHasta.Text := IntToStr(Max);
end;

procedure TFMLstIva.EstablecerDefectoIva(Tipo: string);
begin
  if Tipo = 'S' then
     RGSignoIva.ItemIndex := 1
  else
     RGSignoIva.ItemIndex := 0;

  Signo := Tipo;
end;

procedure TFMLSTIva.ARecargarExecute(Sender: TObject);
begin
  // Establecemos los valores por defecto
  Signo := 'R';
  EstablecerDefectoIva(Signo);
  CBPorFechas.Checked := True;
  RGOrden.ItemIndex := 1;
  ChkBMostrarTotal.Checked := False;
end;

procedure TFMLSTIva.ACompruebaIvaRepExecute(Sender: TObject);
begin
  DMLstIva.CompruebaIVA(DTPDesde.Date, DTPHasta.Date);
end;

procedure TFMLSTIva.BEjercicioClick(Sender: TObject);
begin
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'EJE');
end;

procedure TFMLSTIva.BMesClick(Sender: TObject);
begin
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'MES');
end;

procedure TFMLSTIva.BMesAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'M-');
end;

procedure TFMLSTIva.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'M+');
end;

procedure TFMLSTIva.HabilitaLimites;
begin
  DTPDesde.Enabled := CBPorFechas.Checked;
  DTPHasta.Enabled := CBPorFechas.Checked;
  EDTRegDesde.Enabled := CBPorNumeroFactura.Checked;
  EDTRegHasta.Enabled := CBPorNumeroFactura.Checked;
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

procedure TFMLSTIva.CBPorFechasChange(Sender: TObject);
begin
  inherited;
  HabilitaLimites;
end;

procedure TFMLSTIva.CBPorNumeroFacturaChange(Sender: TObject);
begin
  inherited;
  HabilitaLimites;
end;

procedure TFMLSTIva.CBPorFechasClick(Sender: TObject);
begin
  inherited;
  CBPorNumeroFactura.Checked := not CBPorFechas.Checked;
end;

procedure TFMLSTIva.CBPorNumeroFacturaClick(Sender: TObject);
begin
  inherited;
  CBPorFechas.Checked := not CBPorNumeroFactura.Checked;
end;

procedure TFMLSTIva.BEjercicioAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'E-');
end;

procedure TFMLSTIva.BEjercicioSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'E+');
end;

procedure TFMLSTIva.BTrimestre1Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'T1');
end;

procedure TFMLSTIva.BTrimestre2Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'T2');
end;

procedure TFMLSTIva.BTrimestre3Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'T3');
end;

procedure TFMLSTIva.BTrimestre4Click(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DTPDesde, DTPHasta, 'T4');
end;

procedure TFMLSTIva.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  FDesde, FHasta : TDateTime;
  RDesde, RHasta : integer;
begin
  FDesde := RecodeTime(DTPDesde.Date, 0, 0, 0, 0);
  FHasta := RecodeTime(DTPHasta.Date, 23, 59, 59, 999);
  RDesde := StrToIntDef(EDTRegDesde.Text, 0);
  RHasta := StrToIntDef(EDTRegHasta.Text, 0);

  DMLSTIva.MostrarListado(FDesde, FHasta, RDesde, RHasta, Signo, RGOrden.ItemIndex,
     CBPorFechas.Checked, ChkBMostrarTotal.Checked, Modo, CBSepararNegativos.Checked);
end;

end.
