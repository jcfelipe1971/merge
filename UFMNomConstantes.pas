unit UFMNomConstantes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UFPEditDetalle,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Buttons, ULFEdit,
  ULFDBEditFind2000, ULFEditFind2000;

type
  TFMNomConstantes = class(TFPEdit)
     DBEPeriodo: TLFDbedit;
     LPeriodo: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LDescripcion: TLFLabel;
     TBSep1: TToolButton;
     TBCrearConstatesPeriodo: TToolButton;
     PIndicadores: TLFPanel;
     SplitterIndicadores: TSplitter;
     DBGIndicadores: TDBGridFind2000;
     TBIndicadores: TLFToolBar;
     NavIndicadores: THYMNavigator;
     TBInsertIndicadoresAFP: TToolButton;
     TBSep4: TToolButton;
     DBEEmpleados: TLFDbedit;
     LEmpleados: TLFLabel;
     DBENominasPendientes: TLFDbedit;
     LAsiento: TLFLabel;
     DBEAsiento: TLFDbedit;
     SplitterTramos: TSplitter;
     PTramos: TLFPanel;
     TBTramos: TLFToolBar;
     NavTramos: THYMNavigator;
     TBSep3: TToolButton;
     DBGTramos: TDBGridFind2000;
     LTramosRenta: TLFLabel;
     LInidicadoresAFP: TLFLabel;
     TBSep5: TToolButton;
     TBSep2: TToolButton;
     TBCrearTramosRenta: TToolButton;
     AGenerarNominas: TAction;
     TBGenerarNominas: TToolButton;
     AConsTramosIndicadores: TAction;
     SBANominasPendientes: TSpeedButton;
     AExportarNominasBanco: TAction;
     TBContabilizarTodas: TToolButton;
     AContabilizar: TAction;
     SBAEmpleados: TSpeedButton;
     AInicializaNominas: TAction;
     SBANominasCerradas: TSpeedButton;
     LNomPendientes: TLFLabel;
     TBDescontabilizarTodas: TToolButton;
     ADescontabilizar: TAction;
     TBCreaConsTramosIndicadores: TToolButton;
     TSepConst: TToolButton;
     DBECerradas: TLFDbedit;
     LFCerradas: TLFLabel;
     LNomCerradasTotalLiq: TLFLabel;
     DBENomCerradasTotalLiq: TLFDbedit;
     PCCuerpo: TPageControl;
     TSPrincipal: TTabSheet;
     LConstantes: TLFLabel;
     TSRemuneracion: TTabSheet;
     SGRemuneraciones: TStringGrid;
     Button1: TButton;
     TBRemuneracion: TLFToolBar;
     PNLProgreso: TProgressBar;
     ACalculaRemuneracion: TAction;
     BCalculaRemuneracion: TButton;
     PNLDescripcionColumna: TLFPanel;
     PEditConstantes: TLFPanel;
     LUf: TLFLabel;
     LUtm: TLFLabel;
     LTsr: TLFLabel;
     EUF: TLFEdit;
     EUTM: TLFEdit;
     ETSR: TLFEdit;
     AExportaCSV: TAction;
     TSPagos: TTabSheet;
     LFTBPagos: TLFToolBar;
     LFPBanco: TLFPanel;
     DBGPagos: TDBGridFind2000;
     LEntidadEmpleado: TLFLabel;
     TBContabilizarPagos: TToolButton;
     TBMarcarTodos: TToolButton;
     NavPagos: THYMNavigator;
     Separador1: TToolButton;
     Separador2: TToolButton;
     EFBanco: TLFEditFind2000;
     ETituloBanco: TLFEdit;
     TBDesmarcarTodos: TToolButton;
     DBETotalBanco: TLFDbedit;
     LTotalBanco: TLFLabel;
     ADespagarPagosTodos: TAction;
     TBDespagarPagos: TToolButton;
     AExportarPrevired: TAction;
     TBPrevired: TToolButton;
     TSep1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBCrearConstatesPeriodoClick(Sender: TObject);
     procedure TBInsertIndicadoresAFPClick(Sender: TObject);
     procedure TBCrearTramosRentaClick(Sender: TObject);
     procedure AGenerarNominasExecute(Sender: TObject);
     procedure AConsTramosIndicadoresExecute(Sender: TObject);
     procedure SBANominasPendientesDblClick(Sender: TObject);
     procedure AExportarNominasBancoExecute(Sender: TObject);
     procedure AContabilizarExecute(Sender: TObject);
     procedure SBAEmpleadosDblClick(Sender: TObject);
     procedure AInicializaNominasExecute(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure SBANominasCerradasDblClick(Sender: TObject);
     procedure ADescontabilizarExecute(Sender: TObject);
     procedure ACalculaRemuneracionExecute(Sender: TObject);
     procedure BCalculaRemuneracionClick(Sender: TObject);
     procedure TSRemuneracionShow(Sender: TObject);
     procedure SGRemuneracionesSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
     procedure DBEPeriodoChange(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure SGRemuneracionesDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure EUFKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EUTMKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ETSRKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AExportaCSVExecute(Sender: TObject);
     procedure EUFChange(Sender: TObject);
     procedure EUTMChange(Sender: TObject);
     procedure ETSRChange(Sender: TObject);
     procedure TBContabilizarPagosClick(Sender: TObject);
     procedure EFBancoChange(Sender: TObject);
     procedure TBMarcarTodosClick(Sender: TObject);
     procedure TBDesmarcarTodosClick(Sender: TObject);
     procedure DBGPagosDblClick(Sender: TObject);
     procedure DBGPagosCellClick(Column: TColumn);
     procedure ADespagarPagosTodosExecute(Sender: TObject);
     procedure TBDespagarPagosClick(Sender: TObject);
     procedure AExportarPreviredExecute(Sender: TObject);
  private
     ColActual: TColumn;
  public
     procedure Filtrar(Filtro: string);
  end;

const
  CantColumnasRemuneracion = 147;
  AnchoColumnaRemuneracion = 80;

var
  FMNomConstantes : TFMNomConstantes;

implementation

uses UDMMain, UEntorno, UFMain, UFPregDatosCSB34, UUtiles, UParam, UFormGest, UDMNomConstantes,
  UOpeDMEmpleados, UFMNominasCabecera, UOpeFMEmpleados, UFMSeleccion, StrUtils, UDameDato;

{$R *.dfm}

procedure TFMNomConstantes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMNomConstantes, DMNomConstantes);

  DBGMain.DataSource := DMNomConstantes.DSPeriodos;
  NavMain.DataSource := DMNomConstantes.DSPeriodos;
  G2kTableLoc.DataSource := DMNomConstantes.DSPeriodos;
  // NavDetalle.DataSource := DMNomConstantes.DSQMNomConstantes;
  // DBGFDetalle.DataSource := DMNomConstantes.DSQMNomConstantes;
  NavIndicadores.DataSource := DMNomConstantes.DSQMAFPIndicadores;
  DBGIndicadores.DataSource := DMNomConstantes.DSQMAFPIndicadores;
  NavTramos.DataSource := DMNomConstantes.DSQMTramosRenta;
  DBGTramos.DataSource := DMNomConstantes.DSQMTramosRenta;

  PCCuerpo.ActivePage := TSPrincipal;

  SolapaControles(SBANominasPendientes, DBENominasPendientes);
  DBENominasPendientes.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEmpleados, DBEEmpleados);
  DBEEmpleados.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBANominasCerradas, DBECerradas);
  DBECerradas.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMNomConstantes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNomConstantes);
end;

procedure TFMNomConstantes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMNomConstantes.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'IMPORTE') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'N') then
              ColorInactivo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'DATO_TEXTO') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'T') then
              ColorInactivo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'DATO_FECHA') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'F') then
              ColorInactivo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMNomConstantes.TBCrearConstatesPeriodoClick(Sender: TObject);
begin
  inherited;
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un periodo'))
  else
     DMNomConstantes.CrearConstantes;
end;

procedure TFMNomConstantes.TBInsertIndicadoresAFPClick(Sender: TObject);
begin
  inherited;
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un periodo'))
  else
     DMNomConstantes.CrearAFP;
end;

procedure TFMNomConstantes.TBCrearTramosRentaClick(Sender: TObject);
begin
  inherited;
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un periodo'))
  else
  begin
     Screen.Cursor := crHourGlass;
     try
        DMNomConstantes.CrearTramos;
     finally
        Screen.Cursor := crDefault;
     end;

     ShowMessage(_('Proceso Terminado.'));
  end;
end;

procedure TFMNomConstantes.AGenerarNominasExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('¿Esta seguro de que desea regenerar las nóminas para todos los empleados en el periodo?')) then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMNomConstantes.CrearNominas;
     finally
        Screen.Cursor := crDefault;
     end;

     ShowMessage(_('Proceso Terminado.'));
  end;
end;

procedure TFMNomConstantes.Filtrar(Filtro: string);
begin
  DMNomConstantes.Filtrar(Filtro);
end;

procedure TFMNomConstantes.AConsTramosIndicadoresExecute(Sender: TObject);
begin
  // Genera las constantes, tramos y los indicadores del periodo
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un periodo'))
  else
  begin
     Screen.Cursor := crHourGlass;
     try
        DMNomConstantes.CrearConstantes;
        DMNomConstantes.CrearAFP;
        DMNomConstantes.CrearTramos;
     finally
        Screen.Cursor := crDefault;
     end;

     ShowMessage(_('Creadas Constantes, Tramos y AFP. Proceso Terminado.'));
  end;
end;

procedure TFMNomConstantes.SBANominasPendientesDblClick(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  Filtro := ' ESTADO = 0 ' + ' AND PERIODO = ''' + DMNomConstantes.QMNomConstantesPERIODO.AsString + '''';
  FMain.EjecutaAccion(FMain.ANominas, Filtro);
  FMNominasCabecera.MuestraTabla;
end;

procedure TFMNomConstantes.SBANominasCerradasDblClick(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  Filtro := ' ESTADO = 5 ' + ' AND PERIODO = ''' + DMNomConstantes.QMNomConstantesPERIODO.AsString + '''';
  FMain.EjecutaAccion(FMain.ANominas, Filtro);
  FMNominasCabecera.MuestraTabla;
end;

procedure TFMNomConstantes.AExportarNominasBancoExecute(Sender: TObject);
var
  Archivo : string;
  Banco : integer;
begin
  inherited;
  // Rut        Nombre                             Mod_Pago  Cod_Bco  Cta_Cte     Monto   Mail Beneficiario          Glosa mail
  // 17565142k   Edison Arturo Zarate Monasterio   3         12        17565142   291460  edison.zarate.m@gmail.com  Remuneraciones Octubre 2023
  if PideDato('BAN', Banco, _('Banco')) then
  begin
     Archivo := Format(_('NominasBanco_%d-%s_%s.xls'), [REntorno.Ejercicio, Trim(DBEPeriodo.Text), FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMNomConstantes-ExportarNominasBanco') then
     begin
        Screen.Cursor := crHourGlass;
        try
           DMNomConstantes.ExportarExcel(Archivo, Banco);
        finally
           Screen.Cursor := crDefault;
        end;
     end;
  end;
end;

procedure TFMNomConstantes.AContabilizarExecute(Sender: TObject);
begin
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un Periodo'))
  else
  if ConfirmaMensaje(_('¿Esta seguro de que desea cerrar y contabilizar todas las nóminas para los empleados del periodo?')) then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMNomConstantes.ContabilizaNominas(1);
     finally
        Screen.Cursor := crDefault;
        ShowMessage(_('Proceso Terminado.'));
     end;
  end;
end;

procedure TFMNomConstantes.SBAEmpleadosDblClick(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.EjecutaAccion(FMain.AOpeEmpleados);
     OpeFMEmpleados.MuestraTabla;
  end;
end;

procedure TFMNomConstantes.AInicializaNominasExecute(Sender: TObject);
begin
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un Periodo'))
  else
  if ConfirmaMensaje(_('¿Esta seguro de que desea Inicializar todas las nominas del ejercicio?' + ' Periodo: ' + DBEPeriodo.Text)) then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMNomConstantes.InicializaNominasEjercicio;
     finally
        Screen.Cursor := crDefault;
     end;

     ShowMessage(_('Proceso Terminado.'));
  end;
end;

procedure TFMNomConstantes.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'DATO_TEXTO') then
  begin
  {
     if UpperCase(Trim(DBGFDetalle.DataSource.DataSet.FieldByName('CODIGO').AsString)) = 'A029' then
     begin
        Column.PickList.Clear;
        Column.PickList.Text := DMNomConstantes.DameCajaCompensacion;
     end
     else
        Column.PickList.Clear;
  }
  end;
end;

procedure TFMNomConstantes.ADescontabilizarExecute(Sender: TObject);
begin
  inherited;
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un Periodo'))
  else
  if ConfirmaMensaje(_('¿Esta seguro de que desea descontabilizar todas las nóminas para los empleados del periodo?')) then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMNomConstantes.ContabilizaNominas(0);
     finally
        Screen.Cursor := crDefault;
        ShowMessage(_('Proceso Terminado.'));
     end;
  end;
end;

procedure TFMNomConstantes.ACalculaRemuneracionExecute(Sender: TObject);

  procedure AsignaAnchoYTituloAColumnas(SG: TStringGrid);
  var
     i : integer;
  begin
     with SG do
     begin
        // Ancho por defecto de las columnas
        for i := 0 to CantColumnasRemuneracion - 1 do
           ColWidths[i] := AnchoColumnaRemuneracion;

        // Columas con ancho diferente
        // ColWidths[???] := ???;

        // Rellenamos primera fila de titulos
        // CATEGORIA 1 - IDENTIFICACION TRABAJADOR
        Cells[0, 0] := 'Rut trabajador(1101)';
        Cells[1, 0] := 'Fecha inicio contrato(1102)';
        Cells[2, 0] := 'Fecha término de contrato(1103)';
        Cells[3, 0] := 'Causal término de contrato(1104)';
        Cells[4, 0] := 'Región prestación de servicios(1105)';
        Cells[5, 0] := 'Comuna prestación de servicios(1106)';
        Cells[6, 0] := 'Tipo impuesto a la renta(1170)';
        Cells[7, 0] := 'Técnico extranjero exención cot. previsionales(1146)';
        Cells[8, 0] := 'Código tipo de jornada(1107)';
        Cells[9, 0] := 'Persona con Discapacidad - Pensionado por Invalidez(1108)';
        Cells[10, 0] := 'Pensionado por vejez(1109)';
        Cells[11, 0] := 'AFP(1141)';
        Cells[12, 0] := 'IPS (ExINP)(1142)';
        Cells[13, 0] := 'FONASA - ISAPRE(1143)';
        Cells[14, 0] := 'AFC(1151)';
        Cells[15, 0] := 'CCAF(1110)';
        Cells[16, 0] := 'Org. administrador ley 16.744(1152)';
        Cells[17, 0] := 'Nro cargas familiares legales autorizadas(1111)';
        Cells[18, 0] := 'Nro de cargas familiares maternales(1112)';
        Cells[19, 0] := 'Nro de cargas familiares invalidez(1113)';
        Cells[20, 0] := 'Tramo asignación familiar(1114)';
        Cells[21, 0] := 'Rut org sindical 1(1171)';
        Cells[22, 0] := 'Rut org sindical 2(1172)';
        Cells[23, 0] := 'Rut org sindical 3(1173)';
        Cells[24, 0] := 'Rut org sindical 4(1174)';
        Cells[25, 0] := 'Rut org sindical 5(1175)';
        Cells[26, 0] := 'Rut org sindical 6(1176)';
        Cells[27, 0] := 'Rut org sindical 7(1177)';
        Cells[28, 0] := 'Rut org sindical 8(1178)';
        Cells[29, 0] := 'Rut org sindical 9(1179)';
        Cells[30, 0] := 'Rut org sindical 10(1180)';
        Cells[31, 0] := 'Nro días trabajados en el mes(1115)';
        Cells[32, 0] := 'Nro días de licencia médica en el mes(1116)';
        Cells[33, 0] := 'Nro días de vacaciones en el mes(1117)';
        Cells[34, 0] := 'Subsidio trabajador joven(1118)';
        Cells[35, 0] := 'Puesto Trabajo Pesado(1154)';
        Cells[36, 0] := 'APVI(1155)';
        Cells[37, 0] := 'APVC(1157)';
        Cells[38, 0] := 'Indemnización a todo evento(1131)';
        Cells[39, 0] := 'Tasa indemnización a todo evento(1132)';

        // CATEGORIA 2 - HABERES - SUBCATEGORIA 1 HABERES IMPONIBLES Y TRIBUTABLES
        Cells[40, 0] := 'Sueldo(2101)';
        Cells[41, 0] := 'Sobresueldo(2102)';
        Cells[42, 0] := 'Comisiones(2103)';
        Cells[43, 0] := 'Semana corrida(2104)';
        Cells[44, 0] := 'Participación(2105)';
        Cells[45, 0] := 'Gratificación(2106)';
        Cells[46, 0] := 'Recargo 30% día domingo(2107)';
        Cells[47, 0] := 'Remun. variable pagada en vacaciones(2108)';
        Cells[48, 0] := 'Remun. variable pagada en clausura(2109)';
        Cells[49, 0] := 'Aguinaldo(2110)';
        Cells[50, 0] := 'Bonos u otras remun. fijas mensuales(2111)';
        Cells[51, 0] := 'Tratos(2112)';
        Cells[52, 0] := 'Bonos u otras remun. variables mensuales o superiores a un mes(2113)';
        Cells[53, 0] := 'Ejercicio opción no pactada en contrato(2114)';
        Cells[54, 0] := 'Beneficios en especie constitutivos de remun(2115)';
        Cells[55, 0] := 'Remuneraciones bimestrales(2116)';
        Cells[56, 0] := 'Remuneraciones trimestrales(2117)';
        Cells[57, 0] := 'Remuneraciones cuatrimestral(2118)';
        Cells[58, 0] := 'Remuneraciones semestrales(2119)';
        Cells[59, 0] := 'Remuneraciones anuales(2120)';
        Cells[60, 0] := 'Participación anual(2121)';
        Cells[61, 0] := 'Gratificación anual(2122)';
        Cells[62, 0] := 'Otras remuneraciones superiores a un mes(2123)';
        Cells[63, 0] := 'Pago por horas de trabajo sindical(2124)';
        Cells[64, 0] := 'Sueldo empresarial (2161)';

        // SUBCATEGORIA 2 - HABERES IMPONIBLES Y NO TRIBUTABLES
        Cells[65, 0] := 'Subsidio por incapacidad laboral por licencia médica(2201)';
        Cells[66, 0] := 'Beca de estudio(2202)';
        Cells[67, 0] := 'Gratificaciones de zona(2203)';
        Cells[68, 0] := 'Otros ingresos no constitutivos de renta(2204)';

        // SUBCATEGORIA 3 - HABERES NO IMPONIBLES Y NO TRIBUTABLES
        Cells[69, 0] := 'Colación(2301)';
        Cells[70, 0] := 'Movilización(2302)';
        Cells[71, 0] := 'Viáticos(2303)';
        Cells[72, 0] := 'Asignación de pérdida de caja(2304)';
        Cells[73, 0] := 'Asignación de desgaste herramienta(2305)';
        Cells[74, 0] := 'Asignación familiar legal(2311)';
        Cells[75, 0] := 'Gastos por causa del trabajo(2306)';
        Cells[76, 0] := 'Gastos por cambio de residencia(2307)';
        Cells[77, 0] := 'Sala cuna(2308)';
        Cells[78, 0] := 'Asignación trabajo a distancia o teletrabajo(2309)';
        Cells[79, 0] := 'Depósito convenido hasta UF 900(2347)';
        Cells[80, 0] := 'Alojamiento por razones de trabajo(2310)';
        Cells[81, 0] := 'Asignación de traslación(2312)';
        Cells[82, 0] := 'Indemnización por feriado legal(2313)';
        Cells[83, 0] := 'Indemnización años de servicio(2314)';
        Cells[84, 0] := 'Indemnización sustitutiva del aviso previo(2315)';
        Cells[85, 0] := 'Indemnización fuero maternal(2316)';
        Cells[86, 0] := 'Pago indemnización a todo evento(2331)';

        // SUBCATEGORIA 4 - HABERES NO IMPONIBLES Y TRIBUTABLES
        Cells[87, 0] := 'Indemnizaciones voluntarias tributables(2417)';
        Cells[88, 0] := 'Indemnizaciones contractuales tributables(2418)';

        // CATEGORIA 3 - DESCUENTOS
        Cells[89, 0] := 'Cotización obligatoria previsional (AFP o IPS)(3141)';
        Cells[90, 0] := 'Cotización obligatoria salud 7%(3143)';
        Cells[91, 0] := 'Cotización voluntaria para salud(3144)';
        Cells[92, 0] := 'Cotización AFC - trabajador(3151)';
        Cells[93, 0] := 'Cotizaciones técnico extranjero para seguridad social fuera de Chile(3146)';
        Cells[94, 0] := 'Descuento depósito convenido hasta UF 900 anual(3147)';
        Cells[95, 0] := 'Cotización APVi Mod A(3155)';
        Cells[96, 0] := 'Cotización APVi Mod B hasta UF50(3156)';
        Cells[97, 0] := 'Cotización APVc Mod A(3157)';
        Cells[98, 0] := 'Cotización APVc Mod B hasta UF50(3158)';
        Cells[99, 0] := 'Impuesto retenido por remuneraciones(3161)';
        Cells[100, 0] := 'Impuesto retenido por indemnizaciones(3162)';
        Cells[101, 0] := 'Mayor retención de impuestos solicitada por el trabajador(3163)';
        Cells[102, 0] := 'Impuesto retenido por reliquidación remun. devengadas otros períodos(3164)';
        Cells[103, 0] := 'Diferencia impuesto reliquidación remun. devengadas en este período(3165)';
        Cells[104, 0] := 'Retención préstamo clase media 2020 (Ley 21.252) (3166)';
        Cells[105, 0] := 'Rebaja zona extrema DL 889 (3167)';


        Cells[106, 0] := 'Cuota sindical 1(3171)';
        Cells[107, 0] := 'Cuota sindical 2(3172)';
        Cells[108, 0] := 'Cuota sindical 3(3173)';
        Cells[109, 0] := 'Cuota sindical 4(3174)';
        Cells[110, 0] := 'Cuota sindical 5(3175)';
        Cells[111, 0] := 'Cuota sindical 6(3176)';
        Cells[112, 0] := 'Cuota sindical 7(3177)';
        Cells[113, 0] := 'Cuota sindical 8(3178)';
        Cells[114, 0] := 'Cuota sindical 9(3179)';
        Cells[115, 0] := 'Cuota sindical 10(3180)';
        Cells[116, 0] := 'Crédito social CCAF(3110)';
        Cells[117, 0] := 'Cuota vivienda o educación(3181)';
        Cells[118, 0] := 'Crédito cooperativas de ahorro(3182)';
        Cells[119, 0] := 'Otros descuentos autorizados y solicitados por el trabajador(3183)';
        Cells[120, 0] := 'Cotización adicional trabajo pesado - trabajador(3154)';
        Cells[121, 0] := 'Donaciones culturales y de reconstrucción(3184)';
        Cells[122, 0] := 'Otros descuentos(3185)';
        Cells[123, 0] := 'Pensiones de alimentos(3186)';
        Cells[124, 0] := 'Descuento mujer casada(3187)';
        Cells[125, 0] := 'Descuentos por anticipos y préstamos(3188)';

        // CATEGORIA 4 - APORTES EMPLEADOR
        Cells[126, 0] := 'AFC - Aporte empleador(4151)';
        Cells[127, 0] := 'Aporte empleador seguro accidentes del trabajo y Ley SANNA(4152)';
        Cells[128, 0] := 'Aporte empleador indemnización a todo evento(4131)';
        Cells[129, 0] := 'Aporte adicional trabajo pesado - empleador(4154)';
        Cells[130, 0] := 'Aporte empleador seguro invalidez y sobrevivencia(4155)';
        Cells[131, 0] := 'APVC - Aporte Empleador(4157)';

        // TOTALES
        Cells[132, 0] := 'Total haberes(5201)';
        Cells[133, 0] := 'Total haberes imponibles y tributables(5210)';
        Cells[134, 0] := 'Total haberes imponibles no tributables(5220)';
        Cells[135, 0] := 'Total haberes no imponibles y no tributables(5230)';
        Cells[136, 0] := 'Total haberes no imponibles y tributables(5240)';

        // SUBCATEGORIA 2 - DESCUENTOS - TOTALES
        Cells[137, 0] := 'Total descuentos(5301)';
        Cells[138, 0] := 'Total descuentos impuestos a las remuneraciones(5361)';
        Cells[139, 0] := 'Total descuentos impuestos por indemnizaciones(5362)';
        Cells[140, 0] := 'Total descuentos por cotizaciones del trabajador(5341)';
        Cells[141, 0] := 'Total otros descuentos(5302)';

        // SUBCATEGORIA 3 - APORTES - TOTALES
        Cells[142, 0] := 'Total aportes empleador(5410)';

        // SUBCATEGORIA 4 - OTROS RESULTADOS TOTALES
        Cells[143, 0] := 'Total líquido(5501)';
        Cells[144, 0] := 'Total indemnizaciones(5502)';
        Cells[145, 0] := 'Total indemnizaciones tributables(5564)';
        Cells[146, 0] := 'Total indemnizaciones no tributables(5565)';
     end;
  end;

var
  c, r : integer;
begin
  inherited;
  // Abro Dataset con los datos para rellenar el Grid.
  DMNomConstantes.AbreNominas;

  try
     PNLProgreso.Visible := True;
     NavMain.Enabled := False;

     with SGRemuneraciones do
     begin
        // Defino tamaños de StringGrid
        ColCount := CantColumnasRemuneracion;
        RowCount := DMNomConstantes.xNominas.RecordCount + 2;
        FixedCols := 0;
        FixedRows := 1;

        // Vacío el contenido de las celdas
        for c := 0 to ColCount - 1 do
           for r := 0 to RowCount - 1 do
              Cells[c, r] := '';

        AsignaAnchoYTituloAColumnas(SGRemuneraciones);

        // Empiezo en la siguiente linea después de los titulos
        r := FixedRows;

        PNLProgreso.Min := 0;
        PNLProgreso.Max := DMNomConstantes.xNominas.RecordCount;

        // Lo hago invisible para acelerar el calculo
        SGRemuneraciones.Visible := False;

        with DMNomConstantes.xNominas do
        begin
           First;
           while not EOF do
           begin
              PNLProgreso.Position := r;
              Application.ProcessMessages;

              Cells[0, r] := DMNomConstantes.xNominas.FieldByName('NIF').AsString; //Rut trabajador(1101)

              if (DMNomConstantes.xContrato.FieldByName('FECHA_INICIO_CONTRATO').AsDateTime = 0) then
                 Cells[1, r] := ''
              else
                 Cells[1, r] := DateToStr(DMNomConstantes.xContrato.FieldByName('FECHA_INICIO_CONTRATO').AsDateTime); // Fecha inicio contrato(1102)

              if (DMNomConstantes.xContrato.FieldByName('FECHA_FIN_CONTRATO').AsDateTime = 0) then
                 Cells[2, r] := ''//'Fecha de término de contrato';
              else
                 Cells[2, r] := DateToStr(DMNomConstantes.xContrato.FieldByName('FECHA_FIN_CONTRATO').AsDateTime); //'Fecha de término de contrato';

              Cells[3, r] := DMNomConstantes.xContrato.FieldByName('MOTIVO_FINALIZACION').AsString; // Causal término de contrato(1104)
              Cells[4, r] := DMNomConstantes.xEmpresa.FieldByName('LRE_REGION').AsString; // Región prestación de servicios(1105)
              Cells[5, r] := DMNomConstantes.xEmpresa.FieldByName('LRE_POBLACION').AsString; // Comuna prestación de servicios(1106)
              Cells[6, r] := '1'; // Tipo impuesto a la renta(1170)
              Cells[7, r] := '0'; // Técnico extranjero exención cot. previsionales(1146)
              Cells[8, r] := '101'; // Código tipo de jornada(1107)
              Cells[9, r] := '0'; // Persona con Discapacidad - Pensionado por Invalidez(1108)
              Cells[10, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P404')); // Pensionado por vejez(1109)
              Cells[11, r] := DMNomConstantes.xEmpleadoNomina.FieldByName('AFP').AsString; // AFP(1141)
              Cells[12, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P407')); // IPS (ExINP)(1142)
              Cells[13, r] := FloatToStr(DMNomConstantes.xEmpleadoNomina.FieldByName('FONASA').AsFloat); // FONASA - ISAPRE(1143)
              Cells[14, r] := '1';// AFC(1151)
              Cells[15, r] := '1';// CCAF(1110)
              Cells[16, r] := '1'; // Org. administrador ley 16.744(1152)
              Cells[17, r] := '0'; // Nro cargas familiares legales autorizadas(1111)
              Cells[18, r] := '0'; // Nro de cargas familiares maternales(1112)
              Cells[19, r] := '0'; // Nro de cargas familiares invalidez(1113)
              Cells[20, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P008')); // Tramo asignación familiar(1114)
              Cells[21, r] := ''; // Rut org sindical 1(1171)
              Cells[22, r] := ''; // Rut org sindical 2(1172)
              Cells[23, r] := ''; // Rut org sindical 3(1173)
              Cells[24, r] := ''; // Rut org sindical 4(1174)
              Cells[25, r] := ''; // Rut org sindical 5(1175)
              Cells[26, r] := ''; // Rut org sindical 6(1176)
              Cells[27, r] := ''; // Rut org sindical 7(1177)
              Cells[28, r] := ''; // Rut org sindical 8(1178)
              Cells[29, r] := ''; // Rut org sindical 9(1179)
              Cells[30, r] := ''; // Rut org sindical 10(1180)
              Cells[31, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P003')); // Nro días trabajados en el mes(1115)
              Cells[32, r] := '0'; // Nro días de licencia médica en el mes(1116)
              Cells[33, r] := '0'; // Nro días de vacaciones en el mes(1117)
              Cells[34, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P422'));// Subsidio trabajador joven(1118)
              Cells[35, r] := '0'; // Puesto Trabajo Pesado(1154)
              Cells[36, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P411'));// APVI(1155)
              Cells[37, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P412'));// APVC(1157)
              Cells[38, r] := '0'; // Indemnización a todo evento(1131)
              Cells[39, r] := ''; // Tasa indemnización a todo evento(1132)

              // CATEGORIA 2 - HABERES - SUBCATEGORIA 1 HABERES IMPONIBLES Y TRIBUTABLES
              Cells[40, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H080') + DMNomConstantes.DameImporteHaberes('H050')); // Sueldo(2101)
              Cells[41, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H003')); // Sobresueldo(2102)
              Cells[42, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H070')); // Comisiones(2103)
              Cells[43, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H059')); // Semana corrida(2104)
              Cells[44, r] := '0'; // Participación(2105)
              Cells[45, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H081')); // Gratificación(2106)
              Cells[46, r] := 'Recargo 30% día domingo (Art. 38)'; // Recargo 30% día domingo(2107)
              Cells[47, r] := 'Remuneración variable pagada en vacaciones (Art. 71)'; // Remun. variable pagada en vacaciones(2108)
              Cells[48, r] := 'Remuneración variable pagada en clausura (Art. 38 DFL 2)'; // Remun. variable pagada en clausura(2109)
              Cells[49, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H023')); // Aguinaldo(2110)
              Cells[50, r] := '0'; // Bonos u otras remun. fijas mensuales(2111)
              Cells[51, r] := '0'; // Tratos(2112)
              Cells[52, r] := '0'; // Bonos u otras remun. variables mensuales o superiores a un mes(2113)
              Cells[53, r] := '0'; // Ejercicio opción no pactada en contrato(2114)
              Cells[54, r] := '0'; // Beneficios en especie constitutivos de remun(2115)
              Cells[55, r] := '0'; // Remuneraciones bimestrales(2116)
              Cells[56, r] := '0'; // Remuneraciones trimestrales(2117)
              Cells[57, r] := '0'; // Remuneraciones cuatrimestral(2118)
              Cells[58, r] := '0'; // Remuneraciones semestrales(2119)
              Cells[59, r] := '0'; // Remuneraciones anuales(2120)
              Cells[60, r] := '0'; // Participación anual(2121)
              Cells[61, r] := '0'; // Gratificación anual(2122)
              Cells[62, r] := '0'; // Otras remuneraciones superiores a un mes(2123)
              Cells[63, r] := '0'; // Pago por horas de trabajo sindical(2124)
              Cells[64, r] := '0'; // Sueldo empresarial (2161)

              // SUBCATEGORIA 2 - HABERES IMPONIBLES Y NO TRIBUTABLES
              Cells[65, r] := '0'; // Subsidio por incapacidad laboral por licencia médica(2201)
              Cells[65, r] := '0'; // Beca de estudio(2202)
              Cells[66, r] := '0'; // Gratificaciones de zona(2203)
              Cells[68, r] := '0'; // Otros ingresos no constitutivos de renta(2204)

              // SUBCATEGORIA 3 - HABERES NO IMPONIBLES Y NO TRIBUTABLES
              Cells[69, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H036')); // Colación(2301)
              Cells[70, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H037')); // Movilización(2302)
              Cells[71, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H066')); // Viáticos(2303)
              Cells[72, r] := '0'; // Asignación de pérdida de caja(2304)
              Cells[73, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H067')); // Asignación de desgaste herramienta(2305)
              Cells[74, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H007')); // Asignación familiar legal(2311)
              Cells[75, r] := '0'; // Gastos por causa del trabajo(2306)
              Cells[76, r] := '0'; // Gastos por cambio de residencia(2307)
              Cells[77, r] := '0'; // Sala cuna(2308)
              Cells[78, r] := '0'; // Asignación trabajo a distancia o teletrabajo(2309)
              Cells[79, r] := '0'; // Depósito convenido hasta UF 900(2347)
              Cells[80, r] := '0'; // Alojamiento por razones de trabajo(2310)
              Cells[81, r] := '0'; // Asignación de traslación(2312)
              Cells[82, r] := '0'; // Indemnización por feriado legal(2313)
              Cells[83, r] := '0'; // Indemnización años de servicio(2314)
              Cells[84, r] := '0'; // Indemnización sustitutiva del aviso previo(2315)
              Cells[85, r] := '0'; // Indemnización fuero maternal(2316)
              Cells[86, r] := '0'; // Pago indemnización a todo evento(2331)

              // SUBCATEGORIA 4 - HABERES NO IMPONIBLES Y TRIBUTABLES
              Cells[87, r] := '0'; // Indemnizaciones voluntarias tributables(2417)
              Cells[88, r] := '0'; // Indemnizaciones contractuales tributables(2418)

              // CATEGORIA 3 -DESCUENTOS
              Cells[89, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D055')); // Cotización obligatoria previsional (AFP o IPS)(3141)
              Cells[90, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D041')); // Cotización obligatoria salud 7%(3143)
              Cells[91, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D037') + DMNomConstantes.DameImporteDescuentos('D041')); // Cotización voluntaria para salud(3144)
              Cells[92, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P153')); // Cotización AFC - trabajador(3151)
              Cells[93, r] := '0'; // Cotizaciones técnico extranjero para seguridad social fuera de Chile(3146)
              Cells[94, r] := '0'; // Descuento depósito convenido hasta UF 900 anual(3147)
              Cells[95, r] := '0'; // Cotización APVi Mod A(3155)
              Cells[96, r] := '0'; // Cotización APVi Mod B hasta UF50(3156)
              Cells[97, r] := '0'; // Cotización APVc Mod A(3157)
              Cells[98, r] := '0'; // Cotización APVc Mod B hasta UF50(3158)
              Cells[99, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D008')); // Impuesto retenido por remuneraciones(3161)
              Cells[100, r] := '0'; // Impuesto retenido por indemnizaciones(3162)
              Cells[101, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P204')); // Mayor retención de impuestos solicitada por el trabajador(3163)
              Cells[102, r] := '0'; // Impuesto retenido por reliquidación remun. devengadas otros períodos(3164)
              Cells[103, r] := '0'; // Diferencia impuesto reliquidación remun. devengadas en este período(3165)
              Cells[104, r] := '0'; // Retención préstamo clase media 2020 (Ley 21.252) (3166)
              Cells[105, r] := '0'; // Rebaja zona extrema DL 889 (3167)
              Cells[106, r] := '0'; // Cuota sindical 1(3171)
              Cells[107, r] := '0'; // Cuota sindical 2(3172)
              Cells[108, r] := '0'; // Cuota sindical 3(3173)
              Cells[109, r] := '0'; // Cuota sindical 4(3174)
              Cells[110, r] := '0'; // Cuota sindical 5(3175)
              Cells[111, r] := '0'; // Cuota sindical 6(3176)
              Cells[112, r] := '0'; // Cuota sindical 7(3177)
              Cells[113, r] := '0'; // Cuota sindical 8(3178)
              Cells[114, r] := '0'; // Cuota sindical 9(3179)
              Cells[115, r] := '0'; // Cuota sindical 10(3180)
              Cells[116, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D024')); // Crédito social CCAF(3110)
              Cells[117, r] := '0'; // Cuota vivienda o educación(3181)
              Cells[118, r] := '0'; // Crédito cooperativas de ahorro(3182)
              Cells[119, r] := '0'; // Otros descuentos autorizados y solicitados por el trabajador(3183)
              Cells[120, r] := '0'; // Cotización adicional trabajo pesado - trabajador(3154)
              Cells[121, r] := '0'; // Donaciones culturales y de reconstrucción(3184)
              Cells[122, r] := '0'; // Otros descuentos(3185)
              Cells[123, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D026')); // Pensiones de alimentos(3186)
              Cells[124, r] := '0'; // Descuento mujer casada(3187)
              Cells[125, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D014') + DMNomConstantes.DameImporteDescuentos('D015')); // Descuentos por anticipos y préstamos(3188)

              // CATEGORIA 4 - APORTES EMPLEADOR
              Cells[126, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P152')); // AFC - Aporte empleador(4151)
              Cells[127, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D083')); // Aporte empleador seguro accidentes del trabajo y Ley SANNA(4152)
              Cells[128, r] := '0'; // Aporte empleador indemnización a todo evento(4131)
              Cells[129, r] := '0'; // Aporte adicional trabajo pesado - empleador(4154)
              Cells[130, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D031')); // Aporte empleador seguro invalidez y sobrevivencia(4155)
              Cells[131, r] := '0'; // APVC - Aporte Empleador(4157)

              // TOTALES
              Cells[132, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H012')); // Total haberes(5201)
              Cells[133, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H013')); // Total haberes imponibles y tributables(5210)
              Cells[134, r] := '0'; // Total haberes imponibles no tributables(5220)
              Cells[135, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H011')); // Total haberes no imponibles y no tributables(5230)
              Cells[136, r] := '0'; // Total haberes no imponibles y tributables(5240)

              // SUBCATEGORIA 2 - DESCUENTOS -TOTALES
              Cells[137, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D017')); // Total descuentos(5301)
              Cells[138, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D017') + DMNomConstantes.DameImporteParametro('P204')); // Total descuentos impuestos a las remuneraciones(5361)
              Cells[139, r] := '0'; // Total descuentos impuestos por indemnizaciones(5362)
              Cells[140, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D055') + DMNomConstantes.DameImporteDescuentos('D041') + DMNomConstantes.DameImporteParametro('P053')); // Total descuentos por cotizaciones del trabajador(5341)
              Cells[141, r] := FloatToStr(DMNomConstantes.DameImporteDescuentos('D052')); // Total otros descuentos(5302)

              // SUBCATEGORIA 3 - APORTES -TOTALES
              Cells[142, r] := FloatToStr(DMNomConstantes.DameImporteParametro('P152') + DMNomConstantes.DameImporteDescuentos('D083') + DMNomConstantes.DameImporteDescuentos('D031')); // Total aportes empleador(5410)

              // SUBCATEGORIA 4 - OTROS RESULTADOS TOTALES
              Cells[143, r] := FloatToStr(DMNomConstantes.DameImporteHaberes('H040')); // Total líquido(5501)
              Cells[144, r] := '0'; // Total indemnizaciones(5502)
              Cells[145, r] := '0'; // Total indemnizaciones tributables(5564)
              Cells[146, r] := '0'; // Total indemnizaciones no tributables(5565)

              Inc(r);
              Next;
           end;
        end;
     end;
  finally
     PNLProgreso.Visible := False;
     NavMain.Enabled := True;
     SGRemuneraciones.Visible := True;
     DMNomConstantes.CierraNominas;
  end;
end;

procedure TFMNomConstantes.BCalculaRemuneracionClick(Sender: TObject);
begin
  inherited;
  ACalculaRemuneracion.Execute;
end;

procedure TFMNomConstantes.SGRemuneracionesSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  inherited;
  PNLDescripcionColumna.Caption := SGRemuneraciones.Cells[ACol, 0];
end;

procedure TFMNomConstantes.TSRemuneracionShow(Sender: TObject);
begin
  inherited;
  if (TSRemuneracion.Visible) then
     ACalculaRemuneracion.Execute;
end;

procedure TFMNomConstantes.DBEPeriodoChange(Sender: TObject);
var
  UF, UTM, TSR : double;
begin
  inherited;
  if Trim(DBEPeriodo.Text) > '' then
  begin
     if TSRemuneracion.Visible then
        TSRemuneracionShow(Sender);

     UF := 0;
     UTM := 0;
     TSR := 0;
     DMNomConstantes.DameConstantes(DBEPeriodo.Text, UF, UTM, TSR);
     EUF.Text := Format('%.2f', [UF]);
     EUTM.Text := Format('%.2f', [UTM]);
     ETSR.Text := Format('%.2f', [TSR]);
     EUFChange(Sender);
     EUTMChange(Sender);
     ETSRChange(Sender);
  end;
end;

procedure TFMNomConstantes.TSFichaShow(Sender: TObject);
begin
  inherited;
  if (TSRemuneracion.Visible) then
     TSRemuneracionShow(Sender);
end;

procedure TFMNomConstantes.SGRemuneracionesDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;

  if ((ACol in [
     6, 7, 8, 9,
     14, 15, 16, 17, 18, 19,
     21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
     32, 33,
     35,
     44,
     46, 47, 48,
     50, 51,
     53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64,
     65, 66, 67, 68,
     72,
     75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86,
     87, 88,
     93, 94, 95, 96, 97, 98,
     100,
     102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 114, 115,
     117, 118, 119, 120, 121, 122,
     124,
     128, 129,
     131,
     134,
     136,
     139,
     144, 145, 146]) and (ARow > 0)) then
     with TStringGrid(Sender) do
     begin
        if gdFocused in State then
           Canvas.DrawFocusRect(Rect)
        else
           ColorResaltado6(Canvas);

        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Cells[ACol, ARow]);
     end;
end;

procedure TFMNomConstantes.EUFKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
     DMNomConstantes.SetConstantes(DBEPeriodo.Text, 1, StrToFloat(EUF.Text));
end;

procedure TFMNomConstantes.EUTMKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
     DMNomConstantes.SetConstantes(DBEPeriodo.Text, 2, StrToFloat(EUTM.Text));
end;

procedure TFMNomConstantes.ETSRKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
     DMNomConstantes.SetConstantes(DBEPeriodo.Text, 3, StrToFloat(ETSR.Text));
end;

procedure TFMNomConstantes.AExportaCSVExecute(Sender: TObject);
var
  Columna, Fila : integer;
  s, Separador, Fichero : string;
  ts : TStrings;
begin
  inherited;
  // Fuerzo calculo si no está en esta pestaña
  PCCuerpo.ActivePage := TSRemuneracion;

  if (SGRemuneraciones.ColCount = 0) then
     raise Exception.Create(_('No hay nada que exportar'))
  else
  begin
     Separador := ';';
     Fichero := format('LibroRemuneraciones-%d-%s_%s.csv', [REntorno.Ejercicio, DMNomConstantes.xPeriodosPERIODO.AsString, FormatDateTime('_yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Fichero, 'CSV', '', 'FMNomConstantes-ExportaCSV') then
     begin
        DMMain.LogIni(format('Exportacion Libro de Remuneraciones: %s', [Fichero]));

        ts := TStringList.Create;
        try
           with SGRemuneraciones do
           begin
              for Fila := 0 to RowCount - 2 do
              begin
                 // Primera columna
                 Columna := 0;
                 s := Cells[Columna, Fila];

                 // Resto de columnas precedidas por separador
                 for Columna := 1 to ColCount - 1 do
                    s := s + Separador + Cells[Columna, Fila];

                 DMMain.Log(format('Linea %d: %s', [Fila, s]));
                 ts.Add(s);
              end;

              ts.SaveToFile(Fichero);
           end;
        finally
           ts.Free;
           DMMain.LogFin('Exportacion finalizada');
        end;
     end;
  end;
end;

procedure TFMNomConstantes.EUFChange(Sender: TObject);
begin
  if (StrToFloatDef(EUF.Text, 0) = 0) or (DMNomConstantes.ValorConstantePeriodoAnterior(DBEPeriodo.Text, 1) = StrToFloatDef(EUF.Text, 0)) then
     ColorError(EUF)
  else
     ColorResaltado2(EUF);
end;

procedure TFMNomConstantes.EUTMChange(Sender: TObject);
begin
  if (StrToFloatDef(EUTM.Text, 0) = 0) or (DMNomConstantes.ValorConstantePeriodoAnterior(DBEPeriodo.Text, 2) = StrToFloatDef(EUTM.Text, 0)) then
     ColorError(EUTM)
  else
     ColorResaltado2(EUTM);
end;

procedure TFMNomConstantes.ETSRChange(Sender: TObject);
begin
  if (StrToFloatDef(ETSR.Text, 0) = 0) or (DMNomConstantes.ValorConstantePeriodoAnterior(DBEPeriodo.Text, 3) = StrToFloatDef(ETSR.Text, 0)) then
     ColorError(ETSR)
  else
     ColorResaltado2(ETSR);
end;

procedure TFMNomConstantes.TBContabilizarPagosClick(Sender: TObject);
begin
  if (StrToIntDef(EFBanco.Text, -1) = -1) then
     ShowMessage(_('Debe informar el banco a utilizar para el pago'))
  else
  begin
     if ConfirmaMensaje(_('¿Esta seguro de que desea Pagar las nóminas para el periodo?')) then
     begin
        Screen.Cursor := crHourGlass;
        try
           DMNomConstantes.PagarNominasPeriodo(StrToIntDef(EFBanco.Text, -1));
        finally
           Screen.Cursor := crDefault;
        end;
     end;
  end;
end;

procedure TFMNomConstantes.EFBancoChange(Sender: TObject);
begin
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(EFBanco.Text, -1));
end;

procedure TFMNomConstantes.TBMarcarTodosClick(Sender: TObject);
begin
  inherited;
  DMNomConstantes.SeleccionarPagos(1);
end;

procedure TFMNomConstantes.TBDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  DMNomConstantes.SeleccionarPagos(0);
end;

procedure TFMNomConstantes.DBGPagosDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'RIC_PAGO') then
  begin
     if ((DMNomConstantes.QPagosESTADO.AsInteger = 5) and (DMNomConstantes.QPagosRIC_PAGO.AsInteger > 0)) then
        FMain.MuestraMovConta(' RIC= ' + DMNomConstantes.QPagosRIC_PAGO.AsString +
           ' AND EJERCICIO=' + DMNomConstantes.QPagosEJERCICIO_PAGO.AsString);
  end;
end;

procedure TFMNomConstantes.DBGPagosCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMNomConstantes.ADespagarPagosTodosExecute(Sender: TObject);
begin
  inherited;
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un Periodo'))
  else
  if ConfirmaMensaje(_('¿Esta seguro de que desea Revertir Pagos del periodo?')) then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMNomConstantes.DespagarPagosNominasPeriodo;
     finally
        Screen.Cursor := crDefault;
        ShowMessage(_('Proceso Terminado.'));
     end;
  end;
end;

procedure TFMNomConstantes.TBDespagarPagosClick(Sender: TObject);
begin
  inherited;
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un Periodo'))
  else
  begin
     if DMNomConstantes.HayMarca then
     begin
        if ConfirmaMensaje(_('¿Esta seguro de que desea Revertir los Pagos seleccionados?')) then
        begin
           Screen.Cursor := crHourGlass;
           try
              DMNomConstantes.DespagarPagosSeleccionados;
           finally
              Screen.Cursor := crDefault;
              ShowMessage(_('Proceso Terminado.'));
           end;
        end;
     end
     else
        raise Exception.Create(_('Debe seleccionar al menos un pago con asiento pagado en el periodo'));
  end;
end;

procedure TFMNomConstantes.AExportarPreviredExecute(Sender: TObject);
var
  Separador, Fichero, Linea, Sexo : string;
  ts : TStrings;
begin
  /// Genera un fichero con formato PREVIRED
  /// El formato son campos de longitud fija

  inherited;
  if (Trim(DBEPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un periodo'))
  else
  begin
     Separador := ';';

     Fichero := format('PREVIRED-%d-%s_%s.txt', [REntorno.Ejercicio, DMNomConstantes.xPeriodosPERIODO.AsString, FormatDateTime('_yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Fichero, 'TXT', '', 'FMNomConstantes-ExportarPrevired') then
     begin
        DMMain.LogIni(format('Exportacion Fichero Previred: %s', [Fichero]));

        Screen.Cursor := crHourGlass;
        try
           ts := TStringList.Create;
           try
              with DMNomConstantes.xNominas do
              begin
                 Close;
                 Open;
                 First;

                 while not EOF do
                 begin
                    // Agrego a una sola linea todo lo necesario de un trabajador para PREVIRED

                    //1- Datos del Trabajador
                    // Sexo M o F
                    Sexo := DMMain.DameValorTabla('OPE_EMPLEADO', 'EMPLEADO=' + FieldByName('EMPLEADO').AsString, 'GENERO', '1000');
                    if Sexo = 'H' then
                       Sexo := 'M'
                    else
                       Sexo := 'F';
                    //1-Datos del Trabajador
                    Linea := '';
                    Linea := Linea + Ajusta(Copy(FieldByName('NIF').AsString, 1, Pos('-', FieldByName('NIF').AsString) - 1), 'I', 11, '0'); // RUT(11)
                    Linea := Linea + Ajusta(Copy(FieldByName('NIF').AsString, Pos('-', FieldByName('NIF').AsString) + 1, Length(FieldByName('NIF').AsString) - Pos('-', FieldByName('NIF').AsString)), 'I', 1, '0'); // Dígito Verificador(1)
                    Linea := Linea + Ajusta(DMMain.DameValorTabla('OPE_EMPLEADO', 'EMPLEADO=' + FieldByName('EMPLEADO').AsString, 'APELLIDO_PATERNO', '1000'), 'D', 30, ' '); // Apellido Paterno(30)
                    Linea := Linea + Ajusta(DMMain.DameValorTabla('OPE_EMPLEADO', 'EMPLEADO=' + FieldByName('EMPLEADO').AsString, 'APELLIDO_MATERNO', '1000'), 'D', 30, ' '); // Apellido Materno
                    Linea := Linea + Ajusta(DMMain.DameValorTabla('OPE_EMPLEADO', 'EMPLEADO=' + FieldByName('EMPLEADO').AsString, 'NOMBRE', '1000'), 'D', 30, ' ');// Nombres
                    Linea := Linea + Ajusta(Sexo, 'D', 1, ' '); // Sexo(1)
                    Linea := Linea + Ajusta('01', 'D', 2, '0'); // Tipo Pago(2) ???
                    Linea := Linea + Ajusta(FieldByName('PERIODO').AsString + FieldByName('EJERCICIO').AsString, 'I', 6, '0'); // Período (Desde)(6)
                    Linea := Linea + Ajusta(FieldByName('PERIODO').AsString + FieldByName('EJERCICIO').AsString, 'I', 6, '0'); // Período (Hasta)(6)
                    Linea := Linea + Ajusta('AFP', 'D', 3, ' '); // Régimen Previsional(3) ??
                    Linea := Linea + Ajusta(IntToStr(Trunc(DMNomConstantes.DameImporteParametro('P073'))), 'I', 1, '0'); // Tipo Trabajador
                    Linea := Linea + Ajusta(IntToStr(Trunc(DMNomConstantes.DameImporteParametro('P003'))), 'I', 2, '0'); // Días Trabajados(2)
                    Linea := Linea + Ajusta('00', 'D', 2, '0'); // Tipo de Línea(2) ??
                    Linea := Linea + Ajusta('00', 'D', 2, '0'); // Código Movimiento de Personal(2) ??
                    Linea := Linea + Ajusta(FormatDateTime('dd-mm-yyyy', FieldByName('FECHA_INI_PERIODO').AsDateTime), 'I', 10, '0'); // Fecha Hasta(10)
                    Linea := Linea + Ajusta(FormatDateTime('dd-mm-yyyy', FieldByName('FECHA_FIN_PERIODO').AsDateTime), 'I', 10, '0'); // Fecha Desde(10)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P008')]), 'I', 2, '0'); // Tramo Asignación Familiar(1)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H025')]), 'I', 2, '0'); // Cargas Simples(2)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H026')]), 'I', 1, '0'); // Cargas Maternales(1)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H024')]), 'I', 1, '0'); // Cargas Inválidas(1)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H007')]), 'I', 6, '0'); // Asignación Familiar(6)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H008')]), 'I', 6, '0'); // Asignación Familiar Retroactivo(6)
                    Linea := Linea + Ajusta('', 'I', 6, '0'); // Reintegro Cargas Familiares(6) ???
                    Linea := Linea + Ajusta(IfThen(DMNomConstantes.DameImporteParametro('P405') = 1, 'S', 'N'), 'D', 1, ' '); // Solicitud Trabajador Joven(1)

                    // 2- Datos de la AFP
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P019')]), 'I', 2, '0'); // Código de la AFP(2)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H013')]), 'I', 8, '0'); // Renta Imponible AFP(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D055')]), 'I', 8, '0');// Cotización Obligatoria AFP(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D031')]), 'I', 8, '0'); // Cotización Seguro de Invalidez y Sobrevivencia (SIS) 9(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D076')]), 'I', 8, '0'); // Cuenta de Ahorro Voluntario AFP(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D086')]), 'I', 8, '0'); // Renta Imp. Sust.AFP 9 (8)
                    Linea := Linea + Ajusta('?', 'I', 5, ' '); // Tasa Pactada (Sustit.) 99,99 (5)
                    Linea := Linea + Ajusta('?', 'I', 9, ' '); // Aporte Indemn. (Sustit.)  (9)
                    Linea := Linea + Ajusta('?', 'I', 2, ' '); // N° Períodos (Sustit.)  (2)
                    Linea := Linea + Ajusta('?', 'I', 10, ' '); // Período desde (Sustit.) X (10)
                    Linea := Linea + Ajusta('?', 'I', 10, ' '); // Período Hasta (Sustit.) X (10)
                    Linea := Linea + Ajusta('?', 'I', 40, ' '); // Puesto de Trabajo Pesado X (40)
                    Linea := Linea + Ajusta('?', 'I', 5, ' '); // Cotización Trabajo Pesado 99,99 (5)
                    Linea := Linea + Ajusta('?', 'I', 6, ' '); // Cotización Trabajo Pesado 9 (6)

                    //3- Datos Ahorro Previsional Voluntario Individua
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P098')]), 'I', 2, '0');//Código de la Institución APVI (3)
                    Linea := Linea + Ajusta('?', 'I', 20, ' '); // Número de Contrato APVI (20)
                    Linea := Linea + Ajusta('?', 'I', 1, ' '); // Forma de Pago APVI(1)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Cotización APVI  (8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Cotización Depósitos Convenidos (8)

                    //4- Datos Ahorro Previsional Voluntario Colectivo
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P098')]), 'I', 3, '0'); // Código Institución Autorizada APVC (3)
                    Linea := Linea + Ajusta('?', 'I', 20, ' '); // Número de Contrato APVC (20)
                    Linea := Linea + Ajusta('?', 'I', 1, ' '); // Forma de Pago APVC (1)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Cotización Trabajador APVC (8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Cotización Empleador APVC (8)

                    //5- Datos Afiliado Voluntario
                    Linea := Linea + Ajusta('?', 'I', 11, ' '); // RUT Afiliado Voluntario(11)
                    Linea := Linea + Ajusta('?', 'I', 1, ' '); // DV Afiliado Voluntario  (1)
                    Linea := Linea + Ajusta('?', 'D', 30, ' '); // Apellido Paterno  (30)
                    Linea := Linea + Ajusta('?', 'D', 30, ' '); // Apellido Materno  (30)
                    Linea := Linea + Ajusta('?', 'D', 30, ' '); // Nombres  (30)
                    Linea := Linea + Ajusta('?', 'I', 2, ' '); // Código Movimiento de Personal (2)

                    { TODO : Mirar si esto es una fecha o un importe y de que campo sale }
                    Linea := Linea + Ajusta('???' {ESTO NO SON IMPORTES DMNomConstantes.DameImporteParametro('P024')}, 'I', 10, '0'); // Fecha desde (10)
                    Linea := Linea + Ajusta('???' {ESTO NO SON IMPORTES DMNomConstantes.DameImporteParametro('P025')}, 'I', 10, '0'); // Fecha Hasta (10)

                    Linea := Linea + Ajusta('?', 'I', 2, ' '); // Código de la AFP (2)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Monto Capitalización Voluntaria(8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Monto Ahorro Voluntario(8)
                    Linea := Linea + Ajusta('?', 'I', 2, ' '); // Número de periodos de cotización(2)

                    //6- Datos IPS - ISL - FONASA
                    Linea := Linea + Ajusta('?', 'I', 4, ' '); // Código EX-Caja Régimen(4)
                    Linea := Linea + Ajusta('?', 'I', 5, ' '); // Tasa Cotización Ex-Caja Previsión  (5)
                    Linea := Linea + Ajusta('?', 'D', 8, ' '); // Renta Imponible IPS  (8)
                    Linea := Linea + Ajusta('?', 'D', 8, ' '); // Cotización Obligatoria IPS  (8)
                    Linea := Linea + Ajusta('?', 'D', 8, ' '); // Renta Imponible Desahucio (8)
                    Linea := Linea + Ajusta('?', 'I', 4, ' '); // Código Ex-Caja Régimen Desahucio (4)
                    Linea := Linea + Ajusta('?', 'I', 5, ' '); // Tasa Cotización Desahucio Ex-Cajas de Previsión (5)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Cotización Desahucio  (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D003')]), 'I', 8, '0'); // Cotización Fonasa (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D083')]), 'I', 8, '0'); //Cotización Acc. Trabajo (ISL)(8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' ');//Bonificación Ley 15.386 (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D042')]), 'I', 8, '0'); // Descuento por cargas familiares de IPS(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H052')]), 'I', 8, '0'); // Bonos Gobierno (8)

                    //7- Datos Salud
                    Linea := Linea + Ajusta('?', 'I', 2, ' '); // Código Institución de Salud(2)
                    Linea := Linea + Ajusta('?', 'I', 16, ' '); // Número del FUN(16)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H051')]), 'I', 8, '0'); // Renta Imponible ISAPRE  (8)
                    Linea := Linea + Ajusta('', 'D', 1, ' '); // Moneda del plan pactado Isapre(1)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D004')]), 'I', 8, '0'); // Cotización Pactada(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D041')]), 'I', 8, '0'); // Cotización Obligatoria Isapre(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P416')]), 'I', 8, '0');  // Cotización Adicional Voluntaria (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D057')]), 'I', 8, '0'); // Monto Garantía Explícita de Salud GES (Uso Futuro) (8)

                    //8- Datos Caja de Compensación
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P029')]), 'I', 2, '0'); // Código CCAF(2)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P199')]), 'I', 8, '0'); // Renta Imponible CCAF(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D024')]), 'I', 8, '0'); // Créditos Personales CCAF  (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D064')]), 'I', 8, '0');//Descuento Dental CCAF(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D027')]), 'I', 8, '0'); // Descuentos por Leasing (Programa Ahorro)(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D025')]), 'I', 8, '0'); // Descuentos por seguro de vida CCAF(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D065')]), 'I', 8, '0'); // Otros descuentos CCAF (8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Cotización a CCAF de no afiliados a Isapres (8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Descuento Cargas Familiares CCAF (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D066')]), 'I', 8, '0'); // Otros descuentos CCAF 1 (Uso Futuro) (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D067')]), 'I', 8, '0'); // Otros descuentos CCAF 2 (Uso Futuro) (8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Bonos Gobierno (Uso Futuro)(8)
                    Linea := Linea + Ajusta('?', 'I', 20, ' '); // Código de Sucursal (Uso Futuro) (20)

                    //9- Datos Mutualidad
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P414')]), 'I', 2, '0');// Código Mutualidad(2)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteHaberes('H013')]), 'I', 8, '0'); // Renta Imponible Mutual(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D083')]), 'I', 8, '0'); // Cotización Accidente del Trabajo (MUTUAL) (8)
                    Linea := Linea + Ajusta('?', 'I', 8, ' '); // Sucursal para pago Mutual (8)

                    //10- Datos Administradora de Seguro de Cesantía
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteParametro('P021')]), 'I', 8, '0'); // Renta Imponible Seguro Cesantía (Informar Renta Total Imponible)(8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D168')]), 'I', 8, '0'); // Aporte Trabajador Seguro Cesantía (8)
                    Linea := Linea + Ajusta(format('%.0f', [DMNomConstantes.DameImporteDescuentos('D167')]), 'I', 8, '0'); // Aporte Empleador Seguro Cesantía (8)

                    //11- Datos Pagador de Subsidios
                    Linea := Linea + Ajusta('?', 'I', 11, ' '); // Rut Pagadora Subsidio(11)
                    Linea := Linea + Ajusta('?', 'I', 1, ' '); // DV Pagadora Subsidio(1)

                    //12- Otros Datos de la Empresa
                    Linea := Linea + Ajusta('?', 'I', 20, ' '); // Centro de Costos, Sucursal, Agencia,Obra, Región(20)

                    ts.Add(Linea);
                    Next;
                 end;
              end;

              ts.SaveToFile(Fichero);
           finally
              ts.Free;
           end;
        finally
           Screen.Cursor := crDefault;
           DMMain.LogFin('Exportacion finalizada.');
        end;
     end;

     ShowMessage(_('Proceso Terminado.'));
  end;
end;

end.
