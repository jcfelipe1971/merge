unit UFMovContaRecibos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UEditPanel,
  NsDBGrid, Menus, UTeclas, UControlEdit, UNavigator, ULFDBEdit,
  ULFToolBar, ULFPanel, ULFLabel;

type
  TFMovContaRecibos = class(TG2kForm)
     PNPrincipal: TLFPanel;
     DBGFRecibos: TDBGridFind2000;
     TBMain: TLFToolBar;
     DBLabelMaestro: TDBText;
     DBEMaestro: TLFDbedit;
     DBETitCliente: TLFDbedit;
     LBLCuenta: TLFLabel;
     DBECuenta: TLFDbedit;
     DBETitCuenta: TLFDbedit;
     TButtSalir: TToolButton;
     TButtRecibosAgrupados: TToolButton;
     ToolButton2: TToolButton;
     NavMain: THYMNavigator;
     ToolButton1: TToolButton;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFRecibosDblClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtRecibosAgrupadosClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraDatos;
  end;

var
  FMovContaRecibos : TFMovContaRecibos;

implementation

uses UDMMain, UFMain, UEntorno, UDMMovConta, UFMRecibosAgrupados;

{$R *.DFM}

procedure TFMovContaRecibos.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMovContaRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMovContaRecibos := nil;
  Action := caFree;
end;

procedure TFMovContaRecibos.FiltraDatos;
var
  cerrar : boolean;
begin
  cerrar := False;
  DBGFRecibos.Columns[0].Color := REntorno.ColorEnlaceActivo;
  DMMovConta.MostrarRecibos(cerrar);
  if cerrar then
     Close;

  ControlEdit := CEMain;
end;

procedure TFMovContaRecibos.DBGFRecibosDblClick(Sender: TObject);
var
  ejercicio, registro : integer;
  signo : string;
  ok : boolean;
begin
  DMMovConta.DatosCartera(registro, ok, ejercicio, signo);

  if ok then
     FMain.MuestraCartera(ejercicio, DMMovConta.QMAsientosCANAL.AsInteger, signo[1],
        registro);
end;

procedure TFMovContaRecibos.TButtRecibosAgrupadosClick(Sender: TObject);
var
  empresa, ejercicio, canal, registro : integer;
  signo : string;
  agrupado : boolean;
begin
  DMMovConta.DatosRecibo(empresa, ejercicio, canal, registro, signo, agrupado);
  if agrupado then
     TFMRecibosAgrupados.Create(Self).mostrar(empresa,
        ejercicio, canal, registro, ejercicio, signo)
  else
     ShowMessage('Este recibo no está agrupado');
end;

end.
