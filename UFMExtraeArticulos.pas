unit UFMExtraeArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, UFormGest, Menus, UTeclas, UControlEdit, UNavigator,
  UEditPanel, ActnList, ULFActionList, ULFLabel, rxPlacemnt, ULFFormStorage,
  ULFPanel, ULFPageControl, UFPEditSinNavegador;

type
  TFMExtraeArticulos = class(TFPEditSinNavegador)
     DBGFDistribuye: TDBGridFind2000;
     DBEArticulo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LBArticulo: TLFLabel;
     TBSeparador: TToolButton;
     TBNav: TLFToolBar;
     NavMain: THYMNavigator;
     TButtAceptar: TToolButton;
     PCMain: TLFPageControl;
     TSUbicacion: TTabSheet;
     TSLotesUbicacion: TTabSheet;
     TSNroSerie: TTabSheet;
     TSNroSerieUbicacion: TTabSheet;
     TSLotes: TTabSheet;
     NavLotesDisponibles: THYMNavigator;
     TBLotesDisponibles: TLFToolBar;
     DBGLotesDisponibles: TDBGridFind2000;
     TBLotesUbicacionDisponibles: TLFToolBar;
     NavLotesUbicacionDisponibles: THYMNavigator;
     DBGLotesUbicacionesDisponibles: TDBGridFind2000;
     PNLLotesDisponibles: TLFPanel;
     PNLLotesSeleccionados: TLFPanel;
     PNLLotesUbicacionDisponibles: TLFPanel;
     PNLLotesUbicacionSeleccionados: TLFPanel;
     SplitterLotesUbicacion: TSplitter;
     SplitterLotes: TSplitter;
     TBLotesSeleccionados: TLFToolBar;
     NavLotesSeleccionados: THYMNavigator;
     DBGLotesSeleccionados: TDBGridFind2000;
     TBLotesUbicacionSeleccionados: TLFToolBar;
     NavLotesUbicacionSeleccionados: THYMNavigator;
     DBGLotesUbicacionesSeleccionados: TDBGridFind2000;
     CELotesDisponibles: TControlEdit;
     CELotesPMEdit: TPopUpTeclas;
     CELotesSeleccionados: TControlEdit;
     CELotesSeleccionadosPMEdit: TPopUpTeclas;
     CELotesUbicacionSeleccionados: TControlEdit;
     CELotesUbicacionSeleccionadosPMEdit: TPopUpTeclas;
     CELotesUbicacionDisponible: TControlEdit;
     CELotesUbicacionDisponiblePMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDistribuyeBusqueda(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure DBGLotesDisponiblesDblClick(Sender: TObject);
     procedure DBGLotesSeleccionadosDblClick(Sender: TObject);
     procedure DBGLotesUbicacionesDisponiblesDblClick(Sender: TObject);
     procedure DBGLotesUbicacionesSeleccionadosDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraUbiArtic(empresa, ejercicio, canal, rig, linea, id_detalles, id_a: integer; serie, tipo: string; Unidades_Doc: double);
  end;

var
  FMExtraeArticulos : TFMExtraeArticulos;

implementation

uses UDMExtraeArticulos, UDMMain, UEntorno, UDMUbicaArticulo, UDameDato;

{$R *.dfm}

procedure TFMExtraeArticulos.FormCreate(Sender: TObject);
begin
  AbreData(TDMExtraeArticulos, DMExtraeArticulos);
  ControlEdit := CEMain;
end;

procedure TFMExtraeArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMExtraeArticulos);
end;

procedure TFMExtraeArticulos.MuestraUbiArtic(empresa, ejercicio, canal, rig, linea, id_detalles, id_a: integer; serie, tipo: string; Unidades_Doc: double);
begin
  DMExtraeArticulos.MuestraUbicacion(empresa, ejercicio, canal, rig,
     linea, id_detalles, id_a, serie, tipo, unidades_doc);

  // Solo mostrar la pestaña que corresponda
  TSUbicacion.TabVisible := False;
  TSLotes.TabVisible := False;
  TSNroSerie.TabVisible := False;
  TSNroSerieUbicacion.TabVisible := False;
  TSLotesUbicacion.TabVisible := False;
  if (ArticuloUbicable(id_a)) then
  begin
     // Si es ubicable
     if (ArticuloLoteable(id_a)) then
        TSLotesUbicacion.TabVisible := True
     else
     if (ArticuloSerializado(id_a)) then
        TSNroSerieUbicacion.TabVisible := True
     else
        TSUbicacion.TabVisible := True;
  end
  else
  begin
     // Si NO es ubicable
     if (ArticuloLoteable(id_a)) then
        TSLotes.TabVisible := True
     else
     if (ArticuloSerializado(id_a)) then
        TSNroSerie.TabVisible := True;
  end;

  ShowModal;
end;

procedure TFMExtraeArticulos.DBGFDistribuyeBusqueda(Sender: TObject);
begin
  if (Trim(DBGFDistribuye.TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
  begin
     DBGFDistribuye.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
        ' and (id_ubicacion not in ( select det.id_ubicacion from tmp_ges_detalles_ubicaciones det where det.id_detalles = ' +
        IntToStr(DMExtraeArticulos.QMDistribucionID_DETALLES.AsInteger) +
        ' and det.entrada=' + IntToStr(REntorno.Entrada) + '))' +
        ' and id_a =' +
        IntToStr(DMExtraeArticulos.QMDistribucionID_A.AsInteger) +
        ' and substring(composicion from 1 for 3)=''' + DMExtraeArticulos.DameAlmacen + '''';
  end;
end;

procedure TFMExtraeArticulos.TButtAceptarClick(Sender: TObject);
begin
  if (DMExtraeArticulos.InsertaUbicacion) then
     Close;
end;

procedure TFMExtraeArticulos.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  DMExtraeArticulos.BorraTemporal;
end;

procedure TFMExtraeArticulos.DBGLotesDisponiblesDblClick(Sender: TObject);
begin
  DMExtraeArticulos.SeleccionaTodosLosLotes;
end;

procedure TFMExtraeArticulos.DBGLotesSeleccionadosDblClick(Sender: TObject);
begin
  DMExtraeArticulos.QuitaTodosLosLotes;
end;

procedure TFMExtraeArticulos.DBGLotesUbicacionesDisponiblesDblClick(Sender: TObject);
begin
  DMExtraeArticulos.SeleccionaTodosLosLotesUbicacion;
end;

procedure TFMExtraeArticulos.DBGLotesUbicacionesSeleccionadosDblClick(Sender: TObject);
begin
  DMExtraeArticulos.QuitaTodosLosLotesUbicacion;
end;

end.
