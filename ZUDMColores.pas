unit ZUDMColores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, Graphics;

type
  TZDMColores = class(TDataModule)
     TLocal: THYTransaction;
     QMColores: TFIBTableSet;
     DSQMColores: TDataSource;
     QMColoresCODIGO: TFIBStringField;
     QMColoresDESCRIPCION: TFIBStringField;
     QMColoresDIAS_RETRASO: TIntegerField;
     QMColoresINCREMENTO_PVP: TFloatField;
     QMColoresCODIGO_COMPONENTE: TFIBStringField;
     QMColoresCOLOR: TIntegerField;
     QMColoresCOLOR_DECIMAL: TFloatField;
     QMColoresACTIVO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMColoresNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameColor: TColor;
     procedure PonColor(Color: TColor);
  end;

var
  ZDMColores : TZDMColores;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TZDMColores.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMColoresINCREMENTO_PVP.DisplayFormat := MascaraP;

  QMColores.Open;
end;

procedure TZDMColores.QMColoresNewRecord(DataSet: TDataSet);
begin
  QMColoresCOLOR_DECIMAL.AsFloat := 16777215;
  QMColoresACTIVO.AsInteger := 1;
end;

function TZDMColores.DameColor: TColor;
begin
  Result := QMColoresCOLOR_DECIMAL.AsInteger;
end;

procedure TZDMColores.PonColor(Color: TColor);
begin
  QMColoresCOLOR_DECIMAL.AsInteger := Color;
end;


end.
