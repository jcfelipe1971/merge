unit UFMNumerosDeSerieMovKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, UDMNumerosDeSerieMOVKri, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMNumerosDeSerieMovKri = class(TForm)
     Panel1: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     Panel2: TLFPanel;
     LAsignados: TLFLabel;
     LCantidad: TLFLabel;
     BOK: TButton;
     EAsignados: TLFEdit;
     ECantidad: TLFEdit;
     Panel3: TLFPanel;
     DBGrid1: TDBGrid;
     Panel4: TLFPanel;
     DBGrid2: TDBGrid;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGrid1DblClick(Sender: TObject);
     procedure DBGrid2DblClick(Sender: TObject);
     procedure BOKClick(Sender: TObject);
  private
     { Private declarations }
     DMS: TDMNumerosDeSerieMOVKri;
     procedure Refresca;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; canO, canD: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; almO, almD: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMNumerosDeSerieMovKri : TFMNumerosDeSerieMovKri;

implementation

uses UFormGest;

{$R *.DFM}

procedure TFMNumerosDeSerieMovKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMS.Free;
  Action := caFree;
end;

procedure TFMNumerosDeSerieMovKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DMS := TDMNumerosDeSerieMovKri.Create(Self);
  ECantidad.Text := '0';
  EAsignados.Text := '0';
end;

procedure TFMNumerosDeSerieMovKri.Muestra(emp: integer; eje: integer; canO, canD: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; almO, almD: string; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FMS : TFMNumerosDeSerieMovKri;
begin
  DMS.Inicializa(emp, eje, canO, canD, ser, rig, lin, fec, art, almO, almD,
     cant, Esc, ForzarEntrada);
  if (DMS.SinAsignar <> 0) then
  begin
     if (DMS.escandallo) then
     begin
        while (not DMS.QEscandallo.EOF) do
        begin
           FMS := TFMNumerosDeSerieMOVKri.Create(Self);
           FMS.Muestra(emp, eje, canO, canD, ser, rig, lin, fec,
              DMS.QEscandalloDETALLE.AsString, almO, almD,
              DMS.QEscandalloCANTIDAD.AsInteger *
              cant, esc, ForzarEntrada);
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

procedure TFMNumerosDeSerieMovKri.Refresca;
begin
  EAsignados.Text := IntToStr(DMS.Asignados);
  if DMS.Asignados = DMS.Cantidad then
     BOK.Enabled := True
  else
     BOK.Enabled := False;
end;

procedure TFMNumerosDeSerieMovKri.DBGrid1DblClick(Sender: TObject);
begin
  DMS.AsignaNroSerie;
  Refresca;
end;

procedure TFMNumerosDeSerieMovKri.DBGrid2DblClick(Sender: TObject);
begin
  DMS.SacaNroSerie;
  Refresca;
end;

procedure TFMNumerosDeSerieMovKri.BOKClick(Sender: TObject);
begin
  Close;
end;

end.
