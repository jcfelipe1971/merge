unit UFPregRiesgoBancos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, UHYDescription,
  StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxToolEdit, ULFEdit, ULFDBEdit, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, ULFDateEdit, rxPlacemnt, ULFFormStorage,
  ExtCtrls, ULFPanel, UFPEditListadoSimple;

type
  TFPregRiesgoBancos = class(TFPEditListadoSimple)
     GBBancos: TGroupBox;
     GBFechas: TGroupBox;
     LBLBancosD: TLFLabel;
     LBLHasta: TLFLabel;
     LBLFechaD: TLFLabel;
     LBLFechaH: TLFLabel;
     EFBancosD: TLFEditFind2000;
     EFBancosH: TLFEditFind2000;
     TButtDisenar: TToolButton;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     GBDatos: TGroupBox;
     Comentario: TLFLabel;
     EComentario: TLFEdit;
     LBLFechaListado: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     Moneda: TLFLabel;
     DBLCBMoneda: TDBLookupComboBox;
     ETituloBancoDesde: TLFEdit;
     ETituloBancoHasta: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFBancosDChange(Sender: TObject);
     procedure EFBancosHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MostrarListado(Modo: byte);
  public
     { Public declarations }
  end;

var
  FPregRiesgoBancos : TFPregRiesgoBancos;

implementation

uses UDMMain, UUtiles, UFMListConfig, UFormGest, UDMLstRiesgoBancos,
  UEntorno, UDameDato;

{$R *.dfm}

procedure TFPregRiesgoBancos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstRiesgoBancos, DMLstRiesgoBancos);
  ARecargarExecute(Sender);

  Grupo := 202;
  Listado := DMLstRiesgoBancos.frRiesgoBancos;
  ListadoFR3 := DMLstRiesgoBancos.frxRiesgoBancos;
end;

procedure TFPregRiesgoBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstRiesgoBancos);
end;

procedure TFPregRiesgoBancos.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
  MinDate, MaxDate : TDateTime;
begin
  DameMinMax('BAN', Min, Max);
  EFBancosD.Text := IntToStr(Min);
  EFBancosH.Text := IntToStr(Max);
  DameMinMax('EJE', MinDate, MaxDate);
  DTPFechaD.Date := MinDate; // REntorno.FechaTrabSH;
  DTPFechaH.Date := MaxDate; // REntorno.FechaTrabSH + 10;
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
  DBLCBMoneda.KeyValue := REntorno.Moneda;
end;

procedure TFPregRiesgoBancos.EFBancosDChange(Sender: TObject);
begin
  ETituloBancoDesde.Text := DameTituloBanco(StrToIntDef(EFBancosD.Text, 0));
end;

procedure TFPregRiesgoBancos.EFBancosHChange(Sender: TObject);
begin
  ETituloBancoHasta.Text := DameTituloBanco(StrToIntDef(EFBancosH.Text, 0));
end;

procedure TFPregRiesgoBancos.APrevExecute(Sender: TObject);
begin
  MostrarListado(0);
end;

procedure TFPregRiesgoBancos.AImprimirExecute(Sender: TObject);
begin
  MostrarListado(1);
end;

procedure TFPregRiesgoBancos.MostrarListado(Modo: byte);
begin
  DMLstRiesgoBancos.MostrarListadoFiltrado(Modo, StrToInt(EFBancosD.Text),
     StrToInt(EFBancosH.Text),
     DTPFechaD.Date, DTPFechaH.Date, DTPFechaListado.Date, EComentario.Text);
end;

end.
