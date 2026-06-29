unit UFPregComprasProveedores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest, Spin,
  rxToolEdit, ULFToolBar, ULFActionList, ULFEditFind2000, ULFDBEdit,
  ULFCheckBox, ULFPanel, TFlatCheckBoxUnit, ULFLabel, ULFDateEdit;

type
  TFPregComprasProveedores = class(TG2kForm)
     TBMain: TLFToolBar;
     TButtImprimir: TToolButton;
     TButtVisualizar: TToolButton;
     TButtSalir: TToolButton;
     PNLListArt: TLFPanel;
     ActionList: TLFActionList;
     ASalir: TAction;
     AVisualizar: TAction;
     AImprimir: TAction;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     ARecargar: TAction;
     ToolButton1: TToolButton;
     GBFechas: TGroupBox;
     LBLEjerDesde: TLFLabel;
     LBLEjerHasta: TLFLabel;
     LHastaCanal: TLFLabel;
     LDesdeCanal: TLFLabel;
     LHastaFecha: TLFLabel;
     LDesdeFecha: TLFLabel;
     SEAnoD: TSpinEdit;
     SEAnoH: TSpinEdit;
     SECanalH: TSpinEdit;
     SECanalD: TSpinEdit;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     GBSerie: TGroupBox;
     LHastaSerie: TLFLabel;
     LDesdeSerie: TLFLabel;
     EFSerieD: TLFEditFind2000;
     EFserieH: TLFEditFind2000;
     DBESerieH: TLFDbedit;
     DBESerieD: TLFDbedit;
     GBProveedor: TGroupBox;
     LHastaProveedor: TLFLabel;
     LDesdeProveedor: TLFLabel;
     EFProveedorD: TLFEditFind2000;
     EFProveedorH: TLFEditFind2000;
     DBEProveedorH: TLFDbedit;
     DBEProveedorD: TLFDbedit;
     GBArticulo: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     EFArt_Hasta: TLFEditFind2000;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     EFFamiliaH: TLFEditFind2000;
     DBEFamHasta: TLFDbedit;
     DBEFamDesde: TLFDbedit;
     GBOpciones: TGroupBox;
     LBLMoneda: TLFLabel;
     CBAlbaranes: TLFCheckBox;
     CBFacCerradas: TLFCheckBox;
     CBFacAbiertas: TLFCheckBox;
     EFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     procedure ASalirExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AVisualizarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFProveedorDChange(Sender: TObject);
     procedure EFProveedorHChange(Sender: TObject);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFserieHChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(proveedor: string);
  end;

var
  FPregComprasProveedores : TFPregComprasProveedores;

implementation

uses UUtiles, UEntorno, UFMListConfig, UDMMain, UDMLstComprasPro;

{$R *.DFM}

procedure TFPregComprasProveedores.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 
  AbreData(TDMLstComprasPro, DMLstComprasPro);
  ARecargar.Execute;
end;

procedure TFPregComprasProveedores.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregComprasProveedores.AImprimirExecute(Sender: TObject);
var
  albaran, facabiertas, faccerradas : smallint;
begin
  if CBAlbaranes.Checked then
     albaran := 1
  else
     albaran := 0;
  if CBFacAbiertas.Checked then
     facabiertas := 1
  else
     facabiertas := 0;
  if CBFacCerradas.Checked then
     faccerradas := 1
  else
     faccerradas := 0;
  DMLstComprasPro.Visualizar(0, albaran, faccerradas, facabiertas, SEAnoD.Value,
     SEAnoH.Value, SEcanalD.Value, SEcanalh.Value, StrToIntDef(EFProveedorD.Text, -1),
     StrToIntDef(EFProveedorH.Text, 9999999),
     EFArt_Desde.Text, EFArt_Hasta.Text, EFFamiliaD.Text, EFFamiliaH.Text,
     EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
     DTPfechaD.Date, DTPfechaH.Date);
end;

procedure TFPregComprasProveedores.AVisualizarExecute(Sender: TObject);
var
  albaran, facabiertas, faccerradas : smallint;
begin
  if CBAlbaranes.Checked then
     albaran := 1
  else
     albaran := 0;
  if CBFacAbiertas.Checked then
     facabiertas := 1
  else
     facabiertas := 0;
  if CBFacCerradas.Checked then
     faccerradas := 1
  else
     faccerradas := 0;
  DMLstComprasPro.Visualizar(0, albaran, faccerradas, facabiertas, SEAnoD.Value,
     SEAnoH.Value, SEcanalD.Value, SEcanalh.Value, StrToIntDef(EFProveedorD.Text, -1),
     StrToIntDef(EFProveedorH.Text, 9999999),
     EFArt_Desde.Text, EFArt_Hasta.Text, EFFamiliaD.Text, EFFamiliaH.Text,
     EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
     DTPfechaD.Date, DTPfechaH.Date);
end;

procedure TFPregComprasProveedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMLstComprasPro);
  Action := caFree;
end;

procedure TFPregComprasProveedores.EFArt_DesdeBusqueda(Sender: TObject);
begin
  EFArt_Desde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregComprasProveedores.EFArt_HastaBusqueda(Sender: TObject);
begin
  EFArt_Hasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregComprasProveedores.EFArt_DesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstComprasPro.xArt_Desde, EFArt_Desde.Text);
end;

procedure TFPregComprasProveedores.EFArt_HastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstComprasPro.xArt_Hasta, EFArt_Hasta.Text);
end;

procedure TFPregComprasProveedores.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(158, Formato, Cabecera, Copias,
     Pijama, '', DMLstComprasPro.frHYComprasProveedores);
end;

procedure TFPregComprasProveedores.ARecargarExecute(Sender: TObject);
var
  articulo_d, articulo_h, proveedorH, FamiliaD, FamiliaH, SerieD, SerieH : string;
begin
  DMLstComprasPro.Rango1(articulo_d, articulo_h, proveedorH, FamiliaD,
     FamiliaH, SerieD, SerieH);
  EFArt_Desde.Text := articulo_d;
  EFArt_Hasta.Text := articulo_h;
  EFProveedorD.Text := '-1';
  EFProveedorH.Text := ProveedorH;
  CBALbaranes.Checked := True;
  CBFacAbiertas.Checked := True;
  CBFacCerradas.Checked := True;
  SEAnoD.Value := REntorno.Ejercicio;
  SEAnoH.Value := REntorno.Ejercicio;
  DTPFechaD.Date := REntorno.FechaTrabSH;
  DTPFechaH.Date := REntorno.FechaTrabSH;
  EFSerieD.Text := SerieD;
  EFSerieH.Text := SerieH;
  SECanalD.Value := REntorno.canal;
  SECanalH.Value := REntorno.canal;
  EFFamiliaD.Text := FamiliaD;
  EFFamiliaH.Text := FamiliaH;
  EFMoneda.Text := REntorno.Moneda;
end;

procedure TFPregComprasProveedores.Muestra(proveedor: string);
begin
  EFProveedorD.Text := proveedor;
  EFProveedorH.Text := proveedor;
  ShowModal;
end;

procedure TFPregComprasProveedores.EFFamiliaDChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstComprasPro.xFam_Desde, EFFamiliaD.Text);
end;

procedure TFPregComprasProveedores.EFFamiliaHChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstComprasPro.xFam_Hasta, EFFamiliaH.Text);
end;

procedure TFPregComprasProveedores.EFProveedorDChange(Sender: TObject);
begin
  Actualiza_ProveedorEmpRO(DMLstComprasPro.xPro_Desde, EFProveedorD.Text);
end;

procedure TFPregComprasProveedores.EFProveedorHChange(Sender: TObject);
begin
  Actualiza_ProveedorEmpRO(DMLstComprasPro.xPro_Hasta, EFProveedorH.Text);
end;

procedure TFPregComprasProveedores.EFSerieDChange(Sender: TObject);
begin
  Actualiza_SerieEmpRO(DMLstComprasPro.xSerie_Desde, EFSerieD.Text);
end;

procedure TFPregComprasProveedores.EFserieHChange(Sender: TObject);
begin
  Actualiza_SerieEmpRO(DMLstComprasPro.xSerie_Hasta, EFSerieH.Text);
end;

procedure TFPregComprasProveedores.EFMonedaChange(Sender: TObject);
begin
  DMLstComprasPro.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregComprasProveedores.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregComprasProveedores.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

end.
