unit UFMTipoIncidenciaKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMTipoIncidenciaKri = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoIncidenciaKri : TFMTipoIncidenciaKri;

implementation

uses UDMTipoIncidenciaKri, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMTipoIncidenciaKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoIncidenciaKri, DMTipoIncidenciaKri);
  NavMain.DataSource := DMTipoIncidenciaKri.DSQMTipoIncidencia;
  DBGMain.DataSource := DMTipoIncidenciaKri.DSQMTipoIncidencia;
  G2KTableLoc.DataSource := DMTipoIncidenciaKri.DSQMTipoIncidencia;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMTipoIncidenciaKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoIncidenciaKri);
end;

procedure TFMTipoIncidenciaKri.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoIncidenciaKri.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoIncidenciaKri.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
