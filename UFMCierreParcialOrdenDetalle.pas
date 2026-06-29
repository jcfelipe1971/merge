unit UFMCierreParcialOrdenDetalle;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, DBCtrls, ULFDBMemo,
  UHYDescription, ULFHYDBDescription, Mask, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel, Buttons,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBEdit, DB, Barras,
  UDBDateTimePicker, ULFEdit, ULFEditFind2000;

type
  TFMCierreParcialOrdenDetalle = class(TFPEdit)
     LOperario: TLFLabel;
     DBEOperario: TLFDBEditFind2000;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     LCalidad: TLFLabel;
     DBCBCalidad: TDBComboBox;
     LPesoCantidad: TLFLabel;
     LLote: TLFLabel;
     LFecha: TLFLabel;
     DBECantidad: TLFDbedit;
     DBEFIdLote: TLFDBEditFind2000;
     DBDEFechaHora: TLFDBDateEdit;
     DBELote: TLFDbedit;
     PNLCodBarras: TLFPanel;
     ICodBarras: TImage;
     CodBarras: TCodeBar;
     LNumEtiquetas: TLFLabel;
     DBENumEtiquetas: TLFDbedit;
     DBDTPFechaHora: TDBDateTimePicker;
     SBAEtiquetas: TSpeedButton;
     ETituloEmpleado: TLFEdit;
     LUbicacion: TLFLabel;
     DBEFUbicacion: TLFDBEditFind2000;
     ETituloUbicacion: TLFEdit;
     LArticulo: TLFLabel;
     DBEFArticulo: TLFDBEditFind2000;
     ETituloArticulo: TLFEdit;
     LFCategoryAction1: TLFCategoryAction;
     AEtiquetas: TAction;
     AConfigEti: TAction;
     TSComponentes: TTabSheet;
     PNLComponente: TLFPanel;
     TBLotes: TLFToolBar;
     NavComponentes: THYMNavigator;
     DBGLot_Ubi: TDBGridFind2000;
     LCantidadRechazada: TLFLabel;
     DBECantidadRechazada: TLFDbedit;
     LReserva: TLFLabel;
     EFReserva: TLFDbedit;
     DBEClasificacion: TLFDbedit;
     PNLCompuesto: TLFPanel;
     DBGFCompuesto: TDBGridFind2000;
     TBCompuesto: TLFToolBar;
     NavCompuesto: THYMNavigator;
     LComponente: TLFLabel;
     LCompuestos: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure NavMainChangeState(Sender: TObject);
     procedure DBELoteChange(Sender: TObject);
     procedure AEtiquetasExecute(Sender: TObject);
     procedure SBAEtiquetasClick(Sender: TObject);
     procedure AConfigEtiExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBEOperarioChange(Sender: TObject);
     procedure DBEFUbicacionChange(Sender: TObject);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure DBGLot_UbiBusqueda(Sender: TObject);
     procedure DBGLot_UbiDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGLot_UbiKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure DBEFIdLoteBusqueda(Sender: TObject);
     procedure DBEFIdLoteChange(Sender: TObject);
     procedure EFReservaChange(Sender: TObject);
     procedure EFReservaKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBECantidadChange(Sender: TObject);
     procedure EFReservaExit(Sender: TObject);
     procedure DBEFIdLoteExit(Sender: TObject);
     procedure DBGFCompuestoBusqueda(Sender: TObject);
  private
     { Private declarations }
     ModificandoIdLote: boolean;
     procedure PintaCodigoBarras;
  public
     { Public declarations }
  end;

var
  FMCierreParcialOrdenDetalle : TFMCierreParcialOrdenDetalle;

implementation

uses UDMCierreParcialOrden, UFormGest, UDMMain, UUtiles, UDameDato, UFMListConfig, UEntorno, HYFIBQuery, UFMSeleccionGrid, UFMImprimirCodBarras;

{$R *.dfm}

procedure TFMCierreParcialOrdenDetalle.FormCreate(Sender: TObject);
var
  Ubicable : boolean;
begin
  inherited;
  SolapaControles(SBAEtiquetas, PNLCodBarras);
  NavMain.DataSource := DMCierreParcialOrden.DSQMCierreParcialDetalleLote;

  // Es comprova que l'article i magatzem facin servir ubicacio
  Ubicable := DMMain.CompruebaControlUbicacionAlmacen(DMCierreParcialOrden.QMCierreParcialDetalleALMACEN.AsString);
  LUbicacion.Visible := Ubicable;
  DBEFUbicacion.Visible := Ubicable;
  ETituloUbicacion.Visible := Ubicable;
  ModificandoIdLote := False;
end;

procedure TFMCierreParcialOrdenDetalle.NavMainChangeState(Sender: TObject);
begin
  inherited;
  // Tanca el form si està en estat no inserció ni edició
  // if Assigned(DMCierreParcialOrden.QMCierreParcialDetalleLote) then
  //    if (DMCierreParcialOrden.QMCierreParcialDetalleLote.state = dsBrowse) then
  //       Close;
end;

procedure TFMCierreParcialOrdenDetalle.PintaCodigoBarras;
begin
  ICodBarras.Picture := nil;
  CodBarras.codigo := DBELote.Text;
  CodBarras.Texto := CodBarras.Codigo;
  CodBarras.DibujaCodeBar(ICodBarras.Canvas);
  ICodBarras.Refresh;
end;

procedure TFMCierreParcialOrdenDetalle.DBELoteChange(Sender: TObject);
begin
  inherited;
  PintaCodigoBarras;

  if (not ModificandoIdLote) then
     DBEFIdLote.Text := '';
end;

procedure TFMCierreParcialOrdenDetalle.AEtiquetasExecute(Sender: TObject);
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

procedure TFMCierreParcialOrdenDetalle.SBAEtiquetasClick(Sender: TObject);
begin
  inherited;
  AEtiquetas.Execute;
end;

procedure TFMCierreParcialOrdenDetalle.AConfigEtiExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(9908, Formato, Cabecera, Copias,
     Pijama, '', DMCierreParcialOrden.frLotes);
end;

procedure TFMCierreParcialOrdenDetalle.FormShow(Sender: TObject);
begin
  inherited;
  EFReservaChange(Sender);
  EFReserva.SetFocus;
end;

procedure TFMCierreParcialOrdenDetalle.DBEOperarioChange(Sender: TObject);
begin
  inherited;
  ETituloEmpleado.Text := DameTituloEmpleado(StrToIntDef(DBEOperario.Text, 0));
end;

procedure TFMCierreParcialOrdenDetalle.DBEFUbicacionChange(Sender: TObject);
begin
  inherited;
  ETituloUbicacion.Text := DameTituloUbicacion(StrToIntDef(DBEFUbicacion.Text, 0));
end;

procedure TFMCierreParcialOrdenDetalle.DBEFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(DBEFArticulo.Text);
end;

procedure TFMCierreParcialOrdenDetalle.DBEFArticuloBusqueda(Sender: TObject);
var
  Modelo : integer;
begin
  inherited;
  // Solo permitimos buscar articulos que pertenecen al modelo
  Modelo := DMCierreParcialOrden.ObtenerModelo_TyC;
  if (Modelo > 0) then
  begin
     DBEFArticulo.CondicionBusqueda := 'ID_A IN ( ' +
        'SELECT ID_A FROM ART_ARTICULOS A ' +
        'JOIN ART_ARTICULOS_M_C_TALLAS T ' +
        'ON A.ID_A_M_C_T = T.ID_A_M_C_T ' +
        'JOIN ART_ARTICULOS_MOD_COLOR C ' +
        'ON T.ID_A_M_C = C.ID_A_M_C ' +
        'WHERE C.ID_A_M = ' + IntToStr(Modelo) + ')';
  end;
end;

procedure TFMCierreParcialOrdenDetalle.DBGLot_UbiBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
     if (TablaABuscar = 'ART_ALMACENES_UBICACIONES') then
     begin
        CondicionBusqueda := CondicionBusqueda + ' AND ALMACEN=''' + DMCierreParcialOrden.QMCierreParcialDetalleComponenteALM_DEST.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO ALMACEN';
     end
     else
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_UNID_LOG') then
     begin
        CondicionBusqueda := CondicionBusqueda + ' AND ARTICULO = ''' + DMCierreParcialOrden.QMCierreParcialDetalleComponenteARTICULO.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO DESC,TIPO';
     end;
  end;
end;

procedure TFMCierreParcialOrdenDetalle.DBGLot_UbiDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if DMCierreParcialOrden.HayDetalle then
     begin
        if (UpperCase(Column.FieldName) = 'ARTICULO') then
           CeldaEnlace(TDBGridFind2000(Sender), Rect);

        if (gdFocused in State) then
           ColorFocused(Canvas)
        else
        begin
           if (UpperCase(Column.FieldName) = 'ID_LOTE') then
           begin
              if (DMCierreParcialOrden.DameArticuloLoteable) then
                 ColorEdicion(Canvas)
              else
                 ColorInactivo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'ID_LOTE_DEV') then
           begin
              if (DMCierreParcialOrden.QMCierreParcialDetalleComponenteUNIDADES_DEVOLVER.AsInteger > 0) then
                 ColorEdicion(Canvas)
              else
                 ColorInactivo(Canvas);
           end
           else
           if (UpperCase(Column.FieldName) = 'ID_UBICACION') then
           begin
              if (DMCierreParcialOrden.DameAlmacenUbicable and DMCierreParcialOrden.DameArticuloLoteable) then
                 ColorEdicion(Canvas)
              else
                 ColorInactivo(Canvas);
           end;
        end;
     end; {if HayDetalle}

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with DBGFDetalle}
end;

procedure TFMCierreParcialOrdenDetalle.DBGLot_UbiKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if not (Key in [VK_PRIOR, VK_NEXT, VK_END, VK_HOME, VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN]) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        DMCierreParcialOrden.InfoLotes(1);
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE_DEV') then
        DMCierreParcialOrden.InfoLotes(3);
  end;
end;

procedure TFMCierreParcialOrdenDetalle.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  Articulo : string;
begin
  inherited;
  Articulo := DMCierreParcialOrden.LotesComponentesAsignados;
  CanClose := (Articulo = '');
  if (not CanClose) then
  begin
     CanClose := (MessageDlg(Format(_('Las unidades de lotes asignadas no se corresponden con las unidades cerradas.' + #13#10 + 'Articulo: %s' + #13#10 + 'Desea salir de todos modos?'), [Articulo]), mtError, [mbYes, mbNo], 0) = mrYes);
  end;
end;

procedure TFMCierreParcialOrdenDetalle.DBEFIdLoteBusqueda(Sender: TObject);
begin
  inherited;

  DBEFIdLote.CondicionBusqueda := 'ARTICULO = ''' + DBEFArticulo.Text + '''';
end;

procedure TFMCierreParcialOrdenDetalle.DBEFIdLoteChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFIdLote.Text, 0) <> 0) then
  begin
     ModificandoIdLote := True;
     DBELote.Text := DameLote(StrToIntDef(DBEFIdLote.Text, 0));
     DBEClasificacion.Text := DameClasificacionLote(StrToIntDef(DBEFIdLote.Text, 0));
     ModificandoIdLote := False;
  end;
end;

procedure TFMCierreParcialOrdenDetalle.EFReservaChange(Sender: TObject);
begin
  inherited;
  DMCierreParcialOrden.QMCierreParcialDetalleLoteUNIDADES.AsFloat := DMCierreParcialOrden.DameUnidadesPendientesCierre(DMCierreParcialOrden.QMCierreParcialDetalleLote.FieldByName('ID_RESERVA').AsInteger);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_LOTE FROM PRO_ORD_RESERVA_LOTE WHERE ID_RESERVA = :ID_RESERVA';
        Params.ByName['ID_RESERVA'].AsInteger := StrToIntDef(EFReserva.Text, 0);
        ExecQuery;
        if (DMCierreParcialOrden.QMCierreParcialDetalleLoteID_LOTE.AsInteger = 0) then
        begin
           DMCierreParcialOrden.QMCierreParcialDetalleLoteID_LOTE.AsInteger := FieldByName['ID_LOTE'].AsInteger;
           if (DMCierreParcialOrden.QMCierreParcialDetalleLoteID_LOTE.AsInteger <> 0) then
              DMCierreParcialOrden.QMCierreParcialDetalleLoteLOTE.AsString := DameLote(FieldByName['ID_LOTE'].AsInteger);
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMCierreParcialOrdenDetalle.EFReservaKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  Seleccion : TFMSeleccionGrid;
begin
  inherited;
  if (Key = VK_F3) then
  begin
     Seleccion := TFMSeleccionGrid.Create(Self);
     try
        with Seleccion do
        begin
           Caption := _('Selección de reserva');
           AsignaSQL(
              ' SELECT R.ID_ORDEN, R.ID_RESERVA, R.LINEA_RES, R.FECHA, R.UNIDADES, AL.ID_LOTE, AL.LOTE, AL.CLASIFICACION, ' +
              '        (SELECT SUM(LOT.UNIDADES) UDS_CERRADAS ' +
              '         FROM PRO_ORD_CIERRE_PARCIAL CAB ' +
              '         JOIN PRO_ORD_CIERRE_PARCIAL_DET DET ON CAB.ID = DET.ID_CIERRE ' +
              '         LEFT JOIN PRO_ORD_CIERRE_PARCIAL_DET_LOTE LOT ON DET.ID = LOT.ID_DET ' +
              '         WHERE ' +
              '         LOT.ID_RESERVA = R.ID_RESERVA), ' +
              '        (R.UNIDADES - (SELECT SUM(LOT.UNIDADES) ' +
              '                       FROM PRO_ORD_CIERRE_PARCIAL CAB ' +
              '                      JOIN PRO_ORD_CIERRE_PARCIAL_DET DET ON CAB.ID = DET.ID_CIERRE ' +
              '                       LEFT JOIN PRO_ORD_CIERRE_PARCIAL_DET_LOTE LOT ON DET.ID = LOT.ID_DET ' +
              '                       WHERE ' +
              '                       LOT.ID_RESERVA = R.ID_RESERVA)) UDS_PENDIENTES ' +
              ' FROM PRO_ORD_RESERVA R ' +
              ' LEFT JOIN PRO_ORD_RESERVA_LOTE RL ON R.EMPRESA = RL.EMPRESA AND R.EJERCICIO = RL.EJERCICIO AND R.CANAL = RL.CANAL AND R.SERIE = RL.SERIE AND R.RIG_OF = RL.RIG_OF AND R.LINEA_RES = RL.LINEA_RES ' +
              ' LEFT JOIN ART_ARTICULOS_LOTES AL ON (R.EMPRESA = AL.EMPRESA AND R.COMPUESTO = AL.ARTICULO AND AL.ID_LOTE = RL.ID_LOTE) ' +
              ' WHERE ' +
              ' R.ID_ORDEN = ' + IntToStr(DMCierreParcialOrden.QMCierreParcialDetalleID_ORDEN.AsInteger));

           MostrarColumna('ID_ORDEN', _('Id Orden'), 70);
           MostrarColumna('ID_RESERVA', _('Id Reserva'), 70);
           MostrarColumna('LINEA_RES', _('Linea'), 200);
           MostrarColumna('FECHA', _('Fecha'), 70);
           MostrarColumna('ID_LOTE', _('ID Lote'), 70);
           MostrarColumna('LOTE', _('Lote'), 70);
           MostrarColumna('CLASIFICACION', _('Clasificacion'), 70);
           MostrarColumna('UNIDADES', _('Unidades'), 70);
           MostrarColumna('UDS_CERRADAS', _('Uds. Cerradas'), 70);
           MostrarColumna('UDS_PENDIENTES', _('Uds. Pendientes'), 85);
           if (ShowModal = mrOk) then
           begin
              // Vacio los datos para tomar los de la reserva
              // 20221216 - Duilio - Quito esto para evitar recalculos en caso de parametro CIPLOTE001
              // DMCierreParcialOrden.QMCierreParcialDetalleLoteID_LOTE.AsInteger := 0;
              // DMCierreParcialOrden.QMCierreParcialDetalleLoteLOTE.AsString := '';

              // EFReserva.Text := FDS.FieldByName('ID_RESERVA').AsString;
              DMCierreParcialOrden.QMCierreParcialDetalleLote.FieldByName('ID_RESERVA').AsInteger := FDS.FieldByName('ID_RESERVA').AsInteger;
           end;
        end;
     finally
        FreeAndNil(Seleccion);
     end;
  end;
end;

procedure TFMCierreParcialOrdenDetalle.DBECantidadChange(Sender: TObject);

begin
  inherited;
  {unidades_pendientes := DMCierreParcialOrden.DameUnidadesPendientesCierre(StrToIntDef(EFReserva.Text,0));
  if(StrToIntDef(DBECantidad.Text,0) > unidades_pendientes)  then
  begin
        ShowMessage('Las unidades ingresadas son mayores a las unidades disponibles a reservar');
  end;}
end;

procedure TFMCierreParcialOrdenDetalle.EFReservaExit(Sender: TObject);
begin
  inherited;
  if ((DMCierreParcialOrden.QMCierreParcialDetalleLoteID_LOTE.AsInteger = 0) and (DBELote.Text = '')) then
     // DMCierreParcialOrden.QMCierreParcialDetalleLoteLOTE.AsString := DMMain.DameLoteSiguiente(DameIdArticulo(DMCierreParcialOrden.QMCierreParcialDetalleARTICULO.AsString), DMCierreParcialOrden.QMCierreParcialDetalleRIG_OF.AsInteger, 'PRO', DMCierreParcialOrden.QMCierreParcialDetalleID_ORDEN.AsInteger);
     DMCierreParcialOrden.CalculaLote;
end;

procedure TFMCierreParcialOrdenDetalle.DBEFIdLoteExit(Sender: TObject);
begin
  inherited;
  if (DBEFIdLote.Text = '0') then
     DBEFIdLote.Text := '';
end;

procedure TFMCierreParcialOrdenDetalle.DBGFCompuestoBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
     if (TablaABuscar = 'ART_ALMACENES_UBICACIONES') then
     begin
        CondicionBusqueda := CondicionBusqueda + ' AND ALMACEN=''' + DMCierreParcialOrden.QMCierrePCompuestoALM_DEST.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO ALMACEN';
     end
     else
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_UNID_LOG') then
     begin
        CondicionBusqueda := CondicionBusqueda + ' AND ARTICULO = ''' + DMCierreParcialOrden.QMCierrePCompuestoARTICULO.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'DEFECTO DESC,TIPO';
     end;
  end;
end;

end.
