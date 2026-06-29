unit UFPregCosteVentasMP;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ULFLabel, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, DBCtrls, ULFDBEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TFPregCosteVentasMP = class(TFPEditListadoSfg)
     GBArticulo: TGroupBox;
     LblArtD: TLFLabel;
     LblArtH: TLFLabel;
     EFArticulo_H: TLFEditFind2000;
     EFArticulo_D: TLFEditFind2000;
     DBEArt_Desde: TLFDbedit;
     DBEArt_Hasta: TLFDbedit;
     GBFamilia: TGroupBox;
     LblFamD: TLFLabel;
     LblFamH: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     EFFamiliaH: TLFEditFind2000;
     DBEFamiliaDesde: TLFDbedit;
     DBEFamiliaHasta: TLFDbedit;
     GBPeriodo: TGroupBox;
     LblFechaD: TLFLabel;
     LblFechaH: TLFLabel;
     DTPFechaD: TDateEdit;
     DTPFechaH: TDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregCosteVentasMP : TFPregCosteVentasMP;

implementation

uses UDMRCosteVentasMP, UFormGest, UFMListConfig, UEntorno;

{$R *.dfm}

procedure TFPregCosteVentasMP.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRCosteVentasMP, DMRCosteVentasMP);
  ARecargarExecute(Sender);
end;

procedure TFPregCosteVentasMP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRCosteVentasMP);
  Action := caFree;
end;

procedure TFPregCosteVentasMP.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRCosteVentasMP.Rangos;
  DTPFechaD.Date := Trunc(DMRCosteVentasMP.Fecha_Desde);
  DTPFechaH.Date := Trunc(DMRCosteVentasMP.Fecha_Hasta);
  EFArticulo_D.Text := DMRCosteVentasMP.Articulo_Desde;
  EFArticulo_H.Text := DMRCosteVentasMP.Articulo_Hasta;
  EFFamiliaD.Text := DMRCosteVentasMP.DameMinMaxFamilia(0);
  EFFamiliaH.Text := DMRCosteVentasMP.DameMinMaxFamilia(1);

  TDPFechaListado.Date := REntorno.FechaTrabSH;
end;

procedure TFPregCosteVentasMP.APrevExecute(Sender: TObject);
begin
  inherited;
  DMRCosteVentasMP.MostrarListado(0, EFArticulo_D.Text, EFArticulo_H.Text,
     EFFamiliaD.Text, EFFamiliaH.Text, Trunc(DTPFechaD.Date), Trunc(DTPFechaH.Date));
end;

procedure TFPregCosteVentasMP.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMRCosteVentasMP.MostrarListado(1, EFArticulo_D.Text, EFArticulo_H.Text,
     EFFamiliaD.Text, EFFamiliaH.Text, Trunc(DTPFechaD.Date), Trunc(DTPFechaH.Date));
end;

procedure TFPregCosteVentasMP.AConfigurarExecute(Sender: TObject);
var
  formato, cabecera, copias, pijama, grupo : integer;
begin
  inherited;
  grupo := 9027;
  TFMListConfig.Create(Self).Muestra(grupo, formato, cabecera, copias,
     pijama, '', DMRCosteVentasMP.frListado);
end;

procedure TFPregCosteVentasMP.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFPregCosteVentasMP.EFArticulo_DChange(Sender: TObject);
begin
  inherited;
  DMRCosteVentasMP.CambiaArticuloD(EFArticulo_D.Text);
end;

procedure TFPregCosteVentasMP.EFArticulo_HChange(Sender: TObject);
begin
  inherited;
  DMRCosteVentasMP.CambiaArticuloH(EFArticulo_H.Text);
end;

procedure TFPregCosteVentasMP.EFFamiliaDChange(Sender: TObject);
begin
  inherited;
  DMRCosteVentasMP.CambiaFamiliaD(EFFamiliaD.Text);
end;

procedure TFPregCosteVentasMP.EFFamiliaHChange(Sender: TObject);
begin
  inherited;
  DMRCosteVentasMP.CambiaFamiliaH(EFFamiliaH.Text);
end;

end.
