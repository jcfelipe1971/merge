unit UFMAlbDeposito;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ULFEdit, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ExtCtrls, ULFPanel, Mask,
  DBCtrls, ULFDBEdit, ComCtrls, ToolWin, ULFToolBar, Buttons, ULFLabel;

type
  TFMAlbDeposito = class(TG2kForm)
     TBMain: TLFToolBar;
     TButtCrear: TToolButton;
     TButtSalir: TToolButton;
     LFDBERigAlb: TLFDbedit;
     LRigAlbaran: TLFLabel;
     TButtSep: TToolButton;
     TButtEliminar: TToolButton;
     PMain: TLFPanel;
     LAlmacen: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     LFEAlmacenTit: TLFEdit;
     LFDBEMovDeposito: TLFDbedit;
     LMovDeposito: TLFLabel;
     SBVerMovStock: TSpeedButton;
     procedure TButtCrearClick(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtEliminarClick(Sender: TObject);
     procedure SBVerMovStockDblClick(Sender: TObject);
  private
     { Private declarations }
     procedure HabilitaBotones;
  public
     { Public declarations }
     procedure MuestraDeposito;
  end;

var
  FMAlbDeposito : TFMAlbDeposito;

implementation

{$R *.dfm}

uses UDMMain, UDMAlbaranes, {HYFIBQuery, FIBQuery, DB,} UUtiles, UFMain, UEntorno, UDameDato;

procedure TFMAlbDeposito.MuestraDeposito;
begin
  if (DMAlbaranes.QMCabeceraDEPOSITO.AsInteger = 1) then
     EFAlmacen.Text := DMAlbaranes.QMCabeceraALMACEN_DEPOSITO.AsString;

  SolapaControles(SBVerMovStock, LFDBEMovDeposito);

  HabilitaBotones;
  TFMAlbDeposito(Self).ShowModal;
end;

procedure TFMAlbDeposito.TButtCrearClick(Sender: TObject);
begin
  DMAlbaranes.GeneraMovDeposito(EFAlmacen.Text);

  HabilitaBotones;
end;

procedure TFMAlbDeposito.EFAlmacenChange(Sender: TObject);
begin
  LFEAlmacenTit.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMAlbDeposito.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAlbDeposito.HabilitaBotones;
begin
  with DMAlbaranes do
  begin
     TButtCrear.Enabled := (QMCabeceraDEPOSITO.AsInteger = 0) and
        (QMCabeceraNUM_MOV_DEPOSITO.AsInteger = 0);
     TButtEliminar.Enabled := (QMCabeceraNUM_MOV_DEPOSITO.AsInteger <> 0);
  end;

  EFAlmacen.Enabled := TButtCrear.Enabled;
  EFAlmacen.TabStop := TButtCrear.Enabled;
  EFAlmacen.ReadOnly := not TButtCrear.Enabled;

  if TButtCrear.Enabled then
  begin
     EFAlmacen.Color := clWhite;
     EFAlmacen.Font.Color := clWindowText;
  end
  else
  begin
     EFAlmacen.Color := clInfoBk;
     EFAlmacen.Font.Color := clGrayText;
  end;
end;

procedure TFMAlbDeposito.TButtEliminarClick(Sender: TObject);
begin
  DMAlbaranes.BorraMovDeposito;

  EFAlmacen.Text := '';
  HabilitaBotones;
end;

procedure TFMAlbDeposito.SBVerMovStockDblClick(Sender: TObject);
begin
  with DMAlbaranes do
  begin
     if (QMCabeceraNUM_MOV_DEPOSITO.AsInteger <> 0) then
        FMain.MuestraMovimiento(REntorno.Empresa, REntorno.Ejercicio,
           QMCabeceraNUM_MOV_DEPOSITO.AsInteger, QMCabeceraSERIE.AsString);
  end;
end;

end.
