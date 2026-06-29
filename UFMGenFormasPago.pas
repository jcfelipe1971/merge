unit UFMGenFormasPago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  Spin, UDBSpin, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  DbComboBoxValue, rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, DB,
  ULFEdit, ULFEditFind2000;

type
  TFMGenFormasPago = class(TFPEdit)
     DBETipo: TLFDbedit;
     LCodigo: TLFLabel;
     DBCBRemesar: TLFDBCheckBox;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LTipoEfecto: TLFLabel;
     LBLPlazos: TLFLabel;
     LBLPrimerPlazo: TLFLabel;
     LBLRestoPlazos: TLFLabel;
     DBCBProntoPago: TLFDBCheckBox;
     DBSEPlazos: TDBSpinEdit;
     DBSEPrimerPlazo: TDBSpinEdit;
     DBSERestoPlazos: TDBSpinEdit;
     LCuenta: TLFLabel;
     DBEFCuenta: TLFDBEditFind2000;
     ECuenta: TLFEdit;
     DBEFTipoEfecto: TLFDBEditFind2000;
     DBCBPagoAutomatico: TLFDBCheckBox;
     LDatosAMostrar: TLFLabel;
     DBCBVDatosBancarios: TDBComboBoxValue;
     DBCBHeredaFinanciacion: TLFDBCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     ARegeneraFP: TAction;
     DBCBOrdenarPago: TLFDBCheckBox;
     DBCBMesNatural: TLFDBCheckBox;
     LTipoPago: TLFLabel;
     DBCBTipoPago: TDBComboBox;
     DBCBAceptar: TLFDBCheckBox;
     LImporteMinimo: TLFLabel;
     DBEImporteMinimo: TLFDbedit;
     LFormaPagoAlternativa: TLFLabel;
     ETituloFormaPagoAlternativa: TLFEdit;
     DBEFPagoAlternativa: TLFDBEditFind2000;
     DBCBPedirDetallesDePago: TLFDBCheckBox;
     LTituloLargo: TLFLabel;
     DBETituloLargo: TLFDbedit;
     TSSeries: TTabSheet;
     TBSerie: TLFToolBar;
     PnlSerie: TLFPanel;
     NavSerie: THYMNavigator;
     DBGFSeries: TDBGridFind2000;
     PNSeries: TLFPanel;
     PCSeries: TLFPageControl;
     TEFichaSerie: TTabSheet;
     TSTablaSerie: TTabSheet;
     LSerie: TLFLabel;
     LCuentaPagoSerie: TLFLabel;
     DBEFCuentaPagoSerie: TLFDBEditFind2000;
     DBEFSerie: TLFDBEditFind2000;
     ESerie: TLFEdit;
     ECuentaPagoSerie: TLFEdit;
     ETipoEfecto: TLFEdit;
     DBCBActivo: TLFDBCheckBox;
     TSSuplemento: TTabSheet;
     PNLSuplemento: TLFPanel;
     PMSuplemento: TLFPageControl;
     TSFichaSuplemento: TTabSheet;
     PNLFichaSuplemento: TLFPanel;
     LTrasnsportista: TLFLabel;
     LPais: TLFLabel;
     TBSuplemento: TLFToolBar;
     NavSuplemento: THYMNavigator;
     DBEPaisSuplemento: TLFDBEditFind2000;
     DBEAcreedorSuplemento: TLFDBEditFind2000;
     EAcreedorSuplemento: TLFEdit;
     EPaisSuplemento: TLFEdit;
     TSTablaSuplemento: TTabSheet;
     DBGSuplemento: TDBGridFind2000;
     LImporteSuplemento: TLFLabel;
     DBELImporteSuplemento: TLFDbedit;
     LCuentaPagoComisionTarjeta: TLFLabel;
     DBEFCuentaPagoComisionTarjeta: TLFDBEditFind2000;
     ECuentaPagoComisionTarjeta: TLFEdit;
     DBCBDivideAsientoComisionTarjeta: TLFDBCheckBox;
     LComision: TLFLabel;
     DBEComision: TLFDbedit;
     LCuentaComisionSerie: TLFLabel;
     DBEFCuentaPagoComisionTarjetaSerie: TLFDBEditFind2000;
     ECuentaPagoComisionTarjetaSerie: TLFEdit;
     DBCBDivideAsientoComisionTarjetaSerie: TLFDBCheckBox;
     DBCHSinRecibos: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFCuentaVerificacion(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure ARegeneraFPExecute(Sender: TObject);
     procedure DBCBMesNaturalChange(Sender: TObject);
     procedure DBCBAceptarChange(Sender: TObject);
     procedure DBEFPagoAlternativaChange(Sender: TObject);
     procedure DBETituloLargoEnter(Sender: TObject);
     procedure DBEFCuentaPagoSerieChange(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure DBEFCuentaChange(Sender: TObject);
     procedure DBEFTipoEfectoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFCuentaPagoSerieVerificacion(Sender: TObject);
     procedure DBEAcreedorSuplementoChange(Sender: TObject);
     procedure DBEPaisSuplementoChange(Sender: TObject);
     procedure DBEFCuentaPagoComisionTarjetaChange(Sender: TObject);
     procedure DBEFCuentaPagoComisionTarjetaVerificacion(Sender: TObject);
     procedure DBEFCuentaPagoComisionTarjetaSerieChange(Sender: TObject);
     procedure DBEFCuentaPagoComisionTarjetaSerieVerificacion(Sender: TObject);
  private
     { Private declarations }
     procedure Habilita;
  public
     { Public declarations }
  end;

var
  FMGenFormasPago : TFMGenFormasPago;

implementation

uses UDMGenFormasPago, UFormGest, UDMMain, UUtiles, UEntorno, UFMain, UDameDato;

{$R *.DFM}

procedure TFMGenFormasPago.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGenFormasPago, DMGenFormasPago);
  DBGMain.DataSource := DMGenFormasPago.DSQMFormaPago;
  NavMain.DataSource := DMGenFormasPago.DSQMFormaPago;
  EPMain.DataSource := DMGenFormasPago.DSQMFormaPago;
  G2kTableLoc.DataSource := DMGenFormasPago.DSQMFormaPago;

  ControlEdit := CEMain;
  Habilita;
  DBEFCuenta.MaxLength := REntorno.DigitosSub;
  DBEFCuentaPagoSerie.MaxLength := REntorno.DigitosSub;
  DBEFCuentaPagoComisionTarjeta.MaxLength := REntorno.DigitosSub;
  FMain.AddComponentePunto(DBEFCuenta);
  FMain.AddComponentePunto(DBEFCuentaPagoSerie);
  FMain.AddComponentePunto(DBEFCuentaPagoComisionTarjeta);

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMGenFormasPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(DBEFCuenta);
  FMain.DelComponentePunto(DBEFCuentaPagoSerie);
  FMain.DelComponentePunto(DBEFCuentaPagoComisionTarjeta);
  CierraData(DMGenFormasPago);
end;

procedure TFMGenFormasPago.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMGenFormasPago.BusquedaCompleja;
  Continua := False;
end;

procedure TFMGenFormasPago.DBEFCuentaVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEFCuenta);
end;

procedure TFMGenFormasPago.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  Habilita;
end;

procedure TFMGenFormasPago.Habilita;
begin
  if DBCBAceptar.Checked then
  begin
     LTipoPago.Visible := True;
     DBCBTipoPago.Visible := True;
  end
  else
  begin
     LTipoPago.Visible := False;
     DBCBTipoPago.Visible := False;
  end;

  if ((DBCBTipoPago.Visible) and (DMGenFormasPago.Edicion = 1)) then
     DBCBTipoPago.SetFocus;
end;

procedure TFMGenFormasPago.ARegeneraFPExecute(Sender: TObject);
begin
  DMGenFormasPago.Regenera;
end;

procedure TFMGenFormasPago.DBCBMesNaturalChange(Sender: TObject);
var
  num : integer;
begin
  if (DBCBMesNatural.Checked) then
  begin
     LBLPrimerPlazo.Caption := _('Meses 1er Plazo');
     if (DMGenFormasPago.QMFormaPago.State in [dsInsert, dsEdit]) then
     begin
        num := StrToInt(DBSEPrimerPlazo.Text) div 30;
        DBSEPrimerPlazo.Text := IntToStr(num);
        num := StrToInt(DBSERestoPlazos.Text) div 30;
        DBSERestoPlazos.Text := IntToStr(num);
     end;
  end
  else
  begin
     LBLPrimerPlazo.Caption := _('Dias 1er Plazo');
     if (DMGenFormasPago.QMFormaPago.State in [dsInsert, dsEdit]) then
     begin
        num := StrToInt(DBSEPrimerPlazo.Text) * 30;
        DBSEPrimerPlazo.Text := IntToStr(num);
        num := StrToInt(DBSERestoPlazos.Text) * 30;
        DBSERestoPlazos.Text := IntToStr(num);
     end;
  end;
end;

procedure TFMGenFormasPago.DBCBAceptarChange(Sender: TObject);
begin
  inherited;
  Habilita;
end;

procedure TFMGenFormasPago.DBEFPagoAlternativaChange(Sender: TObject);
begin
  inherited;
  ETituloFormaPagoAlternativa.Text := DameTituloFormaPago(DBEFPagoAlternativa.Text);
end;

procedure TFMGenFormasPago.DBETituloLargoEnter(Sender: TObject);
begin
  inherited;
  if (Trim(DMGenFormasPago.QMFormaPagoTITULO_LARGO.AsString) = '') then
     DMGenFormasPago.QMFormaPagoTITULO_LARGO.AsString := DMGenFormasPago.QMFormaPagoTITULO.AsString;
end;

procedure TFMGenFormasPago.DBEFCuentaPagoSerieChange(Sender: TObject);
begin
  inherited;
  ECuentaPagoSerie.Text := DameTituloCuenta(DBEFCuentaPagoSerie.Text);
end;

procedure TFMGenFormasPago.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMGenFormasPago.DBEFCuentaChange(Sender: TObject);
begin
  inherited;
  ECuenta.Text := DameTituloCuenta(DBEFCuenta.Text);
end;

procedure TFMGenFormasPago.DBEFTipoEfectoChange(Sender: TObject);
begin
  inherited;
  ETipoEfecto.Text := DameTituloEfecto(DBEFTipoEfecto.Text);
end;

procedure TFMGenFormasPago.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMGenFormasPago.DBEFCuentaPagoSerieVerificacion(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(DBEFCuentaPagoSerie);
end;

procedure TFMGenFormasPago.DBEAcreedorSuplementoChange(Sender: TObject);
begin
  inherited;
  EAcreedorSuplemento.Text := DameTituloAcreedor(StrToIntDef(DBEAcreedorSuplemento.Text, 0));
end;

procedure TFMGenFormasPago.DBEPaisSuplementoChange(Sender: TObject);
begin
  inherited;
  if (DBEPaisSuplemento.Text = 'ZZZ') then
     EPaisSuplemento.Text := _('Todos')
  else
     EPaisSuplemento.Text := DameTituloPais(DBEPaisSuplemento.Text);
end;

procedure TFMGenFormasPago.DBEFCuentaPagoComisionTarjetaChange(Sender: TObject);
begin
  inherited;
  ECuentaPagoComisionTarjeta.Text := DameTituloCuenta(DBEFCuentaPagoComisionTarjeta.Text);
end;

procedure TFMGenFormasPago.DBEFCuentaPagoComisionTarjetaVerificacion(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(DBEFCuentaPagoComisionTarjeta);
end;

procedure TFMGenFormasPago.DBEFCuentaPagoComisionTarjetaSerieChange(Sender: TObject);
begin
  inherited;
  ECuentaPagoComisionTarjetaSerie.Text := DameTituloCuenta(DBEFCuentaPagoComisionTarjetaSerie.Text);
end;

procedure TFMGenFormasPago.DBEFCuentaPagoComisionTarjetaSerieVerificacion(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(DBEFCuentaPagoComisionTarjetaSerie);
end;

end.
