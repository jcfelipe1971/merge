unit UFMPedidosAProveedorTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMPedidosAProveedor, rxPlacemnt, ActnList, Menus, UTeclas,
  UControlEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls,
  UEditPanel, ComCtrls, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  UNavigator, DBCtrls, UDBDateTimePicker, Mask, Buttons, ExtCtrls,
  rxToolEdit, RXDBCtrl, UFRTallas_e, ULFActionList, ULFFormStorage,
  ULFEditFind2000, ULFToolBar, ULFDBMemo, ULFDBEditFind2000, ULFDBEdit,
  ULFLabel, ULFPageControl, ULFPanel, URecursos, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFEdit, ULFDBDateEdit, UG2kTBLoc;

type
  TFMPedidosAProveedorTallas = class(TFMPedidosAProveedor)
     TCTallas: TTabControl;
     FRTallas_e: TFRTallas_e;
     procedure TCTallasChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CEDetalleEnter(Sender: TObject);
     procedure FRTallas_eCETallasEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPedidosAProveedorTallas : TFMPedidosAProveedorTallas;

implementation

uses UDMPedidosAProveedor, UDMPedidosAProveedorTallas, UFormGest;

{$R *.dfm}

procedure TFMPedidosAProveedorTallas.TCTallasChange(Sender: TObject);
begin
  inherited;
  with TCTallas do
  begin
     if Tabs[TabIndex] = _('Tallas') then
     begin
        ControlEdit := FRTallas_e.CETallas;
        PDetalle.Visible := False;
        FRTallas_e.Visible := True;
        with DMPedidosAProveedorTallas do
           FRTallas_e.LocateTalla(dm.LocateLineaTallas(QMDetalleID_DETALLES_E.AsInteger));
     end;
     if Tabs[TabIndex] = _('Normal') then
        with DMPedidosAProveedorTallas do
        begin
           qmDetalle.Close;
           qmDetalle.Open;
           dm.LocateLineaNormal(qmDetalle, FRTallas_e.SelectedFieldName);
           HabilitaBotonesDetalle;
           ControlEdit := CEDetalle;
           PDetalle.Visible := True;
           FRTallas_e.Visible := False;
           DBGFDetalle.SetFocus;
           DBGFDetalle.SelectedIndex := DBGFDetalle.ColumnaInicial;
        end;
  end;
end;

procedure TFMPedidosAProveedorTallas.FormCreate(Sender: TObject);
begin
  AbreData(TDMPedidosAProveedorTallas, DMPedidosAProveedor);
  DMPedidosAProveedorTallas := TDMPedidosAProveedorTallas(DMPedidosAProveedor);
  FRTallas_e.SetDM(DMPedidosAProveedorTallas.dm);
  inherited;
  // FRTallas_e.AjustarTitulos;
  FRTallas_e.AjustarGrid;
end;

procedure TFMPedidosAProveedorTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPedidosAProveedorTallas);
  DMPedidosAProveedor := nil;
end;

procedure TFMPedidosAProveedorTallas.CEDetalleEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Normal'));
  PDetalle.Visible := True;
  FRTallas_e.Visible := False;
end;

procedure TFMPedidosAProveedorTallas.FRTallas_eCETallasEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Tallas'));
  PDetalle.Visible := False;
  FRTallas_e.Visible := True;
end;

procedure TFMPedidosAProveedorTallas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  FRTallas_e.AjustarGrid;
end;

end.
