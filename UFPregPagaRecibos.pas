unit UFPregPagaRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ComCtrls, StdCtrls, ExtCtrls, ActnList, ToolWin, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, ULFDateEdit, ULFEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPregPagaRecibos = class(TFPEditListadoSimple)
     PNLLimites: TLFPanel;
     Vencimiento: TGroupBox;
     Desde: TLFLabel;
     Hasta: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     LBLFormaPago: TLFLabel;
     EFCuenta: TLFEditFind2000;
     ETitulo: TLFEdit;
     LHint: TLFLabel;
     LSigno: TLFLabel;
     ESigno: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFCuentaChange(Sender: TObject);
  private
     { Private declarations }
     Signo: string;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(aSigno, Cuenta: string);
  end;

var
  FPregPagaRecibos : TFPregPagaRecibos;

implementation

uses UDMMain, UDMCartera, UEntorno, UDameDato;

{$R *.DFM}

procedure TFPregPagaRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  DTPDesde.Date := REntorno.FechaTrabSH;
  DTPHasta.Date := REntorno.FechaTrabSH;

  // Inicializo variables globales a este formulario
  Grupo := 0;
  Listado := nil;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := nil;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregPagaRecibos.EFCuentaChange(Sender: TObject);
begin
  inherited;
  ETitulo.Text := DameTituloCuenta(EFCuenta.Text);
end;

procedure TFPregPagaRecibos.Muestra(aSigno, Cuenta: string);
begin
  Signo := aSigno;

  if (Signo = 'C') then
     ESigno.Text := _('Cobros')
  else
     ESigno.Text := _('Pagos');

  EFCuenta.Text := Cuenta;
  ShowModal;
end;

procedure TFPregPagaRecibos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if ((EFCuenta.Text <> '') and (ETitulo.Text <> '')) then
     DMCartera.PagaRecibos(EFCuenta.Text, DTPDesde.Date, DTPHasta.Date, Signo);

  Close;
end;

end.
