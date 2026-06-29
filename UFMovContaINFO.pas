unit UFMovContaINFO;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls,
  Buttons, ActnList, ULFActionList, ULFToolBar, ULFDBEdit, ULFPanel,
  ULFLabel;

type
  TFMovContaINFO = class(TG2KForm)
     PNLMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtSalir: TToolButton;
     GBTotales: TGroupBox;
     DBEBaseImponible: TLFDbedit;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     Label4: TLFLabel;
     DBERetencion: TLFDbedit;
     DBETotal: TLFDbedit;
     DBEIVA: TLFDbedit;
     Label5: TLFLabel;
     DBERecargo: TLFDbedit;
     DBELiquido: TLFDbedit;
     Label6: TLFLabel;
     Label7: TLFLabel;
     DBETercero: TLFDbedit;
     DBETitTercero: TLFDbedit;
     DBEMaestro: TLFDbedit;
     DBLabelMaestro: TDBText;
     DBECuenta: TLFDbedit;
     DBETitCuenta: TLFDbedit;
     DBESignoIVA: TLFDbedit;
     DBEDocSerie: TLFDbedit;
     DBEDocNumero: TLFDbedit;
     DBETitFormaPago: TLFDbedit;
     DBETitDocSerie: TLFDbedit;
     DBEFormaPago: TLFDbedit;
     Label8: TLFLabel;
     DBETitCliente: TLFDbedit;
     Label10: TLFLabel;
     Label11: TLFLabel;
     Label9: TLFLabel;
     DBEModoIVA: TLFDbedit;
     DBETitModoIVA: TLFDbedit;
     Label12: TLFLabel;
     Label13: TLFLabel;
     Label14: TLFLabel;
     DBERegistro: TLFDbedit;
     DBERGC: TLFDbedit;
     Label15: TLFLabel;
     Label16: TLFLabel;
     SBVerRegistro: TSpeedButton;
     SBVerRegistroCartera: TSpeedButton;
     ALMovContaINFO: TLFActionList;
     ARegistroIVA: TAction;
     ARegistroCartera: TAction;
     procedure TButtSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure SBVerRegistroDblClick(Sender: TObject);
     procedure ARegistroIVAExecute(Sender: TObject);
     procedure ARegistroCarteraExecute(Sender: TObject);
     procedure SBVerRegistroCarteraDblClick(Sender: TObject);
  private
     { Private declarations }
     procedure HabilitaEnlaces;
  public
     { Public declarations }
     procedure FiltraDatos;
  end;

var
  FMovContaINFO : TFMovContaINFO;

implementation

uses UDMMovConta, UDMMain, UFMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TFMovContaINFO.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMovContaINFO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := caFree;
  FMovContaINFO := nil;
end;

procedure TFMovContaINFO.FiltraDatos;
begin
  DMMovConta.FiltraDatosExtendido;
  HabilitaEnlaces;
end;

procedure TFMovContaINFO.HabilitaEnlaces;
var
  tipo : string;
begin
  tipo := DMMovConta.xDatosExtendidoTIPO.AsString;

  SolapaControles(SBVerRegistro, DBERegistro);
  DBERegistro.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBVerRegistroCartera, DBERGC);
  if ((tipo = 'AFA') or (tipo = 'AFP') or (tipo = 'AFC')) then
  begin
     DBERGC.Color := REntorno.ColorEnlaceActivo;
     SBVerRegistroCartera.ShowHint := True;
  end
  else
  begin
     DBERGC.Color := clInfoBk;
     SBVerRegistroCartera.ShowHint := False;
  end;
end;

procedure TFMovContaINFO.SBVerRegistroDblClick(Sender: TObject);
begin
  ARegistroIVA.Execute;
end;

procedure TFMovContaINFO.ARegistroIVAExecute(Sender: TObject);
begin
  FMain.MuestraIVA('EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + IntToStr(DMMovConta.QMAsientosEJERCICIO.AsInteger) + ' AND CANAL=' + REntorno.CanalStr + ' AND REGISTRO=' + IntToStr(DMMovConta.xDatosExtendidoREG.AsInteger), Copy(DMMovConta.xDatosExtendidoSIGNO_IVA.AsString, 1, 1)); // S=Soportado R=Repercutido
end;

procedure TFMovContaINFO.ARegistroCarteraExecute(Sender: TObject);
var
  signo, tipo : string;
begin
  tipo := DMMovConta.xDatosExtendidoTIPO.AsString;
  if ((tipo = 'AFA') or (tipo = 'AFP') or (tipo = 'AFC')) then
  begin
     if (tipo = 'AFC') then
        signo := 'C'
     else if ((tipo = 'AFA') or (tipo = 'AFP')) then
        signo := 'P';

     FMain.MuestraCartera(DMMovConta.QMAsientosEJERCICIO.AsInteger,
        DMMovConta.QMAsientosCANAL.AsInteger, signo[1], DMMovConta.xDatosExtendidoRGC.AsInteger);
  end;
end;

procedure TFMovContaINFO.SBVerRegistroCarteraDblClick(Sender: TObject);
begin
  ARegistroCartera.Execute;
end;

end.
