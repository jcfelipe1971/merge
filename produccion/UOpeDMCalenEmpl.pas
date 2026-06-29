unit UOpeDMCalenEmpl;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet,
  YearPlan, FIBQuery, HYFIBQuery, FIBDataSetRO, DateUtils;

type
  TOpeDMCalenEmpl = class(TDataModule)
     TLocal: THYTransaction;
     QMEmpleado: TFIBTableSet;
     DSQMEmpleado: TDataSource;
     QMEmpleadoEMPRESA: TIntegerField;
     QMEmpleadoEMPLEADO: TIntegerField;
     QMEmpleadoTERCERO: TIntegerField;
     QMEmpleadoCALENDARIO: TIntegerField;
     DSxCalendario: TDataSource;
     xCalendario: TFIBDataSetRO;
     xCalendarioEMPRESA: TIntegerField;
     xCalendarioCALENDARIO: TIntegerField;
     xCalendarioDESCRIPCION: TFIBStringField;
     xCalendarioSABADO_FEST: TIntegerField;
     xCalendarioDOMINGO_FEST: TIntegerField;
     xCalendarioHORARIO: TFIBStringField;
     xCalendarioDESC_HORARIO: TFIBStringField;
     xHorasTotales: TFIBDataSetRO;
     DSxHorasTotales: TDataSource;
     xHorasTotalesHORAS_PROD: TFloatField;
     xHorasTotalesHORAS_NO_PROD: TFloatField;
     xHorasTotalesHORAS_LAB: TFloatField;
     QMEmpleadoTITULO: TFIBStringField;
     QMEmpleadoEJERCICIO: TIntegerField;
     QMEmpleadoCANAL: TIntegerField;
     procedure OpeDMCalenEmplCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMEmpleadoAfterOpen(DataSet: TDataSet);
     procedure QMEmpleadoAfterScroll(DataSet: TDataSet);
     procedure DibujaDia(YP: TYearPlanner; dt: TDateTime; cellColor: TColor; Hint: string; Tag: integer);
  private
     { Private declarations }
     procedure RefrescaCalenEmpleado;
     // function BuscamosRazon(Fecha: TDateTime; Calendario, Empleado: integer): string;
  public
     { Public declarations }
     procedure CalculaHorasTotales;
     procedure RefrescaCalendario;
     procedure ActualizaCalendEmpl(Opc: integer; Dia: TDateTime; Razon_Horario: string; HorasTrab: double; Invalidar: boolean = True);
     procedure BusquedaCompleja;
     function ExisteMarcaje(Operario: integer; Fecha: TDateTime): boolean;
     procedure FiltraCalendario(Filtro: string);
     function Festivo(Fecha: TDateTime): boolean;
  end;

var
  OpeDMCalenEmpl : TOpeDMCalenEmpl;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UEntorno, UOpeFMCalenEmpl, UUtiles;

procedure TOpeDMCalenEmpl.OpeDMCalenEmplCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xHorasTotalesHORAS_LAB.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMEmpleado, '11100');
end;

{
function TOpeDMCalenEmpl.BuscamosRazon(Fecha: TDateTime; Calendario, Empleado: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COMENTARIO FROM OPE_CALENDARIO_D WHERE EMPRESA = :EMPRESA AND CALENDARIO = :CALENDARIO AND FECHA = :FECHA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CALENDARIO'].AsInteger := Calendario;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        Result := FieldByName['COMENTARIO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COMENTARIO, HORAS_LAB FROM OPE_EMPLEADO_CAL WHERE EMPRESA = :EMPRESA AND EMPLEADO = :EMPLEADO AND FECHA = :FECHA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := Empleado;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        Result := FieldByName['COMENTARIO'].AsString;
        // Horas := FieldByName['HORAS_LAB'].AsDouble;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;
}

procedure TOpeDMCalenEmpl.ActualizaCalendEmpl(Opc: integer; Dia: TDateTime; Razon_Horario: string; HorasTrab: double; Invalidar: boolean = True);
var
  Existe : boolean;
  // Festivo, ExtrasRemun : integer;
  Linea, FestivoEmpleado, ExtrasRemunEmpleado : integer;
  // ColorDia : TColor;
  Hint : string;
  HorarioEmpleado, ComentarioEmpleado : string;
  HorasLab : double;
begin
  // Opc = 0 -> Día Laboral (Quita marca de festivo)
  // Opc = 1 -> Día Festivo (Pone marca de festivo)
  // Opc = 2 -> Día No remunerado (Quita la marca de remunerado)
  // Opc = 3 -> Día Remunerado (Pone la marca de remunerado)
  // Opc = 4 -> Asignación de horas
  // Opc = 5 -> Cambio de horario
  // Opc = 6 -> Recupera horario del calendario

  // Datos el calenario del empleado
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT LINEA, FESTIVO, EXTRAS_REMUN, HORAS_LAB, HORARIO, COMENTARIO FROM OPE_EMPLEADO_CAL WHERE EMPRESA = :EMPRESA AND EMPLEADO = :EMPLEADO AND FECHA = :FECHA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
        Params.ByName['FECHA'].AsDateTime := Dia;
        ExecQuery;
        Existe := (FieldByName['LINEA'].AsInteger <> 0);
        Linea := FieldByName['LINEA'].AsInteger;
        FestivoEmpleado := FieldByName['FESTIVO'].AsInteger;
        ExtrasRemunEmpleado := FieldByName['EXTRAS_REMUN'].AsInteger;
        HorasLab := FieldByName['HORAS_LAB'].AsFloat;
        HorarioEmpleado := FieldByName['HORARIO'].AsString;
        ComentarioEmpleado := FieldByName['COMENTARIO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (opc <> 6) then
  begin
     if (not Existe) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO OPE_EMPLEADO_CAL ( ');
              SQL.Add(' EMPRESA, EMPLEADO, LINEA, FECHA, HORARIO, EXTRAS_REMUN, FESTIVO, COMENTARIO) ');
              SQL.Add(' VALUES ( ');
              SQL.Add(' :EMPRESA, :EMPLEADO, 0, :FECHA, :HORARIO, ');
              SQL.Add(' COALESCE((SELECT FIRST 1 EXTRAS_REMUN ');
              SQL.Add(' FROM OPE_CALENDARIO_D ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CALENDARIO = :CALENDARIO AND ');
              SQL.Add(' FECHA = :FECHA), 0), ');
              SQL.Add(' COALESCE((SELECT FIRST 1 FESTIVO ');
              SQL.Add(' FROM OPE_CALENDARIO_D ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CALENDARIO = :CALENDARIO AND ');
              SQL.Add(' FECHA = :FECHA), 0), ');
              SQL.Add(' COALESCE((SELECT FIRST 1 COMENTARIO ');
              SQL.Add(' FROM OPE_CALENDARIO_D ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CALENDARIO = :CALENDARIO AND ');
              SQL.Add(' FECHA = :FECHA), '''')) ');
              SQL.Add(' RETURNING LINEA ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
              Params.ByName['CALENDARIO'].AsInteger := QMEmpleadoCALENDARIO.AsInteger;
              Params.ByName['FECHA'].AsDateTime := Dia;
              if (opc = 5) then
                 Params.ByName['HORARIO'].AsString := Razon_Horario
              else
                 Params.ByName['HORARIO'].AsString := xCalendarioHORARIO.AsString;

              // Guardo el horario que haya insertado
              HorarioEmpleado := Params.ByName['HORARIO'].AsString;

              ExecQuery;
              Linea := FieldByName['LINEA'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  Hint := '';

  case Opc of
     0:
     begin
        FestivoEmpleado := 0;
        ComentarioEmpleado := '';
     end;
     1:
     begin
        FestivoEmpleado := 1;
        ComentarioEmpleado := Razon_Horario;
        Hint := Razon_Horario;
     end;
     2: ExtrasRemunEmpleado := 0;
     3: ExtrasRemunEmpleado := 1;
     4:
     begin
        ComentarioEmpleado := Razon_Horario;
        Hint := Razon_Horario;
        HorasLab := HorasTrab;
     end;
     5: HorarioEmpleado := Razon_Horario;
     6: HorarioEmpleado := xCalendarioHORARIO.AsString;
  end;

  if (HorasLab > 0.00000001) then
     Hint := Hint + ' - ' + Format(_('%s horas previstas'), [FloatToStr(HorasLab)]);

  {
  ColorDia := clWhite;
  if (Festivo = 1) then
  begin
     if ((ExtrasRemun = 1) or (ExtrasRemunEmpleado = 1)) then
        ColorDia := clOlive
     else
        ColorDia := clTeal;
  end
  else
  if (FestivoEmpleado = 1) then
  begin
     if ((ExtrasRemun = 1) or (ExtrasRemunEmpleado = 1)) then
        ColorDia := clLime
     else
        ColorDia := clGreen;
  end
  else
  if ((ExtrasRemun = 1) or (ExtrasRemunEmpleado = 1)) then
     ColorDia := clAqua
  else
  if (HorasLab > 0) then
     ColorDia := clYellow;

  if (HorarioEmpleado <> xCalendarioHORARIO.AsString) then
     ColorDia := clMoneyGreen;
   }

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OPE_EMPLEADO_CAL ');
        SQL.Add(' SET ');
        SQL.Add(' HORARIO = :HORARIO, ');
        SQL.Add(' /* INCIDENCIA = _INCIDENCIA, */ ');
        SQL.Add(' HORAS_LAB = :HORAS_LAB, ');
        SQL.Add(' COMENTARIO = :COMENTARIO, ');
        SQL.Add(' FESTIVO = :FESTIVO, ');
        SQL.Add(' EXTRAS_REMUN = :EXTRAS_REMUN ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO AND ');
        SQL.Add(' LINEA = :LINEA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
        Params.ByName['LINEA'].AsInteger := Linea;
        Params.ByName['HORARIO'].AsString := HorarioEmpleado;
        Params.ByName['HORAS_LAB'].AsFloat := HorasLab;
        Params.ByName['COMENTARIO'].AsString := ComentarioEmpleado;
        Params.ByName['FESTIVO'].AsInteger := FestivoEmpleado;
        Params.ByName['EXTRAS_REMUN'].AsInteger := ExtrasRemunEmpleado;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Borro registros que sean iguales al calendario de la empresa o que estan vacios
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM OPE_EMPLEADO_CAL C ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EMPLEADO = :EMPLEADO AND ');
        SQL.Add(' C.FECHA = :FECHA AND ');
        SQL.Add(' C.VACACIONES = 0 AND ');
        SQL.Add(' C.BAJA = 0 AND ');
        // Comparo con el calendario de la empresa
        SQL.Add(' ((C.FESTIVO = (SELECT FESTIVO ');
        SQL.Add('                FROM OPE_CALENDARIO_D ');
        SQL.Add('                WHERE ');
        SQL.Add('                EMPRESA = :EMPRESA AND ');
        SQL.Add('                CALENDARIO = :CALENDARIO AND ');
        SQL.Add('                FECHA = :FECHA) AND ');
        SQL.Add('   C.EXTRAS_REMUN = (SELECT EXTRAS_REMUN ');
        SQL.Add('                     FROM OPE_CALENDARIO_D ');
        SQL.Add('                     WHERE ');
        SQL.Add('                     EMPRESA = :EMPRESA AND ');
        SQL.Add('                     CALENDARIO = :CALENDARIO AND ');
        SQL.Add('                     FECHA = :FECHA) AND ');
        SQL.Add('   C.HORARIO = (SELECT HORARIO ');
        SQL.Add('                FROM OPE_CALENDARIO_D ');
        SQL.Add('                WHERE ');
        SQL.Add('                EMPRESA = :EMPRESA AND ');
        SQL.Add('                CALENDARIO = :CALENDARIO AND ');
        SQL.Add('                FECHA = :FECHA)) ');
        SQL.Add('  OR ');
        // Si no existe calendario de la empresa, borro los "vacios".
        SQL.Add('  (NOT EXISTS(SELECT EMPRESA ');
        SQL.Add('              FROM OPE_CALENDARIO_D ');
        SQL.Add('              WHERE ');
        SQL.Add('              EMPRESA = :EMPRESA AND ');
        SQL.Add('              CALENDARIO = :CALENDARIO AND ');
        SQL.Add('              FECHA = :FECHA) AND ');
        SQL.Add('  (C.FESTIVO = 0) AND ');
        SQL.Add('  (C.EXTRAS_REMUN = 0) AND ');
        SQL.Add('  (C.COMENTARIO = ''''))) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
        Params.ByName['CALENDARIO'].AsInteger := QMEmpleadoCALENDARIO.AsInteger;
        Params.ByName['FECHA'].AsDateTime := Dia;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;


  // DibujaDia(OpeFMCalenEmpl.YPCalendario, Dia, ColorDia, Hint);

  if Invalidar then
     OpeFMCalenEmpl.YPCalendario.Invalidate;

  if Invalidar then
     CalculaHorasTotales;
end;

procedure TOpeDMCalenEmpl.RefrescaCalendario;
var
  Fecha_Ini, Fecha_Fin : TDateTime;
  Color : TColor;
  Hint : string;
begin
  Fecha_Ini := EncodeDate(OpeFMCalenEmpl.YPCalendario.Year, 1, 1);
  Fecha_Fin := EncodeDate(OpeFMCalenEmpl.YPCalendario.Year, 12, 31);

  OpeFMCalenEmpl.InicializacionCalendario;

  // Pinto los dias segun condiciones del calendario
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT FECHA, EXTRAS_REMUN, FESTIVO, HORARIO, COMENTARIO FROM OPE_CALENDARIO_D ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' CALENDARIO = :CALENDARIO AND');
           SelectSQL.Add(' FECHA >= :FECHA_INI AND ');
           SelectSQL.Add(' FECHA <= :FECHA_FIN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CALENDARIO'].AsInteger := QMEmpleadoCALENDARIO.AsInteger;
           Params.ByName['FECHA_INI'].AsDateTime := Fecha_Ini;
           Params.ByName['FECHA_FIN'].AsDateTime := Fecha_Fin;
           Open;
           while (not EOF) do
           begin
              Color := clWhite;
              Hint := FieldByName('COMENTARIO').AsString;

              if (FieldByName('EXTRAS_REMUN').AsInteger = 1) then
                 if (FieldByName('FESTIVO').AsInteger = 1) then
                    Color := clOlive
                 else
                    Color := clAqua
              else
              if (FieldByName('FESTIVO').AsInteger = 1) then
                 Color := clTeal
              else
              if (Trim(FieldByName('HORARIO').AsString) <> '') then
              begin
                 if (FieldByName('HORARIO').AsString <> xCalendarioHORARIO.AsString) then
                    Color := clYellow;
              end;

              DibujaDia(OpeFMCalenEmpl.YPCalendario, FieldByName('FECHA').AsDateTime, Color, Hint, 1);

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

  RefrescaCalenEmpleado;  // Actualizo los datos del empleado

  OpeFMCalenEmpl.YPCalendario.Refresh;

  CalculaHorasTotales;
end;

procedure TOpeDMCalenEmpl.RefrescaCalenEmpleado;
var
  Fecha_Ini, Fecha_Fin : TDateTime;
  // Color : TColor;
  Hint : string;
  CellData : TCellData;
begin
  Fecha_Ini := EncodeDate(OpeFMCalenEmpl.YPCalendario.Year, 1, 1);
  Fecha_Fin := EncodeDate(OpeFMCalenEmpl.YPCalendario.Year, 12, 31);

  // Pinto los dias segun condiciones del calendario
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT FECHA, EXTRAS_REMUN, FESTIVO, HORARIO, HORAS_LAB, HORAS_LAB, COMENTARIO FROM OPE_EMPLEADO_CAL ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' EMPLEADO = :EMPLEADO AND');
           SelectSQL.Add(' FECHA >= :FECHA_INI AND ');
           SelectSQL.Add(' FECHA <= :FECHA_FIN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
           Params.ByName['FECHA_INI'].AsDateTime := Fecha_Ini;
           Params.ByName['FECHA_FIN'].AsDateTime := Fecha_Fin;
           Open;
           while (not EOF) do
           begin
              CellData := OpeFMCalenEmpl.YPCalendario.GetCellData(FieldByName('FECHA').AsDateTime);

              Hint := FieldByName('COMENTARIO').AsString;
              if (Hint > '') then
                 OpeFMCalenEmpl.YPCalendario.SetHintAtDate(FieldByName('FECHA').AsDateTime, Hint, False);

              if (FieldByName('FESTIVO').AsInteger = 1) then
              begin
                 if (FieldByName('EXTRAS_REMUN').AsInteger = 1) then
                    // Color := clLime
                    OpeFMCalenEmpl.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime, clLime, False)
                 else
                    // Color := clGreen;
                    OpeFMCalenEmpl.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime, clGreen, False);
              end
              else
              begin
                 if (FieldByName('EXTRAS_REMUN').AsInteger = 0) then
                    {
                    // Si viene pintado del calendario de la empresa
                    if (CellData.Tag > 0) then
                    }
                    // Color := clWhite
                    OpeFMCalenEmpl.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime, clWhite, False);
              end;

              if (FieldByName('HORAS_LAB').AsFloat > 0.000000001) then
              begin
                 // Color := clBlue;
                 OpeFMCalenEmpl.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime, clBlue, False);

                 if Trim(Hint) <> '' then
                    Hint := Hint + ' - ';
                 Hint := Hint + Trim(FloatToStr(FieldByName('HORAS_LAB').AsFloat)) + ' ' +
                    _('horas previstas');
                 if (Hint > '') then
                    OpeFMCalenEmpl.YPCalendario.SetHintAtDate(FieldByName('FECHA').AsDateTime, Hint, False);
              end;

              if (FieldByName('HORARIO').AsString <> xCalendarioHORARIO.AsString) then
                 // Color := clMoneyGreen;
                 OpeFMCalenEmpl.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime, clMoneyGreen, False);

              OpeFMCalenEmpl.YPCalendario.SetTagAtDate(FieldByName('FECHA').AsDateTime, CellData.Tag + 10, False);

              // DibujaDia(OpeFMCalenEmpl.YPCalendario, FieldByName('FECHA').AsDateTime, Color, Hint);

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

  OpeFMCalenEmpl.YPCalendario.Invalidate;
end;

procedure TOpeDMCalenEmpl.DibujaDia(YP: TYearPlanner; DT: TDateTime; CellColor: TColor; Hint: string; Tag: integer);
begin
  with YP do
  begin
     SetColorAtDate(DT, CellColor, False);
     SetTagAtDate(DT, Tag, False);
     if (Hint > '') then
        SetHintAtDate(DT, Hint, False);
  end;
end;

procedure TOpeDMCalenEmpl.CalculaHorasTotales;
begin
  with xHorasTotales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMEmpleadoEMPRESA.AsInteger;
     Params.ByName['CALENDARIO'].AsInteger := QMEmpleadoCALENDARIO.AsInteger;
     Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := OpeFMCalenEmpl.YPCalendario.Year;
     Params.ByName['DIAS_EJERCICIO'].AsInteger := DaysInAYear(OpeFMCalenEmpl.YPCalendario.Year);
     Open;
  end;
end;

procedure TOpeDMCalenEmpl.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMCalenEmpl.QMEmpleadoAfterOpen(DataSet: TDataSet);
begin
  xCalendario.Open;
end;

procedure TOpeDMCalenEmpl.QMEmpleadoAfterScroll(DataSet: TDataSet);
begin
  RefrescaCalendario;
end;

procedure TOpeDMCalenEmpl.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMEmpleado, '11100');
end;

function TOpeDMCalenEmpl.ExisteMarcaje(Operario: integer; Fecha: TDateTime): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 EMPRESA FROM PRO_CAB_PRESENCIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = ''PRE'' AND ');
        SQL.Add(' OPERARIO = :OPERARIO AND ');
        SQL.Add(' FECHA = :FECHA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['OPERARIO'].AsInteger := operario;
        Params.ByName['FECHA'].AsDateTime := fecha;
        ExecQuery;
        Result := (FieldByName['EMPRESA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TOpeDMCalenEmpl.FiltraCalendario(Filtro: string);
begin
  with QMEmpleado do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_EMPLEADOS_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL ');
     if (Filtro <> '') then
        SelectSQL.Add(' AND (' + filtro + ') ');
     SelectSQL.Add('ORDER BY EMPLEADO');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

function TOpeDMCalenEmpl.Festivo(Fecha: TDateTime): boolean;
begin
  /// Busco si la fecha es festivo en el calendario de la empresa y en el del empleado.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FESTIVO ');
        SQL.Add(' FROM OPE_CALENDARIO_D ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CALENDARIO = :CALENDARIO AND ');
        SQL.Add(' FECHA = :FECHA AND ');
        SQL.Add(' FESTIVO = 1 ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT FESTIVO ');
        SQL.Add(' FROM OPE_EMPLEADO_CAL ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO AND ');
        SQL.Add(' FECHA = :FECHA AND ');
        SQL.Add(' FESTIVO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := QMEmpleadoEMPRESA.AsInteger;
        Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        Result := (FieldByName['FESTIVO'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
