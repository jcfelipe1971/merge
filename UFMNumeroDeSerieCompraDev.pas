unit UFMNumeroDeSerieCompraDev;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, UDMNumerosDeSerieKriCompraDev, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMNumeroDeSerieCompraDev = class(TForm)
     Panel1: TLFPanel;
     Label3: TLFLabel;
     Label4: TLFLabel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     Panel2: TLFPanel;
     Label5: TLFLabel;
     LDevolucion: TLFLabel;
     Label6: TLFLabel;
     LCantidadAsignada: TLFLabel;
     Label1: TLFLabel;
     Label2: TLFLabel;
     BOK: TButton;
     Panel4: TLFPanel;
     DBGAsignado: TDBGrid;
     Panel3: TLFPanel;
     DBGDevuelto: TDBGrid;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure BOKClick(Sender: TObject);
     procedure DBGAsignadoDblClick(Sender: TObject);
     procedure DBGDevueltoDblClick(Sender: TObject);
  private
     { Private declarations }
     DMS: TDMNumerosDeSerieKriCompraDev;
     procedure Refresca;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMNumeroDeSerieCompraDev : TFMNumeroDeSerieCompraDev;

implementation

uses UFormGest;

{$R *.dfm}

procedure TFMNumeroDeSerieCompraDev.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DMS := TDMNumerosDeSerieKriCompraDev.Create(Self);
end;

procedure TFMNumeroDeSerieCompraDev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMS.Free;
  Action := caFree;
end;

procedure TFMNumeroDeSerieCompraDev.FormShow(Sender: TObject);
begin
  EArticulo.Text := DMS.Articulo;
  ETitulo.Text := DMS.Titulo;
end;

procedure TFMNumeroDeSerieCompraDev.DBGAsignadoDblClick(Sender: TObject);
begin
  DMS.Devuelve;
  Refresca;
end;

procedure TFMNumeroDeSerieCompraDev.DBGDevueltoDblClick(Sender: TObject);
begin
  DMS.DesDevuelve;
  Refresca;
end;

procedure TFMNumeroDeSerieCompraDev.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; pro: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FMS : TFMNumeroDeSerieCompraDev;
begin
  DMS.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, pro,
     cant, esc, ForzarEntrada);
  if (DMS.escandallo) then
  begin
     while (not DMS.QEscandallo.EOF) do
     begin
        FMS := TFMNumeroDeSerieCompraDev.Create(Self);
        FMS.Muestra(emp, eje, can, ser, rig, lin, fec, DMS.QEscandalloDETALLE.AsString,
           alm, pro, DMS.QEscandalloCANTIDAD.AsInteger * cant, True, ForzarEntrada);
        FMS.Free;
        DMS.QEscandallo.Next;
     end;
  end;
  if (DMS.Asignados <> 0) then
  begin
     if (DMS.Serializado) then
     begin
        DBGDevuelto.DataSource := DMS.DSDevuelto;
        DBGAsignado.DataSource := DMS.DSAsignado;
        LDevolucion.Caption := IntToStr(DMS.Devolucion);
        LCantidadAsignada.Caption := IntToStr(DMS.Asignados);
        ShowModal;
     end;
  end;
end;

procedure TFMNumeroDeSerieCompraDev.Refresca;
begin
  LDevolucion.Caption := IntToStr(DMS.Devolucion);
  LCantidadAsignada.Caption := IntToStr(DMS.Asignados);
  if (DMS.Asignados = 0) then
     BOK.Enabled := True
  else
     BOK.Enabled := False;
end;

procedure TFMNumeroDeSerieCompraDev.BOKClick(Sender: TObject);
begin
  Close;
end;

end.
