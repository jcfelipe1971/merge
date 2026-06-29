unit UFMCilindros;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit,
  ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMCilindros = class(TFPEdit)
     DBECilindro: TLFDbedit;
     LBCilindro: TLFLabel;
     LBZ: TLFLabel;
     DBEZ: TLFDbedit;
     LB1: TLFLabel;
     DBEBanda: TLFDbedit;
     LBDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LBArticulo: TLFLabel;
     DBEFArticulo: TLFDBEditFind2000;
     EDescripcionArticulo: TLFEdit;
     LBLblMaquina: TLFLabel;
     DBEFMaquina: TLFDBEditFind2000;
     EDescripcionMaquina: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure DBEFMaquinaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCilindros : TFMCilindros;

implementation

uses UDMCilindros, UFormGest, UDMMain, UUtiles, UDameDato;

{$R *.DFM}

procedure TFMCilindros.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCilindros, DMCilindros);

  NavMain.DataSource := DMCilindros.DSQMCilindros;
  EPMain.DataSource := DMCilindros.DSQMCilindros;
  DBGMain.DataSource := DMCilindros.DSQMCilindros;
  G2kTableLoc.DataSource := DMCilindros.DSQMCilindros;

  // Color campo ID
  ColorCampoID(DBECilindro);
end;

procedure TFMCilindros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCilindros);
end;

procedure TFMCilindros.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCilindros.BusquedaCompleja;
end;

procedure TFMCilindros.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMCilindros.DBEFArticuloChange(Sender: TObject);
begin
  inherited;
  EDescripcionArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
end;

procedure TFMCilindros.DBEFMaquinaChange(Sender: TObject);
begin
  inherited;
  EDescripcionMaquina.Text := DameTituloMaquina(StrToIntDef(DBEFMaquina.Text, 0));
end;

end.
