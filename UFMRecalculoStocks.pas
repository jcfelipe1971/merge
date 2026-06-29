unit UFMRecalculoStocks;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ULFToolBar, ExtCtrls,
  TFlatCheckBoxUnit, ULFCheckBox, ActnList, ULFActionList, rxPlacemnt,
  ULFFormStorage, ULFPanel, UDMArticulos;

type
  TFMRecalculoStocks = class(TG2KForm)
     PNLMain: TLFPanel;
     TBOptions: TLFToolBar;
     CBTotal: TLFCheckBox;
     CBPedidos: TLFCheckBox;
     CBPonderado: TLFCheckBox;
     ALMain: TLFActionList;
     AProcesar: TAction;
     FSMain: TLFFibFormStorage;
     ASalir: TAction;
     CBLotes: TLFCheckBox;
     CBSerie: TLFCheckBox;
     procedure AProcesarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     DM: TDMArticulos;
  public
     { Public declarations }
     procedure SetDM(aDM: TDataModule);
  end;

var
  FMRecalculoStocks : TFMRecalculoStocks;

implementation

uses UDMMain;

{$R *.dfm}

procedure TFMRecalculoStocks.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TFMRecalculoStocks.AProcesarExecute(Sender: TObject);
var
  Option : byte;
begin
  inherited;

  Option := 0;
  if (CBTotal.Checked) then
     Option := Option + 1;
  if (CBPedidos.Checked) then
     Option := Option + 2;
  if (CBPonderado.Checked) then
     Option := Option + 4;
  if (CBLotes.Checked) then
     Option := Option + 8;
  if (CBSerie.Checked) then
     Option := Option + 16;

  if (Option <> 0) then
     if (Application.MessageBox(PChar(string(_('Atención : Este Proceso es costoso y puede tardar bastante.'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes) then
     begin
        DM.RecalculaStock(Option, True);
        ShowMessage(_('El Proceso terminó con éxito.'));
     end;
end;

procedure TFMRecalculoStocks.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMRecalculoStocks.SetDM(aDM: TDataModule);
begin
  DM := TDMArticulos(aDM);
end;

end.
