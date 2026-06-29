unit UFMTPVSesionCajaTurno;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls, ULFEdit,
  ULFLabel, Mask, DBCtrls, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, rxToolEdit, RXDBCtrl, ULFDBDateEdit, UNavigator,
  ULFComboBox;

type
  TFMTPVSesionCajaTurno = class(TFPEditSinNavegador)
     DBETituloRelacion: TLFDbedit;
     DBECaja: TLFDbedit;
     DBETurno: TLFDbedit;
     LSesion: TLFLabel;
     LCaja: TLFLabel;
     LTurno: TLFLabel;
     CKSesionAbierta: TLFDBCheckBox;
     CKCajaAbierta: TLFDBCheckBox;
     CKTurnoAbierto: TLFDBCheckBox;
     DBDESesionFechaDesde: TLFDBDateEdit;
     DBDESesionFechaHasta: TLFDBDateEdit;
     PNLSesion: TLFPanel;
     PNLCajaTurno: TLFPanel;
     PNLCaja: TLFPanel;
     PNLTurno: TLFPanel;
     DBDECajaFechaInicio: TLFDBDateEdit;
     DBDECajaFechafin: TLFDBDateEdit;
     DBDETurnoFechaInicio: TLFDBDateEdit;
     DBDETurnoFechaFin: TLFDBDateEdit;
     TBCaja: TLFToolBar;
     TBTurno: TLFToolBar;
     NavCaja: THYMNavigator;
     NavTurno: THYMNavigator;
     ACerrarSesion: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AAbrirSesion: TAction;
     DBESaldoInicial: TLFDbedit;
     LSaldoInicial: TLFLabel;
     ARefrescar: TAction;
     PNLSerie: TLFPanel;
     LSerieVenta: TLFLabel;
     CBSerie: TLFComboBox;
     LSesionDesde: TLFLabel;
     LCajaDesde: TLFLabel;
     LTurnoDesde: TLFLabel;
     LSesionHasta: TLFLabel;
     LCajaHasta: TLFLabel;
     LTurnoHasta: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AAbrirSesionExecute(Sender: TObject);
     procedure ACerrarSesionExecute(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
     procedure CBSerieChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTPVSesionCajaTurno : TFMTPVSesionCajaTurno;

implementation

uses
  UDMTPVSesionCajaTurno, UDMMain, UEntorno, UFormGest, UUtiles, URellenaLista;

{$R *.dfm}

procedure TFMTPVSesionCajaTurno.FormCreate(Sender: TObject);
var
  Serie : string;
begin
  inherited;
  AbreData(TDMTPVSesionCajaTurno, DMTPVSesionCajaTurno);

  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;

  CBSerie.Enabled := (REntorno.SerieRestringida = '');

  RellenaSeries(CBSerie.Items);
  CBSerie.Items.Delete(0);
  // Pongo la serie por defecto/restringida
  CBSerie.ItemIndex := 0;
  while ((Copy(CBSerie.Text, 1, Length(Serie)) + ' ') <> Serie + ' ') do
     CBSerie.ItemIndex := CBSerie.ItemIndex + 1;
  CBSerieChange(Self);
end;

procedure TFMTPVSesionCajaTurno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTPVSesionCajaTurno);
end;

procedure TFMTPVSesionCajaTurno.CBSerieChange(Sender: TObject);
var
  Serie, SerieActiva : string;
begin
  inherited;
  // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
  Serie := CBSerie.Items[CBSerie.ItemIndex];
  Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);

  if (Serie <> '') then
  begin
     SerieActiva := dame_serie_activa(Serie);
     // Bloqueo series
     if (SerieActiva <> Serie) then
        Serie := SerieActiva;

     DMTPVSesionCajaTurno.CambiaSerie(Serie);
  end;
end;

procedure TFMTPVSesionCajaTurno.AAbrirSesionExecute(Sender: TObject);
begin
  inherited;
  DMTPVSesionCajaTurno.AbrirSesion;
end;

procedure TFMTPVSesionCajaTurno.ACerrarSesionExecute(Sender: TObject);
begin
  inherited;
  DMTPVSesionCajaTurno.CerrarSesion;
end;

procedure TFMTPVSesionCajaTurno.ARefrescarExecute(Sender: TObject);
begin
  inherited;
  DMTPVSesionCajaTurno.Refrescar;
end;

end.
