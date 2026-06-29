unit UFMFacturarTickets;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDMFacturarTickets,
  StdCtrls, ULFEditFind2000, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox,
  Mask, rxToolEdit, ULFDateEdit, DBCtrls, ULFDBEdit, Buttons, ULFComboBox,
  ULFEdit, UFPEditSimple, UNavigator;

type
  TFMFacturarTickets = class(TFPEditSimple)
     PNLFiltros: TPanel;
     DBGFTickets: TDBGridFind2000;
     LDesdeSesion: TLFLabel;
     LHastaSesion: TLFLabel;
     EFDesdeSesion: TLFEditFind2000;
     EFHastaSesion: TLFEditFind2000;
     LSerieOrigen: TLFLabel;
     CBPriorizaFormaPago: TLFCheckBox;
     CBPriorizaStock: TLFCheckBox;
     CBFacturaPorImporte: TLFCheckBox;
     CBFacturaPorLinea: TLFCheckBox;
     BSep1: TToolButton;
     TButtFacturar: TToolButton;
     AFacturar: TAction;
     CBFechaValor: TLFCheckBox;
     DEFechaValor: TLFDateEdit;
     AMostrarTodos: TAction;
     LDesdeCaja: TLFLabel;
     LHastaCaja: TLFLabel;
     EFHastaCaja: TLFEditFind2000;
     EFDesdeCaja: TLFEditFind2000;
     TSep2: TToolButton;
     TButtMarcarTodos: TToolButton;
     TButtDesmarcar: TToolButton;
     AMarcarTodos: TAction;
     ADesmarcar: TAction;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     LFCategoryAction1: TLFCategoryAction;
     TButtRefrescar: TToolButton;
     PNLTotal: TLFPanel;
     LTotal: TLFLabel;
     DBETotal: TLFDbedit;
     BTSep2: TToolButton;
     LDesdeTurno: TLabel;
     LHastaTurno: TLabel;
     EFDesdeTurno: TLFEditFind2000;
     EFHastaTurno: TLFEditFind2000;
     AExportarSFV: TAction;
     LSerieDestino: TLFLabel;
     AExportarExcel: TAction;
     LFCategoryAction3: TLFCategoryAction;
     AListadoTicket: TAction;
     AListadoTicketDetalle: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfListadoTicket: TAction;
     AConfListadoTicketDetalle: TAction;
     GBEstado: TGroupBox;
     CBMostrarTodos: TLFCheckBox;
     CBAbierto: TLFCheckBox;
     CBAnuladas: TLFCheckBox;
     CBCerradas: TLFCheckBox;
     CBAnuladoValido: TLFCheckBox;
     PNLOpciones: TLFPanel;
     PNLFechas: TLFPanel;
     BFechaHoy: TSpeedButton;
     BFechaAnterior: TSpeedButton;
     BFechaSiguiente: TSpeedButton;
     PNLLimites: TLFPanel;
     LTotalAnulados: TLFLabel;
     DBETotalAnulados: TLFDbedit;
     CBSerieOrigen: TLFComboBox;
     CBSerieDestino: TLFComboBox;
     AAnulaTicket: TAction;
     GBTipoTickets: TGroupBox;
     CBNoFacturados: TLFCheckBox;
     CBFacturados: TLFCheckBox;
     AListadoIngresosEgresos: TAction;
     AConfIngresosEgresos: TAction;
     LCanalDestino: TLFLabel;
     EFCanalDestino: TLFEditFind2000;
     ETituloCanal: TLFEdit;
     BAsignaCanal: TSpeedButton;
     ERigTicket: TLFEdit;
     LRit: TLFLabel;
     SBLimpiarRit: TSpeedButton;
     ALimpiaFiltro: TAction;
     PNLSerieOrigen: TLFPanel;
     TSep3: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFSesionesChange(Sender: TObject);
     procedure AFacturarExecute(Sender: TObject);
     procedure AMostrarTodosExecute(Sender: TObject);
     procedure CBFechaValorClick(Sender: TObject);
     procedure EFCajaChange(Sender: TObject);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure ADesmarcarExecute(Sender: TObject);
     procedure DEFechaChange(Sender: TObject);
     procedure BFechaHoyClick(Sender: TObject);
     procedure BFechaAnteriorClick(Sender: TObject);
     procedure BFechaSiguienteClick(Sender: TObject);
     procedure DBGFTicketsDblClick(Sender: TObject);
     procedure DBGFTicketsCellClick(Column: TColumn);
     procedure DBGFTicketsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFTurnoChange(Sender: TObject);
     procedure AExportarSFVExecute(Sender: TObject);
     procedure AExportarExcelExecute(Sender: TObject);
     procedure ATicketsExecute(Sender: TObject);
     procedure ATicketsConfExecute(Sender: TObject);
     procedure AListadoTicketExecute(Sender: TObject);
     procedure AListadoTicketDetalleExecute(Sender: TObject);
     procedure AConfListadoTicketExecute(Sender: TObject);
     procedure AConfListadoTicketDetalleExecute(Sender: TObject);
     procedure CBMostrarTodosClick(Sender: TObject);
     procedure CBFiltroEstadoClick(Sender: TObject);
     procedure AValidarAnuladosExecute(Sender: TObject);
     procedure CBSerieOrigenChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AAnulaTicketExecute(Sender: TObject);
     procedure AListadoIngresosEgresosExecute(Sender: TObject);
     procedure AConfIngresosEgresosExecute(Sender: TObject);
     procedure EFCanalDestinoChange(Sender: TObject);
     procedure BAsignaCanalClick(Sender: TObject);
     procedure ERigTicketChange(Sender: TObject);
     procedure ERigTicketKeyPress(Sender: TObject; var Key: char);
     procedure ALimpiaFiltroExecute(Sender: TObject);
  private
     { Private declarations }
     DM: TDMFacturarTickets;
     ColActual: TColumn;
     param_TPVFACT003: boolean;
     FiltroActivo: boolean;
     procedure FiltrarSesion;
     function DameSerieDestino: string;
     function DameSerieOrigen: string;
  public
     { Public declarations }
     function FacturarUnTicket(IdTicket: integer): integer;
  end;

var
  FMFacturarTickets : TFMFacturarTickets;

implementation

uses
  UDMMain, UFormGest, UEntorno, DateUtils, UUtiles, UFMain, UFMTicketVenta, UFMListConfig, UParam, UDameDato, URellenaLista;

{$R *.dfm}

procedure TFMFacturarTickets.FormCreate(Sender: TObject);
var
  PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas : boolean;
  Apertura, Cierre : TDateTime;
begin
  inherited;

  AbreDataVarias(TDMFacturarTickets, DM, Self);
  FiltroActivo := False;
  try
     DBGFTickets.DataSource := DM.DSQMTickets;
     DBGFTickets.ColumnasChecked.Strings[DBGFTickets.ColumnasCheckBoxes.IndexOf('ENTRADA_FAC')] := IntToStr(REntorno.Entrada);

     DM.TipoFacturacion(PriorizaFormaPago, PriorizaStock, PorImportes, PorLineas);
     CBPriorizaFormaPago.Checked := PriorizaFormaPago;
     CBPriorizaStock.Checked := PriorizaStock;
     CBFacturaPorImporte.Checked := PorImportes;
     CBFacturaPorLinea.Checked := PorLineas;

     CBFechaValor.Checked := False;
     DEFechaValor.Date := REntorno.FechaTrab;
     DEFechaValor.Enabled := CBFechaValor.Checked;

     // Filtramos con fecha actual
     if (LeeParametro('TPVTICC008', DameSerieOrigen) = 'S') then
     begin
        // Esto establece las fechas y filtra
        BFechaHoy.Click;
     end
     else
     begin
        DameMinMax('EJE', Apertura, Cierre);
        DEDesdeFecha.Date := Apertura;
        DEHastaFecha.Date := Cierre;
     end;

     ColActual := DBGFTickets.Columns[0];

     // Desplegables de series
     RellenaSeries(CBSerieOrigen.Items, False);
     CBSerieOrigen.ItemIndex := 0;
     while ((CBSerieOrigen.ItemIndex < CBSerieOrigen.Items.Count - 1) and
           (Copy(CBSerieOrigen.Items[CBSerieOrigen.ItemIndex], 1, Length(REntorno.Serie + ' ')) <> REntorno.Serie + ' ')) do
        CBSerieOrigen.ItemIndex := CBSerieOrigen.ItemIndex + 1;
     CBSerieOrigenChange(Self);

     RellenaSeries(CBSerieDestino.Items, False);

     // Cada ticket ira a su canal.
     EFCanalDestino.Text := '0';
     EFCanalDestinoChange(Sender);

     // Asignacion de imagenes a botones
     GetBitmapFromImageList(BFechaHoy, 1, DMMain.ILMain_Ac, 9);
     GetBitmapFromImageList(BFechaHoy, 2, DMMain.ILMain_In, 9);
     GetBitmapFromImageList(BFechaAnterior, 1, DMMain.ILMain_Ac, 51);
     GetBitmapFromImageList(BFechaAnterior, 2, DMMain.ILMain_In, 51);
     GetBitmapFromImageList(BFechaSiguiente, 1, DMMain.ILMain_Ac, 25);
     GetBitmapFromImageList(BFechaSiguiente, 2, DMMain.ILMain_In, 25);
     GetBitmapFromImageList(BAsignaCanal, 1, DMMain.ILMain_Ac, 132);
  finally
     FiltroActivo := True;
  end;
end;

procedure TFMFacturarTickets.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DM);
end;

procedure TFMFacturarTickets.EFSesionesChange(Sender: TObject);
var
  DesdeCaja, HastaCaja : integer;
begin
  inherited;
  DM.DameMinMaxCaja(StrToIntDef(EFDesdeSesion.Text, 0), StrToIntDef(EFHastaSesion.Text, 0), DesdeCaja, HastaCaja);
  EFDesdeCaja.Text := IntToStr(DesdeCaja);
  EFHastaCaja.Text := IntToStr(HastaCaja);
  FiltrarSesion;
end;

procedure TFMFacturarTickets.AFacturarExecute(Sender: TObject);
begin
  inherited;

  if (DM.ComprobarLinea) then
  begin
     AFacturar.Enabled := False;
     TButtFacturar.Enabled := False;
     try
        DM.FacturaUnicaMuestra(DameSerieDestino, StrToIntDef(EFDesdeSesion.Text, 0), StrToIntDef(EFHastaSesion.Text, 0), CBPriorizaFormaPago.Checked, CBPriorizaStock.Checked, CBFacturaPorImporte.Checked, CBFacturaPorLinea.Checked, CBFechaValor.Checked, DEFechaValor.Date);
     finally
        // FiltraSesion refresca los datos y desmarca los registros seleccionados previamente (por si hubo error al facturar)
        FiltrarSesion;
        AFacturar.Enabled := True;
        TButtFacturar.Enabled := True;
     end;
  end
  else
     ShowMessage(_('¡No se ha seleccionado ninguna línea para facturar!'));
end;

procedure TFMFacturarTickets.AMostrarTodosExecute(Sender: TObject);
var
  Apertura, Cierre : TDateTime;
begin
  inherited;
  FiltroActivo := False;
  try
     DameMinMax('EJE', Apertura, Cierre);
     DEDesdeFecha.Date := Apertura;
     DEHastaFecha.Date := Cierre;
     CBNoFacturados.Checked := True;
     CBFacturados.Checked := False;
     CBSerieOrigenChange(Self);
     ALimpiaFiltroExecute(Self);
  finally
     FiltroActivo := True;
  end;
  FiltrarSesion;
end;

procedure TFMFacturarTickets.CBFechaValorClick(Sender: TObject);
begin
  inherited;
  DEFechaValor.Enabled := CBFechaValor.Checked;
end;

procedure TFMFacturarTickets.EFCajaChange(Sender: TObject);
var
  DesdeTurno, HastaTurno : integer;
begin
  inherited;
  FiltroActivo := False;
  try
     DM.DameMinMaxTurno(StrToIntDef(EFDesdeSesion.Text, 0), StrToIntDef(EFHastaSesion.Text, 0), StrToIntDef(EFDesdeCaja.Text, 0), StrToIntDef(EFHastaCaja.Text, 0), DesdeTurno, HastaTurno);
     EFDesdeTurno.Text := IntToStr(DesdeTurno);
     EFHastaTurno.Text := IntToStr(HastaTurno);
  finally
     FiltroActivo := True;
  end;
  FiltrarSesion;
end;

procedure TFMFacturarTickets.AMarcarTodosExecute(Sender: TObject);
begin
  inherited;
  DM.Marcar(REntorno.Entrada, StrToIntDef(EFDesdeSesion.Text, 0), StrToIntDef(EFHastaSesion.Text, 0), StrToIntDef(EFDesdeCaja.Text, 0), StrToIntDef(EFHastaCaja.Text, 0), StrToIntDef(EFDesdeTurno.Text, 0), StrToIntDef(EFHastaTurno.Text, 0), False, DEDesdeFecha.Date, DEHastaFecha.Date);
end;

procedure TFMFacturarTickets.ADesmarcarExecute(Sender: TObject);
begin
  inherited;
  DM.Marcar(0, StrToIntDef(EFDesdeSesion.Text, 0), StrToIntDef(EFHastaSesion.Text, 0), StrToIntDef(EFDesdeCaja.Text, 0), StrToIntDef(EFHastaCaja.Text, 0), StrToIntDef(EFDesdeTurno.Text, 0), StrToIntDef(EFHastaTurno.Text, 0), False, DEDesdeFecha.Date, DEHastaFecha.Date);
end;

procedure TFMFacturarTickets.DEFechaChange(Sender: TObject);
begin
  inherited;
  FiltrarSesion;
end;

procedure TFMFacturarTickets.BFechaHoyClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecha.Date := Today;
  DEHastaFecha.Date := Today;
end;

procedure TFMFacturarTickets.BFechaAnteriorClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecha.Date := DEDesdeFecha.Date - 1;
  DEHastaFecha.Date := DEHastaFecha.Date - 1;
end;

procedure TFMFacturarTickets.BFechaSiguienteClick(Sender: TObject);
begin
  inherited;
  DEDesdeFecha.Date := DEDesdeFecha.Date + 1;
  DEHastaFecha.Date := DEHastaFecha.Date + 1;
end;

procedure TFMFacturarTickets.DBGFTicketsDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'RIT') and (DM.QMTicketsRIT.AsInteger <> 0)) then
  begin
     FMain.EjecutaAccion(FMain.AVentas);
     FMTicketVenta.LocalizaTicket(DM.QMTicketsRIT.AsInteger, DM.QMTicketsEJERCICIO.AsInteger, DM.QMTicketsCANAL.AsInteger, DM.QMTicketsSERIE.AsString);
  end;
end;

procedure TFMFacturarTickets.DBGFTicketsCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMFacturarTickets.DBGFTicketsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'RIT') then
     begin
        CeldaEnlace(TDBGridFind2000(Sender), Rect);
     end;

     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) <> 'CANAL_A_FACTURAR') and (UpperCase(Column.FieldName) <> 'ENTRADA_FAC')) then
        begin
           // Si no esta facturado lo pinto
           if (DM.QMTicketsFACTURA.AsString = '') then
           begin
              if (DM.QMTicketsESTADO.AsInteger = 5) then
                 ColorEdicion(Canvas)
              else
              if (DM.QMTicketsESTADO.AsInteger = 2) then
                 ColorBloqueado(Canvas)
              else
              if (DM.QMTicketsESTADO.AsInteger = 3) then
                 ColorResaltado(Canvas)
              else
                 ColorResaltado6(Canvas);
           end
           else
              ColorInactivo(Canvas);
        end;

        if (UpperCase(Column.FieldName) = 'PERIODO_FACTURACION') then
        begin
           if (DM.QMTicketsPERIODO_FACTURACION.AsString <> '00') then
              ColorResaltado(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMFacturarTickets.EFTurnoChange(Sender: TObject);
begin
  inherited;
  FiltrarSesion;
end;

procedure TFMFacturarTickets.AExportarSFVExecute(Sender: TObject);
begin
  inherited;
  DM.ExportarSFV;
end;

procedure TFMFacturarTickets.AExportarExcelExecute(Sender: TObject);
begin
  inherited;
  DM.ExportaTicketsAExcel;
end;

procedure TFMFacturarTickets.ATicketsExecute(Sender: TObject);
begin
  inherited;
  DM.MostrarTickets(0);
end;

procedure TFMFacturarTickets.ATicketsConfExecute(Sender: TObject);
begin
  inherited;
  // DM.MostrarTickets(1);
end;

procedure TFMFacturarTickets.AListadoTicketExecute(Sender: TObject);
begin
  inherited;
  DM.MostrarTickets(0);
end;

procedure TFMFacturarTickets.AListadoTicketDetalleExecute(Sender: TObject);
begin
  inherited;
  DM.MostrarTicketsDetalle(0);
end;

procedure TFMFacturarTickets.AConfListadoTicketExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(1040, Formato, Cabecera, Copias, Pijama, DameSerieOrigen, DM.frTickets, DM.HYReport, nil);
end;

procedure TFMFacturarTickets.AConfListadoTicketDetalleExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(1041, Formato, Cabecera, Copias, Pijama, DameSerieOrigen, DM.frTickets, DM.HYReport, nil);
end;

procedure TFMFacturarTickets.FiltrarSesion;
begin
  if FiltroActivo then
  begin
     DM.LimpiaEntradas;
     DM.FiltrarSesion(StrToIntDef(EFDesdeSesion.Text, 0), StrToIntDef(EFHastaSesion.Text, 0), StrToIntDef(EFDesdeCaja.Text, 0), StrToIntDef(EFHastaCaja.Text, 0), StrToIntDef(EFDesdeTurno.Text, 0), StrToIntDef(EFHastaTurno.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date, 'TIC', CBAnuladoValido.Checked, CBAbierto.Checked, CBAnuladas.Checked, CBCerradas.Checked, CBNoFacturados.Checked, CBFacturados.Checked, StrToIntDef(ERigTicket.Text, 0));
  end;
end;

procedure TFMFacturarTickets.CBMostrarTodosClick(Sender: TObject);
begin
  inherited;
  FiltroActivo := False;
  try
     if (CBMostrarTodos.Checked) then
     begin
        CBAnuladoValido.Checked := True;
        CBAbierto.Checked := True;
        CBAnuladas.Checked := True;
        CBCerradas.Checked := True;
     end;
  finally
     FiltroActivo := True;
  end;

  FiltrarSesion;
end;

procedure TFMFacturarTickets.CBFiltroEstadoClick(Sender: TObject);
begin
  inherited;
  CBMostrarTodos.Checked := False;
  FiltrarSesion;
end;

procedure TFMFacturarTickets.AValidarAnuladosExecute(Sender: TObject);
begin
  inherited;
  DM.ValidaAnulados;
  FiltrarSesion;
end;

procedure TFMFacturarTickets.CBSerieOrigenChange(Sender: TObject);
var
  DesdeSesion, HastaSesion : integer;
begin
  inherited;
  if (CBSerieOrigen.Text <> '') then
  begin
     DM.CambiaSerie(DameSerieOrigen);
     DM.DameMinMaxSesion(DesdeSesion, HastaSesion);
     EFDesdeSesion.Text := IntToStr(DesdeSesion);
     EFHastaSesion.Text := IntToStr(HastaSesion);

     param_TPVFACT003 := (LeeParametro('TPVFACT003', DameSerieOrigen) = 'S');
     CBAnuladas.Checked := param_TPVFACT003;

     EFSesionesChange(Sender);
  end;
end;

function TFMFacturarTickets.DameSerieDestino: string;
var
  Serie : string;
begin
  if (CBSerieDestino.Text <> '') then
  begin
     Serie := CBSerieDestino.Items[CBSerieDestino.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     Result := Serie;
  end;
end;

function TFMFacturarTickets.DameSerieOrigen: string;
var
  Serie : string;
begin
  if (CBSerieOrigen.Text <> '') then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSerieOrigen.Items[CBSerieOrigen.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     Result := Serie;
  end;
end;

procedure TFMFacturarTickets.FormShow(Sender: TObject);
var
  Texto : string;
begin
  inherited;
  Texto := CBSerieDestino.Text;
  CBSerieDestino.ItemIndex := 0;
  while ((CBSerieDestino.ItemIndex < CBSerieDestino.Items.Count - 1) and
        (CBSerieDestino.Items[CBSerieDestino.ItemIndex] <> Texto)) do
     CBSerieDestino.ItemIndex := CBSerieDestino.ItemIndex + 1;
end;

procedure TFMFacturarTickets.AAnulaTicketExecute(Sender: TObject);
begin
  inherited;
  DM.AnulaTicket;
end;

procedure TFMFacturarTickets.AListadoIngresosEgresosExecute(Sender: TObject);
begin
  inherited;
  DM.MostrarIngresosEgresos(0, StrToInt(EFDesdeSesion.Text), StrToInt(EFHastaSesion.Text), StrToInt(EFDesdeCaja.Text), StrToInt(EFHastaCaja.Text), StrToInt(EFDesdeTurno.Text), StrToInt(EFHastaTurno.Text), DameSerieOrigen);
end;

procedure TFMFacturarTickets.AConfIngresosEgresosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(1042, Formato, Cabecera, Copias, Pijama, DameSerieOrigen, DM.frTickets, DM.HYReport, nil);
end;

procedure TFMFacturarTickets.EFCanalDestinoChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFCanalDestino.Text, 0) = 0) then
     ETituloCanal.Text := _('Mismo canal que ticket')
  else
     ETituloCanal.Text := DameTituloCanal(StrToInt(EFCanalDestino.Text));
end;

procedure TFMFacturarTickets.BAsignaCanalClick(Sender: TObject);
begin
  inherited;
  DM.AsignaCanal(StrToIntDef(EFCanalDestino.Text, 0));
end;

procedure TFMFacturarTickets.ERigTicketChange(Sender: TObject);
begin
  inherited;
  FiltroActivo := False;
  try
     if (StrToIntDef(ERigTicket.Text, 0) > 0) then
     begin
        CBNoFacturados.Checked := True;
        CBFacturados.Checked := True;
        CBMostrarTodos.Checked := True;
     end;
  finally
     FiltroActivo := True;
  end;

  FiltrarSesion;
end;

procedure TFMFacturarTickets.ERigTicketKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  // Verificamos que solo se ingresen numeros
  if not (key in ['0'..'9', #8, #9, #13]) then
     key := #0;
end;

procedure TFMFacturarTickets.ALimpiaFiltroExecute(Sender: TObject);
begin
  inherited;
  CBMostrarTodos.Checked := False;
  CBAbierto.Checked := False;
  CBAnuladoValido.Checked := False;
  CBAnuladas.Checked := param_TPVFACT003;
  CBCerradas.Checked := True;
  CBNoFacturados.Checked := True;
  CBFacturados.Checked := False;
  ERigTicket.Text := '';
end;

function TFMFacturarTickets.FacturarUnTicket(IdTicket: integer): integer;
begin
  /// Factura un ticket y devuelve el ID_S de la factura generada

  Result := DM.FacturarUnTicket(IdTicket, DameSerieDestino, CBPriorizaFormaPago.Checked, CBPriorizaStock.Checked, CBFacturaPorImporte.Checked, CBFacturaPorLinea.Checked, CBFechaValor.Checked, DEFechaValor.Date);
end;

end.
