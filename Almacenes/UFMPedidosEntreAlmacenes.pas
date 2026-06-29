unit UFMPedidosEntreAlmacenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, ULFDBMemo, ULFFIBDBEditFind,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFEdit, ULFDBEditFind2000, UFormGest,
  Buttons, URecursos, IdGlobalProtocols, UFPEditDetalle, ULFEditFind2000;

type
  TFMPedidosEntreAlmacenes = class(TFPEditDetalle)
     ToolButton2: TToolButton;
     TButtEnviarTodas: TToolButton;
     TSNotas: TTabSheet;
     PNLCabNotas: TLFPanel;
     PNLTitNotas: TLFPanel;
     LBLFechaNotas: TLFLabel;
     LBLReferenciaNotas: TLFLabel;
     DBENotasFechaCab: TLFDbedit;
     DBENotasSuReferenciaCab: TLFDbedit;
     DBENotasRIGCab: TLFDbedit;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     CENotasMifirst: TMenuItem;
     CENotasMiprior: TMenuItem;
     CENotasMinext: TMenuItem;
     CENotasMilast: TMenuItem;
     CENotasMiinsert: TMenuItem;
     CENotasMidelete: TMenuItem;
     CENotasMiedit: TMenuItem;
     CENotasMipost: TMenuItem;
     CENotasMicancel: TMenuItem;
     CENotasMirefresh: TMenuItem;
     PNLDetNotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     LAlmacenOrigen: TLFLabel;
     LAlmacenDestino: TLFLabel;
     DBEFAlmacenOrigen: TLFDBEditFind2000;
     DBEFAlmacenDestino: TLFDBEditFind2000;
     EAlmacenOrigen: TLFEdit;
     EAlmacenDestino: TLFEdit;
     LComentario: TLFLabel;
     DBEComentario: TLFDbedit;
     LRIG: TLFLabel;
     LEstado: TLFLabel;
     LEjercicio: TLFLabel;
     DBERig: TLFDbedit;
     DBEEjercicio: TLFDbedit;
     LFecha: TLFLabel;
     DBDEFecha: TLFDBDateEdit;
     DBEEstado: TLFDbedit;
     TButtImprimeListado: TToolButton;
     AInformePedido: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ADisenyarPedido: TAction;
     AInformePedidosPendientes: TAction;
     ADisenyarPedidoPendientes: TAction;
     LMovManStock: TLFLabel;
     DBEMovManSotck: TLFDbedit;
     LFCategoryAction2: TLFCategoryAction;
     AAbrirPedido: TAction;
     ACerrarPedido: TAction;
     SBVerMovManStock: TSpeedButton;
     AVerMovManStock: TAction;
     ADescargaLectorPedido: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ADescargaLectorEnvio: TAction;
     ADescargaLectorRecepcion: TAction;
     AGenerarPedidoStockMinimo: TAction;
     TBSep1: TToolButton;
     TBVerTodos: TToolButton;
     TBVerAbiertos: TToolButton;
     AVerTodos: TAction;
     AVerAbiertos: TAction;
     PNLTitSerie: TLFPanel;
     LBLSerieFiltro: TLFLabel;
     ETitSerieFiltro: TLFEdit;
     EFSerieFiltro: TLFEditFind2000;
     LSerie: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     ETitSerie: TLFEdit;
     AAgruparPedidosAbiertos: TAction;
     TButtRecibirTodas: TToolButton;
     APickingList: TAction;
     ADisenyarPickingList: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFAlmacenOrigenChange(Sender: TObject);
     procedure DBEFAlmacenDestinoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AInformePedidoExecute(Sender: TObject);
     procedure ADisenyarPedidoExecute(Sender: TObject);
     procedure AInformePedidosPendientesExecute(Sender: TObject);
     procedure ADisenyarPedidoPendientesExecute(Sender: TObject);
     procedure AAbrirPedidoExecute(Sender: TObject);
     procedure ACerrarPedidoExecute(Sender: TObject);
     procedure SBVerMovManStockDblClick(Sender: TObject);
     procedure AVerMovManStockExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure ADescargaLectorPedidoExecute(Sender: TObject);
     procedure ADescargaLectorEnvioExecute(Sender: TObject);
     procedure ADescargaLectorRecepcionExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEEstadoChange(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AGenerarPedidoStockMinimoExecute(Sender: TObject);
     procedure AVerTodosExecute(Sender: TObject);
     procedure AVerAbiertosExecute(Sender: TObject);
     procedure EFSerieFiltroChange(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AAgruparPedidosAbiertosExecute(Sender: TObject);
     procedure TButtEnviarTodasClick(Sender: TObject);
     procedure TButtRecibirTodasClick(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure FormActivate(Sender: TObject);
     procedure APickingListExecute(Sender: TObject);
     procedure ADisenyarPickingListExecute(Sender: TObject);
  private
     { Private declarations }
     procedure EstableceVisibilidadStockAlmacen;
  public
     { Public declarations }
  end;

var
  FMPedidosEntreAlmacenes : TFMPedidosEntreAlmacenes;

implementation

uses UDMMain, UDMPedidosEntreAlmacenes, UDMLstPedidosEntreAlmacenes, UFMListConfig,
  UFMain, UEntorno, UUtiles, UDameDato, UParam;

{$R *.dfm}

procedure TFMPedidosEntreAlmacenes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPedidosEntreAlmacenes, DMPedidosEntreAlmacenes);

  NavMain.DataSource := DMPedidosEntreAlmacenes.DSQMCabecera;
  DBGMain.DataSource := DMPedidosEntreAlmacenes.DSQMCabecera;
  G2KTableLoc.DataSource := DMPedidosEntreAlmacenes.DSQMCabecera;

  NavDetalle.DataSource := DMPedidosEntreAlmacenes.DSQMDetalle;
  DBGFDetalle.DataSource := DMPedidosEntreAlmacenes.DSQMDetalle;

  SolapaControles(SBVerMovManStock, DBEMovManSotck);
  DBEMovManSotck.Color := REntorno.ColorEnlaceActivo;

  if (Trim(REntorno.AlmacenRestringido) > ' ') then
  begin
     DBEFAlmacenOrigen.Enabled := False;
     NavMain.InsertaControl := DBEFAlmacenDestino;
     NavMain.EditaControl := DBEFAlmacenDestino;
  end;
end;

procedure TFMPedidosEntreAlmacenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPedidosEntreAlmacenes);
end;

procedure TFMPedidosEntreAlmacenes.DBEFAlmacenOrigenChange(Sender: TObject);
var
  i : integer;
begin
  inherited;
  EAlmacenOrigen.Text := DameTituloAlmacen(DBEFAlmacenOrigen.Text);
  if (REntorno.AlmacenRestringido > ' ') then
  begin
     NavMain.InsertaControl := DBEFAlmacenDestino;
     NavMain.EditaControl := DBEFAlmacenDestino;
     if (REntorno.AlmacenRestringido = DBEFAlmacenOrigen.Text) then
     begin
        ACerrarPedido.Visible := True;
        AAbrirPedido.Visible := True;
        NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
        for i := 0 to DBGFDetalle.Columns.Count - 1 do
           if (DBGFDetalle.Columns[i].FieldName = 'UNIDADES_ENV') then
           begin
              DBGFDetalle.Columns[i].ReadOnly := True;
              DBGFDetalle.Columns[i].Color := clInfoBk;
           end
           else
           begin
              DBGFDetalle.Columns[i].ReadOnly := False;
              DBGFDetalle.Columns[i].Color := clWindow;
           end;
     end
     else
     begin
        ACerrarPedido.Visible := False;
        AAbrirPedido.Visible := False;
        NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh];
        for i := 0 to DBGFDetalle.Columns.Count - 1 do
           if (DBGFDetalle.Columns[i].FieldName = 'UNIDADES_ENV') then
           begin
              DBGFDetalle.Columns[i].ReadOnly := False;
              DBGFDetalle.Columns[i].Color := clWindow;
           end
           else
           begin
              DBGFDetalle.Columns[i].ReadOnly := True;
              DBGFDetalle.Columns[i].Color := clInfoBk;
           end;
     end;
  end
  else
  begin
     NavMain.InsertaControl := DBEFAlmacenOrigen;
     NavMain.EditaControl := DBEFAlmacenOrigen;
  end;
end;

procedure TFMPedidosEntreAlmacenes.DBEFAlmacenDestinoChange(Sender: TObject);
begin
  inherited;
  EAlmacenDestino.Text := DameTituloAlmacen(DBEFAlmacenDestino.Text);
end;

procedure TFMPedidosEntreAlmacenes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMPedidosEntreAlmacenes.AInformePedidoExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPedidosEntreAlmacenes, DMLstPedidosEntreAlmacenes);
  DMLstPedidosEntreAlmacenes.MostrarListado(0, DMPedidosEntreAlmacenes.QMCabeceraID.AsInteger);
  CierraData(DMLstPedidosEntreAlmacenes);
end;

procedure TFMPedidosEntreAlmacenes.ADisenyarPedidoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPedidosEntreAlmacenes, DMLstPedidosEntreAlmacenes);
  TFMListConfig.Create(Self).Muestra(2002, Formato, Cabecera, Copias,
     Pijama, ' ', DMLstPedidosEntreAlmacenes.frPedidos, DMLstPedidosEntreAlmacenes.HYReport);
  CierraData(DMLstPedidosEntreAlmacenes);
end;

procedure TFMPedidosEntreAlmacenes.AInformePedidosPendientesExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstPedidosEntreAlmacenes, DMLstPedidosEntreAlmacenes);
  DMLstPedidosEntreAlmacenes.MostrarListadoPendientes(0);
  CierraData(DMLstPedidosEntreAlmacenes);
end;

procedure TFMPedidosEntreAlmacenes.ADisenyarPedidoPendientesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPedidosEntreAlmacenes, DMLstPedidosEntreAlmacenes);
  TFMListConfig.Create(Self).Muestra(2003, Formato, Cabecera, Copias,
     Pijama, ' ', DMLstPedidosEntreAlmacenes.frPedidos, DMLstPedidosEntreAlmacenes.HYReport);
  CierraData(DMLstPedidosEntreAlmacenes);
end;

procedure TFMPedidosEntreAlmacenes.AAbrirPedidoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.CambiaEstado(0);
end;

procedure TFMPedidosEntreAlmacenes.ACerrarPedidoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.CambiaEstado(5);
end;

procedure TFMPedidosEntreAlmacenes.SBVerMovManStockDblClick(Sender: TObject);
begin
  inherited;
  AVerMovManStock.Execute;
end;

procedure TFMPedidosEntreAlmacenes.AVerMovManStockExecute(Sender: TObject);
begin
  inherited;
  {Aquí debe abrir el movimeinto manual de stock generado al cerrar el pedido}
  with DMPedidosEntreAlmacenes do
  begin
     if (QMCabeceraESTADO.AsInteger = 5) then
        FMain.MuestraDocumento(QMCabeceraEJERCICIO.AsInteger, 'MVE', QMCabeceraSERIE.AsString, QMCabeceraMOV_MAN_STOCK.AsInteger);
  end;
end;

procedure TFMPedidosEntreAlmacenes.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (DMPedidosEntreAlmacenes.QMDetalle.RecordCount > 0) then
  begin
     if (UpperCase(DBGFDetalle.SelectedField.FieldName) = 'ARTICULO') then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMPedidosEntreAlmacenes.QMDetalleARTICULO.AsString + '''' +
           ' and ejercicio=' +
           DMPedidosEntreAlmacenes.QMDetalleEJERCICIO.AsString);
  end;
end;

procedure TFMPedidosEntreAlmacenes.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (DMPedidosEntreAlmacenes.QMDetalle.RecordCount > 0) then
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(DBGFDetalle, Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
        begin
           if (DMPedidosEntreAlmacenes.QMDetalleSTOCK_ALM.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_ALM2') then
        begin
           if (DMPedidosEntreAlmacenes.QMDetalleSTOCK_ALM2.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_ALM3') then
        begin
           if (DMPedidosEntreAlmacenes.QMDetalleSTOCK_ALM3.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPedidosEntreAlmacenes.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';
     // Busco indice de tabla
     i := Tablas.IndexOf(TablaABuscar);
     if (i >= 0) then
     begin
        // Si no hay suficientes elementos en OrdenadosPor, los agrego
        while (OrdenadosPor.Count <= i) do
           OrdenadosPor.Add('');
     end;

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') or
        (Trim(TablaABuscar) = 'VER_ARTICULOS_EF_VENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
        // Se establece el orden para esta tabla
        OrdenadosPor[i] := 'ARTICULO';
     end
     else
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_CON_BARRAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND BAJA=0';
        // Se establece el orden para esta tabla
        OrdenadosPor[i] := 'BARRAS';
     end
     else
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
  end;
end;

procedure TFMPedidosEntreAlmacenes.ADescargaLectorPedidoExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s : string;
  ArticuloLeido : string;
  articulo : string;
  cantidad : integer;
  i, j, k : integer;
  {fecha : TDateTime; No se utiliza}
  RegistroCambiado : boolean;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  inherited;
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'PedEAlm' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Pedido Entre Almacenes ' + DBERig.Text);
     WriteLn(ArchivoLog, 'Estado ' + DBEEstado.Text);
     WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMPedidosEntreAlmacenes.QMDetalle.RecordCount));
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           {fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1)); No se utiliza}
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

           {Primero veo si el articulo leido es un codigo de barras}
           Articulo := DameArticuloBarras(ArticuloLeido);
           WriteLn(ArchivoLog, 'Leido ' + ArticuloLeido + ' x ' + IntToStr(Cantidad) + '. Articulo a utilizar: ' + Articulo);
           {Si no es un codigo de barras veo si existe (pido su titulo)}
           if (Articulo = '') then
           begin
              if (DameTituloArticulo(ArticuloLeido) > '') then
                 Articulo := ArticuloLeido
              else
                 Articulo := '';
           end;

           {Si encuentro el articulo}
           if (Articulo > '') then
           begin
              with DMPedidosEntreAlmacenes.QMDetalle do
              begin
                 {Primero lo busco y agrego unidades si encuentro}
                 First;
                 RegistroCambiado := False;
                 while (not EOF) and (not RegistroCambiado) do
                 begin
                    if (DBGFDetalle.FindColumn('ARTICULO').Field.AsString = Articulo) then
                    begin
                       WriteLn(ArchivoLog, 'Encontrado ' + Articulo + ', se agregan ' + IntToStr(Cantidad) + ' unidades.');
                       try
                          Edit;
                          DBGFDetalle.FindColumn('UNIDADES_PED').Field.AsInteger := DBGFDetalle.FindColumn('UNIDADES_PED').Field.AsInteger + Cantidad;
                          Post;
                          RegistroCambiado := True;
                          Last;
                       except
                          on e: Exception do
                          begin
                             Cancel;
                             ShowMessage(Format(_('Error agregando unidades. Articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                             WriteLn(ArchivoLog, 'Error agregando unidades. Articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + #13#10 + E.Message);
                          end;
                       end;
                    end;
                    Next;
                 end; {while not EOF}

                 {Si no encuentro, lo inserto}
                 if (not RegistroCambiado) then
                 begin
                    WriteLn(ArchivoLog, 'No Encontrado ' + Articulo + ', se insertan ' + IntToStr(Cantidad) + ' unidades.');
                    try
                       Insert;
                       DBGFDetalle.FindColumn('ARTICULO').Field.AsString := Articulo;
                       DBGFDetalle.FindColumn('UNIDADES_PED').Field.AsInteger := Cantidad;
                       //DBGFDetalle.FindColumn('PRECIO').Field.AsFloat := DMPedidosEntreAlmacenes.DamePrecio(ARTICULO,0);
                       Post;
                    except
                       on e: Exception do
                       begin
                          Cancel;
                          ShowMessage(Format(_('Error insertando articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                          WriteLn(ArchivoLog, 'Error insertando articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + #13#10 + E.Message);
                       end;
                    end;
                 end;
              end; {with}
           end
           else
           begin
              WriteLn(ArchivoLog, 'No Existe el articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + ' unidades.');
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %s' + #13#10 + 'Deberá agregarlo luego'), [ArticuloLeido, IntToStr(Cantidad)]));
           end;
        end;
        WriteLn(ArchivoLog, 'Fin ----------------------------------------------');
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'PedEAlm' + '_' + FechaLog + '.txt');
  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMPedidosEntreAlmacenes.ADescargaLectorEnvioExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s : string;
  ArticuloLeido : string;
  articulo : string;
  cantidad : integer;
  i, j, k : integer;
  {fecha : TDateTime; No se utiliza}
  RegistroCambiado : boolean;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  inherited;
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'PedEAlmEnv' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Pedido Entre Almacenes ' + DBERig.Text + '(Envio)');
     WriteLn(ArchivoLog, 'Estado ' + DBEEstado.Text);
     WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMPedidosEntreAlmacenes.QMDetalle.RecordCount));
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           {fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1)); No se utiliza}
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

           {Primero veo si el articulo leido es un codigo de barras}
           Articulo := DameArticuloBarras(ArticuloLeido);
           {Si no es un codigo de barras veo si existe (pido su titulo)}
           if (Articulo = '') then
           begin
              if (DameTituloArticulo(ArticuloLeido) > '') then
                 Articulo := ArticuloLeido
              else
                 Articulo := '';
           end;

           {Si encuentro el articulo}
           if (Articulo > '') then
           begin
              with DMPedidosEntreAlmacenes.QMDetalle do
              begin
                 {Primero lo busco y agrego unidades si encuentro}
                 First;
                 RegistroCambiado := False;
                 while (not EOF) and (not RegistroCambiado) do
                 begin
                    if (DBGFDetalle.FindColumn('ARTICULO').Field.AsString = Articulo) then
                    begin
                       WriteLn(ArchivoLog, 'Encontrado ' + Articulo + ', se agregan ' + IntToStr(Cantidad) + ' unidades.');
                       try
                          Edit;
                          DBGFDetalle.FindColumn('UNIDADES_ENV').Field.AsInteger := DBGFDetalle.FindColumn('UNIDADES_ENV').Field.AsInteger + Cantidad;
                          Post;
                          RegistroCambiado := True;
                          Last;
                       except
                          on e: Exception do
                          begin
                             Cancel;
                             ShowMessage(Format(_('Error agregando unidades. Articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                             WriteLn(ArchivoLog, 'Error agregando unidades. Articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + #13#10 + E.Message);
                          end;
                       end;
                    end;
                    Next;
                 end; {while not EOF}

                 {Si no encuentro, es un error y lo agrego al final}
                 if (not RegistroCambiado) then
                 begin
                    WriteLn(ArchivoLog, 'No Encontrado ' + Articulo + ', se insertan ' + IntToStr(Cantidad) + ' unidades.');
                    try
                       Insert;
                       DBGFDetalle.FindColumn('ARTICULO').Field.AsString := Articulo;
                       DBGFDetalle.FindColumn('UNIDADES_ENV').Field.AsInteger := Cantidad;
                       DBGFDetalle.FindColumn('UNIDADES_PED').Field.AsInteger := 0;
                       Post;
                    except
                       on e: Exception do
                       begin
                          Cancel;
                          ShowMessage(Format(_('Error insertando articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                          WriteLn(ArchivoLog, 'Error insertando articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + #13#10 + E.Message);
                       end;
                    end;
                 end;
              end; {with}
           end
           else
           begin
              WriteLn(ArchivoLog, 'No Existe el articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + ' unidades.');
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %s' + #13#10 + 'Deberá agregarlo luego'), [ArticuloLeido, IntToStr(Cantidad)]));
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'PedEAlmEnv' + '_' + FechaLog + '.txt');
  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMPedidosEntreAlmacenes.ADescargaLectorRecepcionExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s : string;
  ArticuloLeido : string;
  articulo : string;
  cantidad : integer;
  i, j, k : integer;
  {fecha : TDateTime; No se utiliza}
  RegistroCambiado : boolean;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  inherited;
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'PedEAlmRec' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Pedido Entre Almacenes ' + DBERig.Text + '(Envio)');
     WriteLn(ArchivoLog, 'Estado ' + DBEEstado.Text);
     WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMPedidosEntreAlmacenes.QMDetalle.RecordCount));
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           {fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1)); No se utiliza}
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

           {Primero veo si el articulo leido es un codigo de barras}
           Articulo := DameArticuloBarras(ArticuloLeido);
           {Si no es un codigo de barras veo si existe (pido su titulo)}
           if (Articulo = '') then
           begin
              if (DameTituloArticulo(ArticuloLeido) > '') then
                 Articulo := ArticuloLeido
              else
                 Articulo := '';
           end;

           {Si encuentro el articulo}
           if (Articulo > '') then
           begin
              with DMPedidosEntreAlmacenes.QMDetalle do
              begin
                 {Primero lo busco y agrego unidades si encuentro}
                 First;
                 RegistroCambiado := False;
                 while (not EOF) and (not RegistroCambiado) do
                 begin
                    if (DBGFDetalle.FindColumn('ARTICULO').Field.AsString = Articulo) then
                    begin
                       WriteLn(ArchivoLog, 'Encontrado ' + Articulo + ', se agregan ' + IntToStr(Cantidad) + ' unidades.');
                       try
                          Edit;
                          DBGFDetalle.FindColumn('UNIDADES_REC').Field.AsInteger := DBGFDetalle.FindColumn('UNIDADES_REC').Field.AsInteger + Cantidad;
                          Post;
                          RegistroCambiado := True;
                          Last;
                       except
                          on e: Exception do
                          begin
                             Cancel;
                             ShowMessage(Format(_('Error agregando unidades. Articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                             WriteLn(ArchivoLog, 'Error agregando unidades. Articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + #13#10 + E.Message);
                          end;
                       end;
                    end;
                    Next;
                 end; {while not EOF}

                 {Si no encuentro, es un error y lo agrego al final}
                 if (not RegistroCambiado) then
                 begin
                    WriteLn(ArchivoLog, 'No Encontrado ' + Articulo + ', se insertan ' + IntToStr(Cantidad) + ' unidades.');
                    try
                       Insert;
                       DBGFDetalle.FindColumn('ARTICULO').Field.AsString := Articulo;
                       DBGFDetalle.FindColumn('UNIDADES_REC').Field.AsInteger := Cantidad;
                       DBGFDetalle.FindColumn('UNIDADES_PED').Field.AsInteger := 0;
                       Post;
                    except
                       on e: Exception do
                       begin
                          Cancel;
                          ShowMessage(Format(_('Error insertando articulo %s x %s'), [Articulo, IntToStr(Cantidad)]) + #13#10 + E.Message);
                          WriteLn(ArchivoLog, 'Error insertando articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + #13#10 + E.Message);
                       end;
                    end;
                 end;
              end; {with}
           end
           else
           begin
              WriteLn(ArchivoLog, 'No Existe el articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + ' unidades. Articulo Leido: ' + ArticuloLeido);
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %s' + #13#10 + 'Deberá agregarlo luego'), [ArticuloLeido, IntToStr(Cantidad)]));
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'PedEAlmRec' + '_' + FechaLog + '.txt');
  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMPedidosEntreAlmacenes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPedidosEntreAlmacenes.BusquedaCompleja;
end;

procedure TFMPedidosEntreAlmacenes.DBEEstadoChange(Sender: TObject);
begin
  inherited;
  ColorSegunEstado(DBEEstado, DMPedidosEntreAlmacenes.QMCabeceraESTADO.AsInteger);
end;

procedure TFMPedidosEntreAlmacenes.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if ((Column.FieldName = 'ESTADO') or (Column.FieldName = 'TITULO_ESTADO')) then
        begin
           ColorSegunEstado(Canvas, DataSource.DataSet.FieldByName('ESTADO').AsInteger);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMPedidosEntreAlmacenes.AGenerarPedidoStockMinimoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.GenerarPedidoStockMinimo;
end;

procedure TFMPedidosEntreAlmacenes.AVerTodosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.CambiaVisibilidad(True);
end;

procedure TFMPedidosEntreAlmacenes.AVerAbiertosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.CambiaVisibilidad(False);
end;

procedure TFMPedidosEntreAlmacenes.EFSerieFiltroChange(Sender: TObject);
var
  serie_aux : string;
begin
  inherited;

  if (Trim(EFSerieFiltro.Text) = '') then
  begin
     G2kTableLoc.CondicionBusqueda := '';
     DBEFSerie.Enabled := True;
     DBEFSerie.Color := clWindow;
  end
  else
  begin
     serie_aux := dame_serie_activa(EFSerieFiltro.Text);
     // Bloqueo series
     if (serie_aux <> EFSerieFiltro.Text) then
        EFSerieFiltro.Text := serie_aux;

     G2kTableLoc.CondicionBusqueda := 'SERIE=''' + EFSerieFiltro.Text + '''';

     DBEFSerie.Enabled := False;
     DBEFSerie.Color := clInfoBk;
  end;

  DMPedidosEntreAlmacenes.CambiaSerie(EFSerieFiltro.Text);
  ETitSerieFiltro.Text := DameTituloSerie(EFSerieFiltro.Text);
  EstableceVisibilidadStockAlmacen;
end;

procedure TFMPedidosEntreAlmacenes.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ETitSerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMPedidosEntreAlmacenes.FormShow(Sender: TObject);
begin
  inherited;
  if (Trim(REntorno.SerieRestringida) > ' ') then
  begin
     EFSerieFiltro.Text := REntorno.SerieRestringida;
     EFSerieFiltro.Enabled := False;
  end;

  EFSerieFiltroChange(Sender);
end;

procedure TFMPedidosEntreAlmacenes.AAgruparPedidosAbiertosExecute(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.AgrupaPedidosAbiertos;
end;

procedure TFMPedidosEntreAlmacenes.TButtEnviarTodasClick(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.EnviarTodas;
end;

procedure TFMPedidosEntreAlmacenes.TButtRecibirTodasClick(Sender: TObject);
begin
  inherited;
  DMPedidosEntreAlmacenes.RecibirTodas;
end;

procedure TFMPedidosEntreAlmacenes.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button in [nbRefresh, nbDelete, nbPost] then
     DMPedidosEntreAlmacenes.ReiniciaStock(DMPedidosEntreAlmacenes.QMDetalleARTICULO.AsString);
end;

procedure TFMPedidosEntreAlmacenes.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbRefresh, nbDelete]) then
     DMPedidosEntreAlmacenes.ReiniciaStock;
end;

procedure TFMPedidosEntreAlmacenes.EstableceVisibilidadStockAlmacen;

  procedure EstableceVisibilidad(Campo, Parametro, Descripcion: string);
  var
     i : smallint;
     AlmacenStock : string;
  begin
     AlmacenStock := LeeParametro(Parametro, EFSerieFiltro.Text);
     if (AlmacenStock = '') then
        AlmacenStock := 'NOCALC';
     if (AlmacenStock <> 'NOCALC') then
        AlmacenStock := Copy(AlmacenStock, 1, 3);

     Descripcion := Descripcion + ' ' + AlmacenStock;

     i := EncuentraField(DBGFDetalle, Campo);
     if (i >= 0) then
     begin
        with DBGFDetalle.Columns[i] do
        begin
           Visible := (AlmacenStock <> 'NOCALC');
           Title.Caption := Descripcion;
        end;
     end
     else
     begin
        with DBGFDetalle.Columns.Add do
        begin
           FieldName := Campo;
           Title.Caption := Descripcion;
           Visible := (AlmacenStock <> 'NOCALC');
        end;
     end;
  end;

begin
  EstableceVisibilidad('STOCK_ALM', 'PEASTKA001', _('Stock'));
  EstableceVisibilidad('STOCK_ALM2', 'PEASTKA002', _('Stock'));
  EstableceVisibilidad('STOCK_ALM3', 'PEASTKA003', _('Stock'));
end;

procedure TFMPedidosEntreAlmacenes.FormActivate(Sender: TObject);
begin
  inherited;
  EstableceVisibilidadStockAlmacen;
end;

procedure TFMPedidosEntreAlmacenes.APickingListExecute(Sender: TObject);
begin
  inherited;
  APickingList.Enabled := False;
  AbreData(TDMLstPedidosEntreAlmacenes, DMLstPedidosEntreAlmacenes);
  try
     DMLstPedidosEntreAlmacenes.MostrarListadoPicking(0, DMPedidosEntreAlmacenes.QMCabeceraID.AsInteger);
  finally
     APickingList.Enabled := True;
     CierraData(DMLstPedidosEntreAlmacenes);
  end;
end;

procedure TFMPedidosEntreAlmacenes.ADisenyarPickingListExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstPedidosEntreAlmacenes, DMLstPedidosEntreAlmacenes);
  TFMListConfig.Create(Self).Muestra(653, Formato, Cabecera, Copias,
     Pijama, ' ', DMLstPedidosEntreAlmacenes.frPedidos, DMLstPedidosEntreAlmacenes.HYReport);
  CierraData(DMLstPedidosEntreAlmacenes);
end;

end.
