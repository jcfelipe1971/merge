unit UFMMonedasMaestros;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UFormGest, ComCtrls, Mask, DBCtrls, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ToolWin, ULFToolBar,
  ULFComboBox, ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList, ActnList,
  rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel,
  UFPEditSinNavegador, Menus, UTeclas, UControlEdit, UEditPanel, ULFEdit;

type
  TFMMonedasMaestros = class(TFPEditSinNavegador)
     LMonedaOrigen: TLFLabel;
     LMonedaDestino: TLFLabel;
     LAgrupacion: TLFLabel;
     EFMonedaOrigen: TLFEditFind2000;
     EFMonedaDestino: TLFEditFind2000;
     EFAgrupacion: TLFEditFind2000;
     ETitMonedaOrigen: TLFEdit;
     ETitMonedaDestino: TLFEdit;
     ETitAgrupacion: TLFEdit;
     CBAgrupacion: TLFCheckBox;
     CBCanales: TLFCheckBox;
     CBEjercicios: TLFCheckBox;
     CBTodos: TLFCheckBox;
     CBBMaestros: TLFComboBox;
     LMaestro: TLFLabel;
     AProcesar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure EFMonedaOrigenChange(Sender: TObject);
     procedure EFMonedaDestinoChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBBMaestrosChange(Sender: TObject);
     procedure AProcesarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure RellenaValores;
  public
     { Public declarations }
  end;

var
  FMMonedasMaestros : TFMMonedasMaestros;

implementation

uses UDMMonedasMaestros, UDMMain, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMMonedasMaestros.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMonedasMaestros, DMMonedasMaestros);
  CBBMaestros.ItemIndex := 0;
  RellenaValores;
  CBBMaestrosChange(Sender);
end;

procedure TFMMonedasMaestros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMonedasMaestros);
end;

procedure TFMMonedasMaestros.EFMonedaOrigenChange(Sender: TObject);
begin
  ETitMonedaOrigen.Text := DameTituloMoneda(EFMonedaOrigen.Text);
end;

procedure TFMMonedasMaestros.EFMonedaDestinoChange(Sender: TObject);
begin
  ETitMonedaDestino.Text := DameTituloMoneda(EFMonedaDestino.Text);
end;

procedure TFMMonedasMaestros.EFAgrupacionChange(Sender: TObject);
begin
  ETitAgrupacion.Text := DameTituloAgrupacion('C', EFAgrupacion.Text);
end;

procedure TFMMonedasMaestros.RellenaValores;
begin
  EFMonedaOrigen.Text := REntorno.Moneda;
  EFMonedaDestino.Text := REntorno.Moneda;
  if (CBBMaestros.ItemIndex = 0) then
     EFAgrupacion.Text := DMMonedasMaestros.DameAgrupacionPrimeraCliente;
end;

procedure TFMMonedasMaestros.CBBMaestrosChange(Sender: TObject);
begin
  if (CBBMaestros.ItemIndex = 0) then
     EFAgrupacion.Text := DMMonedasMaestros.DameAgrupacionPrimeraCliente;
  CBAgrupacion.Visible := (CBBMaestros.ItemIndex = 0);
  CBAgrupacion.Checked := False;
end;

procedure TFMMonedasMaestros.AProcesarExecute(Sender: TObject);
var
  Maestro, Modo, I, H : integer;
begin
  if Confirma then
  begin
     Maestro := CBBMaestros.ItemIndex + 1;

     if Maestro = 1 then
     begin
        if CBAgrupacion.Checked then
           Maestro := 0
        else
           Maestro := 1;
     end;

     Modo := 0;
     if CBCanales.Checked then
        Modo := Modo + 1;
     if CBEjercicios.Checked then
        Modo := Modo + 2;

     if Maestro = 4 then
     begin
        for I := 1 to 3 do
        begin
           H := I;
           if H = 1 then
              if CBAgrupacion.Checked then
                 H := 0;

           if CBTodos.Checked then
              DMMonedasMaestros.CambiaMonedasTodos(Modo, H,
                 EFAgrupacion.Text, EFMonedaDestino.Text)
           else
              DMMonedasMaestros.CambiaMonedas(Modo, H, EFAgrupacion.Text,
                 EFMonedaOrigen.Text, EFMonedaDestino.Text);
        end;
     end
     else
     begin
        if CBTodos.Checked then
           DMMonedasMaestros.CambiaMonedasTodos(Modo, Maestro,
              EFAgrupacion.Text, EFMonedaDestino.Text)
        else
           DMMonedasMaestros.CambiaMonedas(Modo, Maestro, EFAgrupacion.Text,
              EFMonedaOrigen.Text, EFMonedaDestino.Text);
     end;

     ShowMessage(_('Proceso realizado con éxito'));
  end;
end;

end.
