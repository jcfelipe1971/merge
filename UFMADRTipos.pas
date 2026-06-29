unit UFMADRTipos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, DBCtrls, Mask, DbComboBoxValue, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc,
  UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFEdit;

type
  TFMADRTipos = class(TFPEdit)
     LCodigo: TLFLabel;
     LName: TLFLabel;
     LUNNumber: TLFLabel;
     LClase: TLFLabel;
     LPackingGroup: TLFLabel;
     LLabels: TLFLabel;
     LSpecialProvisions: TLFLabel;
     LLimitedQuantity: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEName: TLFDbedit;
     DBCBActivo: TLFDBCheckBox;
     DBELabels: TLFDbedit;
     DBESpecialProvisions: TLFDbedit;
     DBELimitedQuantity: TLFDbedit;
     DBEADRTankCode: TLFDbedit;
     DBEVehicle: TLFDbedit;
     LADRTankCode: TLFLabel;
     LVehicle: TLFLabel;
     LTransportCategory: TLFLabel;
     LDangerNumber: TLFLabel;
     LConsidEspEmbalado: TLFLabel;
     DBEConsidEspEmbalado: TLFDbedit;
     DBEDangerNumber: TLFDbedit;
     DBCBVTransportCategory: TDBComboBoxValue;
     DBECriterioSeleccion: TLFDbedit;
     LCriterioSeleccion: TLFLabel;
     DBEApartado: TLFDbedit;
     LApartado: TLFLabel;
     DBELetra: TLFDbedit;
     LLetra: TLFLabel;
     LNaturalezaPeligro: TLFLabel;
     LMedidasProteccion: TLFLabel;
     DBEFNaturPeligro: TLFDBEditFind2000;
     DBEFMedidasProtec: TLFDBEditFind2000;
     DescNaturPeligro: TLFHYDBDescription;
     DescMedidasProtec: TLFHYDBDescription;
     LClasification: TLFLabel;
     DBEClasification: TLFDbedit;
     LTunelCode: TLFLabel;
     DBETunelCode: TLFDbedit;
     LExceptedQuantity: TLFLabel;
     DBEExceptedQuantity: TLFDbedit;
     LPackingInstructions: TLFLabel;
     DBEPackingInstructions: TLFDbedit;
     LConsidEspEmbaladoComun: TLFLabel;
     DBEDBEConsidEspEmbaladoComun: TLFDbedit;
     LPortableTankInstructions: TLFLabel;
     DBEPortableTankInstructions: TLFDbedit;
     LPortableTankSpecialProvisions: TLFLabel;
     DBEPortableTankSpecialProvisions: TLFDbedit;
     LADRTankSpecialProvisions: TLFLabel;
     DBEADRTankSpecialProvisions: TLFDbedit;
     DBEFUNNumber: TLFDBEditFind2000;
     DBEFADRClass: TLFDBEditFind2000;
     DBEFADRPackingGroup: TLFDBEditFind2000;
     LBulkSpecialProvisions: TLFLabel;
     DBEBulkSpecialProvisions: TLFDbedit;
     LPackagesSpecialProvisions: TLFLabel;
     DBEPackagesSpecialProvisions: TLFDbedit;
     LLoadingSpecialProvisions: TLFLabel;
     DBELoadingSpecialProvisions: TLFDbedit;
     LOperationSpecialProvisions: TLFLabel;
     DBEOperationSpecialProvisions: TLFDbedit;
     ENameADRClass: TLFEdit;
     ENameADRPackingGroup: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFNaturPeligroChange(Sender: TObject);
     procedure DBEFMedidasProtecChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFADRClassChange(Sender: TObject);
     procedure DBEFADRPackingGroupChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMADRTipos : TFMADRTipos;

implementation

uses UDMADRTipos, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TFMADRTipos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMADRTipos, DMADRTipos);

  NavMain.DataSource := DMADRTipos.DSQMADRTipos;
  DBGMain.DataSource := DMADRTipos.DSQMADRTipos;
  G2KTableLoc.DataSource := DMADRTipos.DSQMADRTipos;

  // Color campo ID
  ColorCampoID(DBECodigo);
end;

procedure TFMADRTipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMADRTipos);
  Action := caFree;
end;

procedure TFMADRTipos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMADRTipos.BusquedaCompleja;
end;

procedure TFMADRTipos.DBEFNaturPeligroChange(Sender: TObject);
begin
  inherited;
  DescNaturPeligro.ActualizaDatos('COD_NATURALEZA_PELIGRO', DBEFNaturPeligro.Text);
end;

procedure TFMADRTipos.DBEFMedidasProtecChange(Sender: TObject);
begin
  inherited;
  DescMedidasProtec.ActualizaDatos('COD_MEDIDAS_PROTECCION', DBEFMedidasProtec.Text);
end;

procedure TFMADRTipos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMADRTipos.DBEFADRClassChange(Sender: TObject);
begin
  inherited;
  ENameADRClass.Text := DMADRTipos.DameTituloClase(DBEFADRClass.Text);
end;

procedure TFMADRTipos.DBEFADRPackingGroupChange(Sender: TObject);
begin
  inherited;
  ENameADRPackingGroup.Text := DMADRTipos.DameTituloPackingGroup(DBEFADRPackingGroup.Text);
end;

end.
