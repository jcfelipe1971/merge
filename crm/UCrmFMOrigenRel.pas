unit UCrmFMOrigenRel;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TCrmFMOrigenRel = class(TFPEdit)
     LTipo: TLFLabel;
     LDescripcion: TLFLabel;
     DBETipo: TLFDbedit;
     DBEDesc: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMOrigenRel : TCrmFMOrigenRel;

implementation

uses UCrmDMOrigenRel, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TCrmFMOrigenRel.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMOrigenRel, CrmDMOrigenRel);

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TCrmFMOrigenRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMOrigenRel);
end;

procedure TCrmFMOrigenRel.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
