unit UObrDMLstPartidasOferta;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TObrDMLstPartidasOferta = class(TDataModule)
     frPartidas: TfrHYReport;
     frDBCabPartida: TfrDBDataSet;
     DSQMCabPartida: TDataSource;
     QMCabPartida: TFIBDataSetRO;
     frDBDetPartida: TfrDBDataSet;
     DSQMDetPartida: TDataSource;
     QMDetPartida: TFIBDataSetRO;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     DSQMCabecera: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraFORMA_PAGO: TFIBStringField;
     QMCabeceraCAMPANYA: TIntegerField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraBULTOS: TIntegerField;
     QMCabeceraLINEAS: TIntegerField;
     QMCabeceraBRUTO: TFloatField;
     QMCabeceraI_DTO_LINEAS: TFloatField;
     QMCabeceraS_BASES: TFloatField;
     QMCabeceraM_BRUTO: TFloatField;
     QMCabeceraC_TOTAL: TFloatField;
     QMCabeceraAGENTE: TIntegerField;
     QMCabeceraS_CUOTA_IVA: TFloatField;
     QMCabeceraS_CUOTA_RE: TFloatField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraI_DTO_CIAL: TFloatField;
     QMCabeceraI_DTO_PP: TFloatField;
     QMCabeceraB_COMISION: TFloatField;
     QMCabeceraI_COMISION: TFloatField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraTARIFA: TFIBStringField;
     QMCabeceraID_S: TIntegerField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraPOR_PORTES: TFloatField;
     QMCabeceraI_PORTES: TFloatField;
     QMCabeceraI_PORTES_CANAL: TFloatField;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     xCliente: TFIBDataSetRO;
     xDireccion_Cliente: TFIBDataSetRO;
     DSxDireccion_Cliente: TDataSource;
     DSxCliente: TDataSource;
     xDireccionFiscal: TFIBDataSetRO;
     DSxDireccionFiscal: TDataSource;
     QMDetPartida0: TFIBDataSetRO;
     DSQMDetPartida0: TDataSource;
     frDBDetPartida0: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPartidasGetValue(const ParName: string; var ParValue: variant);
     procedure xClienteAfterScroll(DataSet: TDataSet);
     procedure frPartidasBeforePrint(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(grupo, modo, ID_S: integer);
  end;

var
  ObrDMLstPartidasOferta : TObrDMLstPartidasOferta;

implementation

uses UDMListados, UFormGest, UEntorno;

{$R *.dfm}

procedure TObrDMLstPartidasOferta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TObrDMLstPartidasOferta.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TObrDMLstPartidasOferta.frPartidasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TObrDMLstPartidasOferta.MostrarListado(grupo, modo, ID_S: integer);
var
  str : string;
  // i : integer;
begin
  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  with QMCabPartida do
  begin
     Close;
     Open;
  end;

  with QMDetPartida do
  begin
     Close;
     Open;
  end;

  with QMDetPartida0 do
  begin
     Close;
     Open;
  end;

  with xCliente do
  begin
     Close;
     Open;
  end;

  with xDireccion_Cliente do
  begin
     Close;
     Open;
  end;

  DMListados.Cargar(grupo, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frPartidas.LoadFromFIB(REntorno.Formato, str);
     frPartidas.PrepareReport;
     case Modo of
        0: frPartidas.ShowPreparedReport;
        1: frPartidas.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TObrDMLstPartidasOferta.xClienteAfterScroll(DataSet: TDataSet);
begin
  with xDireccionFiscal do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Open;
  end;
end;

procedure TObrDMLstPartidasOferta.frPartidasBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

end.
