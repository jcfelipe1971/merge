unit UFMProtocoloDeVenta;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel, ULFComboBox,
  ULFDBEdit;

type
  TFMProtocoloDeVenta = class(TFPEdit)
     CBTipoProtocolo: TLFComboBox;
     LProtocolo: TLFLabel;
     LFechaAlta: TLFLabel;
     LFechaBaja: TLFLabel;
     DBEProtocolo: TLFDBEditFind2000;
     DBDEFechaAlta: TLFDBDateEdit;
     DBDEFechaBaja: TLFDBDateEdit;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGDetalle: TDBGridFind2000;
     ToolButton1: TToolButton;
     DBETitulo: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AListadoProtocolo: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfListadosProtocolo: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ARegeneraCondiciones: TAction;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure CBTipoProtocoloChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGDetalleBusqueda(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ARegeneraCondicionesExecute(Sender: TObject);
     procedure AConfListadosProtocoloExecute(Sender: TObject);
     procedure AListadoProtocoloExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMProtocoloDeVenta : TFMProtocoloDeVenta;

implementation

uses UFormGest, UDMMain, UEntorno, UDMProtocoloDeVenta,
  UDMLstProtocoloDeVenta, UFMListConfig;

{$R *.dfm}

procedure TFMProtocoloDeVenta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMProtocoloDeVenta, DMProtocoloDeVenta);
  NavMain.DataSource := DMProtocoloDeVenta.DSQMProtocolo;
  DBGMain.DataSource := DMProtocoloDeVenta.DSQMProtocolo;
  DBGDetalle.DataSource := DMProtocoloDeVenta.DSQMDetalle;
  {Forzamos el filtrado por tipo}
  CBTipoProtocolo.ItemIndex := 0;
  CBTipoProtocoloChange(Sender);
end;

procedure TFMProtocoloDeVenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMProtocoloDeVenta);
end;

procedure TFMProtocoloDeVenta.CBTipoProtocoloChange(Sender: TObject);
begin
  inherited;
  DMProtocoloDeVenta.FiltraTipo(CBTipoProtocolo.ItemIndex);
  {Mostramos las columnas segun tipo}
  DBGDetalle.FindColumn('ARTICULO').Visible := CBTipoProtocolo.ItemIndex = 0;
  DBGDetalle.FindColumn('PRECIO').Visible := CBTipoProtocolo.ItemIndex = 0;
  DBGDetalle.FindColumn('FAMILIA').Visible := CBTipoProtocolo.ItemIndex = 1;
  if (CBTipoProtocolo.ItemIndex = 0) then
  begin
     DBGDetalle.ColumnaInicial := DBGDetalle.FindColumn('ARTICULO').Index;
     G2KTableLoc.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND TIPO=''CCA'' ';
  end
  else
  begin
     DBGDetalle.ColumnaInicial := DBGDetalle.FindColumn('FAMILIA').Index;
     G2KTableLoc.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND TIPO=''CCF'' ';
  end;
end;

procedure TFMProtocoloDeVenta.DBGDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;
     if (Trim(DBGDetalle.TablaABuscar) = 'ART_FAMILIAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'FAMILIA';
     end;
  end;
end;

procedure TFMProtocoloDeVenta.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMProtocoloDeVenta.ARegeneraCondicionesExecute(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Regenerar las condiciones de todos los clientes con este protocolo?',
     'Confirmación', mb_iconstop + mb_yesno) = id_yes) then
     DMProtocoloDeVenta.RegenerarCondiciones;
end;

procedure TFMProtocoloDeVenta.AConfListadosProtocoloExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstProtocoloDeVenta, DMLstProtocoloDeVenta);
  TFMListConfig.Create(Self).Muestra(5105, formato, cabecera, copias, pijama, '',
     DMLstProtocoloDeVenta.frProtocolo);
  CierraData(DMLstProtocoloDeVenta);
end;

procedure TFMProtocoloDeVenta.AListadoProtocoloExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstProtocoloDeVenta, DMLstProtocoloDeVenta);
  DMLstProtocoloDeVenta.MostrarProtocolo(0, CBTipoProtocolo.ItemIndex);
  CierraData(DMLstProtocoloDeVenta);
end;

end.
