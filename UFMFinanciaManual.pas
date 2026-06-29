unit UFMFinanciaManual;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ToolWin, ComCtrls, ExtCtrls, UNavigator, Menus, UTeclas, UControlEdit,
  UEditPanel, ULFToolBar, NsDBGrid, ULFPanel;

type
  TFMFinanciaManual = class(TG2KForm)
     PNLMain: TLFPanel;
     DBGFMain: TDBGridFind2000;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     EPMain: THYMEditPanel;
     TButtSep: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Serie, Tipo: string; rig: integer);
  end;

var
  FMFinanciaManual : TFMFinanciaManual;

implementation

uses UDMMain, UDMFinanciaManual;

{$R *.DFM}

procedure TFMFinanciaManual.Muestra(Serie, Tipo: string; rig: integer);
{var
  FMFinanciaManual : TFMFinanciaManual;}
begin
  // Filtro el Query
  DMFinanciaManual.FiltraQuery(Serie, Tipo, rig);
  ShowModal;
end;

procedure TFMFinanciaManual.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMFinanciaManual, DMFinanciaManual);
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
end;

procedure TFMFinanciaManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFinanciaManual);
  action := caFree;
end;

procedure TFMFinanciaManual.FormShow(Sender: TObject);
begin
  NavMain.SetFocus;
end;

end.
