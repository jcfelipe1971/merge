unit UProDMLstPresencia;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDataSet, FR_DSet, FR_DBSet, FIBQuery,
  HYFIBQuery;

type
  TProDMLstPresencia = class(TDataModule)
     TLocal: THYTransaction;
     frPresencia: TfrHYReport;
     QMLstCabPre: TFIBDataSetRO;
     QMLstDetPre: TFIBDataSetRO;
     DSQMLstCabPre: TDataSource;
     DSQMLstDetPre: TDataSource;
     frDBCabPresencia: TfrDBDataSet;
     frDBDetPresencia: TfrDBDataSet;
     DSxCalendarioD: TDataSource;
     xCalendarioD: TFIBDataSetRO;
     xCalendarioH: TFIBDataSetRO;
     DSxCalendariH: TDataSource;
     xCalendarioDDESCRIPCION: TFIBStringField;
     xCalendarioHDESCRIPCION: TFIBStringField;
     DSxHorarioD: TDataSource;
     xHorarioD: TFIBDataSetRO;
     xHorarioH: TFIBDataSetRO;
     DSxHorarioH: TDataSource;
     DSxIncidenciaD: TDataSource;
     xIncidenciaD: TFIBDataSetRO;
     xIncidenciaH: TFIBDataSetRO;
     DSxIncidenciaH: TDataSource;
     xHorarioDDESCRIPCION: TFIBStringField;
     xHorarioHDESCRIPCION: TFIBStringField;
     xIncidenciaDDESCRIPCION: TFIBStringField;
     xIncidenciaHDESCRIPCION: TFIBStringField;
     DSQMLstOperario: TDataSource;
     QMLstOperario: TFIBDataSetRO;
     frDBDDSOperario: TfrDBDataSet;
     DSQMLstTercero: TDataSource;
     QMLstTercero: TFIBDataSetRO;
     frDBDTercero: TfrDBDataSet;
     xCalendarioDCALENDARIO: TIntegerField;
     xCalendarioHCALENDARIO: TIntegerField;
     xHorarioDHORARIO: TFIBStringField;
     xHorarioHHORARIO: TFIBStringField;
     xIncidenciaDID_INCIDENCIA: TIntegerField;
     xIncidenciaHID_INCIDENCIA: TIntegerField;
     DSQMLstIncidencia: TDataSource;
     QMLstIncidencia: TFIBDataSetRO;
     frDBDIncidencia: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frPresenciaGetValue(const ParName: string; var ParValue: variant);
     procedure QMLstCabPreAfterOpen(DataSet: TDataSet);
     procedure QMLstOperarioAfterOpen(DataSet: TDataSet);
     procedure QMLstCabPreBeforeClose(DataSet: TDataSet);
     procedure QMLstOperarioBeforeClose(DataSet: TDataSet);
     procedure QMLstDetPreAfterOpen(DataSet: TDataSet);
     procedure QMLstDetPreBeforeClose(DataSet: TDataSet);
     procedure frPresenciaEnterRect(Memo: TStringList; View: TfrView);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     FechaDesde, FechaHasta: TDateTime;
  public
     { Public declarations }
     procedure CambiaCalendarioD(calendario: integer);
     procedure CambiaCalendarioH(calendario: integer);
     procedure CambiaHorarioD(horario: string);
     procedure CambiaHorarioH(horario: string);
     procedure CambiaIncidenciaD(incidencia: integer);
     procedure CambiaIncidenciaH(incidencia: integer);
     procedure MostrarListado(Modo, OperarioD, OperarioH: integer; FechaD, FechaH: TDateTime; HorarioD, HorarioH: string; IncidenciaD, IncidenciaH: integer; CalendarioD, CalendarioH: integer; Comentario: string; FechaListado: TDateTime);
  end;

var
  ProDMLstPresencia : TProDMLstPresencia;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno, UProFMLstPresencia, DateUtils;

{$R *.dfm}

{ TProDMLstPresencia }

procedure TProDMLstPresencia.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstPresencia.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLstPresencia.MostrarListado(Modo, OperarioD, OperarioH: integer; FechaD, FechaH: TDateTime; HorarioD, HorarioH: string; IncidenciaD, IncidenciaH: integer; CalendarioD, CalendarioH: integer; Comentario: string; FechaListado: TDateTime);
begin
  FechaDesde := FechaD;
  FechaHasta := RecodeTime(FechaH, 23, 59, 59, 999);
  DMListados.DatosInforme(FechaListado, Comentario);

  //sfg.albert - S'obren les taules mestre i detall
  with QMLstCabPre do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := 'A'; // REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PRE';
     Params.ByName['OPERARIOD'].AsInteger := OperarioD;
     Params.ByName['OPERARIOH'].AsInteger := OperarioH;
     Params.ByName['FECHAD'].AsDateTime := FechaDesde;
     Params.ByName['FECHAH'].AsDateTime := FechaHasta;
     Params.ByName['CALENDARIOD'].AsInteger := CalendarioD;
     Params.ByName['CALENDARIOH'].AsInteger := CalendarioH;
     Open;
  end;

  with QMLstDetPre do
  begin
     Close;
     Params.ByName['ID_INCIDENCIA_D'].AsInteger := incidenciaD;
     Params.ByName['ID_INCIDENCIA_H'].AsInteger := incidenciaH;
     Open;
  end;

  DMListados.Imprimir(8054, Modo, '', '', frPresencia, nil);
end;

procedure TProDMLstPresencia.CambiaCalendarioD(calendario: integer);
begin
  with xCalendarioD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CALENDARIO'].AsInteger := calendario;
     Open;
  end;
end;

procedure TProDMLstPresencia.CambiaCalendarioH(calendario: integer);
begin
  with xCalendarioH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CALENDARIO'].AsInteger := calendario;
     Open;
  end;
end;

procedure TProDMLstPresencia.CambiaHorarioD(horario: string);
begin
  with xHorarioD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['HORARIO'].AsString := horario;
     Open;
  end;
end;

procedure TProDMLstPresencia.CambiaHorarioH(horario: string);
begin
  with xHorarioH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['horario'].AsString := horario;
     Open;
  end;
end;

procedure TProDMLstPresencia.CambiaIncidenciaD(incidencia: integer);
begin
  with xIncidenciaD do
  begin
     Close;
     Params.ByName['ID_INCIDENCIA'].AsInteger := incidencia;
     Open;
  end;
end;

procedure TProDMLstPresencia.CambiaIncidenciaH(incidencia: integer);
begin
  with xIncidenciaH do
  begin
     Close;
     Params.ByName['ID_INCIDENCIA'].AsInteger := incidencia;
     Open;
  end;
end;

procedure TProDMLstPresencia.frPresenciaGetValue(const ParName: string; var ParValue: variant);
var
  DS : TFIBDataSet;
  Horas, Minutos, Segundos, DecSegundo : word;
  TotalHoras, TotalMinutos : word;
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'NomOperari') then
  begin
     ParValue := QMLstTercero.FieldByName('NOMBRE_R_SOCIAL').AsString;
  end;

  if (ParName = 'DescIncidencia') then
  begin
     ParValue := QMLstIncidencia.FieldByName('DESCRIPCION').AsString;
  end;

  if (ParName = 'FechaDesde') then
     ParValue := FechaDesde;

  if (ParName = 'FechaHasta') then
     ParValue := FechaHasta;

  if (ParName = 'TotalHoras') then
  begin
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT TIEMPO ');
              SelectSQL.Add(' FROM PRO_VER_DIARIO_PRESENCIA ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SelectSQL.Add(' CANAL = :CANAL AND ');
              SelectSQL.Add(' SERIE = :SERIE AND ');
              SelectSQL.Add(' TIPO = :TIPO AND ');
              SelectSQL.Add(' FECHA >= :FECHAD AND ');
              SelectSQL.Add(' FECHA <= :FECHAH ');
              SelectSQL.Add(' AND OPERARIO = :OPERARIO ');
              SelectSQL.Add(' AND CALENDARIO >= :DCALENDARIO AND CALENDARIO <= :HCALENDARIO ');
              SelectSQL.Add(' AND HORARIO >= :DHORARIO AND HORARIO <= :HHORARIO ');
              SelectSQL.Add(' AND ID_INCIDENCIA >= :D_ID_INCIDENCIA AND ID_INCIDENCIA <= :H_ID_INCIDENCIA ');

              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := 'A'; // REntorno.Serie;
              Params.ByName['TIPO'].AsString := 'PRE';
              Params.ByName['FECHAD'].AsDateTime := FechaDesde;
              Params.ByName['FECHAH'].AsDateTime := FechaHasta;
              Params.ByName['OPERARIO'].AsInteger := QMLstCabPre.FieldByName('OPERARIO').AsInteger;
              Params.ByName['DCALENDARIO'].AsInteger := xCalendarioDCALENDARIO.AsInteger;
              Params.ByName['HCALENDARIO'].AsInteger := xCalendarioHCALENDARIO.AsInteger;
              Params.ByName['DHORARIO'].AsString := xHorarioDHORARIO.AsString;
              Params.ByName['HHORARIO'].AsString := xHorarioHHORARIO.AsString;
              Params.ByName['D_ID_INCIDENCIA'].AsInteger := xIncidenciaDID_INCIDENCIA.AsInteger;
              Params.ByName['H_ID_INCIDENCIA'].AsInteger := xIncidenciaHID_INCIDENCIA.AsInteger;

              Open;

              TotalMinutos := 0;
              TotalHoras := 0;
              while not (EOF) do
              begin
                 DecodeTime(FieldByName('TIEMPO').AsDateTime, Horas, Minutos, Segundos, DecSegundo);

                 TotalMinutos := TotalMinutos + Minutos;
                 TotalHoras := TotalHoras + Horas;

                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     Horas := TotalMinutos div 60;
     TotalHoras := TotalHoras + Horas;
     TotalMinutos := TotalMinutos - Horas * 60;
     ParValue := IntToStr(TotalHoras) + ':' + IntToStr(TotalMinutos);
  end;
end;

procedure TProDMLstPresencia.QMLstCabPreAfterOpen(DataSet: TDataSet);
begin
  QMLstOperario.Open;
end;

procedure TProDMLstPresencia.QMLstOperarioAfterOpen(DataSet: TDataSet);
begin
  QMLstTercero.Open;
end;

procedure TProDMLstPresencia.QMLstCabPreBeforeClose(DataSet: TDataSet);
begin
  QMLstOperario.Close;
end;

procedure TProDMLstPresencia.QMLstOperarioBeforeClose(DataSet: TDataSet);
begin
  QMLstTercero.Close;
end;

procedure TProDMLstPresencia.QMLstDetPreAfterOpen(DataSet: TDataSet);
begin
  QMLstIncidencia.Open;
end;

procedure TProDMLstPresencia.QMLstDetPreBeforeClose(DataSet: TDataSet);
begin
  QMLstIncidencia.Close;
end;

procedure TProDMLstPresencia.frPresenciaEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

end.
