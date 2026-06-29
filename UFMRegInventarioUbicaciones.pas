unit UFMRegInventarioUbicaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, UFormGest, Menus, UTeclas, UControlEdit, UNavigator,
  UEditPanel, ActnList, ULFActionList, ULFLabel, rxPlacemnt, ULFFormStorage,
  ULFPanel, UFPEditSinNavegador;

type
  TFMRegInventarioUbicaciones = class(TFPEditSinNavegador)
     DBGFRegInventario: TDBGridFind2000;
     DBEArticulo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LBArticulo: TLFLabel;
     TBSeparador: TToolButton;
     TBNav: TLFToolBar;
     NavMain: THYMNavigator;
     TButtAceptar: TToolButton;
     PNLStockUbicacion: TLFPanel;
     DBGFStockUbicacion: TDBGridFind2000;
     TBStockUbi: TLFToolBar;
     NavStockUbi: THYMNavigator;
     PNLArticulo: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFRegInventarioBusqueda(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraUbiArtic(empresa, ejercicio, canal, rig, linea, id_reg, id_reg_detalle, id_a: integer; serie: string; Unidades_Doc: double);
  end;

var
  FMRegInventarioUbicaciones : TFMRegInventarioUbicaciones;

implementation

uses UDMRegInventarioUbicaciones, UDMMain, UEntorno;

{$R *.dfm}

procedure TFMRegInventarioUbicaciones.FormCreate(Sender: TObject);
begin
  AbreData(TDMRegInventarioUbicaciones, DMRegInventarioUbicaciones);

  DBGFRegInventario.DataSource := DMRegInventarioUbicaciones.DSQMRegInventario;
  NavMain.DataSource := DMRegInventarioUbicaciones.DSQMRegInventario;

  DBGFStockUbicacion.DataSource := DMRegInventarioUbicaciones.DSQMRegInventario;
  NavStockUbi.DataSource := DMRegInventarioUbicaciones.DSQMRegInventario;

  ControlEdit := CEMain;
end;

procedure TFMRegInventarioUbicaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMRegInventarioUbicaciones);
end;

procedure TFMRegInventarioUbicaciones.MuestraUbiArtic(empresa, ejercicio, canal, rig, linea, id_reg, id_reg_detalle, id_a: integer; serie: string; Unidades_Doc: double);
begin
  DMRegInventarioUbicaciones.MuestraUbicacion(empresa, ejercicio, canal, rig,
     linea, id_reg, id_reg_detalle, id_a, serie, unidades_doc);
  ShowModal;
end;

procedure TFMRegInventarioUbicaciones.DBGFRegInventarioBusqueda(Sender: TObject);
begin
  if (Trim(DBGFRegInventario.TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
  begin
     DBGFRegInventario.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
        ' and (id_ubicacion not in ( select det.id_ubicacion from art_reg_inventario_det_ubi det where det.id_reg_detalle = ' +
        IntToStr(DMRegInventarioUbicaciones.QMRegInventarioID_REG_DETALLE.AsInteger) +
        ')) and id_a =' +
        IntToStr(DMRegInventarioUbicaciones.QMRegInventarioID_A.AsInteger) +
        ' and substring(composicion from 1 for 3)=''' + DMRegInventarioUbicaciones.DameAlmacen + '''';
  end;
end;

procedure TFMRegInventarioUbicaciones.TButtAceptarClick(Sender: TObject);
begin
  if (DMRegInventarioUbicaciones.InsertaUbicacion) then
     Close;
end;

end.
