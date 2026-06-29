unit ZUFMLSTDiarioVentas;

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
  TZFMLSTDiarioVentas = class(TFPEditListadoSimple)
     LFecha: TLFLabel;
     DEFecha: TLFDateEdit;
     LTienda: TLFLabel;
     EFSerie: TLFEditFind2000;
     ToolButton1: TToolButton;
     AConfList: TAction;
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
  ZFMLSTDiarioVentas : TZFMLSTDiarioVentas;

implementation

uses UDMMain, UEntorno, UFormGest, ZUDMLSTDiarioVentas, UFMListConfig, UDameDato;

{$R *.dfm}

{Todo: Utilizar TLocal/TUpdate}

procedure TZFMLSTDiarioVentas.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TZFMLSTDiarioVentas.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DEFecha.Date := REntorno.FechaTrabSH;
  EFSerie.Text := '';
end;

procedure TZFMLSTDiarioVentas.APrevExecute(Sender: TObject);
begin
  inherited;
  ZDMLSTDiarioVentas.MostrarListado(0, DEFecha.Date, EFSerie.Text);
end;

procedure TZFMLSTDiarioVentas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMLSTDiarioVentas, ZDMLSTDiarioVentas);
  ARecargar.Execute;
end;

procedure TZFMLSTDiarioVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLSTDiarioVentas);
  Action := caFree;
end;

procedure TZFMLSTDiarioVentas.AConfListExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(9000, formato, cabecera, copias,
     pijama, '', ZDMLSTDiarioVentas.frDiarioVenta);
end;

procedure TZFMLSTDiarioVentas.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ZDMLSTDiarioVentas.MostrarListado(1, DEFecha.Date, EFSerie.Text);
end;

procedure TZFMLSTDiarioVentas.EFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

end.
