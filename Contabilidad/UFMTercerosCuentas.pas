unit UFMTercerosCuentas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Mask, DBCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, UHYDBGrid, ExtCtrls,
  UNavigator, Menus, UTeclas, UControlEdit, UFormGest, NsDBGrid, ULFDBEdit,
  ULFToolBar, ULFPanel, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage;

type
  TFMTercerosCuentas = class(TG2KForm)
     TBMain: TLFToolBar;
     TbuttSalir: TToolButton;
     TbuttTerCuentasEmpUna: TToolButton;
     ToolButton2: TToolButton;
     TbuttTerCuentasEmpTot: TToolButton;
     TButtBorraUna: TToolButton;
     ToolButton4: TToolButton;
     TButtBorraTot: TToolButton;
     ToolButton1: TToolButton;
     TBTerceros: TLFToolBar;
     DBGCuentas: THYTDBGrid;
     CEMainPMEdit: TPopUpTeclas;
     SMInsertar: TMenuItem;
     SMBorrar: TMenuItem;
     TButtVerSaldos: TToolButton;
     SMSaldos: TMenuItem;
     EFCuentas: TLFEditFind2000;
     PNLTercero: TLFPanel;
     Label1: TLFLabel;
     EFTercero: TLFEditFind2000;
     DBETitulo: TLFDbedit;
     ToolButton3: TToolButton;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttSalirClick(Sender: TObject);
     procedure TbuttTerCuentasEmpUnaClick(Sender: TObject);
     procedure TbuttTerCuentasEmpTotClick(Sender: TObject);
     procedure TButtBorraUnaClick(Sender: TObject);
     procedure TButtBorraTotClick(Sender: TObject);
     procedure SMInsertarClick(Sender: TObject);
     procedure SMBorrarClick(Sender: TObject);
     procedure TButtVerSaldosClick(Sender: TObject);
     procedure EFTerceroChange(Sender: TObject);
  private
     procedure Expande;
  public
  end;

var
  FMTercerosCuentas : TFMTercerosCuentas;

implementation

uses UDMTercerosCuentas, UDMMain, UUtiles, UFVerSaldosTer;

{$R *.DFM}

procedure TFMTercerosCuentas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMTercerosCuentas, DMTercerosCuentas);
  SMInsertar.ShortCut := DMMain.Teclas.FscInsert;
  SMBorrar.ShortCut := DMMain.Teclas.FscDelete;
  SMSaldos.ShortCut := DMMain.Teclas.FscBuscar;
end;

procedure TFMTercerosCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMTercerosCuentas);
end;

procedure TFMTercerosCuentas.TbuttSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMTercerosCuentas.TbuttTerCuentasEmpUnaClick(Sender: TObject);
begin
  if Confirma then
     DMTercerosCuentas.RellenaCuentasTercerosUna;
end;

procedure TFMTercerosCuentas.TbuttTerCuentasEmpTotClick(Sender: TObject);
begin
  if Confirma then
     DMTercerosCuentas.RellenaCuentasTercerosTot;
end;

procedure TFMTercerosCuentas.TButtBorraUnaClick(Sender: TObject);
begin
  if Confirma then
     DMTercerosCuentas.BorraUna;
end;

procedure TFMTercerosCuentas.TButtBorraTotClick(Sender: TObject);
begin
  if Confirma then
     DMTercerosCuentas.BorraTot;
end;

procedure TFMTercerosCuentas.Expande;
begin
  DMTercerosCuentas.PosicionaTercero(StrToIntDef(EFTercero.Text, 0));
end;

procedure TFMTercerosCuentas.SMInsertarClick(Sender: TObject);
var
  Tecla : char;
begin
  Tecla := char(32);
  EFCuentas.Enabled := True;
  EFCuentas.Visible := True;
  EFCuentas.SetFocus;
  EFCuentas.KeyPress(Tecla);
  DMTercerosCuentas.InsertaCuenta(EFCuentas.Text);
  EFCuentas.Text := '';
  EFCuentas.Enabled := False;
end;

procedure TFMTercerosCuentas.SMBorrarClick(Sender: TObject);
begin
  if Confirma then
     DMTercerosCuentas.BorraCuenta;
end;

procedure TFMTercerosCuentas.TButtVerSaldosClick(Sender: TObject);
begin
  TFVerSaldosTer.Create(Application).ShowModal;
end;

procedure TFMTercerosCuentas.EFTerceroChange(Sender: TObject);
begin
  Self.Expande;
end;

end.
