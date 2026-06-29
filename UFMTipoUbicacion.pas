unit UFMTipoUbicacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMTipoUbicacion = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LBLTitulo: TLFLabel;
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
  FMTipoUbicacion : TFMTipoUbicacion;

implementation

uses UDMTipoUbicacion, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TFMTipoUbicacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoUbicacion, DMTipoUbicacion);
  NavMain.DataSource := DMTipoUbicacion.DSQMTipoUbicacion;
  DBGMain.DataSource := DMTipoUbicacion.DSQMTipoUbicacion;
  G2kTableLoc.DataSource := DMTipoUbicacion.DSQMTipoUbicacion;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMTipoUbicacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoUbicacion);
end;

procedure TFMTipoUbicacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoUbicacion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoUbicacion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
