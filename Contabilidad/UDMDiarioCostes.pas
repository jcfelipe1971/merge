unit UDMDiarioCostes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMDiarioCostes = class(TDataModule)
     QMDiarioCostes: TFIBTableSet;
     DSQMDiarioCostes: TDataSource;
     TLocal: THYTransaction;
     DSQMDiarioCostesT: TDataSource;
     QMDiarioCostesEMPRESA: TIntegerField;
     QMDiarioCostesEJERCICIO: TIntegerField;
     QMDiarioCostesCANAL: TIntegerField;
     QMDiarioCostesRIC: TIntegerField;
     QMDiarioCostesLINEA: TIntegerField;
     QMDiarioCostesDIGITO_1: TFIBStringField;
     QMDiarioCostesDIGITO_2: TFIBStringField;
     QMDiarioCostesDIGITO_3: TFIBStringField;
     QMDiarioCostesDIGITO_4: TFIBStringField;
     QMDiarioCostesDIGITO_5: TFIBStringField;
     QMDiarioCostesSUBLINEA: TIntegerField;
     QMDiarioCostesIMPORTE: TFloatField;
     QMDiarioCostesPCOSTE: TFloatField;
     QMDiarioCostesCUENTA: TFIBStringField;
     QMDiarioCostesTITULO_CUENTA: TFIBStringField;
     QMDiarioCostesSIGNO: TFIBStringField;
     QMDiarioCostesTEXTO: TFIBStringField;
     QMDiarioCostesFECHA: TDateTimeField;
     QMDiarioCostesPGC: TIntegerField;
     TUpdate: THYTransaction;
     QMDiarioCostesT: TFIBDataSetRO;
     QMDiarioCostesTTIMPORTE: TFloatField;
     QMDiarioCostesRESTRICCION: TIntegerField;
     QMDiarioCostesASIENTO: TIntegerField;
     DSQMAsientosSinCCoste: TDataSource;
     QMAsientosSinCCoste: TFIBDataSetRO;
     QMAsientosSinCCosteEMPRESA: TIntegerField;
     QMAsientosSinCCosteEJERCICIO: TIntegerField;
     QMAsientosSinCCosteCANAL: TIntegerField;
     QMAsientosSinCCosteRIC: TIntegerField;
     QMAsientosSinCCosteASIENTO: TIntegerField;
     QMAsientosSinCCosteLINEA: TIntegerField;
     QMAsientosSinCCosteCUENTA: TFIBStringField;
     QMAsientosSinCCosteSIGNO: TFIBStringField;
     QMAsientosSinCCosteTEXTO: TFIBStringField;
     QMAsientosSinCCosteFECHA: TDateTimeField;
     QMAsientosSinCCosteDIGITO_1: TFIBStringField;
     QMAsientosSinCCosteDIGITO_2: TFIBStringField;
     QMAsientosSinCCosteDIGITO_3: TFIBStringField;
     QMAsientosSinCCosteDIGITO_4: TFIBStringField;
     QMAsientosSinCCosteDIGITO_5: TFIBStringField;
     QMAsientosSinCCosteSUBLINEA: TIntegerField;
     QMAsientosSinCCosteIMPORTE: TFloatField;
     QMAsientosSinCCostePCOSTE: TFloatField;
     QMAsientosSinCCostePGC: TIntegerField;
     QMAsientosSinCCosteRESTRICCION: TIntegerField;
     QMAsientosSinCCosteTITULO_CUENTA: TFIBStringField;
     DSQMResumen: TDataSource;
     QMResumen: TFIBDataSetRO;
     QMResumenENTRADA: TIntegerField;
     QMResumenEMPRESA: TIntegerField;
     QMResumenEJERCICIO: TIntegerField;
     QMResumenCANAL: TIntegerField;
     QMResumenCUENTA: TFIBStringField;
     QMResumenNIVEL: TIntegerField;
     QMResumenNUM_DIGITO: TIntegerField;
     QMResumenD1: TFIBStringField;
     QMResumenI1: TFloatField;
     QMResumenD2: TFIBStringField;
     QMResumenI2: TFloatField;
     QMResumenD3: TFIBStringField;
     QMResumenI3: TFloatField;
     QMResumenD4: TFIBStringField;
     QMResumenI4: TFloatField;
     QMResumenD5: TFIBStringField;
     QMResumenI5: TFloatField;
     QMResumenD6: TFIBStringField;
     QMResumenI6: TFloatField;
     QMResumenD7: TFIBStringField;
     QMResumenI7: TFloatField;
     QMResumenD8: TFIBStringField;
     QMResumenI8: TFloatField;
     QMResumenD9: TFIBStringField;
     QMResumenI9: TFloatField;
     QMResumenD10: TFIBStringField;
     QMResumenI10: TFloatField;
     QMResumenD11: TFIBStringField;
     QMResumenI11: TFloatField;
     QMResumenD12: TFIBStringField;
     QMResumenI12: TFloatField;
     QMResumenD13: TFIBStringField;
     QMResumenI13: TFloatField;
     QMResumenD14: TFIBStringField;
     QMResumenI14: TFloatField;
     QMResumenD15: TFIBStringField;
     QMResumenI15: TFloatField;
     QMResumenD16: TFIBStringField;
     QMResumenI16: TFloatField;
     QMResumenD17: TFIBStringField;
     QMResumenI17: TFloatField;
     QMResumenD18: TFIBStringField;
     QMResumenI18: TFloatField;
     QMResumenD19: TFIBStringField;
     QMResumenI19: TFloatField;
     QMResumenD20: TFIBStringField;
     QMResumenI20: TFloatField;
     QMResumenD21: TFIBStringField;
     QMResumenI21: TFloatField;
     QMResumenD22: TFIBStringField;
     QMResumenI22: TFloatField;
     QMResumenD23: TFIBStringField;
     QMResumenI23: TFloatField;
     QMResumenD24: TFIBStringField;
     QMResumenI24: TFloatField;
     QMResumenD25: TFIBStringField;
     QMResumenI25: TFloatField;
     QMResumenD26: TFIBStringField;
     QMResumenI26: TFloatField;
     QMResumenD27: TFIBStringField;
     QMResumenI27: TFloatField;
     QMResumenD28: TFIBStringField;
     QMResumenI28: TFloatField;
     QMResumenD29: TFIBStringField;
     QMResumenI29: TFloatField;
     QMResumenD30: TFIBStringField;
     QMResumenI30: TFloatField;
     QMResumenTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(Cuenta, d1, d2, d3, d4, d5: string; Desde, Hasta: TDateTime);
     procedure AbreAsientosSinCCoste;
     procedure CalcularResumen(Desde, Hasta: TDateTime; Nivel: integer);
  end;

var
  DMDiarioCostes : TDMDiarioCostes;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, HYFIBQuery;

{$R *.dfm}

procedure TDMDiarioCostes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDiarioCostesIMPORTE.DisplayFormat := MascaraN;
  QMDiarioCostesPCOSTE.DisplayFormat := MascaraN;
  QMDiarioCostesTTIMPORTE.DisplayFormat := MascaraN;
  QMAsientosSinCCosteIMPORTE.DisplayFormat := MascaraN;
  QMAsientosSinCCostePCOSTE.DisplayFormat := MascaraN;
  QMResumenI1.DisplayFormat := MascaraN;
  QMResumenI2.DisplayFormat := MascaraN;
  QMResumenI3.DisplayFormat := MascaraN;
  QMResumenI4.DisplayFormat := MascaraN;
  QMResumenI5.DisplayFormat := MascaraN;
  QMResumenI6.DisplayFormat := MascaraN;
  QMResumenI7.DisplayFormat := MascaraN;
  QMResumenI8.DisplayFormat := MascaraN;
  QMResumenI9.DisplayFormat := MascaraN;
  QMResumenI10.DisplayFormat := MascaraN;
  QMResumenI11.DisplayFormat := MascaraN;
  QMResumenI12.DisplayFormat := MascaraN;
  QMResumenI13.DisplayFormat := MascaraN;
  QMResumenI14.DisplayFormat := MascaraN;
  QMResumenI15.DisplayFormat := MascaraN;
  QMResumenI16.DisplayFormat := MascaraN;
  QMResumenI17.DisplayFormat := MascaraN;
  QMResumenI18.DisplayFormat := MascaraN;
  QMResumenI19.DisplayFormat := MascaraN;
  QMResumenI20.DisplayFormat := MascaraN;
  QMResumenI21.DisplayFormat := MascaraN;
  QMResumenI22.DisplayFormat := MascaraN;
  QMResumenI23.DisplayFormat := MascaraN;
  QMResumenI24.DisplayFormat := MascaraN;
  QMResumenI25.DisplayFormat := MascaraN;
  QMResumenI26.DisplayFormat := MascaraN;
  QMResumenI27.DisplayFormat := MascaraN;
  QMResumenI28.DisplayFormat := MascaraN;
  QMResumenI29.DisplayFormat := MascaraN;
  QMResumenI30.DisplayFormat := MascaraN;
end;

procedure TDMDiarioCostes.Filtra(Cuenta, d1, d2, d3, d4, d5: string; Desde, Hasta: TDateTime);
begin
  {Diario de Centro de Costes}
  with QMDiarioCostes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Trim(Cuenta);
     Params.ByName['DIGITO_1'].AsString := Trim(d1);
     Params.ByName['DIGITO_2'].AsString := Trim(d2);
     Params.ByName['DIGITO_3'].AsString := Trim(d3);
     Params.ByName['DIGITO_4'].AsString := Trim(d4);
     Params.ByName['DIGITO_5'].AsString := Trim(d5);
     Params.ByName['DESDE'].AsDateTime := HourIntoDate(Desde, '00:00:00');
     Params.ByName['HASTA'].AsDateTime := HourIntoDate(Hasta, '23:59:59');
     Params.ByName['RESTRICCION'].AsInteger := BoolToInt(not REntorno.ContabilidadRestringida);
     Open;
  end;

  {Totales}
  with QMDiarioCostesT do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Trim(Cuenta);
     Params.ByName['DIGITO_1'].AsString := Trim(d1);
     Params.ByName['DIGITO_2'].AsString := Trim(d2);
     Params.ByName['DIGITO_3'].AsString := Trim(d3);
     Params.ByName['DIGITO_4'].AsString := Trim(d4);
     Params.ByName['DIGITO_5'].AsString := Trim(d5);
     Params.ByName['DESDE'].AsDateTime := HourIntoDate(Desde, '00:00:00');
     Params.ByName['HASTA'].AsDateTime := HourIntoDate(Hasta, '23:59:59');
     Params.ByName['RESTRICCION'].AsInteger := BoolToInt(not REntorno.ContabilidadRestringida);
     Open;
  end;
end;

procedure TDMDiarioCostes.AbreAsientosSinCCoste;
begin
  with QMAsientosSinCCoste do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['RESTRICCION'].AsInteger := BoolToInt(not REntorno.ContabilidadRestringida);
     Open;
  end;
end;

procedure TDMDiarioCostes.CalcularResumen(Desde, Hasta: TDateTime; Nivel: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LST_CENTRO_COSTE(?ENTRADA, ?EMPRESA, ?EJERCICIO, ?DCANAL, ?HCANAL, ?DESDE, ?HASTA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['DCANAL'].AsInteger := REntorno.Canal;
        Params.ByName['HCANAL'].AsInteger := REntorno.Canal;
        Params.ByName['DESDE'].AsDateTime := HourIntoDate(Desde, '00:00:00');
        Params.ByName['HASTA'].AsDateTime := HourIntoDate(Hasta, '23:59:59');
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  with QMResumen do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT T.*, C.TITULO FROM TMP_CENTROS_COSTE_2 T ');
     SelectSQL.Add(' JOIN CON_CUENTAS C ');
     SelectSQL.Add(' ON ');
     SelectSQL.Add(' T.EMPRESA = C.EMPRESA AND ');
     SelectSQL.Add(' T.EJERCICIO = C.EJERCICIO AND ');
     SelectSQL.Add(' T.CANAL = C.CANAL AND ');
     SelectSQL.Add(' T.CUENTA = C.CUENTA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' T.ENTRADA = ?ENTRADA AND ');
     SelectSQL.Add(' C.PGC = ?PGC ');
     if (Nivel > 0) then
        SelectSQL.Add(' AND C.NIVEL = ?NIVEL ');
     SelectSQL.Add(' ORDER BY C.CUENTA, C.NIVEL ');
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['PGC'].AsInteger := REntorno.PGC;
     if (Nivel > 0) then
        Params.ByName['NIVEL'].AsInteger := Nivel;
     Open;
  end;
end;

end.
