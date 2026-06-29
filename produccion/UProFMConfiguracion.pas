unit UProFMConfiguracion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFLabel, ULFEdit, Mask, DBCtrls, ULFDBEdit,
  UDBDateTimePicker, ULFDBMemo, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TProFMConfiguracion = class(TG2KForm)
     TBConf: TLFToolBar;
     PCMain: TLFPanel;
     TBSalir: TToolButton;
     LFPCMain: TLFPageControl;
     TSGeneral: TTabSheet;
     LFPanelGen: TLFPanel;
     LFCBActQuim: TLFDBCheckBox;
     TSEscandallo: TTabSheet;
     LFPanelEscandallo: TLFPanel;
     LFCBGeneraOF: TLFDBCheckBox;
     LFCBModifCoste: TLFDBCheckBox;
     LFCBMateriales: TLFDBCheckBox;
     LFCBAutoCalc: TLFDBCheckBox;
     LFCBRecursos: TLFDBCheckBox;
     TSOP: TTabSheet;
     LFCBFiltroArtFasesOF: TLFDBCheckBox;
     LFCBTipoControl: TLFDBCheckBox;
     LFDensidad: TLFDBCheckBox;
     LFCBPorcent: TLFDBCheckBox;
     LFAlmEscandallo: TLFDBCheckBox;
     LFReservaStock: TLFDBCheckBox;
     TSGestion: TTabSheet;
     PNLGestion: TLFPanel;
     LFCBActivo: TLFDBCheckBox;
     LFCBOfertesAEscandall: TLFDBCheckBox;
     LFCBEscandallxDefecto: TLFDBCheckBox;
     LFCBFiltroEsc: TLFDBCheckBox;
     LFCBTraspasarMedidas: TLFDBCheckBox;
     LFCBOFPedProv: TLFDBCheckBox;
     LFUndPendCompras: TLFDBCheckBox;
     LFCBGestPed: TLFDBCheckBox;
     LFCBCerrarOFPed: TLFDBCheckBox;
     LFCBPreuV: TLFDBCheckBox;
     LFPrecioNoDto: TLFDBCheckBox;
     LFCBModifCompras: TLFDBCheckBox;
     TSMarcajes: TTabSheet;
     PNLMarcajes: TLFPanel;
     LFCBorrarComprasOF: TLFDBCheckBox;
     LFCBOfe_defecto: TLFDBCheckBox;
     TSContadores: TTabSheet;
     PNLContadores: TLFPanel;
     LContSer: TLFLabel;
     LFEContSer: TLFDbedit;
     TSTolyCor: TTabSheet;
     PNLTolyCor: TLFPanel;
     LFCBSeparaPed: TLFDBCheckBox;
     DBDEUltimaFecha: TLFDBDateEdit;
     DBMConnectionString: TLFDBMemo;
     LUtlimaFecha: TLFLabel;
     LConnectionString: TLFLabel;
     DBTPHora: TDBDateTimePicker;
     CEContadores: TControlEdit;
     CEContadoresPMEdit: TPopUpTeclas;
     DBCBMultimarcaje: TLFDBCheckBox;
     LFCBGenerarMovStock: TLFDBCheckBox;
     GRMovStock: TGroupBox;
     LFCBMovStockCompuesto: TLFDBCheckBox;
     LFCBMovStockComponente: TLFDBCheckBox;
     LFCBCrearLote: TLFDBCheckBox;
     NavMain: THYMNavigator;
     ToolButton1: TToolButton;
     CEConfig: TControlEdit;
     CEConfigPMEdit: TPopUpTeclas;
     LFLabel6: TLFLabel;
     DBLKTipo_Precio: TDBLookupComboBox;
     Importar: TDBRadioGroup;
     RGCaso: TDBRadioGroup;
     LFCerrarSubOP: TLFDBCheckBox;
     LFCompVirtual: TLFDBCheckBox;
     DBPrecioVenta: TDBRadioGroup;
     LFDBIntroCierre: TLFDBCheckBox;
     DBCBCreacionSeriesAutomatica: TLFDBCheckBox;
     LFDBCierreParcial: TLFDBCheckBox;
     DBCBUsarPrecioLote: TLFDBCheckBox;
     LFCBFabricadas: TLFDBCheckBox;
     LFCBOfe_Esc_Ofe: TLFDBCheckBox;
     LAlmEnt: TLFLabel;
     DBEAlmEnt: TLFDBEditFind2000;
     EAlmEnt: TLFEdit;
     EAlmLan: TLFEdit;
     DBEAlmLan: TLFDBEditFind2000;
     LAlmLan: TLFLabel;
     EAlmSal: TLFEdit;
     DBEAlmSal: TLFDBEditFind2000;
     LAlmSal: TLFLabel;
     LFDBCierreParcialMovStockComponente: TLFDBCheckBox;
     FSMain: TLFFibFormStorage;
     LAlmRet: TLFLabel;
     DBEAlmRet: TLFDBEditFind2000;
     EAlmRet: TLFEdit;
     LCantMinAlmRet: TLFLabel;
     DBECantMinAlmRet: TLFDbedit;
     EAlmRec: TLFEdit;
     DBEAlmRec: TLFDBEditFind2000;
     LAlmRec: TLFLabel;
     DBCBNoExcederUnidadesReservadas: TLFDBCheckBox;
     TSTrabExterno: TTabSheet;
     LAlmacenPreparacion: TLFLabel;
     DBEFAlmacenPreparacion: TLFDBEditFind2000;
     EAlmacenPreparacion: TLFEdit;
     LAlmacenTrabExterno: TLFLabel;
     DBEFAlmacenTrabExterno: TLFDBEditFind2000;
     EAlmacenTrabExterno: TLFEdit;
     LAlmacenEntrada: TLFLabel;
     DSBEAlmacenEntrada: TLFDBEditFind2000;
     EAlmacenEntrada: TLFEdit;
     procedure TBSalirClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFCBActQuimClick(Sender: TObject);
     procedure RGCasoClick(Sender: TObject);
     procedure LFReservaStockChange(Sender: TObject);
     procedure LFDBIntroCierreChange(Sender: TObject);
     procedure LFCBMovStockComponenteChange(Sender: TObject);
     procedure DBEAlmEntChange(Sender: TObject);
     procedure DBEAlmLanChange(Sender: TObject);
     procedure DBEAlmSalChange(Sender: TObject);
     procedure DBEAlmRetChange(Sender: TObject);
     procedure DBEAlmRecChange(Sender: TObject);
     procedure DBEFAlmacenPreparacionChange(Sender: TObject);
     procedure DBEFAlmacenTrabExternoChange(Sender: TObject);
     procedure DSBEAlmacenEntradaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMConfiguracion : TProFMConfiguracion;

implementation

uses UProDMConfiguracion, UDMMain, UEntorno, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMConfiguracion.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMConfiguracion.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMConfiguracion, ProDMConfiguracion);
  LFPCMain.ActivePage := TSGeneral;

  LFCBActQuimClick(Sender);
end;

procedure TProFMConfiguracion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ProDMConfiguracion);
end;

procedure TProFMConfiguracion.LFCBActQuimClick(Sender: TObject);
begin
  if (LFCBActQuim.State = cbchecked) then
  begin
     LFCBTipoControl.Enabled := True;
     LFCBFiltroArtFasesOF.Enabled := True;
     LFDensidad.Enabled := True;
     LFCBPorcent.Enabled := True;
  end
  else
  begin
     LFCBTipoControl.Enabled := False;
     LFCBFiltroArtFasesOF.Enabled := False;
     LFDensidad.Enabled := False;
     LFCBPorcent.Enabled := False;
  end;
end;

procedure TProFMConfiguracion.RGCasoClick(Sender: TObject);
begin
  if (RGCaso.ItemIndex = 0) then
     LFCerrarSubOP.Enabled := True
  else
     LFCerrarSubOP.Enabled := False;

  if (RGCaso.ItemIndex = 2) then
     LFCompVirtual.Enabled := True
  else
     LFCompVirtual.Enabled := False;
end;

procedure TProFMConfiguracion.LFReservaStockChange(Sender: TObject);
begin
  if (LFDBIntroCierre.Checked) then
  begin
     LFReservaStock.Checked := False;
     ProDMConfiguracion.QMConfiguracionRESERVA_STOCK_OP.AsInteger := 0;
  end;
end;

procedure TProFMConfiguracion.LFDBIntroCierreChange(Sender: TObject);
begin
  { Solo se utiliza en Z_PRO_CREAR_ORDEN_PEDIDO para TyC
  if (LFDBIntroCierre.Checked) then
  begin
     LFReservaStock.Checked := False;
     LFReservaStock.Enabled := False;
     ProDMConfiguracion.QMConfiguracionRESERVA_STOCK_OP.AsInteger := 0;
  end
  else
     LFReservaStock.Enabled := True;
     }
end;

procedure TProFMConfiguracion.LFCBMovStockComponenteChange(Sender: TObject);
begin
  if (LFCBMovStockComponente.Checked) then
  begin
     LFCBFabricadas.Enabled := True;
     // ProDMConfiguracion.QMConfiguracionOF_UN_FABRICADES_MOV_COMPONENTE.AsInteger := 0;
  end
  else
  begin
     LFCBFabricadas.Enabled := False;
     LFCBFabricadas.Checked := False;
  end;
end;

procedure TProFMConfiguracion.DBEAlmEntChange(Sender: TObject);
begin
  EAlmEnt.Text := DameTituloAlmacen(DBEAlmEnt.Text);
end;

procedure TProFMConfiguracion.DBEAlmLanChange(Sender: TObject);
begin
  EAlmLan.Text := DameTituloAlmacen(DBEAlmLan.Text);
end;

procedure TProFMConfiguracion.DBEAlmSalChange(Sender: TObject);
begin
  EAlmSal.Text := DameTituloAlmacen(DBEAlmSal.Text);
end;

procedure TProFMConfiguracion.DBEAlmRetChange(Sender: TObject);
begin
  EAlmRet.Text := DameTituloAlmacen(DBEAlmRet.Text);
end;

procedure TProFMConfiguracion.DBEAlmRecChange(Sender: TObject);
begin
  EAlmRec.Text := DameTituloAlmacen(DBEAlmRec.Text);
end;

procedure TProFMConfiguracion.DBEFAlmacenPreparacionChange(Sender: TObject);
begin
  EAlmacenPreparacion.Text := DameTituloAlmacen(DBEFAlmacenPreparacion.Text);
end;

procedure TProFMConfiguracion.DBEFAlmacenTrabExternoChange(Sender: TObject);
begin
  EAlmacenTrabExterno.Text := DameTituloAlmacen(DBEFAlmacenTrabExterno.Text);
end;

procedure TProFMConfiguracion.DSBEAlmacenEntradaChange(Sender: TObject);
begin
  EAlmacenEntrada.Text := DameTituloAlmacen(DSBEAlmacenEntrada.Text);
end;

end.
