unit UDMAsientosPorImputar;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBTableDataSetRO, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBQuery, HYFIBQuery;

type
  TDMAsientosPorImputar = class(TDataModule)
     DSxAsientos: TDataSource;
     TLocal: THYTransaction;
     xAsientos: TFIBTableSetRO;
     xApuntes: TFIBTableSetRO;
     DSxApuntes: TDataSource;
     xAsientosEMPRESA: TIntegerField;
     xAsientosEJERCICIO: TIntegerField;
     xAsientosCANAL: TIntegerField;
     xAsientosRIC: TIntegerField;
     xAsientosTIPO: TFIBStringField;
     xAsientosFECHA: TDateTimeField;
     xAsientosDEBE: TFloatField;
     xAsientosHABER: TFloatField;
     xAsientosTITULO: TFIBStringField;
     xAsientosFIRME: TIntegerField;
     xAsientosSALDO: TFloatField;
     xAsientosLINEAS: TIntegerField;
     xAsientosENTRADA: TIntegerField;
     xAsientosASIENTO: TIntegerField;
     xAsientosAGRUPACION_GENERAL: TIntegerField;
     xAsientosIMPUTACION: TIntegerField;
     xApuntesEMPRESA: TIntegerField;
     xApuntesEJERCICIO: TIntegerField;
     xApuntesCANAL: TIntegerField;
     xApuntesRIC: TIntegerField;
     xApuntesLINEA: TIntegerField;
     xApuntesCUENTA: TFIBStringField;
     xApuntesSIGNO: TFIBStringField;
     xApuntesTEXTO: TFIBStringField;
     xApuntesIMPORTE: TFloatField;
     xApuntesENTRADA: TIntegerField;
     xApuntesDOC_NUMERO: TIntegerField;
     xApuntesDOC_SERIE: TFIBStringField;
     xApuntesDOC_FECHA: TDateTimeField;
     xApuntesPUNTEO: TIntegerField;
     xApuntesTIPO: TFIBStringField;
     xApuntesCargo: TStringField;
     xApuntesAbono: TStringField;
     xApuntesPROYECTO: TIntegerField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xApuntesTITULO_PROYECTO: TStringField;
     xProyectosField: TFIBDataSetRO;
     DSxProyectosField: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure xAsientosAfterOpen(DataSet: TDataSet);
     procedure xApuntesCargoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xApuntesAbonoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xApuntesTITULO_PROYECTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     PLAN_CONTABLE: string;
     procedure AbrirAsientos(Tipo: string; FechaD, FechaH: TDateTime; PlanC: string; Proyecto: integer);
     procedure DameDatosIniciales(var FechaD, FechaH: TDateTime; var proyecto: integer);
     function RIC: integer;
  end;

var
  DMAsientosPorImputar : TDMAsientosPorImputar;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, DateUtils;

procedure TDMAsientosPorImputar.DataModuleCreate(Sender: TObject);
var
  Formato : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Formato := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  xAsientosDEBE.DisplayFormat := Formato;
  xAsientosHABER.DisplayFormat := Formato;
  xApuntesIMPORTE.DisplayFormat := Formato;
  xProyectos.Open;
end;

procedure TDMAsientosPorImputar.AbrirAsientos(Tipo: string; FechaD, FechaH: TDateTime; PlanC: string; Proyecto: integer);
begin
  Plan_contable := Planc;
  with xAsientos do
  begin
     Close;
     SelectSQL.Text :=
        'select * from con_cuentas_asientos c join ana_con_cuentas_asientos_imp i ' +
        'on (c.empresa=i.empresa and c.ejercicio=i.ejercicio and c.canal=i.canal and c.ric=i.ric) ' +
        'where c.empresa=?empresa and c.ejercicio=?ejercicio and c.canal=?canal and i.imputacion=1 and ' +
        'c.fecha>=?desde and c.fecha<=?hasta and i.plan_contable=?plan_contable and ' +
        '( ((select count(proyecto) from con_cuentas_apuntes where empresa=?empresa and ' +
        '    ejercicio=?ejercicio and canal=?canal and ric=c.ric and proyecto=?proyecto)>0) or (?proyecto=0) )';
     if (Tipo <> '') then
     begin
        SelectSQL.Text := SelectSQL.Text + ' and tipo=?tipo';
        Params.ByName['TIPO'].AsString := Tipo;
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := StartOfTheDay(FechaD);
     Params.ByName['HASTA'].AsDateTime := EndOfTheDay(FechaH);
     Params.ByName['PLAN_CONTABLE'].AsString := Planc;
     Params.ByName['PROYECTO'].AsInteger := Proyecto;
     Open;
  end;
end;

procedure TDMAsientosPorImputar.xAsientosAfterOpen(DataSet: TDataSet);
begin
  xApuntes.Close;
  xApuntes.Open;
end;

procedure TDMAsientosPorImputar.DameDatosIniciales(var FechaD, FechaH: TDateTime; var proyecto: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        // Calculo de las fechas
        Database := DMMain.Database;
        SQL.Text := 'select max(fecha) as MAXIMA, min(fecha) MINIMA ' +
           ' from con_cuentas_asientos c ' +
           ' join ana_con_cuentas_asientos_imp i ' +
           ' on (c.empresa=i.empresa and c.ejercicio=i.ejercicio and c.canal=i.canal and c.ric=i.ric)' +
           ' where c.empresa=?empresa and c.ejercicio=?ejercicio and c.canal=?canal and ' +
           ' i.plan_contable=?plan_contable';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := Plan_contable;
        ExecQuery;
        FechaD := FieldByName['MINIMA'].AsDateTime;
        FechaH := FieldByName['MAXIMA'].AsDateTime;
        FreeHandle;

        // Calculo del proyecto del plan contable, si es que tiene
        Database := DMMain.Database;
        SQL.Text := 'select proyecto from ana_plan_contable ' +
           ' where empresa=?empresa and ejercicio=?ejercicio and canal=?canal ' +
           ' and plan_contable=?plan_contable';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PLAN_CONTABLE'].AsString := Plan_contable;
        ExecQuery;
        if (FieldByName['PROYECTO'].isNull) then
           proyecto := 0
        else
           proyecto := FieldByName['PROYECTO'].AsInteger;
     finally
        Free;
     end;
end;

function TDMAsientosPorImputar.RIC: integer;
begin
  Result := xAsientosRIC.AsInteger;
end;

procedure TDMAsientosPorImputar.xApuntesCargoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xApuntesSIGNO.AsString = 'D') then
     Text := xApuntesCUENTA.AsString;
end;

procedure TDMAsientosPorImputar.xApuntesAbonoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xApuntesSIGNO.AsString = 'H') then
     Text := xApuntesCUENTA.AsString;
end;

procedure TDMAsientosPorImputar.xApuntesTITULO_PROYECTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xProyectosField do
  begin
     Close;
     Open;
     Text := FieldByName('TITULO').AsString;
  end;
end;

end.
