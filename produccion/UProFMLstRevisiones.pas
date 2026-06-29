unit UProFMLstRevisiones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ComCtrls, ActnList, ULFActionList,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFDBEdit, ULFEditFind2000, UFPEditListadoSfg, ULFLabel, rxToolEdit,
  ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, DBGrids, DateUtils, ULFDateEdit,
  TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt, ULFFormStorage;

type
  TProFMLstRevisiones = class(TFPEditListadoSfg)
     TabSheet1: TTabSheet;
     AConfigLst: TAction;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DeFechaDesde: TLFDateEdit;
     DeFechaHasta: TLFDateEdit;
     LHastaTipo: TLFLabel;
     LDesdeTipo: TLFLabel;
     LFDBMaquinaDesde: TLFEditFind2000;
     LFDBMaquinaHasta: TLFEditFind2000;
     LDesdeMaquina: TLFLabel;
     LHastaMaquina: TLFLabel;
     LFETipoD: TLFEditFind2000;
     DescTipoD: TLFDbedit;
     DescTipoH: TLFDbedit;
     LFETipoH: TLFEditFind2000;
     CBRevisados: TLFCheckBox;
     EDescMaquinaD: TLFEdit;
     EDescMaquinaH: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure LFDBMaquinaDesdeChange(Sender: TObject);
     procedure LFDBMaquinaHastaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure LFETipoDChange(Sender: TObject);
     procedure LFETipoHChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMLstRevisiones : TProFMLstRevisiones;

implementation

uses UDMMain, UFormGest, UProDMLstRevisiones, UEntorno,
  UFMain, UDameDato;

{$R *.dfm}

procedure TProFMLstRevisiones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLstRevisiones, ProDMLstRevisiones);

  Listado := ProDMLstRevisiones.frRevisiones;
  Grupo := 8204;

  DeFechaDesde.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DeFechaHasta.Date := RecodeDay(REntorno.FechaTrabSH, DaysInMonth(REntorno.FechaTrabSH));

  ARecargar.Execute;
end;

procedure TProFMLstRevisiones.LFDBMaquinaDesdeChange(Sender: TObject);
begin
  inherited;
  EDescMaquinaD.Text := DameTituloMaquina(StrToIntDef(LFDBMaquinaDesde.Text, 0));
end;

procedure TProFMLstRevisiones.LFDBMaquinaHastaChange(Sender: TObject);
begin
  inherited;
  EDescMaquinaH.Text := DameTituloMaquina(StrToIntDef(LFDBMaquinaHasta.Text, 0));
end;

procedure TProFMLstRevisiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstRevisiones);
end;

procedure TProFMLstRevisiones.APrevExecute(Sender: TObject);
begin
  inherited;
  ProDMLstRevisiones.MostrarListado(0, DeFechaDesde.Date, DeFechaHasta.Date, LFETipoD.Text,
     LFETipoH.Text, StrToInt(LFDBMaquinaDesde.Text), StrToInt(LFDBMaquinaHasta.Text), CBRevisados.Checked);
end;

procedure TProFMLstRevisiones.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ProDMLstRevisiones.MostrarListado(1, StrToDate(DeFechaDesde.Text), StrToDate(DeFechaHasta.Text), LFETipoD.Text,
     LFETipoH.Text, StrToInt(LFDBMaquinaDesde.Text), StrToInt(LFDBMaquinaHasta.Text), CBRevisados.Checked);
end;

procedure TProFMLstRevisiones.ARecargarExecute(Sender: TObject);
begin
  inherited;
  ProDMLstRevisiones.xMinTipo.Close;
  ProDMLstRevisiones.xMinTipo.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMLstRevisiones.xMinTipo.Open;

  LFETipoD.Text := ProDMLstRevisiones.xMinTipoTIPO.AsString;

  ProDMLstRevisiones.xMaxTipo.Close;
  ProDMLstRevisiones.xMaxTipo.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMLstRevisiones.xMaxTipo.Open;

  LFETipoH.Text := ProDMLstRevisiones.xMaxTipoTIPO.AsString;

  ProDMLstRevisiones.xMinMaquina.Close;
  ProDMLstRevisiones.xMinMaquina.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMLstRevisiones.xMinMaquina.Open;

  LFDBMaquinaDesde.Text := ProDMLstRevisiones.xMinMaquinaCODMAQ.AsString;

  ProDMLstRevisiones.xMaxMaquina.Close;
  ProDMLstRevisiones.xMaxMaquina.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMLstRevisiones.xMaxMaquina.Open;

  LFDBMaquinaHasta.Text := ProDMLstRevisiones.xMaxMaquinaCODMAQ.AsString;
end;

procedure TProFMLstRevisiones.LFETipoDChange(Sender: TObject);
begin
  inherited;
  ProDMLstRevisiones.xTipoD.Close;
  ProDMLstRevisiones.xTipoD.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMLstRevisiones.xTipoD.Params.ByName['tipod'].AsString := LFETipoD.Text;
  ProDMLstRevisiones.xTipoD.Open;
end;

procedure TProFMLstRevisiones.LFETipoHChange(Sender: TObject);
begin
  inherited;
  ProDMLstRevisiones.xTipoH.Close;
  ProDMLstRevisiones.xTipoH.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMLstRevisiones.xTipoH.Params.ByName['tipoh'].AsString := LFETipoH.Text;
  ProDMLstRevisiones.xTipoH.Open;
end;

end.
