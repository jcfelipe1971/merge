unit UObrFMPartidasPlantilla;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, StdCtrls, Mask, DBCtrls, ULFDBEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFLabel, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel,
  UNavigator, ToolWin, ExtCtrls, ULFPanel, ULFDBMemo;

type
  TObrFMPartidasPlantilla = class(TFPEditDetalle)
     LPartida: TLFLabel;
     LCantidad: TLFLabel;
     LMedida1: TLFLabel;
     LMedida2: TLFLabel;
     LMedida3: TLFLabel;
     LPVenta: TLFLabel;
     LPCoste: TLFLabel;
     LTotalVenta: TLFLabel;
     LTotalCoste: TLFLabel;
     LMargenAbsoluto: TLFLabel;
     LMargenPorcentual: TLFLabel;
     DBChkBDefecto: TLFDBCheckBox;
     TSNotas: TTabSheet;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     DBEFPartida: TLFDBEditFind2000;
     DBECantidad: TLFDbedit;
     DBEMedida1: TLFDbedit;
     DBEMedida2: TLFDbedit;
     DBEMedida3: TLFDbedit;
     DBEPVenta: TLFDbedit;
     DBEPCoste: TLFDbedit;
     DBETotVenta: TLFDbedit;
     DBETotCoste: TLFDbedit;
     DBEMargenAbs: TLFDbedit;
     DBEMargenPor: TLFDbedit;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LFPanelNotas: TLFPanel;
     LFDBNotas: TLFDBMemo;
     LCodigo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ObrFMPartidasPlantilla : TObrFMPartidasPlantilla;

implementation

uses UFormGest, UObrDMPartidasPlantilla, UDMMain;

{$R *.dfm}

procedure TObrFMPartidasPlantilla.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TObrDMPartidasPlantilla, ObrDMPartidasPlantilla);

  NavMain.DataSource := ObrDMPartidasPlantilla.DSQMCabecera;
  DBGMain.DataSource := ObrDMPartidasPlantilla.DSQMCabecera;
end;

procedure TObrFMPartidasPlantilla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ObrDMPartidasPlantilla);
end;

procedure TObrFMPartidasPlantilla.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ObrDMPartidasPlantilla.BusquedaCompleja;
  Continua := False;
end;

end.
