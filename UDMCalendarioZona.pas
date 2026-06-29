unit UDMCalendarioZona;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet,
  YearPlan, FIBQuery, HYFIBQuery, FIBDataSetRO, DateUtils;

type
  TDMCalendarioZona = class(TDataModule)
     TLocal: THYTransaction;
     QMZonas: TFIBTableSet;
     DSQMZonas: TDataSource;
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
     QMZonasZONA: TFIBStringField;
     QMZonasTITULO: TFIBStringField;
     QMZonasDEFECTO: TIntegerField;
     QMZonasCALENDARIO: TIntegerField;
     procedure DMCalendarioZonaCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMZonasAfterOpen(DataSet: TDataSet);
     procedure QMZonasAfterScroll(DataSet: TDataSet);
     procedure DibujaDia(YP: TYearPlanner; dt: TDateTime; cellColor: TColor; Hint: string);
     procedure xCalendarioBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
     procedure RefrescaCalenZona;
  public
     { Public declarations }
     procedure CalculaHorasTotales;
     procedure RefrescaCalendario;
     procedure ActualizaCalendZona(Opc: integer; Dia: TDateTime; Razon_Horario: string);
     procedure BusquedaCompleja;
     procedure FiltraCalendario(Filtro: string);
  end;

var
  DMCalendarioZona : TDMCalendarioZona;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UEntorno, UFMCalendarioZona;

procedure TDMCalendarioZona.ActualizaCalendZona(Opc: integer; Dia: TDateTime; Razon_Horario: string);
var
  Contador, Festivo, ExtrasRemun : integer;
  id_calendario_zona, FestivoZona, ExtrasRemunZona, Reparto : integer;
  ColorDia : TColor;
  Hint : string;
  Horario, HorarioZona, ComentarioZona : string;
begin
  // Opc = 0 -> Día Laboral (Quita marca de festivo)
  // Opc = 1 -> Día Festivo (Pone marca de festivo)
  // Opc = 2 -> Día No remunerado (Quita la marca de remunerado)
  // Opc = 3 -> Día Remunerado (Pone la marca de remunerado)
  // Opc = 5 -> Asignación horario
  // Opc = 7 -> Reparto
  // Opc = 8 -> Sin Reparto (Quita marca reparto)

  // Me aseguro de que exista un registro para la fecha
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CONTADOR, EXTRAS_REMUN, FESTIVO, HORARIO FROM OPE_CALENDARIO_D WHERE EMPRESA = :EMPRESA AND CALENDARIO = :CALENDARIO AND FECHA = :FECHA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CALENDARIO'].AsInteger := xCalendarioCALENDARIO.AsInteger;
        Params.ByName['FECHA'].AsDateTime := Dia;
        ExecQuery;
        Contador := FieldByName['CONTADOR'].AsInteger;
        ExtrasRemun := FieldByName['EXTRAS_REMUN'].AsInteger;
        Festivo := FieldByName['FESTIVO'].AsInteger;
        Horario := FieldByName['HORARIO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Contador = 0) then
  begin
     Contador := DMMain.ContadorGen('OPE_CONTA_CALENDARIO_D');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO OPE_CALENDARIO_D ');
           SQL.Add(' (EMPRESA, CALENDARIO, CONTADOR, FECHA, HORARIO /*,EXTRAS_REMUN,FESTIVO,DOMINGO_AUT,SABADO_AUT,COMENTARIO*/) ');
           SQL.Add(' VALUES ');
           SQL.Add(' (:EMPRESA, :CALENDARIO, :CONTADOR, :FECHA, :HORARIO /*,_EXTRAS_REMUN,_FESTIVO,_DOMINGO_AUT,_SABADO_AUT,_COMENTARIO*/) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CALENDARIO'].AsInteger := xCalendarioCALENDARIO.AsInteger;
           Params.ByName['CONTADOR'].AsInteger := Contador;
           Params.ByName['FECHA'].AsDateTime := Dia;
           Params.ByName['HORARIO'].AsString := xCalendarioHORARIO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Me aseguro de que exista un registro para la fecha en el calenario del empleado

  {
INSERT INTO OPE_CALENDARIO_ZONA
(ID_CALENDARIO_ZONA, EMPRESA, ZONA, CONTADOR_D, FECHA, COMENTARIO, FESTIVO, EXTRAS_REMUN, HORARIO, REPARTO)
VALUES
(:ID_CALENDARIO_ZONA, :EMPRESA, :ZONA, :CONTADOR_D, :FECHA, :COMENTARIO, :FESTIVO, :EXTRAS_REMUN, :HORARIO, :REPARTO)
}
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_CALENDARIO_ZONA, FESTIVO, EXTRAS_REMUN, REPARTO, HORARIO, COMENTARIO FROM OPE_CALENDARIO_ZONA WHERE EMPRESA = :EMPRESA AND ZONA = :ZONA AND FECHA = :FECHA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ZONA'].AsString := QMZonasZONA.AsString;
        Params.ByName['FECHA'].AsDateTime := Dia;
        ExecQuery;
        id_calendario_zona := FieldByName['ID_CALENDARIO_ZONA'].AsInteger;
        FestivoZona := FieldByName['FESTIVO'].AsInteger;
        ExtrasRemunZona := FieldByName['EXTRAS_REMUN'].AsInteger;
        Reparto := FieldByName['REPARTO'].AsInteger;
        HorarioZona := FieldByName['HORARIO'].AsString;
        ComentarioZona := FieldByName['COMENTARIO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (id_calendario_zona = 0) then
  begin
     id_calendario_zona := DMMain.ContadorGen('OPE_CONTA_CALENDARIO_ZONA');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO OPE_CALENDARIO_ZONA ');
           SQL.Add(' (ID_CALENDARIO_ZONA, EMPRESA, ZONA, CONTADOR_D, FECHA, HORARIO /* , COMENTARIO, FESTIVO, EXTRAS_REMUN, REPARTO */) ');
           SQL.Add(' VALUES ');
           SQL.Add(' (:ID_CALENDARIO_ZONA, :EMPRESA, :ZONA, :CONTADOR_D, :FECHA, :HORARIO /* , _COMENTARIO, _FESTIVO, _EXTRAS_REMUN, _REPARTO*/) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ZONA'].AsString := QMZonasZONA.AsString;
           Params.ByName['ID_CALENDARIO_ZONA'].AsInteger := id_calendario_zona;
           Params.ByName['FECHA'].AsDateTime := Dia;
           Params.ByName['HORARIO'].AsString := xCalendarioHORARIO.AsString;
           Params.ByName['CONTADOR_D'].AsInteger := Contador;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Hint := '';

  if (Opc <> 5) then
     HorarioZona := xCalendarioHORARIO.AsString;

  if (Opc = 7) then
     Reparto := 1;

  if (Opc = 8) then
     Reparto := 0;

  case Opc of
     0: FestivoZona := 0;
     1:
     begin
        FestivoZona := 1;
        ComentarioZona := Razon_Horario;
        Hint := Razon_Horario;
     end;
     2: ExtrasRemunZona := 0;
     3: ExtrasRemunZona := 1;
     5: HorarioZona := Razon_Horario;
  end;

  ColorDia := clWhite;
  if (Festivo = 1) then
  begin
     if ((ExtrasRemun = 1) or (ExtrasRemunZona = 1)) then
        ColorDia := clOlive
     else
        ColorDia := clTeal;
  end
  else
  if (FestivoZona = 1) then
  begin
     if ((ExtrasRemun = 1) or (ExtrasRemunZona = 1)) then
        ColorDia := clLime
     else
        ColorDia := clGreen;
  end
  else
  if ((ExtrasRemun = 1) or (ExtrasRemunZona = 1)) then
     ColorDia := clAqua;

  if (Reparto = 1) then
     ColorDia := clFuchsia;

  if (ExtrasRemunZona = 0) and
     (FestivoZona = 0) and
     (Reparto = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM OPE_CALENDARIO_ZONA WHERE ID_CALENDARIO_ZONA = :ID_CALENDARIO_ZONA';
           Params.ByName['ID_CALENDARIO_ZONA'].AsInteger := id_calendario_zona;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OPE_CALENDARIO_ZONA ');
           SQL.Add(' SET ');
           SQL.Add(' HORARIO = :HORARIO, ');
           SQL.Add(' REPARTO = :REPARTO, ');
           SQL.Add(' COMENTARIO = :COMENTARIO, ');
           SQL.Add(' FESTIVO = :FESTIVO, ');
           SQL.Add(' EXTRAS_REMUN = :EXTRAS_REMUN ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_CALENDARIO_ZONA = :ID_CALENDARIO_ZONA ');
           Params.ByName['ID_CALENDARIO_ZONA'].AsInteger := id_calendario_zona;
           Params.ByName['HORARIO'].AsString := HorarioZona;
           Params.ByName['REPARTO'].AsFloat := Reparto;
           Params.ByName['COMENTARIO'].AsString := ComentarioZona;
           Params.ByName['FESTIVO'].AsInteger := FestivoZona;
           Params.ByName['EXTRAS_REMUN'].AsInteger := ExtrasRemunZona;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  DibujaDia(FMCalendarioZona.YPCalendario, Dia, ColorDia, Hint);
  FMCalendarioZona.YPCalendario.Invalidate;

  CalculaHorasTotales;
end;

procedure TDMCalendarioZona.RefrescaCalendario;
var
  Fecha_Ini, Fecha_Fin : TDateTime;
begin
  Fecha_Ini := EncodeDate(FMCalendarioZona.YPCalendario.Year, 1, 1);
  Fecha_Fin := EncodeDate(FMCalendarioZona.YPCalendario.Year, 12, 31);

  // Pinto los dias segun condiciones del calendario
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT * FROM OPE_CALENDARIO_D ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' CALENDARIO = :CALENDARIO AND');
           SelectSQL.Add(' FECHA >= :FECHA_INI AND ');
           SelectSQL.Add(' FECHA <= :FECHA_FIN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CALENDARIO'].AsInteger := QMZonasCALENDARIO.AsInteger;
           Params.ByName['FECHA_INI'].AsDateTime := Fecha_Ini;
           Params.ByName['FECHA_FIN'].AsDateTime := Fecha_Fin;
           Open;
           while (not EOF) do
           begin
              if (FieldByName('EXTRAS_REMUN').AsInteger = 1) then
                 if (FieldByName('FESTIVO').AsInteger = 1) then
                    FMCalendarioZona.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                       clOlive, False)
                 else
                    FMCalendarioZona.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                       clAqua, False)
              else
              if (FieldByName('FESTIVO').AsInteger = 1) then
                 FMCalendarioZona.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                    clTeal, False)
              else
              if (Trim(FieldByName('HORARIO').AsString) <> '') then
              begin
                 if (FieldByName('HORARIO').AsString <> xCalendarioHORARIO.AsString) then
                    FMCalendarioZona.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                       clYellow, False);
              end;

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

  RefrescaCalenZona;  // Actualizo los datos del empleado

  FMCalendarioZona.YPCalendario.Refresh;

  CalculaHorasTotales;
end;

procedure TDMCalendarioZona.RefrescaCalenZona;
var
  Fecha_Ini, Fecha_Fin : TDateTime;
  Color : TColor;
  Hint : string;
begin
  Fecha_Ini := EncodeDate(FMCalendarioZona.YPCalendario.Year, 1, 1);
  Fecha_Fin := EncodeDate(FMCalendarioZona.YPCalendario.Year, 12, 31);

  // Pinto los dias segun condiciones del calendario
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT ID_CALENDARIO_ZONA, FESTIVO, EXTRAS_REMUN, REPARTO, HORARIO, COMENTARIO, FECHA FROM OPE_CALENDARIO_ZONA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' ZONA = :ZONA AND ');
           SelectSQL.Add(' FECHA >= :FECHA_INI AND ');
           SelectSQL.Add(' FECHA <= :FECHA_FIN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ZONA'].AsString := QMZonasZONA.AsString;
           Params.ByName['FECHA_INI'].AsDateTime := Fecha_Ini;
           Params.ByName['FECHA_FIN'].AsDateTime := Fecha_Fin;
           Open;
           while (not EOF) do
           begin
              Color := clWhite;
              Hint := '';

              if (FieldByName('EXTRAS_REMUN').AsInteger = 1) then
              begin
                 if (FieldByName('FESTIVO').AsInteger = 1) then
                    Color := clLime
                 else
                    Color := clAqua;
              end
              else
                 Hint := FieldByName('COMENTARIO').AsString;

              if (FieldByName('FESTIVO').AsInteger = 1) then
                 Color := clGreen;

              if (FieldByName('REPARTO').AsInteger = 1) then
              begin
                 Color := clFuchsia;
                 Hint := _('Reparto') + ' - ' + Hint;
              end;

              DibujaDia(FMCalendarioZona.YPCalendario, FieldByName('FECHA').AsDateTime, Color, Hint);

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

  FMCalendarioZona.YPCalendario.Invalidate;
end;

procedure TDMCalendarioZona.DibujaDia(YP: TYearPlanner; DT: TDateTime; CellColor: TColor; Hint: string);
begin
  with YP do
  begin
     SetColorAtDate(DT, CellColor, False);
     SetHintAtDate(DT, Hint, False);
  end;
end;

procedure TDMCalendarioZona.CalculaHorasTotales;
begin
  (*
  with xHorasTotales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMEmpleadoEMPRESA.AsInteger;
     Params.ByName['CALENDARIO'].AsInteger := QMEmpleadoCALENDARIO.AsInteger;
     Params.ByName['EMPLEADO'].AsInteger := QMEmpleadoEMPLEADO.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := FMCalendarioZona.YPCalendario.Year;
     Params.ByName['DIAS_EJERCICIO'].AsInteger := DaysInAYear(FMCalendarioZona.YPCalendario.Year);
     Open;
  end;
*)
end;

procedure TDMCalendarioZona.DMCalendarioZonaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xHorasTotalesHORAS_LAB.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMZonas, '00000');
end;

procedure TDMCalendarioZona.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCalendarioZona.QMZonasAfterOpen(DataSet: TDataSet);
begin
  xCalendario.Open;
end;

procedure TDMCalendarioZona.QMZonasAfterScroll(DataSet: TDataSet);
begin
  FMCalendarioZona.InicializacionCalendario;
  RefrescaCalendario;
end;

procedure TDMCalendarioZona.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMZonas, '00000');
end;

procedure TDMCalendarioZona.FiltraCalendario(Filtro: string);
begin
  with QMZonas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM SYS_ZONAS ');
     if (Filtro <> '') then
        SelectSQL.Add(' WHERER (' + filtro + ') ');
     SelectSQL.Add('ORDER BY ZONA');
     Open;
  end;
end;

procedure TDMCalendarioZona.xCalendarioBeforeOpen(DataSet: TDataSet);
begin
  xCalendario.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

end.
