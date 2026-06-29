unit UFMVentasGas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, DBCtrls, ComCtrls, UDBDateTimePicker, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UFormGest,
  ExtDlgs, DB, Buttons, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEditFind2000, ULFDBEdit, ULFDBCheckBox, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, UFPregTiempo, ULFLabel,
  ULFEdit, ImgList, Math, DbComboBoxValue, ULFEditFind2000;

type
  TFMVentasGas = class(TFPEdit)
     LblGas: TLFLabel;
     DBERig: TLFDbedit;
     LblFecha: TLFLabel;
     DBEFechaInicio: TLFDBDateEdit;
     LblTurno: TLFLabel;
     DBETurno: TLFDBEditFind2000;
     PNLDet: TLFPanel;
     PNLDetGas: TLFPanel;
     PCDetGas: TLFPageControl;
     TSTanque: TTabSheet;
     PCDetEmpleados: TLFPageControl;
     TSDispensador: TTabSheet;
     TSFPago: TTabSheet;
     TBTanque: TLFToolBar;
     DBGFDispensador: TDBGridFind2000;
     DBGFFPago: TDBGridFind2000;
     NavTanque: THYMNavigator;
     DBGFTanque: TDBGridFind2000;
     CETanque: TControlEdit;
     DBCBEstado: TLFDBCheckBox;
     ALstVentasGas: TAction;
     LFCategoryAction2: TLFCategoryAction;
     TButtInforme: TToolButton;
     TSEmpleado: TTabSheet;
     DBGFEmpleado: TDBGridFind2000;
     TBEmpleado: TLFToolBar;
     NavEmpleado: THYMNavigator;
     TSMonedas: TTabSheet;
     DBGFMonedas: TDBGridFind2000;
     TBMonedas: TLFToolBar;
     NavMonedas: THYMNavigator;
     LFechaCierre: TLFLabel;
     DBEFechaCierre: TLFDBDateEdit;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     CEEmpleadoPMEdit: TPopUpTeclas;
     CEEmpleado: TControlEdit;
     CEDispensadorPMEdit: TPopUpTeclas;
     CEDispensador: TControlEdit;
     CEFPagoPMEdit: TPopUpTeclas;
     CEFPago: TControlEdit;
     CEMonedasPMEdit: TPopUpTeclas;
     CEMonedas: TControlEdit;
     CEMainMifirst1: TMenuItem;
     CEMainMiprior1: TMenuItem;
     CEMainMinext1: TMenuItem;
     CEMainMilast1: TMenuItem;
     CEMainMiinsert1: TMenuItem;
     CEMainMidelete1: TMenuItem;
     CEMainMiedit1: TMenuItem;
     CEMainMipost1: TMenuItem;
     CEMainMicancel1: TMenuItem;
     CEMainMirefresh1: TMenuItem;
     CEMainMiSep1: TMenuItem;
     CEMainMibuscar1: TMenuItem;
     CEMainMiaprox1: TMenuItem;
     CEMainMiexacta1: TMenuItem;
     CEMainMiimprime1: TMenuItem;
     CEMainMirango1: TMenuItem;
     CEMainMireport1: TMenuItem;
     CEMainMicopy1: TMenuItem;
     CEMainMicut1: TMenuItem;
     CEMainMipaste1: TMenuItem;
     CEMainMisalir1: TMenuItem;
     TBDispensador: TLFToolBar;
     NavDispensador: THYMNavigator;
     TBFPago: TLFToolBar;
     NavFPago: THYMNavigator;
     DBDTInicio: TDBDateTimePicker;
     DBDTCierre: TDBDateTimePicker;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     DBETitSerie: TLFDbedit;
     LEstado: TLFLabel;
     LFDBEstado: TLFDbedit;
     ACerrarVenta: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AAbrirVenta: TAction;
     PNLTotales: TLFPanel;
     PCTotales: TLFPageControl;
     TSTotales: TTabSheet;
     PNLTot: TLFPanel;
     LDiferenciaCobroDispensador: TLFLabel;
     LTotalTanque: TLFLabel;
     LInicio: TLFLabel;
     LFinal: TLFLabel;
     LTotalDispensador: TLFLabel;
     LDiferencia: TLFLabel;
     LTotalCobrado: TLFLabel;
     LImporte: TLFLabel;
     LFDDifCob: TLFDbedit;
     LFDInicioTanques: TLFDbedit;
     LFDFinalTanques: TLFDbedit;
     LFDInicioDisp: TLFDbedit;
     LFDFinalDisp: TLFDbedit;
     LFDDifTanques: TLFDbedit;
     LFDDifDisp: TLFDbedit;
     LFDCobrado: TLFDbedit;
     LFDImporteDisp: TLFDbedit;
     LFLImpTanqDisp: TLFLabel;
     LFDDifImpTanqDisp: TLFDbedit;
     LFLTanqDisp: TLFLabel;
     LFDifTanqDisp: TLFDbedit;
     AConfVentasGas: TAction;
     LFCategoryAction3: TLFCategoryAction;
     PNLSerie: TLFPanel;
     ETituloTurno: TLFEdit;
     PNLDetalles: TLFPanel;
     LFDSobrante: TLFDbedit;
     LFDFaltante: TLFDbedit;
     LDescarga: TLFLabel;
     LFDdescargtanque: TLFDbedit;
     LFDdescargdisp: TLFDbedit;
     DBCHKContab: TLFDBCheckBox;
     DBEAsiento: TLFDbedit;
     DBEIDVenta: TLFDbedit;
     LVenta: TLFLabel;
     SBAsiento: TSpeedButton;
     AVerAsiento: TAction;
     DBECosto: TLFDbedit;
     LCosto: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSTanqueShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSDispensadorShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSFPagoShow(Sender: TObject);
     procedure ALstVentasGasExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure PCDetGasChange(Sender: TObject);
     procedure TSDetalleShow(Sender: TObject);
     procedure TSMonedasShow(Sender: TObject);
     procedure TSEmpleadoShow(Sender: TObject);
     procedure DBGFTanqueBusqueda(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure AIniciarVentaExecute(Sender: TObject);
     procedure ACerrarVentaExecute(Sender: TObject);
     procedure AAbrirVentaExecute(Sender: TObject);
     procedure DBGFDispensadorBusqueda(Sender: TObject);
     procedure DBGFTanqueDblClick(Sender: TObject);
     procedure DBGFTanqueCellClick(Column: TColumn);
     procedure AConfVentasGasExecute(Sender: TObject);
     procedure DBETurnoChange(Sender: TObject);
     procedure LFDBEstadoChange(Sender: TObject);
     procedure AVerAsientoExecute(Sender: TObject);
  private
     { Private declarations }
     // Editando: boolean;
     ColActual: TColumn;
     procedure CambiaActivePage;
  public
     { Public declarations }
  end;

var
  FMVentasGas : TFMVentasGas;

implementation

uses UDMMain, UEntorno, UFmain, UUtiles, UDMVentasGas, UFMGasCerrar,
  UDMLstVentasGas, UFMListConfig;

{$R *.dfm}

procedure TFMVentasGas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMVentasGas, DMVentasGas);

  // Navegadores
  NavMain.DataSource := DMVentasGas.DSQMVentasGas;
  NavEmpleado.DataSource := DMVentasGas.DSQMEmpleado;
  NavTanque.DataSource := DMVentasGas.DSQMTanque;
  NavDispensador.DataSource := DMVentasGas.DSQMDispensador;
  NavFPago.DataSource := DMVentasGas.DSQMFPago;
  NavMonedas.DataSource := DMVentasGas.DSQMMonedas;
  DBGMain.DataSource := DMVentasGas.DSQMVentasGas;
  DBGFEmpleado.DataSource := DMVentasGas.DSQMEmpleado;
  DBGFTanque.DataSource := DMVentasGas.DSQMTanque;
  DBGFDispensador.DataSource := DMVentasGas.DSQMDispensador;
  DBGFFPago.DataSource := DMVentasGas.DSQMFPago;
  DBGFMonedas.DataSource := DMVentasGas.DSQMMonedas;
  // Page Control
  PCDetGas.ActivePage := TSTanque;
  PCDetEmpleados.ActivePage := TSDispensador;

  G2KTableLoc.DataSource := DMVentasGas.DSQMVentasGas;

  EFSerie.Text := REntorno.Serie;

  CambiaActivePage;

  ColActual := DBGFTanque.Columns[0];
  DBGFTanque.Columns[EncuentraField(DBGFTanque, 'RIG_MOV')].Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAsiento, DBEAsiento);
end;


procedure TFMVentasGas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMVentasGas);
end;

procedure TFMVentasGas.CambiaActivePage;
begin
  if (PCDetGas.ActivePage = TSEmpleado) then
  begin
     PCDetEmpleados.ActivePage := TSDispensador;
     PCDetEmpleados.Enabled := True;
     PCDetEmpleados.Visible := True;
     NavDispensador.Enabled := True;
     NavFPago.Enabled := True;
     NavMonedas.Enabled := True;
  end
  else
  begin
     NavDispensador.Enabled := False;
     NavFPago.Enabled := False;
     NavMonedas.Enabled := False;
     PCDetEmpleados.Enabled := False;
     PCDetEmpleados.Visible := False;
  end;
end;

procedure TFMVentasGas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMVentasGas.BusquedaCompleja;
end;

procedure TFMVentasGas.TSTanqueShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CETanque;
end;

procedure TFMVentasGas.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMVentasGas.TSDispensadorShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDispensador;
end;

procedure TFMVentasGas.TSTablaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMVentasGas.TSFPagoShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFPago;
end;

procedure TFMVentasGas.ALstVentasGasExecute(Sender: TObject);
begin
  AbreData(TDMLstVentasGas, DMLstVentasGas);
  DMLstVentasGas.MostrarListado(DMVentasGas.QMVentasGasID_VENTA.AsInteger,
     DMVentasGas.QMVentasGasRIG.AsInteger, EFSerie.Text, 0);
  CierraData(DMLstVentasGas);
end;

procedure TFMVentasGas.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMVentasGas.CambiaSerie(EFSerie.Text);
  end;
end;

procedure TFMVentasGas.PCDetGasChange(Sender: TObject);
begin
  CambiaActivePage;
end;

procedure TFMVentasGas.TSDetalleShow(Sender: TObject);
begin
  ControlEdit := CETanque;
end;

procedure TFMVentasGas.TSMonedasShow(Sender: TObject);
begin
  ControlEdit := CEFPago;
end;

procedure TFMVentasGas.TSEmpleadoShow(Sender: TObject);
begin
  ControlEdit := CEEmpleado;
end;

procedure TFMVentasGas.DBGFTanqueBusqueda(Sender: TObject);
begin
  DBGFTanque.CondicionBusqueda := ' SERIE = ''' + EFSerie.Text + '''';
end;

procedure TFMVentasGas.PCMainChange(Sender: TObject);
begin
  CambiaActivePage;
end;

procedure TFMVentasGas.AIniciarVentaExecute(Sender: TObject);
begin
  if (DMVentasGas.QMVentasGasESTADO.AsInteger > 1) then
     ShowMessage(_('La Venta ya ha sido Iniciada'))
  else
     DMVentasGas.CrearNuevaVenta;
end;

procedure TFMVentasGas.ACerrarVentaExecute(Sender: TObject);
begin
  if (DMVentasGas.QMVentasGasESTADO.AsInteger > 2) then
     ShowMessage(_('La Venta ya ha sido cerrada'))
  else
  begin
     AbreForm(TFMGasCerrar, FMGasCerrar, Sender);
     FMGasCerrar.Muestra(DMVentasGas.QMVentasGasRIG.AsInteger, DMVentasGas.QMVentasGasFECHA_CIERRE.AsDateTime,
        DMVentasGas.QMVentasGasFECHA_INICIO.AsDateTime, DBETurno.Text, DMVentasGas.QMVentasGasID_VENTA.AsInteger);
  end;
end;

procedure TFMVentasGas.AAbrirVentaExecute(Sender: TObject);
begin
  if (DMVentasGas.QMVentasGasESTADO.AsInteger < 3) then
     ShowMessage(_('La Venta no se puede abrir.'))
  else
     DMVentasGas.AbrirVenta;
end;

procedure TFMVentasGas.DBGFDispensadorBusqueda(Sender: TObject);
begin
  DBGFDispensador.CondicionBusqueda := ' SERIE = ''' + EFSerie.Text + '''';
end;

procedure TFMVentasGas.DBGFTanqueDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'RIG_MOV') then
     FMain.MuestraDocumento(DMVentasGas.QMTanqueEJERCICIO.AsInteger, 'MVE', DMVentasGas.QMTanqueSERIE.AsString, DMVentasGas.QMTanqueRIG_MOV.AsInteger);
end;

procedure TFMVentasGas.DBGFTanqueCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMVentasGas.AConfVentasGasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstVentasGas, DMLstVentasGas);
  TFMListConfig.Create(Self).Muestra(9906, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstVentasGas.frVentasGas);
  CierraData(DMLstVentasGas);
end;

procedure TFMVentasGas.DBETurnoChange(Sender: TObject);
begin
  inherited;
  ETituloTurno.Text := DMVentasGas.DameTituloTurno(DBETurno.Text);
end;

procedure TFMVentasGas.LFDBEstadoChange(Sender: TObject);
begin
  inherited;
  if (DMVentasGas.QMVentasGasESTADO.AsInteger = 1) then
     LFDBEstado.Color := clGreen;

  if (DMVentasGas.QMVentasGasESTADO.AsInteger = 2) then
     LFDBEstado.Color := RGB(255, 165, 0);

  if (DMVentasGas.QMVentasGasESTADO.AsInteger = 3) then
     LFDBEstado.Color := clRed;
end;

procedure TFMVentasGas.AVerAsientoExecute(Sender: TObject);
begin
  inherited;
  if (DMVentasGas.QMVentasGasRIC.AsInteger > 0) then
     FMain.MuestraMovConta(' RIC= ' + DMVentasGas.QMVentasGasRIC.AsString +
        ' and ejercicio=' + DMVentasGas.QMVentasGasEJERCICIO.AsString);
end;

end.
