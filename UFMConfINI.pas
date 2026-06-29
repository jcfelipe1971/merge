unit UFMConfINI;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, StdCtrls, UFormGest, FIBEditFind, Spin,
  ULFToolBar, ULFCheckBox, ULFEdit, ULFPageControl, ULFPanel,
  TFlatCheckBoxUnit, ULFLabel, rxPlacemnt, ULFFormStorage, ULFDBCheckBox,
  UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel;

type
  TFMConfINI = class(TFPEditSinNavegador)
     TBReleer: TToolButton;
     TBGrabar: TToolButton;
     LBaseDatos: TLFLabel;
     EDBaseDatos: TLFEdit;
     EDTimerBusqueda: TLFEdit;
     LTimerBusqueda: TLFLabel;
     LOfertas: TLFLabel;
     LPedidos: TLFLabel;
     LAlbaranes: TLFLabel;
     LFacturas: TLFLabel;
     SEOfertas: TSpinEdit;
     SEPedidos: TSpinEdit;
     SEAlbaranes: TSpinEdit;
     SEFacturas: TSpinEdit;
     LUsuarioBD: TLFLabel;
     EDUsuarioBD: TLFEdit;
     LRolBD: TLFLabel;
     EDRolBD: TLFEdit;
     LClaveBD: TLFLabel;
     EClaveBD: TLFEdit;
     EDispositivoFirma: TLFEdit;
     LDispositivoFirma: TLFLabel;
     LBaseDeDatosCab: TLFLabel;
     LOtros: TLFLabel;
     PCMain: TLFPageControl;
     TSConexion: TTabSheet;
     TSFirma: TTabSheet;
     TSImpresion: TTabSheet;
     procedure FormCreate(Sender: TObject);
     procedure TBReleerClick(Sender: TObject);
     procedure TBGrabarClick(Sender: TObject);
  private
     { Private declarations }
     procedure RellenaDatos;
     procedure GrabaINI;
  public
     { Public declarations }
  end;

var
  FMConfINI : TFMConfINI;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMConfINI.FormCreate(Sender: TObject);
begin
  inherited;
  RellenaDatos;
end;

procedure TFMConfINI.TBReleerClick(Sender: TObject);
begin
  RellenaDatos;
end;

procedure TFMConfINI.TBGrabarClick(Sender: TObject);
begin
  GrabaINI;
end;

procedure TFMConfINI.RellenaDatos;
begin
  // Datos
  EDBaseDatos.Text := REntorno.BaseDeDatos;
  EDUsuarioBD.Text := REntorno.UsuarioBD;
  EDRolBD.Text := REntorno.RolBD;
  EClaveBD.Text := REntorno.ClaveBD;

  // Usuario
  EDTimerBusqueda.Text := IntToStr(TMR_Ventana_Busqueda);

  // Documentos
  SEOfertas.Value := REntorno.Ofertas;
  SEPedidos.Value := REntorno.Pedidos;
  SEAlbaranes.Value := REntorno.Albaranes;
  SEFacturas.Value := REntorno.Facturas;
  EDispositivoFirma.Text := REntorno.DispositivoFirma;
end;

procedure TFMConfINI.GrabaINI;
begin
  // Datos
  REntorno.BaseDeDatos := EDBaseDatos.Text;
  REntorno.UsuarioBD := EDUsuarioBD.Text;
  REntorno.RolBD := EDRolBD.Text;
  REntorno.ClaveBD := EClaveBD.Text;

  // Usuario
  TMR_Ventana_Busqueda := StrToIntDef(EDTimerBusqueda.Text, 21);

  // Documentos
  REntorno.Ofertas := SEOfertas.Value;
  REntorno.Pedidos := SEPedidos.Value;
  REntorno.Albaranes := SEAlbaranes.Value;
  REntorno.Facturas := SEFacturas.Value;
  REntorno.DispositivoFirma := EDispositivoFirma.Text;

  // Graba los nuevos Datos
  EscribeDatoIni('Datos', 'BaseDeDatos', REntorno.BaseDeDatos);
  EscribeDatoIni('Datos', 'UsuarioBD', REntorno.UsuarioBD);
  EscribeDatoIni('Datos', 'RolBD', REntorno.RolBD);
  if (REntorno.ClaveBD > '') then
     EscribeDatoIni('Datos', 'ClaveBD', CodificaClave(REntorno.ClaveBD));

  EscribeDatoIni('Usuario', 'TimerBusqueda', TMR_Ventana_Busqueda);

  EscribeDatoIni('Documentos', 'Ofertas', REntorno.Ofertas);
  EscribeDatoIni('Documentos', 'Pedidos', REntorno.Pedidos);
  EscribeDatoIni('Documentos', 'Albaranes', REntorno.Albaranes);
  EscribeDatoIni('Documentos', 'Facturas', REntorno.Facturas);
  EscribeDatoIni('Documentos', 'DispositivoFirma', REntorno.DispositivoFirma);
end;

end.
