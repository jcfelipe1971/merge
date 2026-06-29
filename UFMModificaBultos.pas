unit UFMModificaBultos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest;

type
  TFMModificaBultos = class(TG2kForm)
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMModificaBultos : TFMModificaBultos;

implementation

{$R *.dfm}

end.
