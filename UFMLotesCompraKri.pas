unit UFMLotesCompraKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UDMLotesCompraKri, Grids, DBGrids, ComCtrls,
  Mask, rxToolEdit, ULFDateEdit, ULFEdit, ULFLabel, ULFPanel;

type
  TFMLotesCompraKri = class(TForm)
     Panel1: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     Panel2: TLFPanel;
     Panel3: TLFPanel;
     DBGrid1: TDBGrid;
     ELote: TLFEdit;
     ECantidad: TLFEdit;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     Button1: TButton;
     DTPCaducidad: TLFDateEdit;
     procedure FormShow(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure Button1Click(Sender: TObject);
     procedure DBGrid1DblClick(Sender: TObject);
  private
     { Private declarations }
     DML: TDMLotesCompraKri;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMLotesCompraKri : TFMLotesCompraKri;

implementation

{$R *.dfm}

uses DateUtils, UFMLotesCompraDevKri;

procedure TFMLotesCompraKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FML : TFMLotesCompraKri;
  FMLD : TFMLotesCompraDevKri;
begin
  if (cant < 0) then
  begin
     FMLD := TFMLotesCompraDevKri.Create(Self);
     FMLD.Muestra(emp, eje, can, ser, rig, lin, fec, art, alm, pro, cant, False, False);
     FMLD.Release;
  end
  else
  begin
     DML.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, pro,
        cant, Esc, ForzarEntrada);
     if (DML.SinAsignar <> 0) then
     begin
        if (DML.escandallo) then
        begin
           while (not DML.QEscandallo.EOF) do
           begin
              FML := TFMLotesCompraKri.Create(Self);
              FML.Muestra(emp, eje, can, ser, rig, lin, fec, DML.QEscandalloDETALLE.AsString,
                 alm, pro, DML.QEscandalloCANTIDAD.AsInteger * cant, esc, ForzarEntrada);
              FML.Free;
              DML.QEscandallo.Next;
           end;
        end;
        ECantidad.Text := IntToStr(DML.SinAsignar);
        if (DML.Loteado) then
        begin
           DBGrid1.DataSource := DML.DSQLotes;
           ShowModal;
        end;
     end;
  end;
end;

procedure TFMLotesCompraKri.FormShow(Sender: TObject);
begin
  EArticulo.Text := DML.Articulo;
  ETitulo.Text := DML.Titulo;
end;

procedure TFMLotesCompraKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DML := TDMLotesCompraKri.Create(Self);
  ELote.Text := '';
  DTPCaducidad.Date := Today;
  ECantidad.Text := '0';
end;

procedure TFMLotesCompraKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DML.Free;
  Action := caFree;
end;

procedure TFMLotesCompraKri.Button1Click(Sender: TObject);
begin
  DML.InsertaLote(ELote.Text, DTPCaducidad.Date, StrToIntDef(ECantidad.Text, 0));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ELote.Text := '';
  ELote.SetFocus;
end;

procedure TFMLotesCompraKri.DBGrid1DblClick(Sender: TObject);
begin
  DML.BorraLote;
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ELote.SetFocus;
end;

end.
