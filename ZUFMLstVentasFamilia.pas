unit ZUFMLstVentasFamilia;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, Mask, rxToolEdit,
  ULFDateEdit, ULFLabel, ULFEdit, rxPlacemnt, ULFFormStorage, ExtCtrls,
  ULFPanel, UFPEditListadoSimple;

type
  TZFMLSTVentasFamilia = class(TFPEditListadoSimple)
     LFechaDesde: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     TButtConfigurar: TToolButton;
     AConfList: TAction;
     LFechaHasta: TLFLabel;
     DEFechaHasta: TLFDateEdit;
     ESerie: TLFEdit;
     PNLLimites: TPanel;
     procedure ASalirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AConfListExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMLSTVentasFamilia : TZFMLSTVentasFamilia;

implementation

uses UDMMain, UEntorno, UFormGest, UFMListConfig,
  ZUDMLSTVentasFamilia, UDameDato;

{$R *.dfm}

procedure TZFMLSTVentasFamilia.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TZFMLSTVentasFamilia.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DEFechaDesde.Date := REntorno.FechaTrabSH;
  DEFechaHasta.Date := REntorno.FechaTrabSH;
  EFSerie.Text := REntorno.Serie;
end;

procedure TZFMLSTVentasFamilia.APrevExecute(Sender: TObject);
begin
  inherited;
  ZDMLSTVentasFamilia.MostrarListado(0, DEFechaDesde.Date, DEFechaHasta.Date, EFSerie.Text);
end;

procedure TZFMLSTVentasFamilia.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMLSTVentasFamilia, ZDMLSTVentasFamilia);
  ARecargar.Execute;
end;

procedure TZFMLSTVentasFamilia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLSTVentasFamilia);
  Action := caFree;
end;

procedure TZFMLSTVentasFamilia.AConfListExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(9001, formato, cabecera, copias,
     pijama, '', ZDMLSTVentasFamilia.frDiarioVenta);
end;

procedure TZFMLSTVentasFamilia.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ZDMLSTVentasFamilia.MostrarListado(1, DEFechaDesde.Date, DEFechaHasta.Date, EFSerie.Text);
end;

procedure TZFMLSTVentasFamilia.EFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

end.
