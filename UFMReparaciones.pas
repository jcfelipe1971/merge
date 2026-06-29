unit UFMReparaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, DBCtrls, ULFDBMemo, rxToolEdit,
  RXDBCtrl, ULFDBDateEdit, UHYDescription, ULFHYDBDescription,
  ULFDBEditFind2000, Mask, ULFDBEdit, ULFLabel, DbComboBoxValue, ULFEdit,
  Buttons, ULFEditFind2000, ULFDBComboBoxValue, UDBDateTimePicker,
  TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMReparaciones = class(TFPEditDetalle)
     LReparacion: TLFLabel;
     DBEIdReparacion: TLFDbedit;
     LCliente: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     LEquipo: TLFLabel;
     LMarca: TLFLabel;
     DBEMarca: TLFDbedit;
     LModelo: TLFLabel;
     DBEModelo: TLFDbedit;
     LNroSerie: TLFLabel;
     LOrdenTrabajo: TLFLabel;
     DBEOT: TLFDbedit;
     LTecnico: TLFLabel;
     DBETecnico: TLFDbedit;
     LFechaAviso: TLFLabel;
     DBDEFechaAviso: TLFDBDateEdit;
     LFichaEntrada: TLFLabel;
     DBDEFechaEntrada: TLFDBDateEdit;
     LFechaSalida: TLFLabel;
     DBDEFechaSalida: TLFDBDateEdit;
     LCondicion: TLFLabel;
     DBECondicion: TLFDbedit;
     LObservacionesCliente: TLFLabel;
     LFDBObservClient: TLFDBMemo;
     LDatosEquipo: TLFLabel;
     TSTrabajo: TTabSheet;
     LFCategoryAction1: TLFCategoryAction;
     AListado: TAction;
     AConfig: TAction;
     DBCBActuacion: TDBComboBoxValue;
     LTipoActuacion: TLFLabel;
     LFPanelTrabajo: TLFPanel;
     TBNotas: TLFToolBar;
     NavTrabajo: THYMNavigator;
     TSep1: TToolButton;
     DBMTrabajo: TLFDBMemo;
     DBEIdTrabajo: TLFDbedit;
     CETrabajo: TControlEdit;
     CETrabajoPMEdit: TPopUpTeclas;
     SBACliente: TSpeedButton;
     ALReparaciones: TLFActionList;
     AACliente: TAction;
     DBRBEstado: TDBRadioGroup;
     DBRBCCoste: TDBRadioGroup;
     LFCategoryAction2: TLFCategoryAction;
     ATraspasoAlbaran: TAction;
     LDocumento: TLFLabel;
     SBADocumentoRIG: TSpeedButton;
     ADocumento: TAction;
     TBDocumentos: TToolButton;
     ToolButton3: TToolButton;
     DBEFNumeroSerie: TLFDBEditFind2000;
     DBEFEquipo: TLFDBEditFind2000;
     EDescNumSerie: TLFEdit;
     LSerieDocumento: TLFLabel;
     GBDocumento: TGroupBox;
     DBEFSeries: TLFDBEditFind2000;
     LCosteTotal: TLFLabel;
     LFDBCosteTotal: TLFDbedit;
     DBEEstado: TLFDbedit;
     PNLTRabajoRealizadoDatosCab: TLFPanel;
     DBEDescCliente: TLFDbedit;
     DBEDescClienteTrabajo: TLFDbedit;
     EDescEquipo: TLFEdit;
     DBERIG: TLFDbedit;
     LTipoDocumento: TLFLabel;
     DBETipo: TLFDbedit;
     SBDocumentoTipo: TSpeedButton;
     ATraspasoFactura: TAction;
     BCrearClienteRapido: TButton;
     ANuveoCliente: TAction;
     ANuevaFichaTecnica: TAction;
     SBAEquipo: TSpeedButton;
     AEquipo: TAction;
     LKilometros: TLFLabel;
     DBEKilometros: TLFDbedit;
     PNLTitSerie: TLFPanel;
     LBLSerie: TLFLabel;
     ETitSerie: TLFEdit;
     EFSerie: TLFEditFind2000;
     LFCategoryAction3: TLFCategoryAction;
     AAdjuntoReparacion: TAction;
     AAdjuntoCliente: TAction;
     LFechaPrevSalida: TLFLabel;
     DBDEFechaPrevSalida: TLFDBDateEdit;
     LKmsEntrada: TLFLabel;
     DBEKmsEntrada: TLFDbedit;
     LContacto: TLFLabel;
     DBEContactoNombre: TLFDbedit;
     LEmail: TLFLabel;
     DBEContactoEmail: TLFDbedit;
     LTelefono: TLFLabel;
     DBETelefono: TLFDbedit;
     AAdjuntoFichaTecnica: TAction;
     TSEmpleado: TTabSheet;
     PNLEmpleado: TLFPanel;
     TBEmpleado: TLFToolBar;
     NavEmpleado: THYMNavigator;
     DBGEmpleado: TDBGridFind2000;
     CEEmpleado: TControlEdit;
     PopUpTeclas1: TPopUpTeclas;
     MenuItem1: TMenuItem;
     MenuItem2: TMenuItem;
     MenuItem3: TMenuItem;
     MenuItem4: TMenuItem;
     MenuItem5: TMenuItem;
     MenuItem6: TMenuItem;
     MenuItem7: TMenuItem;
     MenuItem8: TMenuItem;
     MenuItem9: TMenuItem;
     MenuItem10: TMenuItem;
     ptclsCEEmpleadoPMEdit: TPopUpTeclas;
     LProyecto: TLFLabel;
     EFProyecto: TLFDBEditFind2000;
     ETitProyecto: TLFEdit;
     LTipoReparacion: TLFLabel;
     DBCBTipoReparacion: TLFDBComboBoxValue;
     LSituacion: TLFLabel;
     LDireccion: TLFLabel;
     DBEDireccion1: TLFDbedit;
     DBEDireccion2: TLFDbedit;
     LLocalidad: TLFLabel;
     DBEFContactoLocalidad: TLFDBEditFind2000;
     ELocalidad: TLFEdit;
     DBCBSituacion: TLFDBComboBoxValue;
     SBAProyecto: TSpeedButton;
     AProyecto: TAction;
     LHorario: TLFLabel;
     DTPHorario1Desde: TDBDateTimePicker;
     DTPHorario1Hasta: TDBDateTimePicker;
     DTPHorario2Desde: TDBDateTimePicker;
     DTPHorario2Hasta: TDBDateTimePicker;
     LHorarioSep1: TLFLabel;
     LHorarioSep2: TLFLabel;
     PNLTotal: TLFPanel;
     DBETotalaCobrar: TLFDbedit;
     LPieTotal: TLFLabel;
     LPieBaseImponible: TLFLabel;
     DBES_BaseImponible: TLFDbedit;
     LPieIVA: TLFLabel;
     DBECuotaIVA: TLFDbedit;
     ImgFirma: TImage;
     LFirma: TLFLabel;
     DBTFirmaNombre: TDBText;
     DBTNIFFirma: TDBText;
     PNLFirma: TLFPanel;
     LFCategoryAction4: TLFCategoryAction;
     AFiltrarNroSerie: TAction;
     PNLMecanicoReparacion: TLFPanel;
     DBEMecanicoIdReparacion: TLFDbedit;
     DBEMecanicoCliente: TLFDbedit;
     PNLFiltro: TLFPanel;
     LFiltro: TLFLabel;
     EFiltro: TLFEdit;
     LClienteFiltro: TLFLabel;
     EFClienteFiltro: TLFEditFind2000;
     DBEReparacion: TLFDbedit;
     LIdReparacion: TLFLabel;
     LEjercicioDocument: TLFLabel;
     DBEFEmpresa: TLFDBEditFind2000;
     BRellenarObservaciones: TButton;
     LDireccionDocumento: TLFLabel;
     DBEFDireccionDocumento: TLFDBEditFind2000;
     EDireccionDocumento: TLFEdit;
     LRecepcion: TLFLabel;
     DBERecepcion: TLFDbedit;
     SBAReparar: TSpeedButton;
     LIDEOrigen: TLFLabel;
     DBDEFechaEntradaHora: TDBDateTimePicker;
     DBDEFechaAvisoHora: TDBDateTimePicker;
     DBDEFechaPrevSalidaHora: TDBDateTimePicker;
     DBDEFechaSalidaHora: TDBDateTimePicker;
     AListarRecepcion: TAction;
     AHojaDeTrabajo: TAction;
     ASincronizacionSkrit: TAction;
     PnlTareas: TPanel;
     TBTareas: TLFToolBar;
     DBGTareas: TDBGridFind2000;
     NavTareas: THYMNavigator;
     CETarea: TControlEdit;
     CETareaPMEdit: TPopUpTeclas;
     splmecanico: TSplitter;
     TBMecanico: TLFToolBar;
     PNLFiltroMecanicos: TLFPanel;
     CBRelacionarTareaMecanico: TLFCheckBox;
     ToolButton1: TToolButton;
     TBActualizaTiempoHojasDeTrabajo: TToolButton;
     ToolButton2: TToolButton;
     DBETiempoProduccion: TLFDbedit;
     LTiempoProduccion: TLFLabel;
     ToolButton4: TToolButton;
     DBEMargen: TLFDbedit;
     LMargen: TLFLabel;
     DBEEstadoRepar: TLFDbedit;
     DBETituloEstadoRepar: TLFEdit;
     AAbrirCerrar: TAction;
     LFormaPago: TLFLabel;
     DBEFFormaPago: TLFDBEditFind2000;
     ETituloFormaPago: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AListadoExecute(Sender: TObject);
     procedure AConfigExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAClienteExecute(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ATraspasoDocumentoExecute(Sender: TObject);
     procedure ADocumentoExecute(Sender: TObject);
     procedure SBADocumentoRIGDblClick(Sender: TObject);
     procedure TBDocumentosClick(Sender: TObject);
     procedure DBEFNumeroSerieBusqueda(Sender: TObject);
     procedure DBEFNumeroSerieChange(Sender: TObject);
     procedure LFDBEquipoBusqueda(Sender: TObject);
     procedure DBEFEquipoChange(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure DBEIdReparacionChange(Sender: TObject);
     procedure DBEFEquipoBusqueda(Sender: TObject);
     procedure BCrearClienteRapidoClick(Sender: TObject);
     procedure ANuevaFichaTecnicaExecute(Sender: TObject);
     procedure AEquipoExecute(Sender: TObject);
     procedure SBAEquipoDblClick(Sender: TObject);
     procedure AAdjuntoClienteExecute(Sender: TObject);
     procedure AAdjuntoReparacionExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure AAdjuntoFichaTecnicaExecute(Sender: TObject);
     procedure DBGEmpleadoBusqueda(Sender: TObject);
     procedure DBGEmpleadoDblClick(Sender: TObject);
     procedure DBGEmpleadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFProyectoChange(Sender: TObject);
     procedure DBEFContactoLocalidadChange(Sender: TObject);
     procedure AProyectoExecute(Sender: TObject);
     procedure SBAProyectoDblClick(Sender: TObject);
     procedure DBGEmpleadoCellClick(Column: TColumn);
     procedure AFiltrarNroSerieExecute(Sender: TObject);
     procedure EFiltroChange(Sender: TObject);
     procedure BRellenarObservacionesClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFDireccionDocumentoBusqueda(Sender: TObject);
     procedure DBEFDireccionDocumentoChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure SBARepararDblClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AListarRecepcionExecute(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure AHojaDeTrabajoExecute(Sender: TObject);
     procedure ASincronizacionSkritExecute(Sender: TObject);
     procedure CBRelacionarTareaMecanicoChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBCBSituacionChange(Sender: TObject);
     procedure DBEEstadoChange(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure TBActualizaTiempoHojasDeTrabajoClick(Sender: TObject);
     procedure DBEEstadoReparChange(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure DBEFFormaPagoChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     UtilizaVehiculo: boolean;
     ColorSituacion: TStringList;
     BuscandoArticulo: boolean;
     Param_ARTBUSQ004: boolean;
     Param_REPAVIS001: boolean;
     DBGDetalleArticulo: string;
     procedure HabilitaAcciones;
     procedure ActualizaFirma;
     procedure RefrescaDireccion;
     procedure ColorSegunSituacionRep(aObject: TObject; Estado: integer);
     procedure EnviarMensajeRecogida;
  public
     { Public declarations }
     procedure FiltraReparaciones(Filtro: string);
  end;

var
  FMReparaciones : TFMReparaciones;

implementation

uses UFormGest, UDMReparaciones, UDMMain, UDMListados, UFMListconfig,
  UFMain, UUtiles, UDameDato, UEntorno, FIBQuery, UProFMFicherosCliente, DB, HYFIBQuery,
  UFMCreaClienteRapido, UFMAdjunto, UFMSeleccion, UFMRecepcionFichaTecnica,
  UDMLstRecepcionFichaTecnica, UFMSeleccionArticulo, UParam,
  UFMHojaDeTrabajo, UFMSincronizacionSkrit, UFSendCorreo, UImagenes;

{$R *.dfm}

procedure TFMReparaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMReparaciones, DMReparaciones);

  ColorSituacion := TStringList.Create;
  BuscandoArticulo := False;

  DMReparaciones.RellenaTipoReparacion(DBCBTipoReparacion.Items, DBCBTipoReparacion.Values);
  DMReparaciones.RellenaTipoActuacion(DBCBActuacion.Items, DBCBActuacion.Values);
  DMReparaciones.RellenaSituacionReparacion(DBCBSituacion.Items, DBCBSituacion.Values);
  DMReparaciones.RellenaSituacionReparacionColor(ColorSituacion);

  DBEDescCliente.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBACliente, DBEDescCliente);

  DBETipo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBDocumentoTipo, DBETipo);

  DBERIG.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBADocumentoRIG, DBERIG);

  EDescEquipo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEquipo, EDescEquipo);

  ETitProyecto.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAProyecto, ETitProyecto);

  NavMain.DataSource := DMReparaciones.DSCabReparar;
  DBGMain.DataSource := DMReparaciones.DSCabReparar;
  NavDetalle.DataSource := DMReparaciones.DSDetReparar;
  DBGFDetalle.DataSource := DMReparaciones.DSDetReparar;
  NavTareas.DataSource := DMReparaciones.DSxTarea;
  NavEmpleado.DataSource := DMReparaciones.DSxEmpleado;
  NavTrabajo.DataSource := DMReparaciones.DSCabReparar;

  with G2KTableLoc do
  begin
     Base_de_datos := DMMain.DataBase;
     DataSource := DMReparaciones.DSCabReparar;
     Tabla_A_Buscar := 'VER_REPARACIONES';
     CondicionBusqueda := '(EJERCICIO = ' + REntorno.EjercicioStr + ') OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO <> 5 )) AND (SERIE = ''' + EFSerie.Text + ''')';
  end;

  UtilizaVehiculo := (DMMain.EstadoKri(474) = 1);

  AAdjuntoFichaTecnica.Visible := UtilizaVehiculo;
  if (UtilizaVehiculo) then
  begin
     with DBEFEquipo do
     begin
        Tabla_a_buscar := 'REP_FICHA_TECNICA';
        DataField := 'ID_FICHA_TECNICA';
        CampoStr := 'MATRICULA';
        CampoNum := 'ID_FICHA_TECNICA';
        Filtros := [obEmpresa];
        OrdenadoPor.Text := 'MATRICULA';
        Accion := ANuevaFichaTecnica;
     end;
     with G2KTableLoc do
     begin
        CampoStr := 'MATRICULA';
        Filtros := [obEmpresa, obCanal];
        OrdenadoPor.Text := 'MATRICULA';
     end;

     LEquipo.Caption := _('Vehiculo');
     DBEMarca.Enabled := False;
     DBEMarca.Color := clInfoBk;
     DBEModelo.Enabled := False;
     DBEModelo.Color := clInfoBk;
     DBEFNumeroSerie.Enabled := False;
     DBEFNumeroSerie.Color := clInfoBk;
  end;

  EFSerie.Text := REntorno.Serie;
  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'ARTICULO');

  BRellenarObservaciones.Visible := False;
  BCrearClienteRapido.Visible := False;

  DBGTareas.ColumnaInicial := EncuentraField(DBGTareas, 'TIPOTAREA');

  // Color campo ID
  ColorCampoID(DBEIdReparacion);

  SolapaControles(SBAReparar, DBERecepcion);
  DBERecepcion.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMReparaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMReparaciones);
end;

procedure TFMReparaciones.FormDestroy(Sender: TObject);
begin
  inherited;
  ColorSituacion.Free;
end;

procedure TFMReparaciones.FormShow(Sender: TObject);
begin
  inherited;
  DMReparaciones.FiltraMecanicos(CBRelacionarTareaMecanico.Checked);
end;

procedure TFMReparaciones.FormActivate(Sender: TObject);
begin
  inherited;
  // Durante la busqueda se despliega una ventana y al cerrarse se perderia la posicion de los Dataset
  if not BuscandoArticulo then
     DMReparaciones.RefrescarDatos;
end;

procedure TFMReparaciones.AListadoExecute(Sender: TObject);
begin
  inherited;
  DMReparaciones.FiltraListadoReparacion;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(8000, 0, 0, '', _('Listado Reparaciones'), DMReparaciones.frLstReparar, DMReparaciones.frxLstReparar, nil, nil);
  CierraData(DMListados);
end;

procedure TFMReparaciones.AConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  DMReparaciones.FiltraListadoReparacion;
  TFMListConfig.Create(Self).Muestra(8000, Formato, Cabecera, Copias, Pijama, '', DMReparaciones.frLstReparar);
end;

procedure TFMReparaciones.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if Trim(TablaABuscar) = 'VER_ARTICULOS_EF' then
     begin
        CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
        Filtros := [obEmpresa, obEjercicio, obCanal];
     end
     else
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_CON_BARRAS') then
     begin
        CondicionBusqueda := 'BAJA = 0';
        Filtros := [obEmpresa, obEjercicio, obCanal];
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'BARRAS';
     end;
  end;
end;

procedure TFMReparaciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMReparaciones.BusquedaCompleja;
end;

procedure TFMReparaciones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMReparaciones.AAClienteExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFCliente.Text, 0) <> 0) then
  begin
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DBEFCliente.Text);
  end;
end;

procedure TFMReparaciones.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  AACliente.Execute;
end;

procedure TFMReparaciones.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
        DMReparaciones.QMDetRepararARTICULO.AsString + '''' +
        ' and ejercicio=' + REntorno.EjercicioStr);

  if (UpperCase(ColActual.FieldName) = 'ID_DETALLES_E_ORIGEN') then
     FMain.TraspasoDeDocumentosEntrada(DMReparaciones.DameIddocumentoEntrada(DMReparaciones.QMDetRepararID_DETALLES_E_ORIGEN.AsInteger));
end;

procedure TFMReparaciones.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMReparaciones.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'ID_DETALLES_E_ORIGEN') then
     CeldaEnlace(DBGFDetalle, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (Column.FieldName = 'TIPO_LINEA') then
        begin
           if (DataSource.DataSet.FieldByName('TIPO_LINEA').AsString = 'NOR') then
              ColorInfo(Canvas)
           else
              ColorResaltado(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMReparaciones.ADocumentoExecute(Sender: TObject);
begin
  inherited;
  if (DMReparaciones.QMCabRepararID_S.AsInteger <> 0) then
     FMain.TraspasoDeDocumentosSalida(DMReparaciones.QMCabRepararID_S.AsInteger);
end;

procedure TFMReparaciones.SBADocumentoRIGDblClick(Sender: TObject);
begin
  inherited;
  ADocumento.Execute;
end;

procedure TFMReparaciones.TBDocumentosClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
  ProFMFicherosCliente.Filtra(DMReparaciones.QMCabRepararIDCABREPARAR.AsString, 'REPAR_CAB_REPARACIONES(IDCABREPARAR)', 'DELFOS', _('Ficheros de Reparaciones'));
end;

procedure TFMReparaciones.DBEFNumeroSerieBusqueda(Sender: TObject);
begin
  inherited;
  { SQL para condicion de busqueda
  SELECT * FROM ART_ARTICULOS_SERIALIZACION
  WHERE
  EMPRESA = :EMPRESA AND
  CANAL = :CANAL AND
  ARTICULO = :ARTICULO AND
  --ALMACEN = :ALMACEN AND
  CODIGO IN (SELECT D.CODIGO
             FROM ART_ARTICULOS_SER_CLI_DET D
             WHERE
             D.EMPRESA = :EMPRESA AND
             D.CLIENTE = :CLIENT AND
             D.ARTICULO = :ARTICULO AND
             D.CANAL = :CANAL)
  }
  DBEFNumeroSerie.CondicionBusqueda :=
     'EMPRESA = ' + REntorno.EmpresaStr + ' AND CANAL = ' + REntorno.CanalStr + ' AND ARTICULO=''' + DMReparaciones.QMCabRepararEQUIPO.AsString + ''' AND ' +
     ' CODIGO IN (SELECT D.CODIGO FROM ART_ARTICULOS_SER_CLI_DET D WHERE D.EMPRESA = ' + REntorno.EmpresaStr + ' AND ' +
     ' D.CLIENTE = ' + IntToStr(DMReparaciones.QMCabRepararCLIENTE.AsInteger) + ' AND ' +
     ' D.ARTICULO = ''' + DMReparaciones.QMCabRepararEQUIPO.AsString + ''' AND CANAL = ' + REntorno.CanalStr + ')';
end;

procedure TFMReparaciones.DBEFNumeroSerieChange(Sender: TObject);
begin
  inherited;
  EDescNumSerie.Text := DMReparaciones.BuscaDescNumSerie(DBEFEquipo.Text, StrToIntDef(DBEFNumeroSerie.Text, 0));
end;

procedure TFMReparaciones.LFDBEquipoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFNumeroSerie.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and articulo=''' + DMReparaciones.QMCabRepararEQUIPO.AsString + '''';
end;

procedure TFMReparaciones.DBEFEquipoChange(Sender: TObject);
begin
  inherited;
  if (UtilizaVehiculo) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT R.MATRICULA, M.TITULO AS MARCA, R.MODELO, R.BASTIDOR, R.TITULO ');
           SQL.Add(' FROM REP_FICHA_TECNICA R ');
           SQL.Add(' JOIN SYS_MARCA M ON M.ID_MARCA = R.ID_MARCA ');
           SQL.Add(' WHERE ');
           SQL.Add(' R.ID_FICHA_TECNICA = :ID_FICHA_TECNICA ');
           Params.ByName['ID_FICHA_TECNICA'].AsInteger := StrToIntDef(DBEFEquipo.Text, 0);
           ExecQuery;
           EDescEquipo.Text := Trim(FieldByName['MATRICULA'].AsString);
           if (Trim(FieldByName['BASTIDOR'].AsString) > '') then
              EDescEquipo.Text := EDescEquipo.Text + ' (' + Trim(FieldByName['BASTIDOR'].AsString) + ')';
           EDescEquipo.Text := EDescEquipo.Text + ' - ' + Trim(FieldByName['TITULO'].AsString);
           DBEMarca.Text := FieldByName['MARCA'].AsString;
           DBEModelo.Text := FieldByName['MODELO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     EDescEquipo.Text := DameTituloArticulo(DBEFEquipo.Text);
end;

procedure TFMReparaciones.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AListado.Execute;
end;

procedure TFMReparaciones.ATraspasoDocumentoExecute(Sender: TObject);
var
  Tipo : string;
begin
  inherited;
  Tipo := '';
  if (Sender = ATraspasoAlbaran) then
     Tipo := 'ALB';
  if (Sender = ATraspasoFactura) then
     Tipo := 'FAC';

  DMReparaciones.TraspasaDocumento(Tipo);

  EnviarMensajeRecogida;

  HabilitaAcciones;
end;

procedure TFMReparaciones.DBEIdReparacionChange(Sender: TObject);
begin
  inherited;
  HabilitaAcciones;
  ActualizaFirma;
  if (StrToIntDef(DBEIdReparacion.Text, 0)) <> 0 then
  begin
     ColorSegunEstadoRep(DBEEstado, DMReparaciones.QMCabRepararESTADO.AsInteger);
     ColorSegunSituacionRep(DBCBSituacion, DMReparaciones.QMCabRepararSITUACION.AsInteger);
  end;
end;

procedure TFMReparaciones.DBEFEquipoBusqueda(Sender: TObject);
begin
  inherited;
  if (UtilizaVehiculo) then
     DBEFEquipo.CondicionBusqueda := 'CLIENTE=' + DBEFCliente.Text;
end;

procedure TFMReparaciones.HabilitaAcciones;
var
  Habilitado : boolean;
begin
  Habilitado := (DMReparaciones.QMCabRepararID_S.AsInteger = 0);

  ATraspasoAlbaran.Enabled := Habilitado;
  ATraspasoFactura.Enabled := Habilitado;
end;

procedure TFMReparaciones.BCrearClienteRapidoClick(Sender: TObject);
begin
  inherited;
  DMReparaciones.QMCabRepararCLIENTE.AsInteger := CreaClienteRapido;
  DBEFCliente.SetFocus;
end;

procedure TFMReparaciones.ANuevaFichaTecnicaExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     try
        FMain.EnlaceModal := True;
        FMain.EnlaceInstancias := True;
        FMain.EnlaceCrea := True;
        FMain.EjecutaAccion(FMain.AFichaTecnica);

        if FMain.EnlaceDatos <> Null then
        begin
           DBEFEquipo.SetBufferText(FMain.EnlaceDatos);
        end;

        // Busco el siguiente campo habilitado para darle el foco
        if DBEMarca.Enabled then
           DBEMarca.SetFocus
        else
        if DBEModelo.Enabled then
           DBEModelo.SetFocus
        else
        if DBEFNumeroSerie.Enabled then
           DBEFNumeroSerie.SetFocus;
     finally
        FMain.EnlaceModal := False;
        FMain.EnlaceInstancias := False;
        FMain.EnlaceCrea := False;
     end;
  end;
end;

procedure TFMReparaciones.AEquipoExecute(Sender: TObject);
begin
  inherited;
  if (Trim(DBEFEquipo.Text) <> '') then
  begin
     if (UtilizaVehiculo) then
     begin
        FMain.EjecutaAccion(FMain.AFichaTecnica, IntToStr(DMReparaciones.QMCabRepararID_FICHA_TECNICA.AsInteger));
     end
     else
     begin
        FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMReparaciones.QMCabRepararEQUIPO.AsString + '''');
     end;
  end;
end;

procedure TFMReparaciones.SBAEquipoDblClick(Sender: TObject);
begin
  inherited;
  AEquipo.Execute;
end;

procedure TFMReparaciones.AAdjuntoClienteExecute(Sender: TObject);
begin
  inherited;
  TFMAdjunto.Create(Self).Muestra('CLI', DameIDCliente(DMReparaciones.QMCabRepararCLIENTE.AsInteger));
end;

procedure TFMReparaciones.AAdjuntoReparacionExecute(Sender: TObject);
begin
  inherited;
  TFMAdjunto.Create(Self).Muestra('REP', DMReparaciones.QMCabRepararIDCABREPARAR.AsInteger);
end;

procedure TFMReparaciones.AAdjuntoFichaTecnicaExecute(Sender: TObject);
begin
  inherited;
  TFMAdjunto.Create(Self).Muestra('FIT', StrToIntDef(DBEFEquipo.Text, 0));
end;

procedure TFMReparaciones.EFSerieChange(Sender: TObject);
var
  s, serie_aux : string;
  i : integer;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     ETitSerie.Text := DameTituloSerie(EFSerie.Text);
     DMReparaciones.CambiaSerie(EFSerie.Text);

     G2kTableLoc.CondicionBusqueda := '(EJERCICIO = ' + REntorno.EjercicioStr + ') OR ((EJERCICIO < ' + REntorno.EjercicioStr + ') AND (ESTADO <> 5 )) AND (SERIE = ''' + EFSerie.Text + ''')';
  end;

  // Campo para realizar busqueda de articulo en documentos de compra/venta. Por ejemplo ARTICULO, ALFA_1, etc.
  s := LeeParametro('ARTBUSQ001', EFSerie.Text);
  if ((s <> 'ARTICULO') and (s <> '')) then
  begin
     for i := 0 to DBGFDetalle.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFDetalle.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle.CamposDesplegar[i] = '1') then
        begin
           DBGFDetalle.Numericos[i] := s;
           DBGFDetalle.CamposADevolver[i] := 'ARTICULO';
           DBGFDetalle.OrdenadosPor[i] := s;
        end;
     end;
  end;

  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', EFSerie.Text) = 'S');
  for i := 0 to DBGFDetalle.Tablas.Count - 1 do
  begin
     if (Trim(UpperCase(DBGFDetalle.Tablas[i])) = 'VER_ARTICULOS_EF') then
     begin
        if Param_ARTBUSQ004 then
           DBGFDetalle.CamposDesplegar[i] := '0'
        else
           DBGFDetalle.CamposDesplegar[i] := '1';
     end;
  end;

  Param_REPAVIS001 := (LeeParametro('REPAVIS001', EFSerie.Text) = 'S');
end;

procedure TFMReparaciones.DBGEmpleadoBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_EMPLEADOS_EF') then
     begin
        CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr + ' AND ACTIVO = 1';
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'EMPLEADO';
     end;

     if (Trim(TablaABuscar) = 'PRO_REP_TAREA') then
     begin
        CondicionBusqueda := 'IDCABREPARACION =' + IntToStr(DMReparaciones.QMCabRepararIDCABREPARAR.AsInteger);
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'LINEA_TAREA';
     end;
  end;
end;

procedure TFMReparaciones.DBGEmpleadoDblClick(Sender: TObject);
begin
  inherited;
  // Ir a Empleado
end;

procedure TFMReparaciones.DBGEmpleadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  // Resaltar columna
end;

procedure TFMReparaciones.FiltraReparaciones(Filtro: string);
begin
  DMReparaciones.FiltraReparaciones(Filtro);

  if (DMReparaciones.QMCabRepararSERIE.AsString <> EFSerie.Text) then
  begin
     EFSerie.Text := DMReparaciones.QMCabRepararSERIE.AsString;
     EFSerieChange(nil);
     DMReparaciones.FiltraReparaciones(Filtro);
  end;
end;

procedure TFMReparaciones.EFProyectoChange(Sender: TObject);
begin
  inherited;
  ETitProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TFMReparaciones.DBEFContactoLocalidadChange(Sender: TObject);
begin
  inherited;
  ELocalidad.Text := DMReparaciones.DameTituloLocalidad(DBEFContactoLocalidad.Text);
end;

procedure TFMReparaciones.AProyectoExecute(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFProyecto.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProyectos, EFProyecto.Text);
end;

procedure TFMReparaciones.SBAProyectoDblClick(Sender: TObject);
begin
  inherited;
  AProyecto.Execute;
end;

procedure TFMReparaciones.DBGEmpleadoCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMReparaciones.ActualizaFirma;
begin
  if (DMReparaciones.QMFirmas.Active) then
     RefrescarImagenFirma(ImgFirma, DMReparaciones.QMFirmas.FieldByName('ID_FIRMA').AsInteger);
end;

procedure TFMReparaciones.AFiltrarNroSerieExecute(Sender: TObject);
var
  Codigo : integer;
begin
  inherited;
  if PideDato('NSE', Codigo) then
     DMReparaciones.FiltrarNroSerie(Codigo);
end;

procedure TFMReparaciones.EFiltroChange(Sender: TObject);
begin
  inherited;
  DMReparaciones.FiltrarCabecera(EFiltro.Text, StrToIntDef(EFClienteFiltro.Text, 0));
end;

procedure TFMReparaciones.BRellenarObservacionesClick(Sender: TObject);
begin
  inherited;
  DMReparaciones.RellenarObservaciones;
end;

procedure TFMReparaciones.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BRellenarObservaciones.Visible := Button in [nbInsert, nbEdit];
  BCrearClienteRapido.Visible := Button in [nbInsert, nbEdit];
  DBCBSituacionChange(Sender);
end;

procedure TFMReparaciones.DBEFDireccionDocumentoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccionDocumento.CondicionBusqueda := 'TERCERO = ' + IntToStr(DMReparaciones.QMCabRepararTERCERO.AsInteger);
end;

procedure TFMReparaciones.DBEFDireccionDocumentoChange(Sender: TObject);
begin
  inherited;
  RefrescaDireccion;
end;

procedure TFMReparaciones.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  RefrescaDireccion;
end;

procedure TFMReparaciones.RefrescaDireccion;
begin
  EDireccionDocumento.Text := DameDireccionTercero(DMReparaciones.QMCabRepararTERCERO.AsInteger, StrToIntDef(DBEFDireccionDocumento.Text, 0));
end;

procedure TFMReparaciones.SBARepararDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ARecepcionFichaTecnica);
  FMRecepcionFichaTecnica.Filtra(DMReparaciones.QMCabRepararID_REP_RECEPCION.AsInteger, DMReparaciones.QMCabRepararIDCABREPARAR.AsInteger, DMReparaciones.QMCabRepararID_FICHA_TECNICA.AsInteger);
end;

procedure TFMReparaciones.ColorSegunSituacionRep(aObject: TObject; Estado: integer);
var
  ColorFondo : TColor;
begin
  ColorFondo := StrToIntDef(ColorSituacion.Values[IntToStr(Estado)], 0);

  if (ColorFondo = 0) then
     ColorFondo := clInfoBk;

  ColorObjeto(aObject, ColorFondo, clWindowText);
end;

procedure TFMReparaciones.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
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
           ColorSegunEstadoRep(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger);
        end;
        if ((Column.FieldName = 'SITUACION') or (Column.FieldName = 'TITULO_SITUACION')) then
        begin
           ColorSegunSituacionRep(Canvas, DataSource.DataSet.FieldByName('SITUACION').AsInteger);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMReparaciones.AListarRecepcionExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstRecepcionFichaTecnica, DMLstRecepcionFichaTecnica);
  DMLstRecepcionFichaTecnica.MostrarListado(DMReparaciones.QMCabRepararID_REP_RECEPCION.AsInteger);
  CierraData(DMLstRecepcionFichaTecnica);
end;

procedure TFMReparaciones.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
  begin
     if (Key = VK_F3) then
     begin
        try
           BuscandoArticulo := True;
           if PideArticulo(DBGDetalleArticulo, True, False) then
           begin
              if DMReparaciones.QMDetReparar.State = dsBrowse then
                 DMReparaciones.QMDetReparar.Edit;
              DMReparaciones.QMDetRepararARTICULO.AsString := DBGDetalleArticulo;
           end;
           Key := 0;
        finally
           BuscandoArticulo := False;
        end;
     end;
  end;
end;

procedure TFMReparaciones.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if TDBGridFind2000(Sender).DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
     if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
     begin
        if Key in ['a'..'z', 'A'..'Z', '0'..'9', '.', '-', '*', '%', ' ', '_'] then
           DBGDetalleArticulo := DBGDetalleArticulo + Key
        else
        if Key in [#8] then
           DBGDetalleArticulo := Copy(DBGDetalleArticulo, 1, Length(DBGDetalleArticulo) - 1);
     end;
  end
  else
     DBGDetalleArticulo := '';
end;

procedure TFMReparaciones.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
  begin
     // Que se desplegue la busqueda al empezar a escribir el código del articulo
     DBGFDetalle.BuscarChars := not Param_ARTBUSQ004;
     DBGFDetalle.BuscarNums := not Param_ARTBUSQ004;

     DBGDetalleArticulo := '';
     FMain.AddComponentePunto(DBGFDetalle);
  end
  else
  begin
     DBGFDetalle.BuscarChars := False;
     DBGFDetalle.BuscarNums := False;
     FMain.DelComponentePunto(DBGFDetalle);
  end;
end;

procedure TFMReparaciones.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  DBGDetalleArticulo := '';
end;

procedure TFMReparaciones.AHojaDeTrabajoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AHojaDeTrabajo);
  FMHojaDeTrabajo.Filtrar('REP', DMReparaciones.QMCabRepararIDCABREPARAR.AsInteger);
end;

procedure TFMReparaciones.ASincronizacionSkritExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMSincronizacionSkrit, FMSincronizacionSkrit, FMain);
  FMSincronizacionSkrit.Inicializa(DMReparaciones.QMCabRepararIDCABREPARAR.AsInteger, DMReparaciones.QMCabRepararSERIE.AsString);
  FMSincronizacionSkrit.Hide;
  FMSincronizacionSkrit.ShowModal;
  // Refrescar datos
  DMReparaciones.CambiaSerie(EFSerie.Text);
end;

procedure TFMReparaciones.CBRelacionarTareaMecanicoChange(Sender: TObject);
begin
  inherited;
  DMReparaciones.FiltraMecanicos(CBRelacionarTareaMecanico.Checked);
end;

procedure TFMReparaciones.DBCBSituacionChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEIdReparacion.Text, 0)) <> 0 then
     ColorSegunSituacionRep(DBCBSituacion, DMReparaciones.QMCabRepararSITUACION.AsInteger);
end;

procedure TFMReparaciones.DBEEstadoChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEIdReparacion.Text, 0)) <> 0 then
     ColorSegunEstadoRep(DBEEstado, DMReparaciones.QMCabRepararESTADO.AsInteger);
end;

procedure TFMReparaciones.TBActualizaTiempoHojasDeTrabajoClick(Sender: TObject);
begin
  inherited;
  DMReparaciones.ActualizaTiemposHojaTrabajo;
end;

procedure TFMReparaciones.DBEEstadoReparChange(Sender: TObject);
begin
  inherited;
  ColorSegunEstadoRep(DBEEstadoRepar, DMReparaciones.QMCabRepararESTADO_REPAR.AsInteger);
  ColorSegunEstadoRep(DBETituloEstadoRepar, DMReparaciones.QMCabRepararESTADO_REPAR.AsInteger);

  DBETituloEstadoRepar.Text := DameTituloEstado(DMReparaciones.QMCabRepararESTADO_REPAR.AsInteger);

  with AAbrirCerrar do
  begin
     if (DMReparaciones.QMCabRepararESTADO_REPAR.AsInteger = 5) then
     begin
        Hint := _('Abrir Reparacion');
        ImageIndex := 67;
        Tag := 1;
        Caption := _('Abrir Reparacion');
     end
     else
     begin
        Hint := _('Cerrar Reparacion');
        ImageIndex := 68;
        Tag := 0;
        Caption := _('Cerrar Reparacion');
     end;
  end;
end;

procedure TFMReparaciones.AAbrirCerrarExecute(Sender: TObject);
begin
  inherited;
  DMReparaciones.CambiarEstadoRepar(AAbrirCerrar.Tag = 1);
  DMReparaciones.QMCabReparar.Refresh;
end;

procedure TFMReparaciones.EnviarMensajeRecogida;
var
  Asunto : string;
  CuerpoMail : TStrings;
begin
  /// Enviar email o SMS al cliente indicando que puede pasar a recoger vehículo.

  if (Param_REPAVIS001) then
  begin
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        FSendCorreo.Titulo(_('Enviando el pedido por e-mail ...'));
        FSendCorreo.Show;
        FSendCorreo.Texto(_('Preparando listado ...'));

        try
           begin
              FSendCorreo.Texto(_('Enviando Mensaje  ...'));

              InicializaVariableEmail('RAR'); // Reparacion - Aviso Recogida
              with VariableEmail do
              begin
                 Ejercicio := DMReparaciones.QMCabRepararEJERCICIO.AsInteger;
                 Serie := DMReparaciones.QMCabRepararSERIE.AsString;
                 NumeroDocumento := DMReparaciones.QMCabRepararREPARACION.AsInteger;
                 Fecha := DMReparaciones.QMCabRepararFECHA_ENTRADA.AsDateTime;
                 // SuReferencia := DMReparaciones.QMCabRepararSU_REFERENCIA.AsString;
                 // SuPedido := DMReparaciones.QMCabRepararPEDIDO_CLIENTE.AsString;
                 Folio := '';
                 TituloDocTributario := '';
                 NombreFichero := '';
                 Matricula := DMMain.DameMatriculaFichaTecnica(DMReparaciones.QMCabRepararID_FICHA_TECNICA.AsInteger);
                 NombreComercial := DMReparaciones.QMCabRepararNOMBRE_COMERCIAL_CLIENTE.AsString;
                 RazonSocial := DMReparaciones.QMCabRepararNOMBRE_R_SOCIAL_CLIENTE.AsString;
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(REntorno.Entrada));
              end;

              DamePartesEmail(Asunto, CuerpoMail);

              try
                 DMListados.SendMailCliente(DMReparaciones.QMCabRepararCLIENTE.AsInteger, CuerpoMail, Asunto);
              finally
                 CuerpoMail.Free;
              end;

              FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
           end;
        except
           on E: Exception do
           begin
              Application.ProcessMessages;
              with FSendCorreo do
              begin
                 LTexto.AutoSize := True;
                 LTexto.Font.Size := 10;
                 Texto(_('ERROR!! Error en el envío.') + #13#10 + E.Message);
                 BitBtnOk.Top := ClientHeight - BitBtnOk.Height - 4;
                 if (LTexto.Width > ClientWidth) then
                 begin
                    Width := LTexto.Width + 30;
                    BitBtnOk.Left := (ClientWidth div 2) + (BitBtnOk.Width div 2);
                 end;
              end;
           end;
        end;

        FSendCorreo.BitBtnOk.Visible := True;
        Application.ProcessMessages;
        FSendCorreo.Visible := False;
        FSendCorreo.SePuede := True;
        FSendCorreo.ShowModal;
     finally
        FreeAndNil(FSendCorreo);
     end;
  end;
end;

procedure TFMReparaciones.DBEFFormaPagoChange(Sender: TObject);
begin
  inherited;
  ETituloFormaPago.Text := DameTituloFormaPago(DBEFFormaPago.Text);
end;

end.
