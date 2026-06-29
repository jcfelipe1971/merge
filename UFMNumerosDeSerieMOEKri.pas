unit UFMNumerosDeSerieMOEKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMNumerosDeSerieMOEKri, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, ComCtrls, ExtCtrls, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMNumerosDeSerieMOEKri = class(TForm)
     Panel1: TLFPanel;
     Panel2: TLFPanel;
     Panel3: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     ENroSerie: TLFEdit;
     Label1: TLFLabel;
     BOK: TButton;
     DBGrid1: TDBGrid;
     LAsignados: TLFLabel;
     EAsignados: TLFEdit;
     LCantidad: TLFLabel;
     ECantidad: TLFEdit;
     procedure BOKClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure ENroSerieKeyPress(Sender: TObject; var Key: char);
     procedure DBGrid1DblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     DMS: TDMNumerosDeSerieMOEKri;
     procedure Refresca;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMNumerosDeSerieMOEKri : TFMNumerosDeSerieMOEKri;

implementation

{$R *.dfm}

procedure TFMNumerosDeSerieMOEKri.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FMS : TFMNumerosDeSerieMOEKri;
begin
  DMS.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cant, Esc, ForzarEntrada);
  if (DMS.SinAsignar <> 0) then
  begin
     if (DMS.escandallo) then
     begin
        while (not DMS.QEscandallo.EOF) do
        begin
           FMS := TFMNumerosDeSerieMOEKri.Create(Self);
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
        DBGrid1.DataSource := DMS.DSAsignado;
        ShowModal;
     end;
  end;
end;

procedure TFMNumerosDeSerieMOEKri.BOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFMNumerosDeSerieMOEKri.Refresca;
begin
  EAsignados.Text := IntToStr(DMS.Asignados);
  if DMS.Asignados = DMS.Cantidad then
     BOK.Enabled := True
  else
     BOK.Enabled := False;
end;

procedure TFMNumerosDeSerieMOEKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DMS := TDMNumerosDeSerieMOEKri.Create(Self);
  ECantidad.Text := '0';
  EAsignados.Text := '0';
end;

procedure TFMNumerosDeSerieMOEKri.ENroSerieKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then // presionó ENTER, tiene que grabar el número de serie
  begin
     DMS.InsertaNroSerie(ENroSerie.Text);
     Refresca;
  end;
end;

procedure TFMNumerosDeSerieMOEKri.DBGrid1DblClick(Sender: TObject);
begin
  DMS.BorraNroSerie;
  Refresca;
end;

procedure TFMNumerosDeSerieMOEKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMS.Free;
  Action := caFree;
end;

end.
