unit UFMostrarImagen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls,
  Buttons, ActnList, jpeg, GIFImage, DB, ULFCheckBox, ULFToolBar, ULFPanel,
  TFlatCheckBoxUnit, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel;

type
  TFMostrarImagen = class(TFPEditSinNavegador)
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     TButSep1: TToolButton;
     ChkBMantenerAspecto: TLFCheckBox;
     ChkBAlign: TLFCheckBox;
     procedure ChkBMantenerAspectoClick(Sender: TObject);
     procedure ChkBAlignClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMostrarImagen : TFMostrarImagen;

procedure MuestraImagen(aImagen: integer);

implementation

uses UDMMain, UFMain, UImagenes;

{$R *.dfm}

procedure MuestraImagen(aImagen: integer);
begin
  AbreForm(TFMostrarImagen, FMostrarImagen, FMain);
  with FMostrarImagen do
  begin
     Hide;
     RefrescarImagen(Imagen, aImagen);
     ShowModal;
  end;
end;

procedure TFMostrarImagen.ChkBMantenerAspectoClick(Sender: TObject);
begin
  Imagen.Proportional := ChkBMantenerAspecto.Checked;
end;

procedure TFMostrarImagen.ChkBAlignClick(Sender: TObject);
begin
  if ChkBAlign.Checked then
     Imagen.Align := alClient
  else
     Imagen.Align := alNone;
end;

end.
