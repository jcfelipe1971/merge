unit UFPregAnticipo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, StdCtrls, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEdit, ULFPanel, ULFLabel;

type
  TFPregAnticipo = class(TG2KForm)
     PNMain: TLFPanel;
     LBLPVP: TLFLabel;
     LMoneda: TLFLabel;
     EAnticipo: TLFEdit;
     LImporteMaximo: TLFLabel;
     BOk: TButton;
     BCancelar: TButton;
     procedure EAnticipoKeyPress(Sender: TObject; var Key: char);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
     { Private declarations }
     ImporteMaximo: double;
  public
     { Public declarations }
     function Mostrar(var Anticipo: double; Moneda: string; aImporteMaximo: double = 0): boolean;
  end;

var
  FPregAnticipo : TFPregAnticipo;

implementation

uses UFMain, UDMMain, UUtiles;

{$R *.DFM}

procedure TFPregAnticipo.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE   
  FMain.AddComponenteReturn(EAnticipo);
end;

procedure TFPregAnticipo.EAnticipoKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, '-', {ThousandSeparator,} DecimalSeparator, #13, #27]) then
     Key := #0;
  if (Key = #13) then
     ModalResult := mrOk;
  if {((key = #13) or} (key = #27){)} then
     Close;
end;

function TFPregAnticipo.Mostrar(var Anticipo: double; Moneda: string; aImporteMaximo: double = 0): boolean;
begin
  LMoneda.Caption := Moneda;
  ImporteMaximo := aImporteMaximo;
  EAnticipo.Text := FormatFloat(DMMain.MascaraMoneda(Moneda, 1), Anticipo);
  LImporteMaximo.Caption := Format(_('Importe Maximo: %s'), [FormatFloat(DMMain.MascaraMoneda(Moneda, 1), ImporteMaximo)]);

  if (ShowModal = mrOk) then
  begin
     Anticipo := StrToFloatDef(EAnticipo.Text, 0);
     if ((ImporteMaximo > 0) and (Anticipo >= ImporteMaximo)) then
        Anticipo := ImporteMaximo;
     Result := True;
  end
  else
  begin
     Anticipo := -1;
     Result := False;
  end;
end;

procedure TFPregAnticipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(EAnticipo);
end;

procedure TFPregAnticipo.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  Anticipo : double;
begin
  if (ModalResult = mrOk) then
  begin
     Anticipo := StrToFloatDef(EAnticipo.Text, -1);
     if (Anticipo < 0) then
        CanClose := False
     else
     if ((ImporteMaximo > 0) and ((Anticipo - ImporteMaximo) > 0.001)) then
        CanClose := False;
  end;
end;

end.
