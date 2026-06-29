unit UFMLotesVentaKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, UDMLotesVentaKri, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMLotesVentaKri = class(TForm)
     ETitulo: TLFEdit;
     EArticulo: TLFEdit;
     PNLDisponibles: TLFPanel;
     PNLAsignados: TLFPanel;
     PNLCantidad: TLFPanel;
     LCantidad: TLFLabel;
     ECantidad: TLFEdit;
     DBGDisponibles: TDBGrid;
     DBGAsignados: TDBGrid;
     LDisponibles: TLFLabel;
     LAsignados: TLFLabel;
     PNLMain: TLFPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGDisponiblesDblClick(Sender: TObject);
     procedure DBGAsignadosDblClick(Sender: TObject);
  private
     { Private declarations }
     DML: TDMLotesVentaKri;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMLotesVentaKri : TFMLotesVentaKri;

implementation

uses UFMLotesDevKri;

{$R *.dfm}

procedure TFMLotesVentaKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DML.Free;
  Action := caFree;
end;

procedure TFMLotesVentaKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DML := TDMLotesVentaKri.Create(Self);
  ECantidad.Text := '0';
end;

procedure TFMLotesVentaKri.FormShow(Sender: TObject);
begin
  EArticulo.Text := DML.Articulo;
  ETitulo.Text := DML.Titulo;
end;

procedure TFMLotesVentaKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FML : TFMLotesVentaKri;
  FMLD : TFMLotesDevKri;
begin
  if (cant < 0) then
  begin
     FMLD := TFMLotesDevKri.Create(Self);
     FMLD.Muestra(emp, eje, can, ser, rig, lin, fec, art, alm, cli, cant, False, False);
     FMLD.Release;
  end
  else
  begin
     DML.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cli,
        cant, Esc, ForzarEntrada);
     if (DML.escandallo) then
     begin
        while (not DML.QEscandallo.EOF) do
        begin
           FML := TFMLotesVentaKri.Create(Self);
           FML.Muestra(emp, eje, can, ser, rig, lin, fec, DML.QEscandalloDETALLE.AsString,
              alm, cli, DML.QEscandalloCANTIDAD.AsInteger * cant,
              DML.escandallo, ForzarEntrada);
           FML.Free;
           DML.QEscandallo.Next;
        end;
     end;
     if (DML.SinAsignar <> 0) or (ForzarEntrada) then
     begin
        ECantidad.Text := IntToStr(DML.SinAsignar);
        if (DML.Loteado) then
        begin
           DBGDisponibles.DataSource := DML.DSQLotesDisponibles;
           DBGAsignados.DataSource := DML.DSQLotesAsignados;
           ShowModal;
        end;
     end;
  end;
end;

procedure TFMLotesVentaKri.DBGDisponiblesDblClick(Sender: TObject);
begin
  DML.Asignar(StrToIntDef(ECantidad.Text, 0));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

procedure TFMLotesVentaKri.DBGAsignadosDblClick(Sender: TObject);
begin
  DML.DesAsignar;
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ECantidad.SetFocus;
end;

end.
