unit UFMPropPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, UFormGest, Menus,
  NsDBGrid, UFPEditSinNavegador, ActnList, ULFActionList, rxPlacemnt,
  ULFFormStorage, UTeclas, UEditPanel, ULFToolBar, ULFPanel, ULFDBEdit,
  ULFLabel, ULFComboBox, TFlatCheckBoxUnit, ULFCheckBox, rxToolEdit,
  ULFDateEdit, ULFDBMemo, ULFMemo;

type
  TFMPropPedidos = class(TFPEditSinNavegador)
     DBGPedidos: TDBGridFind2000;
     TBTSep03: TToolButton;
     TBGenerarPedido: TToolButton;
     LAlmacenes: TLFLabel;
     TBTSep02: TToolButton;
     TButtCancela: TToolButton;
     TButtRegenera: TToolButton;
     TBTSep04: TToolButton;
     TButtMarcados: TToolButton;
     TButtDesmarcados: TToolButton;
     TButtTodos: TToolButton;
     TBTSep07: TToolButton;
     PNLInformacion: TLFPanel;
     LStockActual: TLFLabel;
     LStockMinimo: TLFLabel;
     LStockMaximo: TLFLabel;
     DBEExistencias: TLFDBEdit;
     DBEMinimo: TLFDBEdit;
     DBEMaximo: TLFDBEdit;
     LPedidoMinimo: TLFLabel;
     LPedidoOptimo: TLFLabel;
     DBEP_Minimo: TLFDBEdit;
     DBEP_Optimo: TLFDBEdit;
     CBAlmacenesCalcular: TLFComboBox;
     EFSerie: TEditFind2000;
     LAlmacen: TLFLabel;
     EFAlmacen: TEditFind2000;
     LSerie: TLFLabel;
     CAListados: TLFCategoryAction;
     AListadoFamilia: TAction;
     AListadoProveedor: TAction;
     AListadoProveedorTodosAlm: TAction;
     AListadoFamiliaTodosAlm: TAction;
     AListado: TAction;
     DBGPedidosCliente: TDBGridFind2000;
     TBTSep05: TToolButton;
     TButtMarcarTodos: TToolButton;
     TButtDesmarcarTodos: TToolButton;
     TBGenerarPropuesta: TToolButton;
     CBUnirADocAbierto: TLFCheckBox;
     LModo: TLFLabel;
     CBModo: TLFComboBox;
     PNLModo: TLFPanel;
     TBTSep01: TToolButton;
     TButtInfoStock: TToolButton;
     PNLFiltros: TLFPanel;
     LCompararVentas: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     DEFechaHasta: TLFDateEdit;
     BMasUnMes: TButton;
     BMasTresMeses: TButton;
     BRecalcular: TButton;
     TBGeneraPMP: TToolButton;
     LUnidadesPedidas: TLFLabel;
     LFDUnidadesPedidas: TLFDbedit;
     ToolButton1: TToolButton;
     TBLocalizador: TToolButton;
     GBFiltro: TGroupBox;
     LProveedorMostrar: TLFLabel;
     LTipoArticulo: TLFLabel;
     LDesdeArticlo: TLFLabel;
     LHastaArticulo: TLFLabel;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     LMasArticulos: TLFLabel;
     EFProveedorMostrar: TEditFind2000;
     CBMostrarSoloPedir: TLFCheckBox;
     EFTipoArticulo: TEditFind2000;
     BFiltrar: TButton;
     EFDesdeArticulo: TEditFind2000;
     EFHastaArticulo: TEditFind2000;
     EFHastaFamilia: TEditFind2000;
     EFDesdeFamilia: TEditFind2000;
     EFDesdeArticulo2: TEditFind2000;
     EFHastaArticulo2: TEditFind2000;
     GBRecalculo: TGroupBox;
     PNLRangoFechas: TPanel;
     BReset: TButton;
     GBNotaDetallePedido: TGroupBox;
     DBMNotaDetallePedido: TLFDBMemo;
     GBIncluyeStock: TGroupBox;
     CBIncluyeStockComponentes: TLFCheckBox;
     CBIncluyeStockCompuestos: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtCancelaClick(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure Filtrar;
     procedure FiltraRango(Sender: TObject);
     procedure TBGenerarPedidoClick(Sender: TObject);
     procedure DBGPedidosDblClick(Sender: TObject);
     procedure CBAlmacenesCalcularChange(Sender: TObject);
     procedure AListadoFamiliaExecute(Sender: TObject);
     procedure AListadoProveedorExecute(Sender: TObject);
     procedure AListadoProveedorTodosAlmExecute(Sender: TObject);
     procedure AListadoFamiliaTodosAlmExecute(Sender: TObject);
     procedure AListadoExecute(Sender: TObject);
     procedure DBGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGPedidosClienteDblClick(Sender: TObject);
     procedure TButtMarcarTodosClick(Sender: TObject);
     procedure TButtDesmarcarTodosClick(Sender: TObject);
     procedure DBGPedidosCellClick(Column: TColumn);
     procedure DBGPedidosBusqueda(Sender: TObject);
     procedure TBGenerarPropuestaClick(Sender: TObject);
     procedure TButtInfoStockClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure BMasUnMesClick(Sender: TObject);
     procedure BMasTresMesesClick(Sender: TObject);
     procedure BRecalcularClick(Sender: TObject);
     procedure BFiltrarClick(Sender: TObject);
     procedure CBModoChange(Sender: TObject);
     procedure TBGeneraPMPClick(Sender: TObject);
     procedure DBGPedidosTitleClick(Column: TColumn);
     procedure FormShow(Sender: TObject);
     procedure TBLocalizadorClick(Sender: TObject);
     procedure BResetClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     Recalculando: boolean;
     TipoMarcado: smallint;
     CampoOrden: integer;
     procedure GenerarPropuesta(Tipo: string);
     procedure LimpiaFiltro;
  public
     { Public declarations }
  end;

var
  FMPropPedidos : TFMPropPedidos;

implementation

uses UDMMain, UDMPropPedidos, UUtiles, UEntorno, UFMDocInfoStocks,
  UDMLstPropPedidos, UFPregPropPedidos, UFMain, UParam, DateUtils,
  HYFIBQuery, URellenaLista;

{$R *.DFM}

procedure TFMPropPedidos.FormCreate(Sender: TObject);
var
  i, Estrategia : integer;
  AlmacenStock : string;
begin
  inherited;

  Recalculando := False;
  CampoOrden := 0;

  AbreData(TDMPropPedidos, DMPropPedidos);

  RellenaAlmacenes(CBAlmacenesCalcular.Items);
  with CBAlmacenesCalcular do
  begin
     ItemIndex := 0;
     i := 0;
     while ((i < Items.Count) and (Copy(Items[i], 1, Pos(' ', Items[i]) - 1) <> REntorno.AlmacenDefecto)) do
        Inc(i);
     ItemIndex := i;
  end;

  if REntorno.SerieRestringida <> '' then
     EFSerie.Text := REntorno.SerieRestringida
  else
     EFSerie.Text := REntorno.Serie;

  AlmacenStock := LeeParametro('PRPSTKA001', '');
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);
  if (AlmacenStock <> 'NOCALC') then
  begin
     i := EncuentraField(DBGPedidos, 'STOCK_ALM');
     if (i >= 0) then
        DBGPedidos.Columns[i].Visible := True
     else
     begin
        with DBGPedidos.Columns.Add do
        begin
           FieldName := 'STOCK_ALM';
           Title.Caption := _('Stock') + ' ' + AlmacenStock;
           Visible := True;
        end;
     end;
  end;

  DMPropPedidos.RellenaEstrategiasCompra(CBModo.Items);
  with CBModo do
  begin
     ItemIndex := 0;
     Estrategia := StrToIntDef(LeeParametro('PROPPED001'), 0);
     i := 0;
     while ((i < Items.Count) and (integer(Items.Objects[i]) <> Estrategia)) do
        Inc(i);
     ItemIndex := i;
  end;

  CBMostrarSoloPedir.Checked := (LeeParametro('PROPPED002') = 'S');
  CBUnirADocAbierto.Checked := (LeeParametro('PROPPED003') = 'S');

  ColActual := DBGPedidos.Columns[0];

  DEFechaDesde.Date := RecodeDay(Today, 1);
  DEFechaHasta.Date := RecodeDay(Today, 1);
  if (Estrategia <> 9) then
     DEFechaDesde.Date := RecodeYear(DEFechaDesde.Date, REntorno.Ejercicio - 1);

  // Por defecto, primero de mes + 1 mes
  BMasUnMes.Click;

  Filtrar;
end;

procedure TFMPropPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPropPedidos);
end;

procedure TFMPropPedidos.TButtCancelaClick(Sender: TObject);
var
  Almacen : string;
  Estrategia : integer;
begin
  if (CBAlmacenesCalcular.ItemIndex = 0) then
     Almacen := ''
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenesCalcular.Items[CBAlmacenesCalcular.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  Estrategia := integer(CBModo.Items.Objects[CBModo.ItemIndex]);

  if Confirma then
  begin
     Screen.Cursor := crHourGlass;
     try
        DMPropPedidos.CancelaPropuesta(Estrategia, Almacen);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMPropPedidos.TButtRegeneraClick(Sender: TObject);
var
  Almacen : string;
  Estrategia : integer;
begin
  if (CBAlmacenesCalcular.ItemIndex = 0) then
     Almacen := ''
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenesCalcular.Items[CBAlmacenesCalcular.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  Estrategia := integer(CBModo.Items.Objects[CBModo.ItemIndex]);

  try
     Screen.Cursor := crHourGlass;
     DMPropPedidos.GeneraPropuesta(Estrategia, Almacen, DEFechaDesde.Date, DEFechaHasta.Date, CBIncluyeStockCompuestos.Checked, CBIncluyeStockComponentes.Checked);
  finally
     Screen.Cursor := crDefault;
  end;
  TButtTodos.Click;
end;

procedure TFMPropPedidos.Filtrar;
begin
  if (TButtTodos.Down) then
     FiltraRango(TButtTodos);

  if (TButtDesmarcados.Down) then
     FiltraRango(TButtDesmarcados);

  if (TButtMarcados.Down) then
     FiltraRango(TButtMarcados);
end;

procedure TFMPropPedidos.FiltraRango(Sender: TObject);
var
  Almacen : string;
  Estrategia : integer;
begin
  TToolButton(Sender).Down := True;
  TipoMarcado := TComponent(Sender).Tag;

  if (CBAlmacenesCalcular.ItemIndex = 0) then
     Almacen := ''
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenesCalcular.Items[CBAlmacenesCalcular.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  Estrategia := integer(CBModo.Items.Objects[CBModo.ItemIndex]);

  PNLRangoFechas.Visible := (Estrategia in [6, 7, 8, 9]);
  BRecalcular.Enabled := (Estrategia <> 9);

  DMPropPedidos.FiltraRango(TipoMarcado, Almacen, EFProveedorMostrar.Text, Estrategia, CBMostrarSoloPedir.Checked, EFTipoArticulo.Text, EFDesdeArticulo.Text, EFHastaArticulo.Text, EFDesdeArticulo2.Text, EFHastaArticulo2.Text, EFDesdeFamilia.Text, EFHastaFamilia.Text, CampoOrden);
end;

procedure TFMPropPedidos.DBGPedidosDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'NOMBRE_R_SOCIAL') then
  begin
     FMain.EjecutaAccion(FMain.AProveedores,
        'PROVEEDOR = ' + IntToStr(DMPropPedidos.QMPedidosPROVEEDOR.AsInteger) +
        ' AND EJERCICIO = ' + REntorno.EjercicioStr);
  end
  else if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos,
        'Articulo = ''' + DMPropPedidos.QMPedidosARTICULO.AsString + '''');
  end
  else
  begin
     if (CBAlmacenesCalcular.ItemIndex > 0) then
        AbreStocks(REntorno.Empresa, REntorno.Canal,
           DMPropPedidos.QMPedidosARTICULO.AsString, Copy(CBAlmacenesCalcular.Text, 1, 3), Self)
     else
        AbreStocks(REntorno.Empresa, REntorno.Canal,
           DMPropPedidos.QMPedidosARTICULO.AsString, REntorno.AlmacenDefecto, Self);
  end;
end;

procedure TFMPropPedidos.CBAlmacenesCalcularChange(Sender: TObject);
begin
  if (CBAlmacenesCalcular.ItemIndex = 0) then
  begin
     EFAlmacen.Text := REntorno.AlmacenDefecto;
     EFAlmacen.Enabled := True;
  end
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     EFAlmacen.Text := CBAlmacenesCalcular.Items[CBAlmacenesCalcular.ItemIndex];
     EFAlmacen.Text := Copy(EFAlmacen.Text, 1, Pos(' ', EFAlmacen.Text) - 1);

     // EFAlmacen.Enabled := False;
  end;

  Filtrar;

  // DBGPedidos.Enabled := DMPropPedidos.QMPedidos.RecordCount <> 0;
end;

procedure TFMPropPedidos.AListadoFamiliaExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPropPedidos, DMLstPropPedidos);
  DMLstPropPedidos.Imprimir(5500, 0);
  CierraData(DMLstPropPedidos);
end;

procedure TFMPropPedidos.AListadoProveedorExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPropPedidos, DMLstPropPedidos);
  DMLstPropPedidos.Imprimir(5501, 0);
  CierraData(DMLstPropPedidos);
end;

procedure TFMPropPedidos.AListadoProveedorTodosAlmExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPropPedidos, DMLstPropPedidos);
  DMLstPropPedidos.Imprimir(5502, 0);
  CierraData(DMLstPropPedidos);
end;

procedure TFMPropPedidos.AListadoFamiliaTodosAlmExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPropPedidos, DMLstPropPedidos);
  DMLstPropPedidos.Imprimir(5503, 0);
  CierraData(DMLstPropPedidos);
end;

procedure TFMPropPedidos.AListadoExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregPropPedidos, FPregPropPedidos, Sender);
end;

procedure TFMPropPedidos.DBGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (not Recalculando) then
     begin
        // Enlaces
        if (UpperCase(Column.FieldName) = 'NOMBRE_R_SOCIAL') then
           CeldaEnlace(TDBGridFind2000(Sender), Rect);

        if (UpperCase(Column.FieldName) = 'ARTICULO') then
           CeldaEnlace(TDBGridFind2000(Sender), Rect);

        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'EXISTENCIAS') then
           begin
              if (DMPropPedidos.QMPedidosEXISTENCIAS.AsFloat < 0) then
                 ColorError(Canvas);
           end;

           if (UpperCase(Column.FieldName) = 'STOCK_VIRTUAL') then
           begin
              if (DMPropPedidos.QMPedidosSTOCK_VIRTUAL.AsFloat < 0) then
                 ColorError(Canvas);
           end;

           if (UpperCase(Column.FieldName) = 'COBERTURA') then
           begin
              if (DMPropPedidos.QMPedidosCOBERTURA.AsFloat < 2) then
              begin
                 if (DMPropPedidos.QMPedidosCOBERTURA.AsFloat < 0) then
                    ColorError(Canvas)
                 else
                    ColorResaltado6(Canvas);
              end;
           end;

           if (UpperCase(Column.FieldName) = 'COBERTURA_ROTURA') then
           begin
              if (DMPropPedidos.QMPedidosCOBERTURA_ROTURA.AsFloat < 2) then
              begin
                 if (DMPropPedidos.QMPedidosCOBERTURA_ROTURA.AsFloat < 0) then
                    ColorError(Canvas)
                 else
                    ColorResaltado6(Canvas);
              end;
           end;

           if (DMPropPedidos.QMPedidosPEDIR.AsFloat > 0) then
           begin
              if (UpperCase(Column.FieldName) = 'MINIMO') then
              begin
                 if (DMPropPedidos.QMPedidosMINIMO.AsFloat > 0) then
                 begin
                    if (DMPropPedidos.QMPedidosMINIMO.AsFloat > DMPropPedidos.QMPedidosPEDIR.AsFloat + DMPropPedidos.QMPedidosEXISTENCIAS.AsFloat) then
                       ColorError(Canvas)
                    else
                       ColorResaltado3(Canvas);
                 end;
              end
              else
              if (UpperCase(Column.FieldName) = 'P_MINIMO') then
              begin
                 if (DMPropPedidos.QMPedidosP_MINIMO.AsFloat > 0) then
                 begin
                    if (DMPropPedidos.QMPedidosP_MINIMO.AsFloat > DMPropPedidos.QMPedidosPEDIR.AsFloat) then
                       ColorError(Canvas)
                    else
                       ColorResaltado3(Canvas);
                 end;
              end
              else
              if (UpperCase(Column.FieldName) = 'PROVEEDOR') then
              begin
                 if ((DMPropPedidos.QMPedidosPROVEEDOR.AsInteger = 0) and (DMPropPedidos.QMPedidosMARCADO.AsInteger = 1)) then
                 begin
                    ColorError(Canvas);
                 end;
              end
              else
              if (UpperCase(Column.FieldName) = 'PEDIDOS_A_PRO') then
              begin
                 if (DMPropPedidos.QMPedidosPEDIDOS_A_PRO.AsFloat > 0) then
                    ColorResaltado3(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'PEDIDOS_D_CLI') then
              begin
                 if (DMPropPedidos.QMPedidosPEDIDOS_D_CLI.AsFloat > 0) then
                    ColorResaltado3(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'VENTAS_PERIODO_ANTERIOR') then
              begin
                 if (DMPropPedidos.QMPedidosVENTAS_PERIODO_ANTERIOR.AsFloat > 0) then
                    ColorResaltado3(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'EN_PRODUCCION') then
              begin
                 if (DMPropPedidos.QMPedidosEN_PRODUCCION.AsFloat > 0) then
                    ColorResaltado3(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'PEDIR') then
              begin
                 ColorEdicion(Canvas);

                 // Destaco los que van a ser tratados
                 if (DMPropPedidos.QMPedidosMARCADO.AsInteger > 0) then
                    ColorResaltado(Canvas);

                 // Si estoy debajo del stock minimo debo pedir
                 if ((DMPropPedidos.QMPedidosMINIMO.AsFloat > 0) and (DMPropPedidos.QMPedidosMINIMO.AsFloat > DMPropPedidos.QMPedidosEXISTENCIAS.AsFloat + DMPropPedidos.QMPedidosPEDIR.AsFloat - DMPropPedidos.QMPedidosPEDIDOS_D_CLI.AsFloat + DMPropPedidos.QMPedidosPEDIDOS_A_PRO.AsFloat)) then
                    ColorError(Canvas);
              end;
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPropPedidos.DBGPedidosClienteDblClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMPropPedidos.xPedidosOrigenID_S.AsInteger);
end;

procedure TFMPropPedidos.TButtMarcarTodosClick(Sender: TObject);
begin
  inherited;
  DMPropPedidos.MarcarRegistros(1);
end;

procedure TFMPropPedidos.TButtDesmarcarTodosClick(Sender: TObject);
begin
  inherited;
  DMPropPedidos.MarcarRegistros(0);
end;

procedure TFMPropPedidos.DBGPedidosCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMPropPedidos.DBGPedidosBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_PROVEEDORES') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROVEEDOR';
     end;
  end;
end;

procedure TFMPropPedidos.TBGenerarPropuestaClick(Sender: TObject);
begin
  inherited;
  GenerarPropuesta('OFP');
end;

procedure TFMPropPedidos.TBGenerarPedidoClick(Sender: TObject);
begin
  inherited;

  GenerarPropuesta('PEP');
end;

procedure TFMPropPedidos.TBGeneraPMPClick(Sender: TObject);
begin
  inherited;

  GenerarPropuesta('PMP');
end;

procedure TFMPropPedidos.GenerarPropuesta(Tipo: string);
var
  Almacen : string;
  TodosAlmacenes : boolean;
  Estrategia : integer;
begin
  if (Trim(EFSerie.Text) = '') then
  begin
     EFSerie.SetFocus;
     raise Exception.Create(_('Debe seleccionar una serie para generar la propuesta.'));
  end;

  Almacen := '';
  if (CBAlmacenesCalcular.ItemIndex = 0) then
  begin
     if (Trim(EFAlmacen.Text) = '') then
     begin
        EFAlmacen.SetFocus;
        raise Exception.Create(_('Debe seleccionar un almacen para generar la propuesta.'));
     end;

     TodosAlmacenes := True;
     Almacen := EFAlmacen.Text;
  end
  else
  begin
     TodosAlmacenes := False;
     Almacen := CBAlmacenesCalcular.Items[CBAlmacenesCalcular.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  Screen.Cursor := crHourGlass;
  try
     Estrategia := integer(CBModo.Items.Objects[CBModo.ItemIndex]);
     DMPropPedidos.DesmarcarExcepto(Almacen, EFProveedorMostrar.Text, Estrategia, EFTipoArticulo.Text, EFDesdeArticulo.Text, EFHastaArticulo.Text, EFDesdeArticulo2.Text, EFHastaArticulo2.Text, EFDesdeFamilia.Text, EFHastaFamilia.Text);

     DMPropPedidos.EjecutaPropuesta(Almacen, EFSerie.Text, Tipo, TodosAlmacenes, CBUnirADocAbierto.Checked);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMPropPedidos.TButtInfoStockClick(Sender: TObject);
begin
  inherited;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DMPropPedidos.QMPedidosARTICULO.AsString, DMPropPedidos.QMPedidosALMACEN.AsString, Self);
end;

procedure TFMPropPedidos.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Almacen : string;
  Estrategia : integer;
begin
  inherited;
  if (CBAlmacenesCalcular.ItemIndex = 0) then
     Almacen := ''
  else
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Almacen := CBAlmacenesCalcular.Items[CBAlmacenesCalcular.ItemIndex];
     Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
  end;

  Estrategia := integer(CBModo.Items.Objects[CBModo.ItemIndex]);

  if (TButtTodos.Down) then
     DMPropPedidos.BusquedaCompleja(Almacen, EFProveedorMostrar.Text, Estrategia);
  if (TButtDesmarcados.Down) then
     DMPropPedidos.BusquedaCompleja(Almacen, EFProveedorMostrar.Text, Estrategia);
  if (TButtMarcados.Down) then
     DMPropPedidos.BusquedaCompleja(Almacen, EFProveedorMostrar.Text, Estrategia);
end;

procedure TFMPropPedidos.BMasUnMesClick(Sender: TObject);
begin
  inherited;
  DEFechaHasta.Date := RecodeDay(DEFechaHasta.Date, DaysInMonth(DEFechaHasta.Date));
end;

procedure TFMPropPedidos.BMasTresMesesClick(Sender: TObject);
begin
  inherited;
  DEFechaHasta.Date := IncMonth(DEFechaDesde.Date, 2);
  DEFechaHasta.Date := RecodeDay(DEFechaHasta.Date, DaysInMonth(DEFechaHasta.Date));
end;

procedure TFMPropPedidos.BRecalcularClick(Sender: TObject);
var
  Estrategia : integer;
  Almacen : string;
  FechaDesde : TDateTime;
  FechaHasta : TDateTime;
begin
  inherited;

  with BRecalcular do
  begin
     if Tag = 0 then
     begin
        Tag := 1;
        Caption := _('Cancelar');

        Estrategia := integer(CBModo.Items.Objects[CBModo.ItemIndex]);

        FechaDesde := RecodeTime(DEFechaDesde.Date, 0, 0, 0, 0);
        FechaHasta := RecodeTime(DEFechaHasta.Date, 23, 59, 59, 999);
        try
           Recalculando := True;
           // En el caso especial del Modo 9 se vuelve a regenerar la tabla.
           if (Estrategia = 9) then
              TButtRegeneraClick(Sender)
           else
           begin
              if (CBAlmacenesCalcular.ItemIndex = 0) then
                 Almacen := ''
              else
              begin
                 // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
                 Almacen := CBAlmacenesCalcular.Items[CBAlmacenesCalcular.ItemIndex];
                 Almacen := Copy(Almacen, 1, Pos(' ', Almacen) - 1);
              end;

              // Muestro todos los registros
              if (TipoMarcado <> 0) then
                 DMPropPedidos.FiltraRango(0, Almacen, EFProveedorMostrar.Text, Estrategia, CBMostrarSoloPedir.Checked, EFTipoArticulo.Text, EFDesdeArticulo.Text, EFHastaArticulo.Text, EFDesdeArticulo2.Text, EFHastaArticulo2.Text, EFDesdeFamilia.Text, EFHastaFamilia.Text, CampoOrden);

              DMPropPedidos.Recalcular(FechaDesde, FechaHasta);

              // Vuelvo a filtrar
              if (TipoMarcado <> 0) then
                 DMPropPedidos.FiltraRango(TipoMarcado, Almacen, EFProveedorMostrar.Text, Estrategia, CBMostrarSoloPedir.Checked, EFTipoArticulo.Text, EFDesdeArticulo.Text, EFHastaArticulo.Text, EFDesdeArticulo2.Text, EFHastaArticulo2.Text, EFDesdeFamilia.Text, EFHastaFamilia.Text, CampoOrden);
           end;
        finally
           Recalculando := False;
           Tag := 0;
           Caption := _('Recalcular');
           DMPropPedidos.RefrescaDatos;
        end;
     end
     else
     begin
        Tag := 0;
        Caption := _('Recalcular');
        DMPropPedidos.CancelarRecalculo := True;
     end;
  end;
end;

procedure TFMPropPedidos.BFiltrarClick(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TFMPropPedidos.CBModoChange(Sender: TObject);
var
  Estrategia : integer;
  FechaPrevista : TDateTime;
begin
  inherited;
  Estrategia := integer(CBModo.Items.Objects[CBModo.ItemIndex]);

  if (Estrategia = 9) then
  begin
     // Obtengo primera fecha de entrega prevista de detalle de pedidos abiertos.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 D.FECHA_ENTREGA_PREV ');
           SQL.Add(' FROM GES_DETALLES_S_PED D ');
           SQL.Add(' JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S ');
           SQL.Add(' WHERE ');
           SQL.Add(' D.EMPRESA = :EMPRESA AND ');
           SQL.Add(' D.CANAL = :CANAL AND ');
           SQL.Add(' D.SERVIDO = 0 AND ');
           SQL.Add(' C.ESTADO = 0 ');
           SQL.Add(' ORDER BY D.FECHA_ENTREGA_PREV ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FechaPrevista := FieldByName['FECHA_ENTREGA_PREV'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (FechaPrevista <= 0) then
        FechaPrevista := RecodeYear(DEFechaDesde.Date, REntorno.Ejercicio);

     DEFechaDesde.Date := FechaPrevista;
     try
        DEFechaHasta.Date := RecodeYear(DEFechaHasta.Date, REntorno.Ejercicio);
     except
        if (MonthOf(DEFechaHasta.Date) = 2) and (dayOf(DEFechaHasta.Date) = 29) and (not IsLeapYear(REntorno.Ejercicio)) then
           DEFechaHasta.Date := EncodeDate(REntorno.Ejercicio, 2, 28);
     end;
     GBIncluyeStock.Enabled := True;
     CBIncluyeStockCompuestos.Enabled := True;
     CBIncluyeStockComponentes.Enabled := True;
  end
  else
  begin
     DEFechaDesde.Date := RecodeYear(DEFechaDesde.Date, REntorno.Ejercicio - 1);
     try
        DEFechaHasta.Date := RecodeYear(DEFechaHasta.Date, REntorno.Ejercicio - 1);
     except
        if (MonthOf(DEFechaHasta.Date) = 2) and (dayOf(DEFechaHasta.Date) = 29) and (not IsLeapYear(REntorno.Ejercicio - 1)) then
           DEFechaHasta.Date := EncodeDate(REntorno.Ejercicio - 1, 2, 28);
     end;
     GBIncluyeStock.Enabled := False;
     CBIncluyeStockCompuestos.Enabled := False;
     CBIncluyeStockComponentes.Enabled := False;
  end;

  Filtrar;
end;

procedure TFMPropPedidos.DBGPedidosTitleClick(Column: TColumn);
begin
  // inherited;

  // Si el campo de orden es el mismo, lo invierto (orden descendente)
  if (CampoOrden <> Column.Field.Index + 1) then
     CampoOrden := Column.Field.Index + 1
  else
     CampoOrden := (Column.Field.Index + 1) * (-1);

  Filtrar;
end;

procedure TFMPropPedidos.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGPedidos, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGPedidos.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMPropPedidos.TBLocalizadorClick(Sender: TObject);
begin
  DMPropPedidos.LocalizaPedido;
end;

procedure TFMPropPedidos.LimpiaFiltro;
begin
  EFProveedorMostrar.Text := '';
  EFTipoArticulo.Text := '';
  EFDesdeArticulo.Text := '';
  EFHastaArticulo.Text := '';
  EFDesdeArticulo2.Text := '';
  EFHastaArticulo2.Text := '';
  EFDesdeFamilia.Text := '';
  EFHastaFamilia.Text := '';
  CBMostrarSoloPedir.Checked := False;
  BFiltrar.Click;
end;

procedure TFMPropPedidos.BResetClick(Sender: TObject);
begin
  inherited;
  LimpiaFiltro;
  Filtrar;
end;

end.
