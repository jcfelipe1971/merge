unit UFMCalendarioZona;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Yearplan, ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ActnList, rxPlacemnt, NsDBGrid, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel,
  ULFEdit, TFlatCheckBoxUnit, ULFCheckBox;

var
  HorasTrab : double;
  Razon : string;
  PregHoras : smallint;

type
  TFMCalendarioZona = class(TFPEdit)
     YPCalendario: TYearPlanner;
     LZona: TLFLabel;
     LCalendario: TLFLabel;
     GBLeyenda: TGroupBox;
     Shape1: TShape;
     LFest_Rem: TLFLabel;
     Shape2: TShape;
     LFestivo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBECalenDesc: TLFDbedit;
     DBEZona: TLFDbedit;
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
     Horario1: TMenuItem;
     AHorario: TAction;
     LHoraLaborable: TLFLabel;
     DBEHoras: TLFDbedit;
     MISeleccion: TMenuItem;
     PNLHorarioDet: TLFPanel;
     EComentario: TLFEdit;
     EDatosFecha: TLFEdit;
     MIReparto: TMenuItem;
     AReparto: TAction;
     ASinReparto: TAction;
     MISinReparto: TMenuItem;
     PNLIgnorar: TLFPanel;
     LIgnorar: TLFLabel;
     CBIgnorarSabado: TLFCheckBox;
     CBIgnorarDomingo: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure YPCalendarioYearChange(Sender: TObject);
     procedure Accion(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure YPCalendarioYearChanged(Sender: TObject);
     procedure YPCalendarioMouseRightClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
     procedure YPCalendarioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InicializacionCalendario;
     procedure FiltraCalendario(Filtro: string);
  end;

var
  FMCalendarioZona : TFMCalendarioZona;

implementation

uses UFormGest, UDMMain, UEntorno,
  UOpeFMRazonCalenEmpr, UDMCalendarioZona,
  UOpeFMHorarioCalenEmpr, UFMain, UOpeDMEmpleados, {FIBQuery,} HYFIBQuery, DateUtils;

{$R *.DFM}

procedure TFMCalendarioZona.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCalendarioZona, DMCalendarioZona);

  NavMain.DataSource := DMCalendarioZona.DSQMZonas;
  EPMain.DataSource := DMCalendarioZona.DSQMZonas;
  DBGMain.DataSource := DMCalendarioZona.DSQMZonas;

  YPCalendario.Year := REntorno.Ejercicio;
end;

procedure TFMCalendarioZona.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCalendarioZona);
end;

procedure TFMCalendarioZona.InicializacionCalendario;
begin
  YPCalendario.ClearCells;
end;

procedure TFMCalendarioZona.YPCalendarioYearChange(Sender: TObject);
begin
  inherited;
  InicializacionCalendario;
end;

procedure TFMCalendarioZona.Accion(Sender: TObject);
var
  Dia, FechaIni, FechaFin : TDateTime;
  Opc : integer;
  Razon_Horario : string;
  Modifica : boolean;
begin
  inherited;
  // Opc = 0 -> Día Laboral (Quita marca de festivo)
  // Opc = 1 -> Día Festivo (Pone marca de festivo)
  // Opc = 2 -> Día No remunerado (Quita la marca de remunerado)
  // Opc = 3 -> Día Remunerado (Pone la marca de remunerado)
  // Opc = 4 -> Asignación de horas
  // Opc = 5 -> Cambio Horario
  // Opc = 7 -> Reparto
  // Opc = 8 -> Sin Reparto (Quita marca reparto)

  Modifica := True;
  Opc := TMenuItem(Sender).Tag;

  if (Opc = 1) then
     Modifica := UOpeFMRazonCalenEmpr.RellenaRazon(Razon_Horario);

  if (Opc = 5) then
     Modifica := UOpeFMHorarioCalenEmpr.RellenaHorario(Razon_Horario);

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
              if YPCalendario.IsSelected(Dia) then // Actualizar el calendario del empleado
                 DMCalendarioZona.ActualizaCalendZona(Opc, Dia, Razon_Horario);

           Dia := IncDay(Dia);
        end;
     finally
        YPCalendario.Show;
     end;
  end;
end;

procedure TFMCalendarioZona.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCalendarioZona.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCalendarioZona.FiltraCalendario(Filtro: string);
begin
  DMCalendarioZona.FiltraCalendario(Filtro);
end;

procedure TFMCalendarioZona.YPCalendarioYearChanged(Sender: TObject);
begin
  inherited;
  DMCalendarioZona.RefrescaCalendario;
end;

procedure TFMCalendarioZona.YPCalendarioMouseRightClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
begin
  inherited;
  if (StartDate = EndDate) then
     MISeleccion.Caption := Format(_('Seleccion: %s'), [DateToStr(StartDate)])
  else
     MISeleccion.Caption := Format(_('Seleccion: %s - %s'), [DateToStr(StartDate), DateToStr(EndDate)]);
end;

procedure TFMCalendarioZona.YPCalendarioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  Fecha : TDateTime;

  function DameMarca(Valor: integer): string;
  begin
     Result := '_';
     if (Valor = 1) then
        Result := 'X';
  end;

begin
  inherited;
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
           SQL.Add(' SELECT D.FECHA, D.COMENTARIO, D.HORARIO, H.DESCRIPCION, D.FESTIVO, D.EXTRAS_REMUN ');
           SQL.Add(' FROM OPE_CALENDARIO_D D ');
           SQL.Add(' JOIN OPE_HORARIOS H ON ');
           SQL.Add(' (H.EMPRESA = D.EMPRESA AND H.HORARIO = D.HORARIO) ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.CALENDARIO = :CALENDARIO AND ');
           SQL.Add(' D.FECHA = :FECHA ');
           Params.ByName['EMPRESA'].AsInteger := DMCalendarioZona.xCalendarioEMPRESA.AsInteger;
           Params.ByName['CALENDARIO'].AsInteger := DMCalendarioZona.xCalendarioCALENDARIO.AsInteger;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;

           EComentario.Text := Format('%s - [%s] Festivo - [%s] Laborable', [DateToStr(Fecha), DameMarca(FieldByName['FESTIVO'].AsInteger), DameMarca(FieldByName['EXTRAS_REMUN'].AsInteger)]);

           if (FieldByName['HORARIO'].AsString <> '') then
           begin
              if (FieldByName['HORARIO'].AsString <> DMCalendarioZona.xCalendarioHORARIO.AsString) then
                 EComentario.Text := EComentario.Text + Format(_(' - Horario %s (%s)'), [FieldByName['HORARIO'].AsString, FieldByName['DESCRIPCION'].AsString]);
           end;

           if (FieldByName['COMENTARIO'].AsString <> '') then
           begin
              if (EComentario.Text > '') then
                 EComentario.Text := EComentario.Text + ', ';
              EComentario.Text := EComentario.Text + Format(_('Comentario: %s'), [FieldByName['COMENTARIO'].AsString]);
           end;

           FreeHandle;
        finally
           Free;
        end;
     end;

     // Especifico de la zona
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT Z.ID_CALENDARIO_ZONA, Z.FESTIVO, Z.EXTRAS_REMUN, Z.REPARTO, Z.HORARIO, Z.COMENTARIO, H.DESCRIPCION ');
           SQL.Add(' FROM OPE_CALENDARIO_ZONA Z ');
           SQL.Add(' JOIN OPE_HORARIOS H ON ');
           SQL.Add(' (H.EMPRESA = Z.EMPRESA AND H.HORARIO = Z.HORARIO) ');
           SQL.Add(' WHERE ');
           SQL.Add(' Z.EMPRESA = :EMPRESA AND ');
           SQL.Add(' Z.ZONA = :ZONA AND ');
           SQL.Add(' Z.FECHA = :FECHA ');
           Params.ByName['EMPRESA'].AsInteger := DMCalendarioZona.xCalendarioEMPRESA.AsInteger;
           Params.ByName['ZONA'].AsString := DMCalendarioZona.QMZonasZONA.AsString;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;

           EDatosFecha.Text := Format('%s - [%s] Reparto - [%s] Festivo - [%s] Laborable', [DateToStr(Fecha), DameMarca(FieldByName['REPARTO'].AsInteger), DameMarca(FieldByName['FESTIVO'].AsInteger), DameMarca(FieldByName['EXTRAS_REMUN'].AsInteger)]);

           if (Trim(FieldByName['HORARIO'].AsString) <> '') then
           begin
              if (FieldByName['HORARIO'].AsString <> DMCalendarioZona.xCalendarioHORARIO.AsString) then
                 EDatosFecha.Text := EDatosFecha.Text + Format(_(' - Horario %s (%s)'), [FieldByName['HORARIO'].AsString, FieldByName['DESCRIPCION'].AsString]);
           end;

           if (FieldByName['COMENTARIO'].AsString <> '') then
           begin
              if (EComentario.Text > '') then
                 EDatosFecha.Text := EDatosFecha.Text + ', ';
              EDatosFecha.Text := EDatosFecha.Text + Format(_('Comentario: %s'), [FieldByName['COMENTARIO'].AsString]);
           end;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
