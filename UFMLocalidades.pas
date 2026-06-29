unit UFMLocalidades;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask,
  DBCtrls, Menus, UTeclas, UControlEdit, StdCtrls, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFPEdit,
  ULFDBEditFind2000, ULFDBEdit, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, NsDBGrid, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel,
  UG2kTBLoc, ULFEdit, ULFComboBox;

type
  TFMLocalidades = class(TFPEdit)
     LBLLocalidad: TLFLabel;
     DBELocalidad: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LBLCp: TLFLabel;
     DBECodPostal: TLFDbedit;
     DBEFProvincia: TLFDBEditFind2000;
     LBLProvincia: TLFLabel;
     LBLPais: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     LFLColonia: TLFLabel;
     DBEColonia: TLFDbedit;
     ETituloPais: TLFEdit;
     ETituloProvincia: TLFEdit;
     LFLTipoColonia: TLFLabel;
     LFLCiudad: TLFLabel;
     DBETIPO_COLONIA: TLFDbedit;
     DBECIUDAD: TLFDbedit;
     LFLLongitud: TLFLabel;
     DBELONGITUD: TLFDbedit;
     DBELATITUD: TLFDbedit;
     LFLLatitud: TLFLabel;
     LFLZONA_HORARIA: TLFLabel;
     DBEZONA_HORARIA: TLFDbedit;
     PNLFiltroPais: TLFPanel;
     LFiltroPais: TLFLabel;
     CBFiltroPais: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFPaisChange(Sender: TObject);
     procedure DBEFProvinciaChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure CBFiltroPaisSelect(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLocalidades : TFMLocalidades;

implementation

uses UDMPoblaciones, UDMMain, UFormGest, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMLocalidades.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  AbreData(TDMPoblaciones, DMPoblaciones);
  NavMain.DataSource := DMPoblaciones.DSQMLocalidades;
  DBGMain.DataSource := DMPoblaciones.DSQMLocalidades;
  G2kTableLoc.DataSource := DMPoblaciones.DSQMLocalidades;

  with CBFiltroPais do
  begin
     i := RellenaPaises(Items);
     if (i < 0) then
        i := 0;
     ItemIndex := i;
     Text := Items[ItemIndex];
     CBFiltroPaisSelect(Sender);
  end;

  // Fuerzo a que refresque los titulos
  DBEFPaisChange(Sender);
  DBEFProvinciaChange(Sender);
end;

procedure TFMLocalidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPoblaciones);
end;

procedure TFMLocalidades.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPoblaciones.BusquedaCompleja;
  Continua := False;
end;

procedure TFMLocalidades.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DameTituloPais(DBEFPais.Text);
end;

procedure TFMLocalidades.DBEFProvinciaChange(Sender: TObject);
begin
  inherited;
  ETituloProvincia.Text := DameTituloProvincia(DBEFPais.Text, DBEFProvincia.Text);
end;

procedure TFMLocalidades.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
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

procedure TFMLocalidades.CBFiltroPaisSelect(Sender: TObject);
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
  DMPoblaciones.FiltraLocalidades(Pais);
end;

end.
