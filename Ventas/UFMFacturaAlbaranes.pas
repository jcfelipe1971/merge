unit UFMFacturaAlbaranes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls, UControlEdit,
  UFormGest, Mask, NsDBGrid, rxToolEdit, ULFDBEdit, ULFPanel, ULFComboBox,
  ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel,
  rxPlacemnt, ULFFormStorage, FIBDataSet, FIBDatabase, ULFEdit, ULFMemo,
  ULFDateEdit, UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas;

type
  TFMFacturaAlbaranes = class(TFPEditSinNavegador)
     TBFiltroFechas: TLFToolBar;
     DTPDesdeFecha: TLFDateEdit;
     DTPHastaFecha: TLFDateEdit;
     TSep2: TToolButton;
     TButtTodos: TToolButton;
     TButtMostrarFiltros: TToolButton;
     TButtDesmarcar: TToolButton;
     DBGFAlbaranes: TDBGridFind2000;
     TSep4: TToolButton;
     TButtFacturar: TToolButton;
     TSep1: TToolButton;
     LBLFFactura: TLFLabel;
     DTPFechaFactura: TLFDateEdit;
     TBFiltroClientes: TLFToolBar;
     TButtAnyadirSelecFechas: TToolButton;
     TButtQuitarSelecFechas: TToolButton;
     TButtAnyadirSelecClientes: TToolButton;
     TButtQuitarSelecClientes: TToolButton;
     PNLClientes: TLFPanel;
     EFClienteDesde: TLFEditFind2000;
     EFClienteHasta: TLFEditFind2000;
     PNLNotasFacturacion: TLFPanel;
     MNotasFacturacion: TLFMemo;
     CBCerrar: TLFCheckBox;
     RETotalFactura: THYGRightEdit;
     BTSep5: TToolButton;
     PNTotal: TLFPanel;
     EFCanalDestino: TLFEditFind2000;
     TBFiltroProyectos: TLFToolBar;
     EFProyectos: TLFEditFind2000;
     TButtAnyadirSelecProy: TToolButton;
     TButtQuitarSelecProy: TToolButton;
     CBCertificar: TLFCheckBox;
     LBLProyecto: TLFLabel;
     TBFiltroAgrupaciones: TLFToolBar;
     TButtAnyadirSelecAgr: TToolButton;
     TButtQuitarSelecAgr: TToolButton;
     LBLAgrupacion: TLFLabel;
     EFAgrupaciones: TLFEditFind2000;
     ETitAgrupacion: TLFEdit;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     ETituloCanal: TLFEdit;
     ETituloClienteDesde: TLFEdit;
     ETituloClienteHasta: TLFEdit;
     ETituloProyecto: TLFEdit;
     PNLSeleccionProyecto: TLFPanel;
     PNLSeleccionAgrupacion: TLFPanel;
     PNLSeleccionFechas: TLFPanel;
     PNLSeleccionDestino: TLFPanel;
     LCanalDestino: TLFLabel;
     PNLSeleccionSerie: TLFPanel;
     LTotalFactura: TLFLabel;
     LPeriodoFacturacion: TLFLabel;
     CBPeriodoFacturacion: TLFComboBox;
     TBFormaPago: TLFToolBar;
     TButtAnyadirSelecFormaPago: TToolButton;
     TButtQuitarSelecFormaPago: TToolButton;
     PNLFormaPago: TLFPanel;
     LDesdeFormaPago: TLFLabel;
     LHastaFormaPago: TLFLabel;
     EFDesdeFormaPago: TLFEditFind2000;
     EFHastaFormaPago: TLFEditFind2000;
     EDesdeFormaPago: TLFEdit;
     EHastaFormaPago: TLFEdit;
     PNLFecha: TLFPanel;
     LFiltroDesdeFecha: TLFLabel;
     DEFiltroFechaDesde: TLFDateEdit;
     DEFiltroFechaHasta: TLFDateEdit;
     PNLFiltroFormaPago: TLFPanel;
     LFiltroDesdeFormaPago: TLFLabel;
     EFFiltroDesdeFormaPago: TLFEditFind2000;
     EFFiltroHastaFormaPago: TLFEditFind2000;
     EFiltroDesdeFormaPago: TLFEdit;
     EFiltroHastaFormaPago: TLFEdit;
     TBFitros1: TLFToolBar;
     TButtRefrescar: TToolButton;
     PNLSeleccionPeriodoFacturacion: TLFPanel;
     ESerieDestino: TLFEdit;
     EFSerieDestino: TLFEditFind2000;
     LSerieDestino: TLFLabel;
     PNLFiltroCliente: TLFPanel;
     PNLFiltroClienteDesde: TLFLabel;
     EFFiltroDesdeCliente: TLFEditFind2000;
     EFFiltroHastaCliente: TLFEditFind2000;
     EFiltroHastaCliente: TLFEdit;
     EFiltroDesdeCliente: TLFEdit;
     TBSep2: TToolButton;
     TSep3: TToolButton;
     TBFiltros0: TLFToolBar;
     TBSep1: TToolButton;
     TButtInicializa: TToolButton;
     PNLDetalle: TLFPanel;
     LFCategoryAction1: TLFCategoryAction;
     AAsignaEntrada: TAction;
     BtnMultiSerie: TSpeedButton;
     LSerieOrigen: TLFLabel;
     PNLEspaciador: TLFPanel;
     PNLImporteSeleccion: TLFPanel;
     LImporteSeleccion: TLFLabel;
     EImporteSeleccion: TLFEdit;
     SBImporteSeleccion: TSpeedButton;
     CBOcultarMuestras: TLFCheckBox;
     PNLOcultarMuestras: TLFPanel;
     CBFacturaResumida: TLFCheckBox;
     PNLFiltroAgente: TLFPanel;
     LAgente: TLFLabel;
     EFFiltroAgente: TLFEditFind2000;
     EFiltroAgente: TLFEdit;
     PNLFechaDoc: TLFPanel;
     CBFechaEntregaPrev: TLFCheckBox;
     CBFechaAlbaran: TLFCheckBox;
     PNLFiltorDiaPago: TLFPanel;
     CBSinDiaPago: TLFCheckBox;
     LFiltroDiaPago: TLFLabel;
     EFiltroDesdeDiaPago: TLFEdit;
     EFiltroHastaDiaPago: TLFEdit;
     PNLOpciones: TLFPanel;
     PNLFiltros: TLFPanel;
     splitter: TSplitter;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtMostrarFiltrosClick(Sender: TObject);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtDesmarcarClick(Sender: TObject);
     procedure TButtAnyadirSelecFechasClick(Sender: TObject);
     procedure TButtQuitarSelecFechasClick(Sender: TObject);
     procedure TButtAnyadirSelecClientesClick(Sender: TObject);
     procedure TButtQuitarSelecClientesClick(Sender: TObject);
     procedure EFClienteDesdeChange(Sender: TObject);
     procedure EFClienteHastaChange(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure TButtFacturarClick(Sender: TObject);
     procedure DBGFAlbaranesRowChange(Sender: TObject);
     procedure EFCanalDestinoChange(Sender: TObject);
     procedure EFProyectosChange(Sender: TObject);
     procedure TButtAnyadirSelecProyClick(Sender: TObject);
     procedure TButtQuitarSelecProyClick(Sender: TObject);
     procedure EFProyectosBusqueda(Sender: TObject);
     procedure EFAgrupacionesChange(Sender: TObject);
     procedure TButtAnyadirSelecAgrClick(Sender: TObject);
     procedure TButtQuitarSelecAgrClick(Sender: TObject);
     procedure DBGFAlbaranesDblClick(Sender: TObject);
     procedure DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFDesdeFormaPagoChange(Sender: TObject);
     procedure EFHastaFormaPagoChange(Sender: TObject);
     procedure TButtAnyadirSelecFormaPagoClick(Sender: TObject);
     procedure TButtQuitarSelecFormaPagoClick(Sender: TObject);
     procedure EFFiltroDesdeFormaPagoChange(Sender: TObject);
     procedure EFFiltroHastaFormaPagoChange(Sender: TObject);
     procedure EFSerieDestinoChange(Sender: TObject);
     procedure EFSerieDestinoBusqueda(Sender: TObject);
     procedure EFFiltroDesdeClienteChange(Sender: TObject);
     procedure EFFiltroHastaClienteChange(Sender: TObject);
     procedure TButtInicializaClick(Sender: TObject);
     procedure AAsignaEntradaExecute(Sender: TObject);
     procedure BtnMultiSerieClick(Sender: TObject);
     procedure CBPeriodoFacturacionChange(Sender: TObject);
     procedure SBImporteSeleccionClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure CBOcultarMuestrasChange(Sender: TObject);
     procedure EFFiltroAgenteChange(Sender: TObject);
     procedure CBFechaEntregaPrevChange(Sender: TObject);
     procedure CBFechaAlbaranChange(Sender: TObject);
  private
     { Private declarations }
     // Serie: string;
     MostrandoFiltros: boolean;
     SentenciaWhere: TStringList;
     PeriodoFacturacion: string;
     procedure InicializaFiltros;
  public
     { Public declarations }
     procedure Importe(Importe: string);
  end;

var
  FMFacturaAlbaranes : TFMFacturaAlbaranes;

implementation

uses UDMMain, UDMFacturaAlbaranes, UEntorno, UUtiles, UFMain, UParam, HYFIBQuery, UFMMultiSerie, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMFacturaAlbaranes.FormCreate(Sender: TObject);
begin
  inherited;
  SentenciaWhere := TStringList.Create;
  MostrandoFiltros := False;

  AbreData(TDMFacturaAlbaranes, DMFacturaAlbaranes);

  PNLNotasFacturacion.Height := 50;
  // DMMain.RellenaSeries(CBSeries.Items);
  RellenaPeriodoFacturacion(CBPeriodoFacturacion.Items);
  // CBSeries.ItemIndex := 0;
  CBPeriodoFacturacion.ItemIndex := 0;
  PeriodoFacturacion := '  ';
  DTPDesdeFecha.Date := REntorno.FechaTrabSH;
  DTPHastaFecha.Date := REntorno.FechaTrabSH;
  DTPFechaFactura.Date := REntorno.FechaTrabSH;
  CBCerrar.Checked := (LeeParametro('FACALB0001', '') = 'S');
  EFSerieDestino.Text := LeeParametro('FACALB0002', '');
  CBFechaAlbaran.Checked := (LeeParametro('FACALB0003', '') = 'S');
  EFCanalDestino.Text := REntorno.CanalStr;

  DBGFAlbaranes.ColumnasChecked.Strings[DBGFAlbaranes.ColumnasCheckBoxes.IndexOf('ENTRADA_FACTURACION')] := IntToStr(REntorno.Entrada);
  PNLEspaciador.Width := TButtRefrescar.Width + TButtInicializa.Width;
  PMain.Height := PNLOpciones.Top + PNLOpciones.Height;

  InicializaFiltros;
  GetBitmapFromImageList(SBImporteSeleccion, 1, DMMain.ILMain_Ac, 19);
end;

procedure TFMFacturaAlbaranes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (DMMain.EstadoKri(473) = 0) then
     DMFacturaAlbaranes.DesmarcarAlbaranes;

  inherited;

  SentenciaWhere.Free;

  CierraData(DMFacturaAlbaranes);
end;

procedure TFMFacturaAlbaranes.FormShow(Sender: TObject);
var
  c : integer;
begin
  inherited;
  if Self.Visible then
     TButtRefrescar.Click;

  // No es compatible la Factura Resumida con el KRICONF_258 que obtiene lotes del segundo canal si no hay existencias.
  if (DMMain.EstadoKri(285) = 1) then
  begin
     CBFacturaResumida.Checked := False;
     CBFacturaResumida.Visible := False;
  end;

  c := EncuentraField(DBGFAlbaranes, 'O_COMPRA');
  if (c >= 0) then
     DBGFAlbaranes.Columns[c].Visible := (REntorno.Pais = 'CHL');

  DTPFechaFactura.Enabled := not (CBFechaEntregaPrev.Checked or CBFechaAlbaran.Checked);
end;

procedure TFMFacturaAlbaranes.InicializaFiltros;
begin
  // Obtengo fecha de primer albaran abierto
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 FECHA ');
        SQL.Add(' FROM VER_CABECERAS_ALBARAN ');
        SQL.Add(' WHERE ');
        SQL.Add('   EMPRESA = ?EMPRESA AND ');
        SQL.Add('   EJERCICIO > 2001 AND ');
        SQL.Add('   CANAL = ?CANAL AND ');
        SQL.Add('   TIPO = ''ALB'' AND ');
        SQL.Add('   (ESTADO <> 2 AND ESTADO <> 5 AND ESTADO <> 6) AND ');
        SQL.Add('   ((EJERCICIO = ?EJERCICIO) OR (EJERCICIO < ?EJERCICIO)) ');
        SQL.Add('   AND ((SERIE = ?SERIE)  OR  (''x''||?SERIE = ''x ''))AND ');
        SQL.Add('   GARANTIA = 0 ');
        SQL.Add(' ORDER BY FECHA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := ' ';
        ExecQuery;
        DEFiltroFechaDesde.Date := FieldByName['FECHA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si queda vacio que tome el inicio del ejercicio
  if (DEFiltroFechaDesde.Date < EncodeDate(2000, 01, 01)) then
     DEFiltroFechaDesde.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  DEFiltroFechaHasta.Date := REntorno.FechaTrabSH;

  EFFiltroDesdeFormaPago.Text := '';
  EFFiltroHastaFormaPago.Text := '';

  EFFiltroDesdeCliente.Text := '';
  EFFiltroHastaCliente.Text := '';

  EFiltroDesdeDiaPago.Text := '1';
  EFiltroHastaDiaPago.Text := '30';

  EFFiltroAgente.Text := '';

  SentenciaWhere.Clear;
  CBPeriodoFacturacion.ItemIndex := 0;
  PeriodoFacturacion := '  ';
  CBSinDiaPago.Checked := True;
end;

procedure TFMFacturaAlbaranes.TButtMostrarFiltrosClick(Sender: TObject);
var
  min_fecha, max_fecha : TDateTime;
  min_cliente, max_cliente : integer;
  min_proyecto : integer;
  min_agrupacion : string;
begin
  if not MostrandoFiltros then
  begin
     // Se muestran los filtros...
     PMain.Height := 233;

     MostrandoFiltros := True;
     TButtMostrarFiltros.ImageIndex := 22;
     TButtMostrarFiltros.Hint := _('Ocultar los filtros de marcado');

     // Se actualiza la información de los filtros...
     DMFacturaAlbaranes.DameMinMaxFechaCliente(min_fecha, max_fecha, min_cliente, max_cliente);
     DMFacturaAlbaranes.DameMinProyecto(min_proyecto);
     DTPDesdeFecha.Date := min_fecha;
     DTPHastaFecha.Date := max_fecha;
     EFClienteDesde.Text := IntToStr(min_cliente);
     EFClienteHasta.Text := IntToStr(max_cliente);
     EFProyectos.Text := IntToStr(min_Proyecto);
     DMFacturaAlbaranes.DameMinAgrupacion(min_agrupacion);
     EFAgrupaciones.Text := min_agrupacion;
  end
  else
  begin
     // Se OCULTAN los filtros...
     PMain.Height := PNLOpciones.Top + PNLOpciones.Height;

     MostrandoFiltros := False;
     TButtMostrarFiltros.ImageIndex := 23;
     TButtMostrarFiltros.Hint := _('Mostrar los filtros de marcado');
  end;
end;

procedure TFMFacturaAlbaranes.TButtTodosClick(Sender: TObject);
begin
  DMFacturaAlbaranes.MarcarTodos(0, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, CBOcultarMuestras.Checked, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtDesmarcarClick(Sender: TObject);
begin
  DMFacturaAlbaranes.MarcarTodos(1, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, CBOcultarMuestras.Checked, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtAnyadirSelecFechasClick(Sender: TObject);
begin
  DMFacturaAlbaranes.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, 0, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtQuitarSelecFechasClick(Sender: TObject);
begin
  DMFacturaAlbaranes.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, 1, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtAnyadirSelecClientesClick(Sender: TObject);
begin
  if ((EFClienteDesde.Text > '') and (EFClienteHasta.Text > '')) then
     DMFacturaAlbaranes.MarcarPorCliente(StrToInt(EFClienteDesde.Text),
        StrToInt(EFClienteHasta.Text), 0, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
        CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtQuitarSelecClientesClick(Sender: TObject);
begin
  DMFacturaAlbaranes.MarcarPorCliente(StrToInt(EFClienteDesde.Text),
     StrToInt(EFClienteHasta.Text), 1, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.EFClienteDesdeChange(Sender: TObject);
begin
  ETituloClienteDesde.Text := DameTituloCliente(StrToIntDef(EFClienteDesde.Text, 0));
end;

procedure TFMFacturaAlbaranes.EFClienteHastaChange(Sender: TObject);
begin
  ETituloClienteHasta.Text := DameTituloCliente(StrToIntDef(EFClienteHasta.Text, 0));
end;

procedure TFMFacturaAlbaranes.TButtRefrescarClick(Sender: TObject);
begin
  DMFacturaAlbaranes.AbreTabla(SentenciaWhere, PeriodoFacturacion, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date,
     Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text),
     Trim(EFFiltroAgente.Text), CBOcultarMuestras.Checked, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtFacturarClick(Sender: TObject);
begin
  if Confirma then
  begin
     with DMFacturaAlbaranes do
     begin
        if (LotesIntroducidosCorrectamente(StrToIntDef(EFProyectos.Text, -1), CBCertificar.Checked)) then
           if (NroSerieIntroducidosCorrectamente(StrToIntDef(EFProyectos.Text, -1), CBCertificar.Checked)) then
              if (DocumentoTraspasado(StrToIntDef(EFProyectos.Text, -1), CBCertificar.Checked)) then
                 if (PermitirAlbaranesImporteCero(StrToIntDef(EFProyectos.Text, -1), CBCertificar.Checked)) then
                    Facturar(EFSerieDestino.Text, StrToIntDef(EFCanalDestino.Text, REntorno.Canal), StrToIntDef(EFProyectos.Text, -1), CBCertificar.Checked, DTPFechaFactura.Date, CBCerrar.Checked, CBFacturaResumida.Checked, CBFechaEntregaPrev.Checked, CBFechaAlbaran.Checked);
     end;
  end;
end;

procedure TFMFacturaAlbaranes.DBGFAlbaranesRowChange(Sender: TObject);
begin
  DMFacturaAlbaranes.DameNotasFacturacion(MNotasFacturacion.Lines);
end;

procedure TFMFacturaAlbaranes.Importe(Importe: string);
begin
  RETotalFactura.Text := Importe;
end;

procedure TFMFacturaAlbaranes.EFCanalDestinoChange(Sender: TObject);
begin
  ETituloCanal.Text := DameTituloCanal(StrToIntDef(EFCanalDestino.Text, 0));
end;

procedure TFMFacturaAlbaranes.EFProyectosChange(Sender: TObject);
begin
  ETituloProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyectos.Text, 0));
end;

procedure TFMFacturaAlbaranes.TButtAnyadirSelecProyClick(Sender: TObject);
begin
  if (EFProyectos.Text > '') then
     DMFacturaAlbaranes.MarcarPorProyecto(StrToInt(EFProyectos.Text), 0, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
        CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtQuitarSelecProyClick(Sender: TObject);
begin
  if (EFProyectos.Text > '') then
     DMFacturaAlbaranes.MarcarPorProyecto(StrToInt(EFProyectos.Text), 1, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
        CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.EFProyectosBusqueda(Sender: TObject);
begin
  EFProyectos.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

procedure TFMFacturaAlbaranes.TButtAnyadirSelecAgrClick(Sender: TObject);
begin
  if (EFAgrupaciones.Text > '') then
     DMFacturaAlbaranes.MarcarPorAgrupacion(EFAgrupaciones.Text, 0, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
        CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtQuitarSelecAgrClick(Sender: TObject);
begin
  if (EFAgrupaciones.Text > '') then
     DMFacturaAlbaranes.MarcarPorAgrupacion(EFAgrupaciones.Text, 1, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
        CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.EFAgrupacionesChange(Sender: TObject);
begin
  ETitAgrupacion.Text := DameTituloAgrupacion('C', EFAgrupaciones.Text);
end;

procedure TFMFacturaAlbaranes.DBGFAlbaranesDblClick(Sender: TObject);
begin
  FMain.TraspasoDeDocumentosSalida(DMFacturaAlbaranes.QMAlbaranesID_S.AsInteger);
end;

procedure TFMFacturaAlbaranes.DBGFAlbaranesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
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
        if (DMFacturaAlbaranes.QMAlbaranesFACTURABLE.AsInteger = 0) then
           ColorInactivo(Canvas)
        else
        begin
           if (Column.FieldName = 'ENTRADA_FACTURACION') then
              ColorEdicion(Canvas)
           else
              ColorInfo(Canvas);

           // Resalto LIQUIDO si no se permite Facturar Importe Cero y el importe es 0.
           if (not DMFacturaAlbaranes.PermitirCerrarFacturasCero) and (Column.FieldName = 'LIQUIDO') and (DMFacturaAlbaranes.QMAlbaranesLIQUIDO.AsFloat = 0) then
              ColorResaltado(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFacturaAlbaranes.EFDesdeFormaPagoChange(Sender: TObject);
begin
  inherited;
  EDesdeFormaPago.Text := DameTituloFormaPago(EFDesdeFormaPago.Text);
end;

procedure TFMFacturaAlbaranes.EFHastaFormaPagoChange(Sender: TObject);
begin
  inherited;
  EHastaFormaPago.Text := DameTituloFormaPago(EFHastaFormaPago.Text);
end;

procedure TFMFacturaAlbaranes.TButtAnyadirSelecFormaPagoClick(Sender: TObject);
begin
  inherited;
  if ((EFDesdeFormaPago.Text > '') and (EFHastaFormaPago.Text > '')) then
     DMFacturaAlbaranes.MarcarPorFormaPago(EFDesdeFormaPago.Text, EFHastaFormaPago.Text, 0, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
        CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.TButtQuitarSelecFormaPagoClick(Sender: TObject);
begin
  inherited;
  DMFacturaAlbaranes.MarcarPorFormaPago(EFDesdeFormaPago.Text, EFHastaFormaPago.Text, 1, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.EFFiltroDesdeFormaPagoChange(Sender: TObject);
begin
  inherited;
  EFiltroDesdeFormaPago.Text := DameTituloFormaPago(EFFiltroDesdeFormaPago.Text);
end;

procedure TFMFacturaAlbaranes.EFFiltroHastaFormaPagoChange(Sender: TObject);
begin
  inherited;
  EFiltroHastaFormaPago.Text := DameTituloFormaPago(EFFiltroHastaFormaPago.Text);
end;

procedure TFMFacturaAlbaranes.EFSerieDestinoChange(Sender: TObject);
begin
  inherited;
  ESerieDestino.Text := DameTituloSerie(EFSerieDestino.Text);
end;

procedure TFMFacturaAlbaranes.EFSerieDestinoBusqueda(Sender: TObject);
begin
  inherited;
  EFSerieDestino.CondicionBusqueda := 'CANAL=' + EFCanalDestino.Text;
end;

procedure TFMFacturaAlbaranes.EFFiltroDesdeClienteChange(Sender: TObject);
begin
  inherited;
  EFiltroDesdeCliente.Text := DameTituloCliente(StrToIntDef(EFFiltroDesdeCliente.Text, 0));
end;

procedure TFMFacturaAlbaranes.EFFiltroHastaClienteChange(Sender: TObject);
begin
  inherited;
  EFiltroHastaCliente.Text := DameTituloCliente(StrToIntDef(EFFiltroHastaCliente.Text, 0));
end;

procedure TFMFacturaAlbaranes.TButtInicializaClick(Sender: TObject);
begin
  inherited;
  InicializaFiltros;
  TButtRefrescar.Click;
end;

procedure TFMFacturaAlbaranes.AAsignaEntradaExecute(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     DMFacturaAlbaranes.AsignaEntrada;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMFacturaAlbaranes.BtnMultiSerieClick(Sender: TObject);
begin
  inherited;
  SentenciaWhere.Clear;
  TFMMultiSerie.Create(Self).RellenaSeries(SentenciaWhere);
  TButtRefrescar.Click;
end;

procedure TFMFacturaAlbaranes.CBPeriodoFacturacionChange(Sender: TObject);
begin
  inherited;
  // CBSeriesChange(Sender);
  if (CBPeriodoFacturacion.Text = _('Todos los Periodos')) then
     PeriodoFacturacion := '  '
  else
     PeriodoFacturacion := Copy(CBPeriodoFacturacion.Text, 1, Pos(' ', CBPeriodoFacturacion.Text) - 1);

  TButtRefrescar.Click;
end;

procedure TFMFacturaAlbaranes.SBImporteSeleccionClick(Sender: TObject);
var
  Importe : double;
begin
  inherited;
  Importe := StrToFloatDef(EImporteSeleccion.Text, -999999);
  DMFacturaAlbaranes.MarcarPorImporte(Importe, 0, DEFiltroFechaDesde.Date, DEFiltroFechaHasta.Date, Trim(EFFiltroDesdeFormaPago.Text), Trim(EFFiltroHastaFormaPago.Text), Trim(EFFiltroDesdeCliente.Text), Trim(EFFiltroHastaCliente.Text), PeriodoFacturacion, StrToIntDef(EFiltroDesdeDiaPago.Text, 0), StrToIntDef(EFiltroHastaDiaPago.Text, 0),
     CBSinDiaPago.Checked);
end;

procedure TFMFacturaAlbaranes.CBOcultarMuestrasChange(Sender: TObject);
begin
  inherited;
  if Self.Visible then
  begin
     // Con esto evito que queden marcados registros que se ocultan
     TButtDesmarcar.Click;

     TButtRefrescar.Click;
  end;
end;

procedure TFMFacturaAlbaranes.EFFiltroAgenteChange(Sender: TObject);
begin
  inherited;
  EFiltroAgente.Text := DameTituloAgente(StrToIntDef(EFFiltroAgente.Text, 0));
end;

procedure TFMFacturaAlbaranes.CBFechaEntregaPrevChange(Sender: TObject);
begin
  inherited;
  if CBFechaEntregaPrev.Checked then
     CBFechaAlbaran.Checked := False;
  DTPFechaFactura.Enabled := not (CBFechaEntregaPrev.Checked or CBFechaAlbaran.Checked);
end;

procedure TFMFacturaAlbaranes.CBFechaAlbaranChange(Sender: TObject);
begin
  inherited;
  if CBFechaAlbaran.Checked then
     CBFechaEntregaPrev.Checked := False;
  DTPFechaFactura.Enabled := not (CBFechaEntregaPrev.Checked or CBFechaAlbaran.Checked);
end;

end.
