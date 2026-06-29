unit UFMTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, ExtCtrls, DBCtrls, Mask, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFHYDBDescription,
  UHYDescription, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc,
  UFPEditDetalle;

type
  TFMTarifas = class(TFPEditDetalle)
     LBLTarifa: TLFLabel;
     DBETarifa: TLFDbedit;
     LBLNombre: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCHKActiva: TLFDBCheckBox;
     DBEFMoneda: TLFDBEditFind2000;
     LBLMoneda: TLFLabel;
     HYDBDMoneda: TLFHYDBDescription;
     DBCKBIvaIncluido: TLFDBCheckBox;
     ARecalcula: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AVisualizarTarifasDetalladas: TAction;
     AImprimirTarifasDetalladas: TAction;
     ATarifasDetalladas: TAction;
     AArticulosPorTarifasFiltradas: TAction;
     APreciosTarifas: TAction;
     APreciosporTarifasDetallado: TAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfListadoTarifasDetalladas: TAction;
     AConfListadodeTarifasIVADesglosado: TAction;
     AConfListadoArtPorTarifas: TAction;
     AConfListadoPrecioTarifas: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ASep: TAction;
     AAsignaAClientesFiltrados: TAction;
     ARecalculaPrecioMercado: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure MuestraFiltrado(tipo: byte);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFMonedaChange(Sender: TObject);
     procedure ARecalculaExecute(Sender: TObject);
     procedure AVisualizarTarifasDetalladasExecute(Sender: TObject);
     procedure AImprimirTarifasDetalladasExecute(Sender: TObject);
     procedure ATarifasDetalladasExecute(Sender: TObject);
     procedure AArticulosPorTarifasFiltradasExecute(Sender: TObject);
     procedure APreciosTarifasExecute(Sender: TObject);
     procedure APreciosporTarifasDetalladoExecute(Sender: TObject);
     procedure AConfListadoTarifasDetalladasExecute(Sender: TObject);
     procedure AConfListadodeTarifasIVADesglosadoExecute(Sender: TObject);
     procedure AConfListadoArtPorTarifasExecute(Sender: TObject);
     procedure AConfListadoPrecioTarifasExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAsignaAClientesFiltradosExecute(Sender: TObject);
     procedure ARecalculaPrecioMercadoExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     SWFil: integer;
  end;

var
  FMTarifas : TFMTarifas;

implementation

uses UDMTarifas, UFormGest, UDMMain, UFPregTarifas, UFPregArticulos,
  UDMLstTarifas, UFMListConfig, UUtiles, UFPregArtTarifas, UFPregArtTarifasDetallado, UFMClientes;

{$R *.DFM}

procedure TFMTarifas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTarifas, DMTarifas);

  NavMain.DataSource := DMTarifas.DSQMTarifas;
  DBGMain.DataSource := DMTarifas.DSQMTarifas;
  G2kTableLoc.DataSource := DMTarifas.DSQMTarifas;

  NavDetalle.DataSource := DMTarifas.DSQMDetalle;
  DBGFDetalle.DataSource := DMTarifas.DSQMDetalle;

  SWFil := 0;

  // Color campo ID
  ColorCampoID(DBETarifa);
end;

procedure TFMTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTarifas);
end;

procedure TFMTarifas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  SWFil := 1;
  DMTarifas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTarifas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  DMTarifas.CambiaMascara;
end;

procedure TFMTarifas.MuestraFiltrado(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DMTarifas.QMTarifas.SelectSQL);
  AbreData(TDMLstTarifas, DMlstTarifas);
  TempSql.AddStrings(DMLstTarifas.TTarifas.SelectSQL);
  DMLstTarifas.TTarifas.Close;
  DMLstTarifas.TTarifas.SelectSQL.Assign(SqlFiltro);
  DMLstTarifas.MostrarFiltrado(tipo, SWFil);
  DMLstTarifas.TTarifas.Close;
  DMLstTarifas.TTarifas.SelectSQL.Assign(TempSQL);
  CierraData(DMLstTarifas);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMTarifas.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  DMTarifas.GrabaCabacera;
end;

procedure TFMTarifas.DBEFMonedaChange(Sender: TObject);
begin
  HYDBDMoneda.ActualizaDatos('MONEDA', DBEFMoneda.Text);
end;

procedure TFMTarifas.ARecalculaExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
  begin
     DMTarifas.RecalculaTarifa;
     ShowMessage(_('Proceso Terminado.'));
  end;
end;

procedure TFMTarifas.AVisualizarTarifasDetalladasExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMTarifas.AImprimirTarifasDetalladasExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMTarifas.ATarifasDetalladasExecute(Sender: TObject);
begin
  inherited;
  // Listado de Tarifas Detalladas y de IVA desglosado
  TFPregTarifas.Create(Self).Muestra;
end;

procedure TFMTarifas.AArticulosPorTarifasFiltradasExecute(Sender: TObject);
var
  TempSql : TStringList;
begin
  inherited;
  // Obtenemos el select de tarifas, ya que es un listado filtrado
  TempSql := TStringList.Create;
  TempSql.AddStrings(DMTarifas.QMTarifas.SelectSQL);
  TFPregArticulos.Create(Self).ArticulosPorTarifa(TempSql, SWFil);
  TempSql.Free;
end;

procedure TFMTarifas.APreciosTarifasExecute(Sender: TObject);
begin
  inherited;
  TFPregArtTarifas.Create(Self).Muestra;
end;

procedure TFMTarifas.APreciosporTarifasDetalladoExecute(Sender: TObject);
begin
  inherited;
  TFPregArtTarifasDetallado.Create(Self).Muestra;
end;

procedure TFMTarifas.AConfListadoTarifasDetalladasExecute(Sender: TObject);
//var
//  formato,cabecera,copias,pijama:integer;
begin
  //  inherited;
  //  AbreData(TDMLstTarifas,DMLstTarifas);
  //  TFMListConfig.Create( Self ).Muestra(53,formato,cabecera,copias,pijama,'',DMLstTarifas.frTarifas);
  //  CierraData(DMLstTarifas);
end;

procedure TFMTarifas.AConfListadodeTarifasIVADesglosadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTarifas, DMLstTarifas);
  TFMListConfig.Create(Self).Muestra(90, formato, cabecera, copias,
     pijama, '', DMLstTarifas.frTarifas);
  CierraData(DMLstTarifas);
end;

procedure TFMTarifas.AConfListadoArtPorTarifasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTarifas, DMLstTarifas);
  TFMListConfig.Create(Self).Muestra(53, formato, cabecera, copias,
     pijama, '', DMLstTarifas.frTarifas);
  CierraData(DMLstTarifas);
end;

procedure TFMTarifas.AConfListadoPrecioTarifasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTarifas, DMLstTarifas);
  TFMListConfig.Create(Self).Muestra(54, formato, cabecera, copias,
     pijama, '', DMLstTarifas.frTarifas);
  CierraData(DMLstTarifas);
end;

procedure TFMTarifas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMTarifas.AAsignaAClientesFiltradosExecute(Sender: TObject);
begin
  inherited;
  if (Assigned(FMClientes)) then
  begin
     FMClientes.AsignaTarifa(DBETarifa.Text);
  end;
end;

procedure TFMTarifas.ARecalculaPrecioMercadoExecute(Sender: TObject);
begin
  inherited;
  DMTarifas.RecalculaPrecioMercado;
end;

end.
