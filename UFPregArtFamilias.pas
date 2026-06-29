unit UFPregArtFamilias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFDBEdit, ULFToolBar, ULFEditFind2000, rxToolEdit, ULFLabel, ULFDateEdit;

type
  TFPregArtFamilias = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtImprimir: TToolButton;
     TButtVisualizar: TToolButton;
     TButtSalir: TToolButton;
     ActionList: TLFActionList;
     ASalir: TAction;
     AVisualizar: TAction;
     AImprimir: TAction;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     GBFamilia: TGroupBox;
     EFFam: TLFEditFind2000;
     DBEFamilia: TLFDbedit;
     GBArticulos: TGroupBox;
     LDesdeArticulo: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     EFArt_Hasta: TLFEditFind2000;
     LHastaArticulo: TLFLabel;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     TButtRecargar: TToolButton;
     ARecargar: TAction;
     GBSeleccion: TGroupBox;
     EFPeriodo: TLFEditFind2000;
     DBETitPeriodo: TLFDbedit;
     DTPFechaH: TLFDateEdit;
     DTPFechaD: TLFDateEdit;
     RBPeriodos: TRadioButton;
     RBFechas: TRadioButton;
     LBFechaD: TLFLabel;
     LBFechaH: TLFLabel;
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure AVisualizarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure EFFamChange(Sender: TObject);
     procedure EFFamBusqueda(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure RBPeriodosClick(Sender: TObject);
     procedure RBFechasClick(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure EFPeriodoBusqueda(Sender: TObject);
  private
     { Private declarations }
     Fam_defecto: string;
     procedure RefreshRankArt(const Familia: string);
     procedure HabilitaSeleccion(Modo: boolean);
     procedure MostrarListado(Modo: byte);
  public
     { Public declarations }
     procedure Show_Win(const Familia: string);
  end;

var
  FPregArtFamilias : TFPregArtFamilias;

implementation

{$R *.DFM}

uses UDMLstFamilias, UEntorno, UUtiles, UFMListConfig, UDMMain;

procedure TFPregArtFamilias.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE   
  AbreData(TDMLSTFamilias, DMLSTFamilias);
end;

procedure TFPregArtFamilias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTFamilias);
  Action := caFree;
end;

// Mostrar la ventana
procedure TFPregArtFamilias.Show_Win(const Familia: string);
begin
  Fam_defecto := Familia;
  ARecargar.Execute;
  ShowModal;
end;

// Actualizar Rango de Artículos según la Familia
procedure TFPregArtFamilias.RefreshRankArt(const Familia: string);
var
  ArtDesde, ArtHasta : string;
begin
  DMLstFamilias.DameMinMaxArticulo(Familia, ArtDesde, ArtHasta);
  EFArt_Desde.Text := ArtDesde;
  EFArt_Hasta.Text := ArtHasta;
end;

procedure TFPregArtFamilias.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregArtFamilias.AVisualizarExecute(Sender: TObject);
begin
  MostrarListado(0);
end;

procedure TFPregArtFamilias.AImprimirExecute(Sender: TObject);
begin
  MostrarListado(1);
end;

procedure TFPregArtFamilias.EFArt_DesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA=''' + DMLstFamilias.Familia + '''';
end;

procedure TFPregArtFamilias.EFArt_HastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA=''' + DMLstFamilias.Familia + '''';
end;

procedure TFPregArtFamilias.EFArt_DesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstFamilias.xArtDesde, EFArt_Desde.Text);
end;

procedure TFPregArtFamilias.EFArt_HastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstFamilias.xArtHasta, EFArt_Hasta.Text);
end;

procedure TFPregArtFamilias.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(50, Formato, Cabecera, Copias,
     Pijama, '', DMLSTFamilias.frFamilias);
end;

procedure TFPregArtFamilias.EFFamChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstFamilias.xFamilia, EFFam.Text);
  RefreshRankArt(EFFam.Text);
end;

procedure TFPregArtFamilias.EFFamBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtFamilias.EFMonedaChange(Sender: TObject);
begin
  DMLstFamilias.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregArtFamilias.ARecargarExecute(Sender: TObject);
var
  FechaD, FechaH : TDateTime;
  Min, Max : string;
begin
  EFFam.Text := Fam_defecto;
  EFMoneda.Text := REntorno.Moneda;
  RBPeriodos.Checked := True;
  DameMinMax('PE1', Min, Max);
  EFPeriodo.Text := Min;
  DameMinMax('EJE', FechaD, FechaH);
  DTPFechaD.Date := FechaD;
  DTPFechaH.Date := FechaH;
end;

procedure TFPregArtFamilias.RBPeriodosClick(Sender: TObject);
begin
  HabilitaSeleccion(True);
end;

procedure TFPregArtFamilias.RBFechasClick(Sender: TObject);
begin
  RBPeriodos.Checked := False;
  HabilitaSeleccion(False);
end;

procedure TFPregArtFamilias.HabilitaSeleccion(Modo: boolean);
begin
  RBFechas.Checked := not (modo);
  DTPFechaD.Visible := not (modo);
  DTPFechaD.Enabled := not (modo);
  DTPFechaH.Visible := not (modo);
  DTPFechaH.Enabled := not (modo);
  LBFechaD.Visible := not (modo);
  LBFechaH.Visible := not (modo);

  RBPeriodos.Checked := modo;
  EFPeriodo.Visible := modo;
  DBETitPeriodo.Visible := modo;
end;

procedure TFPregArtFamilias.EFPeriodoChange(Sender: TObject);
begin
  if (EFPeriodo.Text <> '') then
     DMLstFamilias.DameTituloPeriodo(EFPeriodo.Text);
end;

procedure TFPregArtFamilias.MostrarListado(Modo: byte);
var
  FechaD, FechaH : TDateTime;
  Periodo : string;
begin
  if (RBPeriodos.Checked) then
  begin
     DMLstFamilias.DameFechasPeriodo(EFPeriodo.Text, FechaD, FechaH);
     Periodo := EFPeriodo.Text;
  end
  else
  begin
     FechaD := DTPFechaD.Date;
     FechaH := DTPFEchaH.Date;
     Periodo := '';
  end;
  DMLSTFamilias.MostrarListado(EFArt_Desde.Text, EFArt_Hasta.Text,
     Periodo, Modo, FechaD, FechaH);
end;

procedure TFPregArtFamilias.EFPeriodoBusqueda(Sender: TObject);
begin
  EFPeriodo.CondicionBusqueda := 'Empresa=' + REntorno.EmpresaStr +
     ' and Ejercicio=' + REntorno.EjercicioStr + ' and tipo <> 5';
end;

end.
