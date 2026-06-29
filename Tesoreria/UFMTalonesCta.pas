unit UFMTalonesCta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, DBCtrls, Mask, UDBDateTimePicker,
  rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc,
  Buttons, ULFDBMemo, ULFDBDateEdit, ULFEdit;

type
  TFMTalonesCta = class(TFPEdit)
     PNDetalle: TLFPanel;
     CEDetalle: TControlEdit;
     DBGFDetalle: TDBGridFind2000;
     CEDetallePMEdit: TPopUpTeclas;
     LBLFecha: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LBLLugar: TLFLabel;
     DBELugar: TLFDbedit;
     LImporte: TLFLabel;
     DBEImporte: TLFDbedit;
     DBCHKCerrada: TLFDBCheckBox;
     DBEFBanco: TLFDBEditFind2000;
     ETituloBanco: TLFEdit;
     LBanco: TLFLabel;
     LBLDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBETalon: TLFDbedit;
     LBLTalon: TLFLabel;
     DBEFCuenta: TLFDBEditFind2000;
     LBLCuenta: TLFLabel;
     ETituloCuenta: TLFEdit;
     ALstTalones: TAction;
     LFCategoryAction1: TLFCategoryAction;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     ToolButton1: TToolButton;
     TButtContabilizaTalon: TToolButton;
     TButtDescotabiliartalon: TToolButton;
     DBEAsiento: TLFDbedit;
     AAsientoTalon: TAction;
     SBVerAsientos: TSpeedButton;
     LFLContador: TLFLabel;
     LFDContador: TLFDbedit;
     LComentario: TLFLabel;
     LFDBComentario: TLFDBMemo;
     procedure DBEFCuentaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFBancoChange(Sender: TObject);
     procedure TButtContabilizaTalonClick(Sender: TObject);
     procedure TButtDescotabiliartalonClick(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFCuentaExit(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure ALstTalonesExecute(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AAsientoTalonCta(Sender: TObject);
     procedure SBVerAsientosDblClick(Sender: TObject);
     procedure DBCHKCerradaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTalonesCta : TFMTalonesCta;

implementation

uses UDMTalonesCta, UDMMain, UUtiles, UFormGest, UFPregTalones, UFMain,
  UEntorno, DB, UDameDato;

{$R *.DFM}

procedure TFMTalonesCta.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTalonesCta, DMTalonesCta);
  // Se asigna el PopUp del principal
  FMTalonesCta.PopupMenu := CEMainPMEdit;
  FMain.AddComponentePunto(DBEFCuenta);

  NavMain.DataSource := DMTalonesCta.DSQMTalones;
  DBGMain.DataSource := DMTalonesCta.DSQMTalones;

  SolapaControles(SBVerAsientos, DBEAsiento);
  DBEAsiento.Color := REntorno.ColorEnlaceActivo;

  if (REntorno.Pais <> 'DOM') then
  begin
     LFDContador.Visible := False;
     LFLContador.Visible := False;
  end;

  if (REntorno.Pais = 'DOM') then
     LBLLugar.Caption := _('Nomb.');

  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'C_CONTRAPARTIDA');
end;

procedure TFMTalonesCta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FMain.DelComponentePunto(DBEFCuenta);
  CierraData(DMTalonesCta);
end;

procedure TFMTalonesCta.DBEFCuentaChange(Sender: TObject);
begin
  ETituloCuenta.Text := DameTituloCuenta(DBEFCuenta.Text);
end;

procedure TFMTalonesCta.DBEFBancoChange(Sender: TObject);
var
  Talon : integer;
begin
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(DBEFBanco.Text, 0));
  if DMTalonesCta.ContadorAutomaticoBanco(StrToIntDef(DBEFBanco.Text, 0)) then
  begin
     if (DMTalonesCta.QMTalones.State <> dsBrowse) then
     begin
        Talon := DMTalonesCta.DameTalon;
        if (Talon >= 0) then
           DMTalonesCta.QMTalonesTALON.AsString := IntToStr(Talon + 1);
     end;

     DBETalon.Enabled := False;
     ColorInfo(DBETalon);
  end
  else
  begin
     DBETalon.Enabled := True;
     ColorNormal(DBETalon);
  end;
end;

procedure TFMTalonesCta.TButtContabilizaTalonClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     ShowMessage(_('Este talón ya está contabilizado'))
  else
     DMTalonesCta.Contabilizar(1);
end;

procedure TFMTalonesCta.TButtDescotabiliartalonClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     DMTalonesCta.Contabilizar(0)
  else
     ShowMessage(_('Este talón no está contabilizado'));
end;

procedure TFMTalonesCta.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  DMTalonesCta.GuardaMaestro;
end;

procedure TFMTalonesCta.DBEFCuentaExit(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuenta);
end;

procedure TFMTalonesCta.DBGFDetalleColEnter(Sender: TObject);
begin
  if (DBGFDetalle.SelectedField.FieldName = 'C_CONTRAPARTIDA') then
     FMain.AddComponentePunto(DBGFDetalle)
  else
     FMain.DelComponentePunto(DBGFDetalle);
end;

procedure TFMTalonesCta.DBGFDetalleBusqueda(Sender: TObject);
begin
  if (DBGFDetalle.SelectedField.FieldName = 'C_CONTRAPARTIDA') then
  begin
     // Cuando se abandone la columna de cuenta expandirá la cuenta si esta tiene un punto
     DBGFDetalle.SelectedField.AsString :=
        ExpandirCadena(Trim(DBGFDetalle.SelectedField.AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMTalonesCta.DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  if (DBGFDetalle.SelectedField.FieldName = 'C_CONTRAPARTIDA') then
  begin
     // Cuando se abandone la columna de cuenta expandirá la cuenta si esta tiene un punto
     DBGFDetalle.SelectedField.AsString :=
        ExpandirCadena(Trim(DBGFDetalle.SelectedField.AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMTalonesCta.ALstTalonesExecute(Sender: TObject);
begin
  inherited;
  TFPregTalones.Create(Self).mostrar(2, 'T');
end;

procedure TFMTalonesCta.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMTalonesCta.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMTalonesCta.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTalonesCta.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTalonesCta.AAsientoTalonCta(Sender: TObject);
begin
  if (DMTalonesCta.QMTalonesPAGADO.AsInteger = 1) then
     FMain.MuestraMovConta(' RIC=' + IntToStr(DMTalonesCta.QMTalonesRIC.AsInteger) +
        ' and ejercicio=' + IntToStr(DMTalonesCta.QMTalonesEJERCICIO.AsInteger));
end;

procedure TFMTalonesCta.SBVerAsientosDblClick(Sender: TObject);
begin
  AAsientoTalon.Execute;
end;

procedure TFMTalonesCta.DBCHKCerradaChange(Sender: TObject);
begin
  DBEAsiento.Visible := DBCHKCerrada.Checked;
end;

end.
