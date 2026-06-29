unit UFPregDepositosActivos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, ActnList, Mask, DBCtrls, Grids, DBGrids,
  rxToolEdit, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFEdit, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPregDepositosActivos = class(TFPEditListadoSimple)
     PNLInventarioStocks: TLFPanel;
     GBArticulo: TGroupBox;
     EFArticulo_D: TLFEditFind2000;
     EFArticulo_H: TLFEditFind2000;
     GBFechas: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     TButtConfiguracionRapida: TToolButton;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     RGModo: TRadioGroup;
     GBProv: TGroupBox;
     EFProveedorD: TLFEditFind2000;
     EFProveedorH: TLFEditFind2000;
     DBEProveedorH: TLFDbedit;
     DBEProveedorD: TLFDbedit;
     LHasteProveedor: TLFLabel;
     LDesdeProveedor: TLFLabel;
     GBAlmacen: TGroupBox;
     LDesdeAlmacen: TLFLabel;
     LHastaAlmacen: TLFLabel;
     EFAlmacen_D: TLFEditFind2000;
     EFAlmacen_H: TLFEditFind2000;
     DBEAlmacenDesde: TLFDbedit;
     DBEAlmacenHasta: TLFDbedit;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     LBLComentario: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFProveedorDChange(Sender: TObject);
     procedure EFProveedorHChange(Sender: TObject);
     procedure EFAlmacen_DChange(Sender: TObject);
     procedure EFAlmacen_HChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DTPDesdeChange(Sender: TObject);
     procedure DTPHastaChange(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregDepositosActivos : TFPregDepositosActivos;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFormGest, UUtiles, UFMListConfig, UDMRDepositosActivos,
  UDMListados;

procedure TFPregDepositosActivos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRDepositosActivos, DMRDepositosActivos);

  Grupo := 505;
  Listado := DMRDepositosActivos.frDepositosActivos;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Sender); // Calcula los limites
end;

procedure TFPregDepositosActivos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRDepositosActivos);
end;

procedure TFPregDepositosActivos.ARecargarExecute(Sender: TObject);
begin
  DMRDepositosActivos.Rangos;
  RGModo.ItemIndex := 0;
  EFProveedorD.Text := IntToStr(DMRDepositosActivos.ProvDesde);
  EFProveedorH.Text := IntToStr(DMRDepositosActivos.ProvHasta);
  EFArticulo_D.Text := DMRDepositosActivos.ArticuloDesde;
  EFArticulo_H.Text := DMRDepositosActivos.ArticuloHasta;
  EFAlmacen_D.Text := DMRDepositosActivos.AlmacenDesde;
  EFAlmacen_H.Text := DMRDepositosActivos.AlmacenHasta;
  DTPDesde.Date := DMRDepositosActivos.FechaDesde;
  DTPHasta.Date := DMRDepositosActivos.FechaHasta;
  EFMoneda.Text := REntorno.Moneda;
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TFPregDepositosActivos.EFArticulo_DChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRDepositosActivos.xArt_Desde, EFArticulo_D.Text);
end;

procedure TFPregDepositosActivos.EFArticulo_HChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRDepositosActivos.xArt_Hasta, EFArticulo_H.Text);
end;

procedure TFPregDepositosActivos.EFProveedorDChange(Sender: TObject);
begin
  Actualiza_ProveedorRO(DMRDepositosActivos.xProveedorD, EFProveedorD.Text);
end;

procedure TFPregDepositosActivos.EFProveedorHChange(Sender: TObject);
begin
  Actualiza_ProveedorRO(DMRDepositosActivos.xProveedorH, EFProveedorH.Text);
end;

procedure TFPregDepositosActivos.EFAlmacen_DChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMRDepositosActivos.xAlm_Desde, EFAlmacen_D.Text);
end;

procedure TFPregDepositosActivos.EFAlmacen_HChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMRDepositosActivos.xAlm_Hasta, EFAlmacen_H.Text);
end;

procedure TFPregDepositosActivos.FormShow(Sender: TObject);
begin
  EFProveedorD.SetFocus;
end;

procedure TFPregDepositosActivos.DTPDesdeChange(Sender: TObject);
begin
  DMRDepositosActivos.FechaDesde := DTPDesde.Date;
end;

procedure TFPregDepositosActivos.DTPHastaChange(Sender: TObject);
begin
  DMRDepositosActivos.FechaHasta := DTPHasta.Date;
end;

procedure TFPregDepositosActivos.EFArticulo_DBusqueda(Sender: TObject);
begin
  EFArticulo_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregDepositosActivos.EFArticulo_HBusqueda(Sender: TObject);
begin
  EFArticulo_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregDepositosActivos.EFMonedaChange(Sender: TObject);
begin
  DMRDepositosActivos.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregDepositosActivos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);
  DMRDepositosActivos.MostrarListado(RGModo.ItemIndex, Modo);
end;

end.
