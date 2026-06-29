unit UFMRegiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFLabel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, Mask, DBCtrls, ULFDBEdit,
  ULFComboBox;

type
  TFMRegiones = class(TFPEdit)
     DBERegion: TLFDbedit;
     DBEFPais: TLFDBEditFind2000;
     DBETtitulo: TLFDbedit;
     LPais: TLFLabel;
     LRegion: TLFLabel;
     LTitulo: TLFLabel;
     ETituloPais: TLFEdit;
     PNLFiltroPais: TLFPanel;
     LFiltroPais: TLFLabel;
     CBFiltroPais: TLFComboBox;
     procedure DBEFPaisChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure CBFiltroPaisSelect(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMRegiones : TFMRegiones;

implementation

uses
  UDMPoblaciones, UDMMain, UFormGest, UDameDato, URellenaLista;

{$R *.dfm}

procedure TFMRegiones.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  AbreData(TDMPoblaciones, DMPoblaciones);
  NavMain.DataSource := DMPoblaciones.DSQMRegiones;
  DBGMain.DataSource := DMPoblaciones.DSQMRegiones;
  G2kTableLoc.DataSource := DMPoblaciones.DSQMRegiones;

  with CBFiltroPais do
  begin
     i := RellenaPaises(Items);
     if (i < 0) then
        i := 0;
     ItemIndex := i;
     Text := Items[ItemIndex];
     CBFiltroPaisSelect(Sender);
  end;
end;

procedure TFMRegiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPoblaciones);
end;

procedure TFMRegiones.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DameTituloPais(DBEFPais.Text);
end;

procedure TFMRegiones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPoblaciones.BCRegiones;
  Continua := False;
end;

procedure TFMRegiones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
var
  Pais : string;
begin
  inherited;

  Pais := '';
  with CBFiltroPais do
  begin
     if (ItemIndex > 0) then
        Pais := Copy(Items[ItemIndex], 1, Pos(' ', Items[ItemIndex]));
  end;

  if (Pais <> '') then
     G2kTableLoc.CondicionBusqueda := 'PAIS =''' + Pais + '''';
  G2kTableLoc.Click;
end;

procedure TFMRegiones.CBFiltroPaisSelect(Sender: TObject);
var
  Pais : string;
begin
  inherited;

  Pais := '';
  with CBFiltroPais do
  begin
     if (ItemIndex > 0) then
        Pais := Copy(Items[ItemIndex], 1, Pos(' ', Items[ItemIndex]));
  end;
  DMPoblaciones.FiltraRegiones(Pais);
end;

end.
