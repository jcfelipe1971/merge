unit UFMDescargasGas;

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
  TFMDescargasGas = class(TFPEdit)
     LblGas: TLFLabel;
     DBERig: TLFDbedit;
     LblFecha: TLFLabel;
     DBEFechaInicio: TLFDBDateEdit;
     LblTurno: TLFLabel;
     DBETurno: TLFDBEditFind2000;
     PnlDetGas: TLFPanel;
     PCDetGas: TLFPageControl;
     TSTanque: TTabSheet;
     TBTanque: TLFToolBar;
     NavTanque: THYMNavigator;
     DBGFTanque: TDBGridFind2000;
     CETanque: TControlEdit;
     ALstDescGas: TAction;
     LFCategoryAction2: TLFCategoryAction;
     TButtInforme: TToolButton;
     TSDispensador: TTabSheet;
     DBGFDispensador: TDBGridFind2000;
     LFEmpleado: TLFToolBar;
     NavDispensador: THYMNavigator;
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
     DBDTInicio: TDBDateTimePicker;
     DBDTCierre: TDBDateTimePicker;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     DBETitSerie: TLFDbedit;
     LEstado: TLFLabel;
     LFDBEstado: TLFDbedit;
     AIniciarDescarga: TAction;
     ACerrarDescarga: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AAbrirDescarga: TAction;
     PnlTotales: TLFPanel;
     PCTotales: TLFPageControl;
     TSTotales: TTabSheet;
     PNLTotal: TLFPanel;
     LInicio: TLFLabel;
     LFinal: TLFLabel;
     LDiferencia: TLFLabel;
     LFDFinalTanques: TLFDbedit;
     ETituloTurno: TLFEdit;
     AConfDescGas: TAction;
     LFCategoryAction3: TLFCategoryAction;
     PNLSerie: TLFPanel;
     LSuNumero: TLFLabel;
     DBEDescargaF: TLFDBEdit;
     LGalones: TLFLabel;
     DBEPrecioF: TLFDBEdit;
     DBETotalUnidades: TLFDbedit;
     DBEDiferencia: TLFDbedit;
     LAlbaran: TLFLabel;
     LAsiento: TLFLabel;
     DBEAsiento: TLFDbedit;
     DBEAlbaran: TLFDbedit;
     LBLProveedor: TLFLabel;
     DBEFProveedor: TLFDBEditFind2000;
     ETituloProveedor: TLFEdit;
     ATraspasoAlb: TAction;
     LFLabel1: TLFLabel;
     DBECola: TLFDBEditFind2000;
     ETituloCola: TLFEdit;
     DBECapacidad: TLFDbedit;
     LFLabel2: TLFLabel;
     LFLabel3: TLFLabel;
     DBDateTimePicker1: TDBDateTimePicker;
     LFLabel4: TLFLabel;
     DBDateTimePicker2: TDBDateTimePicker;
     LFLabel5: TLFLabel;
     DBEDensidad: TLFDbedit;
     DBEHsalioTerm: TLFDBDateEdit;
     DBEHllegoSuc: TLFDBDateEdit;
     LDuracionCola: TLFLabel;
     DBEDuracionCola: TLFDbedit;
     LFLabel7: TLFLabel;
     DBEPreInicialCola: TLFDbedit;
     LFLabel8: TLFLabel;
     DBEPreFinalCola: TLFDbedit;
     LFLabel9: TLFLabel;
     LFLabel10: TLFLabel;
     DBETemInicialCola: TLFDbedit;
     DBETemFinalCola: TLFDbedit;
     LFLabel11: TLFLabel;
     DBERotoGauge: TLFDbedit;
     LFLabel12: TLFLabel;
     DBERecTempAmb: TLFDbedit;
     LFLabel13: TLFLabel;
     DBEMetDescarga: TLFDbedit;
     LFLabel14: TLFLabel;
     DBEChoferCola: TLFDbedit;
     LFLabel15: TLFLabel;
     DBENumCabezote: TLFDbedit;
     DBERecibidoPor: TLFDbedit;
     LFLabel16: TLFLabel;
     LVentaMetrosDrteDesc: TLFLabel;
     DBETotalMtrDispen: TLFDbedit;
     LTotalGalMasVtaMetros: TLFLabel;
     DBETotalGalMasVtaMetros: TLFDbedit;
     LOverTotogateGlsRec: TLFLabel;
     DBELOverRotogateGlsRec: TLFDbedit;
     SBAAlabaran: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSTanqueShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSDispensadorShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSFPagoShow(Sender: TObject);
     procedure ALstDescGasExecute(Sender: TObject);
     procedure TButtInformeClick(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure TSDetalleShow(Sender: TObject);
     procedure DBGFTanqueBusqueda(Sender: TObject);
     procedure AIniciarDescargaExecute(Sender: TObject);
     procedure ACerrarDescargaExecute(Sender: TObject);
     procedure AAbrirDescargaExecute(Sender: TObject);
     procedure DBGFDispensadorBusqueda(Sender: TObject);
     procedure DBGFTanqueDblClick(Sender: TObject);
     procedure DBGFTanqueCellClick(Column: TColumn);
     procedure AConfDescGasExecute(Sender: TObject);
     procedure ATraspasoAlbExecute(Sender: TObject);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBETurnoChange(Sender: TObject);
     procedure DBEColaChange(Sender: TObject);
     procedure DBEAlbaranDblClick(Sender: TObject);
     procedure SBAAlabaranDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMDescargasGas : TFMDescargasGas;

implementation

uses UDMMain, UEntorno, UFmain, UUtiles, UDMDescargasGas, UFMGasCerrar, UFMListConfig,
  UDMLstDescargasGas, UDameDato;

{$R *.dfm}

procedure TFMDescargasGas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDescargasGas, DMDescargasGas);
  // Navegadores
  NavMain.DataSource := DMDescargasGas.DSQMDescargasGas;
  NavTanque.DataSource := DMDescargasGas.DSQMTanque;
  NavDispensador.DataSource := DMDescargasGas.DSQMDispensador;
  DBGMain.DataSource := DMDescargasGas.DSQMDescargasGas;
  DBGFTanque.DataSource := DMDescargasGas.DSQMTanque;
  DBGFDispensador.DataSource := DMDescargasGas.DSQMDispensador;
  // Page Control
  PCDetGas.ActivePage := TSTanque;

  G2KTableLoc.DataSource := DMDescargasGas.DSQMDescargasGas;

  EFSerie.Text := REntorno.Serie;

  {Todo: Esto se debe hacer con FindColumn}
  ColActual := DBGFTanque.Columns[0];
  DBGFTanque.Columns[11].Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAAlabaran, DBEAlbaran);
end;

procedure TFMDescargasGas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDescargasGas);
end;

procedure TFMDescargasGas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMDescargasGas.BusquedaCompleja;
end;

procedure TFMDescargasGas.TSTanqueShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CETanque;
end;

procedure TFMDescargasGas.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMDescargasGas.TSDispensadorShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDispensador;
end;

procedure TFMDescargasGas.TSTablaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMDescargasGas.TSFPagoShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFPago;
end;

procedure TFMDescargasGas.ALstDescGasExecute(Sender: TObject);
begin
  AbreData(TDMLstDescargasGas, DMLstDescargasGas);
  DMLstdESCARGASGas.MostrarListado(DMDescargasGas.QMDescargasGasID_DESCARGA.AsInteger,
     DMDescargasGas.QMDescargasGasRIG.AsInteger, EFSerie.Text, 0);
  CierraData(DMLstDescargasGas);
end;

procedure TFMDescargasGas.TButtInformeClick(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstDescargasGas, DMLstDescargasGas);
  DMLstDescargasgas.MostrarListado(DMDescargasGas.QMDescargasGasID_DESCARGA.AsInteger,
     DMDescargasGas.QMDescargasGasRIG.AsInteger, EFSerie.Text, 0);
  CierraData(DMLstDescargasGas);
end;

procedure TFMDescargasGas.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     DMDescargasGas.CambiaSerie(EFSerie.Text);
  end;
end;

procedure TFMDescargasGas.TSDetalleShow(Sender: TObject);
begin
  ControlEdit := CETanque;
end;

procedure TFMDescargasGas.DBGFTanqueBusqueda(Sender: TObject);
begin
  DBGFTanque.CondicionBusqueda := ' SERIE = ''' + EFSerie.Text + '''';
end;

procedure TFMDescargasGas.AIniciarDescargaExecute(Sender: TObject);
begin
  if (DMDescargasGas.QMDescargasGasESTADO.AsInteger > 1) then
     ShowMessage(_('La descarga ya ha sido Iniciada'))
  else
     DMDescargasGas.CrearNuevaDescarga;
end;

procedure TFMDescargasGas.ACerrarDescargaExecute(Sender: TObject);
begin
  if (DMDescargasGas.QMDescargasGasESTADO.AsInteger > 2) then
     ShowMessage(_('La descarga ya ha sido cerrada'))
  else
  begin
     AbreForm(TFMGasCerrar, FMGasCerrar, Sender);
     FMGasCerrar.Muestra(DMDescargasGas.QMDescargasGasRIG.AsInteger, DMDescargasGas.QMDescargasGasFECHA_CIERRE.AsDateTime, DMDescargasGas.QMDescargasGasFECHA_INICIO.AsDateTime, DBETurno.Text, DMDescargasGas.QMDescargasGasID_DESCARGA.AsInteger);
  end;
end;

procedure TFMDescargasGas.AAbrirDescargaExecute(Sender: TObject);
begin
  if (DMDescargasGas.QMDescargasGasESTADO.AsInteger < 3) then
     ShowMessage(_('La descarga no se puede abrir.'))
  else
     DMDescargasGas.AbrirDescarga;
end;

procedure TFMDescargasGas.DBGFDispensadorBusqueda(Sender: TObject);
begin
  DBGFDispensador.CondicionBusqueda := ' SERIE = ''' + EFSerie.Text + '''';
end;

procedure TFMDescargasGas.DBGFTanqueDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'RIG_MOV') then
     FMain.MuestraDocumento(DMDescargasGas.QMTanqueEJERCICIO.AsInteger, 'MVE', DMDescargasGas.QMTanqueSERIE.AsString, DMDescargasGas.QMTanqueRIG_MOV.AsInteger);
end;

procedure TFMDescargasGas.DBGFTanqueCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMDescargasGas.AConfDescGasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstDescargasGas, DMLstDescargasGas);
  TFMListConfig.Create(Self).Muestra(9907, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstDescargasGas.frDescargasGas);
  CierraData(DMLstDescargasGas);
end;

procedure TFMDescargasGas.ATraspasoAlbExecute(Sender: TObject);
begin
  inherited;
  DMDescargasGas.TraspasaAlbaran;
  ATraspasoAlb.Enabled := (DMDescargasGas.QMDescargasGasESTADO.AsInteger <> 3);
end;

procedure TFMDescargasGas.DBEFProveedorChange(Sender: TObject);
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(DBEFProveedor.Text, 0));
end;

procedure TFMDescargasGas.DBETurnoChange(Sender: TObject);
begin
  inherited;
  ETituloTurno.Text := DameTituloTurno(DBETurno.Text);
end;

procedure TFMDescargasGas.DBEColaChange(Sender: TObject);
begin
  inherited;
  ETituloCola.Text := DMDescargasGas.DameTituloCola(StrToIntDef(DBECola.Text, 0));
end;

procedure TFMDescargasGas.DBEAlbaranDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosEntrada(DMDescargasGas.QMDescargasGasID_DOC.AsInteger);
end;

procedure TFMDescargasGas.SBAAlabaranDblClick(Sender: TObject);
begin
  inherited;
  DBEAlbaranDblClick(Sender);
end;

end.
