unit UFBarras;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, ULFLabel;

type
  TFBarras = class(TG2kForm)
     PNMain: TLFPanel;
     TBMain: TLFToolBar;
     TBAceptar: TToolButton;
     TBCancelar: TToolButton;
     RGBarras: TRadioGroup;
     LBInfo: TLFLabel;
     procedure TBAceptarClick(Sender: TObject);
     procedure TBCancelarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FBarras : TFBarras;
  Eleccion : smallint;

function CodBarras(Padre: TComponent): smallint;

implementation

{$R *.dfm}

function CodBarras(Padre: TComponent): smallint;
var
  Form : TFBarras;
begin
  Form := TFBarras.Create(Padre);
  try
     Eleccion := 0;
     Form.ShowModal;
     Result := Eleccion;
  finally
     Form.Free;
  end;
end;

procedure TFBarras.TBAceptarClick(Sender: TObject);
begin
  Eleccion := RGBarras.ItemIndex;
  Close;
end;

procedure TFBarras.TBCancelarClick(Sender: TObject);
begin
  Eleccion := 0;
  Close;
end;

end.
