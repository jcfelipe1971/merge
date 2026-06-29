unit UFPregOrdenesDePago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Ufpeditlistado, ActnList, ComCtrls, ToolWin, UDBDateTimePicker, StdCtrls,
  Mask, DBCtrls, UHYEdits, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxToolEdit, ULFPanel, ULFDBEdit,
  ULFActionList, ULFPageControl, ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregOrdenesDePago = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     EFOrden: TLFEditFind2000;
     LBLOrden: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtRecargarClick(Sender: TObject);
  private
     { Private declarations }
     NumOrden: integer;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(aNumOrden: integer);
  end;

var
  FPregOrdenesDePago : TFPregOrdenesDePago;

implementation

uses UDMMain, UDMLstOrdenesDePago, UFormGest, UFMListConfig;

{$R *.DFM}

procedure TFPregOrdenesDePago.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstOrdenesDePago, DMLstOrdenesDePago);

  Grupo := 522;
  Listado := DMLstOrdenesDePago.frOrdenesDePago;
  ListadoFR3 := DMLstOrdenesDePago.frxOrdenesDePago;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregOrdenesDePago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstOrdenesDePago);
end;

procedure TFPregOrdenesDePago.Muestra(aNumOrden: integer);
begin
  NumOrden := aNumOrden;
  EFOrden.Text := IntToStr(NumOrden);
  ShowModal;
end;

procedure TFPregOrdenesDePago.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstOrdenesDePago.MuestraListado(Modo, StrToIntDef(EFOrden.Text, 0));
end;

procedure TFPregOrdenesDePago.TButtRecargarClick(Sender: TObject);
begin
  inherited;
  EFOrden.Text := IntToStr(NumOrden);
end;

end.
