unit UFMIvaCartera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, dbcgrids, ToolWin, ExtCtrls, Menus,
  ActnList, UControlEdit, UFormGest, ULFActionList, ULFPanel, ULFDBEdit,
  ULFDBCtrlGrid, ULFToolBar, ULFLabel;

type
  TFMIVACartera = class(TG2KForm)
     TBMain: TLFToolBar;
     DBCGMain: TLFDBCtrlGrid;
     DBEBase: TLFDbedit;
     PNLTitulo: TLFPanel;
     LBLBaseImponible: TLFLabel;
     DBE_P_Iva: TLFDbedit;
     LBLIVA: TLFLabel;
     DBE_P_Rec: TLFDbedit;
     LBLRec: TLFLabel;
     DBE_I_Iva: TLFDbedit;
     DBE_I_Rec: TLFDbedit;
     LBLImporteIVA: TLFLabel;
     LBLImporteRecargo: TLFLabel;
     DBE_T_Iva: TLFDbedit;
     LBLTipo: TLFLabel;
     TButtGrabar: TToolButton;
     ALIvaCartera: TLFActionList;
     ACerrar: TAction;
     AGrabar: TAction;
     procedure ACerrarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMIVACartera : TFMIVACartera;

implementation

uses UDMCartera, UDMMain;

{$R *.DFM}

procedure TFMIVACartera.ACerrarExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMIVACartera.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  ACerrar.ShortCut := DMMain.Teclas.FscCancel;
  AGrabar.ShortCut := DMMain.Teclas.FscPost;
end;

procedure TFMIVACartera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
