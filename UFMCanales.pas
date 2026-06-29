unit UFMCanales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMCanales = class(TFPEdit)
     LBLCanal: TLFLabel;
     DBECanal: TLFDbedit;
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
  FMCanales : TFMCanales;

implementation

uses UFormGest, UDMCanales, UDMMain;

{$R *.DFM}

procedure TFMCanales.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCanales, DMCanales);
  NavMain.DataSource := DMCanales.DSQMCanales;
  DBGMain.DataSource := DMCanales.DSQMCanales;
end;

procedure TFMCanales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCanales);
end;

procedure TFMCanales.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCanales.BusquedaCompleja;
  Continua := False;
end;

end.
