unit UFMCierreParcialOrden;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFLabel, HYFIBQuery, rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFEditFind2000,
  ULFFIBDBEditFind, ULFEdit;

type
  TFMCierreParcialOrden = class(TFPEdit)
     LCierre: TLFLabel;
     LFecha: TLFLabel;
     LEstado: TLFLabel;
     DBECierre: TLFDbedit;
     PNLDetalle: TLFPanel;
     DBGDetalle: TDBGridFind2000;
     PNLSubDetalle: TLFPanel;
     DBGSubDetalle: TDBGridFind2000;
     TBSubDetalle: TLFToolBar;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     NavSubDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CESubDetalle: TControlEdit;
     PUDetalle: TPopUpTeclas;
     MenuItem1: TMenuItem;
     MenuItem2: TMenuItem;
     MenuItem3: TMenuItem;
     MenuItem4: TMenuItem;
     MenuItem5: TMenuItem;
     MenuItem6: TMenuItem;
     MenuItem7: TMenuItem;
     MenuItem8: TMenuItem;
     MenuItem9: TMenuItem;
     MenuItem10: TMenuItem;
     MenuItem11: TMenuItem;
     MenuItem12: TMenuItem;
     MenuItem13: TMenuItem;
     MenuItem14: TMenuItem;
     MenuItem15: TMenuItem;
     MenuItem16: TMenuItem;
     MenuItem17: TMenuItem;
     MenuItem18: TMenuItem;
     MenuItem19: TMenuItem;
     MenuItem20: TMenuItem;
     MenuItem21: TMenuItem;
     PUSubDetalle: TPopUpTeclas;
     PMDetalle: TMenuItem;
     MenuItem23: TMenuItem;
     MenuItem24: TMenuItem;
     MenuItem25: TMenuItem;
     MenuItem26: TMenuItem;
     MenuItem27: TMenuItem;
     MenuItem28: TMenuItem;
     MenuItem29: TMenuItem;
     MenuItem30: TMenuItem;
     MenuItem31: TMenuItem;
     MenuItem32: TMenuItem;
     MenuItem33: TMenuItem;
     MenuItem34: TMenuItem;
     MenuItem35: TMenuItem;
     MenuItem36: TMenuItem;
     MenuItem37: TMenuItem;
     MenuItem38: TMenuItem;
     MenuItem39: TMenuItem;
     MenuItem40: TMenuItem;
     MenuItem41: TMenuItem;
     MenuItem42: TMenuItem;
     LComentario: TLFLabel;
     DBEComentario: TLFDbedit;
     DBEFecha: TLFDBDateEdit;
     ETextoEstado: TLFEdit;
     TButtAdelante: TToolButton;
     TButtAtras: TToolButton;
     AListado: TAction;
     LFActionList1: TLFActionList;
     AAtras: TAction;
     AAdelante: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     AConfListado: TAction;
     LBLSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     PNLSerie: TLFPanel;
     AMovimiento: TAction;
     PNLInfo: TLFPanel;
     LBLSumaUnidades: TLFLabel;
     DBESumUnidades: TLFDbedit;
     AListarEtiquetas: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure DBGSubDetalleBusqueda(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSTablaExit(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AListadoExecute(Sender: TObject);
     procedure AAtrasExecute(Sender: TObject);
     procedure AAdelanteExecute(Sender: TObject);
     procedure AConfListadoExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGDetalleBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGDetalleDblClick(Sender: TObject);
     procedure AMovimientoExecute(Sender: TObject);
     procedure DBGDetalleCellClick(Column: TColumn);
     procedure DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AListarEtiquetasExecute(Sender: TObject);
  private
     { Private declarations }
     PanelHeigh: integer;
     ColActual: TColumn;
     procedure AjustaBotones;
  public
     { Public declarations }
     procedure Filtra(id_cierre: string);
     procedure CrearCierre(id_orden: integer);
  end;

var
  FMCierreParcialOrden : TFMCierreParcialOrden;

implementation

uses UDMCierreParcialOrden, UFormGest, UDMMain, UEntorno, UDMLstCierreParcialOrden,
  UDMListados, UFMListConfig, UFMain, UUtiles, UFMImprimirCodBarras, UParam, UDameDato;

{$R *.dfm}

procedure TFMCierreParcialOrden.FormCreate(Sender: TObject);
var
  Columna : integer;
  Ubicable : boolean;
begin
  inherited;
  PanelHeigh := 0;
  AbreData(TDMCierreParcialOrden, DMCierreParcialOrden);
  CEMain.DataSource := DMCierreParcialOrden.DSQMCierreParcial;
  NavMain.DataSource := DMCierreParcialOrden.DSQMCierreParcial;
  DBGMain.DataSource := DMCierreParcialOrden.DSQMCierreParcial;
  G2kTableLoc.DataSource := DMCierreParcialOrden.DSQMCierreParcial;
  CEDetalle.DataSource := DMCierreParcialOrden.DSQMCierreParcialDetalle;
  CESubDetalle.DataSource := DMCierreParcialOrden.DSQMCierreParcialDetalleLote;
  DBGDetalle.DataSource := DMCierreParcialOrden.DSQMCierreParcialDetalle;
  EFSerie.Text := REntorno.Serie;

  Columna := EncuentraField(DBGDetalle, 'ID_ORDEN');
  if (Columna >= 0) then
     DBGDetalle.Columns[Columna].Color := REntorno.ColorEnlaceActivo;

  // Si no s'utilitza unidades logisticas, no visualitza la columna
  if (StrToIntDef(LeeParametro('SYSCONF005'), 0) = 0) then {Utiliza unidades logisticas}
  begin
     DBGSubdetalle.FindColumn('TIPO_UNIDAD_LOGISTICA').Visible := False;
     DBGSubdetalle.FindColumn('UNIDADES_LOGISITCAS').Visible := False;
  end
  else
  begin
     DBGSubdetalle.FindColumn('TIPO_UNIDAD_LOGISTICA').Visible := True;
     DBGSubdetalle.FindColumn('UNIDADES_LOGISITCAS').Visible := True;
  end;

  // Es comprova que l'article i magatzem facin servir ubicacio
  Ubicable := DMMain.CompruebaControlUbicacionAlmacen(DMCierreParcialOrden.QMCierreParcialDetalleALMACEN.AsString);
  Columna := EncuentraField(DBGSubdetalle, 'ID_UBICACION');
  if (Columna >= 0) then
     DBGSubdetalle.Columns[Columna].Visible := Ubicable;
  Columna := EncuentraField(DBGSubdetalle, 'UBICACION');
  if (Columna >= 0) then
     DBGSubdetalle.Columns[Columna].Visible := Ubicable;

  if (DMCierreParcialOrden.CrearLoteLanzarOP) then
  begin
     DBGSubdetalle.FindColumn('ID_LOTE').ReadOnly := True;
     DBGSubdetalle.FindColumn('ID_LOTE').Color := clInfobk;
     DBGSubdetalle.ColumnaInicial := DBGSubdetalle.FindColumn('ALM_DEST').Index;
  end
  else
  begin
     DBGSubdetalle.FindColumn('ID_LOTE').ReadOnly := False;
     DBGSubdetalle.FindColumn('ID_LOTE').Color := clWindow;
     DBGSubdetalle.ColumnaInicial := DBGSubdetalle.FindColumn('ID_LOTE').Index;
  end;

  ColActual := DBGDetalle.Columns[0];
  DBGDetalle.FindColumn('RIG_MOV').Color := REntorno.ColorEnlaceActivo;

  AjustaBotones;
end;

procedure TFMCierreParcialOrden.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMCierreParcialOrden);
end;

procedure TFMCierreParcialOrden.DBGDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if (Trim(DBGDetalle.TablaABuscar) = 'PRO_ORD') then
     DBGDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND CANAL=' + REntorno.CanalStr + ' AND SERIES=''' + Trim(EFSerie.Text) + ''' AND SITUACION >= 2' +
        ' AND SITUACION<=3';
end;

procedure TFMCierreParcialOrden.DBGSubDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if (Trim(DBGSubDetalle.TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     DBGSubDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ALMACEN = ''' + DMCierreParcialOrden.QMCierreParcialDetalleLoteALM_DEST.AsString + '''';
  if (Trim(DBGSubDetalle.TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
     DBGSubDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + DMCierreParcialOrden.QMCierreParcialDetalleARTICULO.AsString + '''';
  if (Trim(DBGSubDetalle.TablaABuscar) = 'ART_ARTICULOS_UNIDAD_LOGISTICA') then
     DBGSubDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + DMCierreParcialOrden.QMCierreParcialDetalleARTICULO.AsString + '''';
  if (Trim(DBGSubDetalle.TablaABuscar) = 'VER_ARTICULOS_UNID_LOG') then
     DBGSubDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + DMCierreParcialOrden.QMCierreParcialDetalleARTICULO.AsString + '''';
  if (Trim(DBGSubDetalle.TablaABuscar) = 'ART_ALMACENES') then
     DBGSubDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr {+ ' AND CTRO_UBICACION=1'};
end;

procedure TFMCierreParcialOrden.TSTablaShow(Sender: TObject);
begin
  inherited;
  PanelHeigh := PMain.Height;
  PMain.Align := alClient;
  PNLDetalle.Visible := False;
end;

procedure TFMCierreParcialOrden.TSTablaExit(Sender: TObject);
begin
  inherited;
  PMain.Align := alTop;
  PMain.Height := PanelHeigh;
  PNLDetalle.Visible := True;
end;

procedure TFMCierreParcialOrden.AjustaBotones;
begin
  if ((not DMCierreParcialOrden.QMCierreParcial.Active) or (DMCierreParcialOrden.QMCierreParcialESTADO.AsInteger = 0)) then
  begin
     ETextoEstado.Text := _('Normal');
     AAdelante.Enabled := True;
     // AAtras.Hint := '';
     AAtras.Enabled := False;
     ETextoEstado.Color := clInfoBk;
  end
  else
  begin
     ETextoEstado.Text := _('Cerrado');
     // AAdelante.Hint := '';
     AAdelante.Enabled := False;
     AAtras.Enabled := True;
     ETextoEstado.Color := clRed;
  end;
end;

procedure TFMCierreParcialOrden.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  AjustaBotones;
end;

procedure TFMCierreParcialOrden.AListadoExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMListados, DMListados);
  AbreData(TDMLstCierreParcialOrden, DMLstCierreParcialOrden);
  DMLstCierreParcialOrden.MuestraListado(0, DMCierreParcialOrden.QMCierreParcialEMPRESA.AsInteger,
     DMCierreParcialOrden.QMCierreParcialEJERCICIO.AsInteger, DMCierreParcialOrden.QMCierreParcialCANAL.AsInteger,
     DMCierreParcialOrden.QMCierreParcialSERIE.AsString, DMCierreParcialOrden.QMCierreParcialCIERRE.AsInteger);
  CierraData(DMLstCierreParcialOrden);
  CierraData(DMListados);
end;

procedure TFMCierreParcialOrden.AAtrasExecute(Sender: TObject);
begin
  inherited;
  DMCierreParcialOrden.CambiaEstado(-1);
  AjustaBotones;
end;

procedure TFMCierreParcialOrden.AAdelanteExecute(Sender: TObject);
begin
  inherited;
  DMCierreParcialOrden.CambiaEstado(1);
  AjustaBotones;
end;

procedure TFMCierreParcialOrden.AConfListadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMListados, DMListados);
  AbreData(TDMLstCierreParcialOrden, DMLstCierreParcialOrden);
  TFMListConfig.Create(Self).Muestra(5104, Formato, Cabecera, Copias, Pijama, '', DMLstCierreParcialOrden.frListadoCierre);
  CierraData(DMLstCierreParcialOrden);
  CierraData(DMListados);
end;

procedure TFMCierreParcialOrden.EFSerieChange(Sender: TObject);
begin
  inherited;
  DMCierreParcialOrden.Filtra(EFSerie.Text);
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMCierreParcialOrden.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.CondicionBusqueda := 'SERIE=''' + Trim(EFSerie.Text) + ''' AND ESTADO=0';
  G2kTableLoc.Click;
end;

procedure TFMCierreParcialOrden.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCierreParcialOrden.BusquedaCompleja;
end;

procedure TFMCierreParcialOrden.DBGDetalleDblClick(Sender: TObject);
begin
  if DMCierreParcialOrden.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'RIG_MOV') then
        AMovimiento.Execute;

     if (UpperCase(ColActual.FieldName) = 'ID_ORDEN') then
        FMain.EjecutaAccion(FMain.AProOrden, DMCierreParcialOrden.QMCierreParcialDetalleID_ORDEN.AsString);
  end;
end;

procedure TFMCierreParcialOrden.AMovimientoExecute(Sender: TObject);
begin
  FMain.MuestraDocumento(DMCierreParcialOrden.QMCierreParcialEJERCICIO.AsInteger, 'MVS', DMCierreParcialOrden.QMCierreParcialSERIE.AsString,
     DMCierreParcialOrden.QMCierreParcialDetalleRIG_MOV.AsInteger);
end;

procedure TFMCierreParcialOrden.DBGDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMCierreParcialOrden.DBGDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if DMCierreParcialOrden.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'RIG_MOV') then
     begin
        CeldaEnlace(DBGDetalle, Rect);
     end;
  end;
  DBGDetalle.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMCierreParcialOrden.Filtra(id_cierre: string);
begin
  if (id_cierre <> '') then
     DMCierreParcialOrden.FiltraCierre(StrToIntDef(id_cierre, 0));
  AjustaBotones;
end;

procedure TFMCierreParcialOrden.CrearCierre(id_orden: integer);
begin
  DMCierreParcialOrden.CrearCierre(id_orden);
  Close;
end;

procedure TFMCierreParcialOrden.AListarEtiquetasExecute(Sender: TObject);
var
  SQL : TStrings;
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  if (DMMain.EstadoKri(490) = 1) then  //Verificamos si las etiquetas se harán por lotes
  begin
     SQL := TStringList.Create;
     try
        DMCierreParcialOrden.DameSqlImpresionEtiquetas(SQL);
        FMImprimirCodBarras.ImportarDatosSql('CIE', DMCierreParcialOrden.QMCierreParcialID.AsInteger, SQL);
     finally
        SQL.Free;
     end;
  end
  else
     FMImprimirCodBarras.ImportarDatos('CIE', DMCierreParcialOrden.QMCierreParcialID.AsInteger);
end;

end.
