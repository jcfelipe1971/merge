unit UFMOfertasTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMOfertas, UFRTallas_s, ComCtrls, rxPlacemnt, ActnList, Menus,
  UTeclas, UControlEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, UEditPanel, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  UNavigator, DBCtrls, rxToolEdit, RXDBCtrl, Mask, Buttons, ExtCtrls,
  ULFActionList, ULFFormStorage, ULFEditFind2000, ULFToolBar, ULFDBMemo,
  ULFDBEditFind2000, ULFDBEdit, ULFLabel, ULFPageControl, ULFPanel,
  ULFEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, URecursos,
  ULFDBDateEdit, ULFComboBox, UG2kTBLoc, UDBDateTimePicker;

type
  TFMOfertasTallas = class(TFMOfertas)
     TCTallas: TTabControl;
     FRTallas_s: TFRTallas_s;
     procedure TCTallasChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CEDetalleEnter(Sender: TObject);
     procedure FRTallas_sCETallasEnter(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMOfertasTallas : TFMOfertasTallas;

implementation

uses UDMOfertasTallas, UFormGest, UDMOfertas;

{$R *.dfm}

procedure TFMOfertasTallas.TCTallasChange(Sender: TObject);
begin
  inherited;
  with TCTallas do
  begin
     if Tabs[TabIndex] = _('Tallas') then
     begin
        ControlEdit := FRTallas_s.CETallas;
        PDetalle.Visible := False;
        FRTallas_s.Visible := True;
        with DMOfertasTallas do
           FRTallas_S.LocateTalla(dm.LocateLineaTallas(QMDetalleID_DETALLES_S.AsInteger));
     end;
     if Tabs[TabIndex] = _('Normal') then
        with DMOfertasTallas do
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

procedure TFMOfertasTallas.FormCreate(Sender: TObject);
begin
  AbreData(TDMOfertasTallas, DMOfertas);
  DMOfertasTallas := TDMOfertasTallas(DMOfertas);
  FRTallas_s.SetDM(DMOfertasTallas.dm);
  inherited;
  // FRTallas_s.AjustarTitulos;
  FRTallas_s.AjustarGrid;
end;

procedure TFMOfertasTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMOfertasTallas);
  DMOfertas := nil;
end;

procedure TFMOfertasTallas.CEDetalleEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Normal'));
  PDetalle.Visible := True;
  FRTallas_s.Visible := False;
end;

procedure TFMOfertasTallas.FRTallas_sCETallasEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Tallas'));
  PDetalle.Visible := False;
  FRTallas_s.Visible := True;
end;

procedure TFMOfertasTallas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  FRTallas_s.AjustarGrid;
end;

end.
