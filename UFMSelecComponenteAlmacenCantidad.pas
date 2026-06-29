unit UFMSelecComponenteAlmacenCantidad;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, ULFEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel,
  DBCtrls;

type
  TFMSelecComponenteAlmacenCantidad = class(TFPEditSinNavegador)
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
     LComponente: TLFLabel;
     EFComponente: TLFEditFind2000;
     ETituloComponente: TLFEdit;
     RGTipoMovimiento: TRadioGroup;
     EComentario: TLFEdit;
     LComentario: TLFLabel;
     procedure EFAlmacenOriChange(Sender: TObject);
     procedure TBOkClick(Sender: TObject);
     procedure EFAlmacenDstChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFComponenteBusqueda(Sender: TObject);
     procedure EFComponenteChange(Sender: TObject);
  private
     { Private declarations }
     IdOrden: integer;
  public
     { Public declarations }
  end;

var
  FMSelecComponenteAlmacenCantidad : TFMSelecComponenteAlmacenCantidad;

function DameComponenteAlmacenTipoCantidad(aIdOrden: integer; var Componente, AlmacenOri, AlmacenDst, Tipo, Comentario: string; var Cantidad: double): boolean;

implementation

uses UDMMain, UEntorno, UDameDato, UFormGest;

{$R *.dfm}

function DameComponenteAlmacenTipoCantidad(aIdOrden: integer; var Componente, AlmacenOri, AlmacenDst, Tipo, Comentario: string; var Cantidad: double): boolean;
begin
  AbreForm(TFMSelecComponenteAlmacenCantidad, FMSelecComponenteAlmacenCantidad);
  try
     with FMSelecComponenteAlmacenCantidad do
     begin
        IdOrden := aIdOrden;
        RGTipoMovimiento.ItemIndex := 0;
        EFComponente.Text := Componente;
        EFAlmacenOri.Text := AlmacenOri;
        EFAlmacenDst.Text := AlmacenDst;
        ECantidad.Text := FloatToStr(Cantidad);
        EComentario.Text := Comentario;
        Hide;
        ShowModal;
        if (ModalResult = mrOk) then
        begin
           Result := True;
           Componente := EFComponente.Text;
           AlmacenOri := EFAlmacenOri.Text;
           AlmacenDst := EFAlmacendst.Text;
           Cantidad := StrToFloat(ECantidad.Text);
           Comentario := EComentario.Text;

           // Obtener el índice del elemento seleccionado en el TRadioGroup
           case RGTipoMovimiento.ItemIndex of
              0: Tipo := 'E';
              1: Tipo := 'S';
              2: Tipo := 'T';
           end;
        end
        else
           Result := False;
     end;
  finally
     CierraForm(FMSelecComponenteAlmacenCantidad);
  end;
end;

procedure TFMSelecComponenteAlmacenCantidad.EFAlmacenOriChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenOri.Text := DameTituloAlmacen(EFAlmacenOri.Text);
end;

procedure TFMSelecComponenteAlmacenCantidad.EFAlmacenDstChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenDst.Text := DameTituloAlmacen(EFAlmacenDst.Text);
end;

procedure TFMSelecComponenteAlmacenCantidad.TBOkClick(Sender: TObject);
var
  dummy : double;
begin
  inherited;
  // Transformo para ver si da error (contiene algo no numerico)
  dummy := StrToFloat(ECantidad.Text);

  ModalResult := mrOk;
end;

procedure TFMSelecComponenteAlmacenCantidad.FormShow(Sender: TObject);
begin
  inherited;
  if (Trim(EFComponente.Text) = '') then
     EFComponente.SetFocus;
end;

procedure TFMSelecComponenteAlmacenCantidad.EFComponenteBusqueda(Sender: TObject);
begin
  inherited;
  EFComponente.CondicionBusqueda := 'ID_ORDEN = ' + IntToStr(IdOrden);
end;

procedure TFMSelecComponenteAlmacenCantidad.EFComponenteChange(Sender: TObject);
begin
  inherited;
  ETituloComponente.Text := DameTituloArticulo(EFComponente.Text, REntorno.Empresa);
end;

end.
