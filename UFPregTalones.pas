unit UFPregTalones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFDBEdit, ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel,
  Grids, DBGrids, NsDBGrid, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFPregTalones = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtImprimir: TToolButton;
     TButtVisualizar: TToolButton;
     TButtSalir: TToolButton;
     PNLListArt: TLFPanel;
     LblTalonDesde: TLFLabel;
     LBLTalonHasta: TLFLabel;
     EFTalon_Desde: TLFEditFind2000;
     EFTalon_Hasta: TLFEditFind2000;
     DBETalonDesde: TLFDbedit;
     DBETalonHasta: TLFDbedit;
     ActionList1: TLFActionList;
     ASalir: TAction;
     AVisualizar: TAction;
     AImprimir: TAction;
     TButtConfigurar: TToolButton;
     CBMostrarNoContabilizadosKri: TLFCheckBox;
     PNLSeleccionTalones: TLFPanel;
     PNLRenumeracion: TLFPanel;
     DBGRenumeracionTalones: TDBGridFind2000;
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTalon_DesdeChange(Sender: TObject);
     procedure EFTalon_HastaChange(Sender: TObject);
     procedure AVisualizarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure TButtConfigurarClick(Sender: TObject);
     procedure CBMostrarNoContabilizadosKriClick(Sender: TObject);
  private
     { Private declarations }
     tipo_talon: smallint;
     origen: char;
  public
     { Public declarations }
     procedure mostrar(tipo: smallint; ori: char);
  end;

var
  FPregTalones : TFPregTalones;

implementation

{$R *.DFM}

uses UDMLstTalones, UEntorno, UUtiles, UFMListConfig, UDMMain;

procedure TFPregTalones.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMLSTTalones, DMLSTTalones);

  if not (DMMain.EstadoKri(256) = 1) then
  begin
     PNLRenumeracion.Visible := False;
     Self.ClientHeight := TBMain.Height + PNLListArt.Height;
     PNLSeleccionTalones.Align := alClient;
  end;
end;

procedure TFPregTalones.mostrar(tipo: smallint; ori: char);
var
  Desde, Hasta : string;
begin
  tipo_talon := tipo;
  origen := ori;
  if tipo_talon = 1 then
  begin
     DMLSTTalones.DameTalon(Desde, Hasta, CBMostrarNoContabilizadosKri.Checked);
     EFTalon_Desde.Tabla_a_buscar := 'VER_TALONES';
     EFTalon_Hasta.Tabla_a_buscar := 'VER_TALONES';
  end
  else
  begin
     DMLSTTalones.DameTalonCta(Desde, Hasta);
     EFTalon_Desde.Tabla_a_buscar := 'VER_TALONES_CTA';
     EFTalon_Hasta.Tabla_a_buscar := 'VER_TALONES_CTA';
  end;
  EFTalon_Desde.Text := Desde;
  EFTalon_Hasta.Text := Hasta;
  ShowModal;
end;

procedure TFPregTalones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTTalones);
  Action := caFree;
end;

procedure TFPregTalones.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregTalones.AVisualizarExecute(Sender: TObject);
begin
  case origen of
     'T': DMLSTTalones.MostrarListado(EFTalon_Desde.Text, EFTalon_Hasta.Text, 0, tipo_talon, CBMostrarNoContabilizadosKri.Checked);
     'L': DMLstTalones.MostrarListadoTalones(EFTalon_Desde.Text, EFTalon_Hasta.Text, 0, CBMostrarNoContabilizadosKri.Checked, ''{SerieKri});
  end;
end;

procedure TFPregTalones.AImprimirExecute(Sender: TObject);
begin
  case origen of
     'T': DMLSTTalones.MostrarListado(EFTalon_Desde.Text, EFTalon_Hasta.Text, 1, tipo_talon, CBMostrarNoContabilizadosKri.Checked);
     'L': DMLstTalones.MostrarListadoTalones(EFTalon_Desde.Text, EFTalon_Hasta.Text, 1, CBMostrarNoContabilizadosKri.Checked, '' {SerieKri});
  end;
end;

procedure TFPregTalones.EFTalon_DesdeChange(Sender: TObject);
begin
  Actualiza_Talon(DMLstTalones.xTalonDesde, EFTalon_Desde.Text);
  DMLstTalones.FiltrarContabilizados(CBMostrarNoContabilizadosKri.Checked);
end;

procedure TFPregTalones.EFTalon_HastaChange(Sender: TObject);
begin
  Actualiza_Talon(DMLstTalones.xTalonHasta, EFTalon_Hasta.Text);
  DMLstTalones.FiltrarContabilizados(CBMostrarNoContabilizadosKri.Checked);
end;

procedure TFPregTalones.TButtConfigurarClick(Sender: TObject);
var
  formato, cabecera, copias, pijama, grupo : integer;
begin
  case origen of
     'T':
     begin
        if tipo_talon = 1 then
           grupo := 502
        else
           grupo := 503;
        TFMListConfig.Create(Self).Muestra(grupo, formato, cabecera, copias,
           pijama, '', DMLSTTalones.frCartaPago, DMLSTTalones.HYTalones);
     end;
     'L':
     begin
        if tipo_talon = 1 then
           grupo := 5093
        else
           grupo := 0;
        TFMListConfig.Create(Self).Muestra(grupo, formato, cabecera, copias,
           pijama, '', DMLstTalones.frCartaPago, DMLstTalones.HYTalones);
     end;
  end;
end;

procedure TFPregTalones.CBMostrarNoContabilizadosKriClick(Sender: TObject);
var
  Desde, Hasta : string;
begin
  DMLSTTalones.DameTalon(Desde, Hasta, CBMostrarNoContabilizadosKri.Checked);
  EFTalon_Desde.Text := Desde;
  EFTalon_Hasta.Text := Hasta;
  DMLstTalones.FiltrarContabilizados(CBMostrarNoContabilizadosKri.Checked);
end;

end.
