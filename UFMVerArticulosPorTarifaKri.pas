unit UFMVerArticulosPorTarifaKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UHYDBGrid, StdCtrls, ExtCtrls, UFormGest,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMVerArticulosPorTarifaKri = class(TG2KForm)
     PNLCabecera: TLFPanel;
     LArticulo: TLFLabel;
     ETituloArticulo: TLFEdit;
     PNLDetalle: TLFPanel;
     DBGMain: THYTDBGrid;
     EFArticulo: TLFEditFind2000;
     procedure EFArticuloChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Articulo: string);
  end;

var
  FMVerArticulosPorTarifaKri : TFMVerArticulosPorTarifaKri;

implementation

uses UDMVerArticulosPorTarifaKri, UDameDato, UDMMain;

{$R *.dfm}

procedure TFMVerArticulosPorTarifaKri.Muestra(Articulo: string);
begin
  AbreData(TDMVerArticulosPorTarifaKri, DMVerArticulosPorTarifaKri);
  EFArticulo.Text := Articulo;
  ShowModal;
end;

procedure TFMVerArticulosPorTarifaKri.EFArticuloChange(Sender: TObject);
begin
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
  DMVerArticulosPorTarifaKri.Inicializa(EFArticulo.Text);
end;

procedure TFMVerArticulosPorTarifaKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMVerArticulosPorTarifaKri);
  Action := caFree;
end;

procedure TFMVerArticulosPorTarifaKri.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
