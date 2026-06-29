unit UDMFormasPago;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  FIBDataSetRO;

type
  TDMFormasPago = class(TDataModule)
     QMFormaPago: TFIBTableSet;
     DSQMFormaPago: TDataSource;
     DSxTipoEfecto: TDataSource;
     TLocal: THYTransaction;
     QMFormaPagoFORMA: TFIBStringField;
     QMFormaPagoTITULO: TFIBStringField;
     QMFormaPagoPLAZOS: TIntegerField;
     QMFormaPagoDIAS_1_PLAZO: TIntegerField;
     QMFormaPagoDIAS_E_PLAZOS: TIntegerField;
     QMFormaPagoTIPO_EFECTO: TFIBStringField;
     QMFormaPagoREMESAR: TIntegerField;
     QMFormaPagoPRONTO_PAGO: TIntegerField;
     QMFormaPagoACEPTAR: TIntegerField;
     QMFormaPagoPAGO_AUTOMATICO: TIntegerField;
     xTipoEfecto: TFIBDataSetRO;
     QMFormaPagoDATOS_BANCARIOS: TFIBStringField;
     QMFormaPagoHEREDA_FINANCIACION: TIntegerField;
     QMFormasPagoIdioma: TFIBTableSet;
     DSQMFormasPagoIdioma: TDataSource;
     QMFormasPagoIdiomaFORMA_PAGO: TFIBStringField;
     QMFormasPagoIdiomaIDIOMA: TFIBStringField;
     QMFormasPagoIdiomaTITULO: TFIBStringField;
     QMFormaPagoORDENAR_PAGO: TIntegerField;
     QMFormaPagoMES_NATURAL: TIntegerField;
     TUpdate: THYTransaction;
     QMFormaPagoPEDIR_DETALLE_PAGO: TIntegerField;
     QMFormaPagoTITULO_LARGO: TFIBStringField;
     QMFormasPagoIdiomaTITULO_LARGO: TFIBStringField;
     QMFormaPagoSIN_RECIBOS: TIntegerField;
     procedure DMFormasPagoCreate(Sender: TObject);
     procedure QMFormaPagoNewRecord(DataSet: TDataSet);
     procedure QMFormaPagoAfterOpen(DataSet: TDataSet);
     procedure QMFormaPagoTIPO_EFECTOChange(Sender: TField);
     procedure QMFormasPagoIdiomaNewRecord(DataSet: TDataSet);
     procedure GrabaIdioma(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMFormasPago : TDMFormasPago;

implementation

uses UDMMain, UFBusca, UEntorno;

{$R *.DFM}

procedure TDMFormasPago.DMFormasPagoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMFormaPago.Open;
end;

procedure TDMFormasPago.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFormaPago, '00000');
end;

procedure TDMFormasPago.QMFormaPagoNewRecord(DataSet: TDataSet);
begin
  QMFormaPagoTIPO_EFECTO.AsString := 'CON';
  QMFormaPagoREMESAR.AsInteger := 0;
  QMFormaPagoPRONTO_PAGO.AsInteger := 0;
  QMFormaPagoACEPTAR.AsInteger := 0;
  QMFormaPagoPAGO_AUTOMATICO.AsInteger := 0;
  QMFormaPagoDATOS_BANCARIOS.AsString := '0';
  QMFormaPagoHEREDA_FINANCIACION.AsInteger := 0;
  QMFormaPagoORDENAR_PAGO.AsInteger := 0;
  QMFormaPagoMES_NATURAL.AsInteger := 1;
  QMFormaPagoSIN_RECIBOS.AsInteger := 0;
end;

procedure TDMFormasPago.QMFormaPagoAfterOpen(DataSet: TDataSet);
begin
  xTipoEfecto.Open;
  QMFormasPagoIdioma.Open;
end;

procedure TDMFormasPago.QMFormaPagoTIPO_EFECTOChange(Sender: TField);
begin
  with xTipoEfecto do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFormasPago.QMFormasPagoIdiomaNewRecord(DataSet: TDataSet);
begin
  QMFormasPagoIdiomaFORMA_PAGO.AsString := QMFormaPagoFORMA.AsString;
end;

procedure TDMFormasPago.GrabaIdioma(DataSet: TDataSet);
begin
  if (not TLocal.InTransaction) then
     TLocal.CommitRetaining;
end;

end.
