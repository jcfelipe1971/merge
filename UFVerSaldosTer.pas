unit UFVerSaldosTer;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, UHYDBGrid, StdCtrls, Mask, DBCtrls, UFormGest,
  NsDBGrid, ULFDBEdit, ULFToolBar, ExtCtrls, ULFPanel, ULFLabel;

type
  TFVerSaldosTer = class(TG2KForm)
     TBMain: TLFToolBar;
     DBGMain: THYTDBGrid;
     TButtSalir: TToolButton;
     ToolButton1: TToolButton;
     LFPanel1: TLFPanel;
     LBLPeriodo: TLFLabel;
     DBLCBPeriodo: TDBLookupComboBox;
     DBEPer_Tit: TLFDbedit;
     DBEPer_desde: TLFDbedit;
     DBEPer_hasta: TLFDbedit;
     procedure TButtSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FVerSaldosTer : TFVerSaldosTer;

implementation

uses UDMTercerosCuentas, UDMMain;

{$R *.DFM}

procedure TFVerSaldosTer.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFVerSaldosTer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFVerSaldosTer.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE 

  DBLCBPeriodo.KeyValue := '20';
end;

end.
