unit UProFMRecursos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask,
  DBCtrls, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TProFMRecursos = class(TFPEdit)
     LRecurso: TLFLabel;
     DBERecurso: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMRecursos : TProFMRecursos;

implementation

uses UProDMRecursos, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMRecursos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMRecursos, ProDMRecursos);
  NavMain.DataSource := ProDMRecursos.DSQMProRecursos;
  DBGMain.DataSource := ProDMRecursos.DSQMProRecursos;
end;

procedure TProFMRecursos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMRecursos);
end;

procedure TProFMRecursos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMRecursos.BusquedaCompleja;
end;

procedure TProFMRecursos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
