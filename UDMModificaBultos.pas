unit UDMModificaBultos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes;

type
  TDMModificaBultos = class(TDataModule)
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMModificaBultos : TDMModificaBultos;

implementation

{$R *.dfm}

end.
