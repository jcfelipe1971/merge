unit UDMCentrosCoste;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO, ComCtrls, UFParada, Dialogs;

type
  PCentroCosteInfo = ^TCentroCosteInfo;

  TCentroCosteInfo = record
     Codigo: string;
     Titulo: string;
     ID_CC: integer;
  end;

  TDMCentrosCoste = class(TDataModule)
     TLocal: THYTransaction;
     DSQMCentrosCoste: TDataSource;
     QMCentrosCoste: TFIBTableSet;
     QMCentrosCosteEMPRESA: TIntegerField;
     QMCentrosCosteEJERCICIO: TIntegerField;
     QMCentrosCosteCANAL: TIntegerField;
     QMCentrosCostePLAN_CONTABLE: TFIBStringField;
     QMCentrosCosteCENTRO_COSTE: TFIBStringField;
     QMCentrosCosteTITULO: TFIBStringField;
     QMCentrosCosteNIVEL: TIntegerField;
     QMCentrosCosteDISTRIBUCION_POSTERIOR: TIntegerField;
     QMCentrosCosteCENTRO_COSTE_PADRE: TFIBStringField;
     QMCentrosCosteID_P: TIntegerField;
     QMCentrosCosteID_CC: TIntegerField;
     QMCentrosCosteID_CC_PADRE: TIntegerField;
     xPlanes: TFIBDataSetRO;
     xPlan: TFIBDataSetRO;
     xPlanPLAN_CONTABLE: TFIBStringField;
     xPlanID_P: TIntegerField;
     xHijos: TFIBDataSetRO;
     xCCActivo: TFIBDataSetRO;
     xCCActivoCENTRO_COSTE_PADRE: TFIBStringField;
     xCCActivoID_CC_PADRE: TIntegerField;
     xPlanTITULO: TFIBStringField;
     xCCActivoCENTRO_COSTE: TFIBStringField;
     xCCActivoID_CC: TIntegerField;
     xCCActivoTITULO: TFIBStringField;
     QDameID_CC: THYFIBQuery;
     QMPresupuestos: TFIBTableSet;
     DSQMPresupuestos: TDataSource;
     QMPresupuestosEMPRESA: TIntegerField;
     QMPresupuestosEJERCICIO: TIntegerField;
     QMPresupuestosCANAL: TIntegerField;
     QMPresupuestosPLAN_CONTABLE: TFIBStringField;
     QMPresupuestosCENTRO_COSTE: TFIBStringField;
     QMPresupuestosPERIODO: TFIBStringField;
     QMPresupuestosTITULO: TFIBStringField;
     QMPresupuestosSALDO: TFloatField;
     QMPresupuestosPRESUPUESTO: TFloatField;
     QMPresupuestosDESVIACION: TFloatField;
     QMPresupuestosCONTROL: TFloatField;
     QMPresupuestosTIPO_CONTROL: TIntegerField;
     QMPresupuestosID_P: TIntegerField;
     QMPresupuestosID_CC: TIntegerField;
     xCCActivoNIVEL: TIntegerField;
     QMPlantillas: TFIBTableSet;
     DSQMPlantillas: TDataSource;
     QMPlantillasEMPRESA: TIntegerField;
     QMPlantillasEJERCICIO: TIntegerField;
     QMPlantillasCANAL: TIntegerField;
     QMPlantillasPLAN_CONTABLE: TFIBStringField;
     QMPlantillasCENTRO_COSTE: TFIBStringField;
     QMPlantillasINICIO: TDateTimeField;
     QMPlantillasFIN: TDateTimeField;
     QMPlantillasPLANTILLA: TIntegerField;
     QMPlantillasTITULO: TFIBStringField;
     QMPlantillasID_P: TIntegerField;
     QMPlantillasID_CC: TIntegerField;
     QMPlantillasID_PL: TIntegerField;
     QMPlantillasID_CC_DIST: TIntegerField;
     QMPlantillasAPLICADA: TIntegerField;
     xPlantilla: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     xCCActivoDISTRIBUCION_POSTERIOR: TIntegerField;
     xCuentas: TFIBTableSet;
     DSxCuentas: TDataSource;
     xCuentasEMPRESA: TIntegerField;
     xCuentasEJERCICIO: TIntegerField;
     xCuentasCANAL: TIntegerField;
     xCuentasPLAN_CONTABLE: TFIBStringField;
     xCuentasCUENTA: TFIBStringField;
     xCuentasPLANTILLA: TIntegerField;
     xCuentasPL_TITULO: TFIBStringField;
     xCuentasLINEA: TIntegerField;
     xCuentasCENTRO_COSTE: TFIBStringField;
     xCuentasCC_TITULO: TFIBStringField;
     xCuentasPORCENTAJE: TFloatField;
     xCuentasID_P: TIntegerField;
     xCuentasID_PL: TIntegerField;
     xCuentasID_CC: TIntegerField;
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCentrosCosteNewRecord(DataSet: TDataSet);
     procedure QMPresupuestosNewRecord(DataSet: TDataSet);
     procedure GrabaPresupuestos(DataSet: TDataSet);
     procedure QMPlantillasPLANTILLAChange(Sender: TField);
     procedure QMPlantillasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     procedure AsignaMascaras;
     function UltimoFin: TDateTime;
  public
     { Public declarations }
     procedure AbrirPlanContable(PlanContable: string);
     procedure LlenaPlanesContables(List: TStrings);
     procedure AbrirCentrosCoste;
     procedure SubirNivel;
     procedure BajarNivel;
     function ObtenerHijos(Padre: string): TList;
     function DameTituloCCPadre: string;
     procedure AbrirCCPadre(ID_CC: integer);
     procedure AbrirPresupuestos;
     procedure AbrirPlantillas;
     function PlanActivo: string;
     function DistribucionPosterior: boolean;
     function PlantillaAplicada: boolean;
     function PlantillasVacias: boolean;
     procedure LlenarAlertaPresupuesto(List: TListItems);
     procedure LlenarCcNoDistribuidos(List: TListItems);
     function AlertaPresupuesto: boolean;
     function PeriodoNoDistribuido: boolean;
     function LlenarEjercicios(List: TStrings): integer;
     function DameTituloCC(CentroCoste: string): string;
     procedure PropagaPresupuestos(EjercicioOrigen, NivelInicial, NivelFinal: smallint; IncPorc, IncLineal: double; CCInicial, CCFinal: string; Modo: smallint);
     procedure AplicarPlantillaDP(Modo: smallint);
     procedure AbrirCuentas;
  end;

var
  DMCentrosCoste : TDMCentrosCoste;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, DateUtils;

{ TDMCentrosCoste }

procedure TDMCentrosCoste.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMCentrosCoste.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbrirCCPadre(-1);

  AsignaMascaras;
end;

procedure TDMCentrosCoste.LlenaPlanesContables(List: TStrings);
begin
  if (List <> nil) then
     with xPlanes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Open;
        List.Clear;
        while not EOF do
        begin
           List.Add(FieldByName('PLAN_CONTABLE').AsString + ' - ' +
              FieldByName('TITULO').AsString);
           Next;
        end;
     end;
end;

procedure TDMCentrosCoste.AbrirCentrosCoste;
begin
  with QMCentrosCoste do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE_PADRE'].AsString := xCCActivoCENTRO_COSTE.AsString;
     Open;
  end;
end;

procedure TDMCentrosCoste.QMCentrosCosteNewRecord(DataSet: TDataSet);
begin
  QMCentrosCosteEMPRESA.AsInteger := REntorno.Empresa;
  QMCentrosCosteEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCentrosCosteCANAL.AsInteger := REntorno.Canal;
  QMCentrosCostePLAN_CONTABLE.AsString := xPlanPLAN_CONTABLE.AsString;
  QMCentrosCosteID_P.AsInteger := xPlanID_P.AsInteger;

  QMCentrosCosteCENTRO_COSTE_PADRE.AsString := xCCActivoCENTRO_COSTE.AsString;
  QMCentrosCosteID_CC_PADRE.AsInteger := xCCActivoID_CC.AsInteger;

  QMCentrosCosteNIVEL.AsInteger := xCCActivoNIVEL.AsInteger + 1;
end;

procedure TDMCentrosCoste.AbrirPlanContable(PlanContable: string);
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

procedure TDMCentrosCoste.SubirNivel;
begin
  AbrirCCPadre(xCCActivoID_CC_PADRE.AsInteger);
  AbrirCentrosCoste;
  AbrirPresupuestos;
  AbrirPlantillas;
  AbrirCuentas;
end;

procedure TDMCentrosCoste.BajarNivel;
begin
  AbrirCCPadre(QMCentrosCosteID_CC.AsInteger);
  AbrirCentrosCoste;
  AbrirPresupuestos;
  AbrirPlantillas;
  AbrirCuentas;
end;

function TDMCentrosCoste.ObtenerHijos(Padre: string): TList;
var
  Info : PCentroCosteInfo;
begin
  with xHijos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE_PADRE'].AsString := Padre;
     Open;

     Result := TList.Create;
     while not EOF do
     begin
        New(Info);
        Info^.Codigo := FieldByName('CENTRO_COSTE').AsString;
        Info^.Titulo := FieldByName('TITULO').AsString;
        Info^.ID_CC := FieldByName('ID_CC').AsInteger;
        Result.Add(Info);
        Next;
     end;
  end;
end;

function TDMCentrosCoste.DameTituloCCPadre: string;
begin
  if (xCCActivoID_CC.AsInteger > 0) then
     Result := xCCActivoCENTRO_COSTE.AsString + '. ' + xCCActivoTITULO.AsString
  else
     Result := xPlanPLAN_CONTABLE.AsString + '. ' + xPlanTITULO.AsString;
end;

procedure TDMCentrosCoste.AbrirCCPadre(ID_CC: integer);
begin
  with xCCActivo do
  begin
     Close;
     Params.ByName['ID_CC'].AsInteger := ID_CC;
     Open;
  end;
end;

procedure TDMCentrosCoste.AbrirPresupuestos;
begin
  with QMPresupuestos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := xCCActivoCENTRO_COSTE.AsString;
     Open;
  end;
end;

procedure TDMCentrosCoste.AsignaMascaras;
var
  Formato : string;
begin
  Formato := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  QMPresupuestosPRESUPUESTO.DisplayFormat := Formato;
  QMPresupuestosSALDO.DisplayFormat := Formato;
  QMPresupuestosCONTROL.DisplayFormat := Formato;
  QMPresupuestosDESVIACION.DisplayFormat := MascaraP;
end;

procedure TDMCentrosCoste.QMPresupuestosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCentrosCoste.GrabaPresupuestos(DataSet: TDataSet);
//var
//  Marca : TBookMark;
begin
  Graba(DataSet);
  DataSet.Refresh;
  {  with QMPresupuestos do
  begin
    Marca := GetBookmark;
    try
       DisableControls;
       Close;
       Open;
       GotoBookmark(Marca);
    finally
       EnableControls;
       FreeBookmark(Marca);
    end;
  end;
}
end;

procedure TDMCentrosCoste.AbrirPlantillas;
begin
  with QMPlantillas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := xCCActivoCENTRO_COSTE.AsString;
     Open;
  end;
end;

function TDMCentrosCoste.PlanActivo: string;
begin
  Result := xPlanPLAN_CONTABLE.AsString;
end;

procedure TDMCentrosCoste.QMPlantillasPLANTILLAChange(Sender: TField);
begin
  with xPlantilla do
  begin
     Close;
     Params.ByName['PLANTILLA'].AsString := Sender.AsString;
     Open;
     QMPlantillasTITULO.AsString := FieldByName('TITULO').AsString;
  end;
end;

function TDMCentrosCoste.DistribucionPosterior: boolean;
begin
  Result := xCCActivoDISTRIBUCION_POSTERIOR.AsInteger = 1;
end;

procedure TDMCentrosCoste.QMPlantillasNewRecord(DataSet: TDataSet);
begin
  QMPlantillasEMPRESA.AsInteger := REntorno.Empresa;
  QMPlantillasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPlantillasCANAL.AsInteger := REntorno.Canal;
  QMPlantillasPLAN_CONTABLE.AsString := xPlanPLAN_CONTABLE.AsString;
  QMCentrosCosteID_P.AsInteger := xPlanID_P.AsInteger;

  QMPlantillasCENTRO_COSTE.AsString := xCCActivoCENTRO_COSTE.AsString;
  QMPlantillasID_CC.AsInteger := xCCActivoID_CC.AsInteger;

  if QMPlantillas.RecordCount = 0 then
  begin
     QMPlantillasINICIO.AsDateTime := StartOfTheMonth(REntorno.FechaTrabSH);
     QMPlantillasFIN.AsDateTime := EndOfTheMonth(REntorno.FechaTrabSH);
  end
  else
  begin
     QMPlantillasINICIO.AsDateTime := StartOfTheMonth(IncMonth(UltimoFin));
     QMPlantillasFIN.AsDateTime := EndOfTheMonth(QMPlantillasINICIO.AsDateTime);
  end;
end;

function TDMCentrosCoste.PlantillaAplicada: boolean;
begin
  Result := QMPlantillasAPLICADA.AsInteger = 1;
end;

function TDMCentrosCoste.PlantillasVacias: boolean;
begin
  Result := QMPlantillas.RecordCount > 0;
end;

function TDMCentrosCoste.UltimoFin: TDateTime;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select max(fin) as fin from ana_centros_coste_dis ' +
           ' where empresa=?empresa and ejercicio=?ejercicio and ' +
           ' canal=?canal and plan_contable=?plan_contable and ' +
           ' centro_coste=?centro_coste';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Params.ByName['CENTRO_COSTE'].AsString := xCCActivoCENTRO_COSTE.AsString;
        ExecQuery;
        Result := FieldByName['FIN'].AsDateTime;
     finally
        Free;
     end;
end;

procedure TDMCentrosCoste.LlenarAlertaPresupuesto(List: TListItems);
var
  Ro : TFIBDataSetRO;
  Item : TListItem;
  Info : PCentroCosteInfo;
begin
  Ro := TFIBDataSetRO.Create(Self);
  with Ro do
     try
        Database := DMMain.Database;
        SelectSQL.Text :=
           'select distinct c.centro_coste,c.titulo,c.id_cc ' +
           '  from ana_centros_coste c ' +
           '  join ana_centro_coste_periodo p' +
           '  on (p.id_cc = c.id_cc)' +
           '  where(c.id_p = ?id_p) and' +
           '       (p.control <> 0) and' +
           '       (((p.tipo_control = 1) and (p.saldo > p.control)) or' +
           '        ((p.tipo_control = 0) and (p.saldo < p.control)))' +
           '  order by c.nivel,c.centro_coste';
        Params.ByName['ID_P'].AsInteger := xPlanID_P.AsInteger;
        Open;
        List.Clear;
        while not EOF do
        begin
           New(Info);
           Info^.Codigo := FieldByName('CENTRO_COSTE').AsString;
           Info^.Titulo := FieldByName('TITULO').AsString;
           Info^.ID_CC := FieldByName('ID_CC').AsInteger;

           Item := List.Add;
           Item.Caption := Info^.Codigo + '. ' + Info^.Titulo;
           Item.Data := Info;
           Next;
        end;
     finally
        Free;
     end;
end;

procedure TDMCentrosCoste.LlenarCcNoDistribuidos(List: TListItems);
var
  Ro : TFIBDataSetRO;
  Item : TListItem;
  Info : PCentroCosteInfo;
begin
  Ro := TFIBDataSetRO.Create(Self);
  with Ro do
     try
        Database := DMMain.Database;
        SelectSQL.Text := 'select distinct c.centro_coste,c.titulo,c.id_cc' +
           '  from ana_centros_coste c' +
           '  join ana_centros_coste_dis d' +
           '  on (d.id_cc = c.id_cc)' +
           '  where((c.id_p     = ?id_p ) and' +
           '        (d.fin      < ?fecha) and' +
           '        (d.aplicada = 0     ))' +
           '  order by c.nivel,c.centro_coste';
        Params.ByName['ID_P'].AsInteger := xPlanID_P.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        Open;
        List.Clear;
        while not EOF do
        begin
           New(Info);
           Info^.Codigo := FieldByName('CENTRO_COSTE').AsString;
           Info^.Titulo := FieldByName('TITULO').AsString;
           Info^.ID_CC := FieldByName('ID_CC').AsInteger;

           Item := List.Add;
           Item.Caption := Info^.Codigo + '. ' + Info^.Titulo;
           Item.Data := Info;
           Next;
        end;
     finally
        Free;
     end;
end;

function TDMCentrosCoste.AlertaPresupuesto: boolean;
begin
  Result := (QMPresupuestosCONTROL.AsFloat <> 0) and
     (((QMPresupuestosTIPO_CONTROL.AsInteger = 1) and
     (QMPresupuestosSALDO.AsFloat > QMPresupuestosCONTROL.AsFloat)) or
     ((QMPresupuestosTIPO_CONTROL.AsInteger = 0) and
     (QMPresupuestosSALDO.AsFloat < QMPresupuestosCONTROL.AsFloat)));
end;

function TDMCentrosCoste.PeriodoNoDistribuido: boolean;
begin
  Result := (QMPlantillasAPLICADA.AsInteger = 0) and
     (QMPlantillasFIN.AsDateTime < REntorno.FechaTrabSH);
end;

function TDMCentrosCoste.LlenarEjercicios(List: TStrings): integer;
var
  Ro : TFIBDataSetRO;
  i : integer;
begin
  Ro := TFIBDataSetRO.Create(Self);
  i := 0;
  Result := 0;
  with Ro do
     try
        Database := DMMain.Database;
        SelectSQL.Text := 'select ejercicio from emp_ejercicios' +
           ' where empresa=?empresa and activo=1' +
           ' order by ejercicio';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
        List.Clear;
        while not EOF do
        begin
           List.Add(FieldByName('EJERCICIO').AsString);
           if (FieldByName('EJERCICIO').AsInteger = REntorno.Ejercicio) then
              Result := i;
           i := i + 1;
           Next;
        end;
     finally
        Free;
     end;
end;

function TDMCentrosCoste.DameTituloCC(CentroCoste: string): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select titulo from ana_centros_coste' +
           ' where empresa=?empresa and ejercicio=?ejercicio and ' +
           ' canal=?canal and plan_contable=?plan_contable and ' +
           ' centro_coste=?centro_coste';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Params.ByName['CENTRO_COSTE'].AsString := CentroCoste;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
     finally
        Free;
     end;
end;

procedure TDMCentrosCoste.PropagaPresupuestos(EjercicioOrigen, NivelInicial, NivelFinal: smallint; IncPorc, IncLineal: double; CCInicial, CCFinal: string; Modo: smallint);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_propaga_presupuesto(?empresa,?ejercicio,' +
           '?canal,?plan_contable,?ejercicio_o,?nivelinicial,?nivelfinal,' +
           '?incporc,?inclineal,?ccinicial,?ccfinal,?modo)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Params.ByName['EJERCICIO_O'].AsInteger := EjercicioOrigen;
        Params.ByName['NIVELINICIAL'].AsInteger := NivelInicial;
        Params.ByName['NIVELFINAL'].AsInteger := NivelFinal;
        Params.ByName['INCPORC'].AsFloat := IncPorc;
        Params.ByName['INCLINEAL'].AsFloat := IncLineal;
        Params.ByName['CCINICIAL'].AsString := CCInicial;
        Params.ByName['CCFINAL'].AsString := CCFinal;
        Params.ByName['MODO'].AsInteger := Modo;
        TFParada.Create(Self).ExecQuery(Q);
        ShowMessage(_('Presupueto propagado'));
     finally
        Free;
     end;
end;

procedure TDMCentrosCoste.AplicarPlantillaDP(Modo: smallint);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'update ana_centros_coste_dis set aplicada=?modo' +
           ' where id_cc_dist=?id_cc_dist';
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ID_CC_DIST'].AsInteger := QMPlantillasID_CC_DIST.AsInteger;
        ExecQuery;
     finally
        Free;
     end;
  QMPlantillas.Refresh;
end;

procedure TDMCentrosCoste.AbrirCuentas;
begin
  with xCuentas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := xCCActivoCENTRO_COSTE.AsString;
     Open;
  end;
end;

end.
