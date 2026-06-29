unit UDMImportarEscProduccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados;

type
  TDMImportarEscProduccion = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMImportarEscProduccion : TDMImportarEscProduccion;

implementation

{$R *.dfm}

procedure TDMImportarEscProduccion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

end.
