unit UFMVerPedidosDeArticuloKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UHYDBGrid, StdCtrls, ExtCtrls, UFormGest,
  TFlatCheckBoxUnit, ULFCheckBox, ULFEdit, ULFLabel, ULFPanel;

type
  TFMVerPedidosDeArticuloKri = class(TG2KForm)
     PNLCabecera: TLFPanel;
     LArticulo: TLFLabel;
     LAlmacen: TLFLabel;
     EArticulo: TLFEdit;
     ETituloArticulo: TLFEdit;
     EAlmacen: TLFEdit;
     ETituloAlmacen: TLFEdit;
     CBTodosAlmacenes: TLFCheckBox;
     PNLDetalle: TLFPanel;
     DBGMain: THYTDBGrid;
     procedure CBTodosAlmacenesClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Almacen: string; Articulo: string; TodosAlmacenes: boolean);
  end;

var
  FMVerPedidosDeArticuloKri : TFMVerPedidosDeArticuloKri;

implementation

uses UDMMain, UDameDato, UDMVerPedidosDeArticuloKri;

{$R *.dfm}

procedure TFMVerPedidosDeArticuloKri.Muestra(Almacen: string; Articulo: string; TodosAlmacenes: boolean);
begin
  EArticulo.Text := Articulo;
  ETituloArticulo.Text := DameTituloArticulo(Articulo);
  EAlmacen.Text := Almacen;
  ETituloAlmacen.Text := DameTituloAlmacen(Almacen);
  AbreData(TDMVerPedidosDeArticuloKri, DMVerPedidosDeArticuloKri);
  DMVerPedidosDeArticuloKri.Inicializa(Almacen, Articulo, CBTodosAlmacenes.Checked);
  ShowModal;
end;

procedure TFMVerPedidosDeArticuloKri.CBTodosAlmacenesClick(Sender: TObject);
begin
  DMVerPedidosDeArticuloKri.Inicializa(EAlmacen.Text, EArticulo.Text,
     CBTodosAlmacenes.Checked);
end;

procedure TFMVerPedidosDeArticuloKri.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TFMVerPedidosDeArticuloKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMVerPedidosDeArticuloKri);
  action := caFree;
end;

end.
