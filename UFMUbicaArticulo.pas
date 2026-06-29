unit UFMUbicaArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  Mask, DBCtrls, ULFDBEdit, ULFPageControl, UNavigator, UEditPanel, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  Menus, UTeclas, UControlEdit, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditSimple, ActnList, ULFActionList;

type
  TFMUbicaArticulo = class(TFPEditSimple)
     PNL_Busca_Articulo: TLFPanel;
     LBAlmacenOrigen: TLFLabel;
     DBETitArticuloOrig: TLFDbedit;
     DBEArticuloOrig: TLFDbedit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     PNFicha: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFMainBusqueda(Sender: TObject);
     procedure DBGFMainColEnter(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InicializaArticulo(Articulo: string);
  end;

var
  FMUbicaArticulo : TFMUbicaArticulo;

implementation

uses UDMMain, UEntorno, UDMUbicaArticulo, UUtiles;

{$R *.dfm}

procedure TFMUbicaArticulo.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMUbicaArticulo, DMUbicaArticulo);

  NavMain.DataSource := DMUbicaArticulo.DSxArticulos;
  NavDetalle.DataSource := DMUbicaArticulo.DSQMArticuloUbicacion;
  EPMain.DataSource := DMUbicaArticulo.DSxArticulos;

  DBGFMain.DataSource := DMUbicaArticulo.DSQMArticuloUbicacion;
  DBGFMain.ColumnaInicial := EncuentraField(DBGFMain, 'COMPOSICION');
  // Show;
end;

procedure TFMUbicaArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMUbicaArticulo);
end;

procedure TFMUbicaArticulo.InicializaArticulo(Articulo: string);
begin
  DMUbicaArticulo.InicializaRegistro(Articulo);
end;

procedure TFMUbicaArticulo.DBGFMainBusqueda(Sender: TObject);
begin
  if (Trim(DBGFMain.TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
  begin
     DBGFMain.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
        ' AND ID_UBICACION NOT IN ( SELECT ID_UBICACION FROM ART_ARTICULOS_UBICACIONES WHERE ID_A = ' +
        IntToStr(DMUbicaArticulo.xArticulosID_A.AsInteger) + ')';
  end;
end;

procedure TFMUbicaArticulo.DBGFMainColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

end.
