unit UProFMDesTipoPieza;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TProFMDesTipoPieza = class(TFPEdit)
     LCodigo: TLFLabel;
     LDescripcion: TLFLabel;
     LAltura: TLFLabel;
     LAnchura: TLFLabel;
     LProfundidad: TLFLabel;
     LGrueso: TLFLabel;
     LFDBCodigo: TLFDbedit;
     LFDesc: TLFDbedit;
     LFDBAltura: TLFDbedit;
     LFDBAnchura: TLFDbedit;
     LFDBProf: TLFDbedit;
     LFDBGrueso: TLFDbedit;
     LFormulas: TLFLabel;
     Bevel1: TBevel;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMDesTipoPieza : TProFMDesTipoPieza;

implementation

uses UFormGest, UProDMDesTipoPieza;

{$R *.dfm}

procedure TProFMDesTipoPieza.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMDesTipoPieza, ProDMDesTipoPieza);
  NavMain.DataSource := ProDMDesTipoPieza.DSTipoPieza;
end;

procedure TProFMDesTipoPieza.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMDesTipoPieza);
end;

procedure TProFMDesTipoPieza.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMDesTipoPieza.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMDesTipoPieza.BusquedaCompleja;
  Continua := False;
end;

end.
