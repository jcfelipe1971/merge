unit UFSelecAgrupFac;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UFormGest, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, UNavigator, ActnList,
  Menus, UTeclas, UControlEdit, StdCtrls, Mask, DBCtrls, rxToolEdit, NsDBGrid,
  ULFActionList, ULFDBEdit, ULFPanel, ULFToolBar, ULFLabel, ULFDateEdit;

type
  TFSelecAgrupFac = class(TG2KForm)
     DBGMain: TDBGridFind2000;
     TBmain: TLFToolBar;
     NavMain: THYMNavigator;
     TButtFiltra: TToolButton;
     ToolButton2: TToolButton;
     ALMain: TLFActionList;
     AFiltrar: TAction;
     TButtExit: TToolButton;
     ASalir: TAction;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     CEMainMICerrar: TMenuItem;
     ToolButton1: TToolButton;
     PNLTBMain: TLFPanel;
     LAgrupacion: TLFLabel;
     EFAgrupacion: TFIBHYGEditFind;
     DBETitAgrupacion: TLFDbedit;
     TBFechas: TLFToolBar;
     TButtFiltro: TToolButton;
     PNLFechas: TLFPanel;
     DTDesde: TLFDateEdit;
     DTHasta: TLFDateEdit;
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
     TButtFechas: TToolButton;
     ToolButton5: TToolButton;
     AFechas: TAction;
     AFiltroOriginal: TAction;
     PNLInfo: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGMainDblClick(Sender: TObject);
     procedure AFiltrarExecute(Sender: TObject);
     procedure DBGMainKeyPress(Sender: TObject; var Key: char);
     procedure ASalirExecute(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure EFAgrupacionExit(Sender: TObject);
     procedure AFiltroOriginalExecute(Sender: TObject);
     procedure AFechasExecute(Sender: TObject);
  private
     { Private declarations }
     TempFiltro: string;
     procedure PonHoras(var Desde, Hasta: TDateTime);
  public
     { Public declarations }
  end;

var
  FSelecAgrupFac : TFSelecAgrupFac;

implementation

uses UFMain, UDMAgrupacionFac, UDMMain, UEntorno;

{$R *.DFM}

procedure TFSelecAgrupFac.FormCreate(Sender: TObject);
var
  Agrupacion : string;
  Desde, Hasta : TDateTime;
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE 

  DMAgrupacionFac.PonSQLBase;
  EFAgrupacion.CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
  DMAgrupacionFac.DameRangos(Agrupacion, Desde, Hasta);
  EFAgrupacion.Text := agrupacion;
  PonHoras(Desde, Hasta);
  DTDesde.Date := Desde;
  DTHasta.Date := Hasta;
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
  AFechas.Execute;
end;

procedure TFSelecAgrupFac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFSelecAgrupFac.DBGMainDblClick(Sender: TObject);
begin
  DMAgrupacionFac.InsertaCabecera;
  DMAgrupacionFac.RefrescaCabecera;
end;

procedure TFSelecAgrupFac.AFiltrarExecute(Sender: TObject);
var
  Modo : integer;
begin
  PNLInfo.Caption := _('Filtrado con Buscador');
  DMAgrupacionFac.BusquedaCabeceras(Modo);
  if Modo = mrAll then
     PNLInfo.Caption := TempFiltro;
end;

procedure TFSelecAgrupFac.DBGMainKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
     DMAgrupacionFac.InsertaCabecera;
     DMAgrupacionFac.RefrescaCabecera;
  end;
end;

procedure TFSelecAgrupFac.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFSelecAgrupFac.EFAgrupacionChange(Sender: TObject);
begin
  if EFAgrupacion.Text <> '' then
     DMAgrupacionFac.FiltraTituloAgrupacion(EFAgrupacion.Text);
end;

procedure TFSelecAgrupFac.EFAgrupacionExit(Sender: TObject);
begin
  if EFAgrupacion.Text <> '' then
  begin
     PNLInfo.Caption := _('Filtrado por Agrupación');
     TempFiltro := PNLInfo.Caption;
     DMAgrupacionFac.FiltraporAgrupacion(EFAgrupacion.Text);
  end;
end;

procedure TFSelecAgrupFac.AFiltroOriginalExecute(Sender: TObject);
begin
  DMAgrupacionFac.FiltraCabeceras;
end;

procedure TFSelecAgrupFac.AFechasExecute(Sender: TObject);
var
  Agrupacion : string;
  Desde, Hasta : TDateTime;
begin
  agrupacion := EFAgrupacion.Text;
  Desde := DTDesde.Date;
  Hasta := DTHasta.Date;
  PonHoras(Desde, Hasta);
  PNLInfo.Caption := _('Filtrado por Fechas');
  TempFiltro := PNLInfo.Caption;
  DMAgrupacionFac.FiltraFechas(Desde, Hasta, Agrupacion);
end;

procedure TFSelecAgrupFac.PonHoras(var Desde, Hasta: TDateTime);
begin
  Desde := Trunc(Desde) + Frac(StrToTime('0:00:00'));
  Hasta := Trunc(Hasta) + Frac(StrToTime('23:59:59'));
end;

end.
