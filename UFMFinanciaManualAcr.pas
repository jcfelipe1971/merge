unit UFMFinanciaManualAcr;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UTeclas, UControlEdit, UEditPanel, UNavigator, ToolWin, ComCtrls,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  UFormGest, ULFToolBar, NsDBGrid, ULFPanel;

type
  TFMFinanciaManualAcr = class(TG2KForm)
     PNLMain: TLFPanel;
     DBGFMain: TDBGridFind2000;
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     HYMEditPanel1: THYMEditPanel;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
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
  FMFinanciaManualAcr : TFMFinanciaManualAcr;

implementation

uses UDMMain, UDMFinanciaManualAcr;

{$R *.DFM}

procedure TFMFinanciaManualAcr.Muestra(Serie, Tipo: string; rig: integer);
begin
  // Filtro el Query
  DMFinanciaManualAcr.FiltraQuery(Serie, Tipo, rig);
  ShowModal;
end;

procedure TFMFinanciaManualAcr.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMFinanciaManualAcr, DMFinanciaManualAcr);
  ControlEdit := CEMain;
  OwnerDrawMenus(Self);
end;

procedure TFMFinanciaManualAcr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFinanciaManualAcr);
  Action := caFree;
end;

procedure TFMFinanciaManualAcr.FormShow(Sender: TObject);
begin
  NavMain.SetFocus;
end;

end.
