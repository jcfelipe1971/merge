unit UFMRemesasPagoGastos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, ToolWin, StdCtrls, Mask, DBCtrls,
  UDBDateTimePicker, UControlEdit, UFormGest, rxToolEdit, ULFToolBar,
  ULFLabel, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFDateEdit;

type
  TFMRemesasPagoGastos = class(TG2KForm)
     TBMain: TLFToolBar;
     EPMain: THYMEditPanel;
     TButtConfirmar: TToolButton;
     DTPFechaImpagado: TLFDateEdit;
     LBLFechaPago: TLFLabel;
     EFDigito_1: TLFEditFind2000;
     EFDigito_2: TLFEditFind2000;
     EFDigito_3: TLFEditFind2000;
     EFDigito_4: TLFEditFind2000;
     EFDigito_5: TLFEditFind2000;
     LCentroCoste: TLFLabel;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function ElegirpagoRemesa(var fecha: TDateTime; var d1, d2, d3, d4, d5: string; TituloVentana: string): boolean;
  end;

var
  FMRemesasPagoGastos : TFMRemesasPagoGastos;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TFMRemesasPagoGastos.TButtConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFMRemesasPagoGastos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

function TFMRemesasPagoGastos.ElegirPagoRemesa(var fecha: TDateTime; var d1, d2, d3, d4, d5: string; TituloVentana: string): boolean;
begin
  Caption := TituloVentana;
  Result := False;
  DTPFechaImpagado.Date := REntorno.FechaTrabSH;
  if ShowModal = mrOk then
  begin
     fecha := Trunc(DTPFechaImpagado.Date);
     d1 := EFDigito_1.Text;
     d2 := EFDigito_2.Text;
     d3 := EFDigito_3.Text;
     d4 := EFDigito_4.Text;
     d5 := EFDigito_5.Text;
     Result := True;
  end;
end;

procedure TFMRemesasPagoGastos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
