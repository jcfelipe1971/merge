unit ZUFPregInteresesAnticipos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFDBEdit, ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel;

type
  TZFPregInteresesAnticipos = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtImprimir: TToolButton;
     TButtVisualizar: TToolButton;
     TButtSalir: TToolButton;
     ActionList1: TLFActionList;
     ASalir: TAction;
     AVisualizar: TAction;
     AImprimir: TAction;
     TButtConfigurar: TToolButton;
     PNLListArt: TLFPanel;
     LblAnticipoDesde: TLFLabel;
     EFInteres_Desde: TLFEditFind2000;
     EFInteres_Hasta: TLFEditFind2000;
     LBLAnticipoHasta: TLFLabel;
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AVisualizarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure TButtConfigurarClick(Sender: TObject);
  private
     { Private declarations }
     tipo_anticipo: smallint;
  public
     { Public declarations }
     procedure mostrar(tipo: smallint);
  end;

var
  ZFPregInteresesAnticipos : TZFPregInteresesAnticipos;

implementation

{$R *.DFM}

uses UEntorno, UUtiles, UFMListConfig, ZUDMLstInteresesAnticipos;

procedure TZFPregInteresesAnticipos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLSTInteresesAnticipos, ZDMLSTInteresesAnticipos);
end;

procedure TZFPregInteresesAnticipos.mostrar(tipo: smallint);
var
  Desde, Hasta : string;
begin

  ZDMLSTInteresesAnticipos.DameAnticipo(Desde, Hasta);
  EFInteres_Desde.Tabla_a_buscar := 'Z_INTERES_ANTICIPO_CAB';
  EFInteres_Hasta.Tabla_a_buscar := 'Z_INTERES_ANTICIPO_CAB';
  EFInteres_Desde.Text := Desde;
  EFInteres_Hasta.Text := Hasta;
  ShowModal;
end;

procedure TZFPregInteresesAnticipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLSTInteresesAnticipos);
  Action := caFree;
end;

procedure TZFPregInteresesAnticipos.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TZFPregInteresesAnticipos.AVisualizarExecute(Sender: TObject);
begin
  ZDMLSTInteresesAnticipos.MostrarListado(EFInteres_Desde.Text, EFInteres_Hasta.Text, 0, tipo_anticipo);
end;

procedure TZFPregInteresesAnticipos.AImprimirExecute(Sender: TObject);
begin
  ZDMLSTInteresesAnticipos.MostrarListado(EFInteres_Desde.Text, EFInteres_Hasta.Text, 1, tipo_anticipo);
end;

procedure TZFPregInteresesAnticipos.TButtConfigurarClick(Sender: TObject);
var
  formato, cabecera, copias, pijama, grupo : integer;
begin
  if tipo_anticipo = 1 then
     grupo := 9010
  else
     grupo := 9010;
  TFMListConfig.Create(Self).Muestra(grupo, formato, cabecera, copias,
     pijama, '', ZDMLSTInteresesAnticipos.frLstInteresAnticipo);
end;

end.
