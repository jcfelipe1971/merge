unit UDMCreaPlanContProy;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMCreaPlanContProy = class(TDataModule)
     TLocal: THYTransaction;
     SPCreaContabilidad: THYFIBQuery;
     xPlanContableOrigen: TFIBDataSetRO;
     DSxPlanContableOrigen: TDataSource;
     xPlanContableOrigenINDICE_SUFIJO: TIntegerField;
     xPlanContableOrigenSUFIJO_CONTABLE: TFIBStringField;
     xPlanContableOrigenTITULO: TFIBStringField;
     xPlanContableOrigenPLAN_CONTABLE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Actualiza(plan_contable: string);
     procedure CreaPlanContable(canal, proyecto, indice_sufijo, actualiza_estructura: integer; plan_cont_origen, sufijo_contable: string);
     function DameNombreProyecto(proyecto: integer): string;
     function DameMinPlanContable: string;
  end;

var
  DMCreaPlanContProy : TDMCreaPlanContProy;

implementation

uses UDMMain, UEntorno, UFParada;

{$R *.DFM}

procedure TDMCreaPlanContProy.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMCreaPlanContProy.Actualiza(plan_contable: string);
begin
  with xPlanContableOrigen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PLAN_CONTABLE'].AsString := plan_contable;
     Open;
  end;
end;

procedure TDMCreaPlanContProy.CreaPlanContable(canal, proyecto, indice_sufijo, actualiza_estructura: integer; plan_cont_origen, sufijo_contable: string);
begin
  with SPCreaContabilidad do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['PROYECTO'].AsInteger := proyecto;
     Params.ByName['PLAN_CONTABLE_ORIGEN'].AsString := plan_cont_origen;
     Params.ByName['INDICE'].AsInteger := indice_sufijo;
     Params.ByName['ACTUALIZA_E_ANA'].AsInteger := actualiza_estructura;
     Params.ByName['SUFIJO_CONTABLE'].AsString := sufijo_contable;

     TFParada.Create(Self).ExecQuery(SPCreaContabilidad);
     FreeHandle;
  end;
end;

function TDMCreaPlanContProy.DameNombreProyecto(proyecto: integer): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Add('SELECT TITULO FROM EMP_PROYECTOS WHERE EMPRESA=?EMPRESA AND PROYECTO=?PROYECTO');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROYECTO'].AsInteger := proyecto;
     ExecQuery;
     Result := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

function TDMCreaPlanContProy.DameMinPlanContable: string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Add('SELECT MIN(PLAN_CONTABLE) FROM ANA_PLAN_CONTABLE ');
     SQL.Add('WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND PROYECTO>0 ');
     SQL.Add('GROUP BY ID_P ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     Result := FieldByName['MIN'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

end.
