unit UProDmPregPlanif;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSetRO,
  FIBDataSet, FIBQuery, HYFIBQuery;

type
  TProDMPregPlanif = class(TDataModule)
     xDArticulo: TFIBDataSetRO;
     TLocal: THYTransaction;
     DSxDArticulo: TDataSource;
     xDArticuloTITULO: TFIBStringField;
     xHArticulo: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxHArticulo: TDataSource;
     xDCliente: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     DSxDCliente: TDataSource;
     xHCliente: TFIBDataSetRO;
     FIBStringField3: TFIBStringField;
     DSxHCliente: TDataSource;
     QMinArt: THYFIBQuery;
     QMaxArt: THYFIBQuery;
     QMaxOrd: THYFIBQuery;
     QMinOrd: THYFIBQuery;
     QMinCliente: THYFIBQuery;
     QMaxCliente: THYFIBQuery;
     SP_Pro_Planifica: THYFIBQuery;
     xCalendario: TFIBDataSetRO;
     DSxCalendario: TDataSource;
     xCalendarioDESCRIPCION: TFIBStringField;
  private
     { Private declarations }
  public
     procedure Recargar(var MinArt, MaxArt: string; var MinOrd, MaxOrd, MinCliente, MaxCliente: integer);
  end;

var
  ProDMPregPlanif : TProDMPregPlanif;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

{ TProDMPregPlanif }

procedure TProDMPregPlanif.Recargar(var MinArt, MaxArt: string; var MinOrd, MaxOrd, MinCliente, MaxCliente: integer);
begin
  // Articulos
  with QMinArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     MinArt := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;
  with QMaxArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     MaxArt := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
  // Ordenes
  with QMinOrd do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     ExecQuery;
     MinOrd := FieldByName['MINIMO'].AsInteger;
     FreeHandle;
  end;
  with QMaxOrd do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     ExecQuery;
     MaxOrd := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;
  // Clientes
  with QMinCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     MinCliente := FieldByName['MINIMO'].AsInteger;
     FreeHandle;
  end;
  with QMaxCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     MaxCliente := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;
end;

end.
