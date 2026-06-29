unit UDMRAnaMayor;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet,
  FIBDatabase, UFIBModificados, FIBQuery, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMRAnaMayor = class(TDataModule)
     frAnaMayor: TfrHYReport;
     frDSxListaAnaMayor: TfrDBDataSet;
     DSxListaAnaMayor: TDataSource;
     xCentrosCoste: TFIBDataSetRO;
     DSxCentrosCoste: TDataSource;
     TLocal: THYTransaction;
     xCCDesde: TFIBDataSetRO;
     DSxCCDesde: TDataSource;
     xCCHasta: TFIBDataSetRO;
     DSxCCHasta: TDataSource;
     xListaAnaMayor: TFIBDataSetRO;
     frDSxCentrosCoste: TfrDBDataSet;
     QMinCentroCoste: THYFIBQuery;
     QMaxCentroCoste: THYFIBQuery;
     xSaldos: TFIBDataSetRO;
     DSxSaldos: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xListaAnaMayorRIC: TIntegerField;
     xListaAnaMayorLINEA: TIntegerField;
     xListaAnaMayorFECHA: TDateTimeField;
     xListaAnaMayorTEXTO: TFIBStringField;
     xListaAnaMayorDEBE: TFloatField;
     xListaAnaMayorHABER: TFloatField;
     xListaAnaMayorSALDO: TFloatField;
     xListaAnaMayorD_NUMERO: TIntegerField;
     xListaAnaMayorD_SERIE: TFIBStringField;
     xListaAnaMayorD_FECHA: TDateTimeField;
     xListaAnaMayorASIENTO: TIntegerField;
     xListaAnaMayorCANAL: TIntegerField;
     xListaAnaMayorTIPO: TFIBStringField;
     xListaAnaMayorCENTRO_COSTE: TFIBStringField;
     xListaAnaMayorTITULO_CC: TFIBStringField;
     xListaAnaMayorCUENTA: TFIBStringField;
     xListaAnaMayorTITULO_CUENTA: TFIBStringField;
     xListaAnaMayorIMPORTE: TFloatField;
     xSaldosDEBE: TFloatField;
     xSaldosHABER: TFloatField;
     xSaldosSALDO: TFloatField;
     xSaldosDEBE_A: TFloatField;
     xSaldosHABER_A: TFloatField;
     xSaldosSALDO_A: TFloatField;
     xSaldosSALDO_RNG: TFloatField;
     xCentrosCosteEMPRESA: TIntegerField;
     xCentrosCosteEJERCICIO: TIntegerField;
     xCentrosCosteCANAL: TIntegerField;
     xCentrosCostePLAN_CONTABLE: TFIBStringField;
     xCentrosCosteCENTRO_COSTE: TFIBStringField;
     xCentrosCosteTITULO: TFIBStringField;
     xCentrosCosteNIVEL: TIntegerField;
     xCentrosCosteDISTRIBUCION_POSTERIOR: TIntegerField;
     xCentrosCosteCENTRO_COSTE_PADRE: TFIBStringField;
     xCentrosCosteID_P: TIntegerField;
     xCentrosCosteID_CC: TIntegerField;
     xCentrosCosteID_CC_PADRE: TIntegerField;
     xPlan: TFIBDataSetRO;
     xPlanTITULO: TFIBStringField;
     DSxPlan: TDataSource;
     xPlanPLAN_CONTABLE: TFIBStringField;
     xAcumulado: TFIBDataSetRO;
     DSxAcumulado: TDataSource;
     xAcumuladoDEBE: TFloatField;
     xAcumuladoHABER: TFloatField;
     frxAnaMayor: TfrxHYReport;
     frDSxAcumulado: TfrDBDataSet;
     frDSxSaldos: TfrDBDataSet;
     TUpdate: THYTransaction;
     procedure DMRCabeceraDestroy(Sender: TObject);
     procedure frAnaMayorEnterRect(Memo: TStringList; View: TfrView);
     procedure frAnaMayorGetValue(const ParName: string; var ParValue: variant);
     procedure DMRAnaMayorCreate(Sender: TObject);
     procedure frxAnaMayorBeforePrint(Sender: TfrxReportComponent);
     procedure frxAnaMayorGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     SW: integer;
     //TotDebe, TotHaber: Double;
     Moneda: string;
     Debe_Ant, Haber_Ant: double;
     FDesde, FHasta: TDateTime;
     CC_Desde, CC_Hasta, SQL: string;
  public
     { Public declarations }

     procedure MostrarListado(Canal: integer; CCDesde, CCHasta: string; Desde: TDateTime; Hasta: TDateTime; Moneda: string; Alcance: integer; Debe_Anterior, Haber_Anterior: real; Filtrado: boolean; Modo: integer; PlanContable: string);
     procedure MostrarListadoOrdCC(Canal: integer; CCDesde, CCHasta: string; Desde: TDateTime; Hasta: TDateTime; Moneda: string; Alcance: integer; Debe_Anterior, Haber_Anterior: real; Filtrado: boolean; Modo: integer; PlanContable: string);
     procedure ActualizaCCDesde(CentroCoste: string);
     procedure ActualizaCCHasta(CentroCoste: string);
     procedure Recargar(var Min, Max: string);
     procedure CambiaTituloMoneda(monedatemp: string);
     procedure ActualizaPlanContable(Canal: integer; PlanContable: string);
  end;

var
  DMRAnaMayor : TDMRAnaMayor;

implementation

uses UEntorno, UFormGest, UDMListados, UDMMain, UUtiles;

{$R *.DFM}

procedure TDMRAnaMayor.DMRCabeceraDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMRAnaMayor.MostrarListado(Canal: integer; CCDesde, CCHasta: string; Desde: TDateTime; Hasta: TDateTime; Moneda: string; Alcance: integer; Debe_Anterior, Haber_Anterior: real; Filtrado: boolean; Modo: integer; PlanContable: string);
var
  str : string;
begin
  Self.Moneda := Moneda;
  Debe_Ant := Debe_Anterior;
  Haber_Ant := Haber_Anterior;
  FDesde := Desde;
  FHasta := Hasta;
  CC_Desde := CCDesde;
  CC_Hasta := CCHasta;

  ActualizaPlanContable(Canal, PlanContable);

  // Añadir la hora a los campos fecha
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  with xCentrosCoste do
  begin
     Close;
     SelectSQL.Text := SQL + 'order by centro_coste';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := PlanContable;
     Params.ByName['CC_DESDE'].AsString := CCDesde;
     Params.ByName['CC_HASTA'].AsString := CCHasta;
     Open;
  end;

  with xListaAnaMayor do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;

  with xAcumulado do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;

  SW := 1;
  DMListados.Cargar(605, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAnaMayor.LoadFromFIB(REntorno.Formato, str);
     frAnaMayor.PrepareReport;
     case Modo of
        0: frAnaMayor.ShowPreparedReport;
        1: frAnaMayor.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAnaMayor.LoadFromFIB(REntorno.Formato, str);
     frxAnaMayor.PrepareReport;
     case Modo of
        0: frxAnaMayor.ShowPreparedReport;
        1: frxAnaMayor.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMRAnaMayor.frAnaMayorEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     {if (Memo[0] = '[Ini]') then
    begin
      TotDebe  := 0;
      TotHaber := 0;
    end;}

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr :=
           DMMain.MascaraMoneda(Moneda);
  end;
end;

procedure TDMRAnaMayor.frAnaMayorGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Moneda' then
     ParValue := Moneda;
  //  if ParName = 'Debe' then TotDebe := TotDebe + xListaAnaMayor.FieldByName('DEBE').AsFloat;
  //  if ParName = 'Haber' then TotHaber := TotHaber + xListaAnaMayor.FieldByName('HABER').AsFloat;
  //  if ParName = 'TotDebe' then ParValue := TotDebe;
  //  if ParName = 'TotHaber' then ParValue := TotHaber;
  //  if ParName = 'TotDebe' then ParValue := xAcumuladoDEBE.AsFloat;
  //  if ParName = 'TotHaber' then ParValue := xAcumuladoHABER.AsFloat;
  //  if ParName = 'Debe_Ant' then ParValue := Debe_Ant;
  //  if ParName = 'Haber_Ant' then ParValue := Haber_Ant;
  if ParName = 'FDesde' then
     ParValue := FDesde;
  if ParName = 'FHasta' then
     ParValue := FHasta;
  if ParName = 'CCDesde' then
     ParValue := CC_Desde;
  if ParName = 'CCHasta' then
     ParValue := CC_Hasta;
  if ParName = 'FechaActual' then
     ParValue := REntorno.FechaTrab;
  if ParName = 'PlanContable' then
     ParValue := xPlanTITULO.AsString;
end;

procedure TDMRAnaMayor.DMRAnaMayorCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  SQL := xCentrosCoste.SelectSQL.Text;
end;

procedure TDMRAnaMayor.ActualizaCCDesde(CentroCoste: string);
begin
  with xCCDesde do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := CentroCoste;
     Open;
  end;
end;

procedure TDMRAnaMayor.ActualizaCCHasta(CentroCoste: string);
begin
  with xCCHasta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := CentroCoste;
     Open;
  end;
end;

procedure TDMRAnaMayor.Recargar(var Min, Max: string);
begin
  with QMinCentroCoste do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     ExecQuery;
     Min := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxCentroCoste do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     ExecQuery;
     Max := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMRAnaMayor.CambiaTituloMoneda(monedatemp: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Monedatemp;
     Open;
  end;
end;

procedure TDMRAnaMayor.ActualizaPlanContable(Canal: integer; PlanContable: string);
begin
  with xPlan do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := PlanContable;
     Open;
  end;
end;

procedure TDMRAnaMayor.MostrarListadoOrdCC(Canal: integer; CCDesde, CCHasta: string; Desde, Hasta: TDateTime; Moneda: string; Alcance: integer; Debe_Anterior, Haber_Anterior: real; Filtrado: boolean; Modo: integer; PlanContable: string);
var
  str : string;
begin
  Self.Moneda := Moneda;
  Debe_Ant := Debe_Anterior;
  Haber_Ant := Haber_Anterior;
  FDesde := Desde;
  FHasta := Hasta;
  CC_Desde := CCDesde;
  CC_Hasta := CCHasta;

  ActualizaPlanContable(Canal, PlanContable);

  // Añadir la hora a los campos fecha
  Desde := HourIntoDate(Desde, '00:00:00');
  Hasta := HourIntoDate(Hasta, '23:59:59');

  with xCentrosCoste do
  begin
     Close;
     SelectSQL.Text := SQL + 'order by nivel,centro_coste';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := PlanContable;
     Params.ByName['CC_DESDE'].AsString := CCDesde;
     Params.ByName['CC_HASTA'].AsString := CCHasta;
     Open;
  end;

  with xListaAnaMayor do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;

  with xAcumulado do
  begin
     Close;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Open;
  end;

  SW := 1;
  DMListados.Cargar(601, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAnaMayor.LoadFromFIB(REntorno.Formato, str);
     frAnaMayor.PrepareReport;
     case Modo of
        0: frAnaMayor.ShowPreparedReport;
        1: frAnaMayor.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAnaMayor.LoadFromFIB(REntorno.Formato, str);
     frxAnaMayor.PrepareReport;
     case Modo of
        0: frxAnaMayor.ShowPreparedReport;
        1: frxAnaMayor.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMRAnaMayor.frxAnaMayorBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := DMMain.MascaraMoneda(Moneda);
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRAnaMayor.frxAnaMayorGetValue(const VarName: string; var Value: variant);
begin
  frAnaMayorGetValue(VarName, Value);
end;

end.
