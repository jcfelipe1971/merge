unit ZUFPregUnidadesPendientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, ActnList, Mask, DBCtrls, Grids, DBGrids,
  rxToolEdit, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFEdit, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TZFPregUnidadesPendientes = class(TFPEditListadoSimple)
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
     DEFechaDesde: TDateEdit;
     DEFechaHasta: TDateEdit;
     GBCli: TGroupBox;
     EFClienteD: TLFEditFind2000;
     EFClienteH: TLFEditFind2000;
     DBEClienterH: TLFDbedit;
     DBEClienterD: TLFDbedit;
     LHastaCliente: TLFLabel;
     LDesdeCliente: TLFLabel;
     GBAlmacen: TGroupBox;
     LDesdeAlmacen: TLFLabel;
     LHastaAlmacen: TLFLabel;
     EFAlmacen_D: TLFEditFind2000;
     EFAlmacen_H: TLFEditFind2000;
     DBEAlmacenDesde: TLFDbedit;
     DBEAlmacenHasta: TLFDbedit;
     GBSeries: TGroupBox;
     LDesdeSerie: TLFLabel;
     LHastaSerie: TLFLabel;
     EFSerieD: TLFEditFind2000;
     EFSerieH: TLFEditFind2000;
     DBESerieD: TLFDbedit;
     DBESerieH: TLFDbedit;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     LBLComentario: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TDateEdit;
     GBFamilia: TGroupBox;
     EFFamiliaD: TLFEditFind2000;
     DBEFamiliaD: TLFDbedit;
     EFFamiliaH: TLFEditFind2000;
     DBEFamiliaH: TLFDbedit;
     LBLFamDesde: TLFLabel;
     LBLFamHasta: TLFLabel;
     GBCanal: TGroupBox;
     LDesdeCanal: TLFLabel;
     LHastaCanal: TLFLabel;
     EFCanalD: TLFEditFind2000;
     EFCanalH: TLFEditFind2000;
     DBECanadD: TLFDbedit;
     DBECanalH: TLFDbedit;
     RBOrdenar: TRadioGroup;
     PNLFechaSerie: TLFPanel;
     PNLCanalOrden: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFAlmacen_DChange(Sender: TObject);
     procedure EFAlmacen_HChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFSerieHChange(Sender: TObject);
     procedure DEFechaDesdeChange(Sender: TObject);
     procedure DEFechaHastaChange(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFCanalDChange(Sender: TObject);
     procedure EFCanalHChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  ZFPregUnidadesPendientes : TZFPregUnidadesPendientes;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFormGest, UUtiles, ZUDMRUnidadesPendientes, UDMListados,
  UFMain;

procedure TZFPregUnidadesPendientes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TZDMRUnidadesPendientes, ZDMRUnidadesPendientes);

  Grupo := 9006;
  Listado := ZDMRUnidadesPendientes.frUnidadesPendientes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargarExecute(Sender); // Calcula los limites

  FMain.AddComponentePunto(EFArticulo_D);
  FMain.AddComponentePunto(EFArticulo_H);
end;

procedure TZFPregUnidadesPendientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMRUnidadesPendientes);

  FMain.DelComponentePunto(EFArticulo_D);
  FMain.DelComponentePunto(EFArticulo_H);
end;

procedure TZFPregUnidadesPendientes.ARecargarExecute(Sender: TObject);
var
  dMin, dMax : TDateTime;
begin
  inherited;

  ZDMRUNidadesPendientes.Rangos;
  EFClienteD.Text := IntToStr(ZDMRUNidadesPendientes.CliDesde);
  EFClienteH.Text := IntToStr(ZDMRUNidadesPendientes.CliHasta);
  EFArticulo_D.Text := ZDMRUNidadesPendientes.ArticuloDesde;
  EFArticulo_H.Text := ZDMRUNidadesPendientes.ArticuloHasta;
  EFFamiliaD.Text := ZDMRUNidadesPendientes.FamiliaDesde;
  EFFamiliaH.Text := ZDMRUNidadesPendientes.FamiliaHasta;
  EFAlmacen_D.Text := ZDMRUNidadesPendientes.AlmacenDesde;
  EFAlmacen_H.Text := ZDMRUNidadesPendientes.AlmacenHasta;

  DameMinMax('EJE', dMin, dMax);
  DEFechaDesde.Date := dMin;
  DEFechaHasta.Date := dMax;

  EFSerieD.Text := ZDMRUnidadesPendientes.SerieDesde;
  EFSerieH.Text := ZDMRUnidadesPendientes.SerieHasta;
  EFCanalD.Text := IntToStr(ZDMRUnidadesPendientes.CanalDesde);
  EFCanalH.Text := IntToStr(ZDMRUnidadesPendientes.CanalHasta);
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TZFPregUnidadesPendientes.EFArticulo_DChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(ZDMRUNidadesPendientes.xArt_Desde, EFArticulo_D.Text);
end;

procedure TZFPregUnidadesPendientes.EFArticulo_HChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(ZDMRUNidadesPendientes.xArt_Hasta, EFArticulo_H.Text);
end;

procedure TZFPregUnidadesPendientes.EFClienteDChange(Sender: TObject);
begin
  Actualiza_ClienteRO(ZDMRUNidadesPendientes.xClienteD, EFClienteD.Text);
end;

procedure TZFPregUnidadesPendientes.EFClienteHChange(Sender: TObject);
begin
  Actualiza_ClienteRO(ZDMRUNidadesPendientes.xClienteH, EFClienteH.Text);
end;

procedure TZFPregUnidadesPendientes.EFAlmacen_DChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(ZDMRUNidadesPendientes.xAlm_Desde, EFAlmacen_D.Text);
end;

procedure TZFPregUnidadesPendientes.EFAlmacen_HChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(ZDMRUNidadesPendientes.xAlm_Hasta, EFAlmacen_H.Text);
end;

procedure TZFPregUnidadesPendientes.FormShow(Sender: TObject);
begin
  EFClienteD.SetFocus;
end;

procedure TZFPregUnidadesPendientes.EFSerieDChange(Sender: TObject);
begin
  Actualiza_SerieRO(ZDMRUNidadesPendientes.xSerie_desde, EFSerieD.Text);
end;

procedure TZFPregUnidadesPendientes.EFSerieHChange(Sender: TObject);
begin
  Actualiza_SerieRO(ZDMRUNidadesPendientes.xSerie_hasta, EFSerieH.Text);
end;

procedure TZFPregUnidadesPendientes.DEFechaDesdeChange(Sender: TObject);
begin
  ZDMRUNidadesPendientes.FechaDesde := DEFechaDesde.Date;
end;

procedure TZFPregUnidadesPendientes.DEFechaHastaChange(Sender: TObject);
begin
  ZDMRUNidadesPendientes.FechaHasta := DEFechaHasta.Date + StrToTime('23:59:00');
end;

procedure TZFPregUnidadesPendientes.EFArticulo_DBusqueda(Sender: TObject);
begin
  EFArticulo_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregUnidadesPendientes.EFArticulo_HBusqueda(Sender: TObject);
begin
  EFArticulo_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregUnidadesPendientes.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregUnidadesPendientes.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregUnidadesPendientes.EFFamiliaDChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(ZDMRUNidadesPendientes.xFamiliaD, EFFamiliaD.Text);
end;

procedure TZFPregUnidadesPendientes.EFFamiliaHChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(ZDMRUNidadesPendientes.xFamiliaH, EFFamiliaH.Text);
end;

procedure TZFPregUnidadesPendientes.EFCanalDChange(Sender: TObject);
begin
  inherited;
  Actualiza_CanalRO(ZDMRUNidadesPendientes.xCanalDesde, StrToInt(EFCanalD.Text));
end;

procedure TZFPregUnidadesPendientes.EFCanalHChange(Sender: TObject);
begin
  inherited;
  Actualiza_CanalRO(ZDMRUNidadesPendientes.xCanalHasta, StrToInt(EFCanalH.Text));
end;

procedure TZFPregUnidadesPendientes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  ZDMRUNidadesPendientes.MostrarListado(Modo, RBOrdenar.ItemIndex, DTPFechaListado.Date, EComentario.Text);
end;

end.
