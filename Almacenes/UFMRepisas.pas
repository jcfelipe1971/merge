unit UFMRepisas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMRepisas = class(TFPEdit)
     LBLCanal: TLFLabel;
     DBERepisa: TLFDbedit;
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
  FMRepisas : TFMRepisas;

implementation

uses UFormGest, UDMCanales, UDMMain, UDMRepisas;

{$R *.DFM}

procedure TFMRepisas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRepisas, DMRepisas);
  NavMain.DataSource := DMRepisas.DSQMRepisas;
  DBGMain.DataSource := DMRepisas.DSQMRepisas;
end;

procedure TFMRepisas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRepisas);
end;

procedure TFMRepisas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRepisas.BusquedaCompleja;
  Continua := False;
end;

end.
