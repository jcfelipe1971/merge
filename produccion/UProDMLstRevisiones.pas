unit UProDMLstRevisiones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados;

type
  TProDMLstRevisiones = class(TDataModule)
     TLocal: THYTransaction;
     frRevisiones: TfrHYReport;
     xLstRevisiones: TFIBDataSetRO;
     xLstRevisionesCODMAQ: TIntegerField;
     xLstRevisionesEMPRESA: TIntegerField;
     xLstRevisionesCODMAQ1: TIntegerField;
     xLstRevisionesLINEA: TIntegerField;
     xLstRevisionesFECHA_REVISION: TDateTimeField;
     xLstRevisionesFECHA_PROXIMA: TDateTimeField;
     xLstRevisionesRESULTADO: TFIBStringField;
     xLstRevisionesLABORATORIO: TFIBStringField;
     xLstRevisionesREVISADO: TIntegerField;
     xLstRevisionesDENOMINACION: TFIBStringField;
     xLstRevisionesFRECUENCIA: TIntegerField;
     xLstRevisionesNOTAS: TMemoField;
     xLstRevisionesFECHA_PREVISTA_REVISION: TDateTimeField;
     xLstRevisionesID_REVISION: TIntegerField;
     xLstRevisionesEMPRESA1: TIntegerField;
     xLstRevisionesID: TIntegerField;
     xLstRevisionesDENOMINACION1: TFIBStringField;
     xLstRevisionesFRECUENCIA1: TIntegerField;
     xLstRevisionesNOTAS1: TBlobField;
     xLstRevisionesRESPONSABLE: TIntegerField;
     xLstRevisionesTIPO_REVISION: TFIBStringField;
     DSxLstRevisiones: TDataSource;
     frDBLstRevisiones: TfrDBDataSet;
     xMinTipo: TFIBDataSetRO;
     xMinTipoTIPO: TFIBStringField;
     xMaxTipo: TFIBDataSetRO;
     xMaxTipoTIPO: TFIBStringField;
     DSxMinTipo: TDataSource;
     DSMaxTipo: TDataSource;
     xMinMaquina: TFIBDataSetRO;
     xMinMaquinaCODMAQ: TIntegerField;
     xMaxMaquina: TFIBDataSetRO;
     xMaxMaquinaCODMAQ: TIntegerField;
     DSxMinMaquina: TDataSource;
     DataDSxMaxMaquina: TDataSource;
     xTipoD: TFIBDataSetRO;
     xTipoH: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     DSxTipoD: TDataSource;
     DSxTipoH: TDataSource;
     xTipoDDESCRIPCION: TFIBStringField;
     xLstRevisionesTIPO: TFIBStringField;
     xLstRevisionesTIPO1: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frRevisionesGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(modo: integer; fecha_ini, fecha_fin: TDateTime; tipo_ini, tipo_fin: string; maquina_ini, maquina_fin: integer; revisados: boolean);
  end;

var
  ProDMLstRevisiones : TProDMLstRevisiones;

implementation

uses UDMMain, UFormGest, UEntorno, UUtiles, UFMain, UDMListados;

{$R *.dfm}

procedure TProDMLstRevisiones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstRevisiones.MostrarListado(modo: integer; fecha_ini, fecha_fin: TDateTime; tipo_ini, tipo_fin: string; maquina_ini, maquina_fin: integer; revisados: boolean);
var
  str : string;
begin
  fecha_ini := HourIntoDate(fecha_ini, '00:00:00');
  fecha_fin := HourIntoDate(fecha_fin, '23:59:59');

  xLstRevisiones.Close;
  xLstRevisiones.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xLstRevisiones.Params.ByName['fechad'].AsDateTime := fecha_ini;
  xLstRevisiones.Params.ByName['fechah'].AsDateTime := fecha_fin;
  xLstRevisiones.Params.ByName['tipod'].AsString := tipo_ini;
  xLstRevisiones.Params.ByName['tipoh'].AsString := tipo_fin;
  xLstRevisiones.Params.ByName['codmaqd'].AsInteger := maquina_ini;
  xLstRevisiones.Params.ByName['codmaqh'].AsInteger := maquina_fin;
  xLstRevisiones.Params.ByName['revisados'].AsInteger := Ord(revisados);
  xLstRevisiones.Open;

  DMListados.Imprimir(8204, modo, '', str, frRevisiones, nil);
end;

procedure TProDMLstRevisiones.frRevisionesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

procedure TProDMLstRevisiones.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

end.
