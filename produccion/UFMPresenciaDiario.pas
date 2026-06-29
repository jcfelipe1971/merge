unit UFMPresenciaDiario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UTeclas, UControlEdit, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UNavigator, ToolWin, ComCtrls, Buttons,
  ExtCtrls, StdCtrls, DBCtrls, Mask, NsDBGrid, DateUtils,
  rxToolEdit, UFPEdit, ULFDBEdit, ULFPanel, ULFEditFind2000, ULFLabel,
  UHYDescription, ULFHYDBDescription, UEditPanel, ULFToolBar, ULFEdit, ULFDateEdit,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList;

type
  TFMPresenciaDiario = class(TFPEditSinNavegador)
     PEFiltro: TLFPanel;
     LFecha: TLFLabel;
     LFechaHasta: TLFLabel;
     DEFiltroFechaDesde: TLFDateEdit;
     DEFiltroFechaHasta: TLFDateEdit;
     PEMain: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     LCalendario: TLFLabel;
     LTotalTiempo: TLFLabel;
     DescCalendario: TLFDbedit;
     LOperario: TLFLabel;
     LFEOperario: TLFEditFind2000;
     DescOperario: TLFEdit;
     TSep1: TToolButton;
     LHorario: TLFLabel;
     LFEHorario: TLFEditFind2000;
     DescHorario: TLFDbedit;
     PanelTotales: TLFPanel;
     TBNuevo: TToolButton;
     LFEFCalendario: TLFEditFind2000;
     DBTCodigoOperario: TDBText;
     LMarcajeOperario: TLFLabel;
     DBTCodigoCalendario: TDBText;
     LMarcajeCalendario: TLFLabel;
     DBTTituloCalendario: TDBText;
     LMarcajeHorario: TLFLabel;
     DBTCodigoHorario: TDBText;
     DBTTituloHorario: TDBText;
     DBTTituloOprerario: TDBText;
     LIncidencia: TLFLabel;
     LFEIncidencia: TLFEditFind2000;
     DescInc: TLFDbedit;
     LDatosFiltro: TLFLabel;
     LDatosMarcaje: TLFLabel;
     LHora: TLFLabel;
     LTiempoTotal: TLFLabel;
     BMesAnterio: TButton;
     BEjercicio: TButton;
     BMes: TButton;
     BHoy: TButton;
     BMesSiguiente: TButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure LFEOperarioChange(Sender: TObject);
     procedure LFEHorarioChange(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure LFEFCalendarioChange(Sender: TObject);
     procedure TBNuevoClick(Sender: TObject);
     procedure LFEIncidenciaChange(Sender: TObject);
     procedure BMesClick(Sender: TObject);
     procedure BEjercicioClick(Sender: TObject);
     procedure BHoyClick(Sender: TObject);
     procedure BMesAnterioClick(Sender: TObject);
     procedure BMesSiguienteClick(Sender: TObject);
     procedure FiltroChange(Sender: TObject);
  private
     { Private declarations }
     procedure Filtrar;
  public
     { Public declarations }
  end;

var
  FMPresenciaDiario : TFMPresenciaDiario;

implementation

uses UDMMain, UFMain, UFormGest, UEntorno, UDMPresenciaDiario, UUtiles, UdameDato;

{$R *.dfm}

procedure TFMPresenciaDiario.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPresenciaDiario, DMPresenciaDiario);
  DBGFDetalle.DataSource := DMPresenciaDiario.DSQMProDetPre;

  BMes.click;
end;

procedure TFMPresenciaDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPresenciaDiario);
end;

procedure TFMPresenciaDiario.LFEOperarioChange(Sender: TObject);
begin
  DescOperario.Text := DameTituloEmpleado(StrToIntDef(LFEOperario.Text, 0));

  Filtrar;
end;

procedure TFMPresenciaDiario.LFEHorarioChange(Sender: TObject);
begin
  if (Trim(LFEHorario.Text) = '') then
     DescHorario.Clear
  else
  begin
     with DMPresenciaDiario.xHorario do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['HORARIO'].AsString := Trim(LFEHorario.Text);
        Open;
     end;
  end;

  Filtrar;
end;

procedure TFMPresenciaDiario.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMPresenciaDiario.BusquedaCompleja;
end;

procedure TFMPresenciaDiario.LFEFCalendarioChange(Sender: TObject);
begin
  if (Trim(LFEFCalendario.Text) = '') then
     DescCalendario.Clear
  else
  begin
     with DMPresenciaDiario.xCalendario do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CALENDARIO'].AsInteger := StrToIntDef(LFEFCalendario.Text, 0);
        Open;
     end;
  end;

  Filtrar;
end;

procedure TFMPresenciaDiario.TBNuevoClick(Sender: TObject);
begin
  LFEOperario.Clear;
  DescOperario.Clear;
  LFEFCalendario.Clear;
  DescCalendario.Clear;
  LFEHorario.Clear;
  DescHorario.Clear;
  LFEIncidencia.Clear;
  DescInc.Clear;

  BMes.Click;
end;

procedure TFMPresenciaDiario.Filtrar;
var
  TotalMinutos, TotalHoras : word;
  Horas, Minutos, Segundos, DecSeg : word;
begin
  with DMPresenciaDiario.QMProDetPre do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_VER_DIARIO_PRESENCIA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ?TIPO AND ');
     SelectSQL.Add(' FECHA >= ?FECHAD AND ');
     SelectSQL.Add(' FECHA <= ?FECHAH ');

     if (StrToIntDef(LFEOperario.Text, 0) <> 0) then
        SelectSQL.Add(' AND OPERARIO = ?OPERARIO ');
     if (StrToIntDef(LFEFCalendario.Text, 0) <> 0) then
        SelectSQL.Add(' AND CALENDARIO = ?CALENDARIO ');
     if (Trim(LFEHorario.Text) <> '') then
        SelectSQL.Add(' AND HORARIO = ?HORARIO ');
     if (StrToIntDef(LFEIncidencia.Text, 0) <> 0) then
        SelectSQL.Add(' AND ID_INCIDENCIA = ?ID_INCIDENCIA ');

     SelectSQL.Add('ORDER BY FECHA, HORA_ENTRADA');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := 'A'; // REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PRE';
     Params.ByName['FECHAD'].AsDateTime := DEFiltroFechaDesde.Date;
     Params.ByName['FECHAH'].AsDateTime := RecodeTime(DEFiltroFechaHasta.Date, 23, 59, 59, 999);

     if (StrToIntDef(LFEOperario.Text, 0) <> 0) then
        Params.ByName['OPERARIO'].AsInteger := StrToInt(LFEOperario.Text);
     if (StrToIntDef(LFEFCalendario.Text, 0) <> 0) then
        Params.ByName['CALENDARIO'].AsInteger := StrToInt(LFEFCalendario.Text);
     if (Trim(LFEHorario.Text) <> '') then
        Params.ByName['HORARIO'].AsString := Trim(LFEHorario.Text);
     if (StrToIntDef(LFEIncidencia.Text, 0) <> 0) then
        Params.ByName['ID_INCIDENCIA'].AsInteger := StrToInt(LFEIncidencia.Text);

     Open;
  end;

  // Sumas totales
  with DMPresenciaDiario.QMProDetPreTiempos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT TIEMPO FROM PRO_VER_DIARIO_PRESENCIA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' TIPO = ?TIPO AND ');
     SelectSQL.Add(' FECHA >= ?FECHAD AND ');
     SelectSQL.Add(' FECHA <= ?FECHAH ');

     if (StrToIntDef(LFEOperario.Text, 0) <> 0) then
        SelectSQL.Add(' AND OPERARIO = ?OPERARIO ');
     if (StrToIntDef(LFEFCalendario.Text, 0) <> 0) then
        SelectSQL.Add(' AND CALENDARIO = ?CALENDARIO ');
     if (Trim(LFEHorario.Text) <> '') then
        SelectSQL.Add(' AND HORARIO = ?HORARIO');
     if (StrToIntDef(LFEIncidencia.Text, 0) <> 0) then
        SelectSQL.Add(' AND ID_INCIDENCIA = ?ID_INCIDENCIA ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := 'A'; // REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PRE';
     Params.ByName['FECHAD'].AsDateTime := DEFiltroFechaDesde.Date;
     Params.ByName['FECHAH'].AsDateTime := DEFiltroFechaHasta.Date + 0.999999;

     if (StrToIntDef(LFEOperario.Text, 0) <> 0) then
        Params.ByName['OPERARIO'].AsInteger := StrToInt(LFEOperario.Text);
     if (StrToIntDef(LFEFCalendario.Text, 0) <> 0) then
        Params.ByName['CALENDARIO'].AsInteger := StrToInt(LFEFCalendario.Text);
     if (Trim(LFEHorario.Text) <> '') then
        if (Trim(LFEHorario.Text) <> '') then
           Params.ByName['HORARIO'].AsString := Trim(LFEHorario.Text);
     if (StrToIntDef(LFEIncidencia.Text, 0) <> 0) then
        Params.ByName['ID_INCIDENCIA'].AsInteger := StrToInt(LFEIncidencia.Text);

     Open;
     TotalMinutos := 0;
     TotalHoras := 0;

     while (not EOF) do
     begin
        DecodeTime(FieldByName('TIEMPO').AsDateTime, Horas, Minutos, Segundos, DecSeg);

        TotalMinutos := TotalMinutos + Minutos;
        TotalHoras := TotalHoras + Horas;

        Next;
     end;
  end;

  Horas := TotalMinutos div 60;
  TotalHoras := TotalHoras + Horas;
  TotalMinutos := TotalMinutos - Horas * 60;
  LTiempoTotal.Caption := IntToStr(TotalHoras) + ':' + IntToStr(TotalMinutos);
end;

procedure TFMPresenciaDiario.LFEIncidenciaChange(Sender: TObject);
begin
  if (Trim(LFEIncidencia.Text) = '') then
     DescInc.Clear
  else
  begin
     DMPresenciaDiario.xIncidencia.Close;
     DMPresenciaDiario.xIncidencia.Params.ByName['ID_INCIDENCIA'].AsInteger := StrToIntDef(LFEIncidencia.Text, 0);
     DMPresenciaDiario.xIncidencia.Open;
  end;

  Filtrar;
end;

procedure TFMPresenciaDiario.BMesClick(Sender: TObject);
begin
  inherited;
  DEFiltroFechaDesde.Date := EncodeDate(YearOf(Today), MonthOf(Today), 1);
  DEFiltroFechaHasta.Date := EncodeDate(YearOf(Today), MonthOf(Today), DaysInMonth(Today));

  Filtrar;
end;

procedure TFMPresenciaDiario.BEjercicioClick(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;
  DameMinMax('EJE', Min, Max);
  DEFiltroFechaDesde.Date := Min;
  DEFiltroFechaHasta.Date := Max;

  Filtrar;
end;

procedure TFMPresenciaDiario.BHoyClick(Sender: TObject);
begin
  inherited;
  DEFiltroFechaDesde.Date := Today;
  DEFiltroFechaHasta.Date := Today;

  Filtrar;
end;

procedure TFMPresenciaDiario.BMesAnterioClick(Sender: TObject);
begin
  inherited;
  DEFiltroFechaDesde.Date := IncMonth(DEFiltroFechaDesde.Date, -1);

  // Codigo para mantener el ultimo dia del mes
  if DaysInMonth(DEFiltroFechaHasta.Date) = DayOf(DEFiltroFechaHasta.Date) then
  begin
     DEFiltroFechaHasta.Date := IncMonth(DEFiltroFechaHasta.Date, -1);
     DEFiltroFechaHasta.Date := RecodeDay(DEFiltroFechaHasta.Date, DaysInMonth(DEFiltroFechaHasta.Date));
  end
  else
     DEFiltroFechaHasta.Date := IncMonth(DEFiltroFechaHasta.Date, -1);

  Filtrar;
end;

procedure TFMPresenciaDiario.BMesSiguienteClick(Sender: TObject);
begin
  inherited;
  DEFiltroFechaDesde.Date := IncMonth(DEFiltroFechaDesde.Date, 1);

  // Codigo para mantener el ultimo dia del mes
  if DaysInMonth(DEFiltroFechaHasta.Date) = DayOf(DEFiltroFechaHasta.Date) then
  begin
     DEFiltroFechaHasta.Date := IncMonth(DEFiltroFechaHasta.Date, 1);
     DEFiltroFechaHasta.Date := RecodeDay(DEFiltroFechaHasta.Date, DaysInMonth(DEFiltroFechaHasta.Date));
  end
  else
     DEFiltroFechaHasta.Date := IncMonth(DEFiltroFechaHasta.Date, 1);

  Filtrar;
end;

procedure TFMPresenciaDiario.FiltroChange(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

end.
