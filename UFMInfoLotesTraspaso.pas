unit UFMInfoLotesTraspaso;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UNavigator, Menus, UTeclas,
  UControlEdit, UFormGest, rxPlacemnt, ULFFormStorage;

type
  TFMInfoLotesTraspaso = class(TG2kForm)
     PNInfoLotes: TLFPanel;
     DBGInfoLotes: TFIBHYGGridFind;
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     FSMain: TLFFibFormStorage;
     procedure DBGInfoLotesDblClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMInfoLotesTraspaso : TFMInfoLotesTraspaso;

implementation

uses UDMMain, UDMConfigTraspasoLotes;

{$R *.dfm}

procedure TFMInfoLotesTraspaso.DBGInfoLotesDblClick(Sender: TObject);
begin
  DMConfigTraspasoLotes.InsertaRegistro;
  Close;
end;

procedure TFMInfoLotesTraspaso.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  ControlEdit := CEMain;
end;

procedure TFMInfoLotesTraspaso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
