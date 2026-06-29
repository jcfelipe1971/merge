unit UFMVerHistoricoDeCosteKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UHYDBGrid, StdCtrls, ExtCtrls, UFormGest,
  ULFEdit, ULFLabel, ULFPanel;

type
  TFMVerHistoricoDeCosteKri = class(TG2KForm)
     PNLCabecera: TLFPanel;
     LArticulo: TLFLabel;
     Earticulo: TLFEdit;
     ETituloArticulo: TLFEdit;
     PNLDetalle: TLFPanel;
     DBGMain: THYTDBGrid;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Articulo: string);
  end;

var
  FMVerHistoricoDeCosteKri : TFMVerHistoricoDeCosteKri;

implementation

uses UDMMain, UDameDato, UDMVerHistoricoDeCosteKri;

{$R *.dfm}

procedure TFMVerHistoricoDeCosteKri.Muestra(Articulo: string);
begin
  EArticulo.Text := Articulo;
  ETituloArticulo.Text := DameTituloArticulo(Articulo);
  AbreData(TDMVerHistoricoDeCosteKri, DMVerHistoricoDeCosteKri);
  DMVerHistoricoDeCosteKri.Inicializa(Articulo);
  ShowModal;
end;

procedure TFMVerHistoricoDeCosteKri.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TFMVerHistoricoDeCosteKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMVerHistoricoDeCosteKri);
  action := caFree;
end;

end.
