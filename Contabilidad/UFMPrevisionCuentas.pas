unit UFMPrevisionCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, Series, TeEngine, TeeProcs, Chart, DbChart;

type
  TFMPrevisionCuentas = class(TFPEditSimple)
     PnlPrevisionCuentas: TLFPanel;
     DBGPrevisionCuentas: THYTDBGrid;
     TBDistribuyePrevision: TToolButton;
     ADistribuyePrevision: TAction;
     AActualizaSaldos: TAction;
     TBActualizaSaldos: TToolButton;
     ProgressBar: TProgressBar;
     PNLGraficoPRevision: TLFPanel;
     DBGraficoCuentas: TDBChart;
     Series1: TBarSeries;
     Series2: TBarSeries;
     TSep1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure ADistribuyePrevisionExecute(Sender: TObject);
     procedure AActualizaSaldosExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGPrevisionCuentasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AExportaAExcelExecute(Sender: TObject);
     procedure DBGraficoCuentasGetAxisLabel(Sender: TChartAxis; Series: TChartSeries; ValueIndex: integer; var LabelText: string);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPrevisionCuentas : TFMPrevisionCuentas;

implementation

uses
  UDMPrevisionCuentas, UFormGest, UFMSeleccion, UUtiles, UDMMain, UDameDato;

{$R *.dfm}

procedure TFMPrevisionCuentas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPrevisionCuentas, DMPrevisionCuentas);

  NavMain.DataSource := DMPrevisionCuentas.DSQMPrevisionCuentas;
  DBGPrevisionCuentas.DataSource := DMPrevisionCuentas.DSQMPrevisionCuentas;
end;

procedure TFMPrevisionCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPrevisionCuentas);
end;

procedure TFMPrevisionCuentas.ADistribuyePrevisionExecute(Sender: TObject);
var
  Importe : double;
begin
  inherited;
  Importe := 0;
  if PideDato('DBL', Importe, 'Importe') then
     DMPrevisionCuentas.DistribuyePrevision(Importe);
end;

procedure TFMPrevisionCuentas.AActualizaSaldosExecute(Sender: TObject);
begin
  inherited;
  DMPrevisionCuentas.ActualizaCuentasPrevision;
end;

procedure TFMPrevisionCuentas.DBGPrevisionCuentasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  i : integer;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then
     begin
        ColorFocused(Canvas);
     end
     else
     begin
        if (Copy(Column.FieldName, 1, 11) = 'DIFERENCIA_') then
        begin
           i := StrToInt(Copy(Column.FieldName, 12, 2));
           if (DMPrevisionCuentas.QMPrevisionCuentas.FieldByName(format('DIFERENCIA_%.2d', [i])).AsFloat < 0) then
              // ColorError(DBGPrevisionCuentas.Canvas)
              ColorObjeto(DBGPrevisionCuentas.Canvas, Brighten(clRed, 50), clWindowText)
           else
              // ColorInfo(DBGPrevisionCuentas.Canvas);
              ColorObjeto(DBGPrevisionCuentas.Canvas, Brighten(clGreen, 50), clWindowText);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPrevisionCuentas.AExportaAExcelExecute(Sender: TObject);
begin
  inherited;
  DMPrevisionCuentas.ExportaAExcel(ProgressBar);
end;

procedure TFMPrevisionCuentas.DBGraficoCuentasGetAxisLabel(Sender: TChartAxis; Series: TChartSeries; ValueIndex: integer; var LabelText: string);
begin
  inherited;
  // Asigno los labelas correspondientes segun los valores en el eje x
  if (Sender = DBGraficoCuentas.BottomAxis) then
  begin
     if (ValueIndex < 12) then
        LabelText := DameTituloPeriodo(format('%.2d', [ValueIndex + 1]));
     // LabelText := MesStr(ValueIndex + 1);

     if (ValueIndex = 12) then
        LabelText := DameTituloPeriodo(format('%.2d', [20]));
  end;
end;

end.
