unit UDMLstUbicacionesV;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport,
  DB, FR_DSet, FR_DBSet, FIBDataSetRO, FIBDataSet;

type
  TDMLstUbicacionesV = class(TDataModule)
     TLocal: THYTransaction;
     frUbicaciones: TfrHYReport;
     xListado: TFIBDataSetRO;
     frDBxListado: TfrDBDataSet;
     DSxListado: TDataSource;
     xListadoEMPRESA: TIntegerField;
     xListadoEJERCICIO: TIntegerField;
     xListadoCANAL: TIntegerField;
     xListadoSERIE: TFIBStringField;
     xListadoTIPO: TFIBStringField;
     xListadoRIG: TIntegerField;
     xListadoTERCERO: TIntegerField;
     xListadoCLIENTE: TIntegerField;
     xListadoLINEA: TIntegerField;
     xListadoARTICULO: TFIBStringField;
     xListadoTITULO: TFIBStringField;
     xListadoUNIDADESLINEA: TFloatField;
     xListadoLINEA_UBICACION: TIntegerField;
     xListadoUBICACION: TFIBStringField;
     xListadoUNIDADES: TFloatField;
     xListadoPESO: TFloatField;
     xListadoVOLUMEN: TFloatField;
     xListadoDIAMETRO: TFloatField;
     xListadoGENERAL: TIntegerField;
     xListadoTITULO1: TFIBStringField;
     xListadoNOMBRE_R_SOCIAL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frUbicacionesGetValue(const ParName: string; var ParValue: variant);
     procedure frUbicacionesEnterRect(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListadoUbicaciones(id_s: integer; Modo: byte);
  end;

var
  DMLstUbicacionesV : TDMLstUbicacionesV;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno;

{$R *.dfm}

procedure TDMLstUbicacionesV.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstUbicacionesV.MostrarListadoUbicaciones(id_s: integer; Modo: byte);
var
  str : string;
begin
  with xListado do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := id_s;
     Open;
  end;

  DMListados.Cargar(193, '');
  frUbicaciones.LoadFromFIB(REntorno.Formato, str);
  frUbicaciones.PrepareReport;
  case Modo of
     0: frUbicaciones.ShowPreparedReport;
     1: frUbicaciones.PrintPreparedReport(' ', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstUbicacionesV.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstUbicacionesV.frUbicacionesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'TIPODOCUMENTO') then
     if (xListado.FieldByName('TIPO').AsString = 'ALB') then
        ParValue := 'Albarán de Ventas : '
     else
        ParValue := 'Factura de Ventas : ';
end;

procedure TDMLstUbicacionesV.frUbicacionesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

end.
