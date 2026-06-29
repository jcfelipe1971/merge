unit UFMEstanterias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMEstanterias = class(TFPEdit)
     LBLCanal: TLFLabel;
     DBEEstanteria: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEstanterias : TFMEstanterias;

implementation

uses UFormGest, UDMCanales, UDMMain, UDMEstanterias;

{$R *.DFM}

procedure TFMEstanterias.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEstanterias, DMEstanterias);
  NavMain.DataSource := DMEstanterias.DSQMEstanterias;
  DBGMain.DataSource := DMEstanterias.DSQMEstanterias;
end;

procedure TFMEstanterias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEstanterias);
end;

procedure TFMEstanterias.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMEstanterias.BusquedaCompleja;
  Continua := False;
end;

end.
