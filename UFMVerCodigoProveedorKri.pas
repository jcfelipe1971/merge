unit UFMVerCodigoProveedorKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFIBDBEditfind, UComponentesBusquedaFiltrada, Grids, DBGrids, UFormGest,
  NsDBGrid, UHYDBGrid, StdCtrls, ExtCtrls, ULFEditFind2000, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMVerCodigoProveedorKri = class(TG2KForm)
     PNLCabecera: TLFPanel;
     LArticulo: TLFLabel;
     ETituloArticulo: TLFEdit;
     PNLDetalle: TLFPanel;
     DBGMain: THYTDBGrid;
     EFArticulo: TLFEditFind2000;
     procedure EFArticuloChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Articulo: string);
  end;

var
  FMVerCodigoProveedorKri : TFMVerCodigoProveedorKri;

implementation

uses UDMVerCodigoProveedorKri, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMVerCodigoProveedorKri.Muestra(Articulo: string);
begin
  AbreData(TDMVerCodigoProveedorKri, DMVerCodigoProveedorKri);
  EFArticulo.Text := Articulo;
  ShowModal;
end;

procedure TFMVerCodigoProveedorKri.EFArticuloChange(Sender: TObject);
begin
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
  DMVerCodigoProveedorKri.Inicializa(EFArticulo.Text);
end;

procedure TFMVerCodigoProveedorKri.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TFMVerCodigoProveedorKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMVerCodigoProveedorKri);
  action := caFree;
end;

end.
