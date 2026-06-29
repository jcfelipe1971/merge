unit UDMLstProtocoloDeVenta;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, DB, FIBDataSet, frxClass, frxHYReport, FR_DSet,
  FR_DBSet, FIBDataSetRO, FR_Class, Fr_HYReport, FIBDatabase,
  UFIBModificados;

type
  TDMLstProtocoloDeVenta = class(TDataModule)
     TLocal: THYTransaction;
     frProtocolo: TfrHYReport;
     xCabecera: TFIBDataSetRO;
     DSxCabecera: TDataSource;
     frDBxCabecera: TfrDBDataSet;
     xDetalle: TFIBDataSetRO;
     frDBxDetalle: TfrDBDataSet;
     DSxDetalle: TDataSource;
     frxProtocolo: TfrxHYReport;
     xCabeceraEMPRESA: TIntegerField;
     xCabeceraEJERCICIO: TIntegerField;
     xCabeceraCANAL: TIntegerField;
     xCabeceraPROTOCOLO: TFIBStringField;
     xCabeceraTIPO: TFIBStringField;
     xCabeceraALTA: TDateTimeField;
     xCabeceraBAJA: TDateTimeField;
     xDetalleEMPRESA: TIntegerField;
     xDetalleEJERCICIO: TIntegerField;
     xDetalleCANAL: TIntegerField;
     xDetallePROTOCOLO: TFIBStringField;
     xDetalleTIPO: TFIBStringField;
     xDetalleLINEA: TIntegerField;
     xDetalleARTICULO: TFIBStringField;
     xDetalleFAMILIA: TFIBStringField;
     xDetalleUNID_MINIMAS: TFloatField;
     xDetalleUNID_MAXIMAS: TFloatField;
     xDetallePRECIO: TFloatField;
     xDetalleDESCUENTO: TFloatField;
     xDetalleDESCUENTO_2: TFloatField;
     xDetalleDESCUENTO_3: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xCabeceraAfterOpen(DataSet: TDataSet);
     procedure xCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarProtocolo(Modo: byte; TipoProtocolo: integer);
  end;

var
  DMLstProtocoloDeVenta : TDMLstProtocoloDeVenta;

implementation

uses UDMListados, UFormGest, UEntorno, UDMMain;

{$R *.dfm}

procedure TDMLstProtocoloDeVenta.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstProtocoloDeVenta.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstProtocoloDeVenta.MostrarProtocolo(Modo: byte; TipoProtocolo: integer);
var
  str : string;
begin
  with xCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (TipoProtocolo = 0) then
        Params.ByName['TIPO'].AsString := 'CCA'
     else
        Params.ByName['TIPO'].AsString := 'CCF';
  end;

  DMListados.Cargar(5105, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frProtocolo.LoadFromFIB(REntorno.Formato, str);
     frProtocolo.PrepareReport;
     case Modo of
        0: frProtocolo.ShowPreparedReport;
        1: frProtocolo.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxProtocolo.LoadFromFIB(REntorno.Formato, str);
     frxProtocolo.PrepareReport;
     case Modo of
        0: frxProtocolo.ShowPreparedReport;
        1: frxProtocolo.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstProtocoloDeVenta.xCabeceraAfterOpen(DataSet: TDataSet);
begin
  xDetalle.Open;
end;

procedure TDMLstProtocoloDeVenta.xCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDetalle.Close;
end;

end.
