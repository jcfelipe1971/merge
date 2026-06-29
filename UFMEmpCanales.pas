unit UFMEmpCanales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, UG2kTBLoc, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  ULFEdit;

type
  TFMEmpCanales = class(TFPEdit)
     DBEEjercicio: TLFDbedit;
     DBECanal: TLFDbedit;
     ETitCanal: TLFEdit;
     LCanal: TLFLabel;
     LEjercicio: TLFLabel;
     DBEApertura: TLFDbedit;
     DBECierre: TLFDbedit;
     DBEActivacion: TLFDbedit;
     LFechaApertura: TLFLabel;
     LFechaCierre: TLFLabel;
     LFechaActivacion: TLFLabel;
     DBEPais: TLFDbedit;
     DBETipoIva: TLFDbedit;
     DBEModoIva: TLFDbedit;
     ETitPais: TLFEdit;
     DBETitTipoIVA: TLFDbedit;
     ETitModoIVA: TLFEdit;
     LPais: TLFLabel;
     LTipoIVA: TLFLabel;
     LModoIVA: TLFLabel;
     GBAsientos: TGroupBox;
     ETitMoneda: TLFEdit;
     LMoneda: TLFLabel;
     DBEFMoneda: TLFDBEditFind2000;
     DBCBAApertura: TLFDBCheckBox;
     DBCBACierre: TLFDBCheckBox;
     DBCBARegularizacion: TLFDBCheckBox;
     ARepasaAsientos: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DBCBLiquidarIVAModelo303: TLFDBCheckBox;
     LFDBECierrePeriodo: TLFDBDateEdit;
     LFLCierrePeriodo: TLFLabel;
     LPGC: TLFLabel;
     EBEFindPGC: TLFDBEditFind2000;
     DBEPGC: TLFDbedit;
     LCierreFacturacionCompras: TLFLabel;
     DBDECierreFacturacionCompras: TLFDBDateEdit;
     LUltimoRegistroRepercutido: TLFLabel;
     DBELUltimoRegistroRepercutido: TLFDbedit;
     LUltimoRegistroSoportado: TLFLabel;
     DBEUltimoRegistroSoportado: TLFDbedit;
     LUltimoPeriodoRepercutido: TLFLabel;
     DBEUltimoPeriodoRepercutido: TLFDbedit;
     DBEUltimoPeriodoSoportado: TLFDbedit;
     LUltimoPeriodoSoportado: TLFLabel;
     PNLPeriodosRenumerados: TLFPanel;
     LCierreFacturacionVentas: TLFLabel;
     DBDECierreFacturacionVentas: TLFDBDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARepasaAsientosExecute(Sender: TObject);
     procedure EBEFindPGCBusqueda(Sender: TObject);
     procedure DBECanalChange(Sender: TObject);
     procedure DBEPaisChange(Sender: TObject);
     procedure DBEModoIvaChange(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEmpCanales : TFMEmpCanales;

implementation

uses UDMMain, UDMEmpCanales, UFormGest, UEntorno, UUtiles, UDameDato;

{$R *.DFM}

procedure TFMEmpCanales.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEmpCanales, DMEmpCanales);
  NavMain.DataSource := DMEmpCanales.DSQMEmpCanales;
  DBGMain.DataSource := DMEmpCanales.DSQMEmpCanales;
  ControlEdit := CEMain;
  PNLPeriodosRenumerados.Visible := (DMMain.EstadoKri(444) = 1);
end;

procedure TFMEmpCanales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEmpCanales);
end;

procedure TFMEmpCanales.ARepasaAsientosExecute(Sender: TObject);
begin
  inherited;
  DMEmpCanales.RevisaAsientos;
end;

procedure TFMEmpCanales.EBEFindPGCBusqueda(Sender: TObject);
begin
  EBEFindPGC.CondicionBusqueda := 'PAIS=''' + REntorno.Pais + '''';
end;

procedure TFMEmpCanales.DBECanalChange(Sender: TObject);
begin
  inherited;
  ETitCanal.Text := DameTituloCanal(StrToIntDef(DBECanal.Text, 0));
end;

procedure TFMEmpCanales.DBEPaisChange(Sender: TObject);
begin
  inherited;
  ETitPais.Text := DameTituloPais(DBEPais.Text);
end;

procedure TFMEmpCanales.DBEModoIvaChange(Sender: TObject);
begin
  inherited;
  ETitModoIVA.Text := DameTituloModoIVA(StrToIntDef(DBEModoIva.Text, -1));
end;

procedure TFMEmpCanales.DBEFMonedaChange(Sender: TObject);
begin
  inherited;
  ETitMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);
end;

end.
