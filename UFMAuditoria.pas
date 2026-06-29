unit UFMAuditoria;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UDBDateTimePicker, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, Mask, DBCtrls, ULFDBEdit, StdCtrls, ULFLabel, ULFDBMemo,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFDateEdit, ULFComboBox;

type
  TFMAuditoria = class(TFPEdit)
     DBMValoresOld: TLFDBMemo;
     DBMValoresNew: TLFDBMemo;
     LId: TLFLabel;
     DBEId: TLFDbedit;
     DBETabla: TLFDbedit;
     LTabla: TLFLabel;
     DBDEFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     DTPFechaHora: TDBDateTimePicker;
     LUsuario: TLFLabel;
     DBEUsuario: TLFDbedit;
     PNLValores: TLFPanel;
     DBENombre: TLFDbedit;
     LUbicacion: TLFLabel;
     DBEUbicacion: TLFDbedit;
     DBEMaquina: TLFDbedit;
     DBELogin: TLFDbedit;
     DBESistema: TLFDbedit;
     DBEDescripcionUbicacion: TLFDbedit;
     LEntrada: TLFLabel;
     DBEEntrada: TLFDbedit;
     LAccion: TLFLabel;
     DBEAccion: TLFDbedit;
     PNLFiltroFecha: TLFPanel;
     LFechas: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     DEFechaHasta: TLFDateEdit;
     PNLFiltroUsuario: TLFPanel;
     LUsuarioFiltro: TLFLabel;
     EFUsuarioFiltro: TLFEditFind2000;
     TButtFiltrar: TToolButton;
     PNLFiltroTabla: TLFPanel;
     CBTabla: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEAccionChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure TButtFiltrarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAuditoria : TFMAuditoria;

implementation

uses
  UDMMain, UFormGest, UDMAuditoria, UUtiles, DateUtils, UEntorno;

{$R *.dfm}

procedure TFMAuditoria.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAuditoria, DMAuditoria);

  NavMain.DataSource := DMAuditoria.DSxAuditoria;
  DBGMain.DataSource := DMAuditoria.DSxAuditoria;
  G2kTableLoc.DataSource := DMAuditoria.DSxAuditoria;

  // Color campo ID
  ColorCampoID(DBEId);
  DEFechaDesde.Date := Today - 7;
  DEFechaHasta.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  DMAuditoria.RellenaTablas(CBTabla.Items);
  CBTabla.ItemIndex := 0;
  TButtFiltrarClick(Sender);
end;

procedure TFMAuditoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAuditoria);
end;

procedure TFMAuditoria.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMAuditoria.DBEAccionChange(Sender: TObject);
begin
  inherited;
  if (DMAuditoria.xAuditoriaACCION.AsString = 'I') then
  begin
     DBMValoresOld.Color := clInactiveBorder;
     DBMValoresNew.Color := clWindow;
  end
  else
  if (DMAuditoria.xAuditoriaACCION.AsString = 'U') then
  begin
     DBMValoresOld.Color := clWindow;
     DBMValoresNew.Color := clWindow;
  end
  else
  if (DMAuditoria.xAuditoriaACCION.AsString = 'D') then
  begin
     DBMValoresOld.Color := clWindow;
     DBMValoresNew.Color := clInactiveBorder;
  end;
end;

procedure TFMAuditoria.FormShow(Sender: TObject);
begin
  inherited;
  FormResize(Sender);
end;

procedure TFMAuditoria.FormResize(Sender: TObject);
begin
  inherited;
  DBMValoresOld.Width := PNLValores.Width div 2;
end;

procedure TFMAuditoria.TButtFiltrarClick(Sender: TObject);
var
  Tabla : string;
begin
  inherited;
  Tabla := '';
  if (CBTabla.ItemIndex > 0) then
     Tabla := CBTabla.Text;

  DMAuditoria.Filtrar(DEFechaDesde.Date, DEFechaHasta.Date, StrToIntDef(EFUsuarioFiltro.Text, 0), Tabla);
end;

end.
