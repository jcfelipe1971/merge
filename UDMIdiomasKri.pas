unit UDMIdiomasKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMIdiomasKri = class(TDataModule)
     QMIdiomas: TFIBTableSet;
     DSQMIdiomas: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMIdiomasIDIOMA: TFIBStringField;
     QMIdiomasTITULO: TFIBStringField;
     QMIdiomasDEFECTO: TIntegerField;
     QMIdiomasNOTAS_KRI: TBlobField;
     QMIdiomasNOTAS_INTERNAS_KRI: TBlobField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMIdiomasKri : TDMIdiomasKri;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMIdiomasKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  QMIdiomas.Open;
end;

procedure TDMIdiomasKri.DataModuleDestroy(Sender: TObject);
begin
  QMIdiomas.Close;
  TLocal.Commit;
end;

end.
