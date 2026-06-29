unit UDMProtocolosDeVenta;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMProtocolosDeVenta = class(TDataModule)
     DSQMProtocolos: TDataSource;
     TLocal: THYTransaction;
     QMProtocolos: TFIBTableSet;
     TUpdate: THYTransaction;
     QMProtocolosPROTOCOLO: TFIBStringField;
     QMProtocolosTITULO: TFIBStringField;
     QMProtocolosDEFECTO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMProtocolosDeVenta : TDMProtocolosDeVenta;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMProtocolosDeVenta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProtocolos.Open;
end;

end.
