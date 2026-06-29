unit UDMLstTalonesBancos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FR_Class, Fr_HYReport,
  FIBDataSet, FIBDataSetRO, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, Forms;

type
  TDMLstTalonesBancos = class(TDataModule)
     TLocal: THYTransaction;
     xLstTalonesBancos: TFIBDataSetRO;
     frTalonesBancos: TfrHYReport;
     DSxLstTalonesBancos: TDataSource;
     frDBLstTalonesBancos: TfrDBDataSet;
     xBancoD: TFIBDataSetRO;
     DSxBancoD: TDataSource;
     xBancoH: TFIBDataSetRO;
     DSxBancoH: TDataSource;
     QMaxBanco: THYFIBQuery;
     QMinBanco: THYFIBQuery;
     xLstTalonesBancosTERCERO: TIntegerField;
     xLstTalonesBancosTALON: TFIBStringField;
     xLstTalonesBancosDESCRIPCION: TFIBStringField;
     xLstTalonesBancosBANCO: TIntegerField;
     xLstTalonesBancosFECHA: TDateTimeField;
     xLstTalonesBancosIMPORTE: TFloatField;
     xLstTalonesBancosCUENTA: TFIBStringField;
     xLstTalonesBancosCUENTA_COBRO: TFIBStringField;
     xLstTalonesBancosCONTADOR: TIntegerField;
     xLstTalonesBancosTIPO: TFIBStringField;
     xLstTalonesBancosLUGAR: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     FechaDesdeLst: TDateTime;
     FechaHastaLst: TDateTime;
  public
     { Public declarations }
     procedure MostrarListado(banco_desde, banco_hasta: integer; fecha_desde, fecha_hasta: TDateTime; Modo: smallint);
     procedure CambiaBancoD(Banco: integer);
     procedure CambiaBancoH(Banco: integer);
     function DameBancoD: integer;
     function DameBancoH: integer;
  end;

var
  DMLstTalonesBancos : TDMLstTalonesBancos;

implementation

uses UDMListados, UUtiles, UEntorno, UDMMain, UFormGest, UFPregTalonesBancos;

{$R *.dfm}

{Todo : Utilizar TLocal/TUpdate}

procedure TDMLSTTalonesBancos.MostrarListado(banco_desde, banco_hasta: integer; fecha_desde, fecha_hasta: TDateTime; Modo: smallint);
var
  str : string;
begin
  FechaDesdeLst := HourIntoDate(fecha_desde, '00:00:00');
  FechaHastaLst := HourIntoDate(fecha_hasta, '23:59:59');

  with xLstTalonesBancos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_D'].AsDateTime := FechaDesdeLst;
     Params.ByName['FECHA_H'].AsDateTime := FechaHastaLst;
     Params.ByName['BANCO_D'].AsInteger := Banco_Desde;
     Params.ByName['BANCO_H'].AsInteger := Banco_Hasta;
     Open;
  end;

  DMListados.Cargar(9013, '');

  frTalonesBancos.LoadFromFIB(REntorno.Formato, str);
  frTalonesBancos.PrepareReport;
  case Modo of
     0: frTalonesBancos.ShowPreparedReport;
     1: frTalonesBancos.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstTalonesBancos.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstTalonesBancos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstTalonesBancos.CambiaBancoD(Banco: integer);
begin
  with xBancoD do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['BANCO'].AsInteger := Banco;
     Open;
  end;
end;

procedure TDMLstTalonesBancos.CambiaBancoH(Banco: integer);
begin
  with xBancoH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['BANCO'].AsInteger := Banco;
     Open;
  end;
end;

function TDMLstTalonesBancos.DameBancoD: integer;
begin
  with QMinBanco do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MINIMO'].AsInteger;
     FreeHandle;
  end;
end;

function TDMLstTalonesBancos.DameBancoH: integer;
begin
  with QMaxBanco do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;
end;

end.
