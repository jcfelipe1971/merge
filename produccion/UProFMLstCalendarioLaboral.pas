unit UProFMLstCalendarioLaboral;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ULFLabel, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFDateEdit,
  rxPlacemnt, ULFFormStorage;

type
  TProFMLstCalendarioLaboral = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     LabelFechaD: TLFLabel;
     DTFechaD: TLFDateEdit;
     LabelFechaH: TLFLabel;
     DTFEchaH: TLFDateEdit;
     PNLLimites: TLFPanel;
     EFOperarioD: TLFEditFind2000;
     EOperarioD: TLFEdit;
     EOperarioH: TLFEdit;
     EFOperarioH: TLFEditFind2000;
     LDesdeOperario: TLFLabel;
     LHastaOperario: TLFLabel;
     procedure EFOperarioDChange(Sender: TObject);
     procedure EFOperarioHChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
     procedure Imprimir(Modo: integer);
  public
     { Public declarations }
  end;

var
  ProFMLstCalendarioLaboral : TProFMLstCalendarioLaboral;

implementation

uses UProDMLstCalendarioLaboral, UFormGest, UDMMain, FIBQuery, UEntorno, DateUtils, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMLstCalendarioLaboral.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
begin
  inherited;
  AbreData(TProDMLstCalendarioLaboral, ProDMLstCalendarioLaboral);
  PNLTop.Visible := True;

  Grupo := 172;
  Listado := ProDMLstCalendarioLaboral.frCalendarioLaboral;
  ARecargarExecute(Sender);

  // Agafo el mes el primer dia del mes i el últim
  DecodeDate(Date, Year, Month, Day);
  DTFechaD.Date := EncodeDate(Year, Month, 1);
  DTFechaH.Date := EncodeDate(Year, Month, DaysInAMonth(Year, Month));
  TDPFechaListado.Date := Date;
end;

procedure TProFMLstCalendarioLaboral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstCalendarioLaboral);
end;

procedure TProFMLstCalendarioLaboral.EFOperarioDChange(Sender: TObject);
begin
  inherited;
  EOperarioD.Text := DameTituloEmpleado(StrToIntDef(EFOperarioD.Text, 0));
end;

procedure TProFMLstCalendarioLaboral.EFOperarioHChange(Sender: TObject);
begin
  inherited;
  EOperarioH.Text := DameTituloEmpleado(StrToIntDef(EFOperarioH.Text, 0));
end;

procedure TProFMLstCalendarioLaboral.APrevExecute(Sender: TObject);
begin
  inherited;
  Imprimir(TAction(Sender).Tag);
end;

procedure TProFMLstCalendarioLaboral.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
begin
  inherited;
  // Operario
  DameMinMax('EMP', Min, Max);
  EFOperarioD.Text := IntToStr(Min);
  EFOperarioH.Text := IntToStr(Max);
end;

procedure TProFMLstCalendarioLaboral.AImprimirExecute(Sender: TObject);
begin
  inherited;
  Imprimir(TAction(Sender).Tag);
end;

procedure TProFMLstCalendarioLaboral.Imprimir(Modo: integer);
begin
  inherited;
  BarraHabilitada(False);
  try
     ProDMLstCalendarioLaboral.MostrarListado(Modo, StrToInt(EFOperarioD.Text), StrToInt(EFOperarioH.Text), DTFechaD.Date, DTFechaH.Date, EComentario.Text, TDPFechaListado.Date);
  finally
     BarraHabilitada(True);
  end;
end;

end.
