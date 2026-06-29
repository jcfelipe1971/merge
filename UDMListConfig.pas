unit UDMListConfig;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados, FR_Class, Fr_HYReport, UHYReport, HYFIBQuery, FIBDataSetRO,
  UHYReportMail, frxClass, frxHYReport;

type
  TDMListConfig = class(TDataModule)
     QMGrupo: TFIBDataSetRO;
     DSQMGrupo: TDataSource;
     TLocal: THYTransaction;
     frListado: TfrHYReport;
     xListadoDef: TFIBDataSetRO;
     DSxListadoDef: TDataSource;
     xListadoCab: TFIBDataSetRO;
     DSxListadoCab: TDataSource;
     QMGrupoGRUPO: TIntegerField;
     QMGrupoTITULO: TFIBStringField;
     QMGrupoLISTADODEF: TIntegerField;
     QMGrupoCOPIAS: TIntegerField;
     QMGrupoPIJAMA: TIntegerField;
     xListadoEEC: TFIBDataSetRO;
     xListadoEECEMPRESA: TIntegerField;
     xListadoEECEJERCICIO: TIntegerField;
     xListadoEECCANAL: TIntegerField;
     xListadoEECGRUPO: TIntegerField;
     xListadoEECLISTADODEF: TIntegerField;
     DSxListadoEEC: TDataSource;
     xListadoDefLISTADO: TIntegerField;
     xListadoDefGRUPO: TIntegerField;
     xListadoDefTITULO: TFIBStringField;
     xListadoDefDEF_LISTADO: TBlobField;
     xListadoDefEDITABLE: TIntegerField;
     xListadoDefCABECERA: TIntegerField;
     xListadoDefTIPO: TFIBStringField;
     xListadoCabLISTADO: TIntegerField;
     xListadoCabGRUPO: TIntegerField;
     xListadoCabTITULO: TFIBStringField;
     xListadoCabDEF_LISTADO: TBlobField;
     xListadoCabEDITABLE: TIntegerField;
     xListadoCabCABECERA: TIntegerField;
     xListadoCabTIPO: TFIBStringField;
     HYReport: THYReport;
     HYReportMail: THYReportMail;
     frxListado: TfrxHYReport;
     procedure DMListCreate(Sender: TObject);
  private
     { Private declarations }
  public
     procedure Carga(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; var GrupoStr, TipoListado: string; Serie: string);
     procedure CambiaFormato(List: integer; var Cabecera: integer; var Tipo: string);
     procedure CambiaCabecera(List: integer);
     procedure Disenyar;
     procedure PorDefecto(Formato, Grupo: string);
  end;

var
  DMListConfig : TDMListConfig;

implementation

uses UDMMain, UUtiles, UEntorno;

{$R *.DFM}

procedure TDMListConfig.DMListCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMListConfig.Carga(Grupo: integer; var Formato, Cabecera, Copias, Pijama: integer; var GrupoStr, TipoListado: string; Serie: string);
begin
  with QMGrupo do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Open;
  end;

  Formato := 0;
  if (Serie <> '') then
  begin
     // Listado por Empresa, Ejercicio, Canal y Serie
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT LISTADODEF FROM DIC_LISTADOS_GRUPOS_EECS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' GRUPO = :GRUPO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['GRUPO'].AsInteger := Grupo;
           ExecQuery;
           Formato := FieldByName['LISTADODEF'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (Formato = 0) then
  begin
     with xListadoEEC do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Open;
        Formato := xListadoEECLISTADODEF.AsInteger;
     end;
  end;

  xListadoDef.Close;
  if (Formato = 0) then
     xListadoDef.Params.ByName['LISTADODEF'].AsInteger := QMGrupoLISTADODEF.AsInteger
  else
     xListadoDef.Params.ByName['LISTADODEF'].AsInteger := Formato;

  xListadoDef.Open;
  CambiaCabecera(xListadoDefCabecera.AsInteger);

  Formato := xListadoDefLISTADO.AsInteger;
  Cabecera := xListadoCabLISTADO.AsInteger;
  Copias := QMGrupoCOPIAS.AsInteger;
  Pijama := QMGrupoPIJAMA.AsInteger;
  GrupoStr := QMGrupoTITULO.AsString;
  TipoListado := xListadoDefTIPO.AsString;
end;

procedure TDMListConfig.Disenyar;
var
  Listado, ModoEnter : integer;
  str : string;
  TipoListado : string[3];
begin
  Listado := xListadoDefLISTADO.AsInteger;
  TipoListado := xListadoDefTIPO.AsString;

  if (TipoListado = 'FRF') then       // Listado FastReport
  begin
     frListado.LoadFromFIB(Listado, str);
     frListado.DesignReport;
  end
  else if (TipoListado = 'HYR') then  // Listado HYReport
  begin
     HYReport.ValorCodigo := Listado;
     ModoEnter := REntorno.ModoEnter;  // Guardar Modo Enter
     REntorno.ModoEnter := 0;
     HYReport.Edit;
     REntorno.ModoEnter := ModoEnter;  // Restaurar Modo Enter
  end
  else if (TipoListado = 'HYM') then  // Listado HYReportMail
  begin
     HYReportMail.ValorCodigo := Listado;
     ModoEnter := REntorno.ModoEnter;  // Guardar Modo Enter
     REntorno.ModoEnter := 0;
     HYReportMail.Edit;
     REntorno.ModoEnter := ModoEnter;  // Restaurar Modo Enter
  end
  else if (TipoListado = 'FR3') then       // Listado FastReport 3
  begin
     frxListado.LoadFromFIB(Listado, str);
     frxListado.DesignReport;
  end;
end;

procedure TDMListConfig.CambiaFormato(List: integer; var Cabecera: integer; var Tipo: string);
begin
  xListadoDef.Close;
  xListadoDef.Params.ByName['LISTADODEF'].AsInteger := List;
  xListadoDef.Open;
  Tipo := xListadoDefTIPO.AsString;

  CambiaCabecera(xListadoDefCabecera.AsInteger);
  Cabecera := xListadoDefCabecera.AsInteger;
end;

procedure TDMListConfig.CambiaCabecera(List: integer);
begin
  xListadoCab.Close;
  xListadoCab.Params.ByName['CABECERA'].AsInteger := List;
  xListadoCab.Open;
end;

procedure TDMListConfig.PorDefecto(Formato, Grupo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE L_CAMBIA_LISTADO_DEFECTO(:EMPRESA, :EJERCICIO, :CANAL, :GRUPO, :LISTADO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['GRUPO'].AsInteger := StrToInt(Grupo);
        Params.ByName['LISTADO'].AsInteger := StrToInt(Formato);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
