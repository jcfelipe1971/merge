unit UDMRAnaPlan;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMRAnaPlan = class(TDataModule)
     xAnaPlan: TFIBDataSetRO;
     frAnaPlan: TfrHYReport;
     DSxAnaPlan: TDataSource;
     frDSAnaPlan: TfrDBDataSet;
     xCc_Desde: TFIBDataSetRO;
     DSxCc_Desde: TDataSource;
     xCc_Hasta: TFIBDataSetRO;
     DSxCc_Hasta: TDataSource;
     TLocal: THYTransaction;
     xAnaPlanCENTRO_COSTE: TFIBStringField;
     xAnaPlanTITULO: TFIBStringField;
     xAnaPlanNIVEL: TIntegerField;
     frxAnaPlan: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRPlanCuentasCreate(Sender: TObject);
     procedure frAnaPlanGetValue(const ParName: string; var ParValue: variant);
     procedure frAnaPlanEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRPlanCuentasDestroy(Sender: TObject);
     procedure frxAnaPlanBeforePrint(Sender: TfrxReportComponent);
     procedure frxAnaPlanGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     procedure AbrirDatos;
  public
     { Public declarations }
     Cc_Desde: string;
     Cc_Hasta: string;
     N_Desde: smallint;
     N_Hasta: smallint;
     Char_Relleno: char;
     Titulo: string;
     FechaListado: TDateTime;
     Niveles: TStringList;
     procedure Rangos;
     procedure MostrarInforme(modo: smallint);
     procedure Actualiza_Cc(Tabla: TFIBDataSetRO; CentroCoste: string);
     procedure LlenarNiveles;
     function CompletarCc(CentroCoste: string): string;
  end;

var
  DMRAnaPlan : TDMRAnaPlan;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UDMPlanesContables;

{$R *.DFM}

procedure TDMRAnaPlan.DMRPlanCuentasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  // Abrir la transacción
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  AbreData(TDMPlanesContables, DMPlanesContables);
  Niveles := TStringList.Create;
end;

procedure TDMRAnaPlan.DMRPlanCuentasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  CierraData(DMPlanesContables);
  Niveles.Free;
  Application.ProcessMessages;
end;

procedure TDMRAnaPlan.AbrirDatos;
begin
  with xAnaPlan do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString :=
        DMPlanesContables.QMPlanesContablesPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE_INI'].AsString := Cc_Desde;
     Params.ByName['CENTRO_COSTE_FIN'].AsString := Cc_Hasta;
     Params.ByName['NIVEL_INI'].AsInteger := N_Desde;
     Params.ByName['NIVEL_FIN'].AsInteger := N_Hasta;
     Open;
  end;
end;

procedure TDMRAnaPlan.Rangos;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'select min(centro_coste) as minimo,max(centro_coste) as maximo' +
           ' from ana_centros_coste where empresa=?empresa and' +
           ' ejercicio=?ejercicio and canal=?canal and' +
           ' plan_contable=?plan_contable';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString :=
           DMPlanesContables.QMPlanesContablesPLAN_CONTABLE.AsString;
        ExecQuery;
        Cc_Desde := FieldByName['MINIMO'].AsString;
        Cc_Hasta := FieldByName['MAXIMO'].AsString;
     finally
        Free;
     end;
end;

procedure TDMRAnaPlan.MostrarInforme(modo: smallint);
var
  str : string;
begin
  SW := 1;

  AbrirDatos;

  DMListados.Cargar(604, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAnaPlan.LoadFromFIB(REntorno.Formato, str);
     frAnaPlan.PrepareReport;
     case modo of
        0: frAnaPlan.ShowPreparedReport;
        1: frAnaPlan.PrintPreparedReport('', 1);
     end;
  end
  else
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAnaPlan.LoadFromFIB(REntorno.Formato, str);
     frxAnaPlan.PrepareReport;
     case modo of
        0: frxAnaPlan.ShowPreparedReport;
        1: frxAnaPlan.PrintPreparedReport('', 1);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMRAnaPlan.frAnaPlanGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FECHA_LIST' then
     ParValue := FechaListado;

  if ParName = 'TITULO' then
     ParValue := Titulo;

  if ParName = 'DESC1' then
     ParValue := Format(_('Desde el Centro de Coste %s %s'), [Cc_Desde, xCc_Desde.FieldByName('TITULO').AsString]);

  if ParName = 'DESC2' then
     ParValue := Format(_('Hasta el Centro de Coste %s %s'), [Cc_Hasta, xCc_Hasta.FieldByName('TITULO').AsString]);

  if ParName = 'DESC3' then
     ParValue := Format(_('Desde el Nivel %d hasta el Nivel %d'), [N_Desde, N_Hasta]);

  if ParName = 'CentroCoste' then
     ParValue := CompletarCc(xAnaPlanCENTRO_COSTE.AsString);
end;

procedure TDMRAnaPlan.frAnaPlanEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

{ Actualiza la cuenta (bien Desde o bien Hasta) de la tabla deseada }
procedure TDMRAnaPlan.Actualiza_Cc(Tabla: TFIBDataSetRO; CentroCoste: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PLAN_CONTABLE'].AsString :=
        DMPlanesContables.QMPlanesContablesPLAN_CONTABLE.AsString;
     Params.ByName['CENTRO_COSTE'].AsString := CentroCoste;
     Open;
  end;
end;

procedure TDMRAnaPlan.LlenarNiveles;
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
        Params.ByName['PLAN_CONTABLE'].AsString :=
           DMPlanesContables.QMPlanesContablesPLAN_CONTABLE.AsString;
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

function TDMRAnaPlan.CompletarCc(CentroCoste: string): string;
begin
  Result := CentroCoste + StringOfChar(Char_Relleno, 10 - Length(CentroCoste));
end;

procedure TDMRAnaPlan.frxAnaPlanBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMRAnaPlan.frxAnaPlanGetValue(const VarName: string; var Value: variant);
begin
  frAnaPlanGetValue(VarName, Value);
end;

end.
