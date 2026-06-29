unit UFMSeleccionarOfertaKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, TFlatCheckBoxUnit, ULFCheckBox, ULFPanel,
  ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  UFormGest, HYFIBQuery, ULFLabel;

type
  TFMSeleccionarOfertaKri = class(TG2KForm)
     LSerie: TLFLabel;
     LOferta: TLFLabel;
     EFSerie: TLFEditFind2000;
     EFOferta: TLFEditFind2000;
     ESerie: TLFEdit;
     PNLTop: TLFPanel;
     PNLMain: TLFPanel;
     CBMantenerPreciosYDescuentos: TLFCheckBox;
     EOferta: TLFEdit;
     BImportar: TButton;
     BCancelar: TButton;
     CBAgregarAlFinal: TLFCheckBox;
     procedure EFSerieChange(Sender: TObject);
     procedure EFOfertaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     id_s: integer;
  end;

var
  FMSeleccionarOfertaKri : TFMSeleccionarOfertaKri;

implementation

uses UDMOfertas, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMSeleccionarOfertaKri.EFSerieChange(Sender: TObject);
begin
  ESerie.Text := DameTituloSerie(EFSerie.Text);
  EFOferta.CondicionBusqueda := 'serie=''' + EFSerie.Text + '''';
end;

procedure TFMSeleccionarOfertaKri.EFOfertaChange(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  if (StrToIntDef(EFOferta.Text, 0) > 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_S,''(''||EJERCICIO||'') ''||SERIE||''/''||RIG||'' - ''||SU_REFERENCIA AS OFERTA FROM VER_CABECERAS_OFERTA_C WHERE ID_S=?ID_S';
        Params.ByName['ID_S'].AsInteger := StrToInt(EFOferta.Text);
        ExecQuery;
        EOFerta.Text := FieldByName['OFERTA'].AsString;
        id_s := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

end.
