{
Eliminado porque ya no se utiliza la tabla PRO_IMP_PRESENCIA

Eliminar en base de datos
  SP RECALCULA_PRO_IMP_PRESENCIA()
  SP PROCESA_PRO_IMP_PRESENCIA()
  SP INSERTA_MARCAJE_CODIGO()
  TABLA PRO_IMP_PRESENCIA

Eliminar
  UFMRecalculoPresencia
}
unit UFMPresencia;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, DB,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UDBDateTimePicker, StdCtrls, Mask, DBCtrls, UFormGest,
  rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBEdit, ULFDBEditFind2000, UG2kTBLoc, Buttons, ULFLabel, DBActns, ULFDBDateEdit,
  ULFDateEdit, ULFEditFind2000, ULFEdit, UFPEditDetalle, TFlatCheckBoxUnit,
  ULFCheckBox;

type
  TFMPresencia = class(TFPEditDetalle)
     LOperario: TLFLabel;
     DBEFOperario: TLFDBEditFind2000;
     DBEDescOperario: TLFDbedit;
     LFecha: TLFLabel;
     DBDEFecha: TLFDBDateEdit;
     LTotalHorasPre: TLFLabel;
     DBETotalHoras: TLFDbedit;
     DBNotas: TLFDBMemo;
     SBAOperario: TSpeedButton;
     ALOperario: TLFActionList;
     AAOperario: TAction;
     LCalendario: TLFLabel;
     LHorario: TLFLabel;
     DBECalendario: TLFDbedit;
     DBEHorario: TLFDbedit;
     EDescHorario: TLFEdit;
     EDescCalendario: TLFEdit;
     TSNotas: TTabSheet;
     LFDbNotas: TLFDBMemo;
     LFToolBar1: TLFToolBar;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LFPanelNotas: TLFPanel;
     SBACalendari: TSpeedButton;
     ACalendario: TAction;
     SBAHorario: TSpeedButton;
     AHorario: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AComprobarParejas: TAction;
     LRIG: TLFLabel;
     DBERIG: TLFDbedit;
     ARecogerMarcajesImesD: TAction;
     PNLFiltroEmpleado: TLFPanel;
     LFiltroEmpleado: TLFLabel;
     EFFiltroEmpleado: TLFEditFind2000;
     PNLFiltroFecha: TLFPanel;
     LFiltroFecha: TLFLabel;
     DEFiltroFechaDesde: TLFDateEdit;
     DEFiltroFechaHasta: TLFDateEdit;
     { Eliminado porque ya no se utiliza la tabla PRO_IMP_PRESENCIA
     ARecalculaPresencia: TAction;
     object ARecalculaPresencia: TAction
       Category = 'Procesos'
       Caption = 'Recalcula Presencia'
       Hint = 'Recalcula Presencia según marcajes'
       ImageIndex = 26
       OnExecute = ARecalculaPresenciaExecute
     end
     }
     BMesAnterio: TButton;
     BEjercicio: TButton;
     BMes: TButton;
     BHoy: TButton;
     BMesSiguiente: TButton;
     TBSep1: TToolButton;
     AMuestraMarcajes: TAction;
     DBGMarcajes: TDBGridFind2000;
     splMarcajes: TSplitter;
     PNLMostrarMarcajes: TLFPanel;
     CBMostrarMarcajes: TLFCheckBox;
     TBSep2: TToolButton;
     TBIncidenciaAnt: TToolButton;
     TBIncidenciaSig: TToolButton;
     AinicidenciaAnt: TAction;
     AinicidenciaSig: TAction;
     TBSep3: TToolButton;
     TBRecalcularDesdeMarcaje: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleColExit(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure SBAOperarioDblClick(Sender: TObject);
     procedure AAOperarioExecute(Sender: TObject);
     procedure ACalendarioExecute(Sender: TObject);
     procedure SBACalendariDblClick(Sender: TObject);
     procedure AHorarioExecute(Sender: TObject);
     procedure SBAHorarioDblClick(Sender: TObject);
     procedure AComprobarParejasExecute(Sender: TObject);
     procedure ARecogerMarcajesImesDExecute(Sender: TObject);
     procedure FiltroChange(Sender: TObject);
     procedure DBEHorarioChange(Sender: TObject);
     procedure DBECalendarioChange(Sender: TObject);
     { Eliminado porque ya no se utiliza la tabla PRO_IMP_PRESENCIA
     procedure ARecalculaPresenciaExecute(Sender: TObject);
     }
     procedure BEjercicioClick(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BHoyClick(Sender: TObject);
     procedure BMesAnterioClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure splMarcajesMoved(Sender: TObject);
     procedure PDetalleResize(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure CBMostrarMarcajesClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGMarcajesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure AinicidenciaAntExecute(Sender: TObject);
     procedure AinicidenciaSigExecute(Sender: TObject);
     procedure TBRecalcularDesdeMarcajeClick(Sender: TObject);
     procedure DBGMarcajesDblClick(Sender: TObject);
  private
     { Private declarations }
     Porc_splMarcajes: double;
  public
     { Public declarations }
     procedure Filtra(Filtro: string);
     procedure FiltraEmpleado(Empleado: integer; FechaDesde: TDateTime = 0; FechaHasta: TDateTime = 0);
  end;

var
  FMPresencia : TFMPresencia;

implementation

uses UDMMain, UDMPresencia, UEntorno, UFMain, UUtiles, UFMRecalculoPresencia, DateUtils,
  UFMPresenciaProcesaMarcajes;

{$R *.dfm}

procedure TFMPresencia.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;

  AbreData(TDMPresencia, DMPresencia);

  NavMain.DataSource := DMPresencia.DSQMProCabPre;
  DBGMain.DataSource := DMPresencia.DSQMProCabPre;
  NavDetalle.DataSource := DMPresencia.DSQMProDetPre;
  DBGFDetalle.DataSource := DMPresencia.DSQMProDetPre;

  G2KTableLoc.DataSource := DMPresencia.DSQMProCabPre;
  // Necesito este paso porque el LeeDatoIni se guarda como integer y Porc_... es double y se interpreta como un TDateTime.
  i := LeeDatoIni('FMPresencia', 'Porc_splMarcajes', 50);
  Porc_splMarcajes := i;

  DBEDescOperario.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAOperario, DBEDescOperario);

  EDescCalendario.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBACalendari, EDescCalendario);

  EDescHorario.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAHorario, EDescHorario);

  DBGFDetalle.DataSource := DMPresencia.DSQMProDetPre;
  DBGFDetalle.ColumnaInicial := EncuentraField(DBGFDetalle, 'HORA_ENTRADA');

  EFFiltroEmpleado.Text := '';
  BMes.Click;
  FiltroChange(Sender);
end;

procedure TFMPresencia.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  inherited;
  // Necesito este paso porque el LeeDatoIni se guarda como integer y Porc_... es double y se interpreta como un TDateTime.
  i := Trunc(Porc_splMarcajes);
  EscribeDatoIni('FMPresencia', 'Porc_splMarcajes', i);

  CierraData(DMPresencia);
end;

procedure TFMPresencia.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  DBGFDetalle.CondicionBusqueda := '';
  DBGFDetalle.PlanBusquedaNum := '';
  DBGFDetalle.PlanBusquedaStr := '';
end;

procedure TFMPresencia.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  {
  if ProDMMarcajesOpe.QMProDetMarca.State in [dsEdit, dsInsert] then
    case (Sender as TDBGridFind2000).selectedindex of
      8:
        begin
          if not ((ProDMMarcajesOpe.QMProDetMarcaHORA_INICIO.Value >= 0000) and
            (ProDMMarcajesOpe.QMProDetMarcaHORA_INICIO.Value <= 2400)) then
          begin
            ShowMessage(_('Hora incorrecta'));//idioma_code
            (Sender as TDBGridFind2000).SelectedIndex := 7;
          end;
        end;
      9:
        begin
          if not ((ProDMMarcajesOpe.QMProDetMarcaHORA_FIN.Value >= 0000) and
            (ProDMMarcajesOpe.QMProDetMarcaHORA_FIN.Value <= 2400)) then
          begin
            ShowMessage(_('Hora incorrecta'));//idioma_code
            (Sender as TDBGridFind2000).SelectedIndex := 8;
          end;
          if ProDMMarcajesOpe.QMProDetMarcaTiempo.Value < 0 then
          begin
            ShowMessage(_('La hora fin no puede ser inferior a la de inicio'));//idioma_code
            (Sender as TDBGridFind2000).SelectedIndex := 8;
          end;
        end;
    end;
}
end;

procedure TFMPresencia.DBGFDetalleColExit(Sender: TObject);
begin
  {
  if ProDMMarcajesOpe.QMProDetMarca.State in [dseDit, dsInsert] then
  begin
    if (DBGFDetalleOpe.ColumnaActual = 'IDTAREA') and
      (ProDMMarcajesOpe.QMProDetMarca.FieldByName('IDTAREA').AsString <> '') then
    begin
      with ProDMMarcajesOpe.xDatosTarea do
      begin
        Active := False;
        SelectSQL.Clear;
        SelectSQL.Add('Select * From Pro_Ord_Tarea Where IDENTIFICADOR=:VIdTarea');
        Params.ByName['VIdTarea'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaIDTAREA.Value;
        Active := True;
      end;

      if (ProDMMarcajesOpe.xDatosTarea.Fields[23].AsInteger<>0) then
      begin
        ProDMMarcajesOpe.QMProDetMarcaID_ORDEN.Value := ProDMMarcajesOpe.xDatosTareaID_ORDEN.Value;
        ProDMMarcajesOpe.QMProDetMarcaRIG_OF.Value := ProDMMarcajesOpe.xDatosTareaRIG_OF.Value;
        ProDMMarcajesOpe.QMProDetMarcaLINEA_FASE.Value := ProDMMarcajesOpe.xDatosTareaLINEA_FASE.Value;
        ProDMMarcajesOpe.QMProDetMarcaLINEA_TAREA.Value := ProDMMarcajesOpe.xDatosTareaLINEA_TAREA.Value;
      end;
    end;
    if (DBGFDetalleOpe.ColumnaActual = 'LINEA_TAREA') and
      (ProDMMarcajesOpe.QMProDetMarca.FieldByName('LINEA_TAREA').AsString <> '') and
      (ProDMMarcajesOpe.QMProDetMarca.FieldByName('IDTAREA').AsString = '') then
    begin
      with ProDMMarcajesOpe.xDatosTarea do
      begin
        Active := False;
        SelectSQL.Clear;
        SelectSQL.Add(
          'Select * From Pro_Ord_Tarea Where LINEA_TAREA=:VLineaTarea and id_orden=:VId_orden and LINEA_FASE=:VLineaFase');
        Params.ByName['VLineaTarea'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaLINEA_TAREA.Value;
        Params.ByName['VLineaFase'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaLINEA_FASE.Value;
        Params.ByName['VId_orden'].AsInteger := ProDMMarcajesOpe.QMProDetMarcaId_orden.Value;
        Active := True;
      end;
      ProDMMarcajesOpe.QMProDetMarcaIDTAREA.Value := ProDMMarcajesOpe.xDatosTareaIDENTIFICADOR.Value;
    end;
  end;
}
end;

procedure TFMPresencia.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPresencia.BusquedaCompleja;
end;

procedure TFMPresencia.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
var
  Filtro : string;
begin
  inherited;
  // No se utiliza la serie. Se rellena siempre con "A".
  // G2KTableLoc.CondicionBusqueda := 'SERIE=''' + REntorno.Serie + '''';
  Filtro := 'SERIE=''A''';

  Filtro := Filtro + ' AND FECHA BETWEEN ''' + FormatDateTime('yyyy.mm.dd', DEFiltroFechaDesde.Date) + ''' AND ''' + FormatDateTime('yyyy.mm.dd', RecodeTime(DEFiltroFechaHasta.Date, 23, 59, 59, 999)) + '''';

  if (StrToIntDef(EFFiltroEmpleado.Text, 0) <> 0) then
     Filtro := Filtro + ' AND OPERARIO = ' + EFFiltroEmpleado.Text;

  G2KTableLoc.CondicionBusqueda := Filtro;
  G2KTableLoc.Click;
end;

procedure TFMPresencia.SBAOperarioDblClick(Sender: TObject);
begin
  inherited;
  AAOperario.Execute;
end;

procedure TFMPresencia.AAOperarioExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO = ''' +
     DMPresencia.QMProCabPreOPERARIO.AsString + '''');
end;

procedure TFMPresencia.ACalendarioExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeCalendarioEmp, 'EMPLEADO = ''' +
     FMPresencia.DBEFOperario.Text + '''');
end;

procedure TFMPresencia.SBACalendariDblClick(Sender: TObject);
begin
  inherited;
  ACalendario.Execute;
end;

procedure TFMPresencia.AHorarioExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeHorario, 'HORARIO = ''' +
     DMPresencia.QMProCabPreHORARIO.AsString + '''');
end;

procedure TFMPresencia.SBAHorarioDblClick(Sender: TObject);
begin
  inherited;
  AHorario.Execute;
end;

procedure TFMPresencia.Filtra(Filtro: string);
begin
  DMPresencia.Filtra(Filtro);
end;

procedure TFMPresencia.AComprobarParejasExecute(Sender: TObject);
begin
  inherited;
  if (DMPresencia.ErrorParejaMarcaje(DMPresencia.QMProCabPreID_CAB_PRESENCIA.AsInteger)) then
     ShowMessage(_('ERROR: Existen marcajes sin cerrar o sin su pareja'))
  else
     ShowMessage(_('No existen errores'));
end;

procedure TFMPresencia.ARecogerMarcajesImesDExecute(Sender: TObject);
begin
  inherited;
  DMPresencia.RecogerMarcajesImesD;
end;

procedure TFMPresencia.FiltroChange(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  Filtro := 'FECHA BETWEEN ''' + FormatDateTime('yyyy.mm.dd', DEFiltroFechaDesde.Date) + ''' AND ''' + FormatDateTime('yyyy.mm.dd', RecodeTime(DEFiltroFechaHasta.Date, 23, 59, 59, 999)) + '''';
  if (StrToIntDef(EFFiltroEmpleado.Text, 0) <> 0) then
     Filtro := Filtro + ' AND OPERARIO = ' + EFFiltroEmpleado.Text;

  DMPresencia.Filtra(Filtro);
end;

procedure TFMPresencia.DBEHorarioChange(Sender: TObject);
begin
  inherited;
  EDescHorario.Text := DMPresencia.DameTituloHorario(DBEHorario.Text);
end;

procedure TFMPresencia.DBECalendarioChange(Sender: TObject);
begin
  inherited;
  EDescCalendario.Text := DMPresencia.DameTituloCalendario(StrToIntDef(DBECalendario.Text, 0));
end;

{ Eliminado porque ya no se utiliza la tabla PRO_IMP_PRESENCIA
procedure TFMPresencia.ARecalculaPresenciaExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMRecalculoPresencia, FMRecalculoPresencia, FMain);
  FMRecalculoPresencia.Hide;
  FMRecalculoPresencia.ShowModal;
  DMPresencia.RefrescaDatos;
end;
}
procedure TFMPresencia.FiltraEmpleado(Empleado: integer; FechaDesde: TDateTime = 0; FechaHasta: TDateTime = 0);
begin
  if (FechaDesde > 0) then
     DEFiltroFechaDesde.Date := FechaDesde;

  if (FechaDesde > 0) then
     DEFiltroFechaHasta.Date := FechaHasta;

  EFFiltroEmpleado.Text := IntToStr(Empleado);

  FiltroChange(Self);
end;

procedure TFMPresencia.BEjercicioClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'EJE');
end;

procedure TFMPresencia.BMesClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'MES');
end;

procedure TFMPresencia.BHoyClick(Sender: TObject);
begin
  inherited;
  DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'DIA');
end;

procedure TFMPresencia.BMesAnterioClick(Sender: TObject);
begin
  inherited;
  if Abs(DEFiltroFechaHasta.Date - DEFiltroFechaDesde.Date) < 2 then
     DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'D-')
  else
     DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'M-');
end;

procedure TFMPresencia.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  if Abs(DEFiltroFechaHasta.Date - DEFiltroFechaDesde.Date) < 2 then
     DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'D+')
  else
     DMMain.CambiaFechas(DEFiltroFechaDesde, DEFiltroFechaHasta, 'M+');
end;

procedure TFMPresencia.splMarcajesMoved(Sender: TObject);
begin
  inherited;
  Porc_splMarcajes := 100 * splMarcajes.Left / PDetalle.Width;
end;

procedure TFMPresencia.PDetalleResize(Sender: TObject);
begin
  inherited;
  DBGFDetalle.Constraints.MinWidth := PDetalle.Width div 4;
  DBGFDetalle.Width := Trunc(PDetalle.Width * Porc_splMarcajes / 100);

  // Para asegurar que el splitter quede a la derecha del Grid
  splMarcajes.Left := DBGFDetalle.Width + 1;
end;

procedure TFMPresencia.TSFichaShow(Sender: TObject);
begin
  inherited;
  PDetalleResize(Sender);
end;

procedure TFMPresencia.CBMostrarMarcajesClick(Sender: TObject);
begin
  inherited;
  if CBMostrarMarcajes.Checked then
  begin
     DBGFDetalle.Align := alLeft;
     DBGMarcajes.Visible := True;
     splMarcajes.Visible := True;
  end
  else
  begin
     DBGFDetalle.Align := alClient;
     DBGMarcajes.Visible := False;
     splMarcajes.Visible := False;
  end;

  PDetalleResize(Sender);
end;

procedure TFMPresencia.FormShow(Sender: TObject);
begin
  inherited;
  CBMostrarMarcajesClick(Sender);
end;

procedure TFMPresencia.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'HORA_ENTRADA') then
        begin
           if (DMPresencia.QMProDetPreHORA_ENTRADA.IsNull) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'HORA_SALIDA') then
        begin
           if (DMPresencia.QMProDetPreHORA_SALIDA.IsNull) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPresencia.DBGMarcajesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DMPresencia.QMProDetPreID_DET_PRESENCIA.AsInteger = DMPresencia.QMMarcajesID_DET_PRESENCIA.AsInteger) then
           ColorResaltado6(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPresencia.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  DBGMarcajes.Refresh;
end;

procedure TFMPresencia.AinicidenciaAntExecute(Sender: TObject);
begin
  inherited;
  DMPresencia.BuscaMarcajeConIncidencia('A');
end;

procedure TFMPresencia.AinicidenciaSigExecute(Sender: TObject);
begin
  inherited;
  DMPresencia.BuscaMarcajeConIncidencia('S');
end;

procedure TFMPresencia.TBRecalcularDesdeMarcajeClick(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Volver a recalcular la presencia a partir de marcajes?' + #13#10 + 'Se perderan las modificaciones manuales')) then
     DMPresencia.RecalcularDesdeMarcaje;
end;

procedure TFMPresencia.DBGMarcajesDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AImportacionFichajesDePresencia);
  FMPresenciaProcesaMarcajes.Filtrar(DMPresencia.QMProCabPreFECHA.AsDateTime, DMPresencia.QMProCabPreFECHA.AsDateTime, DMPresencia.QMProCabPreID_EMPLEADO.AsInteger, DMPresencia.QMProCabPreID_EMPLEADO.AsInteger, False);
end;

end.
