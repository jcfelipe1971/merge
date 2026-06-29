unit UFPregCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ULFActionList, Mask, DBCtrls, ULFDBEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel,
  ExtCtrls, ULFPanel, ComCtrls, ToolWin, ULFToolBar, ULFEdit,
  UFPEditListado, rxPlacemnt, ULFFormStorage, ULFPageControl,
  UFPEditListadoSimple;

type
  TFPregCliente = class(TFPEditListadoSimple)
     TButtConfRapida: TToolButton;
     PNLCPostal: TLFPanel;
     LCliente: TLFLabel;
     EFCPCliente: TLFEditFind2000;
     ETitulo: TLFEdit;
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure EFCPClienteChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregCliente : TFPregCliente;

implementation

uses UIsoDMCertificadoAnalisis, UDMListados, UDMMain, UEntorno, UFMListConfig, UDameDato;

{$R *.dfm}

procedure TFPregCliente.FormCreate(Sender: TObject);
begin
  Grupo := 8065;
  Listado := IsoDMCertificadoAnalisis.frIsoCertificadoAnalisis;
end;

procedure TFPregCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPregCliente.EFCPClienteChange(Sender: TObject);
begin
  ETitulo.Text := DameTituloCliente(StrToIntDef(EFCPCliente.Text, 0));
end;

procedure TFPregCliente.APrevExecute(Sender: TObject);
begin
  IsoDMCertificadoAnalisis.MostrarListado(8065, 0, StrToInt(EFCPcliente.Text));
end;

procedure TFPregCliente.AImprimirExecute(Sender: TObject);
begin
  IsoDMCertificadoAnalisis.MostrarListado(8065, 1, StrToInt(EFCPcliente.Text));
end;

procedure TFPregCliente.ASalirExecute(Sender: TObject);
begin
  Close;
end;

end.
