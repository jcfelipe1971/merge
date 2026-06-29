unit UFMLstMatPeligrosas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, ULFLabel, ExtCtrls,
  ULFPanel, Mask, rxToolEdit, ULFDateEdit, ULFEdit, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, TFlatCheckBoxUnit,
  ULFCheckBox, rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFMLstMatPeligrosas = class(TFPEditListadoSimple)
     LFPanel1: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LFDateDesde: TLFDateEdit;
     LFDateHasta: TLFDateEdit;
     LComentario: TLFLabel;
     LFEComentari: TLFEdit;
     TButtConfiguracionRapida: TToolButton;
     ChkTodos: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimirExecute(Sender: TObject);
     procedure TButtRecargarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLstMatPeligrosas : TFMLstMatPeligrosas;

implementation

uses UFormGest, UDMLstMatPeligrosas;

{$R *.dfm}

procedure TFMLstMatPeligrosas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstMatPeligrosas, DMLstMatPeligrosas);

  Grupo := 6200;
  Listado := DMLstmatPeligrosas.frLstMatPeligrosas;
end;

procedure TFMLstMatPeligrosas.APrevExecute(Sender: TObject);
var
  Todos : smallint;
begin
  inherited;

  if ChkTodos.Checked then
     Todos := 1
  else
     Todos := 0;

  DMLstMatPeligrosas.MostrarListado(0, LFDateDesde.Date, LFDateHasta.Date, LFEComentari.Text, Todos);
end;

procedure TFMLstMatPeligrosas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstmatPeligrosas);
end;

procedure TFMLstMatPeligrosas.AImprimirExecute(Sender: TObject);
var
  Todos : smallint;
begin
  inherited;

  if ChkTodos.Checked then
     Todos := 1
  else
     Todos := 0;

  DMLstMatPeligrosas.MostrarListado(1, LFDateDesde.Date, LFDateHasta.Date, LFEComentari.Text, Todos);
end;

procedure TFMLstMatPeligrosas.TButtRecargarClick(Sender: TObject);
begin
  inherited;
  ChkTodos.Checked := False;
end;

end.
