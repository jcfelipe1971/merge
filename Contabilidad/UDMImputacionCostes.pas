unit UDMImputacionCostes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDataSetRO, FIBDatabase, UFIBModificados, DB,
  FIBDataSet, FIBTableDataSet, FIBQuery, HYFIBQuery, UFParada, Dialogs;

type
  TDMImputacionCostes = class(TDataModule)
     QMImputaciones: TFIBTableSet;
     DSQMImputaciones: TDataSource;
     TLocal: THYTransaction;
     xPlan: TFIBDataSetRO;
     xPlanPLAN_CONTABLE: TFIBStringField;
     xPlanID_P: TIntegerField;
     xPlanTITULO: TFIBStringField;
     DSQMApuntes: TDataSource;
     xPlanes: TFIBDataSetRO;
     xCentroCoste: TFIBDataSetRO;
     xCentroCosteTITULO: TFIBStringField;
     xAsiento: TFIBDataSetRO;
     QMImputacionesENTRADA: TIntegerField;
     QMImputacionesEMPRESA: TIntegerField;
     QMImputacionesEJERCICIO: TIntegerField;
     QMImputacionesCANAL: TIntegerField;
     QMImputacionesRIC: TIntegerField;
     QMImputacionesLINEA: TIntegerField;
     QMImputacionesCENTRO_COSTE: TFIBStringField;
     QMImputacionesTITULO: TFIBStringField;
     QMImputacionesPORC: TFloatField;
     QMImputacionesIMPORTE: TFloatField;
     QMImputacionesDIST_POSTERIOR: TIntegerField;
     xAsientoEMPRESA: TIntegerField;
     xAsientoEJERCICIO: TIntegerField;
     xAsientoCANAL: TIntegerField;
     xAsientoRIC: TIntegerField;
     xAsientoTIPO: TFIBStringField;
     DSxAsiento: TDataSource;
     QPrimerAsiento: THYFIBQuery;
     SPLlenarTablas: THYFIBQuery;
     xPlantilla: TFIBDataSetRO;
     xPlantillaTITULO: TFIBStringField;
     DSxPlantilla: TDataSource;
     xPlantillaID_PL: TIntegerField;
     xCentroCosteDISTRIBUCION_POSTERIOR: TIntegerField;
     QMApuntes: TFIBTableSet;
     QMApuntesENTRADA: TIntegerField;
     QMApuntesEMPRESA: TIntegerField;
     QMApuntesEJERCICIO: TIntegerField;
     QMApuntesCANAL: TIntegerField;
     QMApuntesRIC: TIntegerField;
     QMApuntesLINEA: TIntegerField;
     QMApuntesDEBE: TFloatField;
     QMApuntesHABER: TFloatField;
     QMApuntesCUENTA: TFIBStringField;
     QMApuntesTEXTO: TFIBStringField;
     QMApuntesDOC_NUMERO: TIntegerField;
     QMApuntesDOC_SERIE: TFIBStringField;
     QMApuntesDOC_FECHA: TDateTimeField;
     QMApuntesIMPUTACION: TIntegerField;
     QMApuntesID_PL: TIntegerField;
     QMImputacionesCALCULANDO: TIntegerField;
     xAsientoIMPUTACION: TIntegerField;
     QGen: THYFIBQuery;
     xPlanPROYECTO: TIntegerField;
     QMApuntesPROYECTO: TIntegerField;
     QMApuntesTITULO_PROYECTO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMImputacionesNewRecord(DataSet: TDataSet);
     procedure xApuntesDEBEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xApuntesHABERGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMImputacionesCENTRO_COSTEChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMApuntesAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     procedure AsignarMascaras;
     procedure LimpiarTablas;
  public
     { Public declarations }
     procedure LlenaPlanesContables(List: TStrings);
     procedure AbrirPlanContable(PlanContable: string);
     procedure AbrirApuntes;
     procedure AbrirImputaciones;
     procedure AbrirPrimerAsiento;
     procedure AbrirAsiento(RIC: integer);
     procedure LlenarTablas;
     procedure AbrirPlantilla(Plantilla: integer);
     function PlanActivo: string;
     procedure ConfirmarImputacion;
     procedure LlenarConPlantilla;
     function Imputado: boolean;
     function Porcentaje: double;
     procedure DatosDocumento(var Tipo, Serie: string; var Rig: integer);
     function AsientoImputado(Planc: string; ric: integer; evaluar: boolean): boolean;
     function AsientoImputable(ric: integer; evaluar: boolean): boolean;
     procedure PosicionaLinea(Linea: integer);
     function DamePlantilla(id_pl: integer): integer;
     function DamePosicionProyecto(proyecto: integer): integer;
  end;

var
  DMImputacionCostes : TDMImputacionCostes;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, UFMImputacionCostes;

procedure TDMImputacionCostes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  AsignarMascaras;
end;

procedure TDMImputacionCostes.DataModuleDestroy(Sender: TObject);
begin
  LimpiarTablas;
end;

procedure TDMImputacionCostes.LlenaPlanesContables(List: TStrings);
var
  pl : string;
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
           pl := FieldByName('PLAN_CONTABLE').AsString + ' - ' + FieldByName('TITULO').AsString;
           if (FieldByName('PROYECTO').AsInteger > 0) then
              pl := pl + ' - Proy. ' + FieldByName('PROYECTO').AsString;
           List.Add(pl);
           Next;
        end;
     end;
end;

function TDMImputacionCostes.DamePosicionProyecto(proyecto: integer): integer;
var
  // pl : string;
  cont : integer;
  salir : boolean;
begin
  cont := -1;
  salir := False;
  with xPlanes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
     while ((not EOF) and (not salir)) do
     begin
        Inc(cont);
        if ((FieldByName('PROYECTO').AsInteger > 0) and (FieldByName('PROYECTO').AsInteger = proyecto)) then
           salir := True;
        Next;
     end;
     Result := cont;
  end;
end;

procedure TDMImputacionCostes.AbrirPlanContable(PlanContable: string);
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

procedure TDMImputacionCostes.AbrirApuntes;
begin
  with QMApuntes do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMImputacionCostes.AbrirImputaciones;
begin
  with QMImputaciones do
  begin
     Close;
     Open;
  end;
end;

procedure TDMImputacionCostes.AbrirPrimerAsiento;
begin
  if (xAsientoRIC.AsInteger = 0) then
     with QPrimerAsiento do
     begin
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        ExecQuery;
        AbrirAsiento(FieldByName['RIC'].AsInteger);
        FreeHandle;
     end;
end;

procedure TDMImputacionCostes.AbrirAsiento(RIC: integer);
var
  planc : string;
begin
  if (xPlanPLAN_CONTABLE.AsString <= '') then
     with xPlanes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Open;
        planc := FieldByName('PLAN_CONTABLE').AsString;
     end
  else
     planc := xPlanPLAN_CONTABLE.AsString;

  with xAsiento do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['RIC'].AsInteger := RIC;
     Params.ByName['PLAN_CONTABLE'].AsString := planc;
     Open;
  end;
end;

procedure TDMImputacionCostes.LlenarTablas;
begin
  with SPLlenarTablas do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['RIC'].AsInteger := xAsientoRIC.AsInteger;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMImputacionCostes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMImputacionCostes.QMImputacionesNewRecord(DataSet: TDataSet);
begin
  QMImputacionesENTRADA.AsInteger := REntorno.Entrada;
  QMImputacionesEMPRESA.AsInteger := REntorno.Empresa;
  QMImputacionesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMImputacionesCANAL.AsInteger := REntorno.Canal;
  QMImputacionesRIC.AsInteger := QMApuntesRIC.AsInteger;
  QMImputacionesLINEA.AsInteger := QMApuntesLINEA.AsInteger;

  QMImputacionesPORC.AsFloat := Porcentaje;
end;

procedure TDMImputacionCostes.xApuntesDEBEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMApuntesDEBE.AsInteger <> 0 then
     Text := QMApuntesDEBE.AsString;
end;

procedure TDMImputacionCostes.xApuntesHABERGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMApuntesHABER.AsInteger <> 0 then
     Text := QMApuntesHABER.AsString;
end;

procedure TDMImputacionCostes.AsignarMascaras;
var
  Formato : string;
begin
  Formato := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  QMApuntesDEBE.DisplayFormat := Formato;
  QMApuntesHABER.DisplayFormat := Formato;
  QMImputacionesIMPORTE.DisplayFormat := Formato;
  QMImputacionesPORC.DisplayFormat := MascaraP;
end;

procedure TDMImputacionCostes.AbrirPlantilla(Plantilla: integer);
begin
  with xPlantilla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['PLANTILLA'].AsInteger := Plantilla;
     Open;
  end;
end;

function TDMImputacionCostes.PlanActivo: string;
begin
  Result := xPlanPLAN_CONTABLE.AsString;
end;

procedure TDMImputacionCostes.QMImputacionesCENTRO_COSTEChange(Sender: TField);
begin
  with xCentroCoste do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := Sender.AsString;
     Open;
  end;
  QMImputacionesTITULO.AsString := xCentroCosteTITULO.AsString;
  QMImputacionesDIST_POSTERIOR.AsString := xCentroCosteDISTRIBUCION_POSTERIOR.AsString;
end;

procedure TDMImputacionCostes.LimpiarTablas;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'delete from ana_tmp_imputaciones where entrada=' +
           REntorno.EntradaStr;
        ExecQuery;
        SQL.Text := 'delete from ana_tmp_imputaciones_det where entrada=' +
           REntorno.EntradaStr;
        ExecQuery;
     finally
        Free;
     end;
end;

procedure TDMImputacionCostes.ConfirmarImputacion;
var
  Q : THYFIBQuery;
  // Mark : TBookmark;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_imputaciones_confirma(?entrada,?empresa,' +
           '?ejercicio,?canal,?ric,?linea,?plan_contable,?id_pl)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['RIC'].AsInteger := QMApuntesRIC.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMApuntesLINEA.AsInteger;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Params.ByName['ID_PL'].AsInteger := xPlantillaID_PL.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
     finally
        Free;
     end;
  QMApuntes.Refresh;
end;

procedure TDMImputacionCostes.LlenarConPlantilla;
var
  Q : THYFIBQuery;
begin
  if (xPlantilla.RecordCount = 1) then
  begin
     Q := THYFIBQuery.Create(Self);
     with Q do
        try
           Database := DMMain.Database;
           SQL.Text := 'execute procedure n_imputaciones_con_plantilla(?entrada,?empresa,' +
              '?ejercicio,?canal,?ric,?linea,?id_pl)';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['RIC'].AsInteger := QMApuntesRIC.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMApuntesLINEA.AsInteger;
           Params.ByName['ID_PL'].AsInteger := xPlantillaID_PL.AsInteger;
           TFparada.Create(Self).ExecQuery(Q);
        finally
           Free;
        end;

     with QMImputaciones do
     begin
        DisableControls;
        Close;
        Open;
        EnableControls;
     end;
  end;
end;

function TDMImputacionCostes.Porcentaje: double;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select sum(porc) as suma from ana_tmp_imputaciones_det ' +
           ' where empresa=?empresa and ejercicio=?ejercicio and ' +
           ' canal=?canal and ric=?ric and linea=?linea';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['RIC'].AsInteger := QMApuntesRIC.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMApuntesLINEA.AsInteger;
        ExecQuery;
        Result := 100 - FieldByName['SUMA'].AsFloat;
        if Result < 0 then
           Result := 0;
     finally
        Free;
     end;
end;

function TDMImputacionCostes.Imputado: boolean;
begin
  Result := ((QMApuntesIMPUTACION.AsInteger = 2) or (QMApuntesIMPUTACION.AsInteger = 0));
end;

procedure TDMImputacionCostes.DatosDocumento(var Tipo, Serie: string; var Rig: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_imputaciones_busca_doc(?empresa,' +
           '?ejercicio,?canal,?ric)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['RIC'].AsInteger := QMApuntesRIC.AsInteger;
        ExecQuery;
        Tipo := FieldByName['TIPO'].AsString;
        Serie := FieldByName['SERIE'].AsString;
        Rig := FieldByName['RIG'].AsInteger;
     finally
        Free;
     end;
end;

function TDMImputacionCostes.AsientoImputado(Planc: string; ric: integer; evaluar: boolean): boolean;
var
  ev : integer;
begin
  if evaluar then
     ev := 1
  else
     ev := 0;
  with QGen do
  begin
     Close;
     SQL.Text := 'select count(*) as noimputados from ana_con_cuentas_apuntes_imp i ' +
        'join con_cuentas_apuntes apu ' +
        'on (i.empresa=apu.empresa and i.ejercicio=apu.ejercicio and i.canal=apu.canal and i.ric=apu.ric and i.linea=apu.linea) ' +
        'join ana_plan_contable p on (i.id_p=p.id_p) ' +
        'where i.empresa=?empresa and i.ejercicio=?ejercicio and i.canal=?canal and i.ric=?ric and i.imputacion=1 and ' +
        '((?evaluar=0)or((?evaluar=1)and(p.preguntar_imputacion=1))) and ' +
        '((apu.proyecto=p.proyecto)or(p.proyecto is null)or(p.proyecto=0))';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['RIC'].AsInteger := ric;
     Params.ByName['EVALUAR'].AsInteger := ev;
     if (planc > '') then
     begin
        SQL.Text := SQL.Text + ' and plan_contable=?plan_contable';
        Params.ByName['PLAN_CONTABLE'].AsString := Planc;
     end;
     ExecQuery;
     Result := FieldByName['noimputados'].AsInteger = 0;
  end;
end;

function TDMImputacionCostes.AsientoImputable(ric: integer; evaluar: boolean): boolean;
var
  Q : THYFIBQuery;
  ev : integer;
begin
  Q := THYFIBQuery.Create(Self);
  if (evaluar) then
     ev := 1
  else
     ev := 0;
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select count(*) as cant from ana_es_asiento_imputable' +
           '(?empresa,?ejercicio,?canal,?ric,?evaluar)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['RIC'].AsInteger := ric;
        Params.ByName['EVALUAR'].AsInteger := ev;
        ExecQuery;
        Result := FieldByName['CANT'].AsInteger > 0;
     finally
        Free;
     end;
end;

procedure TDMImputacionCostes.PosicionaLinea(Linea: integer);
begin
  QMApuntes.Locate('Linea', Linea, []);
end;

procedure TDMImputacionCostes.QMApuntesAfterScroll(DataSet: TDataSet);
begin
  if (QMApuntesID_PL.AsInteger > 0) then
     FMImputacionCostes.EFPlantilla.Text := IntToStr(DamePlantilla(QMApuntesID_PL.AsInteger))
  else
     FMImputacionCostes.EFPlantilla.Text := '';
end;

function TDMImputacionCostes.DamePlantilla(id_pl: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select plantilla from ana_plantillas_cc' +
           ' where id_pl=' + IntToStr(id_pl);
        ExecQuery;
        Result := FieldByName['PLANTILLA'].AsInteger;
     finally
        Free;
     end;
end;

end.
