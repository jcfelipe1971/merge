unit UProFMLstInformeMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ComCtrls, ActnList, ULFActionList,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFDBEdit, ULFEditFind2000, UFPEditListadoSfg, ULFLabel, rxToolEdit,
  ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, DBGrids, DateUtils, ULFDateEdit,
  rxPlacemnt, ULFFormStorage;

type
  TProFMLstInformeMarcajes = class(TFPEditListadoSfg)
     TabSheet1: TTabSheet;
     AConfigLst: TAction;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DeFechaDesde: TLFDateEdit;
     DeFechaHasta: TLFDateEdit;
     LFDBMaquinaDesde: TLFEditFind2000;
     LFDBMaquinaHasta: TLFEditFind2000;
     LDesdeMaquina: TLFLabel;
     LHastaMaquina: TLFLabel;
     EMaquinaD: TLFEdit;
     EMaquinaH: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure LFDBMaquinaDesdeChange(Sender: TObject);
     procedure LFDBMaquinaHastaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure EstablecerGrupo(aGrupo: integer);
  end;

var
  ProFMLstInformeMarcajes : TProFMLstInformeMarcajes;
  TipoListado : integer;

implementation

uses UDMMain, UFormGest, UProDMLstInformeMarcajes, UEntorno, UUtiles, UDameDato,
  UFMain;

{$R *.dfm}

procedure TProFMLstInformeMarcajes.FormCreate(Sender: TObject);
var
  year, month, day, dias : word;
begin
  inherited;
  AbreData(TProDMLstInformeMarcajes, ProDMLstInformeMarcajes);

  Listado := ProDMLstInformeMarcajes.frInformeMarcajes;

  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  DeFechaDesde.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DeFechaHasta.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  TDPFechaListado.Date := REntorno.FechaTrabSH;

  ARecargar.Execute;
end;

procedure TProFMLstInformeMarcajes.LFDBMaquinaDesdeChange(Sender: TObject);
begin
  inherited;
  EMaquinaD.Text := DameTituloMaquina(StrToIntDef(LFDBMaquinaDesde.Text, 0));
end;

procedure TProFMLstInformeMarcajes.LFDBMaquinaHastaChange(Sender: TObject);
begin
  inherited;
  EMaquinaH.Text := DameTituloMaquina(StrToIntDef(LFDBMaquinaHasta.Text, 0));
end;

procedure TProFMLstInformeMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstInformeMarcajes);
end;

procedure TProFMLstInformeMarcajes.APrevExecute(Sender: TObject);
begin
  if (Grupo = 8208) then
     ProDMLstInformeMarcajes.MostrarListadoInforme(0, StrToDate(DeFechaDesde.Text), StrToDate(DeFechaHasta.Text), StrToInt(LFDBMaquinaDesde.Text), StrToInt(LFDBMaquinaHasta.Text), EComentario.Text, TDPFechaListado.Date)
  else
     ProDMLstInformeMarcajes.MostrarListadoEficiencia(0, StrToDate(DeFechaDesde.Text), StrToDate(DeFechaHasta.Text), StrToInt(LFDBMaquinaDesde.Text), StrToInt(LFDBMaquinaHasta.Text), EComentario.Text, TDPFechaListado.Date);
end;

procedure TProFMLstInformeMarcajes.AImprimirExecute(Sender: TObject);
begin
  if (Grupo = 8208) then
     ProDMLstInformeMarcajes.MostrarListadoInforme(1, StrToDate(DeFechaDesde.Text), StrToDate(DeFechaHasta.Text), StrToInt(LFDBMaquinaDesde.Text), StrToInt(LFDBMaquinaHasta.Text), EComentario.Text, TDPFechaListado.Date)
  else
     ProDMLstInformeMarcajes.MostrarListadoEficiencia(1, StrToDate(DeFechaDesde.Text), StrToDate(DeFechaHasta.Text), StrToInt(LFDBMaquinaDesde.Text), StrToInt(LFDBMaquinaHasta.Text), EComentario.Text, TDPFechaListado.Date);
end;

procedure TProFMLstInformeMarcajes.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
begin
  inherited;
  ProDMLstInformeMarcajes.DameMinMaxMaquina(Min, Max);
  LFDBMaquinaDesde.Text := IntToStr(Min);
  LFDBMaquinaHasta.Text := IntToStr(Max);
end;

procedure TProFMLstInformeMarcajes.EstablecerGrupo(aGrupo: integer);
begin
  Grupo := aGrupo;
end;

end.
