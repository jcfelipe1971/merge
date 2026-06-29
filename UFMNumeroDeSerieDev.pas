unit UFMNumeroDeSerieDev;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, UDMNumeroDeSerieDev, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMNumeroDeSerieDev = class(TForm)
     Panel2: TLFPanel;
     Panel1: TLFPanel;
     Panel3: TLFPanel;
     Panel4: TLFPanel;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label5: TLFLabel;
     LDevolucion: TLFLabel;
     Label6: TLFLabel;
     LCantidadAsignada: TLFLabel;
     BOK: TButton;
     Label1: TLFLabel;
     Label2: TLFLabel;
     DBGDevuelto: TDBGrid;
     DBGAsignado: TDBGrid;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     procedure DBGAsignadoDblClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure DBGDevueltoDblClick(Sender: TObject);
     procedure BOKClick(Sender: TObject);
  private
     { Private declarations }
     DMS: TDMNumeroDeSerieDev;
     procedure Refresca;
  public
     { Public declarations }
     procedure Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
  end;

var
  FMNumeroDeSerieDev : TFMNumeroDeSerieDev;

implementation

{$R *.dfm}

procedure TFMNumeroDeSerieDev.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  DMS := TDMNumeroDeSerieDev.Create(Self);
end;

procedure TFMNumeroDeSerieDev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMS.Free;
  Action := caFree;
end;

procedure TFMNumeroDeSerieDev.FormShow(Sender: TObject);
begin
  EArticulo.Text := DMS.Articulo;
  ETitulo.Text := DMS.Titulo;
end;

procedure TFMNumeroDeSerieDev.DBGAsignadoDblClick(Sender: TObject);
begin
  DMS.Devuelve;
  Refresca;
end;

procedure TFMNumeroDeSerieDev.DBGDevueltoDblClick(Sender: TObject);
begin
  DMS.DesDevuelve;
  Refresca;
end;

procedure TFMNumeroDeSerieDev.Muestra(emp: integer; eje: integer; can: integer; ser: string; rig: integer; lin: integer; fec: TDateTime; art: string; alm: string; cli: integer; cant: integer; esc: boolean; ForzarEntrada: boolean);
var
  FMS : TFMNumeroDeSerieDev;
begin
  DMS.Inicializa(emp, eje, can, ser, rig, lin, fec, art, alm, cli,
     cant, esc, ForzarEntrada);
  if (DMS.escandallo) then
  begin
     while (not DMS.QEscandallo.EOF) do
     begin
        FMS := TFMNumeroDeSerieDev.Create(Self);
        FMS.Muestra(emp, eje, can, ser, rig, lin, fec, DMS.QEscandalloDETALLE.AsString,
           alm, cli, DMS.QEscandalloCANTIDAD.AsInteger * cant, True, ForzarEntrada);
        FMS.Free;
        DMS.QEscandallo.Next;
     end;
  end;
  if ((DMS.Asignados <> 0) or (ForzarEntrada)) then
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

procedure TFMNumeroDeSerieDev.Refresca;
begin
  LDevolucion.Caption := IntToStr(DMS.Devolucion);
  LCantidadAsignada.Caption := IntToStr(DMS.Asignados);
  if (DMS.Asignados = 0) then
     BOK.Enabled := True
  else
     BOK.Enabled := False;
end;

procedure TFMNumeroDeSerieDev.BOKClick(Sender: TObject);
begin
  Close;
end;

end.
