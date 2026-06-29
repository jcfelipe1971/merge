unit UFMAlbaranesAlquiler;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFMAlbaranes, ULFActionList, ExtCtrls, rxPlacemnt, ULFFormStorage,
  ActnList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, UEditPanel, UHYDBGrid,
  Grids, DBGrids, NsDBGrid, DBCtrls, UNavigator, ComCtrls, StdCtrls,
  ToolWin, ULFToolBar, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFEdit,
  ULFDBEditFind2000, Mask, ULFDBEdit, ULFLabel, Buttons, ULFPageControl,
  ULFPanel, ULFDBMemo, ULFComboBox, UDBDateTimePicker, UG2kTBLoc,
  DbComboBoxValue, ULFDBComboBoxValue;

type
  TFMAlbaranesAlquiler = class(TFMAlbaranes)
     PNLDocumentosRelacionados: TLFPanel;
     LMovimientoDevolucion: TLFLabel;
     DBEMovimientoDevolucion: TLFDbedit;
     LFacturaAlquiler: TLFLabel;
     DBEFacturaAlquiler: TLFDbedit;
     LFacturaRoturas: TLFLabel;
     DBEFacturaRoturas: TLFDbedit;
     LSerieRoturas: TLFLabel;
     ESerieRoturas: TLFEdit;
     DBEFSerieRoturas: TLFDBEditFind2000;
     SBMovimientoDevolucion: TSpeedButton;
     SBFacturaAlquiler: TSpeedButton;
     SBFacturaRoturas: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFSerieRoturasChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure SBFacturaAlquilerDblClick(Sender: TObject);
     procedure SBFacturaRoturasDblClick(Sender: TObject);
     procedure SBMovimientoDevolucionDblClick(Sender: TObject);
     procedure AFacturaExecute(Sender: TObject);
  private
     { Private declarations }
     // DMAlbaranesAlquiler: TDataModule;
  public
     { Public declarations }
     procedure Notas;
  end;

var
  FMAlbaranesAlquiler : TFMAlbaranesAlquiler;

implementation

uses
  UDMMain, UFormGest, UEntorno, UDMAlbaranes, UDMAlbaranesAlquiler, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMAlbaranesAlquiler.FormCreate(Sender: TObject);
begin
  AbreData(TDMAlbaranesAlquiler, DMAlbaranes);
  DMAlbaranesAlquiler := TDMAlbaranesAlquiler(DMAlbaranes);

  inherited;
end;

procedure TFMAlbaranesAlquiler.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMAlbaranesAlquiler);
  DMAlbaranes := nil;
end;

procedure TFMAlbaranesAlquiler.Notas;
begin
  if UDameDato.Notas('CLI', StrToIntDef(EFCliente.Text, 0)) then
     RelojNotas.Enabled := True
  else
  begin
     RelojNotas.Enabled := False;
     LBNotas.Visible := False;
  end;
end;

procedure TFMAlbaranesAlquiler.DBEFSerieRoturasChange(Sender: TObject);
begin
  inherited;
  ESerieRoturas.Text := DameTituloSerie(DBEFSerieRoturas.Text);
end;

procedure TFMAlbaranesAlquiler.FormActivate(Sender: TObject);
begin
  inherited;
  SolapaControles(SBMovimientoDevolucion, DBEMovimientoDevolucion);
  SolapaControles(SBFacturaAlquiler, DBEFacturaAlquiler);
  SolapaControles(SBFacturaRoturas, DBEFacturaRoturas);

  DBEMovimientoDevolucion.Color := REntorno.ColorEnlaceActivo;
  DBEFacturaAlquiler.Color := REntorno.ColorEnlaceActivo;
  DBEFacturaRoturas.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMAlbaranesAlquiler.SBFacturaAlquilerDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMAlbaranesAlquiler.QMCabeceraID_S_FAC_ALQUILER.AsInteger);
end;

procedure TFMAlbaranesAlquiler.SBFacturaRoturasDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMAlbaranesAlquiler.QMCabeceraID_S_FAC_ROTURAS.AsInteger);
end;

procedure TFMAlbaranesAlquiler.SBMovimientoDevolucionDblClick(Sender: TObject);
begin
  inherited;
  // if (DMAlbaranesAlquiler.QMCabeceraID_ST_DEVOLUCION.AsInteger = 0) then
  //    DMAlbaranesAlquiler.CreaMovimientoDevolucion;

  FMain.TraspasoDeDocumentosMovimiento(DMAlbaranesAlquiler.QMCabeceraID_ST_DEVOLUCION.AsInteger);
end;

procedure TFMAlbaranesAlquiler.AFacturaExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMAlbaranesAlquiler.TraspasarAlbaranActual('FAC');
  finally
     Screen.Cursor := crDefault;
  end;
end;

end.
