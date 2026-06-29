unit UFMReetiquetaLotes;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, UFormGest,
  StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, TFlatCheckBoxUnit,
  ULFCheckBox;

type
  TFMReetiquetaLotes = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     PNLArticulo: TLFPanel;
     Label2: TLFLabel;
     LBLLote: TLFLabel;
     LBLProveedor: TLFLabel;
     LBLAlmacen: TLFLabel;
     EDescProveedor: TLFEdit;
     EDescAlmacen: TLFEdit;
     ESerie: TLFEdit;
     LBLSerie: TLFLabel;
     RGReetiquetado: TRadioGroup;
     LBLNuevoLote: TLFLabel;
     ENuevoLote: TLFEdit;
     CHKReetiquetado: TLFCheckBox;
     ToolButton1: TToolButton;
     TBReetiquetar: TToolButton;
     TBCancelar: TToolButton;
     EArticulo: TLFEdit;
     EDescArticulo: TLFEdit;
     EProveedor: TLFEdit;
     EAlmacen: TLFEdit;
     ELote: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure TBReetiquetarClick(Sender: TObject);
     procedure TBCancelarClick(Sender: TObject);
     procedure RGReetiquetadoClick(Sender: TObject);
     function Mostrar(id_lote: integer; var nuevo_id_lote: integer; id_detalles_e: integer): integer;
  private
     O_ID_LOTE, D_ID_LOTE, ID_DET: integer;
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMReetiquetaLotes : TFMReetiquetaLotes;

implementation

uses
  UDMMain, UDMReetiquetaLotes;

{$R *.dfm}

procedure TFMReetiquetaLotes.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMReetiquetaLotes, DMReetiquetaLotes);
end;

procedure TFMReetiquetaLotes.TBReetiquetarClick(Sender: TObject);
begin
  if (ENuevoLote.Text <> '') then
     DMReetiquetaLotes.ReetiquetaLote(o_id_lote, ENuevoLote.Text, CHKReetiquetado.Checked, d_id_lote, id_det);
  ModalResult := mrOk;
end;

procedure TFMReetiquetaLotes.TBCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TFMReetiquetaLotes.Mostrar(id_lote: integer; var nuevo_id_lote: integer; id_detalles_e: integer): integer;
var
  Articulo, TituloArt, Lote, SerieLote, Proveedor, TituloProv, Almacen, TituloAlm : string;
  Reetiquetado : boolean;
begin
  DMReetiquetaLotes.DameDatosLote(id_lote, Articulo, TituloArt, Lote, SerieLote, Proveedor,
     TituloProv, Almacen, TituloAlm, Reetiquetado);
  // Lleno los valores de los Edit
  EArticulo.Text := Articulo;
  EDescArticulo.Text := TituloArt;
  ELote.Text := Lote;
  ESerie.Text := SerieLote;
  EProveedor.Text := Proveedor;
  EDescProveedor.Text := TituloProv;
  EAlmacen.Text := Almacen;
  EDescAlmacen.Text := TituloAlm;
  CHKReetiquetado.Checked := Reetiquetado;
  // Guardo el lote originario
  O_ID_LOTE := id_lote;
  D_ID_LOTE := id_lote;
  ID_DET := id_detalles_e;
  Result := ShowModal;
  nuevo_id_lote := d_id_lote;
end;

procedure TFMReetiquetaLotes.RGReetiquetadoClick(Sender: TObject);
begin
  case RGReetiquetado.ItemIndex of
     0:
     begin
        ENuevoLote.Enabled := True;
        ENuevoLote.Color := clWindow;
        ENuevoLote.Font.Color := clWindowText;
        CHKReetiquetado.Enabled := True;
        ENuevoLote.Text := '';
        ENuevoLote.SetFocus;
     end;
     1:
     begin
        ENuevoLote.Enabled := False;
        ENuevoLote.Text := 'P' + EProveedor.Text + '_' + ELote.Text;
        CHKReetiquetado.Enabled := True;
        ENuevoLote.Color := clInfoBk;
     end;
     2:
     begin
        ENuevoLote.Enabled := False;
        ENuevoLote.Text := 'P' + EProveedor.Text + '_' + IntToStr(DMReetiquetaLotes.DameProximoCodigo);
        CHKReetiquetado.Enabled := True;
        ENuevoLote.Color := clInfoBk;
     end;
  end;
end;

end.
