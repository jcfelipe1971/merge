unit UFMLotesMOSKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLotesMOSKri, Grids, DBGrids, StdCtrls, ExtCtrls, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMLotesMOSKri = class(TForm)
     Panel1: TLFPanel;
     Panel2: TLFPanel;
     Panel3: TLFPanel;
     Panel4: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     Label1: TLFLabel;
     ECantidad: TLFEdit;
     Label2: TLFLabel;
     Label3: TLFLabel;
     DBGDisponibles: TDBGrid;
     DBGAsignados: TDBGrid;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGDisponiblesDblClick(Sender: TObject);
     procedure DBGAsignadosDblClick(Sender: TObject);
  private
     { Private declarations }
     DML: TDMLotesMOSKri;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMLotesMOSKri : TFMLotesMOSKri;

implementation

{$R *.dfm}

procedure TFMLotesMOSKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DML.Free;
  Action := caFree;
end;

procedure TFMLotesMOSKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DML := TDMLotesMOSKri.Create(Self);
  ECantidad.Text := '0';
end;

procedure TFMLotesMOSKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FML : TFMLotesMOSKri;
begin
  DML.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cant, Esc, ForzarEntrada);
  if (DML.escandallo) then
  begin
     while (not DML.QEscandallo.EOF) do
     begin
        FML := TFMLotesMOSKri.Create(Self);
        FML.Muestra(emp, eje, can, ser, rig, lin, fec, DML.QEscandalloDETALLE.AsString,
           alm, DML.QEscandalloCANTIDAD.AsInteger * cant, DML.escandallo, ForzarEntrada);
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

procedure TFMLotesMOSKri.DBGDisponiblesDblClick(Sender: TObject);
begin
  DML.Asignar(StrToIntDef(ECantidad.Text, 0));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

procedure TFMLotesMOSKri.DBGAsignadosDblClick(Sender: TObject);
begin
  DML.DesAsignar;
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

end.
