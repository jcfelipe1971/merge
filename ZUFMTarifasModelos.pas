unit ZUFMTarifasModelos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, ULFLabel, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, Mask, DBCtrls, ULFDBEdit, UHYDescription,
  ULFHYDBDescription, ULFEditFind2000, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TZFMTarifasModelos = class(TFPEdit)
     LModelo: TLFLabel;
     DBEModelo: TDBEditFind2000;
     LTipoLona: TLFLabel;
     LTarifa: TLFLabel;
     DBELona: TDBEditFind2000;
     DBETarifa: TDBEditFind2000;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LFechaCreacion: TLFLabel;
     DescTipoLona: TLFHYDBDescription;
     DescTarifa: TLFHYDBDescription;
     LFCategoryAction1: TLFCategoryAction;
     ADamePrecios: TAction;
     DEFecha: TLFDBDateEdit;
     ToolButton1: TToolButton;
     TBBloquear: TToolButton;
     ALTarifas: TLFActionList;
     ABloquearTodos: TAction;
     TBDesbloquear: TToolButton;
     ADesbloquearTodos: TAction;
     DBCBTarfiaDefecto: TLFDBCheckBox;
     PCDetalle: TLFPageControl;
     TSNormal: TTabSheet;
     TSColor: TTabSheet;
     PNLDetalle_No_Color: TLFPanel;
     DBGDetalle_No_Color: TDBGridFind2000;
     PNLDetalle_Color: TLFPanel;
     DBGDetalle_Color: TDBGridFind2000;
     TBCambiaMargen: TToolButton;
     TBDetalle_No_Color: TLFToolBar;
     NavDetalle_No_Color: THYMNavigator;
     TBDetalle_Color: TLFToolBar;
     NavDetalle_Color: THYMNavigator;
     PDetalle: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ADamePreciosExecute(Sender: TObject);
     procedure DBELonaChange(Sender: TObject);
     procedure DBETarifaChange(Sender: TObject);
     procedure ABloquearTodosExecute(Sender: TObject);
     procedure ADesbloquearTodosExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEModeloChange(Sender: TObject);
     procedure DBGDetalle_ColorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGDetalle_No_ColorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBCambiaMargenClick(Sender: TObject);
     procedure DBELonaBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMTarifasModelos : TZFMTarifasModelos;

implementation

uses UFormGest, ZUDMTarifasModelos, UDMMain, UFCambioMargen, UUtiles;

{$R *.dfm}

procedure TZFMTarifasModelos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMTarifasModelos, ZDMTarifasModelos);
  NavMain.DataSource := ZDMTarifasModelos.DSPreciosCab;
  DBGMain.DataSource := ZDMtarifasModelos.DSPreciosCab;
  NavDetalle_No_Color.DataSource := ZDMTarifasModelos.DSPreciosDet;
  DBGDetalle_No_Color.DataSource := ZDMTarifasModelos.DSPreciosDet;
  NavDetalle_Color.DataSource := ZDMTarifasModelos.DSPreciosDetColor;
  DBGDetalle_Color.DataSource := ZDMTarifasModelos.DSPreciosDetColor;
end;

procedure TZFMTarifasModelos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMTarifasModelos);
end;

procedure TZFMTarifasModelos.ADamePreciosExecute(Sender: TObject);
begin
  inherited;
  ZDMTarifasModelos.GeneraPreciosModelo;
end;

procedure TZFMTarifasModelos.DBELonaChange(Sender: TObject);
begin
  inherited;
  DescTipoLona.ActualizaDatos('TIPO_LONA', DBELona.Text);
end;

procedure TZFMTarifasModelos.DBETarifaChange(Sender: TObject);
begin
  inherited;
  DescTarifa.ActualizaDatos('TARIFA', DBETarifa.Text);
end;

procedure TZFMTarifasModelos.ABloquearTodosExecute(Sender: TObject);
begin
  inherited;
  ZDMTarifasModelos.Bloquear(1, PCDetalle.ActivePageIndex);
end;

procedure TZFMTarifasModelos.ADesbloquearTodosExecute(Sender: TObject);
begin
  inherited;
  ZDMTarifasModelos.Bloquear(0, PCDetalle.ActivePageIndex);
end;

procedure TZFMTarifasModelos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDmTarifasModelos.BusquedaCompleja;
end;

procedure TZFMTarifasModelos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.DataSource := ZDMTarifasModelos.DSPreciosCab;
  G2kTableLoc.Click;
end;

procedure TZFMTarifasModelos.DBEModeloChange(Sender: TObject);
begin
  inherited;
  PCDetalle.ActivePageIndex := 0;
end;

procedure TZFMTarifasModelos.DBGDetalle_ColorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (ZDMTarifasModelos.QMPreciosDetColorBLOQUEO_PVENTA.AsInteger = 1) then
  begin
     with DBGDetalle_Color do
     begin
        ColorError(Canvas);
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TZFMTarifasModelos.DBGDetalle_No_ColorDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (ZDMTarifasModelos.QMPreciosDetBLOQUEO_PVENTA.AsInteger = 1) then
  begin
     with DBGDetalle_No_Color do
     begin
        ColorError(Canvas);
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
     end;
  end;
end;

procedure TZFMTarifasModelos.TBCambiaMargenClick(Sender: TObject);
var
  f : TFCambioMargen;
begin
  f := TFCambioMargen.Create(Self);
  // f.RGModo.visible := False;
  try
     if (f.ShowModal = mrOk) then
     begin
        if (((f.Margen >= 0) and (f.Modo = 0)) or (f.Modo = 1) or (f.Modo = 2)) then
           ZDMTarifasModelos.CambioMargen(DBEModelo.Text, DBELona.Text, DBETarifa.Text, f.Margen, f.RGModo.ItemIndex);
     end;
  finally
     FreeAndNil(f);
  end;
end;

procedure TZFMTarifasModelos.DBELonaBusqueda(Sender: TObject);
var
  Tipo : string;
begin
  inherited;
  Tipo := ZDMTarifasModelos.DameTipoModelo(Trim(DBEModelo.Text));

  if (Tipo = 'PER') then
  begin
     DBELona.CondicionBusqueda := 'tipo=1';
  end
  else
  if (Tipo = 'TOL') then
  begin
     DBELona.CondicionBusqueda := 'tipo=0';
  end;
end;

end.
