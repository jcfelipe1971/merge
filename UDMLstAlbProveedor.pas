unit UDMLstAlbProveedor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_DSet, FR_Class, Fr_HYReport, FIBQuery, FIBDatabase, UFIBModificados,
  FR_DBSet, DB, FIBDataSet, FIBTableDataSet, UHYReport, FIBDataSetRO,
  HYFIBQuery, frxClass, frxHYReport, FR_Pars, frxDBSet, UHYReportMail;

type
  TDMLstAlbProveedor = class(TDataModule)
     DSQMCabecera: TDataSource;
     frDBCabecera: TfrDBDataSet;
     DSQMDetalle: TDataSource;
     frDBDetalle: TfrDBDataSet;
     DSxProv: TDataSource;
     DSxDirProv: TDataSource;
     TLocal: THYTransaction;
     frAlbaranes: TfrHYReport;
     frUDPie: TfrUserDataset;
     DSQSPProcedencia: TDataSource;
     frDBQSPProcedencia: TfrDBDataSet;
     DSxNotasProv: TDataSource;
     frDBxNotasProv: TfrDBDataSet;
     frDBxDirProv: TfrDBDataSet;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSxProv: THYReportSource;
     HYRSxDirProv: THYReportSource;
     HYRSDetalle: THYReportSource;
     frUDNotasArt: TfrUserDataset;
     QMCabecera: TFIBDataSetRO;
     QMDetalle: TFIBDataSetRO;
     xProv: TFIBDataSetRO;
     xDirProv: TFIBDataSetRO;
     xNotasProv: TFIBDataSetRO;
     QSPProcedencia: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QDamePrecioUdPtoVerde: THYFIBQuery;
     QLoteKri: TFIBDataSetRO;
     QNroSerieKri: TFIBDataSetRO;
     xDatosIVA: TFIBDataSetRO;
     DSxDatosIVA: TDataSource;
     frDBxDatosIVA: TfrDBDataSet;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSDobleCabecera: TDataSource;
     DobleCabecera: TFIBDataSetRO;
     HYRSDobleCabecera: THYReportSource;
     xLotes: TFIBDataSetRO;
     DSxLotes: TDataSource;
     frDBxLotes: TfrDBDataSet;
     xNroSerie: TFIBDataSetRO;
     DSxNroSerie: TDataSource;
     frDBxNroSerie: TfrDBDataSet;
     HYRSxNroSerie: THYReportSource;
     HYRSxLotes: THYReportSource;
     HYRSxArticulos: THYReportSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     frxAlbaranes: TfrxHYReport;
     frxUDPie: TfrxUserDataSet;
     frxUDNotasArt: TfrxUserDataSet;
     xArticulosIdioma: TFIBDataSetRO;
     DSxArticulosIdioma: TDataSource;
     DSDetalleUE: TDataSource;
     QMDetalleUE: TFIBDataSetRO;
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
     DSxDobleIva: TDataSource;
     xDobleIva: TFIBDataSetRO;
     procedure DMLstAlbProveedorCreate(Sender: TObject);
     procedure DMLstAlbProveedorDestroy(Sender: TObject);
     procedure xProvAfterScroll(DataSet: TDataSet);
     procedure frAlbaranesGetValue(const ParName: string; var ParValue: variant);
     procedure frAlbaranesEnterRect(Memo: TStringList; View: TfrView);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frAlbaranesPrintReport;
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure HYReportPrintReport(Sender: THYReport);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxAlbaranesBeforePrint(Sender: TfrxReportComponent);
     procedure frxAlbaranesGetValue(const VarName: string; var Value: variant);
     procedure frxAlbaranesPrintReport(Sender: TObject);
     procedure frAlbaranesUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     function frxAlbaranesUserFunction(const MethodName: string; var Params: variant): variant;
     procedure QMGrupoTallaAfterOpen(DataSet: TDataSet);
     procedure QMGrupoTallaBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleTallasBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     ric: TStringList;
     j: integer;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     nro_serie: string;
     Param_MODREST017: boolean;
     procedure LineasNoSerializadas(L: TStrings; Tipo: string; ID_E: integer);
  public
     { Public declarations }
     nombreFich, rutaFich: string;
     procedure MostrarInforme(Modo: byte; Serie: string);
     procedure MostrarInformesFiltrados(Modo: byte; Filtro: integer; Serie: string);
     procedure UpdateaDocumentos;
     procedure MostrarListadoMail(id_e: integer; Serie: string; Modo: integer; const Ejercicio: integer);
  end;

var
  DMLstAlbProveedor : TDMLstAlbProveedor;
  SW, ID_S_AUX, FiltroGen : integer;
  SerieGen : string;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UDMAlbaranesAProveedor,
  UUtiles, UDameDato, PsFR_E_PDF, UParam;

{$R *.DFM}

procedure TDMLstAlbProveedor.DMLstAlbProveedorCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  ric := TStringList.Create;

  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');

  frxAlbaranes.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');
end;

procedure TDMLstAlbProveedor.DMLstAlbProveedorDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  ric.Free; {dji lrk kri - Memory Leak}
  Application.ProcessMessages;
end;

procedure TDMLstAlbProveedor.xProvAfterScroll(DataSet: TDataSet);
begin
  with xDirProv do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xProv.FieldByName('TERCERO').AsInteger;
     Params.ByName['Direccion'].AsInteger := 1; // Dirección 1
     Open;
  end;
end;

procedure TDMLstAlbProveedor.MostrarInforme(Modo: byte; Serie: string);
var
  Titulo : string;
  Grupo, Listado : integer;
  L : TStrings;
begin
  L := TStringList.Create;
  try
     if (LeeParametro('ALPNSER001', Serie) = 'S') then
        LineasNoSerializadas(L, 'ALP', DMAlbaranesAProveedor.QMCabecera.FieldByName('ID_E').AsInteger);

     if (L.Count > 0) then
        ShowMessage(_('Faltan lineas por serializar') + #13#10 + L.Text)
     else
     begin
        id_s_aux := DMAlbaranesAProveedor.QMCabecera.FieldByName('ID_E').AsInteger;
        seriegen := Serie;
        SW := 1;
        with QMCabecera do
        begin
           Close;
           Params.ByName['ID_E'].AsInteger := DMAlbaranesAProveedor.QMCabecera.FieldByName('ID_E').AsInteger;
           Open;
        end;

        Grupo := 72;
        Listado := 0;
        Titulo := _('AlbaranProveedor') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString;
        DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frAlbaranes, frxAlbaranes, HYReport, nil);
     end;
  finally
     L.Free;
  end;
end;

procedure TDMLstAlbProveedor.frAlbaranesGetValue(const ParName: string; var ParValue: variant);
var
  i : integer;
  s : string;
  Cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  Cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if ParName = 'Albaran' then
  begin
     // Actualizar las máscaras para la factura actual
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

  if ParName = 'UnidadesSF' then
     //Sin Formato, para poder utilizarlo en cálculos internos del listado
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
        ParValue := QMDetalle.FieldByName('UNIDADES').AsFloat;
  end;

  if ParName = 'Procedencia' then
     if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEP' then
        ParValue := Format(_('Pedido %s Linea %s Fecha Ped.: %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, QSPProcedencia.FieldByName('LINEA_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
     else
        ParValue := Format(_('Oferta %s Linea %s Fecha Ped.: %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, QSPProcedencia.FieldByName('LINEA_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);

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

  if ParName = 'PrecioUdPtoVerde' then
  begin
     with QDamePrecioUdPtoVerde do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
        Params.ByName['ARTICULO'].AsString := QMDetalle.FieldByName('ARTICULO').AsString;
        ExecQuery;
        ParValue := FieldByName['PTO_VERDE'].AsFloat;
        FreeHandle;
     end;

     ParValue := DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, ParValue, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat);
  end;

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_E').AsInteger = DobleCabecera.FieldByName('ID_E').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  if ParName = 'NroSerie' then
     ParValue := nro_serie;

  if ParName = 'Barras' then
     ParValue := DameCodigoBarras(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'NombreUsuarioKri' then
     ParValue := DameNombreCorreoUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));

  if ParName = 'CodigoProveedor' then
     ParValue := DameCodigoProveedor(QMCabecera.FieldByName('PROVEEDOR').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'TituloArticuloProveedor' then
     ParValue := DameTituloArticuloProveedor(QMCabecera.FieldByName('PROVEEDOR').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString);

  // Portes en documentos
  if ParName = 'PorteVisible' then
     ParValue := not (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DoblePorteVisible' then
     ParValue := not (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DescPortes' then
     ParValue := DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger);

  if ParName = 'DobleDescPortes' then
     ParValue := DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger);

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
     ParValue := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA_LARGO' then
     ParValue := DameTituloLargoFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA_LARGO' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloLargoFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if ParName = 'NroSerieLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT S.ARTICULO, A.TITULO_LARGO AS TITULO, LIST(S.NSERIE, '', '') ');
              SelectSQL.Add(' FROM VER_DETALLE_SERIALIZACION S ');
              SelectSQL.Add(' JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A.ARTICULO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
              SelectSQL.Add(' S.CANAL = :CANAL AND ');
              SelectSQL.Add(' S.SERIE = :SERIE AND ');
              SelectSQL.Add(' S.TIPO = :TIPO AND ');
              SelectSQL.Add(' S.RIG = :RIG AND ');
              SelectSQL.Add(' S.LINEA = :LINEA ');
              SelectSQL.Add(' GROUP BY S.ARTICULO, A.TITULO_LARGO ');
              Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
              Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
              Params.ByName['TIPO'].AsString := QMDetalle.FieldByName('TIPO').AsString;
              Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
              Open;

              // Salto de linea antes de cada registro, excepto el primero.
              s := '';
              ParValue := '';
              while not EOF do
              begin
                 ParValue := ParValue + s + FieldByName('ARTICULO').AsString + ' - ' + FieldByName('TITULO').AsString;
                 s := #13#10;
                 ParValue := ParValue + s + FieldByName('LIST').AsString;
                 Next;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'LotesLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT LIST(LOTE, '', '') ');
              SelectSQL.Add(' FROM GES_DETALLES_E_LOTES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' ID_DETALLES_E = :ID_DETALLES_E ');
              Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalle.FieldByName('ID_DETALLES_E').AsInteger;
              Open;

              ParValue := FieldByName('LIST').AsString;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Stock' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMDetalle.FieldByName('ALMACEN').AsString);

  if ParName = 'TituloFamilia' then
     ParValue := DameTituloFamilia(xArticulos.FieldByName('FAMILIA').AsString);
end;

procedure TDMLstAlbProveedor.frAlbaranesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraArt]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if (Pos('[MascaraArtT]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if memo[0] = '[NotasArt]' then
     begin
        memo[0] := ric.Strings[j];
     end;
     if memo[0] = 'CANTIDADES' then
        SW := 1;

     if (Pos('[Notas]', Memo[0]) > 0) then
     begin
        if QMCabecera.FieldByName('NOTAS').Value = '' then
        begin
           view.Visible := False;
           view.Parent.dy := 0;
        end
        else
        begin
           if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
              view.Parent.dy := 0;
        end;
     end;

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

procedure TDMLstAlbProveedor.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  cambio : extended;
begin
  // CABECERA
  cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if Source = '[EMPRESA]' then
  begin
     Source := REntorno.NombreEmpresa;
  end;
  if Source = '[NIF_EMPRESA]' then
  begin
     Source := REntorno.CifEmpresa;
  end;
  if Source = '[DIR_EMPRESA]' then
  begin
     Source := REntorno.DirEmpresa + #13#10 + REntorno.PobEmpresa + ' (' +
        REntorno.ProvEmpresa + ' - ' + REntorno.Pais + ')';
  end;
  if Source = '[DIR_PROV]' then
  begin
     xDirProv.Close;
     xDirProv.Open;
     Source := xDirProv.FieldByName('DIRECCION').AsString + #13#10 +
        xDirProv.FieldByName('CODPOB').AsString + ' (' +
        xDirProv.FieldByName('PROVINCIA').AsString + ' - ' +
        xDirProv.FieldByName('PAIS').AsString + ')';
  end;

  if Source = '[FECHA_CABECERA]' then
  begin
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);
  end;

  // DETALLE

  if Source = '[ARTICULO]' then
     if QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre then
        Source := ' '
     else
        Source := QMDetalle.FieldByName('ARTICULO').AsString;

  if Source = '[UNIDADES]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := IntToStr(QMDetalle.FieldByName('UNIDADES').AsInteger);

  if Source = '[DTO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[PRECIO_DETALLE]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('P_COSTE').AsFloat);

  if Source = '[TOTAL_LINEA]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('B_DTO_LINEA').AsFloat);

  // PIE

  if Source = '[DTO_PP]' then
  begin
     Source := FormatFloat(MascaraP, QMCabecera.FieldByName('DTO_PP').AsFloat);
  end;
  if Source = '[IMP_DTO_PP]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('I_DTO_PP').AsFloat);
  end;
  if Source = '[DTO_CIAL]' then
  begin
     Source := FormatFloat(MascaraP, QMCabecera.FieldByName('DTO_CIAL').AsFloat);
  end;
  if Source = '[IMP_DTO_CIAL]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('I_DTO_CIAL').AsFloat);
  end;
  if Source = '[SUMA_RE]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('S_CUOTA_RE').AsFloat);
  end;
  if Source = '[SUMA_IVA]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('S_CUOTA_IVA').AsFloat);
  end;
  if Source = '[BASE_IMPONIBLE]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('S_BASES').AsFloat);
  end;
  if Source = '[TOTAL_ALBARAN]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('LIQUIDO').AsFloat);
  end;

  if Source = '[MONEDA]' then
  begin
     // Actualizar las máscaras para el albarán actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        Source := 'Moneda: ' + xMonedas.FieldByName('TITULO').AsString;
     end;

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
  end;

  if Source = '[I_TOTALMONSEC]' then
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := FormatFloat(LocalMascaraNSec, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio))
     else
        Source := ' ';
  end;

  if Source = '[TOTAL_MONEDA_SEC]' then
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := 'Total ' + Moneda_Sec + ':'
     else
        Source := ' ';
  end;

  //Portes
  if Source = '[PORTES]' then
  begin
     if (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger);
  end;

  if Source = '[DOBLE_PORTES]' then
  begin
     if (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger);
  end;

  if Source = '[I_PORTES]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_PORTES_CANAL]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  if Source = '[I_DOBLEPORTES]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_DOBLEPORTES_CANAL]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  if Source = ' ' then
     Source := '';
end;

procedure TDMLstAlbProveedor.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));

  QSPProcedencia.Close;
  QSPProcedencia.Open;

  nro_serie := '';
  QNroSerieKri.Close;
  QNroSerieKri.Params.ByName['RIG'].AsInteger := QSPProcedencia.FieldByName('RIG_O').AsInteger;
  if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALP' then
     QNroSerieKri.Params.ByName['LINEA'].AsInteger := QSPProcedencia.FieldByName('LINEA_O').AsInteger
  else
     QNroSerieKri.Params.ByName['LINEA'].AsInteger := -1;
  QNroSerieKri.Open;

  QLoteKri.Close;
  QLoteKri.Params.ByName['RIG'].AsInteger := QSPProcedencia.FieldByName('RIG_O').AsInteger;
  if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALP' then
     QLoteKri.Params.ByName['LINEA'].AsInteger := QSPProcedencia.FieldByName('LINEA_O').AsInteger
  else
     QLoteKri.Params.ByName['LINEA'].AsInteger := -1;
  QLoteKri.Open;
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
  begin
     ric.Assign(QMDetalle.FieldByName('NOTAS'));

     if (not QNroSerieKri.EOF) then
     begin
        if (QNroSerieKRI.FieldByName('NRO_SERIE').AsString <> '') then
           nro_serie := QNroSerieKRI.FieldByName('NRO_SERIE').AsString;
        QNroSerieKri.Next;
     end;
     while (not QNroSerieKri.EOF) do
     begin
        if (QNroSerieKRI.FieldByName('NRO_SERIE').AsString <> '') then
           nro_serie := nro_serie + ' - ' + QNroSerieKRI.FieldByName('NRO_SERIE').AsString;
        QNroSerieKri.Next;
     end;
     if (nro_serie <> '') then
        ric.Insert(0, 'Nro. de Serie : ' + nro_serie);

     while (not QloteKri.EOF) do
     begin
        if (QLoteKri.FieldByName('LOTE').AsString <> '') then
        begin
           ric.Insert(0, Format(_('Lote: %s Caducidad: %s x %s'), [QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString, QLoteKri.FieldByName('COUNT').AsString]));

           if (Length(nro_serie) > 0) then
              nro_serie := nro_serie + #13;
           nro_serie := nro_serie + Format(_('Lote: %s Caducidad: %s x %s'), [QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString, QLoteKri.FieldByName('COUNT').AsString]);
        end;
        QLoteKri.Next;
     end;
  end;
end;

procedure TDMLstAlbProveedor.frUDNotasArtFirst(Sender: TObject);
begin
  j := 0;
end;

procedure TDMLstAlbProveedor.frUDNotasArtNext(Sender: TObject);
begin
  j := j + 1;
end;

procedure TDMLstAlbProveedor.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = j);
end;

procedure TDMLstAlbProveedor.MostrarInformesFiltrados(Modo: byte; Filtro: integer; Serie: string);
var
  str : string;
  i : integer;
  L : TStrings;
begin
  id_s_aux := 0;
  seriegen := Serie;
  filtrogen := filtro;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Open;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
     end;

     if (LeeParametro('ALPNSER001', Serie) = 'S') then
     begin
        L := TStringList.Create;
        try
           First;
           while not EOF do
           begin
              L.Clear;
              LineasNoSerializadas(L, 'ALP', QMCabecera.FieldByName('ID_E').AsInteger);
              if (L.Count > 0) then
                 raise Exception.Create(_('Faltan lineas por serializar') + #13#10 + _('Albaran') + ' ' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '/' + QMCabecera.FieldByName('RIG').AsString + ' ' + #13#10 + L.Text);

              Next;
           end;
        finally
           L.Free;
        end;
     end;

     First;
  end;

  DMListados.Cargar(72, Serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAlbaranes.LoadFromFIB(REntorno.Formato, str);
     frAlbaranes.PrepareReport;
     case Modo of
        0: frAlbaranes.ShowPreparedReport;
        1: frAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxAlbaranes.LoadFromFIB(REntorno.Formato, str);
     frxAlbaranes.PrepareReport;
     case Modo of
        0: frxAlbaranes.ShowPreparedReport;
        1: frxAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstAlbProveedor.UpdateaDocumentos;
var
  ID_S : integer;
begin
  with xUpdateaDocumentos do
  begin
     Close;
     SelectSQL.Text := QMCabecera.SelectSQL.Text;
     Plan.Text := QMCabecera.Plan.Text;
     if (id_s_aux = 0) then
        Params.ByName['SERIE'].AsString := SerieGen
     else
        Params.ByName['ID_E'].AsInteger := ID_S_AUX;
     Open;
     if (id_s_aux = 0) then
        if (FiltroGen = 0) then
        begin
           DMMain.FiltraRO(xUpdateaDocumentos, '11110', False);
           Params.ByName['SERIE'].AsString := seriegen;
           Open;
        end;
     First;
     ID_S := FieldByName('ID_E').AsInteger;
     while not EOF do
     begin
        ModificaDoc(QGen, ID_S, 6, 1);
        Next;
        ID_S := FieldByName('ID_E').AsInteger;
     end;
  end;
end;

procedure TDMLstAlbProveedor.frAlbaranesPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstAlbProveedor.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QSPProcedencia.Open;
  xLotes.Open;
  xNroSerie.Open;
  xArticulos.Open;
  with xArticulosIdioma do
  begin
     Close;
     Params.ByName['IDIOMA'].AsString := xProv.FieldByName('IDIOMA').AsString;
     Open;
  end;
  // Se comenta porque se ha agregado una variable [stock] que solo calcula el stock si es necesario
  // Si aglún cliente necesita la información de este DataSet habrá que parametrizar
  // SQL Original
  {
  SELECT ENTRADAS, SALIDAS, STOCK AS EXISTENCIAS, VALOR_ENTRADAS, VALOR_SALIDAS,
       (VALOR_SALIDAS - VALOR_ENTRADAS) AS VALOR_EXISTENCIAS, STOCK_MINIMO,
       STOCK_MAXIMO, STOCK_VIRTUAL, PEDIDOS_A_PRO, PEDIDOS_D_CLI, RESERVADAS,
       DISPONIBLES, EN_PROCESO_PROD, PMP AS PRECIO_PONDERADO
  FROM A_ART_DAME_STOCK(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, '01/01/3000', 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, '01/01/1900')
  }
  // xStock.Open;
  xProyectosDetalle.Open;
  QMDetalleUE.Open;
end;

procedure TDMLstAlbProveedor.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstAlbProveedor.MostrarListadoMail(id_e: integer; Serie: string; Modo: integer; const Ejercicio: integer);
var
  str : string;
  i{, grupo} : integer;
  L : TStrings;
begin
  L := TStringList.Create;
  try
     if (LeeParametro('ALPNSER001', Serie) = 'S') then
        LineasNoSerializadas(L, 'ALP', DMAlbaranesAProveedor.QMCabecera.FieldByName('ID_E').AsInteger);

     if (L.Count > 0) then
        raise Exception.Create(_('Faltan lineas por serializar') + #13#10 + L.Text)
     else
     begin
        id_s_aux := id_e;
        seriegen := Serie;
        SW := 1;

        with QMCabecera do
        begin
           Close;
           Params.ByName['ID_E'].AsInteger := id_e;
           Open;
        end;

        nombreFich := format('%s_%d-%s-%.5d.pdf', [_('Albaran'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);

        DMListados.CargarMail(72, Serie);

        if (REntorno.TipoListado = 'FRF') then
        begin
           frAlbaranes.LoadFromFIB(REntorno.Formato, str);
           frAlbaranes.PrepareReport;
           case Modo of
              0: frAlbaranes.ShowPreparedReport;
              1: frAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
              2: rutaFich := ExportarPDF(frAlbaranes, nombreFich);
           end;
        end;
        if (REntorno.TipoListado = 'FR3') then
        begin
           frxAlbaranes.LoadFromFIB(REntorno.Formato, str);
           frxAlbaranes.PrepareReport;
           case Modo of
              0: frxAlbaranes.ShowPreparedReport;
              1: frxAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
              2: rutaFich := ExportarPDF(frxAlbaranes, nombreFich);
           end;
        end;

        if (REntorno.TipoListado = 'HYR') then
        begin
           HYReport.LoadFromFIB(REntorno.Formato, str);
           HYReport.Prepare;
           case Modo of
              0: HYReport.Preview;
              1: for i := 1 to REntorno.Copias do
                    HYReport.Print(REntorno.NombreMatricial);
           end;
        end
        else
        if ((REntorno.TipoListado <> 'FRF') and (REntorno.TipoListado <> 'FR3') and (modo = 2)) then
        begin
           MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 + 'El listado debe ser del tipo FRF/FR3.'),
              mtWarning, [mbOK], 0);
           raise Exception.Create('');
        end;

        DMListados.LimpiaEntorno;
     end;
  finally
     L.Free;
  end;
end;

procedure TDMLstAlbProveedor.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProv.Open;
  xDirProv.Open;
  xNotasProv.Open;
  xDatosIVA.Open;
  xProyectos.Open;
  QMDetalle.Open;

  if Param_MODREST017 and (not QMGrupoTalla.Active) then
     QMGrupoTalla.Open;
end;

procedure TDMLstAlbProveedor.frxAlbaranesBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('[MascaraNSec]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraNSec;
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
           if Pos('[NotasArt]', Memo[0]) > 0 then
           begin
              Memo[0] := ric.Strings[j];
           end;
           if Pos('CANTIDADES', Memo[0]) > 0 then
           begin
              SW := 1;
           end;
           if Pos('[Notas]', Memo[0]) > 0 then
           begin
              if QMCabecera.FieldByName('NOTAS').Value = '' then
              begin
                 Visible := False;
                 Parent.Height := 0;
              end
              else
              begin
                 if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
                    Parent.Height := 0;
              end;
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

procedure TDMLstAlbProveedor.frxAlbaranesGetValue(const VarName: string; var Value: variant);
begin
  frAlbaranesGetValue(VarName, Value);
end;

procedure TDMLstAlbProveedor.frxAlbaranesPrintReport(Sender: TObject);
begin
  UpdateaDocumentos;
end;

procedure TDMLstAlbProveedor.frAlbaranesUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
var
  Idioma : string;
  Grupo : integer;
  Parser : TfrParser;
  Bandera : string;
begin
  if (Name = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Parser.Calc(p1);
     Idioma := xProv.FieldByName('IDIOMA').AsString;
     // Bandera = D el memo está en el pie de pagina y ha de cojer los valores de la doble cabecera
     Bandera := Parser.Calc(p2);
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Val := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstAlbProveedor.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xProv.Close;
  xDirProv.Close;
  xNotasProv.Close;
  xDatosIVA.Close;
  QMGrupoTalla.Close;
end;

procedure TDMLstAlbProveedor.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xLotes.Close;
  xNroSerie.Close;
  xArticulos.Close;
  xArticulosIdioma.Close;
  xProyectosDetalle.Close;
  QMDetalleUE.Close;
end;

function TDMLstAlbProveedor.frxAlbaranesUserFunction(const MethodName: string; var Params: variant): variant;
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

procedure TDMLstAlbProveedor.QMGrupoTallaAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
  QMDetalleTallas.Open;
end;

procedure TDMLstAlbProveedor.QMGrupoTallaBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
  QMDetalleTallas.Close;
end;

procedure TDMLstAlbProveedor.QMDetalleTallasAfterOpen(DataSet: TDataSet);
begin
  QMArticuloTallas.Open;
end;

procedure TDMLstAlbProveedor.QMDetalleTallasBeforeClose(DataSet: TDataSet);
begin
  QMArticuloTallas.Close;
end;

procedure TDMLstAlbProveedor.DobleCabeceraAfterScroll(DataSet: TDataSet);
begin
  xDobleIva.Close;
  xDobleIva.Open;
end;

procedure TDMLstAlbProveedor.LineasNoSerializadas(L: TStrings; Tipo: string; ID_E: integer);
var
  DS : TFIBDataSet;
begin
  /// Comprueba que no haya lineas sin los nros de serie suficientes asignados.

  TStringList(L).Clear;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT D.LINEA, D.ARTICULO, D.TITULO, D.UNIDADES, ');
           SelectSQL.Add('        (SELECT COUNT(*) ');
           SelectSQL.Add('         FROM GES_DETALLES_SERIALIZACION ');
           SelectSQL.Add('         WHERE ');
           SelectSQL.Add('         TIPO = D.TIPO AND ');
           SelectSQL.Add('         ID_DETALLE_DOC = D.ID_DETALLES_E) UNIDADES_SERIALIZADAS ');
           SelectSQL.Add(' FROM GES_DETALLES_E D ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' A.SERIALIZADO = 1 AND ');
           SelectSQL.Add(' TIPO = :TIPO AND ');
           SelectSQL.Add(' ID_E = :ID_E AND ');
           SelectSQL.Add(' ABS(D.UNIDADES) <> (SELECT COUNT(*) ');
           SelectSQL.Add('                     FROM GES_DETALLES_SERIALIZACION ');
           SelectSQL.Add('                     WHERE ');
           SelectSQL.Add('                     EMPRESA = D.EMPRESA AND ');
           SelectSQL.Add('                     EJERCICIO = D.EJERCICIO AND ');
           SelectSQL.Add('                     CANAL = D.CANAL AND ');
           SelectSQL.Add('                     SERIE = D.SERIE AND ');
           SelectSQL.Add('                     TIPO = D.TIPO AND ');
           SelectSQL.Add('                     RIG = D.RIG AND ');
           SelectSQL.Add('                     LINEA = D.LINEA) ');
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['ID_E'].AsInteger := ID_E;
           Open;
           while not EOF do
           begin
              TStringList(L).Add(format(_('Linea %d (%s) - Uds.=%d - Serializadas %d.'), [FieldByName('LINEA').AsInteger, FieldByName('ARTICULO').AsString, Trunc(FieldByName('UNIDADES').AsFloat), FieldByName('UNIDADES_SERIALIZADAS').AsInteger]));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

end.
