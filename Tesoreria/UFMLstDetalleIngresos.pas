unit UFMLstDetalleIngresos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ComCtrls, ULFPageControl, ToolWin, ULFToolBar, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ExtCtrls,
  ULFPanel, ULFLabel, Mask, rxToolEdit, ULFDateEdit, ULFEdit,
  UFPEditListadoSimple;

type
  TFMLstDetalleIngresos = class(TFPEditListadoSimple)
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
     DTDesde: TLFDateEdit;
     DTHasta: TLFDateEdit;
     LFSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtConfRapida: TToolButton;
     LFechaListado: TLFLabel;
     LComentario: TLFLabel;
     DEFechaListado: TLFDateEdit;
     EComentario: TLFEdit;
     ESerie: TLFEdit;
     LUsuario: TLFLabel;
     EFUsuario: TLFEditFind2000;
     ENombreUsuario: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFUsuarioChange(Sender: TObject);
  private
     { Private declarations }
     procedure MostrarListado(Modo: integer);
  public
     { Public declarations }
  end;

var
  FMLstDetalleIngresos : TFMLstDetalleIngresos;

implementation

uses
  UEntorno, UFormGest, UUtiles, UDMLstDetalleIngresos, UDMMain, UFMListConfig, UDameDato;

{$R *.dfm}

procedure TFMLstDetalleIngresos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstDetalleIngresos, DMLstDetalleIngresos);

  Grupo := 640;
  Listado := DMLstDetalleIngresos.frIngresos;
  ListadoFR3 := DMLstDetalleIngresos.frxIngresos;

  ARecargar.Execute;
end;

procedure TFMLstDetalleIngresos.MostrarListado(Modo: integer);
var
  FechaDesde, FechaHasta : TDateTime;
  Serie : string;
begin
  FechaDesde := HourIntoDate(DTDesde.Date, '00:00:00');
  FechaHasta := HourIntoDate(DTHasta.Date, '23:59:59');

  if (EFSerie.Text = '') then
     Serie := REntorno.Serie
  else
     Serie := EFSerie.Text;

  DMLstDetalleIngresos.MostrarListado(Modo, FechaDesde, FechaHasta, Serie, DEFechaListado.Date, EComentario.Text, StrToInt(EFUsuario.Text));
end;

procedure TFMLstDetalleIngresos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(1);
end;

procedure TFMLstDetalleIngresos.APrevExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(0);
end;

procedure TFMLstDetalleIngresos.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DTDesde.Date := REntorno.FechaTrab;
  DTHasta.Date := REntorno.FechaTrab;
  DEFechaListado.Date := REntorno.FechaTrab;
  EFSerie.Text := REntorno.Serie;
end;

procedure TFMLstDetalleIngresos.EFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMLstDetalleIngresos.EFUsuarioChange(Sender: TObject);
begin
  inherited;
  ENombreUsuario.Text := DameTituloUsuario(StrToIntDef(EFUsuario.Text, 0));
end;

end.
