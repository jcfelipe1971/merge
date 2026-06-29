unit UFMPosiciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMPosiciones = class(TFPEdit)
     LBLCanal: TLFLabel;
     DBEPosicion: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPosiciones : TFMPosiciones;

implementation

uses UFormGest, UDMMain, UDMPosiciones;

{$R *.DFM}

procedure TFMPosiciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPosiciones, DMPosiciones);
  NavMain.DataSource := DMPosiciones.DSQMPosiciones;
  DBGMain.DataSource := DMPosiciones.DSQMPosiciones;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMPosiciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPosiciones);
end;

procedure TFMPosiciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPosiciones.BusquedaCompleja;
  Continua := False;
end;

end.
