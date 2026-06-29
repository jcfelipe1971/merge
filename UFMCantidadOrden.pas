unit UFMCantidadOrden;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ULFEdit, ULFPanel, ULFLabel;

type
  TFMCantidadOrden = class(TForm)
     PNLMain: TLFPanel;
     LBLCantidad: TLFLabel;
     EDTCantidadProd: TLFEdit;
     procedure EDTCantidadProdKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCantidadOrden : TFMCantidadOrden;

implementation

uses UDMMain, UFMain;

{$R *.DFM}

procedure TFMCantidadOrden.EDTCantidadProdKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
end;

procedure TFMCantidadOrden.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  FMain.AddComponenteReturn(EDTCantidadProd);
end;

procedure TFMCantidadOrden.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.DelComponenteReturn(EDTCantidadProd);
end;

end.
