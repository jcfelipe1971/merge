unit UDMPregCodBarrasDevol;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBQuery, HYFIBQuery;

type
  TDMPregCodBarrasDevol = class(TDataModule)
     TLocal: THYTransaction;
     xAlmacen_Desde: TFIBDataSetRO;
     xAlmacen_Hasta: TFIBDataSetRO;
     DSxAlmacen_Desde: TDataSource;
     DSxAlmacen_Hasta: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPregCodBarrasDevol : TDMPregCodBarrasDevol;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMPregCodBarrasDevol.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

end.
