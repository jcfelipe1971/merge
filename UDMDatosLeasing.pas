unit UDMDatosLeasing;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMDatosLeasing = class(TDataModule)
     TLocal: THYTransaction;
     QMDatosLeasing: TFIBTableSet;
     QMDatosLeasingCTA_IVA_DIFERIDO: TFIBStringField;
     QMDatosLeasingCTA_GASTOS_INTERESES: TFIBStringField;
     QMDatosLeasingCTA_ABONO_GASTOS: TFIBStringField;
     QMDatosLeasingGASTOS_LEASING: TFloatField;
     DSQMDatosLeasing: TDataSource;
     QMDatosLeasingEMPRESA: TIntegerField;
     QMDatosLeasingEJERCICIO: TIntegerField;
     QMDatosLeasingCANAL: TIntegerField;
     QMDatosLeasingSERIE: TFIBStringField;
     QMDatosLeasingTIPO: TFIBStringField;
     QMDatosLeasingRIG: TIntegerField;
     QMDatosLeasingIVA_DIFERIDO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraQuery(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Moneda: string);
  end;

var
  DMDatosLeasing : TDMDatosLeasing;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMDatosLeasing.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMDatosLeasing.FiltraQuery(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rig: integer; Moneda: string);
begin
  // Diplay formats
  QMDatosLeasingGASTOS_LEASING.DisplayFormat := DMMain.MascaraMoneda(Moneda, 1);

  with QMDatosLeasing do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
end;

end.
