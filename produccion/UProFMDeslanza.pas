unit UProFMDeslanza;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, FIBTableDataSet, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TProFPregDeslanza = class(TForm)
     DBGDeslanza: TDBGridFind2000;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFPregDeslanza : TProFPregDeslanza;

implementation

uses UDMMain;

{$R *.dfm}

end.
