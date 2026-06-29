unit UFMLotesDevKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, UDMLotesDevKri, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMLotesDevKri = class(TForm)
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
     Panel4: TLFPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGDevueltosDblClick(Sender: TObject);
     procedure DBGDisponiblesDblClick(Sender: TObject);
  private
     { Private declarations }
     DML: TDMLotesDevKri;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMLotesDevKri : TFMLotesDevKri;

implementation

{$R *.dfm}

procedure TFMLotesDevKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DML.Free;
  Action := caFree;
end;

procedure TFMLotesDevKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DML := TDMLotesDevKri.Create(Self);
  ECantidad.Text := '0';
end;

procedure TFMLotesDevKri.FormShow(Sender: TObject);
begin
  EArticulo.Text := DML.Articulo;
  ETitulo.Text := DML.Titulo;
end;

procedure TFMLotesDevKri.DBGDevueltosDblClick(Sender: TObject);
begin
  DML.DesDevuelve(StrToInt(ECantidad.Text));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

procedure TFMLotesDevKri.DBGDisponiblesDblClick(Sender: TObject);
begin
  DML.Devuelve(StrToIntDef(ECantidad.Text, 0));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

procedure TFMLotesDevKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FML : TFMLotesDevKri;
begin
  DML.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cli,
     cant, Esc, ForzarEntrada);
  if (DML.escandallo) then
  begin
     while (not DML.QEscandallo.EOF) do
     begin
        FML := TFMLotesDevKri.Create(Self);
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
        {         DBGAsignados.DataSource := DML.DSQLotesAsignados;}
        ShowModal;
     end;
  end;
end;

end.
