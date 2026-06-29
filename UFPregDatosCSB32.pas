unit UFPregDatosCSB32;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UEditPanel, ComCtrls, ToolWin, StdCtrls, ULFEdit, ULFCheckBox,
  ULFPanel, ULFToolBar, TFlatCheckBoxUnit, ULFLabel, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit;

type
  TFPregDatosCsB32 = class(TFPEditSinNavegador)
     TButtConfirmar: TToolButton;
     LOrdenSoporte: TLFLabel;
     LIdentificacionCedente: TLFLabel;
     LSucursalReceptora: TLFLabel;
     CBFisicos: TLFCheckBox;
     ENumOrden: TLFEdit;
     ECedente: TLFEdit;
     EEntidad: TLFEdit;
     ESucursal: TLFEdit;
     CBRef: TLFCheckBox;
     CBDetalle: TLFCheckBox;
     procedure TButtConfirmarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DatosCsB32(var NumOrden, Cedente: string; var Fisicos: boolean; var EntidadRecepeptora, SucursalReceptora: string; var Referencia, Detalle: smallint): boolean;
  end;

var
  FPregDatosCsB32 : TFPregDatosCsB32;

implementation

{$R *.DFM}

procedure TFPregDatosCsB32.TButtConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TFPregDatosCsB32.DatosCsB32(var NumOrden, Cedente: string; var Fisicos: boolean; var EntidadRecepeptora, SucursalReceptora: string; var Referencia, Detalle: smallint): boolean;
begin
  Caption := _('Datos de la Norma');

  ENumOrden.Text := NumOrden;
  ECedente.Text := Cedente;
  CBFisicos.Checked := Fisicos;
  EEntidad.Text := EntidadRecepeptora;
  ESucursal.Text := SucursalReceptora;

  Result := False;
  if ShowModal = mrOk then
  begin
     NumOrden := ENumOrden.Text;
     Cedente := ECedente.Text;
     Fisicos := CBFisicos.Checked;
     EntidadRecepeptora := EEntidad.Text;
     SucursalReceptora := ESucursal.Text;

     if (CBRef.Checked) then
        Referencia := 1
     else
        Referencia := 0;

     if (CBDetalle.Checked) then
        Detalle := 0
     else
        Detalle := 1;

     Result := True;
  end;
end;

end.
