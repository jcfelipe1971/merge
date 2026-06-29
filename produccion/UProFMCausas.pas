unit UProFMCausas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TProFMCausas = class(TFPEdit)
     LCausa: TLFLabel;
     LDescripcion: TLFLabel;
     DBCausa: TLFDbedit;
     LFDBDescCausa: TLFDbedit;
     LOrden: TLFLabel;
     DBOrden: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMCausas : TProFMCausas;

implementation

uses UProDMCausas, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMCausas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMCausas, ProDMCausas);
  NavMain.DataSource := ProDMCausas.DSQMCausa;
  EPMain.DataSource := ProDMCausas.DSQMCausa;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  DBGMain.DataSource := ProDMCausas.DSQMCausa;
  G2kTableLoc.DataSource := ProDMCausas.DSQMCausa;
end;

procedure TProFMCausas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  ProDMCausas.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMCausas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMCausas);
  Action := caFree;
end;

procedure TProFMCausas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
