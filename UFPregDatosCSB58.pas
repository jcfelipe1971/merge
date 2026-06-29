unit UFPregDatosCSB58;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UEditPanel, ComCtrls, ToolWin, StdCtrls, UFormGest,
  ULFCheckBox, ULFEdit, ULFPanel, ULFToolBar, TFlatCheckBoxUnit, ULFLabel,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit;

type
  TFPregDatosCsB58 = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     LCodigoOrdenante: TLFLabel;
     LSucursalReceptora: TLFLabel;
     LAlfanumero: TLFLabel;
     ECodigo: TLFEdit;
     EEntidad: TLFEdit;
     ESucursal: TLFEdit;
     EAlfanumero: TLFEdit;
     CBSinDetalle: TLFCheckBox;
     CBRef: TLFCheckBox;
     procedure TButtConfirmarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DatosCsB58(var Codigo: string; var EntidadRecepeptora, SucursalReceptora, Alfanumero: string; var Referencia, Detalle: smallint): boolean;
  end;

var
  FPregDatosCsB58 : TFPregDatosCsB58;

implementation

{$R *.DFM}

procedure TFPregDatosCsB58.TButtConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFPregDatosCsB58.DatosCsB58(var Codigo: string; var EntidadRecepeptora, SucursalReceptora, Alfanumero: string; var Referencia, Detalle: smallint): boolean;
begin
  Caption := _('Datos de la Norma');

  ECodigo.Text := Codigo;
  EEntidad.Text := EntidadRecepeptora;
  ESucursal.Text := SucursalReceptora;
  EAlfanumero.Text := Alfanumero;

  Result := False;
  if ShowModal = mrOk then
  begin
     Codigo := ECodigo.Text;
     EntidadRecepeptora := EEntidad.Text;
     SucursalReceptora := ESucursal.Text;
     Alfanumero := EAlfanumero.Text;

     if (CBRef.Checked) then
        Referencia := 1
     else
        Referencia := 0;

     if (CBSinDetalle.Checked) then
        Detalle := 0
     else
        Detalle := 1;

     Result := True;
  end;
end;

end.
