unit UFPregArtTarifasDetallado;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, UFPEditListadoSimple,
  rxPlacemnt, ULFFormStorage;

type
  TFPregArtTarifasDetallado = class(TFPEditListadoSimple)
     TButtConfRapida: TToolButton;
     GBArticulos: TGroupBox;
     Label1: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     DBEArticuloDesde: TLFDbedit;
     Label2: TLFLabel;
     EFArt_Hasta: TLFEditFind2000;
     DBEArticuloHasta: TLFDbedit;
     GBTarifas: TGroupBox;
     Label3: TLFLabel;
     EFTarifa_Desde: TLFEditFind2000;
     DBETarifaDesde: TLFDbedit;
     DBETarifaHasta: TLFDbedit;
     EFTarifa_Hasta: TLFEditFind2000;
     Label4: TLFLabel;
     GBFamilia: TGroupBox;
     Label5: TLFLabel;
     Label6: TLFLabel;
     EFFamilia_H: TLFEditFind2000;
     EFFamilia_D: TLFEditFind2000;
     DBEFamiliaDesde: TLFDbedit;
     DBEFamiliaHasta: TLFDbedit;
     GroupBox1: TGroupBox;
     LBLAlmacenDesde: TLFLabel;
     Label8: TLFLabel;
     EFAlmacen_D: TLFEditFind2000;
     EFAlmacen_H: TLFEditFind2000;
     DBEAlmacenDesde: TLFDbedit;
     DBEAlmacenHasta: TLFDbedit;
     GBDisponibilidad: TGroupBox;
     CBDisponibilidad: TLFCheckBox;
     RGOrdenado: TRadioGroup;
     GBPrecioCero: TGroupBox;
     DBEDisponibilidad: TLFDbedit;
     EFDisponibilidad: TLFEditFind2000;
     CBArtConPrecioCero: TLFCheckBox;
     RGPaginado: TRadioGroup;
     PNLFiltros: TLFPanel;
     PNLPieFiltros: TLFPanel;
     PNLPieFiltrosRight: TLFPanel;
     CBArticulosBaja: TLFCheckBox;
     BExportar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFTarifa_DesdeChange(Sender: TObject);
     procedure EFTarifa_HastaChange(Sender: TObject);
     procedure EFFamilia_HChange(Sender: TObject);
     procedure EFFamilia_DChange(Sender: TObject);
     procedure EFFamilia_DBusqueda(Sender: TObject);
     procedure EFFamilia_HBusqueda(Sender: TObject);
     procedure CBDisponibilidadClick(Sender: TObject);
     procedure EFAlmacen_DChange(Sender: TObject);
     procedure EFAlmacen_HChange(Sender: TObject);
     procedure EFDisponibilidadChange(Sender: TObject);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra;
     procedure OpcionesListado;
  end;

var
  FPregArtTarifasDetallado : TFPregArtTarifasDetallado;

implementation

uses UDMLstTarifas, UUtiles, UEntorno, UFMListConfig, UDMMain;

{$R *.DFM}

procedure TFPregArtTarifasDetallado.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMLstTarifas, DMLstTarifas);
  ARecargar.Execute;

  Grupo := 149;
  Listado := DMLstTarifas.frTarifas;
  ListadoFR3 := DMLstTarifas.frxTarifas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregArtTarifasDetallado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstTarifas);
end;

procedure TFPregArtTarifasDetallado.OpcionesListado;
begin
  DMLstTarifas.ArtPrecioCero := CBArtConPrecioCero.Checked;
  DMLstTarifas.OpPaginado := RGPaginado.ItemIndex;
end;

procedure TFPregArtTarifasDetallado.Muestra;
begin
  ShowModal;
end;

procedure TFPregArtTarifasDetallado.EFArt_DesdeBusqueda(Sender: TObject);
begin
  EFArt_Desde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''';
end;

procedure TFPregArtTarifasDetallado.EFArt_HastaBusqueda(Sender: TObject);
begin
  EFArt_Hasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''';
end;

procedure TFPregArtTarifasDetallado.EFArt_DesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstTarifas.xArt_Desde, EFArt_Desde.Text);
end;

procedure TFPregArtTarifasDetallado.EFArt_HastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstTarifas.xArt_Hasta, EFArt_Hasta.Text);
end;

procedure TFPregArtTarifasDetallado.ARecargarExecute(Sender: TObject);
var
  articulo_d, articulo_h, Tarifa_D, Tarifa_H, Familia_D, Familia_H, almacen_D, almacen_H : string;
begin
  RGOrdenado.ItemIndex := 0;
  RGPaginado.ItemIndex := 0;
  CBDisponibilidad.Checked := False;
  CBArticulosBaja.Checked := False;
  EFDisponibilidad.Visible := False;
  DBEDisponibilidad.Visible := False;
  EFDisponibilidad.Text := IntToStr(1);
  DMLstTarifas.Rangos1(articulo_d, articulo_h);
  EFArt_Desde.Text := articulo_d;
  EFArt_Hasta.Text := articulo_h;
  DMLstTarifas.Rangos(Tarifa_D, Tarifa_H);
  EFTarifa_Desde.Text := Tarifa_D;
  EFTarifa_Hasta.Text := Tarifa_H;
  DMLstTarifas.RangosFamilia(Familia_D, Familia_H);
  EFFamilia_D.Text := Familia_D;
  EFFamilia_H.Text := Familia_H;
  DMLstTarifas.RangosAlmacenes(Almacen_D, Almacen_H);
  EFAlmacen_D.Text := Almacen_D;
  EFAlmacen_H.Text := Almacen_H;
end;

procedure TFPregArtTarifasDetallado.EFTarifa_DesdeChange(Sender: TObject);
begin
  Actualiza_TarifaRO(DMLstTarifas.xTarifa_Desde, EFTarifa_Desde.Text);
end;

procedure TFPregArtTarifasDetallado.EFTarifa_HastaChange(Sender: TObject);
begin
  Actualiza_TarifaRO(DMLstTarifas.xTarifa_Hasta, EFTarifa_Hasta.Text);
end;

procedure TFPregArtTarifasDetallado.EFFamilia_HChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstTarifas.xFamilia_Hasta, EFFamilia_H.Text);
end;

procedure TFPregArtTarifasDetallado.EFFamilia_DChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstTarifas.xFamilia_Desde, EFFamilia_D.Text);
end;

procedure TFPregArtTarifasDetallado.EFFamilia_DBusqueda(Sender: TObject);
begin
  EFFamilia_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtTarifasDetallado.EFFamilia_HBusqueda(Sender: TObject);
begin
  EFFamilia_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArtTarifasDetallado.CBDisponibilidadClick(Sender: TObject);
begin
  if (CBDisponibilidad.Checked) then
  begin
     EFDisponibilidad.Visible := True;
     DBEDisponibilidad.Visible := True;
  end
  else
  begin
     EFDisponibilidad.Visible := False;
     DBEDisponibilidad.Visible := False;
  end;
end;

procedure TFPregArtTarifasDetallado.EFAlmacen_DChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMLstTarifas.xAlmacen_Desde, EFAlmacen_D.Text);
end;

procedure TFPregArtTarifasDetallado.EFAlmacen_HChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMLstTarifas.xAlmacen_Hasta, EFAlmacen_H.Text);
end;

procedure TFPregArtTarifasDetallado.EFDisponibilidadChange(Sender: TObject);
begin
  DMLstTarifas.ActualizaDis(EFDisponibilidad.Text);
end;

procedure TFPregArtTarifasDetallado.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  OpcionesListado;

  DMLstTarifas.MuestraListadoDetallado(EFArt_Desde.Text, EFArt_Hasta.Text,
     EFTarifa_Desde.Text, EFTarifa_Hasta.Text,
     EFAlmacen_D.Text, EFAlmacen_H.Text,
     EFFamilia_D.Text, EFFamilia_H.Text, EFDisponibilidad.Text,
     CBDisponibilidad.Checked, RGOrdenado.ItemIndex, Modo, CBArticulosBaja.Checked);
end;

end.
