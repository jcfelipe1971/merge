unit UFMEnviaXmlFacturasChlResumen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFLabel,
  Grids, DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMEnviaXmlFacturasChlResumen = class(TFPEditSimple)
     DBGDocumentos: TDBGridFind2000;
     LDesdeCliente: TLFLabel;
     LFLabel1: TLFLabel;
     DBGridFind20001: TDBGridFind2000;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEnviaXmlFacturasChlResumen : TFMEnviaXmlFacturasChlResumen;

implementation

uses UDMEnviaxmLfacturasChl, UDMMain, UEntorno;

{$R *.dfm}

end.
