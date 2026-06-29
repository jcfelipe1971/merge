unit UFMEquivalenciaColores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ComCtrls, ULFPageControl, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  UEditPanel, UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel,
  StdCtrls, ULFEditFind2000, ULFLabel;

type
  TFMEquivalenciaColores = class(TFPEditSimple)
     DBGEquivalenciaColores: TDBGridFind2000;
     PNLFiltro: TLFPanel;
     LColor: TLFLabel;
     LArticuloBase: TLFLabel;
     LArticuloCorrespondeinte: TLFLabel;
     EFColor: TLFEditFind2000;
     EFArticuloBase: TLFEditFind2000;
     EFArticuloCorrespondente: TLFEditFind2000;
     PNLEdicion: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGEquivalenciaColoresBusqueda(Sender: TObject);
     procedure NavMainChangeState(Sender: TObject);
     procedure EFFiltroChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEquivalenciaColores : TFMEquivalenciaColores;

implementation

uses UDMEquivalenciaColores, UEntorno, UDMMain, UUtiles, UFormGest, DB;

{$R *.dfm}

procedure TFMEquivalenciaColores.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEquivalenciaColores, DMEquivalenciaColores);

  NavMain.DataSource := DMEquivalenciaColores.DSEquivalenciaColores;
  DBGEquivalenciaColores.DataSource := DMEquivalenciaColores.DSEquivalenciaColores;
end;

procedure TFMEquivalenciaColores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEquivalenciaColores);
end;

procedure TFMEquivalenciaColores.DBGEquivalenciaColoresBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + REntorno.EjercicioStr +
           ' AND CANAL=' + REntorno.CanalStr +
           ' AND FAMILIA<>''' + REntorno.FamSistema + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;
     if (Trim(TablaABuscar) = 'Z_SYS_COLORES') then
     begin
        CondicionBusqueda := 'ACTIVO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO';
     end;
  end;
end;

procedure TFMEquivalenciaColores.NavMainChangeState(Sender: TObject);
var
  ArticuloBase : smallint;
  ArticuloCorrespondiente : smallint;
begin
  inherited;
  with DBGEquivalenciaColores do
  begin
     ArticuloBase := EncuentraField(DBGEquivalenciaColores, 'ARTICULO_BASE');
     ArticuloCorrespondiente := EncuentraField(DBGEquivalenciaColores, 'ARTICULO_CORRESP');

     ColumnaInicial := ArticuloBase;
     if (NavMain.DataSource.DataSet.State = dsEdit) then
     begin
        Columns[ArticuloBase].ReadOnly := True;
        Columns[ArticuloCorrespondiente].ReadOnly := True;
        Columns[ArticuloBase].Color := clInfoBk;
        Columns[ArticuloCorrespondiente].Color := clInfoBk;
     end
     else
     begin
        Columns[ArticuloBase].ReadOnly := False;
        Columns[ArticuloCorrespondiente].ReadOnly := False;
        Columns[ArticuloBase].Color := clWindow;
        Columns[ArticuloCorrespondiente].Color := clWindow;
     end;
  end;
end;

procedure TFMEquivalenciaColores.EFFiltroChange(Sender: TObject);
begin
  inherited;
  DMEquivalenciaColores.Filtrar(EFColor.Text, EFArticuloBase.Text, EFArticuloCorrespondente.Text);
end;

end.
