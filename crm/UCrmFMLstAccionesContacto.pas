unit UCrmFMLstAccionesContacto;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ULFLabel, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ULFDateEdit, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Fr_HYReport,
  rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit, ULFCheckBox;

type
  TCrmFMLstAccContactos = class(TFPEditListadoSfg)
     LFPanelCentral: TLFPanel;
     LDesdeContacto: TLFLabel;
     EFDesdeContacto: TLFEditFind2000;
     ETituloDesdeContacto: TLFEdit;
     ETituloHastaContacto: TLFEdit;
     EFHastaContacto: TLFEditFind2000;
     LHastaContacto: TLFLabel;
     ETituloZona: TLFEdit;
     EFZona: TLFEditFind2000;
     LZona: TLFLabel;
     CBZona: TLFCheckBox;
     CBAmbito: TLFCheckBox;
     EFAmbito: TLFEditFind2000;
     DBEAmbito: TLFDbedit;
     LAmbito: TLFLabel;
     CBOrdenPoblacion: TLFCheckBox;
     CBPais: TLFCheckBox;
     LPais: TLFLabel;
     EFPais: TLFEditFind2000;
     ETituloPais: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFDesdeContactoChange(Sender: TObject);
     procedure EFHastaContactoChange(Sender: TObject);
     procedure EFZonaChange(Sender: TObject);
     procedure EFAmbitoChange(Sender: TObject);
     procedure CBZonaChange(Sender: TObject);
     procedure CBAmbitoChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBPaisClick(Sender: TObject);
     procedure EFPaisChange(Sender: TObject);
  private
     { Private declarations }
     grupo: integer;
     Listado: TfrHYReport;
  public
     { Public declarations }
  end;

var
  CrmFMLstAccContactos : TCrmFMLstAccContactos;

implementation

uses UCrmDMLstAccionesContacto, UFormGest, UFMListConfig, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TCrmFMLstAccContactos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMLstAccContactos, CrmDMLstAccContactos);

  grupo := 8202;
  listado := CrmDMLstAccContactos.frListadoAcc;
  ARecargar.Execute;
end;

procedure TCrmFMLstAccContactos.EFDesdeContactoChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeContacto.Text := DameTituloContactoCRM(StrToIntDef(EFDesdeContacto.Text, 0));
end;

procedure TCrmFMLstAccContactos.EFHastaContactoChange(Sender: TObject);
begin
  inherited;
  ETituloHastaContacto.Text := DameTituloContactoCRM(StrToIntDef(EFHastaContacto.Text, 0));
end;

procedure TCrmFMLstAccContactos.EFZonaChange(Sender: TObject);
begin
  inherited;
  ETituloZona.Text := DameTituloZona(EFZona.Text);
end;

procedure TCrmFMLstAccContactos.EFAmbitoChange(Sender: TObject);
begin
  inherited;
  CrmDMLstAccContactos.xAmbito.Close;
  CrmDMLstAccContactos.xAmbito.Params.ByName['ambito'].AsInteger := StrToIntDef(EFAmbito.Text, 0);
  CrmDMLstAccContactos.xAmbito.Open;
end;

procedure TCrmFMLstAccContactos.APrevExecute(Sender: TObject);
begin
  inherited;
  CrmDMLstAccContactos.MostrarListado(StrToIntDef(EFDesdeContacto.Text, 0), StrToIntDef(EFHastaContacto.Text, 0), StrToIntDef(EFAmbito.Text, 0), 0,
     0, TDPFechaListado.Date, EComentario.Text, 0, grupo, EFZona.Text, EFPais.Text, CBZona.Checked, CBAmbito.Checked, CBOrdenPoblacion.Checked, CBPais.Checked);
end;

procedure TCrmFMLstAccContactos.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', Listado);
end;

procedure TCrmFMLstAccContactos.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TCrmFMLstAccContactos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMLstAccContactos);
  Action := caFree;
end;

procedure TCrmFMLstAccContactos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  CrmDMLstAccContactos.MostrarListado(StrToIntDef(EFDesdeContacto.Text, 0), StrToIntDef(EFDesdeContacto.Text, 0), StrToIntDef(EFAmbito.Text, 0), 0,
     0, TDPFechaListado.Date, EComentario.Text, 1, grupo, EFZona.Text, EFPais.Text, CBZona.Checked, CBAmbito.Checked, CBOrdenPoblacion.Checked, CBPais.Checked);
end;

procedure TCrmFMLstAccContactos.ARecargarExecute(Sender: TObject);
begin
  inherited;
  CrmDMLstAccContactos.Recargar;

  EFDesdeContacto.Text := CrmDMLstAccContactos.xContacto.FieldByName('MIN').AsString;
  EFHastaContacto.Text := CrmDMLstAccContactos.xContacto.FieldByName('MAX').AsString;
  EFZona.Text := CrmDMLstAccContactos.xZonaDefault.FieldByName('ZONA').AsString;
  EFAmbito.Text := CrmDMLstAccContactos.xAmbitoDefault.FieldByName('AMBITO').AsString;
  EFPais.Text := REntorno.Pais;

  TDPFechaListado.Text := DateToStr(Date);
end;

procedure TCrmFMLstAccContactos.CBZonaChange(Sender: TObject);
begin
  inherited;
  LZona.Visible := CBZona.Checked;
  EFZona.Visible := CBZona.Checked;
  ETituloZona.Visible := CBZona.Checked;
end;

procedure TCrmFMLstAccContactos.CBAmbitoChange(Sender: TObject);
begin
  inherited;
  LAmbito.Visible := CBAmbito.Checked;
  EFAmbito.Visible := CBAmbito.Checked;
  DBEAmbito.Visible := CBAmbito.Checked;
end;

procedure TCrmFMLstAccContactos.CBPaisClick(Sender: TObject);
begin
  inherited;
  LPais.Visible := CBPais.Checked;
  EFPais.Visible := CBPais.Checked;
  ETituloPais.Visible := CBPais.Checked;
end;

procedure TCrmFMLstAccContactos.EFPaisChange(Sender: TObject);
begin
  inherited;
  ETituloPais.Text := DameTituloPais(EFPais.Text);
end;

end.
