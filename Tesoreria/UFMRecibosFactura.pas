unit UFMRecibosFactura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UEditPanel,
  NsDBGrid, ULFToolBar, ULFDBEdit, ULFEdit, ULFComboBox, ULFPanel,
  ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit;

type
  TFMRecibosFactura = class(TFPEditSinNavegador)
     DBGFRecibos: TDBGridFind2000;
     EFSeries: TLFEditFind2000;
     CBTipo: TLFComboBox;
     LBLTipoFactura: TLFLabel;
     LBLSerie: TLFLabel;
     LBLFactura: TLFLabel;
     EFactura: TLFEdit;
     DBSerie: TLFDbedit;
     PNLCabecera: TLFPanel;
     LTotal: TLFLabel;
     DBETotal: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFSeriesChange(Sender: TObject);
     procedure EFacturaChange(Sender: TObject);
     procedure EFacturaKeyPress(Sender: TObject; var Key: char);
     procedure DBGFRecibosDblClick(Sender: TObject);
     procedure CBTipoChange(Sender: TObject);
  private
     { Private declarations }
     TipoFactura: string;
     Ejercicio: integer;
  public
     { Public declarations }
     procedure Situar(aTipoFactura, Serie: string; Factura: string; aEjercicio: integer);
  end;

var
  FMRecibosFactura : TFMRecibosFactura;

implementation

uses UDMRecibosFactura, UDMMain, UFMain, UEntorno;

{$R *.DFM}

procedure TFMRecibosFactura.FormCreate(Sender: TObject);
begin
  inherited;
  Ejercicio := REntorno.Ejercicio;
  DBGFRecibos.Columns[0].Color := REntorno.ColorEnlaceActivo;
  AbreData(TDMRecibosFactura, DMRecibosFactura);
  CBTipo.ItemIndex := 0;
  SalirConEscape;
end;

procedure TFMRecibosFactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRecibosFactura);
end;

procedure TFMRecibosFactura.Situar(aTipoFactura, Serie: string; Factura: string; aEjercicio: integer);
begin
  Ejercicio := aEjercicio;
  TipoFactura := aTipoFactura;
  if (TipoFactura = 'OFC') then
     CBTipo.ItemIndex := 0;
  if (TipoFactura = 'PEC') then
     CBTipo.ItemIndex := 1;
  if (TipoFactura = 'ALB') then
     CBTipo.ItemIndex := 2;
  if (TipoFactura = 'FAC') then
     CBTipo.ItemIndex := 3;
  if (TipoFactura = 'FAP') then
     CBTipo.ItemIndex := 4;
  if (TipoFactura = 'FCR') then
     CBTipo.ItemIndex := 5;
  EFSeries.Text := Serie;
  EFactura.Text := Factura;
end;

procedure TFMRecibosFactura.EFSeriesChange(Sender: TObject);
begin
  DMRecibosFactura.CambiaSerie(EFSeries.Text, Ejercicio);
end;

procedure TFMRecibosFactura.EFacturaChange(Sender: TObject);
begin
  if ((EFSeries.Text <> '') and (EFactura.Text <> '')) then
     DMRecibosFactura.Mostrar(EFSeries.Text, TipoFactura, StrToIntDef(EFactura.Text, 1),
        Ejercicio)
  else
     DMRecibosFactura.Mostrar(EFSeries.Text, TipoFactura, StrToIntDef('0', 1), Ejercicio);
end;

procedure TFMRecibosFactura.EFacturaKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8{, '-', ThousandSeparator, DecimalSeparator}]) then
     Key := #0;
end;

procedure TFMRecibosFactura.DBGFRecibosDblClick(Sender: TObject);
var
  Signo : string;
  Registro, Ejercicio : integer;
begin
  if DMRecibosFactura.DatosCartera(Signo, Ejercicio, Registro) then
  begin
     FMain.MuestraCartera(Ejercicio, REntorno.Canal, Signo[1], Registro);
     Close;
  end;
end;

procedure TFMRecibosFactura.CBTipoChange(Sender: TObject);
var
  aTipoFactura : string;
begin
  case CBTipo.ItemIndex of
     0: aTipoFactura := 'OFC';
     1: aTipoFactura := 'PEC';
     2: aTipoFactura := 'ALB';
     3: aTipoFactura := 'FAC';
     4: aTipoFactura := 'FAP';
     5: aTipoFactura := 'FCR';
  end;

  if (TipoFactura <> aTipoFactura) then
  begin
     TipoFactura := aTipoFactura;
     EFactura.Text := '';
     DMRecibosFactura.Refresca;
  end;
end;

end.
