unit UCrmFMLstSegAccionesContacto;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ULFLabel, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ULFDateEdit, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Fr_HYReport,
  rxPlacemnt, ULFFormStorage, DateUtils;

type
  TCrmFMLstSegAccContactos = class(TFPEditListadoSfg)
     PNLCentral: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LContacto: TLFLabel;
     LFDesdeContacto: TLFEditFind2000;
     LFechaIni: TLFDateEdit;
     LFechaFin: TLFDateEdit;
     LDesdeAccion: TLFLabel;
     LFDesdeAccion: TLFEditFind2000;
     LFHastaAccion: TLFEditFind2000;
     LHastaAccion: TLFLabel;
     HContacto: TLFLabel;
     LFHastaContacto: TLFEditFind2000;
     ETituloHastaContacto: TLFEdit;
     ETituloDesdeContacto: TLFEdit;
     ETituloDesdeAccion: TLFEdit;
     ETituloHastaAccion: TLFEdit;
     LDesdeTipoAccion: TLFLabel;
     LHastaTipoAccion: TLFLabel;
     LFDesdeTipoAccion: TLFEditFind2000;
     ETituloDesdeTipoAccion: TLFEdit;
     ETituloHastaTipoAccion: TLFEdit;
     LFHastaTipoAccion: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure LFDesdeContactoChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimirExecute(Sender: TObject);
     procedure LFHastaContactoChange(Sender: TObject);
     procedure LFDesdeAccionChange(Sender: TObject);
     procedure LFHastaAccionChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure LFHastaTipoAccionChange(Sender: TObject);
     procedure LFDesdeTipoAccionChange(Sender: TObject);
  private
     { Private declarations }
     procedure RecargarFiltros;
  public
     { Public declarations }
  end;

var
  CrmFMLstSegAccContactos : TCrmFMLstSegAccContactos;

implementation

uses UFormGest, UFMListConfig, UCrmDMLstSegAccionesContacto, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TCrmFMLstSegAccContactos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMLstSegAccContactos, CrmDMLstSegAccContactos);

  Grupo := 8203;
  Listado := CrmDMLstSegAccContactos.frListadoAccSeg;

  RecargarFiltros;
end;

procedure TCrmFMLstSegAccContactos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMLstSegAccContactos);
end;

procedure TCrmFMLstSegAccContactos.LFDesdeContactoChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeContacto.Text := DameTituloContactoCRM(StrToIntDef(LFDesdeContacto.Text, 0));
end;

procedure TCrmFMLstSegAccContactos.APrevExecute(Sender: TObject);
begin
  inherited;
  CrmDMLstSegAccContactos.MostrarListado(StrToIntDef(LFDesdeContacto.Text, 0), StrToIntDef(LFHastaContacto.Text, 0), StrToIntDef(LFDesdeAccion.Text, 0), StrToIntDef(LFHastaAccion.Text, 0),
     LFDesdeTipoAccion.Text, LFHastaTipoAccion.Text, LFechaIni.Date, LFechaFin.Date, TDPFechaListado.Date, EComentario.Text, 0, Grupo);
end;

procedure TCrmFMLstSegAccContactos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  CrmDMLstSegAccContactos.MostrarListado(StrToIntDef(LFDesdeContacto.Text, 0), StrToIntDef(LFHastaContacto.Text, 0), StrToIntDef(LFDesdeAccion.Text, 0), StrToIntDef(LFHastaAccion.Text, 0),
     LFDesdeTipoAccion.Text, LFHastaTipoAccion.Text, LFechaIni.Date, LFechaFin.Date, TDPFechaListado.Date, EComentario.Text, 1, Grupo);
end;

procedure TCrmFMLstSegAccContactos.LFHastaContactoChange(Sender: TObject);
begin
  inherited;
  ETituloHastaContacto.Text := DameTituloContactoCRM(StrToIntDef(LFHastaContacto.Text, 0));
end;

procedure TCrmFMLstSegAccContactos.LFDesdeAccionChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeAccion.Text := DameTituloAccionCRM(StrToIntDef(LFDesdeAccion.Text, 0));
end;

procedure TCrmFMLstSegAccContactos.LFHastaAccionChange(Sender: TObject);
begin
  inherited;
  ETituloHastaAccion.Text := DameTituloAccionCRM(StrToIntDef(LFHastaAccion.Text, 0));
end;

procedure TCrmFMLstSegAccContactos.ARecargarExecute(Sender: TObject);
begin
  inherited;
  RecargarFiltros;
end;

procedure TCrmFMLstSegAccContactos.RecargarFiltros;
var
  Desde, Hasta : integer;
  DesdeTipo, HastaTipo : string;
begin
  CrmDMLstSegAccContactos.DameMinMaxAccion(Desde, Hasta, DesdeTipo, HastaTipo);

  // Inicializamos con 0 ya que no es una FK y puede estar sin informar.
  // LFDesdeAccion.Text := IntToStr(Desde);
  LFDesdeAccion.Text := '0';
  LFHastaAccion.Text := IntToStr(Hasta);

  LFDesdeTipoAccion.Text := DesdeTipo;
  LFHastaTipoAccion.Text := HastaTipo;

  LFechaIni.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  LFechaFin.Date := EncodeDateTime(REntorno.Ejercicio, 12, 31, 23, 59, 59, 999);
end;

procedure TCrmFMLstSegAccContactos.LFHastaTipoAccionChange(Sender: TObject);
begin
  inherited;
  ETituloHastaTipoAccion.Text := DameTituloTipoAccionCRM(LFHastaTipoAccion.Text);
end;

procedure TCrmFMLstSegAccContactos.LFDesdeTipoAccionChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeTipoAccion.Text := DameTituloTipoAccionCRM(LFDesdeTipoAccion.Text);
end;

end.
