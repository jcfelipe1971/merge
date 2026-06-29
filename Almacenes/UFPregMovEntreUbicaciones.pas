unit UFPregMovEntreUbicaciones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, DBCtrls, ULFDBEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Mask,
  rxToolEdit, ULFLabel, ExtCtrls, ULFPanel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPregMovEntreUbicaciones = class(TFPEditListadoSimple)
     LFPanel1: TLFPanel;
     GBFechasProv: TGroupBox;
     LBLDesdeProv: TLFLabel;
     LBLHastaProv: TLFLabel;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     GBArticulos: TGroupBox;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     EFArticuloD: TLFEditFind2000;
     EFArticuloH: TLFEditFind2000;
     DBETitArticuloD: TLFDbedit;
     DBETitArticuloH: TLFDbedit;
     TButtConfiguracionRapida: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure TButtConfiguracionRapidaClick(Sender: TObject);
  private
     { Private declarations }
     procedure Carga;
  public
     { Public declarations }
  end;

var
  FPregMovEntreUbicaciones : TFPregMovEntreUbicaciones;

implementation

uses UDMLstMovEntreUbicaciones, UEntorno, UDMMain, UFormGest, UFMListConfig,
  UFMain;

{$R *.dfm}

procedure TFPregMovEntreUbicaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstMovEntreUbicaciones, DMLstMovEntreUbicaciones);
  Carga;

  FMain.AddComponentePunto(EFArticuloD);
  FMain.AddComponentePunto(EFArticuloH);
end;

procedure TFPregMovEntreUbicaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstMovEntreUbicaciones);
  FMain.DelComponentePunto(EFArticuloD);
  FMain.DelComponentePunto(EFArticuloH);
end;

procedure TFPregMovEntreUbicaciones.Carga;
var
  MaxArticulo, MinArticulo : string;
begin
  DMLstMovEntreUbicaciones.DameValoresMaxMin(MaxArticulo, MinArticulo);
  EFArticuloD.Text := MinArticulo;
  EFArticuloH.Text := MaxArticulo;
  DTPFechaD.Date := REntorno.FechaTrabSH;
  DTPFechaH.Date := REntorno.FechaTrabSH;
end;

procedure TFPregMovEntreUbicaciones.EFArticuloDChange(Sender: TObject);
begin
  inherited;
  if (EFArticuloD.Text <> '') then
     DMLstMovEntreUbicaciones.DameTitulosArticulo(EFArticuloD.Text, 0);
end;

procedure TFPregMovEntreUbicaciones.EFArticuloHChange(Sender: TObject);
begin
  inherited;
  if (EFArticuloH.Text <> '') then
     DMLstMovEntreUbicaciones.DameTitulosArticulo(EFArticuloH.Text, 1);
end;

procedure TFPregMovEntreUbicaciones.EFArticuloDBusqueda(Sender: TObject);
begin
  inherited;
  EFArticuloD.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and ubicable=1';
end;

procedure TFPregMovEntreUbicaciones.EFArticuloHBusqueda(Sender: TObject);
begin
  inherited;
  EFArticuloH.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and ubicable=1';
end;

procedure TFPregMovEntreUbicaciones.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Carga;
end;

procedure TFPregMovEntreUbicaciones.APrevExecute(Sender: TObject);
begin
  inherited;
  DMLstMovEntreUbicaciones.MostrarListado(EFArticuloD.Text, EFArticuloH.Text,
     DTPFechaD.Date, DTPFechaH.Date, 0);
end;

procedure TFPregMovEntreUbicaciones.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLstMovEntreUbicaciones.MostrarListado(EFArticuloD.Text, EFArticuloH.Text,
     DTPFechaD.Date, DTPFechaH.Date, 1);
end;

procedure TFPregMovEntreUbicaciones.TButtConfiguracionRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(195, formato, cabecera, copias,
     pijama, '', DMLstMovEntreUbicaciones.frMovEntreUbic);
end;

end.
