unit UDMLstDatosTecnicos;

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, frxClass, frxHYReport, FR_Class, Fr_HYReport, FR_DSet,
  FR_DBSet, FIBDataSetRO;

type
  TDMLstDatosTecnicos = class(TDataModule)
     TLocal: THYTransaction;
     frDatosTecnicos: TfrHYReport;
     frxDatosTecnicos: TfrxHYReport;
     frDBDatosTecnicos: TfrDBDataSet;
     xLstDadosTecnicos: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(Id: integer; Empresa: integer; Modo: byte);
  end;

var
  DMLstDatosTecnicos : TDMLstDatosTecnicos;

implementation

uses UDMListados, UEntorno, UUtiles, UFormGest, UFMain, UFBusca, UDMMain;

{$R *.dfm}

procedure TDMLstDatosTecnicos.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstDatosTecnicos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstDatosTecnicos.MostrarListado(Id: integer; Empresa: integer; Modo: byte);
begin
  with xLstDadosTecnicos do
  begin
     Close;
     Params.ByName['ID'].AsInteger := Id;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Open;
  end;

  { TODO : Pasar a otro grupo. Se pisa con produccion. }
  DMListados.Imprimir(9000, 0, Modo, '', '', frDatosTecnicos, frxDatosTecnicos, nil, nil);
end;

end.
