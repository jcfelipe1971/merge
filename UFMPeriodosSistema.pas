unit UFMPeriodosSistema;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, UHYDBGrid, StdCtrls, Mask, DBCtrls,
  UEditPanel, UNavigator, ExtCtrls, Menus, UTeclas, UControlEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, DbComboBoxValue, UFormGest,
  NsDBGrid, ULFDBEditFind2000, ULFDBEdit, ULFPanel, ULFPageControl,
  ULFToolBar, ULFLabel;

type
  TFMPeriodosSistema = class(TG2KForm)
     TBMain: TLFToolBar;
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     TSTabla: TTabSheet;
     DBGMain: THYTDBGrid;
     PEdit: TLFPanel;
     NavMain: THYMNavigator;
     TSepNav1: TToolButton;
     EPMain: THYMEditPanel;
     Label1: TLFLabel;
     DBEPeriodo: TLFDbedit;
     DBETitulo: TLFDbedit;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label5: TLFLabel;
     DBETituloDesde: TLFDbedit;
     DBETituloHasta: TLFDbedit;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     DBEFHasta: TLFDBEditFind2000;
     DBEFDesde: TLFDBEditFind2000;
     DBETipoPeriodo: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPeriodosSistema : TFMPeriodosSistema;

implementation

uses UDMPeriodosSistema, UEntorno, UDMMain;

{$R *.DFM}

procedure TFMPeriodosSistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPeriodosSistema);
  Action := caFree;
end;

procedure TFMPeriodosSistema.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  ControlEdit := CEMain;
  AbreData(TDMPeriodosSistema, DMPeriodosSistema);
end;

procedure TFMPeriodosSistema.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMPeriodosSistema.busquedacompleja;
  Continua := False;
end;

end.
