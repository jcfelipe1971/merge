unit UDMLstCierreParcialOrden;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, frxClass, frxHYReport,
  FR_Class, Fr_HYReport, DB, FIBDataSetRO, FR_DSet, FR_DBSet, UEntorno,
  FIBDataSet;

type
  TDMLstCierreParcialOrden = class(TDataModule)
     TLocal: THYTransaction;
     frDSQMCierreParcial: TfrDBDataSet;
     QMCierreParcial: TFIBDataSetRO;
     QMCierreParcialDetalle: TFIBDataSetRO;
     QMCierreParcialDetalleLote: TFIBDataSetRO;
     DSQMCierreParcial: TDataSource;
     DSQMCierreParcialDetalle: TDataSource;
     DSQMCierreParcialDetalleLote: TDataSource;
     frDSQMCierreParcialDetalle: TfrDBDataSet;
     frDSQMCierreParcialDetalleLote: TfrDBDataSet;
     frListadoCierre: TfrHYReport;
     frxListadoCierre: TfrxHYReport;
     QMCierreParcialEMPRESA: TIntegerField;
     QMCierreParcialEJERCICIO: TIntegerField;
     QMCierreParcialCANAL: TIntegerField;
     QMCierreParcialSERIE: TFIBStringField;
     QMCierreParcialCIERRE: TIntegerField;
     QMCierreParcialFECHA_CREACION: TDateTimeField;
     QMCierreParcialESTADO: TIntegerField;
     QMCierreParcialCOMENTARIO: TFIBStringField;
     QMCierreParcialID: TIntegerField;
     QMCierreParcialENTRADA: TIntegerField;
     QMCierreParcialDetalleEMPRESA: TIntegerField;
     QMCierreParcialDetalleEJERCICIO: TIntegerField;
     QMCierreParcialDetalleCANAL: TIntegerField;
     QMCierreParcialDetalleSERIE: TFIBStringField;
     QMCierreParcialDetalleCIERRE: TIntegerField;
     QMCierreParcialDetalleLINEA: TIntegerField;
     QMCierreParcialDetalleRIG_OF: TIntegerField;
     QMCierreParcialDetalleARTICULO: TFIBStringField;
     QMCierreParcialDetalleTITULO: TFIBStringField;
     QMCierreParcialDetalleORIGEN: TFIBStringField;
     QMCierreParcialDetalleALMACEN: TFIBStringField;
     QMCierreParcialDetalleUNIDADES: TFloatField;
     QMCierreParcialDetalleID: TIntegerField;
     QMCierreParcialDetalleID_CIERRE: TIntegerField;
     QMCierreParcialDetalleID_ORDEN: TIntegerField;
     QMCierreParcialDetalleRIG_MOV: TIntegerField;
     QMCierreParcialDetalleENTRADA: TIntegerField;
     QMCierreParcialDetalleLoteEMPRESA: TIntegerField;
     QMCierreParcialDetalleLoteEJERCICIO: TIntegerField;
     QMCierreParcialDetalleLoteCANAL: TIntegerField;
     QMCierreParcialDetalleLoteSERIE: TFIBStringField;
     QMCierreParcialDetalleLoteCIERRE: TIntegerField;
     QMCierreParcialDetalleLoteLINEA: TIntegerField;
     QMCierreParcialDetalleLoteSUB_LINEA: TIntegerField;
     QMCierreParcialDetalleLoteRIG_OF: TIntegerField;
     QMCierreParcialDetalleLoteTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMCierreParcialDetalleLoteLOTE: TFIBStringField;
     QMCierreParcialDetalleLoteALM_DEST: TFIBStringField;
     QMCierreParcialDetalleLoteUBICACION: TFIBStringField;
     QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS: TFloatField;
     QMCierreParcialDetalleLoteUNIDADES_POR_UL: TFloatField;
     QMCierreParcialDetalleLoteUNIDADES: TFloatField;
     QMCierreParcialDetalleLoteID: TIntegerField;
     QMCierreParcialDetalleLoteID_DET: TIntegerField;
     QMCierreParcialDetalleLoteESTADO: TIntegerField;
     QMCierreParcialDetalleLoteID_DETALLES_ST: TIntegerField;
     QMCierreParcialDetalleLoteID_UBICACION: TIntegerField;
     QMCierreParcialDetalleLoteLINEA_UBICACION: TIntegerField;
     QMCierreParcialDetalleLoteID_D_ST_UBICACION: TIntegerField;
     QMCierreParcialDetalleLoteENTRADA: TIntegerField;
     QMCierreParcialDetalleLoteID_CIERRE: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCierreParcialAfterOpen(DataSet: TDataSet);
     procedure QMCierreParcialBeforeClose(DataSet: TDataSet);
     procedure QMCierreParcialDetalleAfterOpen(DataSet: TDataSet);
     procedure QMCierreParcialDetalleBeforeClose(DataSet: TDataSet);
     procedure frListadoCierreGetValue(const ParName: string; var ParValue: variant);
     procedure frListadoCierreBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxListadoCierreBeforePrint(Sender: TfrxReportComponent);
     procedure frxListadoCierreGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraListado(modo, empresa, ejercicio, canal: integer; serie: string; cierre: integer);
  end;

var
  DMLstCierreParcialOrden : TDMLstCierreParcialOrden;

implementation

uses UDMMain, UDMListados;

{$R *.dfm}

procedure TDMLstCierreParcialOrden.MuestraListado(modo, empresa, ejercicio, canal: integer; serie: string; cierre: integer);
var
  str : string;
begin
  with QMCierreParcial do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['CIERRE'].AsInteger := Cierre;
     Open;
  end;

  DMListados.Cargar(5104, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frListadoCierre.LoadFromFIB(REntorno.Formato, str);
     frListadoCierre.PrepareReport;
     case Modo of
        0, 2: frListadoCierre.ShowPreparedReport;
        1, 3: frListadoCierre.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxListadoCierre.LoadFromFIB(REntorno.Formato, str);
     frxListadoCierre.PrepareReport;
     case Modo of
        0, 2: frxListadoCierre.ShowPreparedReport;
        1, 3: frxListadoCierre.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstCierreParcialOrden.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstCierreParcialOrden.DataModuleDestroy(Sender: TObject);
begin
  QMCierreParcial.Close;
end;

procedure TDMLstCierreParcialOrden.QMCierreParcialAfterOpen(DataSet: TDataSet);
begin
  QMCierreParcialDetalle.Open;
end;

procedure TDMLstCierreParcialOrden.QMCierreParcialBeforeClose(DataSet: TDataSet);
begin
  QMCierreParcialDetalle.Close;
end;

procedure TDMLstCierreParcialOrden.QMCierreParcialDetalleAfterOpen(DataSet: TDataSet);
begin
  QMCierreParcialDetalleLote.Open;
end;

procedure TDMLstCierreParcialOrden.QMCierreParcialDetalleBeforeClose(DataSet: TDataSet);
begin
  QMCierreParcialDetalleLote.Close;
end;

procedure TDMLstCierreParcialOrden.frListadoCierreGetValue(const ParName: string; var ParValue: variant);
{var
  pico : integer;}
begin
  if (ParName = 'PICO') then
  begin
     if (QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsInteger > 0) then
        ParValue := QMCierreParcialDetalleLoteUNIDADES.AsInteger mod QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsInteger
     else
        ParValue := 0;
  end;
  if (ParName = 'CANTIDAD') then
  begin
     if (QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsInteger > 0) then
        ParValue := (QMCierreParcialDetalleLoteUNIDADES.AsInteger div QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsInteger) * QMCierreParcialDetalleLoteUNIDADES_LOGISITCAS.AsInteger
     else
        ParValue := 0;
  end;
  if (ParName = 'UBICACION') then
  begin
     if (QMCierreParcialDetalleLoteESTADO.AsInteger = 1) then
        ParValue := 'Ubicación'
     else
        ParValue := 'Ub-P';
  end;
end;

procedure TDMLstCierreParcialOrden.frListadoCierreBeforePrint(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstCierreParcialOrden.frxListadoCierreBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstCierreParcialOrden.frxListadoCierreGetValue(const VarName: string; var Value: variant);
begin
  frListadoCierreGetValue(VarName, Value);
end;

end.
