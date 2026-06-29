unit UFMAlbaranesTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMAlbaranes, UFRTallas_s, ComCtrls, rxPlacemnt, ActnList, Menus,
  UTeclas, UControlEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, UEditPanel, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  UNavigator, DBCtrls, rxToolEdit, RXDBCtrl, Mask, Buttons, ExtCtrls,
  ULFActionList, ULFFormStorage, ULFEditFind2000, ULFToolBar, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFLabel, ULFPageControl, ULFPanel, ULFEdit, URecursos,
  ULFDBDateEdit, ULFComboBox, UDBDateTimePicker, UG2kTBLoc,
  DbComboBoxValue, ULFDBComboBoxValue;

type
  TFMAlbaranesTallas = class(TFMAlbaranes)
     TCTallas: TTabControl;
     FRTallas_s: TFRTallas_s;
     procedure TCTallasChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FRTallas_sCETallasEnter(Sender: TObject);
     procedure CEDetalleEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAlbaranesTallas : TFMAlbaranesTallas;

implementation

uses UDMAlbaranesTallas, UDMAlbaranes, UFormGest;

{$R *.dfm}

procedure TFMAlbaranesTallas.TCTallasChange(Sender: TObject);
begin
  inherited;
  with TCTallas do
  begin
     if Tabs[TabIndex] = _('Tallas') then
     begin
        ControlEdit := FRTallas_s.CETallas;
        PDetalle.Visible := False;
        FRTallas_s.Visible := True;
        with DMAlbaranesTallas do
           FRTallas_S.LocateTalla(dm.LocateLineaTallas(QMDetalleID_DETALLES_S.AsInteger));
     end;
     if Tabs[TabIndex] = _('Normal') then
        with DMAlbaranesTallas do
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

procedure TFMAlbaranesTallas.FormCreate(Sender: TObject);
begin
  AbreData(TDMAlbaranesTallas, DMAlbaranes);
  DMAlbaranesTallas := TDMAlbaranesTallas(DMAlbaranes);
  FRTallas_s.SetDM(DMAlbaranesTallas.dm);
  inherited;
  // FRTallas_s.AjustarTitulos;
  FRTallas_s.AjustarGrid;
end;

procedure TFMAlbaranesTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAlbaranesTallas);
  DMAlbaranes := nil;
end;

procedure TFMAlbaranesTallas.CEDetalleEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Normal'));
  PDetalle.Visible := True;
  FRTallas_s.Visible := False;
end;

procedure TFMAlbaranesTallas.FRTallas_sCETallasEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Tallas'));
  PDetalle.Visible := False;
  FRTallas_s.Visible := True;
end;

procedure TFMAlbaranesTallas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  FRTallas_s.AjustarGrid;
end;

end.
