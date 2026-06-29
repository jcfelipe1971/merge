unit UFMCatTransporte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, DBCtrls, Mask, DbComboBoxValue, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc,
  UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMCatTransporte = class(TFPEdit)
     LblCodigo: TLFLabel;
     LblDescripcion: TLFLabel;
     LblNumUN: TLFLabel;
     LblClase: TLFLabel;
     LblPackingGroup: TLFLabel;
     LblEtiquetas: TLFLabel;
     LblProvisionesEsp: TLFLabel;
     LblCantLim: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     DBCBActivo: TLFDBCheckBox;
     DBENumUN: TLFDbedit;
     DBEClase: TLFDbedit;
     DBEPackingGroup: TLFDbedit;
     DBEEtiquetas: TLFDbedit;
     DBEProvisEsp: TLFDbedit;
     DBECantLim: TLFDbedit;
     DBEEnvasado: TLFDbedit;
     DBETanquePortatil: TLFDbedit;
     DBETanqueUN: TLFDbedit;
     DBEVehiculoTanque: TLFDbedit;
     LblEnvasado: TLFLabel;
     LblTanqueUNPort: TLFLabel;
     LblTanqueADR: TLFLabel;
     LblVehiculoTanque: TLFLabel;
     LblCatTransp: TLFLabel;
     LblIdentRiesgos: TLFLabel;
     LblConsidEsp: TLFLabel;
     DBEConsidEsp: TLFDbedit;
     DBEIdentRiesgos: TLFDbedit;
     DBCBVCatTransp: TDBComboBoxValue;
     DBECriterioSeleccion: TLFDbedit;
     LblCritSel: TLFLabel;
     DBEApartado: TLFDbedit;
     LblApartado: TLFLabel;
     DBELetra: TLFDbedit;
     LblLetra: TLFLabel;
     LblNaturPeligro: TLFLabel;
     LblMedidasProteccion: TLFLabel;
     DBEFNaturPeligro: TLFDBEditFind2000;
     DBEFMedidasProtec: TLFDBEditFind2000;
     DescNaturPeligro: TLFHYDBDescription;
     DescMedidasProtec: TLFHYDBDescription;
     LblCodClasif: TLFLabel;
     DBECodClasif: TLFDbedit;
     LCodigoRestriccionT: TLFLabel;
     DBERestricTunel: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFNaturPeligroChange(Sender: TObject);
     procedure DBEFMedidasProtecChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCatTransporte : TFMCatTransporte;

implementation

uses UDMCatTransporte, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMCatTransporte.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCatTransporte, DMCatTransporte);

  NavMain.DataSource := DMCatTransporte.DSQMCatTransporte;
  DBGMain.DataSource := DMCatTransporte.DSQMCatTransporte;
  G2KTableLoc.DataSource := DMCatTransporte.DSQMCatTransporte;
end;

procedure TFMCatTransporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCatTransporte);
  Action := caFree;
end;

procedure TFMCatTransporte.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCatTransporte.BusquedaCompleja;
end;

procedure TFMCatTransporte.DBEFNaturPeligroChange(Sender: TObject);
begin
  inherited;
  DescNaturPeligro.ActualizaDatos('COD_NATURALEZA_PELIGRO', DBEFNaturPeligro.Text);
end;

procedure TFMCatTransporte.DBEFMedidasProtecChange(Sender: TObject);
begin
  inherited;
  DescMedidasProtec.ActualizaDatos('COD_MEDIDAS_PROTECCION', DBEFMedidasProtec.Text);
end;

procedure TFMCatTransporte.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
