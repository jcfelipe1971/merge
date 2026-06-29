unit UFMTemporadaTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls,
  UFIBDBEditfind, ULFDBEdit;

type
  TFMTemporadaTallas = class(TFPEdit)
     LCodigo: TLFLabel;
     LTitulo: TLFLabel;
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTemporadaTallas : TFMTemporadaTallas;

implementation

uses
  UDMTemporadaTallas, UFormGest;

{$R *.dfm}

procedure TFMTemporadaTallas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTemporadaTallas, DMTemporadaTallas);
  NavMain.DataSource := DMTemporadaTallas.DSQMTemporadaTallas;
  DBGMain.DataSource := DMTemporadaTallas.DSQMTemporadaTallas;
  G2kTableLoc.DataSource := DMTemporadaTallas.DSQMTemporadaTallas;
end;

procedure TFMTemporadaTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTemporadaTallas);
end;

procedure TFMTemporadaTallas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
