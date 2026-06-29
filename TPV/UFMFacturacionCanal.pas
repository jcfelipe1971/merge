unit UFMFacturacionCanal;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, ActnList, StdCtrls,
  DBCtrls, Mask, UHYEdits, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxPlacemnt, ULFFormStorage, ULFActionList, NsDBGrid, ULFPageControl,
  ULFToolBar, ULFPanel, ULFDBEditFind2000, ULFDBEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, UG2kTBLoc;

type
  TFMFacturacionCanal = class(TFPEdit)
     LCanal: TLabel;
     DBCBResto: TLFDBCheckBox;
     DBETituloCanal: TLFDbedit;
     LPorcentaje: TLabel;
     LFCategoryAction1: TLFCategoryAction;
     LBPorcen: TLabel;
     LFEFCanal: TLFDBEditFind2000;
     LFDBPorcentaje: TLFDbedit;
     LCaja: TLabel;
     LFEFCajas: TLFDBEditFind2000;
     DBTituloCaja: TLFDbedit;
     LFDBImporte: TLFDbedit;
     LIMporte: TLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMFacturacionCanal : TFMFacturacionCanal;

implementation

uses UDMFacturacionCanal, UFormGest, UDMMain, UFMain;

{$R *.DFM}

procedure TFMFacturacionCanal.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMFacturacionCanal, DMFacturacionCanal);
  NavMain.DataSource := DMFacturacionCanal.DSQMCanales;
  DBGMain.DataSource := DMFacturacionCanal.DSQMCanales;
end;

procedure TFMFacturacionCanal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFacturacionCanal);
  Action := caFree;
end;

procedure TFMFacturacionCanal.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMFacturacionCanal.BusquedaCompleja;
end;

end.
