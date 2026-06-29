unit UFMSelecAlmacenCantidad;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, ULFEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel;

type
  TFMSelecAlmacenCantidad = class(TFPEditSinNavegador)
     LAlmacenOri: TLFLabel;
     LCantidad: TLFLabel;
     EFAlmacenOri: TLFEditFind2000;
     ETituloAlmacenOri: TLFEdit;
     ECantidad: TLFEdit;
     ToolButton1: TToolButton;
     TBOk: TToolButton;
     LAlmacenDst: TLFLabel;
     EFAlmacenDst: TLFEditFind2000;
     ETituloAlmacenDst: TLFEdit;
     procedure EFAlmacenOriChange(Sender: TObject);
     procedure TBOkClick(Sender: TObject);
     procedure EFAlmacenDstChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSelecAlmacenCantidad : TFMSelecAlmacenCantidad;

function DameAlmacenCantidad(var AlmacenOri, AlmacenDst: string; var Cantidad: double): boolean;

implementation

uses UDMMain, UEntorno, UFormGest, UDameDato;

{$R *.dfm}

function DameAlmacenCantidad(var AlmacenOri, AlmacenDst: string; var Cantidad: double): boolean;
begin
  AbreForm(TFMSelecAlmacenCantidad, FMSelecAlmacenCantidad);
  try
     with FMSelecAlmacenCantidad do
     begin
        EFAlmacenOri.Text := AlmacenOri;
        EFAlmacenDst.Text := AlmacenDst;
        ECantidad.Text := FloatToStr(Cantidad);
        Hide;
        ShowModal;
        if (ModalResult = mrOk) then
        begin
           Result := True;
           AlmacenOri := EFAlmacenOri.Text;
           AlmacenDst := EFAlmacendst.Text;
           Cantidad := StrToFloat(ECantidad.Text);
        end
        else
           Result := False;
     end;
  finally
     CierraForm(FMSelecAlmacenCantidad);
  end;
end;

procedure TFMSelecAlmacenCantidad.EFAlmacenOriChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenOri.Text := DameTituloAlmacen(EFAlmacenOri.Text);
end;

procedure TFMSelecAlmacenCantidad.EFAlmacenDstChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenDst.Text := DameTituloAlmacen(EFAlmacenDst.Text);
end;

procedure TFMSelecAlmacenCantidad.TBOkClick(Sender: TObject);
var
  dummy : double;
begin
  inherited;
  // Transformo para ver si da error (contiene algo no numerico)
  dummy := StrToFloat(ECantidad.Text);

  ModalResult := mrOk;
end;

procedure TFMSelecAlmacenCantidad.FormShow(Sender: TObject);
begin
  inherited;
  if (Trim(EFAlmacenOri.Text) = '') then
     EFAlmacenOri.SetFocus;
  if (Trim(EFAlmacenDst.Text) = '') then
     EFAlmacenDst.SetFocus;
end;

end.
