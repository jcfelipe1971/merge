unit UProDMLSTEtiOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBQuery,
  HYFIBQuery, ExtCtrls, FIBTableDataSetRO;

type
  TProDMLstEtiOrden = class(TDataModule)
     TLocal: THYTransaction;
     frDBxEtiquetasCab: TfrDBDataSet;
     xEtiquetasCab: TFIBDataSetRO;
     DSxEtiquetasCab: TDataSource;
     xEtiquetasDet: TFIBDataSetRO;
     DSxEtiquetasDet: TDataSource;
     frEtiOrdenes: TfrHYReport;
     frDBxEtiquetasDet: TfrDBDataSet;
     xOrden: TFIBDataSetRO;
     DSxOrden: TDataSource;
     xEscandallo: TFIBDataSetRO;
     DSxEscandallo: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xEmpleado: TFIBDataSetRO;
     DSxEmpleado: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xEtiquetasCabAfterOpen(DataSet: TDataSet);
     procedure xEtiquetasCabBeforeClose(DataSet: TDataSet);
     procedure xOrdenAfterOpen(DataSet: TDataSet);
     procedure xOrdenBeforeClose(DataSet: TDataSet);
     procedure frEtiOrdenesGetValue(const ParName: string; var ParValue: variant);
     procedure frEtiOrdenesEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
  public
     { Public declarations }
     Capsalera, Agrupar, TipoLst, EtiquetasVacias, PrimeraEtiqueta: integer;
     FechaListado: TDateTime;
     TFiltro, Articulo: string;
     Comentario: string;
     UnidadesXBulto: double;
     procedure MostrarListado(Grupo, Modo, IdOrden, aEtiquetasVacias, Copias, aPrimeraEtiqueta: integer; aUnidadesXBulto: double);
  end;

var
  ProDMLstEtiOrden : TProDMLstEtiOrden;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.dfm}

procedure TProDMLstEtiOrden.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Capsalera := 1;
end;

procedure TProDMLstEtiOrden.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLstEtiOrden.MostrarListado(Grupo, Modo, IdOrden, aEtiquetasVacias, Copias, aPrimeraEtiqueta: integer; aUnidadesXBulto: double);
var
  str : string;
begin
  EtiquetasVacias := aEtiquetasVacias;
  UnidadesXBulto := aUnidadesXBulto;
  PrimeraEtiqueta := aPrimeraEtiqueta;

  with xEtiquetasCab do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Params.ByName['VACIAS'].AsInteger := EtiquetasVacias;
     Params.ByName['COPIAS'].AsInteger := Copias;
     Open;
  end;

  DMListados.Imprimir(Grupo, Modo, '', str, frEtiOrdenes, nil);
end;

procedure TProDMLstEtiOrden.xEtiquetasCabAfterOpen(DataSet: TDataSet);
begin
  xOrden.Open;
  xEtiquetasDet.Open;
end;

procedure TProDMLstEtiOrden.xEtiquetasCabBeforeClose(DataSet: TDataSet);
begin
  xOrden.Close;
  xEtiquetasDet.Close;
end;

procedure TProDMLstEtiOrden.xOrdenAfterOpen(DataSet: TDataSet);
begin
  xEscandallo.Open;
  xCliente.Open;
  xEmpleado.Open;
end;

procedure TProDMLstEtiOrden.xOrdenBeforeClose(DataSet: TDataSet);
begin
  xEscandallo.Close;
  xCliente.Close;
  xEmpleado.Close;
end;

procedure TProDMLstEtiOrden.frEtiOrdenesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (UpperCase(ParName) = UpperCase('UnidadesXBulto')) then
     ParValue := UnidadesXBulto;

  if (UpperCase(ParName) = UpperCase('EtiquetasVacias')) then
     ParValue := EtiquetasVacias;

  if (UpperCase(ParName) = UpperCase('PrimeraEtiqueta')) then
     ParValue := PrimeraEtiqueta;
end;

procedure TProDMLstEtiOrden.frEtiOrdenesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

end.
