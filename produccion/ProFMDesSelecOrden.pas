unit ProFMDesSelecOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, ULFLabel, ComCtrls, ToolWin, ULFToolBar, ExtCtrls,
  ULFPanel, UFormGest;

type
  TProFMDesSelecOF = class(TG2KForm)
     LOrden: TLFLabel;
     LFEOrden: TLFEditFind2000;
     LHint: TLFLabel;
     PNLMain: TLFPanel;
     TBMain: TLFToolBar;
     TBSalir: TToolButton;
     TBGenerar: TToolButton;
     ToolButton3: TToolButton;
     procedure TBGenerarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMDesSelecOF : TProFMDesSelecOF;

implementation

uses UDMMain, UProDMDesDespiece;

{$R *.dfm}

procedure TProFMDesSelecOF.TBGenerarClick(Sender: TObject);
begin
  ProDMDesDespiece.CrearSubOrden(StrToIntDef(LFEOrden.Text, 0));
  Close;
end;

procedure TProFMDesSelecOF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProFMDesSelecOF.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
