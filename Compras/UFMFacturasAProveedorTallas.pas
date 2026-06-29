unit UFMFacturasAProveedorTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMFacturasAProveedor, rxPlacemnt, ActnList, Menus, UTeclas,
  UControlEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls,
  UEditPanel, ComCtrls, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  UNavigator, DBCtrls, rxToolEdit, RXDBCtrl, Mask, Buttons, ExtCtrls,
  UFRTallas_e, UDBDateTimePicker, ULFActionList, ULFFormStorage,
  ULFEditFind2000, ULFToolBar, ULFDBMemo, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, ULFLabel, ULFPageControl,
  ULFPanel, DbComboBoxValue, ULFEdit, ULFDBDateEdit, UG2kTBLoc;

type
  TFMFacturasAProveedorTallas = class(TFMFacturasAProveedor)
     TCTallas: TTabControl;
     FRTallas_e: TFRTallas_e;
     procedure FormCreate(Sender: TObject);
     procedure CEDetalleEnter(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FRTallas_eCETallasEnter(Sender: TObject);
     procedure TCTallasChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMFacturasAProveedorTallas : TFMFacturasAProveedorTallas;

implementation

uses UDMFacturasAProveedorTallas, UDMFacturasAProveedor, UFormGest;

{$R *.dfm}

procedure TFMFacturasAProveedorTallas.TCTallasChange(Sender: TObject);
begin
  inherited;
  with TCTallas do
  begin
     if Tabs[TabIndex] = _('Tallas') then
     begin
        ControlEdit := FRTallas_e.CETallas;
        PDetalle.Visible := False;
        FRTallas_e.Visible := True;
        with DMFacturasAProveedorTallas do
           FRTallas_e.LocateTalla(dm.LocateLineaTallas(QMDetalleID_DETALLES_E.AsInteger));
     end;
     if Tabs[TabIndex] = _('Normal') then
        with DMFacturasAProveedorTallas do
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

procedure TFMFacturasAProveedorTallas.FormCreate(Sender: TObject);
begin
  AbreData(TDMFacturasAProveedorTallas, DMFacturasAProveedor);
  DMFacturasAProveedorTallas := TDMFacturasAProveedorTallas(DMFacturasAProveedor);
  FRTallas_e.SetDM(DMFacturasAProveedorTallas.dm);
  inherited;
  //  FRTallas_e.AjustarTitulos;
  FRTallas_e.AjustarGrid;
end;

procedure TFMFacturasAProveedorTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFacturasAProveedorTallas);
  DMFacturasAProveedor := nil;
end;

procedure TFMFacturasAProveedorTallas.CEDetalleEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Normal'));
  PDetalle.Visible := True;
  FRTallas_e.Visible := False;
end;

procedure TFMFacturasAProveedorTallas.FRTallas_eCETallasEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Tallas'));
  PDetalle.Visible := False;
  FRTallas_e.Visible := True;
end;

end.
