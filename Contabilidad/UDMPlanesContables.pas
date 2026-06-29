unit UDMPlanesContables;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO, FIBTableDataSetRO, UFParada, Dialogs;

type
  TDMPlanesContables = class(TDataModule)
     TLocal: THYTransaction;
     QMPlanesContables: TFIBTableSet;
     DSQMPlanesContables: TDataSource;
     QMPlanesContablesEMPRESA: TIntegerField;
     QMPlanesContablesEJERCICIO: TIntegerField;
     QMPlanesContablesCANAL: TIntegerField;
     QMPlanesContablesPLAN_CONTABLE: TFIBStringField;
     QMPlanesContablesTITULO: TFIBStringField;
     QMPlanesContablesID_P: TIntegerField;
     xEmpresa: TFIBTableSetRO;
     DSxEmpresa: TDataSource;
     xEmpresaEMPRESA: TIntegerField;
     xEmpresaTITULO: TFIBStringField;
     QMPlanesContablesPREGUNTAR_IMPUTACION: TIntegerField;
     QMPlanesContablesPROYECTO: TIntegerField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPlanesContablesNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMPlanesContablesPROYECTOChange(Sender: TField);
     procedure QMPlanesContablesAfterOpen(DataSet: TDataSet);
     procedure QMPlanesContablesBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Ejercicios, Canales: TStringList;
     procedure BusquedaCompleja;
     procedure ActualizaEmpresa(Empresa: smallint);
     procedure LlenaEjercicios;
     procedure LlenaCanales(Ejercicio: smallint);
     procedure TraspasaPlan(Empresa, Ejercicio, Canal: smallint);
     procedure ReConstruye;
  end;

var
  DMPlanesContables : TDMPlanesContables;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, uFBusca;

procedure TDMPlanesContables.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMPlanesContables, '11100', True);

  Ejercicios := TStringList.Create;
  Canales := TStringList.Create;
end;

procedure TDMPlanesContables.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMPlanesContables.QMPlanesContablesNewRecord(DataSet: TDataSet);
begin
  QMPlanesContablesEMPRESA.AsInteger := REntorno.Empresa;
  QMPlanesContablesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPlanesContablesCANAL.AsInteger := REntorno.Canal;
  QMPlanesContablesPREGUNTAR_IMPUTACION.AsInteger := 0;
end;

procedure TDMPlanesContables.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPlanesContables, '11100');
end;

procedure TDMPlanesContables.ActualizaEmpresa(Empresa: smallint);
begin
  with xEmpresa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Open;
  end;
end;

procedure TDMPlanesContables.LlenaEjercicios;
var
  Ro : TFIBTableSetRO;
begin
  Ro := TFIBTableSetRO.Create(Self);
  with Ro do
     try
        Database := DMMain.Database;
        SelectSQL.Text := 'select ejercicio from emp_ejercicios where' +
           ' empresa=?empresa and activo=1 and bloqueado=0';
        Params.ByName['EMPRESA'].AsInteger := xEmpresaEMPRESA.AsInteger;
        Open;

        Ejercicios.Clear;
        while not EOF do
        begin
           Ejercicios.Add(FieldByName('EJERCICIO').AsString);
           Next;
        end;
     finally
        Free;
     end;
end;

procedure TDMPlanesContables.LlenaCanales(Ejercicio: smallint);
var
  Ro : TFIBTableSetRO;
begin
  Ro := TFIBTableSetRO.Create(Self);
  with Ro do
     try
        Database := DMMain.Database;
        SelectSQL.Text := 'select canal from emp_canales where' +
           ' empresa=?empresa and ejercicio=?ejercicio and' +
           ' activo=1';
        Params.ByName['EMPRESA'].AsInteger := xEmpresaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Open;

        Canales.Clear;
        while not EOF do
        begin
           Canales.Add(FieldByName('CANAL').AsString);
           Next;
        end;
     finally
        Free;
     end;
end;

procedure TDMPlanesContables.DataModuleDestroy(Sender: TObject);
begin
  Ejercicios.Free;
  Canales.Free;
end;

procedure TDMPlanesContables.TraspasaPlan(Empresa, Ejercicio, Canal: smallint);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'execute procedure n_plan_ana_traspasa(?empresa_o,' +
           '?ejercicio_o,?canal_o,?plan_contable,?empresa_d,' +
           '?ejercicio_d,?canal_d,0)';
        Params.ByName['EMPRESA_O'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO_O'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL_O'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString :=
           QMPlanesContablesPLAN_CONTABLE.AsString;
        Params.ByName['EMPRESA_D'].AsInteger := Empresa;
        Params.ByName['EJERCICIO_D'].AsInteger := Ejercicio;
        Params.ByName['CANAL_D'].AsInteger := Canal;
        TFParada.Create(Self).ExecQuery(Q);
     finally
        Free;
     end;
end;

procedure TDMPlanesContables.ReConstruye;
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
        Params.ByName['PLAN_CONTABLE'].AsString := QMPlanesContablesPLAN_CONTABLE.AsString;
        Params.ByName['ID_P'].AsInteger := QMPlanesContablesID_P.AsInteger;
        TFParada.Create(Self).ExecQuery(Q);
        ShowMessage('Reconstrucción terminada');
     finally
        Free;
     end;
end;

procedure TDMPlanesContables.QMPlanesContablesPROYECTOChange(Sender: TField);
begin
  xProyectos.Close;
  xProyectos.Open;
end;

procedure TDMPlanesContables.QMPlanesContablesAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
end;

procedure TDMPlanesContables.QMPlanesContablesBeforePost(DataSet: TDataSet);
begin
  if (QMPlanesContablesPROYECTO.AsString <= '') then
     QMPlanesContablesPROYECTO.AsInteger := -1;
end;

end.
