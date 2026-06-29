unit UOpeFMCategoria;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TOpeFMCategoria = class(TFPEdit)
     LCategoria: TLFLabel;
     DBECategoria: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMCategoria : TOpeFMCategoria;

implementation

uses UOpeDMCategoria, UFormGest, UDMMain;

{$R *.DFM}

procedure TOpeFMCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMCategoria, OpeDMCategoria);
  NavMain.DataSource := OpeDMCategoria.DSQMCategoria;
  EPMain.DataSource := OpeDMCategoria.DSQMCategoria;
  DBGMain.DataSource := OpeDMCategoria.DSQMCategoria;
end;

procedure TOpeFMCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMCategoria);
end;

procedure TOpeFMCategoria.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMCategoria.BusquedaCompleja;
  Continua := False;
end;

end.
