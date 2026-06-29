unit UFMRegInventario;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, Menus, UTeclas, UControlEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls,
  StdCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl, DbComboBoxValue,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFLabel, UG2kTBLoc, {IdGlobal,} ComObj, HYFIBQuery, ULFDBDateEdit,
  ULFEdit, IdGlobalProtocols, ULFEditFind2000, ULFDateEdit,
  UDBDateTimePicker;

type
  TFMRegInventario = class(TFPEditDetalle)
     DBENumero: TLFDbedit;
     ETitAlmacen: TLFEdit;
     EUsuario: TLFEdit;
     ETitSerie: TLFEdit;
     DBEFAlmacen: TLFDBEditFind2000;
     LNumero: TLFLabel;
     LAlmacen: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     LSerie: TLFLabel;
     DBEEjercicio: TLFDbedit;
     LEjercicio: TLFLabel;
     DBDTPFechaMov: TLFDBDateEdit;
     LUsuario: TLFLabel;
     DBDTPFechaEntrada: TLFDBDateEdit;
     LFechaRegistro: TLFLabel;
     LFechaMovimiento: TLFLabel;
     LTipoPrecio: TLFLabel;
     DBCBVTipoInventario: TDBComboBoxValue;
     LTipoInventario: TLFLabel;
     DBCBVTipoPrecio: TDBComboBoxValue;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     ToolButton3: TToolButton;
     DBCBEstado: TDBComboBoxValue;
     LEstado: TLFLabel;
     AInsertarVarios: TAction;
     AEliminaCero: TAction;
     ARefrescaStock: TAction;
     AMovimientos: TAction;
     ACierra: TAction;
     AAbre: TAction;
     LFCategoryAction1: TLFCategoryAction;
     TButtInfoLotes: TToolButton;
     LFCBStockFecha: TLFDBCheckBox;
     ToolButton2: TToolButton;
     TBUnidadesACero: TToolButton;
     ToolButton4: TToolButton;
     TBDescargaLectorKri: TToolButton;
     TBDescargaExcel: TToolButton;
     TBDescargaStockTiendaVirtual: TToolButton;
     TBDescargaVentur: TToolButton;
     TButtInfStocks: TToolButton;
     AInfoStock: TAction;
     AInsertarArticulosMovimientos: TAction;
     ACreaInventarioTodosAlmacenes: TAction;
     ARefrescaPrecio: TAction;
     TButtPruebas: TToolButton;
     TBEtiquetas: TToolButton;
     TBAsignaLote: TToolButton;
     AAsignaLoteAuto: TAction;
     AEtiquetasArticulo: TAction;
     AEtiquetaArticulosTodos: TAction;
     ToolButton5: TToolButton;
     PNLFiltroDetalle: TLFPanel;
     EFFiltroArticulo: TLFEditFind2000;
     LFiltroArticulo: TLFLabel;
     DBDTPHoraFechaMov: TDBDateTimePicker;
     LFCategoryAction3: TLFCategoryAction;
     ATraspasoMovimientoStock: TAction;
     PNLProgreso: TPanel;
     TSep1: TToolButton;
     TBInsertarModelo: TToolButton;
     AInsertarModelo: TAction;
     AConfListados: TAction;
     AVisualizacionRegularizacionStock: TAction;
     LFCategoryAction4: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AInsertarVariosExecute(Sender: TObject);
     procedure AEliminaCeroExecute(Sender: TObject);
     procedure ARefrescaStockExecute(Sender: TObject);
     procedure AMovimientosExecute(Sender: TObject);
     procedure ACierraExecute(Sender: TObject);
     procedure AAbreExecute(Sender: TObject);
     procedure TButtInfoLotesClick(Sender: TObject);
     procedure TButSerializacionClick(Sender: TObject);
     procedure TButHistSerieClick(Sender: TObject);
     procedure TBUnidadesACeroClick(Sender: TObject);
     procedure DBCBVTipoInventarioChange(Sender: TObject);
     procedure TBDescargaLectorKriClick(Sender: TObject);
     procedure TBDescargaExcelClick(Sender: TObject);
     procedure TBDescargaStockTiendaVirtualClick(Sender: TObject);
     procedure TBDescargaVenturClick(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure DBENumeroChange(Sender: TObject);
     procedure DBEFAlmacenChange(Sender: TObject);
     procedure AInfoStockExecute(Sender: TObject);
     procedure AInsertarArticulosMovimientosExecute(Sender: TObject);
     procedure ACreaInventarioTodosAlmacenesExecute(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ARefrescaPrecioExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure TButtPruebasClick(Sender: TObject);
     procedure AAsignaLoteAutoExecute(Sender: TObject);
     procedure AEtiquetasArticuloExecute(Sender: TObject);
     procedure AEtiquetaArticulosTodosExecute(Sender: TObject);
     procedure EPDetalleClickRango(Sender: TObject; var Continua: boolean);
     procedure EFFiltroArticuloChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ATraspasoMovimientoStockExecute(Sender: TObject);
     procedure AInsertarModeloExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AConfListadosExecute(Sender: TObject);
     procedure AVisualizacionRegularizacionStockExecute(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraInventario(Empresa, Ejercicio, Rig: integer; Serie: string);
  end;

var
  FMRegInventario : TFMRegInventario;

implementation

uses UFormGest, UDMMain, UEntorno, UDMRegInventario,
  UFMArtSerializacionReg, UFMHistoricoSerializacion,
  UUtiles, UDameDato, UFMDocInfoStocks, DB, UFMain, UFMImprimirCodBarras, DateUtils, UHojaCalc, UParam, UFMSeleccion, UFMListConfig, UDMLstRegInventario, URellenaLista;

{$R *.dfm}

procedure TFMRegInventario.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRegInventario, DMRegInventario);
  NavMain.DataSource := DMRegInventario.DSQMCabecera;
  DBGMain.DataSource := DMRegInventario.DSQMCabecera;
  G2KTableLoc.DataSource := DMRegInventario.DSQMCabecera;
  NavDetalle.DataSource := DMRegInventario.DSQMDetalle;
  DBGFDetalle.DataSource := DMRegInventario.DSQMDetalle;

  // Permite modificar la hora de la fecha de inventario. Por defecto los inventarios se hacen con hora 23:59:59
  if (LeeParametro('INVFECH001') = 'N') then
  begin
     DBDTPHoraFechaMov.Color := clInfoBk;
     DBDTPHoraFechaMov.Enabled := False;
  end;

  with PNLProgreso do
  begin
     Height := 1;
     Visible := False;
     Align := alBottom;
     Caption := '';
  end;

  {$IFNDEF Debug}
  TButtPruebas.Visible := False;
  {$ENDIF}
end;

procedure TFMRegInventario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRegInventario);
end;

procedure TFMRegInventario.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';

     if Pos('VER_ARTICULOS_EF', Trim(TablaABuscar)) > 0 then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' +
           REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
     end
     else
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_CON_BARRAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'BAJA=0';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'BARRAS';
     end
     else
     if Pos('ART_ARTICULOS_SERIALIZACION', Trim(TablaABuscar)) > 0 then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
           ' AND CANAL=' + REntorno.CanalStr +
           ' AND ALMACEN=''' + DMRegInventario.QMCabeceraALMACEN.AsString + '''';
     end;
  end;
end;

procedure TFMRegInventario.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMRegInventario.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRegInventario.BusquedaCompleja;
end;

procedure TFMRegInventario.AInsertarVariosExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.InsertarVariosArticulos((Sender as TAction).Tag);
end;

procedure TFMRegInventario.AEliminaCeroExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.EliminaCero;
end;

procedure TFMRegInventario.ARefrescaStockExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.RefrescaStock;
end;

procedure TFMRegInventario.ARefrescaPrecioExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.RefrescaPrecio;
end;

procedure TFMRegInventario.AMovimientosExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.MuestraMovimientos;
end;

procedure TFMRegInventario.ACierraExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.Cierra;
end;

procedure TFMRegInventario.AAbreExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.Abre;
end;

procedure TFMRegInventario.TButtInfoLotesClick(Sender: TObject);
begin
  inherited;
  DMRegInventario.EliminaLoteDetalleInventario(DMRegInventario.QMDetalleID_REG_DETALLE.AsInteger);
  DMRegInventario.InfoLotes;
end;

procedure TFMRegInventario.TButSerializacionClick(Sender: TObject);
var
  Serie, Tipo, Articulo, Almacen : string;
  Rig, Linea, Estado : integer;
  Fecha : TDateTime;
  Unidades : double;
begin
  DMRegInventario.PreparaSerializacion;

  if DMRegInventario.CompruebaLotes then
     raise Exception.Create(_('El artículo tiene lotes'));

  if not DMRegInventario.Serializado then
     ShowMessage(_('El artículo no está serializado'))
  else
  begin
     DMRegInventario.DatosSerializacion(Serie, Tipo, Almacen, Articulo, Rig,
        Linea, Fecha, Unidades, Estado);
     MuestraSerializacion(Serie, Tipo, Almacen, Articulo, Rig, Linea,
        Fecha, Unidades, Estado, Self);
  end;
end;

procedure TFMRegInventario.TButHistSerieClick(Sender: TObject);
begin
  HistoricoSerie(Self);
end;

procedure TFMRegInventario.FiltraInventario(Empresa, Ejercicio, Rig: integer; Serie: string);
begin
  DMRegInventario.FiltraInventario(Empresa, Ejercicio, Rig, Serie);
end;

procedure TFMRegInventario.TBUnidadesACeroClick(Sender: TObject);
begin
  inherited;
  if (ConfirmaMensaje(_('Desea poner todas las unidades a cero?'))) then
     DMRegInventario.PonerUnidadesACero;
end;

procedure TFMRegInventario.DBCBVTipoInventarioChange(Sender: TObject);
begin
  inherited;
  // Para Barreras de Apertura
  if (DBCBVTipoInventario.ItemIndex = 3) then
     DMRegInventario.SetFechaApertura;
end;

procedure TFMRegInventario.TBDescargaLectorKriClick(Sender: TObject);
var
  Archivo : TextFile;
  DirOri : string;
  s : string;
  ArticuloLeido : string;
  articulo : string;
  Unidades : double;
  i, j, k : integer;
  // fecha : TDateTime;
  existe : boolean;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  inherited;
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'RegInv' + '_' + FechaLog + '.txt');
  AssignFile(ArchivoLog, DirOri + 'RegInv' + '_' + FechaLog + '.log');

  with PNLProgreso do
  begin
     Height := 21;
     Visible := True;
     Align := alBottom;
     Caption := '';
  end;

  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Registro de Inventario ' + DBENumero.Text);
     WriteLn(ArchivoLog, 'Estado ' + DBCBEstado.Text);
     WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMRegInventario.QMDetalle.RecordCount));
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           // fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1));
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Unidades := StrToFloatDef(Copy(s, j + i + k + 1, Length(s)), 0);

           // Busco el articulo que corresponde al codigo de barras
           Articulo := DameArticuloBarras(ArticuloLeido);
           {Si no es un codigo de barras veo si existe (pido su titulo)}
           if (Articulo = '') then
           begin
              if (DameTituloArticulo(ArticuloLeido) > '') then
                 Articulo := ArticuloLeido
              else
                 Articulo := '';
           end;

           PNLProgreso.Caption := Format(_('Importando - Articulo: %s - Unidades: %8.2n'), [Articulo, Unidades]);
           Application.ProcessMessages;

           // Si encuentro el articulo
           if (Articulo > ' ') then
           begin
              // Busco si esta
              //   Si esta, le sumo unidades
              //   Si no esta, inserto una linea
              with DMRegInventario.QMDetalle do
              begin
                 DisableControls;
                 try
                    First;
                    Existe := False;
                    while (not EOF) do
                    begin
                       if (DMRegInventario.QMDetalleARTICULO.AsString = Articulo) then
                       begin
                          WriteLn(ArchivoLog, Format('Encontrado %s, se agregan %8.2n unidades', [Articulo, Unidades]));
                          try
                             Edit;
                             DMRegInventario.QMDetalleUNIDADES.AsFloat := DMRegInventario.QMDetalleUNIDADES.AsFloat + Unidades;
                             Post;
                             Existe := True;
                             Last;
                          except
                             on e: Exception do
                             begin
                                Cancel;
                                ShowMessage(Format(_('Error agregando unidades. Articulo %s x %8.2n'), [Articulo, Unidades]) + #13#10 + E.Message);
                                WriteLn(ArchivoLog, 'Error agregando unidades. Articulo ' + Articulo + ' x ' + FloatToStr(Unidades) + #13#10 + E.Message);
                             end;
                          end;
                       end;
                       Next;
                    end;
                    if (not Existe) then
                    begin
                       WriteLn(ArchivoLog, 'No Encontrado ' + Articulo + ', se agregan ' + FloatToStr(Unidades) + ' unidades.');
                       try
                          Insert;
                          DMRegInventario.QMDetalleARTICULO.AsString := Articulo;
                          DMRegInventario.QMDetalleUNIDADES.AsFloat := Unidades;
                          Post;
                       except
                          on e: Exception do
                          begin
                             Cancel;
                             ShowMessage(Format(_('Error insertando articulo %s x %8.2n'), [Articulo, Unidades]) + #13#10 + E.Message);
                             WriteLn(ArchivoLog, 'Error insertando articulo ' + Articulo + ' x ' + FloatToStr(Unidades) + #13#10 + E.Message);
                          end;
                       end;
                    end;
                 finally
                    EnableControls;
                 end;
              end;
           end
           else
           begin
              WriteLn(ArchivoLog, Format('No Existe el articulo %s x %8.2n unidades. Articulo Leido: %s', [Articulo, Unidades, ArticuloLeido]));
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %s' + #13#10 + 'Deberá agregarlo luego'), [ArticuloLeido, FloatToStr(Unidades)]));
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);

     with PNLProgreso do
     begin
        Height := 1;
        Visible := False;
        Align := alBottom;
        Caption := '';
     end;
  end;

  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;

  ShowMessage(_('Importacion Finalizada'));
end;

procedure TFMRegInventario.TBDescargaExcelClick(Sender: TObject);
var
  HCalc : THojaCalc;
  i, id_a, id_reg : integer;
  Articulo, Lote, Titulo, UnidadesExcel, PrecioExcel, Archivo : string;
  Cancelar : boolean;
  Unidades, Precio : double;
  SeparadorDecimal : string;
begin
  inherited;
  Cancelar := False;
  SeparadorDecimal := '';

  Archivo := '';
  if MyOpenDialog(Archivo, 'XLS,ODS,TXT', '', 'FMRegInventario-DescargaExcel') then
  begin
     DMRegInventario.NotasLote := False;

     with PNLProgreso do
     begin
        Height := 21;
        Visible := True;
        Align := alBottom;
        Caption := '';
     end;

     try
        HCalc := THojaCalc.Create(Archivo, False);
        try
           HCalc.ActivateSheetByIndex(1);

           for i := 1 to HCalc.LastRow + 1 do
           begin
              if (not Cancelar) then
              begin
                 try
                    Articulo := LimpiaCeldaExcel(HCalc.CellText[i, 1]); // Excel.Range['a' + IntToStr(i)].Value;
                 except
                    Articulo := '';
                 end;
                 try
                    UnidadesExcel := LimpiaCeldaExcel(HCalc.CellText[i, 2]); // Excel.Range['b' + IntToStr(i)].Value;
                 except
                    UnidadesExcel := '0';
                 end;
                 try
                    PrecioExcel := LimpiaCeldaExcel(HCalc.CellText[i, 3]); // Excel.Range['c' + IntToStr(i)].Value;
                 except
                    PrecioExcel := '0';
                 end;
                 try
                    Lote := Trim(LimpiaCeldaExcel(HCalc.CellText[i, 4])); // Trim(Excel.Range['d' + IntToStr(i)].Value);
                 except
                    Lote := '';
                 end;

                 if (Articulo > '') then
                 begin
                    id_a := DameIDArticulo(Articulo);
                    Titulo := DameTituloArticulo(Articulo);
                    Unidades := 0;
                    Precio := 0;

                    if (SeparadorDecimal = '') then
                    begin
                       if ((Pos(',', UnidadesExcel) > 0) or
                          (Pos('.', UnidadesExcel) > 0) or
                          (Pos(',', PrecioExcel) > 0) or
                          (Pos('.', PrecioExcel) > 0)) then
                          PideDato('STR', SeparadorDecimal, format(_('Cuál es el separador Decimal? (Uds: %s; Precio: %s)'), [UnidadesExcel, PrecioExcel]));

                       SeparadorDecimal := Trim(SeparadorDecimal);
                    end;

                    if (SeparadorDecimal = '') then
                    begin
                       Unidades := StrToFloatDef(UnidadesExcel, 0);
                       Precio := StrToFloatDef(PrecioExcel, 0);
                    end
                    else
                    begin
                       if (Trim(UnidadesExcel) > '') then
                       begin
                          try
                             Unidades := StrToFloatDec(UnidadesExcel, SeparadorDecimal[1]);
                          except
                             Unidades := 0;
                          end;
                       end;

                       if (Trim(PrecioExcel) > '') then
                       begin
                          try
                             Precio := StrToFloatDec(PrecioExcel, SeparadorDecimal[1]);
                          except
                             Precio := 0;
                          end;
                       end;
                    end;

                    if (Lote = '0') then
                       Lote := '';
                    PNLProgreso.Caption := Format(_('Regularización de Stock - Art: %s Uds: %8.2n (%s) %s - Lote: %s.'), [Articulo, Unidades, UnidadesExcel, Titulo, Lote]);
                    if (id_a > 0) then
                    begin
                       DMRegInventario.AgregaArticulo(id_a, Articulo, Titulo, Unidades, Precio, Lote);
                    end
                    else
                    begin
                       if (MessageDlg(Format(_('No existe Ariculo' + #13#10 + 'Código: %s - Stock: %s' + #13#10 + '¿Desea continuar?'), [Articulo, UnidadesExcel]), mtWarning, [mbYes, mbNo], 0) = mrNo) then
                          Cancelar := True;
                    end;
                 end;
              end;
           end; {for}
        finally
           HCalc.Free;
        end;

        with DMRegInventario do
        begin
           if (TUpdate.InTransaction) then
              TUpdate.Commit;

           RefrescaStock;

           // Reposicion
           id_reg := QMCabeceraID_REG.AsInteger;
           with QMCabecera do
           begin
              Close;
              Open;
              Last;
              while ((not BOF) and (id_reg <> QMCabeceraID_REG.AsInteger)) do
                 Prior;
           end;
        end;

        Application.ProcessMessages;
     finally
        DMRegInventario.NotasLote := True;

        with PNLProgreso do
        begin
           Height := 1;
           Visible := False;
           Align := alBottom;
           Caption := '';
        end;
     end;
  end;
end;

procedure TFMRegInventario.TBDescargaStockTiendaVirtualClick(Sender: TObject);
begin
  inherited;
  if (ConfirmaMensaje(_('Desea obtener el stock de la tienda virtual?'))) then
     DMRegInventario.DescargaStockTiendaVirtual;
end;

procedure TFMRegInventario.TBDescargaVenturClick(Sender: TObject);
var
  ts : TStrings;
  s, Campo : string;
  i, Linea : integer;
  Archivo, Articulo, CodigoVentur : string;
  Stock, PCoste : double;
  existe : boolean;
  // Loteable, LineaDetalle, IdRegDetalle : integer;
begin
  inherited;
  { Importacion desde fichero de tarifa Ventur
    ****************************************************************************
    (Dinamic Dental) Se modifica el "Precio de Mercado" en la tarifa para que
    la tarifa WEB lo tenga en cuenta como precio base
    ****************************************************************************
    Campos separados por ";" (Punto y Coma)
    Los decimales estan separados por "," (coma)

    Solo se importan los campos:
      Cod_Ventur   --> ARTICULO WHERE ALFA_2=Cod_Ventur
      Precio_Final --> PRECIO
      Stock        --> UNIDADES

    Estructura de CSV:
    Nombre Marca; Cod_Ventur;Cod_Fabricante;Descripcion;Precio;Descuento;Precio_Final;Observaciones;IVA;PVP;Cambio de Precio;PV Mínimo;Stock
    3M ESPE;3M03126;71615;71615 CUBETAS IMPRESION S SUP. 10u.(71600);13,5;0;13,5;;21;20;NO;0;11
    3M ESPE;3M03127;71616N;71616 CUBETAS IMPRESION M SUP. 10u.;13,5;0;13,5;;21;20;NO;0;13
    ...
  }


  Archivo := '';
  if MyOpenDialog(Archivo, 'CSV,TXT,XLS,ODS', '', 'FMRegInventario-DescargaVentur') then
  begin
     ts := TStringList.Create;
     with ts do
     begin
        DMRegInventario.NotasLote := False;
        with PNLProgreso do
        begin
           Height := 21;
           Visible := True;
           Align := alBottom;
           Caption := '';
        end;

        DBGFDetalle.Visible := False;
        try
           LoadFromFile(Archivo);

           Linea := 0;
           while (Linea < Count) do
           begin
              Articulo := '';
              s := ts[Linea];

              // Nombre Marca
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // Cod_Ventur - Corresponde con nuestro ALFA_2
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));
              CodigoVentur := Trim(Campo);

              // Cod_Fabricante
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // Descripcion
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // Precio
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // Descuento
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // Precio_Final - Se corresponde con PRECIO - Representa el Precio de Coste
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));
              try
                 PCoste := StrToFloatDec(Trim(Campo), ',');
              except
                 PCoste := 0;
              end;

              // Observaciones
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // IVA
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // PVP
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // Cambio de Precio
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // PV Minimo
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));

              // Stock - Los importamos en UNIDADES
              i := Pos(';', s);
              if (i > 0) then
                 Campo := Copy(s, 1, i - 1)
              else
                 Campo := s;
              s := Copy(s, i + 1, Length(s));
              try
                 Stock := StrToFloatDec(Trim(Campo), ',');
              except
                 Stock := 0;
              end;

              Articulo := DMMain.DameArticuloDesdeAlfa(CodigoVentur, 2);

              PNLProgreso.Caption := Format(_('Linea: %5.0d (%d%%)- Articulo: %15s - Unidades: %12.2n - Precio: %12.2n'), [Linea, Round(Linea * 100 / Count), Articulo, Stock, PCoste]);
              Application.ProcessMessages;

              // Si existe un articulo que corresponda al codigo ventur sigo
              if (Articulo <> '') then
              begin
                 // Busco si esta
                 // Si esta, le sumo unidades
                 // Si no esta, inserto una linea
                 with DMRegInventario.QMDetalle do
                 begin
                    DisableControls;
                    try
                       First;
                       Existe := Locate('ARTICULO', Articulo, []);

                       if (Existe) then
                       begin
                          try
                             DMRegInventario.AgregaArticulo(DameIDArticulo(Articulo), Articulo, '', Stock, PCoste, '' {vacio crea el lote SIN_LOTE});
                          except
                             on e: Exception do
                             begin
                                Cancel;
                                s := Format(_('Error agregando unidades. Articulo %s x %10.2n. ¿Desea continuar?'), [Articulo, Stock]) + #13#10 + #13#10 + E.Message;
                                if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                                   Linea := Count;
                             end;
                          end;
                       end
                       else
                       begin
                          try
                             DMRegInventario.AgregaArticulo(DameIDArticulo(Articulo), Articulo, '', Stock, PCoste, '' {vacio crea el lote SIN_LOTE});
                          except
                             on e: Exception do
                             begin
                                Cancel;
                                s := Format(_('Error insertando articulo %s x %8.2n. ¿Desea continuar?'), [Articulo, Stock]) + #13#10 + #13#10 + E.Message;
                                if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                                   Linea := Count;
                             end;
                          end;
                       end;

                       // (Dinamic Dental) Actualizo el "Precio de Mercado" con el precio de Ventur para calcular el precio de la tarifa WEB.
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE ART_ARTICULOS_PRECIOS ');
                             SQL.Add(' SET ');
                             SQL.Add(' PRECIO_MERCADO = :PRECIO_MERCADO ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' EMPRESA = :EMPRESA AND ');
                             SQL.Add(' ARTICULO = :ARTICULO ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['ARTICULO'].AsString := Articulo;
                             Params.ByName['PRECIO_MERCADO'].AsFloat := PCoste;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    finally
                       EnableControls;
                    end;
                 end;
              end;

              Inc(Linea);
           end;
        finally
           Free;

           with PNLProgreso do
           begin
              Height := 1;
              Visible := False;
              Align := alBottom;
              Caption := '';
           end;
           DMRegInventario.NotasLote := True;
           DBGFDetalle.Visible := True;
        end;
     end;

     with DMRegInventario.QMDetalle do
     begin
        Close;
        Open;
     end;

     Application.ProcessMessages;

     // Los precios se insertan durante la importacion
     // DMRegInventario.RefrescaPrecio;
  end;
end;

procedure TFMRegInventario.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ETitSerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMRegInventario.DBENumeroChange(Sender: TObject);
begin
  inherited;
  EUsuario.Text := DameTituloUsuario(DameUsuarioSegunEntrada(DMRegInventario.QMCabeceraENTRADA.AsInteger));
end;

procedure TFMRegInventario.DBEFAlmacenChange(Sender: TObject);
begin
  inherited;
  ETitAlmacen.Text := DameTituloAlmacen(DBEFAlmacen.Text);
end;

procedure TFMRegInventario.AInfoStockExecute(Sender: TObject);
begin
  inherited;
  AbreStocks(REntorno.Empresa, REntorno.Canal, DMRegInventario.QMDetalleARTICULO.AsString, DMRegInventario.QMCabeceraALMACEN.AsString, Self);
end;

procedure TFMRegInventario.AInsertarArticulosMovimientosExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.InsertarVariosArticulos((Sender as TAction).Tag);
end;

procedure TFMRegInventario.ACreaInventarioTodosAlmacenesExecute(Sender: TObject);
var
  Lista : TStrings;
  Almacen : string;
  i : integer;
begin
  inherited;
  Lista := TStringList.Create;
  try
     RellenaAlmacenes(Lista, False);

     for i := 0 to Lista.Count - 1 do
     begin
        Almacen := Copy(Lista[i], 1, Pos(' ', Lista[i]));
        DMRegInventario.QMCabecera.Insert;
        DMRegInventario.QMCabeceraALMACEN.AsString := Almacen;
        DMRegInventario.QMCabeceraDESCRIPCION.AsString := _('Regularizacion automatica');
        DMRegInventario.QMCabecera.Post;
        AInsertarArticulosMovimientos.Execute;
        TBUnidadesACero.Click;
     end;
  finally
     Lista.Free;
  end;
end;

procedure TFMRegInventario.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect)
     else
     if (UpperCase(Column.FieldName) = 'LOTE') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect)
     else
     if (UpperCase(Column.FieldName) = 'PROVEEDOR_LOTE') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ID_LOTE') then
        begin
           if (DMRegInventario.QMDetalleLOTEABLE.AsInteger = 1) then
              ColorInfo(Canvas)
           else
              ColorInactivo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK') then
        begin
           if (DMRegInventario.QMDetalleCONTROL_STOCK.AsInteger = 1) then
              ColorInfo(Canvas)
           else
              ColorInactivo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'UNIDADES') then
        begin
           if (Abs(DMRegInventario.QMDetalleUNIDADES.AsFloat - DMRegInventario.QMDetalleSTOCK.AsFloat) > 0.01) then
              ColorResaltado2(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMRegInventario.DBGFDetalleDblClick(Sender: TObject);
var
  ValorALFA : string;
  i : integer;
begin
  inherited;
  if (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMRegInventario.QMDetalleARTICULO.AsString + '''')
  else
  if (Copy(TDBGridFind2000(Sender).ColumnaActual, 1, 5) = 'ALFA_') then
  begin
     i := StrToInt(Copy(TDBGridFind2000(Sender).ColumnaActual, 6, 1));
     ValorALFA := DMRegInventario.QMDetalle.FieldByName(format('ALFA_%d', [i])).AsString;
     if InputQuery(Format(_('Nuevo valor para '), [LeeParametro(format('ARTDESC%3.3d', [i]))]), _('Nuevo valor'), ValorALFA) then
     begin
        DMRegInventario.ModificaValorALFA(i, DMRegInventario.QMDetalleARTICULO.AsString, ValorALFA);
        DMRegInventario.QMDetalle.Refresh;
     end;
  end
  else
  if ((UpperCase(TDBGridFind2000(Sender).ColumnaActual) = 'ID_LOTE') or (UpperCase(TDBGridFind2000(Sender).ColumnaActual) = 'LOTE')) then
     FMain.EjecutaAccion(FMain.ALotes, 'L.ID_LOTE = ' + IntToStr(DMRegInventario.QMDetalleID_LOTE.AsInteger))
  else
  if (UpperCase(TDBGridFind2000(Sender).ColumnaActual) = 'PROVEEDOR_LOTE') then
     FMain.EjecutaAccion(FMain.AProveedores,
        'Proveedor = ' + IntToStr(DMRegInventario.QMDetallePROVEEDOR_LOTE.AsInteger) + ' and Ejercicio = ' +
        IntToStr(DMRegInventario.QMCabeceraEJERCICIO_MOV.AsInteger));
end;

procedure TFMRegInventario.TButtPruebasClick(Sender: TObject);
{$IFDEF Debug}
var
  i, j, id_a, id_reg : integer;
  Articulo, Lote, Titulo, UnidadesExcel, PrecioExcel{, Archivo} : string;
  Cancelar : boolean;
  Unidades, Precio : double;
{$ENDIF}
begin
  inherited;
  {$IFDEF Debug}
  Cancelar := False;
  try
     DMRegInventario.QMDetalle.DisableControls;
     DMRegInventario.NotasLote := False;
     try
        for j := 1 to 100 do
        begin
           for i := 1 to 5 do
           begin
              if (not Cancelar) then
              begin
                 case i of
                    1:
                    begin
                       Articulo := '';
                       UnidadesExcel := '0';
                       PrecioExcel := '0';
                       Lote := '';
                    end;
                    2:
                    begin
                       Articulo := '.';
                       UnidadesExcel := '2';
                       PrecioExcel := '2';
                       Lote := '';
                    end;
                    3:
                    begin
                       Articulo := '25549';
                       UnidadesExcel := '3';
                       PrecioExcel := '3';
                       Lote := '';
                    end;
                    4:
                    begin
                       Articulo := '25549';
                       UnidadesExcel := '4';
                       PrecioExcel := '4';
                       Lote := '1';
                    end;
                    5:
                    begin
                       Articulo := '25549';
                       UnidadesExcel := '5';
                       PrecioExcel := '5';
                       Lote := '2';
                    end;
                    6:
                    begin
                       Articulo := '.';
                       UnidadesExcel := '6';
                       PrecioExcel := '0';
                       Lote := '';
                    end;
                 end;

                 if (Articulo > '') then
                 begin
                    id_a := DameIDArticulo(Articulo);
                    Titulo := DameTituloArticulo(Articulo);
                    Unidades := StrToFloatDef(UnidadesExcel, 0);
                    Precio := StrToFloatDef(PrecioExcel, 0);
                    FMRegInventario.Caption := Format(_('Regularización de Stock - Art: %s Uds: %8.2n (%s) %s - Lote: %s.'), [Articulo, Unidades, UnidadesExcel, Titulo, Lote]);
                    if (id_a > 0) then
                    begin
                       try
                       DMRegInventario.AgregaArticulo(id_a, Articulo, Titulo, Unidades, Precio, Lote);
                       except
                          on e:exception do
                          begin
                             ConfirmaMensaje('Error agregando articulo'+#13#10+E.Message);
                          end;
                       end;
                    end
                    else
                    begin
                       if (MessageDlg(Format(_('No existe Ariculo' + #13#10 + 'Código: %s - Stock: %s' + #13#10 + '¿Desea continuar?'), [Articulo, UnidadesExcel]), mtWarning, [mbYes, mbNo], 0) = mrNo) then
                          Cancelar := True;
                    end;
                 end;
              end;
           end; // for
        end;
        with DMRegInventario do
        begin
           if (TUpdate.InTransaction) then
              TUpdate.Commit;

           RefrescaStock;

           // Reposicion
           id_reg := QMCabeceraID_REG.AsInteger;
           with QMCabecera do
           begin
              Close;
              Open;
              Last;
              while ((not BOF) and (id_reg <> QMCabeceraID_REG.AsInteger)) do
                 Prior;
           end;
        end;

        FMRegInventario.Caption := _('Regularización de Stock');
        Application.ProcessMessages;
     finally
        DMRegInventario.NotasLote := True;
     end;
  finally
     DMRegInventario.QMDetalle.EnableControls;
  end;
  {$ENDIF}
end;

procedure TFMRegInventario.AAsignaLoteAutoExecute(Sender: TObject);
begin
  inherited;
  // Verificamos si el articulo es loteable
  if (ArticuloLoteable(DMRegInventario.QMDetalleID_A.AsInteger)) then
     DMRegInventario.AsignaLoteComponente
  else
     ShowMessage('El articulo no es loteable');
end;

procedure TFMRegInventario.AEtiquetasArticuloExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  FMImprimirCodBarras.ImportarDatos('REG', DMRegInventario.QMCabeceraID_REG.AsInteger, DMRegInventario.QMDetalleID_A.AsInteger);
end;

procedure TFMRegInventario.AEtiquetaArticulosTodosExecute(Sender: TObject);
var
  SQL : TStrings;
begin
  inherited;
  SQL := TStringList.Create;
  try
     DMRegInventario.DameSqlImpresionEtiquetas(EFFiltroArticulo.Text, SQL);
     AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
     FMImprimirCodBarras.ImportarDatosSql('REG', DMRegInventario.QMCabeceraID_REG.AsInteger, SQL);
  finally
     SQL.Free;
  end;
end;

procedure TFMRegInventario.EPDetalleClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRegInventario.BusquedaComplejaDetalle;
end;

procedure TFMRegInventario.EFFiltroArticuloChange(Sender: TObject);
begin
  inherited;
  DMRegInventario.FiltrarDetalle(EFFiltroArticulo.Text);
end;

procedure TFMRegInventario.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMRegInventario.ATraspasoMovimientoStockExecute(Sender: TObject);
begin
  inherited;
  DMRegInventario.TraspasoMovimientoStock;
end;

procedure TFMRegInventario.AInsertarModeloExecute(Sender: TObject);
var
  Modelo : string;
begin
  inherited;
  if PideDato('MOD', Modelo, _('Modelo'), 'BAJA = 0') then
     DMRegInventario.InsertaModelo(Modelo);
end;

procedure TFMRegInventario.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGFDetalle, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFDetalle.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMRegInventario.AConfListadosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstRegInventario, DMLstRegInventario);
  TFMListConfig.Create(Self).Muestra(655, formato, cabecera, copias,
     pijama, '', DMLstRegInventario.frRegInventario, DMLstRegInventario.HYReport);
  CierraData(DMLstRegInventario);
end;

procedure TFMRegInventario.AVisualizacionRegularizacionStockExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstRegInventario, DMLstRegInventario);
  DMLstRegInventario.MostrarListado(DMRegInventario.QMCabeceraID_REG.AsInteger, 0, 655);
  CierraData(DMLstRegInventario);
end;

procedure TFMRegInventario.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AVisualizacionRegularizacionStock.Execute;
end;

end.
