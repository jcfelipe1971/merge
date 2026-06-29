unit UFModificaBultos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, ULFLabel, ULFEdit;

type
  TFModificaBultos = class(TG2kForm)
     PNMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtAceptar: TToolButton;
     TButtCancelar: TToolButton;
     LBBultos: TLFLabel;
     EBultos: TLFEdit;
     procedure TButtAceptarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
  private
     { Private declarations }
     procedure PonerDatos(Bultos: integer);
  public
     { Public declarations }
  end;

var
  Id_Doc : integer;
  FModificaBultos : TFModificaBultos;

procedure ModificaBultos(Id, Bultos: integer; Padre: TComponent);

implementation

{$R *.dfm}

procedure ModificaBultos(Id, Bultos: integer; Padre: TComponent);
var
  FModificaBultos : TFModificaBultos;
begin
  FModificaBultos := TFModificaBultos.Create(Padre);
  try
     Id_Doc := Id;
     FModificaBultos.PonerDatos(Bultos);
     FModificaBultos.ShowModal;
  finally
     FModificaBultos.Free;
  end;
end;

procedure TFModificaBultos.PonerDatos(Bultos: integer);
begin
  EBultos.Text := IntToStr(Bultos);
end;

procedure TFModificaBultos.TButtAceptarClick(Sender: TObject);
begin     {
  with P do
    begin
      Close ;
      SQL.Text := 'update ges_cabeceras_s set bultos=?bultos where id_s=?id_s';
      Params.ByName['BULTOS'].AsInteger := StrToIntDef(EBultos.Text,0);
      Params.ByName['ID_S'  ].AsInteger := Id_Doc ;
      ExecQuery ;
      QGen.FreeHandle ;
    end;   }
end;

procedure TFModificaBultos.TButtCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
