unit UFMTipoAsiento;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UNavigator,
  ExtCtrls, UFormGest, UControlEdit, NsDBGrid, ULFPanel, ToolWin, ComCtrls,
  ULFToolBar, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UEditPanel, UFPEditSimple;

type
  TFMTipoAsiento = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoAsiento : TFMTipoAsiento;

implementation

uses UDMTipoAsiento, UDMMain;

{$R *.DFM}

procedure TFMTipoAsiento.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTipoAsiento, DMTipoAsiento);
end;

procedure TFMTipoAsiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMTipoAsiento);
end;

end.
