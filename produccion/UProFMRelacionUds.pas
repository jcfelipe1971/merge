unit UProFMRelacionUds;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, UNavigator, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ULFPanel, ToolWin, ComCtrls,
  ULFToolBar;

type
  TProFMRelacionUds = class(TG2KForm)
     TBMain: TLFToolBar;
     PnlMain: TLFPanel;
     DBGFMain: TDBGridFind2000;
     NavMain: THYMNavigator;
     TSepNav: TToolButton;
     TBSalir: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBSalirClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMRelacionUds : TProFMRelacionUds;

implementation

uses UProDMRelacionUds, UDMMain;

{$R *.dfm}

procedure TProFMRelacionUds.FormCreate(Sender: TObject);
begin
  AbreData(TProDMRelacionUds, ProDMRelacionUds);
end;

procedure TProFMRelacionUds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ProDMRelacionUds);
end;

procedure TProFMRelacionUds.TBSalirClick(Sender: TObject);
begin
  Close;
end;

end.
