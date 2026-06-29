unit ZUFMTalones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada, DB, Urecursos,
  ActnList, UFormGest, Variants, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFEdit, DbComboBoxValue,
  UFPEdit, ULFFIBDBEditFind, UG2kTBLoc, ULFDBDateEdit;

type
  TZFMTalones = class(TFPEdit)
     LRIG: TLFLabel;
     DBEID: TLFDbedit;
     LabEstado: TLFLabel;
     LTercero: TLFLabel;
     LBLDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     LBLFecha: TLFLabel;
     LBLLugar: TLFLabel;
     DBELugar: TLFDbedit;
     PDetalle: TLFPanel;
     LFPageControl1: TLFPageControl;
     TCobros: TTabSheet;
     TAnticipos: TTabSheet;
     TPagos: TTabSheet;
     LFToolBar1: TLFToolBar;
     NavCobros: THYMNavigator;
     ToolButton1: TToolButton;
     HYMEditPanel1: THYMEditPanel;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     DBGFDetalle: TDBGridFind2000;
     LFToolBar2: TLFToolBar;
     NavAnticipos: THYMNavigator;
     ToolButton4: TToolButton;
     HYMEditPanel2: THYMEditPanel;
     ToolButton5: TToolButton;
     ToolButton6: TToolButton;
     DBGridFind20001: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavPagos: THYMNavigator;
     ToolButton7: TToolButton;
     HYMEditPanel3: THYMEditPanel;
     ToolButton8: TToolButton;
     ToolButton9: TToolButton;
     DBGridFind20002: TDBGridFind2000;
     LFCobros: TLFLabel;
     LAnticiposPagados: TLFLabel;
     LPagosPendientes: TLFLabel;
     Diferencia: TLFLabel;
     DBETercero: TLFDBEditFind2000;
     DBETituloTercero: TLFDbedit;
     LFDBCobros: TLFDbedit;
     LFDBPagos: TLFDbedit;
     LFDBAnticipos: TLFDbedit;
     Procesos: TLFCategoryAction;
     ABloquear: TAction;
     Alistados: TLFCategoryAction;
     ATalon: TAction;
     TButtAbreCierra: TToolButton;
     DBEFCuenta: TLFDBEditFind2000;
     DBETitulo: TLFDbedit;
     LCuenta: TLFLabel;
     DBEDiferencia: TLFDbedit;
     LCuentaCobro: TLFLabel;
     DBCuentaCobro: TLFDBEditFind2000;
     LFDBTitCuentaCobro: TLFDbedit;
     DBEFBanco: TLFDBEditFind2000;
     DBETituloBanco: TLFDbedit;
     LBanco: TLFLabel;
     DBTalon: TLFDbedit;
     LBLTalon: TLFLabel;
     DBETituloEstado: TLFDbedit;
     DBEContador: TLFDbedit;
     LContador: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ABloquearExecute(Sender: TObject);
     procedure ATalonExecute(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbreCarteraPagos;
     procedure AbreCarteraCobros;
  end;

var
  ZFMTalones : TZFMTalones;

implementation

uses UDMMain, UEntorno, ZUDMTalones, UUtiles, ZUFMLstTalones, UFMain;

{$R *.dfm}

procedure TZFMTalones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMTalones, ZDMTalones);
  NavMain.DataSource := ZDMTalones.DSCabecera;
  NavCobros.DataSource := ZDMTalones.DSCobros;
  NavAnticipos.DataSource := ZDMTalones.DSAnticipos;
  NavPagos.DataSource := ZDMTalones.DSPagos;
end;

procedure TZFMTalones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(ZDMTalones);
end;

procedure TZFMTalones.ABloquearExecute(Sender: TObject);
begin
  inherited;
  ZDMTalones.Bloquear;

  if (ZDMTalones.QMCabeceraESTADO.AsInteger = 5) then
  begin
     TButtAbreCierra.Hint := _('Abre y desbloquea el documento');
     TButtAbreCierra.ImageIndex := 67;
     TButtAbreCierra.Tag := 1;
     ABloquear.Hint := _('Abre y desbloquea el documento');
     ABloquear.ImageIndex := 67;
     ABloquear.Tag := 1;
     ABloquear.Caption := _('Abrir Talón');
  end
  else
  begin
     TButtAbreCierra.Hint := _('Cierra y bloquea el documento');
     TButtAbreCierra.ImageIndex := 68;
     TButtAbreCierra.Tag := 0;
     ABloquear.Hint := _('Cierra y bloquea el documento');
     ABloquear.ImageIndex := 68;
     ABloquear.Tag := 0;
     ABloquear.Caption := _('Cerrar Talón');
  end;
end;

procedure TZFMTalones.AbreCarteraPagos;
var
  {envio : TObject;}
  signo : string;
begin
  {AbreForm(TFMCartera, FMCartera,envio);
  FMCartera.Mostrar(ZDMTalones.QMCabeceraEMPRESA.AsInteger,
                    ZDMTalones.QMCabeceraEJERCICIO.AsInteger,
                    ZDMTalones.QMCabeceraCANAL.AsInteger,
                    ZDMTalones.QMPagosSIGNO.AsString,
                    ZDMTalones.QMPagosREGISTRO.AsInteger,
                    ZDMTalones.QMPagosID_CARTERA.AsInteger);}
  signo := ZDMTalones.QMPagosSIGNO.AsString;
  FMain.MuestraCartera(ZDMTalones.QMCabeceraEJERCICIO.AsInteger,
     ZDMTalones.QMCabeceraCANAL.AsInteger,
     signo[1],
     ZDMTalones.QMPagosREGISTRO.AsInteger);
end;

procedure TZFMTalones.AbreCarteraCobros;
var
  {envio : TObject;}
  signo : string;
begin
  {AbreForm(TFMCartera, FMCartera, envio);
  FMCartera.mostrar(ZDMTalones.QMCabeceraEMPRESA.AsInteger,
                    ZDMTalones.QMCabeceraEJERCICIO.AsInteger,
                    ZDMTalones.QMCabeceraCANAL.AsInteger,
                    ZDMTalones.QMCobrosSIGNO.AsString,
                    ZDMTalones.QMCobrosREGISTRO.AsInteger,
                    ZDMTalones.QMCobrosID_CARTERA.AsInteger);}
  signo := ZDMTalones.QMPagosSIGNO.AsString;
  FMain.MuestraCartera(ZDMTalones.QMCabeceraEJERCICIO.AsInteger,
     ZDMTalones.QMCabeceraCANAL.AsInteger,
     signo[1],
     ZDMTalones.QMPagosREGISTRO.AsInteger);
end;

procedure TZFMTalones.ATalonExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMLstTalones, ZFMLstTalones, Sender);
  ZFMLstTalones.LFTercero.Text := DBETercero.Text;
end;

procedure TZFMTalones.TbuttCompClick(Sender: TObject);
begin
  inherited;
  ZDMTalones.Marcar_Todos;
end;

procedure TZFMTalones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
