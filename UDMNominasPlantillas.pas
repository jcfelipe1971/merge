unit UDMNominasPlantillas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMNominasPlantillas = class(TDataModule)
     DSQMNomPlantilla: TDataSource;
     QMNomPlantilla: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMNomPlantillaID: TIntegerField;
     QMNomPlantillaEMPRESA: TIntegerField;
     QMNomPlantillaTITULO: TFIBStringField;
     DSQMNomPlantillaConf: TDataSource;
     QMNomPlantillaConf: TFIBTableSet;
     QMNomPlantillaConfID: TIntegerField;
     QMNomPlantillaConfCONCEPTO: TFIBStringField;
     QMNomPlantillaConfORDEN: TIntegerField;
     QMNomPlantillaConfTIPO: TFIBStringField;
     QMNomPlantillaConfID_PLANTILLA: TIntegerField;
     QMNomPlantillaConfGLOSA: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMNomPlantillaAfterOpen(DataSet: TDataSet);
     procedure QMNomPlantillaBeforeClose(DataSet: TDataSet);
     procedure QMNomPlantillaBeforePost(DataSet: TDataSet);
     procedure QMNomPlantillaNewRecord(DataSet: TDataSet);
     procedure QMNomPlantillaConfBeforePost(DataSet: TDataSet);
     procedure QMNomPlantillaConfNewRecord(DataSet: TDataSet);
     procedure QMNomPlantillaConfCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     procedure UpdateValor(IdNomina: integer; Concepto: string; Importe: double);
     function DameImporte(Tipo, Codigo, Periodo: string; Empleado: integer): double;
     function DameGlosa(Codigo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
  public
     procedure ExportarExcel(Periodo, Archivo: string);
     procedure ImportarXLS(Archivo, Periodo: string; Log: TStrings);
  end;

var
  DMNominasPlantillas : TDMNominasPlantillas;

implementation

uses UDMMain, UEntorno, UFormGest, UUtiles, UHojaCalc, Graphics, Dialogs, HYFIBQuery;

{$R *.dfm}

procedure TDMNominasPlantillas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMNomPlantilla, '10000', True);
end;

procedure TDMNominasPlantillas.QMNomPlantillaAfterOpen(DataSet: TDataSet);
begin
  QMNomPlantillaConf.Open;
end;

procedure TDMNominasPlantillas.QMNomPlantillaBeforeClose(DataSet: TDataSet);
begin
  QMNomPlantillaConf.Close;
end;

procedure TDMNominasPlantillas.QMNomPlantillaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_EMP_NOMINAS_PLANTILLA', 'ID');
end;

procedure TDMNominasPlantillas.QMNomPlantillaNewRecord(DataSet: TDataSet);
begin
  QMNomPlantillaEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMNominasPlantillas.QMNomPlantillaConfBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_EMP_NOMINA_PLANTILLA_CONF', 'ID');
end;

procedure TDMNominasPlantillas.QMNomPlantillaConfNewRecord(DataSet: TDataSet);
begin
  QMNomPlantillaConfID_PLANTILLA.AsInteger := QMNomPlantillaID.AsInteger;
  QMNomPlantillaConfTIPO.AsString := 'H';
end;

procedure TDMNominasPlantillas.ExportarExcel(Periodo, Archivo: string);
var
  Fila, Columna : integer;
  //Orden : integer;
  MaxCol : integer;
  HCalc : THojaCalc;
  DS : TFIBDataSet;
  Importe : double;

  procedure DestacaFila(aFila: integer; Color: TColor);
  var
     c : integer;
  begin
     for c := 1 to MaxCol do
     begin
        HCalc.Bold(aFila, c);
        HCalc.BackgroundColor(aFila, c, Color);
     end;
  end;

begin
  DMMain.Log('Exportando Plantilla Excel: ' + Archivo);
  QMNomPlantillaConf.Close;
  QMNomPlantillaConf.Open;

  // Verifico si es excel o OpenOffice
  if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     HCalc := THojaCalc.Create(thcExcel, False)
  else
     HCalc := THojaCalc.Create(thcOpenOffice, False);

  try
     HCalc.FileName := Archivo;

     HCalc.ActivateSheetByIndex(1);

     // Cabecera
     Fila := 1;
     HCalc.CellText[Fila, 1] := _('Plantilla - ') + QMNomPlantillaTITULO.AsString;
     DestacaFila(Fila, clYellow);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('RUT');
     HCalc.CellText[Fila, 2] := _('Nombre');

     Columna := 2;
     QMNomPlantillaConf.First;
     while not QMNomPlantillaConf.EOF do
     begin
        Inc(Columna);
        HCalc.ColNumberFormat(Columna, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.CellText[Fila, Columna] := QMNomPlantillaConf.FieldByName('CONCEPTO').AsString + ' - ' +
           DameGlosa(QMNomPlantillaConf.FieldByName('CONCEPTO').AsString);

        QMNomPlantillaConf.Next;
     end;

     // Obtengo lista de empleados activos
     DS := TFIBDataSet.Create(nil);
     with DS do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add(' SELECT NIF AS RUT,TITULO AS NOMBRE, EMPLEADO FROM VER_EMPLEADOS_CUENTAS ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = :EMPRESA AND');
              SelectSQL.Add(' EJERCICIO = :EJERCICIO AND');
              SelectSQL.Add(' CANAL = :CANAL AND ');
              SelectSQL.Add(' ACTIVO = 1 ');
              {
              SelectSQL.Add(' AND (');
              SelectSQL.Add(' EMPLEADO in ( SELECT EMPLEADO FROM CON_CUENTAS_GES_EMP_H WHERE PERIODO =?PERIODO  ) or ');
              SelectSQL.Add(' EMPLEADO in ( SELECT EMPLEADO FROM CON_CUENTAS_GES_EMP_P WHERE PERIODO =?PERIODO  ) or ');
              SelectSQL.Add(' EMPLEADO in ( SELECT EMPLEADO FROM CON_CUENTAS_GES_EMP_D WHERE PERIODO =?PERIODO  )  ');
              SelectSQL.Add(' ) ');
              }
              SelectSQL.Add(' ORDER BY NIF ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              // Params.ByName['PERIODO'].AsString := Periodo;
              Open;
              while not EOF do
              begin
                 Inc(Fila);
                 HCalc.CellText[Fila, 1] := FieldByName('RUT').AsString;
                 HCalc.CellText[Fila, 2] := FieldByName('NOMBRE').AsString;

                 Columna := 2;
                 QMNomPlantillaConf.First;
                 while not QMNomPlantillaConf.EOF do
                 begin
                    Inc(Columna);
                    Importe := DameImporte(QMNomPlantillaConf.FieldByName('TIPO').AsString, QMNomPlantillaConf.FieldByName('CONCEPTO').AsString, Periodo, FieldByName('EMPLEADO').AsInteger);
                    if (Importe <> 0) then
                    begin
                       HCalc.ColNumberFormat(Columna, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00'); // Dos decimales
                       HCalc.SendNumber(Fila, Columna, Importe);
                    end;

                    QMNomPlantillaConf.Next;
                 end;

                 DS.Next;
              end;
              DS.Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           DS.Free;
        end;
     end;

     // Tamaño automático de columnas
     HCalc.AutoFit(2);

     HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
  finally
     HCalc.Free;
     ShowMessage(_('Proceso Terminado.'));
  end;
end;

function TDMNominasPlantillas.DameImporte(Tipo, Codigo, Periodo: string; Empleado: integer): double;
begin
  /// Devuelve el valor IMPORTE del codigo seleccionado para la nomina.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT IMPORTE FROM ');
        if Tipo = 'H' then
           SQL.Add(' CON_CUENTAS_GES_EMP_H  ')
        else
        if Tipo = 'D' then
           SQL.Add(' CON_CUENTAS_GES_EMP_D  ')
        else
        if Tipo = 'P' then
           SQL.Add(' CON_CUENTAS_GES_EMP_P  ');

        SQL.Add(' WHERE ');

        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' PERIODO = :PERIODO AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO AND ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := Periodo;
        Params.ByName['EMPLEADO'].AsInteger := Empleado;
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['IMPORTE'].AsFloat;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominasPlantillas.ImportarXLS(Archivo, Periodo: string; Log: TStrings);
var
  HCalc : THojaCalc;
  CantidadFilas, CantidadColumnas, Fila, Columna, ColumnaRut, FilaNombres, ColumnaInicialConceptos : integer;
  RUT, Concepto, Imp : string;
  Importe : double;

  Empleado, IdNomina, EstadoNomina : integer;
begin
  Log.Add('Importando fichero: ' + Archivo);
  try
     HCalc := THojaCalc.Create(Archivo, False);
     HCalc.ActivateSheetByIndex(1);
     CantidadFilas := HCalc.LastRow + 1;
     CantidadColumnas := HCalc.LastCol + 1;
     ColumnaRut := 1;
     FilaNombres := 3;
     ColumnaInicialConceptos := 3;
     Log.Add(format('Filas: %d - Columnas %d ', [CantidadFilas, CantidadColumnas]));

     // Recorro las filas que contienen datos
     for Fila := FilaNombres + 1 to CantidadFilas - 1 do
     begin
        try
           RUT := LimpiaCeldaExcel(HCalc.CellText[Fila, ColumnaRut]);
        except
           RUT := '';
        end;
        Log.Add(format('Importando conceptos para RUT %s', [RUT]));

        // Busco el empleado con el RUT
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT EMPLEADO FROM VER_EMPLEADOS_CUENTAS ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' NIF = :RUT ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.CANAL;
              Params.ByName['RUT'].AsString := RUT;
              ExecQuery;
              Empleado := FieldByName['EMPLEADO'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Empleado = 0) then
           Log.Add(format('La celda [F/C](%d, %d). No existe empleado con RUT "%s".', [Fila, ColumnaRut, RUT]))
        else
        begin
           // Inserto la nomina para el Empleado-Periodo, si no existe.
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO VER_EMP_NOMINAS_CABECERA ( ');
                 SQL.Add(' EMPRESA, EJERCICIO, CANAL, EMPLEADO, PERIODO, ENTRADA, FECHA_INI_PERIODO, FECHA_FIN_PERIODO, FECHA) ');
                 SQL.Add(' SELECT E.EMPRESA, E.EJERCICIO, E.CANAL, E.EMPLEADO, P.PERIODO, CAST(:ENTRADA AS INTEGER), P.DESDE, P.HASTA, ');
                 SQL.Add('        CAST(:FECHA AS DATE) ');
                 SQL.Add(' FROM VER_EMPLEADOS_CUENTAS E ');
                 SQL.Add(' JOIN EMP_PERIODOS P ON E.EMPRESA = P.EMPRESA AND E.EJERCICIO = P.EJERCICIO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' E.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' E.EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' E.CANAL = :CANAL AND ');
                 SQL.Add(' E.ACTIVO = 1 AND ');
                 SQL.Add(' E.EMPLEADO = :EMPLEADO AND ');
                 SQL.Add(' P.PERIODO = :PERIODO AND ');
                 SQL.Add(' NOT EXISTS(SELECT EMPLEADO ');
                 SQL.Add('            FROM VER_EMP_NOMINAS_CABECERA ');
                 SQL.Add('            WHERE ');
                 SQL.Add('            EMPRESA = E.EMPRESA AND ');
                 SQL.Add('            EJERCICIO = E.EJERCICIO AND ');
                 SQL.Add('            CANAL = E.CANAL AND ');
                 SQL.Add('            PERIODO = P.PERIODO AND ');
                 SQL.Add('            EMPLEADO = E.EMPLEADO) ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['PERIODO'].AsString := Periodo;
                 Params.ByName['FECHA'].AsDateTime := Now;
                 Params.ByName['EMPLEADO'].AsInteger := Empleado;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Obtengo ID de la nomina y su estado
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT ID, ESTADO ');
                 SQL.Add(' FROM VER_EMP_NOMINAS_CABECERA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' PERIODO = :PERIODO AND ');
                 SQL.Add(' EMPLEADO = :EMPLEADO ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['PERIODO'].AsString := Periodo;
                 Params.ByName['EMPLEADO'].AsInteger := Empleado;
                 ExecQuery;
                 IdNomina := FieldByName['ID'].AsInteger;
                 EstadoNomina := FieldByName['ESTADO'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (IdNomina = 0) then
              Log.Add(format('No existe nomina para el empleado %d en el periodo %s.', [Empleado, Periodo]))
           else
           if (EstadoNomina <> 0) then
              Log.Add(format('La nomina para el empleado %d en el periodo %s esta cerrada y no puede modificarse.', [Empleado, Periodo]))
           else
           begin
              // Recorro las columnas de conceptos
              for Columna := ColumnaInicialConceptos to CantidadColumnas do
              begin
                 // Obtengo codigo de concepto
                 try
                    Concepto := LimpiaCeldaExcel(HCalc.CellText[FilaNombres, Columna]);
                 except
                    on E: Exception do
                    begin
                       Concepto := '';
                       Log.Add(format('Error importando celda [F/C](%d, %d) - Concepto' + #13#10 + '%s', [FilaNombres, Columna, E.Message]));
                    end;
                 end;

                 // Obtengo el importe
                 try
                    Imp := LimpiaCeldaExcel(HCalc.CellText[Fila, Columna]);
                    Importe := -1;
                    if (Imp <> '') then
                    begin
                       try
                          Imp := StringReplace(Imp, '.', '', []);
                          Imp := StringReplace(Imp, ',', '.', []);
                          Importe := StrToFloatDec(Imp, '.');
                       except
                          on E: Exception do
                          begin
                             Log.Add(format('La celda [F/C](%d, %d)="%s" -> "%s" -> %.2f. No contiene un valor numerico decimal.', [Fila, Columna, HCalc.CellText[Fila, Columna], Imp, Importe]));
                             Imp := '';
                             Importe := -1;
                          end;
                       end;
                    end;
                 except
                    on E: Exception do
                    begin
                       Imp := '';
                       Importe := -1;
                       Log.Add(format('Error importando celda [F/C](%d, %d) - Importe' + #13#10 + '%s', [Fila, Columna, E.Message]));
                    end;
                 end;

                 DMMain.Log(format('Importando celda [F/C](%d, %d) - RUT: "%s" - IdNomina: %d - Concepto: "%s" - Importe "%s" (%.2f)', [Fila, Columna, RUT, IdNomina, Concepto, Imp, Importe]));

                 // Si el concepto, el importe (contiene valor numerico) vienen rellenados modifico el valor en la nomina
                 if (Concepto <> '') and (Imp <> '') and (Importe > 0) then
                 begin
                    try
                       UpdateValor(IdNomina, Concepto, Importe);
                    except
                       on E: Exception do
                       begin
                          Log.Add(format('Error modificando conceptos de nomina.' + #13#10 + 'RUT:%s - Concepto: %s - Importe: %.2f' + #13#10 + '%s', [RUT, Concepto, Importe, E.Message]));
                       end;
                    end;
                 end;
              end;
           end;
        end;
     end;
  finally
     HCalc.Free;
     Log.Add('Importacion finalizada.');
  end;
end;

procedure TDMNominasPlantillas.UpdateValor(IdNomina: integer; Concepto: string; Importe: double);
begin
  /// Update de los importes en EMP_NOMINAS_DET_H/D/P

  // Para evitar tener que buscar en que tabla esta el Concepto hago el update en las tres, si no esta no pasa nada
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_NOMINAS_DET_HABERES ');
        SQL.Add(' SET ');
        SQL.Add(' IMPORTE = :IMPORTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['ID_CABECERA'].AsInteger := IdNomina;
        Params.ByName['CODIGO'].AsString := Concepto;
        Params.ByName['IMPORTE'].AsFloat := Importe;
        ExecQuery;
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
        SQL.Add(' UPDATE EMP_NOMINAS_DET_DESCUENTOS ');
        SQL.Add(' SET ');
        SQL.Add(' IMPORTE = :IMPORTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['ID_CABECERA'].AsInteger := IdNomina;
        Params.ByName['CODIGO'].AsString := Concepto;
        Params.ByName['IMPORTE'].AsFloat := Importe;
        ExecQuery;
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
        SQL.Add(' UPDATE EMP_NOMINAS_DET_PARAMETROS ');
        SQL.Add(' SET ');
        SQL.Add(' IMPORTE = :IMPORTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SQL.Add(' CODIGO = :CODIGO ');
        Params.ByName['ID_CABECERA'].AsInteger := IdNomina;
        Params.ByName['CODIGO'].AsString := Concepto;
        Params.ByName['IMPORTE'].AsFloat := Importe;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominasPlantillas.QMNomPlantillaConfCalcFields(DataSet: TDataSet);
begin
  QMNomPlantillaConfGLOSA.AsString := DameGlosa(QMNomPlantillaConfCONCEPTO.AsString);
end;

function TDMNominasPlantillas.DameGlosa(Codigo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
begin
  /// Devuelve la descripcion del concepto seleccionado para la nomina.
  /// sin pasarle la tabla en el tipo

  if Empresa = 0 then
     Empresa := REntorno.Empresa;
  if Ejercicio = 0 then
     Ejercicio := REntorno.Ejercicio;
  if Canal = 0 then
     Canal := REntorno.Canal;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT GLOSA FROM EMP_CONCEPTO_HABERES  WHERE CODIGO = :CODIGO AND EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT GLOSA FROM EMP_CONCEPTO_DESCUENTOS WHERE CODIGO = :CODIGO AND EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT GLOSA FROM EMP_CONCEPTO_PARAMETROS  WHERE CODIGO = :CODIGO AND EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL ');
        SQL.Add(' UNION ');
        SQL.Add(' SELECT GLOSA FROM SYS_CONCEPTO_CONSTANTES WHERE CODIGO = :CODIGO ');
        Params.ByName['CODIGO'].AsString := Codigo;
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        ExecQuery;
        Result := FieldByName['GLOSA'].AsString;
     finally
        Free;
     end;
  end;
end;


end.
