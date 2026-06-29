unit UFMPoblaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFDBEdit, ULFLabel,
  Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, ULFComboBox;

type
  TFMPoblaciones = class(TFPEdit)
     DBEFPais: TLFDBEditFind2000;
     DBEProvincia: TLFDBEditFind2000;
     LPais: TLFLabel;
     LProvincia: TLFLabel;
     LPoblacion: TLFLabel;
     LTitulo: TLFLabel;
     DBEPoblacion: TLFDbedit;
     ETituloPais: TLFEdit;
     ETituloProvincia: TLFEdit;
     DBETitulo: TLFDbedit;
     LFiltroPais: TLFLabel;
     CBFiltroPais: TLFComboBox;
     PNLFiltroPais: TLFPanel;
     procedure DBEFPaisChange(Sender: TObject);
     procedure DBEProvinciaChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure CBFiltroPaisSelect(Sender: TObject);
     procedure DBEProvinciaBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPoblaciones : TFMPoblaciones;

implementation

uses
  UDMMain, UDMPoblaciones, UFormGest, UDameDato, URellenaLista;

{$R *.dfm}

procedure TFMPoblaciones.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  AbreData(TDMPoblaciones, DMPoblaciones);
  NavMain.DataSource := DMPoblaciones.DSQMPoblaciones;
  DBGMain.DataSource := DMPoblaciones.DSQMPoblaciones;
  G2kTableLoc.DataSource := DMPoblaciones.DSQMPoblaciones;

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

procedure TFMPoblaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPoblaciones);
end;

procedure TFMPoblaciones.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DameTituloPais(DBEFPais.Text);
end;

procedure TFMPoblaciones.DBEProvinciaChange(Sender: TObject);
begin
  inherited;
  if ((DBEFPais.Text > '') and (DBEProvincia.Text > '')) then
     ETituloProvincia.Text := DameTituloProvincia(DBEFPais.Text, DBEProvincia.Text);
end;

procedure TFMPoblaciones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
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

procedure TFMPoblaciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPoblaciones.BCPoblaciones;
  Continua := False;
end;

procedure TFMPoblaciones.CBFiltroPaisSelect(Sender: TObject);
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
  DMPoblaciones.FiltraPoblaciones(Pais);
end;

procedure TFMPoblaciones.DBEProvinciaBusqueda(Sender: TObject);
begin
  inherited;
  DBEProvincia.CondicionBusqueda := ' PAIS = ''' + DBEFPais.Text + '''';
end;

end.
