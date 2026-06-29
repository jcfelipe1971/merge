unit UDMRAnaPresupuesto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSetRO,
  FIBTableDataSetRO, FIBDatabase, UFIBModificados, Fr_HYReport, FIBDataSet,
  FIBQuery, HYFIBQuery, FIBTableDataSet, frxClass, frxHYReport;

type
  TDMRAnaPresupuesto = class(TDataModule)
     DSxCcDesde: TDataSource;
     TLocal: THYTransaction;
     xCcDesde: TFIBTableSetRO;
     frDSPresupuestos: TfrDBDataSet;
     frAnaPresupuesto: TfrHYReport;
     xCcHasta: TFIBTableSetRO;
     DSxCcHasta: TDataSource;
     xPlan: TFIBDataSetRO;
     xPlanPLAN_CONTABLE: TFIBStringField;
     xPlanTITULO: TFIBStringField;
     DSxPlan: TDataSource;
     DSPresupuestos: TDataSource;
     frDSMeses: TfrDBDataSet;
     DSMeses: TDataSource;
     xCcDesdeEMPRESA: TIntegerField;
     xCcDesdeEJERCICIO: TIntegerField;
     xCcDesdeCANAL: TIntegerField;
     xCcDesdePLAN_CONTABLE: TFIBStringField;
     xCcDesdeCENTRO_COSTE: TFIBStringField;
     xCcDesdeTITULO: TFIBStringField;
     xCcDesdeNIVEL: TIntegerField;
     xCcDesdeDISTRIBUCION_POSTERIOR: TIntegerField;
     xCcDesdeCENTRO_COSTE_PADRE: TFIBStringField;
     xCcDesdeID_P: TIntegerField;
     xCcDesdeID_CC: TIntegerField;
     xCcDesdeID_CC_PADRE: TIntegerField;
     xCcHastaEMPRESA: TIntegerField;
     xCcHastaEJERCICIO: TIntegerField;
     xCcHastaCANAL: TIntegerField;
     xCcHastaPLAN_CONTABLE: TFIBStringField;
     xCcHastaCENTRO_COSTE: TFIBStringField;
     xCcHastaTITULO: TFIBStringField;
     xCcHastaNIVEL: TIntegerField;
     xCcHastaDISTRIBUCION_POSTERIOR: TIntegerField;
     xCcHastaCENTRO_COSTE_PADRE: TFIBStringField;
     xCcHastaID_P: TIntegerField;
     xCcHastaID_CC: TIntegerField;
     xCcHastaID_CC_PADRE: TIntegerField;
     xCentroCoste: TFIBTableSetRO;
     DSxCentroCoste: TDataSource;
     xPeriodo: TFIBTableSetRO;
     DSxPeriodo: TDataSource;
     xPeriodoPERIODO: TFIBStringField;
     xPeriodoTITULO: TFIBStringField;
     xCentroCosteEMPRESA: TIntegerField;
     xCentroCosteEJERCICIO: TIntegerField;
     xCentroCosteCANAL: TIntegerField;
     xCentroCostePLAN_CONTABLE: TFIBStringField;
     xCentroCosteCENTRO_COSTE: TFIBStringField;
     xCentroCosteTITULO: TFIBStringField;
     xCentroCosteNIVEL: TIntegerField;
     xCentroCosteDISTRIBUCION_POSTERIOR: TIntegerField;
     xCentroCosteCENTRO_COSTE_PADRE: TFIBStringField;
     xCentroCosteID_P: TIntegerField;
     xCentroCosteID_CC: TIntegerField;
     xCentroCosteID_CC_PADRE: TIntegerField;
     TSPresupuestos: TFIBTableSet;
     TSPresupuestosCANAL: TIntegerField;
     TSPresupuestosCENTRO_COSTE: TFIBStringField;
     TSPresupuestosSALDO: TFloatField;
     TSPresupuestosPRESUPUESTO: TFloatField;
     TSPresupuestosDESVIACION: TFloatField;
     TSPresupuestosCONTROL: TFloatField;
     TSMeses: TFIBTableSet;
     TSMesesCENTRO_COSTE: TFIBStringField;
     TSMesesPERIODO: TFIBStringField;
     TSMesesPRESUPUESTO: TFloatField;
     TSMesesDESVIACION: TFloatField;
     TSMesesCONTROL: TFloatField;
     TSMesesSALDO: TFloatField;
     TSPresupuestosTIPO_CONTROL: TIntegerField;
     TSMesesTIPO_CONTROL: TIntegerField;
     frxAnaPresupuesto: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frAnaPresupuestoEnterRect(Memo: TStringList; View: TfrView);
     procedure frAnaPresupuestoGetValue(const ParName: string; var ParValue: variant);
     procedure TSPresupuestosAfterOpen(DataSet: TDataSet);
     procedure TSMesesAfterOpen(DataSet: TDataSet);
     procedure frxAnaPresupuestoBeforePrint(Sender: TfrxReportComponent);
     procedure frxAnaPresupuestoGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     LocalMascaraN, LocalMascaraL: string;
     procedure GenerarSQL(Canal: smallint; ListaCanal: TStringList);
     procedure AbrirDatos;
     procedure EstableceMascaras;
     function DesviacionPrepAnual: double;
     function DesviacionPrepMes: double;
  public
     { Public declarations }
     Niveles: TStringList;
     PDesde, PHasta: string;
     NDesde, NHasta: smallint;
     Control, Meses, Anual: boolean;
     procedure ActualizaCCDesde(CentroCoste: string);
     procedure ActualizaCCHasta(CentroCoste: string);
     procedure ActualizaPlanContable(PlanContable: string);
     function PlanInicial: string;
     procedure LlenarNiveles;
     procedure ParametrosIniciales(var CCDesde, CCHasta: string);
     procedure MostrarListado(Modo: smallint; LCanal: TStringList; Canal: smallint);
  end;

var
  DMRAnaPresupuesto : TDMRAnaPresupuesto;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, UDMListados, UFormGest, UDMMultiSeleccion;

procedure TDMRAnaPresupuesto.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  Niveles := TStringList.Create;
  EstableceMascaras;
end;

procedure TDMRAnaPresupuesto.DataModuleDestroy(Sender: TObject);
begin
  Niveles.Free;
  CierraData(DMListados);
end;

procedure TDMRAnaPresupuesto.ActualizaCCDesde(CentroCoste: string);
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

procedure TDMRAnaPresupuesto.ActualizaCCHasta(CentroCoste: string);
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

procedure TDMRAnaPresupuesto.ActualizaPlanContable(PlanContable: string);
begin
  with xPlan do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := PlanContable;
     Open;
  end;
end;

function TDMRAnaPresupuesto.PlanInicial: string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'execute procedure n_apuntes_plan_min_max(?empresa,' +
           '?ejercicio,?canal)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['PLAN_DESDE'].AsString;
     finally
        Free;
     end;
end;

procedure TDMRAnaPresupuesto.LlenarNiveles;
var
  Ro : TFIBDataSetRO;
begin
  Ro := TFIBDataSetRO.Create(Self);
  with Ro do
     try
        Database := DMMain.DataBase;
        SelectSQL.Text := 'select distinct nivel from ana_centros_coste ' +
           ' where empresa=?empresa and ejercicio=?ejercicio and ' +
           ' canal=?canal and plan_contable=?plan_contable ' +
           ' order by nivel';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Open;

        Niveles.Clear;
        while not EOF do
        begin
           Niveles.Add(FieldByName('NIVEL').AsString);
           Next;
        end;
     finally
        Free;
     end;
end;

procedure TDMRAnaPresupuesto.ParametrosIniciales(var CCDesde, CCHasta: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'execute procedure n_apuntes_max_min(?empresa,?ejercicio,' +
           '?canal,?plan_contable)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        ExecQuery;
        CCDesde := FieldByName['CC_DESDE'].AsString;
        CCHasta := FieldByName['CC_HASTA'].AsString;
     finally
        Free;
     end;
end;

procedure TDMRAnaPresupuesto.MostrarListado(Modo: smallint; LCanal: TStringList; Canal: smallint);
var
  str : string;
begin
  GenerarSQL(Canal, LCanal);
  AbrirDatos;

  //Carga del listado
  DMListados.Cargar(603, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAnaPresupuesto.LoadFromFIB(REntorno.Formato, str);
     frAnaPresupuesto.PrepareReport;
     case modo of
        0: frAnaPresupuesto.ShowPreparedReport;
        1: frAnaPresupuesto.PrintPreparedReport('', REntorno.Copias);
     end;
  end
  else
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAnaPresupuesto.LoadFromFIB(REntorno.Formato, str);
     frxAnaPresupuesto.PrepareReport;
     case modo of
        0: frxAnaPresupuesto.ShowPreparedReport;
        1: frxAnaPresupuesto.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMRAnaPresupuesto.GenerarSQL(Canal: smallint; ListaCanal: TStringList);
var
  SQL : string;
begin
  if Anual then
  begin
     if (Canal <> 0) then
     begin
        SQL := 'select centro_coste,presupuesto,saldo,desviacion,control,canal,' +
           ' tipo_control' +
           ' from ana_centro_coste_periodo where empresa=?empresa and' +
           ' ejercicio=?ejercicio and plan_contable=?plan_contable and' +
           ' centro_coste>=?cc_ini and centro_coste<=?cc_fin and' +
           ' periodo=''20'' and nivel>=?nivel_ini and nivel<=?nivel_fin ';
        SQL := SQL + DMMultiSeleccion.WhereCanales(ListaCanal);
        if Control then
           SQL := SQL + ' and ((control <> 0) and' +
              '(((tipo_control = 1) and (saldo > control)) or' +
              ' ((tipo_control = 0) and (saldo < control)))) ';
        SQL := SQL + ' order by centro_coste';
     end
     else
     begin
        SQL := 'select centro_coste,sum(presupuesto) as presupuesto,' +
           ' sum(saldo) as saldo, sum(desviacion) as desviacion,' +
           ' sum(control) as control,canal,tipo_control' +
           ' from ana_centro_coste_periodo where empresa=?empresa and' +
           ' ejercicio=?ejercicio and plan_contable=?plan_contable and' +
           ' centro_coste>=?cc_ini and centro_coste<=?cc_fin and' +
           ' periodo=''20'' and nivel>=?nivel_ini and nivel<=?nivel_fin ';
        SQL := SQL + DMMultiSeleccion.WhereCanales(ListaCanal);
        if Control then
           SQL := SQL + ' and ((control <> 0) and' +
              '(((tipo_control = 1) and (saldo > control)) or' +
              ' ((tipo_control = 0) and (saldo < control)))) ';
        SQL := SQL + ' group by centro_coste,canal,tipo_control ';
        SQL := SQL + ' order by centro_coste';
     end;
  end
  else
  begin
     SQL := 'select centro_coste,sum(presupuesto) as presupuesto,' +
        ' sum(saldo) as saldo, sum(desviacion) as desviacion,' +
        ' sum(control) as control,canal,tipo_control' +
        ' from ana_centro_coste_periodo where empresa=?empresa and' +
        ' ejercicio=?ejercicio and plan_contable=?plan_contable and' +
        ' centro_coste>=?cc_ini and centro_coste<=?cc_fin and' +
        ' periodo>=?p_ini and  periodo<=?p_fin and' +
        ' nivel>=?nivel_ini and nivel<=?nivel_fin ';
     SQL := SQL + DMMultiSeleccion.WhereCanales(ListaCanal);
     if Control then
        SQL := SQL + ' and ((control <> 0) and' +
           '(((tipo_control = 1) and (saldo > control)) or' +
           ' ((tipo_control = 0) and (saldo < control)))) ';
     SQL := SQL + ' group by centro_coste,canal,tipo_control ';
     SQL := SQL + ' order by centro_coste';
  end;

  TSPresupuestos.Close;
  TSPresupuestos.SelectSQL.Text := SQL;

  SQL := 'select centro_coste,periodo,presupuesto,saldo,desviacion,control,' +
     ' tipo_control' +
     ' from ana_centro_coste_periodo where empresa=?empresa and ' +
     ' ejercicio=?ejercicio and canal=?canal and' +
     ' plan_contable=?plan_contable and centro_coste=?centro_coste and' +
     ' periodo>=?p_ini and  periodo<=?p_fin ';
  SQL := SQL + DMMultiSeleccion.WhereCanales(ListaCanal);
  SQL := SQL + ' order by periodo';

  TSMeses.Close;
  TSMeses.SelectSQL.Text := SQL;
end;

procedure TDMRAnaPresupuesto.AbrirDatos;
begin
  with TSPresupuestos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CC_INI'].AsString := xCcDesdeCENTRO_COSTE.AsString;
     Params.ByName['CC_FIN'].AsString := xCcHastaCENTRO_COSTE.AsString;
     Params.ByName['NIVEL_INI'].AsInteger := NDesde;
     Params.ByName['NIVEL_FIN'].AsInteger := NHasta;
     if not Anual then
     begin
        Params.ByName['P_INI'].AsString := PDesde;
        Params.ByName['P_FIN'].AsString := PHasta;
     end;
     Open;
  end;

  with TSMeses do
  begin
     Close;
     if Meses then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
     else
        Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['P_INI'].AsString := PDesde;
     Params.ByName['P_FIN'].AsString := PHasta;
     Open;
  end;
end;

procedure TDMRAnaPresupuesto.frAnaPresupuestoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
  end;
end;

procedure TDMRAnaPresupuesto.EstableceMascaras;
begin
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);

  TSPresupuestosPRESUPUESTO.DisplayFormat := LocalMascaraN;
  TSPresupuestosSALDO.DisplayFormat := LocalMascaraN;
  TSPresupuestosCONTROL.DisplayFormat := LocalMascaraN;
  TSPresupuestosDESVIACION.DisplayFormat := MascaraP;
  TSMesesPRESUPUESTO.DisplayFormat := LocalMascaraN;
  TSMesesSALDO.DisplayFormat := LocalMascaraN;
  TSMesesCONTROL.DisplayFormat := LocalMascaraN;
  TSMesesDESVIACION.DisplayFormat := MascaraP;
end;

procedure TDMRAnaPresupuesto.frAnaPresupuestoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'NivelIni' then
     ParValue := NDesde;
  if ParName = 'NivelFin' then
     ParValue := NHasta;

  if ParName = 'TituloCc' then
     ParValue := xCentroCosteTITULO.AsString;
  if ParName = 'TituloPe' then
     ParValue := xPeriodoTITULO.AsString;

  if ParName = 'Desviacion' then
     ParValue := DesviacionPrepAnual;
  if ParName = 'PDesviacion' then
     ParValue := DesviacionPrepMes;
end;

procedure TDMRAnaPresupuesto.TSPresupuestosAfterOpen(DataSet: TDataSet);
begin
  with xCentroCoste do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Open;
  end;
end;

procedure TDMRAnaPresupuesto.TSMesesAfterOpen(DataSet: TDataSet);
begin
  with xPeriodo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Open;
  end;
end;

function TDMRAnaPresupuesto.DesviacionPrepAnual: double;
begin
  Result := 0;
  if (TSPresupuestosPRESUPUESTO.AsFloat <> 0) then
     Result := TSPresupuestosSALDO.AsFloat - TSPresupuestosPRESUPUESTO.AsFloat;
end;

function TDMRAnaPresupuesto.DesviacionPrepMes: double;
begin
  Result := 0;
  if (TSPresupuestosPRESUPUESTO.AsFloat <> 0) then
     Result := TSMesesSALDO.AsFloat - TSMesesPRESUPUESTO.AsFloat;
end;

procedure TDMRAnaPresupuesto.frxAnaPresupuestoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRAnaPresupuesto.frxAnaPresupuestoGetValue(const VarName: string; var Value: variant);
begin
  frAnaPresupuestoGetValue(VarName, Value);
end;

end.
