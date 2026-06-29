unit UDMLstPromoIndirectas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSet;

type
  TDMLstPromoIndirectas = class(TDataModule)
     frPromocionesIndirectas: TfrHYReport;
     TLocal: THYTransaction;
     QMPromociones: TFIBDataSetRO;
     QMPromocionesPROMOCION: TFIBStringField;
     QMPromocionesUDS_PROMOCION: TFloatField;
     QMPromocionesPRECIO_PROMO: TFloatField;
     QMPromocionesTOTAL: TFloatField;
     DSPromociones: TDataSource;
     frDBPromociones: TfrDBDataSet;
     xMonedas: TFIBDataSetRO;
     DSMonedas: TDataSource;
     QMArticulos: TFIBDataSetRO;
     DSArticulos: TDataSource;
     frDBArticulos: TfrDBDataSet;
     QMArticulosARTICULO: TFIBStringField;
     QMArticulosTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPromocionesIndirectasGetValue(const ParName: string; var ParValue: variant);
     procedure frPromocionesIndirectasEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
     SW: integer;
     ClienteDesde, ClienteHasta: string;
     FechaDesde, FechaHasta: TDateTime;
  public
     procedure MostrarListado(ClienteD, ClienteH: string; FechaD, FechaH: TDateTime; Modo: integer);
     { Public declarations }
  end;

var
  DMLstPromoIndirectas : TDMLstPromoIndirectas;

implementation

{$R *.dfm}

uses
  UDMMain, UDMListados, UFormGest, UEntorno, Forms;

procedure TDMLstPromoIndirectas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstPromoIndirectas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstPromoIndirectas.MostrarListado(ClienteD, ClienteH: string; FechaD, FechaH: TDateTime; Modo: integer);
var
  str : string;
begin
  SW := 1;

  ClienteDesde := ClienteD;
  ClienteHasta := ClienteH;
  FechaDesde := FechaD;
  FechaHasta := FechaH;

  with QMArticulos do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with QMPromociones do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  DMListados.Cargar(170, '');
  frPromocionesIndirectas.LoadFromFIB(REntorno.Formato, str);
  frPromocionesIndirectas.PrepareReport;
  case Modo of
     0: frPromocionesIndirectas.ShowPreparedReport;
     1: frPromocionesIndirectas.PrintPreparedReport('', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstPromoIndirectas.frPromocionesIndirectasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.MonedaEmpresa;
        Open;
        ParValue := FieldByName('TITULO').AsString;
     end;

  if ParName = 'Total' then
     ParValue := FormatFloat(DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1), QMPromocionesTOTAL.AsFloat);

  if ParName = 'ClienteD' then
     ParValue := ClienteDesde;

  if ParName = 'ClienteH' then
     ParValue := ClienteHasta;

  if ParName = 'FechaD' then
     ParValue := FechaDesde;

  if ParName = 'FechaH' then
     ParValue := FechaHasta;
end;

procedure TDMLstPromoIndirectas.frPromocionesIndirectasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

end.
