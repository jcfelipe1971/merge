unit UFPregConfirming;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Ufpeditlistado, ActnList, ComCtrls, ToolWin, UDBDateTimePicker, StdCtrls,
  Mask, DBCtrls, UHYEdits, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxToolEdit, ULFPanel, ULFDBEdit,
  ULFActionList, ULFPageControl, ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple, ULFEdit;

type
  TFPregConfirming = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     RGTipo: TRadioGroup;
     EFBanco: TLFEditFind2000;
     EBanco: TLFEdit;
     PNVencimiento: TLFPanel;
     DTPVencimiento: TLFDateEdit;
     LBLVencimiento: TLFLabel;
     procedure ARecargarExecute(Sender: TObject);
     procedure EFBancoChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure RGTipoClick(Sender: TObject);
  private
     { Private declarations }
     procedure CargarDatos;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra;
  end;

var
  FPregConfirming : TFPregConfirming;

implementation

uses UDMMain, UDMLstConfirming, UFormGest, UFMListConfig, UDameDato;

{$R *.DFM}

procedure TFPregConfirming.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstConfirming, DMLstConfirming);

  Grupo := 500;
  Listado := DMLstConfirming.frConfirming;
  ListadoFR3 := DMLstConfirming.frxConfirming;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregConfirming.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstConfirming);
end;

procedure TFPregConfirming.Muestra;
begin
  CargarDatos;
  ShowModal;
end;

procedure TFPregConfirming.ARecargarExecute(Sender: TObject);
begin
  inherited;
  CargarDatos;
end;

procedure TFPregConfirming.EFBancoChange(Sender: TObject);
begin
  inherited;
  EBanco.Text := DameTituloBanco(StrToIntDef(EFBanco.Text, 0));
end;

procedure TFPregConfirming.CargarDatos;
begin
  EFBanco.Text := '0';
  DTPVencimiento.Date := DMLstConfirming.DameVencimiento;
end;

procedure TFPregConfirming.RGTipoClick(Sender: TObject);
begin
  inherited;
  if (RGTipo.ItemIndex = 0) then
  begin
     EFBanco.Visible := True;
     EBanco.Visible := True;
  end
  else
  begin
     EFBanco.Visible := False;
     EBanco.Visible := False;
  end;
end;

procedure TFPregConfirming.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstConfirming.MuestraListado(Modo, RGTipo.ItemIndex, StrToIntDef(EFBanco.Text, 0),
     DTPVencimiento.Date);
end;

end.
