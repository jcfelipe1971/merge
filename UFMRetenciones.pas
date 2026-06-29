unit UFMRetenciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls,
  UNavigator, UControlEdit, UFormGest, NsDBGrid, ULFPanel, ULFToolBar,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas;

type
  TFMRetenciones = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(id_cartera_detalle: integer);
  end;

var
  FMRetenciones : TFMRetenciones;

implementation

uses UDMMain, UDMRetenciones, UEntorno;

{$R *.DFM}

procedure TFMRetenciones.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMRetenciones, DMRetenciones);
end;

procedure TFMRetenciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRetenciones);
end;

procedure TFMRetenciones.Muestra(id_cartera_detalle: integer);
begin
  DMRetenciones.Muestra(id_cartera_detalle);
end;

end.
