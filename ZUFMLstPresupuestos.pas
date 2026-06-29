unit ZUFMLstPresupuestos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker, Mask,
  DBCtrls, ULFActionList, ULFPageControl, ULFToolBar, ULFDBEdit,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, rxPlacemnt,
  ULFFormStorage, rxToolEdit, ULFDateEdit, ExtCtrls, ULFPanel,
  UFPEditListadoSimple;

type
  TZFMLstPresupuestos = class(TFPEditListadoSimple)
     GBFecha: TGroupBox;
     GBFiltros: TGroupBox;
     CHKAgente: TLFCheckBox;
     CHKSituacion: TLFCheckBox;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     GBAgente: TGroupBox;
     GBSituacion: TGroupBox;
     EFAgente: TLFEditFind2000;
     EFSituacion: TLFEditFind2000;
     DBEDescAgente: TLFDbedit;
     DBEDescSituacion: TLFDbedit;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     TButtDisenyar: TToolButton;
     ADisenyar: TAction;
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASalirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure CHKAgenteClick(Sender: TObject);
     procedure CHKSituacionClick(Sender: TObject);
     procedure EFAgenteChange(Sender: TObject);
     procedure EFSituacionChange(Sender: TObject);
     procedure ADisenyarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMLstPresupuestos : TZFMLstPresupuestos;

implementation

uses ZUDMLstPresupuestos, UFormGest, UDMMain, UEntorno;

{$R *.dfm}

procedure TZFMLstPresupuestos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstPresupuestos, ZDMLstPresupuestos);
  ARecargarExecute(Sender);
end;

procedure TZFMLstPresupuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLstPresupuestos);
  Action := caFree;
end;

procedure TZFMLstPresupuestos.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DTPDesde.Date := REntorno.FechaTrabSH;
  DTPHasta.Date := REntorno.FechaTrabSH;
  CHKAgente.Checked := False;
  CHKSituacion.Checked := False;
end;

procedure TZFMLstPresupuestos.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TZFMLstPresupuestos.APrevExecute(Sender: TObject);
begin
  inherited;
  ZDMLstPresupuestos.MostrarListado(DTPDesde.Date, DTPHasta.Date, CHKAgente.Checked, CHKSituacion.Checked, 0, StrToIntDef(EFAgente.Text, 0), EFSituacion.Text);
end;

procedure TZFMLstPresupuestos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ZDMLstPresupuestos.MostrarListado(DTPDesde.Date, DTPHasta.Date, CHKAgente.Checked, CHKSituacion.Checked, 1, StrToIntDef(EFAgente.Text, 0), EFSituacion.Text);
end;

procedure TZFMLstPresupuestos.CHKAgenteClick(Sender: TObject);
begin
  inherited;
  if CHKAgente.Checked = True then
  begin
     EFAgente.Text := '';
     GBAgente.Visible := True;
  end
  else
     GBAgente.Visible := False;
end;

procedure TZFMLstPresupuestos.CHKSituacionClick(Sender: TObject);
begin
  inherited;
  if CHKSituacion.Checked = True then
  begin
     EFSituacion.Text := '';
     GBSituacion.Visible := True;
  end
  else
     GBSituacion.Visible := False;
end;

procedure TZFMLstPresupuestos.EFAgenteChange(Sender: TObject);
begin
  inherited;
  if EFAgente.Text = '' then
     DBEDescAgente.Text := ''
  else
     ZDMLstPresupuestos.DescAgente(EFAgente.Text);
end;

procedure TZFMLstPresupuestos.EFSituacionChange(Sender: TObject);
begin
  inherited;
  if EFSituacion.Text = '' then
     DBEDescSituacion.Text := ''
  else
     ZDMLstPresupuestos.DescSituacion(EFSituacion.Text);
end;

procedure TZFMLstPresupuestos.ADisenyarExecute(Sender: TObject);
begin
  inherited;
  ZDMLstPresupuestos.Disenyar;
end;

end.
