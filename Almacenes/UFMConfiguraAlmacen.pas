unit UFMConfiguraAlmacen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  Mask, DBCtrls, ULFDBEdit, ULFPageControl, UNavigator, UEditPanel, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  Menus, UTeclas, UControlEdit, ULFLabel, rxPlacemnt, ULFFormStorage;

type
  TFMConfiguraAlmacen = class(TG2kForm)
     PNMain: TLFPanel;
     PNL_Busca_Articulo: TLFPanel;
     LBAlmacenOrigen: TLFLabel;
     DBETitAlmacenOrig: TLFDbedit;
     DBEAlmacenOrig: TLFDbedit;
     TBMain: TLFToolBar;
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     TSMapa: TTabSheet;
     PNFicha: TLFPanel;
     NavMain: THYMNavigator;
     EPMain: THYMEditPanel;
     TBDetalle: TLFToolBar;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     NavDetalle: THYMNavigator;
     PNArbol: TLFPanel;
     TWMapa: TTreeView;
     PNDetalle: TLFPanel;
     DBGFMain: TDBGridFind2000;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure TSMapaShow(Sender: TObject);
     procedure DBGFMainBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFMainColEnter(Sender: TObject);
  private
     { Private declarations }
     procedure MapaAlmacenes;
  public
     { Public declarations }
     procedure InicializaAlmacen(Almacen: string);
     procedure AbreConfigAlmacenes;
  end;

var
  FMConfiguraAlmacen : TFMConfiguraAlmacen;

implementation

uses UDMConfiguraAlmacen, UDMMain, UEntorno;

{$R *.dfm}

procedure TFMConfiguraAlmacen.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMConfiguraAlmacen, DMConfiguraAlmacen);
  NavMain.DataSource := DMConfiguraAlmacen.DSxAlmacen;
  NavDetalle.DataSource := DMConfiguraAlmacen.DSQMUbicacionAlmacen;
  EPMain.DataSource := DMConfiguraAlmacen.DSxAlmacen;
end;

procedure TFMConfiguraAlmacen.AbreConfigAlmacenes;
begin
  DMConfiguraAlmacen.AbreAlmacenes;
end;

procedure TFMConfiguraAlmacen.InicializaAlmacen(Almacen: string);
begin
  DMConfiguraAlmacen.InicializaRegistro(Almacen);
end;

procedure TFMConfiguraAlmacen.TSMapaShow(Sender: TObject);
begin
  MapaAlmacenes;
end;

procedure TFMConfiguraAlmacen.DBGFMainBusqueda(Sender: TObject);
begin
  if (Trim(DBGFMain.TablaABuscar) = 'ART_CALLES') then
  begin
     DBGFMain.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
  end
  else if (Trim(DBGFMain.TablaABuscar) = 'ART_ESTANTERIAS') then
  begin
     DBGFMain.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
  end
  else if (Trim(DBGFMain.TablaABuscar) = 'ART_REPISAS') then
  begin
     DBGFMain.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
  end
  else if (Trim(DBGFMain.TablaABuscar) = 'ART_POSICIONES') then
  begin
     DBGFMain.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
  end
  else
  begin
     DBGFMain.CondicionBusqueda := '';
  end;
end;

procedure TFMConfiguraAlmacen.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMConfiguraAlmacen.BusquedaCompleja;
  Continua := False;
end;

procedure TFMConfiguraAlmacen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMConfiguraAlmacen);
  Action := caFree;
end;

procedure TFMConfiguraAlmacen.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  MapaAlmacenes;
end;

procedure TFMConfiguraAlmacen.MapaAlmacenes;
begin
  TWMapa.Items.Clear;
  DMConfiguraAlmacen.RellenaMapa;
end;

procedure TFMConfiguraAlmacen.DBGFMainColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

end.
