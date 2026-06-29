unit UProFMLstPresencia;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ULFLabel, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFDateEdit,
  rxPlacemnt, ULFFormStorage;

type
  TProFMLstPresencia = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     LabelFechaD: TLFLabel;
     DEFiltroFechaDesde: TLFDateEdit;
     LabelFechaH: TLFLabel;
     DEFiltroFechaHasta: TLFDateEdit;
     PNLLimites: TLFPanel;
     EFOperarioD: TLFEditFind2000;
     EOperarioD: TLFEdit;
     EOperarioH: TLFEdit;
     EFOperarioH: TLFEditFind2000;
     LDesdeOperario: TLFLabel;
     LHastaOperario: TLFLabel;
     EFCalendarioD: TLFEditFind2000;
     DescCalendarioD: TLFDbedit;
     DescCalendarioH: TLFDbedit;
     EFCalendarioH: TLFEditFind2000;
     EFHorarioD: TLFEditFind2000;
     DescHorarioD: TLFDbedit;
     DescHorarioH: TLFDbedit;
     EFHorarioH: TLFEditFind2000;
     EFIncidenciaD: TLFEditFind2000;
     DescIncidenciaD: TLFDbedit;
     DescIncidenciaH: TLFDbedit;
     EFIncidenciaH: TLFEditFind2000;
     LDesdeCalendario: TLFLabel;
     LHastaCalendario: TLFLabel;
     LDesdeHorario: TLFLabel;
     LHastaHorario: TLFLabel;
     LDesdeIncidencia: TLFLabel;
     LHastaIncidencia: TLFLabel;
     BMesAnterio: TButton;
     BEjercicio: TButton;
     BMes: TButton;
     BHoy: TButton;
     BMesSiguiente: TButton;
     procedure EFOperarioDChange(Sender: TObject);
     procedure EFOperarioHChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFCalendarioDChange(Sender: TObject);
     procedure EFCalendarioHChange(Sender: TObject);
     procedure EFHorarioDChange(Sender: TObject);
     procedure EFHorarioHChange(Sender: TObject);
     procedure EFIncidenciaDChange(Sender: TObject);
     procedure EFIncidenciaHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BEjercicioClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BMesAnterioClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure BHoyClick(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  ProFMLstPresencia : TProFMLstPresencia;

implementation

uses UProDMLstPresencia, UFormGest, UDMMain, FIBQuery, UEntorno, UUtiles{, DateUtils}, UDameDato;

{$R *.dfm}

procedure TProFMLstPresencia.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLstPresencia, ProDMLstPresencia);
  PNLTop.Visible := True;

  Grupo := 8054;
  Listado := ProDMLstPresencia.frPresencia;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Sender);
  TDPFechaListado.Date := Date;
end;

procedure TProFMLstPresencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstPresencia);
end;

procedure TProFMLstPresencia.EFOperarioDChange(Sender: TObject);
begin
  inherited;
  EOperarioD.Text := DameTituloEmpleado(StrToIntDef(EFOperarioD.Text, 0));
end;

procedure TProFMLstPresencia.EFOperarioHChange(Sender: TObject);
begin
  inherited;
  EOperarioH.Text := DameTituloEmpleado(StrToIntDef(EFOperarioH.Text, 0));
end;

procedure TProFMLstPresencia.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  inherited;
  ProDMLstPresencia.MostrarListado(Modo, StrToInt(EFOperarioD.Text),
     StrToInt(EFOperarioH.Text), DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date,
     EFHorarioD.Text, EFHorarioH.Text, StrToInt(EFIncidenciaD.Text),
     StrToInt(EFIncidenciaH.Text), StrToInt(EFCalendarioD.Text),
     StrToInt(EFCalendarioH.Text), EComentario.Text, TDPFechaListado.Date);
end;

procedure TProFMLstPresencia.EFCalendarioDChange(Sender: TObject);
begin
  inherited;
  if (EFCalendarioD.Text <> '') then
     ProDMLstPresencia.CambiaCalendarioD(StrToInt(EFCalendarioD.Text));
end;

procedure TProFMLstPresencia.EFCalendarioHChange(Sender: TObject);
begin
  inherited;
  if (EFCalendarioH.Text <> '') then
     ProDMLstPresencia.CambiaCalendarioH(StrToInt(EFCalendarioH.Text));
end;

procedure TProFMLstPresencia.EFHorarioDChange(Sender: TObject);
begin
  inherited;
  if (EFHorarioD.Text <> '') then
     ProDMLstPresencia.CambiaHorarioD(EFHorarioD.Text);
end;

procedure TProFMLstPresencia.EFHorarioHChange(Sender: TObject);
begin
  inherited;
  if (EFHorarioH.Text <> '') then
     ProDMLstPresencia.CambiaHorarioH(EFHorarioH.Text);
end;

procedure TProFMLstPresencia.EFIncidenciaDChange(Sender: TObject);
begin
  inherited;
  if (EFIncidenciaD.Text <> '') then
     ProDMLstPresencia.CambiaIncidenciaD(StrToInt(EFIncidenciaD.Text));
end;

procedure TProFMLstPresencia.EFIncidenciaHChange(Sender: TObject);
begin
  inherited;
  if (EFIncidenciaH.Text <> '') then
     ProDMLstPresencia.CambiaIncidenciaH(StrToInt(EFIncidenciaH.Text));
end;

procedure TProFMLstPresencia.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
  sMin, sMax : string;
begin
  inherited;

  // Operario
  DameMinMax('EMP', Min, Max);
  EFOperarioD.Text := IntToStr(Min);
  EFOperarioH.Text := IntToStr(Max);

  DameMinMax('CAL', Min, Max);
  EFCalendarioD.Text := IntToStr(Min);
  EFCalendarioH.Text := IntToStr(Max);

  DameMinMax('HOR', sMin, sMax);
  EFHorarioD.Text := sMin;
  EFHorarioH.Text := sMax;

  DameMinMax('TIN', Min, Max);
  EFIncidenciaD.Text := IntToStr(Min);
  EFIncidenciaH.Text := IntToStr(Max);

  BMes.Click;
end;

procedure TProFMLstPresencia.BEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'EJE');
end;

procedure TProFMLstPresencia.BMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'MES');
end;

procedure TProFMLstPresencia.BMesAnterioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'M-');
end;

procedure TProFMLstPresencia.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'M+');
end;

procedure TProFMLstPresencia.BHoyClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'DIA');
end;

end.
