unit UFMObtenerCampanya;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Buttons, ULFEditFind2000, ULFEdit, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ExtCtrls;

type
  TFMObtenerCampanya = class(TG2KForm)
     LCampanya: TLFLabel;
     CBForzar: TLFCheckBox;
     BOk: TBitBtn;
     BCancelar: TBitBtn;
     ECampanya: TLFEdit;
     EFCampanya: TLFEditFind2000;
     PNLMain: TPanel;
     procedure EFCampanyaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Pedir(var Campanya: integer; var ForzarCampanya: boolean);
  end;

var
  FMObtenerCampanya : TFMObtenerCampanya;

implementation

uses UDMMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMObtenerCampanya.Pedir(var Campanya: integer; var ForzarCampanya: boolean);
begin
  ShowModal;

  if (ModalResult = mrOk) then
  begin
     Campanya := StrToIntDef(EFCampanya.Text, -1);
     ForzarCampanya := CBForzar.Checked;
  end
  else
  begin
     Campanya := -1;
     ForzarCampanya := False;
  end;
end;

procedure TFMObtenerCampanya.EFCampanyaChange(Sender: TObject);
begin
  ECampanya.Text := DameTituloCampanya(StrToIntDef(EFCampanya.Text, -1));
end;

procedure TFMObtenerCampanya.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BOk, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BCancelar, 1, DMMain.ILMain_Ac, 0);
end;

end.
