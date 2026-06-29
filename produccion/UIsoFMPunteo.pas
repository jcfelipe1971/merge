unit UIsoFMPunteo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UNavigator, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Menus, UTeclas, UControlEdit, ActnList, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, DB, UFPEditSimple, rxPlacemnt,
  ULFFormStorage, ULFActionList, UEditPanel;

type
  TIsoFMPunteo = class(TFPEditSimple)
     DBGFPunteoInc: TDBGridFind2000;
     ALIsoIncPunteo: TActionList;
     TBSep2: TToolButton;
     TBValidar: TToolButton;
     AIsoValidar: TAction;
     TBSep1: TToolButton;
     TBTipos: TToolButton;
     PMPunteo: TPopupMenu;
     MGTipo: TMenuItem;
     MICliente: TMenuItem;
     MIProveedor: TMenuItem;
     MIOtrosVarios: TMenuItem;
     AIsoClienteFiltro: TAction;
     AIsoProvFiltro: TAction;
     AIsoOtrosFiltro: TAction;
     MITodos: TMenuItem;
     AIsoTodosFiltro: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AIsoValidarExecute(Sender: TObject);
     procedure AIsoProvFiltroExecute(Sender: TObject);
     procedure AIsoOtrosFiltroExecute(Sender: TObject);
     procedure AIsoClienteFiltroExecute(Sender: TObject);
     procedure AIsoTodosFiltroExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMPunteo : TIsoFMPunteo;

implementation

{$R *.DFM}

uses UDMMain, UIsoDMPunteo;

procedure TIsoFMPunteo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMPunteo, IsoDMPunteo);
  DBGFPunteoInc.DataSource := IsoDMPunteo.DSQMPunteo;
  NavMain.DataSource := IsoDMPunteo.DSQMPunteo;
  NavMain.ControlEdit := CEMain;
end;

procedure TIsoFMPunteo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMPunteo);
end;

procedure TIsoFMPunteo.AIsoValidarExecute(Sender: TObject);
begin
  IsoDMPunteo.Validar;
end;

procedure TIsoFMPunteo.AIsoProvFiltroExecute(Sender: TObject);
begin
  IsoDMPunteo.Filtrar(1);
end;

procedure TIsoFMPunteo.AIsoOtrosFiltroExecute(Sender: TObject);
begin
  IsoDMPunteo.Filtrar(2);
end;

procedure TIsoFMPunteo.AIsoClienteFiltroExecute(Sender: TObject);
begin
  IsoDMPunteo.Filtrar(0);
end;

procedure TIsoFMPunteo.AIsoTodosFiltroExecute(Sender: TObject);
begin
  IsoDMPunteo.Filtrar(-1);
end;

end.
