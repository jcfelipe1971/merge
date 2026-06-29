unit UFMAgrupacionDeAlbaranesKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMAgrupacionDeAlbaranesKri = class(TFPEdit)
     PNL: TLFPanel;
     LAgrupacion: TLFLabel;
     LIntervaloAlbaranes: TLFLabel;
     DBAgrupacion: TLFDbedit;
     DBEIntervaloAlbaranes: TLFDbedit;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAgrupacionDeAlbaranesKri : TFMAgrupacionDeAlbaranesKri;

implementation

uses UDMAgrupacionDeAlbaranesKri, UDMMain, UEntorno;

{$R *.dfm}

end.
