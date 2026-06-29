unit UFMOrdenProduccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UDBDateTimePicker, ActnList,
  UHYDescription, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFDBMemo,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFHYDBDescription, ULFLabel,
  ULFEditFind2000, UG2kTBLoc, HYFIBQuery, ULFDBDateEdit, Buttons;

type
  TFMOrdenProduccion = class(TFPEdit)
     LBLNumOrden: TLFLabel;
     LBLEscandallo: TLFLabel;
     LBLArticulo: TLFLabel;
     LBLUnidades: TLFLabel;
     DBENumOrden: TLFDbedit;
     DBEFArticulo: TLFDBEditFind2000;
     DBEFEscandallo: TLFDBEditFind2000;
     DBEUnidades: TLFDbedit;
     GBPedido: TGroupBox;
     LBLPedido: TLFLabel;
     DBEFPedido: TLFDBEditFind2000;
     LBLLinea: TLFLabel;
     DBEFLinea: TLFDBEditFind2000;
     DBETitArticulo: TLFDbedit;
     GBFechas: TGroupBox;
     LBLFechaEntrega: TLFLabel;
     LBLFechaInicio: TLFLabel;
     LBLFechaInicioProd: TLFLabel;
     DBDTPFEntrega: TLFDBDateEdit;
     DBDTPFInicio: TLFDBDateEdit;
     DBDTPFInicioProd: TLFDBDateEdit;
     LBLEstado: TLFLabel;
     DBEEstado: TLFDbedit;
     LBLPrioridad: TLFLabel;
     LBLMerma: TLFLabel;
     DBEPrioridad: TLFDbedit;
     DBEMerma: TLFDbedit;
     GBCantidades: TGroupBox;
     LBLCantOrdenada: TLFLabel;
     LBLEsperada: TLFLabel;
     LBLFinal: TLFLabel;
     DBECantOrdenada: TLFDbedit;
     DBECantEsperada: TLFDbedit;
     DBECantFinal: TLFDbedit;
     LBLMaterial: TLFLabel;
     DBEFMaterial: TLFDBEditFind2000;
     DBETitMaterial: TLFDbedit;
     LBLAlmacen: TLFLabel;
     DBEFAlmacen: TLFDBEditFind2000;
     DBETitAlmacen: TLFDbedit;
     LBLSerie: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     DBETitSerie: TLFDbedit;
     DBDTPFecha_orden: TLFDBDateEdit;
     Label1: TLFLabel;
     DBETercero: TLFDBEditFind2000;
     LBLOperario: TLFLabel;
     HYDBDOperario: TLFHYDBDescription;
     TSNotas: TTabSheet;
     TSProcesos: TTabSheet;
     CENotas: TControlEdit;
     ControlEdit1PMEdit: TPopUpTeclas;
     TBNotas: TLFToolBar;
     PNLNotas: TLFPanel;
     DBEOrdenNot: TLFDbedit;
     DBEDesNotas: TLFDbedit;
     NavNotas: THYMNavigator;
     PNLENotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     CEProcesos: TControlEdit;
     TBProcesoso: TLFToolBar;
     Panel1: TLFPanel;
     DBENordenProcesos: TLFDbedit;
     DBEArtProcesos: TLFDbedit;
     HYNavProcesoso: THYMNavigator;
     PNProcesos: TLFPanel;
     CEProcesosPMEdit: TPopUpTeclas;
     DBGFProcesos: TDBGridFind2000;
     ToolButton3: TToolButton;
     ToolButton4: TToolButton;
     AEscandallo: TAction;
     AInicioProduccion: TAction;
     ALanzar: TAction;
     ADeslanzar: TAction;
     ACerradoParcial: TAction;
     ACerrar: TAction;
     AAbrir: TAction;
     AInfoLotes: TAction;
     EFSerieKri: TLFEditFind2000;
     Label2: TLFLabel;
     DBDateEdit1: TLFDBDateEdit;
     ARegenerarEscandalloKri: TAction;
     AListadoOrdenesProduccion: TAction;
     ADesgloseOrdenProduccion: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     LFDBEEjercicioKri: TLFDbedit;
     PNLSelOrdenKri: TLFPanel;
     EFOrdenKri: TLFEditFind2000;
     LOrden: TLFLabel;
     TButtCierraOrdenKri: TToolButton;
     AListadoCodigoBarras: TAction;
     SBAArticulo: TSpeedButton;
     AArticulo: TAction;
     AArticulosEscandallo: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFSerieBusqueda(Sender: TObject);
     procedure DBEFPedidoBusqueda(Sender: TObject);
     procedure DBEFEscandalloBusqueda(Sender: TObject);
     procedure DBEFLineaBusqueda(Sender: TObject);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure DBETerceroChange(Sender: TObject);
     procedure DBGFProcesosBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSProcesosShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure AEscandalloExecute(Sender: TObject);
     procedure AInicioProduccionExecute(Sender: TObject);
     procedure ALanzarExecute(Sender: TObject);
     procedure ADeslanzarExecute(Sender: TObject);
     procedure ACerradoParcialExecute(Sender: TObject);
     procedure ACerrarExecute(Sender: TObject);
     procedure AAbrirExecute(Sender: TObject);
     procedure AInfoLotesExecute(Sender: TObject);
     procedure EFSerieKriChange(Sender: TObject);
     procedure ARegenerarEscandalloKriExecute(Sender: TObject);
     procedure AListadoOrdenesProduccionExecute(Sender: TObject);
     procedure ADesgloseOrdenProduccionExecute(Sender: TObject);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EFOrdenKriExiste(Sender: TObject);
     procedure AListadoCodigoBarrasExecute(Sender: TObject);
     procedure SBAArticuloClick(Sender: TObject);
     procedure AArticuloExecute(Sender: TObject);
     procedure AArticulosEscandalloExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMOrdenProduccion : TFMOrdenProduccion;

implementation

uses UDMOrdenProduccion, UFormGest, UDMMain, UEntorno, UFMEscandalloOrden,
  UFMCantidadOrden, UFPregOrdenes, UFPregOrdenEsc, UFMInfolotes_Produccion,
  UFMain, UUtiles;

{$R *.DFM}

procedure TFMOrdenProduccion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMOrdenProduccion, DMOrdenProduccion);

  // Conectamos los datasources
  NavMain.DataSource := DMOrdenProduccion.DSQMOrdenProd;
  DBGMain.DataSource := DMOrdenProduccion.DSQMOrdenProd;

  // Conectamos las teclas
  CEMain.Teclas := DMMain.Teclas;
  EFSerieKri.Text := REntorno.Serie;

  SolapaControles(SBAArticulo, DBETitArticulo);
  DBETitArticulo.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMOrdenProduccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMOrdenProduccion);
  Action := caFree;
end;

procedure TFMOrdenProduccion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // Llamada al buscador
  DMOrdenProduccion.BusquedaCompleja;
end;

procedure TFMOrdenProduccion.DBEFSerieBusqueda(Sender: TObject);
begin
  inherited;
  // Sólo queremos las series activas
  DBEFSerie.CondicionBusqueda := 'ACTIVO=1';
end;

procedure TFMOrdenProduccion.DBEFPedidoBusqueda(Sender: TObject);
begin
  inherited;
  // Pedidos no cerrados y con alguna línea sin O.P. asociada
  DBEFPedido.SelectSQL.Text := 'select distinct(rig) from ver_detalle_pedido';

  DBEFPedido.CondicionBusqueda := 'SERIE = ''' + DBEFSerie.Text +
     ''' AND ORDEN_PRODUCCION=0' +
     ' AND ESTADO<>5';
end;

procedure TFMOrdenProduccion.DBEFEscandalloBusqueda(Sender: TObject);
begin
  inherited;
  // Escandallo del artículo elegido
  DBEFEscandallo.CondicionBusqueda := 'ARTICULO=''' + DBEFArticulo.Text + '''';
end;

procedure TFMOrdenProduccion.DBEFLineaBusqueda(Sender: TObject);
begin
  inherited;
  // Líneas del pedido elegido y que no tengan O.P. asociada
  DBEFLinea.CondicionBusqueda := 'SERIE=''' + DBEFSerie.Text + ''' AND RIG=' +
     DBEFPedido.Text + ' AND ORDEN_PRODUCCION=0 AND SERVIDO=0';
end;

procedure TFMOrdenProduccion.DBEFArticuloBusqueda(Sender: TObject);
begin
  inherited;
  // Todos los artículos menos los del sistema
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema +
     ''' AND PRODUCCION=1';
end;

procedure TFMOrdenProduccion.DBETerceroChange(Sender: TObject);
begin
  HYDBDOperario.ActualizaDatos('TERCERO', DBETercero.Text);
end;

procedure TFMOrdenProduccion.DBGFProcesosBusqueda(Sender: TObject);
begin
  if Trim(DBGFProcesos.TablaABuscar) = 'EMP_PROCESOS_PRODUCCION' then
     DBGFProcesos.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr
  else
     DBGFProcesos.CondicionBusqueda := '';
end;

procedure TFMOrdenProduccion.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMOrdenProduccion.TSProcesosShow(Sender: TObject);
begin
  ControlEdit := CEProcesos;
end;

procedure TFMOrdenProduccion.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMOrdenProduccion.AEscandalloExecute(Sender: TObject);
begin
  inherited;
  // Escandallo asociado a la orden
  EscandalloOrden(Self, DMOrdenProduccion.DameOrden, DMOrdenProduccion.QMOrdenProdSERIE.AsString);
end;

procedure TFMOrdenProduccion.AInicioProduccionExecute(Sender: TObject);
begin
  inherited;
  DMOrdenProduccion.ModificaFecha(DMOrdenProduccion.FechaInicioProd(1));
end;

procedure TFMOrdenProduccion.ALanzarExecute(Sender: TObject);
begin
  inherited;
  // Lanzamos la orden de producción
  try
     Screen.Cursor := crHourGlass;
     DMOrdenProduccion.LanzaOrden;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMOrdenProduccion.ADeslanzarExecute(Sender: TObject);
begin
  inherited;
  // Deslanzamos la orden de producción
  try
     Screen.Cursor := crHourGlass;
     DMOrdenProduccion.DeslanzarOrden;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMOrdenProduccion.ACerradoParcialExecute(Sender: TObject);
var
  Cantidad : real;
begin
  inherited;
  // Cerrado parcial de la orden de producción, pedimos la cantidad obtenida
  FMCantidadOrden := TFMCantidadOrden.Create(Self);
  if (FMCantidadOrden.ShowModal = mrOk) then
  begin
     try
        Cantidad := StrToFloatDef(FMCantidadOrden.EDTCantidadProd.Text, 0); {dji lrk kri}
        if (Cantidad <> 0) then
        begin
           Screen.Cursor := crHourGlass;
           if (DMOrdenProduccion.Infolotes(0, cantidad, 0)) then
              DMOrdenProduccion.CerrarOrden('P', Cantidad);
        end;
     finally
        DMOrdenProduccion.BorraTemporales;
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMOrdenProduccion.ACerrarExecute(Sender: TObject);
var
  Cantidad : real;
begin
  inherited;
  // Cerrado total de la orden de producción, pedimos la cantidad obtenida
  FMCantidadOrden := TFMCantidadOrden.Create(Self);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(CANTIDAD) FROM NAVA_MARCAJES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID IN (SELECT MAX(ID) FROM NAVA_MARCAJES ');
        SQL.Add('        WHERE OP_ANT = ' + DMOrdenProduccion.QMOrdenProdNORDEN.AsString);
        SQL.Add('        GROUP BY OP_ANT, OPERARIO) ');
        ExecQuery;
        FMCantidadOrden.EDTCantidadProd.Text := FloatToStrF(FieldByName['SUM'].AsFloat, ffGeneral, 8, 2);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (FMCantidadOrden.ShowModal = mrOk) then
  begin
     Screen.Cursor := crHourGlass;
     try
        Cantidad := StrToFloatDef(FMCantidadOrden.EDTCantidadProd.Text, 0);
        if (DMOrdenProduccion.Infolotes(0, Cantidad, 0)) then
           DMOrdenProduccion.CerrarOrden('T', Cantidad);
     finally
        DMOrdenProduccion.BorraTemporales;
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMOrdenProduccion.AAbrirExecute(Sender: TObject);
begin
  inherited;
  // Abrimos la orden de producción
  try
     Screen.Cursor := crHourGlass;
     DMOrdenProduccion.AbrirOrden;
  finally
     Screen.Cursor := crDefault;
     DMOrdenProduccion.Limpialote;
  end;
end;

procedure TFMOrdenProduccion.AInfoLotesExecute(Sender: TObject);
begin
  inherited;
  DMOrdenProduccion.FiltrarLotes(StrToInt(DBENumOrden.Text));
  if TFMInfolotes_Produccion.Create(Self).ShowModal = mrOk then
     DMOrdenProduccion.Infolotes(1, 0, 1);
end;

procedure TFMOrdenProduccion.AListadoOrdenesProduccionExecute(Sender: TObject);
begin
  inherited;
  TFPregOrdenes.Create(Self).Muestra(DBENumOrden.Text);
end;

procedure TFMOrdenProduccion.ADesgloseOrdenProduccionExecute(Sender: TObject);
begin
  inherited;
  TFPregOrdenEsc.Create(Self).Muestra(EFSerieKri.Text, DBENumOrden.Text);
end;

procedure TFMOrdenProduccion.EFSerieKriChange(Sender: TObject);
begin
  inherited;
  DMOrdenProduccion.Serie := EFSerieKri.Text;
  DMOrdenProduccion.QMOrdenProd.Close;
  DMOrdenProduccion.QMOrdenProd.Params.ByName['SERIE'].AsString := EFSerieKri.Text;
  DMOrdenProduccion.QMOrdenProd.Open;
end;

procedure TFMOrdenProduccion.ARegenerarEscandalloKriExecute(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;
  if (DMOrdenProduccion.QMOrdenProdESTADO.AsInteger = 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_REGENERA_ESC_ORDEN_KRI (' +
           DMOrdenProduccion.QMOrdenProdEMPRESA.AsString + ',' + DMOrdenProduccion.QMOrdenProdEJERCICIO.AsString + ',' +
           DMOrdenProduccion.QMOrdenProdCANAL.AsString + ',''' + DMOrdenProduccion.QMOrdenProdSERIE.AsString + ''',' +
           DMOrdenProduccion.QMOrdenProdNORDEN.AsString + ')';
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end
  else
  begin
     ShowMessage('La orden esta ' + DMOrdenProduccion.xEstados.FieldByName('TITULO').AsString);
  end;
end;

procedure TFMOrdenProduccion.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavNotas.SetFocus;
end;

procedure TFMOrdenProduccion.EFOrdenKriExiste(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFOrdenKri.Text, 0) <> 0) then
  begin
     DMOrdenProduccion.QMOrdenProd.DisableControls;
     DMOrdenProduccion.QMOrdenProd.Last;
     while ((not DMOrdenProduccion.QMOrdenProd.Bof) and
           (DMOrdenProduccion.QMOrdenProdNORDEN.AsInteger <> StrToInt(EFOrdenKri.Text))) do
        DMOrdenProduccion.QMOrdenProd.Prior;
     DMOrdenProduccion.QMOrdenProd.EnableControls;
  end;
end;

procedure TFMOrdenProduccion.AListadoCodigoBarrasExecute(Sender: TObject);
begin
  inherited;
  TFPregOrdenes.Create(Self).MuestraCodBarras(DBENumOrden.Text);
end;

procedure TFMOrdenProduccion.SBAArticuloClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
     DMOrdenProduccion.QMOrdenProdARTICULO.AsString + '''' +
     ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TFMOrdenProduccion.AArticuloExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
     FMain.EjecutaAccion(FMain.AArticulos,
        'Articulo = ''' + DMOrdenProduccion.QMOrdenProdARTICULO.AsString + '''');
end;

procedure TFMOrdenProduccion.AArticulosEscandalloExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CAST(SUBSTRING(LIST(A.ID_A, '','') FROM 1 FOR 1000) AS VARCHAR(1000)) LISTA_ID_A FROM ART_ARTICULOS_ESC_ORDEN_DETALLE O ');
           SQL.Add(' JOIN ART_ARTICULOS A ON A.EMPRESA = O.EMPRESA AND A.ARTICULO = O.DETALLE ');
           SQL.Add(' WHERE ');
           SQL.Add(' O.EMPRESA = :EMPRESA AND ');
           SQL.Add(' O.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' O.CANAL = :CANAL AND ');
           SQL.Add(' O.SERIE = :SERIE AND ');
           SQL.Add(' O.ORDEN = :ORDEN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := DMOrdenProduccion.QMOrdenProdSERIE.AsString;
           Params.ByName['ORDEN'].AsInteger := DMOrdenProduccion.QMOrdenProdNORDEN.AsInteger;
           ExecQuery;
           FMain.EjecutaAccion(FMain.AArticulos, 'ID_A IN (' + FieldByName['LISTA_ID_A'].AsString + ')');
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
