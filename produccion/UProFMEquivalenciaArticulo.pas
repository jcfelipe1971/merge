unit UProFMEquivalenciaArticulo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFormGest, StdCtrls, Mask, DBCtrls,
  ULFFIBDBEditFind, ULFLabel, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, UHYDescription, ULFHYDBDescription, ULFEdit;

type
  TProFMEquivalenciaArticulo = class(TFPEditDetalle)
     LFDBId: TLFDbedit;
     LFDBDesc: TLFDbedit;
     LEquivalencia: TLFLabel;
     LDescripcion: TLFLabel;
     LArticulo: TLFLabel;
     LFDBEArticulo: TLFFibDBEditFind;
     CBDefecto: TLFDBCheckBox;
     EDescripcionArticulo: TLFEdit;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     ANoCalcularStock: TAction;
     procedure FormCreate(Sender: TObject);
     procedure LFDBEArticuloChange(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure LFDBEArticuloBusqueda(Sender: TObject);
     procedure AStockAlmacenExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure PosicionaEquivalencia(IDEquivalencia: integer);
  end;

var
  ProFMEquivalenciaArticulo : TProFMEquivalenciaArticulo;

implementation

uses UProDMEquivalenciaArticulo, UDMMain, UDameDato, UEntorno, URellenaLista;

{$R *.dfm}

procedure TProFMEquivalenciaArticulo.FormCreate(Sender: TObject);
var
  Lista : TStrings;
  i : integer;
  NuevaAccion : TAction;
begin
  inherited;
  AbreData(TProDMEquivalenciaArticulo, ProDMEquivalenciaArticulo);
  LFDBEArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';

  // Genero acciones para filtrar por los diferentes almacenes de lanzamiento.
  Lista := TStringList.Create;
  try
     RellenaAlmacenes(Lista);

     for i := 0 to Lista.Count - 1 do
     begin
        NuevaAccion := TAction.Create(Self);
        NuevaAccion.Name := Format('AStockAlmacen%d', [i]);
        NuevaAccion.ActionList := ALMain;
        NuevaAccion.ImageIndex := 99;
        NuevaAccion.Caption := Lista[i];
        NuevaAccion.Tag := 0;
        NuevaAccion.Category := 'Stock;Almacen';
        NuevaAccion.OnExecute := AStockAlmacenExecute;
     end;
  finally
     Lista.Free;
  end;
end;

procedure TProFMEquivalenciaArticulo.LFDBEArticuloChange(Sender: TObject);
begin
  inherited;
  EDescripcionArticulo.Text := DameTituloArticulo(LFDBEArticulo.Text);
end;

procedure TProFMEquivalenciaArticulo.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGFDetalle.TablaABuscar) = 'ART_ARTICULOS' then
  begin
     DBGFDetalle.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
  end;
end;

procedure TProFMEquivalenciaArticulo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMEquivalenciaArticulo.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMEquivalenciaArticulo.LFDBEArticuloBusqueda(Sender: TObject);
begin
  inherited;
  LFDBEArticulo.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
end;

procedure TProFMEquivalenciaArticulo.PosicionaEquivalencia(IDEquivalencia: integer);
begin
  ProDMEquivalenciaArticulo.PosicionaEquivalencia(IDEquivalencia);
end;

procedure TProFMEquivalenciaArticulo.AStockAlmacenExecute(Sender: TObject);
var
  Almacen : string;
begin
  inherited;
  // Tomo los primeros dígitos hasta el espacio para obtener el codigo del almacén.
  Almacen := TAction(Sender).Caption;
  if (Almacen = _('No calcular stock')) then
     Almacen := 'NOCALC'
  else
  if (Almacen = _('Todos los Almacenes')) then
     Almacen := ''
  else
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);

  ProDMEquivalenciaArticulo.StockAlmacen(Almacen);
end;

end.
