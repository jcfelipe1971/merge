unit UFMLotesMOEKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls, UDMLotesMOEKri, ULFEdit,
  ULFLabel, ULFPanel, Mask, rxToolEdit, ULFDateEdit;

type
  TFMLotesMOEKri = class(TForm)
     Panel1: TLFPanel;
     Panel2: TLFPanel;
     Panel3: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     Label1: TLFLabel;
     ELote: TLFEdit;
     BOK: TButton;
     DTPCaducidad: TLFDateEdit;
     DBGrid1: TDBGrid;
     ECantidad: TLFEdit;
     LCantidad: TLFLabel;
     LCaducidad: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure BOKClick(Sender: TObject);
     procedure DBGrid1DblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     DML: TDMLotesMOEKri;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMLotesMOEKri : TFMLotesMOEKri;

implementation

{$R *.dfm}

procedure TFMLotesMOEKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DML := TDMLotesMOEKri.Create(Self);
  ECantidad.Text := '0';
  //   EAsignados.Text := '0';
end;

procedure TFMLotesMOEKri.BOKClick(Sender: TObject);
begin
  DML.InsertaLote(ELote.Text, DTPCaducidad.Date, StrToIntDef(ECantidad.Text, 0));
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ELote.Text := '';
  ELote.SetFocus;
end;

procedure TFMLotesMOEKri.DBGrid1DblClick(Sender: TObject);
begin
  DML.BorraLote;
  ECantidad.Text := IntToStr(DML.SinAsignar);
  ELote.SetFocus;
end;

procedure TFMLotesMOEKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FML : TFMLotesMOEKri;
begin
  DML.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cant, Esc, ForzarEntrada);
  if (DML.SinAsignar <> 0) then
  begin
     if (DML.escandallo) then
     begin
        while (not DML.QEscandallo.EOF) do
        begin
           FML := TFMLotesMOEKri.Create(Self);
           FML.Muestra(emp, eje, can, ser, rig, lin, fec, DML.QEscandalloDETALLE.AsString,
              alm, DML.QEscandalloCANTIDAD.AsInteger * cant, DML.escandallo, ForzarEntrada);
           FML.Free;
           DML.QEscandallo.Next;
        end;
     end;
     ECantidad.Text := IntToStr(DML.SinAsignar);
     if (DML.Loteado) then
     begin
        ECantidad.Text := IntToStr(DML.SinAsignar);
        EArticulo.Text := Art;
        ETitulo.Text := DML.xArticuloTITULO.AsString;
        DBGrid1.DataSource := DML.DSAsignado;
        ShowModal;
     end;
  end;
end;

procedure TFMLotesMOEKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DML.Free;
  Action := caFree;
end;

end.
