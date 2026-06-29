unit UFMMovStockUbicaciones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, UFormGest, Menus, UTeclas, UControlEdit, UNavigator,
  UEditPanel, ActnList, ULFActionList, ULFLabel, rxPlacemnt, ULFFormStorage,
  ULFPageControl, ULFPanel;

type
  TFMMovStockUbicaciones = class(TG2kForm)
     PNLotes: TLFPanel;
     DBGFDistribuye: TDBGridFind2000;
     TBMain: TLFToolBar;
     DBEArticulo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LBArticulo: TLFLabel;
     TBSeparador: TToolButton;
     TBNav: TLFToolBar;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     EFDistribucion: THYMEditPanel;
     TButtAceptar: TToolButton;
     FSMain: TLFFibFormStorage;
     PCMain: TLFPageControl;
     TSUbicacion: TTabSheet;
     TSLotesUbicacion: TTabSheet;
     DBGLotesUbicaciones: TDBGridFind2000;
     TSLotes: TTabSheet;
     TSNroSerie: TTabSheet;
     TSNroSerieUbicacion: TTabSheet;
     TBLotesUbicacion: TLFToolBar;
     NavLotesUbicacion: THYMNavigator;
     CELotesUbicacion: TControlEdit;
     CELotesUbicacionPMEdit: TPopUpTeclas;
     LFToolBar1: TLFToolBar;
     HYMNavigator1: THYMNavigator;
     CELotes: TControlEdit;
     CELotesPMEdit: TPopUpTeclas;
     DBGLotes: TDBGridFind2000;
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
     procedure MuestraUbiArtic(empresa, ejercicio, rig, linea, id_a, canaldst: integer; serie, tipo_mov: string; Unidades_Doc: double);
  end;

var
  FMMovStockUbicaciones : TFMMovStockUbicaciones;

implementation

uses UDMMain, UEntorno, UDMUbicaArticulo, UDMMovStockUbicaciones, UDameDato;

{$R *.dfm}

procedure TFMMovStockUbicaciones.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMMovStockUbicaciones, DMMovStockUbicaciones);
  ControlEdit := CEMain;
end;

procedure TFMMovStockUbicaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMMovStockUbicaciones);
end;

procedure TFMMovStockUbicaciones.MuestraUbiArtic(empresa, ejercicio, rig, linea, id_a, canaldst: integer; serie, tipo_mov: string; Unidades_Doc: double);
begin
  DMMovStockUbicaciones.MuestraUbicacion(empresa, ejercicio, rig, linea, id_a, canaldst, serie, tipo_mov, unidades_doc);

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

     TSLotes.TabVisible := False;
     TSNroSerie.TabVisible := False;
     if (ArticuloLoteable(id_a)) then
     begin
        TSNroSerieUbicacion.TabVisible := False;
        TSUbicacion.TabVisible := False;
     end;
     if (ArticuloSerializado(id_a)) then
     begin
        TSLotesUbicacion.TabVisible := False;
        TSUbicacion.TabVisible := False;
     end;
  end
  else
     {Si NO es ubicable}
  begin
     TSUbicacion.TabVisible := False;
     TSNroSerieUbicacion.TabVisible := False;
     TSLotesUbicacion.TabVisible := False;
     if (ArticuloLoteable(id_a)) then
        TSNroSerie.TabVisible := False;
     if (ArticuloSerializado(id_a)) then
        TSLotes.TabVisible := False;
  end;

  ShowModal;
end;

procedure TFMMovStockUbicaciones.DBGFDistribuyeBusqueda(Sender: TObject);
begin
  with DBGFDistribuye do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' and (id_ubicacion not in ( select det.id_ubicacion from tmp_ges_detalles_ubicaciones_st det' +
           ' where det.entrada=' + IntToStr(REntorno.Entrada) +
           ' and det.empresa =' + IntToStr(DMMovStockUbicaciones.QMDistribucionEMPRESA.AsInteger) +
           ' and det.ejercicio=' + IntToStr(DMMovStockUbicaciones.QMDistribucionEJERCICIO.AsInteger) +
           ' and det.serie=''' + DMMovStockUbicaciones.QMDistribucionSERIE.AsString + '''' +
           ' and det.rig=' + IntToStr(DMMovStockUbicaciones.QMDistribucionRIG.AsInteger) +
           ' and det.linea=' + IntToStr(DMMovStockUbicaciones.QMDistribucionLINEA.AsInteger) + '))' +
           ' and id_a =' + IntToStr(DMMovStockUbicaciones.QMDistribucionID_A.AsInteger) +
           ' and composicion starting with ''' + DMMovStockUbicaciones.Almacen + ''''; {dji lrk kri - Solo admito ubicaciones de este almacen}
     end;
     if (Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' and (id_ubicacion not in ( select det.id_ubicacion from tmp_ges_detalles_ubicaciones_st det ' +
           ' where det.entrada=' + IntToStr(REntorno.Entrada) +
           ' and det.empresa =' + IntToStr(DMMovStockUbicaciones.QMDistribucionEMPRESA.AsInteger) +
           ' and det.ejercicio=' + IntToStr(DMMovStockUbicaciones.QMDistribucionEJERCICIO.AsInteger) +
           ' and det.serie=''' + DMMovStockUbicaciones.QMDistribucionSERIE.AsString + '''' +
           ' and det.rig=' + IntToStr(DMMovStockUbicaciones.QMDistribucionRIG.AsInteger) +
           ' and det.linea=' + IntToStr(DMMovStockUbicaciones.QMDistribucionLINEA.AsInteger) + '))' +
           ' and almacen=''' + DMMovStockUbicaciones.DameAlmacen + '''';
     end;
  end;
end;

procedure TFMMovStockUbicaciones.TButtAceptarClick(Sender: TObject);
begin
  if (DMMovStockUbicaciones.InsertaUbicacion) then
     Close;
end;

procedure TFMMovStockUbicaciones.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  DMMovStockUbicaciones.BorraTemporal;
end;

procedure TFMMovStockUbicaciones.DBGLotesUbicacionesBusqueda(Sender: TObject);
begin
  with DBGLotesUbicaciones do
  begin
     if (Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DMMovStockUbicaciones.Almacen + '''';
  end;
end;

end.
