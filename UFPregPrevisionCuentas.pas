unit UFPregPrevisionCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, DBCtrls,
  Mask, rxToolEdit, ULFEdit, ULFComboBox, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPregPrevisionCuentas = class(TFPEditListadoSimple)
     Fecha_del_listado: TLFLabel;
     Moneda: TLFLabel;
     DTPFechaListado: TLFDateEdit;
     DBLCBMoneda: TDBLookupComboBox;
     Vencimiento: TGroupBox;
     Desde: TLFLabel;
     Hasta: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     Signo: TLFLabel;
     PNLComentario: TLFPanel;
     Comentario: TLFLabel;
     EComentario: TLFEdit;
     CBSigno: TLFComboBox;
     TButtConfRapida: TToolButton;
     PNLLimites: TLFPanel;
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure ExecListado(Modo: integer);
     function GetSigno(var Signo: string): boolean;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregPrevisionCuentas : TFPregPrevisionCuentas;

implementation

uses UDMMain, UFormGest, UDMRPrevisionCuentas, UEntorno, UFMListConfig;

{$R *.DFM}

procedure TFPregPrevisionCuentas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRPrevisionCuentas, DMRPrevisionCuentas);
  ARecargarExecute(Self);
  CBSigno.Text := _('Cobros');

  Grupo := 501;
  Listado := DMRPrevisionCuentas.frHYImportesCuentas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregPrevisionCuentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRPrevisionCuentas);
end;

procedure TFPregPrevisionCuentas.ARecargarExecute(Sender: TObject);
var
  Signo : string;
begin
  inherited;

  DTPFechaListado.Date := REntorno.FechaTrab;
  with DMRPrevisionCuentas do
  begin
     Signo := CBSigno.Text;
     GetSigno(Signo);
     Rangos(Signo);
     DTPDesde.Date := FechaD;
     DTPHasta.Date := FechaH;
  end;
  DBLCBMoneda.KeyValue := REntorno.Moneda;
  EComentario.Text := '';
end;

procedure TFPregPrevisionCuentas.ExecListado(Modo: integer);
var
  Signo : string;
  ok : boolean;
begin
  Signo := CBSigno.Text;
  ok := GetSigno(Signo);
  if (ok) then
     with DMRPrevisionCuentas do
     begin
        MostrarListado(DTPDesde.Date, DTPHasta.Date, DTPFechaListado.Date,
           DBLCBMoneda.Text, EComentario.Text, Signo, Modo);
     end
  else
     ShowMessage(_('El Signo del Listado es incorrecto'));
end;

function TFPregPrevisionCuentas.GetSigno(var Signo: string): boolean;
begin
  Result := True;
  if (UpperCase(Signo) = UpperCase(_('Cobros'))) then
     Signo := 'C'
  else if (UpperCase(Signo) = UpperCase(_('Pagos'))) then
     Signo := 'P'
  else
     Result := False;
end;

procedure TFPregPrevisionCuentas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  ExecListado(Modo);
end;

end.
