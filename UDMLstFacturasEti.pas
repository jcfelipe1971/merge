unit UDMLstFacturasEti;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados, FR_DSet, FR_DBSet,
  DB, FIBDataSet, FIBTableDataSet, FIBDataSetRO, FIBDataSetRW, UHYReport;

type
  TDMLstFacturasEti = class(TDataModule)
     DSxEtiquetas: TDataSource;
     frDBxEtiquetas: TfrDBDataSet;
     TLocal: THYTransaction;
     frFacturas: TfrHYReport;
     xEtiquetas: TFIBDataSetRO;
     frDBDCabecera: TfrDBDataSet;
     QMCabecera: TFIBDataSetRW;
     DSQMCabecera: TDataSource;
     frDBCabAlbaran: TfrDBDataSet;
     QMCabAlbaran: TFIBDataSetRW;
     DSQMCabAlbaran: TDataSource;
     QSPProcedencia: TFIBDataSetRW;
     xDireccionAlbaran: TFIBDataSetRO;
     DSxDireccionAlbaran: TDataSource;
     frDBxDireccionAlbaran: TfrDBDataSet;
     HYReport: THYReport;
     HYREtiquetas: THYReportSource;
     HYRCabecera: THYReportSource;
     HYRQMCabAlbaran: THYReportSource;
     HYRxDireccionAlbaran: THYReportSource;
     DSQSPProcedencia: TDataSource;
     procedure DMLstFacturasEtiCreate(Sender: TObject);
     procedure DMLstFacturasEtiDestroy(Sender: TObject);
     procedure frFacturasGetValue(const ParName: string; var ParValue: variant);
     procedure frFacturasBeforePrint(Memo: TStringList; View: TfrView);
     procedure xEtiquetasAfterOpen(DataSet: TDataSet);
     procedure xEtiquetasBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QSPProcedenciaAfterOpen(DataSet: TDataSet);
     procedure QSPProcedenciaBeforeClose(DataSet: TDataSet);
     procedure QMCabAlbaranAfterOpen(DataSet: TDataSet);
     procedure QMCabAlbaranBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Factura: integer;
     Fecha_Fac: TDateTime;
     Copias: integer;
     procedure MostrarListado(Ejercicio, Rig, vacias, copias: integer; fecha: TDateTime; Modo: byte; serie: string);
  end;

var
  DMLstFacturasEti : TDMLstFacturasEti;

implementation

uses UDMListados, UFormGest, UEntorno, UDMMain;

{$R *.DFM}

procedure TDMLstFacturasEti.DMLstFacturasEtiCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMLstFacturasEti.DMLstFacturasEtiDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstFacturasEti.frFacturasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Factura' then
     ParValue := Factura;
  if ParName = 'Fecha' then
     ParValue := Fecha_Fac;
  if ParName = 'Copias' then
     ParValue := Copias;
end;

procedure TDMLstFacturasEti.MostrarListado(Ejercicio, Rig, vacias, copias: integer; fecha: TDateTime; Modo: byte; serie: string);
var
  str : string;
begin
  Factura := Rig;
  Fecha_Fac := fecha;
  with xEtiquetas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['VACIAS'].AsInteger := vacias;
     Params.ByName['COPIAS'].AsInteger := copias;
     Params.ByName['TIPO'].AsString := 'FAC';
     Open;
  end;

  DMListados.Cargar(60, serie);
  frFacturas.LoadFromFIB(REntorno.Formato, str);
  frFacturas.PrepareReport;
  case Modo of
     0: frFacturas.ShowPreparedReport;
     1: frFacturas.PrintPreparedReport(' ', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstFacturasEti.frFacturasBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstFacturasEti.xEtiquetasAfterOpen(DataSet: TDataSet);
begin
  QMCabecera.Open;
end;

procedure TDMLstFacturasEti.xEtiquetasBeforeClose(DataSet: TDataSet);
begin
  QMCabecera.Close;
end;

procedure TDMLstFacturasEti.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QSPProcedencia.Open;
end;

procedure TDMLstFacturasEti.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QSPProcedencia.Close;
end;

procedure TDMLstFacturasEti.QSPProcedenciaAfterOpen(DataSet: TDataSet);
begin
  QMCabAlbaran.Open;
end;

procedure TDMLstFacturasEti.QSPProcedenciaBeforeClose(DataSet: TDataSet);
begin
  QMCabAlbaran.Close;
end;

procedure TDMLstFacturasEti.QMCabAlbaranAfterOpen(DataSet: TDataSet);
begin
  xDireccionAlbaran.Open;
end;

procedure TDMLstFacturasEti.QMCabAlbaranBeforeClose(DataSet: TDataSet);
begin
  xDireccionAlbaran.Close;
end;

end.
