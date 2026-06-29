unit UFMPasaAPedidoProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UControlEdit, ToolWin, ComCtrls, ExtCtrls, StdCtrls,
  UFIBDBEditfind, Grids, DBGrids, NsDBGrid, UComponentesBusquedaFiltrada,
  UEditPanel, UNavigator, Menus, UTeclas, Mask, UHYDescription, UFormGest,
  ULFToolBar, ULFPanel, ULFHYDBDescription, ULFEditFind2000, ULFLabel,
  DBCtrls, ULFDBEdit, ULFEdit, rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit,
  ULFCheckBox, UFPEditSimple, ActnList, ULFActionList;

type
  TFMPasaAPedidoProv = class(TFPEditSimple)
     TButtSepProduccion: TToolButton;
     DBGLineas: TDBGridFind2000;
     TSep4: TToolButton;
     TButtTraspasaPedido: TToolButton;
     TSep2: TToolButton;
     TButtTodas: TToolButton;
     TButtNinguna: TToolButton;
     PNLProveedor: TLFPanel;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     EProveedor: TLFEdit;
     TButtDesglosaEscandallo: TToolButton;
     PNLAlmacen: TLFPanel;
     LAlmacen: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     ETituloAlmacen: TLFEdit;
     TButtStock: TToolButton;
     TSep3: TToolButton;
     TButtDesglosaOrden: TToolButton;
     BAplicaProveedor: TButton;
     PNLUnirAPedidoAbierto: TLFPanel;
     CBUnirAPedidoAbierto: TLFCheckBox;
     TButCambiaEquivalente: TToolButton;
     TButtTraspasaPropuesta: TToolButton;
     PNLCabecera: TLFPanel;
     PNLSerie: TLFPanel;
     LSerie: TLFLabel;
     EFSerie: TEditFind2000;
     LCanal: TLFLabel;
     EFCanal: TEditFind2000;
     procedure EFProveedorBusqueda(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtTraspasaPedidoClick(Sender: TObject);
     procedure TButtTodasClick(Sender: TObject);
     procedure TButtNingunaClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure TButtDesglosaEscandalloClick(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure DBGLineasBusqueda(Sender: TObject);
     procedure DBGLineasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TButtStockClick(Sender: TObject);
     procedure DBGLineasDblClick(Sender: TObject);
     procedure DBGLineasCellClick(Column: TColumn);
     procedure TButtDesglosaOrdenClick(Sender: TObject);
     procedure BAplicaProveedorClick(Sender: TObject);
     procedure TButCambiaEquivalenteClick(Sender: TObject);
     procedure TButtTraspasaPropuestaClick(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFCanalChange(Sender: TObject);
     procedure EFSerieBusqueda(Sender: TObject);
     procedure FormActivate(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     Param_MODREST015: boolean;
     AlmacenStock: string;
     procedure FinalizaTraspaso;
  public
     { Public declarations }
  end;

var
  FMPasaAPedidoProv : TFMPasaAPedidoProv;

implementation

{$R *.dfm}

uses UDMMain, UDMPedidos, UEntorno, UDMPasaAPedidoProv, UDMOfertas,
  UDMOfertasTallas, UDMPedidosTallas, FIBTableDataSet, DateUtils, UFMDocInfoStocks,
  UUtiles, UFMain, UFMSeleccionGrid, UParam, HYFIBQuery, UDameDato;

procedure TFMPasaAPedidoProv.FormCreate(Sender: TObject);
var
  DM : TDataModule;
  QMCabecera : TFIBTableSet;
  i : integer;
begin
  inherited;
  ControlEdit := CEMain;
  AbreData(TDMPasaAPedidoProv, DMPasaAPedidoProv);

  DM := nil;
  if (TForm(Sender).Owner.Name = 'FMOfertas') then
  begin
     FMPasaAPedidoProv.Caption := _('Paso Oferta a Pedido de Proveedor');
     DM := DMOfertas;
  end;
  if (TForm(Sender).Owner.Name = 'FMOfertasTallas') then
  begin
     FMPasaAPedidoProv.Caption := _('Paso Oferta a Pedido de Proveedor');
     DM := DMOfertasTallas;
  end;
  if (TForm(Sender).Owner.Name = 'FMPedidos') then
  begin
     FMPasaAPedidoProv.Caption := _('Paso Pedido a Pedido de Proveedor');
     DM := DMPedidos;
  end;
  if (TForm(Sender).Owner.Name = 'FMPedidosTallas') then
  begin
     FMPasaAPedidoProv.Caption := _('Paso Pedido a Pedido de Proveedor');
     DM := DMPedidosTallas;
  end;

  AlmacenStock := LeeParametro('PRPSTKA001', '');
  if (AlmacenStock = '') then
     AlmacenStock := 'NOCALC';
  if (AlmacenStock <> 'NOCALC') then
     AlmacenStock := Copy(AlmacenStock, 1, 3);

  // Busco QMCabecera dentro del DataModule
  i := DM.ComponentCount - 1;
  while ((i >= 0) and (DM.Components[i].Name <> 'QMCabecera')) do
     Dec(i);
  QMCabecera := TFIBTableSet(DM.Components[i]);

  // Me traigo los campos que necesito
  with DMPasaAPedidoProv do
  begin
     LimpiaTemporal;

     Serie := Trim(LeeParametro('TRASPEC003', QMCabecera.FieldByName('SERIE').AsString));
     if (Serie = '') then
        Serie := QMCabecera.FieldByName('SERIE').AsString;

     Tipo := QMCabecera.FieldByName('TIPO').AsString;
     Almacen := QMCabecera.FieldByName('ALMACEN').AsString;
     Fecha := REntorno.FechaTrab;
     if (Tipo = 'OFC') then
        FechaEntrega := QMCabecera.FieldByName('FECHA').AsDateTime + QMCabecera.FieldByName('PLAZO_ENTREGA').AsInteger
     else
        FechaEntrega := QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime;

     SuReferencia := QMCabecera.FieldByName('TIPO').AsString + ' ' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' +
        QMCabecera.FieldByName('SERIE').AsString + '/' + QMCabecera.FieldByName('RIG').AsString;

     // Se hace esto para Digital Domain. Si alguien lo quiere diferente hay que parametrizarlo.
     if (QMCabecera.FieldByName('SU_REFERENCIA').AsString = '') then
        SuReferencia := QMCabecera.FieldByName('TIPO').AsString + ' ' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' +
           QMCabecera.FieldByName('SERIE').AsString + '/' + QMCabecera.FieldByName('RIG').AsString
     else
        SuReferencia := QMCabecera.FieldByName('SU_REFERENCIA').AsString;

     SuReferencia := Copy(SuReferencia, 1, 40);

     Rig := QMCabecera.FieldByName('RIG').AsInteger;
     id_s := QMCabecera.FieldByName('ID_S').AsInteger;

     Canal := StrToIntDef(Trim(LeeParametro('TRASPEC004', QMCabecera.FieldByName('SERIE').AsString)), 0);
     if (Canal = 0) then
        Canal := REntorno.Canal;

     EFSerie.Text := Serie;
     EFCanal.Text := IntToStr(Canal);
     EFAlmacen.Text := Almacen;

     SeleccionaLineas;
  end;

  Param_MODREST015 := (LeeParametro('MODREST015') = 'S');

  ColActual := DBGLineas.Columns[0];

  if (LeeParametro('MODREST006') = 'N') then
  begin
     TButtDesglosaEscandallo.Visible := False;
     TButtDesglosaOrden.Visible := False;
     TButtSepProduccion.Visible := False;
     TButCambiaEquivalente.Visible := False;
     if (DBGLineas.FindColumn('ES_COMPONENTE') <> nil) then
        DBGLineas.FindColumn('ES_COMPONENTE').Visible := False;
  end;
end;

procedure TFMPasaAPedidoProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPasaAPedidoProv);
end;

procedure TFMPasaAPedidoProv.EFProveedorBusqueda(Sender: TObject);
begin
  EFProveedor.CondicionBusqueda := 'EMPRESA= ''' + REntorno.EmpresaStr + '''';
end;

procedure TFMPasaAPedidoProv.TButtTraspasaPedidoClick(Sender: TObject);
begin
  DMPasaAPedidoProv.TraspasaPedidoAProv(CBUnirAPedidoAbierto.Checked);
  FinalizaTraspaso;
end;

procedure TFMPasaAPedidoProv.TButtTraspasaPropuestaClick(Sender: TObject);
begin
  DMPasaAPedidoProv.TraspasaPropuestaProv(CBUnirAPedidoAbierto.Checked);
  FinalizaTraspaso;
end;

procedure TFMPasaAPedidoProv.FinalizaTraspaso;
var
  Lona : string;
  UnidadesNecesarias, Stock : double;
begin
  if (Param_MODREST015) then // TOLYCOR
  begin
     // Ponemos en visible las hojas de trabajo
     DMPasaAPedidoProv.PonVisiblesHojasDeTrabajo;

     // Miramos si el orden necesita lona
     Lona := DMPasaAPedidoProv.LonaPedida;

     if (Lona <> '') then
     begin
        // Miramos si tenemos existencias suficientes para realizar las ordenes
        UnidadesNecesarias := DMPasaAPedidoProv.UnidadesNecesariasLonaOrdenes(Lona);

        // Especifico para LONPER. Almacen 999 contiene el stock total del almacen (000-Can.1 + 000-Can.2).
        // Pasar el almacén a un parámetro si algún otro cliente usa esta funcionalidad.

        Stock := DMMain.DameStockArticuloFecha(REntorno.Empresa, 1, Lona, '000', EncodeDate(3000, 1, 1));
        Stock := Stock + DMMain.DameStockArticuloFecha(REntorno.Empresa, 2, Lona, '000', EncodeDate(3000, 1, 1));

        if ((Stock < 0) or (UnidadesNecesarias > Stock)) then
        begin
           MessageDlg(Format(_('No hay existencias suficientes de la lona %s'), [Lona]) + #13#10 +
              Format(_('Se necesitan %8.2f y en existencias hay %8.2f'), [UnidadesNecesarias, Stock]),
              mtWarning, [mbOK], 0);
        end;
     end;
  end;

  DMPasaAPedidoProv.AbreTablaTemporal;
end;

procedure TFMPasaAPedidoProv.TButtTodasClick(Sender: TObject);
begin
  DMPasaAPedidoProv.MarcaLineas(1);
end;

procedure TFMPasaAPedidoProv.TButtNingunaClick(Sender: TObject);
begin
  DMPasaAPedidoProv.MarcaLineas(0);
end;

procedure TFMPasaAPedidoProv.EFProveedorChange(Sender: TObject);
begin
  EProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMPasaAPedidoProv.TButtDesglosaEscandalloClick(Sender: TObject);
begin
  DMPasaAPedidoProv.DesglosaEscandallo;
end;

procedure TFMPasaAPedidoProv.TButtDesglosaOrdenClick(Sender: TObject);
begin
  DMPasaAPedidoProv.DesglosaOrden;
end;

procedure TFMPasaAPedidoProv.EFAlmacenChange(Sender: TObject);
begin
  ETituloAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
  if (ETituloAlmacen.Text > '') then
     DMPasaAPedidoProv.CambiaAlmacen(EFAlmacen.Text);
end;

procedure TFMPasaAPedidoProv.DBGLineasBusqueda(Sender: TObject);
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_PROVEEDORES') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + IntToStr(DMPasaAPedidoProv.Canal);
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PROVEEDOR';
     end;
  end;
end;

procedure TFMPasaAPedidoProv.DBGLineasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with TDBGridFind2000(Sender) do
  begin
     // Enlace a Articulos
     if ((UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'NOMBRE_R_SOCIAL') or (UpperCase(Column.FieldName) = 'D_RIG')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'FECHA_ENTREGA') then
        begin
           if (DMPasaAPedidoProv.TMPPedidosAProvFECHA_ENTREGA.AsDateTime < Today) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'FECHA_ENTREGA_PREV') then
        begin
           if (DMPasaAPedidoProv.TMPPedidosAProvFECHA_ENTREGA.AsDateTime < Today) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'DIAS_ENTREGA') then
        begin
           if (DMPasaAPedidoProv.TMPPedidosAProvFECHA_ENTREGA.AsDateTime < Today) then
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
        begin
           if (DMPasaAPedidoProv.TMPPedidosAProvSTOCK_ALM.AsFloat > 0) then
              ColorResaltado3(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK') then
        begin
           if (DMPasaAPedidoProv.TMPPedidosAProvSTOCK.AsFloat < DMPasaAPedidoProv.TMPPedidosAProvUNIDADES.AsFloat) then
              ColorResaltado3(Canvas);
           if (DMPasaAPedidoProv.TMPPedidosAProvSTOCK.AsFloat < 0) then
              ColorError(Canvas);
        end
        else
        if (DMPasaAPedidoProv.TMPPedidosAProvPEDIR.AsFloat > 0) then
        begin
           if (UpperCase(Column.FieldName) = 'STOCK_MINIMO') then
           begin
              if (DMPasaAPedidoProv.TMPPedidosAProvSTOCK_MINIMO.AsFloat > 0) then
              begin
                 if (DMPasaAPedidoProv.TMPPedidosAProvSTOCK_MINIMO.AsFloat > DMPasaAPedidoProv.TMPPedidosAProvPEDIR.AsFloat) then
                    ColorError(Canvas)
                 else
                    ColorResaltado3(Canvas);
              end;
           end
           else
           if (UpperCase(Column.FieldName) = 'PEDIDO_MINIMO') then
           begin
              if (DMPasaAPedidoProv.TMPPedidosAProvPEDIDO_MINIMO.AsFloat > 0) then
              begin
                 if (DMPasaAPedidoProv.TMPPedidosAProvPEDIDO_MINIMO.AsFloat > DMPasaAPedidoProv.TMPPedidosAProvPEDIR.AsFloat) then
                    ColorError(Canvas)
                 else
                    ColorResaltado3(Canvas);
              end;
           end
           else
           if (UpperCase(Column.FieldName) = 'INCR_PEDIDO') then
           begin
              if (DMPasaAPedidoProv.TMPPedidosAProvINCR_PEDIDO.AsFloat > 0) then
              begin
                 if (Abs(Frac(DMPasaAPedidoProv.TMPPedidosAProvPEDIR.AsFloat / DMPasaAPedidoProv.TMPPedidosAProvINCR_PEDIDO.AsFloat)) > 0.001) then
                    ColorResaltado3(Canvas);
              end;
           end
           else
           if (UpperCase(Column.FieldName) = 'PEDIDOS_A_PRO') then
           begin
              if (DMPasaAPedidoProv.TMPPedidosAProvPEDIDOS_A_PRO.AsFloat > 0) then
                 ColorResaltado3(Canvas);
              // ColorResaltado(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'PEDIDOS_D_CLI') then
           begin
              if (DMPasaAPedidoProv.TMPPedidosAProvPEDIDOS_D_CLI.AsFloat > 0) then
                 ColorResaltado3(Canvas);
              // ColorResaltado(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'PEDIR') then
           begin
              ColorEdicion(Canvas);

              // Destaco los que van a ser tratados
              if (DMPasaAPedidoProv.TMPPedidosAProvMARCADO.AsInteger > 0) then
                 ColorResaltado(Canvas);

              // Si estoy debajo del stock minimo debo pedir
              if ((DMPasaAPedidoProv.TMPPedidosAProvSTOCK_MINIMO.AsFloat > 0) and (DMPasaAPedidoProv.TMPPedidosAProvSTOCK_MINIMO.AsFloat > DMPasaAPedidoProv.TMPPedidosAProvSTOCK.AsFloat + DMPasaAPedidoProv.TMPPedidosAProvPEDIR.AsFloat - DMPasaAPedidoProv.TMPPedidosAProvPEDIDOS_D_CLI.AsFloat + DMPasaAPedidoProv.TMPPedidosAProvPEDIDOS_A_PRO.AsFloat)) then
                 ColorError(Canvas);

              {
              // Si no tengo stock debo pedir
              if (DMPasaAPedidoProv.TMPPedidosAProvSTOCK.AsFloat - DMPasaAPedidoProv.TMPPedidosAProvPEDIDOS_D_CLI.AsFloat + DMPasaAPedidoProv.TMPPedidosAProvPEDIDOS_A_PRO.AsFloat >= DMPasaAPedidoProv.TMPPedidosAProvUNIDADES.AsFloat) then
                 ColorError(Canvas);
              }
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPasaAPedidoProv.TButtStockClick(Sender: TObject);
begin
  AbreStocks(REntorno.Empresa, DMPasaAPedidoProv.Canal, DMPasaAPedidoProv.TMPPedidosAProvARTICULO.AsString, EFAlmacen.Text, Self);
end;

procedure TFMPasaAPedidoProv.DBGLineasDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' + DMPasaAPedidoProv.TMPPedidosAProvARTICULO.AsString + '''');
  if (UpperCase(ColActual.FieldName) = 'NOMBRE_R_SOCIAL') then
     FMain.EjecutaAccion(FMain.AProveedores,
        'PROVEEDOR = ' + IntToStr(DMPasaAPedidoProv.TMPPedidosAProvPROVEEDOR.AsInteger) +
        ' AND EJERCICIO = ' + IntToStr(DMPasaAPedidoProv.TMPPedidosAProvEJERCICIO.AsInteger));
  if (UpperCase(ColActual.FieldName) = 'D_RIG') then
     DMPasaAPedidoProv.MuestraPedidoCompra();
end;

procedure TFMPasaAPedidoProv.DBGLineasCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMPasaAPedidoProv.BAplicaProveedorClick(Sender: TObject);
begin
  if (EProveedor.Text > '') then
     DMPasaAPedidoProv.CambiaProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMPasaAPedidoProv.TButCambiaEquivalenteClick(Sender: TObject);
var
  s : TStrings;
  Seleccion : TFMSeleccionGrid;
  Articulo : string;
begin
  Articulo := DMPasaAPedidoProv.TMPPedidosAProvARTICULO.AsString;
  Seleccion := TFMSeleccionGrid.Create(Self);
  with Seleccion do
  begin
     try
        // ModoSeleccionEquivalente(DMPasaAPedidoProv.TMPPedidosAProvARTICULO.AsString);
        s := TStringList.Create;
        try
           with s do
           begin
              Add(' /* Las equivalencias de una cabecera */ ');
              Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO_LARGO AS TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, D.ARTICULO_EQUIVAL, 1)) STOCK_TOTAL');
              Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
              Add(' JOIN PRO_SYS_DET_EQUIVAL D ON C.EMPRESA = D.EMPRESA AND C.ID_EQUIVAL = D.ID_EQUIVAL ');
              Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
              Add(' WHERE ');
              Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' C.ARTICULO = ''' + Articulo + ''' ');
              Add(' UNION ');
              Add(' /* Los padres de equivalencias de un detalle */ ');
              Add(' SELECT C.ARTICULO AS ARTICULO, A.TITULO_LARGO AS TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, C.ARTICULO, 1)) STOCK_TOTAL');
              Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
              Add(' JOIN ART_ARTICULOS A ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO ');
              Add(' WHERE ');
              Add(' C.ID_EQUIVAL IN ( ');
              Add(' SELECT ID_EQUIVAL ');
              Add(' FROM PRO_SYS_DET_EQUIVAL ');
              Add(' WHERE ');
              Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' ARTICULO_EQUIVAL = ''' + Articulo + ''') ');
              Add(' UNION ');
              Add(' /* Los hermanos de equivalencias de un detalle */ ');
              Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO_LARGO AS TITULO, ');
              Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ARTICULO(' + REntorno.EmpresaStr + ', 0, D.ARTICULO_EQUIVAL, 1)) STOCK_TOTAL');
              Add(' FROM PRO_SYS_DET_EQUIVAL D ');
              Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
              Add(' WHERE ');
              Add(' D.ARTICULO_EQUIVAL <> ''' + Articulo + ''' AND ');
              Add(' D.ID_EQUIVAL IN ( ');
              Add(' SELECT ID_EQUIVAL ');
              Add(' FROM PRO_SYS_DET_EQUIVAL ');
              Add(' WHERE ');
              Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
              Add(' ARTICULO_EQUIVAL = ''' + Articulo + ''') ');
           end;
           AsignaSQL(s.Text);
        finally
           s.Free
        end;

        Caption := _('Selección de artículo');
        MostrarColumna('ARTICULO', _('Artículo'), 90);
        MostrarColumna('TITULO', _('Nombre'), 256);
        MostrarColumna('STOCK_TOTAL', _('Stock Total'), 90);

        Articulo := '';
        if (ShowModal = mrOk) then
        begin
           Articulo := FDS.FieldByName('ARTICULO').AsString;

           if (Trim(Articulo) <> '') then
              DMPasaAPedidoProv.CambiarArticulo(Articulo);
        end;
     finally
        FreeAndNil(Seleccion);
     end;
  end;
end;

procedure TFMPasaAPedidoProv.EFSerieChange(Sender: TObject);
begin
  inherited;
  DMPasaAPedidoProv.Serie := EFSerie.Text;
end;

procedure TFMPasaAPedidoProv.EFCanalChange(Sender: TObject);
begin
  inherited;
  DMPasaAPedidoProv.Canal := StrToIntDef(EFCanal.Text, REntorno.Canal);
end;

procedure TFMPasaAPedidoProv.EFSerieBusqueda(Sender: TObject);
begin
  inherited;
  EFSerie.CondicionBusqueda := 'CANAL=' + IntToStr(DMPasaAPedidoProv.Canal);
end;

procedure TFMPasaAPedidoProv.FormActivate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if (AlmacenStock <> 'NOCALC') then
  begin
     i := EncuentraField(DBGLineas, 'STOCK_ALM');
     if (i >= 0) then
     begin
        DBGLineas.Columns[i].Visible := True;
        DBGLineas.Columns[i].Title.Caption := _('Stock') + ' ' + AlmacenStock;
     end
     else
     begin
        with DBGLineas.Columns.Add do
        begin
           FieldName := 'STOCK_ALM';
           Title.Caption := _('Stock') + ' ' + AlmacenStock;
           Visible := True;
        end;
     end;
  end;
end;

end.
