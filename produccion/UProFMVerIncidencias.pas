unit UProFMVerIncidencias;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, StdCtrls, rxPlacemnt, ULFToolBar,
  ULFMemo, ULFPanel, UFormGest;

type
  TProFMVerFicheroInc = class(TG2KForm)
     PanelMain: TLFPanel;
     ToolBar1: TLFToolBar;
     TBSalir: TToolButton;
     MemoInc: TLFMemo;
     TBGravar: TToolButton;
     ToolButton1: TToolButton;
     FormStorage: TFormStorage;
     procedure TBSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TBGravarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMVerFicheroInc : TProFMVerFicheroInc;

implementation

uses UDMMain, UProFMReloj;

{$R *.dfm}

procedure TProFMVerFicheroInc.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMVerFicheroInc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProFMVerFicheroInc.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  MemoInc.Lines.LoadFromFile(ProFMReloj.NombreFicheroIncidencias);
end;

procedure TProFMVerFicheroInc.TBGravarClick(Sender: TObject);
begin
  MemoInc.Lines.SaveToFile(ProFMReloj.NombreFicheroIncidencias);
end;

end.
