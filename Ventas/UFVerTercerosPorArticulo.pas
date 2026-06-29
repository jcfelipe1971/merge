unit UFVerTercerosPorArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UHYDBGrid, ToolWin, ComCtrls, ExtCtrls,
  Mask, UHYDescription, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UFormGest, UEditPanel, Menus, ActnList,
  DB, DBCtrls, FIBTableDataSet, UControlEdit,
  dbcgrids, rxPlacemnt, ULFToolBar, ULFPanel, ULFHYDBDescription,
  ULFEditFind2000, ULFLabel, UFPEditSinNavegador, ULFFormStorage,
  ULFActionList, UTeclas, ULFEdit;

type
  TFVerTercerosPorArticulo = class(TFPEditSinNavegador)
     DBGMain: THYTDBGrid;
     ToolButton2: TToolButton;
     PNLArticulo: TLFPanel;
     LArticulo: TLFLabel;
     EFArticulo: TLFEditFind2000;
     EArticulo: TLFEdit;
     PNLTotales: TLFPanel;
     LTotalUnidades: TLFLabel;
     RMETotalUnidades: THYGRightEdit;
     RMETotalVentas: THYGRightEdit;
     LTotalImporte: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     ModoForm: integer;
     procedure AsignaArticulo(Articulo: string; Modo: integer);
     procedure FiltraSegunModo(Articulo: string);
  end;

var
  FVerTercerosPorArticulo : TFVerTercerosPorArticulo;

implementation

uses UDMMain, UDMVerTercerosArticulo, UEntorno, UDameDato;

{$R *.dfm}

procedure TFVerTercerosPorArticulo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMVerTercerosArticulo, DMVerTercerosArticulo);
end;

procedure TFVerTercerosPorArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMVerTercerosArticulo);
end;

procedure TFVerTercerosPorArticulo.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFVerTercerosPorArticulo.AsignaArticulo(Articulo: string; Modo: integer);
begin
  // Modo 0 Proveedores
  // Modo 1 Ventas
  case Modo of
     0: Caption := _('Ver Proveedores por Artículo');
     1: Caption := _('Ver Clientes por Artículo');
  end;
  ModoForm := Modo;
  FiltraSegunModo(Articulo);
  ShowModal;
end;

procedure TFVerTercerosPorArticulo.FiltraSegunModo(Articulo: string);
begin
  if (Articulo = '') then
     Articulo := '¿?';
  EFArticulo.Text := Articulo;

  case ModoForm of
     0:
     begin
        with DBGMain do
        begin
           FindColumn('CLIENTE').Visible := False;
           FindColumn('TITULO').Visible := False;
           FindColumn('PV').Visible := False;
           FindColumn('PROVEEDOR').Title.Caption := _('Proveedor');

           FindColumn('PROVEEDOR').Width := 64;
           FindColumn('TITULO').Width := 234;
           FindColumn('PRECIO_COMPRA').Width := 64;
           FindColumn('PRECIO_COSTE').Width := 64;
           FindColumn('COSTE').Width := 64;
           FindColumn('FECHA').Width := 64;
           FindColumn('SERIE').Width := 29;
           FindColumn('RIG').Width := 44;
           DataSource := DMVerTercerosArticulo.DSxProveedores;
        end;

        DMVerTercerosArticulo.ActualizaGridProveedores(Articulo);
     end;
     1:
     begin
        with DBGMain do
        begin
           FindColumn('SERIE').Visible := False;
           FindColumn('RIG').Visible := False;
           FindColumn('FECHA').Visible := False;

           FindColumn('PROVEEDOR').Visible := False;
           FindColumn('TITULO').Visible := False;
           FindColumn('PRECIO_COMPRA').Visible := False;
           FindColumn('PRECIO_COSTE').Visible := False;
           FindColumn('COSTE').Visible := False;
           FindColumn('CLIENTE').Title.Caption := _('Cliente');
           DataSource := DMVerTercerosArticulo.DSxClientes;
        end;

        DMVerTercerosArticulo.ActualizaGridClientes(Articulo);
     end;
  end;

  RMETotalVentas.Text := FormatFloat(MascaraN, DMVerTercerosArticulo.TotalImporte);
  RMETotalUnidades.Text := FormatFloat(MascaraN, DMVerTercerosArticulo.TotalUnidades);
end;

procedure TFVerTercerosPorArticulo.EFArticuloChange(Sender: TObject);
begin
  if (EFArticulo.Text <> '') then
  begin
     EArticulo.Text := DameTituloArticulo(EFArticulo.Text);
     FiltraSegunModo(EFArticulo.Text);
  end;
end;

end.
