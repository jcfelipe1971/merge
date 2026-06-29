unit UDMVentasCliFec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet;

type
  TDMVentasCliFec = class(TDataModule)
     TLocal: THYTransaction;
     DSxClienteFec: TDataSource;
     xClienteFec: TFIBDataSetRO;
     frDBDSxVentasCliente: TfrDBDataSet;
     frHYVentasClientes: TfrHYReport;
     xClienteFecSERIE: TFIBStringField;
     xClienteFecCLIENTE: TIntegerField;
     xClienteFecTERCERO: TIntegerField;
     xClienteFecNOMBRE_R_SOCIAL: TFIBStringField;
     xClienteFecTELEFONO01: TFIBStringField;
     xClienteFecRIG: TIntegerField;
     xClienteFecFECHA: TDateTimeField;
     xClienteFecDIAS: TFloatField;
     xClienteFecCANTIDAD: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMVentasCliFec : TDMVentasCliFec;

implementation

uses UDMMain, UEntorno, UFormGest;

{$R *.DFM}

procedure TDMVentasCliFec.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with xClienteFec do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

end.
