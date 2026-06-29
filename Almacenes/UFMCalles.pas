unit UFMCalles;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMCalles = class(TFPEdit)
     LBLCanal: TLFLabel;
     DBECalle: TLFDbedit;
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
  FMCalles : TFMCalles;

implementation

uses UFormGest, UDMCanales, UDMMain, UDMCalles;

{$R *.DFM}

procedure TFMCalles.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCalles, DMCalles);
  NavMain.DataSource := DMCalles.DSQMCalles;
  DBGMain.DataSource := DMCalles.DSQMCalles;
end;

procedure TFMCalles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCalles);
end;

procedure TFMCalles.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCalles.BusquedaCompleja;
  Continua := False;
end;

end.
