unit UDMImportarPreciosTarProvKri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet, HYFIBQuery;

type
  TDMImportarPreciosTarProvKri = class(TDataModule)
     TLocal: THYTransaction;
     TArticulos: TFIBDataSetRO;
     TArticulosARTICULO: TFIBStringField;
     TArticulosP_COSTE: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameMonedaTarifa(Empresa: integer; Tarifa: string): string;
  end;

var
  DMImportarPreciosTarProvKri : TDMImportarPreciosTarProvKri;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMImportarPreciosTarProvKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMImportarPreciosTarProvKri.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

function TDMImportarPreciosTarProvKri.DameMonedaTarifa(Empresa: integer; Tarifa: string): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MONEDA FROM ART_TARIFAS_C WHERE EMPRESA = ?EMPRESA AND TARIFA  = ?TARIFA';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['TARIFA'].AsString := Tarifa;
        ExecQuery;
        Result := FieldByName['MONEDA'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
