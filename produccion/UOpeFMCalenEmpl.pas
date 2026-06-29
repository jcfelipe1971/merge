unit UOpeFMCalenEmpl;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Yearplan, ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ActnList, rxPlacemnt, NsDBGrid, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel,
  ULFEdit, TFlatCheckBoxUnit, ULFCheckBox;

type
  TOpeFMCalenEmpl = class(TFPEdit)
     YPCalendario: TYearPlanner;
     LEmpleado: TLFLabel;
     LCalendario: TLFLabel;
     GBLeyenda: TGroupBox;
     Shape1: TShape;
     LFest_Rem: TLFLabel;
     Shape2: TShape;
     LFestivo: TLFLabel;
     DBEEmplDescrip: TLFDbedit;
     DBECalenDesc: TLFDbedit;
     DBEEmpleado: TLFDbedit;
     DBECalendario: TLFDbedit;
     Shape3: TShape;
     LFestEmpl: TLFLabel;
     ALCalendario: TActionList;
     AFestivo: TAction;
     ALaboral: TAction;
     PTCalendario: TPopUpTeclas;
     MarcarFestivo1: TMenuItem;
     Laboral1: TMenuItem;
     LRemun: TLFLabel;
     LRemFestEmpl: TLFLabel;
     Shape5: TShape;
     Shape6: TShape;
     Noremunerado1: TMenuItem;
     Remunerado1: TMenuItem;
     ANoRemunerado: TAction;
     ARemunerado: TAction;
     Horas1: TMenuItem;
     AHoras: TAction;
     Shape4: TShape;
     LHorasAsig: TLFLabel;
     LOtroHorarioEmpresa: TLFLabel;
     Shape7: TShape;
     LOtroHorarioEmpleado: TLFLabel;
     Shape8: TShape;
     DBEHorario: TLFDbedit;
     DBEDescHorario: TLFDbedit;
     LHorario: TLFLabel;
     N1: TMenuItem;
     MGHorario: TMenuItem;
     AAsignarHorario: TAction;
     LHoraLaborable: TLFLabel;
     DBEHoras: TLFDbedit;
     TButtMarcajes: TToolButton;
     AMarcajes: TLFCategoryAction;
     MISeleccion: TMenuItem;
     PNLHorarioDet: TLFPanel;
     EComentario: TLFEdit;
     EDatosFecha: TLFEdit;
     MIAsignarHorario: TMenuItem;
     ADesasignarHorario: TAction;
     MIDesasignarHorario: TMenuItem;
     PNLIgnorar: TLFPanel;
     LIgnorar: TLFLabel;
     CBIgnorarSabado: TLFCheckBox;
     CBIgnorarDomingo: TLFCheckBox;
     CBIgnorarFestivo: TLFCheckBox;
     N2: TMenuItem;
     N3: TMenuItem;
     N4: TMenuItem;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure YPCalendarioYearChange(Sender: TObject);
     procedure Accion(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
     procedure AMarcajesExecute(Sender: TObject);
     procedure YPCalendarioDblClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
     procedure YPCalendarioYearChanged(Sender: TObject);
     procedure YPCalendarioMouseRightClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
     procedure YPCalendarioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     // procedure YPCalendarioDblClick(StDays, EnDays, StMonth, EnMonth: integer);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InicializacionCalendario;
     procedure FiltraCalendario(Filtro: string);
  end;

var
  OpeFMCalenEmpl : TOpeFMCalenEmpl;

implementation

uses UFormGest, UDMMain, UEntorno,
  UOpeFMRazonCalenEmpl, UOpeDMCalenEmpl,
  UOpeFMHorarioCalenEmpl, UFMain, UOpeDMEmpleados, {FIBQuery,} HYFIBQuery, DateUtils,
  UFMPresencia;

{$R *.DFM}

procedure TOpeFMCalenEmpl.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMCalenEmpl, OpeDMCalenEmpl);

  NavMain.DataSource := OpeDMCalenEmpl.DSQMEmpleado;
  EPMain.DataSource := OpeDMCalenEmpl.DSQMEmpleado;
  DBGMain.DataSource := OpeDMCalenEmpl.DSQMEmpleado;

  YPCalendario.Year := REntorno.Ejercicio;
end;

procedure TOpeFMCalenEmpl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMCalenEmpl);
end;

procedure TOpeFMCalenEmpl.InicializacionCalendario;
begin
  YPCalendario.ClearCells;
end;

procedure TOpeFMCalenEmpl.YPCalendarioYearChange(Sender: TObject);
begin
  inherited;
  InicializacionCalendario;
end;

procedure TOpeFMCalenEmpl.Accion(Sender: TObject);
var
  Dia, FechaIni, FechaFin : TDateTime;
  Opc : integer;
  Razon_Horario : string;
  HorasTrab : double;
  Modifica : boolean;
begin
  inherited;
  // Opc = 0 -> Día Laboral (Quita marca de festivo)
  // Opc = 1 -> Día Festivo (Pone marca de festivo)
  // Opc = 2 -> Día No remunerado (Quita la marca de remunerado)
  // Opc = 3 -> Día Remunerado (Pone la marca de remunerado)
  // Opc = 4 -> Asignación de horas
  // Opc = 5 -> Cambio Horario
  // Opc = 6 -> Recupera horario del calendario

  Modifica := True;
  Opc := TMenuItem(Sender).Tag;

  if (Opc = 1) or (Opc = 4) then
     Modifica := UOpeFMRazonCalenEmpl.RellenaRazon(Razon_Horario, HorasTrab, (Opc = 4));

  if (Opc = 5) then
     Modifica := UOpeFMHorarioCalenEmpl.RellenaHorario(Razon_Horario);

  if Modifica then
  begin
     FechaIni := EncodeDate(YPCalendario.Year, 1, 1);
     FechaFin := EncodeDate(YPCalendario.Year, 12, 31);
     {
     FechaIni := Round(YPCalendario.GetStartDate);
     FechaFin := Round(YPCalendario.GetEndDate);
     }
     Dia := FechaIni;
     YPCalendario.Hide;
     try
        while (Dia <= FechaFin) do
        begin
           // Verifico que no estamos dentro de un dia a ignorar
           if not ((CBIgnorarSabado.Checked and (DayOfWeek(Dia) = 7)) or (CBIgnorarDomingo.Checked and (DayOfWeek(Dia) = 1))) then
              if not (CBIgnorarFestivo.Checked and (OpeDMCalenEmpl.Festivo(Dia))) then
                 if YPCalendario.IsSelected(Dia) then // Actualizar el calendario del empleado
                    OpeDMCalenEmpl.ActualizaCalendEmpl(Opc, Dia, Razon_Horario, HorasTrab, False);

           Dia := IncDay(Dia);
        end;
     finally
        YPCalendario.Show;
     end;
  end;

  OpeDMCalenEmpl.RefrescaCalendario;
end;

procedure TOpeFMCalenEmpl.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMCalenEmpl.BusquedaCompleja;
  Continua := False;
end;

procedure TOpeFMCalenEmpl.TbuttCompClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(OpeDMCalenEmpl.QMEmpleadoTERCERO.AsInteger);
end;

procedure TOpeFMCalenEmpl.AMarcajesExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.APresencia);
  FMPresencia.FiltraEmpleado(OpeDMCalenEmpl.QMEmpleadoEMPLEADO.AsInteger, YPCalendario.GetStartDate, YPCalendario.GetStartDate);

  {
  if (OpeDMCalenEmpl.ExisteMarcaje(OpeDMCalenEmpl.QMEmpleadoEMPLEADO.AsInteger, YPCalendario.GetStartDate)) then
  begin
  end
  else
     ShowMessage(_('No existen marcajes para la fecha seleccionada'));
  }
end;

procedure TOpeFMCalenEmpl.YPCalendarioDblClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
begin
  inherited;
  AMarcajes.Execute;
end;

{
procedure TOpeFMCalenEmpl.YPCalendarioDblClick(StDays, EnDays, StMonth, EnMonth: integer);
begin
  inherited;
  AMarcajes.Execute;
end;
}

procedure TOpeFMCalenEmpl.FiltraCalendario(Filtro: string);
begin
  OpeDMCalenEmpl.FiltraCalendario(Filtro);
end;

procedure TOpeFMCalenEmpl.YPCalendarioYearChanged(Sender: TObject);
begin
  inherited;
  OpeDMCalenEmpl.RefrescaCalendario;
end;

procedure TOpeFMCalenEmpl.YPCalendarioMouseRightClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
begin
  inherited;
  if (StartDate = EndDate) then
     MISeleccion.Caption := Format(_('Seleccion: %s'), [DateToStr(StartDate)])
  else
     MISeleccion.Caption := Format(_('Seleccion: %s - %s'), [DateToStr(StartDate), DateToStr(EndDate)]);
end;

procedure TOpeFMCalenEmpl.YPCalendarioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  Fecha, FechaIni, FechaFin : TDateTime;
  CX, CY : integer;
  dia_semana : integer;
  dia : TDateTime;
  CD : TCellData;

  function DameMarca(Valor: integer): string;
  begin
     Result := '_';
     if (Valor = 1) then
        Result := 'X';
  end;

begin
  YPCalendario.XYToCell(X, Y, CX, CY);
  dia_semana := 0;

  if (cy = 0) then
  begin
     // Si presionamos sobre una celda de dia de semana

     dia_semana := cx mod 7; // 0 domingo
     FechaIni := EncodeDate(YPCalendario.Year, 1, 1);
     FechaFin := EncodeDate(YPCalendario.Year, 12, 31);
     Dia := FechaIni;
     YPCalendario.Hide;
     try
        while (Dia <= FechaFin) do
        begin
           if DayOfWeek(Dia) = (dia_semana + 1) then
           begin
              CD := YPCalendario.GetCellData(Dia);
              CD.Selected := True;
           end;

           Dia := IncDay(Dia);
        end;
     finally
        YPCalendario.Show;
     end;
  end
  else
  begin
     // Si presionamos sobre una celda de fecha
     // Obtengo comentario y descripcion de horario oara la fecha seleccionada
     EComentario.Text := '';
     EDatosFecha.Text := '';
     if ((YPCalendario.CurrentDate.Month > 0) and (YPCalendario.CurrentDate.Day > 0)) then
     begin
        Fecha := EncodeDate(YPCalendario.Year, YPCalendario.CurrentDate.Month, YPCalendario.CurrentDate.Day);

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT D.CONTADOR, D.FECHA, D.COMENTARIO, D.HORARIO, H.DESCRIPCION, D.FESTIVO, D.EXTRAS_REMUN ');
              SQL.Add(' FROM OPE_CALENDARIO_D D ');
              SQL.Add(' JOIN OPE_HORARIOS H ON ');
              SQL.Add(' (H.EMPRESA = D.EMPRESA AND H.HORARIO = D.HORARIO) ');
              SQL.Add(' WHERE ');
              SQL.Add(' D.EMPRESA = :EMPRESA AND ');
              SQL.Add(' D.CALENDARIO = :CALENDARIO AND ');
              SQL.Add(' D.FECHA = :FECHA ');
              Params.ByName['EMPRESA'].AsInteger := OpeDMCalenEmpl.xCalendarioEMPRESA.AsInteger;
              Params.ByName['CALENDARIO'].AsInteger := OpeDMCalenEmpl.xCalendarioCALENDARIO.AsInteger;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              ExecQuery;

              // Solo si hay datos
              if (FieldByName['CONTADOR'].AsInteger > 0) then
              begin
                 EComentario.Text := Format('Empresa: %s - [%s] Festivo - [%s] Remunerado', [DateToStr(Fecha), DameMarca(FieldByName['FESTIVO'].AsInteger), DameMarca(FieldByName['EXTRAS_REMUN'].AsInteger)]);

                 if (FieldByName['HORARIO'].AsString <> '') then
                 begin
                    if (FieldByName['HORARIO'].AsString <> OpeDMCalenEmpl.xCalendarioHORARIO.AsString) then
                       EComentario.Text := EComentario.Text + ' - ' + Format(_('Horario %s (%s)'), [FieldByName['HORARIO'].AsString, FieldByName['DESCRIPCION'].AsString]);
                 end;

                 if (FieldByName['COMENTARIO'].AsString <> '') then
                    EComentario.Text := EComentario.Text + ' - ' + Format(_('Comentario: %s'), [FieldByName['COMENTARIO'].AsString]);
              end;

              FreeHandle;
           finally
              Free;
           end;
        end;

        // Especifico del empelado
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT C.LINEA, C.FESTIVO, C.EXTRAS_REMUN, C.HORAS_LAB, C.HORARIO, C.COMENTARIO, H.DESCRIPCION ');
              SQL.Add(' FROM OPE_EMPLEADO_CAL C ');
              SQL.Add(' JOIN OPE_HORARIOS H ON ');
              SQL.Add(' (H.EMPRESA = C.EMPRESA AND H.HORARIO = C.HORARIO) ');
              SQL.Add(' WHERE ');
              SQL.Add(' C.EMPRESA = :EMPRESA AND ');
              SQL.Add(' C.EMPLEADO = :EMPLEADO AND ');
              SQL.Add(' C.FECHA = :FECHA ');
              Params.ByName['EMPRESA'].AsInteger := OpeDMCalenEmpl.xCalendarioEMPRESA.AsInteger;
              Params.ByName['EMPLEADO'].AsInteger := OpeDMCalenEmpl.QMEmpleadoEMPLEADO.AsInteger;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              ExecQuery;

              // Solo si hay datos
              if (FieldByName['LINEA'].AsInteger > 0) then
              begin
                 EDatosFecha.Text := Format('Empleado: %s - [%s] Festivo - [%s] Remunerado', [DateToStr(Fecha), DameMarca(FieldByName['FESTIVO'].AsInteger), DameMarca(FieldByName['EXTRAS_REMUN'].AsInteger)]);

                 if (FieldByName['HORAS_LAB'].AsFloat > 0) then
                    EDatosFecha.Text := EDatosFecha.Text + ' - ' + Format(_('%s Horas Lab.'), [FloatToStr(FieldByName['HORAS_LAB'].AsFloat)]);

                 if (FieldByName['HORARIO'].AsString <> '') then
                 begin
                    if (FieldByName['HORARIO'].AsString <> OpeDMCalenEmpl.xCalendarioHORARIO.AsString) then
                       EDatosFecha.Text := EDatosFecha.Text + ' - ' + Format(_('Horario %s (%s)'), [FieldByName['HORARIO'].AsString, FieldByName['DESCRIPCION'].AsString]);
                 end;

                 if (FieldByName['COMENTARIO'].AsString <> '') then
                    EDatosFecha.Text := EDatosFecha.Text + ' - ' + Format(_('Comentario: %s'), [FieldByName['COMENTARIO'].AsString]);
              end;

              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
  Caption := (Format('Mantenimiento de Calendario de Empleados - x: %d y: %d - cx: %d cy: %d - dia: %d', [x, y, cx, cy, dia_semana]));
end;

procedure TOpeFMCalenEmpl.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TOpeFMCalenEmpl.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbRefresh) then
     OpeDMCalenEmpl.RefrescaCalendario;
end;

end.
