unit UDMRMayor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet,
  FIBDatabase, UFIBModificados, FIBQuery, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, ComCtrls;

type
  TDMRMayor = class(TDataModule)
     frMayor: TfrHYReport;
     frDSxListaMayor: TfrDBDataSet;
     DSxListaMayor: TDataSource;
     xCuentas: TFIBDataSetRO;
     DSxCuentas: TDataSource;
     TLocal: THYTransaction;
     xListaMayor: TFIBDataSetRO;
     frDSxCuentas: TfrDBDataSet;
     xSaldos: TFIBDataSetRO;
     DSxSaldos: TDataSource;
     frxMayor: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRCabeceraDestroy(Sender: TObject);
     procedure frMayorEnterRect(Memo: TStringList; View: TfrView);
     procedure frMayorGetValue(const ParName: string; var ParValue: variant);
     procedure DMRMayorCreate(Sender: TObject);
     procedure frxMayorBeforePrint(Sender: TfrxReportComponent);
     procedure frxMayorGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     SW: integer;
     TotDebe, TotHaber: double;
     Moneda: string;
     Debe_Ant, Haber_Ant: double;
     FDesde, FHasta: TDateTime;
     Cu_Desde, Cu_Hasta: string;
     D1, D2, D3, D4, D5: string; // Centro de Coste
  public
     { Public declarations }
     SaldoCero: integer;
     procedure MostrarListado(Canal: integer; CuentaDesde, CuentaHasta: string; Desde: TDateTime; Hasta: TDateTime; Moneda: string; Alcance: integer; Debe_Anterior, Haber_Anterior: real; Filtrado: boolean; Modo: integer; DI1, DI2, DI3, DI4, DI5: string; Nivel: integer = 0; Archivo: string = ''; PBListado: TProgressBar = nil);
     procedure Recargar(var Min, Max: string);
     procedure ExportarFichero(Fichero: string; CuentaDesde, CuentaHasta: string; Desde: TDateTime; Hasta: TDateTime; PBListado: TProgressBar = nil);
  end;

var
  DMRMayor : TDMRMayor;

implementation

uses UEntorno, UFormGest, UDMListados, UDMMain, UUtiles, UHojaCalc,
  UFSendCorreo;

{$R *.DFM}

procedure TDMRMayor.DMRMayorCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  SaldoCero := 1;
end;

procedure TDMRMayor.DMRCabeceraDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRMayor.MostrarListado(Canal: integer; CuentaDesde, CuentaHasta: string; Desde: TDateTime; Hasta: TDateTime; Moneda: string; Alcance: integer; Debe_Anterior, Haber_Anterior: real; Filtrado: boolean; Modo: integer; DI1, DI2, DI3, DI4, DI5: string; Nivel: integer = 0; Archivo: string = ''; PBListado: TProgressBar = nil);
begin
  // Añadir la hora a los campos fecha
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  Self.Moneda := Moneda;
  Debe_Ant := Debe_Anterior;
  Haber_Ant := Haber_Anterior;
  FDesde := Desde;
  FHasta := Hasta;
  Cu_Desde := CuentaDesde;
  Cu_Hasta := CuentaHasta;
  // Centro de Coste
  D1 := DI1;
  D2 := DI2;
  D3 := DI3;
  D4 := DI4;
  D5 := DI5;

  with xCuentas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM CON_CUENTAS ');
     SelectSQL.Add('WHERE ');
     SelectSQL.Add('EMPRESA=?EMPRESA AND ');
     SelectSQL.Add('EJERCICIO=?EJERCICIO AND ');
     SelectSQL.Add('CANAL=?CANAL AND ');
     SelectSQL.Add('CUENTA>=?CUENTA_DESDE AND ');
     SelectSQL.Add('CUENTA<=?CUENTA_HASTA AND ');
     SelectSQL.Add('PGC=?PGC ');

     if (Nivel > 0) then
        SelectSQL.Add('AND NIVEL=?NIVEL ');

     SelectSQL.Add('ORDER BY CUENTA ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['CUENTA_DESDE'].AsString := CuentaDesde;
     Params.ByName['CUENTA_HASTA'].AsString := CuentaHasta + 'z'; // para obtener todas las cuentas que empiecen por esta cuenta
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;

     if (Nivel > 0) then
        Params.ByName['NIVEL'].AsInteger := Nivel;
     Open;
  end;

  with xListaMayor do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Params.ByName['D1'].AsString := D1;
     Params.ByName['D2'].AsString := D2;
     Params.ByName['D3'].AsString := D3;
     Params.ByName['D4'].AsString := D4;
     Params.ByName['D5'].AsString := D5;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;

  SW := 1;

  if (Modo in [0, 1]) then
     DMListados.Imprimir(4, 0, Modo, '', _('Mayor'), frMayor, frxMayor, nil);

  if (Modo = 2) then
  begin
     ExportarFichero(Archivo, CuentaDesde, CuentaHasta, Desde, Hasta, PBListado);
  end;
end;

procedure TDMRMayor.frMayorEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = '[Ini]') then
     begin
        TotDebe := 0;
        TotHaber := 0;
     end;

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr :=
           DMMain.MascaraMoneda(Moneda);
  end;
end;

procedure TDMRMayor.frMayorGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Moneda' then
     ParValue := Moneda;
  if ParName = 'Debe' then
     TotDebe := TotDebe + xListaMayor.FieldByName('DEBE').AsFloat;
  if ParName = 'Haber' then
     TotHaber := TotHaber + xListaMayor.FieldByName('HABER').AsFloat;
  if ParName = 'TotDebe' then
     ParValue := TotDebe;
  if ParName = 'TotHaber' then
     ParValue := TotHaber;
  if ParName = 'Debe_Ant' then
     ParValue := Debe_Ant;
  if ParName = 'Haber_Ant' then
     ParValue := Haber_Ant;
  if ParName = 'FDesde' then
     ParValue := FDesde;
  if ParName = 'FHasta' then
     ParValue := FHasta;
  if ParName = 'CuDesde' then
     ParValue := Cu_Desde;
  if ParName = 'CuHasta' then
     ParValue := Cu_Hasta;
  if ParName = 'FechaActual' then
     ParValue := REntorno.FechaTrab;
  if ParName = 'SaldoCero' then
     ParValue := SaldoCero;
  // Centro de Coste
  if ParName = 'Digito1' then
     ParValue := D1;
  if ParName = 'Digito2' then
     ParValue := D2;
  if ParName = 'Digito3' then
     ParValue := D3;
  if ParName = 'Digito4' then
     ParValue := D4;
  if ParName = 'Digito5' then
     ParValue := D5;
end;

procedure TDMRMayor.Recargar(var Min, Max: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(CUENTA), MAX(CUENTA) FROM CON_CUENTAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' TIPO = 5 AND ');
        SQL.Add(' PGC = ?PGC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PGC'].AsInteger := REntorno.Pgc;
        ExecQuery;
        Min := FieldByName['MIN'].AsString;
        Max := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRMayor.frxMayorBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[Ini]', Memo[0]) > 0 then
           begin
              TotDebe := 0;
              TotHaber := 0;
           end;
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := DMMain.MascaraMoneda(Moneda);
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRMayor.frxMayorGetValue(const VarName: string; var Value: variant);
begin
  frMayorGetValue(VarName, Value);
end;

procedure TDMRMayor.ExportarFichero(Fichero: string; CuentaDesde, CuentaHasta: string; Desde: TDateTime; Hasta: TDateTime; PBListado: TProgressBar = nil);
var
  HCalc : THojaCalc;
  Pagina, Cantidad, Procesadas, c, f : integer;
begin
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Exportado Fichero ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando datos ...'));

     // Borro fichero antes de volver a crearlo.
     DeleteFile(Fichero);

     // Exportacion de Mayor a Excel
     if (UpperCase(ExtractFileExt(Fichero)) = '.ODS') then
        HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
     else
        HCalc := THojaCalc.Create(thcExcel, False);

     try
        Application.ProcessMessages;
        HCalc.FileName := Fichero; //Needs a file name before you SaveDoc!

        Pagina := 1;
        f := 1;

        HCalc.ActiveSheetName := format(_('Pagina %d'), [Pagina]);
        HCalc.RemoveAllSheetsExcept(format(_('Pagina %d'), [Pagina]), False);

        HCalc.CellText[f, 1] := _('Empresa');
        HCalc.CellText[f, 2] := REntorno.NombreEmpresa;
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);

        HCalc.CellText[f, 1] := _('NIF');
        HCalc.CellText[f, 2] := REntorno.CifEmpresa;
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);

        HCalc.CellText[f, 1] := _('Fechas');
        HCalc.CellText[f, 2] := format(_('Desde %s Hasta %s'), [DateToStr(Desde), DateToStr(Hasta)]);
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);

        HCalc.CellText[f, 1] := _('Cuentas');
        HCalc.CellText[f, 2] := format(_('Desde %s Hasta %s'), [CuentaDesde, CuentaHasta]);
        for c := 1 to 3 do
        begin
           HCalc.Bold(f, c);
           HCalc.BackgroundColor(f, c, clSilver);
        end;
        Inc(f);
        Inc(f);

        xCuentas.FetchAll;
        Procesadas := 0;
        Cantidad := xCuentas.RecordCount;
        if Assigned(PBListado) then
        begin
           PBListado.Position := 0;
           PBListado.Visible := True;
           Application.ProcessMessages;
           PBListado.Max := Cantidad;
        end;

        xCuentas.First;
        while not xCuentas.EOF do
        begin
           // Nueva pagina despues de la linea 50000 ya que Excel viejo solo puede tratar 65535 líneas
           if (f > 50000) then
           begin
              HCalc.ColNumberFormat(5, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
              HCalc.ColNumberFormat(6, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
              HCalc.ColNumberFormat(7, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

              for c := 1 to 10 do
                 HCalc.AutoFit(c);

              Inc(Pagina);
              if (HCalc.Document.Sheets.Count < Pagina) then
              begin
                 HCalc.AddNewSheet(format(_('Pagina %d'), [Pagina]));
                 HCalc.ActivateSheetByName(format(_('Pagina %d'), [Pagina]), False);
              end
              else
              begin
                 HCalc.ActivateSheetByNAme(format(_('Pagina %d'), [Pagina]), False);
                 HCalc.ActiveSheetName := format(_('Pagina %d'), [Pagina]);
              end;

              f := 1;

              HCalc.CellText[f, 1] := _('Empresa');
              HCalc.CellText[f, 2] := REntorno.NombreEmpresa;
              for c := 1 to 3 do
              begin
                 HCalc.Bold(f, c);
                 HCalc.BackgroundColor(f, c, clSilver);
              end;
              Inc(f);

              HCalc.CellText[f, 1] := _('NIF');
              HCalc.CellText[f, 2] := REntorno.CifEmpresa;
              for c := 1 to 3 do
              begin
                 HCalc.Bold(f, c);
                 HCalc.BackgroundColor(f, c, clSilver);
              end;
              Inc(f);

              HCalc.CellText[f, 1] := _('Fechas');
              HCalc.CellText[f, 2] := format(_('Desde %s Hasta %s'), [DateToStr(Desde), DateToStr(Hasta)]);
              for c := 1 to 3 do
              begin
                 HCalc.Bold(f, c);
                 HCalc.BackgroundColor(f, c, clSilver);
              end;
              Inc(f);

              HCalc.CellText[f, 1] := _('Cuentas');
              HCalc.CellText[f, 2] := format(_('Desde %s Hasta %s'), [CuentaDesde, CuentaHasta]);
              for c := 1 to 3 do
              begin
                 HCalc.Bold(f, c);
                 HCalc.BackgroundColor(f, c, clSilver);
              end;
              Inc(f);
              Inc(f);
           end;

           // Solo las cuentas que tienen movimientos
           xListaMayor.FetchAll;
           if (xListaMayor.RecordCount > 0) then
           begin
              // Progreso
              FSendCorreo.Texto(format(_('%d de %d - Cuenta: %s - Pagina: %d - Fila: %d'), [Procesadas, Cantidad, xCuentas.FieldByName('CUENTA').AsString, Pagina, f]));

              HCalc.CellText[f, 1] := xCuentas.FieldByName('CUENTA').AsString;
              HCalc.CellText[f, 2] := xCuentas.FieldByName('TITULO').AsString;
              for c := 1 to 10 do
              begin
                 HCalc.Bold(f, c);
                 HCalc.BackgroundColor(f, c, clSilver);
              end;
              Inc(f);

              HCalc.CellText[f, 1] := 'Asiento';
              HCalc.CellText[f, 2] := 'Texto';
              HCalc.CellText[f, 3] := 'Linea';
              HCalc.CellText[f, 4] := 'Fecha';
              HCalc.CellText[f, 5] := 'Debe';
              HCalc.CellText[f, 6] := 'Haber';
              HCalc.CellText[f, 7] := 'Saldo';
              HCalc.CellText[f, 8] := 'Doc. Serie';
              HCalc.CellText[f, 9] := 'Doc. Nro.';
              HCalc.CellText[f, 10] := 'Doc. Fecha';
              for c := 1 to 10 do
                 HCalc.Bold(f, c);
              Inc(f);

              while not xListaMayor.EOF do
              begin
                 HCalc.CellText[f, 1] := xListaMayor.FieldByName('ASIENTO').AsString;
                 HCalc.CellText[f, 2] := xListaMayor.FieldByName('TEXTO').AsString;
                 HCalc.CellText[f, 3] := xListaMayor.FieldByName('LINEA').AsString;
                 HCalc.CellText[f, 4] := DateToStr(xListaMayor.FieldByName('FECHA').AsDateTime);
                 HCalc.SendNumber(f, 5, xListaMayor.FieldByName('DEBE').AsFloat);
                 HCalc.SendNumber(f, 6, xListaMayor.FieldByName('HABER').AsFloat);
                 HCalc.SendNumber(f, 7, xListaMayor.FieldByName('SALDO').AsFloat);
                 if (xListaMayor.FieldByName('D_NUMERO').AsInteger <> 0) then
                 begin
                    HCalc.CellText[f, 8] := xListaMayor.FieldByName('D_SERIE').AsString;
                    HCalc.CellText[f, 9] := xListaMayor.FieldByName('D_NUMERO').AsString;
                    HCalc.CellText[f, 10] := DateToStr(xListaMayor.FieldByName('D_FECHA').AsDateTime);
                 end;
                 Inc(f);

                 xListaMayor.Next;
              end;

              // HCalc.CellText[f, 1] := '';
              HCalc.CellText[f, 2] := 'Total Asiento';
              // HCalc.CellText[f, 3] := '';
              // HCalc.CellText[f, 4] := '';
              HCalc.SendNumber(f, 5, xSaldos.FieldByName('DEBE').AsFloat);
              HCalc.SendNumber(f, 6, xSaldos.FieldByName('HABER').AsFloat);
              HCalc.SendNumber(f, 7, xSaldos.FieldByName('SALDO').AsFloat);

              for c := 5 to 7 do
                 HCalc.Bold(f, c);

              Inc(f);
              Inc(f);
           end;

           Inc(Procesadas);
           if Assigned(PBListado) then
           begin
              PBListado.Position := Procesadas;
              Application.ProcessMessages;
           end;

           xCuentas.Next;
        end;

        HCalc.ColNumberFormat(5, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(6, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(7, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

        for c := 1 to 10 do
           HCalc.AutoFit(c);

        HCalc.SaveDocAs(Fichero, (Pos('.XLS', UpperCase(ExtractFileExt(Fichero))) > 0));
        Application.ProcessMessages;
     finally
        Sleep(1000);
        Application.ProcessMessages;
        HCalc.Free;

        if Assigned(PBListado) then
           PBListado.Visible := False;

        // FPregLibroDiarioConta.Progreso('');
     end;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

end.
