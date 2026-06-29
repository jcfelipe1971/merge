unit UFMCuentasIRPF;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMCuentasIRPF = class(TFPEdit)
     LBLTipo: TLFLabel;
     DBETipo: TLFDbedit;
     DBETipoDet: TLFDbedit;
     LBLRetencion: TLFLabel;
     DBE_P_Iva: TLFDbedit;
     GBCuentas: TGroupBox;
     LBLCargoIVA: TLFLabel;
     LBLCargoRec: TLFLabel;
     DBECargoIRPF: TLFDBEditFind2000;
     DBEAbonoIRPF: TLFDBEditFind2000;
     ECuentaCargo: TLFEdit;
     ECuentaAbono: TLFEdit;
     LBLAplicableA: TLFLabel;
     DBEAplicableA: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBECargoIRPFVerificacion(Sender: TObject);
     procedure DBEAbonoIRPFVerificacion(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBECargoIRPFChange(Sender: TObject);
     procedure DBEAbonoIRPFChange(Sender: TObject);
  private
     { Private declarations }
     procedure EnablePointCount;
     procedure DisablePointCount;
  public
     { Public declarations }
  end;

var
  FMCuentasIRPF : TFMCuentasIRPF;

implementation

uses UFormGest, UDMMain, UEntorno, UUtiles, UDMCuentasIRPF, UFMain, UDameDato;

{$R *.DFM}

procedure TFMCuentasIRPF.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCuentasIRPF, DMCuentasIRPF);
  NavMain.DataSource := DMCuentasIRPF.DSQMVerIRPF;
  EPMain.DataSource := DMCuentasIRPF.DSQMVerIRPF;
  DBGMain.DataSource := DMCuentasIRPF.DSQMVerIRPF;

  EnablePointCount;
end;

procedure TFMCuentasIRPF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DisablePointCount;
  CierraData(DMCuentasIRPF);
end;

procedure TFMCuentasIRPF.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCuentasIRPF.busquedacompleja;
  Continua := False;
end;

procedure TFMCuentasIRPF.DBECargoIRPFVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBECargoIRPF);
end;

procedure TFMCuentasIRPF.DBEAbonoIRPFVerificacion(Sender: TObject);
begin
  ExpandirCadenaEdit(DBEAbonoIRPF);
end;

procedure TFMCuentasIRPF.EnablePointCount;
begin
  // Añadir a los campos de Cuentas el punto para poder expandir
  FMain.AddComponentePunto(DBECargoIRPF);
  FMain.AddComponentePunto(DBEAbonoIRPF);

  // Establecer el tamaño máximo de las cuentas
  DBECargoIRPF.MaxLength := REntorno.DigitosSub;
  DBEAbonoIRPF.MaxLength := REntorno.DigitosSub;
end;

{ Liberar los campos de Cuentas }
procedure TFMCuentasIRPF.DisablePointCount;
begin
  FMain.DelComponentePunto(DBECargoIRPF);
  FMain.DelComponentePunto(DBEAbonoIRPF);
end;

procedure TFMCuentasIRPF.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMCuentasIRPF.DBECargoIRPFChange(Sender: TObject);
begin
  inherited;
  ECuentaCargo.Text := DameTituloCuenta(DBECargoIRPF.Text);
end;

procedure TFMCuentasIRPF.DBEAbonoIRPFChange(Sender: TObject);
begin
  inherited;
  ECuentaAbono.Text := DameTituloCuenta(DBEAbonoIRPF.Text);
end;

end.
