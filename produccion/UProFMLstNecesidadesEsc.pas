unit UProFMLstNecesidadesEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, Mask, rxToolEdit, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFActionList, ULFComboBox, ULFEdit,
  ULFPanel, ULFPageControl, ULFToolBar, ULFDBEdit, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TProFMLstNecesidadesEsc = class(TFPEditListadoSfg)
     GBAlmStock: TGroupBox;
     GBTipoLst: TGroupBox;
     ChkBSubescandallo: TLFCheckBox;
     CBAgrupa: TRadioButton;
     CBFases: TRadioButton;
     GBOrden: TGroupBox;
     LblOrden: TLFLabel;
     LCompuesto: TLFLabel;
     EFEscandallo: TLFEditFind2000;
     DBEArtOrd: TLFDbedit;
     DBEArtDesc: TLFDbedit;
     LblAlmDesde: TLFLabel;
     LblAlmHasta: TLFLabel;
     EFAlmDesde: TLFEditFind2000;
     EFAlmHasta: TLFEditFind2000;
     EDescAlmDesde: TLFEdit;
     EDescAlmHasta: TLFEdit;
     ChkBEquivalencias: TLFCheckBox;
     LMultiplicador: TLFLabel;
     EMultiplicador: TLFEdit;
     PNLLimites: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFEscandalloChange(Sender: TObject);
     procedure EFEscandalloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure CBAgrupaClick(Sender: TObject);
     procedure CBFasesClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFAlmDesdeChange(Sender: TObject);
     procedure EFAlmHastaChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
     procedure HabilitaPrevisualizacion(Habilitado: boolean);
  public
     { Public declarations }
     procedure Inicializar(Escandallo: integer; Multiplicador: double);
  end;

var
  ProFMLstNecesidadesEsc : TProFMLstNecesidadesEsc;

implementation

uses UDMMain, UProDMLstNecesidadesEsc, UFormGest, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMLstNecesidadesEsc.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLSTNecesidadesEsc, ProDMLSTNecesidadesEsc);

  ARecargar.Execute;
  Listado := ProDMLstNecesidadesEsc.frListadoN;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TProFMLstNecesidadesEsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstNecesidadesEsc);
end;

procedure TProFMLstNecesidadesEsc.FormShow(Sender: TObject);
begin
  inherited;
  TDPFechaListado.Date := Date;
  TButtPrevisualizar.Enabled := False;
  EFEscandallo.Clear;
  if (EFEscandallo.CanFocus) then
     EFEscandallo.SetFocus;
end;

procedure TProFMLstNecesidadesEsc.EFEscandalloChange(Sender: TObject);
begin
  inherited;
  if (EFEscandallo.Text <> '') then
     ProDMLstNecesidadesEsc.CambiaEscandallo(StrToInt(EFEscandallo.Text));

  HabilitaPrevisualizacion(Trim((Sender as TEdit).Text) <> '');
end;

procedure TProFMLstNecesidadesEsc.HabilitaPrevisualizacion(Habilitado: boolean);
begin
  inherited;
  TButtPrevisualizar.Enabled := Habilitado;
  TButtImprimir.Enabled := Habilitado;
end;

procedure TProFMLstNecesidadesEsc.EFEscandalloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  HabilitaPrevisualizacion(Trim((Sender as TEdit).Text) <> '');
end;

procedure TProFMLstNecesidadesEsc.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if (EFEscandallo.Text <> '') then
     ProDMLstNecesidadesEsc.MostrarListado(Modo, Grupo, StrToInt(EFEscandallo.Text), EFAlmDesde.Text, EFAlmHasta.Text, EComentario.Text, TDPFechaListado.Date, StrToFloatDef(EMultiplicador.Text, 1), ChkBEquivalencias.Checked, ChkBSubescandallo.Checked, CBFases.Checked, CBAgrupa.Checked);
end;

procedure TProFMLstNecesidadesEsc.CBAgrupaClick(Sender: TObject);
begin
  inherited;
  Grupo := 8048;
  ChkBEquivalencias.Enabled := False;
end;

procedure TProFMLstNecesidadesEsc.CBFasesClick(Sender: TObject);
begin
  inherited;
  Grupo := 8049;
  ChkBEquivalencias.Enabled := True;
end;

procedure TProFMLstNecesidadesEsc.ARecargarExecute(Sender: TObject);
var
  Min, Max : string;
begin
  inherited;
  Grupo := 8048;

  CBAgrupa.Checked := True;
  ChkBEquivalencias.Enabled := not CBAgrupa.Checked;

  DameMinMax('ALM', Min, Max);
  EFAlmDesde.Text := Min;
  EFAlmHasta.Text := Max;
end;

procedure TProFMLstNecesidadesEsc.EFAlmDesdeChange(Sender: TObject);
begin
  inherited;
  EDescAlmDesde.Text := DameTituloAlmacen(EFAlmDesde.Text);
end;

procedure TProFMLstNecesidadesEsc.EFAlmHastaChange(Sender: TObject);
begin
  inherited;
  EDescAlmHasta.Text := DameTituloAlmacen(EFAlmHasta.Text);
end;

procedure TProFMLstNecesidadesEsc.Inicializar(Escandallo: integer; Multiplicador: double);
begin
  EFEscandallo.Text := IntToStr(Escandallo);
  EMultiplicador.Text := FormatFloat('0.00', Multiplicador);
end;

end.
