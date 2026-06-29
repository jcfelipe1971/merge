unit UDMLstPedidos_prov;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  UHYReportMail, UHYReport, frxClass, frxHYReport, FR_Pars, FIBDataSetRW,
  frxDBSet;

type
  TDMLstPedidos_Prov = class(TDataModule)
     frPedidos: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frDBdetalle: TfrDBDataSet;
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     xProveedores: TFIBDataSetRO;
     DSxProveedores: TDataSource;
     xDireccion_Proveedores: TFIBDataSetRO;
     frUDPie: TfrUserDataset;
     TLocal: THYTransaction;
     xTerceros: TFIBDataSetRO;
     DSxTerceros: TDataSource;
     frUDNotasArt: TfrUserDataset;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     HYReportMail: THYReportMail;
     HYMSCabecera: THYReportMailSource;
     HYMSDetalle: THYReportMailSource;
     HYMSxProveedores: THYReportMailSource;
     HYMSxDireccionProveedor: THYReportMailSource;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSxProveedores: THYReportSource;
     HYRSxDireccionProveedor: THYReportSource;
     HYRxTerceros: THYReportSource;
     xFormaPago: TFIBDataSetRO;
     xAlmacen: TFIBDataSetRO;
     DSxAlmacen: TDataSource;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSxDireccion_Proveedores: TDataSource;
     DobleCabecera: TFIBDataSetRO;
     DSDobleCabecera: TDataSource;
     HYRSDobleCabecera: THYReportSource;
     HYMSDobleCabecera: THYReportMailSource;
     HYRSxArticulos: THYReportSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     frxPedidos: TfrxHYReport;
     frxUDNotasArt: TfrxUserDataSet;
     frxUDPie: TfrxUserDataSet;
     DSxTransportista: TDataSource;
     xTransportista: TFIBDataSetRO;
     xEmpleado: TFIBDataSetRO;
     DSxEmpleado: TDataSource;
     xArticulosIdioma: TFIBDataSetRO;
     DSxArticulosIdioma: TDataSource;
     QMNecesidadesProduccion: TFIBDataSetRW;
     frDBNecesidadesProduccion: TfrDBDataSet;
     DSQMNecesidadesProduccion: TDataSource;
     xMaterialesProduccion: TFIBDataSetRO;
     DSxMaterialesProduccion: TDataSource;
     frDBMaterialesProduccion: TfrDBDataSet;
     QMDetalleUE: TFIBDataSetRO;
     DSDetalleUE: TDataSource;
     frDBGrupoTalla: TfrDBDataSet;
     DSGrupoTalla: TDataSource;
     HYRSGrupoTalla: THYReportSource;
     QMGrupoTalla: TFIBDataSetRO;
     HYRMGrupoTalla: THYReportMailSource;
     frxDBGrupoTalla: TfrxDBDataset;
     frDBTituloTalla: TfrDBDataSet;
     DSTituloTalla: TDataSource;
     HYRSTituloTalla: THYReportSource;
     QMTituloTalla: TFIBDataSetRO;
     HYRMTituloTalla: THYReportMailSource;
     frxDBTituloTalla: TfrxDBDataset;
     frDBDetalleTallas: TfrDBDataSet;
     DSDetalleTallas: TDataSource;
     HYRSDetalleTallas: THYReportSource;
     QMDetalleTallas: TFIBDataSetRO;
     HYRMDetalleTallas: THYReportMailSource;
     frxDBDetalleTallas: TfrxDBDataset;
     QMArticuloTallas: TFIBDataSetRO;
     DSArticuloTallas: TDataSource;
     xDatosIva: TFIBDataSetRO;
     DSxDatosIva: TDataSource;
     frDBxDatosIva: TfrDBDataSet;
     xDobleIva: TFIBDataSetRO;
     DSxDobleIva: TDataSource;
     xAlmacenDireccion: TFIBDataSetRO;
     DSxAlmacenDireccion: TDataSource;
     xOrdenProduccion: TFIBDataSetRO;
     DSxOrdenProduccion: TDataSource;
     xTrabajoExterno: TFIBDataSetRO;
     DSxTrabajoExterno: TDataSource;
     procedure frPedidosGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstPedidos_ProvCreate(Sender: TObject);
     procedure DMLstPedidos_ProvDestroy(Sender: TObject);
     procedure frPedidosEnterRect(Memo: TStringList; View: TfrView);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure HYReportMailEnterFields(Sender: THYReportMail; Field: THYField; var Source: string);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frPedidosPrintReport;
     procedure HYReportPrintReport(Sender: THYReport);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxPedidosBeforePrint(Sender: TfrxReportComponent);
     procedure frxPedidosGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure xProveedoresAfterOpen(DataSet: TDataSet);
     procedure xProveedoresBeforeClose(DataSet: TDataSet);
     procedure frPedidosUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure DobleCabeceraAfterOpen(DataSet: TDataSet);
     procedure DobleCabeceraBeforeClose(DataSet: TDataSet);
     function frxPedidosUserFunction(const MethodName: string; var Params: variant): variant;
     procedure QMGrupoTallaAfterOpen(DataSet: TDataSet);
     procedure QMGrupoTallaBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleTallasBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
     procedure xAlmacenAfterOpen(DataSet: TDataSet);
     procedure xAlmacenBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     ric: TStringList;
     j, Pagina: integer;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     SW, FiltroGen, id_e_aux: integer;
     SerieGen: string;
     Param_MODREST017: boolean;
  public
     { Public declarations }
     nombreFich, rutaFich: string;
     procedure MostrarListado(Modo, Numero: byte; id_e: integer; Serie: string);
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string; SQL: TStrings);
     procedure MostrarListadoMail(id_e: integer; Serie: string; Modo: integer; const Ejercicio: integer; var Memo: TStrings);
     procedure MatricialesEnterFields(var Source: string);
     procedure UpdateaDocumentos;
  end;

var
  DMLstPedidos_Prov : TDMLstPedidos_Prov;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UDameDato, UParam;

{$R *.DFM}

procedure TDMLstPedidos_Prov.DMLstPedidos_ProvCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  ric := TStringList.Create;

  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');

  frxPedidos.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');
end;

procedure TDMLstPedidos_Prov.DMLstPedidos_ProvDestroy(Sender: TObject);
begin
  ric.Free;
  CierraData(DMListados);
end;

procedure TDMLstPedidos_Prov.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string; SQL: TStrings);
var
  str : string;
  i : integer;
begin
  SerieGen := Serie;
  FiltroGen := Filtro;
  id_e_aux := 0;
  SW := 1;
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.AddStrings(SQL);
     // Utilizo la vista para listado
     QMCabecera.SelectSQL.Text := StringReplace(QMCabecera.SelectSQL.Text, 'VER_CABECERAS_PEDIDO_PROV', 'VER_CABECERAS_PEDIDO_PROV_LST', [rfReplaceAll]);

     if (Filtro = 0) then
        DMMain.FiltraRO(QMCabecera, '11110', False);

     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;

  DMlistados.Cargar(40, Serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frPedidos.LoadFromFIB(REntorno.Formato, str);
     frPedidos.PrepareReport;
     case Modo of
        0: frPedidos.ShowPreparedReport;
        1: frPedidos.PrintPreparedReport(' ', 1);
     end;
  end
  else
  if (REntorno.TipoListado = 'HYR') then
  begin
     Pagina := 0;
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
  end
  else
  if (REntorno.TipoListado = 'HYM') then
  begin
     Pagina := 0;
     HYReportMail.LoadFromFIB(REntorno.Formato, str);
     HYReportMail.Prepare;
     case Modo of
        0: HYReportMail.Preview;
     end;
  end
  else
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxPedidos.LoadFromFIB(REntorno.Formato, str);
     frxPedidos.PrepareReport;
     case Modo of
        0: frxPedidos.ShowPreparedReport;
        1: frxPedidos.PrintPreparedReport(' ', 1);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstPedidos_Prov.MostrarListado(Modo, Numero: byte; id_e: integer; Serie: string);
var
  Titulo : string;
  Grupo, Listado : integer;
begin
  id_e_aux := id_e;
  SerieGen := Serie;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;

  SW := 1;

  Listado := 0;
  Grupo := 40;
  case numero of
     0: Grupo := 40;
     1: Grupo := 2001;
     2: Grupo := 2004;
     3: Grupo := 660;
  end;

  Titulo := _('PedidoProveedor') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString;
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frPedidos, frxPedidos, HYReport, HYReportMail);
end;

procedure TDMLstPedidos_Prov.frPedidosGetValue(const ParName: string; var ParValue: variant);
var
  i : integer;
  Cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  Cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if ParName = 'Pedido' then
  begin
     // Actualizar las máscaras para el pedido actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);

     // Refrescar la Doble Cabecera
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_E'].AsInteger := QMCabecera.FieldByName('ID_E').AsInteger;
        Open;
     end;

     ParValue := QMCabecera.FieldByName('RIG').AsInteger;
  end;

  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;
  if ParName = 'Fecha_entrega' then {dji lrk kri}
     ParValue := QMCabecera.FieldByName('FECHA_ENTREGA').AsDateTime;

  if ParName = 'Articulo' then
     if (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := ' '
     else
        ParValue := QMDetalle.FieldByName('ARTICULO').AsString;

  if ParName = 'Unidades' then
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if ((xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger <> 0) and
           (QMDetalle.FieldByName('APLICA_UNIDADES_SECUNDARIAS').AsInteger <> 0)) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMDetalle.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Titulo_Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

  if ParName = 'Moneda_Sec' then
     ParValue := Moneda_Sec;

  if ParName = 'TotalMonSec' then
     ParValue := DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio);

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_E').AsInteger = DobleCabecera.FieldByName('ID_E').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  if ParName = 'Barras' then
     ParValue := DameCodigoBarras(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'NombreUsuarioKri' then
     ParValue := DameNombreCorreoUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));

  if ParName = 'CodigoProveedor' then
     ParValue := DameCodigoProveedor(QMCabecera.FieldByName('PROVEEDOR').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'TituloArticuloProveedor' then
     ParValue := DameTituloArticuloProveedor(QMCabecera.FieldByName('PROVEEDOR').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString);

  // Variables PIVA[1..9] - Porcentaje de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'PIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('P_IVA').AsFloat;
     end;
  end;

  // Variables PIVAR[1..9] o PRE[1..9] - Porcentaje de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_RE').IsNull then
           ParValue := xDobleIva.FieldByName('P_RE').AsFloat;
     end;
  end;

  // Variables BI[1..9] - Base Imponible
  if Copy(UpperCase(ParName), 1, 2) = 'BI' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 3, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('S_BASES_DTO').IsNull then
           ParValue := xDobleIva.FieldByName('S_BASES_DTO').AsFloat;
     end;
  end;

  // Variables IIVA[1..9] - Importe de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'IIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  // Variables IIVAR[1..9] - Importe de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat;
     end;
  end;

  // Variables PIA[1..9] - Porcentaje Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'PIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IIA[1..9] - Importe Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'IIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IVA_RE[1..9] - Importe IVA + Recargo por equivalencia
  if Copy(UpperCase(ParName), 1, 6) = 'IVA_RE' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 7, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat + xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA' then
     ParValue := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProveedores.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProveedores.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA_LARGO' then
     ParValue := DameTituloLargoFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProveedores.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA_LARGO' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloLargoFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProveedores.FieldByName('IDIOMA').AsString);

  if ParName = 'Stock' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMDetalle.FieldByName('ALMACEN').AsString);

  if ParName = 'TituloFamilia' then
     ParValue := DameTituloFamilia(xArticulos.FieldByName('FAMILIA').AsString);
end;

procedure TDMLstPedidos_Prov.frPedidosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraArt]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES0').AsString), False);

     if (Pos('[MascaraArtT]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if memo[0] = '[NotasArt]' then
     begin
        memo[0] := ric.Strings[j];
     end;
     if memo[0] = 'UDS.' then
        SW := 1;       //Para inicializar el pijama en cada pedido

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraNSec]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraNSec;

     if (Pos('[MascaraP]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := MascaraP;

     if (Pos('[MascaraL]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := LocalMascaraL;

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);
  end;
end;

procedure TDMLstPedidos_Prov.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
end;

procedure TDMLstPedidos_Prov.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = j);
end;

procedure TDMLstPedidos_Prov.frUDNotasArtFirst(Sender: TObject);
begin
  j := 0;
end;

procedure TDMLstPedidos_Prov.frUDNotasArtNext(Sender: TObject);
begin
  j := j + 1;
end;

procedure TDMLstPedidos_Prov.MostrarListadoMail(id_e: integer; Serie: string; Modo: integer; const Ejercicio: integer; var Memo: TStrings);
var
  str : string;
begin
  id_e_aux := id_e;
  SerieGen := Serie;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;

  nombreFich := LimpiaNombreFichero(format('%s_%d-%s-%.5d.pdf', [_('Pedido'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]));

  // Actualizar las máscaras para el pedido actual
  LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);
  if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
     Moneda_Sec := REntorno.Moneda_Sec
  else
     Moneda_Sec := REntorno.Moneda;

  LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);

  DMListados.CargarMail(40, Serie);

  if (Modo <> 2) then
  begin
     if (REntorno.TipoListado = 'HYM') then
     begin
        Pagina := 0;
        HYReportMail.LoadFromFIB(REntorno.Formato, str);
        HYReportMail.Prepare;
        case Modo of
           0: HYReportMail.Preview;
           1: HYReportMail.PrintinMemo(Memo);
        end;
     end;
  end
  // sino es matricial y la opcion elegida es la de enviar pdf(matricial no envia pdf),se toma
  // el listado que tenga por defecto para ese documento
  else
  begin
     if (REntorno.TipoListado = 'FRF') then
     begin
        with frPedidos do
        begin
           LoadFromFIB(REntorno.Formato, str);
           PrepareReport;
           rutaFich := ExportarPDF(frPedidos, nombreFich);
        end;
     end
     else
     if (REntorno.TipoListado = 'FR3') then
     begin
        with frxPedidos do
        begin
           LoadFromFIB(REntorno.Formato, str);
           PrepareReport;
           rutaFich := ExportarPDF(frxPedidos, nombreFich);
        end;
     end
     else
     begin
        MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
           'El listado debe ser del tipo FRF/FR3.'), mtWarning, [mbOK], 0);
        raise Exception.Create('');
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstPedidos_Prov.HYReportMailEnterFields(Sender: THYReportMail; Field: THYField; var Source: string);
begin
  MatricialesEnterFields(Source);
end;

procedure TDMLstPedidos_Prov.MatricialesEnterFields(var Source: string);
var
  Cambio : extended;
begin
  if Source = '[ACTIVAR]' then
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_E'].AsInteger := QMCabecera.FieldByName('ID_E').AsInteger;
        Open;
        Source := '';

        // Actualizar las máscaras para el pedido actual
        LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
        LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

        // Se comprueba la segunda moneda a emplear
        if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
           Moneda_Sec := REntorno.Moneda_Sec
        else
           Moneda_Sec := REntorno.Moneda;

        LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
     end;

  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;

  if Source = '[NIF_EMPRESA]' then
     Source := REntorno.CifEmpresa;

  if Source = '[EJERCICIO2]' then
     Source := Copy(QMCabecera.FieldByName('EJERCICIO').AsString, 3, 2);

  if Source = '[FECHA_CABECERA]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);

  if Source = '[DIR_EMPRESA]' then
     Source := REntorno.DirEmpresa + #13#10 + REntorno.PobEmpresa + ' (' +
        REntorno.ProvEmpresa + ' - ' + REntorno.Pais + ')';

  if Source = '[TELF_EMPRESA]' then
     Source := REntorno.Tel1Empresa;

  if Source = '[PRECIO_DETALLE]' then
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, (QMDetalle.FieldByName('P_COSTE').AsFloat));
  end;

  if Source = '[DPP]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('DTO_PP').AsFloat)) + '%';

  if Source = '[DCO]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('DTO_CIAL').AsFloat)) + '%';

  if Source = '[B_DTO_LINEA]' then
     Source := FormatFloat(LocalMascaraL, (QMDetalle.FieldByName('B_DTO_LINEA').AsFloat));

  if Source = '[MONEDA]' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        Source := Format(_('Moneda: %s'), [xMonedas.FieldByName('TITULO').AsString]);
     end;

  if Source = '[DOC_MONEDA]' then
     Source := _('Total') + ' ' + QMCabecera.FieldByName('MONEDA').AsString + ':';

  if Source = '[LIQUIDO]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('LIQUIDO').AsFloat));

  if Source = '[I_DTO_PP]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('I_DTO_PP').AsFloat));

  if Source = '[I_DTO_CIAL]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('I_DTO_CIAL').AsFloat));

  if Source = '[S_CUOTA_IVA]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('S_CUOTA_IVA').AsFloat));

  if Source = '[S_CUOTA_RE]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('S_CUOTA_RE').AsFloat));

  if Source = '[S_BASES]' then
     Source := FormatFloat(LocalMascaraN, (QMCabecera.FieldByName('S_BASES').AsFloat));

  if Source = '[I_DESCUENTO]' then
     Source := FormatFloat(LocalMascaraN, (QMDetalle.FieldByName('I_DESCUENTO').AsFloat));

  if Source = '[TOTAL_MONEDA_SEC]' then  // Descripción de la moneda 'EUR','PTAS', etc
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := _('Total') + ' ' + Moneda_Sec + ':'
     else
        Source := ' ';
  end;

  if Source = '[I_TOTALMONSEC]' then   // Importe cambiado a la moneda actual
  begin
     Cambio := 0;
     if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := FormatFloat(LocalMascaraNSec, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio))
     else
        Source := ' ';
  end;

  if Source = ' ' then
     Source := '';
end;

procedure TDMLstPedidos_Prov.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
begin
  MatricialesEnterFields(Source);
end;

procedure TDMLstPedidos_prov.UpdateaDocumentos;
var
  ID_S : integer;
begin
  with xUpdateaDocumentos do
  begin
     Close;
     SelectSQL.Text := QMCabecera.SelectSQL.Text;
     Plan.Text := QMCabecera.Plan.Text;
     if (id_e_aux = 0) then
        Params.ByName['SERIE'].AsString := SerieGen
     else
        Params.ByName['ID_E'].AsInteger := id_e_aux;

     Open;

     if (id_e_aux = 0) then
        if (FiltroGen = 0) then
        begin
           DMMain.FiltraRO(xUpdateaDocumentos, '11110', False);
           Params.ByName['SERIE'].AsString := SerieGen;
           Open;
        end;

     First;
     ID_S := FieldByName('ID_E').AsInteger;
     while not EOF do
     begin
        ModificaDoc(QGen, ID_S, 7, 1);
        Next;
        ID_S := FieldByName('ID_E').AsInteger;
     end;
  end;
end;

procedure TDMLstPedidos_Prov.frPedidosPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstPedidos_Prov.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstPedidos_Prov.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulos.Open;
  with xArticulosIdioma do
  begin
     Close;
     Params.ByName['IDIOMA'].AsString := xProveedores.FieldByName('IDIOMA').AsString;
     Open;
  end;

  xProyectosDetalle.Open;

  with xEmpleado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
  end;

  QMDetalleUE.Open;
end;

procedure TDMLstPedidos_Prov.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProveedores.Open;
  xDireccion_Proveedores.Open;
  xFormaPago.Open;
  xDatosIva.Open;
  xProyectos.Open;
  xAlmacen.Open;
  xTransportista.Open;
  xMonedas.Open;
  QMDetalle.Open;
  xTrabajoExterno.Open;

  if Param_MODREST017 and (not QMGrupoTalla.Active) then
     QMGrupoTalla.Open;
end;

procedure TDMLstPedidos_Prov.frxPedidosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := LocalMascaraL;
                 DisplayFormat.Kind := fkNumeric;
              end;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := MascaraP;
                 DisplayFormat.Kind := fkNumeric;
              end;
           end;
           if Pos('UDS.', Memo[0]) > 0 then
              SW := 1;
           if Pos('[NotasArt]', Memo[0]) > 0 then
              memo[0] := ric.Strings[j];
           if Pos('[MascaraNSec]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraNSec;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;

  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = 'ImgArticulo') then
     begin
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;
  end;
end;

procedure TDMLstPedidos_Prov.frxPedidosGetValue(const VarName: string; var Value: variant);
begin
  frPedidosGetValue(VarName, Value);
end;

procedure TDMLstPedidos_Prov.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xFormaPago.Close;
  xAlmacen.Close;
  xTransportista.Close;
  xProveedores.Close;
  xDireccion_Proveedores.Close;
  xProyectos.Close;
  xMonedas.Close;
  QMGrupoTalla.Close;
  xDatosIva.Close;
  xTrabajoExterno.Close;
end;

procedure TDMLstPedidos_Prov.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulos.Close;
  xArticulosIdioma.Close;
  xProyectosDetalle.Close;
  // xStock.Close;
  QMDetalleUE.Close;
end;

procedure TDMLstPedidos_Prov.xProveedoresAfterOpen(DataSet: TDataSet);
begin
  xTerceros.Open;
end;

procedure TDMLstPedidos_Prov.xProveedoresBeforeClose(DataSet: TDataSet);
begin
  xTerceros.Close;
end;

procedure TDMLstPedidos_Prov.frPedidosUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
var
  Idioma : string;
  Grupo : integer;
  Parser : TfrParser;
  Bandera : string;
begin
  if (Name = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Parser.Calc(p1);
     Idioma := xProveedores.FieldByName('IDIOMA').AsString;
     // Bandera = D el memo está en el pie de pagina y ha de cojer los valores de la doble cabecera
     Bandera := Parser.Calc(p2);
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Val := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstPedidos_Prov.DobleCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMNecesidadesProduccion.Open;
  xOrdenProduccion.Open;
  xMaterialesProduccion.Open;
end;

procedure TDMLstPedidos_Prov.DobleCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMNecesidadesProduccion.Close;
  xOrdenProduccion.Close;
  xMaterialesProduccion.Close;
end;

function TDMLstPedidos_Prov.frxPedidosUserFunction(const MethodName: string; var Params: variant): variant;
var
  Idioma : string;
  Grupo : integer;
  // Parser : TfrxParser;
  Bandera : string;
begin
  if (MethodName = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Params[0];

     Bandera := '';
     Bandera := Params[1];
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Result := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstPedidos_Prov.QMGrupoTallaAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
  QMDetalleTallas.Open;
end;

procedure TDMLstPedidos_Prov.QMGrupoTallaBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
  QMDetalleTallas.Close;
end;

procedure TDMLstPedidos_Prov.QMDetalleTallasAfterOpen(DataSet: TDataSet);
begin
  QMArticuloTallas.Open;
end;

procedure TDMLstPedidos_Prov.QMDetalleTallasBeforeClose(DataSet: TDataSet);
begin
  QMArticuloTallas.Close;
end;

procedure TDMLstPedidos_Prov.DobleCabeceraAfterScroll(DataSet: TDataSet);
begin
  xDobleIva.Close;
  xDobleIva.Open;
end;

procedure TDMLstPedidos_Prov.xAlmacenAfterOpen(DataSet: TDataSet);
begin
  xAlmacenDireccion.Open;
end;

procedure TDMLstPedidos_Prov.xAlmacenBeforeClose(DataSet: TDataSet);
begin
  xAlmacenDireccion.Close;
end;

end.
