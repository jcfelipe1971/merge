unit UFMDistribuyeArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, UFormGest, Menus, UTeclas, UControlEdit, UNavigator,
  UEditPanel, ActnList, ULFActionList, ULFLabel, rxPlacemnt, ULFFormStorage,
  ULFPageControl, ULFPanel, UFPEditSinNavegador;

type
  TFMDistribuyeArticulos = class(TFPEditSinNavegador)
     DBGFDistribuye: TDBGridFind2000;
     DBEArticulo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LBArticulo: TLFLabel;
     TBSeparador: TToolButton;
     TBNav: TLFToolBar;
     NavMain: THYMNavigator;
     EFDistribucion: THYMEditPanel;
     TButtAceptar: TToolButton;
     PCMain: TLFPageControl;
     TSUbicacion: TTabSheet;
     TSLotesUbicacion: TTabSheet;
     DBGLotesUbicaciones: TDBGridFind2000;
     TSNroSerie: TTabSheet;
     TSNroSerieUbicacion: TTabSheet;
     TSLotes: TTabSheet;
     TBLotes: TLFToolBar;
     NavLotes: THYMNavigator;
     CELotes: TControlEdit;
     CELotesPMEdit: TPopUpTeclas;
     DBGLotes: TDBGridFind2000;
     TBLotesUbicacion: TLFToolBar;
     NavLotesUbicacion: THYMNavigator;
     CELotesUbicacion: TControlEdit;
     CELotesUbicacionPMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDistribuyeBusqueda(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure DBGLotesUbicacionesBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraUbiArtic(Empresa, Ejercicio, Canal, Rig, Linea, id_detalles, id_a: integer; Serie, Tipo: string; Unidades_Doc: double);
  end;

var
  FMDistribuyeArticulos : TFMDistribuyeArticulos;

implementation

uses UDMDistribuyeArticulos, UDMMain, UEntorno, UDMUbicaArticulo, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMDistribuyeArticulos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMDistribuyeArticulos, DMDistribuyeArticulos);
  ControlEdit := CEMain;
  PCMain.ActivePage := TSUbicacion;

  NavMain.DataSource := DMDistribuyeArticulos.DSQMDistribucion;
  DBGFDistribuye.DataSource := DMDistribuyeArticulos.DSQMDistribucion;

  DBGFDistribuye.ColumnaInicial := EncuentraField(DBGFDistribuye, 'UBICACION');
end;

procedure TFMDistribuyeArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMDistribuyeArticulos);
end;

procedure TFMDistribuyeArticulos.MuestraUbiArtic(Empresa, Ejercicio, Canal, Rig, Linea, id_detalles, id_a: integer; Serie, Tipo: string; Unidades_Doc: double);
begin
  DMDistribuyeArticulos.MuestraUbicacion(Empresa, Ejercicio, Canal,
     Rig, Linea, id_detalles, id_a, Serie, Tipo, unidades_doc);

  {Solo mostrar la pestaña que corresponda}
  TSUbicacion.TabVisible := False;
  TSLotes.TabVisible := False;
  TSNroSerie.TabVisible := False;
  TSNroSerieUbicacion.TabVisible := False;
  TSLotesUbicacion.TabVisible := False;
  {Si es ubicable}
  if (ArticuloUbicable(id_a)) then
  begin
     if (ArticuloLoteable(id_a)) then
        TSLotesUbicacion.TabVisible := True
     else
     if (ArticuloSerializado(id_a)) then
        TSNroSerieUbicacion.TabVisible := True
     else
        TSUbicacion.TabVisible := True;
  end
  else
     {Si NO es ubicable}
  begin
     if (ArticuloLoteable(id_a)) then
        TSLotes.TabVisible := True
     else
     if (ArticuloSerializado(id_a)) then
        TSNroSerie.TabVisible := True;
  end;

  ShowModal;
end;

procedure TFMDistribuyeArticulos.DBGFDistribuyeBusqueda(Sender: TObject);
begin
  with (DBGFDistribuye) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' and (id_ubicacion not in ( select det.id_ubicacion from tmp_ges_detalles_ubicaciones det where det.id_detalles = ' +
           IntToStr(DMDistribuyeArticulos.QMDistribucionID_DETALLES.AsInteger) +
           ' and det.entrada=' + IntToStr(REntorno.Entrada) + '))' +
           ' and id_a =' +
           IntToStr(DMDistribuyeArticulos.QMDistribucionID_A.AsInteger) +
           ' and substring(composicion from 1 for 3)=''' + DMDistribuyeArticulos.DameAlmacen + '''';
     end;
     if (Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' and (id_ubicacion not in ( select det.id_ubicacion from tmp_ges_detalles_ubicaciones det where det.id_detalles = ' +
           IntToStr(DMDistribuyeArticulos.QMDistribucionID_DETALLES.AsInteger) +
           ' and det.entrada=' + IntToStr(REntorno.Entrada) + '))' +
           ' and almacen=''' + DMDistribuyeArticulos.DameAlmacen + '''';
     end;
  end;
end;

procedure TFMDistribuyeArticulos.TButtAceptarClick(Sender: TObject);
begin
  if (DMDistribuyeArticulos.InsertaUbicacion) then
     Close;
end;

procedure TFMDistribuyeArticulos.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  DMDistribuyeArticulos.BorraTemporal;
end;

procedure TFMDistribuyeArticulos.DBGLotesUbicacionesBusqueda(Sender: TObject);
begin
  with DBGLotesUbicaciones do
  begin
     if (Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DMDistribuyeArticulos.DameAlmacen + '''';
  end;
end;

end.
