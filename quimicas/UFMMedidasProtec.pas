unit UFMMedidasProtec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DBCtrls, ULFDBMemo, Mask, ULFDBEdit,
  ULFLabel, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar,
  UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin,
  ExtCtrls, ULFPanel;

type
  TFMMedidasProtec = class(TFPEdit)
     LblMedidasProtec: TLFLabel;
     DBEMedidasProtec: TLFDbedit;
     DBMTexto: TLFDBMemo;
     LblTexto: TLFLabel;
     LblDescCorta: TLFLabel;
     DBEDescCorta: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMedidasProtec : TFMMedidasProtec;

implementation

uses UDMMedidasProtec, UFormGest;

{$R *.dfm}

procedure TFMMedidasProtec.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMedidasProtec, DMMedidasProtec);
end;

procedure TFMMedidasProtec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMedidasProtec);
  Action := caFree;
end;

procedure TFMMedidasProtec.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
