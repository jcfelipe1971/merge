unit UFMTipoIncidenciaMaq;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMTipoIncidenciaMaq = class(TFPEdit)
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
  FMTipoIncidenciaMaq : TFMTipoIncidenciaMaq;

implementation

uses UDMTipoIncidenciaMaq, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMTipoIncidenciaMaq.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoIncidenciaMaq, DMTipoIncidenciaMaq);
  NavMain.DataSource := DMTipoIncidenciaMaq.DSQMTipoIncidencia;
  DBGMain.DataSource := DMTipoIncidenciaMaq.DSQMTipoIncidencia;
  G2KTableLoc.DataSource := DMTipoIncidenciaMaq.DSQMTipoIncidencia;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMTipoIncidenciaMaq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoIncidenciaMaq);
end;

procedure TFMTipoIncidenciaMaq.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoIncidenciaMaq.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoIncidenciaMaq.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
