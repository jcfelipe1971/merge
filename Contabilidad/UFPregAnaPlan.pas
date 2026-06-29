unit UFPregAnaPlan;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEditListado, UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls,
  StdCtrls, ExtCtrls, UEditPanel, ToolWin, ActnList, Mask, DBCtrls,
  rxToolEdit, ULFEdit, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFLabel, ULFComboBox, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregAnaPlan = class(TFPEditListadoSimple)
     GBCentrosCoste: TGroupBox;
     LDesdeCentroCoste: TLFLabel;
     EFCcDesde: TLFEditFind2000;
     LHastaCentroCoste: TLFLabel;
     EFCcHasta: TLFEditFind2000;
     GBOtros: TGroupBox;
     LCaracterRelleno: TLFLabel;
     ECharRelleno: TLFEdit;
     LTituloListado: TLFLabel;
     ETituloListado: TLFEdit;
     LFechaListado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     DBECcDesde: TLFDbedit;
     DBECcHasta: TLFDbedit;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     GBNiveles: TGroupBox;
     LDesdeNivel: TLFLabel;
     LHastaNivel: TLFLabel;
     CBNivelDesde: TLFComboBox;
     CBNivelHasta: TLFComboBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure Imprimir(Sender: TObject);
     procedure EFCcDesdeChange(Sender: TObject);
     procedure EFCcHastaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure CBNivelDesdeChange(Sender: TObject);
     procedure EFCcDesdeBusqueda(Sender: TObject);
     procedure EFCcHastaBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregAnaPlan : TFPregAnaPlan;

implementation

uses
  UDMMain, UEntorno, UFormGest, UDMRAnaPlan, UFMListConfig, UFMain,
  UUtiles, UDMPlanesContables;

{$R *.DFM}


procedure TFPregAnaPlan.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRAnaPlan, DMRAnaPlan);
  ARecargarExecute(Self);
  EFCcDesde.MaxLength := 10;
  EFCcHasta.MaxLength := 10;
end;

procedure TFPregAnaPlan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRAnaPlan);
end;

procedure TFPregAnaPlan.Imprimir(Sender: TObject);
var
  Modo : smallint;
  char_r : char;
begin
  if (ECharRelleno.Text <= '') then
     char_r := ' '
  else
     char_r := ECharRelleno.Text[1];

  with DMRAnaPlan do
  begin
     Cc_Desde := EFCcDesde.Text;
     Cc_Hasta := EFCcHasta.Text;
     Char_Relleno := char_r;
     Titulo := ETituloListado.Text;
     FechaListado := int(DTPFechaListado.Date);

     if CBNivelDesde.ItemIndex = 0 then
     begin
        N_Desde := 1;
        N_Hasta := CBNivelHasta.Items.Count - 1;
     end
     else
     begin
        N_Desde := CBNivelDesde.ItemIndex;
        N_Hasta := CBNivelHasta.ItemIndex + 1;
     end;
  end;

  Modo := TAction(Sender).Tag;
  DMRAnaPlan.MostrarInforme(Modo);
end;

procedure TFPregAnaPlan.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregAnaPlan.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRAnaPlan.Rangos;
  EFCcDesde.Text := DMRAnaPlan.Cc_Desde;
  EFCcHasta.Text := DMRAnaPlan.Cc_Hasta;
  DTPFechaListado.Date := REntorno.FechaTrabSH;

  DMRAnaPlan.LlenarNiveles;
  CBNivelDesde.Items := DMRAnaPlan.Niveles;
  CBNivelDesde.Items.Insert(0, _('Todos'));
  CBNivelDesde.ItemIndex := 1;
  CBNivelHasta.Items := DMRAnaPlan.Niveles;
  CBNivelHasta.ItemIndex := DMRAnaPlan.Niveles.Count - 1;
end;

procedure TFPregAnaPlan.EFCcDesdeChange(Sender: TObject);
begin
  DMRAnaPlan.Actualiza_Cc(DMRAnaPlan.xCc_Desde, EFCcDesde.Text);
end;

procedure TFPregAnaPlan.EFCcHastaChange(Sender: TObject);
begin
  DMRAnaPlan.Actualiza_Cc(DMRAnaPlan.xCc_Hasta, EFCcHasta.Text);
end;

procedure TFPregAnaPlan.FormShow(Sender: TObject);
begin
  EFCcDesde.SetFocus;
end;

procedure TFPregAnaPlan.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(604, Formato, Cabecera, Copias,
     Pijama, '', DMRAnaPlan.frAnaPlan);
end;

procedure TFPregAnaPlan.CBNivelDesdeChange(Sender: TObject);
begin
  inherited;
  if (CBNivelDesde.ItemIndex > CBNivelHasta.ItemIndex) then
     CBNivelHasta.ItemIndex := CBNivelDesde.ItemIndex - 1;
  if (CBNivelDesde.ItemIndex = 0) then
     CBNivelHasta.Enabled := False
  else
     CBNivelHasta.Enabled := True;
end;

procedure TFPregAnaPlan.EFCcDesdeBusqueda(Sender: TObject);
begin
  inherited;
  EFCcDesde.CondicionBusqueda :=
     'PLAN_CONTABLE=''' +
     DMPlanesContables.QMPlanesContablesPLAN_CONTABLE.AsString + '''';
end;

procedure TFPregAnaPlan.EFCcHastaBusqueda(Sender: TObject);
begin
  inherited;
  EFCcHasta.CondicionBusqueda :=
     'PLAN_CONTABLE=''' +
     DMPlanesContables.QMPlanesContablesPLAN_CONTABLE.AsString + '''';
end;

end.
