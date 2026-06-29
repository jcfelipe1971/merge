unit UFMBusquedaNumSerie;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, StdCtrls, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UEditPanel, ToolWin, ComCtrls, ULFToolBar,
  ULFPanel, ULFEditFind2000, ULFLabel;

type
  TFMBusquedaNumSerie = class(TG2kForm)
     PMain: TLFPanel;
     LBLNumSerie: TLFLabel;
     EFNumSerie: TLFEditFind2000;
     TBMain: TLFToolBar;
     HYMEPanel: THYMEditPanel;
     procedure EFNumSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMBusquedaNumSerie : TFMBusquedaNumSerie;

implementation

uses UDMMain, UFMain;

{$R *.DFM}

procedure TFMBusquedaNumSerie.EFNumSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
end;

procedure TFMBusquedaNumSerie.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  FMain.AddComponenteReturn(EFNumSerie);
end;

procedure TFMBusquedaNumSerie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(EFNumSerie);
end;

end.
