unit UFMGestionCobros;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ComCtrls, ULFPageControl, Mask, DBCtrls,
  ULFDBEdit, ULFEdit, StdCtrls, ULFEditFind2000, ExtCtrls, ToolWin, UFormGest,
  ULFToolBar, ULFLabel, ActnList, ULFActionList, TFlatCheckBoxUnit,
  ULFCheckBox, ULFPanel, Buttons, ULFDBMemo, UHYDBGrid, rxPlacemnt,
  ULFFormStorage, UFPEditSinNavegador, Menus, UTeclas, UControlEdit,
  UEditPanel, UNavigator, ULFComboBox, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  ULFDBEditFind2000;

type
  TFMGestionCobros = class(TFPEditSinNavegador)
     PNCliente: TLFPanel;
     LCliente: TLFLabel;
     LAgente: TLFLabel;
     LDireccion: TLFLabel;
     EFCliente: TLFEditFind2000;
     EClienteTitulo: TLFEdit;
     DBEAgente: TLFDbedit;
     PCRecibos: TLFPageControl;
     TSCliente: TTabSheet;
     DBClienteRecibos: TDBGridFind2000;
     TSProveedor: TTabSheet;
     DBProveedorRecibos: TDBGridFind2000;
     PNIncidencias: TLFPanel;
     ALGestionCobros: TLFActionList;
     ARefrescaDatos: TAction;
     ASalir: TAction;
     ButtRefresca: TToolButton;
     LTelefono: TLFLabel;
     LTeleFax: TLFLabel;
     LEMail: TLFLabel;
     LTercero: TLFLabel;
     DBETelefono01: TLFDbedit;
     DBETelefax: TLFDbedit;
     DBECorreo: TLFDbedit;
     DBETercero: TLFDbedit;
     DBEDireccion: TLFDbedit;
     DBEFPago: TLFDbedit;
     ETituloFPago: TLFEdit;
     LFormaPago: TLFLabel;
     ATercero: TAction;
     AAgente: TAction;
     AIncidencia: TAction;
     AReciboCliente: TAction;
     AReciboProveedor: TAction;
     ACliente: TAction;
     LBases: TLFLabel;
     TBIncidencias: TLFToolBar;
     LTipoIncidencia: TLFLabel;
     EFTipoIncidencia: TLFEditFind2000;
     ETipoIncidenciaTitulo: TLFEdit;
     TSep2: TToolButton;
     PNRecibo: TLFPanel;
     PNPieRecibos: TLFPanel;
     LLiquido: TLFLabel;
     PNDetalle: TLFPanel;
     DBETotalLiquido: TLFDbedit;
     DBETotalBases: TLFDbedit;
     AFiltraIncidenciasAbiertasOTodas: TAction;
     BFiltraIncidenciasAbiertasOTodas: TToolButton;
     PNLFiltroTipoIncidencia: TLFPanel;
     SBATercero: TSpeedButton;
     SBACliente: TSpeedButton;
     SBAAgente: TSpeedButton;
     Splitter1: TSplitter;
     PNLNotasIncidencia: TLFPanel;
     DBMDatosIncidencia: TLFDBMemo;
     DBMRespuestaIncidencia: TLFDBMemo;
     Splitter2: TSplitter;
     Splitter3: TSplitter;
     DBIncidencias: THYTDBGrid;
     LFCategoryAction1: TLFCategoryAction;
     AEnviaMails: TAction;
     PNLTotales: TLFPanel;
     PCMain: TLFPageControl;
     TSCartas: TTabSheet;
     TSClientes: TTabSheet;
     TBCartas: TLFToolBar;
     PNLCartas: TLFPanel;
     NavCartas: THYMNavigator;
     DBGFCartas: TDBGridFind2000;
     TBSep1: TToolButton;
     BEnviarCarta: TToolButton;
     AEnviarCartaReclamacion: TAction;
     AConfiguracionListado: TLFCategoryAction;
     AConfigurarCarta1: TAction;
     AConfigurarCarta2: TAction;
     AConfigurarCarta3: TAction;
     AConfigurarCarta4: TAction;
     AConfigurarCarta5: TAction;
     BImprimirCarta: TToolButton;
     LFCategoryAction2: TLFCategoryAction;
     AImprimirCarta: TAction;
     PNLFiltroSigno: TLFPanel;
     TSep1: TToolButton;
     CBSigno: TLFComboBox;
     LFiltroSigno: TLFLabel;
     TSep3: TToolButton;
     TBDesmarcarCarta: TToolButton;
     TBMarcarCarta: TToolButton;
     AMarcarCarta: TAction;
     ADesmarcarCarta: TAction;
     TBClientes: TLFToolBar;
     ARefrescaDatosCliente: TAction;
     TBRefrescaDatosCliente: TToolButton;
     TSep4: TToolButton;
     TBVerPrevisionCobros: TToolButton;
     AVerPrevisionCobros: TAction;
     PNLFiltroTercero: TPanel;
     EFFiltroTercero: TLFEditFind2000;
     PNLTotalCobrados: TPanel;
     DBETotalCobrados: TLFDbedit;
     LFiltroTercero: TLFLabel;
     LTotalCobrados: TLFLabel;
     TBSep2: TToolButton;
     TSCobrados: TTabSheet;
     TBCarteraDetalle: TLFToolBar;
     NavCarteraDetalle: THYMNavigator;
     TBSeparador: TToolButton;
     DBGCarteraDetalle: TDBGridFind2000;
     LFecha: TLFLabel;
     DEDesdeFechaPago: TDateEdit;
     PNLCobradosFiltroFecha: TLFPanel;
     DEHastaFechaPago: TDateEdit;
     CBPendientesPago: TLFCheckBox;
     TButtFechaAnt: TButton;
     TButtFechaHoy: TButton;
     TButtFechaSig: TButton;
     TButtFechaMes: TButton;
     PNLTotalCartera: TPanel;
     LTotalCartera: TLFLabel;
     DBETotalCartera: TLFDbedit;
     LRutaCarteraDetalle: TLFLabel;
     EFAgente: TLFEditFind2000;
     LAgenteCarteraDetalle: TLFLabel;
     EFRuta: TLFEdit;
     PNLCobradosFiltroRuta: TLFPanel;
     PNLCobradosFiltroAgente: TLFPanel;
     TBSep3: TToolButton;
     TBSep4: TToolButton;
     TSPagados: TTabSheet;
     TBPagados: TLFToolBar;
     NavPagados: THYMNavigator;
     ToolButton1: TToolButton;
     LFPanel1: TLFPanel;
     LFechaPagadosDesde: TLFLabel;
     DEFechaPagadosDesde: TDateEdit;
     DEFechaPagadosHasta: TDateEdit;
     TButtFechaPagadosAnt: TButton;
     TButtFechaPagadosHoy: TButton;
     TButtFechaPagadosSig: TButton;
     TButtFechaPagadosMes: TButton;
     DBGPagados: TDBGridFind2000;
     CBPagadosPendientes: TLFCheckBox;
     PNLTotalPagados: TPanel;
     LTotalPagados: TLFLabel;
     DBETotalPagados: TLFDbedit;
     procedure EFClienteChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure DBEFPagoChange(Sender: TObject);
     procedure ARefrescaDatosExecute(Sender: TObject);
     procedure ATerceroExecute(Sender: TObject);
     procedure AAgenteExecute(Sender: TObject);
     procedure AIncidenciaExecute(Sender: TObject);
     procedure AReciboClienteExecute(Sender: TObject);
     procedure AReciboProveedorExecute(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure EFTipoIncidenciaChange(Sender: TObject);
     procedure PCRecibosChange(Sender: TObject);
     procedure AFiltraIncidenciasAbiertasOTodasExecute(Sender: TObject);
     procedure DBClienteRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBIncidenciasZDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure SBAAgenteDblClick(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure DBClienteRecibosBusqueda(Sender: TObject);
     procedure DBIncidenciasDblClick(Sender: TObject);
     procedure DBIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AEnviaMailsExecute(Sender: TObject);
     procedure DBGFCartasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFCartasDblClick(Sender: TObject);
     procedure DBGFCartasCellClick(Column: TColumn);
     procedure AEnviarCartaReclamacionExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure AConfigurar(Sender: TObject);
     procedure AImprimirCartaExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure CBSignoChange(Sender: TObject);
     procedure AMarcarCartaExecute(Sender: TObject);
     procedure ADesmarcarCartaExecute(Sender: TObject);
     procedure ARefrescaDatosClienteExecute(Sender: TObject);
     procedure AVerPrevisionCobrosExecute(Sender: TObject);
     procedure EFFiltroTerceroChange(Sender: TObject);
     procedure DEDesdeFechaPagoChange(Sender: TObject);
     procedure DBGCarteraDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGCarteraDetalleDblClick(Sender: TObject);
     procedure DBGCarteraDetalleTitleClick(Column: TColumn);
     procedure TButtFechaHoyClick(Sender: TObject);
     procedure TButtFechaAntClick(Sender: TObject);
     procedure TButtFechaSigClick(Sender: TObject);
     procedure TButtFechaMesClick(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure EFRutaChange(Sender: TObject);
     procedure DEFechaPagadosHastaChange(Sender: TObject);
     procedure TButtFechaPagadosAntClick(Sender: TObject);
     procedure TButtFechaPagadosSigClick(Sender: TObject);
     procedure TButtFechaPagadosHoyClick(Sender: TObject);
     procedure TButtFechaPagadosMesClick(Sender: TObject);
     procedure DBGPagadosTitleClick(Column: TColumn);
     procedure DBGPagadosDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     CampoOrdenCobrados: string;
     CampoOrdenPagados: string;
     FiltrandoCobrados, FiltrandoPagados: boolean;
     procedure FiltraIncidencia;
     procedure Reclamar(Modo: integer);
     procedure FiltraCobrados;
     procedure FiltraPagados;
  public
     { Public declarations }
  end;

var
  FMGestionCobros : TFMGestionCobros;

implementation

uses UDMGestionCobros, UDMMain, UEntorno, UFMain, UUtiles, DateUtils, UDMRPrevisionCobro,
  UDMListados, UFMListConfig, UFPregPrevisionCobro, UParam, UDameDato;

{$R *.dfm}

procedure TFMGestionCobros.FormCreate(Sender: TObject);
var
  c : integer;
begin
  inherited;

  AbreData(TDMGestionCobros, DMGestionCobros);

  SolapaControles(SBAAgente, DBEAgente);
  DBEAgente.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBACliente, EClienteTitulo);
  EClienteTitulo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBATercero, DBETercero);
  DBETercero.Color := REntorno.ColorEnlaceActivo;

  c := EncuentraField(DBGFCartas, 'PAGO_AUTORIZADO');
  if (c < 0) then
  begin
     with DBGFCartas.Columns.Add do
     begin
        FieldName := 'PAGO_AUTORIZADO';
        Title.Caption := _('Pago Autorizado');
     end;
  end;

  // Inicio mostrando cobros
  CBSigno.ItemIndex := 0;
  CBSignoChange(Sender);

  DMGestionCobros.RefrescaDatosCartas;
  ColActual := DBGFCartas.Columns[0];

  PCMain.ActivePage := TSCartas;
  PCRecibos.ActivePage := TSCliente;
  PCMainChange(Sender);

  CampoOrdenCobrados := '8'; // FECHA_PAGO
  CampoOrdenPagados := '8'; // FECHA_PAGO
  FiltrandoCobrados := False;
  FiltrandoPagados := False;
  TButtFechaHoy.Click; // Ejecuta FiltraCobrados;
  TButtFechaPagadosHoy.Click; // Ejecuta FiltraPagados;
end;

procedure TFMGestionCobros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGestionCobros);
end;

procedure TFMGestionCobros.EFClienteChange(Sender: TObject);
begin
  EClienteTitulo.Text := DameTituloCliente(StrToIntDef(EFCliente.Text, 0));
  DMGestionCobros.DameDatosCliente(StrToIntDef(EFCliente.Text, 0));

  // Calculo Totales
  if (PCRecibos.ActivePage = TSCliente) then
     DMGestionCobros.CalculaTotalRecibos('C');
  if (PCRecibos.ActivePage = TsProveedor) then
     DMGestionCobros.CalculaTotalRecibos('P');

  FiltraIncidencia;
end;

procedure TFMGestionCobros.DBEFPagoChange(Sender: TObject);
begin
  ETituloFPago.Text := DameTituloFormaPago(DBEFPago.Text);
end;

procedure TFMGestionCobros.ARefrescaDatosExecute(Sender: TObject);
begin
  DMGestionCobros.RefrescaDatosCliente;
  DMGestionCobros.RefrescaDatosCartas;
  FiltraCobrados;
end;

procedure TFMGestionCobros.ATerceroExecute(Sender: TObject);
begin
  if (StrToIntDef(DBETercero.Text, 0) > 0) then
     FMain.EjecutaAccion(FMain.ATerceros, 'Tercero = ' + DBETercero.Text);
end;

procedure TFMGestionCobros.AAgenteExecute(Sender: TObject);
begin
  if (StrToIntDef(DBEAgente.Text, 0) > 0) then
     FMain.EjecutaAccion(FMain.AAgentes, 'Agente = ' + DBEAgente.Text + ' and Ejercicio = ' + REntorno.EjercicioStr);
end;

procedure TFMGestionCobros.AIncidenciaExecute(Sender: TObject);
begin
  DMGestionCobros.AbreIncidencia;
end;

procedure TFMGestionCobros.AReciboClienteExecute(Sender: TObject);
begin
  with DMGestionCobros do
     AbreRecibo('C', xRecibosCobroClienteEJERCICIO.AsInteger, xRecibosCobroClienteREGISTRO.AsInteger);
end;

procedure TFMGestionCobros.AReciboProveedorExecute(Sender: TObject);
begin
  with DMGestionCobros do
     AbreRecibo('P', xRecibosCobroProveedorEJERCICIO.AsInteger, xRecibosCobroProveedorREGISTRO.AsInteger);
end;

procedure TFMGestionCobros.AClienteExecute(Sender: TObject);
begin
  DMGestionCobros.AbreCliProAcr('FAC', StrToIntDef(EFCliente.Text, 0));
end;

procedure TFMGestionCobros.EFTipoIncidenciaChange(Sender: TObject);
begin
  ETipoIncidenciaTitulo.Text := DameTituloTipoIncidencia(EFTipoIncidencia.Text);
  FiltraIncidencia;
end;

procedure TFMGestionCobros.PCRecibosChange(Sender: TObject);
begin
  if (PCRecibos.ActivePage = TSCliente) then
     DMGestionCobros.CalculaTotalRecibos('C');
  if (PCRecibos.ActivePage = TsProveedor) then
     DMGestionCobros.CalculaTotalRecibos('P');
end;

procedure TFMGestionCobros.AFiltraIncidenciasAbiertasOTodasExecute(Sender: TObject);
begin
  with AFiltraIncidenciasAbiertasOTodas do
  begin
     if (ImageIndex = 22) then
     begin
        ImageIndex := 23;
        Caption := _('Muestra Todas las Incidencias');
        Hint := _('Muestra Todas las Incidencias');
     end
     else
     begin
        ImageIndex := 22;
        Caption := _('Muestra Solo Incidencias Abiertas');
        Hint := _('Muestra Solo Incidencias Abiertas');
     end;
  end;
  FiltraIncidencia;
end;

procedure TFMGestionCobros.FiltraIncidencia;
begin
  // (AFiltraIncidenciasAbiertasOTodas.ImageIndex=22) = Solo abiertas
  // (AFiltraIncidenciasAbiertasOTodas.ImageIndex=23) = Todas
  DMGestionCobros.FiltraIncidencia((AFiltraIncidenciasAbiertasOTodas.ImageIndex = 23), EFTipoIncidencia.Text);
end;

procedure TFMGestionCobros.DBClienteRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (UpperCase(Column.FieldName) = 'REGISTRO') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

procedure TFMGestionCobros.DBIncidenciasZDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (UpperCase(Column.FieldName) = 'TITULO_INCIDENCIA') then
     CeldaEnlace(TNsDBGrid(Sender), Rect);
end;

procedure TFMGestionCobros.SBATerceroDblClick(Sender: TObject);
begin
  ATercero.Execute;
end;

procedure TFMGestionCobros.SBAAgenteDblClick(Sender: TObject);
begin
  AAgente.Execute;
end;

procedure TFMGestionCobros.SBAClienteDblClick(Sender: TObject);
begin
  ACliente.Execute;
end;

procedure TFMGestionCobros.FormShow(Sender: TObject);
var
  param_TESAUTO002 : boolean;
  c : integer;
begin
  DBMDatosIncidencia.Width := PNLNotasIncidencia.Width div 2;

  c := EncuentraField(DBGFCartas, 'PAGO_AUTORIZADO');
  if (c < 0) then
  begin
     with DBGFCartas.Columns.Add do
     begin
        FieldName := 'PAGO_AUTORIZADO';
        Title.Caption := _('Pago Autorizado');
     end;
  end;

  // El usuario esta autorizado para autorizar el pago del recibo
  param_TESAUTO002 := (LeeParametro('TESAUTO002') = 'S');
  with DBGFCartas.FindColumn('PAGO_AUTORIZADO') do
  begin
     if param_TESAUTO002 then
     begin
        ReadOnly := False;
        Color := clWindow;
     end
     else
     begin
        ReadOnly := True;
        Color := $005B6AFF; // Igual que UUtiles.ColorBloqueado()
     end;
  end;
end;

procedure TFMGestionCobros.DBClienteRecibosBusqueda(Sender: TObject);
begin
  if (Trim(TDBGridFind2000(Sender).TablaABuscar) = 'VER_EMPLEADOS_EF') then
  begin
     TDBGridFind2000(Sender).CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ACTIVO=1';
  end;
end;

procedure TFMGestionCobros.DBIncidenciasDblClick(Sender: TObject);
begin
  DMGestionCobros.AbreIncidencia;
end;

procedure TFMGestionCobros.DBIncidenciasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if (UpperCase(Column.FieldName) = 'TITULO_INCIDENCIA') then
     CeldaEnlace(TNsDBGrid(Sender), Rect);
end;

procedure TFMGestionCobros.AEnviaMailsExecute(Sender: TObject);
begin
  DMGestionCobros.EnviaEmailAResponsable;
end;

procedure TFMGestionCobros.DBGFCartasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if ((UpperCase(Column.FieldName) = 'REGISTRO') or
     (UpperCase(Column.FieldName) = 'DOC_TIPO') or
     (UpperCase(Column.FieldName) = 'DOC_SERIE') or
     (UpperCase(Column.FieldName) = 'DOC_NUMERO') or
     (UpperCase(Column.FieldName) = 'CLIENTE') or
     (UpperCase(Column.FieldName) = 'CUENTA')
     ) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'VENCIMIENTO') then
        begin
           if (DMGestionCobros.xCartasVENCIMIENTO.AsDateTime >= Today) then
              ColorInfo(Canvas)
           else
           if (DMGestionCobros.xCartasVENCIMIENTO.AsDateTime >= Today - 7) then
              ColorResaltado(Canvas)
           else
           if (DMGestionCobros.xCartasVENCIMIENTO.AsDateTime >= Today - 15) then
              ColorResaltado6(Canvas)
           else
           if (DMGestionCobros.xCartasVENCIMIENTO.AsDateTime >= Today - 30) then
              ColorResaltado3(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'ORIGEN_IMPAGADO') then
        begin
           if (DMGestionCobros.xCartasORIGEN_IMPAGADO.AsInteger = 0) then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;
  end;

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMGestionCobros.DBGFCartasDblClick(Sender: TObject);
begin
  inherited;
  with DMGestionCobros do
  begin
     if (UpperCase(ColActual.FieldName) = 'COD_CLI_PRO') then
        AbreCliProAcr(xCartasDOC_TIPO.AsString, xCartasCOD_CLI_PRO.AsInteger);

     if ((UpperCase(ColActual.FieldName) = 'DOC_TIPO') or
        (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or
        (UpperCase(ColActual.FieldName) = 'DOC_NUMERO')) then
        AbreDocumentoCompraVenta(xCartasDOC_TIPO.AsString, xCartasID_DOC.AsInteger);

     if (UpperCase(ColActual.FieldName) = 'REGISTRO') then
     begin
        AbreRecibo(xCartasSIGNO.AsString, xCartasEJERCICIO.AsInteger, xCartasREGISTRO.AsInteger);
     end;

     if (UpperCase(ColActual.FieldName) = 'CUENTA') then
     begin
        FMain.EjecutaAccion(FMain.AContaExtracto, xCartasCUENTA.AsString);
     end;
  end;
end;

procedure TFMGestionCobros.DBGFCartasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMGestionCobros.AEnviarCartaReclamacionExecute(Sender: TObject);
begin
  inherited;

  // Modo 2 para enviar por correo
  Reclamar(2);
end;

procedure TFMGestionCobros.PCMainChange(Sender: TObject);
begin
  inherited;
  AEnviaMails.Enabled := (PCMain.ActivePage = TSClientes);
  AEnviarCartaReclamacion.Enabled := (PCMain.ActivePage = TSCartas);
end;

procedure TFMGestionCobros.AConfigurar(Sender: TObject);
var
  Grupo, Formato, Cabecera, Copias, Pijama : integer;
begin
  Grupo := 0;
  case TAction(Sender).Tag of
     1: Grupo := 5610;
     2: Grupo := 5611;
     3: Grupo := 5612;
     4: Grupo := 5613;
     5: Grupo := 5614;
  end;

  AbreData(TDMRPrevisionCobro, DMRPrevisionCobro);

  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias,
     Pijama, '', DMRPrevisionCobro.frHYPrevisionCobro);

  CierraData(DMRPrevisionCobro);
end;

procedure TFMGestionCobros.Reclamar(Modo: integer);
var
  Carta : integer;
  IdCarteraDetalle : integer;
  Archivo : string;
  Asunto : string;
  CuerpoMail : TStrings;
begin
  inherited;

  IdCarteraDetalle := DMGestionCobros.xCartas.FieldByName('ID_CARTERA_DETALLE').AsInteger;

  AbreData(TDMRPrevisionCobro, DMRPrevisionCobro);
  try
     // Recorro los registros seleccionados
     with DMGestionCobros.xCartas do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if (DBGFCartas.SelectedRows.CurrentRowSelected) then
              begin
                 // Seleccionar siguiente numero de carta
                 Carta := 0;
                 if (FieldByName('CARTA1').AsInteger = 1) then
                    Inc(Carta);
                 if (FieldByName('CARTA2').AsInteger = 1) then
                    Inc(Carta);
                 if (FieldByName('CARTA3').AsInteger = 1) then
                    Inc(Carta);
                 if (FieldByName('CARTA4').AsInteger = 1) then
                    Inc(Carta);
                 // Que hago si ya envie todas las cartas?

                 // Obtener pdf a enviar
                 DMRPrevisionCobro.CalculaInformeCarta(FieldByName('VENCIMIENTO').AsDateTime, FieldByName('VENCIMIENTO').AsDateTime, Today, REntorno.Moneda, _('Envio automatico'), FieldByName('COD_CLI_PRO').AsInteger, FieldByName('ID_CARTERA_DETALLE').AsInteger);

                 // Modo: 0-prev, 1 impr, 2 email
                 Archivo := Format('%s-%d-%s.pdf', [_('CartaReclamacion'), Carta + 1, FormatDateTime('yymmdd', Today)]);
                 DMRPrevisionCobro.MostrarListado(Modo, 2, True, Carta, True, 0, Archivo);

                 if (Modo = 2) then
                 begin
                    // Enviar correo electronico

                    InicializaVariableEmail('CRE');
                    with VariableEmail do
                    begin
                       Ejercicio := FieldByName('EJERCICIO').AsInteger;
                       Serie := FieldByName('DOC_SERIE').AsString;
                       NumeroDocumento := FieldByName('DOC_NUMERO').AsInteger;
                       Fecha := FieldByName('DOC_FECHA').AsDateTime;
                       SuReferencia := '';
                       SuPedido := '';
                       Folio := '';
                       TituloDocTributario := '';
                       NombreFichero := Archivo;
                       Matricula := '';
                       NombreComercial := DMGestionCobros.xClientesNOMBRE_COMERCIAL.AsString;
                       RazonSocial := DMGestionCobros.xClientesNOMBRE_R_SOCIAL.AsString;
                       OrdenTrabajo := 0;
                       UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(REntorno.Entrada));
                    end;
                    DamePartesEmail(Asunto, CuerpoMail);

                    if (Trim(LeeParametro(format('TESCART00%d', [Carta + 1]))) > '') then
                       Asunto := Trim(LeeParametro(format('TESCART00%d', [Carta + 1])));

                    try
                       AbreData(TDMListados, DMListados);

                       // TIPO = 'FAC' para que se marquen las direcciones que tiene para envio de facturas.
                       // TIPo = 'CLI' marcaria la de la ficha de tercero.
                       // DICOMOL quiere que sea tipo FAC. Si alquien se queja, parametrizar.
                       DMListados.SendMailClientePDF(FieldByName('COD_CLI_PRO').AsInteger, CuerpoMail, DameTempPath + Archivo,
                          Archivo, Asunto, 'FAC'{'CLI'}, FieldByName('ID_CARTERA_DETALLE').AsInteger, True);
                    finally
                       CuerpoMail.Free;
                    end;
                 end;
              end;

              Next;
           end;

           First;
        finally
           EnableControls;
        end;
     end;
  finally
     // Refresco datos
     Refrescar(DMGestionCobros.xCartas, 'ID_CARTERA_DETALLE', IdCarteraDetalle);

     CierraData(DMRPrevisionCobro);
  end;
end;

procedure TFMGestionCobros.AImprimirCartaExecute(Sender: TObject);
begin
  inherited;

  // Modo 0 para previsualizar
  Reclamar(0);
end;

procedure TFMGestionCobros.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Signo : string;
begin
  inherited;

  if (CBSigno.ItemIndex = 0) then
     Signo := 'C'
  else
     Signo := 'P';

  DMGestionCobros.BusquedaCompleja(Signo);
  Continua := False;
end;

procedure TFMGestionCobros.CBSignoChange(Sender: TObject);
var
  Signo : string;
  c : integer;
begin
  inherited;

  c := EncuentraField(DBGFCartas, 'PAGO_AUTORIZADO');
  if (c < 0) then
  begin
     with DBGFCartas.Columns.Add do
     begin
        FieldName := 'PAGO_AUTORIZADO';
        Title.Caption := _('Pago Autorizado');
     end;
  end;

  if (CBSigno.ItemIndex = 0) then
  begin
     Signo := 'C';
     TSClientes.TabVisible := True;
     TSClientes.Enabled := True;
     TSCobrados.TabVisible := True;
     TSPagados.TabVisible := False;
     TBActions.Enabled := True;
     DBGFCartas.FindColumn('CARTA1').Visible := True;
     DBGFCartas.FindColumn('CARTA2').Visible := True;
     DBGFCartas.FindColumn('CARTA3').Visible := True;
     DBGFCartas.FindColumn('CARTA4').Visible := True;
     DBGFCartas.FindColumn('CARTA5').Visible := True;
     DBGFCartas.FindColumn('ORIGEN_IMPAGADO').Visible := True;
     DBGFCartas.FindColumn('SU_DOCUMENTO').Visible := False;
     DBGFCartas.FindColumn('PAGO_AUTORIZADO').Visible := False;
  end
  else
  begin
     Signo := 'P';
     TSClientes.TabVisible := False;
     TSClientes.Enabled := False;
     TSCobrados.TabVisible := False;
     TSPagados.TabVisible := True;
     TBActions.Enabled := False;
     DBGFCartas.FindColumn('CARTA1').Visible := False;
     DBGFCartas.FindColumn('CARTA2').Visible := False;
     DBGFCartas.FindColumn('CARTA3').Visible := False;
     DBGFCartas.FindColumn('CARTA4').Visible := False;
     DBGFCartas.FindColumn('CARTA5').Visible := False;
     DBGFCartas.FindColumn('ORIGEN_IMPAGADO').Visible := False;
     DBGFCartas.FindColumn('SU_DOCUMENTO').Visible := True;
     DBGFCartas.FindColumn('PAGO_AUTORIZADO').Visible := True;
  end;

  DMGestionCobros.FiltraCartera(Signo, StrToIntDef(EFFiltroTercero.Text, 0));
end;

procedure TFMGestionCobros.AMarcarCartaExecute(Sender: TObject);
begin
  inherited;
  DMGestionCobros.MarcarEnviada(1);
end;

procedure TFMGestionCobros.ADesmarcarCartaExecute(Sender: TObject);
begin
  inherited;
  DMGestionCobros.MarcarEnviada(-1);
end;

procedure TFMGestionCobros.ARefrescaDatosClienteExecute(Sender: TObject);
begin
  inherited;
  DMGestionCobros.RefrescaDatosCliente;
end;

procedure TFMGestionCobros.AVerPrevisionCobrosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregPrevisionCobro, FPregPrevisionCobro, Sender);
  FPregPrevisionCobro.FiltraUnCliente(StrToIntDef(EFCliente.Text, 0), True);
end;

procedure TFMGestionCobros.EFFiltroTerceroChange(Sender: TObject);
begin
  CBSignoChange(Self);
end;

procedure TFMGestionCobros.DEDesdeFechaPagoChange(Sender: TObject);
begin
  FiltraCobrados;
end;

procedure TFMGestionCobros.DBGCarteraDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if ((UpperCase(Column.FieldName) = 'ID_CARTERA') or
     (UpperCase(Column.FieldName) = 'DOC_TIPO') or
     (UpperCase(Column.FieldName) = 'DOC_SERIE') or
     (UpperCase(Column.FieldName) = 'DOC_NUMERO') or
     (UpperCase(Column.FieldName) = 'AGRUPACION') or
     (UpperCase(Column.FieldName) = 'CUENTA')
     ) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'AGRUPACION') then
        begin
           if (DataSource.DataSet.FieldByName('AGRUPACION').AsString <> '') then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'REMESA') then
        begin
           if (DataSource.DataSet.FieldByName('REMESA').AsInteger > 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DOCUMENTO') then
        begin
           if (DataSource.DataSet.FieldByName('DOCUMENTO').AsString <> '') then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'CONFIRMING') then
        begin
           if (DataSource.DataSet.FieldByName('CONFIRMING').AsInteger > 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'ORD_PAGO') then
        begin
           if (DataSource.DataSet.FieldByName('ORD_PAGO').AsInteger > 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;
  end;

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMGestionCobros.DBGCarteraDetalleDblClick(Sender: TObject);
begin
  inherited;
  with DMGestionCobros do
  begin
     if ((UpperCase(ColActual.FieldName) = 'EJERCICIO') or
        (UpperCase(ColActual.FieldName) = 'REGISTRO') or
        (UpperCase(ColActual.FieldName) = 'ID_CARTERA')) then
        FMain.MuestraCartera(xCarteraDetalleID_CARTERA.AsInteger);

     if (UpperCase(ColActual.FieldName) = 'AGRUPACION') then
        FMain.MuestraCartera(xCarteraDetalleID_CARTERA_AGRUP.AsInteger);

     if ((UpperCase(ColActual.FieldName) = 'DOC_TIPO') or
        (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or
        (UpperCase(ColActual.FieldName) = 'DOC_NUMERO')) then
        AbreDocumentoCompraVenta(xCarteraDetalleDOC_TIPO.AsString, xCarteraDetalleID_DOC.AsInteger);

     if (UpperCase(ColActual.FieldName) = 'CUENTA') then
        FMain.EjecutaAccion(FMain.AContaExtracto, xCarteraDetalleCUENTA.AsString);
  end;
end;

procedure TFMGestionCobros.DBGCarteraDetalleTitleClick(Column: TColumn);
begin
  // inherited;

  // Si el campo de orden es el mismo, lo invierto (orden descendente)
  if (CampoOrdenCobrados <> IntToStr(Column.Field.Index + 1)) then
     CampoOrdenCobrados := IntToStr(Column.Field.Index + 1)
  else
     CampoOrdenCobrados := IntToStr((Column.Field.Index + 1) * (-1));

  FiltraCobrados;
end;

procedure TFMGestionCobros.FiltraCobrados;
begin
  if not FiltrandoCobrados then
     DMGestionCobros.FiltraCobrados(DEDesdeFechaPago.Date, DEHastaFechaPago.Date, CBPendientesPago.Checked, CampoOrdenCobrados, StrToIntDef(EFAgente.Text, 0), StrToIntDef(EFRuta.Text, 0));
end;

procedure TFMGestionCobros.TButtFechaHoyClick(Sender: TObject);
begin
  inherited;
  FiltrandoCobrados := True;
  try
     DEDesdeFechaPago.Date := Today;
     DEHastaFechaPago.Date := Today;
  finally
     FiltrandoCobrados := False;
  end;
  DEDesdeFechaPagoChange(Sender);
end;

procedure TFMGestionCobros.TButtFechaAntClick(Sender: TObject);
begin
  inherited;
  FiltrandoCobrados := True;
  try
     DEDesdeFechaPago.Date := DEDesdeFechaPago.Date - 1;
     DEHastaFechaPago.Date := DEHastaFechaPago.Date - 1;
  finally
     FiltrandoCobrados := False;
  end;
  DEDesdeFechaPagoChange(Sender);
end;

procedure TFMGestionCobros.TButtFechaSigClick(Sender: TObject);
begin
  inherited;
  FiltrandoCobrados := True;
  try
     DEDesdeFechaPago.Date := DEDesdeFechaPago.Date + 1;
     DEHastaFechaPago.Date := DEHastaFechaPago.Date + 1;
  finally
     FiltrandoCobrados := False;
  end;
  DEDesdeFechaPagoChange(Sender);
end;

procedure TFMGestionCobros.TButtFechaMesClick(Sender: TObject);
begin
  inherited;
  FiltrandoCobrados := True;
  try
     DEDesdeFechaPago.Date := RecodeDate(DEDesdeFechaPago.Date, YearOf(Today), MonthOf(Today), 1);
     DEHastaFechaPago.Date := RecodeDate(DEHastaFechaPago.Date, YearOf(Today), MonthOf(Today), DaysInMonth(MonthOf(Today)));
  finally
     FiltrandoCobrados := False;
  end;
  DEDesdeFechaPagoChange(Sender);
end;

procedure TFMGestionCobros.EFAgenteChange(Sender: TObject);
begin
  inherited;
  FiltraCobrados;
end;

procedure TFMGestionCobros.EFRutaChange(Sender: TObject);
begin
  inherited;
  FiltraCobrados;
end;

procedure TFMGestionCobros.DEFechaPagadosHastaChange(Sender: TObject);
begin
  inherited;
  FiltraPagados;
end;

procedure TFMGestionCobros.TButtFechaPagadosAntClick(Sender: TObject);
begin
  inherited;
  FiltrandoPagados := True;
  try
     DEFechaPagadosDesde.Date := DEFechaPagadosDesde.Date - 1;
     DEFechaPagadosHasta.Date := DEFechaPagadosHasta.Date - 1;
  finally
     FiltrandoPagados := False;
  end;
  DEFechaPagadosHastaChange(Sender);
end;

procedure TFMGestionCobros.TButtFechaPagadosSigClick(Sender: TObject);
begin
  inherited;
  FiltrandoPagados := True;
  try
     DEFechaPagadosDesde.Date := DEFechaPagadosDesde.Date + 1;
     DEFechaPagadosHasta.Date := DEFechaPagadosHasta.Date + 1;
  finally
     FiltrandoPagados := False;
  end;
  DEFechaPagadosHastaChange(Sender);
end;

procedure TFMGestionCobros.TButtFechaPagadosHoyClick(Sender: TObject);
begin
  inherited;
  FiltrandoPagados := True;
  try
     DEFechaPagadosDesde.Date := Today;
     DEFechaPagadosHasta.Date := Today;
  finally
     FiltrandoPagados := False;
  end;
  DEFechaPagadosHastaChange(Sender);
end;

procedure TFMGestionCobros.TButtFechaPagadosMesClick(Sender: TObject);
begin
  inherited;
  FiltrandoPagados := True;
  try
     DEFechaPagadosDesde.Date := RecodeDate(DEFechaPagadosDesde.Date, YearOf(Today), MonthOf(Today), 1);
     DEFechaPagadosHasta.Date := RecodeDate(DEFechaPagadosHasta.Date, YearOf(Today), MonthOf(Today), DaysInMonth(MonthOf(Today)));
  finally
     FiltrandoPagados := False;
  end;
  DEFechaPagadosHastaChange(Sender);
end;

procedure TFMGestionCobros.FiltraPagados;
begin
  if not FiltrandoPagados then
     DMGestionCobros.FiltraPagados(DEFechaPagadosDesde.Date, DEFechaPagadosHasta.Date, CBPagadosPendientes.Checked, CampoOrdenPagados);
end;

procedure TFMGestionCobros.DBGPagadosTitleClick(Column: TColumn);
begin
  inherited;
  // Si el campo de orden es el mismo, lo invierto (orden descendente)
  if (CampoOrdenPagados <> IntToStr(Column.Field.Index + 1)) then
     CampoOrdenPagados := IntToStr(Column.Field.Index + 1)
  else
     CampoOrdenPagados := IntToStr((Column.Field.Index + 1) * (-1));

  FiltraPagados;
end;

procedure TFMGestionCobros.DBGPagadosDblClick(Sender: TObject);
begin
  inherited;
  with DMGestionCobros do
  begin
     if ((UpperCase(ColActual.FieldName) = 'EJERCICIO') or
        (UpperCase(ColActual.FieldName) = 'REGISTRO') or
        (UpperCase(ColActual.FieldName) = 'ID_CARTERA')) then
        FMain.MuestraCartera(xPagadosID_CARTERA.AsInteger);

     if (UpperCase(ColActual.FieldName) = 'AGRUPACION') then
        FMain.MuestraCartera(xPagadosID_CARTERA_AGRUP.AsInteger);

     if ((UpperCase(ColActual.FieldName) = 'DOC_TIPO') or
        (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or
        (UpperCase(ColActual.FieldName) = 'DOC_NUMERO')) then
        AbreDocumentoCompraVenta(xPagadosDOC_TIPO.AsString, xPagadosID_DOC.AsInteger);

     if (UpperCase(ColActual.FieldName) = 'CUENTA') then
        FMain.EjecutaAccion(FMain.AContaExtracto, xPagadosCUENTA.AsString);
  end;
end;

end.
