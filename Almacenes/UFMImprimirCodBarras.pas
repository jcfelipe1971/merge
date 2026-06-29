unit UFMImprimirCodBarras;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Barras, UHYEdits, rxPlacemnt,
  NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, rxToolEdit,
  ULFDateEdit, ULFEditFind2000, ULFComboBox, ULFFIBDBEditFind,
  DbComboBoxValue, ULFDBComboBoxValue, ULFEdit, UFPEditDetalle;

type
  TFMImprimirCodBarras = class(TFPEditDetalle)
     LBLNRegistro: TLFLabel;
     DBECodBarras: TLFDbedit;
     LBLNombreFicha: TLFLabel;
     DBETitulo: TLFDbedit;
     CodBarras: TCodeBar;
     ICodBarras: TImage;
     LCodigoDeBarras: TLFLabel;
     AuxCodBarras: THYDBEdit;
     AVisualizarCodBarras: TAction;
     AConfRapida: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PNLImagen: TLFPanel;
     PNLEditCodigo: TLFPanel;
     TBImprimirEtiquetas: TToolButton;
     AImprimirCodBarras: TAction;
     TBSep2: TToolButton;
     TBSep1: TToolButton;
     TButtInfoStock: TToolButton;
     LListados: TLFLabel;
     CBListado: TLFComboBox;
     LTipoDocumento: TLFLabel;
     LIdDocumento: TLFLabel;
     DBCBTipoDocumento: TLFDBComboBoxValue;
     ETipoDocumento: TLFEdit;
     DBEFIdDocumento: TLFFibDBEditFind;
     DBEDocumento: TLFDbedit;
     LFCategoryAction2: TLFCategoryAction;
     AUnaEtiqueta: TAction;
     AEtiquetasPorUnidades: TAction;
     TBSep4: TToolButton;
     LEtiqVacias: TLFLabel;
     EEtiqVacias: TLFEdit;
     PNLEtiqVacias: TLFPanel;
     TBSep3: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure AuxCodBarrasChange(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure AVisualizarCodBarrasExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure AImprimirCodBarrasExecute(Sender: TObject);
     procedure TButtInfoStockClick(Sender: TObject);
     procedure DBCBTipoDocumentoChange(Sender: TObject);
     procedure DBEFIdDocumentoBusqueda(Sender: TObject);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; Valor: string);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AUnaEtiquetaExecute(Sender: TObject);
     procedure AEtiquetasPorUnidadesExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     procedure ImportarDatos(TipoDoc: string; IdDoc: integer; IdArticulo: integer = 0);
     procedure ImportarDatosSql(TipoDoc: string; IdDoc: integer; sqlImpresion: TStrings);
     procedure ListaEtiqueta(Modo: integer);
  end;

var
  FMImprimirCodBarras : TFMImprimirCodBarras;

implementation

{$R *.DFM}

uses UDMImprimirCodBarras, UFormGest, UDMMain, UEntorno, UFMListConfig, UFMDocInfoStocks, UFMain, UParam, UUtiles, UDameDato, URellenaLista;

procedure TFMImprimirCodBarras.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImprimirCodBarras, DMImprimirCodBarras);
  NavMain.DataSource := DMImprimirCodBarras.DSQMImpCBCabecera;
  EPMain.DataSource := DMImprimirCodBarras.DSQMImpCBCabecera;
  DBGMain.DataSource := DMImprimirCodBarras.DSQMImpCBCabecera;
  ColActual := DBGFDetalle.Columns[0];

  TSTablaMaximizada := True;

  RellenaListadosGrupo(CBListado.Items, 69);
  CBListado.ItemIndex := 0;
  DBCBTipoDocumentoChange(Sender);
end;

procedure TFMImprimirCodBarras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImprimirCodBarras);
end;

procedure TFMImprimirCodBarras.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  if DBGFDetalle.TablaABuscar = Trim('ART_ARTICULOS_BARRAS') then
  begin
     DBGFDetalle.SelectSQL.Text := 'SELECT BARRAS FROM ART_ARTICULOS_BARRAS';
     DBGFDetalle.CondicionBusqueda := 'ARTICULO = ''' +
        DMImprimirCodBarras.DevolverArticulo + '''';
  end
  else
  if DBGFDetalle.TablaABuscar = Trim('ART_TARIFAS_C') then
  begin
     DBGFDetalle.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ACTIVA=1';
  end
  else
  if (Trim(DBGFDetalle.TablaABuscar) = 'VER_ARTICULOS_EF') then
  begin
     for i := 0 to DBGFDetalle.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFDetalle.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle.CamposDesplegar[i] = '1') then
        begin
           DBGFDetalle.Numericos[i] := LeeParametro('ARTBUSQ001');
           DBGFDetalle.CamposADevolver[i] := 'ARTICULO';
           // DBGFDetalle.OrdenadosPor[i] := LeeParametro('ARTBUSQ001');
        end;
     end;

     DBGFDetalle.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
        'FAMILIA<>''' + REntorno.FamSistema + '''';
  end
  else
  if (Trim(DBGFDetalle.TablaABuscar) = 'VER_ARTICULOS_CON_BARRAS') then
  begin
     DBGFDetalle.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
        REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND BAJA=0';
     i := DBGFDetalle.Tablas.IndexOf(DBGFDetalle.TablaABuscar);
     if (i >= 0) then
        DBGFDetalle.OrdenadosPor[i] := 'BARRAS';
     {
     DBGFDetalle.SelectSQL.Text := 'SELECT DISTINCT(ARTICULO), TITULO FROM VER_ARTICULOS_CON_BARRAS';
     DBGFDetalle.CondicionBusqueda := 'EJERCICIO=' + IntToStr(REntorno.Ejercicio) + ' AND CANAL=' + IntToStr(REntorno.Canal);
     }
  end
  else
  begin
     DBGFDetalle.CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
     i := DBGFDetalle.Tablas.IndexOf(DBGFDetalle.TablaABuscar);
     if (i >= 0) then
        DBGFDetalle.OrdenadosPor[i] := '';
  end;
end;

procedure TFMImprimirCodBarras.AuxCodBarrasChange(Sender: TObject);
begin
  DMImprimirCodBarras.DibujarCodBarras(DMImprimirCodBarras.QMImpCBDetalleCOD_BARRAS.AsString,
     DMImprimirCodBarras.QMImpCBDetalleTIPO.AsInteger,
     ICodBarras, CodBarras);
end;

procedure TFMImprimirCodBarras.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMImprimirCodBarras.AVisualizarCodBarrasExecute(Sender: TObject);
begin
  inherited;
  ListaEtiqueta(0);
end;

procedure TFMImprimirCodBarras.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(69, formato, cabecera, copias,
     pijama, '', DMImprimirCodBarras.frCodBarras);
end;

procedure TFMImprimirCodBarras.ImportarDatos(TipoDoc: string; IdDoc: integer; IdArticulo: integer = 0);
begin
  DMImprimirCodBarras.ImportarDatos(TipoDoc, IdDoc, IdArticulo);
end;

procedure TFMImprimirCodBarras.ImportarDatosSql(TipoDoc: string; IdDoc: integer; sqlImpresion: TStrings);
begin
  DMImprimirCodBarras.ImportarDatosSql(TipoDoc, IdDoc, sqlImpresion);
end;

procedure TFMImprimirCodBarras.AImprimirCodBarrasExecute(Sender: TObject);
begin
  inherited;
  ListaEtiqueta(1);
end;

procedure TFMImprimirCodBarras.TButtInfoStockClick(Sender: TObject);
begin
  inherited;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DMImprimirCodBarras.QMImpCBDetalleARTICULO.AsString, REntorno.AlmacenDefecto, Self);
end;

procedure TFMImprimirCodBarras.ListaEtiqueta(Modo: integer);
var
  Listado : smallint;
  Str : string;
begin
  inherited;
  Str := CBListado.Items[CBListado.ItemIndex];
  Listado := StrToIntDef(Copy(Str, 1, Pos(' ', Str) - 1), 0);

  DMImprimirCodBarras.ImprimirCodBarras(Modo, ICodBarras, Listado, StrToIntDef(EEtiqVacias.Text, 0));
end;

procedure TFMImprimirCodBarras.DBCBTipoDocumentoChange(Sender: TObject);
begin
  inherited;
  if (DBCBTipoDocumento.Text = 'OFP') then
     ETipoDocumento.Text := 'Propuesta';

  if (DBCBTipoDocumento.Text = 'OCP') then
     ETipoDocumento.Text := 'Propuesta Confirmada';

  if (DBCBTipoDocumento.Text = 'PEP') then
     ETipoDocumento.Text := 'Pedido a Proveedor';

  if (DBCBTipoDocumento.Text = 'ALP') then
     ETipoDocumento.Text := 'Albaran de Proveedor';

  if (DBCBTipoDocumento.Text = 'FAP') then
     ETipoDocumento.Text := 'Factura de Proveedor';

  if (DBCBTipoDocumento.Text = 'OFC') then
     ETipoDocumento.Text := 'Oferta a Cliente';

  if (DBCBTipoDocumento.Text = 'PEC') then
     ETipoDocumento.Text := 'Pedido de Cliente';

  if (DBCBTipoDocumento.Text = 'ALB') then
     ETipoDocumento.Text := 'Albaran a Cliente';

  if (DBCBTipoDocumento.Text = 'FAC') then
     ETipoDocumento.Text := 'Factura a Cliente';
end;

procedure TFMImprimirCodBarras.DBEFIdDocumentoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFIdDocumento.Campos_Desplegar.Clear;

  if (DBCBTipoDocumento.Text = 'OFP') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_OFP';
        CampoADevolver := 'ID_E';
        Campos_Desplegar.Add('PROVEEDOR');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'OCP') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_OCP';
        CampoADevolver := 'ID_E';
        Campos_Desplegar.Add('PROVEEDOR');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'PEP') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_PEDIDO_PROV';
        CampoADevolver := 'ID_E';
        Campos_Desplegar.Add('PROVEEDOR');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'ALP') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_ALBARAN_PROV';
        CampoADevolver := 'ID_E';
        Campos_Desplegar.Add('PROVEEDOR');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'FAP') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_FACTURA_PROV';
        CampoADevolver := 'ID_E';
        Campos_Desplegar.Add('PROVEEDOR');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'OFC') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_OFERTA_C';
        CampoADevolver := 'ID_S';
        Campos_Desplegar.Add('CLIENTE');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'PEC') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_PEDIDO';
        CampoADevolver := 'ID_S';
        Campos_Desplegar.Add('CLIENTE');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'ALB') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_ALBARAN';
        CampoADevolver := 'ID_S';
        Campos_Desplegar.Add('CLIENTE');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;

  if (DBCBTipoDocumento.Text = 'FAC') then
  begin
     with DBEFIdDocumento do
     begin
        Tabla_a_buscar := 'VER_CABECERAS_FACTURA';
        CampoADevolver := 'ID_S';
        Campos_Desplegar.Add('CLIENTE');
        Campos_Desplegar.Add('TITULO');
        Campos_Desplegar.Add('SU_REFERENCIA');
     end;
  end;
end;

procedure TFMImprimirCodBarras.DBGFDetalleCampoDevuelve(Sender: TObject; Valor: string);
begin
  inherited;
  {
  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
     DMImprimirCodBarras.BusquedaArticulo(Valor);
  }
end;

procedure TFMImprimirCodBarras.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos,
        'ARTICULO = ''' + DMImprimirCodBarras.QMImpCBDetalleARTICULO.AsString + '''');
  // + ' and ejercicio=' + DMFacturas.QMDetalleEJERCICIO.AsString);
end;

procedure TFMImprimirCodBarras.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMImprimirCodBarras.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ARTICULO') then
           CeldaEnlace(TDBGridFind2000(Sender), Rect);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMImprimirCodBarras.AUnaEtiquetaExecute(Sender: TObject);
begin
  inherited;
  DMImprimirCodBarras.EstableceCantidadCopias(1);
end;

procedure TFMImprimirCodBarras.AEtiquetasPorUnidadesExecute(Sender: TObject);
begin
  inherited;
  DMImprimirCodBarras.EstableceCantidadCopias(-1);
end;

end.
