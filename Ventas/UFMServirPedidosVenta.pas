unit UFMServirPedidosVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UFPEditSimple, UNavigator,
  StdCtrls, Mask, rxToolEdit, ULFDateEdit, ULFLabel, TFlatCheckBoxUnit,
  ULFCheckBox, Buttons, ULFEdit, ULFEditFind2000, DBCtrls, ULFDBMemo,
  ULFDBEdit, Spin;

type
  TFMServirPedidosVenta = class(TFPEditSimple)
     DBGFPedidos: TDBGridFind2000;
     TSep1: TToolButton;
     TButtMarcarTodos: TToolButton;
     TButtDesmarcarTodos: TToolButton;
     TSep2: TToolButton;
     TButtAlbaranar: TToolButton;
     TButtFacturar: TToolButton;
     TButtRefrescar: TToolButton;
     TBSep1: TToolButton;
     LFechaDestino: TLFLabel;
     DEFechaDestino: TLFDateEdit;
     CBCerrarFactura: TLFCheckBox;
     PNLFiltro: TLFPanel;
     EPedidoFiltroHasta: TLFEdit;
     EPedidoFiltroDesde: TLFEdit;
     LPedidoFiltro: TLFLabel;
     LClienteFiltro: TLFLabel;
     EClienteFiltroDesde: TLFEditFind2000;
     EClienteFiltroHasta: TLFEditFind2000;
     SBFiltrar: TSpeedButton;
     EClienteDesde: TLFEdit;
     EClienteHasta: TLFEdit;
     PNLAvisos: TLFPanel;
     LAvisos: TLFLabel;
     DBMAvisos: TLFDBMemo;
     splitter: TSplitter;
     CBSoloListoPreparar: TLFCheckBox;
     LRuta: TLFLabel;
     ERutaFiltro: TLFEdit;
     TButtTraspasarSegunConf: TToolButton;
     CBOrdenRuta: TLFCheckBox;
     CBImprimirDocDestino: TLFCheckBox;
     LFechaPrev: TLFLabel;
     DEFechaPrevDesde: TLFDateEdit;
     DEFechaPrevHasta: TLFDateEdit;
     SBDiaAnterior: TSpeedButton;
     SBSemana: TSpeedButton;
     SBDiaSiguiente: TSpeedButton;
     SBDia: TSpeedButton;
     DEFechaContabilizacion: TLFDateEdit;
     LFechaContabilizacion: TLFLabel;
     CBFechaEntregaPrev: TLFCheckBox;
     CBFechaPedido: TLFCheckBox;
     PNLDetalle: TLFPanel;
     PNLPedidos: TLFPanel;
     splitter2: TSplitter;
     DBGDetalle: TDBGridFind2000;
     BVerDetalle: TButton;
     PNLTrasporte: TLFPanel;
     EFTransportista: TLFEditFind2000;
     LTransportista: TLFLabel;
     ETransportista: TLFEdit;
     LPortes: TLFLabel;
     LServicio: TLFLabel;
     LBultos: TLFLabel;
     CBPortes: TComboBox;
     CBServicio: TComboBox;
     EBultos: TLFEdit;
     LHorario: TLFLabel;
     CBHorario: TComboBox;
     LPeso: TLFLabel;
     EPeso: TLFEdit;
     TBSep2: TToolButton;
     BAlbaranYEtiqTransporte: TButton;
     DBTDireccion: TDBText;
     DBTLocalidad: TDBText;
     DBTPais: TDBText;
     DBTCodigoPostal: TDBText;
     DBTProvincia: TDBText;
     DBEIdDoc: TLFDbedit;
     seCopiasImprimir: TSpinEdit;
     PNLTrasportes: TLFPanel;
     PNLImagenArticulo: TLFPanel;
     IImagenArticulo: TImage;
     DBEIdArt: TLFDbedit;
     tmrImagenArticulo: TTimer;
     Splitter1: TSplitter;
     BVisualizarEtiqGLS: TButton;
     LCantidadPedidos: TLFLabel;
     EFOrigenDocumento: TLFEditFind2000;
     EOrigenDocumentoTitulo: TLFEdit;
     LOrigenDocumento: TLabel;
     LExpedicion: TLFLabel;
     DEExpedicion: TLFDateEdit;
     BReimprimirEtiqGLS: TButton;
     LUltimaEtiqueta: TLFLabel;
     LInfoUltimaEtiqueta: TLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFPedidosBusqueda(Sender: TObject);
     procedure TButtMarcarTodosClick(Sender: TObject);
     procedure TButtDesmarcarTodosClick(Sender: TObject);
     procedure TButtAlbaranarClick(Sender: TObject);
     procedure TButtFacturarClick(Sender: TObject);
     procedure DBGFPedidosDblClick(Sender: TObject);
     procedure DBGFPedidosCellClick(Column: TColumn);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure SBFiltrarClick(Sender: TObject);
     procedure EFiltroKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EClienteFiltroDesdeChange(Sender: TObject);
     procedure EClienteFiltroHastaChange(Sender: TObject);
     procedure CBSoloListoPrepararChange(Sender: TObject);
     procedure TButtTraspasarSegunConfClick(Sender: TObject);
     procedure SBDiaClick(Sender: TObject);
     procedure SBDiaSiguienteClick(Sender: TObject);
     procedure SBDiaAnteriorClick(Sender: TObject);
     procedure SBSemanaClick(Sender: TObject);
     procedure CBFechaEntregaPrevChange(Sender: TObject);
     procedure CBFechaPedidoChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure BVerDetalleClick(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure DBGDetalleDblClick(Sender: TObject);
     procedure BAlbaranYEtiqTransporteClick(Sender: TObject);
     procedure DBEIdDocChange(Sender: TObject);
     procedure DBEIdArtChange(Sender: TObject);
     procedure tmrImagenArticuloTimer(Sender: TObject);
     procedure BVisualizarEtiqGLSClick(Sender: TObject);
     procedure DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EFTransportistaChange(Sender: TObject);
     procedure EFOrigenDocumentoChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     Param_MODSINC003: boolean;
     Param_PECSERV001: boolean;
     FicherosEtiquetas: TStrings;
     Automatico: boolean;
     TransportistaSEUR, TransportistaIDRIL, TransportistaDHL: integer;
     procedure Filtra;
     procedure EstableceVisibilidadStockAlmacen;
     procedure ConfiguraIDRIL;
     procedure ConfiguraSEUR;
     procedure ConfiguraDHL;
  public
     { Public declarations }
  end;

var
  FMServirPedidosVenta : TFMServirPedidosVenta;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, UDMServirPedidosVenta, UFMain, DateUtils, UParam, UFMSeleccion, IniFiles, ShellAPI, HYFIBQuery, idGlobalProtocols,
  UDMAdjunto, UDMSEUR, UDMIDRIL, UDMDHL, FIBDataSet, UImagenes;

{$R *.dfm}

procedure TFMServirPedidosVenta.FormCreate(Sender: TObject);
var
  RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF : string;
begin
  inherited;
  AbreData(TDMServirPedidosVenta, DMServirPedidosVenta);
  NavMain.DataSource := DMServirPedidosVenta.DSQMPedidos;
  DBGFPedidos.DataSource := DMServirPedidosVenta.DSQMPedidos;

  Automatico := False;
  FicherosEtiquetas := TStringList.Create;
  Param_MODSINC003 := (LeeParametro('MODSINC003') = 'S');
  Param_PECSERV001 := (LeeParametro('PECSERV001') = 'S');

  DBGFPedidos.ColumnasChecked.Strings[DBGFPedidos.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] := IntToStr(REntorno.Entrada);
  ColActual := DBGFPedidos.Columns[0];
  DEFechaDestino.Date := REntorno.FechaTrab;
  DEFechaContabilizacion.Date := REntorno.FechaTrab;
  GetBitmapFromImageList(SBFiltrar, 1, DMMain.ILMain_Ac, 5);

  DEFechaPrevDesde.Date := EncodeDate(REntorno.Ejercicio - 1, 01, 01);
  if (LeeParametro('PECSERV002') = 'S') then
     DEFechaPrevHasta.Date := Today
  else
     DEFechaPrevHasta.Date := EncodeDate(REntorno.Ejercicio, 12, 31);

  GetBitmapFromImageList(SBDiaAnterior, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(SBDiaAnterior, 2, DMMain.ILMain_In, 51);
  GetBitmapFromImageList(SBSemana, 1, DMMain.ILMain_Ac, 50);
  GetBitmapFromImageList(SBSemana, 2, DMMain.ILMain_In, 50);
  GetBitmapFromImageList(SBDia, 1, DMMain.ILMain_Ac, 9);
  GetBitmapFromImageList(SBDia, 2, DMMain.ILMain_In, 9);
  GetBitmapFromImageList(SBDiaSiguiente, 1, DMMain.ILMain_Ac, 25);
  GetBitmapFromImageList(SBDiaSiguiente, 2, DMMain.ILMain_In, 25);

  // GLS - Inicializo INI con datos de remitente de la empresa
  DMServirPedidosVenta.DameDireccionTercero(REntorno.Tercero, 0, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF);

  Nombre := LeeDatoIni('GLS', 'Remitente-Nombre', RazonSocial);
  Direccion := LeeDatoIni('GLS', 'Remitente-Direccion', Direccion);
  Poblacion := LeeDatoIni('GLS', 'Remitente-Poblacion', Poblacion);
  Pais := LeeDatoIni('GLS', 'Remitente-Pais', '34');
  CP := LeeDatoIni('GLS', 'Remitente-CP', CP);
  Telefono := LeeDatoIni('GLS', 'Remitente-Telefono', Telefono);
  Movil := LeeDatoIni('GLS', 'Remitente-Movil', Movil);
  Email := LeeDatoIni('GLS', 'Remitente-Email', Email);
  Departamento := LeeDatoIni('GLS', 'Remitente-Departamento', Departamento);
  Observaciones := LeeDatoIni('GLS', 'Remitente-Observaciones', Observaciones);

  EscribeDatoIni('GLS', 'Remitente-Nombre', Nombre);
  EscribeDatoIni('GLS', 'Remitente-Direccion', Direccion);
  EscribeDatoIni('GLS', 'Remitente-Poblacion', Poblacion);
  EscribeDatoIni('GLS', 'Remitente-Pais', Pais);
  EscribeDatoIni('GLS', 'Remitente-CP', CP);
  EscribeDatoIni('GLS', 'Remitente-Telefono', Telefono);
  EscribeDatoIni('GLS', 'Remitente-Movil', Movil);
  EscribeDatoIni('GLS', 'Remitente-Email', Email);
  EscribeDatoIni('GLS', 'Remitente-Departamento', Departamento);
  EscribeDatoIni('GLS', 'Remitente-Observaciones', Observaciones);

  // DHL
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACREEDOR FROM DHL_CONFIGURACION WHERE EMPRESA = :EMPRESA ORDER BY ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        TransportistaDHL := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // SEUR
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACREEDOR FROM SEUR_CONFIGURACION WHERE EMPRESA = :EMPRESA ORDER BY ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        TransportistaSEUR := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // IDRIL (GLS)
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACREEDOR FROM IDRIL_CONFIGURACION WHERE EMPRESA = :EMPRESA ORDER BY ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        TransportistaIDRIL := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  EBultos.Text := '1';

  DEExpedicion.Date := Today;

  EstableceVisibilidadStockAlmacen;

  LInfoUltimaEtiqueta.Caption := '';

  Filtra;
end;

procedure TFMServirPedidosVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FicherosEtiquetas.Free;
  CierraData(DMServirPedidosVenta);
end;

procedure TFMServirPedidosVenta.FormShow(Sender: TObject);
begin
  inherited;
  // Controla que componentes deben estar habilitados
  CBFechaEntregaPrevChange(Sender);
  CBFechaPedidoChange(Sender);
  EFTransportistaChange(Sender);
  DBEIdDocChange(Sender);

  case BVerDetalle.Tag of
     0: BVerDetalle.Caption := _('Ver Det.');
     1: BVerDetalle.Caption := _('Ocultar Det.');
  end;

  PNLDetalle.Visible := (BVerDetalle.Tag = 1);
  splitter2.Visible := (BVerDetalle.Tag = 1);
  // Inicio refresco de imagen si se ve eldetalle
  tmrImagenArticulo.Enabled := (BVerDetalle.Tag = 1);
end;

procedure TFMServirPedidosVenta.DBGFPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Fecha : TDateTime;
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'EJERCICIO') or
     (UpperCase(Column.FieldName) = 'SERIE') or
     (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMServirPedidosVenta.QMPedidosESTADO.AsInteger <> 0) then
           ColorInactivo(Canvas)
        else
        begin
           if (Column.FieldName = 'CANAL_DST_PEC') then
           begin
              if (DMServirPedidosVenta.QMPedidosCANAL_DST_PEC.AsInteger <> 0) then
              begin
                 if (DMServirPedidosVenta.QMPedidosCANAL_DST_PEC.AsInteger <> DMServirPedidosVenta.QMPedidosCANAL.AsInteger) then
                    ColorResaltado(Canvas);
              end;
           end
           else
           if (Column.FieldName = 'SERIE_DST_PEC') then
           begin
              if (DMServirPedidosVenta.QMPedidosSERIE_DST_PEC.AsString <> '') then
              begin
                 if (DMServirPedidosVenta.QMPedidosSERIE_DST_PEC.AsString <> DMServirPedidosVenta.QMPedidosSERIE.AsString) then
                    ColorResaltado(Canvas);
              end;
           end
           else
           if (Column.FieldName = 'TIPO_DST_PEC') then
           begin
              if (DMServirPedidosVenta.QMPedidosTIPO_DST_PEC.AsString <> '') then
                 ColorResaltado(Canvas);
           end
           else
           if (Column.FieldName = 'FECHA_ENTREGA_PREV') then
           begin
              Fecha := DMServirPedidosVenta.QMPedidosFECHA_ENTREGA_PREV.AsDateTime;
              if (Fecha < Today) then
                 ColorError(Canvas)
              else
              if (Fecha >= Today) and (Fecha < Tomorrow) then
                 ColorResaltado(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if Param_MODSINC003 and ((Column.FieldName = 'LIQUIDO') or (Column.FieldName = 'TOTAL_PRESTASHOP')) and (Abs(DMServirPedidosVenta.QMPedidosLIQUIDO.AsFloat - DMServirPedidosVenta.QMPedidosTOTAL_PRESTASHOP.AsFloat) >= 0.01) then
           begin
              ColorError(Canvas);
           end
           else
           if (DMServirPedidosVenta.QMPedidosENTRADA_AGRUPACION.AsInteger = REntorno.Entrada) then
           begin
              ColorResaltado2(Canvas);
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMServirPedidosVenta.DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMServirPedidosVenta.QMPedidosESTADO.AsInteger <> 0) then
           ColorInactivo(Canvas)
        else
        if (DMServirPedidosVenta.QMDetalleSERVIDO.AsInteger = 1) then
           ColorInactivo(Canvas)
        else
        if (DMServirPedidosVenta.QMDetalleUNIDADES_PENDIENTES.AsFloat <= 0) then
           ColorInactivo(Canvas)
        else
        begin
           if (Column.FieldName = 'LOTE_SIMPLE') then
           begin
              if (Trim(DMServirPedidosVenta.QMDetalleLOTE_SIMPLE.AsString) > '') then
                 ColorResaltado2(Canvas)
              else
              if (DMServirPedidosVenta.QMDetalleREQUIERE_LOTE_SIMPLE.AsInteger = 1) then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'UNIDADES') then
           begin
              if Param_PECSERV001 and (DMServirPedidosVenta.QMDetalleUNIDADES.AsFloat <> 1) then
                 ColorResaltado4(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'UNIDADES_PENDIENTES') then
           begin
              if Param_PECSERV001 and (DMServirPedidosVenta.QMDetalleUNIDADES_PENDIENTES.AsFloat <> 1) then
                 ColorResaltado4(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'STOCK_ALM') then
           begin
              if (DMServirPedidosVenta.QMDetalleUNIDADES.AsFloat > DMServirPedidosVenta.QMDetalleSTOCK_ALM.AsFloat) then
                 ColorError(Canvas)
              else
                 ColorInfo(Canvas);
           end
           else
           if (Column.FieldName = 'PRECIO') then
           begin
              if (DMServirPedidosVenta.QMDetallePRECIO.AsFloat = 0) then
                 ColorBloqueado(Canvas);
           end
           else
           if Param_MODSINC003 then
           begin
              if ((Column.FieldName = 'LIQUIDO') or (Column.FieldName = 'TOTAL_PRESTASHOP')) then
              begin
                 if (DMServirPedidosVenta.QMPedidosLIQUIDO.AsFloat <> DMServirPedidosVenta.QMPedidosTOTAL_PRESTASHOP.AsFloat) then
                    ColorError(Canvas)
                 else
                    ColorInfo(Canvas);
              end
              else
              if Param_MODSINC003 then
              begin
                 if (Abs(DMServirPedidosVenta.QMPedidosLIQUIDO.AsFloat - DMServirPedidosVenta.QMPedidosTOTAL_PRESTASHOP.AsFloat) >= 0.01) then
                    ColorBloqueado(Canvas)
                 else
                    ColorInfo(Canvas);
              end;
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMServirPedidosVenta.DBGFPedidosBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if (Trim(TablaABuscar) = 'VER_CANALES_ACTIVOS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TITULO';
     end
     else
     if (Trim(TablaABuscar) = 'VER_SERIES') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL= ' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TITULO';
     end
     else
     if (Trim(TablaABuscar) = 'SYS_TIPO_MOVIMIENTO') then
     begin
        CondicionBusqueda := 'TIPO IN(''ALB'', ''FAC'')';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TIPO';
     end
     else
     begin
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TFMServirPedidosVenta.TButtMarcarTodosClick(Sender: TObject);
begin
  inherited;
  DMServirPedidosVenta.MarcarTodos(REntorno.Entrada);
end;

procedure TFMServirPedidosVenta.TButtDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  DMServirPedidosVenta.MarcarTodos(0);
end;

procedure TFMServirPedidosVenta.TButtAlbaranarClick(Sender: TObject);
var
  FechaDestino : TDateTime;
  CopiasImprimir : integer;
begin
  inherited;

  FechaDestino := DEFechaDestino.Date;
  if CBFechaEntregaPrev.Checked then
     FechaDestino := DMServirPedidosVenta.QMPedidosFECHA_ENTREGA_PREV.AsDateTime
  else
  if CBFechaPedido.Checked then
     FechaDestino := DMServirPedidosVenta.QMPedidosFECHA.AsDateTime;

  CopiasImprimir := 0;
  if (CBImprimirDocDestino.Checked) then
     CopiasImprimir := seCopiasImprimir.Value;

  DMServirPedidosVenta.Servir('ALB', CBCerrarFactura.Checked, FechaDestino, DEFechaContabilizacion.Date, CopiasImprimir, Automatico, StrToIntDef(EFTransportista.Text, 0));

  Filtra;
end;

procedure TFMServirPedidosVenta.TButtFacturarClick(Sender: TObject);
var
  FechaDestino : TDateTime;
  CopiasImprimir : integer;
begin
  inherited;

  FechaDestino := DEFechaDestino.Date;
  if CBFechaEntregaPrev.Checked then
     FechaDestino := DMServirPedidosVenta.QMPedidosFECHA_ENTREGA_PREV.AsDateTime
  else
  if CBFechaPedido.Checked then
     FechaDestino := DMServirPedidosVenta.QMPedidosFECHA.AsDateTime;

  CopiasImprimir := 0;
  if (CBImprimirDocDestino.Checked) then
     CopiasImprimir := seCopiasImprimir.Value;

  DMServirPedidosVenta.Servir('FAC', CBCerrarFactura.Checked, FechaDestino, DEFechaContabilizacion.Date, CopiasImprimir);

  Filtra;
end;

procedure TFMServirPedidosVenta.DBGFPedidosDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'EJERCICIO') or (UpperCase(ColActual.FieldName) = 'RIG') or (UpperCase(ColActual.FieldName) = 'SERIE')) then
     FMain.TraspasoDeDocumentosSalida(DMServirPedidosVenta.QMPedidosID_S.AsInteger);
  if ((UpperCase(ColActual.FieldName) = 'CLIENTE')) then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMServirPedidosVenta.QMPedidosCLIENTE.AsInteger));
end;

procedure TFMServirPedidosVenta.DBGFPedidosCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMServirPedidosVenta.Filtra;
begin
  DMServirPedidosVenta.Filtra(StrToIntDef(EPedidoFiltroDesde.Text, 0), StrToIntDef(EPedidoFiltroHasta.Text, 0), StrToIntDef(EClienteFiltroDesde.Text, 0), StrToIntDef(EClienteFiltroHasta.Text, 0), CBSoloListoPreparar.Checked, StrToIntDef(ERutaFiltro.Text, 0), CBOrdenRuta.Checked, DEFechaPrevDesde.Date, DEFechaPrevHasta.Date, EFOrigenDocumento.Text);
  LCantidadPedidos.Caption := format(_('Cant. Pedidos: %d'), [DMServirPedidosVenta.QMPedidos.RecordCount]);
end;

procedure TFMServirPedidosVenta.TButtRefrescarClick(Sender: TObject);
begin
  inherited;
  Filtra;
end;

procedure TFMServirPedidosVenta.SBFiltrarClick(Sender: TObject);
begin
  inherited;
  Filtra;
end;

procedure TFMServirPedidosVenta.EFiltroKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     Filtra;
end;

procedure TFMServirPedidosVenta.EClienteFiltroDesdeChange(Sender: TObject);
begin
  inherited;
  EClienteDesde.Text := DameTituloCliente(StrToIntDef(EClienteFiltroDesde.Text, 0));
end;

procedure TFMServirPedidosVenta.EClienteFiltroHastaChange(Sender: TObject);
begin
  inherited;
  EClienteHasta.Text := DameTituloCliente(StrToIntDef(EClienteFiltroHasta.Text, 0));
end;

procedure TFMServirPedidosVenta.CBSoloListoPrepararChange(Sender: TObject);
begin
  inherited;
  Filtra;
end;

procedure TFMServirPedidosVenta.TButtTraspasarSegunConfClick(Sender: TObject);
var
  FechaDestino : TDateTime;
  CopiasImprimir : integer;
begin
  inherited;

  FechaDestino := DEFechaDestino.Date;
  if CBFechaEntregaPrev.Checked then
     FechaDestino := DMServirPedidosVenta.QMPedidosFECHA_ENTREGA_PREV.AsDateTime
  else
  if CBFechaPedido.Checked then
     FechaDestino := DMServirPedidosVenta.QMPedidosFECHA.AsDateTime;

  CopiasImprimir := 0;
  if (CBImprimirDocDestino.Checked) then
     CopiasImprimir := seCopiasImprimir.Value;

  DMServirPedidosVenta.Servir('', CBCerrarFactura.Checked, FechaDestino, DEFechaContabilizacion.Date, CopiasImprimir);

  Filtra;
end;

procedure TFMServirPedidosVenta.SBDiaClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaPrevDesde, DEFechaPrevHasta, 'DIA');
end;

procedure TFMServirPedidosVenta.SBDiaSiguienteClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaPrevDesde, DEFechaPrevHasta, 'D+');
end;

procedure TFMServirPedidosVenta.SBDiaAnteriorClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaPrevDesde, DEFechaPrevHasta, 'D-');
end;

procedure TFMServirPedidosVenta.SBSemanaClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFechaPrevDesde, DEFechaPrevHasta, 'SEM');
end;

procedure TFMServirPedidosVenta.CBFechaEntregaPrevChange(Sender: TObject);
begin
  inherited;
  DEFechaDestino.Enabled := not (CBFechaEntregaPrev.Checked or CBFechaPedido.Checked);
  if CBFechaEntregaPrev.Checked then
     CBFechaPedido.Checked := False;
end;

procedure TFMServirPedidosVenta.CBFechaPedidoChange(Sender: TObject);
begin
  inherited;
  DEFechaDestino.Enabled := not (CBFechaEntregaPrev.Checked or CBFechaPedido.Checked);
  if CBFechaPedido.Checked then
     CBFechaEntregaPrev.Checked := False;
end;

procedure TFMServirPedidosVenta.BVerDetalleClick(Sender: TObject);
begin
  inherited;
  case BVerDetalle.Tag of
     0: BVerDetalle.Tag := 1;
     1: BVerDetalle.Tag := 0;
  end;

  case BVerDetalle.Tag of
     0: BVerDetalle.Caption := _('Ver Det.');
     1: BVerDetalle.Caption := _('Ocultar Det.');
  end;

  PNLDetalle.Visible := (BVerDetalle.Tag = 1);
  splitter2.Visible := (BVerDetalle.Tag = 1);

  // Inicio refresco de imagen si se ve eldetalle
  tmrImagenArticulo.Enabled := (BVerDetalle.Tag = 1);
end;

procedure TFMServirPedidosVenta.FormActivate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  // Modulo Prestashop habilitado
  i := EncuentraField(DBGFPedidos, 'TOTAL_PRESTASHOP');
  if (i >= 0) then
     DBGFPedidos.Columns.Items[i].Visible := Param_MODSINC003;

  if Param_MODSINC003 then
  begin
     i := EncuentraField(DBGFPedidos, 'LIQUIDO');
     if (i >= 0) then
        DBGFPedidos.Columns.Items[i].Visible := Param_MODSINC003;
  end;

  EstableceVisibilidadStockAlmacen;
end;

procedure TFMServirPedidosVenta.DBGDetalleDblClick(Sender: TObject);
var
  Valor : string;
begin
  inherited;
  if PideDato('STR', Valor, 'Nro. de Serie') then
  begin
     DMServirPedidosVenta.AsignaLoteSimple(Valor);
  end;
end;

procedure TFMServirPedidosVenta.BAlbaranYEtiqTransporteClick(Sender: TObject);
var
  ImprimirDocDestino : boolean;
  IdPEC, IdALB, Bultos, IdServicio : integer;
  SuReferencia : string;
  Peso : double;
  Transportista : integer;
  // IDRIL
  Expedicion : string;
  FicheroPeticion, FicheroRespuesta, RespuestaError, FicheroRespuestaSOAPRequest, FicheroRespuestaSOAPResponse : string;
  HoraEnvioFichero : TDateTime;
  Servicio, Horario : string;
  Resultado : word;
  TerceroAlb, DireccionAlb : integer;
  RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, ZRefCliente : string;
  i : integer;
  sl : TStrings;
  // SEUR
  Servicecode, ProductCode : integer;
  shipmentCode, RutaCopiaEtiqueta : string;
  Moneda, exportPaymentType, importPaymentType : string;
  Bruto : double;
  Ficheros : TStrings;
  Comando, Argumentos : string;
  InfoPedido : string;
  ResultadoEnvio : string;
  Tarifa : string;
  // DHL
  DHL_ProductCode, DHL_LocalProductCode : string;
  isCustomsDeclarable : boolean;
  incoterm : string;
  PerteneceCEE : boolean;
  Cliente : integer;
  manufacturerCountry : string;
  InvoiceNumber : string;
  InvoiceDate : TDateTime;
  PaisC2Tercero, NIF : string;
  registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode : string;
  Length, Height, Width, weight : integer;
begin
  inherited;
  Bultos := StrToIntDef(EBultos.Text, -1);
  Peso := StrToFloatDef(EPeso.Text, -1);

  if (DMServirPedidosVenta.CantidadMarcados <> 1) then
     ShowMessage(_('Solo se puede servir de a un solo pedido en esta opcion'))
  else
  if (not DMServirPedidosVenta.LotesSimplesAsignados) then
     ShowMessage(_('Falta asignar Nro. Serie / Lote'))
  else
  if (Bultos = -1) then
     ShowMessage(_('La cantidad de bultos no esta definida'))
  else
  if (Peso = -1) then
     ShowMessage(_('El peso no esta definido'))
  else
  begin
     ImprimirDocDestino := CBImprimirDocDestino.Checked;
     try
        with DMServirPedidosVenta.QMPedidos do
        begin
           InfoPedido := format(_('Pedido: %s / %d - ($s)'), [FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger, FieldByName('SU_REFERENCIA').AsString]);
           InfoPedido := InfoPedido + #13#10 + format(_('%s'), [FieldByName('NOMBRE_R_SOCIAL').AsString]);
        end;

        CBImprimirDocDestino.Checked := True;
        Posicionar(DMServirPedidosVenta.QMPedidos, 'ENTRADA_AGRUPACION', REntorno.Entrada);
        Transportista := StrToIntDef(EFTransportista.Text, 0);
        IdPEC := DMServirPedidosVenta.QMPedidos.FieldByName('ID_S').AsInteger;
        SuReferencia := DMServirPedidosVenta.QMPedidos.FieldByName('SU_REFERENCIA').AsString;
        Observaciones := DMServirPedidosVenta.QMPedidosZ_OBSERVACION.AsString;
        ZRefCliente := DMServirPedidosVenta.QMPedidosPEDIDO_CLIENTE.AsString;
        IdServicio := CBServicio.ItemIndex;
        Servicio := Trim(Copy(CBServicio.Text, 1, Pos('-', CBServicio.Text) - 1));
        Horario := Trim(Copy(CBHorario.Text, 1, Pos('-', CBHorario.Text) - 1));
        RutaCopiaEtiqueta := IncludeTrailingPathDelimiter(LeeDatoIni('SEUR', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
        Moneda := DMServirPedidosVenta.QMPedidos.FieldByName('MONEDA').AsString;
        exportPaymentType := 'P'; // SEUR - (D=Debidos o P=Pagados)
        importPaymentType := 'P'; // SEUR - (D=Debidos o P=Pagados)
        Bruto := DMServirPedidosVenta.QMPedidos.FieldByName('BRUTO').AsFloat;
        Tarifa := DMServirPedidosVenta.QMPedidos.FieldByName('TARIFA').AsString;
        PerteneceCEE := (DMServirPedidosVenta.QMDireccionPERTENECE_CEE.AsInteger = 1);
        Cliente := DMServirPedidosVenta.QMPedidosCLIENTE.AsInteger;
        DMServirPedidosVenta.DameDatosCliente(Cliente, incoterm);

        try
           Automatico := True;
           TButtAlbaranar.Click;
        finally
           Automatico := False;
        end;

        DMServirPedidosVenta.DameAlbaranDestino(IdPEC, IdALB, TerceroAlb, DireccionAlb);

        if (TransportistaDHL <> 0) and (Transportista = TransportistaDHL) then
        begin

           DMServirPedidosVenta.DameDireccionTercero(TerceroAlb, DireccionAlb, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF);

           weight := Trunc(Peso);
           if (weight <= 0) then
              weight := 1;
           Length := 1;
           Height := 1;
           Width := 1;

           isCustomsDeclarable := ((not PerteneceCEE) and (Pais_C2 <> 'ES'));

           AbreData(TDMDHL, DMDHL);
           try
              DMDHL.WS_Inicializa(TransportistaDHL, False);

              DMDHL.rates(DHL_ProductCode, DHL_LocalProductCode,
                 Pais_C2,
                 CP,
                 Poblacion,
                 weight,
                 Length,
                 Height,
                 Width,
                 Now,
                 isCustomsDeclarable);
           finally
              CierraData(DMDHL);
           end;

           AbreData(TDMDHL, DMDHL);
           try
              DMDHL.WS_Inicializa(Transportista, False);

              DMDHL.NuevoEnvio(DHL_ProductCode, DHL_LocalProductCode, False, IntToStr(IdPEC));
              DMDHL.NuevoOutputImages('label', '', False);

              if isCustomsDeclarable then
                 DMDHL.NuevoOutputImages('invoice', '', True);

              // DHL nos dirá que poner aquí.
              // DMDHL.NuevoValueAddedServices('II', 10, 'USD');

              {
              DMDHL.customerDetails_shipperDetails('526238', 'Zhaoqing', 'CN', '', '4FENQU, 2HAOKU, WEIPINHUI WULIU YUAN, DAWANG', 'GAOXIN QU, BEIJIANG DADAO, SIHUI,', 'ZHAOQING, GUANDONG', 'SIHUI', '', 'CHINA, PEOPLES REPUBLIC',
                 'shipper_create_shipmentapi@dhltestmail.com', '18211309039', '18211309039', 'Cider BookStore', 'LiuWeiMing',
                 'SDT', 'CN123456789', 'CN',
                 'Bank of China', 'RMB', 'USD', 'business');
              }
              // Rellena los datos de Shipper automaticamente con los del formulario de configuracion
              DMDHL.customerDetails_shipperDetails_auto;

              {
              DMDHL.customerDetails_receiverDetails(postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode: string);
              DMDHL.customerDetails_receiverDetails('76449', 'Graford', 'US', '', '116 Marine Dr', '', '', '', '', 'UNITED STATES OF AMERICA',
                 'recipient_create_shipmentapi@dhltestmail.com', '9402825665', '9402825666', 'Baylee Marshall', 'Baylee Marshall',
                 'SSN', 'US123456789', 'US',
                 'Bank of America', 'USD', 'USD', 'business');
              }
              registrationNumber_typeCode := 'VAT';
              registrationNumber_number := NIF;
              registrationNumber_issuerCountryCode := PaisC2Tercero;
              DMDHL.customerDetails_receiverDetails(CP, Poblacion, Pais_C2, '', Direccion, '', '', '', Provincia, DameTituloPais(DamePais(Pais_C2)), Email, Telefono, Movil, RazonSocial, RazonSocial, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, '', '', '', 'private');

              {
              DMDHL.Contenido(isCustomsDeclarable: boolean; declaredValue: double; declaredValueCurrency, description, USFilingTypeValue, incoterm, unitOfMeasurement: string);
              DMDHL.Contenido(True, 120, 'USD', 'Shipment', '12345', 'DAP', 'metric');
              }
              DMServirPedidosVenta.DameDatosCliente(Cliente, incoterm);
              DMDHL.Contenido(isCustomsDeclarable, Bruto, Moneda, 'Shipment', '', incoterm, '');

              {
              DMDHL.NuevoPaquete(typeCode: string; weight, Length, Width, Height: double; customerReference_value, customerReference_typeCode, description, labelDescription: string);
              DMDHL.NuevoPaquete('2BP', 0.5, 1, 1, 1, '3654673', 'CU', 'Piece content description', 'bespoke label description');
              }
              for i := 1 to Bultos do
                 DMDHL.NuevoPaquete('', Peso, 1, 1, 1, format('Bulto_%d_%d', [IdALB, i]), '', format('Bulto %d_%d', [IdALB, i]), '');

              if isCustomsDeclarable then
              begin
                 with TFIBDataSet.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       Transaction := DameTransactionRO(DMMain.DataBase);
                       try
                          if (not Transaction.InTransaction) then
                             Transaction.StartTransaction;
                          SelectSQL.Add(' SELECT * FROM VER_DETALLE_PEDIDO_LST ');
                          SelectSQL.Add(' WHERE ');
                          SelectSQL.Add(' ID_S = :ID_S ');
                          SelectSQL.Add(' ORDER BY ORDEN ');
                          Params.ByName['ID_S'].AsInteger := IdPEC;
                          Open;

                          First;
                          i := 0;
                          while not EOF do
                          begin
                             if (FieldByName('CONTROL_STOCK').AsInteger = 1) then
                             begin
                                Inc(i);

                              {
                              DMDHL.NuevoexportDeclarationlineItems(number: integer; description: string; price, quantity_value: double; quantity_unitOfMeasurement, commodity_typeCode1, commodity_value1, commodity_typeCode2, commodity_value2, exportReasonType, manufacturerCountry, exportControlClassificationNumber: string; netValue, grossValue: double; isTaxesPaid: boolean; line_additionalInformation, customerReference_typeCode1, customerReference_value1, customerReference_typeCode2, customerReference_value2, customsDocument_typeCode1, customsDocument_value1: string);
                              DMDHL.NuevoexportDeclarationlineItems(1, 'Harry Steward biography first edition', 15, 4, 'GM',
                                 'outbound', '84713000', 'inbound', '5109101110', 'permanent', 'US', 'US123456789',
                                 0.1, 0.7, True, '450pages',
                                 'AFE', '1299210', '', '', 'COO', 'MyDHLAPI - LN#1-CUSDOC-001');
                              }
                                {TODO: PARAMETRIZAR u Obtener de fabricante - Esto es para KombatPadel}
                                manufacturerCountry := 'CN';
                                if (FieldByName('FAMILIA').AsString = '3') then
                                   manufacturerCountry := 'ES';

                                DMDHL.NuevoexportDeclarationlineItems(i, FieldByName('TITULO').AsString, FieldByName('PRECIO').AsFloat, FieldByName('UNIDADES').AsFloat, 'PCS', 'outbound', FieldByName('CODIGO_INTRA').AsString, '', '', '',
                                   manufacturerCountry, '', FieldByName('PESO_REAL').AsFloat, FieldByName('PESO_REAL').AsFloat, (FieldByName('P_IVA').AsFloat <> 0),
                                   '', '', '', '', '',
                                   '', '');
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

                {
                DMDHL.exportDeclarationInvoice(number: string; InvoiceDate: TDateTime; invoice_instruction: string; totalNetWeight, totalGrossWeight: double; termsOfPayment: string; importCustomsDutyValue, importTaxesValue: double; customerReference_typeCode1: string = ''; customerReference_value1: string = ''; customerReference_typeCode2: string = ''; customerReference_value2: string = ''; customerReference_typeCode3: string = ''; customerReference_value3: string = '');
                }
                 {TODO : Ver de donde sacamos esto porque en este punto todavia no hay factura}
                 InvoiceNumber := IntToStr(IdALB);
                 InvoiceDate := Today;
                 DMDHL.exportDeclarationInvoice(InvoiceNumber, InvoiceDate, '', 0, 0, '', 0, 0,
                    '', '',
                    '', '',
                    '', '');
              end;

              {
              DMDHL.NuevoexportDeclarationRemarks(Value: string);
              DMDHL.NuevoexportDeclarationRemarks('Right side up only');
              }

              {
              DMDHL.NuevoexportDeclarationAdditionalCharges(Value: double; Caption, typeCode: string);
              DMDHL.NuevoexportDeclarationAdditionalCharges(10, 'fee', 'freight');
              }

              {
              DMDHL.exportDeclarationline(destinationPortName, placeOfIncoterm, payerVATNumber, recipientReference, exporter_id, exporter_code, packageMarks, declarationNote_value, exportReference, exportReason, exportReasonType, license_typeCode, license_value, shipmentType, customsDocument_typeCode, customsDocument_value: string);
              DMDHL.exportDeclarationline('New York Port', 'ShenZhen Port', '12345ED', '01291344', '121233', 'S', 'Fragile glass bottle',
                 'up to three declaration notes', 'export reference', 'export reason', 'permanent', 'export', '123127233', 'personal', 'INV', 'MyDHLAPI - CUSDOC-001');
              }

              {
              DMDHL.NuevoshipmentNotification(typeCode, receiverId, languageCode, languageCountryCode, bespokeMessage: string);
              DMDHL.NuevoshipmentNotification('email', 'shipmentnotification@mydhlapisample.com', 'eng', 'UK', 'message to be included in the notification');
              }

              {
              DMDHL.getTransliteratedResponse(Value: boolean);
              DMDHL.getTransliteratedResponse(False);
              }

              {
              DMDHL.estimatedDeliveryDate(isRequested: boolean; typeCode: string);
              DMDHL.estimatedDeliveryDate(True, 'QDDC');
              }

              {
              DMDHL.NuevogetAdditionalInformation(isRequested: boolean; typeCode: string);
              DMDHL.NuevogetAdditionalInformation(True, 'pickupDetails');
              }

              Ficheros := TStringList.Create;
              try
                 try
                    Resultado := DMDHL.Enviar(shipmentCode, Ficheros);
                    if (Resultado in [200, 201]) and (shipmentCode > '') then
                    begin
                       DMMain.Log('shipmentTrackingNumber: ' + shipmentCode);

                       AbreData(TDMAdjunto, DMAdjunto);
                       DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Body_%s.log', [IntToStr(IdPEC)]), 'DHL - ' + _('Peticion envio'));
                       DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Respuesta_%d_%s.log', [Resultado, IntToStr(IdPEC)]), 'DHL - ' + _('Respuesta Peticion envio') + ' = ' + IntToStr(Resultado));
                       CierraData(DMAdjunto);

                       LInfoUltimaEtiqueta.Caption := '';
                       FicherosEtiquetas.Clear;
                       for i := 0 to Ficheros.Count - 1 do
                       begin
                          DMMain.Log('Etiqueta: ' + Ficheros[i]);

                          // Guardo la etiqueta como adjunto.
                          AbreData(TDMAdjunto, DMAdjunto);
                          if Pos('label', Ficheros[i]) = 0 then
                             DMAdjunto.CreaAdjunto('ALB', IdALB, Ficheros[i], Format(_('Etiqueta Expedicion DHL %s / %d'), [shipmentCode, i]))
                          else
                             DMAdjunto.CreaAdjunto('ALB', IdALB, Ficheros[i], Format(_('Fichero Expedicion DHL %s / %d'), [shipmentCode, i]));
                          CierraData(DMAdjunto);

                          // Solo imprimimos los tipo "label"
                          if Pos('label', Ficheros[i]) = 0 then
                          begin
                             FicherosEtiquetas.Add(Ficheros[i]);
                             LInfoUltimaEtiqueta.Caption := InfoPedido;

                             if (RutaCopiaEtiqueta > '') then
                             begin
                                try
                                   CopyFileTo(Ficheros[i], RutaCopiaEtiqueta + ExtractFileName(Ficheros[i]));
                                except
                                   on E: Exception do
                                      ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                         _('Orig: ') + Ficheros[i] + #13#10 +
                                         _('Dest: ') + RutaCopiaEtiqueta + ExtractFileName(Ficheros[i]) + #13#10 +
                                         E.Message);
                                end;
                             end;
                          end;
                       end;

                       // Imprimir las estiquetas mediante SumatraPDF
                       for i := 0 to Ficheros.Count - 1 do
                       begin
                          // C:\Delfos\SumatraPDF.exe -print-to "Microsoft Print to PDF" "C:\Temp\Etiq-Int-001.pdf"
                          Comando := format('%sSumatraPDF.exe', [REntorno.DirectorioSumatraPDF]);
                          Argumentos := format('-print-to "%s" "%s"', [REntorno.NombreEtiquetasCompleto, Ficheros[i]]);
                          RunAndWait(FMain.Handle, Comando, Argumentos, PChar(DameTempPath), SW_SHOWNORMAL, False);
                       end;

                       try
                          DMMain.GrabaExpedicion(IdALB, Bultos, Peso, shipmentCode, 'DHL', DEExpedicion.Date, Transportista);
                       except
                          on E: Exception do
                             ShowMessage(_('No se ha podido agregar el Albarán a Envio') + #13#10 + E.Message);
                       end;
                    end
                    else
                    begin
                       AbreData(TDMAdjunto, DMAdjunto);
                       DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Body_%s.log', [IntToStr(IdPEC)]), 'DHL - ' + _('Peticion envio'));
                       DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('DHL_shipments_Respuesta_%d_%s.log', [Resultado, IntToStr(IdPEC)]), 'DHL - ' + _('Respuesta Peticion envio') + ' = ' + IntToStr(Resultado));
                       CierraData(DMAdjunto);

                       ShowMessage(_('No se ha podido enviar peticion a DHL') + #13#10 + shipmentCode);
                    end;
                 finally
                    Ficheros.Free;
                 end;
              except
                 on e: Exception do
                 begin
                    DMMain.Log(_('No se ha podido enviar peticion a DHL') + #13#10 + e.message);
                    ShowMessage(_('No se ha podido enviar peticion a DHL') + #13#10 + e.message);
                 end;
              end;
           finally
              CierraData(DMDHL);
           end;
        end
        else
        if (TransportistaSEUR <> 0) and (Transportista = TransportistaSEUR) then
        begin
           {SEUR}
           Servicecode := 0;
           ProductCode := 0;

           if IdServicio = 0 then
           begin
              // B2C - Nacional + Portugal + Andorra (Clientes)
              Servicecode := 31;
              ProductCode := 2;
           end
           else
           if IdServicio = 1 then
           begin
              // B2B - Nacional + Portugal + Andorra (Empresas)
              Servicecode := 1;
              ProductCode := 2;
           end
           else
           if IdServicio = 2 then
           begin
              // CLASSIC / PREDICT CROSSBORDER - Resto Europa (monobulto)
              Servicecode := 77;
              ProductCode := 104;
           end
           else
           if IdServicio = 3 then
           begin
              // NETEXPRESS / INT.TERRESTRE - Resto Europa (multibulto)
              Servicecode := 19;
              ProductCode := 70;
           end
           else
           if IdServicio = 4 then
           begin
              // CLASSIC MULTI PARCEL - Resto Europa (UK)
              Servicecode := 77;
              ProductCode := 116;
           end
           else
           if IdServicio = 5 then
           begin
              // COURIER MUESTRAS - Resto Mundo
              Servicecode := 7;
              ProductCode := 108;
           end
           else
           if IdServicio = 6 then
           begin
              // SEUR48 / Estandar - Tenerife *** INCLUIR REGISTRO DE ADUANA ***
              Servicecode := 15;
              ProductCode := 2;
           end;

           DMServirPedidosVenta.DameDireccionTercero(TerceroAlb, DireccionAlb, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF);

           AbreData(TDMSEUR, DMSEUR);
           try
              DMSEUR.WS_Inicializa(Transportista, False);
              DMSEUR.NuevoEnvio(Servicecode, ProductCode, IntToStr(IdPEC), Observaciones, ZRefCliente);
              DMSEUR.Receiver(RazonSocial, Telefono, Nombre, Email, Direccion, CP, Pais_C2, Poblacion);

              // No estoy seguro de si debe ser siempre, solo con servicio=015 o solo cuando es al extranjero.
              if IdServicio = 6 then
                 DMSEUR.DeclaredValue(Moneda, Bruto, exportPaymentType, importPaymentType);

              for i := 1 to Bultos do
                 DMSEUR.NuevoPaquete(Peso, format('Bulto %d_%d', [IdALB, i]));

              Resultado := DMSEUR.Enviar(shipmentCode);
              if (Resultado in [200, 201]) and (shipmentCode > '') then
              begin
                 DMMain.Log('shipmentCode: ' + shipmentCode);

                 AbreData(TDMAdjunto, DMAdjunto);
                 DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('SEUR_shipments_Body_%s.log', [IntToStr(IdPEC)]), 'SEUR - ' + _('Peticion envio'));
                 DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('SEUR_shipments_Respuesta_%d_%s.log', [Resultado, IntToStr(IdPEC)]), 'SEUR - ' + _('Respuesta Peticion envio') + ' = ' + IntToStr(Resultado));
                 CierraData(DMAdjunto);

                 Ficheros := TStringList.Create;
                 try
                    if (IdServicio = 0) or (IdServicio = 1) then
                    begin
                       // Label Clasic
                       DMSEUR.GetLabel(shipmentCode, 'CUSTOM_REFERENCE', 'PDF', 'SHIPMENTS', Ficheros);
                    end
                    else
                    if (IdServicio = 2) or (IdServicio = 3) or (IdServicio = 4) then
                    begin
                       // Label Courier
                       DMSEUR.GetLabel(shipmentCode, 'GEOLABEL', 'PDF', 'SHIPMENTS', Ficheros);
                    end;

                    LInfoUltimaEtiqueta.Caption := '';
                    FicherosEtiquetas.Clear;
                    for i := 0 to Ficheros.Count - 1 do
                    begin
                       DMMain.Log('Etiqueta: ' + Ficheros[i]);

                       // Guardo la etiqueta como adjunto.
                       AbreData(TDMAdjunto, DMAdjunto);
                       DMAdjunto.CreaAdjunto('ALB', IdALB, Ficheros[i], Format(_('Etiqueta Expedicion SEUR %s / %d'), [shipmentCode, i]));
                       CierraData(DMAdjunto);

                       FicherosEtiquetas.Add(Ficheros[i]);
                       LInfoUltimaEtiqueta.Caption := InfoPedido;

                       if (RutaCopiaEtiqueta > '') then
                       begin
                          try
                             CopyFileTo(Ficheros[i], RutaCopiaEtiqueta + ExtractFileName(Ficheros[i]));
                          except
                             on E: Exception do
                                ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                   _('Orig: ') + Ficheros[i] + #13#10 +
                                   _('Dest: ') + RutaCopiaEtiqueta + ExtractFileName(Ficheros[i]) + #13#10 +
                                   E.Message);
                          end;
                       end;
                    end;

                    // Imprimir las estiquetas mediante SumatraPDF
                    for i := 0 to Ficheros.Count - 1 do
                    begin
                       // C:\Delfos\SumatraPDF.exe -print-to "Microsoft Print to PDF" "C:\Temp\Etiq-Int-001.pdf"
                       Comando := format('%sSumatraPDF.exe', [REntorno.DirectorioSumatraPDF]);
                       Argumentos := format('-print-to "%s" "%s"', [REntorno.NombreEtiquetasCompleto, Ficheros[i]]);
                       RunAndWait(FMain.Handle, Comando, Argumentos, PChar(DameTempPath), SW_SHOWNORMAL, False);
                    end;

                    try
                       DMMain.GrabaExpedicion(IdALB, Bultos, Peso, shipmentCode, 'SEUR', DEExpedicion.Date, Transportista);
                    except
                       on E: Exception do
                          ShowMessage(_('No se ha podido agregar el Albarán a Envio') + #13#10 + E.Message);
                    end;
                 finally
                    Ficheros.Free;
                 end;
              end
              else
              begin
                 AbreData(TDMAdjunto, DMAdjunto);
                 DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('SEUR_shipments_Body_%s.log', [IntToStr(IdPEC)]), 'SEUR - ' + _('Peticion envio'));
                 DMAdjunto.CreaAdjunto('ALB', IdALB, DameTempPath + Format('SEUR_shipments_Respuesta_%d_%s.log', [Resultado, IntToStr(IdPEC)]), 'SEUR - ' + _('Respuesta Peticion envio') + ' = ' + IntToStr(Resultado));
                 CierraData(DMAdjunto);

                 ShowMessage(_('No se ha podido enviar peticion a SEUR') + #13#10 + shipmentCode);
              end;
           finally
              CierraData(DMSEUR);
           end;
        end
        else
        if (TransportistaIDRIL <> 0) and (Transportista = TransportistaIDRIL) then
        begin
           {IDRIL (GLS)}
           AbreData(TDMIDRIL, DMIDRIL);
           try
              if (not FileExists(DMIDRIL.RutaGLS + 'GLS.exe')) then
                 ShowMessage(_('No se encuentra ' + DMIDRIL.RutaGLS + 'GLS.exe'))
              else
              begin
                 // Crear Peticion GLS e imprimir la etiqueta
                 FicheroPeticion := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '.ini';
                 FicheroRespuesta := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta.ini';
                 FicheroRespuestaSOAPRequest := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta_SOAPRequest.xml';
                 FicheroRespuestaSOAPResponse := DMIDRIL.RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta_SOAPResponse.xml';

                 DeleteFile(FicheroPeticion);
                 DeleteFile(FicheroRespuesta);
                 DeleteFile(FicheroRespuestaSOAPRequest);
                 DeleteFile(FicheroRespuestaSOAPResponse);

                 with TIniFile.Create(FicheroPeticion) do
                 begin
                    try
                       WriteString('Peticion', 'Nombre', 'GrabaServicio');

                       WriteString('Servicio', 'Servicio', Servicio);
                       WriteString('Servicio', 'Horario', Horario);
                       WriteInteger('Servicio', 'Bultos', Bultos);
                       WriteFloat('Servicio', 'Peso', Peso);

                       // DMServirPedidosVenta.DameDireccionTercero(REntorno.Tercero, 0, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF);
                       Nombre := DMIDRIL.xIDRILTransportistaREMITENTE_NOMBRE.AsString;
                       Direccion := DMIDRIL.xIDRILTransportistaREMITENTE_DIRECCION.AsString;
                       Poblacion := DMIDRIL.xIDRILTransportistaREMITENTE_POBLACION.AsString;
                       Pais := DMIDRIL.xIDRILTransportistaREMITENTE_PAIS.AsString;
                       CP := DMIDRIL.xIDRILTransportistaREMITENTE_CP.AsString;
                       Telefono := DMIDRIL.xIDRILTransportistaREMITENTE_TELEFONO.AsString;
                       Movil := DMIDRIL.xIDRILTransportistaREMITENTE_MOVIL.AsString;
                       Email := DMIDRIL.xIDRILTransportistaREMITENTE_EMAIL.AsString;
                       Departamento := DMIDRIL.xIDRILTransportistaREMITENTE_DEPARTAMENTO.AsString;
                       Observaciones := DMIDRIL.xIDRILTransportistaREMITENTE_OBSERVACIONES.AsString;

                       WriteString('Remite', 'Nombre', Nombre);
                       WriteString('Remite', 'Direccion', Direccion);
                       WriteString('Remite', 'Poblacion', Poblacion);
                       WriteString('Remite', 'Pais', Pais);
                       WriteString('Remite', 'CP', CP);
                       WriteString('Remite', 'Telefono', Telefono);
                       WriteString('Remite', 'Movil', Movil);
                       WriteString('Remite', 'Email', Email);
                       WriteString('Remite', 'Departamento', Departamento);
                       WriteString('Remite', 'Observaciones', Observaciones);

                       DMServirPedidosVenta.DameDireccionTercero(TerceroAlb, DireccionAlb, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, Pais_C2, CP, Telefono, Movil, Email, Departamento, Observaciones, PaisC2Tercero, NIF);

                       WriteString('Destinatario', 'Nombre', Nombre);
                       WriteString('Destinatario', 'Direccion', Direccion);
                       WriteString('Destinatario', 'Poblacion', Poblacion);
                       WriteString('Destinatario', 'Pais', Pais_C2);
                       WriteString('Destinatario', 'CP', CP);
                       WriteString('Destinatario', 'Telefono', Telefono);
                       WriteString('Destinatario', 'Movil', Movil);
                       WriteString('Destinatario', 'Email', Email);
                       WriteString('Destinatario', 'Departamento', Departamento);
                       WriteString('Destinatario', 'Observaciones', Observaciones);
                       WriteString('Destinatario', 'ATT', '');

                       WriteString('Referencia', 'Tipo0', '');
                       WriteInteger('Referencia', 'TipoC', IdALB);
                       WriteString('Referencia', 'TipoG', '');
                       WriteString('Referencia', 'TipoN', '');

                  {
                  WriteString('Seguro', 'Tipo', '');
                  WriteString('Seguro', 'Descripcion', '');
                  WriteString('Seguro', 'Importe', 0);
                  }

                       WriteString('DevuelveAdicionales', 'TipoEtiqueta', 'PDF');

                  {
                  for i := 1 to bultos do
                     WriteString(format('DetalleBultos%d', [i]), 'Kilos', 0);
                     ...
                  }

                       with TFIBDataSet.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             Transaction := DameTransactionRO(DMMain.DataBase);
                             try
                                if (not Transaction.InTransaction) then
                                   Transaction.StartTransaction;
                                SelectSQL.Add(' SELECT * FROM VER_DETALLE_PEDIDO ');
                                SelectSQL.Add(' WHERE ');
                                SelectSQL.Add(' ID_S = :ID_S ');
                                SelectSQL.Add(' ORDER BY ORDEN ');
                                Params.ByName['ID_S'].AsInteger := IdPEC;
                                Open;

                                First;
                                i := 0;
                                while not EOF do
                                begin
                                   if (FieldByName('CONTROL_STOCK').AsInteger = 1) then
                                   begin
                                      Inc(i);

                                      WriteString(format('DescMercancia%d', [i]), 'Id', FieldByName('ID_A').AsString);
                                      WriteString(format('DescMercancia%d', [i]), 'Referencia', FieldByName('ARTICULO').AsString);
                                      WriteString(format('DescMercancia%d', [i]), 'Nombre', DameEAN13Articulo(FieldByName('ARTICULO').AsString));
                                      WriteString(format('DescMercancia%d', [i]), 'CodigoArencelario', DameCodigoArancelario(FieldByName('ARTICULO').AsString));
                                      WriteString(format('DescMercancia%d', [i]), 'DescripcionCorta', FieldByName('TITULO').AsString);
                                      WriteString(format('DescMercancia%d', [i]), 'DescripcionLarga', FieldByName('TITULO').AsString);
                                      WriteString(format('DescMercancia%d', [i]), 'Unidades', FieldByName('UNIDADES').AsString);
                                      WriteString(format('DescMercancia%d', [i]), 'Precio', FloatToStrDec(DMMain.DamePrecioTarifaBasiImponible(Tarifa, FieldByName('ARTICULO').AsString), '.'));
                                      WriteString(format('DescMercancia%d', [i]), 'Impuestos', FloatToStrDec(FieldByName('P_IVA').AsFloat, '.'));
                                      WriteString(format('DescMercancia%d', [i]), 'Peso', FloatToStrDec(FieldByName('PESO_REAL').AsFloat, '.'));
                                      WriteString(format('DescMercancia%d', [i]), 'Volumen', FloatToStrDec(0, '.'));
                                      WriteString(format('DescMercancia%d', [i]), 'PaisFabricacion', 'ES');
                                      WriteString(format('DescMercancia%d', [i]), 'Unidad', 'PCS');
                                      WriteString(format('DescMercancia%d', [i]), 'Descuento', FloatToStrDec(FieldByName('DESCUENTO').AsFloat, '.'));
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
                    finally
                       Free;
                    end;
                 end;
                 Sleep(500);

                 HoraEnvioFichero := Now;
                 if FileExists(FicheroPeticion) then
                 begin
                    AbreData(TDMAdjunto, DMAdjunto);
                    DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroPeticion, Format(_('Fichero Pedicion GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                    CierraData(DMAdjunto);
                 end;

                 // Se utiliza cadena vacía en vez de 'open' porque algunas aplicaciones no tienen esta accion.
                 Resultado := ShellExecute(Application.Handle, '' {'open'}, PChar(DMIDRIL.RutaGLS + 'GLS.exe'), PChar(FicheroPeticion), nil, SW_SHOW);
                 // Resultado <= 32 es un error
                 case Resultado of
                    0: ShowMessage(_('El sistema operativo no tiene memoria o recursos suficiente.')); // The operating system is out of memory or resources
                    ERROR_BAD_FORMAT {11}: ShowMessage(_('El archivo EXE es inválido.')); // The .EXE file is invalid (non-Win32 .EXE or error in .EXE image)
                    SE_ERR_ACCESSDENIED{5}: ShowMessage(_('El sistema operativo denego el acceso al archivo especificado.')); // The operating system denied access to the specified file
                    SE_ERR_ASSOCINCOMPLETE{27}: ShowMessage(_('El archivo asociado es incompatible o inválido.')); //The filename association is incomplete or invalid
                    SE_ERR_DDEBUSY{30}: ShowMessage(_('La transacción DDE no pudo completarse porque otra transaccion DDE estaba siendo procesada.')); // The DDE transaction could not be completed because other DDE transactions were being processed
                    SE_ERR_DDEFAIL{29}: ShowMessage(_('La transacción DDE falló.')); // The DDE transaction failed
                    SE_ERR_DDETIMEOUT{28}: ShowMessage(_('La transacción DDE no pudo completarse porque ha expirado.')); // The DDE transaction could not be completed because the request timed out
                    SE_ERR_DLLNOTFOUND{32}: ShowMessage(_('La librería dinamica especificada no se ha encontrado.')); // The specified dynamic-link library was not found
                    SE_ERR_FNF{2}: ShowMessage(_('El archivo no ha sido encontrado.')); //The specified file was not found
                    SE_ERR_NOASSOC{31}: ShowMessage(_('No hay ninguna aplicación asociada con la extensión del archivo dado.')); // There is no application associated with the given filename extension
                    SE_ERR_OOM{8}: ShowMessage(_('No ha habido memoria suficiente para completar la operación.')); // There was not enough memory to complete the operation
                    SE_ERR_PNF{3}: ShowMessage(_('No se ha encontrado la carpeta especificada.')); // The specified path was not found
                    SE_ERR_SHARE{26}: ShowMessage(_('Error de permisos.')); // A sharing violation occurred
                 end;

                 // Espero al fichero de respuesta
                 HoraEnvioFichero := Now;
                 while ((Resultado > 32) and (not FileExists(FicheroRespuesta)) and (SecondsBetween(Now, HoraEnvioFichero) < 30)) do
                 begin
                    Sleep(500);
                 end;
                 Sleep(500);

                 if FileExists(FicheroRespuesta) then
                 begin
                    AbreData(TDMAdjunto, DMAdjunto);
                    DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuesta, Format(_('Fichero Respuesta GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                    CierraData(DMAdjunto);
                 end;

                 if FileExists(FicheroRespuestaSOAPRequest) then
                 begin
                    AbreData(TDMAdjunto, DMAdjunto);
                    DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuestaSOAPRequest, Format(_('Fichero SOAP Request GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                    CierraData(DMAdjunto);
                 end;

                 if FileExists(FicheroRespuestaSOAPResponse) then
                 begin
                    AbreData(TDMAdjunto, DMAdjunto);
                    DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuestaSOAPResponse, Format(_('Fichero SOAP Response GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
                    CierraData(DMAdjunto);
                 end;

                 Expedicion := '';
                 if FileExists(FicheroRespuesta) then
                 begin
                    with TIniFile.Create(FicheroRespuesta) do
                    begin
                       try
                        {
                        [Envio]
                        CodBarras=51160860102019
                        codexp=7081933296
                        Resultado=0
                        [Referencias]
                        0=
                        C=3964
                        [Etiquetas]
                        Fichero1=C:\Users\Usuario\AppData\Local\Temp\Merge\Etiqueta1.PDF
                        [Observaciones]
                        Observaciones=
                        }
                          Expedicion := ReadString('Envio', 'codexp', '');
                          FicherosEtiquetas.Text := ReadString('Etiquetas', 'Fichero1', '');
                          ResultadoEnvio := ReadString('Envio', 'Resultado', '');

                          if not FileExists(FicherosEtiquetas[0]) then
                          begin
                             DMMain.LogProduccion('No se encuentra Etiqeta GLS: ' + FicherosEtiquetas[0]);
                             FicherosEtiquetas.Text := DMIDRIL.RutaGLS + ExtractFileName(FicherosEtiquetas[0]);
                             DMMain.LogProduccion('Nueva Ruta para Etiqeta GLS: ' + FicherosEtiquetas[0]);
                          end;

                          sl := TStringList.Create;
                          try
                             ReadSection('RespuestaError', sl);
                             if (sl.Count > 0) then
                             begin
                                RespuestaError := '';
                                for i := 0 to sl.Count - 1 do
                                   RespuestaError := RespuestaError + ReadString('RespuestaError', sl[i], '') + #13#10;

                                ShowMessage(_('Error al hacer la peticion GLS.') + #13#10 + #13#10 + RespuestaError);
                             end
                             else
                             if (ResultadoEnvio <> '0') then
                             begin
                                ShowMessage(_('Error al hacer la peticion GLS.') + #13#10 + #13#10 + ResultadoEnvio);
                             end
                             else
                             begin
                                if FileExists(FicherosEtiquetas[0]) then
                                begin
                                   LInfoUltimaEtiqueta.Caption := InfoPedido;
                                   // Guardo la etiqueta como adjunto.
                                   DMMain.LogProduccion('DMAdjunto.CreaAdjunto - ' + FicherosEtiquetas[0]);
                                   AbreData(TDMAdjunto, DMAdjunto);
                                   DMAdjunto.CreaAdjunto('ALB', IdALB, FicherosEtiquetas[0], Format(_('Etiqueta Expedicion GLS %s'), [Expedicion]));
                                   CierraData(DMAdjunto);

                                   try
                                      // C:\Delfos\SumatraPDF.exe -print-to "Microsoft Print to PDF" "C:\Temp\Etiq-Int-001.pdf"
                                      Comando := format('%sSumatraPDF.exe', [REntorno.DirectorioSumatraPDF]);
                                      Argumentos := format('-print-to "%s" "%s"', [REntorno.NombreEtiquetasCompleto, FicherosEtiquetas[0]]);
                                      DMMain.LogProduccion('Imprime Etiqueta - ' + Comando + ' ' + Argumentos);
                                      RunAndWait(FMain.Handle, Comando, Argumentos, PChar(DameTempPath), SW_SHOWNORMAL, False);
                                   except
                                      on e: Exception do
                                         ShowMessage(E.Message);
                                   end;

                                   if (DMIDRIL.RutaCopiaEtiqueta > '') then
                                   begin
                                      try
                                         DMMain.LogProduccion('CopyFileTo RutaCopiaEtiqueta - ' + FicherosEtiquetas[0] + ' --> ' + DMIDRIL.RutaCopiaEtiqueta + ExtractFileName(FicherosEtiquetas[0]));
                                         CopyFileTo(FicherosEtiquetas[0], DMIDRIL.RutaCopiaEtiqueta + ExtractFileName(FicherosEtiquetas[0]));
                                      except
                                         on E: Exception do
                                         begin
                                            ShowMessage(_('Error copiando etiqueta a carpeta auxiliar (Etiqueta)') + #13#10 +
                                               _('Orig: ') + FicherosEtiquetas[0] + #13#10 +
                                               _('Dest: ') + DMIDRIL.RutaCopiaEtiqueta + ExtractFileName(FicherosEtiquetas[0]) + #13#10 +
                                               E.Message);
                                            DMMain.LogProduccion('CopyFileTo RutaCopiaEtiqueta - Error: ' + #13#10 + e.message);
                                         end;
                                      end;

                                      try
                                         CopyFileTo(FicherosEtiquetas[0], DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [Expedicion]));
                                      except
                                         on E: Exception do
                                         begin
                                            ShowMessage(_('Error copiando etiqueta a carpeta auxiliar (Expedicion)') + #13#10 +
                                               _('Orig: ') + FicherosEtiquetas[0] + #13#10 +
                                               _('Dest: ') + DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [Expedicion]) + #13#10 +
                                               E.Message);
                                            DMMain.LogProduccion('CopyFileTo RutaCopiaEtiqueta - Expedicion - Error: ' + #13#10 + e.message);
                                         end;
                                      end;

                                      try
                                         CopyFileTo(FicherosEtiquetas[0], DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [SuReferencia]));
                                      except
                                         on E: Exception do
                                         begin
                                            ShowMessage(_('Error copiando etiqueta a carpeta auxiliar (SuReferencia)') + #13#10 +
                                               _('Orig: ') + FicherosEtiquetas[0] + #13#10 +
                                               _('Dest: ') + DMIDRIL.RutaCopiaEtiqueta + format('%s.pdf', [SuReferencia]) + #13#10 +
                                               E.Message);
                                            DMMain.LogProduccion('CopyFileTo RutaCopiaEtiqueta - SuReferencia - Error: ' + #13#10 + e.message);
                                         end;
                                      end;
                                   end;

                                   try
                                      CopyFileTo(FicherosEtiquetas[0], ChangeFileExt(FicherosEtiquetas[0], format('-%s.pdf', [Expedicion])));
                                      DeleteFile(FicherosEtiquetas[0]);
                                   except
                                      on E: Exception do
                                         ShowMessage(_('Error renombrando etiquetar') + #13#10 +
                                            _('Orig: ') + FicherosEtiquetas[0] + #13#10 +
                                            _('Dest: ') + ChangeFileExt(FicherosEtiquetas[0], format('-%s.pdf', [Expedicion])) + #13#10 +
                                            E.Message);
                                   end;
                                end;
                             end;
                          finally
                             sl.Free;
                          end;
                       finally
                          Free;
                       end;
                    end;
                 end;
              end;
           finally
              CierraData(DMIDRIL);
           end;

           try
              DMMain.GrabaExpedicion(IdALB, Bultos, Peso, Expedicion, 'GLS', DEExpedicion.Date, Transportista);
           except
              on E: Exception do
                 ShowMessage(_('No se ha podido agregar el Albarán a Envio') + #13#10 + E.Message);
           end;
        end;
     finally
        CBImprimirDocDestino.Checked := ImprimirDocDestino;
        EBultos.Text := '1';
     end;
  end;
end;

procedure TFMServirPedidosVenta.DBEIdDocChange(Sender: TObject);
var
  CP : string;
begin
  inherited;
  if (DBEIdDoc.Text > '') then
  begin
     if (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'ZZZ') then
     begin
        DBTPais.Color := clRed;
        DBTPais.Font.Color := clWhite;
        BAlbaranYEtiqTransporte.Enabled := False;
     end
     else
     begin
        DBTPais.Color := clInfoBk;
        DBTPais.Font.Color := clWindowText;
        BAlbaranYEtiqTransporte.Enabled := True;
     end;

     EFTransportista.Text := DMServirPedidosVenta.QMPedidosTRANSPORTISTA.AsString;
     if (TransportistaDHL <> 0) and (StrToIntDef(EFTransportista.Text, 0) = TransportistaDHL) then
     begin
        // DHL
        {
        Nombre comercial      | Ámbito                                    | Trafico   | Campo "isCustomsDeclarable" | productCode | Nombre abreviado
        DHL EXPRESS WORLDWIDE | Fuera del país de origen, dentro de la UE | Aéreo     | FALSE                       | U           | ECX
        ECONOMY SELECT        | Fuera del país de origen, dentro de la UE | Carretera | FALSE                       | W           | ESU
        DHL EXPRESS WORLDWIDE | Fuera del país de origen, fuera de la UE  | Aéreo     | TRUE                        | P           | WPX
        ECONOMY SELECT        | Fuera del país de origen, fuera de la UE  | Carretera | TRUE                        | H           | ESI
        DOMESTIC EXPRESS      | Dentro del mismo pais                     | N/A       | FALSE                       | N           | DOM
        }

        // Configuracion segun pais destino
        if (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'ESP') then
        begin
           CBServicio.ItemIndex := 0; // N - Nacional
           CBHorario.ItemIndex := -1;
           CBHorario.Text := '';
        end
        else
        if (DMServirPedidosVenta.QMDireccionPERTENECE_CEE.AsInteger = 1) then
        begin
           // H - Dentro de la UE - ECONOMY SELECT
           CBServicio.ItemIndex := 1; // N - Dentro EU
           CBHorario.ItemIndex := -1;
           CBHorario.Text := '';
        end
        else
        begin
           CBServicio.ItemIndex := 3; // P - Fuera EU
           CBHorario.ItemIndex := -1;
           CBHorario.Text := '';
        end;
     end
     else
     if (TransportistaSEUR <> 0) and (StrToIntDef(EFTransportista.Text, 0) = TransportistaSEUR) then
     begin
        // SEUR
        // B2C - Clientes - Nacional + Portugal + Andorra
        // Clasic para Europa (Comunidad Economica Europea)
        // Courier para resto de mundo.
        if (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'ESP') or (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'PRT') or (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'AND') then
        begin
           CP := DMServirPedidosVenta.QMDireccionCODIGO_POSTAL.AsString;
           if (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'ESP') and ((Copy(CP, 1, 2) = '38') or (Copy(CP, 1, 2) = '35')) then
           begin
              // Destino = Tenerife / Canarias
              CBServicio.ItemIndex := 6; // SEUR48 / Estandar - Tenerife *** INCLUYE REGISTRO DE ADUANA ***
              CBHorario.ItemIndex := -1;
              CBHorario.Text := '';
           end
           else
           begin
              CBServicio.ItemIndex := 0; // B2C - Clientes - Nacional + Portugal + Andorra
              CBHorario.ItemIndex := -1;
              CBHorario.Text := '';
           end;
        end
        else
        if (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'GBR') then
        begin
           CBServicio.ItemIndex := 4; // CLASSIC MULTI PARCEL - Resto Europa (UK)
           CBHorario.ItemIndex := -1;
           CBHorario.Text := '';
        end
        else
        if (DMServirPedidosVenta.QMDireccionPERTENECE_CEE.AsInteger = 1) then
        begin
           CBServicio.ItemIndex := 2; // CLASSIC / PREDICT CROSSBORDER - Resto Europa (monobulto)
           CBHorario.ItemIndex := -1;
           CBHorario.Text := '';
        end
        else
        begin
           CBServicio.ItemIndex := 5; // COURIER MUESTRAS - Resto Mundo
           CBHorario.ItemIndex := -1;
           CBHorario.Text := '';
        end;
     end
     else
     if (TransportistaIDRIL <> 0) and (StrToIntDef(EFTransportista.Text, 0) = TransportistaIDRIL) then
     begin
        // GLS
        if (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'ESP') then
        begin
           CBServicio.ItemIndex := 5; // 96 - BusinessParcel
           CBHorario.ItemIndex := 2; // 18 - Economy
        end
        else
        if ((DMServirPedidosVenta.QMDireccionPAIS.AsString = 'AND') or (DMServirPedidosVenta.QMDireccionPAIS.AsString = 'PRT')) then
        begin
           CBServicio.ItemIndex := 6; // 301 - Andorra + Porugal
           CBHorario.ItemIndex := 0; // 3 - 24 Horas (ASM24)
        end
        else
        begin
           CBServicio.ItemIndex := 7; // 3074 - Internacional
           CBHorario.ItemIndex := 5; // 98 - Economy
        end;
     end
     else
     begin
        CBServicio.ItemIndex := -1;
        CBServicio.Text := '';
        CBHorario.ItemIndex := -1;
        CBHorario.Text := '';
     end;

     EPeso.Text := FormatFloat('0.00', DMServirPedidosVenta.QMPedidosPESO_TOTAL.AsFloat);
  end;
end;

procedure TFMServirPedidosVenta.DBEIdArtChange(Sender: TObject);
begin
  inherited;
  tmrImagenArticulo.Enabled := False;
  tmrImagenArticulo.Enabled := (BVerDetalle.Tag = 1);
end;

procedure TFMServirPedidosVenta.tmrImagenArticuloTimer(Sender: TObject);
var
  IdArt, Codigo : integer;
begin
  inherited;
  tmrImagenArticulo.Enabled := False;

  IdArt := DMServirPedidosVenta.QMDetalleID_A.AsInteger;
  Codigo := 0;
  if (IdArt <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT IMAGEN FROM ART_ARTICULOS WHERE ID_A = :ID_A';
           Params.ByName['ID_A'].AsInteger := IdArt;
           ExecQuery;
           Codigo := FieldByName['IMAGEN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  RefrescarImagen(IImagenArticulo, Codigo);
end;

procedure TFMServirPedidosVenta.BVisualizarEtiqGLSClick(Sender: TObject);
var
  i : integer;
  Comando, Argumentos : string;
  Boton : TButton;
begin
  inherited;
  Boton := TButton(Sender);

  Boton.Hint := 'Ultima etiqueta GLS';
  for i := 0 to FicherosEtiquetas.Count - 1 do
  begin
     if (FicherosEtiquetas[i] <> '') then
     begin
        Boton.Hint := Boton.Hint + #13#10 + FicherosEtiquetas[i];

        if (Boton.Tag = 0) then
           DMMain.AbrirArchivo(FicherosEtiquetas[i])
        else
        if (Boton.Tag = 1) then
        begin
           // C:\Delfos\SumatraPDF.exe -print-to "Microsoft Print to PDF" "C:\Temp\Etiq-Int-001.pdf"
           Comando := format('%sSumatraPDF.exe', [REntorno.DirectorioSumatraPDF]);
           Argumentos := format('-print-to "%s" "%s"', [REntorno.NombreEtiquetasCompleto, FicherosEtiquetas[i]]);
           RunAndWait(FMain.Handle, Comando, Argumentos, PChar(DameTempPath), SW_SHOWNORMAL, False);
        end;
     end;
  end;
end;

procedure TFMServirPedidosVenta.EstableceVisibilidadStockAlmacen;
var
  i : smallint;
  CalcularStock : boolean;
begin
  CalcularStock := (LeeParametro('SRVPECS001', '') = 'S');

  i := EncuentraField(DBGDetalle, 'STOCK_ALM');
  if (i >= 0) then
  begin
     with DBGDetalle.Columns[i] do
     begin
        Visible := CalcularStock;
        Title.Caption := _('Stock');
     end;
  end
  else
  begin
     with DBGDetalle.Columns.Add do
     begin
        FieldName := 'STOCK_ALM';
        Title.Caption := _('Stock');
        Visible := CalcularStock;
     end;
  end;
end;

procedure TFMServirPedidosVenta.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbRefresh]) then
     DMServirPedidosVenta.ReiniciaStock;
end;

procedure TFMServirPedidosVenta.EFTransportistaChange(Sender: TObject);
begin
  inherited;
  ETransportista.Text := DameTituloAcreedor(StrToIntDef(EFTransportista.Text, 0));
  if (TransportistaDHL <> 0) and (StrToIntDef(EFTransportista.Text, 0) = TransportistaDHL) then
  begin
     ConfiguraDHL;
     ColorResaltado(ETransportista);
  end
  else
  if (TransportistaSEUR <> 0) and (StrToIntDef(EFTransportista.Text, 0) = TransportistaSEUR) then
  begin
     ConfiguraSEUR;
     ColorResaltado(ETransportista);
  end
  else
  if (TransportistaIDRIL <> 0) and (StrToIntDef(EFTransportista.Text, 0) = TransportistaIDRIL) then
  begin
     ConfiguraIDRIL;
     ColorResaltado(ETransportista);
  end
  else
  begin
     CBServicio.Items.Clear;
     CBHorario.Items.Clear;
     BAlbaranYEtiqTransporte.Caption := _('ALB');
     ColorError(ETransportista);
  end;
end;

procedure TFMServirPedidosVenta.ConfiguraDHL;
begin
  inherited;
  // DHL
  BAlbaranYEtiqTransporte.Caption := _('ALB + DHL');

  // DHL
  {
  Nombre comercial      | Ámbito                                    | Trafico   | Campo "isCustomsDeclarable" | productCode | Nombre abreviado
  DHL EXPRESS WORLDWIDE | Fuera del país de origen, dentro de la UE | Aéreo     | FALSE                       | U           | ECX
  ECONOMY SELECT        | Fuera del país de origen, dentro de la UE | Carretera | FALSE                       | W           | ESU
  DHL EXPRESS WORLDWIDE | Fuera del país de origen, fuera de la UE  | Aéreo     | TRUE                        | P           | WPX
  ECONOMY SELECT        | Fuera del país de origen, fuera de la UE  | Carretera | TRUE                        | H           | ESI
  DOMESTIC EXPRESS      | Dentro del mismo pais                     | N/A       | FALSE                       | N           | DOM
  }

  CBServicio.Items.Clear;
  CBServicio.Items.Add('N'); // No traducir
  CBServicio.Items.Add('W'); // No traducir
  CBServicio.Items.Add('H'); // No traducir
  CBServicio.Items.Add('P'); // No traducir
  CBServicio.Items.Add('U'); // No traducir

  CBHorario.Items.Clear;
end;

procedure TFMServirPedidosVenta.ConfiguraSEUR;
begin
  inherited;
  // SEUR
  BAlbaranYEtiqTransporte.Caption := _('ALB + SEUR');

  CBServicio.Items.Clear;
  CBServicio.Items.Add('Nac.+Port.+And. (Clientes)'); // No traducir
  CBServicio.Items.Add('Nac.+Port.+And. (Empresas)'); // No traducir
  CBServicio.Items.Add('Resto Europa (monobulto)'); // No traducir
  CBServicio.Items.Add('Resto Europa (multibulto)'); // No traducir
  CBServicio.Items.Add('Resto Europa (UK)'); // No traducir
  CBServicio.Items.Add('Resto Mundo'); // No traducir
  CBServicio.Items.Add('Tenerife'); // No traducir

  CBHorario.Items.Clear;
end;

procedure TFMServirPedidosVenta.ConfiguraIDRIL;
begin
  inherited;
  // GLS;
  BAlbaranYEtiqTransporte.Caption := _('ALB + GLS');

  CBServicio.Items.Clear;
  CBServicio.Items.Add('1 - 24 Horas (Courier)'); // No traducir
  CBServicio.Items.Add('37 - Economy (Economy)'); // No traducir
  CBServicio.Items.Add('12 - Internacional Express'); // No traducir
  CBServicio.Items.Add('13 - Internacional Economy'); // No traducir
  CBServicio.Items.Add('74 - Internacional'); // No traducir
  CBServicio.Items.Add('96 - BusinessParcel'); // No traducir - KOMBAT - España y Baleares
  CBServicio.Items.Add('301 - Andorra + Portugal'); // No traducir
  CBServicio.Items.Add('3074 - Internacional'); // No traducir
  CBServicio.Items.Add('3037 - EconomyParcel'); // No traducir - KOMBAR - Resto de mundo

  CBHorario.Items.Clear;
  CBHorario.Items.Add('3 - 24 Horas (ASM24)'); // No traducir
  CBHorario.Items.Add('2 - ASM14'); // No traducir
  CBHorario.Items.Add('18 - Economy'); // No traducir
  CBHorario.Items.Add('19 - ParcelShop'); // No traducir
  CBHorario.Items.Add('37 - 72 Horas'); // No traducir
  CBHorario.Items.Add('98 - Economy'); // No traducir
  CBHorario.Items.Add('99 - 24 Horas Internacional'); // No traducir
end;

procedure TFMServirPedidosVenta.EFOrigenDocumentoChange(Sender: TObject);
begin
  inherited;
  EOrigenDocumentoTitulo.Text := DameTituloTipoOrigen(EFOrigenDocumento.Text);
end;

end.
