unit UFMCodigosBarra;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMCodigosBarra = class(TFPEdit)
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBELongitud: TLFDbedit;
     LBTipo: TLFLabel;
     LBTitulo: TLFLabel;
     LBLongitud: TLFLabel;
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
  FMCodigosBarra : TFMCodigosBarra;

implementation

uses UFormGest, UDMCodigosBarra, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMCodigosBarra.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCodigosBarra, DMCodigosBarra);
  NavMain.DataSource := DMCodigosBarra.DSQMCodigosBarra;
  DBGMain.DataSource := DMCodigosBarra.DSQMCodigosBarra;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMCodigosBarra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCodigosBarra);
  action := caFree;
end;

procedure TFMCodigosBarra.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCodigosBarra.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCodigosBarra.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
