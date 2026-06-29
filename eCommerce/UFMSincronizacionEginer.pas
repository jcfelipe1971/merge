unit UFMSincronizacionEginer;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UNavigator, ULFPageControl,
  StdCtrls, ULFEdit, ULFLabel, ULFMemo, Mask, rxToolEdit, ULFDateEdit;

type
  TFMSincronizacionEginer = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSUsuarios: TTabSheet;
     TSArticulos: TTabSheet;
     TSPedidos: TTabSheet;
     PNLUsuarios: TLFPanel;
     TBUsuarios: TLFToolBar;
     NavUsuarios: THYMNavigator;
     TBSep1: TToolButton;
     TBSincronizarUsuarios: TToolButton;
     DBGFUsuarios: TDBGridFind2000;
     TSConfiguracion: TTabSheet;
     LURL: TLFLabel;
     EURL: TLFEdit;
     PNLPedidos: TLFPanel;
     TBPedidos: TLFToolBar;
     TBSep2: TToolButton;
     TBSincronizaPedidos: TToolButton;
     PNLPedidosUltimaSincronizacion: TLFPanel;
     LPedidosUltimaSincronizacion: TLFLabel;
     EPedidoUltimasincronizacion: TLFEdit;
     MPedidosLogSincronizacion: TLFMemo;
     LFCategoryAction1: TLFCategoryAction;
     ASincronizarPedidos: TAction;
     PNLUsuariosUltimaSincronizacion: TLFPanel;
     LUsuariosUltimaSincronizacion: TLFLabel;
     DEUsuariosUltimaSincronizacion: TLFDateEdit;
     DTPUsuariosUltimaSincronizacion: TDateTimePicker;
     ASincronizarUsuarios: TAction;
     ASincronizaArticulos: TAction;
     PNLArticulos: TLFPanel;
     TBArticulos: TLFToolBar;
     TBSincronizarArticulos: TToolButton;
     PNLArticulos2: TLFPanel;
     LArticulosUltimaSincronizacion: TLFLabel;
     DEArticulosUltimaSincronizacion: TLFDateEdit;
     DTPArticulosUltimaSincronizacion: TDateTimePicker;
     MArticulosLogSincronizacion: TLFMemo;
     MUsuariosLogSincronizacion: TLFMemo;
     PNLPedidosFechaUltimaSincronizacion: TLFPanel;
     LPedidosFechaUltimaSincronizacion: TLFLabel;
     DEPedidosFechaUltimaSincronizacion: TLFDateEdit;
     DTPPedidosFechaUltimaSincronizacion: TDateTimePicker;
     ASincronizarTodo: TAction;
     TBSep4: TToolButton;
     TBSincronizarTodo: TToolButton;
     TSStock: TTabSheet;
     PNLStocks: TLFPanel;
     TBArticulosStock: TLFToolBar;
     TBsincronizaStock: TToolButton;
     PNLFechaSincStock: TLFPanel;
     LUltSincronizacionStock: TLFLabel;
     DEStockUltimaSincronizacion: TLFDateEdit;
     DTPStockUltimaSincronizacion: TDateTimePicker;
     MStockLogSincronizacion: TLFMemo;
     ASincronizarStock: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASincronizarPedidosExecute(Sender: TObject);
     procedure DEUsuariosUltimaSincronizacionChange(Sender: TObject);
     procedure TSUsuariosShow(Sender: TObject);
     procedure ASincronizarUsuariosExecute(Sender: TObject);
     procedure ASincronizaArticulosExecute(Sender: TObject);
     procedure ASincronizarTodoExecute(Sender: TObject);
     procedure ASincronizarStockExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ClearLog(Tipo: string);
     procedure SincronizarUsuarios;
     procedure SincronizarcionAutomatica;
  end;

var
  FMSincronizacionEginer : TFMSincronizacionEginer;

implementation

uses UDMMain, UFormGest, UDMSincronizacionEginer, UParam, UEntorno;

{$R *.dfm}

procedure TFMSincronizacionEginer.FormCreate(Sender: TObject);
var
  Fecha : TDateTime;
  Id : integer;
  Param_SINEGIN001 : string;
begin
  inherited;
  AbreData(TDMSincronizacionEginer, DMSincronizacionEginer);

  DMSincronizacionEginer.AsignaLog('PEC', MPedidosLogSincronizacion.Lines);
  DMSincronizacionEginer.AsignaLog('ART', MArticulosLogSincronizacion.Lines);
  DMSincronizacionEginer.AsignaLog('USR', MUsuariosLogSincronizacion.Lines);
  DMSincronizacionEginer.AsignaLog('STO', MStockLogSincronizacion.Lines);

  Fecha := DMSincronizacionEginer.DameUltimaFechaSincronizacion('USR');
  DEUsuariosUltimaSincronizacion.Date := Fecha;
  DTPUsuariosUltimaSincronizacion.DateTime := Fecha;

  Fecha := DMSincronizacionEginer.DameUltimaFechaSincronizacion('ART');
  DEArticulosUltimaSincronizacion.Date := Fecha;
  DTPArticulosUltimaSincronizacion.DateTime := Fecha;

  Fecha := DMSincronizacionEginer.DameUltimaFechaSincronizacion('STO');
  DEStockUltimaSincronizacion.Date := Fecha;
  DTPStockUltimaSincronizacion.DateTime := Fecha;

  Fecha := DMSincronizacionEginer.DameUltimaFechaSincronizacion('PEC');
  DEPedidosFechaUltimaSincronizacion.Date := Fecha;
  DTPPedidosFechaUltimaSincronizacion.DateTime := Fecha;

  Id := DMSincronizacionEginer.DameUltimoIdSincronizacion('PEC');
  EPedidoUltimasincronizacion.Text := IntToStr(Id);

  Param_SINEGIN001 := LeeParametro('SINEGIN001');
  if (Param_SINEGIN001 > '') then
     EURL.Text := Param_SINEGIN001;

  PCMain.ActivePage := TSUsuarios;
end;

procedure TFMSincronizacionEginer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSincronizacionEginer);
end;

procedure TFMSincronizacionEginer.ASincronizarPedidosExecute(Sender: TObject);
var
  UtlimoPedidoSincronizado : integer;
  UltimaSincronizacion : TDateTime;
begin
  inherited;
  PCMain.ActivePage := TSPedidos;

  UltimaSincronizacion := DEPedidosFechaUltimaSincronizacion.Date;
  UltimaSincronizacion := UltimaSincronizacion + Frac(DTPPedidosFechaUltimaSincronizacion.Date);

  UtlimoPedidoSincronizado := StrToIntDef(EPedidoUltimasincronizacion.Text, 0);

  DMSincronizacionEginer.SincronizarPedidos(EURL.Text, UtlimoPedidoSincronizado, UltimaSincronizacion);

  // Actualizo datos de último pedido sincronizado
  DEPedidosFechaUltimaSincronizacion.Date := UltimaSincronizacion;
  DTPPedidosFechaUltimaSincronizacion.DateTime := UltimaSincronizacion;

  if (UtlimoPedidoSincronizado <> -1) then
     EPedidoUltimasincronizacion.Text := IntToStr(UtlimoPedidoSincronizado);
end;

procedure TFMSincronizacionEginer.DEUsuariosUltimaSincronizacionChange(Sender: TObject);
var
  Fecha : TDateTime;
begin
  inherited;
  Fecha := DEUsuariosUltimaSincronizacion.Date;
  Fecha := Fecha + Frac(DTPUsuariosUltimaSincronizacion.Date);
  DMSincronizacionEginer.RefrescaUsuarios(Fecha);
end;

procedure TFMSincronizacionEginer.TSUsuariosShow(Sender: TObject);
begin
  inherited;
  DEUsuariosUltimaSincronizacionChange(Sender);
end;

procedure TFMSincronizacionEginer.ASincronizarUsuariosExecute(Sender: TObject);
var
  UtlimaSincronizacion : TDateTime;
begin
  inherited;
  PCMain.ActivePage := TSUsuarios;

  UtlimaSincronizacion := DEUsuariosUltimaSincronizacion.Date;
  UtlimaSincronizacion := UtlimaSincronizacion + Frac(DTPUsuariosUltimaSincronizacion.Date);
  UtlimaSincronizacion := DMSincronizacionEginer.SincronizarUsuarios(EURL.Text, UtlimaSincronizacion);

  DEUsuariosUltimaSincronizacion.Date := UtlimaSincronizacion;
  DTPUsuariosUltimaSincronizacion.DateTime := UtlimaSincronizacion;
end;

procedure TFMSincronizacionEginer.ASincronizaArticulosExecute(Sender: TObject);
var
  UtlimaSincronizacion : TDateTime;
begin
  inherited;
  PCMain.ActivePage := TSArticulos;

  UtlimaSincronizacion := DEArticulosUltimaSincronizacion.Date;
  UtlimaSincronizacion := UtlimaSincronizacion + Frac(DTPArticulosUltimaSincronizacion.Date);
  UtlimaSincronizacion := DMSincronizacionEginer.SincronizarArticulos(EURL.Text, UtlimaSincronizacion);

  DEArticulosUltimaSincronizacion.Date := UtlimaSincronizacion;
  DTPArticulosUltimaSincronizacion.DateTime := UtlimaSincronizacion;
end;

procedure TFMSincronizacionEginer.ClearLog(Tipo: string);
begin
  if (Tipo = 'PEC') then
     MPedidosLogSincronizacion.Lines.Clear;
  if (Tipo = 'ART') then
     MArticulosLogSincronizacion.Lines.Clear;
  if (Tipo = 'USR') then
     MUsuariosLogSincronizacion.Lines.Clear;
end;

procedure TFMSincronizacionEginer.ASincronizarTodoExecute(Sender: TObject);
begin
  inherited;
  ASincronizarUsuarios.Execute;
  ASincronizaArticulos.Execute;
  ASincronizarPedidos.Execute;
  ASincronizarStock.Execute;
end;

procedure TFMSincronizacionEginer.SincronizarUsuarios;
begin
  ASincronizarUsuarios.Execute;
end;

procedure TFMSincronizacionEginer.ASincronizarStockExecute(Sender: TObject);
var
  UltimaSincronizacion : TDateTime;
begin
  inherited;
  PCMain.ActivePage := TSStock;

  UltimaSincronizacion := DEStockUltimaSincronizacion.Date;
  UltimaSincronizacion := UltimaSincronizacion + Frac(DTPStockUltimaSincronizacion.Date);

  UltimaSincronizacion := DMSincronizacionEginer.SincronizarStock(EURL.Text, UltimaSincronizacion);

  // Actualizo datos de último pedido sincronizado
  DEStockUltimaSincronizacion.Date := UltimaSincronizacion;
  DTPStockUltimaSincronizacion.DateTime := UltimaSincronizacion;
end;

procedure TFMSincronizacionEginer.SincronizarcionAutomatica;
begin
  // Solo actualiza stock
  ASincronizarStock.Execute;
  DMMain.EnviaMensajeUsuario(REntorno.Usuario, MStockLogSincronizacion.Text);
end;

end.
