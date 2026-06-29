unit UFMGeneroTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit;

type
  TFMGeneroTallas = class(TFPEdit)
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LCodigo: TLFLabel;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);

  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGeneroTallas : TFMGeneroTallas;

implementation

uses
  UDMGeneroTallas, UFormGest;

{$R *.dfm}

procedure TFMGeneroTallas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGeneroTallas, DMGeneroTallas);
  NavMain.DataSource := DMGeneroTallas.DSQMGeneroTallas;
  DBGMain.DataSource := DMGeneroTallas.DSQMGeneroTallas;
  G2kTableLoc.DataSource := DMGeneroTallas.DSQMGeneroTallas;
end;

procedure TFMGeneroTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGeneroTallas);
end;

procedure TFMGeneroTallas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
