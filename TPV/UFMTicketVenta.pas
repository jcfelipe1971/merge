unit UFMTicketVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, UDMTicketVenta, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, dbcgrids, ULFDBCtrlGrid,
  ULFLabel, DBCtrls, ExtCtrls, ULFPanel, ComCtrls, ULFPageControl, Buttons, UUtiles,
  ULFEdit, ToolWin, ULFToolBar, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ActnList, Mask, ULFDBEdit, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  ULFDateEdit, TFlatButtonUnit, ULFMemo, ULFComboBox;

type
  TFMTicketVenta = class(TG2kForm)
     PNLVentas: TLFPanel;
     PNLSeleccion: TLFPanel;
     PNLCabecera: TLFPanel;
     PNLAcciones: TLFPanel;
     PNLPie: TLFPanel;
     DBTTotal: TDBText;
     DBCG1: TLFDBCtrlGrid;
     EFArticulo: TLFEditFind2000;
     BIncrementarCantidad: TFlatButton;
     BReducirCantidad: TFlatButton;
     BSubir: TFlatButton;
     BBajar: TFlatButton;
     BCobrar: TFlatButton;
     BDatosCliente: TFlatButton;
     BEditarLinea: TFlatButton;
     DBTTitulo: TDBText;
     DBTUnidades: TDBText;
     DBTTotalLinea: TDBText;
     PNLLinea: TLFPanel;
     DBTUnidadesTotales: TDBText;
     DBTSumaBases: TDBText;
     DBTSumaCuotaIVA: TDBText;
     PNLTotales: TLFPanel;
     PNLTotalesUnidades: TLFPanel;
     PNLTotalesBase: TLFPanel;
     PNLTotalesIVA: TLFPanel;
     PCMain: TLFPageControl;
     TSSeleccionArticulo: TTabSheet;
     TSCliente: TTabSheet;
     TSLinea: TTabSheet;
     TSCobro: TTabSheet;
     PNLCabeceraLinea: TLFPanel;
     PNLCabeceraCobro: TLFPanel;
     PNLCabeceraCliente: TLFPanel;
     BOkCliente: TFlatButton;
     BCancelarCliente: TFlatButton;
     BOkLinea: TFlatButton;
     BCancelarLinea: TFlatButton;
     BOkCobro: TFlatButton;
     BCancelarCobro: TFlatButton;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     ECliente: TLFEdit;
     LArticuloLinea: TLFLabel;
     EFArticuloLinea: TLFEditFind2000;
     ETituloArticuloLinea: TLFEdit;
     EUnidades: TLFEdit;
     LUnidades: TLFLabel;
     LPrecio: TLFLabel;
     EPrecio: TLFEdit;
     LDescuento: TLFLabel;
     EDescuento: TLFEdit;
     PNLLineaTop: TLFPanel;
     PNLLineaBottom: TLFPanel;
     DBTDescuento: TDBText;
     DBTP_IVA: TDBText;
     DBTPrecio: TDBText;
     DBTLinea: TDBText;
     PNLFormasPago: TLFPanel;
     LImporteFormaPago: TLFLabel;
     EImporteFormaPago: TLFEdit;
     BOkFormaPago: TFlatButton;
     LFormaPago: TLFLabel;
     DBCGFamilia: TLFDBCtrlGrid;
     PNLSeleccionArticulo: TLFPanel;
     DBTFamilia: TDBText;
     DBTTituloFamilia: TDBText;
     SBArticulo: TScrollBox;
     PNLFormaPago: TLFPanel;
     PNLTotalFormasPago: TLFPanel;
     DBGTotalFormaPago: THYTDBGrid;
     BEliminarLinea: TFlatButton;
     PNLTotal: TLFPanel;
     PNLDetalleLinea: TLFPanel;
     Imagen: TImage;
     PNLImagen: TLFPanel;
     BInfoStock: TFlatButton;
     PNLFamilia: TLFPanel;
     LIndicadorFamiliaL: TLFLabel;
     DBTArticulo: TDBText;
     ENIF: TLFEdit;
     LNIF: TLFLabel;
     ETituloTercero: TLFEdit;
     BCreaTercero: TFlatButton;
     ALTicket: TActionList;
     AAsignaCliente: TAction;
     PNLPosicionArticulo: TLFPanel;
     BAnterior: TFlatButton;
     BSiguiente: TFlatButton;
     PNLSeleccionaArticulos: TLFPanel;
     LIndicadorFamiliaT: TLFLabel;
     LIndicadorFamiliaB: TLFLabel;
     LDescuentoCliente: TLFLabel;
     EDescripcionCabecera: TLFEdit;
     LDescripcionCliente: TLFLabel;
     EDescuentoComercial: TLFEdit;
     EADevolver: TLFEdit;
     LADevolver: TLFLabel;
     BMuestraTIckets: TFlatButton;
     TSTickets: TTabSheet;
     PCabeceraTicket: TLFPanel;
     PCuerpoTickets: TLFPanel;
     DBGTickets: THYTDBGrid;
     BOkTicket: TFlatButton;
     BCancelarTicket: TFlatButton;
     BAnteriorTicket: TFlatButton;
     BSiguienteTicket: TFlatButton;
     BImprimirTicket: TFlatButton;
     BCierraTurno: TFlatButton;
     TSCierre: TTabSheet;
     PNLCabeceraCierre: TLFPanel;
     PDetalleCierre: TLFPanel;
     PNLDatosUsuarioCierre: TLFPanel;
     PNLDatosCierre: TLFPanel;
     PDatosFormasPago: TLFPanel;
     LUsuarioCierre: TLFLabel;
     LApertura: TLFLabel;
     LSerieCierre: TLFLabel;
     LSesionCierre: TLFLabel;
     LCajaCierre: TLFLabel;
     LTurnoCierre: TLFLabel;
     LSaldoInicialCierre: TLFLabel;
     LVentasEfectivo: TLFLabel;
     LRetiradoTurno: TLFLabel;
     LCambioSiguienteTurno: TLFLabel;
     LCierre: TLFLabel;
     LTotalVentas: TLFLabel;
     ETituloUsuarioCierre: TLFEdit;
     ETituloSerieCierre: TLFEdit;
     DEApartura: TLFDateEdit;
     BOKCierre: TFlatButton;
     BCancelCierre: TFlatButton;
     DBGFormaPagoCierre: TDBGrid;
     EUsuarioCierre: TLFEdit;
     ESerieCierre: TLFEdit;
     ECajaCierre: TLFEdit;
     ESesionCierre: TLFEdit;
     ETurnoCierre: TLFEdit;
     ESaldoInicial: TLFEdit;
     EVentasEfectivo: TLFEdit;
     ERetirtadoTurno: TLFEdit;
     ECambioSiguienteTurno: TLFEdit;
     LTotalVentasTurno: TLFLabel;
     ETotalVentasTurno: TLFEdit;
     BImprimirArqueo: TFlatButton;
     CBMoneda: TCheckBox;
     AFocoArticulo: TAction;
     BNuevoTicket: TFlatButton;
     BCobrarTicketSinImprimir: TFlatButton;
     BNuevoTicket2: TFlatButton;
     LExistenTicketsAbiertos: TLFLabel;
     BIngresosEgresos: TFlatButton;
     TSIngresosEgresos: TTabSheet;
     PnlIngCabecera: TLFPanel;
     PnlIngCuerpo: TLFPanel;
     BOKIngresoEgreso: TFlatButton;
     BCancelarIngresoEgreso: TFlatButton;
     LTipoMov: TLFLabel;
     LDescripcion: TLFLabel;
     LNota: TLFLabel;
     LImporte: TLFLabel;
     PnlIngPie: TLFPanel;
     DBGIngresosEgresos: TDBGrid;
     BNuevoIngresoRetirada: TFlatButton;
     BEliminarIngresoRetirada: TFlatButton;
     CBTipoMov: TLFComboBox;
     EImporte: TLFEdit;
     EDescripcion: TLFEdit;
     MNota: TLFMemo;
     BAnularTicket: TFlatButton;
     BImprimeRecibo: TFlatButton;
     ESaldoIngresoEgreso: TLFEdit;
     LSaldoIngresoEgreso: TLFLabel;
     LTotalEfectivo: TLFLabel;
     ETotalEfectivo: TLFEdit;
     BRegistroFitosanitario: TFlatButton;
     BAbrirCaja: TFlatButton;
     BImprimirIngEgr: TFlatButton;
     BBuscaArticulo: TFlatButton;
     BCrearNuevoAlCobrar: TFlatButton;
     DBNumTicket: TDBText;
     LRIT: TLabel;
     LCarnetAplicador: TLFLabel;
     ECarnetAplicador: TLFEdit;
     PNLRegFitosanitario: TLFPanel;
     LRegistroFitosanitario: TLFLabel;
     BBuscaTercero: TFlatButton;
     ERegFitoNombre: TLFEdit;
     ERegFitoNIF: TLFEdit;
     ERegFitoDireccion: TLFEdit;
     ERegFitoCP: TLFEdit;
     ERegFitoLocalidad: TLFEdit;
     ERegCarnetAplicador: TLFEdit;
     EFBuscaNIF: TLFEditFind2000;
     ERegTelefono: TLFEdit;
     LFitosanitarioNombre: TLFLabel;
     LFitosanitarioNIF: TLFLabel;
     LFitosanitarioDireccion: TLFLabel;
     LFitosanitarioCodigoPostal: TLFLabel;
     LFitosanitarioTelefono: TLFLabel;
     LFitosanitarioCarnetAplicador: TLFLabel;
     LFitosanitarioLocalidad: TLFLabel;
     LAgente: TLFLabel;
     EFAgente: TLFEditFind2000;
     EAgente: TLFEdit;
     LAgenteCobro: TLFLabel;
     EFAgenteCobro: TLFEditFind2000;
     ACobrar: TAction;
     LPrecioCoste: TLFLabel;
     EPrecioCoste: TLFEdit;
     LMargen: TLFLabel;
     EMargen: TLFEdit;
     LMargenBruto: TLFLabel;
     EMargenBruto: TLFEdit;
     ADatosCliente: TAction;
     AEditarLinea: TAction;
     AMuestraTickets: TAction;
     AIngresoEgreso: TAction;
     ACierraTurno: TAction;
     SBSubfamilia: TScrollBox;
     PNLDetalleCliente: TPanel;
     LCodigoDeBarras: TLFLabel;
     ECodigoBarras: TLFEdit;
     BFacturar: TFlatButton;
     EFTipoIva: TLFEditFind2000;
     LTipoIva: TLFLabel;
     ETipoIva: TLFEdit;
     LSimboloPociento: TLFLabel;
     PNLSeleccionCaja: TLFPanel;
     LSeleccionCaja: TLabel;
     EAgenteCobro: TLFEdit;
     PNLTicketsTotales: TLFPanel;
     LTotalLiquido: TLFLabel;
     LCantidadTickets: TLFLabel;
     LPromedio: TLFLabel;
     ECantidadTickets: TLFEdit;
     ETotalLiquido: TLFEdit;
     EPromedio: TLFEdit;
     LEmail: TLFLabel;
     EEmail: TLFEdit;
     BEnviaEmail: TButton;
     BSafeMoney: TFlatButton;
     tmrSafemoney: TTimer;
     ENombreComercial: TLFEdit;
     ENombreComercialTercero: TLFEdit;
     LNombreComercialTercero: TLFLabel;
     LNombreComercialCliente: TLFLabel;
     LCategoria: TLFLabel;
     ETituloCategoria: TLFEdit;
     ECategoria: TLFEdit;
     CBImagenes: TCheckBox;
     BAlbaranar: TFlatButton;
     DBTCliente: TDBText;
     BSonido: TFlatButton;
     LArticulosNoValidos: TLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBCG1Click(Sender: TObject);
     procedure BIncrementarCantidadClick(Sender: TObject);
     procedure BReducirCantidadClick(Sender: TObject);
     procedure BSubirClick(Sender: TObject);
     procedure BBajarClick(Sender: TObject);
     procedure BCobrarClick(Sender: TObject);
     procedure BDatosClienteClick(Sender: TObject);
     procedure BEditarLineaClick(Sender: TObject);
     procedure BOkClienteClick(Sender: TObject);
     procedure BCancelarClienteClick(Sender: TObject);
     procedure BOkLineaClick(Sender: TObject);
     procedure BCancelarLineaClick(Sender: TObject);
     procedure BOkCobroClick(Sender: TObject);
     procedure BCancelarCobroClick(Sender: TObject);
     procedure TSClienteShow(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure TSLineaShow(Sender: TObject);
     procedure EFArticuloLineaChange(Sender: TObject);
     procedure PNLVentasResize(Sender: TObject);
     procedure TSCobroShow(Sender: TObject);
     procedure BotonFormaPagoClick(Sender: TObject);
     procedure EImporteFormaPagoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure BOkFormaPagoClick(Sender: TObject);
     procedure PNLSeleccionArticuloResize(Sender: TObject);
     procedure DBTFamiliaClick(Sender: TObject);
     procedure DBCGFamiliaClick(Sender: TObject);
     procedure BEliminarLineaClick(Sender: TObject);
     procedure BInfoStockClick(Sender: TObject);
     procedure TSSeleccionArticuloShow(Sender: TObject);
     procedure ENIFChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AAsignaClienteExecute(Sender: TObject);
     procedure BAnteriorClick(Sender: TObject);
     procedure BSiguienteClick(Sender: TObject);
     procedure EUnidadesEnter(Sender: TObject);
     procedure EPrecioEnter(Sender: TObject);
     procedure EDescuentoEnter(Sender: TObject);
     procedure BMuestraTIcketsClick(Sender: TObject);
     procedure BOkTicketClick(Sender: TObject);
     procedure BCancelarTicketClick(Sender: TObject);
     procedure BAnteriorTicketClick(Sender: TObject);
     procedure BSiguienteTicketClick(Sender: TObject);
     procedure TSTicketsShow(Sender: TObject);
     procedure BImprimirTicketClick(Sender: TObject);
     procedure BCierraTurnoClick(Sender: TObject);
     procedure BCancelCierreClick(Sender: TObject);
     procedure BOKCierreClick(Sender: TObject);
     procedure EUsuarioCierreChange(Sender: TObject);
     procedure ESerieCierreChange(Sender: TObject);
     procedure TSCierreShow(Sender: TObject);
     procedure ERetirtadoTurnoEnter(Sender: TObject);
     procedure ECambioSiguienteTurnoEnter(Sender: TObject);
     procedure BImprimirArqueoClick(Sender: TObject);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure EImporteRecibidoChange(Sender: TObject);
     procedure CBMonedaClick(Sender: TObject);
     procedure AFocoPagarExecute(Sender: TObject);
     procedure AFocoClienteExecute(Sender: TObject);
     procedure AFocoArticuloExecute(Sender: TObject);
     procedure BNuevoTicketClick(Sender: TObject);
     procedure BCobrarTicketSinImprimirClick(Sender: TObject);
     procedure PNLCabeceraClienteResize(Sender: TObject);
     procedure BCreaTerceroClick(Sender: TObject);
     procedure PNLCabeceraLineaResize(Sender: TObject);
     procedure PNLCabeceraCobroResize(Sender: TObject);
     procedure PNLCabeceraCierreResize(Sender: TObject);
     procedure PCabeceraTicketResize(Sender: TObject);
     procedure DBGTicketsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure BOKIngresoEgresoClick(Sender: TObject);
     procedure BNuevoIngresoRetiradaClick(Sender: TObject);
     procedure BEliminarIngresoRetiradaClick(Sender: TObject);
     procedure BCancelarIngresoEgresoClick(Sender: TObject);
     procedure BIngresosEgresosClick(Sender: TObject);
     procedure TSIngresosEgresosExit(Sender: TObject);
     procedure TSIngresosEgresosShow(Sender: TObject);
     procedure BImprimeReciboClick(Sender: TObject);
     procedure PnlIngCabeceraResize(Sender: TObject);
     procedure BImprimirIngEgrClick(Sender: TObject);
     procedure BRegistroFitosanitarioClick(Sender: TObject);
     procedure BAbrirCajaClick(Sender: TObject);
     procedure BBuscaArticuloClick(Sender: TObject);
     procedure EADevolverChange(Sender: TObject);
     procedure BAnularTicketClick(Sender: TObject);
     procedure BBuscaTerceroClick(Sender: TObject);
     procedure EFBuscaNIFChange(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure EFAgenteBusqueda(Sender: TObject);
     procedure ACobrarExecute(Sender: TObject);
     procedure EPrecioCosteChange(Sender: TObject);
     procedure EDescuentoChange(Sender: TObject);
     procedure EPrecioChange(Sender: TObject);
     procedure EUnidadesChange(Sender: TObject);
     procedure ADatosClienteExecute(Sender: TObject);
     procedure AEditarLineaExecute(Sender: TObject);
     procedure AMuestraTicketsExecute(Sender: TObject);
     procedure AIngresoEgresoExecute(Sender: TObject);
     procedure ACierraTurnoExecute(Sender: TObject);
     procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGTicketsKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure PNLDetalleClienteResize(Sender: TObject);
     procedure BFacturarClick(Sender: TObject);
     procedure EFTipoIvaChange(Sender: TObject);
     procedure BotonesCajaClick(Sender: TObject);
     procedure EFAgenteCobroChange(Sender: TObject);
     procedure BEnviaEmailClick(Sender: TObject);
     procedure BSafeMoneyClick(Sender: TObject);
     procedure tmrSafemoneyTimer(Sender: TObject);
     procedure DBCG1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
     procedure ECategoriaChange(Sender: TObject);
     procedure CBImagenesClick(Sender: TObject);
     procedure BAlbaranarClick(Sender: TObject);
     procedure BSonidoClick(Sender: TObject);
  private
     { Private declarations }
     DM: TDMTicketVenta;
     param_TPVPRCO001: boolean;
     EsArticulo: boolean;
     Param_ARTBUSQ004: boolean;
     Param_TPVTICC005: boolean;
     Param_TPVTICC006: boolean;
     Param_TPVTICC007: boolean;
     Param_TPVIMPR001: boolean;
     // ColActual: TColumn;
     procedure TabSheesInvisibles;
     procedure InicializarFoco;
     procedure HabilitaEdicion;
     procedure InhabilitaEdicion;
     procedure TicketCobrado;
     procedure TicketParaCobrar;
     function DameTituloTicket: string;
     procedure DameDatosTurno;
     procedure CalculaCambio;
     procedure LimpiaCampos;
     procedure RellenaCamposRegistro(Tercero, Cliente: integer);
     procedure DameMargen;
     procedure CreaBotonesCaja;
     procedure MuestraTotalesCajaTurno;
     procedure EstadoBotonesCobro(Habilitar: boolean);
     procedure PintaFormaPago;
  public
     { Public declarations }
     procedure BotonesClick(Sender: TObject);
     procedure MuestraArticulos;
     procedure LocalizaTicket(rit: integer; Ejercicio: integer = 0; Canal: integer = 0; Serie: string = '');
  end;

var
  FMTicketVenta : TFMTicketVenta;

procedure TraspasoATicket(Serie: string; id_Ticket: integer);

implementation

uses
  UEntorno, UDameDato, UFMSeleccion, UDMMain, HYFIBQuery, FIBDataSet, FIBDatabase, UFMDocInfoStocks, UFPregNIFFACTURA, UDMLstArqueos, UParam,
  UFMain, UFMRegistroFitosanitario, UFMFacturarTickets, UDMSafemoney, UFMSeleccionArticulo, MMSystem, UImagenes;

{$R *.dfm}

procedure TraspasoATicket(Serie: string; id_Ticket: integer);
var
  Ejercicio, Canal, Rit : integer;
  Tipo : string;
begin
  FMain.EjecutaAccion(FMain.AVentas);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT EJERCICIO, CANAL, TIPO, SERIE, RIT FROM GES_TICKET_CABECERA WHERE ID_TICKET = :ID_TICKET';
        Params.ByName['ID_TICKET'].AsInteger := id_Ticket;
        ExecQuery;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Tipo := FieldByName['TIPO'].AsString;
        Serie := FieldByName['SERIE'].AsString;
        Rit := FieldByName['RIT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  FMTicketVenta.LocalizaTicket(Rit, Ejercicio, Canal, Serie);
end;

procedure TFMTicketVenta.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // El formulario vera las teclas antes de que las vea el control activo.
  KeyPreview := True;

  AbreDataVarias(TDMTicketVenta, DM, Self);
  AbreData(TDMSafemoney, DMSafemoney);

  DBTTotal.DataSource := DM.DSxInfoActualizada;

  TabSheesInvisibles;

  CBImagenes.Checked := LeeDatoIni('FMTicketVenta', 'MostrarImagenes', True);

  TSSeleccionArticulo.TabVisible := True;

  { Asigno Imagenes a Botones. Lista ILTPV
  0 Anticipo, entrega
  1 Cliente
  2 Editar
  3 Menos
  4 Más
  5 Subir
  6 Bajar
  7 Eliminar
  8 OK
  9 Cancelar
  10 Cobrar, Forma de pago
  11 Efectivo
  12 Tarjeta
  13 Vale
  14 Stocks
  15 Nuevo
  16 Cerrar turno
  17 Sin impresion
  18 Fitosanitario
  19 Imprimir informe
  20 Abrir turno }
  GetBitmapFromImageList(BDatosCliente, 1, DMMain.ILTPV_Ac, 1);
  GetBitmapFromImageList(BDatosCliente, 2, DMMain.ILTPV_In, 1);
  GetBitmapFromImageList(BCreaTercero, 1, DMMain.ILTPV_Ac, 1);
  GetBitmapFromImageList(BCreaTercero, 2, DMMain.ILTPV_In, 1);
  GetBitmapFromImageList(BBuscaTercero, 1, DMMain.ILTPV_Ac, 1);
  GetBitmapFromImageList(BBuscaTercero, 2, DMMain.ILTPV_In, 1);
  GetBitmapFromImageList(BEditarLinea, 1, DMMain.ILTPV_Ac, 2);
  GetBitmapFromImageList(BEditarLinea, 2, DMMain.ILTPV_In, 2);
  GetBitmapFromImageList(BReducirCantidad, 1, DMMain.ILTPV_Ac, 3);
  GetBitmapFromImageList(BReducirCantidad, 2, DMMain.ILTPV_In, 3);
  GetBitmapFromImageList(BIncrementarCantidad, 1, DMMain.ILTPV_Ac, 4);
  GetBitmapFromImageList(BIncrementarCantidad, 2, DMMain.ILTPV_In, 4);
  GetBitmapFromImageList(BSubir, 1, DMMain.ILTPV_Ac, 5);
  GetBitmapFromImageList(BSubir, 2, DMMain.ILTPV_In, 5);
  GetBitmapFromImageList(BAnterior, 1, DMMain.ILTPV_Ac, 5);
  GetBitmapFromImageList(BAnterior, 2, DMMain.ILTPV_In, 5);
  GetBitmapFromImageList(BAnteriorTicket, 1, DMMain.ILTPV_Ac, 5);
  GetBitmapFromImageList(BAnteriorTicket, 2, DMMain.ILTPV_In, 5);
  GetBitmapFromImageList(BBajar, 1, DMMain.ILTPV_Ac, 6);
  GetBitmapFromImageList(BBajar, 2, DMMain.ILTPV_In, 6);
  GetBitmapFromImageList(BSiguiente, 1, DMMain.ILTPV_Ac, 6);
  GetBitmapFromImageList(BSiguiente, 2, DMMain.ILTPV_In, 6);
  GetBitmapFromImageList(BSiguienteTicket, 1, DMMain.ILTPV_Ac, 6);
  GetBitmapFromImageList(BSiguienteTicket, 2, DMMain.ILTPV_In, 6);
  GetBitmapFromImageList(BEliminarLinea, 1, DMMain.ILTPV_Ac, 7);
  GetBitmapFromImageList(BEliminarLinea, 2, DMMain.ILTPV_In, 7);
  GetBitmapFromImageList(BAnularTicket, 1, DMMain.ILTPV_Ac, 7);
  GetBitmapFromImageList(BAnularTicket, 2, DMMain.ILTPV_In, 7);
  GetBitmapFromImageList(BEliminarIngresoRetirada, 1, DMMain.ILTPV_Ac, 7);
  GetBitmapFromImageList(BEliminarIngresoRetirada, 2, DMMain.ILTPV_In, 7);
  GetBitmapFromImageList(BOkCliente, 1, DMMain.ILTPV_Ac, 8);
  GetBitmapFromImageList(BOkCliente, 2, DMMain.ILTPV_In, 8);
  GetBitmapFromImageList(BOkLinea, 1, DMMain.ILTPV_Ac, 8);
  GetBitmapFromImageList(BOkLinea, 2, DMMain.ILTPV_In, 8);
  GetBitmapFromImageList(BOkCobro, 1, DMMain.ILTPV_Ac, 8);
  GetBitmapFromImageList(BOkCobro, 2, DMMain.ILTPV_In, 8);
  GetBitmapFromImageList(BOkTicket, 1, DMMain.ILTPV_Ac, 8);
  GetBitmapFromImageList(BOkTicket, 2, DMMain.ILTPV_In, 8);
  GetBitmapFromImageList(BOKCierre, 1, DMMain.ILTPV_Ac, 8);
  GetBitmapFromImageList(BOKCierre, 2, DMMain.ILTPV_In, 8);
  GetBitmapFromImageList(BOKIngresoEgreso, 1, DMMain.ILTPV_Ac, 8);
  GetBitmapFromImageList(BOKIngresoEgreso, 2, DMMain.ILTPV_In, 8);
  GetBitmapFromImageList(BCancelarCliente, 1, DMMain.ILTPV_Ac, 9);
  GetBitmapFromImageList(BCancelarCliente, 2, DMMain.ILTPV_In, 9);
  GetBitmapFromImageList(BCancelarLinea, 1, DMMain.ILTPV_Ac, 9);
  GetBitmapFromImageList(BCancelarLinea, 2, DMMain.ILTPV_In, 9);
  GetBitmapFromImageList(BCancelarCobro, 1, DMMain.ILTPV_Ac, 9);
  GetBitmapFromImageList(BCancelarCobro, 2, DMMain.ILTPV_In, 9);
  GetBitmapFromImageList(BCancelarTicket, 1, DMMain.ILTPV_Ac, 9);
  GetBitmapFromImageList(BCancelarTicket, 2, DMMain.ILTPV_In, 9);
  GetBitmapFromImageList(BCancelCierre, 1, DMMain.ILTPV_Ac, 9);
  GetBitmapFromImageList(BCancelCierre, 2, DMMain.ILTPV_In, 9);
  GetBitmapFromImageList(BCancelarIngresoEgreso, 1, DMMain.ILTPV_Ac, 9);
  GetBitmapFromImageList(BCancelarIngresoEgreso, 2, DMMain.ILTPV_In, 9);
  GetBitmapFromImageList(BCobrar, 1, DMMain.ILTPV_Ac, 10);
  GetBitmapFromImageList(BCobrar, 2, DMMain.ILTPV_In, 10);
  GetBitmapFromImageList(BOkFormaPago, 1, DMMain.ILTPV_Ac, 10);
  GetBitmapFromImageList(BOkFormaPago, 2, DMMain.ILTPV_In, 10);
  GetBitmapFromImageList(BIngresosEgresos, 1, DMMain.ILTPV_Ac, 11);
  GetBitmapFromImageList(BIngresosEgresos, 2, DMMain.ILTPV_In, 11);
  GetBitmapFromImageList(BImprimeRecibo, 1, DMMain.ILTPV_Ac, 11);
  GetBitmapFromImageList(BImprimeRecibo, 2, DMMain.ILTPV_In, 11);
  GetBitmapFromImageList(BMuestraTIckets, 1, DMMain.ILTPV_Ac, 13);
  GetBitmapFromImageList(BMuestraTIckets, 2, DMMain.ILTPV_In, 13);
  GetBitmapFromImageList(BImprimirTicket, 1, DMMain.ILTPV_Ac, 13);
  GetBitmapFromImageList(BImprimirTicket, 2, DMMain.ILTPV_In, 13);
  GetBitmapFromImageList(BFacturar, 1, DMMain.ILTPV_Ac, 2);
  GetBitmapFromImageList(BFacturar, 2, DMMain.ILTPV_In, 2);
  GetBitmapFromImageList(BInfoStock, 1, DMMain.ILTPV_Ac, 14);
  GetBitmapFromImageList(BInfoStock, 2, DMMain.ILTPV_In, 14);
  GetBitmapFromImageList(BNuevoTicket, 1, DMMain.ILTPV_Ac, 15);
  GetBitmapFromImageList(BNuevoTicket, 2, DMMain.ILTPV_In, 15);
  GetBitmapFromImageList(BNuevoTicket2, 1, DMMain.ILTPV_Ac, 15);
  GetBitmapFromImageList(BNuevoTicket2, 2, DMMain.ILTPV_In, 15);
  GetBitmapFromImageList(BNuevoIngresoRetirada, 1, DMMain.ILTPV_Ac, 15);
  GetBitmapFromImageList(BNuevoIngresoRetirada, 2, DMMain.ILTPV_In, 15);
  GetBitmapFromImageList(BCrearNuevoAlCobrar, 1, DMMain.ILTPV_Ac, 15);
  GetBitmapFromImageList(BCrearNuevoAlCobrar, 2, DMMain.ILTPV_In, 15);
  GetBitmapFromImageList(BCierraTurno, 1, DMMain.ILTPV_Ac, 16);
  GetBitmapFromImageList(BCierraTurno, 2, DMMain.ILTPV_In, 16);
  GetBitmapFromImageList(BCobrarTicketSinImprimir, 1, DMMain.ILTPV_Ac, 17);
  GetBitmapFromImageList(BCobrarTicketSinImprimir, 2, DMMain.ILTPV_In, 17);
  GetBitmapFromImageList(BRegistroFitosanitario, 1, DMMain.ILTPV_Ac, 18);
  GetBitmapFromImageList(BRegistroFitosanitario, 2, DMMain.ILTPV_In, 18);
  GetBitmapFromImageList(BImprimirIngEgr, 1, DMMain.ILTPV_Ac, 19);
  GetBitmapFromImageList(BImprimirIngEgr, 2, DMMain.ILTPV_Ac, 19);
  GetBitmapFromImageList(BImprimirArqueo, 1, DMMain.ILTPV_Ac, 20);
  GetBitmapFromImageList(BImprimirArqueo, 2, DMMain.ILTPV_In, 20);
  GetBitmapFromImageList(BAbrirCaja, 1, DMMain.ILTPV_Ac, 20);
  GetBitmapFromImageList(BAbrirCaja, 2, DMMain.ILTPV_In, 20);
  GetBitmapFromImageList(BAlbaranar, 1, DMMain.ILTPV_Ac, 13);
  GetBitmapFromImageList(BAlbaranar, 2, DMMain.ILTPV_In, 13);

  GetBitmapFromImageList(BSafeMoney, 1, DMMain.ILTPV_Ac, 0);
  GetBitmapFromImageList(BSafeMoney, 2, DMMain.ILTPV_In, 0);

  GetBitmapFromImageList(BSonido, 1, DMMain.ILTPV_Ac, 1);
  GetBitmapFromImageList(BSonido, 2, DMMain.ILTPV_In, 1);

  // Lista ILMain
  GetBitmapFromImageList(BBuscaArticulo, 1, DMMain.ILMain_Ac, 83);
  GetBitmapFromImageList(BBuscaArticulo, 2, DMMain.ILMain_In, 83);

  // Parametro TPVTIC001 - Permite visualizar la edicion de tickets del turno en el TPV
  BMuestraTIckets.Visible := (LeeParametro('TPVTIC001') = 'S');

  // Parametro TPVTIC002 - Permite visualizar la edicion de linea del ticket en el TPV
  BEditarLinea.Visible := (LeeParametro('TPVTIC002') = 'S');

  // Parametro TPVCITU001 - Ocultar el botón de Cierre de Turno
  BCierraTurno.Visible := (LeeParametro('TPVCITU001', REntorno.Serie) = 'N');

  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', REntorno.Serie) = 'S');

  Param_TPVIMPR001 := (LeeParametro('TPVIMPR001', REntorno.Serie) = 'S');

  // Parametro TPVPRCO001 - Mostrar el precio de coste y el margen de beneficio al editar una linea en TPV
  param_TPVPRCO001 := (LeeParametro('TPVPRCO001') = 'S');
  if param_TPVPRCO001 then
  begin
     EPrecioCoste.Visible := True;
     LPrecioCoste.Visible := True;
     EMargen.Visible := True;
     LMargen.Visible := True;
     EMargenBruto.Visible := True;
     LMargenBruto.Visible := True;
  end
  else
  begin
     EPrecioCoste.Visible := False;
     LPrecioCoste.Visible := False;
     EMargen.Visible := False;
     LMargen.Visible := False;
     EMargenBruto.Visible := False;
     LMargenBruto.Visible := False;
  end;

  Param_TPVTICC005 := (LeeParametro('TPVTICC005') = 'S');
  Param_TPVTICC006 := (LeeParametro('TPVTICC006') = 'S');
  Param_TPVTICC007 := (LeeParametro('TPVTICC007') = 'S');

  BImprimeRecibo.Visible := (REntorno.Pais = 'BOL');
  CBMoneda.Visible := REntorno.Pais = 'BOL';

  FMain.AddComponenteReturn(EFArticulo);
  if REntorno.VerSoloArticulosDisponibles then
  begin
     EFArticulo.Tabla_a_buscar := 'VER_ARTICULOS_EF_VENTAS';
  end;

  EsArticulo := False;

  if (REntorno.Caja = 0) then
  begin
     PNLSeleccionCaja.Width := PNLVentas.Width;
     PNLSeleccionCaja.Align := alLeft;

     PNLVentas.Visible := False;
     PNLSeleccionCaja.Visible := True;
     PNLSeleccion.Enabled := False;

     CreaBotonesCaja;
  end
  else
     PNLSeleccionCaja.Visible := False;
end;

procedure TFMTicketVenta.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

procedure TFMTicketVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EscribeDatoIni('FMTicketVenta', 'MostrarImagenes', CBImagenes.Checked);
  CierraData(DMSafemoney);
  FMain.DelComponenteReturn(EFArticulo);
  Action := caFree;
end;

procedure TFMTicketVenta.EFArticuloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Articulo : string;
  EnEdicion : boolean;
begin
  Articulo := Trim(EFArticulo.Text);
  EnEdicion := True;

  // Tecla [F3]
  if Param_ARTBUSQ004 then
  begin
     if (Key = VK_F3) then
     begin
        if PideArticulo(Articulo, True, False) then
           Key := VK_RETURN
        else
           Key := 0;
     end;
  end;

  // Tecla [Intro]
  if (Key = VK_RETURN) then
  begin
     if (Articulo <> '') then
     begin
        if (DameIDArticulo(Articulo) = 0) then
           Articulo := DameArticuloBarras(Articulo);

        if (Articulo = '') then
           // ShowMessage(format(_('No se encuentra artículo con código < %s >'), [Trim(EFArticulo.Text)]))
           LArticulosNoValidos.Caption := LArticulosNoValidos.Caption + Trim(EFArticulo.Text) + #13#10
        else
        begin
           DM.InsertaLinea(Articulo);
           if (DM.RequiereRegistroFitosanitario(DM.QMDetalle.FieldByName('ID_A').AsInteger)) then
           begin
              EnEdicion := False;
              PCMain.ActivePage := TSLinea;
           end;
        end;

        EFArticulo.Text := '';
     end;
  end;

  // Tecla [Escape]
  if (Key = VK_ESCAPE) then
  begin
     EFArticulo.Text := '';
  end;

  // Tecla [+]
  if ((Key = 187) or (Key = VK_ADD)) then
  begin
     if (Articulo <> '') then
     begin
        DM.IncrementaUnidades;
        EFArticulo.Text := '';
     end;
  end;

  // Tecla [-]
  if ((Key = 189) or (Key = VK_SUBTRACT)) then
  begin
     if (Articulo <> '') then
     begin
        DM.DecrementaUnidades;
        EFArticulo.Text := '';
     end;
  end;

  // Tecla [Flecha arriba]
  if (Key = VK_UP) then
  begin
     DM.Subir;
     EFArticulo.Text := '';
  end;

  // Tecla [Flecha Abajo]
  if (Key = VK_DOWN) then
  begin
     DM.Bajar;
     EFArticulo.Text := '';
  end;

  if (EnEdicion) then
     HabilitaEdicion
  else
     InhabilitaEdicion;
end;

procedure TFMTicketVenta.DBCG1Click(Sender: TObject);
begin
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
end;

procedure TFMTicketVenta.BIncrementarCantidadClick(Sender: TObject);
begin
  DM.IncrementaUnidades;
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
end;

procedure TFMTicketVenta.BReducirCantidadClick(Sender: TObject);
begin
  DM.DecrementaUnidades;
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
end;

procedure TFMTicketVenta.BSubirClick(Sender: TObject);
begin
  DM.Subir;
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
end;

procedure TFMTicketVenta.BBajarClick(Sender: TObject);
begin
  DM.Bajar;
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
end;

procedure TFMTicketVenta.BCobrarClick(Sender: TObject);
begin
  if (DM.QMCabecera.Active) then
  begin
     TabSheesInvisibles;
     TSCobro.TabVisible := True;

     //inicializamos en cero el valor a devolver cada vez que entramos a esta opción
     if (DM.QMCabeceraESTADO.AsInteger = 0) then
     begin
        EADevolver.Text := FormatFloat('0.00', DM.QMCabeceraLIQUIDO.AsFloat);
        ColorError(EADevolver);
        LADevolver.Caption := _('A Pagar');
     end
     else
        EADevolver.Text := '0';
  end;
end;

procedure TFMTicketVenta.TabSheesInvisibles;
var
  i : integer;
begin
  InhabilitaEdicion;
  for i := 0 to PCMain.PageCount - 1 do
     try
        PCMain.Pages[i].TabVisible := False;
     except
     end;
end;

procedure TFMTicketVenta.BDatosClienteClick(Sender: TObject);
begin
  TabSheesInvisibles;
  TSCliente.TabVisible := True;
  // Vaciamos el valor del NIF cuando se entre en esta opcion
  ENIF.Text := '';

  DM.AbreQMNif;
  if (Trim(DM.QMNIFNIF.AsString) > '') then
  begin
     ENIF.Text := Trim(DM.QMNIFNIF.AsString);
     ETituloTercero.Text := Trim(DM.QMNIFNOMBRE.AsString);
     ENombreComercialTercero.Text := Trim(DM.QMNIFNOMBRE.AsString);
  end;
  DM.CierraQMNif;
end;

procedure TFMTicketVenta.BEditarLineaClick(Sender: TObject);
begin
  if (DM.QMCabecera.Active) then
  begin
     TabSheesInvisibles;
     TSLinea.TabVisible := True;
  end;
end;

procedure TFMTicketVenta.BOkClienteClick(Sender: TObject);
begin
  DM.CambiaDatosCabecera(StrToIntDef(EFCliente.Text, 0), StrToIntDef(EFAgente.Text, 0), EDescripcionCabecera.Text, StrToFloat(EDescuentoComercial.Text));
  InicializarFoco;
end;

procedure TFMTicketVenta.InicializarFoco;
begin
  TabSheesInvisibles;
  TSSeleccionArticulo.TabVisible := True;
  Caption := DameTituloTicket;
  HabilitaEdicion;
end;

procedure TFMTicketVenta.TicketCobrado;
begin
  BOkCobro.Enabled := False;
  BCobrarTicketSinImprimir.Enabled := False;
  BImprimeRecibo.Enabled := False;
  BCancelarCobro.Enabled := False;
  BOkFormaPago.Enabled := False;
  BCrearNuevoAlCobrar.Enabled := True;
  BFacturar.Enabled := False;
  BAlbaranar.Enabled := False;
end;

procedure TFMTicketVenta.TicketParaCobrar;
begin
  // Si es un cliente no permito cobrar. Solo se podran hacer facturas
  if (Param_TPVTICC005 and (DM.QMCabeceraCLIENTE.AsInteger > 0)) then
  begin
     BOkCobro.Enabled := False;
     BCobrarTicketSinImprimir.Enabled := False;
  end
  else
  begin
     BOkCobro.Enabled := True;
     BCobrarTicketSinImprimir.Enabled := True;
  end;

  BImprimeRecibo.Enabled := True;
  BCancelarCobro.Enabled := True;
  BOkFormaPago.Enabled := True;
  BCrearNuevoAlCobrar.Enabled := False;
  BAlbaranar.Enabled := True;

  BFacturar.Enabled := True;
  // Si existe una forma de pago activado Remesar
  if Param_TPVTICC006 then
     BFacturar.Enabled := DM.ExisteFormaPagoRemesable;
end;

procedure TFMTicketVenta.BCancelarClienteClick(Sender: TObject);
begin
  InicializarFoco;
end;

procedure TFMTicketVenta.BOkLineaClick(Sender: TObject);
begin
  DM.CambiaLinea(EFArticuloLinea.Text, ETituloArticuloLinea.Text, StrToFloatDef(EUnidades.Text, 0), StrToFloatDef(EPrecio.Text, 0), StrToFloatDef(EDescuento.Text, 0), StrToIntDef(EFTipoIva.Text, 0));

  // Creamos un nuevo codigo de barras para el articulo
  ECodigoBarras.Text := Trim(ECodigoBarras.Text);
  if (ECodigoBarras.Text > '') then
     DM.CrearNuevoCodigoBarra(ECodigoBarras.Text);

  InicializarFoco;
end;

procedure TFMTicketVenta.BCancelarLineaClick(Sender: TObject);
begin
  InicializarFoco;
end;

procedure TFMTicketVenta.BOkCobroClick(Sender: TObject);
var
  email : string;
begin
  DM.CierraTicket(False, False, StrToIntDef(EFAgenteCobro.Text, 0), EEmail.Text);

  if (DMMain.UtilizaVerifactu) then
  begin
     FMain.EjecutaAccion(FMain.AFacturarTickets, '');
     FMFacturarTickets.FacturarUnTicket(DM.QMCabeceraID_TICKET.AsInteger);
     CierraForm(FMFacturarTickets);
  end;

  email := '';
  if Param_TPVIMPR001 then
     email := Trim(EEmail.Text);

  DM.ImprimirTicket(email, True, False);

  // InicializarFoco;
  TicketCobrado;
end;

procedure TFMTicketVenta.BCancelarCobroClick(Sender: TObject);
begin
  // Dejo de mirar el cajo Safmoney si está en medio de un cobro
  tmrSafemoney.Enabled := False;

  // Borro los importes que se hubieran entrado hasta ahora.
  if (DM.QMCabeceraESTADO.AsInteger = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' DELETE FROM GES_TICKET_FP ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' RIT = :RIT ');
           Params.ByName['EMPRESA'].AsInteger := DM.QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := DM.QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := DM.QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := DM.QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := DM.QMCabeceraTIPO.AsString;
           Params.ByName['RIT'].AsInteger := DM.QMCabeceraRIT.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  InicializarFoco;
end;

procedure TFMTicketVenta.TSClienteShow(Sender: TObject);
begin
  // Esto activa la cabecera y crea un nuevo ticket si no existe.
  dm.CreaCabeceraTicket;

  EFCliente.Text := IntToStr(DM.QMCabeceraCLIENTE.AsInteger);
  EFAgente.Text := IntToStr(DM.QMCabeceraAGENTE.AsInteger);

  EDescuentoComercial.Text := FormatFloat(',0.00', DM.QMCabecera.FieldByName('DTO_CIAL').AsFloat);
  EDescripcionCabecera.Text := DM.QMCabecera.FieldByName('DESCRIPCION').AsString;
  if EFCliente.CanFocus then
     EFCliente.SetFocus;

  ECarnetAplicador.Text := DM.DameCarnetAplicador;

  //Verificamos si no puede seleccionar cliente
  if (LeeParametro('TPVTERC002') = 'S') then
  begin
     EFCliente.Enabled := False;
     EFCliente.Color := clInfoBk;
  end;

  //Verificamos si no puede asignar descuento a cliente
  if (LeeParametro('TPVTERC003') = 'S') then
  begin
     EDescuentoComercial.Enabled := False;
     EDescripcionCabecera.Enabled := False;
     EDescuentoComercial.Color := clInfoBk;
     EDescripcionCabecera.Color := clInfoBk;
  end;
end;

procedure TFMTicketVenta.EFClienteChange(Sender: TObject);
var
  Cliente : integer;
begin
  Cliente := StrToIntDef(EFCliente.Text, 0);

  ECliente.Text := DameTituloCliente(Cliente);
  ENombreComercial.Text := DameNombreComercialCliente(Cliente);
  EDescuentoComercial.Text := FormatFloat(',0.00', DM.DameDecuentoComercial(Cliente));

  ECategoria.Text := DM.DameCategoriaCliente(Cliente);
  if (ECategoria.Text = 'SOC') then
  begin
     ColorResaltado4(ECategoria);
     ColorResaltado4(ETituloCategoria);
  end
  else
  begin
     ColorInfo(ECategoria);
     ColorInfo(ETituloCategoria);
  end;

  // Habilito creación de tercero solo si es cliente vario
  ENIF.Enabled := (Cliente < 0);
  ETituloTercero.Enabled := (Cliente < 0);
  ENombreComercialTercero.Enabled := (Cliente < 0);
  BCreaTercero.Enabled := (Cliente < 0);
end;

procedure TFMTicketVenta.TSLineaShow(Sender: TObject);
begin
  EFArticuloLinea.Text := DM.QMDetalle.FieldByName('ARTICULO').AsString;
  EUnidades.Text := DM.QMDetalle.FieldByName('UNIDADES').AsString;
  EPrecio.Text := FormatFloat(DM.LocalMascaraL, DM.QMDetalle.FieldByName('PRECIO').AsFloat);
  EDescuento.Text := FormatFloat(',0.00', DM.QMDetalle.FieldByName('DESCUENTO').AsFloat);
  ECodigoBarras.Text := DameCodigoBarras(EFArticuloLinea.Text);
  EFTipoIva.Text := IntToStr(DM.QMDetalle.FieldByName('TIPO_IVA').AsInteger);

  if param_TPVPRCO001 then
     EPrecioCoste.Text := FormatFloat(DM.LocalMascaraL, DM.QMDetalle.FieldByName('P_COSTE').AsFloat);

  // Imagen - Registro Fitosanitario
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT IMAGEN ');
        SQL.Add(' FROM ART_ARTICULOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := DM.QMDetalle.FieldByName('EMPRESA').AsInteger;
        Params.ByName['ARTICULO'].AsString := DM.QMDetalle.FieldByName('ARTICULO').AsString;
        ExecQuery;
        RefrescarImagen(Imagen, FieldByName['IMAGEN'].AsInteger);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (DM.RequiereRegistroFitosanitario(DM.QMDetalle.FieldByName('ID_A').AsInteger)) then
  begin
     PNLRegFitosanitario.Visible := True;
     RellenaCamposRegistro(DM.QMCabeceraTERCERO.AsInteger, DM.QMCabeceraCLIENTE.AsInteger);
  end
  else
     PNLRegFitosanitario.Visible := False;

  if EUnidades.CanFocus then
     EUnidades.SetFocus;
end;

procedure TFMTicketVenta.EFArticuloLineaChange(Sender: TObject);
begin
  ETituloArticuloLinea.Text := DameTituloArticulo(EFArticuloLinea.Text);
  // Calcular Precio de articulo
end;

procedure TFMTicketVenta.PNLVentasResize(Sender: TObject);
begin
  DBCG1.RowCount := DBCG1.Height div 42;
end;

procedure TFMTicketVenta.TSCobroShow(Sender: TObject);
var
  BitBtn : TFlatButton;
  i : integer;
  TotalCobrado : double;
  // Boton : TFlatButton;
  FormaPago : string;
begin
  TicketParaCobrar;

  DM.InsertaEntregas;
  EFAgenteCobro.Text := IntToStr(DM.QMCabeceraAGENTE.AsInteger);

  // Asignamos e-mail si lo tiene
  EEmail.Text := DM.DameEmailTicket(DM.QMCabeceraID_Ticket.AsInteger);

  // Primero limpio la barra de los botones de forma de pago
  while PNLFormasPago.ComponentCount > 0 do
     PNLFormasPago.Components[PNLFormasPago.ComponentCount - 1].Free;

  // Recorro formas de pago agregando botones.
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT T.FORMA_PAGO, T.TITULO, P.TIPO_EFECTO ');
           SelectSQL.Add(' FROM GES_TPV_FP T');
           SelectSQL.Add(' JOIN SYS_FORMAS_PAGO P ON T.FORMA_PAGO = P.FORMA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' T.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' T.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' T.CANAL = :CANAL AND ');
           SelectSQL.Add(' T.SERIE = :SERIE AND ');
           SelectSQL.Add(' T.CAJA = :CAJA AND ');
           SelectSQL.Add(' T.ACTIVA = 1 ');
           SelectSQL.Add(' ORDER BY T.ORDEN, T.FORMA_PAGO ');
           Params.ByName['EMPRESA'].AsInteger := DM.QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := DM.QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := DM.QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := DM.QMCabeceraSERIE.AsString;
           Params.ByName['CAJA'].AsInteger := REntorno.Caja;
           Open;
           i := 0;
           while not EOF do
           begin
              BitBtn := TFlatButton.Create(PNLFormasPago);
              BitBtn.Parent := PNLFormasPago;
              BitBtn.Name := 'BBtn' + FieldByName('FORMA_PAGO').AsString;
              BitBtn.Caption := '&' + IntToStr(i + 1) + '-' + FieldByName('FORMA_PAGO').AsString;
              BitBtn.ShowHint := True;
              BitBtn.Hint := FieldByName('TITULO').AsString;
              BitBtn.Left := i * 150;
              BitBtn.Top := 0;
              BitBtn.Height := 70;
              BitBtn.Width := 100;
              BitBtn.OnClick := BotonFormaPagoClick;
              BitBtn.Layout := blGlyphTop;
              BitBtn.TabStop := True;

              // Imagen dependiente del tipo de efecto
              if (FieldByName('TIPO_EFECTO').AsString = 'ENT') then
                 GetBitmapFromImageList(BitBtn, 1, DMMain.ILTPV_Ac, 0)
              else if (FieldByName('TIPO_EFECTO').AsString = 'CRE') then
                 GetBitmapFromImageList(BitBtn, 1, DMMain.ILTPV_Ac, 12)
              else if (FieldByName('TIPO_EFECTO').AsString = 'VAL') then
                 GetBitmapFromImageList(BitBtn, 1, DMMain.ILTPV_Ac, 13)
              else
                 GetBitmapFromImageList(BitBtn, 1, DMMain.ILTPV_Ac, 11);

              Inc(i);
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  // Calculo cuanto falta por pagar
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(TOTAL_COBRADO) TOTAL_COBRADO, SUM(TOTAL_ENTREGADO) TOTAL_ENTREGADO ');
        SQL.Add(' FROM GES_TICKET_FP ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' RIT = :RIT ');
        Params.ByName['EMPRESA'].AsInteger := DM.QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := DM.QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := DM.QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := DM.QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := DM.QMCabeceraTIPO.AsString;
        Params.ByName['RIT'].AsInteger := DM.QMCabeceraRIT.AsInteger;
        ExecQuery;
        TotalCobrado := FieldByName['TOTAL_COBRADO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  LFormaPago.Caption := DM.FormaPagoTicket;

  if (Trim(LFormaPago.Caption) = '') then
  begin
     // Busco la forma de pago del cliente dentro de las posibles para TPV
     i := 0;
     while (i < PNLFormasPago.ComponentCount - 1) do
     begin
        if (PNLFormasPago.Components[i] is TFlatButton) then
        begin
           if (Pos('-' + DM.QMCabeceraFORMA_PAGO.AsString, TFlatButton(PNLFormasPago.Components[i]).Caption) > 0) then
              LFormaPago.Caption := DM.QMCabeceraFORMA_PAGO.AsString;
        end;

        Inc(i);
     end;
  end;

  PintaFormaPago;

  EImporteFormaPago.Text := FormatFloat('0.00', DM.QMCabeceraLIQUIDO.AsFloat - TotalCobrado);
  if EImporteFormaPago.CanFocus then
     EImporteFormaPago.SetFocus;

  // Se asigna forma de pago Transferencia del cliente si tiene asignado un cliente
  // Utilizara esta forma de pago aunque no este disponible para la caja
  if (Param_TPVTICC007) then
  begin
     FormaPago := DM.FormaPagoTransferencia(DM.QMCabeceraCLIENTE.AsInteger);
     if (FormaPAgo > '') then
     begin
        LFormaPago.Caption := FormaPago;
        BOkFormaPagoClick(nil);
     end;
  end;
end;

procedure TFMTicketVenta.BotonFormaPagoClick(Sender: TObject);
begin
  // Seleccionar forma de pago
  // ShowMessage(TToolButton(Sender).Caption);
  LFormaPago.Caption := Copy(TToolButton(Sender).Caption, Pos('-', TToolButton(Sender).Caption) + 1, Length(TToolButton(Sender).Caption));

  PintaFormaPago;

  if EImporteFormaPago.CanFocus then
     EImporteFormaPago.SetFocus;
end;

procedure TFMTicketVenta.PintaFormaPago;
begin
  if Trim(LFormaPago.Caption) = '' then
     ColorError(LFormaPago)
  else
     ColorResaltado2(LFormaPago);
end;

procedure TFMTicketVenta.EImporteFormaPagoKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
     BOkFormaPago.Click;
  end;
end;

procedure TFMTicketVenta.BOkFormaPagoClick(Sender: TObject);
var
  Importe, Factor : double;
begin
  Importe := StrToFloatDef(EImporteFormaPago.Text, 0);

  // Si es CBMoneda extranjera convertimos el importe a la CBMoneda del entorno
  if (CBMoneda.Checked) then
  begin
     Factor := DMMain.DameFactor('USD', REntorno.Moneda, DM.QMCabecera.FieldByName('FECHA').AsDateTime);
     if (Factor <> 0) then
        Importe := Importe / Factor;
  end;

  DM.InsertaFormaPago(LFormaPago.Caption, Importe);

  if (DM.xInfoActualizadaA_DEVOLVER.AsFloat > 0) then
  begin
     EADevolver.Text := FormatFloat('0.00', DM.xInfoActualizadaA_DEVOLVER.AsFloat);
     EImporteFormaPago.Text := FormatFloat('0.00', 0);
  end
  else
  begin
     EADevolver.Text := FormatFloat('0.00', DM.xInfoActualizadaA_DEVOLVER.AsFloat * (-1));
     EImporteFormaPago.Text := FormatFloat('0.00', DM.xInfoActualizadaA_DEVOLVER.AsFloat * (-1));
  end;

  if EImporteFormaPago.CanFocus then
     EImporteFormaPago.SetFocus;
  EImporteFormaPago.SelectAll;

  BFacturar.Enabled := True;
  // Si existe una forma de pago activado Remesar
  if Param_TPVTICC006 then
     BFacturar.Enabled := DM.ExisteFormaPagoRemesable;
end;

procedure TFMTicketVenta.PNLSeleccionArticuloResize(Sender: TObject);
begin
  DBCGFamilia.RowCount := DBCGFamilia.Height div 50;

  if EsArticulo then
     MuestraArticulos
  else
     DBTFamiliaClick(Sender);
end;

procedure TFMTicketVenta.CreaBotonesCaja;
var
  Botones : TLabel;
  tTop, tLeft, i, CuantosEntranAncho, CuantosEntranAlto : integer;
  BotonAncho, BotonAlto : integer;
begin
  // Ancho, Alto aproximado del botón
  BotonAncho := 100;
  BotonAlto := 65;

  // Primero limpio los que hay
  with PNLSeleccionCaja do
  begin
     if (ComponentCount > 0) then
        for i := ComponentCount - 1 downto 0 do
           if (Components[i] <> LSeleccionCaja) then
              Components[i].Free;

     // Ajusto altura de boton
     CuantosEntranAlto := (Height - HorzScrollBar.Size) div BotonAlto;
     BotonAlto := (Height - HorzScrollBar.Size) div CuantosEntranAlto;

     // Ajusto anchura de boton
     CuantosEntranAncho := (Width - VertScrollBar.Size) div BotonAncho;
     BotonAncho := (Width - VertScrollBar.Size) div CuantosEntranAncho;
  end;

  tTop := LSeleccionCaja.Height + 5;
  tLeft := 0;
  i := 0;

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT CAJA, TITULO FROM VER_CAJAS_USUARIOS_ACTIVAS ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' SERIE = :SERIE AND ');
           SelectSQL.Add(' ACTIVA = 1 AND ');
           SelectSQL.Add(' ACTIVO = 1 AND ');
           SelectSQL.Add(' USUARIO = :USUARIO ');
           SelectSQL.Add(' ORDER BY CAJA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := REntorno.Serie;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Open;

           while not EOF do
           begin
              // Parte Codigo de Articulo
              Botones := TLabel.Create(PNLSeleccionCaja);
              Botones.AutoSize := False;
              Botones.Parent := PNLSeleccionCaja;
              Botones.Width := BotonAncho - 2;
              Botones.Height := 22;
              Botones.Layout := tlCenter;
              Botones.Alignment := taCenter;
              Botones.Font.Height := 16;
              Botones.Font.Style := [fsBold];
              Botones.ShowHint := True;
              Botones.Hint := FieldByName('TITULO').AsString;
              Botones.Caption := IntToStr(FieldByName('CAJA').AsInteger);
              Botones.Tag := FieldByName('CAJA').AsInteger;
              Botones.OnClick := BotonesCajaClick;
              Botones.Top := tTop;
              Botones.Left := tLeft;
              if ((i mod 2) = 0) then
                 Botones.Color := clWhite
              else
                 Botones.Color := clMoneyGreen;

              // Parte Descripcion de Articulo
              Botones := TLabel.Create(PNLSeleccionCaja);
              Botones.AutoSize := False;
              Botones.Parent := PNLSeleccionCaja;
              Botones.Width := BotonAncho - 2;
              Botones.Height := BotonAlto - 22 - 2;
              Botones.Layout := tlCenter;
              Botones.Alignment := taCenter;
              Botones.Font.Height := 12;
              Botones.Font.Style := [fsBold];
              Botones.ShowHint := True;
              Botones.WordWrap := True;
              Botones.Hint := FieldByName('TITULO').AsString;
              Botones.Caption := FieldByName('TITULO').AsString;
              Botones.Tag := FieldByName('CAJA').AsInteger;
              Botones.OnClick := BotonesCajaClick;
              Botones.Top := tTop + 22;
              Botones.Left := tLeft;
              if ((i mod 2) = 0) then
                 Botones.Color := clWhite
              else
                 Botones.Color := clMoneyGreen;

              Inc(i);

              tLeft := tLeft + BotonAncho;
              if tLeft = BotonAncho * CuantosEntranAncho then
              begin
                 tLeft := 0;
                 tTop := tTop + BotonAlto;
                 if ((CuantosEntranAncho mod 2) = 0) then
                    // Salto uno para que se desplace el color y quede como tablero de ajedrez
                    Inc(i);
              end;

              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMTicketVenta.DBTFamiliaClick(Sender: TObject);
var
  Botones : TLabel;
  tTop, tLeft, i, CuantosEntranAncho, CuantosEntranAlto : integer;
  BotonAncho, BotonAlto : integer;
  Subfamilia, Titulo : string;
  IdSubfamilia : integer;
  Imagen : TImage;
  Panel : TPanel;
  AlturaImagen : integer;
  MostrarImagen : boolean;
begin
  DMMain.LogIni('DBTFamiliaClick');
  // Crear botones con subfamilias de esta familia
  EsArticulo := False;

  if (PCMain.ActivePage = TSSeleccionArticulo) then
  begin
     if (DMMain.EstadoKri(445) <> 1) then
     begin
        MuestraArticulos;
        EsArticulo := True;
        SBArticulo.Visible := True;
     end
     else
     begin
        MostrarImagen := CBImagenes.Checked;
        // Ancho, Alto aproximado del botón
        BotonAncho := 100;
        //Mostrar imagen de la familia
        AlturaImagen := 0;
        if MostrarImagen then
           AlturaImagen := 60;
        BotonAlto := 65 + AlturaImagen;

        SBArticulo.Visible := False;
        SBSubfamilia.Visible := False;

        DMMain.Log('Limpia panel');
        // Primero limpio los que hay
        with SBSubfamilia do
        begin
           if (ComponentCount > 0) then
              for i := ComponentCount - 1 downto 0 do
                 Components[i].Free;

           // Ajusto altura de boton
           CuantosEntranAlto := (Height - HorzScrollBar.Size) div BotonAlto;
           BotonAlto := (Height - HorzScrollBar.Size) div CuantosEntranAlto;

           // Ajusto anchura de boton
           CuantosEntranAncho := (Width - VertScrollBar.Size) div BotonAncho;
           BotonAncho := (Width - VertScrollBar.Size) div CuantosEntranAncho;
        end;

        tTop := 0;
        tLeft := 0;
        i := 0;
        DMMain.Log('LimitaSubfamilias');
        DM.LimitaSubfamilias(CuantosEntranAlto * CuantosEntranAncho);
        DMMain.Log('FiltraSubfamilias');
        DM.FiltraSubfamilias;
        DM.xSubfamilia.First;
        DMMain.LogIni('while');
        while not DM.xSubfamilia.EOF do
        begin
           Titulo := DM.xSubfamilia.FieldByName('TITULO').AsString;
           Subfamilia := DM.xSubfamilia.FieldByName('SUBFAMILIA').AsString;
           IdSubfamilia := DM.xSubfamilia.FieldByName('ID_SUBFAMILIA').AsInteger;

           // Parte Codigo de Articulo
           Botones := TLabel.Create(SBSubfamilia);
           Botones.AutoSize := False;
           Botones.Parent := SBSubfamilia;
           Botones.Width := BotonAncho - 2;
           Botones.Height := 22;
           Botones.Layout := tlCenter;
           Botones.Alignment := taCenter;
           Botones.Font.Height := 16;
           Botones.Font.Style := [fsBold];
           Botones.ShowHint := True;
           Botones.Hint := Titulo;
           Botones.Caption := Subfamilia;
           Botones.Tag := IdSubfamilia;
           Botones.OnClick := BotonesClick;
           Botones.Top := tTop;
           Botones.Left := tLeft;
           if ((i mod 2) = 0) then
              Botones.Color := clWhite
           else
              Botones.Color := clMoneyGreen;

           if MostrarImagen then
           begin
              Panel := TPanel.Create(SBSubfamilia);
              Panel.Parent := SBSubfamilia;
              Panel.Top := tTop + 22;
              Panel.Left := tLeft;
              Panel.Width := BotonAncho - 2;
              Panel.Height := AlturaImagen;
              Panel.Caption := '';
              Panel.BevelOuter := bvNone;
              if ((i mod 2) = 0) then
                 Panel.Color := clWhite
              else
                 Panel.Color := clMoneyGreen;

              Imagen := TImage.Create(Panel);
              Imagen.Parent := Panel;
              Imagen.AutoSize := False;
              Imagen.Top := 0;
              Imagen.Left := 20;
              Imagen.Width := BotonAncho - 40;
              Imagen.Height := AlturaImagen;
              Imagen.OnClick := BotonesClick;
              Imagen.Hint := Titulo;
              Imagen.ShowHint := True;
              Imagen.Visible := True;
              Imagen.Proportional := True;
              Imagen.Transparent := False;
              Imagen.Tag := IdSubfamilia;

              RefrescarImagenTPV(Imagen, DM.xSubfamilia.FieldByName('ID_IMAGEN').AsInteger, Trunc(Imagen.Width div 10) * 20, Trunc(Imagen.Height div 10) * 20);
           end;

           // Parte Descripcion de Articulo
           Botones := TLabel.Create(SBSubfamilia);
           Botones.AutoSize := False;
           Botones.Parent := SBSubfamilia;
           Botones.Width := BotonAncho - 2;
           Botones.Height := BotonAlto - 22 - 2 - AlturaImagen;
           Botones.Layout := tlCenter;
           Botones.Alignment := taCenter;
           Botones.Font.Height := 12;
           Botones.Font.Style := [fsBold];
           Botones.ShowHint := True;
           Botones.WordWrap := True;
           Botones.Hint := Titulo;
           Botones.Caption := Titulo;
           Botones.Tag := IdSubfamilia;
           Botones.OnClick := BotonesClick;
           Botones.Top := tTop + 22 + AlturaImagen;
           Botones.Left := tLeft;
           if ((i mod 2) = 0) then
              Botones.Color := clWhite
           else
              Botones.Color := clMoneyGreen;

           Inc(i);

           tLeft := tLeft + BotonAncho;
           if tLeft = BotonAncho * CuantosEntranAncho then
           begin
              tLeft := 0;
              tTop := tTop + BotonAlto;
              if ((CuantosEntranAncho mod 2) = 0) then
                 // Salto uno para que se desplace el color y quede como tablero de ajedrez
                 Inc(i);
           end;

           DM.xSubfamilia.Next;
        end;
        DMMain.LogFin('while');

        SBSubfamilia.Visible := True;
     end;
  end;

  DMMain.LogFin('DBTFamiliaClick');
end;

procedure TFMTicketVenta.BotonesClick(Sender: TObject);
var
  Key : word;
begin
  if EsArticulo then
  begin
     EFArticulo.Text := DameArticulo((Sender as TControl).Tag);
     Key := VK_RETURN;
     EFArticuloKeyUp(Sender, Key, []);
  end
  else
  begin
     PNLSeleccionArticulo.Tag := (Sender as TControl).Tag;
     MuestraArticulos;
     EsArticulo := True;
  end;
end;

procedure TFMTicketVenta.MuestraArticulos;
var
  Botones : TLabel;
  tTop, tLeft, i, CuantosEntranAncho, CuantosEntranAlto : integer;
  BotonAncho, BotonAlto : integer;
  IdA : integer;
  Articulo, Titulo : string;
  Imagen : TImage;
  Panel : TPanel;
  AlturaImagen : integer;
  MostrarImagen : boolean;
begin
  if (PCMain.ActivePage = TSSeleccionArticulo) then
  begin
     MostrarImagen := CBImagenes.Checked;
     // Ancho, Alto aproximado del botón
     BotonAncho := 100;
     AlturaImagen := 0;
     if MostrarImagen then
        AlturaImagen := 60;
     BotonAlto := 65 + AlturaImagen;

     SBSubFamilia.Visible := False;
     SBArticulo.Visible := True;
     SBArticulo.Visible := False;

     // Primero limpio los que hay
     with SBArticulo do
     begin
        if (ComponentCount > 0) then
           for i := ComponentCount - 1 downto 0 do
              Components[i].Free;

        // Ajusto altura de boton
        CuantosEntranAlto := (Height - HorzScrollBar.Size) div BotonAlto;
        BotonAlto := (Height - HorzScrollBar.Size) div CuantosEntranAlto;

        // Ajusto anchura de boton
        CuantosEntranAncho := (Width - VertScrollBar.Size) div BotonAncho;
        BotonAncho := (Width - VertScrollBar.Size) div CuantosEntranAncho;
     end;

     tTop := 0;
     tLeft := 0;
     i := 0;
     DM.LimitaArticulos(CuantosEntranAlto * CuantosEntranAncho);
     DM.FiltraArticulos(PNLSeleccionArticulo.Tag);
     DM.xArticulo.First;
     while not DM.xArticulo.EOF do
     begin
        Titulo := DM.xArticulo.FieldByName('TITULO').AsString;
        Articulo := DM.xArticulo.FieldByName('ARTICULO').AsString;
        IdA := DM.xArticulo.FieldByName('ID_A').AsInteger;

        // Parte Codigo de Articulo
        Botones := TLabel.Create(SBArticulo);
        Botones.AutoSize := False;
        Botones.Parent := SBArticulo;
        Botones.Width := BotonAncho - 2;
        Botones.Height := 22;
        Botones.Layout := tlCenter;
        Botones.Alignment := taCenter;
        Botones.Font.Height := 16;
        Botones.Font.Style := [fsBold];
        Botones.ShowHint := True;
        Botones.Hint := Titulo;
        Botones.Caption := Articulo;
        Botones.Tag := IdA;
        Botones.OnClick := BotonesClick;
        Botones.Top := tTop;
        Botones.Left := tLeft;
        if ((i mod 2) = 0) then
           Botones.Color := clWhite
        else
           Botones.Color := clSkyBlue;

        if MostrarImagen then
        begin
           Panel := TPanel.Create(SBArticulo);
           Panel.Parent := SBArticulo;
           Panel.Top := tTop + 22;
           Panel.Left := tLeft;
           Panel.Width := BotonAncho - 2;
           Panel.Height := AlturaImagen;
           Panel.Caption := '';
           Panel.BevelOuter := bvNone;
           if ((i mod 2) = 0) then
              Panel.Color := clWhite
           else
              Panel.Color := clSkyBlue;

           Imagen := TImage.Create(Panel);
           Imagen.Parent := Panel;
           Imagen.AutoSize := False;
           Imagen.Top := 0;
           Imagen.Left := 20;
           Imagen.Width := BotonAncho - 40;
           Imagen.Height := AlturaImagen;
           Imagen.OnClick := BotonesClick;
           Imagen.Hint := Titulo;
           Imagen.ShowHint := True;
           Imagen.Visible := True;
           Imagen.Proportional := True;
           Imagen.Transparent := False;
           Imagen.Tag := IdA;

           RefrescarImagenTPV(Imagen, DM.xArticulo.FieldByName('IMAGEN').AsInteger, Trunc(Imagen.Width div 10) * 20, Trunc(Imagen.Height div 10) * 20);
        end;

        // Parte Descripcion de Articulo
        Botones := TLabel.Create(SBArticulo);
        Botones.AutoSize := False;
        Botones.Parent := SBArticulo;
        Botones.Width := BotonAncho - 2;
        Botones.Height := BotonAlto - 22 - AlturaImagen - 2;
        Botones.Layout := tlCenter;
        Botones.Alignment := taCenter;
        Botones.Font.Height := 12;
        Botones.Font.Style := [fsBold];
        Botones.ShowHint := True;
        Botones.WordWrap := True;
        Botones.Hint := Titulo;
        Botones.Caption := Titulo;
        Botones.Tag := IdA;
        Botones.OnClick := BotonesClick;
        Botones.Top := tTop + 22 + AlturaImagen;
        Botones.Left := tLeft;
        if ((i mod 2) = 0) then
           Botones.Color := clWhite
        else
           Botones.Color := clSkyBlue;

        Inc(i);

        tLeft := tLeft + BotonAncho;
        if tLeft = BotonAncho * CuantosEntranAncho then
        begin
           tLeft := 0;
           tTop := tTop + BotonAlto;
           if ((CuantosEntranAncho mod 2) = 0) then
              // Salto uno para que se desplace el color y quede como tablero de ajedrez
              Inc(i);
        end;

        DM.xArticulo.Next;
     end;

     SBArticulo.Visible := True;
  end;
end;

procedure TFMTicketVenta.DBCGFamiliaClick(Sender: TObject);
begin
  DBTFamiliaClick(Sender);
end;

procedure TFMTicketVenta.BEliminarLineaClick(Sender: TObject);
begin
  DM.BajaDetalle;
  EFArticulo.Text := '';
  HabilitaEdicion;
end;

procedure TFMTicketVenta.BInfoStockClick(Sender: TObject);
begin
  AbreStocks(DM.QMDetalle.FieldByName('EMPRESA').AsInteger, DM.QMDetalle.FieldByName('CANAL').AsInteger, DM.QMDetalle.FieldByName('ARTICULO').AsString, DM.QMDetalle.FieldByName('ALMACEN').AsString, Self);
end;

procedure TFMTicketVenta.HabilitaEdicion;
begin
  PNLVentas.Enabled := True;

  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
  // EFArticulo.Text := '';

  BEliminarLinea.Enabled := ((DM.QMCabecera.Active) and (DM.QMDetalle.FieldByName('LINEA').AsInteger <> 0));
  BSubir.Enabled := True;
  BBajar.Enabled := True;
  BIncrementarCantidad.Enabled := ((DM.QMCabecera.Active) and (DM.QMDetalle.FieldByName('LINEA').AsInteger <> 0));
  BReducirCantidad.Enabled := ((DM.QMCabecera.Active) and (DM.QMDetalle.FieldByName('LINEA').AsInteger <> 0));
  BDatosCliente.Enabled := True;
  BCobrar.Enabled := (DM.QMCabecera.Active);
  BEditarLinea.Enabled := ((DM.QMCabecera.Active) and (DM.QMDetalle.FieldByName('LINEA').AsInteger <> 0));
  BMuestraTIckets.Enabled := True;
  BCierraTurno.Enabled := True;
  BNuevoTicket.Enabled := True;
  BBuscaArticulo.Enabled := True;
end;

procedure TFMTicketVenta.InhabilitaEdicion;
begin
  PNLVentas.Enabled := False;
  BEliminarLinea.Enabled := False;
  BSubir.Enabled := False;
  BBajar.Enabled := False;
  BIncrementarCantidad.Enabled := False;
  BReducirCantidad.Enabled := False;
  BDatosCliente.Enabled := False;
  BCobrar.Enabled := False;
  BEditarLinea.Enabled := False;
  BMuestraTIckets.Enabled := False;
  BCierraTurno.Enabled := False;
  BNuevoTicket.Enabled := False;
  BBuscaArticulo.Enabled := False;
end;

procedure TFMTicketVenta.TSSeleccionArticuloShow(Sender: TObject);
begin
  HabilitaEdicion;
end;

procedure TFMTicketVenta.ENIFChange(Sender: TObject);
var
  Tercero : integer;
begin
  Tercero := DMMain.DameTerceroNIF(LimpiaNIF(REntorno.Pais, ENIF.Text));

  ETituloTercero.Text := DameTituloTercero(Tercero);
  ENombreComercialTercero.Text := DameNombreComercialTercero(Tercero);

  if (ETituloTercero.Text <> '') then
  begin
     ETituloTercero.Color := clInfoBk;
     ETituloTercero.ReadOnly := True;
     ENombreComercialTercero.Color := clInfoBk;
     ENombreComercialTercero.ReadOnly := True;
     // BCreaTercero.Enabled := False;
  end
  else
  begin
     ETituloTercero.Color := clWindow;
     ETituloTercero.ReadOnly := False;
     ENombreComercialTercero.Color := clWindow;
     ENombreComercialTercero.ReadOnly := False;
     // BCreaTercero.Enabled := True;
  end;
end;

procedure TFMTicketVenta.FormShow(Sender: TObject);
begin
  // Forzamos a que salga maximizado.
  WindowState := wsNormal;
  Application.ProcessMessages;
  WindowState := wsMaximized;
  Application.ProcessMessages;

  HabilitaEdicion;
end;

procedure TFMTicketVenta.AAsignaClienteExecute(Sender: TObject);
var
  FPregDatos : TFPregNIFFactura;
  Tercero, Cliente : integer;
  TerceroNuevo : boolean;
begin
  TerceroNuevo := False;
  ENIF.Text := LimpiaNIF(REntorno.Pais, ENIF.Text);

  if ((Trim(ETituloTercero.Text) = '') or (LimpiaNIF(REntorno.Pais, ENIF.Text) = '')) then
     ShowMessage(_('Debe informar el NIF y el nombre comercial'))
  else
  begin
     // Obtenemos el tercero
     Tercero := DMMain.DameTerceroNIF(ENIF.Text);

     // Si no existe lo creo
     if (Tercero = 0) then
     begin
        TerceroNuevo := True;
        DM.CreaTercero(ENIF.Text, ETituloTercero.Text, ENombreComercialTercero.Text);

        // Obtenemos el tercero
        Tercero := DMMain.DameTerceroNIF(ENIF.Text);
     end;

     Cliente := DM.DameClienteTercero(Tercero);

     // Si existe un tercero registrado con el NIF, asignamos automaticamente el tercero
     if ((LeeParametro('TPVTERC001', '') = 'S') and (not TerceroNuevo)) then
     begin
        if (Cliente = 0) then
        begin
           DM.AbreQMNif;
           DM.QMNif.Edit;
           DM.QMNIFNOMBRE.AsString := ETituloTercero.Text;
           DM.QMNIFNIF.AsString := ENIF.Text;
           DM.QMNIFDIRECCION.AsString := 'CL /';
           DM.QMNIFLOCALIDAD.AsString := 'DESCONOCIDA';
           DM.QMNIFPROVINCIA.AsString := 'DESCONOCIDA';
           DM.QMNIFC_POSTAL.AsString := '00000';
           DM.QMNif.Post;
           DM.CierraQMNif;

           // Se asigna tercero a GES_CABECERAS_S_FAC_NIF
           DM.AsignaTercero(Tercero, DM.QMCabeceraID_TICKET.AsInteger);
        end
        else
        begin
           EFCliente.Text := IntToStr(Cliente);
        end;

        // BOkCliente.Click;
     end
     else
     begin
        if (Cliente = 0) then
        begin
           // Aqui abrimos la ventana para ingresar o modificar los datos del cliente
           DM.AbreQMNif;
           if DM.DameDatosClientes then
           begin
              FPregDatos := TFPregNIFFactura.Create(Self);
              FPregDatos.Inicializa(DM.DSQMNIF, _('Datos del Cliente'), DM.EstadoDocumento, Tercero, ENIF.Text, ETituloTercero.Text);
              DM.GrabaDatosCliente(FPregDatos.ShowModal);
              FreeAndNil(FPregDatos);
           end;
           DM.CierraQMNif;

           // Se asigna tercero a GES_CABECERAS_S_FAC_NIF
           DM.AsignaTercero(Tercero, DM.QMCabeceraID_TICKET.AsInteger);
        end
        else
        begin
           EFCliente.Text := IntToStr(Cliente);
        end;
     end;

     ECarnetAplicador.Text := DM.DameCarnetAplicador;
  end;
end;

procedure TFMTicketVenta.BAnteriorClick(Sender: TObject);
begin
  DM.SaltoArticulos(-1, EsArticulo);
  if EsArticulo then
  begin
     MuestraArticulos;
  end
  else
     DBTFamiliaClick(Sender);
end;

procedure TFMTicketVenta.BSiguienteClick(Sender: TObject);
begin
  if (SBArticulo.ComponentCount > 0) then
     DM.SaltoArticulos(1, EsArticulo);

  if EsArticulo then
  begin
     MuestraArticulos;
  end
  else
     DBTFamiliaClick(Sender);
end;

procedure TFMTicketVenta.EUnidadesEnter(Sender: TObject);
begin
  EUnidades.BiDiMode := bdRightToLeft;
end;

procedure TFMTicketVenta.EPrecioEnter(Sender: TObject);
begin
  EPrecio.BiDiMode := bdRightToLeft;
end;

procedure TFMTicketVenta.EDescuentoEnter(Sender: TObject);
begin
  EDescuento.BiDiMode := bdRightToLeft;
end;

procedure TFMTicketVenta.BMuestraTIcketsClick(Sender: TObject);
begin
  TabSheesInvisibles;
  TSTickets.TabVisible := True;
end;

procedure TFMTicketVenta.BOkTicketClick(Sender: TObject);
begin
  DM.SeleccionaTicket(DM.xTicketsRIT.AsInteger);
  InicializarFoco;
end;

procedure TFMTicketVenta.BCancelarTicketClick(Sender: TObject);
begin
  InicializarFoco;
end;

procedure TFMTicketVenta.BAnteriorTicketClick(Sender: TObject);
begin
  DM.xTickets.Prior;
  if DBGTickets.CanFocus then
     DBGTickets.SetFocus;
end;

procedure TFMTicketVenta.BSiguienteTicketClick(Sender: TObject);
begin
  DM.xTickets.Next;
  if DBGTickets.CanFocus then
     DBGTickets.SetFocus;
end;

function TFMTicketVenta.DameTituloTicket: string;
begin
  Result := Format('Ticket Venta %d - Sesion %d, Caja %d, Turno %d, Serie "%s"', [DM.QMCabeceraRIT.AsInteger, REntorno.Sesion, REntorno.Caja, REntorno.Turno, REntorno.Serie]);
end;

procedure TFMTicketVenta.TSTicketsShow(Sender: TObject);
begin
  DM.AbrirListaTickets;

  if DBGTickets.CanFocus then
     DBGTickets.SetFocus;

  MuestraTotalesCajaTurno;
end;

procedure TFMTicketVenta.BImprimirTicketClick(Sender: TObject);
begin
  if (DM.xInfoActualizadaESTADO.AsInteger = 5) then
  begin
     DM.ImprimirTicket('', True, False);
     if EImporteFormaPago.CanFocus then
        EImporteFormaPago.SetFocus;
  end;
end;

procedure TFMTicketVenta.BCierraTurnoClick(Sender: TObject);
begin
  TabSheesInvisibles;
  TSCierre.TabVisible := True;
end;

procedure TFMTicketVenta.BCancelCierreClick(Sender: TObject);
begin
  InicializarFoco;
end;

procedure TFMTicketVenta.BOKCierreClick(Sender: TObject);
begin
  { TODO : Aquí debe cerrar el turno }
  //Verificamos que no hayan tickets abiertos
  if (DM.CierraTurno = 1) then
  begin
     ShowMessage(_('Se ha cerrado el turno con éxito'));
     FMTicketVenta.Close;
  end
  else
     ShowMessage(_('No se ha podido cerrar el turno'));
  InicializarFoco;
end;

procedure TFMTicketVenta.EUsuarioCierreChange(Sender: TObject);
begin
  ETituloUsuarioCierre.Text := DameTituloUsuario(StrToIntDef(EUsuarioCierre.Text, 0));
end;

procedure TFMTicketVenta.ESerieCierreChange(Sender: TObject);
begin
  ETituloSerieCierre.Text := DameTituloSerie(ESerieCierre.Text);
end;

procedure TFMTicketVenta.DameDatosTurno;
var
  SaldoInicial, TotalVentasEfectivoTurno, SaldoEntradaSalida : double;
begin
  DM.AbrirDatosCierreTurno;

  LExistenTicketsAbiertos.Visible := (DM.ExistenTicketsAbiertos);

  EUsuarioCierre.Text := IntToStr(REntorno.Usuario);
  ESerieCierre.Text := REntorno.Serie;
  ECajaCierre.Text := IntToStr(REntorno.Usuario);
  ESesionCierre.Text := IntToStr(REntorno.Sesion);
  ETurnoCierre.Text := IntToStr(REntorno.Turno);
  DEApartura.Date := DM.QMTurnoFECHA_INICIO.AsDateTime;

  SaldoInicial := DM.QMTurnoCAMBIO_ENTREGADO.AsFloat;
  ESaldoInicial.Text := FormatFloat(MascaraN, SaldoInicial);

  ETotalVentasTurno.Text := FormatFloat(MascaraN, DM.QMTurnoTOTAL_TURNO.AsFloat);

  TotalVentasEfectivoTurno := DM.DameTotalEnEfectivo;
  EVentasEfectivo.Text := FormatFloat(MascaraN, TotalVentasEfectivoTurno);

  SaldoEntradaSalida := DM.DameSaldoEntradasSalidas;
  ESaldoIngresoEgreso.Text := FormatFloat(MascaraN, SaldoEntradaSalida);

  ETotalEfectivo.Text := FormatFloat(MascaraN, SaldoInicial + TotalVentasEfectivoTurno + SaldoEntradaSalida);

  { TODO : Qué es esto? }
  ERetirtadoTurno.Text := FormatFloat(MascaraN, 0);

  { TODO : Qué es esto? }
  ECambioSiguienteTurno.Text := FormatFloat(MascaraN, 0);
end;

procedure TFMTicketVenta.TSCierreShow(Sender: TObject);
begin
  DameDatosTurno;
  if ECambioSiguienteTurno.CanFocus then
     ECambioSiguienteTurno.SetFocus;
  ECambioSiguienteTurno.SelectAll;

  // Si el pais es Bolivia ocultamos algunos campos del formulario
  if (REntorno.Pais = 'BOL') then
  begin
     LTotalEfectivo.Visible := False;
     ETotalEfectivo.Visible := False;
     DBGFormaPagoCierre.Visible := False;
  end;
end;

procedure TFMTicketVenta.ERetirtadoTurnoEnter(Sender: TObject);
begin
  TLFEdit(Sender).SelectAll;
end;

procedure TFMTicketVenta.ECambioSiguienteTurnoEnter(Sender: TObject);
begin
  TLFEdit(Sender).SelectAll;
end;

procedure TFMTicketVenta.BImprimirArqueoClick(Sender: TObject);
begin
  // DM.ImprimirArqueo;
  AbreData(TDMLstArqueos, DMLstArqueos);
  DMLstArqueos.MostrarListado(REntorno.Serie, REntorno.Sesion, REntorno.Caja, REntorno.Turno, CT_TURNO {2}, 0);
  CierraData(DMLstArqueos);
end;

procedure TFMTicketVenta.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
end;

procedure TFMTicketVenta.BNuevoTicketClick(Sender: TObject);
begin
  /// Crear nuevo Ticket

  // Se logra cerrando el DataSet.
  // Al entrar una nueva línea o modificar el cliente se creará una cabecera nueva.
  DM.QMCabecera.Close;
  InicializarFoco;
  LArticulosNoValidos.Caption := '';
end;

procedure TFMTicketVenta.BCobrarTicketSinImprimirClick(Sender: TObject);
begin
  DM.CierraTicket(False, False, StrToIntDef(EFAgenteCobro.Text, 0), EEmail.Text);
  // InicializarFoco;
  TicketCobrado;
end;

procedure TFMTicketVenta.EImporteRecibidoChange(Sender: TObject);
begin
  CalculaCambio;
end;

procedure TFMTicketVenta.CalculaCambio;
begin
  // EADevolver.Text := FormatFloat('0.00', (StrTofloat(EImporteRecibido.Text)*DMMain.DameFactor('USD', 'BOB',REntorno.FechaTrab))-StrTofloat(EImporteFormaPago.Text));
end;

procedure TFMTicketVenta.CBMonedaClick(Sender: TObject);
begin
  CalculaCambio;
end;

procedure TFMTicketVenta.AFocoPagarExecute(Sender: TObject);
begin
  BCobrar.Click;
end;

procedure TFMTicketVenta.AFocoClienteExecute(Sender: TObject);
begin
  BDatosCliente.Click;
end;

procedure TFMTicketVenta.AFocoArticuloExecute(Sender: TObject);
begin
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
end;

procedure TFMTicketVenta.PNLCabeceraClienteResize(Sender: TObject);
begin
  BCancelarCliente.Left := PNLCabeceraCliente.Width - BCancelarCliente.Width - 6;
end;

procedure TFMTicketVenta.BCreaTerceroClick(Sender: TObject);
begin
  AAsignaCliente.Execute;
end;

procedure TFMTicketVenta.PNLCabeceraLineaResize(Sender: TObject);
begin
  BCancelarLinea.Left := PNLCabeceraLinea.Width - BCancelarLinea.Width - 6;
end;

procedure TFMTicketVenta.PNLCabeceraCobroResize(Sender: TObject);
var
  Ancho : integer;
  Espacio : integer;
  i : integer;
  CantBotones : integer;
begin
  // Tamaño original de los botones
  Ancho := 70;
  Espacio := 10;

  // Averiguo cuantos botones hay en el panel
  CantBotones := 0;
  for i := 0 to PNLCabeceraCobro.ControlCount - 1 do
     if PNLCabeceraCobro.Controls[i] is TFlatButton then
        Inc(CantBotones);

  // Veo si entrarian los botones con el ancho normal
  if ((PNLCabeceraCobro.Width div CantBotones) < Ancho + Espacio) then
  begin
     // Si no entran defino nuevo ancho
     Espacio := 5;
     Ancho := PNLCabeceraCobro.Width div CantBotones;
     Ancho := Ancho - Espacio;
  end;

  // Recorro cada boton y asignamos posicion y tamaño
  i := 0;

  BOKCobro.Width := Ancho;
  BOKCobro.Left := 3;
  Inc(i);

  BImprimirTicket.Width := Ancho;
  BImprimirTicket.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BCobrarTicketSinImprimir.Width := Ancho;
  BCobrarTicketSinImprimir.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BAbrirCaja.Width := Ancho;
  BAbrirCaja.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BImprimeRecibo.Width := Ancho;
  BImprimeRecibo.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BCrearNuevoAlCobrar.Width := Ancho;
  BCrearNuevoAlCobrar.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BFacturar.Width := Ancho;
  BFacturar.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BCancelarCobro.Width := Ancho;
  BCancelarCobro.Left := 3 + ((Ancho + Espacio) * i);

{  BCancelarCobro.Width := Ancho;
  BCancelarCobro.Left := 3 + ((Ancho + Espacio) * i);}
  // Inc(i);

  BFacturar.Width := Ancho;
  BCancelarCobro.Width := Ancho;
  BCrearNuevoAlCobrar.Width := Ancho;

  BCancelarCobro.Left := PNLCabeceraCobro.Width - BCancelarCobro.Width - 6;
  BCrearNuevoAlCobrar.Left := PNLCabeceraCobro.Width - BCancelarCobro.Width - (Ancho + Espacio + 6);
  BFacturar.Left := PNLCabeceraCobro.Width - BCancelarCobro.Width - BCrearNuevoAlCobrar.Width - (Ancho + Espacio + 6);
end;

procedure TFMTicketVenta.PNLCabeceraCierreResize(Sender: TObject);
begin
  BCancelCierre.Left := PNLCabeceraCierre.Width - BCancelCierre.Width - 6;
end;

procedure TFMTicketVenta.PCabeceraTicketResize(Sender: TObject);
var
  Ancho : integer;
  Espacio : integer;
  i : integer;
  CantBotones : integer;
begin
  // Tamaño original de los botones
  Ancho := 70;
  Espacio := 10;

  // Averiguo cuantos botones hay en el panel
  CantBotones := 0;
  for i := 0 to PCabeceraTicket.ControlCount - 1 do
     if PCabeceraTicket.Controls[i] is TFlatButton then
        Inc(CantBotones);

  // Veo si entrarian los botones con el ancho normal
  if ((PCabeceraTicket.Width div CantBotones) < Ancho + Espacio) then
  begin
     // Si no entran defino nuevo ancho
     Espacio := 5;
     Ancho := PCabeceraTicket.Width div CantBotones;
     Ancho := Ancho - Espacio;
  end;

  // Recorro cada boton y asignamos posicion y tamaño
  i := 0;

  BOkTicket.Width := Ancho;
  BOkTicket.Left := 3;
  Inc(i);

  BAnteriorTicket.Width := Ancho;
  BAnteriorTicket.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BSiguienteTicket.Width := Ancho;
  BSiguienteTicket.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BNuevoTicket2.Width := Ancho;
  BNuevoTicket2.Left := 3 + ((Ancho + Espacio) * i);
  Inc(i);

  BAnularTicket.Width := Ancho;
  BAnularTicket.Left := 3 + ((Ancho + Espacio) * i);
  // Inc(i);

  BCancelarTicket.Width := Ancho;

  // Ultimo boton se ajusta a la derecha
  BCancelarTicket.Left := PCabeceraTicket.Width - BCancelarTicket.Width - 6;
end;

procedure TFMTicketVenta.DBGTicketsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DM.xTicketsESTADO.AsInteger = 5) then
           ColorNormal(Canvas)
        else
        if (DM.xTicketsESTADO.AsInteger = 2) then
           ColorBloqueado(Canvas)
        else
           ColorResaltado6(Canvas);
     end;
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMTicketVenta.BOKIngresoEgresoClick(Sender: TObject);
begin
  InicializarFoco;
end;

procedure TFMTicketVenta.LimpiaCampos;
begin
  CBTipoMov.ItemIndex := -1;
  CBTipoMov.Text := '';
  EImporte.Text := '';
  EDescripcion.Text := '';
  MNota.Text := '';
end;

procedure TFMTicketVenta.BCancelarIngresoEgresoClick(Sender: TObject);
begin
  InicializarFoco;
end;

procedure TFMTicketVenta.BIngresosEgresosClick(Sender: TObject);
begin
  TabSheesInvisibles;
  DM.AbrirDatosIngresosEgresos;
  TSIngresosEgresos.TabVisible := True;
  if CBTipoMov.CanFocus then
     CBTipoMov.SetFocus;
end;

procedure TFMTicketVenta.TSIngresosEgresosExit(Sender: TObject);
begin
  DM.QMIngresosEgresos.Close;
end;

procedure TFMTicketVenta.TSIngresosEgresosShow(Sender: TObject);
begin
  EImporte.Text := FormatFloat(',0.00', 0);
end;

procedure TFMTicketVenta.BImprimeReciboClick(Sender: TObject);
begin
  DM.CierraTicket(True, True, StrToIntDef(EFAgenteCobro.Text, 0), EEmail.Text);
  InicializarFoco;
end;

procedure TFMTicketVenta.BNuevoIngresoRetiradaClick(Sender: TObject);
begin
  DM.IngresoEgreso(CBTipoMov.ItemIndex, EDescripcion.Text, MNota.Text, StrToFloatDef(EImporte.Text, 0));
  LimpiaCampos;
end;

procedure TFMTicketVenta.BEliminarIngresoRetiradaClick(Sender: TObject);
var
  TipoMovimiento : string;
begin
  if (DM.QMIngresosEgresosTIPO_MOVIMIENTO.AsString = 'ENT') then
     TipoMovimiento := _('Ingreso')
  else
     TipoMovimiento := _('Egreso');

  if (ConfirmaMensaje(Format(_('¿Desea eliminar el movimiento: %s %s'), [TipoMovimiento, DM.QMIngresosEgresosDESCRIPCION.AsString]))) then
     DM.QMIngresosEgresos.Delete;
end;

procedure TFMTicketVenta.PnlIngCabeceraResize(Sender: TObject);
begin
  BCancelarIngresoEgreso.Left := PnlIngCabecera.Width - BCancelarIngresoEgreso.Width - 6;
end;

procedure TFMTicketVenta.BImprimirIngEgrClick(Sender: TObject);
begin
  DM.MostrarComprobanteIngresoEgreso(0);
end;

procedure TFMTicketVenta.LocalizaTicket(rit: integer; Ejercicio: integer = 0; Canal: integer = 0; Serie: string = '');
begin
  DM.SeleccionaTicket(rit, Ejercicio, Canal, Serie);
  InicializarFoco;
end;

procedure TFMTicketVenta.BRegistroFitosanitarioClick(Sender: TObject);
begin
  if (Trim(ERegFitoNIF.Text) = '') then
     raise Exception.Create(_('Debe asignar NIF para Registro Fitosanitario.'));

  // Grabamos los posibles cambios en campos de la línea
  DM.CambiaLinea(EFArticuloLinea.Text, ETituloArticuloLinea.Text, StrToFloat(EUnidades.Text), StrToFloat(EPrecio.Text), StrToFloat(EDescuento.Text), StrToIntDef(EFTipoIva.Text, 0));

  // Creamos tercero y una cabecera en GES_CABECERAS_S_FAC_NIF si hace falta
  DM.AsignaTerceroFitosanitario(ERegFitoNombre.Text, ERegFitoNIF.Text, ERegFitoDireccion.Text, ERegFitoCP.Text, ERegFitoLocalidad.Text, ERegCarnetAplicador.Text, ERegTelefono.Text, StrToIntDef(EFBuscaNIF.Text, 0));

  FMain.EjecutaAccion(FMain.ARegistroFitosanitario);
  FMRegistroFitosanitario.AsignaDocumento('TIC', DM.QMDetalle.FieldByName('ID_TICKET_DETALLE').AsInteger);
end;

procedure TFMTicketVenta.BAbrirCajaClick(Sender: TObject);
begin
  // Aqui debería enviar algun comando a la impresora.
  // Probaremos enviar una página en blanco.

end;

procedure TFMTicketVenta.BBuscaArticuloClick(Sender: TObject);
begin
  //EFArticulo.EjecutarBusqueda;
  EFArticulo.SalirSiVacio := False;
  EFArticulo.SalirSiNoExiste := False;
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
  if BBuscaArticulo.CanFocus then
     BBuscaArticulo.SetFocus;
  EFArticulo.SalirSiVacio := True;
  EFArticulo.SalirSiNoExiste := True;
  if EFArticulo.CanFocus then
     EFArticulo.SetFocus;
end;

procedure TFMTicketVenta.EADevolverChange(Sender: TObject);
begin
  if (DM.xInfoActualizadaA_DEVOLVER.AsFloat >= 0) then
  begin
     ColorResaltado4(EADevolver);
     LADevolver.Caption := _('A Devolver');
  end
  else
  begin
     ColorError(EADevolver);
     LADevolver.Caption := _('A Pagar');
  end;
end;

procedure TFMTicketVenta.BAnularTicketClick(Sender: TObject);
var
  Motivo : string;
begin
  // Estado 2 al ticket seleccionado
  Motivo := InputBox(_('Motivo anulación'), _('Indique el motivo de la anulación del ticket'), '');

  if (Motivo > '') then
     DM.AnulaTicket(DM.xTicketsID_TICKET.AsInteger, Motivo);
end;

procedure TFMTicketVenta.RellenaCamposRegistro(Tercero, Cliente: integer);
begin
  if (Cliente > 0) then
  begin
     // Del Tercero obtenemos el nombre, nif y el carnet aplicador
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT NOMBRE_R_SOCIAL, NIF, CARNET_APLICADOR, TELEFONO01 ');
           SQL.Add(' FROM SYS_TERCEROS ');
           SQL.Add(' WHERE TERCERO = ?TERCERO ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           ExecQuery;
           ERegFitoNombre.Text := FieldByName['NOMBRE_R_SOCIAL'].AsString;
           ERegFitoNIF.Text := FieldByName['NIF'].AsString;
           ERegCarnetAplicador.Text := FieldByName['CARNET_APLICADOR'].AsString;
           ERegTelefono.Text := FieldByName['TELEFONO01'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Obtenemos datos de la direccion
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SD.DIR_NOMBRE, SL.TITULO AS LOCALIDAD, SL.CODIGO_POSTAL ');
           SQL.Add(' FROM SYS_TERCEROS_DIRECCIONES SD ');
           SQL.Add(' JOIN SYS_LOCALIDADES SL ON (SD.ID_LOCAL = SL.ID_LOCAL) ');
           SQL.Add(' WHERE TERCERO = ?TERCERO ');
           SQL.Add(' AND SD.DIR_DEFECTO = 1 ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           ExecQuery;
           ERegFitoDireccion.Text := FieldByName['DIR_NOMBRE'].AsString;
           ERegFitoCP.Text := FieldByName['CODIGO_POSTAL'].AsString;
           ERegFitoLocalidad.Text := FieldByName['LOCALIDAD'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     if (DM.ExisteCabeceraNIF(DM.QMCabeceraID_TICKET.AsInteger)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT T.NOMBRE_R_SOCIAL, T.NIF, N.DIRECCION, N.C_POSTAL, T.TELEFONO01, T.CARNET_APLICADOR, L.TITULO AS LOCALIDAD ');
              SQL.Add(' FROM GES_CABECERAS_S_FAC_NIF N ');
              SQL.Add(' JOIN SYS_TERCEROS T ON N.TERCERO = T.TERCERO ');
              SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON D.TERCERO = T.TERCERO AND D.DIR_DEFECTO = 1 ');
              SQL.Add(' JOIN SYS_LOCALIDADES L ON L.LOCALIDAD = D.DIR_LOCALIDAD ');
              SQL.Add(' WHERE ');
              SQL.Add(' N.TIPO = :TIPO AND ');
              SQL.Add(' N.ID_S = :ID_TICKET ');
              Params.ByName['TIPO'].AsString := 'TIC';
              Params.ByName['ID_TICKET'].AsInteger := DM.QMCabeceraID_TICKET.AsInteger;
              ExecQuery;
              ERegFitoNombre.Text := FieldByName['NOMBRE_R_SOCIAL'].AsString;
              ERegFitoNIF.Text := FieldByName['NIF'].AsString;
              ERegCarnetAplicador.Text := FieldByName['CARNET_APLICADOR'].AsString;
              ERegFitoDireccion.Text := FieldByName['DIRECCION'].AsString;
              ERegFitoCP.Text := FieldByName['C_POSTAL'].AsString;
              ERegFitoLocalidad.Text := FieldByName['LOCALIDAD'].AsString;
              ERegTelefono.Text := FieldByName['TELEFONO01'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
     begin
        ERegFitoNombre.Text := '';
        ERegFitoNIF.Text := '';
        ERegCarnetAplicador.Text := '';
        ERegFitoDireccion.Text := '';
        ERegFitoCP.Text := '';
        ERegFitoLocalidad.Text := '';
        ERegTelefono.Text := '';
     end;
  end;
end;

procedure TFMTicketVenta.BBuscaTerceroClick(Sender: TObject);
begin
  EFBuscaNIF.Text := '';
  EFBuscaNIF.CondicionBusqueda := ' TERCERO > 0 ';
  EFBuscaNIF.SalirSiVacio := False;
  EFBuscaNIF.SalirSiNoExiste := False;
  EFBuscaNIF.Visible := True;
  if EFBuscaNIF.CanFocus then
     EFBuscaNIF.SetFocus;
  if ERegFitoNombre.CanFocus then
     ERegFitoNombre.SetFocus;
  EFBuscaNIF.SalirSiVacio := True;
  EFBuscaNIF.SalirSiNoExiste := True;
  EFBuscaNIF.Visible := False;
end;

procedure TFMTicketVenta.EFBuscaNIFChange(Sender: TObject);
begin
  RellenaCamposRegistro(StrToIntDef(EFBuscaNIF.Text, 0), 1 {Para que asuma que no es un tercero vario});
end;

procedure TFMTicketVenta.EFAgenteChange(Sender: TObject);
begin
  EAgente.Text := DameTituloAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFMTicketVenta.EFAgenteBusqueda(Sender: TObject);
begin
  EFAgente.SelectSQL.Clear;
  EFAgente.SelectSQL.Add(' SELECT AGENTE_USUARIO, TITULO_AGENTE_USUARIO ');
  EFAgente.SelectSQL.Add(' FROM VER_AGENTES_USUARIOS_CAJAS_EF ');

  EFAgente.CondicionBusqueda := ' EMPRESA = ' + IntToStr(DM.QMCabeceraEMPRESA.AsInteger) +
     ' AND CAJA = ' + IntToStr(DM.QMCabeceraCAJA.AsInteger) +
     ' AND ACTIVO = 1 ';
end;

procedure TFMTicketVenta.DameMargen;
var
  Precio, Descuento, Unidades, Coste : double;
begin
  // Parametro TPVPRCO001 - Mostrar el precio de coste y el margen de beneficio al editar una linea en TPV
  if param_TPVPRCO001 then
  begin
     // Obtengo datos para calculo
     Precio := StrToFloatDef(EPrecio.Text, 0);
     Unidades := StrToFloatDef(EUnidades.Text, 0);
     Descuento := StrToFloatDef(EDescuento.Text, 0);
     Coste := DM.QMDetalle.FieldByName('P_COSTE').AsFloat;

     // Si es IVA incluido quito el IVA para obtener Base imponible
     if (DM.QMDetalle.FieldByName('IVA_INCLUIDO').AsInteger = 1) then
        Precio := Precio / (1 + ((DM.QMDetalle.FieldByName('P_IVA').AsFloat) / 100));

     // Aplico descuento
     Precio := Precio - (Precio * Descuento) / 100;

     // Calculo Margen y Margen Bruto
     EMargen.Text := FormatFloat(',0.00', (DMMain.DameMargenUtilidad(Precio, Coste)));
     EMargenBruto.Text := FormatFloat(DM.LocalMascaraL, (Precio - Coste) * Unidades);
  end;
end;

procedure TFMTicketVenta.EPrecioCosteChange(Sender: TObject);
begin
  DameMargen;
end;

procedure TFMTicketVenta.EDescuentoChange(Sender: TObject);
begin
  DameMargen;
end;

procedure TFMTicketVenta.EPrecioChange(Sender: TObject);
begin
  DameMargen;
end;

procedure TFMTicketVenta.EUnidadesChange(Sender: TObject);
begin
  DameMargen;
end;

procedure TFMTicketVenta.ACobrarExecute(Sender: TObject);
begin
  if BCobrar.Enabled then
     BCobrarClick(Sender);
end;

procedure TFMTicketVenta.ADatosClienteExecute(Sender: TObject);
begin
  if BDatosCliente.Enabled then
     BDatosClienteClick(Sender);
end;

procedure TFMTicketVenta.AEditarLineaExecute(Sender: TObject);
begin
  if BEditarLinea.Enabled then
     BEditarLineaClick(Sender);
end;

procedure TFMTicketVenta.AMuestraTicketsExecute(Sender: TObject);
begin
  if BMuestraTickets.Enabled then
     BMuestraTicketsClick(Sender);
end;

procedure TFMTicketVenta.AIngresoEgresoExecute(Sender: TObject);
begin
  if BIngresosEgresos.Enabled then
     BIngresosEgresosClick(Sender);
end;

procedure TFMTicketVenta.ACierraTurnoExecute(Sender: TObject);
begin
  if BCierraTurno.Enabled then
     BCierraTurnoClick(Sender);
end;

procedure TFMTicketVenta.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // Aqui vemos que hacer con ciertas teclas

  // Tecla [Escape]
  if (Key = VK_ESCAPE) then
  begin
     if (PCMain.ActivePage = TSCliente) then
     begin
        BCancelarClienteClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSLinea) then
     begin
        BCancelarLineaClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSCobro) then
     begin
        BCancelarCobroClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSTickets) then
     begin
        BCancelarTicketClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSIngresosEgresos) then
     begin
        BCancelarIngresoEgresoClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSCierre) then
     begin
        BCancelCierreClick(Sender);
     end;
  end;

  // Tecla [F2]
  if (Key = VK_F2) then
  begin
     if (PCMain.ActivePage = TSCliente) then
     begin
        BOKClienteClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSLinea) then
     begin
        BOKLineaClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSCobro) then
     begin
        if BOkCobro.Enabled then
           BOKCobroClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSTickets) then
     begin
        BOKTicketClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSIngresosEgresos) then
     begin
        BOKIngresoEgresoClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSCierre) then
     begin
        BOKCierreClick(Sender);
     end;
  end;

  // Tecla [Re Pág]
  if (Key = VK_PRIOR) then
  begin
     if (PCMain.ActivePage = TSSeleccionArticulo) then
     begin
        if (ssShift in Shift) then
        begin
           DM.SubirFamilia;
           DBTFamiliaClick(Sender);
        end
        else
           BAnteriorClick(Sender);
     end;
  end;

  // Tecla [Av Pág]
  if (Key = VK_NEXT) then
  begin
     if (PCMain.ActivePage = TSSeleccionArticulo) then
     begin
        if (ssShift in Shift) then
        begin
           DM.BajarFamilia;
           DBTFamiliaClick(Sender);
        end
        else
           BSiguienteClick(Sender);
     end;
  end;

  // Tecla [Supr]
  if ((Key = VK_DELETE) and not (ssCtrl in Shift)) then
  begin
     if (PNLVentas.Enabled) then
     begin
        BEliminarLineaClick(Sender);
     end;
  end;

  // Tecla [Ctrl +]
  if (((Key = 187) or (Key = VK_ADD)) and (ssCtrl in Shift)) then
  begin
     if ((PNLVentas.Enabled) or
        (PCMain.ActivePage = TSTickets) or
        ((PCMain.ActivePage = TSCobro) and (BCrearNuevoAlCobrar.Enabled))) then
     begin
        BNuevoTicketClick(Sender);
     end
     else
     if (PCMain.ActivePage = TSIngresosEgresos) then
     begin
        BNuevoIngresoRetiradaClick(Sender);
     end;
  end;

  // Tecla [Ctrl S]
  if ((Key = 83) and (ssCtrl in Shift)) then
  begin
     if (PCMain.ActivePage = TSLinea) then
     begin
        BInfoStockClick(Sender);
     end;
  end;

  // Tecla [Ctrl A]
  if ((Key = 65) and (ssCtrl in Shift)) then
  begin
     if ((PCMain.ActivePage = TSCobro) and (BAbrirCaja.Enabled)) then
     begin
        BAbrirCajaClick(Sender);
     end;
  end;

  // Tecla [Ctrl I]
  if ((Key = 73) and (ssCtrl in Shift)) then
  begin
     if ((PCMain.ActivePage = TSCobro) and (DM.xInfoActualizadaESTADO.AsInteger = 5)) then
     begin
        BImprimirTicketClick(Sender);
     end;
  end;

  // Tecla [Ctrl O]
  if ((Key = 79) and (ssCtrl in Shift)) then
  begin
     if ((PCMain.ActivePage = TSCobro) and (BCobrarTicketSinImprimir.Enabled)) then
     begin
        BCobrarTicketSinImprimirClick(Sender);
     end;
  end;

  // Tecla [Ctrl F]
  if ((Key = 70) and (ssCtrl in Shift)) then
  begin
     if ((PCMain.ActivePage = TSCobro) and (BOkFormaPago.Enabled)) then
     begin
        BOkFormaPagoClick(Sender);
     end;
  end;
end;

procedure TFMTicketVenta.DBGTicketsKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  // Tecla [Return]
  if (Key = VK_RETURN) then
  begin
     BOKTicketClick(Sender);
  end;

  // Tecla [Supr]
  if (Key = VK_DELETE) then
  begin
     BAnularTicketClick(Sender);
  end;
end;

procedure TFMTicketVenta.PNLDetalleClienteResize(Sender: TObject);
begin
  BCreaTercero.Left := PNLDetalleCliente.Width - 94;
end;

procedure TFMTicketVenta.BFacturarClick(Sender: TObject);
var
  id_s : integer;
begin
  // Traspasar a factura
  DM.CierraTicket(False, False, StrToIntDef(EFAgenteCobro.Text, 0), EEmail.Text);

  FMain.EjecutaAccion(FMain.AFacturarTickets, '');
  id_s := FMFacturarTickets.FacturarUnTicket(DM.QMCabeceraID_TICKET.AsInteger);

  FMain.TraspasoDeDocumentosSalida(id_s);

  // InicializarFoco;
  TicketCobrado;
end;

procedure TFMTicketVenta.EFTipoIvaChange(Sender: TObject);
begin
  ETipoIva.Text := Format('%.2f', [DMMain.DamePorcentajeIva(REntorno.Pais, StrToIntDef(EFTipoIva.Text, 0))]);
end;

procedure TFMTicketVenta.BotonesCajaClick(Sender: TObject);
begin
  REntorno.Caja := (Sender as TLabel).Tag;
  PNLSeleccionCaja.Visible := False;
  PNLVentas.Visible := True;
  PNLSeleccion.Enabled := True;

  DM.CheckSesionTurno;

  Caption := DameTituloTicket;
end;

procedure TFMTicketVenta.EFAgenteCobroChange(Sender: TObject);
begin
  EAgenteCobro.Text := DameTituloAgente(StrToIntDef(EFAgenteCobro.Text, 0));
end;

procedure TFMTicketVenta.MuestraTotalesCajaTurno;
var
  CantidadTickets, Liquido, Promedio : double;
begin
  DM.DameTotalesCajaTurno(CantidadTickets, Liquido, Promedio);
  ECantidadTickets.Text := FormatFloat('0', CantidadTickets);
  ETotalLiquido.Text := FormatFloat('0.00', Liquido);
  EPromedio.Text := FormatFloat('0.00', Promedio);
end;

procedure TFMTicketVenta.BEnviaEmailClick(Sender: TObject);
begin
  if (DM.xInfoActualizadaESTADO.AsInteger = 5) then
  begin
     if (EEmail.Text > '') then
        DM.ImprimirTicket(EEmail.Text, True, False)
     else
        ShowMessage(_('El ticket no tiene email asociado'));
  end;
end;

procedure TFMTicketVenta.EstadoBotonesCobro(Habilitar: boolean);
begin
  if Habilitar then
  begin
     // Si es un cliente no permito cobrar. Solo se podran hacer facturas
     if (Param_TPVTICC005 and (DM.QMCabeceraCLIENTE.AsInteger > 0)) then
     begin
        BOkCobro.Enabled := False;
        BCobrarTicketSinImprimir.Enabled := False;
     end
     else
     begin
        BOkCobro.Enabled := True;
        BCobrarTicketSinImprimir.Enabled := True;
     end;

     BFacturar.Enabled := True;
     // Si existe una forma de pago activado Remesar
     if Param_TPVTICC006 then
        BFacturar.Enabled := DM.ExisteFormaPagoRemesable;
  end
  else
  begin
     BOkCobro.Enabled := Habilitar;
     BCobrarTicketSinImprimir.Enabled := Habilitar;
     BFacturar.Enabled := Habilitar;
  end;

  BImprimirTicket.Enabled := Habilitar;
  BAbrirCaja.Enabled := Habilitar;
  BImprimeRecibo.Enabled := Habilitar;
  BCrearNuevoAlCobrar.Enabled := Habilitar;
  BOkFormaPago.Enabled := Habilitar;
  BEnviaEmail.Enabled := Habilitar;
end;

procedure TFMTicketVenta.BSafeMoneyClick(Sender: TObject);
begin
  // Cobrar mediante cajon Safemoney
  DMSafemoney.Cobrar(StrToFloat(EImporteFormaPago.Text));
  EstadoBotonesCobro(False);
  tmrSafemoney.Enabled := True;
end;

procedure TFMTicketVenta.tmrSafemoneyTimer(Sender: TObject);
var
  Seguir : boolean;
begin
  Seguir := True;
  try
     tmrSafemoney.Enabled := False;
     DMSafemoney.Actualizar;

     if DMSafemoney.OperacionTerminada then
     begin
        Seguir := False;
        EstadoBotonesCobro(True);
        if (DMSafemoney.ErrorDeCobro = '') then
           BOkFormaPago.Click;
     end;
  finally
     tmrSafemoney.Enabled := Seguir;
  end;
end;

procedure TFMTicketVenta.DBCG1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
var
  Stock : double;
begin
  Stock := DM.QMDetalle.FieldByName('STOCK').AsFloat;

  with DBCtrlGrid do
  begin
     if (Index = PanelIndex) then
     begin
        if (Stock < 0) then
        begin
           // ColorFocused(Canvas);
           ColorError(PNLLineaBottom);
           ColorError(PNLLineaTop);
        end
        else
        begin
           // ColorFocused(Canvas);
           ColorFocused(PNLLineaBottom);
           ColorFocused(PNLLineaTop);
        end;
     end
     else
     begin
        if (Stock < 0) then
        begin
           // ColorBloqueado(Canvas);
           ColorBloqueado(PNLLineaBottom);
           ColorBloqueado(PNLLineaTop);
        end
        else
        begin
           // ColorNormal(Canvas);
           ColorNormal(PNLLineaBottom);
           ColorNormal(PNLLineaTop);
           PNLLineaBottom.Color := clBtnFace;
           PNLLineaTop.Color := clWindow;
        end;
     end;
  end;
end;

procedure TFMTicketVenta.ECategoriaChange(Sender: TObject);
begin
  ETituloCategoria.Text := DameTituloCategoria(ECategoria.Text);
end;

procedure TFMTicketVenta.CBImagenesClick(Sender: TObject);
begin
  if SBArticulo.Visible then
     MuestraArticulos
  else
     DBTFamiliaClick(Sender);
end;

procedure TFMTicketVenta.BAlbaranarClick(Sender: TObject);
begin
  // Verificamos que no este cobrado
  {
  if (DM.xTicketFormaPago.RecordCount > 0) then
     raise Exception.Create(_('Para generar Albaran el ticket no debe estar cobrado'));
  }
  // Verificamos que tenga asignado un cliente
  if (DM.QMCabeceraCLIENTE.AsInteger < 1) then
     raise Exception.Create(_('Debe seleccionar un cliente'));

  // Imprime Ticket
  DM.ImprimirTicket('', True, False);

  // Genera Albaran de ticket
  DM.TicketAAlbaran;

  // Cerramos ventana de cobros
  TicketCobrado;
  DM.QMCabecera.Close;
  BCrearNuevoAlCobrar.Enabled := True;
  BNuevoTicket.Enabled := True;
  BMuestraTIckets.Enabled := True;
end;

procedure TFMTicketVenta.BSonidoClick(Sender: TObject);
begin
  if (FileExists(REntorno.RutaEXE + 'Sonidos\TPV-Cobros.wav')) then
     sndPlaySound(PChar(REntorno.RutaEXE + 'Sonidos\TPV-Cobros.wav'), SND_ASYNC);
end;

end.
