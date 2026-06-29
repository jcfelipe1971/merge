unit UFMLotesMOVKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, UDMLotesMOVKri, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMLotesMOVKri = class(TForm)
     Panel1: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     Panel2: TLFPanel;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     ECantidad: TLFEdit;
     Panel3: TLFPanel;
     DBGDisponibles: TDBGrid;
     Panel4: TLFPanel;
     DBGAsignados: TDBGrid;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGDisponiblesDblClick(Sender: TObject);
     procedure DBGAsignadosDblClick(Sender: TObject);
  private
     { Private declarations }
     DML: TDMLotesMOVKri;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; canO, canD: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; almO, almD: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMLotesMOVKri : TFMLotesMOVKri;

implementation

{$R *.dfm}

procedure TFMLotesMOVKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DML.Free;
  Action := caFree;
end;

procedure TFMLotesMOVKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DML := TDMLotesMOVKri.Create(Self);
  ECantidad.Text := '0';
end;

procedure TFMLotesMOVKri.Muestra(emp: integer; eje: integer; canO, canD: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; almO, almD: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FML : TFMLotesMOVKri;
begin
  DML.Inicializa(emp, eje, canO, canD, ser, rig, lin, fec, art, almO, almD,
     cant, Esc, ForzarEntrada);
  if (DML.escandallo) then
  begin
     while (not DML.QEscandallo.EOF) do
     begin
        FML := TFMLotesMOVKri.Create(Self);
        FML.Muestra(emp, eje, canO, canD, ser, rig, lin, fec,
           DML.QEscandalloDETALLE.AsString, almO, almD, DML.QEscandalloCANTIDAD.AsInteger *
           cant, esc, ForzarEntrada);
        FML.Free;
        DML.QEscandallo.Next;
     end;
  end;
  if (DML.SinAsignar <> 0) then
  begin
     if (DML.Loteado) then
     begin
        ECantidad.Text := IntToStr(DML.SinAsignar);
        EArticulo.Text := Art;
        ETitulo.Text := DML.xArticuloTITULO.AsString;
        DBGDisponibles.DataSource := DML.DSDisponible;
        DBGAsignados.DataSource := DML.DSAsignado;
        ShowModal;
     end;
  end;
end;

procedure TFMLotesMOVKri.DBGDisponiblesDblClick(Sender: TObject);
begin
  DML.Asignar(StrToIntDef(ECantidad.Text, 0));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

procedure TFMLotesMOVKri.DBGAsignadosDblClick(Sender: TObject);
begin
  DML.DesAsignar;
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

end.
