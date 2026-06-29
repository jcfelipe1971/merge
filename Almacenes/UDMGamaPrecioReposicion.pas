unit UDMGamaPrecioReposicion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMGamaPrecioReposicion = class(TDataModule)
     xGamas: TFIBTableSet;
     DSxGamas: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xGamasGAMA: TFIBStringField;
     xGamasTITULO: TFIBStringField;
     xGamasDESCUENTO: TFloatField;
     xGamasINCREMENTO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMGamaPrecioReposicion : TDMGamaPrecioReposicion;

implementation

uses
  UDMMain, UUtiles, UEntorno;

{$R *.dfm}

procedure TDMGamaPrecioReposicion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xGamas, MascaraN, MascaraI, ShortDateFormat);

  with xGamas do
  begin
     Close;
     Open;
  end;
end;

end.
