unit UOpeFMCalendario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, Yearplan, StdCtrls, Mask,
  DBCtrls, ActnList, NsDBGrid, rxPlacemnt, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBCheckBox, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, UHYDescription,
  ULFHYDBDescription, ULFEdit, UG2kTBLoc, ULFLabel;

type
  TOpeFMCalendario = class(TFPEdit)
     LCalendario: TLFLabel;
     DBECalendario: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     PTCalendario: TPopUpTeclas;
     MarcarFestivo1: TMenuItem;
     ALCalendario: TActionList;
     AFestivo: TAction;
     ALaboral: TAction;
     GBLeyenda: TGroupBox;
     Shape1: TShape;
     LFest_Renum: TLFLabel;
     Shape2: TShape;
     LFestivo: TLFLabel;
     Laboral1: TMenuItem;
     YPCalendario: TYearPlanner;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     ASabadoFest: TAction;
     ADomingoFest: TAction;
     PTDiaSemanaFiest: TPopUpTeclas;
     Domingos1: TMenuItem;
     SabadosFestivos1: TMenuItem;
     DomingosFestivos1: TMenuItem;
     SabadosFestivos2: TMenuItem;
     ASabadoNoFest: TAction;
     ADomingoNoFest: TAction;
     Desmarcar1: TMenuItem;
     Desmarcar2: TMenuItem;
     Shape3: TShape;
     LRemunerada: TLFLabel;
     NoRemunerado1: TMenuItem;
     ANoRemun: TAction;
     ARemunerado: TAction;
     Remunerado1: TMenuItem;
     DBCSabados: TLFDBCheckBox;
     DBCDomingos: TLFDBCheckBox;
     AMarcarFestivo: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AMarcarLaboral: TAction;
     AMarcarRenumerado: TAction;
     AMarcarNoRenumerado: TAction;
     DBEFHorario: TLFDBEditFind2000;
     LHorario: TLFLabel;
     N1: TMenuItem;
     Horario1: TMenuItem;
     AHorario: TAction;
     DescHorario: TLFHYDBDescription;
     PNLHorarioDet: TLFPanel;
     DBEHoras: TLFDbedit;
     LTotalHorasLaborables: TLFLabel;
     ASep: TAction;
     ACambiarHorario: TAction;
     Shape4: TShape;
     LOtroHorario: TLFLabel;
     EComentario: TLFEdit;
     MISeleccion: TMenuItem;
     EDatosFecha: TLFEdit;
     PNLIgnorar: TLFPanel;
     LIgnorar: TLFLabel;
     CBIgnorarSabado: TLFCheckBox;
     CBIgnorarDomingo: TLFCheckBox;
     CBIgnorarFestivo: TLFCheckBox;
     N2: TMenuItem;
     N3: TMenuItem;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure YPCalendarioYearChange(Sender: TObject);
     procedure DiasEspeciales(Sender: TObject);
     procedure DiaSemanaFiesta(Sender: TObject);
     procedure DBEFHorarioChange(Sender: TObject);
     procedure YPCalendarioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure YPCalendarioYearChanged(Sender: TObject);
     procedure YPCalendarioMouseRightClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InicializacionCalendario;
     procedure FiltraCalendario(Filtro: string);
  end;

var
  OpeFMCalendario : TOpeFMCalendario;

implementation

uses UOpeDMCalendario, UFormGest, UDMMain, UEntorno, UOpeFMRazonCalenEmpr,
  UOpeFMHorarioCalenEmpr, HYFIBQuery, DateUtils;

{$R *.DFM}

//clWhite  --> Laboral / Remunerado
//clAqua   --> No remunerado
//clOlive  --> Festivo / No remunerado
//clTeal   --> Festivo
//clinfobk --> Dia seleccionado
procedure TOpeFMCalendario.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMCalendario, OpeDMCalendario);
  YPCalendario.Year := REntorno.Ejercicio;
  NavMain.DataSource := OpeDMCalendario.DSQMCalendario;
  EPMain.DataSource := OpeDMCalendario.DSQMCalendario;
  DBGMain.DataSource := OpeDMCalendario.DSQMCalendario;
end;

procedure TOpeFMCalendario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMCalendario);
end;

procedure TOpeFMCalendario.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMCalendario.BusquedaCompleja;
  Continua := False;
end;

procedure TOpeFMCalendario.InicializacionCalendario;
begin
  YPCalendario.ClearCells;
end;

procedure TOpeFMCalendario.YPCalendarioYearChange(Sender: TObject);
begin
  inherited;
  { TODO : Esto deberia tener en cuenta ejercicios partidos. }
  {
  if (YPCalendario.Year <> REntorno.Ejercicio) then
  begin
     MarcarFestivo1.Enabled := False;
     Laboral1.Enabled := False;
     NoRemunerado1.Enabled := False;
     Remunerado1.Enabled := False;
     Horario1.Enabled := False;
     Domingos1.Enabled := False;
     SabadosFestivos1.Enabled := False;
  end
  else
  begin
     MarcarFestivo1.Enabled := True;
     Laboral1.Enabled := True;
     NoRemunerado1.Enabled := True;
     Remunerado1.Enabled := True;
     Horario1.Enabled := True;
     Domingos1.Enabled := True;
     SabadosFestivos1.Enabled := True;
  end;
  }

  InicializacionCalendario;
end;

procedure TOpeFMCalendario.DiasEspeciales(Sender: TObject);
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
  // Opc = 4 -> Horario Especial

  Modifica := True;
  Opc := TMenuItem(Sender).Tag;

  if (Opc = 1) then
     Modifica := UOpeFMRazonCalenEmpr.RellenaRazon(Razon_Horario);

  if (Opc = 4) then
     Modifica := UOpeFMHorarioCalenEmpr.RellenaHorario(Razon_Horario);

  if (Modifica) then
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
              if not (CBIgnorarFestivo.Checked and OpeDMCalendario.Festivo(Dia)) then
                 if YPCalendario.IsSelected(Dia) then  // Insertar en la base de datos los dias especiales
                    OpeDMCalendario.InsertarDiasEspeciales(Opc, Dia, Razon_Horario);

           Dia := IncDay(Dia);
        end;
     finally
        YPCalendario.Show;
     end;
  end;
end;

procedure TOpeFMCalendario.DiaSemanaFiesta(Sender: TObject);
var
  Razon : string;
begin
  inherited;
  // TAction(Sender).Tag --> Contiene el dia de la semana fiesta
  // 1 = Domingo // 2 = Lunes // ... // 7 = Sabado --> Marcar como festivo
  // 11 = Domingo // 12 = Lunes // ... // 17 = Sabado --> Marcar como no festivo
  Razon := '';
  if (TAction(Sender).Tag < 10) then
  begin
     if (UOpeFMRazonCalenEmpr.RellenaRazon(Razon)) then
        OpeDMCalendario.MarcaDesmarcaDiaSemana(1, TAction(Sender).Tag, Razon);
  end
  else
     OpeDMCalendario.MarcaDesmarcaDiaSemana(0, TAction(Sender).Tag - 10, '');

  OpeDMCalendario.RefrescaCalendario;
end;

procedure TOpeFMCalendario.DBEFHorarioChange(Sender: TObject);
begin
  inherited;
  DescHorario.ActualizaDatos('HORARIO', DBEFHorario.Text);
end;

procedure TOpeFMCalendario.YPCalendarioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
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
           Params.ByName['EMPRESA'].AsInteger := OpeDMCalendario.QMCalendarioEMPRESA.AsInteger;
           Params.ByName['CALENDARIO'].AsInteger := OpeDMCalendario.QMCalendarioCALENDARIO.AsInteger;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;
           if (FieldByName['HORARIO'].AsString <> '') then
           begin
              if (FieldByName['HORARIO'].AsString <> OpeDMCalendario.QMCalendarioHORARIO.AsString) then
                 EComentario.Text := Format(_('Horario %s (%s)'), [FieldByName['HORARIO'].AsString, FieldByName['DESCRIPCION'].AsString]);
           end;

           if (FieldByName['COMENTARIO'].AsString <> '') then
           begin
              if (EComentario.Text > '') then
                 EComentario.Text := EComentario.Text + ' - ';
              EComentario.Text := EComentario.Text + Format(_('Comentario: %s'), [FieldByName['COMENTARIO'].AsString]);
           end;

           EDatosFecha.Text := Format('%s - [%s] Festivo - [%s] Remunerado', [DateToStr(Fecha), DameMarca(FieldByName['FESTIVO'].AsInteger), DameMarca(FieldByName['EXTRAS_REMUN'].AsInteger)]);

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TOpeFMCalendario.FiltraCalendario(Filtro: string);
begin
  OpeDMCalendario.FiltraCalendario(Filtro);
end;

procedure TOpeFMCalendario.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TOpeFMCalendario.YPCalendarioYearChanged(Sender: TObject);
begin
  inherited;
  OpeDMCalendario.RefrescaCalendario;
  // YPCalendario.Refresh;
end;

procedure TOpeFMCalendario.YPCalendarioMouseRightClick(StDays, EnDays, StMonth, EnMonth: integer; StartDate, EndDate: TDateTime);
begin
  inherited;
  if (StartDate = EndDate) then
     MISeleccion.Caption := Format(_('Seleccion: %s'), [DateToStr(StartDate)])
  else
     MISeleccion.Caption := Format(_('Seleccion: %s - %s'), [DateToStr(StartDate), DateToStr(EndDate)]);
end;

end.
