unit UFMGestionTareasProduccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UNavigator, StdCtrls,
  ULFComboBox, ULFLabel, Mask, DBCtrls, ULFDBEdit;

type
  TFMGestionTareasProduccion = class(TFPEditSinNavegador)
     PNLTareas: TLFPanel;
     PNLResto: TLFPanel;
     PNLFase: TLFPanel;
     PNLMaterial: TLFPanel;
     PNLMarcajes: TLFPanel;
     PNLInformacion: TLFPanel;
     PNLFiltro: TLFPanel;
     PNLCabTarea: TLFPanel;
     LTarea: TLFLabel;
     CBEstado: TLFComboBox;
     LEstado: TLFLabel;
     NavTarea: THYMNavigator;
     DBGTareas: TDBGridFind2000;
     LFase: TLFLabel;
     LMaterial: TLFLabel;
     LMarcajers: TLFLabel;
     LFaseLinea: TLFLabel;
     LFaseFase: TLFLabel;
     LFaseEstado: TLFLabel;
     DBEFaseLinea: TLFDbedit;
     DBEFaseFase: TLFDbedit;
     DBEFaseEstado: TLFDbedit;
     LMaterialLinea: TLFLabel;
     LMaterialTipoPieza: TLFLabel;
     LMaterialEstado: TLFLabel;
     DBEMaterialLinea: TLFDbedit;
     DBEMaterialTipoPieza: TLFDbedit;
     DBEMaterialEstado: TLFDbedit;
     DBGridFind20001: TDBGridFind2000;
     LOrdenCompuesto: TLFLabel;
     LOrdenEscandallo: TLFLabel;
     LOrdenEstado: TLFLabel;
     DBEOrdenCompuesto: TLFDbedit;
     DBEOrdenEscandallo: TLFDbedit;
     DBEOrdenEstado: TLFDbedit;
     Splitter1: TSplitter;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGestionTareasProduccion : TFMGestionTareasProduccion;

implementation

uses UFormGest, UDMGestionTareasProduccion;

{$R *.dfm}

procedure TFMGestionTareasProduccion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGestionTareasProduccion, DMGestionTareasProduccion);
end;

procedure TFMGestionTareasProduccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGestionTareasProduccion);
end;

end.
