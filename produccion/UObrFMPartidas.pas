unit UObrFMPartidas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TObrFMPartidas = class(TFPEdit)
     LPartida: TLFLabel;
     LDescripcion: TLFLabel;
     DBEPartida: TLFDbedit;
     DBEDescPartida: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ObrFMPartidas : TObrFMPartidas;

implementation

uses uobrdmpartidas, UFormGest;

{$R *.dfm}

procedure TObrFMPartidas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TObrDMPartidas, ObrDMPartidas);
end;

procedure TObrFMPartidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ObrDMPartidas);
end;

end.
