unit UDMLstCuadreCaja;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, frxClass, frxDBSet, frxHYReport, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados,
  FIBDataSetRO, UFormGest, FIBDataSet;

type
  TDMLstCuadreCaja = class(TDataModule)
     DSQMCabeceraFacturas: TDataSource;
     DSQMCabeceraRecibos: TDataSource;
     QMCabeceraFacturas: TFIBDataSetRO;
     QMCabeceraRecibos: TFIBDataSetRO;
     TLocal: THYTransaction;
     frListado: TfrHYReport;
     frDBCabeceraFacturas: TfrDBDataSet;
     frxListado: TfrxHYReport;
     frXDBFacturas: TfrxDBDataset;
     QMDetalleFacturas: TFIBDataSetRO;
     QMDetalleRecibos: TFIBDataSetRO;
     DSQMDetalleFacturas: TDataSource;
     DSQMDetalleRecibos: TDataSource;
     frDBDetalleFacturas: TfrDBDataSet;
     QMCabeceraAlbaranes: TFIBDataSetRO;
     QMDetalleAlbaranes: TFIBDataSetRO;
     DSQMCabeceraAlbaranes: TDataSource;
     DSQMDetalleAlbaranes: TDataSource;
     frDBCabeceraAlbaranes: TfrDBDataSet;
     frDBDetalleAlbaranes: TfrDBDataSet;
     frDBQMCabeceraRecibos: TfrDBDataSet;
     frDBQMDetalleRecibos: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frListadoGetValue(const ParName: string; var ParValue: variant);
     procedure frxListadoGetValue(const VarName: string; var Value: variant);
     procedure frListadoEnterRect(Memo: TStringList; View: TfrView);
     procedure frxListadoBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; Serie: string; FechaDesde, FechaHasta: TDateTime);
  end;

var
  DMLstCuadreCaja : TDMLstCuadreCaja;

implementation

uses
  UDMMain, UDMListados, UEntorno;

{$R *.dfm}

procedure TDMLstCuadreCaja.DataModuleCreate(Sender: TObject);
begin
  AbreData(TDMListados, DMListados);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstCuadreCaja.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstCuadreCaja.MostrarListado(Modo: integer; Serie: string; FechaDesde, FechaHasta: TDateTime);
begin
  DMListados.Normalizar_Desde_Hasta(FechaDesde, FechaHasta);

  with QMCabeceraFacturas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with QMDetalleFacturas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with QMCabeceraAlbaranes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with QMDetalleAlbaranes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with QMCabeceraRecibos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  with QMDetalleRecibos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;


  DMListados.Imprimir(749, 0, Modo, '', '', frListado, frxListado, nil);
end;

procedure TDMLstCuadreCaja.frListadoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstCuadreCaja.frxListadoGetValue(const VarName: string; var Value: variant);
begin
  frListadoGetValue(VarName, Value);
end;

procedure TDMLstCuadreCaja.frListadoEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstCuadreCaja.frxListadoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

end.
