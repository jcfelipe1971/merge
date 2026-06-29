unit UFMCierreStocks;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UFormGest, StdCtrls, ComCtrls, ToolWin, ULFToolBar,
  ULFCheckBox, ULFPanel, TFlatCheckBoxUnit;

type
  TFMCierreStocks = class(TG2kForm)
     PNLMain: TLFPanel;
     CBCierre: TLFCheckBox;
     CBApertura: TLFCheckBox;
     ButtProcesar: TButton;
     TBMain: TLFToolBar;
     TBExit: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ButtProcesarClick(Sender: TObject);
     procedure TBExitClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCierreStocks : TFMCierreStocks;

implementation

uses UDMCierreStocks, UDMMain;

{$R *.dfm}

procedure TFMCierreStocks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCierreStocks);
  Action := caFree;
end;

procedure TFMCierreStocks.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMCierreStocks, DMCierreStocks);
end;

procedure TFMCierreStocks.ButtProcesarClick(Sender: TObject);
var
  modo : smallint;
begin
  modo := 0;
  if (CBCierre.Checked) then
     modo := modo + 1;
  if (CBApertura.Checked) then
     modo := modo + 2;

  if (modo <> 0) then
  begin
     DMCierreStocks.Procesa(modo);
     ShowMessage(_('Se ha realizado el proceso con éxito.'));
  end;
end;

procedure TFMCierreStocks.TBExitClick(Sender: TObject);
begin
  Close;
end;

end.
