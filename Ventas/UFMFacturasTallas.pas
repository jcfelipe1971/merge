unit UFMFacturasTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMFacturas, rxPlacemnt, ActnList, Menus, UTeclas, UControlEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, UEditPanel,
  ComCtrls, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  rxToolEdit, RXDBCtrl, Mask, Buttons, ExtCtrls, UFRTallas_s, DBCtrls,
  UNavigator, Urecursos, ULFActionList, ULFFormStorage, ULFEditFind2000,
  ULFToolBar, ULFDBMemo, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFLabel, ULFPageControl, ULFPanel, ULFEdit,
  UDBDateTimePicker, UG2kTBLoc, DbComboBoxValue, ULFDBDateEdit, ULFComboBox,
  ULFFIBDBEditFind, ULFDBComboBoxValue;

type
  TFMFacturasTallas = class(TFMFacturas)
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
  FMFacturasTallas : TFMFacturasTallas;

implementation

uses UDMFacturasTallas, UDMFacturas, UFormGest;

{$R *.dfm}

procedure TFMFacturasTallas.TCTallasChange(Sender: TObject);
begin
  inherited;
  case TCTallas.TabIndex of
     1: // Tallas
     begin
        ControlEdit := FRTallas_s.CETallas;
        PDetalle.Visible := False;
        FRTallas_s.Visible := True;
        with DMFacturasTallas do
           FRTallas_S.LocateTalla(dm.LocateLineaTallas(QMDetalleID_DETALLES_S.AsInteger));
     end;
     0: // Normal
        with DMFacturasTallas do
        begin
           qmDetalle.Close;
           qmDetalle.Open;
           HabilitaBotonesDetalle;
           ControlEdit := CEDetalle;
           PDetalle.Visible := True;
           FRTallas_s.Visible := False;
           dm.LocateLineaNormal(qmDetalle, FRTallas_s.SelectedFieldName);
           DBGFDetalle1.SetFocus;
           DBGFDetalle1.SelectedIndex := DBGFDetalle1.ColumnaInicial;
        end;
  end;
end;

procedure TFMFacturasTallas.FormCreate(Sender: TObject);
begin
  AbreData(TDMFacturasTallas, DMFacturas);
  DMFacturasTallas := TDMFacturasTallas(DMFacturas);
  FRTallas_s.SetDM(DMFacturasTallas.dm);
  inherited;
  // FRTallas_s.AjustarTitulos;
  FRTallas_s.AjustarGrid;
end;

procedure TFMFacturasTallas.CEDetalleEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Normal'));
  PDetalle.Visible := True;
  FRTallas_s.Visible := False;
end;

procedure TFMFacturasTallas.FRTallas_sCETallasEnter(Sender: TObject);
begin
  TCTallas.TabIndex := TCTallas.Tabs.IndexOf(_('Tallas'));
  PDetalle.Visible := False;
  FRTallas_s.Visible := True;
end;

procedure TFMFacturasTallas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  FRTallas_s.AjustarGrid;
end;

procedure TFMFacturasTallas.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMFacturasTallas);
  DMFacturas := nil;
end;

end.
