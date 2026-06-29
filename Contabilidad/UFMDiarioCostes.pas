{ TODO 5 -oDuilio -cExportaciones : Crear exportación a Excel }

unit UFMDiarioCostes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UTeclas, UControlEdit, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UNavigator, ToolWin, ComCtrls, Buttons,
  ExtCtrls, StdCtrls, DBCtrls, Mask, NsDBGrid, DateUtils,
  rxToolEdit, UFPEdit, ULFDBEdit, ULFPanel, ULFEditFind2000, ULFLabel,
  UHYDescription, ULFHYDBDescription, UEditPanel, ULFToolBar, ULFEdit, ActnList,
  rxPlacemnt, ULFFormStorage, ULFDateEdit, UFormGest, ULFActionList,
  ULFPageControl, ULFComboBox;

type
  TFMDiarioCostes = class(TG2KForm)
     PEFiltro: TLFPanel;
     PEMain: TLFPanel;
     LCuenta: TLFLabel;
     LTotalImporte: TLFLabel;
     DBTTotalImporte: TDBText;
     LDigito1: TLFLabel;
     TBMain: TLFToolBar;
     TButtFiltra: TToolButton;
     ToolButton2: TToolButton;
     EPSalir: THYMEditPanel;
     EFCuenta: TLFEditFind2000;
     PanelTotales: TLFPanel;
     DescCuenta: TLFEdit;
     TBNuevo: TToolButton;
     FSMain: TLFFibFormStorage;
     EFDigito1: TLFEditFind2000;
     DescDigito1: TLFEdit;
     DBGFDetalle: TDBGridFind2000;
     LDigito2: TLFLabel;
     EFDigito2: TLFEditFind2000;
     DescDigito2: TLFEdit;
     LDigit3: TLFLabel;
     EFDigito3: TLFEditFind2000;
     DescDigito3: TLFEdit;
     EFDigito4: TLFEditFind2000;
     DescDigito4: TLFEdit;
     EFDigito5: TLFEditFind2000;
     DescDigito5: TLFEdit;
     LDigit4: TLFLabel;
     LDigito5: TLFLabel;
     TBActions: TLFToolBar;
     ALDiarioCostes: TLFActionList;
     ALMain: TLFActionList;
     AFiltrar: TAction;
     ANuevaBusqueda: TAction;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     AAsientosSinCCoste: TAction;
     TBAsientosSinCCoste: TToolButton;
     ToolButton3: TToolButton;
     PCMain: TLFPageControl;
     TSDiario: TTabSheet;
     TSResumen: TTabSheet;
     PNLFiltroResumen: TLFPanel;
     LHastaFechaResumen: TLFLabel;
     LDesdeFechaResumen: TLFLabel;
     DEDesdeFechaResumen: TLFDateEdit;
     DEHastaFechaResumen: TLFDateEdit;
     DBGridFind20001: TDBGridFind2000;
     BCalcular: TButton;
     LNivel: TLFLabel;
     CBFiltraNivel: TLFComboBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFDigito1Change(Sender: TObject);
     procedure EFCuentaChange(Sender: TObject);
     procedure EFDigito2Change(Sender: TObject);
     procedure EFDigito3Change(Sender: TObject);
     procedure EFDigito4Change(Sender: TObject);
     procedure EFDigito5Change(Sender: TObject);
     procedure AFiltrarExecute(Sender: TObject);
     procedure ANuevaBusquedaExecute(Sender: TObject);
     procedure EFCuentaExit(Sender: TObject);
     procedure AAsientosSinCCosteExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure BCalcularClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMDiarioCostes : TFMDiarioCostes;

implementation

uses UDMMain, UFMain, UEntorno, UDMDiarioCostes, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMDiarioCostes.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMDiarioCostes, DMDiarioCostes);
  DBGFDetalle.DataSource := DMDiarioCostes.DSQMDiarioCostes;
  PCMain.ActivePage := TSDiario;

  EFCuenta.MaxLength := REntorno.DigitosSub;
  CBFiltraNivel.Items := TSLNiveles;
  CBFiltraNivel.ItemIndex := 0;

  {Hay usuarios que no pueden ver las cuentas restringidas}
  if (REntorno.ContabilidadRestringida) then
     EFCuenta.CondicionBusqueda := 'TIPO=5 AND RESTRICCION=0';

  FMain.AddComponentePunto(EFCuenta);
  ANuevaBusqueda.Execute;
end;

procedure TFMDiarioCostes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.DelComponentePunto(EFCuenta);
  Action := caFree;
  CierraData(DMDiarioCostes);
end;

procedure TFMDiarioCostes.EFCuentaChange(Sender: TObject);
begin
  DescCuenta.Text := DameTituloCuenta(EFCuenta.Text);
end;

procedure TFMDiarioCostes.EFDigito1Change(Sender: TObject);
begin
  DescDigito1.Text := DameTituloCentroCoste(1, EFDigito1.Text);
end;

procedure TFMDiarioCostes.EFDigito2Change(Sender: TObject);
begin
  DescDigito2.Text := DameTituloCentroCoste(1, EFDigito1.Text);
end;

procedure TFMDiarioCostes.EFDigito3Change(Sender: TObject);
begin
  DescDigito3.Text := DameTituloCentroCoste(1, EFDigito1.Text);
end;

procedure TFMDiarioCostes.EFDigito4Change(Sender: TObject);
begin
  DescDigito4.Text := DameTituloCentroCoste(1, EFDigito1.Text);
end;

procedure TFMDiarioCostes.EFDigito5Change(Sender: TObject);
begin
  DescDigito5.Text := DameTituloCentroCoste(1, EFDigito1.Text);
end;

procedure TFMDiarioCostes.AFiltrarExecute(Sender: TObject);
begin
  DMDiarioCostes.Filtra(EFCuenta.Text, EFDigito1.Text, EFDigito2.Text, EFDigito3.Text, EFDigito4.Text, EFDigito5.Text, DEDesdeFecha.Date, DEHastaFecha.Date);
end;

procedure TFMDiarioCostes.ANuevaBusquedaExecute(Sender: TObject);
begin
  EFCuenta.Clear;
  EFDigito1.Clear;
  EFDigito2.Clear;
  EFDigito3.Clear;
  EFDigito4.Clear;
  EFDigito5.Clear;
  DEDesdeFecha.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  DEHastaFecha.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  DEDesdeFechaResumen.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  DEHastaFechaResumen.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  AFiltrar.Execute;
end;

procedure TFMDiarioCostes.EFCuentaExit(Sender: TObject);
begin
  EFCuenta.Text := ExpandirCadena(EFCuenta.Text, REntorno.DigitosSub);
end;

procedure TFMDiarioCostes.AAsientosSinCCosteExecute(Sender: TObject);
begin
  if (AAsientosSinCCoste.Tag = 0) then
  begin
     PEFiltro.Enabled := False;
     DMDiarioCostes.AbreAsientosSinCCoste;
     DBGFDetalle.DataSource := DMDiarioCostes.DSQMAsientosSinCCoste;
     with AAsientosSinCCoste do
     begin
        Tag := 1;
        Caption := _('Muetra Diario de Costes');
        Hint := _('Muestra el diario de centros de costes');
        ImageIndex := 31;
     end;
  end
  else
  begin
     PEFiltro.Enabled := True;
     AFiltrar.Execute;
     DBGFDetalle.DataSource := DMDiarioCostes.DSQMDiarioCostes;
     with AAsientosSinCCoste do
     begin
        Tag := 0;
        Caption := _('Asientos Sin C. Coste');
        Hint := _('Muestra los asientos sin Centro de Coste Asignado');
        ImageIndex := 35;
     end;
  end;
end;

procedure TFMDiarioCostes.DBGFDetalleDblClick(Sender: TObject);
begin
  if (AAsientosSinCCoste.Tag = 0) then
     FMain.MuestraMovConta(' RIC= ' + IntToStr(DMDiarioCostes.QMDiarioCostesRIC.AsInteger) + ' and ejercicio=' +
        IntToStr(DMDiarioCostes.QMDiarioCostesEJERCICIO.AsInteger), IntToStr(DMDiarioCostes.QMDiarioCostesCANAL.AsInteger))
  else
     FMain.MuestraMovConta(' RIC= ' + IntToStr(DMDiarioCostes.QMAsientosSinCCosteRIC.AsInteger) + ' and ejercicio=' +
        IntToStr(DMDiarioCostes.QMAsientosSinCCosteEJERCICIO.AsInteger), IntToStr(DMDiarioCostes.QMAsientosSinCCosteCANAL.AsInteger));
end;

procedure TFMDiarioCostes.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if ((UpperCase(Column.FieldName) = 'ASIENTO') or (UpperCase(Column.FieldName) = 'RIC')) then
     CeldaEnlace(DBGFDetalle, Rect);
end;

procedure TFMDiarioCostes.BCalcularClick(Sender: TObject);
begin
  DMDiarioCostes.CalcularResumen(DEDesdeFechaResumen.Date, DEHastaFechaResumen.Date, CBFiltraNivel.ItemIndex);
end;

end.
