unit UFMCuentasIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMCuentasIVA = class(TFPEdit)
     LBLTipo: TLFLabel;
     DBETipoDet: TLFDbedit;
     LBLModo: TLFLabel;
     DBEModoDet: TLFDbedit;
     DBETipo: TLFDbedit;
     DBEModo: TLFDbedit;
     GBCuentasCargo: TGroupBox;
     LBLCargoIVA: TLFLabel;
     DBECargoIVA: TLFDBEditFind2000;
     LBLCargoRec: TLFLabel;
     DBECargoRec: TLFDBEditFind2000;
     GBCuentasAbono: TGroupBox;
     LBLAbonoIVA: TLFLabel;
     DBEAbonoIVA: TLFDBEditFind2000;
     LBLAbonoRec: TLFLabel;
     DBEAbonoRec: TLFDBEditFind2000;
     GBPorcentajes: TGroupBox;
     LBLIVA: TLFLabel;
     LBLRE: TLFLabel;
     DBE_P_Iva: TLFDbedit;
     DBE_P_Recargo: TLFDbedit;
     ETituloCargoIva: TLFEdit;
     ETituloCargoRec: TLFEdit;
     ETituloAbonoIva: TLFEdit;
     ETituloAbonoRec: TLFEdit;
     LCtaCargoRECC: TLFLabel;
     DBECargoIVARECC: TLFDBEditFind2000;
     ETituloCargoIvaRECC: TLFEdit;
     LCtaAbonoRECC: TLFLabel;
     DBEAbonoIVARECC: TLFDBEditFind2000;
     ETituloAbonoIvaRECC: TLFEdit;
     LCtaCargoISP: TLFLabel;
     DBECargoISP: TLFDBEditFind2000;
     ETituloCargoISP: TLFEdit;
     LCtaAbonoISP: TLFLabel;
     DBEAbonoISP: TLFDBEditFind2000;
     ETituloAbonoISP: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBECargoIVAVerificacion(Sender: TObject);
     procedure DBECargoRecVerificacion(Sender: TObject);
     procedure DBEAbonoIVAVerificacion(Sender: TObject);
     procedure DBEAbonoRecVerificacion(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBECargoIVAChange(Sender: TObject);
     procedure DBECargoRecChange(Sender: TObject);
     procedure DBEAbonoIVAChange(Sender: TObject);
     procedure DBEAbonoRecChange(Sender: TObject);
     procedure DBECargoIVARECCChange(Sender: TObject);
     procedure DBEAbonoIVARECCChange(Sender: TObject);
     procedure DBECargoISPChange(Sender: TObject);
     procedure DBEAbonoISPChange(Sender: TObject);
     procedure DBECargoISPVerificacion(Sender: TObject);
     procedure DBEAbonoISPVerificacion(Sender: TObject);
  private
     { Private declarations }
     procedure EnablePointCount;
     procedure DisablePointCount;
  public
     { Public declarations }
  end;

var
  FMCuentasIVA : TFMCuentasIVA;

implementation

uses UDMCuentasIVA, UDMMain, UFormGest, UUtiles, UFMain, UEntorno, UDameDato;

{$R *.DFM}

procedure TFMCuentasIVA.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCuentasIVA, DMCuentasIVA);
  DBGMain.DataSource := DMCuentasIVA.DSQMCuentaIVA;
  NavMain.DataSource := DMCuentasIVA.DSQMCuentaIVA;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
  EnablePointCount;
end;

procedure TFMCuentasIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DisablePointCount;
  CierraData(DMCuentasIVA);
end;

procedure TFMCuentasIVA.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCuentasIVA.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCuentasIVA.DBECargoIVAVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBECargoIVA);
end;

procedure TFMCuentasIVA.DBECargoRecVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBECargoRec);
end;

procedure TFMCuentasIVA.DBEAbonoIVAVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEAbonoIVA);
end;

procedure TFMCuentasIVA.DBEAbonoRecVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEAbonoRec);
end;

procedure TFMCuentasIVA.EnablePointCount;
begin
  // Añadir a los campos de Cuentas el punto para poder expandir
  FMain.AddComponentePunto(DBECargoIVA);
  FMain.AddComponentePunto(DBECargoRec);
  FMain.AddComponentePunto(DBECargoISP);
  FMain.AddComponentePunto(DBEAbonoIVA);
  FMain.AddComponentePunto(DBEAbonoRec);
  FMain.AddComponentePunto(DBEAbonoISP);

  // Establecer el tamaño máximo de las cuentas
  DBECargoIVA.MaxLength := REntorno.DigitosSub;
  DBECargoRec.MaxLength := REntorno.DigitosSub;
  DBEAbonoIVA.MaxLength := REntorno.DigitosSub;
  DBEAbonoRec.MaxLength := REntorno.DigitosSub;
end;

{ Liberar los campos de Cuentas }
procedure TFMCuentasIVA.DisablePointCount;
begin
  FMain.DelComponentePunto(DBECargoIVA);
  FMain.DelComponentePunto(DBECargoRec);
  FMain.DelComponentePunto(DBEAbonoIVA);
  FMain.DelComponentePunto(DBEAbonoRec);
  FMain.DelComponentePunto(DBECargoISP);
  FMain.DelComponentePunto(DBEAbonoISP);
end;

procedure TFMCuentasIVA.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMCuentasIVA.DBECargoIVAChange(Sender: TObject);
begin
  inherited;
  ETituloCargoIva.Text := DameTituloCuenta(DBECargoIVA.Text);
end;

procedure TFMCuentasIVA.DBECargoRecChange(Sender: TObject);
begin
  inherited;
  ETituloCargoRec.Text := DameTituloCuenta(DBECargoRec.Text);
end;

procedure TFMCuentasIVA.DBEAbonoIVAChange(Sender: TObject);
begin
  inherited;
  ETituloAbonoIva.Text := DameTituloCuenta(DBEAbonoIVA.Text);
end;

procedure TFMCuentasIVA.DBEAbonoRecChange(Sender: TObject);
begin
  inherited;
  ETituloAbonoRec.Text := DameTituloCuenta(DBEAbonoRec.Text);
end;

procedure TFMCuentasIVA.DBECargoIVARECCChange(Sender: TObject);
begin
  inherited;
  ETituloCargoIvaRECC.Text := DameTituloCuenta(DBECargoIVARECC.Text);
end;

procedure TFMCuentasIVA.DBEAbonoIVARECCChange(Sender: TObject);
begin
  inherited;
  ETituloAbonoIvaRECC.Text := DameTituloCuenta(DBEAbonoIVARECC.Text);
end;

procedure TFMCuentasIVA.DBECargoISPChange(Sender: TObject);
begin
  inherited;
  ETituloCargoISP.Text := DameTituloCuenta(DBECargoISP.Text);
end;

procedure TFMCuentasIVA.DBEAbonoISPChange(Sender: TObject);
begin
  inherited;
  ETituloAbonoISP.Text := DameTituloCuenta(DBEAbonoISP.Text);
end;

procedure TFMCuentasIVA.DBECargoISPVerificacion(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(DBECargoISP);
end;

procedure TFMCuentasIVA.DBEAbonoISPVerificacion(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(DBEAbonoISP);
end;

end.
