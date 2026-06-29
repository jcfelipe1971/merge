unit UFMAlbaranesAProveedorTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMAlbaranesAProveedor, ComCtrls, rxPlacemnt, ActnList, Menus,
  UTeclas, UControlEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, UEditPanel, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  UNavigator, DBCtrls, UDBDateTimePicker, Mask, Buttons, ExtCtrls, DB,
  rxToolEdit, RXDBCtrl, UFRTallas_e, ULFActionList, ULFFormStorage,
  ULFEditFind2000, ULFToolBar, ULFDBMemo, ULFDBEditFind2000, ULFDBEdit,
  ULFLabel, ULFPageControl, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, URecursos, ULFDBDateEdit, ULFEdit, UG2kTBLoc;

type
  TFMAlbaranesAProveedorTallas = class(TFMAlbaranesAProveedor)
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
  FMAlbaranesAProveedorTallas : TFMAlbaranesAProveedorTallas;

implementation

uses UDMAlbaranesAProveedorTallas, UDMAlbaranesAProveedor, UFormGest;

{$R *.dfm}

procedure TFMAlbaranesAProveedorTallas.TCTallasChange(Sender: TObject);
begin
  inherited;
  with TCTallas do
  begin
     if Tabs[TabIndex] = _('Tallas') then
     begin
        ControlEdit := FRTallas_e.CETallas;
        PDetalle.Visible := False;
        FRTallas_e.Visible := True;
        with DMAlbaranesAProveedorTallas do
           FRTallas_e.LocateTalla(dm.LocateLineaTallas(QMDetalleID_DETALLES_E.AsInteger));
     end;
     if Tabs[TabIndex] = _('Normal') then
        with DMAlbaranesAProveedorTallas do
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

procedure TFMAlbaranesAProveedorTallas.FormCreate(Sender: TObject);
begin
  AbreData(TDMAlbaranesAProveedorTallas, DMAlbaranesAProveedor);
  DMAlbaranesAProveedorTallas := TDMAlbaranesAProveedorTallas(DMAlbaranesAProveedor);
  FRTallas_e.SetDM(DMAlbaranesAProveedorTallas.dm);
  inherited;
  //  FRTallas_e.AjustarTitulos;
  FRTallas_e.AjustarGrid;
end;

procedure TFMAlbaranesAProveedorTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAlbaranesAProveedorTallas);
  DMAlbaranesAProveedor := nil;
end;

procedure TFMAlbaranesAProveedorTallas.CEDetalleEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Normal'));
  PDetalle.Visible := True;
  FRTallas_e.Visible := False;
end;

procedure TFMAlbaranesAProveedorTallas.FRTallas_eCETallasEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Tallas'));
  PDetalle.Visible := False;
  FRTallas_e.Visible := True;
end;

procedure TFMAlbaranesAProveedorTallas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  FRTallas_e.AjustarGrid;
end;

end.
