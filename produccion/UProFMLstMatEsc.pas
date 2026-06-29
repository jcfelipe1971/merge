unit UProFMLstMatEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, Mask, rxToolEdit, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFActionList, ULFComboBox, ULFEdit,
  ULFPanel, ULFPageControl, ULFToolBar, ULFDBEdit, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UFPEditListado,
  ULFDBEditFind2000, ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TProFMLstMatEsc = class(TFPEditListadoSfg)
     GBComponente: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     LFDescArticulo: TLFEdit;
     EFArticuloHasta: TLFEditFind2000;
     LFDescArticuloHasta: TLFEdit;
     EFArticuloDesde: TLFEditFind2000;
     GBEsc: TGroupBox;
     LblAlmDesde: TLFLabel;
     LblAlmHasta: TLFLabel;
     LFPorDefecto: TLFCheckBox;
     LFDescCompDesde: TLFEdit;
     LFDescCompHasta: TLFEdit;
     DBEFCompDesde: TLFEditFind2000;
     DBEFCompHasta: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloDesdeChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure DBEFCompDesdeChange(Sender: TObject);
     procedure DBEFCompHastaChange(Sender: TObject);
     procedure EFArticuloHastaChange(Sender: TObject);
     procedure LFPorDefectoChange(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMLstMatEsc : TProFMLstMatEsc;

implementation

uses UDMMain, UProDMLstMatEsc, UFormGest, UEntorno;

{$R *.dfm}

procedure TProFMLstMatEsc.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLstMatEsc, ProDMLstMatEsc);
  ARecargar.Execute;
  EFArticuloDesde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  EFArticuloHasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  DBEFCompDesde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  DBEFCompHasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  Listado := ProDMLstMatEsc.frListadoN;
end;

procedure TProFMLstMatEsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstMatEsc);
end;

procedure TProFMLstMatEsc.EFArticuloDesdeChange(Sender: TObject);
begin
  inherited;
  LFDescArticulo.Text := ProDMLstMatEsc.BuscaDesc('ART_ARTICULOS', EFArticuloDesde.Text);
  TButtPrevisualizar.Enabled := True;
  if (LFDescArticulo.Text = ' ') then
     TButtPrevisualizar.Enabled := False;
end;

procedure TProFMLstMatEsc.FormShow(Sender: TObject);
begin
  inherited;
  TDPFechaListado.Date := Date;
  TButtPrevisualizar.Enabled := False;
  EFArticuloDesde.Clear;
  EFArticuloHasta.Clear;
  EFArticuloDesde.SetFocus;
  DBEFCompDesde.Text := '.';
  DBEFCompHasta.Text := '¿?';
end;

procedure TProFMLstMatEsc.APrevExecute(Sender: TObject);
begin
  inherited;
  ProDMLstMatEsc.MostrarListado(0, EFArticuloDesde.Text, EFArticuloHasta.Text,
     DBEFCompDesde.Text, DBEFCompHasta.Text);
end;

procedure TProFMLstMatEsc.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Grupo := 8050;
  ProDMLstMatEsc.grupo := Grupo;
end;

procedure TProFMLstMatEsc.DBEFCompDesdeChange(Sender: TObject);
begin
  inherited;
  LFDescCompDesde.Text := ProDMLstMatEsc.BuscaDesc('VER_ARTICULOS_CUENTAS', DBEFCompDesde.Text);
end;

procedure TProFMLstMatEsc.DBEFCompHastaChange(Sender: TObject);
begin
  inherited;
  LFDescCompHasta.Text := ProDMLstMatEsc.BuscaDesc('VER_ARTICULOS_CUENTAS', DBEFCompHasta.Text);
end;

procedure TProFMLstMatEsc.EFArticuloHastaChange(Sender: TObject);
begin
  inherited;
  LFDescArticuloHasta.Text := ProDMLstMatEsc.BuscaDesc('ART_ARTICULOS', EFArticuloHasta.Text);
end;

procedure TProFMLstMatEsc.LFPorDefectoChange(Sender: TObject);
{var
  a : integer;}
begin
  inherited;
  if (LFPorDefecto.State = cbChecked) then
     ProDMLstMatEsc.PorDefecto := 1
  else
     ProDMLstMatEsc.PorDefecto := 0;
end;

procedure TProFMLstMatEsc.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ProDMLstMatEsc.MostrarListado(1, EFArticuloDesde.Text, EFArticuloHasta.Text,
     DBEFCompDesde.Text, DBEFCompHasta.Text);
end;

end.
