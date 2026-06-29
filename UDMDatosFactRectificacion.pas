unit UDMDatosFactRectificacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet;

type
  TDMDatosFactRectificacion = class(TDataModule)
     TLocal: THYTransaction;
     xDatosFac: TFIBDataSetRO;
     DSxDatosFac: TDataSource;
     xDatosFacBASE: TFloatField;
     xDatosFacIVA: TFloatField;
     xDatosFacRECARGO: TFloatField;
     xDatosFacLIQUIDO: TFloatField;
     xDatosFacTOTAL: TFloatField;
     xDatosFacMONEDA: TFIBStringField;
     xDatosFacID_DOC: TIntegerField;
     xDatosFacCOD_CLI_PRO: TIntegerField;
     xDatosFacNOMBRE_R_SOCIAL: TFIBStringField;
     xDatosFacTITULO_MONEDA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     procedure FormateaDatos;
  public
     { Public declarations }
     Tipo: string;
     procedure DatosFactura(Ejercicio, Rig: integer; Serie, Tipo: string);
  end;

var
  DMDatosFactRectificacion : TDMDatosFactRectificacion;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMDatosFactRectificacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMDatosFactRectificacion.DatosFactura(Ejercicio, Rig: integer; Serie, Tipo: string);
begin
  with xDatosFac do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;

  FormateaDatos;
end;

procedure TDMDatosFactRectificacion.FormateaDatos;
var
  LocalMascaraN : string;
begin
  LocalMascaraN := DMMain.MascaraMoneda(xDatosFacMONEDA.AsString, 1);

  xDatosFacBASE.DisplayFormat := LocalMascaraN;
  xDatosFacIVA.DisplayFormat := LocalMascaraN;
  xDatosFacRECARGO.DisplayFormat := LocalMascaraN;
  xDatosFacLIQUIDO.DisplayFormat := LocalMascaraN;
  xDatosFacTOTAL.DisplayFormat := LocalMascaraN;
end;

end.
