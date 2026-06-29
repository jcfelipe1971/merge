unit UFMLotesCompraDevKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, UDMLotesCompraDevKri, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMLotesCompraDevKri = class(TForm)
     ETitulo: TLFEdit;
     EArticulo: TLFEdit;
     Panel3: TLFPanel;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     ECantidad: TLFEdit;
     Panel1: TLFPanel;
     DBGDevueltos: TDBGrid;
     Panel2: TLFPanel;
     DBGDisponibles: TDBGrid;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGDevueltosDblClick(Sender: TObject);
     procedure DBGDisponiblesDblClick(Sender: TObject);
  private
     { Private declarations }
     DML: TDMLotesCompraDevKri;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMLotesCompraDevKri : TFMLotesCompraDevKri;

implementation

{$R *.dfm}

procedure TFMLotesCompraDevKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DML.Free;
  Action := caFree;
end;

procedure TFMLotesCompraDevKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DML := TDMLotesCompraDevKri.Create(Self);
  ECantidad.Text := '0';
end;

procedure TFMLotesCompraDevKri.FormShow(Sender: TObject);
begin
  EArticulo.Text := DML.Articulo;
  ETitulo.Text := DML.Titulo;
end;

procedure TFMLotesCompraDevKri.DBGDevueltosDblClick(Sender: TObject);
begin
  DML.DesDevuelve(StrToInt(ECantidad.Text));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

procedure TFMLotesCompraDevKri.DBGDisponiblesDblClick(Sender: TObject);
begin
  DML.Devuelve(StrToIntDef(ECantidad.Text, 0));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

procedure TFMLotesCompraDevKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FML : TFMLotesCompraDevKri;
begin
  DML.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cli,
     cant, Esc, ForzarEntrada);
  if (DML.escandallo) then
  begin
     while (not DML.QEscandallo.EOF) do
     begin
        FML := TFMLotesCompraDevKri.Create(Self);
        FML.Muestra(emp, eje, can, ser, rig, lin, fec, DML.QEscandalloDETALLE.AsString,
           alm, cli, DML.QEscandalloCANTIDAD.AsInteger * cant, esc, ForzarEntrada);
        FML.Free;
        DML.QEscandallo.Next;
     end;
  end;
  if (DML.SinAsignar <> 0) then
  begin
     ECantidad.Text := IntToStr(DML.SinAsignar);
     if (DML.Loteado) then
     begin
        DBGDisponibles.DataSource := DML.DSQLotesDisponibles;
        DBGDevueltos.DataSource := DML.DSQLotesDevueltos;
        ShowModal;
     end;
  end;
end;

end.
