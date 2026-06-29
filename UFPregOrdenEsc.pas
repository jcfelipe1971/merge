unit UFPregOrdenEsc;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, Mask, DBCtrls, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, ULFDBEdit,
  ULFCheckBox, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, rxPlacemnt, ULFFormStorage;

type
  TFPregOrdenEsc = class(TFPEditListado)
     PNLLimites: TLFPanel;
     LBLOrden: TLFLabel;
     LBLArticulo: TLFLabel;
     CHKExplosion: TLFCheckBox;
     EFOrdenProduccion: TLFEditFind2000;
     EFArticulo: TLFEditFind2000;
     DBETitArticulo: TLFDbedit;
     TButtConf: TToolButton;
     CBValorado: TLFCheckBox;
     EFSerieKRI: TLFEditFind2000;
     LSerieKri: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFOrdenProduccionChange(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(Serie, orden: string);
  end;

var
  FPregOrdenEsc : TFPregOrdenEsc;

implementation

uses UDMLstNecesidades, UFormGest, UEntorno, UDMMain, UFMListConfig;

{$R *.DFM}

procedure TFPregOrdenEsc.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstNecesidades, DMLstNecesidades);
  Grupo := 106;
  Listado := DMLstNecesidades.frNecesidades;
end;

procedure TFPregOrdenEsc.Muestra(Serie, orden: string);
begin
  EFOrdenProduccion.Text := Orden;
  EFSerieKri.Text := Serie;
  ShowModal;
end;

procedure TFPregOrdenEsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstNecesidades);
  Action := caFree;
end;

procedure TFPregOrdenEsc.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregOrdenEsc.APrevExecute(Sender: TObject);
var
  Explosion, valorado : integer;
begin
  if (CHKExplosion.Checked) then
     Explosion := 1
  else
     Explosion := 0;
  if (CBValorado.Checked) then
     Valorado := 1
  else
     Valorado := 0;
  DMLstNecesidades.PreparaListadoOrdEsc(EFSerieKRI.Text, StrToInt(
     EFOrdenProduccion.Text), Explosion, Valorado, 0);
end;

procedure TFPregOrdenEsc.EFArticuloChange(Sender: TObject);
begin
  DMLstNecesidades.CambiaTituloArt(EFArticulo.Text);
end;

procedure TFPregOrdenEsc.EFOrdenProduccionChange(Sender: TObject);
var
  Articulo : string;
  Cantidad : real;
begin
  Cantidad := 0;
  if (EFOrdenProduccion.Text <> '') then
  begin
     DMLstNecesidades.DameDatosOrden(EFSerieKRI.Text,
        (StrToIntDef(EFOrdenProduccion.Text, 0)), Articulo, Cantidad);
     EFArticulo.Text := Articulo;
     EFArticulo.Enabled := False;
     EFArticulo.Color := clInfoBk;
     EFArticulo.Font.Color := clGrayText;
  end
  else
  begin
     EFArticulo.Enabled := True;
     EFArticulo.Color := clWindow;
     EFArticulo.Font.Color := clWindowText;
  end;
end;

procedure TFPregOrdenEsc.AImprimirExecute(Sender: TObject);
var
  Explosion, valorado : integer;
begin
  if (CHKExplosion.Checked) then
     Explosion := 1
  else
     Explosion := 0;
  if (CBValorado.Checked) then
     Valorado := 1
  else
     Valorado := 0;

  DMLstNecesidades.PreparaListadoOrdEsc(EFSerieKRI.Text, StrToInt(
     EFOrdenProduccion.Text), Explosion, Valorado, 1);
end;

end.
