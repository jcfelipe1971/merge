unit UProFMGestOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ToolWin, ComCtrls, ExtCtrls, UNavigator, Menus, UTeclas, UControlEdit,
  UEditPanel, UFormGest, StdCtrls, DBCtrls, Mask, UHYEdits,
  UDBDateTimePicker, DB, NsDBGrid, rxToolEdit, RXDBCtrl, rxPlacemnt, ULFDBMemo,
  ULFPanel, ULFToolBar, ULFFormStorage, ULFLabel, ULFDBDateEdit,
  ULFPageControl, ULFComboBox;

type
  TProFMGestOrden = class(TG2KForm)
     TBMain: TLFToolBar;
     NavOrden: THYMNavigator;
     TSep1: TToolButton;
     TButtLanzarOF: TToolButton;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     HYMEditPanel1: THYMEditPanel;
     TSep2: TToolButton;
     Orden: TLFComboBox;
     TSep3: TToolButton;
     CECierres: TControlEdit;
     CECierresPMEdit: TPopUpTeclas;
     FSMain: TLFFibFormStorage;
     BLanzarReservar: TToolButton;
     BtSeleccionaTodos: TToolButton;
     TBActions: TLFToolBar;
     BtCalculaNecesidades: TToolButton;
     CBAlmacen: TLFComboBox;
     PCMain: TLFPageControl;
     TSOrdenes: TTabSheet;
     DBGFOrden: TDBGridFind2000;
     TSNecesidades: TTabSheet;
     DBNecesidades: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtLanzarOFClick(Sender: TObject);
     procedure DBGFOrdenDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure OrdenChange(Sender: TObject);
     procedure HYDBEdit1Exit(Sender: TObject);
     procedure BLanzarReservarClick(Sender: TObject);
     procedure BtSeleccionaTodosClick(Sender: TObject);
     procedure HYMEditPanel1ClickRango(Sender: TObject; var Continua: boolean);
     procedure BtCalculaNecesidadesClick(Sender: TObject);
     procedure LlenarCombo;
     procedure CBAlmacenChange(Sender: TObject);
  private
     { Private declarations }
     seleccionar: boolean;
  public
     { Public declarations }
  end;

var
  ProFMGestOrden : TProFMGestOrden;

implementation

uses UDMMain, UProDMGestOrden, UEntorno, UProFMSelecImpEsc, FIBDataSet, URellenaLista;

var
  ColoresSituacion : array [0..4] of TColor = (clRed, clFuchsia, clGreen, clBlue, clBlack);

{$R *.dfm}

procedure TProFMGestOrden.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMGestOrden, ProDMGestOrden);
  // DataSources
  NavOrden.DataSource := ProDMGestOrden.DSQMProOrd;
  DBGFOrden.DataSource := ProDMGestOrden.DSQMProOrd;
  LlenarCombo;
  Orden.ItemIndex := 5;
  seleccionar := False;
end;

procedure TProFMGestOrden.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
     ProDMGestOrden.SeleccionarDeseleccionar(False);
  except
  end;
  CierraData(ProDMGestOrden);
  Action := caFree;
end;

procedure TProFMGestOrden.TButtLanzarOFClick(Sender: TObject);
var
  valor : integer;
begin
  if ProDMGestOrden.QMProOrdSITUACION.AsInteger = 0 then
  begin
     ProFMSelecImpEsc := TProFMSelecImpEsc.Create(Self);
     ProFMSelecImpEsc.dm := ProDMGestOrden;
     ProFMSelecImpEsc.ShowModal;

     // Actualizo el grid
     valor := Orden.ItemIndex;
     OrdenChange(Sender);
     Orden.ItemIndex := -1;
     Orden.ItemIndex := valor;
  end
  else
     ShowMessage(_('La Orden de Produccion ya ha sido lanzada'));
end;

procedure TProFMGestOrden.DBGFOrdenDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with TDBGridFind2000(Sender) do
  begin
     if (datacol = 0) then
     begin
        Canvas.Font.Color := ColoresSituacion[ProDMGestOrden.QMProOrdSITUACION.AsInteger];
        if (gdSelected in State) and Focused then
           Canvas.Brush.Color := clWhite;
     end;
     DefaultDrawColumnCell(rect, datacol, column, State);
  end;
end;

procedure TProFMGestOrden.OrdenChange(Sender: TObject);
var
  Situacion : integer;
begin
  if Orden.ItemIndex > 4 then
     Situacion := -1
  else
     Situacion := Orden.ItemIndex;

  ProDMGestOrden.FiltraSituacion(Situacion);
end;

procedure TProFMGestOrden.HYDBEdit1Exit(Sender: TObject);
begin
  { if ProDMGestOrden.QMProCierres.State = dsInsert then
    if ProDMGestOrden.QMProCierresUNDS.Value > ProDMGestOrden.QMProOrdUNI_TOTAL.Value then
    begin
      ShowMessage(_('Las undidades de cierre no pueden ser superiores a las de produccion'));
      HYDBEdit1.SetFocus;
    end;  }
end;

procedure TProFMGestOrden.BLanzarReservarClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar(string(_('Este Proceso es costoso ¿Continuar?'))),
     PChar(string(_('Lanzamiento y reserva de ordenes selecionadas'))),
     mb_iconstop + mb_yesno) = id_yes) then
  begin
     ProDMGestOrden.LanzarCerrar;
     ShowMessage(_('El lanzamiento y reserva de ordenes ha finalizado.'));
     DBGFOrden.Refresh;
  end;
end;

procedure TProFMGestOrden.BtSeleccionaTodosClick(Sender: TObject);
begin
  Seleccionar := not Seleccionar;
  ProDMGestOrden.SeleccionarDeseleccionar(Seleccionar);
  DBGFOrden.Refresh;
end;

procedure TProFMGestOrden.HYMEditPanel1ClickRango(Sender: TObject; var Continua: boolean);
begin
  ProDMGestOrden.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMGestOrden.BtCalculaNecesidadesClick(Sender: TObject);
var
  Almacen : string;
begin
  Almacen := Copy(CBAlmacen.Text, 1, Pos(' ', CBAlmacen.Text));
  ProDMGestOrden.CalculaNecesidadesTotal(Almacen);
  TSNecesidades.TabVisible := True;
  TSNecesidades.Visible := True;
  PCMain.ActivePage := TSNecesidades;
  ShowMessage(Format(_('Necesidades calculadas para el almacen %s'), [CBAlmacen.Text]));
end;

procedure TProFMGestOrden.LlenarCombo;
begin
  RellenaAlmacenes(CBAlmacen.Items);
  // Borro la primera opción: 'Todos los Almacenes'
  CBAlmacen.Items.Delete(0);
  CBAlmacen.ItemIndex := 0;
end;

procedure TProFMGestOrden.CBAlmacenChange(Sender: TObject);
begin
  if TSNecesidades.TabVisible then
  begin
     TSNecesidades.Hide;
     TSNecesidades.TabVisible := False;
  end;
end;

end.
