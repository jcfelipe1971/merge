unit UProFMLstNecesidades;

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
  TProFMLstNecesidades = class(TFPEditListadoSfg)
     GBAlmStock: TGroupBox;
     GBTipoLst: TGroupBox;
     ChkBSubordenes: TLFCheckBox;
     CBAgrupa: TRadioButton;
     CBFases: TRadioButton;
     GBOrden: TGroupBox;
     LblOrden: TLFLabel;
     LCompuesto: TLFLabel;
     EFIdOrden: TLFEditFind2000;
     DBEArtOrd: TLFDbedit;
     EArtDesc: TLFDBedit;
     LblAlmDesde: TLFLabel;
     LblAlmHasta: TLFLabel;
     EFAlmDesde: TLFEditFind2000;
     EFAlmHasta: TLFEditFind2000;
     EDescAlmDesde: TLFEdit;
     EDescAlmHasta: TLFEdit;
     ChkBEquivalencias: TLFCheckBox;
     PNLLimites: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFIdOrdenChange(Sender: TObject);
     procedure EFIdOrdenKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure CBAgrupaClick(Sender: TObject);
     procedure CBFasesClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFAlmDesdeChange(Sender: TObject);
     procedure EFAlmHastaChange(Sender: TObject);
     procedure EFIdOrdenBusqueda(Sender: TObject);
  private
     { Private declarations }
     procedure MostrarListado(Modo: smallint);
  public
     { Public declarations }
     procedure Inicializar(IdOrden: integer);
  end;

var
  ProFMLstNecesidades : TProFMLstNecesidades;

implementation

uses UDMMain, UProDMLstNecesidades, UFormGest, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMLstNecesidades.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLSTNecesidades, ProDMLSTNecesidades);
  Listado := ProDMLstNecesidades.frListadoN;
  ARecargar.Execute;
end;

procedure TProFMLstNecesidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstNecesidades);
end;

procedure TProFMLstNecesidades.FormShow(Sender: TObject);
begin
  inherited;
  TDPFechaListado.Date := Date;
  TButtPrevisualizar.Enabled := False;
  EFIdOrden.Clear;
  EFIdOrden.SetFocus;
end;

procedure TProFMLstNecesidades.EFIdOrdenChange(Sender: TObject);
begin
  inherited;
  if (EFIdOrden.Text <> '') then
  begin
     ProDMLstNecesidades.CambiaOrden(StrToIntDef(EFIdOrden.Text, 0));
     TButtPrevisualizar.Enabled := True;
  end;
end;

procedure TProFMLstNecesidades.EFIdOrdenKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if ((Sender as TEdit).Text <> '') then
     TButtPrevisualizar.Enabled := True
  else
     TButtPrevisualizar.Enabled := False;
end;

procedure TProFMLstNecesidades.MostrarListado(Modo: smallint);
begin
  if (EFIdOrden.Text <> '') then
  begin
     ProDMLstNecesidades.MostrarListado(Modo, Grupo, StrToInt(EFIdOrden.Text), StrToInt(EFIdOrden.Text), EFAlmDesde.Text, EFAlmHasta.Text, EComentario.Text, TDPFechaListado.Date, ChkBEquivalencias.Checked, ChkBSubordenes.Checked, CBFases.Checked, CBAgrupa.Checked);
  end;
end;

procedure TProFMLstNecesidades.APrevExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(0);
end;

procedure TProFMLstNecesidades.AImprimirExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(1);
end;

procedure TProFMLstNecesidades.CBAgrupaClick(Sender: TObject);
begin
  inherited;
  Grupo := 8017;
  ChkBEquivalencias.Enabled := False;
end;

procedure TProFMLstNecesidades.CBFasesClick(Sender: TObject);
begin
  inherited;
  Grupo := 8026;
  ChkBEquivalencias.Enabled := True;
end;

procedure TProFMLstNecesidades.ARecargarExecute(Sender: TObject);
var
  Min, Max : string;
begin
  inherited;
  Grupo := 8017;
  ProDMLstNecesidades.Grupo := Grupo;

  CBAgrupa.Checked := True;
  ChkBEquivalencias.Enabled := not CBAgrupa.Checked;

  DameMinMax('ALM', Min, Max);
  EFAlmDesde.Text := Min;
  EFAlmHasta.Text := Max;
end;

procedure TProFMLstNecesidades.EFAlmDesdeChange(Sender: TObject);
begin
  inherited;
  EDescAlmDesde.Text := DameTituloAlmacen(EFAlmDesde.Text);
end;

procedure TProFMLstNecesidades.EFAlmHastaChange(Sender: TObject);
begin
  inherited;
  EDescAlmHasta.Text := DameTituloAlmacen(EFAlmHasta.Text);
end;

procedure TProFMLstNecesidades.EFIdOrdenBusqueda(Sender: TObject);
begin
  inherited;
  // Només es filtraran les OF obertes
  if (EFIdOrden.Tabla_A_Buscar) = 'PRO_ORD' then
     EFIdOrden.CondicionBusqueda := 'SITUACION < 4';
end;

procedure TProFMLstNecesidades.Inicializar(IdOrden: integer);
begin
  EFIdOrden.Text := IntToStr(IdOrden);
end;

end.
