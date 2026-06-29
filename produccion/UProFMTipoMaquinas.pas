unit UProFMTipoMaquinas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TProFMTipoMaquinas = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTipoMaquinas : TProFMTipoMaquinas;

implementation

uses UDMMain, UProDMTipoMaquinas, UFormGest, UUtiles, UEntorno;

{$R *.DFM}

procedure TProFMTipoMaquinas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTipoMaquinas, ProDMTipoMaquinas);
  NavMain.DataSource := ProDMTipoMaquinas.DSQMTipos;
  EPMain.DataSource := ProDMTipoMaquinas.DSQMTipos;
  DBGMain.DataSource := ProDMTipoMaquinas.DSQMTipos;
end;

procedure TProFMTipoMaquinas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMTipoMaquinas.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMTipoMaquinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMTipoMaquinas);
end;

procedure TProFMTipoMaquinas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.DataSource := ProDMTipoMaquinas.DSQMTipos;
  G2KTableLoc.Click;
end;

end.
