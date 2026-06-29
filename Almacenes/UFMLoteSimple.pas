unit UFMLoteSimple;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, DBCtrls, ULFDBMemo, ULFEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000, Mask,
  ULFDBEdit, ULFLabel, rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFEditFind2000;

type
  TFMLoteSimple = class(TFPEdit)
     LLoteSimple: TLFLabel;
     DBELoteSimple: TLFDbedit;
     LBLFamilia: TLFLabel;
     DBEFFamilia: TLFDBEditFind2000;
     ETitFamilia: TLFEdit;
     LFechaInicio: TLFLabel;
     DBMNotas: TLFDBMemo;
     LNotas: TLFLabel;
     DBDEFechaInicio: TLFDBDateEdit;
     PNLFiltro: TLFPanel;
     LFiltroFamilia: TLFLabel;
     EFFiltroFamilia: TLFEditFind2000;
     LFechaCaducidad: TLFLabel;
     DBDEFechaCaducidad: TLFDBDateEdit;
     LArticulo: TLFLabel;
     DBEFArticulo: TLFDBEditFind2000;
     ETitArticulo: TLFEdit;
     LFCategoryAction1: TLFCategoryAction;
     ACrearRangos: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFFamiliaChange(Sender: TObject);
     procedure DBEFFamiliaBusqueda(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EFFiltroFamiliaBusqueda(Sender: TObject);
     procedure EFFiltroFamiliaChange(Sender: TObject);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure ACrearRangosExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLoteSimple : TFMLoteSimple;

implementation

uses
  UDMLoteSimple, UFormGest, UDMMain, UEntorno, UDameDato, UFMLoteSimpleCreaRango;

{$R *.dfm}

procedure TFMLoteSimple.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLoteSimple, DMLoteSimple);
  NavMain.DataSource := DMLoteSimple.DSQMLoteSimple;
  DBGMain.DataSource := DMLoteSimple.DSQMLoteSimple;
  G2kTableLoc.DataSource := DMLoteSimple.DSQMLoteSimple;
end;

procedure TFMLoteSimple.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLoteSimple);
end;

procedure TFMLoteSimple.DBEFFamiliaChange(Sender: TObject);
begin
  inherited;
  ETitFamilia.Text := DameTituloFamilia(DBEFFamilia.Text);
end;

procedure TFMLoteSimple.DBEFFamiliaBusqueda(Sender: TObject);
begin
  inherited;
  DBEFFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMLoteSimple.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;

  G2kTableLoc.CondicionBusqueda := '';
  if (Trim(EFFiltroFamilia.Text) > '') then
     G2kTableLoc.CondicionBusqueda := 'FAMILIA=''' + Trim(EFFiltroFamilia.Text) + '''';
  G2kTableLoc.Click;
end;

procedure TFMLoteSimple.EFFiltroFamiliaBusqueda(Sender: TObject);
begin
  inherited;
  EFFiltroFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMLoteSimple.EFFiltroFamiliaChange(Sender: TObject);
begin
  inherited;
  DMLoteSimple.Filtrar(EFFiltroFamilia.Text);
end;

procedure TFMLoteSimple.DBEFArticuloChange(Sender: TObject);
begin
  inherited;
  ETitArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
end;

procedure TFMLoteSimple.DBEFArticuloBusqueda(Sender: TObject);
begin
  inherited;
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  if (DBEFFamilia.Text <> '') then
     DBEFArticulo.CondicionBusqueda := DBEFArticulo.CondicionBusqueda + ' AND FAMILIA=''' + Copy(DBEFFamilia.Text, 1, 5) + '''';
end;

procedure TFMLoteSimple.ACrearRangosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMLoteSimpleCreaRango, FMLoteSimpleCreaRango);
  FMLoteSimpleCreaRango.Hide;
  FMLoteSimpleCreaRango.ShowModal;
end;

end.
