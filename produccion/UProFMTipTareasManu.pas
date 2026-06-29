unit UProFMTipTareasManu;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TProFMTipTareasManu = class(TFPEdit)
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     Label1: TLFLabel;
     Label2: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTipTareasManu : TProFMTipTareasManu;

implementation

uses UProDMTipTareasManu, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMTipTareasManu.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTipTareasManu, ProDMTipTareasManu);
  ControlEdit := CEMain;
  NavMain.DataSource := ProDMTipTareasManu.DSQMProTipTareasManu;
  DBGMain.DataSource := ProDMTipTareasManu.DSQMProTipTareasManu;
end;

procedure TProFMTipTareasManu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(ProDMTipTareasManu);
end;

procedure TProFMTipTareasManu.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
