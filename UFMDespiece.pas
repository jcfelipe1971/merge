unit UFMDespiece;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UFormGest, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls,
  ULFLabel, UNavigator, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  ULFDBEdit, Mask, DBCtrls, ULFDBEditFind2000, UHYDescription,
  ULFHYDBDescription, ULFPageControl, UHYDBGrid, Buttons, FIBQuery, HYFIBQuery,
  DBActns, ULFDBMemo, ULFEdit, UFPEdit, UG2kTBLoc, DB, rxToolEdit,
  RXDBCtrl, ULFDBDateEdit, FIBTableDataSet;

type
  TFMDespiece = class(TFPEdit)
     PNLComponente: TLFPanel;
     PNLTareas: TLFPanel;
     DBFComponente: TDBGridFind2000;
     DBGTareas: TDBGridFind2000;
     TBComponente: TLFToolBar;
     TBTarea: TLFToolBar;
     TBCrear: TToolButton;
     NavComponente: THYMNavigator;
     NavTarea: THYMNavigator;
     LFCategoryAction1: TLFCategoryAction;
     ACrearDespiece: TAction;
     LLinea: TLFLabel;
     LSalida: TLFLabel;
     DBELinea: TLFDbedit;
     DBESalida: TLFDbedit;
     DBEFEscandallo: TLFDBEditFind2000;
     SBAModelo: TSpeedButton;
     ALOrden: TLFActionList;
     AModelo: TAction;
     PNLTotales: TLFPanel;
     LTotalCoste: TLFLabel;
     DBETotal: TLFDbedit;
     LBeneficio: TLFLabel;
     DBEMargen: TLFDbedit;
     LVenta: TLFLabel;
     DBEVenta: TLFDbedit;
     TBCalc: TToolButton;
     ACalcFormula: TAction;
     SBAEscandallo: TSpeedButton;
     AAEscandallo: TAction;
     TBEstado: TToolButton;
     DBETituloEstado: TLFDbedit;
     AAbrirCerrar: TAction;
     ToolButton2: TToolButton;
     TBCrearOP: TToolButton;
     ACrearOP: TAction;
     LOP: TLFLabel;
     DBID_Orden: TLFDbedit;
     SBAID_Orden: TSpeedButton;
     AOrdenP: TAction;
     SBAOrigen: TSpeedButton;
     AOrigen: TAction;
     DBRBTipoMedida: TDBRadioGroup;
     LFCantidad: TLFLabel;
     DBECantidad: TLFDbedit;
     LCajon: TLFLabel;
     DBECajon: TLFDBEditFind2000;
     LGuia: TLFLabel;
     DBEGuia: TLFDBEditFind2000;
     EDescEscandallo: TLFEdit;
     DescCajon: TLFHYDBDescription;
     DescGuia: TLFHYDBDescription;
     ALstDespiece: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfigurarListado: TAction;
     TSNotas: TTabSheet;
     PCComponente: TLFPageControl;
     TSFichaComponentes: TTabSheet;
     TSNotasComponente: TTabSheet;
     PCTareas: TLFPageControl;
     TSFichaTareas: TTabSheet;
     TSNotasTareas: TTabSheet;
     TBNotasComponente: TLFToolBar;
     NavNotasComponente: THYMNavigator;
     ToolButton3: TToolButton;
     PNLComponenteNotas: TLFPanel;
     LComponenteNotas: TLFLabel;
     DBEComponentesNotasComponete: TLFDbedit;
     DBEComponentesNotasDescripcion: TLFDbedit;
     DBMNotasComponente: TLFDBMemo;
     TBNotasTarea: TLFToolBar;
     PNLNotasTarea: TLFPanel;
     LTipoTarea: TLFLabel;
     DBENotasTarea: TLFDbedit;
     DBENotasTareaDescripcion: TLFDbedit;
     ToolButton4: TToolButton;
     NavNotasTarea: THYMNavigator;
     DBMNotasTarea: TLFDBMemo;
     TBNotasModelo: TLFToolBar;
     PNLNotasModelo: TLFPanel;
     LNotasModelo: TLFLabel;
     ENotasModelo: TLFEdit;
     ENotasModeloDescripcion: TLFEdit;
     ToolButton5: TToolButton;
     NavNotasModelo: THYMNavigator;
     DBMNotasModelo: TLFDBMemo;
     LMargenTareas: TLFLabel;
     DBEMargenTarea: TLFDbedit;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LArticulo: TLFLabel;
     DBEFArticulo: TLFDBEditFind2000;
     DBETituloArticulo: TLFDbedit;
     TSep1: TToolButton;
     LPVP: TLFLabel;
     LDescuento1: TLFLabel;
     LDescuento2: TLFLabel;
     LDescuento3: TLFLabel;
     SBArticulo: TSpeedButton;
     PCDatos: TLFPageControl;
     TSPropiedades: TTabSheet;
     TSEscandallo: TTabSheet;
     DBEPrecio: TLFDbedit;
     DBEDescuento1: TLFDbedit;
     DBEDescuento2: TLFDbedit;
     DBEDescuento3: TLFDbedit;
     DSDetalle: TDataSource;
     PNLValores: TLFPanel;
     DBGValores: TDBGridFind2000;
     TBValores: TLFToolBar;
     NavValores: THYMNavigator;
     AAdjuntoDespiece: TAction;
     LFCategoryAction3: TLFCategoryAction;
     DBEId: TLFDbedit;
     LDespiece: TLFLabel;
     LFecha: TLFLabel;
     DBDEFecha: TLFDBDateEdit;
     LSuReferencia: TLFLabel;
     DBESuReferencia: TLFDbedit;
     LEstado: TLFLabel;
     DBEMedida3: TLFDbedit;
     DBEMedida4: TLFDbedit;
     Lmedida3: TLFLabel;
     Lmedida4: TLFLabel;
     PNLToldos: TPanel;
     LModelo: TLFLabel;
     LColor: TLFLabel;
     LLonaLama: TLFLabel;
     LTipoLona: TLFLabel;
     DescLonaLama: TLFHYDBDescription;
     DBEFLonaLama: TLFDBEditFind2000;
     DBCBMotor: TLFDBCheckBox;
     DBEFModelo: TLFDBEditFind2000;
     DBEFColor: TLFDBEditFind2000;
     DescModelos: TLFHYDBDescription;
     DescColor: TLFHYDBDescription;
     DBEFMotor: TLFDBEditFind2000;
     DescMotor: TLFHYDBDescription;
     ETipoLona: TLFEdit;
     DBEFTipoLona: TLFDBEditFind2000;
     GBDocumentoOrigen: TGroupBox;
     LOrigen: TLFLabel;
     LImporte: TLFLabel;
     LIdOrigen: TLFLabel;
     LReferencia: TLFLabel;
     LDatoImporte: TLFDbedit;
     DBDocOrigen: TLFDbedit;
     EReferencia: TLFEdit;
     DBEIdOrigen: TLFDbedit;
     ECoste: TLFEdit;
     LEscandallo: TLFLabel;
     LCoste: TLabel;
     DBEMargenMaterial: TLFDbedit;
     LMargenMateriales: TLFLabel;
     LTotalMateriales: TLFLabel;
     DBETotalComponentes: TLFDbedit;
     LTotalTareas: TLFLabel;
     DBETotalTareas: TLFDbedit;
     LMateriales: TLFLabel;
     LTareas: TLFLabel;
     TBSep1: TToolButton;
     TBSep2: TToolButton;
     LCliente: TLabel;
     ECliente: TLFEdit;
     LCierreParentesis: TLFLabel;
     LPrecioVenta: TLFLabel;
     DBEPrecioVenta: TLFDbedit;
     ADuplicar: TAction;
     SPLEscandallo: TSplitter;
     AEliminaLineasVacias: TAction;
     PNLImagen: TLFPanel;
     Imagen: TImage;
     PNLImagenTop: TLFPanel;
     ETituloImagen: TLFEdit;
     DBEFImagen: TLFDBEditFind2000;
     BClipboard: TButton;
     BCargarImagen: TButton;
     SBAImagen: TSpeedButton;
     LTotalPeso: TLFLabel;
     DBETotalPeso: TLFDbedit;
     DBEHoras: TLFDbedit;
     LTotalHoras: TLFLabel;
     DBEPrecioUnitario: TLFDbedit;
     LPrecioUnitario: TLFLabel;
     DBEMargenCosteTotal: TLFDbedit;
     LMargenSobreTotal: TLFLabel;
     TSOtros: TTabSheet;
     PCabOtros: TLFPanel;
     PNLOtros: TLFPanel;
     LOtrosDespiece: TLFLabel;
     DBEOtrosDespiece: TLFDbedit;
     LOtrosArticulo: TLFLabel;
     DBEOtrosTituloArticulo: TLFDbedit;
     LTituloLonaLama: TLFLabel;
     LCantidadDespiece: TLFLabel;
     LLonaAtravezada: TLFLabel;
     DBETituloELonaLama: TLFDbedit;
     DBECantidadDespiece: TLFDbedit;
     DBELonaAtravezada: TLFDbedit;
     DBETituloModelo: TLFDbedit;
     LTituloModelo: TLFLabel;
     LIncCorteLona: TLFLabel;
     DBEIncCorteLona: TLFDbedit;
     DBEDescuento: TLFDbedit;
     LDescuento: TLFLabel;
     DBETarifaTYC: TLFDbedit;
     LTarifaTYC: TLFLabel;
     DBEPconTapa: TLFDbedit;
     LPconTapa: TLFLabel;
     DBEPorJuegosCodos: TLFDbedit;
     LPorJuegosCodos: TLFLabel;
     LLadoInclinacion: TLFLabel;
     LTipoMortizacion: TLFLabel;
     LTerceraGuia: TLFLabel;
     DBETerceraGuia: TLFDbedit;
     DBESegundoTiroCuerda: TLFDbedit;
     LSegundoTiroCuerda: TLFLabel;
     LTipoRulinas: TLFLabel;
     DBECortinaPartida: TLFDbedit;
     LCortinaPartida: TLFLabel;
     DBECliente: TLFDbedit;
     LClienteCab: TLFLabel;
     NavOtros: THYMNavigator;
     CEOtros: TControlEdit;
     CEOtrosPMEdit: TPopUpTeclas;
     CEOtrosMifirst: TMenuItem;
     CEOtrosMiprior: TMenuItem;
     CEOtrosMinext: TMenuItem;
     CEOtrosMilast: TMenuItem;
     CEOtrosMiinsert: TMenuItem;
     CEOtrosMidelete: TMenuItem;
     CEOtrosMiedit: TMenuItem;
     CEOtrosMipost: TMenuItem;
     CEOtrosMicancel: TMenuItem;
     CEOtrosMirefresh: TMenuItem;
     DBELOtrosArticulo: TLFDbedit;
     TBOtros: TLFToolBar;
     ToolButton1: TToolButton;
     PNLEditDespiece: TLFPanel;
     PNLEdit: TLFPanel;
     PNLMedidas: TLFPanel;
     PNLEditOtros: TLFPanel;
     DBEFLonaInclinacion: TLFDBEditFind2000;
     ELonaInclinacion: TLFEdit;
     DBEFTipoMotorizacion: TLFDBEditFind2000;
     ETipoMotorizacion: TLFEdit;
     DBEFTipoRulinas: TLFDBEditFind2000;
     ETipoRulinas: TLFEdit;
     DBEBambalinaAdicional: TLFDbedit;
     LBambalinaAdicional: TLFLabel;
     DBEVentana: TLFDbedit;
     LVentana: TLFLabel;
     LTipoGajoExtendido: TLFLabel;
     DBEFTipoGajoExtendido: TLFDBEditFind2000;
     ETipoGajoExtendido: TLFEdit;
     LTipoCristalVentana: TLFLabel;
     DBEFTipoCristalVentana: TLFDBEditFind2000;
     ETipoCristalVentana: TLFEdit;
     LTipoConfeccionLona: TLFLabel;
     DBEFTipoConfeccionLona: TLFDBEditFind2000;
     ETipoConfeccionLona: TLFEdit;
     LUbicacionEtiqueta: TLFLabel;
     DBEFUbicacionEtiqueta: TLFDBEditFind2000;
     EUbicacionEtiqueta: TLFEdit;
     LRegulacionCofre: TLFLabel;
     DBEFRegulacionCofre: TLFDBEditFind2000;
     ERegulacionCofre: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure ACrearDespieceExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFModeloChange(Sender: TObject);
     procedure DBEFColorChange(Sender: TObject);
     procedure DBEFLonaLamaChange(Sender: TObject);
     procedure DBEFLonaLamaBusqueda(Sender: TObject);
     procedure AModeloExecute(Sender: TObject);
     procedure SBAModeloDblClick(Sender: TObject);
     procedure DBFComponenteDblClick(Sender: TObject);
     procedure DBFComponenteCellClick(Column: TColumn);
     procedure DBFComponenteDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACalcFormulaExecute(Sender: TObject);
     procedure SBAEscandalloDblClick(Sender: TObject);
     procedure AAEscandalloExecute(Sender: TObject);
     procedure DBGTareasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGTareasDblClick(Sender: TObject);
     procedure DBGTareasCellClick(Column: TColumn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure ACrearOPExecute(Sender: TObject);
     procedure SBAID_OrdenDblClick(Sender: TObject);
     procedure AOrdenPExecute(Sender: TObject);
     procedure DBCBMotorChange(Sender: TObject);
     procedure AOrigenExecute(Sender: TObject);
     procedure SBAOrigenDblClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFMotorBusqueda(Sender: TObject);
     procedure DBECajonChange(Sender: TObject);
     procedure DBEGuiaChange(Sender: TObject);
     procedure DBEFMotorChange(Sender: TObject);
     procedure ALstDespieceExecute(Sender: TObject);
     procedure AConfigurarListadoExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBEIdOrigenChange(Sender: TObject);
     procedure SBArticuloDblClick(Sender: TObject);
     procedure DBGValoresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEFTipoLonaChange(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure DBEFEscandalloBusqueda(Sender: TObject);
     procedure DBFComponenteBusqueda(Sender: TObject);
     procedure DBGTareasBusqueda(Sender: TObject);
     procedure DBEFEscandalloChange(Sender: TObject);
     procedure AAdjuntoDespieceExecute(Sender: TObject);
     procedure DBETituloEstadoChange(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ADuplicarExecute(Sender: TObject);
     procedure AEliminaLineasVaciasExecute(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure BCargarImagenClick(Sender: TObject);
     procedure SBAImagenDblClick(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure PNLEditOtrosResize(Sender: TObject);
     procedure DBEFLonaInclinacionChange(Sender: TObject);
     procedure DBEFTipoMotorizacionChange(Sender: TObject);
     procedure DBEFTipoRulinasChange(Sender: TObject);
     procedure DBEFTipoGajoExtendidoChange(Sender: TObject);
     procedure DBEFTipoCristalVentanaChange(Sender: TObject);
     procedure DBEFTipoConfeccionLonaChange(Sender: TObject);
     procedure DBEFUbicacionEtiquetaChange(Sender: TObject);
     procedure DBEFRegulacionCofreChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     LocalMascaraN{, LocalMascaraL}: string;
  public
     { Public declarations }
     procedure SegunProcedencia(Tipo: string; IdDetalle, IdS: integer; DataSet: TFIBTableSet);
     procedure FiltraDespiece(aIdDespiece: integer; DataSet: TFIBTableSet);
  end;

var
  FMDespiece : TFMDespiece;

implementation

uses UDMMain, UFMain, UEntorno, UUtiles, UDameDato, UDMDespiece, UDMLstDespiece,
  UFMListConfig, DateUtils, UFMAdjunto, UParam, UDMOfertas, UDMPedidos,
  UFMostrarImagen, ShellApi, URecibeFicheros, UDMAdjunto, UImagenes;

{$R *.dfm}

procedure TFMDespiece.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TDMDespiece, DMDespiece);

  NavMain.DataSource := DMDespiece.DSDespieceCab;
  DBGMain.DataSource := DMDespiece.DSDespieceCab;
  G2kTableLoc.DataSource := DMDespiece.DSDespieceCab;

  DescModelos.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAModelo, DescModelos);
  EDescEscandallo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEscandallo, EDescEscandallo);
  DBID_Orden.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAID_Orden, DBID_Orden);
  DBDocOrigen.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAOrigen, DBDocOrigen);
  DBETituloArticulo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBArticulo, DBETituloArticulo);
  ETituloImagen.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAImagen, ETituloImagen);

  PCMain.ActivePage := TSFicha;
  PCComponente.ActivePage := TSFichaComponentes;
  PCTareas.ActivePage := TSFichaTareas;
  DBECajon.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
  DBEGuia.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
  DBEFMotor.Visible := DBCBMotor.Checked;
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  // LocalMascaraL := DMMain.MascaraMoneda(REntorno.Moneda, 0);

  if (LeeParametro('MODREST015') <> 'S') then
  begin
     NavMain.InsertaControl := DBEFArticulo;
     NavMain.EditaControl := DBEFArticulo;
  end;

  // Verificamos si se muestra panel de Toldos
  PNLToldos.Visible := (LeeParametro('DOCDESP001', '') = 'S');
end;

procedure TFMDespiece.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Refresco documento antes de salir
  if (Assigned(DSDetalle.DataSet) and (DSDetalle.DataSet.Active) and (DSDetalle.DataSet.FieldByName('TIPO').AsString = 'OFC')) then
     DMOfertas.RefrescaCabecera(1);

  if (Assigned(DSDetalle.DataSet) and (DSDetalle.DataSet.Active) and (DSDetalle.DataSet.FieldByName('TIPO').AsString = 'PEC')) then
     DMPedidos.RefrescaCabecera(1);

  inherited;

  CierraData(DMDespiece);
end;

procedure TFMDespiece.ACrearDespieceExecute(Sender: TObject);
begin
  inherited;
  // Verificamos el despiece tenga asignado un escandallo
  if (DMDespiece.QMDespieceCabESCANDALLO.AsInteger > 0) then
  begin
     if (Application.MessageBox(PChar(string(_('Esta a punto de reemplazar los parametros del componente por los del escandallo, ¿desea continuar?'))),
        PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes) then
        DMDespiece.CrearDespieceSP;
  end
  else
     ShowMessage(_('El despiece no tiene asignado un escandallo'));
end;

procedure TFMDespiece.DBEFModeloChange(Sender: TObject);
begin
  inherited;

  ENotasModelo.Text := DBEFModelo.Text;
  DescModelos.ActualizaDatos('MODELO', DBEFModelo.Text);
  ENotasModeloDescripcion.Text := DescModelos.Text;

  if (Trim(DBEFModelo.Text) <> '') then
  begin
     // Se determina si es persiana o lona
     if (DMDespiece.ComprobarTipoModelo(Trim(DBEFModelo.Text)) = 'TOL') then
     begin
        LLonaLama.Caption := _('Lona');
        LLinea.Caption := _('Línea');
        LSalida.Caption := _('Salida');
     end
     else if (DMDespiece.ComprobarTipoModelo(Trim(DBEFModelo.Text)) = 'PER') then
     begin
        LLonaLama.Caption := _('Lama');
        LLinea.Caption := _('Ancho');
        LSalida.Caption := _('Alto');
     end
     else if (DMDespiece.ComprobarTipoModelo(Trim(DBEFModelo.Text)) = 'COR') then
     begin
        PNLMedidas.Visible := False;

        LLonaLama.Caption := _('Tejido');
        LLinea.Caption := _('Ancho');
        LSalida.Caption := _('Alto');
        LCajon.Visible := False;
        DBECajon.Visible := False;
        DescCajon.Visible := False;
        LGuia.Visible := False;
        DBEGuia.Visible := False;
        DescGuia.Visible := False;
        DBRBTipoMedida.Visible := False;
        DBCBMotor.Top := LGuia.Top;
        DBEFMotor.Top := DBEGuia.Top;
        DescMotor.Top := DescGuia.Top;
     end;
  end;
end;

procedure TFMDespiece.DBEFColorChange(Sender: TObject);
begin
  inherited;
  DescColor.ActualizaDatos('COLOR', DBEFColor.Text);
end;

procedure TFMDespiece.DBEFLonaLamaChange(Sender: TObject);
begin
  inherited;
  DescLonaLama.ActualizaDatos('LONA_LAMA', DBEFLonaLama.Text);
  DBEFTipoLona.Enabled := (Trim(DBEFLonaLama.Text) = '');
end;

procedure TFMDespiece.DBEFLonaLamaBusqueda(Sender: TObject);
var
  TipoModelo : string;
begin
  inherited;
  // Se determina si es persiana o lona
  TipoModelo := DMDespiece.ComprobarTipoModelo(Trim(DBEFModelo.Text));

  // Lona
  if (TipoModelo = 'TOL') then
  begin
     DBEFLonaLama.Tabla_a_buscar := 'VER_ARTICULOS_CUENTAS';
     DBEFLonaLama.CampoNum := 'ARTICULO';
     DBEFLonaLama.CampoStr := 'TITULO';
     DBEFLonaLama.CondicionBusqueda := 'TIPO_ARTICULO_TYC=''L''';
     DBEFLonaLama.OrdenadoPor.Text := 'ARTICULO';
  end
  else
  if (TipoModelo = 'PER') then // Lama
  begin
     DBEFLonaLama.Tabla_a_buscar := 'Z_SYS_MODELOS_DET_LAMA';
     DBEFLonaLama.CampoNum := 'ARTICULO';
     DBEFLonaLama.CampoStr := 'TIPO_LAMA';
     DBEFLonaLama.CondicionBusqueda := 'CODIGO=''' + Trim(DBEFModelo.Text) + '''' + ' AND LINEA=' + DBELinea.Text + ' AND SALIDA=' + DBESalida.Text;
     DBEFLonaLama.OrdenadoPor.Text := 'ARTICULO';
  end
  else
  if (TipoModelo = 'COR') then // Cortina
  begin
     DBEFLonaLama.Tabla_a_buscar := 'VER_ARTICULOS_CUENTAS';
     DBEFLonaLama.CampoNum := 'ARTICULO';
     DBEFLonaLama.CampoStr := 'TITULO';
     DBEFLonaLama.CondicionBusqueda := 'TIPO_ARTICULO_TYC=''L''';
     DBEFLonaLama.OrdenadoPor.Text := 'ARTICULO';
  end;
end;

procedure TFMDespiece.AModeloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ZAModelosDet, DBEFModelo.Text);
end;

procedure TFMDespiece.SBAModeloDblClick(Sender: TObject);
begin
  inherited;
  AModelo.Execute;
end;

procedure TFMDespiece.DBFComponenteDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'COMPONENTE') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
        DMDespiece.QMDespieceComCOMPONENTE.AsString + '''' +
        ' and ejercicio=' + REntorno.EjercicioStr);
  end;

  if (UpperCase(ColActual.FieldName) = 'FORMULA') then
  begin
     FMain.EjecutaAccion(FMain.AProFormulas, 'id_formula = ' +
        IntToStr(DMDespiece.QMDespieceComFORMULA.AsInteger));
  end;
end;

procedure TFMDespiece.DBFComponenteCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMDespiece.DBFComponenteDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'COMPONENTE') then
     CeldaEnlace(DBFComponente, Rect);

  if (UpperCase(Column.FieldName) = 'FORMULA') then
     CeldaEnlace(DBFComponente, Rect);
end;

procedure TFMDespiece.ACalcFormulaExecute(Sender: TObject);
begin
  inherited;
  DMDespiece.CalculoFormulaDesp;
end;

procedure TFMDespiece.SBAEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AAEscandallo.Execute;
end;

procedure TFMDespiece.AAEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'Escandallo = ''' +
     DMDespiece.QMDespieceCabESCANDALLO.AsString + '''');
end;

procedure TFMDespiece.DBGTareasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'FORMULA') then
     CeldaEnlace(DBGTareas, Rect);
end;

procedure TFMDespiece.DBGTareasDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'FORMULA') then
  begin
     FMain.EjecutaAccion(FMain.AProFormulas, 'id_formula = ' +
        IntToStr(DMDespiece.QMDespieceTarFORMULA.AsInteger));
  end;
end;

procedure TFMDespiece.DBGTareasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMDespiece.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbInsert) then
     LLonaLama.Caption := _('Lona/Lama');
end;

procedure TFMDespiece.FiltraDespiece(aIdDespiece: integer; DataSet: TFIBTableSet);
begin
  DMDespiece.FiltraDespiece(aIdDespiece, DataSet);

  DSDetalle.DataSet := DMDespiece.xDetalle;
  DBEPrecio.DataField := 'PRECIO';
  DBEDescuento1.DataField := 'DESCUENTO';
  DBEDescuento2.DataField := 'DESCUENTO_2';
  DBEDescuento3.DataField := 'DESCUENTO_3';
end;

procedure TFMDespiece.SegunProcedencia(Tipo: string; IdDetalle, IdS: integer; DataSet: TFIBTableSet);
begin
  DMDespiece.InsertarProcedencia(Tipo, IdDetalle, IdS, DataSet);

  DSDetalle.DataSet := DMDespiece.xDetalle;
  DBEPrecio.DataField := 'PRECIO';
  DBEDescuento1.DataField := 'DESCUENTO';
  DBEDescuento2.DataField := 'DESCUENTO_2';
  DBEDescuento3.DataField := 'DESCUENTO_3';

  // Para refrescar datos de documento y precios
  DBEIdOrigenChange(nil);
end;

procedure TFMDespiece.AAbrirCerrarExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaGrave then
     try
        Screen.Cursor := crHourGlass;
        DMDespiece.CierraDespiece;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMDespiece.ACrearOPExecute(Sender: TObject);
begin
  inherited;
  if (DMDespiece.QMDespieceCabID_ORDEN.AsInteger = 0) then
  begin
     DMDespiece.CrearDespieceOP;
     ShowMessage(_('Se ha creado una nueva orden'));
     DMDespiece.RefrescaDatos;
  end;
end;

procedure TFMDespiece.SBAID_OrdenDblClick(Sender: TObject);
begin
  inherited;
  AOrdenP.Execute;
end;

procedure TFMDespiece.AOrdenPExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOrden, DMDespiece.QMDespieceCabID_ORDEN.AsString);
end;

procedure TFMDespiece.DBCBMotorChange(Sender: TObject);
begin
  inherited;
  if (FMDespiece.Active) then
  begin
     DBEFMotor.Visible := DBCBMotor.Checked;
     DescMotor.Visible := DBCBMotor.Checked;
     DescMotor.Visible := DBCBMotor.Checked;
  end;
end;

procedure TFMDespiece.AOrigenExecute(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMDespiece.QMDespieceCabID_ORIGEN.AsInteger);
end;

procedure TFMDespiece.SBAOrigenDblClick(Sender: TObject);
begin
  inherited;
  AOrigen.Execute;
end;

procedure TFMDespiece.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMDespiece.BusquedaCompleja;
end;

procedure TFMDespiece.DBEFMotorBusqueda(Sender: TObject);
begin
  inherited;
  DBEFMotor.CondicionBusqueda := 'linea=' + IntToStr(DMDespiece.QMDespieceCabMEDIDA_1.AsInteger) +
     ' and salida=' + IntToStr(DMDespiece.QMDespieceCabMEDIDA_2.AsInteger) + ' and codigo=' + '''' + DMDespiece.QMDespieceCabMODELO.AsString + '''';
end;

procedure TFMDespiece.DBECajonChange(Sender: TObject);
begin
  inherited;
  DescCajon.ActualizaDatos('CAJON', DBECajon.Text);
end;

procedure TFMDespiece.DBEGuiaChange(Sender: TObject);
begin
  inherited;
  DescGuia.ActualizaDatos('GUIA', DBEGuia.Text);
end;

procedure TFMDespiece.DBEFMotorChange(Sender: TObject);
begin
  inherited;
  DescMotor.ActualizaDatos('TIPO_MOTOR', DBEFMotor.Text);
end;

procedure TFMDespiece.ALstDespieceExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstDespiece, DMLstDespiece);
  DMLstDespiece.MostrarListado(0, DMdespiece.QMDespieceCabID_DESPIECE_CAB.AsInteger);
  CierraData(DMLstDespiece);
end;

procedure TFMDespiece.AConfigurarListadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstDespiece, DMLstDespiece);
  TFMListConfig.Create(Self).Muestra(9913, Formato, Cabecera, Copias, Pijama, '', DMLstDespiece.frDespiece);
  CierraData(DMLstDespiece);
end;

procedure TFMDespiece.FormShow(Sender: TObject);
begin
  inherited;
  // Si el Form fue llamado mediante SegunProcedencia(), se inseratrá un nuevo registro y quedará en edición para rellenar la Lona
  if ((DMDespiece.QMDespieceCab.State = dsEdit) and (Trim(DBEFLonaLama.Text) = '')) then
     DBEFLonaLama.SetFocus;
  if (PCComponente.Height > TSEscandallo.Height) then
     PCComponente.Height := TSEscandallo.Height div 2;
end;

procedure TFMDespiece.DBEIdOrigenChange(Sender: TObject);
var
  Tarifa : string;
  Cliente : integer;
begin
  inherited;
  // Obtengo datos del documento origen para calculos posteriores
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CLIENTE, TARIFA, SU_REFERENCIA FROM GES_CABECERAS_S WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := DMDespiece.QMDespieceCabID_ORIGEN.AsInteger;
        ExecQuery;
        Cliente := FieldByName['CLIENTE'].AsInteger;
        Tarifa := FieldByName['TARIFA'].AsString;
        EReferencia.Text := FieldByName['SU_REFERENCIA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Assigned(DSDetalle.DataSet) and (DSDetalle.DataSet.Active) and (DSDetalle.DataSet.FieldByName('BRUTO').AsFloat <> 0)) then
     ECoste.Text := FloatToStr(DMDespiece.QMDespieceCabTOTAL_COSTE.AsFloat * 100 / DSDetalle.DataSet.FieldByName('BRUTO').AsFloat)
  else
     ECoste.Text := '';

  ECliente.Text := DameTituloCliente(Cliente);
end;

procedure TFMDespiece.SBArticuloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + Trim(DBEFArticulo.Text) + '''');
end;

procedure TFMDespiece.DBGValoresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Edicion : boolean;
  Campo : string;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     if (Column.ReadOnly) then
        ColorInfo(Canvas)
     else
     begin
        Campo := DataSource.DataSet.FieldByName('CAMPO').AsString;
        Edicion := False;
        if (Column.FieldName = 'VALOR_STR') then
        begin
           if ((Campo = 'BAMBALINA') or
              (Campo = 'CARRIL') or
              (Campo = 'CONFECCION') or
              (Campo = 'CORTE') or
              (Campo = 'CURRIAS') or
              (Campo = 'LACADO') or
              (Campo = 'LARGO') or
              (Campo = 'LONA') or
              (Campo = 'MOD_BAMBALINA') or
              (Campo = 'MONTADO') or
              (Campo = 'MONTAJE') or
              (Campo = 'PORTERIA') or
              (Campo = 'RIBETE') or
              (Campo = 'ROTULADO') or
              (Campo = 'TAPAJUNTAS') or
              (Campo = 'TEJADILLO') or
              (Campo = 'MONTAJE') or
              (Campo = 'VARILLA') or
              (Campo = 'VELCRO')) then
              Edicion := True;

           if (Edicion) then
              ColorEdicion(Canvas)
           else
              ColorInactivo(Canvas);
        end
        else
        if (Column.FieldName = 'VALOR_FLOAT') then
        begin
           Campo := DataSource.DataSet.FieldByName('CAMPO').AsString;
           if ((Campo = 'ALTO') or
              (Campo = 'ALTURA') or
              (Campo = 'ANCHO') or
              (Campo = 'CANTIDAD') or
              (Campo = 'LINEAL') or
              (Campo = 'SALIDA')) then
              Edicion := True;

           if (Edicion) then
              ColorEdicion(Canvas)
           else
              ColorInactivo(Canvas);
        end
        else
        if (Column.FieldName = 'VALOR_INT') then
        begin
           Campo := DataSource.DataSet.FieldByName('CAMPO').AsString;
           if ((Campo = 'COLOCACION') or
              (Campo = 'MANUAL_O_MOTOR') or
              (Campo = 'PARTIDA_O_ENTERA') or
              (Campo = 'QUEDAR')) then
              Edicion := True;

           if (Edicion) then
              ColorEdicion(Canvas)
           else
              ColorInactivo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMDespiece.DBEFTipoLonaChange(Sender: TObject);
begin
  inherited;
  ETipoLona.Text := DameTituloTipoLona(DBEFTipoLona.Text);
end;

procedure TFMDespiece.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ALstDespiece.Execute;
end;

procedure TFMDespiece.DBEFArticuloBusqueda(Sender: TObject);
begin
  inherited;
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMDespiece.DBEFEscandalloBusqueda(Sender: TObject);
begin
  inherited;
  DBEFEscandallo.CondicionBusqueda := '';
  if (Trim(DBEFArticulo.Text) > '') then
     DBEFEscandallo.CondicionBusqueda := 'COMPUESTO=''' + DBEFArticulo.Text + '''';
end;

procedure TFMDespiece.DBFComponenteBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'PRO_SYS_FASES') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'FASE';
        end;
     end;

     if (Trim(TablaABuscar) = 'PRO_FORMULAS') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'NOMBRE';
        end;
     end;

     if (Trim(TablaABuscar) = 'SYS_UNIDADES_ARTICULOS') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'TIPO';
        end;
     end;

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';

        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'ARTICULO';
           if (DMMain.EstadoKri(42) = 1) then
              OrdenadosPor[i] := 'TITULO';
        end;
     end;
  end;
end;

procedure TFMDespiece.DBGTareasBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'PRO_SYS_FASES') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'FASE';
        end;
     end;

     if (Trim(TablaABuscar) = 'PRO_RECURSOS') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'RECURSO';
        end;
     end;

     if (Trim(TablaABuscar) = 'PRO_FORMULAS') then
     begin
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           OrdenadosPor[i] := 'NOMBRE';
        end;
     end;

     if (Trim(TablaABuscar) = 'PRO_SYS_TAREA') or (Trim(TablaABuscar) = 'OPE_SECCIONES') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;

        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
        begin
           if (Trim(TablaABuscar) = 'PRO_SYS_TAREA') then
              OrdenadosPor[i] := 'TAREA'
           else
           if (Trim(TablaABuscar) = 'OPE_SECCIONES') then
              OrdenadosPor[i] := 'SECCION'
           else
              OrdenadosPor[i] := '';
        end;
     end;
  end;
end;

procedure TFMDespiece.DBEFEscandalloChange(Sender: TObject);
begin
  inherited;
  EDescEscandallo.Text := DameTituloEscandalloProduccion(StrToIntDef(DBEFEscandallo.Text, 0));
end;

procedure TFMDespiece.AAdjuntoDespieceExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('DSP', DMDespiece.QMDespieceCabID_DESPIECE_CAB.AsInteger);
end;

procedure TFMDespiece.DBETituloEstadoChange(Sender: TObject);
begin
  inherited;
  ColorSegunEstado(DBETituloEstado, DMDespiece.QMDespieceCabESTADO.AsInteger);
end;

procedure TFMDespiece.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if ((Column.FieldName = 'ESTADO') or (Column.FieldName = 'TITULO_ESTADO')) then
        begin
           ColorSegunEstado(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMDespiece.ADuplicarExecute(Sender: TObject);
var
  IdDespieceDestino : integer;
begin
  inherited;
  IdDespieceDestino := DMDespiece.Duplicar;

  // El duplicado ya no tiene relacion con un documento.
  // Filtro para que refresque datos.
  DMDespiece.FiltraDespiece(0, nil);

  DMDespiece.PosicionarDespiece(IdDespieceDestino);
end;

procedure TFMDespiece.AEliminaLineasVaciasExecute(Sender: TObject);
begin
  inherited;
  DMDespiece.EliminaLineasVacias;
end;

procedure TFMDespiece.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TFMDespiece.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMDespiece.QMDespieceCabID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMDespiece.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMDespiece.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMDespiece.QMDespieceCabID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMDespiece.SBAImagenDblClick(Sender: TObject);
begin
  inherited;
  MuestraImagen(DMDespiece.QMDespieceCabID_IMAGEN.AsInteger);
end;

procedure TFMDespiece.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('DSP', DMDespiece.QMDespieceCabID_DESPIECE_CAB.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntoDespiece.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMDespiece.PNLEditOtrosResize(Sender: TObject);
begin
  inherited;
  if PNLMedidas.Visible then
  begin
     GBDocumentoOrigen.Width := PNLEditOtros.Width div 3;
     PNLMedidas.Width := PNLEditOtros.Width div 3;
  end
  else
  begin
     GBDocumentoOrigen.Width := PNLEditOtros.Width div 2;
  end;
end;

procedure TFMDespiece.DBEFLonaInclinacionChange(Sender: TObject);
begin
  inherited;
  ELonaInclinacion.Text := DMDespiece.DameTituloLonaInclinacion(DBEFLonaInclinacion.Text);
end;

procedure TFMDespiece.DBEFTipoMotorizacionChange(Sender: TObject);
begin
  inherited;
  ETipoMotorizacion.Text := DMDespiece.DameTituloTipoMotorizacion(DBEFTipoMotorizacion.Text);
end;

procedure TFMDespiece.DBEFTipoRulinasChange(Sender: TObject);
begin
  inherited;
  ETipoRulinas.Text := DMDespiece.DameTituloTipoRulinas(DBEFTipoRulinas.Text);
end;

procedure TFMDespiece.DBEFTipoGajoExtendidoChange(Sender: TObject);
begin
  inherited;
  ETipoGajoExtendido.Text := DMDespiece.DameTituloTipoGajoExtendido(DBEFTipoGajoExtendido.Text);
end;

procedure TFMDespiece.DBEFTipoCristalVentanaChange(Sender: TObject);
begin
  inherited;
  ETipoCristalVentana.Text := DMDespiece.DameTituloTipoCristalVentana(DBEFTipoCristalVentana.Text);
end;

procedure TFMDespiece.DBEFTipoConfeccionLonaChange(Sender: TObject);
begin
  inherited;
  ETipoConfeccionLona.Text := DMDespiece.DameTituloTipoConfeccionLona(DBEFTipoConfeccionLona.Text);
end;

procedure TFMDespiece.DBEFUbicacionEtiquetaChange(Sender: TObject);
begin
  inherited;
  EUbicacionEtiqueta.Text := DMDespiece.DameTituloUbicacionEtiqueta(DBEFUbicacionEtiqueta.Text);
end;


procedure TFMDespiece.DBEFRegulacionCofreChange(Sender: TObject);
begin
  inherited;
  ERegulacionCofre.Text := DMDespiece.DameTituloRegulacionCofre(DBEFRegulacionCofre.Text);
end;

end.
