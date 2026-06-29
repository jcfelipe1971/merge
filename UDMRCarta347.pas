unit UDMRCarta347;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes;

type
  TDMRCarta347 = class(TDataModule)
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMRCarta347 : TDMRCarta347;

implementation

{$R *.dfm}

end.
