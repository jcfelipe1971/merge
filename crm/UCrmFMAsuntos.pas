unit UCrmFMAsuntos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TCrmFMAsuntos = class(TFPEdit)
     LId: TLFLabel;
     LDescripcion: TLFLabel;
     DBETipo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMAsuntos : TCrmFMAsuntos;

implementation

uses UCrmDMAsuntos, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TCrmFMAsuntos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMAsuntos, CrmDMAsuntos);

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TCrmFMAsuntos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMAsuntos);
end;

procedure TCrmFMAsuntos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
