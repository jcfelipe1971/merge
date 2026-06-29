unit UDMPlantillasImputacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDataSetRO, FIBDatabase, UFIBModificados, DB,
  FIBDataSet, FIBTableDataSet, FIBQuery, HYFIBQuery, UFParada, Dialogs;

type
  TDMPlantillasImputacion = class(TDataModule)
     QMCentrosCoste: TFIBTableSet;
     DSQMCentrosCoste: TDataSource;
     TLocal: THYTransaction;
     xPlan: TFIBDataSetRO;
     xPlanPLAN_CONTABLE: TFIBStringField;
     xPlanID_P: TIntegerField;
     xPlanTITULO: TFIBStringField;
     QMPlantillas: TFIBTableSet;
     DSQMPlantillas: TDataSource;
     QMPlantillasEMPRESA: TIntegerField;
     QMPlantillasEJERCICIO: TIntegerField;
     QMPlantillasCANAL: TIntegerField;
     QMPlantillasPLAN_CONTABLE: TFIBStringField;
     QMPlantillasPLANTILLA: TIntegerField;
     QMPlantillasTITULO: TFIBStringField;
     QMPlantillasCOMPLETA: TIntegerField;
     QMPlantillasID_P: TIntegerField;
     QMPlantillasID_PL: TIntegerField;
     QMCentrosCosteEMPRESA: TIntegerField;
     QMCentrosCosteEJERCICIO: TIntegerField;
     QMCentrosCosteCANAL: TIntegerField;
     QMCentrosCostePLAN_CONTABLE: TFIBStringField;
     QMCentrosCostePLANTILLA: TIntegerField;
     QMCentrosCosteLINEA: TIntegerField;
     QMCentrosCosteCENTRO_COSTE: TFIBStringField;
     QMCentrosCosteTITULO: TFIBStringField;
     QMCentrosCostePORCENTAJE: TFloatField;
     QMCentrosCosteREDONDEO: TIntegerField;
     QMCentrosCosteID_P: TIntegerField;
     QMCentrosCosteID_PL: TIntegerField;
     QMCentrosCosteID_CC: TIntegerField;
     QMCuentas: TFIBTableSet;
     DSQMCuentas: TDataSource;
     QMCuentasEMPRESA: TIntegerField;
     QMCuentasEJERCICIO: TIntegerField;
     QMCuentasCANAL: TIntegerField;
     QMCuentasPLAN_CONTABLE: TFIBStringField;
     QMCuentasPLANTILLA: TIntegerField;
     QMCuentasCUENTA: TFIBStringField;
     QMCuentasTITULO: TFIBStringField;
     QMCuentasTIPO: TIntegerField;
     QMCuentasGESTION: TIntegerField;
     QMCuentasID_P: TIntegerField;
     QMCuentasID_PL: TIntegerField;
     xPlanes: TFIBDataSetRO;
     xCentrosCoste: TFIBDataSetRO;
     xCentrosCosteTITULO: TFIBStringField;
     xCuenta: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     QMCuentasNIVEL: TIntegerField;
     TUpdate: THYTransaction;
     QMCuentasPGC: TIntegerField;
     procedure Graba(DataSet: TDataSet);
     procedure GrabaCentrosCoste(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPlantillasNewRecord(DataSet: TDataSet);
     procedure QMCentrosCosteNewRecord(DataSet: TDataSet);
     procedure QMCuentasNewRecord(DataSet: TDataSet);
     procedure QMCentrosCosteCENTRO_COSTEChange(Sender: TField);
     procedure QMCuentasCUENTAChange(Sender: TField);
     procedure QMCentrosCosteBeforeInsert(DataSet: TDataSet);
     procedure QMCuentasBeforeInsert(DataSet: TDataSet);
     procedure QMCuentasBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     function ProxPlantilla: integer;
     function ProxCentroCoste: integer;
  public
     { Public declarations }
     procedure AbrirPlantillas;
     procedure AbrirPlanContable(PlanContable: string);
     procedure AbrirCentrosCoste;
     procedure AbrirCuentas;
     procedure LlenaPlanesContables(List: TStrings);
     function PlanActivo: string;
     function DameTituloCuenta(Cuenta: string): string;
     procedure AdicionaRangoCuentas(Desde, Hasta: string);
     function Incompleta: boolean;
     procedure CrearImputaciones;
     procedure ReCrearImputaciones(toda_la_plantilla: integer);
     procedure ReConstruye;
  end;

var
  DMPlantillasImputacion : TDMPlantillasImputacion;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, UUtiles, UFMPlantillasImputacion;

procedure TDMPlantillasImputacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMCentrosCostePORCENTAJE.DisplayFormat := MascaraP;
  QMCuentasCUENTA.EditMask := REntorno.MascaraCuentas;
end;

procedure TDMPlantillasImputacion.AbrirPlanContable(PlanContable: string);
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

procedure TDMPlantillasImputacion.AbrirPlantillas;
begin
  with QMPlantillas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
     Open;
  end;
end;

procedure TDMPlantillasImputacion.AbrirCentrosCoste;
begin
  with QMCentrosCoste do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPlantillasImputacion.AbrirCuentas;
begin
  with QMCuentas do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPlantillasImputacion.LlenaPlanesContables(List: TStrings);
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

procedure TDMPlantillasImputacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPlantillasImputacion.QMPlantillasNewRecord(DataSet: TDataSet);
begin
  QMPlantillasEMPRESA.AsInteger := REntorno.Empresa;
  QMPlantillasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPlantillasCANAL.AsInteger := REntorno.Canal;
  QMPlantillasPLAN_CONTABLE.AsString := xPlanPLAN_CONTABLE.AsString;
  QMPlantillasID_P.AsInteger := xPlanID_P.AsInteger;
  QMPlantillasPLANTILLA.AsInteger := ProxPlantilla;
end;

function TDMPlantillasImputacion.ProxPlantilla: integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select max(plantilla) as maximo from ana_plantillas_cc where ' +
           'empresa=?empresa and ejercicio=?ejercicio and canal=?canal ' +
           'and plan_contable=?plan_contable';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        ExecQuery;
        Result := FieldByName['MAXIMO'].AsInteger + 1;
     finally
        Free;
     end;
end;

function TDMPlantillasImputacion.ProxCentroCoste: integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select max(linea) as maximo from ana_plantillas_cc_det where ' +
           'empresa=?empresa and ejercicio=?ejercicio and canal=?canal ' +
           'and plan_contable=?plan_contable and plantilla=?plantilla';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Params.ByName['PLANTILLA'].AsInteger := QMPlantillasPLANTILLA.AsInteger;
        ExecQuery;
        Result := FieldByName['MAXIMO'].AsInteger + 1;
     finally
        Free;
     end;
end;

procedure TDMPlantillasImputacion.QMCentrosCosteNewRecord(DataSet: TDataSet);
begin
  QMCentrosCosteEMPRESA.AsInteger := REntorno.Empresa;
  QMCentrosCosteEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCentrosCosteCANAL.AsInteger := REntorno.Canal;
  QMCentrosCostePLAN_CONTABLE.AsString := xPlanPLAN_CONTABLE.AsString;
  QMCentrosCosteID_P.AsInteger := xPlanID_P.AsInteger;
  QMCentrosCostePLANTILLA.AsInteger := QMPlantillasPLANTILLA.AsInteger;
  QMCentrosCosteLINEA.AsInteger := ProxCentroCoste;
  QMCentrosCostePORCENTAJE.AsFloat := 100;
end;

procedure TDMPlantillasImputacion.QMCuentasNewRecord(DataSet: TDataSet);
begin
  QMCuentasEMPRESA.AsInteger := REntorno.Empresa;
  QMCuentasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCuentasCANAL.AsInteger := REntorno.Canal;
  QMCuentasPLAN_CONTABLE.AsString := xPlanPLAN_CONTABLE.AsString;
  QMCuentasID_P.AsInteger := xPlanID_P.AsInteger;
  QMCuentasPLANTILLA.AsInteger := QMPlantillasPLANTILLA.AsInteger;
  QMCuentasPGC.AsInteger := REntorno.Pgc;
end;

function TDMPlantillasImputacion.PlanActivo: string;
begin
  Result := xPlanPLAN_CONTABLE.AsString;
end;

procedure TDMPlantillasImputacion.QMCentrosCosteCENTRO_COSTEChange(Sender: TField);
begin
  with xCentrosCoste do
  begin
     Close;
     Params.ByName['CENTRO_COSTE'].AsString := Sender.AsString;
     Open;
     QMCentrosCosteTITULO.AsString := FieldByName('TITULO').AsString;
  end;
end;

procedure TDMPlantillasImputacion.GrabaCentrosCoste(DataSet: TDataSet);
var
  marca : TBookmark;
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  marca := DataSet.GetBookmark;
  try
     QMPlantillas.Refresh;
     DataSet.GotoBookmark(marca);
  finally
     DataSet.FreeBookmark(marca);
  end;
  FMPlantillasImputacion.MuestraIncompleta;
end;

procedure TDMPlantillasImputacion.QMCuentasCUENTAChange(Sender: TField);
begin
  QMCuentasTITULO.AsString := DameTituloCuenta(Sender.AsString);
end;

function TDMPlantillasImputacion.DameTituloCuenta(Cuenta: string): string;
begin
  with xCuenta do
  begin
     Close;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Open;
     Result := FieldByName('TITULO').AsString;
  end;
end;

procedure TDMPlantillasImputacion.AdicionaRangoCuentas(Desde, Hasta: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_plantilla_adiciona_cuentas(?empresa,' +
           '?ejercicio,?canal,?plan_contable,?pgc,?plantilla,?desde,?hasta)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := xPlanPLAN_CONTABLE.AsString;
        Params.ByName['PGC'].AsInteger := REntorno.Pgc;
        Params.ByName['PLANTILLA'].AsInteger := QMPlantillasPLANTILLA.AsInteger;
        Params.ByName['DESDE'].AsString := Desde;
        Params.ByName['HASTA'].AsString := Hasta;
        TFParada.Create(Self).ExecQuery(Q);
     finally
        Free;
     end;
  QMCuentas.DisableControls;
  QMCuentas.Close;
  QMCuentas.Open;
  QMCuentas.EnableControls;
end;

function TDMPlantillasImputacion.Incompleta: boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select COMPLETA from ana_plantillas_cc where id_pl=?id_pl';
        Params.ByName['ID_PL'].AsInteger := QMPlantillasID_PL.AsInteger;
        ExecQuery;
        Result := FieldByName['COMPLETA'].AsInteger = 0;
     finally
        Free;
     end;
end;

procedure TDMPlantillasImputacion.CrearImputaciones;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_plantilla_cuentas_crea_imp(?empresa,' +
           '?ejercicio,?canal,?plan_contable,?plantilla,?id_p,?id_pl)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := QMPlantillasPLAN_CONTABLE.AsString;
        Params.ByName['PLANTILLA'].AsInteger := QMPlantillasPLANTILLA.AsInteger;
        Params.ByName['ID_P'].AsInteger := QMPlantillasID_P.AsInteger;
        Params.ByName['ID_PL'].AsInteger := QMPlantillasID_PL.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
        ShowMessage('Asignadas las nuevas cuentas');
     finally
        Free;
     end;
end;

procedure TDMPlantillasImputacion.ReCrearImputaciones(toda_la_plantilla: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_plantilla_cuentas_recrea_imp(?empresa,' +
           '?ejercicio,?canal,?plan_contable,?plantilla,?cuenta,?id_p,?id_pl,?toda_la_plant)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := QMPlantillasPLAN_CONTABLE.AsString;
        Params.ByName['PLANTILLA'].AsInteger := QMPlantillasPLANTILLA.AsInteger;
        Params.ByName['CUENTA'].AsString := QMCuentasCUENTA.AsString;
        Params.ByName['ID_P'].AsInteger := QMPlantillasID_P.AsInteger;
        Params.ByName['ID_PL'].AsInteger := QMPlantillasID_PL.AsInteger;
        Params.ByName['TODA_LA_PLANT'].AsInteger := toda_la_plantilla;
        TFParada.Create(Self).ExecQuery(Q);
        ShowMessage('Reasignadas los Centros de Coste');
     finally
        Free;
     end;
end;

procedure TDMPlantillasImputacion.ReConstruye;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure ana_reconstruye_imputaciones(?empresa,?ejercicio,' +
           '?canal,?plan_contable,?id_p)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := QMPlantillasPLAN_CONTABLE.AsString;
        Params.ByName['ID_P'].AsInteger := QMPlantillasID_P.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
        ShowMessage('Reconstrucción terminada');
     finally
        Free;
     end;
end;

procedure TDMPlantillasImputacion.QMCentrosCosteBeforeInsert(DataSet: TDataSet);
begin
  if (QMPlantillas.State in [dsInsert, dsEdit]) then
     QMPlantillas.Post;
end;

procedure TDMPlantillasImputacion.QMCuentasBeforeInsert(DataSet: TDataSet);
begin
  if (QMPlantillas.State in [dsInsert, dsEdit]) then
     QMPlantillas.Post;
end;

procedure TDMPlantillasImputacion.QMCuentasBeforePost(DataSet: TDataSet);
begin
  QMCuentasCUENTA.AsString := Trim(ExpandirCadena(QMCuentasCUENTA.AsString, REntorno.DigitosSub));
end;

end.
