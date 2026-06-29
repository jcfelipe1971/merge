unit UFMNumerosDeSerieMOSKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, UDMNumerosDeSerieMOSKri, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMNumerosDeSerieMOSKri = class(TForm)
     Panel1: TLFPanel;
     Panel2: TLFPanel;
     Panel3: TLFPanel;
     Panel4: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     BOK: TButton;
     LAsignados: TLFLabel;
     EAsignados: TLFEdit;
     LCantidad: TLFLabel;
     ECantidad: TLFEdit;
     DBGrid1: TDBGrid;
     DBGrid2: TDBGrid;
     procedure FormCreate(Sender: TObject);
     procedure DBGrid1DblClick(Sender: TObject);
     procedure DBGrid2DblClick(Sender: TObject);
     procedure BOKClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     DMS: TDMNumerosDeSerieMOSKri;
     procedure Refresca;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMNumerosDeSerieMOSKri : TFMNumerosDeSerieMOSKri;

implementation

{$R *.dfm}

procedure TFMNumerosDeSerieMOSKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FMS : TFMNumerosDeSerieMOSKri;
begin
  DMS.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cant, Esc, ForzarEntrada);
  if (DMS.SinAsignar <> 0) then
  begin
     if (DMS.escandallo) then
     begin
        while (not DMS.QEscandallo.EOF) do
        begin
           FMS := TFMNumerosDeSerieMOSKri.Create(Self);
           FMS.Muestra(emp, eje, can, ser, rig, lin, fec, DMS.QEscandalloDETALLE.AsString,
              alm, DMS.QEscandalloCANTIDAD.AsInteger * cant, esc, ForzarEntrada);
           FMS.Free;
           DMS.QEscandallo.Next;
        end;
     end;
     ECantidad.Text := IntToStr(DMS.SinAsignar);
     if (DMS.Serializado) then
     begin
        ECantidad.Text := IntToStr(cant);
        EArticulo.Text := Art;
        ETitulo.Text := DMS.xArticuloTITULO.AsString;
        DBGrid1.DataSource := DMS.DSDisponible;
        DBGrid2.DataSource := DMS.DSAsignado;
        ShowModal;
     end;
  end;
end;

procedure TFMNumerosDeSerieMOSKri.Refresca;
begin
  EAsignados.Text := IntToStr(DMS.Asignados);
  if DMS.Asignados = DMS.Cantidad then
     BOK.Enabled := True
  else
     BOK.Enabled := False;
end;

procedure TFMNumerosDeSerieMOSKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DMS := TDMNumerosDeSerieMOSKri.Create(Self);
  ECantidad.Text := '0';
  EAsignados.Text := '0';
end;

procedure TFMNumerosDeSerieMOSKri.DBGrid1DblClick(Sender: TObject);
begin
  DMS.AsignaNroSerie;
  Refresca;
end;

procedure TFMNumerosDeSerieMOSKri.DBGrid2DblClick(Sender: TObject);
begin
  DMS.SacaNroSerie;
  Refresca;
end;

procedure TFMNumerosDeSerieMOSKri.BOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFMNumerosDeSerieMOSKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMS.Free;
  Action := caFree;
end;

end.
