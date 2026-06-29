unit UDMPrevisionTesoreria;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery, Excel2000, OleServer, IdGlobal, Windows, Variants;

type
  TDMPrevisionTesoreria = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMConfiguracion: TFIBTableSet;
     DSQMConfiguracion: TDataSource;
     QMPrevisionPrev: TFIBTableSet;
     DSQMPrevisionPrev: TDataSource;
     QMResultado: TFIBTableSet;
     DSQMResultado: TDataSource;
     QMConfiguracionEMPRESA: TIntegerField;
     QMConfiguracionORDEN: TIntegerField;
     QMConfiguracionTITULO: TFIBStringField;
     QMConfiguracionSQL: TBlobField;
     QMPrevisionPrevEMPRESA: TIntegerField;
     QMPrevisionPrevEJERCICIO: TIntegerField;
     QMPrevisionPrevORDEN: TIntegerField;
     QMPrevisionPrevTITULO: TFIBStringField;
     QMPrevisionPrevMES_01: TFloatField;
     QMPrevisionPrevMES_02: TFloatField;
     QMPrevisionPrevMES_03: TFloatField;
     QMPrevisionPrevMES_04: TFloatField;
     QMPrevisionPrevMES_05: TFloatField;
     QMPrevisionPrevMES_06: TFloatField;
     QMPrevisionPrevMES_07: TFloatField;
     QMPrevisionPrevMES_08: TFloatField;
     QMPrevisionPrevMES_09: TFloatField;
     QMPrevisionPrevMES_10: TFloatField;
     QMPrevisionPrevMES_11: TFloatField;
     QMPrevisionPrevMES_12: TFloatField;
     QMResultadoENTRADA: TIntegerField;
     QMResultadoEMPRESA: TIntegerField;
     QMResultadoORDEN: TIntegerField;
     QMResultadoTITULO: TFIBStringField;
     QMResultadoMES_01: TFloatField;
     QMResultadoMES_02: TFloatField;
     QMResultadoMES_03: TFloatField;
     QMResultadoMES_04: TFloatField;
     QMResultadoMES_05: TFloatField;
     QMResultadoMES_06: TFloatField;
     QMResultadoMES_07: TFloatField;
     QMResultadoMES_08: TFloatField;
     QMResultadoMES_09: TFloatField;
     QMResultadoMES_10: TFloatField;
     QMResultadoMES_11: TFloatField;
     QMResultadoMES_12: TFloatField;
     QMResultadoPREV_01: TFloatField;
     QMResultadoPREV_02: TFloatField;
     QMResultadoPREV_03: TFloatField;
     QMResultadoPREV_04: TFloatField;
     QMResultadoPREV_05: TFloatField;
     QMResultadoPREV_06: TFloatField;
     QMResultadoPREV_07: TFloatField;
     QMResultadoPREV_08: TFloatField;
     QMResultadoPREV_09: TFloatField;
     QMResultadoPREV_10: TFloatField;
     QMResultadoPREV_11: TFloatField;
     QMResultadoPREV_12: TFloatField;
     QMConfiguracionCELDA_EXCEL: TFIBStringField;
     ExcelApplication: TExcelApplication;
     ExcelWorkbook: TExcelWorkbook;
     QMPrevision: TFIBTableSet;
     DSQMPrevision: TDataSource;
     QMPrevisionEMPRESA: TIntegerField;
     QMPrevisionPREVISION: TIntegerField;
     QMPrevisionTITULO: TFIBStringField;
     QMConfiguracionPREVISION: TIntegerField;
     QMPrevisionPrevPREVISION: TIntegerField;
     QMResultadoPREVISION: TIntegerField;
     QMPrevisionPLANTILLA: TFIBStringField;
     QMConfiguracionCELDA_EXCEL_PREV: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMConfiguracionNewRecord(DataSet: TDataSet);
     procedure QMPrevisionNewRecord(DataSet: TDataSet);
     procedure QMPrevisionAfterOpen(DataSet: TDataSet);
     procedure QMPrevisionBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Calcular(Prevision, Ejercicio: integer; Periodo: string; Meses: integer);
     procedure ExportaExcel(Archivo: string);
     procedure RegeneraPrevision(Ejercicio: integer);
  end;

var
  DMPrevisionTesoreria : TDMPrevisionTesoreria;

implementation

uses UDMMain, UEntorno, DateUtils, Dialogs, UUtiles;

{$R *.dfm}

procedure TDMPrevisionTesoreria.Calcular(Prevision, Ejercicio: integer; Periodo: string; Meses: integer);

  function ExisteParametro(Q: TFIBDataSet; Nombre: string): boolean;
  var
     i : integer;
  begin
     i := 0;
     while ((i <= Q.Params.Count) and (UpperCase(Q.Params[i].Name) <> Nombre)) do
        Inc(i);
     Result := (UpperCase(Q.Params[i].Name) = Nombre);
  end;

  function MesesEntreFechas(D1, D2: TDateTime): integer;
  var
     y1, y2 : integer;
     m1, m2 : integer;
  begin
     /// Devuelve la cantidad de meses entre dos fechas.
     /// Meses naturales.
     y1 := YearOf(D1);
     m1 := MonthOf(D1);
     y2 := YearOf(D2);
     m2 := MonthOf(D2);
     Result := (y2 - y1) * 12 + (m2 - m1);
  end;

var
  QValores : TFIBDataSet;
  FechaIni, FechaFin : TDateTime;
  mes : integer;
  Valores : array[1..12] of currency;
  ValoresPrevision : array[1..12] of currency;
  campo : string;
begin
  /// PERIODO es el mes inicial para el calculo
  /// MESES es cuantos meses se cuentan a partir de ese mes inicial

  DameDesdeHastaPeriodo(Periodo, FechaIni, FechaFin);
  FechaFin := IncMonth(FechaFin, Meses - 1);

  // Limpio la tabla de resultados
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        SQL.Add(' DELETE FROM EMP_PREV_TESORERIA_RESULTADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' PREVISION = :PREVISION AND ');
        SQL.Add(' ENTRADA = :ENTRADA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PREVISION'].AsInteger := Prevision;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  { TODO : Esto debería ser un DS creado y filtrado por los parametros del procedimiento }
  // Recorro cada item
  with QMConfiguracion do
  begin
     Close;
     Open;
     while not EOF do
     begin
        // Inicializo acumulador
        for mes := 1 to 12 do
           Valores[mes] := 0;

        // Calculo los valores para cada mes
        QValores := TFIBDataSet.Create(nil);
        with QValores do
        begin
           try
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

                 SelectSQL.Add(QMConfiguracionSQL.AsString);

                 if (ExisteParametro(QValores, 'EMPRESA')) then
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 if (ExisteParametro(QValores, 'EJERCICIO')) then
                    Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 if (ExisteParametro(QValores, 'CANAL')) then
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 if (ExisteParametro(QValores, 'FECHA_INI')) then
                    Params.ByName['FECHA_INI'].AsDateTime := FechaIni;
                 if (ExisteParametro(QValores, 'FECHA_FIN')) then
                    Params.ByName['FECHA_FIN'].AsDateTime := FechaFin;

                 Open;

                 // Recorro registros y los acumulo en el mes que corresponda
                 while not EOF do
                 begin
                    mes := MonthOf(FieldByName('FECHA').AsDateTime);
                    Valores[mes] := Valores[mes] + FieldByName('VALOR').AsFloat;

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

        // Aqui agrego los valores de previsiones
        for mes := 1 to 12 do
        begin
           // Relleno prevision
           campo := Format('MES_%.2d', [mes]);

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT ' + campo + ' FROM EMP_PREV_TESORERIA_PREV ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = ?EMPRESA AND ');
                 SQL.Add(' PREVISION = ?PREVISION AND ');
                 SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
                 SQL.Add(' ORDEN = ?ORDEN ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['PREVISION'].AsInteger := Prevision;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['ORDEN'].AsInteger := QMConfiguracionORDEN.AsInteger;
                 ExecQuery;
                 ValoresPrevision[mes] := FieldByName[campo].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        // Guardo los valores de cada mes en la tabla de resultados
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO EMP_PREV_TESORERIA_RESULTADO ( ');
              SQL.Add(' ENTRADA,EMPRESA,PREVISION,ORDEN, ');
              SQL.Add(' MES_01,MES_02,MES_03,MES_04,MES_05,MES_06,MES_07,MES_08,MES_09,MES_10,MES_11,MES_12, ');
              SQL.Add(' PREV_01,PREV_02,PREV_03,PREV_04,PREV_05,PREV_06,PREV_07,PREV_08,PREV_09,PREV_10,PREV_11,PREV_12) ');
              SQL.Add(' VALUES ( ');
              SQL.Add(' ?ENTRADA,?EMPRESA,?PREVISION,?ORDEN, ');
              SQL.Add(' ?MES_01,?MES_02,?MES_03,?MES_04,?MES_05,?MES_06,?MES_07,?MES_08,?MES_09,?MES_10,?MES_11,?MES_12, ');
              SQL.Add(' ?PREV_01,?PREV_02,?PREV_03,?PREV_04,?PREV_05,?PREV_06,?PREV_07,?PREV_08,?PREV_09,?PREV_10,?PREV_11,?PREV_12) ');
              Params.ByName['MES_01'].AsFloat := Valores[1];
              Params.ByName['MES_02'].AsFloat := Valores[2];
              Params.ByName['MES_03'].AsFloat := Valores[3];
              Params.ByName['MES_04'].AsFloat := Valores[4];
              Params.ByName['MES_05'].AsFloat := Valores[5];
              Params.ByName['MES_06'].AsFloat := Valores[6];
              Params.ByName['MES_07'].AsFloat := Valores[7];
              Params.ByName['MES_08'].AsFloat := Valores[8];
              Params.ByName['MES_09'].AsFloat := Valores[9];
              Params.ByName['MES_10'].AsFloat := Valores[10];
              Params.ByName['MES_11'].AsFloat := Valores[11];
              Params.ByName['MES_12'].AsFloat := Valores[12];
              Params.ByName['PREV_01'].AsFloat := ValoresPrevision[1];
              Params.ByName['PREV_02'].AsFloat := ValoresPrevision[2];
              Params.ByName['PREV_03'].AsFloat := ValoresPrevision[3];
              Params.ByName['PREV_04'].AsFloat := ValoresPrevision[4];
              Params.ByName['PREV_05'].AsFloat := ValoresPrevision[5];
              Params.ByName['PREV_06'].AsFloat := ValoresPrevision[6];
              Params.ByName['PREV_07'].AsFloat := ValoresPrevision[7];
              Params.ByName['PREV_08'].AsFloat := ValoresPrevision[8];
              Params.ByName['PREV_09'].AsFloat := ValoresPrevision[9];
              Params.ByName['PREV_10'].AsFloat := ValoresPrevision[10];
              Params.ByName['PREV_11'].AsFloat := ValoresPrevision[11];
              Params.ByName['PREV_12'].AsFloat := ValoresPrevision[12];
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['PREVISION'].AsInteger := Prevision;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ORDEN'].AsInteger := QMConfiguracionORDEN.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Next;
     end;
  end;

  // Refresco la tabla de resultados
  with QMResultado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PREVISION'].AsInteger := Prevision;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMPrevisionTesoreria.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMResultadoMES_01.DisplayFormat := MascaraN;
  QMResultadoMES_02.DisplayFormat := MascaraN;
  QMResultadoMES_03.DisplayFormat := MascaraN;
  QMResultadoMES_04.DisplayFormat := MascaraN;
  QMResultadoMES_05.DisplayFormat := MascaraN;
  QMResultadoMES_06.DisplayFormat := MascaraN;
  QMResultadoMES_07.DisplayFormat := MascaraN;
  QMResultadoMES_08.DisplayFormat := MascaraN;
  QMResultadoMES_09.DisplayFormat := MascaraN;
  QMResultadoMES_10.DisplayFormat := MascaraN;
  QMResultadoMES_11.DisplayFormat := MascaraN;
  QMResultadoMES_12.DisplayFormat := MascaraN;

  QMResultadoPREV_01.DisplayFormat := MascaraN;
  QMResultadoPREV_02.DisplayFormat := MascaraN;
  QMResultadoPREV_03.DisplayFormat := MascaraN;
  QMResultadoPREV_04.DisplayFormat := MascaraN;
  QMResultadoPREV_05.DisplayFormat := MascaraN;
  QMResultadoPREV_06.DisplayFormat := MascaraN;
  QMResultadoPREV_07.DisplayFormat := MascaraN;
  QMResultadoPREV_08.DisplayFormat := MascaraN;
  QMResultadoPREV_09.DisplayFormat := MascaraN;
  QMResultadoPREV_10.DisplayFormat := MascaraN;
  QMResultadoPREV_11.DisplayFormat := MascaraN;
  QMResultadoPREV_12.DisplayFormat := MascaraN;

  QMPrevisionPrevMES_01.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_02.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_03.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_04.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_05.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_06.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_07.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_08.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_09.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_10.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_11.DisplayFormat := MascaraN;
  QMPrevisionPrevMES_12.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMPrevision, '100000', True);
  DMMain.FiltraTabla(QMConfiguracion, '100000', True);
  DMMain.FiltraTabla(QMPrevisionPrev, '110000', True);
  DMMain.FiltraTabla(QMResultado, '100000', True);
end;

procedure TDMPrevisionTesoreria.QMConfiguracionNewRecord(DataSet: TDataSet);
begin
  QMConfiguracionEMPRESA.AsInteger := QMPrevisionEMPRESA.AsInteger;
  QMConfiguracionPREVISION.AsInteger := QMPrevisionPREVISION.AsInteger;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(ORDEN) FROM EMP_PREV_TESORERIA_CONFIG WHERE EMPRESA = :EMPRESA AND PREVISION = :PREVISION';
        Params.ByName['EMPRESA'].AsInteger := QMPrevisionEMPRESA.AsInteger;
        Params.ByName['PREVISION'].AsInteger := QMPrevisionPREVISION.AsInteger;
        ExecQuery;
        QMConfiguracionORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPrevisionTesoreria.ExportaExcel(Archivo: string);
var
  LCID : integer;
  Fila : integer;
  p : integer;
  Columna : string;
  ColumnaFinal : string;
  Celda : string;
  DS : TFIBDataSet;
  Carpeta, NombreArchivo : string;
begin
  LCID := GetUserDefaultLCID;
  with ExcelApplication do
  begin
     Connect;
     try
        // Si se pone a true se muestra la pagina de excel
        Visible[LCID] := False;

        if (not FileExists(Archivo)) then
           Workbooks.Add(EmptyParam, LCID)
        else
           Workbooks.Open(Archivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
              EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
              EmptyParam, EmptyParam, 0);

        // Recorro los datos resultados y los paso a las celdas configuradas
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
                 SelectSQL.Add(' SELECT C.CELDA_EXCEL, C.CELDA_EXCEL_PREV, R.ORDEN, R.TITULO, ');
                 SelectSQL.Add(' R.MES_01, R.MES_02, R.MES_03, R.MES_04, R.MES_05, R.MES_06, ');
                 SelectSQL.Add(' R.MES_07, R.MES_08, R.MES_09, R.MES_10, R.MES_11, R.MES_12, ');
                 SelectSQL.Add(' R.PREV_01, R.PREV_02, R.PREV_03, R.PREV_04, R.PREV_05, R.PREV_06, ');
                 SelectSQL.Add(' R.PREV_07, R.PREV_08, R.PREV_09, R.PREV_10, R.PREV_11, R.PREV_12 ');
                 SelectSQL.Add(' FROM EMP_PREV_TESORERIA_RESULTADO R ');
                 SelectSQL.Add(' JOIN EMP_PREV_TESORERIA_CONFIG C ');
                 SelectSQL.Add(' ON R.EMPRESA = C.EMPRESA AND R.PREVISION = C.PREVISION AND R.ORDEN = C.ORDEN ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' R.EMPRESA = ?EMPRESA AND ');
                 SelectSQL.Add(' R.PREVISION = ?PREVISION AND ');
                 SelectSQL.Add(' R.ENTRADA = ?ENTRADA ');
                 SelectSQL.Add(' ORDER BY R.ORDEN ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['PREVISION'].AsInteger := QMPrevisionPREVISION.AsInteger;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Open;
                 while not EOF do
                 begin
                    Celda := Trim(FieldByName('CELDA_EXCEL').AsString);
                    if (Celda > '') then
                    begin
                       // Desglose de Columna y Fila
                       // Columna son las primeras letras de la celda
                       // Fila son los numeros de la celda
                       p := 1;
                       while (not IsNumeric(Celda[p])) and (p < Length(Celda)) do
                          Inc(p);
                       Columna := Copy(Celda, 1, p - 1);
                       Fila := StrToInt(Copy(Celda, p, Length(Celda)));

                       // Busco la letra de la 12aba columna
                       // Esto funciona desde columna A hasta ZZ. Columnas de 3 letras falla.
                       ColumnaFinal := Columna;
                       for p := 2 to 12 do
                          if ColumnaFinal[Length(ColumnaFinal)] = 'Z' then
                          begin
                             if Length(ColumnaFinal) > 1 then
                             begin
                                ColumnaFinal[Length(ColumnaFinal) - 1] := Succ(ColumnaFinal[Length(ColumnaFinal) - 1]);
                                ColumnaFinal[Length(ColumnaFinal)] := 'A';
                             end;
                          end
                          else
                             ColumnaFinal[Length(ColumnaFinal)] := Succ(ColumnaFinal[Length(ColumnaFinal)]);

                       Range[Columna + IntToStr(Fila), ColumnaFinal + IntToStr(Fila)].Value :=
                          VarArrayOf([FieldByName('MES_01').AsFloat, FieldByName('MES_02').AsFloat, FieldByName('MES_03').AsFloat,
                          FieldByName('MES_04').AsFloat, FieldByName('MES_05').AsFloat, FieldByName('MES_06').AsFloat,
                          FieldByName('MES_07').AsFloat, FieldByName('MES_08').AsFloat, FieldByName('MES_09').AsFloat,
                          FieldByName('MES_10').AsFloat, FieldByName('MES_11').AsFloat, FieldByName('MES_12').AsFloat]);
                    end;

                    Celda := Trim(FieldByName('CELDA_EXCEL_PREV').AsString);
                    if (Celda > '') then
                    begin
                       // Desglose de Columna y Fila
                       // Columna son las primeras letras de la celda
                       // Fila son los numeros de la celda
                       p := 1;
                       while (not IsNumeric(Celda[p])) and (p < Length(Celda)) do
                          Inc(p);
                       Columna := Copy(Celda, 1, p - 1);
                       Fila := StrToInt(Copy(Celda, p, Length(Celda)));

                       // Busco la letra de la 12aba columna
                       // Esto funciona desde columna A hasta ZZ. Columnas de 3 letras falla.
                       ColumnaFinal := Columna;
                       for p := 2 to 12 do
                          if ColumnaFinal[Length(ColumnaFinal)] = 'Z' then
                          begin
                             if Length(ColumnaFinal) > 1 then
                             begin
                                ColumnaFinal[Length(ColumnaFinal) - 1] := Succ(ColumnaFinal[Length(ColumnaFinal) - 1]);
                                ColumnaFinal[Length(ColumnaFinal)] := 'A';
                             end;
                          end
                          else
                             ColumnaFinal[Length(ColumnaFinal)] := Succ(ColumnaFinal[Length(ColumnaFinal)]);

                       Range[Columna + IntToStr(Fila), ColumnaFinal + IntToStr(Fila)].Value :=
                          VarArrayOf([FieldByName('PREV_01').AsFloat, FieldByName('PREV_02').AsFloat, FieldByName('PREV_03').AsFloat,
                          FieldByName('PREV_04').AsFloat, FieldByName('PREV_05').AsFloat, FieldByName('PREV_06').AsFloat,
                          FieldByName('PREV_07').AsFloat, FieldByName('PREV_08').AsFloat, FieldByName('PREV_09').AsFloat,
                          FieldByName('PREV_10').AsFloat, FieldByName('PREV_11').AsFloat, FieldByName('PREV_12').AsFloat]);
                    end;

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

        // Renombro el archivo con el sufijo fecha
        Carpeta := ExtractFilePath(Archivo);
        NombreArchivo := ExtractFileName(Archivo);
        NombreArchivo := Copy(NombreArchivo, 1, Length(NombreArchivo) - Length(ExtractFileExt(NombreArchivo)));
        NombreArchivo := NombreArchivo + FormatDateTime('_yyyymmdd_hhnnss', Now) + '.xls';

        ActiveWorkbook.SaveAs(Carpeta + NombreArchivo, xlNormal, '', '', False, False, xlNochange,
           xlUserResolution, False, EmptyParam, EmptyParam, LCID);
        Quit;
     finally
        Disconnect;
     end; //try
  end; //with Excelapplication

  // Finalmente abro el archivo
  DMMain.AbrirArchivo(Carpeta + NombreArchivo);
end;

procedure TDMPrevisionTesoreria.QMPrevisionNewRecord(DataSet: TDataSet);
begin
  QMPrevisionEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMPrevisionTesoreria.QMPrevisionAfterOpen(DataSet: TDataSet);
begin
  QMConfiguracion.Open;
  QMPrevisionPrev.Open;
end;

procedure TDMPrevisionTesoreria.QMPrevisionBeforeClose(DataSet: TDataSet);
begin
  QMConfiguracion.Close;
  QMPrevisionPrev.Close;
end;

procedure TDMPrevisionTesoreria.RegeneraPrevision(Ejercicio: integer);
begin
  if (Ejercicio <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO EMP_PREV_TESORERIA_PREV ( ');
           SQL.Add(' EMPRESA, PREVISION, EJERCICIO, ORDEN, TITULO) ');
           SQL.Add(' SELECT C.EMPRESA, C.PREVISION, :EJERCICIO, C.ORDEN, C.TITULO ');
           SQL.Add(' FROM EMP_PREV_TESORERIA_CONFIG C ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.PREVISION = :PREVISION AND ');
           SQL.Add(' NOT EXISTS(SELECT EMPRESA ');
           SQL.Add('            FROM EMP_PREV_TESORERIA_PREV ');
           SQL.Add('            WHERE ');
           SQL.Add('            EMPRESA = C.EMPRESA AND ');
           SQL.Add('            PREVISION = C.PREVISION AND ');
           SQL.Add('            EJERCICIO = :EJERCICIO AND ');
           SQL.Add('            ORDEN = C.ORDEN) ');
           SQL.Add(' ORDER BY C.ORDEN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['PREVISION'].AsInteger := QMPrevisionPREVISION.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refrescar(QMPrevisionPrev, 'ORDEN', QMPrevisionPrevORDEN.AsInteger);
  end;
end;

end.
