unit UTFVerSaldosCon;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, UHYDBGrid, Mask, DBCtrls, ComCtrls,
  ToolWin, UNavigator, UControlEdit, UFormGest, NsDBGrid, ULFDBEdit,
  ULFPanel, ULFToolBar, ULFLabel;

type
  TFVerSaldosCon = class(TG2KForm)
     DBGMain: THYTDBGrid;
     TBMain: TLFToolBar;
     ToolButton1: TToolButton;
     TButtSalir: TToolButton;
     PTitulo: TLFPanel;
     Label1: TLFLabel;
     DBConsulta: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEFecha: TLFDbedit;
     DBESaldo: TLFDbedit;
     TButtImprime: TToolButton;
     TButtRefresca: TToolButton;
     NavMain: THYMNavigator;
     ToolButton2: TToolButton;
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtImprimeClick(Sender: TObject);
     procedure TButtRefrescaClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FVerSaldosCon : TFVerSaldosCon;

implementation

uses UDMSaldosCon, UDMMain;

{$R *.DFM}

procedure TFVerSaldosCon.TButtSalirClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFVerSaldosCon.TButtImprimeClick(Sender: TObject);
begin
  Self.Print;
end;

procedure TFVerSaldosCon.TButtRefrescaClick(Sender: TObject);
begin
  DMSaldosCon.VerSaldo;
end;

procedure TFVerSaldosCon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFVerSaldosCon.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE 

  NavMain.DataSource := DMSaldosCon.DSxSalida;
end;

end.
