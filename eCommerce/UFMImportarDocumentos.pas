unit UFMImportarDocumentos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ActnList, ULFActionList, rxPlacemnt, ULFFormStorage,
  ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, Menus, UTeclas,
  UControlEdit, StdCtrls, Mask, rxToolEdit, ULFLabel, UEditPanel, ULFMemo,
  Grids, ULFEdit, ULFDateEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ComObj, HYFIBQuery, UFPEditSinNavegador,
  ULFPageControl;

type
  TFMImportarDocumentos = class(TFPEditSinNavegador)
     PNLDirectorioImportar: TLFPanel;
     LDirectorioImportar: TLFLabel;
     DSDirectorioImportar: TDirectoryEdit;
     PNLArchivos: TLFPanel;
     PNLDatosImportacion: TLFPanel;
     LBArchivosAImportar: TListBox;
     LElijaArchivos: TLFLabel;
     ARefrescarDatos: TAction;
     AImportarArchivosPedido: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PNLDatosCliente: TLFPanel;
     LCliente: TLFLabel;
     LFechaPedido: TLFLabel;
     EFCliente: TLFEditFind2000;
     DEFechaPedido: TLFDateEdit;
     ETituloCliente: TLFEdit;
     SGDatosAImportar: TStringGrid;
     PNLTotalImportacion: TLFPanel;
     LTotalPedido: TLFLabel;
     ENotas: TLFEdit;
     AimportarArchivosOferta: TAction;
     AImportarArchivosAlbaran: TAction;
     AImportarArchivosFactura: TAction;
     PNLImportacion: TLFPanel;
     ToolButton1: TToolButton;
     TBRefrescarDatos: TToolButton;
     PCTipoImportacion: TLFPageControl;
     TSImportacionExcel: TTabSheet;
     TSImportacionPresident: TTabSheet;
     PNLImportacionPresident: TLFPanel;
     PNLAccionPresident: TLFPanel;
     MFichero: TLFMemo;
     LFichero: TLFLabel;
     EFichero: TLFEdit;
     BImportarComprasPresident: TButton;
     BImportarVentasPresident: TButton;
     AImportarComprasPresident: TAction;
     AImportarVentasPresident: TAction;
     EFSerie: TLFEditFind2000;
     EFSerieAbono: TLFEditFind2000;
     EFProveedor: TLFEditFind2000;
     LSerie: TLFLabel;
     LSerieAbono: TLFLabel;
     LProveedor: TLFLabel;
     ESerie: TLFEdit;
     ESerieAbono: TLFEdit;
     EProveedor: TLFEdit;
     TSImportacionSellforge: TTabSheet;
     PNLDatosPedido: TLFPanel;
     LClienteSellforge: TLFLabel;
     LFechaPedidoSellforge: TLFLabel;
     EFClienteSellforge: TLFEditFind2000;
     DEFechaPedidoSellforge: TLFDateEdit;
     ETituloClienteSellforge: TLFEdit;
     ENotasPedidoSellforge: TLFEdit;
     LNroPedidoSellforge: TLFLabel;
     ENroPedidoSellforge: TLFEdit;
     LAgenteSellforge: TLFLabel;
     EFAgenteSellforge: TLFEditFind2000;
     ETituloAgenteSellforge: TLFEdit;
     LNotasSellforge: TLFLabel;
     SGDatosImportarSellforge: TStringGrid;
     MFicheroSellforge: TLFMemo;
     PNLDatosDetalleSellforge: TPanel;
     LNIFCliente: TLFLabel;
     ASellforgeImportarPedido: TAction;
     EFicheroPedidoSellforge: TLFEdit;
     LFicheroPedidoSellforge: TLFLabel;
     BSellforgeImportarPedido: TButton;
     PCImportacionSellforge: TLFPageControl;
     TSSellforgeImportar: TTabSheet;
     TSSellforgeConfiguracion: TTabSheet;
     PNLConfiguracion: TLFPanel;
     LHost: TLFLabel;
     LPort: TLFLabel;
     LUser: TLFLabel;
     LPassword: TLFLabel;
     LRutaFTP: TLFLabel;
     EHost: TLFEdit;
     EPort: TLFEdit;
     EUser: TLFEdit;
     EPassword: TLFEdit;
     ERutaFTP: TLFEdit;
     BGuardarConfiguracionSellforge: TButton;
     EPortesSellforge: TLFEdit;
     LPortesSellforge: TLFLabel;
     TBSep1: TToolButton;
     ASellforgeDescargarFTP: TAction;
     BSellforgeVerFichero: TButton;
     LPedidoImportado: TLFLabel;
     pmLBArchivosAImportar: TPopupMenu;
     MIBorrarArchivo: TMenuItem;
     TSImportacionAnverCompras: TTabSheet;
     TSImportacionAnverVentas: TTabSheet;
     PNLImportacionAnverCompras: TLFPanel;
     PNLImportacionAnverVentas: TLFPanel;
     PNLImportacionAnverComprasCab: TLFPanel;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     EFicheroComprasAnver: TLFEdit;
     BImportarComprasAnver: TButton;
     EFSerieComprasAnver: TLFEditFind2000;
     ESerieComprasAnver: TLFEdit;
     LFPanel1: TLFPanel;
     LFLabel3: TLFLabel;
     LFLabel4: TLFLabel;
     EFicheroVentasAnver: TLFEdit;
     BImportarVentasAnver: TButton;
     EFSerieVentasAnver: TLFEditFind2000;
     ESerieVentasAnver: TLFEdit;
     MFicheroCompraAnver: TLFMemo;
     MFicheroVentaAnver: TLFMemo;
     REFicheroVentaAnver: TRichEdit;
     REFicheroCompraAnver: TRichEdit;
     TSNTV: TTabSheet;
     Panel1: TPanel;
     SGNTV: TStringGrid;
     MFicheroNTV: TLFMemo;
     PNLNTVCabecera: TLFPanel;
     LClienteNTV: TLFLabel;
     LFechaNTV: TLFLabel;
     LNroPedidoNTV: TLFLabel;
     LAgenteNTV: TLFLabel;
     LNotasNTV: TLFLabel;
     LNIFClienteNTV: TLFLabel;
     LFicheroNTV: TLFLabel;
     LPortesNTV: TLFLabel;
     LPedidoImportadoNTV: TLFLabel;
     EFClienteNTV: TLFEditFind2000;
     DEFechaPedidoNTV: TLFDateEdit;
     ETituloClienteNTV: TLFEdit;
     ENotasPedidoNTV: TLFEdit;
     ENroPedidoNTV: TLFEdit;
     EFAgenteNTV: TLFEditFind2000;
     ETituloAgenteNTV: TLFEdit;
     EFicheroPedidoNTV: TLFEdit;
     BImportarPedidoNTV: TButton;
     EPortesNTV: TLFEdit;
     BVerFicheroNTV: TButton;
     LDtoCialNTV: TLFLabel;
     EDtoCialNTV: TLFEdit;
     EDtoPPNTV: TLFEdit;
     LDtoPPNTV: TLFLabel;
     BSellforgeDescargarFTP: TButton;
     LAgenteNTVImportacion: TLFLabel;
     TSSellforgeExportacion: TTabSheet;
     BSellforgeExpClientes: TButton;
     BSellforgeExpDirecciones: TButton;
     BSellforgeExpArticulos: TButton;
     BSellforgeExpFamilias: TButton;
     LSellforgeExpAlmacen: TLFLabel;
     EFSellforgeExpAlmacen: TLFEditFind2000;
     BSellforgeExpTodo: TButton;
     PCImportacionNTV: TLFPageControl;
     TSNTVImportar: TTabSheet;
     TSNTVExportacion: TTabSheet;
     LNTVExpAlmacen: TLFLabel;
     BNTVExpClientes: TButton;
     BNTVExpDirecciones: TButton;
     BNTVExpArticulos: TButton;
     BNTVExpFamilias: TButton;
     EFNTVExpAlmacen: TLFEditFind2000;
     BNTVExpExportarTodo: TButton;
     TSNTVConfiguracion: TTabSheet;
     BGuardarConfiguracionNTV: TButton;
     LNTVRutaExp: TLFLabel;
     DENTVRutaExp: TDirectoryEdit;
     BNTVExpAgentes: TButton;
     BNTVExpFormaPago: TButton;
     BNTVExpZonas: TButton;
     BNTVExpPortes: TButton;
     TSLabex: TTabSheet;
     SGLabex: TStringGrid;
     PNLLabex: TLFPanel;
     LFicheroLabex: TLFLabel;
     LSerieLabex: TLFLabel;
     EFicheroLabex: TLFEdit;
     BImportarLabex: TButton;
     EFSerieVentasLabex: TLFEditFind2000;
     ESerieVentasLabex: TLFEdit;
     LLineasIgnorarLabex: TLFLabel;
     ELineasIgnorarLabex: TLFEdit;
     PBProgreso: TProgressBar;
     LSerieAbonoLabex: TLFLabel;
     EFSerieAbonoLabex: TLFEditFind2000;
     ESerieAbonoLabex: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARefrescarDatosExecute(Sender: TObject);
     procedure DSDirectorioImportarChange(Sender: TObject);
     procedure AImportarArchivosPedidoExecute(Sender: TObject);
     procedure LBArchivosAImportarDblClick(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure SGDatosAImportarDblClick(Sender: TObject);
     procedure SGDatosAImportarSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
     procedure SGDatosAImportarDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure AimportarArchivosOfertaExecute(Sender: TObject);
     procedure AImportarArchivosAlbaranExecute(Sender: TObject);
     procedure AImportarArchivosFacturaExecute(Sender: TObject);
     procedure AImportarComprasPresidentExecute(Sender: TObject);
     procedure AImportarVentasPresidentExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFSerieAbonoChange(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure PNLDatosDetalleSellforgeResize(Sender: TObject);
     procedure EFClienteSellforgeChange(Sender: TObject);
     procedure EFAgenteSellforgeChange(Sender: TObject);
     procedure ETituloClienteSellforgeChange(Sender: TObject);
     procedure ETituloAgenteSellforgeChange(Sender: TObject);
     procedure SGDatosImportarSellforgeDblClick(Sender: TObject);
     procedure SGDatosImportarSellforgeDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure ASellforgeImportarPedidoExecute(Sender: TObject);
     procedure BGuardarConfiguracionSellforgeClick(Sender: TObject);
     procedure ASellforgeDescargarFTPExecute(Sender: TObject);
     procedure BSellforgeVerFicheroClick(Sender: TObject);
     procedure EFicheroPedidoSellforgeChange(Sender: TObject);
     procedure MIBorrarArchivoClick(Sender: TObject);
     procedure PCTipoImportacionChange(Sender: TObject);
     procedure EFSerieComprasAnverChange(Sender: TObject);
     procedure EFSerieVentasAnverChange(Sender: TObject);
     procedure BImportarComprasAnverClick(Sender: TObject);
     procedure BImportarVentasAnverClick(Sender: TObject);
     procedure EFicheroPedidoNTVChange(Sender: TObject);
     procedure EFClienteNTVChange(Sender: TObject);
     procedure EFAgenteNTVChange(Sender: TObject);
     procedure ETituloAgenteNTVChange(Sender: TObject);
     procedure BVerFicheroNTVClick(Sender: TObject);
     procedure ETituloClienteNTVChange(Sender: TObject);
     procedure BImportarPedidoNTVClick(Sender: TObject);
     procedure SGNTVDblClick(Sender: TObject);
     procedure SGNTVDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure FormActivate(Sender: TObject);
     procedure BSellforgeExpFamiliasClick(Sender: TObject);
     procedure BSellforgeExpArticulosClick(Sender: TObject);
     procedure BSellforgeExpClientesClick(Sender: TObject);
     procedure BSellforgeExpDireccionesClick(Sender: TObject);
     procedure BSellforgeExpTodoClick(Sender: TObject);
     procedure BNTVExpClientesClick(Sender: TObject);
     procedure BNTVExpDireccionesClick(Sender: TObject);
     procedure BNTVExpArticulosClick(Sender: TObject);
     procedure BNTVExpFamiliasClick(Sender: TObject);
     procedure BGuardarConfiguracionNTVClick(Sender: TObject);
     procedure BNTVExpExportarTodoClick(Sender: TObject);
     procedure BNTVExpAgentesClick(Sender: TObject);
     procedure BNTVExpFormaPagoClick(Sender: TObject);
     procedure BNTVExpZonasClick(Sender: TObject);
     procedure BNTVExpPortesClick(Sender: TObject);
     procedure EFSerieVentasLabexChange(Sender: TObject);
     procedure BImportarLabexClick(Sender: TObject);
     procedure ELineasIgnorarLabexChange(Sender: TObject);
     procedure SGLabexDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure FormShow(Sender: TObject);
     procedure EFSerieAbonoLabexChange(Sender: TObject);
  private
     { Private declarations }
     Columna, Linea: integer;
     param_MODSINC008: boolean;
     param_MODSINC009: boolean;
     param_MODSINC020: boolean;
     param_MODSINC021: boolean;
     param_MODSINC022: boolean;
     param_MODSINC027: boolean;
     ArticulosSellforge: TStrings;
     procedure RellenaDatosGrilla;
  public
     { Public declarations }
     procedure SincronizarcionAutomatica(Tipo: string);
  end;

var
  FMImportarDocumentos : TFMImportarDocumentos;

implementation

uses UDMMain, UEntorno, UDMImportarDocumentos, UFMain, UFMPedidos,
  UFMOfertas, UFMAlbaranes, UFMFacturas, UParam, UUtiles, UDameDato, IdGlobalProtocols;

{$R *.dfm}

procedure TFMImportarDocumentos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMImportarDocumentos, DMImportarDocumentos);

  // Relleno directorio par que al seleccionar pestaña a habilitar no este vacio y guarde "\".
  PCTipoImportacionChange(Sender);

  SGDatosAImportar.RowCount := 2;
  SGDatosAImportar.FixedRows := 1;
  SGDatosAImportar.Cells[0, 0] := _('Articulo');
  SGDatosAImportar.Cells[1, 0] := _('Unid.');
  SGDatosAImportar.Cells[2, 0] := _('Titulo');
  SGDatosAImportar.Cells[3, 0] := _('Precio');
  SGDatosAImportar.Cells[4, 0] := _('Desc.');
  SGDatosAImportar.Cells[5, 0] := _('Total');
  DEFechaPedido.Date := Now;

  // Tipo de Importación Excel (Trepat) ----------------------------------------
  param_MODSINC008 := (LeeParametro('MODSINC008') = 'S');
  TSImportacionExcel.TabVisible := param_MODSINC008;
  AImportarArchivosOferta.Visible := param_MODSINC008;
  AImportarArchivosPedido.Visible := param_MODSINC008;
  AImportarArchivosAlbaran.Visible := param_MODSINC008;
  AImportarArchivosFactura.Visible := param_MODSINC008;
  if param_MODSINC008 then
  begin
     PCTipoImportacion.ActivePage := TSImportacionExcel;
     PCTipoImportacionChange(Sender);
  end;

  // Tipo de Importación Texto Plano (President) -------------------------------
  param_MODSINC009 := (LeeParametro('MODSINC009') = 'S');
  TSImportacionPresident.TabVisible := param_MODSINC009;
  AImportarComprasPresident.Visible := param_MODSINC009;
  AImportarVentasPresident.Visible := param_MODSINC009;
  if param_MODSINC009 then
  begin
     PCTipoImportacion.ActivePage := TSImportacionPresident;
     PCTipoImportacionChange(Sender);
  end;

  EFSerie.Text := REntorno.Serie;
  EFSerieAbono.Text := REntorno.Serie;
  EFProveedor.Text := '-1';

  // Tipo de Importación Sellforge (Vilalta) -----------------------------------------
  param_MODSINC021 := (LeeParametro('MODSINC021') = 'S');
  TSImportacionSellforge.TabVisible := param_MODSINC021;
  ASellforgeDescargarFTP.Visible := param_MODSINC021;
  if param_MODSINC021 then
  begin
     PCTipoImportacion.ActivePage := TSImportacionSellforge;
     PCTipoImportacionChange(Sender);
  end;

  PCImportacionSellforge.ActivePage := TSSellforgeImportar;
  MFicheroSellforge.Visible := False;
  with SGDatosImportarSellforge do
  begin
     RowCount := 2;
     FixedRows := 1;
     Cells[0, 0] := _('Articulo');
     Cells[1, 0] := _('Descripcion');
     Cells[2, 0] := _('Unidades');
     Cells[3, 0] := _('Precio');
     Cells[4, 0] := _('Desc.');
  end;

  EHost.Text := LeeDatoIni('ImportarDocumentos', 'FTP_Host', '');
  EPort.Text := IntToStr(LeeDatoIni('ImportarDocumentos', 'FTP_Port', 21));
  EUser.Text := LeeDatoIni('ImportarDocumentos', 'FTP_User', '');
  EPassword.Text := DescodificaClave(LeeDatoIni('ImportarDocumentos', 'FTP_PasswordEnc2', ''));
  EPassword.Text := DescodificaClave(LeeDatoIni('ImportarDocumentos', 'FTP_PasswordEnc1', '')) + EPassword.Text;
  ERutaFTP.Text := LeeDatoIni('ImportarDocumentos', 'FTP_Ruta', '');

  PCImportacionNTV.ActivePage := TSNTVImportar;
  DENTVRutaExp.Text := LeeDatoIni('ImportarDocumentos', 'NTV_RutaExportacion', '');

  // Lista de articulos que se deben "traducir" al importar para Vilalta
  ArticulosSellforge := TStringList.Create;
  // ArticulosSellforge.Values['COD_SELLFORGE'] := 'COD_DELFOS';
  ArticulosSellforge.Values['MEVI16E'] := 'MEVI4076O';
  ArticulosSellforge.Values['MEVI17E'] := 'MEVI4061O';
  ArticulosSellforge.Values['MEVI19E'] := 'MEVI45IBO';
  ArticulosSellforge.Values['MEVI20E'] := 'MEVI45INO';
  ArticulosSellforge.Values['MEVI21E'] := 'MEVI4130BO';
  ArticulosSellforge.Values['MEVI22E'] := 'MEVI4130NO';
  ArticulosSellforge.Values['MEVI23E'] := 'MEVI4075BO';
  ArticulosSellforge.Values['MEVI24E'] := 'MEVI4075NO';
  ArticulosSellforge.Values['MEVI25E'] := 'MEVI4079O';
  ArticulosSellforge.Values['MEVI26E'] := 'MEVI4095O';
  ArticulosSellforge.Values['MEVI27E'] := 'MEVI4062O';
  ArticulosSellforge.Values['MEVI28E'] := 'MEVI43AN';
  ArticulosSellforge.Values['MEVI29E'] := 'MEVI54AN';
  ArticulosSellforge.Values['MEVI1E'] := 'MEVI1001O';
  ArticulosSellforge.Values['MEVI2E'] := 'MEVI1001NO';
  ArticulosSellforge.Values['MEVI3E'] := 'MEVI1073O';
  ArticulosSellforge.Values['MEVI4E'] := 'MEVI135O';
  ArticulosSellforge.Values['MEVI5E'] := 'MEVI137';
  ArticulosSellforge.Values['MEVI7E'] := 'MEVI1022O';
  ArticulosSellforge.Values['MEVI7NE'] := 'MEVI1022NO';
  ArticulosSellforge.Values['MEVI8E'] := 'MEVI1054O';
  ArticulosSellforge.Values['MEVI10E'] := '1014E';
  ArticulosSellforge.Values['MEVI31E'] := 'MEVI1074O';
  ArticulosSellforge.Values['MEVI11E'] := 'MEVI1014T';
  ArticulosSellforge.Values['MEVI12E'] := 'MEVI1014TN';

  // Tipo de Importación ANVER -------------------------------------------------
  param_MODSINC020 := (LeeParametro('MODSINC020') = 'S');
  TSImportacionAnverCompras.TabVisible := param_MODSINC020;
  TSImportacionAnverVentas.TabVisible := param_MODSINC020;
  if param_MODSINC020 then
  begin
     PCTipoImportacion.ActivePage := TSImportacionAnverCompras;
     PCTipoImportacionChange(Sender);
  end;

  EFSerieVentasAnver.Text := LeeDatoIni('ImportarDocumentos', 'SerieVentasAnver', REntorno.Serie);
  EFSerieComprasAnver.Text := LeeDatoIni('ImportarDocumentos', 'SerieComprasAnver', REntorno.Serie);

  // Tipo de Importación NTV ---------------------------------------------------
  param_MODSINC022 := (LeeParametro('MODSINC022') = 'S');
  TSNTV.TabVisible := param_MODSINC022;
  if param_MODSINC022 then
  begin
     PCTipoImportacion.ActivePage := TSNTV;
     PCTipoImportacionChange(Sender);

     MFicheroNTV.Visible := False;
     with SGNTV do
     begin
        RowCount := 2;
        FixedRows := 1;
        Cells[0, 0] := _('Tipo');
        Cells[1, 0] := _('Ejer.');
        Cells[2, 0] := _('Ped.');
        Cells[3, 0] := _('Linea');
        Cells[4, 0] := _('Articulo');
        Cells[5, 0] := _('Unidades');
        Cells[6, 0] := _('Precio');
        Cells[7, 0] := _('IVA');
        Cells[8, 0] := _('Dto. 1');
        Cells[9, 0] := _('Dto. 2');
        Cells[10, 0] := _('Subtotal');
     end;
  end;

  // Labex
  param_MODSINC027 := (LeeParametro('MODSINC027') = 'S');
  TSLabex.TabVisible := param_MODSINC027;
  if param_MODSINC027 then
  begin
     with SGLabex do
     begin
        RowCount := 2;
        FixedRows := 1;
        SGLabex.ColWidths[0] := 100;
        Cells[0, 0] := _('CAB_FACTURA');
        SGLabex.ColWidths[1] := 100;
        Cells[1, 0] := _('CAB_FECHA');
        SGLabex.ColWidths[2] := 100;
        Cells[2, 0] := _('CAB_NIF');
        SGLabex.ColWidths[3] := 200;
        Cells[3, 0] := _('CAB_REFERENCIA');
        SGLabex.ColWidths[4] := 200;
        Cells[4, 0] := _('CAB_NOTAS');
        SGLabex.ColWidths[5] := 100;
        Cells[5, 0] := _('CAB_OTROS');
        SGLabex.ColWidths[6] := 100;
        Cells[6, 0] := _('CAB_LIQUIDO');
        SGLabex.ColWidths[7] := 200;
        Cells[7, 0] := _('DET_ARTICULO');
        SGLabex.ColWidths[8] := 200;
        Cells[8, 0] := _('DET_DESCRIPCION');
        SGLabex.ColWidths[9] := 200;
        Cells[9, 0] := _('DET_NOTAS');
        SGLabex.ColWidths[10] := 100;
        Cells[10, 0] := _('DET_CANTIDAD');
        SGLabex.ColWidths[11] := 100;
        Cells[11, 0] := _('DET_IMPORTE');
        SGLabex.ColWidths[12] := 100;
        Cells[12, 0] := _('DET_DESCUENTO');
        SGLabex.ColWidths[13] := 100;
        Cells[13, 0] := _('DET_OTROS');
     end;

     PCTipoImportacion.ActivePage := TSLabex;
     PCTipoImportacionChange(Sender);
     EFSerieVentasLabex.Text := LeeDatoIni('ImportarDocumentos', 'SerieVentasLabex', REntorno.Serie);
     EFSerieAbonoLabex.Text := LeeDatoIni('ImportarDocumentos', 'SerieAbonoLabex', REntorno.Serie);
     ELineasIgnorarLabex.Text := LeeDatoIni('ImportarDocumentos', 'LineasIgnorarLabex', ELineasIgnorarLabex.Text);
  end;

  ARefrescarDatos.Execute;
end;

procedure TFMImportarDocumentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ArticulosSellforge.Free;
  CierraData(DMImportarDocumentos);
end;

procedure TFMImportarDocumentos.ARefrescarDatosExecute(Sender: TObject);
var
  sr : TSearchRec;
  Filtro : string;
  c, r : integer;
begin
  if (PCTipoImportacion.ActivePage = TSImportacionExcel) then
     Filtro := '*.xls';
  if (PCTipoImportacion.ActivePage = TSImportacionPresident) then
     Filtro := '*.txt';
  if (PCTipoImportacion.ActivePage = TSImportacionAnverCompras) then
     Filtro := '*.csv';
  if (PCTipoImportacion.ActivePage = TSImportacionAnverVentas) then
     Filtro := '*.csv';
  if (PCTipoImportacion.ActivePage = TSImportacionSellforge) then
     Filtro := 'PEDIDO_*.csv';
  if (PCTipoImportacion.ActivePage = TSNTV) then
     Filtro := 'Pedido-*.txt';
  if (PCTipoImportacion.ActivePage = TSLabex) then
     Filtro := '*.csv';

  try
     with LBArchivosAImportar.Items do
     begin
        Clear;
        if FindFirst(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + Filtro, faReadOnly + faArchive, sr) = 0 then
        begin
           repeat
              Add(sr.Name);
           until FindNext(sr) <> 0;
           FindClose(sr);
        end;
     end;
  finally
  end;

  // Limpio datos
  with SGDatosImportarSellforge do
  begin
     RowCount := 2;
     for c := 0 to ColCount - 1 do
        for r := 1 to RowCount - 1 do
           Cells[c, r] := '';
  end;

  EFicheroComprasAnver.Text := '';
  EFicheroVentasAnver.Text := '';
  EFicheroPedidoSellforge.Text := '';
  ENroPedidoSellforge.Text := '';
  EFClienteSellforge.Text := '';
  EFAgenteSellforge.Text := '';
  ENotasPedidoSellforge.Text := '';
  EPortesSellforge.Text := '';
  LNIFCliente.Caption := '';

  // Limpio datos
  with SGNTV do
  begin
     RowCount := 2;
     for c := 0 to ColCount - 1 do
        for r := 1 to RowCount - 1 do
           Cells[c, r] := '';
  end;

  EFicheroPedidoNTV.Text := '';
  ENroPedidoNTV.Text := '';
  EFClienteNTV.Text := '';
  EFAgenteNTV.Text := '';
  ENotasPedidoNTV.Text := '';
  EPortesNTV.Text := '';
  LNIFClienteNTV.Caption := '';

  // Limpio datos
  with SGLabex do
  begin
     RowCount := 2;
     for c := 0 to ColCount - 1 do
        for r := 1 to RowCount - 1 do
           Cells[c, r] := '';
  end;
end;

procedure TFMImportarDocumentos.DSDirectorioImportarChange(Sender: TObject);
begin
  ARefrescarDatos.Execute;

  if (PCTipoImportacion.ActivePage = TSImportacionExcel) then
     EscribeDatoIni('ImportarDocumentos', 'CarpetaImportacionExcel', IncludeTrailingPathDelimiter(DSDirectorioImportar.Text));
  if (PCTipoImportacion.ActivePage = TSImportacionPresident) then
     EscribeDatoIni('ImportarDocumentos', 'CarpetaImportacionPresident', IncludeTrailingPathDelimiter(DSDirectorioImportar.Text));
  if (PCTipoImportacion.ActivePage = TSImportacionSellforge) then
     EscribeDatoIni('ImportarDocumentos', 'CarpetaImportacionSellforge', IncludeTrailingPathDelimiter(DSDirectorioImportar.Text));
  if (PCTipoImportacion.ActivePage = TSNTV) then
     EscribeDatoIni('ImportarDocumentos', 'CarpetaImportacionNTV', IncludeTrailingPathDelimiter(DSDirectorioImportar.Text));
  if (PCTipoImportacion.ActivePage = TSImportacionAnverCompras) then
     EscribeDatoIni('ImportarDocumentos', 'CarpetaImportacionCompras', IncludeTrailingPathDelimiter(DSDirectorioImportar.Text));
  if (PCTipoImportacion.ActivePage = TSImportacionAnverVentas) then
     EscribeDatoIni('ImportarDocumentos', 'CarpetaImportacionVentas', IncludeTrailingPathDelimiter(DSDirectorioImportar.Text));
  if (PCTipoImportacion.ActivePage = TSLabex) then
     EscribeDatoIni('ImportarDocumentos', 'CarpetaImportacionLabex', IncludeTrailingPathDelimiter(DSDirectorioImportar.Text));
end;

procedure TFMImportarDocumentos.LBArchivosAImportarDblClick(Sender: TObject);
const
  xlCellTypeLastCell = $0000000B;
var
  Excel, Sheet : olevariant;
  CantRow, CantCol, a, ai, i, j, Row : integer;
  RangoMatriz : variant;
  Columnas, Campos : TStrings;
  Articulo : string;
  aGrid : TStringGrid;
  LineasIgnorar, ColFactura, ColCliente : integer;
begin
  a := 0;
  if (PCTipoImportacion.ActivePage = TSImportacionExcel) then
  begin
     ClearStringGrid(SGDatosAImportar, True, 1);

     for a := 0 to (LBArchivosAImportar.Items.Count - 1) do
     begin
        try
           if LBArchivosAImportar.Selected[a] then
           begin
              if not FileExists(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]) then
              begin
                 MessageDlg(Format(_('No se encuentra archivo %s'), [LBArchivosAImportar.Items.Strings[a]]), mtError, [mbOK], 0);
              end
              else
              begin
                 {Aqui hay que leer campos del archivo Excel para determinar el cliente}
                 try
                    Excel := CreateOleObject('Excel.Application');
                    Excel.Workbooks.Open(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]);

                    Sheet := Excel.Workbooks[LBArchivosAImportar.Items.Strings[a]].WorkSheets[1];
                    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

                    CantRow := Excel.ActiveCell.Row;
                    CantCol := Excel.ActiveCell.Column;

                    SGDatosAImportar.RowCount := CantRow + 1;

                    RangoMatriz := Excel.Range['A1', Excel.Cells.Item[CantRow, CantCol]].Value;

                    EFCliente.Text := RangoMatriz[1, 1]; {Campo A1 de Excel}
                    for i := 1 to CantRow do
                    begin
                       for j := 1 to 2 do
                       begin
                          // Haces todo lo que necesites hacer
                          SGDatosAImportar.Cells[j - 1, i] := RangoMatriz[i, j];
                       end;
                    end;//for
                 finally
                    Excel.Quit; //Aquí cerramos la hoja de Excel
                 end;
              end;
           end;
        finally
           { do something here }
        end;
     end;

     {pongo el cliente y borro la primera linea}
     EFCliente.Text := SGDatosAImportar.Cells[0, 1];
     ENotas.Text := SGDatosAImportar.Cells[1, 1];
     for i := 1 to SGDatosAImportar.RowCount - 2 do
        for j := 0 to SGDatosAImportar.ColCount - 1 do
           SGDatosAImportar.Cells[j, i] := SGDatosAImportar.Cells[j, i + 1];
     SGDatosAImportar.RowCount := SGDatosAImportar.RowCount - 1;

     RellenaDatosGrilla;
  end
  else
  if (PCTipoImportacion.ActivePage = TSImportacionPresident) then
  begin
     if not FileExists(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]) then
     begin
        MessageDlg(Format(_('No se encuentra archivo %s'), [LBArchivosAImportar.Items.Strings[a]]), mtError, [mbOK], 0);
     end
     else
     begin
        for a := 0 to (LBArchivosAImportar.Items.Count - 1) do
        begin
           if LBArchivosAImportar.Selected[a] then
           begin
              MFichero.Lines.LoadFromFile(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]);
              EFichero.Text := LBArchivosAImportar.Items.Strings[a];
           end;
        end;
     end;
  end
  else
  if (PCTipoImportacion.ActivePage = TSImportacionSellforge) then
  begin
     PCImportacionSellforge.ActivePage := TSSellforgeImportar;

     a := LBArchivosAImportar.ItemIndex;

     if not FileExists(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]) then
     begin
        MessageDlg(Format(_('No se encuentra archivo %s'), [LBArchivosAImportar.Items.Strings[a]]), mtError, [mbOK], 0);
     end
     else
     begin
        ClearStringGrid(SGDatosImportarSellforge, True, 1);

        // Inicializo edits de cabecera
        ENroPedidoSellforge.Text := '';
        EFicheroPedidoSellforge.Text := '';

        EFClienteSellforge.Text := '';
        ETituloClienteSellforge.Text := '';
        ETituloClienteSellforgeChange(nil);

        EFAgenteSellforge.Text := '';
        ETituloAgenteSellforge.Text := '';
        ETituloAgenteSellforgeChange(nil);

        ENotasPedidoSellforge.Text := '';
        EPortesSellforge.Text := '0';

        Columnas := TStringList.Create;
        Campos := TStringList.Create;
        try
           for a := 0 to (LBArchivosAImportar.Items.Count - 1) do
           begin
              if LBArchivosAImportar.Selected[a] then
              begin
                 EFicheroPedidoSellforge.Text := LBArchivosAImportar.Items.Strings[a];
                 MFicheroSellforge.Lines.LoadFromFile(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]);
                 if MFicheroSellforge.Lines.Count > 1 then
                 begin
                    SGDatosImportarSellforge.RowCount := MFicheroSellforge.Lines.Count;
                    SGDatosImportarSellforge.ColCount := 5;
                    Columnas.Delimiter := ';';
                    Campos.Delimiter := ';';

                    // Obtengo nombre de campos para establecer su posicion
                    Columnas.DelimitedText := MFicheroSellforge.Lines[0];
                    for i := 0 to Columnas.Count - 1 do
                       Columnas[i] := StringReplace(Columnas[i], '"', '', [rfReplaceAll]);

                    // De la primera linea importada obtenemos los datos de cabecera que se repiten
                    Campos.DelimitedText := MFicheroSellforge.Lines[1];
                    if (Columnas.IndexOf('PEDIDO') >= 0) then
                       ENroPedidoSellforge.Text := Campos[Columnas.IndexOf('PEDIDO')];
                    if (Columnas.IndexOf('FECHA') >= 0) then
                       DEFechaPedidoSellforge.Date := StrToDateYYYY_MM_DD(Campos[Columnas.IndexOf('FECHA')]);
                    if (Columnas.IndexOf('CLIENTE') >= 0) then
                       EFClienteSellforge.Text := IntToStr(DMImportarDocumentos.DameClienteSegunNIF(Campos[Columnas.IndexOf('CLIENTE')]));
                    if (Columnas.IndexOf('CLIENTE') >= 0) then
                       LNIFCliente.Caption := Campos[Columnas.IndexOf('CLIENTE')];
                    // EFAgenteSellforge.Text := Campos[Columnas.IndexOf('AGENTE')];
                    // Se tomara el agente del cliente (18/10/2023)
                    EFAgenteSellforge.Text := IntToStr(DMImportarDocumentos.DameAgenteCliente(StrToIntDef(EFClienteSellforge.Text, 0)));
                    if (Columnas.IndexOf('PORTES') >= 0) then
                       EPortesSellforge.Text := Campos[Columnas.IndexOf('PORTES')];
                    if (Columnas.IndexOf('NOTAS') >= 0) then
                       ENotasPedidoSellforge.Text := Campos[Columnas.IndexOf('NOTAS')];

                    // Importacion de detalle
                    for i := 1 to MFicheroSellforge.Lines.Count - 1 do
                    begin
                       Campos.DelimitedText := MFicheroSellforge.Lines[i];
                       with SGDatosImportarSellforge do
                       begin
                          Articulo := '';
                          if (Columnas.IndexOf('ARTICULO') >= 0) then
                             Articulo := Campos[Columnas.IndexOf('ARTICULO')];
                          SGDatosImportarSellforge.Cells[0, i] := Articulo;

                          // Caso especial si no existe el articulo lo busco quitando la "F" final, si la tiene.
                          if (DameIdArticulo(Articulo) = 0) then
                          begin
                             if (Copy(Articulo, Length(Articulo), 1) = 'F') then
                                if (DameIdArticulo(Copy(Articulo, 1, Length(Articulo) - 1)) <> 0) then
                                   SGDatosImportarSellforge.Cells[0, i] := Copy(Articulo, 1, Length(Articulo) - 1);
                          end;

                          // Traduccion de ciertos articulos
                          if (ArticulosSellforge.IndexOfName(Articulo) >= 0) then
                          begin
                             SGDatosImportarSellforge.Cells[0, i] := ArticulosSellforge.Values[Articulo];
                          end;

                          if (Columnas.IndexOf('DESCRIPCION') >= 0) then
                             SGDatosImportarSellforge.Cells[1, i] := Campos[Columnas.IndexOf('DESCRIPCION')];
                          if (Columnas.IndexOf('UNIDADES') >= 0) then
                             SGDatosImportarSellforge.Cells[2, i] := Campos[Columnas.IndexOf('UNIDADES')];
                          if (Columnas.IndexOf('PRECIO') >= 0) then
                             SGDatosImportarSellforge.Cells[3, i] := Campos[Columnas.IndexOf('PRECIO')];
                          if (Columnas.IndexOf('DESCUENTO') >= 0) then
                             SGDatosImportarSellforge.Cells[4, i] := Campos[Columnas.IndexOf('DESCUENTO')];
                       end;
                    end;
                 end;
              end;
           end;
        finally
           Columnas.Free;
           Campos.Free;
        end;
     end;
  end
  else
  if (PCTipoImportacion.ActivePage = TSImportacionAnverCompras) then
  begin
     for a := 0 to (LBArchivosAImportar.Items.Count - 1) do
     begin
        if not FileExists(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]) then
        begin
           MessageDlg(Format(_('No se encuentra archivo %s'), [LBArchivosAImportar.Items.Strings[a]]), mtError, [mbOK], 0);
        end
        else
        begin
           if LBArchivosAImportar.Selected[a] then
           begin
              MFicheroCompraAnver.Lines.LoadFromFile(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]);
              EFicheroComprasAnver.Text := LBArchivosAImportar.Items.Strings[a];
              // DMImportarDocumentos.ImportarComprasAnver(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a], EFSerieComprasAnver.Text);
           end;
        end;
     end;
  end
  else
  if (PCTipoImportacion.ActivePage = TSImportacionAnverVentas) then
  begin
     for a := 0 to (LBArchivosAImportar.Items.Count - 1) do
     begin
        if LBArchivosAImportar.Selected[a] then
        begin
           if not FileExists(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]) then
           begin
              MessageDlg(Format(_('No se encuentra archivo %s'), [LBArchivosAImportar.Items.Strings[a]]), mtError, [mbOK], 0);
           end
           else
           begin
              MFicheroVentaAnver.Lines.Clear;
              MFicheroVentaAnver.Lines.LoadFromFile(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]);
              EFicheroVentasAnver.Text := LBArchivosAImportar.Items.Strings[a];
              // DMImportarDocumentos.ImportarVentasAnver(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a], EFSerieComprasAnver.Text);
           end;
        end;
     end;
  end
  else
  if (PCTipoImportacion.ActivePage = TSNTV) then
  begin
     for a := 0 to (LBArchivosAImportar.Items.Count - 1) do
     begin
        if LBArchivosAImportar.Selected[a] then
        begin
           if not FileExists(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]) then
           begin
              MessageDlg(Format(_('No se encuentra archivo %s'), [LBArchivosAImportar.Items.Strings[a]]), mtError, [mbOK], 0);
           end
           else
           begin
              ClearStringGrid(SGNTV, True, 1);

              MFicheroNTV.Lines.Clear;
              MFicheroNTV.Lines.LoadFromFile(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]);
              EFicheroPedidoNTV.Text := LBArchivosAImportar.Items.Strings[a];

              // Inicializo edits de cabecera
              ENroPedidoNTV.Text := '';
              EFicheroPedidoNTV.Text := '';

              EFClienteNTV.Text := '';
              ETituloClienteNTV.Text := '';
              ETituloClienteNTVChange(nil);

              EFAgenteNTV.Text := '';
              ETituloAgenteNTV.Text := '';
              ETituloAgenteNTVChange(nil);

              ENotasPedidoNTV.Text := '';
              EPortesNTV.Text := '0';

              Columnas := TStringList.Create;
              Campos := TStringList.Create;
              try
                 for ai := 0 to (LBArchivosAImportar.Items.Count - 1) do
                 begin
                    if LBArchivosAImportar.Selected[ai] then
                    begin
                       EFicheroPedidoNTV.Text := LBArchivosAImportar.Items.Strings[ai];
                       MFicheroNTV.Lines.LoadFromFile(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[ai]);
                       if MFicheroNTV.Lines.Count > 1 then
                       begin
                          aGrid := TStringGrid.Create(nil);
                          try
                             aGrid.ColCount := 11;
                             // Leo el fichero en un Grid para facilitar manipulacion
                             LeerCSV(aGrid, IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[ai], ',');

                             Row := 1;
                             SGNTV.RowCount := aGrid.RowCount;
                             SGNTV.ColCount := aGrid.ColCount;
                             for i := 0 to aGrid.RowCount - 1 do
                             begin
                                if (aGrid.Cells[0, i] = 'CAB') then
                                begin
                                   // Cabecera
                                   // CAB,2024,10,29/01/2024,1110106,261,0,,0,0,0,3,1149.14,0,0,0,1390.46,OJO 50-50
                                   //  := Grid.Cells[1, i]; // Serie del documento
                                   ENroPedidoNTV.Text := aGrid.Cells[2, i]; // Numero del pedido
                                   DEFechaPedidoNTV.Date := StrToDateDD_MM_YYYY(aGrid.Cells[3, i]);
                                   EFClienteNTV.Text := aGrid.Cells[4, i]; // Codigo de gestion del cliente
                                   EFAgenteNTV.Text := IntToStr(DMImportarDocumentos.DameAgenteNTV(aGrid.Cells[5, i])); // Codigo de Vendedor
                                   LAgenteNTVImportacion.Visible := False;
                                   if (EFAgenteNTV.Text = '0') then
                                   begin
                                      LAgenteNTVImportacion.Visible := True;
                                      LAgenteNTVImportacion.Caption := aGrid.Cells[5, i];
                                   end;
                                   EPortesNTV.Text := aGrid.Cells[7, i];
                                   //  := aGrid.Cells[8, i]; // Código de la forma de pago.
                                   EDtoCialNTV.Text := aGrid.Cells[9, i];
                                   //  := aGrid.Cells[10, i]; // Dto. 2
                                   EDtoPPNTV.Text := aGrid.Cells[11, i];
                                   //  := aGrid.Cells[12, i]; // Numero de Tarifa Usada
                                   //  := aGrid.Cells[13, i]; // Base 1
                                   //  := aGrid.Cells[14, i]; // Base 2
                                   //  := aGrid.Cells[15, i]; // Base 3
                                   //  := aGrid.Cells[16, i]; // Base 4
                                   //  := aGrid.Cells[17, i]; // Total Pedido
                                   ENotasPedidoNTV.Text := aGrid.Cells[17, i]; // Comentario del pedido
                                end
                                else
                                begin
                                   // Detalle
                                   // LIN,2024,10,7,FEH5625,12,0,1,0,0,43.68
                                   // LIN,2024,10,8,FOLE186B,90,0,1,0,0,225
                                   // LIN,2024,10,9,MEVI67055,50,0,1,0,0,191
                                   // LIN,2024,10,1,SA1954304,50,0,1,0,0,35
                                   // LIN,2024,10,3,SA6150301,50,0,1,0,0,284
                                   // LIN,2024,10,10,SA6150601,40,0,1,0,0,67.2
                                   // LIN,2024,10,4,SA6150602,80,0,1,0,0,142.4
                                   // LIN,2024,10,6,SA9001076,6,0,1,0,0,59.52
                                   // LIN,2024,10,5,SA9003100,6,0,1,0,0,43.02
                                   // LIN,2024,10,2,SA9940600,72,0,1,0,0,58.32
                                   SGNTV.Cells[0, Row] := aGrid.Cells[0, i]; // "LIN"
                                   SGNTV.Cells[1, Row] := aGrid.Cells[1, i]; // Serie de documento
                                   SGNTV.Cells[2, Row] := aGrid.Cells[2, i]; // Nro. de Documento
                                   SGNTV.Cells[3, Row] := aGrid.Cells[3, i]; // Nro. de linea
                                   SGNTV.Cells[4, Row] := aGrid.Cells[4, i]; // Codidgo de Gestion del articulo
                                   SGNTV.Cells[5, Row] := aGrid.Cells[5, i]; // Cantidad Pedida
                                   SGNTV.Cells[6, Row] := aGrid.Cells[6, i]; // Precio de la tarifa del articulo
                                   SGNTV.Cells[7, Row] := aGrid.Cells[7, i]; // Codigo del Tipo de IVA
                                   SGNTV.Cells[8, Row] := aGrid.Cells[8, i]; // Dto. 1
                                   SGNTV.Cells[9, Row] := aGrid.Cells[9, i]; // Dto. 2
                                   SGNTV.Cells[10, Row] := aGrid.Cells[10, i]; // Subtotal de la linea
                                   Inc(Row);
                                end;
                             end;
                          finally
                             aGrid.Free;
                          end;
                       end;
                    end;
                 end;
              finally
                 Columnas.Free;
                 Campos.Free;
              end;
           end;
        end;
     end;
  end
  else
  if (PCTipoImportacion.ActivePage = TSLabex) then
  begin
     for a := 0 to (LBArchivosAImportar.Items.Count - 1) do
     begin
        try
           SGLabex.Visible := False;
           if LBArchivosAImportar.Selected[a] then
           begin
              ClearStringGrid(SGLabex);

              EFicheroLabex.Text := LBArchivosAImportar.Items.Strings[a];

              if not FileExists(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a]) then
              begin
                 MessageDlg(Format(_('No se encuentra archivo %s'), [LBArchivosAImportar.Items.Strings[a]]), mtError, [mbOK], 0);
              end
              else
              begin
                 SGLabex.ColCount := 14;
                 LeerCSV(SGLabex, IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[a], ';', '"');

                 // Validar los datos
                 LineasIgnorar := StrToIntDef(ELineasIgnorarLabex.Text, 1);

                 SGLabex.ColCount := SGLabex.ColCount + 2;

                 ColFactura := SGLabex.ColCount - 1;
                 ColCliente := SGLabex.ColCount - 2;

                 SGLabex.Cells[ColFactura, 0] := _('Id Doc.');
                 SGLabex.Cells[ColCliente, 0] := _('Cliente');

                 for i := LineasIgnorar to SGLabex.RowCount do
                 begin
                    if (SGLabex.Cells[0, i]) > '' then
                    begin
                       // Existe factura
                       // Columna 1 tiene numero de factura que debe corresponder con una factura que en SU_REFERENCIA tenga ese texto
                       SGLabex.Cells[ColFactura, i] := IntToStr(DMImportarDocumentos.DameFacturaSegunReferenica(EFSerieVentasLabex.Text, EFSerieAbonoLabex.Text, SGLabex.Cells[0, i]));

                       // Existe Cliente
                       // Columna 3 contiene NIF del cliente
                       SGLabex.Cells[ColCliente, i] := IntToStr(DMImportarDocumentos.DameClienteSegunNIF(SGLabex.Cells[2, i]));
                    end
                    else
                    begin
                       // Existe factura
                       // Columna 1 tiene numero de factura que debe corresponder con una factura que en SU_REFERENCIA tenga ese texto
                       SGLabex.Cells[ColFactura, i] := '0';

                       // Existe Cliente
                       // Columna 3 contiene NIF del cliente
                       SGLabex.Cells[ColCliente, i] := '0';
                    end;
                 end;//for
              end;
           end;
        finally
           SGLabex.Visible := True;
        end;
     end;
  end;
end;

procedure TFMImportarDocumentos.RellenaDatosGrilla;
var
  i : integer;
  Precio, Total : real;
begin
  Total := 0;
  with SGDatosAImportar do
  begin
     for i := 1 to RowCount - 1 do
     begin
        with DMImportarDocumentos.QPrecios do
        begin
           Close;
           Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
           Params.ByName['Cliente'].AsInteger := StrToIntDef(EFCliente.Text, -1);
           Params.ByName['Articulo'].AsString := Trim(Cells[0, i]);
           Params.ByName['Tarifa'].AsString := 'NOR';
           Params.ByName['Fecha'].AsDateTime := DEFechaPedido.Date;
           Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
           Params.ByName['Canal'].AsInteger := REntorno.Canal;
           Params.ByName['Unidades_Ext'].AsFloat := 1;
           Params.ByName['PRECIOP'].AsFloat := 0;
           Params.ByName['UNIDADES'].AsFloat := StrToIntDef(Cells[1, i], 0);
           Params.ByName['MONEDA'].AsString := REntorno.Moneda;
           Params.ByName['ID_A'].AsInteger := DameIDArticulo(Trim(Cells[0, i]));
           Params.ByName['UNIDADES_OLD'].AsFloat := 0;
           Params.ByName['IDIOMA'].AsString := 'CAS';
           Params.ByName['TIPO_LINEA'].AsString := 'NOR';
           Params.ByName['ID_P_OLD'].AsInteger := 0;
           Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
           Params.ByName['FACTOR'].AsFloat := 1;
           ExecQuery;
           Cells[2, i] := FieldByName['TITULO'].AsString;

           Precio := FieldByName['PRECIO'].AsFloat;
           Cells[3, i] := FormatFloat(',0.00', Precio);

           if (FieldByName['DESCUENTO'].AsFloat <> 0) then
           begin
              Precio := Precio - (Precio * FieldByName['DESCUENTO'].AsFloat) / 100;
              Cells[4, i] := FormatFloat(',0.00', FieldByName['DESCUENTO'].AsFloat);
           end;
           if (FieldByName['DESCUENTO_2'].AsFloat <> 0) then
           begin
              Precio := Precio - (Precio * FieldByName['DESCUENTO_2'].AsFloat) / 100;
              Cells[4, i] := Cells[4, i] + '+' + FormatFloat(',0.00', FieldByName['DESCUENTO_2'].AsFloat);
           end;
           if (FieldByName['DESCUENTO_3'].AsFloat <> 0) then
           begin
              Precio := Precio - (Precio * FieldByName['DESCUENTO_3'].AsFloat) / 100;
              Cells[4, i] := Cells[4, i] + '+' + FormatFloat(',0.00', FieldByName['DESCUENTO_3'].AsFloat);
           end;

           Cells[5, i] := FormatFloat(',0.00', Precio * StrToIntDef(Cells[1, i], 0));
           Total := Total + Precio * StrToIntDef(Cells[1, i], 0);
           FreeHandle;
        end;
     end; {for}
  end; {with}
  LTotalPedido.Caption := Format(_('Total Pedido %s'), [FormatFloat(',0.00', Total)]);
end;

procedure TFMImportarDocumentos.EFClienteChange(Sender: TObject);
begin
  ETituloCliente.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, -1));
end;

procedure TFMImportarDocumentos.SGDatosAImportarDblClick(Sender: TObject);
begin
  if (Columna = 0) then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO=''' + SGDatosAImportar.Cells[Columna, Linea] + ''' AND EJERCICIO=' + REntorno.EjercicioStr);
  end;
end;

procedure TFMImportarDocumentos.SGDatosAImportarSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  Columna := ACol;
  Linea := ARow;
  // CanSelect := False;
  FMImportarDocumentos.Caption := Format(_('Importar Documentos Excel - col.: %s fila: %s'), [IntToStr(ACol), IntToStr(ARow)]);
end;

procedure TFMImportarDocumentos.SGDatosAImportarDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  cc : TColor;
begin
  with SGDatosAImportar do
  begin
     if (ACol = 0) then
     begin
        cc := Canvas.Pen.Color;
        Canvas.Pen.Color := REntorno.ColorEnlaceActivo;
        Canvas.Pen.Width := 2;
        Canvas.MoveTo(Rect.Left, Rect.Top);
        Canvas.LineTo(Rect.Right, Rect.Top);
        Canvas.LineTo(Rect.Right, Rect.Bottom);
        Canvas.LineTo(Rect.Left, Rect.Bottom);
        Canvas.LineTo(Rect.Left, Rect.Top);
        Canvas.Pen.Color := cc;
     end;
     //.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFMImportarDocumentos.AimportarArchivosOfertaExecute(Sender: TObject);
var
  i : integer;
begin
  FMain.EjecutaAccion(FMain.Aofertas);
  with FMOfertas do
  begin
     with NavMain.DataSource.DataSet do
     begin
        Insert;
        FieldByName('CLIENTE').AsInteger := StrToIntDef(EFCliente.Text, -1);
        FieldByName('FECHA').AsDateTime := DEFechaPedido.Date;
        FieldByName('NOTAS').AsString := ENotas.Text;
        Post;
     end;
     for i := 1 to SGDatosAImportar.RowCount - 1 do
        with NavDetalle.DataSource.DataSet do
        begin
           Insert;
           Application.ProcessMessages;
           FieldByName('ARTICULO').AsString := Trim(SGDatosAImportar.Cells[0, i]);
           Application.ProcessMessages;
           FieldByName('UNIDADES').AsInteger := StrToIntDef(SGDatosAImportar.Cells[1, i], 0);
           Application.ProcessMessages;
           Post;
           Application.ProcessMessages;
        end;
  end;
end;

procedure TFMImportarDocumentos.AImportarArchivosPedidoExecute(Sender: TObject);
var
  i : integer;
begin
  FMain.EjecutaAccion(FMain.APedidos);
  with FMPedidos do
  begin
     with NavMain.DataSource.DataSet do
     begin
        Insert;
        FieldByName('CLIENTE').AsInteger := StrToIntDef(EFCliente.Text, -1);
        FieldByName('FECHA').AsDateTime := DEFechaPedido.Date;
        FieldByName('NOTAS').AsString := ENotas.Text;
        Post;
     end;
     for i := 1 to SGDatosAImportar.RowCount - 1 do
        with NavDetalle.DataSource.DataSet do
        begin
           Insert;
           Application.ProcessMessages;
           FieldByName('ARTICULO').AsString := Trim(SGDatosAImportar.Cells[0, i]);
           Application.ProcessMessages;
           FieldByName('UNIDADES').AsInteger := StrToIntDef(SGDatosAImportar.Cells[1, i], 0);
           Application.ProcessMessages;
           Post;
           Application.ProcessMessages;
        end;
  end;
end;

procedure TFMImportarDocumentos.AImportarArchivosAlbaranExecute(Sender: TObject);
var
  i : integer;
begin
  FMain.EjecutaAccion(FMain.Aalbaranes);
  with FMAlbaranes do
  begin
     with NavMain.DataSource.DataSet do
     begin
        Insert;
        FieldByName('CLIENTE').AsInteger := StrToIntDef(EFCliente.Text, -1);
        FieldByName('FECHA').AsDateTime := DEFechaPedido.Date;
        FieldByName('NOTAS').AsString := ENotas.Text;
        Post;
     end;
     for i := 1 to SGDatosAImportar.RowCount - 1 do
        with NavDetalle.DataSource.DataSet do
        begin
           Insert;
           Application.ProcessMessages;
           FieldByName('ARTICULO').AsString := Trim(SGDatosAImportar.Cells[0, i]);
           Application.ProcessMessages;
           FieldByName('UNIDADES').AsInteger := StrToIntDef(SGDatosAImportar.Cells[1, i], 0);
           Application.ProcessMessages;
           Post;
           Application.ProcessMessages;
        end;
  end;
end;

procedure TFMImportarDocumentos.AImportarArchivosFacturaExecute(Sender: TObject);
var
  i : integer;
begin
  FMain.EjecutaAccion(FMain.AFacturas);
  with FMFacturas do
  begin
     with NavMain.DataSource.DataSet do
     begin
        Insert;
        FieldByName('CLIENTE').AsInteger := StrToIntDef(EFCliente.Text, -1);
        FieldByName('FECHA').AsDateTime := DEFechaPedido.Date;
        FieldByName('NOTAS').AsString := ENotas.Text;
        Post;
     end;
     for i := 1 to SGDatosAImportar.RowCount - 1 do
        with NavDetalle.DataSource.DataSet do
        begin
           Insert;
           Application.ProcessMessages;
           FieldByName('ARTICULO').AsString := Trim(SGDatosAImportar.Cells[0, i]);
           Application.ProcessMessages;
           FieldByName('UNIDADES').AsInteger := StrToIntDef(SGDatosAImportar.Cells[1, i], 0);
           Application.ProcessMessages;
           Post;
           Application.ProcessMessages;
        end;
  end;
end;

procedure TFMImportarDocumentos.AImportarComprasPresidentExecute(Sender: TObject);
begin
  inherited;
  if (Trim(EFichero.Text) > '') then
     DMImportarDocumentos.ImportarFacturaCompraPresident(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + EFichero.Text, EFSerie.Text, EFSerieAbono.Text, StrToIntDef(EFProveedor.Text, 0));

  EFichero.Text := '';
  MFichero.Clear;
end;

procedure TFMImportarDocumentos.AImportarVentasPresidentExecute(Sender: TObject);
begin
  inherited;
  if (Trim(EFichero.Text) > '') then
     DMImportarDocumentos.ImportarFacturaVentaPresident(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + EFichero.Text, EFSerie.Text, EFSerieAbono.Text);

  EFichero.Text := '';
  MFichero.Clear;
end;

procedure TFMImportarDocumentos.EFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMImportarDocumentos.EFSerieAbonoChange(Sender: TObject);
begin
  inherited;
  ESerieAbono.Text := DameTituloSerie(EFSerieAbono.Text);
end;

procedure TFMImportarDocumentos.EFProveedorChange(Sender: TObject);
begin
  inherited;
  EProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMImportarDocumentos.PNLDatosDetalleSellforgeResize(Sender: TObject);
begin
  inherited;
  MFicheroSellforge.Height := PNLDatosDetalleSellforge.Height div 2;
end;

procedure TFMImportarDocumentos.EFClienteSellforgeChange(Sender: TObject);
begin
  inherited;
  ETituloClienteSellforge.Text := DameTituloCliente(StrToIntDef(EFClienteSellforge.Text, 0));
end;

procedure TFMImportarDocumentos.EFAgenteSellforgeChange(Sender: TObject);
begin
  inherited;
  ETituloAgenteSellforge.Text := DameTituloAgente(StrToIntDef(EFAgenteSellforge.Text, 0));
end;

procedure TFMImportarDocumentos.ETituloClienteSellforgeChange(Sender: TObject);
begin
  inherited;
  LNIFCliente.Visible := (Trim(ETituloClienteSellforge.Text) = '');

  if (Trim(ETituloClienteSellforge.Text) = '') then
     ColorError(ETituloClienteSellforge)
  else
     ColorInfo(ETituloClienteSellforge);
end;

procedure TFMImportarDocumentos.ETituloAgenteSellforgeChange(Sender: TObject);
begin
  inherited;
  if (Trim(ETituloAgenteSellforge.Text) = '') then
     ColorError(ETituloAgenteSellforge)
  else
     ColorInfo(ETituloAgenteSellforge);
end;

procedure TFMImportarDocumentos.SGDatosImportarSellforgeDblClick(Sender: TObject);
begin
  inherited;
  if (Columna = 0) then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO=''' + SGDatosImportarSellforge.Cells[Columna, Linea] + ''' AND EJERCICIO=' + REntorno.EjercicioStr);
  end;
end;

procedure TFMImportarDocumentos.SGDatosImportarSellforgeDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  cc : TColor;
begin
  inherited;
  with SGDatosImportarSellforge do
  begin
     if ((ACol = 0) and (ARow > 0)) then
     begin
        cc := Canvas.Pen.Color;
        if (DameTituloArticulo(Cells[ACol, ARow]) = '') then
           Canvas.Pen.Color := clRed
        else
           Canvas.Pen.Color := REntorno.ColorEnlaceActivo;

        Canvas.Pen.Width := 4;
        Canvas.MoveTo(Rect.Left, Rect.Top);
        Canvas.LineTo(Rect.Right, Rect.Top);
        Canvas.LineTo(Rect.Right, Rect.Bottom);
        Canvas.LineTo(Rect.Left, Rect.Bottom);
        Canvas.LineTo(Rect.Left, Rect.Top);
        Canvas.Pen.Color := cc;
     end;
     //.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFMImportarDocumentos.ASellforgeImportarPedidoExecute(Sender: TObject);
var
  i : integer;
  Fichero : string;
  Mensaje, Tipo : string;
  Bloqueo : integer;
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        if (DameTituloCliente(StrToIntDef(EFClienteSellforge.Text, 0)) = '') then
           Params.ByName['CLIENTE'].AsInteger := -1
        else
           Params.ByName['CLIENTE'].AsInteger := StrToIntDef(EFClienteSellforge.Text, -1);
        ExecQuery;
        Bloqueo := FieldByName['BLOQUEO'].AsInteger;
        Mensaje := FieldByName['MOTIVO_BLOQUEO'].AsString;
        FreeHandle;
     finally
        Free;
     end;

     {0.- Sin mensaje
      1.- Aviso
      2.- Bloquear}
     if (Bloqueo > 0) then
     begin
        Mensaje := _('Motivo') + ': ' + Mensaje;

        if (Bloqueo = 1) then
           Tipo := _('Aviso');

        if (Bloqueo = 2) then
           Tipo := _('Bloqueo');

        Application.MessageBox(PChar(Mensaje), PChar(Tipo), mb_iconinformation + mb_ok);
     end;
  end;

  if (Bloqueo <> 2) then
  begin
     DMMain.MuestraAviso('CLI', DameIDCliente(StrToIntDef(EFClienteSellforge.Text, 0)), 'PEC');

     PMain.Enabled := False;
     try
        FMain.EjecutaAccion(FMain.APedidos);
        with FMPedidos do
        begin
           try
              ImportacionMasiva(True);

              try
                 with NavMain.DataSource.DataSet do
                 begin
                    Insert;
                    if (DameTituloCliente(StrToIntDef(EFClienteSellforge.Text, 0)) = '') then
                       FieldByName('CLIENTE').AsInteger := -1
                    else
                       FieldByName('CLIENTE').AsInteger := StrToIntDef(EFClienteSellforge.Text, -1);

                    if (DameTituloAgente(StrToIntDef(EFAgenteSellforge.Text, 0)) <> '') then
                       FieldByName('AGENTE').AsInteger := StrToIntDef(EFAgenteSellforge.Text, -1);

                    FieldByName('FECHA').AsDateTime := DEFechaPedidoSellforge.Date;
                    FieldByName('NOTAS').AsString := StringReplace(Trim(ENotasPedidoSellforge.Text), '|', #13#10, [rfReplaceAll]);
                    FieldByName('Z_OBSERVACION').AsString := format(_('Importado %s'), [EFicheroPedidoSellforge.Text]);

                    if (StrToFloatDec(EPortesSellforge.Text, '.') <> 0) then
                    begin
                       FieldByName('TIPO_PORTES').AsInteger := 4;
                       FieldByName('I_PORTES').AsFloat := StrToFloatDec(EPortesSellforge.Text, '.');
                    end;

                    Post;
                 end;

                 for i := 1 to SGDatosImportarSellforge.RowCount - 1 do
                 begin
                    with NavDetalle.DataSource.DataSet do
                    begin
                       Insert;
                       Application.ProcessMessages;

                       if (DameTituloArticulo(Trim(SGDatosImportarSellforge.Cells[0, i])) = '') then
                          FieldByName('ARTICULO').AsString := REntorno.ArtTextoLibre
                       else
                          FieldByName('ARTICULO').AsString := Trim(SGDatosImportarSellforge.Cells[0, i]);

                       if (Trim(SGDatosImportarSellforge.Cells[1, i]) > '') then
                          FieldByName('TITULO').AsString := Trim(SGDatosImportarSellforge.Cells[1, i]);

                       Application.ProcessMessages;
                       FieldByName('UNIDADES').AsFloat := StrToFloatDec(SGDatosImportarSellforge.Cells[2, i], '.');
                       FieldByName('PRECIO').AsFloat := StrToFloatDec(SGDatosImportarSellforge.Cells[3, i], '.');
                       FieldByName('DESCUENTO').AsFloat := StrToFloatDec(SGDatosImportarSellforge.Cells[4, i], '.');
                       Post;
                       Application.ProcessMessages;
                    end;
                 end;

                 Fichero := IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + EFicheroPedidoSellforge.Text;
                 if CopyFileTo(Fichero, ChangeFileExt(Fichero, FormatDateTime('_yyyymmdd-hhnnss', Now) + '.bak')) then
                    DeleteFile(PChar(Fichero))
                 else
                    ShowMessage(_('ERROR - No se ha podido renombrar el fichero'));
              except
                 on e: Exception do
                    ShowMessage(_('Error creando pedido') + #13#10 + E.Message);
              end;
           finally
              ImportacionMasiva(False);
           end;
        end;
     finally
        PMain.Enabled := True;
     end;

     // Refresco lista de ficheros
     ARefrescarDatos.Execute;
  end;
end;

procedure TFMImportarDocumentos.BGuardarConfiguracionSellforgeClick(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('ImportarDocumentos', 'FTP_Host', EHost.Text);
  EscribeDatoIni('ImportarDocumentos', 'FTP_Port', StrToIntDef(EPort.Text, 21));
  EscribeDatoIni('ImportarDocumentos', 'FTP_User', EUser.Text);
  EscribeDatoIni('ImportarDocumentos', 'FTP_PasswordEnc1', CodificaClave(Copy(EPassword.Text, 1, 12)));
  EscribeDatoIni('ImportarDocumentos', 'FTP_PasswordEnc2', CodificaClave(Copy(EPassword.Text, 13, 24)));
  EscribeDatoIni('ImportarDocumentos', 'FTP_Ruta', ERutaFTP.Text);
end;

procedure TFMImportarDocumentos.ASellforgeDescargarFTPExecute(Sender: TObject);
begin
  inherited;
  // Traigo PEDIDO_*.csv del FTP y los renombro a .bak
  DMImportarDocumentos.TraerDatosFTP(EHost.Text, StrToIntDef(EPort.Text, 0), EUser.Text, EPassword.Text, '' {ECarpetaImportacion.Text}, DSDirectorioImportar.Text);
  ARefrescarDatos.Execute;
end;

procedure TFMImportarDocumentos.BSellforgeVerFicheroClick(Sender: TObject);
begin
  inherited;
  MFicheroSellforge.Visible := not MFicheroSellforge.Visible;
end;

procedure TFMImportarDocumentos.EFicheroPedidoSellforgeChange(Sender: TObject);
begin
  inherited;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT (EJERCICIO || ''-'' || SERIE || ''/'' || RIG) AS PEDIDO FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND TIPO = ''PEC'' AND Z_OBSERVACION = :Z_OBSERVACION';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['Z_OBSERVACION'].AsString := format(_('Importado %s'), [EFicheroPedidoSellforge.Text]);
        ExecQuery;
        LPedidoImportado.Visible := (FieldByName['PEDIDO'].AsString > '');
        LPedidoImportado.Caption := format(_('Ya importado en pedido + %s'), [FieldByName['PEDIDO'].AsString]);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMImportarDocumentos.MIBorrarArchivoClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;

  if MessageDlg(format(_('¿Desea borrar el fichero %s?'), [LBArchivosAImportar.Items.Strings[LBArchivosAImportar.ItemIndex]]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     Fichero := IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + LBArchivosAImportar.Items.Strings[LBArchivosAImportar.ItemIndex];

     if CopyFileTo(Fichero, ChangeFileExt(Fichero, FormatDateTime('_yyyymmdd-hhnnss', Now) + '.borrado')) then
        DeleteFile(PChar(Fichero))
     else
        ShowMessage(_('ERROR - No se ha podido renombrar el fichero'));

     ARefrescarDatos.Execute;
  end;
end;

procedure TFMImportarDocumentos.PCTipoImportacionChange(Sender: TObject);
begin
  inherited;
  if (PCTipoImportacion.ActivePage = TSImportacionExcel) then
     DSDirectorioImportar.Text := LeeDatoIni('ImportarDocumentos', 'CarpetaImportacionExcel', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if (PCTipoImportacion.ActivePage = TSImportacionPresident) then
     DSDirectorioImportar.Text := LeeDatoIni('ImportarDocumentos', 'CarpetaImportacionPresident', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if (PCTipoImportacion.ActivePage = TSImportacionSellforge) then
     DSDirectorioImportar.Text := LeeDatoIni('ImportarDocumentos', 'CarpetaImportacionSellforge', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if (PCTipoImportacion.ActivePage = TSNTV) then
     DSDirectorioImportar.Text := LeeDatoIni('ImportarDocumentos', 'CarpetaImportacionNTV', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if (PCTipoImportacion.ActivePage = TSImportacionAnverCompras) then
     DSDirectorioImportar.Text := LeeDatoIni('ImportarDocumentos', 'CarpetaImportacionCompras', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if (PCTipoImportacion.ActivePage = TSImportacionAnverVentas) then
     DSDirectorioImportar.Text := LeeDatoIni('ImportarDocumentos', 'CarpetaImportacionVentas', GetSpecialFolderPath(CSIDL_PERSONAL, True));
  if (PCTipoImportacion.ActivePage = TSLabex) then
     DSDirectorioImportar.Text := LeeDatoIni('ImportarDocumentos', 'CarpetaImportacionLabex', GetSpecialFolderPath(CSIDL_PERSONAL, True));

  ARefrescarDatos.Execute;
end;

procedure TFMImportarDocumentos.EFSerieComprasAnverChange(Sender: TObject);
begin
  inherited;
  ESerieComprasAnver.Text := DameTituloSerie(EFSerieComprasAnver.Text);
  EscribeDatoIni('ImportarDocumentos', 'SerieComprasAnver', EFSerieComprasAnver.Text);
end;

procedure TFMImportarDocumentos.EFSerieVentasAnverChange(Sender: TObject);
begin
  inherited;
  ESerieVentasAnver.Text := DameTituloSerie(EFSerieVentasAnver.Text);
  EscribeDatoIni('ImportarDocumentos', 'SerieVentasAnver', EFSerieVentasAnver.Text);
end;

procedure TFMImportarDocumentos.BImportarComprasAnverClick(Sender: TObject);
var
  i : integer;
  p : integer;
begin
  inherited;
  REFicheroCompraAnver.Lines.Clear;
  DMImportarDocumentos.ImportarComprasAnver(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + EFicheroComprasAnver.Text, EFSerieComprasAnver.Text, REFicheroCompraAnver.Lines);

  // Resalto las palabras "ATENCION" y "ERROR"
  with REFicheroCompraAnver do
  begin
     for i := 0 to Lines.Count - 1 do
     begin
        p := Pos(_('ATENCION'), Lines[i]) - 1;
        if (p > 0) then
        begin
           SelStart := Perform(EM_LINEINDEX, I, 0) + p;
           SelLength := Length(_('ATENCION'));
           SelAttributes.Color := clFuchsia;
           SelAttributes.Style := [fsBold];
        end;

        p := Pos(_('ERROR'), Lines[i]) - 1;
        if (p > 0) then
        begin
           SelStart := Perform(EM_LINEINDEX, I, 0) + p;
           SelLength := Length(_('ERROR'));
           SelAttributes.Color := clRed;
           SelAttributes.Style := [fsBold];
        end;
     end;
  end;

  ARefrescarDatos.Execute;
end;

procedure TFMImportarDocumentos.BImportarVentasAnverClick(Sender: TObject);
var
  i : integer;
  p : integer;
begin
  inherited;
  REFicheroVentaAnver.Lines.Clear;
  DMImportarDocumentos.ImportarVentasAnver(IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + EFicheroVentasAnver.Text, EFSerieVentasAnver.Text, REFicheroVentaAnver.Lines);

  // Resalto las palabras "ATENCION" y "ERROR"
  with REFicheroVentaAnver do
  begin
     for i := 0 to Lines.Count - 1 do
     begin
        p := Pos(_('ATENCION'), Lines[i]) - 1;
        if (p > 0) then
        begin
           SelStart := Perform(EM_LINEINDEX, I, 0) + p;
           SelLength := Length(_('ATENCION'));
           SelAttributes.Color := clFuchsia;
           SelAttributes.Style := [fsBold];
        end;

        p := Pos(_('ERROR'), Lines[i]) - 1;
        if (p > 0) then
        begin
           SelStart := Perform(EM_LINEINDEX, I, 0) + p;
           SelLength := Length(_('ERROR'));
           SelAttributes.Color := clRed;
           SelAttributes.Style := [fsBold];
        end;
     end;
  end;

  ARefrescarDatos.Execute;
end;

procedure TFMImportarDocumentos.EFicheroPedidoNTVChange(Sender: TObject);
begin
  inherited;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT (EJERCICIO || ''-'' || SERIE || ''/'' || RIG) AS PEDIDO FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND TIPO = ''PEC'' AND Z_OBSERVACION = :Z_OBSERVACION';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['Z_OBSERVACION'].AsString := format(_('Importado %s'), [EFicheroPedidoNTV.Text]);
        ExecQuery;
        LPedidoImportadoNTV.Visible := (FieldByName['PEDIDO'].AsString > '');
        LPedidoImportadoNTV.Caption := format(_('Ya importado en pedido + %s'), [FieldByName['PEDIDO'].AsString]);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMImportarDocumentos.EFClienteNTVChange(Sender: TObject);
begin
  inherited;
  ETituloClienteNTV.Text := DameTituloCliente(StrToIntDef(EFClienteNTV.Text, 0));
end;

procedure TFMImportarDocumentos.EFAgenteNTVChange(Sender: TObject);
begin
  inherited;
  ETituloAgenteNTV.Text := DameTituloAgente(StrToIntDef(EFAgenteNTV.Text, 0));
end;

procedure TFMImportarDocumentos.ETituloAgenteNTVChange(Sender: TObject);
begin
  inherited;
  if (Trim(ETituloAgenteNTV.Text) = '') then
     ColorError(ETituloAgenteNTV)
  else
     ColorInfo(ETituloAgenteNTV);
end;

procedure TFMImportarDocumentos.BVerFicheroNTVClick(Sender: TObject);
begin
  inherited;
  MFicheroNTV.Visible := not MFicheroNTV.Visible;
end;

procedure TFMImportarDocumentos.ETituloClienteNTVChange(Sender: TObject);
begin
  inherited;
  LNIFClienteNTV.Visible := (Trim(ETituloClienteNTV.Text) = '');

  if (Trim(ETituloClienteNTV.Text) = '') then
     ColorError(ETituloClienteNTV)
  else
     ColorInfo(ETituloClienteNTV);
end;

procedure TFMImportarDocumentos.BImportarPedidoNTVClick(Sender: TObject);
var
  i : integer;
  Fichero : string;
  Mensaje, Tipo : string;
  Bloqueo : integer;
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        if (DameTituloCliente(StrToIntDef(EFClienteNTV.Text, 0)) = '') then
           Params.ByName['CLIENTE'].AsInteger := -1
        else
           Params.ByName['CLIENTE'].AsInteger := StrToIntDef(EFClienteNTV.Text, -1);
        ExecQuery;
        Bloqueo := FieldByName['BLOQUEO'].AsInteger;
        Mensaje := FieldByName['MOTIVO_BLOQUEO'].AsString;
        FreeHandle;
     finally
        Free;
     end;

     {0.- Sin mensaje
      1.- Aviso
      2.- Bloquear}
     if (Bloqueo > 0) then
     begin
        Mensaje := _('Motivo') + ': ' + Mensaje;

        if (Bloqueo = 1) then
           Tipo := _('Aviso');

        if (Bloqueo = 2) then
           Tipo := _('Bloqueo');

        Application.MessageBox(PChar(Mensaje), PChar(Tipo), mb_iconinformation + mb_ok);
     end;
  end;

  if (Bloqueo <> 2) then
  begin
     DMMain.MuestraAviso('CLI', DameIDCliente(StrToIntDef(EFClienteSellforge.Text, 0)), 'PEC');

     PMain.Enabled := False;
     try
        FMain.EjecutaAccion(FMain.APedidos);
        with FMPedidos do
        begin
           try
              ImportacionMasiva(True);

              try
                 with NavMain.DataSource.DataSet do
                 begin
                    Insert;
                    if (DameTituloCliente(StrToIntDef(EFClienteNTV.Text, 0)) = '') then
                       FieldByName('CLIENTE').AsInteger := -1
                    else
                       FieldByName('CLIENTE').AsInteger := StrToIntDef(EFClienteNTV.Text, -1);

                    if (DameTituloAgente(StrToIntDef(EFAgenteNTV.Text, 0)) <> '') then
                       FieldByName('AGENTE').AsInteger := StrToIntDef(EFAgenteNTV.Text, -1);

                    FieldByName('FECHA').AsDateTime := DEFechaPedidoNTV.Date;
                    FieldByName('NOTAS').AsString := StringReplace(Trim(ENotasPedidoNTV.Text), '|', #13#10, [rfReplaceAll]);
                    FieldByName('Z_OBSERVACION').AsString := format(_('Importado %s'), [EFicheroPedidoNTV.Text]);

                    // Se ignora el Descuento Pronto Pago. Tomará el del cliente.
                    // FieldByName('DTO_PP').AsFloat := StrToFloatDec(EDtoPPNTV.Text, '.');
                    FieldByName('DTO_CIAL').AsFloat := StrToFloatDec(EDtoCialNTV.Text, '.');

                    if (StrToFloatDec(EPortesNTV.Text, '.') <> 0) then
                    begin
                       FieldByName('TIPO_PORTES').AsInteger := 4;
                       FieldByName('I_PORTES').AsFloat := StrToFloatDec(EPortesNTV.Text, '.');
                    end;

                    Post;
                 end;

                 for i := 1 to SGNTV.RowCount - 1 do
                 begin
                    with NavDetalle.DataSource.DataSet do
                    begin
                       Insert;
                       Application.ProcessMessages;

                       if (DameTituloArticulo(Trim(SGNTV.Cells[4, i])) = '') then
                          FieldByName('ARTICULO').AsString := REntorno.ArtTextoLibre
                       else
                          FieldByName('ARTICULO').AsString := Trim(SGNTV.Cells[4, i]);

                       // if (Trim(SGNTV.Cells[1, i]) > '') then
                       //    FieldByName('TITULO').AsString := Trim(SGNTV.Cells[1, i]);

                       Application.ProcessMessages;
                       FieldByName('UNIDADES').AsFloat := StrToFloatDec(SGNTV.Cells[5, i], '.');
                       FieldByName('PRECIO').AsFloat := StrToFloatDec(SGNTV.Cells[6, i], '.');
                       FieldByName('DESCUENTO').AsFloat := StrToFloatDec(SGNTV.Cells[8, i], '.');
                       FieldByName('DESCUENTO_2').AsFloat := StrToFloatDec(SGNTV.Cells[9, i], '.');
                       Post;
                       Application.ProcessMessages;
                    end;
                 end;

                 Fichero := IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + EFicheroPedidoNTV.Text;
                 if CopyFileTo(Fichero, ChangeFileExt(Fichero, FormatDateTime('_yyyymmdd-hhnnss', Now) + '.bak')) then
                    DeleteFile(PChar(Fichero))
                 else
                    ShowMessage(_('ERROR - No se ha podido renombrar el fichero'));
              except
                 on e: Exception do
                    ShowMessage(_('Error creando pedido') + #13#10 + E.Message);
              end;
           finally
              ImportacionMasiva(False);
           end;
        end;
     finally
        PMain.Enabled := True;
     end;

     // Refresco lista de ficheros
     ARefrescarDatos.Execute;
  end;
end;

procedure TFMImportarDocumentos.SGNTVDblClick(Sender: TObject);
begin
  inherited;
  if (Columna = 5) then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO=''' + SGNTV.Cells[Columna, Linea] + ''' AND EJERCICIO=' + REntorno.EjercicioStr);
  end;
end;

procedure TFMImportarDocumentos.SGNTVDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  cc : TColor;
begin
  inherited;

  with SGNTV do
  begin
     if ((ACol = 4) and (ARow > 0)) then
     begin
        cc := Canvas.Pen.Color;
        if (DameTituloArticulo(Cells[ACol, ARow]) = '') then
           Canvas.Pen.Color := clRed
        else
           Canvas.Pen.Color := REntorno.ColorEnlaceActivo;

        Canvas.Pen.Width := 4;
        Canvas.MoveTo(Rect.Left, Rect.Top);
        Canvas.LineTo(Rect.Right, Rect.Top);
        Canvas.LineTo(Rect.Right, Rect.Bottom);
        Canvas.LineTo(Rect.Left, Rect.Bottom);
        Canvas.LineTo(Rect.Left, Rect.Top);
        Canvas.Pen.Color := cc;
     end;
     //.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFMImportarDocumentos.FormActivate(Sender: TObject);
begin
  inherited;
  // Esto borra los grids después de perder el foco durante la importacion de un Excel.
  // PCTipoImportacionChange(Sender);

  // Se ignora el Descuento Pronto Pago. Tomará el del cliente.
  with EDtoPPNTV do
  begin
     Enabled := False;
     Color := clInactiveCaption;
  end;
end;

procedure TFMImportarDocumentos.BSellforgeExpFamiliasClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BSellforgeExpFamilias.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DameTempPath) + 'familias.csv';
     DMImportarDocumentos.SellforgeExpFamilias(Fichero);
     DMImportarDocumentos.EnviarDatosFTP(EHost.Text, StrToIntDef(EPort.Text, 0), EUser.Text, EPassword.Text, '', Fichero);
  finally
     BSellforgeExpFamilias.Caption := _('Familias');
  end;
end;

procedure TFMImportarDocumentos.BSellforgeExpArticulosClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BSellforgeExpArticulos.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DameTempPath) + 'articulos.csv';
     DMImportarDocumentos.SellforgeExpArticulos(Fichero, EFSellforgeExpAlmacen.Text);
     DMImportarDocumentos.EnviarDatosFTP(EHost.Text, StrToIntDef(EPort.Text, 0), EUser.Text, EPassword.Text, '', Fichero);
  finally
     BSellforgeExpArticulos.Caption := _('Articulos');
  end;
end;

procedure TFMImportarDocumentos.BSellforgeExpClientesClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BSellforgeExpClientes.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DameTempPath) + 'clientes.csv';
     DMImportarDocumentos.SellforgeExpClientes(Fichero);
     DMImportarDocumentos.EnviarDatosFTP(EHost.Text, StrToIntDef(EPort.Text, 0), EUser.Text, EPassword.Text, '', Fichero);
  finally
     BSellforgeExpClientes.Caption := _('Clientes');
  end;
end;

procedure TFMImportarDocumentos.BSellforgeExpDireccionesClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BSellforgeExpDirecciones.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DameTempPath) + 'direcciones.csv';
     DMImportarDocumentos.SellforgeExpDirecciones(Fichero);
     DMImportarDocumentos.EnviarDatosFTP(EHost.Text, StrToIntDef(EPort.Text, 0), EUser.Text, EPassword.Text, '', Fichero);
  finally
     BSellforgeExpDirecciones.Caption := _('Direcciones');
  end;
end;

procedure TFMImportarDocumentos.BSellforgeExpTodoClick(Sender: TObject);
begin
  inherited;
  BSellforgeExpClientesClick(Sender);
  BSellforgeExpDireccionesClick(Sender);
  BSellforgeExpArticulosClick(Sender);
  BSellforgeExpFamiliasClick(Sender);
end;

procedure TFMImportarDocumentos.BNTVExpClientesClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpClientes.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'clientes.csv';
     DMImportarDocumentos.NTVExpClientes(Fichero);
  finally
     BNTVExpClientes.Caption := _('Clientes');
  end;
end;

procedure TFMImportarDocumentos.BNTVExpDireccionesClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpDirecciones.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'direcciones.csv';
     DMImportarDocumentos.NTVExpDirecciones(Fichero);
  finally
     BNTVExpDirecciones.Caption := _('Direcciones');
  end;
end;

procedure TFMImportarDocumentos.BNTVExpArticulosClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpArticulos.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'articulos.csv';
     DMImportarDocumentos.NTVExpArticulos(Fichero, EFNTVExpAlmacen.Text);
  finally
     BNTVExpArticulos.Caption := _('Articulos');
  end;
end;

procedure TFMImportarDocumentos.BNTVExpFamiliasClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpFamilias.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'familias.csv';
     DMImportarDocumentos.NTVExpFamilias(Fichero);
  finally
     BNTVExpFamilias.Caption := _('Familias');
  end;
end;

procedure TFMImportarDocumentos.BGuardarConfiguracionNTVClick(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('ImportarDocumentos', 'NTV_RutaExportacion', DENTVRutaExp.Text);
end;

procedure TFMImportarDocumentos.BNTVExpExportarTodoClick(Sender: TObject);
begin
  inherited;
  BNTVExpClientesClick(Sender);
  BNTVExpDireccionesClick(Sender);
  BNTVExpArticulosClick(Sender);
  BNTVExpFamiliasClick(Sender);
  BNTVExpAgentesClick(Sender);
  BNTVExpFormaPagoClick(Sender);
  BNTVExpZonasClick(Sender);
  BNTVExpPortesClick(Sender);
end;

procedure TFMImportarDocumentos.BNTVExpAgentesClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpAgentes.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'agentes.csv';
     DMImportarDocumentos.NTVExpAgentes(Fichero);
  finally
     BNTVExpAgentes.Caption := _('Agentes');
  end;
end;

procedure TFMImportarDocumentos.BNTVExpFormaPagoClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpFormaPago.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'forma_pago.csv';
     DMImportarDocumentos.NTVExpFormaPago(Fichero);
  finally
     BNTVExpFormaPago.Caption := _('Forma Pago');
  end;
end;

procedure TFMImportarDocumentos.BNTVExpZonasClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpZonas.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'zonas.csv';
     DMImportarDocumentos.NTVExpZonas(Fichero);
  finally
     BNTVExpZonas.Caption := _('Zonas');
  end;
end;

procedure TFMImportarDocumentos.BNTVExpPortesClick(Sender: TObject);
var
  Fichero : string;
begin
  inherited;
  try
     BNTVExpPortes.Caption := _('Enviando ...');

     Fichero := IncludeTrailingPathDelimiter(DENTVRutaExp.Text) + 'portes.csv';
     DMImportarDocumentos.NTVExpPortes(Fichero);
  finally
     BNTVExpPortes.Caption := _('Portes');
  end;
end;

procedure TFMImportarDocumentos.SincronizarcionAutomatica(Tipo: string);
var
  Almacen : string;
begin
  if (Tipo = 'Sellforge') then
  begin
     // Vilalta exporta a Sellforge teniendo en cuenta el almacén 001 (Anteriormente tenía en cuenta el 999)
     Almacen := LeeParametro('SINSELL001');
     if Almacen = '' then
        Almacen := REntorno.AlmacenDefecto;

     EFSellforgeExpAlmacen.Text := Almacen;
     BSellforgeExpTodoClick(nil);
  end;
end;

procedure TFMImportarDocumentos.EFSerieVentasLabexChange(Sender: TObject);
begin
  inherited;
  ESerieVentasLabex.Text := DameTituloSerie(EFSerieVentasLabex.Text);
  EscribeDatoIni('ImportarDocumentos', 'SerieVentasLabex', EFSerieVentasLabex.Text);
end;

procedure TFMImportarDocumentos.EFSerieAbonoLabexChange(Sender: TObject);
begin
  inherited;
  ESerieAbonoLabex.Text := DameTituloSerie(EFSerieAbonoLabex.Text);
  EscribeDatoIni('ImportarDocumentos', 'SerieAbonoLabex', EFSerieAbonoLabex.Text);
end;

procedure TFMImportarDocumentos.BImportarLabexClick(Sender: TObject);
var
  i, id_s, id_detalles_s, id_a, Cliente : integer;
  Fecha : TDateTime;
  SuReferencia, Serie : string;
  Cantidad, Precio, Descuento, PorcIVA : double;
  Fichero : string;
begin
  inherited;
  SuReferencia := '';
  id_s := 0;
  id_a := DameIDArticulo(REntorno.ArtTextoLibre);
  PBProgreso.Visible := True;
  PBProgreso.Max := SGLabex.RowCount;
  PBProgreso.Position := 0;
  BImportarLabex.Enabled := False;
  BImportarLabex.Caption := _('Procesando');
  try
     for i := StrToIntDef(ELineasIgnorarLabex.Text, 1) to SGLabex.RowCount - 1 do
     begin
        PBProgreso.Position := i;
        Application.ProcessMessages;

        // Solo importo las que no han sido importadas y tienen cliente creado
        if ((SGLabex.Cells[0, i] > '') and (SGLabex.Cells[SGLabex.ColCount - 1, i] = '0') and (SGLabex.Cells[SGLabex.ColCount - 2, i] <> '0')) then
        begin
           // Reviso si ya he creado la cabecera
           if (SuReferencia <> SGLabex.Cells[0, i]) then
           begin
              SuReferencia := Trim(SGLabex.Cells[0, i]);
              Fecha := StrToDateYYYY_MM_DD(SGLabex.Cells[1, i]);
              Cliente := StrToIntDef(SGLabex.Cells[SGLabex.ColCount - 2, i], 0);

              Serie := EFSerieVentasLabex.Text;
              if (Copy(SuReferencia, 1, 2) = 'AB') then
                 Serie := EFSerieAbonoLabex.Text;

              id_s := DMImportarDocumentos.CreaCabecera(Cliente, Fecha, Serie, SuReferencia);

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE GES_CABECERAS_S ');
                    SQL.Add(' SET ');
                    SQL.Add(' NOTAS = :NOTAS, ');
                    SQL.Add(' Z_OBSERVACION = :Z_OBSERVACION ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_S = :ID_S ');
                    Params.ByName['NOTAS'].AsString := SGLabex.Cells[4, i];
                    Params.ByName['Z_OBSERVACION'].AsString := SGLabex.Cells[7, i];
                    Params.ByName['ID_S'].AsInteger := id_s;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           // Ahora importo lineas
           Cantidad := StrToFloatDec(SGLabex.Cells[10, i], '.');
           Precio := StrToFloatDec(SGLabex.Cells[11, i], '.');
           if (Serie = EFSerieAbonoLabex.Text) then
           begin
              Precio := Precio * (-1);
              Cantidad := Cantidad * (-1);
           end;
           Descuento := StrToFloatDec(SGLabex.Cells[12, i], '.');
           PorcIVA := StrToFloatDec(SGLabex.Cells[13, i], '.');

           id_detalles_s := DMImportarDocumentos.CreaDetalle(id_s, id_a, Copy(SGLabex.Cells[8, i], 1, 256), Cantidad, Precio, Descuento);

           // DET_ARTICULO (SGLabex.Cells[7, i])  -> PRO_NUM_PLANO VARCHAR(35) - Protocolo Financiero Debe ir a la cabecera
           // DET_DESCRIPCION (SGLabex.Cells[8, i]) -> TITULO VARCHAR(256) - Estudio
           // DET_NOTAS (SGLabex.Cells[9, i]) -> NOTAS - Productos
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE GES_DETALLES_S ');
                 SQL.Add(' SET ');
                 SQL.Add(' PRO_NUM_PLANO = :PRO_NUM_PLANO, ');
                 SQL.Add(' TIPO_IVA = :TIPO_IVA, ');
                 SQL.Add(' NOTAS = :NOTAS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_DETALLES_S = :ID_DETALLES_S ');
                 Params.ByName['PRO_NUM_PLANO'].AsString := Copy(SGLabex.Cells[7, i], 1, 35);
                 Params.ByName['TIPO_IVA'].AsInteger := DameTipoIva(PorcIVA);
                 Params.ByName['NOTAS'].AsString := SGLabex.Cells[9, i];
                 Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  finally
     PBProgreso.Visible := False;
     BImportarLabex.Enabled := True;
     BImportarLabex.Caption := _('Importar');
  end;

  if ConfirmaMensaje(_('Desea quitar fichero de la lista?')) then
  begin
     Fichero := IncludeTrailingPathDelimiter(DSDirectorioImportar.Text) + EFicheroLabex.Text;
     if CopyFileTo(Fichero, ChangeFileExt(Fichero, FormatDateTime('_yyyymmdd-hhnnss', Now) + '.bak')) then
        DeleteFile(PChar(Fichero))
     else
        ShowMessage(_('ERROR - No se ha podido renombrar el fichero'));
  end;
end;

procedure TFMImportarDocumentos.ELineasIgnorarLabexChange(Sender: TObject);
var
  LineasIgnorar : integer;
begin
  inherited;

  LineasIgnorar := StrToIntDef(ELineasIgnorarLabex.Text, 1);
  if (LineasIgnorar >= SGLabex.RowCount) then
     SGLabex.RowCount := LineasIgnorar + 1;

  SGLabex.FixedRows := LineasIgnorar;
  EscribeDatoIni('ImportarDocumentos', 'LineasIgnorarLabex', ELineasIgnorarLabex.Text);
end;

procedure TFMImportarDocumentos.SGLabexDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  cc : TColor;
begin
  inherited;

  with SGLabex do
  begin
     if (ARow > StrToIntDef(ELineasIgnorarLabex.Text, 1) - 1) then
     begin
        if (ACol = 0) then
        begin
           cc := Canvas.Pen.Color;
           if (Cells[ColCount - 1, ARow] <> '0') then
           begin
              Canvas.Pen.Color := clRed;
              Canvas.Pen.Width := 4;
              Canvas.MoveTo(Rect.Left, Rect.Top);
              Canvas.LineTo(Rect.Right, Rect.Top);
              Canvas.LineTo(Rect.Right, Rect.Bottom);
              Canvas.LineTo(Rect.Left, Rect.Bottom);
              Canvas.LineTo(Rect.Left, Rect.Top);
              Canvas.Pen.Color := cc;
           end;
        end
        else
        if (ACol = 2) then
        begin
           cc := Canvas.Pen.Color;
           if (Cells[ColCount - 2, ARow] = '0') then
           begin
              Canvas.Pen.Color := clRed;
              Canvas.Pen.Width := 4;
              Canvas.MoveTo(Rect.Left, Rect.Top);
              Canvas.LineTo(Rect.Right, Rect.Top);
              Canvas.LineTo(Rect.Right, Rect.Bottom);
              Canvas.LineTo(Rect.Left, Rect.Bottom);
              Canvas.LineTo(Rect.Left, Rect.Top);
              Canvas.Pen.Color := cc;
           end;
        end;

        //.DefaultDrawColumnCell(Rect,DataCol,Column,State);
     end;
  end;
end;

procedure TFMImportarDocumentos.FormShow(Sender: TObject);
begin
  inherited;
  PCTipoImportacionChange(Sender);
end;

end.
