unit UDMPrevisionCuentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery, ComCtrls, Dialogs;

type
  TDMPrevisionCuentas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPrevisionCuentas: TFIBTableSet;
     DSQMPrevisionCuentas: TDataSource;
     QMPrevisionCuentasEMPRESA: TIntegerField;
     QMPrevisionCuentasEJERCICIO: TIntegerField;
     QMPrevisionCuentasCANAL: TIntegerField;
     QMPrevisionCuentasCUENTA: TFIBStringField;
     QMPrevisionCuentasCUENTA_PGC: TIntegerField;
     QMPrevisionCuentasTITULO_CUENTA: TFIBStringField;
     QMPrevisionCuentasPREVISION_01: TFloatField;
     QMPrevisionCuentasSALDO_01: TFloatField;
     QMPrevisionCuentasDIFERENCIA_01: TFloatField;
     QMPrevisionCuentasPREVISION_02: TFloatField;
     QMPrevisionCuentasSALDO_02: TFloatField;
     QMPrevisionCuentasDIFERENCIA_02: TFloatField;
     QMPrevisionCuentasPREVISION_03: TFloatField;
     QMPrevisionCuentasSALDO_03: TFloatField;
     QMPrevisionCuentasDIFERENCIA_03: TFloatField;
     QMPrevisionCuentasPREVISION_04: TFloatField;
     QMPrevisionCuentasSALDO_04: TFloatField;
     QMPrevisionCuentasDIFERENCIA_04: TFloatField;
     QMPrevisionCuentasPREVISION_05: TFloatField;
     QMPrevisionCuentasSALDO_05: TFloatField;
     QMPrevisionCuentasDIFERENCIA_05: TFloatField;
     QMPrevisionCuentasPREVISION_06: TFloatField;
     QMPrevisionCuentasSALDO_06: TFloatField;
     QMPrevisionCuentasDIFERENCIA_06: TFloatField;
     QMPrevisionCuentasPREVISION_07: TFloatField;
     QMPrevisionCuentasSALDO_07: TFloatField;
     QMPrevisionCuentasDIFERENCIA_07: TFloatField;
     QMPrevisionCuentasPREVISION_08: TFloatField;
     QMPrevisionCuentasSALDO_08: TFloatField;
     QMPrevisionCuentasDIFERENCIA_08: TFloatField;
     QMPrevisionCuentasPREVISION_09: TFloatField;
     QMPrevisionCuentasSALDO_09: TFloatField;
     QMPrevisionCuentasDIFERENCIA_09: TFloatField;
     QMPrevisionCuentasPREVISION_10: TFloatField;
     QMPrevisionCuentasSALDO_10: TFloatField;
     QMPrevisionCuentasDIFERENCIA_10: TFloatField;
     QMPrevisionCuentasPREVISION_11: TFloatField;
     QMPrevisionCuentasSALDO_11: TFloatField;
     QMPrevisionCuentasDIFERENCIA_11: TFloatField;
     QMPrevisionCuentasPREVISION_12: TFloatField;
     QMPrevisionCuentasSALDO_12: TFloatField;
     QMPrevisionCuentasDIFERENCIA_12: TFloatField;
     QMPrevisionCuentasPREVISION_20: TFloatField;
     QMPrevisionCuentasSALDO_20: TFloatField;
     QMPrevisionCuentasDIFERENCIA_20: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure DistribuyePrevision(Importe: double);
     procedure ActualizaCuentasPrevision;
     procedure ExportaAExcel(ProgressBar: TProgressBar);
  end;

var
  DMPrevisionCuentas : TDMPrevisionCuentas;

implementation

uses
  UDMMain, UEntorno, UHojaCalc, UUtiles, Forms, UDameDato;

{$R *.dfm}

procedure TDMPrevisionCuentas.DataModuleCreate(Sender: TObject);
var
  i : integer;
  LocalMascaraN : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Mascaras y DisplayLabel
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  for i := 1 to 12 do
  begin
     TFloatField(QMPrevisionCuentas.FieldByName(format('PREVISION_%.2d', [i]))).DisplayFormat := LocalMascaraN;
     TFloatField(QMPrevisionCuentas.FieldByName(format('SALDO_%.2d', [i]))).DisplayFormat := LocalMascaraN;
     TFloatField(QMPrevisionCuentas.FieldByName(format('DIFERENCIA_%.2d', [i]))).DisplayFormat := LocalMascaraN;

     TFloatField(QMPrevisionCuentas.FieldByName(format('PREVISION_%.2d', [i]))).DisplayLabel := DameTituloPeriodo(format('%.2d', [i]));
  end;

  i := 20;
  TFloatField(QMPrevisionCuentas.FieldByName(format('PREVISION_%.2d', [i]))).DisplayFormat := LocalMascaraN;
  TFloatField(QMPrevisionCuentas.FieldByName(format('SALDO_%.2d', [i]))).DisplayFormat := LocalMascaraN;
  TFloatField(QMPrevisionCuentas.FieldByName(format('DIFERENCIA_%.2d', [i]))).DisplayFormat := LocalMascaraN;

  DMMain.FiltraTabla(QMPrevisionCuentas, '11100', True);
end;

procedure TDMPrevisionCuentas.DataModuleDestroy(Sender: TObject);
begin
  QMPrevisionCuentas.Close;
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMPrevisionCuentas.DistribuyePrevision(Importe: double);
var
  Prevision : double;
begin
  Prevision := Round(Importe / 12);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE CON_CUENTAS_PREVISIONES ');
        SQL.Add(' SET PREVISION_01 = :PREVISION_01, ');
        SQL.Add('     PREVISION_02 = :PREVISION_02, ');
        SQL.Add('     PREVISION_03 = :PREVISION_03, ');
        SQL.Add('     PREVISION_04 = :PREVISION_04, ');
        SQL.Add('     PREVISION_05 = :PREVISION_05, ');
        SQL.Add('     PREVISION_06 = :PREVISION_06, ');
        SQL.Add('     PREVISION_07 = :PREVISION_07, ');
        SQL.Add('     PREVISION_08 = :PREVISION_08, ');
        SQL.Add('     PREVISION_09 = :PREVISION_09, ');
        SQL.Add('     PREVISION_10 = :PREVISION_10, ');
        SQL.Add('     PREVISION_11 = :PREVISION_11, ');
        SQL.Add('     PREVISION_12 = :PREVISION_12 ');
        SQL.Add(' WHERE EMPRESA = :EMPRESA AND ');
        SQL.Add('       EJERCICIO = :EJERCICIO AND ');
        SQL.Add('       CANAL = :CANAL AND ');
        SQL.Add('       CUENTA = :CUENTA ');
        Params.ByName['EMPRESA'].AsInteger := QMPrevisionCuentasEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPrevisionCuentasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPrevisionCuentasCANAL.AsInteger;
        Params.ByName['CUENTA'].AsString := QMPrevisionCuentasCUENTA.AsString;
        Params.ByName['PREVISION_01'].AsFloat := Prevision;
        Params.ByName['PREVISION_02'].AsFloat := Prevision;
        Params.ByName['PREVISION_03'].AsFloat := Prevision;
        Params.ByName['PREVISION_04'].AsFloat := Prevision;
        Params.ByName['PREVISION_05'].AsFloat := Prevision;
        Params.ByName['PREVISION_06'].AsFloat := Prevision;
        Params.ByName['PREVISION_07'].AsFloat := Prevision;
        Params.ByName['PREVISION_08'].AsFloat := Prevision;
        Params.ByName['PREVISION_09'].AsFloat := Prevision;
        Params.ByName['PREVISION_10'].AsFloat := Prevision;
        Params.ByName['PREVISION_11'].AsFloat := Prevision;
        Params.ByName['PREVISION_12'].AsFloat := Prevision;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMPrevisionCuentas.Refresh;
end;

procedure TDMPrevisionCuentas.ActualizaCuentasPrevision;
begin
  // Actualiza saldos de cuentas presupuestarias de ultimo nivel

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_INSERTA_CUENTAS_PREVISIONES(:EMPRESA, :EJERCICIO, :CANAL) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPrevisionCuentas.Close;
  QMPrevisionCuentas.Open;
end;

procedure TDMPrevisionCuentas.ExportaAExcel(ProgressBar: TProgressBar);
var
  HCalc : THojaCalc;
  f, c, i : integer;
  Archivo : string;
begin
  inherited;
  Archivo := Format('%s_%s.xls', [_('PrevisionCuentas'), FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMPrevisionCuentas') then
  begin
     DMMain.LogIni('Exportacion Excel');
     // Esto mira si el nombre del archivo contienen .xls (.xls, .xlsx);
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcExcel, True)');
        HCalc := THojaCalc.Create(thcExcel, False);
     end
     else
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcOpenOffice, True)');
        HCalc := THojaCalc.Create(thcOpenOffice, False);
     end;
     try
        DMMain.Log('HCalc.FileName = ' + Archivo);
        HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!
        // HCalc.ActivateSheetByIndex(1);
        // HCalc.ActiveSheetName := _('NewSheet');

        // Exportacion de datos del resultado del script
        DMMain.LogIni('Exportacion de datos');
        with QMPrevisionCuentas do
        begin
           try
              DisableControls;
              i := 0;
              ProgressBar.Position := 0;
              ProgressBar.Visible := True;
              Application.ProcessMessages;
              Last;
              ProgressBar.Max := RecordCount;
              First;

              DMMain.LogIni('Exportando la cabecera del documento');
              // Titulo de la extraccion en la primera fila
              f := 1;
              HCalc.FontSize(f, 4, 12);
              HCalc.Bold(f, 4);
              HCalc.CellText[f, 4] := _('Prevision de cuentas');

              // Nombres de campos en la fila 3
              f := 3;
              for c := 0 to FieldCount - 1 do
              begin
                 HCalc.Bold(f, c + 1);
                 if (Fields[c].FieldName = 'PREVISION_01') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('01')
                 else if (Fields[c].FieldName = 'PREVISION_02') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('02')
                 else if (Fields[c].FieldName = 'PREVISION_03') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('03')
                 else if (Fields[c].FieldName = 'PREVISION_04') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('04')
                 else if (Fields[c].FieldName = 'PREVISION_05') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('05')
                 else if (Fields[c].FieldName = 'PREVISION_06') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('06')
                 else if (Fields[c].FieldName = 'PREVISION_07') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('07')
                 else if (Fields[c].FieldName = 'PREVISION_08') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('08')
                 else if (Fields[c].FieldName = 'PREVISION_09') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('09')
                 else if (Fields[c].FieldName = 'PREVISION_10') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('10')
                 else if (Fields[c].FieldName = 'PREVISION_11') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('11')
                 else if (Fields[c].FieldName = 'PREVISION_12') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('12')
                 else if (Fields[c].FieldName = 'PREVISION_20') then
                    HCalc.CellText[f, c + 1] := DameTituloPeriodo('20')
                 else
                    HCalc.CellText[f, c + 1] := Fields[c].FieldName;
                 // HCalc.CellText[f + ProgressBar.Max, c + 1] := Fields[c].FieldName;
                 DMMain.Log(Format('Se esta introducionedo titulo de celda(%d,%d) el valor: %s', [f, c, Fields[c].FieldName]));
              end;
              DMMain.LogFin('Exportando Cabeceras');

              // Exportacion de datos
              f := 4;
              while not EOF do
              begin
                 // DMMain.LogIni(Format('Exportando linea %d', [f]));
                 for c := 0 to FieldCount - 1 do
                 begin
                    if (Fields[c].AsString <> '') then
                    begin
                       if Fields[c].DataType in [ftSmallint, ftInteger, ftWord] then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsInteger)
                       else
                       if Fields[c].DataType in [ftFloat, ftCurrency] then
                          HCalc.SendNumber(f, c + 1, Fields[c].AsFloat)
                       else
                       if Fields[c].DataType in [ftDateTime, ftDate, ftTime] then
                          HCalc.SendDate(f, c + 1, Fields[c].AsDateTime)
                       else
                          HCalc.CellText[f, c + 1] := Fields[c].AsString;
                       // DMMain.Log(Format('Se esta introducionedo en celda(%d,%d) el valor: %s', [f, c, Fields[c].AsString]));
                    end;
                 end;
                 // DMMain.LogFin(Format('Exportando linea %d', [f]));

                 Next;
                 Inc(f);

                 Inc(i);
                 if (i = 100) then
                 begin
                    ProgressBar.Position := f;
                    i := 0;
                    Application.ProcessMessages;
                 end;
              end;

              First;
           finally
              EnableControls;
              ProgressBar.Visible := False;
           end;
        end;
        DMMain.LogFin('Exportacion de datos');
        DMMain.Log('HCalc.SaveDocAs');
        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        DMMain.Log('Liberar Excel');
        HCalc.Free;
     end;

     DMMain.LogFin('Exportacion Excel');
  end;
end;

end.
