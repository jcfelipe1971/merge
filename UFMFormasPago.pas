unit UFMFormasPago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  Spin, UDBSpin, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  DbComboBoxValue, rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, DB;

type
  TFMFormasPago = class(TFPEdit)
     DBETipo: TLFDbedit;
     LBLCodigo: TLFLabel;
     DBCHKActivo: TLFDBCheckBox;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLTipoEfecto: TLFLabel;
     LBLPlazos: TLFLabel;
     LBLPrimerPlazo: TLFLabel;
     LBLRestoPlazos: TLFLabel;
     DBCHKProntoPago: TLFDBCheckBox;
     DBSEPlazos: TDBSpinEdit;
     DBSEPrimerPlazo: TDBSpinEdit;
     DBSERestoPlazos: TDBSpinEdit;
     DBEFTipoEfecto: TLFDBEditFind2000;
     DBETitTipoEfecto: TLFDbedit;
     DBCBAceptar: TLFDBCheckBox;
     DBCBPagoAutomatico: TLFDBCheckBox;
     LBLDatosAMostrar: TLFLabel;
     DBCBVDatosBancarios: TDBComboBoxValue;
     DBCBHeredaFin: TLFDBCheckBox;
     TSIdiomas: TTabSheet;
     TBIdiomas: TLFToolBar;
     NavIdiomas: THYMNavigator;
     PNIdiomas: TLFPanel;
     DBGFIdiomas: TDBGridFind2000;
     CEIdiomas: TControlEdit;
     CEIdiomasPMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     DBETITFP: TLFDbedit;
     DBCBOrdenPago: TLFDBCheckBox;
     DBCHKMesN: TLFDBCheckBox;
     DBCBPedirDetallesDePago: TLFDBCheckBox;
     LTituloLargo: TLFLabel;
     DBETituloLargo: TLFDbedit;
     DBCBSinRecibos: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSIdiomasShow(Sender: TObject);
     procedure DBGFIdiomasBusqueda(Sender: TObject);
     procedure DBCHKMesNClick(Sender: TObject);
     procedure DBETituloLargoEnter(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMFormasPago : TFMFormasPago;

implementation

uses UDMFormasPago, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMFormasPago.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMFormasPago, DMFormasPago);
  DBGMain.DataSource := DMFormasPago.DSQMFormaPago;
  NavMain.DataSource := DMFormasPago.DSQMFormaPago;
  G2kTableLoc.DataSource := DMFormasPago.DSQMFormaPago;

  PCMain.ActivePage := TSFicha;
  ControlEdit := CEMain;
end;

procedure TFMFormasPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFormasPago);
end;

procedure TFMFormasPago.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMFormasPago.BusquedaCompleja;
  Continua := False;
end;

procedure TFMFormasPago.TSIdiomasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEIdiomas;
  DBGFIdiomas.SetFocus;
end;

procedure TFMFormasPago.DBGFIdiomasBusqueda(Sender: TObject);
begin
  inherited;
  if Pos('SYS_IDIOMAS', Trim(DBGFIdiomas.TablaABuscar)) > 0 then
  begin
     DBGFIdiomas.CondicionBusqueda := 'DEFECTO <> 1';
  end;
end;

procedure TFMFormasPago.DBCHKMesNClick(Sender: TObject);
var
  num : integer;
begin
  if (DBCHKMesN.Checked) then
  begin
     LBLPrimerPlazo.Caption := _('Meses 1er Plazo');
     if (DMFormasPago.QMFormaPago.State in [dsInsert, dsEdit]) then
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
     if (DMFormasPago.QMFormaPago.State in [dsInsert, dsEdit]) then
     begin
        num := StrToInt(DBSEPrimerPlazo.Text) * 30;
        DBSEPrimerPlazo.Text := IntToStr(num);
        num := StrToInt(DBSERestoPlazos.Text) * 30;
        DBSERestoPlazos.Text := IntToStr(num);
     end;
  end;
end;

procedure TFMFormasPago.DBETituloLargoEnter(Sender: TObject);
begin
  inherited;
  if (Trim(DMFormasPago.QMFormaPagoTITULO_LARGO.AsString) = '') then
     DMFormasPago.QMFormaPagoTITULO_LARGO.AsString := DMFormasPago.QMFormaPagoTITULO.AsString;
end;

procedure TFMFormasPago.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
