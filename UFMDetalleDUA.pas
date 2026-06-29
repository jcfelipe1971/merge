unit UFMDetalleDUA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UNavigator, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, UDBDateTimePicker, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, Grids, DBGrids, NsDBGrid;

type
  TFMDetalleDUA = class(TFPEditSinNavegador)
     ToolButton1: TToolButton;
     NavDetalleDUA: THYMNavigator;
     LDUA: TLFLabel;
     DBEDUA: TLFDbedit;
     LProveedor: TLFLabel;
     LFacturaProv: TLFLabel;
     DBEFProveedor: TLFDBEditFind2000;
     EProveedor: TLFEdit;
     LFechaAdmision: TLFLabel;
     DBDEFechaAdmision: TLFDBDateEdit;
     DBGFacturasProveedor: TDBGridFind2000;
     NavFacturasProveedor: THYMNavigator;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFProveedorChange(Sender: TObject);
     procedure DBGFacturasProveedorBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(IdDetallesE: integer);
  end;

var
  FMDetalleDUA : TFMDetalleDUA;

implementation

uses UDMDetalleDUA, UFormGest, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMDetalleDUA.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDetalleDUA, DMDetalleDUA);
end;

procedure TFMDetalleDUA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDetalleDUA);
end;

procedure TFMDetalleDUA.Muestra(IdDetallesE: integer);
begin
  DMDetalleDUA.CreaRegistro(IdDetallesE);
  ShowModal;
end;

procedure TFMDetalleDUA.DBEFProveedorChange(Sender: TObject);
begin
  inherited;
  EProveedor.Text := DameTituloProveedor(StrToIntDef(DBEFProveedor.Text, 0));
end;

procedure TFMDetalleDUA.DBGFacturasProveedorBusqueda(Sender: TObject);
var
  i : integer;
  Proveedor : integer;
begin
  inherited;
  Proveedor := StrToIntDef(DBEFProveedor.Text, 0);

  with DBGFacturasProveedor do
  begin
     if (Proveedor <> 0) then
        CondicionBusqueda := 'PROVEEDOR = ' + IntToStr(Proveedor)
     else
        CondicionBusqueda := '';

     i := Tablas.IndexOf(TablaABuscar);
     if (i >= 0) then
        OrdenadosPor[i] := 'FECHA';
  end;
end;

end.
