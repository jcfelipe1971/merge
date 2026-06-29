unit UFMMemoriaContable;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ComCtrls, ULFPageControl, ToolWin, ULFToolBar, ExtCtrls,
  ULFPanel, UFPEditListadoSimple, StdCtrls, ULFComboBox, ULFLabel, Mask,
  DBCtrls, ULFDBEdit, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UNavigator, UHYDBGrid;

type
  TFMMemoriaContable = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     PCMain: TLFPageControl;
     TSListado: TTabSheet;
     TSConfiguracion: TTabSheet;
     PDetalle: TLFPanel;
     PNLPie: TLFPanel;
     LTotalAPercibir: TLFLabel;
     DBETotalPercibir: TLFDbedit;
     DBETotalDeduccion: TLFDbedit;
     CBPeriodo: TLFComboBox;
     LPeriodo: TLFLabel;
     PNLVariablesCuentas: TPanel;
     DBGVariablesCuentas: THYTDBGrid;
     TBVariablesCuentas: TLFToolBar;
     GBVariables: TGroupBox;
     TBVariables: TLFToolBar;
     DBGVariables: THYTDBGrid;
     Splitter1: TSplitter;
     NavVariables: TDBNavigator;
     NavVariablesCuentas: TDBNavigator;
     CBCalcularSaldos: TCheckBox;
     PNLCalcularSaldos: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGVariablesCuentasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure CBCalcularSaldosClick(Sender: TObject);
     procedure CBPeriodoChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FMMemoriaContable : TFMMemoriaContable;

implementation

uses UDMMemoriaContable, UFormGest, UDMListados, UDMMain, UUtiles, DateUtils, URellenaLista;

{$R *.dfm}

procedure TFMMemoriaContable.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMemoriaContable, DMMemoriaContable);

  Grupo := 634;
  Listado := DMMemoriaContable.frMemoriaContable;
  ListadoHYR := DMMemoriaContable.HYRMemoriaContable;
  ListadoHYM := DMMemoriaContable.HYMMemoriaContable;
  ListadoFR3 := DMMemoriaContable.frxMemoriaContable;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  RellenaPeriodos(CBPeriodo.Items);
  CBPeriodo.Items.Delete(0);
  CBPeriodo.ItemIndex := MonthOf(Today) - 1;
  DMMemoriaContable.Periodo := Copy(CBPeriodo.Items[CBPeriodo.ItemIndex], 1, 2);

  DMMemoriaContable.CalcularSaldos := False;

  PCMain.ActivePage := TSListado;
end;

procedure TFMMemoriaContable.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMemoriaContable);
end;

procedure TFMMemoriaContable.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  inherited;
  DMMemoriaContable.MostrarInforme(Modo, 'Memoria Contable', Now);
end;

procedure TFMMemoriaContable.DBGVariablesCuentasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (Column.FieldName = 'SALDO') then
        begin
           if CBCalcularSaldos.Checked then
              ColorInfo(Canvas)
           else
              ColorInactivo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMMemoriaContable.CBCalcularSaldosClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  DMMemoriaContable.CalcularSaldos := CBCalcularSaldos.Checked;
  DMMemoriaContable.RefrescarSaldos;

  i := EncuentraField(DBGVariablesCuentas, 'SALDO');
  if (i >= 0) then
     DBGVariablesCuentas.Columns.Items[i].Visible := True
  else
  begin
     with DBGVariablesCuentas.Columns.Add do
     begin
        FieldName := 'SALDO';
        Title.Caption := _('Saldo');
        Visible := True;
     end;
  end;
end;

procedure TFMMemoriaContable.CBPeriodoChange(Sender: TObject);
begin
  inherited;
  DMMemoriaContable.Periodo := Copy(CBPeriodo.Items[CBPeriodo.ItemIndex], 1, 2);
  DMMemoriaContable.RefrescarSaldos;
end;

end.
