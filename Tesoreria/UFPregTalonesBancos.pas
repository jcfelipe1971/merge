unit UFPregTalonesBancos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, DBCtrls, ULFDBEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Mask,
  rxToolEdit, ULFLabel, ExtCtrls, UControlEdit, UFormGest,
  ULFPanel, RXDBCtrl, ULFDBDateEdit, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TFPregTalonesBancos = class(TFPEditListado)
     TabSheet1: TTabSheet;
     Fecha_Desde: TLFLabel;
     Fecha_Hasta: TLFLabel;
     TBConfigurar: TToolButton;
     EFBancosD: TLFEditFind2000;
     LBLBancosD: TLFLabel;
     LBLHasta: TLFLabel;
     EFBancosH: TLFEditFind2000;
     DBETituloH: TLFDbedit;
     DBETituloD: TLFDbedit;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure EFBancosDChange(Sender: TObject);
     procedure EFBancosHChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregTalonesBancos : TFPregTalonesBancos;

implementation

uses UDMLstTalonesBancos, UDMMain, UUtiles;

{$R *.dfm}

procedure TFPregTalonesBancos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLSTTalonesBancos, DMLSTTalonesBancos);
  ARecargarExecute(Sender);
  Grupo := 9013;
  Listado := DMLstTalonesBancos.frTalonesBancos;
end;

procedure TFPregTalonesBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTTalonesBancos);
  Action := caFree;
end;

procedure TFPregTalonesBancos.ARecargarExecute(Sender: TObject);
var
  FechaDesde, FechaHasta : TDateTime;
begin
  inherited;
  DameMinMax('EJE', FechaDesde, FechaHasta);
  DTPFechaD.Date := FechaDesde;
  DTPFechaH.Date := FechaHasta;
  EFBancosD.Text := IntToStr(DMLstTalonesBancos.DameBancoD);
  EFBancosH.Text := IntToStr(DMLstTalonesBancos.DameBancoH);
end;

procedure TFPregTalonesBancos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLSTTalonesBancos.MostrarListado(StrToInt(EFBancosD.Text), StrToInt(EFBancosH.Text),
     StrToDate(DTPFechaD.Text), StrToDate(DTPFechaH.Text), 1);
end;

procedure TFPregTalonesBancos.APrevExecute(Sender: TObject);
begin
  inherited;
  DMLSTTalonesBancos.MostrarListado(StrToInt(EFBancosD.Text), StrToInt(EFBancosH.Text),
     StrToDate(DTPFechaD.Text), StrToDate(DTPFechaH.Text), 0);
end;

procedure TFPregTalonesBancos.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFPregTalonesBancos.EFBancosDChange(Sender: TObject);
begin
  inherited;
  DMLstTalonesBancos.CambiaBancoD(StrToIntDef(EFBancosD.Text, 0));
end;

procedure TFPregTalonesBancos.EFBancosHChange(Sender: TObject);
begin
  inherited;
  DMLstTalonesBancos.CambiaBancoH(StrToIntDef(EFBancosH.Text, 0));
end;

end.
