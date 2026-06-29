unit UDMGenFormasPago;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, FIBDataSetRO;

type
  TDMGenFormasPago = class(TDataModule)
     QMFormaPago: TFIBTableSet;
     DSQMFormaPago: TDataSource;
     TLocal: THYTransaction;
     QMFormaPagoEMPRESA: TIntegerField;
     QMFormaPagoEJERCICIO: TIntegerField;
     QMFormaPagoCANAL: TIntegerField;
     QMFormaPagoFORMA_PAGO: TFIBStringField;
     QMFormaPagoCUENTA: TFIBStringField;
     QMFormaPagoTITULO: TFIBStringField;
     QMFormaPagoPLAZOS: TIntegerField;
     QMFormaPagoDIAS_1_PLAZO: TIntegerField;
     QMFormaPagoDIAS_E_PLAZOS: TIntegerField;
     QMFormaPagoTIPO_EFECTO: TFIBStringField;
     QMFormaPagoREMESAR: TIntegerField;
     QMFormaPagoPRONTO_PAGO: TIntegerField;
     QMFormaPagoACEPTAR: TIntegerField;
     QMFormaPagoTIPO_PAGO: TFIBStringField;
     QMFormaPagoPAGO_AUTOMATICO: TIntegerField;
     QMFormaPagoDATOS_BANCARIOS: TFIBStringField;
     QMFormaPagoHEREDA_FINANCIACION: TIntegerField;
     QMFormaPagoORDENAR_PAGO: TIntegerField;
     QMFormaPagoMES_NATURAL: TIntegerField;
     TUpdate: THYTransaction;
     QMFormaPagoIMPORTE_MINIMO: TFloatField;
     QMFormaPagoFORMA_ALTERNATIVA: TFIBStringField;
     QMFormaPagoPEDIR_DETALLE_PAGO: TIntegerField;
     QMFormaPagoTITULO_LARGO: TFIBStringField;
     QMSeries: TFIBTableSet;
     DSQMSeries: TDataSource;
     QMSeriesEMPRESA: TIntegerField;
     QMSeriesEJERCICIO: TIntegerField;
     QMSeriesCANAL: TIntegerField;
     QMSeriesFORMA_PAGO: TFIBStringField;
     QMSeriesSERIE: TFIBStringField;
     QMSeriesTITULO: TFIBStringField;
     QMSeriesCUENTA_PAGO: TFIBStringField;
     QMFormaPagoACTIVO: TIntegerField;
     QMSuplemento: TFIBTableSet;
     DSQMSuplemento: TDataSource;
     QMSuplementoEMPRESA: TIntegerField;
     QMSuplementoEJERCICIO: TIntegerField;
     QMSuplementoCANAL: TIntegerField;
     QMSuplementoFORMA_PAGO: TFIBStringField;
     QMSuplementoACREEDOR: TIntegerField;
     QMSuplementoPAIS: TFIBStringField;
     QMSuplementoIMPORTE_SUPLEMENTO: TFloatField;
     QMSuplementoTITULO: TStringField;
     QMFormaPagoDIVIDE_ASIENTO_COMISION_TARJETA: TIntegerField;
     QMFormaPagoCUENTA_PAGO_COMISION_TARJETA: TFIBStringField;
     QMFormaPagoCOMISION_TARJETA: TFloatField;
     QMSeriesDIVIDE_ASIENTO_COMISION_TARJETA: TIntegerField;
     QMSeriesCUENTA_PAGO_COMISION_TARJETA: TFIBStringField;
     QMFormaPagoSIN_RECIBOS: TIntegerField;
     procedure DMFormasPagoCreate(Sender: TObject);
     procedure QMFormaPagoNewRecord(DataSet: TDataSet);
     procedure QMFormaPagoAfterOpen(DataSet: TDataSet);
     procedure QMFormaPagoBeforeClose(DataSet: TDataSet);
     procedure QMSeriesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMSeriesNewRecord(DataSet: TDataSet);
     procedure QMSuplementoNewRecord(DataSet: TDataSet);
     procedure QMSuplementoTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure Regenera;
     function Edicion: smallint;
  end;

var
  DMGenFormasPago : TDMGenFormasPago;

implementation

uses UDMMain, UFBusca, UEntorno, UDameDato;

{$R *.DFM}

procedure TDMGenFormasPago.DMFormasPagoCreate(Sender: TObject);
var
  MascaraMoneda : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  MascaraMoneda := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  QMFormaPagoIMPORTE_MINIMO.DisplayFormat := MascaraMoneda;
  QMFormaPagoCOMISION_TARJETA.DisplayFormat := MascaraP;
  QMSuplementoIMPORTE_SUPLEMENTO.DisplayFormat := MascaraMoneda;

  DMMain.FiltraTabla(QMFormaPago, '11100', True);
end;

procedure TDMGenFormasPago.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFormaPago, '11100');
end;

procedure TDMGenFormasPago.QMFormaPagoNewRecord(DataSet: TDataSet);
begin
  QMFormaPagoTIPO_EFECTO.AsString := 'CON';
  QMFormaPagoEMPRESA.AsInteger := REntorno.Empresa;
  QMFormaPagoEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMFormaPagoCANAL.AsInteger := REntorno.Canal;
  QMFormaPagoHEREDA_FINANCIACION.AsInteger := 0;
  QMFormaPagoORDENAR_PAGO.AsInteger := 0;
  QMFormaPagoACTIVO.AsInteger := 1;
  QMFormaPagoDIVIDE_ASIENTO_COMISION_TARJETA.AsInteger := 0;
  QMFormaPagoCUENTA_PAGO_COMISION_TARJETA.AsString := '';
  QMFormaPagoCOMISION_TARJETA.AsFloat := 0;
  QMFormaPagoSIN_RECIBOS.AsInteger := 0;
end;

procedure TDMGenFormasPago.QMFormaPagoAfterOpen(DataSet: TDataSet);
begin
  QMSeries.Open;
  QMSuplemento.Open;
end;

function TDMGenFormasPago.Edicion: smallint;
begin
  Result := 0;
  if ((QMFormaPago.State = dsInsert) or (QMFormaPago.State = dsEdit)) then
     Result := 1;
end;

procedure TDMGenFormasPago.Regenera;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_GES_FP_REGENERA (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMFormaPago.Close;
  QMFormaPago.Open;
end;

procedure TDMGenFormasPago.QMFormaPagoBeforeClose(DataSet: TDataSet);
begin
  QMSeries.Close;
  QMSuplemento.Close;
end;

procedure TDMGenFormasPago.QMSeriesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloCuenta(QMSeriesCUENTA_PAGO.AsString);
end;

procedure TDMGenFormasPago.QMSeriesNewRecord(DataSet: TDataSet);
begin
  QMSeriesEMPRESA.AsInteger := QMFormaPagoEMPRESA.AsInteger;
  QMSeriesEJERCICIO.AsInteger := QMFormaPagoEJERCICIO.AsInteger;
  QMSeriesCANAL.AsInteger := QMFormaPagoCANAL.AsInteger;
  QMSeriesFORMA_PAGO.AsString := QMFormaPagoFORMA_PAGO.AsString;
  QMSeriesDIVIDE_ASIENTO_COMISION_TARJETA.AsInteger := QMFormaPagoDIVIDE_ASIENTO_COMISION_TARJETA.AsInteger;
  QMSeriesCUENTA_PAGO_COMISION_TARJETA.AsFloat := QMFormaPagoCUENTA_PAGO_COMISION_TARJETA.AsInteger;
end;

procedure TDMGenFormasPago.QMSuplementoNewRecord(DataSet: TDataSet);
begin
  QMSuplementoEMPRESA.AsInteger := QMFormaPagoEMPRESA.AsInteger;
  QMSuplementoEJERCICIO.AsInteger := QMFormaPagoEJERCICIO.AsInteger;
  QMSuplementoCANAL.AsInteger := QMFormaPagoCANAL.AsInteger;
  QMSuplementoFORMA_PAGO.AsString := QMFormaPagoFORMA_PAGO.AsString;
  QMSuplementoPAIS.AsString := 'ZZZ';
end;

procedure TDMGenFormasPago.QMSuplementoTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloAcreedor(QMSuplementoACREEDOR.AsInteger);
end;

end.
