unit UFPregRangoCuentas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  StdCtrls, ULFLabel, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, Mask, UHYDescription, ULFHYDBDescription, ULFEdit;

type
  TFPregRangoCuentas = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtConfirmar: TToolButton;
     TButtSalir: TToolButton;
     LBLDesde: TLFLabel;
     EFDesde: TLFEditFind2000;
     LBLHasta: TLFLabel;
     EFHasta: TLFEditFind2000;
     EdTituloDesde: TLFEdit;
     EdTituloHasta: TLFEdit;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure EFDesdeChange(Sender: TObject);
     procedure EFHastaChange(Sender: TObject);
     procedure EFDesdeBusqueda(Sender: TObject);
     procedure EFDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFHastaBusqueda(Sender: TObject);
     procedure EFHastaExit(Sender: TObject);
     procedure EFDesdeExit(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Desde, Hasta: string;
     procedure HabilitarPunto;
     procedure DeshabilitarPunto;
  end;

var
  FPregRangoCuentas : TFPregRangoCuentas;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPlantillasImputacion, UUtiles, UFMain;

procedure TFPregRangoCuentas.TButtConfirmarClick(Sender: TObject);
begin
  Desde := EFDesde.Text;
  Hasta := EFHasta.Text;
  ModalResult := mrOk;
end;

procedure TFPregRangoCuentas.TButtSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFPregRangoCuentas.EFDesdeChange(Sender: TObject);
begin
  EdTituloDesde.Text := DMPlantillasImputacion.DameTituloCuenta(EFDesde.Text);
end;

procedure TFPregRangoCuentas.EFHastaChange(Sender: TObject);
begin
  EdTituloHasta.Text := DMPlantillasImputacion.DameTituloCuenta(EFHasta.Text);
end;

procedure TFPregRangoCuentas.EFDesdeBusqueda(Sender: TObject);
begin
  EFDesde.CondicionBusqueda := ' tipo=5 ';
end;

procedure TFPregRangoCuentas.EFDesdeKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFDesde);
end;

procedure TFPregRangoCuentas.HabilitarPunto;
begin
  FMain.AddComponentePunto(EFDesde);
  FMain.AddComponentePunto(EFHasta);
end;

procedure TFPregRangoCuentas.DeshabilitarPunto;
begin
  FMain.DelComponentePunto(EFDesde);
  FMain.DelComponentePunto(EFHasta);
end;

procedure TFPregRangoCuentas.EFHastaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFHasta);
end;

procedure TFPregRangoCuentas.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 
  HabilitarPunto;
end;

procedure TFPregRangoCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DeshabilitarPunto;
end;

procedure TFPregRangoCuentas.EFHastaBusqueda(Sender: TObject);
begin
  EFHasta.CondicionBusqueda := ' tipo=5 ';
end;

procedure TFPregRangoCuentas.EFHastaExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFHasta);
end;

procedure TFPregRangoCuentas.EFDesdeExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFDesde);
end;

end.
