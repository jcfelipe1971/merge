unit UFMNaturPeligro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DBCtrls, ULFDBMemo, Mask, ULFDBEdit,
  ULFLabel, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar,
  UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin,
  ExtCtrls, ULFPanel;

type
  TFMNaturPeligro = class(TFPEdit)
     LblNaturPeligro: TLFLabel;
     DBENaturPeligro: TLFDbedit;
     DBMTexto: TLFDBMemo;
     DBEDescCorta: TLFDbedit;
     LblDescCorta: TLFLabel;
     LblTexto: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMNaturPeligro : TFMNaturPeligro;

implementation

uses UDMNaturPeligro, UFormGest;

{$R *.dfm}

procedure TFMNaturPeligro.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMNaturPeligro, DMNaturPeligro);
end;

procedure TFMNaturPeligro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNaturPeligro);
  Action := caFree;
end;

procedure TFMNaturPeligro.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
