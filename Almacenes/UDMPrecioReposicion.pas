unit UDMPrecioReposicion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMPrecioReposicion = class(TDataModule)
     xPrecioReposicion: TFIBTableSet;
     DSxPrecioReposicion: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xPrecioReposicionEMPRESA: TIntegerField;
     xPrecioReposicionARTICULO: TFIBStringField;
     xPrecioReposicionTITULO_ARTICULO: TFIBStringField;
     xPrecioReposicionFAMILIA: TFIBStringField;
     xPrecioReposicionTITULO_FAMILIA: TFIBStringField;
     xPrecioReposicionID_A: TIntegerField;
     xPrecioReposicionPRECIO_BASE_REPOSICION: TFloatField;
     xPrecioReposicionPRECIO_REPOSICION: TFloatField;
     xPrecioReposicionGAMA: TFIBStringField;
     xPrecioReposicionTITULO_GAMA: TFIBStringField;
     xPrecioReposicionDESCUENTO: TFloatField;
     xPrecioReposicionINCREMENTO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Familia: string;
     Gama: string;
  public
     { Public declarations }
     procedure Filtra(aFamilia, aGama: string);
  end;

var
  DMPrecioReposicion : TDMPrecioReposicion;

implementation

uses
  UDMMain, UFMain, UUtiles, UEntorno;

{$R *.dfm}

procedure TDMPrecioReposicion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xPrecioReposicion, MascaraN, MascaraI, ShortDateFormat);

  with xPrecioReposicion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA_SYS'].AsString := REntorno.FamSistema;
     Open;
  end;
end;

procedure TDMPrecioReposicion.Filtra(aFamilia, aGama: string);
begin
  Familia := Trim(aFamilia);
  Gama := Trim(aGama);

  with xPrecioReposicion do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PRECIO_REPOSICION ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add('   EMPRESA = :EMPRESA ');
     SelectSQL.Add('   AND FAMILIA <> :FAMILIA_SYS ');
     if (Familia > '') then
        SelectSQL.Add('   AND FAMILIA = :FAMILIA ');
     if (Gama > '') then
        SelectSQL.Add('   AND GAMA = :GAMA ');
     SelectSQL.Add(' ORDER BY ARTICULO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FAMILIA_SYS'].AsString := REntorno.FamSistema;
     if (Familia > '') then
        Params.ByName['FAMILIA'].AsString := Familia;
     if (Gama > '') then
        Params.ByName['GAMA'].AsString := Gama;

     Open;
  end;
end;

end.
