unit UFMPedidosTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMPedidos, rxPlacemnt, ActnList, Menus, UTeclas, UControlEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, UEditPanel,
  ComCtrls, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid, UNavigator,
  DBCtrls, rxToolEdit, RXDBCtrl, Mask, Buttons, ExtCtrls, UFRTallas_s,
  ULFActionList, ULFFormStorage, ULFEditFind2000, ULFToolBar, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFLabel, ULFPageControl, ULFPanel, ULFEdit, URecursos,
  ULFDBDateEdit, Barras, UDBDateTimePicker, ULFComboBox, UG2kTBLoc;

type
  TFMPedidosTallas = class(TFMPedidos)
     TCTallas: TTabControl;
     FRTallas_s: TFRTallas_s;
     procedure TCTallasChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure CEDetalleEnter(Sender: TObject);
     procedure FRTallas_sCETallasEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPedidosTallas : TFMPedidosTallas;

implementation

uses UFormGest, UDMPedidos, UDMPedidosTallas;

{$R *.dfm}

procedure TFMPedidosTallas.TCTallasChange(Sender: TObject);
begin
  inherited;
  with TCTallas do
  begin
     if Tabs[TabIndex] = _('Tallas') then
     begin
        ControlEdit := FRTallas_s.CETallas;
        PDetalle.Visible := False;
        FRTallas_s.Visible := True;
        with DMPedidosTallas do
           FRTallas_S.LocateTalla(dm.LocateLineaTallas(QMDetalleID_DETALLES_S.AsInteger));
     end;
     if Tabs[TabIndex] = _('Normal') then
        with DMPedidosTallas do
        begin
           qmDetalle.Close;
           qmDetalle.Open;
           dm.LocateLineaNormal(qmDetalle, FRTallas_s.SelectedFieldName);
           HabilitaBotonesDetalle;
           ControlEdit := CEDetalle;
           PDetalle.Visible := True;
           FRTallas_s.Visible := False;
           DBGFDetalle.SetFocus;
           DBGFDetalle.SelectedIndex := DBGFDetalle.ColumnaInicial;
        end;
  end;
end;

procedure TFMPedidosTallas.FormCreate(Sender: TObject);
begin
  AbreData(TDMPedidosTallas, DMPedidos);
  DMPedidosTallas := TDMPedidosTallas(DMPedidos);
  FRTallas_s.SetDM(DMPedidosTallas.dm);
  inherited;
  // FRTallas_s.AjustarTitulos;
  FRTallas_s.AjustarGrid;
end;

procedure TFMPedidosTallas.CEDetalleEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Normal'));
  PDetalle.Visible := True;
  FRTallas_s.Visible := False;
end;

procedure TFMPedidosTallas.FRTallas_sCETallasEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Tallas'));
  PDetalle.Visible := False;
  FRTallas_s.Visible := True;
end;

procedure TFMPedidosTallas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  FRTallas_s.AjustarGrid;
end;

procedure TFMPedidosTallas.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMPedidosTallas);
  DMPedidos := nil;
end;

end.
