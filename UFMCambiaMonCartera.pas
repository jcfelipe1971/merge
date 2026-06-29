unit UFMCambiaMonCartera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UFormGest, ComCtrls, Mask, DBCtrls, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ToolWin, Spin, ULFToolBar,
  ULFComboBox, ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList, ActnList,
  rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  UFPEditSinNavegador, Menus, UTeclas, UControlEdit, UEditPanel, ULFEdit;

type
  TFMCambiaMonCartera = class(TFPEditSinNavegador)
     LMonedaOrigen: TLFLabel;
     LMonedaDestino: TLFLabel;
     LBLRegistrodesde: TLFLabel;
     EFMonedaOrigen: TLFEditFind2000;
     EFMonedaDestino: TLFEditFind2000;
     ETitMonedaOrigen: TLFEdit;
     ETitMonedaDestino: TLFEdit;
     CBCanales: TLFCheckBox;
     CBSigno: TLFComboBox;
     LBLSigno: TLFLabel;
     SERegistroDesde: TSpinEdit;
     LBLRegistroHasta: TLFLabel;
     SERegistroHasta: TSpinEdit;
     AProcesar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure EFMonedaOrigenChange(Sender: TObject);
     procedure EFMonedaDestinoChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBSignoChange(Sender: TObject);
     procedure AProcesarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure RellenaValores;
  public
     { Public declarations }
  end;

var
  FMCambiaMonCartera : TFMCambiaMonCartera;

implementation

uses UDMCambiaMonCartera, UDMMain, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMCambiaMonCartera.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCambiaMonCartera, DMCambiaMonCartera);
  CBSigno.ItemIndex := 0;
  RellenaValores;
end;

procedure TFMCambiaMonCartera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCambiaMonCartera);
end;

procedure TFMCambiaMonCartera.EFMonedaOrigenChange(Sender: TObject);
begin
  ETitMonedaOrigen.Text := DameTituloMoneda(EFMonedaOrigen.Text);
end;

procedure TFMCambiaMonCartera.EFMonedaDestinoChange(Sender: TObject);
begin
  ETitMonedaDestino.Text := DameTituloMoneda(EFMonedaDestino.Text);
end;

procedure TFMCambiaMonCartera.RellenaValores;
begin
  EFMonedaOrigen.Text := REntorno.Moneda;
  EFMonedaDestino.Text := REntorno.Moneda;

  SERegistroHasta.Value := DMCambiaMonCartera.DameMaximoRegistro(CBSigno.ItemIndex, CBCanales.Checked);
end;

procedure TFMCambiaMonCartera.CBSignoChange(Sender: TObject);
begin
  SERegistroHasta.Value := DMCambiaMonCartera.DameMaximoRegistro(CBSigno.ItemIndex, CBCanales.Checked);
end;

procedure TFMCambiaMonCartera.AProcesarExecute(Sender: TObject);
begin
  if Confirma then
  begin
     DMCambiaMonCartera.CambiaMonedas(CBSigno.ItemIndex, CBCanales.Checked, SERegistroDesde.Value,
        SERegistroHasta.Value, EFMonedaOrigen.Text, EFMonedaDestino.Text);

     ShowMessage(_('Proceso realizado con éxito'));
  end;
end;

end.
