unit UProFPGrafico;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ULFActionList, rxPlacemnt, ULFFormStorage, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, TeeProcs, TeEngine, Chart,
  DbChart;

type
  TProFPGrafico = class(TForm)
     DBMainChart: TDBChart;
     PNLGrafico: TLFPanel;
     TBActions: TLFToolBar;
     ALMain: TLFActionList;
     FSMain: TLFFibFormStorage;
     LFCatActionZoom: TLFCategoryAction;
     AZoomMas: TAction;
     AZoomMenos: TAction;
     LFCatActionOpciones: TLFCategoryAction;
     ACopiar: TAction;
     AZoomReestablecer: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AZoomMasExecute(Sender: TObject);
     procedure AZoomMenosExecute(Sender: TObject);
     procedure ACopiarExecute(Sender: TObject);
     procedure AZoomReestablecerExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFPGrafico : TProFPGrafico;

implementation

uses UDMMain;

{$R *.dfm}

procedure TProFPGrafico.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  DBMainChart.AnimatedZoom := True;
end;

procedure TProFPGrafico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProFPGrafico.AZoomMasExecute(Sender: TObject);
begin
  DBMainChart.ZoomPercent(110);
end;

procedure TProFPGrafico.AZoomMenosExecute(Sender: TObject);
begin
  DBMainChart.ZoomPercent(90);
end;

procedure TProFPGrafico.ACopiarExecute(Sender: TObject);
begin
  DBMainChart.CopyToClipboardMetafile(True);
end;

procedure TProFPGrafico.AZoomReestablecerExecute(Sender: TObject);
begin
  DBMainChart.UndoZoom;
end;

end.
