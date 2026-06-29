unit UFPregModelo110;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, DBCtrls, ULFComboBox,
  ULFActionList, ULFPageControl, ULFToolBar, ULFLabel, ShellApi,
  rxPlacemnt, ULFFormStorage, ULFPanel, UFPEditListadoSimple, UNavigator,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, Menus, UTeclas, UControlEdit;

type
  TFPregModelo110 = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     AModeloOficial: TAction;
     AInstrucciones: TAction;
     PNLLimites: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalleModelo: THYMNavigator;
     LEjercicio: TLFLabel;
     CBEjercicio: TLFComboBox;
     LPeriodo: TLFLabel;
     CBPeriodo: TLFComboBox;
     DBGDetalleModelo: THYTDBGrid;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     CEDetalleMifirst: TMenuItem;
     CEDetalleMiprior: TMenuItem;
     CEDetalleMinext: TMenuItem;
     CEDetalleMilast: TMenuItem;
     CEDetalleMiinsert: TMenuItem;
     CEDetalleMidelete: TMenuItem;
     CEDetalleMiedit: TMenuItem;
     CEDetalleMipost: TMenuItem;
     CEDetalleMicancel: TMenuItem;
     CEDetalleMirefresh: TMenuItem;
     PNLDetalle: TLFPanel;
     TButtExportar: TToolButton;
     function DamePeriodo: string;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AModeloOficialExecute(Sender: TObject);
     procedure AInstruccionesExecute(Sender: TObject);
     procedure FiltroChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure DBGDetalleModeloDblClick(Sender: TObject);
     procedure DBGDetalleModeloDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregModelo110 : TFPregModelo110;

implementation

uses UDMMain, UDMRModelosHacienda, UEntorno, UFormGest, DateUtils, UUtiles,
  UFMain;

{$R *.DFM}

procedure TFPregModelo110.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);

  Grupo := 129;
  Listado := DMRModelosHacienda.frModelo110;
  ListadoFR3 := DMRModelosHacienda.frxModelo110;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
  NavDetalleModelo.DataSource := DMRModelosHacienda.DSxMod110_Detalle;
  DBGDetalleModelo.DataSource := DMRModelosHacienda.DSxMod110_Detalle;

  ARecargar.Execute;
end;

procedure TFPregModelo110.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
end;

function TFPregModelo110.DamePeriodo: string;
begin
  Result := '13';
  case CBPeriodo.ItemIndex of
     0: Result := '13';
     1: Result := '14';
     2: Result := '15';
     3: Result := '16';
     4: Result := '01';
     5: Result := '02';
     6: Result := '03';
     7: Result := '04';
     8: Result := '05';
     9: Result := '06';
     10: Result := '07';
     11: Result := '08';
     12: Result := '09';
     13: Result := '10';
     14: Result := '11';
     15: Result := '12';
  end;
end;

procedure TFPregModelo110.AModeloOficialExecute(Sender: TObject);
begin
  DMRModelosHacienda.GeneraModeloOficial_110(StrToIntDef(CBEjercicio.Text, 2000),
     DamePeriodo);
end;

procedure TFPregModelo110.AInstruccionesExecute(Sender: TObject);
begin
  if ShellExecute(Application.Handle, nil, PChar(REntorno.RutaEXE + 'ModelosHacienda\intr_mod110.pdf'), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la búsqueda de la ayuda'));
end;

procedure TFPregModelo110.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMRModelosHacienda.Previsualizar110(StrToIntDef(CBEjercicio.Text, 2000), DamePeriodo, Modo, PBListado);
end;

procedure TFPregModelo110.FiltroChange(Sender: TObject);
var
  Desde, Hasta : TDateTime;
begin
  inherited;

  DameDesdeHastaPeriodo(DamePeriodo, Desde, Hasta, REntorno.Empresa, StrToIntDef(CBEjercicio.Text, 0));
  DMRModelosHacienda.MuestraDetalleModelo110(Desde, Hasta);
end;

procedure TFPregModelo110.ARecargarExecute(Sender: TObject);
var
  aPeriodo : string;
begin
  inherited;
  aPeriodo := DMRModelosHacienda.DamePeriodo(0);
  if aPeriodo = '13' then
     CBPeriodo.ItemIndex := 0; // 1º Trimestre
  if aPeriodo = '14' then
     CBPeriodo.ItemIndex := 1; // 2º Trimestre
  if aPeriodo = '15' then
     CBPeriodo.ItemIndex := 2; // 3º Trimestre
  if aPeriodo = '16' then
     CBPeriodo.ItemIndex := 3; // 4º Trimestre

  DMRModelosHacienda.RecargaCombo(CBEjercicio);

  FiltroChange(Sender);
end;

procedure TFPregModelo110.DBGDetalleModeloDblClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraDocumento(DMRModelosHacienda.xMod110_DetalleEJERCICIO.AsInteger,
     DMRModelosHacienda.xMod110_DetalleTIPO.AsString,
     DMRModelosHacienda.xMod110_DetalleSERIE.AsString,
     DMRModelosHacienda.xMod110_DetalleRIG.AsInteger);
end;

procedure TFPregModelo110.DBGDetalleModeloDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'EJERCICIO') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGrid(Sender), Rect);
end;

end.
