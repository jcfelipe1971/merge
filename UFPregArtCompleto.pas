unit UFPregArtCompleto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, Mask, DBCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ActnList, ComCtrls, ToolWin, ExtCtrls,
  ULFEdit, ULFCheckBox, ULFDBEdit, ULFActionList, ULFPageControl,
  ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, rxPlacemnt,
  ULFFormStorage, ULFPanel, UFPEditListadoSimple;

type
  TFPregArtCompleto = class(TFPEditListadoSimple)
     GBArticulos: TGroupBox;
     LDesdeArticulo: TLFLabel;
     EFArtDesde: TLFEditFind2000;
     EArticuloDesde: TLFEdit;
     LHastaArticulo: TLFLabel;
     EFArtHasta: TLFEditFind2000;
     EArticuloHasta: TLFEdit;
     GBFamilias: TGroupBox;
     LDesdeFamilia: TLFLabel;
     EFFamiliaDesde: TLFEditFind2000;
     EFamiliaDesde: TLFEdit;
     LHastaFamilia: TLFLabel;
     EFFamiliaHasta: TLFEditFind2000;
     EFamiliaHasta: TLFEdit;
     GBCuentaCompras: TGroupBox;
     LDesdeCtaCompras: TLFLabel;
     LHastaCtaCompras: TLFLabel;
     EFCtaComprasD: TLFEditFind2000;
     EFCtaComprasH: TLFEditFind2000;
     ECtaComprasH: TLFEdit;
     ECtaComprasD: TLFEdit;
     GBTipoIVA: TGroupBox;
     DBETipoIVADesde: TLFDbedit;
     LDesdeTipoIVA: TLFLabel;
     EFTipoIVADesde: TLFEditFind2000;
     LHastaTipoIVA: TLFLabel;
     EFTipoIVAHasta: TLFEditFind2000;
     DBETipoIVAHasta: TLFDbedit;
     GBPrecioCoste: TGroupBox;
     LDesdePCoste: TLFLabel;
     LHastaPCoste: TLFLabel;
     EdPCosteDesde: TLFEdit;
     EdPCosteHasta: TLFEdit;
     ChkCtaCompras: TLFCheckBox;
     ChkFamilias: TLFCheckBox;
     ChkArticulos: TLFCheckBox;
     ChkTipoIVA: TLFCheckBox;
     ChkPCoste: TLFCheckBox;
     TButtConfRapida: TToolButton;
     RBOrdenado: TRadioGroup;
     GBCuentaVentas: TGroupBox;
     LHastaCtaVentas: TLFLabel;
     LDesdeCtaVentas: TLFLabel;
     EFCtaVentasD: TLFEditFind2000;
     EFCtaVentasH: TLFEditFind2000;
     ECtaVentasD: TLFEdit;
     ECtaVentasH: TLFEdit;
     ChkCtaVentas: TLFCheckBox;
     procedure EFArtDesdeBusqueda(Sender: TObject);
     procedure EFArtHastaBusqueda(Sender: TObject);
     procedure EFFamiliaDesdeBusqueda(Sender: TObject);
     procedure EFFamiliaHastaBusqueda(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArtDesdeChange(Sender: TObject);
     procedure EFArtHastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure ChkArticulosClick(Sender: TObject);
     procedure ChkFamiliasClick(Sender: TObject);
     procedure ChkCtaComprasClick(Sender: TObject);
     procedure ChkCtaVentasClick(Sender: TObject);
     procedure ChkTipoIVAClick(Sender: TObject);
     procedure ChkPCosteClick(Sender: TObject);
     procedure EFFamiliaDesdeChange(Sender: TObject);
     procedure EFFamiliaHastaChange(Sender: TObject);
     procedure EFCtaComprasDChange(Sender: TObject);
     procedure EFCtaComprasHChange(Sender: TObject);
     procedure EFCtaVentasDChange(Sender: TObject);
     procedure EFCtaVentasHChange(Sender: TObject);
     procedure EFTipoIVADesdeChange(Sender: TObject);
     procedure EFTipoIVAHastaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFCtaComprasDExit(Sender: TObject);
     procedure EFCtaComprasDKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCtaComprasHExit(Sender: TObject);
     procedure EFCtaComprasHKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCtaVentasDExit(Sender: TObject);
     procedure EFCtaVentasDKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCtaVentasHExit(Sender: TObject);
     procedure EFCtaVentasHKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
     procedure HabilitarPunto;
     procedure DeshabilitarPunto;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregArtCompleto : TFPregArtCompleto;

implementation

uses UDMLstArticulos, UEntorno, UFormGest, UFMListConfig, UFMain, UUtiles, UDameDato, UDMMain;

{$R *.DFM}

// By JR

procedure TFPregArtCompleto.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstArticulos, DMLstArticulos);
  Grupo := 89;
  Listado := DMLstArticulos.frArticulos;
  ListadoFR3 := DMLstArticulos.frxArticulos;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Self);    // Inicializar campos
  HabilitarPunto;            // Habilitar el Punto en las Cuentas
end;

procedure TFPregArtCompleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  DeshabilitarPunto;
  CierraData(DMLstArticulos);
end;

procedure TFPregArtCompleto.FormShow(Sender: TObject);
begin
  inherited;
  EFArtDesde.SetFocus;
end;

procedure TFPregArtCompleto.ARecargarExecute(Sender: TObject);
var
  MinArt, MaxArt, MinFam, MaxFam, MinCta, MaxCta, MinTipoIVA, MaxTipoIVA : string;
begin
  DMLstArticulos.Recargar(MinArt, MaxArt, MinFam, MaxFam, MinCta, MaxCta,
     MinTipoIVA, MaxTipoIVA);

  EFArtDesde.Text := MinArt;
  EFArtHasta.Text := MaxArt;
  EFFamiliaDesde.Text := MinFam;
  EFFamiliaHasta.Text := MaxFam;
  EFCtaComprasD.Text := MinCta;
  EFCtaComprasH.Text := MaxCta;
  EFCtaVentasD.Text := MinCta;
  EFCtaVentasH.Text := MaxCta;
  EFTipoIVADesde.Text := MinTipoIVA;
  EFTipoIVAHasta.Text := MaxTipoIVA;
  EdPCosteDesde.Text := DMLstArticulos.PCosteD;
  EdPCosteHasta.Text := DMLstArticulos.PCosteH;
end;

procedure TFPregArtCompleto.EFArtDesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtCompleto.EFArtHastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtCompleto.EFFamiliaDesdeBusqueda(Sender: TObject);
begin
  if (TEditFind2000(Sender).Text > '') then
     TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtCompleto.EFFamiliaHastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtCompleto.HabilitarPunto;
begin
  // Añadir a los campos de Cuentas el punto para poder expandir
  FMain.AddComponentePunto(EFCtaComprasD);
  FMain.AddComponentePunto(EFCtaComprasH);
  FMain.AddComponentePunto(EFCtaVentasD);
  FMain.AddComponentePunto(EFCtaVentasH);

  // Ajustar el tamaño de la cuenta por EEC
  EFCtaComprasD.MaxLength := REntorno.DigitosSub;
  EFCtaComprasH.MaxLength := REntorno.DigitosSub;
  EFCtaVentasD.MaxLength := REntorno.DigitosSub;
  EFCtaVentasH.MaxLength := REntorno.DigitosSub;
end;

procedure TFPregArtCompleto.DeshabilitarPunto;
begin
  FMain.DelComponentePunto(EFCtaComprasD);
  FMain.DelComponentePunto(EFCtaComprasH);
  FMain.DelComponentePunto(EFCtaVentasD);
  FMain.DelComponentePunto(EFCtaVentasH);
end;

procedure TFPregArtCompleto.EFArtDesdeChange(Sender: TObject);
begin
  EArticuloDesde.Text := DameTituloArticulo(EFArtDesde.Text);
end;

procedure TFPregArtCompleto.EFArtHastaChange(Sender: TObject);
begin
  EArticuloHasta.Text := DameTituloArticulo(EFArtHasta.Text);
end;

{ Habilitar / Deshabilitar Campos }
procedure TFPregArtCompleto.ChkArticulosClick(Sender: TObject);
begin
  inherited;
  if ChkArticulos.State = cbChecked then
  begin
     EFArtDesde.Enabled := True;
     EFArtDesde.Color := clWindow;
     EFArtDesde.Font.Color := clWindowText;
     EFArtHasta.Enabled := True;
     EFArtHasta.Color := clWindow;
     EFArtHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFArtDesde.Enabled := False;
     EFArtDesde.Color := clInfoBk;
     EFArtDesde.Font.Color := clGrayText;
     EFArtHasta.Enabled := False;
     EFArtHasta.Color := clInfoBk;
     EFArtHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregArtCompleto.ChkFamiliasClick(Sender: TObject);
begin
  inherited;
  if ChkFamilias.State = cbChecked then
  begin
     EFFamiliaDesde.Enabled := True;
     EFFamiliaDesde.Color := clWindow;
     EFFamiliaDesde.Font.Color := clWindowText;
     EFFamiliaHasta.Enabled := True;
     EFFamiliaHasta.Color := clWindow;
     EFFamiliaHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFFamiliaDesde.Enabled := False;
     EFFamiliaDesde.Color := clInfoBk;
     EFFamiliaDesde.Font.Color := clGrayText;
     EFFamiliaHasta.Enabled := False;
     EFFamiliaHasta.Color := clInfoBk;
     EFFamiliaHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregArtCompleto.ChkCtaComprasClick(Sender: TObject);
begin
  inherited;
  if ChkCtaCompras.State = cbChecked then
  begin
     EFCtaComprasD.Enabled := True;
     EFCtaComprasD.Color := clWindow;
     EFCtaComprasD.Font.Color := clWindowText;
     EFCtaComprasH.Enabled := True;
     EFCtaComprasH.Color := clWindow;
     EFCtaComprasH.Font.Color := clWindowText;
  end
  else
  begin
     EFCtaComprasD.Enabled := False;
     EFCtaComprasD.Color := clInfoBk;
     EFCtaComprasD.Font.Color := clGrayText;
     EFCtaComprasH.Enabled := False;
     EFCtaComprasH.Color := clInfoBk;
     EFCtaComprasH.Font.Color := clGrayText;
  end;
end;

procedure TFPregArtCompleto.ChkCtaVentasClick(Sender: TObject);
begin
  inherited;
  if ChkCtaVentas.State = cbChecked then
  begin
     EFCtaVentasD.Enabled := True;
     EFCtaVentasD.Color := clWindow;
     EFCtaVentasD.Font.Color := clWindowText;
     EFCtaVentasH.Enabled := True;
     EFCtaVentasH.Color := clWindow;
     EFCtaVentasH.Font.Color := clWindowText;
  end
  else
  begin
     EFCtaVentasD.Enabled := False;
     EFCtaVentasD.Color := clInfoBk;
     EFCtaVentasD.Font.Color := clGrayText;
     EFCtaVentasH.Enabled := False;
     EFCtaVentasH.Color := clInfoBk;
     EFCtaVentasH.Font.Color := clGrayText;
  end;
end;

procedure TFPregArtCompleto.ChkTipoIVAClick(Sender: TObject);
begin
  inherited;
  if ChkTipoIVA.State = cbChecked then
  begin
     EFTipoIVADesde.Enabled := True;
     EFTipoIVADesde.Color := clWindow;
     EFTipoIVADesde.Font.Color := clWindowText;
     EFTipoIVAHasta.Enabled := True;
     EFTipoIVAHasta.Color := clWindow;
     EFTipoIVAHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFTipoIVADesde.Enabled := False;
     EFTipoIVADesde.Color := clInfoBk;
     EFTipoIVADesde.Font.Color := clGrayText;
     EFTipoIVAHasta.Enabled := False;
     EFTipoIVAHasta.Color := clInfoBk;
     EFTipoIVAHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregArtCompleto.ChkPCosteClick(Sender: TObject);
begin
  inherited;
  if ChkPCoste.State = cbChecked then
  begin
     EdPCosteDesde.Enabled := True;
     EdPCosteDesde.Color := clWindow;
     EdPCosteDesde.Font.Color := clWindowText;
     EdPCosteHasta.Enabled := True;
     EdPCosteHasta.Color := clWindow;
     EdPCosteHasta.Font.Color := clWindowText;
  end
  else
  begin
     EdPCosteDesde.Enabled := False;
     EdPCosteDesde.Color := clInfoBk;
     EdPCosteDesde.Font.Color := clGrayText;
     EdPCosteHasta.Enabled := False;
     EdPCosteHasta.Color := clInfoBk;
     EdPCosteHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregArtCompleto.EFFamiliaDesdeChange(Sender: TObject);
begin
  EFamiliaDesde.Text := DameTituloFamilia(EFFamiliaDesde.Text);
end;

procedure TFPregArtCompleto.EFFamiliaHastaChange(Sender: TObject);
begin
  EFamiliaHasta.Text := DameTituloFamilia(EFFamiliaHasta.Text);
end;

procedure TFPregArtCompleto.EFCtaComprasDChange(Sender: TObject);
begin
  ECtaComprasD.Text := DameTituloCuenta(EFCtaComprasD.Text);
end;

procedure TFPregArtCompleto.EFCtaComprasHChange(Sender: TObject);
begin
  ECtaComprasH.Text := DameTituloCuenta(EFCtaComprasH.Text);
end;

procedure TFPregArtCompleto.EFCtaVentasDChange(Sender: TObject);
begin
  ECtaVentasD.Text := DameTituloCuenta(EFCtaVentasD.Text);
end;

procedure TFPregArtCompleto.EFCtaVentasHChange(Sender: TObject);
begin
  ECtaVentasH.Text := DameTituloCuenta(EFCtaVentasH.Text);
end;

procedure TFPregArtCompleto.EFTipoIVADesdeChange(Sender: TObject);
begin
  if (TEditFind2000(Sender).Text > '') then
     DMLstArticulos.RefrescaTipoIVA(DMLstArticulos.xTipoIvaD, EFTipoIVADesde.Text);
end;

procedure TFPregArtCompleto.EFTipoIVAHastaChange(Sender: TObject);
begin
  if (TEditFind2000(Sender).Text > '') then
     DMLstArticulos.RefrescaTipoIVA(DMLstArticulos.xTipoIvaH, EFTipoIVAHasta.Text);
end;

procedure TFPregArtCompleto.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Filtro : string[6];
begin
  Filtro := '000000';
  if (ChkArticulos.State = cbChecked) then
     Filtro[1] := '1';
  if (ChkFamilias.State = cbChecked) then
     Filtro[2] := '1';
  if (ChkCtaCompras.State = cbChecked) then
     Filtro[3] := '1';
  if (ChkCtaVentas.State = cbChecked) then
     Filtro[4] := '1';
  if (ChkTipoIVA.State = cbChecked) then
     Filtro[5] := '1';
  if (ChkPCoste.State = cbChecked) then
     Filtro[6] := '1';

  DMLstArticulos.MostrarListado(EFArtDesde.Text, EFArtHasta.Text,
     EFFamiliaDesde.Text, EFFamiliaHasta.Text,
     EFCtaComprasD.Text, EFCtaComprasH.Text, EFCtaVentasD.Text, EFCtaVentasH.Text,
     EFTipoIVADesde.Text, EFTipoIVAHasta.Text, EdPCosteDesde.Text, EdPCosteHasta.Text,
     Filtro, Modo, RBOrdenado.ItemIndex);
end;

{ Expandir Cuentas Contables }
procedure TFPregArtCompleto.EFCtaComprasDExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCtaComprasD);
end;

procedure TFPregArtCompleto.EFCtaComprasDKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCtaComprasD);
end;

procedure TFPregArtCompleto.EFCtaComprasHExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCtaComprasH);
end;

procedure TFPregArtCompleto.EFCtaComprasHKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCtaComprasH);
end;

procedure TFPregArtCompleto.EFCtaVentasDExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCtaVentasD);
end;

procedure TFPregArtCompleto.EFCtaVentasDKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCtaVentasD);
end;

procedure TFPregArtCompleto.EFCtaVentasHExit(Sender: TObject);
begin
  ExpandirCadenaEdit(EFCtaVentasH);
end;

procedure TFPregArtCompleto.EFCtaVentasHKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(EFCtaVentasH);
end;

end.
