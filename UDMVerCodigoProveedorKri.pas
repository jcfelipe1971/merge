unit UDMVerCodigoProveedorKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMVerCodigoProveedorKri = class(TDataModule)
     TLocal: THYTransaction;
     xVerCodigoProveedor: TFIBDataSetRO;
     DSxVerCodigoProveedor: TDataSource;
     xVerCodigoProveedorEMPRESA: TIntegerField;
     xVerCodigoProveedorARTICULO: TFIBStringField;
     xVerCodigoProveedorPROVEEDOR: TIntegerField;
     xVerCodigoProveedorCODIGO_PROVEEDOR: TFIBStringField;
     xVerCodigoProveedorNOMBRE_PROVEEDOR: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Articulo: string);
  end;

var
  DMVerCodigoProveedorKri : TDMVerCodigoProveedorKri;

implementation

uses UEntorno;

{$R *.dfm}

procedure TDMVerCodigoProveedorKri.Inicializa(Articulo: string);
begin
  with xVerCodigoProveedor do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMVerCodigoProveedorKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
