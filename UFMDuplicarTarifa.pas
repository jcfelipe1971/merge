unit UFMDuplicarTarifa;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, UFormGest, Buttons,
  ULFEditFind2000, ULFEdit, ULFToolBar, ULFPanel, FIBDatabase,
  UFIBModificados, ULFLabel;

type
  TFMDuplicarTarifa = class(TG2KForm)
     PNLDuplicar: TLFPanel;
     TBMain: TLFToolBar;
     TBSalir: TToolButton;
     LblOrigen: TLFLabel;
     EDescOrigen: TLFEdit;
     LblDestino: TLFLabel;
     EFTarifaDestino: TLFEditFind2000;
     EDescDestino: TLFEdit;
     EFTarifaOrigen: TLFEdit;
     BDuplicar: TBitBtn;
     procedure TBSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTarifaDestinoChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure BDuplicarClick(Sender: TObject);
     procedure EFTarifaOrigenChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Inicializa(Origen: string);
  end;

var
  FMDuplicarTarifa : TFMDuplicarTarifa;

implementation

uses UDMMain, UDMDuplicarTarifa, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMDuplicarTarifa.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMDuplicarTarifa, DMDuplicarTarifa);

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(BDuplicar, 1, DMMain.ILMain_Ac, 37);
end;

procedure TFMDuplicarTarifa.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMDuplicarTarifa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMDuplicarTarifa);
  Action := caFree;
end;

procedure TFMDuplicarTarifa.EFTarifaDestinoChange(Sender: TObject);
begin
  EDescDestino.Text := DameTituloTarifa(EFTarifaDestino.Text);
end;

procedure TFMDuplicarTarifa.BDuplicarClick(Sender: TObject);
begin
  DMDuplicarTarifa.Duplicar(EFTarifaOrigen.Text, EFTarifaDestino.Text);
end;

procedure TFMDuplicarTarifa.Inicializa(Origen: string);
begin
  EFTarifaOrigen.Text := Origen;
end;

procedure TFMDuplicarTarifa.EFTarifaOrigenChange(Sender: TObject);
begin
  EDescOrigen.Text := DameTituloTarifa(EFTarifaOrigen.Text);
end;

end.
