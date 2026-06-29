unit UFMFinanciaManualVtas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ToolWin, ComCtrls, ExtCtrls, UNavigator, Menus, UTeclas, UControlEdit,
  UEditPanel, NsDBGrid, ULFPanel, ULFToolBar;

type
  TFMFinanciaManualVtas = class(TG2KForm)
     TBMain: TLFToolBar;
     PNLMain: TLFPanel;
     DBGFMain: TDBGridFind2000;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     NavMain: THYMNavigator;
     EPMain: THYMEditPanel;
     TButtSep: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Serie, Tipo: string; rig: integer);
  end;

var
  FMFinanciaManualVtas : TFMFinanciaManualVtas;

implementation

uses UDMMain, UDMFinanciaManualVtas;

{$R *.DFM}

procedure TFMFinanciaManualVtas.Muestra(Serie, Tipo: string; rig: integer);
begin
  DMFinanciaManualVtas.FiltraQuery(Serie, Tipo, rig);
  ShowModal;
end;

procedure TFMFinanciaManualVtas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMFinanciaManualVtas, DMFinanciaManualVtas);
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
end;

procedure TFMFinanciaManualVtas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFinanciaManualVtas);
  action := caFree;
end;

procedure TFMFinanciaManualVtas.FormShow(Sender: TObject);
begin
  NavMain.SetFocus;
end;

end.
