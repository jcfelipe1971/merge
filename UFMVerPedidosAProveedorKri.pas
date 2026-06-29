unit UFMVerPedidosAProveedorKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls, UFormGest,
  ULFEdit, ULFLabel, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMVerPedidosAProveedorKri = class(TG2KForm)
     PNLCabecera: TLFPanel;
     PNLDetalle: TLFPanel;
     EProveedor: TLFEdit;
     LProveedor: TLFLabel;
     ETituloProveedor: TLFEdit;
     DBGMain: THYTDBGrid;
     LAlmacen: TLFLabel;
     EAlmacen: TLFEdit;
     ETituloAlmacen: TLFEdit;
     CBTodosAlmacenes: TLFCheckBox;
     procedure CBTodosAlmacenesClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Almacen: string; Proveedor: integer; TodosAlmacenes: boolean);
  end;

var
  FMVerPedidosAProveedorKri : TFMVerPedidosAProveedorKri;

implementation

uses UDMVerPedidosAProveedorKri, UDMMain, UDameDato;

{$R *.dfm}

procedure TFMVerPedidosAProveedorKri.Muestra(Almacen: string; Proveedor: integer; TodosAlmacenes: boolean);
begin
  AbreData(TDMVerPedidosAProveedorKri, DMVerPedidosAProveedorKri);
  EProveedor.Text := IntToStr(Proveedor);
  ETituloProveedor.Text := DameTituloProveedor(Proveedor);
  EAlmacen.Text := Almacen;
  ETituloAlmacen.Text := DameTituloAlmacen(Almacen);
  DMVerPedidosAProveedorKri.Inicializa(Almacen, Proveedor, CBTodosAlmacenes.Checked);
  ShowModal;
end;

procedure TFMVerPedidosAProveedorKri.CBTodosAlmacenesClick(Sender: TObject);
begin
  DMVerPedidosAProveedorKri.Inicializa(EAlmacen.Text, StrToInt(
     EProveedor.Text), CBTodosAlmacenes.Checked);
end;

procedure TFMVerPedidosAProveedorKri.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TFMVerPedidosAProveedorKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMVerPedidosAProveedorKri);
  action := caFree;
end;

end.
