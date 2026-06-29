unit UFCCambioDivisas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, UHYDBGrid, ToolWin,
  ComCtrls, UControlEdit, UFormGest, NsDBGrid, ULFDBEdit, ULFPanel,
  ULFToolBar, ULFLabel;

type
  TFCCambioDivisas = class(TG2KForm)
     TBMain: TLFToolBar;
     HYTDBGMain: THYTDBGrid;
     PNLMain: TLFPanel;
     LBLOrigen: TLFLabel;
     DBEOrigen: TLFDbedit;
     DBETOrigen: TLFDbedit;
     LBLDestino: TLFLabel;
     DBEDestino: TLFDbedit;
     DBETDestino: TLFDbedit;
     TButtSalir: TToolButton;
     ToolButton1: TToolButton;
     procedure TButtSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FCCambioDivisas : TFCCambioDivisas;

implementation

uses UDMCambioDivisas, UDMMain;

{$R *.DFM}

procedure TFCCambioDivisas.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFCCambioDivisas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
