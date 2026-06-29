unit UFRegInventarioMovimientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ExtCtrls, UNavigator,
  Menus, UTeclas, UControlEdit, UFormGest, ULFToolBar, ULFPanel;

type
  TFRegInventarioMovimientos = class(TG2kForm)
     PNLMain: TLFPanel;
     TBMain: TLFToolBar;
     DBGMain: TDBGridFind2000;
     TButtCerrar: TToolButton;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     procedure TButtCerrarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure DBGMainDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FRegInventarioMovimientos : TFRegInventarioMovimientos;

implementation

uses UDMMain, UDMRegInventario;

{$R *.dfm}

procedure TFRegInventarioMovimientos.TButtCerrarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFRegInventarioMovimientos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  ControlEdit := CEMain;
end;

procedure TFRegInventarioMovimientos.DBGMainDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
