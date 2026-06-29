unit UOpeDMCalendario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSetRO, DateUtils;

type
  TOpeDMCalendario = class(TDataModule)
     QMCalendario: TFIBTableSet;
     DSQMCalendario: TDataSource;
     TLocal: THYTransaction;
     QMCalendarioEMPRESA: TIntegerField;
     QMCalendarioCALENDARIO: TIntegerField;
     QMCalendarioDESCRIPCION: TFIBStringField;
     QMCalendarioSABADO_FEST: TIntegerField;
     QMCalendarioDOMINGO_FEST: TIntegerField;
     QMCalendarioHORARIO: TFIBStringField;
     xHorasTotales: TFIBDataSetRO;
     xHorasTotalesHORAS_PROD: TFloatField;
     xHorasTotalesHORAS_NO_PROD: TFloatField;
     xHorasTotalesHORAS_LAB: TFloatField;
     DSxHorasTotales: TDataSource;
     procedure OpeDMCalendarioCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCalendarioNewRecord(DataSet: TDataSet);
     procedure QMCalendarioBeforePost(DataSet: TDataSet);
     procedure QMCalendarioAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CalculaHorasTotales;
     procedure BusquedaCompleja;
     procedure RefrescaCalendario;
     procedure MarcaDesmarcaDiaSemana(Marcar, Dia: integer; Razon: string);
     procedure InsertarDiasEspeciales(Opc: integer; Dia: TDateTime; Razon: string);
     procedure FiltraCalendario(Filtro: string);
     function Festivo(Fecha: TDateTime): boolean;
  end;

var
  OpeDMCalendario : TOpeDMCalendario;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UEntorno, UOpeFMCalendario, HYFIBQuery;

procedure TOpeDMCalendario.OpeDMCalendarioCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMCalendario, '10000');
  // DMMain.FiltraTabla(QMCalendario_Dias, '10000');

  xHorasTotalesHORAS_LAB.DisplayFormat := MascaraN;
end;

// Marcar = 1  --> Marcamos el dia de la semana de todos los mese como festivos
// Marcar = 0  --> Eliminamos el dia de la semana de todos los mese como festivos
// Dia = Fecha --> Dia a inserta o a eliminar.
procedure TOpeDMCalendario.MarcaDesmarcaDiaSemana(Marcar, Dia: integer; Razon: string);
var
  n : integer;
  FechaIni, FechaFin : integer;
begin
  FechaIni := Round(EncodeDate(OpeFMCalendario.YPCalendario.Year, 1, 1));
  FechaFin := Round(EncodeDate(OpeFMCalendario.YPCalendario.Year, 12, 31));
  for n := FechaIni to FechaFin do
     if DayOfWeek(n) = Dia then  //Insertamos o eliminamos en la base de datos
        InsertarDiasEspeciales(Marcar, n, Razon);
end;

procedure TOpeDMCalendario.RefrescaCalendario;
var
  Fecha_Ini, Fecha_Fin : TDateTime;
begin
  Fecha_Ini := EncodeDate(OpeFMCalendario.YPCalendario.Year, 1, 1);
  Fecha_Fin := EncodeDate(OpeFMCalendario.YPCalendario.Year, 12, 31);

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
           Params.ByName['CALENDARIO'].AsInteger := QMCalendarioCALENDARIO.AsInteger;
           Params.ByName['FECHA_INI'].AsDateTime := Fecha_Ini;
           Params.ByName['FECHA_FIN'].AsDateTime := Fecha_Fin;
           Open;
           while (not EOF) do
           begin
              if (FieldByName('EXTRAS_REMUN').AsInteger = 1) then
                 if (FieldByName('FESTIVO').AsInteger = 1) then
                    OpeFMCalendario.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                       clOlive, False)
                 else
                    OpeFMCalendario.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                       clAqua, False)
              else
              if (FieldByName('FESTIVO').AsInteger = 1) then
                 OpeFMCalendario.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                    clTeal, False)
              else
              if (FieldByName('HORARIO').AsString <> QMCalendarioHORARIO.AsString) then
                 OpeFMCalendario.YPCalendario.SetColorAtDate(FieldByName('FECHA').AsDateTime,
                    clYellow, False);

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

  CalculaHorasTotales;
end;

// Opc = 0 -> Día Laboral (Quita marca de festivo)
// Opc = 1 -> Día Festivo (Pone marca de festivo)
// Opc = 2 -> Día No remunerado (Quita marca de remunerado)
// Opc = 3 -> Día Remunerado (Pone marca de remunerado)
// Opc = 4 -> Horario Especial (Ponemos horario especial del dia)

//Dia = Fecha --> Dia a inserta o a eliminar.
procedure TOpeDMCalendario.InsertarDiasEspeciales(Opc: integer; Dia: TDateTime; Razon: string);
var
  Contador, DiaSem, ExtrasRemun, Festivo : integer;
  Horario : string;
begin
  // Me aseguro de que exista un registro para la fecha
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CONTADOR, EXTRAS_REMUN, FESTIVO, HORARIO FROM OPE_CALENDARIO_D WHERE EMPRESA = :EMPRESA AND CALENDARIO = :CALENDARIO AND FECHA = :FECHA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CALENDARIO'].AsInteger := QMCalendarioCALENDARIO.AsInteger;
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
           Params.ByName['CALENDARIO'].AsInteger := QMCalendarioCALENDARIO.AsInteger;
           Params.ByName['CONTADOR'].AsInteger := Contador;
           Params.ByName['FECHA'].AsDateTime := Dia;
           Params.ByName['HORARIO'].AsString := QMCalendarioHORARIO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ((Opc = 0) and (ExtrasRemun = 0) and (Contador > 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM OPE_CALENDARIO_D WHERE CONTADOR = :CONTADOR ';
           Params.ByName['CONTADOR'].AsInteger := Contador;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     DiaSem := DayOfWeek(Dia);

     if (DiaSem <> 1) and (DiaSem <> 7) then
        OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clWhite, True)
     else
        OpeFMCalendario.YPCalendario.SetColorAtDate(Dia,
           OpeFMCalendario.YPCalendario.WeekendColor, True);
  end
  else
  if ((Opc = 2) and (Festivo = 0)) then
  begin
     // Borrar Registro
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM OPE_CALENDARIO_D WHERE CONTADOR = :CONTADOR ';
           Params.ByName['CONTADOR'].AsInteger := Contador;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     DiaSem := DayOfWeek(Dia);

     if (DiaSem <> 1) and (DiaSem <> 7) then
        OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clWhite, True)
     else
        OpeFMCalendario.YPCalendario.SetColorAtDate(Dia,
           OpeFMCalendario.YPCalendario.WeekendColor, True);
  end
  else
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OPE_CALENDARIO_D ');
           SQL.Add(' SET ');
           SQL.Add(' EMPRESA = :EMPRESA ');

           if (Opc = 4) then
           begin
              SQL.Add(Format(' ,HORARIO = ''%s'' ', [Razon]));
              SQL.Add(' ,COMENTARIO = '''' ');
           end
           else
           begin
              SQL.Add(Format(' ,HORARIO = ''%s'' ', [QMCalendarioHORARIO.AsString]));
              SQL.Add(Format(' ,COMENTARIO = ''%s'' ', [Razon]));
           end;

           case Opc of
              0:
              begin
                 SQL.Add(' ,FESTIVO = 0 ');
                 OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clAqua, True);
              end;
              1:
              begin
                 SQL.Add(' ,FESTIVO = 1 ');
                 if (ExtrasRemun = 1) then
                    OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clOlive, True)
                 else
                    OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clTeal, True);
              end;
              2:
              begin
                 if (Festivo <> 0) then
                 begin
                    SQL.Add(' ,EXTRAS_REMUN = 0 ');
                    OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clTeal, True);
                 end;
              end;
              3:
              begin
                 SQL.Add(' ,EXTRAS_REMUN = 1 ');
                 if (Festivo = 1) then
                    OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clOlive, True)
                 else
                    OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clAqua, True);
              end;
              4:
              begin
                 if (QMCalendarioHORARIO.AsString <> Horario) then
                    OpeFMCalendario.YPCalendario.SetColorAtDate(Dia, clYellow, True);
              end;
           end;
           SQL.Add(' WHERE ');
           SQL.Add(' CONTADOR = :CONTADOR ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CONTADOR'].AsInteger := Contador;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

  CalculaHorasTotales;
end;

procedure TOpeDMCalendario.CalculaHorasTotales;
begin
  with xHorasTotales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCalendarioEMPRESA.AsInteger;
     Params.ByName['CALENDARIO'].AsInteger := QMCalendarioCALENDARIO.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := OpeFMCalendario.YPCalendario.Year;
     Params.ByName['DIAS_EJERCICIO'].AsInteger := DaysInAYear(OpeFMCalendario.YPCalendario.Year);
     Open;
  end;
end;

procedure TOpeDMCalendario.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCalendario, '10000');
end;

procedure TOpeDMCalendario.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMCalendario.QMCalendarioNewRecord(DataSet: TDataSet);
begin
  QMCalendarioEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TOpeDMCalendario.QMCalendarioBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMCalendarioCALENDARIO.AsInteger = 0)) then
     QMCalendarioCALENDARIO.AsInteger := DMMain.Contador_E('ZCA');
end;

procedure TOpeDMCalendario.QMCalendarioAfterScroll(DataSet: TDataSet);
begin
  OpeFMCalendario.InicializacionCalendario;
  RefrescaCalendario; // Marca los dias de fiesta
  OpeFMCalendario.YPCalendario.Refresh;
end;

procedure TOpeDMCalendario.FiltraCalendario(Filtro: string);
begin
  with QMCalendario do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM OPE_CALENDARIO_C ');
     SelectSQL.Add('WHERE EMPRESA = ?EMPRESA ');
     if (Filtro <> '') then
        SelectSQL.Add(' AND (' + Filtro + ') ');
     SelectSQL.Add('ORDER BY CALENDARIO, EMPRESA');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

function TOpeDMCalendario.Festivo(Fecha: TDateTime): boolean;
begin
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
        SQL.Add(' FECHA = :FECHA ');
        Params.ByName['EMPRESA'].AsInteger := QMCalendarioEMPRESA.AsInteger;
        Params.ByName['CALENDARIO'].AsInteger := QMCalendarioCALENDARIO.AsInteger;
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
