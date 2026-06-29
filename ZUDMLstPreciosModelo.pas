unit ZUDMLstPreciosModelo;

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport, Forms,
  DB, FR_DSet, FR_DBSet, FIBDataSetRO, FIBDataSet;

type
  TZDMLstPreciosModelo = class(TDataModule)
     TLocal: THYTransaction;
     frLstPrecios: TfrHYReport;
     xLstPrecios: TFIBDataSetRO;
     frDBDSLstPrecios: TfrDBDataSet;
     DSxLstPrecios: TDataSource;
     xLstPreciosARTICULO: TFIBStringField;
     xLstPreciosTARIFA: TFIBStringField;
     xLstPreciosLONA: TFIBStringField;
     xLstPreciosP_COSTE: TFloatField;
     xLstPreciosP_VENTA: TFloatField;
     xLstPreciosMARGEN: TFloatField;
     xLstPreciosLINEA: TIntegerField;
     xLstPreciosSALIDA: TIntegerField;
     xLstPreciosMULTIPLO: TIntegerField;
     xLstPreciosTOTAL_LINEA: TIntegerField;
     xLstPreciosTOTAL_SALIDA: TIntegerField;
     xLstPreciosTOTAL_M2_LONA: TFloatField;
     xModelo: TFIBDataSetRO;
     xModeloDESCRIPCION: TFIBStringField;
     DSxModelo: TDataSource;
     xTipoLona: TFIBDataSetRO;
     DSxTipoLona: TDataSource;
     xTipoLonaDESCRIPCION: TFIBStringField;
     xTipoLonaMULTIPLO: TIntegerField;
     xLstPreciosP_COSTE_FABRICACION: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frLstPreciosGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ListadoPrecios(Modo: smallint);
  end;

var
  ZDMLstPreciosModelo : TZDMLstPreciosModelo;

implementation

uses UDMListados, UFormGest, UDMMain, ZUFMLstPreciosModelo, UEntorno;

{$R *.dfm}

procedure TZDMLstPreciosModelo.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLstPreciosModelo.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TZDMLstPreciosModelo.ListadoPrecios(Modo: smallint);
var
  str : string;
begin
  with xLstPrecios do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['MODELO'].AsString := ZFMLstPreciosModelo.EFModelo.Text;
     Params.ByName['TIPO_LONA'].AsString := ZFMLstPreciosModelo.EFTipoLona.Text;
     Params.ByName['TARIFA_MODELO'].AsString := REntorno.TarifaDefecto;
     Open;
  end;

  DMListados.Cargar(9001, '');
  frLstPrecios.LoadFromFIB(REntorno.Formato, str);
  frLstPrecios.PrepareReport;
  case Modo of
     0: frLstPrecios.ShowPreparedReport;
     1: frLstPrecios.PrintPreparedReport('', REntorno.Copias);
  end;

  DMListados.LimpiaEntorno;
end;

procedure TZDMLstPreciosModelo.frLstPreciosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Modelo' then
     ParValue := ZFMLstPreciosModelo.EFModelo.Text;

  if ParName = 'DescModelo' then
     ParValue := ZFMLstPreciosModelo.DBEDescModelo.Text;

  if ParName = 'TipoLona' then
     ParValue := ZFMLstPreciosModelo.EFTipoLona.Text;

  if ParName = 'DescTipoLona' then
     ParValue := ZFMLstPreciosModelo.DBEDescTipoLona.Text;
end;

end.
